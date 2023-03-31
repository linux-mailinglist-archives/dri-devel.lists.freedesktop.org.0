Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DE36D2971
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 22:29:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4657610F2F8;
	Fri, 31 Mar 2023 20:29:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com
 [IPv6:2607:f8b0:4864:20::936])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D739189864
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 20:29:27 +0000 (UTC)
Received: by mail-ua1-x936.google.com with SMTP id i22so16975771uat.8
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 13:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1680294565;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NgY7ioG8j1aHH/GlwYCmuWvPm8w3+ppWkBC1qAdYysc=;
 b=YX/bRjznJ8xD5/mresCU7N/d7uXrhY+Hsb3XEYAwhTMnItg8/QlitFXqoi+ZR+iwa6
 xadNEXj7hI0PDvQDcSaZyCnz9iTK1h2Pya+3RiE79EMgjCuUpG6meWWtcWilcDpy5jwf
 PlsTDSWcHS4oPM46X+COaHpr+wUuGTe9z25C8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680294565;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NgY7ioG8j1aHH/GlwYCmuWvPm8w3+ppWkBC1qAdYysc=;
 b=2VXYm0C6Vip6mWDkZ/fUqEYene5Vgmzoo6PVE0CO60hidvd8Px+KfyVsvVISze6YGP
 w9yC3rwHkbqWhCaJuYLAuUSegwbxozW2ejH36K3tOlSpqp37RMRH0CP9+yj6zX9c408+
 NrsiMwuZxdkmF+S4MuP/bKhZ1xVgCictSV6G/5kOgDRmIGEdWHtKpDkMZAfqmhWGpIC9
 qoezi5d5zKmaa0BhPfNvlzrD0gi/vcbZ+NXb2/jjsOIfpspla9+UNoIu3gREZpV+TnJb
 aFkx9KY2BfF56qK1QmycYBsZCrI6k2RL6gDpVCK1fKJB8g8x/x8ecTa8Wi85575zJOao
 zUQw==
X-Gm-Message-State: AAQBX9c11fkCtCny0lnDBxqioUHhZQ72Ont0foPCJfE7usjXUTtBJXf5
 6hiP3RaMKXFMxy1ka+/9RkDNo8S7tqb/kqq+R1k=
X-Google-Smtp-Source: AKy350YpFBh1MKeosRcgXT0kTJx3DU83zLi4Ci9rLvRJFBCVCswdRTDS2p52ub8C1/TS4caEzku6TQ==
X-Received: by 2002:a1f:9805:0:b0:43b:a6d2:ee9 with SMTP id
 a5-20020a1f9805000000b0043ba6d20ee9mr6645101vke.8.1680294564947; 
 Fri, 31 Mar 2023 13:29:24 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com.
 [209.85.222.44]) by smtp.gmail.com with ESMTPSA id
 h77-20020a1f9e50000000b00436ac06d052sm635370vke.35.2023.03.31.13.29.23
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Mar 2023 13:29:23 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id n17so16971993uaj.10
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 13:29:23 -0700 (PDT)
X-Received: by 2002:ab0:318c:0:b0:765:c225:c914 with SMTP id
 d12-20020ab0318c000000b00765c225c914mr8048524uan.1.1680294563053; Fri, 31 Mar
 2023 13:29:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230331030204.1179524-1-treapking@chromium.org>
In-Reply-To: <20230331030204.1179524-1-treapking@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 31 Mar 2023 13:29:11 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XdthxVh=wTR5hLj3sy=X__nYQge5=SBXB=eAENe0bd1g@mail.gmail.com>
Message-ID: <CAD=FV=XdthxVh=wTR5hLj3sy=X__nYQge5=SBXB=eAENe0bd1g@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ps8640: Use constant sleep time for polling
 hpd
To: Pin-yen Lin <treapking@chromium.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Mar 30, 2023 at 8:02=E2=80=AFPM Pin-yen Lin <treapking@chromium.org=
> wrote:
>
> The default hpd_wait_us in panel_edp.c is 2 seconds. This makes the
> sleep time in the polling of _ps8640_wait_hpd_asserted become 200ms.
> Change it to a constant 20ms to speed up the function.

Ah, I see why I never ran into this. All the panels I worked with
specified "hpd_absent" of 200 and thus I've always been using 20.


> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> ---
>
>  drivers/gpu/drm/bridge/parade-ps8640.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bri=
dge/parade-ps8640.c
> index b823e55650b1..c3eb45179405 100644
> --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> @@ -184,7 +184,7 @@ static int _ps8640_wait_hpd_asserted(struct ps8640 *p=
s_bridge, unsigned long wai
>          * actually connected to GPIO9).
>          */
>         ret =3D regmap_read_poll_timeout(map, PAGE2_GPIO_H, status,
> -                                      status & PS_GPIO9, wait_us / 10, w=
ait_us);
> +                                      status & PS_GPIO9, 20000, wait_us)=
;

I'd have been tempted to go even lower at 10ms. Waiting for HPD isn't
something that we do all the time during a normal running system and
thus it's not something we have to optimize every last bit of power
out of. The user would generally rather have the system boot up or
switch modes 10ms faster. ;-)

In any case, either at 10ms or 20ms:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

-Doug
