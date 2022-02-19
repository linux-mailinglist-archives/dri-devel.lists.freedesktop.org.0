Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC9B4BC606
	for <lists+dri-devel@lfdr.de>; Sat, 19 Feb 2022 07:34:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68C0810F161;
	Sat, 19 Feb 2022 06:34:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9641410F156;
 Sat, 19 Feb 2022 06:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645252468; x=1676788468;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=nhxfLuXZL5Vlkm4L8vSBxdAPYYbKn8gv3KUvFpFf0zk=;
 b=RqIFAvx5MpHAigEFhgrTNq0x1ptqQIsrAHtdDUd0jPhW3PQ34fr0rPhe
 5TeobbhEP6U4nWz1maS8IHeNG7zuy1XhMV7pvfJ6AJlqmvn+oXLV7V7As
 H/c0tffuX7MTo6jZtM2rDkfA/xCuUVlaACt20mYkj45Zk4EDsmLrQtD13
 QfSJQM1xQ3II86TJwGfb7FIqg4R80jOTpHVdaEU8mt0NukunCbqn4xWj3
 kQkJIc/IRm3slhH2w9YCA3l0OPewTfpIPg9ctlfN74DDGwAXxQUkVCX2g
 ryEgRh0I0TvhcvCKpOz91DkrqJ/efG8xGvuPUG+po7lgM5Gpiy9rub0dm Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10262"; a="248857894"
X-IronPort-AV: E=Sophos;i="5.88,381,1635231600"; d="scan'208";a="248857894"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 22:34:28 -0800
X-IronPort-AV: E=Sophos;i="5.88,381,1635231600"; d="scan'208";a="775499233"
Received: from rkotlyar-mobl1.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.149.118])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 22:34:27 -0800
Date: Fri, 18 Feb 2022 22:34:30 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Auld <matthew.william.auld@gmail.com>
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915: Kill the fake lmem support
Message-ID: <20220219063430.me564f4lu4ufpb6g@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220217175634.4128754-1-lucas.demarchi@intel.com>
 <CAM0jSHM3cf36p_+V3Nx-6mKzARkfPjcPVKnxmx49wUcRKo5bbQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAM0jSHM3cf36p_+V3Nx-6mKzARkfPjcPVKnxmx49wUcRKo5bbQ@mail.gmail.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 17, 2022 at 06:09:53PM +0000, Matthew Auld wrote:
>On Thu, 17 Feb 2022 at 17:55, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>>
>> This was useful for early development of lmem, but it's not used
>> anymore, so remove it.
>>
>> v2: Remove unneeded fields from struct intel_memory_region
>>
>> Cc: Chris Wilson <chris@chris-wilson.co.uk>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Thanks, applied.

Lucas De Marchi
