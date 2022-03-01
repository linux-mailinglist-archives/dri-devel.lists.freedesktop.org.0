Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2464C976C
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 21:59:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 522AA10E1EE;
	Tue,  1 Mar 2022 20:59:36 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EDA810E1EE;
 Tue,  1 Mar 2022 20:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646168374; x=1677704374;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=R7qCgbYXe+PzwMDVrSd0eYNLwIPwSvVJHiMzllwPlp4=;
 b=QjOcOGHODIOJoYPf5pC/7tH3Hfqcw3kPKHoa053IbK/i99FOmaLMBpa9
 QQ7Z2GEbbtzgKBZ4iG9YOsMYWzns33AkCAlYErpMLpunSgdPNh8tJ/K28
 w3TNJAG2fMRaZ4vHLB/Gaui3wYjko8sY62makDkqWu6cx4vg+DzRNllbk
 LIaFO5TBIwSaZUeuDTc9nQVL3YoBnGcMG+xi+FlI75ePNStkPH8T2tDTG
 u9v6TAj40FCG4eDbzPP7OvyuM9lTfarSSiYD5Xyrdrk06hRirtMyoT4hL
 XUiryj7ukMK5/L9JZH+Nl2PwCrJa+/rW/6DWjD8SLaTrSkOATQcI/QiKJ w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="253167628"
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="253167628"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 12:59:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="709213893"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga005.jf.intel.com with ESMTP; 01 Mar 2022 12:59:33 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 1 Mar 2022 12:59:33 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 1 Mar 2022 12:59:32 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Tue, 1 Mar 2022 12:59:32 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 1 Mar 2022 12:59:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dTwAK+1KDikNWg1dAszahQhmuyaUVFjNhmp46+i3so6z35tgak8OuW0ioi3K8bLI71mQ7QemO4gFFPszPHrFYv3v6nbnmSDUEh+oi5DxICdnuMyJlTBBPMx8xw5MkmIt2IN67rbPdJMfuRNIEUyegLMFXfWULDBDWoVquMi4Xa4HFcjB36oPHZo3mgaH9cM0Adu9ic7spJM58c9R3mn8DH9mn7GeKnjxyBARgFeCs8pYRm5NlVopzSt9msrjgqFFhxPPSg8QMyDsNHzzOlH40u69XzjNuO44iHVGl8MD+vv9uw2LcovZayWo3BjBMYJBzR4gynR8VxjDyFGgAXjXhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6sKPtrA8429RzejmJVDUlD2bQaplhLnvwhYssQdu85E=;
 b=RMCC/pkYkE8Z4mosCNdIsEW/js2YdgHB9ikp02oTrJmR/eXWMh0lJPm+EE1U7nNiwUC9NA1vdBKBYznythZvaxsgJlAd9CgOz5VIiKRM6GVYIzaf9fQsBTJ9NvEDn5gmT3a4NiFU2zv9kIHpc4ARqO0D4jSe9Ld9axFpeLMUMO9HSucr2mrulXeOKfmhAD5IYjPpY8gOIkMMfVNQGqm4fYa3vvn76IXBFTGTCRcDlZRkEAGS2uDtZMm+cAIkybpwJxI4U9Y/Wvtc/U0E5kYDiXFXVvF/sitUtSfqyGr06a8w+GSL6NJ6/YSeHyV8AY/MPO2AT0EM0yQdI5YWH7xYcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by BL1PR11MB5461.namprd11.prod.outlook.com (2603:10b6:208:30b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Tue, 1 Mar
 2022 20:59:30 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7%4]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 20:59:30 +0000
Message-ID: <8fb0a3a7-7968-79cb-9ea1-e31b0593acaa@intel.com>
Date: Tue, 1 Mar 2022 12:59:27 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [Intel-gfx] [PATCH 2/3] drm/i915/gt: Make the heartbeat play nice
 with long pre-emption timeouts
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220218213307.1338478-1-John.C.Harrison@Intel.com>
 <20220218213307.1338478-3-John.C.Harrison@Intel.com>
 <2a486991-1bfd-9b23-0b43-9173d17b7e13@linux.intel.com>
 <e95e8710-8410-2869-dec1-7f7a9e9a74fb@intel.com>
 <18205069-1210-745f-3bcc-2eddb0d17da1@linux.intel.com>
 <94e9889d-d71a-1428-516d-2928807cbf43@intel.com>
 <6ee75384-2cf0-6b34-ed54-3c7dc9ca31a3@linux.intel.com>
 <d6624800-87b0-f992-bc83-868744e2839c@intel.com>
 <ed505a8e-2d2b-135b-aaab-7e4a0befd5ba@linux.intel.com>
 <f6c70184-121e-9a2b-6bbc-54a67af293cc@intel.com>
 <96b7ce40-12f1-9ca0-1c5a-323d63dd8153@linux.intel.com>
 <9df22764-db87-a2d2-2b03-52b4d4c6da9c@intel.com>
 <9bd316d8-004c-621a-916c-2ebad5c31b43@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <9bd316d8-004c-621a-916c-2ebad5c31b43@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MWHPR19CA0085.namprd19.prod.outlook.com
 (2603:10b6:320:1f::23) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c09aee5-4aa3-489c-bc4c-08d9fbc66145
X-MS-TrafficTypeDiagnostic: BL1PR11MB5461:EE_
X-Microsoft-Antispam-PRVS: <BL1PR11MB5461A6C868CD3B66BC48E068BD029@BL1PR11MB5461.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +2aQTjA3BOPavHFhy43zfX8XgRlR2jFnNgWegOKIo+foPdq0dHPQWzaoTkl8vpjZXllUOuADtoD/qaDktnRzJkGa4RlYNTrgEPKjqfAS+7O7LR9Cic57C850vqyukGgzsm5TboaRziPceBXQWgjZ/LlBYJQ3DBlcgS2jOeVQEiDEr3mP6kU2+9t+sBb/A58t/wk089olCAoTaz24NMtE15HF/enGzqHRIbx6tEbEfOm5zGUBEBsO3k98/3ju91/BUsSiP2PoovmVoq2hSisR42CHf68hZOA5DsiX8n+wDNAS0w7muRhCL9MGMoAO/sIMIif7Q1ti4DHDzzzqnxoGHOSeOsXygPuQZzHOfSyKDS3nr2D35ezEeIokhAqNAx3i196NSXnBTWn77OYOOxmL0m7/UMGIMO1OM/SpAkcGisHUw+pd0roASovnPenv5973/CHE6Nrt2QLLqUxwGJAdvwaF4W2fO7LLU54usq3Tim6Ik1XOsm1FIjX2JE1ZeuNXjo5hAnoRSai35WS8yyUq8dpwr2U0u5fHx3Y6fAPt0TXQSSmgfbshYMARbonnbWXO/XA7Kl3THjx6c+mQ0sJh9adJ76rCEgzF+ahRt22RBCBO2KN8Tg/m+iuNF92/eMx4uEKogp85PgRmNlJxFjBt3jj60gMhfWFPChEt6eIMLlwBL/+pm1A25rvqXo+sCOYw3QiTO1cmrVtI0JG4GqVNN/2Xtv7lKMtZu6oNmqXvhIx/5jHSygOz7Vxid9s/Q/r1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(186003)(26005)(31686004)(316002)(36756003)(30864003)(2616005)(2906002)(6666004)(31696002)(83380400001)(6506007)(53546011)(508600001)(5660300002)(8936002)(38100700002)(8676002)(4326008)(66556008)(66946007)(66476007)(86362001)(82960400001)(6512007)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjhXckdWQ0lUVDFRblV3dVdLb0ozUFRVdFFvUHJYeGlzZEpGV09TSkM0NllP?=
 =?utf-8?B?cG1hWmkwb1RScWFERVZRMnI5SVFVSG51TmtVRG50S2dSb0dzV1duS0gzRUdu?=
 =?utf-8?B?K2k3dVBaRktwUFFDaGhEa3M0dC9TM2x5bHVGSFBKOWxzU3FETm8zTnhJNSs4?=
 =?utf-8?B?dmJua21NWDI2N29RQUZmaW1naDFIYmViTGUyY1N2ZnlUWkFSNEhmNEVwbGRG?=
 =?utf-8?B?YnFIM3ZrSUl1SnpheVU3dXlKQWtCc3NKdndlbE1EWEc5NS85dnVHSm9lay9z?=
 =?utf-8?B?MXgrNHVZRWpRZXhlZ2sxYkZETE5na2tzYVQwQmFoVHJvNWNvV20yV2UxRUti?=
 =?utf-8?B?ZVBrN1NwdVJQck96SndOZ1RnSTlkVnRPT25PclhFMi9kN1FwUm01YThNNjRZ?=
 =?utf-8?B?dk1RNHQyNStOU3pMNGd4YUZRbnVNNUhZMFBUdEp1cVI2THlPVm9hS3Q1dDhU?=
 =?utf-8?B?Mkx0VkNtbVdXV2I1WWNQa1N3RnRXMm5zbnNjRkhkUnVNdmJ6cGovaWxKcnI1?=
 =?utf-8?B?YjVkcHZkSkUzaStjZ3BmSVVhV2Noa0VtcisyWGw5cXdrVW9BZS8yaWRsYXNW?=
 =?utf-8?B?eXkxRllzYlJzaHNrL0wxQnlOQ2dpTnc5SEZYZHBwTFFWREo5NHFIQ29kTGdP?=
 =?utf-8?B?S1QxaEd6SlRqSEorN3d4UW56M3JTKzlLUnY2clBpaTZpNyt6MS9VbTZZV3FH?=
 =?utf-8?B?RE04TjdmNjhkczNvYWhmQ3M4bjZXaVowMXhLekdCRTNveUh5cmRkOWF1T0ZT?=
 =?utf-8?B?UitNQXFOMlF2YnNndHI4M1VOdlFLdTc0S2VQS3p4SzZDeVlQeUo4QVMrR3hK?=
 =?utf-8?B?VERGKzdIY3dQZ0RLalN1Tlc1WVVIMVlORVNGWXUwczZlSjFLOEZLemI5RUJs?=
 =?utf-8?B?a0kvdTlsSlJBaFlCZVMySHVTdDRnTjE5RTBYSFZoVGdQR09HU0ZmL2QwaE5L?=
 =?utf-8?B?eUJNeSt3Yk0wc1lyRjMyamxGUFA3S1hGdnZnbGlNaG5Qa3A2ZUx5eWZseGw4?=
 =?utf-8?B?Z2dNSWlhSHNJb0VzZWVzTUk3clhNQUJhSTE2dldXanBMdW1tcWJiODUwdkc3?=
 =?utf-8?B?TlkreXNtN3N3TVEyMFkyWHFLRlN1R01wRmRYN251dnVVYjJNMlpZMjAwMzdl?=
 =?utf-8?B?dWxBc0ZBTURpcWJ6WGFDTDl4M1N1T1lJcUVsOGdXVU1YODN1ZGFBS0RlNmhQ?=
 =?utf-8?B?WlNhNnNubjUvQ0U3aG1nbW1jTmpZU2xGQnBLT3hhUmZhS1Y1RWFuUDRBazhp?=
 =?utf-8?B?TUhoMzBxN1JYMjNtdi9GM1hQb1lqV0wxOUhNMUdGT2NablA0TzhOR2ZQN3VC?=
 =?utf-8?B?QVYzQVQ4VWVCaHNFRUwxdnhGMnJ2RWJYRmdBeTNleThCYkgrVFlnM3kvN0ps?=
 =?utf-8?B?VXg0Qks1TVhWRmNud3lvTXZPaGF1OW1MZHFydlo3S0FJVVdpMitLK090QmxL?=
 =?utf-8?B?NXlDanZtS0o3M1ZOZlRwaTNxVm4xSHRsR1JhQ1g5a083dnljNjJKU0NYY3Mr?=
 =?utf-8?B?Rk1rRzRoSDVRSmV3RS9pNE94ZXQ5MjFKYU51VnFDbFhoK0ZTd3RKMllXbXRq?=
 =?utf-8?B?VDVzVU50akFCZGU3Tk1QaVcwajBmTGlSSTRpcCtVZ0NBdjJ0bkh6eUxTU0xo?=
 =?utf-8?B?K0pLUW1DN0N6TnlhaU1RN3B5S0F4N0pENzRSWnJ6bTFKenpQVTRVUXIzQ3Jt?=
 =?utf-8?B?alZxZzQ1cEVNZ1JvMGNJRi9BU3FFaVRpcmsxQXRZU3F2QzVFbUxmM3BnTGU4?=
 =?utf-8?B?TVRRYzhJb3NmNFRZZW1VOTk5bkdFSTM4bW5hbkxxOHVzclBHQjJ5UkxnZFQ3?=
 =?utf-8?B?Y2hUbzFjV0ZrWFBUYWZwWWNXNXRmZTJ2NE1FRHd2OVh5SW9FcStxcVlqbEpp?=
 =?utf-8?B?NFlJMy9TWFk2ZnJoQ1ZVdHN0dWQ0eEJWYmU1T1hWckFCbUlSQ0pITHpyZ1gz?=
 =?utf-8?B?VCtYMlRIMktXY1c0eTZJVXdDVjVZT3dnTlN3RE1YaUZ2YlpPQUs0d2pYVW5u?=
 =?utf-8?B?NEtORXFkQjVQS3NkL0hUSjVhVzNkTFZoNzhJTlFWM0U1TlpBNWZBdlRHNDly?=
 =?utf-8?B?S3pyMWRJUjkvdFJVVlp3S25hVGViTThTMzdBdml4am9hcklOYTdDTEl1Qjlk?=
 =?utf-8?B?MnB1M1gxWTI4R2xMdUpxQWlSOHcrenhBSzlTNFhkL29xZ3ByNmVOZEJYdlg0?=
 =?utf-8?B?dXRVa3RPcmRwT1pERGFZblRVZmxoU3pDWWhyUGdpemFZZDlrZncvNXAxcTlW?=
 =?utf-8?Q?VCa8NOYyaDgjMnktvZc0UiJN9bq37abAsTPCLF0mfU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c09aee5-4aa3-489c-bc4c-08d9fbc66145
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 20:59:30.5723 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y/fGxSogaGOKnZ+17KRkGVHNO1GEgPkhQzXn8Zc4+btaJYe3QNr+9V7Bjh+fTf28xl/LXIYwChga/l6/6Y0gawBqu8hdDisomWsO74Jua6E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5461
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/1/2022 04:09, Tvrtko Ursulin wrote:
>
> I'll trim it a bit again..
>
> On 28/02/2022 18:55, John Harrison wrote:
>> On 2/28/2022 09:12, Tvrtko Ursulin wrote:
>>> On 25/02/2022 18:48, John Harrison wrote:
>>>> On 2/25/2022 10:14, Tvrtko Ursulin wrote:
>
> [snip]
>
>>>>> Your only objection is that ends up with too long total time 
>>>>> before reset? Or something else as well?
>>>> An unnecessarily long total heartbeat timeout is the main 
>>>> objection. (2.5 + 12) * 5 = 72.5 seconds. That is a massive change 
>>>> from the current 12.5s.
>>>>
>>>> If we are happy with that huge increase then fine. But I'm pretty 
>>>> sure you are going to get a lot more bug reports about hung systems 
>>>> not recovering. 10-20s is just about long enough for someone to 
>>>> wait before leaning on the power button of their machine. Over a 
>>>> minute is not. That kind of delay is going to cause support issues.
>>>
>>> Sorry I wrote 12s, while you actually said tP * 12, so 7.68s, chosen 
>>> just so it is longer than tH * 3?
>>>
>>> And how do you keep coming up with factor of five? Isn't it four 
>>> periods before "heartbeat stopped"? (Prio normal, hearbeat, barrier 
>>> and then reset.)
>> Prio starts at low not normal.
>
> Right, slipped my mind since I only keep seeing that one priority 
> ladder block in intel_engine_heartbeat.c/heartbeat()..
>
>>> From the point of view of user experience I agree reasonable 
>>> responsiveness is needed before user "reaches for the power button".
>>>
>>> In your proposal we are talking about 3 * 2.5s + 2 * 7.5s, so 22.5s.
>>>
>>> Question of workloads.. what is the actual preempt timeout compute 
>>> is happy with? And I don't mean compute setups with disabled 
>>> hangcheck, which you say they want anyway, but if we target defaults 
>>> for end users. Do we have some numbers on what they are likely to run?
>> Not that I have ever seen. This is all just finger in the air stuff. 
>> I don't recall if we invented the number and the compute people 
>> agreed with it or if they proposed the number to us.
>
> Yeah me neither. And found nothing in my email archives. :(
>
> Thinking about it today I don't see that disabled timeout is a 
> practical default.
>
> With it, if users have something un-preemptable to run (assuming prio 
> normal), it would get killed after ~13s (5 * 2.5).
>
> If we go for my scheme it gets killed in ~17.5s (3 * (2.5 + 2.5) + 2.5 
> (third pulse triggers preempt timeout)).
>
> And if we go for your scheme it gets killed in ~22.5s (4 * 2.5 + 2 * 3 
> * 2.5).
Erm, that is not an apples to apples comparison. Your 17.5 is for an 
engine reset tripped by the pre-emption timeout, but your 22.5s is for a 
GT reset tripped by the heartbeat reaching the end and nuking the universe.

If you are saying that the first pulse at sufficient priority (third 
being normal prio) is what causes the reset because the system is 
working as expected and the pre-emption timeout trips the reset. In that 
case, you have two periods to get to normal prio plus one pre-emption 
timeout to trip the reset. I.e. (tH * 2) + tP.

Your scheme is then tH(actual) = tH(user) + tP, yes?
So pre-emption based reset is after ((tH(user) + tP) * 2) + tP => (3 * 
tP) + (2 * tH)
And GT based reset is after (tH(user) + tP) * 5 => (5 * tP) + (5 * tH)

My scheme is tH(actual) = tH(user) for first four, then max(tH(user), 
tP) for fifth.
So pre-emption based reset is after tH(user) * 2 + tP = > tP + (2 * tH);
And GT based reset is after (tH(user) * 4) + (max(tH(user), tP) * 1) => 
greater of ((4 * tH) + tP) or (5 * tH)

Either way your scheme is longer. With tH(user) = 2.5s, tP(RCS) = 7.5s, 
we get 27.5s for engine and 50s for GT versus my 12.5s for engine and 
17.5s for GT. With tP(RCS) = 2.5s, yours is 12.5s for engine and 25s for 
GT versus my 7.5s for engine and 12.5s for GT.

Plus, not sure why your calculations above are using 2.5 for tP? Are you 
still arguing that 7.5s is too long? That is a separate issue and not 
related to the heartbeat algorithms. tP must be long enough to allow 
'out of box OpenCL workloads to complete'. That doesn't just mean not 
being killed by the heartbeat, it also means not being killed by running 
two of them concurrently (or one plus desktop OpenGL rendering) and not 
having it killed by basic time slicing between the two contexts. The 
heartbeat is not involved in that process. That is purely the 
pre-emption timeout. And that is the fundamental reason why tP needs to 
be much larger on RCS/CCS.



>
> If I did not confuse any calculation this time round, then the 
> differences for default case for normal priority sound pretty 
> immaterial to me.
>
>>> What if we gave them a default of 2.5s? That would be 4 * (2.5s + 
>>> 2.5s) = 20s worst case until reset, comparable to your proposal. Are 
>>> there realistic workloads which are non-preemptable for 2.5s? I am 
>>> having hard time imagining someone would run them on a general 
>>> purpose desktop since it would mean frozen and unusable UI anyway.
>>>
>>> Advantage still being in my mind that there would be no fudging of 
>>> timeouts during driver load and heartbeat periods depending on 
>>> priority. To me it feels more plausible to account for preempt 
>>> timeout in heartbeat pulses that to calculate preempt timeout to be 
>>> longer than hearbeat pulses, just to avoid races between the two.
>> Except that when the user asks for a heartbeat period of 2.5s you are 
>> actually setting it to 5s. How is that not a major fudge that is 
>> totally disregarding the user's request?
>
> This is indeed the core question. My thinking:
>
> It is not defined in the heartbeat ABI that N pulses should do 
> anything, just that they are periodic pulses which check the health of 
> an engine.
>
> If we view user priority as not under our control then we can say that 
> any heartbeat pulse can trigger preempt timeout and we should let it 
> do that.
>
> From that it follows that it is justified to account for preempt 
> timeout in the decision when to schedule heartbeat pulses and that it 
> is legitimate to do it for all of them.
But it can be optimised to say that it doesn't matter if you bump the 
priority of a pulse before waiting for the pre-emption period to expire. 
If the pulse was already high enough prio then the pre-emption has 
already been triggered and bumping the prio has no effect. If was too 
low then waiting for longer has no benefit at all.

All that matters is that you don't hit the end stop and trigger the GT 
reset too early.

>
> It also avoids the double reset problem, regardless of the backend and 
> regardless of how the user configured the timeouts. Without the need 
> to fudge them neither during driver load or during sysfs store.
>
> User has configured that heartbeat pulses should be sent every N 
> seconds, yes, but I think we are free to account for inherent hardware 
> and software latencies in our calculations. Especially since other 
> than flawed Gen12 RCS, other engines will be much closer to the 
> configured period.
>
> It is just the same as user asking for preempt timeout N and we say on 
> driver load "oh no you won't get it". Same for heartbeats, they said 
> 2.5s, we said 2.5s + broken engine factor...
Why would you not get the pre-emption timeout? Because it is too large? 
That is a physical limitation (of the GuC firmware) not an override 
because we think we know better. If we can obey the user then we should 
do so.

>
> I don't see a problem there. Nothing timing sensitive relies on the 
> heartbeat interval nor we provided any guarantees.
>
> That patch from Chris for instance AFAIR accounted for scheduling or 
> context switch latencies. Because what is the point of sending further 
> elevated priority pulses if we did not leave enough time to the engine 
> to schedule them in, react with preemption, or signalling completion?
>
>>>>>>>> Persistence itself can stay. There are valid UMD use cases. It 
>>>>>>>> is just massively over complicated and doesn't work in all 
>>>>>>>> corner cases when not using execlist submission or on newer 
>>>>>>>> platforms. The simplification that is planned is to allow 
>>>>>>>> contexts to persist until the associated DRM master handle is 
>>>>>>>> closed. At that point, all contexts associated with that DRM 
>>>>>>>> handle are killed. That is what AMD and others apparently 
>>>>>>>> implement.
>>>>>>>
>>>>>>> Okay, that goes against one recent IGT patch which appeared to 
>>>>>>> work around something by moving the position of _context_ close.
>>>>>> No it does not. The context close is not the trigger. The trigger is 
>>>>>
>>>>> Well patch says:
>>>>> """
>>>>> The spin all test relied on context persistence unecessarily by 
>>>>> trying
>>>>> to destroy contexts while keeping spinners active.
>>>>> The current implementation of context persistence in i915 can cause
>>>>> failures with GuC enabled, and persistence is not needed for this 
>>>>> test.
>>>>>
>>>>> Moving intel_ctx_destroy after igt_spin_end.
>>>>> """
>>>>>
>>>>> Implying moving context close to after spin end fixes things for 
>>>>> GuC, not fd close.
>>>> That's because persistence is currently a big pile of poo and does 
>>>> not work in all the corner cases. The correct solution is to leave 
>>>> the IGT alone and just fix the implementation of persistence. 
>>>> However, the IGT update to not use the broken feature is a trivial 
>>>> test change (two lines?) whereas fixing the broken feature is a 
>>>> significant KMD re-work. It needs to be done but no-one currently 
>>>> has the time to do it. But trivially changing the test allows the 
>>>> test to work and test the features it is meant to be testing (which 
>>>> is not persistence).
>>>
>>> Clear as mud. If the statement is that persistence cannot simply be 
>>> removed, then for sure it cannot be said that anything can be fixed 
>>> or unblocked by allowing some test to pass with GuC, by making them 
>>> avoid using persistence (and not even explicitly with a context 
>>> param). It implies persistence does not work with the GuC, which is 
>>> then in contradiction with the statement that we cannot just remove 
>>> persistence. I truly have no idea what the argument is here.
>> Persistence works in the right set of circumstances. Those 
>> circumstances do not involve dynamically changing heartbeat settings, 
>> platforms with dependent engines, etc. The correct fix is to leave 
>> the IGT test alone and fix the persistence implementation. However, 
>> that is not trivial and we have many other high priority holes still 
>> to plug. Whereas changing the IGT to not use a feature it is not 
>> intended to be testing anyway is a trivial change and gets us the 
>> test coverage of what that IGT is meant to be for.
>
> It may be acceptable if someone is reviewing overall coverage and 
> making sure all is not removed and so a missing ABI in GuC backend not 
> swept under the carpet. That's my main concern. If it is acknowledged 
> persistence is a needed ABI, then how can we upstream dependent engine 
> support without making sure this ABI is respected? Removing it's use 
> from random tests does not fill me with confidence that we are on top 
> of this topic.
Maybe if it didn't take three+ weeks to get a trivial change merged then 
I might have time to work on the non-trivial tasks that are in the backlog.

John.


>
> Regards,
>
> Tvrtko

