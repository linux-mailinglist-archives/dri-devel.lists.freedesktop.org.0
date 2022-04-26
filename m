Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CB4510AC2
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 22:53:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AECE10E5F1;
	Tue, 26 Apr 2022 20:53:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21FCA10E5F1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 20:53:08 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id p4so8205912edx.0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 13:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o+6smG6ZsaikM1dg09vZip/ZwNi93PfiwahWrVpAv9A=;
 b=hJIZi6xaEIf7LJsIqr6G55r7hJou56/b/P3bACckDThw8eadVK4SdjrGaWfAee4zN4
 6TeH/YbjnzVAyl/zOKMMRvgLHGPqu9gyRKWTE0HjuunYksv8Wkja294rzR9FVDeeMnC1
 zb7rGNPS6Q8lK1WtG3/29Ko/NFQH0MCJEIteI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o+6smG6ZsaikM1dg09vZip/ZwNi93PfiwahWrVpAv9A=;
 b=HUoFJHgf43oDpY5rVAJzcaRj0z6IWL56xDHeM1tq1D0y4e9VZeZwN3QUI64utIX2ow
 yHwD5pvmQG2RqwePnV+5oe17Ed/OzkRgQ+YMf58an0fS9J52AWRWQLa9F5hC9EVPe0QC
 DZafmwVTA0Iy9dF9EjlH9a+BIDdGYprkYcW80XpkHZ/fx8ifKefPMdhNX35qwybKdIjv
 mcMN45TNI3IqrOxD1mpvKvCbb0x0duvetUeXhyUyz7Kb4AZxczpkwwZDRmYP8sCkZuqK
 pBx0WNJkEQYCoQVKwSCOSUemYJhaxkqkQWkjaVNiJ1dRr8HA6DNgQ2SpFmApKMcYe9oN
 Xh5A==
X-Gm-Message-State: AOAM531cEp9btx7GrfQlh4PCpudnGiPidTKA7WkQf0EQdL0ypO5/y8Fw
 t+H7vmzB9beMe+SDRenCEPwyDISG5a34BpiJnuc=
X-Google-Smtp-Source: ABdhPJzefRvjproXHo7WIdHuHwq5HKwDCy25KkokXOojQsb0J4qSGLwABhUWBlQL1QvJKGj6zchlrQ==
X-Received: by 2002:a05:6402:4393:b0:426:1500:2a4a with SMTP id
 o19-20020a056402439300b0042615002a4amr182873edc.97.1651006386350; 
 Tue, 26 Apr 2022 13:53:06 -0700 (PDT)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com.
 [209.85.128.41]) by smtp.gmail.com with ESMTPSA id
 r19-20020a17090638d300b006d6e4fc047bsm5535889ejd.11.2022.04.26.13.53.05
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 13:53:05 -0700 (PDT)
Received: by mail-wm1-f41.google.com with SMTP id
 n126-20020a1c2784000000b0038e8af3e788so26959wmn.1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 13:53:05 -0700 (PDT)
X-Received: by 2002:a05:600c:3d0e:b0:38f:f83b:e7dc with SMTP id
 bh14-20020a05600c3d0e00b0038ff83be7dcmr31516102wmb.29.1651006385011; Tue, 26
 Apr 2022 13:53:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220426132121.RFC.1.I31ec454f8d4ffce51a7708a8092f8a6f9c929092@changeid>
 <a21a6ad5-5ed3-6207-8af7-655d19197041@quicinc.com>
In-Reply-To: <a21a6ad5-5ed3-6207-8af7-655d19197041@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 26 Apr 2022 13:52:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XOWfz39imimoijNM14dUJNiwr8_aqPFCR=LmgH7yYzQQ@mail.gmail.com>
Message-ID: <CAD=FV=XOWfz39imimoijNM14dUJNiwr8_aqPFCR=LmgH7yYzQQ@mail.gmail.com>
Subject: Re: [RFC PATCH] drm/edid: drm_add_modes_noedid() should set lowest
 resolution as preferred
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Apr 26, 2022 at 1:46 PM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> On 4/26/2022 1:21 PM, Douglas Anderson wrote:
> > If we're unable to read the EDID for a display because it's corrupt /
> > bogus / invalid then we'll add a set of standard modes for the
> > display. When userspace looks at these modes it doesn't really have a
> > good concept for which mode to pick and it'll likely pick the highest
> > resolution one by default. That's probably not ideal because the modes
> > were purely guesses on the part of the Linux kernel.
> >
> > Let's instead set 640x480 as the "preferred" mode when we have no EDID.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> drm_dmt_modes array is sorted but you are also relying on this check to
> eliminate the non-60fps modes
>
> 5611            if (drm_mode_vrefresh(ptr) > 61)
> 5612                    continue;
>
> I am not sure why we filter out the modes > 61 vrefresh.
>
> If that check will remain this is okay.
>
> If its not, its not reliable that the first mode will be 640x480@60

I suspect that the check will remain. I guess I could try to do
something fancier if people want, but I'd be interested in _what_
fancier thing I should do if so. Do we want the rule to remain that we
always prefer 640x480, or do we want to prefer the lowest resolution?
...do we want to prefer 60 Hz or the lowest refresh rate? Do we do
this only for DP (which explicitly calls out 640x480 @60Hz as the best
failsafe) or for everything?

For now, the way it's coded up seems reasonable (to me). It's the
lowest resolution _and_ it's 640x480 just because of the current
values of the table. I suspect that extra lower resolution failsafe
modes won't be added, but we can always change the rules here if/when
they are.

-Doug
