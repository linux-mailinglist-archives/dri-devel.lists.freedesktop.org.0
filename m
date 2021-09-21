Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93830413A70
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 20:59:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 865CA6E951;
	Tue, 21 Sep 2021 18:59:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A4AF6E951
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 18:59:38 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id h9so23922300ile.6
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 11:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rPanjl/X9LOUVmXrjkeXI0Q7gVy8gp22iJNWmdA5zZg=;
 b=oJAh/Se0IUU493aQZeFEycxN0jgmMrqqfg8bRl2QN9NCCvx/b1R7KbCPnWQ8GcWvSk
 T+8zaXjaQaJ7arkXQqtnT1Xmk0wUH9bovJfATBBVQl1dYBpLPImXLnh1xneyZXVjiW+h
 UrBBJuk0zYG/2/Zx+nJGSq1+0RPqvuacEezNI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rPanjl/X9LOUVmXrjkeXI0Q7gVy8gp22iJNWmdA5zZg=;
 b=YzExlXHDXN31aslxZoXrbzPC/3qmAbbpvYgyb42xvfbuVomPv46nJyc8Yf5ya+w3Cv
 evguSiRv5zxUzrXVaN5wFLCW2p+QdKlrOYdDXibZOSwoTWkpDX7c7b6r99A2w1eKnxVy
 YkW5yGk0I7rgM4ZShlByppYiXmyUu9acUXHA44yWJnaQbeLvhrO6EfRtlQntjA0wHPQQ
 9vJeLGfcUhdX1toMF9VkBuB1ocUhLgbwTxKfaNHEsB224Xi2C5ndHl95NLD2a/xQsqeN
 96guK866TDuvweds3qa27deUGWJYxGdwxZcBL3/mOD0r2ndQTqje5zk/xWcZjqVCwWzJ
 SoVQ==
X-Gm-Message-State: AOAM5331hcyoki1g+wyxfzwyOk4viMtYtLufHqxzKiy7MBdErjbLkafR
 MXK2QrxExozf5tYlRnKMq57ab6uxNkvfhA==
X-Google-Smtp-Source: ABdhPJwOjTxRPTSsq4g5L4h2o/49zlCKH/iTRbj5fGwNgAXOxFrOAui7KTvYS0R+6UvBEeanD0QUfA==
X-Received: by 2002:a92:6f06:: with SMTP id k6mr21588812ilc.116.1632250777530; 
 Tue, 21 Sep 2021 11:59:37 -0700 (PDT)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com.
 [209.85.166.171])
 by smtp.gmail.com with ESMTPSA id z6sm4040978iox.28.2021.09.21.11.59.36
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 11:59:36 -0700 (PDT)
Received: by mail-il1-f171.google.com with SMTP id b15so23920348ils.10
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 11:59:36 -0700 (PDT)
X-Received: by 2002:a92:da0c:: with SMTP id z12mr21949905ilm.120.1632250775619; 
 Tue, 21 Sep 2021 11:59:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210921110556.v6.1.I2351df94f18d5d8debc22d4d100f36fac560409a@changeid>
 <20210921110556.v6.2.I1d6ea362dc76efa77cca2b46253d31b7651eaf17@changeid>
In-Reply-To: <20210921110556.v6.2.I1d6ea362dc76efa77cca2b46253d31b7651eaf17@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 21 Sep 2021 11:59:24 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XFK44E_gz8KvPRape-KHE7FGH1L=kYW9Qtx8V8P35Jcg@mail.gmail.com>
Message-ID: <CAD=FV=XFK44E_gz8KvPRape-KHE7FGH1L=kYW9Qtx8V8P35Jcg@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] drm/bridge: parade-ps8640: Add support for AUX
 channel
To: Philip Chen <philipchen@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>, 
 Sam Ravnborg <sam@ravnborg.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@linux.ie>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
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

Hi,

On Tue, Sep 21, 2021 at 11:06 AM Philip Chen <philipchen@chromium.org> wrote:
>
> Implement the first version of AUX support, which will be useful as
> we expand the driver to support varied use cases.
>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Philip Chen <philipchen@chromium.org>

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Snoozing for 2 days and will plan to apply to drm-misc-next unless
there are objections.

-Doug
