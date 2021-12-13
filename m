Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0DF472231
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 09:14:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FA7710E28C;
	Mon, 13 Dec 2021 08:14:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ECA010E28C
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 08:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639383265; x=1670919265;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pEgjfJODw7H852FkvK80zjb7T9rBQtk2ZQQ2aOyUQOE=;
 b=hUWq397HXjiJxHVpt8kWKZ4Ogq5OtS+GQesBAS8Ap4opUC/XzSavdCx2
 ubpVJznR0WknajLwhmHgOHdJz6ZeBpDAz5dSsL0YFnBFsTTFabrXyJms7
 Tjzw/UtfzGQvLM4hGdvWLeur/2LB38GTFD/XRNUiSjSix21zX9ND+Nz/M
 bN+HSiBogi+ad0/K39n8yxCJ+AA9nY15W0rw2a14K8gKBijhOORhA9pXK
 x8O6dmXgvptC6krXL1REpvsXcwbebyRflgI4HLSLtxYqyiXmB9jdnElF7
 TCm13uCKcfC17CzwT7Li7y6lR0I5jEZigGxSh0BIteT0JNVEEo1ABJZ1M w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10196"; a="238499653"
X-IronPort-AV: E=Sophos;i="5.88,202,1635231600"; d="scan'208";a="238499653"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 00:14:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,202,1635231600"; d="scan'208";a="566468673"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga008.fm.intel.com with ESMTP; 13 Dec 2021 00:14:24 -0800
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 13 Dec 2021 00:14:23 -0800
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 13 Dec 2021 00:14:23 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Mon, 13 Dec 2021 00:14:23 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 13 Dec 2021 00:14:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=amBEvEllZAfBTePxZNAcdXpkCd+81V1iUfhIKz5rjRu+6P8mWEpIB2ux88hePUSW289EUOPC5PXnV5NKzTOt47aYLwF40kt37H8Qp0mxQrRz3sCyvwc9qkf4ThWA1yVW5PuZOeu7aPQ0aO3y98oQqVBJwEkDsOaxA/Q9gM6912JJBedR1bzK4Mn47C4W5/qSzvRPPYapUTpqcJiCW6lsetUTTKLBWlRLzSP1+IozwG/MaQjZAddKXdt1MEvgz1jr2wo8Qhr7xwfdx0ZOLH4gZYxpegsDppAoT8rlKzQ63H9Wyh0UAJV4SopN6CwMd2zQ9kfgclLXd0zBxGWqbKxCZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OoFj4AJ99bHQqERHrLtdhv2IY1uZpHptqLzbiNXzvWI=;
 b=nMdws7ATDF/ssrYajdmSeYVHsey1foagL9ulhHjP/Z1uuTxhzUNJGrjuX+jrzYfSK5tOlkykdcZY7KYtGB/NUliOAn4byHNqkQ4G9iTEnEJJ7l8AmJ/oSPT+wI8bVwYc4wyPfevLkHTinFdHGpiD0Shv3LMUSPwfu5sy+AEymPmKstRZqXHfD5Ab3uW3tIfLadZdVNC1Godope4q8Obtd1tadMLPyPbsR1cPS8YUd+D2q+JtSmdIvyQ+VAn20HRcMOzslwT2sAxBW0A/aT1wxTpNS+cNFDKONnnUVZlBJqbVWdH+fFsDBIqwwZlbDrvO55WcdKEeib4rveXlhZkUVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OoFj4AJ99bHQqERHrLtdhv2IY1uZpHptqLzbiNXzvWI=;
 b=Hl3ximTlE3Me731E6RoMhedla0huHohdohSI9xY0uHs+M3z+q+NpY3Wr5nEe1GoloKDv/G2Atlhg1DlYviMj9jnE6odCOaZK5jGGxaYJ4BEAMeSLcOQ+bTl3GjwS8Gd94c+ltFJ0E6drwnvNHOAxJQVdBT5MIVSeRDP7lS/rT+E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3180.namprd11.prod.outlook.com (2603:10b6:5:9::13) by
 DM6PR11MB4457.namprd11.prod.outlook.com (2603:10b6:5:203::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4778.17; Mon, 13 Dec 2021 08:14:21 +0000
Received: from DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::a94a:21d4:f847:fda8]) by DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::a94a:21d4:f847:fda8%7]) with mapi id 15.20.4755.028; Mon, 13 Dec 2021
 08:14:21 +0000
Message-ID: <13b4724d-2257-84bf-5d2a-28fe8884819a@intel.com>
Date: Mon, 13 Dec 2021 09:14:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.0
Subject: Re: [PATCH v2 1/4] drm: exynos: dsi: Check panel for panel helpers
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Neil Armstrong <narmstrong@baylibre.com>, "Robert
 Foss" <robert.foss@linaro.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Sam Ravnborg <sam@ravnborg.org>, Michael
 Nazzareno Trimarchi <michael@amarulasolutions.com>, Inki Dae
 <inki.dae@samsung.com>
References: <20211210191922.2367979-1-jagan@amarulasolutions.com>
 <20211210191922.2367979-2-jagan@amarulasolutions.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20211210191922.2367979-2-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0481.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::18) To DM6PR11MB3180.namprd11.prod.outlook.com
 (2603:10b6:5:9::13)
MIME-Version: 1.0
Received: from [192.168.0.29] (88.156.143.198) by
 LO4P123CA0481.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:1a8::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Mon, 13 Dec 2021 08:14:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bab56516-333f-492d-f86c-08d9be10910b
X-MS-TrafficTypeDiagnostic: DM6PR11MB4457:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <DM6PR11MB4457DD637A5CEAAD98811F31EB749@DM6PR11MB4457.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8ScK7/97O1ddKOFB/Wjk7K/eakp/+60Rbmak/lb2beEo64mE+Bn7rter6Ny8yZyGPVxd37v0Dl9lJyVb/HSEdFgN3qgNIHvZbwbo8L6TonVwjfWhpPXlek+Uid+7Ls8lpXfpM7XM7yHhIStCm67SVF6GJZHagURjfeAey3sF8j9iVYZEg/PTqOMn3yLLGhlROiZMzuxlA8GvZeb+VFb3ogVMxg/MSq70e+S9ZGj1PxHXSDWzaDC9n1j1RsZH8YQ7y+EvWe/iBloT3cFFYhWK8bn1h2JwnQ9yE6BKziqEEvGbzGYTi6vrJAXm7013bk11n1WQYAVXFCmO6RwKThIStGH4kZSZtNqzjyHAi3Dtk1RWh+VhL5dwnRNTIlkhLDpAzmJhEyer4Gf1wYNZD3wyE5MteEWneB0XFR9P1CoJl0P4UeJZtE9CMwTToCLVA3VcVCQHEW6uO3bff0ahckrJdt0OJyRslYGxsOSNgbiDSeP30KSpSNxr2lKYDtHfV5OpzxYJhaFlfcxAuGKGHsHyROiORVE0whZmzmO832YZU8v4H20DBsSnL5IDzbv1kbyBbe2DUfZkzL7xEy2l+SRfzYt3Y5og3SrxfY+KFwvx7mb/JfXiBWlyt0MZeJiI3Mci6AtEEMyJn+7m67c95XhyBXrC6Ub/9iUt7DY2VqmAbIHb8v2PpTYLxVfGijbVuokY49h5i6J7uderXcp28fHK64Wnuuk1SkhNma7hYmItDyU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6486002)(316002)(7416002)(36756003)(5660300002)(31686004)(36916002)(4326008)(86362001)(8936002)(83380400001)(2906002)(38100700002)(66946007)(26005)(186003)(6666004)(110136005)(53546011)(16576012)(31696002)(8676002)(44832011)(66476007)(82960400001)(2616005)(66556008)(508600001)(956004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmM2VzhHaVRJWTkzTmZEVnFxVGtmaSs3NlpLOW1BTHdlTkhOQU5BcHVwTk5o?=
 =?utf-8?B?cVliRXVFUFVOTUNBS0tlSk5rbjl4MTM4WWhqSDFTblpMK0lwTDU2a2JGQ1p1?=
 =?utf-8?B?TGFhZ1pVTGhjenIxUXpvUjRTNHNUajhSVzR4c0FsSWVqWCsvcm96Z0I1QU05?=
 =?utf-8?B?QmVFY2tKN0Q4L2FjN0kvSUxXa3ZBZTVQL3E1SFNWM3ViY0NxT1Job2FYQkFt?=
 =?utf-8?B?Mzl6d3ZwSmxZMEozc0F0RmRHWWxSVkh6Q2xiNFhPbGk3VW9Nb1FyTzhxa1oz?=
 =?utf-8?B?TC9MNnR2ZmpQVlNNemM3TDBxd01kSE1kSmUyN3YwWEN5eHd5cDVkeEc4a3pa?=
 =?utf-8?B?a3drdzJvcFRNMHpvQ09GaWY1REw5dHozN3VPVDNXMUltbU1XR2ZDNGVpQ2tH?=
 =?utf-8?B?VWNFUElQd1ova3E5MEFyUlJva3E2dFF0QzQ4bjIrcklCcmQrOUhFcnMzeVVR?=
 =?utf-8?B?NmljRE1sV1dQakJxdnJGQjEwTGdIOVdaVkgxcnAwS2N1a2E0bWY4MkRleURz?=
 =?utf-8?B?SXprMDljOUc5WlBmd2VOd1M0bjFLU0tJTG9nYnNBODZSMkxLUlJBanZCcTZy?=
 =?utf-8?B?OC80dGdhY3hIRDRiVi96YzZoc3djSHo5cmJJS1J5T1pEVjNFNUhKOUpHbE1B?=
 =?utf-8?B?Zm1TSEJKbEN6Rk1GYVNMdWlIb2NBWGlvNVlRYTFuSDQyMzV2dk5ISlkrMVMz?=
 =?utf-8?B?Q29jcGRqdDYrS3BOZjBCeEZ0dHhwYlQxWllOZkk2RXpreDJLTHhqd0l6dDFY?=
 =?utf-8?B?WHRteFVNdzdGSWY3dVVCbVZub0Q5T0tvQ2dXOWVWWXJtQmNUc0FFRStZbHlk?=
 =?utf-8?B?MjY1c2wxcHVnb1dKZWFMZGU4L282RmJVaU0xVm9RNzRrNXUxVlNIN2JnZitS?=
 =?utf-8?B?R2J2TTdGZ0ZCN3p0NENvOElKR1gxUThZM1NzR1dISUNrMmxobG1kTzRQOEhW?=
 =?utf-8?B?bW5weGZQTG8xajE1aXEvdGdoNXFYZHJDOXFlcXg1TlJOV3lDRTV2OHFhNDJR?=
 =?utf-8?B?UXhWQmFpdDV4ZFZGRy9OVkR5Z3kwUWF1NEZ6dkNkQkRUaWdiOXBRczZEUTBx?=
 =?utf-8?B?RE90ZGxKWXRmd0FraWV1eWhZcjdlYWFNMmVmTkZLbFpXMlRvZjhoYU5OcERF?=
 =?utf-8?B?cVdJT1Y1M0EyWGJwcjgzM1hwRFkyVVF3M0hRWWdVYTdDbUwrUGlhZHYrdHRU?=
 =?utf-8?B?VjhvaU1WczMvNjNxSzhQMTJHMEl1eHpLSVd1ZFV1Z0k2RFBmT1dBZkpVblJ1?=
 =?utf-8?B?NER6VGFRVml3SFNBcEo0SkJUb1NBZmxZUVpGZzN0UkJ2QVFGNm1nOUI4VHVM?=
 =?utf-8?B?QlZJbGJkWVExQUhEM3lScDJFS0FPM3lDMUFKbWRwOTJxRlBvZ3JGcEpQNzBF?=
 =?utf-8?B?OEh1K2dkcWlVdWtYSXhaNnBmVzlReEthZXVoWGdwQnhReDlCenlHa2RCZHRu?=
 =?utf-8?B?Q3ZIVmZiSzNTcTNMcDdHZStiWFRZVGhCRmUrKzIvK3ZQeERZNTBIM3dYeXM3?=
 =?utf-8?B?VStSZ1YvV3JqaDZ4dVBoVDlsa3hMeE9nOHFMVHNpWTQ2Y2UyTmk4bEJ2Sys2?=
 =?utf-8?B?K3ByL0cyNVl0WmlnQXp5VEowR2wxeXcyeW1peE52b3JmWVFIbWxacGp4dmpl?=
 =?utf-8?B?eGxPa0YvaldESEhVdDltU0dNc1RrN3BVdUp0V2x5Z0dDRGIydGRrbHFkRW1n?=
 =?utf-8?B?RDhQcGsxWFo1SWRTSHl1Wi9uWGRSWE40ZTlsTTl6TGc2citETk1wWWU2QW1H?=
 =?utf-8?B?UGhOcS82cWpJU29XOXhNZU9aTEl4NGpBbkNXZkJpY1JHTVJjbncwUHJyZmNL?=
 =?utf-8?B?MUs2YnNNb1hEcTB6N251Y1NzRzN4WUErTmhWL282MU0yNHo1VElJOTkyKy9H?=
 =?utf-8?B?M0Erc3d2eHc5b1RNMXkyZ3NiYy9jVXhYQjdUSFppL2FGOEphWUFaM0lYYnVP?=
 =?utf-8?B?REExa1BQMDRHR1V1Nk5yZlRQL0VKQ2pkcGpOeWk2R0FOUktxU04vd0NETmpM?=
 =?utf-8?B?d0t4ajR2WWVrMDNneDd2S0pOSGdQV0lQTUZNaXRLUnhCNFdtV2RBNHcxdVg2?=
 =?utf-8?B?eE80aDBGK1Q2OGQvOG1hbXZPakkvZnJjUEJKaVhtT05EYjg0d2pWYjlLMjlO?=
 =?utf-8?B?dHl2cHcxZ2ZUcUdpRUNlaDV4RkJRMGo1em8zN2VDQnBOL2VueWVKRVdrb1ly?=
 =?utf-8?Q?pEovYeiNbrvZAhH7VutpOqE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bab56516-333f-492d-f86c-08d9be10910b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 08:14:21.4139 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SDrfES8fprclJeiTLXNWidP8VpBVk6/KtyxjXSvC1gEsFowfpi7HVIrf5BJLWeRDwvTrF1/faAvuBELZUdgEMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4457
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
Cc: linux-amarula@amarulasolutions.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10.12.2021 20:19, Jagan Teki wrote:
> Trigger the panel operation helpers only if host found the panel.
>
> Add check.
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>


Both helpers handle already "NULL panels", so these checks are redundant.


Regards

Andrzej

> ---
> Changes for v2:
> - new patch
>
>   drivers/gpu/drm/exynos/exynos_drm_dsi.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index 8d137857818c..0bb44e476633 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -1439,7 +1439,8 @@ static void exynos_dsi_disable(struct drm_encoder *encoder)
>   
>   	dsi->state &= ~DSIM_STATE_VIDOUT_AVAILABLE;
>   
> -	drm_panel_disable(dsi->panel);
> +	if (dsi->panel)
> +		drm_panel_disable(dsi->panel);
>   
>   	list_for_each_entry_reverse(iter, &dsi->bridge_chain, chain_node) {
>   		if (iter->funcs->disable)
> @@ -1447,7 +1448,8 @@ static void exynos_dsi_disable(struct drm_encoder *encoder)
>   	}
>   
>   	exynos_dsi_set_display_enable(dsi, false);
> -	drm_panel_unprepare(dsi->panel);
> +	if (dsi->panel)
> +		drm_panel_unprepare(dsi->panel);
>   
>   	list_for_each_entry(iter, &dsi->bridge_chain, chain_node) {
>   		if (iter->funcs->post_disable)
