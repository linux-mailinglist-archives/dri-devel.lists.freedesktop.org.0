Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDBC95CE30
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 15:42:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF4D410E879;
	Fri, 23 Aug 2024 13:42:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lkZmbWHL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 776EF10E879
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 13:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724420525; x=1755956525;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=kRO9UZ9q1MgoUEmt9DPJP/xt1hbpVz5KL9b/RGRxaKs=;
 b=lkZmbWHLOsdOWNFQ8GiEFXphNxoZu9qG4P6hqq7rPnd584meIk8HbveW
 a4oq+aHAGxE9/J5edqc5QyGRYz2EwKIorF84hwXPgWNI0yP1jnvT9o+OR
 N8ygZuesjbYZqynoRgHDzVnI8DQnuowTmtGAgFR1uzXWEWDaxAZOJYCsr
 gDOPN96pHtY1wxMhldKA1SvkMYSYohj/ZyafhXq4dx20/+/J2RmZ1EQJs
 213UZmGfwMbTIdrJJMkE/4pNxTHpUIsIS4vkm+RntiJSZHiTpqKGwFiBx
 fcgrsMoPM3qqPCEpKnrdyYEbocYiFNc0OacGVV1ak6eGzSVsv5NzqltgI g==;
X-CSE-ConnectionGUID: TUNLAeNsTu+JF9k7d9jgMQ==
X-CSE-MsgGUID: jWD8HY/fSRmtktiuYIdQxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="34046794"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="34046794"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 06:42:04 -0700
X-CSE-ConnectionGUID: 6ChqEbVCQh6TEzCiZFrXEQ==
X-CSE-MsgGUID: WLktGnJfSY+St4S6AAvRLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="62317633"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.246.23.121])
 ([10.246.23.121])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 06:42:03 -0700
Message-ID: <c3f6c959-7208-4930-8ec8-01007a3f1221@linux.intel.com>
Date: Fri, 23 Aug 2024 15:42:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] accel/ivpu: Add GEM buffer object management
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: dri-devel@lists.freedesktop.org
References: <35bdf086-adc6-408c-9cc8-a342eeebf313@stanley.mountain>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <35bdf086-adc6-408c-9cc8-a342eeebf313@stanley.mountain>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks. I agree this check makes no sense. I will remove it.

On 19.08.2024 20:58, Dan Carpenter wrote:
> Hello Jacek Lawrynowicz,
> 
> This is a semi-automatic email about new static checker warnings.
> 
> Commit 647371a6609d ("accel/ivpu: Add GEM buffer object management")
> from Jan 17, 2023, leads to the following Smatch complaint:
> 
>     ./drivers/accel/ivpu/ivpu_drv.c:119 ivpu_file_priv_put()
>     warn: variable dereferenced before check 'file_priv' (see line 117)
> 
> ./drivers/accel/ivpu/ivpu_drv.c
>    116		struct ivpu_file_priv *file_priv = *link;
>    117		struct ivpu_device *vdev = file_priv->vdev;
>                                            ^^^^^^^^^^^^^^^
> Dereference
> 
>    118	
>    119		drm_WARN_ON(&vdev->drm, !file_priv);
>                                          ^^^^^^^^^
> Pointless check.  If there is a NULL dereference it already prints a stack
> trace.  Also it's really unlikely that we're going to predict which pointer is
> going to lead to a NULL dereference ahead of time.
> 
>    120	
>    121		ivpu_dbg(vdev, KREF, "file_priv put: ctx %u refcount %u\n",
> 
> regards,
> dan carpenter
