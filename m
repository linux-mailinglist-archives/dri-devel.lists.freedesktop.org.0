Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFBF41B551
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 19:41:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 402976E90C;
	Tue, 28 Sep 2021 17:41:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2049.outbound.protection.outlook.com [40.107.237.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 437BF6E90C;
 Tue, 28 Sep 2021 17:41:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WSCedoqgYzJDG+NPZ9hXoYoh6wL4TJQI5q+NHJqCv3cccYYpBS0vJEbz0IQ61TEWrfUZ6A9GFBeWQ0aXByzZT978FtI0nB+Tny43gGr7aqaG7oG+1ghO+H9zxFpkcMozgD8B6P9nW5eBb5PU7Qo8xPtlp+QOJNzFh5JfO0FkhFScLKFtC5fSx6kLQuZB3ByMbtaPRN5R3zFsd2Ni8myR546xqxFr4ZBqk1lhbL/pgX+Qbl/SiiohVlNo+vnyEhkkF5YlS9mybtZuE6YUimiKSHdf3bMmQ51GDZnsyaO3ZqlBsaW3ZppSjNzu9OlJJ2qHARaDPmwKwf1rFv0aCxzWxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=FtUff0xslX2pTbwOzexwhpch8OQdmHMQB8v8z7yiRIw=;
 b=CV00jdDm0JAWaf1v7FwSobryEmL14Huw9yzuBxOEiFLVvqXtUnkkZd2l16rhSWLeMFUn7y1rljGsNIhrClDAF+zil9+NwGqS/1yw6ojvYOKjZTfJuc8VcDaZOuMZBdMlBeCyM4KLJESlEjl7P54GrBjtbMaglOjQZ/YMkVNK8dMd1gV3T4wYwd/rX3HLPTcPSYYpXpoDmx0Uj1q7TA0fjRqhfYsyWzhkmY64zbXHLQ7MHBLukksC/8qkPpWa6RXhaCA1OR0gm51ten3ytT/Yr62YItqtYDw6qU0pbbpuTL7cfBivN4goWTyLwmif/Pw85EtonLM9Sa/kASVqLL17lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FtUff0xslX2pTbwOzexwhpch8OQdmHMQB8v8z7yiRIw=;
 b=BLLFGharhDWb47AhlolnyeUhP+h9xnsQ6HBL1/GdQZQoLLoYRUZgpeKF10PrNd/R4LhB5LvUAW1X4i9m74YTybNtI/z3mdGjMBC8o2pC/QUt8jmkL+U+gCzrW1JYJoupo5TCVWZyGWbzJUNBphNVHVyZHleaWXl7xQ4LlknMX3c=
Received: from DM6PR12MB4912.namprd12.prod.outlook.com (2603:10b6:5:20b::24)
 by DM6PR12MB4236.namprd12.prod.outlook.com (2603:10b6:5:212::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Tue, 28 Sep
 2021 17:41:02 +0000
Received: from DM6PR12MB4912.namprd12.prod.outlook.com
 ([fe80::81f5:b123:f485:e51a]) by DM6PR12MB4912.namprd12.prod.outlook.com
 ([fe80::81f5:b123:f485:e51a%8]) with mapi id 15.20.4523.018; Tue, 28 Sep 2021
 17:41:02 +0000
From: "Zuo, Jerry" <Jerry.Zuo@amd.com>
To: "Wentland, Harry" <Harry.Wentland@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
CC: "jani.nikula@intel.com" <jani.nikula@intel.com>, "Li, Sun peng (Leo)"
 <Sunpeng.Li@amd.com>, "nathan@kernel.org" <nathan@kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "manasi.d.navare@intel.com" <manasi.d.navare@intel.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org"
 <linux-next@vger.kernel.org>, "airlied@gmail.com" <airlied@gmail.com>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>, "Wentland, Harry"
 <Harry.Wentland@amd.com>
Subject: RE: [PATCH v2] drm/amd/display: Only define DP 2.0 symbols if not
 already defined
Thread-Topic: [PATCH v2] drm/amd/display: Only define DP 2.0 symbols if not
 already defined
Thread-Index: AQHXtIuBFlvpmhltK0en+i8+7zHPUKu5tXmQ
Date: Tue, 28 Sep 2021 17:41:02 +0000
Message-ID: <DM6PR12MB49125AD4817D693AA3987B08E5A89@DM6PR12MB4912.namprd12.prod.outlook.com>
References: <20210928170828.26452-1-harry.wentland@amd.com>
In-Reply-To: <20210928170828.26452-1-harry.wentland@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=6d37b753-7317-49e9-b10f-7dd42dee753a;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD
 Official Use Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-09-28T17:35:51Z;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 37353859-e2c2-403e-b139-08d982a72446
x-ms-traffictypediagnostic: DM6PR12MB4236:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB42364799B1B6473F09492E0CE5A89@DM6PR12MB4236.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kWuOjczrWe1IwMbdEOM7ue2EzEn/+CPiCBmpTmOBys+EB9/GoihJw5ysx/NEmx6fYffrNHkvFc5RDod7p80F76nvbuEvL/otfafkSwpReGID31mrI/5FVOC1i1HHoIX68sXZU4Gjcd5z7DHkoBZjTN+Cjqjei2kUaO/k9jSHaOWfvgllpVctTq8V7Y36u5Bbv2SwQuE6to9lQ3A4hM3abMC8XZvqX+xaIf2Bhu6MXz1JLukjC+szCsiLx2ULiNcL8V0z2Hs0JSPUi6jVQXgeKJc1sGHe/wBoHAbKl8S9zw1e26cA7+uK+0Jt2vouH07NPSfXxtoS/WWsMZ9qU7dQ6Zi0VjPE8Z0/xG1lWcKWhFL8BDu3DhCCuHjyJh30Db9wNdRLlqdBvpfcsTvcOzIABBy4MRn8UYDWMCwfvAz1LfEBmF+2Qq0bgK9uC858L6x3RDKLjs9W4COxyxQEgtHTf0Rfx8rI4GmP0PNqqKV2zbRHX6OwQexyIdQOOADN9KAzsl277/NpTZWGAFoRd13K1ZeBQqgqlUwVnfRVXJ+TwiUtlNe+EzKAB9keLPPMJlhfJw06Nf54xLfQsp/692us69DnzaznN5rNjnFGuAGwxjpSOUR4oZ3rgxjeKsgM2OfWHI4a8Xg4wGncaNqSfBoxiU7n0vMMJgAKQs9QwXR3TVqUyg4LonEh5VEaaXQkk7S1bV1XlUKMczjrPGlY+nOfVw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4912.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(54906003)(110136005)(83380400001)(8676002)(6506007)(7416002)(5660300002)(38070700005)(53546011)(186003)(55016002)(7696005)(71200400001)(9686003)(66556008)(64756008)(316002)(76116006)(86362001)(52536014)(4326008)(8936002)(122000001)(33656002)(2906002)(66476007)(66446008)(508600001)(66946007)(38100700002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nv5zupAgF088nyoZTLl8V6MEn1evk3BAWW1hb/c+pnQhm1GXX5XbSJgtOu7U?=
 =?us-ascii?Q?Qjz59rEAzlOhucsLTYk7hA83gV1U9/R7mtv8m9R4wAUp2enLoUa7diidJYSO?=
 =?us-ascii?Q?MY73yEgMVQMm4UlI8cFzSTpAgr0WA/Ke/fzkX+mcuz4nn+W9UtK8vBF+mUWm?=
 =?us-ascii?Q?ok0JmJjWp45iHbROb4W9zqDmAC9UKcKp8WOC8S/cFullKCUZLaHecNArBYBA?=
 =?us-ascii?Q?CxQtLz/KSsszVEBQ9nAtlSeAnjVf3UQGhC52nSvXlIoDGPdcCiNBAV5scRAF?=
 =?us-ascii?Q?pclQKTNvegM1D1jQjBkH2kejcpTEcYYqUQQmaAEZd2Egp9HKtpc838v2b/uu?=
 =?us-ascii?Q?/BZa5Ku1bB/H1nJ+N+ge/C2SZXy3g8vo/7M3gM1Z/7Dx9eQNw6LndvYrnHVi?=
 =?us-ascii?Q?zWZhZBH6uKMXNANOezlwlRml4ONUTF3JSXgoGJCYGEFLjMQpaNpCDAtafV43?=
 =?us-ascii?Q?NjvIqmdo0Dsz//oJV88UPC+hEju9/4VRUirKckIAnfJm62TXaUQQwRGlnaGU?=
 =?us-ascii?Q?YhEZ04+Aglqzg6GkY4PGPnqv/OfTw1WHn6xrGWOh2hYNWnlIZ7Tdzc2jTTpc?=
 =?us-ascii?Q?pZoOSpjx73uvyBqFbbLMA15DxSoO4s7DuOrSJGThpW25xSrYtdEs1PdnPn44?=
 =?us-ascii?Q?7Bm4pqIlr7hxTEuTYSyW9J8sOuMFhpRYP4RGiL8CJ4PE3Tm7FiZsb7vWqh9e?=
 =?us-ascii?Q?3n8zhIB4zr2V+G9SuC9Llkw3pWX9rPbS/x037aTsn2qHSDF1oCxvwZkI3mRx?=
 =?us-ascii?Q?9YV1npN2vzItehOK3FjRl5D3DTF+sRLqnA4yQf/XsHYEF/sYQ5HybXUQLW4R?=
 =?us-ascii?Q?TzXx2ousle5KjldF+JLVv5ln+aYgoTcJ9MU7ghNfXUGB0lx9GZ9ZQm1/DAXg?=
 =?us-ascii?Q?OYhpprzOOVXqjJU2y+ZFZEwXVYYdiY7nm1ZDhZzoxlKiAMt6CuB5J2ZV3ABO?=
 =?us-ascii?Q?WJ0en+eNQuiMPMuX7Rthztw30NyegOnMeo7ScSAm8IvW6onDPjiH8Kaj0w7G?=
 =?us-ascii?Q?pI7Taf+njbR0wMsjxjjOQXxHCl8irMzHBYQPfOvUmP9lIRD63cFRSeyeX73P?=
 =?us-ascii?Q?k8T2yKoCdB06XB4EhhV49li9Wj+ZvlbWFjZ/tT3998ZEidI4s9n/WuhcDCMz?=
 =?us-ascii?Q?ZfR5yU+y6O5eiGi2mc0rqrLtvQi2nXVUc0g/A/AzS+wCo9c8ir7LmBG1B1X5?=
 =?us-ascii?Q?LFI29tf81EM3vWsq2Jml0MkeK1MPJGtQcwwGSiPlnrU56wrKLKpMGxrAqWkj?=
 =?us-ascii?Q?FQ97Q27pLUq36CLj5HVSIxVfv0yQ51PmcyBqWiDJaVVPAYPejwYOpEkGWNb+?=
 =?us-ascii?Q?PzhWElVRiwc8n+sRW+z679eijWYy7482PQNL4+LpXBeI+JqdGsOq2svtxbi6?=
 =?us-ascii?Q?N/J7lX2FTcKkFtKssK+AiSv5g17t?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4912.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37353859-e2c2-403e-b139-08d982a72446
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2021 17:41:02.7446 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wTdEllzF4e9laCTZaPHNlvCPQMiZvz+MBsH2CK+OupITG04Dta2T4zvVBbkxt+Gz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4236
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

[AMD Official Use Only]

> -----Original Message-----
> From: Harry Wentland <harry.wentland@amd.com>
> Sent: September 28, 2021 1:08 PM
> To: Deucher, Alexander <Alexander.Deucher@amd.com>; amd-
> gfx@lists.freedesktop.org; Zuo, Jerry <Jerry.Zuo@amd.com>
> Cc: jani.nikula@intel.com; Li, Sun peng (Leo) <Sunpeng.Li@amd.com>;
> nathan@kernel.org; intel-gfx@lists.freedesktop.org; dri-
> devel@lists.freedesktop.org; ville.syrjala@linux.intel.com;
> manasi.d.navare@intel.com; Koenig, Christian <Christian.Koenig@amd.com>;
> Pan, Xinhui <Xinhui.Pan@amd.com>; sfr@canb.auug.org.au; linux-
> next@vger.kernel.org; airlied@gmail.com; daniel.vetter@ffwll.ch; Wentland=
,
> Harry <Harry.Wentland@amd.com>
> Subject: [PATCH v2] drm/amd/display: Only define DP 2.0 symbols if not
> already defined
>
> [Why]
> For some reason we're defining DP 2.0 definitions inside our driver. Now =
that
> patches to introduce relevant definitions are slated to be merged into dr=
m-
> next this is causing conflicts.
>
> In file included from drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c:33:
> In file included
> from ./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:70:
> In file included
> from ./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_mode.h:36:
> ./include/drm/drm_dp_helper.h:1322:9: error:
> 'DP_MAIN_LINK_CHANNEL_CODING_PHY_REPEATER' macro redefined [-
> Werror,-Wmacro-redefined]
>         ^
> ./drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dp_types.h:881:9: note:
> previous definition is here
>         ^
> 1 error generated.
>
> v2: Add one missing endif
>
> [How]
> Guard all display driver defines with #ifndef for now. Once we pull in th=
e new
> definitions into amd-staging-drm-next we will follow up and drop definiti=
ons
> from our driver and provide follow-up header updates for any addition DP
> 2.0 definitions required by our driver.
>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>

Reviewed-by: Fangzhi Zuo <Jerry.Zuo@amd.com>

> ---
>  drivers/gpu/drm/amd/display/dc/dc_dp_types.h | 54
> ++++++++++++++++++--
>  1 file changed, 49 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dc_dp_types.h
> b/drivers/gpu/drm/amd/display/dc/dc_dp_types.h
> index a5e798b5da79..9de86ff5ef1b 100644
> --- a/drivers/gpu/drm/amd/display/dc/dc_dp_types.h
> +++ b/drivers/gpu/drm/amd/display/dc/dc_dp_types.h
> @@ -860,28 +860,72 @@ struct psr_caps {
>  };
>
>  #if defined(CONFIG_DRM_AMD_DC_DCN)
> +#ifndef DP_MAIN_LINK_CHANNEL_CODING_CAP
>  #define DP_MAIN_LINK_CHANNEL_CODING_CAP                      0x006
> +#endif
> +#ifndef DP_SINK_VIDEO_FALLBACK_FORMATS
>  #define DP_SINK_VIDEO_FALLBACK_FORMATS                       0x020
> +#endif
> +#ifndef DP_FEC_CAPABILITY_1
>  #define DP_FEC_CAPABILITY_1                          0x091
> +#endif
> +#ifndef DP_DFP_CAPABILITY_EXTENSION_SUPPORT
>  #define DP_DFP_CAPABILITY_EXTENSION_SUPPORT          0x0A3
> +#endif
> +#ifndef DP_DSC_CONFIGURATION
>  #define DP_DSC_CONFIGURATION                         0x161
> +#endif
> +#ifndef DP_PHY_SQUARE_PATTERN
>  #define DP_PHY_SQUARE_PATTERN                                0x249
> +#endif
> +#ifndef DP_128b_132b_SUPPORTED_LINK_RATES
>  #define DP_128b_132b_SUPPORTED_LINK_RATES            0x2215
> +#endif
> +#ifndef DP_128b_132b_TRAINING_AUX_RD_INTERVAL
>  #define DP_128b_132b_TRAINING_AUX_RD_INTERVAL
>       0x2216
> +#endif
> +#ifndef DP_TEST_264BIT_CUSTOM_PATTERN_7_0
>  #define DP_TEST_264BIT_CUSTOM_PATTERN_7_0            0X2230
> +#endif
> +#ifndef DP_TEST_264BIT_CUSTOM_PATTERN_263_256
>  #define DP_TEST_264BIT_CUSTOM_PATTERN_263_256
>       0X2250
> +#endif
> +#ifndef DP_DSC_SUPPORT_AND_DECODER_COUNT
>  #define DP_DSC_SUPPORT_AND_DECODER_COUNT             0x2260
> +#endif
> +#ifndef DP_DSC_MAX_SLICE_COUNT_AND_AGGREGATION_0
>  #define DP_DSC_MAX_SLICE_COUNT_AND_AGGREGATION_0
>       0x2270
> -# define DP_DSC_DECODER_0_MAXIMUM_SLICE_COUNT_MASK   (1 <<
> 0)
> -# define DP_DSC_DECODER_0_AGGREGATION_SUPPORT_MASK
>       (0b111 << 1)
> -# define DP_DSC_DECODER_0_AGGREGATION_SUPPORT_SHIFT  1
> -# define DP_DSC_DECODER_COUNT_MASK                   (0b111 << 5)
> -# define DP_DSC_DECODER_COUNT_SHIFT                  5
> +#endif
> +#ifndef DP_DSC_DECODER_0_MAXIMUM_SLICE_COUNT_MASK
> +#define DP_DSC_DECODER_0_MAXIMUM_SLICE_COUNT_MASK    (1 <<
> 0)
> +#endif
> +#ifndef DP_DSC_DECODER_0_AGGREGATION_SUPPORT_MASK
> +#define DP_DSC_DECODER_0_AGGREGATION_SUPPORT_MASK
>       (0b111 << 1)
> +#endif
> +#ifndef DP_DSC_DECODER_0_AGGREGATION_SUPPORT_SHIFT
> +#define DP_DSC_DECODER_0_AGGREGATION_SUPPORT_SHIFT   1
> +#endif
> +#ifndef DP_DSC_DECODER_COUNT_MASK
> +#define DP_DSC_DECODER_COUNT_MASK                    (0b111 << 5)
> +#endif
> +#ifndef DP_DSC_DECODER_COUNT_SHIFT
> +#define DP_DSC_DECODER_COUNT_SHIFT                   5
> +#endif
> +#ifndef DP_MAIN_LINK_CHANNEL_CODING_SET
>  #define DP_MAIN_LINK_CHANNEL_CODING_SET                      0x108
> +#endif
> +#ifndef DP_MAIN_LINK_CHANNEL_CODING_PHY_REPEATER
>  #define DP_MAIN_LINK_CHANNEL_CODING_PHY_REPEATER     0xF0006
> +#endif
> +#ifndef DP_PHY_REPEATER_128b_132b_RATES
>  #define DP_PHY_REPEATER_128b_132b_RATES
>       0xF0007
> +#endif
> +#ifndef DP_128b_132b_TRAINING_AUX_RD_INTERVAL_PHY_REPEATER1
>  #define DP_128b_132b_TRAINING_AUX_RD_INTERVAL_PHY_REPEATER1
>       0xF0022
> +#endif
> +#ifndef DP_INTRA_HOP_AUX_REPLY_INDICATION
>  #define DP_INTRA_HOP_AUX_REPLY_INDICATION            (1 << 3)
> +#endif
>  /* TODO - Use DRM header to replace above once available */
>
>  union dp_main_line_channel_coding_cap {
> --
> 2.33.0

