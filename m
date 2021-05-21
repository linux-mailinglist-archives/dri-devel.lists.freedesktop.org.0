Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBEA38D1D4
	for <lists+dri-devel@lfdr.de>; Sat, 22 May 2021 01:08:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06A1A6F92A;
	Fri, 21 May 2021 23:07:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BD216F92A
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 23:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621638475;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t5x32sH9FTLo/rOte6ws3ixMoIaQGzFRrnYxt29GbYg=;
 b=YzKb5Gg0uRT8472LtqguuUeK6sZO5v9wGd3N0Jwv72+BHVYtX4hLX7APpT542krZBC8Lnz
 lhGji6j7vzBNBKaZswDf42zSbrHHALgYA0r8iU+GKuoR3CZmzCSLXuajODjLHuaTLpPEAV
 7lgKJ9NZN/nW72NEC6Sta0FIprOaqEE=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-HtAnuPMQMqWC4mAB6oXJDw-1; Fri, 21 May 2021 19:07:54 -0400
X-MC-Unique: HtAnuPMQMqWC4mAB6oXJDw-1
Received: by mail-qv1-f71.google.com with SMTP id
 bc3-20020ad456830000b02901f47dbd7ef6so8705770qvb.6
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 16:07:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=t5x32sH9FTLo/rOte6ws3ixMoIaQGzFRrnYxt29GbYg=;
 b=jfCPQUI+e8a5Xz12ppDU2kqBRgg2dH+axAIbZ3VcdZ7MtLAYo5/qr/I/6uvTOfMq/T
 mowr24hOyLnLJDA8LA8SRq18Pmlf8llPUG2qWBu20ByJf9EtKGVZE1kwXHH8WAA0rUpw
 9vetaF/LJkyRYe78w1wWIEt1TNPhqQtyMY/dFgKSVR/iefcvROV7XRHH0aZmc2G1NXsb
 y9tHLdr3N9ptxyuM+M2sW3tEXbxpnCsbFCwPJvc4cVcLDTVnsNiQQ71yS3+3/LoZdpAF
 o7GVHALirMaUTOkBcFkshYygn6r1bcsEiqkqWBdE73hBdqrw8kIZoWCc0koxcr7ig5WW
 45lg==
X-Gm-Message-State: AOAM530bTQmPE5I0ZvVeeBeuaWvyJfR/9OoiPjXUuVMf106++i6OsWjg
 O6dozwb5yMVq0We0RdoKZXoKQke7acGhliir3JNlzw0we+7ynUYOmscf/F0UuEI8RXrCKgWunxE
 kcdCy8Q2WI0ocHAWZM4GDVd6wq/Mr
X-Received: by 2002:a0c:e905:: with SMTP id a5mr16048361qvo.58.1621638473797; 
 Fri, 21 May 2021 16:07:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1csHPAR7pKPC24QGsef6tDvHmZuB4/hl7VbeRUaeK0SVoYasuR87do+h/FzKWRnoPB3KDLg==
X-Received: by 2002:a0c:e905:: with SMTP id a5mr16048317qvo.58.1621638473555; 
 Fri, 21 May 2021 16:07:53 -0700 (PDT)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id u2sm5841011qkk.75.2021.05.21.16.07.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 16:07:53 -0700 (PDT)
Message-ID: <2536404ca2ab0e7b785a104ec6b4efb48943a438.camel@redhat.com>
Subject: Re: [PATCH v7 00/10] drm: Fix EDID reading on ti-sn65dsi86 by
 introducing the DP AUX bus
From: Lyude Paul <lyude@redhat.com>
To: Douglas Anderson <dianders@chromium.org>, Andrzej Hajda
 <a.hajda@samsung.com>, Neil Armstrong <narmstrong@baylibre.com>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>, Sam Ravnborg
 <sam@ravnborg.org>
Date: Fri, 21 May 2021 19:07:51 -0400
In-Reply-To: <20210517200907.1459182-1-dianders@chromium.org>
References: <20210517200907.1459182-1-dianders@chromium.org>
Organization: Red Hat
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Reply-To: lyude@redhat.com
Cc: robdclark@chromium.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, Sandeep Panda <spanda@codeaurora.org>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Steev Klimaszewski <steev@kali.org>,
 Thierry Reding <treding@nvidia.com>, Robert Foss <robert.foss@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For patches 5, and 6:

Reviewed-by: Lyude Paul <lyude@redhat.com>

This week got really busy so I wasn't able to look at the rest of them, but next
week is going to be a lot less busy so I should be able to look at them then

On Mon, 2021-05-17 at 13:08 -0700, Douglas Anderson wrote:
> The primary goal of this series is to try to properly fix EDID reading
> for eDP panels using the ti-sn65dsi86 bridge.
> 
> Previously we had a patch that added EDID reading but it turned out
> not to work at bootup. This caused some extra churn at bootup as we
> tried (and failed) to read the EDID several times and also ended up
> forcing us to use the hardcoded mode at boot. With this patch series I
> believe EDID reading is reliable at boot now and we never use the
> hardcoded mode.
> 
> High level note: in this series the EDID reading is driven by the
> panel driver, not by the bridge chip driver. I believe this makes a
> reasonable amount of sense since the panel driver already _could_
> drive reading the EDID if provided with the DDC bus and in future
> planned work we'll want to give the panel driver the DDC bus (to make
> decisions based on EDID) and the AUX bus (to control the
> backlight). There are also planned patches from Laurent to make
> ti-sn65dsi86 able to drive full DP monitors. In that case the bridge
> chip will still be in charge of reading the EDID, but it's not hard to
> make this dynamic.
> 
> This series is the logical successor to the 3-part series containing
> the patch ("drm/bridge: ti-sn65dsi86: Properly get the EDID, but only
> if refclk") [1].
> 
> This patch was tested against drm-misc-next commit 60a6b73dd821
> ("drm/ingenic: Fix pixclock rate for 24-bit serial panels") on a
> sc7180-trogdor-lazor device.
> 
> At v7 now, this patch series grew a bit from v6 because it introduces
> the DP AUX bus.
> 
> Between v2 and v3, high-level view of changes:
> - stop doing the EDID caching in the core.
> 
> Between v3 and v4, high-level view of changes:
> - EDID reading is actually driven by the panel driver now. See above.
> - Lots of chicken-and-egg problems solved w/ sub-devices.
> 
> Between v4 and v5, high-level view of changes.
> - Some of the early patches landed, so dropped from series.
> - New pm_runtime_disable() fix (fixed a patch that already landed).
> - Added Bjorn's tags to most patches
> - Fixed problems when building as a module.
> - Reordered debugfs patch and fixed error handling there.
> - Dropped last patch. I'm not convinced it's safe w/out more work.
> 
> Between v5 and v6, high-level view of changes:
> - Added the patch ("drm/dp: Allow an early call to register DDC i2c
>   bus")
> - Many patches had been landed, so only a few "controversial" ones
>   left.
> 
> Between v6 and v7, high-level view of changes:
> - New AUX DP bus!
> 
> [1]
> https://lore.kernel.org/r/20210304155144.3.I60a7fb23ce4589006bc95c64ab8d15c74b876e68@changeid/
> 
> Changes in v7:
> - pm_runtime_dont_use_autosuspend() fix new for v7.
> - List hpd properties bindings patch new for v7.
> - ti-sn65dsi86: Add aux-bus child patch new for v7.
> - Patch introducing the DP AUX bus is new for v7.
> - Patch to allow panel-simple to be DP AUX EP new for v7.
> - Patch using the DP AUX for DDC new for v7.
> - Remove use of now-dropped drm_dp_aux_register_ddc() call.
> - Beefed up commit message in context of the DP AUX bus.
> - Set the proper sub-device "dev" pointer in the AUX structure.
> - Patch to support for DP AUX bus on ti-sn65dsi86 new for v7.
> - Adjusted commit message to talk about DP AUX bus.
> - Panel now under bridge chip instead of getting a link to ddc-i2c
> 
> Changes in v6:
> - Use new drm_dp_aux_register_ddc() calls.
> 
> Douglas Anderson (10):
>   drm/panel: panel-simple: Add missing pm_runtime_dont_use_autosuspend()
>     calls
>   dt-bindings: display: simple: List hpd properties in panel-simple
>   dt-bindings: drm/bridge: ti-sn65dsi86: Add aux-bus child
>   drm: Introduce the DP AUX bus
>   drm/panel: panel-simple: Allow panel-simple be a DP AUX endpoint
>     device
>   drm/panel: panel-simple: Stash DP AUX bus; allow using it for DDC
>   drm/bridge: ti-sn65dsi86: Promote the AUX channel to its own sub-dev
>   drm/bridge: ti-sn65dsi86: Add support for the DP AUX bus
>   drm/bridge: ti-sn65dsi86: Don't read EDID blob over DDC
>   arm64: dts: qcom: sc7180-trogdor: Move panel under the bridge chip
> 
>  .../bindings/display/bridge/ti,sn65dsi86.yaml |  22 +-
>  .../bindings/display/panel/panel-simple.yaml  |   2 +
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  |  30 +-
>  drivers/gpu/drm/Kconfig                       |   5 +
>  drivers/gpu/drm/Makefile                      |   2 +
>  drivers/gpu/drm/bridge/Kconfig                |   1 +
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c         | 111 ++++--
>  drivers/gpu/drm/drm_dp_aux_bus.c              | 322 ++++++++++++++++++
>  drivers/gpu/drm/panel/Kconfig                 |   1 +
>  drivers/gpu/drm/panel/panel-simple.c          |  66 +++-
>  include/drm/drm_dp_aux_bus.h                  |  57 ++++
>  11 files changed, 563 insertions(+), 56 deletions(-)
>  create mode 100644 drivers/gpu/drm/drm_dp_aux_bus.c
>  create mode 100644 include/drm/drm_dp_aux_bus.h
> 

-- 
Sincerely,
   Lyude Paul (she/her)
   Software Engineer at Red Hat
   
Note: I deal with a lot of emails and have a lot of bugs on my plate. If you've
asked me a question, are waiting for a review/merge on a patch, etc. and I
haven't responded in a while, please feel free to send me another email to check
on my status. I don't bite!

