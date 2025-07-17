Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A30B09599
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 22:17:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FEA210E89A;
	Thu, 17 Jul 2025 20:17:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gwmail.gwu.edu header.i=@gwmail.gwu.edu header.b="QxpphMpF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FD4310E8A2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 20:17:38 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-ae0e0e464ecso26457466b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 13:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gwmail.gwu.edu; s=google; t=1752783457; x=1753388257;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UH34Lf0ESP2JrXnCIHNonEtQG8ScosPQrJ1HrYUjPlg=;
 b=QxpphMpFTQp/fbfIsUEZNJG3nzzJBAevVuCfsHt/WULnhLHTozZLkhJ36ez0kUBxY9
 ac3KDebZw1f0KEroD5C0KKdFG0peyw/OHLMEfdZfaJ97I/+lgrS0rhJ5n3QyF3dE7j8g
 vkjKzosjwCkCX2xSwZHECc9jIfJx70WnypsF3hARxFeG+17tyvLKLZCZEx816kkF+XRq
 tXwKEx77wyDFEciN3wLnE7qHcNfCG/PwTe+SOIPwZlLLY0qk964eXeJ/6Q0BFrL4agYC
 510yW1dMfY1XxeAlIUt/3ZYDBpKnGi0g88KTUTm842eihqDId7fsvLSFk8e2kmA7LB+Z
 TrGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752783457; x=1753388257;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UH34Lf0ESP2JrXnCIHNonEtQG8ScosPQrJ1HrYUjPlg=;
 b=SSL1qt21ncUW510O/nlxI4ZrEcoy+YTBqoDhr4gWuE99gg5lDoODm+MNcBVMGDPBCU
 cOfRTC5yLa27KIPq8XxFclKGxCbHQblX2zeHQpFcAU64Qvlq+EAoOTzI0iW3fsJ5eUwI
 lTtkHVPW2MOoiSi0MT3Vqk5Mgr5HhfpzVrv0jjU4vNWLW6f4MA8wBnj/1H7nRQc6H3R/
 qGB+GI9/1FdIVedInZCXlTPFIb4g8OZLTAuyYBeCeiFYZNUSbXnaZ1t7+POLJ6cOHf4g
 1/QN7eSSA5vMRqI0293GT3gvOG4GpRg5TdvOQt5xArHcX5BxsZnei2pDg+157aHL6udB
 nMDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEd1Hd59+N5fjrpl3Fb4Jhxeoq6vkTs7GoQ2A1WTrXBZIfzDW5amAwy3Vx8nzhiVIiL5AWGG9JyKY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyMSmP48FitHQVsdPlJt5evfbzFWIwIUmtN3imwgOVXT7W4Svvn
 hWOt/GVC9FJYI94IRrDWpjtn5Rn6E4/GOnzQxEXbntSc7zLc+x2kRvrn15bLEa0DY428DaY/XxR
 nWM1UXHTVm97Ybxz3PcXXNbPdutv7Fh+38LMJFFTS
X-Gm-Gg: ASbGncuYlDZFGKcNfr8AUMO3n9Tj9zaxzjNTn9wUAXTPeSokpkuEzCCqmHbPhYoUg6u
 j3n5lKYE9/dHcqnooZv7Ey4Nhic+Wm80dFrvLDWNAMgASSKXE1FRg19JxnieRvr0XfjEdPhYmkR
 JcAJxaKLCyADsEYsT5nyLG0yN786eEasWd3G0q6VRwy1gta0PsGRQjcsvF5Dx+W2n/pWqahGSs3
 kX9gZFH
X-Google-Smtp-Source: AGHT+IF6cpzRASJP8C2lNPTYw+fYWCmLp2cCk+13cKEa3WFh8RodnGYC06hOdutQ5Gsw4rVEqa4ZUhs56JX19Zc5seQ=
X-Received: by 2002:a17:907:3f20:b0:ae3:5118:96b3 with SMTP id
 a640c23a62f3a-ae9c99568c5mr300212366b.3.1752783456628; Thu, 17 Jul 2025
 13:17:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250717143738.84722-1-mwen@igalia.com>
 <70ac7b1e-9a28-45ff-b7b2-ab0f4fe9030a@amd.com>
 <bb4099a70c2a8c78ef07d5fb6a8f0d3b@igalia.com>
 <55467ebe-42c8-4387-9a61-aa60b3a84053@amd.com>
 <BA28247C-9779-4C4C-A8E3-ACF57BEF1521@gwmail.gwu.edu>
 <67169725b87e02cc8fdc19be5fc7df59@igalia.com>
 <CAD9O9Dq=dAsMs5a3VzgSvLwfuYYhkARDFBXyWUy+yktEZv5WbQ@mail.gmail.com>
 <bdfc8786-d4b8-4391-a4d4-c5fe06020802@igalia.com>
In-Reply-To: <bdfc8786-d4b8-4391-a4d4-c5fe06020802@igalia.com>
From: Matthew Schwartz <mattschwartz@gwmail.gwu.edu>
Date: Thu, 17 Jul 2025 13:17:25 -0700
X-Gm-Features: Ac12FXw6w1FfryiLjPBatPrTg8z_aNRzetpOfQG70dIFqv1FazB335bNAywtE9k
Message-ID: <CAD9O9DqxJQyAJM=po4yDbAC=hHK2pi12qTVYeb+ar_GenGpMnw@mail.gmail.com>
Subject: Re: [PATCH] Revert "drm/amd/display: limit clear_update_flags to
 dcn32 and above"
To: Melissa Wen <mwen@igalia.com>
Cc: "Limonciello, Mario" <Mario.Limonciello@amd.com>, "Wentland,
 Harry" <Harry.Wentland@amd.com>, 
 "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, 
 "Koenig, Christian" <Christian.Koenig@amd.com>, airlied@gmail.com,
 simona@ffwll.ch, 
 "Hung, Alex" <Alex.Hung@amd.com>, "Liu, Charlene" <Charlene.Liu@amd.com>,
 amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 17, 2025 at 12:43=E2=80=AFPM Melissa Wen <mwen@igalia.com> wrot=
e:
>
>
>
> On 17/07/2025 16:28, Matthew Schwartz wrote:
> > On Thu, Jul 17, 2025 at 12:18=E2=80=AFPM Melissa Wen <mwen@igalia.com> =
wrote:
> >> On 17-07-2025 17:57, Matthew Schwartz wrote:
> >>>> On Jul 17, 2025, at 9:58=E2=80=AFAM, Limonciello, Mario <Mario.Limon=
ciello@amd.com> wrote:
> >>>>
> >>>> On 7/17/25 11:55 AM, Melissa Wen wrote:
> >>>>> On 17-07-2025 13:39, Limonciello, Mario wrote:
> >>>>>> On 7/17/25 9:36 AM, Melissa Wen wrote:
> >>>>>>> This reverts commit e1bd5e0bb4ca0d633ad698abd3658f8265009b81.
> >>>>>>>
> >>>>>>> The commit causes a regression in Steam Deck (DCN 3.01), reintrod=
ucing a
> >>>>>>> functional issue reported in [1] that was fixed by calling the
> >>>>>>> clear_update_flags() from commit 7671f62c10f2a.
> >>>>>>>
> >>>>>>> On Steam Deck, we use multiple hw plane color caps and up to two =
overlay
> >>>>>>> planes with dynamic pipe split policy. I.e. with 1 primary + 1 ov=
erlay,
> >>>>>>> the driver split planes into two (with 4 pipes), but with 1 prima=
ry + 2
> >>>>>>> overlays, we don't have enough pipe for splitting. Glitches appea=
r in
> >>>>>>> this pipe-split transition of 1-2 overlay planes, if the driver d=
oesn't
> >>>>>>> clear update flags.
> >>>>>>>
> >>>>>>> Besides that, the issue the commit e1bd5e0bb4ca tries to address =
[2]
> >>>>>>> isn't functional.
> >>>>>>>
> >>>>>>> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/3441 [1]
> >>>>>>> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/4129 [2]
> >>>>>>> Signed-off-by: Melissa Wen <mwen@igalia.com>
> >>>>>> Can you please double check the use case that prompted
> >>>>>> e1bd5e0bb4ca0d633ad698abd3658f8265009b81 in the first place?  IE W=
ith
> >>>>>> this revert you proposed do you see a traceback on unplug of exter=
nal
> >>>>>> display?
> >>>>> Hi Mario,
> >>>>>
> >>>>> I don't see either traceback or REG_WAIT timeout when unplugging an
> >>>>> external HDMI-connected display.
> >>>>> I tried with the Deck Dock and USB-C to HDMI adapter. Not sure if t=
here
> >>>>> is a very specific scenario that triggers this that I didn't cover.
> >>>> No; it's quite a general problem and easy to reproduce.  This makes =
me
> >>>> wonder if there should be an exception carved out for Steam Deck ins=
tead.
> >>> I just tested DCN 3.1.2 (Z2 Go) and DCN 3.1.4 (Legion Go/ROG Ally) an=
d
> >>> I was not able to reproduce the issue so a Steam Deck carveout might =
make
> >>> sense here.
> >> What issue are you trying to reproduce?
> >> Glitches on Hades II + MangoHud, or traceback/REG_WAIT timeout?
> > Sorry, should've specified! I was testing for glitches with Hades II + =
MangoHud.
> >
> >> And with what kernel version?
> > amd-staging-drm-next built from b78bd800, tested on top of SteamOS Main
> I suspect you don't see the issue because your kernel doesn't expose AMD
> driver-specific color properties (?)
> For this, you should compile the kernel with KCFLAGS=3D"-DAMD_PRIVATE_COL=
OR"

[missed reply-all, resending this]

Ah right, thanks for pointing this out. I've gone back and recompiled
the kernel with
AMD_PRIVATE_COLOR enabled. However, I'm still unable to reproduce the issue=
 on
those other platforms. I can see the number of overlay planes change
in my dtn log,
as well as the pipeline changes with amdgpu_dm_visual_confirm.

In the original issue, I was unable to reproduce the Hades II and
MangoHud glitches
on my Z1E device at the time so this lack of reproduction on DCN 3.1.2
and DCN 3.1.4
might be expected.

>
> If no plane color props, you are also not seeing three planes on AMD DTN
> log and then no transitions in the pipe split.
>
> My main concern is that we will just hide the problem with an exception,
> but it can come back to bite us when the KMS plane color API is merged
> and gamescope updated to it.

That makes sense. I've been meaning to circle back to the gamescope
implementation of that now that Simon is unable to continue since it would
be good to get some testing started there.

Matt

>
> Melissa
>
> >
> >> Melissa
> >>
> >>> Matt
> >>>
> >>>>> The only message on dmesg from this action is:
> >>>>> amdgpu 0000:04:00.0: amdgpu: pp_od_clk_voltage is not accessible if
> >>>>> power_dpm_force_performance_level is not in manual mode!
> >>>>>
> >>>>> Moreover, if I move to the Desktop mode (KDE), there is no message.
> >>>>>
> >>>>> Melissa
> >>>>>
> >>>>>>> ---
> >>>>>>>    drivers/gpu/drm/amd/display/dc/core/dc.c | 5 +++--
> >>>>>>>    1 file changed, 3 insertions(+), 2 deletions(-)
> >>>>>>>
> >>>>>>> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/g=
pu/drm/amd/display/dc/core/dc.c
> >>>>>>> index c31f7f8e409f..7c48f72e5917 100644
> >>>>>>> --- a/drivers/gpu/drm/amd/display/dc/core/dc.c
> >>>>>>> +++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
> >>>>>>> @@ -5443,7 +5443,8 @@ bool dc_update_planes_and_stream(struct dc =
*dc,
> >>>>>>>     else
> >>>>>>>     ret =3D update_planes_and_stream_v2(dc, srf_updates,
> >>>>>>>     surface_count, stream, stream_update);
> >>>>>>> - if (ret && dc->ctx->dce_version >=3D DCN_VERSION_3_2)
> >>>>>>> +
> >>>>>>> + if (ret)
> >>>>>>>     clear_update_flags(srf_updates, surface_count, stream);
> >>>>>>>
> >>>>>>>     return ret;
> >>>>>>> @@ -5474,7 +5475,7 @@ void dc_commit_updates_for_stream(struct dc=
 *dc,
> >>>>>>>     ret =3D update_planes_and_stream_v1(dc, srf_updates, surface_=
count, stream,
> >>>>>>>     stream_update, state);
> >>>>>>>
> >>>>>>> - if (ret && dc->ctx->dce_version >=3D DCN_VERSION_3_2)
> >>>>>>> + if (ret)
> >>>>>>>     clear_update_flags(srf_updates, surface_count, stream);
> >>>>>>>    }
>
