Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E89CA85BB12
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 12:55:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DC4810E369;
	Tue, 20 Feb 2024 11:55:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="L2TREEqK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD58710E369
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 11:55:44 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-5129e5b8cecso4114571e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 03:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708430143; x=1709034943; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3yl0M7CLKZiWg66boULSo73wijfnxqf7U3kAkpRW4/4=;
 b=L2TREEqKpA2fVTNVnF560xr3oC1NrTJiCqnWShRotFS9k2gdLZjanULnCFSNvaQ+JW
 6qtGp6P8ZXbT/heqog4FT69X+wd8kwF/q82UuAJlH+/rkKRN1u7xzmz5tEb8zCrGE80Y
 imro/H844oWEr9MVgVOdNrcEvdFBCoJfPKjZPydirmNLOvEw/X8bwqtSJ7qLoFNuQwMu
 28urFFUwmrhlxZxPMQPSTDb3AavBQNDS27+iLfN6EhNVBXw8ZQA8sdCQ1mic3vFjUJ4q
 9gdysRBS6HczJmunWtAJoZwqxBPUrwhBgXcieXto8koUiVOs74ljTLYBuusYfCVjApQt
 j8WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708430143; x=1709034943;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3yl0M7CLKZiWg66boULSo73wijfnxqf7U3kAkpRW4/4=;
 b=PyT5iK8qqUMmu7bJv8PHQSMYqHJwvf1o/QWqJ5yP8VICGKBdPNtTQz3aTNIAoMAcps
 aJ4JUVGAxJBb5vgl941cP6yEZBiHVPQgVbyZJ6wEBPCyEMTDOTGB+jUP473QY7jwEuUk
 Hy3cenSWf+C7VGwjXMqh2oOn/duTuPLJHK/nxqMGGIZDizoa2Y5yn0eiuowG0pt724WL
 tAt/ihSSw6iYbrJLaNJGO+e9ad7XzP6yfXSC6e8BvyNZOQitfdcDCJPwLCbKKWagjOUi
 uvU4cKMVkvQAIrBANM5sHlNJdbqTu6z4KQmUuXxGtKam7VLPCAgypcSY//D07crVzeTR
 bOXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmrtDxEQh8Bx4eplQczrfBYCqqXRtPCLfjyiVL6vx2mOziKfnQi4QTNPIcvu0xG1HfSeUXOdjKYPGFY+Rls7dpyuSfuj/NAt/dHEEqux1d
X-Gm-Message-State: AOJu0YzbpX7+oelwvuhMjt8j17439oxnuw2NTyU0Z3wv/zCz8l9lPxfT
 TW0tEO3VRWh3ctel7Uk+lQgBtqoDvaREhVOD6IbqeZQ6cNQxjjHLxV2BFFrudbL08kJVMqheqw/
 XhW4rGwyQrABYST3JLRIHdsIKArg=
X-Google-Smtp-Source: AGHT+IFBAgJPIT1xKrmwp1gHK45l1q76tE8uzVZZZAV8JcaYwkzwtiN/zQeC6JUtGsdfPOZzl8wLMrd2rpBnjFv0ejc=
X-Received: by 2002:a05:6512:3ba2:b0:512:a2c7:e44c with SMTP id
 g34-20020a0565123ba200b00512a2c7e44cmr6617160lfv.20.1708430142565; Tue, 20
 Feb 2024 03:55:42 -0800 (PST)
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
In-Reply-To: <CAHCN7xJ0TTS_-PA3Ox_RCpfyHJFk-s=-zs8W1Zm3dQTUAoqbpg@mail.gmail.com>
From: Erico Nunes <nunes.erico@gmail.com>
Date: Tue, 20 Feb 2024 12:55:29 +0100
Message-ID: <CAK4VdL3o+oS3hqwATb8wbv=qOVojWz270r0bUhaBJOw6+tKbxg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/imagination: DRM_POWERVR should depend on ARCH_K3
To: Adam Ford <aford173@gmail.com>
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

Hi,

On Mon, Feb 19, 2024 at 9:38=E2=80=AFPM Adam Ford <aford173@gmail.com> wrot=
e:
> /usr/share/vulkan/explicit_layer.d/VkLayer_MESA_overlay.json
> ERROR:            loader_validate_instance_extensions: Instance
> extension VK_KHR_wayland_surface not supported by available ICDs or
> enabled layers.
> Failed to create Vulkan instance.
>
> I have tried running in X.org mode instead of Wayland, but I get a
> different set of errors:
>
> [ 11102.013] (II) Loading /usr/lib/xorg/modules/libfbdevhw.so
> [ 11102.014] (II) Module fbdevhw: vendor=3D"X.Org Foundation"
> [ 11102.014]    compiled for 1.21.1.7, module version =3D 0.0.2
> [ 11102.014]    ABI class: X.Org Video Driver, version 25.2
> [ 11102.015] (II) FBDEV(0): using default device
> [ 11102.016] (II) modeset(G0): using drv /dev/dri/card1
> [ 11102.016] (EE)
> Fatal server error:
> or all framebuffer devices
> [ 11102.016] (EE)
> [ 11102.017] (EE)
> Please consult the The X.Org Foundation support at http://wiki.x.org  for=
 help.


The wayland and xcb extensions are not really supported at the moment
in Mesa for powervr, so this kind of use case does not really work
yet. For a first test, indeed the Sascha Willems triangle with
-DUSE_D2D_WSI=3DON is probably best.

One thing I can add is that most Wayland compositors use OpenGL for
rendering and will only expose linux dmabuf capability if accelerated
OpenGL support is found by the compositor. So even if you manage to
hack some WSI functionality to be exposed by the Vulkan driver, it
still won't work out of the box with regular compositors since there
is no zink/OpenGL support yet. There is some experimental Vulkan
renderer support in some compositors but last time I tried they hit
other limitations due to the early state of powervr Vulkan in Mesa.

I did some work related to this and managed to run a Vulkan triangle
with Wayland and a modified compositor so far. So at least we could
get the client side out of the way soon. But that depends on a Mesa
development branch from Imagination which is being heavily reworked,
so we need to wait for that rework to make its way into upstream Mesa
before making progress on that work being upstreamed.


Erico
