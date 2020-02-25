Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E36F16EDD9
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 19:20:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47EC06EB81;
	Tue, 25 Feb 2020 18:20:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2080.outbound.protection.outlook.com [40.107.93.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2A946EB80;
 Tue, 25 Feb 2020 18:20:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YdUa8GG9iafAQGAWimRmoSGL/7tCx4OFiS4fbnD1iy/qvRmbob8IPilLlNaoNyKWtXlpsESk8mOP7196Wh8DtOHYjE7m+kUoqu+CLhk+NXMi6mZKXOnLO9toWPgrNvonP0ecKyQpyyEMI0b0SV+5t7Gx1xzQLxOwadrXzAj0AZXr3cAugL2A4Lasq0FXhvyKFdlX5PuGelG1Lr3Q/ATdQ8y5G/2EnKjKNnFP2JvnwjyuqOhjDVuj7eOVt2D0aeg5Z6u9Dd9tfNxX+Zio13Ull6rdSslbj15GoG7xKaXpyGOsc+auSyYR+Fq0tCbS5y3D6I6qQkD6+9/O3Gl5ng9/nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oI/bWI1KcrZgUvupwXETaQpu9xc1TeRB+r67mTWVscA=;
 b=J+bIfjgfWEr21Q1KjvEibtIu20Kvat4lDG2GsuSsA96i2NDbcKw8+sRkYcO9qUZwZcC4Ziqu2HGDZqvQBGeXvAn8m5Tbep97Hk1Z2B3BfEhdPDIefVyiql9ODWN++s/yemoT1upxkyEu8dskj7EOnILKfsq/bu0urJbdaK0LmgFmYlDDmanRcji2uIiIkjRkaLzn0pREJseVlyHv4loCGbUkT79okJ3i1Br1z5Tsz4MHFuxdat7WUE1hfj8A5+XT62Z7qPEcMktyAsU0FCjqV5/x9qcU/54DFoZmjUJ9lpIZikD1v3ksYPgSbbEf/1+nCFc7m22Q/Waw450EtcpvPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oI/bWI1KcrZgUvupwXETaQpu9xc1TeRB+r67mTWVscA=;
 b=FDSW6z7kPFiyLZTUdM6FP7ePuEmutbFczUu9tWALWvvVyrNTIBvLKMx8shT/fejMUW1z6Kt/16ZsooGwwORWPY5hghWyHP+K8aaSiDRUrGOf6kyWxzt2KynqWt5jwVc4XuYYGc+LpkmeDFgwHvSS8uBDQEBN1TaVMLuYDGdLb1s=
Received: from DM5PR1201MB2554.namprd12.prod.outlook.com (2603:10b6:3:ec::14)
 by DM5PR1201MB0026.namprd12.prod.outlook.com (2603:10b6:4:52::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.21; Tue, 25 Feb
 2020 18:20:38 +0000
Received: from DM5PR1201MB2554.namprd12.prod.outlook.com
 ([fe80::c4c:bafd:5833:2b51]) by DM5PR1201MB2554.namprd12.prod.outlook.com
 ([fe80::c4c:bafd:5833:2b51%5]) with mapi id 15.20.2750.021; Tue, 25 Feb 2020
 18:20:38 +0000
From: "Liu, Zhan" <Zhan.Liu@amd.com>
To: 'Alex Deucher' <alexdeucher@gmail.com>, "Wentland, Harry"
 <Harry.Wentland@amd.com>, "Zuo, Jerry" <Jerry.Zuo@amd.com>
Subject: RE: [PATCH 13/15] drm/amdgpu/display: split dp connector registration
 (v3)
Thread-Topic: [PATCH 13/15] drm/amdgpu/display: split dp connector
 registration (v3)
Thread-Index: AQHV3fv+yc3GEvvTGkaXx6Xo3SHHx6gq8YSAgAEcIYCAABFTcIAANQtg
Date: Tue, 25 Feb 2020 18:20:38 +0000
Message-ID: <DM5PR1201MB2554768A51B1A4625E67BB899EED0@DM5PR1201MB2554.namprd12.prod.outlook.com>
References: <20200207211713.3870-1-alexander.deucher@amd.com>
 <22cf2c92-52a0-5e1a-e569-4fe421e38022@amd.com>
 <CADnq5_M9yngJYmhOKiUvpR0H-e5yoVOrqwoim+_Ps63wY3QsRg@mail.gmail.com>
 <DM5PR1201MB2554BBEA6B0C7DECFFE8DD3E9EED0@DM5PR1201MB2554.namprd12.prod.outlook.com>
In-Reply-To: <DM5PR1201MB2554BBEA6B0C7DECFFE8DD3E9EED0@DM5PR1201MB2554.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Zhan.Liu@amd.com; 
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 722439ae-2aba-4c4e-7dcc-08d7ba1f6a41
x-ms-traffictypediagnostic: DM5PR1201MB0026:|DM5PR1201MB0026:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR1201MB00264A834C1744A84669DAF19EED0@DM5PR1201MB0026.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 0324C2C0E2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(136003)(346002)(366004)(39860400002)(199004)(189003)(110136005)(9686003)(54906003)(86362001)(81166006)(8936002)(8676002)(81156014)(2906002)(316002)(186003)(55016002)(7696005)(478600001)(71200400001)(33656002)(6636002)(26005)(64756008)(66446008)(2940100002)(66476007)(6506007)(66946007)(76116006)(53546011)(66556008)(5660300002)(52536014)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB0026;
 H:DM5PR1201MB2554.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bLBeQP6RI0TgrL7mggd6b6bG0yP5NUry/DfjCo+AI7GOCCp70ZhA6PHn209xMyl3NQsd8N5UvohPTSQs83u9AJHvkkgBlzm0HU73quTAkSVBvQsrtzUL72p5KRd2B9EfLEcG2Ll0adz7DAho/UnK2PXo0mDrrGbvioU36In+uye+/ctUl++8jPmHozyGpcTsXsOg15JKcuWX3R5+PsjREO4SayeRFuH86NpWOfeH04lqUHv8Jt/oDaoJHL+9pyAxorU/yFTqfMkJaD5eHlLHaY5J6fjJ5ocqvDIIm7TzZXNjJBUITcHat2pvyireG+vEd9R4br3ERjN5gxa/DCUGkLZJWWdWQkgzkYtkpXhYOU9V8+QAjXW4rfWwHDat9BGQk0rncMmnXYBa1AVUJkkoObLuH2cbKldOgkOlDAEJe1UV+xxhlegF1JxpWQqO87An
x-ms-exchange-antispam-messagedata: wDHQPG1hKmm3r9/n0QN2POCANuOFztYMq5WxPLJa0YnY056/Rg5o71hUg9TbAqH/T/n72vcmmtLiEeghEycMqy4n/eCWS/ymN1f3UdK/QQdWcKAkQzpYiDL6vq/r3wsEmeI4staLaLbL40Iav6zyMQ==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 722439ae-2aba-4c4e-7dcc-08d7ba1f6a41
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2020 18:20:38.1475 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nFSMpRspdW6JQOy8zkjXCBBBDhlwPG8DdlD5RfOVNwbksAdGUq+qJSKNQmLVdWap
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0026
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Broadworth,
 Mark" <Mark.Broadworth@amd.com>,
 'Maling list - DRI developers' <dri-devel@lists.freedesktop.org>,
 'amd-gfx list' <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


> -----Original Message-----
> From: Liu, Zhan
> Sent: 2020/February/25, Tuesday 10:10 AM
> To: Alex Deucher <alexdeucher@gmail.com>; Wentland, Harry
> <Harry.Wentland@amd.com>
> Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>; Maling list - DRI
> developers <dri-devel@lists.freedesktop.org>; Deucher, Alexander
> <Alexander.Deucher@amd.com>; Broadworth, Mark
> <Mark.Broadworth@amd.com>
> Subject: RE: [PATCH 13/15] drm/amdgpu/display: split dp connector
> registration (v3)
> 
> 
> > -----Original Message-----
> > From: Alex Deucher <alexdeucher@gmail.com>
> > Sent: 2020/February/25, Tuesday 9:07 AM
> > To: Wentland, Harry <Harry.Wentland@amd.com>
> > Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>; Maling list - DRI
> > developers <dri-devel@lists.freedesktop.org>; Deucher, Alexander
> > <Alexander.Deucher@amd.com>; Broadworth, Mark
> > <Mark.Broadworth@amd.com>; Liu, Zhan <Zhan.Liu@amd.com>
> > Subject: Re: [PATCH 13/15] drm/amdgpu/display: split dp connector
> > registration (v3)
> >
> > On Mon, Feb 24, 2020 at 4:09 PM Harry Wentland <hwentlan@amd.com>
> > wrote:
> > >
> > > On 2020-02-07 4:17 p.m., Alex Deucher wrote:
> > > > Split into init and register functions to avoid a segfault in some
> > > > configs when the load/unload callbacks are removed.
> > > >
> > >
> > > Looks like MST is completely broken with this change with a NULL
> > > pointer dereference in drm_dp_aux_register.
> > >
> > > > v2:
> > > > - add back accidently dropped has_aux setting
> > > > - set dev in late_register
> > > >
> > > > v3:
> > > > - fix dp cec ordering
> > > >
> > > > Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> > > > ---
> > > >  drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c   | 16
> > ++++++++++++++++
> > > >  drivers/gpu/drm/amd/amdgpu/atombios_dp.c         | 10 ++--------
> > > >  .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c  |  7 ++++++-
> > > >  3 files changed, 24 insertions(+), 9 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> > > > b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> > > > index ec1501e3a63a..f355d9a752d2 100644
> > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> > > > @@ -1461,6 +1461,20 @@ static enum drm_mode_status
> > amdgpu_connector_dp_mode_valid(struct drm_connector
> > > >       return MODE_OK;
> > > >  }
> > > >
> > > > +static int
> > > > +amdgpu_connector_late_register(struct drm_connector *connector) {
> > > > +     struct amdgpu_connector *amdgpu_connector =
> > to_amdgpu_connector(connector);
> > > > +     int r = 0;
> > > > +
> > > > +     if (amdgpu_connector->ddc_bus->has_aux) {
> > > > +             amdgpu_connector->ddc_bus->aux.dev =
> > > > + amdgpu_connector-
> > >base.kdev;
> > > > +             r = drm_dp_aux_register(&amdgpu_connector->ddc_bus->aux);
> > > > +     }
> > > > +
> > > > +     return r;
> > > > +}
> > > > +
> > > >  static const struct drm_connector_helper_funcs
> > amdgpu_connector_dp_helper_funcs = {
> > > >       .get_modes = amdgpu_connector_dp_get_modes,
> > > >       .mode_valid = amdgpu_connector_dp_mode_valid, @@ -1475,6
> > > > +1489,7 @@ static const struct drm_connector_funcs
> > amdgpu_connector_dp_funcs = {
> > > >       .early_unregister = amdgpu_connector_unregister,
> > > >       .destroy = amdgpu_connector_destroy,
> > > >       .force = amdgpu_connector_dvi_force,
> > > > +     .late_register = amdgpu_connector_late_register,
> > > >  };
> > > >
> > > >  static const struct drm_connector_funcs
> > > > amdgpu_connector_edp_funcs = { @@ -1485,6 +1500,7 @@ static
> const
> > > > struct drm_connector_funcs
> > amdgpu_connector_edp_funcs = {
> > > >       .early_unregister = amdgpu_connector_unregister,
> > > >       .destroy = amdgpu_connector_destroy,
> > > >       .force = amdgpu_connector_dvi_force,
> > > > +     .late_register = amdgpu_connector_late_register,
> > > >  };
> > > >
> > > >  void
> > > > diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
> > > > b/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
> > > > index ea702a64f807..9b74cfdba7b8 100644
> > > > --- a/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
> > > > +++ b/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
> > > > @@ -186,16 +186,10 @@ amdgpu_atombios_dp_aux_transfer(struct
> > > > drm_dp_aux *aux, struct drm_dp_aux_msg *m
> > > >
> > > >  void amdgpu_atombios_dp_aux_init(struct amdgpu_connector
> > > > *amdgpu_connector)  {
> > > > -     int ret;
> > > > -
> > > >       amdgpu_connector->ddc_bus->rec.hpd = amdgpu_connector-
> > >hpd.hpd;
> > > > -     amdgpu_connector->ddc_bus->aux.dev = amdgpu_connector-
> > >base.kdev;
> > > >       amdgpu_connector->ddc_bus->aux.transfer =
> > amdgpu_atombios_dp_aux_transfer;
> > > > -     ret = drm_dp_aux_register(&amdgpu_connector->ddc_bus->aux);
> > > > -     if (!ret)
> > > > -             amdgpu_connector->ddc_bus->has_aux = true;
> > > > -
> > > > -     WARN(ret, "drm_dp_aux_register_i2c_bus() failed with error %d\n",
> > ret);
> > > > +     drm_dp_aux_init(&amdgpu_connector->ddc_bus->aux);
> > > > +     amdgpu_connector->ddc_bus->has_aux = true;
> > > >  }
> > > >
> > > >  /***** general DP utility functions *****/ diff --git
> > > > a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > > > b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > > > index 3959c942c88b..d5b9e72f2649 100644
> > > > ---
> > a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > > > +++
> > b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > > > @@ -155,6 +155,11 @@
> > amdgpu_dm_mst_connector_late_register(struct drm_connector
> > *connector)
> > > >       struct amdgpu_dm_connector *amdgpu_dm_connector =
> > > >               to_amdgpu_dm_connector(connector);
> > > >       struct drm_dp_mst_port *port = amdgpu_dm_connector->port;
> > > > +     int r;
> > > > +
> > > > +     r =
> > > > + drm_dp_aux_register(&amdgpu_dm_connector->dm_dp_aux.aux);
> > >
> > > This calls drm_dp_aux_register_devnode which is also called later in
> > > drm_dp_mst_connector_late_register. Wonder if that's a problem.
> >
> > Does this patch help?  I'm not too familiar with the MST code and I
> > don't have an MST monitor.
> 
> I have an MST monitor and I can give it a spin. I'll get back to you later.

+ Jerry who is following up on this issue

Thank you Alex for your patch. Unfortunately, it doesn't solve the issue.

Jerry is following up on this ticket, and I've added him to this email thread.

Zhan

> 
> Zhan
> 
> >
> > Alex
> >
> >
> > >
> > > Harry
> > >
> > > > +     if (r)
> > > > +             return r;
> > > >
> > > >  #if defined(CONFIG_DEBUG_FS)
> > > >       connector_debugfs_init(amdgpu_dm_connector);
> > > > @@ -484,7 +489,7 @@ void
> amdgpu_dm_initialize_dp_connector(struct
> > amdgpu_display_manager *dm,
> > > >       aconnector->dm_dp_aux.aux.transfer = dm_dp_aux_transfer;
> > > >       aconnector->dm_dp_aux.ddc_service =
> > > > aconnector->dc_link->ddc;
> > > >
> > > > -     drm_dp_aux_register(&aconnector->dm_dp_aux.aux);
> > > > +     drm_dp_aux_init(&aconnector->dm_dp_aux.aux);
> > > >       drm_dp_cec_register_connector(&aconnector->dm_dp_aux.aux,
> > > >                                     &aconnector->base);
> > > >
> > > >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
