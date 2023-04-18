Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5596E6C67
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 20:48:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7227010E85A;
	Tue, 18 Apr 2023 18:48:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A23C10E85A
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 18:48:06 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id
 5614622812f47-38be107e467so394316b6e.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 11:48:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681843684; x=1684435684;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LlWfKESFE5Jk+2KzqRJVpsSQyFn8vQwUgqr78N8g9ds=;
 b=KrWOR1GGA0UVfoLDh3EOz4WwbX/ILPbfl3Yxn+CV9q0DTPLIz5skmq1TW3ofJPShEj
 I7pUNZ4Ht/7xbyEwJ0nkVrPrIOQM6OlPiGoCx2h7dbHk2nGbHfN1U0kNWUwYlwUCQMDj
 ZhT8Bv1+Uy/fz0oYU7hxcByzdh/2iwRk2Ek8jhhKYgCHkgzLZeHjt1cIG8gum87Vhtzw
 WoT0/6U373Yd06tNyGf1dfgyDMUDhBV5ZS3Yh+K0L7vlvO29P17Y4Xgh217d2LKxp4j7
 1cnsqR1OMFc6IO2GHJmovUMuS2TjLEnFgTldEe4MYVru0THZn5F7CdrwNS9c532uUDI2
 ST+Q==
X-Gm-Message-State: AAQBX9eBgyBjmJ2LRbgGPXZ2hUbjJy9LvUv5pVAKrn4vZEmOiultZ0Cz
 8uGTy/B7eEDpAhLJet4HCw==
X-Google-Smtp-Source: AKy350YAJi0Y2+ntAHVq86cev8s34h8Ch8vdGUqQJGWeGSgusRldbKrsc1B4GjvyhXGmu/oMCmTgKw==
X-Received: by 2002:a05:6808:1cb:b0:384:167d:736b with SMTP id
 x11-20020a05680801cb00b00384167d736bmr1569368oic.15.1681843684397; 
 Tue, 18 Apr 2023 11:48:04 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 o203-20020acaf0d4000000b0038c5c0d8a83sm2847613oih.33.2023.04.18.11.48.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 11:48:04 -0700 (PDT)
Received: (nullmailer pid 2110941 invoked by uid 1000);
 Tue, 18 Apr 2023 18:48:03 -0000
Date: Tue, 18 Apr 2023 13:48:03 -0500
From: Rob Herring <robh@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] dt-bindings: drm/bridge: ti-sn65dsi86: Fix the
 video-interfaces.yaml references
Message-ID: <168184368037.2110846.14889471836578329348.robh@kernel.org>
References: <20230412175800.2537812-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230412175800.2537812-1-festevam@gmail.com>
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
Cc: devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>,
 neil.armstrong@linaro.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 12 Apr 2023 14:58:00 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> video-interface.txt does not exist anymore, as it has been converted
> to video-interfaces.yaml.
> 
> Instead of referencing video-interfaces.yaml multiple times,
> pass it as a $ref to the schema.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
> Changes since v1:
> - Pass  video-interfaces.yaml as a $ref to the schema. (Rob)
> 
>  .../devicetree/bindings/display/bridge/ti,sn65dsi86.yaml    | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 

Applied, thanks!

