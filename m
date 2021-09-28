Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC3641B90F
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 23:11:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E61C56E2C8;
	Tue, 28 Sep 2021 21:11:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81DF76E2C8
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 21:11:24 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id s24so160480oij.8
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 14:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GbWbdXoE6xizT93Ir1J+j8iVAb59AF1M9auCdjMcU/k=;
 b=Gvk4k0KCH+SlNhOJ0Stmp1mxeWcf6ruIlB+ap3tB4f01wMLb27p05OE3EuTY7jaeq7
 W6Dn5uSacPdSwrpM7NFs9L/MtpzPkRCdho4h8fGY1t3Hgayqan7w4QBHqWemtNbjSx4U
 uK/0Yr2FIYVjmkyTGuDL8sUJ0HacDzIfozl2o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GbWbdXoE6xizT93Ir1J+j8iVAb59AF1M9auCdjMcU/k=;
 b=pm8uta1BN1wmQMcJ1ymFBEZY7SzZRd8gIknLAINRNYGbnOyXJAUw2qfLCmPJ1RstdK
 RXH7YtRHXvLf16+43HHNAmBQuNDYYi+lpn+bRnL6CztdpDZhuwhdEses3NJ1opvgYETM
 r7xzNKpHy3T0UqDVAZftqSLbnFRmc0vfRj+OVsVMeMqPjptadZd3ji3LDCva/Rl+GWqZ
 LEdbuFvx1JU1DXpAqzxbVSmnFQJs4rpKhUmAZirC42lmR23B6YFzCg+9PpBROtUzbV4Q
 HtYmiezFuOk67+9Ya709YmOpYdIjsvaG1j+eI0V5JDiduuKcH6HIwiV+BLRs2zyBidHF
 KoIg==
X-Gm-Message-State: AOAM531HEBUTt51XFqYkAmOOJLYHDU2+aiJMp3OkBqGLu+TD6hyaVful
 5jDTMkTuvQZbjdUwyUDY3uUzrD4WZISGkw==
X-Google-Smtp-Source: ABdhPJyX6OHg3fBib5pu1FP2gdFzMoLr88rCdIrTp6AHK9/qOIeO0aQzFJ8RKtMUgnQWqFZuo5F27g==
X-Received: by 2002:aca:5887:: with SMTP id m129mr5094895oib.123.1632863483266; 
 Tue, 28 Sep 2021 14:11:23 -0700 (PDT)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com.
 [209.85.161.48])
 by smtp.gmail.com with ESMTPSA id r188sm67539oie.7.2021.09.28.14.11.21
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Sep 2021 14:11:22 -0700 (PDT)
Received: by mail-oo1-f48.google.com with SMTP id
 v17-20020a4ae051000000b002b5a56e3da3so80006oos.2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 14:11:21 -0700 (PDT)
X-Received: by 2002:a4a:c292:: with SMTP id b18mr6742668ooq.64.1632863481392; 
 Tue, 28 Sep 2021 14:11:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210927175944.3381314-1-briannorris@chromium.org>
 <20210927105928.v2.3.I8bb7a91ecc411d56bc155763faa15f289d7fc074@changeid>
 <CAGXv+5GxCHJM_CewS8dPTLc7NPC6jcKZvrUFat0nemzZpu8PUQ@mail.gmail.com>
In-Reply-To: <CAGXv+5GxCHJM_CewS8dPTLc7NPC6jcKZvrUFat0nemzZpu8PUQ@mail.gmail.com>
From: Brian Norris <briannorris@chromium.org>
Date: Tue, 28 Sep 2021 14:11:10 -0700
X-Gmail-Original-Message-ID: <CA+ASDXO_hHa2fmkNuitxp=r2nBk4-gdZHk9PrHPbmMhLye9w_g@mail.gmail.com>
Message-ID: <CA+ASDXO_hHa2fmkNuitxp=r2nBk4-gdZHk9PrHPbmMhLye9w_g@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/rockchip: dsi: Disable PLL clock on bind error
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Thomas Hebb <tommyhebb@gmail.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Sandy Huang <hjc@rock-chips.com>, LKML <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 27, 2021 at 9:16 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> On Tue, Sep 28, 2021 at 2:00 AM Brian Norris <briannorris@chromium.org> wrote:
> >
> > Fix some error handling here noticed in review of other changes.
> >
> > Reported-by: Chen-Yu Tsai <wenst@chromium.org>
> > Signed-off-by: Brian Norris <briannorris@chromium.org>
>
> Fixes: 2d4f7bdafd70 ("drm/rockchip: dsi: migrate to use dw-mipi-dsi
> bridge driver")
>
> Otherwise,
>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

I'll add these tags, thanks.

> Additionally, I would move patch 2 and this patch before the first patch,
> as these two fix a commit introduced in v5.0, while the first patch fixes
> something introduced in v5.14. This would make automatic backporting cleaner.

Personally, I prioritize putting user-visible fixes first, and more
cosmetic things (like error handling that we ~never hit) later. Also,
the buggy commit was already backported to all still-supported stable
releases where it was relevant (i.e., 5.4+), so if these get
backported, they all should.

Regards,
Brian

[1] 43c2de1002d2 drm/rockchip: dsi: move all lane config except LCDC
mux to bind()
