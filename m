Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4916355BC77
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 01:21:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1425B10E439;
	Mon, 27 Jun 2022 23:20:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com
 [209.85.166.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C532810E439
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 23:20:57 +0000 (UTC)
Received: by mail-il1-f178.google.com with SMTP id n14so7046974ilt.10
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 16:20:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ceugb8p4sPvAqdgfnrtKA+vm4NF5OVcyALYNjlDqlwc=;
 b=6htVIfr/OfwQ31XV2SCllJBThYigwpDLNRKwSS8cVsIZRyHi3ZYbxikRN+5BO9pQS1
 PRb5SGWItDYqO3AgG0r1iE+e8KnsCdBeZLPh8FtNRHAlQvm1Esyc2JW/EW+6TvvZRzvW
 tjUHUrf0rRB8CjXeT4aU3Ipe69VnnVjUr+XQXBG7nnfpEP4aV469FxNnJvma8imDQqgX
 mIhA/AR1U31S8z6nzrXK9OVFKHCxJs/jDMFajE8sjMCvJ3IvJ/zkDLGjOr7R0MyuWYax
 3j4RUGQwB7Nb7f3P+6Ny3GW2aUzskvhh9v4JCEsIzCh4iSD+Kzg6BXOS0z7eO7UEComj
 mAwg==
X-Gm-Message-State: AJIora/XWE8+6K7lx3SpXc1do0oXzakPzAI170vdQmWIDgHD8b2m9Xq2
 Air9yxcYHaOHeaoxsqrOjg==
X-Google-Smtp-Source: AGRyM1s2ztwoSBusasaBa/b2ACZCEycSaaxHL4lJfIIeTxh/zrx32YNfVPG2AlRLoX75ei2t68AjEQ==
X-Received: by 2002:a05:6e02:214e:b0:2d3:df8c:611 with SMTP id
 d14-20020a056e02214e00b002d3df8c0611mr8403927ilv.295.1656372057040; 
 Mon, 27 Jun 2022 16:20:57 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id
 y4-20020a056e02128400b002da7e147de7sm3137057ilq.17.2022.06.27.16.20.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 16:20:56 -0700 (PDT)
Received: (nullmailer pid 3155702 invoked by uid 1000);
 Mon, 27 Jun 2022 23:20:54 -0000
Date: Mon, 27 Jun 2022 17:20:54 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <mail@conchuod.ie>
Subject: Re: [PATCH 01/14] dt-bindings: display: convert ilitek,ili9341.txt
 to dt-schema
Message-ID: <20220627232054.GA3155668-robh@kernel.org>
References: <20220618123035.563070-1-mail@conchuod.ie>
 <20220618123035.563070-2-mail@conchuod.ie>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220618123035.563070-2-mail@conchuod.ie>
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
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>, Heng Sia <jee.heng.sia@intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Jose Abreu <joabreu@synopsys.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Dillon Min <dillon.minfei@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Serge Semin <fancer.lancer@gmail.com>,
 linux-spi@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 dmaengine@vger.kernel.org, Damien Le Moal <damien.lemoal@opensource.wdc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 18 Jun 2022 13:30:23 +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> A dt-schema binding for the Ilitek ili9341 was created as
> panel/ilitek,ili9341.yaml but the txt binding was ignored in the
> process. Move the remaining items in the txt binding to the yaml one &
> delete it.
> 
> The example in the txt binding has a spi-max-frequency which disagrees
> with the yaml replacement (and its own documentation) so change that to
> conform with the binding. There are no users in tree of the Adafruit
> yx240qv29 to check against.
> 
> Link: https://cdn-learn.adafruit.com/assets/assets/000/046/879/original/SPEC-YX240QV29-T_Rev.A__1_.pdf
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/display/ilitek,ili9341.txt       | 27 -----------
>  .../display/panel/ilitek,ili9341.yaml         | 48 +++++++++++++------
>  2 files changed, 34 insertions(+), 41 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/ilitek,ili9341.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
