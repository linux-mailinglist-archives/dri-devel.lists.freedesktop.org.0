Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F9F726213
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 16:04:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A23010E08F;
	Wed,  7 Jun 2023 14:04:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0680510E08F
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 14:04:08 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-777a4926555so28395239f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 07:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1686146646; x=1688738646;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y5UbzVeA3KuVw0vrmVmOEU7zOkqX+n/eTuvBtyMAf0M=;
 b=gTSgDubDez2rYc51Up0UfLRsDx4X1D98MPSlwo2iibtPZslSQfPX9QInFaSdyWsZJB
 mZJ8BWueAMV/subX7oEJnd6ZHZbY/GgM+qw9Ke85kvTXSKJxDQBbweg436xAokFxj870
 1HjrJ3kTOnzaxXeK2MhshWYBhNp7lKIju02ps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686146646; x=1688738646;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y5UbzVeA3KuVw0vrmVmOEU7zOkqX+n/eTuvBtyMAf0M=;
 b=bb+s1gVUXHIuTZlTLuR0B9v/cg0C8QBHCTL9imMMysh2ms2pXS6PDmtdupQtgz6qGn
 yz8aGWw/RKv+Sgs9wXHBvPWPC5Rwzdts46D8uAZ+L1c/j4oNLsxJB/Lz/Sr/XPH141WH
 8i0vWnAV2+JSp6dK8IOKyZnFY8zymoJaRZQu85xGFoXgnob77dhX+M/qUTXAUZPuOhKZ
 YDouDfGhd+96X7D02tKTmn4bguiPgJjzEluIyQowcDiN1p69rbDhZg4fgkUuIj+5PRXQ
 gyZtBOjZJ4Lv84UrNQTISLUpu7QMdr+Yf8GJkz62eh7KepexwZGtESYuY0lotpRFIHqt
 E5Sg==
X-Gm-Message-State: AC+VfDwBAFk/CggeFjc95RTlc+wqF9Wc9i8AUBLQCAUa36iGjD+uBCod
 lJs7FPtLuzArQ0MmQn4seXnW9XUfvI0AQxS5fvo=
X-Google-Smtp-Source: ACHHUZ6WIK76el0Y8VhiKN8O317J+qmIpdFQsxEdHp2HFRmQGFu5sSf44haU5tCFhU/sUMt3+LoCTw==
X-Received: by 2002:a05:6602:2e10:b0:777:b45a:8bea with SMTP id
 o16-20020a0566022e1000b00777b45a8beamr5463213iow.9.1686146645360; 
 Wed, 07 Jun 2023 07:04:05 -0700 (PDT)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com.
 [209.85.166.179]) by smtp.gmail.com with ESMTPSA id
 dx1-20020a0566381d0100b0041cea93e589sm3422044jab.152.2023.06.07.07.04.03
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jun 2023 07:04:04 -0700 (PDT)
Received: by mail-il1-f179.google.com with SMTP id
 e9e14a558f8ab-33bf12b5fb5so108595ab.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 07:04:03 -0700 (PDT)
X-Received: by 2002:a05:6e02:174c:b0:338:1993:1194 with SMTP id
 y12-20020a056e02174c00b0033819931194mr224583ill.2.1686146641918; Wed, 07 Jun
 2023 07:04:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230607012355.442707-1-suhui@nfschina.com>
In-Reply-To: <20230607012355.442707-1-suhui@nfschina.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 7 Jun 2023 07:03:50 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UxzUoAPbKtX3Xvq=g8DNcatQ8-s-8rcGEeE+G40a9RhQ@mail.gmail.com>
Message-ID: <CAD=FV=UxzUoAPbKtX3Xvq=g8DNcatQ8-s-8rcGEeE+G40a9RhQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: ti-sn65dsi86: Avoid possible buffer
 overflow
To: Su Hui <suhui@nfschina.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: dri-devel@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 andersson@kernel.org, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Jun 6, 2023 at 6:25=E2=80=AFPM Su Hui <suhui@nfschina.com> wrote:
>
> Smatch error:buffer overflow 'ti_sn_bridge_refclk_lut' 5 <=3D 5.
>
> Fixes: cea86c5bb442 ("drm/bridge: ti-sn65dsi86: Implement the pwm_chip")
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/brid=
ge/ti-sn65dsi86.c
> index 7a748785c545..bb88406495e9 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -305,7 +305,7 @@ static void ti_sn_bridge_set_refclk_freq(struct ti_sn=
65dsi86 *pdata)
>          * The PWM refclk is based on the value written to SN_DPPLL_SRC_R=
EG,
>          * regardless of its actual sourcing.
>          */
> -       pdata->pwm_refclk_freq =3D ti_sn_bridge_refclk_lut[i];
> +       pdata->pwm_refclk_freq =3D ti_sn_bridge_refclk_lut[i < refclk_lut=
_size ? i : 1];

This looks more correct, but it really needs a comment since it's
totally not obviously what you're doing here. IMO the best solution
here is to update "i" right after the for loop and have a comment
about the datasheet saying that "1" is the default rate so we'll fall
back to that if we couldn't find a match. Moving it to right after the
for loop will change the value written into the registers, but that's
fine and makes it clearer what's happening.


-Doug

On Tue, Jun 6, 2023 at 6:25=E2=80=AFPM Su Hui <suhui@nfschina.com> wrote:
>
> Smatch error:buffer overflow 'ti_sn_bridge_refclk_lut' 5 <=3D 5.
>
> Fixes: cea86c5bb442 ("drm/bridge: ti-sn65dsi86: Implement the pwm_chip")
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/brid=
ge/ti-sn65dsi86.c
> index 7a748785c545..bb88406495e9 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -305,7 +305,7 @@ static void ti_sn_bridge_set_refclk_freq(struct ti_sn=
65dsi86 *pdata)
>          * The PWM refclk is based on the value written to SN_DPPLL_SRC_R=
EG,
>          * regardless of its actual sourcing.
>          */
> -       pdata->pwm_refclk_freq =3D ti_sn_bridge_refclk_lut[i];
> +       pdata->pwm_refclk_freq =3D ti_sn_bridge_refclk_lut[i < refclk_lut=
_size ? i : 1];
>  }
>
>  static void ti_sn65dsi86_enable_comms(struct ti_sn65dsi86 *pdata)
> --
> 2.30.2
>
