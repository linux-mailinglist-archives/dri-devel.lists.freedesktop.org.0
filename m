Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A587F555D
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 01:34:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E70E10E004;
	Thu, 23 Nov 2023 00:34:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1580 seconds by postgrey-1.36 at gabe;
 Wed, 22 Nov 2023 21:31:16 UTC
Received: from fallback21.i.mail.ru (fallback21.i.mail.ru [79.137.243.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0461810E0E3;
 Wed, 22 Nov 2023 21:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com;
 s=mailru; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=jblfQLaXgN57NJdQHsW9Nwoj6gP8mAKnFa+pJM3/qeE=; 
 t=1700688676;x=1700778676; 
 b=I4ymifgTdKoyey6N62bi8ryMAuqmVaTzTSm/CT0aXVtNg2kl0vGN77/whsC/LkaAjtDgTqkHrkf/xgXaoNPSuhT3sDvCP3ej4x8zoWOxZNnzZOSA7xLnuIQZgKfaCPPH9RTZuHkGwwC6Fai7QAaoE0O+qclC0K0HgN8jtJ/bkt4=;
Received: from [10.12.4.19] (port=52030 helo=smtp43.i.mail.ru)
 by fallback21.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
 id 1r5uP0-000OZY-L6; Thu, 23 Nov 2023 00:04:54 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
 ; s=mailru;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To
 :Cc:Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive:X-Cloud-Ids:Disposition-Notification-To;
 bh=jblfQLaXgN57NJdQHsW9Nwoj6gP8mAKnFa+pJM3/qeE=; t=1700687094; x=1700777094; 
 b=hqrEwHolpOoPo/dkW79x+56p4PBtQVazew1OUW6OIPVAUslPCcLfnRyQNaUby3XuN/6iSF31KjW
 WptItnjSM8BP28fjKf8KhWH8htAB/PJ3fcEJGHbgNj53UYhYfp/jdPasKsLtiqlFPuVoRaMQHDSiv
 PEyUiyiUWi7zfO3MY2U=;
Received: by smtp43.i.mail.ru with esmtpa (envelope-from <danila@jiaxyga.com>)
 id 1r5uOc-008zQK-2j; Thu, 23 Nov 2023 00:04:31 +0300
Message-ID: <99ffd03f-b888-4222-939b-603c10f2307b@jiaxyga.com>
Date: Thu, 23 Nov 2023 00:03:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] drm/msm/adreno: Add support for SM7150 SoC machine
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, sean@poorly.run, marijn.suijten@somainline.org,
 airlied@gmail.com, daniel@ffwll.ch, johan+linaro@kernel.org,
 andersson@kernel.org, Akhil P Oommen <quic_akhilpo@quicinc.com>
References: <20230926174243.161422-1-danila@jiaxyga.com>
 <20230926174243.161422-2-danila@jiaxyga.com>
 <42a1d0ab-4e8d-461d-bb2c-977a793e52b2@linaro.org>
 <1695755445.902336096@f165.i.mail.ru>
 <84e63b82-4fef-416b-8dbe-3838ad788824@linaro.org>
 <c684d0a7-3336-48e3-9d2b-5c92f9132550@linaro.org>
 <f76637f9-8242-4258-932e-b879145a5cfd@linaro.org>
From: Danila Tikhonov <danila@jiaxyga.com>
In-Reply-To: <f76637f9-8242-4258-932e-b879145a5cfd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD9FEA8E122FE2215F5F9A7F26A9461D4801668790ACF3513421867C24CE74E72BB5FE18E9CBFBE7C07241E1071E2B2D02006023B87ED3BEECD951DA7CF553926D1ACCB5262BB601CA2
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE701173C01F417A2A6EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637204D59D994DFFAD78638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8A85988B41A48817BB4090DA2F2DB256A117882F4460429724CE54428C33FAD305F5C1EE8F4F765FC8C7ADC89C2F0B2A5A471835C12D1D9774AD6D5ED66289B52BA9C0B312567BB23117882F446042972877693876707352033AC447995A7AD18E5D25F19253116ADD2E47CDBA5A96583BA9C0B312567BB2376E601842F6C81A19E625A9149C048EE140C956E756FBB7ABDB03A3F2A65D472D8FC6C240DEA76429C9F4D5AE37F343AA9539A8B242431040A6AB1C7CE11FEE3E753FA5741D1AD0203F1AB874ED89028C4224003CC836476E2F48590F00D11D6E2021AF6380DFAD1A18204E546F3947C1D471462564A2E192E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89FD2A95C73FD1EFF45156CCFE7AF13BCA4B5C8C57E37DE458BEDA766A37F9254B7
X-C1DE0DAB: 0D63561A33F958A558E0945AD6A1CE49C7D1B61F0E22AB3EDCD281A92BBA7DA0F87CCE6106E1FC07E67D4AC08A07B9B04E7D9683544204AFCB5012B2E24CD356
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFD3107C73A4316D00DE5271C7D9B56E81DE88995E47143240567AF9FE9C99B2B0963129249CAA680A88AD3775A6B0C83443447918D0247561A0A6CFF861C8033909F6894F2AE002664C41F94D744909CE4BCAC77546666B612CC0CD5AA9A1B9887EE09F5AAA95A50543082AE146A756F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojGZhPsaRkbbk3fOmNk7fScw==
X-Mailru-Sender: 9EB879F2C80682A09F26F806C73949813146EB258E4CBD74EB5277BAE3EB1823E9438CDA4132709F643683D8C0F3ED1CA3C71A376745D86BBE86167304C7680C3980CE5AAA35C7CD60F22E8815EDE5EAEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B4C412E14AEF4742E1D915F33BAFA678CCA9926E5A99BFA133049FFFDB7839CE9E432D8BDF4FB0405F661F4097165CE4A672D8DF364A9363439C866DA6A8CBEA58
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5xhPKz0ZEsZ5k6NOOPWz5QAiZSCXKGQRq3/7KxbCLSB2ESzQkaOXqCBFZPLWFrEGlV1shfWe2EVcxl5toh0c/aCGOghz/frdRhzMe95NxDFdjNtV51DQSTDsvBazPo9aTw==
X-Mailru-MI: C000000000000800
X-Mras: Ok
X-Mailman-Approved-At: Thu, 23 Nov 2023 00:34:52 +0000
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

sc7180/sm7125 (atoll) expects speedbins from atoll.dtsi:
And has a parameter: /delete-property/ qcom,gpu-speed-bin;
107 for 504Mhz max freq, pwrlevel 4
130 for 610Mhz max freq, pwrlevel 3
159 for 750Mhz max freq, pwrlevel 5
169 for 800Mhz max freq, pwrlevel 2
174 for 825Mhz max freq, pwrlevel 1 (Downstream says 172, but thats 
probably typo)
For rest of the speed bins, speed-bin value is calulated as
FMAX/4.8MHz + 2 round up to zero decimal places.

sm7150 (sdmmagpie) expects speedbins from sdmmagpie-gpu.dtsi:
128 for 610Mhz max freq, pwrlevel 3
146 for 700Mhz max freq, pwrlevel 2
167 for 800Mhz max freq, pwrlevel 4
172 for 504Mhz max freq, pwrlevel 1
For rest of the speed bins, speed-bin value is calulated as
FMAX/4.8 MHz round up to zero decimal places.

Creating a new entry does not make much sense.
I can suggest expanding the standard entry:

.speedbins = ADRENO_SPEEDBINS(
     { 0, 0 },
     /* sc7180/sm7125 */
     { 107, 3 },
     { 130, 4 },
     { 159, 5 },
     { 168, 1 }, has already
     { 174, 2 }, has already
     /* sm7150 */
     { 128, 1 },
     { 146, 2 },
     { 167, 3 },
     { 172, 4 }, ),

All the best,
Danila

On 11/22/23 23:28, Konrad Dybcio wrote:
>
>
> On 10/16/23 16:32, Dmitry Baryshkov wrote:
>> On 26/09/2023 23:03, Konrad Dybcio wrote:
>>> On 26.09.2023 21:10, Danila Tikhonov wrote:
>>>>
>>>> I think you mean by name downstream dt - sdmmagpie-gpu.dtsi
>>>>
>>>> You can see the forked version of the mainline here:
>>>> https://github.com/sm7150-mainline/linux/blob/next/arch/arm64/boot/dts/qcom/sm7150.dtsi 
>>>>
>>>>
>>>> All fdt that we got here, if it is useful for you:
>>>> https://github.com/sm7150-mainline/downstream-fdt
>>>>
>>>> Best wishes, Danila
>>> Taking a look at downstream, atoll.dtsi (SC7180) includes
>>> sdmmagpie-gpu.dtsi.
>>>
>>> Bottom line is, they share the speed bins, so it should be
>>> fine to just extend the existing entry.
>>
>> But then atoll.dtsi rewrites speed bins and pwrlevel bins. So they 
>> are not shared.
> +Akhil
>
> could you please check internally?
>
> Konrad

