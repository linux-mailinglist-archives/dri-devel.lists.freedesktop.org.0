Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33253660131
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 14:30:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69DD010E182;
	Fri,  6 Jan 2023 13:29:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6450710E182
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 13:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673011796; x=1704547796;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hUqkOk5KDn6bslS8X0E02QQQKTePoGBe+vYPqeHnfJ4=;
 b=leYVaXfgD1TxsW63PFRsh1eHxpyNIFe5C/LBNgfYAEvRQ/KhIcz0e00R
 xDYCsQJ3hRHdx0eCwJOiiJS53KCstASgh0heXwW7y52PAZfk/AFMyLRAQ
 hXpV16UoUvNYkMrF3q7sUKRtkxuYcZrwe0rxHENoWJEpWmjyyq3fSpmsp
 uVzdBuYdQQRorG83UxPAAqcC4uy31rKmYSIAd2GfPMKk36aXMpHAeGeBo
 mVq6FG6IyrKfB9Xd97tOgs8PhRiA42rVyLEiEpBXM6vMCaqcDZV0mjgGc
 MBPpwUNfZR1rL7omiprJdLnJ3LyHHkr+kHeVqk1owgnkmxWA+NHil4jJP Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10581"; a="386927650"
X-IronPort-AV: E=Sophos;i="5.96,305,1665471600"; d="scan'208";a="386927650"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2023 05:29:55 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10581"; a="779964119"
X-IronPort-AV: E=Sophos;i="5.96,305,1665471600"; d="scan'208";a="779964119"
Received: from joe-255.igk.intel.com (HELO localhost) ([172.22.229.67])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2023 05:29:53 -0800
Date: Fri, 6 Jan 2023 14:29:51 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Andrew Davis <afd@ti.com>
Subject: Re: [PATCH v4 3/7] accel/ivpu: Add GEM buffer object management
Message-ID: <20230106132951.GE1586324@linux.intel.com>
References: <20221208110733.5498-1-jacek.lawrynowicz@linux.intel.com>
 <20221208110733.5498-4-jacek.lawrynowicz@linux.intel.com>
 <5b068dd9-1363-f611-9f86-acc224c10621@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b068dd9-1363-f611-9f86-acc224c10621@ti.com>
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
Cc: quic_jhugo@quicinc.com, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 andrzej.kacprowski@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

On Thu, Jan 05, 2023 at 12:46:51PM -0600, Andrew Davis wrote:
> On 12/8/22 5:07 AM, Jacek Lawrynowicz wrote:
> > Adds four types of GEM-based BOs for the VPU:
> >    - shmem
> >    - userptr
> 
> Do you have some specific need for userptr that would not
> be covered by prime import + heaps? I'm just trying to get
> a feel for the typical use-cases for these.

Honestly, I'm not sure. I think we have use-cases that justify
adding userptr, but have to check with our team members that
better understand the requirements.

Regards
Stanislaw
