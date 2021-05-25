Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A2439075B
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 19:19:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 779806EA86;
	Tue, 25 May 2021 17:19:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8191E6EA86
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 17:19:15 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id h21so23651607qtu.5
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 10:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RR4xoh8acB29qJPitkb2wSC7JB6AOVStGTvrt20hM8M=;
 b=X4X35sDWeBb8yjiu2wga4t0uG2LuMIKkR8vb8537T25TUdcZecYeNPM+6j92rt10Bj
 kHoZFMq36Kj+yuWTRdctsxqVOXm5jSQV06MN7AA6b5TdV4lu9ux13Zt6d27g5NELi5p4
 kOFjT2uI16WjvUGvOa6UOUGhDbfW/1ZaPBYlQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RR4xoh8acB29qJPitkb2wSC7JB6AOVStGTvrt20hM8M=;
 b=S/xoTan9IwL36pg+FbD25SgPURtSmka7UpkydZ8ZqJXoSLkPKlCwd/6RJzbT6HCUOZ
 17cpQKIM63qlNPIMAavt+l6KxwUfpormyAIyAt8qEP4SXTTLKN+l9LYQGx2+rlKPgOxF
 k8xH5lfZwd6S0y1I61nPLr0YHFdhGN5Ot4dQ3y0jZT9DX9UsMXyBpMkRtQWFk+qOhr54
 jLlfi6iKebaIGfd9Der3n5qxCgebC8OkOgTzYxonEpekjUxqf9D2KB47yhaKSsyOnK+x
 bp/bR7bgdSwuwFCNn07hDGIFSgXUaMVyOtg68Ohm1Pqyd3uxxptJNEO9ty+vv1ve4iK2
 dV7g==
X-Gm-Message-State: AOAM531pwXD9wakoD2yCMP4nLQa3NZItE3GL5yKEQSUEPzUCrzS6VRQw
 nFbBtg79K46KM1V80gj32MK2b+tQkuUFeg==
X-Google-Smtp-Source: ABdhPJwQ4WPmTeR3VAj/aWLJb/KDjK7m5Vv8L4vo6vbs7Cd1xhEKZNsDEee0SkPWbX34ySoWhvhNpw==
X-Received: by 2002:ac8:74c2:: with SMTP id j2mr32700082qtr.185.1621963154575; 
 Tue, 25 May 2021 10:19:14 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com.
 [209.85.219.170])
 by smtp.gmail.com with ESMTPSA id f8sm13334435qka.86.2021.05.25.10.19.12
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 10:19:13 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id r7so22024841ybs.10
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 10:19:12 -0700 (PDT)
X-Received: by 2002:a25:d846:: with SMTP id p67mr5418346ybg.276.1621963152429; 
 Tue, 25 May 2021 10:19:12 -0700 (PDT)
MIME-Version: 1.0
References: <1621927831-29471-1-git-send-email-rajeevny@codeaurora.org>
 <1621927831-29471-4-git-send-email-rajeevny@codeaurora.org>
In-Reply-To: <1621927831-29471-4-git-send-email-rajeevny@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 25 May 2021 10:19:00 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VF+oggiTffSk5S0Bo0FA0ZaWKURkkqJBPWDjkyQ+Vspw@mail.gmail.com>
Message-ID: <CAD=FV=VF+oggiTffSk5S0Bo0FA0ZaWKURkkqJBPWDjkyQ+Vspw@mail.gmail.com>
Subject: Re: [v4 3/4] dt-bindings: display: simple: Add Samsung ATNA33XC20
To: Rajeev Nandan <rajeevny@codeaurora.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 mkrishn@codeaurora.org, Sam Ravnborg <sam@ravnborg.org>,
 Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>, y@qualcomm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, May 25, 2021 at 12:31 AM Rajeev Nandan <rajeevny@codeaurora.org> wrote:
>
> Add Samsung 13.3" FHD eDP AMOLED panel.
>
> Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
> ---
>
> Changes in v4:
> - New
>
>  Documentation/devicetree/bindings/display/panel/panel-simple.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index 4a0a5e1..f5acfd6 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -242,6 +242,8 @@ properties:
>        - rocktech,rk101ii01d-ct
>          # Rocktech Display Ltd. RK070ER9427 800(RGB)x480 TFT LCD panel
>        - rocktech,rk070er9427
> +        # Samsung 13.3" FHD (1920x1080 pixels) eDP AMOLED panel
> +      - samsung,atna33xc20
>          # Samsung 12.2" (2560x1600 pixels) TFT LCD panel
>        - samsung,lsn122dl01-c01

This panel is slightly different from other panels currently listed
here because it requires the DP AUX channel to control the backlight.
However, in my mind, it still qualifies as "simple" because this fact
is probable and no extra dt properties are needed. Thus:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
