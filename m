Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14552621003
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 13:13:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98AF810E412;
	Tue,  8 Nov 2022 12:13:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F105810E406
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 12:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667909600; x=1699445600;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=J9croqNHth/OFixMrVnoju9x3bFN8kkcaM2ybFxjevs=;
 b=Tujy2esYiCIfddB7mt3GqfIyc0R8HaTIjzeqRJbD5Un7Psxvv6TSpLjw
 0smOcpIPEYRuXMlXUdrsbYpOQOjmRl/j7ZKuGEToEFHw8Q7Ote9/4aMYs
 BW8/rt01k+rFe82eMM9Rrs7EBL7ckBWD7SdquZ/Tsik5aepwGJHH6pdyy
 JnA/Car680mmTH/OAqjO+4TFaSclhjb7wiyT/I7P2XP72y7HD0nFJcS1b
 KLJP30Me6ndA3jGIC4nz6dwMX00gGl5zEhztzqSLwrOKY4B7hFoDe/F/Q
 kCE7+O4wIOeFjMMTN4HUe/8rVHKZ/j2NRe5jBkiXnmzhBK6LjN7e1FmHu w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="294048474"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; d="scan'208";a="294048474"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2022 04:13:20 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="881494589"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; d="scan'208";a="881494589"
Received: from shylandx-mobl2.ger.corp.intel.com (HELO [10.213.210.50])
 ([10.213.210.50])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2022 04:13:18 -0800
Message-ID: <9368ba5b-73a9-4e72-a71d-9c34e202ce7a@linux.intel.com>
Date: Tue, 8 Nov 2022 12:13:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: drm-tip merge conflict caused by recent merge of amd-drm-next
 into drm-next
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <1b0aa084-45ec-32e0-e425-94df04d32ba3@redhat.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <1b0aa084-45ec-32e0-e425-94df04d32ba3@redhat.com>
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
Cc: Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 08/11/2022 09:24, Hans de Goede wrote:
> Hi Alex, et al.,
> 
> I just pushed 2 simple DMI quirk patches
> (for drivers/gpu/drm/drm_panel_orientation_quirks.c)
> to drm-misc-fixes.
> 
> At the end of the dim push-branch I noticed that
> rebuilding drm-tip failed due to a merge error
> when merging in drm-next .
> 
> Looking at the 3-way diff of the conflict, this seems
> to be caused by amd-drm-next-6.2-2022-11-04 landing
> in drm-next.
> 
> I'm not familiar with the code causing the conflict
> and I believe this is best resolved by someone who
> is more familiar with the code.

We really do need a better process for these things. In recent past I 
tried pinging on IRC but that was a bit hit and miss. More miss than hit 
even.

This one I actually fixed up, since I had an i915 conflict to deal with 
due drm-intel-fixes, it looked straight forward and did not feel like 
waiting. Please guys do check if I did it correctly.

Regards,

Tvrtko
