Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A480F4B7B39
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 00:31:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7193210E5D1;
	Tue, 15 Feb 2022 23:31:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F0CE10E5C4
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 23:31:17 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id c14so218640ilm.4
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 15:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FCIgbleOoUZIo/u1NuclidM+6drC/fEPlkw9hx4YYSU=;
 b=GvKO9px9ieVv+SBaUWQl5Z5hBvQQJMAyCOyiS2JwDx+XKQQp/2UHuEPMHl1XMEw3t+
 jKQ/oSGEmyO8oPK4kXtaurAkGPbCXzS3axB1+4CyvMemDPEA4rS55bMksJsn+0sTuPCr
 K5h95ZHFNwqWo5hnqkFP3eH75IYW2unez2DNo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FCIgbleOoUZIo/u1NuclidM+6drC/fEPlkw9hx4YYSU=;
 b=4Uppo9p7MyyRM6VxO8tN7MANNEBw8mlRP2xp6s6Wibq73k93ZzaG86aVeZsH0XzDtX
 vQkEEgpRaXF/8DVBJvjPGJsfaS5oygc8667kkG0tMeURf8o2keu/eTXjEH9ytzzIu5lT
 mNxGsa98R1xRB2MtBIVpEHFQcKElo/Sta782i944Xk93vydizS9emkHuY3jxjnFsX8cZ
 GPkH27pZzYG3AuJIUawLt1Z6OcryDYVsOl9JQqDzXbePekFCZ7wznrCY6ZIvALcEUEGl
 R2jj8ImwY0C3Ck8OezIYCscyxEDX94jQcdDZCECFnFiuqY39nWFH6+JokmCAnAQtmMsq
 L6Ig==
X-Gm-Message-State: AOAM530ep766MeVMv1ZFIoIuFmNsOPNfTYx4cPi9oDowAtX1vUyRcaQx
 ljdU9JA9e9JRyiLymzuCGVsyMX+yuyknAQ==
X-Google-Smtp-Source: ABdhPJyfU+l/ylYHuqsGbzlPcac3/nI1pGpI1R6sDhybKw7sjjWwH25HXgVBXSGIJSxj8GfMeMT6Gw==
X-Received: by 2002:a92:c54b:0:b0:2be:3a0e:eb9e with SMTP id
 a11-20020a92c54b000000b002be3a0eeb9emr30134ilj.235.1644967876377; 
 Tue, 15 Feb 2022 15:31:16 -0800 (PST)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com.
 [209.85.166.42])
 by smtp.gmail.com with ESMTPSA id a15sm10876987ilj.21.2022.02.15.15.31.13
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Feb 2022 15:31:14 -0800 (PST)
Received: by mail-io1-f42.google.com with SMTP id q8so376452iod.2
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 15:31:13 -0800 (PST)
X-Received: by 2002:a05:6602:15c6:b0:611:591d:1d9a with SMTP id
 f6-20020a05660215c600b00611591d1d9amr84044iow.177.1644967873090; Tue, 15 Feb
 2022 15:31:13 -0800 (PST)
MIME-Version: 1.0
References: <20220205001342.3155839-1-dianders@chromium.org>
In-Reply-To: <20220205001342.3155839-1-dianders@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 15 Feb 2022 15:31:01 -0800
X-Gmail-Original-Message-ID: <CAD=FV=ULWobi5rDbZajiyPvd1TtLQg-x6EqTNgs2pWiGBUjPRg@mail.gmail.com>
Message-ID: <CAD=FV=ULWobi5rDbZajiyPvd1TtLQg-x6EqTNgs2pWiGBUjPRg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] drm/panel-edp: Debugfs for panel-edp
To: dri-devel <dri-devel@lists.freedesktop.org>
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Robert Foss <robert.foss@linaro.org>, LKML <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, jjsu@chromium.org,
 lschyi@chromium.org, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Feb 4, 2022 at 4:14 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> The main goal of this series is the final patch in the series: to
> allow test code to reliably find out if we ended up hitting the
> "fallback" case of the generic edp-panel driver where we don't
> recognize a panel and choose to use super conservative timing.
>
> Version 1 of the patch actually landed but was quickly reverted since
> it was pointed out that it should have been done in debugfs, not
> sysfs.
>
> As discussed on IRC [1], we want this support to be under the
> "connector" directory of debugfs but there was no existing way to do
> that. Thus patch #2 in the series was born to try to plumb this
> through. It was asserted that it would be OK to rely on a fairly
> modern display pipeline for this plumbing and perhaps fail to populate
> the debugfs file if we're using older/deprecated pipelines.
>
> Patch #1 in the series was born because the bridge chip I was using
> was still using an older/deprecated pipeline. While this doesn't get
> us fully to a modern pipeline for ti-sn65dsi86 (it still doesn't move
> to "NO_CONNECTOR") it hopefully moves us in the right direction.
>
> This was tested on sc7180-trogdor devices with _both_ the ti-sn65dsi86
> and the parade-ps8640 bridge chips (since some devices have one, some
> the other). The parade-ps8640 already uses supports "NO_CONNECTOR",
> luckily.
>
> [1] https://people.freedesktop.org/~cbrill/dri-log/?channel=dri-devel&date=2022-02-02
>
> Changes in v2:
> - ("ti-sn65dsi86: Use drm_bridge_connector") new for v2.
> - ("drm: Plumb debugfs_init through to panels") new for v2.
> - Now using debugfs, not sysfs
>
> Douglas Anderson (3):
>   drm/bridge: ti-sn65dsi86: Use drm_bridge_connector
>   drm: Plumb debugfs_init through to panels
>   drm/panel-edp: Allow querying the detected panel via debugfs
>
>  drivers/gpu/drm/bridge/panel.c         | 12 +++++
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c  | 72 +++++---------------------
>  drivers/gpu/drm/drm_bridge_connector.c | 15 ++++++
>  drivers/gpu/drm/drm_debugfs.c          |  3 ++
>  drivers/gpu/drm/panel/panel-edp.c      | 37 +++++++++++--
>  include/drm/drm_bridge.h               |  7 +++
>  include/drm/drm_connector.h            |  7 +++
>  include/drm/drm_panel.h                |  8 +++
>  8 files changed, 98 insertions(+), 63 deletions(-)

Landed these three patches to drm-misc-next w/ accumulated tags:

$ git log --oneline -3
6ed19359d6bd drm/panel-edp: Allow querying the detected panel via debugfs
2509969a9862 drm: Plumb debugfs_init through to panels
e283820cbf80 drm/bridge: ti-sn65dsi86: Use drm_bridge_connector

If it turns out that we want to add more reporting when debugfs calls
return errors then I'm happy to submit follow-on patches. Discussion
about that can be found in:

https://lore.kernel.org/r/CAD=FV=Ut3N9syXbN7i939mNsx3h7-u9cU9j6=XFkz9vrh0Vseg@mail.gmail.com

Unless something changes, though, my current plan is not to do
follow-up patches and leave this as-is without any extra error
reporting.

-Doug
