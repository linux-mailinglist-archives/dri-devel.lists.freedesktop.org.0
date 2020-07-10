Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FE121BCA4
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 19:56:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DAAA6EC26;
	Fri, 10 Jul 2020 17:56:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2349D6EC26
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 17:56:47 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 83AFE20037;
 Fri, 10 Jul 2020 19:56:44 +0200 (CEST)
Date: Fri, 10 Jul 2020 19:56:43 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Suraj Upadhyay <usuraj35@gmail.com>
Subject: Re: [PATCH 0/4] drm: core: Convert logging to drm_* functions.
Message-ID: <20200710175643.GF17565@ravnborg.org>
References: <cover.1594136880.git.usuraj35@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1594136880.git.usuraj35@gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=e5mUnYsNAAAA:8 a=D_To5w3uyQa5RXxL-6MA:9
 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: tzimmermann@suse.de, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Suraj.

On Tue, Jul 07, 2020 at 10:04:14PM +0530, Suraj Upadhyay wrote:
> 
> This patchset converts logging to drm_* functions in drm core.
> 
> The following functions have been converted to their respective
> DRM alternatives :
> dev_info()      --> drm_info()
> dev_err()       --> drm_err()
> dev_warn()      --> drm_warn()
> dev_err_once()  --> drm_err_once().

I would prefer that DRM_* logging in the same files are converted in the
same patch. So we have one logging conversion patch for each file you
touches and that we do not need to re-vist the files later to change
another set of logging functions.
If possible WARN_* should also be converted to drm_WARN_*
If patch is too large, then split them up but again lets have all
logging updated when we touch a file.

Care to take a look at this approach?

Also please consider if coccinelle can make this job easier.
There is a lot of files...

	Sam

> 
> Suraj Upadhyay (4):
>   drm: mipi-dsi: Convert logging to drm_* functions.
>   drm: mipi-dbi: Convert logging to drm_* functions.
>   drm: edid: Convert logging to drm_* functions.
>   drm: fb-helper: Convert logging to drm_* functions.
> 
>  drivers/gpu/drm/drm_edid.c      |  7 +++----
>  drivers/gpu/drm/drm_fb_helper.c |  2 +-
>  drivers/gpu/drm/drm_mipi_dbi.c  |  4 ++--
>  drivers/gpu/drm/drm_mipi_dsi.c  | 15 +++++++--------
>  4 files changed, 13 insertions(+), 15 deletions(-)
> 
> -- 
> 2.17.1
> 
> 



> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
