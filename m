Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B3E1D0A43
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 09:49:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35F226E9A0;
	Wed, 13 May 2020 07:49:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA6926E99C
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 07:49:55 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id s9so12784703lfp.1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 00:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=i22H32NQ5Vp2F7ve1GSzclQT2cnc834Kyzmx0o6H3Og=;
 b=blCkhL0r8uNVTPeQl8O9sxfrsBMZlZjT3jP/2v/2RZL5OzPYV6WHDEKY/xvvPXxG7o
 DctW8kqhip+kkieKPtlvvnksZGihR1IC3p6ieJck1W/tDwmXgoGZ16mcM8mI5znrmBst
 du/wySRAoce6QOq7201RHYTxnI5eYzux7vWmi8xLyKtR3loGRVy3Vicu21ops2EsANcU
 6p4Z0sfWDNCGyMqsQzaHQOyuSHKZk5owvu1/2z1Pzy7fXc2Gt2x16tCw2F+I61wF15kI
 OqH631uslILB/hTCt4mfWOKW9E19t0y/kk/ZCDxP+MshTRvtkezPnlAYu+AaRjnIOyic
 PHBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=i22H32NQ5Vp2F7ve1GSzclQT2cnc834Kyzmx0o6H3Og=;
 b=P06P4kgi2NMwl45U26RH6l7i5yzbMzk62mRm7+pmoEz7UE5PRCS9EHaFqQF0fIi7sI
 22ugKdF4y+Qj80aV7EOFmu/ltnWUXBatUBMUq5cGxtQNs4YKDRPJjExYzO3hCG3g3FVS
 dB4lUc4NgRW29MjwRS12ZWmL4Tb4+u1Xfdfakj4m98hZG4j048XUGcL9x17XBOMlFQ9+
 VOGZRMoHHwXn0n5PbyqjCbZrEQ+kSQcKa9qiiQme1LC9bSMDR4HScqrTxGdxOix+ja65
 E/Ufd1qAwWCTiVEL6MYdaTBDXz80FyBrN/8MFzA2NpMXJZvsrhTL57A5/adrgRn+v0SJ
 HOqw==
X-Gm-Message-State: AOAM530yuSUZWpKpZvX7hq0+gpLbhrB1VYRpW+eciOB3xVmMVcML3hbp
 FgiK7tvnaTLlUpLDFbyxIJk=
X-Google-Smtp-Source: ABdhPJxLQGhm5juGHQVPAQ2HxDRK68TueldeAgZYYWUK8WdwUiPgg9P8Ol7N4AgiIisnlKTzdQUEJg==
X-Received: by 2002:ac2:5293:: with SMTP id q19mr17424088lfm.90.1589356194019; 
 Wed, 13 May 2020 00:49:54 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id q7sm14652835ljp.20.2020.05.13.00.49.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2020 00:49:53 -0700 (PDT)
Date: Wed, 13 May 2020 10:49:43 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>, Rajat Jain <rajatja@google.com>
Subject: Re: [RFC v2 0/1] drm/connector: Add support for privacy-screen
 properties
Message-ID: <20200513104943.34d92639@eldfell.localdomain>
In-Reply-To: <a415bd37-ae23-9cd9-dff3-702824685a60@redhat.com>
References: <20200511174724.21512-1-hdegoede@redhat.com>
 <CACK8Z6HG3sM-4cBYurHCba1jopk_5SVBd7KULEvOR27eKfxpyg@mail.gmail.com>
 <8f273c2a-2544-10fa-02f3-832cb1f398ad@redhat.com>
 <20200512172032.185de3d7@eldfell.localdomain>
 <a415bd37-ae23-9cd9-dff3-702824685a60@redhat.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: Sonny.Quintanilla@dell.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Mario Limonciello <mario.limonciello@dell.com>,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Jared Dominguez <jaredz@redhat.com>, Mark Pearson <mpearson@lenovo.com>
Content-Type: multipart/mixed; boundary="===============0517281715=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0517281715==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ru1t6lvSxJP69w8E5oTYjXe"; protocol="application/pgp-signature"

--Sig_/ru1t6lvSxJP69w8E5oTYjXe
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 12 May 2020 18:09:15 +0200
Hans de Goede <hdegoede@redhat.com> wrote:

> Hi,
>=20
> On 5/12/20 4:20 PM, Pekka Paalanen wrote:
> > On Tue, 12 May 2020 10:18:31 +0200
> > Hans de Goede <hdegoede@redhat.com> wrote:
> >  =20
> >> Hi,
> >>
> >> On 5/11/20 9:55 PM, Rajat Jain wrote: =20
> >>> Hi Hans,
> >>>
> >>> On Mon, May 11, 2020 at 10:47 AM Hans de Goede <hdegoede@redhat.com <=
mailto:hdegoede@redhat.com>> wrote:
> >>>
> >>>      Hi All,
> >>>
> >>>      This RFC takes Rajat's earlier patch for adding privacy-screen p=
roperties
> >>>      infra to drm_connector.c and then adds the results of the discus=
sion from
> >>>      the "RFC: Drm-connector properties managed by another driver / p=
rivacy
> >>>      screen support" mail thread on top, hence the v2.
> >>>
> >>>
> >>> Thank you so much for doing this. I was following the said discussion=
 and eventually it became quite complex for me to understand and follow :-)=
 =20
> >>
> >> I hope the new doc text makes things clear again?
> >>
> >> =20
> >>>      The most important thing here is big kernel-doc comment which ge=
ts added in
> >>>      the first patch-chunk modifying drm_connector.c, this summarizes=
, or at
> >>>      least tries to summarize, the conclusions of our previous discus=
sion on
> >>>      the userspace API and lays down the ground rules for how the 2 n=
ew
> >>>      "privacy-screen sw-state" and=C2=A0 "privacy-screen hw-state" pr=
operties are
> >>>      to be used both from the driver side as well as from the userspa=
ce side.
> >>>
> >>>      Other then that this modifies Rajat's patch to add 2 properties =
instead
> >>>      of one, without much other changes.
> >>>
> >>>      Rajat, perhaps you can do a new version of your patch-set integr=
ation /
> >>>      using this version of the properties and then if everyone is ok =
with
> >>>      the proposed userspace API Jani can hopefully merge the whole set
> >>>      through the i915 tree sometime during the 5.9 cycle.
> >>>
> >>>
> >>> SGTM. I have actually moved to working on something else now, so I wi=
ll most likely wait for this patch to get merged, before rebasing my other =
/ remaining patches on top of that. =20
> >>
> >> We have the rule that code like this will not be merged until it has a=
t least
> >> one in kernel user. I plan to eventually use this too, but that is sti=
ll
> >> a while away as I first need to write a lcdshadow subsystem which the
> >> thinkpad_acpi code can then use to register a lcdshadow device; and wh=
en
> >> that all is in place, then I can hook it up on the drm code. =20
> >=20
> > Hi,
> >=20
> > I believe this falls under "new UAPI" rules, because this is adding new
> > KMS properties. Hence an in-kernel user is not enough:
> >=20
> > https://www.kernel.org/doc/html/latest/gpu/drm-uapi.html#open-source-us=
erspace-requirements =20
>=20
> Hmm, I believe that that mostly applies to new DRI (ioclt) interfaces for
> submitting rendering commands to new GPUs and other complex new APIs and
> not necessarily to introducing new properties.    Also note that all
> properties are exported under X through Xrandr, at least reading them,
> not sure about setting them.

Please check with Daniel Vetter.

My belief is that all new KMS properties that were never exposed by any
driver before are new UAPI.

My personal opinion is that Xorg/RandR exposing a KMS property does
*not* count as real userspace *alone*. Simply plumbing a KMS property
through RandR and then nothing actually using it does not prove
anything about the property's design or usability.

IMO, if you use Xorg/RandR as your userspace, you also need something
that uses RandR and really pokes at the new property to prove it's
viable.

But that's just me.

> Anyways I do plan to write some mutter code to test my lcdshadow subsys <=
->
> DRM driver integration when that is all more then just vaporware. But I
> would prefer for Rajat's series to land before that so that I can build
> on top of it.

The DRM maintainers make that call.


On Tue, 12 May 2020 10:38:11 -0700
Rajat Jain <rajatja@google.com> wrote:

> The chrome browser currently uses the API exposed by my (previous)
> patchset to control privacy screen.
> https://source.chromium.org/chromium/chromium/src/+/master:ui/ozone/platf=
orm/drm/common/drm_util.cc;l=3D180?q=3D%22privacy-screen%22%20-f:third_part=
y%2Fkernel%2Fv&originalUrl=3Dhttps:%2F%2Fcs.chromium.org%2F
>=20
> I know this doesn't help directly, but just to say that there are
> users waiting to use an API that we release. If these changes are
> accepted, I expect to see the change in browser again, to match the
> new API,  although that will be not until we decide to uprev our
> kernel again.

Chromium counts as userspace, I think many new features have landed
with it as the userspace.

Is that from some development branch, not actually merged or released
yet? If yes, very good. When you submit kernel patches with new UAPI,
it would be nice to point to the userspace review discussion where the
userspace patches have been reviewed and accepted but not merged.


Thanks,
pq

--Sig_/ru1t6lvSxJP69w8E5oTYjXe
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl67ppcACgkQI1/ltBGq
qqfftQ/+N6Ab3b1FEAxJif9cIua6wobL0+NczNcdN24/cOFyTnNyCk6HDPnAVT1k
T7lzf8AEfOu2ZNxM48kR3znS4e1wMeJHwU59E/nvR9QnIDNZHsBfFwfm7a8bzeIT
P0tRvTjKzCrwCA+IMsI+CC1otJGAaT5C1VgzRAJFcqih3zCehhg6ockpGN/yG8vj
y/UfcqCKql1nA94bDJvDlOtS7BGk0n8qnOtD2Sj3ufjYlUH+D5DbK/uokPEnj+lS
xCWfOdFsSpTnaScLwE1xW6rL/17Ty91P1QdfNLHg73/+GRM8yYB+5dTmciozbXZ7
31t65SERNqfFD9wXpOd45CwCGFLAwkC47kjU2NUMyPkRv5AYrcBUBfBXPQdxlh0Z
3ylfp/Zi6JaMFxQMJ01h8mkdX24PEvhOPkLXh+9cyKEhLh9heex7G5vs2yuRwKkm
rMVj5VMasznAhKBIuOYzM8O7sdAICxf2A0TNE/yRkWMOsTuLKy8ne8tRz12AaRVc
Vc9iz4RF546Zvuy9NofBoAfrljZVTopXoSfgCfqS6xh8X3/jHbshCrsDOtrMYQlu
cOYCGjOLyz5kouJLNh+I0sNByw8T3a7eBIvZSTQSuCaYkX5YIsGVD+zPho4HcS7/
e3O6OqVIWqSxqrYAC3Fcr7TM2yW3czDrNlJK9TjdmKxix2JizM8=
=a2uU
-----END PGP SIGNATURE-----

--Sig_/ru1t6lvSxJP69w8E5oTYjXe--

--===============0517281715==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0517281715==--
