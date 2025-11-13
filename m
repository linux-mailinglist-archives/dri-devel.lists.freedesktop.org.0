Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5493DC59E2D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 21:00:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EB1410E93C;
	Thu, 13 Nov 2025 20:00:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fuAxD8wc";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NVFcZYMs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D9A410E93C
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 20:00:14 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ADF2x6w3801092
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 20:00:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 OJ7w+mpX/9CJl+Orva8v96dQySUzco1O64PcH/xD3KI=; b=fuAxD8wcsAEwL5NV
 bh1wPbEpv+tKK62AaSEWu70KnScWrWuMyJUhri/6SUyYJmD2GISZk7hmQjrkZAIW
 bKcoENtov0aleRgOVMYAQ4JDtwgqewpHJ0XSY1NSKTu4HAPlNyjVCtjjguMSFGgx
 Dl+3aF/RDg6aysVhZW1VLTpk3CzGeybZYPnOit2k/Jd9mzdf84wifHdfltosinqb
 N8O4SuZaBpnlNEAa0SXtAkWRdqN9Ks65fzTVcjUmlyJRTdEDLF1yGAMAjWN+MnJ8
 YN+RVQZwBxSKx+YAXAlZcWkeG2oPDHRXnvJ05PBji5dMGfCYFjl1qjuG6Qx18FiK
 K9/mRQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adaamafx6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 20:00:13 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-7a26485fc5dso1208639b3a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 12:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763064012; x=1763668812;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OJ7w+mpX/9CJl+Orva8v96dQySUzco1O64PcH/xD3KI=;
 b=NVFcZYMsRxhW6yS3qLqWV3Zgd4H8cmL+C6Onv6M/j70u5zKL5k0iJovkK5j5vjMd51
 IUXbDhL+oRXIkNj/vbr7KTCn84UGOdkM/LjBh791a4iBFt0Op08KlyB0ieyh9PRuSKHI
 XmeGJi+Xi6W/18lPVbX7Lk0rrzZtk0JVcuVXwwRyCX6nDMaVrfha+nYM3ipfp//0mFkF
 FKoJTuRQGa2kbp9cEs2vhAR3M9q0CCu2/00LxR4VXzfJPItkdvTFjdDSUegHby9O2GSJ
 zE0I0XSWCXAwkCySsWiLw1sUKaFmo/cyD3etg2EOBnoMOGKaXHwFpVMr0MrlAVQQKo/M
 YKYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763064012; x=1763668812;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OJ7w+mpX/9CJl+Orva8v96dQySUzco1O64PcH/xD3KI=;
 b=qq/+7IRRuuMXUlVGYZYCV3B4oHh54pKG6oenUzVcwzb1MKR8rnvCXaKTM9wO/WoI+R
 O2QUTkHl4rGAKHDkIGra1UesbMb9Su++COKxsnDZIRUk41FyGmgMsuEDn/6NO4GrMwTY
 vlL842TRUwkONPVsC1vcOreQ61DWqzAwHBB/ThAOuqlK/jIPIT1JNWCn+/LErwLIw7hq
 t0eEvSyOGUAoUOcjUVf6rZokY0BG4F3UVZJlvO3oXMyy13zZPMCdV9rd5BNA1690EniV
 iIMHXM3y0o6L94ReGALf9lcNsW6FLSidAZj8DEh1OqT2+jyfd+7TnI1QTMO+U2+kHzqu
 pBoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdMcBKi+9u3QZtQ0zcZ9qzXQj0e5DY7MnZ2hgUDdsYHN2jN5Upns0GqUK5YuHv9k6lRnrIZjO/vI8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwilwN8up2h3TCQGO9vdnn4/BzuMDkX/xBqutN4R9mZFAjx9vUN
 ei0hLyUTnEInJQsrqncRvGoEl29fEr5DgoQxLVfXxloB+yBi+W7Tck7+yo2RCVTTWihC9t3R6Ci
 rFkdZWMJKcXKVQnIQTFRgwkFWD8K6joaq8xfnbxtPY/6cJ/jYY1xtEDd1Q3CtIQYKfw7N4eM=
X-Gm-Gg: ASbGncuGJ59LqvtGnCgVdFe7YgKAZvPASIQEgHtiW38vekHVdCsibv3KWV3h/O0/YVq
 VbnR6oFqjlXM3JsuGQ+tSnW+6NrF9mALnx9u0GvSdjKNCWTS58mnUzNowytZRDibzGW0bA4anjD
 WRS2NMy0H4GNy5wM0rkK/HRT0K7XSvHHMXc5tSB60CwxCAqGM89YGN9vyOOW7qchVYkkXsJs/93
 hcwWs8vfqigpOPM+yjTvhvPfBVZT4oY6i/hOkm/u1Kc20NusQ7FV7V5KEu0wO0BLmSs1L5uXmtm
 F1Obe7gu4S24gYXulMmHQ5igZzPu9DFXbkzCxEcsRSHz8DOAM31iq+gB6J1cNTiV5qNjoNmO02o
 LxLSm/4iyp8uti5csbqvNKg==
X-Received: by 2002:a05:6a20:5483:b0:353:1edd:f7a with SMTP id
 adf61e73a8af0-35ba30634a3mr896593637.59.1763064011779; 
 Thu, 13 Nov 2025 12:00:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHZ3uM6rWYFMlAKzZmNJ84R9H/A3/jUV3dWp4GW6Y6VWrqLNpi1YOXm3417OaJPss+ncsmlsA==
X-Received: by 2002:a05:6a20:5483:b0:353:1edd:f7a with SMTP id
 adf61e73a8af0-35ba30634a3mr896525637.59.1763064011030; 
 Thu, 13 Nov 2025 12:00:11 -0800 (PST)
Received: from [10.204.104.20] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-bc37507fc7bsm2929570a12.23.2025.11.13.12.00.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 12:00:10 -0800 (PST)
Message-ID: <fcd703e5-d483-4369-8149-a25cc733bc2e@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 01:30:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/21] drm/msm/a8xx: Add support for A8x GMU
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>, Jordan Crouse
 <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Connor Abbott <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
 <20251110-kaana-gpu-support-v2-10-bef18acd5e94@oss.qualcomm.com>
 <f7e204ac-28b6-46a7-903d-30b7f31dff8b@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <f7e204ac-28b6-46a7-903d-30b7f31dff8b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE1NiBTYWx0ZWRfX/4S3tshLIJ/r
 e3I/QavZmO5Tp+aLaRw4y+1IWCYCGxS/YbVex3xzZKHXH3FIDpWBYRc0ov4PF4GjP2/Xoy9lX6n
 5hcd/8EWZgp+rpDehcsRZYxO7HXXaNsg7OpmtltvnB4RA++jcwoembOi3hH+8yxWwVpPe96Md6P
 EWYQbDrxzM3zXEcL9rLKRUQm2KwOc28sXg+U/ryuFs4IZ7CvGBkwHWSHCimLOIQCP4B78PYMzVs
 xZKuX0HOKbRTtqP2vNYuIM1kiXWuq86fikAtJf1RGiCe8OoVYEPiC6T2ScNwa34hSeUSAdIWAq2
 3E6/dubKLh18zcnvBxqzjBGxbUdt5PJA9wUOekbKiX2Y5LCtpAy3ytnN/7R1+sZX6Xw4tlBSy9O
 iECNf1WVoJpWblE+mUd+Jd/Q3BLTLw==
X-Authority-Analysis: v=2.4 cv=d4f4CBjE c=1 sm=1 tr=0 ts=691638cd cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=tMg4Ou186bfY0pTZoTsA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: 792usyTEuJdrpt6Uw9FdV7crhcR2wbJQ
X-Proofpoint-GUID: 792usyTEuJdrpt6Uw9FdV7crhcR2wbJQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_05,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130156
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

On 11/13/2025 6:40 PM, Konrad Dybcio wrote:
> On 11/10/25 5:37 PM, Akhil P Oommen wrote:
>> A8x GMU configuration are very similar to A7x. Unfortunately, there are
>> minor shuffling in the register offsets in the GMU CX register region.
>> Apart from that, there is a new HFI message support to pass table like
>> data. This patch adds support for  perf table using this new HFI
>> message.
>>
>> Apart from that, there is a minor rework in a6xx_gmu_rpmh_arc_votes_init()
>> to simplify handling of MxG to MxA fallback along with the additional
>> calculations for the new dependency vote.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>>  	/* Make sure there are no outstanding RPMh votes */
>> @@ -990,7 +1022,8 @@ static void a6xx_gmu_rpmh_off(struct a6xx_gmu *gmu)
>>  	gmu_poll_timeout_rscc(gmu, REG_A6XX_RSCC_TCS3_DRV0_STATUS + seqmem_off,
>>  		val, (val & 1), 100, 1000);
>>  
>> -	if (!adreno_is_a740_family(adreno_gpu))
>> +
>> +	if (!adreno_is_a740_family(adreno_gpu) && !adreno_is_a8xx(adreno_gpu))
> 
> stray double \n above

Ack

> 
> [...]
> 
>>  	/* Check to see if we are doing a cold or warm boot */
>> -	if (adreno_is_a7xx(adreno_gpu)) {
>> +	if (adreno_is_a7xx(adreno_gpu) || adreno_is_a8xx(adreno_gpu)) {
>>  		status = a6xx_llc_read(a6xx_gpu, REG_A7XX_CX_MISC_TCM_RET_CNTL) == 1 ?
> 
> You skipped writing to this register above - can we count on it
> always being in the right state?

Warmboot is done differently in A8x. We can explore that later. This
fine for now.

> 
> Do we need to map VRB, or is that a topic for the future?

Yes.

-Akhil

> 
> Konrad

