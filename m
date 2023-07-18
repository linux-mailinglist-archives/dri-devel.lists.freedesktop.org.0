Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 404127572AE
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 06:03:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56EE310E169;
	Tue, 18 Jul 2023 04:03:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1090510E05B;
 Tue, 18 Jul 2023 04:03:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nasikL6OHQaI8PkMqOWv/MbiyixEL0eeWeBBmEMJQiGdSMnebbV4bkmUlPnLRLSPPZfVH/iLs7aJhj7bKPbIX5IyNufBtJAdeQLdht5U9Dg4Ul5Y6dJ2s2UhxHGiRTB7op70JbD0kV8gyFC8kkzNKgcQ3qAobhEovMi5bK0MLr9JQqx5C+oKK/MTSxUvYGB1OJwCb6LNsdTPYSOthZr0ZW/rktT515av5EUZJzhHnvYPtwWqeyrY199Q6uhHjOXemYMwhmlIkM7hZl+ZJCqPPn8ep1ddvzAdBdwiWWGMznyftf4fc5QldQK1vt29/FbR8gmDWFv8l0yMyx5ZAttJQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sbEhJJjVqJ5gdOFLmtFVS+qakoWCRBZZbzW3OYo5ATc=;
 b=Q9733905F2sV58UI/Q0oyY86LbFIa4tR0cQXvvfwqxa2fNzk+YIfTunedFQuTz9Uut6PLQhqhppJECLvNjc6GIGEWzoEEP2Ip48eO+WQkQ/uKj2QpViqDIIcjCy4dFNSpOTrtCb6vDIssArXkUwLjxdT+3Ml8BG3HFEvba6mTZ1wQN1piLNsZ7BhXxwogn9PAp6LnByleJzAThHIClG8RAH7rhPAbM4shx+BEvJuo1+OUHYuBMfbileHOqOdw2vub2oIZn6jnWxqEdCcNgpEXrIfgIraSdC4Eq7YW9/mXyvGYsMd/RvbC+OjKW8iBCut8AutF60XBkvEjuJoi/2y5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sbEhJJjVqJ5gdOFLmtFVS+qakoWCRBZZbzW3OYo5ATc=;
 b=ImQ+XRoQrazgfBdNf/479BjyaVc5hFlUDc4rPDFfztz1wEgUllgmn8SO4sOEE0f6jfmMggZN0D/NYJaOP7a8SlwBpWrkKRhyHdBS0LVNzjUNE2amxcpJq1dYOzFYDP9S5QI0Ygyblp0Jm0q08T34kad51uCg6pCxFkCPcsN1X+I=
Received: from DM6PR12MB2619.namprd12.prod.outlook.com (2603:10b6:5:45::18) by
 SA0PR12MB4526.namprd12.prod.outlook.com (2603:10b6:806:98::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.31; Tue, 18 Jul 2023 04:02:57 +0000
Received: from DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::93dc:de92:88e7:b765]) by DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::93dc:de92:88e7:b765%4]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 04:02:56 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Yang, WenYou" <WenYou.Yang@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Limonciello, Mario"
 <Mario.Limonciello@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>
Subject: RE: [PATCH v2] drm/amd/pm: Vangogh: Add new gpu_metrics_v2_4 to
 acquire gpu_metrics
Thread-Topic: [PATCH v2] drm/amd/pm: Vangogh: Add new gpu_metrics_v2_4 to
 acquire gpu_metrics
Thread-Index: AQHZpAoXdivPiZMyvUWUnjwNx81koa+3AZwAgAgO/nA=
Date: Tue, 18 Jul 2023 04:02:56 +0000
Message-ID: <DM6PR12MB2619854DEA5DF5C9F7A11499E438A@DM6PR12MB2619.namprd12.prod.outlook.com>
References: <20230621063139.583787-1-WenYou.Yang@amd.com>
 <DM6PR12MB35319E01AE25E8388F3CFBFEFD37A@DM6PR12MB3531.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB35319E01AE25E8388F3CFBFEFD37A@DM6PR12MB3531.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=1f0e7ae4-e076-4b64-85da-ad97d543303e;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-07-13T00:55:07Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB2619:EE_|SA0PR12MB4526:EE_
x-ms-office365-filtering-correlation-id: 27143a9c-28b4-4fc9-d92c-08db8743de5f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bvsRFid9bSAoOTfHIpngjAD7+VcPjlhS1YSyr38CtI3ceGolZDYqGrT8tiwZrb8RVMYB/U5wjTZJe2LqwHXj/6Mi6t2zjx2Z8nZ46firUIooWJhnab7ItEyUQhweTJaErNwOWtSpWYdNsD7oOpcRRSLBJ9HO8qIXnTnd30NLulO2HSXaOy22in+//jzHCuRbc08A9Hd0cAhVToxqSFqep1Nk+nGynJfx847lq5l+PNhYyYK+hjC7KOkiT8nTEibIcQ8h54CizQiMlaQ0C48wOi3cqWtFeqsaebJXFG3bPjV2jImQXH/qO9yd7Ir9r2zYJPXJtbPpUouDzI5aSBnrJfZoMps/wd0jj6Q8y4kDTb2LikKYrkqW8cuCTlP97/IwU/UxsrzsgJkIFfMdCePxgLGl5GQeL58VzdYhh+aVCKOqOgmwW0/YeIwmyQ7vId8beiprjbcj6+1j20mWVH8NBkj/Nm6gv48YKL0QuGvIA+grY5nE33ln/jFLs/xgtbaEXbew8pWDmmuXW20PiAc8nE81REoorpe/pXHTzW3yB7ay5Vi7/Gft/noYjqcd0wf3gjK5EvKwvRzXE//G5nQmO7uTtIzOcrSEIhXPg350/ITP41sMaVwLA+OEaGghw7Gouy2wrpMLoXVI711ypcxMBA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2619.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(39860400002)(346002)(366004)(136003)(396003)(451199021)(38070700005)(71200400001)(478600001)(921005)(186003)(83380400001)(26005)(6506007)(53546011)(55016003)(9686003)(33656002)(6636002)(41300700001)(4326008)(8676002)(8936002)(30864003)(2906002)(316002)(86362001)(7696005)(64756008)(66946007)(110136005)(38100700002)(66446008)(122000001)(66556008)(5660300002)(54906003)(52536014)(76116006)(66476007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gkvRWmBiCJQJnt3gZ5XF9mpbk3Ady6cZyVBrA5t1lU9RKkE5wHiOrOUNu0Z/?=
 =?us-ascii?Q?HEToI0VpGLfWme9e9NI3lU52l0PF0vDwkmuB/HO3CTtEkIlKuFVYqztjDrN+?=
 =?us-ascii?Q?Ysg8XHqlLA0f08td9+qD1ZXUx+6JNPDhsjeEHZjAuA6OCJ79N8Q38O3D1rZZ?=
 =?us-ascii?Q?ZnOXAKWslelH3RQvtOUnezORtzOHk9ub9lEuKzlGEnh/ZxnszgMD9ny9dQlz?=
 =?us-ascii?Q?78CvmHquJ7nMRkZGGAcA1HtNl0fQpHMbjeTJuVkhOgm3NUiWGTiQzqy+gW9p?=
 =?us-ascii?Q?aEQ6ikSazSlNJMeuW5XsTrvs6+kOv5Vbcl54TD5SQFAsn+IXQd2TXbYL/qGo?=
 =?us-ascii?Q?bxFP8akbzWK/fy0gcA38KlyR1n2y9VmPa2Cg1+X0FhGQxZ1+ddPOKQRE8fAX?=
 =?us-ascii?Q?t/O8UjxQflQZEpvHJzbs0MY4XtgVhBfry0APoCWLPM1N4BhD3852sqOYkfmF?=
 =?us-ascii?Q?MVKUYEtaDUg6adRwFt873V3r5dJU6MS93ncVQpl4dRKm9cEFD0QYXFjyxlYQ?=
 =?us-ascii?Q?F10Dqmyg/OIrYbbWyQnZ1iamJLF2fzUoAauYcYxt6NzUa3RrbSASiPEHTF2s?=
 =?us-ascii?Q?zoND1yQTKiGV+fI6nAWi8HPp/vXBC17CG014z4JJVuCNccKks4VOB8Zda6nK?=
 =?us-ascii?Q?trcWtagyKw6JVmxdoP4KEnxcY5G4chw/twIVoP2wDIwzfCU6K3Dugolob8E9?=
 =?us-ascii?Q?N+YSFlyiO156dw2Zvs7qmDgnD2VFYG4HHwikI5n15bvDO/rfYCePB/9nOCd7?=
 =?us-ascii?Q?GQGdFJJ2Oru7wqusjti7oxN61FbH2fuKO1mLf0gdwhiQ5XXXSmZyVX4YMzdN?=
 =?us-ascii?Q?r/CqjD3hYPeo+K9K4xtAmGLWqKnuTCC6Fuyk9nIpGf2pnBRBTV89hRIfIcSo?=
 =?us-ascii?Q?UI8odR8X7bvqT0SHgwKGBqG/DybOUofJmA0pMZum5z6TeUO6K1WD/EdKLFx5?=
 =?us-ascii?Q?EcGh1vGhEzOtsOE4OxvIodA1YhyeqbZlSchosw0NUBRMsXMrCZn3IpcZIoTM?=
 =?us-ascii?Q?J5aigY6Nu/0LiaEi/4GtmDYlZY4a/ReEl/QYWDQNeMbQrrcnaki9rc27//km?=
 =?us-ascii?Q?BSeaxZHANWLibEqNr0xRxs01AHToY7TkOBLzV0WeIxjYAoyT524oE0i+fr/k?=
 =?us-ascii?Q?SK9Ku6zjIBobC1mW80LgtFyZvzdR4cyM7nX9Ozf9hytOSMD/+GiQng3z1QvI?=
 =?us-ascii?Q?HM6a+R4B8z1rF4L9aC23xozirL69eumiRY8A+xlOjZfvocc+4MG0+NozSrqg?=
 =?us-ascii?Q?jgjG37zW8Kg+ckG13aeuL30pieIAH1P9ZKdvaFDHXgUkeMw7f+OGeUMWLJ/B?=
 =?us-ascii?Q?BeARBu7hWKUbqg/CmpSXnz/6POyJmIIq5cRxPwrXFT228rDjHsLexoo3EU5Z?=
 =?us-ascii?Q?ahGutQOC3TLP4hMSndMstjSbrJWFQCdJqtu4TQFquQRuYzj2nkpsVd64xkzJ?=
 =?us-ascii?Q?9a5EbjqVSZnEqQFabDcGztmjJF3+ajMCJVE6RZujFfSBQbPT3GrBoiLhzhcz?=
 =?us-ascii?Q?EwCMJOsKdq1NyCQPrApy9aDMawsJxo6jNDECLgsgOzENtNYgloFb0OUgGC4E?=
 =?us-ascii?Q?KsDyWO1R72ajrnYLkSQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2619.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27143a9c-28b4-4fc9-d92c-08db8743de5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2023 04:02:56.6354 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 75uwMtuD/tCikS7iPIJ/H/TYtUU+3DPViTz2A0HXrLFdtzt5ribKVgFa9i1z0oUb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4526
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Yuan,
 Perry" <Perry.Yuan@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Liang,
 Richard qi" <Richardqi.Liang@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - General]

Hi Wenyou,

I think you already got the greenlight(RB from Mario and ACK from me) to la=
nd the change.
Go ahead please.

Evan
> -----Original Message-----
> From: Yang, WenYou <WenYou.Yang@amd.com>
> Sent: Thursday, July 13, 2023 8:56 AM
> To: Yang, WenYou <WenYou.Yang@amd.com>; Deucher, Alexander
> <Alexander.Deucher@amd.com>; Limonciello, Mario
> <Mario.Limonciello@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; Quan,
> Evan <Evan.Quan@amd.com>
> Cc: Yuan, Perry <Perry.Yuan@amd.com>; Liang, Richard qi
> <Richardqi.Liang@amd.com>; amd-gfx@lists.freedesktop.org; dri-
> devel@lists.freedesktop.org; linux-kernel@vger.kernel.org
> Subject: RE: [PATCH v2] drm/amd/pm: Vangogh: Add new gpu_metrics_v2_4
> to acquire gpu_metrics
>
> [AMD Official Use Only - General]
>
> Any comments? Any advice?
>
> Best Regards,
> Wenyou
>
> > -----Original Message-----
> > From: Wenyou Yang <WenYou.Yang@amd.com>
> > Sent: Wednesday, June 21, 2023 2:32 PM
> > To: Deucher, Alexander <Alexander.Deucher@amd.com>; Limonciello, Mario
> > <Mario.Limonciello@amd.com>; Koenig, Christian
> > <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; Quan,
> > Evan <Evan.Quan@amd.com>
> > Cc: Yuan, Perry <Perry.Yuan@amd.com>; Liang, Richard qi
> > <Richardqi.Liang@amd.com>; amd-gfx@lists.freedesktop.org; dri-
> > devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; Yang,
> > WenYou <WenYou.Yang@amd.com>
> > Subject: [PATCH v2] drm/amd/pm: Vangogh: Add new gpu_metrics_v2_4 to
> > acquire gpu_metrics
> >
> > To acquire the voltage and current info from gpu_metrics interface,
> > but
> > gpu_metrics_v2_3 doesn't contain them, and to be backward compatible,
> > add new gpu_metrics_v2_4 structure.
> >
> > Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> > Acked-by: Evan Quan <evan.quan@amd.com>
> > Signed-off-by: Wenyou Yang <WenYou.Yang@amd.com>
> > ---
> >  .../gpu/drm/amd/include/kgd_pp_interface.h    |  69 +++++++++++
> >  .../gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c  | 109
> ++++++++++++++++-
> > -
> >  drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c        |   3 +
> >  3 files changed, 172 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/include/kgd_pp_interface.h
> > b/drivers/gpu/drm/amd/include/kgd_pp_interface.h
> > index 9f542f6e19ed..90989405eddc 100644
> > --- a/drivers/gpu/drm/amd/include/kgd_pp_interface.h
> > +++ b/drivers/gpu/drm/amd/include/kgd_pp_interface.h
> > @@ -892,4 +892,73 @@ struct gpu_metrics_v2_3 {
> >       uint16_t                        average_temperature_core[8]; //
> > average CPU core temperature on APUs
> >       uint16_t                        average_temperature_l3[2];
> >  };
> > +
> > +struct gpu_metrics_v2_4 {
> > +     struct metrics_table_header     common_header;
> > +
> > +     /* Temperature (unit: centi-Celsius) */
> > +     uint16_t                        temperature_gfx;
> > +     uint16_t                        temperature_soc;
> > +     uint16_t                        temperature_core[8];
> > +     uint16_t                        temperature_l3[2];
> > +
> > +     /* Utilization (unit: centi) */
> > +     uint16_t                        average_gfx_activity;
> > +     uint16_t                        average_mm_activity;
> > +
> > +     /* Driver attached timestamp (in ns) */
> > +     uint64_t                        system_clock_counter;
> > +
> > +     /* Power/Energy (unit: mW) */
> > +     uint16_t                        average_socket_power;
> > +     uint16_t                        average_cpu_power;
> > +     uint16_t                        average_soc_power;
> > +     uint16_t                        average_gfx_power;
> > +     uint16_t                        average_core_power[8];
> > +
> > +     /* Average clocks (unit: MHz) */
> > +     uint16_t                        average_gfxclk_frequency;
> > +     uint16_t                        average_socclk_frequency;
> > +     uint16_t                        average_uclk_frequency;
> > +     uint16_t                        average_fclk_frequency;
> > +     uint16_t                        average_vclk_frequency;
> > +     uint16_t                        average_dclk_frequency;
> > +
> > +     /* Current clocks (unit: MHz) */
> > +     uint16_t                        current_gfxclk;
> > +     uint16_t                        current_socclk;
> > +     uint16_t                        current_uclk;
> > +     uint16_t                        current_fclk;
> > +     uint16_t                        current_vclk;
> > +     uint16_t                        current_dclk;
> > +     uint16_t                        current_coreclk[8];
> > +     uint16_t                        current_l3clk[2];
> > +
> > +     /* Throttle status (ASIC dependent) */
> > +     uint32_t                        throttle_status;
> > +
> > +     /* Fans */
> > +     uint16_t                        fan_pwm;
> > +
> > +     uint16_t                        padding[3];
> > +
> > +     /* Throttle status (ASIC independent) */
> > +     uint64_t                        indep_throttle_status;
> > +
> > +     /* Average Temperature (unit: centi-Celsius) */
> > +     uint16_t                        average_temperature_gfx;
> > +     uint16_t                        average_temperature_soc;
> > +     uint16_t                        average_temperature_core[8];
> > +     uint16_t                        average_temperature_l3[2];
> > +
> > +     /* Power/Voltage (unit: mV) */
> > +     uint16_t                        average_cpu_voltage;
> > +     uint16_t                        average_soc_voltage;
> > +     uint16_t                        average_gfx_voltage;
> > +
> > +     /* Power/Current (unit: mA) */
> > +     uint16_t                        average_cpu_current;
> > +     uint16_t                        average_soc_current;
> > +     uint16_t                        average_gfx_current;
> > +};
> >  #endif
> > diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
> > b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
> > index 067b4e0b026c..185d0b50ee8e 100644
> > --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
> > +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
> > @@ -1854,6 +1854,86 @@ static ssize_t
> > vangogh_get_gpu_metrics_v2_3(struct
> > smu_context *smu,
> >       return sizeof(struct gpu_metrics_v2_3);  }
> >
> > +static ssize_t vangogh_get_gpu_metrics_v2_4(struct smu_context *smu,
> > +                                         void **table) {
> > +     SmuMetrics_t metrics;
> > +     struct smu_table_context *smu_table =3D &smu->smu_table;
> > +     struct gpu_metrics_v2_4 *gpu_metrics =3D
> > +                             (struct gpu_metrics_v2_4 *)smu_table-
> > >gpu_metrics_table;
> > +     int ret =3D 0;
> > +
> > +     ret =3D smu_cmn_get_metrics_table(smu, &metrics, true);
> > +     if (ret)
> > +             return ret;
> > +
> > +     smu_cmn_init_soft_gpu_metrics(gpu_metrics, 2, 4);
> > +
> > +     gpu_metrics->temperature_gfx =3D metrics.Current.GfxTemperature;
> > +     gpu_metrics->temperature_soc =3D metrics.Current.SocTemperature;
> > +     memcpy(&gpu_metrics->temperature_core[0],
> > +            &metrics.Current.CoreTemperature[0],
> > +            sizeof(uint16_t) * 4);
> > +     gpu_metrics->temperature_l3[0] =3D
> > + metrics.Current.L3Temperature[0];
> > +
> > +     gpu_metrics->average_temperature_gfx =3D
> > metrics.Average.GfxTemperature;
> > +     gpu_metrics->average_temperature_soc =3D
> > metrics.Average.SocTemperature;
> > +     memcpy(&gpu_metrics->average_temperature_core[0],
> > +            &metrics.Average.CoreTemperature[0],
> > +            sizeof(uint16_t) * 4);
> > +     gpu_metrics->average_temperature_l3[0] =3D
> > +metrics.Average.L3Temperature[0];
> > +
> > +     gpu_metrics->average_gfx_activity =3D metrics.Current.GfxActivity=
;
> > +     gpu_metrics->average_mm_activity =3D metrics.Current.UvdActivity;
> > +
> > +     gpu_metrics->average_socket_power =3D
> > metrics.Current.CurrentSocketPower;
> > +     gpu_metrics->average_cpu_power =3D metrics.Current.Power[0];
> > +     gpu_metrics->average_soc_power =3D metrics.Current.Power[1];
> > +     gpu_metrics->average_gfx_power =3D metrics.Current.Power[2];
> > +
> > +     gpu_metrics->average_cpu_voltage =3D metrics.Current.Voltage[0];
> > +     gpu_metrics->average_soc_voltage =3D metrics.Current.Voltage[1];
> > +     gpu_metrics->average_gfx_voltage =3D metrics.Current.Voltage[2];
> > +
> > +     gpu_metrics->average_cpu_current =3D metrics.Current.Current[0];
> > +     gpu_metrics->average_soc_current =3D metrics.Current.Current[1];
> > +     gpu_metrics->average_gfx_current =3D metrics.Current.Current[2];
> > +
> > +     memcpy(&gpu_metrics->average_core_power[0],
> > +            &metrics.Average.CorePower[0],
> > +            sizeof(uint16_t) * 4);
> > +
> > +     gpu_metrics->average_gfxclk_frequency =3D
> > metrics.Average.GfxclkFrequency;
> > +     gpu_metrics->average_socclk_frequency =3D
> > metrics.Average.SocclkFrequency;
> > +     gpu_metrics->average_uclk_frequency =3D
> > metrics.Average.MemclkFrequency;
> > +     gpu_metrics->average_fclk_frequency =3D
> > metrics.Average.MemclkFrequency;
> > +     gpu_metrics->average_vclk_frequency =3D metrics.Average.VclkFrequ=
ency;
> > +     gpu_metrics->average_dclk_frequency =3D
> > metrics.Average.DclkFrequency;
> > +
> > +     gpu_metrics->current_gfxclk =3D metrics.Current.GfxclkFrequency;
> > +     gpu_metrics->current_socclk =3D metrics.Current.SocclkFrequency;
> > +     gpu_metrics->current_uclk =3D metrics.Current.MemclkFrequency;
> > +     gpu_metrics->current_fclk =3D metrics.Current.MemclkFrequency;
> > +     gpu_metrics->current_vclk =3D metrics.Current.VclkFrequency;
> > +     gpu_metrics->current_dclk =3D metrics.Current.DclkFrequency;
> > +
> > +     memcpy(&gpu_metrics->current_coreclk[0],
> > +            &metrics.Current.CoreFrequency[0],
> > +            sizeof(uint16_t) * 4);
> > +     gpu_metrics->current_l3clk[0] =3D metrics.Current.L3Frequency[0];
> > +
> > +     gpu_metrics->throttle_status =3D metrics.Current.ThrottlerStatus;
> > +     gpu_metrics->indep_throttle_status =3D
> > +
> >
> > smu_cmn_get_indep_throttler_status(metrics.Current.ThrottlerStatus,
> > +
> > vangogh_throttler_map);
> > +
> > +     gpu_metrics->system_clock_counter =3D ktime_get_boottime_ns();
> > +
> > +     *table =3D (void *)gpu_metrics;
> > +
> > +     return sizeof(struct gpu_metrics_v2_4); }
> > +
> >  static ssize_t vangogh_get_gpu_metrics(struct smu_context *smu,
> >                                     void **table)  { @@ -1923,23
> > +2003,34 @@ static ssize_t vangogh_common_get_gpu_metrics(struct
> > smu_context *smu,  {
> >       uint32_t if_version;
> >       uint32_t smu_version;
> > +     uint32_t smu_program;
> > +     uint32_t fw_version;
> >       int ret =3D 0;
> >
> >       ret =3D smu_cmn_get_smc_version(smu, &if_version, &smu_version);
> > -     if (ret) {
> > +     if (ret)
> >               return ret;
> > -     }
> >
> > -     if (smu_version >=3D 0x043F3E00) {
> > -             if (if_version < 0x3)
> > -                     ret =3D vangogh_get_legacy_gpu_metrics_v2_3(smu,
> > table);
> > +     smu_program =3D (smu_version >> 24) & 0xff;
> > +     fw_version =3D smu_version & 0xffffff;
> > +     if (smu_program =3D=3D 6) {
> > +             if (fw_version >=3D 0x3F0800)
> > +                     ret =3D vangogh_get_gpu_metrics_v2_4(smu, table);
> >               else
> >                       ret =3D vangogh_get_gpu_metrics_v2_3(smu, table);
> > +
> >       } else {
> > -             if (if_version < 0x3)
> > -                     ret =3D vangogh_get_legacy_gpu_metrics(smu, table=
);
> > -             else
> > -                     ret =3D vangogh_get_gpu_metrics(smu, table);
> > +             if (smu_version >=3D 0x043F3E00) {
> > +                     if (if_version < 0x3)
> > +                             ret =3D
> > vangogh_get_legacy_gpu_metrics_v2_3(smu, table);
> > +                     else
> > +                             ret =3D vangogh_get_gpu_metrics_v2_3(smu,
> > table);
> > +             } else {
> > +                     if (if_version < 0x3)
> > +                             ret =3D
> > + vangogh_get_legacy_gpu_metrics(smu,
> > table);
> > +                     else
> > +                             ret =3D vangogh_get_gpu_metrics(smu, tabl=
e);
> > +             }
> >       }
> >
> >       return ret;
> > diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c
> > b/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c
> > index 3ecb900e6ecd..cee5e32b4ff9 100644
> > --- a/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c
> > +++ b/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c
> > @@ -996,6 +996,9 @@ void smu_cmn_init_soft_gpu_metrics(void *table,
> > uint8_t frev, uint8_t crev)
> >       case METRICS_VERSION(2, 3):
> >               structure_size =3D sizeof(struct gpu_metrics_v2_3);
> >               break;
> > +     case METRICS_VERSION(2, 4):
> > +             structure_size =3D sizeof(struct gpu_metrics_v2_4);
> > +             break;
> >       default:
> >               return;
> >       }
> > --
> > 2.39.2
>

