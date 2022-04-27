Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E40511BEE
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 17:37:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D120F10F5F7;
	Wed, 27 Apr 2022 15:37:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A12DA10F5E8
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 15:37:14 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (unknown [217.70.183.201])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 9FADCC793D
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 15:26:22 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E26F11BF203;
 Wed, 27 Apr 2022 15:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651073177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k9Rf97iebmoDfy15ErOJ4xhdjVjGSFyAVnacL6ziYLY=;
 b=lM9P1GbmTn5Xmb4Sf0bbbpTN1qlRPeRwz35/sn0FJwJcJ9w7esHk+i1kmH5FS9FHy558/i
 FtxYLtpZajg1fHuoWPcjagHEd0AFvm1UOYBU2huxi5Q9Lq5VWPRPdPEn2YsjMbTNe7m3tc
 OP0RTxf8c5UyQwPIJDX/XZRcMueXtAqbioj0Usm4rBK95YorjDdRfNIICmywZ+XqLkkF8W
 FWUJgAY2jvjDqwGnuFKVe2PI9jYWaicTs8AM2aTwt5km5avNMVxtwqcD1jBaFTANmpmhWr
 sZo+wrhVB06/T7GRw1QNPj1hn4itFS1Acmy+tFmXnJTjyhIntt6QWD9w7I/xIg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yang Yingliang <yangyingliang@huawei.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 1/3] mtd: rawnand: cadence: fix possible null-ptr-deref in
 cadence_nand_dt_probe()
Date: Wed, 27 Apr 2022 17:26:15 +0200
Message-Id: <20220427152615.101037-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220426084913.4021868-1-yangyingliang@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'a28ed09dafee20da51eb26452950839633afd824'
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
Cc: richard@nod.at, Miquel Raynal <miquel.raynal@bootlin.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2022-04-26 at 08:49:11 UTC, Yang Yingliang wrote:
> It will cause null-ptr-deref when using 'res', if platform_get_resource()
> returns NULL, so move using 'res' after devm_ioremap_resource() that
> will check it to avoid null-ptr-deref.
> And use devm_platform_get_and_ioremap_resource() to simplify code.
> 
> Fixes: ec4ba01e894d ("mtd: rawnand: Add new Cadence NAND driver to MTD subsystem")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel
