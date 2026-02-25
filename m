Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yK97KpKMnmltWAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 06:45:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F640192205
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 06:45:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E1B210E697;
	Wed, 25 Feb 2026 05:45:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QxMdtduA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6523C10E1C1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 05:45:49 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-2aae146b604so44198095ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 21:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771998349; x=1772603149; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=W28tLa7N7ACX/AmRjBGq6ylf0W1jR0KpZ+vX7BOo/xc=;
 b=QxMdtduAioJS3EZdx6pJFMtOB0LXhG8ieOedOdUVLzjuG3JZaHw/2FbhepCpLEqVfq
 Vu0UVLkzxyW1UHMXRWQVQ/HHALv9yyNM0FsSGuuBGPZuyy0aAq504wcbuSWgpXzLq72H
 iWp2PWL8UcJqPS2IHvuH32HK+K+lXOXaxoK7urdo1lZA6zSCOpSNfqmH3PqhrHgUSiFB
 DDZCG4oisqYCFZyuXMfoAYr4i8mj8NGmxr6y4zBe8Vmu85VUN8pCaADagUv6PbHTFRV1
 Ctst1Dzyhs6GBtzmVFkmExLioR7gTn8C9r8MFRsAV3gOLj92hNeyFfNGwmHFaQOejZUE
 In7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771998349; x=1772603149;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W28tLa7N7ACX/AmRjBGq6ylf0W1jR0KpZ+vX7BOo/xc=;
 b=BX8HwQdGe3UgJXh/ZRUHltt6alHhBiucv9pZSQ591wUN5TZhA6ScAUS3LZF2z8NogW
 lXAPrSoB+sHWw5shBcJ+CI6Z46br6J6Po/O6ziX+VuwikjR6i+klvtG06fQQHZNJ4nYs
 RfxjmR76vKYNSODA1BItMpXDAzkroMEoHAsQqXaGIn8eE8DiP/wrCGLKg/Cl3+EKXihm
 W/AUDxnPdwcyW+gvUGHCa8nV8s4UH/PeJoFSlW0A+oFqUGZ+SNls0ehHr8t5qfRcmXN4
 aiSB0hP3d94+GvgNEMmVuQsKYBzc/J8J8Nc4EdavaAKR5+KB6f4MEQvtC3q+cvi2R7Gm
 BXwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUd0UHMzKXqNxgHUQgFyEhZpo1vDRjuj/c5Vg+BuO+M/r4/Ep+k/Eri358IUGEXvUatguIL+87+IJY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2s/lzaw73K3GgE+doRjPaCJOVCrWh2e2pgPpbNEfAC38v+dut
 IW7m7XOtFSxPYN4gnowqzYq9iBq172V94SPSRrngSyeEdn6llBTmhDVkYy+FvqjzKh3tnw==
X-Gm-Gg: ATEYQzzc1vyn27pGjW/zymvwivut029sh4NGy4O9DZ5ZAxTAASwXSfvWZIlI8FwbRdX
 UqRmZyebR42FxmIAayn5sjZnN41M9mynGgzTDzmB4Vrc7CRmA4b7wUSXPsUCqoCIM7LPpyM3hbP
 Rhg/XPJOOLZzOiB9Gx3IBuLxoVqOfQG5LuD9P39ZHqnuRiV2hkVsFlhchGdFJuwXtnNAS8riURN
 +9E3d9k/pBavCh0l2cSvZbYqpklPJQc3Qx50NoGjv33YP4xOj/V1IUxe1QHfqLr5ND9bftQqsIu
 +wytZbGGNL6hMss+CVDlpYiJLCPebaAQx2Srgj8N5e7hzqW1naucw4O1yj0qPZCQA/P0RHEXtuJ
 JFUE2BZ6mFrmOk3/4jPLlb4tkE6Qy4+mXEsc/fHFooS2oenl06LxvijihKizpV9J8Hbf4foO2NI
 HqYSVSQa0BwKX8qgjl
X-Received: by 2002:a17:902:cece:b0:2aa:f0ec:3701 with SMTP id
 d9443c01a7336-2ad743e22cfmr154733605ad.2.1771998348825; 
 Tue, 24 Feb 2026 21:45:48 -0800 (PST)
Received: from nuvole.lan ([2408:824c:a17:8230::c83])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ad7500e318sm119665295ad.43.2026.02.24.21.45.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Feb 2026 21:45:48 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tianyu Gao <gty0622@gmail.com>,
 White Lewis <liu224806@gmail.com>, Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH 0/5] Add DSI display support for SC8280XP
Date: Wed, 25 Feb 2026 13:45:20 +0800
Message-ID: <20260225054525.6803-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:quic_mkrishn@quicinc.com,m:jonathan@marek.ca,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:gty0622@gmail.com,m:liu224806@gmail.com,m:mitltlatltl@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com,marek.ca];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	NEURAL_HAM(-0.00)[-0.998];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 5F640192205
X-Rspamd-Action: no action

Add DSI display support for SC8280XP.

Pengyu Luo (4):
  dt-bindings: display: msm-dsi-phy-7nm: Add SC8280XP
  dt-bindings: display/msm: dsi-controller-main: Add SC8280XP
  dt-bindings: display: msm: Document DSI controller and DSI PHY on
    SC8280XP
  drm/msm/dsi: Add DSI PHY configuration on SC8280XP
  arm64: dts: qcom: sc8280xp: Add dsi nodes on SC8280XP

 .../display/msm/dsi-controller-main.yaml      |   2 +
 .../bindings/display/msm/dsi-phy-7nm.yaml     |   1 +
 .../display/msm/qcom,sc8280xp-mdss.yaml       |  30 ++
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi        | 425 +++++++++++++++++-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         |   2 +
 5 files changed, 452 insertions(+), 8 deletions(-)

-- 
2.53.0

