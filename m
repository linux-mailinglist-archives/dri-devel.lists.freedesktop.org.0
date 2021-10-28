Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B56E643E90B
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 21:39:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 119306E0E7;
	Thu, 28 Oct 2021 19:39:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD20A6E0E7
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 19:39:22 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id s3so8237140ild.0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 12:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h/tSSshBuJQz7Lwgul+YjHklhggiEii8fl+Q1ov2qBg=;
 b=JAgmYZ1JK3WXZKDXwnei5tjYJA9/Iz1jHuwZyy65wiB0AJb2MEdsiRbxmZg3h8deOT
 D+4zKwOhUlP0HE0GWJ7bS0nwGEW1JuG3nYfKjVCQTJ3JqTQbG83Iod0YFsE15DClPURf
 DnExxUVM2w1UgARqVS/1+f10OqITCHUK4PiwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h/tSSshBuJQz7Lwgul+YjHklhggiEii8fl+Q1ov2qBg=;
 b=Zl24612lfwjyApelUgsCoGW2e6Y1jIpP81rAL1M8D5hjBjW+UsOFwsDmfKDY3mtjk1
 IIzH/YLz/7VqSGrbu44Opqvt/AXN5UfR+t61o9H/TOLLlZGYN95fPvijmlfmscEASquu
 cU06hDW+dduYqTLkN/gNoNVo8gW42sSwQWCNGrZGx/blEYo9TwORGXlaXoG0cvO4Z3Zl
 sc9PtK8YqA97oGDvfPis20w+8sTykXNYLErq2MvTv+3+gT5c5D6k/GzrSDPsFe9iUiha
 K5wsww9DvaXdc1HGuuqSZI/usTtH8NjjZCiy/cHa1xsAhScYJBG8Bfuz2mB3R7nBEBZd
 dAKQ==
X-Gm-Message-State: AOAM531ByRrjNz8c+V9cfH3Xls84c9CYLvo8vK5Q6ZgLDMiRhjAjd028
 2+W+A1vQgmM8oBEYCVkxgUfdOUk6CG6dXg==
X-Google-Smtp-Source: ABdhPJzlbjPgvpgxmD39CVf90emHEsu/Evrj4r+JLmCqMLUvT4ZGCQHPbQ1ozncmDqu/mrPtL8tnvw==
X-Received: by 2002:a05:6e02:1402:: with SMTP id
 n2mr4445724ilo.160.1635449962212; 
 Thu, 28 Oct 2021 12:39:22 -0700 (PDT)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com.
 [209.85.166.176])
 by smtp.gmail.com with ESMTPSA id b3sm1996029ilc.36.2021.10.28.12.39.21
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 12:39:22 -0700 (PDT)
Received: by mail-il1-f176.google.com with SMTP id j28so1756616ila.1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 12:39:21 -0700 (PDT)
X-Received: by 2002:a05:6e02:1b09:: with SMTP id
 i9mr4341118ilv.142.1635449961589; 
 Thu, 28 Oct 2021 12:39:21 -0700 (PDT)
MIME-Version: 1.0
References: <20211028105754.v5.1.I828f5db745535fb7e36e8ffdd62d546f6d08b6d1@changeid>
 <CA+cxXh=VOkRnkgfxq8DVes=xCvR=691eY-ViQxME2fHMgt1q8Q@mail.gmail.com>
In-Reply-To: <CA+cxXh=VOkRnkgfxq8DVes=xCvR=691eY-ViQxME2fHMgt1q8Q@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 28 Oct 2021 12:39:09 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vm1X3xFFkffigKr9z_FuTeA0Z70+_0NVfWcSZy90J-Zw@mail.gmail.com>
Message-ID: <CAD=FV=Vm1X3xFFkffigKr9z_FuTeA0Z70+_0NVfWcSZy90J-Zw@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] drm/bridge: parade-ps8640: Enable runtime power
 management
To: Philip Chen <philipchen@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sam Ravnborg <sam@ravnborg.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
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

Hi,

On Thu, Oct 28, 2021 at 11:02 AM Philip Chen <philipchen@chromium.org> wrote:
>
> Add "Sam Ravnborg <sam@ravnborg.org>" to cc list for vis.
> Remove "Andrzej Hajda <a.hajda@samsung.com>" from cc list as the
> address can't be found.

Looking at <https://lore.kernel.org/all/b2fb88db-009e-4b38-dc3d-5ce9163257de@samsung.com/>,
it should be Andrzej Hajda <andrzej.hajda@intel.com>. I've added.


> On Thu, Oct 28, 2021 at 10:58 AM Philip Chen <philipchen@chromium.org> wrote:
> >
> > Fit ps8640 driver into runtime power management framework:
> >
> > First, break _poweron() to 3 parts: (1) turn on power and wait for
> > ps8640's internal MCU to finish init (2) check panel HPD (which is
> > proxied by GPIO9) (3) the other configs. As runtime_resume() can be
> > called before panel is powered, we only add (1) to _resume() and leave
> > (2)(3) to _pre_enable(). We also add (2) to _aux_transfer() as we want
> > to ensure panel HPD is asserted before we start AUX CH transactions.
> >
> > Second, the original driver has a mysterious delay of 50 ms between (2)
> > and (3). Since Parade's support can't explain what the delay is for,
> > and we don't see removing the delay break any boards at hand, remove
> > the delay to fit into this driver change.
> >
> > In addition, rename "powered" to "pre_enabled" and don't check for it
> > in the pm_runtime calls. The pm_runtime calls are already refcounted
> > so there's no reason to check there. The other user of "powered",
> > _get_edid(), only cares if pre_enable() has already been called.
> >
> > Lastly, change some existing DRM_...() logging to dev_...() along the
> > way, since DRM_...() seem to be deprecated in [1].
> >
> > [1] https://patchwork.freedesktop.org/patch/454760/
> >
> > Signed-off-by: Philip Chen <philipchen@chromium.org>
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > ---
> > In v3, I added pm_suspend_ignore_children() in ps8640_probe().
> > Also, I moved the change of "put_sync_suspend" from patch 2/2 to here.
> > But I forgot to mention both changes. So edit v3 change log retroactively.
> >
> > In v4, I moved the change of "ps8640_ensure_hpd" return data type
> > from patch 2/2 to here. But I forgot to mention it. So edit v4 change log
> > retroactively.
> >
> > Changes in v5:
> > - Move the implementation of _runtime_disable() around to resolve merge
> >   conflict when rebasing.
> > - Improve the document for how autosuspend_delay is picked.

The new text looks good to me, thanks!

Since this is from @chromium.org and only reviewed-by @chromium.org
people, I'll plan to give it a 2-week snooze to give others ample time
to comment on these two patches. If 2 weeks pass w/ no comments then
I'll land to drm-misc-next. If someone gives an Ack and/or Reviewed-by
then I'll likely land sooner.

-Doug
