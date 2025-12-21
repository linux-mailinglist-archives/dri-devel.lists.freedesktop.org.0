Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A42ECD39A4
	for <lists+dri-devel@lfdr.de>; Sun, 21 Dec 2025 02:41:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BE9010E26C;
	Sun, 21 Dec 2025 01:41:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="Vg04UThH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39C1A10E26C
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Dec 2025 01:41:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1766281269; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=TEdOqg6tSQMoH79xyoKLuLZKZ5jThMim+cPRuJMIoPI7Yq5LPCldJGCPY9/vdGbE3Xrq6o6EK2tIZ3E/St0Vvj5OivIaDbg82TYMcwtQnHDfG0UE7YILoC26zST3G5B9iR+GRMuRH/Gh4GdkpNzE6HawURZpVoGly+LZlMu7Ao8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1766281269;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=VEfJqgjlsfWkVlJ0bggK3IdexNGZVPJR2uryoKYi8W0=; 
 b=n6QRP7CQHCO8vhhjHJZaF2fsDMfjxBACvUIPjEuXt8ejtS/f39ZJtS86YE/pdmKUHR806kENJAv3C4FoKkO1LnRHLlgwzlgHwAcUQEStpOL5ecl2+SvCaspXuHMzoBScyHWZxH0zpBonkRyhwx09aUCfaS7XvoMQ3KMbiOJg6J4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766281269; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=VEfJqgjlsfWkVlJ0bggK3IdexNGZVPJR2uryoKYi8W0=;
 b=Vg04UThHjuat6bJDTPplWeYo3am+jML0tgIixPRCEPgp8k5M7mfVKG5n2rT3bWH7
 2DuZGAcVUVRaDN63SXGR64wY+DS3DeLsl7TJ02Gz4MnrHAM4Hs6Njh8qRVehQw6fXR9
 tGVw6dZOnR3UISCrxyxCJ0anzUD4fMKwgE0VGTKQ=
Received: by mx.zohomail.com with SMTPS id 1766281268614454.4595233985998;
 Sat, 20 Dec 2025 17:41:08 -0800 (PST)
Date: Sun, 21 Dec 2025 01:41:01 +0000
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Biju <biju.das.au@gmail.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, 
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] drm/panfrost: Add GPU_PM_RT support for RZ/G3E SoC
Message-ID: <7j5tokzlfv3sjmauuz6pwks5h7wys4j64spb2pdd7zph27cuan@v2q6tmehz6d7>
References: <20251203125104.67596-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251203125104.67596-1-biju.das.jz@bp.renesas.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03.12.2025 12:51, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> RZ/G3E SoC is embedded with Mali-G52 GPU system. The system hangs after
> STR in the following condition:
>
> STR -> Wakeup from STR -> Unload panfrost using 'modprobe -r panfrost'.
>
> Fix this issue by asserting/deasserting the reset during suspend/resume.
> Rename the variable allwinner_h616_data->default_pm_rt_data for data
> reuse and make it as generic GPU PM runtime data.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index 7d8c7c337606..e553f183c780 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -976,7 +976,7 @@ static const struct panfrost_compatible default_data = {
>  	.pm_domain_names = NULL,
>  };
>
> -static const struct panfrost_compatible allwinner_h616_data = {
> +static const struct panfrost_compatible default_pm_rt_data = {
>  	.num_supplies = ARRAY_SIZE(default_supplies) - 1,
>  	.supply_names = default_supplies,
>  	.num_pm_domains = 1,
> @@ -1056,6 +1056,7 @@ static const struct of_device_id dt_match[] = {
>  	  .data = &amlogic_data, },
>  	{ .compatible = "amlogic,meson-g12a-mali",
>  	  .data = &amlogic_data, },
> +	{ .compatible = "renesas,r9a09g047-mali", .data = &default_pm_rt_data },
>  	{ .compatible = "arm,mali-t604", .data = &default_data, },
>  	{ .compatible = "arm,mali-t624", .data = &default_data, },
>  	{ .compatible = "arm,mali-t628", .data = &default_data, },
> @@ -1073,7 +1074,7 @@ static const struct of_device_id dt_match[] = {
>  	{ .compatible = "mediatek,mt8188-mali", .data = &mediatek_mt8188_data },
>  	{ .compatible = "mediatek,mt8192-mali", .data = &mediatek_mt8192_data },
>  	{ .compatible = "mediatek,mt8370-mali", .data = &mediatek_mt8370_data },
> -	{ .compatible = "allwinner,sun50i-h616-mali", .data = &allwinner_h616_data },
> +	{ .compatible = "allwinner,sun50i-h616-mali", .data = &default_pm_rt_data },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, dt_match);
> --
> 2.43.0

Queued to drm-misc-next.
