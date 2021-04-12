Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF75A35D12F
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 21:38:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA70189C7F;
	Mon, 12 Apr 2021 19:38:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED7DD89C7F
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 19:38:17 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id n140so14580806oig.9
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 12:38:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+YGPC6j0Haf5jPJGvyQH9U1N8NEZhf+Gd+k7m/Egkc4=;
 b=Wg9w05yt8cApEB+0Re1CzdIKBVNA611iYGXTVSyBHp5AnhXMZEIcm9UDMHSEqX5W10
 5v8OM+9kVz72ZJQ0pFcKGMqlvvR8MlaB867x0/+RfoFCkfoBatJDSro8KteDrvPakcNH
 oz6oDO0ntfSMQp6cvJ8muDTi4vWqimXlhF35olY2W/elwIw7NAeN9C58zQfpK3d2r8lf
 +OZTwT1IYgvFbH7ziNQCMYN1eZ8jKeDhkgzdwW+CRYRMZhgHxJR1MScexCM8u9Wbitlm
 N/eVpwJ4q6xwaqpER0TLgc/jVHXz1a1Js6IB6d9m9rskqyTigy8nfHFEB6TEOH+1cZPl
 0NTw==
X-Gm-Message-State: AOAM531KcXprsBtq/zQuf6u91ccVndAeTWJveC6Uxvdtndayp1a2UxE8
 dIJV3uTdkMe8J3l5HfP4gg==
X-Google-Smtp-Source: ABdhPJwEYboQJdDHmtsifAJ0k0QLcvHMN4a2nDgSlZ2sVnTxA6x2CYbjGtVvUUODi9aPRJ1wH5BRZw==
X-Received: by 2002:a05:6808:57b:: with SMTP id
 j27mr559474oig.161.1618256297227; 
 Mon, 12 Apr 2021 12:38:17 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id j4sm2262581oom.11.2021.04.12.12.38.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 12:38:16 -0700 (PDT)
Received: (nullmailer pid 55658 invoked by uid 1000);
 Mon, 12 Apr 2021 19:38:14 -0000
Date: Mon, 12 Apr 2021 14:38:14 -0500
From: Rob Herring <robh@kernel.org>
To: Parshuram Thombare <pthombar@cadence.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: drm/bridge: MHDP8546 bridge binding
 changes for HDCP
Message-ID: <20210412193814.GA55613@robh.at.kernel.org>
References: <1618078449-28495-1-git-send-email-pthombar@cadence.com>
 <1618078508-30466-1-git-send-email-pthombar@cadence.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1618078508-30466-1-git-send-email-pthombar@cadence.com>
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
Cc: mparab@cadence.com, narmstrong@baylibre.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, robert.foss@linaro.org, kishon@ti.com,
 a.hajda@samsung.com, devicetree@vger.kernel.org, robh+dt@kernel.org,
 dri-devel@lists.freedesktop.org, sjakhade@cadence.com, nikhil.nd@ti.com,
 laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 10 Apr 2021 20:15:08 +0200, Parshuram Thombare wrote:
> Add binding changes for HDCP in the MHDP8546 DPI/DP bridge binding.
> 
> Signed-off-by: Parshuram Thombare <pthombar@cadence.com>
> ---
>  .../bindings/display/bridge/cdns,mhdp8546.yaml    | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
