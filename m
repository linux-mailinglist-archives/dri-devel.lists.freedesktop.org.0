Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1394305DB
	for <lists+dri-devel@lfdr.de>; Sun, 17 Oct 2021 03:31:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2B6A6E90C;
	Sun, 17 Oct 2021 01:31:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEFBC6E90C
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Oct 2021 01:31:00 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id y207so19061377oia.11
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Oct 2021 18:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=pehrrn4CE1KsK/Wvnw1j9FzE4EFmgiJ0jUGBDx8V0oc=;
 b=jO/Re6SWrMiWh6YCN4NXmVGAQeDRrqTn0L11tV5oM5KpYFd7HL24z3FJ51WWAUeaD2
 xZwOxAT0W153OezfwQqRdclZFPto3bFdMOeZl5swnzbnVTtITUR0IgZDv15etyqMSHaR
 3YK2kbFuBJSqBb1UXMZrb698eerNLnW+WjRRo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=pehrrn4CE1KsK/Wvnw1j9FzE4EFmgiJ0jUGBDx8V0oc=;
 b=WDqQx1EfS89fH9cO1CRAG1T1NRC9/8ABZiuhU1XEfY7Tq+ewyELW4zTgA60EJzH4/r
 DFDRuEjioninayYtocJ423bm7eyPESBsxl8KOdtUEyGs2xHXxblTQsN43znl1I7F7gdQ
 2R0Q62dbKBzfLn/rzJwWjFD7LRgVjQQn7rtg7F0Hw9za9lG/cDxTT6VOVM40F+EhCYYw
 VL12HrMBz414FSOzwF9I4CejupUGh0QvfbPYE9Pq3IWGk3U7wdwwdPMGEp9CxmpVWPGj
 szNkNyIsEyFxT2bOp8hq3/KTnVeW0J/4YWhjVvv0lfCBJEUKhsITuQazjZ5q8dPoOZ98
 Uegw==
X-Gm-Message-State: AOAM531zL6azFSEoJ0Gaz6XtmrkPv/KC4aUVlXCRvscqrfMaSiyrhuPI
 lj3hgxjJ6DH13XHhHh+NkyXOfGo8ZFgGY4+mPIkNDA==
X-Google-Smtp-Source: ABdhPJxy3t88xA6iK1Cjxtpt3um/UJTTxJMSRlcJVLLf71yXQYnhIGis19Js2+/b9dbn0rWz2Jqdc5iE1C4ar6o7380=
X-Received: by 2002:a05:6808:230f:: with SMTP id
 bn15mr14832128oib.64.1634434260154; 
 Sat, 16 Oct 2021 18:31:00 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 16 Oct 2021 20:30:59 -0500
MIME-Version: 1.0
In-Reply-To: <20211016221843.2167329-5-bjorn.andersson@linaro.org>
References: <20211016221843.2167329-1-bjorn.andersson@linaro.org>
 <20211016221843.2167329-5-bjorn.andersson@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Sat, 16 Oct 2021 20:30:59 -0500
Message-ID: <CAE-0n538PL-JJgMCzP3yc-Y_9qbsHWhtfbcXxh081eFg3QgZ1A@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] drm/msm/dp: Allow attaching a drm_panel
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

Quoting Bjorn Andersson (2021-10-16 15:18:40)
> eDP panels might need some power sequencing and backlight management,
> so make it possible to associate a drm_panel with an eDP instance and
> prepare and enable the panel accordingly.
>
> Now that we know which hardware instance is DP and which is eDP,
> parser->parse() is passed the connector_type and the parser is limited
> to only search for a panel in the eDP case.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
