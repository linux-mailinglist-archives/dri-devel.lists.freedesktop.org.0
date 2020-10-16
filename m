Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 932DE29049E
	for <lists+dri-devel@lfdr.de>; Fri, 16 Oct 2020 14:03:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D19336EDC8;
	Fri, 16 Oct 2020 12:03:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8E806EDC8
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 12:03:02 +0000 (UTC)
IronPort-SDR: JeFBqTkioiN7HTPlur3DJTM6GKt9Os2EOh4V1z7Vr22WWhmOMmcUeaUU+6F3Ld0OlX1cbzeHbb
 7wXa8cUR9Hpg==
X-IronPort-AV: E=McAfee;i="6000,8403,9775"; a="146453214"
X-IronPort-AV: E=Sophos;i="5.77,382,1596524400"; d="scan'208";a="146453214"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2020 05:03:02 -0700
IronPort-SDR: fHmFbC1fYXjnIpbV4ktwp/QqDyiGPb7ESHcpmZ0AoZD5Z0tPNx68anIHHKN6HKWtB89/o7XK2/
 i3I9+3cGpWEA==
X-IronPort-AV: E=Sophos;i="5.77,382,1596524400"; d="scan'208";a="531691514"
Received: from wpross-mobl1.ger.corp.intel.com (HELO [10.249.36.186])
 ([10.249.36.186])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2020 05:03:01 -0700
Subject: Re: [PATCH v6 44/80] docs: gpu: i915.rst: Fix several C duplication
 warnings
To: dri-devel@lists.freedesktop.org
References: <cover.1602589096.git.mchehab+huawei@kernel.org>
 <52a0dd42d3730d35b3ecd00d20a0601793e443e6.1602589096.git.mchehab+huawei@kernel.org>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
Message-ID: <48f304ed-1a7e-c5c3-2542-f9c528f47d00@intel.com>
Date: Fri, 16 Oct 2020 15:02:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <52a0dd42d3730d35b3ecd00d20a0601793e443e6.1602589096.git.mchehab+huawei@kernel.org>
Content-Language: en-US
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/10/2020 14:53, Mauro Carvalho Chehab wrote:
> As reported by Sphinx:
>
> 	./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:1147: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
> 	Declaration is 'i915_oa_wait_unlocked'.
> 	./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:1169: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
> 	Declaration is 'i915_oa_poll_wait'.
> 	./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:1189: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
> 	Declaration is 'i915_oa_read'.
> 	./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:2669: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
> 	Declaration is 'i915_oa_stream_enable'.
> 	./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:2734: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
> 	Declaration is 'i915_oa_stream_disable'.
> 	./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:2820: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
> 	Declaration is 'i915_oa_stream_init'.
> 	./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:3010: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
> 	Declaration is 'i915_perf_read'.
> 	./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:3098: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
> 	Declaration is 'i915_perf_poll_locked'.
> 	./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:3129: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
> 	Declaration is 'i915_perf_poll'.
> 	./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:3152: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
> 	Declaration is 'i915_perf_enable_locked'.
> 	./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:3181: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
> 	Declaration is 'i915_perf_disable_locked'.
> 	./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:3273: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
> 	Declaration is 'i915_perf_ioctl'.
> 	./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:3296: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
> 	Declaration is 'i915_perf_destroy_locked'.
> 	./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:3321: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
> 	Declaration is 'i915_perf_release'.
> 	./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:3379: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
> 	Declaration is 'i915_perf_open_ioctl_locked'.
> 	./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:3534: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
> 	Declaration is 'read_properties_unlocked'.
> 	./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:3717: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
> 	Declaration is 'i915_perf_open_ioctl'.
> 	./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:3760: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
> 	Declaration is 'i915_perf_register'.
> 	./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:3789: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
> 	Declaration is 'i915_perf_unregister'.
> 	./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:4009: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
> 	Declaration is 'i915_perf_add_config_ioctl'.
> 	./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:4162: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
> 	Declaration is 'i915_perf_remove_config_ioctl'.
> 	./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:4260: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
> 	Declaration is 'i915_perf_init'.
> 	./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:4423: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
> 	Declaration is 'i915_perf_fini'.
>
> With Sphinx 3, C declarations can't be duplicated anymore,
> so let's exclude those from the other internals found on
> i915_perf.c file.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> ---
>   Documentation/gpu/i915.rst | 29 +++++++++++++++++++++++++----
>   1 file changed, 25 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
> index 33cc6ddf8f64..cff1f154b473 100644
> --- a/Documentation/gpu/i915.rst
> +++ b/Documentation/gpu/i915.rst
> @@ -636,15 +636,36 @@ i915 Perf Observation Architecture Stream
>   .. kernel-doc:: drivers/gpu/drm/i915/i915_perf.c
>      :functions: i915_oa_poll_wait
>   
> -All i915 Perf Internals
> ------------------------
> +Other i915 Perf Internals
> +-------------------------
>   
> -This section simply includes all currently documented i915 perf internals, in
> -no particular order, but may include some more minor utilities or platform
> +This section simply includes all other currently documented i915 perf internals,
> +in no particular order, but may include some more minor utilities or platform
>   specific details than found in the more high-level sections.
>   
>   .. kernel-doc:: drivers/gpu/drm/i915/i915_perf.c
>      :internal:
> +   :no-identifiers:
> +       i915_perf_init
> +       i915_perf_fini
> +       i915_perf_register
> +       i915_perf_unregister
> +       i915_perf_open_ioctl
> +       i915_perf_release
> +       i915_perf_add_config_ioctl
> +       i915_perf_remove_config_ioctl
> +       read_properties_unlocked
> +       i915_perf_open_ioctl_locked
> +       i915_perf_destroy_locked
> +       i915_perf_read i915_perf_ioctl
> +       i915_perf_enable_locked
> +       i915_perf_disable_locked
> +       i915_perf_poll i915_perf_poll_locked
> +       i915_oa_stream_init i915_oa_read
> +       i915_oa_stream_enable
> +       i915_oa_stream_disable
> +       i915_oa_wait_unlocked
> +       i915_oa_poll_wait
>   
>   Style
>   =====


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
