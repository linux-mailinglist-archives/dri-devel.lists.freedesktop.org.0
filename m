Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FCF622CAA
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 14:46:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EA6910E0F5;
	Wed,  9 Nov 2022 13:46:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D562A10E0F5
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Nov 2022 13:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
 In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VQx1siaQxkBjqZa/MpTPsALSLkYVRjwlzym2w2DVDU0=; b=M1DZitnpfgcu0U4XpL+M5jltFQ
 6GeeKJ3Fac7cZBbVoSmdOleEaLjtYHk3tP9sWSb4r46Jx0BpFVjFRNRSflw7/en5CEWZ++VRJbs37
 BDLDXUFwpPcP48XnbvsHGkTBYuJu5Hu6BXtPUQ8M/qu6ta4stILbExNbOtwRR7sPo2dcRw01knUwL
 wuDqM4LZGf6+bQ1QHAeTCeXRqHsfM+vjqF62sKwPemST+1tCalAQIH9VFzQW+X0ff0/5a9+7Zun7v
 JHGGj4gnJFfVfWRBHQDnVWTk0QVNe/7O6f7cICFlE57NI6/Eobp+gN5wb2aVxf5ijtXfH6qhpfXvJ
 268At6Lw==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtps 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1oslOv-00EyL6-9J; Wed, 09 Nov 2022 14:45:57 +0100
Received: from webmail.service.igalia.com ([192.168.21.45])
 by mail.igalia.com with esmtp (Exim)
 id 1oslOt-00BwOU-21; Wed, 09 Nov 2022 14:45:57 +0100
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
 by webmail.service.igalia.com with esmtp (Exim 4.94.2)
 (envelope-from <aemad@igalia.com>)
 id 1oslOs-006A7r-Dr; Wed, 09 Nov 2022 14:45:54 +0100
MIME-Version: 1.0
Date: Wed, 09 Nov 2022 14:45:54 +0100
From: aemad <aemad@igalia.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/vkms: change min cursor size to accept smaller values
In-Reply-To: <20221109113945.20938-1-aemad@igalia.com>
References: <20221109113945.20938-1-aemad@igalia.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <e7a6903ab65968adf468b953af903184@igalia.com>
X-Sender: aemad@igalia.com
Content-Type: text/plain; charset=US-ASCII
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
Cc: melissa.srw@gmail.com, hamohammed.sa@gmail.com, andrealmeid@igalia.com,
 mwen@igalia.com, rodrigosiqueiramelo@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sorry, for the noise. I had some issues in my git send-email setup.
Please, consider this version.

- Alaa

On 2022-11-09 12:39, Alaa Emad wrote:
> change min cursor size of vkms driver from 20 to 10, to increase the IGT test
> coverage of vkms by enabling 32x10 cursor size subtests in kms_cursor_crc
> 
> Signed-off-by: Alaa Emad <aemad@igalia.com>
> ---
>  drivers/gpu/drm/vkms/vkms_drv.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index 0a67b8073f7e..4a248567efb2 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -12,8 +12,8 @@
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_writeback.h>
>  
> -#define XRES_MIN    20
> -#define YRES_MIN    20
> +#define XRES_MIN    10
> +#define YRES_MIN    10
>  
>  #define XRES_DEF  1024
>  #define YRES_DEF   768
