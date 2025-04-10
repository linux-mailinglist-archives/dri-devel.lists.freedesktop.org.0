Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8D7A84C03
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 20:21:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BBB510E12B;
	Thu, 10 Apr 2025 18:21:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com
 [95.215.58.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EB1810E12B
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 18:21:17 +0000 (UTC)
Date: Thu, 10 Apr 2025 14:21:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
 s=key1; t=1744309271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iklVYSYu+XLZ9B7gQ8qjBlByZo1mDFQ7QGjWdhOskLI=;
 b=iAL42bgi7VQedq1edpAM5Qu765pjbCc4VjbWLz6ZJJMnSlaXdahPhDfCXvk9f8egA59TuM
 dmUiGQxrl+9Ipg4ZoYUmhILvAzC3V6jBnfBQiW8CNZXI8hhOazX1Pgy7uVgN4XpxFfvMqF
 CxYRHy5sIzCGshbQOdDCFP5xKKI70dYD1hVyiB6uig3nwXlnJcy93goFwMrCqP0/k8OB06
 hEf3wC2j+lLb5B+/z5MFaqyJhka1AhaVaLv75tUCtXd8HFYQqb+50Y9cWWxMi2RDwXbvpz
 sIgGREW97y5/fQbrZ0V6oBz7kahwjjsdPu6/9o01kOKV8j/0spyBgv8tAJgDAw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Aditya Garg <gargaditya08@live.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 Lizhi Hou <lizhi.hou@amd.com>, Aun-Ali Zaidi <admin@kodeit.net>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/appletbdrm: Make appletbdrm depend on X86
Message-ID: <Z_gMD-9fzszuv2GL@blossom>
References: <PN3PR01MB95970778982F28E4A3751392B8B72@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PN3PR01MB95970778982F28E4A3751392B8B72@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
X-Migadu-Flow: FLOW_OUT
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

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

Le Thu , Apr 10, 2025 at 11:50:01PM +0530, Aditya Garg a écrit :
> From: Aditya Garg <gargaditya08@live.com>
> 
> The appletbdrm driver is exclusively for Touch Bars on x86 Intel Macs.
> The M1 Macs have a separate driver. So, lets avoid compiling it for
> other architectures.
> 
> Signed-off-by: Aditya Garg <gargaditya08@live.com>
> ---
>  drivers/gpu/drm/tiny/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
> index 95c1457d7..d66681d0e 100644
> --- a/drivers/gpu/drm/tiny/Kconfig
> +++ b/drivers/gpu/drm/tiny/Kconfig
> @@ -3,6 +3,7 @@
>  config DRM_APPLETBDRM
>  	tristate "DRM support for Apple Touch Bars"
>  	depends on DRM && USB && MMU
> +	depends on X86 || COMPILE_TEST
>  	select DRM_GEM_SHMEM_HELPER
>  	select DRM_KMS_HELPER
>  	help
> -- 
> 2.49.0
> 
