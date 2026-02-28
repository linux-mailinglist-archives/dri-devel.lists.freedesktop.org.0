Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDhJAi75omn18QQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 15:18:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B331C37B9
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 15:18:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4262810E2B6;
	Sat, 28 Feb 2026 14:18:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hMVjZpPm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0F4E10E2B6
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 14:18:14 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-2ae3a2f6007so3521985ad.2
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 06:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772288294; x=1772893094; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VGK+4J+9vPRIz1dRy0JtbK7lizI0aiu8a5dzBxpbALA=;
 b=hMVjZpPmnrUeIjJyzHdDbP5QRKe6LJyCWxqIORStQq8XksVkCp4wQhdIxvUV5CKQ2c
 CmpxDCLCEQQFl17F0uCRxtyMflk17S5fYjWupFIuotJ46nX+ascGvE666F7wtFFwKkId
 R0jsVrp1UKvZTGyu9hs7fVHfxF5F36NX2k/XaWNZlEzKw2QVUvTuyHpWAY1Qzat30iG6
 ZTcc3IkVcc4958q57euA9pEZYPpLpqmcbtY4bWAjX/Uj+qt5mog3nBGf0hAA+JtUtnjO
 Nb95eRgdfOFdwVD306ggW2ZFjvI/x5wJHVG/NHizmU0LMzYuwV+G3pcYJpEqtb5EWN12
 AVZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772288294; x=1772893094;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VGK+4J+9vPRIz1dRy0JtbK7lizI0aiu8a5dzBxpbALA=;
 b=LgquW7ML7/AHSzhP/i4fSrW7pquZNsjgg0nSscr5EtFdJ4UKhGMcyFir0LZ+mpFcC7
 VUVa56XeS4hsayfmUlsr72xqPAbp8bRFkJyUIoJSShdAnFOTdwd9nop6JdiDwUVPD9VA
 FSZDjgBRYpqsmUr20FSLp4PUR6W7cfmblMIdyK5PKV2T/sskRPJBkuvEo1DT+CSld65a
 1pY+DttZqvAqf3cVUQslwdVg1xxfQ6iD6JOe+hVzYp5zJCliAfe/wBSI0QywF31W7uq/
 wPazU/rvVjXm5KSQkEGgoOAl07fj+7e+tRtu2KB+y56JB0SqSlT19DhIFLLIW02PWEvn
 ZNYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdWZLIUe45K8aeF8RXeQVUkAtmHKpz6kiBDmUc4n53nIiAJf9B3Cesm6LZrtefZLP6fEfzm2RFLF0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzebi+anx/7C8H2LIyKYxCp/NrkhP0Y1/2o6Gmoh2TFNoHJd766
 UELPLEc5QGWaOCQbH8wjfTLL/cytUnBcQ0fB1MORzsWHdYOAV4D/mF2W
X-Gm-Gg: ATEYQzyaW1QZOJImZR2UGkWNc8QZGptC71Zxln3XqiTbrwSuRrHw5RXQYaacEjT3Y2s
 vIH3/qPdVKngx5vv5w2ghkym4FHMq6H6tZ+wVAPnUb0zgcWo5zL2unJnl3ztYX86UBaZQAEYYLY
 /r8pwMOlQKEXDWGhbfr94Ey5g5w0YAaowx17b/n36Vzr1eGeENogOyx+DY6hEcUjeiroqjHUiC1
 Xwpy0iRRLwVv47f7EzTDfDN3Q2gjp/8rd49eQdKyGSlVUCy9RkXxxy0Mhrg/+zERRMELbucqEiA
 sRcR+yrUAnktNt/9vEYzeT5pjVQ0/0im2eMeK7c9YR3CHGqRW7ATpWhbekKn6jbkVULwx4acqxT
 FvyBxU+jtBJrElWRbH4ZagklwBtmV/hG9/RpnGHDLstm72Oh+gD2zHeD6QaB/ir3mJCQK5U+PVs
 tIv7ELOoi3uqqaeWUoc22k
X-Received: by 2002:a17:903:3bad:b0:2ad:9b86:ddc2 with SMTP id
 d9443c01a7336-2ae2e401fc6mr54787835ad.22.1772288294134; 
 Sat, 28 Feb 2026 06:18:14 -0800 (PST)
Received: from nuvole ([2408:844d:b08:3702:16a4:72fd:8170:4ed3])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ae3d1b2c5esm18697235ad.6.2026.02.28.06.18.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Feb 2026 06:18:13 -0800 (PST)
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
Subject: [PATCH v3 0/4] Add DSI display support for SC8280XP
Date: Sat, 28 Feb 2026 22:17:11 +0800
Message-ID: <20260228141715.35307-1-mitltlatltl@gmail.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:quic_mkrishn@quicinc.com,m:jonathan@marek.ca,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:gty0622@gmail.com,m:liu224806@gmail.com,m:mitltlatltl@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com,marek.ca];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 37B331C37B9
X-Rspamd-Action: no action

Add DSI display support for SC8280XP.
---
Changes in v3:
- add the missing refgen supply to DSI (Dmitry)
- Link to v2: https://lore.kernel.org/linux-arm-msm/20260228101907.18043-1-mitltlatltl@gmail.com/

Changes in v2:
- fallback to SA8775P compatible (Krzysztof, Konrad, Dmitry)
- fix DT styles[a newline between property and subnode, property order] (Konrad)
- use one dsi_opp_table and all dsi controllers reference it (Konrad)
- resize dsi_pll region to 0x280 (Konrad)
- update commit message
- Link to v1: https://lore.kernel.org/linux-arm-msm/20260225054525.6803-1-mitltlatltl@gmail.com

Pengyu Luo (4):
  dt-bindings: display: msm-dsi-phy-7nm: Add SC8280XP
  dt-bindings: display/msm: dsi-controller-main: Add SC8280XP
  dt-bindings: display: msm: Document DSI controller and DSI PHY on
    SC8280XP
  arm64: dts: qcom: sc8280xp: Add dsi nodes on SC8280XP

 .../display/msm/dsi-controller-main.yaml      |   1 +
 .../bindings/display/msm/dsi-phy-7nm.yaml     |   1 +
 .../display/msm/qcom,sc8280xp-mdss.yaml       |  30 ++
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi        | 404 +++++++++++++++++-
 4 files changed, 428 insertions(+), 8 deletions(-)

-- 
2.53.0

