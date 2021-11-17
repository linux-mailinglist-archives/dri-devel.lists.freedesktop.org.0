Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 071AA454B10
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 17:35:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7486389C0A;
	Wed, 17 Nov 2021 16:35:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 97326 seconds by postgrey-1.36 at gabe;
 Wed, 17 Nov 2021 16:35:09 UTC
Received: from lithium.sammserver.com (lithium.sammserver.com [168.119.122.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F30A389C0A;
 Wed, 17 Nov 2021 16:35:09 +0000 (UTC)
Received: from mail.sammserver.com (sammserver.wg [10.32.40.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by lithium.sammserver.com (Postfix) with ESMTPS id 1CFCF3115D1B;
 Wed, 17 Nov 2021 17:35:08 +0100 (CET)
Received: from fastboi.localdomain (fastboi.wg [10.32.40.5])
 by mail.sammserver.com (Postfix) with ESMTP id 2D0EA2742A;
 Wed, 17 Nov 2021 17:35:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cavoj.net; s=email;
 t=1637166907; bh=P95aqAblyIRdPhZaJuBRn13+iNWgUj3nl9a0v2P9fdM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zb7ad8szCEnGsDNp/ZwRqrU69MggWUDFEgk/n5lSkOSmMOK9Fu30fKo7uLXD0uY3V
 5uunESTCyR2zemJTj7Axk99yayJWEDUjH7QCY7RUk7RFQjGgZs6XzCJyJfrZ7oVSVn
 /dmdN4S+tLx/lNXrVQNs3MpR59w3M32InIBexoTE=
Received: by fastboi.localdomain (Postfix, from userid 1000)
 id 1A1D71421378; Wed, 17 Nov 2021 17:35:03 +0100 (CET)
Date: Wed, 17 Nov 2021 17:35:03 +0100
From: Samuel =?utf-8?B?xIxhdm9q?= <samuel@cavoj.net>
To: "Li, Roman" <Roman.Li@amd.com>
Subject: Re: Backlight control broken on UM325 (OLED) on 5.15 (bisected)
Message-ID: <20211117163503.crld3a43wecdapwv@fastboi.localdomain>
References: <20211114105657.b57pjojiv72iopg5@fastboi.localdomain>
 <CADnq5_NF++xE6Jj32Wy2ZGALo4pOGt3yTCoj5HU37tKO3Ce=Fg@mail.gmail.com>
 <20211116133259.svayrqaiivaubkjp@fastboi.localdomain>
 <BN6PR1201MB00849879DB7D939C0B29AB43899A9@BN6PR1201MB0084.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BN6PR1201MB00849879DB7D939C0B29AB43899A9@BN6PR1201MB0084.namprd12.prod.outlook.com>
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on sammserver.tu
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Roman,

On 17.11.2021 15:26, Li, Roman wrote:
> [Public]
> 
> Hi Samuel,
> 
> Can you please try: https://patchwork.freedesktop.org/patch/463485/ ?

Yup, that did the trick. Works as before. Thank you very much.

Samuel

> 
> Thanks,
> Roman
> 
> > -----Original Message-----
> > From: Samuel Čavoj <samuel@cavoj.net>
> > Sent: Tuesday, November 16, 2021 8:33 AM
> > To: Alex Deucher <alexdeucher@gmail.com>
> > Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Li, Sun peng (Leo)
> > <Sunpeng.Li@amd.com>; Li, Roman <Roman.Li@amd.com>; Maling list - DRI
> > developers <dri-devel@lists.freedesktop.org>; LKML <linux-
> > kernel@vger.kernel.org>; amd-gfx list <amd-gfx@lists.freedesktop.org>
> > Subject: Re: Backlight control broken on UM325 (OLED) on 5.15 (bisected)
> >
> > Hi Alex,
> >
> > thank you for your response.
> >
> > On 15.11.2021 10:43, Alex Deucher wrote:
> > > [...]
> > >
> > > That patch adds support for systems with multiple backlights.  Do you
> > > have multiple backlight devices now?  If so, does the other one work?
> >
> > No, there is still only one backlight device -- amdgpu_bl0.
> > >
> > > Can you also try this patch?
> > >
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> > > b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> > > index 4811b0faafd9..67163c9d49e6 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> > > @@ -854,8 +854,8 @@ int amdgpu_acpi_init(struct amdgpu_device *adev)
> > >                 if (amdgpu_device_has_dc_support(adev)) {  #if
> > > defined(CONFIG_DRM_AMD_DC)
> > >                         struct amdgpu_display_manager *dm = &adev->dm;
> > > -                       if (dm->backlight_dev[0])
> > > -                               atif->bd = dm->backlight_dev[0];
> > > +                       if (dm->backlight_dev[1])
> > > +                               atif->bd = dm->backlight_dev[1];
> > >  #endif
> > >                 } else {
> > >                         struct drm_encoder *tmp;
> > >
> >
> > There is no difference in behaviour after applying the patch.
> >
> > Samuel
> >
> > >
> > > Alex
> > >
> > > >
> > > > Regards,
> > > > Samuel Čavoj
> > > >
> > > > [0]:
> > > > https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fww
> > > >
> > w.reddit.com%2Fr%2FAMDLaptops%2Fcomments%2Fqst0fm%2Fafter_updating
> > _t
> > > >
> > o_linux_515_my_brightness%2F&amp;data=04%7C01%7CRoman.Li%40amd.co
> > m%7
> > > >
> > Ce1c766a2f7014cdb664308d9a9059cc6%7C3dd8961fe4884e608e11a82d994e1
> > 83d
> > > >
> > %7C0%7C0%7C637726663861883494%7CUnknown%7CTWFpbGZsb3d8eyJWIjoi
> > MC4wLj
> > > >
> > AwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;s
> > dat
> > > >
> > a=hfsaEzng9%2FjAI2F%2BKg87Tv2Mu%2FfPurCQELr62%2B%2FVF%2BQ%3D&a
> > mp;res
> > > > erved=0
