Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9E8C36F7E
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 18:11:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E4F610E274;
	Wed,  5 Nov 2025 17:11:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dv1Ko+wN";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QJzeSnsw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9968410E274
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Nov 2025 17:11:47 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A5DMZjp4011438
 for <dri-devel@lists.freedesktop.org>; Wed, 5 Nov 2025 17:11:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=EELpuX0zlx92nLlvi+qer6
 ygD1MEAP7erC3Z3YTSLQ4=; b=Dv1Ko+wNu/r2h+/Up7YJyN6X/5vt9KsW0EY5L8
 yQ9U8Iv8Roh2OWHHGPEhm8pLrxmFQPLARgQAgi4SDRgvqEtdr/HGIBTX9fHSTZ+/
 DvR6PfLR7+BomEkm1E7Ffcin3vh7HoFcWGVZoOXvRy8yvna23ctAjLzEFkNvMEtK
 /KiZlYFHtWVabqvkSUQfRtIxuXlWPFbl7zSxJIMEwTrkt116rEABt/IMumpTTbNO
 hfJ9ReL5YaJr9v04clrcrs4sQyATrIQJFiIVOtJhlyCxaGHu1M3tzDlKA5Iud1tc
 zuIgbLWFAsSVzByN7VrDTaKhHD5Xllvt0D05jrUSYae1dulw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7ynwt0yr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Nov 2025 17:11:46 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-34029b3dbfeso111387a91.3
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Nov 2025 09:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762362705; x=1762967505;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EELpuX0zlx92nLlvi+qer6ygD1MEAP7erC3Z3YTSLQ4=;
 b=QJzeSnswEUEBEcR5ppG85XpBXhOxLEFL550OlbW0gtrVpzefraHW3weJKg+Lb5RuzM
 Zj+6z7WvV8Nxd/bFCK+Hh0ol92OExOP3mN8w45ekEpzMl1Hn+jlLZCyBH4ABrsibtAh3
 nCRg8Ogxm+CHx/xxjyXzykg/H2BXQizceI1SzvFHeyXESS+nOvYcP9InYsxL/h0lO91z
 /MHvox2SGFh7Sod4h17Ef8fgzwO8ulufob3PIP2fTQzxR29xw9HS3tB94Ne6F2N5uRo/
 /ABXTzr/bPKFIL7bhM+2NUgEft9hSDnvb1P6WEUdVyUJ9cQ4OYHIujilSCXHGvibQb4B
 vkpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762362705; x=1762967505;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EELpuX0zlx92nLlvi+qer6ygD1MEAP7erC3Z3YTSLQ4=;
 b=nsIxaDOyDQFZK3Xl/wZrM0uy8+o9uej1nwH2ZqB/3WxS50MmAHK/2dzOA56ggrCGXh
 s5/hSEwZ1ro7jD+60P7buKbzx3a7oRJ/BzOD1rUUoH1fozF1oanOQPdM6VCl85aOVreZ
 btYVikOLwF1CWVO3wTYNBUo6HMO9WsiPI/ondzn1QhEjSFMdMsrausm8WBd+o+8bFD97
 pV7xjs15+kbXn8yPCoyDVnI7bMMjgKBRdlgzCpfPukPxsk3/NDGm5kd/l1r3yvgBAlH5
 VtorQ52qFi+1rFp8lN98MmPtL2wrc54d8KQ4gYgGho2h1ilsCOlyQTc2Lzn33snGjeoN
 kZfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5CyuFCswgAX1bkxDbQxC0fFtyirbglLSuoLXuwEoHDPk4DsROWhWA+LQOlDnoHMm4o6dgEznUhs0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzrTZp1z/hSPjNAh4Hecv9xceuw6WDmnG0f4zDN5Z0eT8VbGB9l
 Y2R/znE3enVoJrtsxH46o2TuGX1eETzpz4sTZ73srXzLnSJ5C6OVkn5JpWsa/+P87Ea+PAlN7Jx
 WZUZA5JFw+h3GoQ4NTmRHy7PPw5k3Jm18OgWC2iyV/mbMbDQsAiToREvM9i8q6mFcC0JOag8=
X-Gm-Gg: ASbGncuSMeZ7XoLafm5UKL2gw4uOskbI83oHKmsUqHroIa0znDlXJOQSe3/vtFNUHXw
 LTARwxfweo7TFyuokWb3ibXBJW8qNy3/itg8rxZm0iR2B1d8uJlVEDUiyyEkgS84AEabxu3sjZy
 JwasJ0aVWR1Y/7rzbL+whojCM4u0v/h8ss7wxe4RO9Iii+3M10zEb2Pp3z4P97fY9ONUZ7RXvM0
 KWue7H4fTJdhwAPxMBIkq3EBExjCcAmGWvml/W8j4HtcCehO0Zsza94PJej8KoRO8P2IDs9JP49
 jEiTyisuhfgdVxCUO/yJOx+Zh7eAxXwDgAnYbIcyYqaDi0zJrXXXSgfyypAux9mg3M3LDIPzilw
 k6NiDwjb8LPFtJWKbM3P3EkY=
X-Received: by 2002:a17:902:e801:b0:295:2c8e:8e50 with SMTP id
 d9443c01a7336-2962ad88b6dmr59633705ad.31.1762362705261; 
 Wed, 05 Nov 2025 09:11:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEHZzR0uofWuHqxMnU/OQ/FAyWhZK+U2W6I26BEyXNRfy6sU6QXraSVv3FBQHO5puHi3rdUUQ==
X-Received: by 2002:a17:902:e801:b0:295:2c8e:8e50 with SMTP id
 d9443c01a7336-2962ad88b6dmr59633005ad.31.1762362704563; 
 Wed, 05 Nov 2025 09:11:44 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29650c5e3c5sm813955ad.43.2025.11.05.09.11.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Nov 2025 09:11:44 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH v8 0/4] DRM/MSM: Support for Adreno 663 GPU
Date: Wed, 05 Nov 2025 22:41:31 +0530
Message-Id: <20251105-a663-gpu-support-v8-0-62a7aaa551e3@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEOFC2kC/3XS247CIBAG4FcxXC+GGY71yvfY7AUUUJK1raVt3
 BjffanGQ2K9/MnMN0DmTHLoU8hkszqTPkwpp7YpwXytSL23zS7Q5EsmyFCwCjS1SnG660aax65
 r+4E6EFrWBo1iipS2rg8xna7k90/J+5SHtv+7TphgPr1j5h2bgDKKMgbLI/dK+O1xTHVq6nXdH
 sjMTfgggCEuEFgIbrzlBrlQlX4n+AvB2QLBC+F8BF/VQTGEd0LcCcnM4i1EISrtUTmHIETYtjm
 vj6P9LcTh6cinU7FqwZHF0QqiZdZo5eIHR704sPQkVRzpLUiD2qGoPjj64QAwueDo4oCro45QS
 lAuOJfbFvSh/FpOw20ViLM50LkoDZtVE04DvU8pHZd/FbJ5KokCAAA=
X-Change-ID: 20240917-a663-gpu-support-b1475c828606
To: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Connor Abbott <cwabbott0@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762362697; l=4032;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=1HrAKtyYUdrVyuuovWuMNnd56RDUBrlDUBzWZKbtq7k=;
 b=HY5muJ0uQs3Vy3ZHUcicSlvThRDhabGeb+pkLkSX55GMDNijjq3RYON3kzGlE0NvVB+7SqOeZ
 48khBmEubAzC9k4acvrKq0zdc773cV1i1d0Q9YXAR93kCZR7RIJ+HVx
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDEzNCBTYWx0ZWRfX+9y12s9NPVYX
 MbEXhK2qkxsN6y8R98pUEodW5y9bYsNzGcQAE40JydilNW5tjfq1Uuphl5MmSMwNrqnV7rUMDpd
 IdMaz5/NF1FFa2dUZDXFoXvdSzwZUGNsC6jrK4kKiVbXzrazc8bBaG3BTihgJon1VRfzqCQ31O/
 wM7SvQUdWSJM4fipyQi/yhBoF5v3k57PBiwpPzF49IixTlksGetCN38D8uoqw49JaoAJJAahyR3
 c49NyeEP7breHWQbFVuHkQr+Ep9L2jMbUcXj+BAGtbGEaQHm+r+UCQZW40718YVzu6LSk0stFDf
 NKkMu7sxVCIVNue+UVyGArzSJbxO29Rjz44sBJo+HjQdTD/OT/tRIyrldfRUY1S51A7mpWTCWCJ
 TpG6T8CboyZspHY6ShnD0g8drgnrfw==
X-Proofpoint-ORIG-GUID: Iev5AfOz8OfFwou9gUnERNr49ksB-1Nn
X-Proofpoint-GUID: Iev5AfOz8OfFwou9gUnERNr49ksB-1Nn
X-Authority-Analysis: v=2.4 cv=IpETsb/g c=1 sm=1 tr=0 ts=690b8552 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=tVI0ZWmoAAAA:8 a=QyXUC8HyAAAA:8
 a=e5mUnYsNAAAA:8 a=uS2UVPQWM95stPRVMV8A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
 a=-BPWgnxRz2uhmvdm1NTO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050134
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

This series adds support for Adreno 663 gpu found in SA8775P (Lemans)
chipsets. The closest gpu which is currently supported in drm-msm is A660.
Following are the major differences with that:
	1. gmu/zap firmwares
	2. Recommended to disable Level2 swizzling

Verified kmscube/weston/glmark2-es2.

Apologies for the back to back rev bump. I am hoping to get this picked
up for v6.19.

All patches are for Bjorn to pick up.

To: Rob Clark <robdclark@gmail.com>
To: Sean Paul <sean@poorly.run>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Connor Abbott <cwabbott0@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Gaurav Kohli <quic_gkohli@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org

-Akhil

---
Changes in v8:
- Corrected patch#1 subject (Dmitry)
- Dropped the patch for qfrom binding doc as it is already picked up.
- EDITME: use bulletpoints and terse descriptions.
- Link to v7: https://lore.kernel.org/r/20251105-a663-gpu-support-v7-0-1bcf7f151125@oss.qualcomm.com

Changes in v7:
- Rebased on next-20251105
- Dropped drm-msm speedbin patch which is already picked up
- Picked up trailers
- Link to v6: https://lore.kernel.org/r/20250910-a663-gpu-support-v6-0-5da15827b249@oss.qualcomm.com

Changes in v6:
- Keep the efuse's reg range 4K aligned (Konrad)
- Update GMU's opp table to bump frequency to 500Mhz (Konrad)
- Link to v5: https://lore.kernel.org/r/20250909-a663-gpu-support-v5-0-761fa0a876bf@oss.qualcomm.com

Changes in v5:
- Remove unnecessary labels in the gpu cooling patch (Konrad)
- Update the RPMH corner for 530 Mhz
- Wire up the gpu speedbin node to the gpu
- Link to v4: https://lore.kernel.org/r/20250822-a663-gpu-support-v4-0-97d26bb2144e@oss.qualcomm.com

Changes in v4:
- Rebased on top of another series which renames DT files
- Enabled GPU on IoT boards as per the latest definition
- Picked up SKU detection support
- Added GPU passive cooling support
- Link to v3: https://lore.kernel.org/r/20241030-a663-gpu-support-v3-0-bdf1d9ce6021@quicinc.com

Changes in v3:
- Rebased on the latest msm-next tip
- Added R-b tags from Dmitry
- Dropped patch #1 and #2 from v2 revision since they are already
picked up in msm-next
- Link to v2: https://lore.kernel.org/r/20241022-a663-gpu-support-v2-0-38da38234697@quicinc.com

Changes in v2:
- Fixed ubwc configuration (dimtry)
- Split out platform dt patch (dimtry)
- Fix formatting in the dt patch (dimtry)
- Updated Opp table to include all levels
- Updated bw IB votes to match downstream
- Rebased on top of msm-next tip
- Link to v1: https://lore.kernel.org/r/20240918-a663-gpu-support-v1-0-25fea3f3d64d@quicinc.com

---
Akhil P Oommen (2):
      arm64: dts: qcom: lemans-evk: Enable Adreno 663 GPU
      arm64: dts: qcom: qcs9100-ride: Enable Adreno 663 GPU

Gaurav Kohli (1):
      arm64: dts: qcom: lemans: Add GPU cooling

Puranam V G Tejaswi (1):
      arm64: dts: qcom: lemans: Add gpu and gmu nodes

 arch/arm64/boot/dts/qcom/lemans-evk.dts          |   8 ++
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi |   8 ++
 arch/arm64/boot/dts/qcom/lemans.dtsi             | 174 ++++++++++++++++++++++-
 3 files changed, 184 insertions(+), 6 deletions(-)
---
base-commit: 185cd3dc1a12b97194a62eba9d217d280ef74135
change-id: 20240917-a663-gpu-support-b1475c828606

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>

