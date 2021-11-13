Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F4C44F540
	for <lists+dri-devel@lfdr.de>; Sat, 13 Nov 2021 21:22:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5A1B6E073;
	Sat, 13 Nov 2021 20:22:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DFA66E073
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Nov 2021 20:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636834920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2F/RqjtwTDKHqbmFyTCtAaLezofMM+3SAjDwL4WYfjk=;
 b=ObfBA3ivQg63n7cg1OwWDy7Th7KAfdF7/jOJ+kxtSgvS4MwRL/RSpH44yq3hCvsOpNpch3
 9O81S2BDHCjyXyA9nilHx/0d1+WDqHu81U24GidkaCDD3c9gZ83aYei7+b92AYw1ftxUmc
 IPs83jIakZI//2jGk6GDgeU1XG4fhUw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-d4K3j09oMbiBXOMIJFVLyw-1; Sat, 13 Nov 2021 15:21:59 -0500
X-MC-Unique: d4K3j09oMbiBXOMIJFVLyw-1
Received: by mail-wm1-f71.google.com with SMTP id
 m14-20020a05600c3b0e00b0033308dcc933so6126502wms.7
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Nov 2021 12:21:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2F/RqjtwTDKHqbmFyTCtAaLezofMM+3SAjDwL4WYfjk=;
 b=Ew6OGoM95KT2Ba2jAFFWa4Iu6Z/5ymjNa8FuNYWFCJBsX0GrJY8BtGLcfx8r8AtkTR
 gfKW9q3d7N65PosRTjYQKrsUEkd8uwmRXb8YgxZJdIl+j6+iWcZ9EltLEHO0bQyf8Xu6
 AyLlQRjq9k2gOnfzA+IAalME+/SFa361BdNTIYeb4Os4sHWufnevr0vHi3QiuiZIMp36
 qAiGwdTUCz3/bkgnlGLCxz1ppcR236EcBnBREE5uKIiKhkQHLN31QyQJm9spIUuYpwAH
 vNvuih/fZqD44xUZtQKgLMI+Eqo0M2u/l1C3fRqYiOiOyvqQG3CXqVqd3jxU7Y/8pHmp
 /O8Q==
X-Gm-Message-State: AOAM533UfA9b6BuaWl22k6Z7tSpsMp+d5zn9k+M0RlYs/tqlzb0anah1
 +ATXQrlqv3enH5NJbMm7IZ/S/LvpLbuMSw2yGsdWzkQ9bRSMLoAjWacoACGOHaZZj+gcMLCRFEc
 mpuVJLhcuozUNoNWqiqg5aGxVkfPbMDpNJ3UQ/JXB7E8C
X-Received: by 2002:a5d:43c5:: with SMTP id v5mr31811220wrr.11.1636834918455; 
 Sat, 13 Nov 2021 12:21:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzvqhfKWTCnwIY4T3+XKKRpmPT2+dOSNYismuaVwHbxo7aKrTV7NWW08xEzDGvONPamHxoBM3Hbj1P73gNHmAk=
X-Received: by 2002:a5d:43c5:: with SMTP id v5mr31811191wrr.11.1636834918255; 
 Sat, 13 Nov 2021 12:21:58 -0800 (PST)
MIME-Version: 1.0
References: <CABvMjLTVZaU8vMW__2BDo6FnjFa_bsh2S-kEmg=KV4KTsFiUzA@mail.gmail.com>
In-Reply-To: <CABvMjLTVZaU8vMW__2BDo6FnjFa_bsh2S-kEmg=KV4KTsFiUzA@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Sat, 13 Nov 2021 21:21:47 +0100
Message-ID: <CACO55tuDQ9UC2rr=_Hsowvujk49oNK1zWfHj3jMnhEqsTAnh0Q@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/core: fix the uninitialized use in
 nvkm_ioctl_map()
To: Yizhuo Zhai <yzhai003@ucr.edu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

something seems to have messed with the patch so it doesn't apply correctly.

On Thu, Jun 17, 2021 at 9:39 AM Yizhuo Zhai <yzhai003@ucr.edu> wrote:
>
> In function nvkm_ioctl_map(), the variable "type" could be
> uninitialized if "nvkm_object_map()" returns error code,
> however, it does not check the return value and directly
> use the "type" in the if statement, which is potentially
> unsafe.
>
> Signed-off-by: Yizhuo <yzhai003@ucr.edu>
> ---
>  drivers/gpu/drm/nouveau/nvkm/core/ioctl.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
> b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
> index d777df5a64e6..7f2e8482f167 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
> @@ -266,6 +266,8 @@ nvkm_ioctl_map(struct nvkm_client *client,
>                 ret = nvkm_object_map(object, data, size, &type,
>                                       &args->v0.handle,
>                                       &args->v0.length);
> +               if (ret)
> +                       return ret;
>                 if (type == NVKM_OBJECT_MAP_IO)
>                         args->v0.type = NVIF_IOCTL_MAP_V0_IO;
>                 else
> --
> 2.17.1
>

