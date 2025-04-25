Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F84A9BF3C
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 09:09:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB66110E894;
	Fri, 25 Apr 2025 07:09:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WfgEML46";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6A9E10E894
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 07:09:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 460B16845F;
 Fri, 25 Apr 2025 07:08:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B205AC4CEE4;
 Fri, 25 Apr 2025 07:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745564958;
 bh=XRJaobu20wNxHoup9s4R3YDQJkYv5i9HIMk9O25Dr6k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WfgEML463b0+bWtPIloy53Rqep5I1ojunbyxFP+bzc9GS2sAG8LRFar6fOcW3siuO
 IgP7K5EsZ6MZphcoA07kXQzRZG8ouQRTz9x1UlLLGL9Dy8KrEWrGdfsV01I8QjXWlm
 FErYl8AxCDHubZU1yT+tw3NHF9OveIHBZkpmYiIKVxsQkAMDqoU0BPZW/fLePr3Dpb
 JH+SnSZAIbQ3bSNGeGpOwudvdgH6b8FmITLdvJKt7L88ybptMF2UYs3N/bRXnEZ2n8
 e8pBVM32tAJLS1iedQXy1EGxWOOJtqFV/4Zhla839fffv+QnMDOjaIDiRjAtkYN1uG
 +KO9/gzMUiDZA==
Date: Fri, 25 Apr 2025 09:09:15 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Michal Wilczynski <m.wilczynski@samsung.com>, 
 Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Danilo Krummrich <dakr@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Drew Fustini <drew@pdp7.com>, 
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns <frank.binns@imgtec.com>, 
 Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, m.szyprowski@samsung.com,
 linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 1/4] PM: device: Introduce platform_resources_managed
 flag
Message-ID: <20250425-lumpy-marmot-of-popularity-cdbbcd@houat>
References: <CGME20250414185314eucas1p1ae57b937773a2ed4ce8d52d5598eb028@eucas1p1.samsung.com>
 <20250414-apr_14_for_sending-v2-0-70c5af2af96c@samsung.com>
 <20250414-apr_14_for_sending-v2-1-70c5af2af96c@samsung.com>
 <CAJZ5v0irRq8_p35vf41_ZgomW0X=KZN+0HqwU2K9PvPRm8iZQA@mail.gmail.com>
 <b9c4182d-38c2-4173-a35a-0e1773c8f2ed@samsung.com>
 <CAJZ5v0gE0anjW_mDSwNXY8xoZ_0=bDDxiSbUq1GP7-NycDojrQ@mail.gmail.com>
 <cbf20469-02ab-403a-8db7-2b66e9936b4f@samsung.com>
 <CAPDyKFqND2JrH8nLUzAqwWgHkwia6M9XOJoY6AqxtR0t120JUA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="vw35xu6fptfqmd4m"
Content-Disposition: inline
In-Reply-To: <CAPDyKFqND2JrH8nLUzAqwWgHkwia6M9XOJoY6AqxtR0t120JUA@mail.gmail.com>
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


--vw35xu6fptfqmd4m
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/4] PM: device: Introduce platform_resources_managed
 flag
MIME-Version: 1.0

Hi,

On Thu, Apr 24, 2025 at 06:51:00PM +0200, Ulf Hansson wrote:
> On Thu, 17 Apr 2025 at 18:19, Michal Wilczynski
> <m.wilczynski@samsung.com> wrote:
> > On 4/16/25 16:48, Rafael J. Wysocki wrote:
> > > On Wed, Apr 16, 2025 at 3:32=E2=80=AFPM Michal Wilczynski
> > > <m.wilczynski@samsung.com> wrote:
> > >>
> > >> On 4/15/25 18:42, Rafael J. Wysocki wrote:
> > >>> On Mon, Apr 14, 2025 at 8:53=E2=80=AFPM Michal Wilczynski
> > >>> <m.wilczynski@samsung.com> wrote:
> > >>>>
> > >>>> Introduce a new dev_pm_info flag - platform_resources_managed, to
> > >>>> indicate whether platform PM resources such as clocks or resets are
> > >>>> managed externally (e.g. by a generic power domain driver) instead=
 of
> > >>>> directly by the consumer device driver.
> > >>>
> > >>> I think that this is genpd-specific and so I don't think it belongs=
 in
> > >>> struct dev_pm_info.
> > >>>
> > >>> There is dev->power.subsys_data->domain_data, why not use it for th=
is?
> > >>
> > >> Hi Rafael,
> > >>
> > >> Thanks for the feedback.
> > >>
> > >> You're right =E2=80=94 this behavior is specific to genpd, so embedd=
ing the flag
> > >> directly in struct dev_pm_info may not be the best choice. Using
> > >> dev->power.subsys_data->domain_data makes more sense and avoids bloa=
ting
> > >> the core PM structure.
> > >>
> > >>>
> > >>> Also, it should be documented way more comprehensively IMV.
> > >>>
> > >>> Who is supposed to set it and when?  What does it mean when it is s=
et?
> > >>
> > >> To clarify the intended usage, I would propose adding the following
> > >> explanation to the commit message:
> > >>
> > >> "This flag is intended to be set by a generic PM domain driver (e.g.,
> > >> from within its attach_dev callback) to indicate that it will manage
> > >> platform specific runtime power management resources =E2=80=94 such =
as clocks
> > >> and resets =E2=80=94 on behalf of the consumer device. This implies =
a delegation
> > >> of runtime PM control to the PM domain, typically implemented through
> > >> its start and stop callbacks.
> > >>
> > >> When this flag is set, the consumer driver (e.g., drm/imagination) c=
an
> > >> check it and skip managing such resources in its runtime PM callbacks
> > >> (runtime_suspend, runtime_resume), avoiding conflicts or redundant
> > >> operations."
> > >
> > > This sounds good and I would also put it into a code comment somewher=
e.
> > >
> > > I guess you'll need helpers for setting and testing this flag, so
> > > their kerneldoc comments can be used for that.
> > >
> > >> This could also be included as a code comment near the flag definiti=
on
> > >> if you think that=E2=80=99s appropriate.
> > >>
> > >> Also, as discussed earlier with Maxime and Matt [1], this is not abo=
ut
> > >> full "resource ownership," but more about delegating runtime control=
 of
> > >> PM resources like clocks/resets to the genpd. That nuance may be wor=
th
> > >> reflecting in the flag name as well, I would rename it to let's say
> > >> 'runtime_pm_platform_res_delegated', or more concise
> > >> 'runtime_pm_delegated'.
> > >
> > > Or just "rpm_delegated" I suppose.
> > >
> > > But if the genpd driver is going to set that flag, it will rather mean
> > > that this driver will now control the resources in question, so the
> > > driver should not attempt to manipulate them directly.  Is my
> > > understanding correct?
> >
> > Yes, your understanding is correct =E2=80=94 with one minor clarificati=
on.
> >
> > When the genpd driver sets the flag, it indicates that it will take over
> > control of the relevant PM resources in the context of runtime PM, i.e.,
> > via its start() and stop() callbacks. As a result, the device driver
> > should not manipulate those resources from within its RUNTIME_PM_OPS
> > (e.g., runtime_suspend, runtime_resume) to avoid conflicts.
> >
> > However, outside of the runtime PM callbacks, the consumer device driver
> > may still access or use those resources if needed e.g for devfreq.
> >
> > >
> > > Assuming that it is correct, how is the device driver going to know
> > > which resources in particular are now controlled by the genpd driver?
> >
> > Good question =E2=80=94 to allow finer-grained control, we could replac=
e the
> > current single boolean flag with a u32 bitmask field. Each bit would
> > correspond to a specific category of platform managed resources. For
> > example:
> >
> > #define RPM_TAKEOVER_CLK        BIT(0)
> > #define RPM_TAKEOVER_RESET      BIT(1)
> >
> > This would allow a PM domain driver to selectively declare which
> > resources it is taking over and let the consumer driver query only the
> > relevant parts.
>=20
> Assuming we are targeting device specific resources for runtime PM;
> why would we want the driver to be responsible for some resources and
> the genpd provider for some others? I would assume we want to handle
> all these RPM-resources from the genpd provider, if/when possible,
> right?
>=20
> The tricky part though (maybe Stephen had some ideas in his talk [a]
> at OSS), is to teach the genpd provider about what resources it should
> handle. In principle the genpd provider will need some kind of device
> specific knowledge, perhaps based on the device's compatible-string
> and description in DT.
>=20
> My point is, using a bitmask doesn't scale as it would end up having
> one bit for each clock (a device may have multiple clocks), regulator,
> pinctrl, phy, etc. In principle, reflecting the description in DT.

My understanding is that it's to address a situation where a "generic"
driver interacts with some platform specific code. I think it's tied to
the discussion with the imagination GPU driver handling his clocks, and
the platform genpd clocks overlapping a bit.

But then, my question is: does it matter? clocks are refcounted, and
resets are as well iirc, so why do we need a transition at all? Can't we
just let the platform genpd code take a reference on the clock, the GPU
driver take one as well, and it's all good, right?

Maxime

--vw35xu6fptfqmd4m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaAs1GwAKCRAnX84Zoj2+
do8sAX9FbcAEu04m80R/QWM9SUbClB57KbU/Zbb/SrxS41bJSYzLDFQbballhRWa
UWhmg2YBfRcskqou4btHfDm4ChKCQ7giQfUQ0IOm9WRVcNZTCKQJvrz64wvKsA7C
NKJ4T4yLqA==
=loki
-----END PGP SIGNATURE-----

--vw35xu6fptfqmd4m--
