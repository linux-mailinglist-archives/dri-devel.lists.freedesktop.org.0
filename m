Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 970815B2BBE
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 03:38:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2689C10E8B9;
	Fri,  9 Sep 2022 01:38:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com
 [209.85.161.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE9D510E170
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 01:38:07 +0000 (UTC)
Received: by mail-oo1-f54.google.com with SMTP id
 q6-20020a4aa886000000b0044b06d0c453so65705oom.11
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Sep 2022 18:38:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=nRIFgaZTQg3GTMp42p+xtgZU3B5YCuKF0IgaGfelaL8=;
 b=Pf7FrLGW3wFrpDaMEhGxP5SLQPUomr0WZcWuBdFP/K6IvPsgMweISC8v5D2dBVWEbR
 /DbTy0TOkt/LDndjVwsGhjF+N+dGOO80EUSF7gW+zZneVch2XCtyJBGxlUN2xev+yIVX
 lbXyZ4YZxcbRj/1ON6vokSQqO71ilvXgK3Fdoq7f/5CuI9LLSqDHQtggZVMXtYl9okD7
 h+/hw7gH1txBSMTRhxi/4xRIx0wBOE9comDpdEaB6VxKobGfG0xL1tW6L0bgwh66N3iU
 NvR8adSERXgXynZpyhz8AW0ngKjqIo3NCmgUFCjisQATangIgf77lTZIHQPzcEvR+M1O
 rCNw==
X-Gm-Message-State: ACgBeo2Q1UdkxUr7jAZLZ3r7rOJEjAnWJPKEip1Lil2cd5IC53rtm5Zw
 n6ao0emC45k0RTzn+Ln1Xg==
X-Google-Smtp-Source: AA6agR5Ri1cpDqeioMDMRveNKAA9XWfPiesLEzehJ7tTC54BrN5u5TocdJnGNPB59gIW0p0DXxZjDw==
X-Received: by 2002:a4a:d085:0:b0:448:93e6:bb67 with SMTP id
 i5-20020a4ad085000000b0044893e6bb67mr3980181oor.55.1662687486989; 
 Thu, 08 Sep 2022 18:38:06 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 w20-20020a056871061400b0012763819bcasm411419oan.50.2022.09.08.18.38.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 18:38:06 -0700 (PDT)
Received: (nullmailer pid 3737271 invoked by uid 1000);
 Fri, 09 Sep 2022 01:38:05 -0000
Date: Thu, 8 Sep 2022 20:38:05 -0500
From: Rob Herring <robh@kernel.org>
To: Chris Morgan <macroalpha82@gmail.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: phy-rockchip-inno-dsidphy: add
 compatible for rk3568
Message-ID: <20220909013805.GA3737238-robh@kernel.org>
References: <20220906174823.28561-1-macroalpha82@gmail.com>
 <20220906174823.28561-3-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220906174823.28561-3-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, pgwipeout@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, airlied@linux.ie, s.hauer@pengutronix.de,
 hjc@rock-chips.com, dri-devel@lists.freedesktop.org, kishon@ti.com,
 linux-rockchip@lists.infradead.org, vkoul@kernel.org, robh+dt@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>, linux-phy@lists.infradead.org,
 cl@rock-chips.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 06 Sep 2022 12:48:20 -0500, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add a compatible string for the rk3568 dsi-dphy.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  .../devicetree/bindings/phy/rockchip,px30-dsi-dphy.yaml          | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
