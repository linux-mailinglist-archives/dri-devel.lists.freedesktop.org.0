Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C89A94D0C17
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 00:33:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 849EF10E1B8;
	Mon,  7 Mar 2022 23:33:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com
 [209.85.161.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAF7510E1B8
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 23:33:01 +0000 (UTC)
Received: by mail-oo1-f50.google.com with SMTP id
 l24-20020a4a8558000000b00320d5a1f938so7264568ooh.8
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Mar 2022 15:33:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MMFvv+A8EpZWIQh+l11k5XPjimtRgswqGHQotND/lwY=;
 b=fwcrTZ3sc+FEZEcfEWg7yvc2qJXdJZfRHKm9bWzxRCkyEakWbHQY5DcuKd7BFCITXD
 p80hB5Erk2W8m5QpSocLlm0j2e/t2J/n+nl2Nvy8XK0cRSIBVPpvYJBiK4yGGC4kjiRC
 SaZSC9ndhtJlrIQKYUOjFMOAuktvEMW88YS1TJWoJVEwJhaxDrxRfXZDcyCcudGEd5jc
 nc6BE4L5TW6dnxI835SuR4JtC57GR2hHGNo4i5BF1fnLNwz1561I5VgJ8ySqsxsppxCe
 IkW/X9mk4oFrDcVTEQSeOmQh3f1uzJ2z6ksSoTMS0YJW7Fw6JaasW1rlSPuqrfP/oMIv
 pd6A==
X-Gm-Message-State: AOAM530nuh+mw1O8EGY7N5qJLpRWvzsqUv32VYABf3+mpOndDuCOy7F5
 ly3IPUeAiePHQEzKNo7g0J9B1+O07w==
X-Google-Smtp-Source: ABdhPJz9uuu/bb+uGVeQCedRpt1336Cmy3Vq6EP+ZSw5UR3pIqTaDOUphnklb82Hx9iiqwixa6i9ZA==
X-Received: by 2002:a05:6870:1682:b0:da:b3f:3255 with SMTP id
 j2-20020a056870168200b000da0b3f3255mr789618oae.261.1646695981151; 
 Mon, 07 Mar 2022 15:33:01 -0800 (PST)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 m5-20020a056870194500b000d9a0818925sm6106997oak.25.2022.03.07.15.32.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 15:33:00 -0800 (PST)
Received: (nullmailer pid 3472110 invoked by uid 1000);
 Mon, 07 Mar 2022 23:32:59 -0000
Date: Mon, 7 Mar 2022 17:32:59 -0600
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH V3 01/13] dt-bindings: display: bridge: icn6211: Document
 DSI data-lanes property
Message-ID: <YiaWK8QqwE0Wa6Pr@robh.at.kernel.org>
References: <20220304002508.75676-1-marex@denx.de>
 <20220304002508.75676-2-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220304002508.75676-2-marex@denx.de>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Robert Foss <robert.foss@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 04 Mar 2022 01:24:56 +0100, Marek Vasut wrote:
> It is necessary to specify the number of connected/used DSI data lanes when
> using the DSI input port of this bridge. Document the 'data-lanes' property
> of the DSI input port.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> To: dri-devel@lists.freedesktop.org
> ---
> V3: New patch
> ---
>  .../display/bridge/chipone,icn6211.yaml        | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
