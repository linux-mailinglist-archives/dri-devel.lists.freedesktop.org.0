Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A80CF441FC4
	for <lists+dri-devel@lfdr.de>; Mon,  1 Nov 2021 19:02:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0A186E437;
	Mon,  1 Nov 2021 18:02:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 514256E437
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Nov 2021 18:02:24 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id b203so7278417iof.1
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Nov 2021 11:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AI0EGtO0fwy8ABQM2b3fEK3eUYU6jqjRFDdZhYpaGeo=;
 b=JY8uJTVzX0Ut5XrdC7dgInIh7GV7XogEtOsPZDF0iBibhsdEyA2fur4Td5p/bBfbP4
 oMAGLpI6qDbHoQvCijJI9XalSLExjH7lI1CJfN3K/r3kltW5RRKMIGLcxEp/0FDCQvzk
 J88GY6szvCD0jZogUoNp+4HFUlPG2WGbLBzpc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AI0EGtO0fwy8ABQM2b3fEK3eUYU6jqjRFDdZhYpaGeo=;
 b=OmmU915Vs27SjpQSelE3rWq6sDXo9sazKBwNNrnJYwA+t+HNht/EdcPln7332KRDKz
 KxFhyApTI7bJVlyUSRCIIOqx/adunbY7kIH/kOyi3KciEWGquAA6hEH4KAxQxfR3GTe3
 8din8QaOXUzwLg9v2yPYa9GZaR4wysHkpOnYrOSjwOVNAeTvU05+vP2JWleRuNuxHPis
 jBzOg4F7be2FfYAihlfDBQ6fMxJEnpQLghWTLiVvy0XKVejAjuW8Ipg28d0vQZQmA+Yp
 QX6fMdw72XuJNNIpXGfovOy2RC/pseyDqgwmSVmBRc0Uus6sg0WAoHsLeIxi2/k0MFDn
 lRSA==
X-Gm-Message-State: AOAM533q6mgMn9QLJb9nhi1XwwpfhGAtNdspnMug/2P8Zhd6NK4MvN6Q
 QgkSntHLC5/giCMTjjscdBhlKK/94j6Rbw==
X-Google-Smtp-Source: ABdhPJx8gLa/bkgaSigN52jL/36UF5R020BaOv9HydgCaPY6N/L5eRO3WvGlo4PP8wQzUzqIPw4eMw==
X-Received: by 2002:a5d:93d2:: with SMTP id j18mr22424041ioo.86.1635789742466; 
 Mon, 01 Nov 2021 11:02:22 -0700 (PDT)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com.
 [209.85.166.51])
 by smtp.gmail.com with ESMTPSA id r11sm9416140ill.20.2021.11.01.11.02.21
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 11:02:21 -0700 (PDT)
Received: by mail-io1-f51.google.com with SMTP id e144so22560278iof.3
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Nov 2021 11:02:21 -0700 (PDT)
X-Received: by 2002:a5d:9753:: with SMTP id c19mr8257662ioo.136.1635789741166; 
 Mon, 01 Nov 2021 11:02:21 -0700 (PDT)
MIME-Version: 1.0
References: <20211030100812.1.I6cd9af36b723fed277d34539d3b2ba4ca233ad2d@changeid>
In-Reply-To: <20211030100812.1.I6cd9af36b723fed277d34539d3b2ba4ca233ad2d@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 1 Nov 2021 11:02:09 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xoaypn6wy5mHfTneDrQYexGcdcaMqkSnPJf0YS=jHpPA@mail.gmail.com>
Message-ID: <CAD=FV=Xoaypn6wy5mHfTneDrQYexGcdcaMqkSnPJf0YS=jHpPA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dsi: set default num_data_lanes
To: Philip Chen <philipchen@chromium.org>
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
 freedreno <freedreno@lists.freedesktop.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, Bernard Zhao <bernard@vivo.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Stephen Boyd <swboyd@chromium.org>, Yangtao Li <tiny.windzz@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sat, Oct 30, 2021 at 10:08 AM Philip Chen <philipchen@chromium.org> wrote:
>
> If "data_lanes" property of the dsi output endpoint is missing in
> the DT, num_data_lanes would be 0 by default, which could cause
> dsi_host_attach() to fail if dsi->lanes is set to a non-zero value
> by the bridge driver.
>
> According to the binding document of msm dsi controller, the
> input/output endpoint of the controller is expected to have 4 lanes.
> So let's set num_data_lanes to 4 by default.
>
> Signed-off-by: Philip Chen <philipchen@chromium.org>
> ---
>
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
