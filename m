Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C74C272B072
	for <lists+dri-devel@lfdr.de>; Sun, 11 Jun 2023 07:52:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DF5B10E05C;
	Sun, 11 Jun 2023 05:52:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2070.outbound.protection.outlook.com [40.107.92.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4081A10E05C;
 Sun, 11 Jun 2023 05:52:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i3/CLU9RbBL2zxZ5PyKkAGLqdywa9kEXFcGTVfLHbVhlVcXRz8qv1TJVCy8tuaBMg/zDmhqOVjqaxU41lKWcGJFy3VUZrBhgUDhZUwDRqxZFYAOkDT9gl/K5P2pZ/spdhPHZxwJEc2ardrXS+6hOaaOnfQTk9VYl08uzZsgXRUipdG8f9XrQpziREezb34GC+2X8CObiquBb/FGi9V3GUnDOlf32NRqVnbZU7BsnAmDx2eyM45k4+1kGX8oBiH2KNHk5S+35jV/nsW7hPboRzbRNoAD+zJWNsv56/J4C7Xw5k0EIqZMHY5axkrcFZY9fTXInob28Gpm6NQaJDQR7UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cdtqcwf9rtlItezGBJ17Ymh7LIWPrNghtUWPZTfK/LI=;
 b=JqhZUvo66yH6IxcRnAGXulM95eU+6gKx+Gir4J0YUFvsumG5JeQtMy5h+NFk7fFkPCafvIk9mRXbM1lmGzF/vkqzeYQ/KmAmo2+w+O6ME0D18QQcMamRO+Zt90xlTtuvwJd26yJlaJX0WSGlvZp+M2mbIB0pz7laoQVFW0tpoh7dac+WtBTmGplm/LUP8oj93yy+U/n5slF+/e6oDn5SAMDFeVcVH4o5921c4fNYdsLdsiBIsWVwQp9jIyK5hm8ca7sZ+6+k923TqVDbpEZhDD/FDHLvpDgopKZ+o8ajs4Yo3BgE+DrKzhnBoTxNpHNDBEv5IYRixJU8PTVBynV0FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cdtqcwf9rtlItezGBJ17Ymh7LIWPrNghtUWPZTfK/LI=;
 b=aD6HRAdgOv258ihdiWSby2sMmnY4oufpZwKhnBUdQSopAQvYC/sCtOhClQJKm3FEt6Kf+RexqAmge1pOIIwmbS0RxYmnirp+/FPz9ZqZLEc89ydnkSdJIH19X0mj3uQ1Q/2wHo8yuRgy1fH/t9/n5Y/OMLchktWmBOsD6Rcee9s=
Received: from DM6PR12MB3531.namprd12.prod.outlook.com (2603:10b6:5:18b::10)
 by IA1PR12MB6331.namprd12.prod.outlook.com (2603:10b6:208:3e3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.31; Sun, 11 Jun
 2023 05:52:37 +0000
Received: from DM6PR12MB3531.namprd12.prod.outlook.com
 ([fe80::5137:79b:6b61:a295]) by DM6PR12MB3531.namprd12.prod.outlook.com
 ([fe80::5137:79b:6b61:a295%2]) with mapi id 15.20.6455.039; Sun, 11 Jun 2023
 05:52:37 +0000
From: "Yang, WenYou" <WenYou.Yang@amd.com>
To: "Yang, WenYou" <WenYou.Yang@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Limonciello, Mario"
 <Mario.Limonciello@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>
Subject: RE: [PATCH] drm/amd/pm: Vangogh: Add new gpu_metrics_v2_4 to acquire
 gpu_metrics
Thread-Topic: [PATCH] drm/amd/pm: Vangogh: Add new gpu_metrics_v2_4 to acquire
 gpu_metrics
Thread-Index: AQHZlCnLRFbMKpVNgUOuQMaaNu71gq+FKW+g
Date: Sun, 11 Jun 2023 05:52:37 +0000
Message-ID: <DM6PR12MB35313C599DF2DFFA0F329D87FD57A@DM6PR12MB3531.namprd12.prod.outlook.com>
References: <20230601013826.265885-1-WenYou.Yang@amd.com>
In-Reply-To: <20230601013826.265885-1-WenYou.Yang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=d582cfc9-49e3-40aa-a2ea-b3c169a3be59;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-06-11T05:52:18Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB3531:EE_|IA1PR12MB6331:EE_
x-ms-office365-filtering-correlation-id: 4d452b27-4522-4c29-fb18-08db6a400fa5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7P4Zs1Tm3X3UuMv+RJXva+cRTgRujcsb9+wRcaK4LZ2Yuf1ErCak0vWwXEw6vAooF8/hubSSVVKwDRTl5Dp4ow+8oGc3KIxQhQ1oZfyw+6ZWPuzl80jhrB7tw1E5LWzSrGk775vhv/uENPGgL15ZpxwDwuWomJKriVEcF0dt+APW9gI47rBeKwOG0EsY1FGl1udkJHou5a0vp1NjNUQ2Af2VO5yBMoRTjB7dTXyhM6vTq2w0w45PUHqVv52izcZE8sex47jMGyyFanPbUo76FeowTHP0cG7Q0t/JgOtIFG/bchrQ6UWFonbHsWgIMjd8UyW7+x6K/x8Kpx7t6Od+bfQDjqkc97Cau8ZOcBzoTvqpYSCFjsFfbqFXH/tl3EzURWFhysRuJjOwF5+mTXkvKAVgi6TeV8FuUOShEmsg6NVCyaWDRn2OYVr78QiFmxIF1jR88Kq2o/HD60Mj5RW7+imDqgJ23Wz04Cbk5q6f3rDY59ws8ClBONX+tPnTYKKziPZT3rZMxVh9sAGWgTNT0xSIt8TKSPR8fGzZ25PTlAK1htZ3pnWnmVUjmPqZMAhNAjnOXf6/VPkvMSfgsj6i1h+cfxvGkf2w+hsWFuTBWmaNNquOXTF/XqbpZLSx1Ik1TtNmBi43nab77eheQVXY8Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3531.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(366004)(376002)(346002)(39860400002)(136003)(451199021)(8676002)(8936002)(54906003)(110136005)(53546011)(478600001)(66946007)(4326008)(52536014)(5660300002)(316002)(41300700001)(7696005)(9686003)(76116006)(66556008)(71200400001)(66476007)(66446008)(6506007)(64756008)(26005)(55016003)(6636002)(186003)(83380400001)(2906002)(122000001)(921005)(38100700002)(33656002)(38070700005)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qMxiy6HrPp7fbUp7WC3Q/52hiaAUD39lfzFVWMzRQ7d4uuXNIWOwjHO5WR+X?=
 =?us-ascii?Q?Hpzvpj0c0N2iCZPVh12ctzEhxWTd6bq9GszizSFGyZZdHrVTLyh1DARus1tf?=
 =?us-ascii?Q?oPhrssImbYVc2HpuhYqsm04loaRFp+psnS9ZB0WCsva/vs9wLkZJ17MRiCYa?=
 =?us-ascii?Q?uCeGUVyX/x+klZa5bCdcemwQwuqGolAQuCnSFx7RRhgEnc4JAmsMSxjwX3L8?=
 =?us-ascii?Q?1aPILmZr7QXfRnuCGGScaXYHe0B1QY0ffjjAT3m2dp2D0Ac89L3/1+WdTOd5?=
 =?us-ascii?Q?e66UhqcPMH+q3JS4o9iyyMekqAxFwmDTmLZxnXAh69YgS73j8u2oX6Ivtttl?=
 =?us-ascii?Q?OYcylzJwz69tN0MGpo6AQzjBR7kSJOT34TlrV9r+69z1UqG9bZDiRZD58mgE?=
 =?us-ascii?Q?U1/KPrY1RlWT1IxIdCy/fzKkc5J7NLRsHeUyPOCMklGpa5KRe2JPpODDSlAC?=
 =?us-ascii?Q?DIpemODBnURYjwh3zEgmqxLn9LTs1jbUxqZFBdmh3ri37/bv7rHoG3z/S20a?=
 =?us-ascii?Q?py96FhAH+XMy++n062xA8pRAEVzEE4oMM077iLXf07LSgdBBziSxm/Gv+HN/?=
 =?us-ascii?Q?nmTh0ANvqgo0rwh+t5UxfohMl3RMaxYShCq58wdMj1nd2Wl4toJ3odjs6SHR?=
 =?us-ascii?Q?wiOXuIcTN7pN1VoyaSoZJl/b+tc9RRMyVwgW6/XqNdwF3sRksKZZgovfQtWP?=
 =?us-ascii?Q?IheNaQZ19I/ydHH6RoV1tj4QD62ApK4tyjvjRvFeF68rP3s2M4fG4jQHnaWA?=
 =?us-ascii?Q?bHGAL0E8Y+zHsrFkDVT6jM0boG0NdKirHiIEFTAKJrlmn1C0993xcGsyL/Th?=
 =?us-ascii?Q?awbKytfTaFG51WG1I/QJ4FI4Qc5UzZQRlSZJisPs/64tax9KmseKpINTQc33?=
 =?us-ascii?Q?T8+yqD8HixcL+JwhcIawei7mSFXRNPYW1+rtOy0ObsxQCYg3NAueU7rqmhng?=
 =?us-ascii?Q?8+BoF+2atF7Rs6vkpUJgHcBLKCeBrc67wm0MBBmziDTdFvyAPnnhmLJBWRwJ?=
 =?us-ascii?Q?8hnXeNgYynL/xG4DRG911AiOsXdPlo+feRw9ii9ZKok2GKnYQLIJxIg0V8lK?=
 =?us-ascii?Q?h7h+EusFwoDEI4ZfSgrzZYq48iEeI7MSY9H5Wu0GzsaVhSuWmVx3jV1CYOUR?=
 =?us-ascii?Q?audKzj1JkRVtnE61j+HQ0jHYC7F3KoDmRrzOwsjM0M8DauK8R+hHzo/FLFnE?=
 =?us-ascii?Q?F5wuRgwFfvkrmEm6OjgaI/X1HFtP13HAB9HpJg7Nhq2Q13UqY4xmkh70ANd9?=
 =?us-ascii?Q?3exjcLUR3P1nxrg0wyIODnwBGmd6IYHN0bqNmCoGXIgoBSznmBoYiMR1Do6S?=
 =?us-ascii?Q?sLVcQVTfTrVrxIaxIup65ATsEuMY6Xa+wkD75s9K/Y2kDsdFq+Ea8oOzUb/Y?=
 =?us-ascii?Q?t14Mwwj3wPWEFuiOBSW+DZ9t+z7SImitrSFUq8tA97IcCCIpMHTj0eZ1Ymxw?=
 =?us-ascii?Q?Qg8aKPiSAfBA65qsHLvg4y9G3K2ADzN70HcBqbeY/EEunb09Nm7K2rh6LXn3?=
 =?us-ascii?Q?l+f1l6mVRnfEPNSFJQ37xr9/1YE9OjASyE42apPJETYl95O3hKDcQSGzMfxF?=
 =?us-ascii?Q?Zi6U8TRxs0gaZciZSOU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3531.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d452b27-4522-4c29-fb18-08db6a400fa5
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2023 05:52:37.5953 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fi3DD/vpjC35HXTy3uXaRK+36a6WtM8zMHZOTVL5yEoE7TfBUuIBIephRkOAiglhKHIGceYCaJG3uOyxNCfl1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6331
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

Any comments?

> -----Original Message-----
> From: Wenyou Yang <WenYou.Yang@amd.com>
> Sent: Thursday, June 1, 2023 9:38 AM
> To: Deucher, Alexander <Alexander.Deucher@amd.com>; Limonciello, Mario
> <Mario.Limonciello@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>=
;
> Pan, Xinhui <Xinhui.Pan@amd.com>; Quan, Evan <Evan.Quan@amd.com>
> Cc: Yuan, Perry <Perry.Yuan@amd.com>; Liang, Richard qi
> <Richardqi.Liang@amd.com>; amd-gfx@lists.freedesktop.org; dri-
> devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; Yang, WenYou
> <WenYou.Yang@amd.com>
> Subject: [PATCH] drm/amd/pm: Vangogh: Add new gpu_metrics_v2_4 to acquire
> gpu_metrics
>
> To acquire the voltage and current info from gpu_metrics interface, but
> gpu_metrics_v2_3 doesn't contain them, and to be backward compatible, add
> new gpu_metrics_v2_4 structure.
>
> Acked-by: Evan Quan <evan.quan@amd.com>
> Signed-off-by: Wenyou Yang <WenYou.Yang@amd.com>
> ---
>  .../gpu/drm/amd/include/kgd_pp_interface.h    |  69 +++++++++++
>  .../gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c  | 109 ++++++++++++++++-
> -
>  drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c        |   3 +
>  3 files changed, 172 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/include/kgd_pp_interface.h
> b/drivers/gpu/drm/amd/include/kgd_pp_interface.h
> index 9f542f6e19ed..0f37dafafcf9 100644
> --- a/drivers/gpu/drm/amd/include/kgd_pp_interface.h
> +++ b/drivers/gpu/drm/amd/include/kgd_pp_interface.h
> @@ -892,4 +892,73 @@ struct gpu_metrics_v2_3 {
>       uint16_t                        average_temperature_core[8]; //
> average CPU core temperature on APUs
>       uint16_t                        average_temperature_l3[2];
>  };
> +
> +struct gpu_metrics_v2_4 {
> +     struct metrics_table_header     common_header;
> +
> +     /* Temperature */
> +     uint16_t                        temperature_gfx;
> +     uint16_t                        temperature_soc;
> +     uint16_t                        temperature_core[8];
> +     uint16_t                        temperature_l3[2];
> +
> +     /* Utilization */
> +     uint16_t                        average_gfx_activity;
> +     uint16_t                        average_mm_activity;
> +
> +     /* Driver attached timestamp (in ns) */
> +     uint64_t                        system_clock_counter;
> +
> +     /* Power/Energy */
> +     uint16_t                        average_socket_power;
> +     uint16_t                        average_cpu_power;
> +     uint16_t                        average_soc_power;
> +     uint16_t                        average_gfx_power;
> +     uint16_t                        average_core_power[8];
> +
> +     /* Average clocks */
> +     uint16_t                        average_gfxclk_frequency;
> +     uint16_t                        average_socclk_frequency;
> +     uint16_t                        average_uclk_frequency;
> +     uint16_t                        average_fclk_frequency;
> +     uint16_t                        average_vclk_frequency;
> +     uint16_t                        average_dclk_frequency;
> +
> +     /* Current clocks */
> +     uint16_t                        current_gfxclk;
> +     uint16_t                        current_socclk;
> +     uint16_t                        current_uclk;
> +     uint16_t                        current_fclk;
> +     uint16_t                        current_vclk;
> +     uint16_t                        current_dclk;
> +     uint16_t                        current_coreclk[8];
> +     uint16_t                        current_l3clk[2];
> +
> +     /* Throttle status (ASIC dependent) */
> +     uint32_t                        throttle_status;
> +
> +     /* Fans */
> +     uint16_t                        fan_pwm;
> +
> +     uint16_t                        padding[3];
> +
> +     /* Throttle status (ASIC independent) */
> +     uint64_t                        indep_throttle_status;
> +
> +     /* Average Temperature */
> +     uint16_t                        average_temperature_gfx;
> +     uint16_t                        average_temperature_soc;
> +     uint16_t                        average_temperature_core[8];
> +     uint16_t                        average_temperature_l3[2];
> +
> +     /* Power/Voltage */
> +     uint16_t                        average_cpu_voltage;
> +     uint16_t                        average_soc_voltage;
> +     uint16_t                        average_gfx_voltage;
> +
> +     /* Power/Current */
> +     uint16_t                        average_cpu_current;
> +     uint16_t                        average_soc_current;
> +     uint16_t                        average_gfx_current;
> +};
>  #endif
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
> b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
> index 067b4e0b026c..185d0b50ee8e 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
> @@ -1854,6 +1854,86 @@ static ssize_t vangogh_get_gpu_metrics_v2_3(struct
> smu_context *smu,
>       return sizeof(struct gpu_metrics_v2_3);  }
>
> +static ssize_t vangogh_get_gpu_metrics_v2_4(struct smu_context *smu,
> +                                         void **table)
> +{
> +     SmuMetrics_t metrics;
> +     struct smu_table_context *smu_table =3D &smu->smu_table;
> +     struct gpu_metrics_v2_4 *gpu_metrics =3D
> +                             (struct gpu_metrics_v2_4 *)smu_table-
> >gpu_metrics_table;
> +     int ret =3D 0;
> +
> +     ret =3D smu_cmn_get_metrics_table(smu, &metrics, true);
> +     if (ret)
> +             return ret;
> +
> +     smu_cmn_init_soft_gpu_metrics(gpu_metrics, 2, 4);
> +
> +     gpu_metrics->temperature_gfx =3D metrics.Current.GfxTemperature;
> +     gpu_metrics->temperature_soc =3D metrics.Current.SocTemperature;
> +     memcpy(&gpu_metrics->temperature_core[0],
> +            &metrics.Current.CoreTemperature[0],
> +            sizeof(uint16_t) * 4);
> +     gpu_metrics->temperature_l3[0] =3D metrics.Current.L3Temperature[0]=
;
> +
> +     gpu_metrics->average_temperature_gfx =3D
> metrics.Average.GfxTemperature;
> +     gpu_metrics->average_temperature_soc =3D
> metrics.Average.SocTemperature;
> +     memcpy(&gpu_metrics->average_temperature_core[0],
> +            &metrics.Average.CoreTemperature[0],
> +            sizeof(uint16_t) * 4);
> +     gpu_metrics->average_temperature_l3[0] =3D
> +metrics.Average.L3Temperature[0];
> +
> +     gpu_metrics->average_gfx_activity =3D metrics.Current.GfxActivity;
> +     gpu_metrics->average_mm_activity =3D metrics.Current.UvdActivity;
> +
> +     gpu_metrics->average_socket_power =3D
> metrics.Current.CurrentSocketPower;
> +     gpu_metrics->average_cpu_power =3D metrics.Current.Power[0];
> +     gpu_metrics->average_soc_power =3D metrics.Current.Power[1];
> +     gpu_metrics->average_gfx_power =3D metrics.Current.Power[2];
> +
> +     gpu_metrics->average_cpu_voltage =3D metrics.Current.Voltage[0];
> +     gpu_metrics->average_soc_voltage =3D metrics.Current.Voltage[1];
> +     gpu_metrics->average_gfx_voltage =3D metrics.Current.Voltage[2];
> +
> +     gpu_metrics->average_cpu_current =3D metrics.Current.Current[0];
> +     gpu_metrics->average_soc_current =3D metrics.Current.Current[1];
> +     gpu_metrics->average_gfx_current =3D metrics.Current.Current[2];
> +
> +     memcpy(&gpu_metrics->average_core_power[0],
> +            &metrics.Average.CorePower[0],
> +            sizeof(uint16_t) * 4);
> +
> +     gpu_metrics->average_gfxclk_frequency =3D
> metrics.Average.GfxclkFrequency;
> +     gpu_metrics->average_socclk_frequency =3D
> metrics.Average.SocclkFrequency;
> +     gpu_metrics->average_uclk_frequency =3D
> metrics.Average.MemclkFrequency;
> +     gpu_metrics->average_fclk_frequency =3D
> metrics.Average.MemclkFrequency;
> +     gpu_metrics->average_vclk_frequency =3D metrics.Average.VclkFrequen=
cy;
> +     gpu_metrics->average_dclk_frequency =3D
> metrics.Average.DclkFrequency;
> +
> +     gpu_metrics->current_gfxclk =3D metrics.Current.GfxclkFrequency;
> +     gpu_metrics->current_socclk =3D metrics.Current.SocclkFrequency;
> +     gpu_metrics->current_uclk =3D metrics.Current.MemclkFrequency;
> +     gpu_metrics->current_fclk =3D metrics.Current.MemclkFrequency;
> +     gpu_metrics->current_vclk =3D metrics.Current.VclkFrequency;
> +     gpu_metrics->current_dclk =3D metrics.Current.DclkFrequency;
> +
> +     memcpy(&gpu_metrics->current_coreclk[0],
> +            &metrics.Current.CoreFrequency[0],
> +            sizeof(uint16_t) * 4);
> +     gpu_metrics->current_l3clk[0] =3D metrics.Current.L3Frequency[0];
> +
> +     gpu_metrics->throttle_status =3D metrics.Current.ThrottlerStatus;
> +     gpu_metrics->indep_throttle_status =3D
> +
>       smu_cmn_get_indep_throttler_status(metrics.Current.ThrottlerStatus,
> +
> vangogh_throttler_map);
> +
> +     gpu_metrics->system_clock_counter =3D ktime_get_boottime_ns();
> +
> +     *table =3D (void *)gpu_metrics;
> +
> +     return sizeof(struct gpu_metrics_v2_4); }
> +
>  static ssize_t vangogh_get_gpu_metrics(struct smu_context *smu,
>                                     void **table)
>  {
> @@ -1923,23 +2003,34 @@ static ssize_t
> vangogh_common_get_gpu_metrics(struct smu_context *smu,  {
>       uint32_t if_version;
>       uint32_t smu_version;
> +     uint32_t smu_program;
> +     uint32_t fw_version;
>       int ret =3D 0;
>
>       ret =3D smu_cmn_get_smc_version(smu, &if_version, &smu_version);
> -     if (ret) {
> +     if (ret)
>               return ret;
> -     }
>
> -     if (smu_version >=3D 0x043F3E00) {
> -             if (if_version < 0x3)
> -                     ret =3D vangogh_get_legacy_gpu_metrics_v2_3(smu,
> table);
> +     smu_program =3D (smu_version >> 24) & 0xff;
> +     fw_version =3D smu_version & 0xffffff;
> +     if (smu_program =3D=3D 6) {
> +             if (fw_version >=3D 0x3F0800)
> +                     ret =3D vangogh_get_gpu_metrics_v2_4(smu, table);
>               else
>                       ret =3D vangogh_get_gpu_metrics_v2_3(smu, table);
> +
>       } else {
> -             if (if_version < 0x3)
> -                     ret =3D vangogh_get_legacy_gpu_metrics(smu, table);
> -             else
> -                     ret =3D vangogh_get_gpu_metrics(smu, table);
> +             if (smu_version >=3D 0x043F3E00) {
> +                     if (if_version < 0x3)
> +                             ret =3D
> vangogh_get_legacy_gpu_metrics_v2_3(smu, table);
> +                     else
> +                             ret =3D vangogh_get_gpu_metrics_v2_3(smu,
> table);
> +             } else {
> +                     if (if_version < 0x3)
> +                             ret =3D vangogh_get_legacy_gpu_metrics(smu,
> table);
> +                     else
> +                             ret =3D vangogh_get_gpu_metrics(smu, table)=
;
> +             }
>       }
>
>       return ret;
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c
> b/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c
> index 3ecb900e6ecd..cee5e32b4ff9 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c
> @@ -996,6 +996,9 @@ void smu_cmn_init_soft_gpu_metrics(void *table,
> uint8_t frev, uint8_t crev)
>       case METRICS_VERSION(2, 3):
>               structure_size =3D sizeof(struct gpu_metrics_v2_3);
>               break;
> +     case METRICS_VERSION(2, 4):
> +             structure_size =3D sizeof(struct gpu_metrics_v2_4);
> +             break;
>       default:
>               return;
>       }
> --
> 2.39.2

