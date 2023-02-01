Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB12685CBA
	for <lists+dri-devel@lfdr.de>; Wed,  1 Feb 2023 02:41:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FC1310E0CD;
	Wed,  1 Feb 2023 01:41:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com
 [209.85.160.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B84E210E0CD
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Feb 2023 01:41:11 +0000 (UTC)
Received: by mail-oa1-f50.google.com with SMTP id
 586e51a60fabf-15fe106c7c7so21749750fac.8
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 17:41:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ARcpraQzdyShL/3uOhJbU55iw6ZjqLdVd5dZPXUPPKs=;
 b=dLUmHU5Cxx8VbXGFobjAgFq+EFTuwSHaBnsePSmiOMA8eg/MgWfGUVmvwe2eavPMPG
 73NAg9IvaL7mp9Y/FItlF/0+DD7xFUo8q5ASiHTKuBb5wNy3lMJBAAaAprAT6+Ndff+7
 wPrb56uVM0471jbyS506hSGx5sb4aiDX78fG0403dxt6I+U5AYqVV9wvgpbxYvO72vOq
 2cvTaYwrPDEovrIWBOEYSFNRNqS4kTNHWtfPG5x2kMV+k/DJ316UrDGCyBcVUG++PNU9
 w1kX5M2KD7Nyhec56LkWiXh+wRp9ZcDQAzfwBhvRwcoNPYSMHUgn4Telg5hQNHd5k8ua
 GDxQ==
X-Gm-Message-State: AO0yUKVmwr4HS2NQGkRZwXr/B+ufU4SdYMtRdYmCKgjhc83Swfz1kfLT
 T7Kum0jBQV/4WI+P/JojFg==
X-Google-Smtp-Source: AK7set+7vdv8wCpcZTaEjMIlQXTj5qX8pbN6bW9oRbbgZSH7MorUaN+g7rqVEpjZGOJmdPN5Wr2Oyg==
X-Received: by 2002:a05:6870:315:b0:15f:b59a:55f1 with SMTP id
 m21-20020a056870031500b0015fb59a55f1mr123340oaf.16.1675215670603; 
 Tue, 31 Jan 2023 17:41:10 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 lm27-20020a0568703d9b00b0015f83e16a10sm7267887oab.44.2023.01.31.17.41.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 17:41:10 -0800 (PST)
Received: (nullmailer pid 2293844 invoked by uid 1000);
 Wed, 01 Feb 2023 01:41:09 -0000
Date: Tue, 31 Jan 2023 19:41:09 -0600
From: Rob Herring <robh@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v4 02/21] dt-bindings: display: tegra: vi: add 'vip'
 property and example
Message-ID: <167521566867.2293789.16573974181219415861.robh@kernel.org>
References: <20230130141603.323221-1-luca.ceresoli@bootlin.com>
 <20230130141603.323221-3-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130141603.323221-3-luca.ceresoli@bootlin.com>
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-staging@lists.linux.dev,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-tegra@vger.kernel.org,
 Dmitry Osipenko <digetx@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Richard Leitner <richard.leitner@skidata.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 30 Jan 2023 15:15:44 +0100, Luca Ceresoli wrote:
> The Tegra20 VI peripheral can receive parallel input from the VIP parallel
> input module. Add it to the allowed properties and augment the existing
> nvidia,tegra20-vi example to show a 'vip' property.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Changed in v4:
>  - complete the removal of 'channel@0'
> 
> Changed in v3 (suggested by Rob Herring):
>  - drop 'endpoint', unneeded as there's no extra properties in the
>    endpoints
> 
> Changed in v2 (suggested by Krzysztof Kozlowski):
>  - rename "i2c3" -> "ic2"
>  - add review tag
> ---
>  .../display/tegra/nvidia,tegra20-vi.yaml      | 59 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 60 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

