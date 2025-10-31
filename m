Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF1EC2451B
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 11:01:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39F1610EAEB;
	Fri, 31 Oct 2025 10:01:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yd1Qf8Sz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9645610EAE8;
 Fri, 31 Oct 2025 10:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761904914; x=1793440914;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=LW60E5Pl24aDuKn8yIHTta7QtiR8pK2/piftF/6u3fY=;
 b=Yd1Qf8SztpkTOB2mVpEPsbJdlraoVJ7pOxPYheGMhDsCQAZaZpKYq1WE
 +T5U9fL/CUrqP7hcTs0X+iRoftmF1VKWcmFoTqf/uX7iwOi00kcOn+Srw
 KxW0BKZAH/cHUtPsHsHqEknvIKyLEPkYipOCIdHm8AUGjl0RrRGQTe4X6
 EyLkOmR4jSwCFbGBeg2ELqYI/gZc81ddWgop1Wz1CMKK5XuekcjR3SRi7
 17Cs5WuinS3ZTNKQZhyO4gCDO0rexyX+3BdwlyxcFfeNkPDPl1AQ+m4B+
 Xl8vcVhzVrei73WYe3DS/+dV3yHGSIy9pcpBKBdioTWPFghkxpPC93MHO A==;
X-CSE-ConnectionGUID: CfgaZC0RSZqYkocKxs74uA==
X-CSE-MsgGUID: UB0aIozmSQCfIoCWGSe5yQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="51636339"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="51636339"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 03:01:54 -0700
X-CSE-ConnectionGUID: +dRpyo4YRTORVvYZa76bVw==
X-CSE-MsgGUID: XtJoJgrgR+eXjACmHAyxsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="186316185"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.37])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 03:01:50 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, maarten.lankhorst@linux.intel.com, Maxime
 Ripard <mripard@kernel.org>, David Airlie <airlied@redhat.com>,
 simona.vetter@ffwll.ch
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v3 0/4] drm: replace drm_print.h includes from headers
 with a forward declaration
In-Reply-To: <c4e3b172-3df8-4d1b-a1b0-51cacae56f0c@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1761734313.git.jani.nikula@intel.com>
 <41bb4163-8f5b-47c5-8121-7010147bc5e6@suse.de>
 <b8cc203c44518822197023c2dbf4a21aad681a4c@intel.com>
 <c4e3b172-3df8-4d1b-a1b0-51cacae56f0c@suse.de>
Date: Fri, 31 Oct 2025 12:01:47 +0200
Message-ID: <18ad4c11261b85614f7e3a2aabe611f2ecbf16a5@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 30 Oct 2025, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Am 30.10.25 um 10:31 schrieb Jani Nikula:
>> Considering that this touches a lot of drivers, albeit just the include
>> lists and thus highly unlikely to cause functional changes or hard
>> conflicts, can I go ahead and merge this to drm-misc-next?
>
> Of course, go ahead.

Done, thanks again!

BR,
Jani.


-- 
Jani Nikula, Intel
