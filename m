Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A05E542E82
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 12:57:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4276010E2C1;
	Wed,  8 Jun 2022 10:57:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FFFA10E6DF
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 10:57:40 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id w27so26494835edl.7
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 03:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=opjFjBZtnkDZt4LG1us0v9FmsThJprixz/gaJLVPEzs=;
 b=mNC3ncTpxeZ3PqpNxXts86onA+nqyroC2RkP4bR2/gvijytgR3juJabeNmQMsvXNgE
 2I0XCoU+eCiU7+Be2YiK1lp3pv8WYJLaxYA7NNWVRjG+6iLw63+jzklnJ71I+RzaG9t5
 F23ou0fYoRNuhxvK6tqJIDdMF8M11vNibnCOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=opjFjBZtnkDZt4LG1us0v9FmsThJprixz/gaJLVPEzs=;
 b=YjRygofEki2nF4HsUh1NuKbS9fmWbnEKslo33pDpv1ouyHitDLHhohmotpVSozAfkH
 XBo/yQ4f1Ox14m0KZ7GZ6hFZIkCFwz2mtKEWiYf8OqgUGzeUZ+OzGJoDaEmqpUZ8dfAj
 Rb8Tjhd1Zs97BXY30SluDN8DvzvLf4Y8z6SG46A8rv8MyV9vZXQKp9UngiYhI7nSkbck
 ETcKDOUiexnfEFTEzNuB1kReqIWO+cZsWOnrgxbbGOcD6wTrCyNbiC8R6Go8M2M+m2VB
 IYaQW3N4u/H48xOTg/JqwFVUQQfweu/GsCZF064elaPs/dr2AS/eI1t6srHwYtjDuLuf
 sRlg==
X-Gm-Message-State: AOAM532AOH7NzwqzsyDDhSMJHS+EgErVsNidJdddWIGvnE7bW9EWIC9B
 67yHssIDAU+Ihwe4eRbIuAtwJxDhunqjop5/8OXxfg==
X-Google-Smtp-Source: ABdhPJxo8VFBDOxSM+c+NUwtOWz8seeC9YblF5BYAdCELuhrqBjWgDF9QDufov+WZGPXkmEMc2Ckn1LsykBYlj5TjpY=
X-Received: by 2002:aa7:cf91:0:b0:431:3b5f:ecc8 with SMTP id
 z17-20020aa7cf91000000b004313b5fecc8mr22624912edx.306.1654685858850; Wed, 08
 Jun 2022 03:57:38 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1646406653.git.dave.stevenson@raspberrypi.com>
 <CAPY8ntC-2Yij+a5wWEZ3BRBSh7bz+74coHCoB01ZhY550H+BDg@mail.gmail.com>
 <CGME20220405114402eucas1p1d139ce6825a481d1318f013cf27a5fe7@eucas1p1.samsung.com>
 <CAPY8ntAi1tM7BZEpKkMAasRH3R_+tJCUFY7k-yVBdtogvxQNRA@mail.gmail.com>
 <e96197f9-948a-997e-5453-9f9d179b5f5a@samsung.com>
 <CAPY8ntDR54vaBuwQN2F_j4_rxYgkFmsxc+mKYBn0YLe8=CtxtQ@mail.gmail.com>
 <b4eb6670-79a9-eec0-bbd1-6c5a0e31ff08@samsung.com>
 <e7750409-d09e-e182-c400-75dae2343169@intel.com>
 <CAPY8ntDnvFh1oomKOq2k6i8PhePDAtS5AExK5wCD7B+vFu8d+g@mail.gmail.com>
 <CAPY8ntCBv1G7QdC5BPyS9R7n14td2knOHzigBieoshXJyoNofw@mail.gmail.com>
In-Reply-To: <CAPY8ntCBv1G7QdC5BPyS9R7n14td2knOHzigBieoshXJyoNofw@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 8 Jun 2022 16:27:27 +0530
Message-ID: <CAMty3ZATwc0icMGX9E_fJq2yZNWHL-kAuw_K4vdJsC=cqMJWvg@mail.gmail.com>
Subject: Re: [PATCH V2 0/3] DSI host and peripheral initialisation ordering
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
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
Cc: Marek Vasut <marex@denx.de>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 8, 2022 at 4:19 PM Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> Hi All.
>
> This series has been kicking around since March now. Any chance of a
> review by any of the bridge maintainers or other DSI maintainers?
>
> Converting Exynos DSI to the bridge framework seems to have issues,
> but that is a separate thing to this patch set.

Correct.

> (It looks to be nearly there, but the check of stop state at init is
> not required by the DSI spec, and is likely to be tripping things up
> as it then doesn't set some registers. Contention only needs to be
> checked for before sending data).

I might take a look at this weekend and see if I can give some comments. thanks.

Jagan.
