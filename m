Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD8F39922A
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 20:06:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E58826E02A;
	Wed,  2 Jun 2021 18:06:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com
 [209.85.161.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17DA06E02A
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 18:06:12 +0000 (UTC)
Received: by mail-oo1-f49.google.com with SMTP id
 67-20020a4a01460000b0290245b81f6261so760679oor.6
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 11:06:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OXQfC+XKgJEeb6dM9eMgXu59hvMyoJzOchI782JgqsE=;
 b=VyCMOYq4Xi9uR4vweeoFPqO1yL2VCdb/PK+MPZxjp6BKKkPKo4eAK0v2f8NkaB5ZWq
 h+ExGocnDFxRoUzCt+XU5miD5MzXs87UZJdXU+s05MTHR//dg08DYff/3rK3+Y+x/7UQ
 mc/zy/nAmi+Fmdx8HCmACNPyD2zDYI3Ackc4uxpeAmKtMo2fPCGJRc7AlATdMdLm0Qmt
 9BzcuiH6X3M925/mRI8ORZWE//obT2m/MO8ww7F2JKK2+XGXuY8AJrCUxwlDznbj6RSG
 qBPIU8kW+wmRAL5sSIaIQ4lOdpkUUkGYyiqw+XNscNgkrrslSDBJgbV4IdDS4Ccu5xcz
 T5pg==
X-Gm-Message-State: AOAM53247O+IistuonhsTWmss/gjB30f7v5f+M1nfCVQNOZL3vJeq21p
 fTzMzWT6IpMmVKU5kHE+GA==
X-Google-Smtp-Source: ABdhPJwam6nqA2q4bi7B4qoK5vD5zo/AYazGpsK2qGbDlzHhFnQ6k8GumVkSvq5b7zM8n6ym5eulUA==
X-Received: by 2002:a4a:e945:: with SMTP id v5mr26155249ood.64.1622657171175; 
 Wed, 02 Jun 2021 11:06:11 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 94sm137834otj.33.2021.06.02.11.06.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 11:06:10 -0700 (PDT)
Received: (nullmailer pid 3685093 invoked by uid 1000);
 Wed, 02 Jun 2021 18:06:09 -0000
Date: Wed, 2 Jun 2021 13:06:09 -0500
From: Rob Herring <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v8 03/11] dt-bindings: drm/bridge: ti-sn65dsi86: Add
 aux-bus child
Message-ID: <20210602180609.GA3675041@robh.at.kernel.org>
References: <20210525000159.3384921-1-dianders@chromium.org>
 <20210524165920.v8.3.I98bf729846c37c4c143f6ab88b1e299280e2fe26@changeid>
 <CACRpkdZQ_4OMfUPZj1hXzRzqcfbhnrOHZ42NdP+giKbcz3=2VQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZQ_4OMfUPZj1hXzRzqcfbhnrOHZ42NdP+giKbcz3=2VQ@mail.gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, MSM <linux-arm-msm@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>, Steev Klimaszewski <steev@kali.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Sandeep Panda <spanda@codeaurora.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Stephen Boyd <swboyd@chromium.org>, Thierry Reding <treding@nvidia.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 28, 2021 at 02:29:53AM +0200, Linus Walleij wrote:
> On Tue, May 25, 2021 at 2:02 AM Douglas Anderson <dianders@chromium.org> wrote:
> 
> > The patch ("dt-bindings: drm: Introduce the DP AUX bus") talks about
> > how using the DP AUX bus is better than learning how to slice
> > bread. Let's add it to the ti-sn65dsi86 bindings.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> (...)
> >      description: See ../../pwm/pwm.yaml for description of the cell formats.>
> 
> Just use the full path:
> /schemas/pwm/pwm.yaml

Really, just drop it. If we want have generic references and/or 
descriptions for common properties, we should generate that in pretty 
documentation (there are json-schema to doc tools already).

> 
> > +  aux-bus:
> > +    $ref: ../dp-aux-bus.yaml#
> 
> Use the full path. (Same method as above)

+1

> This removes the need for ../../... ....
> 
> You do it here:
> 
> >    ports:
> >      $ref: /schemas/graph.yaml#/properties/ports
> 
> Other than that I think it looks all right!
> 
> Yours,
> Linus Walleij
