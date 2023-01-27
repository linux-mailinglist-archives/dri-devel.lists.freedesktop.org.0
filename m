Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 995C167DE00
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 07:51:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4873B10E128;
	Fri, 27 Jan 2023 06:51:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C296110E16F;
 Fri, 27 Jan 2023 06:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674802303; x=1706338303;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Txi2oGaw0AaQkD55ON331dnbJg+W++P5QxQDqIGZurU=;
 b=cXb9JyQCEvqnd0vgNExfWTw7uhV1YnBSGXvhMX1+1Ml8Nr1m4knSGk5Z
 KFbm0uyFxP33nXR/jCVAslgO51XiFLRtw9f3e1Pk8dETwYHYKtZ5yrkPq
 Uib9oIq9jqt4xC5E5F8cFAjwWGX6Eg4C9dn0+1zJVXLfb5vswqsZ66bGb
 bq70FJnZ6e6eKto5I49qsaBnIh33h/grBiiu0/SOALZ23nW4v12qAu9PP
 d9h+/LO9kaqBhWg0FTZEcu+o6VY2EZw4ABfHYn9qghpSZdjy9FdGcpTfq
 kGYYzkceWNqrqcjqT7clJHopq8CMfxr2xs9Pmdr7blc9KpbBwFqSWuaCE w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="314983471"
X-IronPort-AV: E=Sophos;i="5.97,250,1669104000"; d="scan'208";a="314983471"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2023 22:51:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="787126912"
X-IronPort-AV: E=Sophos;i="5.97,250,1669104000"; d="scan'208";a="787126912"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 26 Jan 2023 22:51:43 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 26 Jan 2023 22:51:42 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 26 Jan 2023 22:51:42 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.108)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 26 Jan 2023 22:51:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QN1sbwI3uEgJGEW5lUNNOInOsfqLSLSZio79J4HDXP61MCf2fw5dh/5Tqmitxx/xkWJlW2AGnSY9pRszeM1Y36Y5jlMkdAEVtz+x6VJHf+e74CuCtR8GpPdwiB6PsZ8mBHK7PlNe0Iu+w2UzVJtvT+RtmndcBXu8wamd9PvIDQeGSql+Rcqh2oQBBbgH7ECmENxyOpKSD4BHbF3t2/fcwFRWm4iubxqsWzj/05WKdXMknF+V+FFIu6ZLN57OKj8UCzJhuA6CWUmDbYuWzLm1b/UHjbMSwrQnOduvlDedQ2ukOHmZ4qqdBvW9Ed6rIjoK3UEkfrW7uw0yGpKQ4EkaPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EV+fs749YTGrwszMGsUCThHvZGZ3ECjI2u9JEPw1nhs=;
 b=ItxKZiyrUxtWGs4jDU59PNxVt7TIXdR3ckLNL7Ije79yibOLMSoXOZnBJ2luZkhj2pK2LGcG52vZXuA8EPJCzyBXOT1SE9COF2mliG9IOKEh0HvroYUpNeH6oXMSeLQf9DlYQ+lkhIWNU5ml005m1VnIXO6hvSntGE8G7PiL5v9mUfj1YWd5J6wIWq3xlphNhPPuFEs34Zdrl89RDVDu/sU41Tex0oBGkhlVk1XjY0c+/CVA3ZOfZkDGDHSj7st+CVOOo3NLnFdL9mR0P7aWlNS17Kv/Nv3wMSJWP4345rYzvzUNFBvOrIo9bsTW6xpXXNqc+MUD3C89fVDIKnpvSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5409.namprd11.prod.outlook.com (2603:10b6:610:d0::7)
 by SJ0PR11MB5216.namprd11.prod.outlook.com (2603:10b6:a03:2db::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.23; Fri, 27 Jan
 2023 06:51:35 +0000
Received: from CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::5d07:eb02:7913:fce2]) by CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::5d07:eb02:7913:fce2%9]) with mapi id 15.20.6043.023; Fri, 27 Jan 2023
 06:51:35 +0000
Message-ID: <b3d4b882-cb0b-a3c1-2609-6065f379ed15@intel.com>
Date: Fri, 27 Jan 2023 08:50:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] drm/i915/pcode: Wait 10 seconds for pcode to settle
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>
References: <20230111104447.338136-1-andi.shyti@linux.intel.com>
 <87a62pi501.fsf@intel.com> <Y77XmlzOCuOg8YVZ@ashyti-mobl2.lan>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <Y77XmlzOCuOg8YVZ@ashyti-mobl2.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0130.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::11) To CH0PR11MB5409.namprd11.prod.outlook.com
 (2603:10b6:610:d0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5409:EE_|SJ0PR11MB5216:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c5f2615-e0e1-429e-a3a9-08db0032ee15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SqVEZA3DePLj9oJyviwJgNB8SHAXVk0E3evHHPa7Ip3ycVBLvFl+1eHvhNH+jHSITeN06V6BMlgZdK4I4jriZ1dtbh16EnpRfVxt4t21wagd96PXbvBUQpCfvwB9d8RTJGTw0jna5FaJF48jIE8LbHN2FqR3wKjsa1pHIOf/cIlrchO829sqrh9Cq/QzNNzhE0s8cycagnMWn5q0eFn2nsvtnUQcIpFgW/69ZXVyP6MhwxJc2M3MWElH+OdxQMgtmsWHxK0H9vEp81q6XQIUoBQdtw6Ab2ZEB3tvpEGk1xFM824B2/WYmTtNlXhgBhbtuC44O6TRtbeM4CMTF64LzsTBBTQp6TGWKou5zwJyxr2ERFQQCHvCE4fcM2mPlaQOr7mOb1zUde757ymtwgQo8vcv0QPB7Jl1lAHIM7G4onCJn/GabgDz23UAxrRWvF7MUP9n/6NHdrjNzixSsA6ffNijcwBCc3fCfPPGKLhwkUdmbeaxHTn5feCJRYPFob/iGiqFLKvOnd/MlvuBAPxxV+0QglWPJHdpo+mU5iggYGEjVqxsASTIDHuxRhkz5L+pMHteXI3pc2s8gWaNWeesml3GmsT0xiUGVvurVvz4YZaCdmdJfMFnpi987IMTyZO1+PeaadA5ZCHNXbkYIcmIMhNxaimUT1pAeE/LEXBUjY2PVaPwmDSi3Yc0Kt1owsAymqWqcxHcRgA7ZJp3U/zfBxQsN7y9xJ8kX5JaxPDnPrB4xuF9c4k9RGpHxH2BO/aW1q0qJCb/NC8OB9aPq0j3uQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5409.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(136003)(39860400002)(366004)(376002)(346002)(451199018)(83380400001)(966005)(5660300002)(8936002)(6486002)(41300700001)(478600001)(82960400001)(31696002)(31686004)(36756003)(86362001)(38100700002)(2616005)(110136005)(54906003)(316002)(6666004)(66946007)(4326008)(8676002)(66476007)(66556008)(2906002)(6506007)(53546011)(6512007)(26005)(186003)(226643001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0xDWTFLeFplVHl6NG5tbEJ4cWNIRXluYWRzUW1ETG1kdXlFTGR6TDcrcThO?=
 =?utf-8?B?Wlkxa0Z4OGFOanVSWTNJVnhEMFA0RVRtOUt2UW9Mb2cyQWg1cjlxWHlDaXVl?=
 =?utf-8?B?M0x1aUN1M29vWVRLZVNuckJxcHhaQ0FRdXlocE1oWWY5TjY3Sm43dFRteUlJ?=
 =?utf-8?B?TlAwTFpua2FSMlVJRVU3VnlJVkZXaFVzTGRMdWN0VWN1LzFoVjE0QVkzRzBP?=
 =?utf-8?B?Y2x6SWZuYXZOQTRmZ1hEZHh2VnpVenNLWkg0YmpHSEptQ25JcVd3TlV0ajdi?=
 =?utf-8?B?QTFYZktiL3lSOWhSdlpITEhzZmZuKytJcFZEMVpwZ2lIaFZlNnJNblkyVXpK?=
 =?utf-8?B?aHpqaGFUK2ZtSkwxTGE2M1lmd3E2blVRMFJrc0g1V1BSR1BIN2UvTHlucVAz?=
 =?utf-8?B?bVJuWHZuM0NKczJ1bm5MQzlUelcxdVJqSnJlRWMzdmVqeUk2ck52azNlOFhs?=
 =?utf-8?B?b1N0c1hyRFczOTFpeVFPZnFtcUNJTVFiMGNLNkNYZlJ4YVlNSlpxOGJYSWtj?=
 =?utf-8?B?aWJDaFNWVjNqM2xLZVhWZDFnczY2R091dTMxNDlaSVFoZFFKbS84eVREdk9Q?=
 =?utf-8?B?Y3lwaVBPdlRpVDZwZWFCOXZUd0hSREp0NWtnWTE2VElsTFg0Z2pNTmxTeEls?=
 =?utf-8?B?eG5UaGZCTnQ5UkpWNUIxck1SV1pOU0Rad05EZkMvcUZIKy9WRHFUN2c2d09h?=
 =?utf-8?B?WDhXd3BNTXZ5b1JMM0lma3JMMW0xOGxzTXorajZtQW04WmZsNnp2dktxdXha?=
 =?utf-8?B?cVc3Vi8xcHJ3R0l2MEpMMVg1YjdkYVRFOEY0TXFtWGZ3a0lHeDk0RkJUd0RZ?=
 =?utf-8?B?MUR5akd5TkFPd3RXL0ZndHAwOXdzT0F1ZUk5NkdEQStxL0tjWG93RFRNazV4?=
 =?utf-8?B?UEFlVjVxWVNBa004VjZZNHN0ekdEWjZ2N2ZWWW1UQWxYazVtb2hueUMwQkoz?=
 =?utf-8?B?T1VGTkJTVXVmZ0FmQkc1N0Z1RW9MUExRMHVhRlAzUitBZWNlR2tjSkcvRzZ5?=
 =?utf-8?B?OU1uS2liL0xjME5VamlWa1FCVlRGWGh4TGhqMW10dFBzQnJ4WEpPaHFzcmRG?=
 =?utf-8?B?VFRrSGtlRzJqZWhTN3VWakJ4VUhEZ1Mvb0t1YU5IT2V2L0V1MEVZSXIvWkRo?=
 =?utf-8?B?eE92YjBKM0M1dUlSUHIrTFZ3N3dDMjkwMXRFZ0hKOWdJS3BldVd1cmYzdC9i?=
 =?utf-8?B?bkFjVHRpZHZWOUJXb2lvUmM3MnFLNVFYc1dSQVgyei9iZzNQM2RXNDZpWjM4?=
 =?utf-8?B?aytOc2hERlQyeko3YUdvR2JjdG41Y3IvWHhwYndkQ0dud0JabHAxaThPNUZ1?=
 =?utf-8?B?VC9DWnVGYVR4elk2dVpHWklYeTZ6Sm9DTHRhdFdpTHphb0xubjNjQkRlcm5T?=
 =?utf-8?B?U2M4TlRodzYveWJHczBGOWh5QXZuYzdnNndaa01lWWZCSjU3OHVyaHR2ZzRw?=
 =?utf-8?B?YnJCVVRHNDYzRjNMZVV3S3lMaW1JOE9ZUDVkeGoxeFlzQk5lVDZmRERxaktQ?=
 =?utf-8?B?cGFRdWs0T0JVQStjRlVTYlhRQjBkZ3lFVTVYYjRBSHNhbHFqR25VOFpKUmNK?=
 =?utf-8?B?dktQSzZVaURaZUhkMU92SVVCWjlUUm04Z3JKSG1PWTVhWHROR1BxMmlkSWRC?=
 =?utf-8?B?VDVLR01CWVkrMXZDRDluMnJBanJEL2VMaktyU2pwYTA5L2t0aVV6Rm1TV2hu?=
 =?utf-8?B?SjY4QzNZb2Uzak9OUmVaRllrakEyMUQvbnk5RENkS1Y1M0N5aTg4bUhwekh4?=
 =?utf-8?B?OG5JM3M1ZmJRRDcwaTFVMVc3NmtCWGY0a1RITzArd1FKRDZVczluMjkvSjc1?=
 =?utf-8?B?QVBadkwwTFRRdk9NcTcvbDk1UVhnSjdidEZCUWkzY0d3UE9KYVZ6aU40TTlJ?=
 =?utf-8?B?Tzl0RDZrczF6c3JqV1BqSGNsdGRQMUN3Y0YwbGlpdEFnT3BGcjNhNkFpWGd3?=
 =?utf-8?B?REhzUW41NjA2THZ3WEJnemdPR1Btbi8yZWkzTGwwclNKblFFbnVJTHkwWEpH?=
 =?utf-8?B?TUVIMHhuZmxEL0g2N2RoRnNwTTdjemNwbTNsQWFja1k0d3NhQjRGcmRlQUkz?=
 =?utf-8?B?ekR2UjNPcGxmcmZxSXhyL1RwdG1IS1g0bFpFaG5NSWxzcUV2a3l4UUpxKzRF?=
 =?utf-8?B?RktlUVNQaHFFVTZlWjF4MHVJL24yQzE0MG94MllNakorMldra2tJSnBNc3Z6?=
 =?utf-8?B?d0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c5f2615-e0e1-429e-a3a9-08db0032ee15
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5409.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 06:51:35.1753 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sahyx8Wxzwv3AzdLVTVy93xBgga1uvuEw5H+X7nHeEnox6eiQhqXq+mVUxK+/ADDnapQqv5E8xSL9foI4nmtqEajGfAfMSOtDA5oWsOLrS0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5216
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
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Andi Shyti <andi@etezian.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/11/23 5:36 PM, Andi Shyti wrote:
> On Wed, Jan 11, 2023 at 03:18:38PM +0200, Jani Nikula wrote:
>> On Wed, 11 Jan 2023, Andi Shyti <andi.shyti@linux.intel.com> wrote:
>>> From: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>>>
>>> During module load not all the punit transaction have completed
>>> and we might end up timing out, as shown by the following
>>> warning:
>>
>> Root cause?

Hi Andi, looking at the log where this problem is reported,

https://gitlab.freedesktop.org/drm/intel/-/issues/7814

https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_1294/bat-atsm-1/igt@i915_module_load@resize-bar.html#dmesg-warnings17324

<4> [268.276908] i915 0000:4d:00.0: drm_WARN_ON_ONCE(timeout_base_ms > 3)

In the code above, the call stack is output, and the return value of 
intel_pcode_init() returns -11 (-EAGAIN).

<3> [268.329058] i915 0000:4d:00.0: [drm] *ERROR* gt0: intel_pcode_init 
failed -11


If you simplify the function call flow, you can see it as below. (The 
call of _wait_for(COND, timeout_base_ms * 1000, 10, 10) in 
skl_pcode_request() is omitted)

-------------------------------------------------------------------------
intel_pcode_init()
  |
  +-> skl_pcode_request(uncore, DG1_PCODE_STATUS,
                        DG1_UNCORE_GET_INIT_STATUS,
                        DG1_UNCORE_INIT_STATUS_COMPLETE,
                        DG1_UNCORE_INIT_STATUS_COMPLETE, 180000);
        |
        +-> skl_pcode_try_request()
              |
              +->  *status = __snb_pcode_rw(uncore, mbox, &request, NULL,
                                            500, 0, true);

-------------------------------------------------------------------------
static int __snb_pcode_rw(struct intel_uncore *uncore, u32 mbox,
		          u32 *val, u32 *val1,
			  int fast_timeout_us, int slow_timeout_ms,
			  bool is_read)
{
...

	if (intel_uncore_read_fw(uncore, GEN6_PCODE_MAILBOX) & GEN6_PCODE_READY)
		return -EAGAIN;

	intel_uncore_write_fw(uncore, GEN6_PCODE_DATA, *val);
	intel_uncore_write_fw(uncore, GEN6_PCODE_DATA1, val1 ? *val1 : 0);
	intel_uncore_write_fw(uncore,
			      GEN6_PCODE_MAILBOX, GEN6_PCODE_READY | mbox);

	if (__intel_wait_for_register_fw(uncore,
					 GEN6_PCODE_MAILBOX,
					 GEN6_PCODE_READY, 0,
					 fast_timeout_us,
					 slow_timeout_ms,
					 &mbox))
		return -ETIMEDOUT;

...
}
-------------------------------------------------------------------------

The case where skl_pcode_request() returns -EAGAIN can be considered as 
the following scenario.
1. 1. When checking the GEN6_PCODE_MAILBOX register status before 
writing the value to the GEN6_PCODE_DATA register in __snb_pcode_rw(), 
it is always BUSY
2. _wait_for(COND, timeout_base_ms * 1000, 10, 10) of 
skl_pcode_request() returns -EAGAIN if the GEN6_PCODE_MAILBOX register 
indicates BUSY even after waiting 500us after writing a value to the 
GEN6_PCODE_DATA register in __snb_pcode_rw()

(Even if skl_pcode_request() gives a timeout of 180 seconds, the time 
used each time __snb_pcode_rw() is called is up to 500us. The rest of 
the time is used for sleep.)

In the situation where the problem is reported, it is not possible to 
confirm exactly which scenario code causes the problem with the current 
log information, and it seems that additional analysis is needed to 
confirm it.
If the hardware takes more than 500us to succeed after PCODE_MAILBOX 
write under certain circumstances, it is thought that the root problem 
causing the problem should be fixed.

br,
G.G.

>>
>>>
>>>     i915 0000:4d:00.0: drm_WARN_ON_ONCE(timeout_base_ms > 3)
>>>
>>> Wait 10 seconds for the punit to settle and complete any
>>> outstanding transactions upon module load.
>>>
>>> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/7814
>>>
>>
>> No blank lines between the tag lines please.
> 
> I don't consider "Closes:" to be a tag even if someone is using
> it as such. AFAIK is not mentioned it in any of the kernel docs
> (e.g. Documentation/process/maintainer-tip.rst).
> 
> Not to confuse it with a normal tag, I wanted to put it in
> parenthesis or rephrase it.
> 
>>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>>> Co-developed-by: Chris Wilson <chris@chris-wilson.co.uk>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/intel_pcode.c | 35 ++++++++++++++++++++++++++----
>>>   1 file changed, 31 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/intel_pcode.c b/drivers/gpu/drm/i915/intel_pcode.c
>>> index a234d9b4ed14..3db2ba439bb5 100644
>>> --- a/drivers/gpu/drm/i915/intel_pcode.c
>>> +++ b/drivers/gpu/drm/i915/intel_pcode.c
>>> @@ -204,15 +204,42 @@ int skl_pcode_request(struct intel_uncore *uncore, u32 mbox, u32 request,
>>>   #undef COND
>>>   }
>>>   
>>> +static int pcode_init_wait(struct intel_uncore *uncore, int timeout_ms)
>>> +{
>>> +	if (__intel_wait_for_register_fw(uncore,
>>> +					 GEN6_PCODE_MAILBOX,
>>> +					 GEN6_PCODE_READY, 0,
>>> +					 500, timeout_ms,
>>> +					 NULL))
>>> +		return -EPROBE_DEFER;
>>
>> This is already done within skl_pcode_request -> skl_pcode_try_request
>> -> __snb_pcode_rw path, with waits in skl_pcode_request.
> 
> the idea is to check for PCODE_READY even before checking if
> data are sent/received by pcode. And this is only during boot
> time. While skl_pcode_request is called in other contexts as
> well.
> 
> In other words here I want to start the communication when I
> already know that the punit is ready. Otherwise I would hit an
> -EAGAIN and fail.
> 
>> Is there anyone who still understands what's being waited for, where,
>> for how long, and why in the different code paths? I know I don't, and
>> this isn't helping.
> 
> I think it depends on hardware. There are some documents roaming
> around with some boot time and reset time calculation.
> 
>> There's also no explanation on the -EPROBE_DEFER return in the commit
>> message or comments or anywhere.
> 
> we haven't really failed, right? We just need some time for the
> punit to be ready and try to probe again (remember we are here in
> module probe).
> 
> Thanks for the review,
> Andi
> 
>> Again, root cause?
>>
>> BR,
>> Jani.
>>
>>
>>> +
>>> +	return skl_pcode_request(uncore,
>>> +				 DG1_PCODE_STATUS,
>>> +				 DG1_UNCORE_GET_INIT_STATUS,
>>> +				 DG1_UNCORE_INIT_STATUS_COMPLETE,
>>> +				 DG1_UNCORE_INIT_STATUS_COMPLETE, timeout_ms);
>>> +}
>>> +
>>>   int intel_pcode_init(struct intel_uncore *uncore)
>>>   {
>>> +	int err;
>>> +
>>>   	if (!IS_DGFX(uncore->i915))
>>>   		return 0;
>>>   
>>> -	return skl_pcode_request(uncore, DG1_PCODE_STATUS,
>>> -				 DG1_UNCORE_GET_INIT_STATUS,
>>> -				 DG1_UNCORE_INIT_STATUS_COMPLETE,
>>> -				 DG1_UNCORE_INIT_STATUS_COMPLETE, 180000);
>>> +	/*
>>> +	 * Wait 10 seconds so that the punit to settle and complete
>>> +	 * any outstanding transactions upon module load
>>> +	 */
>>> +	err = pcode_init_wait(uncore, 10000);
>>> +
>>> +	if (err) {
>>> +		drm_notice(&uncore->i915->drm,
>>> +			   "Waiting for HW initialisation...\n");
>>> +		err = pcode_init_wait(uncore, 180000);
>>> +	}
>>> +
>>> +	return err;
>>>   }
>>>   
>>>   int snb_pcode_read_p(struct intel_uncore *uncore, u32 mbcmd, u32 p1, u32 p2, u32 *val)
>>
>> -- 
>> Jani Nikula, Intel Open Source Graphics Center
