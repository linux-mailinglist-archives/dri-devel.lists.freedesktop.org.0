Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3401D8671A4
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 11:43:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D70210F043;
	Mon, 26 Feb 2024 10:43:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="W0KmmBG5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C07E10F030
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 10:43:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EDC16FF824;
 Mon, 26 Feb 2024 10:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1708944196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=21jxhojpGuLyAIprsmsZyKfJVscT4QidpkL5l1YrKGk=;
 b=W0KmmBG5feEiVPtqgBp5uHiLTZEoe5HmuoblznMIabvdxsixyTRNUXFKaD5PvQkoZGGuPO
 JqJ9/2E3PvyCq0Qx4bSdWOCQ9tbJibgvAdirLuvt80zOGIZixx5xDjkFDDF4UUTHvsgUxA
 FUemVTgay0icE9nMnMasLZ4Uc5d1He/RbThLQf7XMx2Mc9K3r1Z8VW9Zs21y+eY2g/Oftq
 VHPUZ7RtooOvjAvgVJDDuxXfFO5DM8xnT85haWDtIeE9c7VzaqSKFJPTmkyHD37NU9sxy7
 E74XPFs8o4e7KlJ5RLG9Z74EimKbgHihWLE+FXA/GbuvjYHBkZwjSwq6ISPFgg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 linux-fbdev@vger.kernel.org, linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Lee Jones <lee@kernel.org>, Andy Lowe <alowe@mvista.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Alan Hourihane <alanh@fairlite.co.uk>
Subject: Re: [PATCH 2/2] mtd: Remove support for Carillo Ranch driver
Date: Mon, 26 Feb 2024 11:43:12 +0100
Message-Id: <20240226104312.488935-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231208224703.1603264-2-willy@infradead.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'77bf032528393d2dc9430b3cea1fee8d0762a86f'
Content-Transfer-Encoding: 8bit
X-GND-Sasl: miquel.raynal@bootlin.com
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

On Fri, 2023-12-08 at 22:47:03 UTC, "Matthew Wilcox (Oracle)" wrote:
> As far as anybody can tell, this product never shipped.  If it did,
> it shipped in 2007 and nobody has access to one any more.  Remove the
> mtd NOR driver.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel
