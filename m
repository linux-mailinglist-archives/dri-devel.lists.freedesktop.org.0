Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1246D1DBE
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 12:16:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E05110F1A0;
	Fri, 31 Mar 2023 10:16:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Fri, 31 Mar 2023 10:16:07 UTC
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4C9A10F1A0
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 10:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1680257767; x=1711793767;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=orqfeghqH4zHO2/uMXU2ntP81yDrZCI5FsJrO4csPzg=;
 b=StTzru2VRt0oD6fM8OuYIJB9EUlHw7YqWK7yYlB8qT4OAJWwAGnuuZ9+
 I3BQCj/e4I5twZjze/I2H0/99y1rcI6lf37NWb2/XetH0k6ZUlMMPbjbs
 9oQOOSSqRjJTcqSdOVjbR0kh1npVyWKRM/Cf4Jku9cUUnmliWC+AFUHUr
 IcRbxdd1I7oED8CZYBRgH/2MhhzF6NbpE5+YBAuKkow79lrEbMOXatKcb
 fxbP0LDzs4ReqznYHfT9MojplrNLji8CRV3MSCqHDz+26a+t8YdwezI1w
 u1mUpo0QxYGmqRPUl9IFn119E5oNDRLVp18HiE6JqWJ19RPLI93a6uGoN w==;
X-IronPort-AV: E=Sophos;i="5.98,307,1673938800"; 
 d="asc'?scan'208";a="207166712"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 31 Mar 2023 03:08:59 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 31 Mar 2023 03:08:59 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 31 Mar 2023 03:08:56 -0700
Date: Fri, 31 Mar 2023 11:08:43 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: [PATCH v3 0/4] docs & checkpatch: allow Closes tags with links
Message-ID: <cf5a3e73-c97d-4f98-80d7-4bcc68eb557a@spud>
References: <20230314-doc-checkpatch-closes-tag-v3-0-d1bdcf31c71c@tessares.net>
 <2194d19d-f195-1a1e-41fc-7827ae569351@leemhuis.info>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="sMLH2/sMXXEvCsA+"
Content-Disposition: inline
In-Reply-To: <2194d19d-f195-1a1e-41fc-7827ae569351@leemhuis.info>
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
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Dwaipayan Ray <dwaipayanray1@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Joe Perches <joe@perches.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Andy Whitcroft <apw@canonical.com>,
 Matthieu Baerts <matthieu.baerts@tessares.net>,
 Andrew Morton <akpm@linux-foundation.org>, mptcp@lists.linux.dev,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--sMLH2/sMXXEvCsA+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 31, 2023 at 11:39:22AM +0200, Thorsten Leemhuis wrote:

> -Please check the link to make sure that it is actually working and points
> -to the relevant message.
> +If the URL points to a bug report that is fixed by the patch, use 'Close=
s:'
> +instead.

This is not specifically a comment about your additional diff, but this
sprang to mind (again) while reading it.
I have been wondering if this sort of thing will lead to inconsistency.=20
Reports sometimes report more than one issue at once. Other times a
patch that is (intentionally) not a complete fix for the problem.
Using Closes: in those cases is not really true, as it does not close
the report.
Having a series of N patches, each of which purport to close an issue,
also doesn't seem quite right.
The word Closes has a meaning and "forcing" the use of Closes: for
reports implies meaning that may not be present.

I suppose it is true that just because documentation or checkpatch says
to do something, doesn't mean that you **have** to do it but I don't
want to be the one on the Rx side of a rant...


--sMLH2/sMXXEvCsA+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZCaxKgAKCRB4tDGHoIJi
0tXzAQDYkO5GAuTFyz0Dvwf4L1NEyHqz2c9/ib0AqzTqT2eJDAD+LHrHwO6Glr7O
3EOtr+9fzQGH1+jlQnxnBRaF2dYZjQE=
=47sB
-----END PGP SIGNATURE-----

--sMLH2/sMXXEvCsA+--
