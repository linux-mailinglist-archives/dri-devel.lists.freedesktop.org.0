Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8015816EE3C
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 19:42:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25A6E6EB8C;
	Tue, 25 Feb 2020 18:42:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 425F96EB8C;
 Tue, 25 Feb 2020 18:42:26 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id a5so265979wmb.0;
 Tue, 25 Feb 2020 10:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OqH7CR1lfEiGAPHeGdQWqA+aeWzjvMYvdFLdj61lVYg=;
 b=HrXfQJ3shOGyngRB+8GcigwQt9Gvtp1OXkjNizTlyL4LVumFN+m1n2vILkg0neu2h7
 brgU9joW3AcGioYimZUUdHQkoVMAP6XJeBCgEdhZdPrTyYcjibaRGUzUjYFtN15SQw5c
 2wD8XCWwFqrtp3XX7wBWhfHEem+G8Gkpp09tG2OpemaMtwFIT96H8mYCCqYGmD8v7C0r
 fks7ZZPUFoABskEiHyrWiCZWtXtsqBkslD0UTTtmSQtgiQD0efIH4n4+aEgO2hgbQUnq
 9jN9ks5x8dom8/W98KYMNtfWHtxgNL4+i7VYtPXclfSSwFBf5FU7WC32pAmxvaRyWklI
 ZeQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OqH7CR1lfEiGAPHeGdQWqA+aeWzjvMYvdFLdj61lVYg=;
 b=QH/dzEzfMYN2bytItJJ746SrHv2vjtJY73kUTizDmUSe3NmYiJ+5a5UKv4rE+LIvyz
 fy6ZO0Rd9ho6g6IMAHbgalOkwl2ZGUa1W2+HC9FrLJmYN+fQJ1f4U0jmkvUaCSr/Xmwz
 hWC4p3ez4m9xnHcw8bjZwaU/vNvp/zlxtUpf1p6yUZbg+XM3CLy3HBaeK3mtvUKvi1g6
 p25+Ko/nJFHUfODRENOkeU8JvJdN7tUxKKTR1/vNzPAmYPDSKm0C6XZ3d1wudjrpSMEN
 EnIJXGTBd4S23tCAMZusdVyteouOjhdu5IYxBq5Qoyl0URm7B29o0ohRiFco7Ztxe3WB
 yl5Q==
X-Gm-Message-State: APjAAAXqtqyOk/6Lin2n2NsClKQvAo47jMYGD8hjhUACg0L6QBMGb1Xs
 H5EPTKDRY9Cx1rRav+0nDPobVsn8Zun26d5LZZ+bzZQ/
X-Google-Smtp-Source: APXvYqxOrvpmNM4Om8h4im0Qzaas0SuMFNDTcZn0kRaBEoz3wM2RlYttB27VVIZJCQoycAijiBhypIp8CMw8vp7/yGw=
X-Received: by 2002:a1c:f21a:: with SMTP id s26mr552495wmc.39.1582656144790;
 Tue, 25 Feb 2020 10:42:24 -0800 (PST)
MIME-Version: 1.0
References: <20200207211713.3870-1-alexander.deucher@amd.com>
 <22cf2c92-52a0-5e1a-e569-4fe421e38022@amd.com>
 <CADnq5_M9yngJYmhOKiUvpR0H-e5yoVOrqwoim+_Ps63wY3QsRg@mail.gmail.com>
 <DM5PR1201MB2554BBEA6B0C7DECFFE8DD3E9EED0@DM5PR1201MB2554.namprd12.prod.outlook.com>
 <DM5PR1201MB2554768A51B1A4625E67BB899EED0@DM5PR1201MB2554.namprd12.prod.outlook.com>
 <CADnq5_M8Hb9YJ-cVzr0x8ABUpQjeL5DwOuCwjEWfdTXFJdbGeQ@mail.gmail.com>
 <MN2PR12MB431991DF654BFF4C028DDD46E5ED0@MN2PR12MB4319.namprd12.prod.outlook.com>
 <CADnq5_Mmg9spo_Zb0PEEo-gx4JeAr3meSmjR693iWurH_rw7aw@mail.gmail.com>
In-Reply-To: <CADnq5_Mmg9spo_Zb0PEEo-gx4JeAr3meSmjR693iWurH_rw7aw@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 25 Feb 2020 13:42:13 -0500
Message-ID: <CADnq5_NmmhXjTo=qVnZR+hua6W6ReNx8fRDqXebgP9KCbdHF3Q@mail.gmail.com>
Subject: Re: [PATCH 13/15] drm/amdgpu/display: split dp connector registration
 (v3)
To: "Zuo, Jerry" <Jerry.Zuo@amd.com>
Content-Type: multipart/mixed; boundary="000000000000501673059f6ad921"
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
Cc: "Broadworth, Mark" <Mark.Broadworth@amd.com>, "Liu,
 Zhan" <Zhan.Liu@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000501673059f6ad921
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2020 at 1:32 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Tue, Feb 25, 2020 at 1:30 PM Zuo, Jerry <Jerry.Zuo@amd.com> wrote:
> >
> > [AMD Official Use Only - Internal Distribution Only]
> >
> > Hi Alex:
> >
> >      It happened when a MST monitor is attached, either in driver load =
or hotplug later.
>
> I think I found the issue.  I'll send a patch shortly.

Attaching two patches.  I think patch 1 should fix it.  Patch 2 is the
same patch as before.  I'm not sure
drm_dp_mst_connector_late_register() is necessary since no other
driver calls it.

Alex

>
> Alex
>
>
> >
> > Regards,
> > Jerry
> >
> > -----Original Message-----
> > From: Alex Deucher <alexdeucher@gmail.com>
> > Sent: February 25, 2020 1:23 PM
> > To: Liu, Zhan <Zhan.Liu@amd.com>
> > Cc: Wentland, Harry <Harry.Wentland@amd.com>; Zuo, Jerry <Jerry.Zuo@amd=
.com>; amd-gfx list <amd-gfx@lists.freedesktop.org>; Maling list - DRI deve=
lopers <dri-devel@lists.freedesktop.org>; Deucher, Alexander <Alexander.Deu=
cher@amd.com>; Broadworth, Mark <Mark.Broadworth@amd.com>
> > Subject: Re: [PATCH 13/15] drm/amdgpu/display: split dp connector regis=
tration (v3)
> >
> > On Tue, Feb 25, 2020 at 1:20 PM Liu, Zhan <Zhan.Liu@amd.com> wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: Liu, Zhan
> > > > Sent: 2020/February/25, Tuesday 10:10 AM
> > > > To: Alex Deucher <alexdeucher@gmail.com>; Wentland, Harry
> > > > <Harry.Wentland@amd.com>
> > > > Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>; Maling list - DRI
> > > > developers <dri-devel@lists.freedesktop.org>; Deucher, Alexander
> > > > <Alexander.Deucher@amd.com>; Broadworth, Mark
> > > > <Mark.Broadworth@amd.com>
> > > > Subject: RE: [PATCH 13/15] drm/amdgpu/display: split dp connector
> > > > registration (v3)
> > > >
> > > >
> > > > > -----Original Message-----
> > > > > From: Alex Deucher <alexdeucher@gmail.com>
> > > > > Sent: 2020/February/25, Tuesday 9:07 AM
> > > > > To: Wentland, Harry <Harry.Wentland@amd.com>
> > > > > Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>; Maling list -
> > > > > DRI developers <dri-devel@lists.freedesktop.org>; Deucher,
> > > > > Alexander <Alexander.Deucher@amd.com>; Broadworth, Mark
> > > > > <Mark.Broadworth@amd.com>; Liu, Zhan <Zhan.Liu@amd.com>
> > > > > Subject: Re: [PATCH 13/15] drm/amdgpu/display: split dp connector
> > > > > registration (v3)
> > > > >
> > > > > On Mon, Feb 24, 2020 at 4:09 PM Harry Wentland <hwentlan@amd.com>
> > > > > wrote:
> > > > > >
> > > > > > On 2020-02-07 4:17 p.m., Alex Deucher wrote:
> > > > > > > Split into init and register functions to avoid a segfault in
> > > > > > > some configs when the load/unload callbacks are removed.
> > > > > > >
> > > > > >
> > > > > > Looks like MST is completely broken with this change with a NUL=
L
> > > > > > pointer dereference in drm_dp_aux_register.
> > > > > >
> > > > > > > v2:
> > > > > > > - add back accidently dropped has_aux setting
> > > > > > > - set dev in late_register
> > > > > > >
> > > > > > > v3:
> > > > > > > - fix dp cec ordering
> > > > > > >
> > > > > > > Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> > > > > > > ---
> > > > > > >  drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c   | 16
> > > > > ++++++++++++++++
> > > > > > >  drivers/gpu/drm/amd/amdgpu/atombios_dp.c         | 10 ++----=
----
> > > > > > >  .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c  |  7 ++++++=
-
> > > > > > >  3 files changed, 24 insertions(+), 9 deletions(-)
> > > > > > >
> > > > > > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> > > > > > > b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> > > > > > > index ec1501e3a63a..f355d9a752d2 100644
> > > > > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> > > > > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> > > > > > > @@ -1461,6 +1461,20 @@ static enum drm_mode_status
> > > > > amdgpu_connector_dp_mode_valid(struct drm_connector
> > > > > > >       return MODE_OK;
> > > > > > >  }
> > > > > > >
> > > > > > > +static int
> > > > > > > +amdgpu_connector_late_register(struct drm_connector *connect=
or) {
> > > > > > > +     struct amdgpu_connector *amdgpu_connector =3D
> > > > > to_amdgpu_connector(connector);
> > > > > > > +     int r =3D 0;
> > > > > > > +
> > > > > > > +     if (amdgpu_connector->ddc_bus->has_aux) {
> > > > > > > +             amdgpu_connector->ddc_bus->aux.dev =3D
> > > > > > > + amdgpu_connector-
> > > > > >base.kdev;
> > > > > > > +             r =3D drm_dp_aux_register(&amdgpu_connector->dd=
c_bus->aux);
> > > > > > > +     }
> > > > > > > +
> > > > > > > +     return r;
> > > > > > > +}
> > > > > > > +
> > > > > > >  static const struct drm_connector_helper_funcs
> > > > > amdgpu_connector_dp_helper_funcs =3D {
> > > > > > >       .get_modes =3D amdgpu_connector_dp_get_modes,
> > > > > > >       .mode_valid =3D amdgpu_connector_dp_mode_valid, @@ -147=
5,6
> > > > > > > +1489,7 @@ static const struct drm_connector_funcs
> > > > > amdgpu_connector_dp_funcs =3D {
> > > > > > >       .early_unregister =3D amdgpu_connector_unregister,
> > > > > > >       .destroy =3D amdgpu_connector_destroy,
> > > > > > >       .force =3D amdgpu_connector_dvi_force,
> > > > > > > +     .late_register =3D amdgpu_connector_late_register,
> > > > > > >  };
> > > > > > >
> > > > > > >  static const struct drm_connector_funcs
> > > > > > > amdgpu_connector_edp_funcs =3D { @@ -1485,6 +1500,7 @@ static
> > > > const
> > > > > > > struct drm_connector_funcs
> > > > > amdgpu_connector_edp_funcs =3D {
> > > > > > >       .early_unregister =3D amdgpu_connector_unregister,
> > > > > > >       .destroy =3D amdgpu_connector_destroy,
> > > > > > >       .force =3D amdgpu_connector_dvi_force,
> > > > > > > +     .late_register =3D amdgpu_connector_late_register,
> > > > > > >  };
> > > > > > >
> > > > > > >  void
> > > > > > > diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
> > > > > > > b/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
> > > > > > > index ea702a64f807..9b74cfdba7b8 100644
> > > > > > > --- a/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
> > > > > > > +++ b/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
> > > > > > > @@ -186,16 +186,10 @@ amdgpu_atombios_dp_aux_transfer(struct
> > > > > > > drm_dp_aux *aux, struct drm_dp_aux_msg *m
> > > > > > >
> > > > > > >  void amdgpu_atombios_dp_aux_init(struct amdgpu_connector
> > > > > > > *amdgpu_connector)  {
> > > > > > > -     int ret;
> > > > > > > -
> > > > > > >       amdgpu_connector->ddc_bus->rec.hpd =3D amdgpu_connector=
-
> > > > > >hpd.hpd;
> > > > > > > -     amdgpu_connector->ddc_bus->aux.dev =3D amdgpu_connector=
-
> > > > > >base.kdev;
> > > > > > >       amdgpu_connector->ddc_bus->aux.transfer =3D
> > > > > amdgpu_atombios_dp_aux_transfer;
> > > > > > > -     ret =3D drm_dp_aux_register(&amdgpu_connector->ddc_bus-=
>aux);
> > > > > > > -     if (!ret)
> > > > > > > -             amdgpu_connector->ddc_bus->has_aux =3D true;
> > > > > > > -
> > > > > > > -     WARN(ret, "drm_dp_aux_register_i2c_bus() failed with er=
ror %d\n",
> > > > > ret);
> > > > > > > +     drm_dp_aux_init(&amdgpu_connector->ddc_bus->aux);
> > > > > > > +     amdgpu_connector->ddc_bus->has_aux =3D true;
> > > > > > >  }
> > > > > > >
> > > > > > >  /***** general DP utility functions *****/ diff --git
> > > > > > > a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > > > > > > b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > > > > > > index 3959c942c88b..d5b9e72f2649 100644
> > > > > > > ---
> > > > > a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > > > > > > +++
> > > > > b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > > > > > > @@ -155,6 +155,11 @@
> > > > > amdgpu_dm_mst_connector_late_register(struct drm_connector
> > > > > *connector)
> > > > > > >       struct amdgpu_dm_connector *amdgpu_dm_connector =3D
> > > > > > >               to_amdgpu_dm_connector(connector);
> > > > > > >       struct drm_dp_mst_port *port =3D
> > > > > > > amdgpu_dm_connector->port;
> > > > > > > +     int r;
> > > > > > > +
> > > > > > > +     r =3D
> > > > > > > + drm_dp_aux_register(&amdgpu_dm_connector->dm_dp_aux.aux);
> > > > > >
> > > > > > This calls drm_dp_aux_register_devnode which is also called
> > > > > > later in drm_dp_mst_connector_late_register. Wonder if that's a=
 problem.
> > > > >
> > > > > Does this patch help?  I'm not too familiar with the MST code and
> > > > > I don't have an MST monitor.
> > > >
> > > > I have an MST monitor and I can give it a spin. I'll get back to yo=
u later.
> > >
> > > + Jerry who is following up on this issue
> > >
> > > Thank you Alex for your patch. Unfortunately, it doesn't solve the is=
sue.
> > >
> > > Jerry is following up on this ticket, and I've added him to this emai=
l thread.
> >
> > Can you send me the full dmesg output?  Also, does it happen as soon as=
 the driver loads or sometime later?
> >
> > Alex
> >
> >
> > >
> > > Zhan
> > >
> > > >
> > > > Zhan
> > > >
> > > > >
> > > > > Alex
> > > > >
> > > > >
> > > > > >
> > > > > > Harry
> > > > > >
> > > > > > > +     if (r)
> > > > > > > +             return r;
> > > > > > >
> > > > > > >  #if defined(CONFIG_DEBUG_FS)
> > > > > > >       connector_debugfs_init(amdgpu_dm_connector);
> > > > > > > @@ -484,7 +489,7 @@ void
> > > > amdgpu_dm_initialize_dp_connector(struct
> > > > > amdgpu_display_manager *dm,
> > > > > > >       aconnector->dm_dp_aux.aux.transfer =3D dm_dp_aux_transf=
er;
> > > > > > >       aconnector->dm_dp_aux.ddc_service =3D
> > > > > > > aconnector->dc_link->ddc;
> > > > > > >
> > > > > > > -     drm_dp_aux_register(&aconnector->dm_dp_aux.aux);
> > > > > > > +     drm_dp_aux_init(&aconnector->dm_dp_aux.aux);
> > > > > > >       drm_dp_cec_register_connector(&aconnector->dm_dp_aux.au=
x,
> > > > > > >                                     &aconnector->base);
> > > > > > >
> > > > > > >

--000000000000501673059f6ad921
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0002-drm-amdgpu-display-don-t-call-drm_dp_mst_connector_l.patch"
Content-Disposition: attachment; 
	filename="0002-drm-amdgpu-display-don-t-call-drm_dp_mst_connector_l.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_k728lgax0>
X-Attachment-Id: f_k728lgax0

RnJvbSBjY2YzYWQxZjFhZmNjM2QzMjM5OWJkYzU4NGI2MTkxOTk1ODJhODRlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+CkRhdGU6IFR1ZSwgMjUgRmViIDIwMjAgMTM6Mzk6NDQgLTA1MDAKU3ViamVjdDogW1BBVENI
IDIvMl0gZHJtL2FtZGdwdS9kaXNwbGF5OiBkb24ndCBjYWxsCiBkcm1fZHBfbXN0X2Nvbm5lY3Rv
cl9sYXRlX3JlZ2lzdGVyICh2MikKCk5vdGhpbmcgZWxzZSBjYWxscyBpdC4gIE5vdCBzdXJlIGl0
J3MgbmVjZXNzYXJ5LgoKdjI6IHJlbW92ZSB1bnVzZWQgcG9ydCB2YXJpYWJsZS4KClNpZ25lZC1v
ZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9tc3RfdHlwZXMuYyB8
IDMgKy0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVf
ZG1fbXN0X3R5cGVzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2Ft
ZGdwdV9kbV9tc3RfdHlwZXMuYwppbmRleCBkN2E3ZGMwYzI1NmUuLjBlZjBlZWIxNjc3OCAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1f
bXN0X3R5cGVzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9h
bWRncHVfZG1fbXN0X3R5cGVzLmMKQEAgLTE1NCw3ICsxNTQsNiBAQCBhbWRncHVfZG1fbXN0X2Nv
bm5lY3Rvcl9sYXRlX3JlZ2lzdGVyKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCiB7
CiAJc3RydWN0IGFtZGdwdV9kbV9jb25uZWN0b3IgKmFtZGdwdV9kbV9jb25uZWN0b3IgPQogCQl0
b19hbWRncHVfZG1fY29ubmVjdG9yKGNvbm5lY3Rvcik7Ci0Jc3RydWN0IGRybV9kcF9tc3RfcG9y
dCAqcG9ydCA9IGFtZGdwdV9kbV9jb25uZWN0b3ItPnBvcnQ7CiAJaW50IHI7CiAKIAlhbWRncHVf
ZG1fY29ubmVjdG9yLT5kbV9kcF9hdXguYXV4LmRldiA9IGNvbm5lY3Rvci0+a2RldjsKQEAgLTE2
Niw3ICsxNjUsNyBAQCBhbWRncHVfZG1fbXN0X2Nvbm5lY3Rvcl9sYXRlX3JlZ2lzdGVyKHN0cnVj
dCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCiAJY29ubmVjdG9yX2RlYnVnZnNfaW5pdChhbWRn
cHVfZG1fY29ubmVjdG9yKTsKICNlbmRpZgogCi0JcmV0dXJuIGRybV9kcF9tc3RfY29ubmVjdG9y
X2xhdGVfcmVnaXN0ZXIoY29ubmVjdG9yLCBwb3J0KTsKKwlyZXR1cm4gcjsKIH0KIAogc3RhdGlj
IHZvaWQKLS0gCjIuMjQuMQoK
--000000000000501673059f6ad921
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-drm-amdgpu-display-move-the-setting-of-the-aux-dev.patch"
Content-Disposition: attachment; 
	filename="0001-drm-amdgpu-display-move-the-setting-of-the-aux-dev.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_k728lgb81>
X-Attachment-Id: f_k728lgb81

RnJvbSA0ZWVlNmYyZGU2NmM4ODUxOTkwODQxMTNlMmU2MGM2YTI4ODU5ZTM3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+CkRhdGU6IFR1ZSwgMjUgRmViIDIwMjAgMTM6MzY6MjYgLTA1MDAKU3ViamVjdDogW1BBVENI
IDEvMl0gZHJtL2FtZGdwdS9kaXNwbGF5OiBtb3ZlIHRoZSBzZXR0aW5nIG9mIHRoZSBhdXggZGV2
CgpXZSBuZWVkIHRvIG1vdmUgdGhpcyBpbnRvIGxhdGUgaW5pdCB0byBhdm9pZCBpdCBiZWluZyBO
VUxMCm9uY2Ugd2Ugc3dpdGNoIHRoZSBpbml0IG9yZGVyLgoKU2lnbmVkLW9mZi1ieTogQWxleCBE
ZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX21zdF90eXBlcy5jIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fbXN0X3R5cGVzLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9tc3RfdHlw
ZXMuYwppbmRleCBkNWI5ZTcyZjI2NDkuLmQ3YTdkYzBjMjU2ZSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fbXN0X3R5cGVzLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fbXN0X3R5
cGVzLmMKQEAgLTE1Nyw2ICsxNTcsNyBAQCBhbWRncHVfZG1fbXN0X2Nvbm5lY3Rvcl9sYXRlX3Jl
Z2lzdGVyKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCiAJc3RydWN0IGRybV9kcF9t
c3RfcG9ydCAqcG9ydCA9IGFtZGdwdV9kbV9jb25uZWN0b3ItPnBvcnQ7CiAJaW50IHI7CiAKKwlh
bWRncHVfZG1fY29ubmVjdG9yLT5kbV9kcF9hdXguYXV4LmRldiA9IGNvbm5lY3Rvci0+a2RldjsK
IAlyID0gZHJtX2RwX2F1eF9yZWdpc3RlcigmYW1kZ3B1X2RtX2Nvbm5lY3Rvci0+ZG1fZHBfYXV4
LmF1eCk7CiAJaWYgKHIpCiAJCXJldHVybiByOwpAQCAtNDg1LDcgKzQ4Niw2IEBAIHZvaWQgYW1k
Z3B1X2RtX2luaXRpYWxpemVfZHBfY29ubmVjdG9yKHN0cnVjdCBhbWRncHVfZGlzcGxheV9tYW5h
Z2VyICpkbSwKIAkJCQkgICAgICAgc3RydWN0IGFtZGdwdV9kbV9jb25uZWN0b3IgKmFjb25uZWN0
b3IpCiB7CiAJYWNvbm5lY3Rvci0+ZG1fZHBfYXV4LmF1eC5uYW1lID0gImRtZGMiOwotCWFjb25u
ZWN0b3ItPmRtX2RwX2F1eC5hdXguZGV2ID0gYWNvbm5lY3Rvci0+YmFzZS5rZGV2OwogCWFjb25u
ZWN0b3ItPmRtX2RwX2F1eC5hdXgudHJhbnNmZXIgPSBkbV9kcF9hdXhfdHJhbnNmZXI7CiAJYWNv
bm5lY3Rvci0+ZG1fZHBfYXV4LmRkY19zZXJ2aWNlID0gYWNvbm5lY3Rvci0+ZGNfbGluay0+ZGRj
OwogCi0tIAoyLjI0LjEKCg==
--000000000000501673059f6ad921
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--000000000000501673059f6ad921--
