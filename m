Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF825500110
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 23:21:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21F5910E09F;
	Wed, 13 Apr 2022 21:21:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24C0A10E09F
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 21:20:58 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id w127so3404974oig.10
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 14:20:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7YzYdFiMLsDoyTU0PbwVa3WC4PKMjoqkq1VcU6L/mnM=;
 b=VPCw7+n2t+bEK8nv2f5p1iWhw2olYri4N94xkcJEYV0I2Lwp/ediZBk30g6FQEsdGM
 s7zunMCd31onO2G/dLSYL6TO0fYE8nvliPGt3pT3BxVupYJfNh6GUUsDk0XpeKgZ3xOx
 N5uERdp/TzAAId1y6ZgOze46Hh+Tdk1S3PLo2gDBwkgG3gVKYBdC1WQ+IaPux2IAYfEq
 R6LuyqnNjAHrv/v32RpbNKEErClFdZY/UfL3FzCps4egb24YT8GMY+oijiUHVtLcv10h
 0gir3Nj7YaSY9vFqnNtxMcA/viOWKFNf76pR8pVHGtyluurB44Cfb0DiOGF/Ix5osHn6
 d/Mg==
X-Gm-Message-State: AOAM533jXoN3hniRqYSk6CdwrylxK1OUzFkXKIaHOOZpv5RWV2BgiYw4
 myRWYNtvqbdoDj+cJMS0NQ==
X-Google-Smtp-Source: ABdhPJy4XCwE/l0IcNFu8QLwKB/o4da+J+bSKytm1PrKJqmc/W/35vPD+DdPKg9ewLQ9IkLcmNk+6A==
X-Received: by 2002:a05:6808:21a3:b0:2f9:a87d:53a6 with SMTP id
 be35-20020a05680821a300b002f9a87d53a6mr34405oib.85.1649884857359; 
 Wed, 13 Apr 2022 14:20:57 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 j5-20020a4a9445000000b00329dab1a07fsm45143ooi.17.2022.04.13.14.20.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Apr 2022 14:20:57 -0700 (PDT)
Received: (nullmailer pid 3948819 invoked by uid 1000);
 Wed, 13 Apr 2022 21:20:56 -0000
Date: Wed, 13 Apr 2022 16:20:56 -0500
From: Rob Herring <robh@kernel.org>
To: xinlei.lee@mediatek.com
Subject: Re: [PATCH v4,2/3] dt-bindings: display: mediatek: dsi: Add
 compatible for MediaTek MT8186
Message-ID: <Ylc+uMqGS0w2T72w@robh.at.kernel.org>
References: <1649495514-25746-1-git-send-email-xinlei.lee@mediatek.com>
 <1649495514-25746-3-git-send-email-xinlei.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1649495514-25746-3-git-send-email-xinlei.lee@mediatek.com>
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
Cc: chunkuang.hu@kernel.org, jitao.shi@mediatek.com, devicetree@vger.kernel.org,
 airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, rex-bc.chen@mediatek.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 09 Apr 2022 17:11:53 +0800, xinlei.lee@mediatek.com wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Add dt-binding documentation of dsi for MediaTek MT8186 SoC.
> 
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dsi.yaml       | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
