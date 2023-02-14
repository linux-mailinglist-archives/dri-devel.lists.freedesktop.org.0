Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9526960B7
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 11:27:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB28E10E863;
	Tue, 14 Feb 2023 10:27:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F48210E0E5;
 Tue, 14 Feb 2023 10:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676370470; x=1707906470;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Id6fom4rwWKnzjKoRMVRzck8nHMNFz0Bm51PQXPWMUg=;
 b=mHyfLOCikyX+HXM+a/a2m5WNw9EnI0hzLBoqPtjJDEISxtM/rgFOKeQZ
 ghLS+upnYO7i9Qvqi/M6qnba4/6Qw9AJ5ubaXHGpfTSKofVGJExfjiXtC
 Xx3bIuRYchZ4sovw9qH94Znt3KM7hc1/z83UvzWSZsVPEm5jQUSKwRbRM
 HaxSrh3m68mwXT5u7XpWdNFUMbepNZRM0hfHcK8JXId3smso+7Mv+M43w
 TMkHI0IZZ3RjtQL9ibjyxsPyIH1r5RuPJJGQLUaM5r1wDUbm1z4vKndMb
 gUym+kFZLmE3+KC79O5ycce6m+F2W7+TU4gZbVnrWInzNfiGYwKVtTbEq Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="417346356"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="417346356"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 02:27:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="669116295"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="669116295"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.55])
 by orsmga002.jf.intel.com with SMTP; 14 Feb 2023 02:27:46 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 14 Feb 2023 12:27:45 +0200
Date: Tue, 14 Feb 2023 12:27:45 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [Intel-gfx] [PATCH 1/2] drm: Introduce plane SIZE_HINTS property
Message-ID: <Y+tiIYMVnQ6gyJ/e@intel.com>
References: <20230208040911.12590-1-ville.syrjala@linux.intel.com>
 <20230208040911.12590-2-ville.syrjala@linux.intel.com>
 <20230208141312.76df0cb0.pekka.paalanen@collabora.com>
 <Y+OdtR78JnQOTj38@intel.com> <Y+QRSH3kLD4Xrktc@intel.com>
 <20230209135105.4137872c.pekka.paalanen@collabora.com>
 <20230214114227.7fa94b78@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230214114227.7fa94b78@eldfell>
X-Patchwork-Hint: comment
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
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 14, 2023 at 11:42:27AM +0200, Pekka Paalanen wrote:
> On Thu, 9 Feb 2023 13:51:05 +0200
> Pekka Paalanen <pekka.paalanen@collabora.com> wrote:
> 
> > Maybe we could refine this so that userspace uses the stride and height
> > implied by the caps for allocation, and then use the exact cursor image
> > size for AddFB2? And have drivers pick any size between those two they
> > can use. The kernel would need the userspace to promise that the
> > padding is always zero-initialized, so the driver can simply scan out
> > any area of the buffer it needs.
> > 
> > Then we don't need SIZE_HINTS.
> 
> Would there be any problem with this?
> 
> If this works, it would seem the superior solution to me, because
> userspace does not need to guess or test for the exact right size.
> Simply allocate at the CAP size, pad the cursor image with transparent
> pixels, and let the kernel scan out the optimal area.

No, the hardware cannot scan out a smaller area because the
stride will be wrong.

> 
> And if the kernel needs to do a pixel format conversion, it only needs
> to do the optimal minimum amount of work.

Involving the CPU (or GPU I suppose but that could involve big extra
latencies) in the kernel to massage the pixels around every time
seems extremely sub-optimal. Seems like we might as well use a
software cursor at that point.

-- 
Ville Syrjälä
Intel
