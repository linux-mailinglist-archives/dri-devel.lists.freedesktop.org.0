Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D4023C830
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 10:51:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8223F89CDF;
	Wed,  5 Aug 2020 08:51:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65E7289CDF
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 08:51:43 +0000 (UTC)
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de
 [95.90.213.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C753B2177B;
 Wed,  5 Aug 2020 08:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596617502;
 bh=LyE45AVWKqfEkD5Y/SxUGOU4GlK7PbZB90u5+bHloss=;
 h=Date:From:To:Cc:Subject:From;
 b=rA4HzQ4mam/1K8FPc9e35+Q+g6Q1Cs+ZGPjEOCH6EW5rEnU6wKf05n/9epCNQ9Ory
 IPs7JHAgUHgTCK532AUZKXN62oNTyFfoICkDbkg05GMWWH6ydi+TjVZ+UpYZiwdMWU
 xKZXvalOyn82mKjETfujq+vvlC6U+kSlvGIhbxAE=
Date: Wed, 5 Aug 2020 10:51:37 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: dri-devel@lists.freedesktop.org, mani@kernel.org
Subject: DRM/KMS experimental drivers for HiKey 970
Message-ID: <20200805105137.2b272efc@coco.lan>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

I've been working to get upstream support for the DRM driver on HiKey 970.

While the patches are not ready yet for upstream merge, I'm placing
what I've sone so far on this repository:

	https://github.com/mchehab/linux/tree/hikey970/to_upstream-2.0-v1.1

The drivers there are a port from the Linaro's HiKey official Kernel:

	https://github.com/96boards-hikey/linux

The patches there preserve the old history. The porting patches
are applied after the original patches imported from that tree.

Besides the DRM driver, this repository contains:

- a PMIC/regulator driver; 
- an iommu driver (still requiring some changes at DT properties);
- A DMA driver;
- a small ugly hack reverting some PM changes at the WiFi driver,
  causing a regression on this board for HiKey 970.

My current plans are to start upstreaming those needed drivers.

The KMS/DRM driver there still need some changes. I guess it is
not ready for being upstreamed yet. Also, it depends on the
other drivers to work.

In particular, its support for DPMS is broken: if the monitor is
suspended, it won't return back to the right frequency settings.

Feel free to test it and send me patches fixing things there :-)

Thanks,
Mauro
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
