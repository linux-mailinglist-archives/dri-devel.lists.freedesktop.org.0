Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACA9485CFD
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 01:14:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B8A910E58D;
	Thu,  6 Jan 2022 00:14:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ABE810E58D
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jan 2022 00:14:18 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id y70so1152557iof.2
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jan 2022 16:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eeQl+BjiH7+9wbd64O7+kbmLU8ftNF3eSrLy24wAkHM=;
 b=XTpBcug0jMUyVVygTkuhrYPh7taAiCKOQ2ajtLCa6zFeMKNNgZNqtoWpNvDjnpq4l+
 Tco9Ef2SuRSmXJTpkRY3x4pABxhPj1fR2Dj9mMSrXJ7LPlmngN5Xy7WRPm3kJE6/eJpT
 g5Kg8qyu5YxUI6+E36FXKlSKGhhxr/926Rwu1aH70EyRhHjd6ju5dIEXWd1K7P1wW16l
 iAQsJRj+16S1YUQ7FBQeQZEfLgp7gHoaawYIW/hXukRIjUIFN3Hg6Tt0dsOW34F/BIfS
 3l9i4+7shoX6KWYnLvs2oghzEqX9i1f/H3dOGMEl2WTtjvl6+xsbw0T9IUp7ULdLM5Xs
 M4iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eeQl+BjiH7+9wbd64O7+kbmLU8ftNF3eSrLy24wAkHM=;
 b=fQDKpujKbgE7AXOFgQjbheY+QG/q8RmB9obZCWtO08vXj6IyCMojh0MbBVloEf7t9A
 OuhFfmLLkS1puJTSN8ezAZHYUww7PihLqpc+BHHD4NygefNlx4lRPVTkNjvNk2usAlAw
 KAkBemQfNIrIRQBb1Y+zBMI2GVdUTe+Ah34CGFY1LQZqnZOJjCrFQeEAMEVcuwz9lneJ
 KaIbfETiUt/fEZOGxH8PNZez46K0i/hzsc8Y2U0UG1cbu3ahw2BzSuw7buktHkBIq+Yb
 efHUBv+kdjyRPc0ggAc5fmdD6fahI5L8qYf6KNtnQu1+2mCrlWeI5yvIjlJLxjPznL0p
 +QeQ==
X-Gm-Message-State: AOAM532uZuProdrrGUrqK4Asl3SuMSEk17DZES5aLAj+DvleSvppfDgW
 64vbjNVwsB4dJ25V25w2cGu94QuUr1iz+IVnhm4Vmg==
X-Google-Smtp-Source: ABdhPJwgz5mAVWnIZYrCCi+2ofFB5tcua3t/hb3QCI9cdP9/EDCDtQWzZH0gswykWxT3NZ+I1odtjfToa8dWD7+IijE=
X-Received: by 2002:a05:6602:2d84:: with SMTP id
 k4mr27083247iow.168.1641428057726; 
 Wed, 05 Jan 2022 16:14:17 -0800 (PST)
MIME-Version: 1.0
References: <20211231045056.118640-1-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20211231045056.118640-1-yangcong5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@google.com>
Date: Wed, 5 Jan 2022 16:14:06 -0800
Message-ID: <CAD=FV=XK5=mm8O7QbSuCfrvM1cfkVQ81_jR=1kMExNQw7ZbqLg@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: Update Boe-tv110c9m initial code
To: yangcong <yangcong5@huaqin.corp-partner.google.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Dec 30, 2021 at 8:51 PM yangcong
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> Optimize two problems
>
> a)Turn off low voltage detection register.During the esd test,
> the low-voltage detection ic may be triggered to enter the slpin state,
> so a black screen occurs on the panel.
> b)Optimize CMD2 page1 gamma.
>
> Signed-off-by: yangcong <yangcong5@huaqin.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

While continuing to grumble about not liking this big binary command
stream, I'll still apply it since we've accepted the previous ones. At
some point I'm going to get fed up with it, though, and say that this
needs to be converted to something understandable instead of a big
pile of binary data.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

...and pushed to drm-misc-misc...

506d9d7414cf drm/panel: Update Boe-tv110c9m initial code
