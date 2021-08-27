Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACED3F9E51
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 19:50:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BADE86E999;
	Fri, 27 Aug 2021 17:50:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66ACD6E999
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 17:50:26 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B8E6E1FF38;
 Fri, 27 Aug 2021 17:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1630086624; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ms+Fkmur2WYb67yHfoUOGKQ2l1RH6G2yYJ/wCRhZHoM=;
 b=ooxF/1gW17bqId2aVGu4q+hWkS1JJjBxCS/1n9CCx/7fYTBXxn7TGVfWMm4Fp4P2KJnwAF
 W/nloFVMCst6HLQRD1Lw526woc6DiTr2H2Ue4yn6mubfa+uF2uqOWXYR9j5grBMmJsfeHi
 hxwX+imiFNFzwhUi+FjtE0gbkFb1lPI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1630086624;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ms+Fkmur2WYb67yHfoUOGKQ2l1RH6G2yYJ/wCRhZHoM=;
 b=YJHG2tcrPH1xoaDL+h0Dye00pzlPYeYALghMfxkyjyZiiWwm6kfyEuwPvRw/FEAvOHWmLk
 V4rhteb6npfKTrBQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 63EB013951;
 Fri, 27 Aug 2021 17:50:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id +3+qFuAlKWE+HAAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Fri, 27 Aug 2021 17:50:24 +0000
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, x86@kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-fbdev@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Maxime Ripard <mripard@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Peter Robinson <pbrobinson@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Ingo Molnar <mingo@redhat.com>, David Airlie <airlied@linux.ie>
References: <20210827100027.1577561-1-javierm@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [RFC PATCH 0/4] Allow to use DRM fbdev emulation layer with
 CONFIG_FB disabled
Message-ID: <bb5d045c-c9de-b6df-cf45-32b1a866264a@suse.de>
Date: Fri, 27 Aug 2021 19:50:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210827100027.1577561-1-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="MhvaDTCQzm390CuA8VY5jgge6KVQPick5"
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--MhvaDTCQzm390CuA8VY5jgge6KVQPick5
Content-Type: multipart/mixed; boundary="s0O1dtcYdZM7EGrIJlVas1FfWteIpAi3F";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, x86@kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-fbdev@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Maxime Ripard <mripard@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Peter Robinson <pbrobinson@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Ingo Molnar <mingo@redhat.com>, David Airlie <airlied@linux.ie>
Message-ID: <bb5d045c-c9de-b6df-cf45-32b1a866264a@suse.de>
Subject: Re: [RFC PATCH 0/4] Allow to use DRM fbdev emulation layer with
 CONFIG_FB disabled
References: <20210827100027.1577561-1-javierm@redhat.com>
In-Reply-To: <20210827100027.1577561-1-javierm@redhat.com>

--s0O1dtcYdZM7EGrIJlVas1FfWteIpAi3F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 27.08.21 um 12:00 schrieb Javier Martinez Canillas:
> This patch series splits the fbdev core support in two different Kconfi=
g
> symbols: FB and FB_CORE. The motivation for this is to allow CONFIG_FB =
to
> be disabled, while still using fbcon with the DRM fbdev emulation layer=
=2E

I'm skeptical. DRM's fbdev emulation is not just the console emulation,=20
it's a full fbdev device. You can see the related device file as=20
/dev/fb*. Providing the file while having CONFIG_FB disabled doesn't=20
make much sense to me. I know it's not pretty, but it's consistent at lea=
st.

If you want to remove fbdev, you could try to untangle fbdev and the=20
console emulation such that DRM can set up a console by itself. Old=20
fbdev drives would also set up the console individually.

Another low-hangling fruit is a config option to enable/disable the=20
fbdev userspace interface (i.e., dev/fb*). Disabling the interface would =

remove the rsp mmap of the fbdev graphics buffer. We sometimes have to=20
use an extra shadow buffer because mmap requires non-moving buffers.=20
Without mmap we might be able to avoid some of the costly internal=20
memcpys for some of our drivers.

Best regards
Thomas

>=20
> The reason for doing this is that now with simpledrm we could just boot=

> with simpledrm -> real DRM driver, without needing any legacy fbdev dri=
ver
> (e.g: efifb or simplefb) even for the early console.
>=20
> We want to do that in the Fedora kernel, but currently need to keep opt=
ion
> CONFIG_FB enabled and all fbdev drivers explicitly disabled, which make=
s
> the configuration harder to maintain.
>=20
> It is a RFC because I'm not that familiar with the fbdev core, but I ha=
ve
> tested and works with CONFIG_DRM_FBDEV_EMULATION=3Dy and CONFIG_FB disa=
bled.
> This config automatically disables all the fbdev drivers that is our go=
al.
>=20
> Patch 1/4 is just a clean up, patch 2/4 moves a couple of functions out=
 of
> fbsysfs.o, that are not related to sysfs attributes creation and finall=
y
> patch 3/4 makes the fbdev split that is mentioned above.
>=20
> Patch 4/4 makes the DRM fbdev emulation depend on the new FB_CORE symbo=
l
> instead of FB. This could be done as a follow-up but for completeness i=
s
> also included in this series.
>=20
> Best regards,
> Javier
>=20
>=20
> Javier Martinez Canillas (4):
>    fbdev: Rename fb_*_device() functions names to match what they do
>    fbdev: Move framebuffer_{alloc,release}() functions to fbmem.c
>    fbdev: Split frame buffer support in FB and FB_CORE symbols
>    drm: Make fbdev emulation depend on FB_CORE instead of FB
>=20
>   arch/x86/Makefile                  |  2 +-
>   arch/x86/video/Makefile            |  2 +-
>   drivers/gpu/drm/Kconfig            |  2 +-
>   drivers/video/console/Kconfig      |  2 +-
>   drivers/video/fbdev/Kconfig        | 57 +++++++++++++---------
>   drivers/video/fbdev/core/Makefile  | 13 +++--
>   drivers/video/fbdev/core/fbmem.c   | 73 ++++++++++++++++++++++++++--
>   drivers/video/fbdev/core/fbsysfs.c | 77 +----------------------------=
-
>   include/linux/fb.h                 | 18 ++++++-
>   9 files changed, 134 insertions(+), 112 deletions(-)
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--s0O1dtcYdZM7EGrIJlVas1FfWteIpAi3F--

--MhvaDTCQzm390CuA8VY5jgge6KVQPick5
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmEpJd8FAwAAAAAACgkQlh/E3EQov+Ag
Ww//de6jEOu+ep1bwSKeiOi4nHptCR9PTNmel4PxrOSu4138ub5yce3dv8XFzwaiKZKofz9NfN3q
OTI+aSU7OSwwqFbBsq+zZD4oFbdEW5ETyFbRK1DqjrolGN7nH9rukMGMuMsR2EQhI2sCqHA3m3Ic
ha9w/T2qozFw5VJvjEVbSxY9cPStML/xbidCIdB3N5N6OlZfGBxVOLGrXPgcHojWSTO5kZNGWEGy
ptOR5EnkJXxTurGgYTtvQJxnkft0a7gkvHApUXoN+1xaqo5/0iJSJKXdnH7grgyuwGAqRBq73XuS
itWFQJ8PcuwbE4y39gJHIBmoCvLBwrwpLs1htfVZLbBhgffvPlDx+F7mQiySXRQYkrREM7DcsCq8
84ZKYPNkT9Jk/JexDGlfHgC3/afMmV+5L6ZhuE04rp2V2jaVjnBSUYf92EvGpOYOuVtBgs5kdb31
zWiozGYRbQXQiZsirC06S5fGsuxh8OchAvyHp0D1EmaFvVbMgk9bRbN7bBIyLifHei1oh0+vXJTg
os4PGvBPkljNMpONjE69aElJLd29MlKy3dR0lbBMNMAsk02MktlCGRHp1F73KjxXH9WnTr5pVmVr
t8FHJ3QkV20H8SJLwUThBbtUkMib2IfL/LB051dp5Z9VWn8E56TGewqVhlHAmWrphJbE5F7vJ08A
bJA=
=svvr
-----END PGP SIGNATURE-----

--MhvaDTCQzm390CuA8VY5jgge6KVQPick5--
