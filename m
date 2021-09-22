Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECB5413EA0
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 02:24:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 835346E936;
	Wed, 22 Sep 2021 00:24:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F7EF6E936
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 00:24:53 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 w64-20020a9d3646000000b0054716b40005so1067452otb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 17:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=LoJE11wHmqt1nX2FPOVtgACQFiswcqUt0WgjAJ5CbbE=;
 b=K990CqCVLUnVh7CAt4m/Bv6bAFLRjv1xOEWl6leV2W5NqYDn/EGTx9nAHwn7COn0z6
 116CcjDaDaphgRz3hkE2w1pq/ifOIF0PVtatoH9eGC5gG7Jg5gKDFxF3y9Apg7QIWUsD
 Y/wSjvdJP5uc7QVAXfPeAOlYxYBsMBRZ1U2KQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=LoJE11wHmqt1nX2FPOVtgACQFiswcqUt0WgjAJ5CbbE=;
 b=tVNVl3hhMKATvRWRRqGlW16I7boIoQawJuJwwLCL6qMT4Z1DStM9da3RaNDPeBW53/
 4wRQ9seQazBX+D39QvU+tx9uArOz3TfZKfTVWYPP/l/lfkHgxcmOLUkdwUvVy0tZ5h4i
 K+i2VakSER8mGu/+d0YKBnJRCaZCNKrz81HWAFLJz0qFysBBso/07BXCsDfPxUkg3sMi
 JVxLhyfArzBXN9gm683mcIueozzQbWxys8QYWel/3gAxKExaugQ6W0X4OLJzf0CWa9vg
 SErQ0W81tUWtkOQODJioxHd140lJTaGs6Ge6qQg9ZqbbQKC1IBgzv6NjmVSjtvt3Kdeq
 dN+w==
X-Gm-Message-State: AOAM530flqR3m1rXOaMSaINndAFREtV4wjqhlh+qeDLgZ881dquue5us
 bYo6+44tt8TsRSl6/u3RPZ83ABYvVtHNjD8ZrJYeTw==
X-Google-Smtp-Source: ABdhPJweHEttDkxTJ6EzvLg6rBvD920u8NzeaKnCUYKjO2wfHXPsWSNZixV3jw8VmUGTDMmO+ONaqY8esGhoZi1uLzg=
X-Received: by 2002:a05:6830:708:: with SMTP id
 y8mr8045538ots.77.1632270292281; 
 Tue, 21 Sep 2021 17:24:52 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 21 Sep 2021 17:24:51 -0700
MIME-Version: 1.0
In-Reply-To: <20210921110556.v6.2.I1d6ea362dc76efa77cca2b46253d31b7651eaf17@changeid>
References: <20210921110556.v6.1.I2351df94f18d5d8debc22d4d100f36fac560409a@changeid>
 <20210921110556.v6.2.I1d6ea362dc76efa77cca2b46253d31b7651eaf17@changeid>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 21 Sep 2021 17:24:51 -0700
Message-ID: <CAE-0n51+kYSsgNtqMk=9cicUDW0bM6DYfgvWLpdpbacXQjDDFg@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] drm/bridge: parade-ps8640: Add support for AUX
 channel
To: LKML <linux-kernel@vger.kernel.org>, Philip Chen <philipchen@chromium.org>
Cc: dianders@chromium.org, Sam Ravnborg <sam@ravnborg.org>, 
 Andrzej Hajda <a.hajda@samsung.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 dri-devel@lists.freedesktop.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Philip Chen (2021-09-21 11:06:17)
> Implement the first version of AUX support, which will be useful as
> we expand the driver to support varied use cases.
>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Philip Chen <philipchen@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
