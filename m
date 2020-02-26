Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A160A1703C3
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 17:05:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 272166EAAC;
	Wed, 26 Feb 2020 16:05:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AF236EA89;
 Wed, 26 Feb 2020 16:05:53 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id t14so3782617wmi.5;
 Wed, 26 Feb 2020 08:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3qi+0tGwIWEKy1hnGWa4P3/DiSSARIorQYfmbahGyA4=;
 b=IigQNtMd+Gp223VMzPb/l1bgq4goOL/g0wxisxBmzhDW6s7UA2+UxYVwqmMFqoQhYN
 Df53tcPnkZS76uVJDTQOO+Frx7HQ6ozvMxR+LdAWGKz3FtrekvFcgLT9PeVcxHzAJ36o
 BVEHCsd+SX/06TDtdrJZQJWRNj6tVpfoBLM2AceMQPB30PrYB12eE+y1dzcns3kZLT/v
 Dt4H5kjQ/1lzQ42rs+ZVOG5STW4dcZuMyUn3WPbt5tIkpH6szYssG85eMWkXMBWJRF2n
 8mwNjm+8EwkW+bh+A6zHmgzSAbqBfpGECKhiuIfp4Wu/Q1bCfPM2JO+OuHnPNbjuViC4
 Q+HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3qi+0tGwIWEKy1hnGWa4P3/DiSSARIorQYfmbahGyA4=;
 b=S67eS+1RTMnpw19pVgKyrN2d3EoixRMuQ3W8GyVtJ9JC9Hvvo1I5YLN7h3PXIi1msy
 QfICp316MDvBYbbUnmr88Bd7C8hIW5N+jAOhgKyPk7pOCzZL+9a9UhXSoQkYZp6V1Jg8
 3lwAmr/AiNGLEYH03nE0D635KpaNz7/yMA3CS6iYtKDm+aUntfuHgXWYnLJXZ647AHkU
 e6e2j8XTu1w/GUwKnizMg67Iq4+uJ1S67U99Z49gH8Jebb9cayGaEFk3v8muo81BIfa2
 9Svd+oslVKcvi1hz+T1AoJlmez5IhixV8riv4rCUEUgoBbmDlZVER8GW87yjNNZju02x
 AIDw==
X-Gm-Message-State: APjAAAXDEhR648msFBo2yBKJu+OygubkAwnn+GydECiJCc4ZUFJ/amEk
 HjymnnvMkeQJI1fAanlC2bTD3VZcG/H1qTzSwZACEg==
X-Google-Smtp-Source: APXvYqynJils2ghFzpJ1KjlILKk3RK1kNKJK7LGYTO+A0j0+Hy5I7wYhc201hJdrr2S4M0VTEiNbw+OAsSHZexOEFA0=
X-Received: by 2002:a7b:c152:: with SMTP id z18mr6220158wmi.70.1582733152116; 
 Wed, 26 Feb 2020 08:05:52 -0800 (PST)
MIME-Version: 1.0
References: <99213368-5025-8435-502b-3d23b875ca60@redhat.com>
 <CADnq5_OUt5XaJ_Nf23F2zsKeuPgoka8p2S6ny-H2WK==Ncg7vA@mail.gmail.com>
 <b0181c20-017b-7e3f-13c0-3ea5b98cadaa@redhat.com>
In-Reply-To: <b0181c20-017b-7e3f-13c0-3ea5b98cadaa@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 26 Feb 2020 11:05:40 -0500
Message-ID: <CADnq5_MjaOD+QrupjQwjdu-MgVZm1sg1x9=4uxdv92u1xuSdvQ@mail.gmail.com>
Subject: Re: 5.6 DP-MST regression: 1 of 2 monitors on TB3 (DP-MST) dock no
 longer light up
To: Hans de Goede <hdegoede@redhat.com>, "Lipski,
 Mikita" <mikita.lipski@amd.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 26, 2020 at 10:43 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 2/26/20 4:29 PM, Alex Deucher wrote:
> > On Wed, Feb 26, 2020 at 10:16 AM Hans de Goede <hdegoede@redhat.com> wrote:
> >>
> >> Hi Lyude and everyone else,
> >>
> >> Lyude I'm mailing you about this because you have done a lot of
> >> work on DP MST, but if this rings a bell to anyone else feel
> >> free to weigh in on this.
> >
> > Might be a duplicate of:
> > https://gitlab.freedesktop.org/drm/amd/issues/1052
>
> Looks like you are right, reverting the commit which the bisect
> from that issue points to:
>
> cd82d82cbc04 ("drm/dp_mst: Add branch bandwidth validation to MST atomic check")
>
> Fixes the issue for me. I will add a comment to the issue.
>
> Note I'm using integrated Intel gfx, so that means that this issue
> definitely is not amdgpu specific.
>

I'm not too familiar with the mst code, but I wonder if we were
exceeding the bandwidth limits in some setups and it just happened to
work, but now that we enforcing them, they don't which is correct, but
a regression from some users' perspective?

Alex


> Regards,
>
> Hans
>
>
>
>
> >> I'm currently using a Lenovo X1 7th gen + a Lenovo TB3 gen 2 dock
> >> as my daily rider for testing purposes. When 5.6-rc1 came out I
> >> noticed that only 1 of the 2 1920x1080@60 monitors on the dock
> >> lights up.
> >>
> >> There are no kernel errors in the logs, but mutter/gnome-shell says:
> >>
> >> gnome-shell[1316]: Failed to post KMS update: Page flip of 93 failed
> >>
> >> With 93 being the crtc-id of the crtc used for the monitor which is
> >> displaying black. Since then I've waited for 5.6-rc3 hoping that a
> >> fix was already queued up, but 5.6-rc3 still has this problem.
> >>
> >> gnome-shell does behave as if all monitors are connected, so the
> >> monitor is seen, but we are failing to actually send any frames
> >> to it.
> >>
> >> I've put a log collected with drm.debug=0x104 here:
> >> https://fedorapeople.org/~jwrdegoede/drm-debug.log
> >>
> >> This message stands out as pointing to the likely cause of this problem:
> >>
> >> [    3.309061] [drm:intel_dump_pipe_config [i915]] MST master transcoder: <invalid>
> >>
> >> Regards,
> >>
> >> Hans
> >>
> >> _______________________________________________
> >> dri-devel mailing list
> >> dri-devel@lists.freedesktop.org
> >> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> >
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
