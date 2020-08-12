Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49328242833
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 12:27:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 283DD6E2E3;
	Wed, 12 Aug 2020 10:27:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BFEE6E2E3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 10:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597228048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VmFP8O0+E+ofBBfcM1ZscCMSOIFpXMGRLGiHeWgEx7o=;
 b=LJR/Q+eHO1ZpuJDb8QwxwPa4143AlS8QAagYb5IqusPrqgNXYDiV0PHUzOCrG2PZ0++c4k
 N6VkSmYdxsiGZ5ersn8lxi2pTGO4T1Tw175vfoFQRO0nKJ8ED26kOHaxzQSbYk98AcEfMQ
 ePpo7YFAkWZ+wBx34v9yIhBi4cyMaE8=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-2miVF2KwOvmK3QWdFSYQVQ-1; Wed, 12 Aug 2020 06:27:23 -0400
X-MC-Unique: 2miVF2KwOvmK3QWdFSYQVQ-1
Received: by mail-qk1-f198.google.com with SMTP id 3so1185526qkv.13
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 03:27:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VmFP8O0+E+ofBBfcM1ZscCMSOIFpXMGRLGiHeWgEx7o=;
 b=OEhPWx/Lbw+Y4xhXzF9+1Z/V+OJvAM/1pTO1QfyZ7uQxZ3KkQ5fZiu4UyOzxsql/oW
 IVDUFSipaC+OLLmBisCt+Zg5f0nAAnVSQ9rKETjBbBstiMRFscCCyEkCJfuuPTskYdbZ
 JC0GhBFlboPJ2LfSXPJEDgtgpVM+mm8Su44RnJl6Jj5lTAIq3Jtcm8xBJLBfmrET0+e2
 u8hCaEAMCwzuNznlVa+79r8It8eUQnp1BpU/3vwL51HjA5YGTWDojr4sGZlBkmcSt259
 +7onQob60E5iZv7Rwj+RC9350dcSk9/O0jm3QydFqED4xPBE6JLp3kIFauyqSoSWqy+2
 V5VQ==
X-Gm-Message-State: AOAM530Z6T6sPsfm0w/PXv5TkWNXTmruIMVW0tp2PTe5nokEakW2FXeW
 byriIkbEJ6Vdv3M5BOKNtf+DRNDID5z3awpcMKs6Kbk2P9KTaIxrxxzp8AF1ltKGRKbmE6u1FWp
 TYZwCIhGNX8ogQ7CY0SByvElJsNQXs52VbhxvB/h9GUk+
X-Received: by 2002:a37:4d09:: with SMTP id a9mr5357040qkb.157.1597228042616; 
 Wed, 12 Aug 2020 03:27:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTtBMXSCVsMJ5v17eFLAMsnVjJIoGnw5ilFDSm6NXJYoVZ4d5a2a7qEFv7zx5kcWOoPSmAz7A1FS72fot+2Os=
X-Received: by 2002:a37:4d09:: with SMTP id a9mr5357025qkb.157.1597228042364; 
 Wed, 12 Aug 2020 03:27:22 -0700 (PDT)
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
In-Reply-To: <ad64c242-95f3-d346-87f3-a9ac149dc3a2@nvidia.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 12 Aug 2020 12:27:11 +0200
Message-ID: <CACO55tt81q3VwpEmz9wxeUzWGPLXA1XPj8ZgxhuELUBPDpX1PA@mail.gmail.com>
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

On Wed, Aug 12, 2020 at 2:19 AM James Jones <jajones@nvidia.com> wrote:
>
> Sorry for the slow reply here as well.  I've been in the process of
> rebasing and reworking the userspace patches.  I'm not clear my changes
> will address the Jetson Nano issue, but if you'd like to try them, the
> latest userspace changes are available here:
>
>    https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/3724
>
> And the tegra-drm kernel patches are here:
>
>
> https://patchwork.ozlabs.org/project/linux-tegra/patch/20191217005205.2573-1-jajones@nvidia.com/
>
> Those + the kernel changes addressed in this thread are everything I had
> outstanding.
>

I don't know if that's caused by your changes or not, but now the
assert I hit is a different one pointing out that
nvc0_miptree_select_best_modifier fails in a certain case and returns
MOD_INVALID... anyway, it seems like with your patches applied it's
now way easier to debug and figure out what's going wrong, so maybe I
can figure it out now :)

> Thanks,
> -James
>
> On 8/4/20 1:58 AM, Karol Herbst wrote:
> > Hi James,
> >
> > I don't know if you knew, but on the Jetson nano we had the issue for
> > quite some time, that GLX/EGL through mesa on X was broken due to some
> > fix in mesa related to modifiers.
> >
> > And I was wondering if the overall state just caused the issue we saw
> > here and wanted to know what branches/patches I needed for the various
> > projects to see if the work you have been doing since the last
> > upstream nouveau regression would be of any help here?
> >
> > Mind pointing me towards everything I'd need to check that?
> >
> > I'd really like to fix this, but didn't have the time to investigate
> > what the core problem here was, but I think it's very likely that a
> > fixed/improved modifier support could actually fix it as well.
> > Alternately I'd like to move to kmsro in mesa as this fixes it as
> > well, but that could just be by coincidence and would break other
> > devices..
> >
> > Thanks
> >
> > On Tue, Jul 14, 2020 at 4:32 PM James Jones <jajones@nvidia.com> wrote:
> >>
> >> Still testing.  I'll get a Sign-off version out this week unless I find
> >> a problem.
> >>
> >> Thanks,
> >> -James
> >>
> >> On 7/12/20 6:37 PM, Dave Airlie wrote:
> >>> How are we going with a fix for this regression I can commit?
> >>>
> >>> Dave.
> >>>
> >> _______________________________________________
> >> dri-devel mailing list
> >> dri-devel@lists.freedesktop.org
> >> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> >>
> >
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
