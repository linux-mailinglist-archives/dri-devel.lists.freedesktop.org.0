Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B22507307
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 18:35:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 256BF10E28F;
	Tue, 19 Apr 2022 16:35:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com
 [209.85.160.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72BDF10E28F
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 16:35:10 +0000 (UTC)
Received: by mail-oa1-f48.google.com with SMTP id
 586e51a60fabf-e5c42b6e31so8121793fac.12
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 09:35:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XNfkRWBV8WszhVFYtMRjdEG5n7LtAJ40uPMEBMo7C28=;
 b=ts/s2WgXkSyDIOmJ05z6se8CpCb0PTRtEQfR2gBPTpM/unrTDP0loJ+KtrmKXhFgqd
 UxdL2O495SkOni7Y2q9pNYY0twL3I7l9SgY+wja8pALGSU/M7Aqm7C+0avTmM6dJtAZE
 kUWIIuCB6ykl2H1HXMUVaBnRBT7H9iNnxcU+eNpNcSOT1cC6w/5ol/R6UlsmMR6cogJG
 vy60QMG6c4ExBKo6ELsrmRYdyl5TOZgWlSgq80wTTuL8Wg9ddQ6jaeFq++10Hqqdt7UO
 EK0/YE8cDI3rVN8TTorlGNXMmFx8os+LBlVwWWNwZGDDmIuqnPffdd7YEi0ylZ61V9Qa
 Nj1A==
X-Gm-Message-State: AOAM530kLpnddHuWbqwuUNjHHJqgTd5lyMzSsMQyxyPhJcVGL31Ukuel
 tr8pWlBLcCZMASqXzD7q8g==
X-Google-Smtp-Source: ABdhPJwaBT3RDj3fcld5zJ0gTPnn/0BKOHxIX5QzeE1YgYzPAknoO483YytUktxhDpys+EshFRvQPA==
X-Received: by 2002:a05:6870:d210:b0:e2:c10b:a7b with SMTP id
 g16-20020a056870d21000b000e2c10b0a7bmr6906261oac.181.1650386109753; 
 Tue, 19 Apr 2022 09:35:09 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 q7-20020a9d6307000000b005ea12d6454bsm5468650otk.38.2022.04.19.09.35.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 09:35:09 -0700 (PDT)
Received: (nullmailer pid 2917388 invoked by uid 1000);
 Tue, 19 Apr 2022 16:35:08 -0000
Date: Tue, 19 Apr 2022 11:35:08 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v2 1/2] dt-bindings: lcdif: Add compatible for i.MX8MP
Message-ID: <Yl7kvNOUWbsgc+Hg@robh.at.kernel.org>
References: <20220417014550.293773-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220417014550.293773-1-marex@denx.de>
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
Cc: devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Robby Cai <robby.cai@nxp.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 17 Apr 2022 03:45:49 +0200, Marek Vasut wrote:
> Add compatible string for i.MX8MP LCDIF variant. This is called LCDIFv3
> and is completely different from the LCDIFv3 found in i.MX23 in that it
> has a completely scrambled register layout compared to all previous LCDIF
> variants. The new LCDIFv3 also supports 36bit address space. However,
> except for the complete bit reshuffling, this is still LCDIF and it still
> works like one.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Robby Cai <robby.cai@nxp.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: devicetree@vger.kernel.org
> ---
> V2: No change
> ---
>  Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

