Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FDF68CCE2
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 03:55:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 717EA10E1BF;
	Tue,  7 Feb 2023 02:55:23 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4223710E1BF;
 Tue,  7 Feb 2023 02:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675738521; x=1707274521;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LpcfoTj6kF3HSdnbL1qBQe093gG/MqlhL6gx6qrd8x4=;
 b=K8Z92XVXlKe6p81MW0ce5cl/fMXL4Dp/nA+JwXPLLeFANjYDDrkGNJMm
 piH45a3tudxUYeVwz5agpFDZ9Bg3yx2REaD2thxMTRALWjvAFXYwoPjyX
 dkF/lVpqtFfVA27odamSzqioDN2eiEhguvA6zmMInjCkKIGWM4sJeuFNm
 Qu7FbJgRkdQIWSSP/FtmlKUBi9wO2LglUCS+CAchCrc216sOq9n+HZBgN
 WvP+zFyLv3l7vzRenKTwZqi+FPZbPqNF+OLuU+AlovToJ39FcEyx/3d/j
 4D9CpXigzZGUcRGEAUMbk1u2rD3BCF7okwxZXpiypkMnW2V+WiGal3qjE w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="415606236"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; d="scan'208";a="415606236"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2023 18:55:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="616646403"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; d="scan'208";a="616646403"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP; 06 Feb 2023 18:55:20 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 6 Feb 2023 18:55:20 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 6 Feb 2023 18:55:20 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 6 Feb 2023 18:55:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SH5foiV8a0qJeVkZeRDcP4J36eb4G4TGLIsjVch9oyt5yIAwCKchtudwi8bDnRZvBEon0rT4qCKF/fXDhBWh1JZfdqBt76DQ2n9vs+17oqAK44sJSJzz6dzyLVlACWsuDaAWlTcRg9T0qeco7Kaa75+rFbmHUj/DaLoLmFOyE2yJ1cfDCIAJelAcio4jYFYSBwI0pIHPg4E092hXWWIIFO4QiR6GR3152sB6djxU+rdx/4+zRdCFP02VK8E/INmmt0IRmJouls1wjij2NEzf4tipl57Y6zFIal2ZXDf1TvX6unS+32xlnu6xprHvFcVC6U9Fk5xtCtUy2sfmcf5+wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bKZHkZ+/cTssWrAf9ewwacK2Gf5QphdDHgeREJi/Sw8=;
 b=V6B604VKR/QU1F71S/lnl6wQyPFqikYiKHJ0SK69qyUkETTTTQ2I9xQNAz6nIQYKvqHNV8LyexpXiaJfbGQh75OXAgcnNGlS8JrrhZckAEDBAhfBJkXJGGEtgOae7BUgjzs49276RPTlZJ1U2LuWTowjN7oR8Sw8tqXwQtbdAGXIeJySkI7sclo243auuhxSUsgOlsu9cxE6n+TIqXeirtji0H6Qvcvvl4/RXgzu3HqPgmSQ7D14dmbgkpk+fIXhUqpj1tECC0lZZ6e/0QDu5J4jHoGPQ0ThFO72gMV9hirDSYJ9v/Agyc0QXLTqCLoXV0uBDhTCeVjJsYkzSXZ23Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by PH7PR11MB7499.namprd11.prod.outlook.com (2603:10b6:510:278::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Tue, 7 Feb
 2023 02:55:18 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::e1a3:6ad3:9f43:5f25]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::e1a3:6ad3:9f43:5f25%4]) with mapi id 15.20.6064.034; Tue, 7 Feb 2023
 02:55:18 +0000
Message-ID: <b5925597-c753-792d-5770-07e60201b4a6@intel.com>
Date: Mon, 6 Feb 2023 18:55:14 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH 3/6] drm/i915/guc: More debug print updates -
 GuC reg capture
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "Intel-GFX@Lists.FreeDesktop.Org" <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230203001143.3323433-1-John.C.Harrison@Intel.com>
 <20230203001143.3323433-4-John.C.Harrison@Intel.com>
 <2436cd1682d0dc3d36900e6f2114d0ffcb823acb.camel@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <2436cd1682d0dc3d36900e6f2114d0ffcb823acb.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR10CA0029.namprd10.prod.outlook.com
 (2603:10b6:a03:255::34) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|PH7PR11MB7499:EE_
X-MS-Office365-Filtering-Correlation-Id: ffef8614-8b86-4d1e-e079-08db08b6beb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zlLYWO/sUNMD/uaJzpwSsM2gFFzk1poqvnHMM1ONbA53h+DqpQHby0b8NKRmUlhZ9b86MyEU1xGlITi53Ieij951qOyYzAh4jjBhWHIhXKiXBHzMnEaXXCoNCSug6T7yAK3RDEUhx3gQJZDMaEM8BdsiPfbjcLx6qGG3h8UbGeZxEIFSt1YYSrWIkZR0gT3B44g1i5zgkdORLzEA+JUi2i+0TevlsSuaxVKgOg/I7zxI2cw7heELqnnxgSPSpDOin/hN9ppEyjaRvWMhuDVS5cyyMggMnsaP+TGoj9DberPeMpzow07DU/I2/r3idYY0akPbdK0cJv7G/KScFclcXrI//I31dxx9B8xPTRiUVkg9B2bTquEEHDpobVJ73BMV16d0yRSrPOwrtlnqL2e/8kgZl4gpigpG+jIsGM6C0OnrJqsqXZYknsL4rE/ce920LhYiZXjexsGk01nrN11L8qZ6IxtRnCfbsvusvkTlNxHDQ3SHEiGTLu8aey6HX21hiqfV4E5Ud/lk8JG6Nc+qfi2XMtYzMws5iYmI1pUFPB78y8OCYv5D9Dzr/ePVdBjbtu5H0nF5jnYwacf5Gwx/HM/psS9qYChmqvZMfW30GeOCmZ1haty6woRjo3NagzbAnzHqRPEWQza6Q49f6CRx0s5p71NF70mvMpYA01AjtYE2/KAeFW6qJVZfI9Fy7cNwkEtP5sSCnKTsANvnFD99sF5mRwDK7N17ipMRTCZQKEY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(396003)(346002)(366004)(376002)(136003)(451199018)(36756003)(31696002)(86362001)(38100700002)(82960400001)(450100002)(41300700001)(66946007)(8936002)(8676002)(53546011)(110136005)(4326008)(66476007)(66556008)(2616005)(5660300002)(15650500001)(478600001)(6486002)(2906002)(83380400001)(186003)(6512007)(26005)(6506007)(6666004)(316002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWJYVjhiWkYrdCtSUlRUWmtxQ0ErL21qVXdWTVhWTVZjLzZic2NlV1RXdU9F?=
 =?utf-8?B?cDFsZk1acmU2b0FmTjVTakRNVDBaNmlYTHVqcGx2dGdWckh5S0tCQTBXaFha?=
 =?utf-8?B?L0F3MDhzMkt5dmxBcEMySFpUZVluNGo1cWNjbFFJQnF0eExXS3htRklrWEdR?=
 =?utf-8?B?UVJHb0N3UzBzOXVRN01zWVo2RnFRSUJaem9yekRKKzJkUmFUTTZBYnF1YjJ3?=
 =?utf-8?B?UDFGNU42SDFzcm5nZlk2ZG5ONjQ5TVFUR25IZGdZejVSbUtkUnRjNWlPODgv?=
 =?utf-8?B?QVMvM2JzY3lROWpNME5ycU5KQjR2RnUxTjdjUmdTZVNRNWV1MGIvUFFKNzRq?=
 =?utf-8?B?cFZGNjNNeG1ibVBJNWM3c3RDYlJRS1p3OHhCRHB1NzIzTXgzNXlGaDJnU1lp?=
 =?utf-8?B?dVozd1NuY1BNcXd6WXhDMThScmpzUWtROWUvVXhFQlMzWmhGdUdBK2dOclhl?=
 =?utf-8?B?NU8yMVV4bGNQeFlxQldNM0tLMWJvQ0IrZnRoODBYZWpSUThFYzRvOE1Ua3Bi?=
 =?utf-8?B?R0RHUUNraThGYVYydnZhSEE2NkxYNW1rdHBGWHFFalFNMDBCQnhuTFZZSkNr?=
 =?utf-8?B?YlVqUVlub0U3U1NHWHM3NWV2YlJHcEh5ZlorS3RtTU12enhZTFBPWEJZdWlQ?=
 =?utf-8?B?WGVCUk1Wc0ZoVWVtbnFMS08xWEwwOFRmcTZoU0wxbjZ1ejRCNXNLbVFoSlhO?=
 =?utf-8?B?RzQ5VnpaaUh2d2diRStJY0VxVHlUdTBCV1FyNEtNTktNVm8zMWxSaVhCMFJx?=
 =?utf-8?B?RWQxUGRLYjB3SDIwMEhPMkVrT205bkJOczMwY2crSFdnSForVGd4ZEFFY1JL?=
 =?utf-8?B?ZUFJK3h0SitCVkxSWHBSQW5nQVQ1TkgwZklOWXQxc0pCZEJvMnNwV0pldE5p?=
 =?utf-8?B?ZFJ6L1NxazcvUEo2TjdzZkxZNjJScE1OYTJCRGNIQjNYZFA4aG8rK1JpWFE2?=
 =?utf-8?B?UTdvTS8zaVhMSHh6VVErQnlXdE1pUldCSmtIYm9UZG9CeGQyTEtkdXNrZzhh?=
 =?utf-8?B?N0czZnY3SXpRUFpLQnl3akZIZWR5YlNsZ0xlWXJ4Q0VkOXVPRDNyWHZMQ1ZV?=
 =?utf-8?B?bEREZDBjKzM4TGRHbzY1MWJhYTBuejJFZUxUWkpWczBkU21GTWh3c0xrRlRj?=
 =?utf-8?B?NGRtcTNXaXRHZlhyc0RCU3ljU1JpR3paZ0VPRkFmbURjcnoxSVRTdUFIeDlB?=
 =?utf-8?B?UTFCWmkrL2tMNDlxZXdWVXpxT2dIT1VlUFJJRzZmN1pMWmVMdFU5ZjFsQWZn?=
 =?utf-8?B?R0VuSjJ3MVpQVzN0czVsaXhJUE9SVWRlQm5acGNKOEw1SFcweEZXMnlROHRD?=
 =?utf-8?B?SzhUTkk5ZGZHTWpybW1JR1RKNW1KUnJrR0psTmpmUmNjeXlNWGVFTFlhN2Fx?=
 =?utf-8?B?RjlUYVVNNHg1TTh4U0JIVWlCYnRjaVR2Mlg0eEpIR2V2dkVGZFE1cmUvZ1k3?=
 =?utf-8?B?UkZ5NW5jdHVUckkwQWRwcGw0a3J3dTJLSmpzOXJEMnlxd3lDZnVRZGVjaXhF?=
 =?utf-8?B?NW00N0ZJVzRoejVOSFBsWXpiNzF2S1BadnovYVp4bUhTRllPOXEvMFQ1ek1E?=
 =?utf-8?B?aUNnL0lEWmN6RWlEMTZ1RUN4VlNXUndIVVJlRlNmclhJQTIzV2k3WUFwdXVS?=
 =?utf-8?B?VHFDZ2VOU2dDSXA5NDk0VGdZUWNqREhXdTBsWWFmOFIrYzBLZlpTbk9keEI1?=
 =?utf-8?B?YWwzZ0VLQmEzWjZLVElkc0lZZ2drVmp2TUNoRHhJTkdkelp0dThqQlRQSnJW?=
 =?utf-8?B?emdzMld2VDRyVlFVYXFQdE1kMUZ2YmFOYkN3TUk3YzAwMWhseWFac2d6NjQx?=
 =?utf-8?B?WlFvN0lWRWNob2pjczVYR3ZvU1AxbFBIazkycnMzRTJyd3NZYnhkcGQ1N05O?=
 =?utf-8?B?N2l1RmZ3RjVsTC9TN01SRzdQdjV2OWxleWdnQlBLVUhyUDZhSHQvM2FMNnJ4?=
 =?utf-8?B?eW1SNyt0Q2NXQzE5anpzRENpMkJIUm9zblV3dWZVVEx3cVlHMWgrVC9QR1N5?=
 =?utf-8?B?a1ZIYmZRR0trQm8ySmpuSTNIcWVqM0x2cjE4R0RpNkdpY01WR24vQkF2SG8r?=
 =?utf-8?B?R3lGTDhXWVEyaFFWdGJnbGJhcUg0SzNtZDV0R3ZEUy9zRU1wTlVKY2liUmVE?=
 =?utf-8?B?VE92cXRVSGJMRS9FbGpuVWRTQ0RsYkNBSG9LUFdQR1p0MU02MWtOM2xuL1Ir?=
 =?utf-8?B?TGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ffef8614-8b86-4d1e-e079-08db08b6beb1
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2023 02:55:18.2737 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vCiVVnyFgvc+haD94tjepZ68bX6z8YrK4z+gAp9AfJx/S6tSGXABX/Z9gbqQRFoFAAlPeKLe83qX3wCzcbGnSreCnb32Mv+XBYC/42AR2a8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7499
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
Cc: "DRI-Devel@Lists.FreeDesktop.Org" <DRI-Devel@Lists.FreeDesktop.Org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/4/2023 00:19, Teres Alexis, Alan Previn wrote:
> So i do have one request - but its a nit - for the following case, should it be a guc_warn instead of a guc_dbg?
> (last hunk in this patch)
> 	"No register capture node found for 0x%04X / 0x%08X\n",
> 	ce->guc_id.id, ce->lrc.lrca);"
Did that get discussed in the original code review? I vaguely recall 
some reason for it not being a warning. But maybe I'm thinking of 
something else?

> Otherwise LGTM,
> Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>
>
> On Thu, 2023-02-02 at 16:11 -0800, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> Update a bunch more debug prints to use the new GT based scheme.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   .../gpu/drm/i915/gt/uc/intel_guc_capture.c    | 51 ++++++++-----------
>>   1 file changed, 21 insertions(+), 30 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
>> index fc3b994626a4f..5f6e3594dda62 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
>> @@ -15,6 +15,7 @@
> alan:snip

