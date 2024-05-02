Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0B18B963F
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 10:16:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23B1C10EF6F;
	Thu,  2 May 2024 08:16:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bx6FQd/u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9558D10EF7B
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 08:16:22 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-de45dba157cso7170866276.3
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2024 01:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714637781; x=1715242581; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YmFyvlIHda9NU2gXF06k2ZQ7jALqIM9zqt9BFQX5Bik=;
 b=bx6FQd/u+Q6nnt6TbUF2jcTHCg1q9XDJoklnUf8WzSgcR1wSpCrWYYD3IZEgyN9dGx
 arDLMeELqp4XA3fpHMBs4pcuE5LqHjtxJnFF4xrM1R8s60GgaYLcV6WccYpBXpDOjpKG
 Qayr3X6hrY8x1CWTdYs+bI68RvTVadRlhBZzzZ5TRyRgT+Rp+RyG8bqPTZk+ba5mpMCR
 WQPFPJnhz9xU9t4w1wJKcC9Xs3lZ3ftk40JUkTfcc71ER9Kdl7OHOT2yyOOwO2JaFu10
 q/Rv5tRUJp6BBTW/RqPmiqFirwcEz5ubEaNOt2toVJF5wwe14fvEFdZZpddLCQqpZcMV
 ouVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714637781; x=1715242581;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YmFyvlIHda9NU2gXF06k2ZQ7jALqIM9zqt9BFQX5Bik=;
 b=NOY6Pgk/DnZjYRZdl7sGSpw0UxJyCdmCDVCwRTXkgFXpKbOgxB+3lNKm0I8h3YLwLh
 3QKgqxvc+hpX5JBmMfSS+0JzFGHdK9GI5FgDdHgUwOnBairvR7/vYwwgW5EwLZUCzQ3e
 9Ni4dwKIZ1i7BJrAPoNURGooRYzl/ww1JU6fdVHpoJx/qbg3HhKonskjum5UM/gOFw+j
 qAJPqyT1SmPuOGHURHa3wvQrnoZA4BoMfLAAXY5IR2ymcWoYqgXd7srbh2T9aA3IJAgh
 Nn7o+8gmANsIPtTBiSLcZeuZiSFt7jj39OIjOjdRmDqDZwhMPJdTaQJjTWzk8kWIvlpf
 8L7Q==
X-Gm-Message-State: AOJu0Yweme8nUX04986q0xO9X6w5ck0+NEko7nlcb0s5x7MApJs3BcUE
 Ptz2qhsuadK2IcUmhVSutfHUExDCdiuQnj+HvicziFqAoK5UNTW3sg9QPF2e0GjLaFl1AP2fX16
 Y9PG/n3iQoyB08uU6heQEpQpq2SatjUeVnibwGQ==
X-Google-Smtp-Source: AGHT+IGWpSFsiUp0ZxMBi1ohvTy1MitUsB7eEmtKa3lo9//fq1VBpFee4oo8p3YyoVLxMY7HtddoXw4j89bpKkdUQ5Y=
X-Received: by 2002:a5b:b4a:0:b0:de5:4b71:2d1d with SMTP id
 b10-20020a5b0b4a000000b00de54b712d1dmr1475592ybr.29.1714637781422; Thu, 02
 May 2024 01:16:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240501154251.3302887-1-dianders@chromium.org>
 <20240501084109.v3.3.I9982cd5d8014de7a4513f5619f66f88da49ce4ec@changeid>
In-Reply-To: <20240501084109.v3.3.I9982cd5d8014de7a4513f5619f66f88da49ce4ec@changeid>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 2 May 2024 10:16:10 +0200
Message-ID: <CACRpkdZ89p29JtcrKKZ9L4Sea-TddTnpBrS4tzth0f5nhQtrEQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/9] drm/mipi-dsi: mipi_dsi_*_write functions don't
 need to ratelimit prints
To: Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 Hsin-Yi Wang <hsinyi@google.com>, 
 Brian Norris <briannorris@chromium.org>, Sam Ravnborg <sam@ravnborg.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Javier Martinez Canillas <javierm@redhat.com>, 
 Joel Selvaraj <jo@jsfamily.in>, lvzhaoxiong@huaqin.corp-partner.google.com, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 1, 2024 at 5:43=E2=80=AFPM Douglas Anderson <dianders@chromium.=
org> wrote:

> We really don't expect these errors to be printed over and over
> again. When a driver hits the error it should bail out. Just use a
> normal error print.
>
> This gives a nice space savings for users of these functions:
>
> $ scripts/bloat-o-meter \
>   .../before/panel-novatek-nt36672e.ko \
>   .../after/panel-novatek-nt36672e.ko
> add/remove: 0/1 grow/shrink: 0/1 up/down: 0/-16760 (-16760)
> Function                                     old     new   delta
> nt36672e_1080x2408_60hz_init               17080   10640   -6440
> nt36672e_1080x2408_60hz_init._rs           10320       -  -10320
> Total: Before=3D31815, After=3D15055, chg -52.68%
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

OK then!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
