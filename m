Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A3B16E9AA
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 16:10:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E15976EB1F;
	Tue, 25 Feb 2020 15:10:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750071.outbound.protection.outlook.com [40.107.75.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43CDE6EB1D;
 Tue, 25 Feb 2020 15:10:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NdGcDaxcEyChEllgYRHQ1PHLf3Krjln3siglA4awnotF+DIQxHkLSpU9bVEBt57KAm2ULSZp4PtiFPL2Bh0Slz9MmeXX202LaTDlpEo1lHmJYDL3MUaWPK1wKc2zdoTEl01hMZjZ125ECir6ILJNTlQMPv/yEVKzXFeFe1SeXZRuRB1TNK6+LZI39tV0prBVHKnldPKxFT2bPWudpYjiAJ/4dX1PGoR/SMhqLhgWuhcALs8OuLeKIa2i+SXyEYf6naMx2CMo2LtnIF6F3XB4jMLFbRklKdYZVqr3lg1UuSLu9sBtW0o7YwrAMyyD90Vp0Tozbq3hOkUfDrInHRWDJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=arXVYQc9/vfCe0eJChm3kAEPP6jh6cEvOHbTV/lbxVk=;
 b=N/YyGFVEF5HeOFxhQTQguuKzY5GUnx9Vccv6ATyuNwrTv8Jt0rB/nFWwnnf+MNDY58zC1lszkvTPd8VvV7ProiXz/GkhbEYpMiKJ+h8SLDcHZDKj2icWCmRK41WZuyo6f7DDtEeDpzhxTKcl9B3lkeX72U0Wge0bi54PjOOxAjvB6Ai+yMzR8ZAiJGCEyFz7R01vFzXuXmZEt68Asp6Ho2Qk9VCfmwwb1ymKs21LBVf8+kTrO2wPFB0UnUisFDBkt909dPZThCyOQBVBr+4auOqdcn5wlmyX5b7oQgcaLWxmvpwwliacDJDwCdB305bzw032/KdOLCs36B4kcGrNew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=arXVYQc9/vfCe0eJChm3kAEPP6jh6cEvOHbTV/lbxVk=;
 b=GgbwM/5yGTToDmb9ZPbusxt/7+DZIyNTo1Bhhor4t3a8Ud9ERSIf+vKeDIfI1aiDcj19DmIY1OuKRBDMT3WBcx+d5DS/JkU06ua78mWcX2UE0U/t0KLwt6tR1oZlvJyaaipEmvvFrM4n9W7+m31CDjtmOZHuxag2xvMYZXRPstE=
Received: from DM5PR1201MB2554.namprd12.prod.outlook.com (2603:10b6:3:ec::14)
 by DM5PR1201MB2504.namprd12.prod.outlook.com (2603:10b6:3:e3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.21; Tue, 25 Feb
 2020 15:10:22 +0000
Received: from DM5PR1201MB2554.namprd12.prod.outlook.com
 ([fe80::c4c:bafd:5833:2b51]) by DM5PR1201MB2554.namprd12.prod.outlook.com
 ([fe80::c4c:bafd:5833:2b51%5]) with mapi id 15.20.2750.021; Tue, 25 Feb 2020
 15:10:21 +0000
From: "Liu, Zhan" <Zhan.Liu@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "Wentland, Harry"
 <Harry.Wentland@amd.com>
Subject: RE: [PATCH 13/15] drm/amdgpu/display: split dp connector registration
 (v3)
Thread-Topic: [PATCH 13/15] drm/amdgpu/display: split dp connector
 registration (v3)
Thread-Index: AQHV3fv+yc3GEvvTGkaXx6Xo3SHHx6gq8YSAgAEcIYCAABFTcA==
Date: Tue, 25 Feb 2020 15:10:21 +0000
Message-ID: <DM5PR1201MB2554BBEA6B0C7DECFFE8DD3E9EED0@DM5PR1201MB2554.namprd12.prod.outlook.com>
References: <20200207211713.3870-1-alexander.deucher@amd.com>
 <22cf2c92-52a0-5e1a-e569-4fe421e38022@amd.com>
 <CADnq5_M9yngJYmhOKiUvpR0H-e5yoVOrqwoim+_Ps63wY3QsRg@mail.gmail.com>
In-Reply-To: <CADnq5_M9yngJYmhOKiUvpR0H-e5yoVOrqwoim+_Ps63wY3QsRg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Zhan.Liu@amd.com; 
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2d81192c-4644-497f-a760-08d7ba04d570
x-ms-traffictypediagnostic: DM5PR1201MB2504:|DM5PR1201MB2504:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR1201MB25043944EA53F020774043A39EED0@DM5PR1201MB2504.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2201;
x-forefront-prvs: 0324C2C0E2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(39860400002)(346002)(396003)(136003)(189003)(199004)(8936002)(5660300002)(81166006)(316002)(54906003)(7696005)(81156014)(2906002)(110136005)(86362001)(71200400001)(52536014)(8676002)(64756008)(55016002)(9686003)(53546011)(6636002)(4326008)(186003)(66446008)(66556008)(66946007)(66476007)(76116006)(478600001)(33656002)(6506007)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB2504;
 H:DM5PR1201MB2554.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nEsafP3iZ9E4NU1CzW4ogOQV2lGZwq0sl4lXmIVNe+XdkDy3TjDs/kDm7zqcDD9HUqRiDKxonWnSSNbqw23heAz13fflTEM6Sx2Vi94z3MXKWnhLeueSOnWMkwCtV3a1p41agYikzkDj9XVYoIe4MkjDZuy5OAn07IctXFbwKM9m0vxv1JyZGQwu+iIN4ZionlnK+jijOBMRoh82txs17NjzT1KY3jq2n/pzjsvzT9U2cRVSpgDfjetLJbUO4xXJXDI3UzD9ViuRDfGbDANXOXPXShTTvaaC5Ief3oF13zrMCukOXMKizO5qPGZUVTa3O67mKGhR0QdvoFUterbTxgJH33lrH+rhd4GEDwzQTqaTiWfCBWsMS31hgZimgSu2Is/bAIPMijGTZtgJQNBYHmDTGrgmiWmqiOs3xpdxBZVVaiRJ1E32WWF0n8PEjVUx
x-ms-exchange-antispam-messagedata: 0gmXHsLCq+T1CObNrLj1MpqiTTDqvYpQ8nP0xY1eBeRm4onp8+7lMvh70IM1dGp7JOInk+VP1w/HIBf6aYaD7oYQTmAAoNa+Hxl+u25g7hPFtBvVNjgqVbfqxlY7UohveqKFslYwsWOxDKDtgoPEqw==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d81192c-4644-497f-a760-08d7ba04d570
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2020 15:10:21.7680 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d7cXrgvpMIGIYRB90lWDH3JX85owp3RtOp0IQ/RhLBt1AJLRV4iggjlnzGlERG5i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB2504
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
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


> -----Original Message-----
> From: Alex Deucher <alexdeucher@gmail.com>
> Sent: 2020/February/25, Tuesday 9:07 AM
> To: Wentland, Harry <Harry.Wentland@amd.com>
> Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>; Maling list - DRI
> developers <dri-devel@lists.freedesktop.org>; Deucher, Alexander
> <Alexander.Deucher@amd.com>; Broadworth, Mark
> <Mark.Broadworth@amd.com>; Liu, Zhan <Zhan.Liu@amd.com>
> Subject: Re: [PATCH 13/15] drm/amdgpu/display: split dp connector
> registration (v3)
> 
> On Mon, Feb 24, 2020 at 4:09 PM Harry Wentland <hwentlan@amd.com>
> wrote:
> >
> > On 2020-02-07 4:17 p.m., Alex Deucher wrote:
> > > Split into init and register functions to avoid a segfault in some
> > > configs when the load/unload callbacks are removed.
> > >
> >
> > Looks like MST is completely broken with this change with a NULL
> > pointer dereference in drm_dp_aux_register.
> >
> > > v2:
> > > - add back accidently dropped has_aux setting
> > > - set dev in late_register
> > >
> > > v3:
> > > - fix dp cec ordering
> > >
> > > Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> > > ---
> > >  drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c   | 16
> ++++++++++++++++
> > >  drivers/gpu/drm/amd/amdgpu/atombios_dp.c         | 10 ++--------
> > >  .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c  |  7 ++++++-
> > >  3 files changed, 24 insertions(+), 9 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> > > b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> > > index ec1501e3a63a..f355d9a752d2 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> > > @@ -1461,6 +1461,20 @@ static enum drm_mode_status
> amdgpu_connector_dp_mode_valid(struct drm_connector
> > >       return MODE_OK;
> > >  }
> > >
> > > +static int
> > > +amdgpu_connector_late_register(struct drm_connector *connector) {
> > > +     struct amdgpu_connector *amdgpu_connector =
> to_amdgpu_connector(connector);
> > > +     int r = 0;
> > > +
> > > +     if (amdgpu_connector->ddc_bus->has_aux) {
> > > +             amdgpu_connector->ddc_bus->aux.dev = amdgpu_connector-
> >base.kdev;
> > > +             r = drm_dp_aux_register(&amdgpu_connector->ddc_bus->aux);
> > > +     }
> > > +
> > > +     return r;
> > > +}
> > > +
> > >  static const struct drm_connector_helper_funcs
> amdgpu_connector_dp_helper_funcs = {
> > >       .get_modes = amdgpu_connector_dp_get_modes,
> > >       .mode_valid = amdgpu_connector_dp_mode_valid, @@ -1475,6
> > > +1489,7 @@ static const struct drm_connector_funcs
> amdgpu_connector_dp_funcs = {
> > >       .early_unregister = amdgpu_connector_unregister,
> > >       .destroy = amdgpu_connector_destroy,
> > >       .force = amdgpu_connector_dvi_force,
> > > +     .late_register = amdgpu_connector_late_register,
> > >  };
> > >
> > >  static const struct drm_connector_funcs amdgpu_connector_edp_funcs
> > > = { @@ -1485,6 +1500,7 @@ static const struct drm_connector_funcs
> amdgpu_connector_edp_funcs = {
> > >       .early_unregister = amdgpu_connector_unregister,
> > >       .destroy = amdgpu_connector_destroy,
> > >       .force = amdgpu_connector_dvi_force,
> > > +     .late_register = amdgpu_connector_late_register,
> > >  };
> > >
> > >  void
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
> > > b/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
> > > index ea702a64f807..9b74cfdba7b8 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
> > > @@ -186,16 +186,10 @@ amdgpu_atombios_dp_aux_transfer(struct
> > > drm_dp_aux *aux, struct drm_dp_aux_msg *m
> > >
> > >  void amdgpu_atombios_dp_aux_init(struct amdgpu_connector
> > > *amdgpu_connector)  {
> > > -     int ret;
> > > -
> > >       amdgpu_connector->ddc_bus->rec.hpd = amdgpu_connector-
> >hpd.hpd;
> > > -     amdgpu_connector->ddc_bus->aux.dev = amdgpu_connector-
> >base.kdev;
> > >       amdgpu_connector->ddc_bus->aux.transfer =
> amdgpu_atombios_dp_aux_transfer;
> > > -     ret = drm_dp_aux_register(&amdgpu_connector->ddc_bus->aux);
> > > -     if (!ret)
> > > -             amdgpu_connector->ddc_bus->has_aux = true;
> > > -
> > > -     WARN(ret, "drm_dp_aux_register_i2c_bus() failed with error %d\n",
> ret);
> > > +     drm_dp_aux_init(&amdgpu_connector->ddc_bus->aux);
> > > +     amdgpu_connector->ddc_bus->has_aux = true;
> > >  }
> > >
> > >  /***** general DP utility functions *****/ diff --git
> > > a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > > b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > > index 3959c942c88b..d5b9e72f2649 100644
> > > ---
> a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > > +++
> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > > @@ -155,6 +155,11 @@
> amdgpu_dm_mst_connector_late_register(struct drm_connector
> *connector)
> > >       struct amdgpu_dm_connector *amdgpu_dm_connector =
> > >               to_amdgpu_dm_connector(connector);
> > >       struct drm_dp_mst_port *port = amdgpu_dm_connector->port;
> > > +     int r;
> > > +
> > > +     r = drm_dp_aux_register(&amdgpu_dm_connector->dm_dp_aux.aux);
> >
> > This calls drm_dp_aux_register_devnode which is also called later in
> > drm_dp_mst_connector_late_register. Wonder if that's a problem.
> 
> Does this patch help?  I'm not too familiar with the MST code and I don't
> have an MST monitor.

I have an MST monitor and I can give it a spin. I'll get back to you later.

Zhan

> 
> Alex
> 
> 
> >
> > Harry
> >
> > > +     if (r)
> > > +             return r;
> > >
> > >  #if defined(CONFIG_DEBUG_FS)
> > >       connector_debugfs_init(amdgpu_dm_connector);
> > > @@ -484,7 +489,7 @@ void amdgpu_dm_initialize_dp_connector(struct
> amdgpu_display_manager *dm,
> > >       aconnector->dm_dp_aux.aux.transfer = dm_dp_aux_transfer;
> > >       aconnector->dm_dp_aux.ddc_service = aconnector->dc_link->ddc;
> > >
> > > -     drm_dp_aux_register(&aconnector->dm_dp_aux.aux);
> > > +     drm_dp_aux_init(&aconnector->dm_dp_aux.aux);
> > >       drm_dp_cec_register_connector(&aconnector->dm_dp_aux.aux,
> > >                                     &aconnector->base);
> > >
> > >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
