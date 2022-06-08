Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E96542891
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 09:54:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A579C10E08E;
	Wed,  8 Jun 2022 07:53:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14EE810E08E;
 Wed,  8 Jun 2022 07:53:59 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id u23so31979122lfc.1;
 Wed, 08 Jun 2022 00:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=51i10BfDgoaO6dLGYDlXTEEIUhsoXqykHU3IKn8w6a4=;
 b=efRPauAmO5nIgyNVLhKOlt3x88Rri8YoK4P+2PHMWKdC9Q1Ggtt2CrD6E+jPkzaZYM
 Q/Smx1PglyKfj6ApjEjRcw89pn1d3ULMOBuEtuoGMQxk/XshDkcMofPv80JUi4FavaJL
 BaFDtxUNhDXrd37eaJBO5r7Q1xkxkjJYKMhpXlbWDFc4wsF7rTBEKCdO9617fu8ioQZU
 DktIouiZAI95m6yDEGy6sR2ny/A2CJ6VtH99ktkXjBiJCfBDHME7Nw4cfY/9MggS+V+B
 Mehquc8QMUUlQJI+Ak1dc38qxB2Vr3vZRRCKwWia3X47XKNIuys0l4jgrludJaWMHkVi
 p4wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=51i10BfDgoaO6dLGYDlXTEEIUhsoXqykHU3IKn8w6a4=;
 b=Xy4M6GSHQH8UdUT4d5MmpKvbLchTzAobfQtji6Xs5o/L2zAyrnkr0VZUxn3Y09OBZk
 5M3cmh0NZNKHCOgqCmLX5WbWh3BGCwU0Zaiw2l50V1BAtFitt3sbVVUQOKcCf86oQo5V
 vIHvOawLT76qKg8e/LrRShHSetLyl0iTnV9h5HTpVOFZn6GXR3vtGVWBfUzg01VOH74a
 C0cX+vL9dOWqBgD7YAFucCYrS7gDShfMAImHpmMcU5l3d5GVcW1nGdjLtwuu7uGc6PPt
 JKbLlKLJKj2CeQGgCEYnSbzOQpDOrneAiJNlVtj8kPxQAclYaAx1oT4/r1+g543gpMJE
 xD9A==
X-Gm-Message-State: AOAM533wkzYII7DCWd9YJAQQk1bW0raLwsWQ2+6TC3oGwc/tKKsLYc15
 9Q9oVcDN5iBUevVgTtzwsGM=
X-Google-Smtp-Source: ABdhPJyA2PpWyycZAXPLDGEFTy8Qy02U2YDbONoob6nOyTUH9WMc3fZ6qH0T7vN6kr+MQgjl72KjSw==
X-Received: by 2002:a05:6512:32c5:b0:47a:28a2:bfe with SMTP id
 f5-20020a05651232c500b0047a28a20bfemr466889lfg.239.1654674837277; 
 Wed, 08 Jun 2022 00:53:57 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 dt27-20020a0565122a9b00b004790c425b35sm3140080lfb.291.2022.06.08.00.53.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 00:53:56 -0700 (PDT)
Date: Wed, 8 Jun 2022 10:53:54 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 0/6] drm: Add mouse cursor hotspot support to atomic KMS
Message-ID: <20220608105354.6bf881d0@eldfell>
In-Reply-To: <20220607143023.jz5qt2jktusstb5t@sirius.home.kraxel.org>
References: <20220602154243.1015688-1-zack@kde.org>
 <wRnf-Lm5zz6v1e-NlnFPteyARuLl-R98mOZZVjePHD5ue7QQNR_TSU7RwYBssgUa7xM5hf7Fe59-gMEj81ESrHY3mu_H7yE0dtGhFHFPTnc=@emersion.fr>
 <20220607110707.02eccda5@eldfell>
 <20220607143023.jz5qt2jktusstb5t@sirius.home.kraxel.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vubopZKadvQOPNGXqgGZczX";
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
Cc: krastevm@vmware.com, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 Hans de Goede <hdegoede@redhat.com>, mombasawalam@vmware.com,
 Thomas Zimmermann <tzimmermann@suse.de>,
 wayland-devel <wayland-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/vubopZKadvQOPNGXqgGZczX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 7 Jun 2022 16:30:23 +0200
Gerd Hoffmann <kraxel@redhat.com> wrote:

> > Why are pointer cursors misplaced on paravirtualized drivers?
> >=20
> > It is because the paravirtualized drivers or VM viewers do *not* place
> > the cursor plane at the CRTC_X, CRTC_Y position in the guest CRTC area.
> > This is obvious: if CRTC_X, CRTC_Y were honoured, there would be no
> > misplacement.
> >=20
> > Instead, the VM stack plays clever tricks with cursor planes. I have
> > understood only one of those tricks, and it goes something like this.
> > To improve hand-eye coordination, that is to reduce the hand-to-eye
> > response time a.k.a latency, the VM guest KMS driver relays the cursor
> > plane separately to the VM viewer application. =20
>=20
> Yes, the cursor is sent separately.
>=20
> > The VM viewer application presents the cursor plane content by pushing
> > them to the host window system as the pointer cursor. =20
>=20
> Yes (i.e. gdk_window_set_cursor() on the host).
>=20
> > This means the host window system will be autonomously moving the
> > cursor plane image around, completely disregarding what the guest KMS
> > client programmed into CRTC_X, CRTC_Y. =20
>=20
> Yes.
>=20
> That is combined with a virtual input device sending absolute
> coordinates (i.e. tablet), so mouse clicks land at the correct place.
> And that is the point where having the hotspot information is essential
> on the host side.

Hi Gerd,

thanks for confirming.

> > Given this UAPI contract, it is very easy for userspace to make the
> > conclusion that a cursor plane is just another plane it can use for
> > whatever it wants. Weston and wlroots indeed leverage this, putting
> > also normal windows and other stuff to the cursor plane when they
> > happen to fit. =20
>=20
> virtual machine display devices typically offer small (64x64) cursor
> planes, so unlike the 512x512 planes I've seen offered by i915 they are
> hardly usable for anything but cursors.  Likewise additional overlay
> planes typically not offered, so the classic primary+cursor setup is
> pretty much the only reasonable option userspace has.

weston-simple-shm is 256x256, and has been demonstrated to go flying in
e.g. vmware environments:
https://oftc.irclog.whitequark.org/dri-devel/2022-06-06#30987017;

If KMS exposes planes, then userspace will try hard to make use of them
as much as possible. It's not unimaginable that there could also be
some small icon generated by the window system overlaying an
application window. That might fit a tiny cursor plane perfectly.

> > I believe the solution has two parts:
> >=20
> > - The guest KMS driver needs to know whether the guest userspace is
> >   prepared for the cursor plane being commandeered. If userspace does
> >   not indicate it is prepared for it, commandeering must not happen. =20
>=20
> Yes.  That isn't much of a problem in practice though due to the limited
> driver/device offerings outlined above.
>=20
> > - Cursor hotspot needs new KMS properties, and a KMS client must set
> >   them if the KMS client indicates it is prepared for cursor plane
> >   commandeering. =20
>=20
> Yes, and that is what hurts in practice and thus caused the blacklists
> being created.
>=20
> > There are further problems with cursor plane commandeering. The 2020
> > email thread Simon linked to discusses the problem of pointer devices:
> > if VM guest userspace takes pointer input from multiple sources, how
> > will the VM stack know which virtual input device, if any, should drive
> > the cursor plane position? =20
>=20
> Typically there is a communication path from guest to host for pointer
> movements (i.e. crtc_x + crtc_y updates), so the host knows where the
> guest wants the cursor plane being placed.  So in case the pointer is
> moved by other means (different input device, some application warping
> the pointer, ...) the host can adapt.

Would it not be better to be explicit about it? To avoid fragile
heuristics.

> Nevertheless behavior is not consistent here because in some cases the
> feedback loop is not wired up end-to-end.  The spice protocol has a
> message type for that, so pointer warps work.  The vnc protocol has not,
> so they don't.
>=20
> > To me the answer to this question seems it could be intimately tied to
> > the first problem: commandeering the cursor plane is allowed only if
> > guest userspace tells the guest KMS driver which input device the
> > cursor plane shall be related to. If no input device is indicated,
> > then commandeering must not happen. =20
>=20
> Why require an input device?  I just don't see how that would help.
>=20
> For allowing the host freely move around the cursor place
> ("commandeering") I do see the point in enforcing that from a design
> point of view, although I doubt it'll buy us much in practice given we
> have broken drivers in the wild so userspace will continue to work with
> blacklists.
>=20
> Having some capability to negotiate "commandeering" between kernel and
> userspace certainly makes sense, so we can get of the black lists
> long-term (although it'll probably takes a few years ...).

Yes, there is no quick solution that I can imagine. Propagating the
fixes takes time. I don't think the deny-lists will ever be completely
removed, because people may run old or LTS kernels which won't be
getting new UAPI I presume. The only thing I can imagine happening is
that the deny-lists get overridden if the userspace software detects
kernel support for the new negotiation UAPI. Then the negotiation UAPI
takes precedence and the deny-list becomes ineffective.

> > I can understand if people do not want to tackle this question,
> > because it probably has not been a problem yet. =20
>=20
> On a standard guest this isn't a problem indeed because there is only
> one input device and only one crtc.
>=20
> It actually is a problem for multihead configurations though.  Having
> some way to map input devices to scanouts would actually be helpful.
> Years ago I checked how this works for touchscreens to see whenever it
> is possible to leverage that for VMs somehow.  There wasn't some obvious
> way, and I forgot the details meanwhile ...

Ah, that's the other way around, right? To tell guest OS which output
an absolute input device is relative to?

For bare hardware touchscreens we have some vague convention of using
udev device properties to tag an input device with an output name.

The first attempt at it was libinput_device_get_output_name():
https://wayland.freedesktop.org/libinput/doc/latest/api/group__device.html#=
gab86a05e7a220d6ccd0d45a79d85339dd
But using it is discouraged because of being too vaguely defined what
the value is. Weston uses the discouraged API still, and I'm not aware
of any better standard having been developed.

Having a standard for naming outputs is hard it seems, and there is
also the connector vs. monitor dilemma. I guess absolute input devices
would usually want to be associated with the (real or virtual) monitor
regardless of which (real or virtual) connector it is connected to.


Thanks,
pq

--Sig_/vubopZKadvQOPNGXqgGZczX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmKgVZIACgkQI1/ltBGq
qqejIA/+NX7A7uRmHAZ3x8uV8XiG3AM9knrzjw670lhrpzxyCGJPAKWXZaWiyiVX
cp6+3EMoEsKIo8TsAkRU1jzrlEmDq/qGZ2qdSYhVYvOxlglZL0t0e/Ig4FfzQ0V4
gupcVOfNKXxVyHwKCfMY3Y6GL/8aRphCNZoyYH/cYrURwfCPa5HP+wsfODH3oODR
UHjXU+851BBvo7qShB/ZRGoNprvBY3P+cpPp7eo+HXed4UQ5CE9lTSInLetRneJt
lTdhutg76HklZuU/kIM6DcF/iknQWfjXaJoS2Vuyw76PFdp3R6MXUeZ6CwkppLek
szfvYuyqpYQ7GqA8KNAyrSC9v1YACOXp8iOj4j5HPjxzZntBbMJqJfQLxNE8HYRl
tWiWevkklFOk0cNleQI/jdkXX1VxxGWDqN/71Jka+IJcd+7dZEVX8b4rwn+Rntlz
gqxuMWCCD6Li8fPFMhLcuZcmyihQxlYnzYaoMExG7wo8+lyNaGg8QcORMTdSNaSQ
DWr4fFYTwyOjPX3bwzN6PjO5LsnxUyLcVjGth+tZliWp6qWILV27By/Xj9X3K69u
3FHsuyWYpd+5bYtWsMwSxa0fwv4VQe/mbaIsm4jZyn48jcelPH5CBDgqaH4mF41k
Z3fZVF6RQPqvl45AJ6IuBezhi4JqQ+ZpsEU8Id6B9JFyyxGIAmI=
=CLha
-----END PGP SIGNATURE-----

--Sig_/vubopZKadvQOPNGXqgGZczX--
