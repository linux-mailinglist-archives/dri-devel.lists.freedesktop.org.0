Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC77C201FCB
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jun 2020 04:33:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF07C6ED0D;
	Sat, 20 Jun 2020 02:32:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D9546ED0D
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jun 2020 02:32:55 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id u23so8791778otq.10
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 19:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0D6RM81CHxtLSPNd2h5o+DyxuvzJSa5Nzy3+jmmUj6k=;
 b=kVSbdH9SLZhwQmFcOG+gMjul+MkxrpcfmmL5nmRC8j3xNsYEAGsXj5Ad47nXUniYS1
 PZc0bfZYz5BSae/9VozU/EhlVyuy4YFoz3hPBpPgIHrjmMrlFKZiZhnofnPcILGl4ScO
 t7vzCj+Zum03GDj4Q9ndBVVMKYO7bUhHNf8ha76qXC2YG6tlYcXK9v8Is/4HfwPCKgR3
 HIjbrPfrot3wmhDhuPovWXb8NCmq4ZkzpEsNF/lcfeOS/bT3d9I5vKROM2bKMjG5YIAL
 BrehL9e118MzeTeXR11y6VOZtXts/3lPlw2h1duJUZzom6sHt70zltClI55Q0ZNh3vKq
 FZgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0D6RM81CHxtLSPNd2h5o+DyxuvzJSa5Nzy3+jmmUj6k=;
 b=WLy0PBevM4D78RLLw4ghcPYsDAwMXPXBBDhdIi1aK/3+v4E+u73fYr1EQQoeT6lzSv
 iAmjS4or2zgHj/uI64Di9sZPognu2LAA7vkWMKk0urR6+v4IbEJQMg2SdnoFth7Xa0GR
 c0C5tZtuG8Sq50KgeExnaKn416mKT4CnyBfxun+WihnQy/USRnFZVOWwITXfN/oNiAr2
 A/XeQK6UAQxpa8lvsWvi/ZDlQhRLOoiVoMmNJIho09PPQiP+tXjsPHJO01QG2vcmCKtJ
 1bYmFkhMl5N3n/74QjhXljP1i5sKl0pHcAakVal4ulu8FfHS1ydMSjaB/MIEXe1FrKHA
 TrRw==
X-Gm-Message-State: AOAM530ObCtHMBeHyXRR8U209LEY6kZXNr9z1DkRp0HYl68woZ4Fuaq7
 EFcUwyAutQAYMgufKc/xpKpRb+D+STR2KvmvZvMi1Q==
X-Google-Smtp-Source: ABdhPJxEiXH06dVVQQgwAAkquvCNpg4wOXt0fbkrP+XzPPPLx6X3/Hj0NM4tYLWfkqawUdxNY3Oz2MPc1FLWO8yu84s=
X-Received: by 2002:a9d:67d6:: with SMTP id c22mr5217355otn.221.1592620374200; 
 Fri, 19 Jun 2020 19:32:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200617105950.3165360-1-vkoul@kernel.org>
In-Reply-To: <20200617105950.3165360-1-vkoul@kernel.org>
From: John Stultz <john.stultz@linaro.org>
Date: Fri, 19 Jun 2020 19:32:43 -0700
Message-ID: <CALAqxLWSBrYWK8ggzd7JU4F8QGuLpP6D5ENxzYc8XXype84Jyw@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Add LT9611 DSI to HDMI bridge
To: Vinod Koul <vkoul@kernel.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Emil Velikov <emil.l.velikov@gmail.com>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 17, 2020 at 4:00 AM Vinod Koul <vkoul@kernel.org> wrote:
>
> This series adds driver and bindings for Lontium LT9611 bridge chip which
> takes MIPI DSI as input and HDMI as output.
>
> This chip can be found in 96boards RB3 platform [1] commonly called DB845c.
>
> [1]: https://www.96boards.org/product/rb3-platform/
>
> Changes in v3:
>  - fix kbuild reported error
>  - rebase on v5.8-rc1
>
> Changes in v2:
>  - Add acks by Rob
>  - Fix comments reported by Emil and rename the file to lontium-lt9611.c
>  - Fix comments reported by Laurent on binding and driver
>  - Add HDMI audio support
>
> Vinod Koul (3):
>   dt-bindings: vendor-prefixes: Add Lontium vendor prefix
>   dt-bindings: display: bridge: Add documentation for LT9611
>   drm/bridge: Introduce LT9611 DSI to HDMI bridge

Hey Vinod,
  Thanks for pushing these!
I know same-company tags aren't super valuable, but I'm actively using
these patches for HDMI/audio support on the db845c w/ AOSP.

So for what it's worth, for the series:
Tested-by: John Stultz <john.stultz@linaro.org>

thanks
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
