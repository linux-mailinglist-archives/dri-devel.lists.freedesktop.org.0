Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6D53E1DB4
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 23:06:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82AFA8905E;
	Thu,  5 Aug 2021 21:06:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3DDB8905E
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 21:06:43 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id z2so13757250lft.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Aug 2021 14:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gjsfNCUHDF2l128sssKavdGD8G0WYEjRlXid67kgpQE=;
 b=E5dkRMn1u1x4oHRzSK8ctsaIs1Y8FaUyF1l2yBxY0aejO82HvzfgtGuQGpSbmTzGCk
 kWhXg4Wqsd0OkPJJL/SKWSQxgwLgahoZkCGnZanZm73yyCBeWKcsAncBkun/BGz+JU5q
 RHeFdEVRPp/5g/sJMpgU6kaE5EjRbJEnbSh97ikKLyY+aTn4k+8UHgSTEpHh2ko/fYFW
 fJZ0KRg31OUELKj0RUlG6RZr+fE4+1FTJekYo+OZJxahEdutd6OpbpGXzn6moKRC23/L
 m0KABb2OdH4xnmHuBn5lUvw/1BE6jlGen/jmSM0gs1THeBC+Qo0ezE/Ckek1qn3qKdxU
 dm7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gjsfNCUHDF2l128sssKavdGD8G0WYEjRlXid67kgpQE=;
 b=POtdj7xmADgPJdXlfPVmfuCx6X+ao3ekUAXaqOqmVdI7qvviBeYSeOK3KY1c+V28TG
 Bk5Z7F3O00pvLtEM4UjgROnnr9b/D7DJQsAcqj61t3Nvu8QS7leP+NZYa+dMoXREzg52
 /0vlto3qPAkuZfM2DgCjtDZ4u6ZCSe6m0PYmqFDTOBCM8tOqs5LaL4dtgwKBomZ5IkjU
 hdCGR5R6T083DU+sC9ssb/08qH8lVw3IzQAA2FfuAA/zt+LmRGn3GQNx+/dTYhIMZJ0r
 4+9ExFmhy16eC76Ni9yxRlFwGzMIAg02sfnZPfkSEvsICPyKbZvDjb0Fje9b33mMx7pL
 h+Xg==
X-Gm-Message-State: AOAM5329YjpYwqY5Ea4I7hbIVY1jm3RDS4ux/6Jnkc6v0xCLM/r4H+9b
 0vZ8nZ7kZlXGmXty53gpS5l9knmtLYmTTPJnLHbu1Q==
X-Google-Smtp-Source: ABdhPJw6fssTolA66bgLiBJnBkcfc29bVY2AgY8ZqmtT5FPqQrFnL8uE0+7E0eO0eFAT06+vRoVWmNhOddMcF1y09zA=
X-Received: by 2002:a19:7b14:: with SMTP id w20mr5150929lfc.29.1628197602250; 
 Thu, 05 Aug 2021 14:06:42 -0700 (PDT)
MIME-Version: 1.0
References: <YQmG6EbBherV+8px@ravnborg.org>
 <20210805133343.27032-1-markuss.broks@gmail.com>
 <20210805133343.27032-3-markuss.broks@gmail.com>
In-Reply-To: <20210805133343.27032-3-markuss.broks@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Aug 2021 23:06:30 +0200
Message-ID: <CACRpkdZXRtP4Z2UEQz-gwuPFkVhXTth0nFDioO9a+JKOtHXU4w@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/panel: s6d27a1: Add driver for Samsung S6D27A1
 display panel
To: Markuss Broks <markuss.broks@gmail.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, phone-devel@vger.kernel.org, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, 
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>
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

Hi Markuss,

sorry for reacting so late!

On Thu, Aug 5, 2021 at 3:36 PM Markuss Broks <markuss.broks@gmail.com> wrote:

> +#define s6d27a1_command(ctx, cmd, seq...) \
> +({ \
> +       struct mipi_dbi *dbi = &ctx->dbi; \
> +       int ret; \
> +       ret = mipi_dbi_command(dbi, cmd, seq);  \
> +       if (ret) { \
> +               dev_err(ctx->dev, "failure in writing command %02x\n", cmd); \
> +       } \
> +})

You don't need this wrapper anymore, just call mipi_dbi_command() directly
everywhere you use s6d27a1_command().

Because I merged this patch:
https://cgit.freedesktop.org/drm/drm-misc/commit/include/drm/drm_mipi_dbi.h?id=3f5aa5ac0b0f9704f0c60f5fbbbcdc8c043d6eb6

Yours,
Linus Walleij
