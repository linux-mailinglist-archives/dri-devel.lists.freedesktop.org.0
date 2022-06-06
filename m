Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FBD53EE4F
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 21:06:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30D1110E479;
	Mon,  6 Jun 2022 19:06:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D31FC10E170
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 19:06:30 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-fb6b4da1dfso2315407fac.4
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jun 2022 12:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=6MJn5zOFXH+nWMLAd2/1FRGMn9RFPXr7yGq/vNuS/UQ=;
 b=RrDmHLneHhzEqgs+avpAIqmSmppTbvcPYikg5GtlhI4zj6YLM5PeQdvjIKm2LPaPVk
 siI6Gc87siSylXHmHcyi1wSxGVzUSl5n1RmgILW+hi2JodCl4iV/B+ESsfafQBHWTdL1
 2phByD2xPheRa7+S+FDGacySTsKu0YaYz1B5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=6MJn5zOFXH+nWMLAd2/1FRGMn9RFPXr7yGq/vNuS/UQ=;
 b=YI32DrTPAmffcCDq9oxSDndBFGDCbJ3q3Esvfn1C+kNUyX9ts+9QrreFgC7KYpdY9e
 hNGGnrdtNNkWyUZjEKxQeRxdhjevnok+O4Mh/aS0O9aCsEDAgAG41h2675PkiOAY2/7P
 QaaIm+x87HlQkijj5b6WJ58b+Pb9EkUhD1EC8QSWvFRvSx1vm0u8ZssdfNBOfThAyX5J
 zoTB7Y/uoJ5kv/7EllF08/1pKzpnrcLsboCHlJp4y/4WGjgi5JBKQkEa6+vhFZ0rtZ3f
 ELbuCzRz5lterHoR8+G7EieVW7q4CJ0S5BcsLYgj/loJXaLqBBCxAhU0aPZLEVVhCbpb
 H+xw==
X-Gm-Message-State: AOAM531Zm1319KTMPftuh50XXQHspVVCScGRFw4lQdVwD9fQZ1vEmZNc
 e6e3bVBrafXuZGfTmPnkdvNWQ3osL2D/VidvEvtLSw==
X-Google-Smtp-Source: ABdhPJwZghG/x2b/qz0erem1Frm0KKmZ2Jh/gPhQA7lPaNFJWoTR0HNboBvnJkV/j1y3j4iPrsscIBz2ag23cFHg/Io=
X-Received: by 2002:a05:6870:558e:b0:e1:db7c:26aa with SMTP id
 n14-20020a056870558e00b000e1db7c26aamr14654864oao.63.1654542390129; Mon, 06
 Jun 2022 12:06:30 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 6 Jun 2022 12:06:29 -0700
MIME-Version: 1.0
In-Reply-To: <20220606152431.1889185-2-hsinyi@chromium.org>
References: <20220606152431.1889185-1-hsinyi@chromium.org>
 <20220606152431.1889185-2-hsinyi@chromium.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 6 Jun 2022 12:06:29 -0700
Message-ID: <CAE-0n52mzczUdtwUgfdNOC_V7kBGhzFWHRT=QHDoH4kN+yCMGA@mail.gmail.com>
Subject: Re: [PATCH v4 1/8] drm/panel: Add an API drm_panel_get_orientation()
 to return panel orientation
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 David Airlie <airlied@linux.ie>, Douglas Anderson <dianders@chromium.org>,
 linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Hsin-Yi Wang (2022-06-06 08:24:24)
> diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> index f634371c717a..e12056cfeca8 100644
> --- a/drivers/gpu/drm/drm_panel.c
> +++ b/drivers/gpu/drm/drm_panel.c
> @@ -223,6 +223,15 @@ int drm_panel_get_modes(struct drm_panel *panel,
>  }
>  EXPORT_SYMBOL(drm_panel_get_modes);
>
> +enum drm_panel_orientation drm_panel_get_orientation(struct drm_panel *panel)

Should 'panel' be marked const to indicate that it can't be modified?

> +{
> +       if (panel && panel->funcs && panel->funcs->get_orientation)
> +               return panel->funcs->get_orientation(panel);
