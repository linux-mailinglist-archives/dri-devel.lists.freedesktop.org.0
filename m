Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA1B3AF166
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 19:07:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 266756E0B8;
	Mon, 21 Jun 2021 17:07:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBEA76E0B8
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 17:07:06 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id e33so14686152pgm.3
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 10:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BAr6lf+gW/YDiObJSIXe1ACoTtioJSuR6ie4cvgHlAg=;
 b=N5oHfUFg04QfVha6DDAOo9TeTtNFEs4Wc7d8wc3zh1iP4kAyBc4Ew5kXnofpsbO4gu
 lanW3PCu5IHMT3v/sk4UYLDQ8KE4/kvW85DfdyGJvviLYyienme8n5vxoPqYoxyOarmy
 lCh02j79mdktQHRzzCthYXOIUBQSj7N+yBlcvM4/5xmYGaWoMZfPLw5Oqr+kZwXCWSiG
 3F045NCrofOpi2/mkff3dBTMZwrGb1ab93jqQLtAr4NoWdbSw67sUcoDFCi8vktLYmt4
 gbKhnsxO207GBJjnR6kkVKmfAe1X3HsHa4DXNaySGFqyEZQ6DWKWRx2mm7bCtPg6MaMs
 O/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BAr6lf+gW/YDiObJSIXe1ACoTtioJSuR6ie4cvgHlAg=;
 b=r/I2VbW6UXxZlsYmZuInqADd+vf0HYn02cun2EwWSxiIvQJlmQXRODTMYYPD8r3lKM
 u841hE7pWJyHzQk377ftZ4NJGTfKut5lqCfxLblfV1F0Xc7GceIy4hNBxlSGTaH82WsD
 dT36JWVBYc5PBqxB1M3yrgQLhpMMnjqd08kyV02/heuMIVBDiKM0wAcwgirNYn0TAzcf
 v1jIlXP+0VM4mnMyuVFo+EliZ2DLq8I5+iq+jUl04etBAzK/tVdLENkiK5Eke4I7TzFO
 hDAnw1lKiM0LQtC0c+0y+BQJO9qzseDDCmjKNOLA9eR4wgDNnkiZADtPtokes8W1D1my
 waww==
X-Gm-Message-State: AOAM531cWWY8odmpkX9w0jzHUIfPJP584UVOR/jWYcjecK4X/MP3hKVo
 bXlh4e0TjmJBis26w0hTxY5KOjJgyMV7lisZV2p35w==
X-Google-Smtp-Source: ABdhPJwFuXQRHtlh76mYgbIi0vMK4JRgwusz1fBzovlhIaaoMigTyjibzT11KKSVJe6+5gfAvtUbjL3nMFDBYdWJVSw=
X-Received: by 2002:a63:d47:: with SMTP id 7mr24866154pgn.339.1624295226533;
 Mon, 21 Jun 2021 10:07:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210620224208.184719-1-marex@denx.de>
 <YNCGW5vQibED5v5V@pendragon.ideasonboard.com>
In-Reply-To: <YNCGW5vQibED5v5V@pendragon.ideasonboard.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 21 Jun 2021 19:06:55 +0200
Message-ID: <CAG3jFytVrJnDCbEdanNgVSgiw6pecc7sHsg6PRjryZCdvzFpUw@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi83: Replace connector format
 patching with atomic_get_input_bus_fmts
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
 ch@denx.de, Adam Ford <aford173@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Valentin Raevsky <valentin@compulab.co.il>, Sam Ravnborg <sam@ravnborg.org>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>
> Perfect :-)
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>

Pulled into drm-misc-next.

https://cgit.freedesktop.org/drm/drm-misc/commit/?id=db8b7ca5b232083c82f627af7fe653d8074c5ca0
