Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNB+DukbrWlzyQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 07:49:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E078522EC15
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 07:49:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C41A010E0C0;
	Sun,  8 Mar 2026 06:49:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="U25QF7HU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A76B210E062
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Mar 2026 06:49:08 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-2ae4d919f9bso43235965ad.0
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Mar 2026 22:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772952548; x=1773557348; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aNIHEpkAqWiAErrHYpSRHcsVSQ/YY6yHFTO8cE3ikuA=;
 b=U25QF7HUctbUNmxKREpuhc9/1GWMKa8owYpsSxt+NY3MaChFI5pUR3TxefYiQBLbYA
 cG5/NW644jWajK6i3IRc1AJS+tlqBjuV6FkzD3m9Ln8JZsqN5c9qlBvbvpF2zavou8rL
 zQ4aOMGa6XAtgYOjFsL8urVhPtLTPN07aE31OVva/PmY/XR5UFjZHFh3eFodJTwFFP0K
 /7pnnWLi/ILzTY4ieAIzYWr61TVVJisa2jGErxZO3JREWafhloLdSuxRo8iFWaZJxqLd
 /Ju4Hrd0sQ5iojIRmEpzBNnkyvWZ7TcXN4+wNMH0qnS60KEDutPtVrbE/YP2lJC7PKi7
 lcxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772952548; x=1773557348;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aNIHEpkAqWiAErrHYpSRHcsVSQ/YY6yHFTO8cE3ikuA=;
 b=GKobNSa2rdZnIDkYRqdDfPS04zLx4vmhJgdynA/Gk4FhDDb4WNnM8u+knZlqv+98p4
 kYgSuTuOuF7NFklxNTYfRaVIAY7gcxUbHEVWuRWxbPj+W7cdF1t0n2APjMcbDj23cbt0
 DkFuBxBdLjZiyG8+Pqy22MHSc+mp6dsGb4JkE3S2bbl/3VJkQmdyflRLaY+C7GWzUDuM
 cZTMvyNHZqu3v+XaJwM9mhAfFjIn/APLL/Y+CtVrGU3SkagI4a/uDHkHit9G8L87KzIt
 1WMfXxEysJGGf7+V9pK+EQsLOq6RD8KTzingUPQ0/AeVhHPVSuiyA/Ce2y5WyPjSJTFB
 PuGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpUBfFcpYIklsiUNPnHslDWnMSJTOcYeYSJnqyWoOqoSYUHqNcsrEJXu+w0kznTFjbGvb2N7ENSNE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxPB9miYirU/eKi2Eou1okTs8FJ9mfgn7hkk9yunNwr7qYmnQ3q
 WqM2gTrEAQ3xuJCnFVhmmpoSoUZ8bmUU0lYcPXawzvr2Xy9IEuBKs3ES
X-Gm-Gg: ATEYQzwRTpGsvGUTTsLbznrYYDMe++81V7A9TNV2pxXCNxpzgRGM7sZaTymAOp2PJ5e
 jmwJi9NkEIxNP8T4qwKJGKgQElPlgtBGKN7d1YRKacb5apJUN3SRhOpHhfJgJgMO8bUslmImWRS
 gZldTG5nm7E+IrCE8dUozXAd/wBhRI3ocVZ2DsqV8zgz53AoedwQvZkuNNoE7juyErU7wLB1D/E
 vtiLSEhieldWVQ4nLPmv4uAkx9LtMytRzotFwNYTN44fbp0M4OtwhImxY9PuvMK4RGHFa6jvNEN
 74azQGd8Bj7bNjqnUlsBr2Uu03s64V5pQ1yc3WBLyJ6Rnd3bdHHAZMwvODvqpvpQdx9Z4Woe7fP
 O1cXI9tOO97oOKZBfMUvs0wZxmMPNTuOcK/fInjiZzdF2SYLh+xR7SHYtG0RaKVV1LS9MKBbeZs
 vpN1+hT3LOKCVYjRjUoA==
X-Received: by 2002:a17:902:f70a:b0:2ae:8253:1a78 with SMTP id
 d9443c01a7336-2ae82531aeemr77776095ad.17.1772952548110; 
 Sat, 07 Mar 2026 22:49:08 -0800 (PST)
Received: from nuvole ([109.166.36.159]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ae840c9a0csm72503225ad.91.2026.03.07.22.48.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Mar 2026 22:49:07 -0800 (PST)
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
Subject: [PATCH v4 0/4] Add DSI display support for SC8280XP
Date: Sun,  8 Mar 2026 14:48:31 +0800
Message-ID: <20260308064835.479356-1-mitltlatltl@gmail.com>
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
X-Rspamd-Queue-Id: E078522EC15
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
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Add DSI display support for SC8280XP.
---
Changes in v4:
- add missing comma in DT
- collect tags
- Link to v3: https://lore.kernel.org/linux-arm-msm/20260228141715.35307-1-mitltlatltl@gmail.com

Changes in v3:
- add the missing refgen supply to DSI (Dmitry)
- Link to v2: https://lore.kernel.org/linux-arm-msm/20260228101907.18043-1-mitltlatltl@gmail.com

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

