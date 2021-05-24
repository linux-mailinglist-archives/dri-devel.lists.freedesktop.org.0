Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 875AC38EC8B
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 17:15:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7E886E1ED;
	Mon, 24 May 2021 15:15:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80F226E1ED
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 15:15:24 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id m124so20297951pgm.13
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 08:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2hiXKO119GSaKQpX+psN+usfMuDJQ/GOJx+xCi36V10=;
 b=U/Ic0oyql6VSf1zMHtEy4mFLp+v9j8wB4h0j/Vp8yHCVYnaly6d7tpSDvlo8G1uHBG
 onMLvowml45t3Phb7Bu7NbF6vxIoTKOpA8zY6VOsOpeZPNaRe3LNzlYisU6IV8eLRjaT
 +IRU0yWNE2MZiNO9ukMoaEt1eOKN9HLESVPHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2hiXKO119GSaKQpX+psN+usfMuDJQ/GOJx+xCi36V10=;
 b=mD8x9jppmMNKiW/Y++nay0CO9Y+w190ZLYXOFylLIoqGT6lptSSheghkfwfa2kVOWz
 HpLIegFr7jcvquowUzHuDjU1CNT4hKQ8XI0yTQV7uu+OBFf4IAQW85WIegx/RdNMsGdm
 x/YzUBJbeluYSr5AJYGZww/JKZaJfWZS6Z/wvjzOouY/xWA5K600qVPwupF5Noux7r4p
 cTCogE+bSEmVaBvWbUGU+2+gu9gQS1nyCxzpmf+YjRldmPgqLpb/DQshREz5uL3hAAJt
 z06tq/JKO8H1/MJbJAUS3a8cg1lZ0yKUVaM7lTGVryIFBH6Gn0t+hoyMXteNwE+Z3m8u
 GUvw==
X-Gm-Message-State: AOAM5319x8h15AZGisfW8UndbGGXiI9j5gBA2pgPPwd9sSWTcWCz/CYU
 ppMhyBEHVZLq9zYIWHuEj6x/lV7eglkyag==
X-Google-Smtp-Source: ABdhPJw1vmlh2hJZgksGRYAYH0vF1e7VcksqNfWFLon9Rj6gNq1WW/1Vx0MBmGhhW0m6Ao/XtpAkaA==
X-Received: by 2002:a62:d0c2:0:b029:2d9:529f:f4ef with SMTP id
 p185-20020a62d0c20000b02902d9529ff4efmr25637136pfg.41.1621869323902; 
 Mon, 24 May 2021 08:15:23 -0700 (PDT)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com.
 [209.85.215.174])
 by smtp.gmail.com with ESMTPSA id m191sm11743879pga.88.2021.05.24.08.15.22
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 08:15:23 -0700 (PDT)
Received: by mail-pg1-f174.google.com with SMTP id f22so19379685pgb.9
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 08:15:22 -0700 (PDT)
X-Received: by 2002:a05:6102:3239:: with SMTP id
 x25mr21095761vsf.47.1621869311242; 
 Mon, 24 May 2021 08:15:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210517200907.1459182-1-dianders@chromium.org>
 <2536404ca2ab0e7b785a104ec6b4efb48943a438.camel@redhat.com>
In-Reply-To: <2536404ca2ab0e7b785a104ec6b4efb48943a438.camel@redhat.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 24 May 2021 08:14:59 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WqM6fTuk3g4Rt9D+Fn=P1aUQwM3Cjz-K2BXurMB2AQ5A@mail.gmail.com>
Message-ID: <CAD=FV=WqM6fTuk3g4Rt9D+Fn=P1aUQwM3Cjz-K2BXurMB2AQ5A@mail.gmail.com>
Subject: Re: [PATCH v7 00/10] drm: Fix EDID reading on ti-sn65dsi86 by
 introducing the DP AUX bus
To: Lyude Paul <lyude@redhat.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Clark <robdclark@chromium.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Andy Gross <agross@kernel.org>, Thierry Reding <treding@nvidia.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Steev Klimaszewski <steev@kali.org>, LKML <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, May 21, 2021 at 4:07 PM Lyude Paul <lyude@redhat.com> wrote:
>
> For patches 5, and 6:
>
> Reviewed-by: Lyude Paul <lyude@redhat.com>
>
> This week got really busy so I wasn't able to look at the rest of them, but next
> week is going to be a lot less busy so I should be able to look at them then

Thanks for your review on the two patches and for letting me know your
plans. I know that I still need to spin the bindings patches with Rob
Herring's feedback, but I won't do that until I know you're done
reviewing just to avoid spamming everyone an extra time. Assuming no
emergency comes around and slams me, I should be able to react/respond
fairly quickly this week M-Th, though I'm taking Friday off.

BTW: if anyone reading this happens to have 10 minutes, I'd sorta like
to get patch #1 in this series landed sooner rather than later and
it's a dead-simple fix. If I see a review of that one, I'll apply it
to drm-misc before sending out the next version of the series. ;-)

-Doug
