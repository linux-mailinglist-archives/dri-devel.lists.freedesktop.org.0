Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F1A11A6C3
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 10:21:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 530E76EAAD;
	Wed, 11 Dec 2019 09:20:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E44C76E9C6
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 06:30:05 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id i11so21427805ioi.12
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 22:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bjERGv8zTPuKf+pd9e6agOntPUIPd6jhQ0FGJz7CMgw=;
 b=NJJMbsFRPqUSiXKRNyslavyTZBVvLMkMWPJR6Au7F1tE2NF+fbsDSKU2c96fuV9ygm
 M1p/3jIpo47aXw0KfkH6ByA2Vb8VGq1XRgkhSeyz4tDIG+4relXxE3I1ykCaiEKYobwC
 yuKn1VXzlzzavtyW4FH3DFJv4xAgJgdLI0Bbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bjERGv8zTPuKf+pd9e6agOntPUIPd6jhQ0FGJz7CMgw=;
 b=WgM/dCYADoHNS/2utP+VnPFAoshLgaWQz2Bx+30i375q0o7b6YRphXqS4NAyo4xjG4
 Zxq1eoWngrBy/OY5JncqUOxg8gbsjk++JLXTHo4vqvIhX9qN3IUX1a9h6J/vPH6lFzFg
 tOpFtbXNDR0PxX9LbDtkUe98PwUbxx3gxPzxedc0Zr84d2mGwJmOyAHuNip2YkXYqwpB
 DsRleMCIlEl6uOoaJJZrSCoFXJVt3232+4jDnTLv4OqR5rRXgXyxJciPShUt1kqe8Q4J
 xk/yGm4BVXmW/AS9sTNmsaILUgyNAt8zhYFTbWY/VaPoGl/bUsDkHg9myNok8z9xrZhH
 +SXw==
X-Gm-Message-State: APjAAAVtq/uoHF6DxmFLUNv3q8B1Oq+80YfbjBUlrSLE0Sq8hT2phV3h
 DNv9oLI4Hctw2LAHqhajCUYmCcE3dPu5zvbPOi1Haw==
X-Google-Smtp-Source: APXvYqziiJrdEfCxDd7Xh67HAmqfkwdZiCfCsNrEzylOml6uSgFt7MnVlus0HfeCyNXza6xVZQgTAVqAfh3+XsQJMow=
X-Received: by 2002:a5e:c204:: with SMTP id v4mr1483055iop.106.1576045805107; 
 Tue, 10 Dec 2019 22:30:05 -0800 (PST)
MIME-Version: 1.0
References: <20191209145016.227784-1-hsinyi@chromium.org>
 <20191209145016.227784-2-hsinyi@chromium.org>
 <20191209145326.GC12841@pendragon.ideasonboard.com>
In-Reply-To: <20191209145326.GC12841@pendragon.ideasonboard.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Wed, 11 Dec 2019 14:29:39 +0800
Message-ID: <CAJMQK-iwSaTXSPBFbK_N_1NcD+qfJJwwzso-j44H3VjKwv9myg@mail.gmail.com>
Subject: Re: [PATCH RESEND 1/4] dt-bindings: drm/bridge: analogix-anx7688: Add
 ANX7688 transmitter binding
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailman-Approved-At: Wed, 11 Dec 2019 09:20:35 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Archit Taneja <architt@codeaurora.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <mbrugger@suse.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 9, 2019 at 10:53 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
Hi Laurent,

> How about converting this to yaml bindings already ? It's fairly simple
> and gives you DT validation.
>
Added in https://lore.kernel.org/lkml/20191211061911.238393-1-hsinyi@chromium.org/T/#m183b3822bf60101666436b0244b27275c6765d20

Thanks
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
