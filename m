Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE61C634242
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 18:13:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D06D410E426;
	Tue, 22 Nov 2022 17:13:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 796D310E425;
 Tue, 22 Nov 2022 17:13:29 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-14286d5ebc3so14664290fac.3; 
 Tue, 22 Nov 2022 09:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zQX3il7CcIFdmRozaJ2HtL2aQAeTqR4hyAqcZ0FxzQM=;
 b=YtExDrW8fCcnY764wBwJL8ZQCMkbGTJkEKiH6wBDBMf5W8LmLJinPthWqzuV6Rygc4
 tIf2sGO/G2PKbzsKW71kK4FacpG6IbXw0x8iV+dhmcCn7mI5RUY2qxIXPeAgdTtqkVGE
 sX2qGX8oXT6lzMjLKam7OwBPqnwHhcTxx6bycT6FlTAMwjDT+iVxPgvEveKtSaiyWdhx
 blaz9bi/D/6WcRRzGcxWMFF4Uo4+wCSb/h+yUP5nAcVEAGgUsgFUNCdETe23cztzrYL3
 12f88BX1IwSu4X95v0dCCM5GSC8DDIY+rT3BZGFBRTC7ITaKYFO96hZ11EjUB4BsM9Rw
 wjIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zQX3il7CcIFdmRozaJ2HtL2aQAeTqR4hyAqcZ0FxzQM=;
 b=FClm5WDUelu5iw6PpKeoWahOshspIGSxYW/ohT9Mrf6bINhu2WrcqUhR+qUbeE/gAR
 w22sDqFt/R0RM9Iw4J6iSnb4Qhoe+ozN8jxtSUasJZdvOt4r+s42zJRznh2MkPQgbmxw
 2XeGG0QFstM5589UOfwfHHlYUYg4/DljTuoM0BjaakYeUrVCe6Z6hHRMy8RiNzrow+Oh
 QoecWWQtRl/Z4J7iRdrSRhlC4r0gUXHewgqdXxsYtNMPN6fkoLNw6xEMVWEj5/r/z5gx
 Kjqu5s8eG+vBwLLHhNpgSY8Qzsqh1dVAhHEKFg2X6o+StA9AdJUW6mYydSPgk/8PQNG2
 gpeA==
X-Gm-Message-State: ANoB5plC0Ym7LbS3pZOpFbwwURT+j8BgxSNdbYWyQlc+O57wKNOgrw3a
 wxrdnXN8L7IU2U181oE2LWefOg8dbNpnxAcxmW0=
X-Google-Smtp-Source: AA0mqf7wwYcl9ye0z1I64uDo0X2t7bZ02NntEUNVIaUYDJpcxdYcFadfGdzfX1DmjCdkbAeMVSYstgeFkZXtQFXCgVA=
X-Received: by 2002:a05:6870:2b05:b0:12d:58c1:33f9 with SMTP id
 ld5-20020a0568702b0500b0012d58c133f9mr3753818oab.46.1669137208756; Tue, 22
 Nov 2022 09:13:28 -0800 (PST)
MIME-Version: 1.0
References: <20221122113043.18715-1-wangxiongfeng2@huawei.com>
 <20221122113043.18715-2-wangxiongfeng2@huawei.com>
 <CADnq5_NxLhU+zeNv4Esm=3Wn-=qHkRCzOmqT9a208BVZUn29pw@mail.gmail.com>
 <0167740e-7581-e85d-68f0-dc3e01d2a9a5@amd.com>
 <CADnq5_M1GxWpRZYVkCUmFjFzG53hRe+-6d=MOEZ1hxJisx9DwQ@mail.gmail.com>
 <BYAPR12MB46142113C29D75B8E0251926970D9@BYAPR12MB4614.namprd12.prod.outlook.com>
In-Reply-To: <BYAPR12MB46142113C29D75B8E0251926970D9@BYAPR12MB4614.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 22 Nov 2022 12:13:17 -0500
Message-ID: <CADnq5_OscVZFbys1Y0Qmm6i0V+Ogk5BjgzUesw0Veo6WxY=7+A@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/radeon: Fix PCI device refcount leak in
 radeon_atrm_get_bios()
To: "Lazar, Lijo" <Lijo.Lazar@amd.com>
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "yangyingliang@huawei.com" <yangyingliang@huawei.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 Xiongfeng Wang <wangxiongfeng2@huawei.com>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 22, 2022 at 12:10 PM Lazar, Lijo <Lijo.Lazar@amd.com> wrote:
>
> [AMD Official Use Only - General]
>
> When only second GPU has valid ATRM handle -
> then it stays inside the loop and in the next call to pci_get_class(), it=
 passes pdev reference to first GPU as the "from" param. That time it drops=
 the reference count of "from" device.

ah, right, that was the part I missed.  Thanks.

Alex


>
> Thanks,
> Lijo
> ________________________________
> From: Alex Deucher <alexdeucher@gmail.com>
> Sent: Tuesday, November 22, 2022 9:55:33 PM
> To: Lazar, Lijo <Lijo.Lazar@amd.com>
> Cc: Xiongfeng Wang <wangxiongfeng2@huawei.com>; Deucher, Alexander <Alexa=
nder.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; Pan, X=
inhui <Xinhui.Pan@amd.com>; airlied@gmail.com <airlied@gmail.com>; daniel@f=
fwll.ch <daniel@ffwll.ch>; Zhang, Hawking <Hawking.Zhang@amd.com>; dri-deve=
l@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; amd-gfx@lists.fr=
eedesktop.org <amd-gfx@lists.freedesktop.org>; yangyingliang@huawei.com <ya=
ngyingliang@huawei.com>
> Subject: Re: [PATCH 1/2] drm/radeon: Fix PCI device refcount leak in rade=
on_atrm_get_bios()
>
> On Tue, Nov 22, 2022 at 9:59 AM Lazar, Lijo <lijo.lazar@amd.com> wrote:
> >
> >
> >
> > On 11/22/2022 8:19 PM, Alex Deucher wrote:
> > > On Tue, Nov 22, 2022 at 6:12 AM Xiongfeng Wang
> > > <wangxiongfeng2@huawei.com> wrote:
> > >>
> > >> As comment of pci_get_class() says, it returns a pci_device with its
> > >> refcount increased and decreased the refcount for the input paramete=
r
> > >> @from if it is not NULL.
> > >>
> > >> If we break the loop in radeon_atrm_get_bios() with 'pdev' not NULL,=
 we
> > >> need to call pci_dev_put() to decrease the refcount. Add the missing
> > >> pci_dev_put() to avoid refcount leak.
> > >
> > > For both patches, I think pci_dev_put() needs to go into the loops.
> > > There are 2 or more GPUs on the systems where this is relevant.
> > >
> >
> > As per the logic, the loop breaks when it finds a valid ATRM handle. So
> > dev_put is required only for that device.
>
> Sure, but what if the handle is on the second DISPLAY_VGA or
> DISPLAY_OTHER class PCI device on the system?  We've already called
> pci_get_class() for the first PCI device that matched.
>
> Alex
>
> >
> > When inside the loop this happens -  "decreased the refcount for the
> > input parameter @from if it is not NULL"
> >
> > Thanks,
> > Lijo
> >
> > > Alex
> > >
> > >>
> > >> Fixes: d8ade3526b2a ("drm/radeon: handle non-VGA class pci devices w=
ith ATRM")
> > >> Fixes: c61e2775873f ("drm/radeon: split ATRM support out from the AT=
PX handler (v3)")
> > >> Signed-off-by: Xiongfeng Wang <wangxiongfeng2@huawei.com>
> > >> ---
> > >>   drivers/gpu/drm/radeon/radeon_bios.c | 1 +
> > >>   1 file changed, 1 insertion(+)
> > >>
> > >> diff --git a/drivers/gpu/drm/radeon/radeon_bios.c b/drivers/gpu/drm/=
radeon/radeon_bios.c
> > >> index 33121655d50b..2df6ce3e32cb 100644
> > >> --- a/drivers/gpu/drm/radeon/radeon_bios.c
> > >> +++ b/drivers/gpu/drm/radeon/radeon_bios.c
> > >> @@ -227,6 +227,7 @@ static bool radeon_atrm_get_bios(struct radeon_d=
evice *rdev)
> > >>
> > >>          if (!found)
> > >>                  return false;
> > >> +       pci_dev_put(pdev);
> > >>
> > >>          rdev->bios =3D kmalloc(size, GFP_KERNEL);
> > >>          if (!rdev->bios) {
> > >> --
> > >> 2.20.1
> > >>
