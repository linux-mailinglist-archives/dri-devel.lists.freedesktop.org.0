Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CBCA946D0
	for <lists+dri-devel@lfdr.de>; Sun, 20 Apr 2025 08:39:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 006F710E002;
	Sun, 20 Apr 2025 06:39:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.b="SfuMBaqC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from abb.hmeau.com (unknown [144.6.53.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 060EF10E002
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Apr 2025 06:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com; 
 s=formenos;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8yBRXEpl/zJ2DC6+BgwWilj/xw5IQ+a0xstsD+P+cM0=; b=SfuMBaqCsK502ZPFFK7FlC6u7N
 9lKYLN7KvkrCS54daxBdS6M20Lk0jdHWpT2aYdDZFoAJ22FipPZCbbJq22aca4QORUBCpn5L5BD8b
 7U70QCi3ZnWit1QzA+SKI9Zgof0Wza9Jl+8CjCwvBk794kVM7FBiJJmYWBWr/1+fjCoQXW0rpwkIy
 NCAlpJYacjC+W/wOBefRSNw84iUsETtUKT5ZLQUukNLpI8BfqAZvl6uyBkofvWTIFZxJ25JhMEwcO
 P3aI5xtOGGzQPuOc0xAMDJnmI/H0ForWRdtO5y7RcdYLbPARZr1WDlieT0Z+0Vwig2yulJSvW8TdD
 hTSfO6Mg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
 id 1u6OKa-00H6Gs-0J; Sun, 20 Apr 2025 14:39:09 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Sun, 20 Apr 2025 14:39:08 +0800
Date: Sun, 20 Apr 2025 14:39:08 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: "Gupta, Nipun" <nipun.gupta@amd.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, davem@davemloft.net,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, krzk+dt@kernel.org,
 gregkh@linuxfoundation.org, robh@kernel.org, conor+dt@kernel.org,
 ogabbay@kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, derek.kiernan@amd.com, dragan.cvetic@amd.com,
 arnd@arndb.de, praveen.jain@amd.com, harpreet.anand@amd.com,
 nikhil.agarwal@amd.com, srivatsa@csail.mit.edu, code@tyhicks.com,
 ptsm@linux.microsoft.com, linux-crypto@vger.kernel.org,
 David Howells <dhowells@redhat.com>, Lukas Wunner <lukas@wunner.de>,
 Ignat Korchagin <ignat@cloudflare.com>, keyrings@vger.kernel.org,
 Stephan =?iso-8859-1?Q?M=FCller?= <smueller@chronox.de>
Subject: Re: [PATCH v2 2/3] accel/amdpk: add driver for AMD PKI accelerator
Message-ID: <aASWjGNpn1QZYgZb@gondor.apana.org.au>
References: <20250409173033.2261755-1-nipun.gupta@amd.com>
 <20250409173033.2261755-2-nipun.gupta@amd.com>
 <20250410-sly-inventive-squirrel-ddecbc@shite>
 <bf851be7-74a5-8f9d-375b-b617691b6765@amd.com>
 <Z_imAnYu1hGRb8An@gondor.apana.org.au>
 <4f365fae-aae2-a0df-e8e9-268b536378b1@amd.com>
 <Z_nAo7UpzBqeXLbA@gondor.apana.org.au>
 <5f49d271-fdf3-3b52-664a-3f576bc3c61e@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f49d271-fdf3-3b52-664a-3f576bc3c61e@amd.com>
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

On Thu, Apr 17, 2025 at 09:02:15PM +0530, Gupta, Nipun wrote:
>
> Thanks for pointing out to the C file, but as these these system calls can
> support only synchronous operations, precludes their use for asynchronous
> operations. In the TLS handshakes, where multiple connections occur
> simultaneously, asynchronous operations are beneficial. OpenSSL ASYNC
> support can very well utilizes the asynchronous operations while
> establishing multiple TLS connections.

In that case we should extend af_alg to support akcipher algorithms.

Having every crypto driver make up its own user-space PKI interface
is not scalable.

I held back on adding akcipher to af_alg because it would lead to
the freezing of our akcipher API.  But it's time to do this.

Being the first user of such an interface, could you please post
your OpenSSL patches as well so that we can look at what's actually
needed?

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
