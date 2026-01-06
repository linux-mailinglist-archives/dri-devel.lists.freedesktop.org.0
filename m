Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F93CF7455
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 09:19:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1546510E4A4;
	Tue,  6 Jan 2026 08:19:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="olOtO2Uf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D00210E4A4
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 08:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rVNR0cYTxQ9ufzArC3Y57RYQ5I56tZ5iRRa5bwq7icU=; b=olOtO2Uf3imdkT0SnDQHyR6Tb1
 mivrk34tjPGddr5QRwdmDoGSjU0yzw2XeU/290TWbi3t6Z7n4FTz5bOtM1OWkY4md0WbB6Xw493xY
 rBGww5Gjt4QnHLApZldiGu4hwdQP4JNl3rV7gATf8QElrf7ldhRZIbBzGFon/Go2Q3HhsbL8/EI1C
 jUVFfP8vjA5Ybc+4Mal5HcYfLR+dnD2akqQaDUuf4DoxFDehcRdr37ohYGUwtTZWD4YFuCe+/+J/3
 wpU6MGAwXPWs5vcQx+CxeqyGIe5HX7NiqmYCsxr0YC7MB8CNgPhKpupGnMKpdNdt/opf1POfk6X3v
 CnDk+wiA==;
Received: from [90.240.106.137] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vd2Hh-0025aN-12; Tue, 06 Jan 2026 09:19:21 +0100
Message-ID: <cb73c2c6-be68-42bc-96e1-f6595f9dd0ed@igalia.com>
Date: Tue, 6 Jan 2026 08:19:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/panic: Fix expected string for QR_CODE in
 drm_panic_type_map
To: Nathan Chancellor <nathan@kernel.org>,
 Jocelyn Falempe <jfalempe@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260105-drm_panic-handle-invalid-drm_panic_screen-v1-0-55228bd4b0f8@kernel.org>
 <20260105-drm_panic-handle-invalid-drm_panic_screen-v1-2-55228bd4b0f8@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20260105-drm_panic-handle-invalid-drm_panic_screen-v1-2-55228bd4b0f8@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 06/01/2026 06:19, Nathan Chancellor wrote:
> The help text of CONFIG_DRM_PANIC_SCREEN_QR_CODE documents the expected
> value to CONFIG_DRM_PANIC_SCREEN as "qr_code" but drm_panic_type_map
> checks for "qr". Adjust drm_panic_type_map and the module description to
> match so that existing configurations do not stop working.
> 
> Fixes: e85e9ccf3f84 ("drm/panic: Report invalid or unsupported panic modes")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>   drivers/gpu/drm/drm_panic.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index 0cd574dd9d88..d6d3b8d85dea 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -823,7 +823,7 @@ static const char *drm_panic_type_map[] = {
>   	[DRM_PANIC_TYPE_KMSG] = "kmsg",
>   	[DRM_PANIC_TYPE_USER] = "user",
>   #if IS_ENABLED(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
> -	[DRM_PANIC_TYPE_QR] = "qr",
> +	[DRM_PANIC_TYPE_QR] = "qr_code",
>   #endif
>   };
>   
> @@ -855,7 +855,7 @@ static const struct kernel_param_ops drm_panic_ops = {
>   module_param_cb(panic_screen, &drm_panic_ops, NULL, 0644);
>   MODULE_PARM_DESC(panic_screen,
>   #if IS_ENABLED(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
> -		 "Choose what will be displayed by drm_panic, 'user', 'kmsg' or 'qr' [default="
> +		 "Choose what will be displayed by drm_panic, 'user', 'kmsg' or 'qr_code' [default="
>   #else
>   		 "Choose what will be displayed by drm_panic, 'user' or 'kmsg' [default="
>   #endif
> 

Looks like I mistyped when refactoring. Should have used copy and paste, 
sorry about that.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

