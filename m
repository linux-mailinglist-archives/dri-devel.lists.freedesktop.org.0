Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAsPCbkFomkGyQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 21:59:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D03E71BE04E
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 21:59:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38A7D10EC3E;
	Fri, 27 Feb 2026 20:59:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OFMMGcxw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2061E10EC3E
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 20:59:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0B82E41B27;
 Fri, 27 Feb 2026 20:59:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79A23C116C6;
 Fri, 27 Feb 2026 20:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772225971;
 bh=CgVe0XTTYoyB3y5Oww3RwtITptG6dm/3IIyqAgbIS3M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OFMMGcxw5F+MnIsdB2mQgIvIT+jkcY5GRr66lohSmHM0hxJZ8GuIZ+fO4vebdbWp1
 FWoWTy9AY8c2IeDV5WYOmD3+Dp3pY4453vFUdD+QpqBh0sHqyhf2VLKDYpvX3sq7AW
 PLqUHduuOeBlme7QchtAAfSd0xA1odF42cNY/SpCjoo6i5aOVAk8fq9dvsYBfaCgb9
 jOLl/ui5mP4XfOyfz4nlbiyQBr1pMhKpNYw1RUX3Zblp3+bWIWcrIc9juVYkyGo3TI
 NNNxoTqI3jN12diMrUq5KLRSD/wqCQvkRh+lUPcPNB7YY4IIgfY14W98jC4rD+06Re
 FwJ3ExuVpM7HQ==
Date: Fri, 27 Feb 2026 21:59:27 +0100
From: Helge Deller <deller@kernel.org>
To: Pavel Nikulin <pavel@noa-labs.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] Fonts: Adding all Terminus fronts from 12 to 32 in
 bold, and normal versions
Message-ID: <aaIFr-GKG1qiJYwg@p100>
References: <20260226073404.13511-1-pavel@noa-labs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226073404.13511-1-pavel@noa-labs.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:pavel@noa-labs.com,m:linux-fbdev@vger.kernel.org,m:deller@gmx.de,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[deller@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deller@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmx.de,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: D03E71BE04E
X-Rspamd-Action: no action

Hi Pavel,

please include the graphics mailing lists (fbdev, dri-devel).

* Pavel Nikulin <pavel@noa-labs.com>:
> This patch adds an option to compile-in all terminus fonts, and removed the old bold only terminus version
> 
> These fonts were converted from Terminus psf files with the help of psftools and a script.
> 
> This patch is non-intrusive, no options are enabled by default so most users won't notice a thing.

Sure, but you add a whole lot of fonts.
Why are both bold and non-bold fonts needed?
Why do we need all in-kernel?
They may be loaded after bootup via userspace too.

What does other people think?

Helge

 
> I am placing my changes under the GPL 2.0 just as source Terminus font.
> 
> Signed-off-by: Pavel Nikulin <pavel@noa-labs.com>
> ---
>  V4 -> V5: Added changed font.h to the patch
> 
>  include/linux/font.h       |   42 +-
>  lib/fonts/Kconfig          |  142 +-
>  lib/fonts/Makefile         |   15 +
>  lib/fonts/font_ter10x18.c  | 6412 ++++++++----------------------------
>  lib/fonts/font_ter10x18b.c | 1305 ++++++++
>  lib/fonts/font_ter10x20.c  | 1305 ++++++++
>  lib/fonts/font_ter10x20b.c | 1305 ++++++++
>  lib/fonts/font_ter11x22.c  | 1561 +++++++++
>  lib/fonts/font_ter11x22b.c | 1561 +++++++++
>  lib/fonts/font_ter12x24.c  | 1561 +++++++++
>  lib/fonts/font_ter12x24b.c | 1561 +++++++++
>  lib/fonts/font_ter14x28.c  | 1817 ++++++++++
>  lib/fonts/font_ter14x28b.c | 1817 ++++++++++
>  lib/fonts/font_ter16x32.c  | 4107 +++++++++++------------
>  lib/fonts/font_ter16x32b.c | 2073 ++++++++++++
>  lib/fonts/font_ter6x12.c   |  537 +++
>  lib/fonts/font_ter8x14.c   |  537 +++
>  lib/fonts/font_ter8x14b.c  |  537 +++
>  lib/fonts/font_ter8x16.c   |  537 +++
>  lib/fonts/font_ter8x16b.c  |  537 +++
>  lib/fonts/fonts.c          |   45 +
>  21 files changed, 22124 insertions(+), 7190 deletions(-)
>  create mode 100644 lib/fonts/font_ter10x18b.c
>  create mode 100644 lib/fonts/font_ter10x20.c
>  create mode 100644 lib/fonts/font_ter10x20b.c
>  create mode 100644 lib/fonts/font_ter11x22.c
>  create mode 100644 lib/fonts/font_ter11x22b.c
>  create mode 100644 lib/fonts/font_ter12x24.c
>  create mode 100644 lib/fonts/font_ter12x24b.c
>  create mode 100644 lib/fonts/font_ter14x28.c
>  create mode 100644 lib/fonts/font_ter14x28b.c
>  create mode 100644 lib/fonts/font_ter16x32b.c
>  create mode 100644 lib/fonts/font_ter6x12.c
>  create mode 100644 lib/fonts/font_ter8x14.c
>  create mode 100644 lib/fonts/font_ter8x14b.c
>  create mode 100644 lib/fonts/font_ter8x16.c
>  create mode 100644 lib/fonts/font_ter8x16b.c
