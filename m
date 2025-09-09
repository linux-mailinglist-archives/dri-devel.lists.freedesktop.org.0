Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75114B4A58C
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 10:39:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC22D10E657;
	Tue,  9 Sep 2025 08:39:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FGYWjT08";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38C6A10E657;
 Tue,  9 Sep 2025 08:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757407172; x=1788943172;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=gWonJVi/9yr0/0RffPlwfEP6HBgHDuyOQwJWfGRpPfE=;
 b=FGYWjT08RgNwIxe2Ti9UUvDo9R/Hgm0DlvZLlS1ks5AEk/zwOd4oFqnp
 slBOBuk8ZzG2W+kJh1AgzkqzpQv9oekShf3xNNDS4ebbFRIm7XYCMglrB
 dVFH3kxliHbe4Zh4ZWXTiFL2Iq8+0OYEHEoUL1d1iDlQxIV5SOVihiWPJ
 i3QZl7ERo0dRylPfLkmDOmKHxzZOLDVI3RglBMYcMSqfjCfaqJ47AptSg
 mfNZ++lNYfHuUGbt5hdaoG8iSbizljnzkTx7j25mtpcwmxNWeqcC8QAt5
 e3+jaflpLyNYDcG0GKD3ORiVNOQzQC/SSUkJxpw7VReFDqIwbzDU4QSwx Q==;
X-CSE-ConnectionGUID: 4wvySB4PQOWy75H5j58NxA==
X-CSE-MsgGUID: Rj13DNYyRzeDGS4q/hgWgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="59377372"
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; d="scan'208";a="59377372"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 01:39:29 -0700
X-CSE-ConnectionGUID: Cjp0XUmOSWKVTHXN06lZ4g==
X-CSE-MsgGUID: lF1VltcQQSWp29S0HEMbqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; d="scan'208";a="172899683"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.247])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 01:39:26 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Nemesa Garg <nemesa.garg@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: uma.shankar@intel.com
Subject: Re: [PATCH 00/10]  Introduce drm sharpness property
In-Reply-To: <fd486047085f57eaa516bd18d8266dcc4c591264@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250807092841.3169436-1-nemesa.garg@intel.com>
 <fd486047085f57eaa516bd18d8266dcc4c591264@intel.com>
Date: Tue, 09 Sep 2025 11:39:23 +0300
Message-ID: <4276f7899b3c9d10ab9638fc8d7653edf4f359bd@intel.com>
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

On Tue, 09 Sep 2025, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Thu, 07 Aug 2025, Nemesa Garg <nemesa.garg@intel.com> wrote:
>> Middleware MR link: https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/3665
>> IGT patchwork link: https://patchwork.freedesktop.org/series/130218/
>>
>> Continuing discussions from:  https://patchwork.freedesktop.org/series/129888/
>>
>> Got ack from kwin maintainer on the UAPI patch.
>
> The Mutter part seems stuck, though.

Also, do you have the link to reviewed and ready kwin enabling?

BR,
Jani.


-- 
Jani Nikula, Intel
