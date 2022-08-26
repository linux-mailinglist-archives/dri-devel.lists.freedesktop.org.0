Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5A35A26FE
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 13:43:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BACAA10E0AC;
	Fri, 26 Aug 2022 11:43:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EA7110E0AC
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 11:43:11 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id bj12so2606369ejb.13
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 04:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=gsShjHRfk1oeXhbIzNvUGv41+jelOVn6LeepzghgVhc=;
 b=y66fvpM6mrqJoSGMNOUuh8/jNAUR1UjVh1GbVfp532iGK3RhG5d3pM7Jj9bQ+lnefL
 R6n2L3gNzDy5eDLXId+bbuwc1Cu97Y4MhATKlxERGzv6CkQeuJyoQJIsXZ8s5V1oEPtp
 6aKR8AcFw3npwDqPvLKq3g5k9qR6jk3JJ6vTblb6kDPvTkk/KMhCqODdTxqX8EbQoir2
 PO8/hJrH9T7PV9EiNvrH2q+otJn/QEHj+0LOrvEmy03mt7XdB97BWoREUkNLQ84jmfHK
 +ACQuqwyhYoRzRH2W4JrBMGWknvz9WE11tfeZIopFrdvz/OUFwip0Ug/FSEJMvGi1XIa
 chGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=gsShjHRfk1oeXhbIzNvUGv41+jelOVn6LeepzghgVhc=;
 b=EPFguACG9ZgSjdCvPilsSxkIzOhi5wi61wXW9FDGNDL0DDk7I1JWuy0TBoIyQZyVTN
 dSBSIl9wJBVytbrR39u0ogQC4XOtfrKyIpagMzhJR1y8WbpTMRjAxEPInJpljjeIS7Z/
 l38bPmrMy2T+JIakF0CIvaA+oXRRYs44RRxL9K9IOXB8R6Z1vz1rPfqI+yV6tcbbMsEr
 RXE8aiWBoSxh4hwckbzWSeds/mWtUc7AkwPZeoHGGpyjbDdfidrTl1ycRU/Y9sasCWIY
 658xaDe8WmRzwGuMTllie6okCYBA7lukeTYN/AmE0HKYwm4D5znG4xEOkJji9Unuxjt9
 v+OA==
X-Gm-Message-State: ACgBeo2E+wam3LEfVymYoUAMbQs1u/PbX7y06MNsiX6vXn36eApFfmPI
 pOQ6RpIsPsxzkdc8PDigE0P+dy/ZXVKwtrXPFnfOPw==
X-Google-Smtp-Source: AA6agR56gg8w5KxfHvPutKzL3hZkhLx++8yqikN5B6LKjSxqFmWvyJTzeHuMm+6e32LFnU+nvVfFauABKPr5Zn6hFnU=
X-Received: by 2002:a17:906:478f:b0:73d:7919:b23 with SMTP id
 cw15-20020a170906478f00b0073d79190b23mr4886670ejc.690.1661514189603; Fri, 26
 Aug 2022 04:43:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220823004227.10820-1-rdunlap@infradead.org>
In-Reply-To: <20220823004227.10820-1-rdunlap@infradead.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 26 Aug 2022 13:42:58 +0200
Message-ID: <CACRpkdZGkKXFtdNQGn6CZvh0xArtoWaSGGQHdihifLmiHyzszg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/panel: use 'select' for Ili9341 panel driver
 helpers
To: Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 David Airlie <airlied@linux.ie>, Dillon Min <dillon.minfei@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 23, 2022 at 2:42 AM Randy Dunlap <rdunlap@infradead.org> wrote:

> Use 'select' instead of 'depends on' for DRM helpers for the
> Ilitek ILI9341 panel driver.
> This is what is done in the vast majority of other cases and
> this makes it possible to fix a build error with drm_mipi_dbi.
>
> Fixes: 5a04227326b0 ("drm/panel: Add ilitek ili9341 panel driver")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Dillon Min <dillon.minfei@gmail.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>

Patch applied to drm-misc-next

Yours,
Linus Walleij
