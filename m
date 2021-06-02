Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7126D399238
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 20:09:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B04076E222;
	Wed,  2 Jun 2021 18:09:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com
 [209.85.161.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8937A6E222
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 18:09:22 +0000 (UTC)
Received: by mail-oo1-f45.google.com with SMTP id
 p67-20020a4a2f460000b0290245cdf2d1a4so762761oop.8
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 11:09:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vnHybBgAjzt6wo1nMM/aqyo7w71bDWALGEv4VshDtlY=;
 b=nZ9zWloiLWEz3K2IsN07TZKtMXP/2zIxaFY/N79OaTulVCnZg/029+Qewkf51gFgvQ
 nyxklNpIH09W6Wu9gdNKm3Suike0NTSOjW/HSSMPi1XXWDkIn9F6b4Cb2XyypRYgiODv
 eopJc++e4y1eQuNBljmzHIHF7lp9PPqcL6Jp8UgbNNfniKjgkbCBvf2E+rRQsJiGhBM2
 TSTK0X2gMY1wkVrqct63iCyW7eiOH8PnxYXxaISbIbR1/CU38wYE6WLcakBJNzNse2UB
 ArTq8fw7bQMkw9dZjbWNQNEuNlr99fTBP3Np+UX0Kdm6mBUm8nFAX3s3WZ3TSD72VBvV
 s66Q==
X-Gm-Message-State: AOAM531JJGLuhJdos8a4bSXWspIZEy5v7bkHMx+Ga7x+VKVio7k27CVX
 um0SpN4VzLoG1MKpoMGcLg==
X-Google-Smtp-Source: ABdhPJxZrFYvBsKiokAIm8orQVdEC4gthZCw5wBjwvD4m3wbZOnOtOPgP+NjteblvT+gLVM/rOUUlQ==
X-Received: by 2002:a4a:ba87:: with SMTP id d7mr2875156oop.6.1622657361888;
 Wed, 02 Jun 2021 11:09:21 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id g24sm134583otp.17.2021.06.02.11.09.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 11:09:21 -0700 (PDT)
Received: (nullmailer pid 3690808 invoked by uid 1000);
 Wed, 02 Jun 2021 18:09:19 -0000
Date: Wed, 2 Jun 2021 13:09:19 -0500
From: Rob Herring <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v8 03/11] dt-bindings: drm/bridge: ti-sn65dsi86: Add
 aux-bus child
Message-ID: <20210602180919.GA3688973@robh.at.kernel.org>
References: <20210525000159.3384921-1-dianders@chromium.org>
 <20210524165920.v8.3.I98bf729846c37c4c143f6ab88b1e299280e2fe26@changeid>
 <CACRpkdZQ_4OMfUPZj1hXzRzqcfbhnrOHZ42NdP+giKbcz3=2VQ@mail.gmail.com>
 <20210602180609.GA3675041@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210602180609.GA3675041@robh.at.kernel.org>
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

On Wed, Jun 02, 2021 at 01:06:09PM -0500, Rob Herring wrote:
> On Fri, May 28, 2021 at 02:29:53AM +0200, Linus Walleij wrote:
> > On Tue, May 25, 2021 at 2:02 AM Douglas Anderson <dianders@chromium.org> wrote:
> > 
> > > The patch ("dt-bindings: drm: Introduce the DP AUX bus") talks about
> > > how using the DP AUX bus is better than learning how to slice
> > > bread. Let's add it to the ti-sn65dsi86 bindings.
> > >
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > (...)
> > >      description: See ../../pwm/pwm.yaml for description of the cell formats.>
> > 
> > Just use the full path:
> > /schemas/pwm/pwm.yaml
> 
> Really, just drop it. If we want have generic references and/or 
> descriptions for common properties, we should generate that in pretty 
> documentation (there are json-schema to doc tools already).

Ah, now I see this was just context, so no need for you to fix/change 
this here.

Rob

