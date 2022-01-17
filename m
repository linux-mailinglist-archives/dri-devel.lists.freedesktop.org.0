Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75941490306
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 08:44:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 434F810E224;
	Mon, 17 Jan 2022 07:44:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 815A310E224
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 07:44:50 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id o15so54209459lfo.11
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jan 2022 23:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6QF777/sKyHmB6kHdk8pAKes+SVv1gG+ocuwj9sgpRQ=;
 b=KOLLcV/F7XHmTeu4hItqu7+3uEtWlS6N+dsCP614S1MOSzmMSxoYjGpur5i1Y0f5of
 6R0ZuL1Gz5Mg1jiAkXKtDUZCFLosWZiLjo9xhfp6ovoAfvs4Cl/WPuvWvhJW5K/UOhW4
 ++Fvm3jtJK8eWY40Gfmu6WzYuye6hLY8yTocY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6QF777/sKyHmB6kHdk8pAKes+SVv1gG+ocuwj9sgpRQ=;
 b=uwKIAvfGBGwWlzIW9iI46brTmefLAm/wHsYaxFgyKtIAa7mDXpB+PZLN6rmXdUTn09
 0i3kQ9Xk70QfnElW2Owfj0B/hQyIqLTI9eEf1Dy9ZlyiJghknAMnupRpYLrQOOG/zUC6
 U4yC18totvSbhjmSfNymCnEEXCOHHpVyx52IF+4Imei2skd2XHjGFqwFGqCDtKUQRXwF
 d1hPWAtPT/V61pot6VOQNck2cWyPGQuSuQ2fuKV3V0H72u+Zh57WuTXZcuiRzpI4oAVw
 3Z0geoeFw54ZyFi2LPEnHUbBxF71F0eDkPLve/ROnlgLgFox4GlW1s3dQxthOEyNjjB/
 DXpA==
X-Gm-Message-State: AOAM532UG46EtuDwLmLwUaAvPF7aYsUOQTX1+HgZdzDVY3bNf62sDbY9
 hpdRes6lfyA0wDDMH5Carqy9ZC99E2lSUECqSeF4HA==
X-Google-Smtp-Source: ABdhPJy2y5w2Mgw1aXOAzh5xS6yKz737iKCVZw+kmTNKVPku08/RsSvDn73bBL7Kehh87ZNxsL8F9iFaH25KR8AyLpk=
X-Received: by 2002:a2e:b8d5:: with SMTP id s21mr3530683ljp.201.1642405488740; 
 Sun, 16 Jan 2022 23:44:48 -0800 (PST)
MIME-Version: 1.0
References: <20220114230209.4091727-1-briannorris@chromium.org>
 <20220114150129.v2.1.I46f64b00508d9dff34abe1c3e8d2defdab4ea1e5@changeid>
In-Reply-To: <20220114150129.v2.1.I46f64b00508d9dff34abe1c3e8d2defdab4ea1e5@changeid>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 17 Jan 2022 15:44:37 +0800
Message-ID: <CAGXv+5H0-dM28YQj_orS1_14NLcJve8VtO6oLcBiRpJFjaf5KA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] arm64: dts: rockchip: Switch RK3399-Gru DP to
 SPDIF output
To: Brian Norris <briannorris@chromium.org>, Heiko Stuebner <heiko@sntech.de>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Lin Huang <hl@rock-chips.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel@lists.freedesktop.org, Sandy Huang <hjc@rock-chips.com>,
 linux-rockchip@lists.infradead.org, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jan 15, 2022 at 7:03 AM Brian Norris <briannorris@chromium.org> wrote:
>
> Commit b18c6c3c7768 ("ASoC: rockchip: cdn-dp sound output use spdif")
> switched the platform to SPDIF, but we didn't fix up the device tree.
>
> Drop the pinctrl settings, because the 'spdif_bus' pins are either:
>  * unused (on kevin, bob), so the settings is ~harmless
>  * used by a different function (on scarlet), which causes probe
>    failures (!!)

I suppose that means the default pinctrl should be dropped? Or maybe this
use case is the outlier. Up to Heiko?

> Fixes: b18c6c3c7768 ("ASoC: rockchip: cdn-dp sound output use spdif")
> Signed-off-by: Brian Norris <briannorris@chromium.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
