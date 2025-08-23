Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3982B3266C
	for <lists+dri-devel@lfdr.de>; Sat, 23 Aug 2025 04:19:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D77BF10E171;
	Sat, 23 Aug 2025 02:19:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="P5lWmfyS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FE9410E06C
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Aug 2025 02:19:41 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57MHZxjY005089
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Aug 2025 02:19:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=fcIfjfnVfGNbHcd7e8hiRw7YOvUEvWgkg1GUjTN07ho=; b=P5
 lWmfySx1GV6fNi12kQgJKZek+U9c3P52JpmDmOY48Ocz+Vsu2kk43xm5qHDzm6CK
 yzpFFVQbQkSqzadLg7vsn26qrGWAmaRnA9wbcWq+yx+6LGYYBn5XLFsN2HOJGeJM
 QpvtkJkx7wAjATs+0OyjmsV1JsRviokDqwro2d5hbRBee/DJYRSpJfN9+ToL4TuG
 5Zb86q87sydGk0B4G5xYo9VI8vREHkwkJMDx3mGPqlPBVHjhjETLHaykLs/CorAy
 5zLtcdSs3YHjW9OEg056dwQjq+Ehc6fYDgUDyJTCWGNowXAi1WT3gDJeqzQ0puZG
 7ag9UfSIIQSM3UdVSUdQ==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48pw3drymc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Aug 2025 02:19:40 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id
 5614622812f47-435de8351b9so3164293b6e.3
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 19:19:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755915579; x=1756520379;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fcIfjfnVfGNbHcd7e8hiRw7YOvUEvWgkg1GUjTN07ho=;
 b=Y0d4qgOo7+VsQP2IthFnBVGiZKCHQLu/CKD1m56uxyh8LrlWpGN0cpWDfo/wLYkQGB
 +T8gRJCcu2817HDnTmVyq1OlaMtrgts2/vTuBQTxVhzCiMfeTuDf5/boIwNgF19yjXHh
 +gjuSJSVWiBzyYSmnXsJmViilB25namRHM+kwnbcepv91M52WBiSbHmzfg88saMGZ2lL
 mv01sHrpaHBPyL4shmH/JVoXINHgRzzjhqaqi5/Pw+xCEM8ewYHZB5cP64LOSvxV6mFA
 PuKBwq6OKxOTrS8EHZ8rEozfsvX/d2zxtiNFEuC2tcXJYNC/M/vdP5gk/d09pHtlamlP
 uuEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXB+Ky302tQTWrjSbkU9ytj1+UOMark5P4eXYYJq7QDlziNpD+8lSTV84Cf8RKkNpJD/bNS0cYXOAw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcK84CntocKOPyN6j0sG2SIxxXkQMXXAuB4HXGIn0qLtpTQWP0
 NmBE/6IC4Tmy90cEHKuuKuy7ijh2MN20tGd5x3D1Toxth4Ql527NLtW00z1PH+aWux56xxRExx9
 GJlmp8f0NxcMRUpFEKmBqwI2dCMcdSBxZeOAkpA/98B2XFeCtUoU3+WkwRHcMzb9vK7uiNSOaUm
 bZcuBJfZ+IzliVwOYFqrMIrlVP0MG+On9p77JdxL6KeB/w5g==
X-Gm-Gg: ASbGncuErI2cOHK3BvFW2qIkz88ZGK35RrPmW2zLqlJmKOnwFOQP14mfdKQ+SKYEku+
 T4+f/vMmjWMhZrc36J2ozwHABPpL2nA6P0erbOXYqX9mpiPXOyF5JrxuOgMLUHQEsJw5P+ZKLkc
 3FYzbMZ89xexnj1P97KlSuO6YZHD0765NBDiWpFZ9/igBMboBfRUeA
X-Received: by 2002:a05:6808:f0b:b0:435:72ab:27f2 with SMTP id
 5614622812f47-437851b7dd3mr2277969b6e.13.1755915579418; 
 Fri, 22 Aug 2025 19:19:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5CjI/gv/KExsc+EMaEtCGFyVs0a7HKS9AHni4JNlhHKAlhjpKP3Uf4Wk/pxR2j928N9m53mdEp8t9ikFUYhI=
X-Received: by 2002:a05:6808:f0b:b0:435:72ab:27f2 with SMTP id
 5614622812f47-437851b7dd3mr2277953b6e.13.1755915579018; Fri, 22 Aug 2025
 19:19:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250823020919.9947-1-alex@ironrobin.net>
In-Reply-To: <20250823020919.9947-1-alex@ironrobin.net>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 22 Aug 2025 19:19:28 -0700
X-Gm-Features: Ac12FXzn5zBeb4qQ_eAhMiXm-81g1Hev67bQG7OISckEeYi_q2b9VPOFynHwe34
Message-ID: <CACSVV017Hv11uCmFzTgzZ524qGxQtdEyL93DBS9nnoH5ZPrddA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: fix race in Adreno header generation
To: Alex Robinson <alex@ironrobin.net>
Cc: lumag@kernel.org, abhinav.kumar@linux.dev, jessica.zhang@oss.qualcomm.com, 
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: ri8nviDl9UIctvw-y017XU8hysOiWxkZ
X-Proofpoint-ORIG-GUID: ri8nviDl9UIctvw-y017XU8hysOiWxkZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIyMDE2MSBTYWx0ZWRfX9m/IYVwNnAYr
 qoFe9qZLvZ2R7dD3D08UlRGXPmTRwwMwQFsjPGMX2+oZh79NSIQFEZHG5hKHpIuIPBP5bCyhskz
 sUm+WQRFP3Wy61g8OVCDYkcRHHeA6y9PBmoL9oAG4NwsNYWeFMMdWS6D7v5qw8sqoxGF7Y9iSBT
 03j6eDJqJXohIevwHNHBIKr3rDgZfDDcL71D4Ry9tpxGyqkTkMp1/fX7H/Ccl9aFWeO8vekPGPe
 aCLB6Z2zKjrdLtJNAGzVaAAa5PtkCqgU7WIGlpqXcLAhq33jgXnBXywSvzNjG+x1hOfUsFxl27+
 TAzkbjK3ayySEu1ROgNNBx3U3MFYj9GASNa9iTR056pZvLy51BY8Ix3/n55sdpuJYg/SqiShtL/
 jMLxJtXR
X-Authority-Analysis: v=2.4 cv=WId/XmsR c=1 sm=1 tr=0 ts=68a9253c cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=e5mUnYsNAAAA:8 a=foaXouvCAAAA:8 a=wDp8g09hmpcQW3DN4l0A:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22 a=Vxmtnl_E_bksehYqCbjh:22 a=lBkOZJTZZNyIbKe29SIT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_05,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508220161
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

On Fri, Aug 22, 2025 at 7:09=E2=80=AFPM Alex Robinson <alex@ironrobin.net> =
wrote:
>
> Builds can compile msm-y objects (e.g. msm_gpu_devfreq.o)
> before adreno_common.xml.h is generated in trees that generate Adreno
> headers at build time. Make msm-y depend on the generated headers,
> removing the race.
>
> Signed-off-by: Alex Robinson <alex@ironrobin.net>

looks like the issue is introduced by:
https://patchwork.freedesktop.org/patch/664829/?series=3D151864&rev=3D1

BR,
-R

> ---
>  drivers/gpu/drm/msm/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index 0c0dfb25f01b..1a918d44ac48 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -221,6 +221,7 @@ DISPLAY_HEADERS =3D \
>         generated/sfpb.xml.h
>
>  $(addprefix $(obj)/,$(adreno-y)): $(addprefix $(obj)/,$(ADRENO_HEADERS))
> +$(addprefix $(obj)/,$(msm-y)): $(addprefix $(obj)/,$(ADRENO_HEADERS))
>  $(addprefix $(obj)/,$(msm-display-y)): $(addprefix $(obj)/,$(DISPLAY_HEA=
DERS))
>
>  targets +=3D $(ADRENO_HEADERS) $(DISPLAY_HEADERS)
> --
> 2.50.1
>
>
