Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1995321055E
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 09:50:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C6586E83D;
	Wed,  1 Jul 2020 07:50:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD65D6E83B
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 07:50:14 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id h22so18628034lji.9
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jul 2020 00:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BK6LxcRRscqsnEluIPMx3er/wRY4fpMutYOWykUjzz8=;
 b=s3vWfnzqTWTwOUb5oa/2WEKziwyZzj5P21ho4P1IyINRBBNYpb5sRzdLP2skObVtce
 ivbDf8XMoC+QAkjxEBT0WtQ58ZuKaw27t7XvTi3rW25VVJJH/FwRc0EY3368hJixCYaM
 Z8Q9IK68mxFCDPiSXtl3aCA9E0tZhB6n3euJ65+MJM1jldE+RnVoGvM6SfzV188kugqu
 BGknh6a3NCrCbH0eppFCaZHHrhhsDyvDDb3N51tFAp3aUb2wNufBbUh0pQhpQvHxgCns
 orFgCtiZDeF+ppwNMX/J6Icgerpaii4OLN2Ydw76eQWP2rg9HSx/8yvoUvzWhKI2Hw25
 7DbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BK6LxcRRscqsnEluIPMx3er/wRY4fpMutYOWykUjzz8=;
 b=ktpqfao23dZfezBF0RM+N5dI/WAo1YhAN9X8r6gJEetzRV8tzMG8Ykv73lpH2JdhtP
 yN0pJenME77FPEoWrC0UQYTw+lmqxueBPhe/Zn6NMSJAS6vgwiJoKIONPuUpZZE8LBu8
 5/3YSvbw5i1SlY073B0uzNyFLKwKYLWPZ9HY49QHhfzPjJIKGqErrYiCs6GT8Tp1qKM3
 QSG59L69xOPIArjg6211pRsncbI8Hiv6b5xJFOwtKV4dKcp1Wjq0UfvIBjaO+QItUds/
 2M8sgIMzyW7ZbUy5KhrSa3IAEOhR1sd1T8h1C22e5dG3+J7gxB+HwJY6USce7y4E0Crt
 nK7w==
X-Gm-Message-State: AOAM531hoDa73/b0wfWVVzj95WKnRGEv3hHSdnF1xy7K6yIx3IUs75cL
 u0ceKBXyBHpwIKHzJZWNbVSyFHaNMQavii7ILAenEw==
X-Google-Smtp-Source: ABdhPJyDVgBP0COvfyAl2ABGdKqijtb4W240jklwI9mjQ/CSvLAJC8aqzhqumLuGWJRH5kaYpZDb17Vcges4Q5+E7mQ=
X-Received: by 2002:a2e:9c3:: with SMTP id 186mr13146317ljj.293.1593589813316; 
 Wed, 01 Jul 2020 00:50:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200626005601.241022-1-megous@megous.com>
 <20200626005601.241022-9-megous@megous.com>
In-Reply-To: <20200626005601.241022-9-megous@megous.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 1 Jul 2020 09:50:02 +0200
Message-ID: <CACRpkdZAZauS19W7GTbhB4FgjrVtd2+RPx9cuLAac4s4vx234A@mail.gmail.com>
Subject: Re: [PATCH v5 08/13] drm/panel: st7703: Move generic part of init
 sequence to enable callback
To: Ondrej Jirman <megous@megous.com>
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
Cc: "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Purism Kernel Team <kernel@puri.sm>,
 Samuel Holland <samuel@sholland.org>, David Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, Bhushan Shah <bshah@kde.org>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Martijn Braam <martijn@brixit.nl>, linux-sunxi <linux-sunxi@googlegroups.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Luca Weiss <luca@z3ntu.xyz>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 26, 2020 at 2:56 AM Ondrej Jirman <megous@megous.com> wrote:

> Calling sleep out and display on is a controller specific part
> of the initialization process. Move it out of the panel specific
> initialization function to the enable callback.
>
> Signed-off-by: Ondrej Jirman <megous@megous.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
