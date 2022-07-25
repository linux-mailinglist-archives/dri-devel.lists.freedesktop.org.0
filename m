Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8CD58064C
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 23:19:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C4AC91861;
	Mon, 25 Jul 2022 21:19:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC05890D3A;
 Mon, 25 Jul 2022 21:19:05 +0000 (UTC)
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4LsCbF11XMzDv8s;
 Mon, 25 Jul 2022 21:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1658783945; bh=n8KC9Drv4LKMFsBlQF+V/6Us88hfUAPAucCxIVuKi0o=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Ff/7NQNayLHZj2xi3k3jPw9YWd5yay3T3dsFLkYjl/ezUP7Oo1hhmKI33GIwZD2bf
 4U0r/WDXv5oXmu7x9+fDBd5Hgj5K/WHeMRCuWzN4YxJPTlie5pvWK694H45xmXKyVA
 Ha+HomJT0L2T9pNUwliOcrV+5dHIQ2wfkL42Y/GE=
X-Riseup-User-ID: 6F9E402A612CAA97A7CF1A67268526495D3C6D9BDB0ED2759DF8CFF0AE335770
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews1.riseup.net (Postfix) with ESMTPSA id 4LsCb72N42z5vTk;
 Mon, 25 Jul 2022 21:18:59 +0000 (UTC)
Message-ID: <c6ef24e5-b090-fab7-a749-e259ad711012@riseup.net>
Date: Mon, 25 Jul 2022 18:18:56 -0300
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] drm/amd/display: change variables type
Content-Language: en-US
To: Magali Lemes <magalilemes00@gmail.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@linux.ie,
 daniel@ffwll.ch
References: <20220725181559.250030-1-magalilemes00@gmail.com>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>
In-Reply-To: <20220725181559.250030-1-magalilemes00@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: siqueirajordao@riseup.net, tales.aparecida@gmail.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, mwen@igalia.com,
 dri-devel@lists.freedesktop.org, isabbasso@riseup.net, andrealmeid@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Magali

On 7/25/22 15:15, Magali Lemes wrote:
> As "dcn3_15_soc" and "dcn3_16_soc" are of type "struct
> _vcs_dpi_soc_bounding_box_st", change their types accordingly.
> 
> Signed-off-by: Magali Lemes <magalilemes00@gmail.com>
> ---

Great catch! To the whole series:

Reviewed-by: Maíra Canal <mairacanal@riseup.net>

Best Regards,
- Maíra Canal

>  drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.h | 2 +-
>  drivers/gpu/drm/amd/display/dc/dcn316/dcn316_resource.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.h b/drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.h
> index 39929fa67a51..45276317c057 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.h
> +++ b/drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.h
> @@ -32,7 +32,7 @@
>  	container_of(pool, struct dcn315_resource_pool, base)
>  
>  extern struct _vcs_dpi_ip_params_st dcn3_15_ip;
> -extern struct _vcs_dpi_ip_params_st dcn3_15_soc;
> +extern struct _vcs_dpi_soc_bounding_box_st dcn3_15_soc;
>  
>  struct dcn315_resource_pool {
>  	struct resource_pool base;
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn316/dcn316_resource.h b/drivers/gpu/drm/amd/display/dc/dcn316/dcn316_resource.h
> index 0dc5a6c13ae7..d2234aac5449 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn316/dcn316_resource.h
> +++ b/drivers/gpu/drm/amd/display/dc/dcn316/dcn316_resource.h
> @@ -32,7 +32,7 @@
>  	container_of(pool, struct dcn316_resource_pool, base)
>  
>  extern struct _vcs_dpi_ip_params_st dcn3_16_ip;
> -extern struct _vcs_dpi_ip_params_st dcn3_16_soc;
> +extern struct _vcs_dpi_soc_bounding_box_st dcn3_16_soc;
>  
>  struct dcn316_resource_pool {
>  	struct resource_pool base;
