Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09812654662
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 20:09:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B460110E11E;
	Thu, 22 Dec 2022 19:09:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF31310E11E
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 19:09:15 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id o127so3060258yba.5
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 11:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=naH8VNCcvr8oaaUGU2utglpwwOUdcgWFg7jd52xutEc=;
 b=eZzASLoRG2v8K/A3uqXWmG0IIZxKFhnnGfn1juMA+FzltvxNJVYrh+x4iLRgISVmu3
 XzIO86WG3RLPeBNfYd6acJznJ0V/NJSXDlyyaNFUeRwpnMxFBy+bpMCBumbXsBMU/rOY
 vX3HVmaohlG84B6+ad2xY76qgBXZ8zhmQUO1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=naH8VNCcvr8oaaUGU2utglpwwOUdcgWFg7jd52xutEc=;
 b=HT4b8WOH9m0EMXPpaGZSB2KlLR5ZcbJBXSpsaBBv7f4r5raLik4fbErkRkAsRAV0RM
 MfPRb7lMP7Hv3C/Q9SeD3zfwQELrqdLSdA8HCZDuGxZK8x6nRj2iyd5U9XPtgiHHVSMQ
 4R3vSDIUE1uPTvazeqlj/sI/9nbCPS7AII+p7JoGcxMpEwRfTtL2zfLBcmpTjq6U6NdP
 +hlsCRXYi1W2xHTvQgi0nIrG2uwTqmKhZ5FSGUY+Aw1bkvC7SNY6pv31FB0E21ye9csL
 WEbz8cXxPigcrKnoWZ5clThVqt4V1BZjYifiCjXj4ERiVMfVyRrfxTRe2DBIBd2agX33
 cxRw==
X-Gm-Message-State: AFqh2koyhjFIiDAkSpisiQTCdGUjTWmg7Osn4t+EG/DGJK467+xld2oa
 as8OnRLHlSiv8F9S3+fTfYfJLN0A/oM4lA01upZ9cw==
X-Google-Smtp-Source: AMrXdXti6ZhBAIr+xXhYnv5OIM7hPq/SOeHdB+cYqwd9AiwfHkhtdbR7Uk3jqcdtTDYO0wDePZFsequ0dGBvSq5HS9M=
X-Received: by 2002:a25:5f49:0:b0:6fc:f894:91f7 with SMTP id
 h9-20020a255f49000000b006fcf89491f7mr805700ybm.475.1671736154720; Thu, 22 Dec
 2022 11:09:14 -0800 (PST)
MIME-Version: 1.0
References: <20221222185213.3773336-1-dave.stevenson@raspberrypi.com>
In-Reply-To: <20221222185213.3773336-1-dave.stevenson@raspberrypi.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Fri, 23 Dec 2022 00:39:03 +0530
Message-ID: <CAMty3ZDPrMz6W_3UH5mnGTmF5rWV1JTFHDFDA=_hXKPDZ4pw9A@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: panel: Set pre_enable_prev_first from
 drmm_panel_bridge_add
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 23, 2022 at 12:22 AM Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> Commit 5ea6b1702781 ("drm/panel: Add prepare_prev_first flag to drm_panel")
> added code to copy prepare_prev_first from drm_panel to pre_enable_prev_first
> in drm_bridge when called through devm_panel_bridge_add, but
> missed drmm_panel_bridge_add.
>
> Add the same code to drmm_panel_bridge_add.
>
> Fixes: 5ea6b1702781 ("drm/panel: Add prepare_prev_first flag to drm_panel")
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---

Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
