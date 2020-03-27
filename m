Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B2E1959D0
	for <lists+dri-devel@lfdr.de>; Fri, 27 Mar 2020 16:27:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B237F6EA40;
	Fri, 27 Mar 2020 15:27:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81D0D6EA40;
 Fri, 27 Mar 2020 15:27:47 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id 65so11924567wrl.1;
 Fri, 27 Mar 2020 08:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p68q7FxdWefV2R5Th1a0xfEDj3RdF6HgiFTN3ydE1vM=;
 b=refdVySVw7A/pjOV9Yp6LwkjoZ3kUkwdbrOU9RndbtuC/4tsonratdUUCGBoTCY2SA
 Yf6Po0lnXZFYZbqtXd7skSJWJuJbf/o6e937mRCKZoGUDJYNRZMLP+WymMaSNhbjmmbS
 fIHfwH93KIL3cNCGlTm12gf4Su6YRF0RHYHOLIXOaycGKIco23qMNSAerS83e3cx7FDd
 fQK5X7RjeRBcM41vyHmxrkpqjvoc4FQmKzz4VPHUBKSiP/0moJoylxpFDAG2jjHmOjgj
 zxnDw4oXb0xWHMdKgtF7LHKxv5DKm9vKVCTQZAaDhh0VY+MbLfK0jxZP3N0+Fh6V8L+d
 Fx+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p68q7FxdWefV2R5Th1a0xfEDj3RdF6HgiFTN3ydE1vM=;
 b=fN4TApJFk3GLZXZoOfwGsax6TzsImvsHbRk+SLDYGzOhAdWrsP8S5cxw5YFHNvJKv7
 gGafi99QZh++j3QRErAsYSvTFBJ9pClmJNJtEiozfIr6Z8dMopL6V80Sb14MabyLI+AO
 OGkdjpmYN55zn/MZgg+1VcR/sg/361x8isnzPrWPytY8HUjuWZ+toCZHlSAQEnLOuNeo
 vvSSva6D4r866JMb8UyBV/BIxnxhOEeaAcO49yfyRNwQ6IiPqwq4sge7VkCgy8HhNgD5
 8NHSMy0Ttan2/oSESXVTfmLDrESGQ+GFg1g93DYbZQlo0EVow4fgRGCnoJM3aR2FHATO
 E+ag==
X-Gm-Message-State: ANhLgQ2ONaoInehXFC3qdxyHHpGmFY1BBSm2CvqYiDouxijMVW3RA8wU
 myWbnIIyaElerXUC4gBjSCX5wWVOV8DUCwyi0rk=
X-Google-Smtp-Source: ADFU+vsH3mqpR9Tp9Tb+v4FFlhiStOYYETN7n0scypKKrukFU3p0H5RC7vLX/Vov04v2FyQ0XBN+26FQKXcaZao+8qQ=
X-Received: by 2002:a5d:6187:: with SMTP id j7mr16239644wru.419.1585322866189; 
 Fri, 27 Mar 2020 08:27:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200326211005.13301-1-wsa+renesas@sang-engineering.com>
 <20200326211005.13301-7-wsa+renesas@sang-engineering.com>
 <CADnq5_P07b-A-VawLTgiTMSdifxMbWS5kgQV_+0Bw2x_DQHATQ@mail.gmail.com>
 <20200327152535.GA2191@ravnborg.org>
In-Reply-To: <20200327152535.GA2191@ravnborg.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 27 Mar 2020 11:27:35 -0400
Message-ID: <CADnq5_O-pXK1FeT1NfGBdXYZbqF6jmyXJNPgJt5qLaYMLiZy_Q@mail.gmail.com>
Subject: Re: [PATCH 6/6] drm/radeon: convert to use i2c_new_client_device()
To: Sam Ravnborg <sam@ravnborg.org>
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
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Linux I2C <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 27, 2020 at 11:25 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> On Fri, Mar 27, 2020 at 10:25:16AM -0400, Alex Deucher wrote:
> > On Thu, Mar 26, 2020 at 5:35 PM Wolfram Sang
> > <wsa+renesas@sang-engineering.com> wrote:
> > >
> > > Move away from the deprecated API.
> > >
> > > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> >
> > patches 1,6, are:
> > Acked-by: Alex Deucher <alexander.deucher@amd.com>
> Should we commit all to drm-misc-next?

I'm fine to see it go through whatever tree makes sense.

Alex


>
>         Sam
>
>
> >
> > > ---
> > >  drivers/gpu/drm/radeon/radeon_atombios.c | 4 ++--
> > >  drivers/gpu/drm/radeon/radeon_combios.c  | 4 ++--
> > >  2 files changed, 4 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/radeon/radeon_atombios.c b/drivers/gpu/drm/radeon/radeon_atombios.c
> > > index 848ef68d9086..5d2591725189 100644
> > > --- a/drivers/gpu/drm/radeon/radeon_atombios.c
> > > +++ b/drivers/gpu/drm/radeon/radeon_atombios.c
> > > @@ -2111,7 +2111,7 @@ static int radeon_atombios_parse_power_table_1_3(struct radeon_device *rdev)
> > >                                                                     ucOverdriveThermalController];
> > >                         info.addr = power_info->info.ucOverdriveControllerAddress >> 1;
> > >                         strlcpy(info.type, name, sizeof(info.type));
> > > -                       i2c_new_device(&rdev->pm.i2c_bus->adapter, &info);
> > > +                       i2c_new_client_device(&rdev->pm.i2c_bus->adapter, &info);
> > >                 }
> > >         }
> > >         num_modes = power_info->info.ucNumOfPowerModeEntries;
> > > @@ -2351,7 +2351,7 @@ static void radeon_atombios_add_pplib_thermal_controller(struct radeon_device *r
> > >                                 const char *name = pp_lib_thermal_controller_names[controller->ucType];
> > >                                 info.addr = controller->ucI2cAddress >> 1;
> > >                                 strlcpy(info.type, name, sizeof(info.type));
> > > -                               i2c_new_device(&rdev->pm.i2c_bus->adapter, &info);
> > > +                               i2c_new_client_device(&rdev->pm.i2c_bus->adapter, &info);
> > >                         }
> > >                 } else {
> > >                         DRM_INFO("Unknown thermal controller type %d at 0x%02x %s fan control\n",
> > > diff --git a/drivers/gpu/drm/radeon/radeon_combios.c b/drivers/gpu/drm/radeon/radeon_combios.c
> > > index c3e49c973812..d3c04df7e75d 100644
> > > --- a/drivers/gpu/drm/radeon/radeon_combios.c
> > > +++ b/drivers/gpu/drm/radeon/radeon_combios.c
> > > @@ -2704,7 +2704,7 @@ void radeon_combios_get_power_modes(struct radeon_device *rdev)
> > >                                 const char *name = thermal_controller_names[thermal_controller];
> > >                                 info.addr = i2c_addr >> 1;
> > >                                 strlcpy(info.type, name, sizeof(info.type));
> > > -                               i2c_new_device(&rdev->pm.i2c_bus->adapter, &info);
> > > +                               i2c_new_client_device(&rdev->pm.i2c_bus->adapter, &info);
> > >                         }
> > >                 }
> > >         } else {
> > > @@ -2721,7 +2721,7 @@ void radeon_combios_get_power_modes(struct radeon_device *rdev)
> > >                                 const char *name = "f75375";
> > >                                 info.addr = 0x28;
> > >                                 strlcpy(info.type, name, sizeof(info.type));
> > > -                               i2c_new_device(&rdev->pm.i2c_bus->adapter, &info);
> > > +                               i2c_new_client_device(&rdev->pm.i2c_bus->adapter, &info);
> > >                                 DRM_INFO("Possible %s thermal controller at 0x%02x\n",
> > >                                          name, info.addr);
> > >                         }
> > > --
> > > 2.20.1
> > >
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
