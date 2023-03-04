Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C180C6AACC5
	for <lists+dri-devel@lfdr.de>; Sat,  4 Mar 2023 22:45:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D94B10E20B;
	Sat,  4 Mar 2023 21:45:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77FE710E20B
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Mar 2023 21:45:06 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id i34so23863852eda.7
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Mar 2023 13:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WKDIxvFH4F3D/Bp8+BmLpjtlutHoc8KA5An4csidBcU=;
 b=jzS3yeCClEU5ic+r6pgQ/vQwrY4Lj324IPOIkZYoWfvdmucb1ln4sYfsza2nWDWTNL
 4mtcMhMyNlIRWv24QYhcwEtOU12QAYKj9EURBj5bcbmpQoF5570sCwvVOR+IWU30DjI/
 7AB3YMigQcTKQX2rwSYrtfKZwOPcSK7sXlBMzB89QkV5CPJhzpYwTu0LTWwr1CPk5bfT
 5fkm41zDUcAzcqfeaR4Sq3b9aKdO1oRkZ3f6dXusQwZ70heMW1IzC3n+O7Kpew8BPliH
 4AQkZ6ptMn5c7dafr/RgoabPd0AAMGkJUl0j6IH8PTgxEdPCpRvcIzAKTKg/4oLKEwWd
 WXfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WKDIxvFH4F3D/Bp8+BmLpjtlutHoc8KA5An4csidBcU=;
 b=sLfrNM4nm4DYFA2BwW3vabVJeRbiOwuvQ08qooTAcMlvl9yEU/7uwyflJ1347YisXa
 ADN4kZ/ITvdjgoG0VYW8K+MotW+ykjzNEjpwGmRFb3Kh0vdYduN67gx/W20Nox85ZINQ
 Fvn2X8yKocN+Wpa7kr3JwmjRQycE+Yn6VzLevuv/gAmF01X4ZuqD77gVpLbeiF2pKWx7
 sgpg8ZpKCDVlGRJ49IYq3gxl/PgvD2anpfIrFjdKqSOcP43Rh9uQjXj9gXQd2+yzPnVL
 TlhxtZQ5IUI93QfULUFF4vr9+XXyVH1Bpto8if3h+z1HraliOhMTjFgG9zGmcukxs5zM
 Evug==
X-Gm-Message-State: AO0yUKUZ35gczvViOdp+vgqEDc1fKmZAVSy77v+81IGLTALQuoDKoJlb
 T58/xjZhvib43aEVOv8L+G2UtIuenAM3/URd2DA=
X-Google-Smtp-Source: AK7set9wY0tIW78yGxDw99q432fpv27SQCH8++tgi5/mw5cQNNLf7m3KivFDf11whC1GeXIRw82onTzmkovP2vSJ4lI=
X-Received: by 2002:a17:906:f18f:b0:8af:2ad8:3453 with SMTP id
 gs15-20020a170906f18f00b008af2ad83453mr5871550ejb.6.1677966304797; Sat, 04
 Mar 2023 13:45:04 -0800 (PST)
MIME-Version: 1.0
References: <20230303123312.155164-1-christianshewitt@gmail.com>
In-Reply-To: <20230303123312.155164-1-christianshewitt@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 4 Mar 2023 22:44:53 +0100
Message-ID: <CAFBinCDwGW-NaMx63t2v=Rt298MY1W13A1b1BDwHN72q7ifbZQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/meson: fix 1px pink line on GXM when scaling video
 overlay
To: Christian Hewitt <christianshewitt@gmail.com>
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
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 3, 2023 at 1:33=E2=80=AFPM Christian Hewitt
<christianshewitt@gmail.com> wrote:
>
> Playing media with a resolution smaller than the crtc size requires the
> video overlay to be scaled for output and GXM boards display a 1px pink
> line on the bottom of the scaled overlay. Comparing with the downstream
> vendor driver revealed VPP_DUMMY_DATA not being set [0].
>
> Setting VPP_DUMMY_DATA prevents the 1px pink line from being seen.
>
> [0] https://github.com/endlessm/linux-s905x/blob/master/drivers/amlogic/a=
mports/video.c#L7869
>
> Fixes: bbbe775ec5b5 ("drm: Add support for Amlogic Meson Graphic Controll=
er")
> Suggested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

> ---
> Change since v1:
> This time I sent the right patch from the correct branch; the wording in
> v1 is incorrect and the change to meson_registers.h is not required.
Thanks Christian - I was about to ask whether you could isolate which
part of the original patch fixes the issue, but you've been quicker
:-)
