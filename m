Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7283A82974
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 17:09:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3AD410E91E;
	Wed,  9 Apr 2025 15:09:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EfpnjdFK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B135610E924
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 15:09:02 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5398OlAM002326
 for <dri-devel@lists.freedesktop.org>; Wed, 9 Apr 2025 15:09:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ZM49O2ioHcxPJFgz0BW7OWFv9D0F8HSwleBnH7gV14s=; b=EfpnjdFKzGCqHJEN
 Ma/mOBmSYSbE/oWDxhUGfjgKLsaLrT7haeMHc6DuaLFAaUTf1Rgmfr4kGnwJMNZp
 iIQxKlLT0tzeg8Qton673zuoj8X8AsnHcbwsDyXDdQG68/zAkephLqY/V1Yur2g+
 y1TBsGfnEznmvp/YydzaD0uxRqkpIiG7OG+qX/SPY3rXuoWCFbzky0bfRQBW8pfJ
 AJH327Xmon8PrmBGBoK0rLCOKaa9NDumDOv2TLVL8ipaiJQsWiWfx34CwiAvAgE2
 BPCcRA2Cbq9Bc/G7a4L00twnwaVQ93L2sLu4SQ2I0XSxMO67tiUMtBMC6PyuSJET
 0MTMeg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twc1knw1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Apr 2025 15:09:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c552802e9fso167535985a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Apr 2025 08:09:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744211340; x=1744816140;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZM49O2ioHcxPJFgz0BW7OWFv9D0F8HSwleBnH7gV14s=;
 b=sa0n2ymWNvHPlxwpGYr73zipr2Dxr5m/5PjAFuDRK9Gf1DYwyApW619GjEjKkY6jfL
 DzVYMp5IMxWzwe9aJjw2g/tn//zMBuo0b2dnCj2ENGwavOrflTb2kTzXOZ667c9sKhgx
 hJFLIuU6jvn6hHGXxsYslBeUlYsy623roaxG0CW12QgRagi/8zQH8BIlcmdHQ+NGhq01
 f6Y4WwDAbSUaoQibRJcEFDmEqdp9X6c5QLt0GZTYYTAlypUE1ym8VPsnHAqHlphX6plI
 aQeUR9q0xHktUPjQNZZa4jyKzHrvwxMdn8wDMzd5EkJ7z0Myq+1E7YIRCqfK6LcgeHFm
 qgWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLTWJCR0+qDsMgsYJZM41NoWxFPml5NWvjVrJYVQA/r1wVRSXRZRRAFjNpqNpJgdNj475pEK9qemI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz0NE9p3tqeVeMt3RfL2uRCosc4ddLpf39DPkjTIh1VV8aIyJgi
 TJG6pAzLJKdFuz3K08076hKA/td3qA+kFGwvgw/8aP8l9rF+IKtqrmshrwopslN4zy8PU42PLen
 TLBP6sNKf4yjge+WUmhA9TMHqa1KQp0Cj1N1vBtMFOsIolqazQNbCLXdeI01ADjNAwNY=
X-Gm-Gg: ASbGncvLaXJBWOVsuXLdKhsPOou//nxz5D8OHYh0Mb6xUVUdYFCucP2DM6rJacujrPz
 bTPPa/dHX0Ul2a+82h76VMvofzcwOHQ7voGmbtXH0NiwCNCGjhO21VJy/FvFpVMy7kZkBwaOFCd
 F4GoXGroGnpPq0aNN5Dmw+lAJpyUrg35NSE+mdHvlY62ilPGtpGbc7fdq8IyRAtxcuFzcFHN7sk
 GFF24T0CBLEBEuWe+1eepOdDT65o/uvseS3ABXHg4+D9QmSlG6lSCOc8zP1tnZpvqnwb5rJfolF
 bzCebHFY5c3oFiQaNDojTGXPXGF2OJGKYXky9kd+aYLTv1juX4CAGQoN9elOk1/Nkg==
X-Received: by 2002:a05:620a:2805:b0:7c0:bb63:536c with SMTP id
 af79cd13be357-7c79cbd8ad2mr156919885a.4.1744211340668; 
 Wed, 09 Apr 2025 08:09:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKqxp7rcrINyn8M6wMLr3P4dzZIUo2PduztsqFYTGLMrH5xZk1qXZ1BhuOXgUr9MLv4mhnXA==
X-Received: by 2002:a05:620a:2805:b0:7c0:bb63:536c with SMTP id
 af79cd13be357-7c79cbd8ad2mr156916885a.4.1744211340304; 
 Wed, 09 Apr 2025 08:09:00 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acaa1cb425csm110988066b.104.2025.04.09.08.08.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Apr 2025 08:08:59 -0700 (PDT)
Message-ID: <0d1aaba8-7736-497e-8424-84489c637914@oss.qualcomm.com>
Date: Wed, 9 Apr 2025 17:08:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/7] Support for GPU ACD feature on Adreno X1-85
To: Anthony Ruhier <aruhier@mailbox.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Maya Matuszczyk <maccraft123mc@gmail.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org
References: <20250109-gpu-acd-v4-0-08a5efaf4a23@quicinc.com>
 <dj256lrkc4s5ylqkqdrak6a6p3v62ckkd3orsg7ykz2w6ugllg@rbfkojacklvx>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <dj256lrkc4s5ylqkqdrak6a6p3v62ckkd3orsg7ykz2w6ugllg@rbfkojacklvx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: judkwKtzSjJU-e9azVmM6LAtCn3h0ApD
X-Authority-Analysis: v=2.4 cv=KtdN2XWN c=1 sm=1 tr=0 ts=67f68d8d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=vjlbkFh1sCUApBijkyAA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: judkwKtzSjJU-e9azVmM6LAtCn3h0ApD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_05,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=960 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090095
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

On 3/18/25 2:12 PM, Anthony Ruhier wrote:
> Using this patch serie on 6.14-rc (tested over multiple RCs, up to rc7) on a
> Yoga Slim 7x (x1e80100), I often get a video output freeze a few seconds after
> my wayland compositor loads. I can still ssh into the laptop. I get these
> kernel errors in loop:
> 
> 	msm_dpu ae01000.display-controller: [drm:hangcheck_handler [msm]] *ERROR* 67.5.12.1: hangcheck detected gpu lockup rb 0!
> 	msm_dpu ae01000.display-controller: [drm:hangcheck_handler [msm]] *ERROR* 67.5.12.1:     completed fence: 777
> 	msm_dpu ae01000.display-controller: [drm:hangcheck_handler [msm]] *ERROR* 67.5.12.1:     submitted fence: 778
> 
> Rob Clark recommended to me to remove the higher GPU frequencies added by this
> patch (1.25Ghz and 1.175 Ghz). The lockups happen then less often, but are
> still present. It is easily reproducible.
> 
> A way to mitigate the problem is by constantly moving my cursor during a few
> seconds after my wayland session starts, then no freeze happens. Reverting this
> patch serie fixes the problem.

What firmware files are you using? ZAP surely comes from the Windows
package, but what about GMU and SQE? Linux-firmware?

Specifically, please provide the GMU version which is printed to dmesg
on first GPU open

Konrad
