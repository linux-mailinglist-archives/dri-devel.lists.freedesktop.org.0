Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPrfOZsLr2lzMQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 19:04:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E22723E28D
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 19:04:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 981A210E583;
	Mon,  9 Mar 2026 18:04:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VhHLTNL5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B43310E583
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 18:04:07 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-439b97a8a8cso7980201f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Mar 2026 11:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773079445; x=1773684245; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dV3Rs94eq/8lEKJBAht9P9yGrd7viF7G8GZxAdck6ME=;
 b=VhHLTNL5iQIY5saz0XH9ynFaBQbibg6Reu0BSf0k2lGTAGCWO0e/K+cmDjmawpg6yC
 bR5Ap/+X4ojl3nvq29AGTBSIWBIimAWF9tS4QUTx4N0nVSeYIUJfyLN+/HejH9WR0bDv
 2/THw8OfaDrLkah0tBl1M5N0aN0i+ACQhkOTn3PmgC2OAs8eQ90T2K4qUC1kRVwVaXCR
 gzi7m0kEsFSOtfBAw1qw1kWALdZkuH7mCSKop2g3/A77felBGA9J7TZWfCbGmPz2F2od
 8Shxwa8uZ4x6CbjTxVT0KkIte9/4SLxX0SL/3zAZgaaq921mtJh6iT3tox4fQAQaHKvu
 pPhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773079445; x=1773684245;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dV3Rs94eq/8lEKJBAht9P9yGrd7viF7G8GZxAdck6ME=;
 b=Qz3OVwmDb2mdzDVnQYKSyaKepSadJqx7R7V1QoMafefHVbaw5at8NEGlnPF5FxdTQA
 vSd2tlnzLWfpcJ+fkbvw8DDv/8RqEU3HqF0bXe3M6jwR65skfsPBydAuhZ8DjM+x/z3A
 cvypIjZHOrFm3h4x37xmebCANysMcXsCLBUGgpARc9kcjG8INVL/RG5zx2cFvmp6wvnU
 dgskPUNID2ZjCS3ScN+1mXEfViYwQOQBG21YvELtdH360PhmRW7OqYp6jtDLj9zJqXJa
 Sf9JhgwbtDX7ukFccnOLjUEigzYcZQFD9Skfyx6eLyorDsmy50Hp6n8tsH9jaOVIqhvr
 3ezg==
X-Gm-Message-State: AOJu0YymBrzTLTr6L+JtWzu22/M4UweNKozvmpYeSympRLEHAgyDWJXp
 ruCIGmbN1ajB8gDsEp91ymbDQvCcMUygeBeXzr/RfJuUbmelcNZQgf01fsbi99Ya
X-Gm-Gg: ATEYQzwTYITML5kDJLvIMqobW8IiCQNxlrnjpvT7UK/j8DGIIEzfKB4UaIw7azxPQbq
 CYbn7kyaowJB5OaF54j+mDSjiCrPKSrZSCpTAJ/2C7sIacojFmkRL2qLFX48Il4kxEg9jaze/VN
 adxTKojUxorcfYSjc0npsqorQEgzP5xuoyo03tSKmbbqNBj6ZJ3bygUmwQFGbmUejxx7/bfBb8i
 UFFTxjebJjqSYH2n3IAhcNPsyshugz0cbNWepKhNw4Q64vmYeqpeVNn4l/4kCL72T5U5rApZuIJ
 5LvrHLNQomDRCqzsjGAiL9LDUsB1OohR1lqlK5UY5xt0eoFtVxmXsJ30cQfOankz0vJCfk4jY8z
 qCI59Hd4UdrgrEOCfTAHxNtBtLPXwCVTKKMJCBH2XJ/Sd54aI5/sqkRNnBGcHc1cwqgzq2D5x20
 eWtFAdM7I71l5o5GpFOpI=
X-Received: by 2002:a05:6000:290c:b0:439:b3d2:376b with SMTP id
 ffacd0b85a97d-439da66207amr21666689f8f.14.1773079445110; 
 Mon, 09 Mar 2026 11:04:05 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dad8dbb3sm25233528f8f.4.2026.03.09.11.04.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2026 11:04:04 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Jagan Teki <jagan@edgeble.ai>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3] dt-bindings: display: panel: Document the rotation property
Date: Mon,  9 Mar 2026 18:03:36 +0000
Message-ID: <20260309180353.8220-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
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
X-Rspamd-Queue-Id: 4E22723E28D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[gmail.com,oss.qualcomm.com,edgeble.ai,linaro.org,linux.intel.com,kernel.org,suse.de,ffwll.ch,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[lscorcia@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

The Jadard jd9365da-h3 driver already allows DRM to get the panel
orientation via the device tree rotation property (described in
panel-common.yaml), but it's currently not documented.
Describe it in the driver documentation to fix a dtbs_check error in
Xiaomi Mi Smart Clock x04g, where the panel is landscape-oriented.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
v3: Fixed commit message wrapping
v2: Review feedback: improved commit message to explain how the rotation
    property is used by the driver and why it's needed in the driver
    documentation.

 .../devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml  | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml b/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
index b8783eba3ddc..25024f4a63e1 100644
--- a/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
+++ b/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
@@ -33,9 +33,8 @@ properties:
     description: supply regulator for VCCIO, usually 1.8V
 
   reset-gpios: true
-
   backlight: true
-
+  rotation: true
   port: true
 
 required:
-- 
2.43.0

