Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B123AD12F0
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jun 2025 17:21:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5C9910E183;
	Sun,  8 Jun 2025 15:21:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pz6uu8ru";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D12910E103
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jun 2025 15:21:47 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 558CWSJV001994
 for <dri-devel@lists.freedesktop.org>; Sun, 8 Jun 2025 15:21:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=eBW87gG+bs7XTeUanjoqFUZo93HnKMO9MXlkJu+f3B4=; b=Pz
 6uu8ruZbbxQJBWUXgV7JoCc7DBOj9QCBE60RwlPOXfeA8Xxzc7Ffhwn92PGbcJaa
 DVAdP+4/zh0K33sE2OxLMn5Iwq8JuQS9jKtDCZDUe3KJXC5cObD13UyoKb70iBmo
 AAgLje+TV0Z9b/VYYs8oa9oa9KGoFrwxndeTr0Z6DfL3TXfeFVLQoE040kMgzbXR
 1njLB2t1KIfGbeBTXdyaktZuc4qggx61LgIJHhlST3b29aqKO7xvsJqvJkThSIJT
 uj6saz0zK4/2pPa8Nx3ARz2hCjM6+khqfnJt+yJPnm/0wrNwbUrJuUa8SaGTFdne
 tpfmjWkvzake6hBeU68Q==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474e6jb1ey-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jun 2025 15:21:46 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-2e3b719adeeso1417455fac.0
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jun 2025 08:21:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749396105; x=1750000905;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eBW87gG+bs7XTeUanjoqFUZo93HnKMO9MXlkJu+f3B4=;
 b=lc/WGpHk4lFwhqaCLQsv/my7DVO09JwM8WDr/LmFxreQiJoLvDABWalf0MXZAMm8wo
 rxcBT2ysMmNzqJTJ5EwVUzFBahRAMycB/cQNgzn0SWrarYd/dOrjp1I9p51PyiSwV/ju
 97eiWRa8lTyOKomyfTVLyB+ZBPLOSqvBumkJf/vgmy+KyoDyYZ2nEof+1gm94M8F3Sy5
 RNn3qA7NEgwRuYl3zr0i6WklxGrlzi9F8B982S2wwEINozRVYdByhrUoAGmuvHP04ip3
 BCw77HFrAkMmM5F1XYFqA8j9YVrW/1vhUrVG5R/dCjkPlyGJNC7rkI6dCuWH8Wm6nAWi
 p/Xw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3EnSPgdmZ9jKQpHWy1+Rh6UhpWSfStf13c+qItAEBN1RJCLKxtzaQlsSREPeZtRfCl0J2/CE/eJ8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTAinphFaE+q2Sxl0qiA2wCaghBF+yp7ZFUYOBUK8XFjXzucJK
 Bng3YMuZh6B0N8Iye4+YrqtkSxP7qjHEXlgSrAFDVbAP5iEzxreZ1vTmBt+GvcGmlYUd8dyk3V2
 gy4a2+NcNVvS/LR1BqtpO7S75gCWjJQ+PqhaeWllvf70oJnzpM/qM+bHzNspxiXzmt9KuiHzkbC
 WUFditR4pqFqWHyJdRl6Zvylt3jctfxAIM2sbLJSmcDSeasA==
X-Gm-Gg: ASbGncsaKAjkRbLtUN8p+KrP8DbK+U8+0IjNgnDtQg70HQRg/YNDdZSZR+MLzcXMOli
 iedLunU4w1zCQh8VhJLrFW29apjycPhwhvkyVgk6f7CiPx594Z/SQTeP/IePzSUEH6ylk0A68KY
 tnwsQxIYkMgTVW65emyXGYn0+yBK0qGQOjInU=
X-Received: by 2002:a05:6871:7b0c:b0:2c2:b9cc:afb8 with SMTP id
 586e51a60fabf-2ea007a9e74mr5430095fac.7.1749396105520; 
 Sun, 08 Jun 2025 08:21:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeiwEJ5iaDlOgKPAjvzclsMxV+Ve51cmb4U8YPN6w25l7BtGOQgh5AvGBbsmLKSAPaB7+VQf5sDKWINoqBQY8=
X-Received: by 2002:a05:6871:7b0c:b0:2c2:b9cc:afb8 with SMTP id
 586e51a60fabf-2ea007a9e74mr5430084fac.7.1749396105225; Sun, 08 Jun 2025
 08:21:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
In-Reply-To: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sun, 8 Jun 2025 08:21:33 -0700
X-Gm-Features: AX0GCFulliz7op4BWmvcmnZlyStVB3chNWH7TufZIrZInNo_JnqWpgSQFphHTQk
Message-ID: <CACSVV01A8aqyoM4KYuUYVXTHnM1egn5-4UxqPrQVVjuvxxbC6g@mail.gmail.com>
Subject: Re: [PATCH 0/3] Support for Adreno X1-45 GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Id6HWXqa c=1 sm=1 tr=0 ts=6845aa8a cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=MXl9TKsJXw4pWBb3H3sA:9 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: qzy4Sa14NO_R6hJ29RzMQREyrELhsOn-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDEyMiBTYWx0ZWRfXx5vEiyBrrcHO
 yN0VVnzxmjojw/ZO79uvL0fxFXdsHggE8i+A7/YcndEDVhPra3B8uGg5ysHTWdD7xM24JprM7vL
 ouuHLnwwC3429dOnSrRkv1An2//wg5zKBBaao/9xylqXpM4UpjKTfki4O2kBAXDcPZcTGeN40Ii
 LZFE8L/e9a7DL3djW9IXJNFdB/97YeYH5K3u6wUkGS5YLZPwFEWfK9XtW77JUIr96jE/WRYBrxa
 h9PiRCWP4DuzxAmwD9z1JrVzYvH1pkQlP60SO7dS8uXWznOyaBwyT5T/yfWXCfBRKq3yAxpYsOP
 5Ijz1HTrvksdiyr1L6+hcLd/RF+PNsa7Hd8HWx9yTNmwTcDYfWTD4i05ZXKOEJxCBOyYcWPiQXt
 ZeWksC+yEu//T9l9Cr6/nXRDQvdc9wFElXvv1w/wNlTaokOBy0qXwmhm79pm0GNyoGFanEvM
X-Proofpoint-GUID: qzy4Sa14NO_R6hJ29RzMQREyrELhsOn-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_02,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 malwarescore=0 mlxlogscore=734
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506080122
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

On Sat, Jun 7, 2025 at 7:15=E2=80=AFAM Akhil P Oommen <akhilpo@oss.qualcomm=
.com> wrote:
>
> Add support for X1-45 GPU found in X1P41200 chipset (8 cpu core
> version). X1-45 is a smaller version of X1-85 with lower core count and
> smaller memories. From UMD perspective, this is similar to "FD735"
> present in Mesa.
>
> Tested Glmark & Vkmark on Debian Gnome desktop.
>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

fyi, mesa part: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/3=
5404

BR,
-R

> ---
> Akhil P Oommen (3):
>       arm64: defconfig: Enable X1P42100_GPUCC driver
>       drm/msm/adreno: Add Adreno X1-45 support
>       arm64: dts: qcom: Add GPU support to X1P42100 SoC
>
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi    |   7 ++
>  arch/arm64/boot/dts/qcom/x1p42100-crd.dts |   4 +
>  arch/arm64/boot/dts/qcom/x1p42100.dtsi    | 121 ++++++++++++++++++++++++=
+++++-
>  arch/arm64/configs/defconfig              |   1 +
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c |  38 ++++++++++
>  5 files changed, 170 insertions(+), 1 deletion(-)
> ---
> base-commit: b3bded85d838336326ce78e394e7818445e11f20
> change-id: 20250603-x1p-adreno-219da2fd4ca4
>
> Best regards,
> --
> Akhil P Oommen <akhilpo@oss.qualcomm.com>
>
