Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uMpGMYr0emnDAAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 06:47:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DD3AC0B0
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 06:47:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C088E10E263;
	Thu, 29 Jan 2026 05:47:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BiIpNbBA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DDBA10E263
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 05:47:50 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id
 6a1803df08f44-88888d80590so10542386d6.3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 21:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769665669; x=1770270469; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0Hq1Jil93LKWD5SqiddgyBykMfT43TbOI7JPjGrETyE=;
 b=BiIpNbBA4rGjFWCKXgHmr283yQIwkxy6Ei4tMtYdqX3AFpv+E+g1WaGdTWzTopPLzh
 nU4ptmOyptHfN1S1z60HKM+Ge2BZD+oL2UtjdGn3npXaT/jpo179NNftoNs0ce1e7eOP
 ebfSyoMBSL7lc6asSNeYhutUzXrDo8WeZbSkSshrZmtGk+r0qH+eqnKniMK3aIWUPLWw
 xbDlB3rYaTRkeRHfcj7XV1o8suSFE8b3Mcev4Ug85eWbXJG89ORcEpGrfbsAcT6XOz15
 E0vLgfvVljByXLaMzb7IJ/2L5/QknLWdGmHWop1XM9gS1y3SAMyHqVugiA+d/qOZS35M
 SYuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769665669; x=1770270469;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0Hq1Jil93LKWD5SqiddgyBykMfT43TbOI7JPjGrETyE=;
 b=bl6OO+5BEZJgUuz5B1mcRd0XFXsNWPWDS4qLx4foGeDBA0+aqIu0ZfHZlMmwz6t1AO
 uf6P7/1huTKvbTl3IOpnE5ItrKru5iIs/X3WWX1X9j/oZOHiGhCeCebgdlq5bxxx9Yuk
 omRgyKxi3JzBGpfI4532eueMmNhrNU+dyUDkd+GN21iH/CTYduC485CZbgZ/9zcZGexO
 mfk1OicOUuqGGaDqCBa8XTET0EkI8joAlwkbZYvXm67+qKbAag+FuCqupOFTF/3P//dv
 8BP78rLHf2ImkxWEoWZF2hqI5xhWcUVp5GXouSaw7YQCiGOOES1e7UEWwz76XSq912ns
 z7Ww==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeIn82F3YqBFg4msOSX8tYwc3H32lZHywPxsZfpCGxfWY+CM0OiLGvsJ4XzLryJ7mzOoQtZkhNm1E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7KBx2IMI0LT6uJd7PWejzin4C+2jhMBvNoH/QaeVjvv3qk4Wl
 ZbsrZU/nl+VUYRiK212vTXgKis4jwyh5rwBRmnhmxLQbOis0Qoswg4/h
X-Gm-Gg: AZuq6aI9XdwCX75xu6Mz8KTaOotJRi5MQ+wIm3B0L2nBc9g46iAlMQdAnnMhRNuvfHy
 3ey91z09QnXO653SWX2a4zbwS4jcmKLs34U+LzI0ugYVeeqnyk/Mm5DTSAWITDBiMyysNxelARv
 S/oOrfPbYikskn3nAkWCh/IJDIn092+dYoQnBLkxiLK8gVGtzbsRp54Bzv7vkTiQ50T5kHB+RV/
 7p/RrRBRb4CjFLmDuzREs7bfWUQpLfYG0/EMyk5nlelYoxirZOFqXSWRRzspuz38fUnbhjVU41e
 x15MwF+u+R2hOChfxQWBc9yco2fM2WVmldDjiRy5CEr/P/rtly3+Dj3h3p2U9rZhvZM3+FJMVdb
 dq85fR1HZ+3/W6Vckh1xCZOWvozE+6ok2Bei5syIQtXsdsn6cPfqjGR1GzbEvFBUDy0obPLp3I+
 5olRpXnPxrFtf/tE5zef002PA/yhHzKXh7w4MhGNbyW8q2NBwW3cHnDKIc3Q+OWcmsBdKd/WNe6
 9IMt71TpQ==
X-Received: by 2002:a05:6214:410f:b0:894:7d78:9cf4 with SMTP id
 6a1803df08f44-894cc7d012cmr118216296d6.13.1769665669193; 
 Wed, 28 Jan 2026 21:47:49 -0800 (PST)
Received: from mighty.stonybrook.edu (nat-130-245-192-1.resnet.stonybrook.edu.
 [130.245.192.1]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-894d36dd1cfsm30903216d6.25.2026.01.28.21.47.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 21:47:48 -0800 (PST)
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 3/8] dt-bindings: display: bridge: lvds-codec: add doestek,
 dtc34lm85am
Date: Thu, 29 Jan 2026 00:47:04 -0500
Message-ID: <20260129054709.3878-4-bavishimithil@gmail.com>
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
X-Spamd-Result: default: False [3.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:aaro.koskinen@iki.fi,m:airlied@gmail.com,m:andreas@kemnade.info,m:conor+dt@kernel.org,m:jernej.skrabec@gmail.com,m:jonas@kwiboo.se,m:khilman@baylibre.com,m:krzk+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:neil.armstrong@linaro.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:jesszhan0024@gmail.com,m:rfoss@kernel.org,m:robh@kernel.org,m:rogerq@kernel.org,m:simona@ffwll.ch,m:thierry.reding@gmail.com,m:tony@atomide.com,m:tzimmermann@suse.de,m:andrzej.hajda@intel.com,m:bavishimithil@gmail.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-omap@vger.kernel.org,m:krzysztof.kozlowski@linaro.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
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
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 30DD3AC0B0
X-Rspamd-Action: no action

Add compatible strings for the Doestek DTC34LM85AM Flat Panel Display
Transmitter

Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
index 4f7d3e9cf..3ad01645c 100644
--- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
@@ -33,6 +33,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - doestek,dtc34lm85am # For the Doestek DTC34LM85AM Flat Panel Display (FPD) Transmitter
               - ti,ds90c185   # For the TI DS90C185 FPD-Link Serializer
               - ti,ds90c187   # For the TI DS90C187 FPD-Link Serializer
               - ti,sn75lvds83 # For the TI SN75LVDS83 FlatLink transmitter
-- 
2.43.0

