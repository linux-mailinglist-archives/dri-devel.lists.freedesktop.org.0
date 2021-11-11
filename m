Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC5844DA53
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 17:25:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D7506E980;
	Thu, 11 Nov 2021 16:25:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 355CD6E980
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 16:25:53 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id h23so6366543ila.4
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 08:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VRqJqxxlJwIYS/ddfWmMHHNu+A1m8d9KAG8ft6WQNF0=;
 b=XqMsalAhGNfKo2UQ15NOwdV10LFRX/uoJ6VsXV+BlFHTzxtfrp+8eIku4RA5nHMVXx
 9jvaPrDxo/eWbMVFOawlms6+NaGXadnzwLg6FXzlSSlmL4UjUZRUAsI9kymDAMNy/K8a
 8g9ksjnXnM+dZWUP+yDsT+8fZzkaeNl0xqZEg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VRqJqxxlJwIYS/ddfWmMHHNu+A1m8d9KAG8ft6WQNF0=;
 b=6EbZaE+iq+pyyJlXPtScKUvo9bIxREnaBXdabuaM2Xkgzkjs+LjIyK0PT3sp6cdGeb
 FhdCFNNJLuP+UQ4t+45GVSSoMxt9imzqACLdexVFZHLUQU2vLQAquCS+ay3a21DaMnne
 6yvEgLJgKlCRgJ/f7ShdrWPDRLWDfTjmftctf/rvZhVjrcVWVqfHbWpfVzS9uuoZRhXp
 BMEncdD0fQr3sfCDcYHaEKkuaxKdhxG6VQk/tLhTxP+eM/Jbs3uraJqJDmP3m4vpn0L5
 AFq8sHi5euDLKhxZ7muWbtsx7INP6fSCSLIKMYff75e2fdVm/FU9a9zjTFr3IV1CI0lQ
 RQdQ==
X-Gm-Message-State: AOAM532+70PdhvDyrxc77Xg16f9vQtg+21XKCH8uHA7ZOKqjV7hzFbFT
 qwcDA/P/nLvGJae6l6l+NmZrqeSKbcz5gg==
X-Google-Smtp-Source: ABdhPJxCtRHLS55q5UaqwHmUXSw6IlfMQV1w7tdUGV3mTRWJ2a29ShLdCZD/Ygzni3Zmv+uxXo3qGw==
X-Received: by 2002:a05:6e02:b2a:: with SMTP id
 e10mr4815440ilu.186.1636647952155; 
 Thu, 11 Nov 2021 08:25:52 -0800 (PST)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com.
 [209.85.166.45])
 by smtp.gmail.com with ESMTPSA id k8sm2004499ils.79.2021.11.11.08.25.51
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 08:25:51 -0800 (PST)
Received: by mail-io1-f45.google.com with SMTP id k22so7540427iol.13
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 08:25:51 -0800 (PST)
X-Received: by 2002:a05:6602:2d84:: with SMTP id
 k4mr5635223iow.168.1636647950862; 
 Thu, 11 Nov 2021 08:25:50 -0800 (PST)
MIME-Version: 1.0
References: <20211028105754.v5.1.I828f5db745535fb7e36e8ffdd62d546f6d08b6d1@changeid>
 <CA+cxXh=VOkRnkgfxq8DVes=xCvR=691eY-ViQxME2fHMgt1q8Q@mail.gmail.com>
 <CAD=FV=Vm1X3xFFkffigKr9z_FuTeA0Z70+_0NVfWcSZy90J-Zw@mail.gmail.com>
In-Reply-To: <CAD=FV=Vm1X3xFFkffigKr9z_FuTeA0Z70+_0NVfWcSZy90J-Zw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 11 Nov 2021 08:25:38 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XCLczUhVV7ZqOjCvParO9KO3e=0a3xLBWoTXW5KZczsQ@mail.gmail.com>
Message-ID: <CAD=FV=XCLczUhVV7ZqOjCvParO9KO3e=0a3xLBWoTXW5KZczsQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] drm/bridge: parade-ps8640: Enable runtime power
 management
To: Philip Chen <philipchen@chromium.org>
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>, LKML <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Oct 28, 2021 at 12:39 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Thu, Oct 28, 2021 at 11:02 AM Philip Chen <philipchen@chromium.org> wrote:
> >
> > Add "Sam Ravnborg <sam@ravnborg.org>" to cc list for vis.
> > Remove "Andrzej Hajda <a.hajda@samsung.com>" from cc list as the
> > address can't be found.
>
> Looking at <https://lore.kernel.org/all/b2fb88db-009e-4b38-dc3d-5ce9163257de@samsung.com/>,
> it should be Andrzej Hajda <andrzej.hajda@intel.com>. I've added.
>
>
> > On Thu, Oct 28, 2021 at 10:58 AM Philip Chen <philipchen@chromium.org> wrote:
> > >
> > > Fit ps8640 driver into runtime power management framework:
> > >
> > > First, break _poweron() to 3 parts: (1) turn on power and wait for
> > > ps8640's internal MCU to finish init (2) check panel HPD (which is
> > > proxied by GPIO9) (3) the other configs. As runtime_resume() can be
> > > called before panel is powered, we only add (1) to _resume() and leave
> > > (2)(3) to _pre_enable(). We also add (2) to _aux_transfer() as we want
> > > to ensure panel HPD is asserted before we start AUX CH transactions.
> > >
> > > Second, the original driver has a mysterious delay of 50 ms between (2)
> > > and (3). Since Parade's support can't explain what the delay is for,
> > > and we don't see removing the delay break any boards at hand, remove
> > > the delay to fit into this driver change.
> > >
> > > In addition, rename "powered" to "pre_enabled" and don't check for it
> > > in the pm_runtime calls. The pm_runtime calls are already refcounted
> > > so there's no reason to check there. The other user of "powered",
> > > _get_edid(), only cares if pre_enable() has already been called.
> > >
> > > Lastly, change some existing DRM_...() logging to dev_...() along the
> > > way, since DRM_...() seem to be deprecated in [1].
> > >
> > > [1] https://patchwork.freedesktop.org/patch/454760/
> > >
> > > Signed-off-by: Philip Chen <philipchen@chromium.org>
> > > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > > ---
> > > In v3, I added pm_suspend_ignore_children() in ps8640_probe().
> > > Also, I moved the change of "put_sync_suspend" from patch 2/2 to here.
> > > But I forgot to mention both changes. So edit v3 change log retroactively.
> > >
> > > In v4, I moved the change of "ps8640_ensure_hpd" return data type
> > > from patch 2/2 to here. But I forgot to mention it. So edit v4 change log
> > > retroactively.
> > >
> > > Changes in v5:
> > > - Move the implementation of _runtime_disable() around to resolve merge
> > >   conflict when rebasing.
> > > - Improve the document for how autosuspend_delay is picked.
>
> The new text looks good to me, thanks!
>
> Since this is from @chromium.org and only reviewed-by @chromium.org
> people, I'll plan to give it a 2-week snooze to give others ample time
> to comment on these two patches. If 2 weeks pass w/ no comments then
> I'll land to drm-misc-next. If someone gives an Ack and/or Reviewed-by
> then I'll likely land sooner.

My 2-week snooze went off, so this is now pushed to drm-misc-next
fixing a small whitespace warning that the dim tool complained about.

e9d9f9582c3d drm/bridge: parade-ps8640: Populate devices on aux-bus
826cff3f7ebb drm/bridge: parade-ps8640: Enable runtime power management

-Doug
