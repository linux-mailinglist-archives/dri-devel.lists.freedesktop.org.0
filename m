Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Pk3FX3KhGk45QMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 17:51:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B46B9F57F7
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 17:51:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0AF210E930;
	Thu,  5 Feb 2026 16:50:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lHQ3IHte";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D540310E092
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 13:27:52 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-81df6a302b1so6407926b3a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Feb 2026 05:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770211672; x=1770816472; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0QxiUUxXks3mDUShsHgUE4n9xVgAAJ6iYKwHeDQAktQ=;
 b=lHQ3IHte1Lvv8ygJMlZcrvR6enCrXshmIFwjG0m/rimjQ64j5/Vti33jxUarXFnmSI
 tuuG/yqDS6HMQjwsBOYELFDCJM4jxDwexr7M9Az2lrX44OIms1hCCPt/bKklNI0vWoUU
 LOB9M860KQ3RzT1uMDDSfWyhY+WraoBOU6vxCAY7ilQV1FTHLieqrGJRReGk820aKknB
 X97nF5OU7clhTnwXqfg6X3qTR2OdImY0TkPKIddiZNVHcViAduwZUilNt1yaBXg1QXRs
 IBRoBifCCCTEulxDN0oXCzwCHgCot+PKrp3LewUKSO1X/M490gih4A7zBHzhjqxq5JzH
 cFfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770211672; x=1770816472;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0QxiUUxXks3mDUShsHgUE4n9xVgAAJ6iYKwHeDQAktQ=;
 b=Xs3OKiVp3w8yMM2MXKK5Ce6MQdj97wIFDwpEpiD5nf+isKGYG44FBfAkDyDbxFiqTH
 I2Qe29VIW1OjLf5TuDsYGAH8I/PsQsCoAhYT5ZDRdbOx0aco5DyAIT/EvKXQAiNQh8M7
 X0IY+UAidbpHehutWVSGWtx1H/8A7StcWwzPAJma0JFpZtZPkbz7w5bU/rSLtdkDTeX+
 l3QzKDJceZWlLmq3FCc+eA3+S50RpWC6BA7Xpy81vat0a/8oHuAieRykrZboXdNEj5mn
 59zUyycd2r/4vbjH3ItQsqf12uFiE074UYdAsZkfIGvAAxZcxXeE4Qk6YM1+iG5Box6N
 jvnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnkDVAh64dOKNj4K/iiN+HLWdjfBAV6ZyIfR5RaZrrvoO3yD/wV5ix/BdSxBGI+I7xDlAYD62sZJQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6YHk9XIRbSugIMc2OjxX8UCZ5WgRWZ0swcTLQWI7TUEWUw9A4
 QTrpnT24ZTqK0j9jzZ9Lmvj/WIKNtGorgaGyVeUQI2zTDacAHjKZwJD7WZW58ek0
X-Gm-Gg: AZuq6aLMZJBjhbucrtkh+LKx7G3nVSLb6vxockuZUp5pnM/RREegu0vr28VJrdgVota
 xq9xm7W4h7gOwO/2W9t3+i470Ccf1BNKLT2Z92M9y2cW6IVIFcpWOyYnag82V5oOmoy6i5R4Hip
 UJEdrJ9JjBzWO+HYRfkIcabDFp/sqX/TitWlQiLNdUAOLxADnVpJyTdKfIiEoA8NLW2oGaP4GLt
 sm3QZg7RlhCtqoNMbZdUFjysxpNZwLLFmUlks6uVUqNUMt5h6tJRh1xeWwuiIkBM/sQNxCdujT1
 UUiToEO+Y+wis4p1WvZcpcb0F+rd6CFBedt8MHBtDl4zEEXtk6qZyrBIFlX3nYfGmLFtzlxPyjB
 WNDvbPXUW7WxKp50aUCM0GGXgNerxOtbPHypUW+wYps+fcVazlQ+bmGF3C5gaTJmmGh6fBe8lNM
 ggSL9DZrbBZFbce7JL
X-Received: by 2002:a05:6a00:114c:b0:81f:4944:c391 with SMTP id
 d2e1a72fcca58-8241c1e82bfmr3120904b3a.16.1770211672230; 
 Wed, 04 Feb 2026 05:27:52 -0800 (PST)
Received: from thickpad01 ([2406:7400:63:188d:b058:4381:a149:aa45])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8241d1b71cesm2437972b3a.19.2026.02.04.05.27.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Feb 2026 05:27:51 -0800 (PST)
From: Aniket Sahu <aniketsahu999@gmail.com>
To: jani.nikula@linux.intel.com,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Aniket Sahu <aniketsahu999@gmail.com>
Subject: [PATCH v2] drm: fix spacing in printk format strings
Date: Wed,  4 Feb 2026 18:57:20 +0530
Message-ID: <20260204132722.6692-1-aniketsahu999@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260203152127.88126-1-aniketsahu999@gmail.com>
References: <20260203152127.88126-1-aniketsahu999@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 05 Feb 2026 16:50:57 +0000
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
X-Spamd-Result: default: False [1.19 / 15.00];
	DATE_IN_PAST(1.00)[27];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:jani.nikula@linux.intel.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:aniketsahu999@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER(0.00)[aniketsahu999@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	FROM_NEQ_ENVFROM(0.00)[aniketsahu999@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: B46B9F57F7
X-Rspamd-Action: no action

Remove unnecessary string literal concatenation in printk format
strings by folding the space into the format directly. This is
in response to warnings from scripts/checkpatch.pl for
drm_print.c

No functional change intended.

Signed-off-by: Aniket Sahu <aniketsahu999@gmail.com>
---
 drivers/gpu/drm/drm_print.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index ded9461df..71aab4d22 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -198,10 +198,10 @@ static void __drm_dev_vprintk(const struct device *dev, const char *level,
 				   prefix_pad, prefix, vaf);
 	} else {
 		if (origin)
-			printk("%s" "[" DRM_NAME ":%ps]%s%s %pV",
+			printk("%s [" DRM_NAME ":%ps]%s%s %pV",
 			       level, origin, prefix_pad, prefix, vaf);
 		else
-			printk("%s" "[" DRM_NAME "]%s%s %pV",
+			printk("%s [" DRM_NAME "]%s%s %pV",
 			       level, prefix_pad, prefix, vaf);
 	}
 }
-- 
2.53.0

