Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD45C3AFF42
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 10:28:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3B996E42F;
	Tue, 22 Jun 2021 08:28:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F241A88130
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 08:28:55 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id c15so9982923pls.13
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 01:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xbmzJIHqhBgOWsQSQkjC5FtA/VKpGoJmChYe0V2ngeE=;
 b=III2GS0ydeA7b61ppPScQbpVyc8iYHzVQlpc083+35LzCvpEyP5vwqUPAQdmk+xjfV
 jGdG8FhKCkCUMtDljnnkqepaGCUlbPEugZzbagCi3tqgBQJgwVutpmigZ8ASRRv+6qub
 E9UtM/OLu/HSyng4XxF/kEl2hhd4HatXXaydB4mVbLxgn22EFbxq9UTwF4mQWYLc3lyF
 MWlsJ4McvXOYdmnIf1UvTuGGohl1tS27qFwl3aCsMTVn+s9rUn14YwLiMxGd1/+DwyX0
 mG5YtF8Ois/HY0oFte4htFVvRKKD6A9OlAfB+p7ABgqeMAaW1lAS4M1fkEUCnZkqGMC0
 ZyOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xbmzJIHqhBgOWsQSQkjC5FtA/VKpGoJmChYe0V2ngeE=;
 b=X2afZi193mTFmBoCWnrKVowrWmULIlHtGGxiUK9ocPtXXQCDcabts9gGlFsOxevoDA
 SuX85n9v94rA1l2s9/c5isefJCfp5yGKHx5lxnhNjxzJYtpLrX8WPKz3WLT3uaKRNf5T
 1ObECasrxxget6KQWpG7jZLn56KBNHD8xi+DF9Az3IRzZDVoREixjUxSA3sztXrxsCwo
 w07eJLJ0Oa/xDnox9ccLrW9kNAXMQMNVZRPa89RvaWRKlcVjiSzjbGO3OiS2WjANKX1U
 OcxT7Z1GjD62jJFLxjHiKpD3f5rG4pX3IAJF6bfDX5hKYAj4RkVNB6oPM6z+yrM15zVe
 hYyA==
X-Gm-Message-State: AOAM530BGUIBnEcgWdt5jI86aFXdxI2FZ+FQSTKbXT6BIBXmHgm+ULsW
 kGFqICnbZT7EL1YKELBvsp0R5fzka26Lc+hio9JqGw==
X-Google-Smtp-Source: ABdhPJx6ZFLi7or1f8HNwvRKsQda5RAYQvCNdhkxiP3WcdRr4uNa+9lwQEU/MTa1ElLMmuRWPlTm308HaVOMHUqn1H4=
X-Received: by 2002:a17:902:8d82:b029:120:4377:8e0e with SMTP id
 v2-20020a1709028d82b029012043778e0emr21780852plo.32.1624350535484; Tue, 22
 Jun 2021 01:28:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210621125518.13715-1-laurent.pinchart@ideasonboard.com>
 <20210621184953.GC918146@ravnborg.org>
In-Reply-To: <20210621184953.GC918146@ravnborg.org>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 22 Jun 2021 10:28:44 +0200
Message-ID: <CAG3jFysvvOaPPKf0xpE34zpwk4bK8kDfks9GGXD+ukmaKiBaYw@mail.gmail.com>
Subject: Re: [PATCH 0/5] ti-sn65dsi83: Finalize transition to atomic operations
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Marek Vasut <marex@denx.de>, Loic Poulain <loic.poulain@linaro.org>,
 Maxime Ripard <maxime@cerno.tech>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Douglas Anderson <dianders@chromium.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Stephen Boyd <swboyd@chromium.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Valentin Raevsky <valentin@compulab.co.il>, Adam Ford <aford173@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied to drm-misc-next


On Mon, 21 Jun 2021 at 20:49, Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Laurent,
>
> On Mon, Jun 21, 2021 at 03:55:13PM +0300, Laurent Pinchart wrote:
> > Hello,
> >
> > This patch series is based on top of "[PATCH] drm/bridge: ti-sn65dsi83:
> > Replace connector format patching with atomic_get_input_bus_fmts". It
> > completes the transition to atomic operations in the ti-sn65dsi83
> > driver. The main reason for this change is patch 4/5 that fixes a few
> > issues in the driver (see the patch's commit message for details), but
> > overall it also brings the driver to the most recent API which is nice
> > in itself.
> >
> > Laurent Pinchart (5):
> >   drm: bridge: ti-sn65dsi83: Move LVDS format selection to .mode_set()
> >   drm: bridge: ti-sn65dsi83: Pass mode explicitly to helper functions
> >   drm: bridge: ti-sn65dsi83: Switch to atomic operations
> >   drm: bridge: ti-sn65dsi83: Retrieve output format from bridge state
> >   drm: bridge: ti-sn65dsi83: Retrieve the display mode from the state
> >
> >  drivers/gpu/drm/bridge/ti-sn65dsi83.c | 166 +++++++++++++-------------
> >  1 file changed, 82 insertions(+), 84 deletions(-)
>
> I have browsed the series and it all looked good.
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
>
> on them all.
>
> It is news to me that the atomic ops are the way to go - but then I have
> been off-line for a while so no suprise or maybe I just missed it
> before.
>
> It would be good if the comments in drm_bridge.h could point out what is
> deprecated, so we know what to avoid in new and updated bridge drivers.
> But this is all un-related to this series.
>
>         Sam
