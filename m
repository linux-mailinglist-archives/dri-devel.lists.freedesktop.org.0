Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15930AB4396
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 20:37:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C72110E493;
	Mon, 12 May 2025 18:37:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BalHoIkP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8507310E492;
 Mon, 12 May 2025 18:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747075031; x=1778611031;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=V6/A2+RPCIUIQLcxtTCK7QdC1pnW1hlHvfVaLXm/ky0=;
 b=BalHoIkPstxtSMLRB609bbQKteuCRNWbLje9fO/pSwCNTPKbQQXm/y6X
 cu4edHhgHEVf0YDLTHwIjWf3EzXPJ4IV+rhA+fBwkBiGfvYGTx4KBkPIk
 eT/jYORxhF2HLIgna2iXFICmIIfq0DylTeLFYrNKgdA0PkRLlZ3VK9WWe
 3MKn6sdhF5MzTv/l5cSRcj2lOm0Oa56zZhfqy0GlAckZNs7gfFgDX+pCI
 ga0HCVCK0sN+FxBiECcsrv/IFFA8wEFGvzVBxM/+HaVb/bSpNDJTRex+i
 0gn2L3GK8jsYMHTtK7NH9ZylYBS2cKW2SURdZEv2IIywMTPHCogXjHlyP g==;
X-CSE-ConnectionGUID: VKwcjCNgRfuGf4+UpKQa3g==
X-CSE-MsgGUID: jYGYM3dHSn2oS1dL9ShRDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="48883941"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="48883941"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 11:37:08 -0700
X-CSE-ConnectionGUID: OoRlbdaERlSO23xZjhjMJw==
X-CSE-MsgGUID: yp++5YOQTvyecN9aypMRpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="137298516"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 11:37:03 -0700
Date: Mon, 12 May 2025 21:37:00 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 siqueira@igalia.com, airlied@gmail.com, simona@ffwll.ch,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 Xaver Hugl <xaver.hugl@gmail.com>,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v2 2/3] drm/doc: Add a section about "App information"
 for the wedge API
Message-ID: <aCI_zIJXm6rV5RO5@black.fi.intel.com>
References: <20250511224745.834446-1-andrealmeid@igalia.com>
 <20250511224745.834446-3-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250511224745.834446-3-andrealmeid@igalia.com>
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

On Sun, May 11, 2025 at 07:47:44PM -0300, André Almeida wrote:
> Add a section about "App information" for the wedge API.
> 
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
>  Documentation/gpu/drm-uapi.rst | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> index 69f72e71a96e..826abe265a24 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -446,6 +446,21 @@ telemetry information (devcoredump, syslog). This is useful because the first
>  hang is usually the most critical one which can result in consequential hangs or
>  complete wedging.
>  
> +App information
> +---------------
> +
> +The information about which application (if any) caused the device to get in the

I'm wondering if we should change the wording to "application involved in device
wedging", or can we guarantee it to be the cause?

My limited understanding is that we'd still need the full dump to find the cause,
if it's possible to also note here.

Raag

> +wedge state is useful for userspace if they want to notify the user about what
> +happened (e.g. the compositor display a message to the user "The <app name>
> +caused a graphical error and the system recovered") or to implement policies
> +(e.g. the daemon may "ban" an app that keeps resetting the device). If the app
> +information is not available, the uevent will display as ``PID=-1`` and
> +``APP=none``. Otherwise, ``PID`` and ``APP`` will advertise about the guilty
> +app.
> +
> +The reliability of this information is driver and hardware specific, and should
> +be taken with a caution regarding it's precision.
> +
>  Consumer prerequisites
>  ----------------------
>  
> -- 
> 2.49.0
> 
