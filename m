Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1841643D65F
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 00:13:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48B8C6E02A;
	Wed, 27 Oct 2021 22:13:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEFBD6E02A
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 22:13:07 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id e144so5616520iof.3
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 15:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UyCg7DiL988tpgR9pZu+L02w+APdAgTFVBDFz0gDAgw=;
 b=i+0qsvuAqhfM+m9wIh07yUq5Hr/REgcloxgOucORITFVq7b3BGWhHtzu2Y4U9zjDcb
 va+jlyOMZWhp1ohOcL33fMOlthu8T2HfRrfii2ToHajqftEeVC1Ryrrw0/RaLjhBY1fF
 zhmU94L2XVbNxtZ3SA9bQEr3IfCr7czPzZmCU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UyCg7DiL988tpgR9pZu+L02w+APdAgTFVBDFz0gDAgw=;
 b=fGRfbZm5Q6mqnR5xZfY/T0ShtLu3R6Y5LXU3N9MqOagHUzWrdNVi1ukyQVNooEcgPt
 mHhA+Zq01WNPWRl5e0ph25uHzzop1O4BVs6rBUPHZWA3okHfDnktzOjcm/R+gZmqpTDP
 Tqhl/XUCWCx347fAp1NGcSPzBYl52eVaNNJhHB7NlCRIsLB1Kbq8e4bPVPdyPaeFcpHx
 xYTOZxziq3xoEy3ZCqXaWYBEqLnMyXK0oALAyQrnaI8TpiDAyDT1IVMTsTXqFrAKXOfL
 ++zIUZbmDuFiyUfNHX3zv43HKF6C83imBgUt//qwraiHlTjYTPXQ4G1erMyqQgHOeTz+
 1BWQ==
X-Gm-Message-State: AOAM532B5ZHYleEkP8z57EWdRrdXtRX9YOuofmbNUtOtqnCUUYVQFrvP
 A+lf8jSopEGkCGjTURkZyV0pYroLoEiByQ==
X-Google-Smtp-Source: ABdhPJyl043gekiI0Swzv3qXKITIv6CA6BWsrHWURwbjk99qK4uKCQUsxEMX3gkHkhuEBLbvQLEbvw==
X-Received: by 2002:a05:6602:2cd0:: with SMTP id
 j16mr158071iow.171.1635372786552; 
 Wed, 27 Oct 2021 15:13:06 -0700 (PDT)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com.
 [209.85.166.181])
 by smtp.gmail.com with ESMTPSA id l6sm615629ilt.31.2021.10.27.15.13.05
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 15:13:06 -0700 (PDT)
Received: by mail-il1-f181.google.com with SMTP id l13so4644539ilh.3
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 15:13:05 -0700 (PDT)
X-Received: by 2002:a05:6e02:1b09:: with SMTP id
 i9mr355037ilv.142.1635372785377; 
 Wed, 27 Oct 2021 15:13:05 -0700 (PDT)
MIME-Version: 1.0
References: <20211026145622.v4.1.I9d81c3b44f350707b5373d00524af77c4aae862b@changeid>
 <20211026145622.v4.2.I09899dea340f11feab97d719cb4b62bef3179e4b@changeid>
In-Reply-To: <20211026145622.v4.2.I09899dea340f11feab97d719cb4b62bef3179e4b@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 27 Oct 2021 15:12:53 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XLVf1yA_o+7wSmsybivBmcYDk96kTCOnVSx9myw4i_kQ@mail.gmail.com>
Message-ID: <CAD=FV=XLVf1yA_o+7wSmsybivBmcYDk96kTCOnVSx9myw4i_kQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] drm/bridge: parade-ps8640: Populate devices on
 aux-bus
To: Philip Chen <philipchen@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>, 
 Andrzej Hajda <a.hajda@samsung.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
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

On Tue, Oct 26, 2021 at 2:56 PM Philip Chen <philipchen@chromium.org> wrote:
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
>
> (no changes since v3)
>
> Changes in v3:
> - Fix when to call of_node_put() in ps8640_of_panel_on_aux_bus()
>
> Changes in v2:
> - Add of_node_put() calls in ps8640_of_panel_on_aux_bus()
> - Select DRM_DP_AUX_BUS for PS8640 driver in Kconfig
> - Replace _put_sync() with _put_sync_suspend() in ps8640_post_disable()

Not that it terribly matters, but I don't think the "put_sync" vs.
"put_sync_suspend" was in patch #2/2. It was in #1/2.


>  drivers/gpu/drm/bridge/Kconfig         |  1 +
>  drivers/gpu/drm/bridge/parade-ps8640.c | 51 ++++++++++++++++++++------
>  2 files changed, 40 insertions(+), 12 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
