Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 864424299F7
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 01:45:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7100289E3B;
	Mon, 11 Oct 2021 23:44:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 726DE89E3B
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Oct 2021 23:44:55 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id
 g62-20020a9d2dc4000000b0054752cfbc59so23763710otb.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Oct 2021 16:44:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dq9+YkMx0GHCeJWvTqnKsmwOPTk7sjGTA6ATq7IokFA=;
 b=0JvxIhOlR9vsR4N1A+EtAxLNYAcVMo8fHHid3j9tjrLnKkE/+fKpR940Tyjet1KnC8
 LhU5apm0N4dDTXwVY7LYmaIoPjzLJjKpo8K4n4cCCf6ZN0QuOoc0pWsvhyZGrRDDMcye
 chZDz2Mmku4Oj076xX/Ll2NAKQWeHPWRk9AsJGi6ilig65sKyic4o/SpaSY4LT9Wxmec
 zCnGN351PNJu6GQpm2YoopdCjKGx6g12/8A+6AHgE5CFc11rrmYi2KBwVK7pNXhahWX1
 8ZmJVEoJAdrv21Q/hqEvjflOVtfnwIzY7wtiMsUfFHMJhwAFF4brx5rB2xf99w1gTjH7
 SjvQ==
X-Gm-Message-State: AOAM531y+SvtSuQs+YM6Umx5Ll3CVItPiz+GOzFmH/tZMjl4+C99csMu
 fTsVkCcnRO5DkD4zNC0cug==
X-Google-Smtp-Source: ABdhPJwdGAZLwdNaLgCvThYshN0fgEkSQ3hr7M+UCK9PDK4rr/2YteoPrw9SV/cr4euuY0pIsDg4ZQ==
X-Received: by 2002:a9d:7114:: with SMTP id n20mr14449501otj.25.1633995894622; 
 Mon, 11 Oct 2021 16:44:54 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id r4sm2060017oti.27.2021.10.11.16.44.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 16:44:53 -0700 (PDT)
Received: (nullmailer pid 1392392 invoked by uid 1000);
 Mon, 11 Oct 2021 23:44:53 -0000
Date: Mon, 11 Oct 2021 18:44:53 -0500
From: Rob Herring <robh@kernel.org>
To: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
 linux-phy@lists.infradead.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v4 1/7] dt-bindings: mediatek,dpintf: Add DP_INTF binding
Message-ID: <YWTMdewWCNCZy+UE@robh.at.kernel.org>
References: <20211011094624.3416029-1-msp@baylibre.com>
 <20211011094624.3416029-2-msp@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211011094624.3416029-2-msp@baylibre.com>
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

On Mon, 11 Oct 2021 11:46:18 +0200, Markus Schneider-Pargmann wrote:
> DP_INTF is a similar functional block to mediatek,dpi but is different
> in that it serves the DisplayPort controller on mediatek SoCs and uses
> different clocks. Therefore this patch creates a new binding file for
> this functional block.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---
> 
> Notes:
>     Changes v3 -> v4:
>     - Fixed clock names in the example as the clock patch series is merged into
>       next now
>     - Add missing ports decleration to the example
> 
>     Changes v1 -> v2:
>     - Move the devicetree binding from mediatek,dpi into its own binding file.
> 
>  .../display/mediatek/mediatek,dpintf.yaml     | 86 +++++++++++++++++++
>  1 file changed, 86 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dpintf.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
