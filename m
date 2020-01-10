Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C881377C1
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2020 21:12:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4A4A6EA95;
	Fri, 10 Jan 2020 20:12:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B4D66EA94;
 Fri, 10 Jan 2020 20:12:24 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id y17so2981882wrh.5;
 Fri, 10 Jan 2020 12:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K3el6y+T0RooUufQva2UKoLvCa/zJA4NSqZwSQmCN20=;
 b=ed5UJ1jApV+AI+jMHZ3QvIBfgFZh68DmxMUXx4FaPSPa5zrUqHjwZEde/zlQx2aJel
 eTUdTIs0YDHKOvkRfkuqep8cWTAZZqUBrUhgYGD9Mqw/XxaeX4UDm4uWSF5VL1slx414
 Av7GlQ2pdvfBBYOAdYgWliohSviqNrp9Szy7Cy15I+12f3HeBZd4dwuW3UK1TivPYmQe
 SVeiY+8rqiuL5xO3tbXAeVhvasvBsLoEgGdaOxBXo6n9cDi0wirEoGxvG3wsCwPsXqt+
 D6PPnFg5VkY0CS46ZoBdMdVpgzSAArpwHk0FEMXjd1tEbpafbfiV/TQ5NGXe4lIH4RIP
 CQ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K3el6y+T0RooUufQva2UKoLvCa/zJA4NSqZwSQmCN20=;
 b=KYX4nyVZwid1PKD/uyoba/GLW1J0ADlbNMvtPXEc2Jem9Sc4AdTIQg2cTp7DW036Lp
 tzzvoh0ETFa2Y3V+jiF5s81MQlypdCIfQhWL/FTqUDTWyROT8ynq+Z9OCyL8I6KhT14t
 b7GfGwcffKgoOmen3X/3kTLJfps9KLfUf8iaY6TSR9bGmtmCEfmIfcuhke6qvepOTREV
 rkg2Ctkdy04QMH35zNGKTxlvQ7Ld6xmVh02M7TJYufokcNCcNYH9Ho0871v1EH8ZwDlS
 uXCGlkICtl701F+s4FRoTivpyzsHs/m5Mv3Q1t8XK9ilh2wlAXLHvwSCQJwPOS+siKxK
 0OuA==
X-Gm-Message-State: APjAAAWmwas2g2cxNbh3wgITgQO22pzwGLwp3oPZlUChQO5DnVC9H/OH
 lHV5B4+PGHcWzIVm/77O6sLV5tHDDJbm4peKrBA=
X-Google-Smtp-Source: APXvYqwVCXt2prbrvBhyw6CgcgtrW8taoJIPwfi/bM3cEGw7uIwMa9CmdAHHu1ia3cgbfQ24KGLaswapiHh0VmD8wOE=
X-Received: by 2002:a5d:46c7:: with SMTP id g7mr5124387wrs.11.1578687143141;
 Fri, 10 Jan 2020 12:12:23 -0800 (PST)
MIME-Version: 1.0
References: <20200110194123.3718-1-mikita.lipski@amd.com>
In-Reply-To: <20200110194123.3718-1-mikita.lipski@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 10 Jan 2020 15:12:11 -0500
Message-ID: <CADnq5_OrgCv4trx2GhgLWQOOWRm2DthrweFz-_+YB9W=xaxyfA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Fix compilation warnings on i386
To: "Lipski, Mikita" <mikita.lipski@amd.com>
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 10, 2020 at 2:41 PM <mikita.lipski@amd.com> wrote:
>
> From: Mikita Lipski <mikita.lipski@amd.com>
>
> [why]
> Compilation error "undefined reference to `__udivdi3'" was
> thrown on i386 architecture.
>
> [how]
> Use div_u64 for unsigned long division instead of a divide operator.
>
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Mikita Lipski <mikita.lipski@amd.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> index 5a476028ee37..52fb207393ef 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> @@ -533,7 +533,7 @@ static int kbps_to_peak_pbn(int kbps)
>         u64 peak_kbps = kbps;
>
>         peak_kbps *= 1006;
> -       peak_kbps /= 1000;
> +       peak_kbps = div_u64(peak_kbps, 1000);
>         return (int) DIV_ROUND_UP(peak_kbps * 64, (54 * 8 * 1000));
>  }
>
> @@ -565,7 +565,7 @@ static int bpp_x16_from_pbn(struct dsc_mst_fairness_params param, int pbn)
>         struct dc_dsc_config dsc_config;
>         u64 kbps;
>
> -       kbps = (u64)pbn * 994 * 8 * 54 / 64;
> +       kbps = div_u64((u64)pbn * 994 * 8 * 54, 64);
>         dc_dsc_compute_config(
>                         param.sink->ctx->dc->res_pool->dscs[0],
>                         &param.sink->sink_dsc_caps.dsc_dec_caps,
> --
> 2.17.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
