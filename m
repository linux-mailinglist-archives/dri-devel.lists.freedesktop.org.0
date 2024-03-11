Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC498877BB5
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 09:32:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E327510FCD0;
	Mon, 11 Mar 2024 08:32:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4334D10FC6C
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 08:32:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC7EFFEC;
 Mon, 11 Mar 2024 01:32:43 -0700 (PDT)
Received: from [10.163.76.138] (unknown [10.163.76.138])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1069B3F762;
 Mon, 11 Mar 2024 01:32:04 -0700 (PDT)
Message-ID: <149881d7-f14d-4a63-9a65-f64788d42516@arm.com>
Date: Mon, 11 Mar 2024 14:02:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/arm/komeda: Fix komeda probe failing if there are
 no links in the secondary pipeline
Content-Language: en-US
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch
References: <20240219100915.192475-1-faiz.abbas@arm.com>
 <20240219100915.192475-2-faiz.abbas@arm.com>
 <ZehzHJonrS7dLSHn@e110455-lin.cambridge.arm.com>
From: Faiz Abbas <faiz.abbas@arm.com>
In-Reply-To: <ZehzHJonrS7dLSHn@e110455-lin.cambridge.arm.com>
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

Hi,

On 3/6/24 7:13 PM, Liviu Dudau wrote:
> Hi Faiz,
>
> On Mon, Feb 19, 2024 at 03:39:13PM +0530, Faiz Abbas wrote:
>> Since commit f7936d6beda9 ("drm/arm/komeda: Remove component framework and
>> add a simple encoder"), the devm_drm_of_get_bridge() call happens
>> regardless of whether any remote nodes are available on the pipeline. Fix
>> this by moving the bridge attach to its own function and calling it
>> conditional on there being an output link.
>>
>> Fixes: f7936d6beda9 ("drm/arm/komeda: Remove component framework and add a simple encoder")
> I don't know what tree you're using, but the commit that you're quoting here is
> actually 4cfe5cc02e3f. I will fix it when I merge the patch.

Whoops. That would have been tough to fix. Thanks for catching it. I will be more careful in the future.

Thanks,

Faiz

