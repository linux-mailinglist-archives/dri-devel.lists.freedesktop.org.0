Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F566650C7
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 01:58:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EDC910E1B4;
	Wed, 11 Jan 2023 00:58:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [IPv6:2607:f8b0:4864:20::e2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E630C10E1B4
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 00:58:10 +0000 (UTC)
Received: by mail-vs1-xe2f.google.com with SMTP id s127so14168325vsb.5
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 16:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=w/qEOo5OjlMEeYZ96DtrLnhe1l/LTkC2EmBwM2R6NoU=;
 b=gWXF3XFSi77LlxoAifSeJIlQI/otUXaiKOn8F+MEloQOBblQOsl6UzQncoIHupQlt8
 ZDDhJB3W+HWLHHqRMlCrjYW1zaKLnfJov0tKHmRzgp3/L6WYLwmlbzkJDk/NaccrTmTU
 YeCmGHP1Q9SDZXwd6f/6jt1T2axqtByAUYftw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w/qEOo5OjlMEeYZ96DtrLnhe1l/LTkC2EmBwM2R6NoU=;
 b=kdrBuNqKsm5q7N9kOuwFb8rJf6sQxJhrr+uNLxPQBJPD6njg51FRTk2D7wwPtP6Zts
 QEUbc6UAmt2AF5WzvOtCrqvklbatlrz6ellfHzXaNA66RPxjMmOBvY1WT1LJTVY21+ME
 OT8wPiYiU9r4UnIyWUM02raWb74KfwR9cMQPt7WY4zep88tldcw9asdyb1TT1YTR5k+E
 9OKtHXz/gGk70KKtxEpBk5Cqn8ShG7TefKdWcY6a8FzLSfsj2A/QTQsmoePUvEyHubLC
 wozGxoqVznUnWdTANONdb4Zpcv54IxBhNF2cvAfdlVa3b2azaTiSzgW0lXbTuZZUyeM+
 iMJQ==
X-Gm-Message-State: AFqh2kpvLfEIwSqk24kfcZmtCdORmMHQy1gw4ltQkyG/brZADip2kAZ+
 FzSV2bBkAqIm1brHDOdY4nllAwYN6fAocfVR
X-Google-Smtp-Source: AMrXdXuPg16xDMGRMLGxLEz+BpPwMybIjqPshexeQHosqJFcCSV1xcsr6xgfEae08gK53R/qssYrrA==
X-Received: by 2002:a05:6102:37a:b0:3cd:4e55:3d1a with SMTP id
 f26-20020a056102037a00b003cd4e553d1amr22410359vsa.11.1673398689666; 
 Tue, 10 Jan 2023 16:58:09 -0800 (PST)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com.
 [209.85.221.170]) by smtp.gmail.com with ESMTPSA id
 i15-20020ab00d8f000000b00418ffa42948sm1565272uak.31.2023.01.10.16.58.07
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 16:58:07 -0800 (PST)
Received: by mail-vk1-f170.google.com with SMTP id b81so6497628vkf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 16:58:07 -0800 (PST)
X-Received: by 2002:a1f:430d:0:b0:3d5:bc7d:cacc with SMTP id
 q13-20020a1f430d000000b003d5bc7dcaccmr4785521vka.19.1673398687207; Tue, 10
 Jan 2023 16:58:07 -0800 (PST)
MIME-Version: 1.0
References: <20221231142721.338643-1-abel.vesa@linaro.org>
In-Reply-To: <20221231142721.338643-1-abel.vesa@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 10 Jan 2023 16:57:55 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Xkz4CjF9VpC=H=wOuLNwoDfD1VXLQW2kd-hMb6QV8RcA@mail.gmail.com>
Message-ID: <CAD=FV=Xkz4CjF9VpC=H=wOuLNwoDfD1VXLQW2kd-hMb6QV8RcA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/panel-edp: fix name for IVO product id 854b
To: Abel Vesa <abel.vesa@linaro.org>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Johan Hovold <johan@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Steev Klimaszewski <steev@kali.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sat, Dec 31, 2022 at 6:27 AM Abel Vesa <abel.vesa@linaro.org> wrote:
>
> The actual name is R133NW4K-R0.
>
> Fixes: 0f9fa5f58c784 ("drm/panel-edp: add IVO M133NW4J-R3 panel entry")

-:8: WARNING:BAD_FIXES_TAG: Please use correct Fixes: style 'Fixes:
<12 chars of sha1> ("<title line>")' - ie: 'Fixes: 0f9fa5f58c78
("drm/panel-edp: add IVO M133NW4J-R3 panel entry")'
#8:
Fixes: 0f9fa5f58c784 ("drm/panel-edp: add IVO M133NW4J-R3 panel entry")

Essentially you have one too many hex digits. I'll fix it for you this
time, but please remember for the future.


> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>
> Assuming the information from here is correct:
> https://raw.githubusercontent.com/linuxhw/EDID/master/DigitalDisplay.md

This is nifty--I wasn't aware of this database.


>  drivers/gpu/drm/panel/panel-edp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Fixes: 0f9fa5f58c78 ("drm/panel-edp: add IVO M133NW4J-R3 panel entry")

Pushed to drm-misc-next. I didn't bother doing "drm-misc-fixes"
because it didn't seem urgent and it would have caused a merge
conflict with the next patch.

9cce08cadc6c drm/panel-edp: fix name for IVO product id 854b


-Doug
