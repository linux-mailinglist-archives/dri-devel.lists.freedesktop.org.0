Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDA343C012
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 04:37:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6423F6E505;
	Wed, 27 Oct 2021 02:37:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB7FE6E505
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 02:37:18 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id
 w12-20020a056830410c00b0054e7ceecd88so1610681ott.2
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 19:37:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=u92E0EpFtZ3++MIktilNtSGwwznQbIIm/fPoIeal4/4=;
 b=OqxTYZCZv9h1PixFawCE2HvGrnzWoDoR1KSdkWKAR+lYlhpz3bC7xMg6fAU6xEqVOZ
 A4pi/79gXeNttpVyCoi0+dnATcWOFEmOBEadq05xqFzT2ltL4/xY1imkxTwWNdY9vcRh
 9FfpX/fWOPmVrXAStG5QgmUdlAIOclVkRKhHQqKPv7UZPU9Z0AgDX5LjKmz/kPUeNESq
 zbUdegyAfPLsUKzd/tVhQ1xshIvoQxmSXvYwytQeh/za82NcOX/423o6WITiIXiP+Jrz
 EOrde5kP4VHcc1pbp3mhJXn3T+q9aj9qjMWqbfFfvrP/W4icMAtVtQvzMN78iNfvNvAU
 nzgA==
X-Gm-Message-State: AOAM533j0krN9bbQpURW8aTUjjonlpQHYr8ItPvYBefI9OZb9JW8kifS
 NvX9Nk/W7ys5dJcEojQrqQ==
X-Google-Smtp-Source: ABdhPJxlQCgNJcOdH6QHUyXjxReaOauicUSabSwGKhvr1usEJl3GquscqQh/iQLcY1OZKw5v4FmV+g==
X-Received: by 2002:a05:6830:101:: with SMTP id
 i1mr22304080otp.107.1635302237996; 
 Tue, 26 Oct 2021 19:37:17 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id bp21sm5787606oib.31.2021.10.26.19.37.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 19:37:17 -0700 (PDT)
Received: (nullmailer pid 3846294 invoked by uid 1000);
 Wed, 27 Oct 2021 02:37:16 -0000
Date: Tue, 26 Oct 2021 21:37:16 -0500
From: Rob Herring <robh@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v3 3/4] dt-bindings: drm/bridge: ti-sn65dsi83: Add vcc
 supply bindings
Message-ID: <YXi7XKhYWe4f+SJW@robh.at.kernel.org>
References: <20211019065239.969988-1-alexander.stein@ew.tq-group.com>
 <20211019065239.969988-4-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211019065239.969988-4-alexander.stein@ew.tq-group.com>
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

On Tue, 19 Oct 2021 08:52:38 +0200, Alexander Stein wrote:
> Add a VCC regulator which needs to be enabled before the EN pin is
> released.
> 
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  .../devicetree/bindings/display/bridge/ti,sn65dsi83.yaml      | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
