Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E55B3BC6F8
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 09:09:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35B79898CE;
	Tue,  6 Jul 2021 07:09:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F27D3898C4;
 Tue,  6 Jul 2021 07:09:47 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id q4so27762759ljp.13;
 Tue, 06 Jul 2021 00:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=XTwFZwCKVq9Sz5cd3f/6YRq5RojDWHq5cppUZPQkbP4=;
 b=RkvvDEF2uuX1+YlI6AUAdIvz8aAz2luib+bPJWFYjswXxACwdMeAFhf1O5iongluds
 CmV9H5WDQ+PNDmFlW4HUeOhlHsUFIemDftA9rVi8HkYUDmRUY7FtVxpmxRj0MDUiZ6I3
 SqXFJhEGl0KCNvNzSULVw90p0mHCPv/+M7LTTK0RwwuH1qJSDuGtXKT99ZIklkF19GT8
 5mR14wOrL5+z5NX7jh/ZO1472pEMku3Nn+MHn3knQztdpPMSdMKT20/zPVzqc+Sam72o
 8zY+QCzZ3lbGj8jOHI8dE0AFJ8BCYvCF3lBFdo29WxeZQgZmmybvJ4KaHcWXu70ob847
 fohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=XTwFZwCKVq9Sz5cd3f/6YRq5RojDWHq5cppUZPQkbP4=;
 b=OZ560cXbJ//mypWVvx4De3OPMnskGjjT2R0LqCC/helhFRab24WFMzrDXhyzOKp+BW
 6624gKiohNkrdrKe3NyHA45x0Cih0kB8L7Og91EPC40tVH4LkiwjMFEvFJQDUjcUaI2q
 v9ycJc5ZxYTn8kmMbUXCpJRWsrmMnTxcaOwpjtNZxYbyWStKAAemkGCIRLmdLNyVCsu6
 pW6f5gSEnNWZjGkFGiXOSXIbd25haij2Cs7d2laZbb8fmbmnIDb99KrXYTOi7lhL6Uf6
 VH3Xi9NOoUBepxHz/tSQcKYIGQFMhqwOjdJFDmWFWmKGQmQApHMOnZ6+RrzGhRY10cPS
 ELow==
X-Gm-Message-State: AOAM530Cndi804DMlUYmvPa6xLTGIsqJdncJUb9KjNTv815rv0AGECga
 kVvkKPeWMrJIr8F+xlKdQ9c=
X-Google-Smtp-Source: ABdhPJx7oakSSjCc2PwbGlv8Ixe0ENwl8BCsPbYEqtToms1n55+qyNuPUCo5DbyKLOTHVYr1gmFVEQ==
X-Received: by 2002:a05:651c:178b:: with SMTP id
 bn11mr13993658ljb.43.1625555386111; 
 Tue, 06 Jul 2021 00:09:46 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id m25sm272683lfo.12.2021.07.06.00.09.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 00:09:45 -0700 (PDT)
Date: Tue, 6 Jul 2021 10:09:42 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Werner Sembach <wse@tuxedocomputers.com>
Subject: Re: [PATCH v4 12/17] drm/uAPI: Add "preferred color format" drm
 property as setting for userspace
Message-ID: <20210706100942.3754a8e3@eldfell>
In-Reply-To: <102bf05f-7081-c53b-ab0b-f2698c7540e9@tuxedocomputers.com>
References: <20210618091116.14428-1-wse@tuxedocomputers.com>
 <20210618091116.14428-13-wse@tuxedocomputers.com>
 <20210622101516.6a53831c@eldfell>
 <jIDQ2rRRMWlhDDPf08Z8xZlEE8HTBx7fHsylFdK0joSSFVyES8D444Giyiji9zbIm7dU4QpbsXZLvIDTbGW0wEoUWKsMEI4evizn0UdGMvM=@emersion.fr>
 <20210629141712.21f00c38@eldfell>
 <6d8716e0-e68a-e7b7-a341-a7471c413e9c@tuxedocomputers.com>
 <20210630114133.47397e2f@eldfell>
 <d3674d49-8bca-7ecf-1735-7bff2d9d526e@tuxedocomputers.com>
 <20210701110714.61f3e2af@eldfell>
 <b7144386-a98b-faf9-b425-c1157d9d0241@tuxedocomputers.com>
 <20210701162446.14f4f577@eldfell>
 <102bf05f-7081-c53b-ab0b-f2698c7540e9@tuxedocomputers.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/z2Dax/eoTBxuhffMJDUbe+M";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: sunpeng.li@amd.com, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 airlied@linux.ie, amd-gfx@lists.freedesktop.org, tzimmermann@suse.de,
 rodrigo.vivi@intel.com, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/z2Dax/eoTBxuhffMJDUbe+M
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 5 Jul 2021 17:49:42 +0200
Werner Sembach <wse@tuxedocomputers.com> wrote:

> Am 01.07.21 um 15:24 schrieb Pekka Paalanen:
> > On Thu, 1 Jul 2021 14:50:13 +0200
> > Werner Sembach <wse@tuxedocomputers.com> wrote:
> > =20
> >> Am 01.07.21 um 10:07 schrieb Pekka Paalanen:
> >> =20
> >>> On Wed, 30 Jun 2021 11:20:18 +0200
> >>> Werner Sembach <wse@tuxedocomputers.com> wrote:
> >>>   =20
> >>>> Am 30.06.21 um 10:41 schrieb Pekka Paalanen:
> >>>>   =20
> >>>>> On Tue, 29 Jun 2021 13:39:18 +0200
> >>>>> Werner Sembach <wse@tuxedocomputers.com> wrote:
> >>>>>     =20
> >>>>>> Am 29.06.21 um 13:17 schrieb Pekka Paalanen:     =20
> >>>>>>> On Tue, 29 Jun 2021 08:12:54 +0000
> >>>>>>> Simon Ser <contact@emersion.fr> wrote:
> >>>>>>>        =20
> >>>>>>>> On Tuesday, June 22nd, 2021 at 09:15, Pekka Paalanen <ppaalanen@=
gmail.com> wrote:
> >>>>>>>>        =20
> >>>>>>>>> yes, I think this makes sense, even if it is a property that on=
e can't
> >>>>>>>>> tell for sure what it does before hand.
> >>>>>>>>>
> >>>>>>>>> Using a pair of properties, preference and active, to ask for s=
omething
> >>>>>>>>> and then check what actually worked is good for reducing the
> >>>>>>>>> combinatorial explosion caused by needing to "atomic TEST_ONLY =
commit"
> >>>>>>>>> test different KMS configurations. Userspace has a better chanc=
e of
> >>>>>>>>> finding a configuration that is possible.
> >>>>>>>>>
> >>>>>>>>> OTOH, this has the problem than in UI one cannot tell the user =
in
> >>>>>>>>> advance which options are truly possible. Given that KMS proper=
ties are
> >>>>>>>>> rarely completely independent, and in this case known to depend=
 on
> >>>>>>>>> several other KMS properties, I think it is good enough to know=
 after
> >>>>>>>>> the fact.
> >>>>>>>>>
> >>>>>>>>> If a driver does not use what userspace prefers, there is no wa=
y to
> >>>>>>>>> understand why, or what else to change to make it happen. That =
problem
> >>>>>>>>> exists anyway, because TEST_ONLY commits do not give useful fee=
dback
> >>>>>>>>> but only a yes/no.     =20
> >>>>>>>> By submitting incremental atomic reqs with TEST_ONLY (i.e. only =
changing one
> >>>>>>>> property at a time), user-space can discover which property make=
s the atomic
> >>>>>>>> commit fail.     =20
> >>>>>>> That works if the properties are independent of each other. Color
> >>>>>>> range, color format, bpc and more may all be interconnected,
> >>>>>>> allowing only certain combinations to work.
> >>>>>>>
> >>>>>>> If all these properties have "auto" setting too, then it would be
> >>>>>>> possible to probe each property individually, but that still does=
 not
> >>>>>>> tell which combinations are valid.
> >>>>>>>
> >>>>>>> If you probe towards a certain configuration by setting the prope=
rties
> >>>>>>> one by one, then depending on the order you pick the properties, =
you
> >>>>>>> may come to a different conclusion on which property breaks the
> >>>>>>> configuration.     =20
> >>>>>> My mind crossed another point that must be considered: When plugin=
 in
> >>>>>> a Monitor a list of possible Resolutions+Framerate combinations is
> >>>>>> created for xrandr and other userspace (I guess by atomic checks? =
but
> >>>>>> I don't know).     =20
> >>>>> Hi,
> >>>>>
> >>>>> I would not think so, but I hope to be corrected if I'm wrong.
> >>>>>
> >>>>> My belief is that the driver collects a list of modes from EDID, so=
me
> >>>>> standard modes, and maybe some other hardcoded modes, and then
> >>>>> validates each entry against all the known limitations like vertical
> >>>>> and horizontal frequency limits, discarding modes that do not fit.
> >>>>>
> >>>>> Not all limitations are known during that phase, which is why KMS
> >>>>> property "link-status" exists. When userspace actually programs a m=
ode
> >>>>> (not a TEST_ONLY commit), the link training may fail. The kernel pr=
unes
> >>>>> the mode from the list and sets the link status property to signal
> >>>>> failure, and sends a hotplug uevent. Userspace needs to re-check the
> >>>>> mode list and try again.
> >>>>>
> >>>>> That is a generic escape hatch for when TEST_ONLY commit succeeds, =
but
> >>>>> in reality the hardware cannot do it, you just cannot know until you
> >>>>> actually try for real. It causes end user visible flicker if it hap=
pens
> >>>>> on an already running connector, but since it usually happens when
> >>>>> turning a connector on to begin with, there is no flicker to be see=
n,
> >>>>> just a small delay in finding a mode that works.
> >>>>>     =20
> >>>>>> During this drm
> >>>>>> properties are already considered, which is no problem atm because=
 as
> >>>>>> far as i can tell there is currently no drm property that would ma=
ke
> >>>>>> a certain Resolutions+Framerate combination unreachable that would=
 be
> >>>>>> possible with everything on default.     =20
> >>>>> I would not expect KMS properties to be considered at all. It would
> >>>>> reject modes that are actually possible if the some KMS properties =
were
> >>>>> changed. So at least going forward, current KMS property values can=
not
> >>>>> factor in.     =20
> >>>> At least the debugfs variable "force_yuv420_output" did change the=20
> >>>> available modes here:=20
> >>>> https://elixir.bootlin.com/linux/v5.13/source/drivers/gpu/drm/amd/di=
splay/amdgpu_dm/amdgpu_dm.c#L5165=20
> >>>> before my patch=20
> >>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/c=
ommit/?id=3D68eb3ae3c63708f823aeeb63bb15197c727bd9bf   =20
> >>> Hi,
> >>>
> >>> debugfs is not proper UAPI, so we can just ignore it. Display servers
> >>> cannot be expected to poke in debugfs. Debugfs is not even supposed to
> >>> exist in production systems, but I'm sure people use it for hacking
> >>> stuff. But that's all it is for: developer testing and hacking.   =20
> >> e.g. Ubuntu has it active by default, but only read (and writable) by =
root. =20
> > Hi,
> >
> > that's normal, yes. Root can do damage anyway, and it's useful for
> > debugging. KMS clients OTOH often do not run as root.
> > =20
> >>>   =20
> >>>> Forcing a color format via a DRM property in this function would=20
> >>>> reintroduce the problem.   =20
> >>> The property would need to be defined differently because its presence
> >>> could otherwise break existing userspace. Well, I suppose it could
> >>> break existing userspace no matter what, so we would need the generic
> >>> "reset to sane defaults" mechanism first IMO.
> >>>
> >>> DRM has client caps for exposing video modes that old userspace might
> >>> not expect, to avoid breaking old userspace. Care needs to be taken
> >>> with all new UAPI, because if a kernel upgrade makes something wrong,
> >>> it's the kernel's fault no matter what userspace is doing, in princip=
le.   =20
> >> Can you give me a link describing how I define this caps? =20
> > I don't have any, but you can find all the existing ones by grepping
> > for DRM_CLIENT_CAP_.
> >
> > I'm not saying that we need it, but mentioning them as a possible
> > workaround if userspace breakage seems imminent or is proven.
> > =20
> >>> Debugfs has no problem breaking userspace AFAIU, since it's not proper
> >>> UAPI.
> >>>   =20
> >>>> And I think i915 driver works similar in this regard.
> >>>>   =20
> >>>>>     =20
> >>>>>> However for example forcing YCbCr420 encoding would limit the
> >>>>>> available resolutions (my screen for example only supports YCbCr420
> >>>>>> on 4k@60 and @50Hz and on no other resolution or frequency (native=
 is
> >>>>>> 2560x1440@144Hz).
> >>>>>>
> >>>>>> So would a "force color format" that does not get resetted on
> >>>>>> repluging/reenabling a monitor break the output, for example, of an
> >>>>>> not updated xrandr, unaware of this new property?     =20
> >>>>> Yes, not because the mode list would be missing the mode, but becau=
se
> >>>>> actually setting the mode would fail.     =20
> >>>> Well, like described above, I think the mode would actually be missi=
ng,=20
> >>>> which is also an unexpected behavior from a user perspective.   =20
> >>> I think that is not how the property should work.
> >>>
> >>> If KMS properties would affect the list of modes, then userspace would
> >>> need to set the properties for real (TEST_ONLY cannot change anything)
> >>> and re-fetch the mode lists (maybe there is a hotplug event, maybe
> >>> not). That workflow just doesn't work.   =20
> >> The properties are set before the list is created in the first place.
> >> Because, in my example, the properties get set before the monitor is
> >> plugged in and the list can only be created as soon as the monitor is
> >> plugged in. =20
> > That's just an accident, it's not what I mean.
> >
> > What I mean is, we cannot have the KMS properties affect the list of
> > modes, because then userspace that want to use specific values on those
> > properties would have to program those properties first, and then get
> > the list of modes. KMS UAPI does not work that way AFAIK.
> >
> > If the initial mode list is created on hotplug like you say, then the
> > initial list could already be missing some modes that would be valid if
> > some KMS properties had different values. =20
>=20
> Depends if the mode list is created by TEST_ONLY:

Hi,

I'm pretty sure it's not created by any kind of atomic test probing,
exactly because some properties might affect the result. Also because
of legacy: the mode lists predate atomic by far. It just doesn't make
sense to prune the mode list based on current arbitrary property values.

The function drm_helper_probe_single_connector_modes() looks relevant
to me. It has a big comment that seems to point towards more things to
look at.


Thanks,
pq

> - The force properties should return false on TEST_ONLY
>=20
> - The force properties should not prevent the mode from showing up in the=
 list
>=20
> If the list is created by TEST_ONLY both things can't be fulfilled at the=
 same time obviously.
>=20
> I hope some can give more insights or has an idea how the properties coul=
d work best.
>=20
> > =20
> >>> A very interesting question is when should link-status failure not dr=
op
> >>> the current mode from the mode list, if other KMS properties affect t=
he
> >>> bandwidth etc. requirements of the mode. That mechanism is engineered
> >>> for old userspace that doesn't actually handle link-status but does
> >>> handle hotplug, so the hotplug triggers re-fetching the mode list and
> >>> userspace maybe trying again with a better luck since the offending
> >>> mode is gone. How to keep that working when introducing KMS properties
> >>> forcing the cable format, I don't know.
> >>>
> >>> As long as the other affecting KMS properties are all "auto", the
> >>> driver will probably exhaust all possibilities to make the mode work
> >>> before signalling link-status failure and pruning the mode.
> >>> Theoretically, as I have no idea what drivers actually do.   =20
> >> Isn't that exactly how the "preferred color format" property works in
> >> my patchset now? =20
> > There was an argument that "preferred" with no guarantees is not
> > useful enough. So I'm considering the force property instead.
> > The problem is, "auto" is not the only possible value.
> >
> > When the value is not "auto", should link failure drop the mode or not?
> > Userspace might change the value back to "auto" next time. If you
> > dropped the mode, it would be gone. If you didn't drop the mode,
> > userspace might be stuck picking the same non-working mode again and
> > again if it doesn't know about the force mode property.
> >
> > You could argue that changing the value back to "auto" needs to reset
> > the mode list, but that only gets us back to the "need to set
> > properties before getting mode list".
> >
> > Maybe there needs to be an assumption that if "force color format" is
> > not "auto", then link failure does not drop modes and userspace knows
> > to handle this. Messy.
> >
> > I'm afraid I just don't know to give any clear answer. It's also
> > possible that, as I'm not a kernel dev, I have some false assumptions
> > here.
> >
> >
> > Thanks,
> > pq
> > _______________________________________________
> > amd-gfx mailing list
> > amd-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/amd-gfx =20


--Sig_/z2Dax/eoTBxuhffMJDUbe+M
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmDkAbYACgkQI1/ltBGq
qqcPQw/9HbDu7ifTsttDDq9v9WlV542lloLz89NaONco2iQ/EntkKQAVGOJ3wc9q
63lQRmektjAlLfWc6Wdq0JLVrxfgEKezXK+3HGWL7PMH2QxClzBVNwmYR/9cJnUi
gh+4R55sp6sKS476ifc+Qha4lfsOmb0UUY8Q3VKQFavCpLauiw9d5M+rVGZvviSP
ym0sitWiTw7N8opt6ybAaEjgDJBWCmBIf/0i2lTBiN+jWsPoNO8P1PuGh+MGQ+c6
rAxPWlQCD7FJspz78tOifVCWzyAibZbt+QzRuEfNIuLhBGvAyajBlD5ssx4pVPWK
yWbsw9Nn1MVfyNoAUUa3MeolFxdGSlZYaG5kDMUL9rl63A6ETrRGmnh3B61+dT8p
CSFE1cYuGdcrB4T9hc7x69bGU/AWflpknfVYD/xuRjoCr9QTDFzbzf020nA3oy7R
r3VLWqikz6jtM/YLnKhcJN5Hmgi31unx8OukC/j75kqQWSECKTYxeInk21TNByAb
oqOx3gPMK/1JdBePlxNhODCmKqwWtWQHnx5rKf2PW3LJF34Nvh8sinq9PnWPc/O1
M69sjUq4SI0WpOelJ5daT2Of0/uHywym45+i3T2urzehr6DMpF4HG+tt4eQJRWLD
X/Nx+k2wDbUwoeSDX1T/tyceWJcoVz4Zh7g1ICKv/RVBZk09prw=
=NVpM
-----END PGP SIGNATURE-----

--Sig_/z2Dax/eoTBxuhffMJDUbe+M--
