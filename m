Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D835524C4
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 21:43:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A24F110E48E;
	Mon, 20 Jun 2022 19:43:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB56510E482
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 19:43:46 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id r66so5161446pgr.2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 12:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PzT5BLDkdhOQNSy5zzuFU3a+r6aXrK7pxM/avNB16y4=;
 b=tjH/onhKKhU+kX3Pqg8Ksn+d/SN1sKS3QOFOOpz1EViEMY5II1O2Lu39tObzWxcQQ6
 Msol/v5oV55kz0s6ca7JN5/r/gLH5fXOp7XkzG4WsU/4qZEA0fuEFGzagUrnnzY0vpU9
 1hb83rmaUGhwnuY20HgwM2pJBs5lDepokjNPPp2fJSkmbzAjGfODPP6cKN0xOcLoeNTB
 kamd8+ap5ihsWjZpGylJ+oe06r6E3xN9lVUhbFbIKjydBTL5IQWJYgfI+7OJUadpytjq
 2vRGxdoo4nemBtbtxG3pOi9x2vist7RjZsY7kbtL7fByIy5ltTt4a7LjCmC5+BHR85nk
 xgsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PzT5BLDkdhOQNSy5zzuFU3a+r6aXrK7pxM/avNB16y4=;
 b=p661oyiQoz1nEnjEcSppAOEB52TpyyCtPOr2MpvLJDXjlgAWJDFGc3xKBRKtJyLuHP
 txeSHSSIwldRGpjLMzdatJEefmXr3mFYWxJdZgOZNocK1fKDAXJ9lwheZS0cXZy2LSQs
 bzhgJeQRN+yYIk0hwmWjl6WZ3BnA1Htjk30Ukpdkqec4UjFiskFdsrFHwKtl5RhzN3kC
 hEzaWGNxdgXoqUcQqml7Q3C7odkGAfIAWY22tbUk0S9XFDzLcIcmTB0Xn59ufpf/Etcp
 hH15Ugr+j/QITYdB1K7nWarZJDON7tRln99WpFxbyKa0CNmQMw3V0rqXBW5qW9psREwR
 ipVQ==
X-Gm-Message-State: AJIora+JyBrEBBWBW+BRtl1YksTiRVyF2T7GQ+pPPde8WRzPOOQQk8hs
 aNdWsZ/k4oCT2PI8sGw8/OhqgNXs1AtjpYBJzzfVUQ==
X-Google-Smtp-Source: AGRyM1vu02wE9Ha7pCyZAUWeI5M0PutLotSWD0Ave5kjcj/jl7vlY1BwnQ5lVcOmr+ANJbA/gzPNIbqCogRUKDAmXv8=
X-Received: by 2002:a63:dd56:0:b0:405:34ac:9bc9 with SMTP id
 g22-20020a63dd56000000b0040534ac9bc9mr23080773pgj.324.1655754226276; Mon, 20
 Jun 2022 12:43:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220615222221.1501-1-jirivanek1@gmail.com>
In-Reply-To: <20220615222221.1501-1-jirivanek1@gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 20 Jun 2022 21:43:35 +0200
Message-ID: <CAG3jFyuL6EwvPNqy3QndwHtHVJei4fHNr85-pAbaycLhBCf4ig@mail.gmail.com>
Subject: Re: [PATCH 0/2] Fixes for TC358775 DSI to LVDS bridge
To: Jiri Vanek <jirivanek1@gmail.com>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Vinay Simha B N <simhavcs@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 16 Jun 2022 at 00:25, Jiri Vanek <jirivanek1@gmail.com> wrote:
>
> This patchset fixes two bugs in the driver for TC358775 DSI to LVDS bridge.
>
> Jiri Vanek (2):
>   drm/bridge/tc358775: Return before displaying inappropriate error
>     message
>   drm/bridge/tc358775: Fix DSI clock division for vsync delay
>     calculation
>
>  drivers/gpu/drm/bridge/tc358775.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>

Applied to drm-misc-next.
