Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CA369101F
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 19:13:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C89310E267;
	Thu,  9 Feb 2023 18:13:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69A3C10E267
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 18:13:34 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id
 14-20020a9d010e000000b0068bdddfa263so798357otu.2
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Feb 2023 10:13:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4w2uvC7tKfN7ZfSyrpjhie/I8cEOrFcZDWMac10H+4k=;
 b=wVPynKM1ZP0rcqWAl7K6adAznsdscBgmdwDNl0gwy1X71JceZ0bOm+aD4fuEmmPn0N
 f6acU+7zmnLOmo23VVetsSlxPgGborB3XKFiAJorzMGFovwUzXiHOuT1XT7x+tgVOBGJ
 VNSucJF75TxlrY78LL1keoZCwLjWEHxqgVZrrP8K8FPwWUSvacNNNmCOUcRUuZ0WDnAi
 taDfMoyeL6KP8gt2rYW3j+x09KzYG7gBI5LuIB3uP3nXKlUf+6jxbS4vuswIuCLnEC7P
 RJUWYC1lZ90vw2CBeCokR920kPv/668DNqZt0qwlyq+EkrWy+OlvwfIkCBXWcOOdOgeU
 lXHQ==
X-Gm-Message-State: AO0yUKVQIuXlv0gnVMZQslDd4Km6lT/DAIamlRAMzZE7LqamtNomLWKL
 oaKe74qaW4oXC2nzK7dkTg==
X-Google-Smtp-Source: AK7set9geq4xni8+uYB8qGbMxQ7pUXj7wYLAoWyWFhJL4jxzTcF08XJ50z6U9Ah/fWoX6ss5tjhjwg==
X-Received: by 2002:a05:6830:39e4:b0:68d:81ce:a8c1 with SMTP id
 bt36-20020a05683039e400b0068d81cea8c1mr6701035otb.13.1675966413640; 
 Thu, 09 Feb 2023 10:13:33 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 f17-20020a9d7b51000000b0068bdfa56717sm985127oto.36.2023.02.09.10.13.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 10:13:33 -0800 (PST)
Received: (nullmailer pid 586379 invoked by uid 1000);
 Thu, 09 Feb 2023 18:13:32 -0000
Date: Thu, 9 Feb 2023 12:13:32 -0600
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 2/9] dt-bindings: gpu: mali-bifrost: Allow up to 5 power
 domains for MT8192
Message-ID: <167596641142.586319.10372403582007442030.robh@kernel.org>
References: <20230208103709.116896-1-angelogioacchino.delregno@collabora.com>
 <20230208103709.116896-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230208103709.116896-3-angelogioacchino.delregno@collabora.com>
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 tomeu.vizoso@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, steven.price@arm.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, alyssa.rosenzweig@collabora.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 08 Feb 2023 11:37:02 +0100, AngeloGioacchino Del Regno wrote:
> MediaTek MT8192 (and similar) needs five power domains for the
> Mali GPU and no sram-supply: change the binding to allow so.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/gpu/arm,mali-bifrost.yaml        | 34 +++++++++++++++++--
>  1 file changed, 31 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

