Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AD3CB3E17
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 20:43:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 862EC10E6BE;
	Wed, 10 Dec 2025 19:43:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZXSfmlIf";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eeteY3ke";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9481610E275
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 19:43:01 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BAIR8i93358562
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 19:43:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=tp2SrjM3ut1J2CotAoX20o
 6lXiPU098YctdSdpLfUHo=; b=ZXSfmlIf7Z/Qod+Psn1Rpyp6yc3icEcCq5einS
 SaZuIvU5RB3ivEb0T4gBm3LV5DI2IgH5UN9/70ai3a4n2f8nraOPN/4zO4YlcRDg
 EugCIyEJB87JIBBnMpwb7vsG4w0F8L21uRjspFsb0MkuDGRlJCtH3BxzxZoVNvfE
 iKcv+JWJgs2jBfcv8CIa9Z5nuXalFZeSAwkhMv+MKZQ8rJdQgAsq98pO/lbynJtN
 7DTee3dRy67VW54JqC7AtvHFWiig2DlxgI9Xp9rey7mi7WRPxpgG4pNNQUk6rpHw
 MzQVUCL7wCwHSq7Kl/oOK6UJkSBGtzt4Q4HW2oNT6ScwRAAw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ay7pp1qst-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 19:43:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8b30b6abb7bso49654085a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 11:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765395780; x=1766000580;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tp2SrjM3ut1J2CotAoX20o6lXiPU098YctdSdpLfUHo=;
 b=eeteY3ker9vJ1tvqEcR9NOLpk0C/cTV9bIVlRNCeHdbYpfhIxiLle+Pq4RfN0EvwQL
 FVSokVsg8sSIrkmGiBDwqMJgeylQO2ltn2dIe74GpoXVxX1JSoFTzl0azczORxUZweiC
 JW0ZwFB06mG2PxxrJY0kSq4lGe3g5jJI2Q5JVjJOVCfF4KpJML0xD2uPrR+9Etoq9YPB
 YYZ9eLlrLS313pIDhpcQCC93uwRs9vEwKH/NFVvaqujMs7wwnUmNJCPSi7au9w0DrwoR
 CSRjP6zP6rR4DNNbeeAToHLN29pkYpLySHRgsRSGvGmGbhrnvbRISr/kJu51Hv08foOK
 kPfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765395780; x=1766000580;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tp2SrjM3ut1J2CotAoX20o6lXiPU098YctdSdpLfUHo=;
 b=tffcwBqSmvj+E4l25oG8nr05D4286CPi0DOzzschyPRufQgcmBqhgw5HYOoVMeU8cK
 7BQ0w5nP+Y7m2sXKtUhSjjcMoPy1lZ11a6EnNm0LSq1pniGMG64vaitPM1GBk/GNJzXU
 9GI/Q17phfngyk4L+davFdbguWdhFl6nYDfx/BUSqKjE4il2t2Aqa5QEkPpVk3cAoYRh
 dwrzy3CYdkQhxZr3nMV0+ngUvYOdngLdSFuO5fkKEZ2BanXl67opPSZJiSB3I1LCz+n7
 zWD99FQ3TYsk78g8M8KjKsqiQwKqjdGmHXK6h8ijniFSPloZMfHIP/XbIsveTxtPgg9A
 WQDA==
X-Gm-Message-State: AOJu0YzDMLYQh0L/JXK+MK0kjCErsTtk5aZzMmz/vHklQDa7CIeo0fwx
 tINU4/JgcHPgJlN8ucURS3kPbl4i9QKnzlqrzvI6mmMQJA6IXTtdO3yxp5dllPH4N8k+V/e/Eco
 hOw2CmeJKuT3W0PeGfZPOP+yZnde4Y3TAsVSDfdwiM71MGWr8VgEbFP0pJlvFSRmG+0GIKx0=
X-Gm-Gg: ASbGncsVsPlyUX7oqhPMYorilTbZ61W2NOjO/WjJXvOH6kcILwOzgCeRyzLVgRzrnTJ
 5F/OerEHccwz5GeIN3ge1Fff1dP9I06mMb1ceBzOz/2467WIfSM7ew2/Qac2UoVOMcIX+IEhfCc
 /OHN5k8KAwjsrfjH+uvBic2RSAcGD+B1YPTPSiabfWM7ThS7qCyLKL89YTA9fo7dl1gtNxQg+Fe
 olvzZu7c1Sf2SpIBGqxzbTRvaVxOe6z6lOE9wfCzBSfaLQsmMMlO+2O3WoUnUggIKRh335Hcy2+
 PrFRjCM3ffG8QiwCqg5V36UVUEwHuWTe+jnH/rbELkUWguTS8MFt63ptaNRebTcQxP3Bq8TcA7I
 s7xhafJ/+ERF3aAb/00BX+DSzEDaqPVOktpJD0Dd3DfrAjmzGXV+jLUVeH3LChdgxTRTn9UkLV9
 1Kv4wRTEAPen+697VOcTgIgOw=
X-Received: by 2002:a05:620a:2552:b0:891:9bb6:6b9c with SMTP id
 af79cd13be357-8ba39a5557bmr549904385a.44.1765395779915; 
 Wed, 10 Dec 2025 11:42:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGwQ87M90APNT1G5dyO1V7BnT3I3yUMiuGnuKVGYNBx/MQE5gzeph5rWyWHbP5udM7ppIZJxA==
X-Received: by 2002:a05:620a:2552:b0:891:9bb6:6b9c with SMTP id
 af79cd13be357-8ba39a5557bmr549900085a.44.1765395779412; 
 Wed, 10 Dec 2025 11:42:59 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-598f3199e93sm104845e87.96.2025.12.10.11.42.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Dec 2025 11:42:58 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH RESEND 0/3] drm/atomic: restrict the size of of gamma /
 degamma LUTs
Date: Wed, 10 Dec 2025 21:42:56 +0200
Message-Id: <20251210-drm-fix-lut-checks-v1-0-10ae38519f43@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1377;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=212f04+vA1L9p4RIj1VyYlO61ApIYXhcl1xh/Mmyias=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpOc1BO76Xx07350KCr+Ny4wnojRH4aJAOMdrBY
 9qAk91995uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaTnNQQAKCRCLPIo+Aiko
 1XbFCACWORm4MaA8RjD9mxjPpflh6/Xl5GbbOvO8tKoCXv7LFPbWzOoE1FI9HB5baofRv3ltu3J
 NqHVoAImAHcpH/TDRJjgohk2mCveXvH0ggJayj9xmCCt9fAFYiYKUhDacgKAbinDX4Jt/CjFKM8
 9P/hHGloQb6nXheMJ9/LGnwsHnwTlwWb1uwI0/9lKeXqntLXLrn/E3BpYrIxZLa2IURp87zTjew
 +XhWg5ZDJ1MzLexsatvl9W9QaODXBLplK/3VGYs/V8ZGX/eJzFUFAFMKy6uUK7QDvOELe3hQpDx
 zFj18eGWz1lLxtq4kNXuV9NBtep0in6Gyw2H3ZWdvH4fyH6H
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: zd_fid59JeMegfo--wUYwsfoSOME8wmK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDE2MSBTYWx0ZWRfX5DcsZSEjge7k
 GaNWt3Bt0Gr68e9mO+C+KUstZtC/XLpMxUW7cV9VG7EZ0/AMgX1bZ7z2mZKGUMJg1p8prneqQqn
 EpIl6qCbX5cJy2uuu0bRCMFb2LRs34EAWLbv7sHvz08D8I3XYgIXJffh9h2aTIx5Bd5LnWVgakC
 dwpBg1KBW5y13JeBWCfuQiRHpvRyZWDJl1HOabamVoNRGRle6h+BBon5PB1Wiq3l4+D9GfW/pK4
 adQpxmyQawNbF9dD62lLPPPLjeGaxS8rPG3trNtwMI4kRk/5v28eFovtKb9CDPE3FIE9d9RFIND
 uRtzNiKdb5EDfzTHELd0Fb9TssxYur6GZTVBTc0jS3WBJGBuatGkc7nCQo1mOhU0X4Y3tnzAVr5
 qoFxNB6WrhXizpvVdZeBSLyjwT6hBw==
X-Proofpoint-ORIG-GUID: zd_fid59JeMegfo--wUYwsfoSOME8wmK
X-Authority-Analysis: v=2.4 cv=WaMBqkhX c=1 sm=1 tr=0 ts=6939cd45 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KipMzqLmMTXpIc6q-14A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_02,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512100161
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

While picking up the Gamma correction patch for the msm driver I noticed
that kms_color@invalid-gamma-lut-sizes and
kms_color@invalid-degamma-lut-sizes tests fail. These tests attempt
submitting LUT tables greater than the size specified by the
corresponding property. The issue doesn't seem to be specific to msm
driver only. Add generic check that LUT size is not greater than the
size passed to drm_crtc_enable_color_mgmt().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (3):
      drm/mode_object: add drm_object_immutable_property_get_value()
      drm/atomic: add max_size check to drm_property_replace_blob_from_id()
      drm/atomic: verify that gamma/degamma LUTs are not too big

 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |  5 +++++
 drivers/gpu/drm/drm_atomic_uapi.c                  | 23 ++++++++++++++++++--
 drivers/gpu/drm/drm_mode_object.c                  | 25 ++++++++++++++++++++++
 drivers/gpu/drm/drm_property.c                     | 11 ++++++++++
 include/drm/drm_mode_object.h                      |  3 +++
 include/drm/drm_property.h                         |  1 +
 6 files changed, 66 insertions(+), 2 deletions(-)
---
base-commit: ea07a751fbf3743490a463ce6cc5828e6dc3c660
change-id: 20251114-drm-fix-lut-checks-4bb325e24110

Best regards,
-- 
With best wishes
Dmitry

