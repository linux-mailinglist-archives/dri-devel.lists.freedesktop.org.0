Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DYxNklbmWkCTAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 21 Feb 2026 08:14:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4052A16C58C
	for <lists+dri-devel@lfdr.de>; Sat, 21 Feb 2026 08:14:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6254F10E15E;
	Sat, 21 Feb 2026 07:14:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PzjP1EG1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1AD610E15E
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Feb 2026 07:14:13 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-2ab46931cf1so23376575ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 23:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771658053; x=1772262853; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IJY8ZZY4WMcXwGgxq6y3UB/v+Z7nyRkvGlTdnxwP0hk=;
 b=PzjP1EG119e+3Svyl/WxDOAgeBvvWdK+1pDld28rT75O1LGxTqOSrD+SNoIuM0vAFS
 fyJQpWAA8zGuYTF3Pt4LOt+w6NJz9RbiVuMzbZoxIMFDZ2DlPbZ2Nbq6aRF7Ty0to2v2
 G6Bcg0Tt99tBM0wsFYIrnjD9y3XTzUWua1KAroSLOM4icJM2XrYHDUKxhtjqGEIkXs/M
 S2LAfR80tKmN7HOc2dQaxU9/2lK1GECnaZPAcnlvV8788XlnLQ8iyDPTPA/R2saoVgUD
 7hCaLiBO8Xo2zPqfmWL1LkTf3RVSW8tuABgu9MSMSw4h0F9hSmKi7UXShkE0KmtTktr1
 QTAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771658053; x=1772262853;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=IJY8ZZY4WMcXwGgxq6y3UB/v+Z7nyRkvGlTdnxwP0hk=;
 b=suTvRx0ISN8E+6fDv827ty1VvbjJisMGsgcOkftAoYDXjJbrhomERYMK5kPYU96JrW
 pV5LNbo74D/O5oHmxsZjVQggcLEFLRAAvDqulZYe0iWcYmAb3q6AV0cGkoUlhTnZTQ2i
 fvlognJwIWC4eWlQTgFzES3IlOH+/Oj9zq9j9cnNIOnF+PmgelPqYacFDTwwkNEQRjrl
 DB0G5qB35UDJfQsmifBTJrcS0bW014q25dztOlgez2Bs11D6Wi/HgEhV2PXqlkZw6etp
 NgNixOUKGeGUrj+JzmFM5o45gMod/PWUfS6uQCmocsmBId7hoIs3x7smVZXsApPId85l
 grlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8LHWnPSMgV1/v5PskhQdd9qWmoHnr1gZYCIh+zYj6anU44s3sc8dyVGZHbgdqRyLo9THobb6jads=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw50mQCUFHyaeCTii0yqJAC8ltlU3XKKfmw4IT2szDTB23Kmcux
 oenHgLcN+1IHh+B1blQC6Y/X4WGhRGt/zbbVQFYjTJUbVOuDdJPaFX5g
X-Gm-Gg: AZuq6aLyF8/VHFvzkaEnndKliCnx7RaqKVXxJTps/11r9tezNtLuHCQfZbYOO5+EiiM
 4aieF8ZQyEEcfAEv6CzLQe2XWhh9x+CyyR57D1Dicbq2wYliWPTl1Wz/Efp+JkOZddhZNWNfvRd
 T6uL8ITzkrg4WMY677nwdejb3W4PezmQfjla4nlCbd+INg4bw96/XyWyK4ZIWp55T7aLMS7AngK
 EpVrgwWYGLhGinyjY0Blo6RRHeln2Rr8/FYjStfhbkfz9HKmCuPZuXRzUcRymuIN3x798WtJzMW
 jylADZI5WVVFCPIp+l4x90Pr80z68cY6oiY28SvhptCewCXTgNtjL3dNhFW7iKPFF2+qEnwtuyO
 JfNiqV33XbGi7FBkppH/AzuTvnJVfzpsLaUJicDRcv7MQV7HvibdIoXG2oJzmpqSs8aksHRKc61
 /CYCmCITsUTbkcuXgdF3hfARtlZXsBFuYb8ihvdhntmQ==
X-Received: by 2002:a17:903:2f85:b0:2aa:f43d:7c41 with SMTP id
 d9443c01a7336-2ad741f51admr21007435ad.10.1771658053228; 
 Fri, 20 Feb 2026 23:14:13 -0800 (PST)
Received: from debian.ari ([152.58.178.174]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ad7500e2a7sm12657355ad.46.2026.02.20.23.14.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Feb 2026 23:14:12 -0800 (PST)
From: Archit Anant <architanant5@gmail.com>
To: neil.armstrong@linaro.org, jesszhan0024@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
Cc: sebastian.reichel@collabora.com, gerald.loacker@wolfvision.net,
 michael.riesch@collabora.com, miquel.raynal@bootlin.com, wens@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, architanant5@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH v3 1/3] drm/mipi-dbi: Provide option to invert reset GPIO
 logic
Date: Sat, 21 Feb 2026 12:43:49 +0530
Message-Id: <20260221071351.22772-2-architanant5@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260221071351.22772-1-architanant5@gmail.com>
References: <20260221071351.22772-1-architanant5@gmail.com>
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
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:sebastian.reichel@collabora.com,m:gerald.loacker@wolfvision.net,m:michael.riesch@collabora.com,m:miquel.raynal@bootlin.com,m:wens@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:architanant5@gmail.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[architanant5@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[collabora.com,wolfvision.net,bootlin.com,kernel.org,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[architanant5@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 4052A16C58C
X-Rspamd-Action: no action

From: Chen-Yu Tsai <wens@kernel.org>

When mipi_dbi (tinydrm) was added, the reset handling assumed that
"logic high" or "active" was out of reset, while "logic low" or
"inactive" was in reset. This is the opposite of how many reset
bindings are written, wherein "active" means the reset is active, i.e
the device is put or held in reset.

Provide an option to invert the logic so that drivers for bindings with
"active is in reset" using mipi_dbi can use the common reset handling.

Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 drivers/gpu/drm/drm_mipi_dbi.c | 4 ++--
 include/drm/drm_mipi_dbi.h     | 9 +++++++++
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index 00482227a9cd..7fa1f73a38a4 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -713,9 +713,9 @@ void mipi_dbi_hw_reset(struct mipi_dbi *dbi)
 	if (!dbi->reset)
 		return;
 
-	gpiod_set_value_cansleep(dbi->reset, 0);
+	gpiod_set_value_cansleep(dbi->reset, dbi->invert_reset ? 1 : 0);
 	usleep_range(20, 1000);
-	gpiod_set_value_cansleep(dbi->reset, 1);
+	gpiod_set_value_cansleep(dbi->reset, dbi->invert_reset ? 0 : 1);
 	msleep(120);
 }
 EXPORT_SYMBOL(mipi_dbi_hw_reset);
diff --git a/include/drm/drm_mipi_dbi.h b/include/drm/drm_mipi_dbi.h
index f45f9612c0bc..6cebf74bcecc 100644
--- a/include/drm/drm_mipi_dbi.h
+++ b/include/drm/drm_mipi_dbi.h
@@ -44,6 +44,15 @@ struct mipi_dbi {
 	 */
 	bool swap_bytes;
 
+	/**
+	 * @invert_reset: Invert reset logic level.
+	 *
+	 * This is needed as drm_mipi_dbi (formerly tinydrm) introduced reset
+	 * GPIO controls with "logic high" being "out of reset", while other
+	 * bindings typically have "logic high" as "in reset".
+	 */
+	bool invert_reset;
+
 	/**
 	 * @reset: Optional reset gpio
 	 */
-- 
2.39.5

