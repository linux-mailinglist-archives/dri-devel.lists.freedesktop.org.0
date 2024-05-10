Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6F08C1EF7
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 09:29:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E62610E00C;
	Fri, 10 May 2024 07:29:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=haloniitty.fi header.i=@haloniitty.fi header.b="ZtbpYljy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from whm50.louhi.net (whm50.louhi.net [77.240.19.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 690AF10E00C
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 07:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=haloniitty.fi; s=default; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tDeBDTlHhRotNJXbXQD3Xhybil+lKJGxwg0oZinj7HA=; b=ZtbpYljyIxDLeyBoqwPxMxsh6k
 TpCIvR5er9mKr05u9YolMcxmGgQinH9dsMYCrCAdkvyKHG3sU+F/AF5/W2OJE/QyeC0X7Tp6L3Jyo
 fIEOMxDR3dmGNPvi1kJv+FhSDJLt+/r6dROJqFu1ZM/1UJ3AZi5+1eRzNp482vbUgCvPzVD9MwRsl
 A0FTlWylDqaAanYXpZUx3QDKJ8daAE73VKpRQM3+5px+X6qNWxm6LiiInZqZlZKBABd4PmlSqjS5c
 bfaj42jAEOKk3ys+cOIOcfLW8NyA+IQFMsJPz+D9N0052u3jJQUuJXzORCubIpqnaJWUrtMx83uxZ
 mrvTyH5A==;
Received: from [194.136.85.206] (port=47052 helo=eldfell)
 by whm50.louhi.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <pekka.paalanen@haloniitty.fi>) id 1s5Kgr-00015I-0q;
 Fri, 10 May 2024 10:29:13 +0300
Date: Fri, 10 May 2024 10:29:05 +0300
From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
To: nerdopolis <bluescreen_avenger@verizon.net>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: simpledrm, running display servers, and drivers replacing
 simpledrm while the display server is running
Message-ID: <20240510102905.4a19f5da@eldfell>
In-Reply-To: <9215788.EvYhyI6sBW@nerdopolis2>
References: <9215788.EvYhyI6sBW.ref@nerdopolis2>
 <9215788.EvYhyI6sBW@nerdopolis2>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/b8enHR9N0q+fhSJaW0i3ike";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - whm50.louhi.net
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - haloniitty.fi
X-Get-Message-Sender-Via: whm50.louhi.net: authenticated_id:
 pekka.paalanen@haloniitty.fi
X-Authenticated-Sender: whm50.louhi.net: pekka.paalanen@haloniitty.fi
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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

--Sig_/b8enHR9N0q+fhSJaW0i3ike
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 09 May 2024 09:06:29 -0400
nerdopolis <bluescreen_avenger@verizon.net> wrote:

> Hi
>=20
> So I have been made aware of an apparent race condition of some
> drivers taking a bit longer to load, which could lead to a possible
> race condition of display servers/greeters using the simpledrm
> device, and then experiencing problems once the real driver loads,
> the simpledrm device that the display servers are using as their
> primary GPU goes away.=20
>=20
> For example Weston crashes, Xorg crashes, wlroots seems to stay
> running, but doesn't draw anything on the screen, kwin aborts, This
> is if you boot on a QEMU machine with the virtio card, with
> modprobe.blacklist=3Dvirtio_gpu, and then, when the display server is
> running, run sudo modprobe virtio-gpu
>=20
> Namely, it's been recently reported here:
> https://github.com/sddm/sddm/issues/1917[1] and here
> https://github.com/systemd/systemd/issues/32509[2]
>=20
> My thinking: Instead of simpledrm's /dev/dri/card0 device going away
> when the real driver loads, is it possible for simpledrm to instead
> simulate an unplug of the fake display/CRTC? That way in theory, the
> simpledrm device will now be useless for drawing for drawing to the
> screen at that point, since the real driver is now taken over, but
> this way here, at least the display server doesn't lose its handles
> to the /dev/dri/card0 device, (and then maybe only remove itself once
> the final handle to it closes?)
>=20
> Is something like this possible to do with the way simpledrm works
> with the low level video memory? Or is this not possible?

Hi,

what you describe sounds similar to what has been agreed that drivers
should implement:
https://docs.kernel.org/gpu/drm-uapi.html#device-hot-unplug

That would be the first step. Then display servers would need fixing to
handle the hot-unplug. Then they would need to handle hot-plug of the
new DRM devices and ideally migrate to GPU accelerated compositing in
order to support GPU accelerated applications.

Simpledrm is not a GPU driver, and I assume that in the case you
describe, the GPU driver comes up later, just like the
hardware-specific display driver. Any userspace that initialized with
simpledrm will be using software rendering. Ideally if a hardware
rendering GPU driver turns up later and is usable with the displays,
userspace would migrate to that.

Essentially this is a display/GPU device switch. In general that's a
big problem, needing all applications to be able to handle a GPU
disappearing and another GPU appearing, and not die in between. For
the simpledrm case it is easier, because the migration is from no GPU
to a maybe GPU. So applications like Wayland clients could stay alive
as-is, they just don't use a GPU until they restart.

The problem is making display servers handle this switch of display
devices and a GPU hotplug. Theoretically I believe it is doable. E.g.
Weston used to be able to migrate from pixman-renderer to GL-renderer,
but I suspect it is lacking support for hot-unplug of the "main" DRM
display device.


Thanks,
pq

> Thanks
>=20
> --------
> [1] https://github.com/sddm/sddm/issues/1917
> [2] https://github.com/systemd/systemd/issues/32509


--Sig_/b8enHR9N0q+fhSJaW0i3ike
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmY9zMEACgkQI1/ltBGq
qqeHPA/8D/f09DWUu8IR7UFeuhY7DHD0PhmFrSa/SqczsaWtZ3zI17r/08jhCOCC
w56LznS6J0+OKkQ9lbVtcIVLY51in0sij0YBk/xefCcJGP8arKOE9XiRlm7AgR8/
e1HmK1IyumHWBKzhZHXPmlIQ2xz/f+JNbFGB9N9esQlbbfQLwIdJ1WdcXj+zGIyz
RdiLhkPjyrBdXfdneu/OI0R0kwwMD9zeEi0QaHunt8wgGoDDoWlA5oS2mHlH5aNf
y3Aop6ukkR3fnZ6JKcSY8C/Zg//m/Er4PcQrEZS2tbOEAEvUxJIrDIh4rD5qFpXO
NHtn+5stiZ9Q+SRuhn2/2z+x7u23L8xqGzQv/g3WaGDrcm07HPi49ulLRX9uhI+5
QYMTRBKlwslFGjjHRoiOY0LHCk4MVfjGdx3mZb81WDgJB12BXnw/+JIpW82JI0qc
nDhfeBYm9jezyQ8/WmHVfVJiz27gs26RbDFGovlhKjFJUyglhnpxsSgI6gcPJSOq
qyQLdMrRkLqwHx5h682RoEi1BTL3v3eM4YrhdKPt++xkCEQIftvWHB9POe29BhG/
4m9W5/RFTiKz/GiQVplBD5yhuWzQtCLXUeeQjV49ATpesX0RkuN+o7U8Bq7kfX+c
0B40eAIDtYr/dXBvLEfuu1aDmlMzXVA2PkUcAXS/v2oklLipeHU=
=oTtz
-----END PGP SIGNATURE-----

--Sig_/b8enHR9N0q+fhSJaW0i3ike--
