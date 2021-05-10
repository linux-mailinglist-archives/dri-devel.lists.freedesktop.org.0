Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1A43784C0
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 13:20:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 828E56E10B;
	Mon, 10 May 2021 11:20:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25C0F6E10B;
 Mon, 10 May 2021 11:20:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CC8EA6101E;
 Mon, 10 May 2021 11:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620645601;
 bh=W7iAKST7BRDMlEttXNNjJ33EX76A4qp8I6GEgdSMv7U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gmDmb0dM5IcZQ9rSlubjtF+K7WR5CTuBYzK7hGG8NgJ6VoZl1xWTpOcwkH/5/0zA/
 vlx1VxEGYzpDqoIrEOS4Gq4vleDywsH/Tbkz7KjwQOxa0gHoTz3ZfhQBobu6oYwUNn
 Apktwvurhr0XmVvzqYbUbTW3FMnBkgNdhIrbGi6F2SzZTvdCwG1IcEdUG7Tg53VOjZ
 rsHYuTEPmzH2qPOyCxJC2wx/q7V+K8nhKe4JHOwCkQGI9ADck3Kw17WLNRkmbFOBip
 a9pcqsOJVVBc05NJGVPFoJfSO03eP8zjvIV4wRYaZYLrBIVfbDQLgQs1bXlcp7w7lK
 9KVTRb7Ve04dg==
Date: Mon, 10 May 2021 13:19:50 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: [PATCH 00/53] Get rid of UTF-8 chars that can be mapped as ASCII
Message-ID: <20210510131950.063f0608@coco.lan>
In-Reply-To: <c4479ced-f4d8-1a1e-ee54-9abc55344187@leemhuis.info>
References: <cover.1620641727.git.mchehab+huawei@kernel.org>
 <c4479ced-f4d8-1a1e-ee54-9abc55344187@leemhuis.info>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: alsa-devel@alsa-project.org, kvm@vger.kernel.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>, linux-iio@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-fpga@vger.kernel.org,
 dri-devel@lists.freedesktop.org, keyrings@vger.kernel.org,
 linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, x86@kernel.org, linux-acpi@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-input@vger.kernel.org,
 linux-ext4@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-sgx@vger.kernel.org, coresight@lists.linaro.org, rcu@vger.kernel.org,
 mjpeg-users@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org,
 linux-edac@vger.kernel.org, linux-hwmon@vger.kernel.org,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-integrity@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Em Mon, 10 May 2021 12:52:44 +0200
Thorsten Leemhuis <linux@leemhuis.info> escreveu:

> On 10.05.21 12:26, Mauro Carvalho Chehab wrote:
> >
> > As Linux developers are all around the globe, and not everybody has UTF=
-8
> > as their default charset, better to use UTF-8 only on cases where it is=
 really
> > needed.
> > [=E2=80=A6]
> > The remaining patches on series address such cases on *.rst files and=20
> > inside the Documentation/ABI, using this perl map table in order to do =
the
> > charset conversion:
> >=20
> > my %char_map =3D (
> > [=E2=80=A6]
> > 	0x2013 =3D> '-',		# EN DASH
> > 	0x2014 =3D> '-',		# EM DASH =20


> I might be performing bike shedding here, but wouldn't it be better to
> replace those two with "--", as explained in
> https://en.wikipedia.org/wiki/Dash#Approximating_the_em_dash_with_two_or_=
three_hyphens
>=20
> For EM DASH there seems to be even "---", but I'd say that is a bit too
> much.

Yeah, we can do, instead:

 	0x2013 =3D> '--',		# EN DASH
 	0x2014 =3D> '---',	# EM DASH =20

I was actually in doubt about those ;-)

Btw, when producing HTML documentation,  Sphinx should convert:
	-- into EN DASH
and:
	--- into EM DASH

So, the resulting html will be identical.

> Or do you fear the extra work as some lines then might break the
> 80-character limit then?

No, I suspect that the line size won't be an issue. Some care should
taken when EN DASH and EM DASH are used inside tables.

Thanks,
Mauro
