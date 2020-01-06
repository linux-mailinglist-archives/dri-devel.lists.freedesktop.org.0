Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3743131C50
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 00:27:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 374006E59D;
	Mon,  6 Jan 2020 23:27:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 423E76E59D;
 Mon,  6 Jan 2020 23:27:32 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id p6so32764530vsj.11;
 Mon, 06 Jan 2020 15:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HR1adj1A3Ic5Jb0NPazOu77KkzAZJIoYDoyM9pqOY08=;
 b=oqeFlizxumJS3xSs1GLYvD4rPCNojogiwdfHo2ADKRWPANURopELSwAadjJ2NXujSa
 UHrMi+ntYK/HAoHmE/FTcFMw2qMSFICQonrtuXclCAPq9SeDkX5HF/6zNuNMWRf3dpM6
 Fca7K1tRUR03UmtRYsdkIhJLBuyGio5J/dAOB9I9jTKr3DU646PZN+wm32NaSFy+LBsv
 EVSME+gPCO0KEBL2M9+PaTpHvC+KOD9r6kwpnHcyXa8xC49mTfkEJXf3OI0znV0W2iPP
 ylTLSWSQPBYJMl8/BqjLfrrh/WVe6YhYxgX6Z3xEfW2bE4195F+FPZtb7KE1sxlNoCW/
 UXhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HR1adj1A3Ic5Jb0NPazOu77KkzAZJIoYDoyM9pqOY08=;
 b=GLF1Afw5uzv2kjtkoM8sXDKYaV3bShMoEBqe1Eld8MLo2yWnCmmv/Tk5wDk/YOjeSz
 oeQRRUibKvpCV724hZOqmsJTVQTRZVJ7SAOAHRujxn+xjPf8g1idND1a2zuqKUWYYUsg
 /G7k4+xawBJ/6yaFlASZ+W5z1+gvHCSNvCESbDBJhlJOX7T9TS4mMrYWaDjj6GOFvkv5
 duxMaqKA3vK0Vi0WrRzFmaROOB2U9EDMCEn8H4X8dRt8P5Fh/5KkcIv3DtzPFz8JDCCY
 wTTWOzNuupboBXKyCPY6qp4niE9Fn/kDrrQ4Hc6v5HPBgfNPQb9s2wqPIV04RoffTjbL
 YfWA==
X-Gm-Message-State: APjAAAXYTUq/WO1kraOiKAu32vVoe10N7hgtrDWWZ/SeFx1yXj5GjmV8
 9/ZlMPtGRmbZ/PKmQXNE6QZfrnDdMTBTy2igp0LBlfD3vag=
X-Google-Smtp-Source: APXvYqwkkkOg/lno/2sC3oRI5T+GHauTDffkyPSndoXTgSJBxq6bIMGr5/8gezWgHbYFVgfICqpfZ9QI9Xm/qWStQoE=
X-Received: by 2002:a05:6102:3126:: with SMTP id
 f6mr7144756vsh.204.1578353251286; 
 Mon, 06 Jan 2020 15:27:31 -0800 (PST)
MIME-Version: 1.0
References: <20191217004520.2404-1-jajones@nvidia.com>
 <CACAvsv6AKt=10JgjaEKc=pkmKfGJoUJjq_Unn0yGTuQK85Es2g@mail.gmail.com>
 <b273ad88-d246-3395-2fd0-8188bc41a127@nvidia.com>
In-Reply-To: <b273ad88-d246-3395-2fd0-8188bc41a127@nvidia.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Tue, 7 Jan 2020 09:27:20 +1000
Message-ID: <CACAvsv5bhaJozct9fgnJ8JNSXpdd5QCH+tCxciZetbnWuzzBPw@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH v2 0/3] drm/nouveau: Support NVIDIA format
 modifiers
To: James Jones <jajones@nvidia.com>
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
Cc: ML nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 7 Jan 2020 at 05:17, James Jones <jajones@nvidia.com> wrote:
>
> On 1/5/20 5:30 PM, Ben Skeggs wrote:
> > On Tue, 17 Dec 2019 at 10:44, James Jones <jajones@nvidia.com> wrote:
> >>
> >> This series modifies the NV5x+ nouveau display backends to advertise
> >> appropriate format modifiers on their display planes in atomic mode
> >> setting blobs.
> >>
> >> Corresponding modifications to Mesa/userspace are available here:
> >>
> >> https://gitlab.freedesktop.org/cubanismo/mesa/tree/nouveau_work
> >>
> >> But those need a bit of cleanup before they're ready to submit.
> >>
> >> I've tested this on Tesla, Kepler, Pascal, and Turing-class hardware
> >> using various formats and all the exposed format modifiers, plus some
> >> negative testing with invalid ones.
> >>
> >> NOTE: this series depends on the "[PATCH v3] drm: Generalized NV Block
> >> Linear DRM format mod" patch submitted to dri-devel.
> >>
> >> v2: Used Tesla family instead of NV50 chipset compare to avoid treating
> >>      oddly numbered NV4x-class chipsets as NV50+ GPUs.  Other instances
> >>      of compares with chipset number in the series were audited, deemed
> >>      safe, and left as-is for consistency with existing code.
> > Hey James,
> >
> > These look OK to me, with the minor issue I mentioned on one of the
> > patches dealt with.  I'll hold off merging anything until I get the
> > go-ahead that the modifier definitions are definitely set in stone /
> > userspace is ready for inclusion.
>
> Thanks for having a look.  I'll try to get the userspace changes
> finalized soon.  I think from the NV side, we consider the modifier
> definition itself (the v3 version of the patch) final, so if there's any
> stand-alone feedback from yourself or other drm/nouveau developers on
> that layout, we'd be eager to hear it.  I don't want it rushed in, but
> we do have several projects blocked on getting that approved & committed.
>
> I assume the sequencing should be:
>
> * Fix the minor issue you identified here/complete review of nouveau
> kernel patches
> * Complete review of the related TegraDRM new modifier support patch
> * Finalize and complete review of userspace/Mesa nouveau modifier
> support patches
> * Get drm_fourcc.h updates committed
> * Get these patches and TegraDRM patches committed
> * Integrate final drm_fourcc.h to Mesa patches and get Mesa patches
> committed
>
> Does that sound right to you?
Seems very reasonable!

Ben.

>
> Thanks,
> -James
>
> > Thanks,
> > Ben.
> >
> >>
> >> James Jones (3):
> >>    drm/nouveau: Add format mod prop to base/ovly/nvdisp
> >>    drm/nouveau: Check framebuffer size against bo
> >>    drm/nouveau: Support NVIDIA format modifiers
> >>
> >>   drivers/gpu/drm/nouveau/dispnv50/base507c.c |   7 +-
> >>   drivers/gpu/drm/nouveau/dispnv50/disp.c     |  59 ++++++++
> >>   drivers/gpu/drm/nouveau/dispnv50/disp.h     |   4 +
> >>   drivers/gpu/drm/nouveau/dispnv50/wndw.c     |  35 ++++-
> >>   drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c |  17 +++
> >>   drivers/gpu/drm/nouveau/nouveau_display.c   | 154 ++++++++++++++++++++
> >>   drivers/gpu/drm/nouveau/nouveau_display.h   |   4 +
> >>   7 files changed, 272 insertions(+), 8 deletions(-)
> >>
> >> --
> >> 2.17.1
> >>
> >> _______________________________________________
> >> Nouveau mailing list
> >> Nouveau@lists.freedesktop.org
> >> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
