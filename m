Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AEE4935B5
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 08:44:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C196A10E384;
	Wed, 19 Jan 2022 07:44:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC67B10E384
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 07:44:02 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id t32so1654003pgm.7
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 23:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=wgsNFzNpSSdccSgxfw+zCKaHdZrvmLN4TxH4pmEqHFM=;
 b=p+cHoZyZ/KxchMwriiVowMDalr/duztSsP8wupwGCXnhLANZc8nlOxi8DRiXRCJMIe
 ThXD3VtztapjDQndPVMlgQCNBGdaB/6GtGter/A53dpnPy0/ro9sY23pR2hrOCNdpJ6x
 A4o4u75fhuW3Mo06+JGLmcZyvqLXji4TLjjrijhdVwv1S53EEBqkn8vl1ndTRxbd3dZz
 uybHANAtOcV/NY4/riEthmOAO/ZD0wmVB13Z8eWzwiHuCL/kM8zjRhZyQ+O10QzOw4WU
 8T8YqXxpWNqIHjpyLGArRjsnP8Y9EWKTmKSTB1lK98Rd0uAtb5HaP0a2q3DyQSfNmTwM
 RKFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=wgsNFzNpSSdccSgxfw+zCKaHdZrvmLN4TxH4pmEqHFM=;
 b=KE/RowBAO2ond5GUmEUzDAmPpnWd3/BiZ3R8IoLw5STaS1SGLU/Ljr1gpnPztIB3uy
 TBlDmhiNOExTdb9YosJn8rZZ5bIoV1tmJZe0AlaipmTkXrXI4iK+094V8YHfbBndH43/
 qRMF5d+ornqak+febaYtkaFtkDGY6dNWKO/OPtUE/FkHgexoWcMsAweOiJMJ7ePd1d5Y
 xnFwNFagXTwYWxncOKQJ18FJqcQ0z1mk2epzfIxSmmxXJkgZgMvxnz8uTfiKpleDZB7T
 heqgo5yUmKVF6exIHbnVHD/tCTC6n20LnCeRBZGTEY7597pr2xWyczV+QMsUb9RxmuQc
 G/Vg==
X-Gm-Message-State: AOAM531W0RC5JQeW1Zu5d8bZrCOnBOQNhUduiOUzrvED+LSFbGFPtBYq
 CKw29Ki2wudogzqNAHlyMXnryg==
X-Google-Smtp-Source: ABdhPJyNKcbiEGUcgkz9zXpAgkBgubu/10nRg7X8eh23rlI2iY9kKxwwNMydTTsODjGuMFGY0jhtqA==
X-Received: by 2002:a05:6a00:88f:b0:4bc:3b4e:255a with SMTP id
 q15-20020a056a00088f00b004bc3b4e255amr29453525pfj.79.1642578242462; 
 Tue, 18 Jan 2022 23:44:02 -0800 (PST)
Received: from localhost ([223.184.90.234])
 by smtp.gmail.com with ESMTPSA id g14sm16984301pgp.76.2022.01.18.23.44.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 23:44:01 -0800 (PST)
Date: Wed, 19 Jan 2022 13:14:00 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Improve phandle-array schemas
Message-ID: <20220119074400.rqldtq6wqo73lqqg@vireshk-i7>
References: <20220119015038.2433585-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220119015038.2433585-1-robh@kernel.org>
User-Agent: NeoMutt/20180716-391-311a52
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
Cc: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-remoteproc@vger.kernel.org,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sre@kernel.org>, linux-ide@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pavel Machek <pavel@ucw.cz>, linux-phy@lists.infradead.org,
 netdev@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Lee Jones <lee.jones@linaro.org>, linux-riscv@lists.infradead.org,
 linux-leds@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Marc Zyngier <maz@kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, iommu@lists.linux-foundation.org,
 Kishon Vijay Abraham I <kishon@ti.com>, Jakub Kicinski <kuba@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, linux-usb@vger.kernel.org,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Wolfgang Grandegger <wg@grandegger.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 Kalle Valo <kvalo@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
 linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Kevin Hilman <khilman@kernel.org>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 linux-crypto@vger.kernel.org, Viresh Kumar <vireshk@kernel.org>,
 dmaengine@vger.kernel.org, Georgi Djakov <djakov@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Joerg Roedel <joro@8bytes.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18-01-22, 19:50, Rob Herring wrote:
> The 'phandle-array' type is a bit ambiguous. It can be either just an
> array of phandles or an array of phandles plus args. Many schemas for
> phandle-array properties aren't clear in the schema which case applies
> though the description usually describes it.
> 
> The array of phandles case boils down to needing:
> 
> items:
>   maxItems: 1
> 
> The phandle plus args cases should typically take this form:
> 
> items:
>   - items:
>       - description: A phandle
>       - description: 1st arg cell
>       - description: 2nd arg cell
> 
> With this change, some examples need updating so that the bracketing of
> property values matches the schema.
> 

>  .../devicetree/bindings/opp/opp-v2-base.yaml  |  2 +
>  .../bindings/power/power-domain.yaml          |  4 +

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
