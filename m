Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EEF264EA5D
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 12:27:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 079C710E02A;
	Fri, 16 Dec 2022 11:27:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4F5D10E064
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 08:16:43 +0000 (UTC)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi
 [91.154.32.225])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5555C505;
 Fri, 16 Dec 2022 09:16:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1671178594;
 bh=MT1hlBIS0a4EJp9YRT7Z+ijRRjjKh3udXoS8Mk65bDI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Gx+jqJwN9rpzwnwkDP3z4S8qga9st1hPiT6zDBi6iBaW4SveHUiLD5GVR83naEUwg
 S0pzVXPy9gGm+a/dNuMvzgdIkOPlCxlsZ7legWgbOGKwFBWWi6nHHSarFbQetDqf9/
 Ln43a9mPKvVf8vx41oPg3XIZ6jpSCFwVUB6+suiE=
Message-ID: <3d40e68a-a47e-f967-346b-aa90d700ca56@ideasonboard.com>
Date: Fri, 16 Dec 2022 10:16:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] drm: tidss: Fix pixel format definition
Content-Language: en-US
To: Randolph Sapp <rs@ti.com>, jyri.sarha@iki.fi
References: <20221202001803.1765805-1-rs@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20221202001803.1765805-1-rs@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 16 Dec 2022 11:26:53 +0000
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
Cc: dri-devel@lists.freedesktop.org, a-bhatia1@ti.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/12/2022 02:18, Randolph Sapp wrote:
> There was a long-standing bug from a typo that created 2 ARGB1555 and
> ABGR1555 pixel format entries. Weston 10 has a sanity check that alerted
> me to this issue.
> 
> According to the Supported Pixel Data formats table we have the later
> entries should have been for Alpha-X instead.
> 
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>   drivers/gpu/drm/tidss/tidss_dispc.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
> index ad93acc9abd2..16301bdfead1 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
> @@ -1858,8 +1858,8 @@ static const struct {
>   	{ DRM_FORMAT_XBGR4444, 0x21, },
>   	{ DRM_FORMAT_RGBX4444, 0x22, },
>   
> -	{ DRM_FORMAT_ARGB1555, 0x25, },
> -	{ DRM_FORMAT_ABGR1555, 0x26, },
> +	{ DRM_FORMAT_XRGB1555, 0x25, },
> +	{ DRM_FORMAT_XBGR1555, 0x26, },
>   
>   	{ DRM_FORMAT_XRGB8888, 0x27, },
>   	{ DRM_FORMAT_XBGR8888, 0x28, },

Thanks, I'll apply to drm-misc.

  Tomi

