Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 047734B912C
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 20:29:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AF4210E2F9;
	Wed, 16 Feb 2022 19:29:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C3E210E2F9
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 19:29:36 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id d10so1531222eje.10
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 11:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AI8joxrk1YyY98A4abN1SonGW2lvV7xnuRU9NFCob50=;
 b=OMOMVpSoOJQ54fMEuRukmDdSLLKh6/vsEUaz/TTeA/q0kDcXGMcglN/JS5LBzCX8Lv
 lmpYnb6FTlqbP97L5MeOKH4seXrJJZvQxfiDHYkIdrjRBTduDl/H35RJX8e4JhKcb22j
 8u0V3hJ4O23K2ze9bvRjq6uL7yKhYRpsOymjM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AI8joxrk1YyY98A4abN1SonGW2lvV7xnuRU9NFCob50=;
 b=g5dLt0LDfEGmO53DJtK93J4UXdn56ixVPQOdaXmoPZyPI+7MINd3vx+4OT+evUGSAZ
 NKpN9IVkdwGBiA9lCJL6Wy9nTUJDrD+P1BvdG6ZIUXotPXE84cbCSD6u8TXIWbDAfIqu
 BwNxnRlaa1INExeOq41Ws4cNoLPhgTQyDLA+FfzSKiwMT8kEZNfm5QfTt3AajcUKIUZB
 HmuYfX4qkkdZ0WCLaNCEiR54mlM09b0Xsqp7TLM09ZX8BFfzAn/y+M1dQcQ8iINeMkzY
 6x+e09c7MQ1PtvzgWv54oFzCcE4k5dZqrVTj5CkvUwzZI8zz3/GEm4xjYwvBOHZoTk7j
 zX+g==
X-Gm-Message-State: AOAM532hHEl2ESzNshRrXZJzNR7UPqL8LaBmsVkWBA/XqCYsW096GVDx
 RRRCt5/4SHjD4n3jTk+Vl+3364VDNpBVjYy06L4=
X-Google-Smtp-Source: ABdhPJxjAavxzz00tMGC6QaJ3NNUcBc7NG04yxMnC+u+VeSFWa0qhFkDD71S41B8e+1fOk8tipYBlA==
X-Received: by 2002:a17:906:27c3:b0:6b9:9ce:9276 with SMTP id
 k3-20020a17090627c300b006b909ce9276mr3446398ejc.525.1645039774933; 
 Wed, 16 Feb 2022 11:29:34 -0800 (PST)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com.
 [209.85.128.42])
 by smtp.gmail.com with ESMTPSA id o20sm2203436edc.84.2022.02.16.11.29.34
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 11:29:34 -0800 (PST)
Received: by mail-wm1-f42.google.com with SMTP id
 l123-20020a1c2581000000b0037b9d960079so4527480wml.0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 11:29:34 -0800 (PST)
X-Received: by 2002:a05:600c:228e:b0:37c:2eef:7bf with SMTP id
 14-20020a05600c228e00b0037c2eef07bfmr2876839wmf.73.1645039773639; Wed, 16 Feb
 2022 11:29:33 -0800 (PST)
MIME-Version: 1.0
References: <1644494255-6632-1-git-send-email-quic_sbillaka@quicinc.com>
 <1644494255-6632-5-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1644494255-6632-5-git-send-email-quic_sbillaka@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 16 Feb 2022 11:29:21 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V9vXbvuU5oK6maXKAfzEPzT2Fp5Vf3CUqpJvmM+wrjeg@mail.gmail.com>
Message-ID: <CAD=FV=V9vXbvuU5oK6maXKAfzEPzT2Fp5Vf3CUqpJvmM+wrjeg@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] drm/panel-edp: Add eDP sharp panel support
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
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
Cc: quic_kalyant@quicinc.com,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 quic_khsieh@quicinc.com, quic_vproddut@quicinc.com,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, quic_abhinavk@quicinc.com,
 Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Sean Paul <seanpaul@chromium.org>, Thierry Reding <thierry.reding@gmail.com>,
 Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>, quic_mkrishn@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Feb 10, 2022 at 3:58 AM Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> Add support for the 14" sharp,lq140m1jw46 eDP panel.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---
> 00 ff ff ff ff ff ff 00 4d 10 23 15 00 00 00 00
> 35 1e 01 04 a5 1f 11 78 07 de 50 a3 54 4c 99 26
> 0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 5a 87 80 a0 70 38 4d 40 30 20
> 35 00 35 ae 10 00 00 18 65 38 80 a0 70 38 4d 40
> 30 20 35 00 35 ae 10 00 00 18 00 00 00 fd 00 30
> 90 a7 a7 23 01 00 00 00 00 00 00 00 00 00 00 fc
> 00 4c 51 31 34 30 4d 31 4a 57 34 39 0a 20 00 77
>
> ----------------
>
> Block 0, Base EDID:
>   EDID Structure Version & Revision: 1.4
>   Vendor & Product Identification:
>     Manufacturer: SHP
>     Model: 5411
>     Made in: week 53 of 2020
>   Basic Display Parameters & Features:
>     Digital display
>     Bits per primary color channel: 8
>     DisplayPort interface
>     Maximum image size: 31 cm x 17 cm
>     Gamma: 2.20
>     Supported color formats: RGB 4:4:4
>     Default (sRGB) color space is primary color space
>     First detailed timing includes the native pixel format and preferred refresh rate
>     Display is continuous frequency
>   Color Characteristics:
>     Red  : 0.6396, 0.3291
>     Green: 0.2998, 0.5996
>     Blue : 0.1494, 0.0595
>     White: 0.3125, 0.3281
>   Established Timings I & II: none
>   Standard Timings: none
>   Detailed Timing Descriptors:
>     DTD 1:  1920x1080  143.981 Hz  16:9   166.587 kHz  346.500 MHz (309 mm x 174 mm)
>                  Hfront   48 Hsync  32 Hback  80 Hpol N
>                  Vfront    3 Vsync   5 Vback  69 Vpol N
>     DTD 2:  1920x1080   59.990 Hz  16:9    69.409 kHz  144.370 MHz (309 mm x 174 mm)
>                  Hfront   48 Hsync  32 Hback  80 Hpol N
>                  Vfront    3 Vsync   5 Vback  69 Vpol N
>   Display Range Limits:
>     Monitor ranges (Bare Limits): 48-144 Hz V, 167-167 kHz H, max dotclock 350 MHz
>     Display Product Name: 'LQ140M1JW49'
> Checksum: 0x77
>
> Changes in v4:
>   -Add all modes from EDID
>   -Provide EDID blob
>
> Changes in v3:
>   None
>
>  drivers/gpu/drm/panel/panel-edp.c | 44 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)

We want to be moving to the generic edp-panel but even if we move to
edp-panel there's no harm in supporting things the old way, especially
as people are transitioning.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
