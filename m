Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC31343DA4
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 11:20:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 045D589DB8;
	Mon, 22 Mar 2021 10:20:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1D8989DB8
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 10:20:10 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id b16so18607965eds.7
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 03:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JxQycfZl4jSTbGYi2nkecQ4g9I4uNrlUDRaBTHk2Ti0=;
 b=rn6m9hNN8Mz6OqugJhzoo1bEFFx4j4lKoJXSVe+1A6Y6EJcb2PvN1gIVrIPgBYYF+b
 Udb+DaMhSruAfgVQaY8RqZpuqGxhcRs9qjHDX4Aue0DuxGduO2duB6o79fjaOvfbzN7A
 5QJTL5Yxqn/Z4dcUZ7n8CGotsEEXinRaiJj0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JxQycfZl4jSTbGYi2nkecQ4g9I4uNrlUDRaBTHk2Ti0=;
 b=r22UGM2+Aoaeqq5RJHqGhyYWWlMlb/xdT+0TWKK8dyjfZvIgTyqoGYi9Um2xAQIluC
 Juboy/xv70SvI9g7MCi1Qg4osgsrLaru9DD+ZncnmrB3zmJexbDGK/o+9x3xshsjGyVY
 CfE3OnG/e3pkvJM26cBLlsnWhFx6CuHRIlg3v7BF2j9EmeGqPs6NaQuuuSBQQOHHcYRK
 SjyyNr6jIhJHDjMxHsziOTOAaDqQhvzAB1/VuO014vgEsDbV4sCPAqgWfddCtwhqvinc
 9hRWecKn/5J9wEfSvrtkPqiw2QNlXJFYTqtfIyZP56DWQy51n0+zlMtDoSWrtXe1xoo8
 16ug==
X-Gm-Message-State: AOAM5307fxEftetSvRyupDnV0BZjexo7IGxXkTSdAxu0rM2a+vgPt8hR
 v5oaDPreO4b+4Bh+deqTTeyaZIqJACHkTIFp5gj3Dg==
X-Google-Smtp-Source: ABdhPJzBNauWmxsB4JWin1uuFzEirq0q9Gbf5fmcNqM8+uLxgvTBp0nDyl0nhbG36g5UIA6kLEnr1yLEcyj3tiu/NYA=
X-Received: by 2002:a05:6402:22b5:: with SMTP id
 cx21mr24884079edb.27.1616408409172; 
 Mon, 22 Mar 2021 03:20:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210322030128.2283-6-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20210322030128.2283-6-laurent.pinchart+renesas@ideasonboard.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 22 Mar 2021 15:49:57 +0530
Message-ID: <CAMty3ZA58KZNGAv-OUhJv+sV0Hd6uGmVjm0gUXv83CMD8Vwfkw@mail.gmail.com>
Subject: Re: [RFC PATCH 05/11] drm/bridge: ti-sn65dsi86: Wrap panel with
 panel-bridge
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Douglas Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, linux-renesas-soc@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 22, 2021 at 8:32 AM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
>
> To simplify interfacing with the panel, wrap it in a panel-bridge and
> let the DRM bridge helpers handle chaining of operations.
>
> This also prepares for support of DRM_BRIDGE_ATTACH_NO_CONNECTOR, which
> requires all components in the display pipeline to be represented by
> bridges.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---

Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
