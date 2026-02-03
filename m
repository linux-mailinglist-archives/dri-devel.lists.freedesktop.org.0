Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDipCYZCgmlHRQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 19:46:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B96EDDDCB0
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 19:46:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C84EC10E2C8;
	Tue,  3 Feb 2026 18:46:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ThjId4B+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAB3310E6BE
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 15:22:17 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id
 41be03b00d2f7-c61343f82d7so2297160a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Feb 2026 07:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770132137; x=1770736937; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JSZkVgiofjK07CSZH9W1LRi1VgYOmli3jIew7IEe2KA=;
 b=ThjId4B+rvhdGAKjsOJ5FuX6sN/kAA87v2I2kC43pQAg1sJFi1XIbhq7ZbysBgp4rI
 9eK6zxFt8lDcle2hjx4UbWBDiYySoZ+N9G9FylTH+UafZhek/VoG7Y6ukmNk7QDpV5KI
 D978RaCAoQf3EcD/ZscRLJFMXHsQiVVTloQhy1MVK4iQs97SN1bB9bA7zXEQUzJ0bpap
 ICcwOHxOpgnUPDJ2MDyd3JVuYVU/ewYaDKjle6wF2ZD+8YgoDKXhCGu5PAL+nMLI7ROP
 T37aSg+tVesPuPuQM4BbkhJHrargOLwc99CuGebW57gvmP6L8OKafGjgW2HFqEgDXiJR
 ixsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770132137; x=1770736937;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JSZkVgiofjK07CSZH9W1LRi1VgYOmli3jIew7IEe2KA=;
 b=DZh6cF6cxKAAelKpg3OqoI7IcS8pS5TDUV+3/+GHA3ebUGMJoLef4ghY0NV+zHf5GX
 a8VDiPLf3CfNfWWMOtQQzXWFXHFD7F3OlrBzagYUjm+9GGgGSUpc5wrK1eXmq5Gy8H8F
 vYXYUTThBOLuCE/7rSn5Ri+Bi/JOHF43YK8ACRjQe755U5AGsN2k88NuT+khSIZ/Ox/6
 ITcFcnAWamw//JAe9FZiMtscc0PR6N7GxMBNJttlT3LlaGoGu37sLTskO0+DbyIqi4Qn
 pD3BpB+v8z4iIWq4xIKYIYDe69LmoZySM2lk0jFR+D3BIcbkfMxTR5xX+CT4tH/pmBVZ
 JyBA==
X-Gm-Message-State: AOJu0YyV7hreqhSWnUut0P54NOXYrhU39SI8HloMvkXYhKl6KIeAXtqY
 R4tsXElozoVtom0zraKtNs3iV73c7Klwr2+kVxG8lDfDpTn196S5NSKB9Pu+3Wlu
X-Gm-Gg: AZuq6aJAVxtop8aRQWw7lQ6vFAfbvur6+3js8LfP6prbJHuWjMnQcKpytyKANRwDda8
 Na+NH31oaK2Wu3WFbcIb3Ku+aKNUsaIGw4yBHSYPe8aYLQXw4sbWTsjzaxehiJ9040AeDHQh1oZ
 Yw83NnKQ5roGoIi0g87dG/F4mhhR3cxLrnQEawyeUf6OQGLf0Wllre8zJ7GLVNVjq+EkRDEpi49
 nRhXdhlaAk9mmqUXB46Aa2WHru/Wj6BPvwoJ1BIObDuT/xBgCX504GwzSs0rmN6T2BEeC1kV+vh
 gGPPkLq9L895fXRJpot+oH85ZqbCnni4sr+dihC7ohM0I/mG0JM2S1TOaQFcVt+1QtL9YP8MDqV
 miszLjPURk5x5kK/7qURXv84X3bOXGdboNKT/KjhRjKza+2dju/RVHAKXVuMJv9lSrj3Mj9NbHm
 WlUYgq889xne4aa0yMt2fXwOlinb4=
X-Received: by 2002:a17:903:4b4c:b0:2a0:d5b0:dd82 with SMTP id
 d9443c01a7336-2a8d81bde0fmr177373945ad.61.1770132136800; 
 Tue, 03 Feb 2026 07:22:16 -0800 (PST)
Received: from thickpad01 ([2406:7400:63:188d:b058:4381:a149:aa45])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a88b4c3b29sm170551525ad.54.2026.02.03.07.22.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Feb 2026 07:22:16 -0800 (PST)
From: Aniket Sahu <aniketsahu999@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: drm-misc@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, Aniket Sahu <aniketsahu999@gmail.com>
Subject: [PATCH] drm: fix spacing in printk format strings
Date: Tue,  3 Feb 2026 20:51:27 +0530
Message-ID: <20260203152127.88126-1-aniketsahu999@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 03 Feb 2026 18:46:26 +0000
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[aniketsahu999@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: B96EDDDCB0
X-Rspamd-Action: no action

Remove unnecessary string literal concatenation in printk format
strings by folding the space into the format directly. This is
in response to warnings from scripts/checkpatch.pl for
drm_print.c

No functional change intended.
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

