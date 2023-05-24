Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3226170F0B2
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 10:30:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5498E10E594;
	Wed, 24 May 2023 08:29:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DBF110E594
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 08:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684916996; x=1716452996;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=cZJnn3qVDQ+eT1tyZCKbMzrq3JClL4kRJ0SWhK0XmIA=;
 b=Jukq/UyqcoDaiZOUn8HENaqcIhXFS2jmgHv9DKXo89x25Y/wmzStxtAT
 uqci16Qs6+qxi1zuNEW6s8e8ajbU65a7GYT0TVCnOPDjrXeorj8ePEWfl
 rCVYt3GgZPQr6jFJxgCYCjxMxapdRaLlCO1iw0TRyovO+0tH9Oj5CsXP8
 s0Skcnozoh8ygM34g+pIny0fH27guQSfTv1tqmeAeb3kNVzADb3arScCJ
 jdBLbrlQUuk+Wed0MFX9EOjgC2MbQG/uL9amiR50abEN7rH/di1gjK5Qo
 Qa2QzPbryKf841EOu+IgyEo1dQKpQAN+wAPxOJkONMoXHMro5lgbqUNDk Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="353520178"
X-IronPort-AV: E=Sophos;i="6.00,188,1681196400"; d="scan'208";a="353520178"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 01:29:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="816484649"
X-IronPort-AV: E=Sophos;i="6.00,188,1681196400"; d="scan'208";a="816484649"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 01:29:54 -0700
Date: Wed, 24 May 2023 10:29:52 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [PATCH 0/5] accel/ivpu: Add debugfs support
Message-ID: <20230524082952.GA867611@linux.intel.com>
References: <20230524074847.866711-1-stanislaw.gruszka@linux.intel.com>
 <CAFCwf11x5xJmCsX_hXeHC3Vhjd2-JMRJJWNbdO4_p_3CsUbSmQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFCwf11x5xJmCsX_hXeHC3Vhjd2-JMRJJWNbdO4_p_3CsUbSmQ@mail.gmail.com>
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
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

On Wed, May 24, 2023 at 10:55:08AM +0300, Oded Gabbay wrote:
> On Wed, May 24, 2023 at 10:49 AM Stanislaw Gruszka
> <stanislaw.gruszka@linux.intel.com> wrote:
> >
> > Add debugfs support for ivpu driver, most importantly firmware loging
> > and tracing.
> Hi,
> Without looking at the code I have 2 comments/questions:
> 
> 1. Please add an ABI documentation in Documentation/ABI/testing/ or
> Documentation/ABI/stable (if you are feeling courageous). You can see
> for example habana's file at
> Documentation/ABI/testing/debugfs-driver-habanalabs

We do not promise any ABI compatibility for debugfs for ivpu,
we can add, remove or modify at any time. Hence make no sense to add
documentation files to Documentation/ABI/ for us.

> 2. Is this synced with Christian's upcoming changes to the debugfs
> infra in drm ? If not, I might suggest to sync with that and wait
> until those patches are merged because they change the layout of
> debugfs nodes.

Is not synced. We can wait before Christian changes get in, what
hopefully will happen soon. But if not, ivpu debugfs can be modified
along with the changes. I can assist with that.

Regards
Stanislaw

