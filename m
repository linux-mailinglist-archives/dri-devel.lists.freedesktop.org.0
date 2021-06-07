Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EAD39E4D7
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 19:07:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4DE96E955;
	Mon,  7 Jun 2021 17:07:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A54EE6E955
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jun 2021 17:07:14 +0000 (UTC)
Received: by mail-qv1-xf36.google.com with SMTP id q6so9253643qvb.2
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jun 2021 10:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RmeYQ/ZjjCaIyjItMjlP85jvXRjCl3Zk4JkEtkJYSBY=;
 b=oISc4cU4YTQkjp0n9pgdr1lbPZXsWrFmqBytfBGf/VTDke+AUi5NgsMmgMWBNX7pOi
 yz01vx6nHE34B+5QvYaAy5AIp1leR3my8AuccPTtPbCsKKS/0rgd+vFejAGV+pC2337M
 Hyu649c0Y6FMGVBtvNZni1VLAGOPfx5AL2Blg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RmeYQ/ZjjCaIyjItMjlP85jvXRjCl3Zk4JkEtkJYSBY=;
 b=peMICHYGcAB0Rn05HHOOLiLL1QIQAfPX1bkZCJCtmxeitKcIQEQwX+wsLHAEuI27uT
 75ahbfN+p6ZEpRcYAZWorwuckNW7UFX7HtRlpx6OjmuPyK7Q1Un+HyMYMZE5+Wx402US
 3qbNPIIn4cHWsCW3+87OCkqpNdnfqT/vYIobmMGbx7rVru1keCpF2xbV0lNeeWEdZNSU
 enSpkigkY0q0H1EEmGegyL12M4ZWLyYeyRBpLM9LVhEy+QwSz18iAETaD8a1/oGix6a+
 w1bE/BGocHuHlLJPy4FaUYopQuEmXLUK5nb1pRRAseHEE1YP+YzzZuR13QadjpDXJLiS
 iymg==
X-Gm-Message-State: AOAM532rrHcMARnSZPYkodnsUnhEaBcSADZ9J5q9L7C4bAJVvKdpSiCm
 WdejFnEhWcZgMXvo9jkfdSK85Jr7Q2XDLQ==
X-Google-Smtp-Source: ABdhPJwrgU2jxu3b64eaDX5+5KVRDQDUHGU0XkAeNAGU8Ur8602D8VnHqIPpeVM5vyIz/j9onzcdLA==
X-Received: by 2002:ad4:4783:: with SMTP id z3mr18804637qvy.43.1623085633834; 
 Mon, 07 Jun 2021 10:07:13 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com.
 [209.85.219.169])
 by smtp.gmail.com with ESMTPSA id d6sm10304199qkf.109.2021.06.07.10.07.13
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 10:07:13 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id g142so6677657ybf.9
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jun 2021 10:07:13 -0700 (PDT)
X-Received: by 2002:a25:8082:: with SMTP id n2mr25004184ybk.79.1623085632738; 
 Mon, 07 Jun 2021 10:07:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210525000159.3384921-1-dianders@chromium.org>
 <20210524165920.v8.7.I18e60221f6d048d14d6c50a770b15f356fa75092@changeid>
 <6e0cd667a8a776e524b42f1535827208@codeaurora.org>
In-Reply-To: <6e0cd667a8a776e524b42f1535827208@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 7 Jun 2021 10:07:01 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UEUsP4qRB-zj31ykS2UznnY=6WF2pD26=FDnVZy6rxCg@mail.gmail.com>
Message-ID: <CAD=FV=UEUsP4qRB-zj31ykS2UznnY=6WF2pD26=FDnVZy6rxCg@mail.gmail.com>
Subject: Re: [PATCH v8 07/11] drm/panel: panel-simple: Stash DP AUX bus; allow
 using it for DDC
To: Rajeev Nandan <rajeevny@codeaurora.org>
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
 dri-devel <dri-devel@lists.freedesktop.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, LKML <linux-kernel@vger.kernel.org>,
 Steev Klimaszewski <steev@kali.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Stephen Boyd <swboyd@chromium.org>, Thierry Reding <treding@nvidia.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Jun 4, 2021 at 9:10 AM <rajeevny@codeaurora.org> wrote:
>
> Hi Doug,
>
> >       panel->no_hpd = of_property_read_bool(dev->of_node, "no-hpd");
> >       if (!panel->no_hpd) {
> > @@ -708,6 +712,8 @@ static int panel_simple_probe(struct device *dev,
> > const struct panel_desc *desc)
> >
> >               if (!panel->ddc)
> >                       return -EPROBE_DEFER;
> > +     } else if (aux) {
> > +             panel->ddc = &aux->ddc;
> >       }
>
> In panel_simple_probe(), the put_device(&panel->ddc->dev) call is
> causing issue when the aux->ddc is used to assign panel->ddc
> It works well when "ddc-i2c-bus" is used to assign panel->ddc
>
> static int panel_simple_probe(...)
> {
> ...
>
> free_ddc:
>          if (panel->ddc)
>                  put_device(&panel->ddc->dev);
>
>          return err;
> }

Thanks for catching! Fixed in v9.


-Doug
