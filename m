Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB4F746E37
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 12:04:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4733110E08E;
	Tue,  4 Jul 2023 10:04:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 710A910E08E
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 10:04:04 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-39ca120c103so3607678b6e.2
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jul 2023 03:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1688465042; x=1691057042;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cyN9i3wvysLM+j6RUAYLzRo9XvTiCcAXlgbjR2Ukx2I=;
 b=wLm+KL0foI0/oMrkfPvAAa0z9rsQdRECsEfDYsKEjhlZxZpZ9iXLciAv9O87Kn+rq7
 nCd1p5rBu7r3ynD5pszdtiCAjEnS9NbvodH7r0r2OxNwXiHrDT29apUt7+RdwOHhT1xO
 EhBTvD6y0rwivO6I8+pS1uPtKeAWMvrp+tPg+WGQeQhNGdHiHrkQzjZrxxSXxH8FvaGm
 oRNt200rjN6qP8HXfIv0HhkxOV5eBjXI/9PiW4Qg3EEbc/C2HUoxbcDJpD4qHYkHvsBt
 roK/fybQ4a5ZMdL/reXZ3LzfaL6n8TI9116GpnzOQE+FIHoSnNXV06a3UVbH4ZxYQIpN
 DxkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688465042; x=1691057042;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyN9i3wvysLM+j6RUAYLzRo9XvTiCcAXlgbjR2Ukx2I=;
 b=Mo1v42cN6vaXaueDRLhu73t2lKTqlwJsc2QnnlnrMXaM6MyjLPHygTD3Sfwn4LuVId
 OvcSjaqotRQO611aydlnbTuUTVI/br0WBZr0alxuUZQONOFULGRJXamtkrvO1t7C01xa
 ho97pzoHxvcUpNOriQukwqoOwkUt0IJTKOdJz8qA84Q97+b+UX2dI1uRZUS2bX00yChj
 KZo7QrhLtwRG4z6XvIZQNChf+PollN4St0aXlnnLKCbcN/oz0F5dsh0aZmQG6ojWUiVA
 IKDRgeY953YbPde+6N8zx2j/60crdbyJOWAVKkARHq+9wbhANjTOnH9afwqdM7rSkEMG
 y1Tw==
X-Gm-Message-State: AC+VfDwZa9jiulIlK5dAsLDVNRd+JpqYoUIKITBDH6mYfsEkGAHT2pdp
 zGbD5nxj3uokTI4HOzj3Uvqu7KigFLs3YYwUGXJ6Pg==
X-Google-Smtp-Source: ACHHUZ5PQi1Nbhy8IvULeR3lHQvsbtTMPOfn+ZJWTsoNLXnZmUNT78ygBOqqsrH9+ahJRacPsgEpY6NbpLtD2JkCT8Q=
X-Received: by 2002:a05:6808:14c6:b0:3a3:69a5:c10e with SMTP id
 f6-20020a05680814c600b003a369a5c10emr14233039oiw.38.1688465042514; Tue, 04
 Jul 2023 03:04:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230703-fix-boe-tv101wum-nl6-v3-0-bd6e9432c755@linaro.org>
In-Reply-To: <20230703-fix-boe-tv101wum-nl6-v3-0-bd6e9432c755@linaro.org>
From: cong yang <yangcong5@huaqin.corp-partner.google.com>
Date: Tue, 4 Jul 2023 18:03:51 +0800
Message-ID: <CAHwB_N+F_PQaRb+BvLmJwUSsbeCCqF3rWcLYuY_9ktrFGK5_7Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Fix up the boe-tv101wum-nl6 panel driver
To: Linus Walleij <linus.walleij@linaro.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jitao Shi <jitao.shi@mediatek.com>, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Ruihai Zhou <zhouruihai@huaqin.corp-partner.google.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,Linus Walleij

On Mon, Jul 3, 2023 at 9:21=E2=80=AFPM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> This is two patches fixing things I would normally complain about
> in reviews, but alas I missed this one, so I go in and fix it up
> myself.
>
> Discovering that a completely unrelated driver has been merged
> into this panel driver I had to bite the bullet and break it out.
> I am pretty suspicious of the other recently added panel as well.

Do you think the starry,himax83102-j02 panel needs to break it out? Thanks.

>
> I am surprised that contributors from manufacturers do not seem
> to have datasheets for the display controllers embedded in the
> panels of their products. Can you take a second look?

Sorry, this panel datasheet is not open source, I can't share this datashee=
t.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Changes in v3:
> - Rebase on drm-misc-next
> - Convert the two newly added Starry panels as well.
> - Break out the obvious ILI9882t-based panel into its own driver.
> - Link to v2: https://lore.kernel.org/r/20230615-fix-boe-tv101wum-nl6-v2-=
0-457d7ece4590@linaro.org
>
> Changes in v2:
> - Fix a missed static keyword
> - Link to v1: https://lore.kernel.org/r/20230615-fix-boe-tv101wum-nl6-v1-=
0-8ac378405fb7@linaro.org
>
> ---
> Linus Walleij (4):
>       drm/panel: boe-tv101wum-nl6: Drop macros and open code sequences
>       drm/panel: boe-tv101wum-nl6: Drop surplus prepare tracking
>       drm/panel: ili9882t: Break out as separate driver
>       drm/panel: ili9882t: Break out function for switching page
>
>  drivers/gpu/drm/panel/Kconfig                  |    9 +
>  drivers/gpu/drm/panel/Makefile                 |    1 +
>  drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 3037 ++++++++++--------=
------
>  drivers/gpu/drm/panel/panel-ilitek-ili9882t.c  |  759 ++++++
>  4 files changed, 2067 insertions(+), 1739 deletions(-)
> ---
> base-commit: 14806c6415820b1c4bc317655c40784d050a2edb
> change-id: 20230615-fix-boe-tv101wum-nl6-6aa3fab22b44
>
> Best regards,
> --
> Linus Walleij <linus.walleij@linaro.org>
>
