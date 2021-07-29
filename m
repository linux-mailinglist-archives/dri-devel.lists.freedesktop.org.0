Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EF03DAB85
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 21:00:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8343E6EE2C;
	Thu, 29 Jul 2021 19:00:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1DAC6EE2C
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 19:00:44 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 50141b43-f09f-11eb-8d1a-0050568cd888;
 Thu, 29 Jul 2021 19:00:59 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 7EF2B194BB4;
 Thu, 29 Jul 2021 21:01:04 +0200 (CEST)
Date: Thu, 29 Jul 2021 21:00:40 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>
Subject: Re: [PATCH 01/14] drm/kmb: Enable LCD DMA for low TVDDCV
Message-ID: <YQL62IVmYnz5JwfY@ravnborg.org>
References: <20210728003126.1425028-1-anitha.chrisanthus@intel.com>
 <YQEBirrNA+G+GnuP@ravnborg.org>
 <BY5PR11MB418225F0DC2E514BB3365C5D8CEB9@BY5PR11MB4182.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BY5PR11MB418225F0DC2E514BB3365C5D8CEB9@BY5PR11MB4182.namprd11.prod.outlook.com>
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
Cc: "Dea, Edmund J" <edmund.j.dea@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Anitha,

On Thu, Jul 29, 2021 at 06:48:45PM +0000, Chrisanthus, Anitha wrote:
> Hi Sam,
> Please help! I tried to push the first two patches to drm-misc-fixes using dim push, but it pushed other things too besides these patches. I am sorry, don't know what went wrong.
>

I see only these in drm-misc_fixes:

ommit eb92830cdbc232a0e8166c48061ca276132646a7 (HEAD -> drm-misc-fixes, drm-misc/for-linux-next-fixes, drm-misc/drm-misc-fixes)
Author: Edmund Dea <edmund.j.dea@intel.com>
Date:   Wed Aug 26 13:17:29 2020 -0700

    drm/kmb: Define driver date and major/minor version

    Added macros for date and version

    Fixes: 7f7b96a8a0a1 ("drm/kmb: Add support for KeemBay Display")
    Signed-off-by: Edmund Dea <edmund.j.dea@intel.com>
    Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
    Acked-by: Sam Ravnborg <sam@ravnborg.org>
    Link: https://patchwork.freedesktop.org/patch/msgid/20210728003126.1425028-2-anitha.chrisanthus@intel.com

commit 0aab5dce395636eddf4e5f33eba88390328a95b4
Author: Edmund Dea <edmund.j.dea@intel.com>
Date:   Tue Aug 25 14:51:17 2020 -0700

    drm/kmb: Enable LCD DMA for low TVDDCV

    There's an undocumented dependency between LCD layer enable bits [2-5]
    and the AXI pipelined read enable bit [28] in the LCD_CONTROL register.
    The proper order of operation is:

    1) Clear AXI pipelined read enable bit
    2) Set LCD layers
    3) Set AXI pipelined read enable bit

    With this update, LCD can start DMA when TVDDCV is reduced down to 700mV.

    Fixes: 7f7b96a8a0a1 ("drm/kmb: Add support for KeemBay Display")
    Signed-off-by: Edmund Dea <edmund.j.dea@intel.com>
    Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
    Acked-by: Sam Ravnborg <sam@ravnborg.org>
    Link: https://patchwork.freedesktop.org/patch/msgid/20210728003126.1425028-1-anitha.chrisanthus@intel.com


Looks OK.

	Sam
