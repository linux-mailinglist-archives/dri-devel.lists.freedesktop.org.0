Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E77F9F0E96
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 15:10:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EECDB10F01F;
	Fri, 13 Dec 2024 14:10:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kBzrJd4y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB12910E34E;
 Fri, 13 Dec 2024 14:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734099011; x=1765635011;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=tQUixa7++G0Mm0VJMH3JcQTbZYOq309GMrsay8fjXco=;
 b=kBzrJd4yEK//ECRFvcb9KA6cqVFvK3q+Vy2sRPC1iohz/gLmll0zmxDz
 tx3t6Oj749nwSGx3o1DpUjM4OTP7Q/fHQdNgZs7Xbw5mZLC8YttFh/s2I
 a/C0JeG4PxPyNDFgSF6WspUObK3M9eJbcXQy7bkn1wPG9Su6H4wRD+/+6
 t7TAGxlV7K4FdyUXmhZijbWPdge0mkhx+JSqMARRhk9FrSIRrazJYJYvA
 AwuR/+bYfQzdUp6pikQ2VcvfNslGixEn1Mq6YspV7pBdk1E55U8l5GTyg
 Y9pCNTJqg638I5ORkHb0rQmZibBmGKlgHp+1YClYKtDudRP39AfcSbcOM w==;
X-CSE-ConnectionGUID: loto/mAFS2SMbHSxvMOO+w==
X-CSE-MsgGUID: 6vRDobh4SdOla9VQ85fN4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="38229876"
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; d="scan'208";a="38229876"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 06:10:10 -0800
X-CSE-ConnectionGUID: qe2FaLtjSh6fv1+BuWSYZg==
X-CSE-MsgGUID: 6f3UuAjlQ7SEdWTaaT1UvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="101631675"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.110.169])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 06:10:10 -0800
Date: Fri, 13 Dec 2024 08:10:00 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>
Cc: Raag Jadav <raag.jadav@intel.com>, airlied@gmail.com, simona@ffwll.ch, 
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 andriy.shevchenko@linux.intel.com, 
 lina@asahilina.net, michal.wajdeczko@intel.com, christian.koenig@amd.com, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, 
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 alexander.deucher@amd.com, 
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com
Subject: Re: [PATCH 0/1] drm/amdgpu: Use device wedged event
Message-ID: <yzuvo3rl3tl2dzae3rdp3hvl2f6r3mbrafzljcro7srhtmumy5@vyv6vxp2nqpy>
References: <20241212190909.28559-1-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241212190909.28559-1-andrealmeid@igalia.com>
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

On Thu, Dec 12, 2024 at 04:09:08PM -0300, André Almeida wrote:
>Raag Jadav is introducing a new DRM API for generating "device wedged events",
>to notify userspace when the device needs userspace intervention after a GPU
>reset[1]. I did a simple patch to add support for it for amdgpu for the
>telemetry aspect of the event. Tested in Steam Deck. This patch requires [1] to
>be applied.
>
>Raag, if you are sending a v11 of your work you can carry this patch as well if
>you think it makes sense.

great, more users

when this started the plan was to merge it through drm-xe since xe was
the only user. Now we already have 3, so I think it makes sense to go
through drm-misc... I looked at the possible conflicts in i915 and xe
and they are minimal.

thanks
Lucas De Marchi

>
>[1] https://lore.kernel.org/dri-devel/20241128153707.1294347-1-raag.jadav@intel.com/
>
>André Almeida (1):
>  drm/amdgpu: Use device wedged event
>
> drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 3 +++
> 1 file changed, 3 insertions(+)
>
>-- 
>2.47.1
>
