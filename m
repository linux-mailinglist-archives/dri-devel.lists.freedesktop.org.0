Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF4266006F
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 13:43:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A882F10E14B;
	Fri,  6 Jan 2023 12:43:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CFCD10E14B
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 12:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673009010; x=1704545010;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xOS8ybbB3+KzsmrdJ3+9gcTHp2qLgugWj7IXSCxM/lU=;
 b=JZf0bODkTQH07/Lh1LhSnKzgvBTGvZYr9dRR3YhwI3q9BEQPx8IRUcpe
 VoQgleUStNxx/afiplr7BXgFde9c3I790bi5d/Ed932jQ+dhEUTWsu7dD
 7XBuHV1UUQeTCB5+FoRYalGci2JU6ORDq9DKrAvYqchuAoP5kkVIXg98p
 mZfwN83riioJbw97+i8fAVj61kGgj5Lhdfw++Y/54cOFPCPh56xO6AtEP
 rxN86x8KIr9lcdxhhNPCJ54YMZyAI7VwGIMXMIAaXhNmovZ0W0Ayc4PQB
 9gk8Ohc+zf6WVlyhasuwu7fhqHJ2iNGWsCwJeHR2skpBAI3wR/Qruanw9 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10581"; a="320173792"
X-IronPort-AV: E=Sophos;i="5.96,305,1665471600"; d="scan'208";a="320173792"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2023 04:43:29 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10581"; a="763511635"
X-IronPort-AV: E=Sophos;i="5.96,305,1665471600"; d="scan'208";a="763511635"
Received: from joe-255.igk.intel.com (HELO localhost) ([172.22.229.67])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2023 04:43:27 -0800
Date: Fri, 6 Jan 2023 13:43:25 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v4 1/7] accel/ivpu: Introduce a new DRM driver for Intel
 VPU
Message-ID: <20230106124325.GC1586324@linux.intel.com>
References: <20221208110733.5498-1-jacek.lawrynowicz@linux.intel.com>
 <20221208110733.5498-2-jacek.lawrynowicz@linux.intel.com>
 <Y7bJLkXF7xFYX4Qe@phenom.ffwll.local>
 <ff231f90-9b67-7f47-b543-e8194f3cdec6@quicinc.com>
 <CAFCwf13uupxNxc+Ru3zEa_Wn1asJ9UgpnyDgyFQKhEPC8qVtbQ@mail.gmail.com>
 <Y7fpr69AXYYo2O25@phenom.ffwll.local>
 <20230106095634.GB1586324@linux.intel.com>
 <CAKMK7uEu=aKCVgNfzqVE-NKX9O6HyNmYKORuHcK4Y=j=kmRDMw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uEu=aKCVgNfzqVE-NKX9O6HyNmYKORuHcK4Y=j=kmRDMw@mail.gmail.com>
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
Cc: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, dri-devel@lists.freedesktop.org,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>, tzimmermann@suse.de,
 andrzej.kacprowski@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 06, 2023 at 11:44:58AM +0100, Daniel Vetter wrote:
> > > The problem is going to happen as soon as you have cross-vendor userspace.
> > > Which I'm kinda hoping is at least still the aspiration. Because with
> > > cross-vendor userspace you generally iterate & open all devices before you
> > > select the one you're going to use. And so we do kinda need a distinction,
> > > or we need that the single-user drivers also guarantee that open() is
> > > cheap.
> >
> > FWIW we had good support in ivpu for probe open's in form of lazy context
> > allocation. It was removed recently due to review feedback that this is
> > unnecessary, but we can add it back.
> 
> Yeah once you have more than 1 multi-user accel chip in the system you
> need to do that. Which is really the reason why I think smashing
> multi-user client accel things into render is good, it forces drivers
> to suck less.
> 
> On that topic, does your userspace still do the drmIoctl() wrapper?

Yes, it still does. We released the code BTW, the wrapper can be seen here:
https://github.com/intel/linux-vpu-driver/blob/b6ed73cabf87f461cbbe4427e1b9351a548d790b/umd/vpu_driver/source/os_interface/vpu_driver_api.cpp#L41

Regards
Stanislaw
