Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA7714A7DB
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2020 17:13:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8FBB6E12C;
	Mon, 27 Jan 2020 16:13:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B71F6E12C
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2020 16:13:34 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id g15so8914633otp.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2020 08:13:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JNhU3ozUFErUx+4UTT5ltSBuP2mFt3zi7r84jg0CNoc=;
 b=enkbwbX38h/tsak4kkjjywStkRCEDHfyLlojSklzb3xJ2AMOIB4EiK2PtLgBbYOsiO
 WO2+RnBzea2OTusyhiFJmec3NN7lc5lDZiGrykkuvOVeekzbS9hq5o4h6qJo89buk2gD
 skhGU0MBtQA6skdJakb5WC0a02zr1drNTSdJYUQJg+Y9zInkOG/glsdI0mwBwG94lYfs
 W5n7a5xQWtgYTDvvZRWUyhi1h4iEGJi2eKX1kH6KYvIKcZUuI4Tcz6yWfFBfaEuI1snl
 tbKxyVr9Ny/S7gwCut3++bsyG/8asqN0mSOu5ixz6VSwwM1VxmYoPYE6SFWTuZxpn4Zg
 NSvg==
X-Gm-Message-State: APjAAAWddtrb2C4QozPo8Rg7+FT3LLtH9SUxCud6jYvFJDAAxRru/Kx4
 so0tBiLOcSgSwTnzXjxQ/A==
X-Google-Smtp-Source: APXvYqx+crNryziVOs9TPZ584wS5oJiSpLsXp+K6NXnR1XqPGiQwSyxOkcd4SFNU/i5Tt2bP+RwJrw==
X-Received: by 2002:a9d:7305:: with SMTP id e5mr12473441otk.64.1580141613803; 
 Mon, 27 Jan 2020 08:13:33 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id e6sm5649617otl.12.2020.01.27.08.13.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2020 08:13:33 -0800 (PST)
Received: (nullmailer pid 20252 invoked by uid 1000);
 Mon, 27 Jan 2020 16:13:31 -0000
Date: Mon, 27 Jan 2020 10:13:31 -0600
From: Rob Herring <robh@kernel.org>
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Subject: Re: [PATCH v3] dt-bindings: convert rockchip-drm.txt to
 rockchip-drm.yaml
Message-ID: <20200127161331.GA20191@bogus>
References: <20200121154314.3444-1-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200121154314.3444-1-dafna.hirschfeld@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 dafna.hirschfeld@collabora.com, airlied@linux.ie, dafna3@gmail.com,
 hjc@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, helen.koike@collabora.com,
 robh+dt@kernel.org, kernel@collabora.com, ezequiel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 21 Jan 2020 16:43:14 +0100, Dafna Hirschfeld wrote:
> convert the binding file rockchip-drm.txt to yaml format.
> This was tested and verified on ARM and ARM64 with:
> make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml
> make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
> the detail of the ARM tests:
> export ARCH=arm KBUILD_OUTPUT=../kbuild/arm-test-dtc/ CROSS_COMPILE=arm-linux-gnueabi-
> make menuconfig # set rockchip system
> make clean
> make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml
> make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml
> 
> the detail of the ARM64 tests:
> export ARCH=arm64 KBUILD_OUTPUT=../kbuild/arm64-test-dtc/ CROSS_COMPILE=aarch64-linux-gnu-
> make menuconfig # set rockchip system
> make clean
> make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml
> make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml
> 
> 
> Changes since v1:
> - fixed worng sign-off
> - fixed the path of the $id property to be the path of the yaml file
> Changes since v2:
> - add a missing ">" sign in maintainers list
> - change the licens to GPL-2.0-only
> - add "additionalProperties: false"
> - change the commit message to conform that it was tested on both ARM and ARM64
> 
> 
>  .../display/rockchip/rockchip-drm.txt         | 19 ---------
>  .../display/rockchip/rockchip-drm.yaml        | 40 +++++++++++++++++++
>  2 files changed, 40 insertions(+), 19 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip-drm.txt
>  create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
