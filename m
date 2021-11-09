Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A174F44A7AF
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 08:40:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 521906E56D;
	Tue,  9 Nov 2021 07:40:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD8CE6E56A;
 Tue,  9 Nov 2021 07:40:18 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10162"; a="232344148"
X-IronPort-AV: E=Sophos;i="5.87,219,1631602800"; d="scan'208";a="232344148"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2021 23:40:17 -0800
X-IronPort-AV: E=Sophos;i="5.87,219,1631602800"; d="scan'208";a="503399745"
Received: from stkachen-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.251.216.106])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2021 23:40:10 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
In-Reply-To: <20211106133314.42e3e308@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211015202648.258445ef@canb.auug.org.au>
 <20211101194223.749197c5@canb.auug.org.au>
 <20211105171517.287de894@canb.auug.org.au> <874k8qampc.fsf@intel.com>
 <20211106133314.42e3e308@canb.auug.org.au>
Date: Tue, 09 Nov 2021 09:40:08 +0200
Message-ID: <87zgqd6alj.fsf@intel.com>
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
Cc: Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 06 Nov 2021, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Jani,
>
> On Fri, 05 Nov 2021 13:03:43 +0200 Jani Nikula <jani.nikula@intel.com> wrote:
>>
>> I probably should have pushed c4f08d7246a5 ("drm/locking: fix
>> __stack_depot_* name conflict") to drm-misc-next-fixes.
>
> Please do so as builds will start failing otherwise :-(

Thomas/Maxime/Maarten, okay to cherry-pick that to drm-misc-next-fixes?

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
