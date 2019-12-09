Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C8B11826C
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 09:40:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47C5689D87;
	Tue, 10 Dec 2019 08:40:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E12696E486
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 14:45:19 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id c20so13744459wmb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2019 06:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8zvLIh1fKJn6XMcG/J+M/fuqTgxFZLX92p2+j85jx1w=;
 b=FhZFgoXzxhD9EcN6lhIAyTnxDxhTVTSpmRj1a6c8LoSftEF5EVqswjxkRqQkBzCaQa
 u19cHhC8/une7ZW0aQ4NJuvCqht7ZcgizdvHwhBejrdRMk4QevdYsXElVqotNEVqe+jq
 kPphcAW9Oy0FnK9te3ZLfLyMW5DR4uFaWw26iA2gF1huSWewVMEXrojOcC5V8SBsgylz
 u+3FuVuZcMhsp5/+jyFHH3aGsj0miNMWgXdGtQJR0lqLIE7jW3et2zwkU2+lY3zJScND
 WxbD/BBiJ3ptwPVMXy7hFR9tT/0CKCk76dKuVaW6A+bTwwIUXgMz2PEI6Fhr7+QwjY1Y
 LA4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8zvLIh1fKJn6XMcG/J+M/fuqTgxFZLX92p2+j85jx1w=;
 b=fsR+H/qwljvb5fpQA25YqslUlVRlBq4t4lPoTpbv27tTw8tf069IIu5gWyH9BsVISA
 DrrlWv31u/kSeg7Vw8fPa0SjxJuMC3CtsrWwUHbMvpGWLzaynzYUezEFY10P0AbbL3nP
 toy76sG8no2ji6tTi3OL3d8H/6RhJBZvI7YmUbbIljNOv1DpjVcNTGGZLBXkI2Uv1+JX
 8Mi2VBq9Cgew4SrBgkOWZ4CqeIkmcw4himag7cN2IWuryCcwXQbHX5JfpOZ2rZVsDTId
 xSpKAVUMLf070o393Sr872VRtuNngGH342N7D/P3dmdsuCo5rbYZhm623MWpguG6ZB95
 JZvA==
X-Gm-Message-State: APjAAAXHZGoEnMjn3Q/6ApoViUDLjioC2JZckTAYeWwKSl21E4+vhadS
 NUBEy/0v0ivaYDxoW9l8mIv1BkKyIw7zxYb6UMA=
X-Google-Smtp-Source: APXvYqy27kHD4jjFDks2ntedSrUO8NkKwnnguCCFY39ACfZ8bi1ngZNHs4z3GG+mqEYAsKrMWXysnkDNFn8p2bhf9ko=
X-Received: by 2002:a7b:cb02:: with SMTP id u2mr24458897wmj.142.1575902718240; 
 Mon, 09 Dec 2019 06:45:18 -0800 (PST)
MIME-Version: 1.0
References: <20191209082707.24531-1-tomi.valkeinen@ti.com>
In-Reply-To: <20191209082707.24531-1-tomi.valkeinen@ti.com>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Mon, 9 Dec 2019 06:45:06 -0800
Message-ID: <CAHQ1cqHJYrDzrK9AUOGdF8uggLNHOS1pfZfbJcicPnYBXzddsA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: tc358767: fix poll timeouts
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
X-Mailman-Approved-At: Tue, 10 Dec 2019 08:40:04 +0000
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
Cc: dri-devel@lists.freedesktop.org,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>, Jyri Sarha <jsarha@ti.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+ Chris Healy

On Mon, Dec 9, 2019 at 12:27 AM Tomi Valkeinen <tomi.valkeinen@ti.com> wrote:
>
> Link training fails with:
>
>   Link training timeout waiting for LT_LOOPDONE!
>   main link enable error: -110
>
> This is caused by too tight timeouts, which were changed recently in
> aa92213f388b ("drm/bridge: tc358767: Simplify polling in tc_link_training()").
>
> With a quick glance, the commit does not change the timeouts. However,
> the method of delaying/sleeping is different, and as the timeout in the
> previous implementation was not explicit, the new version in practice
> has much tighter timeout.
>
> The same change was made to other parts in the driver, but the link
> training timeout is the only one I have seen causing issues.
> Nevertheless, 1 us sleep is not very sane, and the timeouts look pretty
> tight, so lets fix all the timeouts.
>
> One exception was the aux busy poll, where the poll sleep was much
> longer than necessary (or optimal).
>
> I measured the times on my setup, and now the sleep times are set to
> such values that they result in multiple loops, but not too many (say,
> 5-10 loops). The timeouts were all increased to 100ms, which should be
> more than enough for all of these, but in case of bad errors, shouldn't
> stop the driver as multi-second timeouts could do.
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Fixes: aa92213f388b ("drm/bridge: tc358767: Simplify polling in tc_link_training()")

Tested on RDU2 with TC358767/eDP panel, doesn't seem to break anything
there, so:

Tested-by: Andrey Smirnov <andrew.smirnov@gmail.com>

> ---
>  drivers/gpu/drm/bridge/tc358767.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
> index 8a8d605021f0..0454675a44cb 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -294,7 +294,7 @@ static inline int tc_poll_timeout(struct tc_data *tc, unsigned int addr,
>
>  static int tc_aux_wait_busy(struct tc_data *tc)
>  {
> -       return tc_poll_timeout(tc, DP0_AUXSTATUS, AUX_BUSY, 0, 1000, 100000);
> +       return tc_poll_timeout(tc, DP0_AUXSTATUS, AUX_BUSY, 0, 100, 100000);
>  }
>
>  static int tc_aux_write_data(struct tc_data *tc, const void *data,
> @@ -637,7 +637,7 @@ static int tc_aux_link_setup(struct tc_data *tc)
>         if (ret)
>                 goto err;
>
> -       ret = tc_poll_timeout(tc, DP_PHY_CTRL, PHY_RDY, PHY_RDY, 1, 1000);
> +       ret = tc_poll_timeout(tc, DP_PHY_CTRL, PHY_RDY, PHY_RDY, 100, 100000);
>         if (ret == -ETIMEDOUT) {
>                 dev_err(tc->dev, "Timeout waiting for PHY to become ready");
>                 return ret;
> @@ -861,7 +861,7 @@ static int tc_wait_link_training(struct tc_data *tc)
>         int ret;
>
>         ret = tc_poll_timeout(tc, DP0_LTSTAT, LT_LOOPDONE,
> -                             LT_LOOPDONE, 1, 1000);
> +                             LT_LOOPDONE, 500, 100000);
>         if (ret) {
>                 dev_err(tc->dev, "Link training timeout waiting for LT_LOOPDONE!\n");
>                 return ret;
> @@ -934,7 +934,7 @@ static int tc_main_link_enable(struct tc_data *tc)
>         dp_phy_ctrl &= ~(DP_PHY_RST | PHY_M1_RST | PHY_M0_RST);
>         ret = regmap_write(tc->regmap, DP_PHY_CTRL, dp_phy_ctrl);
>
> -       ret = tc_poll_timeout(tc, DP_PHY_CTRL, PHY_RDY, PHY_RDY, 1, 1000);
> +       ret = tc_poll_timeout(tc, DP_PHY_CTRL, PHY_RDY, PHY_RDY, 500, 100000);
>         if (ret) {
>                 dev_err(dev, "timeout waiting for phy become ready");
>                 return ret;
> --
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
