Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A42253A1215
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 13:09:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8A3589169;
	Wed,  9 Jun 2021 11:09:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03D6C6E985
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 11:09:51 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id e2so31156743ljk.4
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jun 2021 04:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UEmEhJRy3OP1xPt4yLPOXzII4gM5OzUq9kkp8l/Xvok=;
 b=ugy7xZQ+7+93G7dUIr6Hp2icQgcsPO/2hueMIo7Fi/D1w5oYszoADHu+HcJqnz1gEk
 aofijq0inLtV8T7Qw1drJwn56L+FGAmO2oQbMCdJq+0myJyuqs7/af90+c+t6sl4Zr+v
 vxb96PuuPSS3fCBq0RXADxmo4SmJozgOETR0V/onsQ0zPHgOJlxq4xBzVM27mQhG6MA8
 URhH1QGEF7hKNaFQM5QGYwzC6K9xVmkMAPMBjwLnu1vpBOE0u2ObDFt7w1PLCdFsmsO5
 OIeWhoyDFP2BIRcZehpWxV3K6xl++n+H34hi7ud9xLXqn624vxbJpC+IOM+5kmAb/mC4
 X4ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UEmEhJRy3OP1xPt4yLPOXzII4gM5OzUq9kkp8l/Xvok=;
 b=sy6Le3v+4jKFrQE9juG7hZh0W1m1xbTF76q2q1TO8cy7wAOUjLKqAFbzG3qqTW3HUS
 qmBIgJF2lMrpaincuEFxV5EFsSoGzRtyQU9FvtRP8a+F5xQ7q3gQVnDWi0CJyQiq1Ky6
 xF1k5WaQ/udIeai2yg3awuyot2FIkGe2uAOUWjSwT2jbh9VBmDCo1jbGHjr/joLmBGFy
 VSgwlnQLtVu03Bvd+ylBJDBOZwnNxg2dYxUkDQGhbeetqEiajPLhUz5g+CddUmUG4kCd
 2lzJJS54iBOvznSJJg5ohxwYlKRIvZhLzoLQLl2yHx3h7zvlA/3w+7qz+/pDI8j0pDKp
 VIgg==
X-Gm-Message-State: AOAM533YYqyU+SfLz9GzkunWNArsJCyGIhvvI3Pq06carmhhkWGHW3Py
 JUDNiVP/bVlodLWw5bumIuPVeSrCKhp9MyneHAvDNA==
X-Google-Smtp-Source: ABdhPJyMLoBLDIRG5xKEy7bVqMqGX94w0qiryrDa8by3M6lJ0F89j5oh2ybqvmg8q+DMNwfB6uBVIWMg1Zh3OeLMHwY=
X-Received: by 2002:a05:651c:1501:: with SMTP id
 e1mr22737718ljf.74.1623236989363; 
 Wed, 09 Jun 2021 04:09:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210607170555.4006050-1-dianders@chromium.org>
 <20210607100234.v9.10.I24bba069e63b1eea84443eef0c8535fd032a6311@changeid>
In-Reply-To: <20210607100234.v9.10.I24bba069e63b1eea84443eef0c8535fd032a6311@changeid>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 9 Jun 2021 13:09:38 +0200
Message-ID: <CACRpkdZq6XX7zKbdQU1GhaMGvWSC7isO4UoO1iVqs-4An0FQKg@mail.gmail.com>
Subject: Re: [PATCH v9 10/11] drm/bridge: ti-sn65dsi86: Improve probe errors
 with dev_err_probe()
To: Douglas Anderson <dianders@chromium.org>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, MSM <linux-arm-msm@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Steev Klimaszewski <steev@kali.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Stephen Boyd <swboyd@chromium.org>, Thierry Reding <treding@nvidia.com>,
 Sam Ravnborg <sam@ravnborg.org>, Robert Foss <robert.foss@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 7, 2021 at 7:06 PM Douglas Anderson <dianders@chromium.org> wrote:

> As I was testing to make sure that the DEFER path worked well with my
> patch series, I got tired of seeing this scary message in my logs just
> because the panel needed to defer:
>   [drm:ti_sn_bridge_probe] *ERROR* could not find any panel node
>
> Let's use dev_err_probe() which nicely quiets this error and also
> simplifies the code a tiny bit. We'll also update other places in the
> file which can use dev_err_probe().
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
