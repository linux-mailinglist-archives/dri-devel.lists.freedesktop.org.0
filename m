Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 909718A6845
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 12:25:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1102112B98;
	Tue, 16 Apr 2024 10:25:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UOa9Fjcd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F8E8112B98;
 Tue, 16 Apr 2024 10:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713263138; x=1744799138;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=1zR+UT0PEnYWjAVbYzA6OHhHC0bd9DVY2vzWigPPEng=;
 b=UOa9FjcdaZbxBr0yQypihOSE19FVud56JVS0S6AIOft2UTygZV1sP73M
 7exfaEyx2/duU9aA5TnD9kBeYgfjHIRTAAi+slpXl9yAU79q9r9WKNFTc
 0v6Mpznd0P9AMQJGq4K6puIrCQkYFiQj/wa0QFZj/0mZbsYLfdB/X9Phz
 fGGKQF+T2ZiECFqkMOy3uEV7F5OKpBlnEc2kwX/7MurlG/xIBijf3Gp7l
 LkUUNKlSeovIfiDVkJnN6DhZh7vXknzyZwoB4XmRy/rQHdV6Emr3ozjtu
 AvwhljITu7elBl2UDYUyTKx9GLVbWAJpKX/RjI5EL5W226LD1ZtLfXxk1 w==;
X-CSE-ConnectionGUID: BVQ81cPgRNOYc7znwuQAWg==
X-CSE-MsgGUID: n36Hz0TTTfGlynQmjljwvQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8802605"
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="8802605"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 03:25:37 -0700
X-CSE-ConnectionGUID: vHlNDGNiR56kTrGkIUcOyQ==
X-CSE-MsgGUID: zLWYAK6FSzuSr2rBGtWRKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; d="scan'208";a="26873975"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 03:25:36 -0700
Message-ID: <3f16f54b-f922-4f54-a459-fc175bafef2c@linux.intel.com>
Date: Tue, 16 Apr 2024 15:58:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] drm: add devm release action
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
To: intel-xe@lists.freedesktop.org, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, lucas.demarchi@intel.com
Cc: dri-devel@lists.freedesktop.org, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 maarten.lankhorst@linux.intel.com
References: <20240402085859.1591264-1-aravind.iddamsetty@linux.intel.com>
 <20240402085859.1591264-2-aravind.iddamsetty@linux.intel.com>
Content-Language: en-US
In-Reply-To: <20240402085859.1591264-2-aravind.iddamsetty@linux.intel.com>
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

Hi Daniel/ Maarten,

Could you please ack this patch.

Thanks,
Aravind.


On 02/04/24 14:28, Aravind Iddamsetty wrote:
> In scenarios where drm_dev_put is directly called by driver we want to
> release devm_drm_dev_init_release action associated with struct
> drm_device.
>
> v2: Directly expose the original function, instead of introducing a
> helper (Rodrigo)
>
> Cc: Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_drv.c | 6 ++++++
>  include/drm/drm_drv.h     | 2 ++
>  2 files changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 243cacb3575c..ba60cbb0725f 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -714,6 +714,12 @@ static int devm_drm_dev_init(struct device *parent,
>  					devm_drm_dev_init_release, dev);
>  }
>  
> +void devm_drm_dev_release_action(struct drm_device *dev)
> +{
> +	devm_release_action(dev->dev, devm_drm_dev_init_release, dev);
> +}
> +EXPORT_SYMBOL(devm_drm_dev_release_action);
> +
>  void *__devm_drm_dev_alloc(struct device *parent,
>  			   const struct drm_driver *driver,
>  			   size_t size, size_t offset)
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index 8878260d7529..fa9123684874 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -444,6 +444,8 @@ struct drm_driver {
>  	const struct file_operations *fops;
>  };
>  
> +void devm_drm_dev_release_action(struct drm_device *dev);
> +
>  void *__devm_drm_dev_alloc(struct device *parent,
>  			   const struct drm_driver *driver,
>  			   size_t size, size_t offset);
