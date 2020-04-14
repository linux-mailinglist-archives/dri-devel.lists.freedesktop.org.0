Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6AC1A7B94
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 15:00:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1FB46E199;
	Tue, 14 Apr 2020 13:00:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 799316E199
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 13:00:42 +0000 (UTC)
IronPort-SDR: sIO9D9ogbFudYdv4eNGPYlSUQOLVgoz7CFx0r5ylkjjEDmz/Er2FPzjMKmipUjQYp4eF+Qedrc
 PUlNG7z1zhUw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2020 06:00:42 -0700
IronPort-SDR: PK96sqppHm6BAZTp40dXNxiwYyTHsXkBs6S3+wEg2PS5uKVCQkdl5DIEu5DvD/I6kRDZUhiNs5
 EpLLBuWoiZ3w==
X-IronPort-AV: E=Sophos;i="5.72,382,1580803200"; d="scan'208";a="427052761"
Received: from mdoerbec-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.38.76])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2020 06:00:39 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Tang Bin <tangbin@cmss.chinamobile.com>,
 Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH] drm/dp_mst: Fix drm_dp_mst_topology.c selftest
 compilation warning
In-Reply-To: <ba9202f9-0373-52e7-9d74-4997e33c516d@cmss.chinamobile.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200411141740.14584-1-tangbin@cmss.chinamobile.com>
 <CADnq5_MD6LkOEJC-hKKQSAmFAHY7LMZ2WU_ER-ttNrP20AxoQA@mail.gmail.com>
 <87imi2miin.fsf@intel.com>
 <ba9202f9-0373-52e7-9d74-4997e33c516d@cmss.chinamobile.com>
Date: Tue, 14 Apr 2020 16:00:36 +0300
Message-ID: <877dyimdcb.fsf@intel.com>
MIME-Version: 1.0
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
Cc: Dave Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 14 Apr 2020, Tang Bin <tangbin@cmss.chinamobile.com> wrote:
> But someone may query '{}' could not initialize all members, that's
> why I brought '{{{0}}}' up.

{} *does* initialize everything. What are you trying to say?

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
