Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E59915BC629
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 12:16:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 461E710E5EB;
	Mon, 19 Sep 2022 10:15:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63DEE10E5F1;
 Mon, 19 Sep 2022 10:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663582537; x=1695118537;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=C4GIvc16waJE8y7Hcp1afnbOBWL5MAb6pbW90kjjBFU=;
 b=is+9bCKvp++wXPaeMShHhtJ+p3QyzK8FMr59hSie7U8jN190iX9jJpIp
 1XO0PRRBkpHrpRRMIwiwp+kd4CG1epGYKHW76ffQwRa1WoauZiyh1yiPz
 q/kONHyXYYkqw1v0m6+lnWg5cye24rC3HO8w5HFCqxM+dc6aaeQBEVEfM
 16786FICmYGdMZCxV1hB7PLhRc9dpj0CU/uRuCuiMcUhzZJ3kF6PZTx5R
 wwV+SlSN+9ARYPjB1MD2WwD1hSfc+Kdjmen3mGxN6rllW/3Tydxbd5wfZ
 XSzB7a63vpXChzw26opZfWoiIQ7TzAcpRfDpN4utlkRPXoFrkAUEU2nbC A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10474"; a="300179911"
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="300179911"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 03:15:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="613942585"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP; 19 Sep 2022 03:15:36 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 19 Sep 2022 03:15:35 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 19 Sep 2022 03:15:35 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 19 Sep 2022 03:15:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=enrhyp+iVGakihGrHYbu52Vlp8ac5rqal6A/u679Aeu4oRUgUqix/aiKIy7sRrtMUM3jgl+0oDTVnQTNgBY27sUclZ0ZoZC2RJlqam0ul5bCxetgPttA6RFHRyWWece8ngoaeCS93KE6LM9z4+PbqhgxenPjq3vJDMtGNGPm/7658F545F0OMd0G7QtL4JAioyS93AKHgzV0zVkrS4Hhly54KEBZyk2n9djZ6z1Z+h6ITu3kJcN+XOb3fHNy3ZZOJgPDKIBcNmLItxMOqcqlbwA8WOKFv3WBsq7gBGyUAkOdGihdcOoRalQYOKLtrBldiWw7EcGNZT09ZXbEyJ+8nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l57HgtUdDu0HFS1zd8dhpB9Bs8GQnQoN+p2gOGxgSCA=;
 b=NdxnFk6rf9jGD2TWEWn2RHyiPg0/Ii25y+fKaLAt2QUcYzU4J5wQM28Ocq4HYSVTudvptPBtZihjAvZDzilIiIJYbgrFKhyBt1+UZzjtkPNFB6+T1ZtQI35myolAVotPQ9X4z8zJM6xXe5Ch+3jo6CeeLIEo9ZXaf1Q2WFqLKYHk/SF+V9mKIzEtcEBde4c6E+pwRDQjc2t+5cmKjzXoZClC6Kz+YuAn6/iG/Ke/wxtDg85/RF1WrnoPhBd8Yh3aOL26Llb45AyMGbIvVKQHWL5C4WhVax+CDr7fQCxlUCCHP//+5FYlPaYaJrCTxSd6ORA1y+KUf4DNlV5p4tqvpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by SJ0PR11MB5055.namprd11.prod.outlook.com (2603:10b6:a03:2d9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Mon, 19 Sep
 2022 10:15:27 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::6d1c:5833:c6ab:f244]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::6d1c:5833:c6ab:f244%5]) with mapi id 15.20.5632.015; Mon, 19 Sep 2022
 10:15:27 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 0/7] drm/i915: Add HWMON support 
Thread-Topic: [PATCH 0/7] drm/i915: Add HWMON support 
Thread-Index: AQHYydzHEtca8SVS702ipPu770ACeK3mjVbQ
Date: Mon, 19 Sep 2022 10:15:26 +0000
Message-ID: <CY5PR11MB62110C704EA65EA5A764FCE7954D9@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20220916150054.807590-1-badal.nilawar@intel.com>
In-Reply-To: <20220916150054.807590-1-badal.nilawar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.500.17
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|SJ0PR11MB5055:EE_
x-ms-office365-filtering-correlation-id: d717c228-9363-4ab0-a282-08da9a27df7c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6icWjdDFCtWCisSSZMSV3P+R9tZEBVlYMzssSPwwyUFOy6WwxMtoK4IwCAzqIq8jTYS2CI3dyswVyD/BFgP82efCe5bQmDW2G77vfORxR1eS+r2r3dHEQct6wXP/ymOtOvQnAMq5PcQ9QBcD9sfeB19N5pPH9xLSLtMA3kLpgtA1w/I3oPo92eNgNC1JmROSHqD//CrDHeSTQHHgAkHDoW52fy9y6qlpPCjIHHCoCdaDr/iqX8p61/RG3x41KqDShu/zp5eKZrh2ReVt5CDGdVQzSJHBofacvEV3yCn1hE0kDif/CGhnUHAKqiF3yTfBkZXzD67ixncrD4mv/3fbi8A2v9ixtKR0J2dYGfxn94z6gPemZJHZ7UzyXgeo5xBQRPq5YAzMd+RAKQTqhGnEy7GzJdwTbwgdiMaHnfiN/nl/6iDfB+bsQaEHFQasva9ro+r25lUDNYbbVYserKtAN0vsvHfsCCaMpRFxKpOAPHlWQP4IWqSS2S0siEJVqwvkIwxmDpNsCqQohhr7kT7nJwQkqOC5xMuYM7JPS4HEi8xoMQWL1XyxuZ0wgHkiJKVVaTWN/nC1WIccVX8U9hYOMvTsL+z38jOOvqTE5AfuLfDPd8AV9WfCp6zk0hUiSUvEOO4t8RHGlbQ2A2TlFer4vIW5gHle/GzhRBb79Ze3crF/q25nVZiX6vxEQc3lxcVGlAhGQfxvCmUgthtX8IkwKIHmPbNP82H8oCqMWKtrWtgXxAimUpCPqudlCN8UE2G3OxajbSlibdBCFg0ZPP3THQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(39860400002)(346002)(376002)(366004)(396003)(451199015)(5660300002)(186003)(316002)(4743002)(52536014)(54906003)(53546011)(55016003)(8936002)(86362001)(38100700002)(55236004)(26005)(76116006)(9686003)(6506007)(38070700005)(7696005)(4326008)(71200400001)(2906002)(82960400001)(478600001)(66556008)(83380400001)(110136005)(64756008)(66446008)(66476007)(33656002)(8676002)(66946007)(122000001)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wcDPKOj87wXTeg9MeAci+2qL1/U77bQMlqnT5BbzZR5U4KoDm2unfEeqW8Yt?=
 =?us-ascii?Q?3aNOMWj4Y7R8i6wonN/jwNt7CamiqOFYruOfl6u24hAKCJpKn5gYU4izsiNp?=
 =?us-ascii?Q?g2x+jDXlt8DWjbAT98Mv8csPGLHYP7RKa/rYUgUygpcpamn3TedVU54+lTG0?=
 =?us-ascii?Q?iRVBCEL0gtDpypZAO8W5AYGd0Y0BnUNkDb0ofxz67j+iuVUs4e2twN8B4DP+?=
 =?us-ascii?Q?4F3IeZHNZ05fKAH4zTHPjrOgTxVVwu/rzbPvN72sw91ZOaMIVeG+2/TUWQv7?=
 =?us-ascii?Q?Hrp9PjscTMLqkcRk1vH6CXQKs2kgfcZyBLG6/GmV/6DEJwmDszg5upyvYfUg?=
 =?us-ascii?Q?1+4S24yiSrl9CXT/9VEzHzP4zEcpbCOOBP7ox9xhLSEIrzrDo8bf6HjxjQNE?=
 =?us-ascii?Q?562Ag97AMy2abgS6xiSuLfLFj2JyOJvyodUgeDUhuQwF9QrE30p5w0umQx7u?=
 =?us-ascii?Q?/797IurQxwSbe5eMuB++G9lRzT37iu4PIywS+TENlYc/nMXsjByaWJpTwpMW?=
 =?us-ascii?Q?5Ueca9L57vb6Ou0W49vYHDEgh4QO4+GHMxtC+wfi2kEq2nWz/xBukiDjpZRn?=
 =?us-ascii?Q?Eubrl96uTiBTVF0z3dPJnSr+dCVy96Ju+msxvF4AYoz/kn4LWOB3z8pKXIGv?=
 =?us-ascii?Q?HTLyqBNLR8B2rU9s/DTO0h5xzvbzluAk4nrVmsH6exo0N4Qw4m5ZiYlGKak2?=
 =?us-ascii?Q?0wFfdN8YJx/DN1grsuDOY2RCCLYP22YAfJTRCRIk5z7YJiu9ckHY8phYChjx?=
 =?us-ascii?Q?lYIb9fEJJQi9dost6PUJFajVEbBuhwCnIzaDV6Sg80TT+PbChHJCauUZguun?=
 =?us-ascii?Q?oVtaze1P502uZ46j5jvha0IQpppmIbhZCVizK0L8Kcc9zGg8ShioGGiZuBaV?=
 =?us-ascii?Q?/+uesEvmCrQowtMkIRo3/p8UY20Ucj1R0wjFVjai+nsOLRqsKxK0cGlr+V/u?=
 =?us-ascii?Q?vHIYYuIRtAtUa75FqPc6U7lPmPyBrHGv7HJ9nUZlqnyNvvqdybyq9F28+zji?=
 =?us-ascii?Q?X+DBxqXqHQPYg5FXptdWO7w+hpIuxyGqYz4pPj/EmXoLOMJMeBkf7Wlr1lYt?=
 =?us-ascii?Q?Md+/rJHmMO9H377oa6e2smBN0mkBoNxaxOJ4DcMcMhpq9zig4Or/jvMxW7ES?=
 =?us-ascii?Q?Va77RvfgyYK8wfuTsCUf/TYv7y7XFExWb9PzvHjYsAH2qF7T9PA6N0Rwjqrd?=
 =?us-ascii?Q?fqSksa9TBdWFfEWiDPrYhQnJz5RMBiV/BxuM7Zu3KImcXj6FRlkRi2aeEnUA?=
 =?us-ascii?Q?/KUSAA2MTlJvckFmiL6rxL8C3ri6NkuYKDoNMgf1HLKSbDk5YfThqu63lWP6?=
 =?us-ascii?Q?rEN4VbFkuZx9tnr/Aa4iPOLYk1/hsXTkOYrJz2fkxeFo2znA/LLFhJTxUuYr?=
 =?us-ascii?Q?qFJoN/L9300pS3rRpnDciKB23H7cEDUzIU2Gd3Imw89e6NEejkx3i9nDDy+2?=
 =?us-ascii?Q?laa45f41VKM+wc7fhHfCMEbP+51VQrIbNVjyBfWlSLmBhh+jlhzOoEHLgutt?=
 =?us-ascii?Q?tjMkOyHGcN8on4FhMfpXjANiJoMXybLkUnpsAvqhhtfXO4cK2JoNRNEYEcs8?=
 =?us-ascii?Q?lXkxKXm0qVvxZ1L+Esu1WHPbATlqZdDxVoxn1sPl?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d717c228-9363-4ab0-a282-08da9a27df7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2022 10:15:26.9610 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bjiQo94qOiizFreFWkXl6iR1GU3qeAZe1FgOTb8vkQI07R1oPYy+erdpaf9bmO2Hf+OBCDKuuGD07vYTBNEt+n6gyZz0ULlyOX9gInwFniI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5055
X-OriginatorOrg: intel.com
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
Cc: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, "Ewins,
 Jon" <jon.ewins@intel.com>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Tauro,
 Riana" <riana.tauro@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Nilawar, Badal <badal.nilawar@intel.com>
> Sent: Friday, September 16, 2022 8:31 PM
> To: intel-gfx@lists.freedesktop.org
> Cc: Dixit, Ashutosh <ashutosh.dixit@intel.com>; Tauro, Riana
> <riana.tauro@intel.com>; Gupta, Anshuman <anshuman.gupta@intel.com>;
> Ewins, Jon <jon.ewins@intel.com>; linux-hwmon@vger.kernel.org; dri-
> devel@lists.freedesktop.org
> Subject: [PATCH 0/7] drm/i915: Add HWMON support
>=20
> This series adds the HWMON support for DGFX
>=20
> Test-with: 20220914140721.3500129-1-riana.tauro@intel.com
CI-BAT is failing with this series,
Could you please check the failures, whether related to this series ?

Thanks,
Anshuman Gupta.=20
>=20
> v2:
>   - Reorganized series. Created first patch as infrastructure patch
>     followed by feature patches. (Ashutosh)
>   - Fixed review comments (Jani)
>   - Fixed review comments (Ashutosh)
>=20
> v3:
>   - Fixed review comments from Guenter
>   - Exposed energy inferface as standard hwmon interface (Ashutosh)
>   - For power interface added entries for critical power and maintained
>     standard interface for all the entries except
>     power1_max_interval
>   - Extended support for XEHPSDV (Ashutosh)
>=20
> v4:
>   - Fixed review comment from Guenter
>   - Cleaned up unused code
>=20
> v5:
>   - Fixed review comments (Jani)
>=20
> v6:
>   - Fixed review comments (Ashutosh)
>   - Updated date and kernel version in documentation
>=20
> Ashutosh Dixit (2):
>   drm/i915/hwmon: Expose card reactive critical power
>   drm/i915/hwmon: Expose power1_max_interval
>=20
> Dale B Stimson (4):
>   drm/i915/hwmon: Add HWMON infrastructure
>   drm/i915/hwmon: Power PL1 limit and TDP setting
>   drm/i915/hwmon: Show device level energy usage
>   drm/i915/hwmon: Extend power/energy for XEHPSDV
>=20
> Riana Tauro (1):
>   drm/i915/hwmon: Add HWMON current voltage support
>=20
>  .../ABI/testing/sysfs-driver-intel-i915-hwmon |  75 ++
>  drivers/gpu/drm/i915/Makefile                 |   3 +
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h       |   8 +
>  drivers/gpu/drm/i915/i915_driver.c            |   5 +
>  drivers/gpu/drm/i915/i915_drv.h               |   2 +
>  drivers/gpu/drm/i915/i915_hwmon.c             | 761 ++++++++++++++++++
>  drivers/gpu/drm/i915/i915_hwmon.h             |  21 +
>  drivers/gpu/drm/i915/i915_reg.h               |  14 +
>  drivers/gpu/drm/i915/intel_mchbar_regs.h      |  12 +
>  9 files changed, 901 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-i915-hwm=
on
>  create mode 100644 drivers/gpu/drm/i915/i915_hwmon.c  create mode
> 100644 drivers/gpu/drm/i915/i915_hwmon.h
>=20
> --
> 2.25.1

