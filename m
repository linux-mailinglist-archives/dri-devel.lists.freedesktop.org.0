Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E893DDF5D
	for <lists+dri-devel@lfdr.de>; Mon,  2 Aug 2021 20:37:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E19386E12E;
	Mon,  2 Aug 2021 18:37:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com
 [IPv6:2607:f8b0:4864:20::e2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47FF088A33;
 Mon,  2 Aug 2021 18:37:07 +0000 (UTC)
Received: by mail-vs1-xe2d.google.com with SMTP id x144so1250863vsx.3;
 Mon, 02 Aug 2021 11:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IpKyihB3M+3oinMY5i464lWGHngiMrlvZE39L5yuKac=;
 b=IELFFR56N8LyPmwrNGKlS1ao8vH/LLrw5ZS44V5f8D3W1JRnUh+LPgTzqBlU8FgoE8
 fGGimjIp5iIsWIAIkJ35I5YGoLfKQoJrxQZRnTaj/YUANaLxOODm961BVRPP4fr6h7k3
 CwtQLVbWYB0iEirh0GGxW+0thmIhG5wHoASQX/luG9Xj+JsIr/NssxM5XxQ0PrkJM11A
 2VJEKixVg6QFXFzsBqsqNM2funSFiKMT3NRmOmn5alXZcLarqoL7QOcIZgGjCIV5Qene
 Z65cCkyLEtI5gkfeNntJ6lCMBvHJmtCe171UlD+regWNlwSnh0iE/oXwKOxH4IoM5hKm
 8wtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IpKyihB3M+3oinMY5i464lWGHngiMrlvZE39L5yuKac=;
 b=QgxEsJVIx5QK7/4kXNuyLnDpjhPwc/Z/hJCGcxykAR7JGgKll4HAoVjo08x7kdef1Y
 aZZBJwLD+5XLAoWQN0R51mEkavCd/6zS9JdIdvO1n4vq7uhy9NO6t7ShfAUMEUxLDaZh
 BvVlTYeBZLJEff0vEZbJ6ojUzZZnMq4bcnyuk0HWHqmb+RpeSxLeeP4vMlrEMnV28z69
 c9s3xSeoUoMx6vYIyqUO9f20jZgyMnwrkuoU8/9QEkZpuFePUZZombSsab/jayiPteSa
 gKe0M48SW+35+lKBEFwKabd0ebXLDDAY+wE+Hln1G+WUQ7RFhIgP1w4kNW2B7em2WZ7h
 ynJQ==
X-Gm-Message-State: AOAM532MlStRWTNH4EwHjcVbiJGgSmacnR41+0VR3qXN6GtAsV4rkq7G
 J8pYcJUbeGzRgBbfoSu21P9nclE6RWxhqHW9ltM=
X-Google-Smtp-Source: ABdhPJzjo/9qOXG0fdeyFyvhz+Aj/p8NcNMo/+WII7wlKLWCAd3lrkIimR0VXnppY4xXe7pst3ulKKdyrBotgKBzXac=
X-Received: by 2002:a67:f58c:: with SMTP id i12mr1373736vso.7.1627929426283;
 Mon, 02 Aug 2021 11:37:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210731214211.657280-1-jim.cromie@gmail.com>
 <20210731214211.657280-3-jim.cromie@gmail.com>
 <CACvgo50DDp3p=-2mzY8jvzuLo_4_1L+b8=x6ZRERtcVJUHcomQ@mail.gmail.com>
In-Reply-To: <CACvgo50DDp3p=-2mzY8jvzuLo_4_1L+b8=x6ZRERtcVJUHcomQ@mail.gmail.com>
From: jim.cromie@gmail.com
Date: Mon, 2 Aug 2021 12:36:39 -0600
Message-ID: <CAJfuBxzsLToskA_dtdmsvQdSnEoDRgmrQycZ_nCKm4yQDqJ5Pg@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] moduleparam: add data member to struct kernel_param
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Zhenyu Wang <zhenyuw@linux.intel.com>, 
 Zhi Wang <zhi.a.wang@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Jason Baron <jbaron@akamai.com>, Ashley Thomas <Ashley.Thomas2@amd.com>, 
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, 
 Wyatt Wood <Wyatt.Wood@amd.com>, Jessica Yu <jeyu@kernel.org>,
 Johan Hovold <johan@kernel.org>, 
 Joe Perches <joe@perches.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Nick Desaulniers <ndesaulniers@gooogle.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, 
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, 
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 intel-gvt-dev@lists.freedesktop.org, 
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 2, 2021 at 10:18 AM Emil Velikov <emil.l.velikov@gmail.com> wrote:
>
> Hi Jim,
>
> On Sat, 31 Jul 2021 at 22:42, Jim Cromie <jim.cromie@gmail.com> wrote:
>
> > Use of this new data member will be rare, it might be worth redoing
> > this as a separate/sub-type to keep the base case.
> >
> > Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> > ---
> >  include/linux/moduleparam.h | 11 +++++++++--
> >  1 file changed, 9 insertions(+), 2 deletions(-)
> >
> > diff --git a/include/linux/moduleparam.h b/include/linux/moduleparam.h
> > index eed280fae433..e9495b1e794d 100644
> > --- a/include/linux/moduleparam.h
> > +++ b/include/linux/moduleparam.h
> > @@ -78,6 +78,7 @@ struct kernel_param {
> >                 const struct kparam_string *str;
> >                 const struct kparam_array *arr;
> >         };
> > +       void *data;
>
> Might as well make this "const void *" since it is a compile-time constant?
>

yes indeed. revising.  thanks

> -Emil
