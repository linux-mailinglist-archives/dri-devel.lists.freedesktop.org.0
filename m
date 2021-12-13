Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7174472386
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 10:09:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 099EB10E46D;
	Mon, 13 Dec 2021 09:09:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E66A10E46D
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 09:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639386547; x=1670922547;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tOXYKgkynKn9UTRXP+m0BwD3+0jUK7cuIJnKmbi27JM=;
 b=Z0Z+KgTIJT5QGtGgHBCNAc14VrMYDgxw6W981CqgcBGqo1yE+BnDO+YU
 KtL3RqwpvcTn7z2VKmliev92Wybmr3g7BfQDzlTnxnXJvyFkUuf1QB2FL
 8sT5OFWnSm2CkITrYpxPw81WThGIMm2ZsCPyjMWfeZdJbceFqDucZxm7+
 Lc6I8CxO069u86b/v7RQ2s5WXff+pSXiY+GneRPpdjjw9Lhep543grSXA
 lsE+UjioMSZbHPMlMIxf1JziFS3YjuIGXe6mgN0pyj1soFv2cJLosJlDO
 I0jtEtogs69NlFBcd5CstXYXR4Pn4wVBHtz9AEAkrDc8wlXoUVpWncJ6P g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10196"; a="238508400"
X-IronPort-AV: E=Sophos;i="5.88,202,1635231600"; d="scan'208";a="238508400"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 01:09:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,202,1635231600"; d="scan'208";a="463315088"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP; 13 Dec 2021 01:09:06 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 13 Dec 2021 01:09:06 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Mon, 13 Dec 2021 01:09:06 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 13 Dec 2021 01:09:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OiNCenEYYuWGHXHA1CRARu7pOQmZMXTMGTrr55c0dqnZ+7IvP+GIMvrh/TkQFHrTjeN78YZXE2MNcFjD/vFwF2UpYeRfrblrNqHteXGreDgfdhE4AluRt54c5qtdV32YWtSfFwETpsXVN3gOxgY/rBEF9HnWSuG/kIOfAi4afTBuZPYmD3QyUceOx5ogyeRSsDalvAgcIF/XQcPittm8tYS68itNsYG2yMUYfIWULp+EsSC3p0xtCNmpKAwWxi5R4j9Z80SlX8i4sY89rbm5Alou73nulhp+1M/tnv0cHgm0AxJw+L8cfFEO7bVuUXbMDls4rflpRKsdZqEDDLG4ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h9JzsVsJFIW5KlCZZ+JOq17nB8G73yQAPHzwPwAlFwc=;
 b=a1zLuuD4ISpRZO9fixaokZYQyjbo2jUfiZXgjXMmQF8stBClK3Z2IWwz4Ehp/j0uTxJJoMJna4+vCr/7WtItU046FvVRs9ZmeVK79HXirF/fW0RIvzVv55pU3t1LR19LRx8NN7Nri+SF6p1BvGk+ED4oAVq85T6rXN8S/+Ymcp/NyGQ+N6BXzrgnLnzsM3a+Aa1ByYSO38ZTMhTzgDxaMsLkzFi6qv+u+CDAhKmbq8tbCnlsO0JZ08UdYkyS4DuCO0LPVmXpg1QTfvwTABEpoBQW/FrpqO5qEexJxfIDRoGwOzy2bAu9bVyzVA6Lqkd+jdHW2vmnRXkpyTt9xy9lPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h9JzsVsJFIW5KlCZZ+JOq17nB8G73yQAPHzwPwAlFwc=;
 b=EJR8EnPPXkkRtm1ELjJPFztlhxwR8wh0fwOIxdJmuRhrqTR7PYyQlgEdsmVdnBDhuhMlbf12WAmgVv94iKUWdTszZeAOywCJ31Nw4IfxIiRZzLOabPo9u6HhPwQ7S3NSoQl2k72qHd5RirqSvtIpBMY2257YgdWtFlReE1AAbno=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3180.namprd11.prod.outlook.com (2603:10b6:5:9::13) by
 DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4778.17; Mon, 13 Dec 2021 09:09:03 +0000
Received: from DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::a94a:21d4:f847:fda8]) by DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::a94a:21d4:f847:fda8%7]) with mapi id 15.20.4755.028; Mon, 13 Dec 2021
 09:09:03 +0000
Message-ID: <0894ca20-71c8-0fbe-2ca4-70f42e5ed75d@intel.com>
Date: Mon, 13 Dec 2021 10:08:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.0
Subject: Re: [PATCH v3 2/7] drm: exynos: dsi: Use drm panel_bridge API
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Neil Armstrong <narmstrong@baylibre.com>, "Robert
 Foss" <robert.foss@linaro.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Sam Ravnborg <sam@ravnborg.org>,
 "Michael Nazzareno Trimarchi" <michael@amarulasolutions.com>, Inki Dae
 <inki.dae@samsung.com>
References: <20211212181416.3312656-1-jagan@amarulasolutions.com>
 <20211212181416.3312656-3-jagan@amarulasolutions.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20211212181416.3312656-3-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0253.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::6) To DM6PR11MB3180.namprd11.prod.outlook.com
 (2603:10b6:5:9::13)
MIME-Version: 1.0
Received: from [192.168.0.29] (88.156.143.198) by
 LO4P123CA0253.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:194::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Mon, 13 Dec 2021 09:09:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7bdd5f6-2b2c-495b-845f-08d9be183551
X-MS-TrafficTypeDiagnostic: DM4PR11MB5358:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <DM4PR11MB5358DFFAA1B0719424A9A5D9EB749@DM4PR11MB5358.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: diHqa55y/Punqp7EylR1qc8o2o3DAuiFOWEHWS9ocVsukQXX/F4WTH02J/CFCEOsMzAuC6hb1pmzgoBufYgwPjkVPr/2LGv0QEwAYbaoFxlK0c1JS7XhDWGjt5yhrCw0W/uJTYkZIOOHJZy1J5kChkR6DNtXCULdBqDng10YGzj2atuLte5QFmVVL5wR9qt0fEr57K9orrD4qgVnE70joXfHSzMIoqDbh9LngSTlOXnQOwIxu4wL2w96+kzrlzfkXeRpAbCR/OfvXx3B+fqqhh5ZmcDbBrtRio0i7HGO1bX8ubMuSKWqIzNERQdxj2XbLXOSusg/ae971Zx3uYnm1ROuMA//SdTgcrzZZc0G7gipxY9UrHGQA8kTH6YhUz+W/0VRkVz/HIAzX9FKU1Rdi+fHeVjl+mv1V9kWMcBY5/ZmqpXxD4wfPiv+OPHhYC9WsmJvOUenWh7Us1z+4OPTwUhM6vuHiaGdiCJ/uH5GttzNhJ//hrubyMLtEIh/E9epW6KpenZimXG17W7iK7WPJjXVuQ0sL7eGRh+V3GrzzQGauacB7zEA/uc1OhbbMdG1aQqKdw96WlAx50Fh/7x/lyTE+WAmQVlNbZ0YrOtsAeTUMHz2QuJHSbJeziGjsRpYZgyTE2SG/Mn0tPj2z+wJCbf057ebdULaJ3mSk+huI7h1TByiY+L82MB6T/y5pztxdqeqFRoYEozKo7xM91DS04muNfRP3Qie6jOXHuQwPDA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(508600001)(66556008)(5660300002)(82960400001)(53546011)(31696002)(2906002)(8676002)(8936002)(36916002)(316002)(83380400001)(36756003)(956004)(38100700002)(2616005)(6666004)(16576012)(31686004)(26005)(66476007)(186003)(4326008)(44832011)(110136005)(86362001)(7416002)(6486002)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1B4NE03N25GRHlvV2NBcDVTYXFvQTRIV2hHRXIvZXQ4YTQ2bFJzdG5VNjdC?=
 =?utf-8?B?UmF2R2pMOUY2VW81UmxveCtRaVdKTm5uVk5YMTExYUIzZ290czBYMElGaFFr?=
 =?utf-8?B?SDBPU2FRVnllVnl5N1hGNGR2NjFyc09LMVpKbFJBQzJDK0NicU1zNGlJSGsx?=
 =?utf-8?B?Q1FyODdMVEJSODNNbXp5dHJobWZIYnJuK0xPYU5LMUhvUHJoaHBEWkRveCt4?=
 =?utf-8?B?UE9MbDQvdGhYcTVaYWNNL2xpRXlGQVRIeVUxM0dza0d3S21uMFNJU2tGYndR?=
 =?utf-8?B?cVNBOWQrKzBZdEFzME5QNENqR01CZCtDUGZZWkIzdGZRT0tiRnd3NThaSkJq?=
 =?utf-8?B?Qi9naWhWMml5Sndoc0RsS0pKQXRnWE42N1IxZkJFdUFqZTcwT1dwYjBXanZD?=
 =?utf-8?B?VkFDamJUd3RlRXdqdUttdzdLc01hbFJtU1RmZmpQMzZ1d09kMWZ6cUNxQ0w1?=
 =?utf-8?B?TkdQQ0VhZ3VmazhwMllxWDdKSWMyaTJvMk80QlRHanJoUU53MWcrR0pTVjVs?=
 =?utf-8?B?dVZtNkdySlQ4SG5uSFdQOVZYclZRTSthRmN6dU5takJBUHFVZXE4SzR3cmd0?=
 =?utf-8?B?ZmNoQzdUUjBUcXVVMko0VDVWbHNXTjhJQmtHdnJuQU92bmt5YUVjVVA0YlJT?=
 =?utf-8?B?YmdRbkhoUVFzbWM0YjZ1YW0wcnErMzdISW1OVjBiWE02NzFLb1N5ZHU0Nzcy?=
 =?utf-8?B?UlRxM1Y3Qm1GZW1jNVAwRzViNC9raXZnYkpRb1N1bWUvN1czNzU3ZGpKTG0w?=
 =?utf-8?B?SnQ4RVUwMGYrMVcxeWRHbnRUZkI2dmg0WHhMekt1YmtGN2NkYkx5YWRBQ2ts?=
 =?utf-8?B?ZlRLNjJYZjRTam1wczVzNEhHU2FkbjY1VVJURU1VdS92RnVmQ3haTVRpRG92?=
 =?utf-8?B?K2tscjZtUGltZWRueERuRkxIbGhMUHo4WlM5bCs2d0l0NTBGRXFINko1UTRY?=
 =?utf-8?B?WnZxTjZCRmVkeERQZllMdWhER1V0dEhLalpwZDdoSVhPZ0U5dHp6aGxsdCtJ?=
 =?utf-8?B?MUJuUUlXSmJqai9jQ0lEMzdKTnczekJwNEZCeDdJMEpUYjVFYWZaamQ2SVQ0?=
 =?utf-8?B?WUdCQlpUU09xRjlwQ21odS9PNDVLQUw4YlBlTDBWR2ZxTUkyaTQ1SXZqU0lH?=
 =?utf-8?B?OGd3Z1Q1d1dFcnhPVExMUW94MzR5YkFzRjVDZkJGc2liL1krWDl3cnJiQ3dG?=
 =?utf-8?B?TjU0YWozRGtXcmYvb2JDSitDRjZQdEV4VWxXV3dYZ01scUZOU0NUeU4yNHFX?=
 =?utf-8?B?Y2RCcnV6Y1RyTmZoY2N0S2pFQlRhZUsyNFVxZTFVWFlzWUhNR1M3Vmo5ZU9i?=
 =?utf-8?B?eU1yYndpR1E4UjJjYWIwR3pSRXFuYTJCV3M5R3FXNVRNU01xNmZjemtPVWhu?=
 =?utf-8?B?Z2x3OTVLUkR5dHdjdi8rVzBjd044cmM5NGRMWkROVklwRGR3d05xYkFMYmJR?=
 =?utf-8?B?dTZDYVBYT2pNNnk4b1VmZTF3L2JYdHJDMVkyeXlGTWVlVGtUZlNkRzJXTEFO?=
 =?utf-8?B?c1V5TlBtSkhudmJ0WWN3alFLcmF6UlRlU3ZWT2NmVG5QRGlCUUZOZnZQTkVy?=
 =?utf-8?B?dUdoS0NZZjlLK0hnaFNzVWJLbVN0eHdMU0RRM040ZHFBMmFXbXlmZlh0clAz?=
 =?utf-8?B?SVZWNkJPSHc3aHdLNnlXbVJwYkg5aDVRYWppSjNIVHNrQlhvTmM1V0VhS0ND?=
 =?utf-8?B?SXZvb0x3VFNZd2NzQVkzZUdTd3VnTXpuWXpFaUtycVJDeGxaNThlZkMyMUhM?=
 =?utf-8?B?REZjcDdXdjVJbUtDZzAraEx4MXp6ZnorQUNrMFd6bXlpYmFBUHFzckhSOS9V?=
 =?utf-8?B?K3orRjd0ZEwxVm14K3EzWldUekVkMTZKZEVrMUUzUkdwQm01YXNKN3ExaG8x?=
 =?utf-8?B?Q3paQlFBSjk2clhJeVNSSHlMUGd1WEZ5R2dYSStTVitxQ293T0cydXhOK1FG?=
 =?utf-8?B?OFBLdmpPa2dnL0Y1VllWY2RIWDRqK09KNmJibFBTclNkMEZZKzdTU2tLTHpt?=
 =?utf-8?B?dk1VMHFhc0NmT21pM3VOeWtaQTJPNDB1WDdhZGZ3QkUzVTZXZzFMN0ZhenZk?=
 =?utf-8?B?cENzV1kyc3Z4N3paNHpiWHNsTForblpOcW9jcC9CaE1LRGFXMW5COUI4LzhN?=
 =?utf-8?B?RjViSzUvck4rSDUyMndFcnppeWpta09qVW1mVGNyYUhsRjNZaUtNckdJV0Yy?=
 =?utf-8?Q?0W4tTorio/Uu56xO9+F6+xs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e7bdd5f6-2b2c-495b-845f-08d9be183551
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 09:09:03.4781 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8jwICiSL78ltKx1vJ3nPXG/1vtkxsABsR91EiQMR+UwOytSLI0rT4jvwOTIw7tezQQALJlNjvFW/hSOk4A0Nsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5358
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


On 12.12.2021 19:14, Jagan Teki wrote:
> Replace the manual panel handling code by a drm panel_bridge via
> devm_drm_of_get_bridge().
>
> Adding panel_bridge handling,
>
> - Drops drm_connector and related operations as drm_bridge_attach
>    creates connector during attachment.
>
> - Drops panel pointer and iterate the bridge, so-that it can operate
>    the normal bridge and panel_bridge in constitutive callbacks.
>
> This simplifies the driver and allows all components in the display
> pipeline to be treated as bridges.
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v3:
> - fix port number
> - add print for attached device
> Changes for v2:
> - new patch
>
>   drivers/gpu/drm/exynos/exynos_drm_dsi.c | 165 ++++--------------------
>   1 file changed, 26 insertions(+), 139 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index 0bb44e476633..d1039628b6f2 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -221,6 +221,11 @@ enum exynos_dsi_transfer_type {
>   	EXYNOS_DSI_RX,
>   };
>   
> +enum {
> +	DSI_PORT_IN,
> +	DSI_PORT_OUT
> +};
> +
>   struct exynos_dsi_transfer {
>   	struct list_head list;
>   	struct completion completed;
> @@ -254,8 +259,6 @@ struct exynos_dsi_driver_data {
>   struct exynos_dsi {
>   	struct drm_encoder encoder;
>   	struct mipi_dsi_host dsi_host;
> -	struct drm_connector connector;
> -	struct drm_panel *panel;
>   	struct list_head bridge_chain;
>   	struct drm_bridge *out_bridge;
>   	struct device *dev;
> @@ -285,7 +288,6 @@ struct exynos_dsi {
>   };
>   
>   #define host_to_dsi(host) container_of(host, struct exynos_dsi, dsi_host)
> -#define connector_to_dsi(c) container_of(c, struct exynos_dsi, connector)
>   
>   static inline struct exynos_dsi *encoder_to_dsi(struct drm_encoder *e)
>   {
> @@ -1391,42 +1393,21 @@ static void exynos_dsi_enable(struct drm_encoder *encoder)
>   
>   	dsi->state |= DSIM_STATE_ENABLED;
>   
> -	if (dsi->panel) {
> -		ret = drm_panel_prepare(dsi->panel);
> -		if (ret < 0)
> -			goto err_put_sync;
> -	} else {
> -		list_for_each_entry_reverse(iter, &dsi->bridge_chain,
> -					    chain_node) {
> -			if (iter->funcs->pre_enable)
> -				iter->funcs->pre_enable(iter);
> -		}
> +	list_for_each_entry_reverse(iter, &dsi->bridge_chain, chain_node) {
> +		if (iter->funcs->pre_enable)
> +			iter->funcs->pre_enable(iter);
>   	}
>   
>   	exynos_dsi_set_display_mode(dsi);
>   	exynos_dsi_set_display_enable(dsi, true);
>   
> -	if (dsi->panel) {
> -		ret = drm_panel_enable(dsi->panel);
> -		if (ret < 0)
> -			goto err_display_disable;
> -	} else {
> -		list_for_each_entry(iter, &dsi->bridge_chain, chain_node) {
> -			if (iter->funcs->enable)
> -				iter->funcs->enable(iter);
> -		}
> +	list_for_each_entry(iter, &dsi->bridge_chain, chain_node) {
> +		if (iter->funcs->enable)
> +			iter->funcs->enable(iter);
>   	}
>   
>   	dsi->state |= DSIM_STATE_VIDOUT_AVAILABLE;
>   	return;
> -
> -err_display_disable:
> -	exynos_dsi_set_display_enable(dsi, false);
> -	drm_panel_unprepare(dsi->panel);
> -
> -err_put_sync:
> -	dsi->state &= ~DSIM_STATE_ENABLED;
> -	pm_runtime_put(dsi->dev);
>   }
>   
>   static void exynos_dsi_disable(struct drm_encoder *encoder)
> @@ -1439,17 +1420,12 @@ static void exynos_dsi_disable(struct drm_encoder *encoder)
>   
>   	dsi->state &= ~DSIM_STATE_VIDOUT_AVAILABLE;
>   
> -	if (dsi->panel)
> -		drm_panel_disable(dsi->panel);
> -
>   	list_for_each_entry_reverse(iter, &dsi->bridge_chain, chain_node) {
>   		if (iter->funcs->disable)
>   			iter->funcs->disable(iter);
>   	}
>   
>   	exynos_dsi_set_display_enable(dsi, false);
> -	if (dsi->panel)
> -		drm_panel_unprepare(dsi->panel);
>   
>   	list_for_each_entry(iter, &dsi->bridge_chain, chain_node) {
>   		if (iter->funcs->post_disable)
> @@ -1460,70 +1436,6 @@ static void exynos_dsi_disable(struct drm_encoder *encoder)
>   	pm_runtime_put_sync(dsi->dev);
>   }
>   
> -static enum drm_connector_status
> -exynos_dsi_detect(struct drm_connector *connector, bool force)
> -{
> -	return connector->status;
> -}
> -
> -static void exynos_dsi_connector_destroy(struct drm_connector *connector)
> -{
> -	drm_connector_unregister(connector);
> -	drm_connector_cleanup(connector);
> -	connector->dev = NULL;
> -}
> -
> -static const struct drm_connector_funcs exynos_dsi_connector_funcs = {
> -	.detect = exynos_dsi_detect,
> -	.fill_modes = drm_helper_probe_single_connector_modes,
> -	.destroy = exynos_dsi_connector_destroy,
> -	.reset = drm_atomic_helper_connector_reset,
> -	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> -	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> -};
> -
> -static int exynos_dsi_get_modes(struct drm_connector *connector)
> -{
> -	struct exynos_dsi *dsi = connector_to_dsi(connector);
> -
> -	if (dsi->panel)
> -		return drm_panel_get_modes(dsi->panel, connector);
> -
> -	return 0;
> -}
> -
> -static const struct drm_connector_helper_funcs exynos_dsi_connector_helper_funcs = {
> -	.get_modes = exynos_dsi_get_modes,
> -};
> -
> -static int exynos_dsi_create_connector(struct drm_encoder *encoder)
> -{
> -	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
> -	struct drm_connector *connector = &dsi->connector;
> -	struct drm_device *drm = encoder->dev;
> -	int ret;
> -
> -	connector->polled = DRM_CONNECTOR_POLL_HPD;
> -
> -	ret = drm_connector_init(drm, connector, &exynos_dsi_connector_funcs,
> -				 DRM_MODE_CONNECTOR_DSI);
> -	if (ret) {
> -		DRM_DEV_ERROR(dsi->dev,
> -			      "Failed to initialize connector with drm\n");
> -		return ret;
> -	}
> -
> -	connector->status = connector_status_disconnected;
> -	drm_connector_helper_add(connector, &exynos_dsi_connector_helper_funcs);
> -	drm_connector_attach_encoder(connector, encoder);
> -	if (!drm->registered)
> -		return 0;
> -
> -	connector->funcs->reset(connector);
> -	drm_connector_register(connector);
> -	return 0;
> -}
> -
>   static const struct drm_encoder_helper_funcs exynos_dsi_encoder_helper_funcs = {
>   	.enable = exynos_dsi_enable,
>   	.disable = exynos_dsi_disable,
> @@ -1537,31 +1449,20 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
>   	struct exynos_dsi *dsi = host_to_dsi(host);
>   	struct drm_encoder *encoder = &dsi->encoder;
>   	struct drm_device *drm = encoder->dev;
> -	struct drm_bridge *out_bridge;
> -
> -	out_bridge  = of_drm_find_bridge(device->dev.of_node);
> -	if (out_bridge) {
> -		drm_bridge_attach(encoder, out_bridge, NULL, 0);
> -		dsi->out_bridge = out_bridge;
> -		list_splice_init(&encoder->bridge_chain, &dsi->bridge_chain);
> -	} else {
> -		int ret = exynos_dsi_create_connector(encoder);
> -
> -		if (ret) {
> -			DRM_DEV_ERROR(dsi->dev,
> -				      "failed to create connector ret = %d\n",
> -				      ret);
> -			drm_encoder_cleanup(encoder);
> -			return ret;
> -		}
> +	int ret;
>   
> -		dsi->panel = of_drm_find_panel(device->dev.of_node);
> -		if (IS_ERR(dsi->panel))
> -			dsi->panel = NULL;
> -		else
> -			dsi->connector.status = connector_status_connected;
> +	dsi->out_bridge = devm_drm_of_get_bridge(dsi->dev, dsi->dev->of_node, DSI_PORT_OUT, 0);
> +	if (IS_ERR(dsi->out_bridge)) {
> +		ret = PTR_ERR(dsi->out_bridge);
> +		DRM_DEV_ERROR(dsi->dev, "failed to find the bridge: %d\n", ret);
> +		return ret;
>   	}
>   
> +	DRM_DEV_INFO(dsi->dev, "Attached %s device\n", device->name);
> +
> +	drm_bridge_attach(encoder, dsi->out_bridge, NULL, 0);
> +	list_splice_init(&encoder->bridge_chain, &dsi->bridge_chain);
> +
>   	/*
>   	 * This is a temporary solution and should be made by more generic way.
>   	 *
> @@ -1569,7 +1470,7 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
>   	 * TE interrupt handler.
>   	 */
>   	if (!(device->mode_flags & MIPI_DSI_MODE_VIDEO)) {
> -		int ret = exynos_dsi_register_te_irq(dsi, &device->dev);
> +		ret = exynos_dsi_register_te_irq(dsi, &device->dev);
>   		if (ret)
>   			return ret;
>   	}
> @@ -1596,18 +1497,9 @@ static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
>   	struct exynos_dsi *dsi = host_to_dsi(host);
>   	struct drm_device *drm = dsi->encoder.dev;
>   
> -	if (dsi->panel) {
> -		mutex_lock(&drm->mode_config.mutex);
> -		exynos_dsi_disable(&dsi->encoder);
> -		dsi->panel = NULL;
> -		dsi->connector.status = connector_status_disconnected;
> -		mutex_unlock(&drm->mode_config.mutex);
> -	} else {
> -		if (dsi->out_bridge->funcs->detach)
> -			dsi->out_bridge->funcs->detach(dsi->out_bridge);
> -		dsi->out_bridge = NULL;
> -		INIT_LIST_HEAD(&dsi->bridge_chain);
> -	}
> +	if (dsi->out_bridge->funcs->detach)
> +		dsi->out_bridge->funcs->detach(dsi->out_bridge);
> +	INIT_LIST_HEAD(&dsi->bridge_chain);


This is fishy. Currently the only bridge used with exynos_dsi (tc358764) 
on detach callback unregisters/puts the connector it has created.

With this code panel_bridge on detach will call drm_connector_cleanup, 
which will WARN about unregistered connector - ie it assumes detach 
should be called at least AFTER unregistration of exynos_drm device (???).

Since panel/bridge unbind in general case is not handled properly maybe 
it is not an issue :)


Regards

Andrzej


>   
>   	if (drm->mode_config.poll_enabled)
>   		drm_kms_helper_hotplug_event(drm);
> @@ -1663,11 +1555,6 @@ static int exynos_dsi_of_read_u32(const struct device_node *np,
>   	return ret;
>   }
>   
> -enum {
> -	DSI_PORT_IN,
> -	DSI_PORT_OUT
> -};
> -
>   static int exynos_dsi_parse_dt(struct exynos_dsi *dsi)
>   {
>   	struct device *dev = dsi->dev;
