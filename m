Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFACC556F2E
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 01:35:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C49F310E3D5;
	Wed, 22 Jun 2022 23:35:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E38710E3D5
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 23:35:24 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id l11so32847994ybu.13
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 16:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=o7RsO830fD0jUOzHDwoBp7BpixyxsVDMcbzJc/dPZr8=;
 b=t72DVOYNRLlNIK0QWaS0yiZCgLQzJ+mww8RuMAa6SEu21pN2KF8In8tDLoWRqBsrNr
 KNnBknGFobmW8lD5cwyGXZhMOKni4k712dl8T6Nb1Y74xZMaHi0Kq2qd81vV4LMVdjCT
 9lXscB4gWNNBeBTqN53A7/SqtDjl+hdd0crwWDarrUqcrVVL1BKgKrobVA6tolIbU7CW
 7qtcKBAh+hyL8KFEk0j6kpHlcnQQCy4LuyU4suQyqWqX68juFOOsbqaTH6uXvAorFBYR
 T5EyqV/l5CVH064TgCz+CYYxgBqY/E+gzS5VZQ1S06ALNzSu8KP9nwKNPVFQO6FD4QXB
 X3Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=o7RsO830fD0jUOzHDwoBp7BpixyxsVDMcbzJc/dPZr8=;
 b=dYH+ViJLwCEJeFJ8D1DzGS8gIz8XHM3bcqLunWsER2oNqvxYvdlRzQWU9oOieCZosB
 pBAQsCf4rQH6/G4kqJR8ifUDP5b+Qk7VHMXGEoR8SGsF82qcDKP4Gy7X5okWsEQ+iblO
 oKnDkEXH668CRYArF3YeopfsTp0LLOJlG0kEgtolKh7a2gYZ0E0ZCtd6yhhrvTJHeMwo
 /12pUKMMVClZQLk7aALnGCV54EnbHjQICGZkmeRAXsWNDGekgNo7SI30PNZ0Vg3K79HG
 vgXYhNL0PRNwjLImLbYCanwMmoaFW6P8RqfamSayhqM/0aBz5siBi9I+ZAg+Y6AzyRXm
 XQzw==
X-Gm-Message-State: AJIora8XTLUo8ej5OfVbLifB/yMMWPQE4/xpP6FXbZqW2jGGvzpkcoqS
 kTYvcKCaIGj0NxlaLWav3BmKkEDe2jxfq3X7OuMwMw==
X-Google-Smtp-Source: AGRyM1thlCmdsv9jRIXB0vx8z3s/GQ8/szb8lQCu3tvGCC9TxyNx0da3lTQTVZ/C/rnveNMpCk5dzQW1Wpv0FI0fIaQ=
X-Received: by 2002:a25:b29e:0:b0:669:160e:7f38 with SMTP id
 k30-20020a25b29e000000b00669160e7f38mr6608657ybj.280.1655940923198; Wed, 22
 Jun 2022 16:35:23 -0700 (PDT)
MIME-Version: 1.0
References: <91ff0bbb-ea3a-2663-3453-dea96ccd6dd8@amd.com>
 <YCuPhOT4GhY3RR/6@phenom.ffwll.local>
 <9178e19f5c0e141772b61b759abaa0d176f902b6.camel@ndufresne.ca>
In-Reply-To: <9178e19f5c0e141772b61b759abaa0d176f902b6.camel@ndufresne.ca>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 23 Jun 2022 00:34:58 +0100
Message-ID: <CAPj87rPYQNkgVEdHECQcHcYe2nCpgF3RYQKk_=wwhvJSxwHXCg@mail.gmail.com>
Subject: Re: DMA-buf and uncached system memory
To: Nicolas Dufresne <nicolas@ndufresne.ca>
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
Cc: "Sharma, Shashank" <Shashank.Sharma@amd.com>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, linaro-mm-sig@lists.linaro.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nicolas,

On Wed, 22 Jun 2022 at 20:39, Nicolas Dufresne <nicolas@ndufresne.ca> wrote=
:
> Le mardi 16 f=C3=A9vrier 2021 =C3=A0 10:25 +0100, Daniel Vetter a =C3=A9c=
rit :
> > So I think if AMD also guarantees to drop clean cachelines just do the
> > same thing we do right now for intel integrated + discrete amd, but in
> > reserve. It's fragile, but it does work.
>
> Sorry to disrupt, but if you pass V4L2 vmalloc data to Intel display driv=
er, you
> also get nice dirt on the screen. If you have a UVC webcam that produces =
a pixel
> format compatible with your display, you can reproduce the issue quite ea=
sily
> with:
>
>   gst-launch-1.0 v4l2src device=3D/dev/video0 ! kmssink
>
> p.s. some frame-rate are less likely to exhibit the issue, make sure you =
create
> movement to see it.

Right, this is because the UVC data in a vmalloc() area is not
necessarily flushed from the CPU cache, and the importer expects it
will be.

> The only solution I could think of (not implemented) was to detect in the
> attach() call what the importers can do (with dev->coherent_dma_mask if I
> recall), and otherwise flush the cache immediately and start flushing the=
 cache
> from now on signalling it for DQBUF (in vb2 workqueue or dqbuf ioctl, I d=
on't
> have an idea yet). I bet this idea is inapplicable to were you have fence=
s, we
> don't have that in v4l2.
>
> This idea was hinted by Robert Becket (now in CC), but perhaps I picked i=
t up
> wrong, explaining it wrong, etc. I'm no expert, just noticed there wasn't=
 really
> a good plan for that, so one needs to make one up. I'm not aware oh an im=
porter
> could know how the memory was allocated by the exporter, and worst, how a=
n
> importer could figure-out that the export is going to produce buffer with=
 hot
> CPU cache (UVC driver does memcpy from USB chunks of variable size to pro=
duce a
> fixed size image).

This is exactly what Christian was saying above.

Cheers,
Daniel
