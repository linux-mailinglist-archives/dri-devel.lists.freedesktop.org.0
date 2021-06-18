Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B2B3AD423
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 23:07:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C791A6EAAC;
	Fri, 18 Jun 2021 21:06:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com
 [209.85.161.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D38346EAAC
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jun 2021 21:06:58 +0000 (UTC)
Received: by mail-oo1-f51.google.com with SMTP id
 q20-20020a4a6c140000b029024915d1bd7cso2767942ooc.12
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jun 2021 14:06:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YtiOyReou+pF/1rfufORAr+idx/wS1LrrDO07j6J4ZY=;
 b=Pu2tah7vL/c0IUWcD36L4m7z+eHQfbdCplaKFVGby2qQ90KPKLVmwfOeoM+wBsRZJo
 9RA2IJQY5DA3FbUGprLUho446NTpuqdPzzCthQOgEBu3+iyQnlM/K0wk8phMvv6+ynCK
 keeNLWm2jUDWu9eBCMyDyo/2Vfi/M961b8xaNryeCRUtsVeGZ5MProMEJD6ONIB1wCC0
 NdYJ2QvGcJaTvAN5mcV3Wk/bcom3Gloq/0AceFl++q/L67cH5BBMSfMeJAbPn5svPRvu
 mMAT29xk6HmJBNsEPyYNnUQyj1/I67XldVBNNs9g5jt+iwbS7/Q8fpxWai6Yr4wFa4ya
 XutQ==
X-Gm-Message-State: AOAM5338Y2G8D1GM8IIjpWUPdV82IHPY/Hd12J5O1YvmKY8QpAM8y01y
 X1a31Za3qjAg/SMNUl3bTQ==
X-Google-Smtp-Source: ABdhPJxMCbp/u0TP+JyeZh7NKeN4BrawJlBzXSydp60BTZbERp/w/KlhgnJ1kT4nGA+auxBWoWyDRw==
X-Received: by 2002:a4a:cb06:: with SMTP id r6mr10657436ooq.15.1624050418226; 
 Fri, 18 Jun 2021 14:06:58 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id t39sm2014170ooi.42.2021.06.18.14.06.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 14:06:57 -0700 (PDT)
Received: (nullmailer pid 2874848 invoked by uid 1000);
 Fri, 18 Jun 2021 21:06:54 -0000
Date: Fri, 18 Jun 2021 15:06:54 -0600
From: Rob Herring <robh@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v1 3/4] dt-bindings: arm: fsl: add SKOV imx6q and imx6dl
 based boards
Message-ID: <20210618210654.GA2874818@robh.at.kernel.org>
References: <20210609121050.18715-1-o.rempel@pengutronix.de>
 <20210609121050.18715-4-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210609121050.18715-4-o.rempel@pengutronix.de>
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
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 David Airlie <airlied@linux.ie>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, soc@kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 09 Jun 2021 14:10:49 +0200, Oleksij Rempel wrote:
> Add SKOV imx6q/dl LT2, LT6 and mi1010ait-1cp1 boards.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
