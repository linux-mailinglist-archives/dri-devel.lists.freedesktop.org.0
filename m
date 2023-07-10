Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F0C74D4C2
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 13:47:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A5F010E14D;
	Mon, 10 Jul 2023 11:47:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C695B10E14D
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 11:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688989620; x=1720525620;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=w4dV9H7pVRIxcuMaxlX5D7urUgvVv34X8a5DfkzUas0=;
 b=kPisxwlj6YpeWpB8/A2YktX0aOz8l6E9pJ9zeAhOGAuFPUsOhJxMQyNa
 LoENMOtfP+TZRTa6LY2vBNXdCvVV5cFgoKIftnKuXO4DsHlR+oceqse6F
 KXR/XE998IvOA5M4Ic0YtXWxqh68QQ9ohixNTBUosqDxYsxqGcOhs9Wsb
 GVHy7rB5YBUvj4dtLzRoVPY/0WHmoo7e3ky5CbIsVoZ/cmEnmVXmiiCwn
 vvLqOp4Pi4krDNuVabhi4NQ89fatlgZ1ESBbrXRWBfXy5OgooSqc828x6
 RrBoqWMnssx5/X1Sqqcfcfq2wEgj7ZxPXC2F3zoOwdQyBlTslA+qY032C A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="366895493"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="366895493"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 04:46:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="834244024"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="834244024"
Received: from stoicaan-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.52.170])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 04:46:57 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: suijingfeng <suijingfeng@loongson.cn>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Li Yi <liyi@loongson.cn>
Subject: Re: [PATCH] drm/loongson: Remove a useless check in
 cursor_plane_atomic_async_check()
In-Reply-To: <8182fecd-d290-293a-d963-ddbea79dbf03@loongson.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230710102411.257970-1-suijingfeng@loongson.cn>
 <6c7bbce7-5521-b868-019f-bce26f309730@suse.de>
 <8182fecd-d290-293a-d963-ddbea79dbf03@loongson.cn>
Date: Mon, 10 Jul 2023 14:46:54 +0300
Message-ID: <87r0pghtu9.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: loongson-kernel@lists.loongnix.cn, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 10 Jul 2023, suijingfeng <suijingfeng@loongson.cn> wrote:
> On 2023/7/10 18:39, Thomas Zimmermann wrote:
>> but that driver is not yet in our tree?
>>
>
> I already applied(push) drm/loongson driver to drm-misc-next branch,
>
> What do you means that by "not yet in our tree", linux kernel side?
>
> Am I missing something ?

Hmm, indeed there's commit f39db26c5428 ("drm: Add kms driver for
loongson display controller")... but it only has one Acked-by from
Thomas that I can't find on any lists, and zero Reviewed-by.

Usually, the bigger the change, the more acks/reviews you need. Did
Thomas really ack this to be merged without recorder reviews? :o


BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
