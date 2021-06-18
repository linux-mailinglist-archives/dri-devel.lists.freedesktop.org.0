Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA263ACBC9
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 15:10:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADB6E6EA05;
	Fri, 18 Jun 2021 13:10:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD8F16EA05
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jun 2021 13:10:46 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id v12so4640766plo.10
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jun 2021 06:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xeflnMpXCc8lQl488t2UyqqllAHiO3IjtrjGZgwxjE8=;
 b=l4JvENXKS+0wuXa9Dd7ASyOi+R2Ra1aLIyA3k6/hFxsit72DMEgc04M2UT1qYk5Sb0
 WspU0VkFFL2rOaKiwcWlw6iLuFtDYrkBFGTYnoWKOx0j5yPXk6liOpjHGfCyYCF/WXSb
 uXLJ80qb0RBPXArA/ItZJI05DK9fbVDKsCbP3OrZS+F9FIA+kjubUgtL33FY+wHQvdqA
 IlUzws0eoYgmiXbL1Aog1Fxp9UDyg8ViwDqml0U9R5abh5W+c3OtLIc3PDV145QF493k
 5OazSdv+z0dulHEsk7iosWreirruFs8y3ZBkwSFKYQtqA7QikIbxeVkqaV7+ISh+MZWf
 fr6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xeflnMpXCc8lQl488t2UyqqllAHiO3IjtrjGZgwxjE8=;
 b=FyIsf3rvNyveL6FIGPLpBbLgn4FNVN5FRxj9cU6gjG9vNVg1SCyELkqavbbaRzWP9z
 dDqg8OtygZtz2vstMoII9Hr2xL0PT7H2VJ31StQmqwfqFKNZDrfWyIHRQu4LakR9qhVA
 +alb1OzUi1BJL1WEfzELyDaSf5vtzgktNl7xKFkdnUc3wMI9D9QOtWqERn98XfnYtHgp
 Cqe9VQWinRxodlOEDYpx+MNSmYrY2okkqFHVKbvep82DKzY4BfWPo128EcD7M5Pds3+Y
 64U0mhPl8JOLF8eJjkTP8CWHDo5Py8sNF+w70YLqZ//a3j3DdqNuNXd838CJnhJczklz
 nQcw==
X-Gm-Message-State: AOAM533LtpeIFqb19Zi1ddRjxS/OgSabIh0RRyjr9KDfZQZrnhkr7bBB
 +g2raxpiIgxJ6bNjLeVoLtxCj80dj5vu1o5d0Ss=
X-Google-Smtp-Source: ABdhPJzcSX6tm09hnesQWqlEKd9p2OWaX9DN17n4s3XcCvm5NLcAdCBgDPUZFvnKjiSXNhS667ToHT0D90tnVJ9s7Nk=
X-Received: by 2002:a17:90a:880c:: with SMTP id
 s12mr11065571pjn.66.1624021846430; 
 Fri, 18 Jun 2021 06:10:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210203091306.140518-1-jagan@amarulasolutions.com>
In-Reply-To: <20210203091306.140518-1-jagan@amarulasolutions.com>
From: Jonathan Liu <net147@gmail.com>
Date: Fri, 18 Jun 2021 23:10:33 +1000
Message-ID: <CANwerB1Bev8Ljta9OyO6vAKsQqHHmaJnjV1YRGmY4bVk_J6xZA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: dw-mipi-dsi: Move drm_bridge_add into probe
To: Jagan Teki <jagan@amarulasolutions.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jonas Karlman <jonas@kwiboo.se>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Philippe Cornu <philippe.cornu@st.com>, Yannick Fertre <yannick.fertre@st.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Vincent Abriou <vincent.abriou@st.com>, linux-amarula@amarulasolutions.com,
 linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan,

On Wed, 3 Feb 2021 at 09:13, Jagan Teki <jagan@amarulasolutions.com> wrote:
> @@ -1167,6 +1151,20 @@ __dw_mipi_dsi_probe(struct platform_device *pdev,
>         dw_mipi_dsi_debugfs_init(dsi);
>         pm_runtime_enable(dev);
>
> +       ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0,
> +                                         &panel, &bridge);
> +       if (ret)
> +               return ERR_PTR(ret);

On RK3399 if the error is EPROBE_DEFER, __dw_mipi_dsi_probe can be
called again and result in the following errors:
[    0.717589] debugfs: Directory 'ff960000.mipi' with parent '/'
already present!
[    0.717601] dw-mipi-dsi-rockchip ff960000.mipi: failed to create debugfs root
[    0.717606] dw-mipi-dsi-rockchip ff960000.mipi: Unbalanced pm_runtime_enable!

Regards,
Jonathan
