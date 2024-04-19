Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEDF8AA981
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 09:50:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E18610F0E8;
	Fri, 19 Apr 2024 07:50:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MLMftoB3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF4EE10F0E8
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 07:50:29 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-6114c9b4d83so15207217b3.3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 00:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713513029; x=1714117829; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eSU5Y3VbJeh45hJUwql0V9IYMZAkub8x03JCZpm2gGg=;
 b=MLMftoB3nUaRydDayS9RzmbS0M3513BkdLjqhlldiw7Vd0Wv8CkGK0IsuRsZqKWdaK
 5KIQSrJe8OYsP1K3nYjCY5muTXT/0IHAMTgVzUAjpIdDpgTq4n+GH2SkiU+F3FiRxTYE
 hFvwne2pyMZXu7uljz4B50JaStlxS7jv+yUHxONLgP5l7vS7bSoF/TsbNk0UwYOqQ2tf
 0nJi8+wa8HSuSoBuc3ttVzZyXz4SSANMnTeAWM94xOZIRrsN2QGivJF3dPMBBIjM87Kb
 B+8g81UXGth4Rlr1qi4ThkVOseKkLqek+6RtDl0uFzYR3Orb399IhjQuBZfgfkDccy9u
 bZ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713513029; x=1714117829;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eSU5Y3VbJeh45hJUwql0V9IYMZAkub8x03JCZpm2gGg=;
 b=wiiwcOCs/dwQbODUosXyivKzL0H4Uhwq+ClGWj9S1o/Vwyj1RdYyZG3t5NhKWG+o3t
 I64n14muO3tmNQsfe3bxvv6CM3kHBcBGLT4T1M0FoDsS2nLYryCMomiZFlg9Q05ZFz1F
 xzcsHXxAJthTu5++yddfWks5zTzKmvcw1cVmA+AcUB65YFSnPyLS3kKMjU5La//yMJkR
 7SEMoVQZujbj9IjSl4gtWRNtJCTjWcF0XfpPnwFnGu8dwD3SV1xfIDQy8nAmPKW22YBr
 /PVYuNRYpYFrq8Y4li9OGXyOBryw1UDaYI1lTYMKKwa2NwvjQHAGajjhepqxWGLqjkJO
 OyOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXn1HImO2CvlNYS5vJCtba9BkgO0yLcfKpavdeWAeYYRSuNjiC3Q/8lgivAQ0TVjU8cUh1QOt1MsPYRM83tzUn+HKbyyNqAhIO3+4r83dEN
X-Gm-Message-State: AOJu0Yx0F4gA+zzRff5yTEkxZhvEPRqYHQT4Y8FHDEqbmxu3HPNy4W4m
 +nadT7dvxDtTba1LZrqH1wI7D5Gh2ZW+rUdix8EO4ZC20JT4e/xQSGt/SOxSRaloUjMWxP9p6yT
 i5UU/B7c3NnXrrT6ph+kyLMxkM0Y=
X-Google-Smtp-Source: AGHT+IFjQHVch/EGEw8Lj0yIUwAdtgGagHkwnPrfEadrcXcE/jctm5NT1wWlYtcC3vYWlm5NliWpFryraTYpllWgJgw=
X-Received: by 2002:a05:690c:7207:b0:618:6aa1:a972 with SMTP id
 jl7-20020a05690c720700b006186aa1a972mr1293822ywb.5.1713513028797; Fri, 19 Apr
 2024 00:50:28 -0700 (PDT)
MIME-Version: 1.0
References: <271372d6-e665-4e7f-b088-dee5f4ab341a@oracle.com>
 <20240418160652.68df1a86@namcao> <87ttjywxv5.wl-tiwai@suse.de>
 <a7843657-c3f6-4d2e-8c36-5541d4c52956@gmx.de> <878r19voks.wl-tiwai@suse.de>
 <5febb249-1d4d-4ea7-b031-1df4d14620d2@oracle.com>
 <8734rhvlr2.wl-tiwai@suse.de>
In-Reply-To: <8734rhvlr2.wl-tiwai@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Fri, 19 Apr 2024 09:50:17 +0200
Message-ID: <CAMeQTsbEjUyOYDAF-kFwTcovLr+8gHQGa27jPkeeJqmLhwbTag@mail.gmail.com>
Subject: Re: [bug-report] task info hung problem in fb_deferred_io_work()
To: Takashi Iwai <tiwai@suse.de>
Cc: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
 Helge Deller <deller@gmx.de>, 
 Nam Cao <namcao@linutronix.de>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-fbdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, bigeasy@linutronix.de, 
 LKML <linux-kernel@vger.kernel.org>, Vegard Nossum <vegard.nossum@oracle.com>, 
 George Kennedy <george.kennedy@oracle.com>,
 Darren Kenny <darren.kenny@oracle.com>, chuansheng.liu@intel.com
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

On Fri, Apr 19, 2024 at 9:45=E2=80=AFAM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Fri, 19 Apr 2024 09:39:09 +0200,
> Harshit Mogalapalli wrote:
> >
> > Hi Takashi,
> >
> > On 19/04/24 12:14, Takashi Iwai wrote:
> > > On Thu, 18 Apr 2024 21:29:57 +0200,
> > > Helge Deller wrote:
> > >>
> > >> On 4/18/24 16:26, Takashi Iwai wrote:
> > >>> On Thu, 18 Apr 2024 16:06:52 +0200,
> > >>> Nam Cao wrote:
> > >>>>
> > >>>> On 2024-04-18 Harshit Mogalapalli wrote:
> > >>>>> While fuzzing 5.15.y kernel with Syzkaller, we noticed a INFO: ta=
sk hung
> > >>>>> bug in fb_deferred_io_work()
> > >>>>
> > >>>> Which framebuffer device are you using exactly? It is possible tha=
t
> > >>>> the problem is with the device driver, not core framebuffer.
> > >>>
> > >>> Note that it was already known that using flush_delayed_work() caus=
ed
> > >>> a problem.  See the thread of the fix patch:
> > >>>     https://lore.kernel.org/all/20230129082856.22113-1-tiwai@suse.d=
e/
> > >>
> > >> Harshit reported the hung tasks with kernel v5.15-stable, and can ev=
en reproduce
> > >> that issue with kernel v6.9-rc4 although it has all of your patches =
from
> > >> that referenced mail thread applied.
> > >> So, what does your statement that "it was already known that it caus=
es problems" exactly mean?
> > >> Can it be fixed? Is someone looking into fixing it?
> > >
> > > My original fix was intentionally with cancel_delayed_work_sync()
> > > because flush_delayed_work() didn't work.  We knew that it'd miss som=
e
> > > last-minute queued change, but it's better than crash, so it was
> > > applied in that way.
> > >
> >
> > Thanks for sharing these details.
> >
> > > Then later on, the commit 33cd6ea9c067 changed cancel_*() to
> > > flush_delayed_work() blindly, and the known problem resurfaced again.
> > >
> >
> > I have reverted that commit, but still could see some other task hung
> > message as shared here on other reply:
> >
> > https://lore.kernel.org/all/d2485cb9-277d-4b8e-9794-02f1efababc9@oracle=
.com/
>
> Yes, then it could be a different cause, I suppose.
> The crash with flush_delayed_work() was a real crash, no hanging task,
> IIRC.

Neither cancel_delayed_work_sync() or flush_delayed_work() prevent new
work from being scheduled after they return. But
cancel_delayed_work_sync() at least makes sure the queue is empty so
the problem becomes less apparent.

Could this explain what we're seeing?

>
> Can you reproduce the issue with the latest Linus upstream, too?
>
>
> thanks,
>
> Takashi
