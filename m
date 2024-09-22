Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AAC097E201
	for <lists+dri-devel@lfdr.de>; Sun, 22 Sep 2024 16:34:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAC7710E00A;
	Sun, 22 Sep 2024 14:34:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eI/GBvGY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8952E10E00A
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Sep 2024 14:34:01 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-6c49c9018ebso32778177b3.3
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Sep 2024 07:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727015640; x=1727620440; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yHeGraYA3dGaR0TNSrhM0uA2RkFxJIHWUg3p/EO2nAk=;
 b=eI/GBvGYk5xWsQwnJLQ/e3Ui7XwQJz6eVa25giRzOc4id3CPPW782dzilg3UOr8UU5
 YT8wK9F+2Ksm6IsAfQHtxyZm3JXjZsidVodpeq8Nz4yDNk3cG0UELmpQkbhQVapVD6MD
 Aazr7LnANk6cZE4OW7cvFLhpl60Ueoz0X8vRYR4Fh/i4mAlaCUnHUhiyyihp1auCrAa/
 5vUmSq2nWY02zgM99cPzmiOO82PZvQjNzGVlHHpJAIZ7F4QyJ+E10R8jP92dBicXvSod
 0eB4P/0uIyZpf+7lV+LLZjC7ds+JBNmfm4T+uoGeeTvM6dtyaiPo+4USIOYJEgZzf3HG
 APgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727015640; x=1727620440;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yHeGraYA3dGaR0TNSrhM0uA2RkFxJIHWUg3p/EO2nAk=;
 b=kaJtJWnZkjIlU7i4MOo3DH8IhuOJbG49e+vtC/25qs4ge+epyZ/KHswU+ojos0RSBx
 EbiyUFac5f02yTwtIbK7kfcKLDTQ7Xz5K649D6R0QZ+u7aj/joweA7BLKDOlfO2DGEIw
 P2n7hY4qcFZge/XhqnCH7WUpJpq5zLnuv57ES/J2EMIexZVXZ4ib5jkSPmiCpmQIaIiE
 lnl6U+SFrVkeQTpsLCxBM8SKLtkOIR1y8dwsmRwaN6PyqAP/W1Mbug4Px/j/KSTWTJvZ
 Doa8XxcUcIWmV6Y/73N1yi3joylFrXW6oNo1Dy+3otPdEzkmn4w9lEGsZANPBbwZf2sf
 OB8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcRrB08Cj4T4L02JIQBEsfAn+cjTi71sB2Yx70HGxWdqmLgE2TPY/IkzCLMvTh9c90xDqwJSm/yZY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5WV7G0/kLLJOpZqTHO6M7ae5C7qoXMgJxip1ZV7LKwrYxk8AP
 xenUZX+jsEyUyNcb9XqwfpfUdau0EoxkzlQpvHDhZ923POMfZxdif2u9HC+tJ+Qg9HAWYsHhkni
 udqtWjmu5mWz48uKvlmQWdDgGHubno2SMrTASXQ==
X-Google-Smtp-Source: AGHT+IHKzXLaRDGAOOJlN5ccsLLxF4TSLQsyK9kPJHcFIpOzEJDTsH5QrInR8hKs28oj8KV/TnrBU1qVlNXlaSk0TjE=
X-Received: by 2002:a05:690c:1b:b0:6c9:9341:1ce1 with SMTP id
 00721157ae682-6dff2903a2cmr59752777b3.32.1727015640248; Sun, 22 Sep 2024
 07:34:00 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1726492131.git.tjakobi@math.uni-bielefeld.de>
 <2b35545b77a9fd8c9699b751ca282226dcecb1dd.1726492131.git.tjakobi@math.uni-bielefeld.de>
 <gnllphvuffajfbh3aczda5z7t3ytjexf5a6wuuzsz6pla6e2kz@m564uc2ogn4q>
 <a90d08d5-265a-4ba2-99f9-68fa18960b27@redhat.com>
In-Reply-To: <a90d08d5-265a-4ba2-99f9-68fa18960b27@redhat.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 22 Sep 2024 16:33:50 +0200
Message-ID: <CAA8EJprMy7H+-z2+OAC_F9m-3GQe28oWKJJ5GYFj61ss7gYBuQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm: panel-orientation-quirks: Add quirk for AYA NEO
 2 model
To: Hans de Goede <hdegoede@redhat.com>
Cc: tjakobi@math.uni-bielefeld.de, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 =?UTF-8?Q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>, 
 "Derek J . Clark" <derekjohn.clark@gmail.com>,
 Denis Benato <benato.denis96@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 22 Sept 2024 at 13:11, Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 21-Sep-24 10:02 PM, Dmitry Baryshkov wrote:
> > On Mon, Sep 16, 2024 at 03:18:51PM GMT, tjakobi@math.uni-bielefeld.de w=
rote:
> >> From: Joaqu=C3=ADn Ignacio Aramend=C3=ADa <samsagax@gmail.com>
> >>
> >> Add quirk orientation for AYA NEO 2. The name appears without spaces i=
n
> >> DMI strings. That made it difficult to reuse the 2021 match. Also the
> >> display is larger in resolution.
> >>
> >> Tested by the JELOS team that has been patching their own kernel for a
> >> while now and confirmed by users in the AYA NEO and ChimeraOS discord
> >> servers.
> >>
> >> Signed-off-by: Joaqu=C3=ADn Ignacio Aramend=C3=ADa <samsagax@gmail.com=
>
> >> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> >> ---
> >>  drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
> >>  1 file changed, 6 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/=
gpu/drm/drm_panel_orientation_quirks.c
> >> index 2166208a961d..3044927c0c5c 100644
> >> --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> >> +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> >> @@ -184,6 +184,12 @@ static const struct dmi_system_id orientation_dat=
a[] =3D {
> >>                DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "T103HAF"),
> >>              },
> >>              .driver_data =3D (void *)&lcd800x1280_rightside_up,
> >> +    }, {    /* AYA NEO AYANEO 2 */
> >> +            .matches =3D {
> >> +              DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AYANEO"),
> >> +              DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "AYANEO 2"),
> >> +            },
> >> +            .driver_data =3D (void *)&lcd1200x1920_rightside_up,
> >
> > I thought that AYANEO should come after AYADEVICE, but the array doesn'=
t
> > seem really sorted
>
> It is sorted but it is sorted by the Vendor - Model in the comments,
> not by the DMI strings since sometimes those are e.g. "SYS_VENDOR",
> "Default String" and stuff like that.

Ah, I didn't notice that.  I think it's still not fully sorted (e.g.
KUN comes after NEXT), but that's probably fine.

>
> The entire series looks good to me:
>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>
> for the series.
>
> > Thus:
> >
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> > If I hear no objections and if noone beats me, I'll apply the series
> > within few days.
>
> I'm currently travelling so if you can apply this series
> to drm-misc-fixes that would be great.

Done.

>
> Regards,
>
> Hans
>
>
> >
> >
> >>      }, {    /* AYA NEO 2021 */
> >>              .matches =3D {
> >>                DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AYADEVICE"),
> >> --
> >> 2.44.2
> >>
> >
>


--=20
With best wishes
Dmitry
