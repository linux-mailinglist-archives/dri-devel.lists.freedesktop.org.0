Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 975BD1DE38B
	for <lists+dri-devel@lfdr.de>; Fri, 22 May 2020 11:54:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 087AB6E3EF;
	Fri, 22 May 2020 09:54:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CF966E3EF
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 09:54:43 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id z206so2535299lfc.6
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 02:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=bxoZcJwd6Y00gtBECZ2i1wvljDs7+HmLkIfmenSN9WE=;
 b=XEy4NhXv+uM/flIlKz0ok0IDO2RR/+DJuZeouPJwhcoaGG9wgsxPcN/J2qvkHMRMTt
 e2X597iIADFhkv5eBybHz3H6bKHKU7QrvY6AKJZ8kKOzmf4Sri6Ai4JxiELZEvi0Be+L
 DIfigqRvZGPJhCQCDaszmWU+4h2Sn+6TRVCPl1RwcMvJCNHj8omtT5oFrTScZC3WGSlg
 ExcaCSn3SL6igncQKmB71oz0fxvGvrTuErQ2FEZGhiOHzkzuzElhf0LL1WcAJvOhoBuJ
 nWsQ5thv7w1quFBNjLnQ0HX7csDqkVqWgzGPo3ozIm/NT4bGll9DkUg0JfZ9zv6tnps3
 uqdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=bxoZcJwd6Y00gtBECZ2i1wvljDs7+HmLkIfmenSN9WE=;
 b=KO7O1EPR4b6cqm9iI3vrPmnNnVYZfyFwUjXkMDG6aEByfoSvk7Jeut9Oz1wMlIlxKN
 RzhGTO7wm3LoGBruf5DwfqGGnrrE2z0GRFel7QtIiDymIdGeZmSqq9Z37KVCdizn0BRz
 sXdhRdWoSaXcrzlastxPgWWgY0QD3K+16RjobjxNi+1GBL3TjUtGOZVxdPPZXdK/Ko6V
 iMGshw61IL0ZMC0AKeqX0AlAWZ2ZmJB5KDf2EpUMHCIzIR/yu6a3xY209I08tRRE9LdS
 1CsTQ2V1FwQrAm5DBcNP9EpsYS+1cz38yPbKay6uBefySwoOOkqilKlOYI6SYjUEn+eK
 4EIQ==
X-Gm-Message-State: AOAM532u5H0CP88rYlnNPE6HyY/huxBWIeQtWPdK0P6aTc5BXEw+j10t
 X9Evmdifyg3PFNd32KTWd6Q=
X-Google-Smtp-Source: ABdhPJxb+HW0ppytReJA/QeFQu+GcQNdr3ElBlvFc/ZDKmpnRc3vDEBu+n6p0P/1VxXMMqNQen0Dng==
X-Received: by 2002:a19:7909:: with SMTP id u9mr7121316lfc.130.1590141282016; 
 Fri, 22 May 2020 02:54:42 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id m13sm2329221lfk.12.2020.05.22.02.54.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 02:54:41 -0700 (PDT)
Date: Fri, 22 May 2020 12:54:32 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/doc: device hot-unplug for userspace
Message-ID: <20200522125432.0b49ea1a@eldfell.localdomain>
In-Reply-To: <CAKMK7uFzk7UW7k8WTMSzKynGOypQeTzhf9Gqxb4maimG+QEdiQ@mail.gmail.com>
References: <20200519100649.12053-1-ppaalanen@gmail.com>
 <20200520125556.GY206103@phenom.ffwll.local>
 <4Qkv4p0V0uG4sZ8LjizVLq6bLbZ8U1xAwQ0riB72aHH3sT_ZJYz9QzDFPWCko8PfcA-VGBFkGtCn1n9YfKYqo_vwzvE3BVQUlxyBq61GZ08=@emersion.fr>
 <CAKMK7uFzk7UW7k8WTMSzKynGOypQeTzhf9Gqxb4maimG+QEdiQ@mail.gmail.com>
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
Cc: Sean Paul <sean@poorly.run>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
Content-Type: multipart/mixed; boundary="===============0371635643=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0371635643==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/kQvXjS=wrJ667n5/8x.oDPG"; protocol="application/pgp-signature"

--Sig_/kQvXjS=wrJ667n5/8x.oDPG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 20 May 2020 16:19:00 +0200
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Wed, May 20, 2020 at 3:20 PM Simon Ser <contact@emersion.fr> wrote:
> >
> > On Wednesday, May 20, 2020 2:55 PM, Daniel Vetter <daniel@ffwll.ch> wro=
te:
> > =20
> > > Maybe we should add an explicit note that there's no guarantee about =
the
> > > new chardev minor this new device will get, it could both inherit the
> > > existing one (you can't open the old one anymore anyway) or get a new=
 one?
> > >
> > > Or does userspace want a guarantee, i.e. as long as there's still a h=
andle
> > > open kernel guarantees to not recycle the chardev minor (which is wha=
t we
> > > currently do). In that case better to add that to your list of guaran=
tees
> > > above. =20
> >
> > The are race conditions to consider too, e.g.
> >
> > - Compositor sends /dev/dri/card0 to a client
> > - card0 goes away
> > - Another device takes card0
> > - Client receives /dev/dri/card0 and then starts using it, but it's the
> >   wrong device =20
>=20
> Oh reminds me, what should we do about open() - that one will fail,
> the chardev is going away after all, not failing kinda doesn't make
> sense. And more tricky, about creating new leases?
>=20
> I think reasonable semantics here would be that both of these "create
> a new open drm fd" operations can fail as soon as the device is
> unplugged. Userspace needs to be able to deal with that.

Hi,

yeah, we can make mmap read/write end result undefined, recycle char
minors like pids, and let new open()s and new leases fail. Pretty much
everything Daniel and Simon said make sense to me.

I'll spin a v2, but maybe next week.

What about the drm_ioctl() issue Andrey pointed out?


Thanks,
pq

--Sig_/kQvXjS=wrJ667n5/8x.oDPG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl7HoVgACgkQI1/ltBGq
qqdVjRAAk+C/DJ1KUygYQlKx56orIy8l1wmZMEG35IKBiX8IMNiu2Pzr4zR/l9Ur
xaDziL32pnhw2hdIibpBTTxOhDn5z0t+/2wdK45coOBzVOMZo2DpFO559RT2PTfM
5tKKLdkiEnzGqHvjm2HyGflbAXZIlL/5b4NbOLQkxKD7Vb/PfOGgMGdkbXJVRiNZ
iTCZ5xMqnxx+LL0TcErJ2VP2XOSzgPeHh2g9cZlxHz0GD7eo+06eDiCdx8+DxlBX
g6PwAUru7ObsZFgk19SWYBuwWecPnd1cpa9m8Pmu7TpktJ14s7+PC0ZiNM8ohDoW
UHOA3Up0mpS5Ts2GrE1eEdBwXt4uhRk6PEMVQz6RvhcPlRe0SdsFONoaoujRavfe
fcQrxJOU/NdeaP3An6hxudlp39mi1PVpKImMUNTSUt7bnE750Qu3bSQ8kiixQ0c4
zRRzv0H30r6/sTwjc9PrScotbiYHCqml4w/W9GjuWMp6LTZnbD60sT+RFGXTxBRV
QnwA3k3+cXcjsAav7eWaKGPmk29oBgrT42WVYKSui0tynwlY/j88Nx4LD2C62z7E
hcVgCPv0Bnf8gHgZgj8jUP9quEs/QIQyeyIvd34GMB8IIImUvQXrWYlC8guZRunQ
PLEqvClalQZfHELO61EAjQSKGbSALOL0UHDUVPm8fezX6CZs3vI=
=MjR/
-----END PGP SIGNATURE-----

--Sig_/kQvXjS=wrJ667n5/8x.oDPG--

--===============0371635643==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0371635643==--
