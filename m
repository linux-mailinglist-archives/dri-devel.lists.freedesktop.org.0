Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5C039858A
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 11:47:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 535C36EC2C;
	Wed,  2 Jun 2021 09:47:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 617BE6EC2D;
 Wed,  2 Jun 2021 09:47:42 +0000 (UTC)
IronPort-SDR: s+vYGZ8ICa6uF1EWTislj6OkJZx4QTx5l4CA9jK8FCsf1YiQ1TtjDdZuQ1W24Hr/8x45KdfuYH
 19rhZNvgCeJw==
X-IronPort-AV: E=McAfee;i="6200,9189,10002"; a="203744387"
X-IronPort-AV: E=Sophos;i="5.83,241,1616482800"; d="scan'208";a="203744387"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2021 02:47:41 -0700
IronPort-SDR: izP+4q7UrhyR30hsfFIHklnfrXF06OeU1tw5tPSRiWGTMgqPpJT9HcDNzoZMTcIWE0pdvO1v/U
 0ut49Bah7dcw==
X-IronPort-AV: E=Sophos;i="5.83,241,1616482800"; d="scan'208";a="447337278"
Received: from tstaplex-mobl1.ger.corp.intel.com (HELO [10.213.195.193])
 ([10.213.195.193])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2021 02:47:37 -0700
Subject: Re: [Intel-gfx] [PATCH] drm/i915/selftests: Fix return value check in
 live_breadcrumbs_smoketest()
To: "Ursulin, Tvrtko" <tvrtko.ursulin@intel.com>,
 Zhihao Cheng <chengzhihao1@huawei.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "airlied@linux.ie"
 <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "chris@chris-wilson.co.uk" <chris@chris-wilson.co.uk>
References: <20210529043327.2772051-1-chengzhihao1@huawei.com>
 <33c46ef24cd547d0ad21dc106441491a@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <8abf5ddf-7c08-c2c0-92d4-d6c30058763c@linux.intel.com>
Date: Wed, 2 Jun 2021 10:47:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <33c46ef24cd547d0ad21dc106441491a@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: "yukuai3@huawei.com" <yukuai3@huawei.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 01/06/2021 10:19, Ursulin, Tvrtko wrote:
> 
> [Don't see this on intel-gfx so I have to reply with top post.]
> 
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Pushed with commit text wrapped and Fixes: tag fixed, thanks for the patch!

Regards,

Tvrtko

> 
> -----Original Message-----
> From: Zhihao Cheng <chengzhihao1@huawei.com>
> Sent: Saturday, May 29, 2021 5:33 AM
> To: jani.nikula@linux.intel.com; joonas.lahtinen@linux.intel.com; Vivi, Rodrigo <rodrigo.vivi@intel.com>; airlied@linux.ie; daniel@ffwll.ch; chris@chris-wilson.co.uk; Ursulin, Tvrtko <tvrtko.ursulin@intel.com>
> Cc: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; chengzhihao1@huawei.com; yukuai3@huawei.com
> Subject: [PATCH] drm/i915/selftests: Fix return value check in live_breadcrumbs_smoketest()
> 
> In case of error, the function live_context() returns ERR_PTR() and never returns NULL. The NULL test in the return value check should be replaced with IS_ERR().
> 
> Fixes: 52c0fdb25c7c9 ("drm/i915: Replace global breadcrumbs ...")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
> ---
>   drivers/gpu/drm/i915/selftests/i915_request.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/selftests/i915_request.c b/drivers/gpu/drm/i915/selftests/i915_request.c
> index ee8e753d98ce..eae0abd614cb 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_request.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_request.c
> @@ -1592,8 +1592,8 @@ static int live_breadcrumbs_smoketest(void *arg)
>   
>   	for (n = 0; n < smoke[0].ncontexts; n++) {
>   		smoke[0].contexts[n] = live_context(i915, file);
> -		if (!smoke[0].contexts[n]) {
> -			ret = -ENOMEM;
> +		if (IS_ERR(smoke[0].contexts[n])) {
> +			ret = PTR_ERR(smoke[0].contexts[n]);
>   			goto out_contexts;
>   		}
>   	}
> --
> 2.25.4
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> 
