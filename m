Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D1943D681
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 00:19:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DE706E02C;
	Wed, 27 Oct 2021 22:19:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7378F6E02C
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 22:19:48 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id b188so5597452iof.8
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 15:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5Lv60x4D/nrcEcm4sCtEtNW+4qC7pIfvz/JXyTp80iA=;
 b=l1JdOp1Hg8fKCBpvQz9NawEiE8jvKtSoFGBqVeBs2itSH5JMqbhqSs1nsKXg23Iy2i
 DTZRvjtRyzjvu1JrFs4Y24+n8Fyc3qCO2KYDVw+SHNRkF+zLPJG7ulFrA6Pf9ctba4+w
 0xzpcl9nmZGXaiQT6G4LXZ8v/CTHN2CAub4bg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5Lv60x4D/nrcEcm4sCtEtNW+4qC7pIfvz/JXyTp80iA=;
 b=LwUP9pTZ6+JQyR00mB0/guLzLf1RO9WBUepkblkKzrmpFy62PqyRHPI8+tI234L8hy
 IyRBBXo3gyLEXkiMJK8A+rzEJjCNgl53pQA9ydHSm/w75VFtSqfDyS8BPIPZD7bVJKdr
 WU0Q3iIOJcDzbV+CrZYy0vXeWT76drHvy9pCLjVsVqjnEk9gf8ub79w8mwuYS+QuoxEY
 IuEKQDXEIpUS9upgPpPlx9bEDFiN2iWApeFirQBx7p4PZ5cj4OK5JQWjMRk8Ijkcx2Op
 HTOhUbWOgd+NiKht6ArnwZIEEIhFIr5SbVZMzkD5LbRCCYLLKty+zyxXUuS0JHAJxCbR
 bmBA==
X-Gm-Message-State: AOAM5337u0mf/8F01Cflasrff/uNwcDGqG2qBrSy+jixRkvpL4yfTZfr
 uc1nlCzS5+C6NGu4DDqr+glC1qm3z1CU8w==
X-Google-Smtp-Source: ABdhPJyE99/FzT7FadRAZwv522P/0Ro6bQq6X6Pd5vFSclft9KXcfqjgM6OZoXYXgLkp7YK3jggE1Q==
X-Received: by 2002:a5e:8c18:: with SMTP id n24mr166196ioj.211.1635373187739; 
 Wed, 27 Oct 2021 15:19:47 -0700 (PDT)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com.
 [209.85.166.42])
 by smtp.gmail.com with ESMTPSA id w6sm673015ilv.63.2021.10.27.15.19.46
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 15:19:46 -0700 (PDT)
Received: by mail-io1-f42.google.com with SMTP id o184so5623545iof.6
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 15:19:46 -0700 (PDT)
X-Received: by 2002:a6b:e50f:: with SMTP id y15mr165483ioc.177.1635373186021; 
 Wed, 27 Oct 2021 15:19:46 -0700 (PDT)
MIME-Version: 1.0
References: <20211026145622.v4.1.I9d81c3b44f350707b5373d00524af77c4aae862b@changeid>
 <CAD=FV=WTQG_zdQVDFPe7u8_350Nwr9tSeWjtQO7FD-3N-JMjuQ@mail.gmail.com>
In-Reply-To: <CAD=FV=WTQG_zdQVDFPe7u8_350Nwr9tSeWjtQO7FD-3N-JMjuQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 27 Oct 2021 15:19:34 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XjmjWY2_J8b_oOz8D2Pw3mVE=7G1gGqJyHuC4U=gNBDw@mail.gmail.com>
Message-ID: <CAD=FV=XjmjWY2_J8b_oOz8D2Pw3mVE=7G1gGqJyHuC4U=gNBDw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] drm/bridge: parade-ps8640: Enable runtime power
 management
To: Philip Chen <philipchen@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>, 
 Andrzej Hajda <a.hajda@samsung.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
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

On Wed, Oct 27, 2021 at 3:07 PM Doug Anderson <dianders@chromium.org> wrote:
>
> This will also cause a conflict when Sam's change lands [1] so I guess
> we can see whose lands first. Let me review that now and maybe you add
> a Tested-by? If it lands that'll make it easier and you can just
> rebase on both of them?

Ah, whoops! I took a look and it looks like Sam's series needs a spin
anyway. ...so I'd say go ahead and rebase yours atop drm-misc-next and
your and Sam's patch series can race to see which lands first and
which needs to be rebased...

If you can add Sam to your CC list, though, that would probably be a wise idea.


-Doug
