Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D766332305C
	for <lists+dri-devel@lfdr.de>; Tue, 23 Feb 2021 19:14:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A8ED6E855;
	Tue, 23 Feb 2021 18:14:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
 [209.85.166.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AFC16E855;
 Tue, 23 Feb 2021 18:14:11 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id g9so14991177ilc.3;
 Tue, 23 Feb 2021 10:14:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NBD19TtNuqKmtZTJ8bFpz+xLfryH6M8evU2W8orJimw=;
 b=Zi9hacuH5mWJyyut5NT1s19fY8p25YA8ZQfpd4DN275isONxrg3p7GSkWYsBEbnuhP
 9eAFZzVGrvxC9lx1TWDie2ryVIwnSgEfL7tazAhtL3iqYV26zC+jy98MtX3aAl/x68DX
 5RKsWARdAv4iDAvtbj0HQHynJ4QXAHfAanCyW4OUFXQu75sdGVlAlQ0UZEfzPoTuILVO
 CWyPA9Cr21c2IlSC/pbFhlbe/kG4/wDhSNkwwjWCOOj0L7Kz3ANefx/w5JKiqVr8GZW8
 9llmc/tMRJfHCNT1PFJFyYXMaCgLPV+jXoWPs705zlf4hekylPHfBcwY28uRXHaV8668
 MI6w==
X-Gm-Message-State: AOAM533t45DD2JO6+47sHoV6CtVj2CaIwnvfvGZOFTt8//+JqxQODIi9
 nMFTlIxs56fiwRwkmsQzFdYKVcler5TUiP1W2fOQPgj3S1E=
X-Google-Smtp-Source: ABdhPJxx/TZSCisENcO5Uxe7yUnXfib+nh/4u/AobThe/PiT92Zy413z/FV3yJKDnruuyr4rRyoAcPmxOiybsL3TF6Q=
X-Received: by 2002:a05:6e02:1848:: with SMTP id
 b8mr20333140ilv.210.1614104050299; 
 Tue, 23 Feb 2021 10:14:10 -0800 (PST)
MIME-Version: 1.0
References: <20210119015415.2511028-1-lyude@redhat.com>
 <20210119015415.2511028-2-lyude@redhat.com>
 <YDUN+Re/alMVL0Zn@pflmari>
 <CAKb7UvhFkw23so-a4JKLzpQLhphzjzarOy-9h+FiKP-aAC=4xw@mail.gmail.com>
 <YDUg/9fjsvTkRUqr@pflmari>
 <CAKb7Uvji_+N+b8HghZckU-uSBWn-=BZwNAiUff2oitbVuNUE2Q@mail.gmail.com>
 <YDUkfjDA4xLJlxE5@pflmari> <YDUr2OGDsxDyC0l2@pflmari>
In-Reply-To: <YDUr2OGDsxDyC0l2@pflmari>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Tue, 23 Feb 2021 13:13:59 -0500
Message-ID: <CAKb7UvjmdgS536tNzisomi_oXOGk3Q+anp0AfPvA8OruU_9m5Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/nouveau/kms/nv50-: Report max cursor size to
 userspace
To: Alex Riesen <alexander.riesen@cetitec.com>
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
Cc: David Airlie <airlied@linux.ie>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 James Jones <jajones@nvidia.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jeremy Cline <jcline@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, nouveau <nouveau@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 23, 2021 at 11:23 AM Alex Riesen
<alexander.riesen@cetitec.com> wrote:
>
> Alex Riesen, Tue, Feb 23, 2021 16:51:26 +0100:
> > Ilia Mirkin, Tue, Feb 23, 2021 16:46:52 +0100:
> > > I'd recommend using xf86-video-nouveau in any case, but some distros
> >
> > I would like try this out. Do you know how to force the xorg server to
> > choose this driver instead of modesetting?
>
> Found that myself (a Device section with Driver set to "nouveau"):
>
>     $ xrandr  --listproviders
>     Providers: number : 1
>     Provider 0: id: 0x68 cap: 0x7, Source Output, Sink Output, Source Offload crtcs: 4 outputs: 5 associated providers: 0 name:nouveau
>
> And yes, the cursor looks good in v5.11 even without reverting the commit.

FWIW it's not immediately apparent to me what grave error modesetting
is committing in setting the cursor. The logic looks perfectly
reasonable. It's not trying to be fancy with rendering the cursor/etc.

The one thing is that it's using drmModeSetCursor2 which sets the
hotspot at the same time. But internally inside nouveau I think it
should work out to the same thing. Perhaps setting the hotspot, or
something in that path, doesn't quite work for 256x256? [Again, no
clue what that might be.]

It might also be worthwhile just testing if the 256x256 cursor works
quite the way one would want. If you're interested, grab libdrm,
there's a test called 'modetest', which has an option to enable a
moving cursor (-c iirc). It's hard-coded to 64x64, so you'll have to
modify it there too (and probably change the pattern from plain gray
to any one of the other ones).

Cheers,

  -ilia
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
