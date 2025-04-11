Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC93EA8533D
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 07:41:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E67C10E221;
	Fri, 11 Apr 2025 05:41:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.b="SEJsE1vc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1382 seconds by postgrey-1.36 at gabe;
 Fri, 11 Apr 2025 05:41:17 UTC
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC5E510E221
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 05:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com; 
 s=formenos;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZEklUjidFtoZ8deAmHVTu5AXS7JqIfMBRiWA0f30O4w=; b=SEJsE1vcfLwUzViAOvFAa03FHq
 hKs8L2h5zIqqPxeOtapJSUfDV4xVQxLdGV8ObjLEpAg2SQ1wtZnR81UTflRwhygxJLC+CZ+WInIky
 zPFxN0hV3W1iVlN74szYpV2KswJ/rV/yvB124B3IcL8MKZDrbuL4wje7PmyyMMdpAC1hElC0sKPwH
 TdxAKqEflV1FCBOKb1z9MvJJsYRW6elY81+mfCSnGnLHKhnpWCPVV4Jb21LGNs949jM/gLMYWquy/
 hE9c4q+YWLmYZemAd1GNg1h2UvPlma0ybfbgZRwhgRN4AeSb1bYww6f9mSRQ2vRd5FnulN1P3rolD
 AwCpb9SA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
 id 1u36m2-00Ek2o-1T; Fri, 11 Apr 2025 13:17:55 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Fri, 11 Apr 2025 13:17:54 +0800
Date: Fri, 11 Apr 2025 13:17:54 +0800
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
 Ignat Korchagin <ignat@cloudflare.com>, keyrings@vger.kernel.org
Subject: Re: [PATCH v2 2/3] accel/amdpk: add driver for AMD PKI accelerator
Message-ID: <Z_imAnYu1hGRb8An@gondor.apana.org.au>
References: <20250409173033.2261755-1-nipun.gupta@amd.com>
 <20250409173033.2261755-2-nipun.gupta@amd.com>
 <20250410-sly-inventive-squirrel-ddecbc@shite>
 <bf851be7-74a5-8f9d-375b-b617691b6765@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf851be7-74a5-8f9d-375b-b617691b6765@amd.com>
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

On Fri, Apr 11, 2025 at 10:21:03AM +0530, Gupta, Nipun wrote:
>
> added crypto maintainers for comments.
> IMO, as accel framework is designed to support any type of compute
> accelerators, the PKI crypto accelerator in accel framework is not
> completely out of place here, as also suggested at:
> https://lore.kernel.org/all/2025031352-gyration-deceit-5563@gregkh/
> 
> Having the crypto accelerator as part of accel also enables to extract
> the most performance from the HW PKI engines, given that the queue
> assignment is handled per drm device open call.

There is actually a user-space interface for asymmetric crypto
through the keyring subsystem.  Adding the maintainers of those
in case they wish to comment on your driver.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
