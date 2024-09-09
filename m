Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 250D197145B
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 11:50:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B2AF10E342;
	Mon,  9 Sep 2024 09:50:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="CDmhO7aB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8141C10E342
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 09:50:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BC657E0009;
 Mon,  9 Sep 2024 09:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1725875403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+n6jIuUoupEYC9it7jynGsfYtTffkj9K1qGvau67Xdk=;
 b=CDmhO7aBGHlWdZiCpFPQW01csa4AVN722IUzlJyMVnxEH6+cWYz86FQ8OxAiz2420sGBW8
 n4mM+Xeiq3XWkr26A66LjKTVKEUcOwxxzuN8fGsnQz+MqezxXXmz8FbHupp2jM5wyNTII+
 3/91pxDCRwhqKtCdAH7UM0lrmRZqVlt6K8TzvIooik6D1oYcZ1zX5et1JOwT+nQJm6Sr0O
 ftBYMd31fOBewjDuxkkM8qGAf9Y06pe0J0ErzX7ejhx+ytUd7NOMW8PgcUl1M1pLMJnA/s
 PTf2WOuAATZlWj1jXZgZy4p/5p8WR6R3Z9x84E9Svbgp4FU5N3qoihxdVLR7wQ==
Date: Mon, 9 Sep 2024 11:50:01 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: x86@kernel.org, linux-crypto@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH RESEND v2 06/19] mtd: tests: Include <linux/prandom.h>
 instead of <linux/random.h>
Message-ID: <20240909115001.2b05a5ce@xps-13>
In-Reply-To: <20240909075641.258968-7-ubizjak@gmail.com>
References: <20240909075641.258968-1-ubizjak@gmail.com>
 <20240909075641.258968-7-ubizjak@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

Hi Uros,

ubizjak@gmail.com wrote on Mon,  9 Sep 2024 09:53:49 +0200:

> Substitute the inclusion of <linux/random.h> header with
> <linux/prandom.h> to allow the removal of legacy inclusion
> of <linux/prandom.h> from <linux/random.h>.

Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>

>=20
> Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>

Miqu=C3=A8l
