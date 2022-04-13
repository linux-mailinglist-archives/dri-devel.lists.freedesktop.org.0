Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F71500235
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 01:02:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C63610EE42;
	Wed, 13 Apr 2022 23:02:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com
 [209.85.160.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4139410EE42
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 23:02:45 +0000 (UTC)
Received: by mail-oa1-f49.google.com with SMTP id
 586e51a60fabf-e2a00f2cc8so3598032fac.4
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 16:02:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dGLCCj51MkIzf2vXEtRhMBdKTU97nBZt+VOtgE9+Gtk=;
 b=ixWf40qcKo8DLqBQgZC/kgDQxQxgD5HZxk4JDnkBFxHs3p2j9TIf1cQ9bF9nXBK+s9
 UJXOQqbqN4ycKSKb6RxqzzOZLAfECL7GG93GS0UKJxdzDNqnqS/MYxsdJ6rq1Is29jjQ
 sUQKJT7hKB4W7dsQm3yXx4S3QE5NZaP2QouJZMgMtMVzN1otRZhWyiaAmLRdjlHOb+rl
 xySGx+Xuw25Ws7VtbkoQRoONlixbU3e61RkhA9q39TCBTVQHIWNLPhV+C77OOu4fntoB
 7mmqywDkQchJL7756qLo/ApF+FKxBgB1abIFt8bDKHTeZe4y41fh9SAqULKRNAQDX2Qn
 3/tA==
X-Gm-Message-State: AOAM531g0Tt7s6V2al8O4dwDb+Vwiv9kVgccWpDmAunnyzKHbGk6iZW3
 Q6W/pXJ+ebP1BrY76DIxkg==
X-Google-Smtp-Source: ABdhPJxs7Cpn96X2RQDhvRVBftdBJgNx8HGYgvUvc3HyiqWruHo7eL1oBmK4BQowGjBrYomgw4HTDg==
X-Received: by 2002:a05:6870:e893:b0:e2:ecbc:e581 with SMTP id
 q19-20020a056870e89300b000e2ecbce581mr189032oan.193.1649890964457; 
 Wed, 13 Apr 2022 16:02:44 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 k22-20020a056870959600b000d277c48d18sm194761oao.3.2022.04.13.16.02.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Apr 2022 16:02:44 -0700 (PDT)
Received: (nullmailer pid 4101311 invoked by uid 1000);
 Wed, 13 Apr 2022 23:02:43 -0000
Date: Wed, 13 Apr 2022 18:02:43 -0500
From: Rob Herring <robh@kernel.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Subject: Re: [PATCH V2 3/3] dt-bindings: display: mediatek: Update disp_aal
 binding for MT8192 and MT8195
Message-ID: <YldWk9eTLbXBcbX+@robh.at.kernel.org>
References: <20220411035843.19847-1-rex-bc.chen@mediatek.com>
 <20220411035843.19847-4-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220411035843.19847-4-rex-bc.chen@mediatek.com>
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
Cc: chunkuang.hu@kernel.org, devicetree@vger.kernel.org, airlied@linux.ie,
 jason-jh.lin@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, robh+dt@kernel.org,
 nancy.lin@mediatek.com, linux-mediatek@lists.infradead.org,
 yongqiang.niu@mediatek.com, matthias.bgg@gmail.com, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, allen-kh.cheng@mediatek.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 11 Apr 2022 11:58:43 +0800, Rex-BC Chen wrote:
> Disp_aal of MT8192 and MT8195 are fully compatible with disp_aal of
> MT8183. Therefore, we move the them to item "mediatek,mt8183-disp-aal".
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,aal.yaml    | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
