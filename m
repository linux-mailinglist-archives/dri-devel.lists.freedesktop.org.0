Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC98737D19
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 10:09:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5698710E3F5;
	Wed, 21 Jun 2023 08:09:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0001510E3F3;
 Wed, 21 Jun 2023 08:09:37 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2b470330145so53767051fa.3; 
 Wed, 21 Jun 2023 01:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687334975; x=1689926975;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=y3IfFQYVdXyBU5zHSeHmh3RKbksxmzcltLrgdQI4MpQ=;
 b=LmD2wc+/cgtkYn8IiW4I5+TDur1d3SseAxxKBx6YmN63b9QTOc3v3d+7RQOYtfSXvW
 iI57Y7Wfa6Lthow+bgJYm/px8JOQ06b6aHK3GKbqy6hR9k+vAI8NCywoijvJXXq8MVwC
 kNleQraRdG4keof53rPE4usruTmscSm+YfLGyeAVMvsNDLJbR1B0nTP2u12+DHT4S0YU
 gH4CKbljDOlnvj4AxMkVlzefV/50TYJZovURYv0q7A9FnC4wj6yyruNrMV/QT3fMlxlo
 kg/I55XqzTCIoy/QnkjOAJeIaxn8dyOkPBYM9Lsb+GbPuknk52WbWX8LR9QlS6svgYge
 gHCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687334975; x=1689926975;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=y3IfFQYVdXyBU5zHSeHmh3RKbksxmzcltLrgdQI4MpQ=;
 b=TbhA7aUa9FCPtItGZ6ypk8JXxU+NDqbNGKswFzta4jTcedHsVBzSQ1QgB6oYrhIr5S
 ylavjyTxD8MWtTZup0SlKLnsBA7abYMaRAZLpse8XaFWwqYOvv6oivIzbWYWVFsg6JJ8
 4rWAILTGDux/2UDtuQ0NEk1xMH5j5JhktFd3Mf5nYuKka6ZCGYkYU7sX+3bwjdkm4avt
 2RowMutf8Wy7IDHNEMbeQ4XQo+SO+mQYYMzL/iurII1HvrqN5hNn+bWtOENF9hWdXbT2
 n6TSBkGNn4gcogaRKq2LOTRRoagO+9MJFNZ74DwSRVpGkOXkFpLFV0auRobQeUtN7j8L
 meTg==
X-Gm-Message-State: AC+VfDzPgwVUXQDLXIunFSO04B4gTHPe2nHeyz0aoX1AkFAHxR3Gnrz3
 KDwCQP7DsZcEZB+pP+GYO7A=
X-Google-Smtp-Source: ACHHUZ4Hb3scbHBR2Qg4xyeKNalilWruB0NUIlOVoSYzrmnEue5WT+zhczNzI4GnkJsJ0SHCA9jzUQ==
X-Received: by 2002:a05:651c:91:b0:2b4:6b64:6860 with SMTP id
 17-20020a05651c009100b002b46b646860mr6422393ljq.25.1687334975336; 
 Wed, 21 Jun 2023 01:09:35 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 d5-20020a2e3305000000b002b1ac2bcf99sm783919ljc.120.2023.06.21.01.09.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jun 2023 01:09:34 -0700 (PDT)
Date: Wed, 21 Jun 2023 11:09:31 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: =?UTF-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>
Subject: Re: [RFC PATCH v3 2/4] drm: Create DRM_IOCTL_GET_RESET
Message-ID: <20230621110931.6f3c8914@eldfell>
In-Reply-To: <20230621005719.836857-3-andrealmeid@igalia.com>
References: <20230621005719.836857-1-andrealmeid@igalia.com>
 <20230621005719.836857-3-andrealmeid@igalia.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ATv9R6N/IyatZ_qIv8rdPJF";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>,
 'Marek =?UTF-8?B?T2zFocOhayc=?= <maraeo@gmail.com>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <michel.daenzer@mailbox.org>,
 Timur =?UTF-8?B?S3Jpc3TDs2Y=?= <timur.kristof@gmail.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/ATv9R6N/IyatZ_qIv8rdPJF
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 20 Jun 2023 21:57:17 -0300
Andr=C3=A9 Almeida <andrealmeid@igalia.com> wrote:

> Create a new DRM ioctl operation to get the numbers of resets for a
> given context. The numbers reflect just the resets that happened after
> the context was created, and not since the machine was booted.
>=20
> Create a debugfs interface to make easier to test the API without real
> resets.
>=20
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> ---
>  drivers/gpu/drm/drm_debugfs.c |  2 ++
>  drivers/gpu/drm/drm_ioctl.c   | 58 +++++++++++++++++++++++++++++++++++
>  include/drm/drm_device.h      |  3 ++
>  include/drm/drm_drv.h         |  3 ++
>  include/uapi/drm/drm.h        | 21 +++++++++++++
>  include/uapi/drm/drm_mode.h   | 15 +++++++++
>  6 files changed, 102 insertions(+)

...

> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index a87bbbbca2d4..a84559aa0d77 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -1169,6 +1169,27 @@ extern "C" {
>   */
>  #define DRM_IOCTL_MODE_GETFB2		DRM_IOWR(0xCE, struct drm_mode_fb_cmd2)
> =20
> +/**
> + * DRM_IOCTL_GET_RESET - Get information about device resets
> + *
> + * This operation requests from the device information about resets. It =
should
> + * consider only resets that happens after the context is created, there=
fore,
> + * the counter should be zero during context creation.
> + *
> + * dev_reset_count tells how many resets have happened on this device, a=
nd
> + * ctx_reset_count tells how many of such resets were caused by this con=
text.
> + *
> + * Flags can be used to tell if a reset is in progress, and userspace sh=
ould
> + * wait until it's not in progress anymore to be able to create a new co=
ntext;
> + * and to tell if the VRAM is considered lost. There's no safe way to cl=
ean this
> + * flag so if a context see this flag set, it should be like that until =
the end
> + * of the context.

Is "this flag" the VRAM_LOST? Or any flag?

Does this mean that not all resets are fatal to the context? Is there
any kind of reset that should not be fatal to a context? All the
rendering APIs seem to assume that any reset is fatal and the context
must be destroyed.

> + */
> +#define DRM_IOCTL_GET_RESET		DRM_IOWR(0xCF, struct drm_get_reset)
> +
> +#define DRM_RESET_IN_PROGRESS	0x1
> +#define DRM_RESET_VRAM_LOST	0x2

Ok, so the dmabuf lost is being communicated here, but how would a
userspace process know on which device a dmabuf resides on?

Let's assume process A uses device 1 to draw, exports a dmabuf, sends
it to process B which imports it to device 2. Device 1 resets and loses
VRAM contents. How would process B notice that the dmabuf is lost when
it never touches device 1 itself?

> +
>  /*
>   * Device specific ioctls should only be in their respective headers
>   * The device specific ioctl range is from 0x40 to 0x9f.
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index 43691058d28f..c3257bd1af9c 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -1308,6 +1308,21 @@ struct drm_mode_rect {
>  	__s32 y2;
>  };
> =20
> +/**
> + * struct drm_get_reset - Get information about a DRM device resets
> + * @ctx_id: the context id to be queried about resets
> + * @flags: flags
> + * @dev_reset_count: global counter of resets for a given DRM device
> + * @ctx_reset_count: of all the resets counted by this device, how many =
were
> + * caused by this context.
> + */
> +struct drm_get_reset {
> +	__u32 ctx_id;
> +	__u32 flags;
> +	__u64 dev_reset_count;
> +	__u64 ctx_reset_count;
> +};
> +
>  #if defined(__cplusplus)
>  }
>  #endif

Thanks,
pq

--Sig_/ATv9R6N/IyatZ_qIv8rdPJF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmSSsDsACgkQI1/ltBGq
qqfn+Q//SNCwyNu1uoLUvuP9SdsIToY76Ebck8cgr/wxhOOv2NFDulfmpaMKW9X2
Skf4kC+BJNM/myZhtmQ3iOJz7AdefkFAcScATWdGpjbs4pEqJxhNeNoV0UpMl3mt
yHcqFXLtPI4ofsrwGNeQeuVVUPRVWnO3RgN4I3j5egmBj4QJtW57atw60PxNBAmj
qakSMLdfhW7K148tOX5AMbxDJ1wnQctGAEV79TBzH7N9iacRR7AwpFyhho7T71ho
ll8NnWBEdabmPqpV29ewuY+2pqXepdxRdIXaoHA5WLffk8wB2muwPsyRdB3CmQh1
NcfUOBc6/pOlTxCwRgriHd7Scff76gGnJhdis06AHgfVIofRiPLbLSr518elLioO
a4B5LYPLbZY/p328pD7aW9bJTodQ514RL0YhI7D1z01KQR/FZ2/h4WdOQHSnm6Rg
UDzUGEoqTNseyFNwpwbJneY2jMnS3HpgWf7i5gmOTLCwize8g/8jNU+HL5kz/u5+
tarXS+WB0eQy5mmJFdgQ+om8XJpFnfAJqc4jU3fU3qsKro6l72BSek4YvSQNoJdc
ajVaQOgNqK2+V/Y5/6tH+OhoADRfvJ/YrUupVdydNr7Kc+ff+kwRDOH0IHOEwMK6
eafZ1GWhCEmoiqzXRFvNkcaLegQSoFECKsZfZ63Vnz8/RJTz7q0=
=DOkA
-----END PGP SIGNATURE-----

--Sig_/ATv9R6N/IyatZ_qIv8rdPJF--
