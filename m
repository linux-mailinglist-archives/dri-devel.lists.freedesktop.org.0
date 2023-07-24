Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FC0760274
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 00:40:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 373E010E12F;
	Mon, 24 Jul 2023 22:40:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2082.outbound.protection.outlook.com [40.107.94.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 155C610E03E;
 Mon, 24 Jul 2023 22:39:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iHy6sT6ly3r+rSt/ylzf5RzGX9IA8iHHHLa2We3ZfNDCRcfbeAau/YaLkKfhOi9DI8iZ4Pj6kYYLDDN2Z9cTrn+v2BWJQx2gbzsog2vfT/u3C/FfoQUhxNff7O/xubvajpExV9hkZ7pFAUbjwJsUHDi6z8RfcL0xY+nOJQxFLXzIM2iVMBvoAGel+sk/ijzsw0cQxzrG44YPfEMB9WrHbgeHIDzZoMOIQItcj9iGYNX/YHaDKG1oKipDlbZK7g3nPWWZCr6llQux4m6SfWhlqSVKTFqNZKvmzonfrBHAbVUxZsTxI9mZNEOVwrv1akrnJWbD/RvotpkMz+ZOo4Z6lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y3oRDCG3zPG4xh+1g2igGFDFVcQeGgJx6VlIpSPVECI=;
 b=hLsn0e5Tg4P8V9rIP3FSSmdLolp5XkHrcuqRgXZHkTYmgwmTGlC45KQm4DcUAap809doLHSDvufUBeY842BbIZqRFMVXuPOE/G26ysY5NtSVFyP3g8MXOc/Kh8A3EPXaD0XyIOZSHsVNEzAPhTBZOg4AH0y7/zF4PEvcVx22b5RYZQuUaspEjOCl3bds2B04qiRdG9zM7cAez9LXTv5ezOt7gTyFggiubZcKXFY48tkl7LWo4rZzCeDWEU7l0ibA0mLPNhUqzuzKaz/i7dQcF6h440ALzT6YSyNPAArMBLVshXd2as74SZjy65B1ucY5jwFsb2Jj/sgDubuoaY519Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y3oRDCG3zPG4xh+1g2igGFDFVcQeGgJx6VlIpSPVECI=;
 b=Yh7OtIgw7vmAlLrNNNffaBds9BBZq4wqVCNUFTzo9iqj6BeAjxtstbbOZ/NuWVPXIun4QfdXplL/pB8JhloWE07iBdUbpzCvtr+NNB8D0c9G0zK9BRph093OigqWAgIohSiX9H/B8kU97Zx++XyboD/JI9JkBF9dKIb7S9QA8qU=
Received: from DM4PR12MB5293.namprd12.prod.outlook.com (2603:10b6:5:390::24)
 by CH0PR12MB5233.namprd12.prod.outlook.com (2603:10b6:610:d0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 22:39:54 +0000
Received: from DM4PR12MB5293.namprd12.prod.outlook.com
 ([fe80::6a5a:1893:3fcc:c5bb]) by DM4PR12MB5293.namprd12.prod.outlook.com
 ([fe80::6a5a:1893:3fcc:c5bb%5]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 22:39:54 +0000
From: "Liang, Richard qi" <Richardqi.Liang@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "Yang, WenYou" <WenYou.Yang@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Limonciello, Mario"
 <Mario.Limonciello@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>
Subject: RE: [PATCH v2] drm/amd/pm: Vangogh: Add new gpu_metrics_v2_4 to
 acquire gpu_metrics
Thread-Topic: [PATCH v2] drm/amd/pm: Vangogh: Add new gpu_metrics_v2_4 to
 acquire gpu_metrics
Thread-Index: AQHZpAoXUUfjRc6/zUugx95aoGx9Va+3AZwAgAgPxgCACqWL8A==
Date: Mon, 24 Jul 2023 22:39:54 +0000
Message-ID: <DM4PR12MB52934E4464BF443DCA460F2DE102A@DM4PR12MB5293.namprd12.prod.outlook.com>
References: <20230621063139.583787-1-WenYou.Yang@amd.com>
 <DM6PR12MB35319E01AE25E8388F3CFBFEFD37A@DM6PR12MB3531.namprd12.prod.outlook.com>
 <DM6PR12MB2619854DEA5DF5C9F7A11499E438A@DM6PR12MB2619.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB2619854DEA5DF5C9F7A11499E438A@DM6PR12MB2619.namprd12.prod.outlook.com>
Accept-Language: en-CA, en-US
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
x-ms-traffictypediagnostic: DM4PR12MB5293:EE_|CH0PR12MB5233:EE_
x-ms-office365-filtering-correlation-id: 79bc08a3-2f91-4797-b965-08db8c96e6a7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FGePc5YeLJdxzFcSn3L1W40df5KHgTwGREiSpY90H+lncSqNT74gBFXHg1bKc8Omz9/rJ105bcESXUqJfMSkLy6G1oEW4pV+WBwuE0dEqUsP+37Xw0SFRgeAsWOQMMFBAHiW4tBvwbs92GtH4aRIme1ufv/ahuo+waIYfSqy9dyWOKKCKIXvZDn68eFAQYaMlNzGd8gvFO5NUDuMlbBpHciQyb9l77F9cYpAhVjvWcKihg7wjWf3QBIHvQ9HI1x9rTCguLKCVurIILNFPjOgIniQi80vZHcVyqcY7CGX18J5r8WhhdWdEAyxuRRa7R5veiLZHMtbYL2eIGzBDTVo0Gm/ckJ8Z0aYc0N69XIzLz1RuYsRM2228oG7UqcZiAT1b9VMdXaq1k22m2NlN0Obm5czpsb0+4VzBgTHypdtD3JKlTnKMoiRIBTJJiBp9W2lA63srdNtErEjSmN2hcZz3g8h9ZCdYtyMmyZxFpA8PfGKlpmVS9fWYyYgPNy/nrS7NhEHT2uxAq5Pp9rkyCjoK1oWb6kj9y1hzs+cAwNIQttBLpOur78D0V3oyEexBgib5DjMr9k5peZdfUrhdxNMuqTN5s4KrSeCS9/R10hOOI7/b5UMSwTZXkiEhMwUh5wiPwsOL5pKg67k++uVbXlKHT5jZ2RnuHN0bBuK3exdrpIwIlGWy94jgyqt3sUSWOcq
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5293.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(376002)(346002)(396003)(366004)(136003)(451199021)(2906002)(55016003)(38100700002)(122000001)(9686003)(921005)(83380400001)(186003)(26005)(6506007)(53546011)(52536014)(86362001)(5660300002)(8936002)(110136005)(38070700005)(6636002)(30864003)(33656002)(478600001)(71200400001)(7696005)(76116006)(4326008)(66476007)(8676002)(66446008)(66556008)(64756008)(66946007)(316002)(54906003)(41300700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4EXcuKy9luJX6IryUR7a2M/gPfgZL9va6JgDzAgOg6I3j4LM8B8v4amSUGoM?=
 =?us-ascii?Q?Dkoes7kDByMMMapPi7YyauOb1rv1CPoYOIiuxRGyY7yEN4zIiTlCzRqWFbrU?=
 =?us-ascii?Q?Hz7JDvRqc2BElyi5ltMq3QVTFMXah8YolAp4O4C8He2AK9S/euNOcDKanbJn?=
 =?us-ascii?Q?vf32W4se8PV8nMMOyaGcjjY0FyQ5eVNAvpB86rBvZj90AAj0+pF8reEmIBcm?=
 =?us-ascii?Q?YVPedEF9+WW5TcrWaKLamRJABtbykXzEBDdTwE0ThOgBrQiT6UeN0qLiKlpD?=
 =?us-ascii?Q?GD4khe/UCJ5Ve3dOGshPr7lYN57jX8KVDU/EjzZZsIF/eEOiAdu8UK2QAsyv?=
 =?us-ascii?Q?XN+Jf3U6KMSRlNF9s8NS8jxci2gp8524fxiZkLHLxCkGSpXfeUGE6Ugx8CGy?=
 =?us-ascii?Q?onK0ejL7uDY44Hz6cXjNd7nICyfTqtd+pBvYxs8RIkSVLnHa5R1QUsJKkuUx?=
 =?us-ascii?Q?N6NqxktkKTu63TOlQxl0DK3QkqCBQFB1Dw46aQQ64sN0lBpSDANyFxrXV5iB?=
 =?us-ascii?Q?YO4luDAUR4p74uOsiWgtNTHPrrlT2TpOy6e7YMDGQLirOU0lkVGR3gvPw8bG?=
 =?us-ascii?Q?vyBQ5MRl3NHYF7rRu7J0dhMEB0u8l+iLUSLokAATaTi9UFCQZ7KyvBZNUho4?=
 =?us-ascii?Q?C+FtgYIQ9H4zyIGM/xHNa4pmcL7Y4P9a/pHTn1i8zdY90ndUuJeA2AQrNvJl?=
 =?us-ascii?Q?ht+4ZB5hsuMG87m+AAAhQ4QZYWar/tPJgwBU8ohMO1vYuwvINAe63da1GlMM?=
 =?us-ascii?Q?E1jAJDUWuZv1tYEVqSgn74uKW830+q5nyhrNgThNGVX664sDfcEUkgJBsJrl?=
 =?us-ascii?Q?A8Fi53P0o31TAkhiEEehOAG4SAwaGedVj8JT5O4s75lzmq5MIU0Uqx1m2HgB?=
 =?us-ascii?Q?UsZgMMjrJaGt6udRbs5cg5yVKqv/BOTnYwKPL20RWNoZNhd+3qYcaf4W6f0l?=
 =?us-ascii?Q?5t43+Ya7+Pg4IsuMqCanv6btX3o+IcU+tNA3O6pqZ7FG6kuxEcNFA+Cye1X7?=
 =?us-ascii?Q?pczNqOG6zHpWwD/h9iFVSOKYyq07TmmO3k88VpFqVWTKxi/dhIWYYW8Snr8Q?=
 =?us-ascii?Q?l4B5IYl1ccp/ECMR6IJpTAiZtkVqTvBwPidLAhqJkiMCFpjO+uEZEZe1KVvi?=
 =?us-ascii?Q?SK0uop7IQGpT3YXWJRBb5DPUZA5IltA6dhAw6HR9LfQX6Evc5aekb7cmet6R?=
 =?us-ascii?Q?WQw77Nn6h9k6P3oinPuNDeu/90C4RoNsDS25x239fe4yqwe6ZGEj72+h7g9H?=
 =?us-ascii?Q?qF/d1HA222zQYzPtCzGvF7CcfcZSq7PbtqDTnUg4W5b+zULoxPTINrhxrRq/?=
 =?us-ascii?Q?OD4sDwOtsHYA7pm37wmviUyfjox7MGh2Uz65RsqfAXvx9lL7MsggV8NIQLEz?=
 =?us-ascii?Q?5BE/Ihq9iSg7j060oKLdO6lPc2fgK8gtEToxZV6CQeWgmc8rRKgCIQfkrCi0?=
 =?us-ascii?Q?zx9znJLAoZU1rukOxCUGBczge4Z0SU4lzTHbD20dDER9NlZYnN8AYapbWKIn?=
 =?us-ascii?Q?RG1MwykeGtRZNIkgVi1Nl7RwMkO40F7zyWNiDIDDiX4FFlfDZnh2yYB4WLki?=
 =?us-ascii?Q?E1vkIuwiaH74JzOSqQQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5293.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79bc08a3-2f91-4797-b965-08db8c96e6a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2023 22:39:54.5674 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aPd5vijPunMRAGtRHvPx5lxaJhx5cISC6XaWozywJesdL4EIIHn05MymjmoTWj4I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5233
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
Cc: "Yuan, Perry" <Perry.Yuan@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - General]

Hi Wenyou,
Could you merge the patch?

Thanks,
Richard

-----Original Message-----
From: Quan, Evan <Evan.Quan@amd.com>
Sent: Tuesday, July 18, 2023 12:03 AM
To: Yang, WenYou <WenYou.Yang@amd.com>; Deucher, Alexander <Alexander.Deuch=
er@amd.com>; Limonciello, Mario <Mario.Limonciello@amd.com>; Koenig, Christ=
ian <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>
Cc: Yuan, Perry <Perry.Yuan@amd.com>; Liang, Richard qi <Richardqi.Liang@am=
d.com>; amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; lin=
ux-kernel@vger.kernel.org
Subject: RE: [PATCH v2] drm/amd/pm: Vangogh: Add new gpu_metrics_v2_4 to ac=
quire gpu_metrics

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
> > To: Deucher, Alexander <Alexander.Deucher@amd.com>; Limonciello,
> > Mario <Mario.Limonciello@amd.com>; Koenig, Christian
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
> > gpu_metrics_v2_3 doesn't contain them, and to be backward
> > compatible, add new gpu_metrics_v2_4 structure.
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
> > +     gpu_metrics->average_mm_activity =3D
> > + metrics.Current.UvdActivity;
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
> > +     gpu_metrics->current_l3clk[0] =3D
> > + metrics.Current.L3Frequency[0];
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
> > +                     ret =3D vangogh_get_gpu_metrics_v2_4(smu,
> > + table);
> >               else
> >                       ret =3D vangogh_get_gpu_metrics_v2_3(smu,
> > table);
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
> > +                             ret =3D
> > + vangogh_get_gpu_metrics_v2_3(smu,
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


