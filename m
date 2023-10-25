Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACF57D7560
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 22:20:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6310E10E705;
	Wed, 25 Oct 2023 20:20:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B58810E66E
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 14:25:09 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1qveol-0003GF-2H; Wed, 25 Oct 2023 16:25:07 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <mfe@pengutronix.de>)
 id 1qveok-004CMV-9x; Wed, 25 Oct 2023 16:25:06 +0200
Received: from mfe by dude02.red.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <mfe@pengutronix.de>) id 1qveok-00D6rw-0k;
 Wed, 25 Oct 2023 16:25:06 +0200
Date: Wed, 25 Oct 2023 16:25:06 +0200
From: Marco Felsch <mfe@pengutronix.de>
To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm: panel: simple: specify bpc for
 powertip_ph800480t013_idf02
Message-ID: <20231025142506.6osds6rjiohn2p4c@pengutronix.de>
References: <20230727172445.1548834-1-dmitry.baryshkov@linaro.org>
 <733a1f2e-708b-6119-6cf9-af18f185fc77@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <733a1f2e-708b-6119-6cf9-af18f185fc77@linaro.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Wed, 25 Oct 2023 20:19:56 +0000
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
Cc: Sam Ravnborg <sam@ravnborg.org>, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, kernel@penugtronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+Cc: stable <stable@kernel.org>

The commit misses the Fixes tag.

On Mon, Jul 31, 2023 at 02:47:47PM +0200, Neil Armstrong wrote:
> On 27/07/2023 19:24, Dmitry Baryshkov wrote:
> > Specify bpc value for the powertip_ph800480t013_idf02 panel to stop drm
> > code from complaining about unexpected bpc value (0).
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/panel/panel-simple.c | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> > index a247a0e7c799..4c4c24ab4d12 100644
> > --- a/drivers/gpu/drm/panel/panel-simple.c
> > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > @@ -3207,6 +3207,7 @@ static const struct drm_display_mode powertip_ph800480t013_idf02_mode = {
> >   static const struct panel_desc powertip_ph800480t013_idf02  = {
> >   	.modes = &powertip_ph800480t013_idf02_mode,
> >   	.num_modes = 1,
> > +	.bpc = 8,
> >   	.size = {
> >   		.width = 152,
> >   		.height = 91,
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
