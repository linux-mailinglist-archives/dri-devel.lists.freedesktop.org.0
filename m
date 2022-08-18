Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CA45989A1
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 19:08:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E6DE10E350;
	Thu, 18 Aug 2022 17:08:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9E1A10E432
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 17:08:10 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id u22so2010207plq.12
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 10:08:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=jaYV5KsXQx65EbpLx16Cuu54AXrpKHiBaSSwkmhU37Y=;
 b=h2DQtYdk2FZM1R4cmM53hafRVcjM5m2kBz6H14tr+AKnUsp4n71v9/dUgQ4GFt7ofc
 tJwACZ6HWWSQhDaRwTTNcuuab0whD8SSuNXOsq0h6NLyJQ7vLAHzY70oGEq0m9sTCVmL
 mFfHXVVZ8O8CZjUf9t0magAAM1BD9D61pJhR4vxA+3FDIOyu5l4+mNpNJwAarca/e7wD
 0cyg3mxKZEsLCAXAWdDwYG3NshPUurdbIsHEJqc35G4vxnD4gHHzV4nlaLBdYYVys9Je
 upDdrxjymgELNELY2tHLo2Mdmk4IGtAJogNfN+Fcd7wvfqObsE1KTSFGD4Qe3ltGcuw+
 eNjA==
X-Gm-Message-State: ACgBeo3ubF9opNxhhsSVjr/TFMReYU2OeHQGn9hzXw0dlnfYB9Ie3EKd
 mjoQQT7QaT7P/Pt/nMd3KA==
X-Google-Smtp-Source: AA6agR5IyIeVlir6NXvkgKrWHixgzbSgk0dAWywP6fp6Su42dma+hIglyfD4mZIBKyQfl8jkKqJkwQ==
X-Received: by 2002:a17:90b:4f83:b0:1f2:fe65:7f89 with SMTP id
 qe3-20020a17090b4f8300b001f2fe657f89mr9480421pjb.20.1660842490374; 
 Thu, 18 Aug 2022 10:08:10 -0700 (PDT)
Received: from robh.at.kernel.org ([2607:fb90:647:4ff2:3529:f8cd:d6cd:ac54])
 by smtp.gmail.com with ESMTPSA id
 h6-20020a170902680600b0015e8d4eb26esm1634138plk.184.2022.08.18.10.08.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 10:08:09 -0700 (PDT)
Received: (nullmailer pid 2040464 invoked by uid 1000);
 Thu, 18 Aug 2022 17:08:07 -0000
Date: Thu, 18 Aug 2022 11:08:07 -0600
From: Rob Herring <robh@kernel.org>
To: Dominik Haller <d.haller@phytec.de>
Subject: Re: [PATCH 1/2] dt-bindings: display: simple: Add EDT ETML1010G0DKA
 panel
Message-ID: <20220818170807.GE1978870-robh@kernel.org>
References: <20220818124518.42080-1-d.haller@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220818124518.42080-1-d.haller@phytec.de>
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
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org,
 upstream@phytec.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 18, 2022 at 02:45:17PM +0200, Dominik Haller wrote:
> Add binding for the Emerging Display Technology ETML1010G0DKA panel.
> It's a 10.1" WXGA (1280 x 800) LVDS panel with backlight and capacitive
> touch.
> 
> Signed-off-by: Dominik Haller <d.haller@phytec.de>
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>

