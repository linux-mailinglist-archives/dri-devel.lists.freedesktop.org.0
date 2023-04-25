Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 066206EDFB3
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 11:49:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 395B810E06C;
	Tue, 25 Apr 2023 09:49:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E3F210E04C;
 Tue, 25 Apr 2023 09:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682416163; x=1713952163;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=dviDGhpTuVf0PGn08Gqr578cxUg1TBbJ9lP0yx4/wtg=;
 b=ZaZ9nBzGkcFCNtfCXnONK8dnpBheYQdgqr/WPvj1dGVtmWuxDXtUw3QG
 WE8DL8xTDnz++vI8bcCt2mHavKK9EGCxhv5e41bE84uaVUNmlqiUWl6IO
 kiO0draYCC4OpmVvib+oVfTlY6VRfLiey3A5ZakJ2m0hGe/kAmTTKtUVI
 4sb3vn2M3ViWyn4GiXiYVIQC1jfOLTptzRThBUoDTyxWHQ6UPzjQf4gp1
 KwPMDrNYqXA6/nadwZHSSEfjXzpCRozTcxtiVKIfK00fTCaqgwzE1FgEM
 DSDWe+GsW6Qk5SZR6riF1vSJr2yc38Q7xRWFjKfNrFGFczbrIM2JZAul1 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="348627762"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; d="scan'208";a="348627762"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 02:49:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="817608599"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; d="scan'208";a="817608599"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.249.37.23])
 ([10.249.37.23])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 02:49:17 -0700
Message-ID: <3eb67267-10ae-4615-4fc0-938a13fe5168@linux.intel.com>
Date: Tue, 25 Apr 2023 11:49:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 0/2] drm/i915/mtl: Add PTE encode functions
To: fei.yang@intel.com, intel-gfx@lists.freedesktop.org
References: <20230424182902.3663500-1-fei.yang@intel.com>
Content-Language: en-US
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <20230424182902.3663500-1-fei.yang@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 4/24/2023 8:29 PM, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
>
> Extract PTE patch from https://patchwork.freedesktop.org/series/116868/
> to fix MTL boot issue caused by MOCS/PAT update.
>
> v2: address comment from Matt.
>
> Fei Yang (2):
>    drm/i915/mtl: Add PTE encode function
>    drm/i915/mtl: workaround coherency issue for Media


Pushed this to drm-intel-gt-next. Thanks for unblocking MTL.



>
>   drivers/gpu/drm/i915/display/intel_dpt.c  |  2 +-
>   drivers/gpu/drm/i915/gem/i915_gem_pages.c |  5 ++-
>   drivers/gpu/drm/i915/gt/gen8_ppgtt.c      | 45 +++++++++++++++++++----
>   drivers/gpu/drm/i915/gt/intel_ggtt.c      | 36 ++++++++++++++++--
>   drivers/gpu/drm/i915/gt/intel_gtt.h       | 12 +++++-
>   drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c | 13 +++++++
>   drivers/gpu/drm/i915/gt/uc/intel_guc.c    |  7 ++++
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c |  6 +++
>   8 files changed, 112 insertions(+), 14 deletions(-)
>
