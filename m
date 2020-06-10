Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8EC1F62F7
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jun 2020 09:54:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 530116E89C;
	Thu, 11 Jun 2020 07:54:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [62.157.118.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3636D89D42
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jun 2020 15:26:25 +0000 (UTC)
IronPort-SDR: UCvVFmd+T2/3ddcGqwzY1KXKYIXifE+cRK+2f5+2GBOmMRbPjF5Goar0VwYnIPtXH/xKwHEJyk
 hJkT4aZyr6UbMHwIOzltacS42sW0Tk2Uw4b6sUs3hERrATX552qex5XcJ9Wz4nd2HODJnIxy6X
 dbXGnYs1yTS8YxVhirDvadT0gDfzCuTstCG75F5/MgcwmqUtrHc2qVUJhHmNwYbvpJiWI3uLOu
 RBkJrK9+8b7HoSB523YR3qnC9y7ib5J3KsE/db5EyMbj/9JpeYuyz20C4TlWYYj6uwuiEmqH3M
 tuA=
X-IronPort-AV: E=Sophos;i="5.73,496,1583190000"; d="scan'208";a="12640925"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 10 Jun 2020 17:26:24 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Wed, 10 Jun 2020 17:26:24 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Wed, 10 Jun 2020 17:26:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1591802784; x=1623338784;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NgpoLcQmfQK0uSFUsODXw4KgmMJLoHjdRmqi3oYQpMg=;
 b=P7I8+djgRzLr4OXMOtTfgn4kiw8mcUWEBjMXj/IcNJR/4J8wEk9FtAIc
 gaCY99ZgSKPKWoVvhSV/C9u7km3HM6IaRQmbFYpY2hjCGjg8yaUz5YR7x
 ahu1gQ1hsWyxlsNMii7447HcCobyjUt0npe+NlBy3E5ypkWUXa+wweldK
 hkSIRijK9yQROKvXQb/k3Hm9GiJ69++2mf4DcfJMC6+pfvrH0WHq9Jtr8
 LxTPU/rzu38xo+tH35DHNxpPReeKvKSt+3ce+7ubSaimUvam7EGsHm59p
 LjXwtXisHNG6FmhFI5/iYs2bjT1GIxYzKSXXr7geyeC+AJDg07X+MbqKJ A==;
IronPort-SDR: 58e+uR1RdbqcmyDTrw4VUBYlZWfyW5Zqijv4wjO3KBcZ6MVvCWdyaNzteqxdKknSqhcJQbYIqV
 s6nMgfxxlqJxuDjcLT27n5viu/7Am1LbBDehEL7h1245TeM8VLbxO+A2HgJxHoRJY9a6xTBwE/
 SvbJrGgfodtK39tRhtmKlnAWh1qSAfiuKu9CiyMjdER4/1gMk2yy2Q3UhJ7LsDM7ZAs7lqCwmB
 aSQ5lTLfqyCH9GryLwZ/a4a9dIimZu+eUPpTuJeXwFc05Er7bWRuKHl9QKQce4CKU6X1OZqyyP
 yRM=
X-IronPort-AV: E=Sophos;i="5.73,496,1583190000"; d="scan'208";a="12640924"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 10 Jun 2020 17:26:24 +0200
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de
 [10.117.49.26])
 by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 48A4A280065;
 Wed, 10 Jun 2020 17:26:24 +0200 (CEST)
Message-ID: <44d3b82a11fc292f0aa3f60a8ccebd4e8ce5d3e8.camel@ew.tq-group.com>
Subject: Re: (EXT) Re: [PATCH 3/4] drm/panel: simple: add CDTech
 S070PWS19HP-FC21 and S070SWV29HG-DC44
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Sam Ravnborg <sam@ravnborg.org>
Date: Wed, 10 Jun 2020 17:26:23 +0200
In-Reply-To: <20200610145954.GA135509@ravnborg.org>
References: <20200610120131.3069-1-matthias.schiffer@ew.tq-group.com>
 <20200610120131.3069-4-matthias.schiffer@ew.tq-group.com>
 <20200610145954.GA135509@ravnborg.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
X-Mailman-Approved-At: Thu, 11 Jun 2020 07:54:02 +0000
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2020-06-10 at 16:59 +0200, Sam Ravnborg wrote:
> Hi Matthias.
> 
> Thanks, a few details you need to fix. See below.
> 
> 	Sam
> 
> On Wed, Jun 10, 2020 at 02:01:30PM +0200, Matthias Schiffer wrote:
> > From: Michael Krummsdorf <michael.krummsdorf@tq-group.com>
> > 
> > Add support for the CDTech Electronics displays S070PWS19HP-FC21
> > (7.0" WSVGA) and S070SWV29HG-DC44 (7.0" WVGA) to panel-simple.
> > 
> > Signed-off-by: Michael Krummsdorf <michael.krummsdorf@tq-group.com>
> > Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com
> > >
> > ---
> >  drivers/gpu/drm/panel/panel-simple.c | 60
> > ++++++++++++++++++++++++++++
> >  1 file changed, 60 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/panel/panel-simple.c
> > b/drivers/gpu/drm/panel/panel-simple.c
> > index b6ecd1552132..1673113e5a5a 100644
> > --- a/drivers/gpu/drm/panel/panel-simple.c
> > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > @@ -1315,6 +1315,60 @@ static const struct panel_desc
> > cdtech_s043wq26h_ct7 = {
> >  	.bus_flags = DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
> >  };
> >  
> > +/* S070PWS19HP-FC21 2017/04/22 */
> > +static const struct drm_display_mode cdtech_s070pws19hp_fc21_mode
> > = {
> > +	.clock = 51200,
> > +	.hdisplay = 1024,
> > +	.hsync_start = 1024 + 160,
> > +	.hsync_end = 1024 + 160 + 20,
> > +	.htotal = 1024 + 160 + 20 + 140,
> > +	.vdisplay = 600,
> > +	.vsync_start = 600 + 12,
> > +	.vsync_end = 600 + 12 + 3,
> > +	.vtotal = 600 + 12 + 3 + 20,
> > +	.vrefresh = 60,
> 
> .vrefresh is no longer present, please drop.

I based my patches on the branch drm-next of 
https://cgit.freedesktop.org/drm/drm, should I have used a different
branch?


> > +	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> > +};
> > +
> > +static const struct panel_desc cdtech_s070pws19hp_fc21 = {
> > +	.modes = &cdtech_s070pws19hp_fc21_mode,
> > +	.num_modes = 1,
> > +	.bpc = 6,
> > +	.size = {
> > +		.width = 154,
> > +		.height = 86,
> > +	},
> > +	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
> > +	.bus_flags = DRM_BUS_FLAG_DE_HIGH |
> > DRM_BUS_FLAG_PIXDATA_POSEDGE,
> > +};
> 
> Please add .connector_type - it is mandatory.
> > +
> > +/* S070SWV29HG-DC44 2017/09/21 */
> > +static const struct drm_display_mode cdtech_s070swv29hg_dc44_mode
> > = {
> > +	.clock = 33300,
> > +	.hdisplay = 800,
> > +	.hsync_start = 800 + 210,
> > +	.hsync_end = 800 + 210 + 2,
> > +	.htotal = 800 + 210 + 2 + 44,
> > +	.vdisplay = 480,
> > +	.vsync_start = 480 + 22,
> > +	.vsync_end = 480 + 22 + 2,
> > +	.vtotal = 480 + 22 + 2 + 21,
> > +	.vrefresh = 60,
> 
> .vrefresh is no longer present, please drop.
> > +	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> > +};
> > +
> > +static const struct panel_desc cdtech_s070swv29hg_dc44 = {
> > +	.modes = &cdtech_s070swv29hg_dc44_mode,
> > +	.num_modes = 1,
> > +	.bpc = 6,
> > +	.size = {
> > +		.width = 154,
> > +		.height = 86,
> > +	},
> > +	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
> > +	.bus_flags = DRM_BUS_FLAG_DE_HIGH |
> > DRM_BUS_FLAG_PIXDATA_POSEDGE,
> 
> Please add .connector_type - it is mandatory.
> > +};
> > +
> >  static const struct drm_display_mode cdtech_s070wv95_ct16_mode = {
> >  	.clock = 35000,
> >  	.hdisplay = 800,
> > @@ -3723,6 +3777,12 @@ static const struct of_device_id
> > platform_of_match[] = {
> >  	}, {
> >  		.compatible = "cdtech,s043wq26h-ct7",
> >  		.data = &cdtech_s043wq26h_ct7,
> > +	}, {
> > +		.compatible = "cdtech,s070pws19hp-fc21",
> > +		.data = &cdtech_s070pws19hp_fc21,
> > +	}, {
> > +		.compatible = "cdtech,s070swv29hg-dc44",
> > +		.data = &cdtech_s070swv29hg_dc44,
> >  	}, {
> >  		.compatible = "cdtech,s070wv95-ct16",
> >  		.data = &cdtech_s070wv95_ct16,
> > -- 
> > 2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
