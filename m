Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D13762789
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 01:51:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E18C10E1B9;
	Tue, 25 Jul 2023 23:50:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1969010E1B9
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 23:50:58 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-3a3fbfb616dso3654387b6e.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 16:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690329057; x=1690933857;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MntZLPg9Q2TkUipdw5URIw2GbDHNmtTpFo/G9AqaGl8=;
 b=NcnLZAsl/ELgMGRZHqKtVn9uEWSI7mXT9tyTc3vBN6zCSfgBl5nNIoHcUbeHj/1bb1
 7TVWKeBXM4LVNKY3H4EEIOjYge9df3vlFwHI5CNoqM7xcvxhsu41x9CyjR/s9+wixj5Q
 OiUwuFf/2P+3gbuIAhnbc0y6qkVIo/7TPUHbRhhemeQF4w15VIgeziXSgkZuBvGvtxky
 75O3kuuW/8j7jeeC/gZJihv/Rj6o7OCKwuC6zsTWPp+SuTkt+qSvgZPDcM7pNgSYv5Dl
 ukVrDRTuD6SWugwpqvBKVt9kQVcW7K0gpLRcQzBha0H4iC5ImojFMbgRPMdTRzsIYpid
 42jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690329057; x=1690933857;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MntZLPg9Q2TkUipdw5URIw2GbDHNmtTpFo/G9AqaGl8=;
 b=AsIMNifx9gSAsyeMz62OnI3/ru287V0IHYBo6sYFGvFSdAfL108OM0KGnvz8SyKMRd
 gVtUUAIICMl4V0f36JZ3ibI3Fsxsv1yBBv3NBOwFMs60jvdk/Wdnj5fJEPwIOa2JtqDE
 Bo2raQ1HMsPE+NV8zG2g8jh0kz5xCHqbsDsODlsqwJTNjlligf6b5CTDMjf4mD1YhgxX
 oxJaM24SeHO8mWCcFX8K+5P/pehfl5136WwSg1n+kl4JynKK1arTEqJWrpyxcGj/V8uJ
 Zs2GaaUfgbBOf99ORxeRGr9EUrUe4FJbENv0nLA9X3bV9k6t2NZb/sc3JPo3546BiUbp
 stHg==
X-Gm-Message-State: ABy/qLZkOs+6+DIuubZmfsi1wsm/ITuB+g/3Al7iEM7ItRCraSN2C1Ls
 P9FRDi3VdcNuAe6+9SG69Yg=
X-Google-Smtp-Source: APBJJlHalXYmOhaEU6n05SNM4i/kOD7ydZDReFjh8w9A4vRIkL/8696/tstPkBJZxOJSkhZD6kYQEg==
X-Received: by 2002:a05:6808:1588:b0:3a4:232c:5d7e with SMTP id
 t8-20020a056808158800b003a4232c5d7emr476635oiw.5.1690329056959; 
 Tue, 25 Jul 2023 16:50:56 -0700 (PDT)
Received: from debian.me ([103.131.18.64]) by smtp.gmail.com with ESMTPSA id
 rj14-20020a17090b3e8e00b00267fe43f518sm110915pjb.23.2023.07.25.16.50.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 16:50:56 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id AD3F981944A1; Wed, 26 Jul 2023 06:50:53 +0700 (WIB)
Date: Wed, 26 Jul 2023 06:50:52 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
 Krystian Pradzynski <krystian.pradzynski@linux.intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>,
 hq.dev+kernel@msdfc.xyz, Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: Fwd: Unexplainable packet drop starting at v6.4
Message-ID: <ZMBf3Cu+MgXjOpvF@debian.me>
References: <e79edb0f-de89-5041-186f-987d30e0187c@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="OUAsi7azhbgmAo1h"
Content-Disposition: inline
In-Reply-To: <e79edb0f-de89-5041-186f-987d30e0187c@gmail.com>
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
Cc: Linux Networking <netdev@vger.kernel.org>,
 Linux Intel Ethernet Drivers <intel-wired-lan@lists.osuosl.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Regressions <regressions@lists.linux.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--OUAsi7azhbgmAo1h
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 18, 2023 at 07:51:24AM +0700, Bagas Sanjaya wrote:
> Hi,
>=20
> I notice a regression report on Bugzilla [1]. Quoting from it:
>=20
> > Hi,
> >=20
> > After I updated to 6.4 through Archlinux kernel update, suddenly I noti=
ced random packet losses on my routers like nodes. I have these networking =
relevant config on my nodes
> >=20
> > 1. Using archlinux
> > 2. Network config through systemd-networkd
> > 3. Using bird2 for BGP routing, but not relevant to this bug.
> > 4. Using nftables for traffic control, but seems not relevant to this b=
ug.=20
> > 5. Not using fail2ban like dymanic filtering tools, at least at L3/L4 l=
evel
> >=20
> > After I ruled out systemd-networkd, nftables related issues. I tracked =
down issues to kernel.
> >=20
> > Here's the tcpdump I'm seeing on one side of my node ""
> >=20
> > ```
> > sudo tcpdump -i fios_wan port 38851
> > tcpdump: verbose output suppressed, use -v[v]... for full protocol deco=
de
> > listening on fios_wan, link-type EN10MB (Ethernet), snapshot length 262=
144 bytes
> > 10:33:06.073236 IP [BOS1_NODE].38851 > [REDACTED_PUBLIC_IPv4_1].38851: =
UDP, length 148
> > 10:33:11.406607 IP [BOS1_NODE].38851 > [REDACTED_PUBLIC_IPv4_1].38851: =
UDP, length 148
> > 10:33:16.739969 IP [BOS1_NODE].38851 > [REDACTED_PUBLIC_IPv4_1].38851: =
UDP, length 148
> > 10:33:21.859856 IP [BOS1_NODE].38851 > [REDACTED_PUBLIC_IPv4_1].38851: =
UDP, length 148
> > 10:33:27.193176 IP [BOS1_NODE].38851 > [REDACTED_PUBLIC_IPv4_1].38851: =
UDP, length 148
> > 5 packets captured
> > 5 packets received by filter
> > 0 packets dropped by kernel
> > ```
> >=20
> > But on the other side "[REDACTED_PUBLIC_IPv4_1]", tcpdump is replying p=
ackets in this wireguard stream. So packet is lost somewhere in the link.
> >=20
> > From the otherside, I can do "mtr" to "[BOS1_NODE]"'s public IP and fou=
nd the moment the link got lost is right at "[BOS1_NODE]", that means "[BOS=
1_NODE]"'s networking stack completely drop the inbound packets from specif=
ic ip addresses.
> >=20
> > Some more digging
> >=20
> > 1. This situation began after booting in different delays. Sometimes ca=
n trigger after 30 seconds after booting, and sometimes will be after 18 ho=
urs or more.
> > 2. It can envolve into worse case that when I do "ip neigh show", the i=
pv4 ARP table and ipv6 neighbor discovery start to appear as "invalid", mea=
ning the internet is completely loss.
> > 3. When this happened to wan facing interface, it seems OK with lan fac=
ing interfaces. WAN interface was using Intel X710-T4L using i40e and lan s=
ide was using virtio
> > 4. I tried to bisect in between 6.3 and 6.4, and the first bad commit i=
t reports was "a3efabee5878b8d7b1863debb78cb7129d07a346". But this is not r=
elevant to networking at all, maybe it's the wrong commit to look at. At th=
e meantime, because I haven't found a reproducible way of 100% trigger the =
issue, it may be the case during bisect some "good" commits are actually ba=
d.=20
> > 5. I also tried to look at "dmesg", nothing interesting pop up. But I'l=
l make it available upon request.
> >=20
> > This is my first bug reports. Sorry for any confusion it may lead to an=
d thanks for reading.
>=20
> See Bugzilla for the full thread.
>=20
> Thorsten: The reporter had a bad bisect (some bad commits were marked as =
good
> instead), hence SoB chain for culprit (unrelated) ipvu commit is in To:
> list. I also asked the reporter (also in To:) to provide dmesg and request
> rerunning bisection, but he doesn't currently have a reliable reproducer.
> Is it the best I can do?
>=20
> Anyway, I'm adding this regression to be tracked in regzbot:
>=20
> #regzbot introduced: a3efabee5878b8 https://bugzilla.kernel.org/show_bug.=
cgi?id=3D217678
> #regzbot title: packet drop on Intel X710-T4L due to ipvu boot fix
>=20

This time, the bisection points out to v6.4 networking pull, so:

#regzbot introduced: 6e98b09da931a0

(also Cc: Linus.)

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--OUAsi7azhbgmAo1h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZMBf0wAKCRD2uYlJVVFO
o+/YAP0Z6eCcYl71Y1kT2UYGDBIwMXXiM7+aR40lhmu0mcdmbAEA9m/ui3/uZX51
DmktMr6iQDC9/1h00DKNiilDimu++go=
=+BBU
-----END PGP SIGNATURE-----

--OUAsi7azhbgmAo1h--
