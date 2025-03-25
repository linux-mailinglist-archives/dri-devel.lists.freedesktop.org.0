Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D1AA70D76
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 00:05:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1EDD10E61B;
	Tue, 25 Mar 2025 23:05:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="geYsZa1M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0219D10E32C;
 Tue, 25 Mar 2025 23:05:51 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-6f666c94285so59491327b3.3; 
 Tue, 25 Mar 2025 16:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742943951; x=1743548751; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3LYyh7cvIBy6gyg3IkrEGbKsjVJ9+uHDh9H38tA/bPY=;
 b=geYsZa1MyQtFKD24qTQ4PRbRBpRoMrpmr1PO1rkdkbKIyhOm6iS20aOOHUVcp3+vZN
 dVc2k6GrkLwLuntYD2UjQ5G4Ar6iMyjLEOA2UW3qbKQ/C4Mwb5d9u6+KW9jgi6wctnKV
 NK8mjeUltZztlslnSU/0ELOwiiSIj70/EOxhQ8V5bhiIpj1JOrFaK0znO8Y4wsb5lEIt
 C5mbsOkWzz3qATQOR2SqpLgOdMoujl3aEG01QpgP36EJYi0oY4kzHUnAPMQGZ5DjdS97
 2Dr7d79uIhJOR5E3WfOmNDJgr1BDsTRoh7kItCkjYUa/l3n9nKgqkel5obYTCR9gHphN
 IQXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742943951; x=1743548751;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3LYyh7cvIBy6gyg3IkrEGbKsjVJ9+uHDh9H38tA/bPY=;
 b=fFe1f0jB9ITxAvq7niqrcyUdzR6AjNFo3ZGDW7owDCXb1Pj19Uoe0AzZ/lpOKRVHVh
 z4WtsBJgVYETcaOlnqGcYbiy6QQ1ehTFevCu0yCYxY8pfIZELzqcRKON/s2HldAG3fPq
 MZ30Enx+aUS4Yk+fPzkdxyxxdjt+1Zx/Slwpfhc9MABIGG/VYH5F6OiFEA4TOHvBNN2V
 lSyIlK7SZYpk1mP9eqnrG3c6HLL3OdVrwXQNBtG7gIBXUuLIWBwaBCK59hETC9WirDou
 HgCnxzWZ2Rbnk8GgqJtCU7wB0zchRPAr7aPOwESq+S1uktt/ylgZWNqlkPqG8As77TSi
 3wAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAvGp6qshyOygV6v4uKWKeBGpZ3xYq22W3aheUI2TBJEMORdNyH2njBckf7fhweKgZPTBG00a2QbNL@lists.freedesktop.org,
 AJvYcCUkc/KM2i8r8I4xtro+1n6b4fQeEG69PVzqXRd0ucc2Xk1CU6bMucW5qW5+JA/bvgH8BfjdMWKEpJl2JCiEfg==@lists.freedesktop.org,
 AJvYcCVQ4SZCG9GU+qwynl0dwi1EnSfK21sgyTRtcTGW/QOJBFs6y0HRgXZRcAWScdK7oXXVJddaJwj1f9VJltZHlgRbnw==@lists.freedesktop.org,
 AJvYcCVqw5FY75/knZRfr5M5w6tltyuG+m1GDSvcZ0NqsTy+6rQZeLWszHG9HgE6Ji6cBN8QGNTECM0bsTsL@lists.freedesktop.org,
 AJvYcCWYJTJOXEUQhKSgVgk8Zl44pkolciPSjAbgiVp/gfSQ9SWW/PEhshaGxBQIfu9/CyT13iayVPFn@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxSiMhzUzMKPZyOwxchSFR85bab3SF5ijFYBvGsxSF/1Hq36Las
 X/5/jTtZKvLhiMAGBWFDKf/QIlRDFCUnrFwlEAnEJS5Zq0t6rGy9A1w1IcNWa7xahfe7PXdZS3s
 54yJAmw9FjjUmQBggm/X3NkyY52c=
X-Gm-Gg: ASbGncsVOakmLrRo4IoHqqfslmA/CVcjh+clUOAvYHT+Li6v4FG42/h51BBzT1fPMy/
 UzlHLrk6p81MnEeX40s4m0SlFWoP/EH2GtYLvoxPTsCB4iOVBf7HVBUpsg792i9Tr4HutPhWT4e
 l0D0sCLd5ra43HvlkEGMB5fb74
X-Google-Smtp-Source: AGHT+IFDS0/bmylajohYScfMRJASfdJ94Z8dAaU9Iu5+MxKXgHCh/sXXScoa/kPcmSMVjhI64o9HD206lCBiVRkHZUw=
X-Received: by 2002:a05:690c:62c7:b0:6fd:22fb:f21b with SMTP id
 00721157ae682-700bac5dd77mr270803627b3.18.1742943950541; Tue, 25 Mar 2025
 16:05:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250320185238.447458-1-jim.cromie@gmail.com>
 <20250320185238.447458-31-jim.cromie@gmail.com>
 <0828cfdb-abf3-42c5-8500-70f36affd0a8@bootlin.com>
 <CAJfuBxzHEtS1psJ+L_6=FP-mU3b8mgLQbXRWoizLkZoRUB6G1Q@mail.gmail.com>
In-Reply-To: <CAJfuBxzHEtS1psJ+L_6=FP-mU3b8mgLQbXRWoizLkZoRUB6G1Q@mail.gmail.com>
From: jim.cromie@gmail.com
Date: Tue, 25 Mar 2025 17:05:24 -0600
X-Gm-Features: AQ5f1JqDBPnZp9kI3zjF5AGf9PrDQTP2_tFSu-HI5zfD_s9-HLrOkUICv28MItI
Message-ID: <CAJfuBxy3HWJuiBBSySGEUtDcpSNh7Kmds2t8TRGouSOqE1O2OA@mail.gmail.com>
Subject: Re: [PATCH v2 30/59] dyndbg: drop "protection" of class'd pr_debugs
 from legacy queries
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, intel-gfx-trybot@lists.freedesktop.org, 
 jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org, 
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com, 
 ville.syrjala@linux.intel.com
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

On Tue, Mar 25, 2025 at 12:29=E2=80=AFPM <jim.cromie@gmail.com> wrote:
>
> On Mon, Mar 24, 2025 at 9:20=E2=80=AFAM Louis Chauvet <louis.chauvet@boot=
lin.com> wrote:
> >
> >
> >
> > Le 20/03/2025 =C3=A0 19:52, Jim Cromie a =C3=A9crit :
> > > Current classmap code protects class'd pr_debugs from unintended
> > > changes by "legacy" unclassed queries:
> > >
> > >    # this doesn't disable all of DRM_UT_* categories
> > >    echo "-p" > /proc/dynamic_debug/control
> > >
> > >    # name the class to change it - protective but tedious
> > >    echo "class DRM_UT_CORE +p" > /proc/dynamic_debug/control
> > >
> > >    # or do it the subsystem way
> > >    echo 1 > /sys/module/drm/parameters/debug
> > >
> > > This "name the class to change it" behavior gave a modicum of
> > > protection to classmap users (ie DRM) so their debug settings aren't
> > > trivially and unintentionally altered underneath them.
> > >
> > > But this made the class keyword special in some sense; the other
> > > keywords skip only on explicit mismatch, otherwize the code falls thr=
u
> >
> > s/otherwize/otherwise/
>
> ack
>
> >
> > > to adjust the pr-debug site.
> > >
> > > So Jason Baron didn't like this special case when I 1st proposed it;
> > > I argued 2 points:
> > > - "protection gives stable-debug, improving utility"
> > > - __drm_debug is authoritative w/o dyndbg under it.
> > >
> > > I thought I'd convinced him back then, (and the patchset got merged),
> > > but he noted it again when he reviewed this series.  So this commit
> > > names the "special case": ddebug_client_module_protects_classes(), an=
d
> > > reverts it to Jason's preference.
> >   >
> > > If a class mismatch is seen, code distinguishes whether the class was
> > > explicitly given (and always skips/continue), or the DFLT was assumed
> > > because no class was given.  Here we test
> > > ddebug_client_module_protects_classes(), skip if so.
> > >
> > > Later, if any user/module wants to protect its classes, we could add =
a
> > > flag to ddebug_table, a means to set it from CLASSMAP_DEFINE, and
> > > check it when applying a classless query/cmd.
> >
> > I don't really understand the goal of the protection, do you have the
> > discussion between you and Jason so I can have some context and some
> > answer to my questions?
> >
>
> The on-list discussion is here.
>
> https://lore.kernel.org/lkml/2d3846cb-ff9a-3484-61a8-973799727d8f@akamai.=
com/
> https://lore.kernel.org/lkml/0d9f644f-3d60-02c3-7ce0-01296757e181@akamai.=
com/#t
>
> At the time I thought it was unfinished business, and expected some
> more discussion,
> but that didnt happen, and later GregKH committed the set.
>
> Last summer I emailed him privately, and he made a 5-6 points Ive
> addressed in this rev,
> (reduction of repetitive code, enforcing classmap constraints,
> protecting against misuse)
> but it also became clear he still didnt like the "specialness" of the key=
word,
> given by the _DFLT constraint applied to legacy callsites and queries.
>
> Since thats a bit of a philosophical debate, I looked for a technical sol=
ution,
> to have it either way with fairly trivial additions, and to yield
> until user experience
> dictates otherwise
>
> To be clear, I still think protecting the "classed" is proper.
> Without dyndbg, /sys/module/drm/parameters/debug is authoritative, full s=
top.
> I'm surprised any customer would give away that certainty,
> it looks like a (small caliber) footgun to me.
> But its not worth disagreeing on.
> Hence this patch reverts that "protection"
>
> > With the example you gave above, I think this could lead to a very odd
> > behavior: if I enable dyndbg, I expect any pr_dbg to be managed by
> > dyndbg settings.
>
> if by "any" you mean ALL the ones that currently exist,
> before we add a whole new "CLASS" of user,
> (with ~5k uses, all comfortable with their exclusive control)
> I can agree.
>
> echo class FOO +p > control
> gives full control.  You just have to say so for the new classes of users=
.
>
> >
> > If a user writes stuff on dyndbg control, he clearly knows what he is
> > doing, and he wants to control what logs he wants.
> >
> > And if you allow multiple "protected" users, the normal way to disable
> > all dyndbg logs will be:
> >
> >         ddcmd -p
> >         ddcmd class DRM_UT_CORE -p
> >         ddcmd class DRM_... -p # all drm classes
> >         ddcmd class SPI_... -p # all spi classes
> >         ddcmd class WHATEVER_... -p # all other subsystem
> >
> >         # And only now you can enable only what you want
> >         ddcmd module my_mod +p
> >
> > This is clearly annoying to write.
>
> It is clearly annoying.
> It doesnt need to be handy.
> thats what /sys/module/drm/parameters/debug is for.
> with modest "protection" of explicit naming,
> the sysfs knob can reasonably be expected
> to reflect whats going on underneath.
> Without it, bets are misplaced.
>

Heres an improvement:

a use of CLASSMAP_PARAM means user wants a sysfs knob.
We can reasonably conclude they prefer that mode of control
(its what DRM users would expect, since a long time ago).

In that case, protect the PARAM settings
(from unqualified settings, use of class FOO still works)
otherwise no protection.
simple to explain, no extra knobs.



> >
> > If DRM (or whatever subsystem) wants to add a debug parameter and use i=
t
> > to control their logs without being impacted by dyndbg, I believe it
> > should not use dyndbg classes to do it.
>
> hmm - dyndbg's 1st value is its NOOP cost when off.
> If thats not worth something, you wouldnt bother using it.
>
>
> In any case, its pretty clear that my viewpoint isnt prevailing here,
> and as I said, I dont care enough to disagree.
> the reversion here can stand.
>
>

apologies, since Im sounding kinda argumentative.
Jim
