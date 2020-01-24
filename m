Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6F214797E
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2020 09:38:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6FC66FF68;
	Fri, 24 Jan 2020 08:38:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57B736FF67;
 Fri, 24 Jan 2020 08:38:21 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id r19so1550416ljg.3;
 Fri, 24 Jan 2020 00:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=3kBwqqX5a4iLML1ghecnd++9ov87RfIlksT5zBEt2IE=;
 b=BXlI3KO7Z6J5X/CZyyrw2MoZ/E8DW/gzg3ObfIqXyygcJcWC8X6Tn8MhJ0cUVI7iPJ
 SfZ6G4LWEV+cTxmyJgRYFT2immBHmfKfN/41LFGusklAiK1R7ujLOWHmllVsMC6KsK32
 oUVj5/sRN6vJSJO/Ar6/gDdMqY8+ZoTw0KkbnbWMf1udxjcWMCz2oi574QQXZOvqMJbc
 VKsOy1nULKzmiZ7MYdzvdXnSrwDb7vt0aDyyIONzN3mTmUeBA1KZFv0bWx2ymmFFxYvo
 Di/T7gf8P7VloDGFdkxh6eBg4pOI+KK50/ZW5//ZU/0L4CtUSMaeOLF4iA7qEup2CVZj
 8/TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=3kBwqqX5a4iLML1ghecnd++9ov87RfIlksT5zBEt2IE=;
 b=GPu0R0fhSgtsI9RNKjC7OBmT+5V7ZYEizi2jRfQaJ3jrRLOon31wxuQZXf14naMy48
 ocbDfBAsVaZzMHWHq897345lE1m54FBxE8IMP5AQmR1CI0oXlrCdjTcgP1XTyAMTLWt9
 W2vg1bIUMjVyY7yHVeUyY5gyNhuvgtTPPTeLfDs74kAtB/T287lcp8ZxvTYVToLirGgT
 IFUcKnI6KyemqQT1qoT9XcX202QRiDw4JcMeyT7Hss8UmHZW6EAz3iyQ2P+zgXqjznOk
 h03M7F7S9hFSP8bC2pl5X0JUTZeN+nah0+FDVa7EdsY3Q/dbWkgL0jPgxXAZCSKiKkJO
 N05g==
X-Gm-Message-State: APjAAAU/Iod3qy/FX4nLmL8zaHTDH+7xCh0UHZbQCi9jp7JT9IH6rkkP
 cGbU358Rc6VtWYUagN+2l/E=
X-Google-Smtp-Source: APXvYqzzBU328Z+3Znbd9e2L+8Gp5UVVXGVjlFa6f4sipN0KAglycNtcSCjwTnXMw/wny41/de+DTQ==
X-Received: by 2002:a2e:93c5:: with SMTP id p5mr1609723ljh.192.1579855099570; 
 Fri, 24 Jan 2020 00:38:19 -0800 (PST)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id k1sm2634118lji.43.2020.01.24.00.38.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2020 00:38:19 -0800 (PST)
Date: Fri, 24 Jan 2020 10:38:15 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Matt Hoosier <matt.hoosier@gmail.com>
Subject: Re: backend-drm and scanning really large resolutions
Message-ID: <20200124103815.510be59b@eldfell.localdomain>
In-Reply-To: <20200124102505.31baceb3@eldfell.localdomain>
References: <CAJgxT3-cJu54Rn-9CstjaRHHtaJB_WK+R0RzKsDoK4TttDNFOg@mail.gmail.com>
 <20200120105812.20c56b65@eldfell.localdomain>
 <CAJgxT3-XVipi_k8LDaEjJjCj6ReBNLUyjF=xhkK1v0vceP_t6w@mail.gmail.com>
 <20200124102505.31baceb3@eldfell.localdomain>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 wayland mailing list <wayland-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1672492704=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1672492704==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Znp2/VguCMhoDUTS9kpj7L."; protocol="application/pgp-signature"

--Sig_/Znp2/VguCMhoDUTS9kpj7L.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 24 Jan 2020 10:25:05 +0200
Pekka Paalanen <ppaalanen@gmail.com> wrote:

> On Tue, 21 Jan 2020 08:51:26 -0600
> Matt Hoosier <matt.hoosier@gmail.com> wrote:
>=20
> > On Mon, Jan 20, 2020 at 2:58 AM Pekka Paalanen <ppaalanen@gmail.com> wr=
ote:
> >  =20
> > > On Fri, 17 Jan 2020 10:51:45 -0600
> > > Matt Hoosier <matt.hoosier@gmail.com> wrote:
> > >   =20
> > > > Hi all,
> > > >
> > > > I'm confronting a situation where the hardware with which I work is=
   =20
> > > capable   =20
> > > > of driving connectors at 4K or 8K, but doing so requires bonding the
> > > > scanning of multiple planes together.
> > > >
> > > > The scenario is that you'd have a big primary framebuffer whose siz=
e is   =20
> > > too   =20
> > > > large for an individual hardware scanning pipeline on the display
> > > > controller to traverse within its maximum allowed clock rate.
> > > >
> > > > The hardware supplier's approach is to assign multiple planes, whic=
h in   =20
> > > the   =20
> > > > KMS driver map to hardware scanning pipelines, to each be responsib=
le for
> > > > scanning a smaller section of the framebuffer. The planes are all  =
 =20
> > > assigned   =20
> > > > to the same CRTC, and in concert with each other they cover the who=
le   =20
> > > area   =20
> > > > of the framebuffer and CRTC.
> > > >
> > > > This sounds a little bit wild to me. I hadn't been aware it's even =
legal   =20
> > > to   =20
> > > > have more than one plane treated a the source of scanout for a sing=
le
> > > > framebuffer. Maybe that distinction isn't really relevant nowadays =
with
> > > > universal plane support.
> > > >
> > > > I'm wondering if anybody here knows whether this a legit approach f=
or a
> > > > compositor's DRM backend to take?   =20
> > >   =20
> >=20
> > Hi Pekka; thanks for the reply.
> >=20
> >  =20
> > >
> > > Hi,
> > >
> > > I was aware of tiled monitors that need two connectors driven by two
> > > CRTCs to cover the whole display, but that sounds new to me.
> > > Libweston/DRM still doesn't support tiled monitors.
> > >
> > > What a compositor's DRM-backend can or should do must be generic. It
> > > cannot be driver or hardware dependent, so handling your case special=
ly
> > > in userspace would need KMS UAPI to communicate the need in the first
> > > place. (There is no shared library for "KMS userspace drivers", yet at
> > > least.)
> > >
> > > I am not aware of any KMS UAPI that would indicate the need to use two
> > > primary planes in a specific configuration for a specific video mode.
> > > I'm saying two primary planes, because that is the only way I can see
> > > this situation even hinted at userspace with the current UAPI. I also
> > > don't know if multiple primary planes is allowed, but it certainly is
> > > not expected by userspace, so userspace can't make use of it as is.
> > >   =20
> >=20
> > Just to double-check: I think we're still talking here about
> > universal-plane mode, so we only mean "primary plane" in an informal se=
nse? =20
>=20
> Hi,
>=20
> I'm talking in both universal-planes and atomic modesetting mode. I
> always talk from the userspace point of view as I'm not a kernel
> developer. In my mind, the concept of "primary plane" does not exist
> before universal planes. There is only drmModeSetCrtc() in the
> pre-atomic world and that acts on a CRTC, not a plane, and assumes
> the FB must cover the whole CRTC area exactly and without scaling.
>=20
> IOW, there is no legacy UAPI that you could even use to poke more than
> one (primary) plane AFAIU.

...

> Besides, Weston is not at all the only display server you'd have to
> patch. There is Xorg/modesetting, every single DE that runs with
> Wayland, and all apps written for KMS directly. Even more, you also get
> to fix all apps that use DRM leases, which likely includes things like
> VR compositors.

Btw. GNOME/Wayland (Mutter) is only getting into atomic modesetting
soon(?), it has had a long road of re-architecting to get into a
position where it can start implementing atomic KMS usage. And
Xorg/modesetting is still legacy-only too, in spite of the poor attempt
to make it atomic which had to be disabled on the kernel DRM side, and
probably unlikely to ever be atomic really due to the amount of work
needed to make it fit in IIUC.


Thanks,
pq

--Sig_/Znp2/VguCMhoDUTS9kpj7L.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl4qrPcACgkQI1/ltBGq
qqdPSA//c9NSFKqyCDfjbZokksIgvnDzDsGgpN0ma304QzhB5VbRIOaHdmBb0w+M
Tk03cuLgZrizw7RJub5iY/eiQXPRh5xGxtD3E4jVuzONDdu/PW8TX8riaKMyyzHA
/n1O7wZrxahk3sqLaNBDnRpFYFtvWtRDErn5hcWowAXcarfCw9DhQ7U76wakzlLk
24af+Re9Gh8WtOr3IEOS23I9R48j3Zw38IzdXovaIIzXxRdVaklSxYnsTK4Pm2TO
sDENP5zg46K8zAymdyuCfUdICUvwCimzyFElgQVOsBbcD9GymG5MQZelNLPpkAfk
8aeNIaBUIBe8y3XJ22xL2w+7ODJkT5Lspa7r6E+0y45lOj0mJ2mKfTc8CktoD0C3
aQH9fagYTXtNpm4HNEFdF8+pgYmj67WxxKf2mqbotn33Aj/e1ABuNw5gv1ui27Bv
wKLIYH8HRVAkxoGm/s7k6BHUyt5tR62aFosYCyYajyqgxWYPNViMy+RVo0rCP0Wp
pQ6tfPWVV90fU+5pjD2+40Wx83/xmmrmRe6Mmlg+H0NQdLoG/m5cS28USj3NwvJJ
UOCTmJZUlWNKm1rqtu9vPTD0pJ2eCSuaY9n3uL+B4FbpmpHH537kFXl5hzIn/VIV
1rrTAsuo1s3Zu9JR5W/ZUhoyap0JTvx3kFCXB/VtwsJEG9Z/WWY=
=BFfm
-----END PGP SIGNATURE-----

--Sig_/Znp2/VguCMhoDUTS9kpj7L.--

--===============1672492704==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1672492704==--
