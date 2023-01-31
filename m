Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF0668289C
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 10:22:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A68210E324;
	Tue, 31 Jan 2023 09:22:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 853B110E14A
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 09:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675156954; x=1706692954;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=0T9JnpMnofgA14nTnYkQJMBylZvmsrtKlxmjhK44Yxw=;
 b=nrrcxYqP6OsEtDAs8BuCz+zfmwSViWPyTxoz+2xnF0iekWt5aNy3k51O
 09kbcdZO6lTrGYNzEk+Qx8yTHj5KY8uzqJcVYuelRrJ9HLQE0GsSJSMQY
 bsMCHpFThKjabR8++dcUg8ftFvLonUfDhVhuw3ojI+cVgGLdJafhMqkYB
 1Ex1/2fAOP9kFrn3rcso3O3VAu4zx3ZdduNVD9oFwlpXcOtvxnFcOhbhP
 3q6Ufp/GFcyw03jNHMQ8G3M4IB7ZuAiyaU72UW2c1aGFArpQudtXWmt99
 mNk40Ctbjx6m83lRZoT/iw514KwkgG1vpGHOboU6Nw9QY0P6kuj2eeqjy w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="390155148"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; d="scan'208";a="390155148"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2023 01:22:20 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="909839409"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; d="scan'208";a="909839409"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.237.142.112])
 ([10.237.142.112])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2023 01:22:17 -0800
Message-ID: <a7a36fa5-c48e-438e-f7fd-141ab6278bab@linux.intel.com>
Date: Tue, 31 Jan 2023 10:22:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/2] accep/ivpu: PM: remove broken ivpu_dbg() statements
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Krystian Pradzynski <krystian.pradzynski@linux.intel.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20230126163804.3648051-1-arnd@kernel.org>
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230126163804.3648051-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied to drm-misc-next.
Thanks.

On 26.01.2023 17:37, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When CONFIG_PM is disabled, the driver fails to build:
> 
> drivers/accel/ivpu/ivpu_pm.c: In function 'ivpu_rpm_get':
> drivers/accel/ivpu/ivpu_pm.c:240:84: error: 'struct dev_pm_info' has no member named 'usage_count'
>   240 |         ivpu_dbg(vdev, RPM, "rpm_get count %d\n", atomic_read(&vdev->drm.dev->power.usage_count));
>       |                                                                                    ^
> include/linux/dynamic_debug.h:223:29: note: in definition of macro '__dynamic_func_call_cls'
>   223 |                 func(&id, ##__VA_ARGS__);                       \
>       |                             ^~~~~~~~~~~
> include/linux/dynamic_debug.h:249:9: note: in expansion of macro '_dynamic_func_call_cls'
>   249 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
>       |         ^~~~~~~~~~~~~~~~~~~~~~
> include/linux/dynamic_debug.h:272:9: note: in expansion of macro '_dynamic_func_call'
>   272 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
>       |         ^~~~~~~~~~~~~~~~~~
> include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
>   155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
>       |         ^~~~~~~~~~~~~~~
> drivers/accel/ivpu/ivpu_drv.h:65:17: note: in expansion of macro 'dev_dbg'
>    65 |                 dev_dbg((vdev)->drm.dev, "[%s] " fmt, #type, ##args);          \
>       |                 ^~~~~~~
> drivers/accel/ivpu/ivpu_pm.c:240:9: note: in expansion of macro 'ivpu_dbg'
>   240 |         ivpu_dbg(vdev, RPM, "rpm_get count %d\n", atomic_read(&vdev->drm.dev->power.usage_count));
>       |         ^~~~~~~~
> 
> It would be possible to rework these statements to only conditionally print
> the reference counter, or to make the driver depend on CONFIG_PM, but my
> impression is that these are not actually needed at all if the driver generally
> works, or they could be put back when required. Just remove all four of these
> to make the driver build in all configurations.
> 
> Fixes: 852be13f3bd3 ("accel/ivpu: Add PM support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/accel/ivpu/ivpu_pm.c | 10 ----------
>  1 file changed, 10 deletions(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
> index 553bcbd787b3..a880f1dd857e 100644
> --- a/drivers/accel/ivpu/ivpu_pm.c
> +++ b/drivers/accel/ivpu/ivpu_pm.c
> @@ -237,8 +237,6 @@ int ivpu_rpm_get(struct ivpu_device *vdev)
>  {
>  	int ret;
>  
> -	ivpu_dbg(vdev, RPM, "rpm_get count %d\n", atomic_read(&vdev->drm.dev->power.usage_count));
> -
>  	ret = pm_runtime_resume_and_get(vdev->drm.dev);
>  	if (!drm_WARN_ON(&vdev->drm, ret < 0))
>  		vdev->pm->suspend_reschedule_counter = PM_RESCHEDULE_LIMIT;
> @@ -248,8 +246,6 @@ int ivpu_rpm_get(struct ivpu_device *vdev)
>  
>  void ivpu_rpm_put(struct ivpu_device *vdev)
>  {
> -	ivpu_dbg(vdev, RPM, "rpm_put count %d\n", atomic_read(&vdev->drm.dev->power.usage_count));
> -
>  	pm_runtime_mark_last_busy(vdev->drm.dev);
>  	pm_runtime_put_autosuspend(vdev->drm.dev);
>  }
> @@ -314,16 +310,10 @@ void ivpu_pm_enable(struct ivpu_device *vdev)
>  	pm_runtime_allow(dev);
>  	pm_runtime_mark_last_busy(dev);
>  	pm_runtime_put_autosuspend(dev);
> -
> -	ivpu_dbg(vdev, RPM, "Enable RPM count %d\n", atomic_read(&dev->power.usage_count));
>  }
>  
>  void ivpu_pm_disable(struct ivpu_device *vdev)
>  {
> -	struct device *dev = vdev->drm.dev;
> -
> -	ivpu_dbg(vdev, RPM, "Disable RPM count %d\n", atomic_read(&dev->power.usage_count));
> -
>  	pm_runtime_get_noresume(vdev->drm.dev);
>  	pm_runtime_forbid(vdev->drm.dev);
>  }
