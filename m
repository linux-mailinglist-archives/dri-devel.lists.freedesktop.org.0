Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CC74E5ADB
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 22:47:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C33F510E172;
	Wed, 23 Mar 2022 21:47:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E28610E181
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 21:47:54 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id r13so5529166ejd.5
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 14:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SFPXmPT7/mwXkkz89BQ6Ja5ArCL0mt2OdL/RGrBAAyM=;
 b=OFCDwRlZ4PBEwBgRJ2fN0hWjPJeC4zcCImAwyCHTlIWxjUu97sa7XaKAMJN7NAkvb5
 D6SKJzYDt9JZr7b+KOER1At1m32cTeKX5DOzzThOMZXnDIWZsi2YCsQ05+hwPXQ6vtC5
 Gl5BfMsmzcGr4ViX9uMIBY4qmJd80xnnpWddw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SFPXmPT7/mwXkkz89BQ6Ja5ArCL0mt2OdL/RGrBAAyM=;
 b=GZ4EDS4kx+8eUmS20ZJ5ZITpAfHN6KYMqykEmCtDq9dE3Y25omV0FbYB55g9s5MaxH
 1gSR5/zTnfLVvcMbgD+lS7mgxE/YgyLYnv5ZZUyM32tUoxChDMvqfYci4orxvIzim9cI
 XAjXLwzfCtQXdcZHGgPkVylYh3VHB7AOwdN5qOnS08tekMXOfrm8yfMQ8Mf24FdPRC+3
 HFIZFLVj6O8mCfV+43/5Q/2Ak4zO+0SZYqnYsuuiGkYakZ45r4USioz8E5d2BdtR1rrQ
 cxFtJ72eSyeLGBvteHB822Zc6gmoWpDrym97GJl6ngZz/W7e+JGGMowLr9FI4EtVoP2y
 N0dA==
X-Gm-Message-State: AOAM53078rY+drqf4XH0Vatqff9/cSc3WwP7A03HOZvmUsx32y8K+mVt
 ekYaPlTqtxK1m7LzSXBgLS/2yR5rqgh6+MDg
X-Google-Smtp-Source: ABdhPJwcrk1Tpc6KyeXhZE2l84sqd8Cb1CdYGecRH30OLsLQJZMCMLpoyM71aezRzPjDwswX7L84gQ==
X-Received: by 2002:a17:907:1622:b0:6df:d1a2:d4a3 with SMTP id
 hb34-20020a170907162200b006dfd1a2d4a3mr2302436ejc.542.1648072073275; 
 Wed, 23 Mar 2022 14:47:53 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com.
 [209.85.221.53]) by smtp.gmail.com with ESMTPSA id
 h20-20020a1709060f5400b006d6d54b9203sm392947ejj.38.2022.03.23.14.47.51
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 14:47:51 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id r13so3999294wrr.9
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 14:47:51 -0700 (PDT)
X-Received: by 2002:a05:6000:1704:b0:203:d857:aa7a with SMTP id
 n4-20020a056000170400b00203d857aa7amr1701592wrc.513.1648072070767; Wed, 23
 Mar 2022 14:47:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220317131250.1481275-1-kieran.bingham+renesas@ideasonboard.com>
 <20220317131250.1481275-3-kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <20220317131250.1481275-3-kieran.bingham+renesas@ideasonboard.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 23 Mar 2022 14:47:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XwThyeZ-LFvxD9RYA=_T7aycbE84QYSjA7crkAwv=2fQ@mail.gmail.com>
Message-ID: <CAD=FV=XwThyeZ-LFvxD9RYA=_T7aycbE84QYSjA7crkAwv=2fQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] drm/bridge: ti-sn65dsi86: Implement bridge
 connector operations
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
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Mar 17, 2022 at 6:13 AM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
>
> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> Implement the bridge connector-related .get_edid() operation, and report
> the related bridge capabilities and type.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes since v1:
>
> - The connector .get_modes() operation doesn't rely on EDID anymore,
>   __ti_sn_bridge_get_edid() and ti_sn_bridge_get_edid() got merged
>   together
>  - Fix on top of Sam Ravnborg's DRM_BRIDGE_STATE_OPS
>
> Changes since v2: [Kieran]
>  - Only support EDID on DRM_MODE_CONNECTOR_DisplayPort modes.
>
> Changes since v3: [Kieran]
>  - Remove PM calls in ti_sn_bridge_get_edid() and simplify
>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Looks good to me now.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
