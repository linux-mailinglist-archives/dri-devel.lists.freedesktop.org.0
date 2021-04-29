Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8A936E80A
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 11:33:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 752576E1E8;
	Thu, 29 Apr 2021 09:33:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A86D6E1E8;
 Thu, 29 Apr 2021 09:33:02 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 754625C00A4;
 Thu, 29 Apr 2021 05:33:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 29 Apr 2021 05:33:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=wHOUM95azCkgVTH4CxVG4/CaVgP
 xJ/5LlHYNA3yt23E=; b=MaWrZosRke+exVrx4/Y2VkbBuaENdN0COYGy5NiH+nY
 g1nozJzo1FVxEE1XDj62cXnvd9T4rBUGPqgKCj34wh6/pm++OZEjztpKEkSk2b9/
 x1erFL3Qc6+Dx+onA/Lz52ASrf7q7Sg6A5cXg6mj49aMUkE0GxedUYCYXuzUw4PL
 0WUKhiSW7qsMOLXeb7cqg3vbLU5WyPdFLpFH1c0tMMrpHGQ+yPCF4JsofDU94MvF
 iqx7rUb4kKshcHxsuBoFCYKDghReV9hUYht/hg5nS+kmxgVylFrscUAjzaVlINQt
 GZ9KfudG6msAokvrfVwz4Ngmfsn5PVDCGHfykOeEH4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=wHOUM9
 5azCkgVTH4CxVG4/CaVgPxJ/5LlHYNA3yt23E=; b=BrF/81zNtKkvFB/0mDb02W
 Iw8JpcriymliHbyw8i94qSYPpHKf6ZRjNLot7gQlEMMFPFdJnBK8N7cKDKzVvkMC
 t+JRauSRBB+r70djqxaVi93nBfWsSULI7k+GRXsmdQdyxpyfPgmUc8+su9Vt+ThO
 VhZxkjHmZDJbW20478QbPOc7vcugAM3Z+C0Ro5IhTDVpeu/0TXmay+slGxRuXGKu
 awC8cfccTJCuKRz8d9nd+xgyJby9TndLtrB0XDMdzFHcV9fGZhiTE6Krjsn2lhcF
 Zu+ZG1C+8i6yFC6M7r9C8YrjnkRiuEVK52AGlB76UE+FJI7LYXEzHglKd1iboNXQ
 ==
X-ME-Sender: <xms:TH2KYPHVcZI1IIJPz1RDBIh0E1dCegOgUHMopGj284v8T0yeoKrJPw>
 <xme:TH2KYMW50CCGv6nB0KrG3Hd78Jb4-ILfd3vati7WbOiR5AKCn2US31I4o5MDVFbpq
 P21HCjIK9UqXQbtJ6g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddvgedgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeduvdfhkeekhfdtgeeihfeluddtvedthfektdelfeejgfeludfhteduveej
 hefhnecuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecukfhppeeltddrke
 elrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
 rhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:TH2KYBJvwo45obi3zvW1KQRB3Wb9ztwoLPB7oa3ufO9IRJHwLZceMw>
 <xmx:TH2KYNHiDr6dOF4cE5SXfTorunCAlGOyqJwK435RUFuLxg_Eui6FSA>
 <xmx:TH2KYFUdDt-sn7fIE-z3tbo1Og9_T85wbBNXVzqZL71sil4NfBHH3A>
 <xmx:TX2KYDercsjXUgTFrv-jHo5tel8xJX2zmzK_xJ9bctuqYmmlP4IJzA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Thu, 29 Apr 2021 05:33:00 -0400 (EDT)
Date: Thu, 29 Apr 2021 11:32:58 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PULL] drm-misc-next-fixes
Message-ID: <20210429093258.vpjju7i6idytkhkc@gilmour>
References: <20210422163329.dvbuwre3akwdmzjt@gilmour>
 <CADnq5_O39XAV+EF=CeKGK3UEG6E_6Gt_goW6u1+5siC5ROtz4Q@mail.gmail.com>
 <20210426073515.5lxw64eota7usaq4@gilmour>
 <CADnq5_MqQo95FQvz2Mj3G7LoMGNkyu=5cLqKpfm01E_0Uywa5w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADnq5_MqQo95FQvz2Mj3G7LoMGNkyu=5cLqKpfm01E_0Uywa5w@mail.gmail.com>
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
Cc: dim-tools@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============0963557323=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0963557323==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7nzl3fgknumoykak"
Content-Disposition: inline


--7nzl3fgknumoykak
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 28, 2021 at 04:57:26PM -0400, Alex Deucher wrote:
> On Mon, Apr 26, 2021 at 3:35 AM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > Hi Alex,
> >
> > On Thu, Apr 22, 2021 at 12:40:10PM -0400, Alex Deucher wrote:
> > > On Thu, Apr 22, 2021 at 12:33 PM Maxime Ripard <maxime@cerno.tech> wr=
ote:
> > > >
> > > > Hi Dave, Daniel,
> > > >
> > > > Here's this week drm-misc-next-fixes PR, for the next merge window
> > > >
> > >
> > > Can we also cherry-pick this patch:
> > > https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3Dd510c88cfbb294=
d2b1e2d0b71576e9b79d0e2e83
> > > It should have really gone into drm-misc-next-fixes rather than
> > > drm-misc-next, but I misjudged the timing.
> >
> > Yeah, just cherry-pick it, I'll keep sending PR during the merge window=
 :)
>=20
> Thanks, I cherry-picked it yesterday.

I sent the PR earlier :)

Maxime

--7nzl3fgknumoykak
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYIp9SgAKCRDj7w1vZxhR
xdUEAQDbmVce8y7EAqnJI+PeYHmD7XNIEL9/GaINLWs9rjUlIQEAtcdHyPRs36jx
S/EU2dgz7EOxDjvHZPwkPl76jQTP0AY=
=tit2
-----END PGP SIGNATURE-----

--7nzl3fgknumoykak--

--===============0963557323==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0963557323==--
