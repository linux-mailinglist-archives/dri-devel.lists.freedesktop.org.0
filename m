Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEoxA0s4qGkTqgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 14:48:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B23CA200AF0
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 14:48:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA9F210EA13;
	Wed,  4 Mar 2026 13:48:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mpfl/o4A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6496010EA0D
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 13:48:52 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-439bcec8613so2200516f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 05:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772632131; x=1773236931; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RenxENmarQZKEVcw1SxstoXvfw684s9sp4AM5Ud4YLI=;
 b=mpfl/o4Almy4naLUbftNlZVXuI/wHyNNHmB9eae4uxgQ9tETjaK8PKxNdddL/UwOKn
 GWystY5fTFJEWjsoljxD0K1pbKwx+UKX3ThzkibTmKYB3lbut/kF5RQ5PZNh0N5Fk2rf
 91oIacOwHKLz/S5wfkF1B8HaAVespanp0RBK6gY9LRcU6DVVga5AVED4Xz+gPu01uinh
 8XlBqjjp0GEoBHZlSZe8/qOZV/zODQhxCMW473+XYsGfTdk/53CpndhLa489rnzO7LbR
 MIoMxUMmcmmD6qCEL1UDe7kE4HpVn3zubUDaY/N11B7M983kHHHoEi5lS6VT5/Y1tKtA
 auSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772632131; x=1773236931;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RenxENmarQZKEVcw1SxstoXvfw684s9sp4AM5Ud4YLI=;
 b=NDe4ntw3B1VZMmn+mHUd5id9IKvTAKZluWd7D2ECQKkjURLjx09E68MNc5aJy/c52g
 ew64Oocltx7dsiFtwQoLccI3eptt9WBQlxH27i/lT+hdkyhA+zaKLV6ULJfSATlpQFO3
 M6qXBIX/KGworp7ExIrOAnVj8CPUZ8dgludohnBMbs7UTyVv6Cc30ziD9QeopFZYsKcd
 XeYkZKkQw9Tqw7ZYSaQY7CqySjgu0+a59zatLmVJjqjnAgOhtOlL+SXossrj6Q0Onj3s
 x3kjNV3pYMwbrPx/SCqRQqhU4RWolq9tPvxWThSjIoCk5gewwZfmPQOBJ2sEdXZP6klg
 ZjYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV939V05H92nAkFg9S8qf/hnDm539WaGiaG2NopYl9bpHHYIYMOhK1L8jGynrzsWo+951V3ZjmDEQ8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzGtWHkyxX434ZbaqCv5HMzxViC8RR2jYmE0Oe3FTEjpb7+9hv+
 YdNJSH1NiaeBcZj5Vl9P4NtKy7e6BW+Gd14+98l/8pfz43TsyNDz3b09
X-Gm-Gg: ATEYQzwdt+MQgWMHkMvypPYwEGLfBdtDjB5h1MWpLYYUrztrCtrZ20bSH7bALPuOGsl
 Npjz5qKXhYqxQ0Z/MOu6e36kEDUdnDrmuaTCViAnUSm+T1KHQyLXa1scZKWm7bhNdTSPNXX1ErU
 JVLSNGqqvv6llsLcfbUkP6A8jgTi4I8K258Z58caHFn+WiTbGh206K0gluanrl/2NPzho/dbGxW
 WnO74NZTnKlf6dlo9AUxg//Vc7KhN9U8+XZLagScc0fpHzYSMZSl6DvGEAYkJZmkIlMckXpC8Xb
 B+B3lpVWKZjy4TkRfxzKXb0oMYUzAh7S0DS40wHpBJJX6ufAXlD53ldNzNK39k7gwe36Gpe4FG/
 EM+hTAvYKzayRBpEMuAWTDYpfFsteMNGanj7rtXfUJcN8SO64qUdakDXelXkxNWJKs89/g2y1I7
 pMxjICbbBfkzb+ARqQznABmMCpctnHmmg=
X-Received: by 2002:a5d:5f91:0:b0:439:b1be:81a8 with SMTP id
 ffacd0b85a97d-439c80205bbmr3739474f8f.55.1772632130542; 
 Wed, 04 Mar 2026 05:48:50 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:de3f:f927:40ff:12a6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439c65e0b23sm7105229f8f.32.2026.03.04.05.48.49
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
 Simona Vetter <simona@ffwll.ch>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 4/4] drm/panfrost: Add GPU_PM_RT support for RZ/G3L SoC
Date: Wed,  4 Mar 2026 13:48:39 +0000
Message-ID: <20260304134845.267030-5-biju.das.jz@bp.renesas.com>
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
X-Rspamd-Queue-Id: B23CA200AF0
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
	FREEMAIL_TO(0.00)[collabora.com,kernel.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,glider.be];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:robh@kernel.org,m:steven.price@arm.com,m:adrian.larumbe@collabora.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:biju.das.jz@bp.renesas.com,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:bijudasau@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,lists.freedesktop.org,vger.kernel.org,gmail.com];
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

RZ/G3L SoC is embedded with Mali-G31 GPU system. Add GPU_PM_RT support as
it needs to be assert/deassert the reset during suspend/resume.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 711f5101aa04..3d0bdba2a474 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -1156,6 +1156,7 @@ static const struct of_device_id dt_match[] = {
 	  .data = &amlogic_data, },
 	{ .compatible = "amlogic,meson-g12a-mali",
 	  .data = &amlogic_data, },
+	{ .compatible = "renesas,r9a08g046-mali", .data = &default_pm_rt_data },
 	{ .compatible = "renesas,r9a09g047-mali", .data = &default_pm_rt_data },
 	{ .compatible = "arm,mali-t604", .data = &default_data, },
 	{ .compatible = "arm,mali-t624", .data = &default_data, },
-- 
2.43.0

