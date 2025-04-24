Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A26A9A6B5
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 10:48:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BBEE10E2EF;
	Thu, 24 Apr 2025 08:48:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b="ZsmY+OzE";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="lHGhLUpZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-a8-smtp.messagingengine.com
 (fout-a8-smtp.messagingengine.com [103.168.172.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C99A110E111;
 Thu, 24 Apr 2025 08:48:11 +0000 (UTC)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal
 [10.202.2.51])
 by mailfout.phl.internal (Postfix) with ESMTP id CAB27138076D;
 Thu, 24 Apr 2025 04:48:07 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-11.internal (MEProxy); Thu, 24 Apr 2025 04:48:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 invisiblethingslab.com; h=cc:cc:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1745484487;
 x=1745570887; bh=moUx0r6Zq8JwwGRRoRpEamtclvFlhO2+mjvAHef9WeQ=; b=
 ZsmY+OzEb1pQg4GiC4JG4Sh5g+Ip+k6fuayHtkGVKQ+IjcAqVxY/D+FAS3CVT9FB
 bg29pfm41Lck3qQ0nffQ9xF94B1iZA4/5xt3cwjzEo7tkMc3i+haiyiXmfPPuWLf
 I9QHoVUY/Bhn795UHXTMVgVXG8nzaix/igvDa79xsIv++E+SWUZHpsUwmm06VBhw
 E2SHliyjCtS7CGWkP0gEBedsT+nvNY01YWL+BSLCqKgkzdmbp9l04pOAdw0iiRgO
 LMgJxWjdyO820kBGpJoqJuA2UnB35x1uLKDuoLpPPKsrCciLTKO5wupwYfd4MyiY
 E48ZjxUYOxysFpM8N8tTlg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1745484487; x=1745570887; bh=moUx0r6Zq8JwwGRRoRpEamtclvFlhO2+mjv
 AHef9WeQ=; b=lHGhLUpZQ9XRUW06rGYsOJZ+OA+9JUUWyUfWkkz2DjS0HftXE7s
 Puk7F8F5vbVFydidVwxpmpEhnfr09aPPoQOJXcLVDpD36eZWskRdyV/MPYBPw7QU
 IXgt9CGIk5eNG5vI5hp1BfJ+zBD6EpsCgC6z51fOVGnXZzmpLW9/DwxHaH4OId6F
 QhaeIG9lJVAL+moq4p1G/i0J7x1X2fzRlUMfsMg57qlnnz8xyLKFQHIpSi/l4Vij
 cVD/wLO2sQ+S9gtU2Bwh50YfPNLuJQ+9btw1HUJUqbbECMegks3lhTlbLw564bol
 bM5rHHEt/4oA6Tv55AC2g4roroZCiT2RrJg==
X-ME-Sender: <xms:x_oJaDotSKYiM2R2_3OoS3yD-5pJrI8bx9yPpKJRzJ9rk8LvGtoCsQ>
 <xme:x_oJaNp5y-pgrTNpg7MxfBTkwBvTfsIc5fO_MXizIXALjBzgVAtItlU2HlP7Eb-oZ
 qlwFI6y1jQCiw>
X-ME-Received: <xmr:x_oJaAMWdSCNpaQpUnwW9sv5MKsuG3e3IgR2fZfNdrGQTZWjTshkHFl_cudhZbN1g7Z84lj3JH00ZnuuyfagnH8ZduTFO_ipNg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeeltdefucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
 pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
 gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
 jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
 eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
 ggftrfgrthhtvghrnhepgfduleetfeevhfefheeiteeliefhjefhleduveetteekveettd
 dvgeeuteefjedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
 rhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
 dpnhgspghrtghpthhtohepuddvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehs
 ohihvghrsehirhhlrdhhuhdprhgtphhtthhopegusggrrhihshhhkhhovhesghhmrghilh
 drtghomhdprhgtphhtthhopehluhhmrghgsehkvghrnhgvlhdrohhrghdprhgtphhtthho
 pehrvghgrhgvshhsihhonhhssehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoh
 epughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgt
 phhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprh
 gtphhtthhopegrmhguqdhgfhigsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhg
 pdhrtghpthhtohephhguvghgohgvuggvsehrvgguhhgrthdrtghomhdprhgtphhtthhope
 grlhgvgigrnhguvghrrdguvghutghhvghrsegrmhgurdgtohhm
X-ME-Proxy: <xmx:x_oJaG59SC0ie0iwmzaqx2MElZOGTcF7BgPvDNKXGsdCK7sCX-ycxg>
 <xmx:x_oJaC4AOqptvFe75JzIIoHYAJ4tciwEHu3v3woNbQtHFavZlhfHkQ>
 <xmx:x_oJaOgDKiZ4-XDkuT9cjxeo_C-MqFqlP0gtyAaXlUaA24pN0XO7Eg>
 <xmx:x_oJaE6r4zv8apJtEI8fuJtpJJFQK3epsNsNk0JdcXsdfcpXpWDqdA>
 <xmx:x_oJaBD3p2rjIbttTnFuS0qHrVsa-1zlCddRfvwQxDaC1fvlSEaINl1l>
Feedback-ID: i1568416f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 24 Apr 2025 04:48:05 -0400 (EDT)
Date: Thu, 24 Apr 2025 10:48:02 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Gergo Koteles <soyer@irl.hu>
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>,
 Dmitry Baryshkov <lumag@kernel.org>, regressions@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Alex Hung <alex.hung@amd.com>, Harry Wentland <harry.wentland@amd.com>
Subject: Re: amdgpu_dm_connector_mode_valid regression
Message-ID: <aAn6wsnJ-6mqK4vR@mail-itl>
References: <ed09edb167e74167a694f4854102a3de6d2f1433.camel@irl.hu>
 <8963a409dd575e040e5f07e4ad5e9c1d26b421f2.camel@irl.hu>
 <CALT56yPd-xfd=47xRxrCk4F3jib4Ti7kg8pRXy-gVAQpbOc=pw@mail.gmail.com>
 <e323219b52cda1891a55d12ad77a2b34edc8688b.camel@irl.hu>
 <Z_jodBrNFdEpJRKA@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0nQ5TDnVhV5gn1bQ"
Content-Disposition: inline
In-Reply-To: <Z_jodBrNFdEpJRKA@mail-itl>
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


--0nQ5TDnVhV5gn1bQ
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Apr 2025 10:48:02 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Gergo Koteles <soyer@irl.hu>
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>,
	Dmitry Baryshkov <lumag@kernel.org>, regressions@lists.linux.dev,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Alex Hung <alex.hung@amd.com>,
	Harry Wentland <harry.wentland@amd.com>
Subject: Re: amdgpu_dm_connector_mode_valid regression

On Fri, Apr 11, 2025 at 12:01:28PM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
>=20
> Hi,
>=20
> On Wed, Apr 02, 2025 at 04:35:05PM +0200, Gergo Koteles wrote:
> > Hi Dmitry,
> >=20
> > But the code would start to become quite untraceable.
> > duplicate mode in amdgpu_dm_connector_mode_valid()
> > call drm_mode_set_crtcinfo() in amdgpu_dm_connector_mode_valid()
> > duplicate mode in create_stream_for_sink()
> > overwrite ctrc in decide_crtc_timing_for_drm_display_mode()
> > if crtc_clock =3D=3D 0 call drm_mode_set_crtcinfo() again in
> > create_stream_for_sink()=20
>=20
> FWIW I'm affected by the same issue (on HP ProBook 445 G7, with AMD
> Ryzen 5 4500U). And the patch quoted below fixes it for me too.

I've re-tested it with 6.15-rc3 and the issue is still there. Is there
something I can do to help fixing it before final 6.15 is out?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--0nQ5TDnVhV5gn1bQ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmgJ+sIACgkQ24/THMrX
1yzQtwf/V1Kwj5a1YqzIurMPiJsNiEryIIzzNggnyRm78T9GwN33DU6aKpvdbcwH
q4Iz18yFSH2T8suYaXLjan3o4HkwIh6shkMRJ1S+J8KRP1vinn9Olq0pDu7bCxrl
98+lRYOQpl7n1s8Ne2Mw/z2aaUuE4rd2lKym9YrkkPhvijC7A3XeUqRSS8mkdydw
gkx4Up1lc0hp0X1o90fc7UJYaxM231XjnT+HqVEYNsnt/8bsaj2FN09SJwsBmVTk
481dT17Ts2ffRRAw+4lp6ecY3Y+RIbKkvC0rra+y5XFaFzd6O7hQ9MrKxqkLH4xK
WyLBwwfno2qFjv2Y2lzONmiSwS2YGw==
=x2tm
-----END PGP SIGNATURE-----

--0nQ5TDnVhV5gn1bQ--
