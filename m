Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4328B9664
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 10:23:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBC8D88BE3;
	Thu,  2 May 2024 08:23:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FzSq0Am5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC78288BE3
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 08:23:20 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-61d35d266e7so25214747b3.1
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2024 01:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714638200; x=1715243000; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=24YyTRYR6RGICTEPRKVLXQM7MeeLdxtmJnjzlihyxds=;
 b=FzSq0Am5JwZylbZ1X9ns4QICuHlK9EX15JythZF/BFB1UAxFcf9TPIABdqjXOSIwBr
 5ihlPyLZKOGSIDsafANOj3IZe8PFanfHFzzrJ9htcAPH79UnbobdApfK/80Rhvg0gK3R
 fJw9iLtHsUXQTDBmat/E2FBUmzRqKilDSpHFB4Vdt7bNYlXLqEi0WP+LpGvcoGvYY2Pf
 UU6aPdBpyFyeQSWDDK41wzXYWNe8Jp0e/2/W9IqIdbsOv99LWcPmzIZGk/a5hzDuaz12
 dwuLTaDFy/shf1OuTsDoiwEY0P21a7h97GN4sBfxN54lGi2D8CYfUoIEdINH6d1jgMLT
 z6rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714638200; x=1715243000;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=24YyTRYR6RGICTEPRKVLXQM7MeeLdxtmJnjzlihyxds=;
 b=isY+8v69WyXnEY8jrxCYUoaKT7nsVi9IUhHQ2mdFGGEWZ9noaLBeV/uWZ73zP2L5DK
 Q8C70BQBPiHP4oVt8U+Px2pXQDykhjBO9CEm5XmFPFkIkfIsa8vt7tDHWRwXWd/q+WXD
 up3UYGRmwiy/zTrO6YCTBtGWm/ygZCQM+uhP64SpE+TIeMXliRmmXVYpAacs3b9AJ6OX
 furpWIgBRKfIHMUouckxnElpOxoWyVetijPbgnfVpg9RwhpseeTi0KH3pdDIOHHkDPlO
 KCW16NuQdQsea53YTkETeKvpUSDbeMICq80ItBLQ0M54pFUCnklwaz1z8TGwbtwU1GlR
 Ve3Q==
X-Gm-Message-State: AOJu0YyrtIjQYLxk3YoxURnHpk5Yvw3ppqHW/U1NfhLQU6ukoNQcbIvR
 PUc3Ic3++jNiyD5uu/CoF+BuJHmzV+BxdkApMJdyf8CTD2ayjkdxEjfx76LmW9FrksaJba2SwLU
 9xMQoAGNrr7/q744PcNygSe5ZYdKRNafwyz8Klg==
X-Google-Smtp-Source: AGHT+IHJf8nsf+hQ0oYySY8kc9eXFs7bLgTHLiT7HAY38ioGQLECM9C1dGV4rTXrwZjUZET6iMLonxw6UYxZADDvgl4=
X-Received: by 2002:a25:2b81:0:b0:de4:7603:e888 with SMTP id
 r123-20020a252b81000000b00de47603e888mr5029716ybr.29.1714638199758; Thu, 02
 May 2024 01:23:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240501154251.3302887-1-dianders@chromium.org>
 <20240501084109.v3.4.Id15fae80582bc74a0d4f1338987fa375738f45b9@changeid>
In-Reply-To: <20240501084109.v3.4.Id15fae80582bc74a0d4f1338987fa375738f45b9@changeid>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 2 May 2024 10:23:08 +0200
Message-ID: <CACRpkdb2eJWVYREhpCUoJnYeutBybBY8mic2SAUuU67MW5Hjbg@mail.gmail.com>
Subject: Re: [PATCH v3 4/9] drm/mipi-dsi: Reduce driver bloat of
 mipi_dsi_*_write_seq()
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

> Through a cooperative effort between Hsin-Yi Wang and Dmitry
> Baryshkov, we have realized the dev_err() in the
> mipi_dsi_*_write_seq() macros was causing quite a bit of bloat to the
> kernel. Let's hoist this call into drm_mipi_dsi.c by adding a "chatty"
> version of the functions that includes the print. While doing this,
> add a bit more comments to these macros making it clear that they
> print errors and also that they return out of _the caller's_ function.

This doesn't really explain why this takes so much less space.

Please add some explanation like that "the macro gets inlined
and thus the error report string gets inlined into every call to
mipi_dsi_dcs_write_seq() and mipi_dsi_generic_write_seq(),
by using a call to a "chatty" function, the usage is reduced to one
string in the chatty function and a function call at the invoking
site".

With some explanation like that +/- added in:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
