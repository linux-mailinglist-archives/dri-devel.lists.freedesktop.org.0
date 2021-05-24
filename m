Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2BA38F4BB
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 23:09:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AA5489E2A;
	Mon, 24 May 2021 21:09:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC7ED89E2A
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 21:09:09 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id q10so28406598qkc.5
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 14:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Cb0Uq1HaIEgENxGmHlcF9aKNMAXuk7VxGUnLZxEoKmU=;
 b=ntnzKyxJBJ7zU41VapDr35r0+JiHT8LcMIOT1SR4I6dP7Nrl9EK73MZQzrTWVv2G/a
 TvLKeWmsqGVaLQw7mwVv23fZ6u/EttxAw0FagUfXUq1zL12KWaqXnLByBCoKE5F7om18
 zGL5EynggjpTSTpu9EBvXFi+MSf3PrIlYRTSY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Cb0Uq1HaIEgENxGmHlcF9aKNMAXuk7VxGUnLZxEoKmU=;
 b=KdgdDh5ca7SPjupxYmb7MdmeJsJtMPbnXiWU8sVKqbfx115wm8YskoKf1owlZ8UeLJ
 Egq2NmHM5WukhGSAW55WjXCCC39wx2HJHYbk8SVGl3NhnH9P/FhTs2wn9alNcRt1P36j
 YVCrIAJfdDjEotsEuzgYdt1dX96mW1D4p7JDLVXT7MPtVK//Yixy8du8VjixKXJEHgPV
 zk3FU6jj9g3vnqU+jrIwbjKvwEAjWT03gpywtsM7N+qxro1gq/7N8DZuaAsdUMV6ZBVg
 vZv3U4lVbvD+Xv53W832CbJmkfFLvedUH01Vvy20aJZJZNVKAh0cFBX3FuKyiHvV4O1C
 G/dQ==
X-Gm-Message-State: AOAM533EzYWulXQnac8hUimTr5ILLSe2eCQYTvSn3VOMWvC9QKlKjSB6
 BxuMkU/ybcu2/TT2QEGqHyEOUG4/9jBMsg==
X-Google-Smtp-Source: ABdhPJzT8Kx2qM4FakI0ASog3AWgG5WS2NO3O9IStf3kgTHt0cdWOefsNC4/lqsdjeQld2Qn2ZibKw==
X-Received: by 2002:a05:620a:120d:: with SMTP id
 u13mr3695462qkj.404.1621890548424; 
 Mon, 24 May 2021 14:09:08 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com.
 [209.85.219.181])
 by smtp.gmail.com with ESMTPSA id d2sm12186568qkn.95.2021.05.24.14.09.07
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 14:09:07 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id b13so38547009ybk.4
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 14:09:07 -0700 (PDT)
X-Received: by 2002:a25:b801:: with SMTP id v1mr2108952ybj.32.1621890546699;
 Mon, 24 May 2021 14:09:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210517200907.1459182-1-dianders@chromium.org>
 <20210517130450.v7.1.I9e947183e95c9bd067c9c1d51208ac6a96385139@changeid>
 <YKwK+lkcHMwAosLn@pendragon.ideasonboard.com>
In-Reply-To: <YKwK+lkcHMwAosLn@pendragon.ideasonboard.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 24 May 2021 14:08:53 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VnJB_6PMo3FQt8djYDD7h0s=sc9TAbKLQMe-y+43Z3NQ@mail.gmail.com>
Message-ID: <CAD=FV=VnJB_6PMo3FQt8djYDD7h0s=sc9TAbKLQMe-y+43Z3NQ@mail.gmail.com>
Subject: Re: [PATCH v7 01/10] drm/panel: panel-simple: Add missing
 pm_runtime_dont_use_autosuspend() calls
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Thierry Reding <treding@nvidia.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Steev Klimaszewski <steev@kali.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, May 24, 2021 at 1:22 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Doug,
>
> Thank you for the patch.
>
> On Mon, May 17, 2021 at 01:08:58PM -0700, Douglas Anderson wrote:
> > The PM Runtime docs specifically call out the need to call
> > pm_runtime_dont_use_autosuspend() in the remove() callback if
> > pm_runtime_use_autosuspend() was called in probe():
> >
> > > Drivers in ->remove() callback should undo the runtime PM changes done
> > > in ->probe(). Usually this means calling pm_runtime_disable(),
> > > pm_runtime_dont_use_autosuspend() etc.
>
> ~/src/kernel/linux $ git grep pm_runtime_use_autosuspend -- drivers | wc -l
> 209
> ~/src/kernel/linux $ git grep pm_runtime_dont_use_autosuspend -- drivers | wc -l
> 80
>
> Seems like a lost battle :-(
>
> The fix is right, but I wonder if this shouldn't be handled
> automatically by the runtime PM core. The runtime PM API is notoriously
> difficult to use correctly.

No kidding.


> > We should do this. This fixes a warning splat that I saw when I was
> > testing out the panel-simple's remove().
> >
> > Fixes: 3235b0f20a0a ("drm/panel: panel-simple: Use runtime pm to avoid excessive unprepare / prepare")
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks! I have pushed just this patch for now.

-Doug
