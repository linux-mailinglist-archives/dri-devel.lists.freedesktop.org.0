Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD5D6B1193
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 20:00:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9755210E6E6;
	Wed,  8 Mar 2023 19:00:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com
 [209.85.160.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C04C10E6E4
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 19:00:41 +0000 (UTC)
Received: by mail-oa1-f41.google.com with SMTP id
 586e51a60fabf-176261d7f45so19739041fac.11
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Mar 2023 11:00:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678302040;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6Hl+hU+TNeZjuxSABhEdZd1KZhSZC+nINd4XLp7+aIo=;
 b=8IA8HIC/jRe/0z0R8isdt75gVCXwpV6DWiAAa+BDg40b5qEMIacDRo9mch7q+v6qF7
 3XWoDwGn8zLC0WovP9slbihEgpqXqz4wqn1T7AypMCyV0rQMMCN425pLYjmuxWtS3yTb
 FRAQcajWPWxSStv9wbQCMSpIcAbSiyL0JmNE/qy4FSmoBmpv2iJRfKgAcSq5ZoNQ1+Yu
 U0lme+GpPIV3MVeoBkJ1xHYfOMNuuzhtYlqfCId2c90sOyTYqsaRs53wwn8T5SdYiykQ
 GvghZtOxfMOqx6LWBCwWixtioTfK9Vd42QW+XZAVPYfYA8feBH/xcU8peLimpMTzJomm
 OaSw==
X-Gm-Message-State: AO0yUKXok6bh7hyuxct8g+906bohPn1s102m5QAtJiBwI7RiHEz0RIPJ
 ptpUXLk4MQat63R8q4jISvCYF6qrCA==
X-Google-Smtp-Source: AK7set+Pcb5lu+k9cusuDmhFqFSm2qqL8crxqGgPEG8SBLpmeTJq4QEP/ex4Xsfkf2GRJlK2aZikaw==
X-Received: by 2002:a05:6871:28b:b0:172:3d66:6868 with SMTP id
 i11-20020a056871028b00b001723d666868mr11397673oae.15.1678302040624; 
 Wed, 08 Mar 2023 11:00:40 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 f5-20020a056870d30500b001724742cfcesm6425572oag.38.2023.03.08.11.00.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 11:00:40 -0800 (PST)
Received: (nullmailer pid 3601310 invoked by uid 1000);
 Wed, 08 Mar 2023 19:00:39 -0000
Date: Wed, 8 Mar 2023 13:00:39 -0600
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v4 02/12] dt-bindings: gpu: mali-bifrost: Set
 power-domains maxItems to 5
Message-ID: <167830203908.3601252.4440777459062565810.robh@kernel.org>
References: <20230228102704.708150-1-angelogioacchino.delregno@collabora.com>
 <20230228102704.708150-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230228102704.708150-2-angelogioacchino.delregno@collabora.com>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 steven.price@arm.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 alyssa.rosenzweig@collabora.com, wenst@chromium.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tue, 28 Feb 2023 11:26:54 +0100, AngeloGioacchino Del Regno wrote:
> In preparation for adding (and fixing) power-domain-names and MediaTek
> MT8192 bindings, allow up to five items for power-domains.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

