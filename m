Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2350739922F
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 20:08:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8B016E523;
	Wed,  2 Jun 2021 18:08:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D1546E523
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 18:08:17 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id
 69-20020a9d0a4b0000b02902ed42f141e1so3277629otg.2
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 11:08:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VYMb7NvZcxWiw7PptXFVUegcgKe65wVgGhLojpylJWs=;
 b=oS110rct/f/UOiGLZEYlYCGae/7O/pqQ/2fbgQAtw9bvXlGJimxxDtKeQv5E5ZxoJg
 GkVpgWuoTDAzXh0wownWmO8TKcnOE2MeotmzLW+cqNKBSqBJK/Dm75BluJ2aSOUBvzhR
 L9rv7V4Qe43ZMHLH7LV3XCKtAW2jhM8IE5chAUT8bUaL5JxIwISC74HJfD9c3tEKKKiL
 1e8BdqKnlEZpgD7FGdgRMIqyeXsOcbOmdBf0SGbzrtKR5TN4rA9DWM5iobXICy30RK2j
 5d0dP6hbq0ajlb+/2YyM6qn6cqZBS+yU9pftaWqxIYwC3ZMd7QlzxHWtpzAChxQ27xT/
 /O7Q==
X-Gm-Message-State: AOAM532k0ZdKKqnlXWLsjVGddgV6+FgpIGcfYSYmO6LIpu0MToD6NSCn
 NWMmda7pJCLc3+9irvtmDA==
X-Google-Smtp-Source: ABdhPJzTkgLV2ppLE4o5GqJG1XKd/A0PrjZETTVCaL15qyF/JiWlCifrnxt/418lRvc/jrVNLNVqWw==
X-Received: by 2002:a9d:3644:: with SMTP id w62mr18937060otb.205.1622657296860; 
 Wed, 02 Jun 2021 11:08:16 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id x63sm127364oix.47.2021.06.02.11.08.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 11:08:16 -0700 (PDT)
Received: (nullmailer pid 3688828 invoked by uid 1000);
 Wed, 02 Jun 2021 18:08:14 -0000
Date: Wed, 2 Jun 2021 13:08:13 -0500
From: Rob Herring <robh@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v8 02/11] dt-bindings: drm: Introduce the DP AUX bus
Message-ID: <20210602180813.GA3688734@robh.at.kernel.org>
References: <20210525000159.3384921-1-dianders@chromium.org>
 <20210524165920.v8.2.Id3c048d22e72a9f90084a543b5b4e3f43bc9ab62@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210524165920.v8.2.Id3c048d22e72a9f90084a543b5b4e3f43bc9ab62@changeid>
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
Cc: robdclark@chromium.org, devicetree@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Steev Klimaszewski <steev@kali.org>, Thierry Reding <treding@nvidia.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 24 May 2021 17:01:50 -0700, Douglas Anderson wrote:
> We want to be able to list an eDP panel as a child of an eDP
> controller node to represent the fact that the panel is connected to
> the controller's DP AUX bus. Though the panel and the controller are
> connected in several ways, the DP AUX bus is the primary control
> interface between the two and thus makes the most sense to model in
> device tree hierarchy.
> 
> Listing a panel in this way makes it possible for the panel driver to
> easily get access to the DP AUX bus that it resides on, which can be
> useful to help in auto-detecting the panel and for turning on various
> bits.
> 
> NOTE: historically eDP panels were _not_ listed under their controller
> but were listed at the top level of the device tree. This will still
> be supported for backward compatibility (and while DP controller
> drivers are adapted to support the new DT syntax) but should be
> considered deprecated since there is no downside to listing the panel
> under the controller.
> 
> For now, the DP AUX bus bindings will only support an eDP panel
> underneath. It's possible it could be extended to allow having a DP
> connector under it in the future.
> 
> The idea for this bus's design was hashed out over IRC [1].
> 
> [1] https://people.freedesktop.org/~cbrill/dri-log/?channel=dri-devel&date=2021-05-11
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> My DT yaml-fu is still weak. If I did something stupid, please help me
> learn how to do this better!
> 
> NOTE: there is no "Example" in this bindings file. Yikes! This is
> because I wanted to keep this patch separate from the one that enables
> the first eDP controller. See the patch ("dt-bindings: drm/aux-bus:
> Add an example") for the example.
> 
> ALSO: if anyone else would like to be listed as a "Maintainer" in this
> file then please shout!
> 
> Changes in v8:
> - Separate DP AUX bus binding is new for v8.
> 
>  .../bindings/display/dp-aux-bus.yaml          | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/dp-aux-bus.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
