Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGxPBF0Glmm4YQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 19:35:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9C2158BDB
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 19:35:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03BC910E053;
	Wed, 18 Feb 2026 18:35:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fCOWJGGf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E765F10E053
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 18:35:03 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-48069a48629so1403555e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 10:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771439702; x=1772044502; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0uK3LnBVqJtacrpaTeNsmEDEPVfCDtIQ6jE7L3gZNMs=;
 b=fCOWJGGfwHF2OT/OATRZFkhy8Y6n31F8akf7VTmOQIM6FmdCtbRIh0wEPhO5i7RjS7
 r4EcJiKAvUOGIXxgu0XugbpjuIsj5DMnZqkasVAyZOma4RTeUT2UsSumSiK4bkO730px
 MKMCToZm5Cv8ixTNCBHOjyAbo1UkG2NOJ0jMc9/4u0YP2w59z2QUbVAMs27AstqXFEWg
 o2Uye6RPPkLxYoSHXlaLet5XFC7yVrzJTMFk7JpCwF6JgPdWPcL551XQbXfxL/FdHJSs
 GyBLlFqLn7W8Pz5GHi+JnUloaC71YPKO+y1OAUKlzOrf6j05DrVEQxmtH4pzH06q82FU
 iXcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771439702; x=1772044502;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0uK3LnBVqJtacrpaTeNsmEDEPVfCDtIQ6jE7L3gZNMs=;
 b=AQp1qPG2kcaA8A11zjFrC9hRFHdqxSGd6D+OtA+UVWy5BHCXCI7d84nxoz2DpgpTwv
 Emil3t64GDpIBgub6mB5aZuLvMRE3VpNXJIm0m08U4SrP4Ws8dkbYZimCg2JG2oNhcUw
 59hf4axeXKJLxquCs2tVIDX2ldXf8eCsrA643hBQvzycTNaTojaArY4OZ8nYV7FbAFdT
 31Ss5cwawqQYfFtXQXJTiDR/yDFt2CGoUQVHTAVGm4H5auwn75U/rw+WwakxI9kf+xzh
 UE3hItkhbdhU2+GA+JPIS8z3ODGnN1a5TDuezsPHdRu0YxhRX7M/5F46KggKOov2MJsI
 x7Ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBpByyUzQxxRtoPGqkwC0Iq9vXx8/7CNu+8WGpywE713UUPk/h0BZQZTbiaZYuU2+DX8HKIlrnRYY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxxBuufIG7Ec1c+m/ThinbLutAc2Cjjg1zzNfTrkKHIK13zIOB4
 miH8n3pZRJbwGSnaX+ttt30TX+ItgEi6F22ZlZojk9KAumhSPpoSLYM+
X-Gm-Gg: AZuq6aIGTLrgunoOE6WC3jRAAxvp0OVH1inXCUi3sQVS0FqmJzXP1TopnaJs6yI908e
 q4ExuQQwzPoOtET83aDFfA5LgkWRSn0jRTM3Li1wFRvZ5lES1QPqecZw6KyNoiW6FjXh7WgnDRa
 jvjRANieV/YeA+vz8XghuXyauZ+PzuBcMZcmvmErB+/JLb+gzI+5ytjBw1KslY7NV+Gz07L1Iis
 JGF9Ft00/846/igvuvCCbcvGVm5yKreTUSmk44F4CyHPnWZ6dm+4liQI395qtQSanuErOcFddBP
 L54oH+8FWDTDn/5dRA+GTKGoPaLHryMmoi4/5nY/Z+ZbTKtARD6kZaO6MOiYu+rw+JcRZaXekRO
 TPqZFrrjatpqY9udrqQ6qQP1597nHyVnoIMXPYntClIbxScUwAgP4+6xIpQT4GVvBr+v0NgIvFL
 MVhppOpIQotSt4OlMVHXDqTe9I46jiY8tu57b/21AKDBfcSbYdlT8i6+TkQbZkdD72vqFmYT2MW
 xhubVICEyht7+4W
X-Received: by 2002:a05:600c:458a:b0:483:6f37:1b33 with SMTP id
 5b1f17b1804b1-48373a58babmr277783835e9.30.1771439702159; 
 Wed, 18 Feb 2026 10:35:02 -0800 (PST)
Received: from jernej-laptop (86-58-126-118.dynamic.telemach.net.
 [86.58.126.118]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d482480sm640635785e9.0.2026.02.18.10.35.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Feb 2026 10:35:01 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@kernel.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] drm/sun4i: mixer: Fix layer init code
Date: Wed, 18 Feb 2026 19:34:54 +0100
Message-ID: <20260218183454.7881-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.53.0
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:wens@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:samuel@sholland.org,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:jernej.skrabec@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[jernejskrabec@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jernejskrabec@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,sholland.org,lists.freedesktop.org,lists.infradead.org,lists.linux.dev,vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 4C9C2158BDB
X-Rspamd-Action: no action

Code refactoring dropped extra NULL sentinel entry at the end of the drm
planes array.

Add it back.

Reported-by: Chen-Yu Tsai <wens@kernel.org>
Closes: https://lore.kernel.org/linux-sunxi/CAGb2v65wY2pF6sR+0JgnpLa4ysvjght5hAKDa1RUyo=zEKXreg@mail.gmail.com/
Fixes: 5fd711adc0ba ("drm/sun4i: layer: move num of planes calc out of layer code")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index ce9c155bfad7..02acc7cbdb97 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -321,7 +321,7 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 	unsigned int phy_index;
 	int i;
 
-	planes = devm_kcalloc(drm->dev, plane_cnt, sizeof(*planes), GFP_KERNEL);
+	planes = devm_kcalloc(drm->dev, plane_cnt + 1, sizeof(*planes), GFP_KERNEL);
 	if (!planes)
 		return ERR_PTR(-ENOMEM);
 
-- 
2.53.0

