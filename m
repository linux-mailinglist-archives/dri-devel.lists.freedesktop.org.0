Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7289761A2
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 08:39:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7410410E1B1;
	Thu, 12 Sep 2024 06:39:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.b="Dut6C6Eb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1991 seconds by postgrey-1.36 at gabe;
 Thu, 12 Sep 2024 06:39:40 UTC
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B32510E1B1;
 Thu, 12 Sep 2024 06:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com; 
 s=formenos;
 h=In-Reply-To:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3xlRzXI9yb+oNIsqCP0Wa4u5a4LZve9QqMy4C7Th5mc=; b=Dut6C6EbXHKl46S1QMOW38R/r8
 3ekj8fbSVpa3M/4/NfVU0/L2n4YksdJhPe6RCzswqcuWg3XU0BC0sZSZebL3LtKud0noRiobvGk3s
 s/vCZiFAoEpUs3s3m9eG2GLI2hq9hOkVu+/Pyiz7KuUe6mkob8ueP+ie3hXBRJSLcpskkGSmRSJDN
 qrau35IL7NHMtOaOM/vu6KRhLjNPt0bgnC3Zh6h5EfMCiahs5z3wgoDQcFxfm3fN4JbbCQ9+0fccb
 D2WcU7+AMLG+HPRlw3XBvisLeOAhLALpq8oK72eukqxOqnZIqQZ9rgtSG88tBc821hJ2S4hROU7Jq
 VRGE9A6w==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
 id 1socoG-001u5Y-2v; Thu, 12 Sep 2024 14:06:19 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Thu, 12 Sep 2024 14:06:18 +0800
Date: Thu, 12 Sep 2024 14:06:18 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: x86@kernel.org, linux-crypto@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org,
 ubizjak@gmail.com, davem@davemloft.net
Subject: Re: [PATCH RESEND v2 02/19] crypto: testmgr: Include
 <linux/prandom.h> instead of <linux/random.h>
Message-ID: <ZuKE2sffS3wddU3-@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240909075641.258968-3-ubizjak@gmail.com>
X-Newsgroups: apana.lists.os.linux.cryptoapi, apana.lists.os.linux.kernel,
 apana.lists.os.linux.scsi
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

Uros Bizjak <ubizjak@gmail.com> wrote:
> Substitute the inclusion of <linux/random.h> header with
> <linux/prandom.h> to allow the removal of legacy inclusion
> of <linux/prandom.h> from <linux/random.h>.
> 
> Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
> Cc: Herbert Xu <herbert@gondor.apana.org.au>
> Cc: "David S. Miller" <davem@davemloft.net>
> ---
> crypto/testmgr.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Herbert Xu <herbert@gondor.apana.org.au>
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
