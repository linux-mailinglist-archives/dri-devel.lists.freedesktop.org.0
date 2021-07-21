Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E1B3D19D2
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 00:40:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E85356EB47;
	Wed, 21 Jul 2021 22:40:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D7136EB3A
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 22:40:12 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 o17-20020a9d76510000b02903eabfc221a9so3627504otl.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 15:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=Q4wvBXyV2lJ1aTRox0e1+Ok+AEaw/CVcGBs0YMHYsP0=;
 b=XqZH1FzW4TAdt+62lo9scgkSGaBidkfe9huO0q1U3Ro1mui8RWXUgDF4qzAHCY6Ru+
 iZ8zSponbgyYt6LXGU0IodEXLM8IGxpYpjT2JbWrcYJxLuLC7ydskbWTAd4EndoQ0uzM
 zAZJ+shbHzcPMS1D4t5gFzBXtgmxI7uFF4NFo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=Q4wvBXyV2lJ1aTRox0e1+Ok+AEaw/CVcGBs0YMHYsP0=;
 b=EwWNxQSxSedDyxYZwMAxVE/lQMfXj/Q7vk8mh8d79ViNb48DEAuEDqrzEIJ/f8yJzH
 D3CVKzRMjgdXCifBPpK3zUca789wPY8UNXsD2wAwBJtI6yTEalobgCi/7F7fg1jMtpyi
 +UkGLOYewzJ7U2Z9XdaRTHsYjBlYbL66gzLYVWGw+PlpdQauObwjDsPJyHrXHnwABvIQ
 ZjIybsWpq+FWZgbOmjtfYptLtdUHSiZdy4OEiSNvUkU2Dgy0zj9WLKmSngCrs7NF55Js
 yF/n9TWqhikUkzV++2zclLoKLo17zICYLawhSAefr97//BMEv54OWVFQmIMcT6mm5aYP
 QJFw==
X-Gm-Message-State: AOAM5331OBfznD4NcCAH/jwGMuZqNPFC7TqYr8OeyzBdCa9/tx7SwI/1
 FmsIZGNpc1DZfyivupLNlUv1GkA9RQyOrF5r9q7Iog==
X-Google-Smtp-Source: ABdhPJwocIiRhFwFOnsM81FkofvQbBA36K0D5dCAYY3+kDkw8/j6vCVRW/AWV4EzATwWCQE40EPyTZCpO+0f5mG/y5g=
X-Received: by 2002:a9d:8c7:: with SMTP id 65mr27826933otf.25.1626907211418;
 Wed, 21 Jul 2021 15:40:11 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Jul 2021 22:40:11 +0000
MIME-Version: 1.0
In-Reply-To: <1624365748-24224-2-git-send-email-rajeevny@codeaurora.org>
References: <1624365748-24224-1-git-send-email-rajeevny@codeaurora.org>
 <1624365748-24224-2-git-send-email-rajeevny@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 21 Jul 2021 22:40:10 +0000
Message-ID: <CAE-0n50Km=XxJ93ZJkwcWWJdzvBba_We=bZYzkdYKoB-cwTYkg@mail.gmail.com>
Subject: Re: [v2 1/3] dt-bindings: msm/dsi: Add sc7280 7nm dsi phy
To: Rajeev Nandan <rajeevny@codeaurora.org>, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org
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
Cc: jonathan@marek.ca, mkrishn@codeaurora.org, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, robh+dt@kernel.org, kalyan_t@codeaurora.org,
 dmitry.baryshkov@linaro.org, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Rajeev Nandan (2021-06-22 05:42:26)
> The SC7280 SoC uses the 7nm (V4.1) DSI PHY driver.
>
> Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
