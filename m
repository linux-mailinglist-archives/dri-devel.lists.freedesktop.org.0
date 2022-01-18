Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2595D4923F1
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 11:44:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B92B10E6C6;
	Tue, 18 Jan 2022 10:44:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70F2610E6C6
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 10:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642502671; x=1674038671;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=awMVed4u7MSxgOIeHIsbqb/hbWbo34EYms8M6wav7ic=;
 b=bTf0rOR4W1Bf4D7MWwO3sEJCL9/Kiy63Xedek6kaXFgtbTn26Lc7iS8f
 /EEQyGPWQ1OZGqzptRLzCC51CAbY/m6jHm/mq9fRyaRoFx+Aq5u6Divmu
 rL8Kiiqy7eLM7q0TGMPWcv+mWh4wgvagip62PLVm7gDOMMHkKzjP89aFs
 Kxc1LCxu/4kUFlDqtxsBGyMq2atNXlp/WJaVZchwhsnGPIcYu4Vb6957j
 uQEcb+uL38Ib2WBb25g6H5lEbENZAUJdVDT/5d/gptHi0rueeYh2hCb0p
 axGB3BBFXZLFmVcP3j7xfPoHGyuzEH7UvYvauiEN4YgDxZ0idJ83wkKe6 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10230"; a="308123177"
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; d="scan'208";a="308123177"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2022 02:44:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; d="scan'208";a="530260300"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga007.fm.intel.com with ESMTP; 18 Jan 2022 02:44:30 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 18 Jan 2022 02:44:30 -0800
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 18 Jan 2022 02:44:29 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 18 Jan 2022 02:44:29 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 18 Jan 2022 02:44:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dMSmJ1NM3gKuobWBOqA7JG1lxfjvKGD2HddyStlMaGDeCRHsu6wKaON9JVE7IRp9+qZXkMbaDEwLUVcWlTCG0hmMOQ9FBCf1Yu+WWkLwWj9Uz1F86DRQwaboH8r4Qq+sd9+s/lU3JYiM8sjKpMmijTwlPfFmO7Mvmn797CKGW07bsMoq8sh+bZ3Jyz2wuFYQAhFnqhjxIqHE8n3UU1qDIDsUWoD/fVx+aCbxPqCdz1YqtjV0Cr7J0TFJSe2NXl40rTPnrjIJ1sQ755TDl/aVnrMo6e2t802LsoY91/+HwnMNYyXoe6x5KSphcV0LAzgaGK6yzgA3CgzvmUXKUOQQhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1aqpV3zI1z4+Yg+NzyNtCxV9scKC0/7Eul0KFkZ95Wo=;
 b=MfR9WohN9tW/rHxoan3+joTEpIHLgu94MuxSMSYDMguHwuhB6P+WnkkEM0jFJFQXqCRXA44P6ccDWH8aJCzTr6nFBS4UZFjNRmrM9dPHnUkzv1hJNiqw1SbN25U3bpW/cIlwtfujyULDNfxOxtFNR4pKmij2AJnCl8ue4WMM16wiumqOpUDtNG1fKdGyAIu7BxHh6wm0YjIKxXI11Qjdz2/NqUtk0CctG2XyIUpefUylnS1+cCTAZ+0SeOZ9MfNacRRD/CBuevMeZPokYS8N/E5N+etefqy5JueVd0Rhhzi+iEb8zNeKeHWtNjWUxFam9BPZnhLnZlRWzy1FG69fAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3180.namprd11.prod.outlook.com (2603:10b6:5:9::13) by
 DM6PR11MB2617.namprd11.prod.outlook.com (2603:10b6:5:ce::31) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.10; Tue, 18 Jan 2022 10:44:28 +0000
Received: from DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::b47a:6157:f9b5:b01d]) by DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::b47a:6157:f9b5:b01d%3]) with mapi id 15.20.4888.014; Tue, 18 Jan 2022
 10:44:28 +0000
Message-ID: <51eda14f-5c37-c3af-84de-b591b8762a63@intel.com>
Date: Tue, 18 Jan 2022 11:44:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH] phy: dphy: Correct clk_pre parameter
Content-Language: en-US
To: Liu Ying <victor.liu@nxp.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>
References: <20220118025918.1444288-1-victor.liu@nxp.com>
 <96cd66cd-8e90-5f68-6009-f48015400aae@intel.com>
 <1d945988f774732c204f9dabdb8fa5795f0eca24.camel@nxp.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <1d945988f774732c204f9dabdb8fa5795f0eca24.camel@nxp.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0350.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::13) To DM6PR11MB3180.namprd11.prod.outlook.com
 (2603:10b6:5:9::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d35f4f2-bd16-41ab-e45a-08d9da6f804b
X-MS-TrafficTypeDiagnostic: DM6PR11MB2617:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <DM6PR11MB2617E67E70D3269A7B634E44EB589@DM6PR11MB2617.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cdf2/W3r1CETBrI3BfQ5lzYhqIqxapIgF/N3+pGF4vbu2FjgwUSjIw6yZlmg+M4ayBJqpLfDGdx0A+1QkPSbi0kP/Y/1lELe9ku6Pf811s0Ml3ynhjuAqQHOBjS7w7XRC0aA0dD4GJ4QFNyjSK2pPVYLpxLKAZmrAc9pgNA12nrCmoQKMC7pBn8RM5dYr/5L2UuRbyU+9mb5ife+Ib7zZ2jBLI0X+EV/gzc2U3eWh8CtLNFQmD/+HQ+gtTpBeIUNJsZafY+UVGI9MzRvMysG6J6UvZcNcWO+i8wYBvab5ZPMNbVjnZXdSq6QQHIY+PXRNlhUEI1Y0yN3wseFYvg6ANe4lDOWzUL7pa0Y0kclnHSbxEHt8EMLRYzRMQcqVJY91/a4uVb9SJEXT4WLlYoOLIL12HSuOKxUArj0q4UVO8l0useXLwpzByJv5UIqtq8Gtx2fbWN3SR/v+6CVyHw7ngqWolw76pK5KBom80Rh6bChiz0yShm+J2cfq2npzSmVsG02UUuSukH4WmTFg4jG3oHG3dVirHMcJV4BpNXxjxscze7HrLmdNtNy+lTQKn5jXxbirIkpv7pONAxLiEwwwR2QhEs24Hm868hCXrciQ0b0kZJyWnvDbpHBFblCdMHadh3JI5Btrt3nYfK4ClzBZ479Pu3a0k03aATeQnWuju1C4w1Klc3jRYG1tHxRgpSd7soa3VFnIzKydAKNm1/4r/I0VkpQ3DlLuwmQ2aX6sc4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(82960400001)(44832011)(2906002)(53546011)(54906003)(86362001)(31696002)(6506007)(316002)(36756003)(36916002)(38100700002)(2616005)(186003)(8676002)(83380400001)(7416002)(31686004)(66946007)(6666004)(508600001)(6486002)(5660300002)(4326008)(66556008)(26005)(66574015)(66476007)(8936002)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elJRR0JKKzBpcGdUbzZpK0VxMkljL1RVaE5hZFFMV2x3ZU5FOWNkQmNIN01n?=
 =?utf-8?B?SU9HRm80R0hPdmFETXNRMVV3SUxMVC90Rkk0Q1kwb3FES1VnL2pYaDRDZWI4?=
 =?utf-8?B?c2ZzcmZoaFplTU8rTmJUbVkxNHNObG9PNlM2MEhsWTUxWkJQT3pIQVBNYWlN?=
 =?utf-8?B?SGEyQUN6bkdVb2xvZUdDRi9lc3FqWTdNRWJXVWxmWnJNOUdBaGpoY25IREF6?=
 =?utf-8?B?QWY0amp1RnpWS0NvcXFVOU5rU0dCUGtlWEhpanRoRnQvQjgwRTZ5U3lNNlRD?=
 =?utf-8?B?S3BFL3RIeS9RWkY3K2FLMnR6M2dBTHE5NnhqNnJIbGtaclZweldOSkJ6MXcv?=
 =?utf-8?B?ZDZHQ2ZITy9QdjJIaHJtWmlGVlZEeWJ6SkdhTkR6YVZuVDJ2TWkxdmljQisr?=
 =?utf-8?B?QndHd1ZaK2dSU3VGKzVPWTltSlZxR0EyNXVqV1V4Z290czNNci9ncGswWWxF?=
 =?utf-8?B?a3hTRnhtN01ObGltRmdkTDIyamRlSDRmNDNLeTRaSVRhSHNEYWRQbk9naEs0?=
 =?utf-8?B?dGtPTk1xUUVLNC93TGFMMHp4aFJxcU9BM042UTFRRlRhWi9xckF2L2xnSHlw?=
 =?utf-8?B?V3Q2cE0wMGdLMXduU2M2VzNFWjh1d0dxUUlhS1FacCtMc1R1QTIwNThBd3pG?=
 =?utf-8?B?cm5xRmpjR0lBYlFzVngrTEZoTHlMdUh2YUNmU09wQzQrM3p5QjFUOVRmUCtR?=
 =?utf-8?B?NmFiWU1lbkwyRzZUSDRWMnhpZVV6cG15ZDRyUkdRSkFSaEZOQ0VSMkZuSzN6?=
 =?utf-8?B?TW9ZZHJGZzl4Q1VUZVF3Znplb1BvYVh6a3BhUkhjTEx4TVRDdDFvOXY1WkVj?=
 =?utf-8?B?M2VBZzBOaG9qYTdaNWF4aWIvNlhUYUx3QjNXcVVDY2ZMSXovZ1JsZjYxZ3p1?=
 =?utf-8?B?WEQ1MjJjR1ZydU0xUTcvNXo1ME0zcEp3L2pXTEtZNllEWmZqZ2VnTUFtZTlQ?=
 =?utf-8?B?dXFSUWxqOHZIdnRvTEVHOWNaZ2pKSjVlVERkbWFyNDdTdnZsNFV0Q1VIVEJP?=
 =?utf-8?B?KzA1ckhZSU5BMWpZV3FVV3VSbEIzWis3QUkyN3k1VmRzUUhhMzlOdGxCTUgw?=
 =?utf-8?B?c2tseGQvUzNwYW9QMk85Q3BCcjQ4Y0xpSk04eDBBUGRUV2Qwa21HQXNiODRK?=
 =?utf-8?B?TTdUOW1RcXJobWpMZEFJbjIxM1dpMXNkQUE2MU9HQ2FNRmNEamRZS09KdVov?=
 =?utf-8?B?UU1BOFp6QlpLRmVzSitLUm9YWGhxNG90MFAxTStEZU5HaldPYzBVc2xDdTJB?=
 =?utf-8?B?Zk5jWEM5ZUt4VE5ocHF2ME00d0NPdkFoSTZyRXBIa2tPM214d3k2K2tvd0Q4?=
 =?utf-8?B?bVp6cTJkU3F5UkxaSGFFRkVWbkdoNEkvaHA4YWFhTkVzN2lDclluK3V1dElV?=
 =?utf-8?B?TnI5SUJFSExrZS9URUh3cnlacURxYmhtSllwbkd6RDBEdXMxZW9xTUYwTFlW?=
 =?utf-8?B?QXk0WTNWQVYvKzJXVDVoeDZLbmlXVFRady9KTUtuZ2hyNzBndVNBRkdmTXR2?=
 =?utf-8?B?dzZsQVZQTzRBMWU2Zyt3Vm1lSzVVSVJicndkVnMxTnllSXIvdHBkMmRKQ1ZQ?=
 =?utf-8?B?VlhZbkpNQ0hjR1A4V2F3NWk0b3owYStHanpPWkVuelZtYWY4a1IweEVmNjJD?=
 =?utf-8?B?aE5sT3RSWit3QWFUaFd5ck9GTjF0eUphYkFJSHBJbEd3NGpOcGkzMDJtalhv?=
 =?utf-8?B?YmxHSDhYa2I4MytNeWZCVElIcEQvb1NyTWt4c2tKSFZxRkFEcmpHYmwremdO?=
 =?utf-8?B?OHYvdE1qMGxucVptWDB6Qi9IK1VESXQ2V2FuSEhkRE0rWG1aanF0V29nZHpT?=
 =?utf-8?B?ME56SGgrUGR2eG5CSi9SNzNZbzZMYVNXMHRkbzNPOUIzdVNySmN6cld6ZEV1?=
 =?utf-8?B?RTQ1dmwzVUtqdWRsdi9Ha2ZFOWUydmZEWGZQcW9odmE3dTFYQ1ZwaE1GMGtX?=
 =?utf-8?B?RFVVbHhxb05SaHFmUjAraU5xaGp5M2REMjJNQlRRVks5bEZ5ejE2OFBzVTEw?=
 =?utf-8?B?NHA2WEhXWitYaGJKbjlUOCtoRlcvOGo3UXdXcjdOWExYMU9mVnZlRXY2bGRt?=
 =?utf-8?B?bjdrc2pDd3R2Rkh3d0JiVzlkNWR6dGh2ZFBvbVdFRHFoZ2hhdTJLQXVIV2VV?=
 =?utf-8?B?SlkvVWdqM3lhSU55VzA2WTYzRzVYZ2JUQ2NXc0FZZlpqL2FJZEt4T1Z4d2lJ?=
 =?utf-8?Q?Vdcd6xrp5Y9Q+OROdCmksG0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d35f4f2-bd16-41ab-e45a-08d9da6f804b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 10:44:28.0818 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2vF+NL2XyEzj+Mc3/EdSzl2jeCuDsT8LvuOZN/XSLZOoVPwmoTj5hQcdaZw8AwCHAA9i5dQcYKBbvumDbx6JRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2617
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


On 18.01.2022 11:14, Liu Ying wrote:
> Hi Andrzej,
>
> Thanks for your review.
>
> On Tue, 2022-01-18 at 10:24 +0100, Andrzej Hajda wrote:
>> Hi,
>>
>> On 18.01.2022 03:59, Liu Ying wrote:
>>> The D-PHY specification (v1.2) explicitly mentions that the T-CLK-PRE
>>> parameter's unit is Unit Interval(UI) and the minimum value is 8.  Also,
>>> kernel doc of the 'clk_pre' member of struct phy_configure_opts_mipi_dphy
>>> mentions that it should be in UI.  However, the dphy core driver wrongly
>>> sets 'clk_pre' to 8000, which seems to hint that it's in picoseconds.
>>> And, the kernel doc of the 'clk_pre' member wrongly says the minimum value
>>> is '8 UI', instead of 8.
>>>
>>> So, let's fix both the dphy core driver and the kernel doc of the 'clk_pre'
>>> member to correctly reflect the T-CLK-PRE parameter's unit and the minimum
>>> value according to the D-PHY specification.
>>>
>>> I'm assuming that all impacted custom drivers shall program values in
>>> TxByteClkHS cycles into hardware for the T-CLK-PRE parameter.  The D-PHY
>>> specification mentions that the frequency of TxByteClkHS is exactly 1/8
>>> the High-Speed(HS) bit rate(each HS bit consumes one UI).  So, relevant
>>> custom driver code is changed to program those values as
>>> DIV_ROUND_UP(cfg->clk_pre, MIPI_DPHY_UI_PER_TXBYTECLKHS_PERIOD), then.
>>>
>>> Note that I've only tested the patch with RM67191 DSI panel on i.MX8mq EVK.
>>> Help is needed to test with other i.MX8mq, Meson and Rockchip platforms,
>>> as I don't have the hardwares.
>>>
>>> Fixes: 2ed869990e14 ("phy: Add MIPI D-PHY configuration options")
>>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>>> Cc: Neil Armstrong <narmstrong@baylibre.com>
>>> Cc: Robert Foss <robert.foss@linaro.org>
>>> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
>>> Cc: Jonas Karlman <jonas@kwiboo.se>
>>> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
>>> Cc: David Airlie <airlied@linux.ie>
>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>> Cc: Kishon Vijay Abraham I <kishon@ti.com>
>>> Cc: Vinod Koul <vkoul@kernel.org>
>>> Cc: Kevin Hilman <khilman@baylibre.com>
>>> Cc: Jerome Brunet <jbrunet@baylibre.com>
>>> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>>> Cc: Heiko Stuebner <heiko@sntech.de>
>>> Cc: Maxime Ripard <mripard@kernel.org>
>>> Cc: Guido Günther <agx@sigxcpu.org>
>>> Tested-by: Liu Ying <victor.liu@nxp.com> # RM67191 DSI panel on i.MX8mq EVK
>>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>>> ---
>>>    drivers/gpu/drm/bridge/nwl-dsi.c                 | 7 ++-----
>>>    drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c    | 3 ++-
>>>    drivers/phy/phy-core-mipi-dphy.c                 | 4 ++--
>>>    drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c | 3 ++-
>>>    include/linux/phy/phy-mipi-dphy.h                | 4 +++-
>>>    5 files changed, 11 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
>>> index a7389a0facfb..f1fdcdf763ee 100644
>>> --- a/drivers/gpu/drm/bridge/nwl-dsi.c
>>> +++ b/drivers/gpu/drm/bridge/nwl-dsi.c
>>> @@ -196,12 +196,9 @@ static u32 ps2bc(struct nwl_dsi *dsi, unsigned long long ps)
>>>    /*
>>>     * ui2bc - UI time periods to byte clock cycles
>>>     */
>>> -static u32 ui2bc(struct nwl_dsi *dsi, unsigned long long ui)
>>> +static u32 ui2bc(struct nwl_dsi *dsi, unsigned int ui)
>>>    {
>>> -	u32 bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
>>> -
>>> -	return DIV64_U64_ROUND_UP(ui * dsi->lanes,
>>> -				  dsi->mode.clock * 1000 * bpp);
>>> +	return DIV_ROUND_UP(ui, MIPI_DPHY_UI_PER_TXBYTECLKHS_PERIOD);
>> I have some doubts here. According to specs:
>>
>>       UI - duration of any HS state on the Clock Lane,
>>
>>       TxByteClkHS - exactly 1/8 the High-Speed(HS) bit rate
>>
>> I'd like to emphasize "BIT RATE" above (not clock rate).
>>
>> In such case I would expect that ui2bc would take into account number of
>> lanes:
>>
>> byte clock cycles = div_round_up(ui * dsi->lanes, 8)
>>
>> So in case of one lane we need 8 ticks to get byte, and in case of 4
>> lanes 2 ticks are enough.
>>
>> Am I correct, or I've missed sth?
> Sorry, I think you are wrong.
>
> The spec also mentions that it is recommended that all transmitting
> Data Lane Modules share one TxByteClkHS signal.  So, usually,
> TxByteClkHS has nothing to do with data lane number, but only UI - one
> bit period is HS state.  I think the NWL DSI follows the recommended
> implementation.
>
> 'Table 20 HS Transmitter AC Specifications' in the spec notes
> that Applicable when supporting maximum HS bit rates ≤ 1 Gbps (UI ≥ 1
> ns).  This hints that HS bit rate is 1/UI.


OK, apparently "bit rate" in case of PHYs usually means "bit rate per lane".


Regards

Andrzej


