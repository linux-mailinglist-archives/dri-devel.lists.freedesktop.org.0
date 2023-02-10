Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 751E7692524
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 19:17:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3498010EDB9;
	Fri, 10 Feb 2023 18:17:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-4.mailo.com (msg-4.mailo.com [213.182.54.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCE5210EDC5;
 Fri, 10 Feb 2023 18:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
 t=1676053016; bh=oHz2us9DLQA/KqfKOt5nfmI+i7BQogAbxnCbfbeMgAs=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:In-Reply-To;
 b=gbGD5YknB4XJWyv4+tct9/A3jL1q+mdSrDkPPu0ysPypV+j7XM1IXmZ+D3JgzJep1
 ApbgJa1e2owK4h5MJT42bCvyerTaghqnFRntGFXaCSr5zZWc5dtLfzV1AW62vRh05Z
 +CO0bmc91yJR4Z4Dy2YSsDYtM3jIePUF9irBQfyc=
Received: by b-5.in.mailobj.net [192.168.90.15] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Fri, 10 Feb 2023 19:16:56 +0100 (CET)
X-EA-Auth: XTggIg9IL3jabOPU+QSxv8wRN0TBE7TEalSdCPg6zWW3MrNZ4vy5o1vFgYccKngUZ/1LN318OWayxbn42CNidsmPo6SzKz3q
Date: Fri, 10 Feb 2023 23:46:50 +0530
From: Deepak R Varma <drv@mailo.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH] drm/amd/display: Remove duplicate/repeating expression
Message-ID: <Y+aKEmbSg5rCq87g@ubun2204.myguest.virtualbox.org>
References: <Y+YYZ4SbMQBcpTZP@ubun2204.myguest.virtualbox.org>
 <c64bb7b8-ab50-78c3-bb56-820ce96a1e14@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c64bb7b8-ab50-78c3-bb56-820ce96a1e14@amd.com>
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
Cc: Deepak R Varma <drv@mailo.com>,
 Saurabh Singh Sengar <ssengar@microsoft.com>, Leo Li <sunpeng.li@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 10, 2023 at 10:22:00AM -0500, Harry Wentland wrote:
> On 2/10/23 05:11, Deepak R Varma wrote:
> > Remove duplicate or repeating expressions in the if condition
> > evaluation. Issue identified using doubletest.cocci Coccinelle semantic
> > patch.
> > 
> > Signed-off-by: Deepak R Varma <drv@mailo.com>
> 
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Thank you Harry. There is another similar patch I submitted for a different
file. Could you please also review that and share your feedback?

Thank you,
./drv

> 
> Harry
> 
> > ---
> >  .../gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.c b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.c
> > index 61ee9ba063a7..6576b897a512 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.c
> > +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.c
> > @@ -51,7 +51,7 @@ static bool CalculateBytePerPixelAnd256BBlockSizes(
> >  		*BytePerPixelDETC = 0;
> >  		*BytePerPixelY = 4;
> >  		*BytePerPixelC = 0;
> > -	} else if (SourcePixelFormat == dm_444_16 || SourcePixelFormat == dm_444_16) {
> > +	} else if (SourcePixelFormat == dm_444_16) {
> >  		*BytePerPixelDETY = 2;
> >  		*BytePerPixelDETC = 0;
> >  		*BytePerPixelY = 2;
> 


