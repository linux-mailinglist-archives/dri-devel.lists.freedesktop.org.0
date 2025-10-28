Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83455C136CF
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 09:04:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4C4410E093;
	Tue, 28 Oct 2025 08:04:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="mWgPiWvW";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=valla.it header.i=@valla.it header.b="OZijjk78";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from delivery.antispam.mailspamprotection.com
 (delivery.antispam.mailspamprotection.com [185.56.87.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0122010E040
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 08:04:20 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256;
 d=outgoing.instance-europe-west4-4dvf.prod.antispam.mailspamprotection.com;
 s=arckey; t=1761638660; 
 b=TU0vkJ7cWA8mwpWrOsD6qHr3uBQmTMlOWpGohukg3X0q8LVF/eA0dnn4XbEM0PEVq822vAYSsu
 iM5xhBY6Ya5TJENTdJ6hnWsEQKwCWGkjAK2gq5go1EiaiiLK8m7yesPrDmzWlK2HBtj1MGc8Ot
 ZGMseP403Evr2BxtmPXpggkMIFQ6HPBgpq2idxH3OUk0/dQCJO2z1iW6rEwzcVhB5MIu9IjDSq
 7a/uQtPzJkUrmy4EraoNBk5ssm7nCK6nCX3oEJcQesykoF94CtWdWrCLpD6S6KY8lEMO37x3tU
 jXQ5ImCkaIHhnscBw0oe3eCZgs1aY0mevk2SxOIUCHmE7w==;
ARC-Authentication-Results: i=1;
 outgoing.instance-europe-west4-4dvf.prod.antispam.mailspamprotection.com;
 smtp.remote-ip=35.214.173.214; 
 iprev=pass (214.173.214.35.bc.googleusercontent.com)
 smtp.remote-ip=35.214.173.214; 
 auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
 dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
 arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed;
 d=outgoing.instance-europe-west4-4dvf.prod.antispam.mailspamprotection.com;
 s=arckey; t=1761638660; 
 bh=s6a57ztWgKqzZop2eXVnrLGAARifLGZdVEuuyt6o4uw=;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
 To:From:DKIM-Signature:DKIM-Signature;
 b=Ggff6uZW+5xIBr/WRI+sKcKGplVXHTOrenAWvtmQyawfw2+jDdllCMl28xOws5BnCkVRVrhRXU
 vByL3P+KZ8HVyHtjAdGFfKcREl+YAtaSllsCdgwRCQlJBykaBLHtTGtN5RZUr//59gUpMLmcaM
 VycauoZcmyA+aJwtlSLrkDiuE4WQJETYeBMiwLhjY1ZM+y0DTXmEazR3NuvQdQ9GgGNHNR2G4H
 JghlDhkac4S9jINj3cGH4s07WbABlEVH9BuYmM6drYtuiL4CdKBtDEjm3yVe+9Xh2zYGMy288h
 Y5vNmQyI7vSEfOl6Wv+z2UrtmrgCa8BI1QRBHox9RUiV4w==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
 :Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
 List-Unsubscribe:Content-Transfer-Encoding;
 bh=tv0PkcWT+R6COZq+/bFx5P+D3RWcMKpvqpZ6j2a+CzU=; b=mWgPiWvWPNHY9yEgFiJjXA7q+c
 Jk0GOfVBrHigN2SRCCRkX4gvLsUc9Hd857jTGeBG1k5WEg7GtHE5hphYJU+M43v4NqHEwJTjgziDl
 ipej+A4POlYUsgay82YhzdLk/1g+ElxHTYBUQUHrtR1B+hUC6N0MP7aGmA+AQ2knUIqw=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214]
 helo=esm19.siteground.biz)
 by instance-europe-west4-4dvf.prod.antispam.mailspamprotection.com with
 esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384 (Exim 4.98.1)
 (envelope-from <francesco@valla.it>) id 1vDegi-00000000WW9-3rMq
 for dri-devel@lists.freedesktop.org; Tue, 28 Oct 2025 08:04:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
 s=default; h=Date:Subject:Cc:To:From:list-help:list-unsubscribe:
 list-subscribe:list-post:list-owner:list-archive;
 bh=tv0PkcWT+R6COZq+/bFx5P+D3RWcMKpvqpZ6j2a+CzU=; b=OZijjk78i+B95GvMw1d1NggCNV
 gS6m2njSh3c14y+eNYU715tLWZwRBp9g+3B6fbflCkwKy0OL0r3wiHrXShrdC8Lp2yi3rndZqqoeZ
 oAYUvakhfEITOdyEyqBxG8zOrOaWYuqP1MvxL6fFbYUF1jOM7JjMO+V/hG3IfexkFZhc=;
Received: from [87.17.42.198] (port=62990 helo=fedora.fritz.box)
 by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.98.1) (envelope-from <francesco@valla.it>)
 id 1vDegM-00000000NKV-2TYu; Tue, 28 Oct 2025 08:03:54 +0000
From: Francesco Valla <francesco@valla.it>
To: Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Jocelyn Falempe <jfalempe@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-embedded@vger.kernel.org
Subject: Re: [PATCH RFC 0/3] Add splash DRM client
Date: Tue, 28 Oct 2025 09:03:53 +0100
Message-ID: <7194118.9J7NaK4W3v@fedora.fritz.box>
In-Reply-To: <3edea192-6a3f-44f5-b570-7033776e2ce4@suse.de>
References: <20251027-drm_client_splash-v1-0-00698933b34a@valla.it>
 <yq4btdc5qqukuqps7y53dratmu64ghyifgprlndnk5rbgml4of@rvca75sncvsm>
 <3edea192-6a3f-44f5-b570-7033776e2ce4@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart9956517.eNJFYEL58v";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: b4a89d3b10323b0ee20fb427ac7675df
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1vDegi-00000000WW9-3rMq-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-4dvf.prod.antispam.mailspamprotection.com; 
 iprev=pass (214.173.214.35.bc.googleusercontent.com)
 smtp.remote-ip=35.214.173.214; 
 auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
 dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
 arc=none
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

--nextPart9956517.eNJFYEL58v
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Francesco Valla <francesco@valla.it>
Subject: Re: [PATCH RFC 0/3] Add splash DRM client
Date: Tue, 28 Oct 2025 09:03:53 +0100
Message-ID: <7194118.9J7NaK4W3v@fedora.fritz.box>
In-Reply-To: <3edea192-6a3f-44f5-b570-7033776e2ce4@suse.de>
MIME-Version: 1.0

Hi Thomas,

On Monday, 27 October 2025 at 13:35:31 Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Hi Francenso, Maxime,
> 
> Am 27.10.25 um 11:09 schrieb Maxime Ripard:
> > Hi,
> >
> > On Mon, Oct 27, 2025 at 12:03:00AM +0100, Francesco Valla wrote:
> >> this patchset adds a new DRM client offering splash functionalities,
> >> able to draw to screen:
> >>
> >>    - a colored background;
> > So, I like that part, and we were recently discussing about this.
> 
> The panic screen has configurable foreground/background colors. Maybe we 
> can harmonize these settings.
> 

Maybe, but probably the panic colors would typically be much more vibrant
than splash ones. 

> >
> >>    - a single-line text message, which can be set through sysfs or
> >>      directly from the kernel command line;
> 
> Put it into the kernel config.
> 
> >>    - a very simple progress bar, which can be driven through sysfs;
> 
> Once you have options to control these settings from user space, you 
> should do it in user space entirely. As Maxime suggested, please improve 
> plymouth for anything with animation.
> 

On this I can agree, see my reply to Maxime.

> >>    - a static image (optional).
> 
> Board vendors often provide an image, see /sys/firmware/acpi/bgrt/. This 
> is a candidate for display, or the penguin or a custom image. Please 
> make it configurable by Kconfig. Again, if you need policy and 
> heuristics for deciding what to display, you better do this in user space.
>

I'm not under ACPI/UEFI typically, and the concept for this patch was not
developed on such system. But I'll take a look!

> > But there's no reason to have all that in the kernel, and we already
> > have userspace components to do so (plymouth being the main "mainstream"
> > one).
> >
> >> Once compiled inside the kernel, the client can be enabled through the
> >> command line specifying the drm_client_lib.active=splash parameter.
> >>
> >> == Motivation ==
> >>
> >> The motivation behind this work is to offer to embedded system
> >> developers a new path for a simple activation of the display(s)
> >> connected to their system, with the following usecases:
> >>
> >>    - bootsplash - possibly displaying even before init;
> >>    - early activation of the display pipeline, in particular whenever one
> >>      component of the pipeline (e.g.: a panel) takes a non-negligible
> >>      time to initialize;
> >>    - recovery systems, where the splash client can offer a simple feedback
> >>      for unattended recovery tasks;
> >>    - update systems, where the splash client can offer a simple feedback
> >>      for unattended update tasks.
> > If plymouth cannot be used by embedded systems for some reason, then you
> > should work on a plymouth alternative.
> 
> Agreed. With an updater running in user space, that process should also 
> manage the display update. No need for this in the kernel.
> 
> >
> >> While the first seems the most obvious one, it was the second that acted
> >> as the driver, as in the past I had to implement a ugly workaround using
> >> a systemd generator to kickstart the initialization of a display and
> >> shave ~400ms of boot time.
> >>
> >> The last 2 usecase, instead, are the reason I dropped the "boot" part
> >> from bootsplash.
> >>
> >> == Implementation details ==
> >>
> >> The design is quite simple, with a kernel thread doing the heavylifting
> >> for the rendering part and some locking to protect interactions with it.
> >>
> >> The splash image is loaded using the firmware framework, with the client
> >> expecting to find a binary dump having the right dimensions (width and
> >> height) and FOURCC format for each modeset. Given a 1920x1080 RGB888
> >> modeset, the client will for example search for a firmware named:
> >>
> >>     drm_splash_1920x1080_RG24.raw
> >>
> >> If the firmware cannot be loaded directly, the NOUEVENT sysfs fallback
> >> mechanism is used to let userspace load the appropriate image.
> >>
> >> == Testing ==
> >>
> >> Testing was done on qemu (both with vkms and bochs drivers), on a HDMI
> >> display connected to a Beagleplay and on a ILI9341 SPI display connected
> >> to a i.MX93 FRDM board. All these platforms revealed different
> >> weaknesses that were hopefully removed.
> >>
> >> == Open points / issues ==
> >>
> >> The reason for this being an RFC is that there are several open points:
> >>
> >>    - Support for tiled connectors should be there, but has not been
> >>      tested. Any idea on how to test it?
> > Did you mean tiled formats?
> >
> >>    - I'm not entirely convinced that using the firmware framework to load
> >>      the images is the right path. The idea behind it was to re-use the
> >>      compressed firmware support, but then I discovered it is not there
> >>      for built-in firmware.
> > Yeah, firmware loading for this has a few issues (being tedious to setup
> > for when built-in being one). I think just going the fbdev penguin road
> > is a better choice: you provide the path, and it's embedded in the
> > kernel directly.
> >
> >>    - Again on the firmware loading: CONFIG_LOADPIN would interfere with
> >>      sysfs loading.
> >>    - And again: FW_ACTION_NOUEVENT only has one user inside the kernel,
> >>      leading me to think it is de-facto deprecated. And still, uevents
> >>      for firmware loading seem frowned upon these days...
> >>    - Generating binary dumps for... basically any format is not so
> >>      straightforward. I crafted a Python tool with AI help which seems
> >>      to work quite well, but I honestly did not yet understood which is
> >>      the policy for AI-generated code inside the kernel, so it is not
> >>      included in this patch set. All client code is genuine, though.
> > BMP is simple enough to support so we should probably use that instead
> > of a custom format.
> 
> file /sys/firmware/acpi/bgrt/image
> /sys/firmware/acpi/bgrt/image: PC bitmap, Windows 3.x format, 768 x 256 
> x 24, image size 589824, cbSize 589878, bits offset 54
> 
> That should probably be the format for now unless your firmware uses 
> something else natively. Code for reading a BMP file can be found in the 
> efifb driver. [1]
> 
> [1] 
> https://elixir.bootlin.com/linux/v6.17.5/source/drivers/video/fbdev/efifb.c#L24
> 

When I started working on the patch I was not able to find this BMP decoder,
I only found the PPM one from the bootup logo. I'll take a look here too.  


> Apart from the criticism for complexity, I do like the idea of having a 
> splash screen.
> 
> Best regards
> Thomas
> 
> >
> > Maxime
> 
> 

Thank you!

Best regards,
Francesco

--nextPart9956517.eNJFYEL58v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRUrtjevJ039mawAeLir2xSXEi5AAUCaQB46QAKCRDir2xSXEi5
AGFFAP44WmJhkVq8Dd3yPrN4/6UbZ2jWawAOmn01DC155zZoIgEAhZhC84pdRLkN
8fFc7/Acio+KH0UOmzebgGlT202k6g0=
=JHNe
-----END PGP SIGNATURE-----

--nextPart9956517.eNJFYEL58v--



