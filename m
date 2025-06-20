Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC96AE144E
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 08:55:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A77210EB0E;
	Fri, 20 Jun 2025 06:55:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TGTRMjbL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F5DB10EAFF
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 06:54:55 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JFsKWE028983
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 06:54:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=ScyFz0DOvxXgWzbjqqOuOf
 3WOA+3QVWgFuzW42VFYnA=; b=TGTRMjbLx0KFwUzJWzDTmsEJoLwa9VEIFuwp5j
 jsU7zWmJ/IhoDXWw9THQo4l6FfivNaSyWcXVb1KPs2wCdQiDcpN3iBlD5OqvGZg4
 aIoRsLDP9x/izQqFTQ7qdL5i7yem8oNf55B/s+dJH3g3Ugl0B76miQTXN6XTcLMo
 1UmPUYm0O8a21CsYVxPJKOkra/1p+Z6J4Voocsx8gIhXE/gzYYCFTU1ccdYZuIcR
 eNOvRfdOks3Qq3lNkFQsi9keoRVyL0G5jhL2seOKhtDFvqZSWb0196EieY0Myhpb
 OP8O8dSmTtbzFCb29jAyduopU8Mhk1avUI6gN02ECVyrb9Vw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hdae33-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 06:54:54 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-235f77f86f6so16859295ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 23:54:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750402494; x=1751007294;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ScyFz0DOvxXgWzbjqqOuOf3WOA+3QVWgFuzW42VFYnA=;
 b=Admxr9/djY6EqtFiKHlcyBDqqva3Vs70DZECOLlfZknOAw3xyuUJkHbV72HW7DiRU0
 BseWRKhzfYqJLMIpIlIR9RxxG+5kjLslQtESuMEid7QTqeZ32sk67PwY+0Pty9IRNLdQ
 gLLiyZ7W9vnXnbz8HuQsvha+hkJ+h1NaOtsUFFi2w/xdPlE60GrxKsHyX9hrg6h/DgGN
 60HbI0NqGGFmhrbprXimTVLAOQ6BWmfsKnPCWwnwN/WrxQy7eHGCMbtJk7sV76eKrnO2
 Q6vDFCYcIsp4OY9BudWenintW81c7Na1UgUX3ANl+sXEsyfwDzmBoQoH2Z5y8VYiBt8q
 DPxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWd7OuWz3z++IVray/bC8TUcahTNQc036bnJcoiFBS81bqVir6NXkdAb7WN66jo+dNow3A2c57N2E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxmQGyv9056LMpdSasoorFuDveCD4da7zBJNm0qJ3gAYG7e5AM4
 HS7pOqyjC7bZPERT5bg+JqkBnsTB0WwoWXLASljx/H3XW5dxCaX16VywlmUQe/T8Bl6TPO8yj0S
 DSePY/jGrGlvyq0GIv6/QHsVEUSQWpJgQDdk2WC+SE6NZqa2uhfvWj5OW0M+Lc2XSLx6vTLA=
X-Gm-Gg: ASbGnctEDpizvfXUZPjor97fyqK3yfXHHkMQQFrNhu4iGKEZExkwuDs8HW67vrP9Tkz
 qZ0M4qxdhGAHiXNeS31vKs6FXqQDgqUY4muaqTFOcxYxREni9tU7zTQSXthK/b2l5UN8ls/HFMo
 Ty8wVoOTMsn8+/G1JRxvcOfb5b1yOIi4JAAN6AD/PEPwnfFhu+6lhZudHM9EFbz2r3i5cQbJM3j
 A0PCrItM74fUxKFa3tk/EVpGkMVkc4A8muJGg211JMIKmZXfyTkq+1hhTL1C1GQG34ExMQmNgzx
 uBwI1LoqEh/4lWJk41HZfmmqgo+YxBYw
X-Received: by 2002:a17:903:1b48:b0:236:9d66:ff24 with SMTP id
 d9443c01a7336-237d9775b0emr22386255ad.8.1750402493804; 
 Thu, 19 Jun 2025 23:54:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkIYHi1UT3lT3VJ7eStgc3F3RXk7Q+Nga2d2//COTAVYVplhFGtVV1Et8O4RY+Oflc3Ja1aQ==
X-Received: by 2002:a17:903:1b48:b0:236:9d66:ff24 with SMTP id
 d9443c01a7336-237d9775b0emr22385985ad.8.1750402493406; 
 Thu, 19 Jun 2025 23:54:53 -0700 (PDT)
Received: from [10.213.111.143] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d8701c0csm10636185ad.223.2025.06.19.23.54.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jun 2025 23:54:53 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH v3 0/4] Support for Adreno X1-45 GPU
Date: Fri, 20 Jun 2025 12:24:27 +0530
Message-Id: <20250620-x1p-adreno-v3-0-56398c078c15@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKMFVWgC/23OzQ6CMAwH8FchOzuyDgTk5HsYD/soskQYbrhgC
 O/uBA+YeGnyb9pfOxOPzqAndTITh8F4Y/sYskNCVCv6G1KjYyac8SMrWEYnGKjQDntLOZy04I3
 OlchJXBgcNmZasct1yw4fz2iOW5NI4ZEq23VmrJNQpFBQp4B8hlvjR+te6yMB1unvzXJ/MwBlV
 FQoKtZkEip5tt6nj6e4f9g0llULfCcA/Ag8CkdW5idWSpRS/xGWZXkDHmfOqRoBAAA=
X-Change-ID: 20250603-x1p-adreno-219da2fd4ca4
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750402486; l=1837;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=5GnSOkfYQ0nmtlGuh6J0RyLLVdXBVvnNx3z3QB9r3z8=;
 b=knES3iwBctiGuUKxjFzfjxdZPB02hxoct8ZdKICWABwsiJgsGhwDdTtm4RUIyGwuSVqA3bB2J
 4tIPAmjr4/MA/8qi0hRBvUAC9WXYylb9dY1lGiiUKJYTd7f6Oj3TKpk
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDA1MCBTYWx0ZWRfX490favEVfcV9
 e7xEzvFGVCYIznP7QSvD+HX2gJpenC8mcp4wfVo7dJ9+eFwQ4DVZRGSiYeeocjIh4yddtDOT3Cf
 M3SMx55mG8gohqhxjhJu2RjH3FALnJAD4s3IQFlO2x6LlrNW/cMrEAxDiom3L2ZJGoUTuSTDVQz
 eBs2Fp0jLZZPsieK3brHr9r13YoKMnsuL2pSyNSJlbZmiuydtTyhoiU4Lg507MuZqlhDumljj7G
 5M4fpYjqEDEmwtf4LrRbLaw8u7AIV3CGQgBW++QGBtbgD/ITDWKNORfHY00k1U2XbalDkDxBLO0
 K7ZfctTFoM+w+ytBBOXGI0X9La9e5/ipgCU7qSdWt9rqNl4Cj92JIeookBfNWX0uhcAvn5pGt2D
 ocr0IoCZrtFEU5j/HPCHvDmStVTHhX8TY//ETUi9Kfmt5cVhHQV9Tf1q2ou3OXXHKCjabGP7
X-Authority-Analysis: v=2.4 cv=PtaTbxM3 c=1 sm=1 tr=0 ts=685505be cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=vb8sKYNj6oKrwasmUUsA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: hBPjcdM0Oqz4MlmT_-vojFKap1RPJj7I
X-Proofpoint-GUID: hBPjcdM0Oqz4MlmT_-vojFKap1RPJj7I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_02,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506200050
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

Add support for X1-45 GPU found in X1P41200 chipset (8 cpu core
version). X1-45 is a smaller version of X1-85 with lower core count and
smaller memories. From UMD perspective, this is similar to "FD735"
present in Mesa.

Tested Glmark & Vkmark on Debian Gnome desktop.

I think Bjorn can pick the DT patch and Rob Clark can pick up the rest.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Changes in v3:
- Rebased on v6.16-rc1
- Fixed speedbin table in drm/msm
- Corrected the regex for the adreno opp node (Krzysztof)
- Replace underscore with hypen in DT node names (Krzysztof)
- Link to v2: https://lore.kernel.org/r/20250611-x1p-adreno-v2-0-5074907bebbd@oss.qualcomm.com

Changes in v2:
- Skip 'delete-property' wherever it is unnecessary (Dmitry)
- Reorder dt nodes alphabetically (Konrad)
- A new patch#1 to fix the dtbs_check error
- Link to v1: https://lore.kernel.org/r/20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com

---
Akhil P Oommen (4):
      dt-bindings: opp: adreno: Update regex of OPP entry
      arm64: defconfig: Enable X1P42100 GPUCC driver
      drm/msm/adreno: Add Adreno X1-45 support
      arm64: dts: qcom: Add GPU support to X1P42100 SoC

 .../bindings/opp/opp-v2-qcom-adreno.yaml           |   2 +-
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             |   7 ++
 arch/arm64/boot/dts/qcom/x1p42100-crd.dts          |   4 +
 arch/arm64/boot/dts/qcom/x1p42100.dtsi             | 120 ++++++++++++++++++++-
 arch/arm64/configs/defconfig                       |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |  39 +++++++
 6 files changed, 170 insertions(+), 3 deletions(-)
---
base-commit: d9946fe286439c2aeaa7953b8c316efe5b83d515
change-id: 20250603-x1p-adreno-219da2fd4ca4

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>

