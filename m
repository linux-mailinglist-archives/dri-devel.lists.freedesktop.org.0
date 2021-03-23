Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D73346AC7
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 22:08:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97E0B6E118;
	Tue, 23 Mar 2021 21:08:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 148816E118
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 21:08:44 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id h7so16052089qtx.3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 14:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bhxntC2kCWiXUcljK6XjLqn3ZyM1P9GZ6GZxVZPSLkc=;
 b=ISL5uaEpK/mtGEUnqfo26+gWCytbo2jzykYIzpcyEfjcO2M2Vf8DgJK+LmF5jLKcTS
 Dn5cc2X9PHWyt/wq3Hu0/LIp6socNPT4rfDKLOUYWki7K6UWoRDUPQ6fVkSME/GnXD4e
 MPeD6Zu3RWlv/nDBf8ZOOy2uyUSLM4pt154+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bhxntC2kCWiXUcljK6XjLqn3ZyM1P9GZ6GZxVZPSLkc=;
 b=VYWRAkV0ji0kZZ+kM3oIsNyxnUps/SlJ+CZ37psQKFbMgwwPo0wQQHgK13RXlXvO+6
 UZmIv0P02zePlFhJA9bkgDZuwdYnh+qeAilJB+j+GEUFab1S5pYOcnaeFg69pGRuK/Nu
 hgt1fmWf5CjOGROowqiAr0lXmgAZ5mN/FSZbGqyqcxOdczz8LVmg2F20Ab+bDKa0Fagi
 Bk+iK+TGKdE/CAnj4MuzqpKpBeQhsfAJCZnDlB2pGd6rtrRiCm5XtFJtCx5auE6ZgTe6
 KyUklLKyENX2E2W5j3zLt8guxejR02ZJgSWm/TYRuQ1RJHB6Ta1xJXkAg/zwb+1yWEz3
 FzwQ==
X-Gm-Message-State: AOAM530YRJkIhs4NNrye+7ypMCuzB5OnHdh4GjZuZKV/AvWzhzo1G/i9
 xPn0nIBS8pW4LlJSRwUWzcsTyl9uGaRuRg==
X-Google-Smtp-Source: ABdhPJxIEy8D1+B141BB7fu1ERW/9d+KnP74xFP5yKig6fQpYsnM5lqhQ5QgXrRVFft6QvaV9PFVHA==
X-Received: by 2002:ac8:698f:: with SMTP id o15mr249850qtq.39.1616533723118;
 Tue, 23 Mar 2021 14:08:43 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com.
 [209.85.219.178])
 by smtp.gmail.com with ESMTPSA id f27sm52544qkh.118.2021.03.23.14.08.42
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Mar 2021 14:08:42 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id j2so11851945ybj.8
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 14:08:42 -0700 (PDT)
X-Received: by 2002:a25:3741:: with SMTP id e62mr193674yba.343.1616533722144; 
 Tue, 23 Mar 2021 14:08:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210322030128.2283-3-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20210322030128.2283-3-laurent.pinchart+renesas@ideasonboard.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 23 Mar 2021 14:08:31 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UmBVmy_B5HM7M6LsKfKNWhzDthK_6RFc2vT6+TPUSmGw@mail.gmail.com>
Message-ID: <CAD=FV=UmBVmy_B5HM7M6LsKfKNWhzDthK_6RFc2vT6+TPUSmGw@mail.gmail.com>
Subject: Re: [RFC PATCH 02/11] drm/bridge: ti-sn65dsi86: Make enable GPIO
 optional
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
> The enable signal may not be controllable by the kernel. Make it
> optional.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
