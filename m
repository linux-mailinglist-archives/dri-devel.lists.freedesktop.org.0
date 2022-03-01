Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4401B4C8C3A
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 14:04:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02AA510E5B4;
	Tue,  1 Mar 2022 13:04:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAAE610E5B4
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 13:04:47 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id 139so14389975pge.1
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Mar 2022 05:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bBkJiLuPHjOc9NWEYiRCYWyb3Lk5w/JeF/xlR5gs4hs=;
 b=Xc9NL1d+//BooJG2pml3jrtqXm6+Y0L6ReYIipFBYiAymzfd3Ro0UqCIsGGv7pzmzs
 xmfs7tpUkyH4huXwN7+tUwnFGMU01DX1figlNAeGeLriBYIUcG66wEYEA0KsonhyYqZ8
 bHQBGhQrQpOg6xou2P8/xGjovxtgl+Xaqbxc+YWjthRy5q584R+01bTRHZkGvaKMfrkm
 1LdB2u7uyU0teOYEp3os+zMzGQbKRoOJsCGejqjuF06p8wNAxQGgCgeU7rfE2x2/p+6l
 LPMD2gm3iABuMy6uDufsjPLtW6V6kjYojC9fWN8kKLk2/O79llXkR2U4BBPdeSWdx6Hq
 F/xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bBkJiLuPHjOc9NWEYiRCYWyb3Lk5w/JeF/xlR5gs4hs=;
 b=u2vjTDlcbTjV/YtdGjDCmZqXV6p1fRme/o5In/OaUHR+MStE6yBSwn1vK3D5WoOxiR
 V+GDuHFE11Pbh3wu21UQF0wCJna+NqOPe7CnptGZAH4jMbMs65XWXjKZ2qjB63kH7rGN
 8bXkoID6pWRRvIjTiaTH38lb5FWOhb+3VSdRs2DLR3G+NMOxTHeu4eXQXBvxsIjaey/c
 vO4pou/prQr2i3aV0L8mZf+kkGwopTI46q7+18wCgFVvVcEfps0tU6aqO+BctM7ii0WI
 g0qBiYgED159DCbT3PwkFbdOjmessRroO8UtdMwcV3GRGp/yuCVJVoMW8c5KPdz/o4IU
 RrAQ==
X-Gm-Message-State: AOAM533aVsoDRsJO8jDuT+cNIubvoXcge7rJs6vFVLtRFaOWsfd2kb+W
 JLiZBHLNt+Gwr12dbkJSz/qYIwpJ1X1cGNziA/1ODQ==
X-Google-Smtp-Source: ABdhPJxTmBed6kFC71ml0AX/2OYElQqn2M8Fyn2ERareq2KhsmTlJ76U//wIcIqT2V7P9FR+3qat6BDCYU/HtN0UeOI=
X-Received: by 2002:a05:6a00:889:b0:4e0:dcc3:5e06 with SMTP id
 q9-20020a056a00088900b004e0dcc35e06mr27213845pfj.29.1646139887560; Tue, 01
 Mar 2022 05:04:47 -0800 (PST)
MIME-Version: 1.0
References: <20220221074224.12920-1-jose.exposito89@gmail.com>
 <20220221085643.b7klu7heomv6rubv@houat>
In-Reply-To: <20220221085643.b7klu7heomv6rubv@houat>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 1 Mar 2022 14:04:36 +0100
Message-ID: <CAG3jFysW1jFPr7v0=tNANRoMKrqy6dkWBmp7Y=-eEsyKeCNkbA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: chipone-icn6211: switch to
 devm_drm_of_get_bridge
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: jonas@kwiboo.se, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 narmstrong@baylibre.com, lgirdwood@gmail.com, jernej.skrabec@gmail.com,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 jagan@amarulasolutions.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied to drm-misc-next.
