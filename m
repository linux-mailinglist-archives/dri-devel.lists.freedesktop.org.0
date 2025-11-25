Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A322C83FA5
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 09:28:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECD7610E383;
	Tue, 25 Nov 2025 08:28:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QXb7/Qqo";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U7SKITdt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2641F10E385
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 08:28:18 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AP2gvql2149390
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 08:28:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=C0xyVDHLDCvMVkzkodB7GPpu
 M+6tZS/+sWy8NjN5kXU=; b=QXb7/QqoTVMFS/a56YPst9Cs45G/ycmOzegR32gb
 rWQa12kmCT6cGrdMZ+kHEMMN4Ap0w7gDfXrOB5gZATXx222rgvg2sMy133gXWaaA
 8Lqk9VXzbhPg7kAlOD6SMt5z5bivlWbPe2aigeZWCwrp1YXVxgCbB8L8F8KcmN6k
 +o3vCaJTJUa4WWG1hxDBY1Ej/v8rl0Wrf2c6E7GN3Xw49MHUqGJqviIOrZ9izXtC
 tJED0oFmECq0TJEzBtZR69XlYpRc1EvhwqcbiiZNiZdaTNAUJ+upBnwH3nion3w4
 daqjSaRuFYIPJcPJRU1v44TeKxqPYQ5CiQEyKC+XeW0+9Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amr8say0a-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 08:28:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-89ee646359cso1440970785a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 00:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764059296; x=1764664096;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=C0xyVDHLDCvMVkzkodB7GPpuM+6tZS/+sWy8NjN5kXU=;
 b=U7SKITdtHOkqusHrTiLPWa2wyTdy2Zu4Vu0xb0JV6WfgyCoVMqGX3V7gYxZxGyhGKB
 hW0oRcjdKogtvqA7Svvn9Apb+NF8KKJ8yloIIqAxk3T505xIRFpA0pNWM+WBB2rX0N7n
 /5Z/8s0dz69OzJuJr5Wz27Me9q3GWc+pDgLdg1cMrpsIB/B5MklgrEG/r9U2uc/Q6WAU
 PnRZrhcd/H1By+oUg/Zd0p7OBgzKAzupVFj/R8iqI8v5OXN7ps+oTtAyTN079hUrCHYc
 fxhTydO9HMsXNmJMwD8iaQTSk5odXazebVNtltEQog2jgNkH83jAyzhv7fuzaqJ0vePF
 ksgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764059296; x=1764664096;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C0xyVDHLDCvMVkzkodB7GPpuM+6tZS/+sWy8NjN5kXU=;
 b=nox6WURGujjaM/ggqnmfdDBWPe9b7CChinUKDj0NKSq0Gr3u4WK/UgthgeKYzbfeGN
 U2uVWC1/YGK/brSrcsdrWm89pa/GE4vqlzkjZmLoguLnVcUOqyIYTokkAYo75J16kQbr
 +z9L4OU4Gqp9fMEmTgOsNYxjzOkGvxew0bwVrhlz+4s4kqEWDesnlAs6ubKDnDtfhsq4
 d1ujWtSB2fwXQVz3ZM9bUG/7PfbOgVWUxy/4mSAzSOlupb+qPo2QmkixlMD1sHp0WJ5A
 v+79cu1D73PdryYkLyyDugIrJWUakHo8wwUSheLbqmqTpvdSj2+9dw27/VVQGWjjJND6
 zcRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKuTbPB+KRAAHXm5vcdkz6l4dLL9u/xVi+nPZmAlkT3pY7a3NG19vRx1NV5Zj1cvbmH30kHrfzpko=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyY1FgBRtPFTpi4zpkCHwUinzL4AcI716L/KCwyln7Gf5JIqi8F
 FxqSkaObKceHq3V6Wtnpr8vp79P8DdoBfylv7EsGFEc6LZtW6bQcTMg8ticS17xMbQGRCSLIVCi
 D5H6aWTGk9/+0pIDjxCUK1v2JGc8ZYGwhNPa9kYIDv4ipOoD9KRZ7gYeQFI7bri3m0TI85zY=
X-Gm-Gg: ASbGncsujmmE5JUQDAio2aKZFe7sSBxK5FMxCDuWHVserWs0MtCtFx4V4VZeN6OVxTw
 QceV0NS+pBMPjS0EJq7zA5gsAiUiPu+ZGdZkl3zosnJ13ghMAE1j80dh6m1f2XHMwuMf3SKzzc9
 3Z4wGS4AZDyvCIvNLZJKQw2DZscVUEPjBEimhrT07C3Dx7McpmQ+4YAj6zXUT2PgRwfXCjVlKMH
 gwHFT47El8xnvKkn7plLt5ijExKALonPkL9N6qjcgr1yxq+uuEhm4vBrPZjJtRMqlQV+hP6sHPM
 sAUxUSXMxXf/FFOyP38x+VdZ3JkryFXVKcmdHj+yggNnZmCVa2UKB4B8SvLnSzM8YwM/ay/bJ1l
 ycAyvtRL5jBJg6XFnUcq7vVtmm6whCnECY4oWKrMDJjl0IWIxs1Ry0Ql6pZToAqc2qLwozN67ao
 Q=
X-Received: by 2002:a05:620a:468f:b0:8a9:b469:efc1 with SMTP id
 af79cd13be357-8b4ebd6fac3mr250224085a.24.1764059296561; 
 Tue, 25 Nov 2025 00:28:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGcN96mL/Mi34nfBciX8M+hnzh6AlZnpTJoX9gJ2nCN4RnvbdoR1QuCweSHuB3nSFJ2g4zXiw==
X-Received: by 2002:a05:620a:468f:b0:8a9:b469:efc1 with SMTP id
 af79cd13be357-8b4ebd6fac3mr250220685a.24.1764059296108; 
 Tue, 25 Nov 2025 00:28:16 -0800 (PST)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8b3295f17dcsm1112575385a.55.2025.11.25.00.28.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Nov 2025 00:28:15 -0800 (PST)
Date: Tue, 25 Nov 2025 16:28:05 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: Re: [PATCH v2 04/10] dt-bindings: display/msm: qcom,kaanapali-mdss:
 Add Kaanapali
Message-ID: <aSVolV1gkWRK6Slb@yuanjiey.ap.qualcomm.com>
References: <20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com>
 <20251125064758.7207-5-yuanjie.yang@oss.qualcomm.com>
 <2f7aa593-6b11-4dbd-a0e6-f60eee16d7b5@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f7aa593-6b11-4dbd-a0e6-f60eee16d7b5@kernel.org>
X-Proofpoint-ORIG-GUID: 32MJP6iBkIKWG-lvA1WWbeiPYG_WoLgI
X-Authority-Analysis: v=2.4 cv=KP5XzVFo c=1 sm=1 tr=0 ts=692568a1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Kua_XrAaXZ40T8CRvF8A:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA2OCBTYWx0ZWRfX48haioVt5qQL
 mJxKtqAM7ChZMwaxESFh8E4x+56QrZZcJ4GJS6+7YSxW//vtcPAR4en/amZVM1dPpw3kHR5Tgmf
 c+96Y/kVvYnG7jUNnWSOiNbgP0lJGcCpMEErq5jQZXguevDqveAMBnpJANU8foKNpPnuXEGfjF/
 fi9AXxYkdJkwO12TuPVnP3NkQnPE8yrMGxmy4HplkI9vrHhsHfNYNQN0UZTaYbovQW6JKCf8AmK
 eKNRAccoJ5qA8h/HRj0TjgO/pqoLbhv8dN2UfeYxN+++76psL+1XNr9DmPBYKjIYi+nnlov8nh4
 06VUaSQ/G/hqOwNxC3gO75eBKhZgryp2iBjR720C26gP8dxPL9iTorOl/8dvbubqgb9SmzU2hd4
 D0pFrZO/trrIzzQVadEamfXXTclSbA==
X-Proofpoint-GUID: 32MJP6iBkIKWG-lvA1WWbeiPYG_WoLgI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250068
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

On Tue, Nov 25, 2025 at 09:17:50AM +0100, Krzysztof Kozlowski wrote:
> On 25/11/2025 07:47, yuanjie yang wrote:
> > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > 
> > Kaanapali introduces DPU 13.0.0 and DSI 2.10. Compared to SM8750,
> > Kaanapali has significant register changes, making it incompatible
> > with SM8750. So add MDSS/MDP display subsystem for Qualcomm Kaanapali.
> > 
> > Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> 
> I don't understand why you have random four quicinc or qualcomm.com
> addresses not related to kernel development, but you did not include
> necessary addresses.
> 
> Please trim your list to only necessary addresses.
> 
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC. It might happen, that command when run on an older
> kernel, gives you outdated entries. Therefore please be sure you base
> your patches on recent Linux kernel.
> 
> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> people, so fix your workflow. Tools might also fail if you work on some
> ancient tree (don't, instead use mainline) or work on fork of kernel
> (don't, instead use mainline). Just use b4 and everything should be
> fine, although remember about `b4 prep --auto-to-cc` if you added new
> patches to the patchset.
> 
> You missed at least devicetree list (maybe more), so this won't be
> tested by automated tooling. Performing review on untested code might be
> a waste of time.
> 
> Please kindly resend and include all necessary To/Cc entries.
OK, will check all necessary To/Cc entries.

Thanks,
Yuanjie
 
> Best regards,
> Krzysztof
