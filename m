Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA6A4C9936
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 00:20:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8A1A10E829;
	Tue,  1 Mar 2022 23:20:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F6E710E829
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 23:20:19 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id u3so30426105ybh.5
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Mar 2022 15:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NRuHwDQfsFf/qX5RgEwXTCWChzCIATGnAhJyqjBAaYo=;
 b=MS5JMM05bqeMoKbOv5HFkZNDh/5ygAmZcNaa6erlYCNNDB0eznvfa4BezEzccZ3nfF
 7jghAX2dNfdIKFoTxgA4WNxqN6v3tGQq9EUNGBUDL7y1+xps+D2+DdajX1kkvO7ScKug
 6Hhwi5VCr/fNv8QzeoH9piSuZhXHV5zI1LsRCWX4vs864gLr73YuSQiE7MneMNKLb+Uy
 BCCCdJ4tIEfjgwCY0PCghKmMAG528d5LHeUIeIDcWtwlKxLlwwBBNg01MGHY/FAAR7P9
 WyAfNzsW1sRZJ74E0lgtFiaQb6+oy389cj4s5amMJRz3aUzFZLx6Xqa8cCektW8FbvPr
 eyNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NRuHwDQfsFf/qX5RgEwXTCWChzCIATGnAhJyqjBAaYo=;
 b=VIeNmk+8fWBtbZ6SuaRzlrp1UvrCCStRNJXwTm2MmBfrCOLBi2wkoQUSMfGq21lSdV
 InUfFfcbqNqN+pAoeoODD/zyMMY5GJENV50x29rOWneBQjLcDQK08G64ffTXGqsuV2T5
 m+POW5WYb1ek1W7mwu0ItQOG6IUkpuavJes/aIm120KQjzgjdTB0SvEqswLl746mBn6G
 mdJjCX0dxDjCJaS9IvpyFUTTtrxKY46gX4iTdShplhHyKbfGkuQK8TPTFVTDvOVYV/sC
 avO+1bhBxnjVOD11sbSzQ1gqWYh0G3ec7ypv/pSOo51CEJK6bYX8tsbACn4/gnMByTU1
 xAAg==
X-Gm-Message-State: AOAM533EROp2/4jqayMi0G30XUDSQuf1Ugu6HFiw/9X8v2ZJspZG1p6i
 /4eQCuW513TXleeaI2nS+DOZHr71l8dg0keGn0Tx/Q==
X-Google-Smtp-Source: ABdhPJx5uLdMC1di+aiHYwd/pof4qKhjiOHrzsgWdYkufupYrj7rqyv1TweulH8o+yODSCgpv2ZBmSuGmNW6LFVq9wQ=
X-Received: by 2002:a25:2308:0:b0:628:9a66:7327 with SMTP id
 j8-20020a252308000000b006289a667327mr899350ybj.626.1646176818808; Tue, 01 Mar
 2022 15:20:18 -0800 (PST)
MIME-Version: 1.0
References: <20220301141247.126911-1-jagan@amarulasolutions.com>
 <20220301141247.126911-8-jagan@amarulasolutions.com>
In-Reply-To: <20220301141247.126911-8-jagan@amarulasolutions.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 2 Mar 2022 00:20:06 +0100
Message-ID: <CACRpkdb4msdDt+pqggyaMXNxs_PWNqcP1+N5RL5nVw6QxWZ1Qw@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] drm: bridge: anx7625: Switch to
 devm_drm_of_get_bridge
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
Cc: dri-devel@lists.freedesktop.org, linux-amarula@amarulasolutions.com,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 1, 2022 at 3:13 PM Jagan Teki <jagan@amarulasolutions.com> wrote:

> +       bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
> +       if (IS_ERR(bridge)) {
> +               dev_err(dev, "error to get bridge\n");
> +               return PTR_ERR(bridge);
>         }
>
>         d->bridge_out = bridge;

Also notice how this bridge gets used in other places:

struct drm_connector *connector = drm_panel_bridge_connector(mcde->bridge);

Since you deleted:

-       } else if (bridge) {
-               /* TODO: AV8100 HDMI encoder goes here for example */
-               dev_info(dev, "connected to non-panel bridge (unsupported)\n");
-               return -ENODEV;

This will now have "interesting" effects. I think.

I don't know if there is a way to solve this though?

Yours,
Linus Walleij
