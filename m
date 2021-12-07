Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B853946C707
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 22:59:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A89B76EADB;
	Tue,  7 Dec 2021 21:59:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E00156EADB
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 21:59:52 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id y16so696190ioc.8
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Dec 2021 13:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=atU9jwmDu1ac+tPH14Y2BWTuoNEX/32eFlQLglMG6iM=;
 b=boojLZt+HAHZ9Pd+otNf2edcHXApkbFARJtm0jHillGMhkFsreHcZUi0H+HIrhTULQ
 Q1aatEYVf+GCcA6HSI83dPF3c6WN279buc+UUSGcKNnavVUy3eZsmKV3JtfowUAhfno8
 mN6JUQ09qCxd26HLA53VXFcP2b0nN01NnCSjQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=atU9jwmDu1ac+tPH14Y2BWTuoNEX/32eFlQLglMG6iM=;
 b=xwXhGek9utT0KS/m4Du1g4fGAJ3km8WFBXVSl+Gi7+T5jQqTUHG4VNp29PnZTCEUNH
 WokUytIGr35OceWa5MxYGVCnO6bfrM7t8o7GflnBMFPVtQePsXIOsj2ZTVnTzqXhrdR7
 jp8XLpe9ytCuk4B1Rg7tgfOPXu7ysCxBacVpprbUEYCXpWe088PkrhKmTvD1li2GYnlZ
 CdVj4cR1ogQrioXzEAb9iY6jT+ujARO0gWjFWavAW3S74XwAvGa+GNlS9rt8ylZ7I5rm
 6Om/LCCYAhYapf/lfBvj2nrDiUYwI267qR9Q0ZD/3jYf1if6HQ3WUSn7CLThEMep7wmy
 SMnA==
X-Gm-Message-State: AOAM532z4l27tDdGyJYjwdhpiyBWkfzR47OD3m5eNJtY2RJFPHcqCRzM
 HukAmSSy6QxOq+IVHwKi96ZaFYXuPZothg==
X-Google-Smtp-Source: ABdhPJxgVu48Z/Aq3XdODk5++Kf336I+3pA5tH2VQrbYISh+z8VGxEiFriqsRFCN0Cw89+EtCLcZmg==
X-Received: by 2002:a05:6602:1552:: with SMTP id
 h18mr2412456iow.183.1638914392038; 
 Tue, 07 Dec 2021 13:59:52 -0800 (PST)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com.
 [209.85.166.178])
 by smtp.gmail.com with ESMTPSA id k9sm562032ilv.61.2021.12.07.13.59.51
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Dec 2021 13:59:51 -0800 (PST)
Received: by mail-il1-f178.google.com with SMTP id r2so416336ilb.10
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Dec 2021 13:59:51 -0800 (PST)
X-Received: by 2002:a92:cdaa:: with SMTP id g10mr2213708ild.142.1638914390989; 
 Tue, 07 Dec 2021 13:59:50 -0800 (PST)
MIME-Version: 1.0
References: <20211207215753.635841-1-robdclark@gmail.com>
In-Reply-To: <20211207215753.635841-1-robdclark@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 7 Dec 2021 13:59:38 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Xh1OHVCdwHauebFC-OUBCXfkZkTC3V8yxARou_UfXq1Q@mail.gmail.com>
Message-ID: <CAD=FV=Xh1OHVCdwHauebFC-OUBCXfkZkTC3V8yxARou_UfXq1Q@mail.gmail.com>
Subject: Re: [PATCH v3] drm/bridge: sn65dsi86: defer if there is no dsi host
To: Rob Clark <robdclark@gmail.com>
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
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jonas Karlman <jonas@kwiboo.se>, open list <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 Stephen Boyd <swboyd@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Maxime Ripard <maxime@cerno.tech>, Sam Ravnborg <sam@ravnborg.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Dec 7, 2021 at 1:52 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Otherwise we don't get another shot at it if the bridge probes before
> the dsi host is registered.  It seems like this is what *most* (but not
> all) of the other bridges do.
>
> It looks like this was missed in the conversion to attach dsi host at
> probe time.
>
> Fixes: c3b75d4734cb ("drm/bridge: sn65dsi86: Register and attach our DSI device at probe")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Reviewed-by: Doug Anderson <dianders@chromium.org>
> ---
> v2: Drop DRM_ERROR() in favor of drm_err_probe() and shift around the
>     spot where we report the error
> v3: Add \n and cull error msgs a bit further
>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)

I can add a further:

Tested-by: Doug Anderson <dianders@chromium.org>

Since it's pretty straightforward and I don't expect it to be
controversial, I'll plan to land it tomorrow in drm-misc-next unless I
hear otherwise.

-Doug
