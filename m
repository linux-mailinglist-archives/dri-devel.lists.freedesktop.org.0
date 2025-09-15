Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC184B57FC7
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 17:01:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1709410E4DF;
	Mon, 15 Sep 2025 15:01:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="i4pyKPGl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72D5310E4DF
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 15:01:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 38F6744316;
 Mon, 15 Sep 2025 15:01:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4B2AC4CEF1;
 Mon, 15 Sep 2025 15:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757948471;
 bh=z0vvKjrNnbzohkI8G7KdLmDE1Sza+Ghgjl1k3I/cZus=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=i4pyKPGlIG0QOHu7CV1l+6FD65J4tSTt9q76gucq+drVv8UquOGGHgWeHMlY34tFl
 bf7UIFoIZZHAtNs2JSfUIJJ+lemNb0lJhhkJBQXghrUa3+2SA3wynWu3TMeLmTm7ea
 XARLu959v0QcwDTVRiZeZGVpT8oK8pH6luSM1CaPQIyNoISCvvKAzl5XkXsPxTcYRv
 lJKssGhU5jDjkqP8tm/ILybIZptGFBiquoA0o/xM4gK5y7yURzu7q1TUh+WEj89wfC
 srs5mEOVaCI0wC8+W8DrEq/3g4jpoov4VABTijNuCKUu0ywgxhA4TfNl11w2JKvzJ6
 +kv31KGcVF/9g==
Date: Mon, 15 Sep 2025 16:01:03 +0100
From: Daniel Thompson <danielt@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Rob Herring <robh@kernel.org>, lee@kernel.org, jingoohan1@gmail.com,
 neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com,
 deller@gmx.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 fnkl.kernel@gmail.com, j@jannau.net, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, sven@kernel.org,
 alyssa@rosenzweig.io, neal@gompa.dev,
 support.opensource@diasemi.com, duje.mihanovic@skole.hr,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 platform-driver-x86@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v2 13/15] backlight: rave-sp: Include <linux/of.h> and
 <linux/mod_devicetable.h>
Message-ID: <aMgqL-ZeSkICqRih@aspen.lan>
References: <20250715122643.137027-1-tzimmermann@suse.de>
 <20250715122643.137027-14-tzimmermann@suse.de>
 <CAL_JsqKSjQy8CVohbVL50kn=o_kPVUsAUFjYvNC3mpcA7pm_Og@mail.gmail.com>
 <26a9a762-23bc-4367-9cb3-c2b081d641c6@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <26a9a762-23bc-4367-9cb3-c2b081d641c6@suse.de>
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

On Wed, Jul 16, 2025 at 08:39:03AM +0200, Thomas Zimmermann wrote:
> Hi
>
> Am 15.07.25 um 15:34 schrieb Rob Herring:
> > On Tue, Jul 15, 2025 at 7:30 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > > Include <linux/of.h> to declare struct device_node and include
> > > <linux/mod_devicetable.h> to declare struct of_device_id. Avoids
> > > dependency on backlight header to include it.
> > struct device_node should be opaque...
> >
> >          /*
> >           * If there is a phandle pointing to the device node we can
> >           * assume that another device will manage the status changes.
> >           * If not we make sure the backlight is in a consistent state.
> >           */
> >          if (!dev->of_node->phandle)
> >                  backlight_update_status(bd);
> >
> > Well, that is ugly. IMO, we should just drop the check. A DT built
> > with "-@" option will have phandle set, so that's not a reliable test.
>
> Not that I disagree, but fixing it is out of scope for this series.

This pattern appears in several places. It is used to guess whether
the initial state of the backlight should be on or off (which avoids
flickering artefacts during boot).

You won't get much argument from me about the ugliness either. However
this patch makes the presence of this logic more obvious rather than
less. On that basis I view it as moving in the right direction rather
than the wrong one and therefore:
Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.
