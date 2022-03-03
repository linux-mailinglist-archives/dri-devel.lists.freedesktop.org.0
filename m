Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EC44CC60E
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 20:35:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B54EC10EB52;
	Thu,  3 Mar 2022 19:34:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D0BD10EB52
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 19:34:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AEF2BB82626
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 19:34:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58F31C36AE2
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 19:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646336094;
 bh=qZLIT90F4XcplM2Lo3kJ4q65/znkvPWFcOp2eDwbEIs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=O8pgv7tGknqom+09KiuHD5GRcYP/ohbBHnXPelng8Yi0MmNgyuNCc8GkwVCINEy7P
 HhDeTtYhnm98tBJYI0e7FYR4OPj1mE/7nlJDO0RLz7Z7PghGTJvJN5cYn6He6nmemH
 6SXsaoJwKkL2Ees+CBz7ah+TrQyFuJ3ecLeqwD3tbMLxst3tk2bGFYKJz7K5MBpavY
 KgKsWaVfv1UASAmeg/OGip1yhG0cdl41ogh2gYsbPqHEg6Pl5p/n7Zr0+bLdob4y0Q
 YPILwxzcPQfOtJlHG486I4nH3sZZYSZGsEWYXeVQjWFPpZvNgXtuVKjtJ7lf9BzLZB
 KGzlM4rSEqEQw==
Received: by mail-ej1-f50.google.com with SMTP id a23so12899141eju.3
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Mar 2022 11:34:54 -0800 (PST)
X-Gm-Message-State: AOAM531bUWUKhMtQGECTLVW7FP0iDbSHcrmKLcdULpyA9POcMOFfQnH2
 nmJWMEyVM5vVycBv/WxdbJkY1i7mmT7sQb+mhg==
X-Google-Smtp-Source: ABdhPJx0hlwzgKGdlH4tw49VP50LJrLmoRLBkcohsBvqowt5gK8H0KLMAqPTBTvqX8a4DBd0nJg6hrqm54G1z2AvljU=
X-Received: by 2002:a17:906:181a:b0:6d0:ebf5:c064 with SMTP id
 v26-20020a170906181a00b006d0ebf5c064mr27654515eje.82.1646336092554; Thu, 03
 Mar 2022 11:34:52 -0800 (PST)
MIME-Version: 1.0
References: <20220302051056.678367-1-joel@jms.id.au>
 <Yh+w7+CdtYYJoRkh@robh.at.kernel.org>
In-Reply-To: <Yh+w7+CdtYYJoRkh@robh.at.kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Thu, 3 Mar 2022 13:34:40 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+zDTfZaYf3H98rub8e-fSmtFFQ_ok=cQ3bqPojx0_Ckg@mail.gmail.com>
Message-ID: <CAL_Jsq+zDTfZaYf3H98rub8e-fSmtFFQ_ok=cQ3bqPojx0_Ckg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpu: Convert aspeed-gfx bindings to yaml
To: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree@vger.kernel.org, linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Andrew Jeffery <andrew@aj.id.au>, Tommy Haung <tommy_huang@aspeedtech.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 2, 2022 at 12:01 PM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Mar 02, 2022 at 03:40:56PM +1030, Joel Stanley wrote:
> > Convert the bindings to yaml and add the ast2600 compatible string.
> >
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > ---
> >  .../devicetree/bindings/gpu/aspeed,gfx.yaml   | 69 +++++++++++++++++++
> >  .../devicetree/bindings/gpu/aspeed-gfx.txt    | 41 -----------
> >  2 files changed, 69 insertions(+), 41 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/gpu/aspeed,gfx.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/gpu/aspeed-gfx.txt
>
> Applied, thanks.

Uggg, now dropped...

What's Documentation/devicetree/bindings/mfd/aspeed-gfx.txt and also
the example in Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml?
Please sort those out.

Rob
