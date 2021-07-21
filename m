Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3963D19D9
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 00:40:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EF4F6EB3A;
	Wed, 21 Jul 2021 22:40:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58DE26EB48
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 22:40:53 +0000 (UTC)
Received: by mail-oo1-xc2c.google.com with SMTP id
 y17-20020a4ae7110000b0290262f3c22a63so911939oou.9
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 15:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=KEVgavtFokaJseyLsj85tRS/d/rmuvKUZEz1jbsigY0=;
 b=YWntnAY45UIkoNTLLa74vviHMxh/jaVtTmvHPSSDb5RD2eo3rsagGUGXof2ePUT7dg
 kKHv+kyJqjE10h5nvKoL0VVytFjVHwqiPAAu7aB4hIw31vGX5D9/2Rp6FzkVLE+V4Vmr
 IbfnZswljUpK9UkXzyJ/jhjsELUfJxxMtjUJg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=KEVgavtFokaJseyLsj85tRS/d/rmuvKUZEz1jbsigY0=;
 b=Ux+cnrMvONOrYn9mt/JfNqoPwrn9GhtNhp3ZV1nipODmxoWRVr1s7PNJAlAy95tBaa
 OVV9Ub4f82T7i27QiwUEorO8lZNjci6OLJ/6wA0hREFg0CXySrZbarRnvycgBdHfCrhd
 8ItcGJ2gUGlKqTts9AFYZjqwIXMYCFJsjtNdy1FxNo+A9MpfuD5z15GzlkcBKKv1GJ9y
 QeMnf13gJ3/bb0k7vtoFB88OsgmzIFI74WoOyBfI519SxvQFHBNWp4eBgsCINtgA1zYe
 jX6K2N55NOhB8X81JFx++uoG/zwaHsc7UZEgvjFp+qedvVPzagbCIFydOB4cfIqg1kgN
 zuSA==
X-Gm-Message-State: AOAM531j84bOdVfomy+fYU/f4aiA4wWg5HNC7u2Mpp8YNSWfL6pXz6S9
 xdiRpSgaRDYDy4Ryvrp7sNsulAZNqbVTLVfw6PJ4HA==
X-Google-Smtp-Source: ABdhPJxntp+G+9rokY2CN2MxKmxY0rpDa6yDFX1UvyHoclObrnzcw8afQvfO/r7cISRj3JfakWdZ3O8HM3QzIH0aqwA=
X-Received: by 2002:a4a:e206:: with SMTP id b6mr25761720oot.16.1626907252629; 
 Wed, 21 Jul 2021 15:40:52 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Jul 2021 22:40:52 +0000
MIME-Version: 1.0
In-Reply-To: <1624365748-24224-3-git-send-email-rajeevny@codeaurora.org>
References: <1624365748-24224-1-git-send-email-rajeevny@codeaurora.org>
 <1624365748-24224-3-git-send-email-rajeevny@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 21 Jul 2021 22:40:52 +0000
Message-ID: <CAE-0n536DwZhxb6M1HvJHAiaChtq2vg1HfiYV+ntrjMVfpRxdQ@mail.gmail.com>
Subject: Re: [v2 2/3] drm/msm/dsi: Add PHY configuration for SC7280
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

Quoting Rajeev Nandan (2021-06-22 05:42:27)
> The SC7280 SoC uses the 7nm (V4.1) DSI PHY driver with
> different enable|disable regulator loads.
>
> Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
