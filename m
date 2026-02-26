Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMPDFf2MoGkNkwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 19:12:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B061AD5AD
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 19:12:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C64810E9F7;
	Thu, 26 Feb 2026 18:12:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jIezqBqw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8F7810E9BB
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 16:38:56 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-798374d0f44so31554657b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 08:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772123935; x=1772728735; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VQsc8cJztTF76PG4R+gL+xvTB4Nt8EQAhsB9W1n8IoE=;
 b=jIezqBqwf8xoT4trrHhzR2HZmVb6IrsXcwKOicVPpYCyT9bMtD3pdtlZnqLkk/SJD+
 3wlIl4MQEoZhTQyP50cO4gIWK4WjRn9qFmiRwgdF/YRixO/6mXbWx9hUGltmXUUooaWQ
 t1h2SuUS/uCOG83uCQF5i+A3h4ZStx2HyPSq4as43sj6HqInZPns6jn0pcG6XTgjr9wr
 WpfQcJnGcWon0N8trtpBqi988VC/obfPp6JsnsrQfp4G4YnSPIDrmhDPDmrQ5H4xNPuy
 Sx0bWrTxNeLa+AydhtuwlbQ7dNu1wvQEUe6SpwScbI9qRKgFlMLsBZyBbsLHJ/YqtUVq
 6kKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772123935; x=1772728735;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VQsc8cJztTF76PG4R+gL+xvTB4Nt8EQAhsB9W1n8IoE=;
 b=IzH8CsKg9+mMsiEFKedorWwEQiS2FQhGxos1zOZUf3LTsYb/GPL98HZnvfUywLU0lu
 VKKNsPy0eZNcBq73fz4Fl/zv22xfUBUvrEhz/lQsxA45x3607ycwiHJipiJaL8kDh0Lj
 zBtzpWgEwB93ZlAe/HDP/yelyfx707JWOWItjJuyG9fBCZXcXv/EKELAm/wP8Yo4jHgD
 zQ2qF8ViQpLZBaZKjsHbLPOybiZhHKrA53qEmUtUnEBs4yDGDq0RPEvIhDQvU0V/MJ0b
 NOWBGTjZHbUOtrrXIQ0R2HznkgDU2raZWg/GfSvcKuoAiDbFiMFn1Ru9bN3qwXnKc867
 n2xg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfVtBs1Fb7oog+uU8/2V9JlJQ7dDkZqgTTfhJe0iSNjUo8qyXhzHFDcTZd+roHZebyu5WA/M1LPrA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxkvAlyc889TyOYjsaNkVT1vf6u4+9bq/cUtb2lytQHGmXXubKB
 H4TtHitCZvnaUIUWk4jwF5jHEX7kQjNAOemNdqgD/nmStUKzmbrX0Yvx
X-Gm-Gg: ATEYQzyd4BNG2Fi+psVC/ZfzGG3msh+TTae+m8kUbX+Lx3+ccQeYFXXQ8GBxHsizy+J
 KCAdbg4H6rA/M8deoCl5mQNqDTnvou4mF72OtYgy7GsbR9oN+kzyZN0ZQcRrYizPHtx5l8zTXOL
 dRkPkpO23DH9v2lvSlejELu9LjJvk5K30I5gf/6DmdgUm0IxiC16Hr26zjZZZJHeJsMtOOiNFvU
 Zg3gnGTFLE6qdL7uxkLuqClvBzX/i4He+gggWH4fvGaqd3ihanO03Js7juvBA4xPbTIt2fPyTz9
 l0wpn812rG2nT847oxDZFrkeGCfSynBHt3cF9OQt9UNIsCEDfJqor+phvDfBwePd3IhdcpCuAlR
 Gana4flV1rwOY67m6sWikV92mugcqpa5j7OYTaWPe/l7IE5vQGDjbiT1sRWNnyGv1BmcGfmwhn3
 LlP/0MadzNiyQExSFjUP8pyVqElzBpkgO4+mkTWukhnaiK4XYfuhrghao8tKLIWBJK0jRKArvCW
 DYZxHEprQLMX5SfA50r9Rt0
X-Received: by 2002:a05:690e:4492:b0:63f:96d7:a369 with SMTP id
 956f58d0204a3-64cb6f19ad3mr2308595d50.28.1772123935319; 
 Thu, 26 Feb 2026 08:38:55 -0800 (PST)
Received: from tux ([2601:7c0:c37c:4c00::5c0b])
 by smtp.gmail.com with ESMTPSA id
 956f58d0204a3-64cb74b985asm1150803d50.0.2026.02.26.08.38.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 08:38:55 -0800 (PST)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: wens@kernel.org, mripard@kernel.org, jernej.skrabec@gmail.com,
 samuel@sholland.org
Cc: maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH] drm/sun4i: Fix resource leaks
Date: Thu, 26 Feb 2026 10:38:36 -0600
Message-ID: <20260226163836.10335-1-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 26 Feb 2026 18:11:59 +0000
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
	FORGED_RECIPIENTS(0.00)[m:wens@kernel.org,m:mripard@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:ethantidmore06@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,sholland.org];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[ethantidmore06@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org,lists.infradead.org,lists.linux.dev,vger.kernel.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-0.997];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ethantidmore06@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: D2B061AD5AD
X-Rspamd-Action: no action

Three clocks are not being released in devm_regmap_init_mmio() error
path.

Add proper goto and set ret to the error code.

Fixes: 8270249fbeaf0 ("drm/sun4i: backend: Create regmap after access is possible")
Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
 drivers/gpu/drm/sun4i/sun4i_backend.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c b/drivers/gpu/drm/sun4i/sun4i_backend.c
index 6391bdc94a5c..e989f75c09b7 100644
--- a/drivers/gpu/drm/sun4i/sun4i_backend.c
+++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
@@ -881,7 +881,8 @@ static int sun4i_backend_bind(struct device *dev, struct device *master,
 						     &sun4i_backend_regmap_config);
 	if (IS_ERR(backend->engine.regs)) {
 		dev_err(dev, "Couldn't create the backend regmap\n");
-		return PTR_ERR(backend->engine.regs);
+		ret = PTR_ERR(backend->engine.regs);
+		goto err_disable_ram_clk;
 	}
 
 	list_add_tail(&backend->engine.list, &drv->engine_list);
-- 
2.53.0

