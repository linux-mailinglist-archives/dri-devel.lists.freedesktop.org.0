Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 232A618742B
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 21:41:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21C2389CFA;
	Mon, 16 Mar 2020 20:41:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 592AA89CFA
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 20:41:14 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id p7so10102598vso.6
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 13:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pfmXc3xr7dDVUscjphZ9PfgG1CkRdszrgoIMj+cYGiM=;
 b=m0zS/nz+dh5DzW7OJtY1OyEysBJG0asBfU/zhzlY3bVTir7wJr8IvHqzL2txO7u8OP
 TwCkv0SgavWRtAimFcwroX34kVJs0fx7PJqKmCrABErjMKZa0rezx/rliFEMdBF3BhM0
 LpUHV4yhDEXst5xYr3keONwo+bCtPHQ/IdU0M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pfmXc3xr7dDVUscjphZ9PfgG1CkRdszrgoIMj+cYGiM=;
 b=S4RxGOSsok4X8xbBLz4HnK7BDcXK2bl4aiB42aNGHQt+UYZpF+ULZQTzBqWZHC6fyT
 v5QL54pHNg2okL1JLvLAoXn1TrR9/LdAVjDcCeKtvcP6ixE01U+IVc4tBX0pcR3vrYFn
 Ojc4jA/r+M9SB6ttLUug1BbrOjmebJGUhs+YhkBw1FWXN2bAsasyKk8MwOIBvaaris1Z
 i6lRAdlW1xzYxbs3c6sfuqQf+9U5/2NUXOlYJ5yKH9eEM7jAARiAm8FtK12DO6xW6sgF
 ijBYT1pqTOtFnVfifqSQtbTUd55SWphVHH7ZuaXlgldWphvwJYjxkT3goH94eJyXwehs
 +/pw==
X-Gm-Message-State: ANhLgQ1s4Aws6udzhSlV1jF8xk/jBj9eC2eZyKsAbky386zzzwcRzR1z
 9q7Y1CRHLxBsctNEcw0Q1YBYcIwZHXQ=
X-Google-Smtp-Source: ADFU+vs9thf2Qrc0We7V/rn0bmjs0PQYNlQ/9AgWP9hsIopfm+C/FeNlAPQO6Jli8aQPp1nOorgl5w==
X-Received: by 2002:a67:de97:: with SMTP id r23mr1254951vsk.23.1584391273474; 
 Mon, 16 Mar 2020 13:41:13 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com.
 [209.85.217.51])
 by smtp.gmail.com with ESMTPSA id q128sm298571vkh.54.2020.03.16.13.41.11
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Mar 2020 13:41:13 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id n6so12318424vsc.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 13:41:11 -0700 (PDT)
X-Received: by 2002:a05:6102:7c7:: with SMTP id
 y7mr1256780vsg.198.1584391271488; 
 Mon, 16 Mar 2020 13:41:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200315134416.16527-1-sam@ravnborg.org>
 <20200315134416.16527-12-sam@ravnborg.org>
In-Reply-To: <20200315134416.16527-12-sam@ravnborg.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 16 Mar 2020 13:41:00 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U--vZ7bZ-RMGVbqxwpo9C8pBDtbmU2moUcu73kBHqm-A@mail.gmail.com>
Message-ID: <CAD=FV=U--vZ7bZ-RMGVbqxwpo9C8pBDtbmU2moUcu73kBHqm-A@mail.gmail.com>
Subject: Re: [PATCH v1 11/36] dt-bindings: display: convert
 innolux,p120zdg-bf1 to DT Schema
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Nikolaus Schaller <hns@goldelico.com>, Jonathan Bakker <xc-racer2@live.ca>,
 Sandeep Panda <spanda@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Paul Cercueil <paul@crapouillou.net>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chris Zhong <zyw@rock-chips.com>, Marco Franchi <marco.franchi@nxp.com>,
 Stefan Mavrodiev <stefan@olimex.com>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>, Tony Lindgren <tony@atomide.com>,
 Nickey Yang <nickey.yang@rock-chips.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Robert Chiras <robert.chiras@nxp.com>,
 Vinay Simha BN <simhavcs@gmail.com>, Marek Belisko <marek@goldelico.com>,
 Heiko Schocher <hs@denx.de>, Brian Masney <masneyb@onstation.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Guido Gunther <agx@sigxcpu.org>,
 Mark Brown <broonie@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Werner Johansson <werner.johansson@sonymobile.com>,
 Purism Kernel Team <kernel@puri.sm>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Lin Huang <hl@rock-chips.com>, linux-spi <linux-spi@vger.kernel.org>,
 Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sun, Mar 15, 2020 at 6:44 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Sandeep Panda <spanda@codeaurora.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../display/panel/innolux,p120zdg-bf1.txt     | 22 ----------
>  .../display/panel/innolux,p120zdg-bf1.yaml    | 43 +++++++++++++++++++
>  2 files changed, 43 insertions(+), 22 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
