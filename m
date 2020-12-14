Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A472DA31D
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 23:16:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B9B96E14F;
	Mon, 14 Dec 2020 22:16:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2604889870;
 Mon, 14 Dec 2020 22:16:25 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id w124so17906964oia.6;
 Mon, 14 Dec 2020 14:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WM4JTaOWR+p/2SnX/T6Ubb1JtGVXnGdSAPZvQi9TwAs=;
 b=E33Wwcn2VZlheQPh/e2AI0PBVpVWKwQ9BHgyfc49y+9i8ENejnto2+VLazx1l9KNkA
 R2jvpc5ltga6Xtd+ZECTQA4Cdqq1Jor7hp13MCT+wIHGXGFOwDSgetSUpoJ+vJcfnF7P
 BIXfHbL1md+r+1mI+evD4waGAtfXeHJe+LTCz9mpD9SsWD1oLu91JXEAA5F3R8cZ0qtU
 gPq/R5S0ct/5EdaZLj/EpVm6TbujpIzWMMWMgnknQj0OEBgXVFAnpDdnWcrek5ldN4G0
 +BTV3Kaj8EXJxpqbkjcMgCzm/q9OH9+Z7wOrXXcBdtAJLobnkyVeHI0QJ3G7ivr/e+2L
 eWhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WM4JTaOWR+p/2SnX/T6Ubb1JtGVXnGdSAPZvQi9TwAs=;
 b=IBqurbq3ci3580oh9Ewdl7yBhJhnAgIYYpTw0Fp+9OIRuGhEZ54EhqU1+kaLEzMGFB
 JyFw2vd8uRuCANaVzvr9AXg3/lsrfKqE+FFKspqDpAmqTFou0P32jP8oQ0qXO7Ul03o0
 llFYNNgo7iqDPSGytVf/oC1EZUMZMOJ2rP5krleJPhwzn6R23hk6Ycja1EknTrEX4Y5R
 QblnO0q62zwchcMtMNJDG3+sz6XO5TXn333k3YOElNOQF2ZrE6y+ERu6IHt7i2oOho0H
 07E2IbioMdmAZ3AGYPv+EUUEQIQY/GvxxsS0xiiNJXhlt3fpNXczezjzVyy250G2xjPE
 +S5A==
X-Gm-Message-State: AOAM532zrulefasQFIr+5AYIZKIveoXZouJhltGMqZdsKfZ/gCZctkWX
 nP+bYkmc8uwyzkctlba6ooHXTiAXr+/ljV3vCD57ByXf
X-Google-Smtp-Source: ABdhPJwDhRQBEWCxbUkc4j66mNxq6TvusqyXVQtfSF5vOjZHgnrozxpuBaTXPock8HQDKiWwRZYCgIhpyTaEg9YV1Wo=
X-Received: by 2002:a54:4608:: with SMTP id p8mr19033063oip.5.1607984184497;
 Mon, 14 Dec 2020 14:16:24 -0800 (PST)
MIME-Version: 1.0
References: <1607784984-4542-1-git-send-email-jrdr.linux@gmail.com>
In-Reply-To: <1607784984-4542-1-git-send-email-jrdr.linux@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 14 Dec 2020 17:16:13 -0500
Message-ID: <CADnq5_M4XT40efcLO=b2MKJumyu4e01+CPaUN5DwgrNvNAnD1g@mail.gmail.com>
Subject: Re: [PATCH linux-next] drm/amd/display: Adding prototype for
 dccg21_update_dpp_dto()
To: Souptick Joarder <jrdr.linux@gmail.com>
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
Cc: "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@linux.ie>, Yongqiang Sun <yongqiang.sun@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, bindu.r@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Mon, Dec 14, 2020 at 3:18 AM Souptick Joarder <jrdr.linux@gmail.com> wrote:
>
> Kernel test robot throws below warning ->
>
> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_dccg.c:46:6:
> warning: no previous prototype for 'dccg21_update_dpp_dto'
> [-Wmissing-prototypes]
>
> Adding prototype for dccg21_update_dpp_dto().
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dcn21/dcn21_dccg.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_dccg.h b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_dccg.h
> index b7efa77..e44a374 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_dccg.h
> +++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_dccg.h
> @@ -32,5 +32,6 @@ struct dccg *dccg21_create(
>         const struct dccg_shift *dccg_shift,
>         const struct dccg_mask *dccg_mask);
>
> +void dccg21_update_dpp_dto(struct dccg *dccg, int dpp_inst, int req_dppclk);
>
>  #endif /* __DCN21_DCCG_H__ */
> --
> 1.9.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
