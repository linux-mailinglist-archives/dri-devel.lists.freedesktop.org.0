Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A69524094
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 01:13:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B78810E12A;
	Wed, 11 May 2022 23:13:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A407910E12A
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 23:13:31 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id kq17so6908019ejb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 16:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JgHIHZYfktFFhDix9ARk1W3agCJ5RlUjVdUHKQCQqAE=;
 b=gygLmm76slBdVa2keLfFJYY7zR9gVLTrQN7Qeoxr8clFf1VZSLKxHawplwV3c1cvML
 3F2nc0icCJFSso3TejBkbD4mveFcMg9/XBRM8VeOaUhHfU6oraKEtgeiiRmY9Y3d2Ofe
 0e16IW4wgnUJtqxOljWBH6MhiRPRrpKM9eB3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JgHIHZYfktFFhDix9ARk1W3agCJ5RlUjVdUHKQCQqAE=;
 b=NaooiD5OCfQ1ZfKYvWffOOdwxiHswbuW83nLaMxb29J5u29qqW6BB9mwQLSXmLDCQd
 lWSZeEq4UdqCUoHfQPRFQKGoGes1sClPDFtNNj45bMKgkq+ct1I7uaeMBq1JDIMVJSMV
 +z9xjf10zh2yDkZ4JUGeBq68lB3MKiE2GljopPdZYEpr1gV9k02/iKQ2M+1zomJ+10MI
 tAcf9BSVM9F5NJYSDNiYzW8iic4LJMmTXQACRPVTtuNjtJk1KaRuOSPGUZFtUCZrTSTS
 QLLzog1/U1u5eP5vpyiiuW4UHmtCnq9KgSCgr/CAl6YMVnQinZqtdZLdld0Iow5KUAL5
 Mk0g==
X-Gm-Message-State: AOAM5338QBf4A12HIHdBr5UcalS3kdAjlty5dFw0OCYMKBm/x8Ogu7ot
 OQsn8AqmQTniAKpWYCA8ealAB5pjFRsMWOor
X-Google-Smtp-Source: ABdhPJze8n5M4t02H1Jebk57PafFHXigUZkkapN+/OTMLHxIeAuZD8Bu8W/2ASGT0lyFetBb7GH5vA==
X-Received: by 2002:a17:906:ca41:b0:6fa:981f:cd63 with SMTP id
 jx1-20020a170906ca4100b006fa981fcd63mr11631216ejb.764.1652310810004; 
 Wed, 11 May 2022 16:13:30 -0700 (PDT)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com.
 [209.85.128.53]) by smtp.gmail.com with ESMTPSA id
 f18-20020a056402329200b0042617ba637asm1853439eda.4.2022.05.11.16.13.28
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 16:13:28 -0700 (PDT)
Received: by mail-wm1-f53.google.com with SMTP id
 1-20020a05600c248100b00393fbf11a05so4112899wms.3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 16:13:28 -0700 (PDT)
X-Received: by 2002:a7b:c7c2:0:b0:394:18b:4220 with SMTP id
 z2-20020a7bc7c2000000b00394018b4220mr7173683wmk.118.1652310807772; Wed, 11
 May 2022 16:13:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220511160720.1.Ia196e35ad985059e77b038a41662faae9e26f411@changeid>
In-Reply-To: <20220511160720.1.Ia196e35ad985059e77b038a41662faae9e26f411@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 11 May 2022 16:13:14 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XA6GKjdvc1YNh7v0SHSMCzgBtx453AKPjxbWWkTW5N1Q@mail.gmail.com>
Message-ID: <CAD=FV=XA6GKjdvc1YNh7v0SHSMCzgBtx453AKPjxbWWkTW5N1Q@mail.gmail.com>
Subject: Re: [PATCH] Revert "FROMGIT: drm/msm/dsi: move DSI host powerup to
 modeset time"
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: Matt Turner <msturner@google.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, freedreno <freedreno@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, May 11, 2022 at 4:07 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> This reverts commit c7e4a2a72e696aa6aed2c8b651279f491bb096fe.
>
> The patch causes sc7180 Chromebooks that use the parade-ps8640 bridge
> chip to fail to turn the display back on after it turns off.
>
> Let's revert to get these devices back to a working state. It seems
> like the DSI powerup problem is somewhat common and probably we should
> land something more general like Dave Stevenson's series [1] that
> would give more flexibility.
>
> [1] https://lore.kernel.org/r/cover.1646406653.git.dave.stevenson@raspberrypi.com
>
> Fixes: c7e4a2a72e69 ("FROMGIT: drm/msm/dsi: move DSI host powerup to modeset time")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  drivers/gpu/drm/msm/dsi/dsi_manager.c | 43 ++++++++-------------------
>  1 file changed, 12 insertions(+), 31 deletions(-)

Well, that's embarrassing. I clearly reverted the wrong copy of this
patch. Sorry. v2 coming right up.
