Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F27834922A8
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 10:25:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5AD510ED72;
	Tue, 18 Jan 2022 09:25:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F30E10ED72
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 09:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642497903; x=1674033903;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=meFk2j7HK8OeUlOuzKPEYbgMISRwtf7pwni7AKClPxY=;
 b=j5WyqjZK8skaAgIY0jvgk4vpBZMzFjOk876Oq/SEu1AKaGIp0dCgEisu
 Edg8QG+phlopUfJ+mZNzvOP7XCy+i9vuFbvFnOvSCqHMyy9SmNhHKUE68
 6F9TCDK/9V5wBMGMXShQ6jELIalcHAxLM+HiDAggyB+Y5Jb5Lc0oWXfc6
 i5c1ENN/0NGeojPXaDhHKaI5cfTmfSJ6lsNcdnn7AHrMBTAHyBqu/s758
 3LRfaA5jvWhPVBwVecq55vBlv59pX4tW3OsIoxwz3ta3Yy+10G3XJmXPx
 eFP2tSdbeznAv7I6AiiMx9e+RWJBpHYWcx+S/XCA8Wr2ySh6RDTKAADVy Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10230"; a="243598510"
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; d="scan'208";a="243598510"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2022 01:25:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; d="scan'208";a="531707991"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 18 Jan 2022 01:25:02 -0800
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 18 Jan 2022 01:25:02 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 18 Jan 2022 01:25:02 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 18 Jan 2022 01:25:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BF5mfGzWprwnh0rnyO6VyFpFXP9W5FbzFBL4f6gaznyrum1Bo6tkJCRUDLj6jU1xgmtaREOE6J2svKv85S8ewccO3LWTr6/C7n4RxwQSfuaZh0/OE8eai5G1nF5hhrec4kPIiAvs2WLgg9wIJFSl2rlORlOePSWsiNctjDdp9PPUKL0GVioYfeJyBPJce19EzgNCLj/QGehHF+UMOTqOGE1GV3K3CzWQCv9xtiSEceudVusr3VVmOodEN37/aKhMEXDx9zdWeU5AkfgtIzKCJV/TDjoEq8ZQMxt3EocDpc5AkDQcvt7sLzQZHwfjvjdwc60rRzI1LNeN9P3/TNDreA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jtXxTKj5f4XUzrOCQX8YHdNluq5j2I5yfDYpNWYyA/4=;
 b=mAvQATVFvIhn5xq9xJMkpGTKAc/1GVX3O/LgfetaiVKFpB+0sTZcdDlOmbXMDoBCqW9if7W+ey4jvJR/tGqORd9iLNKHSdfQUScpNROLXHBaKS9mCVsTLNmDhb2r2Iz8tDFq7IwjIs6x7ZavRsw4hRNCdUEeQZPtqZCIoxxbPfomPkDdHLaGRn3PcSUZWU7/JRI3QUPxq4nwfiLOM+osAVwluhpLBf8hgRCJ30isXP7DGsIf6waRwizD1xNjt175MV9jPRMUE5UGDLw7xQ9JLWpEDx+BlfwOz9hzLCJ3wcVTs9dEtv/C0v6in13m7vAkEdYlCsqSSqzbF0rd16zJhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3180.namprd11.prod.outlook.com (2603:10b6:5:9::13) by
 DM6PR11MB3723.namprd11.prod.outlook.com (2603:10b6:5:13f::25) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.9; Tue, 18 Jan 2022 09:25:00 +0000
Received: from DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::b47a:6157:f9b5:b01d]) by DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::b47a:6157:f9b5:b01d%3]) with mapi id 15.20.4888.014; Tue, 18 Jan 2022
 09:25:00 +0000
Message-ID: <96cd66cd-8e90-5f68-6009-f48015400aae@intel.com>
Date: Tue, 18 Jan 2022 10:24:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH] phy: dphy: Correct clk_pre parameter
Content-Language: en-US
To: Liu Ying <victor.liu@nxp.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>
References: <20220118025918.1444288-1-victor.liu@nxp.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20220118025918.1444288-1-victor.liu@nxp.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0254.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::7) To DM6PR11MB3180.namprd11.prod.outlook.com
 (2603:10b6:5:9::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a181aa0b-31b2-4b60-66a4-08d9da646630
X-MS-TrafficTypeDiagnostic: DM6PR11MB3723:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <DM6PR11MB3723DEDF82FA3AFBFC716C0BEB589@DM6PR11MB3723.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t6uBN/AMm3M/0CTdUdBeeq5Txr7a+MApIetPEFZLK030pekXqo/d97E10suKFd3kDbiiInBZiGTpewIL1HzPSC6GD19dGbRhOvb1vsPQQKHo0r+eVwdfNflcXXjsWcZB7JXuvBBEa6uRt8+LXvkWbPJzc62C/KI1sjmlwDVMAgiEMMEBAkPMurQoG9EZhO4GlV+jLsGeCA2lWhpR1M8VppAtgLDJ56ee3SQjVwhjQ/H9/MCf8rTezqGi7CE5n2qSr/6DVs55oTrc3Ow1fEyyNWr6I9WqiCP/XKAGqd7rTgRv03+9pWv0F2gtqjVebLkRqVxOFcSubppAUTwO5MRRjLUcKMIaxOyvNWiVJK2VphbBS15OVp9ZxLueq4OT4Mhao89nRL9nFUDr41NZRB/J7HIoQtEvGHrvZA3wu5VJWg5UxZTI7yhzeXJpyhV6A8tt0iGxEiRIdKWEvi71CXlM2E4v7r0Bi1NCLHFR0tg9cRXBcwfWG8LBtFlFbouccALESKgHDEQbqInuLVEqmmMok5UV8KiN9IF4Dg8QvZQzxSe+ZFwrRT+vJmigXuVqhj0JGrR2dOeUTuPx0RSOotOSejiQ0/qir6UpJwZ/87hJJB6WI238sAmwUVAG5mQPlEo1nf7qMVn+/P3oJI8AqPkpu1J0NJcTWG7w3zVyOc1Vo1bz+jHpzFD86YMdWcFpp2HrMUFQMhOJ5mXH45/WuPX4RcnqSJjnCkRIgWpxG+CpQRQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(44832011)(36916002)(2906002)(2616005)(4326008)(6486002)(53546011)(6506007)(31686004)(31696002)(66574015)(86362001)(508600001)(186003)(36756003)(66556008)(66476007)(66946007)(6666004)(26005)(7416002)(83380400001)(6512007)(82960400001)(54906003)(8936002)(38100700002)(5660300002)(8676002)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjVHR2NtK3dhUkhCalYzZUNTaGdXeXYzVjZiSTFjbW1Sa1BveEowK2VPYndn?=
 =?utf-8?B?dmtEZ1NraXJtV3BQTytwWGduZldnWnNDVmV6Y3ZqN2NyTjRzWW1WdDlwMTFH?=
 =?utf-8?B?dTZmaVlhS3lxdWlOZ1czRVR0eTU4MHhpOVhPdk4xSExybFVES2ZpMC9XK2h6?=
 =?utf-8?B?Q2ZrQUp2RzVxekhReUJISlNhUTY4QmRHZVNSTzk1TjE3RGpoUHQ4VHRiS3dY?=
 =?utf-8?B?aDFPZ2JGWHcySnA5ejBxY3I1TTVudzh5SnFiZXAySzFaUVBuVy9SYytxc3BU?=
 =?utf-8?B?UFhhQ3NiKzV5Z0Z2b1hERlhrenVJNmJ0SGNMQWRaL1lJYW5oRFVzS3diUERs?=
 =?utf-8?B?bW0xbW82MmMza2w2UTZtZnJEdU56eE9rN2xUY2Zka3lQVm5rNXRzT1RXMmV2?=
 =?utf-8?B?S2hSVFNMdGpscDhWSitudUh4b3pZUjhQVHhuTENWMjRzT2tWWFBDMFV0bUNp?=
 =?utf-8?B?TkhIZ3pwcFVIRXpycHNoTFVFV2xhTDc5MWlqbEdwTW1hdVRDZkI5R0kwNTRq?=
 =?utf-8?B?ZDNwSmlDMGhpamJSVjVBbjkxbno4QWdvbWNIN3Q1TStaUTlBOGdGRDZJbklK?=
 =?utf-8?B?OEkyQkFNL3FrWGJNRUZIL3FaNnFTR214VXpxRHVUeEZHSUllRXNsVWJqUFBr?=
 =?utf-8?B?b3F3NkUrdXpsRWYrWkdQSzNtRHJ6UlQ4Mitub0pvUU5HakpzUXNuN2o5dEFT?=
 =?utf-8?B?MU9qYXB4SGFnM0JIWUhnTjRUU2NVN3lJU0xDK29Qc2NpQmtMUzVsWDRTb01H?=
 =?utf-8?B?akJncHdzak94UHhQbHVkZHZmbStMMWxFL1JvQWpxMXlxbmt5OUpzdlRZWjBr?=
 =?utf-8?B?OGI4YllpNTJOMFh3R0ZMc3FMSkMyV1BmOTZhbURsUGQ1NDdRTGpscEtRdE9k?=
 =?utf-8?B?dVh6YnVkalVxNk9jM3BTRkVkeWZGYm93Y1NwQ2RlSmRYTUo3QjRNL0t1bUtB?=
 =?utf-8?B?elpDZ0FoNmxoV0RKdGpQWEc3RGhneFhNNGpsVGVYWEhZak12eUxtNGFmdFpx?=
 =?utf-8?B?VExnVzdTMVQ1NXB5RWozTWg4OGw4ZW14TlI1WDNMbXM2L3Fud0tveGtHc0Yx?=
 =?utf-8?B?NlYyUlEySHpiUFVPMlZJUDVzRkdGUU5zZUJWeGpaNHdVYk9mdnVkRVA4VUgz?=
 =?utf-8?B?T3hjaWsrOG50cnhPdUtIRUwwb3JFRmdPK296M0cyRzUwSHZpRzVIWC9TLy9T?=
 =?utf-8?B?cEF3S0RXUVR5UGxFSWdzSkd2cmZBcWJqa0hPdmhRdmE1cUxKOGxkdUR4VUEy?=
 =?utf-8?B?Um5DUWNBSk9GUG9PM1VOMU0zOFl0b05meW5kZXk5bkhYQkI1UTNZRmNQSGRv?=
 =?utf-8?B?Ry9WRElpaE1HcVVhcUovRndIZDJ1M0k4V0gwV0l0bHVFTGJSVnlJZGdJbzBv?=
 =?utf-8?B?YmIxS0JwZ2dSMHhFcDBJTnlRai9xN204TEFVNE14bk1sM1V0ZVJiYThFNDIw?=
 =?utf-8?B?aGpXcWJnOGg3alpMWXZnRWtMSzJRK3hsdGg4L09vYlFlS09TQUovMjdLUzhI?=
 =?utf-8?B?Ni8rVUpVcVFXYXZSNlpuR3k5ZWRkbmRma1dFK3JyRFBKK2pUMXRsRVMvNkVV?=
 =?utf-8?B?ZVh4Wjc0MTY4clVraXVBcjkvai9hOCsxcE1JamJmOGFTbHpGQkt5M2xUTTBD?=
 =?utf-8?B?RTBYSXNiMFQ2VjBleXJqdXRNaVN4UmJkMlpDSy9nb0k2ZE9tUjRvM2dSZm12?=
 =?utf-8?B?Sllqdk95ZXZEK3hKTU92aHBCUVkzdEwrODFLN0wvMUg5ZkRnSjNmYmVWSGxO?=
 =?utf-8?B?YTJlemNiVGJFeDdBTDBhZkdsRm1wYlZGcWdmWWo2bUllQWdaQkdyODZydE44?=
 =?utf-8?B?TlRhS0h1UStxMGxwN3FMVWQ4T3NkQXBtdnFCTmtoR21scnRHMUd4WEpvVnpJ?=
 =?utf-8?B?ZUtINDhtY2M4djVtZ0ljcW5KRFdwL0t6dUZ6RjNwUzRDemhLWGVPUjE3ZTdy?=
 =?utf-8?B?ak50ZVpyK2U5WlpyUDljdDJLdXNDNmpHcGRrdW9ER05oUHZ3aTgwdjhlVWox?=
 =?utf-8?B?eURvcXllRmRVekxiQ2t2RHNpQWZ4K2h0UWJWMFYwTkpSd3haQ3psbkdUeFRY?=
 =?utf-8?B?ZDhmdUc2L1ZsMjRCb2QvdEh6S1FVWFNoV2UyRXU0K2hwMklLY1NpTzcrOTND?=
 =?utf-8?B?VWJHR2RDU3k1cUhOVC9lRWZ6ZFNhSjFtTGw3L3ZMRWNERUZielNwS085a25z?=
 =?utf-8?Q?ziWo0a6AIJAvbnwYoh+m5QA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a181aa0b-31b2-4b60-66a4-08d9da646630
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 09:24:59.9418 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v/T3KdvJjZ9hkNDxInmQp8AqMbv1pwciGF5tqV7uLW1HF5UJj5XPYLtwxxqutfux2+bukkQvmH2wMEOMHUw15A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3723
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>,
 =?UTF-8?Q?Guido_G=c3=bcnther?= <agx@sigxcpu.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Vinod Koul <vkoul@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 18.01.2022 03:59, Liu Ying wrote:
> The D-PHY specification (v1.2) explicitly mentions that the T-CLK-PRE
> parameter's unit is Unit Interval(UI) and the minimum value is 8.  Also,
> kernel doc of the 'clk_pre' member of struct phy_configure_opts_mipi_dphy
> mentions that it should be in UI.  However, the dphy core driver wrongly
> sets 'clk_pre' to 8000, which seems to hint that it's in picoseconds.
> And, the kernel doc of the 'clk_pre' member wrongly says the minimum value
> is '8 UI', instead of 8.
>
> So, let's fix both the dphy core driver and the kernel doc of the 'clk_pre'
> member to correctly reflect the T-CLK-PRE parameter's unit and the minimum
> value according to the D-PHY specification.
>
> I'm assuming that all impacted custom drivers shall program values in
> TxByteClkHS cycles into hardware for the T-CLK-PRE parameter.  The D-PHY
> specification mentions that the frequency of TxByteClkHS is exactly 1/8
> the High-Speed(HS) bit rate(each HS bit consumes one UI).  So, relevant
> custom driver code is changed to program those values as
> DIV_ROUND_UP(cfg->clk_pre, MIPI_DPHY_UI_PER_TXBYTECLKHS_PERIOD), then.
>
> Note that I've only tested the patch with RM67191 DSI panel on i.MX8mq EVK.
> Help is needed to test with other i.MX8mq, Meson and Rockchip platforms,
> as I don't have the hardwares.
>
> Fixes: 2ed869990e14 ("phy: Add MIPI D-PHY configuration options")
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Kishon Vijay Abraham I <kishon@ti.com>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Guido Günther <agx@sigxcpu.org>
> Tested-by: Liu Ying <victor.liu@nxp.com> # RM67191 DSI panel on i.MX8mq EVK
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>   drivers/gpu/drm/bridge/nwl-dsi.c                 | 7 ++-----
>   drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c    | 3 ++-
>   drivers/phy/phy-core-mipi-dphy.c                 | 4 ++--
>   drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c | 3 ++-
>   include/linux/phy/phy-mipi-dphy.h                | 4 +++-
>   5 files changed, 11 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
> index a7389a0facfb..f1fdcdf763ee 100644
> --- a/drivers/gpu/drm/bridge/nwl-dsi.c
> +++ b/drivers/gpu/drm/bridge/nwl-dsi.c
> @@ -196,12 +196,9 @@ static u32 ps2bc(struct nwl_dsi *dsi, unsigned long long ps)
>   /*
>    * ui2bc - UI time periods to byte clock cycles
>    */
> -static u32 ui2bc(struct nwl_dsi *dsi, unsigned long long ui)
> +static u32 ui2bc(struct nwl_dsi *dsi, unsigned int ui)
>   {
> -	u32 bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
> -
> -	return DIV64_U64_ROUND_UP(ui * dsi->lanes,
> -				  dsi->mode.clock * 1000 * bpp);
> +	return DIV_ROUND_UP(ui, MIPI_DPHY_UI_PER_TXBYTECLKHS_PERIOD);


I have some doubts here. According to specs:

     UI - duration of any HS state on the Clock Lane,

     TxByteClkHS - exactly 1/8 the High-Speed(HS) bit rate

I'd like to emphasize "BIT RATE" above (not clock rate).

In such case I would expect that ui2bc would take into account number of 
lanes:

byte clock cycles = div_round_up(ui * dsi->lanes, 8)

So in case of one lane we need 8 ticks to get byte, and in case of 4 
lanes 2 ticks are enough.

Am I correct, or I've missed sth?


>   }
>   
>   /*
> diff --git a/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c b/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c
> index cd2332bf0e31..8a818cdb7606 100644
> --- a/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c
> +++ b/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c
> @@ -250,7 +250,8 @@ static int phy_meson_axg_mipi_dphy_power_on(struct phy *phy)
>   		     (DIV_ROUND_UP(priv->config.clk_zero, temp) << 16) |
>   		     (DIV_ROUND_UP(priv->config.clk_prepare, temp) << 24));
>   	regmap_write(priv->regmap, MIPI_DSI_CLK_TIM1,
> -		     DIV_ROUND_UP(priv->config.clk_pre, temp));
> +		     DIV_ROUND_UP(priv->config.clk_pre,
> +				  MIPI_DPHY_UI_PER_TXBYTECLKHS_PERIOD));
>   
>   	regmap_write(priv->regmap, MIPI_DSI_HS_TIM,
>   		     DIV_ROUND_UP(priv->config.hs_exit, temp) |
> diff --git a/drivers/phy/phy-core-mipi-dphy.c b/drivers/phy/phy-core-mipi-dphy.c
> index 288c9c67aa74..ccb4045685cd 100644
> --- a/drivers/phy/phy-core-mipi-dphy.c
> +++ b/drivers/phy/phy-core-mipi-dphy.c
> @@ -36,7 +36,7 @@ int phy_mipi_dphy_get_default_config(unsigned long pixel_clock,
>   
>   	cfg->clk_miss = 0;
>   	cfg->clk_post = 60000 + 52 * ui;
> -	cfg->clk_pre = 8000;
> +	cfg->clk_pre = 8;
>   	cfg->clk_prepare = 38000;
>   	cfg->clk_settle = 95000;
>   	cfg->clk_term_en = 0;
> @@ -97,7 +97,7 @@ int phy_mipi_dphy_config_validate(struct phy_configure_opts_mipi_dphy *cfg)
>   	if (cfg->clk_post < (60000 + 52 * ui))
>   		return -EINVAL;
>   
> -	if (cfg->clk_pre < 8000)
> +	if (cfg->clk_pre < 8)
>   		return -EINVAL;
>   
>   	if (cfg->clk_prepare < 38000 || cfg->clk_prepare > 95000)
> diff --git a/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c b/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c
> index 347dc79a18c1..67b0a17be7e3 100644
> --- a/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c
> +++ b/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c
> @@ -364,7 +364,8 @@ static void inno_dsidphy_mipi_mode_enable(struct inno_dsidphy *inno)
>   	 * The value of counter for HS Tclk-pre
>   	 * Tclk-pre = Tpin_txbyteclkhs * value
>   	 */
> -	clk_pre = DIV_ROUND_UP(cfg->clk_pre, t_txbyteclkhs);
> +	clk_pre = DIV_ROUND_UP(cfg->clk_pre,
> +			       MIPI_DPHY_UI_PER_TXBYTECLKHS_PERIOD);
>   
>   	/*
>   	 * The value of counter for HS Tlpx Time
> diff --git a/include/linux/phy/phy-mipi-dphy.h b/include/linux/phy/phy-mipi-dphy.h
> index a877ffee845d..ab1f736fbcd3 100644
> --- a/include/linux/phy/phy-mipi-dphy.h
> +++ b/include/linux/phy/phy-mipi-dphy.h
> @@ -6,6 +6,8 @@
>   #ifndef __PHY_MIPI_DPHY_H_
>   #define __PHY_MIPI_DPHY_H_
>   
> +#define MIPI_DPHY_UI_PER_TXBYTECLKHS_PERIOD	8


Do we need to define it? I guess it is just BITS_PER_BYTE.


Regards

Andrzej


> +
>   /**
>    * struct phy_configure_opts_mipi_dphy - MIPI D-PHY configuration set
>    *
> @@ -42,7 +44,7 @@ struct phy_configure_opts_mipi_dphy {
>   	 * the transmitter prior to any associated Data Lane beginning
>   	 * the transition from LP to HS mode.
>   	 *
> -	 * Minimum value: 8 UI
> +	 * Minimum value: 8
>   	 */
>   	unsigned int		clk_pre;
>   
