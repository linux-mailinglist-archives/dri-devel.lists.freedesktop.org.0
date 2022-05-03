Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 415DC51924D
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 01:26:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01E3410FFF9;
	Tue,  3 May 2022 23:26:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FD2110FFF9
 for <dri-devel@lists.freedesktop.org>; Tue,  3 May 2022 23:26:46 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id kq17so36184156ejb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 03 May 2022 16:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gmRfPAr6JZvSMMEYps49l7OQt2BG72EiV04cQ5yBwG8=;
 b=Qp6K9wf6dlpNyoy939Dn6hh5itEXUXpYYLAyjFahUWzal31jv7FTaHbho8tYaKYLZj
 cODleYspomtiXLDJM25z+o9AzVGfXqevKn2foOvcnS1mn5lJVk9Xhebs8kWBJP1FmBc0
 kOJP9tqSPF9DOLEoXKPHYw2BfTgwksMKucSwk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gmRfPAr6JZvSMMEYps49l7OQt2BG72EiV04cQ5yBwG8=;
 b=o0UETs2kOtldu6q2hvJtcfw9YqjHWl4R5btDOzrdAPwvT5QOI2UkWWuXxjR+pykfdy
 D321p9YDl/q20t72OMMLTEJRbFWjO4J5nnf4zTbN6fGHjKCU/t7hFTX9dw9Q06+lpVV+
 Z49dI/8A4ktE+tVQfTOJEXAnhnEyCtIZgkuo/ttmXfi3EY5ceQmlXn3Bw708Ykive6BB
 4N03p++bu9Zu+ihvoZy+ooEHhNO14bfVdMtAl31tltcQJGXszHVGK6V498Ts7y3Ef7iq
 2ymTDzemWaRzarGHaAKb6STxb6CetmjEABXiZNQj7dlHXssYKZQ5lcWnhwiQcon1i0/u
 RIqg==
X-Gm-Message-State: AOAM533XOzJDFuMnrqrkWNhPYm0CbjQrLHbp3je+oEhJ/+12dOwVG5Wu
 WTj878hN29D4zbB/dnYD1S97yL/+Lzw/lJQJ
X-Google-Smtp-Source: ABdhPJz+D505InwElAWjj2gyzy5TmFCjFUSc076tmiDzl8nn/OxZLPwOHIB9z3Vb7+w4hPmQ6ZR6tw==
X-Received: by 2002:a17:907:968d:b0:6f4:9f9e:3e5f with SMTP id
 hd13-20020a170907968d00b006f49f9e3e5fmr3892445ejc.540.1651620404720; 
 Tue, 03 May 2022 16:26:44 -0700 (PDT)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com.
 [209.85.128.41]) by smtp.gmail.com with ESMTPSA id
 e16-20020a50fb90000000b0042617ba63d7sm8324090edq.97.2022.05.03.16.26.42
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 16:26:42 -0700 (PDT)
Received: by mail-wm1-f41.google.com with SMTP id p189so10679909wmp.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 May 2022 16:26:42 -0700 (PDT)
X-Received: by 2002:a7b:c4c8:0:b0:394:26c5:b79e with SMTP id
 g8-20020a7bc4c8000000b0039426c5b79emr5256168wmk.15.1651620401765; Tue, 03 May
 2022 16:26:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220418171757.2282651-1-dianders@chromium.org>
In-Reply-To: <20220418171757.2282651-1-dianders@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 3 May 2022 16:26:29 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XBwkSSKHd+EorS54gEtiqpZLbCmmoXW3X7duFvo77Bog@mail.gmail.com>
Message-ID: <CAD=FV=XBwkSSKHd+EorS54gEtiqpZLbCmmoXW3X7duFvo77Bog@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] drm/dp: Introduce wait_hpd_asserted() for the DP
 AUX bus
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Philip Chen <philipchen@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maxime Ripard <maxime@cerno.tech>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Robert Foss <robert.foss@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 Jani Nikula <jani.nikula@intel.com>, Thierry Reding <thierry.reding@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Kees Cook <keescook@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Apr 18, 2022 at 10:18 AM Douglas Anderson <dianders@chromium.org> wrote:
>
> This is the 2nd four patches from my RFC series ("drm/dp: Improvements
> for DP AUX channel") [1]. I've broken the series in two so we can make
> progress on the two halves separately.
>
> v2 of this series changes to add wait_hpd_asserted() instead of
> is_hpd_asserted(). This allows us to move the extra delay needed for
> ps8640 into the ps8640 driver itself.
>
> The idea for this series came up during the review process of
> Sankeerth's series trying to add eDP for Qualcomm SoCs [2].
>
> This _doesn't_ attempt to fix the Analogix driver. If this works out,
> ideally someone can post a patch up to do that.
>
> [1] https://lore.kernel.org/r/20220409023628.2104952-1-dianders@chromium.org/
> [2] https://lore.kernel.org/r/1648656179-10347-2-git-send-email-quic_sbillaka@quicinc.com/
>
> Changes in v3:
> - Don't check "hpd_asserted" boolean when unset.
> - Handle errors from gpiod_get_value_cansleep() properly.
>
> Changes in v2:
> - Change is_hpd_asserted() to wait_hpd_asserted()
>
> Douglas Anderson (4):
>   drm/dp: Add wait_hpd_asserted() callback to struct drm_dp_aux
>   drm/panel-edp: Take advantage of wait_hpd_asserted() in struct
>     drm_dp_aux
>   drm/panel: atna33xc20: Take advantage of wait_hpd_asserted() in struct
>     drm_dp_aux
>   drm/bridge: parade-ps8640: Provide wait_hpd_asserted() in struct
>     drm_dp_aux
>
>  drivers/gpu/drm/bridge/parade-ps8640.c        | 34 +++++++++------
>  drivers/gpu/drm/panel/panel-edp.c             | 33 ++++++++++-----
>  .../gpu/drm/panel/panel-samsung-atna33xc20.c  | 41 +++++++++++++------
>  include/drm/dp/drm_dp_helper.h                | 26 ++++++++++++
>  4 files changed, 98 insertions(+), 36 deletions(-)

It's been about 2 weeks and I haven't seen any review. Dmitry: since
this came up due to your feedback, any chance you'd be willing to
review at least the drm-framework pieces? Philip is no longer on the
Chrome OS team, so I suspect he won't be reviewing the ps8640 patches.
Stephen: maybe you'd be willing to?

Thanks!

-Doug
