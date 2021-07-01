Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 158043B9237
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 15:25:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF29F6EB0F;
	Thu,  1 Jul 2021 13:24:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BC736EB0E;
 Thu,  1 Jul 2021 13:24:58 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id k8so8449838lja.4;
 Thu, 01 Jul 2021 06:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=5/N7mzUAeULeAAxL5YtoCIilrbc1XZmeK0B5sNxzUeg=;
 b=IgycJGSJBcj80+eyJx3UyqL0WBT8ec0fphzbUcvmUzFLoTqrbU0AS2ULwJ/hE/M3jF
 C6wfq+0qe+6bLZoUVNSjKk89POb33Mwzi7BBVlVz0UMxA85Iz+kifj72KVfcjh4vhW8h
 VFaDZDCFsTrCx2ATyNeaYlLOiqRr6zlqehk6wShFMnT4ZCQX2wIt7pFujGfT9tvH3TIQ
 dk0hwGV6MAoC3mjFxomH6eu2+kmCmeHtQOLzHMgJHnh80dU0QSQkVu4162ghBPWx7URS
 5Hs82mh7S+rYZ+fvcm1XGBX9Q3EUbRabYoKJ8/pMvJiyoDRzSgkEAMo63GN8lLpTpUOE
 /6kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=5/N7mzUAeULeAAxL5YtoCIilrbc1XZmeK0B5sNxzUeg=;
 b=I9Ek4KPNZc25Tyq+ka5hB6U+7YvSZRon4ImEJYMybj654oNFFR3bzWQu2Tm6X9BRJm
 0oH9d4IlVPcQoNN0cFOVEJNErpxyd5M4g5OleP7OCwySJkv5v/hyNNkIPzmVBmSBMPhO
 9EPXeZsvUZROpWrxADXkm62ayrCseOeeWtx4qnk60PZhgDJpMG1c58AOoBE1sT9nspVQ
 t3Q/XbH6WdrnWI79/a/kz2vgApvNqXFAgNPbsu2f6Pv5v+Iz3GxM5HZlm+NkSM7sCnqa
 zIGer1Ylq3h+Vu6PLVJKyI2/VsZL97iRcRml3pQ1IlrKSd98f9c2chJ5JEgg/k/AXak5
 xa8A==
X-Gm-Message-State: AOAM530hraeXBbw9qZtQq4AXI0h/PSmGheSNVdZocZATcl6Q0GpWJ1MK
 uziW00FSHeAJ+sipBXDyd6A=
X-Google-Smtp-Source: ABdhPJwvI3CXHQFWMdsGKQkWtw9DiG11eOBjZ3EjWs9OHYiX/UBNJ2vaVFp4zukqfUOM3ufZngyAgg==
X-Received: by 2002:a2e:8584:: with SMTP id b4mr8287171lji.277.1625145896847; 
 Thu, 01 Jul 2021 06:24:56 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id u26sm1345012lfd.256.2021.07.01.06.24.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 06:24:56 -0700 (PDT)
Date: Thu, 1 Jul 2021 16:24:46 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Werner Sembach <wse@tuxedocomputers.com>
Subject: Re: [PATCH v4 12/17] drm/uAPI: Add "preferred color format" drm
 property as setting for userspace
Message-ID: <20210701162446.14f4f577@eldfell>
In-Reply-To: <b7144386-a98b-faf9-b425-c1157d9d0241@tuxedocomputers.com>
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
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Y4YmqX2wcipYT4My_T+NbPj";
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
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de, rodrigo.vivi@intel.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/Y4YmqX2wcipYT4My_T+NbPj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 1 Jul 2021 14:50:13 +0200
Werner Sembach <wse@tuxedocomputers.com> wrote:

> Am 01.07.21 um 10:07 schrieb Pekka Paalanen:
>=20
> > On Wed, 30 Jun 2021 11:20:18 +0200
> > Werner Sembach <wse@tuxedocomputers.com> wrote:
> > =20
> >> Am 30.06.21 um 10:41 schrieb Pekka Paalanen:
> >> =20
> >>> On Tue, 29 Jun 2021 13:39:18 +0200
> >>> Werner Sembach <wse@tuxedocomputers.com> wrote:
> >>>   =20
> >>>> Am 29.06.21 um 13:17 schrieb Pekka Paalanen:   =20
> >>>>> On Tue, 29 Jun 2021 08:12:54 +0000
> >>>>> Simon Ser <contact@emersion.fr> wrote:
> >>>>>      =20
> >>>>>> On Tuesday, June 22nd, 2021 at 09:15, Pekka Paalanen <ppaalanen@gm=
ail.com> wrote:
> >>>>>>      =20
> >>>>>>> yes, I think this makes sense, even if it is a property that one =
can't
> >>>>>>> tell for sure what it does before hand.
> >>>>>>>
> >>>>>>> Using a pair of properties, preference and active, to ask for som=
ething
> >>>>>>> and then check what actually worked is good for reducing the
> >>>>>>> combinatorial explosion caused by needing to "atomic TEST_ONLY co=
mmit"
> >>>>>>> test different KMS configurations. Userspace has a better chance =
of
> >>>>>>> finding a configuration that is possible.
> >>>>>>>
> >>>>>>> OTOH, this has the problem than in UI one cannot tell the user in
> >>>>>>> advance which options are truly possible. Given that KMS properti=
es are
> >>>>>>> rarely completely independent, and in this case known to depend on
> >>>>>>> several other KMS properties, I think it is good enough to know a=
fter
> >>>>>>> the fact.
> >>>>>>>
> >>>>>>> If a driver does not use what userspace prefers, there is no way =
to
> >>>>>>> understand why, or what else to change to make it happen. That pr=
oblem
> >>>>>>> exists anyway, because TEST_ONLY commits do not give useful feedb=
ack
> >>>>>>> but only a yes/no.   =20
> >>>>>> By submitting incremental atomic reqs with TEST_ONLY (i.e. only ch=
anging one
> >>>>>> property at a time), user-space can discover which property makes =
the atomic
> >>>>>> commit fail.   =20
> >>>>> That works if the properties are independent of each other. Color
> >>>>> range, color format, bpc and more may all be interconnected,
> >>>>> allowing only certain combinations to work.
> >>>>>
> >>>>> If all these properties have "auto" setting too, then it would be
> >>>>> possible to probe each property individually, but that still does n=
ot
> >>>>> tell which combinations are valid.
> >>>>>
> >>>>> If you probe towards a certain configuration by setting the propert=
ies
> >>>>> one by one, then depending on the order you pick the properties, you
> >>>>> may come to a different conclusion on which property breaks the
> >>>>> configuration.   =20
> >>>> My mind crossed another point that must be considered: When plugin in
> >>>> a Monitor a list of possible Resolutions+Framerate combinations is
> >>>> created for xrandr and other userspace (I guess by atomic checks? but
> >>>> I don't know).   =20
> >>> Hi,
> >>>
> >>> I would not think so, but I hope to be corrected if I'm wrong.
> >>>
> >>> My belief is that the driver collects a list of modes from EDID, some
> >>> standard modes, and maybe some other hardcoded modes, and then
> >>> validates each entry against all the known limitations like vertical
> >>> and horizontal frequency limits, discarding modes that do not fit.
> >>>
> >>> Not all limitations are known during that phase, which is why KMS
> >>> property "link-status" exists. When userspace actually programs a mode
> >>> (not a TEST_ONLY commit), the link training may fail. The kernel prun=
es
> >>> the mode from the list and sets the link status property to signal
> >>> failure, and sends a hotplug uevent. Userspace needs to re-check the
> >>> mode list and try again.
> >>>
> >>> That is a generic escape hatch for when TEST_ONLY commit succeeds, but
> >>> in reality the hardware cannot do it, you just cannot know until you
> >>> actually try for real. It causes end user visible flicker if it happe=
ns
> >>> on an already running connector, but since it usually happens when
> >>> turning a connector on to begin with, there is no flicker to be seen,
> >>> just a small delay in finding a mode that works.
> >>>   =20
> >>>> During this drm
> >>>> properties are already considered, which is no problem atm because as
> >>>> far as i can tell there is currently no drm property that would make
> >>>> a certain Resolutions+Framerate combination unreachable that would be
> >>>> possible with everything on default.   =20
> >>> I would not expect KMS properties to be considered at all. It would
> >>> reject modes that are actually possible if the some KMS properties we=
re
> >>> changed. So at least going forward, current KMS property values cannot
> >>> factor in.   =20
> >> At least the debugfs variable "force_yuv420_output" did change the=20
> >> available modes here:=20
> >> https://elixir.bootlin.com/linux/v5.13/source/drivers/gpu/drm/amd/disp=
lay/amdgpu_dm/amdgpu_dm.c#L5165=20
> >> before my patch=20
> >> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/com=
mit/?id=3D68eb3ae3c63708f823aeeb63bb15197c727bd9bf =20
> > Hi,
> >
> > debugfs is not proper UAPI, so we can just ignore it. Display servers
> > cannot be expected to poke in debugfs. Debugfs is not even supposed to
> > exist in production systems, but I'm sure people use it for hacking
> > stuff. But that's all it is for: developer testing and hacking. =20
> e.g. Ubuntu has it active by default, but only read (and writable) by roo=
t.

Hi,

that's normal, yes. Root can do damage anyway, and it's useful for
debugging. KMS clients OTOH often do not run as root.

> > =20
> >> Forcing a color format via a DRM property in this function would=20
> >> reintroduce the problem. =20
> > The property would need to be defined differently because its presence
> > could otherwise break existing userspace. Well, I suppose it could
> > break existing userspace no matter what, so we would need the generic
> > "reset to sane defaults" mechanism first IMO.
> >
> > DRM has client caps for exposing video modes that old userspace might
> > not expect, to avoid breaking old userspace. Care needs to be taken
> > with all new UAPI, because if a kernel upgrade makes something wrong,
> > it's the kernel's fault no matter what userspace is doing, in principle=
. =20
> Can you give me a link describing how I define this caps?

I don't have any, but you can find all the existing ones by grepping
for DRM_CLIENT_CAP_.

I'm not saying that we need it, but mentioning them as a possible
workaround if userspace breakage seems imminent or is proven.

> >
> > Debugfs has no problem breaking userspace AFAIU, since it's not proper
> > UAPI.
> > =20
> >> And I think i915 driver works similar in this regard.
> >> =20
> >>>   =20
> >>>> However for example forcing YCbCr420 encoding would limit the
> >>>> available resolutions (my screen for example only supports YCbCr420
> >>>> on 4k@60 and @50Hz and on no other resolution or frequency (native is
> >>>> 2560x1440@144Hz).
> >>>>
> >>>> So would a "force color format" that does not get resetted on
> >>>> repluging/reenabling a monitor break the output, for example, of an
> >>>> not updated xrandr, unaware of this new property?   =20
> >>> Yes, not because the mode list would be missing the mode, but because
> >>> actually setting the mode would fail.   =20
> >> Well, like described above, I think the mode would actually be missing=
,=20
> >> which is also an unexpected behavior from a user perspective. =20
> > I think that is not how the property should work.
> >
> > If KMS properties would affect the list of modes, then userspace would
> > need to set the properties for real (TEST_ONLY cannot change anything)
> > and re-fetch the mode lists (maybe there is a hotplug event, maybe
> > not). That workflow just doesn't work. =20

> The properties are set before the list is created in the first place.
> Because, in my example, the properties get set before the monitor is
> plugged in and the list can only be created as soon as the monitor is
> plugged in.

That's just an accident, it's not what I mean.

What I mean is, we cannot have the KMS properties affect the list of
modes, because then userspace that want to use specific values on those
properties would have to program those properties first, and then get
the list of modes. KMS UAPI does not work that way AFAIK.

If the initial mode list is created on hotplug like you say, then the
initial list could already be missing some modes that would be valid if
some KMS properties had different values.

> >
> > A very interesting question is when should link-status failure not drop
> > the current mode from the mode list, if other KMS properties affect the
> > bandwidth etc. requirements of the mode. That mechanism is engineered
> > for old userspace that doesn't actually handle link-status but does
> > handle hotplug, so the hotplug triggers re-fetching the mode list and
> > userspace maybe trying again with a better luck since the offending
> > mode is gone. How to keep that working when introducing KMS properties
> > forcing the cable format, I don't know.
> >
> > As long as the other affecting KMS properties are all "auto", the
> > driver will probably exhaust all possibilities to make the mode work
> > before signalling link-status failure and pruning the mode.
> > Theoretically, as I have no idea what drivers actually do. =20

> Isn't that exactly how the "preferred color format" property works in
> my patchset now?

There was an argument that "preferred" with no guarantees is not
useful enough. So I'm considering the force property instead.
The problem is, "auto" is not the only possible value.

When the value is not "auto", should link failure drop the mode or not?
Userspace might change the value back to "auto" next time. If you
dropped the mode, it would be gone. If you didn't drop the mode,
userspace might be stuck picking the same non-working mode again and
again if it doesn't know about the force mode property.

You could argue that changing the value back to "auto" needs to reset
the mode list, but that only gets us back to the "need to set
properties before getting mode list".

Maybe there needs to be an assumption that if "force color format" is
not "auto", then link failure does not drop modes and userspace knows
to handle this. Messy.

I'm afraid I just don't know to give any clear answer. It's also
possible that, as I'm not a kernel dev, I have some false assumptions
here.


Thanks,
pq

--Sig_/Y4YmqX2wcipYT4My_T+NbPj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmDdwh4ACgkQI1/ltBGq
qqcVcxAAlkrSovkYPEUP3fmzbuGuZe/dNT2ljBbYG985X2es00EEZrFHTJ8qdla9
BtOOr7wcl+DK36rfwnuDKLxukzMg0LiTwvlpW4Cop177cZ9157HXA64uZc2xraH7
tbPZSz8fh/JT3DNxBiAdJQueoNmnKqg2Enesk2BqcyLTT4gKX5ZJPuh0evdDLv35
ProGbD8RUM0OM+ugdosO/MYuCUXiKCUQzPOuPoSoW0qSD2/nUlOdpFSyjBNBqtKu
ZicsuT29ZruvTmu9+tz/wbgXYV//hPPm06Oy6+i9x4XQE6dDsxPmahhG1ZHPN3k8
ISnuxNh/FCHBcX0TQLgb2dI6SqbKxKhmC0/NJ0oHqKJ6JVcoes5ZVuvg1rBCJ3xJ
DiiWP4sMgRV0iXEXdSioyIQQcIvuVh2qebUEcwHOwPJuf4qaXrs9l2jLtyo07ROG
Z4vjzg0wYZv5cPUD4Sfbx5ANbJhvgLgcekU3WBxphwDeyaQpWMnVtVWwYJE7xLkB
eT2kexrk90oFVLNiVhxRdag1FJm+bKE09cYOEQN/TF0+NyYY5ZbimeDvu+UKQ2YT
+bBktq22CjHK5KyDJcWJWEJ2YWHFsQ/wLf7JRgcC1DrEnnWVQAottL9QlZraB7Qk
tMPLWLGx4UB7J1tqqhQJmAYV9eu7ipjNLYonLRZWP++hMRPqnTQ=
=Jan+
-----END PGP SIGNATURE-----

--Sig_/Y4YmqX2wcipYT4My_T+NbPj--
