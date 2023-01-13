Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A051E66A2C7
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 20:18:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FE3A10EAC5;
	Fri, 13 Jan 2023 19:18:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com
 [209.85.161.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E54AE10EAB9
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 19:18:14 +0000 (UTC)
Received: by mail-oo1-f50.google.com with SMTP id
 y15-20020a4aaa4f000000b004e6b4e0acc0so5794062oom.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 11:18:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B70jAnXcMDlhhFo6pygi7wm6qqiPd8cSnbuhQtDGWGM=;
 b=MKweAxvlW7q4VeIsjop8IZdjswnUOppG6kIU+ZQxBeaSMrpem9jYa7K+0BDh0nDbQy
 61DJN0z3xX+pxjvFEiLe3maYrsXoSt4SkWq5k0RWzq8+ye8jtBAtW9jpQq36ftkUbeUt
 XY8ABXF6uownZX5zPvEtoIU2y1fuUnobOFh+eo1DmF2fgQWrg2OgBcyq6Dp+eGnhn2eH
 blY+xqDr88LpOc7SO/y0aMbdNtRBTrNAHZjZ0aI1q6PDCBgNpI6PEfbJkp+01m+W3Eq5
 W8HCO8pxPLdAK0ouTAzM8kNtI53EufSU62jkYkCXxnp6CoUvRivt7ase/8lgm4D1sZPJ
 ggsg==
X-Gm-Message-State: AFqh2krat33ABc/n8F6EEhYjcIMox29G8uzu1HsvkU/Sftrkf3NqdwRj
 +EWGNbQB4hIhKPwBn5kfRQ==
X-Google-Smtp-Source: AMrXdXukJHRMoqZxa1jYf9MRBpcU3E+hcrJeeafUboM+qJLEIF0oaVFK9ocAmkIX+lr/RAHkjYQj+w==
X-Received: by 2002:a4a:2c97:0:b0:4f2:6b72:6f75 with SMTP id
 o145-20020a4a2c97000000b004f26b726f75mr3770772ooo.7.1673637494125; 
 Fri, 13 Jan 2023 11:18:14 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 m22-20020a4ac696000000b0049bfbf7c5a8sm10035924ooq.38.2023.01.13.11.18.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 11:18:13 -0800 (PST)
Received: (nullmailer pid 2763911 invoked by uid 1000);
 Fri, 13 Jan 2023 19:18:12 -0000
Date: Fri, 13 Jan 2023 13:18:12 -0600
From: Rob Herring <robh@kernel.org>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: Re: [PATCH 8/9] dt-bindings: display: mediatek: Fix the fallback for
 mediatek,mt8186-disp-ccorr
Message-ID: <167363749222.2763683.4659795598968970100.robh@kernel.org>
References: <20230111123711.32020-1-allen-kh.cheng@mediatek.com>
 <20230111123711.32020-9-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230111123711.32020-9-allen-kh.cheng@mediatek.com>
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
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 11 Jan 2023 20:37:10 +0800, Allen-KH Cheng wrote:
> The mt8186-disp-ccorr is not fully compatible with the mt8183-disp-ccorr
> implementation. It causes a crash when system resumes if it binds to the
> device.
> 
> We should use mt8192-disp-ccorr as fallback of mt8186-disp-ccorr.
> 
> Fixes: 8a26ea19d4dc ("dt-bindings: display: mediatek: add MT8186 SoC binding")
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,ccorr.yaml    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
