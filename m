Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C76B426B5
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 18:21:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E86510E0C3;
	Wed,  3 Sep 2025 16:21:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RB7AFb+7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C64910E0C3
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 16:21:33 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583DwtN5016989
 for <dri-devel@lists.freedesktop.org>; Wed, 3 Sep 2025 16:21:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=k5PbzKZOkp35m85qtYoHNE
 OjuNKM4TE//0ab2p+wC74=; b=RB7AFb+7LbvDDF1voH7I2W1laS3P2jqYWnIE7W
 8rQYLQt7vRH2EINIy3MfozVT/sFv2WoVFXLN6i0c/N97HYFM/L3LBuI+tPyIOoV/
 xnbTkF5GnqOml7xioQkbdPnH9WSJv4o8FQWyMq97odfxAXkq15Nyjp24Xmb8n4lh
 RiGbcOuSKa17Cc5WE8b48lkNyI6iDKZOodqP/sGM6HDcHVXUpCB1D8MYMsZrOEgX
 FjVFFZHcYEu99hEJjPh8trmavSdqDU317czk+/vbZzcQziqgYi0c2GHA5KmOwzXA
 RDxBVtW/pWsGNr/3K8QaVamP7zUv+144XzxTOAJwiC+CpsdA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48xmxj0xnx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 16:21:33 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b49715fdfbso2174891cf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 09:21:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756916492; x=1757521292;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k5PbzKZOkp35m85qtYoHNEOjuNKM4TE//0ab2p+wC74=;
 b=BnmYKMnkZ2xzwfpwE+MrPlk6lJnrggwZZyweta1S76l6AuHjCdC0qh+RGCTxAOyUzy
 t2IDPBaZaR5/PGmxiunEd8jQyAAzbhquc9ZEsmzdWLAX8davt88jQTF6DNyo0MCtnTwp
 qdibaOFt6iAT8ROehV1gMCQNJtnWE+4QMbzQYdwIBIO4sYffEcHvdVUd9YkDmwozBiHa
 kdq3X2Zr5KcClMaa8tRJ678yNdMZgqLrb+tb+hx6JPv01EbnUDW8mFxww0W+w2+v00di
 VnIvM+n9tFHdzbzBq/IR0fADdpftD+jsGZkLPqdR/FhKKFppesxcXhH3qamvX7HujfpA
 vhdg==
X-Gm-Message-State: AOJu0YzncltZ88duTf+dHQUuqgc0MwxI5ptpceHmZnL6a7DS0D7YYMkc
 dQOm1DLCJmZclQI0mTVBguiyZWMMy0zgRFsOW9AsbeyP7d2WIA27YyOALaA2iMA1/tVQP+kIem0
 tQ6AAQVpMiRnATH0CXt4qBwrFSbUtIgHoRmwZHLlTlj6+AIt2oLg5drVS7QT5qSbo952JtQM=
X-Gm-Gg: ASbGncuvfxuSTBgZZZfXJBgfiyJ0XvI/FAzQPnfQfUw2v9gyxGaG8IrVlTTx/enlUmH
 10F7XlQamneAhK6eSWYdMQAd/0gwMvyUkE+OORhxtDBOQhhj3o/UrsmiGukImO/wn4a/D/Hnudx
 QNe21sPwrRnmHGneIDqs5XE2uJbsrCo4/V1gia80QNUGc3R5API0yRqBUYOWBIAJDjU1friVVTI
 NGAuKHdjKx0Rv1NFf/RdclSu3F/dMreAlzjDnObYzqISlAJo69KIA95jDsPw428n5XDSUlwzeiu
 lVtQDjZTC4Qwzp07lOuFJKPM8aial/Acd+ttIkwIkQS/fhtIqbYEle6Tgegh443R7rpI6AgIDiy
 PFhmUz1bm6KQzN3Yw6fL3iOGuj+uvX/QG1evXDIbHyAkMe4EBrQvX
X-Received: by 2002:a05:622a:4c11:b0:4b2:b4b4:45bd with SMTP id
 d75a77b69052e-4b31da1da15mr230359241cf.46.1756916491504; 
 Wed, 03 Sep 2025 09:21:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQO7Zb5ZFNUQGI5ekX44Q869rZqXPADpX+cP+v9JUz45/SAjx8a4XcPwHseb4bb02T+4/USg==
X-Received: by 2002:a05:622a:4c11:b0:4b2:b4b4:45bd with SMTP id
 d75a77b69052e-4b31da1da15mr230358571cf.46.1756916490747; 
 Wed, 03 Sep 2025 09:21:30 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608acfc24fsm608343e87.104.2025.09.03.09.21.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 09:21:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/2] drm/bridge: write full Audio InfoFrame
Date: Wed, 03 Sep 2025 19:21:27 +0300
Message-Id: <20250903-adv7511-audio-infoframe-v1-0-05b24459b9a4@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAdruGgC/x3MSwqFMAxA0a1Ixi+QVsTPVuQNok01A1tpUQRx7
 xaHZ3DvDVmSSoahuiHJqVljKDC/CuaVwyKorhgs2YZ6qpHd2TbGIB9OI2rw0SfeBLupZTt7ok4
 YSr0n8Xp95/H/PC9t4sQhaQAAAA==
X-Change-ID: 20250903-adv7511-audio-infoframe-8b7a2cf008ea
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=781;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/XwMelsvPfhSAzYSXbnvREe89vnzYupUA97HM80CZ6I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBouGsJCBhmvT20e+NZ95QqZUUSF9nsimFh4Qm3F
 MHVzpoCI9aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLhrCQAKCRCLPIo+Aiko
 1TiZCACwylNH7Dw8MUT/MDJqht90uDrF13oB7ek+2lO1gt7AxdkaQopYKuenyYr2qWUwSXNHaKu
 njka5hANot6pmbfH3LTxwNpQK74RNF0fSePQ2AeaVgC6XN6iUBc5UNlx81QDtw5PrBAxKStMNiQ
 jBYxgT4QVdKz4tbSla+mTX7sXYveChsBigoWad5TQ99Jv9mNLXuQRWnHNdF4FLRiVl7hpG7RuO3
 SU0DMkx62nNEeU52tVhkKDNo4JItmdmgAwt325qIK6MHF7PuAw8rrlt5UsgSI4FNphfGATFj0ku
 elL7u6Lx7VcodIifRg7cDaw/5DkOYVve5TWSK68jF1/hENas
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAzMDExNyBTYWx0ZWRfX0/XxzhvVhJdN
 jg5KbYCraxjMGepMoSi2JUQnSzw5TPz9HMeXFao+FeDqHowsyYmw7Mgi5MKVMb4PBxm/8J24Suw
 bnZX//Si0NW/Ts5x7XfKGMwQFh2mtj7qryqVelVQqEreIujq1XckctbUSlyufK4GSSZ25zae1Aw
 fOZE7Fqj8CMDAlgq3kWU+PkyQy9+gkFMxYKNW9iflhEWXxMSVZrBjYhib76hyS0DPzgUnIfJD4x
 PIxBngxQRcRZbG4omNWghd5GX0eAO13wegDi/0AVlrlerHIlYRE/cCGZO38dbQmy4dPu9sggfOx
 UP3zYoFPVqo16N6hakxACG+028XHTnyeopC7aHSbhEimNQjU1ksEjsmbypzqRvWNLqElPN7G7b1
 c8UhoNbo
X-Authority-Analysis: v=2.4 cv=a5cw9VSF c=1 sm=1 tr=0 ts=68b86b0d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=VSjBEmWnoc6TdXOD9pAA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 8K9RsrEJZEOxLPGTwIRdUxmkZmnWJ-tF
X-Proofpoint-ORIG-GUID: 8K9RsrEJZEOxLPGTwIRdUxmkZmnWJ-tF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_08,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509030117
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

Instead of writing the first byte of the infoframe (and hoping that the
rest is default / zeroes) write the full Audio InfoFrame using
drm_atomic_helper_connector_hdmi_update_audio_infoframe().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (2):
      drm/bridge: adv7511: use update latch for AVI infoframes
      drm/bridge: write full Audio InfoFrame

 drivers/gpu/drm/bridge/adv7511/adv7511_audio.c | 23 +++++-------------
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c   | 33 ++++++++++++++++++++++++--
 2 files changed, 37 insertions(+), 19 deletions(-)
---
base-commit: 36e626877e1d2b833bd453ec69044d7cad32f54d
change-id: 20250903-adv7511-audio-infoframe-8b7a2cf008ea

Best regards,
-- 
With best wishes
Dmitry

