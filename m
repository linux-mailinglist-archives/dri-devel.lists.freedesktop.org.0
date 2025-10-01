Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BF0BB08BE
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 15:43:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2F2010E0E8;
	Wed,  1 Oct 2025 13:43:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JD4uthE2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D677810E0E8
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 13:43:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 56E1840326;
 Wed,  1 Oct 2025 13:43:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD183C4CEF4;
 Wed,  1 Oct 2025 13:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759326235;
 bh=YmUasciFTD3VpD/4siSJw5bG0HOrjO+PKhZbkV8qFZw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JD4uthE2Rsh+qEXs6bIwdNbHH28S03NLE3YeLIr9LMR2OLYUtKYV9n/DL5uyZ+jw7
 A6al/dMkwCdpvZrNwL9k1W51fGeaxcoeZy8EZi7wex82438FEf92cYf/WYvKbTSIGb
 3P7KMqMWcHld7FSN1WQGX5/QB3KQFLCfoHihXZ34lZcUjnpL4ViRv7mYHn1t/+Xej/
 7PEtMZ7SQc3spbLwT9ARPzdQ24f401iS1uF5chparAU5Sd56Gc76ga46EZT+lXFP0f
 IATWexjuHSXee1lTgCifkNA3zrqgdGK2aGO9ZnqyKy8h3rDk4t9b1rYgnKwFszjDQJ
 MPEe5UjGia+PA==
Date: Wed, 1 Oct 2025 14:43:48 +0100
From: Lee Jones <lee@kernel.org>
To: danielt@kernel.org, jingoohan1@gmail.com, neil.armstrong@linaro.org,
 jessica.zhang@oss.qualcomm.com, deller@gmx.de,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, fnkl.kernel@gmail.com,
 j@jannau.net, ilpo.jarvinen@linux.intel.com, sven@kernel.org,
 alyssa@rosenzweig.io, neal@gompa.dev,
 support.opensource@diasemi.com, Hans de Goede <hansg@kernel.org>,
 duje@dujemihanovic.xyz, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 platform-driver-x86@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org
Subject: Re: (subset) [PATCH v2 00/15] backlight: Do not include <linux/fb.h>
 in header file
Message-ID: <20251001134348.GT8757@google.com>
References: <20250715122643.137027-1-tzimmermann@suse.de>
 <175803873238.3892705.12154571803108246655.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <175803873238.3892705.12154571803108246655.b4-ty@kernel.org>
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

On Tue, 16 Sep 2025, Lee Jones wrote:

> On Tue, 15 Jul 2025 14:24:37 +0200, Thomas Zimmermann wrote:
> > Remove the final dependencies on fbdev from the backlight subsystem.
> > This is really just the include of <linux/fb.h> in backlight, but it
> > has some fallout in other code.
> > 
> > Patches 1 to 14 fix all the implicit includes that come from fb.h
> > throughout the kernel. It's all trivial, but touches various drivers.
> > Maintainers are in CC. Patch 15 fixes the backlight header.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [06/15] backlight: Include <linux/of.h>
>         commit: b12224c28d84d054dfb680c05cda61d1e2584bf5
> [07/15] backlight: apple_dwi_bl: Include <linux/mod_devicetable.h>
>         commit: 945e411acde3800234d506f4304203a9b11890f8
> [08/15] backlight: as3711_bl: Include <linux/of.h>
>         commit: 6789cd935a57464deaacdd14c84bc026aa228e72
> [09/15] backlight: da9052_bl: Include <linux/mod_devicetable.h>
>         commit: e2e76f67bdbbc7b8df608e3dd1028059d838871e
> [10/15] backlight: jornada720: Include <linux/io.h>
>         commit: ce4bb1a2f1cbcd5f6471f74ee5c7e1443a4cfd84
> [11/15] backlight: ktd2801: Include <linux/mod_devicetable.h>
>         commit: 5f60004f152b432c6ae5dbacc172adc1fa215825
> [12/15] backlight: led_bl: Include <linux/of.h>
>         commit: b38ed7c05a35f3a029c2fc5e43a94aa81e2ac843
> [13/15] backlight: rave-sp: Include <linux/of.h> and <linux/mod_devicetable.h>
>         commit: 246da2b48e2ce973db255fc4b6faf42f73c03114
> [14/15] backlight: rt4831: Include <linux/mod_devicetable.h>
>         commit: ba3b29a639fe5173033914db6ee58d8d9bb86aba

> [15/15] backlight: Do not include <linux/fb.h> in header file
>         commit: 9f218f9bb9d274b9d5d48a4c95e1b199141fc1f2

I have removed this commit from Backlight, since it was causing too many
issues.  Please resubmit it once the merge-window is closed.

-- 
Lee Jones [李琼斯]
