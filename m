Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47684511BED
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 17:37:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C272610F5F0;
	Wed, 27 Apr 2022 15:37:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBBAD10F5EE
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 15:37:13 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::229])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 99E16C67A7
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 15:26:15 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F123CFF80D;
 Wed, 27 Apr 2022 15:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651073172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Br/ARAuWyrQx0Shx7ZTt5B5h8e1yAa6aF5x9EgWTdME=;
 b=QQtCHEe5N6e5yUN1VTPJzMTqqdHJQQf+73x4CU8CcONwnoXr6CGlp97ziX651mDXYxSbCt
 L7Gu1xPdv2cHqNTce8fyRFw5czCFRjwEf8mh3wQsuV3+4DAdIENoypbh4/s+pnaXF0tcFV
 MQp1oNZvEc6DyhS9PdONu+jEqh2c88I2c0TNvtXgFEv8sFmjs9jTIP4a826e82Mgjfe8X8
 mldHbFgqSz7wi4+4Zknoz9dq0FPUqIkv+1RIySJsSTt+1vm+0Jg8SQpwLTFTdZkHZHrolN
 4EvorbSC0GizDRVttS97TTUEQy/yZYUe9OoPcJhYfa21aT0H/11TmDOjY8xZfA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yang Yingliang <yangyingliang@huawei.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 2/3] mtd: rawnand: intel: fix possible null-ptr-deref in
 ebu_nand_probe()
Date: Wed, 27 Apr 2022 17:26:10 +0200
Message-Id: <20220427152610.100972-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220426084913.4021868-2-yangyingliang@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'ddf66aefd685fd46500b9917333e1b1e118276dc'
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

On Tue, 2022-04-26 at 08:49:12 UTC, Yang Yingliang wrote:
> It will cause null-ptr-deref when using 'res', if platform_get_resource()
> returns NULL, so move using 'res' after devm_ioremap_resource() that
> will check it to avoid null-ptr-deref.
> 
> Fixes: 0b1039f016e8 ("mtd: rawnand: Add NAND controller support on Intel LGM SoC")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel
