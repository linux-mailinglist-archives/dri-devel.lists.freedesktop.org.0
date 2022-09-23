Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 462F35E7869
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 12:32:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FE5210E505;
	Fri, 23 Sep 2022 10:32:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08ADB10E4DC;
 Fri, 23 Sep 2022 10:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663929149; x=1695465149;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=F6uTpWKgQxhtoV2Ya/EjRCJYpt4vf92gPukuhTD+Ii4=;
 b=S4qN3E+a9/rVhtKGx7LEVoqb/BM4wQHf7oY0sNyYCt1Th/+J/pW9lohz
 GDD1R1P0nspTX9D3q9NxXAfV27YXL8KBksnFr/OJdFE9FxwQqPObiN8he
 uvvschMQXZSgUCljvWo7Y2iSWquRo0OfhIpZ/1Q6Xnp5gUN47ycuLnnB0
 gF+akUZQrkEa++s6vCOv2sNIEKKDUr5tZEOppU2yVEX86OGgWEaEDtjzu
 q88LN+l5r/KnvI7ItUF2eOb3QoC0CzlCSLAuZelBgBgnNzbvFsFJbqH8j
 5jVP3MyySTSW6ufSDxpyRiErILrAXp/CU/bXYMlzFWpha2SrwE5RTar4c A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="300548655"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="300548655"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2022 03:32:28 -0700
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="571335192"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.252.3.7])
 ([10.252.3.7])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2022 03:32:27 -0700
Message-ID: <6f789a18-76be-ebc6-a20a-fa63963e9498@linux.intel.com>
Date: Fri, 23 Sep 2022 12:32:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] drm/i915/selftests: Remove flush_scheduled_work() from
 live_execlists
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel-gfx@lists.freedesktop.org
References: <20220630125716.50835-1-tvrtko.ursulin@linux.intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <20220630125716.50835-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

On 6/30/2022 2:57 PM, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> There are ongoing efforts to remove usages of flush_scheduled_work() from
> drivers in order to avoid several cases of potentential problems when
> flushing is done from certain contexts.
>
> Remove the call from the live_execlists selftest. Its purpose was to be
> thorough and sync with the execlists capture state handling, but that is
> not strictly required for the test to function and can be removed.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> ---
>   drivers/gpu/drm/i915/gt/selftest_execlists.c | 2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/selftest_execlists.c b/drivers/gpu/drm/i915/gt/selftest_execlists.c
> index 09f8cd2d0e2c..e62d089257ae 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_execlists.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_execlists.c
> @@ -85,8 +85,6 @@ static int wait_for_reset(struct intel_engine_cs *engine,
>   			break;
>   	} while (time_before(jiffies, timeout));
>   
> -	flush_scheduled_work();
> -
>   	if (rq->fence.error != -EIO) {
>   		pr_err("%s: hanging request %llx:%lld not reset\n",
>   		       engine->name,
