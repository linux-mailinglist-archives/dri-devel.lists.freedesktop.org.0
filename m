Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9D92DFEAD
	for <lists+dri-devel@lfdr.de>; Mon, 21 Dec 2020 18:02:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C272A6E1F1;
	Mon, 21 Dec 2020 17:02:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 214F66E1F1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Dec 2020 17:02:30 +0000 (UTC)
X-Gm-Message-State: AOAM533/vSlnN+QfD21ruOLuhQ4ol6RCIwaDPhWviIRAvszj1gidkpCD
 WMUugECei0Xe6uXCD1lZqs9HQspJ9/ZkJKtv9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608570149;
 bh=sM2h0j23PeJTO6+PcsYlN9mlNfNiXmH7qyR3e9tb3wM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=rOyb/DMq0Hh13z9j0QVStgXnrHF0eq62ty9SgCN1yggfbCmBQBM179JEgVHBuXCc1
 6heBkKX/VFo5/tCR3+72VGLfX6r9bW9HFPK4JNj5xcmRIshH9IRSwZAN/EvY5c33EF
 SV9JtIZzDM/eCsQ4FLaokPUNfoOsAGghICnE3onTepoPuKXeQ6UrhEAWnCw2KElr9V
 lTDLgPQ2eKQ5Cq8z77spGiyzltixVk+ojaSIc+xO8cdRrh1aOdJRTReQyoQCwFlMmX
 6Wpls3fpzTecfpOgFahmyDtBG/HOeb1whYQ6XupOaVjqitsJL4gmK8xoKzzSA+Fw/z
 89oHL0A0kNKHA==
X-Google-Smtp-Source: ABdhPJyqv5o//R7x196Z0J60E9ub+RYHgqamRUaGDALQ1v/tFOUnEqsnw8wdxZIIFVIvQXlwN1g3Xsu6Oag7LC3jWc8=
X-Received: by 2002:a05:622a:18d:: with SMTP id
 s13mr17492349qtw.306.1608570148922; 
 Mon, 21 Dec 2020 09:02:28 -0800 (PST)
MIME-Version: 1.0
References: <1608199173-28760-1-git-send-email-victor.liu@nxp.com>
 <1608199173-28760-5-git-send-email-victor.liu@nxp.com>
 <1608231036.357497.50647.nullmailer@robh.at.kernel.org>
 <e2edc2e37b6905fd19ada4c212338c6978200fa5.camel@nxp.com>
 <CAL_JsqLcyUJWt_gc3B01C0Y+NC61ucYNA8j1jnxTs8U1kudM=Q@mail.gmail.com>
 <1e0b6178033c064b99546d09b4b3ef9dda3cb1ad.camel@nxp.com>
In-Reply-To: <1e0b6178033c064b99546d09b4b3ef9dda3cb1ad.camel@nxp.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 21 Dec 2020 10:02:17 -0700
X-Gmail-Original-Message-ID: <CAL_JsqLCvAWQN=54Rp08bPxLjeXZKo5Pc1a=hoNBFjcGdLGvcg@mail.gmail.com>
Message-ID: <CAL_JsqLCvAWQN=54Rp08bPxLjeXZKo5Pc1a=hoNBFjcGdLGvcg@mail.gmail.com>
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

On Fri, Dec 18, 2020 at 9:15 PM Liu Ying <victor.liu@nxp.com> wrote:
>
> Hi,
>
> On Fri, 2020-12-18 at 16:42 -0600, Rob Herring wrote:
> > On Thu, Dec 17, 2020 at 7:48 PM Liu Ying <victor.liu@nxp.com> wrote:
> > >
> > > Hi,
> > >
> > > On Thu, 2020-12-17 at 12:50 -0600, Rob Herring wrote:
> > > > On Thu, 17 Dec 2020 17:59:23 +0800, Liu Ying wrote:
> > > > > This patch adds bindings for i.MX8qm/qxp pixel combiner.
> > > > >
> > > > > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > > > > ---
> > > > >  .../display/bridge/fsl,imx8qxp-pixel-combiner.yaml | 160
> > > > > +++++++++++++++++++++
> > > > >  1 file changed, 160 insertions(+)
> > > > >  create mode 100644
> > > > > Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-
> > > > > pixel-combiner.yaml
> > > > >
> > > >
> > > > My bot found errors running 'make dt_binding_check' on your
> > > > patch:
> > > >
> > > > yamllint warnings/errors:
> > > >
> > > > dtschema/dtc warnings/errors:
> > > > Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-
> > > > pixel-combiner.example.dts:19:18: fatal error: dt-
> > > > bindings/clock/imx8-lpcg.h: No such file or directory
> > > >    19 |         #include <dt-bindings/clock/imx8-lpcg.h>
> > > >       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > > compilation terminated.
> > > > make[1]: *** [scripts/Makefile.lib:342:
> > > > Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-
> > > > pixel-combiner.example.dt.yaml] Error 1
> > > > make[1]: *** Waiting for unfinished jobs....
> > > > make: *** [Makefile:1364: dt_binding_check] Error 2
> > > >
> > > > See
> > > > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.ozlabs.org%2Fpatch%2F1417599&amp;data=04%7C01%7Cvictor.liu%40nxp.com%7C96806e0ce6bc40c936fa08d8a3a64551%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637439281816690986%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=Cjyszb0alRE5z2OGKdZZEg5PQpH11U%2BGqVt6couCLGE%3D&amp;reserved=0
> > > >
> > > > This check can fail if there are any dependencies. The base for a
> > > > patch
> > > > series is generally the most recent rc1.
> > >
> > > This series can be applied to linux-next/master branch.
> >
> > I can't know that to apply and run checks automatically. I guessed
> > that reviewing this before sending, but I want it abundantly clear
> > what the result of applying this might be and it wasn't mentioned in
> > this patch.
> >
> > Plus linux-next is a base no one can apply patches to, so should you
> > be sending patches based on it? It's also the merge window, so maybe
>
> I sent this series based on drm-misc-next.  This series is applicable
> to linux-next/master, and may pass 'make dt_binding_check' there.

But to be clear, 'make dt_binding_check' would fail on drm-misc-next
until 5.11-rc1 is merged in. The drm-misc maintainers need to know
that.


> I'll mention dependencies in the future where similar situations
> appear. Thanks.
>
> BTW, does it make sense for the bot to additionaly try linux-next if
> needed?  Maybe, that'll be helpful?

Sure, and when I've got nothing else to do maybe I'll do that. Though
maintainers still need to know what the dependencies are. The real
solution here is to make 'base-commit' tags more common or required so
that neither scripts/bots nor humans have to guess what the base is.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
