Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMG0Lr0Re2nqAwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 08:52:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24943AD053
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 08:52:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6604910E30C;
	Thu, 29 Jan 2026 07:52:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jMYqjrkI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com
 [209.85.160.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67CD110E30C
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 07:52:25 +0000 (UTC)
Received: by mail-oa1-f46.google.com with SMTP id
 586e51a60fabf-404254ffe8aso503519fac.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 23:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769673144; x=1770277944; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gnop4z34aVye00gIQguUoewYT5lM9SytbUgSGtePF4w=;
 b=jMYqjrkIkC8tvS+8OfVKE+IgR4yYNIJkL3pzv4JQ8nDXY8fCLA3J/hEtYhZu9jsiv3
 IGi5GA/2bmmsM6pnzRs17tpVzF8LjpSSezesfxwo8Wpc97+IzOsIWvPc0A6w+DpBzLSH
 b4PDYDla/Nj6VGTC3uNaG3XFd7L6exsrnhVbB0UJv/M9gvW1Qd3novqRaL3wSH9U6Q09
 jUJaoJR27V7lRwd9nwI8X30yIy9mHcrF7yz6QI7R9n/FtmhywF/T1QqZMWMRNWPDHkre
 3iUq64RCfXjk+1lAhMxmaruQDsVjZtTTiHNp427gD/KuGycEvUm8KXysLOgXsMoEuQPL
 UotA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769673144; x=1770277944;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Gnop4z34aVye00gIQguUoewYT5lM9SytbUgSGtePF4w=;
 b=Fwp0g0QvK8LMdAF0lxAQm+hiPQDC+996LTi/DQ3UssfxhiL4SSyGl3gISytkGl6X+8
 uiz+i9u09hKQJHiW/F2uCbu+wG+4x0Wt1yJynIE+jBx9YBpQWZPIdxwwD+Bd6hSelJzW
 5tEmpD2AuINno7hwq1GDrpCQmnRaFNRMys9jOlJf2eVfxHWlv8eAWUczOqHGODOOZENL
 qsF1BXwFJbgd0oEbU5626giBGC99DJeKx9sdDF6+MOsVFyKCCPNhqk4Pi1jViuluvwES
 HAR/+x0FyXoZL7s5yKabrv4dgXR/SPX8eUuH5QdJ4zIMou7UszVmfiwPEmabraenNCKE
 vjgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpd5or+GZ0hP9X0msFZO14lvkj9o3jN59MLrgsYrt2t3PapnBOrsWn1sfdTuj1opB+KHpAbUp1X/E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzoJLD7erXNG13HCxgk7S12nAgCJx54CukWu8WYfx1IxsPHpbxV
 M5UkW9e+KvD00P3UaVE6DfumuuXMt81KXeI6dYCmGNTHTYa/d3Sx9Go6/8tPRRSA
X-Gm-Gg: AZuq6aLxxcKWrEIfT+MAFgGapcscPqlGYNUddiEDvj1s2y6z05gFaLHaWOfKQSfcKNF
 i7r5yVOIObbq+9ggzxEjCClSgbutLvMYnnFlut3YDudi3NSgHkx6RI43VfD2BIzpsojUMh5ZrNG
 xAf6lw2NUx828a/p0Za2g27sZBf70eSm4EpkGgZGQP/PuOGHavlTsWIJ/fXNOfwM8qu6v1pM5Pq
 PRvmswY7WceSKaa31NPAJDhZt/coRHoIzdLYEZV+qenlMHnmtwyR/87e8GOonBBk+tRXmMOc3Vw
 JEu7WlpGjc/Cf1iK4hmYK4J/VzR0Kttp5ERcWuICAkQzqva76fm9B4d6XpiJOPjL8GnrYV5ykYY
 56gawkKaJ2kbn1QW44TirzuYwmDu5N1/saaGupIk26+PsFyMNtFhjwOw5GHk4zRUUnqrjd5bONx
 0vvOngA+uqZ3GZWfzwvQVwET+KoIuIL8nTBAaDKG4RIxjsIkWVBKgkoIQjgBSOPoNnEt0xESI=
X-Received: by 2002:a05:620a:1997:b0:8c6:a5ae:e9cc with SMTP id
 af79cd13be357-8c728acf291mr254438385a.14.1769665665773; 
 Wed, 28 Jan 2026 21:47:45 -0800 (PST)
Received: from mighty.stonybrook.edu (nat-130-245-192-1.resnet.stonybrook.edu.
 [130.245.192.1]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-894d36dd1cfsm30903216d6.25.2026.01.28.21.47.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 21:47:45 -0800 (PST)
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
Subject: [PATCH v5 2/8] dt-bindings: vendor-prefixes: Add Doestek
Date: Thu, 29 Jan 2026 00:47:03 -0500
Message-ID: <20260129054709.3878-3-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260129054709.3878-1-bavishimithil@gmail.com>
References: <20260129054709.3878-1-bavishimithil@gmail.com>
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
	FORGED_RECIPIENTS(0.00)[m:aaro.koskinen@iki.fi,m:airlied@gmail.com,m:andreas@kemnade.info,m:conor+dt@kernel.org,m:jernej.skrabec@gmail.com,m:jonas@kwiboo.se,m:khilman@baylibre.com,m:krzk+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:neil.armstrong@linaro.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:jesszhan0024@gmail.com,m:rfoss@kernel.org,m:robh@kernel.org,m:rogerq@kernel.org,m:simona@ffwll.ch,m:thierry.reding@gmail.com,m:tony@atomide.com,m:tzimmermann@suse.de,m:andrzej.hajda@intel.com,m:bavishimithil@gmail.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-omap@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,m:thierryreding@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[iki.fi,gmail.com,kemnade.info,kernel.org,kwiboo.se,baylibre.com,ideasonboard.com,linux.intel.com,linaro.org,bp.renesas.com,ffwll.ch,atomide.com,suse.de,intel.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_SENDER(0.00)[bavishimithil@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bavishimithil@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,doestek.co.kr:url]
X-Rspamd-Queue-Id: 24943AD053
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

