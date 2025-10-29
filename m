Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4D9C1C898
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 18:44:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AE7710E211;
	Wed, 29 Oct 2025 17:44:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LNJC3HSu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C844210E211
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 17:44:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8153D438F2;
 Wed, 29 Oct 2025 17:44:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3798CC4CEF7;
 Wed, 29 Oct 2025 17:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761759857;
 bh=MFX7L/AI8JM0uO4N5k58xVcU7FqcMiBcizefUKUgzz4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LNJC3HSuFqsitCic1quYkNQly3HBPAfIaRu2tJjyfsk6r6Sr/yfBkMh3mwR114OwK
 eC6p1rE8dXwEAbr3Ft/sYyjg1nR+eTwkeNVwlo6jAB5/SvKyUboTW9f1YIXIJ0eoEx
 QjJ3fnPAW3tIv1HHlw+grkirs2ocSSf3HSfL/noxHLOj4MQnT5ozy30+GFtUjyvmhI
 6uEsq491dCQ6o52rEuwviY9Pu0wWX8kT+alGypvU4xPDdQBGSRmgDH6p1LU0jAHyxb
 HvK59t4JqRx54FGEb7AI58k5JxDtDBBvdkzbkGVT42IKAxV5OiLJhev8QXqcr0TfiP
 OPEFEXpRjAHng==
Date: Wed, 29 Oct 2025 17:45:12 +0000
From: Daniel Thompson <danielt@kernel.org>
To: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
Cc: "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
 "tomi.valkeinen@ti.com" <tomi.valkeinen@ti.com>,
 "lee@kernel.org" <lee@kernel.org>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "tony@atomide.com" <tony@atomide.com>,
 "pavel@ucw.cz" <pavel@ucw.cz>, "deller@gmx.de" <deller@gmx.de>,
 "jjhiblot@ti.com" <jjhiblot@ti.com>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "saravanak@google.com" <saravanak@google.com>,
 "herve.codina@bootlin.com" <herve.codina@bootlin.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "alexander.sverdlin@gmail.com" <alexander.sverdlin@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "daniel.thompson@linaro.org" <daniel.thompson@linaro.org>
Subject: Re: [PATCH v6] backlight: led-backlight: add devlink to supplier LEDs
Message-ID: <aQJSqJOrtETMKt8x@aspen.lan>
References: <20250519-led-backlight-add-devlink-to-supplier-class-device-v6-1-845224aeb2ce@bootlin.com>
 <6e6039c815c7125e35b43ca2f8d32a0fa3103fea.camel@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e6039c815c7125e35b43ca2f8d32a0fa3103fea.camel@siemens.com>
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

On Thu, Oct 23, 2025 at 12:41:30PM +0000, Sverdlin, Alexander wrote:
> Hi Lee, Daniel, Jingoo,
>
> On Mon, 2025-05-19 at 22:19 +0200, Luca Ceresoli wrote:
> > led-backlight is a consumer of one or multiple LED class devices, but
> > devlink is currently unable to create correct supplier-producer links when
> > the supplier is a class device. It creates instead a link where the
> > supplier is the parent of the expected device.
> > <snip>
> > Fixes: ae232e45acf9 ("backlight: add led-backlight driver")
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > Reviewed-by: Herve Codina <herve.codina@bootlin.com>
>
> I've noticed that the patch in archived in the patchwork [1] but I wasn't
> able to find it in any branch of the backlight tree [2].
>
> Could it be that the patch somehow slipped through?
> It does solve a real-world crash, could you please consider to apply it?

Sorry folks. I overlooked this in my backlog and never posted the R-b
(which helps Lee figure out what to hoover up).

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.
