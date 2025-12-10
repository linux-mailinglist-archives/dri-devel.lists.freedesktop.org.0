Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2ED1CB28B1
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 10:24:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 219A510E6B1;
	Wed, 10 Dec 2025 09:24:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EOeACA1v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1327B10E6B1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 09:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765358681; x=1796894681;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=JTYSrIp71N4/bjL4AjHCoMznHzJ+5y8+msCNWXzoV30=;
 b=EOeACA1vIxa3uqT9Qpj7PzGf6av28sPHE1WDUAMkp1pX9vJzq+elfRri
 Q/ufV59sHdW5pm0zmmMjFmtrpUBxa6tk4YzRGr2yrmVQfZAxWzkgn/BKq
 W3Sxj5D+YGa96wc1CWtnvDKEBVhhFIhcJ7MS+xDbUsNuajYFAxxFPmMQ/
 BBZ04D6ibFevrXQE0G6Qfgjf9YqtizcK63NRr5v5Kb63jUO1Joxf+L4Dy
 3JIUSnVVOvXX2XYNY4bjXW4QP+VqEC0vtStetPbvBDDBTpQCeeAEMG4i5
 rJtn15rcyZUqGJUeAHaAVTZ6Vd4yjhx8GzCY7+rqoxfgveg8QPYet2fwp g==;
X-CSE-ConnectionGUID: mG0/0EQLSyuxnEyCth4vOw==
X-CSE-MsgGUID: ji/6Jn6DQeaXAB9ICKxOuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67499378"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="67499378"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 01:24:41 -0800
X-CSE-ConnectionGUID: QzNO4neJRH2R8lKuhgxGWQ==
X-CSE-MsgGUID: FLHNxtXiSnCnmQVQkfJCgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="219807332"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.207])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 01:24:39 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 0/4] drm/Kconfig: cleanups
In-Reply-To: <e9a8f838-0721-4ba4-bc07-022193b53646@lankhorst.se>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1762251845.git.jani.nikula@intel.com>
 <e9a8f838-0721-4ba4-bc07-022193b53646@lankhorst.se>
Date: Wed, 10 Dec 2025 11:24:36 +0200
Message-ID: <979691bfe7215c53d0f97206514b3f9947e84649@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 09 Dec 2025, Maarten Lankhorst <dev@lankhorst.se> wrote:
> Reviewed-by: Maarten Lankhorst <dev@lankhorst.se>

Thanks, pushed to drm-misc-next.

BR,
Jani.


>
> Den 2025-11-04 kl. 11:25, skrev Jani Nikula:
>> Clean up drm/Kconfig a bit.
>>
>> Jani Nikula (4):
>>   drm/hyperv: move Kconfig under driver directory
>>   drm/vgem: move Kconfig under driver directory
>>   drm/Kconfig: move generic Kconfig options above drivers
>>   drm/Kconfig: sort driver Kconfig source list
>>
>>  drivers/gpu/drm/Kconfig        | 199 ++++++++++-----------------------
>>  drivers/gpu/drm/hyperv/Kconfig |  14 +++
>>  drivers/gpu/drm/vgem/Kconfig   |   9 ++
>>  3 files changed, 82 insertions(+), 140 deletions(-)
>>  create mode 100644 drivers/gpu/drm/hyperv/Kconfig
>>  create mode 100644 drivers/gpu/drm/vgem/Kconfig
>>
>

-- 
Jani Nikula, Intel
