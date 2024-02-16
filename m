Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFD985825C
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 17:24:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEF0D10EBD6;
	Fri, 16 Feb 2024 16:24:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="muPJmrB1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A151F10E309;
 Fri, 16 Feb 2024 16:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708100661; x=1739636661;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=QRBRG+PPKI9lbmCzW9kkuJZJPZ7F9Ovpm+o2PeXYP+8=;
 b=muPJmrB1uNyPKjx5CX5edAJUJ52KGpVQ1bNort7hWc/VnpMLj4G+OFDL
 vrfaI3x2iFSuUBl8PNd5a8sD3RnwKbmCMuyqhav7Z2y6fIi4WBBF1rF/M
 N4UacsGxfCozXy1Mc4E9eCO9PnfDtRJuJ33iIN3J1Bxw3m5GXsGvAhfus
 fMU2iT8PfWQOe4SI4mD/eEYiUScXK1tsbS/1S1TKuZQAbOTbvKu6X6/jR
 H5IegRAjP+aucH82GYNp0YQUTPwsFyETHHrVnGngCO8PySRcrr3q2WOzZ
 7lGvkFrJSYmQ/vj0YK5uXoZxZcnjUbOFMKthX9opATP7FWzc8J3phOid4 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10986"; a="6060779"
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; 
   d="scan'208";a="6060779"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 08:24:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10986"; a="826595017"
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; d="scan'208";a="826595017"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 16 Feb 2024 08:24:14 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 16 Feb 2024 18:24:13 +0200
Date: Fri, 16 Feb 2024 18:24:13 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH v3 6/8] drm: add drm_mode_atomic_commit event
Message-ID: <Zc-MLQZ1bby_vKal@intel.com>
References: <20240216151006.475077-1-pierre-eric.pelloux-prayer@amd.com>
 <20240216151006.475077-7-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240216151006.475077-7-pierre-eric.pelloux-prayer@amd.com>
X-Patchwork-Hint: comment
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

On Fri, Feb 16, 2024 at 04:09:55PM +0100, Pierre-Eric Pelloux-Prayer wrote:
> With this and the dma_fence_used_as_dependency event, a tool can draw the
> relationship between the compositing draw, the atomic commit, and vblank.
> 
> An example on a 2 monitors system look like this:
> 
> gnome-shell-1638    [018] .....  2571.905124: drm_mode_atomic_commit: file=00000000245c3f0c, pid=    1165, flags=00000201, crtcs={0x1}
> gnome-shell-1638    [018] .....  2571.905147: dma_fence_used_as_dependency: driver=drm_sched timeline=gfx_0.0.0 context=270 seqno=73240 reason=dma_fence_chain_init
> gnome-shell-1638    [018] .....  2571.913226: drm_mode_atomic_commit: file=00000000245c3f0c, pid=    1165, flags=00000201, crtcs={0x0}
> gnome-shell-1638    [018] .....  2571.913250: dma_fence_used_as_dependency: driver=drm_sched timeline=gfx_0.0.0 context=270 seqno=73241 reason=dma_fence_chain_init
>     <idle>-0       [018] d.h3.  2571.915687: drm_vblank_event: crtc=1, seq=155747, time=2571916093743, high-prec=true
>     <idle>-0       [018] d.h3.  2571.915968: drm_vblank_event: crtc=0, seq=153862, time=2571916377180, high-prec=true
> 
> v2: fix unchecked memory allocation
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>  drivers/gpu/drm/drm_atomic_uapi.c | 21 +++++++++++++++++++++
>  drivers/gpu/drm/drm_trace.h       | 23 +++++++++++++++++++++++
>  2 files changed, 44 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index 29d4940188d4..f31b5c6f870b 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -41,6 +41,7 @@
>  #include <linux/file.h>
>  
>  #include "drm_crtc_internal.h"
> +#include "drm_trace.h"
>  
>  /**
>   * DOC: overview
> @@ -1503,6 +1504,26 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>  		drm_mode_object_put(obj);
>  	}
>  
> +	if (trace_drm_mode_atomic_commit_enabled()) {
> +		struct drm_crtc_state *crtc_state;
> +		struct drm_crtc *crtc;
> +		int *crtcs;
> +		int i, num_crtcs;
> +
> +		crtcs = kcalloc(dev->mode_config.num_crtc, sizeof(int),
> +				GFP_KERNEL);
> +
> +		if (crtcs) {
> +			num_crtcs = 0;
> +			for_each_new_crtc_in_state(state, crtc, crtc_state, i)
> +				crtcs[num_crtcs++] = drm_crtc_index(crtc);
> +
> +			trace_drm_mode_atomic_commit(file_priv, crtcs, num_crtcs, arg->flags);
> +
> +			kfree(crtcs);
> +		}
> +	}

I think the current drm trace events are sort of semi-useless.
The problems are:
- no device id in the events so good luck with multi gpu systems
- vblank trace events are only emitted from some vblank
  codepaths but not others

I'm also not sure putting an event straight into the atomic ioctl is
particularly useful.

First of all it means that any commit not initiated by the atomic
ioctl will not be traced.

It would also seem more useful to me if the driver can emit the
trace just before it commits the frame to the hardware, so that
we can also observe the latency between userspace submitting
the frame vs. when the hardware will actually see it.

Also if we want tools to use these I think we're going to have to
make some kind of abi promises about the events, so we should make
sure they are as future proof as we can make them (eg. regarding
mutli-gpu systems/etc.).

> +
>  	ret = prepare_signaling(dev, state, arg, file_priv, &fence_state,
>  				&num_fences);
>  	if (ret)
> diff --git a/drivers/gpu/drm/drm_trace.h b/drivers/gpu/drm/drm_trace.h
> index 11c6dd577e8e..63489923c289 100644
> --- a/drivers/gpu/drm/drm_trace.h
> +++ b/drivers/gpu/drm/drm_trace.h
> @@ -66,6 +66,29 @@ TRACE_EVENT(drm_vblank_event_delivered,
>  		      __entry->seq)
>  );
>  
> +TRACE_EVENT(drm_mode_atomic_commit,
> +	    TP_PROTO(struct drm_file *file, int *crtcs, int ncrtcs, uint32_t flags),
> +	    TP_ARGS(file, crtcs, ncrtcs, flags),
> +	    TP_STRUCT__entry(
> +		    __field(struct drm_file *, file)
> +		    __dynamic_array(u32, crtcs, ncrtcs)
> +		    __field(uint32_t, ncrtcs)
> +		    __field(uint32_t, flags)
> +		    ),
> +	    TP_fast_assign(
> +		    unsigned int i;
> +
> +		    __entry->file = file;
> +		    for (i = 0; i < ncrtcs; i++)
> +			((u32 *)__get_dynamic_array(crtcs))[i] = crtcs[i];
> +		    __entry->ncrtcs = ncrtcs;
> +		    __entry->flags = flags;
> +		    ),
> +	    TP_printk("file=%p, pid=%8d, flags=%08x, crtcs=%s", __entry->file,
> +		      pid_nr(__entry->file->pid), __entry->flags,
> +		      __print_array(__get_dynamic_array(crtcs), __entry->ncrtcs, 4))
> +);
> +
>  #endif /* _DRM_TRACE_H_ */
>  
>  /* This part must be outside protection */
> -- 
> 2.40.1

-- 
Ville Syrjälä
Intel
