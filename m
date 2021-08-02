Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0761C3DE293
	for <lists+dri-devel@lfdr.de>; Tue,  3 Aug 2021 00:37:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DFC589FBC;
	Mon,  2 Aug 2021 22:37:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com
 [209.85.166.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1127F89FBC
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Aug 2021 22:37:41 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id j18so14893277ile.8
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Aug 2021 15:37:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iusIdSGsnA+AqpZNVzpAfNq8YSbNcjn9LXrv0H+wAUU=;
 b=CQq5e3Um4db3UZZUzT2L5UVRoJy/QcIi3pp/TY2b5MA0KZOZSBco1Ne90KoT7GHlE6
 HG0/vZgr1q5CjIW4jxZJEg3rck4rwtMOQLSGGb78KlCPPZeGLJJNhNm4ZBcrQZGhWmUC
 YAYV7kGdiesazgZn206m2LG8NV8/vk74NgRKgQN6hEGjL3+zG9r0wJgxb0XynwzX66MQ
 vj2C5LMX6J6PEp6wCRKS2k3FmsrwxPqYvwG0D7NWb35+SimkCW8iIi7ww+eIkvEhLMkd
 hw0z9Sok9fNv5fNLkwjPQXXemeeYhsGJ9E17mJ7toqEbTuQRHk3yPgYHMPWw+t55rQFk
 yVgw==
X-Gm-Message-State: AOAM532IFnglXTi32shoKwA+eljtI3KoZqq3RO0QFdNZDIvM0t1yQy3v
 v2JnZTJgKaISjRi1lfmD3Q==
X-Google-Smtp-Source: ABdhPJyjyx97xDi/IQCrhvK6Hz2bT29AuvbNyRbkqJgBgbWqakmyYMijP5rtJPtfMULEWh9whclvkg==
X-Received: by 2002:a05:6e02:5cf:: with SMTP id
 l15mr4004268ils.90.1627943860470; 
 Mon, 02 Aug 2021 15:37:40 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id z10sm6305530iln.8.2021.08.02.15.37.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 15:37:39 -0700 (PDT)
Received: (nullmailer pid 1750591 invoked by uid 1000);
 Mon, 02 Aug 2021 22:37:38 -0000
Date: Mon, 2 Aug 2021 16:37:38 -0600
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [RESEND] [PATCH v2 1/2] dt-bindings: display: bridge: Add
 binding for R-Car MIPI DSI/CSI-2 TX
Message-ID: <YQhzsjCheZByFHyS@robh.at.kernel.org>
References: <20210623135639.17125-1-laurent.pinchart+renesas@ideasonboard.com>
 <YQGFP/cFoSksPyn+@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YQGFP/cFoSksPyn+@pendragon.ideasonboard.com>
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

On Wed, Jul 28, 2021 at 07:26:39PM +0300, Laurent Pinchart wrote:
> The R-Car MIPI DSI/CSI-2 TX is embedded in the Renesas R-Car V3U SoC. It
> can operate in either DSI or CSI-2 mode, with up to four data lanes.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
> Looks like I forgot to CC the devicetree mailing list and Rob Herring on
> the first try. Resending, sorry about that.
> ---
>  .../display/bridge/renesas,dsi-csi2-tx.yaml   | 118 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 119 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml

Reviewed-by: Rob Herring <robh@kernel.org>

BTW, b4 doesn't like your message-id.
