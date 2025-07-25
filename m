Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB8FB11813
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 07:50:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E77310E437;
	Fri, 25 Jul 2025 05:50:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z9gQxLqt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BF3D10E425;
 Fri, 25 Jul 2025 05:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753422614; x=1784958614;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=o86HXC8fS175u4T+p5NLxbkvugG8XecNDwVMDSSC+QA=;
 b=Z9gQxLqttE6Y41xl4uSHvTMvnAVh/wxSf0qdGjsjLDAhhZeyqGrgcyuZ
 ia3KAe45YKHTtxOqA/GSjw6xyUXdkMDrG0H5bGIDDacry0JOoSw8u/XZ+
 1IE/+pNnPvMQOkiaBLplEs4AUszij4jJl3vqc5hjf++5/1Lp+gG78NvEt
 DzKHi9GgX4gAiLgF2pUdq8p6yxi0OTQmlS1BvXDRm2BcJnbgLEbbbCsvM
 TLUuFRlmHQ4jROCJI8Lfrs/TITsFQb1qyvXeRjLKFWdi7t/3kmy01ki39
 q+a8QCZ9wC/DFZSnwaQHVqOiJSqcOqtt4j+cxY6wU/3+1y4NLpJ3XvgXC g==;
X-CSE-ConnectionGUID: t3D+j2owTuyJQ8bk/fpOoA==
X-CSE-MsgGUID: ROtHAntbQA2p88DrcYx40A==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="58371623"
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="58371623"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 22:50:14 -0700
X-CSE-ConnectionGUID: mmatlTa/TpuHp5ohl2/gfg==
X-CSE-MsgGUID: YfGJA1/8Smiw1RzWguPaDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="161453275"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 22:50:11 -0700
Date: Fri, 25 Jul 2025 08:50:08 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, aravind.iddamsetty@linux.intel.com,
 umesh.nerlige.ramappa@intel.com, frank.scarbrough@intel.com,
 sk.anirban@intel.com, simona.vetter@ffwll.ch
Subject: Re: [PATCH v6 6/9] drm/xe/doc: Document device wedged and runtime
 survivability
Message-ID: <aIMbEPlNhNjskITi@black.fi.intel.com>
References: <20250724143440.232862-1-riana.tauro@intel.com>
 <20250724143440.232862-7-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724143440.232862-7-riana.tauro@intel.com>
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

On Thu, Jul 24, 2025 at 08:04:35PM +0530, Riana Tauro wrote:
> Add documentation for vendor specific device wedged recovery method
> and runtime survivability.

...

>  /**
> + * DOC: Xe Device Wedging
> + *
> + * Xe driver uses drm device wedged uevent as documented in Documentation/gpu/drm-uapi.rst.
> + *
> + * When device is in wedged state, every IOCTL will be blocked and GT cannot be
> + * used. Certain critical errors like gt reset failure, firmware failures can cause
> + * the device to be wedged. The default recovery method for a wedged state
> + * is rebind/bus-reset.
> + *
> + * Another recovery method is vendor-specific. Below are the usecases that trigger
> + * vendor-specific drm device wedged uevent and the procedure to be performed
> + * to recover the device.
> + *
> + * Case 1: CSC firmware errors require a firmware flash to restore normal device
> + *         operation. Since firmware flash is a vendor-specific action
> + *         ``WEDGED=vendor-specific`` recovery method along with
> + *         :ref:`runtime survivability mode <xe-survivability-mode>` is used to
> + *         notify userspace. User can then initiate a firmware flash using userspace tools
> + *         like fwupd to restore device to normal situation.

s/situation/operation

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
