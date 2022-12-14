Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FA764CD40
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 16:47:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F44710E425;
	Wed, 14 Dec 2022 15:47:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16C8910E420;
 Wed, 14 Dec 2022 15:47:08 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id m204so2919656oib.6;
 Wed, 14 Dec 2022 07:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IXbXkKCg8NhDpqcHKjXQ2T0FgVAjfIuVdT7Hi979NGI=;
 b=iB/iiBAgVmOsM0PcustLZ06esD89Ay9TwVNGb64ImCmrBF3jk+gllY7FvF6tZN/b9a
 zi0o6nfvblkQIk24iJF6kb/TTGtVywPkcXH6oRQS7H4rS4DXRlypUIDNzgecvllcpnNW
 nAgrk3AfKqOEFSM4w6ynp+8dcs/TRZOttTXm9Khc7I95Bds1UrogMpg+iwJYySRSGBpQ
 CZGaw00M5K8kPIPvtJKEJ7YrlQF0VJKTdsKnwmxnqr+9UsYOlfpYvfrgB8XJy3fDkZNa
 wsKAiVrXOxmtXCqk9HgsUZet2obD3/3UHh8rq1gZFILbIjzSMOtC1Qp+PN/s3GOn8vn7
 sUOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IXbXkKCg8NhDpqcHKjXQ2T0FgVAjfIuVdT7Hi979NGI=;
 b=NcUiNev8HhuL5EMpvQ3F2FZGLnE1CFEpLUNQm00b05rw5875yPuD055FrC/ouDhGP/
 /NKOVJFeR6fx7YDbGV6jINQIXd1wqANgjqCzvBKIl8fpFLGfSgie9+pQEqkba7RUCq9w
 PEiFaIrVAelga+bjt6vxlKKLtK8pLCNDCh6spelXHRF4IgT5HaKgyhsHf9WZ/Oeo6NCB
 VLLo4rSneWsJ9C0XisxiMCQA7UgpWfddFwY9Vkum/zo4SiBHO3OYHGZoffMjJ3eCO7dS
 jJQmuqef0yqb2AViVMzqJfL1B3WnA/wRJCDnssDVohL0n/xrVTQcZuH8dPe4Nj/Q9zqI
 ftTg==
X-Gm-Message-State: ANoB5pnXPGaA+lJp0m9GJfcV8f+C02JqYLJokD3J2OCtJiE8sLAZnjA3
 EIND2gDgA+x3RhP8a3zar2KLPpKyjzl158Ka5n6PoGQ4
X-Google-Smtp-Source: AA0mqf5XgTyHQPWefyM5LdlzE+aHVXguDmcSd1SpgOiochmV3H9pfXgBB+4jvSAKTPQUeD6xPjA9AoogyMp8uKHwHtI=
X-Received: by 2002:a05:6808:1cd:b0:35b:f5f7:3ed0 with SMTP id
 x13-20020a05680801cd00b0035bf5f73ed0mr190876oic.46.1671032827275; Wed, 14 Dec
 2022 07:47:07 -0800 (PST)
MIME-Version: 1.0
References: <20221212182137.374625-1-harry.wentland@amd.com>
 <20221212182137.374625-17-harry.wentland@amd.com>
 <114c2e02-41c8-8576-f88d-1c50f41deb9e@mailbox.org>
 <20221214110128.1cd58dea@eldfell>
In-Reply-To: <20221214110128.1cd58dea@eldfell>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 14 Dec 2022 10:46:55 -0500
Message-ID: <CADnq5_M8Z2QRze60AFtmF6jTw8zpTpM-MPPmgejoUCb7Rv1ZrA@mail.gmail.com>
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

On Wed, Dec 14, 2022 at 4:01 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
> On Tue, 13 Dec 2022 18:20:59 +0100
> Michel D=C3=A4nzer <michel.daenzer@mailbox.org> wrote:
>
> > On 12/12/22 19:21, Harry Wentland wrote:
> > > This will let us pass kms_hdr.bpc_switch.
> > >
> > > I don't see any good reasons why we still need to
> > > limit bpc to 8 bpc and doing so is problematic when
> > > we enable HDR.
> > >
> > > If I remember correctly there might have been some
> > > displays out there where the advertised link bandwidth
> > > was not large enough to drive the default timing at
> > > max bpc. This would leave to an atomic commit/check
> > > failure which should really be handled in compositors
> > > with some sort of fallback mechanism.
> > >
> > > If this somehow turns out to still be an issue I
> > > suggest we add a module parameter to allow users to
> > > limit the max_bpc to a desired value.
> >
> > While leaving the fallback for user space to handle makes some sense
> > in theory, in practice most KMS display servers likely won't handle
> > it.
> >
> > Another issue is that if mode validation is based on the maximum bpc
> > value, it may reject modes which would work with lower bpc.
> >
> >
> > What Ville (CC'd) suggested before instead (and what i915 seems to be
> > doing already) is that the driver should do mode validation based on
> > the *minimum* bpc, and automatically make the effective bpc lower
> > than the maximum as needed to make the rest of the atomic state work.
>
> A driver is always allowed to choose a bpc lower than max_bpc, so it
> very well should do so when necessary due to *known* hardware etc.
> limitations.
>

In the amdgpu case, it's more of a preference thing.  The driver would
enable higher bpcs at the expense of refresh rate and it seemed most
users want higher refresh rates than higher bpc.  I guess the driver
can select a lower bpc at its discretion to produce what it thinks is
the best default, but what about users that don't want the default?

Alex


> So things like mode validation cannot just look at a single max or min
> bpc, but it needs to figure out if there is any usable bpc value that
> makes the mode work.
>
> The max_bpc knob exists only for the cases where the sink undetectably
> malfunctions unless the bpc is artificially limited more than seems
> necessary. That malfunction requires a human to detect, and reconfigure
> their system as we don't have a quirk database for this I think.
>
> The question of userspace wanting a specific bpc is a different matter
> and an unsolved one. It also ties to userspace wanting to use the
> current mode to avoid a mode switch between e.g. hand-off from firmware
> boot splash to proper userspace. That's also unsolved AFAIK.
>
> OTOH, we have the discussion that concluded as
> https://gitlab.freedesktop.org/wayland/weston/-/issues/612#note_1359898
> which really puts userspace in charge of max_bpc, so the driver-chosen
> default value does not have much impact as long as it makes the
> firmware-chosen video mode to continue, as requested in
> https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/995
> given that userspace cannot know what the actual bpc currently is nor
> set the exact bpc to keep it the same.
>
>
> Thanks,
> pq
