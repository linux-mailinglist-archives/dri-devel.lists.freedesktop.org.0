Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3302539E4EA
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 19:07:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38D386E956;
	Mon,  7 Jun 2021 17:07:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA3F16E956
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jun 2021 17:07:27 +0000 (UTC)
Received: by mail-qv1-xf33.google.com with SMTP id u14so6350876qvq.6
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jun 2021 10:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Vmc21GFO17uaFIYIEI6ngL7qf7K+9zFe/VHNqdjyLTk=;
 b=Sw3lO1CuIlIW8p7F9X3EIJWbHqckmdlxzrp7zumdiztpcK0kS+1dg7doroe67j7AiX
 6ISqph79TFZjX9hMy/r/UF0kMeh+9gTRwhS6SEVotj3vIXHu9xL9KDu9UuiK20DXefxL
 8T3IDs+fg77gOa1QGIfGtyYVVNonxe2aZ5rrk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vmc21GFO17uaFIYIEI6ngL7qf7K+9zFe/VHNqdjyLTk=;
 b=WxDocKBmPrK0oe8XlzHN4R7M8AesxfVL2rzTBtakNAgBv/oFJWf8U9Jc9MboKs1ey0
 M0NFLusAiwXTx1AbHQRDtE0d6zjOEMDvZTKK25vey8THRd2Oi+vao2aojLcYhvglEQ9K
 Uu7VSmqEjXBZokbpVnfvb/OTvKxyv0nOM+OPT04IixjZ4FJFGBzCqsiWdmX4JmV4GNgj
 vKvSQVtjDGh7Uwwi+vFLpelS8OW94fFoeA3mvPHH8pFm/Urg97qZ86CBnwgM+g1jlDA4
 1GCH+4eA6tTlM4CmQ88CurKVyPFzfb7inQy0VVPTstITlXuixTBx2Kv3FyAV5Pa48yKi
 FKUA==
X-Gm-Message-State: AOAM533m7EopU09VzMs7/EAt8akbW3g4mokcPfHAfG98paZGrSdMGc6A
 Ee/+eGmTw+OOKL+M859hJVLIQ8972z6jrQ==
X-Google-Smtp-Source: ABdhPJycvDIY1V5UTimNT/8VfwbWmnQywhBR4g4ao843tXpzedXo+/OZ06e8ZXGxybZxl4YWB6r+ZQ==
X-Received: by 2002:a0c:c612:: with SMTP id v18mr19093923qvi.20.1623085646683; 
 Mon, 07 Jun 2021 10:07:26 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com.
 [209.85.219.177])
 by smtp.gmail.com with ESMTPSA id i12sm9872540qke.59.2021.06.07.10.07.24
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 10:07:25 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id b9so25999382ybg.10
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jun 2021 10:07:24 -0700 (PDT)
X-Received: by 2002:a25:ab4b:: with SMTP id u69mr25982035ybi.276.1623085644485; 
 Mon, 07 Jun 2021 10:07:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210525000159.3384921-1-dianders@chromium.org>
 <20210524165920.v8.8.If89144992cb9d900f8c91a8d1817dbe00f543720@changeid>
 <YLxRyC9eNlg+Uex3@builder.lan>
In-Reply-To: <YLxRyC9eNlg+Uex3@builder.lan>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 7 Jun 2021 10:07:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UZkzKG6EJFAU9jCjb-twChzCH+JtcL5a9VyO5dxSdOwA@mail.gmail.com>
Message-ID: <CAD=FV=UZkzKG6EJFAU9jCjb-twChzCH+JtcL5a9VyO5dxSdOwA@mail.gmail.com>
Subject: Re: [PATCH v8 08/11] drm/bridge: ti-sn65dsi86: Promote the AUX
 channel to its own sub-dev
To: Bjorn Andersson <bjorn.andersson@linaro.org>
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
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, LKML <linux-kernel@vger.kernel.org>,
 Steev Klimaszewski <steev@kali.org>, Stephen Boyd <swboyd@chromium.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thierry Reding <treding@nvidia.com>, Sam Ravnborg <sam@ravnborg.org>,
 Robert Foss <robert.foss@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sat, Jun 5, 2021 at 9:40 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> > +     /*
> > +      * We couldn't do this pre-probe because it would confuse pinctrl.
> > +      * It would have tried to grab the same pins that the main device had.
> > +      * Set it now so that we can put the proper (sub) device in the aux
> > +      * structure and it will have the right node.
> > +      */
> > +     adev->dev.of_node = pdata->dev->of_node;
>
> I suspect the refcount of the of_node will be wrong here and upon
> removing the aux device things will be off...
>
> Instead, I think you're looking for device_set_of_node_from_dev(), which
> also sets of_node_reused, which in turn causes pinctrl_bind_pins() to be
> skipped - i.e. it seems to deal with the problem your comment describes.

You rock! This is exactly what I wanted. I wish I had thought to look
for it--I somehow just assumed that this wasn't already a solved
problem.

-Doug
