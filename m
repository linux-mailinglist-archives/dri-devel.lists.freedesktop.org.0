Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CD342F433
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 15:49:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA5576E2EF;
	Fri, 15 Oct 2021 13:49:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38D786E2EF
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 13:49:23 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id
 e59-20020a9d01c1000000b00552c91a99f7so3570598ote.6
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 06:49:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Emypu18e0IXK8TFQk7ooPj168yx7xW+uYOA6VkCV8JE=;
 b=YWi7JMVKOQLCxwe9LRHFtWyoSvlcsYyn233z5mx4gALPuYLascppIuJBcA2W4FNoE3
 JcveBKUnl4SwCga8Mhv2KDtM9ojZpa0nuixgHDrkw/MrVzP0f7OrxD0WfTrjXuiwndP9
 mKImZBvvjFhyLKdW1edwbfDTdoGzRaqR3Ot951EzOBK2a+OuLQuOF2eLTCISy4evONGV
 l8Wsb8+madq7I6RliabKRUv9sqX1gsg1Ae5tuJYlx+AQId1wWKfmO0rRAr7SPAOYaTxe
 cO45LkQt93pq7zrO+JdZ7lRygf7YvNLCHMR5Ll0DPrKKLLWkfFWPdMalOQn9yg9mUWrr
 5QHQ==
X-Gm-Message-State: AOAM533yqB7BJqSsxCa0VyLM6yHvQML753dL/AvJrcORkYF9+nronLlS
 nC+z7c5FPeaWV0xgkl2IqQ==
X-Google-Smtp-Source: ABdhPJxUclsuv2sYJlz+mVj3QUqsf0dR1i3duEqsYs1RlI/V8CQynEpT+T1LpMNFTS8H1xYbHJ7fjQ==
X-Received: by 2002:a9d:19e3:: with SMTP id k90mr7958187otk.99.1634305762209; 
 Fri, 15 Oct 2021 06:49:22 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id p14sm967286oov.0.2021.10.15.06.49.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 06:49:21 -0700 (PDT)
Received: (nullmailer pid 1423603 invoked by uid 1000);
 Fri, 15 Oct 2021 13:49:20 -0000
Date: Fri, 15 Oct 2021 08:49:20 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: airlied@linux.ie, seanpaul@chromium.org, robh+dt@kernel.org,
 devicetree@vger.kernel.org, daniel@ffwll.ch, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] dt-bindings: display/bridge: ptn3460: Convert to YAML
 binding
Message-ID: <YWmG4KddWr4lo6kY@robh.at.kernel.org>
References: <20211007075822.62411-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211007075822.62411-1-angelogioacchino.delregno@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 07 Oct 2021 09:58:22 +0200, AngeloGioacchino Del Regno wrote:
> Convert the NXP PTN3460 eDP to LVDS bridge documentation to YAML.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/display/bridge/nxp,ptn3460.yaml  | 106 ++++++++++++++++++
>  .../bindings/display/bridge/ptn3460.txt       |  39 -------
>  2 files changed, 106 insertions(+), 39 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/nxp,ptn3460.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/ptn3460.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
