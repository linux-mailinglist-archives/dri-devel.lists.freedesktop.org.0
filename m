Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD2E520FFB
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 10:48:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A46510EAAE;
	Tue, 10 May 2022 08:48:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E64110E357;
 Tue, 10 May 2022 08:48:32 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id k27so19139933edk.4;
 Tue, 10 May 2022 01:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Sg3Yyk6Y2V+jetC88TsfJUdQKRvW6Wluz1+xRhysIds=;
 b=hnmWHP7XmRqtKJQXvPJDJ1Rkm98EhvYSCoqFkuYVxs4bcL/sjTNSOYaBMurUi3uz1s
 zXUAMrZTupjP0iZKA4vBATqnS+wnZO2YJe6qPyPd4aAjeKvhv6QvDlOOQb9njvzg127P
 1da3OnE2R9Y/Cb/TkSVK9itsxLagtJiVf6fJmOXQ/Olqr3Bs7+vdyG4XdyRj8fOExHkE
 trLsdMTwo+Bn4ev1gEFl8b94zacDUv3NOT/9Tkschg2E4+wxjMufu480OluCT8/MGo0f
 tyN24XbIbjWFM8AI6vzud65GGpjXDCT9YJ5jJs+ym1WL58dGnfXtTwUhnAUo5GMlRP3Y
 lgSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Sg3Yyk6Y2V+jetC88TsfJUdQKRvW6Wluz1+xRhysIds=;
 b=BE9fTNeE/k8l7b/IRKQfECLkD64RIXWW33SkbE+sq6ponD+Y2Rq4wZ1hZCOmY1nSgi
 NzWMDLP/g90WmY1X8mF/i9kf/sa6KlMVjAgawSJSwHeb6BIbxhuS0zainMikVfaF/gp7
 DG+EM7rnbFVExQzRihq2SijnnI5mUK/NuNblQ6AhcCX+KBGaiIeH9qra/H/1tvIVjmsZ
 uO8SRtzcxkADxIhlE+ST7JDSIfhT7l0zviX75mx7yrT7fa+poPFACDGXWcput0QpEjLg
 NZy401LWtKiP5KiabdpcCbSCwTa1f4MYOkbtZVhuatZgh/FdGjWQaiHwf+FkHV1yDziw
 ftdA==
X-Gm-Message-State: AOAM532At497nfNu8SYGxH+2Ejq/ga50v1grgUS9KhPGQiU6V4p89wXT
 IVPXotsZm9myE84fTdZkgRA=
X-Google-Smtp-Source: ABdhPJzu+j3mJqAeGD/uTTrkwJSpoHsWICo2dGxlUiS51E3l9zP5/lg7yVJ/pOSp2oGHGkoIi3Eq3A==
X-Received: by 2002:aa7:c3ca:0:b0:425:ecfc:4258 with SMTP id
 l10-20020aa7c3ca000000b00425ecfc4258mr22377370edr.266.1652172510882; 
 Tue, 10 May 2022 01:48:30 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:616c:3555:9eac:59cc?
 ([2a02:908:1256:79a0:616c:3555:9eac:59cc])
 by smtp.gmail.com with ESMTPSA id
 ig11-20020a1709072e0b00b006f3ef214e2csm6032755ejc.146.2022.05.10.01.48.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 May 2022 01:48:30 -0700 (PDT)
Message-ID: <ddcb244d-dfed-d571-1d54-5e1ed24a03b7@gmail.com>
Date: Tue, 10 May 2022 10:48:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC] drm/amdgpu: Convert to common fdinfo format
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 amd-gfx@lists.freedesktop.org
References: <20220510082315.992296-1-tvrtko.ursulin@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20220510082315.992296-1-tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 David M Nieto <David.Nieto@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tvrtko,

Am 10.05.22 um 10:23 schrieb Tvrtko Ursulin:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> Convert fdinfo format to one documented in drm-usage-stats.rst.
>
> Opens/TODO:
>   * Does someone from AMD want to take over this patch?
>      (I have no access to amdgpu hardware so won't be able to test
>       any hypothetical gputop work.)

I can give that a try as soon as it is completed.

>   * What are the semantics of AMD engine utilisation reported in percents?

To be honest I haven't understood why we are using percents here either, 
that is not something the kernel should mess with.

>      * Can it align with what i915 does (same what msm will do) or need
>        to document the alternative in the specification document? Both
>        option are workable with instantaneous percent only needing support
>        to be added to vendor agnostic gputop.

I would prefer to just change to the ns format i915 and msm will be 
using, that makes much more sense from my experience.

As far as I know we haven't released any publicly available userspace 
using the existing AMD specific format. So that should still be possible.

>   * Can amdgpu expose drm-client-id? Without it gputop will not work.

How is that determined on i915 ? Does struct drm_file has that somewhere?

> * drm-engine-capacity - does the concept translate etc.

I don't think we are going to need that.

Regards,
Christian.

>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: David M Nieto <David.Nieto@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Acked-by: Christian König <christian.koenig@amd.com>
> ---
>   Documentation/gpu/amdgpu/usage-stats.rst   | 28 ++++++++++++++++++++++
>   Documentation/gpu/drm-usage-stats.rst      |  7 +++++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c | 18 ++++++++++----
>   3 files changed, 47 insertions(+), 6 deletions(-)
>   create mode 100644 Documentation/gpu/amdgpu/usage-stats.rst
>
> diff --git a/Documentation/gpu/amdgpu/usage-stats.rst b/Documentation/gpu/amdgpu/usage-stats.rst
> new file mode 100644
> index 000000000000..8be5009bd1a9
> --- /dev/null
> +++ b/Documentation/gpu/amdgpu/usage-stats.rst
> @@ -0,0 +1,28 @@
> +.. _amdgpu-usage-stats:
> +
> +============================================
> +AMDGPU DRM client usage stats implementation
> +============================================
> +
> +The amdgpu driver implements the DRM client usage stats specification as
> +documented in :ref:`drm-client-usage-stats`.
> +
> +Example of the output showing the implemented key value pairs and entirety of
> +the currenly possible format options:
> +
> +::
> +
> +      pos:    0
> +      flags:  0100002
> +      mnt_id: 21
> +      drm-driver: amdgpu
> +      drm-pdev:   0000:03:00.0
> +      drm-memory-vram: 0 KiB
> +      drm-memory-gtt: 0 KiB
> +      drm-memory-cpu: 0 KiB
> +      drm-engine-...: 0 %
> +                 ...
> +
> +Possible `drm-memory-` key names are: `vram`, `gtt`, `cpu`.
> +
> +Possible `drm-engine-` key names are: ``.
> diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
> index 6c9f166a8d6f..2d0ff6f2cc74 100644
> --- a/Documentation/gpu/drm-usage-stats.rst
> +++ b/Documentation/gpu/drm-usage-stats.rst
> @@ -69,7 +69,7 @@ scope of each device, in which case `drm-pdev` shall be present as well.
>   Userspace should make sure to not double account any usage statistics by using
>   the above described criteria in order to associate data to individual clients.
>   
> -- drm-engine-<str>: <uint> ns
> +- drm-engine-<str>: <uint> [ns|%]
>   
>   GPUs usually contain multiple execution engines. Each shall be given a stable
>   and unique name (str), with possible values documented in the driver specific
> @@ -84,6 +84,9 @@ larger value within a reasonable period. Upon observing a value lower than what
>   was previously read, userspace is expected to stay with that larger previous
>   value until a monotonic update is seen.
>   
> +Where time unit is given as a percentage...[AMD folks to fill the semantics
> +and interpretation of that]...
> +
>   - drm-engine-capacity-<str>: <uint>
>   
>   Engine identifier string must be the same as the one specified in the
> @@ -110,3 +113,5 @@ Driver specific implementations
>   ===============================
>   
>   :ref:`i915-usage-stats`
> +
> +:ref:`amdgpu-usage-stats`
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
> index 5a6857c44bb6..8cbae61f1b3b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
> @@ -32,6 +32,7 @@
>   
>   #include <drm/amdgpu_drm.h>
>   #include <drm/drm_debugfs.h>
> +#include <drm/drm_drv.h>
>   
>   #include "amdgpu.h"
>   #include "amdgpu_vm.h"
> @@ -83,11 +84,18 @@ void amdgpu_show_fdinfo(struct seq_file *m, struct file *f)
>   	amdgpu_bo_unreserve(root);
>   	amdgpu_bo_unref(&root);
>   
> -	seq_printf(m, "pdev:\t%04x:%02x:%02x.%d\npasid:\t%u\n", domain, bus,
> +	/*
> +	 * ******************************************************************
> +	 * For text output format description please see drm-usage-stats.rst!
> +	 * ******************************************************************
> +	 */
> +
> +	seq_printf(m, "drm-driver:\t%s\n", file->minor->dev->driver->name);
> +	seq_printf(m, "drm-pdev:\t%04x:%02x:%02x.%d\npasid:\t%u\n", domain, bus,
>   			dev, fn, fpriv->vm.pasid);
> -	seq_printf(m, "vram mem:\t%llu kB\n", vram_mem/1024UL);
> -	seq_printf(m, "gtt mem:\t%llu kB\n", gtt_mem/1024UL);
> -	seq_printf(m, "cpu mem:\t%llu kB\n", cpu_mem/1024UL);
> +	seq_printf(m, "drm-memory-vram:\t%llu KiB\n", vram_mem/1024UL);
> +	seq_printf(m, "drm-memory-gtt:\t%llu KiB\n", gtt_mem/1024UL);
> +	seq_printf(m, "drm-memory-cpu:\t%llu KiB\n", cpu_mem/1024UL);
>   	for (i = 0; i < AMDGPU_HW_IP_NUM; i++) {
>   		uint32_t count = amdgpu_ctx_num_entities[i];
>   		int idx = 0;
> @@ -103,7 +111,7 @@ void amdgpu_show_fdinfo(struct seq_file *m, struct file *f)
>   			perc = div64_u64(10000 * total, min);
>   			frac = perc % 100;
>   
> -			seq_printf(m, "%s%d:\t%d.%d%%\n",
> +			seq_printf(m, "drm-engine-%s%d:\t%d.%d %%\n",
>   					amdgpu_ip_name[i],
>   					idx, perc/100, frac);
>   		}

