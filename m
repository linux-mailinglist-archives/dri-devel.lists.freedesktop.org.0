Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1BC53E514
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 16:31:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E57C10ECA8;
	Mon,  6 Jun 2022 14:31:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5992610EC29
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 14:31:06 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id s12so22117426ejx.3
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jun 2022 07:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GtB/1q8V6w+BWdhC9EKrHFyvz/JN34Sk5t7oVzNMdlI=;
 b=S54yq+aqgMtQgBARzs3r9I0ZrPQI5ZVZEutMIlcApQ0O+ylp3x4EGRtSkJThXVjx2y
 aHxka38JYLUmgi2B0Sh9t/3M28Bm9PGYHW8+XnhqG2jI9keSQmZuZPdHSadC73yyLPQ7
 Io5j+kBcKNbhtIatxrfuoa626ix5piOgJmDyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GtB/1q8V6w+BWdhC9EKrHFyvz/JN34Sk5t7oVzNMdlI=;
 b=ToNg8mihkj0e2KDjPVUD6AjJ3O17ZM1Igi7vyu1oiY/CZen+aYEIZ6k70W+8kX5/9B
 gIIHnN0YyOIbHBAoodmYk0wgvqzfUl0MROL4oGAl/tlND5nxAlI06DSObG4WuesOuoOg
 fVt4FPxPSEcvkxD2QMVuSJd/A+6sORWm1JsHRtPQ1BWnyWEp/drVIcdUIIfktdgaHDpt
 +B6XVrnVuhnPSr/wcLUenH6kaRMNhr8xNpXX+K9XpxUU5viYwKRmgb2Wdj0qayw5xpxZ
 xgVtKaW1EZE6oV/EEhluzimEdCB5388YTDxkuMZRXAC/yzFdWYt0faSa1dMyVVfcPvTH
 UWIw==
X-Gm-Message-State: AOAM532I7l4C/ewM10CIgf22+XrEC5q2+L7ahvMAvPfo3jFpq0XU8GTK
 8aaJ+jI2TZ+xxqSIDRXZr3WimAu2QimUu0b3MjY=
X-Google-Smtp-Source: ABdhPJyT8BvFz1uoJMCupDXkVJPDsOXhhS6GTJgDqeqkg0b/TgGYWmVo68M7wy+xeQ3TEHV1tmrDKg==
X-Received: by 2002:a17:907:248b:b0:70d:cedd:6c99 with SMTP id
 zg11-20020a170907248b00b0070dcedd6c99mr15867450ejb.675.1654525864708; 
 Mon, 06 Jun 2022 07:31:04 -0700 (PDT)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com.
 [209.85.128.52]) by smtp.gmail.com with ESMTPSA id
 s9-20020a056402164900b0042ddfbea36asm9001138edx.62.2022.06.06.07.31.04
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jun 2022 07:31:04 -0700 (PDT)
Received: by mail-wm1-f52.google.com with SMTP id
 l126-20020a1c2584000000b0039c1a10507fso2178404wml.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jun 2022 07:31:04 -0700 (PDT)
X-Received: by 2002:a05:600c:202:b0:39c:40de:ec19 with SMTP id
 2-20020a05600c020200b0039c40deec19mr16405042wmi.29.1654525391306; Mon, 06 Jun
 2022 07:23:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220606044720.945964-1-hsinyi@chromium.org>
 <20220606044720.945964-7-hsinyi@chromium.org>
In-Reply-To: <20220606044720.945964-7-hsinyi@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 6 Jun 2022 07:22:59 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UwFuNrgBqyseHNLzuRQqyYHXe_sgSfQUSfsp80923h7A@mail.gmail.com>
Message-ID: <CAD=FV=UwFuNrgBqyseHNLzuRQqyYHXe_sgSfQUSfsp80923h7A@mail.gmail.com>
Subject: Re: [PATCH v3 6/8] drm/panel: ili9881c: Implement .get_orientation
 callback
To: Hsin-Yi Wang <hsinyi@chromium.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Hans de Goede <hdegoede@redhat.com>, Thierry Reding <thierry.reding@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sun, Jun 5, 2022 at 9:47 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> To return the orientation property to drm/kms driver.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> ---
> v2->v3: add comments for notice.
> ---
>  drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
