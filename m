Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AC8AC0D94
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 16:07:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08B8310E732;
	Thu, 22 May 2025 14:07:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="K1dDjXeE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CB7810EF0F
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 14:06:59 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1C5A6605;
 Thu, 22 May 2025 16:06:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1747922793;
 bh=Pp+0WI4KVMPMC1aLKziFoXuVm2ds8cB+cqIQ4CFIyMc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=K1dDjXeEsU5I7iqBo5TqZyTpd4Y+AP7c+TEDSaP1oGmRaG/2fhPYRQp/vTa7oIRcA
 sVGb4O/3bjnuROtXV9pbE4nveQJjKbFCzzZIIN3GXgHjztTF8dFmhL9azh1c3iJt9h
 VR6SpmC3xQNMXU70VUeG0ueLO2/5OIsSkvQFrnxM=
Message-ID: <cdb5ad54-c02a-420d-acf6-c11f39c6c58a@ideasonboard.com>
Date: Thu, 22 May 2025 17:06:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] drm: renesas: rcar-du: use proper naming for R-Car
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-renesas-soc@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org
References: <20250522103530.51972-2-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <20250522103530.51972-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi,

On 22/05/2025 13:34, Wolfram Sang wrote:
> Not RCAR, but R-Car.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.h b/drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.h
> index f9893d7d6dfc..e9e59c5e70d5 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.h
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.h
> @@ -16,7 +16,7 @@ struct rcar_du_format_info;
>  struct rcar_du_group;
>  
>  /*
> - * The RCAR DU has 8 hardware planes, shared between primary and overlay planes.
> + * The R-Car DU has 8 hardware planes, shared between primary and overlay planes.
>   * As using overlay planes requires at least one of the CRTCs being enabled, no
>   * more than 7 overlay planes can be available. We thus create 1 primary plane
>   * per CRTC and 7 overlay planes, for a total of up to 9 KMS planes.

Thanks, pushed to drm-misc-next.

 Tomi

