Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA808BC7D9
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 08:52:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34CFE10E99F;
	Mon,  6 May 2024 06:52:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vgWpYnzP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63B0110ED5C
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 06:52:51 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-deb99fa47b6so23474276.0
 for <dri-devel@lists.freedesktop.org>; Sun, 05 May 2024 23:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714978370; x=1715583170; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gYbwDjo4JnZ5uHAXkvG9I+rCsMuqLE4wlNoSCofJHgs=;
 b=vgWpYnzPwkQq8xhx/4/QUuaBpCqwbEbvos776G5c9krsvnt53RRhc/u3H2xf0QGUvp
 I8qVvg7So9k5/Htlub/Afg9NLBVYydB0sJmXaGrcvMhf25kFL1UyXKSmshNb4ImWy9bx
 bQ2Ei4NNQh+V8QXkzFcYI78iDbvWdfTb4zo6DNguv9B1Ipq/jC+8ul0BTazgww6uNM44
 kPyDzmGsfWhgGIQN7nvMk/bWn7Jj9IxQ7CAsnbYrGjmfKfTT/4uzLJthcSN8KQxa967F
 IrylIuIGCnI5SFaNmMfrhERaSCGyCMv5t6rVUl8XB71ACmC5nFbjkI3FCeVHGZ/lhJB6
 kcwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714978370; x=1715583170;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gYbwDjo4JnZ5uHAXkvG9I+rCsMuqLE4wlNoSCofJHgs=;
 b=XR2C0ItK93jpW4wFHqR3OdwslC8wcBf2sJifNOwh13ZBpErnj7vQOIQDKAEsdawJHz
 96rynY2nz1/baJw3CJfAs5wQrhuqjYW8SYcTNTyFcFPDeZYKDpG0NCSwmTmEBI3ghGGg
 MfirqYtFdPwwsEaGdDiBcaq3oFEPpbDMk8KFrJqjn5k95J4ptXf3KmLXa7bFtqTbgmuM
 ZbvonFtncFZp9Os4hRx+wLXsDlBnCGqZe9UG0a7yIqEOb+LxVW/dLLfQfOY5stg26Qrb
 L/uQYbHIwvU97rP3Zo1Dtf2HHW5XaX7pNdmsExTZbJEzQq7QttQOhBxxnYtPrZyLTXzq
 JbMg==
X-Gm-Message-State: AOJu0Yzb9gmUf2IZinBMotgk0b/GA5qKCtfpemTugciTstoYwGy13I19
 sxgoNBJ8nULHYLdwKhIQ6PBpUTx5y8Vzu2G394rO9XZJwec0NXZyOx7ggLdYgn39Rjqmrsyks11
 4j+VN7MrbGBuiJlNcAhDsQkFdJUJnmdKExlyH0A==
X-Google-Smtp-Source: AGHT+IFOLblylb9TrnaoChByyT1UT9ZH6L3PmerBlWrS+9qDdstQZNljgAayMC5QIs6xOb8GpcS5/Xt855lSyd9iOHA=
X-Received: by 2002:a25:ef11:0:b0:de8:c277:1e72 with SMTP id
 g17-20020a25ef11000000b00de8c2771e72mr9131342ybd.1.1714978370131; Sun, 05 May
 2024 23:52:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240503213441.177109-1-dianders@chromium.org>
In-Reply-To: <20240503213441.177109-1-dianders@chromium.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 6 May 2024 08:52:39 +0200
Message-ID: <CACRpkdYbtfE9RLsDewV2UwnJknCp_sFEgc+cq=OF+Qd3tkTcwA@mail.gmail.com>
Subject: Re: [RFT PATCH v2 00/48] drm/panel: Remove most store/double-check of
 prepared/enabled state
To: Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Chris Morgan <macromorgan@hotmail.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Jonathan Corbet <corbet@lwn.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Ondrej Jirman <megi@xff.cz>, 
 Purism Kernel Team <kernel@puri.sm>, Robert Chiras <robert.chiras@nxp.com>,
 Sam Ravnborg <sam@ravnborg.org>, 
 Stefan Mavrodiev <stefan@olimex.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org
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

On Fri, May 3, 2024 at 11:36=E2=80=AFPM Douglas Anderson <dianders@chromium=
.org> wrote:

> As talked about in commit d2aacaf07395 ("drm/panel: Check for already
> prepared/enabled in drm_panel"), we want to remove needless code from
> panel drivers that was storing and double-checking the
> prepared/enabled state. Even if someone was relying on the
> double-check before, that double-check is now in the core and not
> needed in individual drivers.
>
> This series attempts to do just that. While the original grep, AKA:
>   git grep 'if.*>prepared' -- drivers/gpu/drm/panel
>   git grep 'if.*>enabled' -- drivers/gpu/drm/panel
> ...still produces a few hits after my series, they are _mostly_ all
> gone. The ones that are left are less trivial to fix.
>
> One of the main reasons that many panels probably needed to store and
> double-check their prepared/enabled appears to have been to handle
> shutdown and/or remove. Panels drivers often wanted to force the power
> off for panels in these cases and this was a good reason for the
> double-check.
>
> In response to my V1 series [1] we had much discussion of what to
> do. The conclusion was that as long as DRM modeset drivers properly
> called drm_atomic_helper_shutdown() that we should be able to remove
> the explicit shutdown/remove handling in the panel drivers. Most of
> the patches to improve DRM modeset drivers [2] [3] [4] have now
> landed.
>
> In contrast to my V1 series, I broke the V2 series up a lot
> more. Since a few of the panel drivers in V1 already landed, we had
> fewer total drivers and so we could devote a patch to each panel.
> Also, since we were now relying on DRM modeset drivers I felt like we
> should split the patches for each panel into two: one that's
> definitely safe and one that could be reverted if we found a
> problematic DRM modeset driver that we couldn't fix.
>
> Sorry for the large number of patches. I've set things to mostly just
> CC people on the cover letter and the patches that are relevant to
> them. I've tried to CC people on the whole series that have shown
> interest in this TODO item.
>
> As patches in this series are reviewed and/or tested they could be
> landed. There's really no ordering requirement for the series unless
> patches touch the same driver.
>
> NOTE: this touches _a lot_ of drivers, is repetitive, and is not
> really possible to generate automatically. That means it's entirely
> possible that my eyes glazed over and I did something wrong. Please
> double-check me and don't assume that I got everything perfect, though
> I did my best. I have at least confirmed that "allmodconfig" for arm64
> doesn't fall on its face with this series. I haven't done a ton of
> other testing.
>
> [1] https://lore.kernel.org/r/20230804140605.RFC.4.I930069a32baab6faf46d6=
b234f89613b5cec0f14@changeid
> [2] https://lore.kernel.org/r/20230901234015.566018-1-dianders@chromium.o=
rg
> [3] https://lore.kernel.org/r/20230901234202.566951-1-dianders@chromium.o=
rg
> [4] https://lore.kernel.org/r/20230921192749.1542462-1-dianders@chromium.=
org

This is the right thing to do, thanks for looking into this!

As for the behaviour of .remove() I doubt whether in many cases
the original driver authors have even tested this themselves.
I would say we should just apply the series as soon as it's non-RFC
after the next merge window and see what happens. I doubt it
will cause much trouble.

The series:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
