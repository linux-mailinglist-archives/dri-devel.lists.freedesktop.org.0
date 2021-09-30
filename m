Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD1641DDF0
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 17:47:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9A756E431;
	Thu, 30 Sep 2021 15:47:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DDF46E431
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 15:47:25 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id h20so7338814ilj.13
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 08:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ukJ8UdRAzd7VtHSG6snSf8AUrJFYkThG12qKfJkt93s=;
 b=KHQ+XS/wHzQMF8hxQILBr6I5RH0LLHNIqRTK46hcDUprihlf/AgVCh/Sw5Fb+4CSxZ
 hhg3Fb7YS//HumuLCDxYnrfLttqXQI3nlysMibZw0+9a86UkLtqA1eLwB4vbt5H5Jak3
 2FSP4zTBTlGarUuj+EE8Vy6oq7mI3TPGsXyNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ukJ8UdRAzd7VtHSG6snSf8AUrJFYkThG12qKfJkt93s=;
 b=Yw51rC7GFBNJq3x9gj9jf/zVU6UZ69uvDsmyqyHlPiBb7RkRoYBQma+Zxixlf5Z5yQ
 1E8PXukphsAxF7B5rjx4hv2+bYdq7D4qeT9yoJodYaljVSjfslLfnqJ7LOyPo7ODbbth
 vzpn/iqxX8csi3G0vQLeLLtyS8fm7EsrVbet6mofFtnAUYX9DPjukd0S0E7jdNakAwYq
 wu9f4sWgTvRn5LuGzTZt5zbA6ZoivwNqqsuO29DrhZcgGtg7stRlXravyHgcfYhuMB7V
 fH06rnMip66kXHPbmggpMuo4Pe7TULtu5MQpccHAOuXY5aLVOfausR8Ar4rMolGZybLf
 ddSA==
X-Gm-Message-State: AOAM533cVJyU1pfifme3qudeAS4LDU+H6Z3ezUigH6Pn/ZNO0CMBFFgy
 ymgzmacn8K4DAo4TZ/a2yuURCxzRTKoksA==
X-Google-Smtp-Source: ABdhPJx7p51ywmpp0bAkvpQI0f0UvGqlMHrzcvmuydXKqceBo9DMKx7pkzCdVjBQdyFr0WDj9qqjbA==
X-Received: by 2002:a92:c012:: with SMTP id q18mr4789462ild.84.1633016844542; 
 Thu, 30 Sep 2021 08:47:24 -0700 (PDT)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com.
 [209.85.166.172])
 by smtp.gmail.com with ESMTPSA id a12sm1907273ilb.66.2021.09.30.08.47.23
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Sep 2021 08:47:23 -0700 (PDT)
Received: by mail-il1-f172.google.com with SMTP id j15so7380343ila.6
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 08:47:23 -0700 (PDT)
X-Received: by 2002:a05:6e02:1bad:: with SMTP id
 n13mr4681374ili.142.1633016843140; 
 Thu, 30 Sep 2021 08:47:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210929173343.v2.1.Ib7e63ae17e827ce0636a09d5dec9796043e4f80a@changeid>
 <20210929173343.v2.2.I6050ba184b24d887e92692a72ee3054d643d6091@changeid>
In-Reply-To: <20210929173343.v2.2.I6050ba184b24d887e92692a72ee3054d643d6091@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Sep 2021 08:47:11 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V2gf6jJuLaX+4fDjJ0QKmdZgD-HvL+OJ-NxyY5WOna2A@mail.gmail.com>
Message-ID: <CAD=FV=V2gf6jJuLaX+4fDjJ0QKmdZgD-HvL+OJ-NxyY5WOna2A@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: drm/bridge: ps8640: Add aux-bus child
To: Philip Chen <philipchen@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>, 
 Balletbo i Serra <enric.balletbo@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Lee Jones <lee.jones@linaro.org>, Nicolas Boichat <drinkcat@chromium.org>, 
 Rob Herring <robh+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Sam Ravnborg <sam@ravnborg.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>
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

On Wed, Sep 29, 2021 at 5:35 PM Philip Chen <philipchen@chromium.org> wrote:
>
> dp-aux-bus.yaml says we can list an eDP panel as a child of
> an eDP controller node to represent the fact that the panel
> is connected to the controller's DP AUX bus.
>
> Let's add it to the ps8640 bindings.
>
> Signed-off-by: Philip Chen <philipchen@chromium.org>
> ---
>
> (no changes since v1)
>
>  .../bindings/display/bridge/ps8640.yaml       | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
