Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B836BA177
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 22:31:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10F02892E0;
	Tue, 14 Mar 2023 21:31:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83D84892E0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 21:31:14 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id t129so6984933iof.12
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 14:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1678829472;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2uY427W2KMisQvhtrsSNS8I4WCl3EbKmvvrlqEop4WI=;
 b=dtbt+HaMnYgWBO/uOEsNwA/ZHflrQdT27eQueXz9su5WHyOLjt4P7HhbXeMGiKeuIU
 MJGchrYHiJVyUivhxKf6qszQte0zwSPr+W1K7eXhswBZzEoGs2LntAaDJHsSqaqiRVTj
 lUScchWH8FcwxpzJQKtTTLwF2YfC2C52sHJEU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678829472;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2uY427W2KMisQvhtrsSNS8I4WCl3EbKmvvrlqEop4WI=;
 b=nP61ucohczFgXiG5Sdj5f2VkuDTC7Lw5et2KVJHKYDGf/vm5n2F1MwlOusBvnNfYEA
 kFJc4B3G5ecjMFXTzFwzRCT7KiVofWNbvmvxyQiEHLXnnpP5mmNO3GGZgdkaENi/V+o8
 rSRLw6AYgbd/NvAv16OuyKePysT9mEO9zPvwRSpXuSO3bTd1mXmnoKEpWGDrndHaaSI4
 rUPGq7IueKl7FKRP9jQWl6t8W5lPOhXhD7qJVGU6lyaF5wsFjzHdNUbvaZKkvpeUDPEc
 P3JB5xtVZq+QcKrXxyKoTtJWBLaGw07h7jtOIFcY99aE2NEufUuhZ359kS16SSLkZEqE
 pCZw==
X-Gm-Message-State: AO0yUKU8L9MxCkS28ADKdppy1LIJDZx4HSoSAiTE1avuZmwj89qP91Jn
 /4lldyuHw2z0+JaUapPmBEBqqXIHriB8Jp5AUas=
X-Google-Smtp-Source: AK7set99f4q8T1vI/eUTSET/7U1tAgf87nEfEx8TXthu6uaKAJ8Y2XAH24tJ4CwpY6nRFJP5NMVJlw==
X-Received: by 2002:a5d:889a:0:b0:713:7b7c:46d7 with SMTP id
 d26-20020a5d889a000000b007137b7c46d7mr12493264ioo.21.1678829471637; 
 Tue, 14 Mar 2023 14:31:11 -0700 (PDT)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com.
 [209.85.166.53]) by smtp.gmail.com with ESMTPSA id
 i9-20020a6b7e09000000b0073f0832050bsm1104179iom.18.2023.03.14.14.31.09
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Mar 2023 14:31:10 -0700 (PDT)
Received: by mail-io1-f53.google.com with SMTP id m22so6999470ioy.4
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 14:31:09 -0700 (PDT)
X-Received: by 2002:a02:a106:0:b0:406:122f:76ad with SMTP id
 f6-20020a02a106000000b00406122f76admr756559jag.1.1678829469489; Tue, 14 Mar
 2023 14:31:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230314110043.2139111-1-treapking@chromium.org>
In-Reply-To: <20230314110043.2139111-1-treapking@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 14 Mar 2023 14:30:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W=jVsvD620wWKfniRYQNJnb7goDUKb_HhL_qVxLYGZOA@mail.gmail.com>
Message-ID: <CAD=FV=W=jVsvD620wWKfniRYQNJnb7goDUKb_HhL_qVxLYGZOA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/bridge: ps8640: Skip redundant bridge enable
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
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Mar 14, 2023 at 4:00=E2=80=AFAM Pin-yen Lin <treapking@chromium.org=
> wrote:
>
> Skip the drm_bridge_chain_pre_enable call when the bridge is already
> pre_enabled. This make pre_enable and post_disable (thus
> pm_runtime_get/put) symmetric.
>
> Fixes: 46f206304db0 ("drm/bridge: ps8640: Rework power state handling")
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> ---
>
>  drivers/gpu/drm/bridge/parade-ps8640.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bri=
dge/parade-ps8640.c
> index 4b361d7d5e44..08de501c436e 100644
> --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> @@ -557,7 +557,8 @@ static struct edid *ps8640_bridge_get_edid(struct drm=
_bridge *bridge,
>          * EDID, for this chip, we need to do a full poweron, otherwise i=
t will
>          * fail.
>          */
> -       drm_atomic_bridge_chain_pre_enable(bridge, connector->state->stat=
e);
> +       if (poweroff)
> +               drm_atomic_bridge_chain_pre_enable(bridge, connector->sta=
te->state);

It always seemed weird to me that this function was asymmetric, so I
like this change, thanks!

I also remember wondering before how this function was safe, though.
The callpath for getting here from the ioctl is documented in the
function and when I look at it I wonder if anything is preventing the
bridge from being enabled / disabled through normal means at the same
time your function is running. That could cause all sorts of badness
if it is indeed possible. Does anyone reading this know if that's
indeed a problem?

I suppose that, if this is unsafe, it's no more unsafe now than it was
before your patch, so I guess:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

If there are no issues, I'll plan to land this patch and the next one
to drm-misc-next sometime late-ish next week.
