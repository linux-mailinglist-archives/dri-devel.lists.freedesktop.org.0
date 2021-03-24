Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F51348530
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 00:20:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1094D6EABD;
	Wed, 24 Mar 2021 23:20:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A56686EABD;
 Wed, 24 Mar 2021 23:20:33 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id z1so349267ybf.6;
 Wed, 24 Mar 2021 16:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Waeg5goT6Kdiuo5kcj7A+VSlRRFbVYj1KRURUA32Oh8=;
 b=t9OMcHgyLQ9LOWW8TRWHwi2BZrnk+Y3VbI96CfY0cwrR7anE3GG6FpsbGEuJ3iOnyZ
 fKZznJ0ItxNhHuRL8gaVUev5973Mdp59V/o7c1bM2qnc5eoQ8dVVc5mz4hwVoxNHVTvN
 W60dvLYptezJaTn+8R80fz58Bhkv0YadksE3Q3GsV6lCQm5C1IH5z/OGfK3o3HG7s4+p
 lE4hOqJN4rkArZxKxWKWKvHfytdrBI3IWsw0Gq3RXxdAiaMQlStURXuhyJQ4OM8LWKxH
 6V52uGVWsoipGQ4kacBT1hoPfkdJnwCN+v9WCTq8hyqdePqj25Fd17wIb9ARR2IF2VTw
 uJ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Waeg5goT6Kdiuo5kcj7A+VSlRRFbVYj1KRURUA32Oh8=;
 b=C/WfXD7KbktipvsSnNKO0Fxy4Y8XKj2guIrZObmsOYM+x/WSMORc9mekHd8Lb2o0kn
 7+2COg1na2QxhM8iI9Io5+39RvsEnVl7s/CThkI3oaDRS802/l89sa/dJehJfWsDTJoX
 TV7RPPb90tBz/QIG79MKYjISmGxeb9u+Baj34kGgMBABlv7Pwuzs09+ulMrQadkNPxGm
 4JzZorRvOgfJZPuMuIdJMTjmrOAfW7Zy4UG7aikImqrQu79eK4BR9lqgz1HWZ28YbXlx
 WfngjQ8QHvtRALEW6S1gNB8H3Ga3z7dN6DGdRccFY8TfnEiiYisOOK7nkPS+F1v25YWq
 uRxg==
X-Gm-Message-State: AOAM5336Bv3M2gYtpIF+yibXEbBw8BYoB1OPLltntpBd4REyrcwApSjv
 b6pHXJfnDBUZG5ZeNTQCaiOes/qgEdUUmA46oHs=
X-Google-Smtp-Source: ABdhPJweQ4JMcUYq19dE/Z3VSmtDPQ4jERg6NBOzXkLvnmMIB3aMa5kFuF+zEUn7UlrzfPx9lI7HD5glI5mIRiJtSDM=
X-Received: by 2002:a25:38c5:: with SMTP id f188mr8303809yba.178.1616628032898; 
 Wed, 24 Mar 2021 16:20:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210323074857.38818-1-zou_wei@huawei.com>
In-Reply-To: <20210323074857.38818-1-zou_wei@huawei.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Thu, 25 Mar 2021 09:20:21 +1000
Message-ID: <CACAvsv4QztVux4VfPjLB4BMeLEL2+LePgFLVDVS7=4GMbx995g@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH -next] drm/nouveau/core/client: Mark
 nvkm_uclient_sclass with static keyword
To: Zou Wei <zou_wei@huawei.com>
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
Cc: Dave Airlie <airlied@linux.ie>, ML nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 23 Mar 2021 at 17:03, Zou Wei <zou_wei@huawei.com> wrote:
>
> Fix the following sparse warning:
>
> drivers/gpu/drm/nouveau/nvkm/core/client.c:64:1: warning: symbol 'nvkm_uclient_sclass' was not declared. Should it be static?
>
> Signed-off-by: Zou Wei <zou_wei@huawei.com>
Applied, thanks.

> ---
>  drivers/gpu/drm/nouveau/nvkm/core/client.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/core/client.c b/drivers/gpu/drm/nouveau/nvkm/core/client.c
> index ac671202919e..0c8c55c73b12 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/core/client.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/core/client.c
> @@ -60,7 +60,7 @@ nvkm_uclient_new(const struct nvkm_oclass *oclass, void *argv, u32 argc,
>         return 0;
>  }
>
> -const struct nvkm_sclass
> +static const struct nvkm_sclass
>  nvkm_uclient_sclass = {
>         .oclass = NVIF_CLASS_CLIENT,
>         .minver = 0,
> --
> 2.17.1
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
