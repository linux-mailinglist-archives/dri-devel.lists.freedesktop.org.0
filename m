Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 040307CD286
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 05:09:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5224710E35E;
	Wed, 18 Oct 2023 03:09:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [IPv6:2607:f8b0:4864:20::e2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75CE410E35E;
 Wed, 18 Oct 2023 03:08:58 +0000 (UTC)
Received: by mail-vs1-xe2f.google.com with SMTP id
 ada2fe7eead31-457bac7c3f5so2546868137.2; 
 Tue, 17 Oct 2023 20:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697598537; x=1698203337; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KxDvcwRJ+oCD8R03zg9Fvuf+jD2pBmCLjGOEJlTmezU=;
 b=k6Yk1q/rWzkBJVjoqz3jdHAOZAgSKBW0dz92G/lKbPEAakmZGGquyqLdgOTQQsMSsf
 jYdvtiWepBtCYdONotW8vtoZabh6LY7fodBIK3lhqDg6dNX339XfBqDO89zAbYh7tiLG
 zrWlXBJ42/nS9kdfj6Sty81QU/RBtxd0N8o0NGoJdvSTFy4bGGOXJWEjEBpPMGsfH9Zl
 SYDdob8MAa3u6cF6yfX02OqNhZgul4wDX7gjdX+ZI5zVMVkqI9SuS0aVFpnk4ksGlTSY
 jEX2k8pEXBhx8Fqy+JDQk153ExHCvb5A2FBVu0BgqEJgSFLxuGRL20xhAGRzCqHn2iKU
 wDLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697598537; x=1698203337;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KxDvcwRJ+oCD8R03zg9Fvuf+jD2pBmCLjGOEJlTmezU=;
 b=xGBcNnixL7q5QW+Z+rgB2l5mW1q3p/NYp5RfcHcxXe01WAg21ZrTbxuIxVCsa/jwXl
 JUCCyZAubkG+4Cl1ECCWrNTlIpZNwrCDHBr28YwM+HVkqVsH8+uXOE5GGhXu46Y8kooC
 aNTT7gcHbDHD6Yg5dTyUGhoLaBUrcMpzJ6fQ8PF4yWOM9+XY/0DdyqVnoVbJctgEuWpV
 hVZB2uZWy73d36zG0N1k2kde6wFgJdlkJSsf97n/F2awg9VH8B6YOuFnNLPNxnMAFPhw
 pxkYGD2OF274ww8NTkVbdq5SEIybS1psi+2zpZIe0QLsZOfYfZxa2uAFZ70HEMJpgS2r
 H9yg==
X-Gm-Message-State: AOJu0Ywreq5R6rc3QN4zHOLGuze/j35rps4RU4Z+kY96xUtH/a7zWBpo
 tf/yX4Xsa5oEquf7UeyUVIlTvHzJG5IIHvszgBk=
X-Google-Smtp-Source: AGHT+IEKNOjlxWt8SfJrIBvofZE/jIC4SCQlsRD35P+p5+itxuHQ8gG94CLLo6KtcbWbg8SInn3eKv5GohR2eytrvKA=
X-Received: by 2002:a05:6102:303:b0:457:d682:913e with SMTP id
 3-20020a056102030300b00457d682913emr4236287vsa.32.1697598537431; Tue, 17 Oct
 2023 20:08:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8ByeJBrPEQSgUc91LQO9Krzjh2pauhMTjEC82M8ozayE76Yg@mail.gmail.com>
 <CAJfuBxxmL-GtBgt=033F9UNeLCreFbJh3HrQQN2nYKwR_0uTbg@mail.gmail.com>
 <20231003155810.6df9de16@gandalf.local.home>
 <CAJfuBxyJyFbFEhRxrtxJ_RazaTODV6Gg64b1aiNEzt6_iE4=Og@mail.gmail.com>
 <CAK8ByeLNc9UbTNG4x=40AxYqjjRCsvBNtNFai0PMveM2X4XCow@mail.gmail.com>
 <CAJfuBxyRF4q_T8LmHwR=-PKKDDpiFg2nO03uLnL8aGpRyBByKw@mail.gmail.com>
 <CAK8ByeLpkSV6o6gPw8eJVqq5+ynQrSDjemY7mXkO1ZmA0rYKfQ@mail.gmail.com>
 <CAJfuBxw+ANLwssAGWpkn5PeJb8ZKn4LXQkk2Gfv3aGsSN=S55Q@mail.gmail.com>
 <CAJfuBxy9qn-4i3SteTL1LBbBxPrFM52KkBd=1UhcKV3S_KdQvw@mail.gmail.com>
 <20231011114816.19d79f43@eldfell> <ZSZuACLwt5_XAL2n@phenom.ffwll.local>
 <CAJfuBxytOcUDmPBO7uQ9mMRvpNvzA3tgg_-pSGmdXpjDPe5sNQ@mail.gmail.com>
 <CAK8Bye+v+fYsN-716vQKJCoTmDQWmTw_Z1ZGD2A=HvuuAApwig@mail.gmail.com>
In-Reply-To: <CAK8Bye+v+fYsN-716vQKJCoTmDQWmTw_Z1ZGD2A=HvuuAApwig@mail.gmail.com>
From: jim.cromie@gmail.com
Date: Tue, 17 Oct 2023 21:08:30 -0600
Message-ID: <CAJfuBxyFe4rDW2gUozPig9=dSS9b0oiADnTTGjOtCSJ=khA=wQ@mail.gmail.com>
Subject: Re: [PATCH v1] dynamic_debug: add support for logs destination
To: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <lb@semihalf.com>, 
 Jason Baron <jbaron@akamai.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 "wayland-devel@lists.freedesktop.org"
 <wayland-devel@lists.freedesktop.org>, Pekka Paalanen <ppaalanen@gmail.com>,
 Sean Paul <seanpaul@chromium.org>, Steven Rostedt <rostedt@goodmis.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

adding in Jason, not sure how he got missed.

On Mon, Oct 16, 2023 at 9:13=E2=80=AFAM =C5=81ukasz Bartosik <lb@semihalf.c=
om> wrote:
>
> czw., 12 pa=C5=BA 2023 o 20:48 <jim.cromie@gmail.com> napisa=C5=82(a):
> >
> > > If you want the kernel to keep separate flight recorders I guess we c=
ould
> > > add that, but I don't think it currently exists for the dyndbg stuff =
at
> > > least. Maybe a flight recorder v2 feature, once the basics are in.
> > >
> >
> > dyndbg has   +p    writes to syslog
> > +T  would separately independently write the same to global trace
> >
> > This would allow  graceful switchover to tracefs,
> > without removing logging from dmesg, where most folks
> > (and any monitor tools) would expect it.
> >
> > Lukas (iiuc) wants to steer each site to just 1 destination.
> > Or maybe (in addition to +p > syslog) one trace destination,
> > either global via events, or a separate tracebuf
> >
> > Im ambivalent, but thinking the smooth rollover from syslog to trace
> > might be worth having to ease migration / weaning off syslog.
> >
> > And we have a 4 byte hole in struct _ddebug we could just use.
>
> I'm glad you brought that up. This means we can leave class_id field
> untouched, have separate +T in flags (for consistency)
> and dst_id can be easily 8 bits wide.
>
> Also can you point me to the latest version of writing debug logs to
> trace events (+T option).
> I would like to base trace instances work on that because both are
> closely related.
>

Ive got 3 branches, all stacked up on rc6
(last I checked, they were clean on drm-tip)

https://github.com/jimc/linux/tree/dd-fix-7c
the regression fix, reposting this version next.
it also grabs another flag bit: _DPRINTK_FLAGS_INCL_LOOKUP


https://github.com/jimc/linux/tree/dd-shrink-3b
split modname,filename,function to new __dyndbg_sites section
loads the 3 column values and their intervals into 3 maple trees
and implements 3 accessor functions to retrieve the vals
from the descriptor addresses.
it "works" but doesnt erase intervals properly on rmmod
it also claims another flag - _DPRINTK_FLAGS_PREFIX_CACHED
and uses it to mark cached prefix fragment that get created for enabled cal=
ls.

https://github.com/jimc/linux/tree/dd-kitchen-sink
this adds the +T flag stuff.
its still a little fuzzy, esp around the descriptor arg -
using it to render the prefix str at buffer-render time
got UNSAFE warnings - likely due to loadable module
descriptors which could or did go away between
capture and render (after rmmod)




> > Unless the align 8 is optional on 32-bits,
>
> I verified with "gcc -g -m32 ..." that the align(8) is honored on 32 bits=
.
>

this is sorta the opposite of what I was probing, but I think result
is the same.
istm  align(8) is only for JUMP_LABEL, nothing else in the struct
appears to need it
so moving it to the top trades the hole for padding.



> > I think we're never gonna close the hole anywhere.
> >
>
> :)
>
> > is align 8 a generic expression of an architectural simplifying constra=
int ?
> > or a need for 1-7 ptr offsets ?
> >
> >
> >
> >
> > > > That's my idea of it. It is interesting to see how far the requirem=
ents
> > > > can be reasonably realised.
> > >
> > > I think aside from the "make it available directly to unpriviledged
> > > userspace" everything sounds reasonable and doable.
> > >
> > > More on the process side of things, I think Jim is very much looking =
for
> > > acks and tested-by by people who are interested in better drm logging
> > > infra. That should help that things are moving in a direction that's
> > > actually useful, even when it's not yet entirely complete.
> > >
> >
> > yes, please.  Now posted at
> >
> > https://lore.kernel.org/lkml/20231012172137.3286566-1-jim.cromie@gmail.=
com/T/#t
> >
> > Lukas, I managed to miss your email in the send phase.
> > please consider yourself a direct recipient :-)
> >
> > thanks everyone
> >
> > > Cheers, Sima
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
