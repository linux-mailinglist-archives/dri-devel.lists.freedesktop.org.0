Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E96957F28A4
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 10:22:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2AD110E457;
	Tue, 21 Nov 2023 09:22:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 055F289D4D
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 09:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700558563; x=1732094563;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=D8rQXBvxyMPSP+hXNQDn70ESSI5okWrCgNxnU67gemY=;
 b=TyeJzrFxiksy5UeY7KXmXPVMnY6ICQnVHk+NG2Hc0t1gsWibpRVOi1Kw
 lkSjMKi6ihlfWaQffs8wzcfaCmvhb+0ML9IdnpKkR50fDha/DKv1Sf8L/
 wJpCYzpete+7sT5CHSsj2UUFBm2MJOHl2we+79HJoY5vyU9SQDRfpPqzX
 72gv090PtcdLX/6UKo4pui/7+fHAaYjnpTNJu7U+fOZAF4o10xJzy0WGD
 dbdaoY8Hpg6aKfdFCyzYMZ2oMZygknuLn+5pFG7vqDesGYxJlTXESKa9y
 bxcI07CbtksgGhmyohMoSWP1TtTzGwKc+ysVZYexA9h71TZm72YPGcDyO w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="422898968"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; d="scan'208";a="422898968"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2023 01:22:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="766582362"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; d="scan'208";a="766582362"
Received: from cdeakx-mobl.amr.corp.intel.com (HELO localhost) ([10.252.58.54])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2023 01:22:40 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Bert Karwatzki <spasswolf@web.de>, dri-devel@lists.freedesktop.org
Subject: Re: drm scheduler redesign causes deadlocks [extended repost]
In-Reply-To: <36bece178ff5dc705065e53d1e5e41f6db6d87e4.camel@web.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <36bece178ff5dc705065e53d1e5e41f6db6d87e4.camel@web.de>
Date: Tue, 21 Nov 2023 11:22:38 +0200
Message-ID: <87bkbno3z5.fsf@intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>, Luben Tuikov <ltuikov89@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Danilo Krummrich <dakr@redhat.com>,
 Bert Karwatzki <spasswolf@web.de>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 21 Nov 2023, Bert Karwatzki <spasswolf@web.de> wrote:
> As this simple patch fixes the problem

Please use git send-email to send patches. Evolution botched up the
whitespace here.

BR,
Jani.


-- 
Jani Nikula, Intel
