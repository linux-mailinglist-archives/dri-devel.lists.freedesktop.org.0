Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F198522DEDD
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jul 2020 14:04:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A55189DA4;
	Sun, 26 Jul 2020 12:04:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6457189DA4;
 Sun, 26 Jul 2020 12:04:25 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 40BAB2065E;
 Sun, 26 Jul 2020 12:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595765065;
 bh=LJxegL2P5hNKR910G8c/QDoI1uB2BfRFQ4PeiQJwStQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Xy0KtmyrKY0jX8tITQlUegCxmDYNtTsgBZMQUvwmUrdMbIF0cVKjshR0MQeIGNHRj
 u3dZWeWJc5V9C/OxmUSuefkUN6fX7aAq8RXQINPs/V1QurcwpCNTAP9KonYrK9ZOLC
 qACyVZsJwgPmYtOqUITCkz9UKqybv0a91ujrcAaY=
Date: Sun, 26 Jul 2020 14:04:22 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Konrad Dybcio <konradybcio@gmail.com>
Subject: Re: [PATCH 9/9] soc/qcom: Add REVID driver
Message-ID: <20200726120422.GA1292190@kroah.com>
References: <20200726111215.22361-1-konradybcio@gmail.com>
 <20200726111215.22361-10-konradybcio@gmail.com>
 <20200726112920.GA1286220@kroah.com>
 <CAMS8qEV7jhbHqpXE2UOaXBVM5WbCThaGrcD3wiH9kf6h_K-qeA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMS8qEV7jhbHqpXE2UOaXBVM5WbCThaGrcD3wiH9kf6h_K-qeA@mail.gmail.com>
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
Cc: Krzysztof Wilczynski <kw@linux.com>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-clk@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@ti.com>, Martin Botka <martin.botka1@gmail.com>,
 Andy Gross <agross@kernel.org>, Brian Masney <masneyb@onstation.org>,
 DTML <devicetree@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Xiaozhe Shi <xiaozhes@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <sean@poorly.run>, Ben Dooks <ben.dooks@codethink.co.uk>,
 Felipe Balbi <balbi@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 linux-usb@vger.kernel.org, Harigovindan P <harigovi@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 zhengbin <zhengbin13@huawei.com>, Manu Gautam <mgautam@codeaurora.org>,
 Vinod Koul <vkoul@kernel.org>, freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jul 26, 2020 at 01:40:46PM +0200, Konrad Dybcio wrote:
> >Horrible global symbol name.  Who calls this?
> 
> Welcome to development on qcom platforms :D

Yeah, I have seen :(

> >This is the last patch in
> >the series, so if there is no user for this, please don't export it.
> 
> Other downstream drivers make use of it.. need to get this up first, sorry :V

Then use a proper name for it, with a correct prefix, and export it with
EXPORT_SYMBOL_GPL() please.

> >Why do you need a .h file in the include directory if only a single .c
> >file needs it?  Just put that info in the .c file itself.
> 
> Again, other downstream drivers which some people and I intend to
> bring to upstream standards use that to access the PMIC model/hw revision.

But all of those defines are not needed, just the function name, right?

> >But again, who uses this module?  If it's only good for a single line in
> >the kernel log, that feels like a huge waste to me.
> 
> downstream-kernel-dir$ rg -l qpnp-revid.h | wc -l
> 25
> 
> So yeah, quite a bunch of other qcom-specific drivers.
> 
> I'll try to fix these and send a v2.

Hold off on this and wait until there is a real user for it, as we can
not take api additions without a user, otherwise we will just come along
and delete the code.

Submit it as part of a series that actually uses the function, so we can
at least see if the function makes sense to be used in that way as well,
right now we have no clue.

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
