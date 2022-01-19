Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B83493587
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 08:36:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 801C310E16E;
	Wed, 19 Jan 2022 07:36:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09C7510E16E
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 07:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642577764; x=1674113764;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mVJzRDynR07tPUlvByhtWIigVtY5mD2izBl0rItpOmQ=;
 b=kdvhRFDJd1cCM23ZiDZ+BhR+aZ3bg4aJdjgWKcPpy4rZ5UPdyqzcdEAl
 I6Cz9ZlOIQ7ypfTtVHdGvUkNugzijOVDHGhgwpf18MzA3sITO11Z5vw0i
 t0S5n2t98k4DQ9G8/mWIHvM4LmXD7MGCst4GueGw6mI9kPtiJmk9Qkpna
 cePqEI5/mGv47pI4o+BTU6vEfTp/ut+x9QDibvaVEzXULIxJOJ/mZttSz
 YEgwkYdf9uH3/4OfYtJsV18aolaIN+qiDBY1NCY/Qu6sYGURd29Zhy814
 vlMEixlJKg4h8rJMsk7+tmOeXoENXxZbz08hfw1vKQRsKZ/sBmz1wBM92 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10231"; a="244801582"
X-IronPort-AV: E=Sophos;i="5.88,299,1635231600"; d="scan'208";a="244801582"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2022 23:36:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,299,1635231600"; d="scan'208";a="672095651"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP; 18 Jan 2022 23:36:03 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 18 Jan 2022 23:36:02 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 18 Jan 2022 23:36:02 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 18 Jan 2022 23:36:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R2w8I7qF8xuCEYlsUgaVES//pBAWN5G+oj7pBtF1IMzLIv8qnLW0uD6x68B6n6V3uNav8/fbalb1hkCoSbrJMVjUgneuT1PWc7BcCrXXMe2rgh5Y+OWm121zeEbnZZI5HLjONn83iIKc9PD+GYT0Bo9XpdPNzrDK3Z6/2IEMJNc1vupepTTqHqmKju4ERSawefw3YpAzupDhz+fWx2Bk/zfk/+zddKXE6YPMTvkXh+0Tgg4bsUxPKx+mVM8PbYJpw/XZ7qriCMk3dhkLXM4srU6euHt9h/wQ2Q05MgE6X0CZvo5zN5OFSKl2eUQxnUxeNzTyMRnvmSolZN4Rji2TKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/09zLKIl4r6qXGkjqoezwe9LQHw9hWAGC13A9/JFqW8=;
 b=LbLch/0gRPecjS0MEL8tpezmauiZQb1G4ZOm7HX5lu5Dc+Bj2VXEVGCB4sK0t8WaKAC8CgfUZINWT/nuxEWcKPzp6vkwea1nHHsza6S6TVHP8G49McSHkmokYVi0FihlHhdVL4Xol8JUHcYMhVokCtFqhrXk+F+S/RGEUSJ6gH+wXPiS03FgpUcP0rpFPCtKYGGvmvXfL1BZ1CYKyh8GKx01D0R+2lBJvv/Odhv66IwF+lvHohMcNNFmQZJh3FWbti7fnucDcy53YoNhrma0afpaY8PbRKKYNoxuhnjJES0/P8x/BJb4JKk+DV/fGnvO5mWfs/b7a/kHhm7iiovbdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3180.namprd11.prod.outlook.com (2603:10b6:5:9::13) by
 BY5PR11MB4468.namprd11.prod.outlook.com (2603:10b6:a03:1c9::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Wed, 19 Jan
 2022 07:36:00 +0000
Received: from DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::b47a:6157:f9b5:b01d]) by DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::b47a:6157:f9b5:b01d%3]) with mapi id 15.20.4888.014; Wed, 19 Jan 2022
 07:36:00 +0000
Message-ID: <667a64ef-5121-ba92-964e-a9c075fc2375@intel.com>
Date: Wed, 19 Jan 2022 08:35:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH v2] phy: dphy: Correct clk_pre parameter
Content-Language: en-US
To: Liu Ying <victor.liu@nxp.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>
References: <20220119023714.1498508-1-victor.liu@nxp.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20220119023714.1498508-1-victor.liu@nxp.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0445.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::18) To DM6PR11MB3180.namprd11.prod.outlook.com
 (2603:10b6:5:9::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 57d999d8-15f3-409d-f1cf-08d9db1e56d5
X-MS-TrafficTypeDiagnostic: BY5PR11MB4468:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BY5PR11MB44688F552488274B78582C90EB599@BY5PR11MB4468.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WYw62nzBaeaSV1eOHb5SLdlyiYBmfs/cvaWJSHMdmlHcw3k4ALxLbwx7IkWSKhDWxX8U/8bcvKnhEUdeLXy4ldxoH8lNGYq8MQWosj3e/t+J11UhbU51DmabL4GlR+XNJ6ZZ0kyY7FioJJXZMLqmzDMA+B986c1BiE4PJibdM+v2NC56zi182rC8D5nn6HiZuHy1XGpiSeDHbdPQ85z5uJqKWxyl+2VEtQUQr6hwqmDMVFZeCnl+LHGTwoUYRPbSdc/xtN2T/EJCzwzbgC2khuX1vEudwxf/9IawoAc24l9vqSX6mAo6sc+l7cwcKkliZalViF+TwJuKP4wBRCucH9KfGqxgKGnXbreD1yykaM4rC3ViEOSj/v9E2CwsG/G9+CYnxcZp0/ClwYlUMS4fQnoqJzwpgFSc/5o35czOOrcPhmEkFyH01s+9bDKWXPOC8aG4BUCn94vAVrRzHKlwSNq+KP30IoyQhyuh8+08SDg6K5y1APlC82uDgOD8Jy9CKeSxDPOjY4nMFqr2xoyEeWEH9M+7b1axSizQRyHo0xR0096x95pzQ2MYau1jRVSCrVLfhf7BrMkv8u/kQr7iKIxPScfs0+P4qMeJXst5uFbHUOJoTd8zGb988Otl8SEeNW4QGbsMEGq/xRogZoS7K5iFHVSfuFXvWyDDbPHFRTlhDwtHDrbYdK5Ce618R3tWMmuLVIqpu0yG01+GzufI3sEvRzbLH76EZ1AkVeGbgPs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(316002)(66556008)(82960400001)(38100700002)(31686004)(6486002)(36756003)(31696002)(86362001)(6512007)(44832011)(6666004)(2906002)(6506007)(508600001)(66574015)(8676002)(7416002)(2616005)(186003)(83380400001)(26005)(66476007)(8936002)(4326008)(54906003)(5660300002)(66946007)(36916002)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGErU00vMDhtK1RoQWZPV2FjNDhFZ0JBRGpIMFROblJFTGFMKzNoNHBrTFQ4?=
 =?utf-8?B?UVZOTTc1cWlVdnJReXBGcnp0S1hLdkhiWUdUczBUb1BlYUxHRnRwZk01cDFl?=
 =?utf-8?B?eXJDdmYzZHRNeVF3THpOU09VOU5EZkkyYjRNamNXNzBSYmVIY0ptOUdwMm40?=
 =?utf-8?B?ZlBjc0owbDk0ZXphTFBwaGZkQU1IQWNVUUhmSlVWb3NIdUk1Zk9XcjEyNGdD?=
 =?utf-8?B?RmNuRS9jN3IrbXpyS0N3Z0tnUVE5c1NzWXRPT3M2T0pzbVJIbDB0UmNwdFBn?=
 =?utf-8?B?TCswSE9vcXh1dXpQMGRXK3BQTE4zTVZIdEhUWWR5VFAzSTczZzR5aDZlY2l2?=
 =?utf-8?B?dHk5TFJFOU90NTBzOUJuM29lQnpHcGJtV0cyLzdKamhJK2s5UCtYOForVUx0?=
 =?utf-8?B?SXpwb1hHSkNNVXJJZGlpcHJmSEVMK2JWQVQ4NGwvTVl3R2NWZmdjeThjWVdX?=
 =?utf-8?B?cHUweG9oc3dablhzU2MyeWhnNk5jYmJQclloYk9icCt5ZlhEVXQrZzVuMFZp?=
 =?utf-8?B?clRTK1RtNHNuVjRNWFMvZ1NjSVdUNm9OcHV2MDArYjZIN0haOXQ1SmxCbDhx?=
 =?utf-8?B?NjVJcHc4Q0RRakk4NlBrL0lUa0hsNUxCSWp0eEczcGxRR0x4bmE3ejMvQlBI?=
 =?utf-8?B?M1l2ajJzOTVtazJaZWNVOTFnZHBGemJMQXh6WGJxeU1pVDZJdXFodU16WTNF?=
 =?utf-8?B?Y3ZNUEpVRDNXa2hHRHkySUpPUXBYcTBmcDVNUTRNTXBnRFQ2WG5WNFNFMWVn?=
 =?utf-8?B?a2NIZnpsUDFaNVlESm1PTXh5aXZrZVZPV0NaMXhZNnJvOTZST0ltaERFVnJz?=
 =?utf-8?B?UzEzaEh1UnFyQjZGb01YMTI3RDUvZ290QTdyR2toTEowVmNvaUw2bmlCTW8v?=
 =?utf-8?B?SkIySlNSdnRCalRadUhBcEEreUd6bjRXa3ppcmdnVkI1UjQxbjJhQW9JL2d5?=
 =?utf-8?B?NWNnMjloOTV6a01aVUVCV3paS1NzclZRVHd1WHRCSFBnZ3Zmd3AvYmZPL1ZU?=
 =?utf-8?B?MGdjc3ByeExhZ0hxL25pTURYMHJ4RFlNQXdTOGdOQWJXNmRmTUNnN3ZidnJz?=
 =?utf-8?B?QVFjN0xuS0ovbzd3cVRZc3ZhRSs1MDdBSnlYYmtnRGhwelVIcW9ZSlVzQ291?=
 =?utf-8?B?cFNwUG55YVY1MkMwVXdhdGU4L2VVcGE5UTR4U1ZJMDc1RmlXcTNCQ055VXhk?=
 =?utf-8?B?ZndkSmhhblhCVG1JWEE5Z2pqOG1GdGNCREJtT2M4RnhiNFZXaXNabmFxTEU5?=
 =?utf-8?B?YldsTjkwdTR6OSt6eG9EMzNDT1FLVEp4NkthR2F0ZUhnSzZDMVg4YWZ5Uy9v?=
 =?utf-8?B?ZDRNbCtYWndwYUZhcjF1dVg0SnBHK3pGQk1RQjlQWGI5TVZEdHY0a3ZZSktq?=
 =?utf-8?B?dUQzQjY1OTNKUlpUMVluMU45blI3ZFZIbmJvZUROZlhlb0tJUCtXeklTbEp2?=
 =?utf-8?B?ZXlzK0lmeHBtYytLZWVjNXd3VGpZUkd0bnBlc2YzTGdZeHNOZ3phQmlkSTUy?=
 =?utf-8?B?bzNDem9CS29sN01DRTYyN2VHb253ZC82cjdPZDZmMVdTbXUwNkhKM0trelJG?=
 =?utf-8?B?RXBicVhpZXRXaU05M2ZzcWR1b202TUtWdUUvbGZBWFNHb0FFelBJWU1Wek9D?=
 =?utf-8?B?UW4wQUR4K1VqMCs2Q2R0ZnFGZVBnVit0KzhtQ0QvdDNhemRoYkdla3oxaW5i?=
 =?utf-8?B?aGt4dG51QU1HYmVVRmdXNHVOUkQ5TzlEU21WbkFWYmFjV0J6cXI1N1BiVmJG?=
 =?utf-8?B?QlRvdkZnTlpMM0NnVGdERlQxYXl6Uis3MmhlOEFtYU43eklpTEhtMEdnQnRN?=
 =?utf-8?B?dDUrWFEzMVExZlg4YmVNZlFqd21uMmZrdGRveDdtckJiTnd1ODZrT0UrWUVp?=
 =?utf-8?B?MW00Tm5GYkl3YjAyYUI2L3RVOFZIM08xRy9wdk4wOWFlN1NWUkJ6NWhyUFcw?=
 =?utf-8?B?SGdmT1BRUDJCSGt5bVEvY01qdFFTWHl2cDQySnlYa2pPNnVESEYzcm9OYUhI?=
 =?utf-8?B?V2hDNkZyL1dtVEU1Uk5RQzFTUHUwWkRLZ2tORVRUSFphY0pBU0QxV1o0MlJT?=
 =?utf-8?B?dG1Wb0xYdVZ0ZWVVcjR5dVJpR01rQnVKMWUraU1vSHhwdFoyWHBoUmFYcjVX?=
 =?utf-8?B?UzlyUFpta1ZRenhKbkdJNVVBVzluR0tUUWorZUtTZENBUkh6ek1SMW5mSktt?=
 =?utf-8?Q?T/pNZT/Mp6jzy574/LtiJvg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 57d999d8-15f3-409d-f1cf-08d9db1e56d5
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 07:36:00.4967 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /3wVYM4QOpcPFwVEnPo5UBG06bXswj556DeIecNHeV5a7KwIiX6eDEqd1ZBO/wlRrkbBzR+bumlLhmq12M9E5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4468
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


On 19.01.2022 03:37, Liu Ying wrote:
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
> DIV_ROUND_UP(cfg->clk_pre, BITS_PER_BYTE), then.
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

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards

Andrzej

> ---
> v1->v2:
> * Use BITS_PER_BYTE macro. (Andrzej)
> * Drop dsi argument from ui2bc() in nwl-dsi.c.
>
>   drivers/gpu/drm/bridge/nwl-dsi.c                 | 12 +++++-------
>   drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c    |  3 ++-
>   drivers/phy/phy-core-mipi-dphy.c                 |  4 ++--
>   drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c |  3 ++-
>   include/linux/phy/phy-mipi-dphy.h                |  2 +-
>   5 files changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
> index a7389a0facfb..af07eeb47ca0 100644
> --- a/drivers/gpu/drm/bridge/nwl-dsi.c
> +++ b/drivers/gpu/drm/bridge/nwl-dsi.c
> @@ -7,6 +7,7 @@
>    */
>   
>   #include <linux/bitfield.h>
> +#include <linux/bits.h>
>   #include <linux/clk.h>
>   #include <linux/irq.h>
>   #include <linux/math64.h>
> @@ -196,12 +197,9 @@ static u32 ps2bc(struct nwl_dsi *dsi, unsigned long long ps)
>   /*
>    * ui2bc - UI time periods to byte clock cycles
>    */
> -static u32 ui2bc(struct nwl_dsi *dsi, unsigned long long ui)
> +static u32 ui2bc(unsigned int ui)
>   {
> -	u32 bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
> -
> -	return DIV64_U64_ROUND_UP(ui * dsi->lanes,
> -				  dsi->mode.clock * 1000 * bpp);
> +	return DIV_ROUND_UP(ui, BITS_PER_BYTE);
>   }
>   
>   /*
> @@ -232,12 +230,12 @@ static int nwl_dsi_config_host(struct nwl_dsi *dsi)
>   	}
>   
>   	/* values in byte clock cycles */
> -	cycles = ui2bc(dsi, cfg->clk_pre);
> +	cycles = ui2bc(cfg->clk_pre);
>   	DRM_DEV_DEBUG_DRIVER(dsi->dev, "cfg_t_pre: 0x%x\n", cycles);
>   	nwl_dsi_write(dsi, NWL_DSI_CFG_T_PRE, cycles);
>   	cycles = ps2bc(dsi, cfg->lpx + cfg->clk_prepare + cfg->clk_zero);
>   	DRM_DEV_DEBUG_DRIVER(dsi->dev, "cfg_tx_gap (pre): 0x%x\n", cycles);
> -	cycles += ui2bc(dsi, cfg->clk_pre);
> +	cycles += ui2bc(cfg->clk_pre);
>   	DRM_DEV_DEBUG_DRIVER(dsi->dev, "cfg_t_post: 0x%x\n", cycles);
>   	nwl_dsi_write(dsi, NWL_DSI_CFG_T_POST, cycles);
>   	cycles = ps2bc(dsi, cfg->hs_exit);
> diff --git a/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c b/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c
> index cd2332bf0e31..fdbd64c03e12 100644
> --- a/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c
> +++ b/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c
> @@ -9,6 +9,7 @@
>   
>   #include <linux/bitfield.h>
>   #include <linux/bitops.h>
> +#include <linux/bits.h>
>   #include <linux/clk.h>
>   #include <linux/delay.h>
>   #include <linux/io.h>
> @@ -250,7 +251,7 @@ static int phy_meson_axg_mipi_dphy_power_on(struct phy *phy)
>   		     (DIV_ROUND_UP(priv->config.clk_zero, temp) << 16) |
>   		     (DIV_ROUND_UP(priv->config.clk_prepare, temp) << 24));
>   	regmap_write(priv->regmap, MIPI_DSI_CLK_TIM1,
> -		     DIV_ROUND_UP(priv->config.clk_pre, temp));
> +		     DIV_ROUND_UP(priv->config.clk_pre, BITS_PER_BYTE));
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
> index 347dc79a18c1..630e01b5c19b 100644
> --- a/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c
> +++ b/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c
> @@ -5,6 +5,7 @@
>    * Author: Wyon Bi <bivvy.bi@rock-chips.com>
>    */
>   
> +#include <linux/bits.h>
>   #include <linux/kernel.h>
>   #include <linux/clk.h>
>   #include <linux/iopoll.h>
> @@ -364,7 +365,7 @@ static void inno_dsidphy_mipi_mode_enable(struct inno_dsidphy *inno)
>   	 * The value of counter for HS Tclk-pre
>   	 * Tclk-pre = Tpin_txbyteclkhs * value
>   	 */
> -	clk_pre = DIV_ROUND_UP(cfg->clk_pre, t_txbyteclkhs);
> +	clk_pre = DIV_ROUND_UP(cfg->clk_pre, BITS_PER_BYTE);
>   
>   	/*
>   	 * The value of counter for HS Tlpx Time
> diff --git a/include/linux/phy/phy-mipi-dphy.h b/include/linux/phy/phy-mipi-dphy.h
> index a877ffee845d..59a5e77ab409 100644
> --- a/include/linux/phy/phy-mipi-dphy.h
> +++ b/include/linux/phy/phy-mipi-dphy.h
> @@ -42,7 +42,7 @@ struct phy_configure_opts_mipi_dphy {
>   	 * the transmitter prior to any associated Data Lane beginning
>   	 * the transition from LP to HS mode.
>   	 *
> -	 * Minimum value: 8 UI
> +	 * Minimum value: 8
>   	 */
>   	unsigned int		clk_pre;
>   
