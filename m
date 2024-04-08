Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 120CD89BBE1
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 11:38:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4BD110E280;
	Mon,  8 Apr 2024 09:38:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Jwx7GBzk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE22910E280
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 09:38:11 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-a51abd0d7c2so364113566b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Apr 2024 02:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712569090; x=1713173890;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=m1PLjRGl2MYyX+2zKdFV7iSC02Qe1cYgW7veKZ91RLg=;
 b=Jwx7GBzkbIwqnwQADPjcJ2EinLk4VTv0pEtc9Xialf7xeTu7U0PJJSOG4QSVwY6HkA
 uuTACOMe+rpShy3EXI7P6q2zQy8PCf84XawRT+Kf41W6RhKlimtZqg6O4fIdW+C8ALiv
 YBTO0d6ucNkTA33q47bPvnkOZyi9cnMVd6vnl5JdmQzOolAfXfoqOF6qK5VHyskHUbIi
 znNBE9i4UMrdJ5UEThvMlBvX6k/H2U8KOd7D6+eQRIm7DWofPBTTiAyR0KxlQ0AwNO3M
 ++2V9mT+MGIraXmAYabAxGK6BmEOi5hn1Y1tefrC50M3XAt0F1PVJW1m5FF7fEO608vn
 TGsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712569090; x=1713173890;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m1PLjRGl2MYyX+2zKdFV7iSC02Qe1cYgW7veKZ91RLg=;
 b=Lsqr/oZ9mkL98pdtrCcHHiKa2f/g31KNeIaw9SEg9lZ7oCTiy3EkD/V3EvgWzEiFjy
 vI36IHbG3vrYxd5r2/Zv7a+s+UfMzazZU/2dBQgRFsFU6X61eljgd4zZWAhPuqg0SjLa
 XYgdTvObupaLMkuXohSdiAhAF94jlOcWqKOCgAt/GLYOZlQjg279oeRGmrQlqwVjtAAp
 ewvZRZ832XcY38iKzGbuo7euLGtNvAdDOJ4QVLkAAcxK5snnAJcHHM5xWIzwfKNg7RsZ
 5UXgie+tvGIsnkAjikl+tW2sT0FwDRE44WzwMGiEYTJ+GDUZdyrdPW3nlM550MT3Gu/N
 imZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUR/Asw6HiKqyn6uuflJ0qov8g2PGoqs0dhzyxoe/TZ+xvvBmgL78uxqD/NH4HQakuepCnEXvNjbtpL639rpR/GTYIHh/m7RDZ+nD5xxgl1
X-Gm-Message-State: AOJu0Yy6PLVwQhRMj2VYQLqWYr/Xpan8yqL8m/Bq0bxUVpPQFOdKjP26
 Q/xx2dPIBIu5uG1fv07yFQIxlEw19B+tx7Cu4zjPcIOqcUllS10gVK3UYAwzudU=
X-Google-Smtp-Source: AGHT+IGnQd1kztAY4avgfZG8BTwixabZYgbRBBawEhqGsrjNGUFhp8SXWgLnOMI0cl/Wn5n5NhooZQ==
X-Received: by 2002:a17:907:e8d:b0:a51:db9a:47ca with SMTP id
 ho13-20020a1709070e8d00b00a51db9a47camr1001978ejc.28.1712569090032; 
 Mon, 08 Apr 2024 02:38:10 -0700 (PDT)
Received: from [127.0.1.1] ([84.102.31.74]) by smtp.gmail.com with ESMTPSA id
 ne6-20020a1709077b8600b00a4e5a6b57a2sm4175803ejc.163.2024.04.08.02.38.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Apr 2024 02:38:09 -0700 (PDT)
From: Julien Panis <jpanis@baylibre.com>
Subject: [PATCH net-next v8 0/3] Add minimal XDP support to TI AM65 CPSW
 Ethernet driver
Date: Mon, 08 Apr 2024 11:38:01 +0200
Message-Id: <20240223-am65-cpsw-xdp-basic-v8-0-f3421b58da09@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPm6E2YC/43QzW7CMAwH8FdBOZMt30132ntMCDmOOzJBqBrUg
 RDvvtDbpmrK0bH9y1++s0JTosLeNnc20ZxKOuda+O2G4QHyJ/EUa82UUEYopTmcnOU4lm9+jSM
 PUBJyE4NX3gofjGd1s74SDxNkPDx3v0bIqbzW+f0JUj6mTPtZPAfHiYZ0Xb7/YJkuPNP1wna1c
 0jlcp5uS65ZLv1/I8ySS94PIjgMEbQU7wFuxxQmesHzaSFn1cAoLriQ6BAAIQS3wugGRlfGxt4
 Y6KM3sJbGNDCmMtprJ8FpMD78ZrabhnVFxpKNhML4lRS2IYWtTEDZ6V52IuDaTVwD455ppCIaB
 huiHVaYroHpKoPa2w69ihD/3GT3eDx+AOgc/bfVAgAA
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
Cc: danishanwar@ti.com, yuehaibing@huawei.com, rogerq@kernel.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, Julien Panis <jpanis@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712569087; l=2999;
 i=jpanis@baylibre.com; s=20230526; h=from:subject:message-id;
 bh=3Oe0Hs1hEKEvDoktbHfU95I86ttlMXOY6/+XRDoZZiw=;
 b=9c3VEL8gylBs0NJqjRRKrAl3fE1uu9hbotAKaeGSKKPIEaUPo1qk3Gid5iSdZL6f7XQUH7zZo
 uOuDDcsXCGWD9kKXcSpvD14RsAuXAkWbP+uz1lxCdtZzcv2trFjRSVk
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
Changes in v8:
- Fix some warnings reported by patchwork.
- Link to v7: https://lore.kernel.org/r/20240223-am65-cpsw-xdp-basic-v7-0-c3857c82dadb@baylibre.com

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

 drivers/net/ethernet/ti/am65-cpsw-nuss.c    | 569 +++++++++++++++++++++++++---
 drivers/net/ethernet/ti/am65-cpsw-nuss.h    |  13 +
 drivers/net/ethernet/ti/k3-cppi-desc-pool.c |  41 ++
 drivers/net/ethernet/ti/k3-cppi-desc-pool.h |   6 +
 4 files changed, 578 insertions(+), 51 deletions(-)
---
base-commit: 6613476e225e090cc9aad49be7fa504e290dd33d
change-id: 20240223-am65-cpsw-xdp-basic-4db828508b48

Best regards,
-- 
Julien Panis <jpanis@baylibre.com>

