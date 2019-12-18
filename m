Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A699F1252D5
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 21:11:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E81406E2E8;
	Wed, 18 Dec 2019 20:11:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9AD56E2E8;
 Wed, 18 Dec 2019 20:11:37 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id y17so3678140wrh.5;
 Wed, 18 Dec 2019 12:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rbUYEIW7slNbxlu+nEtDsS40/Za9u8XEu+dlEeoKiho=;
 b=c3yyjml81B7N9WIQNvh7JhSGxrwNXD/QguSzK+Vi5D2OARt0A1pxOYak6b8P855cTH
 TkQVBp4XpQXm34UJHJ0DH+I1Bs8I7uy9nE8K0Z92nV27GviuaXPCo92xfhx+b20IzjlI
 pel38UTxZvsWct2NGrJNztBUIlsFbT0aMV2g2ZZGEE+tcZdPwmgjodIJU0YJoFVe75k3
 cHwyOVp4GUq/ZKQCO5TfCyUjhDVgb9JO1LR5qbotC6mIQN8iq8PeOUwALirOozdQjPej
 +XU0fzyNuUWAx6JfocIe7Xt+s/8syX8pAXBvLj2PUegAW4QT8GvKO4GFTV9kar+o6Y0/
 KIgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rbUYEIW7slNbxlu+nEtDsS40/Za9u8XEu+dlEeoKiho=;
 b=cGhJE0DZGZ0fI3JcoI/Wuvy9KHKztzOL9YXrTv/YGFvsy6wrTajiUcXWOuAMhufoz/
 xoXuZVFXwMbnaq1Tbj9pDI9S8/waS+r/Djizf7rZ8Hx/ZjAufKoGw0YIJAqHCFk6z2pY
 +B4aM/OWkv4Il3weO2hQ9/2xQnYfgmAViKc11Mo7Wuzu6kTqLuygdaxdMhYebC0IM7AG
 0Y1Qpqy+cVGJamZfMkOgbWzFu90wbnl1eN4B3fYsJGuMX9rFrQpt9j2moVeOojRGAXcs
 S7hSWVj/Q90HvIyJb8qg/rd36ogifxY72nY5ouM+07H1kY+kWZGvqQe1T2Z75SBFiB5k
 d8SQ==
X-Gm-Message-State: APjAAAUO2URx2voYbt47HdSpGgreSGkbVKTrepY4Y67hiseTD1q1ZC7w
 TVM/etQHAv75sgtS/BDDjpZtuiq88VwpleRpWec=
X-Google-Smtp-Source: APXvYqxvWOkornjFKC9yZx/AYAl3XzgmZvf2Cgv8ByZTr3LB9dcbEl9omnAbae9I0QkOdIPMgysZMMckqComySDr4rw=
X-Received: by 2002:a5d:4692:: with SMTP id u18mr1409287wrq.206.1576699896455; 
 Wed, 18 Dec 2019 12:11:36 -0800 (PST)
MIME-Version: 1.0
References: <1576640988-14639-1-git-send-email-zhangpan26@huawei.com>
In-Reply-To: <1576640988-14639-1-git-send-email-zhangpan26@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 18 Dec 2019 15:11:24 -0500
Message-ID: <CADnq5_Oiksa0pd+6au5giwOeYBaNh4X5-kP=vxpo-617C3dSfA@mail.gmail.com>
Subject: Re: [PATCH 1/3] gpu: drm: dead code elimination
To: Pan Zhang <zhangpan26@huawei.com>
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
Cc: hushiyuan@huawei.com, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 Sam Ravnborg <sam@ravnborg.org>, Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 18, 2019 at 3:13 AM Pan Zhang <zhangpan26@huawei.com> wrote:
>
> this set adds support for removal of gpu drm dead code.
>
> patch1:
> `num` is a data of u8 type and ATOM_MAX_HW_I2C_READ == 255,
>
> so there is a impossible condition '(num > 255) => (0-255 > 255)'.
>
> Signed-off-by: Pan Zhang <zhangpan26@huawei.com>

This change was already made by someone else.

Alex


> ---
>  drivers/gpu/drm/amd/amdgpu/atombios_i2c.c | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_i2c.c b/drivers/gpu/drm/amd/amdgpu/atombios_i2c.c
> index 980c363..b4cc7c5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/atombios_i2c.c
> +++ b/drivers/gpu/drm/amd/amdgpu/atombios_i2c.c
> @@ -76,11 +76,6 @@ static int amdgpu_atombios_i2c_process_i2c_ch(struct amdgpu_i2c_chan *chan,
>                 }
>                 args.lpI2CDataOut = cpu_to_le16(out);
>         } else {
> -               if (num > ATOM_MAX_HW_I2C_READ) {
> -                       DRM_ERROR("hw i2c: tried to read too many bytes (%d vs 255)\n", num);
> -                       r = -EINVAL;
> -                       goto done;
> -               }
>                 args.ucRegIndex = 0;
>                 args.lpI2CDataOut = 0;
>         }
> --
> 2.7.4
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
