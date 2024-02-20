Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1236385BB5A
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 13:04:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 488CA10E0E1;
	Tue, 20 Feb 2024 12:04:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="as+j6Siq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C5A910E0E1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 12:04:40 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id
 41be03b00d2f7-5d42e7ab8a9so3768239a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 04:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708430679; x=1709035479; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zDBRaKbHpejHAGpTHH0nWNbFRLIF5jgQi6ysnBvVmt0=;
 b=as+j6SiqsU6k/7Cbtq8DKx/z/D7ZAJlZZFi5w2O0RQ0hU9BTAebIjj+V31Wsf47Oii
 auugQYzyEVnM2/m1cOMAOiWq9XeqJWY8+onWrF3uzvWAC2pec49E/P4dZmY7BiRKjuZC
 uR1W4yE2G6CIKNU0/isHQSJFCvN7zqkFVV/27jlpRhcFOaLjlt5trxAV426smMIe/4dj
 oV+ZzlwKqnenFFBDoxw3y3oeDydAqWLqNbP8f5mXhZpxf+YOgp4GkogyFQm2ig5amELd
 zxlIP5E0bVHrFqUCZt0/rwdGcAnguYoK/OcK22OO0qNGbXURqFnPQ/b2eHSIqA35YWZ8
 8e9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708430679; x=1709035479;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zDBRaKbHpejHAGpTHH0nWNbFRLIF5jgQi6ysnBvVmt0=;
 b=HNBKGg6tHdI51sUwuhkNB/+nF6KxK3kNT4GiYYGVXZjOXo0BLPVCbS2W7JO1mTFyha
 y1lngU4SK96CYABBl05pyw7w001/SOJF0AhJiTR/OR/7Lf9nB1Y4QYfRvugAdKzGvCGL
 e/wSrp+M6hI0TUEqSBztNXAEdI7AMmeoQFetkgf3DpY9397Q0Gd2FekzOu3GQ4IPXjUt
 jpHaoWRIjiby6Tc2BilJpt6xSb9pwdP4uhq9ksbUOQpG578RmUyYeGvtHLtyeYp4aYn1
 Gn2OBKhOnQtn8JDe48g28grARoJfN6x5pOx2r7LI/DklbLzBYzdeGcYObyWNY/B63qn0
 zuTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBg/zMvxffBl1RnYz0cl9DT9WvrpdB7ljxCkfpXw+t4vjU1I/u29cBHsNV/XEC+zLCZRkRUAIhtobEbRGVOWldd5UVAdrIvUpN74qfcS46
X-Gm-Message-State: AOJu0YxOUiGJewygOR8nMkCkT4PSHwiCH1Z1cwSFe9sTZN7Q87ehrm3R
 p+VE91cAI1hdMUcM6ZxEXD6+I59gVEgPFTjoMW9mhrlm1L5WGwN1gzAx59BH58pC3Iu2LDuin26
 O6/zHdgUlzwTKmiv2z00xmoY1xd0=
X-Google-Smtp-Source: AGHT+IE+xNffM8hIAHyiibi9RnqLVskBkXY85ndUTCPz4ZsN3JK4L6DHi+NGk+WmCf5wE0DfCBLkrrwZHjEe0ZaCeyY=
X-Received: by 2002:a05:6a21:8183:b0:19e:9143:2ab5 with SMTP id
 pd3-20020a056a21818300b0019e91432ab5mr9769195pzb.25.1708430669536; Tue, 20
 Feb 2024 04:04:29 -0800 (PST)
MIME-Version: 1.0
References: <6be2558b8462fc08095c24c9257563ab5f3ae013.1708001398.git.geert+renesas@glider.be>
 <kycepdxukfsww3tnxoo5hoiuo3vcgpqqmynokzhtl4vodgm6zc@ih4uhw7gz4jh>
 <CAMuHMdVf7ophCwKt-n_N-LBHV4+t14Gjb4d1O0T8FDk_9xMFtA@mail.gmail.com>
 <CAHCN7xJ65RP8TO7cS0p5DwE6zru5NEF0_JA+8siT_OpSeLD7pA@mail.gmail.com>
 <CAHCN7x+EnSU8qk5dBFco=0vkeknGq18qEN7vFmZs0_q83T_3+w@mail.gmail.com>
 <CAHCN7xKffJ29zyjoJVAcy3b_d=-zkFzbL=URj4yWJWzYvRdB_Q@mail.gmail.com>
 <TYCPR01MB11269CBE8429A31DE5002A5A5864C2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <nzrkujogauvn262ucxippwidyub6ikcohcjpbpn4hzj7rymctm@4owntgrmcquf>
 <TYCPR01MB11269CBAA20275E11D9AD6500864C2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <wxwad77x2mxhhwdsbgiytzn6x54t4sywodjhzefwldo277njiz@ru7z54wxgelu>
 <CAHCN7xJi-6W6x+OJmkNwOX45SM4WHD5zkN42ZOp8ZxFnp3YL5w@mail.gmail.com>
 <1ff513b9-d4fd-4663-b46b-bb9662e3881c@imgtec.com>
 <CAHCN7xJ0TTS_-PA3Ox_RCpfyHJFk-s=-zs8W1Zm3dQTUAoqbpg@mail.gmail.com>
 <CAK4VdL3o+oS3hqwATb8wbv=qOVojWz270r0bUhaBJOw6+tKbxg@mail.gmail.com>
In-Reply-To: <CAK4VdL3o+oS3hqwATb8wbv=qOVojWz270r0bUhaBJOw6+tKbxg@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Tue, 20 Feb 2024 06:04:17 -0600
Message-ID: <CAHCN7xKk5N99eAN0HJHU9ppbPWJpE1cv1Xz2cg1nLtJLW8Y6UA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/imagination: DRM_POWERVR should depend on ARCH_K3
To: Erico Nunes <nunes.erico@gmail.com>
Cc: Matt Coster <Matt.Coster@imgtec.com>, Maxime Ripard <mripard@kernel.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Frank Binns <Frank.Binns@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Sarah Walker <Sarah.Walker@imgtec.com>,
 Javier Martinez Canillas <javierm@redhat.com>, Nishanth Menon <nm@ti.com>, 
 Marek Vasut <marek.vasut@mailbox.org>, 
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

On Tue, Feb 20, 2024 at 5:55=E2=80=AFAM Erico Nunes <nunes.erico@gmail.com>=
 wrote:
>
> Hi,
>
> On Mon, Feb 19, 2024 at 9:38=E2=80=AFPM Adam Ford <aford173@gmail.com> wr=
ote:
> > /usr/share/vulkan/explicit_layer.d/VkLayer_MESA_overlay.json
> > ERROR:            loader_validate_instance_extensions: Instance
> > extension VK_KHR_wayland_surface not supported by available ICDs or
> > enabled layers.
> > Failed to create Vulkan instance.
> >
> > I have tried running in X.org mode instead of Wayland, but I get a
> > different set of errors:
> >
> > [ 11102.013] (II) Loading /usr/lib/xorg/modules/libfbdevhw.so
> > [ 11102.014] (II) Module fbdevhw: vendor=3D"X.Org Foundation"
> > [ 11102.014]    compiled for 1.21.1.7, module version =3D 0.0.2
> > [ 11102.014]    ABI class: X.Org Video Driver, version 25.2
> > [ 11102.015] (II) FBDEV(0): using default device
> > [ 11102.016] (II) modeset(G0): using drv /dev/dri/card1
> > [ 11102.016] (EE)
> > Fatal server error:
> > or all framebuffer devices
> > [ 11102.016] (EE)
> > [ 11102.017] (EE)
> > Please consult the The X.Org Foundation support at http://wiki.x.org  f=
or help.
>
>
> The wayland and xcb extensions are not really supported at the moment
> in Mesa for powervr, so this kind of use case does not really work
> yet. For a first test, indeed the Sascha Willems triangle with
> -DUSE_D2D_WSI=3DON is probably best.
>
> One thing I can add is that most Wayland compositors use OpenGL for
> rendering and will only expose linux dmabuf capability if accelerated
> OpenGL support is found by the compositor. So even if you manage to
> hack some WSI functionality to be exposed by the Vulkan driver, it
> still won't work out of the box with regular compositors since there
> is no zink/OpenGL support yet. There is some experimental Vulkan
> renderer support in some compositors but last time I tried they hit
> other limitations due to the early state of powervr Vulkan in Mesa.

If I disable the GUI, do you think it would render via kms/drm?  I was
having issues starting Ubuntu with X11.

>
> I did some work related to this and managed to run a Vulkan triangle
> with Wayland and a modified compositor so far. So at least we could
> get the client side out of the way soon. But that depends on a Mesa
> development branch from Imagination which is being heavily reworked,
> so we need to wait for that rework to make its way into upstream Mesa
> before making progress on that work being upstreamed.

OK.  I won't spend any more time on it.  I knew the driver was in its
infancy, but I didn't realize how much.

I'll likely push my existing device tree changes to the Geert's
Renesas tree so the GPU node can be added which should make this
easier in the future.  I can push my tweak via gitlab, adding
DEF_CONFIG("renesas,r8a774a1-gpu", "renesas,du-r8a774a1"), if you
think that would be accepted.

adam
>
>
> Erico
