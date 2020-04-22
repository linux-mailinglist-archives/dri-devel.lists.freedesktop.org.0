Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6401B55CD
	for <lists+dri-devel@lfdr.de>; Thu, 23 Apr 2020 09:37:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 720DA6E25A;
	Thu, 23 Apr 2020 07:36:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98F2789D8D
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 21:13:02 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id gr25so2985966ejb.10
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 14:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X1ihfPfQEm2aQwNzlV21Qu7y5TOw2uGbX6A635/ijcM=;
 b=a0cqNtVTTV+nhgMWLbfLbZJ1KDdwX/sQv0li7sAMa4YncTjRvmpf42R5qaJyoSk7xZ
 4fjblaEI1rkZU5E11tn1LivEd4rKY+iP0xqgwcoj0sWC79s6mY+p/Wvg8DMbuKUojeTk
 MKvLPlLE6a4MGwQsxRn1mzMVhI0UyQVxYWDBcIZ3BdQSMJNEk4GkWdo7ixo7B+9pTKz8
 nIvQM2yHiwbKRGcLES7cQFiaBaxGH+dI2un2gH0az0StWT7pBtvNwrPqdLF9J7wspqE2
 /Yj6lBV3bIcU57XdmeaokjOO+H7H9cVnl7HnZ0rrrD6/ox6h0Oh+VCg+zp2ZPVeBLn8m
 od5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X1ihfPfQEm2aQwNzlV21Qu7y5TOw2uGbX6A635/ijcM=;
 b=sVot8x4Y9koBsj/xLvr7I3NBXKLOdjcjN0urx2Lc6iSP2jj6zro4IIxQNL+iYr90eA
 Rww5F0FUSz71m8AS9uVzQYIslPRKZKsAJ4OT9dvjUMv+eE8/RXlsUtaZ5eWpldCG6Yux
 9z7ir38tV9xgbnv95nkKBkHIH10lxck8GBI3BwM+bE/hKbsFF2QLY12E4h0EHjPR/OH1
 Z9fm5sNEq2r7Z8/oiwAk5o93JACDnFdlwFNSJaXGZPOUn/9iL9sxq0tkDp68vGZtkzPR
 diwfAK4oCIj4jkSJ8UGWINJEr4/pH+a4GpHdFjDcImQtKA9IpJ+h/SD25xbBDXuvDhZ6
 MjHg==
X-Gm-Message-State: AGi0PubZo8cncRNMjNPjw+1Kf8YTKZQGYtMk8gQKtQG2mfwUV+V2v6fT
 vqz1sLUVcnmsgfjK9PRg/vEYwUIHZmODrLEII/A=
X-Google-Smtp-Source: APiQypJFSh3bXWuJ7x6+DbhV4xicuxImfcUvi6SvtUeplKK7p+MxUJ6HoV3iLTo8/qjdhHIAUdqX4A3BxnHAJhLGxbQ=
X-Received: by 2002:a17:906:1199:: with SMTP id
 n25mr287851eja.30.1587589981187; 
 Wed, 22 Apr 2020 14:13:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200421134410.30603-1-narmstrong@baylibre.com>
In-Reply-To: <20200421134410.30603-1-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 22 Apr 2020 23:12:50 +0200
Message-ID: <CAFBinCAGP7ZE-OksaE=6E54r2e0VJk2wMTEwKU65qAoR4dQvxw@mail.gmail.com>
Subject: Re: [PATCH] drm/meson: add mode selection limits against specific SoC
 revisions
To: Neil Armstrong <narmstrong@baylibre.com>
X-Mailman-Approved-At: Thu, 23 Apr 2020 07:36:39 +0000
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
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil,

On Tue, Apr 21, 2020 at 3:44 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
[...]
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index e8c94915a4fc..dc3d5122475a 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -695,6 +695,13 @@ dw_hdmi_mode_valid(struct drm_connector *connector,
>         dev_dbg(connector->dev->dev, "%s: vclk:%d phy=%d venc=%d hdmi=%d\n",
>                 __func__, phy_freq, vclk_freq, venc_freq, hdmi_freq);
>
> +       /* Check against soc revision/package limits */
> +       if (priv->limits) {
> +               if (priv->limits->max_hdmi_phy_freq &&
> +                   phy_freq > priv->limits->max_hdmi_phy_freq)
> +                       return MODE_CLOCK_HIGH;
> +       }
I think that this will also be useful for the 32-bit SoCs as well.
is there a chance you can move it to meson_vclk_vic_supported_freq
(called right below), where all the existing frequency limit checks
are already?


Thank you!
Martin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
