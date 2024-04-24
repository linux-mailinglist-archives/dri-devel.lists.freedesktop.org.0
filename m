Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 199EB8B1395
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 21:32:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0171110E1DA;
	Wed, 24 Apr 2024 19:32:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="O1D1Wm5L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D2D310E948
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 19:32:46 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-de45dba157cso251359276.3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 12:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713987165; x=1714591965; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=47HcS+tUP8b+9bxu0PIF6L0JsffW7atYv21eLmoyL7s=;
 b=O1D1Wm5LItcuhEWCs/Ekf9Z/bqr2VpFBVwfifTVySQpHH1dx4JAzGROzJOVzBa8O8E
 6HJT+Ce9YAl+yJQxFnoDLFTHjkkTLkawFazEPVj2dsbX4vmpH78qQaujJmltrNo5ci+i
 oOyiTWfyEhpgNkkn9ZNUSKcgNYTaNLqMn46FzT2XW5Lt2+HoXXQqYut5RD0ND7nh2ceh
 nCaJzBsaW5iHwj/l5NYmIt+j8m/EGskwta7YfeIqILa7ExZm1CRNksTAb5oM36rE3Mje
 A08n732nmd0rtMabJInapMFzkvGfkxu8VplsIr5Z8etUcyIdh7h9noRmLXBtT4W6LDy9
 VXmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713987165; x=1714591965;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=47HcS+tUP8b+9bxu0PIF6L0JsffW7atYv21eLmoyL7s=;
 b=krOLrLOx/t91TWBvHFGoj+GmfdqkHXaIxfxXkFLJ+CJXdMT0uM/amM3iiXnd6Wzj39
 KmQ5vvzagb4EIaQm3riCICk/MHNgcKh4Vnzi/bW6ssEOVePooBsRCOib6cL5G7/nOhHT
 s8Ov2KQD48uFDcwuCfIItoS7xUzwwbZ+hrhVjVoUQMC5zIf0/17Kq+SHHQ8+vnMZX4cx
 +m6zOGOR7cFC7qlGmB9rQcl0WFfdPFddEdljd4otKGP86ot2CxZpZSIaOjiBPbsC+wTO
 mDbD92Jd3WMkeSHGeAn0RUziI2MrKReOQzbCO9OuWgahfRLCvUn2qP1+lzt/csgoLYY6
 YFVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLhtmwyx94L2V55s9g1dRNB1cFn2fc7x39dCW5nHZykaamqLJrVXxKM7Md83dTh7aBxs3TlkjBBEca+XESJiEIN2Inf/WEpDMY9k7sGl9i
X-Gm-Message-State: AOJu0Yy4oW4WrJDvOYYMdnDh8yaC0Z1lbzGC8yBTf2Pl1SI1s8CLQSpi
 3MwM5AUTRbCuQrIG9im+7PgGG3ZMu3lTC0hDW+OktYf8o0ElodMQgImjt7/tuMdnc8eIqaxFjHa
 Vo10GHaBvmRZ30VV/ZxSiaKquUef/l/7jTjlzsA==
X-Google-Smtp-Source: AGHT+IF00MN5VEZITEjzf5PI6hYeI6Nm5bCzHMoFOU8I1tTtInkOgWhiANYycMpRJwQGESp+WPQSi67G0TQVeSangug=
X-Received: by 2002:a25:ae88:0:b0:de4:70b7:7bf with SMTP id
 b8-20020a25ae88000000b00de470b707bfmr3285349ybj.31.1713987164932; Wed, 24 Apr
 2024 12:32:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240422164658.217037-1-sui.jingfeng@linux.dev>
 <Zie3ebHOEpWHj1qV@smile.fi.intel.com>
 <d5bc1e73-a553-451e-ab74-f5f0ca259c6b@linux.dev>
 <hcltp2bbxxg2t7ibmzgiib7mgbwgmvzwnnq6mochdh7c4h76r3@bxj6yk5zq64e>
 <ZikE4qOVO7rgIs9a@smile.fi.intel.com>
 <CAA8EJpr1FSjizAh6Dp5Bmux3NrGYh=BfHFL4D1fa87Og4ymY0w@mail.gmail.com>
 <Zikck2FJb4-PgXX0@smile.fi.intel.com>
 <kucey3jsydjye3ndflns3cqolcpizhnxgzz3fkmcatlnpbnwrk@22ulsqfh2vf6>
 <Zik3AjiWkytSVn-1@smile.fi.intel.com>
In-Reply-To: <Zik3AjiWkytSVn-1@smile.fi.intel.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 24 Apr 2024 22:32:33 +0300
Message-ID: <CAA8EJpr_zAmsVMeOvMjmnxZpcoDsLk3X9fTtQjn5aDEt=hQPPQ@mail.gmail.com>
Subject: Re: [PATCH v2] software node: Implement device_get_match_data fwnode
 callback
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Sui Jingfeng <sui.jingfeng@linux.dev>, dri-devel@lists.freedesktop.org, 
 linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, 24 Apr 2024 at 19:45, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Apr 24, 2024 at 07:34:54PM +0300, Dmitry Baryshkov wrote:
> > On Wed, Apr 24, 2024 at 05:52:03PM +0300, Andy Shevchenko wrote:
> > > On Wed, Apr 24, 2024 at 04:34:39PM +0300, Dmitry Baryshkov wrote:
> > > > On Wed, 24 Apr 2024 at 16:11, Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > On Wed, Apr 24, 2024 at 12:37:16AM +0300, Dmitry Baryshkov wrote:
> > > > > > On Wed, Apr 24, 2024 at 12:49:18AM +0800, Sui Jingfeng wrote:
> > > > > > > On 2024/4/23 21:28, Andy Shevchenko wrote:
> > > > > > > > On Tue, Apr 23, 2024 at 12:46:58AM +0800, Sui Jingfeng wrot=
e:
>
> ...
>
> > > > > > But let me throw an argument why this patch (or something simil=
ar) looks
> > > > > > to be necessary.
> > > > > >
> > > > > > Both on DT and non-DT systems the kernel allows using the non-O=
F based
> > > > > > matching. For the platform devices there is platform_device_id-=
based
> > > > > > matching.
> > > > > >
> > > > > > Currently handling the data coming from such device_ids require=
s using
> > > > > > special bits of code, e.g. platform_get_device_id(pdev)->driver=
_data to
> > > > > > get the data from the platform_device_id. Having such codepaths=
 goes
> > > > > > against the goal of unifying DT and non-DT paths via generic pr=
operty /
> > > > > > fwnode code.
> > > > > >
> > > > > > As such, I support Sui's idea of being able to use device_get_m=
atch_data
> > > > > > for non-DT, non-ACPI platform devices.
> > > > >
> > > > > I'm not sure I buy this. We have a special helpers based on the b=
us type to
> > > > > combine device_get_match_data() with the respective ID table craw=
ling, see
> > > > > the SPI and I=C2=B2C cases as the examples.
> > > >
> > > > I was thinking that we might be able to deprecate these helpers and
> > > > always use device_get_match_data().
> > >
> > > True, but that is orthogonal to swnode match_data support, right?
> > > There even was (still is?) a patch series to do something like a new
> > > member to struct device_driver (? don't remember) to achieve that.
> >
> > Maybe the scenario was not properly described in the commit message, or
> > maybe I missed something. The usecase that I understood from the commit
> > message was to use instatiated i2c / spi devices, which means
> > i2c_device_id / spi_device_id. The commit message should describe why
> > the usecase requires using 'compatible' property and swnode. Ideally it
> > should describe how these devices are instantiated at the first place.
>
> Yep. I also do not clearly understand the use case and why we need to hav=
e
> a board file, because the swnodes all are about board files that we must =
not
> use for the new platforms.

Not necessarily board files. In some cases it also allows creating
device nodes to patch devices, e.g. when the ACPI description is
incomplete. But my main concern is about using the "compatible"
property here. I suppose that it should be avoided if not absolutely
required, instead the driver should use native foo_device_id matching.

Here is a list of existing "compatible" properties and their usecases.

arch/arm/mach-omap1/board-nokia770.c:
PROPERTY_ENTRY_STRING("compatible", "ti,ads7846"),

This one looks like a way to overcome shortcomings of the ads7846
driver. The driver should add spi_device_id, use
spi_get_device_match_data(), then the property can be dropped.

drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c: nodes->i2c_props[0] =3D
PROPERTY_ENTRY_STRING("compatible", "snps,designware-i2c");
drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c: nodes->sfp_props[0] =3D
PROPERTY_ENTRY_STRING("compatible", "sff,sfp");

I think these two can also be dropped if the corresponding drivers get
platform_device_id entries.

drivers/platform/x86/x86-android-tablets/asus.c:
PROPERTY_ENTRY_STRING("compatible", "simple-battery"),
drivers/platform/x86/x86-android-tablets/shared-psy-info.c:
PROPERTY_ENTRY_STRING("compatible", "simple-battery"),

These are required by the power_supply core to identify the "battery
stub" case. There is no corresponding device being created and/or
matched.

drivers/platform/chrome/chromeos_laptop.c:
PROPERTY_ENTRY_STRING("compatible", "atmel,maxtouch"),
drivers/platform/chrome/chromeos_laptop.c:
PROPERTY_ENTRY_STRING("compatible", "atmel,maxtouch"),
drivers/platform/chrome/chromeos_laptop.c:
PROPERTY_ENTRY_STRING("compatible", "atmel,maxtouch"),
drivers/platform/x86/x86-android-tablets/asus.c:
PROPERTY_ENTRY_STRING("compatible", "atmel,atmel_mxt_ts"),

The driver checks for the presence of the "compatible" property to
check that the device has properties at all. I think it was added as a
safegap against treating incomplete trackpad nodes (which should have
linux,gpio-keymap) as touchscreens (which have none).

--=20
With best wishes
Dmitry
