Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DC95F2B92
	for <lists+dri-devel@lfdr.de>; Mon,  3 Oct 2022 10:20:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14F8210E268;
	Mon,  3 Oct 2022 08:20:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8FF210E268
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Oct 2022 08:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664785245; x=1696321245;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=wIQJLTIjqTi3PvMtnQSUsx1VtRKzs06GPrmF/9hX5tQ=;
 b=ZeS+CQFgGlZAR5r/x7j0ot3VKobNCZRVpwPQJv3vhW6mxvNhiQJ5eN6w
 87bi9ONhiUJJEXQjud//u2sqTo4jrNYRxxBIeTbxkvQjToVPob8rwQhYI
 Tmx3eqOIAf7f8nDtwiExNHZg//AEQfFdmam0DygZe3OwlpfRQTcHM3uEj
 682ftEVlTofxIb+DRjZbIA+a55FNfFJx5kk7ITZNGxNb0lp9qqKJ7Yc5j
 Zr8SIdkOmK1uKKiEuR0Ijg4oS3u8x+tsApBMOEexure/E9xvoTd/DygQE
 qQLcMPsJ236wpN+F11FrSwCbCEddLkI/QrAxtqb+BcUu3N44Bn5qToELe Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10488"; a="302556335"
X-IronPort-AV: E=Sophos;i="5.93,364,1654585200"; d="scan'208";a="302556335"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2022 01:20:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10488"; a="686026146"
X-IronPort-AV: E=Sophos;i="5.93,364,1654585200"; d="scan'208";a="686026146"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP; 03 Oct 2022 01:20:44 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 3 Oct 2022 01:20:44 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 3 Oct 2022 01:20:43 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 3 Oct 2022 01:20:43 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 3 Oct 2022 01:20:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gSqu1r7D2Kx4gAtQeYlpVdCKgOOPi5HBnNQCY9JJjBunngNlTjeZuVamzzg+hMxrvRJdjDa1uJFsmQBLelz60srckJryeu/JeetywD6C/zFRmRhMna15HA1npoyoz7+Qx7XhgXUaQZ4d1zP2Zxa7YBPPZFFizzh1GoKxgFuOuBH4mzZUTvkGWoZpo+cqZhttHI1f6z4KvfgjciQmcvbiV7jrXFBhlA5TM4AifrB6IG1emxFxI11oelad0tKC+pfY035F1lpMwm3J27WFBT92vChPS1AZwwVPWq558bCTVMuHsKvteaCImybzTCk/YsqAaYKNZFN8AotQUcPGJnxclQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d4Gm0ehHDduTWoIUSwrzyeT5mvWvXqaE72njerobsXk=;
 b=ixUAsYVkvi+h1/B28os7Rb+by4mPe+GAXomaCziBL1h+3JVi3rofZAzLZ/xrYaIjix3cE1i7JHnQy1PTubAMhhmkEI6E4z8t/3d2/cjlDMWJkAhWXFwXs3phGMeqnwzqTlsvuBAYFepziAcA1T0IGwJQzS8cFm1qD12yh25ixOb0ozoQLOgMWCI2eO4xp8hFJRyPhfhe+s+1KisZv239pG2684J19NPKe3/V3G/rrkZGIvhsNSAQQE7Cl//2HsvJ1mWp98RtitP86+65bnILi0ulx1AHyO/AX2IrLSoMq3N9M5kf04pfzg5xhfpddvYajcm1W2NI88x66PNlOgafPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CO1PR11MB4932.namprd11.prod.outlook.com (2603:10b6:303:98::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.24; Mon, 3 Oct 2022 08:20:41 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::5145:64b6:db32:b424]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::5145:64b6:db32:b424%6]) with mapi id 15.20.5676.030; Mon, 3 Oct 2022
 08:20:41 +0000
Date: Mon, 3 Oct 2022 10:20:37 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Subject: Re: [PATCH v3 2/2] drm/tests: Split
 drm_test_dp_mst_sideband_msg_req_decode into parameterized tests
Message-ID: <20221003082037.7xwtb62rjqh6josw@nostramo>
References: <20221001223422.857505-1-mcanal@igalia.com>
 <20221001223422.857505-2-mcanal@igalia.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221001223422.857505-2-mcanal@igalia.com>
X-ClientProxiedBy: FR0P281CA0058.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::19) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CO1PR11MB4932:EE_
X-MS-Office365-Filtering-Correlation-Id: 819c9142-8df8-43d0-b590-08daa51828ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rjZuHMc1Yu2oBNqF+k2z15BMX78a0Ny8b+SZ+raiNanCunS3imryVxZ173TuDw/abTciwu6MnyVTdrNFtoqIX/Z/rhGIIWbePJoGRyvUZYl9XE/4vNTJ8hAaQIrgwMmrR1NLkxMUNg4ggVcBJ5vuIMKGm+fZWVXwNuxXtAsXjV4EYGX2iYHE1dPoH/GcR5nPgA17J1hwfAKXeL0tWxAwIMsYz9UcRAOdYKXLQjdBunn1u+FT6rOV3f1rU7cm1cL5A4OBsJOPX9y/PuRCJ3msQMDlMzK1b6vHH27zCACD6PTKLOcf7PAxha723xrtSmyh3tPUKoXZzqXmVEQBIXPHLIWBQLvwXhEqY1g14OVVeVrkzzt3e5qcM2Q2avpqt8HyhAINruu6+5f9g0wJ/+u96QzSVSgzhHmcB7IGFKEhwPGbl6b8xNsUzGbZJIXnQ5n+g5PWuyr4aKvdFvVR/MxfvsDNf3FJoEwI4epKM7sREeFyuIs9/sl4uG6kjDAzdN5aUQOChsdRQR//diNBIKegkwDxwu4MEFQELJZGDUd+PoXls/yttwg3YS0EWSVjKKn0o7qINyAyNfnN8UryZV35UW5zOON6QCjehUbpWgtyJBA0LKmTWIMRZq996ZXPli2H/n8dZXP2Em5Hm8QBKPpCPT9it7pF7z486hbcNStc81KiqMUraiCXsaFqZ2Q05Lrzl3+Pf3GA3N4HnS4n11jqYxfTOONRFxkPdHXU6zSTyy4UIgV14BhR6NPB2zuyoVjWFZ2LOweFWG2zuWzVJYFFWw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(39860400002)(136003)(346002)(366004)(376002)(396003)(451199015)(38100700002)(82960400001)(41300700001)(86362001)(83380400001)(2906002)(9686003)(26005)(6512007)(6916009)(54906003)(316002)(6506007)(186003)(966005)(6666004)(33716001)(66476007)(8676002)(4326008)(66946007)(6486002)(7416002)(1076003)(66556008)(5660300002)(478600001)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmNTc1dHTGtFSkp1NlZlaXZjUVI2eUcwSjd6RkdRYkQ5THpwbjI2VDNuU2li?=
 =?utf-8?B?Z2IxaEcvQjVWMlhFRjNubWRKeVJJSmFaQnFOZytLSkdiQlV5KzFvOG1tYi82?=
 =?utf-8?B?ZE5tS1lvUGNBbjdmWG9mb2p5MlR2NXR3dmV3b3F2UEhsMDBVUU5PYmhjZnk4?=
 =?utf-8?B?NEQvSjJacFoyVGFkVGp3MDJlR1BTOFVTNjBRWlFqbm9IUDZSWkR1T3l3c3pG?=
 =?utf-8?B?Z0l2RjEyeXhWNGpRclgwYmxDdW9US3NEWUY5VERYVmd6WHBmWC9hZXJTc0Mz?=
 =?utf-8?B?MVYySHNsbkFZcEpIc05abGRRaW5DQU4zZ3FjR1FzQzJEbW03S0IvQmlYYU5S?=
 =?utf-8?B?UU9HallxNWJvL2U0dS9xTko1WXorVUZQeDlHNUkwdy9Ic2VhSkF0REovVDBh?=
 =?utf-8?B?dy9UNm9BSEFFRmo3WE1XQ3B2SUtYRG5zdzc0QVhFbCsxekhSQlR1UFQ5aHpG?=
 =?utf-8?B?ck1jK090WS9McjFjSlhjb1cxb3ZIRkR2YUc5REVObWY0ZkNZRkJER1ZJaFNY?=
 =?utf-8?B?Wm1aZ3Y2WXZhRHBxRFdoS1pJSjBVRmc4R09sc1hnR0xkQjNsMTZtM1p1N0h1?=
 =?utf-8?B?NWVjbWZpYytrU2ROSVRxOWNXNUxyZ25FcHduSFRuWHFZMEtHc3NtVTZWTGFY?=
 =?utf-8?B?UmFsbE14RTRwZ1dPZ2hxclpVQkV2Sm5RRGtXN0RKN2dHTnA5c2YrdEdvUTRZ?=
 =?utf-8?B?MEJVdGJaLzVCR1J2RG1PVmR1QjNpeFg4enQxa2p3WUlXc0FhQjVveFJSQTJ5?=
 =?utf-8?B?NDZsWDZwSHp4c2wzVStsNUVXUWREbUQ4K1JhMjArZllDMFFrL212UVgvbW8r?=
 =?utf-8?B?aHNwQ0lGaVBqbVJXbGRyM2F4Z3czS0NUcmd3QWgzcThKaUFsWXl1dnBuTlRt?=
 =?utf-8?B?OVJvcmpQWk05QnFGNitRcUc2dm1LckN2Q200NmFxa0daam5ISkhBRnlaQXV0?=
 =?utf-8?B?VEdZNy81dWdDWVo0am9tenlLVlQxRko2U3FCNkdrZGJOWHl1SzBGcm1Pc3hq?=
 =?utf-8?B?ZmwreFhKYVp0cGh2RUtQY0t1S0lZK3VQRWRZd3prZC80c3IyQzRXRkFQZGZW?=
 =?utf-8?B?aEJWTmg3ZDdBYUErUkNMRWJWSWhPbDNWZ05QM3JWbXVSVXZDSHliTUhidEhI?=
 =?utf-8?B?T0dqcDZZK3ZENng3Y0FnVjFzNXBrOURlUzVpQVpEL3FnM2Z5dU8weURXZnpG?=
 =?utf-8?B?OHBOVFVlYWk2ekQ0NFUzdG1kWEZCb0NyRy9aYnlGQ25HUXl0TTkyWElMZVBT?=
 =?utf-8?B?K2NWVGxzbkJ1ZHQ3eFVBZlVmTmdQd2hnZjcwWW9zdlExN3poQlB0MFBlR0dT?=
 =?utf-8?B?OVlnTFM5LzFQQzB5dlpaSFVhQkxJcDJSeERaMy9MaENwbFJFWlhOTTZBNmVE?=
 =?utf-8?B?NUxhSU16SWIyMWY2eWhrQWZQSDZtVGdoVE1iL1Nab2FxZUF4TDZpa2tSSytR?=
 =?utf-8?B?dmVvNy9URE03ay9HU3V6WER1UGdIdzNocEJaUUxHOWVHWkRzY3hPbmt1OTlK?=
 =?utf-8?B?OFpqVWZaR1ZjR0VQQTUzdnNmSDVIUnB3Q2FsOHdTdXRtclBFU3dZZk0vdGkw?=
 =?utf-8?B?MFpYbVpsZmc1K01nYjdNQzB3RnNlYUM2dlR4a0M0NDluU0hrZml3WTJ3UHBL?=
 =?utf-8?B?dGkxUktvbTJLaXZYRnFDd2xuVGtJRWo5MnFSUXo1M3VHdXV2TFFNVWNkV2Qr?=
 =?utf-8?B?UkdEbVliUWtPdE53TGdZZWxzeVo0YjEwbXRTbnNOMkxRSVVZUDVCTTYzK2JY?=
 =?utf-8?B?MXZYM09HREl6dElJYUZIc2lmUHNtaGJxTHBzdlBXdWxNUDNCNkd5NWZNYnZE?=
 =?utf-8?B?d2dZSTVTajJoQ2Iwb20va3ZTQ09ZWVRhUFdRMUc3YWRCeDhhbGtsT3FRdFJE?=
 =?utf-8?B?V2V0T1RkKzNIdUdUVHRnOHJ5Ukg2azF3WFNOYzdGRG0xbmZnRy8vcHA0ZGpV?=
 =?utf-8?B?ZGZHelhYS3J3V2dteW5TQ01lZEEzMUlyei9iaHA0S3FSTlR4RnNJMEZXTDRE?=
 =?utf-8?B?MDhFOWRTd0NJeVBHRzl4b1JXZ0JQMkQ0QzMxVjF5RUJTdjJpSjkvOUVzMnRM?=
 =?utf-8?B?V1ZEaGpRZ1NoTGNGYWtpZzZaNG10bWF6emtjaVJEZkI3V3AxcE1iRit4NHpW?=
 =?utf-8?B?L2wrUXhteDNtdkRRYVp0THFzRXFqSlZxVlpQU3hSRnNRRUFTenRkZFIxOUpu?=
 =?utf-8?B?U0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 819c9142-8df8-43d0-b590-08daa51828ec
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2022 08:20:41.2164 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fOF6P8DgZ5ajdUuNKYTcBmBezHyywMSA21ZLPnzsbXoNPM7HUj3OvnEVmjtld1BBnzlJ7TTNFdD+K7d/aaDV3Z8rin332kJ6hpLgfVLnvHg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4932
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
Cc: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
 David Gow <davidgow@google.com>, magalilemes00@gmail.com,
 David Airlie <airlied@linux.ie>, tales.aparecida@gmail.com,
 Daniel Latypov <dlatypov@google.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Melissa
 Wen <mwen@igalia.com>, Isabella Basso <isabbasso@riseup.net>,
 Arthur Grillo <arthur.grillo@usp.br>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Oct 01, 2022 at 07:34:22PM -0300, Maíra Canal wrote:
> The drm_test_dp_mst_sideband_msg_req_decode repeats the same test
> structure with different parameters. This could be better represented
> by parameterized tests, provided by KUnit.
> 
> In addition to the parameterization of the tests, the test case for the
> client ID was changed: instead of using get_random_bytes to generate
> the client ID, the client ID is now hardcoded in the test case. This
> doesn't affect the assertively of the tests, as this test case only compare
> the data going in with the data going out and it doesn't transform the data
> itself in any way.
> 
> So, convert drm_test_dp_mst_sideband_msg_req_decode into parameterized
> tests and make the tests' allocations and prints completely managed by KUnit.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

Thanks!
-Michał

> ---
> v1 -> v2: https://lore.kernel.org/dri-devel/20220925222719.345424-1-mcanal@igalia.com/T/#m056610a23a63109484afeafefb5846178c4d36b2
> - Mention on the commit message the change on the test case for the client ID (Michał Winiarski).
> 
> v2 -> v3: https://lore.kernel.org/dri-devel/20220927221206.55930-1-mcanal@igalia.com/T/#m2dc961da2d4921566cd0f9a8ed9d2d33a1cf4416
> - Mention on the commit message that the "random" usage is not incompatible with parameterized tests (Michał Winiarski).
> ---
>  .../gpu/drm/tests/drm_dp_mst_helper_test.c    | 370 ++++++++++++------
>  1 file changed, 243 insertions(+), 127 deletions(-)
