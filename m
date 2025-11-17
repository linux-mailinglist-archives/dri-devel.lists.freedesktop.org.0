Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC74C643AD
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 13:59:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3B3310E3DA;
	Mon, 17 Nov 2025 12:59:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gDbgBq32";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WgNpDvnt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13DFA10E3DA
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 12:59:43 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AHB2KwF3916356
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 12:59:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QIy6nmU4bLPrMwJ8/hz8enJnPyJdVXYR0lTn/0d01sA=; b=gDbgBq32sy4TjEkA
 xV1cWLyP46hhDjxml3hKt7uUUvHHcRhFZT23nfxGlBvG6n6f16wls9B+9zYWUQrk
 PDEN/dSuHijeVC/lqWoOpL1a7IUxbZAjHjL9CkZoGMu+lC1FXU7PZVC8soi5nk5g
 ccDAz/XtF+sQSRTW7e56O3rrt5hHmp3Yaj11r/UXJ68F2CusWoenqkbrsND1agOh
 Qj02iXlXG0nBIBQmWmBO+a/J7uMiE+1dpijBaDGxe8VyTtr9wUEFczFIYfny9M4F
 8BHl7Wp0KEiQNGiwx91FwFj7BBlQAiDLSgKIa9HQftFiLq8dnK7GVlaqt1Fqs7zL
 bT6kPw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag2fx8ak6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 12:59:41 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ee23b6b6fdso3312061cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 04:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763384381; x=1763989181;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QIy6nmU4bLPrMwJ8/hz8enJnPyJdVXYR0lTn/0d01sA=;
 b=WgNpDvntkLk+bBI389l1FYc8KmIALV/1TG748Bz9ZCHK7EOgzLf8Aq4O7buQOuYpqn
 VlJlBhSX35hhn0ju3s8Q4tKMFCfCfk4wJHEPEBTN21Vfk+p6EdRXFr2VscrIfijNk0lo
 S/mTIzsvEvT3nbnDyE2rxL4KCT4vUgV0c1xy7hg6xHNad38aa6WOKpkqsxjd22rCuXKB
 at6R3QJnZ34G5TziCMUh9y2eV1UP8vArJhHKKShkIPkrzmenhiBRgKWtW4T+scnptyyU
 d2iihkEQpbJXOJkBkkup5rGWAlyHKskThMjZPaX7FDkCCe2ydbhwujhPrtdOZwoRRBWT
 2d9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763384381; x=1763989181;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QIy6nmU4bLPrMwJ8/hz8enJnPyJdVXYR0lTn/0d01sA=;
 b=Vs1Pgu7iXFW02Tz+oPTdMG6LeVu2YaaWFd9wkf++obCXjhEb9Zio+nfAd0pf/TgUkW
 CI5VHpofHCiO33YikYLDDxJIGtpNWeR87nyTAGRJqb6MG44YvPJkUCoI0aFlrRC05LKW
 aQm6Ral2NpAR5ZEJxgAUGskRi7LU4iW2flCj8kumdNv+ophzz6NFwK1Rc0it1aXbFdqn
 hFxHLvLyk2CbCMIoT62P3bctlAat+0p0svvQVaotX0h3kPS07ebuUqvuezlCfEWxnMRO
 KhMk91FTVE5HuuOh/oyMl1+rLtekZdYJhX+d42eDOF8a1N+nxrTwvs/+VFivxh7emZUl
 IK6w==
X-Gm-Message-State: AOJu0YxS0+ymRLlcaSt43UeOKeU+5fAM3NueduqyX4zpoNv4LMewbfc+
 FybLKRi6J2q4OxEB6v6MYe58IvjxIJ3tvidJv8aRv7gwYrDMqPs0iOKqBMe+UbcLBdttcBLuiCt
 Zc1cSVM7L5Eyz1TU5GV8dY9ImVL3mnDfqAxF+F9il6wu+IE7CIWDWE+6a/WMEZ0sGrjtZ4AI=
X-Gm-Gg: ASbGncsD+qMiguMWvMBT6e9+tN/LxnezIF5CUHBo7hYB/JEdfqbBx4kXFNT/g9o3aJm
 cYKd8+ADvu7ac116/2zeUZsGysp2qbuklUoxGWbya8Xc3Q7mbZ8NmRyFYoGh97DA67/OSbrn/NE
 Reqx8ITfx/FIM6ZaDKYEYh9E7TDvm6Uq2Yo41lS4W0ynYwazpN2lYXVg4MU0jxe9jXrrTyAU2yA
 f0WNJ6qKmTfX6iMJe8JH+Ua1U0dw2NPv/emR0Wn4kdq/A945kx1VQUrpY5WBAVUWv53AwdnUO3f
 Z3e5DMvZthfWAv4kIXeg9wrZ9UDdZpVtICo8YNtopE6K3BGvQTf4w/jzD8dpmXXuhesdvHO3Qhh
 qFyssMrIeE4p2mqkbZAqJOtzaxqQwxxlasqnu7jhZjCmF6O48NXQrC+me
X-Received: by 2002:a05:622a:508:b0:4ee:2339:a056 with SMTP id
 d75a77b69052e-4ee2339a1b0mr23151121cf.2.1763384381331; 
 Mon, 17 Nov 2025 04:59:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVdh9JuD27fBdzsHi4Vxyithgf/j0od2VLCYOt4w8VBPCvZl/r78+9pdGLJV5q/0RmAHtKxw==
X-Received: by 2002:a05:622a:508:b0:4ee:2339:a056 with SMTP id
 d75a77b69052e-4ee2339a1b0mr23150591cf.2.1763384380563; 
 Mon, 17 Nov 2025 04:59:40 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fa81172sm1066827766b.15.2025.11.17.04.59.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 04:59:40 -0800 (PST)
Message-ID: <8a6f3969-077d-4d07-b2bb-230fe3e0e309@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 13:59:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: x1e80100-vivobook-s15: enable
 IRIS
To: maud_spierings@hotmail.com, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251116-asus_usbc_dp-v2-0-cc8f51136c9f@hotmail.com>
 <20251116-asus_usbc_dp-v2-6-cc8f51136c9f@hotmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251116-asus_usbc_dp-v2-6-cc8f51136c9f@hotmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: UB1Ukre8NpnS7SPskDW4zuimxcMyLKi3
X-Authority-Analysis: v=2.4 cv=EIELElZC c=1 sm=1 tr=0 ts=691b1c3d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=69EAbJreAAAA:8 a=EUspDBNiAAAA:8
 a=GX_lnnJ6PiQ3Sj9TFooA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: UB1Ukre8NpnS7SPskDW4zuimxcMyLKi3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDExMCBTYWx0ZWRfX5twXuK1Wj7LV
 2IPlpYtOPGuT0rcMLH9DD9675sNAWwwXhH8IMwloZCruBXMRffSXdLt2ekprMdTOMmtLSPgEOda
 x6uEZ1CgWEXmnSG/A70n6n9Peioznep3Y1OH8x7QPQkGAi1cVEigKWZXOmISLcyH7AVyDsG4cVL
 U8/MN52npBPAVH5+DzCX70ek936jrPncwo98/y77lKPA8Z3N5Ig32WvLajih4yCgn8qvZb0drAO
 6FD6ZJr1JnCtO/ay9PtaLuCgBoe3aMsPUGPkTalRv0BG/Uj7pR9JfVUT1PbNohF8P6EZ7+Ldynd
 dY0LL9fthAmZ0fwKBhlg5QWBDcFgnWPc3dceipu0/slM5bcrj5cejyHwju1Al4ABl+i5zGD6G7g
 ztC1vgSaINICxnuuUTsq+VRjhN1jdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170110
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

On 11/16/25 11:52 AM, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maud_spierings@hotmail.com>
> 
> Enable IRIS to allow using the hardware-accelerated video codecs. The
> firmware is not upstream in linux-firmware yet, so users need to copy it
> from Windows to qcom/x1e80100/ASUSTeK/vivobook-s15/qcvss8380.mbn (just like
> GPU/ADSP/CDSP firmware).
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
