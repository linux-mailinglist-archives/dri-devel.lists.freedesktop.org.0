Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4953D39923D
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 20:10:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87DDA6E48F;
	Wed,  2 Jun 2021 18:10:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC88D6E48F
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 18:10:42 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id x15so3492640oic.13
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 11:10:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eEPJgXDdFGgpykP7+AfDN274Zwe0NtArK2e1pu+6hwE=;
 b=K+Hi3YCaimPnBV+qTgvbUAXEW+HtFpVwni05prXEzoaTsZyh9A2UrI4JgNaR4PBA5W
 sduYsrzrIUA8OYJfYObanTXH4YRugLPnRjeSlP285U5aox2ARijErYCY4XRerc75vj1a
 DVnEDmAHqwU6NLk8ChiIBEYWPzsBPgayAQ0dmcw1lHQ7sn56N0WjgdJgSWZtuui0heV1
 WI2kpJqB4cFZvlUdyQTls/oo/AFUQv9YY8TtFQtnPcGer3V0ornVRhnojGcmePWSli9Y
 iY496dmyNuluomul5qGR1/vRjDSipqOV93osvFCgIggiLzab36lFjb9OnihtQ9yXQ3hl
 E0XA==
X-Gm-Message-State: AOAM533tjEwunKMYEgatXpfMyREyTeT7nN6TkwQF/VukF3sri4RHtaVI
 iLHIPW87IwL4qfYPqkM/0Q==
X-Google-Smtp-Source: ABdhPJwxQY3B5CeWKe9JjY2bJkxq1L74q0ZXWfcblHLwtfe7tcidYtu2cMFA4TdvQqfCEVjJEWaCVw==
X-Received: by 2002:a05:6808:a97:: with SMTP id
 q23mr6733569oij.39.1622657441869; 
 Wed, 02 Jun 2021 11:10:41 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id q63sm133503oic.15.2021.06.02.11.10.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 11:10:41 -0700 (PDT)
Received: (nullmailer pid 3693279 invoked by uid 1000);
 Wed, 02 Jun 2021 18:10:39 -0000
Date: Wed, 2 Jun 2021 13:10:39 -0500
From: Rob Herring <robh@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v8 03/11] dt-bindings: drm/bridge: ti-sn65dsi86: Add
 aux-bus child
Message-ID: <20210602181039.GA3692772@robh.at.kernel.org>
References: <20210525000159.3384921-1-dianders@chromium.org>
 <20210524165920.v8.3.I98bf729846c37c4c143f6ab88b1e299280e2fe26@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210524165920.v8.3.I98bf729846c37c4c143f6ab88b1e299280e2fe26@changeid>
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
 Sandeep Panda <spanda@codeaurora.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, robdclark@chromium.org,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Thierry Reding <treding@nvidia.com>, devicetree@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Steev Klimaszewski <steev@kali.org>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 24 May 2021 17:01:51 -0700, Douglas Anderson wrote:
> The patch ("dt-bindings: drm: Introduce the DP AUX bus") talks about
> how using the DP AUX bus is better than learning how to slice
> bread. Let's add it to the ti-sn65dsi86 bindings.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> Changes in v8:
> - ti-sn65dsi86 references the new aux bus bindings.
> 
> Changes in v7:
> - ti-sn65dsi86: Add aux-bus child patch new for v7.
> 
>  .../bindings/display/bridge/ti,sn65dsi86.yaml | 20 ++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 

With the path updated,

Reviewed-by: Rob Herring <robh@kernel.org>
