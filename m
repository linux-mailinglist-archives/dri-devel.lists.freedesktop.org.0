Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F2E34F496
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 00:48:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB76389890;
	Tue, 30 Mar 2021 22:48:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BFB889890
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 22:48:15 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id
 68-20020a9d0f4a0000b02901b663e6258dso17085894ott.13
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 15:48:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IaMR0ltx7ptnQCNHvoOiMLdhMEHzKC2qN/dsOC0+3eA=;
 b=Mo3dmDhmaSh5MbyiiZl0z0mMM8g288/34TnZJpSP0cDgmdmQCkZicwsl0Osnra5+EU
 hwkcSo+ccJpcP3lyIWdZH6jL+FCFHwf2Yq8IUvP+NS1YioSpsHp9A2QMOQvEUEpoEprH
 nmxcMmZE9m+cQdIXyDUi3r9AuMGVN9WpplkmhC2rBO7voLmBdOsT+5aS3QuqOqLCEZ3f
 Mkmir+M9FTnBNJ5OczsXP1pScXcbGsnyEfdT8c/32yc+o1Ixk66rchPPkEEyKiz8UfPn
 zTP9HVbBasiOd4CCnE4qtL2KM0uQ/r+KaNvljX4fnddsz13XHNvaIaxAlUBDqTBGjytz
 UhWQ==
X-Gm-Message-State: AOAM531bVu7Vr961FlXwUjFIcSLViB8CNxcRPZAYhGXavW7BQk4gPHvr
 ULef0oBfoCe6ovvSSrTxFQ==
X-Google-Smtp-Source: ABdhPJwmf4yKUnURSQTM5qcp+OFjDTsKPh5zSRisI75/A+OiUBUHQNKKhEOK0c8V7a7wmgLLBEMyYg==
X-Received: by 2002:a9d:2f65:: with SMTP id h92mr128348otb.327.1617144494449; 
 Tue, 30 Mar 2021 15:48:14 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id y194sm60830ooa.19.2021.03.30.15.48.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 15:48:13 -0700 (PDT)
Received: (nullmailer pid 854303 invoked by uid 1000);
 Tue, 30 Mar 2021 22:48:12 -0000
Date: Tue, 30 Mar 2021 17:48:12 -0500
From: Rob Herring <robh@kernel.org>
To: Yunus Bas <y.bas@phytec.de>
Subject: Re: [PATCH 2/2] drm/panel: simple: Add support for EDT ETM0350G0DH6
 panel
Message-ID: <20210330224812.GA853122@robh.at.kernel.org>
References: <20210330070907.11587-1-y.bas@phytec.de>
 <20210330070907.11587-2-y.bas@phytec.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210330070907.11587-2-y.bas@phytec.de>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 30, 2021 at 09:09:07AM +0200, Yunus Bas wrote:
> From: Stefan Riedmueller <s.riedmueller@phytec.de>
> 
> This patch adds support for the EDT ETM0350G0DH6 3.5" (320x240) lcd
> panel to DRM simple panel driver.
> 
> Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
> Signed-off-by: Yunus Bas <y.bas@phytec.de>
> ---
>  .../bindings/display/panel/panel-simple.yaml  |  3 ++
>  drivers/gpu/drm/panel/panel-simple.c          | 29 +++++++++++++++++++
>  2 files changed, 32 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index 57be1fa39728..9a6b42f911d1 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -107,6 +107,9 @@ properties:
>        - dlc,dlc1010gig
>          # Emerging Display Technology Corp. 3.5" QVGA TFT LCD panel
>        - edt,et035012dm6
> +        # Emerging Display Technology Corp. 3.5" WVGA TFT LCD panel with
> +        # capacitive multitouch
> +      - edt,etm0350g0dh6

Alpha-numeric order.

>          # Emerging Display Technology Corp. 5.7" VGA TFT LCD panel
>        - edt,et057090dhu
>        - edt,et070080dh6
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
