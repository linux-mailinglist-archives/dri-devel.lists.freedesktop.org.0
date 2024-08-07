Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EF794B12F
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 22:22:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 260FF10E5CA;
	Wed,  7 Aug 2024 20:22:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fjasle.eu header.i=@fjasle.eu header.b="VoD7yIAF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A44B10E57B;
 Wed,  7 Aug 2024 15:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu; 
 s=ds202307;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gTBEyTDuyGP0OwM2Ld19qm72seDeAonZbOXn4FPGBmg=; b=VoD7yIAF6OddXxsFn+ETucVMrt
 yoQoZo3iAK4Ih3BVYRNmEkN/d0yY1Yf+7yuBwFJh8sCS/byabUEpstH6LD4XxaJe6XRM+7Heizz27
 BgrVIrYLfcsPVV58Lv9H/Zej2YP7ff6lP/MmM/VMOw1QfWJ0LUTxbXdb7m7a8gCzfU6rNuRV7rDrb
 rqFoljkaPwUr8ZC9zHRYgHXTbfnld33EoA0p9Mehk9hbdRizvTYv7POkmihfqHUvni12N2Wr20yIm
 bes95SD99UmlPITXumWSnNpCiiDx3MCTWqY9+EdJY5UFfG8smsRx82sZpwcdH8z51MGHUdd/MuMdj
 c5ye7pYw==;
Received: from [2001:9e8:9f8:5201:3235:adff:fed0:37e6] (port=35732
 helo=lindesnes.fjasle.eu)
 by smtp.domeneshop.no with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nicolas@fjasle.eu>) id 1sbiGJ-009XOB-UK;
 Wed, 07 Aug 2024 17:07:40 +0200
Date: Wed, 7 Aug 2024 17:07:16 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: da.gomez@samsung.com
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 William Hubbs <w.d.hubbs@gmail.com>,
 Chris Brannon <chris@the-brannons.com>, Kirk Reiser <kirk@reisers.ca>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Paul Moore <paul@paul-moore.com>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Ondrej Mosnacek <omosnace@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, speakup@linux-speakup.org,
 selinux@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, linux-serial@vger.kernel.org,
 llvm@lists.linux.dev, Finn Behrens <me@kloenk.dev>,
 "Daniel Gomez (Samsung)" <d+samsung@kruces.com>,
 gost.dev@samsung.com, Nick Desaulniers <nick.desaulniers@gmail.com>
Subject: Re: [PATCH 01/12] scripts: subarch.include: fix SUBARCH on MacOS hosts
Message-ID: <20240807-mighty-crazy-dove-3dc8a5@lindesnes>
References: <20240807-macos-build-support-v1-0-4cd1ded85694@samsung.com>
 <20240807-macos-build-support-v1-1-4cd1ded85694@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240807-macos-build-support-v1-1-4cd1ded85694@samsung.com>
X-Mailman-Approved-At: Wed, 07 Aug 2024 20:21:51 +0000
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

On Wed, Aug 07, 2024 at 01:09:15AM +0200, Daniel Gomez via B4 Relay wrote:
> From: Nick Desaulniers <nick.desaulniers@gmail.com>
> 
> When building the Linux kernel on an aarch64 MacOS based host, if we don't
> specify a value for ARCH when invoking make, we default to arm and thus
> multi_v7_defconfig rather than the expected arm64 and arm64's defconfig.
> 
> This is because subarch.include invokes `uname -m` which on MacOS hosts
> evaluates to `arm64` but on Linux hosts evaluates to `aarch64`,
> 
> This allows us to build ARCH=arm64 natively on MacOS (as in ARCH need
> not be specified on an aarch64-based system).
> 
> Utilize a negative lookahead regular expression to avoid matching arm64.
> 
> Add a separate expression to support for armv.* as per error reported by
> Nicolas Schier [1].
> 
> [1] https://lore.kernel.org/all/Y3MRvtwdjIwMHvRo@bergen.fjasle.eu/#t
> 
> Signed-off-by: Nick Desaulniers <nick.desaulniers@gmail.com>
> Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
> ---
>  scripts/subarch.include | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/subarch.include b/scripts/subarch.include
> index 4bd327d0ae42..5d84ad8c0dee 100644
> --- a/scripts/subarch.include
> +++ b/scripts/subarch.include
> @@ -6,7 +6,8 @@
>  
>  SUBARCH := $(shell uname -m | sed -e s/i.86/x86/ -e s/x86_64/x86/ \
>  				  -e s/sun4u/sparc64/ \
> -				  -e s/arm.*/arm/ -e s/sa110/arm/ \
> +				  -e s/armv.*/arm/ \
> +				  -e s/arm\(?:\(?!64\).*\)/arm/ -e s/sa110/arm/ \
>  				  -e s/s390x/s390/ \
>  				  -e s/ppc.*/powerpc/ -e s/mips.*/mips/ \
>  				  -e s/sh[234].*/sh/ -e s/aarch64.*/arm64/ \
> 

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>
