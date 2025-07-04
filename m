Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3F5AF9ADF
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 20:48:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7C4F10E0A9;
	Fri,  4 Jul 2025 18:47:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nJir+V19";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AF0E10E0A9
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 18:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751654877; x=1783190877;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=NSaO2apjXwtcWw4syJtVpN33arr+z2MJifsHr5e1p1E=;
 b=nJir+V19vO7+Uw1mh1ursLrqA/x6eC3mtewDNBZAqqDwU2/1Rs0WztOJ
 BhOouitY39ZGlQRacFmT1HaiYB5f+4bYS9bCyo4AArl+Y97MNsDJrT41L
 wYdOhvrVuujvipHVCfV9Tu2ApngtDblCNm7SBa9eWRhxwrVDzPCMojBod
 8xo/wTc0MuhSO0ik0Ge6WasS/c/lq0D0VZotGJ2IjpU9CTlDP/fSETnK4
 4803MmKmUddjn7Ic4QRK8ijdB6uDp4tI3PUIeu44wEuD77tWZrHkfKaFB
 +I6UmwY0NsrLUkQQjbBF/Ng/7BRYFIUUWqW8Kdwz8UCsBbgI2eNzNMzyO Q==;
X-CSE-ConnectionGUID: a+VArPY4Sdyyc5ef5TK8Og==
X-CSE-MsgGUID: yD/obPBqT3+W8eAYz3Fe8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="71423405"
X-IronPort-AV: E=Sophos;i="6.16,288,1744095600"; d="scan'208";a="71423405"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 11:47:57 -0700
X-CSE-ConnectionGUID: jx51j8d2SZSdVmpIUssKlA==
X-CSE-MsgGUID: HdnMEGU0QyCjqXfPWl18qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,288,1744095600"; d="scan'208";a="160370322"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 11:47:54 -0700
Date: Fri, 4 Jul 2025 21:47:50 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 airlied@gmail.com, simona@ffwll.ch,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com
Subject: Re: [PATCH v3 2/3] drm: Add missing struct drm_wedge_task_info
 kernel doc
Message-ID: <aGgh1vYPsAmexvOn@black.fi.intel.com>
References: <20250627171715.438304-1-andrealmeid@igalia.com>
 <20250627171715.438304-2-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250627171715.438304-2-andrealmeid@igalia.com>
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

On Fri, Jun 27, 2025 at 02:17:14PM -0300, André Almeida wrote:
> Fix the following kernel doc warning:
> 
> include/drm/drm_device.h:40: warning: Function parameter or struct member 'pid' not described in 'drm_wedge_task_info'
> include/drm/drm_device.h:40: warning: Function parameter or struct member 'comm' not described in 'drm_wedge_task_info'
> 
> Fixes: 183bccafa176 ("drm: Create a task info option for wedge events")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
> v3: Make it consistent with drm_device member description
> v2: Add Reported-by tag
> ---
>  include/drm/drm_device.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index 08b3b2467c4c..73dd3c5470a4 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -35,7 +35,9 @@ struct pci_controller;
>   * struct drm_wedge_task_info - information about the guilty task of a wedge dev
>   */
>  struct drm_wedge_task_info {
> + 	/** @pid: the pid of the task */

Nit: Can be simply "pid of the task" without initial "the".

>  	pid_t pid;
> + 	/** @comm: the command name of the task */

Ditto.

>  	char comm[TASK_COMM_LEN];

But in any case,

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
