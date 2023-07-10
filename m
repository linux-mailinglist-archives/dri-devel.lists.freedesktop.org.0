Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E68974D4E8
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 14:07:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68F2910E125;
	Mon, 10 Jul 2023 12:07:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1822410E125
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 12:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688990870; x=1720526870;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=vhQl0HD5I0/ESpqDJlfvf8LP7w3sp0fBVoVyKApq+B4=;
 b=YUeRusDdkOOj6lMqxPurlNDO+lKJzLG2DR7yOaaBlUIy+aaJIviCVHNI
 5+Q+hopL+r+GcNfAjudqdKJgu5DiMzp6sEgFqzqf5/tC6xslD8y8K6cf8
 lGbtV2mE40bdApFdBqip+CPDbkyFgN4SWm3ti0td6kCs+RFQSiOoq1ec1
 m0oissEQxvIPMDHRxlfCShc+HbK04KJV/zrmITyJMN4ziYmVZBcIRVbSk
 nV3vGMlQ7lWXg3pN+Kgax3ZwmBbDcNbrgH7/KBTSmTIhfWwvyxaTYADS5
 DLUXYERorgUNs2I9vrSG9iRyLpX6zF79+uJlu0UaPae9PtRUE7sZJVTm/ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="344652538"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="344652538"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 05:07:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="810792645"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="810792645"
Received: from stoicaan-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.52.170])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 05:07:45 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, suijingfeng
 <suijingfeng@loongson.cn>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Li Yi <liyi@loongson.cn>
Subject: Re: [PATCH] drm/loongson: Remove a useless check in
 cursor_plane_atomic_async_check()
In-Reply-To: <13d4c853-ed7b-f0f5-dffb-a7811f2da249@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230710102411.257970-1-suijingfeng@loongson.cn>
 <6c7bbce7-5521-b868-019f-bce26f309730@suse.de>
 <8182fecd-d290-293a-d963-ddbea79dbf03@loongson.cn>
 <87r0pghtu9.fsf@intel.com> <13d4c853-ed7b-f0f5-dffb-a7811f2da249@suse.de>
Date: Mon, 10 Jul 2023 15:07:43 +0300
Message-ID: <87o7kkhsvk.fsf@intel.com>
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
Cc: loongson-kernel@lists.loongnix.cn, Dan Carpenter <dan.carpenter@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 10 Jul 2023, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Should be OK; it's an isolated driver. I did a review early on and after 
> ~13 revisions I asked for it to be merged. It's actually a bit hard to 
> find reviewers.

Fair enough.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
