Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Kj7DyjgqWm4GgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 20:57:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8174217DAD
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 20:57:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C16F010E23E;
	Thu,  5 Mar 2026 19:57:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="B7MIKuyX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC47110E23E
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 19:57:22 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-439c4bde55cso1884443f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 11:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772740640; x=1773345440; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=idzPl1oHysl6/8oMk349FHdQyMf3W5G+eL7EEdW/pbc=;
 b=B7MIKuyXSnrutUGSAsVx6vnZ7f08/tvAcPOk5ETOWtb57PFQfkrsrqHzmvKGb6zrtA
 OqnGdbe81hJohT0aJMSs2k/GHxmrElXNwbnwQadyiy8rJnywqeRj4blx8qX+Gqq68c1E
 UGE3ta9TMRGIek1guad9wtQfLySlRfi04TrZv4DdKPbwOLJ3RAvR0/zBUmZGcGVezFCu
 8R6Vh4D97nkz8bUoMiSs/s+wMwYDriommBAdIg3CQiu9ZQx4KePKkCGenwu31xouSyV3
 RjsSr/PnrR0e+Wa0SAhBOx9DyoSAUUafkO6y1IpgfEiAU4/P91eg75O0DSXjzsXLwRMW
 noSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772740640; x=1773345440;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=idzPl1oHysl6/8oMk349FHdQyMf3W5G+eL7EEdW/pbc=;
 b=mDKaHHg9VeaaQDB1ujYiYqohtXZR5DH48oTjyzYMXnk1aywV423YiacAKGDOniu78b
 05jNiAW/wWWWFwfu6ozFQK6elexrRiOwCHiAT7hvtC+pdbk1RJE5xMjLhmjHm5Js+blm
 9MgDBqqJkOwoqfzEMnwv9yjKPDWmomZ8L+BWW9MBV+4k5PlkLnu+IJNONB5qoJ9Yt3dk
 vxLVQM4YD7JRLoPJvcDCTbx2/M4siuOFrTywwh+bZ+0KqgWaAWo3L15EIv4v4SSCIrTx
 ogZam9KSQ3yf4aLkqq6dCj9FQloy0Efdox+d1l7+gFrcVAWeSFlBix+Wug21rPm5RUK/
 oRnA==
X-Gm-Message-State: AOJu0YzzHeNxSh4zGoWxAeYHgEy487ICJIpzRtRVNX3YrCTa3BI+kdGv
 HSaZCpRYR3vCG/4nLrEFHPkwvN/70hXTxQ+PTJZl2PX82RuwzlmekxVsc2AJ9RZ3
X-Gm-Gg: ATEYQzzhQMqQ1jXbMWoTTU3cOEvMeDBS6RNH2ij26ZYO7wX/6d1GC2GagrK3OXg/xYm
 R6pNYOTxnGJc/8pA7hFu9+jsbIr3iKtvirc4r5wdDDsAcoR/Nuzd6fPfEzj5PoDplROaIaS6gSm
 77TnUDvLIqdqJ9/0PaTJ5qG57zjSdN0RT/mESDYwmUmy4GKwd1dBeQ3YIPyzAEoTiKfkjl7gsff
 BqcGr1zzw7gzi3nqusTHWTJEhxHB86tZSj/tnq+yOYP57nafu8+gYmgNNhgGST5EhJWkk4u0xRu
 EiPbDmdcqwqEKhZR7+DND2ruBnJcx/2Q4DKXywD8V05ImwkFM7W8w5gqHuNmJRt5PE8zsN11+V1
 eBOk+TdKIhMj1sDSLoBGLmk5rSXhByLUQFcL0M/zaHSfwjdvtawpaLbuSUS+HdF9GD4oazzxjwA
 XcFeANAF0dcv2RKB8O58GQTKP/bchqlA==
X-Received: by 2002:a05:600c:1d0c:b0:482:df17:bbbc with SMTP id
 5b1f17b1804b1-48519874e2amr112904215e9.20.1772740640050; 
 Thu, 05 Mar 2026 11:57:20 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439bb686a32sm26974297f8f.13.2026.03.05.11.57.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 11:57:18 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>, Jagan Teki <jagan@edgeble.ai>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Marek Vasut <marex@nabladev.com>, "Kael D'Alcamo" <dev@kael-k.io>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Add support for Zhunyi Z40046 LCD panel
Date: Thu,  5 Mar 2026 19:56:29 +0000
Message-ID: <20260305195650.119196-1-l.scorcia@gmail.com>
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
X-Rspamd-Queue-Id: C8174217DAD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[gmail.com,edgeble.ai,linaro.org,ffwll.ch,linux.intel.com,kernel.org,suse.de,sntech.de,nabladev.com,kael-k.io,bp.renesas.com,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[lscorcia@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Action: no action

The Zhunyi Z40046 is a 480x800 24-bit WVGA DSI panel based on the
Fitipower JD9161Z DSI controller found in the Xiaomi Mi Smart Clock
x04g, apparently in two different variants.

The Fitipower JD9161Z LCD driver IC is very similar to the Jadard
JD9365DA-H3, it just uses different initialization sequences. A
partial data sheet is available at [1].

The two initialization sequences for the panel have been extracted from
Android original firmware for the Xiaomi Smart Clock.

Variant v1 tested on device. Variant v2 not tested.

[1] https://github.com/QuecPython/QuecPython_lib_bundles/blob/master/libraries/LCD/JD91651z/JD9161Z_DS_Preliminary_V0.01_20180803(1).pdf

Luca Leonardo Scorcia (2):
  dt-bindings: display: panel: Add compatibles for Zhunyi Z40046
  drm/panel: jd9365da: Support for Zhunyi Z40046 panels

 .../display/panel/jadard,jd9365da-h3.yaml     |   2 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 .../gpu/drm/panel/panel-jadard-jd9365da-h3.c  | 308 ++++++++++++++++++
 3 files changed, 312 insertions(+)

-- 
2.43.0

