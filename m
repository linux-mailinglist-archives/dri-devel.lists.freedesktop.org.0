Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 743434A6DED
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 10:38:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B736F10E49A;
	Wed,  2 Feb 2022 09:38:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4EB010E33E;
 Wed,  2 Feb 2022 09:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643794695; x=1675330695;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=waV+W+APtRrgdjuIriXoLF/Fm1T3LJnmBVTLBRl9yaQ=;
 b=T92+RyzyXQKbiC+M3CUBzmBPSHWeAk5J+ydhXLZNEbsK+SAeOHUP9/1q
 q6UCAA8n8Zak8xf2s65qs/fYKaqTpXHeqa395n1WbbsVmLgF1NWhE5iHv
 BcWL0kWWmA8G56z9PLwXz7lRFbGB2de212rzyBvsPhH1QHsGMuUF79E/E
 GQsARm2MREwlod7bfxC+MKmiuYjKlDNILxowE0iNDo4IHboF+J5jKehoh
 IiL+7bVzrqmq7SnF/XZnd8TJ5c06u6ggR1G7ngfezRPTcgh9VoGHdQcot
 YrhZpMMJ9VgVVSldAYdV/2cn4roel84wYmKbddnyVsjxiopYOb9foEqiE g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10245"; a="227848896"
X-IronPort-AV: E=Sophos;i="5.88,336,1635231600"; d="scan'208";a="227848896"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2022 01:38:15 -0800
X-IronPort-AV: E=Sophos;i="5.88,336,1635231600"; d="scan'208";a="538179312"
Received: from gkatwal-mobl2.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.209.122.110])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2022 01:38:14 -0800
Date: Wed, 2 Feb 2022 01:38:14 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [PATCH v2] dma-buf-map: Rename to iosys-map
Message-ID: <20220202093814.i5z2nmlunrwm2n6c@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220202091134.3565514-1-lucas.demarchi@intel.com>
 <514cdee2-655e-7e52-d6a5-a7176ee603cc@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <514cdee2-655e-7e52-d6a5-a7176ee603cc@amd.com>
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
Cc: airlied@linux.ie, gregkh@linuxfoundation.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, srinivas.kandagatla@linaro.org,
 tzimmermann@suse.de, daniel.vetter@ffwll.ch, nouveau@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 02, 2022 at 10:25:28AM +0100, Christian König wrote:
>Am 02.02.22 um 10:11 schrieb Lucas De Marchi:
>>[SNIP]
>>diff --git a/MAINTAINERS b/MAINTAINERS
>>index d03ad8da1f36..112676f11792 100644
>>--- a/MAINTAINERS
>>+++ b/MAINTAINERS
>>@@ -5675,7 +5675,6 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
>>  F:	Documentation/driver-api/dma-buf.rst
>>  F:	drivers/dma-buf/
>>  F:	include/linux/*fence.h
>
>Oh, that is not correct to begin with.

right, include/linux/dma-fence*

>
>>-F:	include/linux/dma-buf*
>
>That here should probably be changed to point directly to 
>include/linux/dma-buf.h, but that can come later on.

thanks for catching that. I will change it on next version and add your
(and any additional) ack.

Lucas De Marchi

>
>Feel free to add an Acked-by: Christian König 
><christian.koenig@amd.com> to the patch.
>
>If nobody objects I'm going to push it drm-misc-next and provide a 
>follow up to cleanup the MAINTAINERS file a bit more.
>
>Regards,
>Christian.
>
>>  F:	include/linux/dma-resv.h
>>  K:	\bdma_(?:buf|fence|resv)\b
>>@@ -9976,6 +9975,13 @@ F:	include/linux/iova.h
>>  F:	include/linux/of_iommu.h
>>  F:	include/uapi/linux/iommu.h
>>+IOSYS-MAP HELPERS
>>+M:	Thomas Zimmermann <tzimmermann@suse.de>
>>+L:	dri-devel@lists.freedesktop.org
>>+S:	Maintained
>>+T:	git git://anongit.freedesktop.org/drm/drm-misc
>>+F:	include/linux/iosys-map.h
>>+
>
