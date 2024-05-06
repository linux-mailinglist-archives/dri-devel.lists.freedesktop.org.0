Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 204C48BC77F
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 08:22:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60C4B10E462;
	Mon,  6 May 2024 06:22:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="G5il6u0C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFA5810E462
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 06:22:39 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-de45385a1b4so1407010276.3
 for <dri-devel@lists.freedesktop.org>; Sun, 05 May 2024 23:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714976558; x=1715581358; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FsyQW7L2aio+heYVCfqR/1RRN8HWBrCF5UqXa3eqZP0=;
 b=G5il6u0C2F69Wq0bQZypVMw7lChub3vUaePgVzcjUj/EnI5BGhuEm6XaPgEQZTNv7E
 oXoB7yAMhKl9X0ndDrqfU+NLzzvwLThc9EAKWrXeCpYnqW9Cf+FvjyH7eKW+vkYU/Nd8
 hN21i2cvAnO9Fa6F0VTGt4IbL8TYT/f4Wr9S8kANWOsaafuJObHMFhhh7hYmuMvebuOx
 R86IM6oYD3S+a3g0CAScfIOV3Ge4SNXPfNef1iG/krLBa0xEmZQVM7vXsqi3pgj1lgaG
 Pl+qAFNRQNvWqVRHzrhGKcvZBBrIRSRO6BDpSPgMjEE0naN2H2jLZ/le0CGFs5KR9ODP
 3/Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714976558; x=1715581358;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FsyQW7L2aio+heYVCfqR/1RRN8HWBrCF5UqXa3eqZP0=;
 b=aqksVvlbEqAnAmS2jDB39PQBxST2KgekFC5v/rFWcOWmR55UglkjioE0ENFwZE93oj
 JtiviZlhPsitMBtjP+c9vGvyxkjanxqW4vQ2B8BvQzLYoiBslTLSW4ORzHCrGgRekc27
 tgREqyiuw+r7+xPWYQzHtN6C361V/mKjLty6qij8iP9DFw4IpbjodE9ybX6W5tHhc1fQ
 Lrom4g7kZ7b5UwYVYvvo3hzid5rmVFG89h+2iNi2B3X/CjoyoBm4MTHPqhn3EX448Nru
 Cc/afDRsDkVJdfUltdhYRl/dN2MBvuOGbcKhnNxT1hd+/8MLv5FIuAi5gxQqID/wK5dx
 lGvQ==
X-Gm-Message-State: AOJu0Yw0P9liwly9cuvo/DaxXW8dJozCltdaTK6CxEdtJeJlN6XcxvCP
 GfVgaLdBr4yujcMLCHNQeCjkGphn1OELHK1SK0xlgGbpY2jvqFqKiM/Y1HhK/9TZYhoPH0zSDIF
 VgDJf82mk1oPWIrMEvSybOkXnVNOMvXVo502YQA==
X-Google-Smtp-Source: AGHT+IHhnbYB4Y/mCi0Q2ow0OOu4GhCtAaAQViwXJiKQsef06HGb9cy5NOz+s1L52l57coXzWT+UHOZOcpP6gpDsjb4=
X-Received: by 2002:a25:6b47:0:b0:de6:17eb:3cb5 with SMTP id
 o7-20020a256b47000000b00de617eb3cb5mr9929018ybm.10.1714976558680; Sun, 05 May
 2024 23:22:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240501154251.3302887-1-dianders@chromium.org>
 <20240501084109.v3.5.Ie94246c30fe95101e0e26dd5f96e976dbeb8f242@changeid>
In-Reply-To: <20240501084109.v3.5.Ie94246c30fe95101e0e26dd5f96e976dbeb8f242@changeid>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 6 May 2024 08:22:27 +0200
Message-ID: <CACRpkdZ-M_7q+PxTSHeD5QoaH2-tM-3cQEtgUi6P9XUA-VWyUA@mail.gmail.com>
Subject: Re: [PATCH v3 5/9] drm/mipi-dsi: Introduce
 mipi_dsi_*_write_seq_multi()
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
 Jonathan Corbet <corbet@lwn.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

> The current mipi_dsi_*_write_seq() macros are non-intutitive because
> they contain a hidden "return" statement that will return out of the
> _caller_ of the macro. Let's mark them as deprecated and instead
> introduce some new macros that are more intuitive.
>
> These new macros are less optimal when an error occurs but should
> behave more optimally when there is no error. Specifically these new
> macros cause smaller code to get generated and the code size savings
> (less to fetch from RAM, less cache space used, less RAM used) are
> important. Since the error case isn't something we need to optimize
> for and these new macros are easier to understand and more flexible,
> they should be used.
>
> After converting to use these new functions, one example shows some
> nice savings while also being easier to understand.
>
> $ scripts/bloat-o-meter \
>   ...after/panel-novatek-nt36672e.ko \
>   ...ctx/panel-novatek-nt36672e.ko
> add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-988 (-988)
> Function                                     old     new   delta
> nt36672e_1080x2408_60hz_init                6236    5248    -988
> Total: Before=3D10651, After=3D9663, chg -9.28%
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
