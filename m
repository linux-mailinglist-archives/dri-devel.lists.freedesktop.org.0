Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8FC7A14E4
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 06:54:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F119110E0BE;
	Fri, 15 Sep 2023 04:54:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5229D10E04F
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 04:54:46 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1c364fb8a4cso15958465ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 21:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694753686; x=1695358486;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ToW+0xnZZSn2haYogSaseRbGCEN/c/VaxynOQEBf2ck=;
 b=bu+fNzpb97DRq/51XqPO0HE9ObGYESTwTiaj3X34uzpmqbTderARtlFfx6ApwK/SHS
 s3z+IzprU4fKOiKaSxoz8b1n7fp9FQdYMbbeTgN4ObmwcdZ4915QWQ24jbGD0LI8D0uN
 Dp3XPKzPVeyX0N07gmgShGh7Jk/p3Lcyje7vc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694753686; x=1695358486;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ToW+0xnZZSn2haYogSaseRbGCEN/c/VaxynOQEBf2ck=;
 b=t8q3/hukp+aKc3p4FMQi3gaIlGCgxS53k8mM20EPtvX5vyV8kZufsHQkW0XULCNwVg
 QOX/HT4x2d18HXJ+hZLDb0XKwOk7w55yZEUorJWBO/99yS+aLIzKWYzZpzs3EpK3arUz
 EeLjDclKYUQAxBCV2I/iFAASEUrYIJKejvrn6X134q+g0qyYQBiP8MbroDwwJn8YCFK9
 T4JFq+Xs/6mKR1GS1f6LK8tvD6ZaiWCvRVBBrVeF9GC0TlmqpBZN5nE+usxuP+HJXAqv
 Ifq/BekqP8Gdkc8DdnDArPbI01OA9IuqNN/YLQJMdFVCdsSaf5Clz/FF1XVEivmRCDVt
 o9Rw==
X-Gm-Message-State: AOJu0YzMRSuZ6VfGId3QxyV0Pma3Bq2Nc1gc+OgdIhFMeAHr3OvldMPH
 BJSD8SINWDowTLn4YTsv6R/QXg==
X-Google-Smtp-Source: AGHT+IEcCPpurVZaVmMfJTxE+QBrjIRFGRhM4z9e+DIud9rnr99x7LR9itVZkiVtL8ZoPc40jrO71A==
X-Received: by 2002:a17:903:2447:b0:1c3:a396:25ae with SMTP id
 l7-20020a170903244700b001c3a39625aemr647937pls.56.1694753685862; 
 Thu, 14 Sep 2023 21:54:45 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 q23-20020a170902789700b001b8a3dd5a4asm2425048pll.283.2023.09.14.21.54.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 21:54:45 -0700 (PDT)
Date: Thu, 14 Sep 2023 21:54:44 -0700
From: Kees Cook <keescook@chromium.org>
To: Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH] drm/nouveau/nvif: refactor deprecated strncpy
Message-ID: <202309142139.1C068523@keescook>
References: <20230914-strncpy-drivers-gpu-drm-nouveau-nvif-client-c-v1-1-dc3b3719fcb4@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230914-strncpy-drivers-gpu-drm-nouveau-nvif-client-c-v1-1-dc3b3719fcb4@google.com>
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
Cc: Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 14, 2023 at 09:30:37PM +0000, Justin Stitt wrote:
> `strncpy` is deprecated and as such we should prefer more robust and
> less ambiguous string interfaces.
> 
> A suitable replacement is `strscpy_pad` due to the fact that it
> guarantees NUL-termination on the destination buffer whilst also
> maintaining the NUL-padding behavior that `strncpy` provides. I am not
> sure whether NUL-padding is strictly needed but I see in
> `nvif_object_ctor()` args is memcpy'd elsewhere so I figured we'd keep
> the same functionality.
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
> Note: build-tested only.
> ---
>  drivers/gpu/drm/nouveau/nvif/client.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvif/client.c b/drivers/gpu/drm/nouveau/nvif/client.c
> index a3264a0e933a..3a27245f467f 100644
> --- a/drivers/gpu/drm/nouveau/nvif/client.c
> +++ b/drivers/gpu/drm/nouveau/nvif/client.c
> @@ -69,7 +69,7 @@ nvif_client_ctor(struct nvif_client *parent, const char *name, u64 device,
>  	} nop = {};
>  	int ret;
>  
> -	strncpy(args.name, name, sizeof(args.name));
> +	strscpy_pad(args.name, name, sizeof(args.name));
>  	ret = nvif_object_ctor(parent != client ? &parent->object : NULL,
>  			       name ? name : "nvifClient", 0,
>  			       NVIF_CLASS_CLIENT, &args, sizeof(args),

Right, I see the memcpy too:

nvif_object_ctor(struct nvif_object *parent, const char *name, u32 handle,
                 s32 oclass, void *data, u32 size, struct nvif_object *object)
{
	...
                memcpy(args->new.data, data, size);

However, "args" is already zeroed:

        struct nvif_client_v0 args = { .device = device };

So there's no need for _pad(). However, I couldn't immediatley see
why args.name must be %NUL terminated. It's ultimately passed through
an ioctl:

        return client->driver->ioctl(client->object.priv, data, size, hack);

But I did find it...

args is:

struct nvif_client_v0 {
	...
        char  name[32];
};

And "name" only ever comes through nvif_client_ctor(), which all end up
via here, using "cli":

struct nouveau_cli {
	...
        char name[32];
...


        snprintf(cli->name, sizeof(cli->name), "%s", sname);
	...
                ret = nvif_client_ctor(&drm->master.base, cli->name, device,
                                       &cli->base);

So we'll always be %NUL terminated.

Therefore, yes, conversion looks good:

Reviewed-by: Kees Cook <keescook@chromium.org>

Thanks!

-Kees

> 
> ---
> base-commit: 3669558bdf354cd352be955ef2764cde6a9bf5ec
> change-id: 20230914-strncpy-drivers-gpu-drm-nouveau-nvif-client-c-82b023c36953
> 
> Best regards,
> --
> Justin Stitt <justinstitt@google.com>
> 

-- 
Kees Cook
