Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8783493599
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 08:40:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 621DF10E313;
	Wed, 19 Jan 2022 07:40:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 307 seconds by postgrey-1.36 at gabe;
 Wed, 19 Jan 2022 07:40:54 UTC
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 653EE10E308
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 07:40:54 +0000 (UTC)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id BDB26407F3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 07:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1642578052;
 bh=KOwrbfmVaaY4sfUgcL8mu/NpRfAwFGVtSAETT0kqBAg=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=nWEu+jGMj1FJ3/JFrNCNRWcrAgA7ULncUgZATh2wXD4936EoufJ27K5UIUNruVGFB
 OUJTIDjH3K+aQfwAeMrwVZplhgPrtJgt6m4RX1812H9cXBsV9eq3k8kKqS8u9b9+hl
 7oRCsoeM9/ivgnEUaf1VVJ3LZamN4HZSKfqZZHSJumVLEwKkihRyHbyuL791RM/K4z
 23TW7bBjf1u74E0XGEgtVhHDT9WXN/M3IfVAaaZ6EMvxMNLpMMialNyIcYO80EeyYs
 VVe+75P76Owv3P06DpmJ77i8axmsF9uTj6eW87X7IAir9wzRCwMNyHNgItiPbe0dev
 vA5VsmdAf3obw==
Received: by mail-ed1-f70.google.com with SMTP id
 ee53-20020a056402293500b004022f34edcbso1458130edb.11
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 23:40:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KOwrbfmVaaY4sfUgcL8mu/NpRfAwFGVtSAETT0kqBAg=;
 b=17MQ6cahiQVjRRO63NEZyv1z3sPmg1fcS5WpV962HRJPKXR2ywz7XHEHYQChSFlqXs
 vUuLgYQYGFqQmvNTjVqN2ekFEyPqk9OzwEsTELGxMzyQ2rjX4dPwrtiYj4ZBxuwTxGid
 7JBJdgqJK4uufhbz/0+aUgN8KtPIrve8XHiDcjJ3ePJ+7lOxB37eoBQs8P289JsmZbpX
 Mzks59jrs7GwmE2GaU14ORJk5QcWIVLz8eAFDiJ/NZ8gI/Rkn545jRal1R+M107ZOtsa
 GZUkfodM5+Qa7r9U2sv8wQINCIT6F005pEKXD/8pRmpGdqU4sHB6rCz5KO7KDSUUo+YQ
 PAuQ==
X-Gm-Message-State: AOAM53089yxh+4GOdJhtnjrpLiNx6/crqB5ef5KmaXaisa0ZerFXvfR/
 +uOjXYPDbX9lVPOTvPcYl87dGOuEBbl9w7qb+iraDN+MbgXKxIdmyy4qQns/Vz98IyWLU48kFwT
 qBKyiJfpy7VyIt4r5JYjiijrIXAnqmdWPrToUCO301smXYg==
X-Received: by 2002:a17:907:7ea6:: with SMTP id
 qb38mr23673578ejc.557.1642578052199; 
 Tue, 18 Jan 2022 23:40:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwcC/F4TT/k1wEFa2HsX2oDgdxrLKxkyNjrLq8ReErAXQsVWpB2ePW4VmJCVcsiAdC0JWuWGg==
X-Received: by 2002:a17:907:7ea6:: with SMTP id
 qb38mr23673541ejc.557.1642578052033; 
 Tue, 18 Jan 2022 23:40:52 -0800 (PST)
Received: from [192.168.0.42] (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id d2sm791994edy.86.2022.01.18.23.40.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jan 2022 23:40:51 -0800 (PST)
Message-ID: <21b72055-e158-6586-f48a-17695128b507@canonical.com>
Date: Wed, 19 Jan 2022 08:40:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH] dt-bindings: Improve phandle-array schemas
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
References: <20220119015038.2433585-1-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220119015038.2433585-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-remoteproc@vger.kernel.org,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sre@kernel.org>, linux-ide@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pavel Machek <pavel@ucw.cz>, linux-phy@lists.infradead.org,
 netdev@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Lee Jones <lee.jones@linaro.org>, linux-riscv@lists.infradead.org,
 linux-leds@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Kevin Hilman <khilman@kernel.org>,
 Marc Zyngier <maz@kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, iommu@lists.linux-foundation.org,
 Kishon Vijay Abraham I <kishon@ti.com>, Jakub Kicinski <kuba@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Vivien Didelot <vivien.didelot@gmail.com>,
 Wolfgang Grandegger <wg@grandegger.com>, linux-media@vger.kernel.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-pm@vger.kernel.org,
 Kalle Valo <kvalo@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
 linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 linux-crypto@vger.kernel.org, Viresh Kumar <vireshk@kernel.org>,
 dmaengine@vger.kernel.org, Georgi Djakov <djakov@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Joerg Roedel <joro@8bytes.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/01/2022 02:50, Rob Herring wrote:
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

Samsung and memory controller bits look good:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
