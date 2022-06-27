Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D46F55BC73
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 01:17:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5A8B10E406;
	Mon, 27 Jun 2022 23:17:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
 [209.85.166.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A76810E406
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 23:17:03 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id z191so11209622iof.6
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 16:17:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ch0+XgUThIc/l8CQOuy5NljTuESRwdl/Mc/QQ/GRHwY=;
 b=Q35owiohDRf76CBWcPtEnBX0jVJ+dcu4x795RKMGaYt5EvMW2UC0MH4Bw2v0an28Gp
 b6zMOSsxi54x1J3eVHx8pwzIInfeK+imeUxYziUnGmMeyHq1h2woxboLDXuAwJPUooll
 ukmOJ1NXOAGPW7+OfIliRvPTQYSf+44RsbYeI7aE6BNKm+U2EjaqjKYaYi9vhnn9EG/V
 lCZqUhfR+H5Mfljs88kwPfmp9PtzSuVuYPdprPN9A7UlS9yQE0FpDAE4gK5mPoqAD3S2
 28V5NkB9lgdB0X4vK52RUyc4jh01hZm46Hz4Wj+/+wmNmM0yAMqXeqqq0V/DZ6c7zbd8
 fU3w==
X-Gm-Message-State: AJIora92KKnmuNPCRhHuhzJehgZkfjN32PRZ/K3eNC9OGiJ5nU9nWeb1
 BTcqUFa6ESC6m2o2fvwzPQ==
X-Google-Smtp-Source: AGRyM1sQjARQFnKoj25XCNLdCib4jTOupm0g5QOmkXXsBc0eHF5rPc9gxrBwiTwvftgDQ3k5Qq4cZA==
X-Received: by 2002:a05:6638:190f:b0:339:bc9b:4d90 with SMTP id
 p15-20020a056638190f00b00339bc9b4d90mr9292586jal.153.1656371822830; 
 Mon, 27 Jun 2022 16:17:02 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a92d690000000b002daa70b6a83sm630571iln.20.2022.06.27.16.17.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 16:17:02 -0700 (PDT)
Received: (nullmailer pid 3150543 invoked by uid 1000);
 Mon, 27 Jun 2022 23:17:00 -0000
Date: Mon, 27 Jun 2022 17:17:00 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <mail@conchuod.ie>
Subject: Re: [PATCH 02/14] dt-bindings: display: panel: allow ilitek,ili9341
 in isolation
Message-ID: <20220627231700.GA3144115-robh@kernel.org>
References: <20220618123035.563070-1-mail@conchuod.ie>
 <20220618123035.563070-3-mail@conchuod.ie>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220618123035.563070-3-mail@conchuod.ie>
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
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>, Heng Sia <jee.heng.sia@intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Jose Abreu <joabreu@synopsys.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Dillon Min <dillon.minfei@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Serge Semin <fancer.lancer@gmail.com>,
 linux-spi@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, dmaengine@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jun 18, 2022 at 01:30:24PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The dt-binding for the ilitek,ili9341 does not allow it to be used as a
> compatible in isolation. This generates a warning for the Canaan kd233
> devicetree:
> arch/riscv/boot/dts/canaan/canaan_kd233.dtb: panel@0: compatible:0: 'ilitek,ili9341' is not one of ['st,sf-tc240t-9370-t']
>         From schema: Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
> arch/riscv/boot/dts/canaan/canaan_kd233.dtb: panel@0: compatible: ['ilitek,ili9341'] is too short
>         From schema: Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
> Allow ilitek,ili9341 to be selected in isolation.

Just because you get a warning doesn't mean it is right. ili9341 is a 
panel driver IC, not a complete panel. It needs a more specific 
compatible.

Rob

