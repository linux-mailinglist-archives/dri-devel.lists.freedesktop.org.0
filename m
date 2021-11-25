Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9EE45D7F3
	for <lists+dri-devel@lfdr.de>; Thu, 25 Nov 2021 11:08:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33F676E34B;
	Thu, 25 Nov 2021 10:08:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDE6D6E34B
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 10:08:27 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 o6-20020a17090a0a0600b001a64b9a11aeso5344652pjo.3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 02:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Dpnu1/6yOkuuCH/ZN6WkNINuR/8m8h6zVVSJwYoqYq0=;
 b=GDGjyl56MydM000AjpIcyCHg6ib0vb3fgxBUv2+ozwRpG3KpT6kZZ51krmIFnhkseI
 x9mMd23ZLT27XqgC76hqEkmseCkvxxQDOd0SMo2yhmCQpzEAmqDnUVAOp4C5nN8dcrdi
 oaAVZM/JycIvHAoUkf94SYuE+r6QDlfizgDRgCIYc5xQ+XEj1cfReEK1P6iak3G1q9kr
 XjkK0cP6YMDaJbe50jK4ZotR8uNdE9/Ufzy2TZ+dgR/j5MJa6cdAeuOZweMPFwdoK5d0
 fXPUK3jCDbE8ck6d8GbbRTmrkx1li1pr6c71Z0o/LWHZ91CSzQjNhCmQKHWV7INtGBeB
 U2RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Dpnu1/6yOkuuCH/ZN6WkNINuR/8m8h6zVVSJwYoqYq0=;
 b=jro2zXL1IwFm1dhTiHQXrfUOw3j4hzjUsug3Y4DaMWhUAo1F412wAPcE84P5zHo/F/
 7o6EtlFWW5my/5Zvr+QQjFwRtrQcAHaJhBlnkZan0QNgyKnmAUZBZYgD8jxshiMQoZgz
 xSiMXjj/vZcf5KqXjpeLcASnXP0/chN5UlMjn1/7Znzw8hHP2vENL/av8166p5zceVks
 DDWEjnayGuBdM9S95I3SmKag/DlrwiwDC+sYd0dlzfPLd4cBnBKnioRWsVgew2raQipX
 dMGWP5MYiKgN5CNJXlEKKMNu8IXK3NSrhpeqs+JYlBNLL5NPiraalbUgGEwQqvH5n62v
 KF6Q==
X-Gm-Message-State: AOAM532Byg3nSGGKsqWDu7fNfPj5EiRIO5mOVAGCkNKhBL/erGYo1Grp
 CJyhgjVqA1tv+Twf080F0U+LcXGD/77CKcTBv27MJA==
X-Google-Smtp-Source: ABdhPJz+NTXqZHw+mAr5aK8WO0aa5tYnZafpMCG8SxZ8nd297hrIXq/zBL7KVwlJS/KtNmoEyjg0bBr49xYaV3M9w18=
X-Received: by 2002:a17:903:2004:b0:142:6344:2c08 with SMTP id
 s4-20020a170903200400b0014263442c08mr27504855pla.51.1637834907420; Thu, 25
 Nov 2021 02:08:27 -0800 (PST)
MIME-Version: 1.0
References: <20211124145219.GD13656@kili> <YZ9GYUrBvmCQaZtg@google.com>
In-Reply-To: <YZ9GYUrBvmCQaZtg@google.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 25 Nov 2021 11:08:16 +0100
Message-ID: <CAG3jFytY6KB+u+nji5tse81AJkiE1gP+6d7XvooheQwjqvw6Rg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: anx7625: fix an error code in
 anx7625_register_audio()
To: Tzung-Bi Shih <tzungbi@google.com>
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
Cc: Pi-Hsun Shih <pihsun@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>, kernel-janitors@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Xin Ji <xji@analogixsemi.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 25 Nov 2021 at 09:16, Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> On Wed, Nov 24, 2021 at 05:52:19PM +0300, Dan Carpenter wrote:
> > This code accidentally returns IS_ERR(), which is 1, instead of
> > propagating the negative error code.  The caller doesn't check for
> > errors so it doesn't affect run time at all.
> >
> > Fixes: 566fef1226c1 ("drm/bridge: anx7625: add HDMI audio function")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>

Applied to drm-misc-next.
