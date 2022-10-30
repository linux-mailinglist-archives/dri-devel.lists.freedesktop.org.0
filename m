Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFE2612B08
	for <lists+dri-devel@lfdr.de>; Sun, 30 Oct 2022 15:43:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01A8C10E0E7;
	Sun, 30 Oct 2022 14:43:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com
 [IPv6:2607:f8b0:4864:20::a2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 257BA10E091;
 Sun, 30 Oct 2022 14:43:20 +0000 (UTC)
Received: by mail-vk1-xa2a.google.com with SMTP id p9so4364107vkf.2;
 Sun, 30 Oct 2022 07:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sKyEG79uRicAmyaHbJpoMhHQzezkxEzPsdyyX+IvEXE=;
 b=YHsMmFPkPMYCHE7nbf1aj5ciNMIHkdQKToaBgPEH2KJek3E9ivdvMQsmBzCPPnAmBg
 U7qidXh50jV3fvcPnqcFdZB1trM/zrgWRQxM4VAdAnUoJOwsRiXATKEeEHvmM0F+39z/
 hItfAlmJNRtIm5cpKhf7HdlhDbxsO+LSvy7TcZehjNjhSpeQItmfsWx4LwVmzmfkAizY
 JdsHa3K5Px3yzfGGodlyp+rOMLwFvf7aZu1kuenk4fCwDAn6b3bRF/10uotMICg28Pmt
 H3rJs046vqXtaXPBmsC51X7uFPrGlY0mxYhP0cq3HUASxvIdjP7lYFdIEzsDWxTHZvwb
 v1Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sKyEG79uRicAmyaHbJpoMhHQzezkxEzPsdyyX+IvEXE=;
 b=UowjZW7+AZG708R9oC8JAwtIDgmE6aMKSgmud3sKTgGiadMDuw60+5dDvdIm0k6JEF
 i5mLllVoWqb4K/9GhUe76rufx9nksBj6EFWSu8XYc5leBeHaptoJYGupW7jL3+jhKJ5a
 ZJhGY0J1/XYzYuOT+i1tVqLp0XOAYLC7slmtP+210ZoqenFM//xCOq0J3Kpg3X5At7ku
 j7Edt5es28PS3+cyRcwP3QyKN9x5vhlOg39GGiOuZ7kWxp3OVMIhvih4+t+Rtpk1pBvs
 KCRnSDH2UXcd5iTgGnjjTbx6HzUCoOKNo6ijn63P8U1xK+OOCn1jmJvuxDMLDC7Gl9hR
 tuXg==
X-Gm-Message-State: ACrzQf1RtdRhoQ/VJAvsPjpBME2CV+3m1jIFvTC8cBdbJLzhy8YxRKYS
 jzw0yMzYjb8vBRM+QzTg1NlfNpEsdikAilztalk=
X-Google-Smtp-Source: AMsMyM4KwiP4ZLQx9gpkhCmN89f0NhF1KEo2pJPaYpHGU9PBCyr2YUKAiYBOp82hg1t04UA4rbDQT/6mpBED/KkiV90=
X-Received: by 2002:a1f:988c:0:b0:3aa:cf0a:e0f7 with SMTP id
 a134-20020a1f988c000000b003aacf0ae0f7mr3060768vke.24.1667140998757; Sun, 30
 Oct 2022 07:43:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220912052852.1123868-1-jim.cromie@gmail.com>
 <Yy7/6oTBW2lqVSK1@kroah.com> <Y1Fyuh12g/gt3Izn@intel.com>
 <87a65pfsbq.fsf@intel.com>
 <c1807585-f6c8-c05d-bc20-c6a540e59814@akamai.com>
 <CAJfuBxxWVBxL29sXS3XoE5Es9HTbVyFUi9bQFYNupJAERffAew@mail.gmail.com>
 <Y1qqurH/lG0u+3ky@intel.com>
 <CAJfuBxzpG+C1ARLs3c_znXECEU7Ldg8RhruLMUXA67w+DwcrOQ@mail.gmail.com>
 <Y1rllFeOnT9/PQVA@intel.com>
In-Reply-To: <Y1rllFeOnT9/PQVA@intel.com>
From: jim.cromie@gmail.com
Date: Sun, 30 Oct 2022 08:42:52 -0600
Message-ID: <CAJfuBxw_YFvCtHMwVE0K0fa5GJbrZy4hTOSS9FebeDs6fxUUCA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v7 0/9] dyndbg: drm.debug adaptation
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org, Greg KH <gregkh@linuxfoundation.org>,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk,
 linux-kernel@vger.kernel.org, Jason Baron <jbaron@akamai.com>,
 seanpaul@chromium.org, amd-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 joe@perches.com, intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 27, 2022 at 2:10 PM Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Thu, Oct 27, 2022 at 01:55:39PM -0600, jim.cromie@gmail.com wrote:
> > On Thu, Oct 27, 2022 at 9:59 AM Ville Syrj=C3=A4l=C3=A4
> > <ville.syrjala@linux.intel.com> wrote:
> > >
> > > On Thu, Oct 27, 2022 at 09:37:52AM -0600, jim.cromie@gmail.com wrote:
> > > > On Thu, Oct 27, 2022 at 9:08 AM Jason Baron <jbaron@akamai.com> wro=
te:
> > > > >
> > > > >
> > > > >
> > > > > On 10/21/22 05:18, Jani Nikula wrote:
> > > > > > On Thu, 20 Oct 2022, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@lin=
ux.intel.com> wrote:
> > > > > >> On Sat, Sep 24, 2022 at 03:02:34PM +0200, Greg KH wrote:
> > > > > >>> On Sun, Sep 11, 2022 at 11:28:43PM -0600, Jim Cromie wrote:
> > > > > >>>> hi Greg, Dan, Jason, DRM-folk,
> > > > > >>>>
> > > > > >>>> heres follow-up to V6:
> > > > > >>>>   rebased on driver-core/driver-core-next for -v6 applied bi=
ts (thanks)
> > > > > >>>>   rework drm_debug_enabled{_raw,_instrumented,} per Dan.
> > > > > >>>>
> > > > > >>>> It excludes:
> > > > > >>>>   nouveau parts (immature)
> > > > > >>>>   tracefs parts (I missed --to=3DSteve on v6)
> > > > > >>>>   split _ddebug_site and de-duplicate experiment (way unread=
y)
> > > > > >>>>
> > > > > >>>> IOW, its the remaining commits of V6 on which Dan gave his R=
eviewed-by.
> > > > > >>>>
> > > > > >>>> If these are good to apply, I'll rebase and repost the rest =
separately.
> > > > > >>>
> > > > > >>> All now queued up, thanks.
> > > > > >>
> > > > > >> This stuff broke i915 debugs. When I first load i915 no debug =
prints are
> > > > > >> produced. If I then go fiddle around in /sys/module/drm/parame=
ters/debug
> > > > > >> the debug prints start to suddenly work.
> > > > > >
> > > > > > Wait what? I always assumed the default behaviour would stay th=
e same,
> > > > > > which is usually how we roll. It's a regression in my books. We=
've got a
> > > > > > CI farm that's not very helpful in terms of dmesg logging right=
 now
> > > > > > because of this.
> > > > > >
> > > > > > BR,
> > > > > > Jani.
> > > > > >
> > > > > >
> > > > >
> > > > > That doesn't sound good - so you are saying that prior to this ch=
ange some
> > > > > of the drm debugs were default enabled. But now you have to manua=
lly enable
> > > > > them?
> > > > >
> > > > > Thanks,
> > > > >
> > > > > -Jason
> > > >
> > > >
> > > > Im just seeing this now.
> > > > Any new details ?
> > >
> > > No. We just disabled it as BROKEN for now. I was just today thinking
> > > about sending that patch out if no solutin is forthcoming soon since
> > > we need this working before 6.1 is released.
> > >
> > > Pretty sure you should see the problem immediately with any driver
> > > (at least if it's built as a module, didn't try builtin). Or at least
> > > can't think what would make i915 any more special.
> > >
> >
> > So, I should note -
> > 99% of my time & energy on this dyndbg + drm patchset
> > has been done using virtme,
> > so my world-view (and dev-hack-test env) has been smaller, simpler
> > maybe its been fatally simplistic.
> >
> > ive just rebuilt v6.0  (before the trouble)
> > and run it thru my virtual home box,
> > I didnt see any unfamiliar drm-debug output
> > that I might have inadvertently altered somehow
> >
> > I have some real HW I can put a reference kernel on,0
> > to look for the missing output, but its all gonna take some time,
> > esp to tighten up my dev-test-env
> >
> > in the meantime, there is:
> >
> > config DRM_USE_DYNAMIC_DEBUG
> > bool "use dynamic debug to implement drm.debug"
> > default y
> > depends on DRM
> > depends on DYNAMIC_DEBUG || DYNAMIC_DEBUG_CORE
> > depends on JUMP_LABEL
> > help
> >   Use dynamic-debug to avoid drm_debug_enabled() runtime overheads.
> >   Due to callsite counts in DRM drivers (~4k in amdgpu) and 56
> >   bytes per callsite, the .data costs can be substantial, and
> >   are therefore configurable.
> >
> > Does changing the default fix things for i915 dmesg ?
>
> I think we want to mark it BROKEN in addition to make sure no one

Ok, I get the distinction now.
youre spelling that
  depends on BROKEN

I have a notional explanation, and a conflating commit:

can you eliminate
git log -p ccc2b496324c13e917ef05f563626f4e7826bef1

as the cause ?



commit ccc2b496324c13e917ef05f563626f4e7826bef1
Author: Jim Cromie <jim.cromie@gmail.com>
Date:   Sun Sep 11 23:28:51 2022 -0600

    drm_print: prefer bare printk KERN_DEBUG on generic fn

    drm_print.c calls pr_debug() just once, from __drm_printfn_debug(),
    which is a generic/service fn.  The callsite is compile-time enabled
    by DEBUG in both DYNAMIC_DEBUG=3Dy/n builds.

    For dyndbg builds, reverting this callsite back to bare printk is
    correcting a few anti-features:

    1- callsite is generic, serves multiple drm users.
       it is soft-wired on currently by #define DEBUG
       could accidentally: #> echo -p > /proc/dynamic_debug/control

    2- optional "decorations" by dyndbg are unhelpful/misleading here,
       they describe only the generic site, not end users

    IOW, 1,2 are unhelpful at best, and possibly confusing.


This shouldnt have turned off any debug of any kind
(drm.debug nor plain pr_debug)

but that former callsite no longer does the modname:func:line prefixing
that could have been in effect and relied upon (tested for) by your CI


I do need to clarify, I dont know exactly what debug/logging output
is missing such that CI is failing

related,
Ive added DEBUG to test-dynmamic-debug,
to prove the compile-time enablement of pr_debugs.
patch forthcoming, with a couple other fixes.





> enables it by accident. We already got one bug report where I had to
> ask the reporter to rebuild their kernel since this had gotten
> enabled and we didn't get any debugs from the driver probe.
>
> > or is the problem deeper ?
> >
> > theres also this Makefile addition, which I might have oversimplified
> >
> > CFLAGS-$(CONFIG_DRM_USE_DYNAMIC_DEBUG) +=3D -DDYNAMIC_DEBUG_MODULE
>
> --
> Ville Syrj=C3=A4l=C3=A4
> Intel
