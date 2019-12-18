Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0470B123C04
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 01:55:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F9308800B;
	Wed, 18 Dec 2019 00:54:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7C7B6E1F8
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 00:54:56 +0000 (UTC)
Received: by mail-il1-x141.google.com with SMTP id c4so185947ilo.7
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 16:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4cKjTtuJ6Cl3BPkbORmbBVCSJ2Mx93CiWQ5Web+aZoo=;
 b=Ehbk3QqUh5bTHL9JWhwrStjM1T3/LkM1Kqv+zwWwwk6M/oBy9gNn8PJ2yhBeubKtqw
 eA4bTbmTus7J2LmfuinU86pawGesMIrNtGwKCU1jkvSXjjAkSBccuRyP6ktvcVlBET3y
 RsGdJaHIJjTrGFAjMBY6t7gqFXFQbI1WCoBrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4cKjTtuJ6Cl3BPkbORmbBVCSJ2Mx93CiWQ5Web+aZoo=;
 b=GUDta6o9gAVeRZ5q38821ROrxvyoiPq9vh75v8MZu5Km/qmtVzrS7HLORusR8B9Mdd
 kpnMZQ9TctLDQIKMwh7v9ZR7CXlm/bCBSbu05dbg3NZvDpLJx0UxE0cavUhHiyKaZkb6
 PH6yUmTxSuuu4Z5Q1XbW2ZYzBd7F3LxNTEhCq2OGySV7B8Fu8sxtTIMp8GHSXBiHjmrz
 V1FRoZ39/cUBcudwxCfbYx0baNPlWoWYS6pNp0sz5qorl0Q7tyqWk1232JSVG4fX8uSI
 JOxFuenEiu0VS2kjIiaQiOmrHT3lbXVAM0SBTeLLVIkuzNQ3mDeFpxiPza0A4js9TPPn
 jbUw==
X-Gm-Message-State: APjAAAXNgO+BC8EG5GkvinmtZ5V9WfFZC1FylF/qjkPBZ43f9Zeezqfc
 1zuUrA4ls3JDppS//kABirNYG6LXxxw=
X-Google-Smtp-Source: APXvYqwxVoRkXZjXdMHJlZZCI4rtPsVqor06ILr3wySsctuqBUtXOWRU3mYyEIp/KFmJCTNYKFGF0A==
X-Received: by 2002:a92:1f16:: with SMTP id i22mr263754ile.206.1576630496049; 
 Tue, 17 Dec 2019 16:54:56 -0800 (PST)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com.
 [209.85.166.181])
 by smtp.gmail.com with ESMTPSA id 69sm132945ilc.23.2019.12.17.16.54.55
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2019 16:54:55 -0800 (PST)
Received: by mail-il1-f181.google.com with SMTP id b15so201852iln.3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 16:54:55 -0800 (PST)
X-Received: by 2002:a92:cc90:: with SMTP id x16mr224285ilo.269.1576630494768; 
 Tue, 17 Dec 2019 16:54:54 -0800 (PST)
MIME-Version: 1.0
References: <20191213154448.9.I1791f91dd22894da04f86699a7507d101d4385bc@changeid>
 <20191215200632.1019065-1-robdclark@gmail.com>
In-Reply-To: <20191215200632.1019065-1-robdclark@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 17 Dec 2019 16:54:42 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U7PXe7n3Q+k6ZWvkUeCRA8Esdyc6C39078=N_7D+BCXA@mail.gmail.com>
Message-ID: <CAD=FV=U7PXe7n3Q+k6ZWvkUeCRA8Esdyc6C39078=N_7D+BCXA@mail.gmail.com>
Subject: Re: [PATCH 2/2] fixup! drm/bridge: ti-sn65dsi86: Skip non-standard DP
 rates
To: Rob Clark <robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sun, Dec 15, 2019 at 12:06 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> ---
> Note however, the panel I have on the yoga c630 is not eDP 1.4+, so I
> cannot test that path.  But I think it looks correct.
>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 110 +++++++++++++++++++++-----
>  1 file changed, 89 insertions(+), 21 deletions(-)

I ended up basing patch #9 in my v2 series slightly more on Jeffrey's
patch.  Hopefully it looks OK.

I don't have any eDP 1.4 panels either, so hopefully it's all good there...

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
