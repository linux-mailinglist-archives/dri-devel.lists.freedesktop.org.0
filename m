Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 540C1A2A123
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 07:43:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0861F10E203;
	Thu,  6 Feb 2025 06:43:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K3xnINkH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4F0310E160;
 Thu,  6 Feb 2025 06:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738824179; x=1770360179;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gWguxm7z6iZvs3g7ySSXwgAx4D26EmwU7/j6I45dAW8=;
 b=K3xnINkH4MKb94pNTMWrmg3yGxOOjxbuaNYQOnBb3g6zqaddMWpWNN2/
 /vfsp+9zM6PwnpYZcKDBXSyy2o6h7LVRr/omk77hjr2+SOAx1xOdwUGRA
 ixOjAD9g8Vis2C7dqGw5uMve14qZTM0NG5KqTOnZenNW0IDWJetRqrqOB
 DX/j8hPTJ951Pg8mXQCzuXBdS9NvDIiYiiOlh3qPM3Y4Nredp657SVio1
 BPM2cmz328vV04kukKcIMMwETzJfsW7EXp+SCV9HL3LLEOVNB811YgESQ
 pSUUFeNdPQI3dTUFebJeTgReaTMS8QPmEmacdYiczhQ2taLC48ifQXot9 w==;
X-CSE-ConnectionGUID: u5E/kJhMSjyNghVndDlytA==
X-CSE-MsgGUID: r9Q61e2+TCeBcxyX7lqjLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39308785"
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; d="scan'208";a="39308785"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 22:42:58 -0800
X-CSE-ConnectionGUID: IStCSuWjTfqwJ5XPH/Rsmg==
X-CSE-MsgGUID: mFAcb9BoSMiynM/+akiYZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111567991"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Feb 2025 22:42:58 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 5 Feb 2025 22:42:58 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 5 Feb 2025 22:42:58 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Feb 2025 22:42:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D3NIRlq8RP4az8NRMFQfkftjCcZ9+G53LXoZcqmV04AcQmdUVBugRGyVpA/tZyFe5o+qMHBINd8rEAPDf6TWyKXYW9S4Po4gXAWs16dNMJab0o3zq+gCMKx3dJ/iN+t7eNpdzbocsd8gbZMVKOn3DCIfP0vXJRCWziP8TAyysljhsGZ3+6KTd/CJXM4BeGii2TaS9wzCd2FsaMTbyPT0k/Ahy+PF6OcfKfpD4qX9l/JkiAbdFB45WSiAXzwt66H8DEQ8xBFhNWL+zbdOEnZXtUT8TCwbtlkYRt2u8JxB1bd+bD19A3jEHUUSLINLH+Tf98OzIqmmIZVe27OkqVq2XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KNqBA0KW3RxHdfR5GoKxxv0vKhY6yUwzKkb7OrXddPM=;
 b=S+f5qyAS+Y7WXuohMCLI9g0DQiiJBXEa3+56OlcJfY5iPLmHy/NeSuiOtAYA9ZD0+yKhJLrP7G6mvW1ZscIwwb/YzM8xrN4pHyJc2u9y3aQBqBVSotEeRg7Wu6mJEesdoqtoE+7zWTrTj7VjJFDIzhRi6OdHaMx/mDH3Jnwi9c3csS5Wqf1JcrRN9Q6sEnta4YyTxUunkmdcADCWgz2V5ZL5KTmTcX+PGs8aYnXlyReLWvALvWPDLri415wwabFp77/OU4uXGtx/I+0AEAm72Ljb73i4Pz0YZ6WuANOoR3chLFGHWHsAODi6yWSiYlW+V9LtfcSn3tIek/hs3tVmIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by MW4PR11MB6716.namprd11.prod.outlook.com (2603:10b6:303:20d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Thu, 6 Feb
 2025 06:42:40 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%5]) with mapi id 15.20.8422.012; Thu, 6 Feb 2025
 06:42:40 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Shankar, Uma" <uma.shankar@intel.com>, "Kao, Ben" <ben.kao@intel.com>
Subject: RE: [PATCH 2/8] drm/dp: Increase eDP display control capability size
Thread-Topic: [PATCH 2/8] drm/dp: Increase eDP display control capability size
Thread-Index: AQHbeGEEk1ImNMyeiUGA6vITObIrHbM507EQ
Date: Thu, 6 Feb 2025 06:42:40 +0000
Message-ID: <IA0PR11MB73074C21AE5D2F7F1157A88CBAF62@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250206063253.2827017-1-suraj.kandpal@intel.com>
 <20250206063253.2827017-3-suraj.kandpal@intel.com>
In-Reply-To: <20250206063253.2827017-3-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|MW4PR11MB6716:EE_
x-ms-office365-filtering-correlation-id: 38fd0af1-505d-4286-b701-08dd467973d4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?E/O0pyBJb5uqQgiX5KJwQfDFX36hhlbDc2viXAfDNb79z0XCb+ISfwfH4H4k?=
 =?us-ascii?Q?3c85yzVORKBHQ/ZKQE6x/bLvG09DiFMFZ6L9pOa5Rfi9p2/iOE+iAi37Gft1?=
 =?us-ascii?Q?Ttm5dIwV8tiNZ4Vsv5eik/7iLGpME8KwIa2Rp7tVi0SgNlqrdOGWn/ljozk+?=
 =?us-ascii?Q?i1/nm0jMK8IoH4LQeeRW7YRyP8gJCAB+ZmoXk9F2c3+ET15cVMlFkJpRpF+O?=
 =?us-ascii?Q?ogsKgTf+wBT/nuYmtNv1R1a3tXtMjOuuNSv4950CV3tBw8srdTaRIiPrFvIk?=
 =?us-ascii?Q?LUVKKSjV6wnaINNtTPhndzPqeJsZoRWDP8MSh1jnp7ar9Mkj23WRsdLRVhIv?=
 =?us-ascii?Q?oljhfXs5TtYAZ4GJsQfKCzpEL1IW9AaTGxbcRneD4P3V4obM51lRJIce8utH?=
 =?us-ascii?Q?G1aijKF/x2PXXVDriinbSlFa6rWoExWz2RLaRsNJjZVTDdIpSd5Hus1TXzdr?=
 =?us-ascii?Q?VGMG+mdV7AA28gydiJsJ0eqeIgKSuCFHsnf8uts4ICpx9Sxq30rHvupb7W69?=
 =?us-ascii?Q?70JhyD8+WfjjUsoKAopukG3F6uaiY1GLqsVA23dBHQsnl7aJEtamXtddlosi?=
 =?us-ascii?Q?QNfaYhbdr5ParPdnSFAMqlCHXQiHTFqWsqBv4vllAl2rOqNccgFOEeSrZ+bJ?=
 =?us-ascii?Q?1aTsXC5z3jJQVASqJDGDWrEb9YwnodURddqBa3WXxOnewgB/rBdziEP79GCJ?=
 =?us-ascii?Q?bvfkJGmeLSdV8m1OXHwLjYCHkX43Cs3dclQNAQ/3zIqKWeesSoXcgmRayQqU?=
 =?us-ascii?Q?IkidGft9gxFpG/Li34V0ZT0ZVopuoQnUstz47tNfTTF+Q5loPmxPs4yRXFAs?=
 =?us-ascii?Q?Cihh/+yg3nH+WFdGFt6SaeaxGh6NLeb8fzGHi5NU8EBGP2A7Dl5Y1LBzr+Gq?=
 =?us-ascii?Q?MAH2PeySXoX41LIpD9dZhv4kbOa0jmlXghu83ku966xkmZkir05NzDlkD38h?=
 =?us-ascii?Q?RcUWjaorWn3Q6EYnMu1ZH/KRBVUplfXwExaxejX/vI4n3iUrXeDIBcfNPutz?=
 =?us-ascii?Q?DDinjbgvbKeq3nAdSPTmBm10tBYs9EV1hc17SxBIlEMvkzdwuFLhFTQvBFA1?=
 =?us-ascii?Q?nbM1RQ1R1Cs5AfqTP5/xD2E+oHcpZcqgMdUnQ4aFRHLbd8hbu0Jmo+rbXXPz?=
 =?us-ascii?Q?5fytodE5xadJEENKxjSUR+yFvc9IsZ3/8k0WnxyAzOFL5lDSKDaICfCL1djz?=
 =?us-ascii?Q?5gflpauYZQ6Mz3F1gC3SLRa+DrpMJxenzcZqgZ0z3s87qXnXqSC2QJPRxu6s?=
 =?us-ascii?Q?kArEb5Xu1hMJzLaDaoxkE4W9YY2c1RM87ELZuYhUq+VCnqFNG8+z7gn2hlWy?=
 =?us-ascii?Q?T8DlL63R/e5hzxBbor9266P9sYL9A+thzGmsnyhwX37MFfdqgC0JKJ8a9VNs?=
 =?us-ascii?Q?nRIeb18KhjFo2eNdyamzulp00YB3PsfIHE3Kl8VR8ENmBrIoJ4x61FaTv1Ph?=
 =?us-ascii?Q?4C2sawBOOwjlHYtTzzmzBJJsvc0l2yFl?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vE2+ZfJ59bGDUhHpWHwBNKuyka1U/AZ5d3rlWQjhVHbMn8Yl1y906nSqySle?=
 =?us-ascii?Q?xy7prul+70fVCZR2kFE+AJnT5b0ljHiD81LQJTWfQG9gXyw9lQIaxEk2amjh?=
 =?us-ascii?Q?eyDhuglhTAXtvvMu5if4qK+Y7sd+FxvlvecR6dAmhXkhvpTUjTVFTSaxVDuz?=
 =?us-ascii?Q?Tu7sgK8MAluwWVCx0i0DBjfAaZbBxNGJiq4zfsxkWonxxvs/G/yTvSWC0C6G?=
 =?us-ascii?Q?qQ/btGESBOpiEV9lNqu6iIVZuzcS/V39sn1uu76pwNYKIV6Shl/ZTBEAE/HX?=
 =?us-ascii?Q?CHukJPNUsIPWXhXgULWhRVSqHH3m5l5ItZmb5T7PI9x0BC/+7I9WenytF0sX?=
 =?us-ascii?Q?aQQt9tHQypKoIlLKhQSoCilYuS/n/MX4ykF4cx/7hpimqSiqW7NskTaoOdqY?=
 =?us-ascii?Q?bCyISTZqShk4LPX99Hhv4ZmEGJAhXki/Ik9mGxu7PrVPwwLNUKjbgeETBGwc?=
 =?us-ascii?Q?aX2BvtJ14VQ98qMMTHFMGuM2Dz/f1XFqBlQtwRUvmmCl/Ad6LamVpONbSKJF?=
 =?us-ascii?Q?1ao1DRMqZfjsivTMPD1slckqtrYvLD7nTz5/HkhSXihAtyhyfKH0aoPMVZNS?=
 =?us-ascii?Q?JJIebgUsNSvCtMPpxclwTegobjkkewzgLC2GFPXoAMCeBdaGfGG4gd6xJ3ag?=
 =?us-ascii?Q?vZUCfwOejzb7P70+5m70HhxOgLWrKl1PnPdJNqD37kA0XaLqQvwTIOt7P98e?=
 =?us-ascii?Q?40J3SPaHyVMZPJ1IhoeuViXWMTuXXiFvBCQAq/C0za3vZftl3aY22wmUEbIF?=
 =?us-ascii?Q?xDh3k1HQvtvL1i8h3ANbraLLbs8boU1FlBmBtA84OB6h4pJdxm1b63N7Xo1E?=
 =?us-ascii?Q?DeisYFftUQzxp2yBhNRXxU58D1digOWl0y5QCLetF1ZAFwfWAQSLfV6Jzkdo?=
 =?us-ascii?Q?anc2e3X0/aYeapCF7c7Fn5QVHXHttVIyWxo/YZe2wkLPJL/tGq//tIUuDlH9?=
 =?us-ascii?Q?sDyRqnAY9G6GflScexdwz9eI/nLxlmn2SL0fzxPDptSbZssEtrtKZgKcSs95?=
 =?us-ascii?Q?RwLb8K0f41JJiFcgRTCpxMks3agBtwLO3Z3Du0Bu2KltdD2knYTNYQDNyF2p?=
 =?us-ascii?Q?KXisSOThW8i+djQzgFgMHsAEzx1tUJ0rslDsp2F8d9pcczAC9NiNw1My96qk?=
 =?us-ascii?Q?fdQbSdZFHY9xLpipAdF/Q1OmWHzPk5NknxKU+thz3sZZSt2hg7iPtsEkReFF?=
 =?us-ascii?Q?THg5W6LGSv61yoM9QWI01EvVZMZ1E4BwcYCIvtvv7VCSFRwVzQNm7pCRh0aQ?=
 =?us-ascii?Q?mDchfjxiXV4iGSIg5A1Ce3yQo6rgUARekl7fBI/TdBtNKHuq8DMeXLvVWln0?=
 =?us-ascii?Q?bd3/qt2PwdhC91CqZ7q7jZ8hu8uTpmQQhxrzlKiB5836Dq7lGtLrrdv124ew?=
 =?us-ascii?Q?3eWY9OmzLFPyGSfoPT7VftmB98zzgVKT6o0M3ENwyggXV7oIlLl2hhQ5XVC3?=
 =?us-ascii?Q?ao6GKGvjqRNUvyPH85Uw//dakNDGvIFzkSIxBThGyh8QRVwKtrTu9kNEqDYp?=
 =?us-ascii?Q?koIMzv6zKtrji2DtQpg4Ee49GCuj/Tg7U+308EA5dCLaJPcqvQL4sR4HsKhp?=
 =?us-ascii?Q?PceP/TGuivFWt/ltATAZqc9BUWbm2uXcKp6oW0Ue?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38fd0af1-505d-4286-b701-08dd467973d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2025 06:42:40.4586 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: StauhYC350DZxHoaIKQetWXAGqC4KSC7r/YC+dAtykw1FRr1aDlJDYceqFsTIv5dGmyuAwSNLxdzLd7VWIBvvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6716
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Increase the eDP display control capability size to take into account the=
 general
> capability register 703 and 704 that have recently been added.
>=20
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>

Thanks and Regards,
Arun R Murthy
--------------------
>  include/drm/display/drm_dp.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
> index 05e16f0144ff..784a32bfbad8 100644
> --- a/include/drm/display/drm_dp.h
> +++ b/include/drm/display/drm_dp.h
> @@ -1670,7 +1670,7 @@ enum drm_dp_phy {
>  #define DP_RECEIVER_CAP_SIZE		0xf
>  #define DP_DSC_RECEIVER_CAP_SIZE        0x10 /* DSC Capabilities 0x60
> through 0x6F */
>  #define EDP_PSR_RECEIVER_CAP_SIZE	2
> -#define EDP_DISPLAY_CTL_CAP_SIZE	3
> +#define EDP_DISPLAY_CTL_CAP_SIZE	5
>  #define DP_LTTPR_COMMON_CAP_SIZE	8
>  #define DP_LTTPR_PHY_CAP_SIZE		3
>=20
> --
> 2.34.1

