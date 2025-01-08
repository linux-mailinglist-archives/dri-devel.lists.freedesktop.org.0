Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BF1A065A8
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 20:57:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B639110E1C0;
	Wed,  8 Jan 2025 19:57:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XZjdNNG8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AF4F10E1C0;
 Wed,  8 Jan 2025 19:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736366244; x=1767902244;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=CrZ1Gl72cz8JXOtL7kQqLi7FbqVbTMkTsGE/9xLgeX0=;
 b=XZjdNNG8ulPs+eQvtQFoN11FClMqv9sS2mNx3wnEayhs1jPWtiMTvv3n
 JfEoYoxtFbZFMAzcNAi7Yk4C2fqX2UfwDEf2zJqIpplP+OaNV7xwYq0yc
 Z6f36uQVtEGZCywzDuUXnCDaeQAeXva/mKVKGeDl9UWK1g4eX7JeUwQVq
 /SkjSqAfUucMpJtnTGyCEyZcWlz+4jmYtOBR85+fEF44EVvxid9AnjUrE
 x5/Qzm6C+OF3h7eL3+ZPqHrrDghrZUPJbbZqZ9rO85wOJgCrASO6UVH17
 ORNEAlz9MEDw5qSs2VGzNBLZviM4NL3XeaZKVOo2L+x/VhGKEBgzxrXYO w==;
X-CSE-ConnectionGUID: F47hnvgFS+uHOkdbwUCXPA==
X-CSE-MsgGUID: aN5oHlHSTCuNd7/J2dbHww==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="36770584"
X-IronPort-AV: E=Sophos;i="6.12,299,1728975600"; d="scan'208";a="36770584"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2025 11:57:24 -0800
X-CSE-ConnectionGUID: 3Ak9sWhkQbWCu/B1aOdtBw==
X-CSE-MsgGUID: oW97IeCuSmuQ51EK4EKBtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,299,1728975600"; d="scan'208";a="134036299"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.111.0])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2025 11:57:23 -0800
Date: Wed, 8 Jan 2025 13:57:17 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 badal.nilawar@intel.com, vinay.belgaumkar@intel.com, 
 Michal Mrozek <michal.mrozek@intel.com>, Szymon Morek <szymon.morek@intel.com>,
 =?utf-8?B?Sm9zw6k=?= Roberto de Souza <jose.souza@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [RFC PATCH 1/2] drm/xe/guc: Use exec queue hints for GT frequency
Message-ID: <vi5pnuhw42oolascks3hwa5sfblcysysygw6mohvv3q2vuy5xl@2qfhlnh4zqv6>
References: <20250108150603.2995709-1-tejas.upadhyay@intel.com>
 <20250108150603.2995709-2-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250108150603.2995709-2-tejas.upadhyay@intel.com>
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

On Wed, Jan 08, 2025 at 08:36:02PM +0530, Tejas Upadhyay wrote:
>Allow user to provide a low latency hint per exec queue. When set,
>KMD sends a hint to GuC which results in special handling for this
>exec queue. SLPC will ramp the GT frequency aggressively every time
>it switches to this exec queue.
>
>We need to enable the use of SLPC Compute strategy during init, but
>it will apply only to exec queues that set this bit during exec queue
>creation.
>
>UMD will indicate low latency hint with flag as mentioned below,
>
>*     struct drm_xe_exec_queue_create exec_queue_create = {
>*          .flags = DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT or 0
>*          .extensions = 0,
>*          .vm_id = vm,
>*          .num_bb_per_exec = 1,
>*          .num_eng_per_bb = 1,
>*          .instances = to_user_pointer(&instance),
>*     };
>*     ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &exec_queue_create);
>
>Note: UMD is implementing respecitve usage example, once pull request is
>ready, will reference here.

motivation here is needed... the compute workload is bursty and
benefit from aggressive GT frequency ramp rather than the slower one,
which reduces the submission latency. Feel free to add the numbers
before and after with a hacked userspace/kernel integration showing how
the kernel latency reduces in clpeak.

Cc: Michal Mrozek <michal.mrozek@intel.com>
Cc: Szymon Morek <szymon.morek@intel.com>

For i915 there's also this use on the mesa side:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/28282

Cc: José Roberto de Souza <jose.souza@intel.com> to know if it'd
be interesting for them when using xe.

Lucas De Marchi
