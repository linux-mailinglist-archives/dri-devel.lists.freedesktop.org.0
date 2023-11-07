Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EF77E3803
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 10:43:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF81D10E4FD;
	Tue,  7 Nov 2023 09:43:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A012710E4FD
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 09:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699350205; x=1730886205;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JatNkRCmbda0BCtOfhG8gzA4lTV1B3PgKZduElp/Rmc=;
 b=jnfXhkUJfen3uwATp1hzKI1yYHKiJoDQNaoN6HcTxobktukExmbihAX0
 fTwo30djOsKsmEah/STJuRQxpyYgraHnBqGuUMiOHqppN1lgdVQhgM5xp
 EhQW/Lp751RwHLF0XnKXyIHPkkMX+D3jRKuAbEAP4z/6mabEkIG+Hir2V
 shPXKG4QUO402pQt+wH0zvrSrPD6txb+yt2Q2Hn2OLl+lrYvQJN6srtDH
 NpXkfuvw0dMeHbhMjoM2S2VDTz3taYwftD5m+LdQXCjpgFGLSUJA6NmOu
 q8jf7uVdamur8opRAicvxM44z5ZCZJ3AhrImKDwOOB3hQ4iZe0sEu0eAc g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="368805756"
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; d="scan'208";a="368805756"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 01:43:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="797623099"
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; d="scan'208";a="797623099"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2023 01:43:24 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 01:43:23 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 7 Nov 2023 01:43:23 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 7 Nov 2023 01:43:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jMArxnotcDGGtPtmjTAeOo5Ass/Ion8jwVmURFwKZWbCvM2u6afN97CgF7eHoMAFyXmlCq+djq7shmyUaeU8FjvKzJ0ZUxkaTuvDpnIow3SpSHG/MkgaX1b4JqA7HLW7BB/2hX0BYUKBXZy1tOA2gK/DM7WzbSHY0s6c4BL4YqbrhJbVLSJM+2d3km9SgU+aJChwBnKdo9P98WQkXBiqqIH7fDQS7Di4Ob9vYez1CuxEOzgwzfliwRAUCcIWrgtp6Oa72C8cncvvWp5JhVZ/O2anjKvQllY7Uo7ezCaGAttN06bLw1ET9BJn5BiRwYJpfP9aGfJdyABKrw3TRjGmDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UQXfaImjTAay7MUerMtmRFTM/vX08/oLJ2afefQN9kk=;
 b=GJM05ocfePhXh4bbyQTlWalW3t3RNBu7N/h0owWiFnUTwl3B+xk6nqOXF2MXc9o4otcQ6mFiqBeqeldzKn8rWh6clVoejSB8PRh8xS+ee/XoQ/zmsFTAn5iUw1T7AXV+sBBxUlzMlbeZwtpi2pWhhaCQohyq/QuMH+WO3Zea3he/VkECGZIlrwWGULym0CpOhXQnU9CWpwziWVnZjcVtwe4Q8nwt+Z0STfbZb/jEtsSt4J0PH3OOac9iWb8jflYuHtTP92oqW2nDO55BeYOOd6tx/QvwhcnnxajhwTBPl7iMaU/zcPeA1QdjNbQ/vnapMkJM0W14mFlsnZG2a6ANfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4243.namprd11.prod.outlook.com (2603:10b6:a03:1c8::16)
 by LV3PR11MB8579.namprd11.prod.outlook.com (2603:10b6:408:1b6::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Tue, 7 Nov
 2023 09:43:22 +0000
Received: from BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::7a89:778e:98ee:7cf7]) by BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::7a89:778e:98ee:7cf7%6]) with mapi id 15.20.6954.028; Tue, 7 Nov 2023
 09:43:22 +0000
Message-ID: <26151ebd-ef87-49e6-a1c0-a7952c303971@intel.com>
Date: Tue, 7 Nov 2023 10:43:18 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] drm/ttm/tests: Add tests for ttm_resource and
 ttm_sys_man
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <cover.1697445193.git.karolina.stolarek@intel.com>
 <eee845622930bbd02ded1b9c39531bfb86af690e.1697445193.git.karolina.stolarek@intel.com>
 <727ee5c8-f6ed-416c-8561-1c2eb43a7192@amd.com>
Content-Language: en-US
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <727ee5c8-f6ed-416c-8561-1c2eb43a7192@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0014.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::25) To BY5PR11MB4243.namprd11.prod.outlook.com
 (2603:10b6:a03:1c8::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4243:EE_|LV3PR11MB8579:EE_
X-MS-Office365-Filtering-Correlation-Id: 824eac72-6c08-4007-e74f-08dbdf75fac0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /U9tKM/whq+CU4GkdlpU8N5loVfGya6uWpmVdxDNs8Vjpo7YSseP0x09csUudrZFphb4By5R0QDOUdTu3j7uPyrI/jRBlc4OuHBL1KCsgVWm5RbaGDN1pzFXpmOavdGCnfcs7oHVQOmFXrnvq5OJ7R5qtRfxAwb+n919JEzSjlu8HkWjHxbaaYQGsFB6qhpnenSWP2x8xW+INfwXrP8+v3wLuijuGkTCcf2xN7veOZCWx5GyAjvBBOjd2vB8yYs6A3ENPmWimB+gBj3RQpyvhc2DzdumMjGGnek03KiAVAVPoz9FE+VAJ/pjvVdIiz+OlBrMGSVADOUXxGw7J801bMmE6iKHpL/GF/fJnhdQrGfoyOGNKyC/93iLl6s+HsFLHN12jBFc0Xywr42KmZcOtP7RIVaJQnB/xEzsX8pajKnv0qAOe/xE5gb83nAVadJLyZGEte5P7VXHBrmWp+nmg7OGoVRYK8+JzcDHA+Oc11pILxW28wDpA0jMpmM7Rwy2tTVnDNCMI1RfoWnmh/4Uki4amx1EJA01444AcK33Dhr4b3qsU1Gyg97RWJHivJjNxBmIlXguzyA627ZcIK2FqfZdxv9/iS8tzeBxgijCcj9ycftnsgLF2VzXMag1NQIWaEFHZujkoOSr9ilfmCPvBA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4243.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(396003)(376002)(346002)(136003)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(2906002)(38100700002)(31686004)(4326008)(8676002)(8936002)(41300700001)(5660300002)(86362001)(82960400001)(31696002)(44832011)(6512007)(2616005)(6916009)(316002)(66476007)(66556008)(66946007)(53546011)(36916002)(6506007)(6666004)(26005)(6486002)(478600001)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWdaS2tDdWsxYUg4L0JKdWNaNzFja21LdEkyYkUyWTdnUXJ2M0FSUU9JNUFN?=
 =?utf-8?B?d0dzUEc0cDQ4cHhKUllvTEUySzlXZWNqUVB6QWN0UEtRZWQzcjZNcmJGWXh0?=
 =?utf-8?B?OFkrRXVNSS9oOGo3SmlPNndBVEJJREMzMTk5VDdpeTQzRFRKVEtCWGxzZE1E?=
 =?utf-8?B?OFN1VGliUzdWWVRpSDRqR2RmWjc2d094Sjdoa1FsT285VDdxVXc3WmZDa3Uv?=
 =?utf-8?B?VEQ1eFhRYk42SzRnbU9mbUZOZjdBV2svTFhIdnk1RXBKTkFiVHhhT3RTZ05G?=
 =?utf-8?B?Q0tKUHZWaHpvVTNEL3VocFduUHA2YkNNQk9rY0RQb3puYXpCZTBDcE9xS1d1?=
 =?utf-8?B?WmREaUtHUW5zeWxQL0NGbVNaNVIxZ3NONDJXc053ZzAycGV5RFJHNGZ2T1I0?=
 =?utf-8?B?K3NVTUJ3NWVLZ0NQZTRKU3Qxa2x0cEh1Zm1JRUJyYm44dTB2ZXZGL1Y4L21M?=
 =?utf-8?B?NFBVdmFiVXFLWllCaTJhaFJrSzliSnJmOXk1aEp0S3dFTll6MXdGMU01clFC?=
 =?utf-8?B?UlY2cHgwRjVwRkZ1WTBUeDIrTjNkTVlrQWJGeFFySW11Qzg0TS9hbm8yODMz?=
 =?utf-8?B?R0tRbVhCTTZzT1VxR0Q0ejFjdS9nT3dNc0JEL1E3WEFJMFdyQm1KSnFsT3B6?=
 =?utf-8?B?UzNyTVFReVlHcXYxQXJOZ1pmV2lkUXFzVGVZdWZvbXF3L0Z0SHgwWEpEWVRp?=
 =?utf-8?B?S0N1bjRqN0tmRGtTclVIUFQxYzVZNDZOb1J4VWd2RXloRGxYVlZKcThTWmox?=
 =?utf-8?B?OGN3STFhektKclpzaWhFYkM2ZWVxU2RnY0ZPMWx3MjVoeUY4KzI4V2JacHJN?=
 =?utf-8?B?ZzVGQkcyK25Cc0ZZcWtLQjJiZXVHUU1adnBXWXhxcWQwY1d6RWFkS2ttTkJM?=
 =?utf-8?B?WDJNakpyWjIvaEVobGtWY1ZZMGFxYXdHemwzcGRsa2pFMU1jY3pLVGQvZGJn?=
 =?utf-8?B?Rm5RblJXMDYrN0V4VjdrRG9YRDYwSWhWQWU1L3cyOUZYYTZZWTF1Z0xDS3dD?=
 =?utf-8?B?N0V3LzNhQWhvajlSSEE1QXNhRzkrNG56a0JZN0NyeFI0Y0psdXk0RUFiRTJv?=
 =?utf-8?B?VWtsbzV3T2xQNGtzaUxUbUo0cnkrT0NJc3ZIVXVTb1poYlVnM0tRMmJoaU9E?=
 =?utf-8?B?Q203U2RiOFRndFprOWFEcHllWVBjY3ZZYTdiTHJDYVZnSSs1Ris3Q0hSVDZ1?=
 =?utf-8?B?OHJEUlROdXM5RkZETk5PM1h1RmJLY1dVOWJ6SDRXb293anZpL0RsMDR5QVFI?=
 =?utf-8?B?UDI3RTVXSHhZVVlTRWNCL3FxYi9vazJzRHpxS0dOOU5ob0ZYUERSdjB4TDRq?=
 =?utf-8?B?cW9WZCtLalNTMjc2MmtTK1NoZk12dUlmdWVsU3dLdUVUcXB1ZXQ5QWgrUmY0?=
 =?utf-8?B?VXFjbThtNnRsSmNhV2lRVnJacUtRTTNHRDFhTGQvTEN4NmdySGtucktwT25H?=
 =?utf-8?B?TVFRdkdSbWtjU2N2T1EvK2xHUTFaMXlXQXZGdnR4ZXhlempJYytRMGlLT1NE?=
 =?utf-8?B?d0NQbFVsR3JYMWNUdzBqTXRPZjF2Zk1zM0FqV1M3Tjl3VkVOYWZTeFczRUQ4?=
 =?utf-8?B?L3FkTCs0ckE0S2dWd3dySnBqaTZZbnBKSG1vSEpjV0wvL1RuNVVnanZiS0NQ?=
 =?utf-8?B?ektkUDJIcVY3U0pKRy9zOUZIY1pwbDRDZ3BVd2ZSZWNUaW11aUQxTzZzWk1k?=
 =?utf-8?B?aGp6SUoyN1VYbGJvRHZtU1BCWVgwbU9Qa0RMUXVvNEp6OTNLcUpMSkRTTWVY?=
 =?utf-8?B?aEdkQ1U2WXFEeUtzcmtmQUp1Zm1oS0k3TllGbmo1aERIQytLa1YwTk1EajVa?=
 =?utf-8?B?TnNFa2ZJMFI1Tmw5cjJaVE4rRDRZYVh6R2VzUWpka3hMMFFpUC9iMldtcjAz?=
 =?utf-8?B?ekFBazAvTHJBNk9ncGJLQWhFbllwR0ZCbEtrNzYrVDBURXlHampiUE0xdzNo?=
 =?utf-8?B?ZXpCRDNYSzFZQnprRWN3NXpYaDlzOGo2ZEVrMS9jSWo1YUhxUlQzRkRaakVX?=
 =?utf-8?B?Y2x6b3ViektublRiRjBVd1Urd1A1RVhJVFVISGZLT1Y2VlZZam5neUZTYk92?=
 =?utf-8?B?d3M1UUE4MnlqcURRNEg4WUdMSXVHZk9NOWRDQkFpcWdhTVd1ZFRYSTRHdmNv?=
 =?utf-8?B?OWFZUkhPV2psRHI5aExOT1V2QTJMdllsQUNudWJNR0ZEMUpIaWplZHpaM1dF?=
 =?utf-8?B?b2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 824eac72-6c08-4007-e74f-08dbdf75fac0
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4243.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 09:43:21.8378 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9NK2pE75EMfTbxGU1pOVIbJ0BKDNI28U3e4HkHviD/jOJkznM5Zyt5OTcyNwZjBKi7LWSTw3/ULllolz6wdbIT3A2iklLE0N2F2QImRyd3k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8579
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
Cc: Amaranath Somalapuram <Amaranath.Somalapuram@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7.11.2023 10:34, Christian König wrote:
> Am 16.10.23 um 10:52 schrieb Karolina Stolarek:
>> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c 
>> b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>> index 81661d8827aa..c605f010ea08 100644
>> --- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>> @@ -29,19 +29,42 @@ struct ttm_buffer_object *ttm_bo_kunit_init(struct 
>> kunit *test,
>>                           struct ttm_test_devices *devs,
>>                           size_t size)
>>   {
>> -    struct drm_gem_object gem_obj = { .size = size };
>> +    struct drm_gem_object gem_obj = { };
>>       struct ttm_buffer_object *bo;
>> +    int err;
>>       bo = kunit_kzalloc(test, sizeof(*bo), GFP_KERNEL);
>>       KUNIT_ASSERT_NOT_NULL(test, bo);
>>       bo->base = gem_obj;
>> +    err = drm_gem_object_init(devs->drm, &bo->base, size);
>> +    KUNIT_ASSERT_EQ(test, err, 0);
>> +
>>       bo->bdev = devs->ttm_dev;
>> +    kref_init(&bo->kref);
>>       return bo;
>>   }
>>   EXPORT_SYMBOL_GPL(ttm_bo_kunit_init);
>> +struct ttm_place *ttm_place_kunit_init(struct kunit *test,
>> +                       uint32_t mem_type, uint32_t flags,
>> +                       size_t size)
>> +{
>> +    struct ttm_place *place;
>> +
>> +    place = kunit_kzalloc(test, sizeof(*place), GFP_KERNEL);
>> +    KUNIT_ASSERT_NOT_NULL(test, place);
>> +
>> +    place->mem_type = mem_type;
>> +    place->flags = flags;
>> +    place->fpfn = size >> PAGE_SHIFT;
>> +    place->lpfn = place->fpfn + (size >> PAGE_SHIFT);
> 
> What should that be good for here? Just to test fpfn and lpfn 
> functionality?
> 
> If yes then I think that would be better in the test case and not the 
> helper.

OK, I'll move it to the test. And yes, that was my intention.

> Apart from that looks good of hand.

Thanks for taking a look!

All the best,
Karolina
