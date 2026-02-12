Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2C4bFfVRjmmMBgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 23:19:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D83901317CB
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 23:19:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2ABC10E193;
	Thu, 12 Feb 2026 22:19:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kemnade.info header.i=@kemnade.info header.b="fTrjlnTJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E09410E193
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 22:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=zn6U+s6nKrFVxchAXEA+zzkVNw+Uwh9myW4j41Chco0=; b=fTrjlnTJbHR9mHHDsRFLB1u5MS
 cHDu4x/pQ+9UvqI4onwLN2MEDiON8bVlXS6XkeGD2THz78GAj4g+vKPCdoI32aoadakAuuTnFhke5
 CuSVIXeC+YMGyIjoz2HC1ecnUGbDbLidWr1hWIRCkal4Ij+WhBSqNzchuNgl4mOtjFMCrV2epS34v
 6BavwZGcv0uIZOhF9byHr4hv9kGD6OsRjs4+yYmmsUmI+tEzvsHnZjyZBy8Htr/3W8ST8vF6S4loG
 md/G94cs5SHN0bhZGBfv0TbpglBVy8Sd6/i+gKxf9hMRcXs2iVCWGdDK/BvcDEIvaZBX+5NPnZZ32
 BFZNo3kQ==;
Date: Thu, 12 Feb 2026 23:19:07 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: "Kory Maincent (TI)" <kory.maincent@bootlin.com>, Aaro Koskinen
 <aaro.koskinen@iki.fi>, Kevin Hilman <khilman@baylibre.com>, Roger Quadros
 <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, Bajjuri Praneeth <praneeth@ti.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Louis
 Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH 1/5] ARM: dts: ti: Enable overlays for all DTB files
Message-ID: <20260212231907.6120a2e2@kemnade.info>
In-Reply-To: <719BF710-26DF-49AB-A016-D2306F0389E2@goldelico.com>
References: <20260212-feature_bbge-v1-0-29014a212f35@bootlin.com>
 <20260212-feature_bbge-v1-1-29014a212f35@bootlin.com>
 <B3366A17-641F-4E02-A5D4-978F525E0A96@goldelico.com>
 <20260212174718.7daccb70@kemnade.info>
 <719BF710-26DF-49AB-A016-D2306F0389E2@goldelico.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
X-Spamd-Result: default: False [1.99 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[kemnade.info:s=20220719];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[kemnade.info : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[andreas@kemnade.info,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:hns@goldelico.com,m:kory.maincent@bootlin.com,m:aaro.koskinen@iki.fi,m:khilman@baylibre.com,m:rogerq@kernel.org,m:tony@atomide.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux@armlinux.org.uk,m:thomas.petazzoni@bootlin.com,m:linux-omap@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:luca.ceresoli@bootlin.com,m:praneeth@ti.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:louis.chauvet@bootlin.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andreas@kemnade.info,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kemnade.info:-];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,goldelico.com:email]
X-Rspamd-Queue-Id: D83901317CB
X-Rspamd-Action: no action

On Thu, 12 Feb 2026 17:55:43 +0100
"H. Nikolaus Schaller" <hns@goldelico.com> wrote:

> > Am 12.02.2026 um 17:47 schrieb Andreas Kemnade <andreas@kemnade.info>:
> > 
> > On Thu, 12 Feb 2026 16:49:43 +0100
> > "H. Nikolaus Schaller" <hns@goldelico.com> wrote:
> >   
> >>> Am 12.02.2026 um 16:26 schrieb Kory Maincent (TI) <kory.maincent@bootlin.com>:
> >>> 
> >>> Allow overlays to be applied to any DTB. This adds around ~40% to the
> >>> total size of the DTB files on average.    
> >> 
> >> Is this unconditionally enabled or can it be turned off by some CONFIG? We have
> >> our own defconfig so I would not worry if if is enabled in omap2plus_defconfig
> >> and disabled in ours.
> >> 
> >> We have several devices where the boot loader can't handle overlays (never touch
> >> a working boot-loader :) So this seems to only contribute to build and load time
> >> without benefit.
> >>   
> > As long as you do not add overlays, the bootloader does not care. I would
> > like to simply carry around the 1-bit mmc overlay for one broken board.
> > That would help me. So I think there is a benefit but nobody forces
> > you to use it.  
> 
> Well, it does not force to use the really good feature, but it forces to add
> ~40% more file size and some more compile time, if I understand it correctly.
> 
Compile time, hardly measurable even if you just do make dtbs.

Size on disk:
a) if it lives around in a /boot partitions with kernels and initrams in it,
   then we are around 1% more space needed.

b) if it has separate partitions maybe on some mtd: Looking around: GTA04
   has quite some headroom left. Usage is still <50% even with symbols
   enabled.

But on the other no one else seems to enable that besides for devices with
open expansion boards carrying "hats". So overall, should we really be the
exception? 

Regards,
Andreas
