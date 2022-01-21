Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24EF6495D18
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 10:54:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8955710E9C0;
	Fri, 21 Jan 2022 09:54:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B71010E9C0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 09:54:02 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 z25-20020a0568301db900b005946f536d85so11091676oti.9
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 01:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DBIqMCyoYKwtluhZLWFJ5ts4b1jZKqmXZEC6sptQraM=;
 b=SYqFCpZEA/SN54ldAC401emwbTE/qusES8QA6f3e2UqL1LzZ0oYRi1NCy/feVkq/gN
 6GadX9sXbRqUNqwbxfR093EnyMMRdf605YLyB4f8+BjsTFEOkDduV0XNRUD0KkTApTOb
 5nJ2q3uS2EegutSMiHxxyQ8/vs2r/WaMRFElQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DBIqMCyoYKwtluhZLWFJ5ts4b1jZKqmXZEC6sptQraM=;
 b=k1fgGLINC1ofxIyASm9uavB/PFTo9snj5eE+jtrzx5okdguijpzdjJXVIyxkzG628X
 Z8/VI38zcbz+M/cQYF6iLGJMdwrKr4T3kYLFOGZkfjxNsAI0WTAU0G5WuSxUx2J5Ve3V
 XNeVjdUIqZgKWfjCJT8Q+wnn2KaNtuxZ79U0mibJMVbjlcl/ShspJjbkRFcKtNem/kdr
 /FdQSulbeXev9wdoLwB0V3/kXqzdAzUGBrdycrEGVyiVRBp3OKZAwVjDZowZmMAeGdo5
 3P+51XhuYMHV7vvB4fZijbEzxBSMNrngyI6Yz3u7cal5JmA7ANVrzEkEsXJdFdS4Xhhf
 WXsg==
X-Gm-Message-State: AOAM5314bIMWoCrKbI+hULb5ysaT9rEP2uE7ne1vg0dlDRQ3s0KGkzHQ
 yX6b69ioxDf8hiVpOVU0KCf7fpijYc1KkMuCndlmzw==
X-Google-Smtp-Source: ABdhPJx0crwT3jJOrS0+wVulq7ZmDGhsyd9nIrBXcQE6LrIe8Q+G/CTmt2aPnAXNaQ+yZj4mlLrcRo6GWluuwPA13wc=
X-Received: by 2002:a9d:685a:: with SMTP id c26mr2158585oto.239.1642758841495; 
 Fri, 21 Jan 2022 01:54:01 -0800 (PST)
MIME-Version: 1.0
References: <Yeg11pHSqx29yg/T@ls3530>
 <CAKMK7uGeGBBvTGFyBxLwvTAxEWwXMS8U1rrYUb_7gbui-jV+KA@mail.gmail.com>
 <87fsph4fr2.fsf@intel.com> <Yep6te0wrK0ZQ8SB@google.com>
In-Reply-To: <Yep6te0wrK0ZQ8SB@google.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 21 Jan 2022 10:53:49 +0100
Message-ID: <CAKMK7uG9FaBM6e_kXFZUgBCk4JFcPCbzG5D_9XcypwVeXqDq6A@mail.gmail.com>
Subject: Re: [GIT PULL] fbdev updates & fixes for v5.17-rc1
To: Lee Jones <lee.jones@linaro.org>
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
Cc: linux-fbdev@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 21, 2022 at 10:19 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> On Fri, 21 Jan 2022, Jani Nikula wrote:
>
> > On Fri, 21 Jan 2022, Daniel Vetter <daniel@ffwll.ch> wrote:
> > > On Wed, Jan 19, 2022 at 5:02 PM Helge Deller <deller@gmx.de> wrote:
> > >> A first bunch of updates and fixes for the following fbdev & backlig=
ht drivers:
> > >> ocfb, aty128fb, mb862xx, omapfb, qcom-wled, dt-bindings, hyperv_fb,
> > >> lm3630a_bl, omap2, controlfb, matroxfb
> > >>
> > >> Nothing really important, mostly cleanups, const conversions, added =
null
> > >> pointer/boundary checks and build fixes.
> > >>
> > >> Signed-off-by: Helge Deller <deller@gmx.de>
> > >
> > > Not sure whether Linus missed this or just wanted to let the
> > > discussion settle first. But since this is all random patches for
> > > drivers that many distros don't even enable anymore there's no issues
> > > here, and I very much welcome someone volunteering to pick these up.
> > > I'd expect there's a pile more since it's been 1-2 years since Bart
> > > took care of these and merged them consistently.
> > >
> > > Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> >
> > ...
> >
> > >>  drivers/video/backlight/lm3630a_bl.c                     |  1 -
> > >>  drivers/video/backlight/qcom-wled.c                      |  1 +
> >
> > Backlight changes usually go through the backlight tree.
>
> Yes, they do.  How were these applied to the DRM tree?

They are not applied to any drm trees, Helge jumped in last week to
take over drivers/video maintainership.
-Daniel

>
> I don't see any mails about them being applied:
>
>   Luca Weiss (2):
>         backlight: qcom-wled: Add PM6150L compatible
>
>   https://lore.kernel.org/all/20211229170358.2457006-2-luca.weiss@fairpho=
ne.com/
>
>   Xu Wang (2):
>         backlight: lm3630a_bl: Remove redundant 'flush_workqueue()' calls
>
>   https://lore.kernel.org/all/20220113084806.13822-1-vulab@iscas.ac.cn/
>
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
> Principal Technical Lead - Developer Services
> Linaro.org =E2=94=82 Open source software for Arm SoCs
> Follow Linaro: Facebook | Twitter | Blog



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
