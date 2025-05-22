Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43660AC01A9
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 03:11:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C41171129E2;
	Thu, 22 May 2025 01:11:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="kAc2bhKM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 903751129D9
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 01:11:15 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-231f325366eso55092595ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 18:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1747876273; x=1748481073;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3BXu5AhU668DeVMQXwhRYtvbb/ldwfvRhDhf9vXtb6o=;
 b=kAc2bhKMKZA5lYO2qoP4TkHhHBsFOz2ZkG7RK8/0JWqiBhRANTRJDrWB0dZOlFEQS7
 KtZIJ5MY0F9gzFk+cgNtWDF4Tj7thuNy8mgl0ZLdsc0WMuCdqJmeHStcIEWu138cZ5pz
 TPf+fJiFspq0cOsYspO1KmKpJlZkft224xNfk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747876273; x=1748481073;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3BXu5AhU668DeVMQXwhRYtvbb/ldwfvRhDhf9vXtb6o=;
 b=qeIZq8A0yUjOSQVfi+T2L4YY6Cgv0xlYaFg/zAOUTseggMXt1RfkkBYqDgnj1AIdlL
 fuZJpDF1cwpTm5L/7zICz1SiVQv246te03kMZeAVQMyJpXkP8HVY0PIYKhWuBzeyIU4x
 gjyQWZr8Mu6b4vjlCNYz8W+O6sHBB7Jf9/DqErfsPEy1pyJ0IlDv8HEAFv3XTWkLqn2H
 5vkMRsN3kycB7sWrsW/mh/mj4HucTLlzigEhT319D/7yXV1xYCkISAelWExPjgu0jQrD
 XJddGa2c9yW6a5saAAZ1aEKKDsh2oqFWD8n3trcZnMiI2Krq9TCsdvlZYu+7uNQBZCyN
 SU+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUBFp4nmcK2AqQAoB2dVDzT6IVNhZKIxvH31fIqgjy6wunikrtXhFvi2IxCHfu1mjMMGGG7jTrOqg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyuMEoS4wV5/hBToFdKq0KG460tewtCBaaNZ6uzCEPZq55/csyd
 lBVjGJU3+u7IAwH8fn9MV86sNYkct0u5Ei2piq2kfk2F8KMk/zVus3gv+xJj20BM9DhdaU6RO8o
 ZlBs=
X-Gm-Gg: ASbGncvka30R08uY7/nqiRl3AHrb4O3wGahXZP7OSg12FxKfswNYdairbVMAiFnygCy
 2FINlZOFrvHNEbNXKVJ+RUmUqKdOAStcPH2ZfOjiT4gAxF3eNEFW3djzJ2q/BMcsUbVQIo/xzQ/
 qX9xbE+HlnDAXH9fkTi+Y7hSlIDvI3Xx2seWKxNTaewX1ZwSQ4P7J3C6EQ0a16d0ltPQ3ZNYXo+
 xVAaqTYut3eh6vzrHuDAZyWlodUZk32gOI+cOvC5xECK+hDIKhLvDK/s0vp9ONpRtDaVIcCgOfv
 rQY+DOetqEpVImGo9BSfTEq4N2oCFC8Wm9CwJQY2vlHjR5enzBhl0ZNrQ6NBxVy1nyb321Bb2po
 8cWFelTWHFz9AadtY4OA=
X-Google-Smtp-Source: AGHT+IG/xy56arwNuiMzwFGLPj1VT8o0y7Rxm0tmJZdcEvXm1tvXnnid8JNyu4BEdM5hVkjiP0+a/Q==
X-Received: by 2002:a17:902:d4cc:b0:232:119e:1433 with SMTP id
 d9443c01a7336-232119e1945mr229881015ad.45.1747876273108; 
 Wed, 21 May 2025 18:11:13 -0700 (PDT)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com.
 [209.85.215.179]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-231d4ebad26sm98828875ad.198.2025.05.21.18.11.11
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 May 2025 18:11:11 -0700 (PDT)
Received: by mail-pg1-f179.google.com with SMTP id
 41be03b00d2f7-b26d7ddbfd7so7677936a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 18:11:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCW8cOJcV7XKx4W/5iSPMSmcEWHDlE8AQMnI774ZbQ4w1mfCY3+NkcbfCRGM4CWUGI6r91/2tG3IssI=@lists.freedesktop.org
X-Received: by 2002:a17:902:c94f:b0:223:5ca8:5ecb with SMTP id
 d9443c01a7336-231d45ab485mr292944705ad.42.1747876271067; Wed, 21 May 2025
 18:11:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250508115433.449102-1-j-choudhary@ti.com>
In-Reply-To: <20250508115433.449102-1-j-choudhary@ti.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 21 May 2025 18:10:59 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V1mNX-WidTAaENH66-2ExN=F_ovuX818uQGfc+Gsym1Q@mail.gmail.com>
X-Gm-Features: AX0GCFsfqtRg5gds9Yg2OcCBHplls8kkmTCilAH-BAWcG36UzmUn4pE-4UwIYNQ
Message-ID: <CAD=FV=V1mNX-WidTAaENH66-2ExN=F_ovuX818uQGfc+Gsym1Q@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: ti-sn65dsi86: Add HPD for DisplayPort
 connector type
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org, 
 tomi.valkeinen@ideasonboard.com, max.krummenacher@toradex.com, 
 jonas@kwiboo.se, jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 kieran.bingham+renesas@ideasonboard.com, linux-kernel@vger.kernel.org, 
 max.oss.09@gmail.com, devarsht@ti.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, May 8, 2025 at 4:54=E2=80=AFAM Jayesh Choudhary <j-choudhary@ti.com=
> wrote:
>
> By default, HPD was disabled on SN65DSI86 bridge. When the driver was
> added (commit "a095f15c00e27"), the HPD_DISABLE bit was set in pre-enable
> call which was moved to other function calls subsequently.
> Later on, commit "c312b0df3b13" added detect utility for DP mode. But wit=
h
> HPD_DISABLE bit set, all the HPD events are disabled[0] and the debounced
> state always return 1 (always connected state)
>
> Also, with the suspend and resume calls before every register access, the
> bridge starts with disconnected state and the HPD state is reflected
> correctly only after debounce time (400ms). However, adding this delay
> in the detect function causes frame drop and visible glitch in display.
>
> So to get the detect utility working properly for DP mode without any
> performance issues in display, instead of reading HPD state from the
> register, rely on aux communication. Use 'drm_dp_dpcd_read_link_status'
> to find if we have something connected at the sink.
>
> [0]: <https://www.ti.com/lit/gpn/SN65DSI86> (Pg. 32)
>
> Fixes: c312b0df3b13 ("drm/bridge: ti-sn65dsi86: Implement bridge connecto=
r operations for DP")
> Cc: Max Krummenacher <max.krummenacher@toradex.com>
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
>
> v1 patch link which was sent as RFC:
> <https://patchwork.kernel.org/project/dri-devel/patch/20250424105432.2553=
09-1-j-choudhary@ti.com/>
>
> Changelog v1->v2:
> - Drop additional property in bindings and use conditional.
> - Instead of register read for HPD state, use dpcd read which returns 0
>   for success and error codes for no connection
> - Add relevant history for the required change in commit message
> - Drop RFC subject-prefix in v2 as v2 is in better state after discussion
>   in v1 and Max's mail thread
> - Add "Cc:" tag
>
> This approach does not make suspend/resume no-op and no additional
> delay needs to be added in the detect hook which causes frame drops.
>
> Here, I am adding conditional to HPD_DISABLE bit even when we are
> not using the register read to get HPD state. This is to prevent
> unnecessary register updates in every resume call.
> (It was adding to latency and leading to ~2-3 frame drop every 10 sec)
>
> Tested and verified on TI's J784S4-EVM platform:
> - Display comes up
> - Detect utility works with a couple of seconds latency.
>   But I guess without interrupt support, this is acceptable.
> - No frame-drop observed
>
> Discussion thread for Max's patch:
> <https://patchwork.kernel.org/project/dri-devel/patch/20250501074805.3069=
311-1-max.oss.09@gmail.com/>
>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)

Sorry for the delay in responding. Things got a little crazy over the
last few weeks.


> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/brid=
ge/ti-sn65dsi86.c
> index 60224f476e1d..9489e78b6da3 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -352,8 +352,10 @@ static void ti_sn65dsi86_enable_comms(struct ti_sn65=
dsi86 *pdata,
>          * change this to be conditional on someone specifying that HPD s=
hould
>          * be used.
>          */
> -       regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD_DISABLE=
,
> -                          HPD_DISABLE);
> +
> +       if (pdata->bridge.type =3D=3D DRM_MODE_CONNECTOR_eDP)
> +               regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD=
_DISABLE,
> +                                  HPD_DISABLE);

Given your an Max's testing, I'm totally on-board with the above.

>
>         pdata->comms_enabled =3D true;
>
> @@ -1194,13 +1196,14 @@ static enum drm_connector_status ti_sn_bridge_det=
ect(struct drm_bridge *bridge)
>  {
>         struct ti_sn65dsi86 *pdata =3D bridge_to_ti_sn65dsi86(bridge);
>         int val =3D 0;
> +       u8 link_status[DP_LINK_STATUS_SIZE];
>
> -       pm_runtime_get_sync(pdata->dev);
> -       regmap_read(pdata->regmap, SN_HPD_DISABLE_REG, &val);
> -       pm_runtime_put_autosuspend(pdata->dev);
> +       val =3D drm_dp_dpcd_read_link_status(&pdata->aux, link_status);
>
> -       return val & HPD_DEBOUNCED_STATE ? connector_status_connected
> -                                        : connector_status_disconnected;
> +       if (val < 0)
> +               return connector_status_disconnected;
> +       else
> +               return connector_status_connected;

I'd really rather not do this. It took me a little while to realize
why this was working and also not being slow like your 400ms delay
was. I believe that each time you do the AUX transfer it grabs a
pm_runtime reference and then puts it with "autosuspend". Then you're
relying on the fact that detect is called often enough so that the
autosuspend doesn't actually hit so the next time your function runs
then it's fast. Is that accurate?

I'd rather see something like this in the bridge's probe (untested)

  if (pdata->bridge.type =3D=3D DRM_MODE_CONNECTOR_DisplayPort) {
    pdata->bridge.ops =3D DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT;

    /*
     * In order for DRM_BRIDGE_OP_DETECT to work in a reasonable
     * way we need to keep the bridge powered on all the time.
     * The bridge takes hundreds of milliseconds to debounce HPD
     * and we simply can't wait that amount of time in every call
     * to detect.
     */
    pm_runtime_get_sync(pdata->dev);
  }

...obviously you'd also need to find the right times to undo this in
error handling and in remove.

Nicely, this would be the same type of solution needed for if we ever
enabled interrupts.

-Doug
