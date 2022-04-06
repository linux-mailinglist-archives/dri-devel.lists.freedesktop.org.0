Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 105A74F6892
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 20:06:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D9C510E082;
	Wed,  6 Apr 2022 18:06:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75DA110E082
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 18:06:16 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id
 o20-20020a9d7194000000b005cb20cf4f1bso2241265otj.7
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Apr 2022 11:06:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=mapsUp2+I33ND3daVtV6AK1NgRWB9QWJP8jtKMtudVk=;
 b=gtlIp7HU7iw6Xk38RhAQBKQZoDTndTFHHKXRHBdxOIdKZBSudBVE4wNIjKM8Q4lkk0
 Lz8YQP63liP49hXPz5MyV7cP2uNHPbhtqpcSACALLcg+XAzsjRWbVUsJJNphg8kyJW5m
 ZYlq2nQxyj4by5sTWB/RXsCMPKHKwB/hjGyR5fi9HqZmtFU/SHNtUVZhS+1/JGdCIU9T
 8V1JeaC5UkPi8Xq8AII47KE7wh2k4pIfyEFM7hTrDLGGfY8cZNxF/7UCNUaTW6HDTVxI
 gKMYi5uVpKBBD0Fk9eMxiLL0yA5x/bRV6Aw+trnheSwUotwp+tqC9gXO1/lTv+eNXukh
 Si/A==
X-Gm-Message-State: AOAM532su2lhWqr4hXwhAzmIOEjsZ6kmofXRMbxnwdsW5GGrxs9mpJ3U
 Kriwj2bPLlDBywz8Ag43Jg==
X-Google-Smtp-Source: ABdhPJwFbqFy9etlTR1T9Kv4Ky5l4Epw9rIl+VRSuSYXXo96nvElNTmrTHljsMbPryXGnSvoX6EKOA==
X-Received: by 2002:a9d:6855:0:b0:5b2:33ba:7392 with SMTP id
 c21-20020a9d6855000000b005b233ba7392mr3595609oto.150.1649268375718; 
 Wed, 06 Apr 2022 11:06:15 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 w133-20020acadf8b000000b002ef9fa2ba84sm6802599oig.12.2022.04.06.11.06.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 11:06:14 -0700 (PDT)
Received: (nullmailer pid 2511559 invoked by uid 1000);
 Wed, 06 Apr 2022 18:06:13 -0000
Date: Wed, 6 Apr 2022 13:06:13 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] dt-bindings: display: panel: mipi-dbi-spi: Make
 width-mm/height-mm mandatory
Message-ID: <Yk3WlX11eu0HRkN7@robh.at.kernel.org>
References: <20220404192105.12547-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220404192105.12547-1-marex@denx.de>
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
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 devicetree@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>, robert.foss@linaro.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Dmitry Osipenko <digetx@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 04 Apr 2022 21:21:05 +0200, Marek Vasut wrote:
> Make the width-mm/height-mm panel properties mandatory
> to correctly report the panel dimensions to the OS.
> 
> Fixes: 2f3468b82db97 ("dt-bindings: display: add bindings for MIPI DBI compatible SPI panels")
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Dmitry Osipenko <digetx@gmail.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Noralf Trønnes <noralf@tronnes.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> To: dri-devel@lists.freedesktop.org
> ---
>  .../devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml   | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
