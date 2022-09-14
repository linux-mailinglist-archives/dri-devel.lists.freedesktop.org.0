Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 944EF5B8573
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 11:47:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C67DB10E8D9;
	Wed, 14 Sep 2022 09:46:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54B6810E8DF
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 09:46:56 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id l14so33407070eja.7
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 02:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=D1IJE+DWffL4i94pjzxcdNvDlT2tyI9LE/a+47TyWzI=;
 b=DnDYeuuS4OGSt0dqVpNdWrWjTzx9GG6orWmgPId1Dk1SyrWn2kNLyfCISYYGt+dzqG
 tH2wCPZQCvqIhIcUlh/GTQ2RJylILrkpFqnRbfOCu3hirUq0GN6OZihJFhkzifVeI1NS
 ojp2Jr8veETnUSTzE6A6gRzWewBU2rb87vxPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=D1IJE+DWffL4i94pjzxcdNvDlT2tyI9LE/a+47TyWzI=;
 b=uM+PzKxC9fLI4fFhwOznz//3wuPIzRCXYSYonh5cW6mggueUxr6KXXXYGrBbANlAOS
 cbGVutu/nZVYohiPixS/rmgg9BckstVTt3fQ4i/mpkgnEZ3aEVqe6JAWYj9YT/z55ZB5
 4MLwIloRgvhqOBea9wM+ZwsbiFYpGs0A0iXqkikHPiQVlRjAxVXQhXf0FzhE3RDCW5JG
 OcxPSAG/cDTgfYBiiql58TbujlbR/uq0cWXKP/1AVXIdASL8YnI0RnBFRnJeaz9LjrKC
 ixtUSjxJ/iZr+BYx00PAPcJRLKg0cu9AeAv7i32/RSGSiq5kpOUjvxvs+1BVsTWai0BR
 kbUQ==
X-Gm-Message-State: ACgBeo1pWN9KaAhqIIvfHspbwjFYu7sFfNKuRsjT/l+AA3u2EdW2JijU
 4eKu8L4sXqInutM0Gv2CqELtxV/4xhiKJaHmOdTn/A==
X-Google-Smtp-Source: AA6agR6RxnGYldGTk4EfsJHDU5MhtWiSDzjAUS5X+wbJbHajjqBVJvBH7Df0fPmQHtffJLK+SFM2pYS3awJumr/Psls=
X-Received: by 2002:a17:907:8a1a:b0:780:ee1:b71e with SMTP id
 sc26-20020a1709078a1a00b007800ee1b71emr4069410ejc.474.1663148814841; Wed, 14
 Sep 2022 02:46:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1646406653.git.dave.stevenson@raspberrypi.com>
 <ec19836b0fbbc1bb53a6ba6ce93eec2184676aae.1646406653.git.dave.stevenson@raspberrypi.com>
In-Reply-To: <ec19836b0fbbc1bb53a6ba6ce93eec2184676aae.1646406653.git.dave.stevenson@raspberrypi.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 14 Sep 2022 15:16:43 +0530
Message-ID: <CAMty3ZCFUsg08tuqp9goTzBTKMJXmBEp7OiBEZCFo-VQpn5DMQ@mail.gmail.com>
Subject: Re: [PATCH V2 2/4] drm/bridge: Introduce pre_enable_upstream_first to
 alter bridge init order
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
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
Cc: Marek Vasut <marex@denx.de>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 andrzej.hajda@gmail.com, Andrzej Hajda <andrzej.hajda@intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave,

On Fri, Mar 4, 2022 at 8:48 PM Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> DSI sink devices typically want the DSI host powered up and configured
> before they are powered up. pre_enable is the place this would normally
> happen, but they are called in reverse order from panel/connector towards
> the encoder, which is the "wrong" order.
>
> Add a new flag pre_enable_upstream_first that any bridge can set
> to swap the order of pre_enable (and post_disable) for that and the
> immediately upstream bridge.
> Should the immediately upstream bridge also set the
> pre_enable_upstream_first flag, the bridge upstream of that will be called
> before either of those which requested pre_enable_upstream_first.
>
> eg:
> - Panel
> - Bridge 1
> - Bridge 2 pre_enable_upstream_first
> - Bridge 3
> - Bridge 4 pre_enable_upstream_first
> - Bridge 5 pre_enable_upstream_first
> - Bridge 6
> - Encoder
> Would result in pre_enable's being called as Panel, Bridge 1, Bridge 3,
> Bridge 2, Bridge 6, Bridge 5, Bridge 4, Encoder.

Look like this is something that I've reproduced before, isn't it?
https://patchwork.kernel.org/project/dri-devel/patch/20210214194102.126146-6-jagan@amarulasolutions.com/

Jagan.
