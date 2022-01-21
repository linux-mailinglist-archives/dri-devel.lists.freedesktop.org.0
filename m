Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB25495E79
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 12:40:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F75610EA1E;
	Fri, 21 Jan 2022 11:40:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46FA210EA13
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 11:40:42 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id p12so41894010edq.9
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 03:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e5xzVNXZs7fXb9zuosaJ9JCPcCN/+n1a8sngJU1nW20=;
 b=dwhLRSTfgRbdYW42NAoD4embp5zQJnwojnXG77evzWEcdQM2D+ppbtikPjri8ImoNQ
 ssSIo6rkOwXHoW6EpD5x/pLYbEvNvHHTEJb8ItFvIZsAjmb/jvo0Wwe35walXp1N1y0o
 q5g+GeOIXtr7bBaXwdJmQRi/oRrzHUn9+/y3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e5xzVNXZs7fXb9zuosaJ9JCPcCN/+n1a8sngJU1nW20=;
 b=qKIN7ySI6oXy+GMaLmonLAJpMfoBVDL7WMPcdJT1PpvWr4f+yTs78gwi13GrFdDzHm
 u9u9Alm/Oz9FxZTs15AnB5pvxAfLA1MIATj97uRa/rlGfa0V66oczTSnOmt1zfId2WOL
 JvbUdSf3lJa67pzojMlLzBDU8cEybI5rJqc6Zh+oyzYQOZNf47nqizww46dpDF9bGWe5
 QXIixUb9bdzzqiSbKuETenqd9ewHYZfj6pLgVSyePTGN1nec25GktavCdX9Str1uJIL/
 CGyZolpsXKEfO6d86FtilcORwJJvsNYZnnSTOozwnqMqBwTVV9s8sumkyHm3asL/nuT/
 JsPw==
X-Gm-Message-State: AOAM532Lh+cimP1vxjpQyj6yAcNeDSaAfwqQSydJ5uyGjx8CE1adFXF3
 7ZWLg4qS4jHjx3+LPuNlRYtTAMu6rYfokJiTb0ekfA==
X-Google-Smtp-Source: ABdhPJyZWzVJvx+sv7zq7onRmMs7r5m/SPhqN9cjmmctSvOhTvE8TyT8uORJ8Z+yab0DLDXMQvuBkcnv7LR+zjKdoK0=
X-Received: by 2002:a17:907:3e0c:: with SMTP id
 hp12mr3175887ejc.537.1642765240700; 
 Fri, 21 Jan 2022 03:40:40 -0800 (PST)
MIME-Version: 1.0
References: <CGME20220117084237eucas1p10169f6fd49d0784db0cba4606fd5c6bb@eucas1p1.samsung.com>
 <20220117084225.125868-1-jagan@amarulasolutions.com>
 <ea77747c-3310-5460-316c-a88042083e98@samsung.com>
In-Reply-To: <ea77747c-3310-5460-316c-a88042083e98@samsung.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Fri, 21 Jan 2022 17:10:29 +0530
Message-ID: <CAMty3ZCToKx_NrHDrtKqa35EkNAXiMU_AyeGy6703r6z4PXPYg@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] drm: exynos: dsi: Convert drm bridge
To: Marek Szyprowski <m.szyprowski@samsung.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 linux-amarula@amarulasolutions.com, dri-devel@lists.freedesktop.org,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

On Fri, Jan 21, 2022 at 5:06 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Hi,
>
> On 17.01.2022 09:42, Jagan Teki wrote:
> > Updated series about drm bridge conversion of exynos dsi.
> >
> > Previous version can be accessible, here [1].
> >
> > Patch 1: connector reset
> >
> > Patch 2: panel_bridge API
> >
> > Patch 3: bridge conversion
> >
> > Patch 4: atomic functions
> >
> > Patch 5: DSI init in pre_enable
> >
> > Apply below patches to test on Exynos DSI:
> > - https://protect2.fireeye.com/v1/url?k=53bdf119-0c26c815-53bc7a56-000babff3563-792dc1a6b54db43e&q=1&e=9a4ea3ad-9e7d-443d-ad21-ce694a7cd352&u=https%3A%2F%2Fpatchwork.amarulasolutions.com%2Fpatch%2F1825%2F
> > - https://protect2.fireeye.com/v1/url?k=cb269ea3-94bda7af-cb2715ec-000babff3563-e6f545b4a32558ba&q=1&e=9a4ea3ad-9e7d-443d-ad21-ce694a7cd352&u=https%3A%2F%2Fpatchwork.amarulasolutions.com%2Fpatch%2F1838%2F
> >
> > [1] https://protect2.fireeye.com/v1/url?k=ee1dae12-b186971e-ee1c255d-000babff3563-83eaf8e86e67e0d9&q=1&e=9a4ea3ad-9e7d-443d-ad21-ce694a7cd352&u=https%3A%2F%2Fpatchwork.amarulasolutions.com%2Fcover%2F1826%2F
> >
> > Any inputs?
>
> I've tried a few times, but I am unable to find what is the base for
> this patchset. I always get a conflict around exynos_dsi_mode_set()
> function. I've tried current linux-next, drm-next, v5.16-rc1 and v5.16.
> It looks that I must have missed applying some patch before playing with
> this.
>
> I've also tried to apply only the last patch, as if I got it right, it
> is the only difference between v4 and v5 and updated 'drm: of: Lookup if
> child node has panel or bridge'. In such case the board freezes during
> the drm initialization.

Please use drm-misc/drm-misc-next with below patches and then apply this series.
- https://patchwork.amarulasolutions.com/patch/1825/
- https://patchwork.amarulasolutions.com/patch/1838/

Jagan.
