Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44180350242
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 16:32:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A4AF6EAAD;
	Wed, 31 Mar 2021 14:32:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5479E6E1F8
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 14:32:28 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id c6so14601583qtc.1
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 07:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i5wECuC5weZgjdPi3xLPpPAVwy9+CVkNbVRnPB22rV4=;
 b=Cb1kQzuwRvV8yJG2PLXhPjMlw/q8NuMLEfvdtsAcm9Hb41ToBl/n+b4hL0HBxKy2i/
 leYphrDJFXbTdKb8aRPx+K+wqzaQBnHyonEd1P1gmCBoIUhXmpdP/cI9wzWFC9LwNxHR
 7eLWNY4hAwXmzzSt0QeXdkggESIdeZ5jlp/wQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i5wECuC5weZgjdPi3xLPpPAVwy9+CVkNbVRnPB22rV4=;
 b=SrzMqZoyzeXCJFM8kdoyqnTuNKNAi+7Y8TgJUHOCsFMQxputW3N9GWdD9p+H7qXjxl
 JTQTJ/30uVHOKaNqw4O6hYK4skTKTnbGoKf0oYTHvLe3Xgyosgroj3NaOnIEPukfFLFy
 yPk9KQWoDPayaLqO2gfTOjR3gHaxwqzNw9T09XBvzZL3vfjZ0CdAmifXFs3TL4IsZuCF
 hff2tT/4rHqrkiC4ELMrMBSbpQ9+1qlLWHS8Kh44ff2MAsxIPjeUUktr3ByDYADyukkq
 xoXlNeT3UIFfio1znJt9btsZiI7jfPFoH3fSTTkKCGhF4HqKEn3hJSF5jOR/Kq3GLDdp
 sWdA==
X-Gm-Message-State: AOAM533eiOYRpZMSxndPIkZFngdkNxRbY2FZcxwBhbPkEk4k9gU2cwuU
 kEGSMFY3y5c0e8nEXkaRnJ7vyTqzUXbWiA==
X-Google-Smtp-Source: ABdhPJwtSImpe2tupnIW5Bx6qwZyRR1/XyJKRIcrwykvS2g/RHJ6Erhtkk0wJfZ1i9A3olRB1JopVg==
X-Received: by 2002:ac8:43cb:: with SMTP id w11mr2755404qtn.84.1617201147674; 
 Wed, 31 Mar 2021 07:32:27 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com.
 [209.85.219.182])
 by smtp.gmail.com with ESMTPSA id y14sm1393001qtw.70.2021.03.31.07.32.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Mar 2021 07:32:27 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id v107so16376574ybi.9
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 07:32:27 -0700 (PDT)
X-Received: by 2002:a25:4092:: with SMTP id n140mr5092311yba.276.1617201144211; 
 Wed, 31 Mar 2021 07:32:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210330025345.3980086-1-dianders@chromium.org>
 <CGME20210330025443eucas1p1e53f4fb8623c3dc2ae8ce514e3009bc5@eucas1p1.samsung.com>
 <20210329195255.v2.10.Ida6151df6bfc71df77afee1d72bb7eb0a443f327@changeid>
 <26d73f36-e150-57ec-d957-4b7bda6b366e@samsung.com>
In-Reply-To: <26d73f36-e150-57ec-d957-4b7bda6b366e@samsung.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 31 Mar 2021 07:32:12 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W6SABggAaBbw9LXdf5sHOGGQzZJp8YFmYcWG1yf1rW5w@mail.gmail.com>
Message-ID: <CAD=FV=W6SABggAaBbw9LXdf5sHOGGQzZJp8YFmYcWG1yf1rW5w@mail.gmail.com>
Subject: Re: [PATCH v2 10/14] drm/bridge: ti-sn65dsi86: Stop caching the EDID
 ourselves
To: Andrzej Hajda <a.hajda@samsung.com>
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
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Robert Foss <robert.foss@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Steev Klimaszewski <steev@kali.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Mar 31, 2021 at 3:12 AM Andrzej Hajda <a.hajda@samsung.com> wrote:
>
>
> W dniu 30.03.2021 o 04:53, Douglas Anderson pisze:
> > Now that we have the patch ("drm/edid: Use the cached EDID in
> > drm_get_edid() if eDP") we no longer need to maintain our own
> > cache. Drop this code.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

Note that unless the advice given to me changes, I'm dropping
${SUBJECT} patch on the next spin and putting the EDID cache back in
the bridge driver. See:

https://lore.kernel.org/r/YGMvO3PNDCiBmqov@intel.com/


-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
