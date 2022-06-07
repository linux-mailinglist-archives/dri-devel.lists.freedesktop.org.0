Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A837541F5B
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 01:15:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7359710F7F0;
	Tue,  7 Jun 2022 23:15:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1254610FC38;
 Tue,  7 Jun 2022 23:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654643752; x=1686179752;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=n0T5ayx76Mzbf+4shOEZFi1+iUlluMVpq2FhU/KX7zU=;
 b=I6kJ17BJl9FGvHPbAqiUyrg6DbbkpfntjxnfLFI8dbR6zi+oknj2JoLn
 FBKavGhIffDbYKC8WSCUVuA1mVM6JQTp+vbRUxNuylSxwGr/S/On+D88R
 jmJTJQFPbxfxNjfCY0dKBVR2no/UsnJ09Wh8X5lAh6pwv8ndE52g+r89V
 bxheVNJp2CibhCbO0X/+GIJ7OVRqK9nbPMVjLf9Pr9ZUIAv2oIexy3sGp
 qPaaIUg8Z93UB8wn+/I7Nzb9dU5O/v51+yrcxiaGU/b6kjW1WmUfZrK5f
 xzFq3V07BbVMt0BQn1o6pr40ZgZCc630pV8B8DKx/zsrDUOtN4DehSDDZ w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10371"; a="338424589"
X-IronPort-AV: E=Sophos;i="5.91,284,1647327600"; d="scan'208";a="338424589"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2022 16:15:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,284,1647327600"; d="scan'208";a="682995097"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga002.fm.intel.com with ESMTP; 07 Jun 2022 16:15:27 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 7 Jun 2022 16:15:27 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 7 Jun 2022 16:15:27 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 7 Jun 2022 16:15:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TFQPvd8Zbf7GTaDB0WdP9vwXo13VK5vBSICpqjRR2Qy+fS71yBQnm0JpBxjIxbVLouuw6W+T+PqqPcAmzxTl+VlvATbvRG8scyPsb3Yrbj4Jeb+8/bhIlwtXbeqfofz0FmLCAqxrbOoZlwvB81siIFs9T6uZuky6qCEaGHtHJRU23lN0ZLutVpF5YMxTpilaZVw9RzaZ3CNtbEnfwaDPkyeS4mFJceRxtS1CMNIpXZ0LgjhukouDYkq1cMfjPz6Vqaf6FSHibVQVc7BLNWIRlNFMhauVajITVY/mgehzJ/iqeEiK0b1tZE/12V/BV9zsHZoFN+fKpNCc4RNJ/IWjJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T2wOQADUqC1+GLlUIrZgrzkf0eh1I80/LzcA2vBh2b8=;
 b=AwFLGOfB+Sm2DM1zi8iSkKjJ7bnhKhqqMYB9r4i1xHcqa4RjcY3KsQbCMNfNBRrTZfPDptPOD7ZZ0eExGMhQrheX9IMG8Mtx4HxDuT06C7neq/QbkR9b6WZzEtzu2b7phSGT5pBPnLgrHfGG3JMrdk+kkroDmmBaOdyPbLosaE8cl0c9lcz1i/mbgsBzqvrl8ueOg/migEXCLj/x3tWhuXx3eeabG2aEvJY6kbIeVbSxCWqMA2BfWrje9PqIa4sDweWPUYYjQU/PjxXq39In8pnJ1gBH+h+1fxh4uZ641pXhW9xyzF/V/VybSh31eKAIcPkKI43SGQ60yZgdVlPmdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SN6PR11MB2543.namprd11.prod.outlook.com (2603:10b6:805:56::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Tue, 7 Jun
 2022 23:15:25 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::c4f8:da8e:7cef:8cf]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::c4f8:da8e:7cef:8cf%6]) with mapi id 15.20.5314.019; Tue, 7 Jun 2022
 23:15:25 +0000
Message-ID: <c9edf8d0-d36c-8b65-d536-f8eee4986662@intel.com>
Date: Tue, 7 Jun 2022 16:15:19 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [PATCH] drm/i915/guc/slpc: Use non-blocking H2G for waitboost
Content-Language: en-GB
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, Vinay Belgaumkar
 <vinay.belgaumkar@intel.com>
References: <20220515060506.22084-1-vinay.belgaumkar@intel.com>
 <87y1y8jeer.wl-ashutosh.dixit@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <87y1y8jeer.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CO2PR07CA0055.namprd07.prod.outlook.com (2603:10b6:100::23)
 To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 595b8950-0ec8-4b5a-fc56-08da48db9a47
X-MS-TrafficTypeDiagnostic: SN6PR11MB2543:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <SN6PR11MB254366FBBDFA3AD1FA8C076CBDA59@SN6PR11MB2543.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X9Ro747217sSbRK1LpCP/yM7fmT2EXgdR5MIwGtxAbNqiKYAz21u6Uv+EWcrR+Up+9u4PwFkLkAH633jgWZmzTpMr6iRWXbiNEydzWEmOFbFL4bp6fTPNBREeHCNvzq5IUYo/IMP74EePKepCAbm4M2zbwb1RZ3cyMyssYC+UgjQucHrx9YhxSACVLmzoT41FjYrVp84Tv0GBMFnLkV+z9alfse385SuOGjjw+PGiq1cwNTvkU2zQTJ21BVdmpaLNVkTC1vZ+NWhZ261VounaBKaqrUWu5vAWDYF6HZlJSusgRkiRoLECL/v5ifIorNAaDxooy7ufJRCZFWpTyyiMgFmvXMeLBq9s9dvL2V9jXvvBDifb3JNduuuEfj72yQLL8CipBe6opV4yfx7vm+O/QedUMuNmO+6BfXeN8CRoXKy7v59QjH3UXD+yj2m6ZPwtpTl8TrUZ3OPg9LJfpXUMN3VMfxNwoDKU3GL/vnMZOOfTNw3ZThF0nT9EpYmUggEz9bt4PqORkN6gkdO2FZk24VX5I2c0giKWNxKjT6+mCkcoH0ZSBOpUSQfM6TI2dtDy8txw63KHbjB/K+QZOs8KvlzIhwfEfinNUyKBBEs2cbSAg7ScDoyA2VIQ51Rf69wc5lU//VibHJemY6asqPzx0w7xO3WVLTTMmKJ4SXAWgzZb3w1Haq7ILWvqn+Ph7TSuhU3wINvMckZY4eerMD6OlTFR4utLhiXaqz7Y0m66Nyoakd3V2A30dvwD3GaTExg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(110136005)(316002)(66946007)(66556008)(54906003)(8676002)(4326008)(31696002)(66476007)(2906002)(86362001)(6636002)(36756003)(8936002)(450100002)(6486002)(107886003)(83380400001)(6506007)(26005)(31686004)(82960400001)(2616005)(5660300002)(6512007)(38100700002)(186003)(508600001)(6666004)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QU5qamJ3MUlrczdiVTBkaVJSSUM4K1N5VTFaL3FIQ3YyRHBCdDdOMXlkcTFj?=
 =?utf-8?B?cjVmQkdtcnRhMzh0MVFEUGpodW5PWFV6Q1pzT3VFMjRmLzJMZ0xpVEt1V0Yz?=
 =?utf-8?B?M05HdXFuYnhUVlVsekJZbHQ3R1BNUmhOTHZvL3FCdTBtcGZya0VXNzBnRGw3?=
 =?utf-8?B?c0lhT0ZUUG5iYVVQd3RNckR2ZmYycnBZZFhjMmNwdlRINGhFRkxEaFJmMjRS?=
 =?utf-8?B?TDUvZE4vSHpYUlJkb0QvS0NGdmZ2by9MVmhqUXRRcDZBUlR4VVU0M3NrdkE3?=
 =?utf-8?B?MWJoU3dCUWV2RFJ2N2ovTEx5TXFaRmpwdCtOekF1RlQ1K3JWV1dOb0ZuVFAw?=
 =?utf-8?B?K3pqV3JCTFA1MzFoMUpDcFNLdHV0V0dHejZIVytONjIraDNxY0xiaFZBV3JJ?=
 =?utf-8?B?WjJpOURoTEpjL1l6UXZVNUZNTUNuaVQrOU5YaGdkNCs1RVU4RklTWUhMdnRK?=
 =?utf-8?B?dnRnK0p5VHpzYlU5MWNhSVpTUjVHYndXS215Y1pOZVR2em9JMTVjN3JJTUFV?=
 =?utf-8?B?U1dQUk9raHdRUXlZeWlvd3N5UTA0SHlsMHhBcm9jQnpoQ1dpMUFJWGZMSC9o?=
 =?utf-8?B?SnNuSXpkV3FrNjRZa1BXMUdkREVOKy92aTZadEkzS2FZVEZEQ2lvdW15OEd4?=
 =?utf-8?B?Q3NqZ3B2dzN0UllWTTgreXV1Tm9xNVlHMWY5bWtWbkEzZklwOC9zR3dFU3hr?=
 =?utf-8?B?N09wWmFJOG9GTTR6TWh1QXVUWFNrTUVGYWhoY0Vscjd6VzhxTUdPSnc3WHFt?=
 =?utf-8?B?MkQ4aWNGREVtaTlndXFZOHNuUmRnd25jVjBXWm96a0puWUpldTJrZ0tkVXRa?=
 =?utf-8?B?WG1Jck1jazQvYmhtQ2ZZNXVtcTVwa0dUUjJKeGFPVlJrYkJEaXdta1Fsc0pm?=
 =?utf-8?B?K3J3NFZ1cHdHaDJLdnpVV29lMnpYaitsZ2hRZnlnNW83QXFvTzllQ0RIUXpM?=
 =?utf-8?B?dExCb2dBNEJhNEROS295VGEvNFQ1aDEzMkJxWDN5U25MWU16RUJoNlBWdjRD?=
 =?utf-8?B?Q3M0QTlCVmJkN3FVS3J1K3lYakhKMWFRRElyRldHb2JYTDZwUk1vNTZpL1lV?=
 =?utf-8?B?ZXpqMDJhVnd1NVh4UG5zdUxmSkF6NWdmdy9yRTQxVHFyNUI2NVUxL1FMc0Qr?=
 =?utf-8?B?YXdaYm9RRVFNOWk2dmt3VW5yU2thODZyRW5kSlQzNUpmOXZWaHE3TjVYZFU1?=
 =?utf-8?B?MGtGNXpCUHhWdTdmVWRLeFBpVGliVTNDd3o3ZzRhTWpwQTF2aVdwOUFJOEJC?=
 =?utf-8?B?ays2UUFPNldUbFhMdWR6LzBwczlRQ1YvZTdiZkFQTFcxWW53ZFdSdmsyUzNC?=
 =?utf-8?B?ZGczcUJmMnExVmUzQ1A3QWpzekQvSnlOVlBiTDRjWndjWXJ1ZzRobWwycmVa?=
 =?utf-8?B?bjNRdUZnVjNOOUozMTltMGZmSFUrMi9INkM4MXZiekJQRTdYLzl1RzV6V1hk?=
 =?utf-8?B?SHpUVzQ0cEk0ZGNrcDdEay92d2ZtdWtwT1dPQkRpdW5ZRXozZW1BUXF0UzY0?=
 =?utf-8?B?OUpuNWY3UGdvL0NwN3U5WWY5Qi9pcUQvdEJrNzdOSlZSamVoYzViZHZXL0E0?=
 =?utf-8?B?Q3Q5QWh3OWUrSjVKQkR6T1E2bXdqM1VGV0s3YkpWU2pCekFkeGJBekRPTUxO?=
 =?utf-8?B?YWRBTXVhbGJBQnBwMUMxbGVkTnZIY2hjZHYxWmNVUTNLVGd2ZERhanZVODdY?=
 =?utf-8?B?N2tzdVVMWFF0aXVucENjY0E1YWx0bXI2c2o3TG5uZitNRFpsTkJwVW93RHBH?=
 =?utf-8?B?eHVhbVVncHl0bmptUzhPdi9aMEY5cm42d1hhZnFRWm5HMVVZa1lQUW42d1FW?=
 =?utf-8?B?c2ZlZ3J1b0tDelU0dmwwblpxT3ZOZXljbzkvTnJyYjB1V3NhU3BTUWZrVUIz?=
 =?utf-8?B?TFh1Y2RLcE5MUks3YmZnTnNMcldiSm8xSEd1ZFppSVVqbjJ1SkpkOHJ5aG1a?=
 =?utf-8?B?K1k5TVVFUjhJWHd0OVdTdW1pdTJTL2k5b1Z0RmY1QjFqVkYwVlpETklVM0tE?=
 =?utf-8?B?dkNuV0NLOHRPa1R6Ykw2TUxPL2RBNUgzckZuTWJENjIvREliWThOTVBTbm80?=
 =?utf-8?B?NE5ObjdQQm1GSlBDMnM3SXBqVUgzOFYrSVhBLzlJVjdtNUZlT24rRHpSdGR3?=
 =?utf-8?B?VmU2RWk5UjQ0TDlBemhyQTNuMUl1VktZbzNFL3hETUxuREYzelhsQkR6WXVD?=
 =?utf-8?B?ek9OZDU0K2t5WWx4aHU1RkFhZ2xUbUQxS29YVWV1czE5YWwvRm84Y2h4WFZG?=
 =?utf-8?B?K0c3MnJVdk5udHE2SUNBVGpCamJrR1ZhOG5KK3ZiZ0IxeEQ3dDdqYWkxdkdv?=
 =?utf-8?B?U3hYS2l4ZjQ4TlBXaVI2OXExNlZUYk9wdis2dHZ5R0Y1cDJ4ZnJPQWkxbDYx?=
 =?utf-8?Q?quSSvGoNKnaLN/bg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 595b8950-0ec8-4b5a-fc56-08da48db9a47
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2022 23:15:25.1355 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vosZ1s4aRrKRxhJPiPLv2h9/jUVe12sMjasb4odxWwA9me7PRR99DCOydvEi+2pR9klikDuuFP+9B9jRb2qLPI79u8Nau+iQExPShAcomvM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2543
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
Cc: intel-gfx@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org, Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/7/2022 15:29, Dixit, Ashutosh wrote:
> On Sat, 14 May 2022 23:05:06 -0700, Vinay Belgaumkar wrote:
>> SLPC min/max frequency updates require H2G calls. We are seeing
>> timeouts when GuC channel is backed up and it is unable to respond
>> in a timely fashion causing warnings and affecting CI.
>>
>> This is seen when waitboosting happens during a stress test.
>> this patch updates the waitboost path to use a non-blocking
>> H2G call instead, which returns as soon as the message is
>> successfully transmitted.
> Overall I think this patch is trying to paper over problems in the blocking
> H2G CT interface (specifically the 1 second timeout in
> wait_for_ct_request_update()). So I think we should address that problem in
> the interface directly rather than having each client (SLPC and any future
> client) work around the problem. Following points:
>
> 1. This patch seems to assume that it is 'ok' to ignore the return code
>     from FW for a waitboost request (arguing waitboost is best effort so
>     it's ok to 'fire and forget'). But the return code is still useful
>     e.g. in cases where we see performance issues and want to go back and
>     investigate if FW rejected any waitboost requests.
You still get errors reported in the GuC log. Indeed, some errors (or at 
least error reasons) are only visible in the log not in the return code.

>
> 2. We are already seeing that a 1 second timeout is not sufficient. So why
>     not simply increase that timeout?
>
> 3. In fact if we are saying that the CT interface is a "reliable" interface
>     (implying no message loss), to ensure reliability that timeout should
>     not simply be increased, it should be made "infinite" (in quotes).
>
> 4. Maybe it would have been best to not have a "blocking" H2G interface at
>     all (with the wait in wait_for_ct_request_update()). Just have an
>     asynchronous interface (which mirrors the actual interface between FW
>     and i915) in which clients register callbacks which are invoked when FW
>     responds. If this is too big a change we can probably continue with the
>     current blocking interface after increasing the timeout as mentioned
>     above.
>
> 5. Finally, the waitboost request is just the most likely to get stuck at
>     the back of a full CT queue since it happens during normal
>     operation. Actually any request, say one initiated from sysfs, can also
>     get similarly stuck at the back of a full queue. So any solution should
>     also address that situation (where the return code is needed and
>     similarly for a future client of the "blocking" (REQUEST/RESPONSE)
>     interface).
The blocking interface is only intended for init time operations, not 
runtime. Stuff where the operation is meant to be synchronous and the 
KMD should not proceed until it has an ack back from the GuC that the 
update has taken place. All runtime operations are expected to be 
asynchronous. If a response is required, then it should be sent via an 
async callback. E.g. context de-registration is a 'fire and forget' H2G 
call but gets a 'deregistration complete' G2H notification when it is 
safe for the KMD to free up the associated storage.

There is an 'errors only' H2G mechanism. That will not send an ack back 
in the case of a successful H2G but will send back an error notification 
in the case of a failure. All async H2Gs should really be using that 
mechanism. I think Michal W did post a patch for it and I was meant to 
be reviewing it but it dropped of my radar due to other higher priorities.

John.

>
> Thanks.
> --
> Ashutosh

