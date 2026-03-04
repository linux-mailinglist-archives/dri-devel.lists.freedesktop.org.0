Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNTMFEg4qGkTqgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 14:48:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0069D200AD8
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 14:48:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B791E10EA0B;
	Wed,  4 Mar 2026 13:48:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dotWWyMG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 071E310EA0B
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 13:48:51 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-439c944bb62so495494f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 05:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772632129; x=1773236929; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QTTqK7TuaDqF+tP6hPwnkWAR5TFFHKJ4XYpEBPBHnmY=;
 b=dotWWyMGwLT/1gHWrBIuERsPzDeSYMw0Bs7BFixDqjz9I/8e1nUhvSQq2Uf203OKN8
 VCFyiPAwYEoyMFW1XkhZViH3+aVderkONWgrf7bbQZnoaNUAfajEpVlysyRwnsBX9eiJ
 QC65px5Snwm+8R/YP3LpOFY06el9vsAiQVf47FfmQBN9FfjkPHqNF/TgIhJdMIXuLywG
 TXaRj297G8/p1NtMH1Q7d4mEDucrxCuUfkeEwX41lafp0YJTh6St8tpPWlOTE9Ll1pPz
 k8Iy07IpMbkogFBgJyiAEPjtB2slZ5jnN2PD5zdY+OjDNritkbL26LLXUSrA+cY/zEi7
 GX2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772632129; x=1773236929;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QTTqK7TuaDqF+tP6hPwnkWAR5TFFHKJ4XYpEBPBHnmY=;
 b=FFutBmjwlWWfxiGLYGPEunxeaiRGj0xJqN83fbgVMWINraffpOKF2FIZny8n8EvVzE
 6qdR7gEdfJGSe2ISIXMP7ffaN1JtaJtdNp0oCnPUY8bhEBOHX7LenxPfRDdww+M0WBFk
 j0xfdTK3GiINp9QRZncNbr0KlnV//GS05Byl4uyHw6uAsjxUGnhJ5MdxgD8SlAbiu4uU
 JdRIVPKUQSn+h0l7idMHvTU1n2jxrO40HnGVt1iIjttXr9rqTkihpHs93Fqtpgop6AlC
 HREIdQYlLMUoJTYEJe6ha6RF5bqF/XW3VyjoV9eViF9FhuWpsSm/m8+xs1OUT3R3fqnH
 2YCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4yFj06P16DbNcFbRkXxzd4bWCsQgSO7z4I3E3EAvs4lhMyi6V5Iwq3lxQhuYBE/nUc5gf7TMFW5Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwN56EEUTu34VMz81lh0VBAYsYni68TfgZ9HpTKXikCSsHe9TWU
 lKiBmokKiDnLj/IlVKM/oc4OCf4znbqiRcibkiQ31eCaRWN/dW//8HfF
X-Gm-Gg: ATEYQzxPoGiaNDsgzmXuhMmJFF4GDCAHqlDSLslYaEWKG3065gFFWH91FKxzHPwrGB5
 f496owROCkiWNS8fZzKadzMUyzRejMjgMQ7p4R6ZVQ1I4GrNE2YcwIq2kttckIIz/xQ42BpaFDu
 f96X/qyclSCoiXusXGK/sP0Vbk/I2iM5vYXBjA92Jjdw/1EEgUoDz82e7yrczsHPLPKXbkiMlIm
 3k37bY0WYrvfrJt+XVaHj9umLoYtqT7sjE1W5EUpa7iGPDjyAnj4ct0PkYaUSqPHN1jSLDoLb2g
 21B9oWSrxut5DRVcwSsUhwrsrchANGxGAd6OnOJic9zVqpdAGeTx+ooGzTUjLPSR8+8mySazsCV
 duUu4HZKg33lg3p2GyvJGtSP0fYcYFBrd6AcF+9XH54yP+F7sXJb/9iANUmmbbUWpxb24srsZ92
 4N2MJQG4ms4EmYDiSjvSW/49XpqZf3GzU=
X-Received: by 2002:a05:6000:2891:b0:439:b3d2:3766 with SMTP id
 ffacd0b85a97d-439c7fae450mr3798988f8f.19.1772632129397; 
 Wed, 04 Mar 2026 05:48:49 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:de3f:f927:40ff:12a6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439c65e0b23sm7105229f8f.32.2026.03.04.05.48.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 05:48:49 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: [PATCH 3/4] drm/panfrost: Add bus_ace optional clock support for
 RZ/G2L
Date: Wed,  4 Mar 2026 13:48:38 +0000
Message-ID: <20260304134845.267030-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304134845.267030-1-biju.das.jz@bp.renesas.com>
References: <20260304134845.267030-1-biju.das.jz@bp.renesas.com>
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
X-Rspamd-Queue-Id: 0069D200AD8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[collabora.com,kernel.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:robh@kernel.org,m:steven.price@arm.com,m:adrian.larumbe@collabora.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:biju.das.jz@bp.renesas.com,m:linux-kernel@vger.kernel.org,m:geert+renesas@glider.be,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:geert@glider.be,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,lists.freedesktop.org,vger.kernel.org,glider.be,gmail.com];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,renesas];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

On RZ/G2L SoCs, the GPU MMU requires a bus_ace clock to operate correctly.
Without it, unbind/bind cycles leave the GPU non-operational, manifesting
as an AS_ACTIVE bit stuck and a soft reset timeout falling back to hard
reset. Add bus_ace_clock as an optional clock, wiring it into init/fini,
and the runtime suspend/resume paths alongside the existing optional
bus_clock.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.c | 24 ++++++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_device.h |  1 +
 2 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index 01e702a0b2f0..87dae0ed748a 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -70,8 +70,23 @@ static int panfrost_clk_init(struct panfrost_device *pfdev)
 			goto disable_clock;
 	}
 
+	pfdev->bus_ace_clock = devm_clk_get_optional(pfdev->base.dev, "bus_ace");
+	if (IS_ERR(pfdev->bus_ace_clock)) {
+		err = PTR_ERR(pfdev->bus_ace_clock);
+		dev_err(pfdev->base.dev, "get bus_ace_clock failed %ld\n",
+			PTR_ERR(pfdev->bus_ace_clock));
+		err = PTR_ERR(pfdev->bus_ace_clock);
+		goto disable_bus_clock;
+	}
+
+	err = clk_prepare_enable(pfdev->bus_ace_clock);
+	if (err)
+		goto disable_bus_clock;
+
 	return 0;
 
+disable_bus_clock:
+	clk_disable_unprepare(pfdev->bus_clock);
 disable_clock:
 	clk_disable_unprepare(pfdev->clock);
 
@@ -80,6 +95,7 @@ static int panfrost_clk_init(struct panfrost_device *pfdev)
 
 static void panfrost_clk_fini(struct panfrost_device *pfdev)
 {
+	clk_disable_unprepare(pfdev->bus_ace_clock);
 	clk_disable_unprepare(pfdev->bus_clock);
 	clk_disable_unprepare(pfdev->clock);
 }
@@ -432,6 +448,10 @@ static int panfrost_device_runtime_resume(struct device *dev)
 		ret = clk_enable(pfdev->bus_clock);
 		if (ret)
 			goto err_bus_clk;
+
+		ret = clk_enable(pfdev->bus_ace_clock);
+		if (ret)
+			goto err_bus_ace_clk;
 	}
 
 	panfrost_device_reset(pfdev, true);
@@ -439,6 +459,9 @@ static int panfrost_device_runtime_resume(struct device *dev)
 
 	return 0;
 
+err_bus_ace_clk:
+	if (pfdev->comp->pm_features & BIT(GPU_PM_RT))
+		clk_disable(pfdev->bus_clock);
 err_bus_clk:
 	if (pfdev->comp->pm_features & BIT(GPU_PM_RT))
 		clk_disable(pfdev->clock);
@@ -462,6 +485,7 @@ static int panfrost_device_runtime_suspend(struct device *dev)
 	panfrost_gpu_power_off(pfdev);
 
 	if (pfdev->comp->pm_features & BIT(GPU_PM_RT)) {
+		clk_disable(pfdev->bus_ace_clock);
 		clk_disable(pfdev->bus_clock);
 		clk_disable(pfdev->clock);
 		reset_control_assert(pfdev->rstc);
diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index 0f3992412205..ec55c136b1b6 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -136,6 +136,7 @@ struct panfrost_device {
 	void __iomem *iomem;
 	struct clk *clock;
 	struct clk *bus_clock;
+	struct clk *bus_ace_clock;
 	struct regulator_bulk_data *regulators;
 	struct reset_control *rstc;
 	/* pm_domains for devices with more than one. */
-- 
2.43.0

