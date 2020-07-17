Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AA6224531
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 22:29:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C71AC6E8CB;
	Fri, 17 Jul 2020 20:29:33 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01B566E24B
 for <dri-devel@freedesktop.org>; Fri, 17 Jul 2020 20:29:32 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id o184so5517064vsc.0
 for <dri-devel@freedesktop.org>; Fri, 17 Jul 2020 13:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YLpVMDYrwWJk9a87cWOg2bUrC1EGuGNsrDX+jB50X64=;
 b=QOcdUWmVYO1ruHidjb3BSZV+nTbElxTyRNbKn8qrlYGKW/hsoUgNhdQV35VwVKTeCK
 cLuBXa3aF18NO7qBg+2XtVH09Gnp+OP/6/WjY2PVwrY0zQuGLT6HFiEd6w2HW4jkN+kO
 uAGvcAq319nP7pcGzfoiqyaBryN0jxK7I9qTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YLpVMDYrwWJk9a87cWOg2bUrC1EGuGNsrDX+jB50X64=;
 b=loeqhnA+yLgSyXC7sjfkHMYqP8vN6Uxv7XcJlsyLfeYC/X5xdA+365k9CqGWCC8qkD
 6rvVaJvfxZVT+VE7th5F9aDW5SGZuDwJeYksh+qD6XZMvBm0tDLoPrUOzYF+kofdPv4v
 QfvakIA4ZN0rM6HAJa2VcxRcEXny0KOIh+/YmWgDv76NSRgPpsDiatXPmZQWfRkwJSah
 pCi7X0bi43jxNB/+/tw9/w386br6/DauZG2+yjmzJcCz1EPR+wftZ71vVinnn96Qv5C6
 fYkk2F9gZakcMxbTXjwaRPyR2x0XzGvYNfqPubJM8q4Ipz0hxFu57+xbdoJ7ahKmMzOm
 wFkQ==
X-Gm-Message-State: AOAM530wyWKVcPlIDr+WiKRypP4UkacmSY3nuS6SFm3w6Q5kCu15Cvq5
 JVVKeIhm71vy2uOcpd9ipdQlHl2bqMQ=
X-Google-Smtp-Source: ABdhPJyW7plOJFe9oeQ9J/+gskzp1bSjcPeRvVLiocVBVqCOE6g+eFFN5GblOmUFBlPfnCz7nAACqw==
X-Received: by 2002:a05:6102:21b4:: with SMTP id
 i20mr9310564vsb.164.1595017771469; 
 Fri, 17 Jul 2020 13:29:31 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com.
 [209.85.222.45])
 by smtp.gmail.com with ESMTPSA id s184sm1341853vkh.52.2020.07.17.13.29.30
 for <dri-devel@freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jul 2020 13:29:30 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id p6so3255306uaq.12
 for <dri-devel@freedesktop.org>; Fri, 17 Jul 2020 13:29:30 -0700 (PDT)
X-Received: by 2002:ab0:44e5:: with SMTP id n92mr8909789uan.121.1595017769995; 
 Fri, 17 Jul 2020 13:29:29 -0700 (PDT)
MIME-Version: 1.0
References: <1594996458-15529-1-git-send-email-akhilpo@codeaurora.org>
 <20200717144607.GA16703@jcrouse1-lnx.qualcomm.com>
 <CAD=FV=Vdg36wBJiYM9bxGy-8hjxEf85aYAGuqR=Xh_oM0pLt0g@mail.gmail.com>
 <CAF6AEGvY9qxpi8rqL4Lef+Qs1yc20K3jEewK+9mWuTdhkLDKkA@mail.gmail.com>
In-Reply-To: <CAF6AEGvY9qxpi8rqL4Lef+Qs1yc20K3jEewK+9mWuTdhkLDKkA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 17 Jul 2020 13:29:18 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VjTzD_Swcbuk8o20tGkkx1EtPF-CT74wZYBnB39-xLUQ@mail.gmail.com>
Message-ID: <CAD=FV=VjTzD_Swcbuk8o20tGkkx1EtPF-CT74wZYBnB39-xLUQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm: msm: a6xx: fix gpu failure after system resume
To: Rob Clark <robdclark@gmail.com>
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
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, LKML <linux-kernel@vger.kernel.org>,
 Matthias Kaehlcke <mka@chromium.org>, dri-devel@freedesktop.org,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


On Fri, Jul 17, 2020 at 1:24 PM Rob Clark <robdclark@gmail.com> wrote:
>
> On Fri, Jul 17, 2020 at 10:39 AM Doug Anderson <dianders@chromium.org> wrote:
> >
> > Hi,
> >
> > On Fri, Jul 17, 2020 at 7:46 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
> > >
> > > On Fri, Jul 17, 2020 at 08:04:18PM +0530, Akhil P Oommen wrote:
> > > > On targets where GMU is available, GMU takes over the ownership of GX GDSC
> > > > during its initialization. So, move the refcount-get on GX PD before we
> > > > initialize the GMU. This ensures that nobody can collapse the GX GDSC
> > > > once GMU owns the GX GDSC. This patch fixes some GMU OOB errors seen
> > > > during GPU wake up during a system resume.
> > >
> > > > Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> > > > Reported-by: Matthias Kaehlcke <mka@chromium.org>
> > > > Tested-by: Matthias Kaehlcke <mka@chromium.org>
> > >
> > > The Signed-off-by needs to be at the end but I think Rob can do that for you.
> >
> > It does?  I've always been told that this is supposed to be roughly a
> > log of what happens.  In that sense you added your SoB before the
> > review/test happened so it should come before.  I know some
> > maintainers seem to do things differently but that seems to be the
> > most common.  In that sense, I think the order that Akhil has is
> > correct.  ...but, obviously, it's up to the maintainer.  ;-)
>
> yeah, I chronological order was my understanding too.. but presumably
> the Reported-by happened before the Signed-of-by (which is how I
> reordered things when applying the patch)

Doh!  Yeah, I somehow read that as Reviewed-by.  Thanks!  :-)

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
