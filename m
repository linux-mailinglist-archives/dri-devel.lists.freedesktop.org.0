Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E343834ACA1
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 17:37:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECF226F427;
	Fri, 26 Mar 2021 16:37:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC82E6F40B
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 16:37:37 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id a7so9362185ejs.3
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 09:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=dDvD3CUiZ2sv05Iuj0mCsQMzMuyGdWYgU24cNVD0ZGg=;
 b=HmuYfhD7ov4rxDNoH3sjq6LUeBcLM/zSJJOYRRKkBR89uoos20vaXr9XAJavrkyAPa
 w7UumQfc28YXgL8z4uD4V3ei8eFo2z4XaakSHETKjH2q5Z4i74DkmTrzm044Zc46oDvv
 IKT7lrR2GJh6kgK5Ivk8G8tEDCb2JoMnZC4AZCiBMeO14+mF7RpyWksSGExVlTo/W00Z
 F5eP2XFifH2sYfF+k05b62eEoyrQZs2pWbPj5UW+uK/F45CBPDPIO01EOR6WfethiYHI
 ofALPoc7Lq88CO/PpDo8lb/rpEPiyY8V62rMaVOllbt5yBdVXN9P48GRCc1lVwVC0/tX
 tvtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=dDvD3CUiZ2sv05Iuj0mCsQMzMuyGdWYgU24cNVD0ZGg=;
 b=it8CtvUq26z9OAmuYsHqFT0XsWnudMyELHIcnFcQVMhOe6Zd7vsf2BHZaQ1jfIVHxL
 zuXNERc1zVCrQfsI1cyQnN4bkhyolxjACpnxZYH1SXELfe5lpyMbFbE+sxPQ+8GVOuD3
 9fcgEmJ0HchFgWWjM5wGBwGUCuBE7SzJ5oUs7++lfWm8fJOgSMAQhvRfUiD3desSwX6J
 grZGcjI+bTbzqVzPw5gC2dlaFBmCr0R2DdpAN1RSuFFhZOL083taxei+bBZI2ZcAHOa2
 eIEEl2hifwfp+05UslMkMN8iuVDmbu9+62D07vSoad06Yk7h+cPK6hB8B1FWYIAqNteA
 1WEQ==
X-Gm-Message-State: AOAM532hUZrI6a8VC/xLiYmGIadJx258L4dKAWd9RfPfHEg3jZLLmLB3
 Kn3v6JQyVq9ffKQZe2KYr9U=
X-Google-Smtp-Source: ABdhPJyIG/oq81mx/l0awFk/f8sINUAn8jvesReXfhQSxtxmZHeC65xRguMdlSl09eKS6EyUc/bMOg==
X-Received: by 2002:a17:907:7799:: with SMTP id
 ky25mr16271918ejc.217.1616776656481; 
 Fri, 26 Mar 2021 09:37:36 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id s20sm4509290edu.93.2021.03.26.09.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Mar 2021 09:37:34 -0700 (PDT)
Date: Fri, 26 Mar 2021 17:37:57 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH 6/9] drm/tegra: gem: Add a clarifying comment
Message-ID: <YF4N5YJ5e9nyEXzg@orome.fritz.box>
References: <20210323155437.513497-1-thierry.reding@gmail.com>
 <20210323155437.513497-7-thierry.reding@gmail.com>
 <21d2e691-6404-503b-422a-be97a7b9d1b4@gmail.com>
 <YFtUalHlk9YiH03n@orome.fritz.box>
 <c231415d-bb4c-6e8a-d384-4ded8f4d27d1@gmail.com>
 <YFtr6f3N3o11DfBc@orome.fritz.box>
 <eeea04f2-86d5-6f24-3831-9c67bfd59436@gmail.com>
MIME-Version: 1.0
In-Reply-To: <eeea04f2-86d5-6f24-3831-9c67bfd59436@gmail.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
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
Cc: Mikko Perttunen <cyndis@kapsi.fi>, David Airlie <airlied@linux.ie>,
 James Jones <jajones@nvidia.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-tegra@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0483030967=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0483030967==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NJPhphuDn+29sOBp"
Content-Disposition: inline


--NJPhphuDn+29sOBp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 24, 2021 at 07:50:01PM +0300, Dmitry Osipenko wrote:
> 24.03.2021 19:42, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Wed, Mar 24, 2021 at 06:45:30PM +0300, Dmitry Osipenko wrote:
> >> 24.03.2021 18:02, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> On Wed, Mar 24, 2021 at 05:41:08PM +0300, Dmitry Osipenko wrote:
> >>>> 23.03.2021 18:54, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>>>> From: Thierry Reding <treding@nvidia.com>
> >>>>>
> >>>>> Clarify when a fixed IOV address can be used and when a buffer has =
to
> >>>>> be mapped before the IOVA can be used.
> >>>>>
> >>>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
> >>>>> ---
> >>>>>  drivers/gpu/drm/tegra/plane.c | 8 ++++++++
> >>>>>  1 file changed, 8 insertions(+)
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/=
plane.c
> >>>>> index 19e8847a164b..793da5d675d2 100644
> >>>>> --- a/drivers/gpu/drm/tegra/plane.c
> >>>>> +++ b/drivers/gpu/drm/tegra/plane.c
> >>>>> @@ -119,6 +119,14 @@ static int tegra_dc_pin(struct tegra_dc *dc, s=
truct tegra_plane_state *state)
> >>>>>  		dma_addr_t phys_addr, *phys;
> >>>>>  		struct sg_table *sgt;
> >>>>> =20
> >>>>> +		/*
> >>>>> +		 * If we're not attached to a domain, we already stored the
> >>>>> +		 * physical address when the buffer was allocated. If we're
> >>>>> +		 * part of a group that's shared between all display
> >>>>> +		 * controllers, we've also already mapped the framebuffer
> >>>>> +		 * through the SMMU. In both cases we can short-circuit the
> >>>>> +		 * code below and retrieve the stored IOV address.
> >>>>> +		 */
> >>>>>  		if (!domain || dc->client.group)
> >>>>>  			phys =3D &phys_addr;
> >>>>>  		else
> >>>>>
> >>>>
> >>>> This comment is correct, but the logic feels a bit lame because it
> >>>> should be wasteful to re-map DMA on each FB flip. Personally I don't
> >>>> care much about this since older Tegras use pinned buffers by defaul=
t,
> >>>> but this shouldn't be good for T124+ users.
> >>>
> >>> I'm not terribly thrilled by this either, but it's the only way to do
> >>> this when using the DMA API because we don't know at allocation time =
(or
> >>> import time for that matter) which of the (up to) 4 display controlle=
rs
> >>> a framebuffer will be shown on. tegra_dc_pin() is the earliest where
> >>> this is known and worst case that's called once per flip.
> >>>
> >>> When the IOMMU API is used explicitly, we always map framebuffers into
> >>> the IOMMU domain shared by all display controllers at allocation or
> >>> import time and then we don't need to pin at flip time anymore.
> >>>
> >>> I do have a work-in-progress patch somewhere that creates a mapping
> >>> cache to mitigate this problem to some degree. I need to dig that up =
and
> >>> do a few measurements because I vaguely recall this speeding up flips=
 by
> >>> quite a bit (well, except for the very first mapping, obviously).
> >>>
> >>>> Perhaps dumb buffers should be pinned to display by default and then=
 we
> >>>> should extend the Tegra UAPI to support BO mapping to display client=
(?).
> >>>
> >>> That would kind of defeat the purpose of a generic KMS UAPI.
> >>
> >> Couldn't the BOs be mapped when FB is created, i.e. by tegra_fb_create?
> >=20
> > I suppose that would be possible. However, tegra_fb_create() doesn't
> > know a thing about display controllers, so we'd have to add extra code
> > to it to iterate over all display controllers and do a dma_map_sg() of
> > the GEM object for each of them.
> >=20
> > It's also somewhat wasteful because now we get a mapping for each
> > framebuffer for each display controller. So if you've got, say, a four
> > UHD screen setup (which is something that Tegra194 supports), you could
> > end up with 8 UHD framebuffers (two for each display, for double-
> > buffering) at 32 MiB each for a whopping 256 MiB of memory that needs to
> > be mapped for each of the four display controllers. That 1 GiB worth of
> > page table updates, whereas you really only need one fourth of that.
> >=20
> > Granted, this will make flipping a bit faster, and IOVA space isn't
> > really a problem on Tegra194. It would still waste a bit of RAM for all
> > those page table entries that we don't really need, though.
> >=20
> > A mapping cache seems like a much better compromise because the cache
> > lookup should be quite fast compared to a mapping operation and we waste
> > just a couple dozen bytes per mapping perhaps as opposed to a few
> > megabytes for the gratuitous, preemptive mappings.
>=20
> Isn't it really possible to put displays into the same IOMMU group on
> T194? It doesn't make much sense to have them in a separate groups on Lin=
ux.

It is possible and in fact that's what's already happening. However, the
problem isn't that these devices are not in the same group, the problem
is that the DMA API doesn't know anything about groups. It works on
struct device and if you've got DMA API debugging enabled it may even
flag incorrect usage as errors.

So from a DMA API point of view, if a device wants to use a buffer, that
buffer first has to be mapped for that device, even if it was already
mapped for a different device that happens to be in the same IOMMU group
and hence share an IOMMU domain.

Thierry

--NJPhphuDn+29sOBp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBeDeUACgkQ3SOs138+
s6EKLQ//aFYHnT6TF5VKX4VGHg3U0ChYgUCfQ02arcthiFsPQ3TN57gW6ysCVhES
69BRt4prNmEiW5FHkrtBADBKtZiyIFSODAmHNseJCmckMlph6akSK+ChDBkVouey
Kue+hF9PZ9X1Sx3ixnsHgDsUVHOJFs9/JWs3peCHw8HNE1ZLNAk5MXU+wwykKeYh
tVWRAIIUzz/QUBBRibRquozS1q00uq1LLBFKsCnCKJMSEec/Bkj8RcIGpN1359IX
y71RJut8cmrpW1zfw1WkJgbE0BPTb20KtI5hGuTJr2+vPxoOLLLgzi6tdOhMg/XC
HRhQHvTU76qxdaD7CMxkhg39q8IpuNwjhSxcKbqpT15MCF5bC79Dv4JoNc/Iahe0
KW7c9yxrhkUa1OaGESS0FbV5zCRsACsfpKhNsKW6Ic5C0uMvzg1KYLpJfQqzSc6j
+TLudHZsC/VXXMNngdht9TqQWUBM+jFJeKjoMWKxF51F5+uDO4ES/SKdWiEufLTl
nmriGMkuujiPq59muOBPF9v+u8P3rqySSk++XclQvZdAI4HjyVgmJq7A+DbU1nwg
0HiCnXTNDYGumh9RK3skbdzd6C5XeRTlzP3akNeRApI429Dbiezyj9Ys2Ef883DA
B+kLvRtuMInsj0yqi9EHatnNCPYrLqt0OKLuZZrZ4wVTo9eLz1w=
=FrY1
-----END PGP SIGNATURE-----

--NJPhphuDn+29sOBp--

--===============0483030967==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0483030967==--
