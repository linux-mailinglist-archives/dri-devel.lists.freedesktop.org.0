Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD281CE8BE
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 01:04:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FA916E05F;
	Mon, 11 May 2020 23:03:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E21B6E05F
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 23:03:57 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id 63so1627983oto.8
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 16:03:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6abpqm2P83o/3f2rBgdXnNsVGvBaUGfzdzSfP0B8UIk=;
 b=cM3vuAjWIs8ayquAyDSktxHHRSz5RlWi/X0hAVcA1dXo5TS46oO+HIsorN7T/Y6sxF
 dK0yGjJDYimMSf+cktD4vNR73hc/VC4NbGkO1mPYe+yYH3GjsOf/NBXcLNOyBX2QWzzc
 KSL3OrPOJ4VXAPo+HKTBikDTPV1Dd0cIqh++XNOlL9TSfc2n+/aPJFKRkyEyFuYzislb
 YNEOlBqTJ8Bk6yML4hAiTD3Mf/kn6vzaTb1z8lM5fYiRKNLBNt6+GNuAIxs3NjeHl0qa
 nL23PYswbmlal9126keNWEzlShh/TcBraGLwwH/dnURoC3o23ZRF7YcKY4uGNPA1L8+p
 va3w==
X-Gm-Message-State: AGi0PuaJY+qB3n8wV1SPqcdk4my9UWrhhc7P9UxKPjXuz1j4Hymq9qUK
 CGLGSHPuxwH1zWVfVBsxpg==
X-Google-Smtp-Source: APiQypINK2hUBK6KwHLih5ZKpKToDjfgG8X1oTxLFmefw0CgowPlGu76ORlvr9A9Om6WR7IoSO5zNg==
X-Received: by 2002:a9d:70d1:: with SMTP id w17mr14711341otj.67.1589238236334; 
 Mon, 11 May 2020 16:03:56 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id e10sm5007114oie.18.2020.05.11.16.03.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 16:03:55 -0700 (PDT)
Received: (nullmailer pid 18679 invoked by uid 1000);
 Mon, 11 May 2020 23:03:54 -0000
Date: Mon, 11 May 2020 18:03:54 -0500
From: Rob Herring <robh@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 7/8] dt-bindings: serial: Convert ingenic, uart.txt to YAML
Message-ID: <20200511230354.GA18582@bogus>
References: <20200426185856.38826-1-paul@crapouillou.net>
 <20200426185856.38826-7-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200426185856.38826-7-paul@crapouillou.net>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 =?utf-8?B?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>,
 linux-gpio@vger.kernel.org, od@zcrc.me, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 26 Apr 2020 20:58:55 +0200, Paul Cercueil wrote:
> Convert the ingenic,uart.txt to a new ingenic,uart.yaml file.
> 
> A few things were changed in the process:
> - the dmas and dma-names properties are now required.
> - the ingenic,jz4770-uart and ingenic,jz4775-uart compatible strings now
>   require the ingenic,jz4760-uart string to be used as fallback, since
>   the hardware is compatible.
> - the ingenic,jz4725b-uart compatible string was added, with a fallback
>   to ingenic,jz4740-uart.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  .../bindings/serial/ingenic,uart.txt          | 28 ------
>  .../bindings/serial/ingenic,uart.yaml         | 94 +++++++++++++++++++
>  2 files changed, 94 insertions(+), 28 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/serial/ingenic,uart.txt
>  create mode 100644 Documentation/devicetree/bindings/serial/ingenic,uart.yaml
> 

Applied, thanks!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
