Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2437A6D9D88
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 18:27:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0105A10EC5E;
	Thu,  6 Apr 2023 16:27:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com
 [209.85.160.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1562510EC5E
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 16:27:22 +0000 (UTC)
Received: by mail-oa1-f42.google.com with SMTP id
 586e51a60fabf-177b78067ffso42926413fac.7
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 09:27:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680798442; x=1683390442;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6lHF6wT2R1xBj83krcubHMI3vo+QUUkgHmi0J4qN/9Q=;
 b=fljsiXFP5Y12t2RmMYQuc6dY2iA0giidvhNSobxcyRZOcxMO/kF9ann+NIExIygQ8T
 G05Rdll/of3djB1qxy9kFQl2ov3DnOeYSibqMWLtenncga/FfYIU6WJmtZHOqrnOdnuC
 IEAHn0NOnWDVtgee+EI6s67NpRhQMrthwmJOaZ0JRvGSZRtPxaU7luj8793xWratlv3A
 NIMVjQEj67LKkoYAtseGJTccA1t1jZreDO3GUDdJh9devA+3UPwNh1cfkbho0j1EJxei
 9sE5DYUZ7TaTXRCGo8jW0Vk4GHAK0nQQ6peXg4N4K65q5ROTpctMD91XLlr0OY1Wvb8B
 cMFg==
X-Gm-Message-State: AAQBX9ca05BzV7eohdQj4cS3b0ywv+V/d4xVRKuVRiOJbLAIdLgf0HEF
 1Mrmi7dvCOs5i63WETX9M++/JDNEtw==
X-Google-Smtp-Source: AKy350Y2gpJwNABtUd8iz0/CtwUpjclbduPBTsTXu612gHBEV/4x+PJKHykUAnTUyhQzlTK2oAhGeQ==
X-Received: by 2002:a05:6870:339e:b0:180:94ca:f44e with SMTP id
 w30-20020a056870339e00b0018094caf44emr5968519oae.25.1680798442083; 
 Thu, 06 Apr 2023 09:27:22 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 zg22-20020a0568716b1600b0017197629658sm787912oab.56.2023.04.06.09.27.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 09:27:21 -0700 (PDT)
Received: (nullmailer pid 3260793 invoked by uid 1000);
 Thu, 06 Apr 2023 16:27:20 -0000
Date: Thu, 6 Apr 2023 11:27:20 -0500
From: Rob Herring <robh@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v3] dt-bindings: bridge: Convert Samsung MIPI DSIM bridge
 to yaml
Message-ID: <20230406162720.GA3170910-robh@kernel.org>
References: <20230404023057.510329-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230404023057.510329-1-festevam@gmail.com>
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
Cc: marex@denx.de, neil.armstrong@linaro.org, Fabio Estevam <festevam@denx.de>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>, krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 03, 2023 at 11:30:57PM -0300, Fabio Estevam wrote:
> From: Jagan Teki <jagan@amarulasolutions.com>
> 
> Samsung MIPI DSIM bridge can be found on Exynos and NXP's 
> i.MX8M Mini/Nano/Plus SoCs.
> 
> Convert exynos_dsim.txt to yaml.
> 
> Used the example node from exynos5433.dtsi instead of the one used in
> the legacy exynos_dsim.txt.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
> Changes since v2:
> - Took previous Rob Herring's feedback into account:
> https://lore.kernel.org/all/20210712151322.GA1931925@robh.at.kernel.org/
> - Handled imx8mn and imx8mp.
> - Remove unnecessary #address-cells/size-cells.
> 
>  .../display/bridge/samsung,mipi-dsim.yaml     | 255 ++++++++++++++++++
>  .../bindings/display/exynos/exynos_dsim.txt   |  92 -------
>  MAINTAINERS                                   |   1 +
>  3 files changed, 256 insertions(+), 92 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt

Applied to drm-misc-next.

Rob
