Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CB51E0E57
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 14:23:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B134389F2E;
	Mon, 25 May 2020 12:23:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03FB389F2E
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 12:23:56 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id l15so20189166lje.9
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 05:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1neDSVvo2exAwO7XG1Q7asHC8C/uLbtbXAanu+QhUvY=;
 b=mHchiWv9d+bl7TypEyswUYJoJBznRNEzkaqNXJ6yZYcwVhCmDlHeQE5uaH/HclG1/A
 Bx4Cg9tDzYVicfaKmVDBhYVOUgLefRTuPj7YFVjqzZ8YnTP/1LLLJTykYqXl+FHN2pZL
 g8xP1m6SXMaHEiGtmqiEB2IP7G+kpZcs9VS8hZv85N+n3X6CdpddRhU6y1nCKsAQzFCY
 4rfmeLIz/oOwhxkepv8pd1oS85BdwpikntEpMCfo0gVE3d09pfC4AhwFL/nAFV+L4+Zb
 mwcQqn4CqSg3gj+nOH2kk2AibQMFcCPYOzlGhx/9SXJpErxweRkVif+GCa4LGQO8gvT9
 9trw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1neDSVvo2exAwO7XG1Q7asHC8C/uLbtbXAanu+QhUvY=;
 b=Rs2Dwm8PlpEFdsYkuaK6Q84r4oKERAxeFOgzyL7HdHC6He7XisPme35WH8Px+Ms1W9
 t3L3Z/W28ENsoobT0pBUrJD7WRrG1r+O9GElNvRW9FxwG4MT9frmP9UDS0V//s2AkiVQ
 ge4hFICWb1gHin2iXyln1Y3jSobRFG2pTxW6CfhOMEt55vVpWtPeJawJxCShqbReGyQt
 nx+GAz76fDwTZshDmtv9ilpwMkVUu4tMoaamjiQ04H1q5YwbQYNVs0igRRDSs72Kd1qq
 Zh1FgMwD59IJjgiP7629HrzvbcaRXldAOsQRTq0Z0x3K6VzRmWhDRYt4xthMW17glIsT
 UMYw==
X-Gm-Message-State: AOAM533hainPpNlSvhpEsrecbf7d/1WBNp1FXG7YiNr7B9OA7EsK0Uzg
 rgUaQU3JtPnCFnGtH/Vp9/rlxWRIszMdvNmvCoCI+w==
X-Google-Smtp-Source: ABdhPJyf5wZA8Fh7xQjtaNnLLHBTpAkEbLAQIKhyb7JglaMhaJDSU7UOMtER0/cndL74Gsc/vcIt53XFGmKsX5AJ0t0=
X-Received: by 2002:a2e:711c:: with SMTP id m28mr13451102ljc.104.1590409434478; 
 Mon, 25 May 2020 05:23:54 -0700 (PDT)
MIME-Version: 1.0
References: <1590378348-8115-1-git-send-email-dillon.minfei@gmail.com>
 <1590378348-8115-7-git-send-email-dillon.minfei@gmail.com>
In-Reply-To: <1590378348-8115-7-git-send-email-dillon.minfei@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 25 May 2020 14:23:43 +0200
Message-ID: <CACRpkda26eQZGMfbq-FL9X532mK=Z87GotjYMu2MWNGgNohp7A@mail.gmail.com>
Subject: Re: [PATCH v5 6/8] drm/panel: Add ilitek ili9341 panel driver
To: dillon min <dillon.minfei@gmail.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 linux-spi <linux-spi@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 25, 2020 at 5:46 AM <dillon.minfei@gmail.com> wrote:

> From: dillon min <dillon.minfei@gmail.com>
>
>     This driver combine tiny/ili9341.c mipi_dbi_interface driver
>     with mipi_dpi_interface driver, can support ili9341 with serial
>     mode or parallel rgb interface mode by register configuration.
>
> Changes since V3:
>
>     accoding to Linus Walleij's suggestion.
>     1 add more comments to driver.
>     2 reduce magic number usage in the driver.
>     3 move panel configuration from common place to system configuration.
>     4 reuse MIPI_DCS_* as more as possible.
>
> Signed-off-by: dillon min <dillon.minfei@gmail.com>

This looks good to me!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
