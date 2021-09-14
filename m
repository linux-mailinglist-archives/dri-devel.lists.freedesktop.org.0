Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A415B40B1D0
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 16:46:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F7FF6E4C5;
	Tue, 14 Sep 2021 14:46:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F37C6E4C5;
 Tue, 14 Sep 2021 14:46:03 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10106"; a="202183923"
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="202183923"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 07:46:02 -0700
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="515957324"
Received: from smfische-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.209.110.211])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 07:46:02 -0700
Date: Tue, 14 Sep 2021 07:46:01 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Andi Shyti <andi.shyti@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/4] drm/i915: rename debugfs_gt files
Message-ID: <20210914144601.pws37hme5v3teqyg@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20210909004941.379035-1-lucas.demarchi@intel.com>
 <87o88v34bm.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <87o88v34bm.fsf@intel.com>
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

On Tue, Sep 14, 2021 at 12:16:13PM +0300, Jani Nikula wrote:
>On Wed, 08 Sep 2021, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> We shouldn't be using debugfs_ namespace for this functionality. Rename
>> debugfs_gt.[ch] to intel_gt_debugfs.[ch] and then make functions,
>> defines and structs follow suit.
>>
>> While at it and since we are renaming the header, sort the includes
>> alphabetically.
>
>I didn't do a detailed review, maybe someone should, but superficially
>seems good. On the series,
>
>Acked-by: Jani Nikula <jani.nikula@intel.com>

thanks. What about the question I raised on

intel_gt_register_debugfs() vs
intel_gt_debugfs_register()?

and

intel_gt_pm_register_debugfs() vs
intel_gt_pm_debugfs_register()?

what would be prefered here?

thanks
Lucas De Marchi
