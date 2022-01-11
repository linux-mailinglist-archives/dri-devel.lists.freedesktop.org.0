Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E794248AE42
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 14:16:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5B9510FAF6;
	Tue, 11 Jan 2022 13:16:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F1F310FAF6
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 13:16:05 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id BF2342B000AA;
 Tue, 11 Jan 2022 08:16:03 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 11 Jan 2022 08:16:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=yXTF+1sEdjFyfoYhAlSGINwu0y1
 8yyw0z2aXapj6u4s=; b=em2fys3m84jBAFDKBEC2AtPfRilTDRqkdzw8ozzA6l6
 30K4NDfPlt1b8QYIJMPqk7fIWDEziCILf40sm/KhSZspwryVD4twAz5xNT98hWbu
 QiWMjFg1ReB+ejs5OYkDtWff3+s23Ky5H9DyXGJMANhEQGfPzGaktvEmCfOG+KaE
 6rB6nVIMEVGnL8pywaZl0GjF/+y1B0Gv7I739IjwcgsMLPo/dd3yecNIoqBM3S92
 6+b1f0swMcOXFtZPoPn/lWrDEUK+Q3PP96/JL2UWupTV/ULVMHDAWpSvTzt4unT/
 X0yfFyBA27LEykZEMDpQLSmrTseAZSZjVw+wm/W4V1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=yXTF+1
 sEdjFyfoYhAlSGINwu0y18yyw0z2aXapj6u4s=; b=C+zr0Y0956COKArNfHRi56
 IDtjkytBsqm5Coct7+bYOVMexGoB29J/yOeQyHxFVtSN3NWHM2eQVtKi9AuM0OXE
 svEwkJKmG33o8eYktYg2kBQl2WOzCV6jAjdYhuHS7uq1eAY/09g1NopLe+VO5hrj
 1hIod3wivTRUUSbEgvoSrao56fp9YYlL7NjYfSVEtGSJm8HOeKfR59VKMSeBZfRA
 dtAsksVWzZofW2v3BNP4kS2wVu9RegXT5oHv6JByPakrtV9tWejYN/F8yzGlZMVR
 o0OEkUyPeM+QTHILkQhSZFHolVy3ZzB2W+FgRrtfco3FV2enF7/w0WNc9Jxla7vg
 ==
X-ME-Sender: <xms:EoPdYad0marmisCixdg_8fVLP38I_JWJ52xK9uzP5BwYAebeFNznXQ>
 <xme:EoPdYUPRDiaHR9nam5B6FvrzRrSJm52tWillR4Sn7WF37x8rzCyoTe35Se6OWqb5e
 SvP7w9QINNGVRYGoJE>
X-ME-Received: <xmr:EoPdYbijdX-m7OiCg45S9T3GxFFboEfpClpikmxQVeBEu4AYNC_B9tbDhGjk_jt-rC3LiGQx0RvlhDH7nCsDd3-_bCPFNoK8K7UaY5A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrudehfedghedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:EoPdYX9xsbi5OKt0UVB5Jz7mUeIhO-8PLiOE_ao_XQWal4FBUz85Cg>
 <xmx:EoPdYWsx3Q4nY_ScaWbb0nGHzkgiqjCYiZFAw5NIKrQSTP-lDzVBoA>
 <xmx:EoPdYeHIHujuD1UkImBK1090PRp3fe1BeYzT5l3puZPF2u8gKPjFUQ>
 <xmx:E4PdYQLwkXLO94HZxxhz8aDZg5Ng_9bQLnGiW-8duNk12P9wLUb6QjYN0zA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Jan 2022 08:16:02 -0500 (EST)
Date: Tue, 11 Jan 2022 14:16:01 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v2 0/2] video: A couple of fixes for the vga16fb driver
Message-ID: <20220111131601.u36j6grsvnir5gvp@houat>
References: <20220110095625.278836-1-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5rhk7fpudnheurb4"
Content-Disposition: inline
In-Reply-To: <20220110095625.278836-1-javierm@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kris Karas <bugs-a21@moonlit-rail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Peter Robinson <pbrobinson@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Borislav Petkov <bp@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--5rhk7fpudnheurb4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jan 10, 2022 at 10:56:23AM +0100, Javier Martinez Canillas wrote:
> This patch series contains two fixes for the vga16fb driver. I looked at
> the driver due a regression reported [0], caused by commit d391c5827107
> ("drivers/firmware: move x86 Generic System Framebuffers support").
>=20
> The mentioned commit didn't change any logic but just moved the platform
> device registration that matches the vesafb and efifb drivers to happen
> later. And this caused the vga16fb driver to be probed even in machines
> that don't have an EGA or VGA video adapter.
>=20
> This is a v2 of the patch series that addresses issues pointed out by
> Geert Uytterhoeven.
>=20
> Patch #1 is fixing the wrong check to determine if either EGA or VGA is
> used and patch #2 adds a check to the driver to only be loaded for EGA
> and VGA 16 color graphic cards.

For both patches,

Acked-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--5rhk7fpudnheurb4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYd2DEQAKCRDj7w1vZxhR
xbXXAP4gpuUuyyTwx3PEj37oaIJQF37qaFBZHNDqYNK9DJonuQD+LsvkihtOL+7n
xXiJmQtTvSoH/8OE236YGI56zT1kvAQ=
=fqNz
-----END PGP SIGNATURE-----

--5rhk7fpudnheurb4--
