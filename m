Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A7B5B5DED
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 18:14:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D68710E5E1;
	Mon, 12 Sep 2022 16:14:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6709510E310;
 Mon, 12 Sep 2022 16:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662999275; x=1694535275;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Zsio4/GJrX9CVITtkYAzqpPh3NCaGPAzCy+7ePD4CsE=;
 b=jWlxCIU1S5WzfsDK2NTpI222Lgp3S/LYPFq45shejvTuLClQfVXXY/ev
 EMejeKIoPKjVRTFVQuU4MmALpoLUG7fLIFRjlwTKdJXTPmAoKfRA1GCtN
 YuDdAypjznV+673YdG/z2j6Md0b9ubfHKWiOdX0PAiVySa+3bmljykzVx
 lKBXPjBQj+Dh6WTRq7Ib9NtHRbojUX4R5gQ7mZPy4NItTHzYBMmE8HiE7
 N4mJTEMmDxuM1FU5bh9dhO+KkUeOoUjiNjvv2bYQ9iOPxJQOu+1iMAmyb
 tK4ek6nSurglmQ6FpXZ7FVDtVWzB7TNKY0aI9WZDXAM3SKNMXbMrANau3 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10468"; a="297908003"
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; d="scan'208";a="297908003"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 09:14:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; d="scan'208";a="719818444"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga002.fm.intel.com with ESMTP; 12 Sep 2022 09:14:33 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 12 Sep 2022 09:14:33 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 12 Sep 2022 09:14:33 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 12 Sep 2022 09:14:33 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 12 Sep 2022 09:14:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JzggnpMhnyfla6CJuR2VMmyH6I2IntNNo7kQjXI4Mp6xPDIUDhVP00qGfUp77DI3HoWMt/B4Pg/YQ+UxvJ8WlcJgae4779zg+tJIUNMb6b1ELftC3AsNGKT+aKy6hwP4j2oysjaF28/Cj+LHB5U6X9aYlV+J3eUBHvR8gH4sIoRpNtmZBLNaK0/aOtgR3nL0/aHtHjKbcuO/6P3de3TXkPOKICEPMxUGteMtS51r7DRwssxF3C1vieAWocgKsskvt5HcR3JupUwAovrj1sjD0I+KwiWDjRt3pH0vNPHD1Q9a9ZX9uypWdQvlEUrBM2wIEuYT6rb+gtsHpvPpUwTcQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zsio4/GJrX9CVITtkYAzqpPh3NCaGPAzCy+7ePD4CsE=;
 b=MnaENFviqZprdfMSQjAfUTh5VkBzme9z57sJvSpReBxvjPtmxmU51Dl2LhS/cSEBY+N9ptCiwxzR5SpkMi9UW6VRnBc8kL/a/uGC4o2GnTk35aGg6mfHYfdwcLA85GNYTWbr/Ky13ri5IXDv/eOLO9pJ06aTrUIOHONZCKLHCbfjhPdBu+4syqTouGUWOUKsICLOajVV6/raVKGpMdgxB5vj9Fw6lIceCchTmN9o79QlNwpEyz4t9BXbWFpZtpfQwqczrkaqLhi3ekkywN4Qc9aOBqaAUs5uNcxK172Y4MJJvXoTZJ5xKyozdDflCU+UpMXSfE8muZEV/khyTle5rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW5PR11MB5882.namprd11.prod.outlook.com (2603:10b6:303:19e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Mon, 12 Sep
 2022 16:14:31 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b80a:cf49:9118:24e7]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b80a:cf49:9118:24e7%6]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 16:14:31 +0000
Date: Mon, 12 Sep 2022 09:14:29 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH v2 0/2] drm/i915: Media fuses future-proofing
Message-ID: <20220912161429.tuqhdcnbj2dm6dfn@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20220909-media-v2-0-6f20f322b4ef@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20220909-media-v2-0-6f20f322b4ef@intel.com>
X-ClientProxiedBy: SJ0PR03CA0365.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::10) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW5PR11MB5882:EE_
X-MS-Office365-Filtering-Correlation-Id: e3cd836a-9f82-403f-71c3-08da94d9e00b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GqjEaHlvgXv3xj493+SE8qR0oINrLu+GlYwM1NPip/KFIRpxKeUZlOzsyK96uDNsT7CfQkrmChKt8SoHJK1m5pMovBywLwqW2Uco2r5yVuZz+Xd3wZVP8anHm2cpktqZ0Lw/+G/dZzv7lSpsaJsqic44G3z5uC3nKSzolGIyd2iHIGCUcnkN2c+NXJc2NdycYAtvngU54xgDOXl6P1yVN4NFZxpB/bJ1OIONC2ofMMqgaBLtZSWWoZvPcdwnSxMVpBgeUD7JR/ZvOIZQ6CBPFozsPyRfwyTLiyuBsUFLBGb1FWI3O8bDwz7VfHe71vOLU9TSsgWS7ggkYFRbfHQWyk5KfsB1sUJ5ARh5qHj9mMY1M1OTCecOSqMQnCl3u6tbAK3E5rWGNkFrxRJ+U4hLIaS2Yb7UFR3b8yFaGCcEE3JGyORRusmnLC+b5++cBzDQngxy8YtwCAGaIqjRyvb318zNkyLq7omA9Y7XUOO8I5LLaGppvVhSD3a6lvqnCR0zIh05vYG2EokKHLcCZoU9QcjLvTPzyRu8mxrdMF/0ybcH2n+SeoqZhJCTfkuZjZI8iGblimCEgRduU5+XzOcoqEEaty2tcM/kJFDt0FR29V4Lu91eycEx96/eog0WHsByDib3SY+uvozbZMbhlOv86yXLgoJ2QxgL1rb7OnXuWVh/Sm9NwtFA8mWOuBHD3X6PupZWIHkS/ZOirDqR7liU5w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230017)(376002)(136003)(396003)(39860400002)(366004)(346002)(6506007)(186003)(1076003)(450100002)(558084003)(66556008)(66946007)(86362001)(5660300002)(8676002)(66476007)(2906002)(38100700002)(26005)(36756003)(9686003)(83380400001)(41300700001)(6512007)(8936002)(6916009)(316002)(478600001)(82960400001)(6486002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eJIZ6t+dZG2bX6iNcTUz1xktUuPwGnF//tYjD8AQADGl2bhVxcaioP4WUrTI?=
 =?us-ascii?Q?D8BrwDGdh4zs3fZ/6WiJLeIhjOpXNbwU8ZUKNGDqyJTwzroHVJypEmAjnt8r?=
 =?us-ascii?Q?zen5pKtoiqcWD0s/+0Nk1MbuPe3q4gJe1cJJ3zy/i4xPISHv8RihCACDx7f8?=
 =?us-ascii?Q?9qGVagLdWMcm8hcD72UKRGSnwClORP3olXxzWYfjKnDfIr3Ejx51lGa4hAP4?=
 =?us-ascii?Q?MGfrZWTrR46zhZ0X0jpv1Eeaq8ofbcuOXlwWIBnYqTtfME5bDfb+/xOnQgPk?=
 =?us-ascii?Q?fqfay0OKkZMhRA1xSOYozdctCv3oVubWk9LpHIrcogYUonSK5Acjt0NzY+PT?=
 =?us-ascii?Q?c/Ws1wKSkzk4uFBM73mkkUK14z7dP6VESfy8PN91wu818IBK0Yspe+tbqi6v?=
 =?us-ascii?Q?qmjsP/Up/3yhGQ5Gxx4EwxFXy/J4U0d9za/LLWeIxHDRMgUrOzELivy8a/Bo?=
 =?us-ascii?Q?2qw0jEHKaS+kGajfSuJ2jSLNPKNLFKg32ScFNAlK2giv3qE31T7NpNtzPzM6?=
 =?us-ascii?Q?qq1Red1uTkhDhKz2KMfTlo55UchTB6F7bsm+fO6z60jw5+aY0rRPnOU8sjjj?=
 =?us-ascii?Q?3lffMFVqGt6lPdHPxa9uHBR62EfhWAFDa0a9RweUF07YidnRADZ3SJR/F7L3?=
 =?us-ascii?Q?3JSUUNeNj5zdUJaeCp8LA2D3qoy93tzyUhwWmiZeov5kLRKiLP4PlGmhKYtS?=
 =?us-ascii?Q?xmLwUm44F8dQ6CO/85Yn3GB4/c1l5Ks8gkuFhJ8Yzt39O9/ALopb5P4/sC7A?=
 =?us-ascii?Q?7grwVUsGxBYeyi8tiE0vEkTyGRvmm4Fhr7OuKY100Xkq9RzETkEwS1G4Rma6?=
 =?us-ascii?Q?ok73QkDG76kv3o0QLmsiqRu9Y7kDlY/t26KNBVWT/mnIs6L13j4iCpkJPLM3?=
 =?us-ascii?Q?Xvvn5pwgexcj9EbcL3uJ+eqTEE9TecD8N/ytbxeEj96JBmjjbm/VMPFQzFJV?=
 =?us-ascii?Q?UiYhmLVNXYt33uXmcpr0DcGXRBPzTQVjmOJln9Mmnp5wStpiNWrC5KF05i8m?=
 =?us-ascii?Q?RV4bb4qpMDSe1GRzXUrnWy6o1XNhgCu4tJL8PoBFHSoVedOKEmzA92GWPHCp?=
 =?us-ascii?Q?d5vhPlJ76LG+i+Ovfh8ZuRz4ceZORv3XkSbWB3r8+Ei+TuykzVzcZGk7UT9h?=
 =?us-ascii?Q?bnYKAw+6BayNBXk2kZ/hZgMXy2UwMEj+eNfzyra0t35MMLwEMk2WMXEve1W2?=
 =?us-ascii?Q?rE/LoVA9aDyQijQg08fuHwBFYlFoyPLXnCi22dFzPAFZMuO5KcCo4xhjvCrf?=
 =?us-ascii?Q?MTnc03m3jT/9sE97xevGzZmrMg8jnMnqM40D7AVhLbBXJCw1I7s59oKuG/8d?=
 =?us-ascii?Q?VIHQK7okxiTNx8C5ujmzDcjYNjTd3PVxg7XN8gHSi7lpo3atHOL0jOl3KB70?=
 =?us-ascii?Q?FQ+4sLX48h9IDFrU2QgwnVnm5qK/ciOH6lcMoeLQ2k8y7yknYTJ6GM+xAqD5?=
 =?us-ascii?Q?t0LaUQ1qY+tKP/F15drs20/Nk8+HxQzz8sknVtex4XU3leWI43iA7u1Rir/j?=
 =?us-ascii?Q?rjTBAM6NogiRjlfLCkRRDfvN1uHysLKqThHgWmWh6pU57qmilXBhxLhRwJOS?=
 =?us-ascii?Q?kaRaHaudnH4CtZU7h4nqK1vA2/WGy9NDxGMw02bwq5hWIzzRk5ioW5ZAqvRO?=
 =?us-ascii?Q?aw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e3cd836a-9f82-403f-71c3-08da94d9e00b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 16:14:31.5725 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9sTq9H02rTORlGjesaKwiSs1Xtj7sTpXA8TzWDbJ/lXYdOlqyjgZzyzkl35qViU+wzyxZDT9wpxWXdMg3+B57vQTCMFlKZk2xH67aUrcX2s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5882
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 09, 2022 at 04:18:14PM -0700, Lucas De Marchi wrote:
>Update fuse handling for media to future-proof it.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Thanks Matt Roper and Andrzej for the review. Applied.

Lucas De Marchi
