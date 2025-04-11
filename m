Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B2FA85432
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 08:36:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 240A910EAF8;
	Fri, 11 Apr 2025 06:36:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com
 [209.85.222.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDAFD10EAF6;
 Fri, 11 Apr 2025 06:36:27 +0000 (UTC)
Received: by mail-ua1-f66.google.com with SMTP id
 a1e0cc1a2514c-86c29c0acdfso636175241.3; 
 Thu, 10 Apr 2025 23:36:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744353386; x=1744958186;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6YaWTI7DWsK4VeI0QvD2ZFS0NMVC1Fl7xtwp7U/95NA=;
 b=hBKlqu/f0G7gNcaqmRPUn1YkPNsK2CDudWe8DgTek50+AEkxSGxnzl6tZqbzPiU6i5
 5bObl3pgciG+MzrazJAq+5i1NEJ6dB0bly1F3XJKousmC6/a8i1VsWB/EjK3pQM7Y8tP
 0AaFcCfSvj2bNQg+731UUgctCAuclCNUj1eUf6GBSRWOIccebQk4xIDaOx3MN+4bD9Ef
 nmAMnx1RmitrKKpaCAjZi2uiT0wFaSklWQjJgmbbNlTrAEnV80r0Cpk5gEKAj3El1JYE
 +ShNX45ZkI60B8YP2IssrMGFr2oHTlp3dLFHF72do7LYON5ebKsuFBClQshZVWyECtte
 +pig==
X-Forwarded-Encrypted: i=1;
 AJvYcCUidUUdvFZXWCi68Zh7uXN26IcnLR6QDt1MS1bi9reE7nYC3h5nBHqG6AulKu6TnrmQBADBwHEl@lists.freedesktop.org,
 AJvYcCVZXhuY4zPOswHFyquSHJYxWXfr6SUzvC/dM2fSDuVChFY0riQa9BHJORCZqQnFvRDrRXI5Ea2/Sw==@lists.freedesktop.org,
 AJvYcCVkyso6F/gOlWX4mIAAT3N7DKuuHQFwoq8voKHkI9KCwjlT9pAlG+n1VeSTNRUcnAYyITQFswc3udq7@lists.freedesktop.org,
 AJvYcCWRq8Jaqv1z64NHNGfzESlaQXX2qAjcIQ27GKCECtCYxAwGiN9l68ikwLZAnkvjDSpgq5vIST8Bx40=@lists.freedesktop.org,
 AJvYcCXxkTJ07xtDwHFCftVxbdzwfbKhWXKGrByJWxo+liZdzu0xtS4ielqOxGmYL099dvoF12bI9RzMf3Cg@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwudWQLA3hKTqvSa+Noqkl15S8wRtDSOUonQPnp6zlwB4QTFNvY
 3ubIz9WeZbky0a8lCgQ3Bj8J6lRtd4uhhFtG9Il5TYxJJnwlZgSp9d3+TdtDQLHJYg==
X-Gm-Gg: ASbGncuB6mhnGq2VCei4FEFPyB2XB3sl1ZP/3/qLBjFuoJgVKuyZyN5ggHEa6Bj28g8
 mYYMO73l2uafBXw392GZFtBrLfhLByiYPVIY6iZNPjxOcd1O3diGdo1E7I22sG6WpzHGHtS0VyB
 VALsZ+ysvgRkTddr4atGvPdm6dfxEPlTtZq00GX1wx2F0sF0misJw4qQmqNud5+oGeDLIgIqUuP
 5yWMAQsPka54KugugW/YSDpD8m3eOvcDMJ+liiH3E8R8umEsTZuhDUsriFalLRwAxt3y5ShBQO3
 Qk6EsxRurDRpsDfijLUyIA2xqJ1x1ENVaNF/4tk9k9ORFI1tc7z8Enf52nvvsKnEatep0zE/dLm
 QR1s=
X-Google-Smtp-Source: AGHT+IFzEv8rIHpiVq68+W9fVA+/1iVlMjr9RuJ0K/S6DybYhZxTJvAFT1OUHl5h9LQ9nT6nIu1GEA==
X-Received: by 2002:a05:6102:3c8c:b0:4bb:cf25:c5a7 with SMTP id
 ada2fe7eead31-4c9e4ef1620mr811557137.7.1744353386480; 
 Thu, 10 Apr 2025 23:36:26 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com.
 [209.85.222.41]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-4c9c9738083sm920049137.4.2025.04.10.23.36.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Apr 2025 23:36:26 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id
 a1e0cc1a2514c-86718c2c3b9so655975241.2; 
 Thu, 10 Apr 2025 23:36:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCU8ACPRR26NTq7BV26fL1uiaSDzzLgH/Yq5K4YxFdKKG0tGVyk/7tz6q8qohQLB0g/PJ+6A6HWMaO6g@lists.freedesktop.org,
 AJvYcCVIAnQdewypRuZ18B3R7P2XfQcHhNClVRCOdAXpO1X9TnigVNrFzckPc3LWxlwYdSubGdzE+Tk3@lists.freedesktop.org,
 AJvYcCW9SxIqWLwKKj+joTaqQRJ6bGL6xBCRB8M/QrFGWUpw8w7dSHqC96EztiptGM6f0tedSxH4Gv7OW7Q=@lists.freedesktop.org,
 AJvYcCWgOTSk0qftP7qNEd4EruhhVyb2hjkbmPA4J1A00LTrTIhZRZJKnKinFuexTusot4/PBEXzFMeepk6z@lists.freedesktop.org,
 AJvYcCXq1Wn64S8V1eJBtjCDdqgh0f/eGfTLK3EFtigVUnXkoNLnzCOzFfaN183TvTZzR3swSSkaoIpDTQ==@lists.freedesktop.org
X-Received: by 2002:a05:6102:5489:b0:4c1:924e:1a2a with SMTP id
 ada2fe7eead31-4c9e504c3aemr736947137.25.1744353386128; Thu, 10 Apr 2025
 23:36:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250410163218.15130-1-ville.syrjala@linux.intel.com>
 <20250410163218.15130-5-ville.syrjala@linux.intel.com>
In-Reply-To: <20250410163218.15130-5-ville.syrjala@linux.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 11 Apr 2025 08:36:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUt4UkiTqe6T1QPxAwJdLnQfaDjw7_cKYtTx9WVed9Z0w@mail.gmail.com>
X-Gm-Features: ATxdqUGG68dHUm49IQV8G2NJ_HEDfXWabJxNBHJkOpQT2upH4xlbmyKOguLtNHo
Message-ID: <CAMuHMdUt4UkiTqe6T1QPxAwJdLnQfaDjw7_cKYtTx9WVed9Z0w@mail.gmail.com>
Subject: Re: [PATCH 04/19] drm: Pass the format info to .fb_create()
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, Maxime Ripard <mripard@kernel.org>, 
 Russell King <linux@armlinux.org.uk>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
 Zack Rusin <zack.rusin@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 amd-gfx@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, virtualization@lists.linux.dev
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

On Thu, 10 Apr 2025 at 18:33, Ville Syrjala
<ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Pass long the format information from the top to .fb_create()

s/long/along/

> so that we can avoid redundant (and somewhat expensive) lookups
> in the drivers.

[...]

> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

>  drivers/gpu/drm/renesas/shmobile/shmob_drm_kms.c       |  3 ++-

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
