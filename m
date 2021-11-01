Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7044441FD0
	for <lists+dri-devel@lfdr.de>; Mon,  1 Nov 2021 19:10:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82CFC6E1F1;
	Mon,  1 Nov 2021 18:10:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 253B46E1F1
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Nov 2021 18:10:23 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id y128so26114656oie.8
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Nov 2021 11:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=RTpcjCaKMjk8wOfkGg+XhDUUHXGzz0r5LuC/nlABn74=;
 b=Hms4n8EsBYjDqEWRwfdorGPR19Sl0b3GXGDHqXv7432wT6aufk+qulIlNLvHRxWc7Y
 6GqpCN/WAvrnAbLSSgUR8ItaRk4yqFg2tqM2BQjivbc736Aqte31NKEF7KwCFIxJWVEp
 h49MfXiHYM8ZfKMRwLGJRHnF18Z+2mV7PY2yQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=RTpcjCaKMjk8wOfkGg+XhDUUHXGzz0r5LuC/nlABn74=;
 b=3Z3eLHuoWeTudHmvfNGsaXmi84nlVjV0WucmGEKFQfMLTF3CjBenPf0fPrxuA759GR
 DaovqW8qO9U71UerbcaHxD2bhVLULWOKZA3cK3mHTUq7G7LC3I7feNjwrWQZo/18tm3o
 AW6aJYnrpXgmWCEy8pzQmKPL2uo0rb7dw2Jpg+2W4uofyQaOPIJDeEqh28W5VyGuIWM9
 bviOwoPR1yyDV/f6YltUlbAOCiiWKuIJL2eNvqjYogxPn62ImljC3wDMqaWk/908Vvku
 wHnQ3dtbtORTbOH9/qHWeOmqRpHZ4Sk87WdT8cS5YShK9iBO4btR9kvoWj/BgI1gu9dp
 Z07g==
X-Gm-Message-State: AOAM531MvtF+jCWW2P6nruC6rL1p9vxppTD3193wsi0AkPlBi1QoX2Rx
 9BYBiUXCkfKLW+uRyF8La346bGyWp4F7FyEro81fzw==
X-Google-Smtp-Source: ABdhPJzgFmKoi4uMfFK3RymVte6R4WSjg8lMx4INzmZ1qraDiHERExAQVxP6DSOAOu0WpWxcuwqOAr8FQwmKA+sd1BU=
X-Received: by 2002:a05:6808:2307:: with SMTP id
 bn7mr519321oib.32.1635790222358; 
 Mon, 01 Nov 2021 11:10:22 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 1 Nov 2021 11:10:21 -0700
MIME-Version: 1.0
In-Reply-To: <20211030100812.1.I6cd9af36b723fed277d34539d3b2ba4ca233ad2d@changeid>
References: <20211030100812.1.I6cd9af36b723fed277d34539d3b2ba4ca233ad2d@changeid>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Mon, 1 Nov 2021 11:10:21 -0700
Message-ID: <CAE-0n529Nfp7rOA4a4dtvh83rPxjVQ2VK0uDORgzOWmSsDa6rA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dsi: set default num_data_lanes
To: LKML <linux-kernel@vger.kernel.org>, Philip Chen <philipchen@chromium.org>
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
Cc: robdclark@chromium.org, freedreno@lists.freedesktop.org,
 Nicolas Boichat <drinkcat@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, Bernard Zhao <bernard@vivo.com>,
 linux-arm-msm@vger.kernel.org, dianders@chromium.org,
 Abhinav Kumar <abhinavk@codeaurora.org>, Yangtao Li <tiny.windzz@gmail.com>,
 dri-devel@lists.freedesktop.org, Viresh Kumar <viresh.kumar@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Philip Chen (2021-10-30 10:08:50)
> If "data_lanes" property of the dsi output endpoint is missing in
> the DT, num_data_lanes would be 0 by default, which could cause
> dsi_host_attach() to fail if dsi->lanes is set to a non-zero value
> by the bridge driver.
>
> According to the binding document of msm dsi controller, the
> input/output endpoint of the controller is expected to have 4 lanes.
> So let's set num_data_lanes to 4 by default.
>
> Signed-off-by: Philip Chen <philipchen@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
