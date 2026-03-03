Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIMMDhefpmlqRwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 09:43:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA88A1EAED3
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 09:43:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E82B10E673;
	Tue,  3 Mar 2026 08:42:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iB/sJfET";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8733D10E666
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 08:42:57 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-389fa0d1040so76322591fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 00:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772527376; x=1773132176; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HZu8rHNV14RcsNYnYAtHHPAFsuTgdzw+TBP2m+knG7k=;
 b=iB/sJfETpTnMeYkMasaxpHLwBql1oP4DewAx2Xtn5foKgj0szIT+GOIB6kKOo1RnYK
 pK/wMHpn0mCEE54h4G8kAjaA1F5TytE8D+Z8HLKX2GH6O2kQq54GXt9cD7g3BLKO4USV
 2R0QJ/5TYK+kv4Wau8Xehs1aA8ZSH26+/HPoom+gDrobr8GYNm1cG0l1Q+krlS4Zi0TR
 FG9Y6Vt0ZkdghxAwjg0C/s71L6FYC/0xECqGZC4+ya6r+jtJiJ8uqDpEfBT0TYVrwvhU
 2vSjuJBvaXMcEjJTzcbHvL+8tlRUcjMwA8iNItOnX7Atb81lk3VX9fBLs3N/LjDyid6t
 7Wxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772527376; x=1773132176;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HZu8rHNV14RcsNYnYAtHHPAFsuTgdzw+TBP2m+knG7k=;
 b=vn/OFZNskgiXO1iJvZfDttqvm5A7uU8Q0S7EaXhpqQAx9cYYtlI494WIaV1m1kYZ1H
 KG3gktbe3XTf5xv16jtRUUuVpYmvExv4BA7BGultQW3uQpsR7mISN5mqe9mWzaF9dno/
 5ALN4uLkU3jDNbZB4fOIvp7YLeg+pXr3nmvb5BXNpW6bnhWtzxHp3mBvENycL6EbdYQ7
 yZo3f12jnwEMqcSlnzQUyPmemYQpJBSGlEoQ3l13PvOl3MZ2MqSdlTjgjK9lv0/kPHl/
 tUj/XT6G9AZDTD3qBNU1tbLiIx6fi1/1LIgbmF+neF4kd3XmycxwFGKOxCTEGd8aOBEa
 dDMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwPFMwgEQCz9xtLYQ0v2TaOcXWFQiB3kARPVceQLeiUGlEDRoQcI/SB3W4DXph3UVamhvQz0EKOKM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBX1iLFNkEgh0Ecs1P2qNO3SNARlPoN58Ej2xWjC3H+SHRc070
 Up1+654j66rOX+oIwtjd821w0DU5uauJQCyS/pMFmoBS/aBMAVr41kRa
X-Gm-Gg: ATEYQzz0Bwhg2hmC4Z0Gi8GPyfLWdNNkONrWd5TSifPTP5hQ/L2UdrY44/vJ6tsGpDI
 XERMzCyv5as3HtNWkLeWozOn//WOuMgtLuZ3HDvMvlq+dpwglS4yvv/o1JuWBIy0ETtEBD2C4wb
 dM0eCC02m5WQ4kWfaQGuZe1SUowGQ7LGW30hNEsxxzhxidvyznqoVylKqBwIeJYXy0w+8VPlT/d
 KAMdwoO5nV/XfERtk6QMGeTHV7iUOkG+fDDzvLawF1S+y9804YD7gP+ktU4jcnC9yk6iFEq0mSg
 LIs6+ybAxBcRmXrj8gL8cdavPrLT+S84CfKwju91PEAqYMk78mMCIqkmMTOfgWeaVWPv1yO0CpI
 jgqNIk6yF3P4QqyWpI+JHkb7oUmSR8wlfSEeYnJ93r7d94TXOYdg7HdNRzjnFlq4SUrOc57rR2s
 dhWazXhAEqtI4m
X-Received: by 2002:a2e:be23:0:b0:387:1836:e7a3 with SMTP id
 38308e7fff4ca-389ff105659mr100636351fa.5.1772527375546; 
 Tue, 03 Mar 2026 00:42:55 -0800 (PST)
Received: from xeon ([188.163.112.72]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-389f30227a9sm32599471fa.42.2026.03.03.00.42.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 00:42:55 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: [PATCH v7 04/15] staging: media: tegra-video: csi: move CSI helpers
 to header
Date: Tue,  3 Mar 2026 10:42:27 +0200
Message-ID: <20260303084239.15007-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260303084239.15007-1-clamor95@gmail.com>
References: <20260303084239.15007-1-clamor95@gmail.com>
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
X-Rspamd-Queue-Id: DA88A1EAED3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:thierry.reding@gmail.com,m:treding@nvidia.com,m:mperttunen@nvidia.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:jonathanh@nvidia.com,m:skomatineni@nvidia.com,m:luca.ceresoli@bootlin.com,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:hverkuil+cisco@kernel.org,m:clamor95@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:thierryreding@gmail.com,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[gmail.com,nvidia.com,ffwll.ch,bootlin.com,kernel.org,linuxfoundation.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Move CSI helpers into the header for easier access from SoC-specific video
driver parts.

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, parallel camera
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/csi.c | 11 -----------
 drivers/staging/media/tegra-video/csi.h | 10 ++++++++++
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 7842104ca933..f858c05ce6c9 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -20,17 +20,6 @@
 
 #define MHZ			1000000
 
-static inline struct tegra_csi *
-host1x_client_to_csi(struct host1x_client *client)
-{
-	return container_of(client, struct tegra_csi, client);
-}
-
-static inline struct tegra_csi_channel *to_csi_chan(struct v4l2_subdev *subdev)
-{
-	return container_of(subdev, struct tegra_csi_channel, subdev);
-}
-
 /*
  * CSI is a separate subdevice which has 6 source pads to generate
  * test pattern. CSI subdevice pad ops are used only for TPG and
diff --git a/drivers/staging/media/tegra-video/csi.h b/drivers/staging/media/tegra-video/csi.h
index 609c5952e050..2b4d586d3845 100644
--- a/drivers/staging/media/tegra-video/csi.h
+++ b/drivers/staging/media/tegra-video/csi.h
@@ -155,6 +155,16 @@ struct tegra_csi {
 	struct list_head csi_chans;
 };
 
+static inline struct tegra_csi *host1x_client_to_csi(struct host1x_client *client)
+{
+	return container_of(client, struct tegra_csi, client);
+}
+
+static inline struct tegra_csi_channel *to_csi_chan(struct v4l2_subdev *subdev)
+{
+	return container_of(subdev, struct tegra_csi_channel, subdev);
+}
+
 void tegra_csi_error_recover(struct v4l2_subdev *subdev);
 void tegra_csi_calc_settle_time(struct tegra_csi_channel *csi_chan,
 				u8 csi_port_num,
-- 
2.51.0

