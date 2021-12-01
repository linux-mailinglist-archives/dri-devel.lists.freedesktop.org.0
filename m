Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DE44659F8
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 00:48:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DAF86E8CC;
	Wed,  1 Dec 2021 23:48:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C50CA6E8CC
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 23:48:48 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id
 r10-20020a056830080a00b0055c8fd2cebdso37540623ots.6
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Dec 2021 15:48:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fyGAOeBxtb/YjCFPCWVtQ1oMycSzDCqhNkiAf3lW5sQ=;
 b=gftlhyz9npGeFE8gtU4QO0sxC11NNmq6Zy/H/HVbJWoZl3a64ALe2nkGFnyKNPdsLs
 FuwbVt9mXaQulFrj+MBkHIACCfyoOcINXkB3pxAZAO68kHuN5bEr7tlvMF7oP7U2+UWR
 xtzrLs2Nqs8oyyqsNPCQzNKuWfia8brwvSMC5BUOJvgeuX3UECIPECPgZR14a1+MNXY4
 mPTpHmVDlNEoH3hH2rFanOg83RAS21Q1nTAs1+ika9/iGcyyetCjipqYZzguyc0YzzQM
 cYJcT97btRmG1HoxjHp91cIKRNcMfx8eRl+s3z6tehaxnhtJZTt1Rj4IFbvggWTUBoQB
 UTnw==
X-Gm-Message-State: AOAM533PzZXhrHVjK4jJpHMbiuXnakJ/PyrukD5EP9BN85dtmLMTUmbb
 1zszbkNmVjYg+l7/fS95Ag==
X-Google-Smtp-Source: ABdhPJwBi/tdif29xfYoe8iVx4zcgBRkwLZVbOdrMx5Fmu2uZy2Kzg0shDNa0g5juvB2yC9OFPvevA==
X-Received: by 2002:a05:6830:3155:: with SMTP id
 c21mr8637036ots.7.1638402528023; 
 Wed, 01 Dec 2021 15:48:48 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id 109sm506737otv.30.2021.12.01.15.48.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 15:48:47 -0800 (PST)
Received: (nullmailer pid 3239358 invoked by uid 1000);
 Wed, 01 Dec 2021 23:48:46 -0000
Date: Wed, 1 Dec 2021 17:48:46 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 01/20] ASoC: dt-bindings: Add binding for Tegra20 S/PDIF
Message-ID: <YagJ3rKTmE3xSGg4@robh.at.kernel.org>
References: <20211126161807.15776-1-digetx@gmail.com>
 <20211126161807.15776-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211126161807.15776-2-digetx@gmail.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Agneli <poczt@protonmail.ch>, linux-tegra@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 26, 2021 at 07:17:48PM +0300, Dmitry Osipenko wrote:
> Add device-tree binding for Tegra20 S/PDIF controller.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/sound/nvidia,tegra20-spdif.yaml  | 85 +++++++++++++++++++
>  1 file changed, 85 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra20-spdif.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra20-spdif.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra20-spdif.yaml
> new file mode 100644
> index 000000000000..00240205817d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra20-spdif.yaml
> @@ -0,0 +1,85 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/nvidia,tegra20-spdif.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra20 S/PDIF Controller
> +
> +description: |
> +  The S/PDIF controller supports both input and output in serial audio
> +  digital interface format. The input controller can digitally recover
> +  a clock from the received stream. The S/PDIF controller is also used
> +  to generate the embedded audio for HDMI output channel.
> +
> +maintainers:
> +  - Thierry Reding <treding@nvidia.com>
> +  - Jon Hunter <jonathanh@nvidia.com>
> +
> +properties:
> +  compatible:
> +    const: nvidia,tegra20-spdif
> +
> +  reg:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: spdif_out
> +      - const: spdif_in

'spdif_' is redundant.

Otherwise,

Reviewed-by: Rob Herring <robh@kernel.org>
