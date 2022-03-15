Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF894D9E8A
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 16:20:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 946AC10E3F8;
	Tue, 15 Mar 2022 15:20:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2065.outbound.protection.outlook.com [40.107.220.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7304210E3F8;
 Tue, 15 Mar 2022 15:20:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PMQXYr+AH4wIjHWk0iMDqkl7TTMJETA7F3Mvh9qLeZn5HrzePOFYj9EjVW7uKZxiTAiCjouio9q5twkP3VLEcB4fBzwWpGlRbwcpLu0FlwZF4JT7bRJKpNZPL7PFKWMHO4RHPc63Xvuffp81FCvimpkx+2svXExEZq/NBOfKv9CPx7ItStS64EhhR59+nYiM3AnUjbrNQUDdyCW5gSaX7oQ2EFj/jT8MOIzFDWM+ukA1vbbPX7e54NRK5CmHZYqdF3p+RyJxYy6OGj4+8+d5Pq61G+/oCp1UsEPtwV510EWFcLPIKmkzzGELac3CuXq4vXPi3cGzSKdMiXrPhRkd6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dsUc/K8E++MRe4QHLyIlFd3EunzTxiI5O7N4KGtwiec=;
 b=jzG4uJIOXYIRWup/Bk84htekbjPSRMPGk0wqy5wJnEQeChtmwNgN/gYpmFEb7aRvRvH6iWaMuMNhgTNqCiUom0FaATuxHojXuAmc6LZlpLV5vEfxClhg2rKFPgnVohL9mvBTWjcUmw89fusNkEAL5/CejV1b5ME4ltaY3TDNSzuo5cUeT4mc0I7RvmeC0VvLQOoMARgA+rb1k4hxKSln1m87aXl/t8v6/zer4jdQqergVbmBMfXB/Ux4DDiDTBxEAI7/D/lN4Xnk2mvfnjjkAeJARwtymg8ugEgTKahRZF2OS65sOrc141XdiTchok5p/u68x0maxvsqP3G5Mk8wXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dsUc/K8E++MRe4QHLyIlFd3EunzTxiI5O7N4KGtwiec=;
 b=PxDd5FmlTu2CKOq0hNirB04T3GUEYJk2vlFQLHijrSCrTGNK7igK4by7S4eYbngRJVjhz9aR6kNM581SWhFZL/amyc7zajH0nddLWruHvbyY7wHaDd0WgE5YZ6YqNtJpsYb/Iv6L7UxWJ297Yus9Dg2E425z3P/zIKtkwmWTMpE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by BYAPR12MB3159.namprd12.prod.outlook.com (2603:10b6:a03:134::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.26; Tue, 15 Mar
 2022 15:20:36 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::48e2:1306:25a3:5f14]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::48e2:1306:25a3:5f14%5]) with mapi id 15.20.5081.014; Tue, 15 Mar 2022
 15:20:35 +0000
Message-ID: <904ae9ed-8994-0b03-8904-02925e5b00dc@amd.com>
Date: Tue, 15 Mar 2022 21:01:16 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915: round_up the size to the alignment
 value
Content-Language: en-US
To: Matthew Auld <matthew.william.auld@gmail.com>
References: <20220314193206.534257-1-Arunpravin.PaneerSelvam@amd.com>
 <CAM0jSHPeRaykGwF-V+--cXE9wgoDbttbTH=EkP+=xHu7rkB4Qg@mail.gmail.com>
From: Arunpravin <arunpravin.paneerselvam@amd.com>
In-Reply-To: <CAM0jSHPeRaykGwF-V+--cXE9wgoDbttbTH=EkP+=xHu7rkB4Qg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1PR0101CA0036.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:1a::22) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 41e2d1ec-194e-41fc-5e65-08da06975a82
X-MS-TrafficTypeDiagnostic: BYAPR12MB3159:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB3159438B286416C2648D83D9E4109@BYAPR12MB3159.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xZyl4U/dBnTpDBfxjVEwCD3vGQsvrTIWYcKLPhrF8fXIIgs870n9s0pDC0v59rkTUkBxrYXmaHrupe3AUXXAQM0XhPSOvl3WzR3IEn/wRFboKSoxyCDnE/OZNyuANaiZtNaiBmyo6u2mV+OFEPGxHfYcImIoisfXI+MRfFyBD5DIXtG12xs7D/yQrItzBjWL7g1DT49NJIKlTskesHSwXZgxpefO/x10wV7lrwBiPwIIMNL1o9bfBKBKsxf/dzyCAdBieeY/aIo0QABY1pwnxnF/iDVyGeawn6dIaSTyC64geXGnyt5OXiEsqlAXTUhgP5Or0a4cNhX2MNa1y9gWqmpjI8sYfB4kPftlhZXK2BYH1FH+P2cQKQCnBw9cCRdk3G6f8hjR9BqhDqR6eMHt38ldKdWUiAZE4tRx6l6PAYIwiiVSisBfxJHGscptEaFfQi2DbW7iMGph9TPOo7RNxgnWS5bAWFjkWC8c+5VEn5v4oA5xFGAmg8Ge6eNFpUzI6DKWxdimbx6JaRjaVKAKTlLxnPgAqxd+r1dSZmBr05othEcEThkn7lBBWGpERVSdZ6jP2ZQri4u4216QDseCSl0ECFsjPWpM0ylyF7pqgLABnI4m52hnF1oZkfYbKnusw0can5EGAO66meDf55VeUG0WA25542EoMYzBymoxOCWWiAjGXiMoT8gtLzCmb4BHc5647ihhwnhkBdDqmS53H9FRT7XNUEyQXGa7S9GbHgY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6916009)(54906003)(316002)(2906002)(508600001)(66946007)(36756003)(8936002)(6486002)(66476007)(5660300002)(31696002)(38100700002)(8676002)(4326008)(66556008)(186003)(86362001)(6512007)(31686004)(6506007)(26005)(6666004)(2616005)(83380400001)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEFEaVNRT3UvSEdlcEdrYjJndzdUMmpOeUpvU1F5QmUvNGlsd1VHQ2dZWUVn?=
 =?utf-8?B?azlsa1VmRis3NlhjenZ4UDM0Mkxoa0lUSTUrNjNxV1ovMmdpc0lYc0N4ekVV?=
 =?utf-8?B?Z0pCeldCWnUxQ0d4UmpDTFhXcjg5RlgwM0VYMTNjZnFpczAweGo2TEtFUENu?=
 =?utf-8?B?VEo2N1JPaVdGVGhVSzRTUEt0T3R6Zk8rQTlRYUFOaWZ1QmorOTQ2OWhJL1pN?=
 =?utf-8?B?a2xvWFBMNUZCc3p6cGY4ZGtQMk5hbnQ4UEk4M1hvUEVXZE51dDZWbWhDOHd3?=
 =?utf-8?B?U09iOU51Yk0vdkpnWlJpc200azRMNmJYR0NzYVppdFRRMTgrQVdZRUVVWnRs?=
 =?utf-8?B?NEdrNEVQY0tWZU5IZG0zWk1VRmJmUGhTc21qMUE0NUV3ODFoQ0FwMmdPNElv?=
 =?utf-8?B?czk4ZXhQTTVmZlY5RkJjZ2JQME96WVo4TzRILzBNa1RhTkRIYzdVR1NDOUEr?=
 =?utf-8?B?L3lNUEZQQVA3ZC9UM1JWaXRzY2dycytOUU5IblB3UUFyZDJLVFRleHpYdUh1?=
 =?utf-8?B?N2hFVTZvRXd4b0JOS1VSMkVKczJta2dCUURGdEd5cmlKdVNyU3lGdUMxdEF0?=
 =?utf-8?B?K29EUVlweU0wOExaSGJlMkF0VDFsNXF2OG1zd29pc01MQVc2Nm1GVUdmd0hq?=
 =?utf-8?B?dTArak54aVdUN1RGbTNlNFpBV0w0ajZ6TC8yNkxJTElSZ0sxYVNYeElnNFkz?=
 =?utf-8?B?bS9QM2NYc1Yva08wcGpvSGZRQkcvdUhGQ1pFS1dWdy9XS2xxeCtZaUlqS2ZJ?=
 =?utf-8?B?OS9xUUhLV1dpdkdtc3d4eVFKM056cGI1UG56a1I4dkRCMDZRUlZTbE4wSE1p?=
 =?utf-8?B?YXp3cFcxSWdzSHZ4Q3l4QWt2WGVmS2ovRHBIaUJyRUZRUTBuNEg0WlA2NzRs?=
 =?utf-8?B?N0cwT3AvclJIemxyN2hGaWhXREZ2NVdZNzBpT2NrcG10MGZMaEdMREY2WW9v?=
 =?utf-8?B?a2pSNHNPdFJxN2FwTWllSHpyVWtEa1NrYUd5cDJzd3JlRGdxY2o2NVZMUUZW?=
 =?utf-8?B?N3BPcDY1TzhUSEc2TndvTk40cXo5K29WMWc5YlF6SVBaZWJnSlUxVU5XWDFJ?=
 =?utf-8?B?WWhHc1J4M0xMRStLdVFEYW9jSEZXaUhTUldGWmE2MFFYdFhiSkYrUFplaC9z?=
 =?utf-8?B?NHl3dnFVMkJicGs4c0NmVjU5bEZOWHN5QkU3Z2E3elN4UjQxQ01iaDU3MXkx?=
 =?utf-8?B?TnZCQkRzeFZZRGZGRnJoLzJqSTFselhJbXg5VlM0TDArTkpPWU1UZC9rV0dF?=
 =?utf-8?B?K1drRnY0Y0VXQUtGUHNFMXhvTnFNaWhFWlZ6QjRZSmJRdWFtVG9uQngvRm9W?=
 =?utf-8?B?NEp1dFpkZm13UXJOWXFWOXpURTRFcHkvYmVMYjZTVmdHZHpDK2xzZ25TQ0Rq?=
 =?utf-8?B?T1AvcHBRL2pFWkNiN1UyOTZKRVB6SnNYU0FVMjFOaE43TjErU2g0NEY5V0hm?=
 =?utf-8?B?ZzVVdFZYY0NMNmVJL2JrSUlCeXZHRGE2NEZObCtXRnZjTUpaR3dMQ1ZnYisv?=
 =?utf-8?B?UkxsNkhjV3owRU5mOGlHWHhaVkJDNTgwS3IwSWdnakY3OVZSSm5EVG56Ui9S?=
 =?utf-8?B?Sk5YUmtGbmRGTzdNZ0hESStlakcrbERNYnpDRnJ0VGdoNEkzZjhSS3FTTVVz?=
 =?utf-8?B?Q3N3N3UyRTI0TmZkaEFLTmhuS256eU1SVHZhTzJ1VlI5VngzV0FJamZNWUlZ?=
 =?utf-8?B?YkZtcmZDLzc1UncxbkJkelNOVUd0YkVnRVZYMW5RdmdpSEVWNmtmRHJlZFRE?=
 =?utf-8?B?anMra0hSeXBoVGN0NURKSnoxSERwQ1FEUWJlUTRsVlQremtLT0ZuNWgvckRr?=
 =?utf-8?B?VThVWUJGRGN6S29FMENUTTU5TWFpOVVYWUtXTE5JUDBDWlI2cVlJaVBKK2Ux?=
 =?utf-8?B?eTBSc0p2eHJTUEpBUkRXV2JnTUJod1ZndU03VWlGaER6aU4rL3lzV3ZoUzJP?=
 =?utf-8?Q?DYxVXR6EnaZ1/xeE4dBgsXyWkNbUC59i?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41e2d1ec-194e-41fc-5e65-08da06975a82
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2022 15:20:35.7948 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZVoaIG34EbY2fdC4tXjWbszVdNtmSoQ+WKr9l73iTCyBkbu7IzIHGi/3LFJZVftgImn/5XPmpUVf3ldDV0Fqbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3159
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, alexander.deucher@amd.com,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 15/03/22 4:56 pm, Matthew Auld wrote:
> On Mon, 14 Mar 2022 at 19:32, Arunpravin
> <Arunpravin.PaneerSelvam@amd.com> wrote:
>>
>> handle instances when size is not aligned with the min_page_size.
>> Unigine Heaven has allocation requests for example required pages
>> are 161 and alignment request is 128. To allocate the left over
>> 33 pages, continues the iteration to find the order value which
>> is 5 and 0 and when it compares with min_order = 7, triggers the
>> BUG_ON((order < min_order). To avoid this problem, round_up the
>> size to the alignment and enable the is_contiguous variable and
>> the block trimmed to the original size.
>>
>> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
>> ---
>>  drivers/gpu/drm/i915/i915_ttm_buddy_manager.c | 13 +++++++++++--
>>  1 file changed, 11 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
>> index 129f668f21ff..318aa731de5b 100644
>> --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
>> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
>> @@ -40,6 +40,7 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>>         struct i915_ttm_buddy_resource *bman_res;
>>         struct drm_buddy *mm = &bman->mm;
>>         unsigned long n_pages, lpfn;
>> +       bool is_contiguous = 0;
>>         u64 min_page_size;
>>         u64 size;
>>         int err;
>> @@ -48,6 +49,9 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>>         if (!lpfn)
>>                 lpfn = man->size;
>>
>> +       if (place->flags & TTM_PL_FLAG_CONTIGUOUS)
>> +               is_contiguous = 1;
>> +
>>         bman_res = kzalloc(sizeof(*bman_res), GFP_KERNEL);
>>         if (!bman_res)
>>                 return -ENOMEM;
>> @@ -71,7 +75,12 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>>
>>         GEM_BUG_ON(min_page_size < mm->chunk_size);
>>
>> -       if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
>> +       if (!is_contiguous && !IS_ALIGNED(size, min_page_size)) {
>> +               size = round_up(size, min_page_size);
>> +               is_contiguous = 1;
>> +       }
>> +
>> +       if (is_contiguous) {
> 
> This looks like it will also do roundup_power_of_two()? I assume we
> instead just want to feed the list_last_entry() block for trimming?
> 
> Anway, we should be able to just make this:
> 
> if (WARN_ON(!IS_ALIGNED(size, min_page_size))
>     return -EINVAL;
> 
> That's at least the currently expected behaviour in i915, just that we
> were previously not verifying it here.

ok sure, then I make changes in amdgpu
> 
>>                 unsigned long pages;
>>
>>                 size = roundup_pow_of_two(size);
>> @@ -106,7 +115,7 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>>         if (unlikely(err))
>>                 goto err_free_blocks;
>>
>> -       if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
>> +       if (is_contiguous) {
>>                 u64 original_size = (u64)bman_res->base.num_pages << PAGE_SHIFT;
>>
>>                 mutex_lock(&bman->lock);
>>
>> base-commit: b37605de46fef48555bf0cf463cccf355c51fac0
>> --
>> 2.25.1
>>
