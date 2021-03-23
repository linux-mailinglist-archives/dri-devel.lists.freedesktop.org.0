Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F389346AC6
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 22:08:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE2326E0EC;
	Tue, 23 Mar 2021 21:08:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FBC46E0EC
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 21:08:37 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id c6so16074482qtc.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 14:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fGp9OGhSFYep+wgICuctJHe6AunYvp6GoDFbNEb/8TM=;
 b=j+5PaN95fKfswhdgD662vrvF8rN4CfNwG0kwHV81OlkvM8XS2H8sc20+r4YTghNet/
 V0wWg+nF1W9hUBEZeCgYjjcdqHm1Fy539xa2f7uEmeWZ7IkAJ/1lPspWn7yLuI81nwHf
 o3jILhpzIInb7kSAYo3jc2GypXixenKdS/mqU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fGp9OGhSFYep+wgICuctJHe6AunYvp6GoDFbNEb/8TM=;
 b=KAdtJM6oaoc7lZ0wMdKFtaKk0i1Dc8bWL1925fi/SBNbcrko5xhI6T8ioF4BIIs2Oj
 79uzC21oFvyODjFxkZ/flGbnpB93m34nColPKCfpd8FId3r5GtjWUYaavF75+V48c5Lq
 CT1bR8Z1TfiUfHPECEKFLZrY9rPu8MS+fNaXhm0vQ9zPhKYlOPJFwtzhjGdTq2pRG88Z
 sL0AkR5ENiEaqBhbmzjuaSl9+P3+A3ME8rgJg68nCk4vYVP/2ERCXSoAze706DiKcNME
 GIDFZgc7K+v/kCVIKbe5DpFeRbZ3zgSv572PKUuE+aBWNimuZI1HXl7YKhQA1jRAVz7J
 p9GQ==
X-Gm-Message-State: AOAM530RV87ocLAd5FMJtq9C/37MCv+J4WFBk+x0lfdR26GP8bily36F
 pqXD0zs2QYt+O0C9iZziJhYiEchAeXOEDQ==
X-Google-Smtp-Source: ABdhPJw8ACR0bqNcN1M7fFQ8Y7dm8GlIStHQKy6NVhNQacIN8IHylD8YbT99W/zJeoy/vM3YFiF7rQ==
X-Received: by 2002:ac8:544:: with SMTP id c4mr217539qth.245.1616533715750;
 Tue, 23 Mar 2021 14:08:35 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com.
 [209.85.219.174])
 by smtp.gmail.com with ESMTPSA id f136sm104650qke.24.2021.03.23.14.08.34
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Mar 2021 14:08:35 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id l15so789327ybm.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 14:08:34 -0700 (PDT)
X-Received: by 2002:a25:b443:: with SMTP id c3mr300894ybg.32.1616533714574;
 Tue, 23 Mar 2021 14:08:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210322030128.2283-2-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20210322030128.2283-2-laurent.pinchart+renesas@ideasonboard.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 23 Mar 2021 14:08:23 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xak21bi5zcoKv9o7aLcJpWsm67U9NzYZ6zJD+UnOOtfw@mail.gmail.com>
Message-ID: <CAD=FV=Xak21bi5zcoKv9o7aLcJpWsm67U9NzYZ6zJD+UnOOtfw@mail.gmail.com>
Subject: Re: [RFC PATCH 01/11] dt-bindings: drm/bridge: ti-sn65dsi8: Make
 enable GPIO optional
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>, Neil Armstrong <narmstrong@baylibre.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, linux-renesas-soc@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sun, Mar 21, 2021 at 8:02 PM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
>
> The SN65DSI86 EN pin can be hardwired to a high level, or connected to a
> global reset signal, not controllable by the kernel. Make it optional in
> those cases.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  .../devicetree/bindings/display/bridge/ti,sn65dsi86.yaml         | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
