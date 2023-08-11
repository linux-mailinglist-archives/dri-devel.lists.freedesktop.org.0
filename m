Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 296FA779090
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 15:15:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26C9D10E0D2;
	Fri, 11 Aug 2023 13:15:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2E9410E0D2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 13:15:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 10C3B6576A
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 13:15:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A16BC433C8
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 13:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691759746;
 bh=Q0V13OvTHe22/UjIUzwrCyQ9TTmZy8aejdY20cqAG8U=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=l/MFQNi10259REPnnmXhsqSwMU/qesqqzavqh/Lwge8kk8X6NeuYaKDZ7CObdA/bt
 2t+uXedSVWSuiqum9f5cu7CtrkX5XsyJOeEYApBAi095lHz83YnJbLxaOluVLsrIt/
 TfdCph7Rx1XiV1iEeYShZdeeOjMJO9BaywnurXerHDPNJJ0a9xl48LyTTCYVSaLRPr
 Q5TNgttJyi/LaSy6t1Kmk63UWKNVc7D4A6vBvy094SDbJDxn5Oaf2Wa+5ry/fuSWQV
 B5SAmZHZEFCyG7yP+uxjEapsyOkSzugClyCeL1NAPjzCh7m44t515UX32u8OlA1PQZ
 ES/sqsalLarJQ==
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-563dfffea87so1509011a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 06:15:46 -0700 (PDT)
X-Gm-Message-State: AOJu0YxHZRdn3nAYcAxdznMDlCqo7KW3suXeN4FJkoLwsJkX8pGl/WJb
 bgb72wDm0eZuequvL6qvbVQ6/dTJKdJzTr+J/rvssQ==
X-Google-Smtp-Source: AGHT+IFsx8ruCT10pi0Uvkim3EB925uy1uvWlf2H32E00/+oatvZRAK9RYhOqodjK7V6u3DS6y4x+dP3yrMDsbE7JQs=
X-Received: by 2002:a17:90a:fd89:b0:268:1e51:3496 with SMTP id
 cx9-20020a17090afd8900b002681e513496mr1504264pjb.21.1691759746112; Fri, 11
 Aug 2023 06:15:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230810095923.123388-1-krzysztof.kozlowski@linaro.org>
 <20230810101203.GB402@pendragon.ideasonboard.com>
In-Reply-To: <20230810101203.GB402@pendragon.ideasonboard.com>
From: Robert Foss <rfoss@kernel.org>
Date: Fri, 11 Aug 2023 15:15:35 +0200
X-Gmail-Original-Message-ID: <CAN6tsi4EUutDP1Dsq5CWEyPMe4n7yG1QGDeG1HM3DL+9+qrXmg@mail.gmail.com>
Message-ID: <CAN6tsi4EUutDP1Dsq5CWEyPMe4n7yG1QGDeG1HM3DL+9+qrXmg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/bridge: adv7511: fix Wvoid-pointer-to-enum-cast
 warning
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Andi Shyti <andi.shyti@kernel.org>, lima@lists.freedesktop.org,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 10, 2023 at 12:12=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Krzysztof,
>
> Thank you for the patch.
>
> On Thu, Aug 10, 2023 at 11:59:22AM +0200, Krzysztof Kozlowski wrote:
> > 'type' is an enum, thus cast of pointer on 64-bit compile test with W=
=3D1
> > causes:
> >
> >   adv7511_drv.c:1214:19: error: cast to smaller integer type 'enum adv7=
511_type' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]
> >
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> > ---
> >  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu=
/drm/bridge/adv7511/adv7511_drv.c
> > index 2611afd2c1c1..0e284f379602 100644
> > --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > @@ -1211,7 +1211,7 @@ static int adv7511_probe(struct i2c_client *i2c)
> >       adv7511->status =3D connector_status_disconnected;
> >
> >       if (dev->of_node)
> > -             adv7511->type =3D (enum adv7511_type)of_device_get_match_=
data(dev);
> > +             adv7511->type =3D (uintptr_t)of_device_get_match_data(dev=
);
> >       else
> >               adv7511->type =3D id->driver_data;
> >
>
> --
> Regards,
>
> Laurent Pinchart
>

Ack for drm/bridge part.

Acked-by: Robert Foss <rfoss@kernel.org>
