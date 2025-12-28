Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB4ACE48F3
	for <lists+dri-devel@lfdr.de>; Sun, 28 Dec 2025 05:02:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C76E111A863;
	Sun, 28 Dec 2025 04:02:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uni5/zho";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RauoAGd7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B16E10F8D4
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 04:02:42 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BS1heVF824107
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 04:02:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=yjyk35jIf9nu7s4uHxWxaY
 Z7kPYBr0xMnxEiqxa1se8=; b=Uni5/zhokroNeQkSls4taIDgp1cOar5rrxxwJy
 WiE4CFm3U1dMvN+MWj0InHaaBkI7TiIMjhF6KyFX8YzHMANA5o/UNF4on9bMYPnW
 i7QKoY6rV+R92OOI+LU1g46W7K8DAQ8Lui4ZdkltFxU4DDfbQcUxefww+lIVrgdI
 6vcRsnPTiLc1+h2pxQe5ngalIRRNtLeZWDVMdFrP15Vf980+i5nDevouTEMyQq2P
 m05yMAQUnP1Vxew08HDYbbNxZFd24llnuO1+dNArG52V4qRywGDXZtQs9qbXlUOL
 ZoeB6DSSvqIh/Ec6iPBW1yH/E40aOa1qtHpWHqqhCdfiU2Mg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba4tnste9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 04:02:40 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ee09211413so216230191cf.2
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 20:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766894560; x=1767499360;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yjyk35jIf9nu7s4uHxWxaYZ7kPYBr0xMnxEiqxa1se8=;
 b=RauoAGd7hnp0S0MDJIWB8eYBrfvhuAU7GA/suDm12FQ5b7iPVU6b4eCYW97CqlCVdA
 4tjC8+GVV9K7iGGgtqBrtLKWknbOB+WXW/YSVoc4k9jw3UUrXw7FJ96tmmUEjrmLOLxI
 Gtj2aFJ2JdpbrA1TJreXRKC1bXLuuKAW0zlkOWmvTstfoKxqhal0iL2WHCGXp4DX+ppU
 NZ4uGFnWsbeJYXbldAOsc1otKBaVRqQ4OrQGZobHpmdJ8enMnAH3PtxLej5ODsl9ydbE
 x2OjW/FhQTQ5Lf/WOOb0b57NSg4Fb36VwoDqC2FAwZkEenzcmcZGustYoYoHg1W2RjOE
 sbZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766894560; x=1767499360;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yjyk35jIf9nu7s4uHxWxaYZ7kPYBr0xMnxEiqxa1se8=;
 b=uA4nFsyU4RMBvfxhxIRHgplwyo0l3e1HmjKWvFiHwFsatz8TpMCUNqaULOT9qkyFaq
 sWFi65CbnS1yH1g2/kDyYpHbz1mmM/+xs/CST2bihCTSqyLCJYfv9Oa9tkEae4muP+ma
 jZx4jaBmc4F6dI+TbepN3mDR6Gy/Wvvb60UQSlJXSV04aCZLOZkjrEsR/w/gag7xWkXX
 CBmERtvb3jthQ/j/grx3tc3MvETn/MTIkfYST2VS0bX+aVYSB+MCc4N9F4VdGTabsnNg
 9jUwCo9KTTFpZA/ufXTF+Ew+vuoIAzagWS5vpjWyC9b2PWvLur0YaVwuohCguhqFgdd6
 6Gng==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3yP9uQDqtsdrB8rRh+hUC5xVqNOBskEH2Tv/oIrNoAUkM4QcWDy0DWLapgKerlaJhoulNLZkoIAs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzdZD7xcOB9eomK6pNPy44+AEUuz+p67g8MOUCcOCnMh/uWU5Vm
 dhgwmeVUybCObjUazkLsN74FtzTMZErxKiEblgEHiqOUaRUK1eGyWmVjnYR94jo2Mwgl99a/OPJ
 BQOS73H+7k4RYN7B2c2uTEHoK2q7Au0IjRtHrxvV5I3YDGoZZIgzdqnTU+aDo5z5tFatU2OM=
X-Gm-Gg: AY/fxX41r2ajDq09OHSnwLvf7E94TpN6unihKexi1eMjPzCX4PzS1p6PmckVpJEhw9u
 NIHB0k1QHja+c4qbHTzOHOTwUsFQC21C2YL7GxLaWF9rqVX/DXjIoGWy7b4LwXK7N/4551QSPJq
 FKoVabvaiTxmVNkN0kOENk5aFG5Uua/5G3aK9v5jIfoEffk/EjamQutMXB6ysfNhtsOZH8Z5TgU
 F4INat3p0TBD0IxL50xpl3MTWeTt4RmcvwPO0chCT3+gQXH7ArpOmJH7JuO7oHmM14OxMnlmhlJ
 mOISOsiNOPMFI91igewJLmOsZZ/7QkzlMbDc4wl+TQn+8+tGGRBwxZ6q3YWop2uuMQgWl3PXKDN
 UHV4beFN63uQy0oLtUJDoZhHAapu/AneScu8F58qYbKW2v3gXrVCGPiWReEKssMWtffzPx7gon1
 oE8tkkVl3qlxApTfEklaVLcmc=
X-Received: by 2002:a05:622a:28f:b0:4ec:f628:ea6c with SMTP id
 d75a77b69052e-4f4abd75109mr435966391cf.48.1766894560241; 
 Sat, 27 Dec 2025 20:02:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHlIWPeKQp2TTh9o13CbNammyTEmgMkAQ6zhpjyqaSCJj8cT3OGg0tcgjDdtOL0q1vypMIKkw==
X-Received: by 2002:a05:622a:28f:b0:4ec:f628:ea6c with SMTP id
 d75a77b69052e-4f4abd75109mr435966081cf.48.1766894559805; 
 Sat, 27 Dec 2025 20:02:39 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a185d5f07sm7840348e87.12.2025.12.27.20.02.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Dec 2025 20:02:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 0/3] drm/msm: drop DPU 3.x support from the MDP5 driver
Date: Sun, 28 Dec 2025 06:02:26 +0200
Message-Id: <20251228-mdp5-drop-dpu3-v4-0-7497c3d39179@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANKrUGkC/3XMTQ6CMBCG4auYrh3SmZafuvIexgXQIk2EYqtEY
 7i7hRUR3UzyTvI9bxaMtyaww+7NvBltsK6PIfc7VrdlfzFgdWxGnFKuKINODylo7wbQw0OAKKq
 aSy0lcsHiaPCmsc8FPJ1jtzbcnX8t/ojzd6GQEL+pEQGBlxyLTCvK0/zoQkhuj/Jau65L4mGzO
 NJaKTYKAQdEUqpBpZSmP4pYKSQ3iohKo/OqKlKZ1YL/UKZp+gAZTW8HPwEAAA==
X-Change-ID: 20250926-mdp5-drop-dpu3-38bc04d44103
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Alexey Minnekhanov <alexeymin@postmarketos.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1644;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=8F0/aAwRBj858vZ8ct+6ltrWoHhyWEPgLsSprjV+b54=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpUKvbrVT5D6fwbauZ4LESnuJVsMYI28B2gdTqe
 O0yb+g5K4uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVCr2wAKCRCLPIo+Aiko
 1ZyRB/4uiiQnBr5u3EFLFbgnFAsfZtK+NRBJuJYZaWG+Zdgvo9jYzCjl54QMR3XumfDMeCAZNJe
 AAikANRM2/hQ4fRt2LpbY6g9jW3mvAH6hs0A199/m7i/MkLjZ+RGUsPKOUoo7DbAFCGhiFxiXyl
 l2j43A8MT52Cv+9ERuMjFSxHzsMmQfw//YsouSQTH76GoGjTg15DguNR2iYBuJvm0Es4UDX+TIa
 DUGOrI8ZSQ8e3M2NiEhPg/EV8FiDWbK+jsMJ5hub2yQjqKK+pYhIx30tc6TCk4hHMrmvG84ZMXu
 Z98BDCmueD/jirWSBk85kL6QRO8LS1gsQGf2jhIPPJrDkIrp
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=G+YR0tk5 c=1 sm=1 tr=0 ts=6950abe0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4sc70ZTd7FF4WO1t3xwA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: I4h284mUUiLH_6hRgJ0e3Cqvwvn6qC9e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDAzNSBTYWx0ZWRfX+6Q3SdpQtYxy
 JmW6I5goYstF8PMlE5nT6MWnDFTa0vTh2diqK0kYNnt+pa6zQzqC8gTJ3cQduJklyhJjadxSkmg
 tqYFUYQQ3o4oNQ8/1eAaNdfS0GhlhlmapuI/O7wr+JjFgXmK/6RkNMS6mjuHuzghrCniVTA2IIE
 1UsNZ9GSao8Pkhra5O8DWyJxm7y0QU+rYFr1Xm0nygTOWvGmBUJmM/UeWfPXqTSDayLuB8k3o9R
 RsB4c70J70lC6MJ9q1zxElTgp5shs03HFR51ubWK3QpEDSe7v5XSBsLTt5DcAhy1HCgr7YC3k6p
 JeCU484JBK3/rFpZiUjON03LRdM+F1aBAw5QYJn7u2FV5W6A0zryrOFCdgeAWVb8q++fWGmqUsF
 VCgHw32zVIhZ3flSetY8iy1lFimLlZLPMt+MyZ7vLaqP3T0oFGojq97XdXMMz++WZ419t+GtGrg
 PprfA/BNXzpzAelz2QA==
X-Proofpoint-ORIG-GUID: I4h284mUUiLH_6hRgJ0e3Cqvwvn6qC9e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_02,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512280035
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

Fix commands pannels support on DPU 3.x platforms and drop support for
those platforms (MSM8998, SDM660 / SDM636, SDM630) from the MDP5 driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v4:
- Inverted logic in dpu_encoder_phys_cmd_wait_for_commit_done(), check
  for the feature rather than the lack of it.
- Link to v3: https://lore.kernel.org/r/20251224-mdp5-drop-dpu3-v3-0-fd7bb8546c30@oss.qualcomm.com

Changes in v3:
- Fixed commit message (Marijn)
- Reordered CTL_START checks to be more logical (Marijn)
- Link to v2: https://lore.kernel.org/r/20251218-mdp5-drop-dpu3-v2-0-11299f1999d2@oss.qualcomm.com

Changes in v2:
- Fixed CTL_START interrupt handling on DPU 3.x
- Link to v1: https://lore.kernel.org/r/20251211-mdp5-drop-dpu3-v1-1-0a0186d92757@oss.qualcomm.com

---
Dmitry Baryshkov (3):
      drm/msm/dpu: drop intr_start from DPU 3.x catalog files
      drm/msm/dpu: fix CMD panels on DPU 1.x - 3.x
      drm/msm/mdp5: drop support for MSM8998, SDM630 and SDM660

 .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |   5 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h |   5 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h |   5 -
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |   7 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c           | 314 ---------------------
 drivers/gpu/drm/msm/msm_drv.c                      |  16 +-
 6 files changed, 17 insertions(+), 335 deletions(-)
---
base-commit: 4ba14a6add891fe9b2564e3049b7447de3256399
change-id: 20250926-mdp5-drop-dpu3-38bc04d44103

Best regards,
-- 
With best wishes
Dmitry

