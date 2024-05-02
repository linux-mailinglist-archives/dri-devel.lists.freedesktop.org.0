Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB398B963D
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 10:15:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D44B10EF3D;
	Thu,  2 May 2024 08:15:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hzEbJR6/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1389310EF3D
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 08:15:44 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-6114c9b4d83so69655707b3.3
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2024 01:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714637744; x=1715242544; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5S/Vn0g70fC06g8jlyeQvB4ZGZRV9mVbLHjIiCg/NGs=;
 b=hzEbJR6/guni0kbpbw35s4rxhfVPg6By8RMnrKtrdC+0eYAcyN6/cICbpaw1pXQ+W/
 qvex4pmV7RCLU79FXmVlqEp6N58k9Vg8DrRXJVfyFerrvbEOk5BiK3LxHYSgnjIrlEQ2
 FlCjyjrdDdOfATvjw0yHF3kKENMlB1Spf9oxXTqTYNUGAC8JaYG/sXclyQmGeikbolLE
 DTPEHcyHO6D+gZD08nwWdtbMGDai2y0I2nSqSK81duYbT574E5B//ABfuCqL6bn1//jj
 0QZkajqto9qWKOULnfec+j6mZDkhsF0qd9jr98uoIpNkLX41ot0jZJV9iruaiMAxwPOD
 XCOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714637744; x=1715242544;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5S/Vn0g70fC06g8jlyeQvB4ZGZRV9mVbLHjIiCg/NGs=;
 b=lN6WILpS85B1i0tJQy6RIbpaNLteryK55VpzGbNHpaovRbBhlRtlopYoPmAdihvFRq
 LebVkjrYstyvoN/qvBOn8nS4ygD+mp0irCN1rBrgBLA21qhR1l8G9hdwhLHlw7OBwD8T
 Ai14QVVy4Mv8UzqFm7y++RB3/5sMeANn38OsLeFH+ypWYmLqoxGKrKCE6Q+JIGPjyDu+
 xmwQBMY9g0p3umuf38exdZn59cz9/pMxFUqd3Nd4kvtR6EIwRetgd85JbL6nN5AoTMcE
 aPPCZ9ZsPX65TZzHI20v1WnGn2fHi2LeOiUptPKEzFCJP0vvFnbL4uZrmuUJSzB6ytLM
 SmxQ==
X-Gm-Message-State: AOJu0Yy/booFFpef4w8FbzNuq3ZGw/Gxvy0l+kEIokabFfVPRPxMLOo0
 S4Zhc+A3/fudFx/TK4i2TTjyhmRmSDQX88toC8na7Iiui60uJTUsQMY25mVAKsVt63+cKSozjPC
 0ygi46MBrhR8uRlMXesPKbTvgMFvc0K0mnTLULA==
X-Google-Smtp-Source: AGHT+IFQN6e2CW2O0jj9xW0UNZm+IJASAgpOckxhGFhd1ISoRtklWjM+E52dQkZBjtkD9HAP/Js4ltIQqZxLBYRiO5Y=
X-Received: by 2002:a05:690c:b82:b0:61b:91e3:f954 with SMTP id
 ck2-20020a05690c0b8200b0061b91e3f954mr5648431ywb.8.1714637744077; Thu, 02 May
 2024 01:15:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240501154251.3302887-1-dianders@chromium.org>
 <20240501084109.v3.2.Iadb65b8add19ed3ae3ed6425011beb97e380a912@changeid>
In-Reply-To: <20240501084109.v3.2.Iadb65b8add19ed3ae3ed6425011beb97e380a912@changeid>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 2 May 2024 10:15:33 +0200
Message-ID: <CACRpkdZQ5SHatac4uPUKd-ABu6Xd5PDYeKoFGvFQMssYOZW_mw@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] drm/mipi-dsi: Fix theoretical int overflow in
 mipi_dsi_generic_write_seq()
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

> The mipi_dsi_generic_write_seq() macro makes a call to
> mipi_dsi_generic_write() which returns a type ssize_t. The macro then
> stores it in an int and checks to see if it's negative. This could
> theoretically be a problem if "ssize_t" is larger than "int".
>
> To see the issue, imagine that "ssize_t" is 32-bits and "int" is
> 16-bits, you could see a problem if there was some code out there that
> looked like:
>
>   mipi_dsi_generic_write_seq(dsi, <32768 bytes as arguments>);
>
> ...since we'd get back that 32768 bytes were transferred and 32768
> stored in a 16-bit int would look negative.
>
> Though there are no callsites where we'd actually hit this (even if
> "int" was only 16-bit), it's cleaner to make the types match so let's
> fix it.
>
> Fixes: a9015ce59320 ("drm/mipi-dsi: Add a mipi_dsi_dcs_write_seq() macro"=
)
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
