Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDE336F3AF
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 03:30:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 067466F4E7;
	Fri, 30 Apr 2021 01:30:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ECF26F4E7
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 01:30:46 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id o27so376468qkj.9
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 18:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V1QnMHl1bv4GYjD2nKUUJjqSbgwtkE7PlJ3sqyWNs7Y=;
 b=PtHlsQZOZ+E4ykn+R3l13RBajbWKW9bc5n0CxdJOHTPMz4PSUer/AJh9vCysr5UYOv
 SuCTrQprrgY+vi68vThE0YH88YfY2vB8BtuvkvLHFzNcfsD3Qo++eWfTMmQBN66+qcZx
 YA3c9pl9Lat5hMK3NWhl/lTgmlPl8zmEwFMKU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V1QnMHl1bv4GYjD2nKUUJjqSbgwtkE7PlJ3sqyWNs7Y=;
 b=Epw+Wwua2s8NtERCSkMm4ZoYBFkRBFrTs0I1TbDaSzpOxJ1QoGx0cB4MGqfUXERaTv
 b5H8g0py54cCaVL4R1iXVDEdtKNpxuNG9xKFy0K0+m2JHuUgw1wI7kiVi+8xPkXEalXy
 zZ08J35JXSEtV0dV8lRIclW3QkwW7x0NrbjpSrZ5vBJEh+vCeU3XD0c7B6AX4fbU8+4k
 +yhrFnbyxnTuQlBLnhFMHbOsdI1+VWG+/SqjtrFenxdBnu0owsn5s9n3Xe+LITy/A3h7
 0QN/vLXHlgMxfZP609DuNk3dPPThNsx2ChiuxKf8GrDuDVB/bYs0vm2Fg9M6icp+VOow
 QULw==
X-Gm-Message-State: AOAM532BE1o2QhmbOOiHG1DYmg7cbbcrgfYVCraGVHgnQkm21UXTYrGN
 EKPUUFuP+wTJ3alVTE5rzxYMt6Fo620VnQ==
X-Google-Smtp-Source: ABdhPJxh79tyrq+t+HSSJJjJqq5n8MrPIihj4NpLlRkP/5okZHrSNtGu/b+l07jS0o5fG17sySYJXA==
X-Received: by 2002:ae9:e8d5:: with SMTP id a204mr2672661qkg.409.1619746245354; 
 Thu, 29 Apr 2021 18:30:45 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com.
 [209.85.219.176])
 by smtp.gmail.com with ESMTPSA id f16sm391521qtq.47.2021.04.29.18.30.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 18:30:45 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id i4so43487151ybe.2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 18:30:45 -0700 (PDT)
X-Received: by 2002:a25:80d4:: with SMTP id c20mr3510159ybm.345.1619745906527; 
 Thu, 29 Apr 2021 18:25:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210423165906.2504169-1-dianders@chromium.org>
 <20210423095743.v5.1.I9e6af2529d6c61e5daf86a15a1211121c5223b9a@changeid>
 <CACRpkdYkRFLvCRPSYNzYQG58QgPfhvjtHb+FBQZadyrnjC8=1A@mail.gmail.com>
In-Reply-To: <CACRpkdYkRFLvCRPSYNzYQG58QgPfhvjtHb+FBQZadyrnjC8=1A@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 29 Apr 2021 18:24:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UX683grZ=poTwKXxSqYBCLdLAOCxOPhE_xVVgKbe36Mw@mail.gmail.com>
Message-ID: <CAD=FV=UX683grZ=poTwKXxSqYBCLdLAOCxOPhE_xVVgKbe36Mw@mail.gmail.com>
Subject: Re: [PATCH v5 01/20] drm/panel: panel-simple: Add missing
 pm_runtime_disable() calls
To: Linus Walleij <linus.walleij@linaro.org>
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
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, MSM <linux-arm-msm@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Steev Klimaszewski <steev@kali.org>, Stephen Boyd <swboyd@chromium.org>,
 Wolfram Sang <wsa@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 linux-i2c <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Apr 29, 2021 at 5:58 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Fri, Apr 23, 2021 at 6:59 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> > In commit 3235b0f20a0a ("drm/panel: panel-simple: Use runtime pm to
> > avoid excessive unprepare / prepare") we started using pm_runtime, but
> > my patch neglected to add the proper pm_runtime_disable(). Doh! Add
> > them now.
> >
> > Fixes: 3235b0f20a0a ("drm/panel: panel-simple: Use runtime pm to avoid excessive unprepare / prepare")
> > Reported-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> This patch as such:
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Notice however: you turn on pm runtime pm_runtime_enable()
> in panel_simple_probe() but are you ever turning it off in
> panel_simple_remove()?
>
> I think pm_runtime_disable(); need to be added there?

I'm a bit confused. You're saying that I need to add
pm_runtime_disable() to panel_simple_remove()? Doesn't this patch do
that? This patch adds two calls to pm_runtime_disable(). One of those
is in the probe error path and the other one is in
panel_simple_remove().

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
