Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77210242852
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 12:43:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B1576E32A;
	Wed, 12 Aug 2020 10:43:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56FB06E32A
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 10:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597229010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=afTzU7UID2TywoO3/R9Iv+1XNj1veex+AV4SQm1nHFM=;
 b=HTMi46uVl+jTedPdRAxZZPm6LJg6AQdioa5173QSIBcXFsgnDt7C9Mmv6YSMu3CgFl5Ohu
 3xB4eAtsq41QzjC74aic2lzpz7zimFMtGZb89oDN8Q3bWJ65cKyNHrAv08Xw6Efj5JZB6u
 +sszHRcYq8ZOWFSuo7G6Agxf+oJv57I=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-Mfl_-yyPPJ-5y5HATzOBmQ-1; Wed, 12 Aug 2020 06:43:29 -0400
X-MC-Unique: Mfl_-yyPPJ-5y5HATzOBmQ-1
Received: by mail-qk1-f198.google.com with SMTP id j7so1221391qki.5
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 03:43:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=afTzU7UID2TywoO3/R9Iv+1XNj1veex+AV4SQm1nHFM=;
 b=G1NqaJGEXeIJAHWknpMmIJDkowkoJu8Oi0FZGyhD/UbqOOrM6Q7nThR5YjitgkM4Pm
 C0nqTbKdLi4RLine1WwEJc/42IEqXleHPyktkDLmt101PF0SDm/x5TkvcOG7Fs0CAyVC
 uS1i1U9kMLykcrIWfOvQ81PWVmwc+NZrXZQPFI7CsTsgbhxIS/2pRaX6qe2zqABjB++c
 hARcSP7OtapRiiHSw2+eL4wsJz94NboKDLdD6awUwfyYNHkeFFWLk67UQAmy7rfhSvdx
 Jy9NFy3SJ206jJfjMvSCSIvyknbdKjtN8fcQFDics8zRbVDQrOFEYPc6Cg7db/iJnzBG
 QHrg==
X-Gm-Message-State: AOAM533nRJND1AJ0DgWjnH/0hXRtU+0aaX+LJ87HnRe5hnLDc7bYaDMu
 bMN0b3/qm3QdGUrsX+QHX9OJ/mklRdobcgL+tDvxBd/u1GW4UffCVaN/b2tUiznGtVLLEXkXgYa
 X8b/es4PZ/UxA72wzbYGcdwGM5eeQz8Pxlr13HQ5/DpGI
X-Received: by 2002:aed:30c5:: with SMTP id 63mr5680928qtf.286.1597229008686; 
 Wed, 12 Aug 2020 03:43:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLoi3n4PzBv6i7BlBrGb7sDbvtUuV3lXYIpQ7dQAGf3FxbZ+4IwpvnIKQNbC/OerLuSR69uCsZWkLNHaTuBak=
X-Received: by 2002:aed:30c5:: with SMTP id 63mr5680913qtf.286.1597229008462; 
 Wed, 12 Aug 2020 03:43:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9txGww+omvateOTizZRV9_wLdAbq6uAz3DRa_S6bn1jQuQ@mail.gmail.com>
 <20200630230808.wj2xlt44vrszqfzx@box>
 <ef7816b4-72ee-9e0e-8cac-4d80d8343f9f@nvidia.com>
 <20200701075719.p7h5zypdtlhqxtgv@box> <20200701075902.hhmaskxtjsm4bcx7@box>
 <77e744b9-b5e2-9e9b-44c1-98584d2ae2f3@nvidia.com>
 <CAPj87rOrUHBZZR3cw+iqUMtZL1ZQyjd=RoM2yHt5oUeRO5uDTA@mail.gmail.com>
 <5ffa32db-4383-80f6-c0cf-a9bb12e729aa@nvidia.com>
 <a3d331e9-d17e-9135-68c7-8e3e10df184d@nvidia.com>
 <CAKMK7uG8x4dHrRnzK9FFrJbtWsdLk+TTObK9r-nSncKowHVe3A@mail.gmail.com>
 <CAPM=9twK34VyR2kwiR1jzxqys1Bng2Vt8FY6aQTvCe2GL0Zopg@mail.gmail.com>
 <261cd7c9-6853-3d5f-3a3e-86b65c9dba71@nvidia.com>
 <CACO55ttJwjh2HZsygwqA7HUeF5UMuP0=Y9RyZU=UJsf-gWGagA@mail.gmail.com>
 <ad64c242-95f3-d346-87f3-a9ac149dc3a2@nvidia.com>
 <CACO55tt81q3VwpEmz9wxeUzWGPLXA1XPj8ZgxhuELUBPDpX1PA@mail.gmail.com>
In-Reply-To: <CACO55tt81q3VwpEmz9wxeUzWGPLXA1XPj8ZgxhuELUBPDpX1PA@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 12 Aug 2020 12:43:17 +0200
Message-ID: <CACO55ts2AHgDNZKBvoU8NZf26V8BJDGkKiapY=1xaUQ1DrC8SA@mail.gmail.com>
Subject: Re: [git pull] drm for 5.8-rc1
To: James Jones <jajones@nvidia.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 12, 2020 at 12:27 PM Karol Herbst <kherbst@redhat.com> wrote:
>
> On Wed, Aug 12, 2020 at 2:19 AM James Jones <jajones@nvidia.com> wrote:
> >
> > Sorry for the slow reply here as well.  I've been in the process of
> > rebasing and reworking the userspace patches.  I'm not clear my changes
> > will address the Jetson Nano issue, but if you'd like to try them, the
> > latest userspace changes are available here:
> >
> >    https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/3724
> >
> > And the tegra-drm kernel patches are here:
> >
> >
> > https://patchwork.ozlabs.org/project/linux-tegra/patch/20191217005205.2573-1-jajones@nvidia.com/
> >
> > Those + the kernel changes addressed in this thread are everything I had
> > outstanding.
> >
>
> I don't know if that's caused by your changes or not, but now the
> assert I hit is a different one pointing out that
> nvc0_miptree_select_best_modifier fails in a certain case and returns
> MOD_INVALID... anyway, it seems like with your patches applied it's
> now way easier to debug and figure out what's going wrong, so maybe I
> can figure it out now :)
>

collected some information which might help to track it down.

src/gallium/frontends/dri/dri2.c:648 is the assert hit: assert(*zsbuf)

templ is {reference = {count = 0}, width0 = 300, height0 = 300, depth0
= 1, array_size = 1, format = PIPE_FORMAT_Z24X8_UNORM, target =
PIPE_TEXTURE_2D, last_level = 0, nr_samples = 0, nr_storage_samples =
0, usage = 0, bind = 1, flags = 0, next = 0x0, screen = 0x0}

inside tegra_screen_resource_create modifier says
DRM_FORMAT_MOD_INVALID as template->bind is 1

and nvc0_miptree_select_best_modifier returns DRM_FORMAT_MOD_INVALID,
so the call just returns NULL leading to the assert.

Btw, this is on Xorg-1.20.8-1.fc32.aarch64 with glxgears.

> > Thanks,
> > -James
> >
> > On 8/4/20 1:58 AM, Karol Herbst wrote:
> > > Hi James,
> > >
> > > I don't know if you knew, but on the Jetson nano we had the issue for
> > > quite some time, that GLX/EGL through mesa on X was broken due to some
> > > fix in mesa related to modifiers.
> > >
> > > And I was wondering if the overall state just caused the issue we saw
> > > here and wanted to know what branches/patches I needed for the various
> > > projects to see if the work you have been doing since the last
> > > upstream nouveau regression would be of any help here?
> > >
> > > Mind pointing me towards everything I'd need to check that?
> > >
> > > I'd really like to fix this, but didn't have the time to investigate
> > > what the core problem here was, but I think it's very likely that a
> > > fixed/improved modifier support could actually fix it as well.
> > > Alternately I'd like to move to kmsro in mesa as this fixes it as
> > > well, but that could just be by coincidence and would break other
> > > devices..
> > >
> > > Thanks
> > >
> > > On Tue, Jul 14, 2020 at 4:32 PM James Jones <jajones@nvidia.com> wrote:
> > >>
> > >> Still testing.  I'll get a Sign-off version out this week unless I find
> > >> a problem.
> > >>
> > >> Thanks,
> > >> -James
> > >>
> > >> On 7/12/20 6:37 PM, Dave Airlie wrote:
> > >>> How are we going with a fix for this regression I can commit?
> > >>>
> > >>> Dave.
> > >>>
> > >> _______________________________________________
> > >> dri-devel mailing list
> > >> dri-devel@lists.freedesktop.org
> > >> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > >>
> > >
> >

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
