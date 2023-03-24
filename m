Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 153E66C7F4D
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 15:00:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E47B510E53D;
	Fri, 24 Mar 2023 14:00:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8547D10E52D
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 14:00:29 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-544b959a971so34613717b3.3
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 07:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1679666428;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iF7V5CAbnBV7aSFvkTo8sPOsRSW4aejdNvsX/xVg3+c=;
 b=eeKlozuD/9qQGb9Cx+amJKz7Wz3chF5ViEvj+qR6e9oK9xfD4Rad5Vp8FvCni5EQuv
 5Vexjkz8VLQPkUy6wnpKxp4AUJBdgNsH1BhD9RxGvgyNGdFrFuHBzs86sd/nGAe/RgFW
 T895BhfqdsVH/ozt/SV/f5y1CwlAqRffSpWqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679666428;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iF7V5CAbnBV7aSFvkTo8sPOsRSW4aejdNvsX/xVg3+c=;
 b=ljOkfVIdgU5THvxl/htR08P4MoJmlR2Rkt1HGAMXD4VY5+8I2jnjvvD1vK0l/OuiZv
 vZGm5tbRhh0WgzAzQb8r6htTFfxJxQk3mJ+KxcvOSbYng0+8p3dP7lEbKBHODFNYKR4t
 9XcJBKsdRIb0rhllB6ThXygo1/S1Hn5lnA56AJ1NN9jmSI8A+W5QbWMVSyvoX1D38DyJ
 Df1J6cOSC9SnL3r5CYG7JTdQ6pw7vnHHOhzthAe2+FvmVnzCy3tJOJ2zGuZ3pPBwWDb5
 qmD3Iycnwpr27HeK4IBYtS05zkmckcaQ+Vw8J9UZie+bwK8Zu3ImdLhQYJ/mmZgUT++R
 gwKg==
X-Gm-Message-State: AAQBX9cGy8x0s+dqVA7KEWc+6d0fF1ZjSwlD974L5PyBLsRgCeZkOaAb
 NKmJWvvu7G7Tn2/QxWQwfg/9ffAAsh1TmtnNf+Y=
X-Google-Smtp-Source: AKy350bbtJKz1TKKRf7MhCb89EuUM0OTOAVv29vtCTvWUWnob7laX2dcvg1UvtstsJ6QzPR2fQDkeg==
X-Received: by 2002:a0d:dfc2:0:b0:542:7d1d:7bc1 with SMTP id
 i185-20020a0ddfc2000000b005427d1d7bc1mr2335965ywe.48.1679666428065; 
 Fri, 24 Mar 2023 07:00:28 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com.
 [209.85.219.181]) by smtp.gmail.com with ESMTPSA id
 i1-20020a819101000000b00545a08184cbsm415321ywg.91.2023.03.24.07.00.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Mar 2023 07:00:27 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id e65so2224944ybh.10
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 07:00:27 -0700 (PDT)
X-Received: by 2002:a05:6902:1205:b0:b69:fab9:de60 with SMTP id
 s5-20020a056902120500b00b69fab9de60mr1413085ybu.0.1679666426723; Fri, 24 Mar
 2023 07:00:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230324035909.1727356-1-treapking@chromium.org>
In-Reply-To: <20230324035909.1727356-1-treapking@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 24 Mar 2023 07:00:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WXeVYj2jRHLjD2wWCimb-wA+5QX-UaDhz9NogLGTTARw@mail.gmail.com>
Message-ID: <CAD=FV=WXeVYj2jRHLjD2wWCimb-wA+5QX-UaDhz9NogLGTTARw@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ps8640: Return NULL immediately when EDID
 read fail
To: Pin-yen Lin <treapking@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Mar 23, 2023 at 8:59=E2=80=AFPM Pin-yen Lin <treapking@chromium.org=
> wrote:
>
> drm_edid_read returns NULL on error, so feeding it directly into
> drm_edid_duplicate may lead to NULL pointer dereference. Add a check to
> guard this.
>
> Fixes: 6a17b4d1b52f ("drm/bridge: ps8640: Add a cache for EDID")
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> ---
>
>  drivers/gpu/drm/bridge/parade-ps8640.c | 6 ++++++
>  1 file changed, 6 insertions(+)

Given that the other patch just landed and this is a straightforward
fix, I'm not doing the customary "delay" before landing and I've
pushed this to drm-misc-next:

14aed8ea48e2 drm/bridge: ps8640: Return NULL immediately when EDID read fai=
l

If someone else had extra feedback on this it could always be handled
in a followon patch.

-Doug
