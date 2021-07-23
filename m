Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFA73D42DF
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jul 2021 00:28:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48E9B6FD0F;
	Fri, 23 Jul 2021 22:28:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35A9C6FD0B;
 Fri, 23 Jul 2021 22:28:43 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10054"; a="199221057"
X-IronPort-AV: E=Sophos;i="5.84,265,1620716400"; d="scan'208";a="199221057"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2021 15:28:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,265,1620716400"; d="scan'208";a="663435359"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by fmsmga005.fm.intel.com with ESMTP; 23 Jul 2021 15:28:41 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 23 Jul 2021 15:28:41 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 23 Jul 2021 15:28:40 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Fri, 23 Jul 2021 15:28:40 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Fri, 23 Jul 2021 15:28:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K1WLmJPbPxkBs5bPtrh7IbJHWNQ8HASYTI5Dp4pYFUG7DcaYsDaJWR+mmZxT4iGwzS3kUXsm/AiuNCA3M62CQR+pCazpvYXLvCEor8gc14O/pjGrmk8BhgYYITummW/z8I0xt+5CkacCnvz7rWk9j4A/qv7QKbvu9Yqocu5wcsNTvLSf0LEW2jtqbrtcnH1I3isEKpPJq/ixIcBTqlj+8gC1GwDxr2ohQEVvXwOvfCyM4G6/bP8WwGCAWTgWhwamhV5hrIw8z6Ii02JnHD39KC/o3AxiitBDYLmLH5wJ5N7u2muLC0DkIOJZm8tTcQJvBXsuhiTnDMfdRNNYdWjsiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+p4s3F7cem7aQ01sIOFf+fuXjyHWv5qXHIZ19HOR590=;
 b=BLm+E4EZlSvAxwN8CY8D5YCDdFNgnnpi5aAO0B9bv8HxhqLRBkIapjmPkOJcGgoa8BiU/vbA5GWWzooEpeBF+SrN1Fcm7gwXj83dP6V0ukvBjn8i5x83wc4oBUo6snhksmg+l/zWtL7lIPdrxwp7DkmuqCaeXt5bm8lfc8x7WhR7XmlNB20ls6hCH03Jil+SC8iR+/vsIpIUkX0T7aJhwX+bAZ8sAlt7aH8aNXlWATeX4VwcvjOAoKFjlqiiCb8BYNCnyZZ6LH85Tfx6HoOdEaum8yQwdwVx+DOdoFAEhdgaWWIsAJqXMflkm0vkLHwi4Kn2a18j13vJUSPVjqZzPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+p4s3F7cem7aQ01sIOFf+fuXjyHWv5qXHIZ19HOR590=;
 b=roaspLIbPXFF3n6vO10OK6JZz4N8txRza0VVHxRCGOQQByhi6i1xP94aQxjkslKsnHZ9XeYYWBp2cstKqmmMkH9qBHRdXMIYC+56q3dTdSeKMNpJHa/muBA+peRJjDAJNj2FU4Yi+wcCNVkUxq7zWXR1G3JLkODlNqXWR9eDAeM=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
Received: from CO6PR11MB5634.namprd11.prod.outlook.com (2603:10b6:5:35d::20)
 by CO6PR11MB5585.namprd11.prod.outlook.com (2603:10b6:5:356::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Fri, 23 Jul
 2021 22:28:34 +0000
Received: from CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4]) by CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4%9]) with mapi id 15.20.4352.029; Fri, 23 Jul 2021
 22:28:34 +0000
Subject: Re: [PATCH 12/14] drm/i915/guc/slpc: Sysfs hooks for SLPC
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210721161120.24610-1-vinay.belgaumkar@intel.com>
 <20210721161120.24610-13-vinay.belgaumkar@intel.com>
 <c8b72a61-61a2-a32e-1842-6d296154733d@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Message-ID: <3af453f6-c549-7101-05fd-6adca8b2e045@intel.com>
Date: Fri, 23 Jul 2021 15:28:30 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <c8b72a61-61a2-a32e-1842-6d296154733d@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0116.namprd05.prod.outlook.com
 (2603:10b6:a03:334::31) To CO6PR11MB5634.namprd11.prod.outlook.com
 (2603:10b6:5:35d::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.71] (99.88.121.38) by
 SJ0PR05CA0116.namprd05.prod.outlook.com (2603:10b6:a03:334::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.7 via Frontend
 Transport; Fri, 23 Jul 2021 22:28:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7eb332fa-f5ca-4fb5-c877-08d94e2934e9
X-MS-TrafficTypeDiagnostic: CO6PR11MB5585:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR11MB55851DBD9D1120652DFED19285E59@CO6PR11MB5585.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OsTif6z0lxK3N6Pxyv8vK73YI7aG0Xw9iwF+DuYKJnREgCSM1/h9gZwaaTXsjaqQ7nEN/s1FJJXKAqGM+214HLfSdgpR8EOyIZBESLzeVbbEas1Yf68Gk2oh3rUjXevKV3KYPUPaDRBFs6pgqCkrwKSGO4pT28QfMvZ+vzFl5HeW4H8ybYY/2F9slh+/GPGjyCVjlXpy7i0aDuRt+Xo1ad6Y5l/pZBySSiOYWwPlHnoNEBeWwCe9Dc59sOzhQGEibtF0AO0F5ncwHRiWrMlSqJLg0r+QUPElsoHTmhoM8gjR+ORJUAbGov0IpMY8P7sKnfU0RYZS4ZU3RY1uhoXuPSK1ZBNRD0JMKHDbIbRJbgQN1J+Yl7YcVtY1F1apXRXAaSx7abGraLWHixHCTLSWydacGPQ2Vz/7ndBwzJnK0uTU1HmEKuFBwtCZsZrFkjxd+I5FybFQDgG8HRxEAu6l7IMwbcKS/W7pEBPpuJTHfQuyOkI4WfJdYEyiFHY/kS5SrL2SFDsM2sQ/n2KQVfJv5qEwXcETTJ22vSgYsHRmJNTiCPcjHrUivECxdKJOpxXY5YpJQSINgiGzn8RhTwVGO4WCzLpE2cae5vyh6JZYz9PT8cyXmmY9uKliFyFSuP/jRCrbeAqUlzg1qwQUevUp7g4ihMrw0F/NqoEYROWLV05V/F2MuIZyjaYCIJYgbp1tdHVlSjbuMzAhP27OXy5OC93pdq4yYzOqI0wy1Qs8jqw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5634.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(366004)(396003)(39860400002)(376002)(53546011)(16576012)(66946007)(8936002)(26005)(2906002)(4326008)(83380400001)(86362001)(38100700002)(316002)(66556008)(186003)(478600001)(956004)(31696002)(36756003)(31686004)(5660300002)(6486002)(2616005)(8676002)(66476007)(30864003)(54906003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzAwNXJnWHhqdE4rTFZOei9SZ0IrUU0vT2tYaUdRSk4ybitlZDBiTXJyVnFk?=
 =?utf-8?B?VkhsU09ncmh3bjVtbklrcVAyK25xQUtlTGxDWFNaQ3ZLN1pSTjhYN2RleUUx?=
 =?utf-8?B?RDIzM1lLK2FVdjlWcktWbjlnam84RWJuaEY3YmwvVnhHZEovZTlXNWUvdFd5?=
 =?utf-8?B?VkdoWWJ1Y2pTblhidDgwcjlXK3JiWlpkTFRPVkg1cHRqWUpZR2d6VHpuc3Nx?=
 =?utf-8?B?R1hUcHNHdEQzM1F6dURkS2FDSkY3SnhuNTdickxBSlY1UWpSbHBBTzhadlR2?=
 =?utf-8?B?THFGeFdjQ2VNbHNtQnVGU1FmN3VZanJwUC80bGVoNG9OV2NoNm84MHRXZ2tl?=
 =?utf-8?B?VUxnc1YxUi9MT2Z3eDBpa1dSVU9xNk8zMmxBV29EcDFBRVdHOTlQV1JUVm8r?=
 =?utf-8?B?c01pZFQ5NjhMYzFWN1VyaitUNlMxNm80WE5QKzZmT255bjQ0VE01K3BESjJI?=
 =?utf-8?B?emtmVUxKSEt1VG1xbmF2cGhvMUowUmVpY2F2c0FoSSs1aTBZTTc5cHdtSndB?=
 =?utf-8?B?Wi9ZRXVOYmdCelAraStMNG9lYjFXcWhIeC82ZHJtdG1qaEhNNFNFUFR1WjFI?=
 =?utf-8?B?S0VNWVhlVzlqdUZmQVlqcTNPWUdEalI3NU5TU3pYZ1JkVG9CWEs0VUZ0TGNj?=
 =?utf-8?B?dDhqYzN0ZjBjbUY2WXluS2J3aXBCWXhRUHRzQmlDUDlNVDh1R0J6Qnk1U1N6?=
 =?utf-8?B?b01GYm1MYzJuWExpOXZwblhINHVKZ2JFK3dZOEhtakUxRlU2QjAxSFJsTUhX?=
 =?utf-8?B?N3A0QkRaYXNSOFlRL29TZDZTbWxLRGxjdVZRVmRJODY4ZG9UOVE4N1RKajFI?=
 =?utf-8?B?MnN0VUFVL09MMHlLZGpoYnp2THpCOFRId0Q0ZUpZYm0yZEpBWTFrWlFhY3Nz?=
 =?utf-8?B?MEdDT3kyK3N1KzN1QUxOR3lTbytCb0k1R1BGblpLZ2kzRmxuZU9LaDl3cVN5?=
 =?utf-8?B?d0t6MkZCZGE0MnQ1bjVqb0RYY2lpZEx5ZXV1M1Y3c0kzWWF0VzQvZnB0OUZH?=
 =?utf-8?B?ZTVwSUVCNGJxdmdzQVVNM1dmZVBGMkw1MDFValFya1p5UDRJZ3ExN1YvV2lq?=
 =?utf-8?B?bWZ6Z24ydTcyMlo5UDRoeVJERmVBcTQ5SjZ0NjI0R3FWSmVCSHNYWkFHVG80?=
 =?utf-8?B?UnZYZjFVeXVHWG42cCtCdlJWOUJxbXp4blJyK3ZicXZhZWFseE5lWGZmOHU4?=
 =?utf-8?B?RFIzZXUzL1VnZTB5ZkJweXpUT3IvbVZRZllYTURkd0hrK2tOWWx2d3V0b3VB?=
 =?utf-8?B?a0ZwMnRjMkpJZmtTVGdwMEh6ZVlheC8yVHVHR0NHb2pnaXdGTk5xMUxQbExX?=
 =?utf-8?B?eE5landVM2VhMFhNL05QUVdPSnBCWEtCUXdjR0VETzgxSlUxejZMeTRDZVFG?=
 =?utf-8?B?T2xLWklKUmxnakFtNWhnOVBRNXBCVFNWc2wxNTJrN3VnWENuc214L1hwVEZZ?=
 =?utf-8?B?VG9DU0pLZ2hkbXZ3VjBYRnZIUXIzbTZISlNhRngyMnZ3WTlaMWdURk9TcVhj?=
 =?utf-8?B?WHBsR3ZleEtKbVRBUkhEMUNqWlZYb051ZjRRamkwUGZxTUZiYkVQdFdKVWhR?=
 =?utf-8?B?OWduVDNaUEl3T0g4cDhsZEJ2N2lBUmx6ZlA2UkQvR1V1b3IraExZbFcybTZN?=
 =?utf-8?B?aFJhZVJHNEFyOHNSV3BpdXJwNm9jL3NIenVSMTU3bmJXL0FxMituYktjV05q?=
 =?utf-8?B?eHc2dkNpTjhoSGRvdkJKNTVORFhCZ3JvSGl0UHVmOURsbTd6Ly9CWnhlb2c3?=
 =?utf-8?Q?o3y0mq4w6dMtoUsxg8Tbm4FSWLr4yvD9wPYtgF4?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eb332fa-f5ca-4fb5-c877-08d94e2934e9
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5634.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2021 22:28:33.9580 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YYXUgeLDHlzuVk/vJYTW6Y8TJyITwT8pcJ0NxC9znNNLqZaaNn98IniLV/CTZu/lmSzoLR2tugqLC8v7Gd+33JYsct5rJ/H8YRBr8EuehW0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5585
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/21/2021 11:13 AM, Michal Wajdeczko wrote:
> 
> 
> On 21.07.2021 18:11, Vinay Belgaumkar wrote:
>> Update the get/set min/max freq hooks to work for
>> SLPC case as well. Consolidate helpers for requested/min/max
>> frequency get/set to intel_rps where the proper action can
>> be taken depending on whether slpc is enabled.
> 
> s/slpc/SLPC

ok.

> 
>>
>> v2: Add wrappers for getting rp0/1/n frequencies, update
>> softlimits in set min/max slpc functions. Also check for
>> boundary conditions before setting them.
>>
>> v3: Address review comments (Michal W)
>>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_rps.c         | 165 ++++++++++++++++++++
>>   drivers/gpu/drm/i915/gt/intel_rps.h         |  11 ++
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c |  14 ++
>>   drivers/gpu/drm/i915/i915_pmu.c             |   2 +-
>>   drivers/gpu/drm/i915/i915_reg.h             |   2 +
>>   drivers/gpu/drm/i915/i915_sysfs.c           |  77 ++-------
>>   6 files changed, 207 insertions(+), 64 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
>> index e858eeb2c59d..48d4147165a9 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
>> @@ -37,6 +37,13 @@ static struct intel_uncore *rps_to_uncore(struct intel_rps *rps)
>>   	return rps_to_gt(rps)->uncore;
>>   }
>>   
>> +static struct intel_guc_slpc *rps_to_slpc(struct intel_rps *rps)
>> +{
>> +	struct intel_gt *gt = rps_to_gt(rps);
>> +
>> +	return &gt->uc.guc.slpc;
>> +}
>> +
>>   static bool rps_uses_slpc(struct intel_rps *rps)
>>   {
>>   	struct intel_gt *gt = rps_to_gt(rps);
>> @@ -1960,6 +1967,164 @@ u32 intel_rps_read_actual_frequency(struct intel_rps *rps)
>>   	return freq;
>>   }
>>   
>> +u32 intel_rps_read_punit_req(struct intel_rps *rps)
>> +{
>> +	struct intel_uncore *uncore = rps_to_uncore(rps);
>> +
>> +	return intel_uncore_read(uncore, GEN6_RPNSWREQ);
>> +}
>> +
>> +u32 intel_rps_get_req(struct intel_rps *rps, u32 pureq)
>> +{
>> +	u32 req = pureq >> GEN9_SW_REQ_UNSLICE_RATIO_SHIFT;
>> +
>> +	return req;
>> +}
>> +
>> +u32 intel_rps_read_punit_req_frequency(struct intel_rps *rps)
>> +{
>> +	u32 freq = intel_rps_get_req(rps, intel_rps_read_punit_req(rps));
>> +
>> +	return intel_gpu_freq(rps, freq);
>> +}
>> +
>> +u32 intel_rps_get_requested_frequency(struct intel_rps *rps)
>> +{
>> +	if (rps_uses_slpc(rps))
>> +		return intel_rps_read_punit_req_frequency(rps);
>> +	else
>> +		return intel_gpu_freq(rps, rps->cur_freq);
>> +}
>> +
>> +u32 intel_rps_get_max_frequency(struct intel_rps *rps)
>> +{
>> +	struct intel_guc_slpc *slpc = rps_to_slpc(rps);
>> +
>> +	if (rps_uses_slpc(rps))
>> +		return slpc->max_freq_softlimit;
>> +	else
>> +		return intel_gpu_freq(rps, rps->max_freq_softlimit);
>> +}
>> +
>> +u32 intel_rps_get_rp0_frequency(struct intel_rps *rps)
>> +{
>> +	struct intel_guc_slpc *slpc = rps_to_slpc(rps);
>> +
>> +	if (rps_uses_slpc(rps))
>> +		return slpc->rp0_freq;
>> +	else
>> +		return intel_gpu_freq(rps, rps->rp0_freq);
>> +}
>> +
>> +u32 intel_rps_get_rp1_frequency(struct intel_rps *rps)
>> +{
>> +	struct intel_guc_slpc *slpc = rps_to_slpc(rps);
>> +
>> +	if (rps_uses_slpc(rps))
>> +		return slpc->rp1_freq;
>> +	else
>> +		return intel_gpu_freq(rps, rps->rp1_freq);
>> +}
>> +
>> +u32 intel_rps_get_rpn_frequency(struct intel_rps *rps)
>> +{
>> +	struct intel_guc_slpc *slpc = rps_to_slpc(rps);
>> +
>> +	if (rps_uses_slpc(rps))
>> +		return slpc->min_freq;
>> +	else
>> +		return intel_gpu_freq(rps, rps->min_freq);
>> +}
>> +
>> +int intel_rps_set_max_frequency(struct intel_rps *rps, u32 val)
>> +{
>> +	struct drm_i915_private *i915 = rps_to_i915(rps);
>> +	struct intel_guc_slpc *slpc = rps_to_slpc(rps);
>> +	int ret = 0;
>> +
>> +	if (rps_uses_slpc(rps))
>> +		return intel_guc_slpc_set_max_freq(slpc, val);
>> +
>> +	mutex_lock(&rps->lock);
>> +
>> +	val = intel_freq_opcode(rps, val);
>> +	if (val < rps->min_freq ||
>> +	    val > rps->max_freq ||
>> +	    val < rps->min_freq_softlimit) {
>> +		ret = -EINVAL;
>> +		goto unlock;
>> +	}
>> +
>> +	if (val > rps->rp0_freq)
>> +		drm_dbg(&i915->drm, "User requested overclocking to %d\n",
>> +			  intel_gpu_freq(rps, val));
>> +
>> +	rps->max_freq_softlimit = val;
>> +
>> +	val = clamp_t(int, rps->cur_freq,
>> +		      rps->min_freq_softlimit,
>> +		      rps->max_freq_softlimit);
>> +
>> +	/*
>> +	 * We still need *_set_rps to process the new max_delay and
>> +	 * update the interrupt limits and PMINTRMSK even though
>> +	 * frequency request may be unchanged.
>> +	 */
>> +	intel_rps_set(rps, val);
>> +
>> +unlock:
>> +	mutex_unlock(&rps->lock);
>> +
>> +	return ret;
>> +}
>> +
>> +u32 intel_rps_get_min_frequency(struct intel_rps *rps)
>> +{
>> +	struct intel_guc_slpc *slpc = rps_to_slpc(rps);
>> +
>> +	if (rps_uses_slpc(rps))
>> +		return slpc->min_freq_softlimit;
>> +	else
>> +		return intel_gpu_freq(rps, rps->min_freq_softlimit);
>> +}
>> +
>> +int intel_rps_set_min_frequency(struct intel_rps *rps, u32 val)
>> +{
>> +	struct intel_guc_slpc *slpc = rps_to_slpc(rps);
>> +	int ret = 0;
>> +
>> +	if (rps_uses_slpc(rps))
>> +		return intel_guc_slpc_set_min_freq(slpc, val);
>> +
>> +	mutex_lock(&rps->lock);
>> +
>> +	val = intel_freq_opcode(rps, val);
>> +	if (val < rps->min_freq ||
>> +	    val > rps->max_freq ||
>> +	    val > rps->max_freq_softlimit) {
>> +		ret = -EINVAL;
>> +		goto unlock;
>> +	}
>> +
>> +	rps->min_freq_softlimit = val;
>> +
>> +	val = clamp_t(int, rps->cur_freq,
>> +		      rps->min_freq_softlimit,
>> +		      rps->max_freq_softlimit);
>> +
>> +	/*
>> +	 * We still need *_set_rps to process the new min_delay and
>> +	 * update the interrupt limits and PMINTRMSK even though
>> +	 * frequency request may be unchanged.
>> +	 */
>> +	intel_rps_set(rps, val);
>> +
>> +unlock:
>> +	mutex_unlock(&rps->lock);
>> +
>> +	return ret;
>> +}
>> +
>>   /* External interface for intel_ips.ko */
>>   
>>   static struct drm_i915_private __rcu *ips_mchdev;
>> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.h b/drivers/gpu/drm/i915/gt/intel_rps.h
>> index 1d2cfc98b510..6a66690dfb0f 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_rps.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_rps.h
>> @@ -31,6 +31,17 @@ int intel_gpu_freq(struct intel_rps *rps, int val);
>>   int intel_freq_opcode(struct intel_rps *rps, int val);
>>   u32 intel_rps_get_cagf(struct intel_rps *rps, u32 rpstat1);
>>   u32 intel_rps_read_actual_frequency(struct intel_rps *rps);
>> +u32 intel_rps_get_requested_frequency(struct intel_rps *rps);
>> +u32 intel_rps_get_min_frequency(struct intel_rps *rps);
>> +int intel_rps_set_min_frequency(struct intel_rps *rps, u32 val);
>> +u32 intel_rps_get_max_frequency(struct intel_rps *rps);
>> +int intel_rps_set_max_frequency(struct intel_rps *rps, u32 val);
>> +u32 intel_rps_get_rp0_frequency(struct intel_rps *rps);
>> +u32 intel_rps_get_rp1_frequency(struct intel_rps *rps);
>> +u32 intel_rps_get_rpn_frequency(struct intel_rps *rps);
>> +u32 intel_rps_read_punit_req(struct intel_rps *rps);
>> +u32 intel_rps_get_req(struct intel_rps *rps, u32 pureq);
>> +u32 intel_rps_read_punit_req_frequency(struct intel_rps *rps);
>>   
>>   void gen5_rps_irq_handler(struct intel_rps *rps);
>>   void gen6_rps_irq_handler(struct intel_rps *rps, u32 pm_iir);
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> index 134c57ca10b7..05d8870ec6da 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> @@ -301,6 +301,11 @@ int intel_guc_slpc_set_max_freq(struct intel_guc_slpc *slpc, u32 val)
>>   	struct drm_i915_private *i915 = slpc_to_i915(slpc);
>>   	intel_wakeref_t wakeref;
>>   
>> +	if ((val < slpc->min_freq) ||
>> +	    (val > slpc->rp0_freq) ||
>> +	    (val < slpc->min_freq_softlimit))
>> +		return -EINVAL;
>> +
>>   	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
>>   		ret = slpc_set_param(slpc,
>>   			       SLPC_PARAM_GLOBAL_MAX_GT_UNSLICE_FREQ_MHZ,
>> @@ -313,6 +318,8 @@ int intel_guc_slpc_set_max_freq(struct intel_guc_slpc *slpc, u32 val)
>>   		}
>>   	}
>>   
>> +	slpc->max_freq_softlimit = val;
>> +
>>   	return ret;
>>   }
>>   
>> @@ -359,6 +366,11 @@ int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val)
>>   	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
>>   	intel_wakeref_t wakeref;
>>   
>> +	if ((val < slpc->min_freq) ||
>> +	    (val > slpc->rp0_freq) ||
>> +	    (val > slpc->max_freq_softlimit))
>> +		return -EINVAL;
>> +
>>   	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
>>   		ret = slpc_set_param(slpc,
>>   			       SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
>> @@ -371,6 +383,8 @@ int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val)
>>   		}
>>   	}
>>   
>> +	slpc->min_freq_softlimit = val;
>> +
>>   	return ret;
>>   }
>>   
>> diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
>> index 34d37d46a126..a896bec18255 100644
>> --- a/drivers/gpu/drm/i915/i915_pmu.c
>> +++ b/drivers/gpu/drm/i915/i915_pmu.c
>> @@ -407,7 +407,7 @@ frequency_sample(struct intel_gt *gt, unsigned int period_ns)
>>   
>>   	if (pmu->enable & config_mask(I915_PMU_REQUESTED_FREQUENCY)) {
>>   		add_sample_mult(&pmu->sample[__I915_SAMPLE_FREQ_REQ],
>> -				intel_gpu_freq(rps, rps->cur_freq),
>> +				intel_rps_get_requested_frequency(rps),
>>   				period_ns / 1000);
>>   	}
>>   
>> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
>> index 92392c1da0e6..a5d893625736 100644
>> --- a/drivers/gpu/drm/i915/i915_reg.h
>> +++ b/drivers/gpu/drm/i915/i915_reg.h
>> @@ -9198,6 +9198,8 @@ enum {
>>   #define   GEN9_FREQUENCY(x)			((x) << 23)
>>   #define   GEN6_OFFSET(x)			((x) << 19)
>>   #define   GEN6_AGGRESSIVE_TURBO			(0 << 15)
>> +#define   GEN9_SW_REQ_UNSLICE_RATIO_SHIFT 	23
>> +
>>   #define GEN6_RC_VIDEO_FREQ			_MMIO(0xA00C)
>>   #define GEN6_RC_CONTROL				_MMIO(0xA090)
>>   #define   GEN6_RC_CTL_RC6pp_ENABLE		(1 << 16)
>> diff --git a/drivers/gpu/drm/i915/i915_sysfs.c b/drivers/gpu/drm/i915/i915_sysfs.c
>> index 873bf996ceb5..346646a0b43b 100644
>> --- a/drivers/gpu/drm/i915/i915_sysfs.c
>> +++ b/drivers/gpu/drm/i915/i915_sysfs.c
>> @@ -272,7 +272,7 @@ static ssize_t gt_cur_freq_mhz_show(struct device *kdev,
>>   	struct drm_i915_private *i915 = kdev_minor_to_i915(kdev);
>>   	struct intel_rps *rps = &i915->gt.rps;
>>   
>> -	return sysfs_emit(buf, "%d\n", intel_gpu_freq(rps, rps->cur_freq));
>> +	return sysfs_emit(buf, "%d\n", intel_rps_get_requested_frequency(rps));
>>   }
>>   
>>   static ssize_t gt_boost_freq_mhz_show(struct device *kdev, struct device_attribute *attr, char *buf)
>> @@ -326,9 +326,10 @@ static ssize_t vlv_rpe_freq_mhz_show(struct device *kdev,
>>   static ssize_t gt_max_freq_mhz_show(struct device *kdev, struct device_attribute *attr, char *buf)
>>   {
>>   	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
>> -	struct intel_rps *rps = &dev_priv->gt.rps;
>> +	struct intel_gt *gt = &dev_priv->gt;
>> +	struct intel_rps *rps = &gt->rps;
>>   
>> -	return sysfs_emit(buf, "%d\n", intel_gpu_freq(rps, rps->max_freq_softlimit));
>> +	return sysfs_emit(buf, "%d\n", intel_rps_get_max_frequency(rps));
>>   }
>>   
>>   static ssize_t gt_max_freq_mhz_store(struct device *kdev,
>> @@ -336,7 +337,8 @@ static ssize_t gt_max_freq_mhz_store(struct device *kdev,
>>   				     const char *buf, size_t count)
>>   {
>>   	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
>> -	struct intel_rps *rps = &dev_priv->gt.rps;
>> +	struct intel_gt *gt = &dev_priv->gt;
>> +	struct intel_rps *rps = &gt->rps;
>>   	ssize_t ret;
>>   	u32 val;
>>   
>> @@ -344,35 +346,7 @@ static ssize_t gt_max_freq_mhz_store(struct device *kdev,
>>   	if (ret)
>>   		return ret;
>>   
>> -	mutex_lock(&rps->lock);
>> -
>> -	val = intel_freq_opcode(rps, val);
>> -	if (val < rps->min_freq ||
>> -	    val > rps->max_freq ||
>> -	    val < rps->min_freq_softlimit) {
>> -		ret = -EINVAL;
>> -		goto unlock;
>> -	}
>> -
>> -	if (val > rps->rp0_freq)
>> -		DRM_DEBUG("User requested overclocking to %d\n",
>> -			  intel_gpu_freq(rps, val));
>> -
>> -	rps->max_freq_softlimit = val;
>> -
>> -	val = clamp_t(int, rps->cur_freq,
>> -		      rps->min_freq_softlimit,
>> -		      rps->max_freq_softlimit);
>> -
>> -	/*
>> -	 * We still need *_set_rps to process the new max_delay and
>> -	 * update the interrupt limits and PMINTRMSK even though
>> -	 * frequency request may be unchanged.
>> -	 */
>> -	intel_rps_set(rps, val);
>> -
>> -unlock:
>> -	mutex_unlock(&rps->lock);
>> +	ret = intel_rps_set_max_frequency(rps, val);
>>   
>>   	return ret ?: count;
>>   }
>> @@ -380,9 +354,10 @@ static ssize_t gt_max_freq_mhz_store(struct device *kdev,
>>   static ssize_t gt_min_freq_mhz_show(struct device *kdev, struct device_attribute *attr, char *buf)
>>   {
>>   	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
>> -	struct intel_rps *rps = &dev_priv->gt.rps;
>> +	struct intel_gt *gt = &dev_priv->gt;
>> +	struct intel_rps *rps = &gt->rps;
>>   
>> -	return sysfs_emit(buf, "%d\n", intel_gpu_freq(rps, rps->min_freq_softlimit));
>> +	return sysfs_emit(buf, "%d\n", intel_rps_get_min_frequency(rps));
>>   }
>>   
>>   static ssize_t gt_min_freq_mhz_store(struct device *kdev,
>> @@ -398,31 +373,7 @@ static ssize_t gt_min_freq_mhz_store(struct device *kdev,
>>   	if (ret)
>>   		return ret;
>>   
>> -	mutex_lock(&rps->lock);
>> -
>> -	val = intel_freq_opcode(rps, val);
>> -	if (val < rps->min_freq ||
>> -	    val > rps->max_freq ||
>> -	    val > rps->max_freq_softlimit) {
>> -		ret = -EINVAL;
>> -		goto unlock;
>> -	}
>> -
>> -	rps->min_freq_softlimit = val;
>> -
>> -	val = clamp_t(int, rps->cur_freq,
>> -		      rps->min_freq_softlimit,
>> -		      rps->max_freq_softlimit);
>> -
>> -	/*
>> -	 * We still need *_set_rps to process the new min_delay and
>> -	 * update the interrupt limits and PMINTRMSK even though
>> -	 * frequency request may be unchanged.
>> -	 */
>> -	intel_rps_set(rps, val);
>> -
>> -unlock:
>> -	mutex_unlock(&rps->lock);
>> +	ret = intel_rps_set_min_frequency(rps, val);
>>   
>>   	return ret ?: count;
>>   }
>> @@ -448,11 +399,11 @@ static ssize_t gt_rp_mhz_show(struct device *kdev, struct device_attribute *attr
>>   	u32 val;
>>   
>>   	if (attr == &dev_attr_gt_RP0_freq_mhz)
>> -		val = intel_gpu_freq(rps, rps->rp0_freq);
>> +		val = intel_rps_get_rp0_frequency(rps);
>>   	else if (attr == &dev_attr_gt_RP1_freq_mhz)
>> -		val = intel_gpu_freq(rps, rps->rp1_freq);
>> +		val = intel_rps_get_rp1_frequency(rps);
>>   	else if (attr == &dev_attr_gt_RPn_freq_mhz)
>> -		val = intel_gpu_freq(rps, rps->min_freq);
>> +		val = intel_rps_get_rpn_frequency(rps);
>>   	else
>>   		BUG();
>>   
>>
> 
> LGTM, but likely you will want someone who is more familiar with RPS to
> give r-b, from my side, with typo fixed, this is:

Thanks,
Vinay.
> 
> Acked-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 
