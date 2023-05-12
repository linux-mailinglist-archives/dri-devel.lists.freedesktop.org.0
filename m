Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D627004C4
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 12:07:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 449E910E66A;
	Fri, 12 May 2023 10:07:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E22310E65F
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 10:07:01 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1aaf706768cso74966255ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 03:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683886020; x=1686478020;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MF1kClHwqeIfcYl89hzofL9vZWLuExWhfi4hFZftNQc=;
 b=OcUcPzMZPjhSctBLIUIJJQCgYOzU04AKhWQr9M5X5E2GKoXeofLGVSOfGNKkoSsuN8
 2Hn8RB6mk66r9DOH8GJq0TmL2FSoEN9ljvskjp9erxdT+L8nsW1pVdVKUvVbqOHECJuk
 7aDSaRe96lAx+THfaH8yCaiTyV3fYDYHwUHP8dGcfsqz+IHvxbkBKzQXouy1fI6BfD+0
 K9tqc3j7FCyLXWsSncoupm8V7bnHAHSmTTuF6NPosxTX2EN9ilHKTtT7nbSobIbRcwRo
 DYXicNpXe5y4OhBS4/HSAObZKVpfwJ1sWijsHQ+z8oztzT6fNLUGlljPIdz9ZHYK3/O+
 rQPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683886020; x=1686478020;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MF1kClHwqeIfcYl89hzofL9vZWLuExWhfi4hFZftNQc=;
 b=jKgEfTnecwvb9ySP11fsUe/BjcP8mFjNoLqwYsGJdc1/Tt572WGK3yo2blQ1l7zXRO
 JWcqS8kgevQd5fvXxjPCYoTXgYoRdY5yK2eUPqliA/ZHpPaRyFgzd4boDjnK7oz0V6om
 XmdXQSp4orzJ4sv9xK8UY6hRMDhJMvbe3pR35dUlohWGPnEWdbW4PNYtPvWH6dUz5X0b
 I6iAyC/2KUOlb/e0yJcFJCmyciGZM7mSqWwES3MWExJW5DLFAkDISWrUGylP9sZkdkoK
 4vJu09Q+KiwqhEm+UcKezkx6Nr7ounuXkviGuMAs3p+NB8xzXu2Lxpwr0PRjfOZJ2zwa
 wrGQ==
X-Gm-Message-State: AC+VfDwaNqiVx7ypW2sHbM5yyfPrYtSKW67/fiaK0U9d/rz4YreVrboi
 cDIiM56iZn5zfPTH7RJukqM=
X-Google-Smtp-Source: ACHHUZ50IUxu1FhvLcpiZZIKLIroOklQP/UisO3FYeKOr7ewmmJz8X2IVf1EqqtbwW8nYPw9TSpqfw==
X-Received: by 2002:a17:902:7407:b0:1a6:3ffb:8997 with SMTP id
 g7-20020a170902740700b001a63ffb8997mr26433375pll.42.1683886019859; 
 Fri, 12 May 2023 03:06:59 -0700 (PDT)
Received: from debian.me (subs28-116-206-12-58.three.co.id. [116.206.12.58])
 by smtp.gmail.com with ESMTPSA id
 q14-20020a17090311ce00b001a24e2eec75sm7527379plh.193.2023.05.12.03.06.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 03:06:59 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id 80D44106B32; Fri, 12 May 2023 17:06:54 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux SPDX Licenses <linux-spdx@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Networking <netdev@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Staging Drivers <linux-staging@lists.linux.dev>,
 Linux Watchdog Devices <linux-watchdog@vger.kernel.org>,
 Linux Kernel Actions <linux-actions@lists.infradead.org>
Subject: [PATCH v2 00/10] Treewide GPL SPDX conversion and cleanup (in
 response to Didi's GPL full name fixes)
Date: Fri, 12 May 2023 17:06:11 +0700
Message-Id: <20230512100620.36807-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=7996; i=bagasdotme@gmail.com;
 h=from:subject; bh=b4eQ13BRmR9+v89nmhYi5AatdBClhH8kt45zmkpWvis=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDClx/H0mZ5eHqLJFfnnzs/0426p5G19/O9LL36j1XktHn
 vnm74cWHaUsDGJcDLJiiiyTEvmaTu8yErnQvtYRZg4rE8gQBi5OAZiIxzOG/wXa07+I2XO8LdGS
 flltLnyw4grDC09VpeI9jkp/0y8pBTMyXCp4bmSRqS6UuFXk373N708uORazIPyqyM5MlwtGH02
 usgIA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Eric Dumazet <edumazet@google.com>, Bagas Sanjaya <bagasdotme@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Andy Gospodarek <andy@greyhouse.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>, Sam Creasey <sammy@sammy.net>,
 Manivannan Sadhasivam <mani@kernel.org>, Jay Vosburgh <j.vosburgh@gmail.com>,
 Philippe Ombredanne <pombredanne@nexb.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, David Airlie <airlied@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Karsten Keil <isdn@linux-pingi.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "David S. Miller" <davem@davemloft.net>,
 Diederik de Haas <didi.debian@cknow.org>, Jan Kara <jack@suse.com>,
 =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
 Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I trigger this patch series as a response to Didi's GPL full name fix
patches [1], for which all of them had been NAKed. In many cases, the
appropriate correction is to use SPDX license identifier instead.

Often, when replacing license notice boilerplates with their equivalent
SPDX identifier, the notice doesn't mention explicit GPL version. Greg
[2] replied this question by falling back to GPL 1.0 (more precisely
GPL 1.0+ in order to be compatible with GPL 2.0 used by Linux kernel),
although there are exceptions (mostly resolved by inferring from
older patches covering similar situation).

The series covers the same directories touched as Didi's ones, minus
Documentation/ (as should have been inferred by SPDX tags on respective
docs).

Changes since v1 ([3]):
  * Cc: additional original authors that are missed in v1
  * Pick up Reviewed-by: and Acked-by: tags from review
  * Fix spdxcheck and SPDX-related checkpatch warnings
  * Fix a few tag oversights.

[1]: https://lore.kernel.org/all/?q=f%3A%22didi.debian%40cknow.org%22+AND+s%3A%22GPL%22+AND+NOT+s%3A%22Re%3A%22
[2]: https://lore.kernel.org/all/20181028112728.GD8826@kroah.com/ 
[3]: https://lore.kernel.org/netdev/20230511133406.78155-1-bagasdotme@gmail.com/

Bagas Sanjaya (10):
  agp/amd64: Remove GPL distribution notice
  mISDN: Replace GPL notice boilerplate with SPDX identifier
  net: bonding: Add SPDX identifier to remaining files
  net: ethernet: 8390: Replace GPL boilerplate with SPDX identifier
  net: ethernet: i825xx: Replace GPL boilerplate with SPDX identifier
  pcmcia: Add SPDX identifier
  drivers: staging: wlan-ng: Remove GPL/MPL boilerplate
  drivers: watchdog: Replace GPL license notice with SPDX identifier
  udf: Replace license notice with SPDX identifier
  include: synclink: Replace GPL license notice with SPDX identifier

 drivers/char/agp/amd64-agp.c               |  1 -
 drivers/isdn/mISDN/dsp_audio.c             |  4 +---
 drivers/isdn/mISDN/dsp_blowfish.c          |  4 +---
 drivers/isdn/mISDN/dsp_cmx.c               |  4 +---
 drivers/isdn/mISDN/dsp_core.c              |  3 +--
 drivers/isdn/mISDN/dsp_dtmf.c              |  4 +---
 drivers/isdn/mISDN/dsp_tones.c             |  4 +---
 drivers/net/bonding/bond_main.c            |  3 ++-
 drivers/net/bonding/bonding_priv.h         |  4 +---
 drivers/net/ethernet/8390/8390.h           |  2 ++
 drivers/net/ethernet/8390/apne.c           |  7 +------
 drivers/net/ethernet/8390/axnet_cs.c       |  6 +++---
 drivers/net/ethernet/8390/hydra.c          |  6 ++----
 drivers/net/ethernet/8390/lib8390.c        |  5 ++---
 drivers/net/ethernet/8390/mac8390.c        |  6 ++----
 drivers/net/ethernet/8390/mcf8390.c        |  4 +---
 drivers/net/ethernet/8390/ne.c             |  4 +---
 drivers/net/ethernet/8390/ne2k-pci.c       |  8 +-------
 drivers/net/ethernet/8390/pcnet_cs.c       |  5 ++---
 drivers/net/ethernet/8390/smc-ultra.c      |  4 +---
 drivers/net/ethernet/8390/stnic.c          |  5 +----
 drivers/net/ethernet/8390/wd.c             |  4 +---
 drivers/net/ethernet/8390/zorro8390.c      |  7 +------
 drivers/net/ethernet/i825xx/82596.c        |  5 ++---
 drivers/net/ethernet/i825xx/lasi_82596.c   |  5 ++---
 drivers/net/ethernet/i825xx/lib82596.c     |  5 ++---
 drivers/net/ethernet/i825xx/sun3_82586.c   |  4 +---
 drivers/net/ethernet/i825xx/sun3_82586.h   |  4 +---
 drivers/pcmcia/bcm63xx_pcmcia.c            |  5 +----
 drivers/pcmcia/cirrus.h                    | 21 +------------------
 drivers/pcmcia/i82365.c                    | 22 +-------------------
 drivers/pcmcia/i82365.h                    | 21 +------------------
 drivers/pcmcia/o2micro.h                   | 21 +------------------
 drivers/pcmcia/pd6729.c                    |  3 +--
 drivers/pcmcia/pxa2xx_base.h               |  1 +
 drivers/pcmcia/ricoh.h                     | 21 +------------------
 drivers/pcmcia/sa1100_generic.c            | 22 +-------------------
 drivers/pcmcia/sa11xx_base.c               | 22 +-------------------
 drivers/pcmcia/sa11xx_base.h               | 22 +-------------------
 drivers/pcmcia/soc_common.c                | 22 +-------------------
 drivers/pcmcia/tcic.c                      | 22 +-------------------
 drivers/pcmcia/tcic.h                      | 21 +------------------
 drivers/pcmcia/ti113x.h                    | 21 +------------------
 drivers/pcmcia/topic.h                     | 23 +--------------------
 drivers/pcmcia/vg468.h                     | 21 +------------------
 drivers/staging/wlan-ng/hfa384x.h          | 21 -------------------
 drivers/staging/wlan-ng/hfa384x_usb.c      | 21 -------------------
 drivers/staging/wlan-ng/p80211conv.c       | 21 -------------------
 drivers/staging/wlan-ng/p80211conv.h       | 21 -------------------
 drivers/staging/wlan-ng/p80211hdr.h        | 21 -------------------
 drivers/staging/wlan-ng/p80211ioctl.h      | 21 -------------------
 drivers/staging/wlan-ng/p80211metadef.h    | 21 -------------------
 drivers/staging/wlan-ng/p80211metastruct.h | 21 -------------------
 drivers/staging/wlan-ng/p80211mgmt.h       | 21 -------------------
 drivers/staging/wlan-ng/p80211msg.h        | 21 -------------------
 drivers/staging/wlan-ng/p80211netdev.c     | 21 -------------------
 drivers/staging/wlan-ng/p80211netdev.h     | 21 -------------------
 drivers/staging/wlan-ng/p80211req.c        | 21 -------------------
 drivers/staging/wlan-ng/p80211req.h        | 21 -------------------
 drivers/staging/wlan-ng/p80211types.h      | 21 -------------------
 drivers/staging/wlan-ng/p80211wep.c        | 21 -------------------
 drivers/staging/wlan-ng/prism2fw.c         | 21 -------------------
 drivers/staging/wlan-ng/prism2mgmt.c       | 21 -------------------
 drivers/staging/wlan-ng/prism2mgmt.h       | 21 -------------------
 drivers/staging/wlan-ng/prism2mib.c        | 21 -------------------
 drivers/staging/wlan-ng/prism2sta.c        | 21 -------------------
 drivers/watchdog/ep93xx_wdt.c              |  5 +----
 drivers/watchdog/ibmasr.c                  |  3 +--
 drivers/watchdog/m54xx_wdt.c               |  4 +---
 drivers/watchdog/max63xx_wdt.c             |  5 +----
 drivers/watchdog/moxart_wdt.c              |  4 +---
 drivers/watchdog/octeon-wdt-nmi.S          |  5 +----
 drivers/watchdog/orion_wdt.c               |  4 +---
 drivers/watchdog/rtd119x_wdt.c             |  2 +-
 drivers/watchdog/sb_wdog.c                 |  5 +----
 drivers/watchdog/sbc_fitpc2_wdt.c          |  4 +---
 drivers/watchdog/ts4800_wdt.c              |  4 +---
 drivers/watchdog/ts72xx_wdt.c              |  4 +---
 fs/udf/balloc.c                            |  6 +-----
 fs/udf/dir.c                               |  6 +-----
 fs/udf/directory.c                         |  6 +-----
 fs/udf/ecma_167.h                          | 24 +---------------------
 fs/udf/file.c                              |  6 +-----
 fs/udf/ialloc.c                            |  6 +-----
 fs/udf/inode.c                             |  6 +-----
 fs/udf/lowlevel.c                          |  6 +-----
 fs/udf/misc.c                              |  6 +-----
 fs/udf/namei.c                             |  6 +-----
 fs/udf/osta_udf.h                          | 24 +---------------------
 fs/udf/partition.c                         |  6 +-----
 fs/udf/super.c                             |  6 +-----
 fs/udf/symlink.c                           |  6 +-----
 fs/udf/truncate.c                          |  6 +-----
 fs/udf/udftime.c                           | 19 +----------------
 fs/udf/unicode.c                           |  6 +-----
 include/linux/synclink.h                   |  3 +--
 include/net/bonding.h                      |  4 +---
 97 files changed, 86 insertions(+), 1000 deletions(-)


base-commit: ac9a78681b921877518763ba0e89202254349d1b
-- 
An old man doll... just what I always wanted! - Clara

