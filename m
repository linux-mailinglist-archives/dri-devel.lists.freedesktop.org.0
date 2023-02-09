Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D33691029
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 19:15:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2682210E270;
	Thu,  9 Feb 2023 18:15:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com
 [209.85.160.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4AEF10E279
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 18:15:53 +0000 (UTC)
Received: by mail-oa1-f43.google.com with SMTP id
 586e51a60fabf-16a7f5b6882so3607882fac.10
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Feb 2023 10:15:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MQXSzsZMJZnsLWdCsM/m+xJ0lR6ba3BNbI//iLuwLy0=;
 b=Ku+tPwGSu95KJ4WC1AmSn0JiuP34PrIwYuYtB15nsHb1oat5F1cFjveGVeyf+x7hqW
 Cj3A/uC2OGs+VHWijrVQ8GIOq8BXxFybfErcR4Ra8eA2UUDEO7tr5D5Vu6gSouGkCo9K
 4lgM24+QYZgPsyspC0PujloDQ/H4ZwmVGCg5QipJdBZnwbTkHVwO8KE3a1D9HGBgp594
 UEplDxCPMNU+ck9X6WvVDrilk//OMuDghiebF1mIPT22ExZ+9DHZQT1Z5XArsm02feEs
 bfvbDyRueWm0twQfdblFVTGyHtOpZQkNKYUF1C9vvke5ow/1i5oZHFHH9PasfZwHGw8O
 OU3A==
X-Gm-Message-State: AO0yUKXfl5XqZ0qYZXzqp1c77ajLQbGlwSo2tz9KG+FJxQU20b7q4P36
 MP1F3EXYxjItWcJzdaECwQ==
X-Google-Smtp-Source: AK7set+YmvLpY9HqVM+xUbJq3vy7hLO//HB2AnV0s8lDsqBKdWE0jNTtCstDuwkFYC/+P4B6nmCcZw==
X-Received: by 2002:a05:6870:6011:b0:163:2c2e:b3b1 with SMTP id
 t17-20020a056870601100b001632c2eb3b1mr5646434oaa.9.1675966552749; 
 Thu, 09 Feb 2023 10:15:52 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 cy3-20020a056870b68300b00155ffbdbaffsm983220oab.18.2023.02.09.10.15.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 10:15:52 -0800 (PST)
Received: (nullmailer pid 589042 invoked by uid 1000);
 Thu, 09 Feb 2023 18:15:51 -0000
Date: Thu, 9 Feb 2023 12:15:51 -0600
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 4/9] dt-bindings: gpu: mali-bifrost: Add new MT8183
 compatible
Message-ID: <167596655120.588989.9166090358280103013.robh@kernel.org>
References: <20230208103709.116896-1-angelogioacchino.delregno@collabora.com>
 <20230208103709.116896-5-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230208103709.116896-5-angelogioacchino.delregno@collabora.com>
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


On Wed, 08 Feb 2023 11:37:04 +0100, AngeloGioacchino Del Regno wrote:
> Since new platform data was required in Panfrost for getting GPU DVFS
> finally working on MediaTek SoCs, add a new "mediatek,mt8183b-mali"
> compatible.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/gpu/arm,mali-bifrost.yaml        | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

