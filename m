Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3123362BB1
	for <lists+dri-devel@lfdr.de>; Sat, 17 Apr 2021 01:03:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58C3F6ED08;
	Fri, 16 Apr 2021 23:02:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 581246E135
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 23:02:58 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id t11so13439109qtr.8
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 16:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S2TYM+wdp6+vDu4GYyPIj8WsiphUkb2AvhRdqqeeoy0=;
 b=Jrf5W3Bx2YFA/wzMJQ4naBpogVfH2bAOaRDsvRP+wQCyW65LnEFXDogl9l/5ok/Y+d
 HKuhWhsbxsOZ3HbwY6lDvjJuo+jYbjpbbe/Bqt6o3yHBZPTrgvTmnqrZkXu7zDf4Ocx9
 AXFe6MfdwJicBmuEKIBtdvCrHkcK8pWB9JXJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S2TYM+wdp6+vDu4GYyPIj8WsiphUkb2AvhRdqqeeoy0=;
 b=uX68fsc/6GojpWC88BJVVyJWZYTDrpAvL/BHVB49oH86C7zl5mXrOj6SeUI6SN2/Gw
 O0SDKpNp/sTtkfZocccOeqe18GMS8SkOLfGh43d6wVJUX4rwePLC1ZiQMlzL0E1Tm5M/
 uTQOXMv2YgbpfUda4ZvK6VFILTwE5vNm7DeyiVwZOGegLB+nvbeR2QQbi4MsxLf9DOXx
 aqeX6hhNhXe61+4czw8nlsa3Ypd+SE8Dvf+W3n34cPWUHRQp4typkzj+YN+t10OFpW+J
 Wkw7jCSy8Q8tGxxXpX1G5JQHqcX/VMyvgjZyRR3dyLndRS0URvmHnvFOQ9JEp/lXgfzR
 KMQg==
X-Gm-Message-State: AOAM5332pGyqA1NSOYCBktygAR2kzdkByppApvspGatujnhBnrGvLBik
 Q79ocyyBunwtJ4e9LelXBdKUggfpOxVddw==
X-Google-Smtp-Source: ABdhPJxTd6ILdJ2gOobwZNauCu+eeIBSU9HNO1vpgBDY6JRctkN6BsR3Y5c3I+Lo2HDz9Y7PLrR9tg==
X-Received: by 2002:a05:622a:9:: with SMTP id x9mr1395364qtw.189.1618614175974; 
 Fri, 16 Apr 2021 16:02:55 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com.
 [209.85.219.175])
 by smtp.gmail.com with ESMTPSA id l24sm1013132qki.119.2021.04.16.16.02.54
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Apr 2021 16:02:55 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id p3so11194401ybk.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 16:02:54 -0700 (PDT)
X-Received: by 2002:a25:244d:: with SMTP id k74mr2023484ybk.79.1618614174530; 
 Fri, 16 Apr 2021 16:02:54 -0700 (PDT)
MIME-Version: 1.0
References: <1618418390-15055-1-git-send-email-rajeevny@codeaurora.org>
In-Reply-To: <1618418390-15055-1-git-send-email-rajeevny@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 16 Apr 2021 16:02:42 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WSjRhNk_VT9vXEpzO=7pKi3VJG+SB7wnZnKZjeD+UsZg@mail.gmail.com>
Message-ID: <CAD=FV=WSjRhNk_VT9vXEpzO=7pKi3VJG+SB7wnZnKZjeD+UsZg@mail.gmail.com>
Subject: Re: [v1 0/3] drm: Add support for backlight control of eDP panel on
 ti-sn65dsi86 bridge
To: Rajeev Nandan <rajeevny@codeaurora.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, mkrishn@codeaurora.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Sean Paul <seanpaul@chromium.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Apr 14, 2021 at 9:41 AM Rajeev Nandan <rajeevny@codeaurora.org> wrote:
>
> The backlight level of an eDP panel can be controlled through the AUX
> channel using DPCD registers of the panel.
>
> The capability for the Source device to adjust backlight characteristics
> within the panel, using the Sink device DPCD registers is indicated by
> the TCON_BACKLIGHT_ADJUSTMENT_CAPABLE bit in the EDP_GENERAL_CAPABILITY_1
> register (DPCD Address 701h, bit0). In this configuration, the eDP TCON
> receives the backlight level information from the host, through the AUX
> channel.
>
> The changes in this patch series do the following:
> - Add drm_dp_aux_backlight_ APIs to support backlight control using DPCD
>   registers on the DisplayPort AUX channel.
>   The current version only supports backlight brightness control by the
>   EDP_BACKLIGHT_BRIGHTNESS_MSB/LSB registers (DPCD Addresses 722h-723h).
> - Add support for backlight control of the eDP panel connected to the
>   ti-sn65dsi86 bridge.
>
> Rajeev Nandan (3):
>   drm/dp: Add DisplayPort aux backlight control support
>   dt-bindings: drm/bridge: ti-sn65dsi86: Document use-aux-backlight
>   drm/bridge: ti-sn65dsi86: Add DisplayPort aux backlight support
>
>  .../bindings/display/bridge/ti,sn65dsi86.yaml      |   8 +
>  drivers/gpu/drm/Kconfig                            |   8 +
>  drivers/gpu/drm/Makefile                           |   1 +
>  drivers/gpu/drm/bridge/Kconfig                     |   1 +
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c              |  26 +++
>  drivers/gpu/drm/drm_dp_aux_backlight.c             | 191 +++++++++++++++++++++
>  include/drm/drm_dp_aux_backlight.h                 |  29 ++++
>  7 files changed, 264 insertions(+)
>  create mode 100644 drivers/gpu/drm/drm_dp_aux_backlight.c
>  create mode 100644 include/drm/drm_dp_aux_backlight.h

So I haven't looked in massive detail at this patch series, but the
fact that it's touching "ti-sn65dsi86.c" is a red flag. I know in
out-of-band communications you said you weren't sure how to do better.
...but, perhaps, if folks don't hate my recent series [1] there may be
a way forward.

I wonder if perhaps now that the AUX channel can be registered early
if it gets around the circular dependency problems and now you can put
your code in some combination of the panel code and (maybe?) a new
backlight driver if it's generic enough.

It's possible that you might need to add some code to be able to look
up a "struct drm_dp_aux *" from a device tree node and you might need
to add a new device tree property like "ddc-aux-bus" in order to do
this, but I don't _think_ that would be controversial?

[1] https://lore.kernel.org/r/20210416223950.3586967-1-dianders@chromium.org

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
