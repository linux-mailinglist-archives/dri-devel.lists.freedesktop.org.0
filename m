Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C94E364DFBA
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 18:34:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EAE410E430;
	Thu, 15 Dec 2022 17:34:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 467EC10E426;
 Thu, 15 Dec 2022 17:34:06 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-12c8312131fso157946fac.4; 
 Thu, 15 Dec 2022 09:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=07sbyEKd47d3PsOGe9uzMzj2IsUsry0oF+F0ySkgBoQ=;
 b=CpjedOi3GC7vDaod5su84Nd5+SScJet5Y4cvz1apuEbizFNaYjdnOqYpZM9pqiTAn8
 7f8ZX0sLGC1ghaVIJVrfwyJj9RjM4qVcCgLaQPMrAhPCaZ1mlo0BuyKPBgaCSVqA7kqC
 kE31xtFojUohGddxXnNwR5BK1FRwqXYXzjdRCyB75DNNhxKWwfQB5D8N51+OW1PNa/4H
 3ZXd1fpcAKfedpQFKAG4mT+l13lw0rjofHWi6YxopM5eEFUUdj/p9eRSwtxWiNgSraWA
 XLKwbZW6fx9D4kpVIZXVfAuVEIRAs5aHj+ezbftWp1guPNVeelArBFS/WRtU7yNAwmHo
 4Jww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=07sbyEKd47d3PsOGe9uzMzj2IsUsry0oF+F0ySkgBoQ=;
 b=8Ed+PFa2lC4FctsU17axeIm8kgyaBJJUx4I+XnBI9wQhHs74vciY3lUYWbVp6hm91T
 C5gPIhgT+ZJy6HkMNyvT21OqkIixmKOZosFMlc62ukYdF/DKeD5GLglugKZj/XZ6Eo9E
 aHZJhzRDgQrZE6TzSRer0647xNQfJHpLaucNu6y4//5AP3vkah9INcCpXnpM91xJ+riO
 NCuyp7z/sjwtPxFHwJcJqRO/mJZjwpTy8CH3A5RfBDWwz7OUb4hQupwp2Pjc45Uo2DlY
 7tpK22ZLDT61PTxs4s8of7Qa/X8zo8CahHDt3tPb7+ZwaAgYPuQbNrGYDcHw6HRu/v6u
 Xeaw==
X-Gm-Message-State: AFqh2koAGQoNB6CwURT7DElRNAmcYXZMr1ngg4t8itHdY5d1RVM46G5z
 kpjQUI6mky8yl1TM1u/cQaHVGTy78kEEdWjufho=
X-Google-Smtp-Source: AMrXdXuAlHUdmaNDVj3zmKuRQ6gmUlnYVs5cLgjAlYWwj/O50GwEaGz2WjJc7NTdVSbuNwm4n/WiNe0iJjKgTozKWI8=
X-Received: by 2002:a05:6870:4687:b0:143:8a81:116c with SMTP id
 a7-20020a056870468700b001438a81116cmr750748oap.96.1671125645519; Thu, 15 Dec
 2022 09:34:05 -0800 (PST)
MIME-Version: 1.0
References: <20221212182137.374625-1-harry.wentland@amd.com>
 <20221212182137.374625-17-harry.wentland@amd.com>
 <114c2e02-41c8-8576-f88d-1c50f41deb9e@mailbox.org>
 <20221214110128.1cd58dea@eldfell>
 <CADnq5_M8Z2QRze60AFtmF6jTw8zpTpM-MPPmgejoUCb7Rv1ZrA@mail.gmail.com>
 <20221215111729.50ee7808@eldfell>
In-Reply-To: <20221215111729.50ee7808@eldfell>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 15 Dec 2022 12:33:54 -0500
Message-ID: <CADnq5_N+7PuWNVLaY4DLx0A3R_qSLEfJnmSFm9NbXjndKtK-ZA@mail.gmail.com>
Subject: Re: [PATCH 16/16] drm/amd/display: Don't restrict bpc to 8 bpc
To: Pekka Paalanen <ppaalanen@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 amd-gfx@lists.freedesktop.org, Uma Shankar <uma.shankar@intel.com>,
 dri-devel@lists.freedesktop.org, Joshua Ashton <joshua@froggi.es>,
 Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 15, 2022 at 4:17 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
> On Wed, 14 Dec 2022 10:46:55 -0500
> Alex Deucher <alexdeucher@gmail.com> wrote:
>
> > On Wed, Dec 14, 2022 at 4:01 AM Pekka Paalanen <ppaalanen@gmail.com> wr=
ote:
> > >
> > > On Tue, 13 Dec 2022 18:20:59 +0100
> > > Michel D=C3=A4nzer <michel.daenzer@mailbox.org> wrote:
> > >
> > > > On 12/12/22 19:21, Harry Wentland wrote:
> > > > > This will let us pass kms_hdr.bpc_switch.
> > > > >
> > > > > I don't see any good reasons why we still need to
> > > > > limit bpc to 8 bpc and doing so is problematic when
> > > > > we enable HDR.
> > > > >
> > > > > If I remember correctly there might have been some
> > > > > displays out there where the advertised link bandwidth
> > > > > was not large enough to drive the default timing at
> > > > > max bpc. This would leave to an atomic commit/check
> > > > > failure which should really be handled in compositors
> > > > > with some sort of fallback mechanism.
> > > > >
> > > > > If this somehow turns out to still be an issue I
> > > > > suggest we add a module parameter to allow users to
> > > > > limit the max_bpc to a desired value.
> > > >
> > > > While leaving the fallback for user space to handle makes some sens=
e
> > > > in theory, in practice most KMS display servers likely won't handle
> > > > it.
> > > >
> > > > Another issue is that if mode validation is based on the maximum bp=
c
> > > > value, it may reject modes which would work with lower bpc.
> > > >
> > > >
> > > > What Ville (CC'd) suggested before instead (and what i915 seems to =
be
> > > > doing already) is that the driver should do mode validation based o=
n
> > > > the *minimum* bpc, and automatically make the effective bpc lower
> > > > than the maximum as needed to make the rest of the atomic state wor=
k.
> > >
> > > A driver is always allowed to choose a bpc lower than max_bpc, so it
> > > very well should do so when necessary due to *known* hardware etc.
> > > limitations.
> > >
> >
> > In the amdgpu case, it's more of a preference thing.  The driver would
> > enable higher bpcs at the expense of refresh rate and it seemed most
> > users want higher refresh rates than higher bpc.
>
> Hi Alex,
>
> we already have userspace in explicit control of the refresh rate.
> Userspace picks the refresh rate first, then the driver silently checks
> what bpc is possible. Userspace preference wins, so bpc is chosen to
> produce the desired refresh rate.
>
> In what cases does the driver really pick a refresh rate on its own?

It didn't, but IIRC, at the time the driver filtered out modes that it
could not support with the max bpc.  It looks like that has been fixed
now, so maybe this whole discussion is moot.

Alex

>
> Or is this about display latency more than throughput, to send a full
> frame in shorter time while not actually increasing refresh rate?
>
> Even for VRR, userspace already explicitly chooses the max refresh
> rate, I believe.
>
> I suppose optimising power consumption by choosing a lower bpc than
> what would work is a use case, but that's a bit awkward currently
> because there is no way for userspace to opt-out of that. OTOH,
> userspace can already opt-in for that by lowering max_bpc.
>
> >  I guess the driver
> > can select a lower bpc at its discretion to produce what it thinks is
> > the best default, but what about users that don't want the default?
>
> That's what we need explicit bpc control KMS properties for, e.g.
> min_bpc to complement max_bpc (I recall old discussions about this).
> Only userspace could know what a particular end user wants.
>
> To ask this differently: in what cases would max_bpc become the wanted
> bpc in a way that it overrides the explicitly set video mode (refresh
> rate), or would cause a modeset to fail if a lower bpc would make the
> modeset succeed?
>
> The very definition of max_bpc is that it's the upper limit, and not the
> desired bpc. The UAPI documentation says:
>
> max bpc:
>
>     This range property is used by userspace to limit the bit depth.
>     When used the driver would limit the bpc in accordance with the
>     valid range supported by the hardware and sink. Drivers to use the
>     function drm_connector_attach_max_bpc_property() to create and
>     attach the property to the connector during initialization.
>
> Git archaeology revealed that this property was first intended to work
> around broken sinks and not for user preferences.
>
>
> Thanks,
> pq
>
> >
> > Alex
> >
> >
> > > So things like mode validation cannot just look at a single max or mi=
n
> > > bpc, but it needs to figure out if there is any usable bpc value that
> > > makes the mode work.
> > >
> > > The max_bpc knob exists only for the cases where the sink undetectabl=
y
> > > malfunctions unless the bpc is artificially limited more than seems
> > > necessary. That malfunction requires a human to detect, and reconfigu=
re
> > > their system as we don't have a quirk database for this I think.
> > >
> > > The question of userspace wanting a specific bpc is a different matte=
r
> > > and an unsolved one. It also ties to userspace wanting to use the
> > > current mode to avoid a mode switch between e.g. hand-off from firmwa=
re
> > > boot splash to proper userspace. That's also unsolved AFAIK.
> > >
> > > OTOH, we have the discussion that concluded as
> > > https://gitlab.freedesktop.org/wayland/weston/-/issues/612#note_13598=
98
> > > which really puts userspace in charge of max_bpc, so the driver-chose=
n
> > > default value does not have much impact as long as it makes the
> > > firmware-chosen video mode to continue, as requested in
> > > https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/995
> > > given that userspace cannot know what the actual bpc currently is nor
> > > set the exact bpc to keep it the same.
> > >
> > >
> > > Thanks,
> > > pq
>
