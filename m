Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FA6737476
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 20:40:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 223BC10E378;
	Tue, 20 Jun 2023 18:39:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2070.outbound.protection.outlook.com [40.107.223.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AC9A10E378;
 Tue, 20 Jun 2023 18:39:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GqFsixxRg996H6AQIgyFJDCWGvxdGCUXty5cwsPvhC9TLNJRi7znOocJ/wZXGfsRXFQ8WAFQ+4S8syytU9XeBQl7aZPw7mqUBVP7iXKaseuq+bsUpZaFUbjZ9V/aSogfOcf5ix+wWPyHxDPxlWWJ1Rh3Do8kTblxra4zp34teiLHJTRNrj13pkFfcuFV++JQjukEcZ8QGSPSbzU/sK8NIsB0fS4e2yy5koa7JegYPPXGU6xDowT2+IbhkuwzPteTyecXvNV1C4uJ79s8mB/cnSs88q0N111j1BzgeSO2tHsHs+HVvJ+gE8PSsmrlrs6fNfk7bgjdCPVBy8Ip9w1+LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2hbWlIMLkKOfYFeqmU1cA8dfu2ibmz7PvfR1/QObRxM=;
 b=dctTmvs2SPg1CQjon3Nzmg+7kotVbsQ1qgbrGVvF/1Frtej2OHi1KkLT6vKlyGfjSQyS2+HeFnV4eK9HHF682ERJRScMM0kYSX0KYzCC9EJkaC89I+EAUUVg1kRGZE4p7UwCPlKqFzLwH3ewEVNpF2tX15eD+J6hYtfNEPbfaE0FJu8CPPW/yurhBgu1zkYU1csXPxpf7XoarLVlOW0XxQn1b3Z7c/ARVAXQ/iyl7tjDiidYaDCpoJ7WDmw5yRzoOIN7CaRD9PUYvTF+gvs3rMfXIU0t4alHW6Cj3vQw4yHsyLYmYqMCtddZbduSy+Cn1Con6Ujqlk//KK25TPlelQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2hbWlIMLkKOfYFeqmU1cA8dfu2ibmz7PvfR1/QObRxM=;
 b=FHMWnFlZat+M+rBaCPQluKH0Vdmasnm52msLMYtwUicgE599oBUhxpnj/Q3/9zD3wUos/5EyK+ze0DuZnqvy+gDTcmpCEFjil/LmM2O+k5Mj0EiIvFkSRuPuRTi2wcv7K6bSP4gwcvcQjpP5FgeGHyAjMpX7Cc7iWCKrp9ebA1w=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DS0PR12MB8455.namprd12.prod.outlook.com (2603:10b6:8:158::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 18:39:52 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dfcf:f53c:c778:6f70]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dfcf:f53c:c778:6f70%5]) with mapi id 15.20.6521.020; Tue, 20 Jun 2023
 18:39:52 +0000
From: "Limonciello, Mario" <Mario.Limonciello@amd.com>
To: "Yang, WenYou" <WenYou.Yang@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>
Subject: RE: [PATCH] drm/amd/pm: Vangogh: Add new gpu_metrics_v2_4 to acquire
 gpu_metrics
Thread-Topic: [PATCH] drm/amd/pm: Vangogh: Add new gpu_metrics_v2_4 to acquire
 gpu_metrics
Thread-Index: AQHZlCnLuj1cXKxMLkaNhPGNLa25iq+FKYaAgA77CSA=
Date: Tue, 20 Jun 2023 18:39:52 +0000
Message-ID: <MN0PR12MB6101C84C2AD84CA4D1CD8BFAE25CA@MN0PR12MB6101.namprd12.prod.outlook.com>
References: <20230601013826.265885-1-WenYou.Yang@amd.com>
 <DM6PR12MB35313C599DF2DFFA0F329D87FD57A@DM6PR12MB3531.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB35313C599DF2DFFA0F329D87FD57A@DM6PR12MB3531.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=f088a03e-531b-478a-a3c7-23195e560767;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP
 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-06-20T18:39:46Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6101:EE_|DS0PR12MB8455:EE_
x-ms-office365-filtering-correlation-id: 2bf116fb-ed94-4235-785c-08db71bdbc69
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6eGrG1kQX3WoIjxHS6Rc6wGSG9WZDmEcw+jO4UaYpGiYmarur5Br//ITKqHlZBaAEXpD//n85jOGahtqoTxc34vannoZU8peFntJV3qOtCMc6bZ6uWtamUq4p4Ltf0rA4O15oQOLHFzn+39mPhThSkgMNP0y/dWUNW9N9KrROMzl/VR3lUXlhFvXjRHyaYWjXdmaHM5fDJp4DyXb7QVAMl8Vk4BSfAB1pWexp+SSSqmj8hmAZG7wcYqUlhl/ImqdaOdawJQjLCXYeOgDAp7GzGXNlcaUZigbreL6LZAqsTFXUuE5zoc7M6lUl5H1X8bTMznGCYnLJySmBU2Twp9u5AOcFW9HIGkKiIBv4N5rRudXrTaNVlMGDGiro3Iac4FTKq2lgSGfVj1/tbb43hmCa0ko7djrTUaMc4LrNAT9S5BcmJqwpaXgyjYtIXmadBPCGrY1J2isurPIT+x/opR+c4g6ZMVu8n+BMyJ/1uCazuume6Hnw2Rnfi6RT5Ih7uVZnqWD0RvkKMrlEc+zRaHsOtVIBttw+Z+43j6ug3i0DuQsyuaYLHfK/+8p7F7cgX+oqEGGJaZFeSnS3pQZI/yolsLLyMEQl9SR5oVsSo2U2nGLKyuh/3lN7LlNhlebt4EqgVGO+1IoKPaBqmf4T9flSA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(136003)(39860400002)(396003)(366004)(376002)(451199021)(5660300002)(478600001)(26005)(52536014)(64756008)(66476007)(66946007)(76116006)(6636002)(66556008)(66446008)(316002)(54906003)(110136005)(41300700001)(4326008)(2906002)(53546011)(7696005)(71200400001)(8936002)(30864003)(8676002)(186003)(6506007)(9686003)(83380400001)(122000001)(921005)(55016003)(38100700002)(33656002)(86362001)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LwlCVpIdOy0SSFZ1Qzjnaz1jBTvx9cuLyIhgTU0HlL4SbwAT8yW8ZYSdcdsk?=
 =?us-ascii?Q?oHwtqtNM3qwsa1lSgGK57LatNsxtdeJhBIm6qr1vaLCrT96rG9MzKFz7bndD?=
 =?us-ascii?Q?VhIm6ZBtIW5F7amckhbZl0c2i4aHAFd41GNjqLzgu3I+8kxL8FEgx0rkgfh0?=
 =?us-ascii?Q?gf3RrgyujT01VeHqUISTvWe0yrHi/FmhPB9CYEJDkA7RIdMWf6sB0l5grisf?=
 =?us-ascii?Q?k3sCpDr3WFgDWkJzU/X9Ha4+lcmmyOfYAFxtYvgjaNN5sLl6sPveH0Xr3r11?=
 =?us-ascii?Q?YW4W0zLghkK25YJJuxe9LLAh7PLEr0+Yt4BSg2Zcf7qCAqt1x3D1NEsh0WQ9?=
 =?us-ascii?Q?PFkURGOtil9Y4rbPQCsSULnoAVIjPYtIfyFyQI6CbZCmxAxWHemkdNZv8vZT?=
 =?us-ascii?Q?ukyO9s7sgqmJTZHtfWq39LrBkI2XQe/tUiTNyyEKbYMik7Z1MylrAjWSnRkg?=
 =?us-ascii?Q?9F46sfp+LkZitPE4vIKCpEzj2JSJTVkqqjq4ftXabW1f3pN43Etvsdck+a8v?=
 =?us-ascii?Q?JldkrvVWHuQyKq3JH1vm2FyUJ7hx3rDlhDgiThRrce+cWZpzh2bBldRyyxjt?=
 =?us-ascii?Q?NwA09YUQsGHADfS9gZO/6pnT9nfROWyfFNVo9M4WOjyvDXtoIG041R9H/mVH?=
 =?us-ascii?Q?Fz0Z4MwD2OJwMLaBZgzE9JJcDdCufGMcpYZV0UGMeUuZLgoO6dPmcgP0TFyU?=
 =?us-ascii?Q?cpD6UKYKANU9u/LSaixF0jt40SyqcR1f5dzDSKiAq/QL3jIRsJI1xOiphkAa?=
 =?us-ascii?Q?a4hHpameGMOS6W2S0Gs9L0GWvNkjMZPCLAk4MY2ShJ7IWgdU6syBU9eQ7POy?=
 =?us-ascii?Q?hjquTH87QhjsbcXQvm305q0QhIsIyCUOy79C0X8TaWp/8Ublcih/BhXJgQBg?=
 =?us-ascii?Q?/M22DVqU3bG3hwOruqfG+pBCQCLuxjOE8MM68y8pT1IlP0blm7voM7CmQ7GW?=
 =?us-ascii?Q?yNTkBH6bG9OX7mTc+xgjvR2J6evTyEaoOOSC/zbb9QArRQuoFXDkgqhL1r2t?=
 =?us-ascii?Q?wv8H3fdSpmjqT0ukDaqQ9l5tgtXt9RJv9JHfLUoCdr7RqxM9WSFdaBbJoFUT?=
 =?us-ascii?Q?i1pLcWxc049G5PpQLlltDclgZNQQq4+dKd9nlbnONejVztjgrWz5fIJg52hR?=
 =?us-ascii?Q?9AoqpAZYctC5VrKK3pT5F32/njyzf7ppsUDJzUBWmLLRiDrVTsYwHZKrUkov?=
 =?us-ascii?Q?7uePscOU/lW97pyTgV2Hytvr0aLYTcnOyhwWI0lLFcsRDkRg8xgMDSCWh5/F?=
 =?us-ascii?Q?h2fTVoL2O/Lgdn/wNdmUou6T1AJ1VSSJkuDRN/1rWxX8tXPsyLDf9GTTwmgE?=
 =?us-ascii?Q?ENv2LSabdx4pTJU6plWz5jfYtYgLURmOQF39NIXaxnSsFRGrnwSvmNvm/8zL?=
 =?us-ascii?Q?KQUZPvk3QACEy08sqcbTGvff0IW/kA/8qCQSzqihkkbanvym7WWffjgzb3xh?=
 =?us-ascii?Q?EdFN43ZnQTz+x9vqXWkvHZx9PHCzYWElzHnCe4PQt3pk0TJ3Ws6EmiobKFZ0?=
 =?us-ascii?Q?BjrB2vDxra0mGdFC4rInnRHhcLAy4Qvis5dQGIkBSbOiCXjeQf56rGhy/lW4?=
 =?us-ascii?Q?1pgR8RNcV6J11lCDN+4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bf116fb-ed94-4235-785c-08db71bdbc69
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2023 18:39:52.6402 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RmYyhy9tABhtZMWqA7mYPV2SpOwZjlBJtk2Dwph/ilaIDgv+FzUeqnqjRr10IqZieoT7XRkpW6WKaKb7fib19g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8455
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

[Public]

You've got an A-b from Evan already on this.  It looks fine to me too.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

> -----Original Message-----
> From: Yang, WenYou <WenYou.Yang@amd.com>
> Sent: Sunday, June 11, 2023 12:53 AM
> To: Yang, WenYou <WenYou.Yang@amd.com>; Deucher, Alexander
> <Alexander.Deucher@amd.com>; Limonciello, Mario
> <Mario.Limonciello@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; Quan,
> Evan <Evan.Quan@amd.com>
> Cc: Yuan, Perry <Perry.Yuan@amd.com>; Liang, Richard qi
> <Richardqi.Liang@amd.com>; amd-gfx@lists.freedesktop.org; dri-
> devel@lists.freedesktop.org; linux-kernel@vger.kernel.org
> Subject: RE: [PATCH] drm/amd/pm: Vangogh: Add new gpu_metrics_v2_4 to
> acquire gpu_metrics
>
> [AMD Official Use Only - General]
>
> Any comments?
>
> > -----Original Message-----
> > From: Wenyou Yang <WenYou.Yang@amd.com>
> > Sent: Thursday, June 1, 2023 9:38 AM
> > To: Deucher, Alexander <Alexander.Deucher@amd.com>; Limonciello, Mario
> > <Mario.Limonciello@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>;
> > Pan, Xinhui <Xinhui.Pan@amd.com>; Quan, Evan <Evan.Quan@amd.com>
> > Cc: Yuan, Perry <Perry.Yuan@amd.com>; Liang, Richard qi
> > <Richardqi.Liang@amd.com>; amd-gfx@lists.freedesktop.org; dri-
> > devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; Yang, WenYou
> > <WenYou.Yang@amd.com>
> > Subject: [PATCH] drm/amd/pm: Vangogh: Add new gpu_metrics_v2_4 to
> acquire
> > gpu_metrics
> >
> > To acquire the voltage and current info from gpu_metrics interface, but
> > gpu_metrics_v2_3 doesn't contain them, and to be backward compatible,
> add
> > new gpu_metrics_v2_4 structure.
> >
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
> > index 9f542f6e19ed..0f37dafafcf9 100644
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
> > +     /* Temperature */
> > +     uint16_t                        temperature_gfx;
> > +     uint16_t                        temperature_soc;
> > +     uint16_t                        temperature_core[8];
> > +     uint16_t                        temperature_l3[2];
> > +
> > +     /* Utilization */
> > +     uint16_t                        average_gfx_activity;
> > +     uint16_t                        average_mm_activity;
> > +
> > +     /* Driver attached timestamp (in ns) */
> > +     uint64_t                        system_clock_counter;
> > +
> > +     /* Power/Energy */
> > +     uint16_t                        average_socket_power;
> > +     uint16_t                        average_cpu_power;
> > +     uint16_t                        average_soc_power;
> > +     uint16_t                        average_gfx_power;
> > +     uint16_t                        average_core_power[8];
> > +
> > +     /* Average clocks */
> > +     uint16_t                        average_gfxclk_frequency;
> > +     uint16_t                        average_socclk_frequency;
> > +     uint16_t                        average_uclk_frequency;
> > +     uint16_t                        average_fclk_frequency;
> > +     uint16_t                        average_vclk_frequency;
> > +     uint16_t                        average_dclk_frequency;
> > +
> > +     /* Current clocks */
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
> > +     /* Average Temperature */
> > +     uint16_t                        average_temperature_gfx;
> > +     uint16_t                        average_temperature_soc;
> > +     uint16_t                        average_temperature_core[8];
> > +     uint16_t                        average_temperature_l3[2];
> > +
> > +     /* Power/Voltage */
> > +     uint16_t                        average_cpu_voltage;
> > +     uint16_t                        average_soc_voltage;
> > +     uint16_t                        average_gfx_voltage;
> > +
> > +     /* Power/Current */
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
> vangogh_get_gpu_metrics_v2_3(struct
> > smu_context *smu,
> >       return sizeof(struct gpu_metrics_v2_3);  }
> >
> > +static ssize_t vangogh_get_gpu_metrics_v2_4(struct smu_context *smu,
> > +                                         void **table)
> > +{
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
> > +     gpu_metrics->temperature_l3[0] =3D metrics.Current.L3Temperature[=
0];
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
> >       smu_cmn_get_indep_throttler_status(metrics.Current.ThrottlerStatu=
s,
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
> >                                     void **table)
> >  {
> > @@ -1923,23 +2003,34 @@ static ssize_t
> > vangogh_common_get_gpu_metrics(struct smu_context *smu,  {
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
> > +                             ret =3D vangogh_get_legacy_gpu_metrics(sm=
u,
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

