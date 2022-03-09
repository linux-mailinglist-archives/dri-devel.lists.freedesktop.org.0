Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A234D3B75
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 21:56:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 860A410E386;
	Wed,  9 Mar 2022 20:56:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5723E10E3F4
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 20:56:15 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id g20so4447084edw.6
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Mar 2022 12:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DfY+Mxn7NkrB5fGdyvJbTh9f17PHMGqPxvl1oolx27I=;
 b=YMM12oofeP4ZisQc0o+00fngPoa67Wunfv87yQhMrELImGrxMcggFfqVweYBVhKRMr
 Mnl06j/k3qCyTUI6y2d7WnZ2PyosLmB/unuVm3yoUMgvFJdOY3/Y4SQaoenp5/l9xQ/N
 NWy5YJh/3RmmlA2XNHI8wotSIPZ9le79KIVXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DfY+Mxn7NkrB5fGdyvJbTh9f17PHMGqPxvl1oolx27I=;
 b=4YCDJceD0h4DML0sMmyWL10Q3/xWG+oK0kdtycMhSdhSRUIPLLbzawrCpUmMOYiZZy
 Y4WgquZXvuij16/Gon17aqO3kJbEHVKtVXEO8rOHBAGzt91GSxmXACqXQNtYiPKcViKZ
 JkmyEnbLG89qLvi6AdgkP+0So3Xv8ffH0NSh1FrZhqCokD2iJOs1y33aIIV68EHoYb6h
 qT5mx19Xy5hJ+R2y0PCZmtoI2guty/0aVjEp+bh/xst3/K+sqpRlA4cvipkJAroyj6Mv
 s2K2i2/DBY7Tra5y2DnDoANhdjG1hvR2iDuyOQRGIfI+ym651dXRGvhXcVChxNwMB/bS
 XaIA==
X-Gm-Message-State: AOAM533sg/QhKZc9Slby/OATysAA9Idb/8rBElQlvxaz0z23UiCxy38R
 2HXWjo8foxs7k2xVFCQJzO9ESnOqk1keGRib
X-Google-Smtp-Source: ABdhPJwqiZwNF1qihHMKciuZ0IHN5mk0fLtARwsyTBzXfGj+LBNJgiZSgswMVuXvqCs4/G7uzXw+Fw==
X-Received: by 2002:a50:bf0f:0:b0:410:c512:cb6f with SMTP id
 f15-20020a50bf0f000000b00410c512cb6fmr1337032edk.262.1646859373411; 
 Wed, 09 Mar 2022 12:56:13 -0800 (PST)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com.
 [209.85.221.54]) by smtp.gmail.com with ESMTPSA id
 u3-20020a17090657c300b006d01de78926sm1138063ejr.22.2022.03.09.12.56.12
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 12:56:12 -0800 (PST)
Received: by mail-wr1-f54.google.com with SMTP id i8so4907163wrr.8
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Mar 2022 12:56:12 -0800 (PST)
X-Received: by 2002:a5d:490f:0:b0:1f0:6791:a215 with SMTP id
 x15-20020a5d490f000000b001f06791a215mr1122625wrq.422.1646859371913; Wed, 09
 Mar 2022 12:56:11 -0800 (PST)
MIME-Version: 1.0
References: <20220307175955.363057-1-kieran.bingham+renesas@ideasonboard.com>
 <20220307175955.363057-4-kieran.bingham+renesas@ideasonboard.com>
 <CAD=FV=X=KuONU5NeFQvjTVix86CzyA2c6HWbg1HoqgS3TTy6Rg@mail.gmail.com>
 <164684549417.11309.167290259626544349@Monstersaurus>
In-Reply-To: <164684549417.11309.167290259626544349@Monstersaurus>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 9 Mar 2022 12:55:59 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WyiUijqjvRpw-9ZMvKGdPJJO3UozsX=ROSzzeRQ1bozQ@mail.gmail.com>
Message-ID: <CAD=FV=WyiUijqjvRpw-9ZMvKGdPJJO3UozsX=ROSzzeRQ1bozQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] drm/bridge: ti-sn65dsi86: Support DisplayPort
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Mar 9, 2022 at 9:05 AM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
>
> >> I think it was done for DRM purpose, to prevent signals meant for a
> >> panel to be connected to a device that could capture video from a DP
> >> source.
>
> Is this better:
>
>         /*
>          * Only eDP pannels which support Alternate Scrambler Seed Reset (ASSR)

s/pannels/panels

>          * are supported by the SN65DSI86. For DisplayPort, disable scrambling
>          * mode.
>          */
>
> I don't know if it answers your 'why' ... and I don't think adding
>  "We think it is for DRM protection"
>
> really suits the comment.

Yeah, that looks pretty good. ...or even:

eDP panels use an Alternate Scrambler Seed compared to displays hooked
up via a full DisplayPort connector. SN65DSI86 only supports the
alternate scrambler seed, not the normal one, so the only way we can
support full DisplayPort displays is by fully turning off the
scrambler.


-Doug
