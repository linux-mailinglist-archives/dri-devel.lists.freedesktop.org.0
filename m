Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F984BA6B6
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 18:07:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 555C910E450;
	Thu, 17 Feb 2022 17:07:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A10E10E33A;
 Thu, 17 Feb 2022 17:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645117642; x=1676653642;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mnextbF7/6QIOciJgX+fSSrRLGrwScB5vymYROUkH5E=;
 b=HtNCf0xHDnd2P0aKV2iJ0UWIhhr3nwfZ/RfpMmiSqVQHqjpk7NjoYN1b
 SEDENNKo+pYfGH5Rw8l4RWrbLEoqSauiUeA7qz3FMqTfmxDQ+YIsiD+3m
 7xY9H8MbfMJPM5sYVN7xoKurg+zE+VTqf8EQQhtmuyVIUuOHumr1VxdrM
 w3xEOg/mk0usVGGpoEmwb4dnbWcTSVDWo6PxZw6K7GIou/9LRVdsrre0F
 VD5S4yHAqdQGhqhRCcuykSQl/9g3KFZLrImTBtSsAwaIyWlsdObZ28k/i
 vg7utn5aaeKdFEZsF80l7Zr82xzDGfKJSngJ4xGUUXHGChBkiPhE48nzj g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="314187475"
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="314187475"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 09:06:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="571904302"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP; 17 Feb 2022 09:06:54 -0800
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 17 Feb 2022 09:06:53 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 17 Feb 2022 09:06:53 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 17 Feb 2022 09:06:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a2K26nLe2x9S4tmFQvUY+AWlnI12F5PE9t9tOPP97tqhkY0xmXc/J13LKi7vBM1oy8zyqMS7YGMeFehuKHSOytutD/Z47uw5B3FDTSw9Kcj62RukSKE0hIyGgGEfm1RPMk0DOsUj1rtazKClaVx/fFT4m80RR048BbfyiaDModXhA4NQSTnhsdg3S4YL2F6J+2XLStustZOGZi3Lswz40habQIX9MR7MmcQWakUKmK7pmWqJaX7tqqAgZrUidMZJ+ynsaylkhe9XjikxPL3Sit4TXD77iq32sUNnOY1BWezfNXbwlztX6UFtoOimOm2/dYyvp3WBInAbucnY79HztA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KzMUKhwKDLY3VBD5jhz6KTMPqIVwnC6MDG9licbJysw=;
 b=cELSuTCV51kx2u1dmZCZDwJFV4nDU0c7h/3XiarE31pG2jTWhiPj9iuyxNQAwOAtsoXkBkxqkEEWQoRljdgsmHP+o1mblqBxN82bKZLLzEyT5QbYi41XkXwuOzAmoOrD0PQp49aWH8p40eiNFeXWR3OvJbiM8dM5gvxXbHpqBuYilW24VVrgpGQ46l3XS5debxUzSLKAY0yVK3xC6R2PRxrpQL+pBg/HbCALmKgNiiB7xwzxzpXyB427JPORuDAP8UjJES0psK38ygZnmnhqIfX2BaDd6ba7kFXWHCrq+OHSC16OxjrULdWtqKc/L+ROs3XGVScppvpequR0LBnlaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 MWHPR1101MB2191.namprd11.prod.outlook.com (2603:10b6:301:5a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.17; Thu, 17 Feb
 2022 17:06:50 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::8135:7799:cfe4:bbc8]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::8135:7799:cfe4:bbc8%7]) with mapi id 15.20.4975.019; Thu, 17 Feb 2022
 17:06:50 +0000
Message-ID: <58993df7-3c4a-c226-789d-2b99eaec4ae2@intel.com>
Date: Thu, 17 Feb 2022 09:06:46 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.1
Subject: Re: [PATCH v5 7/7] drm/i915/gt: Adding new sysfs frequency attributes
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20220217144158.21555-1-andi.shyti@linux.intel.com>
 <20220217144158.21555-8-andi.shyti@linux.intel.com>
 <Yg5tgepi3dkP6Y0M@intel.intel>
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <Yg5tgepi3dkP6Y0M@intel.intel>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0202.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::27) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eea8c412-78c7-43dc-0636-08d9f237e3a1
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2191:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <MWHPR1101MB21912530B155586CCE4E1EBE8C369@MWHPR1101MB2191.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CiVbArXYh7y9Spv6nWOznpETsplh6x2FmpO1hA6pxJnXhseAJWgBv7WmiVuLuUDkWpW2aRUK/+u7TMl5agSkSUDcdnCdjhgGwgYOwDBdYZOZ01rMc+oObcsiawZR9TW9OdJM/LseE3rxOYBbEl+HcLx9GgQmLJkJBLMwyeAsxnbpy+QihmtT6Wxf5yDdrTDkjpuDEbuksnaVeV8T90hsu1zrLLxUL4HVFTzuHJAgLYJd3Fbl8XB3NGxpBJ93RaEVYmAWw/PIp+yiySJ6DQu3E01h0iU2iDKRt/by5gJDro2RKNGWI/TExEpTAz6yBYxvQ61GPGmUIr+eFYMusVcNIj1RGc0p4ax5kcSdb1zp/2O4MHRlGNberZhFMHE1jaOKKKG7MShE64PGiRLm0MizBWjecYQ96+OAUDaYXaiI8f7M0q56X7uqC20jig319FBDBDhstx/GJszBR8R+CZs+xmJm6wqLAJbYdQDXpiT6HMD/CPJsG7xC9Yg8QfwpGeb5pIQUNIWZph4Qa2gRkKxxYORaaYwerTDfRFPOSGCdSCEKmAQlYM76Jcj8PRboCVB/SlP4/Ha4kZY5sJKjYbWlbaeQs2Y7VwnNcH+ZS3/O5Wgpe99fBKLz3JpjadMPMd9kguBCKb1/q+xR2gawyGvrjCdFutqeVYQK4NeOOl1CLYcUiZfQP6JZ5mJxGD26RonqolsY/6Q1+SG5uQgmvgT0xy0UDwLSJFH7zDAVroE81BeXTtMvfTWfazsXx2ZU4UEj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(54906003)(6666004)(316002)(53546011)(6512007)(2616005)(36756003)(6916009)(26005)(186003)(4326008)(8676002)(66946007)(66556008)(83380400001)(66476007)(31686004)(6506007)(508600001)(6486002)(31696002)(38100700002)(86362001)(82960400001)(8936002)(5660300002)(2906002)(43740500002)(45980500001)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGxoNVZWS0orOXJiU2NjZURobFRzYzY5d0hqTTRpR0ViWmFSSFJOVEVUVWVB?=
 =?utf-8?B?dmtVQkxpaFZTamZTcTg5aEdYUzhCUFlORElZRWJXb0hTekxBS1NUNGZVRDJO?=
 =?utf-8?B?MFEyU1l3bTgybWJZRE94clhyWDZyYklTamlCOFJlcndZa3E3dTliUk80clo0?=
 =?utf-8?B?YWlvNTRhNG1hQU54aVNwYzVWRVBGMDcyUGZZTjlsQVQwR1JsTnM4aHVtY2M0?=
 =?utf-8?B?SmdrYjM3d1NudlhldERNNmFGVUFaeEREamQ1UVMwUkhDM1ZadW0rYXpteWpr?=
 =?utf-8?B?VzFFTy9TUjh6dHFUUHd1V1hXTTJkd3NjNmhkUURkWmJvT0tHMTZVMDdnemRu?=
 =?utf-8?B?NmM1RHY1TmJ3QUN2ZmhNN0xoNC82Tk5WMmkzZGRnd0EyNGJnUXJuVFVra09y?=
 =?utf-8?B?T1lib1dWTGVrd2srazkrVnBrR0NlMTJ3S3pncEVIZXpESXJQVFdUSXNVbUU1?=
 =?utf-8?B?TSt3MUZuNHJNQmZHQ2VrUEF0TTBKa3kzRnZvbTMxYlN4Nkd1SVZaTmZpc3lk?=
 =?utf-8?B?aUsxWTl2c24wczhmN1d1Qmg4QWtGOWZVZXZjRTY2SENTS3BDQ1FHT0FBZUNh?=
 =?utf-8?B?VmVsNDc1SkJSME05Rk5Ed1dtMlhOMDFEd3F0VkJ2THhDSzlibU50TUo5aVhn?=
 =?utf-8?B?NHFNRndrL0ZKVUNFeVp1bmxScEsxL3VacFRQRjU5RCtaRitWWmhpdis3Y0JO?=
 =?utf-8?B?c2NWYmZBRnRNa21kd0t3RlZZbnMxWXN2YTA1dW0va3lGNThHQmpQaFExdkdM?=
 =?utf-8?B?ZW5COHpPbnJlSTl1ZDQya29URzArdXljRHhTWitQM3lhdmJPbUJyT1JqYmJC?=
 =?utf-8?B?bW4wbDBuaGc3NTFqTW1jUlE3OCsrVVBNU0s3OFYrS3BpVDBPNDc0UkR3MFF5?=
 =?utf-8?B?SDJ6ZExrTStjZ0g3c0RTanVVV0NUazRsRVZibm9BRDJnLzRSakc0Qys2R1RL?=
 =?utf-8?B?QUxlNVdQbXdLb0FjU2Fza0Y2a3NzbnJONlRYVHJ6SGZRUDlsZ1pyY1QzUmVR?=
 =?utf-8?B?TDBYenZldmdrZExpVTEvWDZoR29PU3FHUUF5WkZUT2hmeStSYjRPTEJWZkpJ?=
 =?utf-8?B?NUFRaFErcnFDWGU4Wm9yQ0FpNXBlQjR1biswczF5SWswYzNnSkVpSDY2MHFm?=
 =?utf-8?B?UGFnVGFwRTFJL2dwK0JXRkxHNWpUc054aksvZDd0QmVqcEZtaTY4aFV3VXhT?=
 =?utf-8?B?UXpnQmIwK1NwVDFTUU4zdFJzbkFMOUozZmVlRit0b2czSCt5RGs5YVZHZFNj?=
 =?utf-8?B?NVBDSkdCbDFjT29pOWNYbG5RYVpRRTBIazZVOEs5bThYdkNvYkpXOUlPWXRO?=
 =?utf-8?B?REM0WVQxNEtYNmJvYjRDZXp3dWtTU1hXWHdXVUppQUI0dHJUbHdxNG4yMUx6?=
 =?utf-8?B?azVyclMwdWg4eXp2NEkxaXBXSXhVT1g0bjVoOStlK0RvR1lTencvTzhjZHAv?=
 =?utf-8?B?VnBGdDBoeGhIeHlyTG5FcGJGSldadDUwYWgvdUdtLzY5bW8xN0FFai9NaitW?=
 =?utf-8?B?ZGVrL2pOTUc5TEExYzFDbVJvYjloUmx1QWtPTTloMVlnWVV5WlB4ZVl4ZE9t?=
 =?utf-8?B?YlhSeFB1WUw3bHlUR2c1d1NpTWx5MmYxN0hObWhBT21lOGxWdnY1U1ZTRGtU?=
 =?utf-8?B?d3J3SXFmaG9GclVjRGNEUXJsSURCZjRCTlU0Z3BGbWh2VGpKMEozcnJYRlU5?=
 =?utf-8?B?Zmk1NTBNMXI3dC9TVnRrK3JFVzBlckNuTThvM1RUMVN4VFZKSzFxei83dVE2?=
 =?utf-8?B?Y3JraHRINzFGeGxYa1FwTEVUVTZsRm1ROXVNUDVpblVqTzlsVGd6dXJ2VDhM?=
 =?utf-8?B?RGxocmtFSllHaHJ2Q3dQdzlnc3RZSitHbDhsZnhLTjBsSHo5RjA2QlNjTjBi?=
 =?utf-8?B?Znh6MitVTXJGR1RNbndDSEtaK2FyQTRXYVRQZHozQjRUbTVNMjAvdXUxdVJn?=
 =?utf-8?B?aUZ0S1RSWVczNDFDem1VMElUdlBzdUJZenp2dmYwRW1qeUxFcGVDWTB6Yitq?=
 =?utf-8?B?bG9IYWdTTDFsR3h5WFpDQTJNWGlyNnJHclFZSmlta05MRjJvaTJYaC9SaEk0?=
 =?utf-8?B?WWhaNGpEU1BWZkhUVk1MZVJrMHlNa0VrNGxGcVc3ZXltOW16a2VjVk5yaWN4?=
 =?utf-8?B?UFBWNVlnT2pwOG1iRXhZQkxyYkVtb3lJU3NEdFJBT1JsN3ZMekI5bHg4dmZQ?=
 =?utf-8?B?cFJCZjRyYXJsaDNwS2hFMHpNVXEzY0R0RjU5NTZYeElXS1lWTkNqR1MxWUFh?=
 =?utf-8?B?NnIwMGZ5SU1VVGdyUmZ3ZERMNUpBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eea8c412-78c7-43dc-0636-08d9f237e3a1
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 17:06:50.7614 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kI1wkn7UeyLajppwiIjV8vjKAvsjdwQLpbaazbjfRtwWHjsxonCjz+DW7Fi/x0onJOvrai3Ba+Vrc0VNEE7oOZXCEO1/HP0cnWLb1/cQJQY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2191
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
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi@etezian.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2/17/2022 7:45 AM, Andi Shyti wrote:
> Hi,
>
> I forgot to add some note to this patch...
>
> [...]
>
>> +static ssize_t throttle_reason_status_show(struct device *dev,
>> +					   struct device_attribute *attr,
>> +					   char *buff)
>> +{
>> +	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(dev, attr->attr.name);
>> +	struct intel_rps *rps = &gt->rps;
>> +	bool status = !!intel_rps_read_throttle_reason_status(rps);
> why are these boolean? Can't we send whatever we read from the
> register?
Didn't want to report out the register mask value since the sysfs is 
supposed to a 0/1 status.
>
> [...]
>
>> +#define GT0_PERF_LIMIT_REASONS		_MMIO(0x1381A8)
>> +#define   GT0_PERF_LIMIT_REASONS_MASK	0x00000de3
> This mask is really weird! Sujaritha, can you please explain it?
>
> It looks something like this,
>
>    REG_GENMASK(11, 6) | REG_GENMASK(2, 0)
>
> But I don't know if it improves any readability, in any case, the
> mask is not clear.

This is meant to be an overall status flag as a one stop shop check for 
any kind of throttling.

>
>> +#define   PROCHOT_MASK			BIT(1)
>> +#define   THERMAL_LIMIT_MASK		BIT(2)
>> +#define   RATL_MASK			BIT(6)
>> +#define   VR_THERMALERT_MASK		BIT(7)
>> +#define   VR_TDC_MASK			BIT(8)
>> +#define   POWER_LIMIT_4_MASK		BIT(9)
>> +#define   POWER_LIMIT_1_MASK		BIT(11)
>> +#define   POWER_LIMIT_2_MASK		BIT(12)
> I hope I got these right. Sujaritha, can you please check?
>
> Andi

Yes these are correct.

Thanks,

Suja

