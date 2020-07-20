Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E9B226EC6
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 21:15:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 656E589C28;
	Mon, 20 Jul 2020 19:15:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5E3189C28
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 19:15:19 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9568322C7B
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 19:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595272519;
 bh=y7vjF/7Gg0I1ck7MMsCAO02jGh/RyFblscWzzPbMNTY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=RFu8cSEQvecMwBh39qwG5H5zY+mfq5FmgFW9pAi1aAPgLmqfb8s1g8NFs+hmwEcuP
 r28JVhuAtnMFTscgbaDhTTbV6u8UajCLiq6hiu8uV1sn4h3LCW267xLRwYulgIJHXY
 c6FRcJPLzrqQM1toSZTDjrhPXQD3O9q30hs3GuzA=
Received: by mail-oi1-f182.google.com with SMTP id t4so15234317oij.9
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 12:15:19 -0700 (PDT)
X-Gm-Message-State: AOAM5335NxBN4svl/sLwXjRmROFSsYAFqJR0AGJeOAqOYwYlSc9eJV5f
 4zW2S7dJxjNQcDjIb56WFV/9/G3+HvJFjaxvVA==
X-Google-Smtp-Source: ABdhPJxJt9eB3LJsFXU6KUnTkSdkYxCVHUD4AW2u4MEtSuMgxN9FUFdmQ/V73vIzN2u7Age2BlV1QCfDkUb0wEfouYk=
X-Received: by 2002:aca:30d2:: with SMTP id w201mr625735oiw.147.1595272518900; 
 Mon, 20 Jul 2020 12:15:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200717144132.2206-1-laurentiu.palcu@oss.nxp.com>
 <20200717144132.2206-5-laurentiu.palcu@oss.nxp.com>
 <20200720164927.GA2650420@bogus>
 <20200720165537.kwlxwrtlmlijhuoh@fsr-ub1864-141>
In-Reply-To: <20200720165537.kwlxwrtlmlijhuoh@fsr-ub1864-141>
From: Rob Herring <robh@kernel.org>
Date: Mon, 20 Jul 2020 13:15:06 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLbYvekVe_YeCKYCDO69RtTTNBoJQ9X1n=K_ToGwrMVXg@mail.gmail.com>
Message-ID: <CAL_JsqLbYvekVe_YeCKYCDO69RtTTNBoJQ9X1n=K_ToGwrMVXg@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] dt-bindings: display: imx: add bindings for DCSS
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
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
Cc: devicetree@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 lukas@mntmn.com, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 NXP Linux Team <linux-imx@nxp.com>, Laurentiu Palcu <laurentiu.palcu@nxp.com>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 20, 2020 at 10:55 AM Laurentiu Palcu
<laurentiu.palcu@oss.nxp.com> wrote:
>
> Hi Rob,
>
> On Mon, Jul 20, 2020 at 10:49:27AM -0600, Rob Herring wrote:
> > On Fri, 17 Jul 2020 17:41:29 +0300, Laurentiu Palcu wrote:
> > > From: Laurentiu Palcu <laurentiu.palcu@nxp.com>
> > >
> > > Add bindings for iMX8MQ Display Controller Subsystem.
> > >
> > > Signed-off-by: Laurentiu Palcu <laurentiu.palcu@nxp.com>
> > > ---
> > >  .../bindings/display/imx/nxp,imx8mq-dcss.yaml | 104 ++++++++++++++++++
> > >  1 file changed, 104 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcss.yaml
> > >
> >
> >
> > Please add Acked-by/Reviewed-by tags when posting new versions. However,
> > there's no need to repost patches *only* to add the tags. The upstream
> > maintainer will do that for acks received on the version they apply.
> >
> > If a tag was not added on purpose, please state why and what changed.
>
> Well, I kind of did exactly that... in the cover letter. I stated
> clearly why this patch needs another look... :/

Put information closest to where it applies which is this patch. I
don't read cover letters typically.

R-by still stands.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
