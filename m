Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD2A792C85
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 19:35:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4DA410E20D;
	Tue,  5 Sep 2023 17:35:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B96E10E208;
 Tue,  5 Sep 2023 17:35:17 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-1ba5cda3530so2217365fac.3; 
 Tue, 05 Sep 2023 10:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693935316; x=1694540116; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1FxvOTJzHccsnhfhevNC+D3OUgDvfnGXsp9yKozqb5M=;
 b=MiwMGEp8CigC0E9qPFD7/sq9RBU9GIxi7NCWKHkoBqFEQE7xaXjMK5XaW/ojgDg9La
 viIQtxQ2/3Y7K9Lhgs45ak0F3H3iAJ+1PTrH3z7enddighUHcBKq7maVRIAmSwSpXtWI
 dw/doxQs/sJK8bwB2gcw9nyCW/lQQakHD9CSysHFN0TGPMuVwwK2F/RwLR5h/7Nr5e0r
 8bV1SHQHM1sWUZu//PPEhVaRE98LM/Xxj3TIktATQbESe05j6l3PcsLFtyvYK9vbld8h
 bZa0znc+IIuyigFgFxPn25m9RCaSM5e69leGhDRTsQxpxXE5CGNc9IXIeRIP1+HQ9MQf
 BPhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693935316; x=1694540116;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1FxvOTJzHccsnhfhevNC+D3OUgDvfnGXsp9yKozqb5M=;
 b=PduCOF1G63Ifzx4nQWVlWhmehzVodvctOo2HgQC0XtKGKFlQ7EafmSl6Cu0ZB8c+lo
 08UIMRIHw7lacGLM3eK1MTF5iu3p6TvD96REear3jC2jvbRhdfdK3ykp4nrgOrC+nuMU
 P9Ce6eZd9QRUvqaYOGC/r1xCpk6wdzFjwsD2peXNiKBrYAcpQTpGT+Td48sZqHZlR+Bf
 TqTYFpaSLIP5LF4W5Y5IXJEJ5Z4BlLbIA6vZTQ5k4fL3zc2Wbge38fYHW4fPZibgHB6W
 lRlqCc5hS0gIk0tl+s1T0sY9NY05Sp4qVqNiPMBLFy52wgyzgRi76BO1CfRHFQt+Vdus
 fGMA==
X-Gm-Message-State: AOJu0Yze+kuVKrweyKx91UjgE/LwQr0Pzk/yK97xwdjYytgzOebntkt7
 gL/p8TgdQIxzOlorP85mQhAwKRwv9UxX6vn+GVI=
X-Google-Smtp-Source: AGHT+IEULyA+SzmXMwXkfPZCbstLoINn2mglghTj/XDz8SKyIT1T4Pyv/4f9TM42hUyyoY8z/R2O0qI3j3HONe8VagU=
X-Received: by 2002:a05:6871:a718:b0:1c8:baa5:a50f with SMTP id
 wi24-20020a056871a71800b001c8baa5a50fmr13904768oab.27.1693935316680; Tue, 05
 Sep 2023 10:35:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230901005226.42307-1-yang.lee@linux.alibaba.com>
 <20230901005226.42307-4-yang.lee@linux.alibaba.com>
In-Reply-To: <20230901005226.42307-4-yang.lee@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 5 Sep 2023 13:35:05 -0400
Message-ID: <CADnq5_NnozGnxsrok+ne=WHWJPG82+sXu-+DP6bqJXt4p-hRdg@mail.gmail.com>
Subject: Re: [PATCH -next 4/4] drm/amd/display: Remove duplicated include in
 dcn35_clk_mgr.c
To: Yang Li <yang.lee@linux.alibaba.com>
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
Cc: Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Thu, Aug 31, 2023 at 8:52=E2=80=AFPM Yang Li <yang.lee@linux.alibaba.com=
> wrote:
>
> ./drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c: dcn35_clk=
_mgr.h is included more than once.
>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c=
 b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c
> index 3b2463c03694..9314e75195cd 100644
> --- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c
> +++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c
> @@ -46,7 +46,6 @@
>  /* TODO: remove this include once we ported over remaining clk mgr funct=
ions*/
>  #include "dcn30/dcn30_clk_mgr.h"
>  #include "dcn31/dcn31_clk_mgr.h"
> -#include "dcn35_clk_mgr.h"
>
>  #include "dc_dmub_srv.h"
>  #include "link.h"
> --
> 2.20.1.7.g153144c
>
