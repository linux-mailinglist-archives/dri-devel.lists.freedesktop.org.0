Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F9F3818AB
	for <lists+dri-devel@lfdr.de>; Sat, 15 May 2021 14:09:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E81C96E11E;
	Sat, 15 May 2021 12:09:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C0E6E11E
 for <dri-devel@lists.freedesktop.org>; Sat, 15 May 2021 12:09:13 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id c13so1635047pfv.4
 for <dri-devel@lists.freedesktop.org>; Sat, 15 May 2021 05:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XITU93CUfLuScWI1J4CVyiEqYuy3HJ2zRJqQJpcp+0Q=;
 b=rKfa/I9HZMht9ama673flisK0Sd1gicgX+2fEGQUKabSVeYCZkp8rd3tEJ1JRX5IBQ
 JVe/PIKlkcobhuDtveeSc59EIIcm1V0pyupxaos2BMSUqF02Wjwf5mtbP5oXbVjPTK+4
 m1wp+Jj5TMF9oKlPYfB4W8swL5shliw/xeXBEpPwczoYp6V5l6DjmGBTQ6DSD1CMdOmm
 JpRXGnJp3llL5AfLPX5zZTgdcfbZwwroro3NSCfbh+JkD5rIApq76cekxek9PvqgjtbU
 rVtDYObEK/r6mgaOhWaoaJvT7xbrI0NUCGTr3KTH04v99zoLfNhSN9dVnOPcXMo682wJ
 26FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XITU93CUfLuScWI1J4CVyiEqYuy3HJ2zRJqQJpcp+0Q=;
 b=lMHKag4/YsuZOqYiwZLRgCFm8wRxbBLDBjVKAOflu0HOCuYv+8+7oU+NpGAzgEovVV
 HhYK9U7EB+O44tT1TMnejTeRlR8VFVPefEefELgqIQjkZm6Hglhtd0rZnzLgQgSEXc9A
 lREOamhWlUbjm9tB3xPYnd/TtdN7UhA5Vh+k6HCMyzbLob/JGt/83dSrgSTS228kdXwz
 JyRlJ0koqvQ+5s83LcH17VWHtodRgfdiP/Z07MRs4to6L9hUhqBobH5ka4x7LEJPaBA9
 EeZST88mH2rKrn6cGBR80Epwd9mSIB5avcWMA4z70c23I6BBWN6byF6HHedidA5V2CsS
 f+NQ==
X-Gm-Message-State: AOAM530/nfIg0959Lcu2AiJm9gkHOk7ASRBzo8sytx0bEH0QfeNHWYh6
 dx4o6K7C+hnzqbQQsyAhhJo5wcC4QHSlBBwEaNFOtg==
X-Google-Smtp-Source: ABdhPJxujAOhUS3DW+tsTK6wGoUmluZyCTIncjYhi0+CWwfEoIA9MNcHFepen4W9lrQ1iv6ryQdtPywt/l7Y9KlJoXA=
X-Received: by 2002:a63:ea0b:: with SMTP id c11mr51424837pgi.120.1621080552868; 
 Sat, 15 May 2021 05:09:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210419090124.153560-1-robert.foss@linaro.org>
 <1627725d-1c7e-109f-f995-e761bb022ccc@infradead.org>
 <d295f001-575d-f14c-b0c1-1444dd29a03e@infradead.org>
 <75b35f2f-72bb-522a-afd8-6c26cd553588@infradead.org>
In-Reply-To: <75b35f2f-72bb-522a-afd8-6c26cd553588@infradead.org>
From: Robert Foss <robert.foss@linaro.org>
Date: Sat, 15 May 2021 14:09:01 +0200
Message-ID: <CAG3jFyv5gBSG-xkQFDkQMhpqWa4-_e7GTb4pr4dJjZcNLW4ZQw@mail.gmail.com>
Subject: Re: [PATCH v3] drm/bridge/sii8620: fix dependency on extcon
To: Randy Dunlap <rdunlap@infradead.org>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, cw00.choi@samsung.com,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, m.purski@samsung.com,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Randy,

I missed sending out a notification, but this patch was merged into
drm-misc-next.

https://cgit.freedesktop.org/drm/drm-misc/commit/?id=08319adbdde15ef7cee1970336f63461254baa2a

On Sat, 15 May 2021 at 07:35, Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 4/19/21 10:54 AM, Randy Dunlap wrote:
> > On 4/19/21 10:10 AM, Randy Dunlap wrote:
> >> On 4/19/21 2:01 AM, Robert Foss wrote:
> >>> The DRM_SIL_SII8620 kconfig has a weak `imply` dependency
> >>> on EXTCON, which causes issues when sii8620 is built
> >>> as a builtin and EXTCON is built as a module.
> >>>
> >>> The symptoms are 'undefined reference' errors caused
> >>> by the symbols in EXTCON not being available
> >>> to the sii8620 driver.
> >>>
> >>> Fixes: 688838442147 ("drm/bridge/sii8620: use micro-USB cable detection logic to detect MHL")
> >>> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> >>> Reported-by: kernel test robot <lkp@intel.com>
> >>> ---
> >>>
> >>> LKP reported issue:
> >>> https://lore.kernel.org/lkml/202104040604.SSTe2Cxf-lkp@intel.com/
> >>>
> >>>
> >>> Changes since v1:
> >>>  - Fix typo on comment
> >>>
> >>> Changes since v2:
> >>>  - Randy: Changed from `depends` to `select`
> >>
> >> I don't know why my name is on that. I didn't
> >> suggest any change -- I just reported that v2
> >> had a problem.
> >>
> >>
> >>>
> >>>
> >>>  drivers/gpu/drm/bridge/Kconfig | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> >>> index 22a467abd3e9..70402da5cc70 100644
> >>> --- a/drivers/gpu/drm/bridge/Kconfig
> >>> +++ b/drivers/gpu/drm/bridge/Kconfig
> >>> @@ -169,7 +169,7 @@ config DRM_SIL_SII8620
> >>>     tristate "Silicon Image SII8620 HDMI/MHL bridge"
> >>>     depends on OF
> >>>     select DRM_KMS_HELPER
> >>> -   imply EXTCON
> >>> +   select EXTCON
> >>>     depends on RC_CORE || !RC_CORE
> >>>     help
> >>>       Silicon Image SII8620 HDMI/MHL bridge chip driver.
> >>
> >>
> >> Thanks. Works For Me.
> >>
> >> Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
> >
> > Actually I can upgrade that to:
> >
> > Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
>
> Hi,
> Is anyone merging this patch?
>
> thanks.
> --
> ~Randy
>
