Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C35E9A313BA
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 19:07:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0D7910E740;
	Tue, 11 Feb 2025 18:07:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="wnFFLz2l";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="iH8+Ns8D";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="wke+i5Yb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fallback18.i.mail.ru (fallback18.i.mail.ru [79.137.243.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EFE910E73E;
 Tue, 11 Feb 2025 18:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com;
 s=mailru; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=GOlY4F8lpo+TpRzMJN+a1bkfACVX6+oOge20VAskDeM=; 
 t=1739297222;x=1739387222; 
 b=wnFFLz2lxZ21Y9IT8HKc2EKVvFlDcN2EZlh27zkxphWQsKULKQ3tlRUXyr3r3/uzxJWTRWr/TM1ZnWn5EeQAMHE5gphzmk7n+LqsmTs3DDY5RQnm4OytMsxg3NMwSeG/+UzHcp+3K7tdc/mT/mCsw8qI1mjvI5pV+bK3zOOs7RY=;
Received: from [10.113.174.102] (port=57642 helo=send78.i.mail.ru)
 by fallback18.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
 id 1thuey-00EbAp-84; Tue, 11 Feb 2025 21:07:00 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
 ; s=mailru;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive:X-Cloud-Ids;
 bh=GOlY4F8lpo+TpRzMJN+a1bkfACVX6+oOge20VAskDeM=; t=1739297220; x=1739387220; 
 b=iH8+Ns8DFBhg+UknYPXiRM7vvUMhx1Kfk19+9y9X1eRCewfPrDtNZyR4aPuFlsPI7JMeagDS+kg
 boiFqeQnSFZb/kvWCvUcqzx+sEmdge1dBUOguM1AVxTMRWBPF/LXLLpLBzUqyIs0hoRbgIg9GLngR
 vH/PkJaVH8DoUqgFJLg=;
Received: from [10.113.97.165] (port=60280 helo=send127.i.mail.ru)
 by exim-fallback-69886cc8d-gsgjn with esmtp (envelope-from
 <danila@jiaxyga.com>)
 id 1thuep-00000000BbH-1cWr; Tue, 11 Feb 2025 21:06:51 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
 ; s=mailru;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To
 :Cc:Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive:X-Cloud-Ids:Disposition-Notification-To;
 bh=GOlY4F8lpo+TpRzMJN+a1bkfACVX6+oOge20VAskDeM=; t=1739297211; x=1739387211; 
 b=wke+i5Yb9DU6BJHbkpd9uMw0RcfE0z9+7ZlChSIxF2d1eOrhsJjvicvJpiQLnXPb2ettuRMEHIB
 crtHTuqAcyOTKd+3ltMJ+qQUUa258UJyoBEmVCLGjyrpR3LA4krB/pLeK9KdzUjel7pMZzoRMu2Xr
 Q431lYEVWpJulbmxAAY=;
Received: by exim-smtp-79fd7578cb-7v4hj with esmtpa (envelope-from
 <danila@jiaxyga.com>)
 id 1thueW-00000000IrZ-3YE8; Tue, 11 Feb 2025 21:06:33 +0300
Message-ID: <d7aa140d-ea0d-4288-8e31-29aab9a49077@jiaxyga.com>
Date: Tue, 11 Feb 2025 21:06:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/msm/dsi: Allow all bpc values
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 robdclark@gmail.com, quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org,
 sean@poorly.run, jonathan@marek.ca, jun.nie@linaro.org, fekz115@gmail.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux@mainlining.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20250203181436.87785-1-danila@jiaxyga.com>
 <20250203181436.87785-4-danila@jiaxyga.com>
 <rnuv4dieiy6s6c5s33hff7ntr6hkneemsq5qzk3u4ug2abwisd@6ahmijlayhhr>
Content-Language: en-US
From: Danila Tikhonov <danila@jiaxyga.com>
In-Reply-To: <rnuv4dieiy6s6c5s33hff7ntr6hkneemsq5qzk3u4ug2abwisd@6ahmijlayhhr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD96946CDE51E80C51AD12667F9371EF4D01C0AF24C03CB1A09182A05F5380850405115B8D3FEFBD37D3DE06ABAFEAF6705F8F7DABAC8F41C254F212B46BA5BA54AD37E07BDF5347EEA
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7A179494B5629353BEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006370D3D68FCEFFDD9EA8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8C87E8B9AC694FCB02EE813EE8383639A8C4D35B05A705896CC7F00164DA146DAFE8445B8C89999728AA50765F790063793270F7220657A0A389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8FA486DC37A503D0BF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947C4E7D9683544204AF302FCEF25BFAB3454AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C371330ADC0232E4BBBA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CF3D321E7403792E342EB15956EA79C166A417C69337E82CC275ECD9A6C639B01B78DA827A17800CE71F4E386938175FB9731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A58C921C112168955F5002B1117B3ED696DC67B5828A8B775D957033528158102E823CB91A9FED034534781492E4B8EEADE3800B164E348C91BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADBF74143AD284FC7177DD89D51EBB7742DC8270968E61249B1004E42C50DC4CA955A7F0CF078B5EC49A30900B95165D340DAE5B306C240CF52A4A749E3CE031B824E66CC5080D15554FAE63F7707A68C42810D1D3F512E40F1D7E09C32AA3244C31DCC07445F678D777DD89D51EBB77423C27BC6E47C6A235EA455F16B58544A2381B1D8FD003179A5DA084F8E80FEBD322CFFF16B4474ECB4573B60270F1EB7C214C2BC1176D5C25
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj4p5EDZXZmhELJ0Bq/u6sgA==
X-Mailru-Sender: 9EB879F2C80682A0D0AE6A344B45275F4BF7E89B5CACC366117A099264967948CDF0127AC1F2F4914C3BA25B859F83112C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B40910A8BADE0CD7832638B662392E9B095D516DDB7B231B2868F3CF0E9FE49B6945DE3909ADCA5804A61C88484FD4ED652B506A067BAB3CD4226B82A55AF6BE472B6B6442568FA380
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5+wYjsrrSY/u6NqYXWMR0/V85CnFjCYTu9APdQH0PvpnP5qz8aO2mjTJzjHGC4ogvVuzB3zfVUBtENeZ6b5av1fnCBE34JUDkWdM6QxE+Ga5d8voMtmXfSoSirc0Sa9/unvnsmttD4RG
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B40910A8BADE0CD783ED10998927330B56A4A45EE5564821D068F3CF0E9FE49B6945DE3909ADCA58042ACF2E6D713B8E5D483E6E4D9F4F04456A930ED086EA98B2
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5+wYjsrrSY/u6NqYXWMR0/V85CnFjCYTu9APdQH0PvpnP5qz8aO2mjTJzjHGC4ogvVuzB3zfVUBtENeZ6b5av1fnCBE34JUDkWdM6QxE+Ga5d8voMtmXfSocc/adLt2YMrJdENjvzQK2
X-Mailru-MI: 20000000000000800
X-Mras: Ok
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/9/25 01:09, Marijn Suijten wrote:
> On 2025-02-03 21:14:26, Danila Tikhonov wrote:
>> From: Eugene Lepshy <fekz115@gmail.com>
>>
>> DRM DSC helper has parameters for various bpc values ​​other than 8:
> Weird zero-width \u200b spaces here between "values" and "other", please delete
> those.
Thanks, I will fix it in the next version.
>> (8/10/12/14/16).
>>
>> Remove this guard.
>>
>> Signed-off-by: Eugene Lepshy <fekz115@gmail.com>
>> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> Should this patch elaborate that those "DRM DSC helper" don't have any
> additional guarding for the values you mention either, i.e. passing 9 or 11 or
>> 16 don't seem to be checked anywhere else either?
There are no other bpc checks, you are right. But to be honest I don't
really see any sense in this. Anyway, if you still want us to leave the
current guard and just extend it with new values ​​(for example via
switch case) - let me know.
> And your title might have space to spell out "Bits Per Component" entirely.
I'll fix that too.
>> ---
>>   drivers/gpu/drm/msm/dsi/dsi_host.c | 7 +------
>>   1 file changed, 1 insertion(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> index 007311c21fda..d182af7bbb81 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> @@ -1767,11 +1767,6 @@ static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc
>>   		return -EINVAL;
>>   	}
>>   
>> -	if (dsc->bits_per_component != 8) {
>> -		DRM_DEV_ERROR(&msm_host->pdev->dev, "DSI does not support bits_per_component != 8 yet\n");
>> -		return -EOPNOTSUPP;
>> -	}
>> -
>>   	dsc->simple_422 = 0;
>>   	dsc->convert_rgb = 1;
>>   	dsc->vbr_enable = 0;
> This seems supicous on the dpu1 side, in the original DSC 1.1 (not 1.2) block in
> dpu_hw_dsc_config(), which has:
>
> 	data |= (dsc->line_buf_depth << 3);
> 	data |= (dsc->simple_422 << 2);
> 	data |= (dsc->convert_rgb << 1);
> 	data |= dsc->bits_per_component;
>
> The original value of `8` would overlap with the lowest bit of line_buf_depth
> (4th bit in `data`).  Now, the 2nd bit which will take the value from
> convert_rgb, which is already set to 1 above, will overlap with the 2nd bit in
> your new bpc value of 10.
>
> Can you double-check that this code in DPU1 is actually valid?  I assume you
> have tested this panel at least and it is working (worthy mention in the cover
> letter?), this just seems like yet another mistake in the original bindings
> (though the register always had a matching value with downstream on 8 BPC panels
> for me).

Of course I have tested the panel and it works, I just thought it would
be obvious. We also have tested sm7150-xiaomi-courbet, sm8450-xiaomi-cupid
and sm8475-nothing-pong, which already have bpp = bpc = 10 panels and
with some hack it also work without any changes to the DRM.

>> @@ -1779,7 +1774,7 @@ static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc
>>   	drm_dsc_set_const_params(dsc);
>>   	drm_dsc_set_rc_buf_thresh(dsc);
>>   
>> -	/* handle only bpp = bpc = 8, pre-SCR panels */
>> +	/* handle only pre-SCR panels */
>>   	ret = drm_dsc_setup_rc_params(dsc, DRM_DSC_1_1_PRE_SCR);
> Good catch - this comment sounds like it's documenting a limitation of
> this helper function, but the function does not have such limitations...
> rc_parameters_pre_scr has values for all these combinations.
Maybe we should remove this comment entirely?

Regards,
Danila
> - Marijn
>
>>   	if (ret) {
>>   		DRM_DEV_ERROR(&msm_host->pdev->dev, "could not find DSC RC parameters\n");
>> -- 
>> 2.48.1
>>
