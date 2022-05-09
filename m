Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B9F520E0E
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 08:48:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49C9410E336;
	Tue, 10 May 2022 06:48:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 462 seconds by postgrey-1.36 at gabe;
 Mon, 09 May 2022 14:10:08 UTC
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org
 [IPv6:2001:67c:2050:0:465::201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC6F010EC9A
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 14:10:08 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4KxjXd4Q4kz9sSm;
 Mon,  9 May 2022 16:02:09 +0200 (CEST)
From: public@timruffing.de
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v2] Revert "fbdev: Make fb_release() return -ENODEV if
 fbdev was unregistered"
Date: Mon,  9 May 2022 16:01:49 +0200
Message-Id: <20220509140149.34734-1-public@timruffing.de>
In-Reply-To: <642f515e-aa71-7c90-a715-e49dcf12baee@redhat.com>
References: <642f515e-aa71-7c90-a715-e49dcf12baee@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 10 May 2022 06:48:43 +0000
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <maxime@cerno.tech>, public@timruffing.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks for this patch. Do you think this can be backported to LTS 5.17.y and
5.15.y, which are still buggy? It's not a big deal for me but others might
profit.

Background:
The patch solves a regression from 5.17.1 to 5.17.2 or 5.15.32 and
5.15.33 I was about to report. On my Thinkpad T570, I got random "BUG", "Oops"
or even panics when during booting with efifb and plymouthd (and then sometimes
also problems when shutting down because). I had bisected the issue to commit
27599aacbaef. I could provide more info but I don't think it's necessary given
that either aafa025c76dcc7d1a8c8f0bdefcbe4eb480b2f6a or your better patch now
fixes the issue (I tested both, both work for me).

Best,
Tim Ruffing

