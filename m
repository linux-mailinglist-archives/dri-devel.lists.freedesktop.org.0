Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD66602620
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 09:48:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19B9010EECB;
	Tue, 18 Oct 2022 07:47:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6194F10EEBE;
 Tue, 18 Oct 2022 07:47:51 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id bp15so21199883lfb.13;
 Tue, 18 Oct 2022 00:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=dewPCCEmMHIWUTpgcqcgiU2S/wqNcFGxGwMrnZ1ItMY=;
 b=nd8IEfv4gvt9yImRyzyT3gqnnpOn4iaRzguMxpBmoQ9CYYkGu2cRuV0Yr/+iVevvoD
 gkl2aokK4j3LxJAZALB0ZaHIgXO5Ovx9q6jvzjN9FW6h4E1zqPdzi2k3EQ04amRz0ncJ
 y01jQzqllMawTHMsotTdpNiKSohbsBElSEqQjSAwRQN91mr1eZZwKzkRxMLTlSOTPHQp
 bCzotbZA7Z9TPNQlrbQjb1Ju0CWlJiZ9t9hYSYzuINApOhHhORtFxyYVSap70hkuwaVm
 9LqbAJb7y2UO0ZeOxSk/m0JLVDf3obE9SybixkK16hy8TkrA5iO2Uw1/hiRhn86KKdNz
 v2EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dewPCCEmMHIWUTpgcqcgiU2S/wqNcFGxGwMrnZ1ItMY=;
 b=c8UBudam2SiQs4WrAyjY1WEvmcempGpR1NBRJAfMek+u86imAxmuoi7gG6R+SajK9F
 xMz6ufVou3jeSySYlkSzvBxc/KiXuCAFOxrqt6399g2ovf/vm9q/DMIx6n1hFWRWXVWF
 rQ0/t71ytkxhQzj0tWs10m4SyWXyKwoF5Ygw+lAvBvDcttbexQCVzEjp0CjVc8NJuBdO
 +bv6koW7Vaki8mjRDEPQMG2nqvpsB8dR27+tYIFk7JnlumksOrJEQMXu/I0F1rvbiVEh
 /+l+wkjUDmH3FNJ05K3hdMRnkAWyNHCJcwROH4GTMR2StKKMLyZEpyfxUN73FyzCEzox
 6zsQ==
X-Gm-Message-State: ACrzQf0b8+fkhZZPUNuJu5+8ypHNTCNet2pvvX5kC+KaOYxwX92ZW46V
 boYb2zPqLW6gUCLdviIrMws1uyd/Bgk=
X-Google-Smtp-Source: AMsMyM7jC2SwV57PWsZ9T4hnWDlVhHACN9Ch85GpcMehubUGY/YWzaYr7hQ8CvvdpC64s/XgPGCAeA==
X-Received: by 2002:a05:6512:2290:b0:4a2:aa4d:b281 with SMTP id
 f16-20020a056512229000b004a2aa4db281mr623675lfu.616.1666079269357; 
 Tue, 18 Oct 2022 00:47:49 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 10-20020ac2568a000000b0049fbf5facf4sm1754239lfr.75.2022.10.18.00.47.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 00:47:48 -0700 (PDT)
Date: Tue, 18 Oct 2022 10:47:37 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: wayland-devel@lists.freedesktop.org
Subject: Paletted pixel formats could be supported in Wayland
Message-ID: <20221018104737.7660dccd@eldfell>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WyemlyoF3ZekikDUyPtB9vi";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/WyemlyoF3ZekikDUyPtB9vi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

once again I read some comments about how important paletted pixel
formats still are to some users. Here are some musings about how they
could be supported in Wayland, because I want to underline that Wayland
in no way denies paletted pixel formats; not for apps and not for
compositors.

Nothing stops Wayland compositors from using paletted pixel formats
towards hardware already, but it's not practical because the compositor
must convert from formats like ARGB8888 to paletted, which can be
costly. First, there needs to be a way for clients to deliver paletted
buffers, and second, there needs to be a way for the compositor to say
it prefers paletted pixel formats and the preferred palette.

We would need a Wayland extension, say, wp_color_palette, that can be
used to attach a palette to a wl_buffer. This can have the precondition
that the wl_buffer has a paletted pixel format and that the palette
matches the format. Compositors need to advertise paletted pixel
format support through the usual pixel format advertisements, but
produce a protocol error if such wl_buffer is attached anywhere without
a palette.

The palette itself could be a wl_buffer from the wl_shm factory. It can
be required to have width equal to the number of palette entries and
height=3D1 pixels. The pixel format of the palette buffer must not be
paletted itself, but otherwise it could be any ARGB or XRGB format if
such flexibility is useful. Or, the palette could be some completely
new structure. It's just that wl_shm already exists for CPU-accessible
mmapped pixel buffers, so it would be nice to re-use.

Nothing stops doing all that with dmabuf as well, if it had use.

The above would provide clients the ability to deliver arbitrary
paletted content, but the compositor might struggle to drive a paletted
framebuffer as the palette might not match the hardware.

wp_color_palette needs some way to give the preferred palette to
clients. Clients should use the preferred palette when possible.

A compositor would also want to produce a list of preferred pixel
formats. We have a precedent of this in zwp_linux_dmabuf_v1 in form of
the modifier feedback and similar design could be copied to apply to
wl_shm without modifiers. That would help clients to pick the best
pixel formats they can produce, e.g. a DRM_FORMAT_C4.

Who knows, maybe paletted pixel format support could be plumbed through
Xwayland too?

One important aspect is that any palette support must fit in with color
management as well. I believe that is achieved by using a palette to
map from DRM_FORMAT_Cx to ARGB, and then leaving the rest to the color
management extensions as they are defined, essentially making a
paletted buffer behave like an ARGB buffer.

Yes, this would allow paletted HDR content, as paradoxical as it might
be.

I see no fundamental or theoretical obstacles here, other than
difficulty of compositing with alpha. Maybe there would need to be an
option for fully transparent and fully opaque pixels with nothing in
between (no semi-transparent palette entries).

However, I have to leave any development in this direction to anyone
who actually needs this. I could take some part in reviewing the
protocol extension and Weston implementation, but that's all.


Thanks,
pq

--Sig_/WyemlyoF3ZekikDUyPtB9vi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmNOWhkACgkQI1/ltBGq
qqdtJA/9GbLDt5EiGVeHvLa766v93vp/eEjyVpNPptFJdq9RbBJM+ioSmmWaL9Q4
w+aRpXYpCovc4tjSDooeSPeB8AQjRY78iJ+lwhxl3IMlTkhF48ITrONrCwoImm6B
xLg9Np3Q9rtyob8ZyJZsVCHm0IhF6Z8Ih3VgwR1qCjzDwrMTKxhHh8jH4OJow91L
MfTDgBnf2CJ0JxvX6ejFGd3zfsXS/sbuI6+HMLYek7hbM+Th/1F4AVBZgqkk4DLc
lzNEwjoCf1POVnkbyGkXfktTh3pCB9qc8LbcSgLstX/5LM9JQndY+nDLqnAtmGsE
/oE/k2eYRZtaUddbMJJRyLn67Pdc7G1pgQMSNX5g0jHxM7vfeRwcDbxfYbe9CyZX
MdT0eIjjP/SW7XeS4JKLQwSpq0D48kfngCuxnyCPIwWabnExPvuJulaqLGigepLV
ZmoW5QWEZB5QIvIw8eu0ss3eV+YEzwgakEmNTqlc7tB9YJ+rfMtZniO/llbwyhUn
aN0v4oUhmhG9va4G4MgQwV7axB86PMUM6EN9yc3pZ1jznM7ArFafUl+gJzQSaWmb
QIKKZ4Yj/QHjwAL6FMGyVFKCqYuBFx+MH+zn2Dn0VJdEiAkJVGI2GFEtV5AbQt88
zeydSdZh9/rpmKzwyRPC6xxe9DMhGqbUSBnUaHxs5KZO33kF99Q=
=binv
-----END PGP SIGNATURE-----

--Sig_/WyemlyoF3ZekikDUyPtB9vi--
