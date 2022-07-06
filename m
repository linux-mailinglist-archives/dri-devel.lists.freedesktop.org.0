Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E4B5694B8
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 23:52:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FD0A10E8E0;
	Wed,  6 Jul 2022 21:52:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E627C10E72B;
 Wed,  6 Jul 2022 21:52:32 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id fd6so20892600edb.5;
 Wed, 06 Jul 2022 14:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sVKNj9SkoISChFSURoq2rBmW/pxSFV/VJJFMmSbwpGs=;
 b=Go6ki17JNkyXFJID7151VQQd1gPh6zHpB+PcndVXU8y0ABMMSTBToYa/eIYvSK0+nt
 xvVRXlhHDTD3/ZMHoWQuT9s8dvQ2nhyc9v9p+4zD+KO/gkOlU5ZPTtnff73hgNZgX5mS
 WExsn+cJai5DENSjsWBJ3RGP/mqkpMNI19J6/oHh5hTTzqOQ56NUmsbZJvW/Q8b4ECWy
 +Z4En8Lv+px8oAX8JJ26vUMDDxlPQkokxMHCt59JrX9lOHimc1UzUYU5hzn81E1TaPrE
 AO11+uiyE8vIAs0/M14C+ifm18MYO+hRBZGPbvL9v2QQT68n/33CaDc00uNr+093nIYD
 vduA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sVKNj9SkoISChFSURoq2rBmW/pxSFV/VJJFMmSbwpGs=;
 b=s17J9Fk1Pb49InLdVHaFn2ppC5YVRfCzZKjft2o23qkWOJzii0kbFeDrvCThVQHLko
 sNf9xeqUxq3A/8JYKuJ/DMH+blbtFJdPnLJ1LiLum1M3vOueJ0afjXRs4xTB6sdhc+u/
 rVscewQoxhfmcskfOTCd6FdvMJ5L/mBZlHO5lUjpzSVaiJpw2iBlBlsaJZjtPW4K8vOa
 4WsWGTYYk4nndeDqUtYvR2SPIDDnC/DFnFkxHQ7CW1yr7x3e33YfkEBIx1p6rB+/e2Fk
 z6hhN3HwPeQ6kD/MfiTodCTIjRwKIBj6ULdAZ3VmcZ6gRt7MapnmnYlIM4FExp57CD4G
 4zBA==
X-Gm-Message-State: AJIora+eGlyiFkfjnyJsUQ+FeIVIeL+7k/HTt98br7rrfgjWXEJARqS7
 MA3EimNdG1i6hbC6xeKCRISXhd5y3L8BUspdfFU=
X-Google-Smtp-Source: AGRyM1uTE+GtqSHSfiDE+D7/pQfZittO31nLWCwKLry3URJ/yUFOSww0ibrgZU0AWs4loA76jNinpLCiuO4GqUAR8tE=
X-Received: by 2002:aa7:de88:0:b0:435:9a54:168a with SMTP id
 j8-20020aa7de88000000b004359a54168amr55951504edv.73.1657144350408; Wed, 06
 Jul 2022 14:52:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220706200144.68851-1-mat.jonczyk@o2.pl>
In-Reply-To: <20220706200144.68851-1-mat.jonczyk@o2.pl>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 6 Jul 2022 17:52:18 -0400
Message-ID: <CADnq5_OJzANwVTu81DUM7qgYbbY7w1OjZsToMKtFe8U9aC4fiA@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: avoid bogus "vram limit (0) must be a power
 of 2" warning
To: =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Wed, Jul 6, 2022 at 5:40 PM Mateusz Jo=C5=84czyk <mat.jonczyk@o2.pl> wro=
te:
>
> I was getting the following message on boot on Linux 5.19-rc5:
>         radeon 0000:01:05.0: vram limit (0) must be a power of 2
> (I didn't use any radeon.vramlimit commandline parameter).
>
> This is caused by
> commit 8c2d34eb53b9 ("drm/radeon: use kernel is_power_of_2 rather than lo=
cal version")
> which removed radeon_check_pot_argument() and converted its users to
> is_power_of_2(). The two functions differ in its handling of 0, which is
> the default value of radeon_vram_limit: radeon_check_pot_argument()
> "incorrectly" considered it a power of 2, while is_power_of_2() does not.
>
> An appropriate conditional silences the warning message.
>
> It is not necessary to add a similar test to other callers of
> is_power_of_2() in radeon_device.c. The matching commit in amdgpu:
> commit 761175078466 ("drm/amdgpu: use kernel is_power_of_2 rather than lo=
cal version")
> is unaffected by this bug.
>
> Tested on Radeon HD 3200.
>
> Not ccing stable, this is not serious enough.
>
> Fixes: 8c2d34eb53b9 ("drm/radeon: use kernel is_power_of_2 rather than lo=
cal version")
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Jonathan Gray <jsg@jsg.id.au>
> Signed-off-by: Mateusz Jo=C5=84czyk <mat.jonczyk@o2.pl>
> ---
>  drivers/gpu/drm/radeon/radeon_device.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/rad=
eon/radeon_device.c
> index 15692cb241fc..429644d5ddc6 100644
> --- a/drivers/gpu/drm/radeon/radeon_device.c
> +++ b/drivers/gpu/drm/radeon/radeon_device.c
> @@ -1113,7 +1113,7 @@ static int radeon_gart_size_auto(enum radeon_family=
 family)
>  static void radeon_check_arguments(struct radeon_device *rdev)
>  {
>         /* vramlimit must be a power of two */
> -       if (!is_power_of_2(radeon_vram_limit)) {
> +       if (radeon_vram_limit !=3D 0 && !is_power_of_2(radeon_vram_limit)=
) {
>                 dev_warn(rdev->dev, "vram limit (%d) must be a power of 2=
\n",
>                                 radeon_vram_limit);
>                 radeon_vram_limit =3D 0;
>
> base-commit: 88084a3df1672e131ddc1b4e39eeacfd39864acf
> --
> 2.25.1
>
