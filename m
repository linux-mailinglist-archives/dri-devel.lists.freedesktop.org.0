Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CAB47D906
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 22:58:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 583CB10E311;
	Wed, 22 Dec 2021 21:58:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73B4310E311;
 Wed, 22 Dec 2021 21:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640210293; x=1671746293;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lLj1IAbxIyL4oUWJZ4LlW01XgahGs84iRn2agw89C7Y=;
 b=gP6eklGP6hixYFDH+c8hCASmdV8xoyDjJFrtW+PxhViboOYdXWF9vAly
 llQVzy5z5+BkDWFPqHCIpAft8OABRhZfhWGpvIzy8vVIQVwewVvazJmbn
 kTrJhhS7vgfzGZCQEcnTopoylKqhTa79uJHFUf0JKcpV5CbVD4wsWfYe5
 f9G8HD6Hwgsp4c/cpvzpdKpgTeiVSRUpc/WbIuBBsXwkA/AnDR/8G2iUH
 bcoYnAyU4Wzybzqx2nNcj44nnlaQNCKq2K1C1mRr2X/dZei9tDmmAo433
 mJtMcjJQCOGOuHsXgSuH+JRTvK0pDa9gzUQyRkEcof2CdB1LbmVy/esnr g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="227560252"
X-IronPort-AV: E=Sophos;i="5.88,227,1635231600"; d="scan'208";a="227560252"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2021 13:58:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,227,1635231600"; d="scan'208";a="570701156"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga008.fm.intel.com with ESMTP; 22 Dec 2021 13:58:12 -0800
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 22 Dec 2021 13:58:11 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Wed, 22 Dec 2021 13:58:11 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Wed, 22 Dec 2021 13:58:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b1hM1YdaqixMOL75W6IAqZsjMItWZxKPDwquDzOSgPeYLqM+9A1sIlv0sba3JC5fereJqZuwrommAFwv+1dYxB72DORgAmGwB5bAm1v3gTP9QbnJBK2D2Rt0kUOmtDTBsUzMzKKSV8nm7fraqxGQnAXVN+iaLMova6pQk5Xix6hWVNMiSO7AACkW/ReDGMXoGKIaPkq/2mdZaL7BeZF8HhCrPdZDVkj6nQfy2NOhVjJEVTV8Tekifrud1lFg4+pgkVxlTCRlu0vhw3DqbXPBqXl4eDxdF1eISRidebpNb76I2GbfnqypZjZ+gyQtRYsLr20JtYUuf0ngT2FgDcdRfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KtkdAOpphx+aAb4UpJef6Jkzuu0Kj8f9a6p4L+lwhGg=;
 b=ZgGVQgR+ducaiPSLudvCoPlSJg3xOc2oTyZv01pB/1tRuhyHI5TfvccEA9IoULt8stWIrxhhpUllm9XWdYPtXjmi+h4DqQULNEYHAFrDEaOeYMlhbEN2bU8XuoqtASN8HuFrv49ZwSOmRMxxhpdXEyzagJYRdR+ir/db0UWbwyozWWGKyegHnfDmSVOsFprgPgBMrMDImyMz1J/kwjWDUnhbf7GPAC+A9H5vVQMIdgosZHThD+a3aDNud/NmpGehYXn4b/p2uq2wYsU5pWlkHeOpkcGIGqYoOQRaVfb4l3PMKqtQMFzbS8koMZeoBeBiWohz3L188iAH5SCDZCyUjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SJ0PR11MB5136.namprd11.prod.outlook.com (2603:10b6:a03:2d1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Wed, 22 Dec
 2021 21:58:10 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::2ce1:2a7:cd07:81df]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::2ce1:2a7:cd07:81df%6]) with mapi id 15.20.4823.019; Wed, 22 Dec 2021
 21:58:10 +0000
Message-ID: <a00f0ff4-83ef-e267-1f0a-06e6953083f9@intel.com>
Date: Wed, 22 Dec 2021 13:58:06 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc: Log engine resets
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Matthew Brost
 <matthew.brost@intel.com>
References: <20211214150704.984034-1-tvrtko.ursulin@linux.intel.com>
 <597d4ad0-fdae-49a6-b471-3a83d4c25b98@linux.intel.com>
 <20211217162254.GA22048@jons-linux-dev-box>
 <3d32df02-c02e-9c35-5165-79af1cb10100@linux.intel.com>
 <1c3b1b53-0e9e-a89c-1a77-90cbc229c637@intel.com>
 <01320c8c-a9c9-8c21-7601-75860bf11838@linux.intel.com>
 <1d78552e-8a7c-84c5-a9e6-7c7476a5e2e5@intel.com>
 <5921ac11-1286-1062-f702-f33bc55e4a0e@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <5921ac11-1286-1062-f702-f33bc55e4a0e@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CO1PR15CA0114.namprd15.prod.outlook.com
 (2603:10b6:101:21::34) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7370071d-ffab-4a0e-d675-08d9c5962478
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5136:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <SJ0PR11MB5136B771CCCB29C4362DF9A5BD7D9@SJ0PR11MB5136.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +2Pp8MEGseD2Y3U5mBm23Y5pCp8XYUGaR4id059p9VrBbWAuEsOfruZhWSRU20o1U9eoMRf4OMQ55VXC0LEGs7ITyWauU1tjMTOPViU6tbaaEGMTQNqYJRLIF6Z4dc1f29w+WTDuDTVNmPNelSX59fsSwSL6BGXzloc5Fxq7wLwQ0TEQfG1RfIQyQV5+wL8sVTpRxOyYPEB529nFqx3x3caKiQEIZ4pgD3uedoFem1t1Ggoc8U6XC7AS72td/4wuJWGzPVG8kDoDmf7c8tQIFRDBnr8vMc1u42/Ya0DnzLqxp9YFxesC8MmOU5SVTkeB/xih93MZ2108O6sQIqmKwz2MppcVm5nm6898E41fPid+asEtboiFquFQsxLI9wRKjLI4ZseuLg2djh6nK+L3jcwva46f2rB9K3i0PP9GHqeKNubQjlSmTNxpa1JFpH+Z0JSxOpPD1/5hKpqEiZxktU4nm33PsSiLirEVqzcxa/DP2E+JzK436VAP3RLVbChp1nhrQKwZShpdJPjZjPaN8GzligvsVyOm5K3ENPUCnppItMRTeSw2xieRAQfqniTuAVIzbakIrPqeOh943Z7JsdXdmBEhZoeegxJRO5qzNkWmYv4Sg5JPD9dcGEE2nvE9QjkpqrRJsEVDdSK+vRfUJUTAlvdrgpmKqxkO08OH0IdFNi4qnGz7R+I3mifbxTkwzyi9viZyqvQzDYU6Y5GOKJ0ZHzBlW6M1YWhnHSil9atosn1Ou3CiAUTkCYMmPc8w
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6506007)(66556008)(66946007)(66476007)(316002)(6636002)(30864003)(53546011)(6512007)(82960400001)(8936002)(83380400001)(6486002)(26005)(31696002)(5660300002)(86362001)(31686004)(8676002)(186003)(6666004)(38100700002)(36756003)(2616005)(508600001)(4326008)(110136005)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1RNSGxnTUVkKzZlelY1Mk8wT0dlb0g4L1VJQVZtdGs3amd4VnRWY3BxQW1K?=
 =?utf-8?B?Qk00NUMzOEQ5cnlrNnpodngvMzBEOWRXZXJOZ2F1dStEdVg4MFpibWxnL2xi?=
 =?utf-8?B?SDBaamVMOXk1TXFmdGxsSTRzOEs1TTBDNzNCUkl4aGUvTVdXUGxCRWhYeHJo?=
 =?utf-8?B?VTBEYjFvTkQ5Z2hQUEdPUEt2U3ppRjR5bTcySWVwRjE1eE5pTERmWW03ZktE?=
 =?utf-8?B?bnNZTEFqMEI1bXZoRHUzSGtMZjFka0tTU05saFhzcXpaYlhES0MvRkEyUnNm?=
 =?utf-8?B?SHZsSFMvZGt4RWJqWHRTWFRld1ZIbk5qOTIyUnhUVzZHWDcvOG9YQ3kybGNk?=
 =?utf-8?B?OEtTNWltaVo2ZlhTWFJ5OE9DbzcwWnBIWGxqUkswRlUvUEVSOXFIM215Mng5?=
 =?utf-8?B?NWw5RGdHVzFMQU55a3UyQy9NSGg0NXRuSS9UVVM1YzBEK01hOGgzQUNRK280?=
 =?utf-8?B?UVpzNzl4UlV1SEE5N3BxK3p3MG1XMm9BUEJTN1RWbHovaDdiK1BPbi9HSWFy?=
 =?utf-8?B?cFNVVTA1ZUtyVjVmL2w3NXFsamdFaTVRZVlsY3NGSkYvSHhiTGh5OEdvbVdi?=
 =?utf-8?B?RFNoWDc2WmxOYWVqK1FnWDBBLzJlZkVGcUdGWEVjQ2ZnVE9ZbDM3Smc5eDRo?=
 =?utf-8?B?MmQ1UHdQR2xlZjNkcXRGdDNyc2lnK1BGZ1BIWlh4WG9FZDRSUzFyVkpBR090?=
 =?utf-8?B?a0tNZHh0QWVucHBZS1oveEx3bEt1TWRLakZGa0dOOWlGdEtQVTZYMzdWa3JI?=
 =?utf-8?B?U0Uxa0ZUSGswOUVTN2FBYWpRakpiYUNZQVN4SERjWEhmSkpucjlidUo2eUZm?=
 =?utf-8?B?dnBvamJPZmYvUUhwWHV5clk2bmprcnBpWGtQbHFyeHU1OEZ0UUxHbU9Ya3Bz?=
 =?utf-8?B?OHBGeUJLRG5sUWZteFFVRXFOeEs1UWdYK0w1SFFPSjJ5QXBoZHg0T0JlNEtp?=
 =?utf-8?B?Qm4vcXlDb0p1cVRjQUNKNDQyR2xIVmJ6V1Q3UjJwd0NjdVhPY0V5dldTSjlT?=
 =?utf-8?B?SlFBdlg4dVVieFV4SkNJU2tBNVp4N0FwZmNLdHpRU3p4Z3c1T20wMytXRDVm?=
 =?utf-8?B?bTdnWFFwc0tEbnZka09VUkNqSml4cysyMjhzZ1hWM0g0d3ZHVWYyT29UYTNF?=
 =?utf-8?B?bnpmQ3h0ZTRicG5xN1FOVGlnbWxFUS9nZklZdjdvRFNGRnhWbC8rY0F6cE9D?=
 =?utf-8?B?aFpOUktDWlRqZDQ3L2tjQ0RBVUFOcUs0TWtGUyt2dTY4aVJzTlFEbGlpcVMv?=
 =?utf-8?B?NFM3OWYzVFFMditBcWo3aWFlcllXQ0tSVEVTaWFvaUpMMTJwU1VCWnRkYUJ2?=
 =?utf-8?B?bW9FRmJRcFJnR0g3VFc1RkY4d0djd3U0cGxYNHBWYlJreWl0TFdMcDBZV2lh?=
 =?utf-8?B?TVM0NnBxclBxREFOSDdlR2Z6Zzk5c1laRFpyMjFLY21IdklsUGlLZjFhMEJk?=
 =?utf-8?B?TjcyYzdzaEl0NEp2Rko3VCtDRXZ5YmpzZkZJMWgybGtGcytJaGtmR1NyU3dk?=
 =?utf-8?B?YU5UV2twRWpCTlE1RXV2dFpVV1VUM3lBQ0hEbGtrZUZSOHRSWm5EMlBRcmpx?=
 =?utf-8?B?aW9ud2VHN0NzNzVMa1BJUDZhS0Yycm1yYzVnL1ZDSzdDWGtMZUk0OEVCVU9v?=
 =?utf-8?B?TmtLeWZHNFlFSDNzMWFJRlY2b2xuYkxHS1dZZDZteXBLMXVmZXp2OVI1WVlv?=
 =?utf-8?B?TktoM0V3dTg5bGMzV01wMk9uU3c1ekw2QjVrZHByYlE2Q3U2Vmgzb0k2cXVP?=
 =?utf-8?B?enBzQlJDOW1MWlBuWnJ6VGU2MVIvUWtyZ010MU1oY3ZqNXNya3R4eWowUzBO?=
 =?utf-8?B?Vy8vRVRpSVFvcGkxVnYvV29RTHIremxyc3JyV0VyZmRDYU9jd0VIUllmbTRw?=
 =?utf-8?B?YkJ2cXp2UkhNcWRmUmFqZ3hhYm14djRwaDh5ZjdNV0VKL01oREE0cmNFV204?=
 =?utf-8?B?bjlXQWdtbFJ0RVhXT29yYXJmbkUyQTZ1QjBNOTRvVlBLZ2oxWGZ6QlpaUXdT?=
 =?utf-8?B?WnN3eTlOTHhPYXVmMXJoSE51Umx0Z0dkMTdFemh4bEk3djNmWEN6Zmo3TFBm?=
 =?utf-8?B?dEp1SzRzUm5QRzhWMktjczhMOW5nNWltT0pXejdDcmNnL3dCR3g1WmxXSVJ0?=
 =?utf-8?B?bk1JTkZMRUZjMXN0QnBUa1MxMVdVaTNuaEM3dGgrWVI0eFp1SFVVaTVidmhi?=
 =?utf-8?B?aVIvNjRIMTJTSWpBMWhicVMyVmhWbjBvNHRBVDFaYXpSMDByNFR5VmFDQVAy?=
 =?utf-8?Q?ZMTP/OrMHTyK4giGOeZK9ufKw5T6nwAfLVcRGsLo4c=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7370071d-ffab-4a0e-d675-08d9c5962478
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 21:58:09.9176 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p/BA6bAIZorpJInU/rwLBzHaoJ3ucS4RMFBbDolgLR1jYD9K4nZ3LVN4aotPFt238Bft8UXc6Atkf4yUGAk6DfnptvAJzkV9IwFUYn6VFiw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5136
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
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/22/2021 08:21, Tvrtko Ursulin wrote:
> On 21/12/2021 22:14, John Harrison wrote:
>> On 12/21/2021 05:37, Tvrtko Ursulin wrote:
>>> On 20/12/2021 18:34, John Harrison wrote:
>>>> On 12/20/2021 07:00, Tvrtko Ursulin wrote:
>>>>> On 17/12/2021 16:22, Matthew Brost wrote:
>>>>>> On Fri, Dec 17, 2021 at 12:15:53PM +0000, Tvrtko Ursulin wrote:
>>>>>>>
>>>>>>> On 14/12/2021 15:07, Tvrtko Ursulin wrote:
>>>>>>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>>>>>
>>>>>>>> Log engine resets done by the GuC firmware in the similar way 
>>>>>>>> it is done
>>>>>>>> by the execlists backend.
>>>>>>>>
>>>>>>>> This way we have notion of where the hangs are before the GuC 
>>>>>>>> gains
>>>>>>>> support for proper error capture.
>>>>>>>
>>>>>>> Ping - any interest to log this info?
>>>>>>>
>>>>>>> All there currently is a non-descriptive "[drm] GPU HANG: ecode
>>>>>>> 12:0:00000000".
>>>>>>>
>>>>>>
>>>>>> Yea, this could be helpful. One suggestion below.
>>>>>>
>>>>>>> Also, will GuC be reporting the reason for the engine reset at 
>>>>>>> any point?
>>>>>>>
>>>>>>
>>>>>> We are working on the error state capture, presumably the 
>>>>>> registers will
>>>>>> give a clue what caused the hang.
>>>>>>
>>>>>> As for the GuC providing a reason, that isn't defined in the 
>>>>>> interface
>>>>>> but that is decent idea to provide a hint in G2H what the issue 
>>>>>> was. Let
>>>>>> me run that by the i915 GuC developers / GuC firmware team and 
>>>>>> see what
>>>>>> they think.
>>>>>>
>>>> The GuC does not do any hang analysis. So as far as GuC is 
>>>> concerned, the reason is pretty much always going to be pre-emption 
>>>> timeout. There are a few ways the pre-emption itself could be 
>>>> triggered but basically, if GuC resets an active context then it is 
>>>> because it did not pre-empt quickly enough when requested.
>>>>
>>>>
>>>>>>> Regards,
>>>>>>>
>>>>>>> Tvrtko
>>>>>>>
>>>>>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>>>>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>>>>>>> ---
>>>>>>>>    drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 12 
>>>>>>>> +++++++++++-
>>>>>>>>    1 file changed, 11 insertions(+), 1 deletion(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c 
>>>>>>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>>>>>> index 97311119da6f..51512123dc1a 100644
>>>>>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>>>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>>>>>> @@ -11,6 +11,7 @@
>>>>>>>>    #include "gt/intel_context.h"
>>>>>>>>    #include "gt/intel_engine_pm.h"
>>>>>>>>    #include "gt/intel_engine_heartbeat.h"
>>>>>>>> +#include "gt/intel_engine_user.h"
>>>>>>>>    #include "gt/intel_gpu_commands.h"
>>>>>>>>    #include "gt/intel_gt.h"
>>>>>>>>    #include "gt/intel_gt_clock_utils.h"
>>>>>>>> @@ -3934,9 +3935,18 @@ static void capture_error_state(struct 
>>>>>>>> intel_guc *guc,
>>>>>>>>    {
>>>>>>>>        struct intel_gt *gt = guc_to_gt(guc);
>>>>>>>>        struct drm_i915_private *i915 = gt->i915;
>>>>>>>> -    struct intel_engine_cs *engine = 
>>>>>>>> __context_to_physical_engine(ce);
>>>>>>>> +    struct intel_engine_cs *engine = ce->engine;
>>>>>>>>        intel_wakeref_t wakeref;
>>>>>>>> +    if (intel_engine_is_virtual(engine)) {
>>>>>>>> +        drm_notice(&i915->drm, "%s class, engines 0x%x; GuC 
>>>>>>>> engine reset\n",
>>>>>>>> + intel_engine_class_repr(engine->class),
>>>>>>>> +               engine->mask);
>>>>>>>> +        engine = guc_virtual_get_sibling(engine, 0);
>>>>>>>> +    } else {
>>>>>>>> +        drm_notice(&i915->drm, "%s GuC engine reset\n", 
>>>>>>>> engine->name);
>>>>>>
>>>>>> Probably include the guc_id of the context too then?
>>>>>
>>>>> Is the guc id stable and useful on its own - who would be the user?
>>>> The GuC id is the only thing that matters when trying to correlate 
>>>> KMD activity with a GuC log. So while it might not be of any use or 
>>>> interest to an end user, it is extremely important and useful to a 
>>>> kernel developer attempting to debug an issue. And that includes 
>>>> bug reports from end users that are hard to repro given that the 
>>>> standard error capture will include the GuC log.
>>>
>>> On the topic of GuC log - is there a tool in IGT (or will be) which 
>>> will parse the bit saved in the error capture or how is that 
>>> supposed to be used?
>> Nope.
>>
>> However, Alan is currently working on supporting the GuC error 
>> capture mechanism. Prior to sending the reset notification to the 
>> KMD, the GuC will save a whole bunch of register state to a memory 
>> buffer and send a notification to the KMD that this is available. 
>> When we then get the actual reset notification, we need to match the 
>> two together and include a parsed, human readable version of the 
>> GuC's capture state buffer in the sysfs error log output.
>>
>> The GuC log should not be involved in this process. And note that any 
>> register dumps in the GuC log are limited in scope and only enabled 
>> at higher verbosity levels. Whereas, the official state capture is 
>> based on a register list provided by the KMD and is available 
>> irrespective of debug CONFIG settings, verbosity levels, etc.
>
> Hm why should GuC log not be involved now? I thought earlier you said:
>
> """
> And that includes bug reports from end users that are hard to repro 
> given that the standard error capture will include the GuC log.
> """
>
> Hence I thought there would be a tool in IGT which would parse the 
> part saved inside the error capture.
Different things.

The GuC log is not involved in capturing hardware register state and 
reporting that as part of the sysfs error capture that user's can read 
out. The GuC needs to do the state capture for us if it is doing the 
reset, but it is provided via a dedicated state capture API. There 
should be no requirement to set GuC log sizes/verbosity levels or to 
decode and parse the GuC log just to get the engine register state at 
the time of the hang.

On the other hand, the GuC log is useful for debugging certain issues 
and it is included automatically in the sysfs error capture along with 
all the other hardware and software state that we save.

There is intended to be a publicly released tool to decode the GuC log 
into a human readable format. So end users will be able to see what 
engine scheduling decisions were taken prior to the hang, for example. 
Unfortunately, that is not yet ready for release for a number of 
reasons. I don't know whether that would be released as part of the IGT 
suite or in some other manner.

>
>>>> Also, note that GuC really resets contexts rather than engines. 
>>>> What it reports back to i915 on a reset is simply the GuC id of the 
>>>> context. It is up to i915 to work back from that to determine 
>>>> engine instances/classes if required. And in the case of a virtual 
>>>> context, it is impossible to extract the actual instance number. So 
>>>> your above print about resetting all instances within the virtual 
>>>> engine mask is incorrect/misleading. The reset would have been 
>>>> applied to one and only one of those engines. If you really need to 
>>>> know exactly which engine was poked, you need to look inside the 
>>>> GuC log.
>>>
>>> I think I understood that part. :) It wasn't my intent to imply in 
>>> the message multiple engines have been reset, but in the case of 
>>> veng, log the class and mask and the fact there was an engine reset 
>>> (singular). Clearer message can probably be written.
>>>
>>>> However, the follow up point is to ask why you need to report the 
>>>> exact class/instance? The end user doesn't care about which 
>>>> specific engine got reset. They only care that their context was 
>>>> reset. Even a KMD developer doesn't really care unless the concern 
>>>> is about a hardware bug rather than a software bug.
>>>
>>> I was simply aligning both backends to log as similar information as 
>>> possible. Information is there, just not logged.
>>>
>>> Concerning the wider topic, my thinking is end user is mainly 
>>> interested to know there are any engine resets happening (to tie 
>>> with the experience of UI/video glitching or whatever). Going for 
>>> deeper analysis than that is probably beyond the scope of the kernel 
>>> log and indeed error capture territory.
>> I would still say that the important information is which context was 
>> killed not which engine. Sure, knowing the engine is better than 
>> nothing but if we can report something more useful then why not?
>
> Make it so. :)
>
>>>> My view is that the current message is indeed woefully 
>>>> uninformative. However, it is more important to be reporting 
>>>> context identification than engine instances. So sure, add the 
>>>> engine instance description but also add something specific to the 
>>>> ce as well. Ideally (for me) the GuC id and maybe something else 
>>>> that uniquely identifies the context in KMD land for when not using 
>>>> GuC?
>>>
>>> Not sure we need to go that far at this level, but even if we do it 
>>> could be a follow up to add new data to both backends. Not sure yet 
>>> I care enough to drive this. My patch was simply a reaction to 
>>> noticing there is zero information currently logged while debugging 
>>> some DG2 hangs.
>> In terms of just reporting that a reset occurred, we already have the 
>> 'GPU HANG: ecode 12:1:fbffffff, in testfw_app [8177]' message. The 
>> ecode is a somewhat bizarre value but it does act as a 'something 
>> went wrong, your system is not happy' type message. Going beyond 
>> that, I think context identification is the next most useful thing to 
>> add.
>>
>> But if you aren't even getting the 'GPU HANG' message then it sounds 
>> like something is broken with what we already have. So we should fix 
>> that as a first priority. If that message isn't appearing then it 
>> means there was no error capture so adding extra info to the capture 
>> won't help!
>
> The issue I have is that "GPU HANG ecode" messages are always "all 
> zeros". It thought that was because GuC error capture was not there, 
> but maybe its something else.
Hmm. All zeros including the platform and engine class part or just the 
instdone part?

The instdone value is engine register state and will have been cleared 
before i915 can read it if the reset was handled by GuC. That comes 
under the heading of state we need the new error capture API for. 
However, the context should be correctly identified as should the 
platform/engine class.

Currently, the recommended w/a is to set i915.reset=1 when debugging a 
hang issue. That will disable GuC based resets and fall back to old 
school i915 based (but full GT not engine) resets. And that means that 
i915 will be able to read the engine state prior to the reset happening 
and thus produce a valid error capture / GPU HANG message.

John.

>
> Regards,
>
> Tvrtko

