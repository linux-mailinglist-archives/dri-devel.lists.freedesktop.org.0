Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 011E3C1373E
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 09:09:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A3BF10E040;
	Tue, 28 Oct 2025 08:09:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="vQfqvtMt";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=valla.it header.i=@valla.it header.b="ch8YEI4w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from delivery.antispam.mailspamprotection.com
 (delivery.antispam.mailspamprotection.com [185.56.87.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CD0C10E040
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 08:09:31 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256;
 d=outgoing.instance-europe-west4-4wj9.prod.antispam.mailspamprotection.com;
 s=arckey; t=1761638971; 
 b=Vha6mgf1oyVxHWn6leNa4KPj8SzMXmvfkHfIookWQbHzmtKLiaso9cDSmQIQ1VzbrjdgXfAzsm
 vTAmkjzho4UBy7bkvFnBLdRczTp7T7RhyoDylQoGx+uq02NcKRvEfCIGZ6CkQbelchPQ7QQpiK
 WcX4NB1N4d44Qn5Q6HBMn5vdMwGTt5SLFeHh7RZVaXQZcQjW9tXhXeEOwdhXl1yM9a3zmf+nTi
 Rp+LdYEIIf7ag6J/9MgHrc1V4BKVfV46jh8HxCvgw56FoM03DHu9FkEURCLDYzGlhLLzr05ebx
 SSnv/B6XtEIoCGWF0pV2iy4VBc1gOqo/K9P7EpxO3Mw3Xg==;
ARC-Authentication-Results: i=1;
 outgoing.instance-europe-west4-4wj9.prod.antispam.mailspamprotection.com;
 smtp.remote-ip=35.214.173.214; 
 iprev=pass (214.173.214.35.bc.googleusercontent.com)
 smtp.remote-ip=35.214.173.214; 
 auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
 dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
 arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed;
 d=outgoing.instance-europe-west4-4wj9.prod.antispam.mailspamprotection.com;
 s=arckey; t=1761638971; 
 bh=oM+Qk6/0i7S5n4w2OHuWR3eCnfyQfEjkW2Qc+xb62FA=;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
 To:From:DKIM-Signature:DKIM-Signature;
 b=lNdiEZL9KzX4kBE7zbQ7gdzWyRCvXg4Q66bIMXQXl87F9NBY58ip+xsTGnuBBvQFo5FrXObx7P
 1eMLo9nqi82eQRKleRIr2hzj5vHbXxpfiy5FFFrutyXo66NIdfNhZnH2UZQcIzPrEOK8Aelcj5
 15teQBWiGwU86TlPOEhjMgHOku8cGwIf9gfBmnGRqRUbskLN11k03quyPc35AcedGPf79CRxPG
 eut4Np8zcfuM+r69i7wpMRbbSLhkIDSkBklBGHyXIrUc2VOt+E7IG4QrTrtSMS4c9J1kx/aS5Q
 GWlzcSveoKMkWohgByAwhEmSXj4dOeW/DRMevTRQEqbxvw==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
 :Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
 List-Unsubscribe:Content-Transfer-Encoding;
 bh=ne9rWrothZr4TKac9t+L9M1azOkVDHMJP9hBVA/2hz0=; b=vQfqvtMt87otpGhPqlg20kXX0M
 t5+Z/Q61+orzy7QEtmCELr+PXnmYo8Yfj6pZCnxccrQ5yhhJh2v9aWJmFPaiP7owtgj7/V8Ip5A89
 ZOBgW+HrawIxNasG2rZWosGHLDkQ2PhUHzx7aVGeN8t6UHu5H3+Ta3BWT5EIZjR7qsl4=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214]
 helo=esm19.siteground.biz)
 by instance-europe-west4-4wj9.prod.antispam.mailspamprotection.com with
 esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384 (Exim 4.98.1)
 (envelope-from <francesco@valla.it>) id 1vDelj-00000000wx1-3gT6
 for dri-devel@lists.freedesktop.org; Tue, 28 Oct 2025 08:09:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
 s=default; h=Date:Subject:Cc:To:From:list-help:list-unsubscribe:
 list-subscribe:list-post:list-owner:list-archive;
 bh=ne9rWrothZr4TKac9t+L9M1azOkVDHMJP9hBVA/2hz0=; b=ch8YEI4w4BIM4FJluSHOAp48Fx
 n+ZnDTn0d2LiVvNZy6+NExHAaPKyXqa9uDyQENZvIpqzgufF6Z+VOQLGmnjdeIlImYSynktKq7c4+
 5idxkp7JdwSLIaH5IWb19HVH6vZ7WYR2XHxm+6D/oWLVoGKMVuK1+ko2p15GMpOmU2eU=;
Received: from [87.17.42.198] (port=59590 helo=fedora.fritz.box)
 by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.98.1) (envelope-from <francesco@valla.it>)
 id 1vDelP-00000000PrG-1MNk; Tue, 28 Oct 2025 08:09:07 +0000
From: Francesco Valla <francesco@valla.it>
To: Mario Limonciello <mario.limonciello@amd.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Jocelyn Falempe <jfalempe@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-embedded@vger.kernel.org
Subject: Re: [PATCH RFC 0/3] Add splash DRM client
Date: Tue, 28 Oct 2025 09:09:06 +0100
Message-ID: <4497733.UPlyArG6xL@fedora.fritz.box>
In-Reply-To: <23clcxtgbzbsji2knwp47xdc5udj7lnhbvzsgqi3vklvmhdgjd@26ycx2ed77l4>
References: <20251027-drm_client_splash-v1-0-00698933b34a@valla.it>
 <93cbbaef-918f-4300-aa5b-11f098e217b2@amd.com>
 <23clcxtgbzbsji2knwp47xdc5udj7lnhbvzsgqi3vklvmhdgjd@26ycx2ed77l4>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5779622.ZASKD2KPVS";
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
X-SGantispam-id: be0e1d0f0d3a8b03aac6dc47d4b4494c
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1vDelj-00000000wx1-3gT6-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-4wj9.prod.antispam.mailspamprotection.com; 
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

--nextPart5779622.ZASKD2KPVS
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Francesco Valla <francesco@valla.it>
Subject: Re: [PATCH RFC 0/3] Add splash DRM client
Date: Tue, 28 Oct 2025 09:09:06 +0100
Message-ID: <4497733.UPlyArG6xL@fedora.fritz.box>
MIME-Version: 1.0

Hi,

On Monday, 27 October 2025 at 18:19:12 Maxime Ripard <mripard@kernel.org> wrote:
> On Mon, Oct 27, 2025 at 11:31:06AM -0500, Mario Limonciello wrote:
> > On 10/27/25 11:28 AM, Maxime Ripard wrote:
> > > On Mon, Oct 27, 2025 at 11:01:55AM -0500, Mario Limonciello wrote:
> > > > On 10/27/25 7:35 AM, Thomas Zimmermann wrote:
> > > > > > >     - a very simple progress bar, which can be driven through sysfs;
> > > > > 
> > > > > Once you have options to control these settings from user space, you
> > > > > should do it in user space entirely. As Maxime suggested, please improve
> > > > > plymouth for anything with animation.
> > > > > 
> > > > > > >     - a static image (optional).
> > > > > 
> > > > > Board vendors often provide an image, see /sys/firmware/acpi/bgrt/. This
> > > > > is a candidate for display, or the penguin or a custom image. Please
> > > > > make it configurable by Kconfig. Again, if you need policy and
> > > > > heuristics for deciding what to display, you better do this in user
> > > > > space.
> > > > 
> > > > I'd actually argue that the static image from BGRT should be the preferred
> > > > priority.  This can make for a nice hand off to Plymouth.
> > > > 
> > > > The (UEFI) BIOS already will show this image as soon as the GOP driver is
> > > > loaded.  Bootloaders like GRUB by default will avoid showing anything or
> > > > will overwrite with the exact same image in the same location.  This can let
> > > > the kernel do the same, and then the moment Plymouth takes over it could do
> > > > the same.
> > > 
> > > And BGRT isn't typically found on embedded systems at all, so I'm not
> > > sure it's a sensible default, let alone a priority. At most a possible
> > 
> > There are certainly embedded machines using UEFI and that have a BGRT.
> 
> Yes, indeed, hence the "typically".
> 
> > How about "Sensible default the top of the priority list if it exists"
> 
> How about we don't tell contributors what their priorities must be?
> 
> Maxime
> 

I'm not familiar at all with BGRT, I'll study a bit about it.

A build-time configuration could then let the user select:

- a plain solid color
- a custom static image
- the penguin logo (?)
- (on UEFI systems) BGRT source



Thank you

Regards,
Francesco

--nextPart5779622.ZASKD2KPVS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRUrtjevJ039mawAeLir2xSXEi5AAUCaQB6IgAKCRDir2xSXEi5
AKhQAP40LB6RZAIqFWMaqTGwU+pfKfbI7xzrwvAnMQg0GyiITQD9GYvelT634R5P
85RcG3t/ggO2aoRdzaCR0AxVzNLCOQk=
=xkSs
-----END PGP SIGNATURE-----

--nextPart5779622.ZASKD2KPVS--



