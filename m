Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F71AD28FEA
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 23:22:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53A5510E7CA;
	Thu, 15 Jan 2026 22:22:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EwS9dfMf";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KNPNbzGV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B26B10E0DD
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 22:22:53 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60FMImLN3838629
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 22:22:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=++9T+ZreIDbyL3ecbXA9o3o1CuOYwWv1qVO5IQ0Q36g=; b=Ew
 S9dfMfmURuxOliARPU123y2Oyz1MjThNR2Kd6AKCDc39J2yNb+FhZkBJ5jUvjJf9
 HnbwzzdTmIgflGY3834KzvcX7gTb3EXAkVAc4znFywLaF+WBRGo+7e2WJJlcExkU
 eV1z9QPPQlfw4E883NK8mZBOw0D/9hPE+aiiEtgVKAMUz1WkDGo9mR2QtwShIdcU
 h+DE6B9GhUVuFWnFpxo+4FJKY+SzpJKJKA1ICCjZWuQHAbpGqbyXBJ8ZXyPDqo34
 1PbinfbGMRoejGcuL/Lk3nz01mcfKyv6c8hWJ6d0YRtJOGCeP6yOaLskCWuCp4e2
 B00wzVc60FTS4YvYT7Hg==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq7cc095p-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 22:22:52 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id
 5614622812f47-45a5531f3f1so3039089b6e.3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 14:22:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768515772; cv=none;
 d=google.com; s=arc-20240605;
 b=QsN5xAZP3Tnr5RQD3u+6ljzX8p6P73gzZgVa3oXGkH/n7MdjYwUDjYi5vzSBCuAx+U
 w26uyLNGU+Rja5WOaKobRCLDew5NXIxkg22DPKRbcKG4HIAlbxC6DO4eNm0luLv2zqL4
 lw7tRSb+F9rgIwQW/H51LoIBhPxyR6NhtqpyYp3EtqUzc3u6d03LHbR2WTIhkaBpjlS1
 60fIKauCZuvrTYMyDmyw7Gu9pO+6CMVAR/DMHwCj276haxs4fupkIunuOSkiEzHAuYiP
 8AV/Eg90ihrDTrYREXh0/zRtjjQf/S2ESYgySqMA5rwn1e3BUtYFTg177LpFMtVEyp0s
 uBTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=++9T+ZreIDbyL3ecbXA9o3o1CuOYwWv1qVO5IQ0Q36g=;
 fh=qOmt3rFX69EMSdmuwWQeP9c9b9HrVLMkmgaq/fq+40o=;
 b=bhu+wy+8DbbbXF5yg14SXYYATmEFEncE7fXtJfDNSyqqQH1vQ4mkV3oKj19EeJ9ISE
 IZtODMqtlA2ypftOdx5xQ4jF8djoCuzR465Mit8jvGvL3CzlJX9ouYNvsGQGIZqR9EGy
 BsGRWS5B69Z5KOuffUaxdyaXSuBPI+RrZBoYrVqGMGzuWJPqFGMr2qOrpP7bIkygwkkB
 ryT5XeSXhvlX5IrgCw8oIRmUEzahKivm2ngJjbHcuevqttzwdSP/G3GDTPcQmhhh7+uQ
 vLoEXE6JN/73F8Lsd83C2QeUS9aF+Ns8cw83wG/25AJXCxPj4qTmE7kBE7psVO1Xk0EE
 m25Q==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768515772; x=1769120572;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=++9T+ZreIDbyL3ecbXA9o3o1CuOYwWv1qVO5IQ0Q36g=;
 b=KNPNbzGVrgjkJZnvWseBd89dutDEqye2FDdwPYQ0lNpB0zcm2vE4/56IWw1OeNf+16
 EdmSs9Tq9s9D7fonV0GnXjE9P9AVEPqhZZ8MjSO50iZewCQVa/98NKQ9lVmzT6UZbI9W
 +OVjGNWLMegguy+2Z1LpXBUQIBPI4aWCE/ZU637hFFlHIayfV6sUH7RZA8CWBTVVZ4tI
 NA0G79BflUZV0neloYDRVoiJojZ+YoJyy2EEe3SVWRy9RKKYa0P4rdYQIrlkI700OJwB
 KjG7M3OpkHid7dFGMCyLnaodZR6pzccMY+AWqWuTM6aZE0+Mq5cJVVjkNhx8j6B4gBw3
 Nd6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768515772; x=1769120572;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=++9T+ZreIDbyL3ecbXA9o3o1CuOYwWv1qVO5IQ0Q36g=;
 b=xALXthZKgvqldhr8yA6p0f1HeX39g+x75WaE4WUcQkH2zdyNigp7rge0V4PuFQLPdG
 vOYpJVW6MJ6lXWo4MRJLnuRynrIzN9gzQnw8E00BnWK8TRy+fT/qYt3HeB1pZk4OkG+4
 IQdHVAA0MmR3aAodjFAKl7lxDezU9sh/qdTS9vwFDn+TPbug0i72Mla2JCqNv3wMN5tB
 2vG5fT67rGiQgjOhGGEhuuB2JYWLPih5eUWNhdKMTFZdmaeOUpvSuwuHzkRt6lpdg7/Q
 qmqsO8mOknlb6NM54hFxNIME7Np/JTMeR0rqCV7ZU+Vb8xuVLL1vaVNFfAQr94J3CLPy
 np8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyj8w0GCGehhdyZbRyzKYGL6D58QJwH+wIjqZqmQAleA/ik1QuO5wfWwOnesx93WR1Ip3gzxo6WxI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzh1VtBT/2gMB4IRCMwp7cVfUMCeRioB3FWGyBXOjsLQjp0nxJr
 d2lYptxxDjJrbuN1ikM0utgeVPXaVac6hH2j4kaWTz0ERtY7qy+U+WYr3anUM8/YKP9q9fl1hT+
 ljOxYcx4dgPgxrLgc9Lc3LWbwJlALZuOpmSytEHP0ZSxZUfcO0/ackk6Q/Y97mICQxBSGUst86E
 55QCcCHUYExKDse4WdiajiZKisV62iJYeoGfHpc8+/YgEN0w==
X-Gm-Gg: AY/fxX45SMawTECwMJeWv2MQFyyP4JVm2hInvRvhU5u3VLbWAAvifF8F6kUCJK0Ak4L
 Ny7uCzMd/71mYuDa7eo37OS7n8RcRT6gEEdTZ87iL6aAyTvzPTlcAOD87BwHAHko+qzsS/C2yNg
 nPhFRZMAO1G7frwJ+/L+wlI9uWfzJfWX096ZFuHtMupc68bZ5petSdJb/xN8vzwHU1ZQ==
X-Received: by 2002:a05:6808:1a01:b0:45c:832a:cf43 with SMTP id
 5614622812f47-45c9be84eb5mr563357b6e.14.1768515771775; 
 Thu, 15 Jan 2026 14:22:51 -0800 (PST)
X-Received: by 2002:a05:6808:1a01:b0:45c:832a:cf43 with SMTP id
 5614622812f47-45c9be84eb5mr563321b6e.14.1768515771312; Thu, 15 Jan 2026
 14:22:51 -0800 (PST)
MIME-Version: 1.0
References: <20251231-qcs615-spin-2-v6-0-da87debf6883@oss.qualcomm.com>
In-Reply-To: <20251231-qcs615-spin-2-v6-0-da87debf6883@oss.qualcomm.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 14:22:40 -0800
X-Gm-Features: AZwV_QgUato_Mye3KIAfma_metaK0S7kEx5joU_nnqK9vXWwCVlcPa3slMjygkk
Message-ID: <CACSVV0006wVK-JWweuNYAfu-a9rtn=zp93sey1srPieGEaJWRg@mail.gmail.com>
Subject: Re: [PATCH v6 0/8] Support for Adreno 612 GPU - Respin
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
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
 Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jie Zhang <jie.zhang@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Qingqing Zhou <quic_qqzhou@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Jie Zhang <quic_jiezh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE3NSBTYWx0ZWRfX54FkZBDo7Z7r
 ZlqyrQfRxBF4l/AjnIHJcgOTsmytAm9h5GTXmnSnWGz9PHvmYf/u4hOCTOwrFluiSVHnmdtpvqS
 BxmPjBptUIP5ceHUhLTcw1EWvpapv4pQDcQ2D5U9ooBX4RiNeCJnpKuv5EzJjNXvN70NsUbxeg1
 QXCMqmhJR2IpUmNi7doTWtqs5sDgFtgiAulQ10XnOSzzIwxv7mRY++Mw1H2YhHoPXTbBLcwO74D
 lEO5BDieWuc76e7Y64O/JW6nKaOVxntz5FkRdvYanWjipbsH6T5ydBhqAD7B2nIRi8YlVz+EcBY
 7p7o4uG7IcXGrcicQOfFR94P6CRmKOOrQ8ykHESnS9Ublm4EHgGtuTyQ795Zvj8E9pIocPYZToh
 uTcNy07hKSRaiQ09JExsC8dgSBs33jeCntGJkC+rIR3n+AywKmDtyHS9z7aC5pX1QTD9eSxU9aq
 44wke+OPVWT+6qBaIYA==
X-Proofpoint-GUID: nBYJahLZCtzRo9vMoxWVkFuwy9DVHfig
X-Proofpoint-ORIG-GUID: nBYJahLZCtzRo9vMoxWVkFuwy9DVHfig
X-Authority-Analysis: v=2.4 cv=Z7jh3XRA c=1 sm=1 tr=0 ts=696968bc cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=mvrZoGBVeotMckK10bAA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150175
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

On Wed, Dec 31, 2025 at 12:45=E2=80=AFAM Akhil P Oommen
<akhilpo@oss.qualcomm.com> wrote:
>
> This is a respin of an old series [1] that aimed to add support for
> Adreno 612 GPU found in SM6150/QCS615 chipsets. In this version, we
> have consolidated the previously separate series for DT and driver
> support, along with some significant rework.
>
> Regarding A612 GPU, it falls under ADRENO_6XX_GEN1 family and is a cut
> down version of A615 GPU. A612 has a new IP called Reduced Graphics
> Management Unit or RGMU, a small state machine which helps to toggle
> GX GDSC (connected to CX rail) to implement the IFPC feature. Unlike a
> full-fledged GMU, the RGMU does not support features such as clock
> control, resource voting via RPMh, HFI etc. Therefore, we require linux
> clock driver support similar to gmu-wrapper implementations to control
> gpu core clock and GX GDSC.
>
> In this series, the description of RGMU hardware in devicetree is more
> complete than in previous version. However, the RGMU core is not
> initialized from the driver as there is currently no need for it. We do
> perform a dummy load of RGMU firmware (now available in linux-firmware)
> to ensure that enabling RGMU core in the future won't break backward
> compatibility for users.
>
> Due to significant changes compared to the old series, all R-b tags have
> been dropped. Please review with fresh eyes.
>
> Last 3 patches are for Bjorn and the rest are for Rob Clark for pick up.

I guess you meant the last 4 patches are for Bjorn?

BR,
-R

>
> [1] Driver: https://lore.kernel.org/lkml/20241213-a612-gpu-support-v3-1-0=
e9b25570a69@quicinc.com/
>     Devicetree: https://lore.kernel.org/lkml/fu4rayftf3i4arf6l6bzqyzsctom=
glhpiniljkeuj74ftvzlpo@vklca2giwjlw/
>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
> Changes in v6:
> - Move the rgmu register range update from patch#8 to patch#6.
> - Capture trailers
> - Link to v5: https://lore.kernel.org/r/20251226-qcs615-spin-2-v5-0-354d8=
6460ccb@oss.qualcomm.com
>
> Changes in v5:
> - Rebase on v6.19-rc2
> - Make the reg list in A612 GPU's binding doc stricter (Krzysztof)
> - Link to v4: https://lore.kernel.org/r/20251204-qcs615-spin-2-v4-0-f5a00=
c5b663f@oss.qualcomm.com
>
> Changes in v4:
> - Rebased on top of next-20251204 tag
> - Added a new patch to simplify gpu dt schema (Krzysztof)
> - Added a new patch for GPU cooling support (Gaurav)
> - Updated the gpu/gmu register range in DT to be more accurate
> - Remove 290Mhz corner for GPU as that is not present in downstream
> - Link to v3: https://lore.kernel.org/r/20251122-qcs615-spin-2-v3-0-9f4d4=
c87f51d@oss.qualcomm.com
>
> Changes in v3:
> - Rebased on top of next-20251121 tag
> - Drop a612 driver support patch as it got picked up
> - Rename rgmu.yaml -> qcom,adreno-rgmu.yaml (Krzysztof)
> - Remove reg-names property for rgmu node (Krzysztof)
> - Use 'gmu' instead of 'rgmu' as node name (Krzysztof)
> - Describe cx_mem and cx_dgc register ranges (Krzysztof)
> - A new patch to retrieve gmu core reg resource by id
> - Link to v2: https://lore.kernel.org/r/20251107-qcs615-spin-2-v2-0-a2d7c=
4fbf6e6@oss.qualcomm.com
>
> Changes in v2:
> - Rebased on next-20251105
> - Fix hwcg configuration (Dan)
> - Reuse a few gmu-wrapper routines (Konrad)
> - Split out rgmu dt schema (Krzysztof/Dmitry)
> - Fixes for GPU dt binding doc (Krzysztof)
> - Removed VDD_CX from rgmu dt node. Will post a separate series to
> address the gpucc changes (Konrad)
> - Fix the reg range size for adreno smmu node and reorder the properties =
(Konrad)
> - Link to v1: https://lore.kernel.org/r/20251017-qcs615-spin-2-v1-0-0baa4=
4f80905@oss.qualcomm.com
>
> ---
> Akhil P Oommen (3):
>       drm/msm/a6xx: Retrieve gmu core range by index
>       dt-bindings: display/msm: gpu: Simplify conditional schema logic
>       dt-bindings: display/msm: gpu: Document A612 GPU
>
> Gaurav Kohli (1):
>       arm64: dts: qcom: talos: Add GPU cooling
>
> Jie Zhang (3):
>       dt-bindings: display/msm/rgmu: Document A612 RGMU
>       arm64: dts: qcom: talos: Add gpu and rgmu nodes
>       arm64: dts: qcom: qcs615-ride: Enable Adreno 612 GPU
>
> Qingqing Zhou (1):
>       arm64: dts: qcom: talos: add the GPU SMMU node
>
>  .../devicetree/bindings/display/msm/gpu.yaml       |  89 +++++++++---
>  .../bindings/display/msm/qcom,adreno-rgmu.yaml     | 126 +++++++++++++++=
++
>  MAINTAINERS                                        |   1 +
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts           |   8 ++
>  arch/arm64/boot/dts/qcom/talos.dtsi                | 149 +++++++++++++++=
++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |  14 +-
>  6 files changed, 357 insertions(+), 30 deletions(-)
> ---
> base-commit: 2408853dde584f01950a0f976b743739cce30eca
> change-id: 20251015-qcs615-spin-2-ed45b0deb998
>
> Best regards,
> --
> Akhil P Oommen <akhilpo@oss.qualcomm.com>
>
