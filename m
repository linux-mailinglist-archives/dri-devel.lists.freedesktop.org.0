Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E00D53242BF
	for <lists+dri-devel@lfdr.de>; Wed, 24 Feb 2021 18:01:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D726E059;
	Wed, 24 Feb 2021 17:01:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 957196E059
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Feb 2021 17:01:32 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id j9so3467125edp.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Feb 2021 09:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WIaWLlRGMPWjJAANsdhm+dxvE3B3PRnitJWx+eVprg8=;
 b=hHt2LHfZIrOKnIfRckmAg+Yq/qIAkw5e+fAWcDfPizCozNYpxuHndetb0bIgO0HaV4
 vPfnFXpTnTetk0vb2tM/+XUzPiYn/LgxErMIKzFWuXy7h/cF3ZtUCeJ2deFUQkGZNZIG
 agX74bsYx8h5rrXrYRQr7D6l9S8to6FDPJ8HU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WIaWLlRGMPWjJAANsdhm+dxvE3B3PRnitJWx+eVprg8=;
 b=daFw+ghO9Ha8jcquN5TrSlRrCfFREcbRm3rK91NRPkij+bGGUGFFdkaiaibZ90XJzX
 lGJ1PmeiBQAjk7UmJAuz/ozNdiCmXUbz/v2z1W//U7rT9suzDdmporVteXt0I33JF8N9
 FFIZVanbAkyhCBbSTaHh9mAKRmn2OWNw/RfK3CD8ZRAuiEsfn2Jm3QvnYCOLhwu9+b3q
 XbqkkhTLNEsMAFRSe8vp8aq1bK/GBOSpKBGVxvnyXjNArqOXqxlYC6HHTDm+vmKqDxZ4
 M/htrsfZ/oD50VIjNgzSTLwfQBWy+DmrbUvZQcJ1q8srZkrddOUP1ax7PFQsxluU6drq
 PU5g==
X-Gm-Message-State: AOAM530rXJlCQ0ek0yd20DmnGVz1nxDrztDxCG0Zee6QN8tkOONUPFJG
 FZNKxiplAad+BulfN1Twh8VphZN3u3Ax2tSu4GrfIQ==
X-Google-Smtp-Source: ABdhPJzewAeTReHo9MUCUjKxOFpTyAYWsLI54xHmLfOtoCpl2BcLo1l69SMDTPxOObL/cpT7apO4a73B0/+MWuq3JXw=
X-Received: by 2002:aa7:c542:: with SMTP id s2mr14136553edr.369.1614186091162; 
 Wed, 24 Feb 2021 09:01:31 -0800 (PST)
MIME-Version: 1.0
References: <20210203091306.140518-1-jagan@amarulasolutions.com>
 <f9cfa159-ac88-325b-d971-7c860fa722ff@foss.st.com>
In-Reply-To: <f9cfa159-ac88-325b-d971-7c860fa722ff@foss.st.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 24 Feb 2021 22:31:19 +0530
Message-ID: <CAMty3ZAfy7M7TnM_sb0FqPSFYqc1cLGPXB7S-AE=oUST78dYNA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: dw-mipi-dsi: Move drm_bridge_add into probe
To: yannick Fertre <yannick.fertre@foss.st.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Heiko Stubner <heiko@sntech.de>
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
Cc: Marek Vasut <marex@denx.de>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jonas Karlman <jonas@kwiboo.se>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Philippe Cornu <philippe.cornu@st.com>, Yannick Fertre <yannick.fertre@st.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Vincent Abriou <vincent.abriou@st.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Yannick,

Thanks for testing this change.

On Mon, Feb 15, 2021 at 1:39 PM yannick Fertre
<yannick.fertre@foss.st.com> wrote:
>
> Hello Jagan, I tested your patch on the stm32mp1 board.
> Unfortunately, the dsi panel does not probe well with this patch. The
> problem is due to the panel which is placed in the node of the dsi
> bridge (no problem with i2c devices).
>
> Regarding component bindings for stm drivers, I am currently working on
> a new version.

1. All non-I2C bridges are attaching dsi via mipi_dsi_attach during
the bridge controller probe and that would be expecting
panel_or_bridge need to be in DSI host attach.

2. I2C bridges are attaching dsi via mipi_dsi_attach during the bridge
attach function and that would be expecting panel_or_bridge need to be
in DSI probe.

I believe these types of DSI controllers followed by DSI panels,
bridges are not available in Mainline. if I'm not mistaken.

Adding component bindings in this regards never helps, this seems to
be common for component or non-components DSI host drivers.

One way to handle this issue can be during drm helper initialization,
like attaching the dsi host instead of calling directly from bridge or
panel drivers.

Laurent, Heiko - let me know your suggestions if it make sense, thanks.

Jagan.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
