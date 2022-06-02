Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4988D53C078
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 23:48:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7337710EF4A;
	Thu,  2 Jun 2022 21:48:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E0FC10ED78
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 21:48:37 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id w27so7892356edl.7
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 14:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PlQ+AfYx33ch5Af1MOc8eSZOWrp4sa+5BG8p2IQdVOQ=;
 b=LQbMJioZzGwe6/fK5um+5Ha94Y3saA4t6tLL33c0D7+smsDYIjGyCJ62XISlVIfDnb
 k7+IGE4QIPIQO60LtADGNIslNBNGIZ5QqLEoOEwAapZhW8OmMhz8yMIQrfL9zX/HltC7
 qkwO9hwIWO1HMZSqakKMcSasFiJdp5cXvDCAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PlQ+AfYx33ch5Af1MOc8eSZOWrp4sa+5BG8p2IQdVOQ=;
 b=yuZaZJHkbO0nLmWflf5r38wzB6Eh7Zc3AXdWL/gbUgA9oa8Vzi8OVPxF5KiHtnS/qK
 VyLqyqqPdzt+iyBpH0nnRL1ACQiAsDG3pklA3DetefnNSfOjl9Z2rEYMjVO36OHw6Xj+
 L8wmu49uii1/6Wxy3LJvtkKdauuYprP3QrP11Kb26KqeOdsXlZWXMMOGIvjZ5fZFPfRN
 xis46E1Tm3aOLqMEyJAmCbanXLcpKMEJ5djSKifC98KSHFMBecy2pqWaKH8pgpjNv1BA
 zzov7N1JC4F0vUMxuItmuzAn0AuSD164BdxQqMwcn4MyTDBNI9VCQeRw4QEg5PNS044c
 HjhA==
X-Gm-Message-State: AOAM532Z5dVQ3Ri+98AeWgp+dvmESyUgcNARlbrmhJOD6Lz9qovVFaSn
 N7M6P2iuNncVJ/QILZpbdZni5ajWUdDZQyug
X-Google-Smtp-Source: ABdhPJzS7fGPW7zV/46btlx5HzR4lM69Cy497r5dDhK+LXlmYBOAXkLv2jQKdDe+NgaXNNeZy95yNA==
X-Received: by 2002:a05:6402:378b:b0:42a:ad8c:628f with SMTP id
 et11-20020a056402378b00b0042aad8c628fmr7649768edb.90.1654206515708; 
 Thu, 02 Jun 2022 14:48:35 -0700 (PDT)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com.
 [209.85.128.48]) by smtp.gmail.com with ESMTPSA id
 c18-20020a056402101200b0042dc6e250e3sm2992688edu.81.2022.06.02.14.48.33
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jun 2022 14:48:33 -0700 (PDT)
Received: by mail-wm1-f48.google.com with SMTP id r129so3188838wmr.3
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 14:48:33 -0700 (PDT)
X-Received: by 2002:a05:600c:4f0c:b0:397:75d7:613 with SMTP id
 l12-20020a05600c4f0c00b0039775d70613mr35121379wmq.34.1654206512562; Thu, 02
 Jun 2022 14:48:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220601094637.1200634-1-hsinyi@chromium.org>
In-Reply-To: <20220601094637.1200634-1-hsinyi@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 2 Jun 2022 14:48:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W+5GAUBh_ZMPeKhqxQXxau2OKCbt3p2QmsDhROf207dA@mail.gmail.com>
Message-ID: <CAD=FV=W+5GAUBh_ZMPeKhqxQXxau2OKCbt3p2QmsDhROf207dA@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] Add a panel API to return panel orientation
To: Hsin-Yi Wang <hsinyi@chromium.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Hans de Goede <hdegoede@redhat.com>, Thierry Reding <thierry.reding@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Jun 1, 2022 at 2:46 AM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> Panels usually call drm_connector_set_panel_orientation(), which is
> later than drm/kms driver calling drm_dev_register(). This leads to a
> WARN()[1].
>
> The orientation property is known earlier. For example, some panels
> parse the property through device tree during probe.
>
> The series add a panel API drm_panel_get_orientation() for drm/kms
> drivers. The drivers can use the API to get panel's orientation, so they
> can call drm_connector_set_panel_orientation() before drm_dev_register().
>
> Panel needs to implement .get_orientation callback to return the property.
>
> [1] https://patchwork.kernel.org/project/linux-mediatek/patch/20220530081910.3947168-2-hsinyi@chromium.org/
>
> Hsin-Yi Wang (8):
>   drm/panel: Add an API drm_panel_get_orientation() to return panel
>     orientation
>   drm/panel: boe-tv101wum-nl6: Implement .get_orientation callback
>   drm/panel: panel-edp: Implement .get_orientation callback
>   drm/panel: lvds: Implement .get_orientation callback
>   drm/panel: panel-simple: Implement .get_orientation callback
>   drm/panel: ili9881c: Implement .get_orientation callback
>   drm/panel: elida-kd35t133: Implement .get_orientation callback
>   drm/mediatek: Config orientation property if panel provides it
>
>  drivers/gpu/drm/drm_panel.c                    |  8 ++++++++
>  drivers/gpu/drm/mediatek/mtk_dsi.c             | 10 ++++++++++
>  drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c |  8 ++++++++
>  drivers/gpu/drm/panel/panel-edp.c              |  8 ++++++++
>  drivers/gpu/drm/panel/panel-elida-kd35t133.c   |  8 ++++++++
>  drivers/gpu/drm/panel/panel-ilitek-ili9881c.c  |  8 ++++++++
>  drivers/gpu/drm/panel/panel-lvds.c             |  8 ++++++++
>  drivers/gpu/drm/panel/panel-simple.c           |  9 +++++++++
>  include/drm/drm_panel.h                        | 10 ++++++++++
>  9 files changed, 77 insertions(+)

Seems reasonable to me. I added a request to the panel-edp patch that
probably applies to all of the panel patches requesting a comment next
to the old calls in get_modes().

I assume that all but patch #8 ought to land through drm-misc. I'm
happy to help commit them once everyone is happy. If the Mediatek
maintainer(s) want to Ack patch #8 I can land that in drm-misc too. If
we want something fancier like an immutable branch you'll probably
have to get someone involved that's got a higher drm pay grade than
me. ;-)

-Doug
