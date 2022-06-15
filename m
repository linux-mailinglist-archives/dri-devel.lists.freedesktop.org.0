Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC00C54C150
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 07:50:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8212A10E321;
	Wed, 15 Jun 2022 05:50:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F9A710E121
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 05:50:31 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id z7so14486441edm.13
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 22:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e1Vf5ybmWHMCCare0qDg8SwPPoQD0QhbtYBYyxeUrq8=;
 b=Ag1aXw2jvTVA7zj000m0mm7g4v9LClriU8HKZSHDqkV7VWJ6TW0872btwmRL8YOhHv
 /h0UTPqYTWMypwvjlp7HFBfG74+NiYztO1x+sVfz4FEI6DuU4uxDrtoNMI9vIL7+pkLT
 KBJyXI31qr4bl59ihqAqPeS5UGX2uWtkyAwyw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e1Vf5ybmWHMCCare0qDg8SwPPoQD0QhbtYBYyxeUrq8=;
 b=4fDKeBh2TEZhkI9taSTvUyNmYHF9ZmlGh0liVltQadRrWe3UBdpgSlf3E3ZuAJo7NV
 TTPmTB5mlHDJ+/EAgdylIqMpTWlAW13vb29HFYfFqaUteGM7fR+KjsC25C8fczRL+H4K
 X6NQ4AzEr/3MzAjIO1H0VGJb1IE/urfHY23VT4+coR7NCWihovfxPV9uP7cPP3awFAtQ
 mWbG496sxonW1ZINCYA6+kEjMmPWrf8p8r5rciEPe33tYgZTV1ZBcxREW8KsyOPTOPlS
 o0ZwZ2Tf0WzjsZfqXe5YOXZS8GjkdK57RkrrrgS3dCiRNQGUQgqlfdiu6B0QpboxieHc
 iK4g==
X-Gm-Message-State: AOAM533pfYVKI7urjdMpB9I2UtAVpc7V0vkycdlWcgzVLhkZHy6e0O0J
 C4HCJnmdE0gcblGP2cfIcge5JET7+oVh4pbom1U0fw==
X-Google-Smtp-Source: AGRyM1vjB0FC5P09G+rt/YLiB6xz66BihK6l+v4rWnGykvM7armSUF85EPc5KFmSMQB81oPGgjsG4xLYDPyyYAO/lq8=
X-Received: by 2002:a05:6402:1941:b0:413:2b5f:9074 with SMTP id
 f1-20020a056402194100b004132b5f9074mr10516814edz.414.1655272229642; Tue, 14
 Jun 2022 22:50:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220609072722.3488207-1-hsinyi@chromium.org>
In-Reply-To: <20220609072722.3488207-1-hsinyi@chromium.org>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Wed, 15 Jun 2022 13:50:03 +0800
Message-ID: <CAJMQK-hg5kLUV=ZgVN5=qX=bRiBWx3O-4X9wPF6CwxpQVSuinA@mail.gmail.com>
Subject: Re: [PATCH v7 0/8] Add a panel API to set orientation properly
To: Hans de Goede <hdegoede@redhat.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Stephen Boyd <swboyd@chromium.org>, Douglas Anderson <dianders@chromium.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 9, 2022 at 3:27 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> Panels usually call drm_connector_set_panel_orientation(), which is
> later than drm/kms driver calling drm_dev_register(). This leads to a
> WARN()[1].
>
> The orientation property is known earlier. For example, some panels
> parse the property through device tree during probe.
>
> The series add a panel API drm_connector_set_orientation_from_panel()
> for drm/kms drivers. The drivers can call the API to set panel's
> orientation before drm_dev_register().
>
> Panel needs to implement .get_orientation callback to return the property.
>
> [1] https://patchwork.kernel.org/project/linux-mediatek/patch/20220530081910.3947168-2-hsinyi@chromium.org/
>
> Hsin-Yi Wang (8):
>   drm/panel: Add an API to allow drm to set orientation from panel
>   drm/panel: boe-tv101wum-nl6: Implement .get_orientation callback
>   drm/panel: panel-edp: Implement .get_orientation callback
>   drm/panel: lvds: Implement .get_orientation callback
>   drm/panel: panel-simple: Implement .get_orientation callback
>   drm/panel: ili9881c: Implement .get_orientation callback
>   drm/panel: elida-kd35t133: Implement .get_orientation callback
>   drm: Config orientation property if panel provides it
>
hi Maintainers,

All the patches are reviewed. If there's no other comments, will this
series be picked? Thanks.

>  drivers/gpu/drm/bridge/panel.c                | 34 +++++++++++++++++++
>  drivers/gpu/drm/drm_bridge_connector.c        |  8 ++++-
>  drivers/gpu/drm/drm_connector.c               | 31 +++++++++++++++++
>  .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 12 +++++++
>  drivers/gpu/drm/panel/panel-edp.c             | 13 ++++++-
>  drivers/gpu/drm/panel/panel-elida-kd35t133.c  | 12 +++++++
>  drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 12 +++++++
>  drivers/gpu/drm/panel/panel-lvds.c            | 13 +++++++
>  drivers/gpu/drm/panel/panel-simple.c          | 14 +++++++-
>  include/drm/drm_bridge.h                      | 14 ++++++++
>  include/drm/drm_connector.h                   |  4 +++
>  include/drm/drm_panel.h                       |  9 +++++
>  12 files changed, 173 insertions(+), 3 deletions(-)
>
> --
> 2.36.1.255.ge46751e96f-goog
>
