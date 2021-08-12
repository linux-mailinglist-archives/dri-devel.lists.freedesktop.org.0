Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F173EA904
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 19:01:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A751896A3;
	Thu, 12 Aug 2021 17:01:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51E2D896A3
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Aug 2021 17:01:49 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id ff9e8f40-fb8e-11eb-9082-0050568c148b;
 Thu, 12 Aug 2021 17:01:55 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 0332A194B81;
 Thu, 12 Aug 2021 19:01:52 +0200 (CEST)
Date: Thu, 12 Aug 2021 19:01:44 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Stultz <john.stultz@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH 4/4] drm/vgem: use shmem helpers
Message-ID: <YRVT+B69l74Lk4+A@ravnborg.org>
References: <20210812131412.2487363-1-daniel.vetter@ffwll.ch>
 <20210812131412.2487363-4-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210812131412.2487363-4-daniel.vetter@ffwll.ch>
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

Hi Daniel,

On Thu, Aug 12, 2021 at 03:14:12PM +0200, Daniel Vetter wrote:
> Aside from deleting lots of code the real motivation here is to switch
> the mmap over to VM_PFNMAP, to be more consistent with what real gpu
> drivers do. They're all VM_PFNMP, which means get_user_pages doesn't
> work, and even if you try and there's a struct page behind that,
> touching it and mucking around with its refcount can upset drivers
> real bad.
The only thing I understood of all this complicated stuff was "deleting
lots of code" which is a good thing.
You may want to s/VM_PFNMP/VM_PFNMAP/ before you push this.

	Sam
