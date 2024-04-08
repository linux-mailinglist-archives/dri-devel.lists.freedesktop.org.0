Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B3989B83A
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 09:20:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C62B811219B;
	Mon,  8 Apr 2024 07:20:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ThpIIq/A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92C1F11219B
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 07:20:18 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-a51aac16b6eso154975066b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Apr 2024 00:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712560816; x=1713165616;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6NgflAqowUAu0egVNgXe8ugQun7X39r3CL2uIz1gu4c=;
 b=ThpIIq/AG2Ym7WOT2yyL/28aOM6mTvscx0WqYHH7AwSMnWcHOYsQJh7eoUZVtXrZzF
 jMVlpjOlwoDBpaEIPykPIsferJSPguXzFT2u8YPsSi+rCAMaQuPmxoLux8YEzHwHZjAZ
 lVXofc0SXZAWZ2mTO54pfPqYTTcFgl8RbOacF8Wvj51JkKD0hzmrbxaPNgC59k76Gj2e
 z9KKaIMjhXLntq9++iS1h/ErOpf2un1rkms9lR6/lMQYYKH4OVpQd6T+ZtGWoJUPqCnt
 1tZXxnZp4NmlJ22wFnbnf8nsCq2ppKC6R161PMGZqRmOV+lSNOdB5HXkYRlNldgZGs9C
 /JTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712560816; x=1713165616;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6NgflAqowUAu0egVNgXe8ugQun7X39r3CL2uIz1gu4c=;
 b=FDINdJppYMb1uFshv6gFmYoXJzMEqPJN/bMgCNwxx0hFuPOCF1bN0FnOmTh50gIK74
 uQk4mV6CKB9Ntreil7ls4rt/M9/n5jqOieWa17x8+QWd8Njw8IDf6JwuiSWXeKKkE6ar
 4xLCrElcaYicjpYWoHz/kw/rQmYIi/1nwT3E3TOXVhgnVZpyDOWKJ5j//Tf7WyxiHbK5
 u21ZEwK1dqaffRC9K11HXitbNFH9zSmtUdAUz+doavJJkzKV7GvI6Ie41oFsC5BNuuYG
 BcLYQgzL4nJC3CxbKKaFxPFErCszT4GI7AQNo7ongkph9DMi7nmej1yQyXW7LrF4Cvpm
 JJEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlIwX7ITYEPTuGhu7TzrWzr7BpVeuI4F6gYimcClBCQfShLbBlGU3/+ySXVA0VlJrAhVb+N2vQGkVE/Q5jnB26pTDK1K6UNdCcguoBudoF
X-Gm-Message-State: AOJu0YyQFQc3CHppQDmMB+eXXJxyDGHCEFfh5YURSBaP1n4YU7RDcDI0
 QZhl3ItJ6A0+f5ykbqUuV7z6HF4zyYnH9zLCd9WK+aKVGNZbAoP9ZKMdD0X5BtZurNGtHvDHGFG
 +
X-Google-Smtp-Source: AGHT+IELXUjkW+4uwxz09qQEfbszOo10hIajayl+cqGuPVmiHqNhtXuxaaAtecBt9WYaxZy/VQf6Rw==
X-Received: by 2002:a50:aad0:0:b0:56e:57f9:8c83 with SMTP id
 r16-20020a50aad0000000b0056e57f98c83mr2481000edc.19.1712560816205; 
 Mon, 08 Apr 2024 00:20:16 -0700 (PDT)
Received: from [127.0.1.1] ([84.102.31.74]) by smtp.gmail.com with ESMTPSA id
 p15-20020a05640243cf00b0056c2d0052c0sm3738769edc.60.2024.04.08.00.20.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Apr 2024 00:20:15 -0700 (PDT)
From: Julien Panis <jpanis@baylibre.com>
Subject: [PATCH net-next v7 0/3] Add minimal XDP support to TI AM65 CPSW
 Ethernet driver
Date: Mon, 08 Apr 2024 09:20:04 +0200
Message-Id: <20240223-am65-cpsw-xdp-basic-v7-0-c3857c82dadb@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKSaE2YC/42Qy2rDMBBFfyVoHbV6R86q/1FKmJHGjUqsGCu4D
 sH/XsW7FlO8nMc9c5gHKzQkKuy4e7CBxlTSNdfisN+xcIb8STzFWjMllBFKaQ6dszz05ZtPsec
 IJQVuInrlrfBoPKvJ2iWOA+Rwfma/esipvNb9UwcpX1Km0yiei/1AbZqW8+8s041nmm7so07Oq
 dyuw33xGuUy/1dhlFzyphXoAkbQUrwh3C8JB3oJ125BjmoDRnHBhQwuAARAdCsYvQGjK8bGxhh
 oojewZmM2YEzFaK+dBKfBePyN2e82xBUZSzZSEMavWNgNFrZiMMiDbuRBYFj7iduAcU8bqYja1
 mK07R/MPM8/c23pw44CAAA=
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Simon Horman <horms@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Ratheesh Kannoth <rkannoth@marvell.com>, 
 Naveen Mamindlapalli <naveenm@marvell.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 bpf@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Julien Panis <jpanis@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712560813; l=2836;
 i=jpanis@baylibre.com; s=20230526; h=from:subject:message-id;
 bh=i1uSsLXWtkljlVD9K5i4/KkLIjH9N0qPb5HbIu0GR0c=;
 b=MUTibm7kGyAuDtUjnh2ZeNRI/50rwE91Xv2jEKDUpbBOwINm0U9jwGiMHhr5rpzav9qb6avay
 RtcRt/bl/EPBbB0r315Etc3lZuucZjmBRI6ix+LVq29ARmq9sJhRypb
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
Changes in v7:
- Move xdp_do_flush() function call in am65_cpsw_nuss_rx_poll().
- Link to v6: https://lore.kernel.org/r/20240223-am65-cpsw-xdp-basic-v6-0-212eeff5bd5f@baylibre.com

Changes in v6:
- In k3_cppi_*() functions, use const qualifier when the content of
pool is not modified.
- Add allow_direct bool parameter to am65_cpsw_alloc_skb() function
for direct use by page_pool_put_full_page().
- Link to v5: https://lore.kernel.org/r/20240223-am65-cpsw-xdp-basic-v5-0-bc1739170bc6@baylibre.com

Changes in v5:
- In k3_cppi_desc_pool_destroy(), free memory allocated for desc_infos.
- Link to v4: https://lore.kernel.org/r/20240223-am65-cpsw-xdp-basic-v4-0-2e45e5dec048@baylibre.com

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

 drivers/net/ethernet/ti/am65-cpsw-nuss.c    | 547 +++++++++++++++++++++++++---
 drivers/net/ethernet/ti/am65-cpsw-nuss.h    |  13 +
 drivers/net/ethernet/ti/k3-cppi-desc-pool.c |  37 ++
 drivers/net/ethernet/ti/k3-cppi-desc-pool.h |   4 +
 4 files changed, 550 insertions(+), 51 deletions(-)
---
base-commit: 6613476e225e090cc9aad49be7fa504e290dd33d
change-id: 20240223-am65-cpsw-xdp-basic-4db828508b48

Best regards,
-- 
Julien Panis <jpanis@baylibre.com>

