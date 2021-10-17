Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 141E44305E8
	for <lists+dri-devel@lfdr.de>; Sun, 17 Oct 2021 03:32:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B53CE6E56D;
	Sun, 17 Oct 2021 01:32:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DE556E56D
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Oct 2021 01:32:23 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id z126so19074954oiz.12
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Oct 2021 18:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=2wy87Ngcu7gVRUKvzaxFI3AG8ttBjWS13MSfr80Tlnw=;
 b=Yz2U+KS+8IlSi/BJ9Aa0q6OomQhz9T99n2XyNvmu8tLFnrxR7oWndK9jZGw2pvVYxd
 zzfe0BKVkv0bWf/kocXFO8C7+cxvQq5UVc2fkF32ONIXJupUWROCG2whGlpy+K50kCXh
 Rzjx6cBP7z48rwQlRDLo6WSsQYYRbhsSYdNp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=2wy87Ngcu7gVRUKvzaxFI3AG8ttBjWS13MSfr80Tlnw=;
 b=1sTW6NTMumWsRIesP6gPSDRbK0Wb9RwYeOs38hx0h473wzFHqxlU+iu53Ptwz3y7pg
 UPaClk8U3z8UyDzJDofFyZ3lmso+4UGp2lRgUQYgh9vd/zhZMTFON8N6IzT3Q2ojcDQz
 pyHM9bWeQq7b51+QC4QCW6+9MN/v3MgHtMmjatEOULyVqZbyRnxRN8kHiFeIMOIwqVez
 jMYd5awn6qpMy+NdQgX72BPuHwHJSj/CtMh/NunTdfJYgiVYqWN+vgVfpTQ/2I7m3HjL
 DP+35L+gFvxKFmy4en+cQuKulwlTYdlRER+59I0CnIp5Ke2LkcVM//acOHREWK6ijN9Y
 W7DA==
X-Gm-Message-State: AOAM532ruwcmIsX1yzKiGx6hXcFl66K8w7LBhRgw/ZFmJZ6c0ZVNfHtY
 hlBAeN4ulhFAkjXiPQFbajMYmaGvaIcoXjopaDvFjw==
X-Google-Smtp-Source: ABdhPJy9TGOZNQrC0+Gt3LlttQmcsoNpL5AXVWWKf1RKVOfK+qDdiu0E74boUW3aoYhS7g527dvN6POC4ocGd8TjeKw=
X-Received: by 2002:a05:6808:23c2:: with SMTP id
 bq2mr8370296oib.32.1634434342991; 
 Sat, 16 Oct 2021 18:32:22 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 16 Oct 2021 20:32:22 -0500
MIME-Version: 1.0
In-Reply-To: <20211016221843.2167329-8-bjorn.andersson@linaro.org>
References: <20211016221843.2167329-1-bjorn.andersson@linaro.org>
 <20211016221843.2167329-8-bjorn.andersson@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Sat, 16 Oct 2021 20:32:22 -0500
Message-ID: <CAE-0n53R79HOoBsuLXVkVhYotFam8k4mWZqWnaiJcqcr7w522w@mail.gmail.com>
Subject: Re: [PATCH v5 7/7] drm/msm/dp: Add sc8180x DP controllers
To: Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>, 
 Kuogee Hsieh <khsieh@codeaurora.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Bjorn Andersson (2021-10-16 15:18:43)
> The sc8180x has 2 DP and 1 eDP controllers, add support for these to the
> DP driver.
>
> Link: https://lore.kernel.org/linux-arm-msm/20210725042436.3967173-7-bjorn.andersson@linaro.org/

BTW, was the link intentional?
