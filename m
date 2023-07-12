Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC5074FF73
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 08:36:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53A6D10E492;
	Wed, 12 Jul 2023 06:36:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20B1C10E492
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 06:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689143798; x=1720679798;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MIu35vB0HPgKSPmD8oTE0+3kINN68ayLQsy+Pbm+++U=;
 b=NQ73DpYCs4Z6Eq/I0uBLqu85b8jtlW2PsMPx+DN2WKOg4hsY4uWIMnDR
 OTeRspukCG3pHqjOVzB2VxS7dtmxvo66zrqo50UcfFS4h7CpC7c+PMd9U
 soaMo9qkKNlDMoDm3fd3F97emGXgpXqvUZF9eyXW1dRdx+xbuiaDHaXoK
 DDOUuQ2s+r0uBQIdWzQZJKZmyuYv5yWB2HsreibZi4KYWxvKm2bbmTU3X
 xzuSdWajE+8ZbuYD7y3Qf8iJ5Qcj6rT+qbznBNbYMl+nA2X6L04RNC1rb
 xxQVmjYR5eHL+jDIEA3TpiKWJ+lE8WzL1nxt7MGSsxCe/Js0hvQZv7Obs A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="428553120"
X-IronPort-AV: E=Sophos;i="6.01,198,1684825200"; d="scan'208";a="428553120"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 23:36:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="715442366"
X-IronPort-AV: E=Sophos;i="6.01,198,1684825200"; d="scan'208";a="715442366"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP; 11 Jul 2023 23:36:34 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 11 Jul 2023 23:36:33 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 11 Jul 2023 23:36:33 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 11 Jul 2023 23:36:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y6sdbCazlDH2rxzDhEJ7iIcfiPzmK/OHOSPR0dgH+rvc4zprAjuSHfzRC1U90H7cJfddmzZc0Z4D480DN+mnGcT12H0Gn+b4FUELL+I+F6bl2u7nTVLtvUTRouEM/oN3qff9rrIyWiI3EE1JI5ozplw69o7iyEeiI4lTpEzbjqmEnsSSmExw7j3EwDTRmWZJ98OspEDBnLYzAxYX+qOfkOJLhcRAA502emHiu0bo44pNB1y1FskqCW1VDj4PV95Zg+MqAQjVcClSUyJp8cmCNhO1c5knWoRGq3XaGug2jOTEMF+ejsYuYvcD65ok0rtLOQ+cy20UqUaQtaCJ5nl4nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BX/a1MuvKSaudkoMOEu3Jxdydf2s4K0TVFkbRyWw+lA=;
 b=ALxnVokM21XVDYyZCV3GsW7CVNaHMJGba86MJiBR6fl+BJQkAQmfqGGieuSkqgH2lehi3zJdYi+7lRCO5u7gCkhbYHkhvieRC0TO7uQ7U9mBOx1XVq5P6dUPh8o7JIZdKVytMtFMmZdgBvUUJ4zGaHOfu7dn+StRFr2PDriIndyNfxPAIRFWHI2qDIzK/sLeFqz30ddc2o2E9SA8D8UQ8rQCYhJeYDjySW/CePGzEDVSJUMaJeWtUhHHj/+E/ygMXneXrBnCmp5k9ZJ+UNeFufXE43SwC1V82447GJYRK/dScTQdNh7lc/g+cbxIpWhJCCZz6RXONTtNuuuqqb+ycQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4243.namprd11.prod.outlook.com (2603:10b6:a03:1c8::16)
 by DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Wed, 12 Jul
 2023 06:36:26 +0000
Received: from BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::74d2:5fa6:b6e5:7c63]) by BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::74d2:5fa6:b6e5:7c63%6]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 06:36:26 +0000
Message-ID: <528d0211-f73b-a674-be95-afdc518468fa@intel.com>
Date: Wed, 12 Jul 2023 08:36:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC v4 2/3] drm/ttm/tests: Add tests for ttm_device
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>
References: <cover.1689060814.git.karolina.stolarek@intel.com>
 <e5f75f4b093af650103efe3008f395c3dc7b505d.1689060814.git.karolina.stolarek@intel.com>
 <873d2643-db7d-bc80-b210-549355e8c7b0@amd.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <873d2643-db7d-bc80-b210-549355e8c7b0@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE0P281CA0030.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:14::17) To BY5PR11MB4243.namprd11.prod.outlook.com
 (2603:10b6:a03:1c8::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4243:EE_|DM4PR11MB6020:EE_
X-MS-Office365-Filtering-Correlation-Id: f4b7c2e2-4de3-4af1-a924-08db82a25173
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lN/7cR4Jjd8nEawJivHDYLlY2dAd6yukBomYH39kfysTcRNNkXfNsWVKuGlwHra22VVibjxzLXVP1ulP4vJRU+jAnJ4J+ku8b8c3jJresLXeSSBEe8SGsAwoSNG/uYn2OMjvXXHV8op77rq+tDwhyxmj5fhT864StWiYS33/Yyg40uKbfR77yxBHtqAz5pnQyYh1YLepylJGRjHQH5sxW9jqPBcSL22cvi1H5LYYvtMlNYhHNi9X06miilFG7PdZZCv7LpWj6AtTPuflNLFyvMRxwiNxzIkgaVrEy/xty+VJJIuss5IVkVThMc7iP5U6wG+2DsIxCGawJmhV9IKNc7akMupME7fqXkYPUpq2dOZwywLReygNpxm2mcxwiVW+RDy+z2xUCThpcpj7w/xw5Eh9p4wLbTrBeUGjUDWM6dCFGW3jx13D+aG8jGll7r43JoT+leRzBMsQ5+hZxbU+9FenL4SHk3Id8zK3UFvFBvIOvPnS9SgSr8albjmTepuqO+sRx062+C76EdJan+ciVOjrtpoaK4/Sx9F18NADyeJiMdZ2c9M0F3dmCISNVSvh76vucEzRd2V331QzBix4yUb01maOI5036hPNSDz2158H0t7eofYGdzIfpNrZXELRxDPIb3tegXEz7AaxIsNkbg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4243.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(376002)(366004)(136003)(39860400002)(451199021)(38100700002)(31696002)(86362001)(31686004)(82960400001)(36756003)(6666004)(36916002)(6486002)(54906003)(66946007)(2616005)(53546011)(186003)(6512007)(6506007)(44832011)(2906002)(5660300002)(66556008)(66476007)(478600001)(4326008)(8936002)(8676002)(66574015)(83380400001)(316002)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0pPTDBQM2RnaGNLaGhZUUowWldMZzU2Q2VveEpHdHBWZ0dNcDFyRDVWSlFC?=
 =?utf-8?B?cmJPUmcxdkpuVk85czhvUHNXb0VMN082bzVPWHlMYUtkYzByM05sajRCZzlI?=
 =?utf-8?B?aTBJUStZam5UbFZiNEFTV1dic1lFS1VoemcwakhMbWNzQWg1bEw0eDRrSGpI?=
 =?utf-8?B?TlRDem5uREpwVHhmMGg4M1FXTVFYMllJV0x0bUVCSDJjUVcvbCsxZ1BlQlpH?=
 =?utf-8?B?TXQ3RjBXc1JjVVpQL1Z4M2IrM3c5T1RXUnZPaEtEQlBMRlo1UzNqTXBkR1B6?=
 =?utf-8?B?bisybGcwakp3WGxZM3VHSU1HS3dIMnNrY2gzc1gwTW9acnFmbk5hd2h1UXBs?=
 =?utf-8?B?djlOOE9ZbElOTm5xbW5ZWGRlbERMY2JabFJIWWxvMWtzNHlTMFJ5c2NZWnBu?=
 =?utf-8?B?TXd3RVFYejRQZThmeVlwVXdYZVByTWhIdzMrM0tqdi96ZllpNmtFSmFYbzRw?=
 =?utf-8?B?MVdEMkRVNy80bXhOekczVjdMTXZpa2p3TmEvVjBveEFLUEtXcFd2a0NzZGps?=
 =?utf-8?B?azN0SjVHcC9Yc2NQbzJDNDJOaWpMRTFuMGlETmJxalo4b1RRRTBDMVMzRld0?=
 =?utf-8?B?bnZyS2hRaGNWb1B6NUIzbWI3UEVTVStaVitzRm1aajViMWU4YXdKSVJscTNk?=
 =?utf-8?B?NzVJVW80Q2lzbTFFckV1SUhwazdMaHZlVk15M0RsSjAyNnRrdURReEdkWk9Q?=
 =?utf-8?B?akRhWlY1NzhrUUtESmlaR0owdnZBQzU4emI1NzFvTEJXSUFPUXdNWU5KWG9i?=
 =?utf-8?B?RmlIK0xVeGlJd28vSnhrVmF2Q1ZhMkpWL2tQR05GMG1IVW5TVmFkTzg5ak9Z?=
 =?utf-8?B?Y2VReG8zbTFqVGJqbTIvVk9SMlY2M2lwMlFoNDZjZUhuaTRQbjBOM1g5MVJE?=
 =?utf-8?B?S2FvdEF6ck5DdUNDVENMVnpkeFpBcUpnanZXK0lnL0tHbWErVXdFVmNYQ21Z?=
 =?utf-8?B?Y1NGWklMNTNpd3FmUTVjdXl3ODgwT0FTby9GS0pWdlJ2YmNTVm5VY1N4dUNQ?=
 =?utf-8?B?bElFOFR1dnlsSCt0Z215VVNNQWJWalhKY3I4RXFhb2xKZEo5T3lQOExsT0RR?=
 =?utf-8?B?bzMwK1BCSEhjd1JWUzFURkw3cnMzaVU1S24zOC9CU2JJNjdndiszM052U21Z?=
 =?utf-8?B?azF3aGg5N1BhanAyZlpIZzh3Y2tSMVdBdDF4OFJTRkxxakxTL2Q3VklRaUlm?=
 =?utf-8?B?WWxYOTJYN011YllVcTBOTWIvRFVEenIrYUIvTVJJbGw4cWo1QklUdEtFU1Fl?=
 =?utf-8?B?NHYxUERSMkdKRXo2NTViZWo5SEFocHJSZnluN0V6dkFtelZVei93c1pseDRz?=
 =?utf-8?B?QWVpeWRyUzlWYktzRXhIaWlkQzJNam13OUVmdWtBOGl2M3pTa2dOWjFiMHM0?=
 =?utf-8?B?MUJLMjExNUxXZ0d3VkhwTFptUlRKditiMG95VzQ2NWNrUnUzbGl0VlBLTUJn?=
 =?utf-8?B?Z0FMTldPeTVOSkt0Y0hIbVg4UnBRaldReXd5VXU1WEdNeXlDYjMzT1hwNHZC?=
 =?utf-8?B?MHJVZldSUnVRRHUra0VjS1RvMFFhbGpNVldobGt6RzltTHJKWVR5bDZpbGwy?=
 =?utf-8?B?dXJUZDZXZE9sTFZVZ2U5SkRTTHJJem5udW1rQ3RHNFVHc3pDd2lUMUZvcXhY?=
 =?utf-8?B?bjlHTVFIeUlrQk1pbXV3UERkeHJEYS9MTDhLemF0eW1MMW1IZGkyOFNmY1JS?=
 =?utf-8?B?emd0SXk1d2Q2TEpHNHppcldtYm53bTROT1ZKWGlvMVMvWXpETVJtYlFFVnBZ?=
 =?utf-8?B?cEcyNk9GYTdTMHpjQWhSRDZFQ0ZHR09ZVVR6bWtaNHFmTHE3aldFUEdFNTkz?=
 =?utf-8?B?eWhvMVdvWUk0RnQrN2lMU3hOWEFaWHpCZ1NBSWNWTXlRNUZWcnJVOWpnVENr?=
 =?utf-8?B?QnFRWmhoN3NrQlh6UGFhaE1wVzFrczZlSlQ4ZnNIODRxWWpGSmtKL1pRL1BW?=
 =?utf-8?B?OHh4cWswaFlMbTFJK0svL0pkL2dLVXE5VlRsc1oxdkxIZXcxbXo5dlhTajd6?=
 =?utf-8?B?c2ZnNnM5L1VVT0hvQWZON054Y0FrT3BWQTFRdStJRUNzRVlCMUhRNzFNWHMz?=
 =?utf-8?B?a0ZmSkJONEREQlRRczZXVjZGenF5U2o4Zy9xMGJEM0pBWnVsR0Ruc0xSbmo2?=
 =?utf-8?B?M25ZeHFBQ01ib1VFMzFsWlJtS3BPRGNvaDVtWVMrTXlMM1R4WWxGek5BcTMx?=
 =?utf-8?B?LzFFTHZKVWJsR1hpaWtMU3FPbklzblZnUWtlVmxTQ1B3RkduUzlud2pxT1Vw?=
 =?utf-8?B?dVFtaXRGcEFhVHhOL3NRWHY0UkVnPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f4b7c2e2-4de3-4af1-a924-08db82a25173
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4243.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 06:36:26.7167 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QsAGbMcx51izrOhvmrNFQFcnMUAeTyLxAOpRKbDUpSa5N0cMx6OJF+gGUl7z+y6Rx5RVfCoc4X9zVFswbzB/nis4uQR1jl09kfGC5XI8Eag=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6020
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11.07.2023 14:45, Christian König wrote:
> 
> 
> Am 11.07.23 um 12:34 schrieb Karolina Stolarek:
>> Test initialization and cleanup of the ttm_device struct, including
>> some error paths. Verify the creation of page pools if use_dma_alloc
>> param is true.
>>
>> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
>> ---
>>   drivers/gpu/drm/ttm/tests/ttm_device_test.c | 159 ++++++++++++++++++++
>>   1 file changed, 159 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/ttm/tests/ttm_device_test.c 
>> b/drivers/gpu/drm/ttm/tests/ttm_device_test.c
>> index 76d927d07501..f8c867836acf 100644
>> --- a/drivers/gpu/drm/ttm/tests/ttm_device_test.c
>> +++ b/drivers/gpu/drm/ttm/tests/ttm_device_test.c
>> @@ -8,6 +8,13 @@
>>   #include "ttm_kunit_helpers.h"
>> +struct ttm_device_test_case {
>> +    const char *description;
>> +    bool use_dma_alloc;
>> +    bool use_dma32;
>> +    bool pools_init_expected;
>> +};
>> +
>>   static void ttm_device_init_basic(struct kunit *test)
>>   {
>>       struct ttm_test_devices *priv = test->priv;
>> @@ -37,8 +44,160 @@ static void ttm_device_init_basic(struct kunit *test)
>>       ttm_device_fini(ttm_dev);
>>   }
>> +static void ttm_device_init_multiple(struct kunit *test)
>> +{
>> +    struct ttm_test_devices *priv = test->priv;
>> +    struct ttm_device *ttm_devs;
>> +    unsigned int i, num_dev = 3;
>> +    int err;
>> +
>> +    ttm_devs = kunit_kcalloc(test, num_dev, sizeof(*ttm_devs), 
>> GFP_KERNEL);
>> +    KUNIT_ASSERT_NOT_NULL(test, ttm_devs);
>> +
>> +    for (i = 0; i < num_dev; i++) {
>> +        err = ttm_device_kunit_init(priv, &ttm_devs[i], false, false);
>> +        KUNIT_ASSERT_EQ(test, err, 0);
>> +
>> +        KUNIT_EXPECT_PTR_EQ(test, ttm_devs[i].dev_mapping,
>> +                    priv->drm->anon_inode->i_mapping);
>> +        KUNIT_ASSERT_NOT_NULL(test, ttm_devs[i].wq);
>> +        KUNIT_EXPECT_PTR_EQ(test, ttm_devs[i].funcs, &ttm_dev_funcs);
>> +        KUNIT_ASSERT_NOT_NULL(test, ttm_devs[i].man_drv[TTM_PL_SYSTEM]);
>> +    }
>> +
>> +    KUNIT_ASSERT_EQ(test, list_count_nodes(&ttm_devs[0].device_list), 
>> num_dev);
>> +
>> +    for (i = 0; i < num_dev; i++)
>> +        ttm_device_fini(&ttm_devs[i]);
>> +}
>> +
>> +static void ttm_device_fini_basic(struct kunit *test)
>> +{
>> +    struct ttm_test_devices *priv = test->priv;
>> +    struct ttm_device *ttm_dev;
>> +    struct ttm_resource_manager *man;
>> +    int err;
>> +
>> +    ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
>> +    KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
>> +
>> +    err = ttm_device_kunit_init(priv, ttm_dev, false, false);
>> +    KUNIT_ASSERT_EQ(test, err, 0);
>> +
>> +    man = ttm_manager_type(ttm_dev, TTM_PL_SYSTEM);
>> +    KUNIT_ASSERT_NOT_NULL(test, man);
>> +
>> +    ttm_device_fini(ttm_dev);
>> +
>> +    KUNIT_ASSERT_FALSE(test, man->use_type);
>> +    KUNIT_ASSERT_TRUE(test, list_empty(&man->lru[0]));
>> +    KUNIT_ASSERT_NULL(test, ttm_dev->man_drv[TTM_PL_SYSTEM]);
>> +}
>> +
>> +static void ttm_device_init_no_vma_man(struct kunit *test)
>> +{
>> +    struct ttm_test_devices *priv = test->priv;
>> +    struct drm_device *drm = priv->drm;
>> +    struct ttm_device *ttm_dev;
>> +    struct drm_vma_offset_manager *vma_man;
>> +    int err;
>> +
>> +    ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
>> +    KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
>> +
>> +    /* Let's pretend there's no VMA manager allocated */
>> +    vma_man = drm->vma_offset_manager;
>> +    drm->vma_offset_manager = NULL;
>> +
>> +    err = ttm_device_kunit_init(priv, ttm_dev, false, false);
>> +    KUNIT_EXPECT_EQ(test, err, -EINVAL);
>> +
>> +    /* Bring the manager back for a graceful cleanup */
>> +    drm->vma_offset_manager = vma_man;
>> +}
>> +
>> +static const struct ttm_device_test_case ttm_device_cases[] = {
>> +    {
>> +        .description = "No DMA allocations, no DMA32 required",
>> +        .use_dma_alloc = false,
>> +        .use_dma32 = false,
>> +        .pools_init_expected = false,
>> +    },
>> +    {
>> +        .description = "DMA allocations, DMA32 required",
>> +        .use_dma_alloc = true,
>> +        .use_dma32 = true,
>> +        .pools_init_expected = true,
>> +    },
>> +    {
>> +        .description = "No DMA allocations, DMA32 required",
>> +        .use_dma_alloc = false,
>> +        .use_dma32 = true,
>> +        .pools_init_expected = false,
>> +    },
>> +    {
>> +        .description = "DMA allocations, no DMA32 required",
>> +        .use_dma_alloc = true,
>> +        .use_dma32 = false,
>> +        .pools_init_expected = true,
>> +    },
>> +};
>> +
>> +static void ttm_device_case_desc(const struct ttm_device_test_case 
>> *t, char *desc)
>> +{
>> +    strscpy(desc, t->description, KUNIT_PARAM_DESC_SIZE);
>> +}
>> +
>> +KUNIT_ARRAY_PARAM(ttm_device, ttm_device_cases, ttm_device_case_desc);
>> +
>> +static void ttm_device_init_pools(struct kunit *test)
>> +{
>> +    struct ttm_test_devices *priv = test->priv;
>> +    const struct ttm_device_test_case *params = test->param_value;
>> +    struct ttm_device *ttm_dev;
>> +    struct ttm_pool *pool;
>> +    struct ttm_pool_type pt;
>> +    int err;
>> +
>> +    ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
>> +    KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
>> +
>> +    err = ttm_device_kunit_init(priv, ttm_dev,
>> +                    params->use_dma_alloc,
>> +                    params->use_dma32);
>> +    KUNIT_ASSERT_EQ(test, err, 0);
>> +
>> +    pool = &ttm_dev->pool;
>> +    KUNIT_ASSERT_NOT_NULL(test, pool);
>> +    KUNIT_EXPECT_PTR_EQ(test, pool->dev, priv->dev);
>> +    KUNIT_EXPECT_EQ(test, pool->use_dma_alloc, params->use_dma_alloc);
>> +    KUNIT_EXPECT_EQ(test, pool->use_dma32, params->use_dma32);
>> +
>> +    if (params->pools_init_expected) {
>> +        for (int i = 0; i < TTM_NUM_CACHING_TYPES; ++i) {
>> +            for (int j = 0; j <= MAX_ORDER; ++j) {
>> +                pt = pool->caching[i].orders[j];
>> +                KUNIT_EXPECT_PTR_EQ(test, pt.pool, pool);
>> +                KUNIT_EXPECT_EQ(test, pt.caching, i);
>> +                KUNIT_EXPECT_EQ(test, pt.order, j);
>> +
>> +                if (params->use_dma_alloc) {
>> +                    KUNIT_ASSERT_FALSE(test,
>> +                               list_empty(&pt.pages));
>> +                }
> 
> Please drop the extra {} here.

Right, will do that, thanks

> 
> Apart from that the patch is Reviewed-by: Christian König 
> <christian.koenig@amd.com>

Thanks a lot.

All the best,
Karolina

> 
> Regards,
> Christian.
> 
>> +            }
>> +        }
>> +    }
>> +
>> +    ttm_device_fini(ttm_dev);
>> +}
>> +
>>   static struct kunit_case ttm_device_test_cases[] = {
>>       KUNIT_CASE(ttm_device_init_basic),
>> +    KUNIT_CASE(ttm_device_init_multiple),
>> +    KUNIT_CASE(ttm_device_fini_basic),
>> +    KUNIT_CASE(ttm_device_init_no_vma_man),
>> +    KUNIT_CASE_PARAM(ttm_device_init_pools, ttm_device_gen_params),
>>       {}
>>   };
> 
