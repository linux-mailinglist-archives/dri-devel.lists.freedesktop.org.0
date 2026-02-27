Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EF8iNdIkoWlOqgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 06:00:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED941B2C55
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 06:00:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4529A10E0F3;
	Fri, 27 Feb 2026 04:59:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BDoZWs/8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26E6B10E0F3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 04:59:58 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-824ac5d28f9so1676495b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 20:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772168397; x=1772773197; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9M9yKCPLn+iVOORDFLmMfOISzVgCjsTOG3aAkzJLHbw=;
 b=BDoZWs/8iGifswYOU9AdeiZfpPCZ7B0zmEgBCOjAJA2Dqa6S01j84slFwW6H/k/swg
 hD230WsRBA+n7st5yvcabrCK/EnuOB9fXIC3CdVSczaNx9jkuWQ0vXQhbc/W9cw7DEu0
 1mt0CEkgDSvTa0HIIE5zlY8o7gvmAzr+cf/FjwxKrGNeLg9bPmxH+2jVSiKo++3uZgtC
 7KKgCZMmHmUoD8isqFd8GLpHNNPI66q8MaVNh4Oz+mi+vBiJh+mEiuTrNzNEYfu8WfEM
 lsm557zPB5xifdR8vv3bNS5JDLqik/7mD16I5U7ywjcQNp5IZV2upYmLh2RXCdKRJjRd
 UmpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772168397; x=1772773197;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9M9yKCPLn+iVOORDFLmMfOISzVgCjsTOG3aAkzJLHbw=;
 b=JoSytdSN02TMSnLwMwUFeJh9PtYvIGq/pwcgjWUGIZKA5OJCgay8ko22SlAQ5X9xoV
 b8jyTy6JSbhQlHuCkz8X1nZ8IuwXaJF7e8LyU6E+4L77NkWjGsG+5b/HSZA5KXovwFw4
 gilnZgDMW6rOKBZWS1okh3c0n6V9hXlzTpHYSk5o5MOhnS4eBzHHrwBd+ndPG5ONJWup
 rEzb4FtBpP1KlLHiqS4KDOOV9K+LJRD43FWv16Isgdix6Mhv0lIFu+FyE5+XHoLH+q/g
 mL9HVsbEnbu/mx7WihGhw4lZxxKtRzgENmindtEbMEs8KIJYXN4JxiKuUz7KVAXPFjDH
 n5jA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrmFeC7E6loMNtLGiSmzOmT72gPVva7b+Ej/hUo5Ch9Q33fOhlpXltuhXY7pk9NgJTZL8F2jfrf3U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwBpMnDFUj8vJoTWWKxOn96KfewX3PdkN/dNI3mNweQ07ST58us
 Um54NQl/K0ymajQGIzSdw8x9nKKKdQ2qnGq6dfNWZsl7esfzdHA8HVtM
X-Gm-Gg: ATEYQzx6fQ6IWw1CDqVC5TqYGotRWrQ9JurjFhqPKN79LaNN2wbePUydGxNfLCh3yvu
 8wPhT65Ir7nXcwYv/WQlC0YE6fGGUlRKbOgWBK0WShQvMFmo1kqJuVzSe9ZY5AYz6gVnrZpFpnr
 zg66VcrcwsdcDolzF/mevtRly486DluhzMjv7MroQVYgYZ+VSa+rdZONCWgquULXNaIf4PK/9c4
 ctothEze2uLbKml6haDfnnm8K6gIUlGat+mh27sZEDfbUyOKlbXa3ho8T6cMcPft/e7N4pty7dO
 FYXHy/NsfM/eoRrZSQcQi5oadGmt7DZtgSMMRx6UtiPOoUakI5/29yP8W9ZVIH1Qr5e03CjUToJ
 wy1xzytGT0PYybZhnq+iQtHTphG9RMlm9iimju1ptq5akxjp5ptQrWYa6NYxtZ2gA2IHgFo2Ti4
 ZlyBGEZpk/PlZUolWIulWg8ycrjcKKhik2LZktdFNx/Ee53gzg0Q==
X-Received: by 2002:a05:6a00:4390:b0:81f:4566:cce6 with SMTP id
 d2e1a72fcca58-8274d969893mr1442557b3a.28.1772168397546; 
 Thu, 26 Feb 2026 20:59:57 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([175.201.112.127])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82739d94de6sm3966543b3a.24.2026.02.26.20.59.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 20:59:57 -0800 (PST)
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
Subject: [PATCH 6.6.y 0/3] drm/exynos: vidi: fix various memory corruption bugs
Date: Fri, 27 Feb 2026 13:59:50 +0900
Message-Id: <20260227045953.165751-1-aha310510@gmail.com>
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
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[aha310510@gmail.com,dri-devel-bounces@lists.freedesktop.org];
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
X-Rspamd-Queue-Id: 4ED941B2C55
X-Rspamd-Action: no action

This backport patch is for 6.6.y only and fixes a bug in the
Exynos VIDI driver.

https://lore.kernel.org/all/20260119082553.195181-1-aha310510@gmail.com/

Jeongjun Park (3):
  drm/exynos: vidi: use priv->vidi_dev for ctx lookup in vidi_connection_ioctl()
  drm/exynos: vidi: fix to avoid directly dereferencing user pointer
  drm/exynos: vidi: use ctx->lock to protect struct vidi_context member variables related to memory alloc/free

 drivers/gpu/drm/exynos/exynos_drm_drv.h  |  1 +
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 72 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-------------
 2 files changed, 60 insertions(+), 13 deletions(-)
