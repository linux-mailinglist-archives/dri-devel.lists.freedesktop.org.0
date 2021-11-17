Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B26D4454F75
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 22:37:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F29716E7D9;
	Wed, 17 Nov 2021 21:37:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 372756E5C3;
 Wed, 17 Nov 2021 21:37:29 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id m6so9446407oim.2;
 Wed, 17 Nov 2021 13:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tHOwXEnDhV5Lvn6fLJ2J3Qhjgh4hCRR8agBgNQdVXZo=;
 b=NFensp/cPA1OEmRZGoPLqFgBRN1fZFlowMUN/UgDPdZ2bmau6h0cglZJfZf+KmUaiz
 D7O6bNxG3UK48cf+vA75tbzvqNf6wZNLGTOW5KblF4m8QXavEPRW2IJkyZ9WYDoXUje5
 wUW3r+CGqW9LCB+hKbLrekgHKSr43AipIWgTFARQAQ+VgCtiiyfccoYcNsDu633V3ek4
 ++asU6mqQbVMthUt8b0WYRQOZualKKRrETSaf3rQpDmaNIXI1dVo/yqYNt3K77/MGDHk
 pvT3xbnYACMVe/EL7fjSq/ZAINvB3C3ozwJ9vsDDBlhlILWgi1iB75+3Ug99PRNhMmO1
 pYOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tHOwXEnDhV5Lvn6fLJ2J3Qhjgh4hCRR8agBgNQdVXZo=;
 b=BJqmnWcqYvLVLyPrFc0jHfh9sXA/INKTO7IYpGUtzgXY/c+p5YluhI4UxxB1ECEFOS
 ffPHoyD+/jgPasvcGgsRmt7t1KLO2HZa5Vhq7FZ9EHMM2enZQYXpWcpbHgnkQlsoD2uy
 4CMw8SUwLEecy60Kzfv5CtrUmrebSKSf1RtscRz40YG7ewAlmIYyNRU7dsQZw8nfGczC
 d6cw2JfrNoH0DtG98YX+AupsWJo3oqrtZrhp6vaEqw/6vjiqu3hTmrjLnOTavJFCvQjG
 RICzAEXmK1vyXFYEfQ0RKe451ZWBZUvK9p65eLy5wd7mQ6gXYmIhOrh5pvWMTMDUoS1L
 PFOw==
X-Gm-Message-State: AOAM532K4oQg880PMBGcsmi9fAbmGXBirSygYKbtBj2Q8vPNtilwL6zj
 x8iQr3W5yzWN0xdMWWV6E/dDaJSgYpf03FVEYuEb/OyU
X-Google-Smtp-Source: ABdhPJzbXpk+qQXxYSsMkmiv0w/FcSu60ld82pff+Qlf7gVvLN1Q+pDkS9xdiSJjE9Bc+5St9N49Dque5mpBKwgxYHk=
X-Received: by 2002:a05:6808:300b:: with SMTP id
 ay11mr2845056oib.120.1637185048503; 
 Wed, 17 Nov 2021 13:37:28 -0800 (PST)
MIME-Version: 1.0
References: <20211116014752.26868-1-bernard@vivo.com>
In-Reply-To: <20211116014752.26868-1-bernard@vivo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 17 Nov 2021 16:37:17 -0500
Message-ID: <CADnq5_PisDB6f8AuUcw2q36mCp7O6dnFDw5od_MGHziMX_Gtgg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: remove no need NULL check before kfree
To: Bernard Zhao <bernard@vivo.com>
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
Cc: Solomon Chiu <solomon.chiu@amd.com>, Leo Li <sunpeng.li@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, "Li,
 Roman" <Roman.Li@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Atufa Khan <Atufa.Khan@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Eric Bernstein <Eric.Bernstein@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jimmy Kizito <Jimmy.Kizito@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Mon, Nov 15, 2021 at 8:48 PM Bernard Zhao <bernard@vivo.com> wrote:
>
> This change is to cleanup the code a bit.
>
> Signed-off-by: Bernard Zhao <bernard@vivo.com>
> ---
>  .../drm/amd/display/dc/dcn10/dcn10_resource.c  | 18 ++++++------------
>  1 file changed, 6 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
> index f37551e00023..0090550d4aee 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
> @@ -978,10 +978,8 @@ static void dcn10_resource_destruct(struct dcn10_resource_pool *pool)
>                 pool->base.mpc = NULL;
>         }
>
> -       if (pool->base.hubbub != NULL) {
> -               kfree(pool->base.hubbub);
> -               pool->base.hubbub = NULL;
> -       }
> +       kfree(pool->base.hubbub);
> +       pool->base.hubbub = NULL;
>
>         for (i = 0; i < pool->base.pipe_count; i++) {
>                 if (pool->base.opps[i] != NULL)
> @@ -1011,14 +1009,10 @@ static void dcn10_resource_destruct(struct dcn10_resource_pool *pool)
>         for (i = 0; i < pool->base.res_cap->num_ddc; i++) {
>                 if (pool->base.engines[i] != NULL)
>                         dce110_engine_destroy(&pool->base.engines[i]);
> -               if (pool->base.hw_i2cs[i] != NULL) {
> -                       kfree(pool->base.hw_i2cs[i]);
> -                       pool->base.hw_i2cs[i] = NULL;
> -               }
> -               if (pool->base.sw_i2cs[i] != NULL) {
> -                       kfree(pool->base.sw_i2cs[i]);
> -                       pool->base.sw_i2cs[i] = NULL;
> -               }
> +               kfree(pool->base.hw_i2cs[i]);
> +               pool->base.hw_i2cs[i] = NULL;
> +               kfree(pool->base.sw_i2cs[i]);
> +               pool->base.sw_i2cs[i] = NULL;
>         }
>
>         for (i = 0; i < pool->base.audio_count; i++) {
> --
> 2.33.1
>
