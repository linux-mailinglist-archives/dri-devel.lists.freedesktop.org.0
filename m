Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3972DEBB3
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 23:42:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 444E689A8B;
	Fri, 18 Dec 2020 22:42:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BE9B89A8B
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 22:42:52 +0000 (UTC)
X-Gm-Message-State: AOAM5309EAOynbC2tnR69t2al90das7yFWISiReT0+flA5GGwEhNItAn
 6lb3ffgtGeVJVQLL3jIt4/aQf9J7F/3SHEYVxA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608331372;
 bh=teoJSCyQ35FKEt1l7jtvY4FHIkY/MC2pFjf82N1a7x8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=rDvnvJ1UGc/yxbETR9SFwICtFriCq8S4SSVtPzMw72dOKmv+I0MUwOj9IMZE3AMf7
 +2gjY1d0XvwnkYMgeqXRuDWFgxEvXlLIoNGPFMzl/Rb6IflnUHep5jreJWOybSR56Z
 E4Z8j7LEZluuCZFIb85pL5xAg9+sAtUFYK8Soy55f4uYLWUZM9ChFZaTY5c7iJdrmz
 +ao4eqgwT771hMZRAc28mZL4EU2P4H3u8h8kI1EwJojM0v0vaSR7NP7e/9TvIQ8mZJ
 XkoxTvy2gl8AAI/669RLYd1oxQFMsfji9ElenKbnSncRuePtTM7B7oqqm4oXLzGCTD
 xmd8Kqc+xP8zA==
X-Google-Smtp-Source: ABdhPJw9CmTiK/5DXVy1oCGmEYJHnWGGuOTm6/bF1LcvdA7fZjYwB/Q4rwq8PO2wpAomgkDuC068Sj33ePY0fBORLGQ=
X-Received: by 2002:a17:906:1197:: with SMTP id
 n23mr6123853eja.359.1608331370605; 
 Fri, 18 Dec 2020 14:42:50 -0800 (PST)
MIME-Version: 1.0
References: <1608199173-28760-1-git-send-email-victor.liu@nxp.com>
 <1608199173-28760-5-git-send-email-victor.liu@nxp.com>
 <1608231036.357497.50647.nullmailer@robh.at.kernel.org>
 <e2edc2e37b6905fd19ada4c212338c6978200fa5.camel@nxp.com>
In-Reply-To: <e2edc2e37b6905fd19ada4c212338c6978200fa5.camel@nxp.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 18 Dec 2020 16:42:39 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLcyUJWt_gc3B01C0Y+NC61ucYNA8j1jnxTs8U1kudM=Q@mail.gmail.com>
Message-ID: <CAL_JsqLcyUJWt_gc3B01C0Y+NC61ucYNA8j1jnxTs8U1kudM=Q@mail.gmail.com>
Subject: Re: [PATCH 04/14] dt-bindings: display: bridge: Add i.MX8qm/qxp pixel
 combiner binding
To: Liu Ying <victor.liu@nxp.com>
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Neil Armstrong <narmstrong@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Vinod <vkoul@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sascha Hauer <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 17, 2020 at 7:48 PM Liu Ying <victor.liu@nxp.com> wrote:
>
> Hi,
>
> On Thu, 2020-12-17 at 12:50 -0600, Rob Herring wrote:
> > On Thu, 17 Dec 2020 17:59:23 +0800, Liu Ying wrote:
> > > This patch adds bindings for i.MX8qm/qxp pixel combiner.
> > >
> > > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > > ---
> > >  .../display/bridge/fsl,imx8qxp-pixel-combiner.yaml | 160 +++++++++++++++++++++
> > >  1 file changed, 160 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.yaml
> > >
> >
> > My bot found errors running 'make dt_binding_check' on your patch:
> >
> > yamllint warnings/errors:
> >
> > dtschema/dtc warnings/errors:
> > Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.example.dts:19:18: fatal error: dt-bindings/clock/imx8-lpcg.h: No such file or directory
> >    19 |         #include <dt-bindings/clock/imx8-lpcg.h>
> >       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > compilation terminated.
> > make[1]: *** [scripts/Makefile.lib:342: Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.example.dt.yaml] Error 1
> > make[1]: *** Waiting for unfinished jobs....
> > make: *** [Makefile:1364: dt_binding_check] Error 2
> >
> > See https://patchwork.ozlabs.org/patch/1417599
> >
> > This check can fail if there are any dependencies. The base for a patch
> > series is generally the most recent rc1.
>
> This series can be applied to linux-next/master branch.

I can't know that to apply and run checks automatically. I guessed
that reviewing this before sending, but I want it abundantly clear
what the result of applying this might be and it wasn't mentioned in
this patch.

Plus linux-next is a base no one can apply patches to, so should you
be sending patches based on it? It's also the merge window, so maybe
wait until rc1 when your dependency is in and the patch can actually
be applied. Also, the drm-misc folks will still need to know they need
to merge rc1 in before this is applied.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
