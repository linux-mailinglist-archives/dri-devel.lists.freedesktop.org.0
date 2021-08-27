Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 109003FA0E5
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 22:52:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 234656E9DB;
	Fri, 27 Aug 2021 20:52:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B9F66E9DB
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 20:52:25 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id s16so8260988ilo.9
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 13:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aXHt+zBvV2P2yRdRsCvTblJhainZty6Jg0vDCbYmK8M=;
 b=FV8wBmGYU5sDobyYYnQpOECTKrYkK8EB7/GlKxGqyLstGxzDaWlP7jlTT05tsDEu9N
 m3ODA5TwhdedwETDFIuIUoqNe6jBe53IH7JlysQzvDipyp3WcCIgWyE2nSumqs3jqm+E
 Zr7wV9fgaErAPWv/uxHyXK5/YaePil/2i1r98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aXHt+zBvV2P2yRdRsCvTblJhainZty6Jg0vDCbYmK8M=;
 b=iK0IU1wLpOar1z4BYRKtRHskywjOLuAQJj5sH07mKy73df9XAc2g1W5JF+986EVS62
 FySqsB0Pr+lTeKqyt7HCbDbuedUyuCqS17uskJ5MrcnG29ralCuvJDiLpAtlq67qS0Ht
 DDFMGI+e30KGxxysgBp18lQVC04mRXh17fB8M/Gz5t2criCFD/oFEcM2XzABkb+cU7Kr
 eHz5+FHvthwNNXWlZzOMUtDj5AaFetckAQn4PNz106YRxXIFH+SFNM3nJKMQj8l4W2E0
 Ibh0iWowOGboJ6DCeBTWDgATQlT5LCgUuplJ8rcKH7260E1yMoUMtoFaZ055mpLz/YP5
 C64A==
X-Gm-Message-State: AOAM532XzU7ziPD2BVhiPF12yl5XIFk9owf0bE2fknRADMnkr66ZKPgS
 zWpqpZRSZjvGYXDn7P4YTIY8s1wwao7M5w==
X-Google-Smtp-Source: ABdhPJwlHRm5SPvuqrZzBvH9wfdbEB76f6dqN4QCUsme978tW6azQdHVFEAPkV00wbMB4UznidrZ7A==
X-Received: by 2002:a05:6e02:1074:: with SMTP id
 q20mr8206373ilj.204.1630097544624; 
 Fri, 27 Aug 2021 13:52:24 -0700 (PDT)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com.
 [209.85.166.177])
 by smtp.gmail.com with ESMTPSA id z7sm4097885ilz.25.2021.08.27.13.52.23
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Aug 2021 13:52:23 -0700 (PDT)
Received: by mail-il1-f177.google.com with SMTP id h29so8296757ila.2
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 13:52:23 -0700 (PDT)
X-Received: by 2002:a92:a008:: with SMTP id e8mr7587200ili.187.1630097542564; 
 Fri, 27 Aug 2021 13:52:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210726231351.655302-1-bjorn.andersson@linaro.org>
In-Reply-To: <20210726231351.655302-1-bjorn.andersson@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 27 Aug 2021 13:52:10 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UGtHXD==Yy8CVCOioYGb=2hqGQOoNWftD1Jj7OiEp51g@mail.gmail.com>
Message-ID: <CAD=FV=UGtHXD==Yy8CVCOioYGb=2hqGQOoNWftD1Jj7OiEp51g@mail.gmail.com>
Subject: Re: [RFC] drm/msm/dp: Allow attaching a drm_panel
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 Abhinav Kumar <abhinavk@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>, 
 Kuogee Hsieh <khsieh@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Vara Reddy <varar@codeaurora.org>, freedreno <freedreno@lists.freedesktop.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>
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

Hi,

On Mon, Jul 26, 2021 at 4:15 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> +static int dp_parser_find_panel(struct dp_parser *parser)
> +{
> +       struct device_node *np = parser->pdev->dev.of_node;
> +       int rc;
> +
> +       rc = drm_of_find_panel_or_bridge(np, 2, 0, &parser->drm_panel, NULL);

Why port 2? Shouldn't this just be port 1 always? The yaml says that
port 1 is "Output endpoint of the controller". We should just use port
1 here, right?

-Doug
