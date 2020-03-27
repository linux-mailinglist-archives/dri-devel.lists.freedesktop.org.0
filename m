Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BD11959B5
	for <lists+dri-devel@lfdr.de>; Fri, 27 Mar 2020 16:25:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 606D46EA4B;
	Fri, 27 Mar 2020 15:25:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 827F46EA4B;
 Fri, 27 Mar 2020 15:25:41 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 7C19D8054E;
 Fri, 27 Mar 2020 16:25:36 +0100 (CET)
Date: Fri, 27 Mar 2020 16:25:35 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH 6/6] drm/radeon: convert to use i2c_new_client_device()
Message-ID: <20200327152535.GA2191@ravnborg.org>
References: <20200326211005.13301-1-wsa+renesas@sang-engineering.com>
 <20200326211005.13301-7-wsa+renesas@sang-engineering.com>
 <CADnq5_P07b-A-VawLTgiTMSdifxMbWS5kgQV_+0Bw2x_DQHATQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_P07b-A-VawLTgiTMSdifxMbWS5kgQV_+0Bw2x_DQHATQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=LDBv8-xUAAAA:8
 a=zd2uoN0lAAAA:8 a=e5mUnYsNAAAA:8 a=np1NKRlxnyeI6rDnu7wA:9
 a=CjuIK1q_8ugA:10 a=DZeXCJrVpAJBw65Qk4Ds:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Linux I2C <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 27, 2020 at 10:25:16AM -0400, Alex Deucher wrote:
> On Thu, Mar 26, 2020 at 5:35 PM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> >
> > Move away from the deprecated API.
> >
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> 
> patches 1,6, are:
> Acked-by: Alex Deucher <alexander.deucher@amd.com>
Should we commit all to drm-misc-next?

	Sam


> 
> > ---
> >  drivers/gpu/drm/radeon/radeon_atombios.c | 4 ++--
> >  drivers/gpu/drm/radeon/radeon_combios.c  | 4 ++--
> >  2 files changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/radeon/radeon_atombios.c b/drivers/gpu/drm/radeon/radeon_atombios.c
> > index 848ef68d9086..5d2591725189 100644
> > --- a/drivers/gpu/drm/radeon/radeon_atombios.c
> > +++ b/drivers/gpu/drm/radeon/radeon_atombios.c
> > @@ -2111,7 +2111,7 @@ static int radeon_atombios_parse_power_table_1_3(struct radeon_device *rdev)
> >                                                                     ucOverdriveThermalController];
> >                         info.addr = power_info->info.ucOverdriveControllerAddress >> 1;
> >                         strlcpy(info.type, name, sizeof(info.type));
> > -                       i2c_new_device(&rdev->pm.i2c_bus->adapter, &info);
> > +                       i2c_new_client_device(&rdev->pm.i2c_bus->adapter, &info);
> >                 }
> >         }
> >         num_modes = power_info->info.ucNumOfPowerModeEntries;
> > @@ -2351,7 +2351,7 @@ static void radeon_atombios_add_pplib_thermal_controller(struct radeon_device *r
> >                                 const char *name = pp_lib_thermal_controller_names[controller->ucType];
> >                                 info.addr = controller->ucI2cAddress >> 1;
> >                                 strlcpy(info.type, name, sizeof(info.type));
> > -                               i2c_new_device(&rdev->pm.i2c_bus->adapter, &info);
> > +                               i2c_new_client_device(&rdev->pm.i2c_bus->adapter, &info);
> >                         }
> >                 } else {
> >                         DRM_INFO("Unknown thermal controller type %d at 0x%02x %s fan control\n",
> > diff --git a/drivers/gpu/drm/radeon/radeon_combios.c b/drivers/gpu/drm/radeon/radeon_combios.c
> > index c3e49c973812..d3c04df7e75d 100644
> > --- a/drivers/gpu/drm/radeon/radeon_combios.c
> > +++ b/drivers/gpu/drm/radeon/radeon_combios.c
> > @@ -2704,7 +2704,7 @@ void radeon_combios_get_power_modes(struct radeon_device *rdev)
> >                                 const char *name = thermal_controller_names[thermal_controller];
> >                                 info.addr = i2c_addr >> 1;
> >                                 strlcpy(info.type, name, sizeof(info.type));
> > -                               i2c_new_device(&rdev->pm.i2c_bus->adapter, &info);
> > +                               i2c_new_client_device(&rdev->pm.i2c_bus->adapter, &info);
> >                         }
> >                 }
> >         } else {
> > @@ -2721,7 +2721,7 @@ void radeon_combios_get_power_modes(struct radeon_device *rdev)
> >                                 const char *name = "f75375";
> >                                 info.addr = 0x28;
> >                                 strlcpy(info.type, name, sizeof(info.type));
> > -                               i2c_new_device(&rdev->pm.i2c_bus->adapter, &info);
> > +                               i2c_new_client_device(&rdev->pm.i2c_bus->adapter, &info);
> >                                 DRM_INFO("Possible %s thermal controller at 0x%02x\n",
> >                                          name, info.addr);
> >                         }
> > --
> > 2.20.1
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
