Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKYEHfJEp2kNgAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 21:30:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2771F6CD4
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 21:30:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2796810E8BD;
	Tue,  3 Mar 2026 20:30:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GJqtxg3d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23FE510E8BB
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 20:30:38 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id
 af79cd13be357-8cbc593a67aso554355085a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 12:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772569837; x=1773174637; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oNC2r/k4VYyNvAPrupzATpkdJnOwaq0ecIMgKhToJ2I=;
 b=GJqtxg3dKEor5iVlkebGK7imSeR/WmDcqxvUZShWlmNtt1yS5TFPBW5jkwTZ+QODH/
 wOyjvr3gPe8X0SCKz093Isy+d7ypZIyMXLtEcb3Tw5gmVhXXoewGVeIUAGM7XUSz4Zy/
 1VkSf9UVqGmJqOUS30uYkY69vVPvQsQ9WSrv6Twcye8x7cumtg1BM1reqLuRgD2fkXR8
 UfoJkBUCPmwNBCXeETFVx/sMmufbDShfE5vJ5CA+xOW+VL4mV1QZzCtR75EQofGb8BXl
 palVYcpzLbjRfzuvdUnD4sCBACe8/qiIDYb0mMsFK4uBIv0WK4Fg4ACXRuILMKaXlDAc
 EriQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772569837; x=1773174637;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=oNC2r/k4VYyNvAPrupzATpkdJnOwaq0ecIMgKhToJ2I=;
 b=d4VAC8gNQi2YJWdnoz+BnV4MgxmhrAB0ubO6yWU0FtpNEFndXePUB+e7GLnjJEulW0
 28p74rVRjaOgpCt5omo9dQM228pUmWluTeStunIErSVOyUAVSDFqBPMWY5l4rGCoQiJh
 Jtkc3A4Ce8P+dtDCMX9J/y3D+kMRuyHdeoR/U3M5D7c0bI8d2oghY8WqB2W+3qpmfTkb
 TY3Osdc7sA8Hu0Oxjh+GaGDssN9jb9UznsOrO6DmsDfDeDHXy2JgKIQdABj5bozH3Zjg
 410DAFxAR6GKstdQxyS8TZAQFHV1cMMDtubMl1WUsQVapw/1ICWyEgWjAR7au5ssODre
 6DHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXT7AVlcjB3F8sHdnNTPPBiGtzHCkizYmnFcoLbJsA+X/PaTK6nVsviWyrgxX/7R/VTUcLy/GW1kdI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7AWvOGBLpzQMDp6YkZHwl5kRjEOsaHya5TTh95n0gyAjfB4YT
 DJV7LtGHrobWkl36TqW7mMFELeecaso41Q69n1o4nf1MstBsXmGTu9tu
X-Gm-Gg: ATEYQzx3DFhhEnvGnF/YZRgmNtdnE01av3Bfzu0pQhvG5Vk4EAB7nWiyWozvUNc2Pof
 XbAQ0zBdU7LbYzCHQr4s2r+AlibEPHJOwMi0pYDAGpztqAUnq/ux0RPTRAE0x+eScAgKWYKAPfE
 dvK8D6GJ9Oh7+/w3/9EUNzgUmpVDMRrNzfOrkPfldBYF6U8pJ21EhWtZWCFjJCnPEq+quW7Wvce
 EOkDDNto7730rJkLYsSP5xhN4Gfo+0AcbVWyjRufnJrsIrFKLv3XK5qooKxkZQGtldEpkkwkXy+
 nGnZjIO9MC4skGUiutQqeDQTzFtPSITJIxQHYDnelkIJydjaoyHMQi53H9AnViok0R7wLP7YVHs
 kwaytWl/FyXXp6eXPIJFuOmhXdV40mO6QUd+5yvlUDVjXdulQ5ggbtQvGESLj3A545t+Lo8hrvL
 EifWVmz5fQDPhqk/D9PeCLwv2yFb2JX/c74aX7/7ZKV7WZ8XrBrRN4rwaxVY+EPBg0Q7vwBFhXb
 s2PK10g34o=
X-Received: by 2002:a05:620a:1903:b0:8bb:a037:fd94 with SMTP id
 af79cd13be357-8cbc8df6fc0mr2124060285a.38.1772569837021; 
 Tue, 03 Mar 2026 12:30:37 -0800 (PST)
Received: from mighty.stonybrook.edu (nat-130-245-192-1.resnet.stonybrook.edu.
 [130.245.192.1]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8cbbf564c27sm1465032085a.0.2026.03.03.12.30.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 12:30:36 -0800 (PST)
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
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v9 6/8] dt-bindings: omap: Add Samsung Galaxy Tab 2 7.0 and
 10.1
Date: Tue,  3 Mar 2026 15:30:15 -0500
Message-ID: <20260303203017.511-7-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303203017.511-1-bavishimithil@gmail.com>
References: <20260303203017.511-1-bavishimithil@gmail.com>
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
X-Rspamd-Queue-Id: EB2771F6CD4
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
	FORGED_RECIPIENTS(0.00)[m:aaro.koskinen@iki.fi,m:airlied@gmail.com,m:andreas@kemnade.info,m:conor+dt@kernel.org,m:jernej.skrabec@gmail.com,m:jonas@kwiboo.se,m:khilman@baylibre.com,m:krzk+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:neil.armstrong@linaro.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:jesszhan0024@gmail.com,m:rfoss@kernel.org,m:robh@kernel.org,m:rogerq@kernel.org,m:simona@ffwll.ch,m:thierry.reding@gmail.com,m:tony@atomide.com,m:tzimmermann@suse.de,m:andrzej.hajda@intel.com,m:bavishimithil@gmail.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-omap@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:conor@kernel.org,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[iki.fi,gmail.com,kemnade.info,kernel.org,kwiboo.se,baylibre.com,ideasonboard.com,linux.intel.com,linaro.org,bp.renesas.com,ffwll.ch,atomide.com,suse.de,intel.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[bavishimithil@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	ARC_NA(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,qualcomm.com:email]
X-Rspamd-Action: no action

Add samsung-espresso7 codename for the 7 inch variant
Add samsung-espresso10 codename for the 10 inch variant

Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/ti/omap.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml b/Documentation/devicetree/bindings/arm/ti/omap.yaml
index 14f1b9d8f..f694dcbf2 100644
--- a/Documentation/devicetree/bindings/arm/ti/omap.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/omap.yaml
@@ -144,6 +144,8 @@ properties:
               - motorola,droid-bionic   # Motorola Droid Bionic XT875
               - motorola,xyboard-mz609
               - motorola,xyboard-mz617
+              - samsung,espresso7
+              - samsung,espresso10
               - ti,omap4-panda
               - ti,omap4-sdp
           - const: ti,omap4430
-- 
2.43.0

