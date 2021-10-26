Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C194943BA68
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 21:10:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CE786E483;
	Tue, 26 Oct 2021 19:10:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10A496E483
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 19:10:00 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 549203a9-3690-11ec-9c3f-0050568c148b;
 Tue, 26 Oct 2021 19:10:06 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id B4A0A194B70;
 Tue, 26 Oct 2021 21:09:57 +0200 (CEST)
Date: Tue, 26 Oct 2021 21:09:56 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Mario <awxkrnl@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm: panel-orientation-quirks: Add quirk for GPD Win3
Message-ID: <YXhShDj4c8W9aMhz@ravnborg.org>
References: <20211026112737.9181-1-awxkrnl@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211026112737.9181-1-awxkrnl@gmail.com>
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

Hi Mario,

On Tue, Oct 26, 2021 at 01:27:37PM +0200, Mario wrote:
> Fixes screen orientation for GPD Win 3 handheld gaming console.
> 
> Signed-off-by: Mario Risoldi <awxkrnl@gmail.com>

Thanks for the resend.
A couple of points for your, hopefully soonish, next contribution:

1) Use the same name/email in the Signed-off-by and a sender mail.
As an alternative add an From: Mario Risoldi <awxkrnl@gmail.com> in the
top of the changelog. Otherwise there is a warning about the mismatch.

2) When you make a v2 it is always a good service to the readers to tell
what was changed.
In this case you could have added the following:
"
v2:
  - Added changelog and s-o-b (Sam)
"

It is perfectly fine in the DRM subsystem to have this part of the
changelog. Other subsystmes do not want to see it in the changelog so
there it must go below the end-of-changelog marker - the "---"

Patch is applied to drm-misc-next and will hopefully find its way to
upstream within 1-2 weeks.
So for this patch you do not need to do more.

	Sam

> ---
>  drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> index f6bdec7fa925..f6177c1d9872 100644
> --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> @@ -185,6 +185,12 @@ static const struct dmi_system_id orientation_data[] = {
>  		  DMI_EXACT_MATCH(DMI_BOARD_NAME, "Default string"),
>  		},
>  		.driver_data = (void *)&gpd_win2,
> +	}, {	/* GPD Win 3 */
> +		.matches = {
> +		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "GPD"),
> +		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "G1618-03")
> +		},
> +		.driver_data = (void *)&lcd720x1280_rightside_up,
>  	}, {	/* I.T.Works TW891 */
>  		.matches = {
>  		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "To be filled by O.E.M."),
> -- 
> 2.33.1
