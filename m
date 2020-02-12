Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B792415B468
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 00:04:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EA0B890AA;
	Wed, 12 Feb 2020 23:04:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com
 [IPv6:2607:f8b0:4864:20::a43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09406890AA
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2020 23:04:44 +0000 (UTC)
Received: by mail-vk1-xa43.google.com with SMTP id y184so1038059vkc.11
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2020 15:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rZc6YtKm0NgqfqELl0Ged7y550Im2QjkLBOstVaWr/E=;
 b=B/RnOoigo7Do72Ok+CIzPjCgyPH4qvuU85m2AGDbWVIlI2aVD4kshxqVkcOHxItPAP
 lhsMokayGGzLw6FPwokLCGD22QDsalq8UCou/e6YKFTLfhT74HnB6cCK3tKn8UojpvHb
 7jh2/BPTkwQWMPDnpUknof63iws9HXf5zTXJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rZc6YtKm0NgqfqELl0Ged7y550Im2QjkLBOstVaWr/E=;
 b=KhrXQekkd/HTNzcNqhKa7PID1A7LBiM1Gk9KXfElmhUIG2LkwPuFRwIt/T6PoWVcpi
 bN6xZmzSWRMqkqYo2mWSrrcFrsuquG84CE5b9XYbo2bIQ6Fr/4wVcB4ykDAqtQJUrECr
 Hx70fCsoerCrigCfBNCiUquCy0HNxWWlJ1Y4apo9rR3bA5q9bEn+9SD5Q1tC9nDEGwrK
 fGbXYUi54Y3nIY7kXQGxrv7rOG2rXgwN/GN0kj3yzyuFyZormYhbqu2Td/fHmXVbylXh
 BaY4ne5nAZEmMeDtrEDq/0JWxvncEPzaUzEAtMr/Np99qBF0pye7lWejiJLyhJ/ZDrQL
 JTfg==
X-Gm-Message-State: APjAAAWm+rMQQcC+XOxDDiZXz4LuTRGprjNk2XGeyWCuD27MYb2cBH9W
 1ibhhEP8Yqd7zdFOCQoetgt5ws4fi1w=
X-Google-Smtp-Source: APXvYqwb00CxvNV0elyliUP2XBzWczXlLjjydJqTpvbSrfaqbKmFJhphBEw8M5hVCR6DdGiSE1sNgw==
X-Received: by 2002:a1f:add3:: with SMTP id w202mr588484vke.30.1581548683772; 
 Wed, 12 Feb 2020 15:04:43 -0800 (PST)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com.
 [209.85.221.182])
 by smtp.gmail.com with ESMTPSA id i66sm132567vkh.28.2020.02.12.15.04.42
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2020 15:04:43 -0800 (PST)
Received: by mail-vk1-f182.google.com with SMTP id y184so1038046vkc.11
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2020 15:04:42 -0800 (PST)
X-Received: by 2002:a1f:a9d0:: with SMTP id s199mr582450vke.40.1581548682205; 
 Wed, 12 Feb 2020 15:04:42 -0800 (PST)
MIME-Version: 1.0
References: <20191218223530.253106-1-dianders@chromium.org>
 <20191218143416.v3.6.Iaf8d698f4e5253d658ae283d2fd07268076a7c27@changeid>
 <20200203233711.GF311651@builder>
 <CAD=FV=VTKfv93BiNRYBxWg8o8YKrQy3Z85MzR8XFr=GCS5xhdg@mail.gmail.com>
In-Reply-To: <CAD=FV=VTKfv93BiNRYBxWg8o8YKrQy3Z85MzR8XFr=GCS5xhdg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 12 Feb 2020 15:04:30 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XPscj+bDBjxqBSudj77WeAjCvmOYcOu27jk4gqiCcWcA@mail.gmail.com>
Message-ID: <CAD=FV=XPscj+bDBjxqBSudj77WeAjCvmOYcOu27jk4gqiCcWcA@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] drm/bridge: ti-sn65dsi86: Use 18-bit DP if we can
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>, 
 Neil Armstrong <narmstrong@baylibre.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Andrzej / Neil,

On Mon, Feb 3, 2020 at 4:21 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Andrzej / Neil,
>
> On Mon, Feb 3, 2020 at 3:37 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > On Wed 18 Dec 14:35 PST 2019, Douglas Anderson wrote:
> >
> > > The current bridge driver always forced us to use 24 bits per pixel
> > > over the DP link.  This is a waste if you are hooked up to a panel
> > > that only supports 6 bits per color or fewer, since in that case you
> > > ran run at 18 bits per pixel and thus end up at a lower DP clock rate.
> >
> > s/ran/can/
>
> I'm going to make the assumption that you can fix this typo when
> applying the patch and I'm not planning to send a v4.  If that's not a
> good assumption then please yell.

With -rc1 released, it seems like it might be a nice time to land this
series.  Do you happen to know if there is anything outstanding?  Is
one of you two the right person to land this series, or should I be
asking someone else?  I can see if I can find someone to take them
through drm-misc if there's nobody else?

It's not massively crazy urgent or anything, but the patches have been
floating for quite some time now and it'd be nice to know what the
plan was.  I also have another patch I'd like to post up but was
hoping to get this series resolved first.

Thanks much!

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
