Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CCE42FE42
	for <lists+dri-devel@lfdr.de>; Sat, 16 Oct 2021 00:34:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43BCC6EE01;
	Fri, 15 Oct 2021 22:34:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86B556EE01
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 22:34:17 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id d9so43305699edh.5
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 15:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IPP9H53mtCsbQNk9doEzzimC+EjafFfLHkPsfpk1gug=;
 b=Wrmsv1r6CTDbsg6ohN8jcWCEqyPhEjWAqgDfsYvSTD6Z0wUTDq+sgfP0+HD652SaPn
 cBaOtOtCzGLQgEoeMxHfnHkrGiH+JocjZBkkCI1PEGlxKtOY3SQNH5tsK/SrVSkPJsKE
 qSDEP3gCzAKhu4nBYxhktV0Nga3FDmNdmAnd5h5Oa1/eOfPcbveQe63JZpQeth53nKJp
 tGOMwAnFv6lkSLgRyRz7bkGPG3oKDA1PSIU5Ok/Ys+0Wme+189tyJDzt1uPZvfn/pG5B
 +hIQZkuG2b1XNg1U9aImPBbo+CbVio/NzAH3MGaMZZsT0jgTREkOfUBsHBGVozTgM7Tn
 d+6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IPP9H53mtCsbQNk9doEzzimC+EjafFfLHkPsfpk1gug=;
 b=qFfWVBQ9zMkA/WArODJKV4PhQdsnvMBzDWt0rx71CG5J75vwot6yaXD1fjXEY0WafO
 A3YthnIxcTi91iwd4JYH3O9UXm93KHIe6lkAaulciv9KON1N/bft+tu9WPp9sSECNWss
 yYiy8NFm8RJLl/XGFvzuNRcCrJOjhmGcdqztLCmVepltsPXN1yyi4nNnB68XixaL/LML
 uZpQz3/XT/Q0bKTv9hfZGiniF5tWjbBICno96aDSuQcIPMz6/Utln3cXyP4R0l5yR8RZ
 W9kXOh+D3xUjUjfXM30mwtMF2+MmXAB+1aziCRKF+h0w8F2EovL62mWZC9JsYa53z+fl
 qaqA==
X-Gm-Message-State: AOAM531z104kdLjMHkZlE/lJnVPmzUhUzhwFLPrsyDoEe69Ie/B9k2Nn
 F2+NKVq/JBfavUWHV7hQY+uG3XMwNqev52h/dOw=
X-Google-Smtp-Source: ABdhPJyLJjJm67G6BpfJ0eTf82WNnFvO//ihG40tAdRB1n2RDizdnyDHqAIAfAPSbXh3mmlgYBj8ihlZGtJNQkmzTZQ=
X-Received: by 2002:a17:906:fc0a:: with SMTP id
 ov10mr5837689ejb.536.1634337255917; 
 Fri, 15 Oct 2021 15:34:15 -0700 (PDT)
MIME-Version: 1.0
References: <20211015141107.2430800-1-narmstrong@baylibre.com>
 <20211015141107.2430800-7-narmstrong@baylibre.com>
In-Reply-To: <20211015141107.2430800-7-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 16 Oct 2021 00:34:05 +0200
Message-ID: <CAFBinCBwO0CJMPA3K6e8OxXcinzrA5LrSqaKu1XtZPWLXT8Krw@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] drm/meson: encoder_cvbs: switch to bridge with
 ATTACH_NO_CONNECTOR
To: Neil Armstrong <narmstrong@baylibre.com>, sam@ravnborg.org
Cc: daniel@ffwll.ch, Laurent.pinchart@ideasonboard.com, 
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

Hi Neil, Hi Sam,

On Fri, Oct 15, 2021 at 4:11 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
[...]
> +static const struct drm_bridge_funcs meson_encoder_cvbs_bridge_funcs = {
> +       .attach = meson_encoder_cvbs_attach,
> +       .enable = meson_encoder_cvbs_enable,
> +       .disable = meson_encoder_cvbs_disable,
> +       .mode_valid = meson_encoder_cvbs_mode_valid,
> +       .get_modes = meson_encoder_cvbs_get_modes,
> +       .atomic_enable = meson_encoder_cvbs_atomic_enable,
I did some testing on boards where u-boot doesn't initialize the video outputs.
It seems that meson_encoder_cvbs_enable() is never called with this patch.
meson_encoder_cvbs_atomic_enable() is called though.

From what I can see in drm_bridge.c [0] this is even expected.
Does this mean that we need to move all logic from .enable to
.atomic_enable (and same with .disable -> moving that logic to
.atomic_disable)?

The same comment applies to the HDMI patch.


Best regards,
Martin


[0] https://elixir.bootlin.com/linux/v5.15-rc5/source/drivers/gpu/drm/drm_bridge.c#L717
