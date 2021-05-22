Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B598738D531
	for <lists+dri-devel@lfdr.de>; Sat, 22 May 2021 12:36:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B29BC6E1BB;
	Sat, 22 May 2021 10:36:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15FC06E1BB
 for <dri-devel@lists.freedesktop.org>; Sat, 22 May 2021 10:36:05 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id b12so19752076ljp.1
 for <dri-devel@lists.freedesktop.org>; Sat, 22 May 2021 03:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uEhRMz+h4s+U252SiXX0wJyFMC3DU6kb4X4RIqT3O+Y=;
 b=zz4FoFVJqy8UtrEZzcqoNqGE/xS1BRFRsXQ/rs1MIjHMJNz7zpJvBNzE902fPGbdRH
 ZDN4vaUJ+D+oxbTlgdvAXqZr0a1sJsK4q5nVUnKtAaukoduVKLUj75FB7wJX61IQ65cS
 TpgC0DcZXzi+PomwBK/TipbXqCXYXd9pm3NzITCVNSaMuumN2TKm3fVmQmOzcXuAlJgv
 3Lo8Tbxjhpfa448yBf4cCqmmcCBchyla8VHgeDiH2rOGkXV/3bg529Hj3ur6MaqsIuzS
 WlAl2Zc79g7PXqs+DgPwSqqvS0R9nAJ7IKXibuzp0GZ/izx5MmzmmTM7eiyhOBEjjj7w
 vDAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uEhRMz+h4s+U252SiXX0wJyFMC3DU6kb4X4RIqT3O+Y=;
 b=G12oAgZI2Unz+kMy9lz1lM30AzEy+DP+XbkA7i3w0VypDXC5D9MCsFIyi0plla9gpi
 eM9A72f4kbm+Cx5aaWnOKxpxw/ixPXA/HvzOzPl+loO93HR/0088DpEZI0NjndtfQaH7
 UWUE1d8wDusMbiDHcwQryyLxKx5py8XzSw8drbC9FzXjw/SmMp4bzfc/TW3TkD1kzFle
 j13M6N/019WU5wkutDTk8VLLQjOmHqz849a1YnubuZTGiQ8XZXBfOL0Z/DowDxuOJVYq
 eFO94KUMbr3MEqZQr0+Akl6hqlrf44VtN4ODp+m6sMZx8TMZ2C5BN7sx/bnbIlnxsdkv
 UFHA==
X-Gm-Message-State: AOAM532klpViXad7sLLOYffhbSrnhGGpwdpTNUlQ0B/Pb64i4iWBfsIc
 sbggYLG1FZNkJMCghH3FeWOrhAt9CH9Zo9nZYZd4wA==
X-Google-Smtp-Source: ABdhPJxycv64EJ7V1TCZmsfzdpdPw+UifhMakV61YhCiGLTIcrIBnId4CHLWEyyg2ghmKXaVDG5iILa/Ym8q0MXZZsM=
X-Received: by 2002:a2e:81d0:: with SMTP id s16mr10522164ljg.74.1621679763505; 
 Sat, 22 May 2021 03:36:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210517200907.1459182-1-dianders@chromium.org>
 <20210517130450.v7.8.Ib5fe0638da85800141ce141bb8e441c5f25438d4@changeid>
In-Reply-To: <20210517130450.v7.8.Ib5fe0638da85800141ce141bb8e441c5f25438d4@changeid>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 22 May 2021 12:35:52 +0200
Message-ID: <CACRpkdYYw5yH2LF7PQ_eQRR6VdfGthUdTBrrrqN-0wc+A39WnA@mail.gmail.com>
Subject: Re: [PATCH v7 08/10] drm/bridge: ti-sn65dsi86: Add support for the DP
 AUX bus
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
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, MSM <linux-arm-msm@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Robert Foss <robert.foss@linaro.org>, Thierry Reding <treding@nvidia.com>,
 Sam Ravnborg <sam@ravnborg.org>, Steev Klimaszewski <steev@kali.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 17, 2021 at 10:09 PM Douglas Anderson <dianders@chromium.org> wrote:

> We want to provide our panel with access to the DP AUX channel. The
> way to do this is to let our panel be a child of ours using the fancy
> new DP AUX bus support.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

That's neat.
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
