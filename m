Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD158BC7D2
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 08:50:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC9301121A7;
	Mon,  6 May 2024 06:50:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="A4sbQh2o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 535121121A7
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 06:50:02 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-deb654482bcso1363305276.1
 for <dri-devel@lists.freedesktop.org>; Sun, 05 May 2024 23:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714978201; x=1715583001; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bD8zr9K3TvpMI07CepCgahiM+TM9JI1lwjNTMLU3tPI=;
 b=A4sbQh2oddRmkt5nrgKATdq/lCTeILVQH2Fpta+j6g06wAeT/Tl3hxm+68MAtFJD9A
 YNjV6DaCie+E4d2txQDbxBTkNysm5phnSSRE77cHRw/Da0fInao7SbOEE0rLp66nWmZQ
 fcLYUQX6l622QIdY7MfJr+sFKnS2PqFfulzyOZOrlBLHfSHqiDdPW3bKOdrWOAzuDdcu
 KwPrJR7EH3KNOOf+9afxC22G8AtrS+C2YdIbKw6FVhE4JqTbOR5BsAdD/RqOfSeyBu37
 f56bqLhoJyU1Jk5j6barSeOj9+X03rnNCjdCm/hVii2uAnCLXLEgMT5Pki2Sm0RbfiSj
 vZig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714978201; x=1715583001;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bD8zr9K3TvpMI07CepCgahiM+TM9JI1lwjNTMLU3tPI=;
 b=VdxVDVZaRg2Hgnzqu+K6kAlWfULh9dlREUSH/3xsL/Gp9L3NSdpxjqNZ6Yjazly9Wx
 T06FVpRj5W9DUUFxKRHyKbqYs+lPCHOItJjeSARYMgSGJ1Neu6pAVkGRXm9paGrW6z7p
 3axrx0lZBDpE1GwnXhmfGTDkc0ifitHgGVLAMnKd6R580b43HE+1aob7f3AFNp73aLBo
 aU0pi5DSBDwuXbVwpUOJDL3faqzAan4VFOZvOvQLXoAnv8KXoCUuX/eYX4adfnCRMAGC
 mbfmvgL5zmMW9fO7Byy7UuBVpVCri06zr8GiWlWEZcb+BuFNa+7nKlaOybVdftNY62Wg
 qCSQ==
X-Gm-Message-State: AOJu0Yy2cECFmzTuOrJKYTjMO9n3NLP1pL0iauzANgKqB5M6/zbL8zr8
 zHua/zAoqn7OOkUSvEc/4yMkSKolbxxaqUL73WaeG4bmYVMbykBTKcJzltbVysfCUUDkbanlHB5
 Tl2uXS82/js3bhnl6edyLcetJAQO6yFB/Db9aoQ==
X-Google-Smtp-Source: AGHT+IHaOyjFlq8XYx41Cxil96IUw2lta8RtC1Merd60dXgYHJ/wvReVZXQGPD4L8MA4Mt3mUEcy6sSY/kYNmU9PLRc=
X-Received: by 2002:a25:804b:0:b0:de4:64eb:8607 with SMTP id
 a11-20020a25804b000000b00de464eb8607mr9454277ybn.32.1714978201293; Sun, 05
 May 2024 23:50:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240503213441.177109-1-dianders@chromium.org>
 <20240503143327.RFT.v2.47.I2513fd6824929a17c1ccd18a797b98a1a1063559@changeid>
In-Reply-To: <20240503143327.RFT.v2.47.I2513fd6824929a17c1ccd18a797b98a1a1063559@changeid>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 6 May 2024 08:49:50 +0200
Message-ID: <CACRpkdajJ0dkSm7uE=YN5B90tdE_GzczMRxO7eaNWuZLVzP_eg@mail.gmail.com>
Subject: Re: [RFT PATCH v2 47/48] drm/panel: sony-acx565akm: Don't call
 disable at remove
To: Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Chris Morgan <macromorgan@hotmail.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, 
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

On Fri, May 3, 2024 at 11:38=E2=80=AFPM Douglas Anderson <dianders@chromium=
.org> wrote:

> It's the responsibility of a correctly written DRM modeset driver to
> call drm_atomic_helper_shutdown() at shutdown time and that should be
> disabling / unpreparing the panel if needed. Panel drivers shouldn't
> be calling these functions themselves.
>
> A recent effort was made to fix as many DRM modeset drivers as
> possible [1] [2] [3] and most drivers are fixed now.
>
> A grep through mainline for compatible strings used by this driver
> indicates that it is used by TI OMAP boards. The TI OMAP driver
> appears to be correctly calling drm_atomic_helper_shutdown() so we can
> remove the calls.
>
> [1] https://lore.kernel.org/r/20230901234015.566018-1-dianders@chromium.o=
rg
> [2] https://lore.kernel.org/r/20230901234202.566951-1-dianders@chromium.o=
rg
> [3] https://lore.kernel.org/r/20230921192749.1542462-1-dianders@chromium.=
org
>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
