Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A783359B4E3
	for <lists+dri-devel@lfdr.de>; Sun, 21 Aug 2022 17:12:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 953758CF89;
	Sun, 21 Aug 2022 15:12:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E57D58CF40
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Aug 2022 15:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661094733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CjShao5KS7YTUwj6lZ8lmMaiescGPBNdHzi3GWQbqfo=;
 b=F7j4lkXvoZDexvx7Gkr+f8e+v82rwUTD4n11fy+QfdTAlt74/3IuDKPqQznN/lq5f9dw/D
 ICQBxfJ/oTFVuskhTUYSPNObyCghoW8rFvsNC8pIw2eTRnXPOTkJkTJmbGysU2zh8esvty
 HhDxoEp6FT44sMTej88TKxv9iC5PaQI=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-226-RGfYYfEEMBGFes8jRPzipg-1; Sun, 21 Aug 2022 11:12:11 -0400
X-MC-Unique: RGfYYfEEMBGFes8jRPzipg-1
Received: by mail-qk1-f197.google.com with SMTP id
 y17-20020a05620a25d100b006b66293d75aso7896575qko.17
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Aug 2022 08:12:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=CjShao5KS7YTUwj6lZ8lmMaiescGPBNdHzi3GWQbqfo=;
 b=WuSOJ8Fml8tBX9Pv16yyE7RpjfIz+/+HWdVRl4TybOS7RwVhV/2cSbYcyUtfnF3Q4J
 yrR8CPS5me9uqZ0Y23lAD8+9vQzOWe9FySnuOocdZ3D/tCdZwxBipCNMpy5N0LUSxYld
 sQttdtRIHAjQrLFqsZC1LKgGsA3JwQhGSUUdhe5H02IK86GkYTPCc54YPkNuJPDc7oCT
 s+P210JAu5D81VjoSCjRPC0jMiD/lyGcqOUG3CGDdZLa2FXKgLjuW68xbDeMugZF3cpT
 iBuAEEDjd2/0EycvWL+j3/Ef294VhBmA830vdMOSVQFoUnIoUjVUkMVluhyeRkB5VL6l
 oejw==
X-Gm-Message-State: ACgBeo0fLhhl4+ZM8TqDh1ZaxFquT73Ws5YAXK96/cKMFCr0fsrUpIv0
 anK3HjTvhvRlIIkl2tpZT9LDZ/M2B9LXXHOjKLDkCwXJodpkJSrzNR3DwUAHaNvifpnHqFV5KbT
 D6SYWJu7gqd1rAjV71Q30sCn9UjlXkRGErFO/gun5iIZI
X-Received: by 2002:a05:622a:110e:b0:343:6f02:99fd with SMTP id
 e14-20020a05622a110e00b003436f0299fdmr12672436qty.141.1661094731077; 
 Sun, 21 Aug 2022 08:12:11 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6Yo0YPKD7li1qO/+8j1V5fDwgE7RtNkUu23EP37Cq0Xx9xBuMRVvP/OGSR+LNvBObUlo8zk28WplryB0x2Lrs=
X-Received: by 2002:a05:622a:110e:b0:343:6f02:99fd with SMTP id
 e14-20020a05622a110e00b003436f0299fdmr12672425qty.141.1661094730890; Sun, 21
 Aug 2022 08:12:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220821143038.46589-1-wangjianli@cdjrlc.com>
In-Reply-To: <20220821143038.46589-1-wangjianli@cdjrlc.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Sun, 21 Aug 2022 17:12:00 +0200
Message-ID: <CACO55ttLv=RtyLHYdOjbQmNGE_DScd0hfn-_Sxoo5+yavAK9Kw@mail.gmail.com>
Subject: Re: [PATCH] subdev/clk: fix repeated words in comments
To: wangjianli <wangjianli@cdjrlc.com>
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
Cc: airlied@linux.ie, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bskeggs@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

thanks, and I'll push in a moment.

On Sun, Aug 21, 2022 at 4:34 PM wangjianli <wangjianli@cdjrlc.com> wrote:
>
>  Delete the redundant word 'at'.
>
> Signed-off-by: wangjianli <wangjianli@cdjrlc.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/clk/gm20b.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gm20b.c b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gm20b.c
> index a139dafffe06..7c33542f651b 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gm20b.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gm20b.c
> @@ -581,7 +581,7 @@ gm20b_clk_prog(struct nvkm_clk *base)
>
>         /*
>          * Interim step for changing DVFS detection settings: low enough
> -        * frequency to be safe at at DVFS coeff = 0.
> +        * frequency to be safe at DVFS coeff = 0.
>          *
>          * 1. If voltage is increasing:
>          * - safe frequency target matches the lowest - old - frequency
> --
> 2.36.1
>

