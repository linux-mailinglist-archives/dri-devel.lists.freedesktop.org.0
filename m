Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A86FD4540A4
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 07:06:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73D8089126;
	Wed, 17 Nov 2021 06:06:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5084689126
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 06:06:23 +0000 (UTC)
Received: by mail-qv1-xf2c.google.com with SMTP id kl8so1294035qvb.3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 22:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=exxQZeTlLjwyYOEXvP2J7ckZPmIHzoNG3ykObH7i1Jg=;
 b=Xa5f5PaU6GwK+axztDEsAzgk22vSmE794lLj4cFjYWA/uhyo3wOod3NyMQUuDvuN3j
 RjeoTU1HsdGxqm1LlfItecJJ9wBftlAUgQohX9WD01hsqldml9/5T9l7sCi+I94N2jl9
 GKca4147Fl74hQzyY/UGIRKGDkAbjLIUEGRRs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=exxQZeTlLjwyYOEXvP2J7ckZPmIHzoNG3ykObH7i1Jg=;
 b=AFbAjUIZLZg7J7tNar8yhzgSj52qOTS1y6jqKW9WNTt+mElfY/b/n3gbOhCi+lOr/l
 d8qA1ZA1aimVZURATMrIpjFEm/QXhXmoAu7/Xxp0T3E/TZRva2HfDP43wuKIitB+vOiZ
 oq/c/nC2EkJDqMTMmWNQth73vFj1XpT/XOzhUaoLnLKkRVTVKoiy7AXYuco7TZu2xzKs
 BW1FXB/oTGmmuBT2+r57Nnb0lk/lw96QaBSNYp4z35h2ePnJ63Ks5ogD11TkH3CUmAb7
 hDecRBbYIPl2fIOewuk8k7AlIidfveCO86qRvcJ6zlt/1sTZJabyIt0IScM2Eb1z0POH
 xbLA==
X-Gm-Message-State: AOAM53113r1SB/fl5oz2terJwEzgupfbzJgsRRnbcUkDacdKnRj1OwsT
 //oNjxztWJ7yr30+vIDi/xqIBq8ZJ42ccipf6iA=
X-Google-Smtp-Source: ABdhPJyy+O6dLRTx7HA3aDStqUGjsNbJahcCfn9Mfvr+JYEnDxr5XxCFJ999s+LaaSrJJJfMSMqhU+u5CKh8Spk7Ztk=
X-Received: by 2002:a0c:eb90:: with SMTP id x16mr52902167qvo.41.1637129182078; 
 Tue, 16 Nov 2021 22:06:22 -0800 (PST)
MIME-Version: 1.0
References: <20211117054518.3555-1-tommy_huang@aspeedtech.com>
In-Reply-To: <20211117054518.3555-1-tommy_huang@aspeedtech.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 17 Nov 2021 06:06:10 +0000
Message-ID: <CACPK8XdUHZBAwcwT96Su+Fa_nenYSa75vCNpskh864Cvx04y8Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Add Aspeed AST2600 soc display support
To: tommy-huang <tommy_huang@aspeedtech.com>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, BMC-SW <BMC-SW@aspeedtech.com>,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Andrew Jeffery <andrew@aj.id.au>, Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 17 Nov 2021 at 05:45, tommy-huang <tommy_huang@aspeedtech.com> wrote:
>
> v3:
>   Refine the patch for clear separate purpose.
>   Skip to send devicetree patch

Thanks Tommy. A few things:

 - Set up your authorship in git:

 git config --global user.name "Tommy Haung"

- The "Add AST2600 chip support" patch is the same as the one I sent,
you can put mine back in your series now

- We should add a device tree bindings document

Can you confirm you tested these changes on both the ast2500 and the
ast2600? How did you test?

Cheers,

Joel


>
> v2:
>   Remove some unnecessary patch.
>   Refine for reviwer request.
>
> v1:
>   First add patch.
>
> Joel Stanley (2):
>   ARM: dts: aspeed: Add GFX node to AST2600
>   ARM: dts: aspeed: ast2600-evb: Enable GFX device
>
> tommy-huang (2):
>   drm/aspeed: Update INTR_STS handling
>   drm/aspeed: Add AST2600 chip support
>
>  arch/arm/boot/dts/aspeed-ast2600-evb.dts | 18 ++++++++++++++++++
>  arch/arm/boot/dts/aspeed-g6.dtsi         | 11 +++++++++++
>  drivers/gpu/drm/aspeed/aspeed_gfx.h      |  1 +
>  drivers/gpu/drm/aspeed/aspeed_gfx_drv.c  | 15 ++++++++++++++-
>  4 files changed, 44 insertions(+), 1 deletion(-)
>
> --
> 2.17.1
>
