Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF15735E8F
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 16:02:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2B5089AB6;
	Wed,  5 Jun 2019 14:02:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBFD789AB6
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 14:02:50 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id a9so17763000lff.7
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2019 07:02:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=Om7E3F7A5LaOQSCRkQBKtkOe/WUigxavUZDJItpQoC0=;
 b=f+87mWKgsRRH9tCW7JN8azwyXTX0xmJR4sq2MGqv6wxICyz2jYui0hzch/CbD5h493
 8AUKcri71ZRu4SNildp/ybX5KLNTq5HXawi9YHrPZAeqjxhPc9N7pcCYlXdD78/BhjwF
 iwe+cafTzlBUvnd97YTrU3tmNhXQSLhqey4WwOZeQQ7yZFkqj6p57TqW7lR4S2l/Hnb5
 WyLt287xStac+OQLAZpWmqlRM+2/9ifU5huC6LQvOlGqshez5dhYyvb3HrThKWDXZU2I
 WLHpV5pNL4S+F4jTf4LkXQAPFD1SpSZM8Wb1N2J71ptSDV7qZBVSK9xAsfPO932EsVQB
 jE+Q==
X-Gm-Message-State: APjAAAXfzvMzjmQmmXMI4SK2zIK3Yxq4sLSODns0GUECwsWSml+EjNW3
 m7GLx2FLbnLcuz0kpoAxEg4=
X-Google-Smtp-Source: APXvYqxJM3hYjKEq/PjJnW3ty19htRECDmZ4ObYQZXPfWelAu/10s9/iOI2yzseW8FqtYQDCNKSw0w==
X-Received: by 2002:ac2:424b:: with SMTP id m11mr19721208lfl.163.1559743369307; 
 Wed, 05 Jun 2019 07:02:49 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id y4sm4367442lje.24.2019.06.05.07.02.47
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 05 Jun 2019 07:02:48 -0700 (PDT)
Date: Wed, 5 Jun 2019 17:02:36 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Pintu Agarwal <pintu.ping@gmail.com>
Subject: Re: dpms mode change with wayland on iMX.6
Message-ID: <20190605170236.23be1710@eldfell.localdomain>
In-Reply-To: <CAOuPNLgUBDJ3qhD5mzQ6kYbpO7RHa7EhkfR668wtL6rkhY_s2g@mail.gmail.com>
References: <CAOuPNLgUBDJ3qhD5mzQ6kYbpO7RHa7EhkfR668wtL6rkhY_s2g@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=Om7E3F7A5LaOQSCRkQBKtkOe/WUigxavUZDJItpQoC0=;
 b=f3CEHqHDA0wJgj3SAhEtFJg5BGgOZiVV1ohPkIaUp8uTU7SFRka668ypfxQ1Eq/1VW
 036CPze9J69Zq6L7V01JRyizZYERe4hbp57ypMcs2ZdEUeHI5tnKIE0L58LWYSotwv6E
 XAjhUXaXm+ymOrNYmY+DDHkXLhlyGIWj2HvfxD1M3BRXU+tvi7gTlK3LJaFNmfYec16B
 Hca2H+YNyVEauA4w/Elijk6xi1gX5o5FO0ihsPNALwFRsFqMFjAK3rKObkaIX6/pQeJ0
 z1pT2BD3dv2LXKRNL898Mn6AFB/AvN4BHBBpOjtKnRxxfeg3K252lexE8zS3uvlDjZ+p
 L8yA==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: paulo.r.zanoni@intel.com, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0403262888=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0403262888==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/sRV6gpY3aBLUwzh/BNqJGB2"; protocol="application/pgp-signature"

--Sig_/sRV6gpY3aBLUwzh/BNqJGB2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 27 May 2019 12:41:43 +0530
Pintu Agarwal <pintu.ping@gmail.com> wrote:

> Dear All,
>=20
> I have a iMX.6 (arm 32) board with Linux Kernel 3.10 and debian
> platform running.
> The board is connected to one LCD screen and one HDMI monitor.
> It have DRM + Wayland setup for display.
> Also, I noticed that it have two dri interface:
> /dev/dri/card0
> /dev/dri/card1
>=20
> I am not very familiar with Linux Graphics/Display subsystem, so I am
> looking for some help here.
>=20
> My requirement is that I have turn off HDMI display screen using a
> command line utility or test program.
> I learn that for X-server we can use xset : xset dpms force off (and
> it works on my ubuntu desktop with 16.04).
>=20
> However this command does not exists on my board.
> So, my question is:
> Is there any equivalent DPMS commands for Wayland/Wetson?

Hi,

there is not. A proper solution is to teach the display server (e.g.
Weston) toggle DPMS according to the conditions you need. If DPMS must
be controlled from outside of the display server, you have to invent
the necessary protocol extension (Wayland, D-Bus, something else...)
yourself.

> Then, when I try to run it using below command:
> # ./proptest.out 29 connector 2 3
>=20
> The program just returns successfully without any errors, but nothing
> happens. The display does not turns off.
> I saw that in my kernel 3.10 the ioctl(DRM_IOCTL_MODE_SETPROPERTY) is
> already supported under DRM.
>=20
> So, I am wondering what is the right way to verify DPMS mode property
> on wayland ?

You can probably read the property via DRM, but on DRM KMS there is no
way to set it unless you are the DRM master. The idea is that the
currently active display server is in control, and there is no way to
bypass it as long as it is active (is "DRM master").

Wayland is not a display server. Wayland is just an interface to some
display servers, and by design Wayland does not expose hardware knobs
like DPMS directly, unless you make your own Wayland extension for it.


Thanks,
pq

--Sig_/sRV6gpY3aBLUwzh/BNqJGB2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAlz3y3wACgkQI1/ltBGq
qqdJFxAAjVtHff9KqmxLTGOK9YWoJ0cS9QBgUXhrsynaDhkHzRBM1sTcZhy0D9eC
BSqqKAXPvkFVNgm4dSDBUELsrFaUkziNZXk8XGVHUlf4GKDV54gQJD1tlqOAhkq9
izjOHsKqB4Ev+rLhQ9t3aCnzyG35vHdl7FDNvJjbPUou9Y6v7e2AxSvxtPWK9SHV
Gdl9L2vSRanEWg/A+rijUtbLGWJ1G1Cprl4VbvSRCR9htE5CK8cKP73mshUuuwEb
pMPrcsvFBSjWjrofagu224qa7onUauPcEPdd7LOIeF0F3/Pi6+zEMJjYXm14HSNb
2NS0acz3Z41OX31Ruw4PxU2fWOaN2gLLmY9YUlkaGAQrpVtaW2LjohGX7N1WyudB
wlBshHdoXI7sW8KnPRRh2Ze6Uf3RJdJUuqQS5/S1WrY1JKsafI5E+3/NXo0RkV2T
ElTKKOPaPzlwBFtOp5TDpaqAf3zScOwYBQW9hgvcYOYzI2kvvsmSSGTa/NLZ2pT9
qLgqcmBdOIPFpLGEbtLFK2b1NOC77DsKRVNMKma3eyzCaXQZ8GUvaoZm7y4p8FDS
PhdCCgSdLEReXc++NTjtlSVdRIhY3CuDyTcT2Xhn+rfjsC+gQWVmFY4wZn2l/AdY
smgkc2knxJNqVycOgVEzV1ZlcTq6+umktox6mhrNEMstEwiw4L4=
=3wbK
-----END PGP SIGNATURE-----

--Sig_/sRV6gpY3aBLUwzh/BNqJGB2--

--===============0403262888==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0403262888==--
