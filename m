Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJhaNgtbnGmzEgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 14:50:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7618B1774F9
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 14:50:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CE1F10E3BC;
	Mon, 23 Feb 2026 13:50:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AnmvpttS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48D6510E3BC
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 13:49:56 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id
 af79cd13be357-8cb3bae8d3eso425228985a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 05:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771854595; x=1772459395; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oNC2r/k4VYyNvAPrupzATpkdJnOwaq0ecIMgKhToJ2I=;
 b=AnmvpttSkTdrLOYHSnVRg0HSnkrqRKgnGCNXRI3GcUQkQCaFgML1JyuWYptufRe7Se
 //e736l18c1FMEUICBL4NJ7E2QHx/9+SCXwvsaMCq8qqA9w7kZ9FyHAYEEVYpj8SB3C/
 PE4udtDYXU1mQvMVzLHDWxtthYoOMb9V2xqHs9hd+hSaD2mI9C6z2KwtTz714Giv/FGf
 LJ5YN/XclNnAkm9VEswd2RaKJFKNSevejv44v27aaKMx7JKfLmNrvNyGD2OlluHFaqe9
 RRfBZvAGGh5GqCC5EBZC6hSdoRtyehkuwMU1jkJnBFsaove8omg+TI03RymfQPTF28xi
 ilTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771854595; x=1772459395;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=oNC2r/k4VYyNvAPrupzATpkdJnOwaq0ecIMgKhToJ2I=;
 b=bE+X5REwqZpe0w1R1y8cwsEZJQ4CyeDsIiE3HlkShaBz/CU0ak6GEtNxeL4rnPHZVI
 hP0v/JQJk4KULucDPFsCM0WXg/tPUm3xBq6BOdiZjTGTAKaEU+Grv3hAYxVQJhxA2yDV
 XPq2nbOtml8Z57E5oTUeKjBrBDQPWNMSFQkb+s2v/iCZmxHfgVhPtiIOSjhiuJ+dj8W4
 koYZx62ariwyAt2seyaBKYkGhEagxQKRwkW4o87xGBEteoSWazuLCFEotVpDZDUqLcmJ
 ux9G8Ymsq0mHRY42jbZ4dGsA/ueZDgx2LrrSXRnDg/au5ObxQWFjrn/aFi1gqlOCWtUJ
 8g5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRfThhKIar4q60ip8OBt1iMo5GqMvA12+tPzxs6/92dgH4Za/QBvwZuusJ9a9qkpGzU4fzfr6c7fI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/weuxENbl72QIDYn2PzL+gJuwCllnorb3qBUTDk0RIab5JnZ1
 ANLCgvJM+mYNNbpSaULJt9tg0Zf92gJcKrR2LCSW1qtO4gHFeYMhUFVs
X-Gm-Gg: AZuq6aIgSfD53KWREZBw8f0S8cJVeNtDxmf0cQ2ckMMJBPBl9rsRTLBkFvNcnmRmT1P
 dwMTp6JO/h9taHX2tsPoMgX5NQY74P3FazRAX6KcxcizwIQrI0htu8t7M0rwfJIUbni5pFC3T60
 ICys6ZILh+JFioQTJogYGKEDtrAqkfqdv+sRN/RkSj0K1mbsO/p6urzvcv4oovwimUf88za0+bO
 Zm0NJYoPywdaT0r+TqmroUcOtoG7T4I6GItZIncuLJ9f7ErDlMhWS9B7RxGeUpiefp37Ge+mhMS
 OCr7afemqmVxhTPvRDIorqJKR+M1RPjgSKXbI1yRsl72aKrFrC0O6ZqBeWUM40s39qu55mDdz/E
 ivHQck/u8eCk6OPYk6gvkw219gZdDKtBMEBtOzcX/k3/D7y4GS+3KNZ2GIHmD8hQJwFVOLgfy+y
 kDbVqi5ZPyqQp7joex39zpyU8rthkJU1Wcgo0XJlt9QgdKMEo0YmZhBJaCiyQWNayUYFtArdtTy
 f32LHaJufCB3icpOWDHZg==
X-Received: by 2002:a05:620a:44ca:b0:8b2:dabe:de32 with SMTP id
 af79cd13be357-8cb8ca63e8emr1114618485a.42.1771854595143; 
 Mon, 23 Feb 2026 05:49:55 -0800 (PST)
Received: from mighty.stonybrook.edu (nat-130-245-192-1.resnet.stonybrook.edu.
 [130.245.192.1]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8997e62f453sm67954716d6.36.2026.02.23.05.49.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 05:49:54 -0800 (PST)
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
Subject: [PATCH v8 6/8] dt-bindings: omap: Add Samsung Galaxy Tab 2 7.0 and
 10.1
Date: Mon, 23 Feb 2026 08:49:38 -0500
Message-ID: <20260223134941.427-7-bavishimithil@gmail.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 7618B1774F9
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

