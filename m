Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FBE557606
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 10:57:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47EF311A595;
	Thu, 23 Jun 2022 08:57:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1793D11A594;
 Thu, 23 Jun 2022 08:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655974622; x=1687510622;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=5IyY1fkByFzlLbLh0+M1fnVKnGDtRw2JAXOgqXmXLM4=;
 b=Q69YW4uUoPz8Wvfy5MxDmEWgfANZUQcyuHkVFWm6N53sgIaDZsrPwe0J
 4VehF2cgq8/Z/ADjUIrCuqWJltBEnKAV7kaUf+wKM7EdlP8Ppkp1UOqCh
 cX6yZEsuQp77pMgV8aFO/wx900TfYg69krOIEE74ae1bQC9UZzEHkbnqA
 CZcfFh3cGia3chV7Iggba5M5H2QYQ7/l+DLrAijKwQ5qgQZUK+j+cM1jv
 WWa39gj2JIAl5dy2r/i4xtcLl1nfTOOr0AEydKgisEratJTNFHb+aacVt
 xrwOWf0AlE8NsCySiNwbw2xQuLyuoFcgtYQngmUO6WVKj4S9jYm0V6zeY A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="342349303"
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; d="scan'208";a="342349303"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2022 01:57:01 -0700
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; d="scan'208";a="592611492"
Received: from gknielse-mobl.amr.corp.intel.com (HELO localhost)
 ([10.252.61.112])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2022 01:56:58 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PULL] drm-misc-next
In-Reply-To: <12471428-9bfb-0249-c305-8009c5af1f25@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <YrQeAAVvQ6jxu2dl@linux-uq9g>
 <a3bf32dc-bcae-496c-0c3a-5fe5c5c89c3f@suse.de> <87r13frdjl.fsf@intel.com>
 <12471428-9bfb-0249-c305-8009c5af1f25@suse.de>
Date: Thu, 23 Jun 2022 11:56:56 +0300
Message-ID: <87bkujrc4n.fsf@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dim-tools@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 23 Jun 2022, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Hi
>
> Am 23.06.22 um 10:26 schrieb Jani Nikula:
>> On Thu, 23 Jun 2022, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>>> I forgot to mention that we backmerged v5.19-rc2. That's why the list of
>>> changed files is so long.
>> 
>> I thought we should only backmerge Linus' tree via backmerging drm-next,
>> which avoids this problem altogether.
>
> I did backmerge via drm-next.

Then I'm confused how it all shows up the the diffstat. If you backmerge
drm-next to drm-misc-next, and then generate your drm-misc-next pull
request against drm-next (dim pull-request drm-misc-next drm/drm-next),
I don't think it should show up.

BR,
Jani.


>
> Best regards
> Thomas
>
>> 
>> BR,
>> Jani.
>> 
>> 

-- 
Jani Nikula, Intel Open Source Graphics Center
