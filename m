Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F19BA8794FD
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 14:22:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6FCE10E702;
	Tue, 12 Mar 2024 13:22:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="XyrMTQPD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 219ED10E702
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 13:22:54 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-33d90dfe73cso3232097f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 06:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1710249773; x=1710854573;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XguyOTPW8SaIMkmqZ21Rgli3joUrKCpC0w2AVoDmBo8=;
 b=XyrMTQPDgtyvyIzTZIjVdKVBlf/htyJgHiCjsS53xuE5NW7DA/WSEHJllyJF8ivrSR
 3dRbOMasQ0WrHUrZsdkk7Fg+9scIJC8JaY9KMg4Gk9wPVO9aU5sQuFKZyP0CKl4PAeSY
 3g/La60nME2biRE9zmM92O/mv7hn4bGXBkGrst4/D2EQdVtx/R5AqD/O2XTDaOEdjg5Z
 55wxAZj/ezgMzCYGJqh+quAMwni5scvuWbcjSo/hu0gQaPhCR7NhcL9DP7dAT7WSqqaG
 HrOZHqxUhSL12SSG1vKZyOjrPZsdbTbKOwmmGIofRGValQLSnviXbK4X8teDxnWnCkMG
 W83g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710249773; x=1710854573;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XguyOTPW8SaIMkmqZ21Rgli3joUrKCpC0w2AVoDmBo8=;
 b=I6l3tqjg7+LoUcqm4BIQS3Gp0+WFapWb/aSXDSpc8f8zZ8YAEW5ctDceNNLJc0Bmxm
 5O/yWonPiU3jZshdfTpWVT0N378SNqevXF+LHldU42y9keYAibyIPvhbz3z5qTnGcUqS
 Eok57PY/NDHVm+2ypA97xlhlTgON+3x9GI0o7y22QzUKbQvuNeI91zmJLj88PYRUOLiF
 cfuQ2SEXjemSKfao7Ix4CryOGLENtKamilolA1RByiwWgP9U3+M6nZ4mBWvG4pUDJ3JT
 mo5QNWSrLEnvFRz1nDt0ODTciKHwZXNWDGwjQSXkZAuikFcq5ZVpZauzt0fbT/Ep7iFM
 Zy3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEOmGqHM8UIiDIFRF6PQG9ySf+z5BSMq7cTfKmuWunZNZPTfvq5Fmjbh1T5xvVtIZ0l9a0vVzi98T1Gh7eyNyR7zZIj6kaWNI36Zbz/nAo
X-Gm-Message-State: AOJu0Yxs0j8tAj/DPHDpmNAD8Itv4wpWwortG+8NhXc5SWReSPTadJti
 0fq8nyMRpHeXJkzwzI8iaX/n9fNH9qRDpqof/tPt0wZAeUNqAf2uHF5bIBWSysw=
X-Google-Smtp-Source: AGHT+IEFEOnsskmi8fJKjEHWQFqnqg32ZRzKau2ZUnrv1se7UxcgZ+VfM9jul+nu6p2zo1WC/Cdhcg==
X-Received: by 2002:adf:a38c:0:b0:33e:5970:e045 with SMTP id
 l12-20020adfa38c000000b0033e5970e045mr8556122wrb.21.1710249772871; 
 Tue, 12 Mar 2024 06:22:52 -0700 (PDT)
Received: from [127.0.1.1]
 (laubervilliers-657-1-248-155.w90-24.abo.wanadoo.fr. [90.24.137.155])
 by smtp.gmail.com with ESMTPSA id
 r13-20020adff10d000000b0033b278cf5fesm8980167wro.102.2024.03.12.06.22.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Mar 2024 06:22:52 -0700 (PDT)
From: Julien Panis <jpanis@baylibre.com>
Subject: [PATCH v4 0/3] Add minimal XDP support to TI AM65 CPSW Ethernet driver
Date: Tue, 12 Mar 2024 14:22:39 +0100
Message-Id: <20240223-am65-cpsw-xdp-basic-v4-0-38361a63a48b@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB9X8GUC/42OwW7CMBBEfwX53AXbcSKHU/+jQmjXNmQr4kQ2c
 kEo/16HI6oqjjOaeTMPkUPikMV+8xApFM48xSrMx0a4AeM5APuqhZbaSK0bwLFrwc35B25+BsL
 MDownq20rLRkrarO6AShhdMPa/Z4xct7V/HFEjheO4VjkGpxTOPHtOf91qHrgfJ3S/fmmqNX9f
 7goUNCfJHWOPDZKfhLeL0wpbN00ihVZ9BsYDRKkcp1DdEjU/YFp3sA0FdP63hjsvTX4+mZZll9
 hpGJ2cAEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1710249771; l=2133;
 i=jpanis@baylibre.com; s=20230526; h=from:subject:message-id;
 bh=wqQe2DJZDzzMYImWv6Ki1IImWaVqSXITlgGJEpik5FA=;
 b=HmUezjz9lmpONlJhbBP6IRegsF/dgO1FNHWsEtwF4sZ1ZCh/yXfBCwi9V5pCb3ZDGJ4JUJx8N
 gPsTooMTbBtD/k6ajbTUJNmWqxhKmfSLPAn8IeIi5FZnZWjDyzW2E9r
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
Changes in v4:
- Add skb_mark_for_recycle() in am65_cpsw_nuss_rx_packets() function.
- Specify napi page pool parameter in am65_cpsw_create_xdp_rxqs() function.
- Add benchmark numbers (with VS without page pool) in the commit description.
- Add xdp_do_flush() in am65_cpsw_run_xdp() function for XDP_REDIRECT case.
- Link to v3: https://lore.kernel.org/r/20240223-am65-cpsw-xdp-basic-v3-0-5d944a9d84a0@baylibre.com

Changes in v3:
- Fix a potential issue with TX buffer type, which is now set for each buffer.
- Link to v2: https://lore.kernel.org/r/20240223-am65-cpsw-xdp-basic-v2-0-01c6caacabb6@baylibre.com

Changes in v2:
- Use page pool memory model instead of MEM_TYPE_PAGE_ORDER0.
- In am65_cpsw_alloc_skb(), release reference on the page pool page
in case of error returned by build_skb().
- [nit] Cleanup am65_cpsw_nuss_common_open/stop() functions.
- [nit] Arrange local variables in reverse xmas tree order.
- Link to v1: https://lore.kernel.org/r/20240223-am65-cpsw-xdp-basic-v1-1-9f0b6cbda310@baylibre.com

---
Julien Panis (3):
      net: ethernet: ti: Add accessors for struct k3_cppi_desc_pool members
      net: ethernet: ti: Add desc_infos member to struct k3_cppi_desc_pool
      net: ethernet: ti: am65-cpsw: Add minimal XDP support

 drivers/net/ethernet/ti/am65-cpsw-nuss.c    | 536 +++++++++++++++++++++++++---
 drivers/net/ethernet/ti/am65-cpsw-nuss.h    |  13 +
 drivers/net/ethernet/ti/k3-cppi-desc-pool.c |  36 ++
 drivers/net/ethernet/ti/k3-cppi-desc-pool.h |   4 +
 4 files changed, 539 insertions(+), 50 deletions(-)
---
base-commit: 6613476e225e090cc9aad49be7fa504e290dd33d
change-id: 20240223-am65-cpsw-xdp-basic-4db828508b48

Best regards,
-- 
Julien Panis <jpanis@baylibre.com>

