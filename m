Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0752A682895
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 10:20:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29A0010E0B9;
	Tue, 31 Jan 2023 09:20:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B1CA10E0B9
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 09:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675156814; x=1706692814;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=4JM1VnPDZosr3/MSF2FzrL7UH4abNkI0iF6A5UQGphM=;
 b=KLBmhLNcApntmahUMqAIE2SJOnix/l9zTQ7g2P4MVz+nwWSlkzaWqvi4
 hGcwWV3nS+tjEAesb8+/Je+2Mh/6VdyuoW81kjbnSlEnZQ6QQ8ah6C04G
 B6XB6HoNJFRxyNK0Pq3D2FD/l20wXqcv0lGI4Jg9nUjAjxxHXW9cyZpSn
 DcZohYWsHRbKgG72y/TDVjgS5KpfgkSd/Eu6f1ur9vQqEgFku/HyWP7oc
 hRKq/ydxqwC0pdK+WXP5Jrzz0h8P0FdwUXmqf2bhWP92ZUnmVdczl2N1z
 Q1sFV6H3XSiqg6jRt3XKvQ9M8SK4ttuiQJm+SbECf9UghlYvw2OYFoU8O Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="392340232"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; d="scan'208";a="392340232"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2023 01:20:13 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="993199875"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; d="scan'208";a="993199875"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.237.142.112])
 ([10.237.142.112])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2023 01:20:10 -0800
Message-ID: <6b48eef6-2f9c-9673-fe3d-009d29dea641@linux.intel.com>
Date: Tue, 31 Jan 2023 10:20:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] [v2] accel: fix CONFIG_DRM dependencies
Content-Language: en-US
To: Oded Gabbay <ogabbay@kernel.org>, Arnd Bergmann <arnd@kernel.org>
References: <20230127221504.2522909-1-arnd@kernel.org>
 <CAFCwf10RRFUqYEATg7p-LmKSEkFtAhneufJTdezFA7i3HJaDDw@mail.gmail.com>
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <CAFCwf10RRFUqYEATg7p-LmKSEkFtAhneufJTdezFA7i3HJaDDw@mail.gmail.com>
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
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>, Arnd Bergmann <arnd@arndb.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Melissa Wen <mwen@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 31.01.2023 09:53, Oded Gabbay wrote:
> On Sat, Jan 28, 2023 at 12:15 AM Arnd Bergmann <arnd@kernel.org> wrote:
>>
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> At the moment, accel drivers can be built-in even with CONFIG_DRM=m,
>> but this causes a link failure:
>>
>> x86_64-linux-ld: drivers/accel/ivpu/ivpu_drv.o: in function `ivpu_dev_init':
>> ivpu_drv.c:(.text+0x1535): undefined reference to `drmm_kmalloc'
>> x86_64-linux-ld: ivpu_drv.c:(.text+0x1562): undefined reference to `drmm_kmalloc'
>> x86_64-linux-ld: drivers/accel/ivpu/ivpu_drv.o: in function `ivpu_remove':
>> ivpu_drv.c:(.text+0x1faa): undefined reference to `drm_dev_unregister'
>> x86_64-linux-ld: drivers/accel/ivpu/ivpu_drv.o: in function `ivpu_probe':
>> ivpu_drv.c:(.text+0x1fef): undefined reference to `__devm_drm_dev_alloc'
>>
>> The problem is that DRM_ACCEL is a 'bool' symbol symbol, so driver that
>> only depend on DRM_ACCEL but not also on DRM do not see the restriction
>> to =m configs.
>>
>> To ensure that each accel driver has an implied dependency on CONFIG_DRM,
>> enclose the entire Kconfig file in an if/endif check.
>>
>> Fixes: 8bf4889762a8 ("drivers/accel: define kconfig and register a new major")
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> ---
>> v2: rearrage the DRM dependency rather than requiring DRM to be built-in
>> ---
>>  drivers/accel/Kconfig | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/accel/Kconfig b/drivers/accel/Kconfig
>> index 834863902e16..c437206aa3f1 100644
>> --- a/drivers/accel/Kconfig
>> +++ b/drivers/accel/Kconfig
>> @@ -6,9 +6,10 @@
>>  # as, but not limited to, Machine-Learning and Deep-Learning acceleration
>>  # devices
>>  #
>> +if DRM
>> +
>>  menuconfig DRM_ACCEL
>>         bool "Compute Acceleration Framework"
>> -       depends on DRM
>>         help
>>           Framework for device drivers of compute acceleration devices, such
>>           as, but not limited to, Machine-Learning and Deep-Learning
>> @@ -25,3 +26,5 @@ menuconfig DRM_ACCEL
>>
>>  source "drivers/accel/habanalabs/Kconfig"
>>  source "drivers/accel/ivpu/Kconfig"
>> +
>> +endif
>> --
>> 2.39.0
>>
> This patch is:
> Reviewed-by: Oded Gabbay <ogabbay@kernel.org>

Applied to drm-misc-next.
Thanks.
