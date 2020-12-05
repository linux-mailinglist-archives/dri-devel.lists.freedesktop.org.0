Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC732CFE53
	for <lists+dri-devel@lfdr.de>; Sat,  5 Dec 2020 20:24:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F0AB6E444;
	Sat,  5 Dec 2020 19:24:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BA336E444
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Dec 2020 19:24:51 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id BAF51804C8;
 Sat,  5 Dec 2020 20:24:48 +0100 (CET)
Date: Sat, 5 Dec 2020 20:24:47 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH] drm: panel: Fully transition panel_desc kerneldoc to
 inline style
Message-ID: <20201205192447.GD332836@ravnborg.org>
References: <20201201125822.1.I3c4191336014bd57364309439e56f600c94bb12b@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201201125822.1.I3c4191336014bd57364309439e56f600c94bb12b@changeid>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=Itgwjo3g c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=cm27Pg_UAAAA:8 a=pGLkceISAAAA:8
 a=e5mUnYsNAAAA:8 a=z3ztCu_kXq1d7hxwpHYA:9 a=CjuIK1q_8ugA:10
 a=E9Po1WZjFZOl8hwRPBS3:22 a=xmb-EsYY8bH0VWELuYED:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Douglas,

On Tue, Dec 01, 2020 at 12:59:12PM -0800, Douglas Anderson wrote:
> In commit 131f909ad55f ("drm: panel: simple: Fixup the struct
> panel_desc kernel doc") I transitioned the more deeply nested
> kerneldoc comments into the inline style.  Apparently it is desirable
> to continue the job and move _everything_ in this struct to inline.
> Let's do it.
> 
> While doing this, we also add a short summary for the whole struct to
> fix a warning when we run with extra warnings, AKA:
>   scripts/kernel-doc -v -rst drivers/gpu/drm/panel/panel-simple.c
> 
> The warning was:
>   drivers/gpu/drm/panel/panel-simple.c:42: warning: missing initial short description on line:
>    * struct panel_desc
> 
> Suggested-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: dri-devel@lists.freedesktop.org
> ---
> 
>  drivers/gpu/drm/panel/panel-simple.c | 43 +++++++++++++++++-----------
>  1 file changed, 27 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 216cde33b5c4..33d53abdb1fb 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -39,31 +39,36 @@
>  #include <drm/drm_panel.h>
>  
>  /**
> - * struct panel_desc
> - * @modes: Pointer to array of fixed modes appropriate for this panel.  If
> - *         only one mode then this can just be the address of this the mode.
While applying I fixed this up like this:
> - *         only one mode then this can just be the address of the mode.

Applied to drm-misc-next - thanks for doing this. Much nicer now.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
