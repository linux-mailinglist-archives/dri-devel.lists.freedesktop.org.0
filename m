Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F901C57926
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 14:10:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64CBF10E7EF;
	Thu, 13 Nov 2025 13:10:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="e6t/0V3j";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LupaPuiR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11CEA10E152
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 13:10:41 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ADAHVQ54097312
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 13:10:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 CZXY1ifhV8YPSwfeBFCqHJXWN9yVpsAT+ynQZq3WMfE=; b=e6t/0V3jRvOdUIEy
 YRTECo2K6P5WJYru25zm1auvl0mq3RCtZe/UIkecg0hG16qNXrdYsyIY9LZXIhhF
 vuxlvBXs0nZspcbsY/gitVt1xqTuCwzYsB7x6qdYII5p9fHL1LxRn+CSLIGfSXHr
 OOZB4RnyvDTNlxJD5zL0n1RV0NURlFwidrpfiWcPfRh0IEQOae6/u+gNFU/LzFnL
 Nng3Y5QtIikk08st4WV2moVIFE3kPUnp7SMIM73FuvwoDoVkFn1Xok6QB360OOex
 iT7gID2V3UWRd2FoEAxAbgWxHKfXaJ9vLCUs8vlNMj/Ive2zE1miA7cd9U0jnWdo
 0OPRsQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4addetrer3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 13:10:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4edace8bc76so2822521cf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 05:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763039440; x=1763644240;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CZXY1ifhV8YPSwfeBFCqHJXWN9yVpsAT+ynQZq3WMfE=;
 b=LupaPuiRHdML5gSV8J0IlwwKhURxlMTtdpsYv6XAuYvpVa7j9gqxfa4g8/vMR0oGeb
 ai5Cyi3VtQx5Gsi+0Ca/av5mxIRF/5bL9BGRTu+rD9i/EYtHPllPBvpHRxzrWlfVnapx
 pAxShNN6ZM3WiooKbHBbOPACuJcvWcFrn19hcy+MZOk1s2XmytHqcymoheMjQPGJXq+p
 yTfD8suMgoSMojlgL5bCX3CgTDeZvA9PCnJVvBxQyiMD69L9DNxxTVblSF8qGtJreCwv
 5dbQryCuuPDC9VbF4JsU3OXsiMwABIFYkNcbIwCmseo5USEw+Wwy2i8oFvO9UndKWNMb
 C43Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763039440; x=1763644240;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CZXY1ifhV8YPSwfeBFCqHJXWN9yVpsAT+ynQZq3WMfE=;
 b=cJReYOgIvamLIfRjMXfbcSWG2DSE5tOxwgo6H3xqLW/uSJAOOltLgnGss7hQDKqFf/
 hkYW1hvqFakB5UmqAiF7dLxoJh0K8clC/JRI1e7PD5r0pEiiiMOttTcZBVWsuys18FF4
 XBv34yqf1m4IPXLxDNtwNDJ7GWwwcMKeSdKQwle3/27qCeH2ykrhP5W/MqS3Z1EsfGFd
 +b36NxoATOQRt6uDdKhzRu2bu605I3aBvzLWG4God8eogmQnhUbdUMMtE0+aT0bElpPJ
 F/2Mbuo25JwP3QQ+CaydrPgEYggujDFAQMppZ8F9UeCS78e18y8UtFEvw9se0pnf64te
 eO+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWU0NbvouCvCIi1x9QiyFiFdtfmS8yri5TqpB83Fn/6728W69s3MWjGWKgLOVZvU8shOKa0nrpPETs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQHUVfx8dzzlQ9gIv2K6vbq40M+DdLzYOU+X+WoLYYx10GOqpC
 nseHCblrCBMNSkzWh45Ubf/iRPyan/okMNaZYmuLmmaH+sGt+VmyT4I9kKTRZf/Jws4rOuUjrys
 dXhGBz7ghV2Syj2ulBMBz0kM997K8kVIFAweUYfUKwuF7QMuPMEjnkrC3zbddIMSvuS1DNnc=
X-Gm-Gg: ASbGnctzkuG7w1wYpa8QeV2wqCvfUamM7IukEy0BFdvZxxMRWmOs/fQCsDp6IMUrUI7
 EBhdTTMGH7lOJ1py7w0//5lcoamSBnog5a5Ujsca3ZSmnSZbt6biD2M18xHp7NZrq0arJocqV7N
 B3495u5PJdnpNoV+BOd/A79XokkBgRdtIJ4MFgK0JaqKnjZyjL7JO6w/OPGv2lsqogx2tetz4QH
 ywKJb5TbT10cjSKv2vq5C2PoUxU3xCYlAexfr9ChmAGz6H0SPb9l4PoFdX0+0UGAEwLbl+vmqJu
 F9FT95gCJ5UuqDDoRCtjy626SXhKq128HTsbpX73Vsn1jOWNsPaqTwsprVEG3luFnLeKV0J7kEo
 P+8B9y2Mm2u8bcuQM1iNGwcZ5xAmb0DAQJQfC6Sl/pKOTQMPDqaP1D1RD
X-Received: by 2002:a05:622a:1316:b0:4ed:b409:ca27 with SMTP id
 d75a77b69052e-4eddbd65605mr59626001cf.10.1763039440288; 
 Thu, 13 Nov 2025 05:10:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IESawNQFUeHeMbh5CviAuecEDsSSa2Db0tmz9JN9G7A61f/DAwZOVKGgRG2h1xYO5nZjtsMBA==
X-Received: by 2002:a05:622a:1316:b0:4ed:b409:ca27 with SMTP id
 d75a77b69052e-4eddbd65605mr59625541cf.10.1763039439747; 
 Thu, 13 Nov 2025 05:10:39 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a4b28bbsm1396845a12.28.2025.11.13.05.10.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 05:10:39 -0800 (PST)
Message-ID: <f7e204ac-28b6-46a7-903d-30b7f31dff8b@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 14:10:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/21] drm/msm/a8xx: Add support for A8x GMU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
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
 Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
 <20251110-kaana-gpu-support-v2-10-bef18acd5e94@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251110-kaana-gpu-support-v2-10-bef18acd5e94@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: D-yPmCx-FPbUCigiQC0RGrG0oZAKkC8f
X-Proofpoint-ORIG-GUID: D-yPmCx-FPbUCigiQC0RGrG0oZAKkC8f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDA5OSBTYWx0ZWRfX3JLtvnbhDVfj
 Qzn9z4awRL98tlTwVDbHAvtNATXF0Zvm0wwn2no5ARCxrsceOi+z9NPn94rQaai3csEANV70oMh
 7rOiRhe+JtLHwVjglzMQGytgmzJp+h1uGxx17/Wcp+KgPuIWtku7Q0JXxMERJrRpAxLSfo6Rzwi
 Rt5qP/53ypk6o+8LiXdFR/2SSfnMZoA2TKa9rfL1N0W7oGl8arbWnf6KXZlXzhwmEPBQ76AX5L1
 +bBR+Pg5xTozzBPvI/bKAu8PyByjJPGBqS8H4PkqZrMsdnQR+x+7I8TF7JK7xoRVdcpgeuIkXjC
 GMCPV5ivq9E4EskS0rx4Xpn5II3z44w4PVeni39kZsDmIw41nq13Wuk77tJWj/8McVGoR0dc3R7
 B4nCzrAndNHm2a2WRydikoEs3+Kj1Q==
X-Authority-Analysis: v=2.4 cv=QZNrf8bv c=1 sm=1 tr=0 ts=6915d8d0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=XMd9o5LtjS6KuIBsTZQA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_02,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511130099
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

On 11/10/25 5:37 PM, Akhil P Oommen wrote:
> A8x GMU configuration are very similar to A7x. Unfortunately, there are
> minor shuffling in the register offsets in the GMU CX register region.
> Apart from that, there is a new HFI message support to pass table like
> data. This patch adds support for  perf table using this new HFI
> message.
> 
> Apart from that, there is a minor rework in a6xx_gmu_rpmh_arc_votes_init()
> to simplify handling of MxG to MxA fallback along with the additional
> calculations for the new dependency vote.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

[...]

>  	/* Make sure there are no outstanding RPMh votes */
> @@ -990,7 +1022,8 @@ static void a6xx_gmu_rpmh_off(struct a6xx_gmu *gmu)
>  	gmu_poll_timeout_rscc(gmu, REG_A6XX_RSCC_TCS3_DRV0_STATUS + seqmem_off,
>  		val, (val & 1), 100, 1000);
>  
> -	if (!adreno_is_a740_family(adreno_gpu))
> +
> +	if (!adreno_is_a740_family(adreno_gpu) && !adreno_is_a8xx(adreno_gpu))

stray double \n above

[...]

>  	/* Check to see if we are doing a cold or warm boot */
> -	if (adreno_is_a7xx(adreno_gpu)) {
> +	if (adreno_is_a7xx(adreno_gpu) || adreno_is_a8xx(adreno_gpu)) {
>  		status = a6xx_llc_read(a6xx_gpu, REG_A7XX_CX_MISC_TCM_RET_CNTL) == 1 ?

You skipped writing to this register above - can we count on it
always being in the right state?

Do we need to map VRB, or is that a topic for the future?

Konrad
