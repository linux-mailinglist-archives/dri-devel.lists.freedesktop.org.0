Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0595F47240B
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 10:34:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE1D810E6EF;
	Mon, 13 Dec 2021 09:34:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAD5A10E6EF
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 09:34:15 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10196"; a="262822116"
X-IronPort-AV: E=Sophos;i="5.88,202,1635231600"; d="scan'208";a="262822116"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 01:34:15 -0800
X-IronPort-AV: E=Sophos;i="5.88,202,1635231600"; d="scan'208";a="464555913"
Received: from ppolasze-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.20.7])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 01:34:12 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] drm/dp: Actually read Adjust Request Post Cursor2 register
In-Reply-To: <202112100853.FDB294B86@keescook>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211203084354.3105253-1-keescook@chromium.org>
 <87o85r4a4f.fsf@intel.com> <202112082220.81ECDC63D@keescook>
 <2b7d760c-9ab8-b607-efc6-1ed276d67668@amd.com>
 <202112091539.6B349AC@keescook> <87a6h83hb7.fsf@intel.com>
 <202112100853.FDB294B86@keescook>
Date: Mon, 13 Dec 2021 11:34:09 +0200
Message-ID: <87y24o7sry.fsf@intel.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-hardening@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Thierry Reding <treding@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 10 Dec 2021, Kees Cook <keescook@chromium.org> wrote:
> On Fri, Dec 10, 2021 at 12:06:20PM +0200, Jani Nikula wrote:
>> Post Cursor2 was completely optional for the transmitter even before it
>> was deprecated.
>> 
>> And now we'd be adding 5 bytes extra to all link status reads. To fix
>> the only user of drm_dp_get_adjust_request_post_cursor() that apparently
>> has never worked as intended. I'm just not convinced.
>> 
>> I was trying to look through the implications of DP_LINK_STATUS_SIZE
>> increase, and at least drm_dp_dpcd_read_phy_link_status() comes across
>> as something probably needing attention.
>
> Okay, it sounds like you'd prefer the "make it tegra-specific" patch I
> proposed. I will work that up as a proper patch and send it.

Yes. Of course, I'd like to hear Thierry's view as well.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
