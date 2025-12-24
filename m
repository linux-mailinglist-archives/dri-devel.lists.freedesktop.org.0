Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAC0CDCB75
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 16:33:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1475410FE67;
	Wed, 24 Dec 2025 15:33:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IPOoMGze";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GLuVfMYZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F005E10FE62
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 15:33:53 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BO5gHXm1018224
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 15:33:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=Fkd7yIcYdAiRrFUU2lcbgY
 3gwdJKtsu/J2ER2SzIswk=; b=IPOoMGzeGov3HsXADIQtXJyPFa2RFS8ceqhDtq
 0gp7TOvewQHFUuqvEWGJ/0LWouSyr/imuvyiOG2damodxCol58JvlfsQFh+bw/Cy
 d11mB6OCH3OmkwadXGoqBAP+8nvLN3vUXe6Rp6iR8s1CD1xgylXlkdCBV+KIjFXz
 h2tZjxtI2qXcWLAVSM+4ZifLfTn654+SJS+10ljIjcIIY9pFdUGZMC+zZHMc794S
 5KHCseMTDaNeINcN6b6yQQdkkWneU5NWU2+5EHEq13yaiKzNeHfv1I6exPoLzXuf
 Es6oJcAF6HzZaEExMyfcBP0DAjfnuwTA2wZhPns3XL3g6CSg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7xjsb82q-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 15:33:53 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4ee09211413so152793121cf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 07:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766590432; x=1767195232;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Fkd7yIcYdAiRrFUU2lcbgY3gwdJKtsu/J2ER2SzIswk=;
 b=GLuVfMYZfuaOS8ylyhZOZcaT5rK9ttWtGzOdhbHr2yjepUMQso4DHl3Bvmuf5iOpw8
 SugGtKTpaaypgEaSzpLwfu9/PmO3igPO9qCum5QC0etwpzxJWkSF8PK0HgD9DYLxaJEJ
 tcmw+xaFQv+zN5av2gtaSmSn/1D28cIOSNnl17sJGEm6hwobCGuAk6qr6XXauxg3MQI5
 G8YiUmY4AxGAvr8CjHmFWuq3YhM7UP1wZU8a6H1cB6/ris3tw3nKmRMr5axean90sVs5
 uR45yy2oQjpGPwZ5oi4eMfc6yD5RbnAw3t5ok2xLt3Fiqp6C/Ld0Yz4ZcJhlj6LkeqK6
 CmtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766590432; x=1767195232;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fkd7yIcYdAiRrFUU2lcbgY3gwdJKtsu/J2ER2SzIswk=;
 b=omh54Vcpk38lyCN8GfP5R94Rkai+2yrNcy0VN3QUQn3stf7fLC1Xgpoqb12gHrc3cx
 0QUSIFT/PEFArNLq5FxmwNIVMBUo2f1y/q24SFkuVd2Sh94cRUxFPEWiQmaPr4IFx1i6
 M7nKzA/PN0rrAcANmv2Hd+GCBqX9XnZFB23PwamfY8scGOAFJ7KrE5t7NABtIfc/N4dw
 jnHe5wLRlteie7upw9KOtUwXIjT7VJ/f/r3X3bwdqj3a8zKZxQBQQUxGw2032ZdFibwH
 oaKVdvFEMkTe8Gqd/tbnIJCjx+7+dmCTlLBu4+FF6oWNopDGq4We363LylMgdSjVQCTI
 L5oA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZ2Fu3a9uyboV+CcdshyYrBfFYajaK8JB+oRo6IwH2S38vr1jBAlxqAFLZ3ftYXK8IAbIDsnnx9nE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy6bXtB6BMeZdwqaCVbYiw8IFO8ygBjTpB+7cIgkFZ8z6rwMeYl
 Bu+iS7+xVluludJ9o4eSe1G33SewWuP7xaqveisWwf0eNEkQoKzQZgBeZhIgkmWp/InleQvgCjp
 5ctUeObue9hSqSjGJPQ8E1KzoE5qLy2kWIdkpYfiQPdvbdJIjDZEVCF+N+WLQtAbOdsmVzUw=
X-Gm-Gg: AY/fxX6gnB+PQnvxJ0ewvyykmJiFoEWCRCDda4gnd4LfVCBfOEpUtUGxYnXGmgpvMJP
 32ekPl4rOpHTeu4WDQPB6FWY4VXxqO3g5fGNWsXdUMNeauu0BRfJE583uf3eJ4gnaD/MzbFr6T+
 neHo7nToQIeFnVo5THBjLyAiu+5tLoyC5EMdjiufvJjQhEE+WQy/Hff6xStJbOiWIvwHqov/q7O
 py+/K7KhebCYaW3uFIkriRq8pX8+1SBJ0xUru+t7GrX1wKDz+v3klSCQVr97l7abvPRfkKM9Tq9
 FO0xOzD18B7/b/E8YpUMoVCF+LR3yeJJDd3E27O9rpPHR2ux915ulB2wogFFpg5kQhhogzMhAtv
 s4hAPE5w1oTwYJfpBwjKtKjHtdDNttZW6awdGYEneVBzjpYMkGDXJqHLSJggLwWF2iOFTQr+tOb
 ZbKWhfVBodmq14VAnG27OC150=
X-Received: by 2002:a05:622a:40c9:b0:4ee:1806:97f7 with SMTP id
 d75a77b69052e-4f4abd7532dmr235501141cf.47.1766590432420; 
 Wed, 24 Dec 2025 07:33:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHSeGGQtG0K9rKZDkEEbxBcmrQ167DlB3Jnt9KRJkLvfcvp9+m4Jh13XawZF4dVYqDiz9OxfA==
X-Received: by 2002:a05:622a:40c9:b0:4ee:1806:97f7 with SMTP id
 d75a77b69052e-4f4abd7532dmr235500791cf.47.1766590431952; 
 Wed, 24 Dec 2025 07:33:51 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a18618cf9sm5115105e87.57.2025.12.24.07.33.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Dec 2025 07:33:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 0/2] drm/msm/dpu: fix vsync source programming on DPU >= 8.0
Date: Wed, 24 Dec 2025 17:33:48 +0200
Message-Id: <20251224-intf-fix-wd-v4-0-07a0926fafd2@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN0HTGkC/62OsQ6CMBRFf4V0tqS0UKiTArKZGKODMQyEttIol
 BREDeHfLWzujifvvnvuCDphlOjA2hmBEYPqlG4s+CsHlFXR3ARU3DLACAcexj5UTS+hVG/44pA
 FEcXSo6HkIbAfrRH2srRdc8vS6Br2lRHF0nG6nA9HRPcxRYwlAWFxihNGwiyiBGVZtEvTNNhuf
 mJu0Zat4Yi6rdHc1c/+ofXdLXU9CyvV9dp8lvUDmbX/luTTNH0BQf2zCCUBAAA=
X-Change-ID: 20251224-intf-fix-wd-95862f167fd7
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Teguh Sobirin <teguh@sobir.in>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1310;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=hua9yNQidjaS4ahVcEKC7c7G+W1N3sfAOzqaGw7jqK8=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ6YP+71PljXFTnOfzPXe/CbA7cQ2P4+OrANxi/0fzF/FE
 OLOfvRjJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAm8lmN/b/fmZzfZ3/wXkq5
 4cLQLqy+2e1e+XfxT7XvwnufBRY9+/p3a/7md1dneZrVOyozLG6IPcj2rFg5vpklK36C3+s/Lbp
 vpZcH3O29vNw7+Y9bymUW8YwLQdqsiz5tWs5Q872z+YBepFPk0Sqz8ujG5+aHTWK0FwDJpWF/Yv
 6l5Oxr9uQPzIgJmfDymymfX/lXH5UP74L6+d78Kr8y957K5a51Z/b+sdjrMZuLWaBlT8dCvXJpb
 U+Li5Pe/Sh8OnvlnMzia7t5lk6wbzWquhA2S33H0dXP66axtR9d7JXaLMN8bD7DfGdpsQ9JE5ca
 iShyPexPYir9rybCWB909nZs1Or3eX+9p/9fn1X31K0BAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDEzNyBTYWx0ZWRfXzp+R9bD2S9nT
 sGA5DnhWJ0opzydMsec+4nfZzpnxlAnPGfz/NIV566lCOTA1ih3gSgUnz2KANaMH6Iim+/hYjoz
 Iiro/OpXNhY04utFEyleZ7/BRhH3EMPSIKQdUad1koPJEUHfEBrFkhL0VqET5qk2Sf0et7s+QzZ
 FJHZQBeqNF0wuegSxTvtn3PpbAiAPmMdS7wrrofbwI+34DERyZF9PLlbb4d+urJidZWdPmennl5
 FRcQR2ntFrto2JBB5JhxvFhYcOJ9edLap6m44C2DH4XcA06i9iHwbQ/X61mDkwndIZMxrii+F4r
 IgiBD9nYq/OqED8bxIcDMv6tvUYMDZtEIjNCLK1sr4T23g1yOeZilhJmteWF3TWZr0CIkH8ER/R
 1wafEJ62/QGTXu1fqyu/C0qGYAqmTqrSmjIDk7Z5DsaSDY0mKFaIBRFetyJGq24VQOCVk4p3+He
 NyBoj70caR0ln/jGuFg==
X-Proofpoint-ORIG-GUID: ERgmIUQ0s4U025FU_9s92UQndvt5mpeC
X-Authority-Analysis: v=2.4 cv=YcqwJgRf c=1 sm=1 tr=0 ts=694c07e1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=4r7oZHox7d71xAMh2p0A:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: ERgmIUQ0s4U025FU_9s92UQndvt5mpeC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240137
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

Currently VSYNC SEL programming is performed only if there is a
corresponding callback at the top block. However, DPU >= 8.0 don't have
that callback, making the driver skip all vsync programming. Make the
driver always check both TOP and INTF callbacks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v3:
- Picked up the series per agreement with Teguh
- Fixed VSYNC SEL programming on DPU < 5.x (Marijn)
- Implemented WD timer support on DPU 8.x
- Link to v2: https://lore.kernel.org/r/TYUPR06MB6099C539BD2C937F8630FF8EDDD5A@TYUPR06MB6099.apcprd06.prod.outlook.com

---
Dmitry Baryshkov (1):
      drm/msm/dpu: fix WD timer handling on DPU 8.x

Teguh Sobirin (1):
      drm/msm/dpu: Set vsync source irrespective of mdp top support

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 17 +++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 48 +++++++++++++++++++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h |  3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c  |  7 -----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h |  7 +++++
 5 files changed, 63 insertions(+), 19 deletions(-)
---
base-commit: d2b6e710d2706c8915fe5e2f961c3365976d2ae1
change-id: 20251224-intf-fix-wd-95862f167fd7

Best regards,
-- 
With best wishes
Dmitry

