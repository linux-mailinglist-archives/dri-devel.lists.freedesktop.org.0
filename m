Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1C9CA407F
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 15:35:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B27A610E1E2;
	Thu,  4 Dec 2025 14:34:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RAPvjm0e";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I1NhYzxP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6E5210E1E2
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 14:34:41 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B4Av4pT1118876
 for <dri-devel@lists.freedesktop.org>; Thu, 4 Dec 2025 14:34:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=zMo58q1hXcHsh9de7AT5NtCtg1jt8KXPUfxBKaXrnlM=; b=RA
 Pvjm0eIZ/Z2m1XEblDoSmPbwSyCg03lzSi1T1M/MtkoUGB8gSC/ebZ+W59du7tXJ
 f+IEZ0IKLxvcMk0wO5t+hPeBLavyvFfXtHzybITiQoqB1OfkvLhOrnofm/RyGrzQ
 WLEK6MMFgpEILukeeXQEDbo8Pz7ONbVuvL/7uV1rb9kPEsIMPbpnX6o40uIJNUm7
 25bHR12Rpn9B8axJp/taBzzKbEfAGk1TajgK3hwfCPaEKRVyQeYrCH5+IFJrGBn6
 ZMcEs4ZjL9tlJUyx670w+ovUchC3BtHeu/1EvMmEiAgj3ldUMk7Q+wM6ruMZsM5m
 2eAN15SxdcYtnY9jtp1A==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4au90frjeu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Dec 2025 14:34:41 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id
 5614622812f47-4501b05fcf1so632250b6e.3
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Dec 2025 06:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764858880; x=1765463680;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=zMo58q1hXcHsh9de7AT5NtCtg1jt8KXPUfxBKaXrnlM=;
 b=I1NhYzxPHZaiViWpL5gfNR7q/+4yorUWplsGzqBRCBAMKqr2/ILsI5eCrruljFuQTl
 RWkwWEJuFPw50QHhO/d0IUv56JT4Ogi61DjgzguxNZ0y5I57gl5O/HNRocKTl8ymSsm5
 VUXVoRZiWpHenzg68EWXD1iLTPV8iLRDZQ5iFE3juUK+xlmW7in/HLMyFSnbO7jJHxK3
 XwrmRpPM4ZEG+hAlaskPoQksUrsl7Q6fJw1YRhwlQmxZYlE0ijHnK9HUZPbtFeEiXUt9
 E1D7DewB40FCT5sd7CaPd331LuaDH9cMx603f5vb6S0oSu7k79YkdD+6u2s+e33zBLMU
 HbGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764858880; x=1765463680;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zMo58q1hXcHsh9de7AT5NtCtg1jt8KXPUfxBKaXrnlM=;
 b=MyuX6+DbhGcIbIg0HQn9EFIvlaY39+2QRSg9WQJxx2ty7pWVwWc+0mE+KRq1jQKo5Z
 5L3VL5RMLQg7tDRYnXkMlm/Om+8heZ7MTOxLMO6kfUENH8eQjnNchf7MS9tJYf360FdX
 UwkM4bPYzshwKQnWXXjE7BnEkeTibu1/sKiRlfWaNx3t+E4LRSX3abPArD7sADNbq9kW
 qkH066PbrBmXzVYX2btYYjD/+U6QrKMDgYMKc/fUgv/XdeOx3aslUlbHxe+l2dfCy3kU
 I2vlpLFAn2XkM+bNQU5evHw8CgnO3QMcoMCIhDfuybcNIvzQIgmnzATdqaStsCOmtPaD
 htkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUL88/mYpJRmirPFYk6IxGrBg7U7ky2yEkL+FSyA7mNtUnRo9NhwlrGzfcMQDnPx+ZeK4KWiYG2d+k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwOUmSf1KPuqYlVG/GVcF2syrbT/fEQu4lOMkfZUOiqnNXGOYuL
 WpauJ2gEn0/Ke2azL00UdeINVVpcZONAeHzwvirMihS9nm3AOxwwHkNCezHtu1D1wTYdcKpJQkY
 5wu8YB/Q+HwP56pPDmdXeWK4n5YNHK1MMhZKRd5t9lwm/QCR4nnM6KMiuxFAZaCxnB5gYHfikL5
 RU8pkB8oVyP63aB4SWXd/jvCk2UPpnTuOa1eB8VV7u/PRyDQ==
X-Gm-Gg: ASbGncsa9xpEvfJbeo9gyQwW3fzbSniTTjpFN/bZpQu8WIepfrtFqgAuQHkl1KLS8NY
 iY5SJDoG5MJ5dKBN5KbPGjnDYxjuJrEEGU+8sCKH26KaP/dn652ITNr+h+vF72CGOEdnn0RC80+
 Cypbb+GwBBJmOVsn1jFpBbOcePYKCd5UclcM9G1mHKsOLxEVxC7jBVTDKC8DBn7q2hYA==
X-Received: by 2002:a05:6808:f07:b0:441:8f74:f34 with SMTP id
 5614622812f47-4536e5baaf4mr3829305b6e.62.1764858880577; 
 Thu, 04 Dec 2025 06:34:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF+0rUHt++eMGPmgb91GGQmUCxZnxzOfu4ye/49vp1JLfq2ba9oxHDbplRL+FsVsADDxBYLFTZFQ/V2ZQ5gRzk=
X-Received: by 2002:a05:6808:f07:b0:441:8f74:f34 with SMTP id
 5614622812f47-4536e5baaf4mr3829267b6e.62.1764858880177; Thu, 04 Dec 2025
 06:34:40 -0800 (PST)
MIME-Version: 1.0
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
 <20251122-qcs615-spin-2-v3-1-9f4d4c87f51d@oss.qualcomm.com>
 <9cc55934-6980-4673-8501-2d1efe2f816e@oss.qualcomm.com>
 <936b6a48-a5e5-4efb-be7c-215ac670677d@oss.qualcomm.com>
 <7b4bcb6e-fbb1-45f6-921e-dd1340a8cece@oss.qualcomm.com>
In-Reply-To: <7b4bcb6e-fbb1-45f6-921e-dd1340a8cece@oss.qualcomm.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 06:34:28 -0800
X-Gm-Features: AWmQ_bnTCiJGdMF-v40ymD8ufqsngGVM26REo7tOXu1SRLt8H3-DaxTDjnOqlTE
Message-ID: <CACSVV03buEzs9UyDaDpamyAXwM8vrkp2P_N67Wqt3oRjhdc-sw@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] drm/msm/a6xx: Retrieve gmu core range by index
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=OdCVzxTY c=1 sm=1 tr=0 ts=69319c01 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=eWtdQdNNt0tD2S8HvpoA:9 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-GUID: mBZUB_g0hLBkInXUzw8EJ1nnWUge2IbN
X-Proofpoint-ORIG-GUID: mBZUB_g0hLBkInXUzw8EJ1nnWUge2IbN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDExOCBTYWx0ZWRfX2HTiUIWUZNC+
 6M3qXUPs/Sx8WWtYoV4SjxVDxJyqZWREj8ZO0DtRx6oQXstOPTvuID5jT7c4vOAxlTRwnZT6/O7
 FT2gkA+6bdEiRlbYjPqsbn7mlq9E4h2+ApCPifrdAywXPOB4R0v58G4/N9z8pO0fOXz9gCztohk
 KZPz8hxa8Kjlf3PLPD3LQXt31qbHTTnYbbL+Cv3V5wpeY1DkEwsL9gpsqBtr4XAPhYBMDRVnq7d
 Q+4FPVL2xz7LFb2UoZhLolVMOhWmgFsdsL7Iz8+xpDik5rLBvkOSTL0w0LbyCFqCzjXRK95lWFl
 iDCkogp1VTfB/VqGYiQp1aklI9rTyONZpG1Qp35B8Sjp0Dx8CI9OJkqT2SSUkL4xdIKJl8+NWN6
 dV1bnhQwHYQJ9DpU93O6o33hnBkXDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_03,2025-12-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 phishscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512040118
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
Reply-To: rob.clark@oss.qualcomm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 4, 2025 at 5:30=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 12/4/25 2:10 PM, Akhil P Oommen wrote:
> > On 11/22/2025 7:08 PM, Konrad Dybcio wrote:
> >> On 11/21/25 10:52 PM, Akhil P Oommen wrote:
> >>> Some GPUs like A612 doesn't use a named register range resource. This
> >>> is because the reg-name property is discouraged when there is just a
> >>> single resource.
> >>>
> >>> To address this, retrieve the 'gmu' register range by its index. It i=
s
> >>> always guaranteed to be at index 0.
> >>>
> >>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >>> ---
> >>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 14 ++++++--------
> >>>  1 file changed, 6 insertions(+), 8 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/=
msm/adreno/a6xx_gmu.c
> >>> index 5903cd891b49..9662201cd2e9 100644
> >>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> >>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> >>> @@ -2029,21 +2029,19 @@ static int cxpd_notifier_cb(struct notifier_b=
lock *nb,
> >>>     return 0;
> >>>  }
> >>>
> >>> -static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev,
> >>> -           const char *name, resource_size_t *start)
> >>> +static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev,=
 resource_size_t *start)
> >>
> >> Can we drop this and just use devm_platform_get_and_ioremap_resource()=
?
> >
> > This API seems to lock the io region and fails with -EBUSY if the regio=
n
> > is already in use. I am worried it may regress other chipsets. So, I
> > dropped this idea at the last moment.
>
> Is there any specific platform where this would be an issue?

IIRC we've had this problem before and ended up reverting a similar
change, due to gpucc and gpu overlap

BR,
-R
