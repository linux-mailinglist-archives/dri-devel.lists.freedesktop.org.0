Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 478B198B179
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 02:37:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6257110E12A;
	Tue,  1 Oct 2024 00:37:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.b="Ziv2p46J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81B6310E002;
 Tue,  1 Oct 2024 00:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com; 
 s=formenos;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RhzDv+P0yHp7rVJxU5AwpoZg82v6v7rn8wwhs8V4CzU=; b=Ziv2p46JOi78oP1BjYuks6Yetm
 BYPTN68OFOVw1HnELeFXkbO+CispyjNFaIgie9zjIcPeToUwY1gXEvHij8YwFbkPrtpVP0VnXmmtw
 VnGzMvZEKtdrK0eJNwgWNhxjCkPGD4DVdnytageTWJ1xxr5W4MC1SjZD+FvLeh2n4A78cCfxtb6EI
 4ZKEewG8FMFGs0sQZAr6APUrd2ChcGqXi6si6ANRO7/NzuuSm7B+0uKIKQH+Z7x891CLgZedYi+Y8
 YalKRylc2TGiuiVfB4ROgOclg797c9AMK8bzg0PuYBF6v7QXrqncCDHwjpBxo11LKF60LkOBLSSlP
 Jt8FBu3A==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
 id 1svQj9-005w9M-38; Tue, 01 Oct 2024 08:37:10 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Tue, 01 Oct 2024 08:37:09 +0800
Date: Tue, 1 Oct 2024 08:37:09 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: x86@kernel.org, linux-crypto@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH v3 02/19] crypto: testmgr: Include <linux/prandom.h>
 instead of <linux/random.h>
Message-ID: <ZvtENQJvp8h1uvdU@gondor.apana.org.au>
References: <20240930123702.803617-1-ubizjak@gmail.com>
 <20240930123702.803617-3-ubizjak@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240930123702.803617-3-ubizjak@gmail.com>
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

On Mon, Sep 30, 2024 at 02:33:13PM +0200, Uros Bizjak wrote:
> Substitute the inclusion of <linux/random.h> header with
> <linux/prandom.h> to allow the removal of legacy inclusion
> of <linux/prandom.h> from <linux/random.h>.
> 
> Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
> Cc: Herbert Xu <herbert@gondor.apana.org.au>
> Cc: "David S. Miller" <davem@davemloft.net>
> ---
>  crypto/testmgr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Herbert Xu <herbert@gondor.apana.org.au>

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
