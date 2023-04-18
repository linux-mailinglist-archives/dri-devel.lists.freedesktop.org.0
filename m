Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D03296E5C96
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 10:53:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7BDF10E714;
	Tue, 18 Apr 2023 08:53:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBF8510E716;
 Tue, 18 Apr 2023 08:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681808027; x=1713344027;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=XMup0HZRzCdTHOXeUENM9MHnRGKqUmtb7/GwvbX/QgY=;
 b=KVXuAf6WRnXsE5Js7o8eJVSaBABv5zikWpvF1bGvDUdfP+lfgsqtzJUF
 AC1hWscCxPF1V+k0DU0Qncnk7PV9X5naKP4bwoGKJ8t2eeEdts1/qZiLg
 G8aYzVBF1q9wemLsQ7+PXxeMfLaolUgDjOZdrOoL8rmpLWLBFbkxcXBpi
 +fGlOfwMyI2Ozkylw2nQAYVQUJjkLzbj4zv6EuQ4ZHEdBJum6zJr9RL3R
 wFlcjnUdFu22fx2+xmX4OC0UcZQJKwIymWsEglUrq1qTbeuOgBrE1et4n
 xA+uy/SDCsvV4qJBkDMVInE3ejh9whozfojucSHvT7v2lEjehLGQZExcy g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="343868967"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200"; d="scan'208";a="343868967"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2023 01:53:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="834792991"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200"; d="scan'208";a="834792991"
Received: from dilipban-mobl.ger.corp.intel.com (HELO [10.213.234.43])
 ([10.213.234.43])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2023 01:53:37 -0700
Message-ID: <20655be0-65e3-0000-4acd-310ec9cc1d3a@linux.intel.com>
Date: Tue, 18 Apr 2023 09:53:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC 3/3] drm/msm: Add comm/cmdline fields
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230417201215.448099-1-robdclark@gmail.com>
 <20230417201215.448099-4-robdclark@gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230417201215.448099-4-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, Sean Paul <sean@poorly.run>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 17/04/2023 21:12, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Normally this would be the same information that can be obtained in
> other ways.  But in some cases the process opening the drm fd is merely
> a sort of proxy for the actual process using the GPU.  This is the case
> for guest VM processes using the GPU via virglrenderer, in which case
> the msm native-context renderer in virglrenderer overrides the comm/
> cmdline to be the guest process's values.
> 
> Exposing this via fdinfo allows tools like gputop to show something more
> meaningful than just a bunch of "pcivirtio-gpu" users.

You also later expanded with:

"""
I should have also mentioned, in the VM/proxy scenario we have a
single process with separate drm_file's for each guest VM process.  So
it isn't an option to just change the proxy process's name to match
the client.
"""

So how does that work - this single process temporarily changes it's 
name for each drm fd it opens and creates a context or it is actually in 
the native context protocol?

> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   Documentation/gpu/drm-usage-stats.rst |  8 ++++++++
>   drivers/gpu/drm/msm/msm_gpu.c         | 14 ++++++++++++++
>   2 files changed, 22 insertions(+)
> 
> diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
> index 8e00d53231e0..bc90bed455e3 100644
> --- a/Documentation/gpu/drm-usage-stats.rst
> +++ b/Documentation/gpu/drm-usage-stats.rst
> @@ -148,6 +148,14 @@ percentage utilization of the engine, whereas drm-engine-<keystr> only reflects
>   time active without considering what frequency the engine is operating as a
>   percentage of it's maximum frequency.
>   
> +- drm-comm: <valstr>
> +
> +Returns the clients executable path.

Full path and not just current->comm? In this case probably give it a 
more descriptive name here.

drm-client-executable
drm-client-command-line

So we stay in the drm-client- namespace?

Or if the former is absolute path could one key be enough for both?

drm-client-command-line: /path/to/executable --arguments

> +
> +- drm-cmdline: <valstr>
> +
> +Returns the clients cmdline.

I think drm-usage-stats.rst text should provide some more text with 
these two. To precisely define their content and outline the use case 
under which driver authors may want to add them, and fdinfo consumer 
therefore expect to see them. Just so everything is completely clear and 
people do not start adding them for drivers which do not support native 
context (or like).

But on the overall it sounds reasonable to me - it would be really cool 
to not just see pcivirtio-gpu as you say. Even if the standard virtiogpu 
use case (not native context) could show real users.

Regards,

Tvrtko

> +
>   Implementation Details
>   ======================
>   
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index f0f4f845c32d..1150dcbf28aa 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -148,12 +148,26 @@ int msm_gpu_pm_suspend(struct msm_gpu *gpu)
>   	return 0;
>   }
>   
> +static void get_comm_cmdline(struct msm_file_private *ctx, char **comm, char **cmd);
> +
>   void msm_gpu_show_fdinfo(struct msm_gpu *gpu, struct msm_file_private *ctx,
>   			 struct drm_printer *p)
>   {
> +	char *comm, *cmdline;
> +
> +	get_comm_cmdline(ctx, &comm, &cmdline);
> +
>   	drm_printf(p, "drm-engine-gpu:\t%llu ns\n", ctx->elapsed_ns);
>   	drm_printf(p, "drm-cycles-gpu:\t%llu\n", ctx->cycles);
>   	drm_printf(p, "drm-maxfreq-gpu:\t%u Hz\n", gpu->fast_rate);
> +
> +	if (comm)
> +		drm_printf(p, "drm-comm:\t%s\n", comm);
> +	if (cmdline)
> +		drm_printf(p, "drm-cmdline:\t%s\n", cmdline);
> +
> +	kfree(comm);
> +	kfree(cmdline);
>   }
>   
>   int msm_gpu_hw_init(struct msm_gpu *gpu)
