Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4518B49543B
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 19:33:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F18D910ECA3;
	Thu, 20 Jan 2022 18:33:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8010410ECA0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 18:33:23 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id m4so32365679edb.10
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 10:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AKUPvYgb/xwsTq6T7e89Z6kjzAJSxkrEuwSzEueenMc=;
 b=g0plarazHPwI4qlq/iLNZg6VCNmjr7t39qqS/R7UXrPsoagw0roK4Oxy1FcqigzWVD
 5qzEWL3uPnCjplkdgeow3xuV+Wl+XkoCQT8Bzf0+deLaZeo5j/ueuLPszaRkRnEzFPyd
 L7MEhwee3mTd1zxtK1EYURmQ5DVeqXVW89Vbo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AKUPvYgb/xwsTq6T7e89Z6kjzAJSxkrEuwSzEueenMc=;
 b=gubDaKXVZls1QrVY9x9L77X9/PKm5GcRfyS+0U8+n8x6lQ8nxf36A+c1FZVl8OssZA
 +1DnR7tG7mT4Q1A/sP8H3aOyumKfeb3nQrMh+mSSOyhxLpeB3j4/23HtC0eC0h4wV2iq
 pz0V3XL6Lvgidwc0o7JVBk4BDljqn1LFaj/BE9qXCHvI7MJS/toNodDY5IfM6RoLzW4p
 Yy0GmYK9rLlLZNd1mS3TbHFabUBXf8sli4pPesorgo/qRbfbi8ABTZOsI6rXZSBD8dnF
 wQYQRkGbIJJoKDUJ0NZ7uA6uQ1yvLH3eojaiWttWCjjl7nuwKL+TjRIxAMr4XC015Jnc
 Ajtw==
X-Gm-Message-State: AOAM532yzoSrvprbtLDSW0mOGElCzmURJ4+mPAgS/TYjxsbyKPGcMhpi
 4hp0vuQ+oXftoJI2NemnLp+OnDCT7gyD2cmY+EJhUg==
X-Google-Smtp-Source: ABdhPJwt+XAMRl17Scsp8wwhWEmsO7vFjwY7BNMmq+eFOWefHMWaw75EXBzrtVVz8ykqngqnRTHQUYrvu2B/OHbFdOU=
X-Received: by 2002:a17:907:3e23:: with SMTP id
 hp35mr157023ejc.760.1642703602005; 
 Thu, 20 Jan 2022 10:33:22 -0800 (PST)
MIME-Version: 1.0
References: <20220120083357.1541262-1-narmstrong@baylibre.com>
 <20220120083357.1541262-7-narmstrong@baylibre.com>
In-Reply-To: <20220120083357.1541262-7-narmstrong@baylibre.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Fri, 21 Jan 2022 00:03:10 +0530
Message-ID: <CAMty3ZBdzW++6mCaqCLuL0QWwY7ve1vmLSPhaS8QqYji_jDXSg@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] drm/meson: add support for MIPI-DSI transceiver
To: Neil Armstrong <narmstrong@baylibre.com>
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
Cc: martin.blumenstingl@googlemail.com, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 20, 2022 at 2:04 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> The Amlogic G12A/G12B/SM1 SoCs embeds a Synopsys DW-MIPI-DSI transceiver (ver 1.21a),
> with a custom glue managing the IP resets, clock and data input similar to the DW-HDMI
> Glue on other Amlogic SoCs.
>
> This adds support for the Glue managing the transceiver, mimicing the init flow provided
> by Amlogic to setup the ENCL encoder, the glue, the transceiver, the digital D-PHY and the
> Analog PHY in the proper way.
>
> An optional "MEAS" clock can be enabled to measure the delay between each vsync feeding the
> DW-MIPI-DSI transceiver.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---

Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
