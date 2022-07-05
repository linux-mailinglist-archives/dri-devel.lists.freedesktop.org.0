Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A296567737
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 21:05:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C41111B938;
	Tue,  5 Jul 2022 19:05:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63AD811B8F0
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jul 2022 19:05:01 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id h85so12043063iof.4
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Jul 2022 12:05:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NYhNf6ucb9Y2EJr3g3GFcYGSI7hDN6hlWNBPyCne12o=;
 b=ZzGczBDj9UEZhGgm1IY+iPaqJJUoPysW+362MZdqE+YFdG7ai02P4n8qHLKQIr+sTr
 osqw1qTfOc4BaxPdmuE2+AfMCXcptbq3NJE4zLaIB7jSmu9SYcQKMpbUzIx4GVLsLMLs
 NrDcdg+OuqWt7rK4ZEiy+YFsLNZKQxzbH5Z35ZvRZ+KrCAurroaqj3PvmpjxjP1FFPzv
 iTIihEFNOv7UxSz2mt3v3xvljIajCyyL9JQdYvzLjriw95wIq6TEiVBF8fs1vrNQ746n
 AR6RIeZxZEKcvBZziRiHCEdOqY6e3KhEE4d+63YtKEbfFQMkigVKxJJ1SCRCtaLpK1+k
 oQOg==
X-Gm-Message-State: AJIora9UcQFki8i2/jg28PAkkzK71rXdaokfSHIC4w+7lP554YF2OY5H
 MAehINOLuoyN33T2L4Rjlw==
X-Google-Smtp-Source: AGRyM1vbgvYpzb6OcGyK9lCHO48fmdYxy4SEAi8PzKsPwRclsAgNdeYXBff/q4XTwjXyQVl9lebl7A==
X-Received: by 2002:a05:6638:2494:b0:33c:cfb8:1e3c with SMTP id
 x20-20020a056638249400b0033ccfb81e3cmr21373745jat.139.1657047900325; 
 Tue, 05 Jul 2022 12:05:00 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 x8-20020a056638026800b00339c46a5e95sm14948822jaq.89.2022.07.05.12.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 12:04:59 -0700 (PDT)
Received: (nullmailer pid 2450909 invoked by uid 1000);
 Tue, 05 Jul 2022 19:04:57 -0000
Date: Tue, 5 Jul 2022 13:04:57 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v4 02/14] dt-bindings: display: ili9341: document canaan
 kd233's lcd
Message-ID: <20220705190457.GA2450821-robh@kernel.org>
References: <20220701192300.2293643-1-conor@kernel.org>
 <20220701192300.2293643-3-conor@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220701192300.2293643-3-conor@kernel.org>
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>, alsa-devel@alsa-project.org,
 David Airlie <airlied@linux.ie>, Palmer Dabbelt <palmer@rivosinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Conor Dooley <conor.dooley@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Jose Abreu <joabreu@synopsys.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Dillon Min <dillon.minfei@gmail.com>, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 dmaengine@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 01 Jul 2022 20:22:48 +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The Canaan KD233 development board has a built in LCD.
> Add a specific compatible for it.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../devicetree/bindings/display/panel/ilitek,ili9341.yaml        | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
