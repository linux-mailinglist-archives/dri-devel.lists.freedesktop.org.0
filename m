Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AB44D5515
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 00:10:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFDB110E1E7;
	Thu, 10 Mar 2022 23:10:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7152010E1E7
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 23:10:51 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id c20so8872095edr.8
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 15:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rlIR4SYrDHWvWgYAtu+J3wURm7Ipv3I/6B8kSrbq2OQ=;
 b=bnA6CRJ2glIWfPlZurqkST+p1m84ot07sH8B7u7nQt41FHNRxKdcB9v/3KwAfTtrTe
 Z/wwid20/a7jSY4S0NjlyFhk4vO1sheV/Pq4+oqC5EElTSI3cH9CaCnz671N7XutTnU/
 Za3slb/6KLXSCm7mJtfoyWY3LDE2pXA2YtELs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rlIR4SYrDHWvWgYAtu+J3wURm7Ipv3I/6B8kSrbq2OQ=;
 b=6ou6bvgfF7LXsmZK6WsEI9rvKvQWAZOrKMkl2jHnVttiB63IkBJNNPmtswO8NVOxWM
 wErjBGAW725Yat51JYh4mAET4hxGhyztlS0PeOMe4IZXJOqYD/TQt6pzS1XlfrkvyoTG
 wZMeFWJMjJk4kPMWvJp8XCGLS7ORkjIo8rcfjOD/anO4y1ai3P5PdppQ+bi/ne0DVYPX
 YnCPwPoJBVxr4d+/f9znx0L7ycuELAycvSUxLSvchf+vsmWMMUKU65kNbIT5PYzWMgps
 Vr66eGWoS3RpsuTid7cnspnQJOceOrm/Bjq4CAwcL1jQVLd4KGzMQWX3FHAJ6LiPTzea
 OWAA==
X-Gm-Message-State: AOAM532CZ2vfkt7Fg923gKApY7KoM6XFpUiaVrrO8ZewL4FiQt5xqImF
 pyWVHaWY8gmvGAMlLT7aZXVvnxNz8hW/P2Lw
X-Google-Smtp-Source: ABdhPJzfgf/SI4fw02GEutRKZiOK91UbhOWqRHVatirx7+bOkNjXOwHGAT9blLNRu4KEXm3fsxbdRQ==
X-Received: by 2002:aa7:dbd6:0:b0:408:4a31:97a5 with SMTP id
 v22-20020aa7dbd6000000b004084a3197a5mr6705107edt.186.1646953849671; 
 Thu, 10 Mar 2022 15:10:49 -0800 (PST)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com.
 [209.85.221.47]) by smtp.gmail.com with ESMTPSA id
 da19-20020a056402177300b00413583e0996sm2525926edb.14.2022.03.10.15.10.47
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 15:10:48 -0800 (PST)
Received: by mail-wr1-f47.google.com with SMTP id j17so10488347wrc.0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 15:10:47 -0800 (PST)
X-Received: by 2002:adf:eb45:0:b0:1ef:6070:7641 with SMTP id
 u5-20020adfeb45000000b001ef60707641mr5371549wrn.301.1646953847020; Thu, 10
 Mar 2022 15:10:47 -0800 (PST)
MIME-Version: 1.0
References: <20220310152227.2122960-1-kieran.bingham+renesas@ideasonboard.com>
 <20220310152227.2122960-2-kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <20220310152227.2122960-2-kieran.bingham+renesas@ideasonboard.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 10 Mar 2022 15:10:34 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XU5VGdKZ77UNb14Ah=LYKvSqbtBpzobMJYyMNDOXH2qg@mail.gmail.com>
Message-ID: <CAD=FV=XU5VGdKZ77UNb14Ah=LYKvSqbtBpzobMJYyMNDOXH2qg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] drm/bridge: ti-sn65dsi86: Support DisplayPort
 (non-eDP) mode
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
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
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Mar 10, 2022 at 7:22 AM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
>
> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> Despite the SN65DSI86 being an eDP bridge, on some systems its output is
> routed to a DisplayPort connector. Enable DisplayPort mode when the next
> component in the display pipeline is detected as a DisplayPort
> connector, and disable eDP features in that case.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reworked to set bridge type based on the next bridge/connector.
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> --
> Changes since v1/RFC:
>  - Rebased on top of "drm/bridge: ti-sn65dsi86: switch to
>    devm_drm_of_get_bridge"
>  - eDP/DP mode determined from the next bridge connector type.
>
> Changes since v2:
>  - Remove setting of Standard DP Scrambler Seed. (It's read-only).
>  - Prevent setting DP_EDP_CONFIGURATION_SET in
>    ti_sn_bridge_atomic_enable()
>  - Use Doug's suggested text for disabling ASSR on DP mode.
>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 23 ++++++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index c892ecba91c7..93b54fcba8ba 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -62,6 +62,7 @@
>  #define SN_LN_ASSIGN_REG                       0x59
>  #define  LN_ASSIGN_WIDTH                       2
>  #define SN_ENH_FRAME_REG                       0x5A
> +#define  ASSR_CONTROL                          BIT(0)

nit that the ASSR_CONTROL define is no longer used.

Other than that, this patch looks fine to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
