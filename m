Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5254843E913
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 21:47:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1D5A6E0F1;
	Thu, 28 Oct 2021 19:47:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B05806E0F1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 19:47:54 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id e65so7476567pgc.5
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 12:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N4Eqbd0UGLUUWxA5kDPAWucE9MGTHM6kKCDv9lFpQAo=;
 b=ZBV7ZhlI78dRC+bco4/ReoNhTGvlsH3dlmb4b8tkYmoQR40VtpGyl3rO9lLluT08/3
 I1+iRYehy8hPfBvpRdXw/kUxwNcDxpWQpJJr3FhaaOYYcDF66H1RC0COvhTzh0+DG+8J
 mR12svkECRLtify/O0UOombQMN3VaHR6aoM0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N4Eqbd0UGLUUWxA5kDPAWucE9MGTHM6kKCDv9lFpQAo=;
 b=HUxcjFkMqJA1rX3wfz8PbnzbcXIrgocYky6UR30fRZoZyGx0psWyJagRzxjMqdScch
 iOT0jjXJvUAJw24rN44/WLtwUeLfOzBVqM2K/PiRQcVcWpUrljmf+htFkj8yBZteCiOi
 axaiXrzpwcjR9Fnz5EIhYnRzv83PhJ4ouoKkIKtmdzNgX1nqSgE2KdcA6YAG8CbOFpej
 8VOV/Z8S30f3qgAJ7NulkJOX2lawn22LxYpTcPVcaF5UIPJnSEzy/NZNpzHq7cYudBxb
 mYibb8t52FWEebYzXdPO0nEQhFOtYU0qvCUSP23mW2xXHDIi8Kdom8tt/+a6LHObm+V3
 OJGA==
X-Gm-Message-State: AOAM530tD2o86cZSrLC7zHPtoDMOjJucws0QJYMVeb0cH8ycjgKqJk0+
 Vr/uQQSnZe6dO85QXSkDy9GPcKilNBaSOA==
X-Google-Smtp-Source: ABdhPJyxbKwlfKE8GoeJJw6NxBOltzcFDrhTMtFsyOwABi6SK/Ff3SF8yEYrXjjVDftWbZbdGlgr4Q==
X-Received: by 2002:a65:62c4:: with SMTP id m4mr4772100pgv.453.1635450473822; 
 Thu, 28 Oct 2021 12:47:53 -0700 (PDT)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com.
 [209.85.215.169])
 by smtp.gmail.com with ESMTPSA id b7sm4355380pfm.28.2021.10.28.12.47.53
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 12:47:53 -0700 (PDT)
Received: by mail-pg1-f169.google.com with SMTP id t7so7460112pgl.9
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 12:47:53 -0700 (PDT)
X-Received: by 2002:a6b:e50f:: with SMTP id y15mr4362167ioc.177.1635450093365; 
 Thu, 28 Oct 2021 12:41:33 -0700 (PDT)
MIME-Version: 1.0
References: <20211028105754.v5.1.I828f5db745535fb7e36e8ffdd62d546f6d08b6d1@changeid>
 <20211028105754.v5.2.I09899dea340f11feab97d719cb4b62bef3179e4b@changeid>
In-Reply-To: <20211028105754.v5.2.I09899dea340f11feab97d719cb4b62bef3179e4b@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 28 Oct 2021 12:41:21 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VdybQftD90sZK36nFevkK2Et70KhTT96swi9WY0S-CEw@mail.gmail.com>
Message-ID: <CAD=FV=VdybQftD90sZK36nFevkK2Et70KhTT96swi9WY0S-CEw@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] drm/bridge: parade-ps8640: Populate devices on
 aux-bus
To: Philip Chen <philipchen@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Oct 28, 2021 at 10:58 AM Philip Chen <philipchen@chromium.org> wrote:
>
> Conventionally, panel is listed under the root of the device tree.
> When userland asks for display mode, ps8640 bridge is responsible
> for returning EDID when ps8640_bridge_get_edid() is called.
>
> Now enable a new option of listing panel under "aux-bus" of ps8640
> bridge node in the device tree. In this case, panel driver can retrieve
> EDID by triggering AUX transactions, without ps8640_bridge_get_edid()
> calls at all.
>
> To prevent the "old" and "new" options from interfering with each
> other's logic flow, disable DRM_BRIDGE_OP_EDID when the new option
> is taken.
>
> Signed-off-by: Philip Chen <philipchen@chromium.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
> In v4, I factored out the "ps8640_ensure_hpd" change and added it to patch 1/2
> in this patch series. But I forgot to mention it in v4 change log. Edit v4
> change log retroactively.
>
> In v3, I factored out the "put_sync_suspend" change and added it to patch 1/2
> in this patch series. But I forgot to mention it in v3 change log. Edit v3
> change log retroactively.
>
> (no changes since v4)
>
> Changes in v4:
> - Move the change of "ps8640_ensure_hpd" to patch 1/2 in this patch series.
>
> Changes in v3:
> - Fix when to call of_node_put() in ps8640_of_panel_on_aux_bus()
> - Move the change of "put_sync_suspend" to patch 1/2 in this patch series.
>
> Changes in v2:
> - Add of_node_put() calls in ps8640_of_panel_on_aux_bus()
> - Select DRM_DP_AUX_BUS for PS8640 driver in Kconfig
>
>  drivers/gpu/drm/bridge/Kconfig         |  1 +
>  drivers/gpu/drm/bridge/parade-ps8640.c | 51 ++++++++++++++++++++------
>  2 files changed, 40 insertions(+), 12 deletions(-)

Should have carried my tag from v4, but here it is again:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
