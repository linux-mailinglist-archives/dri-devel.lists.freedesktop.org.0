Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 575BB845457
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 10:42:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DC2E10EAEE;
	Thu,  1 Feb 2024 09:42:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4E2410EAE1;
 Thu,  1 Feb 2024 09:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706780546; x=1738316546;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ldU/ZE3jpYwQ4gbc0uyFTN9HYclVkaecSlxUoMDXkxU=;
 b=A8zmFKgQGePhFWXOsoW/9U9sY/7WgOZl9EiEI2Odes9au/t8da3PGbmk
 H4tmJGXltaKa6MnXV7mkBCgd1N5HsW6wThs3xw24GhoN/KIlJ8PCa5AQS
 K1kPrYEsqSFX7R0UpUBK82GzLVHU5hLS7PABF9pE7CXgMKPp5r+uMU1ZO
 HmxIhScJoUPTYYD1XtxtD6w6MOXknMo3fQeJBmrsvfpy8+sG+MR5BDv89
 0NnYxyRFI0IvCsz+i93WzXTjGRTitS1TO/EeRMl+sxIcMHMHJeWrPV4ti
 ujDmzj1wd+HxInlUG6CC77Y6Mw5sNI63j4RztzHQAwn2MTqmKT4Ov3/Jb g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="3719295"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="3719295"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 01:42:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="879060417"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="879060417"
Received: from aragners-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.43.111])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 01:42:16 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Danilo Krummrich <dakr@redhat.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/6] drm/nouveau/svm: remove unused but set variables
In-Reply-To: <4ba66e36-f4a8-4c5e-af88-bc47157b5c03@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1704908087.git.jani.nikula@intel.com>
 <8b133e7ec0e9aef728be301ac019c5ddcb3bbf51.1704908087.git.jani.nikula@intel.com>
 <4ba66e36-f4a8-4c5e-af88-bc47157b5c03@redhat.com>
Date: Thu, 01 Feb 2024 11:42:13 +0200
Message-ID: <87il38h66i.fsf@intel.com>
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Karol Herbst <kherbst@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 31 Jan 2024, Danilo Krummrich <dakr@redhat.com> wrote:
> On 1/10/24 18:39, Jani Nikula wrote:
>> Fix the W=1 warning -Wunused-but-set-variable.
>> 
>> Cc: Karol Herbst <kherbst@redhat.com>
>> Cc: Lyude Paul <lyude@redhat.com>
>> Cc: Danilo Krummrich <dakr@redhat.com>
>> Cc: nouveau@lists.freedesktop.org
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Reviewed-by: Danilo Krummrich <dakr@redhat.com>

Thanks, pushed to drm-misc-next.


-- 
Jani Nikula, Intel
