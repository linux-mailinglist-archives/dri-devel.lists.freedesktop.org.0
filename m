Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A295ACDF4
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 10:49:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63DA310E21E;
	Mon,  5 Sep 2022 08:49:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A1C510E21E
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 08:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662367788; x=1693903788;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=4D3RAQxQy6SFrkYw939qLRwPf9Fd7iF48Kn/A1uq7TQ=;
 b=cHf36KZOgTZ+JXKG7eMMNfAKzi1eb4aZRE+2VkJTE8aU3DaCeSL9G7zD
 ScOr/UZhCXcg/iEWBQmi6uPEYAYg5fGXyofzW4N4V5FIxBmqZtO1bcK8k
 6TBPt2x4sX/z/DCYzEd90Ijq1tKn5/8E5Mhgza503Fdck0Fy0b+k2NpDD
 woSkKztmwCc4zkAOBrBAlbyMsLQYIR2pOVRdoe0qbkU7SxHC8HQY/h7bQ
 j+bKQ01xgjkURXHBGTqRIrnm+du1U9YVxi+jBniSV/bzJQw8mEzdkgrfn
 VBJ2bEg8QCoHlvzVmyj+VKdHRCAiD2gyFiDrJSIcmE/Op3zSqQHE8vHD/ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10460"; a="297129834"
X-IronPort-AV: E=Sophos;i="5.93,290,1654585200"; d="scan'208";a="297129834"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2022 01:49:47 -0700
X-IronPort-AV: E=Sophos;i="5.93,290,1654585200"; d="scan'208";a="675199754"
Received: from smaciag-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.57.57])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2022 01:49:44 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jingyu Wang <jingyuwang_vip@163.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@linux.ie,
 daniel@ffwll.ch, Joe Perches <joe@perches.com>
Subject: Re: [PATCH] drm/print: cleanup coding style in drm_print.h
In-Reply-To: <87wnaib45t.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220904203818.16775-1-jingyuwang_vip@163.com>
 <87wnaib45t.fsf@intel.com>
Date: Mon, 05 Sep 2022 11:49:28 +0300
Message-ID: <87sfl6b3zb.fsf@intel.com>
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
Cc: Jingyu Wang <jingyuwang_vip@163.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 05 Sep 2022, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Mon, 05 Sep 2022, Jingyu Wang <jingyuwang_vip@163.com> wrote:
>> Fix everything checkpatch.pl complained about in drm_print.h

[...]

>>  static inline void
>> -drm_vprintf(struct drm_printer *p, const char *fmt, va_list *va)
>> +drm_vprintf(struct drm_printer *p, const char *fmt, va_list * va)
>
> Checkpatch is just confused here. Look at all the other params, why
> would you add an extra space here?

Joe, can you help me out here please, I can't figure out why checkpatch
is complaining here:

include/drm/drm_print.h:106: CHECK:SPACING: spaces preferred around that '*' (ctx:WxV)
#106: FILE: include/drm/drm_print.h:106:
+drm_vprintf(struct drm_printer *p, const char *fmt, va_list *va)


BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
