Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCv6LqUsoWk/qwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 06:33:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F811B2E1D
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 06:33:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5882B10E239;
	Fri, 27 Feb 2026 05:33:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HdMRzpdu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACDED10E239
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 05:33:21 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-826c49b7628so1114286b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 21:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772170401; x=1772775201; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uWxM/NY1WZY/R2hcKtz9Vxhb3ZZqeiMM9SHyVrFFUDk=;
 b=HdMRzpduRkeiIRS7ARi9SjDhAXI9iFBcZIbG+ylf6EQQThZD2l0puHZnPaz2ILbCev
 b6K+lzdeJxakfoGPPmsNNz+VeYwW6y0T1MGZRD7C5PAmph1JBW+P+/07U6fDrgm+zjWh
 pSar88/KV3b41S4YHpHEbmav9KNxAyv9mNf3vfqNslt3+LXTGVKUBt4C4I7pfKiWFiQz
 OrnjP9eg9YT4YOGencVtcdrp6HgSR9P/36A+wHrwzjdCPywLI//8pGbGOVjrYdod5mSt
 rtuCr82gSv9+Ulqd5RVgbrMhwjwCxvMzw1N4lslKcDXDfiW1Y6ble0lcDtRIeaN2FLRg
 eyrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772170401; x=1772775201;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uWxM/NY1WZY/R2hcKtz9Vxhb3ZZqeiMM9SHyVrFFUDk=;
 b=mPP5u9c82ELTVvJP/dndQhfJxnkyu+2eRwOru8DlnrdSsuyXSxHxjxHVAiIAdWKPcq
 RYS001XpewsYqhgl08iAcvSi9LyreGxIvcFFQs0nue3Kw28rpyIR/HzukjfhHgeBw+ys
 S7W1su2SVV+KEz09sbo45lQvog8VaSJGIWF+IJ90vT3Pa7/8igcmhNjrLOk8A/rCpHci
 dFH0aaMekhNBOSqvcLndgs450C/YHTZSIKolcUb0RdLNvPqJobu1H2j+7JUCBwbd+glm
 n2vpjxadtgmVZHPgxprxjumMT/TgEMsBNLyYGv0Ngx/M9DzJFoq/oD56wBzcVMFQjVwI
 nwWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVg4V+tqltrdSaZ54+kMmvveDdQ+PqRFHSpKYsuDxoB/VT+hc5rQVwBiKZEh+eBVvHZ3ADvfQ9v//Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyF/OktZgWQf2/U6VlNqypiBokJI46uxmHLoTeOlQXBRX82srhR
 j+l0/oSBjefK2AGenFgELCJFCqC45P/8OCXAYa9H0rSLXD+NQ4L1ghz4
X-Gm-Gg: ATEYQzzYwda24BYQe2cgqF41z1PonR8L9e6SzL/4v35joTgWy50XejIuDYMz/R2F0QU
 B48Iz51KtPZ2AK6PyAaDELZEBKii1sbBIIq7ytrP5kt1Nd2MWkzcrOWX7whIDOyvm/LZwl5txI6
 MDfrCxsR248YqvZVBa3SS33kMpm3fac5WZ4hqObx+x/gigksI0JTl5ajU1EKRCyyZ1WQiMBSa1J
 qOB1BXgX5caSllNsgtRlcekqQm1s3fZuP0bCUbLZb5UWFqRiWxZ3qvkod+4CKP9TWZbcDvOxdGi
 49hdkaxMPLlGantKQNeUWb+9vblAG9fGaL1G0xN8qcYnqeXuUMfd9tSTWXAMW8xWRgJ96O8oLol
 f1iwG0oxUvkFWuTxHpwNNOlJqM4qD3F3w+r030oW7X+7+VCzddM59DtjMAOiozPsA6vo2ulP4/W
 /3gd5KOFbcEQzj9JH0ziaikGpLzojjg/cCt7IiPRiLis70CEYiMg==
X-Received: by 2002:a05:6a00:4143:b0:81c:c98c:aeb7 with SMTP id
 d2e1a72fcca58-8274d972743mr1365727b3a.7.1772170401133; 
 Thu, 26 Feb 2026 21:33:21 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([175.201.112.127])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8273a048615sm3815828b3a.52.2026.02.26.21.33.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 21:33:20 -0800 (PST)
From: Jeongjun Park <aha310510@gmail.com>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH 6.1.y 5.15.y 5.10.y 0/3] drm/exynos: vidi: fix various memory
 corruption bugs
Date: Fri, 27 Feb 2026 14:33:14 +0900
Message-Id: <20260227053317.426000-1-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
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
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,samsung.com,gmail.com,ffwll.ch,kernel.org,lists.freedesktop.org,lists.infradead.org,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:stable@vger.kernel.org,m:gregkh@linuxfoundation.org,m:inki.dae@samsung.com,m:sw0312.kim@samsung.com,m:kyungmin.park@samsung.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:krzk@kernel.org,m:alim.akhtar@samsung.com,m:linux-arm-kernel@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:aha310510@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[aha310510@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aha310510@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 51F811B2E1D
X-Rspamd-Action: no action

This backport patch applies to the rest of the longterm kernel and fixes
a bug in the Exynos VIDI driver.

https://lore.kernel.org/all/20260119082553.195181-1-aha310510@gmail.com/

Jeongjun Park (3):
  drm/exynos: vidi: use priv->vidi_dev for ctx lookup in vidi_connection_ioctl()
  drm/exynos: vidi: fix to avoid directly dereferencing user pointer
  drm/exynos: vidi: use ctx->lock to protect struct vidi_context member variables related to memory alloc/free

 drivers/gpu/drm/exynos/exynos_drm_drv.h  |  1 +
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 72 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-------------
 2 files changed, 60 insertions(+), 13 deletions(-)
