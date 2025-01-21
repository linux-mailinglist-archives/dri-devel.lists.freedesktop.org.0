Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 474ACA17CB3
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 12:10:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B4C10E565;
	Tue, 21 Jan 2025 11:10:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com
 [209.85.221.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99BFC10E565;
 Tue, 21 Jan 2025 11:10:41 +0000 (UTC)
Received: by mail-vk1-f177.google.com with SMTP id
 71dfb90a1353d-518954032b2so1755315e0c.0; 
 Tue, 21 Jan 2025 03:10:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737457838; x=1738062638;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VXUdfGyq4c5FX1gamn0gc9cnARR4WPDnFMac/C/Y36A=;
 b=YoipckAYQXGAAXRqk0sNlyCZVeu5lhOkLN0wHLzL+8ytpVfP4BAV696sJfyydYhP48
 CmHzWCCg/CK6Nx8LQBLBkJxueT6DTaz6vPzxxoLKbEvJ+9acQ0zI9pWWeQ1BGaNhlL+X
 8qQbrDi4dSZJLqBV3R5+qGAR16mbtmqJJURAdZYRU02wX5rYWdHA/tFu9xiJmErNa4TB
 DEVvUA5AS0+RfRJ0Eydh3pmcnsCo2WhRh9SHvogTwQMPoCACc9prAIpJpe6y8Dpz+xgU
 9fD87VzkahfFk5jlZpP7RED7NuuQwHU2uw8Xemg4cdIrK5qOTOgQoS618ru4IR9dIpeQ
 PANw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4Km1E6/0TpM5dpGMDvTiob7birQi6qJ2FR1LsRBPZKigMqc1j2NpqkVtX2SswqXnEQnafsCH24IN8GHc=@lists.freedesktop.org,
 AJvYcCUctvQ/2/Mji52+tNiS2JKqK+Yxzue2x6XNO1jxdK0JN9oVoKJ3/A7zQ9+cGJD5ab0QxJG20etuQd4=@lists.freedesktop.org,
 AJvYcCV5TBEo7KOuEOZ888T7oltefJTkOdcyv52kQJeCwcft+XwQjXWMUWbtbt1vJPJ+4OfJ8iTMPvcs@lists.freedesktop.org,
 AJvYcCW/676Vi5AhCacatstiC1+m0fNnXCPQOz0ZCZLaeGFz1sla4movmmDarO/THpZnGQwmCLe9Y8pjtVFX@lists.freedesktop.org,
 AJvYcCW0O0DUHhFSlxw1/T5KWXee3z/74TCb32X4qkQByb/wKvr2tB/lFRBstI9mlPdZff5f23YaON3kpw==@lists.freedesktop.org,
 AJvYcCWC5xler1UuVUs3cQ8axPz3JV6BU3OGVUMG5ZdN4YmbwbwSgis3MWV5NvE+c+WJMFLKOsU+AJlX7s1w@lists.freedesktop.org,
 AJvYcCX5K+5/jwp6JcoKyIz2RamquCGEBhPZ4ut5EDoZOnNPwkUQ0eJibzF2tg6hoXksJI7+oZKmEGI0G/sG@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzFcMy3QZOEY0iEWJgxRrtYm2YdeY+XCb1HsLW+VLBphYcRcorN
 IEeYkWbYDkRn1UwlcswC4XtyoB5IyDjW/MjqYJM639zAKusAta+0VCmty3+L
X-Gm-Gg: ASbGncui/jpMAkIh/JoBXcAaHBqptSBLMkTI+niCxApAPtNRKrfZyObjCLH+RMWCeqQ
 oWzBlD4UuooHBbX7gH+UVDJ/cKUCa0PmNhU6aelFJnoU9PPCzgfnc9qtZvriTwxiHToJxWrmjeJ
 cThJaXrJNjNiT+7bdy1XJX78RuIus9G9NuU5Avb1HlMC2GdF/BWgJPNhUx/3Fj0/bhPc81PFQQC
 me/mr0XCLHMunpbTSoitMba+gKLyuIeKab5lU1HM+EJdlKOWOu3pIGARq2P7TnRKyE3B1bBElPH
 csbMqnVsyOYeGy9X+IiPJhr5U+K5oqnQ
X-Google-Smtp-Source: AGHT+IGF0hAHxJQYrJDDPareZjAFA7WZZKOKt0ACI+x71cHFBstQigx+7w+Dht2fho0KeW8c8AcWVA==
X-Received: by 2002:a05:6122:9008:b0:51b:8949:c996 with SMTP id
 71dfb90a1353d-51d5b351af7mr12276619e0c.9.1737457838223; 
 Tue, 21 Jan 2025 03:10:38 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com.
 [209.85.222.45]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-51cf55a0c57sm1734306e0c.17.2025.01.21.03.10.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jan 2025 03:10:37 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id
 a1e0cc1a2514c-85c529e72bcso911513241.0; 
 Tue, 21 Jan 2025 03:10:37 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUDW/cWjgX2wW//NfqYmjHKH9aBZgk5savOAZq6w4aPnjtHFS8+IsEh5U4z2lAACa36fZxuSOY1tIpf@lists.freedesktop.org,
 AJvYcCVFkc8AtkDQrh2meb8lqW8lRU4dZBe+Dtqk/yUOSXHnggAk6fiiOkPiug+o4nDvE0cPCnTRj/9Ped8=@lists.freedesktop.org,
 AJvYcCWHaUbjl4MknBfJZC3UeDkWQXwzKY0O15k1u7hCTjSvElGs0BsLCrDyRqFWeumQXjRg7w4BNbBVoVy2@lists.freedesktop.org,
 AJvYcCWaM2ExOoPf0vryAAdFdiQU3ayjeTlvWAIIwrm3un4TlWXa44lpKh+6/PvkKj0juKLPs8/33WWc@lists.freedesktop.org,
 AJvYcCX5T0D4/sfdfFeUx0QaJ6RnWCymTTFDrQtxUf+VWEJVP/eLwCZRWxy+9qUNClZDR1O6gpve7pVISg==@lists.freedesktop.org,
 AJvYcCXck6pBFBf10szGPctnQk0c+2IPHqyxHcv7vJtE5B8VVYdCZY+eewrX30rdTkgM9vlrXYppvuZoXF5XkRQ=@lists.freedesktop.org,
 AJvYcCXzMViU1bYzYH749xbu7Ave/VSTNpMHCLjM8Ghx0e3hdA1d+zzLDGYu3rtTRkgNFTDIeGqc+cLFzTq9@lists.freedesktop.org
X-Received: by 2002:a05:6102:1625:b0:4b2:ad50:a99c with SMTP id
 ada2fe7eead31-4b690b86c0fmr12441756137.2.1737457837255; Tue, 21 Jan 2025
 03:10:37 -0800 (PST)
MIME-Version: 1.0
References: <20241214-drm-connector-mode-valid-const-v2-0-4f9498a4c822@linaro.org>
 <173624946815.1500596.321177900833598022.b4-ty@linaro.org>
 <CAMuHMdVwcaY2Fgpf7GYhBrE5B+AEg=v0BH4OjMXgnp=wqjxmKg@mail.gmail.com>
 <CAA8EJpos0HQpr9P4XRkto0Jy+Anf1xEH2xhEU8wtCyUQd+XwMg@mail.gmail.com>
In-Reply-To: <CAA8EJpos0HQpr9P4XRkto0Jy+Anf1xEH2xhEU8wtCyUQd+XwMg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Jan 2025 12:10:25 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW-9F9aypY_XeU3y=dn3AAxjFrZO+H+=hbMF7nGrTLAQQ@mail.gmail.com>
X-Gm-Features: AbW1kvZBx44easXhFOatWXKdq1_QMeY-mb30d2zlnMs06wKR4MmvmnSlyypmVlE
Message-ID: <CAMuHMdW-9F9aypY_XeU3y=dn3AAxjFrZO+H+=hbMF7nGrTLAQQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] drm/connector: make mode_valid() callback accept
 const mode pointer
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@redhat.com>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Peter Senna Tschudin <peter.senna@gmail.com>, Ian Ray <ian.ray@ge.com>, 
 Martyn Welch <martyn.welch@collabora.co.uk>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Sandy Huang <hjc@rock-chips.com>, 
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>, 
 Samuel Holland <samuel@sholland.org>, Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>, Zack Rusin <zack.rusin@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Jani Nikula <jani.nikula@intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>
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

Hi Dmitry,

CC sfr

On Tue, Jan 21, 2025 at 11:44=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
> On Tue, 21 Jan 2025 at 11:13, Geert Uytterhoeven <geert@linux-m68k.org> w=
rote:
> > On Tue, Jan 7, 2025 at 12:31=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > > On Sat, 14 Dec 2024 15:37:04 +0200, Dmitry Baryshkov wrote:
> > > > While working on the generic mode_valid() implementation for the HD=
MI
> > > > Connector framework I noticed that unlike other DRM objects
> > > > drm_connector accepts non-const pointer to struct drm_display_mode,
> > > > while obviously mode_valid() isn't expected to modify the argument.
> > > >
> > > > Mass-change the DRM framework code to pass const argument to that
> > > > callback.
> > > >
> > > > [...]
> > >
> > > Applied to drm-misc-next, thanks!
> > >
> > > [1/5] drm/encoder_slave: make mode_valid accept const struct drm_disp=
lay_mode
> > >       commit: 7a5cd45fab0a2671aa4ea6d8fb80cea268387176
> > > [2/5] drm/amdgpu: don't change mode in amdgpu_dm_connector_mode_valid=
()
> > >       commit: b255ce4388e09f14311e7912d0ccd45a14a08d66
> > > [3/5] drm/sti: hda: pass const struct drm_display_mode* to hda_get_mo=
de_idx()
> > >       commit: 5f011b442006ccb29044263df10843de80fc0b14
> > > [4/5] drm/connector: make mode_valid_ctx take a const struct drm_disp=
lay_mode
> > >       commit: 66df9debcb29d14802912ed79a9cf9ba721b51a4
> > > [5/5] drm/connector: make mode_valid take a const struct drm_display_=
mode
> > >       commit: 26d6fd81916e62d2b0568d9756e5f9c33f0f9b7a
> >
> > I cannot find these in drm-misc or drm-next, but they are in drm-tip?
>
> These are in drm-misc/drm-misc-next, the commit IDs are a part of the
> Git history.
>
> > The last one due to commit 2bdc721917cf141f ("Merge remote-tracking
> > branch 'drm-misc/drm-misc-next' into drm-tip").
> >
> > What am I missing?
> > Thanks!
>
> It might be some kind of misinteraction between drm-misc-next vs
> drm-misc-next-fixes vs merge window. Let me recheck dim rebuild-tip.

I indeed see the commit in
https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/include=
/drm/drm_modeset_helper_vtables.h?ref_type=3Dheads

[diving deeper]

So I missed the change from the for-linux-next to the drm-misc-next
branch.  Hence I fetched only the former, and was using a stale
version of the latter.

Apparently Stephen is also using the old branches for linux-next:

    drm-misc-fixes git
https://gitlab.freedesktop.org/drm/misc/kernel.git#for-linux-next-fixes
    drm-misc git
https://gitlab.freedesktop.org/drm/misc/kernel.git#for-linux-next

I believe the latter should be drm-misc-next.
Should the former be drm-misc-fixes or drm-misc-next-fixes? Or both?

Thanks!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
