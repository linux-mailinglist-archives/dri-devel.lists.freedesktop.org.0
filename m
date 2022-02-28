Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FDA4C65C5
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 10:36:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 782DD10E26C;
	Mon, 28 Feb 2022 09:36:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FB2A10E26C
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 09:36:20 +0000 (UTC)
Received: from [192.168.1.111] (91-156-85-209.elisa-laajakaista.fi
 [91.156.85.209])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 28446478;
 Mon, 28 Feb 2022 10:36:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1646040977;
 bh=9xHAMfe5cP+Bn5+HCFryCq3zebr3kIe8n3BFKz3uQP4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=HHXZHcnQqTJwkikCSq714JL37wFd/UDLvOfilnT68RlC/1ob/qYsxj/j/6FJYpSdq
 x0UaRjaTF97f0Qe5KA4JOZPDl5CjlDoQUB9JY+vkIQ/ZkSBWsXYmskf0D9m1oadNh2
 Gr8uNYrPh/Vu4uyLidqHrTWwci/6HVabXdOpafiQ=
Message-ID: <0e10c717-145d-8ff9-54ef-d574c0a06289@ideasonboard.com>
Date: Mon, 28 Feb 2022 11:36:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/panel: simple: Initialize bpc in RK101II01D-CT panel
 descriptor
Content-Language: en-US
To: Rahul T R <r-ravikumar@ti.com>, thierry.reding@gmail.com
References: <20220210140300.11900-1-r-ravikumar@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20220210140300.11900-1-r-ravikumar@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com,
 sam@ravnborg.org, nikhil.nd@ti.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/02/2022 16:03, Rahul T R wrote:
> Initialize bpc while creating panel_desc structure for RK101II01D-CT
> 
> Below warning is triggered since bpc is not being initialized
> 
> WARNING: CPU: 2 PID: 47 at drivers/gpu/drm/panel/panel-simple.c:614
> panel_simple_probe+0x1b0/0x3c8
> 
> Signed-off-by: Rahul T R <r-ravikumar@ti.com>
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index c324a3ed34b9..c09eb5ad65fc 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -3058,6 +3058,7 @@ static const struct drm_display_mode rocktech_rk101ii01d_ct_mode = {
>   
>   static const struct panel_desc rocktech_rk101ii01d_ct = {
>   	.modes = &rocktech_rk101ii01d_ct_mode,
> +	.bpc = 8,
>   	.num_modes = 1,
>   	.size = {
>   		.width = 217,

Thanks, looks good to me. I'll apply to drm-misc-next.

  Tomi
