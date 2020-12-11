Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E692D807F
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 22:11:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8F256ECA0;
	Fri, 11 Dec 2020 21:11:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f68.google.com (mail-oo1-f68.google.com
 [209.85.161.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 703EE6ECA0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 21:11:08 +0000 (UTC)
Received: by mail-oo1-f68.google.com with SMTP id x203so2492485ooa.9
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 13:11:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=4NTTHHr7mOEfXkNGuntp7FwEGD1KvufY8eCqfkNsfa0=;
 b=TmCRWfah0gH9zj0HhAdrqdyr0Tr+SwSbAZYGUXCXxWDxK0a+bPHK+i9kiQXJ0m7B5O
 rLqFx9sNf1kHbam5n7mXZjOXxo+4bjV+mjozT3KnjT83mKS1EEBtUVToZz10+rvIo3uy
 gtMz6vRXhTs7qTrpelQwwe4qF+Mx6mLWbn4MRrn+TjlGwPhoFKUmo1zf85Ydm8LnQ3zz
 mlJHlcNMlHllTwT5HmlT6/7BdXPEY31oAWk3EoHUOWPnLUqpJqJWpMRXj1BaWgnJAz3l
 Qt3QOyIk78Oxws9DNuBtQolM/gx2tnJBoGVjiNrEQ8FIPa8Y2fKvxUcV3gBcTW6P9JNg
 4vig==
X-Gm-Message-State: AOAM531PtjzcVplEB9EqOCsIFQFmtTh5Y0+Yh1IPm3kJY4fGrCq1EdIY
 qyaMEqg40BV6NtAWmJLvLw==
X-Google-Smtp-Source: ABdhPJwphA/KS8Koyk+lG6TgLm2qa0Xhv6kCYJOy86qcVxZjNNgyYmG8jsym2vhi/WQbA/2+Hm/s0A==
X-Received: by 2002:a4a:6f01:: with SMTP id h1mr9883394ooc.88.1607721067665;
 Fri, 11 Dec 2020 13:11:07 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id f201sm1888766oig.21.2020.12.11.13.11.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Dec 2020 13:11:06 -0800 (PST)
Received: (nullmailer pid 942618 invoked by uid 1000);
 Fri, 11 Dec 2020 21:11:05 -0000
Date: Fri, 11 Dec 2020 15:11:05 -0600
From: Rob Herring <robh@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH v3 3/5] dt-bindings: phy: Convert mixel, mipi-dsi-phy to
 json-schema
Message-ID: <20201211211105.GA942315@robh.at.kernel.org>
References: <1607651182-12307-1-git-send-email-victor.liu@nxp.com>
 <1607651182-12307-4-git-send-email-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1607651182-12307-4-git-send-email-victor.liu@nxp.com>
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@siol.net, jonas@kwiboo.se,
 airlied@linux.ie, martin.kepplinger@puri.sm, agx@sigxcpu.org,
 narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kishon@ti.com, a.hajda@samsung.com,
 vkoul@kernel.org, robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com,
 kernel@pengutronix.de, robert.chiras@nxp.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 linux-imx@nxp.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 11 Dec 2020 09:46:20 +0800, Liu Ying wrote:
> This patch converts the mixel,mipi-dsi-phy binding to
> DT schema format using json-schema.
> =

> Comparing to the plain text version, the new binding adds
> the 'assigned-clocks', 'assigned-clock-parents' and
> 'assigned-clock-rates' properites, otherwise 'make dtbs_check'
> would complain that there are mis-matches.  Also, the new
> binding requires the 'power-domains' property since all potential
> SoCs that embed this PHY would provide a power domain for it.
> The example of the new binding takes reference to the latest
> dphy node in imx8mq.dtsi.
> =

> Cc: Guido G=FCnther <agx@sigxcpu.org>
> Cc: Kishon Vijay Abraham I <kishon@ti.com>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v2->v3:
> * Improve the 'clock-names' property by dropping 'items:'.
> =

> v1->v2:
> * Newly introduced in v2.  (Guido)
> =

>  .../devicetree/bindings/phy/mixel,mipi-dsi-phy.txt | 29 ---------
>  .../bindings/phy/mixel,mipi-dsi-phy.yaml           | 72 ++++++++++++++++=
++++++
>  2 files changed, 72 insertions(+), 29 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/phy/mixel,mipi-dsi-=
phy.txt
>  create mode 100644 Documentation/devicetree/bindings/phy/mixel,mipi-dsi-=
phy.yaml
> =


Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
