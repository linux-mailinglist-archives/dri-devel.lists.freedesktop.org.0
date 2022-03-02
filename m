Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C7F4C9C90
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 05:37:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE5D010EA5C;
	Wed,  2 Mar 2022 04:37:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CDB210EA5C
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 04:37:34 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id qa43so1099137ejc.12
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Mar 2022 20:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=19CW827ZzVLsvgIhXqk68Zb/1sS42FgXn0VkhDlF3t0=;
 b=GIuBxkOY5/isOSE1sebG0unsTU5nlyINdWcUp+VOtbAGKPwEtWlxRdeQa6TgTxoftn
 O7+JptjtDX8YGSiGh0bZ/rcKCP6ugbhOuz06DLFdhyxcq7UlgQkw6PWXMuUuP3U6rL1B
 EwlL2i0lQGBLEs72YoqS5Jt3NcQ4yfjZkUIho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=19CW827ZzVLsvgIhXqk68Zb/1sS42FgXn0VkhDlF3t0=;
 b=oDrnhVTvlXuXzVNfsFYyzBUsxsbp+w53IQ7stNMuOWBWFgKRDwiIcKZTovZ8VdRlhC
 vIF4NZZTxEqXf2/bWEaFoeH260E2ZgA5IEtLa7fKem/zQVw9h/q2avgsVUHa0lzrzKNp
 hvflKp0T/4OVx3fgaf0gNSTTID9gcQ+xguW6Aoe85zKf1T/AIP2GRd2rAiP1Mc2xwZf4
 bIMH0/m7BRlD6ULEJu8fWRtsN2R9vz60KaRxnxT8j60IQjnhpGJImhU60akDeKoNFmjc
 5roW6+Drowa/s1ShqfLs04ZWqfj/V2WdDzK6enPcD7k2WMw6FspIXoOutGdmicnS0zt3
 k17Q==
X-Gm-Message-State: AOAM530h593uO6vJ7C9vH1zxndKIHkn6L2M79gwnJqgxt/G9FDsuaEjp
 5U610N6t5n2yy6Ujep96KfHPDrwTlXIu3fZgULzwfA==
X-Google-Smtp-Source: ABdhPJzQP+XKEQkfNFwjCcnNSO7Gr0KZrj0oUKJoKztAdSlmW2Ji2pqD7hGlUAedvpPM5yzP7Xbht+JhzftOH/mtkPo=
X-Received: by 2002:a17:906:c59:b0:6b9:59d8:263e with SMTP id
 t25-20020a1709060c5900b006b959d8263emr22078740ejf.770.1646195852904; Tue, 01
 Mar 2022 20:37:32 -0800 (PST)
MIME-Version: 1.0
References: <20220301141247.126911-1-jagan@amarulasolutions.com>
 <20220301141247.126911-8-jagan@amarulasolutions.com>
 <CACRpkdb4msdDt+pqggyaMXNxs_PWNqcP1+N5RL5nVw6QxWZ1Qw@mail.gmail.com>
In-Reply-To: <CACRpkdb4msdDt+pqggyaMXNxs_PWNqcP1+N5RL5nVw6QxWZ1Qw@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 2 Mar 2022 10:07:21 +0530
Message-ID: <CAMty3ZCqJ0KuoiRKzwG4VubBJVwzx-k0XTpBtF0XGVaJhxDaXw@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] drm: bridge: anx7625: Switch to
 devm_drm_of_get_bridge
To: Linus Walleij <linus.walleij@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org, linux-amarula@amarulasolutions.com,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 2, 2022 at 4:50 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Tue, Mar 1, 2022 at 3:13 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> > +       bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
> > +       if (IS_ERR(bridge)) {
> > +               dev_err(dev, "error to get bridge\n");
> > +               return PTR_ERR(bridge);
> >         }
> >
> >         d->bridge_out = bridge;
>
> Also notice how this bridge gets used in other places:
>
> struct drm_connector *connector = drm_panel_bridge_connector(mcde->bridge);

mcde->bridge bridge is the current bridge pointer it cannot affect
this change. d->bridge_out is what we are finding of the downstream
bridge.

>
> Since you deleted:
>
> -       } else if (bridge) {
> -               /* TODO: AV8100 HDMI encoder goes here for example */
> -               dev_info(dev, "connected to non-panel bridge (unsupported)\n");
> -               return -ENODEV;

So, this means mcde dsi can support if the downstream bridge is the
panel not if the downstream bridge is the next bridge. With
devm_drm_of_get_bridge we cannot find that diff. Identifying the
panel-bridge with some name pointer during panel_bridge_add might
solve this, not sure that is proper way to do that?

Thanks,
Jagan.
