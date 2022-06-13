Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEC35480B4
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 09:40:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72C7610EF61;
	Mon, 13 Jun 2022 07:40:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B699810EF61
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 07:40:05 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id e184so8484098ybf.8
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 00:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KFShq3o2PFK939r70IszRyIOxigD9U5xJrK6vHFD2z0=;
 b=09a/pEJzVAbAq8QqHLYJIOVoALRo8C2J7O+n/VaTIM/NxdYixdvxOp66Ft0azrnY49
 oigQhSRjc/Djt5kbCyko1IVpfY68bdHD5KSa+jSjZe8Yz++Iaex9saVulXE193OniAX3
 BwXTK6NWI1FQHX1dp/Xl50yf5OgWCrg4peUHZYaaRk0zdjg2SxnHeQHeDH2+0hNrox0H
 0VCFdQzpnLugIUrViP9JAEGLApWI7DB3QEHye2oVSMWb1UmNbWWbECejzlz5xVqSqB1g
 g5YWm5MUcDhhThN5nU1oPi84QV0CsUA0v2DPjy+padiiSiUcI2H/9heT2/z2DdHS1RqL
 ZBPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KFShq3o2PFK939r70IszRyIOxigD9U5xJrK6vHFD2z0=;
 b=LR8RdXlX3vXEHTgqwju9jXRhccoNgKvIt3iBKFBQaWPGMJA73LVuorUJXdNw4034yJ
 TNL9MoxyOh2r8YcIHg9rtRrfLn1QlPrdGbEIq2pqV+kjnnRtZVudOkTaY27FC4bk8DwW
 Dh6tzRVn/HShCGCK1KB0ARIhMVq7zewc0zmfC6WWwTrLrejW3yEUN3iISgFGlwwCXTEb
 l+0ebZuaqHX5G2liHHMZznBV/pmmPb1JbSqfQo/ZP0Js1/NVU1ypjGxRmSvZaMQmY/UZ
 ViS3kvMdLgAeHif0RYaZAXkC4ktT2yKj/axG1tAMgfwdzujg0kPb/MA8JcNWk43SetU0
 n2SA==
X-Gm-Message-State: AJIora9y24fc6uFAGiFuV8QhWoQqfOZQc7KhxZGcwXIUqVVtkYQEZ7Qi
 FRktlQV+Pq4DV2vPnlcPA2sTq6821+EXjURRIXNDaQ==
X-Google-Smtp-Source: AGRyM1tGx8JsKsKzaCUrB3CgnF761/FQMo/WAudfJ9AW0Pr2zLZp0oZlPp4vr1x/cQEwvR0y6DQDBOx19AbAki0yH30=
X-Received: by 2002:a25:e0c3:0:b0:65c:a85b:b546 with SMTP id
 x186-20020a25e0c3000000b0065ca85bb546mr186121ybg.111.1655106004718; Mon, 13
 Jun 2022 00:40:04 -0700 (PDT)
MIME-Version: 1.0
References: <304E860A-A638-45D1-9AF3-F121A31CF7B0@apple.com>
 <Yqa6aWa70/GqhAHO@quokka>
In-Reply-To: <Yqa6aWa70/GqhAHO@quokka>
From: Daniel Stone <daniel@fooishbar.org>
Date: Mon, 13 Jun 2022 08:39:46 +0100
Message-ID: <CAPj87rPHKmFq2-VTWEJH_iVe2R7xvmb44v_ZWcQ9VakhF+5ArA@mail.gmail.com>
Subject: Re: 504 to gitlab.freedesktop.org
To: Peter Hutterer <peter.hutterer@who-t.net>
Content-Type: text/plain; charset="UTF-8"
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
Cc: xorg-devel@lists.freedesktop.org, Jeremy Sequoia <jeremyhu@apple.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>,
 sitewranglers@lists.freedesktop.org, freedesktop@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 13 Jun 2022 at 05:17, Peter Hutterer <peter.hutterer@who-t.net> wrote:
> On Sun, Jun 12, 2022 at 05:57:05PM -0700, Jeremy Sequoia wrote:
> > I was going to spend a little bit of time putting out an update to XQuartz
> > to address a few bugs that I've been meaning to squash, but I'm having a bit
> > of an issue pulling down sources.
> >
> > Fetching via ssh://git@gitlab.freedesktop.org is giving me Permission denied
> > (publickey,keyboard-interactive).  I'm not sure if the latter is an infra
> > issue or if the ssh key I have stored in my gitlab account are out of date
> > (it's been about a year since I touched this).  Unfortunately, I can't seem
> > to access https://gitlab.freedesktop.org to check as it's constantly
> > presenting me a 504 Gateway timeout.
> >
> > Is anyone else able to pull sources via ssh://git@gitlab.freedesktop.org
> > right now?  Is someone looking into the 504 issue?
>
> not an fdo admin but judging by the chatter on #freedesktop: no and yes, in
> that order. seems like the infrastructure is in various stages of depositing
> fecal matter on itself and the fixes are involved enough that the admins have
> to be mentally awake, not merely physically.

Yes, that's what's happening. Our (multi-host-replicated etc) Ceph
storage setup has entered a degraded mode due to the loss of a couple
of disks - no data has been lost but the cluster is currently unhappy.
We're walking through fixing this, but have bumped into some other
issues since, including a newly-flaky network setup, and changes since
we last provisioned a new storage host.

We're working through them one by one and will have the service back
up with all our data intact - hopefully in a matter of hours but we
have no firm ETA right now.

Cheers,
Daniel
