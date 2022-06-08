Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E143F54324E
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 16:17:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9884D1125BB;
	Wed,  8 Jun 2022 14:17:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 624F01125AB
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 14:17:07 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id z7so27269069edm.13
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 07:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ti6IeHQCkW2VZvsUlMpmfFeGTqLu7AoUIKp3i+tZpfU=;
 b=iNJSJJdZJoaqK2qzj3sUCTe0mKNihcp3o9hP2pFFod/rUsNYwQ/w/do3amq6b5sAq+
 dol1KCe5NlSkaIKIsCKaF5yh7Nhkczu+8d4VRNEik1NsTIo9BN8nXbYwGnnw/83+hR8P
 /3EbeWILvG+CLjIYq1VN0UPXcf77NKvjVgVHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ti6IeHQCkW2VZvsUlMpmfFeGTqLu7AoUIKp3i+tZpfU=;
 b=gysxKYoZXPjNe2M9wieZ/yfQfXv4nuhs0wM3rf3oHODpftoee35BQwJH5q8OwFM3Fq
 eK2cfX4yFB/ksXEd1to6Gil2SeJancP1vGNh/b38vD0fKiHzzBxnY5Y3WMM6c98bxhKn
 XjXswFjOsamdAE8mQ1pLim2RHp+oNfJxVKhBIoKTJNLXyzaXUV5B7H4p1eQKOMM9uH3F
 8FFzu9qPBsElqxdulIAqaObRj9xVQmwND2ikBCfTFGN35t2TPLunHM3cSfnIVOtXVhO8
 igGJyPB5Xs0ZjdVFL1vkFCXYEQxoe5N9AZr4aWnd/9BqXHpSeB0P2DsT2Uzq3/nJW0Pe
 NgMw==
X-Gm-Message-State: AOAM531xSny8t/qpeQaIcvFSmk9QIaY3jEk7/P1DBYd0/ZeqY0Rtz73o
 NuBqVp0V6vhmGhOB0k7mUpgWWgikSvh9lya/2eI=
X-Google-Smtp-Source: ABdhPJwtnw9bMBGQiKK42bqG6iB34B3t/I+Bw1hOZ3IJiiw0mdLXAe/wQR3BpqxE7OBlDGndwsup7A==
X-Received: by 2002:a05:6402:428b:b0:430:7c04:95c9 with SMTP id
 g11-20020a056402428b00b004307c0495c9mr26632503edc.155.1654697825984; 
 Wed, 08 Jun 2022 07:17:05 -0700 (PDT)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com.
 [209.85.128.44]) by smtp.gmail.com with ESMTPSA id
 f24-20020a05640214d800b0042617ba63basm12390380edx.68.2022.06.08.07.17.05
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jun 2022 07:17:05 -0700 (PDT)
Received: by mail-wm1-f44.google.com with SMTP id
 67-20020a1c1946000000b00397382b44f4so11179592wmz.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 07:17:05 -0700 (PDT)
X-Received: by 2002:a05:600c:591:b0:39c:4544:b814 with SMTP id
 o17-20020a05600c059100b0039c4544b814mr24306287wmd.118.1654697824712; Wed, 08
 Jun 2022 07:17:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220608094816.2898692-1-hsinyi@chromium.org>
 <20220608094816.2898692-9-hsinyi@chromium.org>
In-Reply-To: <20220608094816.2898692-9-hsinyi@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 8 Jun 2022 07:16:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VShXpy+6ESXGKhw5Z9o3hfXNV2_HvdOAPM3YN2qSA9Sg@mail.gmail.com>
Message-ID: <CAD=FV=VShXpy+6ESXGKhw5Z9o3hfXNV2_HvdOAPM3YN2qSA9Sg@mail.gmail.com>
Subject: Re: [PATCH v6 8/8] drm: Config orientation property if panel provides
 it
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Hans de Goede <hdegoede@redhat.com>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Jun 8, 2022 at 2:48 AM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> @@ -269,6 +280,31 @@ void drm_panel_bridge_remove(struct drm_bridge *bridge)
>  }
>  EXPORT_SYMBOL(drm_panel_bridge_remove);
>
> +/**
> + * drm_panel_bridge_set_orientation - Set the connector's panel orientation
> + * if the bridge is a panel bridge.
> + *
> + * @connector: The connector to be set panel orientation.
> + * @bridge: The drm_bridge to be transformed to panel bridge.

Ideally you should have a kernel doc to describe what you're returning.


> + */
> +int drm_panel_bridge_set_orientation(struct drm_connector *connector,
> +                                    struct drm_bridge *bridge)
> +{
> +       struct panel_bridge *panel_bridge;
> +
> +       if (!bridge)
> +               return 0;
> +
> +       if (bridge->funcs != &panel_bridge_bridge_funcs)
> +               return 0;

nit: Why do you need to handle NULL bridge and the case that someone
calls you with something other than a panel-bridge? I'm not convinced
that's useful. In general kernel style doesn't do massive validation
of parameters unless there's a reason for it. ...if we do need to
handle them then it feels like they should be returning -EINVAL or
something, not 0.


> @@ -917,10 +917,13 @@ void drm_bridge_hpd_notify(struct drm_bridge *bridge,
>                            enum drm_connector_status status);
>
>  #ifdef CONFIG_DRM_PANEL_BRIDGE
> +bool drm_bridge_is_panel(const struct drm_bridge *bridge);
>  struct drm_bridge *drm_panel_bridge_add(struct drm_panel *panel);
>  struct drm_bridge *drm_panel_bridge_add_typed(struct drm_panel *panel,
>                                               u32 connector_type);
>  void drm_panel_bridge_remove(struct drm_bridge *bridge);
> +int drm_panel_bridge_set_orientation(struct drm_connector *connector,
> +                                     struct drm_bridge *bridge);

I suspect that you need some dummy versions of your new functions
defined if "CONFIG_DRM_PANEL_BRIDGE" is not defined. Otherwise we're
going to be yelled at by the kernel robot eventually.

-Doug
