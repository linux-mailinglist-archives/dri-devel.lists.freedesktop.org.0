Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 373B83484C8
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 23:45:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F1146EA9F;
	Wed, 24 Mar 2021 22:45:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 943946EA9F
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 22:45:03 +0000 (UTC)
Received: by mail-qt1-x830.google.com with SMTP id j7so344184qtx.5
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 15:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8ZwT8HkDsYvi3JzaJTZKAAxslt8vR/nI4jrcLGJopjQ=;
 b=QngrCIgC/wKLQ7c3KG9w7IKpUZodjWSZvldFViMa0lUYVj6zczuz1FnHD+n6fO983q
 za80kVYR9hB3pNX/JWzDVC5zoPAWX8UrqzoBtM9n0FEo2QjBwA8naoXc/zhMq74yHUl2
 xjoMVwQIUQazyfWzNKlRyUrx+BbQz3ulLaUj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8ZwT8HkDsYvi3JzaJTZKAAxslt8vR/nI4jrcLGJopjQ=;
 b=cJ+E8ZBw7ytcpEvLmW2Ncin2ivWdFFWBWgKu0SnD8VN7wjRXvKBW45VcMF2EvlVF4T
 2CkqsndUEOunI4X/zoWHRpLq5A6aOT/bZITSGe5ASQnyFivNbXExmAF+tdwtcTtBhny+
 C5ygo7c12Ibl6FpMlFsf4/QuDVBYriEnu0XaVvzoHXrDj3vSUCK9vidsgYlXoplxzK2L
 rescRl0o9258KvG1unXL7g3pb5RISBo3A+CkdU2FB5n64pXiJdhpRlTxWJgiXGj5VspD
 gcQzAm0Oa824BObXMyXOWcTM+fkTPgcTvRkE/xaOX43zBGZF2lZhV4sknNdVVaZimmvN
 ZWWQ==
X-Gm-Message-State: AOAM532zQgxhCcKsrqQQ2VLLWxqRCJb3d0g6ict46XvqE+8bE0F75nFl
 XPPmMWP+K0dl/+U7vJo8wMAnoThawL/jrg==
X-Google-Smtp-Source: ABdhPJwybAYURXm5JUv0VVywHovKuKczN9HcA1pEoAxklGIm6Sfox02jqgvvQklfLuHG3ZobTcEIcA==
X-Received: by 2002:ac8:5e0a:: with SMTP id h10mr3952125qtx.71.1616625902625; 
 Wed, 24 Mar 2021 15:45:02 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com.
 [209.85.219.181])
 by smtp.gmail.com with ESMTPSA id z24sm2822630qkz.65.2021.03.24.15.45.02
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Mar 2021 15:45:02 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id m132so300178ybf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 15:45:02 -0700 (PDT)
X-Received: by 2002:a25:69c1:: with SMTP id e184mr8194218ybc.345.1616625901780; 
 Wed, 24 Mar 2021 15:45:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210322030128.2283-7-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20210322030128.2283-7-laurent.pinchart+renesas@ideasonboard.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 24 Mar 2021 15:44:50 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XLkfSZ=sR4y3PbY4PJdita6GERzoh--j8mrjXKRCW22g@mail.gmail.com>
Message-ID: <CAD=FV=XLkfSZ=sR4y3PbY4PJdita6GERzoh--j8mrjXKRCW22g@mail.gmail.com>
Subject: Re: [RFC PATCH 06/11] drm/bridge: ti-sn65dsi86: Group code in sections
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, linux-renesas-soc@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sun, Mar 21, 2021 at 8:02 PM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
>
> Reorganize the functions in sections, related to connector operations,
> bridge operations, AUX adapter, GPIO controller and probe & remove.
>
> This prepares for proper support of DRM_BRIDGE_ATTACH_NO_CONNECTOR that
> will add more functions, to ensure that the code will stay readable.
>
> No functional change intended.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 75 +++++++++++++++++----------
>  1 file changed, 47 insertions(+), 28 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
