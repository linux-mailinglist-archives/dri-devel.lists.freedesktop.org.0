Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3553B2E39
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 13:55:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 094BF6EACF;
	Thu, 24 Jun 2021 11:55:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA9836EACF
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 11:55:20 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 c7-20020a17090ad907b029016faeeab0ccso5742449pjv.4
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 04:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LP5qyGL6lLEV+WmF5VrpGRPefbIi4rgy7WQpZv7IaO4=;
 b=AYSd+eZKzc7DKWW97mjQKERNeQ7LE36c11XsII75USvemV3iujkK0jtEHDOKpeRTME
 o7CPbmPTVimu+dbtH0CI7DQLNhuHxu15fpTL8/ZJ5JQ6L7jOrRmkj48DhLlERDZm42hD
 JOZmTMS5dzLejIPBbIxCtXtfcch2FFJ1Cqdi0XM9RZB+9nZzY2/K7oo2BwwOTSOkKjpz
 sFSypa4gJb9NhjPfHxdtjpvgFr6gEoA2Pv5USaLQ1uwBXB9RnJRBRqFsXPzAzXM7JTXa
 q/q02QfX7TM0Bq46lnrAjrA8qQ9PpZNdooJc2VdmL/4epbhzeheSaUt8/KO/3rj09q1v
 c/EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LP5qyGL6lLEV+WmF5VrpGRPefbIi4rgy7WQpZv7IaO4=;
 b=uSibIInCjxUzimgVPzpGHuSnDviw7zER0dOqFZtC7g+Ew1jXjoIlihrtpkeec8D/iL
 re00pshR742Kuny6L5yw85hruR/j+YFWk37K77dq12XyZn/n32ZUFg8/GpNzs+ZmlsxL
 Q3GXTnBOl7b7Ii+gxca9sEpCJEdDGtuKWcLGNthbN1ukY51dU32Qftc/eM+xslnuTcu9
 iRwpyJKxvlgTUjrXHrGBST63qNdv4gDoIUqImotZbYlV0+BW3yFtiWk+QWlsFpWcJIs5
 LqhzY2B5gO3FPcUr3Ppl/pXc3quDvBvIuvnSO6ANMC3Nkq7nZPcfZghSRBf4zhddVkfl
 BQug==
X-Gm-Message-State: AOAM533nlIcVH8hv3M3sqoWvIURu0hRjzaD98gCFdc6khWLKo+nmA5+S
 QtRxEv0yRN2VHinY4GEP0kRv0Jb4hKX0kNM3phDuZg==
X-Google-Smtp-Source: ABdhPJxgZ/UPqv4NsSX7Nd4Jx7gr38mLU+61cOm7pjjWPZj3YXGftRlNTL2DFm3VR7wx8IUCuDKUU1O5waV96yZlJA4=
X-Received: by 2002:a17:90a:c394:: with SMTP id
 h20mr14562236pjt.222.1624535720537; 
 Thu, 24 Jun 2021 04:55:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210624000304.16281-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20210624000304.16281-1-laurent.pinchart+renesas@ideasonboard.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 24 Jun 2021 13:55:09 +0200
Message-ID: <CAG3jFyvA8E6nBT-RTO6gF-FT1Hh7A6T37FMn5F1WMjGYP10DRA@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] drm/bridge: ti-sn65dsi86: Misc improvements
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, Neil Armstrong <narmstrong@baylibre.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Douglas Anderson <dianders@chromium.org>, linux-renesas-soc@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied to drm-misc-next

https://cgit.freedesktop.org/drm/drm-misc/commit/?id=0715786771f24190b3f2dcdcaf2af263c1ef46eb

On Thu, 24 Jun 2021 at 02:03, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
>
> Hello,
>
> This patch series contains miscellaneous improvements to the
> ti-sn65dsi86 driver, and prepares it for optional connector creation and
> DisplayPort (non-eDP) support.
>
> The patches have been posted previously as part of the "[RFC PATCH
> 00/11] drm/bridge: ti-sn65dsi86: Support DisplayPort mode" series. The
> last four patches have been left out as discussions are ongoing, this
> series focusses on the base work that has mostly been approved during
> the review of the RFC.
>
> The code has been rebased on top of the latest drm-misc-next, and while
> some changes to the ti-sn65dsi86 driver made conflict resolution
> painful in patch 5/6, there was no big functional conflict.
>
> Laurent Pinchart (6):
>   dt-bindings: drm/bridge: ti-sn65dsi8: Make enable GPIO optional
>   drm/bridge: ti-sn65dsi86: Make enable GPIO optional
>   drm/bridge: ti-sn65dsi86: Use bitmask to store valid rates
>   drm/bridge: ti-sn65dsi86: Wrap panel with panel-bridge
>   drm/bridge: ti-sn65dsi86: Group code in sections
>   drm/bridge: ti-sn65dsi86: Split connector creation to a function
>
>  .../bindings/display/bridge/ti,sn65dsi86.yaml |   1 -
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c         | 703 ++++++++++--------
>  2 files changed, 374 insertions(+), 330 deletions(-)
>
>
> base-commit: 7601d53c2c49e3a7e8150e8cf332b3c17943f75a
> --
> Regards,
>
> Laurent Pinchart
>
