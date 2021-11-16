Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E429452BD8
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 08:42:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 079686EE53;
	Tue, 16 Nov 2021 07:42:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D85C6EE54
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 07:42:22 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 h16-20020a9d7990000000b0055c7ae44dd2so32040145otm.10
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 23:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jEPINVoNnARdnwRkodAEOSCrXaLj8UiSgqK9Lc7q8bU=;
 b=OYsGmxUeRDLfLU0rvZNbcWoPIyI57Q42uvIOQWivxp/bBwDJlA3vb0GJpnl0P5G15D
 dkv8b55wJu/hQa06Q0QjyuiCjNUqbXvcsO8NOc8VZNSpqpAZ7LI1Fgs+1CGlngvIo4Uo
 a7+sVATyIT1WeN5sQzg/bNxJ2E2ndfIH0JoKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jEPINVoNnARdnwRkodAEOSCrXaLj8UiSgqK9Lc7q8bU=;
 b=x+0PvIkUBSkgXyHO7S7hlscBQf9DRLdTYnLBTzbk6nEhLis+d+YFWlJNRmvT7YzZZF
 wN68S2dsaFK2FbCiv107tgqU9IbRMj9hDKS9ZUz68fUr/VrC7T5YP2XXfCDZRK+Xxi27
 K6Kfjwy6F0MQLD7lFwC+7SSN3LzauV99jXgfb3SFjVK+OSAqTei++rZPB2KI2yN/9U3W
 ilHEbD3VuXSXKjE+r4HvWcxw2nb4DbmAt7ggHXyowo0wrYB/JMNzGb/MPuanlgor14NN
 qfk6j6kJVbo3ocASgO8L1RlIaVIjvIKwtJ6F4biOnK8MygPaXux/7oyU7F2e3t2Xu5mS
 5Qrw==
X-Gm-Message-State: AOAM530Hoa27smG/2ExoBiFbFNY7ukz7W2653MMxbx8fW9wb75wVcsmt
 aLOVugmW7cmvg/eO74k/rN6obJqnuglAe/HUTY1k5w==
X-Google-Smtp-Source: ABdhPJzX4aF3D0+D6DoTwfxBY3/WbPF54Z/NZFb4Gy9uuKH085SmkiRT0sfakRmzs2KOQ8WPNaAZ/D+rH1668HdV1CY=
X-Received: by 2002:a9d:1e1:: with SMTP id e88mr4295993ote.75.1637048541891;
 Mon, 15 Nov 2021 23:42:21 -0800 (PST)
MIME-Version: 1.0
References: <20211114234045.cc5tearljna2ywij@core>
 <CAPj87rPxtQVQnrs0BiXy0H1viF-oMNeCCP_Aptsxt_sgeK+CpA@mail.gmail.com>
 <CAKMK7uGd+W3yOr2wGRREW08pcX=g1UPvkX4n13dVo7YdQ4dpxg@mail.gmail.com>
 <fd82ad9c-2b48-9bf3-0552-6f103847260b@amd.com>
 <CAKMK7uG3TPHH_jeGygKONNiivRiSvxM=mKafi4+6ceDuN1HErA@mail.gmail.com>
 <1e26455d-5637-ba21-498d-4b140c6db1d9@amd.com>
In-Reply-To: <1e26455d-5637-ba21-498d-4b140c6db1d9@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 16 Nov 2021 08:42:10 +0100
Message-ID: <CAKMK7uHDOiDM-Rkqq8PVMSKN=Gehw4m93sd3W2KiSkfmgogHYA@mail.gmail.com>
Subject: Re: Panic with linus/master and panfrost
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megi@xff.cz>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 16, 2021 at 8:39 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 16.11.21 um 08:37 schrieb Daniel Vetter:
> > On Mon, Nov 15, 2021 at 9:23 PM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >>
> >>
> >> Am 15.11.21 um 16:05 schrieb Daniel Vetter:
> >>> You need
> >>>
> >>> commit 13e9e30cafea10dff6bc8d63a38a61249e83fd65
> >>> Author: Christian K=C3=B6nig <christian.koenig@amd.com>
> >>> Date:   Mon Oct 18 21:27:55 2021 +0200
> >>>
> >>>      drm/scheduler: fix drm_sched_job_add_implicit_dependencies
> >>>
> >>> which Christian pushed to drm-misc-next instead of drm-misc-fixes. I
> >>> already asked Christian in some other thread to cherry-pick it over.
> >> Sounds like you haven't seen my answer to that request.
> >>
> >> I can't cherry pick the patch to drm-misc-fixes because the patch whic=
h
> >> broke things hasn't showed up in that branch yet causing a conflict.
> > Yeah I asked Maxime to roll forward to -rc1 right after sending out
> > this mail so you can do that.
>
> I've pined him again just a second ago because a "dim update-branches"
> still doesn't show the patches from -rc1 this morning.

Hm yeah I should have checked first that Maxime indeed did it :-/

> >   Which you could have done too :-)
>
> Hui? I can push merges from upstream into drm-misc-fixes? ^^

Ah no, just asking to make it happen.
-Daniel

>
> Christian.
>
> > -Daniel
> >
> >> Regards,
> >> Christian.
> >>
> >>> -Daniel
> >>>
> >>> On Mon, Nov 15, 2021 at 3:56 PM Daniel Stone <daniel@fooishbar.org> w=
rote:
> >>>> Hi Ondrej,
> >>>>
> >>>> On Mon, 15 Nov 2021 at 07:35, Ond=C5=99ej Jirman <megi@xff.cz> wrote=
:
> >>>>> I'm getting some fence refcounting related panics with the current
> >>>>> Linus's master branch:
> >>>>>
> >>>>> It happens immediately whenever I start Xorg or sway.
> >>>>>
> >>>>> Anyone has any ideas where to start looking? It works fine with v5.=
15.
> >>>>>
> >>>>> (sorry for the interleaved log, it's coming from multiple CPUs at o=
nce
> >>>>> I guess)
> >>>> Thanks a lot for the report - are you able to bisect this please?
> >>>>
> >>>> Cheers,
> >>>> Daniel
> >>>
> >>> --
> >>> Daniel Vetter
> >>> Software Engineer, Intel Corporation
> >>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fbl=
og.ffwll.ch%2F&amp;data=3D04%7C01%7Cchristian.koenig%40amd.com%7C16b6abb8ee=
ee435be5c908d9a8d3e8d8%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C6377264=
50378319982%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJ=
BTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3D0SieiO%2FNcLgRmlDWvyifVcfsfH=
GbVhQqA4ff6oj81SQ%3D&amp;reserved=3D0
> >
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
