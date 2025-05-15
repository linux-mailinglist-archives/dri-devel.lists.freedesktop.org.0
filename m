Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5B6AB8736
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 15:00:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AAF510E898;
	Thu, 15 May 2025 13:00:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="k0slbEMx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 493DF10E87A
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 13:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=j3sH6idRVT/DTznLTmJ3CWldluNb4n55qNSbRTmuPbw=; b=k0slbEMxZpoCLTyT3w91VY5ST8
 NqULa0lfbpb18LrpnwQD3SRyRIDLO5t+0IbT6qNV5dOX0qoGUo+qSbVZQPU7Pyxa4vSmFLLwX7GKV
 4odizJqzefzcex46WcFy4SxVz89UZnwSRTajJQc1LYmTxWZW0XaTnOZJl24hIkH/lLh2X+gm2cZSq
 fPpocHx6QCBh7z1ZCvfeOJZ+9HuRaBVz4OUe2phgh6ucu+HMO8ys65ZcK7zpZ5xhwENzjyuU8ose+
 NCK7dWM5UcbiJl7MCzLzApi389XJ4mfTJPX8R3NPQANvCBbTQFOQ2OGjWH8o10VTtEpbYQD6b6bKa
 2ybO5tLQ==;
Received: from i53875a50.versanet.de ([83.135.90.80] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1uFYC8-00051K-F3; Thu, 15 May 2025 15:00:16 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chaoyi Chen <kernel@airkyi.com>
Cc: Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Dragan Simic <dsimic@manjaro.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] dt-bindings: display: rockchip: Convert
 cdn-dp-rockchip.txt to yaml
Date: Thu, 15 May 2025 15:00:15 +0200
Message-ID: <2745929.KRxA6XjA2N@diego>
In-Reply-To: <20250513011904.102-3-kernel@airkyi.com>
References: <20250513011904.102-1-kernel@airkyi.com>
 <20250513011904.102-3-kernel@airkyi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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

Hi,

Am Dienstag, 13. Mai 2025, 03:19:04 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Chaoyi Chen:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Input of the CDN DP
> +        properties:
> +          endpoint@0:
> +            description: Connection to the VOPB
> +          endpoint@1:
> +            description: Connection to the VOPL
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Output of the CDN DP
> +
> +    required:
> +      - port@0
> +      - port@1

you're adding the 2nd port (port@1) as output port, which has not been
part of the old binding. I think this warrants an explanation in the
commit message on what it is meant to contain.


Heiko


