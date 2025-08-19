Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AD3B2C6FE
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 16:28:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C9E310E198;
	Tue, 19 Aug 2025 14:28:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="G80qV9YX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7700210E198
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 14:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=r3yEuAoEomtClLGdUNtOQPUA8kM0LtyXwG1k57Cws3g=; b=G80qV9YXYXgIIVGfju/HBZP6hR
 SvGEzGyhXDH/Vg/VqXG35r1mTMCxmIaq+jJVZP+DA6d7o3sRN6HieuN3O3lWBeYzNXQUe8LqyZQbz
 1D8Shmh1NCxAiFuH6Xlm7+x9N0Ny76R4ww5cqD/6L+WWXL1E28Wlu6cHisW+hsUqK7AqRUSE3Kl9S
 GbfJ4HQALpLaWYHko5AK4Amooi/E+xLfT7D0F9hOTB6cjp9+PRfZQQtOfO+z0gbvFh4SzEPsZsiKi
 xZCSuP+LBm5Yo4KIgHLu5A7JplG3CKEp7EgNztoyzIoUJRbfRpBxQ7GIBu3WZ2biSwNIiUxLUIcWV
 /xuk1gPw==;
Received: from [84.66.36.92] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uoNKD-00GKzO-Gd; Tue, 19 Aug 2025 16:28:33 +0200
Message-ID: <94832307-8fed-42a7-8539-1a329d9db4d6@igalia.com>
Date: Tue, 19 Aug 2025 15:28:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched/tests: Remove redundant header files
To: Liao Yuanhong <liaoyuanhong@vivo.com>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 "open list:DRM GPU SCHEDULER" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250819142630.368796-1-liaoyuanhong@vivo.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250819142630.368796-1-liaoyuanhong@vivo.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 19/08/2025 15:26, Liao Yuanhong wrote:
> The header file <linux/atomic.h> is already included on line 8. Remove the
> redundant include.
> 
> Fixes: 5a99350794fec ("drm/sched: Add scheduler unit testing infrastructure and some basic tests")
> Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
> ---
>   drivers/gpu/drm/scheduler/tests/sched_tests.h | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/tests/sched_tests.h b/drivers/gpu/drm/scheduler/tests/sched_tests.h
> index 63d4f2ac7074..e25b8b9b80eb 100644
> --- a/drivers/gpu/drm/scheduler/tests/sched_tests.h
> +++ b/drivers/gpu/drm/scheduler/tests/sched_tests.h
> @@ -11,7 +11,6 @@
>   #include <linux/hrtimer.h>
>   #include <linux/ktime.h>
>   #include <linux/list.h>
> -#include <linux/atomic.h>
>   #include <linux/mutex.h>
>   #include <linux/types.h>
>   

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

