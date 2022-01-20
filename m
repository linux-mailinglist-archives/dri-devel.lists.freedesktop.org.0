Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3282494B12
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 10:50:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C508D10E27A;
	Thu, 20 Jan 2022 09:50:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8706710E285;
 Thu, 20 Jan 2022 09:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642672240; x=1674208240;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=XcNQCT88V6+x4YNFwMV/mTmNxx13Q91Zj8HJkW17GnM=;
 b=DCJza3tIsKqgZgDrw5DzFZVVk1Cy4HxwrXkTHA6lC4jbUEaTdWqERAIR
 4Ryj8/R7aB4GUmurH98vTk5xHrcSfnVL5KH2seMxOTRcj/3K0csAJiMUu
 sJa90NjFGsiadL4UMAF6GUhA7QkIRYFhRJK3f17NqCrBDM+sQIrXN1IZV
 OUjwCW+kEJ9Oy8CQlUb2+uDJxReqmgu3MXitEECPsriN5OzlaA/t2u0bf
 o67mLLf361C6fBWxwifpLYRQHphYGUBG6yJ+uEBbmPx8WXB2RnLV0mkMO
 kwH6jWlmjdpFby3mHfcliHsf3G9r8l9DoHoB3E3ir5ELcb5XL6m9DnI2X g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10232"; a="331665856"
X-IronPort-AV: E=Sophos;i="5.88,302,1635231600"; d="scan'208";a="331665856"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 01:50:40 -0800
X-IronPort-AV: E=Sophos;i="5.88,302,1635231600"; d="scan'208";a="477734540"
Received: from davidfsc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.252.52.140])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 01:50:32 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: build warning after merge of the drm-misc tree
In-Reply-To: <20220120141951.30609ba3@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211015210104.0f034544@canb.auug.org.au>
 <20220120141951.30609ba3@canb.auug.org.au>
Date: Thu, 20 Jan 2022 11:50:27 +0200
Message-ID: <87y23aag7w.fsf@intel.com>
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 20 Jan 2022, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> On Fri, 15 Oct 2021 21:01:04 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> After merging the drm-misc tree, today's linux-next build (htmldocs)
>> produced this warning:
>> 
>> include/drm/drm_modeset_lock.h:74: warning: Function parameter or member 'stack_depot' not described in 'drm_modeset_acquire_ctx'
>> 
>> Introduced by commit
>> 
>>   cd06ab2fd48f ("drm/locking: add backtrace for locking contended locks without backoff")
>
> I am still getting this warning.

Sorry about that, patch on the list [1].

Thanks,
Jani.


[1] https://patchwork.freedesktop.org/patch/msgid/20220120094856.3004147-1-jani.nikula@intel.com

-- 
Jani Nikula, Intel Open Source Graphics Center
