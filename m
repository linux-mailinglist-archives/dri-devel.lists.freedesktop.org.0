Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D40153A1207
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 13:06:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D78AE6E7D1;
	Wed,  9 Jun 2021 11:06:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2B7D6E7D1
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 11:06:07 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id n17so13985661ljg.2
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jun 2021 04:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=edtgaudOZI4aiobavQOBXkJeOQl3hnYi6MVEV9AQq84=;
 b=ayZr7B/HMgVlC0okdohGCei7GaktNCuF+JQVg9SStH5spMXSHL3MnoVsgcy0gRKsa4
 pmC0Ygl7wVqf8VNXIa61EBQp1XUesgEtUX6+OLbue18UVTP2J47q+hd2k9/FHzfOHm5z
 v4s5fWNXcE4/VZXgXHruumXCmX5k8xgRxNY7/zlcN6NTfr5/GC2s1LXU9dTDHZshBKAk
 fI5MiFrk14taaL/0EL1VY7ryUodwSdjXb05t+Qz7hHFcs3/UjKjSPPUYSd7DSJxsvaO/
 ziRY4ZuBQwp9SwRC/wZ2DbWTwttmeVHxRTQE75htG42JEINP5VSFO96y+WHJUC6jJULz
 mX/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=edtgaudOZI4aiobavQOBXkJeOQl3hnYi6MVEV9AQq84=;
 b=dYNarO7uecBRJVFB2nFJtzv3qtlqihRMa694zGY/xe6N05fnoPuPDF46guB7h3VrgD
 8FmK3493dOMs8NzuviO0zP+Rp6hdEfq/S4bBp9U3WK/8jmMM7kp5bWj61ralVFVWi+4q
 6+o9L2HwuL65KeJ04mZJff64oJVgPsm4JwSV7mWmIb0n8WxO0BOPrFExCdq8MIsw+UUe
 9FC05RdiEv+zavM8ubWBTzT4A6MFskGKneqpJA/MFHpn1sEbsAPMuaqcYFzrpX/55J37
 NfdIqC24FcqFZbvy4SprBNe0i4aOqSLWO0/8GVTucAzdjZt+ddrMuIf/vKW87SC1yYXY
 DHwA==
X-Gm-Message-State: AOAM5336rIOGhcc2s9QUaYEJnURBHXok39v5YXNKue+jz31tT4WVAPA0
 e81lyPVbkLH+fvCxmV8iWr5rJxcBs1eWBbkdZ9EGDA==
X-Google-Smtp-Source: ABdhPJzV9fO/orVbfpt+Pzff+qMI9NVxWDVHQAbz6au45P7iPdxzk0Z/yoL6wNzUHNhPVrsLwIbINGn7G3wSbYXVuXg=
X-Received: by 2002:a05:651c:1411:: with SMTP id
 u17mr11266433lje.438.1623236765968; 
 Wed, 09 Jun 2021 04:06:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210607170555.4006050-1-dianders@chromium.org>
 <20210607100234.v9.3.I98bf729846c37c4c143f6ab88b1e299280e2fe26@changeid>
In-Reply-To: <20210607100234.v9.3.I98bf729846c37c4c143f6ab88b1e299280e2fe26@changeid>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 9 Jun 2021 13:05:55 +0200
Message-ID: <CACRpkdZF_WgoJHExbw8R8ejVkWh7h32VfXQw8mfux_i2+sy-QA@mail.gmail.com>
Subject: Re: [PATCH v9 03/11] dt-bindings: drm/bridge: ti-sn65dsi86: Add
 aux-bus child
To: Douglas Anderson <dianders@chromium.org>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Sandeep Panda <spanda@codeaurora.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Clark <robdclark@chromium.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Thierry Reding <treding@nvidia.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 MSM <linux-arm-msm@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, Steev Klimaszewski <steev@kali.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 7, 2021 at 7:06 PM Douglas Anderson <dianders@chromium.org> wrote:

>  The patch ("dt-bindings: drm: Introduce the DP AUX bus") talks about
> how using the DP AUX bus is better than learning how to slice
> bread. Let's add it to the ti-sn65dsi86 bindings.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
