Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7122FE9A8
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 13:10:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B62F86E08A;
	Thu, 21 Jan 2021 12:10:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0042B6E833;
 Thu, 21 Jan 2021 12:10:35 +0000 (UTC)
IronPort-SDR: umyJkLmOG/p+L9XnpThEU/58lA7Sln6+2fYg6OKam31mqbcQO+Av6yZSpum4vBE6w1Jy3OwpIv
 n2Px4ZKh5uRQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9870"; a="175752262"
X-IronPort-AV: E=Sophos;i="5.79,363,1602572400"; d="scan'208";a="175752262"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2021 04:10:12 -0800
IronPort-SDR: il40rLBEIiI8pX7t4vZ+LGaXmw+K5Zuhq8F/ucTuRv9ugMJli+VFrQawlNuwpyZsnWrzAtQLAr
 pKDdEABFtUlA==
X-IronPort-AV: E=Sophos;i="5.79,363,1602572400"; d="scan'208";a="385276990"
Received: from cohrs-mobl.ger.corp.intel.com (HELO localhost) ([10.252.51.23])
 by orsmga008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2021 04:10:09 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] drm/msm/dp: fix build after dp quirk helper change
In-Reply-To: <CAOMZO5DBXerrJEvvXnfzjB376SMKVJTyo9MRD0H0u9pz8p+2yg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210120110708.32131-1-jani.nikula@intel.com>
 <92f48ffdfa30c3941e0fd22337217f0b10d75ec8.camel@redhat.com>
 <875z3qmt5b.fsf@intel.com>
 <CAOMZO5Du9+DTYpuG3FNLRrO_LJVSJa3cdJWWwt_qzQDthGESkg@mail.gmail.com>
 <8735yums94.fsf@intel.com>
 <CAOMZO5DBXerrJEvvXnfzjB376SMKVJTyo9MRD0H0u9pz8p+2yg@mail.gmail.com>
Date: Thu, 21 Jan 2021 14:10:06 +0200
Message-ID: <87pn1ylcdd.fsf@intel.com>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 21 Jan 2021, Fabio Estevam <festevam@gmail.com> wrote:
> On Thu, Jan 21, 2021 at 8:41 AM Jani Nikula <jani.nikula@intel.com> wrote:
>
>> On top of what? Current drm-tip?
>
> It was on top of next-20210121.

Kinda catch-22 because next has dropped current drm-intel-next because
it doesn't build because of the issue this patch fixes. ;)

BR,
Jani.

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
