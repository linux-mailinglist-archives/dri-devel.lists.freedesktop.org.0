Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FDA60FC27
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 17:38:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCF2610E68E;
	Thu, 27 Oct 2022 15:38:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa30.google.com (mail-vk1-xa30.google.com
 [IPv6:2607:f8b0:4864:20::a30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55DE010E695;
 Thu, 27 Oct 2022 15:38:20 +0000 (UTC)
Received: by mail-vk1-xa30.google.com with SMTP id i15so992081vka.0;
 Thu, 27 Oct 2022 08:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PLDisoEn34t2ZQnupF6SPJfGt8WPObAPZmKjBnvrJkI=;
 b=KZlvNl+eE9ORZM1EzwJdyzvp+Q/jcpXNKLscME0LoHcazeOhqVbzssT+F2exO/aAL+
 mkrOUb36JE9hSWUrYu24I8UfxNEIS1WpsafbDbFC5ao3dsJ0upSRq6zez5rpMNok5JR1
 KWL1DdMOD4DkPHgl3XVQOK42seb3DoHMSYmd+dVIwhK3R6Pi5s6g5+KxbxGea2/GfUQT
 3ZnPsSKybtRGH59IvR0NQX2BRCGYYksTSlW/J9TioVI+1KVmNbpPtj5GjzAszZ4Kv2GI
 XUEjlia8f2qfJMBxKIDfYzxiK4kgng+HoUfMm/kbQX60Td+HmDfK3qSL9JnP4OQjh6L1
 pbuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PLDisoEn34t2ZQnupF6SPJfGt8WPObAPZmKjBnvrJkI=;
 b=jrqTQVc5UnTxSaj+78b++rqoX93Be5Eh2icRBNaOMCfNWGWKSCs+tiCB05vYTwlKlE
 WK4bvkmOCA5jR+S6SjtAKveAfwMlDpDRIQwL7wUoZFSgp/9TVJMrInmUSjo29eStGlSv
 84BnE5+/3Zv9pUsYb7yGRIuPGZsxBAGA8bJY3rJKZuCZ+ferBYaz6trE/emf1Dwdoc+D
 ivYHV7E2a+8G1cWSkXRA3y9NK0m2XP3amsrH22aB6e6BPDOskcZFI6BM9Wjr53dp9Zvg
 iclFbXFLDj+rCN4ypazH/aL4PESm8WwDHNWbka8UbRtTejQvZHOYctb1g/vzVBCRvFO8
 g/9Q==
X-Gm-Message-State: ACrzQf08Jtp4J5A/Se1ZY6x+Q3qshVTrUaY2OxKeWQugJ8sx9V66gQO8
 ULbrz/kFojsYZS1AEjayb1vQuIPvaUOjkzuO5ZkkiJfErGrP1g==
X-Google-Smtp-Source: AMsMyM5wvu1PJdUuru30Taq7t+4LZkeExiWJp6I1Xynb8XRsfgieIvgggIfNmFUQkE0s2+ZLKo0S8g98WdxVUxqqGho=
X-Received: by 2002:a1f:988c:0:b0:3aa:cf0a:e0f7 with SMTP id
 a134-20020a1f988c000000b003aacf0ae0f7mr27367057vke.24.1666885099359; Thu, 27
 Oct 2022 08:38:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220912052852.1123868-1-jim.cromie@gmail.com>
 <Yy7/6oTBW2lqVSK1@kroah.com> <Y1Fyuh12g/gt3Izn@intel.com>
 <87a65pfsbq.fsf@intel.com>
 <c1807585-f6c8-c05d-bc20-c6a540e59814@akamai.com>
In-Reply-To: <c1807585-f6c8-c05d-bc20-c6a540e59814@akamai.com>
From: jim.cromie@gmail.com
Date: Thu, 27 Oct 2022 09:37:52 -0600
Message-ID: <CAJfuBxxWVBxL29sXS3XoE5Es9HTbVyFUi9bQFYNupJAERffAew@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v7 0/9] dyndbg: drm.debug adaptation
To: Jason Baron <jbaron@akamai.com>
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
 linux-kernel@vger.kernel.org, seanpaul@chromium.org,
 amd-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch, joe@perches.com,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 27, 2022 at 9:08 AM Jason Baron <jbaron@akamai.com> wrote:
>
>
>
> On 10/21/22 05:18, Jani Nikula wrote:
> > On Thu, 20 Oct 2022, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel=
.com> wrote:
> >> On Sat, Sep 24, 2022 at 03:02:34PM +0200, Greg KH wrote:
> >>> On Sun, Sep 11, 2022 at 11:28:43PM -0600, Jim Cromie wrote:
> >>>> hi Greg, Dan, Jason, DRM-folk,
> >>>>
> >>>> heres follow-up to V6:
> >>>>   rebased on driver-core/driver-core-next for -v6 applied bits (than=
ks)
> >>>>   rework drm_debug_enabled{_raw,_instrumented,} per Dan.
> >>>>
> >>>> It excludes:
> >>>>   nouveau parts (immature)
> >>>>   tracefs parts (I missed --to=3DSteve on v6)
> >>>>   split _ddebug_site and de-duplicate experiment (way unready)
> >>>>
> >>>> IOW, its the remaining commits of V6 on which Dan gave his Reviewed-=
by.
> >>>>
> >>>> If these are good to apply, I'll rebase and repost the rest separate=
ly.
> >>>
> >>> All now queued up, thanks.
> >>
> >> This stuff broke i915 debugs. When I first load i915 no debug prints a=
re
> >> produced. If I then go fiddle around in /sys/module/drm/parameters/deb=
ug
> >> the debug prints start to suddenly work.
> >
> > Wait what? I always assumed the default behaviour would stay the same,
> > which is usually how we roll. It's a regression in my books. We've got =
a
> > CI farm that's not very helpful in terms of dmesg logging right now
> > because of this.
> >
> > BR,
> > Jani.
> >
> >
>
> That doesn't sound good - so you are saying that prior to this change som=
e
> of the drm debugs were default enabled. But now you have to manually enab=
le
> them?
>
> Thanks,
>
> -Jason


Im just seeing this now.
Any new details ?

I didnt knowingly change something, but since its apparently happening,
heres a 1st WAG at a possible cause

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

    reverting yields a nominal data and text shrink:

       text    data     bss     dec     hex filename
     462583   36604   54592 553779   87333 /kernel/drivers/gpu/drm/drm.ko
     462515   36532   54592 553639   872a7 -dirty/kernel/drivers/gpu/drm/dr=
m.ko

    Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
    Link: https://lore.kernel.org/r/20220912052852.1123868-9-jim.cromie@gma=
il.com
    Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
