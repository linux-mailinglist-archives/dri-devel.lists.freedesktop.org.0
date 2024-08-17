Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7845E955962
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2024 21:28:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA8010E077;
	Sat, 17 Aug 2024 19:28:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.b="FJG0oTJ6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34C5910E077
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Aug 2024 19:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
 s=mail; t=1723922891;
 bh=buq2gqRLEnCsTc8U9OTezdiCTUKjtZxGXRrn7CtZc+0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FJG0oTJ6zK4a3YcVioXPzEFseqTOEH38EnrBMI/PA9/myTDjcUFHPfSyn8lBH25uK
 L/mUlx5Edbf3WZowu8l26LErMEgKJB7Rja4DOm8YhHNFQF5t+QtOcLjbqV8cHkZblZ
 bMhIbAVS6IttxsIjvFoaLgZinim80z/l0+xQctl0=
Date: Sat, 17 Aug 2024 21:28:10 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Dustin Howett <dustin@howett.net>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, 
 Matt Hartley <matt.hartley@gmail.com>, Kieran Levin <ktl@framework.net>, 
 Hans de Goede <hdegoede@redhat.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, Jonathan Corbet <corbet@lwn.net>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: panel-backlight-quirks: Add Framework 13 glossy and
 2.8k panels
Message-ID: <02b27fe8-d20f-429f-9a62-e8ef7a9e0206@t-8ch.de>
References: <20240817-drm-add-additional-framework-laptop-displays-to-panel-backlight-quirks-v1-1-cfdd5dbbffc8@howett.net>
 <CA+BfgNK9PEspi8=M2YDC4Kc43+JcEo2iej4Q2K7O2r9X1=X=OA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+BfgNK9PEspi8=M2YDC4Kc43+JcEo2iej4Q2K7O2r9X1=X=OA@mail.gmail.com>
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

Hi Dustin,

On 2024-08-17 14:23:42+0000, Dustin Howett wrote:
> On Sat, Aug 17, 2024 at 1:59 PM Dustin L. Howett <dustin@howett.net> wrote:
> >
> > This patch depends on
> > 20240812-amdgpu-min-backlight-quirk-v4-0-56a63ff897b7@weissschuh.net
> >
> > I have tested these panels on the Framework Laptop 13 AMD with firmware
> > revision 3.05 (latest at time of submission).

Thanks for the tests and patch!

> I apologize for the noise. I built this against Thomas' earlier patch
> version and obviously did inadequate testing when he submitted v4.
> 
> I will follow up with a new revision after a little while.
> 
> >
> > +               .quirk.pwm_min_brightness = 0,
>                    ^^^^^^
> This is clearly incorrect for the updated quirks infrastructure.

If you want, I can incorporate your patch directly into my series.
This would make the value of the quirk infrastructure in the introducing
series clearer and it should be easier for everybody to keep track of
the different parts.
If you agree, please let me know and either send me your updated patch
privately or I can adapt the patch you posted on my own.

My plan is to send a new revision tomorrow.


Thomas
