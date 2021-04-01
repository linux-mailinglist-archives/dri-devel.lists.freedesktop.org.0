Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA3435169B
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 18:03:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 499506EC97;
	Thu,  1 Apr 2021 16:03:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AF296EC97
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Apr 2021 16:03:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7D82F61379
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Apr 2021 16:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617293026;
 bh=DDIhjfi1qYB8lYEU5sQDnqU44QrMSPnvKKTG/wBTR7E=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=n4bXsarivhKfpiMewB/SYgLxl+04RZj+PyAZrMOUXcU6zn1PWAA9jQX5WZdpLmqPH
 dBUQaswpg1qgBbgH6FxTjjTSFGwbAy+XhvqNVrQxKINOwkyyHrfYIPT9looUFT9H3N
 GM5FVKr8mFYIcQ8wmMQcy3tOI07QMjTvHmv45ea5J0NPGYhQG9eSpoik3apcq58Iz+
 fSxSCpV+F26UwYK1Jj8FnUhwuYpSQGPlmvKA6dP512/Itee7gcB6OHC5ZoKHIlDdM3
 XYqTIWNwO+QI1i5hlc0GOmW0GUYwGCkKtNlvzSe/xwIBNsAZookBPqwlrn8PMVySgC
 2N0SS0M9EHXyw==
Received: by mail-qk1-f182.google.com with SMTP id x14so2637299qki.10
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Apr 2021 09:03:46 -0700 (PDT)
X-Gm-Message-State: AOAM532qljxfhSTSGQ2EviuvB/1+h3B6ZZXFn1g/A4wqUt9V95l1sQ18
 V/l7gxRdG6ScMl67oA3J03ETC3kyMxR0nJJm7Q==
X-Google-Smtp-Source: ABdhPJwStHNYRy9pgsQh1o9wi8mUMc2/tEoZKnUVOsAiW6sjyZapwKzFBK6eZuazIzCCFNH9ne/QODq+UTX+o2r/Nm8=
X-Received: by 2002:a37:6592:: with SMTP id z140mr9203928qkb.464.1617293025609; 
 Thu, 01 Apr 2021 09:03:45 -0700 (PDT)
MIME-Version: 1.0
References: <1617172405-12962-1-git-send-email-victor.liu@nxp.com>
 <1617172405-12962-8-git-send-email-victor.liu@nxp.com>
 <1617198059.605916.2074860.nullmailer@robh.at.kernel.org>
 <2e6b0bdd03da30446448e86eff69182e417ce43f.camel@nxp.com>
In-Reply-To: <2e6b0bdd03da30446448e86eff69182e417ce43f.camel@nxp.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 1 Apr 2021 11:03:34 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLn5simeQ20jHhvdWn54DdkVHJf-f1Q4ij-1ff=vHpi-w@mail.gmail.com>
Message-ID: <CAL_JsqLn5simeQ20jHhvdWn54DdkVHJf-f1Q4ij-1ff=vHpi-w@mail.gmail.com>
Subject: Re: [PATCH v7 07/14] dt-bindings: mfd: Add i.MX8qm/qxp Control and
 Status Registers module binding
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
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <a.hajda@samsung.com>, David Airlie <airlied@linux.ie>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, Vinod <vkoul@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>,
 Robert Foss <robert.foss@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 1, 2021 at 4:18 AM Liu Ying <victor.liu@nxp.com> wrote:
>
> On Wed, 2021-03-31 at 08:40 -0500, Rob Herring wrote:
> > On Wed, 31 Mar 2021 14:33:18 +0800, Liu Ying wrote:
> > > This patch adds bindings for i.MX8qm/qxp Control and Status Registers module.
> > >
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > > ---
> > > v6->v7:
> > > * Add Rob's R-b tag.
> > >
> > > v5->v6:
> > > * Drop 'select' schema. (Rob)
> > >
> > > v4->v5:
> > > * Newly introduced in v5. (Rob)
> > >
> > >  .../devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml   | 192 +++++++++++++++++++++
> > >  1 file changed, 192 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml
> > >
> >
> > My bot found errors running 'make dt_binding_check' on your patch:
> >
> > yamllint warnings/errors:
> >
> > dtschema/dtc warnings/errors:
> > Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.example.dt.yaml:0:0: /example-0/syscon@56221000/pxl2dpi: failed to match any schema with compatible: ['fsl,imx8qxp-pxl2dpi']
> > Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.example.dt.yaml:0:0: /example-0/syscon@56221000/ldb: failed to match any schema with compatible: ['fsl,imx8qxp-ldb']
> > Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.example.dt.yaml:0:0: /example-0/phy@56228300: failed to match any schema with compatible: ['fsl,imx8qxp-mipi-dphy']
> >
>
> Sorry for the errors.
> But, my patch passes 'make dt_binding_check' locally upon
> v5.12-rc1-dontuse at least.
> My yamllint and dt-schema are up to date.
>
> Does your bot _additionally_ check all compatibles in example?
> I guess I missed something?

Yes, it now adds 'DT_CHECKER_FLAGS=-m' which is new and pending in
linux-next. It's off by default until we get rid of the ~90 existing
cases.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
