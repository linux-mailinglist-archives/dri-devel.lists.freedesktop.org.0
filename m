Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 467BC7B6743
	for <lists+dri-devel@lfdr.de>; Tue,  3 Oct 2023 13:10:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C91310E0AA;
	Tue,  3 Oct 2023 11:10:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0CB2210E0AA
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Oct 2023 11:10:38 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3465714BF
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Oct 2023 04:11:16 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7E16B3F762
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Oct 2023 04:10:37 -0700 (PDT)
Date: Tue, 3 Oct 2023 12:10:32 +0100
From: Liviu Dudau <Liviu.Dudau@arm.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2] drm: panel-orientation-quirks: Add quirk for One Mix 2S
Message-ID: <ZRv2qLU_zHqCLJJs@e110455-lin.cambridge.arm.com>
References: <20231001114710.336172-1-foss-linux@broulik.de>
 <4a86bbd4-4798-b81b-8f08-b2c8c125999d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4a86bbd4-4798-b81b-8f08-b2c8c125999d@redhat.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Kai Uwe Broulik <foss-linux@broulik.de>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Oct 01, 2023 at 02:21:43PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 10/1/23 13:47, Kai Uwe Broulik wrote:
> > The One Mix 2S is a mini laptop with a 1200x1920 portrait screen
> > mounted in a landscape oriented clamshell case. Because of the too
> > generic DMI strings this entry is also doing bios-date matching.
> > 
> > Signed-off-by: Kai Uwe Broulik <foss-linux@broulik.de>
> > ---
> > Changes since v1:
> > * Got two more BIOS dates reported
> 
> Thanks, patch still looks good to me:
> 
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> 
> drm-misc maintainers, I'm currently traveling can
> one of you push this to drm-misc-fixes please?

Done. Have a safe trip.

Best regards,
Liviu

> 
> Regards,
> 
> Hans
> 
> 
> 
> 
> > 
> >  drivers/gpu/drm/drm_panel_orientation_quirks.c | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> > index 0cb646cb04ee..d5c15292ae93 100644
> > --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> > +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> > @@ -38,6 +38,14 @@ static const struct drm_dmi_panel_orientation_data gpd_micropc = {
> >  	.orientation = DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
> >  };
> >  
> > +static const struct drm_dmi_panel_orientation_data gpd_onemix2s = {
> > +	.width = 1200,
> > +	.height = 1920,
> > +	.bios_dates = (const char * const []){ "05/21/2018", "10/26/2018",
> > +		"03/04/2019", NULL },
> > +	.orientation = DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
> > +};
> > +
> >  static const struct drm_dmi_panel_orientation_data gpd_pocket = {
> >  	.width = 1200,
> >  	.height = 1920,
> > @@ -401,6 +409,14 @@ static const struct dmi_system_id orientation_data[] = {
> >  		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "LTH17"),
> >  		},
> >  		.driver_data = (void *)&lcd800x1280_rightside_up,
> > +	}, {	/* One Mix 2S (generic strings, also match on bios date) */
> > +		.matches = {
> > +		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Default string"),
> > +		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Default string"),
> > +		  DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "Default string"),
> > +		  DMI_EXACT_MATCH(DMI_BOARD_NAME, "Default string"),
> > +		},
> > +		.driver_data = (void *)&gpd_onemix2s,
> >  	},
> >  	{}
> >  };
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
