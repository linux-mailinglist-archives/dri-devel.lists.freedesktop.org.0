Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA12511BEC
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 17:37:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 801A910F5E8;
	Wed, 27 Apr 2022 15:37:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C427710F5E8
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 15:37:13 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 7E283C5C8C
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 15:26:11 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 37C5FFF809;
 Wed, 27 Apr 2022 15:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651073167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4wTZZPinydjcjv1I4AgdUoYpVwYx1Dn3FddOafhqD5Y=;
 b=QWGmZPBP5zuKML1STJVjCP2ZYTRb+zr+JLX8/DOlI80QVASlR5kcTXua9ARdiWCNbuE9I3
 cQmXalTI45lGAFEMWzjRYYsyW7hdlQjWsIBUo1kswZimYqjPKqzZ0rMD7sroV72KO7YbW5
 rCyBZXHGfb/M3BtmEkKtieUGVRFKuYreynNW4ZIIe9OhtftJltXMSKLZNoRsjUCSVn+tCn
 NdXB9P1MCMn9aGdjnC0o88sLQCDplCOtJW5HCA4g7DXtApkxVpUAsXovXBkxVDtJ499qwW
 HXoRBAmWPNcA+7uWJ2xXHOzq9D2BNhkOLlR25Ew4zTozG7UQ/W1xUX85BAOP6Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yang Yingliang <yangyingliang@huawei.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 3/3] mtd: rawnand: tmio: check return value after calling
 platform_get_resource()
Date: Wed, 27 Apr 2022 17:26:05 +0200
Message-Id: <20220427152605.100908-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220426084913.4021868-3-yangyingliang@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'9b2152f96f4a243bdfb89027c0d920aa0af810e7'
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

On Tue, 2022-04-26 at 08:49:13 UTC, Yang Yingliang wrote:
> It will cause null-ptr-deref if platform_get_resource() returns NULL,
> we need check the return value.
> 
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel
