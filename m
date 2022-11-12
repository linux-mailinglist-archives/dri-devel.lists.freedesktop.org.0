Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 998C3626FB5
	for <lists+dri-devel@lfdr.de>; Sun, 13 Nov 2022 14:26:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C013910E0C7;
	Sun, 13 Nov 2022 13:26:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2283 seconds by postgrey-1.36 at gabe;
 Sat, 12 Nov 2022 20:21:25 UTC
Received: from b-painless.mh.aa.net.uk (b-painless.mh.aa.net.uk
 [IPv6:2001:8b0:0:30::52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15C5D10E1C0
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Nov 2022 20:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fdy2.co.uk; 
 s=aaisp1;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=27IA2b7KPGRTkMPYu8HczDZtK5zakhdfly1iZlWEx/4=; b=iZSlX3ShKliMJw1tqkt3oeqist
 46jmjU5TyxRJk707fYzsoK1NwcQULn5c9rfT3H8xXllODEjtlPnAm2+6HkRPR2sMK5VxWCk8HMxKQ
 jvZf1WEHCxs0up5adWQzM7wW1DUpC6vKxLACgG4n9IZpb5nrfsgPgIuMJTPW+h3npodmh3latCsXh
 8xyc9X9tB+3/5ZO9bcUCXDrsmRwuPbimu9PScqotzpNhuHDPqR5CoGU8gR5umdwxLK9pM1OHssJ8O
 MQ6ZPtEjggK/9KhbEgFD3lVXkpkoHAVrlFGOXMmg9qGC8nT0RhTIC/SjoGup3s948ONIcfpg0RFCS
 DFzn1puA==;
Received: from
 7.c.1.b.8.2.e.f.f.f.a.c.5.0.a.6.7.c.1.1.9.b.e.b.0.b.8.0.1.0.0.2.ip6.arpa
 ([2001:8b0:beb9:11c7:6a05:caff:fe28:b1c7] helo=ren.fdy2.co.uk)
 by painless-b.tch.aa.net.uk with esmtp (Exim 4.94.2)
 (envelope-from <rjs@fdy2.co.uk>)
 id 1otwPx-0035c8-Df; Sat, 12 Nov 2022 19:43:52 +0000
Received: by ren.fdy2.co.uk (Postfix, from userid 100)
 id 04AC93062D7; Sat, 12 Nov 2022 19:42:10 +0000 (GMT)
From: Robert Swindells <rjs@fdy2.co.uk>
To: noralf@tronnes.org, liuzixian4@huawei.com, airlied@redhat.com,
 tzimmermann@suse.de, lucas.demarchi@intel.com, kraxel@redhat.com,
 robh@kernel.org, kuba@kernel.org, marcel.ziswiler@toradex.com,
 sfr@canb.auug.org.au, daniel.vetter@ffwll.ch, cai.huoqing@linux.dev,
 nroberts@igalia.com, m.szyprowski@samsung.com, emil.velikov@collabora.com,
 sam@ravnborg.org, boris.brezillon@collabora.com, dan.carpenter@oracle.com
Subject: [PATCH 0/1] drm/shmem: Dual licence the files as GPL-2 and MIT 
Date: Sat, 12 Nov 2022 19:42:09 +0000
Message-Id: <20221112194210.7657-1-rjs@fdy2.co.uk>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 13 Nov 2022 13:26:17 +0000
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There was some earlier discussion on dual licencing as GPL-2 and MIT
some files that were previously just GPL-2:

<https://lore.kernel.org/dri-devel/CAKMK7uH-8+tbKsAoiChsxELEc_77RVVxP2wapHWhqB+0Viifog@mail.gmail.com/>

Would it be possible to dual licence two more of the files?

drivers/gpu/drm/drm_gem_shmem_helper.c
include/drm/drm_gem_shmem_helper.h

They are used by the lima driver, which is dual licenced.

Robert Swindells
rjs@NetBSD.org

Robert Swindells (1):
  drm/shmem: Dual licence the files as GPL-2 and MIT

 drivers/gpu/drm/drm_gem_shmem_helper.c | 2 +-
 include/drm/drm_gem_shmem_helper.h     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.38.0

