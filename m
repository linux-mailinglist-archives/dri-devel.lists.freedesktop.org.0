Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FEFCEA707
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 19:11:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 709AF10E93B;
	Tue, 30 Dec 2025 18:11:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JcUq3ATE";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LoYS38jU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D19D710E93B
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 18:11:42 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BUEebVd3539557
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 18:11:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=HPNCoFW0b1ET+3JulFr+b4L0
 SqkCQC1DxA4qIwg6NPc=; b=JcUq3ATEUmLzbxJpIZjjgwKJrX2YQkrbILoNvTKJ
 PqFopB2qaDTGSp3+zgEqlrlZE/oos1WDqrWj7a0wE+miIj/T1IETgS+DxqFL7Wmw
 XG//pFvAJ+pgqNEruX1NHNFFJjrGI7bszquBxmkuVAqP9nSqVZZmn1nvFWoQ5vfv
 SjgOS43JCEVWOZO/qB2s6g2JCek1lEo7VqXI4m5O5qjLpqNFXdtVWim6SX/E1SzL
 yasCK/nhu/fdaZkvt4NM3H3WIozK+4Z7VLWaf72s3/Lj+iGjZIP+oSZuoQcD/O4v
 22qMk5ekGf4hLaVpc/YwzSQZbXJnT8Z0fJ4OEFhoFKZ53w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc88yhsy0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 18:11:42 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ed7591799eso254735781cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 10:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767118301; x=1767723101;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=HPNCoFW0b1ET+3JulFr+b4L0SqkCQC1DxA4qIwg6NPc=;
 b=LoYS38jUjCYdpqC3RMUeWpS3jpKvx2Oys1a2uKGr8MSeKCxd0UuTyIKfZr+8FZfBZt
 jE9NY/xKaApPf+VsEE88Y7Gsuz+NRFDLYu5mk+PMS5xVdDqSfegleShTT83SoY2xA2Di
 DzsvbPk+EGCzIBWB9LIsvLhcus7FrQeKm6yJnqFdT0iia7WDwCka+WkNuqa15O7grpsd
 n0xuUiDQ6a2LgvUFhaFlywr2u5kTxNCQemr0EGwx9K48QHBA414hSSd82WJdi6QoRV0j
 NMWt4i2dmpaVTqgODEBfPf901g8izYpjgpfmJdMjnbslKgM0F2uasvFmsbCeRJtOvGIz
 4TSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767118301; x=1767723101;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HPNCoFW0b1ET+3JulFr+b4L0SqkCQC1DxA4qIwg6NPc=;
 b=hR5QK2i5TAy+iNanA1TwnbLyYqi6XimSUUJ0w7awXLPgyP6RKjeO07N+BCJ3eZAROh
 P83S4H6suZBD1AF4FFzxyxQF5xt11Ld0qyEERvHS1wURQyDOpEW41B5wmkN5zaKmN5BK
 N7Mafs/bE1r+SmxjPxr8spe3KWNuaV60guPmeKR9S9uslaJvAQAZ8AK01UJWqyLUpWCZ
 EIDdMYIBXmXvInrvtu4UmknKtT0Yxs7xllTsAei0ezlIjqcIzk7EXyQemf2hMvCf8asQ
 ZMi0INlWHWzjRWhJZ7U0Hykhu3bGhiVulsvilkcL1jVDmYfJinShDeCa4hywgaVu6OKf
 zFhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUw+4SBShHv8erb5RP64SQvBUtH42BnixRhwSAlondf0F/HDxrTi5y291F5jyqQaiv9c1PjkKID1t0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6u8YdPF24h0hYKtYzAq58Oge866o//EEJhvn2jMHK56HsW3+n
 of1lKEek7BrnqoP18Leg3Xw0pljC2NoGrTdkb2flzMaz3Cu831tG8HWSZmgnEE2dW7AMz1K/nd5
 2hExq9jxYgrAty2e4JewLU0dGG4IZ7oMO5z6xl4tl6U0Uoh5ynxbPHRdyn0RW5Z1Ha23tdNU=
X-Gm-Gg: AY/fxX7dZ7eDNMNDqwKs6X01a+aZ6XdB4fezOaaPI5ayUocvr5MkdF31HwydEmTrOXU
 zXsmFVyYuWNN5DXRG/GpfPSNvdaRvyepQmWr6+CYRNErE2mJrZwxKBvoHhTGLm6vvf6VRgDw4Xf
 ZzjwcljxpPpLSzlzrI7JOlmivtE3LCGKUeKusNACrpApk4nzZo1LVY/jnVMkx2PBzCqjfT0eeLj
 D4aBSkWrQ6KSkvqYvWtc1tKUbACJg+Aej5dPtX8dNxAKwgdVZBngaFk/xCY847PPKl98iqHVkWv
 y3nZBpDHJj3lDAyqWFicJStMt1XmDGzi5gfuIGGNuMjWax+TAHDLUg1XHWepFrJBPCVgt7EBqUV
 1iR5m0acbAKj9FI+QqswVhmznBn4lCQO3r9T7Y11lMb7472T947ZiZnHAjNNoCgmzEw4DQuCfcr
 l74+3rqNME+dkNcjfN2b9GPy8=
X-Received: by 2002:ac8:6f11:0:b0:4f3:530f:d752 with SMTP id
 d75a77b69052e-4f4abdf0a9fmr509773201cf.81.1767118301281; 
 Tue, 30 Dec 2025 10:11:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHIGCnUN1Iw2knaNpvsFWnvKFe/sZ9X6NUNsCPxK4IICAv/qOnSJjlR9vMcYrxElHEnMhkGxw==
X-Received: by 2002:ac8:6f11:0:b0:4f3:530f:d752 with SMTP id
 d75a77b69052e-4f4abdf0a9fmr509772661cf.81.1767118300838; 
 Tue, 30 Dec 2025 10:11:40 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a185d5cbesm10707751e87.13.2025.12.30.10.11.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Dec 2025 10:11:40 -0800 (PST)
Date: Tue, 30 Dec 2025 20:11:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH RFT 2/3] arm64: dts: qcom: agatti: Add CX_MEM/DBGC GPU
 regions
Message-ID: <n2tagk2qxv3bhblivjjhrjaahzhyscz4gi7s2vvwadikgphtka@rxv7rmhxbshn>
References: <20251229-topic-6115_2290_gpu_dbgc-v1-0-4a24d196389c@oss.qualcomm.com>
 <20251229-topic-6115_2290_gpu_dbgc-v1-2-4a24d196389c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251229-topic-6115_2290_gpu_dbgc-v1-2-4a24d196389c@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=POcCOPqC c=1 sm=1 tr=0 ts=695415de cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZSAiGDBkxcGykqJOsrAA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: sYR_Jye5ANtch28Pz77StRmmPL86ftnx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDE2MyBTYWx0ZWRfX6AiwKDez7a/Y
 a8RIbn3uoizlEjvnZJCbVb17EssHOPAQqdzuPdvnBOQjzLJ/Hcm8VTbQkQNuBh8lPqdibcHgmwA
 Y252MusAymCnbTqzQ1yDijj9Rm28gdFyxWcnosHZ4N/ewI4JzuwkwaWsAiR7srb8x9rNuQE90m0
 4w0J86ypkf1ad8zSgeSIUioYMSgxAc0HowL4NHY0IJQK7PJxhrYlbCTcevA4rr3I4z9ymSTXwxw
 IMvUSvB9VFyuzrY08p0PBkwpb25YW5hZ/Ebh11J/xbeyZ/rZS176SIAY54BQSacgg4U2j76hmhK
 er1KpNjc0WPHoSHzhjuCeKPOPmrEWmjomE1HWJUVCjfwEvuZDS0B3ILXqunl8KSpH2wq8VxkVYC
 bU0eL02OuLVvHN31jeRxxSAqKgnFzw9nSBSkI2NSxV0NyoKPvYwW6LRbOZ3n4yl3OT26H8Cyfcb
 3K07TAtxVWHe+y8v2Fg==
X-Proofpoint-GUID: sYR_Jye5ANtch28Pz77StRmmPL86ftnx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_02,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300163
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

On Mon, Dec 29, 2025 at 09:47:40PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Describe the GPU register regions, with the former existing but not
> being used much if at all on this silicon, and the latter containing
> various debugging levers generally related to dumping the state of
> the IP upon a crash.
> 
> Fixes: 4faeef52c8e6 ("arm64: dts: qcom: qcm2290: Add GPU nodes")
> Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Closes: https://lore.kernel.org/linux-arm-msm/8a64f70b-8034-45e7-86a3-0015cf357132@oss.qualcomm.com/T/#m404f1425c36b61467760f058b696b8910340a063
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/agatti.dtsi | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
