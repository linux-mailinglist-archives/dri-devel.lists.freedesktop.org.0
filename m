Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6072C603FF4
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 11:40:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AF8010E416;
	Wed, 19 Oct 2022 09:40:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A14E510E416;
 Wed, 19 Oct 2022 09:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666172431; x=1697708431;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YhKeVNvdRyBJ2RLDWxBa20BTt0xMoosSBqa4ntpKQoY=;
 b=Tms2Tll5MZK+1QZYpddSAO+cqzAuOysx/BRzJxNdMNvK9rK7OLcMA0Tk
 cPg9RTGxcah5P1yvMaGwF1AfAYj1Z0pJ2arsHii3WWcQHknqYXq3TN9ER
 K2k0QhK4unG8f0+4ttmGaZDfa+wQyLxVxrWGPACtG1lP5SSgt088RC6OZ
 EBoSTPstpL/vcaRJU3lUNT+IEMvwPoFcTSdiEYZ59Wq1wORFbxbwqp3bB
 bbcW7R71YaP2YZBT4uvo2aic1bqGvzGLj6T9+pj8wXrergPkhJy4n1Vnn
 hka5xC5qqoPKv19oipya0GUVYv0gvOwy8Uq13prpNEZjYf+UkK6D0rEex g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="305096764"
X-IronPort-AV: E=Sophos;i="5.95,195,1661842800"; d="scan'208";a="305096764"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 02:40:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="629173826"
X-IronPort-AV: E=Sophos;i="5.95,195,1661842800"; d="scan'208";a="629173826"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP; 19 Oct 2022 02:40:10 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 19 Oct 2022 02:40:04 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 19 Oct 2022 02:40:04 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 19 Oct 2022 02:40:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mUAYiYrKcnOIPd34bsPwI7HS7Uy05/icE1zCTOn4/Qm70Z5tKMt4YHtc+XCRMmKmo0EPuTr6LLNGzMHJlD8Z3jCqUW7afHiDfCKwUKCjN+8D02+0uyXVvRz1mCa2uELdPPR250ZsbPZvB6aEHD6mgbuz++hKd6jZGfkLfF8LMpFmIAMvK3XCJ83QZTNnphp68RIU7UAs91I7XHRgfpEOP6YcuGq1MpEyzPySBSaOw/D/4SbDvpse8d5MtMpud5veq1wpXzgD4lz3nwqNrtiwIBpRj1z8bRgqu2MeOqf+V0Rx4CUuSYqYCOAvGuaUlvCfd4Vx2MpAEeX5u+UUHzEllA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YhKeVNvdRyBJ2RLDWxBa20BTt0xMoosSBqa4ntpKQoY=;
 b=WtIsgtfTYdCdW953ir2cFTKLgRmL+RXaHgQgyP3wcxSeVo61HNxJQ0QJIFQOZle3PJU3wz1xlE1l97oipPoTlh2V6mFGV6QjIdph16NrqA4e/jPeaIJeoMq+D4yNIx4R26DsrWAD3AOjeOPcQnjsEHIqUNrxgPcaEMc0AlRdtx2ifPgCIUwvh2CeuqNY2BrfjvA4BGSuHI+VOUYYKxfic5kNnFaUb7sjSz4JIzlnJGKGQjACg0N6+Fr2+U5cz26VJBu2Za9UiLnIVV6A4E1NXd23FMtimJAih8GM+ScBie7kwaWEHG4EomwKdMzdkEKxBAXSQB3wV8cPL5uTx4OiVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by PH7PR11MB5888.namprd11.prod.outlook.com (2603:10b6:510:137::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Wed, 19 Oct
 2022 09:39:56 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::7e63:f1cd:99ec:3e3c]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::7e63:f1cd:99ec:3e3c%4]) with mapi id 15.20.5723.033; Wed, 19 Oct 2022
 09:39:55 +0000
Message-ID: <9e537caf-58db-bd0f-4305-10ba201ba5d3@intel.com>
Date: Wed, 19 Oct 2022 15:09:45 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.3.3
Subject: Re: [PATCH v2 5/7] drm/i915/mtl: Handle wopcm per-GT and limit
 calculations.
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>, <intel-gfx@lists.freedesktop.org>
References: <20221013000332.1738078-1-daniele.ceraolospurio@intel.com>
 <20221013000332.1738078-6-daniele.ceraolospurio@intel.com>
 <bd37abdb-a9af-3f30-17ed-7a13a9652389@intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <bd37abdb-a9af-3f30-17ed-7a13a9652389@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0042.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::17) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|PH7PR11MB5888:EE_
X-MS-Office365-Filtering-Correlation-Id: d351b31c-2af3-4d6e-cc9e-08dab1b5e123
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rVFEdgCa4p1xsdqfv9dKa/B8kiIhojXb7NXCk8YSBo27UUonzCwBXP6ApOALRfOX5UTtt0SP4T/PWPDXOjnr2OQTQTdMYZy4OSiODkf5BzbB8H/W+kV7vC054rde+C/QvqvQz+AKMlig1AxDNhum50izOZZKZjofds3r7oJYi0ObCBXBDANdUZpgNhVaBLxUiRWTBRJtwWWUObDbdeK4IvMRh8amtZz3ag08l/MnuKnZOrWbmDrjyRk8cxEVPxD1n7Bkauz5Ndi9s3Eci9VB2hWLad4B1a7LRMP5unVAYDdd5hRdGsU4p5J3sxCV5KEeYxnSElUbn5YuYBjx/5LclShW/lu4knsN5GubRnE5Ez1sO8KOxYImG9x0ps2No6wFYjcmbEIotpOH9WUaeE1ozC2KxCOyQlranaBPhkPU4pmCK85VvUR2e2k8SMZh3LI4q1Ul51Sk1UnlSezkLWYOk+GIXi4jXuON4mAsd1qRfTk7FJY7EPtMwZLzEa/rkZLTRK1dEBNbe2IdoxB9tb0w3x25PVkAlEGkYskE4HcxAuqKa8Lcdif93iwNBbVvATaVt0QKNCYnG2j6FPAqRBRb6YiLi5TSNYgAJAWR6UevYPMUpu8MUUFQPKn3PJNUi2GEle/qEP3VIcHqQCyyK0Ne7ocmNgNB7BJMsAlovThfE8RTwUqWb2nkWD7OvOzCAfu9DqS+dUooDEGn/tvTwPA3MYY5JixPQrGzO8lgb3FsvjnDFqOduDajLgW92TGjpxUuFYAPjbUU5m7v75rmki7uo9/TgEc9xpQ4MX/nEd/gU+Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(346002)(376002)(39860400002)(366004)(396003)(451199015)(53546011)(31686004)(6512007)(54906003)(8676002)(86362001)(66946007)(66556008)(316002)(110136005)(4326008)(66476007)(38100700002)(82960400001)(36756003)(31696002)(186003)(6666004)(26005)(6506007)(478600001)(6486002)(41300700001)(2906002)(5660300002)(4744005)(8936002)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RkNiZGh2U1pKaFNyWFdKUjRIUmFuMlhQMWcyTVVUUnlXdWNMbkIvdUlHaUZo?=
 =?utf-8?B?K3NkbG5INHF3WEFlK05QN25NK0U3REczbmlkUEVpamNTUTQ0ZkZGV2FoNU5W?=
 =?utf-8?B?cVFQL055YU5NNmdadzRVUXNDYlcrNjREQzhhZjNYcWhaVi9OaTc0MWIrTGVw?=
 =?utf-8?B?NmIyTEpkR1p3T3ZEeHIwRHZvdkcvNk85enhma0Foemx3SklmUUM4aXpGVmM2?=
 =?utf-8?B?NkpHWW1yNVQwbkcvZzF1ZkJsUTUrMWR5SnNrajFUZytIQ20wQzgxeXBIdVBx?=
 =?utf-8?B?a3Z6Z1p0UW53bHY3c2JoOFoxWlBtZU9xTlJPR0t0MEo1bmNKTjJjLzJaUUc3?=
 =?utf-8?B?MEdvZFRodXo5RmVaSmpMcFdRY3VoM2JKMkhtSDFMUHJvb2tBa2ZlK2cyQnh0?=
 =?utf-8?B?OE9BcjEyemgzbERVMEJGK3cvRWFBQWpqbi81ZWY5UnZqMTI1SGViUXFHZVhh?=
 =?utf-8?B?ZVpidTE4K3c4MWo1TVI4N1NmK1B6c0cvNm1PbUdSRktlRTFRZnF5QTRvOW05?=
 =?utf-8?B?L0huU0lGL0ZFTlN0dnFaLzhZS0ZMOU5TZXdJRXZjUlZ1Ukk5OEduZGhBeWh6?=
 =?utf-8?B?eFpleXE2V1dHckNuM0g1WERRclJiTnlhYTJuMWY5VUZ1MXZCN05DdGlVMlZu?=
 =?utf-8?B?RlpYY3hhTDhPL1R4SzN0ejFuMHpuazZRaW4xeGRVb1h0RGd0Tlkwek9zYWhO?=
 =?utf-8?B?U0lINTc0YzYraFI2cEs5TlloR0RDYlRvT2tKTzFTcUtQMWtLbm02QlF5STl1?=
 =?utf-8?B?WVBUeDNVcTc4WWI3SVhoQWdvNEpsRHNwTzllNDdLV3hNT3EwSTZuRldTNmNp?=
 =?utf-8?B?a0pnbXJUUlBJSWZqenhoVkNWZUtSMUprMURrSzJXRzdjM2xNMmdQMzFROFFP?=
 =?utf-8?B?cVk3UlFON0R5S3N4ZVBjTnJXTWJCTTNRbEU4eDRrSVNPemZmK3doZElvWElI?=
 =?utf-8?B?QTlmc3RHUE95S2tid2JSZUNvZWpWVmloN09nekRBRW5xVGdaWS9xOUozelpk?=
 =?utf-8?B?c1RNajF1eG9wVTZiTVh6a3ZoS2dMOFFIWSt3R05NUzh4SFpSS3RPTHk1ZW9K?=
 =?utf-8?B?ZjRST2d1VlJSRkJlemwrVlhLNlplczBaOG1zMXlkTkxQUkVSU05rZkxFalZp?=
 =?utf-8?B?eXk3OUJ3VVhSR1JRUXN1ZFArSitKS0JsOTdpeklpdUpicmVENEhzSnRCKzdO?=
 =?utf-8?B?SzV0VExGUTQ1S0NOZXZqaDFBU1BJeTNrbTdDeEFMT1lqb2UvTEw2dndNSGlV?=
 =?utf-8?B?WHd6bXhrQnNaUzBtSDQ4ZHV2NmJqWVhVSTdTb1djWEhEWHFnQzd5VjNCNEV4?=
 =?utf-8?B?aGd3dSs1VDdjejgwV1JLOXNPUkwvUSt5ZG1McjNXMWpkazVpc0xLYVJFMHZK?=
 =?utf-8?B?cm80U1A5UDNpOEhnc0hlUU0xb2lmWm83VmVlQXc2SHQyUUJuK2FrdW5JamR4?=
 =?utf-8?B?eW1FN01tMUQvM0Y5OUsvUDdYc2pxSUM2ZkVReXY0ZkdMTmdiMWM0alhnN3Uy?=
 =?utf-8?B?dENBQTZuWlJBVWU1b05QRXRTMjZlc3Exc3VvcTZ3MDlNaU5INDIyb3NPVXI1?=
 =?utf-8?B?Y3hubjM2NWFZVmFvZE5UWDBGNWp0ODVPdFBIWFRWNUp1TWdmUUVSdjlFdUhr?=
 =?utf-8?B?WUFuK2JUV0w2TE1rcW1VVnR4QzVIRWl4NEt4aHc5M1MwbThGbEtEd1FEdWJx?=
 =?utf-8?B?TmlIM0V2bmlBRE9YcnU5b3hCSXlFakFZM3EzNTN6d0QzbmxsdTQ2dy85V0Z1?=
 =?utf-8?B?T1AyNlcwQ2c4TU5KTVVhV0ZOV1dWWUNkeG05S1dxQnM3ajRPd3dnbFEvSWVx?=
 =?utf-8?B?YmN5eXhzYzA2c1hFVXZIVmUyREd4LzdmRXZMZkFWVXVZbG02TXRBZ1owdVBN?=
 =?utf-8?B?YU5xNFM0aDZEaHlFQWxVRHVXLzVDTWlPMnJqb0VEck1CM2orSHNzZlAvUGw0?=
 =?utf-8?B?cUo3WCtNREFQOHZkSVFvWTlwK0cyeTFvTHI5M0NqY3Y1NlpabUE2VWY1dTdE?=
 =?utf-8?B?dXNUWWJ6WWYxV1AydFZWalFjTTIwZFlOVFBOZjFRdGNaTWhZUG5PRkZNekFS?=
 =?utf-8?B?NHF3Y2hXLzRqRVczZUtFNkRlZkllTXVvaTVQMmZnZmhLVWMxTUoxQjZjNFpS?=
 =?utf-8?B?N2ZuV3E2TXVlVVYyYWNYVWpyS2RpNEh3Vk9Ud3kwSU1WNDJJa2JMZlN6R3Bv?=
 =?utf-8?Q?peJmXMcUEb4IPX/vIn+rzs8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d351b31c-2af3-4d6e-cc9e-08dab1b5e123
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 09:39:55.4680 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LMAfT67iCLgeijOoH+svLaDZPUAogBaGTb0RUwld/FHvf8hzanWPM6e3ARma8ud+ivBtETtWLxVaxZ+4N/SoCUanRVZ3zYoOilxMGiDqwsE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5888
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 19-10-2022 06:14, John Harrison wrote:
> On 10/12/2022 17:03, Daniele Ceraolo Spurio wrote:
>> From: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>>
>> With MTL standalone media architecture the wopcm layout has changed with
>> separate partitioning in WOPCM for GCD/GT GuC and SA Media GuC. The size
> What is GCD?

Graphics Companion Die, no media on it.

Thanks,
Aravind.
