Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF77586E3E4
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 16:03:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9452210EB23;
	Fri,  1 Mar 2024 15:03:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="itDHv6GG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8788A10EB23
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Mar 2024 15:03:14 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-412ce58c746so472665e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Mar 2024 07:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1709305392; x=1709910192;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=z1U/Yh0ZYoALW1PvQIgQzS6FWbyOjgsal3MOiembAaI=;
 b=itDHv6GGVxwYvYylv5HjRsNS4Ob2g1KGcHIqsZ703EjP69UzuOB0Z5Hcna4n457Uql
 TvrB7Dv20aqYf6COMAhWPJC3MhepAmDtJIbTtGKQgqsPdZTnpFFPHtW7GIAQ448N28bv
 k6VHDlJrKaScES0RrS5RN1joi20l3iqoACNEDMUMCMABTEC59YcG8nKkRgTUlFAljFf7
 UUhv7K/nKyMQ69ZSTPIWHy9EItN4k8IhqrETwgFp7iOwAMMEQtvTmlWem6OKUOo7UAKX
 RWn58wN/8780uVLJkK3Az5AXbxuSOfPX4dcJhWMxz+587oI3IV/1ohcSld424DvgHtzH
 Tv8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709305392; x=1709910192;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z1U/Yh0ZYoALW1PvQIgQzS6FWbyOjgsal3MOiembAaI=;
 b=P1ts3JZFR+u6hNMb3KpVYf3WLXOUu0E7ocCY+QGv6zSgAa1nhwZv/ZdaOgvxJ1zus1
 ys7J0fHmWSrcS25ZecywimhbPN3mi4TTgWlRoeWTgcmzCErnp4qbdQhkeQYB6wXKMnzU
 VBCMxaSLUOUTwh8JVa8ZyI34OgeFq1rO/8oIk/H85Ts1hBVzNueQCyuyKe30MW0wojyY
 MeYf82Zis5vl0kr9aTRCmTr177E+I0ZFEzAFTgsTweLtw8JQlAX6Xhfk1BQ2tJzCxL79
 bZyY/vEsQRtcNq8vSpx0nH5CANFS703WG8R1xLWwhMNLWkEwCdUOxkaBlgk2nfY6ucL4
 3W7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEIbaObYQxJUH+RSskJ6P4a0O+rgfxulH2PP0YLwOc1DaOI1MBJskQ64y1gUvndGtTQViNknq7vur8cOOnmsOot4NafLXmbdIl2W17bALd
X-Gm-Message-State: AOJu0Yy0B7Chz1iYcFNSopAQ7XB/35qv+aBP/kMpsDwo4NcTGfSJC1eO
 f0SpY/mzOVLuohFNQme27vIhpi8KPz5N1HJ+khBnW6OKuveJUSrfYuxmvDWTRi4=
X-Google-Smtp-Source: AGHT+IFJ6EDFfqF9vpV6mLyjcVAx2M+lhHhrjha/wKSECKiDLQOvk0u8xjYf4eXwll1Rc1/gfadqqQ==
X-Received: by 2002:a05:600c:19cf:b0:412:c219:6206 with SMTP id
 u15-20020a05600c19cf00b00412c2196206mr1572398wmq.39.1709305392202; 
 Fri, 01 Mar 2024 07:03:12 -0800 (PST)
Received: from [127.0.1.1] ([84.102.31.43]) by smtp.gmail.com with ESMTPSA id
 j20-20020a05600c1c1400b00412bca49a5bsm5666875wms.42.2024.03.01.07.03.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 07:03:11 -0800 (PST)
From: Julien Panis <jpanis@baylibre.com>
Subject: [PATCH v2 0/2] Add minimal XDP support to TI AM65 CPSW Ethernet driver
Date: Fri, 01 Mar 2024 16:02:51 +0100
Message-Id: <20240223-am65-cpsw-xdp-basic-v2-0-01c6caacabb6@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABvu4WUC/32OWw6CMBREt2L67dW2PFL9ch+GkL6Qa6A0rakQw
 t4tLMDPM5mTmZVEG9BGcj+tJNiEESeXgZ9PRPfSvSygyUw45SXlvAA51hVoH78wGw9KRtRQGiW
 4qKhQpSDZzKkFFaTT/e6+vXQYr7nfjhLdgM62ie5FH2yH8zH/bDL3GD9TWI43ie3p/+HEgMGto
 6rWysiC0YeSy4Aq2IueRtJs2/YDfCUG+OIAAAA=
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Simon Horman <horms@kernel.org>, Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 bpf@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Julien Panis <jpanis@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709305390; l=1433;
 i=jpanis@baylibre.com; s=20230526; h=from:subject:message-id;
 bh=fRkAAAy6okiH74c3wMlw7w5JWLn9Ut8v1qmSnkw5Lrs=;
 b=6wZLBkoqcQ01o76sru4VFM780fXr3UvKTOCDR2ORKqd6i7DJR9tMN+n73vBTVTfREkGPhle3R
 SF53bKdxho/B+eztrnC29ov7izoOhD/b3akA2VrJ1bl1Vd8UrvyHtsv
X-Developer-Key: i=jpanis@baylibre.com; a=ed25519;
 pk=8eSM4/xkiHWz2M1Cw1U3m2/YfPbsUdEJPCWY3Mh9ekQ=
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

This patch adds XDP support to TI AM65 CPSW Ethernet driver.

The following features are implemented: NETDEV_XDP_ACT_BASIC,
NETDEV_XDP_ACT_REDIRECT, and NETDEV_XDP_ACT_NDO_XMIT.

Zero-copy and non-linear XDP buffer supports are NOT implemented.

Besides, the page pool memory model is used to get better performance.

Signed-off-by: Julien Panis <jpanis@baylibre.com>
---
Changes in v2:
- Use page pool memory model instead of MEM_TYPE_PAGE_ORDER0.
- In am65_cpsw_alloc_skb(), release reference on the page pool page
in case of error returned by build_skb().
- [nit] Cleanup am65_cpsw_nuss_common_open/stop() functions.
- [nit] Arrange local variables in reverse xmas tree order.
- Link to v1: https://lore.kernel.org/r/20240223-am65-cpsw-xdp-basic-v1-1-9f0b6cbda310@baylibre.com

---
Julien Panis (2):
      net: ethernet: ti: Add accessors for struct k3_cppi_desc_pool members
      net: ethernet: ti: am65-cpsw: Add minimal XDP support

 drivers/net/ethernet/ti/am65-cpsw-nuss.c    | 490 +++++++++++++++++++++++++---
 drivers/net/ethernet/ti/am65-cpsw-nuss.h    |  13 +
 drivers/net/ethernet/ti/k3-cppi-desc-pool.c |  12 +
 drivers/net/ethernet/ti/k3-cppi-desc-pool.h |   2 +
 4 files changed, 469 insertions(+), 48 deletions(-)
---
base-commit: 6613476e225e090cc9aad49be7fa504e290dd33d
change-id: 20240223-am65-cpsw-xdp-basic-4db828508b48

Best regards,
-- 
Julien Panis <jpanis@baylibre.com>

