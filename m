Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0325645905E
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 15:40:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC18C897E8;
	Mon, 22 Nov 2021 14:40:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com
 [IPv6:2607:f8b0:4864:20::a2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA709897E8
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 14:40:14 +0000 (UTC)
Received: by mail-vk1-xa2f.google.com with SMTP id f7so10375811vkf.10
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 06:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8cwmhwSz/MAlctO1VjVdp3tfi3oYjo6B5mMMEZIzWao=;
 b=Bd6Kf8yK44DmvUBh79dYtYSa68dgXQac49n1Rnw7Vq4P0WcAB2YNFLqTDCB8pOqnzb
 U+d8fNYU8/tuKGSSsyVCLpIrLiG8BOMIfI7CSxiSsu7d2zIdyM1ytEqdDbWqTT4TywIA
 6KISz27U4OQE0FgOcqbPI6bJv+WIDY2K6t3GnCloeDfgfdN0wgbBDL48B3/6IYK0p3sw
 308yCc7Nlane17sOtBUBzpljaybWYXCu8V+dxW10bssP1hocmZkGuKIFFNjkUNb4+j92
 1IbYbqWhqd5hYPzOV+1hP4PWBh9799gILE/8einnPhpIX6rXZsAjQ7nmkkwIIg5RypaJ
 2OMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8cwmhwSz/MAlctO1VjVdp3tfi3oYjo6B5mMMEZIzWao=;
 b=O9qjoMl6GPo8fHEFG/SUVLLra6xYVvPBvOH4Zm24ODPAesKEHeT3XIl81JVuJsQGvB
 YY6rmsDs7HjW4D6NTj/n8+zmHEmPqfUrC/K+81/18OyBaW/ZVo9PxqMVClqXLIqTyrg1
 88HUXKipHdilhqB7n4vWulZt25q4G6145oBKl58lkyq5HRE7K/BfPtRbEVAeeS09MYue
 46daf3WaZmlsLeo10Xw+AynD3lIAag8IQnXiP2XiSFIN1HnUM4Jg8zVRQ+N4ZeeQJaZ1
 YyyU9lJD9CpF+wnpNGoNDyNueh4JJCWM7cNHBG8RK8CfDgziTgotHRoRPjdkEwhJlQtd
 5djQ==
X-Gm-Message-State: AOAM533UyvNktp1kY9SsXiUzX1PFlzmyc1rE4S2xoSKsDel7YD/0w16F
 sk6X/mDz6l9KQ6W8P7ctdDjwUN3GQUC1gxfHBnQ=
X-Google-Smtp-Source: ABdhPJwdAyaj2m65JoPhPc7oEtWLD5krC19Se65pyj/T+qDGtc6OnuXeaKkiD5hRsHnIzxNqS2ABoniPDOPi21S87+E=
X-Received: by 2002:a05:6122:78c:: with SMTP id
 k12mr163412348vkr.22.1637592013770; 
 Mon, 22 Nov 2021 06:40:13 -0800 (PST)
MIME-Version: 1.0
References: <20211122070633.89219-1-jagan@amarulasolutions.com>
 <CGME20211122070651eucas1p1d505c9d2041501898d4f3b1f277e2599@eucas1p1.samsung.com>
 <20211122070633.89219-2-jagan@amarulasolutions.com>
 <5e173bc6-a320-42ec-79de-0ea4c3c2b480@samsung.com>
 <CAMty3ZArYY5ECD5AWZiNa8pYn16ziWi=S-39o3VuTXGA1eN1DQ@mail.gmail.com>
In-Reply-To: <CAMty3ZArYY5ECD5AWZiNa8pYn16ziWi=S-39o3VuTXGA1eN1DQ@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 22 Nov 2021 11:40:03 -0300
Message-ID: <CAOMZO5BTO7H4r7+vaJd-4pQ9eQt_q0BjVxxjyyVtvAKsVEkmvw@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm: exynos: dsi: Convert to bridge driver
To: Jagan Teki <jagan@amarulasolutions.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, Sam Ravnborg <sam@ravnborg.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan,

On Mon, Nov 22, 2021 at 11:21 AM Jagan Teki <jagan@amarulasolutions.com> wrote:

> Is this with Bridge or normal DSI panel?

According to the log shared by Marek, the dts being used is:
 arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts
which includes arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi.

In this dtsi there is a "sil,sii8620" bridge.
