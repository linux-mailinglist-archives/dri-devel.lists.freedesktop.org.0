Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3C727A84F
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 09:08:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8FCA6E41D;
	Mon, 28 Sep 2020 07:07:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAC5C6E02D
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Sep 2020 15:14:15 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 8FD6F5CF;
 Fri, 25 Sep 2020 11:14:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 25 Sep 2020 11:14:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=FebPny5OSgC5PCIL/63WgOmsmm/
 Mw5Zls8MDyN6IYRY=; b=msmmBTb4mfzh1hX50aWiICwMKn6jVvjgDCzlrQgHtxB
 IR6ZojeF1WMsEFTaKRIeQFr59DaAjDLeoItp6T/quF1peT7qHzeJXgGsEMM/Ybtz
 18UKV5x4gFf8+dCFpIQOHsk60yDNYrj36CXIfNoF5rJiQ2+XDdNYdDe5ZyQl130z
 nrYt0n/k03PNLk2SHyX832abE+lhd3fMfoJtsEWEHGssw+QNydeofJaaCLPPoXB0
 Bq8lHrZ55XrTS+bDLx6xJga6l//Xqj+dfKRaGx4nAIlN3rESOaPxcWomFJYHBuSQ
 rki7LDVispqQ1CZlTuUvddIFeG27BSUvYBTvBk5wwcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=FebPny
 5OSgC5PCIL/63WgOmsmm/Mw5Zls8MDyN6IYRY=; b=dH2CCZr2WbeYcSb4gpUJ95
 iEzmMrmFy9sHIcqOEy8d8tLn6546muFPYH//duGxMsSURc8Y07YWAa9xwcW0hll6
 QxCBkp1D4SoNw/rCz1Gtyrg8NguLbd4OPTuyknt/LRKTVwDTAMdb3OhY4C9CCAVV
 hQzIXmFwwUdWU8mEjGPh18dStO0tG/nbuXQKj0Ws9tYQCvjePK3VCvZ1X7PDm1Yi
 p7uBsPfMP1eyefQGvOq2KvaWvJ9vRGokZ1vTaDNBQroMAbjmfy8+2AFdD0APYaif
 VGkbL0vDUKA6TIifPzDe/jLxgSKhKMxH0Ac3Z2eHWPWubyQzOQl9oxrhxNCt2EhQ
 ==
X-ME-Sender: <xms:RAluX_c2cVSQw3NtZ-IxWUGjYOAvHpPuF9ZAE49h4ImpaeCPm06FEQ>
 <xme:RAluX1NtQNGHwMAvycSTsFZlc3YRcmGhWRpZqEFIzCNWB_nt1EDxWl3WSFofIGbNB
 amLtWyKnVr0mtuQEuM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddtgdekgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeevveefffduveeitdegtefhhfetueffteefffdvheevvdehteethedvleffgfej
 vdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeeltddrkeelrdeikedrje
 einecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgr
 gihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:RAluX4h2i7THf5CGBxcJkGqOCsEc8I0k9pcZ0sXRD4EVIRLUoacVvQ>
 <xmx:RAluXw8UI6aYH3n-Civ4wkJUZJe_qlzKqJCWCzp91RUts6UhIjpq5g>
 <xmx:RAluX7vIDP2maRTSnU_RwQkQt3-smBrOo5oRgWC6s7auORr6HMfCcg>
 <xmx:RgluX_GGDy8dJb2EAv9jRhxmqLKsbG22l4qMt_jsXQG1NIJOITHDxe9kl4U>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id C27403280063;
 Fri, 25 Sep 2020 11:14:11 -0400 (EDT)
Date: Fri, 25 Sep 2020 17:14:10 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 3/9] drm: Add simplekms driver
Message-ID: <20200925151410.zrivxvskxh3sr5n7@gilmour.lan>
References: <20200625120011.16168-1-tzimmermann@suse.de>
 <20200625120011.16168-4-tzimmermann@suse.de>
 <20200629090657.GN3278063@phenom.ffwll.local>
 <da512368-508d-15f5-823a-5a037364887a@suse.de>
MIME-Version: 1.0
In-Reply-To: <da512368-508d-15f5-823a-5a037364887a@suse.de>
X-Mailman-Approved-At: Mon, 28 Sep 2020 07:06:24 +0000
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
Cc: geert+renesas@glider.be, airlied@linux.ie, emil.l.velikov@gmail.com,
 lgirdwood@gmail.com, dri-devel@lists.freedesktop.org, hdegoede@redhat.com,
 broonie@kernel.org, kraxel@redhat.com, sam@ravnborg.org
Content-Type: multipart/mixed; boundary="===============0740892519=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0740892519==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ervpwhin4d4bbvy6"
Content-Disposition: inline


--ervpwhin4d4bbvy6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Fri, Sep 25, 2020 at 05:01:23PM +0200, Thomas Zimmermann wrote:
> >> +					   ARRAY_SIZE(simplekms_formats),
> >> +					   simplekms_format_modifiers,
> >> +					   connector);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> +	drm_mode_config_reset(dev);
> >=20
> > This breaks fastboot. I think ideally we'd have the state represent
> > everything is on, and allocate an fb + buffer with the current contents=
 of
> > the framebuffer. Since we can allocate an fb that matches this shouldn't
> > be a problem, just a raw memcpy_fromio should do the job.
>=20
> I'm trying to wrap my head around how the fastboot setup is implemented.
>=20
> Apparently, i915's fbdev code goes through the existing pipeline state
> and fills the fb_info structure with compatible settings.
>=20
> Where is the initial pipeline state created? If I write reset handlers
> that initialize the pipeline to the simple-framebuffer's fixed state,
> whould that be sufficient? A later stage could then do the equivalent of
> intel_fbdev_init_bios().
>=20
> The simple-kms helpers don't seem to support custom reset handlers or
> atomic-state callbacks. I guess that would require and update as well?

You probably want to read the following :)

https://lore.kernel.org/dri-devel/CAKMK7uHtqHy_oz4W7F+hmp9iqp7W5Ra8CxPvJ=3D=
9BwmvfU-O0gg@mail.gmail.com/

It's been on my todo-list since, but I never got to work on it :/

Maxime

--ervpwhin4d4bbvy6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX24JQgAKCRDj7w1vZxhR
xcflAQD/smmNaiuWG8+eskkYdYrpSwlJRNF4sD4/qxfBLWZ28gEAl3t5YkI9Jvw7
5E61IUz+SBXv6Hw3R/eSs14EOBLQNgI=
=s5yv
-----END PGP SIGNATURE-----

--ervpwhin4d4bbvy6--

--===============0740892519==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0740892519==--
