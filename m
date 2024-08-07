Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A54494B128
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 22:21:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E63B10E5BD;
	Wed,  7 Aug 2024 20:21:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fjasle.eu header.i=@fjasle.eu header.b="Hgcni6Ox";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 970 seconds by postgrey-1.36 at gabe;
 Wed, 07 Aug 2024 15:26:14 UTC
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B0FF10E18A;
 Wed,  7 Aug 2024 15:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu; 
 s=ds202307;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8p+8xkYytY0kAtRIiarGiLqc+3CeFPeAk9BYp1+Be+o=; b=Hgcni6Ox2D8FDaPA4MfcZbKN6U
 9lLSq3Q7GUU3+GllOyhCeZHbJA0tL14j23d4QDpMTl4w/aXYprIt1HdcW/FwqeS04X0pozycGo8im
 ZG7XpFmgej1m1/Wx1k4TniZ4dzo4Zke7LDpuRIaTpB7yIjPjLjTnZHh5hvzoqvtxxNPxlV14qvR9h
 6JOTX9FjdEiSNbs9g4oD/BRv04kpaHEALD2ttmeHLVEVftdyLZ6JtwnavADmeYTL2jzkNEuhkuB7A
 aHsxYe0qWQ1MMw1F3+LCEHGCE8aeFHNlPAHElLODPwPnr9hrxMTSLQUbpM7aq1d8KhP01oubv1FeU
 03Wqun1A==;
Received: from [2001:9e8:9f8:5201:3235:adff:fed0:37e6] (port=36192
 helo=lindesnes.fjasle.eu)
 by smtp.domeneshop.no with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nicolas@fjasle.eu>) id 1sbiW1-009bha-HL;
 Wed, 07 Aug 2024 17:23:53 +0200
Date: Wed, 7 Aug 2024 17:23:27 +0200
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
 "Daniel Gomez (Samsung)" <d+samsung@kruces.com>, gost.dev@samsung.com
Subject: Re: [PATCH 02/12] kbuild: add header_install dependency to scripts
Message-ID: <20240807-witty-warm-hummingbird-20c9a7@lindesnes>
References: <20240807-macos-build-support-v1-0-4cd1ded85694@samsung.com>
 <20240807-macos-build-support-v1-2-4cd1ded85694@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240807-macos-build-support-v1-2-4cd1ded85694@samsung.com>
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

On Wed, Aug 07, 2024 at 01:09:16AM +0200, Daniel Gomez via B4 Relay wrote:
> From: Daniel Gomez <da.gomez@samsung.com>
> 
> Export kernel headers necessary for the tools located in scripts/. This
> ensures kernel headers are generated before building scripts/selinux.
> 
> Kernel headers required for building are: asm/types.h, asm/bitsperlong.h
> and asm/poix_types.h.
> 
> Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 44c02a6f60a1..7ac079955a94 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1173,7 +1173,7 @@ include/config/kernel.release: FORCE
>  # Carefully list dependencies so we do not try to build scripts twice
>  # in parallel
>  PHONY += scripts
> -scripts: scripts_basic scripts_dtc
> +scripts: headers_install scripts_basic scripts_dtc
>  	$(Q)$(MAKE) $(build)=$(@)

Since commit 59b2bd05f5f4 ("kbuild: add 'headers' target to build up
uapi headers in usr/include", 2019-06-04), composing the user-space
header tree is separated from the actual installation to
$(INSTALL_HDR_PATH)/include.  Thus, you do not want to depend in
'headers_install' but on 'headers' instead.

Nevertheless, I am suspecting that this leads to trouble.  E.g.: if
scripts/* include $(objtree)/usr/include/asm/*.h this will probably
break cross-arch-building.

Kind regards,
Nicolas
