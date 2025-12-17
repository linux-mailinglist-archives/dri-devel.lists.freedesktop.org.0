Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF15CC6BC9
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 10:13:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 647AE10E226;
	Wed, 17 Dec 2025 09:13:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="mk1+vKgE";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=valla.it header.i=@valla.it header.b="gZ6v+B3I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from delivery.antispam.mailspamprotection.com
 (delivery.antispam.mailspamprotection.com [185.56.87.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 392B810E226
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 09:12:59 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256;
 d=outgoing.instance-europe-west4-dw55.prod.antispam.mailspamprotection.com;
 s=arckey; t=1765962779; 
 b=TkeShvh7XwEQue9E7cb7W6O9hgKbSQZiYFl9z8RsyeKswYIlDh8nEZjzBXbw9j+i+ovBD1mVme
 Lq8ePaD077cZYJPUgvPTCGHIaceo7kt8cZe9+XnyU1bjKxgbk8Efa+76NFjpP0DqHQY1WDifr7
 QpTY+8a9vRA52JItxZWrI5H0oQiE0dOO40azJgVdTHrmINf0g0rBtdLf1NQrdgnQCn6iR6EjMi
 IfJjzuMN7i3f7LHjPtUhtQznoUCLDBWNyDTjuM5f5rElg18kb/glSztMJLkFeCU6Q3hadsCjKK
 GEAue3mA8lmO2ix1mUDeXVsG2WdzBHAVqTNGsaCAOqMgrw==;
ARC-Authentication-Results: i=1;
 outgoing.instance-europe-west4-dw55.prod.antispam.mailspamprotection.com;
 smtp.remote-ip=35.214.173.214; 
 iprev=pass (214.173.214.35.bc.googleusercontent.com)
 smtp.remote-ip=35.214.173.214; 
 auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
 dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
 arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed;
 d=outgoing.instance-europe-west4-dw55.prod.antispam.mailspamprotection.com;
 s=arckey; t=1765962779; 
 bh=RLHVmL+AkjHiZPjhRnlzFFYIAm6PoQJ2uSGv+KlV8j4=;
 h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 Subject:From:DKIM-Signature:DKIM-Signature;
 b=C6tYArUmofrpKKCKBxjbj/5tQ3Yo2PdrfHtt8MeR9XYkIQgc4JkYeNIVwCByjtpbcPDyHhom1R
 N56nrKwTIk7iiaW8BoNJiHBfFZaUqEv0o2/Ov1KGWrpBOP/vf5Dsp0csiJ+fuaYtjg/TVDa32a
 b+TNk3IWectRJ7JyxmXe4AMFX+QHm1v5rMMHo/ymtZvx1TTaMjsr7tgOUSQYyPwsYKGKdLAKSL
 n4S9EPwMf2IRuVXyoOp0G6qStq8hc7u1COYLP3uiGQHSwjDoiIUnq680PfCxX1hNOi6XNkViMb
 wQUFxpmKqZSxQe/X/8X/GxI2DV/QMnKk9PjJtsZpURaRjw==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
 :Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:
 Subject:From:Reply-To:List-Unsubscribe;
 bh=kwfCrB1sYS5CS5f25/7ftLqKFwSCyzuSjhBagMuYb7o=; b=mk1+vKgE7hK/KnggVR6dY5LQHh
 A6o9VTR49ZPEBjmWH0fwwFjkjd35ktDs7yIb0rdpSffpCxX71etW014gM1wJOUNGCHpTbe7Tjm50L
 3mXrJsX0VVMOY4z1l8BacGY9FtYiC4V5Zfeo6YKQ1G7ZboG0+HpjmZ/+pObx+gGYZBOQ=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214]
 helo=esm19.siteground.biz)
 by instance-europe-west4-dw55.prod.antispam.mailspamprotection.com with
 esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384 (Exim 4.98.1)
 (envelope-from <francesco@valla.it>) id 1vVma6-00000001rnW-3HvF
 for dri-devel@lists.freedesktop.org; Wed, 17 Dec 2025 08:08:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
 s=default; h=Cc:To:Date:Subject:From:list-help:list-unsubscribe:
 list-subscribe:list-post:list-owner:list-archive;
 bh=kwfCrB1sYS5CS5f25/7ftLqKFwSCyzuSjhBagMuYb7o=; b=gZ6v+B3IexNIUeooL/0LSGXjnc
 QoRRGYTSgM6F4vYpOj6kri81hyHJtxZhnk2bRcI7diOQLnC+bqxeHFoFXWpC0SXYUvMfrzj99qrf2
 pz//m1r1bnNNRIbuaQWmB7sXN92J9C0mccQ1HE4SfMDv9FUBMUVuJum7r2AS7bxwYSJA=;
Received: from [79.34.194.176] (port=63558 helo=[192.168.178.175])
 by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.98.1) (envelope-from <francesco@valla.it>)
 id 1vVmZy-00000000ENx-21ZH; Wed, 17 Dec 2025 08:08:14 +0000
From: Francesco Valla <francesco@valla.it>
Subject: [PATCH v3 0/3] drm/draw: add check API to avoid spurious WARN
Date: Wed, 17 Dec 2025 09:06:53 +0100
Message-Id: <20251217-drm_draw_conv_check-v3-0-15b6f8bc1cbc@valla.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23NTQrCMBCG4auUrI1MkqZaV95DpORnYoPaSlKiU
 np304LQRZfvB/PMSCIGj5GcipEETD76vsshdgUxrepuSL3NTThwyQAEteHZ2KDejem71JgWzZ3
 WxgiQgNrKA8mXr4DOfxb1cs3d+jj04bs8SWxe/57c9BKjkNEjK20tKu6qc1KPh9r7gcxc4iuCl
 dsEzwRIjU6ghsrpFTFN0w+uSePl+AAAAA==
X-Change-ID: 20251003-drm_draw_conv_check-9cc3050ebd57
To: Jocelyn Falempe <jfalempe@redhat.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2257; i=francesco@valla.it;
 h=from:subject:message-id; bh=RLHVmL+AkjHiZPjhRnlzFFYIAm6PoQJ2uSGv+KlV8j4=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDJlOKVc3nLZOXBQvLrvlfPKswFPWrbuid/RXiBc8YzVdq
 +T0mutERykLgxgXg6yYIkvIuhv39sw1/5a2gfERzBxWJpAhDFycAjARk6WMDLNuKW+bueJo5+SL
 c8sqHFeVFhfyu9+VvrnlTZPjobKFsnsZ/mk1vVTd+FRjexojQ6F5QfTG9PrnHYoPdVOyD2yU9b5
 bywkA
X-Developer-Key: i=francesco@valla.it; a=openpgp;
 fpr=CC70CBC9AA13257C6CCED8669601767CA07CA0EA
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: f094f79a5f644660dba8cd40a825a76b
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1vVma6-00000001rnW-3HvF-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-dw55.prod.antispam.mailspamprotection.com; 
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
Changes in v3:
- Collected R-b tags from Jocelyn (thank you!) 
- Link to v2: https://lore.kernel.org/r/20251014-drm_draw_conv_check-v2-0-05bef3eb06fb@valla.it

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
base-commit: ea1013c1539270e372fc99854bc6e4d94eaeff66
change-id: 20251003-drm_draw_conv_check-9cc3050ebd57

Best regards,
-- 
Francesco Valla <francesco@valla.it>

