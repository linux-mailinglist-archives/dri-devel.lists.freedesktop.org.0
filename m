Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B04577FA1
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 12:27:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91266AF754;
	Mon, 18 Jul 2022 10:27:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DA41AF74B
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 10:27:54 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id l23so20373716ejr.5
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 03:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aGrUsGmEyzfhhFC6yht8UK4tIhUB5L2Yyj7VtUSkBjg=;
 b=O1fWCAkBCBjaVHiCup0ZmH/N0dZjjnk8aMiNo1KKm0RxB6jzXedELhA6uI/knC6r9L
 0MKPBFWRTYiA27OzzbGTrKW+tNpF/1xlJz1QmqJyJrDjwKgNxl8GGghjaa/y8/vj8LfV
 MQhg462eUZuNrg68b5LDq+awrYHNUF70ZvgFSJL23xr+/54PP0W/0CfAKWPm/vBaDm5P
 N3/+gCpP8BDS4q9hT3D/nnz+aOW20DH+MJ/qUK1BoSPXricdeu0/a8nlDMAw/8t5nHBq
 b2RuCbmDv19ABez4bnNHBHaPetb4YrpuhtTXsu8pFGwuStJngTetANyB+kLSO+C6FjBa
 hhkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aGrUsGmEyzfhhFC6yht8UK4tIhUB5L2Yyj7VtUSkBjg=;
 b=XUEjca5Vx6nDzeddv5FAdFxP+rBKJ2cDU0e6uPgX2HwqXUn/WO2DBERpFYuDzom0mi
 WWTlow6xCuw9l7q59yF8RhRc6VdYEOf0LRvgBXoyIfSmq/h9EHAziuoAVvw9D6yMU6B4
 6saGB7uXAVGbqlTMPzXBscYcrz3vfg7R51ate2VrMQZn3FMHi9tXCvHFA151/wh02WKo
 5FCbOEvwc/nxEv4JUs5duY0PDC0yc7jVCuXEfMjG6DDuPPlAv8JUQ8CAoKMOq5+of1qY
 Yr+OEPq+wqXiovRF6y7E/xx8kCZVdeUBaY62039o7ff//lvNCRsR6sFdx+63qDJGP0Pu
 hJtA==
X-Gm-Message-State: AJIora9tiW3I73ffy23PNoNcpP924J68Nzfrm0wE5xxRUIWZVRbJAgnN
 2zF091yO82sO275muI8ZIy9eavutpZGwyuIjqsCoqw==
X-Google-Smtp-Source: AGRyM1u8XN9HbZjR0yF63PO6LoPm+22MOk00Hd+2NOztBbWpmbYZ5KNQImOwAhfM8IGdUgjC9z/6Om+NlLM6ztosZFU=
X-Received: by 2002:a17:907:96a4:b0:72b:647e:30fd with SMTP id
 hd36-20020a17090796a400b0072b647e30fdmr24418029ejc.723.1658140072536; Mon, 18
 Jul 2022 03:27:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220717174454.46616-1-sam@ravnborg.org>
 <20220717175801.78668-1-sam@ravnborg.org>
 <20220717175801.78668-5-sam@ravnborg.org>
In-Reply-To: <20220717175801.78668-5-sam@ravnborg.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 18 Jul 2022 11:27:37 +0100
Message-ID: <CAPY8ntB2gXoUbUJhDLWVX3szaEKKKhnOO-qsKRZkMp1jDOt0Qg@mail.gmail.com>
Subject: Re: [PATCH v1 12/12] drm/todo: Add bridge related todo items
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Guenter Roeck <groeck@chromium.org>,
 chrome-platform@lists.linux.dev, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>,
 Arnd Bergmann <arnd@arndb.de>, Jonas Karlman <jonas@kwiboo.se>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Philip Chen <philipchen@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Cai Huoqing <cai.huoqing@linux.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam

On Sun, 17 Jul 2022 at 18:58, Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Add todo in the hope someone will help updating the bridge drivers.
>
> v2:
>   - Updated descriptions in todo.rst
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  Documentation/gpu/todo.rst | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 10bfb50908d1..fbcc232e0bc1 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -480,6 +480,26 @@ Contact: Thomas Zimmermann <tzimmermann@suse.de>
>
>  Level: Starter
>
> +Drop use of deprecated operations in bridge drivers
> +--------------------------------------------------
> +
> +&struct drm_bridge_funcs contains a number of deprecated operations
> +which can be replaced by the atomic variants.
> +
> +The following is more or less 1:1 replacements with the arguments
> +and names adjusted:
> +* pre_enable => atomic_pre_enable
> +* enable => atomic_enable
> +* disable => atomic_disable
> +* post_disable => atomic_post_disable
> +
> +* mode_set is no longer required and the implementation shall be merged
> +  with atomic_enable.

The dw-mipi-dsi and msm DSI host controller bridge drivers are
currently relying on mode_set as a convenient hook to power up the DSI
host prior to pre_enable of the bridge chain. Removing it is therefore
going to break those.

There is a proposed mechanism to allow for the removal of this hack
[1], but it's still waiting on R-B tags and/or discussion from bridge
maintainers (gentle nudge as you are one of those maintainers).

And do you mean merge with atomic_enable, or merge with
atomic_pre_enable? atomic_pre_enable would be more applicable for
almost all the bridges I'm aware of as they want to be configured
before video starts.

Cheers,
  Dave

[1] https://lists.freedesktop.org/archives/dri-devel/2022-March/345466.html

> +Contact: bridge maintainers, Sam Ravnborg <sam@ravnborg.org>,
> +         Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> +
> +Level: Beginner or intermediate (depending on the driver)
>
>  Core refactorings
>  =================
> --
> 2.34.1
>
