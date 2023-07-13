Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A48751CDD
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 11:11:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0753310E64E;
	Thu, 13 Jul 2023 09:11:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0B0510E64A
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 09:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689239480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wNbtyQ76nBuBqvvqrZSc6orqqyUgVCDr6u2ACe6GE7E=;
 b=fyqHJtSseBqPK45o8zEvm+fm9VWjiiIiyGXQBhTwbi0VsIGsIuBnvOcBqWCIZ/mJiCQ9Zn
 DudtGbwMm533i27doNpMh9hnUO4GrdXilfC1H9UzM/yLQzPY2k8PB0DKLLDKphYA3u7UVV
 qpb0tpSjy7RmhHjUGCO+4B0CGj1aviY=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-1x2Q4TwGP32ZgyihPCyOww-1; Thu, 13 Jul 2023 05:11:18 -0400
X-MC-Unique: 1x2Q4TwGP32ZgyihPCyOww-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2b6a4dba654so895851fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 02:11:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689239476; x=1691831476;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wNbtyQ76nBuBqvvqrZSc6orqqyUgVCDr6u2ACe6GE7E=;
 b=f/lvXAtPuS96HO5pycVZRG7IzLFnZLbR4q3FFN+5yGnMWkMSivpK5fGHTz9m04LTTm
 ontqVGQcBAXMAJJbPRrT9UxHGlvR8OxLsQU12ExEZ78IvdUT4hELE77WrYGuUvgeR6Ti
 kTZqL/rv2rLlQmjDzrS4LeRPUmE4hls7RtoHrhqrCYUkB6V+xvvJgqwby4+gtmXKsTtf
 FDLWjH0O3J3ISV5VHqXrelvU6ZAWBKZuzRca2TRKc9ladu3JFuC3556e1J/4MxaP8qx0
 3D2ePLrpDNunmlPoIpVC0MkU4lw9Mu8yiojFKT7lu6eKXJ/yLr9TlH5JUSWaa4R+hCLz
 BzaQ==
X-Gm-Message-State: ABy/qLbXZX12G86/80hTq/UVfG9MeowjolpVRr5JZqt0Ytvy06mvQQT7
 K/vPH8JqqgWdOahOzrynVo57VwNOgKle8VAUuV8j9k0UYARZUu9WUUAOntpZ4eEy+GOQQqIAGoQ
 N5HhpFX/W8SfolMl/iYMlHb6UMaU+nBepufsgAU3+SbxB2Eceq7V57qU=
X-Received: by 2002:a2e:be10:0:b0:2b7:2ca0:989a with SMTP id
 z16-20020a2ebe10000000b002b72ca0989amr920196ljq.5.1689239476622; 
 Thu, 13 Jul 2023 02:11:16 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFw0DuOdoAUA01Xd1FeaBlxKLaI+Rdgpiyi8L3qD/rUV/T0VD7an8HsyTVLGisDJzNOpGN7qGOhAvSEwkaj3i8=
X-Received: by 2002:a2e:be10:0:b0:2b7:2ca0:989a with SMTP id
 z16-20020a2ebe10000000b002b72ca0989amr920186ljq.5.1689239476330; Thu, 13 Jul
 2023 02:11:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230710032131.52747-1-xujianghui@cdjrlc.com>
 <decd9e6f68cbebda22d6648fa7b9b737@208suo.com>
In-Reply-To: <decd9e6f68cbebda22d6648fa7b9b737@208suo.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 13 Jul 2023 11:11:05 +0200
Message-ID: <CACO55tut_20kwHC4-0fkkyGrh0sLrRO2e6TVCuUL_q7vuz+tPw@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/nvkm: do not use assignment in if condition
To: sunran001@208suo.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 10, 2023 at 9:23=E2=80=AFAM <sunran001@208suo.com> wrote:
>
> Assignments in if condition are less readable and error-prone.  Fixes
> also checkpatch warning:
>
> ERROR: do not use assignment in if condition
>
> Signed-off-by:Ran Sun <sunran001@208suo.com>
> ---
>   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c
> index 976539de4220..054fa42f1d04 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c
> @@ -286,7 +286,8 @@ nvkm_i2c_new_(const struct nvkm_i2c_func *func,
> struct nvkm_device *device,
>
>           if (ccbE.share !=3D DCB_I2C_UNUSED) {
>               const int id =3D NVKM_I2C_PAD_HYBRID(ccbE.share);
> -            if (!(pad =3D nvkm_i2c_pad_find(i2c, id)))
> +            pad =3D nvkm_i2c_pad_find(i2c, id);
> +            if (!pad)
>                   ret =3D func->pad_s_new(i2c, id, &pad);
>               else
>                   ret =3D 0;
>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

