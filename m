Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDE0679F73
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 18:02:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4343A10E0A7;
	Tue, 24 Jan 2023 17:02:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6397D10E0A7
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 17:02:46 +0000 (UTC)
Received: from [192.168.2.197] (unknown [109.252.117.89])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 2DAD86602E22;
 Tue, 24 Jan 2023 17:02:43 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1674579765;
 bh=VAJAGj9mDF7o3WZ3VOmzDTm34wwnrr+/a3gGZ+27DcI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=OqA6JBs5LLnbiF3bNfeASDGBc4uGRUfEr6zBijDjjsUF63mSKkRq61H+Ogw9Va3U5
 nXK1JWLUho68iAggIZRLRUaU3vAJzpDl7Ea9j/EXVA2YnShDKFWGszLSNQ5aex2/xt
 lRC2qqNKV84Q6dsmY94S3inYxg+tY1jgQlEbBChdhQVKfylFuG97e6KJny1mjhgtxc
 v49Ei6tcwTPI+78x+xVmsZGn59CmY6jUoag06XVedrIQtZHKceH2Ao8SQSqvCwUYKf
 fQ8fSgDT+4wrTCWXwjeeQ62Dt0ZXeCrrALllFMtrGu5qpGKWVPxKfr2x2hqhJnd0GO
 EchjENhVjcddg==
Message-ID: <cdc91bc4-aa76-f824-36c9-d2995c17fb18@collabora.com>
Date: Tue, 24 Jan 2023 20:02:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 02/21] dt-bindings: display: tegra: vi: add 'vip'
 property and example
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Osipenko <digetx@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20221229133205.981397-1-luca.ceresoli@bootlin.com>
 <20221229133205.981397-3-luca.ceresoli@bootlin.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20221229133205.981397-3-luca.ceresoli@bootlin.com>
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
Cc: devicetree@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-tegra@vger.kernel.org,
 Richard Leitner <richard.leitner@skidata.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/29/22 16:31, Luca Ceresoli wrote:
> +        vip {
> +            compatible = "nvidia,tegra20-vip";
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            channel@0 {
> +                reg = <0>;
> +                ports {
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
> +                    port@0 {
> +                        reg = <0>;
> +                        vi_vip_in: endpoint {
> +                            remote-endpoint = <&mt9v111_out>;
> +                        };
> +                    };
> +                    port@1 {
> +                        reg = <1>;
> +                        vi_vip_out: endpoint {
> +                            remote-endpoint = <&vi_in>;
> +                        };
> +                    };
> +                };
> +            };

In the changelog you said that the channel@0 node is removed

-- 
Best regards,
Dmitry

