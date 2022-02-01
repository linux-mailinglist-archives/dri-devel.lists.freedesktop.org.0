Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DFD4A6287
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 18:35:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1CA710E701;
	Tue,  1 Feb 2022 17:35:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82A5210E701
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 17:35:10 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id s185so34728511oie.3
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Feb 2022 09:35:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=KjRXCGNM0itfmkq/azDMHF/U1mKtGwK0RrCt3CeCubE=;
 b=QOjwMkpRtPKqbPZM2YIUYbW0GQaP9J20RAycQ6qTZqRRVGWFgkVvc8ncwAHjO2gic/
 UdPXbEA+S9asjc3KMlPMW32jQWB2VELqlmvFHaf8O7J7QP7JgjcDl8xnRjVcUrS23S55
 B5lpeWxd1KJ0ZLh1QPLUKn6jBIGV22k3vuD6YTvAttAWZa9Sy4BF4a1+j08jkV1oBHYT
 o53H5lqfCv7/Djh1Mc4oz5WxkAygnjq5fJiK2c+/PfpcluN8tw5zhcGwCj7MM7PU6UhR
 hkFQ64I1vCLLVYBd7FFD0cL/1RiyXlXrowT6ZDbJy9kChQFQ7pgaU1h6Tb6zewneBzYN
 wusA==
X-Gm-Message-State: AOAM530NvhbXZdip4Te3m1Fs+115cQBBkM/o5cLBBYTje1GzeyDPYaHx
 Ari+GHNwEz5rWedm9aratPGVkCK4Hw==
X-Google-Smtp-Source: ABdhPJzmxtTsWo1Cd2DHJ8F3SlyConbFkELIvf4LsPjf1C4OhylpblwFxY7s+euAiFbaparvTZgFnw==
X-Received: by 2002:a05:6808:68d:: with SMTP id
 k13mr1994052oig.280.1643736909773; 
 Tue, 01 Feb 2022 09:35:09 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id h1sm16893452otb.58.2022.02.01.09.35.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 09:35:08 -0800 (PST)
Received: (nullmailer pid 252996 invoked by uid 1000);
 Tue, 01 Feb 2022 17:35:07 -0000
Date: Tue, 1 Feb 2022 11:35:07 -0600
From: Rob Herring <robh@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 1/2] dt-bindings: display: imx: Add fsl,imx21-lcdc docs
Message-ID: <YflvS007gL5mLa9k@robh.at.kernel.org>
References: <20220128105849.368438-1-u.kleine-koenig@pengutronix.de>
 <20220128105849.368438-2-u.kleine-koenig@pengutronix.de>
 <CAL_JsqJjTf2zY-n69Ozh+S1gSi5Eoa5T44Qnq9RPNgJWDLmzKQ@mail.gmail.com>
 <20220128175829.vjm66rs7eu7pk2my@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220128175829.vjm66rs7eu7pk2my@pengutronix.de>
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
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 NXP Linux Team <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 28, 2022 at 06:58:29PM +0100, Uwe Kleine-König wrote:
> Hello Rob,
> 
> On Fri, Jan 28, 2022 at 07:04:10AM -0600, Rob Herring wrote:
> > On Fri, Jan 28, 2022 at 4:59 AM Uwe Kleine-König
> > <u.kleine-koenig@pengutronix.de> wrote:
> > >
> > > From: Marian Cichy <m.cichy@pengutronix.de>
> > >
> > > This files documents the device tree for the new imx21-lcdc DRM driver.
> > 
> > No, bindings document h/w and the h/w has not changed. We already have
> > a binding for the LCDC.
> 
> Just to be sure we're talking about the same thing: You're refering to
> Documentation/devicetree/bindings/display/imx/fsl,imx-fb.txt, right?

Looks right...

> I'm unsure what to do now. Should the two different bindings just be
> described in the same file? Should I stick to fsl,imx21-fb even for the
> new binding? (The hardware unit is named LCDC, so the name chosen here
> is the better one.) Please advise.

Yes, the name is unfortunate, but it should be 1 binding, 1 file, and 
unchanged (unless you want to add new optional properties). 

Rob
