Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCC9CFAE85
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 21:22:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44FA310E54E;
	Tue,  6 Jan 2026 20:22:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="iliU2NHB";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=valla.it header.i=@valla.it header.b="itu4/rge";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from delivery.antispam.mailspamprotection.com
 (delivery.antispam.mailspamprotection.com [185.56.87.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63E4E10E54E
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 20:22:44 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256;
 d=outgoing.instance-europe-west4-msqm.prod.antispam.mailspamprotection.com;
 s=arckey; t=1767730964; 
 b=roSzM6gxfpGZmyqBkhnOSlbCw4refOIQL3VadKTtGIFEr7/M5foDdM0Sbo78Nco+kAzbT/TlXn
 PkIoODJZllfPAN7Hjh5KGOtBOM2sjdNfhDSxOIgU4Emc9UReXM09OK0rIs+uEr+/RJYakpZ4q5
 FadT1xGQlOmsSJjLvjA13QPsopQybbwE+Vsk8TymeV3jJHXQ4dJqC1V9xR1uuxC0uq98iW3Uku
 tBdmUfJRvT/m+SZCDiaOW/dOYHvFiTzQFCkEe0ay/kAv8rjGg3aji2GO5sc6ry+j4yyeYzz1PO
 nJTt8J2RjufSmnVfbzzTKwqbviRwT0rZTFhlXhfobXTTNw==;
ARC-Authentication-Results: i=1;
 outgoing.instance-europe-west4-msqm.prod.antispam.mailspamprotection.com;
 smtp.remote-ip=35.214.173.214; 
 iprev=pass (214.173.214.35.bc.googleusercontent.com)
 smtp.remote-ip=35.214.173.214; 
 auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
 dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
 arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed;
 d=outgoing.instance-europe-west4-msqm.prod.antispam.mailspamprotection.com;
 s=arckey; t=1767730964; 
 bh=xFfuh+sKr/gblK4bi+Y9pT+roZCiRJQay4kPG4+F1wQ=;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
 From:Date:DKIM-Signature:DKIM-Signature;
 b=YtJOnYcNi+/gUfnGh5/KrgF4Jm1fvc4M6tD6kQ34jLIamycc81W7rvQ/gyVbAw8YEGFU7L2IvZ
 wnls0dwSzSz8FfdbBd4KdJDT3L62QRFjtRrjtyDgHWaKI6eJPS9Og55bA0QV2rTUDeJp6N3a/q
 +Nymc5fpn6695rvAr+tDhYS+kgz7KkdgOTS37daV1vby+OINM4ZybZAzQ5NAL0gCP3ksC1qa+0
 5AH++hfIVRXkqR8kAAmGd91RdNCSFDQcn5Qt2NuzBknjEUxAzbKEwtuw0JCjjH8QPnn4tvPgrh
 QuRaww1/Ln8XbGmB4ITo4AXI5ObNZCmOf6Wir69K0I2AFQ==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
 :Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 List-Unsubscribe:Content-Transfer-Encoding;
 bh=UiTrcBdtbQDlRNy2NR9I0n40HqJp4rOp82+eaVbqqJU=; b=iliU2NHBc24FbgOY+KbvOYBwzX
 stD9ovpAKrXdum1N5n/AJ6YpgdFw4FR6UlPa3B93KE1BoyAPBj65j6sxityks9aaUNeD+VHRfS/ua
 38MJbTYWs486+kte8ZhkoDQtCfHNYw2pdpBcrWTrmWM4jOWv3kt/fHPGvzrHDvDP/r2g=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214]
 helo=esm19.siteground.biz)
 by instance-europe-west4-msqm.prod.antispam.mailspamprotection.com with
 esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384 (Exim 4.98.1)
 (envelope-from <francesco@valla.it>) id 1vdDZf-00000004qzZ-28D8
 for dri-devel@lists.freedesktop.org; Tue, 06 Jan 2026 20:22:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
 s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
 list-subscribe:list-post:list-owner:list-archive;
 bh=UiTrcBdtbQDlRNy2NR9I0n40HqJp4rOp82+eaVbqqJU=; b=itu4/rge2gUT/OtuxyXIk1iOld
 i3yiUJPnG5C6kovEpiu8XsOs1b1ag2rYXmpsB+w9/4mlAPEh9+hTz7nkrrFZ5QLlsMzPd965nGzUA
 p2FKri/K4oyhpzVljChq7To0F1sswBIjbT4WDadRnPyXFpmp7ZwQ5nc9SN2xgofFRBLY=;
Received: from [95.248.141.113] (port=61851 helo=bywater)
 by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.98.1) (envelope-from <francesco@valla.it>)
 id 1vdDZH-000000004u2-1hq5; Tue, 06 Jan 2026 20:22:15 +0000
Date: Tue, 6 Jan 2026 21:22:13 +0100
From: Francesco Valla <francesco@valla.it>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Jocelyn Falempe <jfalempe@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Mario Limonciello <mario.limonciello@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-embedded@vger.kernel.org
Subject: Re: [PATCH RFC v2 1/3] drm: client: add splash client
Message-ID: <aV1u9QBxfWyDcqKB@bywater>
References: <20260106-drm_client_splash-v2-0-6e86a7434b59@valla.it>
 <20260106-drm_client_splash-v2-1-6e86a7434b59@valla.it>
 <CAMuHMdUtsx1gQffk9c-U9UkeqG_Dopv5vXNrp72ewh0EQQgwjQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUtsx1gQffk9c-U9UkeqG_Dopv5vXNrp72ewh0EQQgwjQ@mail.gmail.com>
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 15927dc4611919a9bd913b989dc08ed3
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1vdDZf-00000004qzZ-28D8-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-msqm.prod.antispam.mailspamprotection.com; 
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

Hi Geert,

On Tue, Jan 06, 2026 at 03:47:49PM +0100, Geert Uytterhoeven wrote:
> Hi Franceso,
> 
> On Tue, 6 Jan 2026 at 15:26, Francesco Valla <francesco@valla.it> wrote:
> > Add a DRM client that draws a simple splash, with possibility to show:
> >
> >   - a colored background;
> >   - a static BMP image (loaded as firmware);
> >   - the logo provided by EFI BGRT.
> >
> > The client is not meant to replace a full-featured bootsplash, but
> > rather to remove some complexity (and hopefully boot time) on small
> > embedded platforms or on systems with a limited scope (e.g: recovery
> > or manufacturing images).
> >
> > The background color can be set either at build time from a dedicated
> > config option or at runtime through the drm_client_lib.splash_color
> > command line parameter. Any color in RGB888 format can be used.
> >
> > If enabled, the static BMP image is loaded using the kernel firmware
> > infrastructure; a valid BMP image with 24bpp color and no compression
> > is expected. The name of the image can be set through the
> > drm_client_lib.splash_bmp kernel command line parameter, with the
> > default being 'drm_splash.bmp'.
> >
> > Just like the existing DRM clients, the splash can be enabled from the
> > kernel command line using drm_client_lib.active=splash.
> >
> > Signed-off-by: Francesco Valla <francesco@valla.it>
> 
> Thanks for your patch!
> 
> > --- /dev/null
> > +++ b/drivers/gpu/drm/clients/drm_splash.c
> 
> > +#if IS_ENABLED(CONFIG_DRM_CLIENT_SPLASH_BMP_SUPPORT)
> 
> There is no need to protect this block with #if, as it does not generate
> any code.
> 

This was left here when I moved some code along - I'll remove the
guards.

> > +#define BMP_FILE_MAGIC_ID 0x4d42
> > +
> > +/* BMP header structures copied from drivers/video/fbdev/efifb.c */
> > +struct bmp_file_header {
> > +       u16 id;
> > +       u32 file_size;
> > +       u32 reserved;
> > +       u32 bitmap_offset;
> > +} __packed;
> > +
> > +struct bmp_dib_header {
> > +       u32 dib_header_size;
> > +       s32 width;
> > +       s32 height;
> > +       u16 planes;
> > +       u16 bpp;
> > +       u32 compression;
> > +       u32 bitmap_size;
> > +       u32 horz_resolution;
> > +       u32 vert_resolution;
> > +       u32 colors_used;
> > +       u32 colors_important;
> > +} __packed;
> > +#endif // CONFIG_DRM_CLIENT_SPLASH_BMP_SUPPORT
> 
> As per [1], all these values are little-endian.  Hence they should
> be declared as such using le16 or le32, and accessed using
> get_unalined_le{16,32}().
> 
> [1] https://en.wikipedia.org/wiki/BMP_file_format#File_structure
> 

This is obviously right, I'll use proper accessors in next version.

I wonder why this is done precisely this way inside the efifb driver,
but that's maybe because all EFI platforms are little-endian? 

> Gr{oetje,eeting}s,
> 
>                         Geert
>

Thank you!

Reagrds,
Francesco

