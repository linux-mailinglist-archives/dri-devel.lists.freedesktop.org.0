Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6D8A2F4BA
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 18:10:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DA4610E388;
	Mon, 10 Feb 2025 17:10:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="osvIq9nj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CE2E10E388
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 17:10:17 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51AGu5Ev006113
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 17:10:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 E5npZqgjaYKWVPP6BTCK7WRGiQx27IIoDxlSefcsZPc=; b=osvIq9njvLAa6Vul
 isJzR6bJ/p3pCBSJU8Q0eB1G5ucn3eQy9pnes1xnVdqUgpgomlC62C7W89REH/g9
 I3kAqUb08X008J0I6G0FWwQ+kgffnQ9L+x8bZ85m9r1wALOv40MSEPXNLtAz1ByV
 D7PIykkMIjP4DRhTO16jFsTtqG57BN5nu+ELunUNcNIzkO+6ZlVY8rPQTSylSnOQ
 4iEMw2WKlLJGdgANOCutpeVV2DoMFfxFSdrrjxl8q6vOT8MWyxjUm4QZsEcTaa3U
 xom7inBcFTA0tv22snV8GTGKuYsSXDgZl2SHVK8j40S6wabFyOvo5HIFfJMW+8Ql
 pynxnw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qe5msd9q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 17:10:16 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6e18596ce32so11645456d6.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 09:10:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739207415; x=1739812215;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E5npZqgjaYKWVPP6BTCK7WRGiQx27IIoDxlSefcsZPc=;
 b=FVJt5KRKdeO5zZlaDgk2cTkv3B4uoVklNQTHD0aWtfOgt25KldghD6/pcw9xr6+nq3
 66BYNJerJ3tPq/FtaEsIMwyjw0xtbUwCZlp2JoaBXXE9ndqxt7UvC0NZn8kv1n0vsEmz
 qTLUCCHKPtUOPTD33YfCH7stGOYg+XFVtWyoG2UlVzInyIRk2rSsB91Yq/rvCTHi/Hki
 rQ4Hum4O83VouBAIZqJIpu9YBQ8spqGAa2tMuoNEpxV7/abV+HevjfEDAE/k4b82QIk6
 LHHUMN/Vra2vQd2G/s/f//eBLZqOrPhLsbfkf0O6aNRJsm0pS+uEGWeymMbfyDfpIYwO
 bvZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXU7vdjZxx5psV4RW85pMF3g5OLBxw5VQytoMTZqCktV8D+u4GD4qBd6nL0fsMTSOm6WaGKO7A6zbw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YySfF+QebdDkMjyIHdIOPwHsqrerlWU1/O5etSSa/iduRdaN7hg
 j16p/TBm0VUO0Xd8pYcdsgdSVMy5xqPimgz56Von62h4/GgpjshZKsO8l6tqH8DfjhEwWQ1/LWE
 YpRN5bYtiJSxEO8cftB8XlHGe5Oe8rcUxPJHtls0CjmVCXWiHl4JSQqxNPUjOFBNY+po=
X-Gm-Gg: ASbGncszzdrCp5xojVfB4MlHtpDWthXh8qpt9SoqluqyLHPs3G9jxDFRSu4baF/s3vj
 iuaqUwAgkBJcd5Wn7arBvu6qOIdRL9vG+bSeVvbiWDJsxVnv2V1M4WgHYe/WEMjQukWLOdptbiQ
 Xsq9fFkC2F/Un7FC6Coi8T/nWRnzHoxRWh/uB/JNvjpaKtN3aV1PxoxNx8wpsnLQUTLXfLuHO1t
 PN3rDBO2+wyl9Hl/Rdnj4nsJMtIbNgWBPD5uTnu+oMrxZrS8I4LFbAdVQF2Vo2cnj9BUspEwdVX
 qjQMSsHS9Cmn/Z/Ao4WFPwDxF97STkxyMePy0kfkP9Q7sgWnT2l/Eq9ZEpM=
X-Received: by 2002:a05:622a:134a:b0:471:99c5:7fe3 with SMTP id
 d75a77b69052e-47199c584f5mr11944461cf.13.1739207415391; 
 Mon, 10 Feb 2025 09:10:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEWCVn+56GmgcEp+f7iKQYBi/AP1TMSZ84eTKF1sfusy7qyasfzqQxSq++Q7ti18cPyRITfPA==
X-Received: by 2002:a05:622a:134a:b0:471:99c5:7fe3 with SMTP id
 d75a77b69052e-47199c584f5mr11944091cf.13.1739207414895; 
 Mon, 10 Feb 2025 09:10:14 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5de60497c99sm4926026a12.4.2025.02.10.09.10.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 09:10:14 -0800 (PST)
Message-ID: <bcba3d38-525e-43d8-936f-2ddc95d0cceb@oss.qualcomm.com>
Date: Mon, 10 Feb 2025 18:10:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/msm/dsi: Allow all bpc values
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Danila Tikhonov <danila@jiaxyga.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org,
 sean@poorly.run, jonathan@marek.ca, jun.nie@linaro.org,
 fekz115@gmail.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux@mainlining.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20250203181436.87785-1-danila@jiaxyga.com>
 <20250203181436.87785-4-danila@jiaxyga.com>
 <rnuv4dieiy6s6c5s33hff7ntr6hkneemsq5qzk3u4ug2abwisd@6ahmijlayhhr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <rnuv4dieiy6s6c5s33hff7ntr6hkneemsq5qzk3u4ug2abwisd@6ahmijlayhhr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Z77QOXgT_Di1CjTZJrytbwXTLYTI3_De
X-Proofpoint-ORIG-GUID: Z77QOXgT_Di1CjTZJrytbwXTLYTI3_De
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_09,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502100140
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

On 8.02.2025 11:09 PM, Marijn Suijten wrote:
> On 2025-02-03 21:14:26, Danila Tikhonov wrote:
>> From: Eugene Lepshy <fekz115@gmail.com>
>>
>> DRM DSC helper has parameters for various bpc values ​​other than 8:
> 
> Weird zero-width \u200b spaces here between "values" and "other", please delete
> those.
> 
>> (8/10/12/14/16).
>>
>> Remove this guard.
>>
>> Signed-off-by: Eugene Lepshy <fekz115@gmail.com>
>> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> 
> Should this patch elaborate that those "DRM DSC helper" don't have any
> additional guarding for the values you mention either, i.e. passing 9 or 11 or
>> 16 don't seem to be checked anywhere else either?
> 
> And your title might have space to spell out "Bits Per Component" entirely.
> 
>> ---
>>  drivers/gpu/drm/msm/dsi/dsi_host.c | 7 +------
>>  1 file changed, 1 insertion(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> index 007311c21fda..d182af7bbb81 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> @@ -1767,11 +1767,6 @@ static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc
>>  		return -EINVAL;
>>  	}
>>  
>> -	if (dsc->bits_per_component != 8) {
>> -		DRM_DEV_ERROR(&msm_host->pdev->dev, "DSI does not support bits_per_component != 8 yet\n");
>> -		return -EOPNOTSUPP;
>> -	}
>> -
>>  	dsc->simple_422 = 0;
>>  	dsc->convert_rgb = 1;
>>  	dsc->vbr_enable = 0;
> 
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

It seems like the lowest bit should be set iff the input is 10bpc, the
current situation where our '8' bleeds into the following (correctly named
fields) is bad.

Konrad
