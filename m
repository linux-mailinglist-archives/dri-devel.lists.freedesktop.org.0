Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C79D5382782
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 10:51:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF01B6E901;
	Mon, 17 May 2021 08:51:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 664436E901
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 08:51:01 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id c17so4472513pfn.6
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 01:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k+uEjOsRVN+pB4hd2Muc710zjpcCWqHrlB6JKHzbhcY=;
 b=KLty9evHZn7EqkaXSGojnk/JkLocOwV9WBKIv6wjz6wqMacqatsoZsjKr/h18icLRL
 kGOLBubiPNaDvwnJ+hgtDXvazKFQZUXKPKgA8iXbsDr5HX7E+uJohavKcsQK5E9rgu8N
 3MtizK9b6y32icZaGcR2zQQ133uaozrUCxA3ulSuV+R3EFJ+s6IJZctfjTqF++CdJnf6
 oK/7zJUxqS/3WVv5tHjMA7ukIUzaEBvgmax4dCCyOlg6Q0t6X/6Zz9iwUxhJL6rLOsI6
 aLB3mn5cVrgxZ6RkweOsuKDT8RqyF2uPfg6FIAKQU+ZRM1QUSVODE6d1C5IIEnp1VSsM
 +fEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k+uEjOsRVN+pB4hd2Muc710zjpcCWqHrlB6JKHzbhcY=;
 b=HKnPolGIj47fzH3bSASXKhNj6ITTPFrh3nqQr0l4oo67D05mHuSqNrcJ/xoTiWlcFU
 kTWfp91Dn/LaqvKydT1GV1ZSTg5WP5vB9s8JGDDgDUMS4g3DVYTgKNR8xRxjUM29TUdd
 X9rBAfNsjX+oDZOQsxZgQYGwZaj+eVvjqvYJRFTYqYD+c/VQgtKrD9+JNSizTJdCy772
 H03TWl4Sen+Clxf1Nfk4NF7rHuIUkIj8MRT/ziHi4o8NXUl1me4XP5cg0NkDP6AxY8Ez
 uDd46biNzjhGK2EXfKGboPFf0wklYJH2ooxA8BeRkZSgDmSd0w9G1Qh5ML6SHUvnv3If
 o7ow==
X-Gm-Message-State: AOAM530N/a2yGBcumHnZvyZSs55Wl+mR9XT+68xgeYtK/uhdD5lNqFSW
 NdODjhHlKtIglxtn4K5jKkASe43P9uJxKF03i+F13A==
X-Google-Smtp-Source: ABdhPJxhAX1QS/4ah6ZYhzP6xMO7Wq4GVZTq8fM0zlwsOJynQnZxRoAuZGB5c/lI8spDb81X2Q6oAsOgVtUh17oh6T0=
X-Received: by 2002:a63:1054:: with SMTP id 20mr7243032pgq.120.1621241461009; 
 Mon, 17 May 2021 01:51:01 -0700 (PDT)
MIME-Version: 1.0
References: <1620801955-19188-1-git-send-email-zou_wei@huawei.com>
In-Reply-To: <1620801955-19188-1-git-send-email-zou_wei@huawei.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 17 May 2021 10:50:50 +0200
Message-ID: <CAG3jFyvfO0L3JczeWZVE7hbcxL9rw3ub7=nQ2H1nkYkmhZz4RA@mail.gmail.com>
Subject: Re: [PATCH -next] drm/bridge: lt9611: Add missing MODULE_DEVICE_TABLE
To: Zou Wei <zou_wei@huawei.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Zou,

On Wed, 12 May 2021 at 08:29, Zou Wei <zou_wei@huawei.com> wrote:
>
> This patch adds missing MODULE_DEVICE_TABLE definition which generates
> correct modalias for automatic loading of this driver when it is built
> as an external module.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zou Wei <zou_wei@huawei.com>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
> index e8eb8de..29b1ce2 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> @@ -1215,6 +1215,7 @@ static struct i2c_device_id lt9611_id[] = {
>         { "lontium,lt9611", 0 },
>         {}
>  };
> +MODULE_DEVICE_TABLE(i2c, lt9611_id);
>
>  static const struct of_device_id lt9611_match_table[] = {
>         { .compatible = "lontium,lt9611" },
> --
> 2.6.2
>

This looks good to me, I've picked this change into drm-misc-next.

https://cgit.freedesktop.org/drm/drm-misc/commit/?id=8d0b1fe81e18eb66a2d4406386760795fe0d77d9
