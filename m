Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC7B21373D
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 11:08:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C6AC6E16D;
	Fri,  3 Jul 2020 09:08:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDAAE6E16D
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 09:08:12 +0000 (UTC)
Date: Fri, 03 Jul 2020 09:08:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1593767290;
 bh=50Eb/Y0e53WKbt5ES2NNmH1DcrZiBdBBPSjrZRHLhw4=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=baOJ/PJAnC9mWvp2rRn7RZGSJ7x8stNUldq45n/lekJ3Xk2iJQMjhL7/3qSoXC1j+
 kO2G4Oamcvt5hEAE4qISxXVg2Hf788uP13ilRKuw4Q7jwcWvGZRqgEzr+6fT7pZA9Y
 tKJPDix3+HTUSS/rw0rMr89vVzymMQ3GrF3MgCsU=
To: Neil Armstrong <narmstrong@baylibre.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v9 1/6] drm/fourcc: Add modifier definitions for
 describing Amlogic Video Framebuffer Compression
Message-ID: <RRm1buCbVQy5uesUHZhz8cPiCZfllmj0r1HzM7OoBmJBNMo9tuRfs3ju0iFnlPfDqECFq0tVj10h7bboBat7i619uNUN06HbwswBvYaPWMM=@emersion.fr>
In-Reply-To: <20200703080728.25207-2-narmstrong@baylibre.com>
References: <20200703080728.25207-1-narmstrong@baylibre.com>
 <20200703080728.25207-2-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: "jianxin.pan@amlogic.com" <jianxin.pan@amlogic.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Kevin Hilman <khilman@baylibre.com>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks for the update!

The driver should also disallow importing a AMLOGIC_FBC_LAYOUT_SCATTER
DMA-BUF from another device, but I guess this is clear enough ("not
transferrable between Amlogic SoCs").

From a user-space PoV:

Acked-by: Simon Ser <contact@emersion.fr>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
