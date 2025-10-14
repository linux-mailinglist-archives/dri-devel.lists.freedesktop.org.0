Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E60EBDB28A
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 22:08:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7623610E23D;
	Tue, 14 Oct 2025 20:08:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="INjpYtMy";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=valla.it header.i=@valla.it header.b="d9ONREMb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from delivery.antispam.mailspamprotection.com
 (delivery.antispam.mailspamprotection.com [185.56.87.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D129E10E23D
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 20:08:46 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256;
 d=outgoing.instance-europe-west4-61nr.prod.antispam.mailspamprotection.com;
 s=arckey; t=1760472526; 
 b=sEpjG/tLBdD6Lm1Ql/UxhsQJkPHGBHMMIxo6+/f8JUA5r/M0aejbTav2FzbD8aY89OH2fklbRF
 VUj97+P9QTWPaiEx9h5gBVTIYt/AcoTOpHqRnL6vKxSuuuuwYUHylcc4hUtwDMw4c2yhxRenhz
 eeXNtyN9qlU3UlZ64yNqVKtU2NKVWgk7RctbwC3srhYxy0JQV+fmScTNvNADXLlKEE6FJZfzAw
 kIOAD1ndVlkGGOp7yQb3/LnWeeq63u2242aWnWhXiJkk6AGlCiWLFr7ZSz7S1IhCso6itc9WDn
 1I5uGR5LiGtvTrCKnrkypHD7SM6V0n0BjKX29+swmn8EZQ==;
ARC-Authentication-Results: i=1;
 outgoing.instance-europe-west4-61nr.prod.antispam.mailspamprotection.com;
 smtp.remote-ip=35.214.173.214; 
 iprev=pass (214.173.214.35.bc.googleusercontent.com)
 smtp.remote-ip=35.214.173.214; 
 auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
 dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
 arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed;
 d=outgoing.instance-europe-west4-61nr.prod.antispam.mailspamprotection.com;
 s=arckey; t=1760472526; 
 bh=wqPHiJhR6p7x9nFQSEE5+mrpd2a3R2rTv1YQaUqHyUA=;
 h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 Subject:From:DKIM-Signature:DKIM-Signature;
 b=OHTG5/9nRU+59R6bcIwMHwKmUPIUJUfcXqHr9C30v7nKaxU5C8oO25GF5XpI7NIV3TgZ15OJnq
 8wuUiiTJsLhZlOxK0V3kdByNa5l0RotZd6NwqulpdK229CID/MdnrAVPSHkgyBPVFb7vhcyF3q
 6qeLNS1SUCGgaIjjVPh9CHm9JmGpT7/vj6483RvYyD3tMyKC+/glK4f3CqBAWvLkrh3rbUKjGe
 GL3zVdeccCGjt/2yttItamlmnhYTj6wc9IafOmdElImYR2Hh5Ky9t04NcKoLrqvJtuzBeMsjpE
 YUMYRzusRCrR34rJUvh9ca+2nYZ3i7+ws00mnv7AWWMMKA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
 :Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:
 Subject:From:Reply-To:List-Unsubscribe;
 bh=JTxuc9xqEIIWcfhoNtl0F+NmY63FucuPml9QbGzMvxs=; b=INjpYtMyEgYxjVmq2/v+pMh/fo
 WL4PVHwjfk74o1OJy4eCiZAc/XwXwptiGJyNEoLhVHdolBLCjhvlp9it1ttguKv8W0HZkuxDL2mvR
 b1nXREMMafrh4BQwQzFTqzcRO97N665zyTCQosp8UcGOWPNYLbHznDovuD9aPs/tgPF0=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214]
 helo=esm19.siteground.biz)
 by instance-europe-west4-61nr.prod.antispam.mailspamprotection.com with
 esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384 (Exim 4.98.1)
 (envelope-from <francesco@valla.it>) id 1v8lK5-00000002yXm-0L1O
 for dri-devel@lists.freedesktop.org; Tue, 14 Oct 2025 20:08:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
 s=default; h=Cc:To:Date:Subject:From:list-help:list-unsubscribe:
 list-subscribe:list-post:list-owner:list-archive;
 bh=JTxuc9xqEIIWcfhoNtl0F+NmY63FucuPml9QbGzMvxs=; b=d9ONREMbyDM4DunZUIbgMEEZhA
 h3ElDn4xVE8R4w7trzFIm7ofUr1Tka7w2TlqtDMxNSjL24wU52xzN0q7VBiPP0W9aER/dUG/i5fkk
 VHMLMeTDjpUirAjO/5Ex2HL3ZZZ1EOOkL+3g2rLO40FCy17pSFtaFIrFBftA+JzIwYV4=;
Received: from [87.16.13.60] (port=64127 helo=fedora.fritz.box)
 by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.98.1) (envelope-from <francesco@valla.it>)
 id 1v8lJp-00000000E00-2hH6; Tue, 14 Oct 2025 20:08:25 +0000
From: Francesco Valla <francesco@valla.it>
Subject: [PATCH v2 0/3] drm/draw: add check API to avoid spurious WARN
Date: Tue, 14 Oct 2025 22:08:11 +0200
Message-Id: <20251014-drm_draw_conv_check-v2-0-05bef3eb06fb@valla.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKut7mgC/23NQQ7CIBCF4as0sxYDVKp15T1MQxCmdmKlBhrUN
 NxdbOLO5f+S+WaBiIEwwrFaIGCiSJMvITcV2MH4KzJypUFyqQTnNXPhrl0wT20nn7Qd0N5Ya23
 NFceLU3sol4+APb1W9dyVHijOU3ivT5L4rj9P/fWSYLygB7Fzbd3IvjklM45mSzN0OecP8/2NL
 rUAAAA=
X-Change-ID: 20251003-drm_draw_conv_check-9cc3050ebd57
To: Jocelyn Falempe <jfalempe@redhat.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.14.2
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 95739f7b890fbe220b83582fc541cd56
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1v8lK5-00000002yXm-0L1O-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-61nr.prod.antispam.mailspamprotection.com; 
 iprev=pass (214.173.214.35.bc.googleusercontent.com)
 smtp.remote-ip=35.214.173.214; 
 auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
 dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
 arc=none
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

When using the DRM draw support, the only way to check if a color can be
converted from XRGB8888 to a target format is currently to attempt an
actual conversion using drm_draw_color_from_xrgb8888(). This function
however will print a WARN the first time a conversion cannot be
performed, leading to two potential issues:

 - a WARN is emitted without a real reason if the caller is only
   attempting a conversion to check if a format can be supported (which
   is the case for two of the current user of this API);
 - a failing call following the first one is not emitting a WARN, but a
   "valid" color value (0x00000000) is returned nevertheless.

The first issue was observed while using drm_log on a Beagleplay, which
lists AR12 as the first format for its HDMI modesets.

The target of this patch set is to improve this situation; the first
patch introduces a new API devoted only to check if a conversion from
XRGB8888 to the specified format can be performed, while the other two
substitute drm_draw_color_from_xrgb8888() with this new API in the
current users (drm_panic and drm_log) where relevant.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
Changes in v2:
- Moved to dedicated switch cases in separate functions instead of
  single one inside common function.
- Fix copy-paste error in commit message.

Link to v1: https://lore.kernel.org/r/20251005-drm_draw_conv_check-v1-0-9c814d9362f6@valla.it

---
Francesco Valla (3):
      drm/draw: add drm_draw_can_convert_from_xrgb8888
      drm/log: avoid WARN when searching for usable format
      drm/panic: avoid WARN when checking format support

 drivers/gpu/drm/clients/drm_log.c   |  2 +-
 drivers/gpu/drm/drm_draw.c          | 29 +++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_draw_internal.h |  2 ++
 drivers/gpu/drm/drm_panic.c         |  2 +-
 4 files changed, 33 insertions(+), 2 deletions(-)
---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251003-drm_draw_conv_check-9cc3050ebd57

Best regards,
-- 
Francesco Valla <francesco@valla.it>

