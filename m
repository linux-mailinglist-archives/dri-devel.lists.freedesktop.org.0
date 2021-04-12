Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9076535C433
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 12:41:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E09F6E235;
	Mon, 12 Apr 2021 10:41:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0300F6E235
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 10:41:18 +0000 (UTC)
IronPort-SDR: M9oiEl7ImrTsKtOo8SUGTZdzyZ7xn/+/p+rnW67+5PtejzeD7lyV++9IMdaZiWrgbLhDx8Yr6j
 zG9b96K81Gww==
X-IronPort-AV: E=McAfee;i="6000,8403,9951"; a="258136118"
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; d="scan'208";a="258136118"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2021 03:41:13 -0700
IronPort-SDR: tNI5WA4lUnnhYEwTqyzhU9x1vctYG2Tzt/zuV0vn9G7iOFOx1KTzsXnZlONjBsBawB/IkPUHVV
 BvgU2X8cU8TA==
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; d="scan'208";a="423741716"
Received: from cyeni-mobl.ger.corp.intel.com (HELO localhost) ([10.252.62.41])
 by orsmga008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 03:41:10 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, corbet@lwn.net
Subject: Re: [PATCH 1/3] drm/aperture: Add infrastructure for aperture
 ownership
In-Reply-To: <b635ebd6-c86e-761c-9bf3-0835fd3278f3@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210412090021.23054-1-tzimmermann@suse.de>
 <20210412090021.23054-2-tzimmermann@suse.de> <87mtu3kfo3.fsf@intel.com>
 <b635ebd6-c86e-761c-9bf3-0835fd3278f3@suse.de>
Date: Mon, 12 Apr 2021 13:41:07 +0300
Message-ID: <87k0p7kcos.fsf@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 12 Apr 2021, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Hi
>
> Am 12.04.21 um 11:36 schrieb Jani Nikula:
>> Please test the documentation build before applying.
>
> I did and I'm pretty sure it looked correct. But I'll double check.

Cool, maybe someone added more smarts to kernel-doc. :)

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
