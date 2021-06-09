Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FE03A1201
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 13:05:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1AA46E4A6;
	Wed,  9 Jun 2021 11:05:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53A546E4A6
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 11:05:21 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id e11so31087959ljn.13
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jun 2021 04:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VePCktjSiUwy7zF0X3i1kiD5uKEWitdsZcvT2ZeLJmk=;
 b=lCebyaKzT4o+/UcvZ1XICOmUN7/NHBX1soF6VpaCp/TCvgmk56jULiWBAvNk3i6Loj
 z5wJnqwqEEUANW+u3ygdh5BEaWLy9N8xhJu5CTPM9oqJnYdl30CwZZWEux+H+KOeGDDI
 ZwxIVZKMULaK7VsCRoihYTZ7UtCWnM65PGo6NHphuP4WS/bf4zw9cd5uz3z8exwr9+E+
 E0IPZfYfPD1onxv89/78rZD4LBFvbPBKfdvrtQUSz1tXKO9FIUkI8KHkdhFzDrpC0hZk
 00RJQFVtqyf2oOP2/m8/mM9pqWN6bbJzWLMo5fac27BiLh4WA2TgtZvcRfZEggy9XQoF
 IdAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VePCktjSiUwy7zF0X3i1kiD5uKEWitdsZcvT2ZeLJmk=;
 b=shZ39Am2xuLmM3pUbnWf/R81/OGXaCBCy6MSROukf/8z88ucMjrWjsJ8zWBHvkJg0l
 qEYAxno8YIY44xBpmdOLfk5XjnJxx+dqGiws335eh8gt7ptSfXcooWudwA5Bu87zcMUU
 791PiE+KcXpVROTJzoi/3RQDwWuNm6mDo2RdDaI7JM3ITtHEl3kJA5K2fNR+vDF/Cq7i
 d7Q1RvOuJL3ipj2S2VnKwk9z1nrVPNKqVX17+fKDbliB2mJobPmciGnLFhLUnytd8uwD
 ohk9W5+XX5kUtpmMY754W3LMoPCR+dcYXrLTnQ9xlMK3kHkCaOhhUZe/ImnhGhHmrEsr
 G8Qw==
X-Gm-Message-State: AOAM531SMEAkBudNluBO54c3uvnFoxXd6WP2kwCqr9m+56cgYrG7DeSF
 mxKks5GuzgRclJ/A5RmmCxolLQgE0KO8LcpRCv6hMQ==
X-Google-Smtp-Source: ABdhPJybvThxOzTqKAq2tM0a2YQzhSX2mOBRONdPJcNN5UbQix2w4ogjAjPGxmyqXPR5egn25taCVXJw2O2j5xJPZ+4=
X-Received: by 2002:a05:651c:4c6:: with SMTP id
 e6mr21901557lji.326.1623236719658; 
 Wed, 09 Jun 2021 04:05:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210607170555.4006050-1-dianders@chromium.org>
 <20210607100234.v9.2.Id3c048d22e72a9f90084a543b5b4e3f43bc9ab62@changeid>
In-Reply-To: <20210607100234.v9.2.Id3c048d22e72a9f90084a543b5b4e3f43bc9ab62@changeid>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 9 Jun 2021 13:05:08 +0200
Message-ID: <CACRpkdaitO6VJGfmKchj5hLz43WNA6BR-mn=bo4_EPEh6fyLiw@mail.gmail.com>
Subject: Re: [PATCH v9 02/11] dt-bindings: drm: Introduce the DP AUX bus
To: Douglas Anderson <dianders@chromium.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, MSM <linux-arm-msm@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Steev Klimaszewski <steev@kali.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Stephen Boyd <swboyd@chromium.org>, Thierry Reding <treding@nvidia.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 7, 2021 at 7:06 PM Douglas Anderson <dianders@chromium.org> wrote:

> We want to be able to list an eDP panel as a child of an eDP
> controller node to represent the fact that the panel is connected to
> the controller's DP AUX bus. Though the panel and the controller are
> connected in several ways, the DP AUX bus is the primary control
> interface between the two and thus makes the most sense to model in
> device tree hierarchy.
>
> Listing a panel in this way makes it possible for the panel driver to
> easily get access to the DP AUX bus that it resides on, which can be
> useful to help in auto-detecting the panel and for turning on various
> bits.
>
> NOTE: historically eDP panels were _not_ listed under their controller
> but were listed at the top level of the device tree. This will still
> be supported for backward compatibility (and while DP controller
> drivers are adapted to support the new DT syntax) but should be
> considered deprecated since there is no downside to listing the panel
> under the controller.
>
> For now, the DP AUX bus bindings will only support an eDP panel
> underneath. It's possible it could be extended to allow having a DP
> connector under it in the future.
>
> NOTE: there is no "Example" in this bindings file. Yikes! This avoids
> duplicating the same example lots of places. See users of the aux bus
> (like ti-sn65dsi86) for examples.
>
> The idea for this bus's design was hashed out over IRC [1].
>
> [1] https://people.freedesktop.org/~cbrill/dri-log/?channel=dri-devel&date=2021-05-11
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Rob Herring <robh@kernel.org>

I overall like this approach a lot:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
