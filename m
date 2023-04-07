Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CD36DB1E9
	for <lists+dri-devel@lfdr.de>; Fri,  7 Apr 2023 19:40:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 974B810E0F1;
	Fri,  7 Apr 2023 17:40:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FF7510E0F1
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Apr 2023 17:40:18 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id d8so24874203pgm.3
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Apr 2023 10:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680889217; x=1683481217;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zKb29bg6tx4CJhhRnFeIAgI2BubugDeo6AhQSNXoOjk=;
 b=ZeOB4N2nMw/T0W+m53HyspppsYTatXHFUsBPQrdircDHtMw9efqiwwPC8ouTXD5mmu
 GzIE9+OQmYiyOhMOwdkgNlwXMnhivea/lDdwCLnEhl07OIkr/snh4v8BDsU9kj1pW442
 nnnpcNzvMbXmlSalIpGUu9AETBoPMxQmphh/+OqdyeCfBJcxrC7ktOmrrk6/7/r1m+Es
 GOkPApNDdYjVeFSF9RDu5xLGpCo5t/z41TOkPkYQO0CezUmwqryKvM+EXpH+WYgIMBzl
 8bN3+fxTUcGaPyn1TMdNEcmCoXvSL7igHt9YU+N2N+I6CBRUQdqN+oJfYsZBoM3wYp+A
 LiBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680889217; x=1683481217;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zKb29bg6tx4CJhhRnFeIAgI2BubugDeo6AhQSNXoOjk=;
 b=HMNtLfxg7/bJOBuQ+H1kMzyneEhRtuCeLCZjBj8sGx6MvlQXOFvrUo+n9zhT1R1bQ2
 ROS85maRrfQf8AqTadrHe64Y2MNOEbyl+p1S+RhKdsYvbZLSstS5hZhzN2PfSiWBTZUw
 pOJntP6x/riLd5xxysG33En5jJEhi+Oo9mtWtu2zGX16JDztNEt3o28vgpZZUGQErkER
 aYyrRTRPCQXpZNbu8F7Lry9joCi5/jDi365iprgTWWsfJKN9kfrsHr0AlbVVAbpsWk90
 tl/Eo9BNTn35xzbIy/XIpyDNJ+0aSCY9JrIcEII0oDI+XIJO/d8hgZ70xETD+x2OGWke
 c+1A==
X-Gm-Message-State: AAQBX9ee4PNjxpPhy8LeL+Hsw4hVSdJX3pNLKBPHLMPdWIQNmIDG9oAb
 F6y6rixiUbLbH4FeMHcTH1psv+k/RhDtyjbqpeCo4A==
X-Google-Smtp-Source: AKy350YUCzPBLxgYgXKQV3bzEg9zkHgzG9zgtpSVZEJ7BtTpjnG8NvJ6+yrbg54qCj108b33TAynRrQ6bp7uhOQcDco=
X-Received: by 2002:a65:578e:0:b0:513:a488:f05f with SMTP id
 b14-20020a65578e000000b00513a488f05fmr622511pgr.1.1680889217290; Fri, 07 Apr
 2023 10:40:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230321182414.1826372-1-trix@redhat.com>
In-Reply-To: <20230321182414.1826372-1-trix@redhat.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 7 Apr 2023 10:40:05 -0700
Message-ID: <CAKwvOdnrKujpv2A6a-6U6pxpd3Z9mKwV3SgD6ZL+ie4-g4n2-g@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: remove unused vmw_overlay function
To: Tom Rix <trix@redhat.com>
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
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nathan@kernel.org,
 linux-graphics-maintainer@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 21, 2023 at 11:24=E2=80=AFAM Tom Rix <trix@redhat.com> wrote:
>
> clang with W=3D1 reports
> drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c:56:35: error:
>   unused function 'vmw_overlay' [-Werror,-Wunused-function]
> static inline struct vmw_overlay *vmw_overlay(struct drm_device *dev)
>                                   ^
> This function is not used, so remove it.
>
> Signed-off-by: Tom Rix <trix@redhat.com>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c b/drivers/gpu/drm/vm=
wgfx/vmwgfx_overlay.c
> index 8d171d71cb8a..7e112319a23c 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
> @@ -53,12 +53,6 @@ struct vmw_overlay {
>         struct vmw_stream stream[VMW_MAX_NUM_STREAMS];
>  };
>
> -static inline struct vmw_overlay *vmw_overlay(struct drm_device *dev)
> -{
> -       struct vmw_private *dev_priv =3D vmw_priv(dev);
> -       return dev_priv ? dev_priv->overlay_priv : NULL;
> -}
> -
>  struct vmw_escape_header {
>         uint32_t cmd;
>         SVGAFifoCmdEscape body;
> --
> 2.27.0
>


--=20
Thanks,
~Nick Desaulniers
