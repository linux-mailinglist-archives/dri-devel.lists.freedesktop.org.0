Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F83B767046
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 17:13:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18E8E10E715;
	Fri, 28 Jul 2023 15:13:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AE0410E715
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 15:13:08 +0000 (UTC)
Received: by mail-oo1-xc32.google.com with SMTP id
 006d021491bc7-56c74961e0cso304294eaf.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 08:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690557187; x=1691161987;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0h6ZlaOtrhJAvHzX+indxdgsUCrQ74QcVENca+JdPsc=;
 b=kwvcBGvLtwnQ9WQdmNBDDzy/nDOHjIa1afusglIMBCjFCgNnsKEKiJYxDiRvSkrkts
 CCqjOvEmjNbaIrukQ1a+YtBC8TH6lHCIZCFnWGr1LUOMsWHeXPHg6MRYno3UKj02OLVe
 IpYWYZaxiE10oXD0uKr00KunkC6LplJipYlmv9ki8yg/jse1khhymlSK7iV/SK5SCqf6
 BEKtlzDO/pwIjK0tksbRrd7rhp4Kx8waEfyI0qvmMdga0WrEQbbC6bjFwOcO4fqkTLbi
 neVzLaoflYmQCawopvrJPQ2zEABSB/fPU4ZI0ufb7fr/OfKa3qg/y/O0PwRxf9lCyvMy
 4R7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690557187; x=1691161987;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0h6ZlaOtrhJAvHzX+indxdgsUCrQ74QcVENca+JdPsc=;
 b=IcsNRlEPcAsnzisFiU+affhPQbpkpzk2O7jvqdU+m3XNM3amKYJE+3O5HDHY1iSG/K
 oWQi9DhBa+mk2ZG5DsoDTsbqgTLmN3wCCjnmrrneMGNskFtW+KlQw39e9a8yal5EyRvN
 zEYnAk+Zbr4IW7dmsiEpPGRFwERWLOi5jg27j6zWOqYGYR/6PUIootpSBwl50S635ZfI
 qOWez8CSRDeHmCCdvQa2jym3XvQWP5pQM4K8tXuyqkDNuiSualZETEvo2b8E1oZcgQBl
 RX9EOpyJL3I7zU79WtLMEYdAUbk1/3cb9zdgOXa3OAEF38QNDJZYhmJIQo5HKy/bjVnt
 D9Zw==
X-Gm-Message-State: ABy/qLZIVP/Hnu1gB0DWnU/aIvez1ETwh2rClCLdIbvg/RvOuUtF9xRS
 QlHO78g5/o747rh7WOFt/fHKlhkIUXm8lTGdE5Q=
X-Google-Smtp-Source: APBJJlFMn4Pitgr6ec3WDKKwYT4fs6V87S727U/H+ysiBw3Y7fB3NaxzVtyYxYL18QBaQ7OzIE0z1qA7tuwjgSJN6n4=
X-Received: by 2002:a05:6808:1b0f:b0:3a4:735b:e559 with SMTP id
 bx15-20020a0568081b0f00b003a4735be559mr3540653oib.33.1690557187564; Fri, 28
 Jul 2023 08:13:07 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_Pr8Z=vNO3iEpHNqkV0mb8gNzN7Zvf9HSW0Sf3Q0yy=Pw@mail.gmail.com>
 <9b86526b-7afd-6335-e68f-3f390f1c3266@linux.intel.com>
 <CAF6AEGvC-1SFrmBY+mitpGPcHNBrJri4HMFXmXMkb4=G3Zrwcw@mail.gmail.com>
In-Reply-To: <CAF6AEGvC-1SFrmBY+mitpGPcHNBrJri4HMFXmXMkb4=G3Zrwcw@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 28 Jul 2023 11:12:56 -0400
Message-ID: <CADnq5_Nf3J8mdmmMkEOhwpe5AGVOjRPhO_gCFvPXPPuKmSe1iA@mail.gmail.com>
Subject: Re: CPU overhead for drm fdinfo stats
To: Rob Clark <robdclark@gmail.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Ursulin,
 Tvrtko" <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 28, 2023 at 10:35=E2=80=AFAM Rob Clark <robdclark@gmail.com> wr=
ote:
>
> On Fri, Jul 28, 2023 at 1:36=E2=80=AFAM Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
> >
> >
> > On 27/07/2023 21:58, Alex Deucher wrote:
> > > We have a number of customers using these stats, but the issue that
> > > keeps coming up is the CPU overhead to gather them, particularly on
> > > systems with hundreds of processes using the GPU.  Has anyone given
> > > any thought to having a single interface to get this information for
> > > the entire GPU in one place?
> >
> > Could I have a framed told you so certificate please? :D
> >
> > Well at least it depends on how much CPU overhead would your users be
> > happy to eliminate and how much to keep. So maybe no need for that
> > certificate just yet.
> >
> > I was raising the issue of exponential complexity of walking "total
> > number of processes" x "total number of file descriptors" on a system
> > from the inception of fdinfo.
> >
> > So for that issue the idea was to perhaps expose a list of pids with DR=
M
> > fds open somewhere, maybe sysfs.
>
> We do have something in debugfs (ie. $debugfs/dri/n/clients), would that =
do?

I think sysfs would be preferred since debugfs is often not enabled on
production servers.

Alex

>
> BR,
> -R
>
> > That would eliminate walking _all_ processes and trying to parse any
> > their file descriptor.
> >
> > But it would still require walking all file descriptors belonging to
> > processes with DRM fds open.
> >
> > If that wouldn't be enough of a saving for your users then no, I am not
> > aware it was discussed. Assuming at least you were suggesting something
> > like "read all fdinfo for all clients" in one blob. Also in sysfs? I
> > think it would be doable by walking the dev->filelist and invoking
> > drm_show_fdinfo() on them.
> >
> > Out of curiosity are they using the fdinfo parsing code from IGT or
> > something of their own?
> >
> > Regards,
> >
> > Tvrtko
