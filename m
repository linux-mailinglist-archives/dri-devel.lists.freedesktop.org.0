Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0411BA179E6
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 10:13:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 361FE10E50B;
	Tue, 21 Jan 2025 09:13:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D89C10E507;
 Tue, 21 Jan 2025 09:13:04 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-7b6ef047e9bso496089085a.1; 
 Tue, 21 Jan 2025 01:13:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737450783; x=1738055583;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h0F66BpcncnDZq8+yac2PqIUMY5KsLdGVzSelKc0x5s=;
 b=Cc+l1wjin+suCCFHL+z+I1gEu0IuCge7UB11MxXgUMoBBzF0zYjrdF9O+9hwU+uhCd
 C3oLQOgFsYzfmcDTyhEBci7gOL7gdf2XtTq4Vmhr+l2Ya6EsFYDZVZ4kZNv5yA6NrIVp
 nOP0CF1qwkM/FyH3BgsStpD3Wxqld+3EgAvXutLLF44Uawx4LPDrRWVKfH/pNmEffN+w
 wJvM3z5Jmu+bpjA3msJOuMLdr3R73oTz+65oOjkBymXVjM7ODTqWTi4W5G/M32be5yPp
 TMya6Rh2sYxvxCtybr9Bd7hkVUfEOLRGQ5f/ZE4dZzSdZodxIb+oXun7dMO+8UcykMSv
 uijQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFX15iyT0BFJMUKofn0XY8F8Nf60CUyfNKoG6RfVKP3PHygVH5dsFp2E/9ogEJxnH0F6RlN9lhZ5ub@lists.freedesktop.org,
 AJvYcCUo6+Eb/EYwEAhKFpihcaGhggUMxboCqZR0zAqaK2hO0Lf5k3UtIU/IjFBaYxiSZYxx3kvYfNxn6RM=@lists.freedesktop.org,
 AJvYcCUre7AtHKTk3FFjRM+VwbB6AqPniaWjwoGqtEPohLqM1Tw5sRsPgKeXXPiRA8AoVzNAnkSLVCrQ7HHP@lists.freedesktop.org,
 AJvYcCVLZTx7RyMdm1iePYnJedzOjoh4tctAPwCbOSJPHKoikcweZiwGJRpDsaYDu555afbE+j6whDXLRh0yBeY=@lists.freedesktop.org,
 AJvYcCVQbIo6jWusCh93YLTAZ+5w5P7B3HNoZUatt78pasDGyVybUSgoxrDScG3yu3nTgDPzQGLd3egc@lists.freedesktop.org,
 AJvYcCXK28d7MKEW7TXrJYhlAzAQOx6eCysJIcrBg8fs9M3jR7hFLWbT0w719Wb6JjhMxUJwR6tRMPBqdQth@lists.freedesktop.org,
 AJvYcCXzY8iLbtvYB2ZTDeEWu2kzHBPKF55ypcObrmiaekc5J5jCITW0T72fNTtSS5UzJUC+5+acBi4fuw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwbPJleWF0OAFcmh38cx7+br942aa5X03313imBQu/kqaiia/Pk
 A95rqfNllJszEFwKn4D0Ly7wfwQbbTRu36Z2S3Lpun1Lv8opqOAIe+pYratc
X-Gm-Gg: ASbGncu985qL2Y0uyZTUv90FJ7APpHzSIVz/3sblfR4tYYAouTHS2hXhknZcPCG9G/R
 OOmfTGWIygMdRjzCZYSh0MMDt2aHbQEj1m59AtEvGm/MQHRsNcl71HanItf1H2U2HBzetPBj0UT
 tl8xfS3G5zsegzoLEsJzKS4dlfp7xGp7XEHEIRbLqWpfptKt6ZEgoGsvOTVHhy2HYokLz+21suJ
 X/enIUfz4q71ISa8mV3Ta0LjcB27Xe9j2TcUBPXyWYhe5WtBnfCN5TzLc4KiEI1vX3SgYoUOZpr
 D7PDLjYUnAnrV/CuavCZt0ztZDJWmDoIxBUe
X-Google-Smtp-Source: AGHT+IFOcUPptTQCvOMHiebMmKIO51iRtzt6r6HM+NEQ7x3Abwl+WNcxNE8vKqEDySENGLdt14ukKg==
X-Received: by 2002:a05:620a:43a2:b0:7b1:7508:9f38 with SMTP id
 af79cd13be357-7be523e2a07mr3876635885a.16.1737450782825; 
 Tue, 21 Jan 2025 01:13:02 -0800 (PST)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com.
 [209.85.222.174]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7be614ef1a5sm532894685a.102.2025.01.21.01.13.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jan 2025 01:13:02 -0800 (PST)
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-7b6ef047e9bso496088185a.1; 
 Tue, 21 Jan 2025 01:13:02 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVQJWqNelfcLtnJaBP04o7uW2LCL7GrCXS5T7TRGvoqXVGM+/zvO/5xClBIlvNdhVh9GXCPzi/YMEbMGgY=@lists.freedesktop.org,
 AJvYcCVYYfWcsLEVspvqfRAlEaf6Fb8/sOZJcclQYSNb9rBzJcyDumPDlkcG8j2NRuYxvTUgxyMs4kpAuTAD@lists.freedesktop.org,
 AJvYcCW22fC3GKgVtmoBbUOdboA2bkKm1M/Qobm4DJ9o0kNf6ivIif6QCdPJ7tIGYNqbI28149Xn5cjgMWZm@lists.freedesktop.org,
 AJvYcCW6c2SEePq4y4697mOeGlZ0HbYtKZil/yI/BufMykOgMtFGVLMp/KmQ+Yc/2Ug5OYmvvGAVq5DSZV46@lists.freedesktop.org,
 AJvYcCWNCpJJ4QJ8EBFfznn5s+mtKP7vEIH6Q5E/laUT8gE4rkU9ZIJHNbB4eSKvK8Kc9JFY8GHQLJMZ@lists.freedesktop.org,
 AJvYcCXKgArUnzx80sKf5StLAw7gTcyqL+RSpPgoc6pxqQUVQEPjJmqR1iVxUnB7xJNowbEN6jViCj18BA==@lists.freedesktop.org,
 AJvYcCXLoBu21VlAlq90XjxzuKrv11kwx91gwKS+UeqBStgBFhuQbCCLj57S6R7zx/a8kyVqx9BtGjE+Fsk=@lists.freedesktop.org
X-Received: by 2002:a05:6122:1783:b0:517:e7b7:d04b with SMTP id
 71dfb90a1353d-51cd983d39emr19246646e0c.5.1737450357663; Tue, 21 Jan 2025
 01:05:57 -0800 (PST)
MIME-Version: 1.0
References: <20241214-drm-connector-mode-valid-const-v2-0-4f9498a4c822@linaro.org>
 <173624946815.1500596.321177900833598022.b4-ty@linaro.org>
In-Reply-To: <173624946815.1500596.321177900833598022.b4-ty@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Jan 2025 10:05:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVwcaY2Fgpf7GYhBrE5B+AEg=v0BH4OjMXgnp=wqjxmKg@mail.gmail.com>
X-Gm-Features: AbW1kvaysGolt62WeN4DkS2DNKlSt5oN-0lBeK1j4PwxsWLIrFBPjsQ9bnC7ZcA
Message-ID: <CAMuHMdVwcaY2Fgpf7GYhBrE5B+AEg=v0BH4OjMXgnp=wqjxmKg@mail.gmail.com>
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
 Jani Nikula <jani.nikula@intel.com>
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

On Tue, Jan 7, 2025 at 12:31=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
> On Sat, 14 Dec 2024 15:37:04 +0200, Dmitry Baryshkov wrote:
> > While working on the generic mode_valid() implementation for the HDMI
> > Connector framework I noticed that unlike other DRM objects
> > drm_connector accepts non-const pointer to struct drm_display_mode,
> > while obviously mode_valid() isn't expected to modify the argument.
> >
> > Mass-change the DRM framework code to pass const argument to that
> > callback.
> >
> > [...]
>
> Applied to drm-misc-next, thanks!
>
> [1/5] drm/encoder_slave: make mode_valid accept const struct drm_display_=
mode
>       commit: 7a5cd45fab0a2671aa4ea6d8fb80cea268387176
> [2/5] drm/amdgpu: don't change mode in amdgpu_dm_connector_mode_valid()
>       commit: b255ce4388e09f14311e7912d0ccd45a14a08d66
> [3/5] drm/sti: hda: pass const struct drm_display_mode* to hda_get_mode_i=
dx()
>       commit: 5f011b442006ccb29044263df10843de80fc0b14
> [4/5] drm/connector: make mode_valid_ctx take a const struct drm_display_=
mode
>       commit: 66df9debcb29d14802912ed79a9cf9ba721b51a4
> [5/5] drm/connector: make mode_valid take a const struct drm_display_mode
>       commit: 26d6fd81916e62d2b0568d9756e5f9c33f0f9b7a

I cannot find these in drm-misc or drm-next, but they are in drm-tip?
The last one due to commit 2bdc721917cf141f ("Merge remote-tracking
branch 'drm-misc/drm-misc-next' into drm-tip").

What am I missing?
Thanks!

P.S. Sima: noticed while resolving a merge conflict using drm-tip. Thx!

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
