Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBHAGuxznGmcGAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 16:36:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AB3178CFB
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 16:36:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0104110E3CC;
	Mon, 23 Feb 2026 15:36:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FnomW/76";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com
 [209.85.222.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C57C10E3CC
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 15:36:08 +0000 (UTC)
Received: by mail-ua1-f50.google.com with SMTP id
 a1e0cc1a2514c-94dd0f3c4b7so64855241.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 07:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771860967; x=1772465767; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gnop4z34aVye00gIQguUoewYT5lM9SytbUgSGtePF4w=;
 b=FnomW/76CIM1snAdSiFjfBYiM5z9ok0r6Gt9vpRQ2QG4gvyKMMYgHzh34F60vFYJZm
 IZdY8+tyAs4zCK2ReNvsoqI0G+ybhNhBX+Ejc1Dbg/Ww7h0nF2sFJYRSq+YwtQ80NID9
 ElXxsKuV2JMFBmlsuRLhDNbPsW+Co95fSvSPmCPnvmwxfWzm0m9CNIBHxso0ldxJdjQV
 wgxthzDz8B+XrHadG9dIPIp07yhDMgwbJP1XzwnNtHg4SJIXVgFD5ADTkGfV1TJBHKvr
 BqdsncCsj+6hc3oEKRlvtK7/N+C2jwZh2pGDSuVgSiGxRrhn5lfVjexHLl3FCBP8Xgpm
 p7eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771860967; x=1772465767;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Gnop4z34aVye00gIQguUoewYT5lM9SytbUgSGtePF4w=;
 b=Kc4m0gfZp2a41qPt8DxwuYsT363GMMZaMJbPrkSDq+8itJNga3ZI0XmRmuNyTcx/vh
 QShZjhVea+DIuhnpwwkUS4UPOZBHK9ozX5CFgWj9HIf4u0wlU9xGB+XV6MJrp0X5QspT
 dTgy1JTEN6wyGsoWozlABDxvTEkB2RjM4CY0Tz/WeyJM4rQDBlEclAG3zgKTrrnvUAGO
 0IGQC6+kN4aEYcuwRqjXLlnCrDVxQr3BrOfzWqDIGSZeZbwMghj7QpJ8DFiQ+5k0GD6h
 vcJx8bYb4I1RgHMVei/0o8LASCNkBcd1By1qPvYt6HZm2u/e3i+CEfDeFvUezAWFNMYe
 ZQmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoy7XbpfpV/v8Q8IJTEPsCq8XmSnFZC6zlbXDXpfzabDX+Wxrk0ktrcXWTYIc90Fkg8XHhlFcW7+o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxWq9cSl5lCCyGCRLiiizcpPZrD6gJf5J9vmBn7cUUrnWv7XC+3
 3EkK3Xag8bPzgxaXv//n4PPg4AXlbzuD0Ad5/XGQ4C9zYJgbQiaX9PhUBtAlhxMo
X-Gm-Gg: AZuq6aLG52db1/EBZReYLTLRmndyWlJKjkEGcocFIpZ54Tn3qVf5qtOCfKcsPIj0ikt
 mC8lJ0ojOjm9R4hU6CUTaCkBJIQfnjdkXoGIxbgXKLwYo9mwrGUmdOrJkHxzxGprD2LU3+qmuOD
 TezcBMyY0lsGlgQISRNevX3tSzcSNRHq7Bo6a3sxr9YSKVQytmPZ6y/QSvuudpffCQmQvDQeljS
 wY4UhkbJvfB362B4lXXQQs7zwOq51BDCJeblPEa2tu97ns+r1rlflwsbxp9TwwDCR4WOya42MUp
 sFKrczIM+VClP206F+qjpSQwheMn26KhnEofOupzzaNW+xQYsjOEM+7F96RzFj8e2s4NvxzY7nI
 enrrfgz9v9nH5aydtUDSnCNVeEJmdDVY5VkZPYUqgtxwOvfhcgGJKs/10PSOQOCkfY7oQvraTro
 WxXsGdFIm69/NlbVWx7/ghFPhDjKepPNywnNE0T4ellQWeNleusN1Kl9he24pLMP07+9nnBb04e
 iyQBD0DiBo=
X-Received: by 2002:a05:622a:249:b0:501:45c5:935e with SMTP id
 d75a77b69052e-5070bb81b0fmr101683041cf.7.1771854588482; 
 Mon, 23 Feb 2026 05:49:48 -0800 (PST)
Received: from mighty.stonybrook.edu (nat-130-245-192-1.resnet.stonybrook.edu.
 [130.245.192.1]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8997e62f453sm67954716d6.36.2026.02.23.05.49.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 05:49:48 -0800 (PST)
From: Mithil Bavishi <bavishimithil@gmail.com>
To: aaro.koskinen@iki.fi, airlied@gmail.com, andreas@kemnade.info,
 conor+dt@kernel.org, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 khilman@baylibre.com, krzk+dt@kernel.org,
 laurent.pinchart@ideasonboard.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, neil.armstrong@linaro.org,
 prabhakar.mahadev-lad.rj@bp.renesas.com, jesszhan0024@gmail.com,
 rfoss@kernel.org, robh@kernel.org, rogerq@kernel.org, simona@ffwll.ch,
 thierry.reding@gmail.com, tony@atomide.com, tzimmermann@suse.de,
 andrzej.hajda@intel.com, bavishimithil@gmail.com
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v8 2/8] dt-bindings: vendor-prefixes: Add Doestek
Date: Mon, 23 Feb 2026 08:49:34 -0500
Message-ID: <20260223134941.427-3-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223134941.427-1-bavishimithil@gmail.com>
References: <20260223134941.427-1-bavishimithil@gmail.com>
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
	FORGED_RECIPIENTS(0.00)[m:aaro.koskinen@iki.fi,m:airlied@gmail.com,m:andreas@kemnade.info,m:conor+dt@kernel.org,m:jernej.skrabec@gmail.com,m:jonas@kwiboo.se,m:khilman@baylibre.com,m:krzk+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:neil.armstrong@linaro.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:jesszhan0024@gmail.com,m:rfoss@kernel.org,m:robh@kernel.org,m:rogerq@kernel.org,m:simona@ffwll.ch,m:thierry.reding@gmail.com,m:tony@atomide.com,m:tzimmermann@suse.de,m:andrzej.hajda@intel.com,m:bavishimithil@gmail.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-omap@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,m:thierryreding@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[iki.fi,gmail.com,kemnade.info,kernel.org,kwiboo.se,baylibre.com,ideasonboard.com,linux.intel.com,linaro.org,bp.renesas.com,ffwll.ch,atomide.com,suse.de,intel.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[bavishimithil@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bavishimithil@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: D0AB3178CFB
X-Rspamd-Action: no action

Add vendor prefix for Doestek Co., Ltd.
Link: http://www.doestek.co.kr/

Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index c7591b2ae..70a195fc6 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -437,6 +437,8 @@ patternProperties:
     description: D-Link Corporation
   "^dmo,.*":
     description: Data Modul AG
+  "^doestek,.*":
+    description: Doestek Co., Ltd.
   "^domintech,.*":
     description: Domintech Co., Ltd.
   "^dongwoon,.*":
-- 
2.43.0

