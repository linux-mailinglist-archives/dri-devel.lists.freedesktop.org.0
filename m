Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0854572562D
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 09:44:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B44B810E453;
	Wed,  7 Jun 2023 07:44:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 641DC10E453;
 Wed,  7 Jun 2023 07:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686123890; x=1717659890;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eNMbsi3SYeErliBmlslktMMgaBn6l7NFMkl9w5cDhQc=;
 b=FDFhWus0EaB3OxVuP2ZRn+9rzUgMrdM6ngK6yXXkcAsSrPwE/tWsQ5As
 2TdrjQugy966+XlrJ+HzWTxfY840qfKNG6pbMT2ahnyoFxElONylNrS2o
 zPv2KIf6cdoi47LjT8yyDgMfWJPgAzwI9oAjPetqP3PLroRbjf7i2q4XC
 RxLhiv75p07B9hkSthyIFyq28FNSs9qTpB5ISTDTN72pP6MD166NGDlvh
 XWL3nLb+pKhXiYtzCkz1lxWPN10CSJFZuHuuLl8uQ5l8qqBHAW+CZdAjr
 ThUiaOnKDuTsYwry5zd/g374k/bwud/39+0OAMPnBfyeXoMvOItD33p7M Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="341569674"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; d="scan'208";a="341569674"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 00:44:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="712499427"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; d="scan'208";a="712499427"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP; 07 Jun 2023 00:44:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 7 Jun 2023 00:44:48 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 7 Jun 2023 00:44:48 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 7 Jun 2023 00:44:48 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 7 Jun 2023 00:44:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=inBWsxbw/Ka+03zyGmakHOh52kmvSnDkEJiJmn6WvMrIQrHoI7rYpF8nPdoFQaBK9FQRYvO9Q54oyfYwhj/5S4gKLtv3RvXgtuNrBLuG158puX/r23obmE3LBss/eZdkijTaG7XIOy6fUcLswvfdEKsbOiklZFBlzEK5mS9ASdlLvSwiO/haKR23mHlbxe6O3e+DuW955Orri+yE20MTMMVBBpmNhq93sfOVV/YzL3cppyb07oNXnnXPDKZ7eQglT5FKeaknqvsDLFBliPGH6eer3iZ0jrFv9SsUY6RUdx5WyRUPUjD5sfhz8mB0imqmkCt6ZT5SFhSdSel1zCtWLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B0+Onbp91EdczCR90LPAHJ2nWoUqQ9nqCJIVO5gUTEc=;
 b=NuELERDG6w0LOA4cwyaqUR2DE7i66TuoPUKLgXoqtCsvDWp5OlwwBbsyRuZ/TTpYXw9B/wYpuR8DVqH9Po5XfhLhhXwx8wezK5FyO0BbLJC2SJ2tYcOEoJItVHJrY5+/S+Rkg7s+ECfnpJX7NVqUDD0qhFG2US3JOAkU9OpdcVlxOlxUfte+uAP9To6BVFHuuQ7MXCis14F1zfJKWT2Qie1M5R0CO8zIt7j+9GZU6wj1HNY3WgYFI9BNYh5InGlpLMB0UoyXI34HOxsSAvx1h9OlFwp9sDT4LBMMhV0lvPvS75I5FHz4DGs3Vm5lGR7oDc19DDi3wiX1NS7/RD/HTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2961.namprd11.prod.outlook.com (2603:10b6:208:76::23)
 by CY5PR11MB6510.namprd11.prod.outlook.com (2603:10b6:930:42::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 07:44:46 +0000
Received: from BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::bd76:abb4:db3c:58f5]) by BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::bd76:abb4:db3c:58f5%6]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 07:44:46 +0000
Message-ID: <7b9959d3-75c5-054a-db04-4d251bd28bb5@intel.com>
Date: Wed, 7 Jun 2023 09:44:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2] drm/i915: Fix a VMA UAF for multi-gt platform
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20230606202755.8719-1-nirmoy.das@intel.com>
 <ZH+dYpOpl5/11Eg4@ashyti-mobl2.lan>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <ZH+dYpOpl5/11Eg4@ashyti-mobl2.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0036.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::18) To BL0PR11MB2961.namprd11.prod.outlook.com
 (2603:10b6:208:76::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2961:EE_|CY5PR11MB6510:EE_
X-MS-Office365-Filtering-Correlation-Id: 656f0126-bfa6-4304-23dc-08db672b102c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SGNsXD4zwAyGOKyKQPHwEB5AWcIhjPj0EYigIPe9CdqMZVoK3notWvUyQ0C66pYO4z44j4je2KgirnR0JLx2KGtqA2HmNMwUNWe9M13RxkE8gNNx1AjGlyXuMEVi3+W9wYiyiJ6Pwh1YZSwWBAOl4kBEHiyl7KAKon79+PqYvTk5mK1Q9w0+oRGTcUXQKVQvcF1LW23qTdFD10tzNiNlWgXJNdC0L+AyBf1+2DFGaXTIIxl/85VWwsO9c5Bhuon3jtdVuQ8xFFNxKay1t43nLYrAo6GTwlEegR7G3V91fCqRJs/Sl2FLL/wCeC8CLPLdTsLXJ/lPhIve8rtNJce+V1/I1NojKNTBIiyorUtrUfjqbeSp8Ys/6sMoZScpEIlepAePoDpI3lyD2i6W0MMfIiM9TSix8AIFCxuX8EZC+li+cVLPe+3H+uWaRGQp8K0M8GNcDMcQE1/Tjr4nSgWQmLbleWaubq+98qDhsDlZlMT2b2v6tkKxL2htJhDJTMbF+ArK8KjigTtSaeJlRx5LUDvFrCNoWjXU5ztaRNlsfnirOihAdYRRHqsyVVKVUZQEs4+x71eo5CxCNkUzIMWnsJ7hGoEeGF47MmAY81rK7eo8GuzbZPMeEgqklGmLLghpKiVCMRucjGKB8lxr97f/Bg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB2961.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(366004)(39860400002)(346002)(136003)(451199021)(26005)(6506007)(186003)(6512007)(31686004)(53546011)(2616005)(83380400001)(66574015)(6486002)(36756003)(6666004)(2906002)(8676002)(8936002)(82960400001)(44832011)(54906003)(478600001)(5660300002)(38100700002)(6916009)(31696002)(4326008)(86362001)(316002)(41300700001)(66476007)(66556008)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ym5GdE1XazF4KzRjNlN4VHV2YmNtRUpmN0J5QmZDdElnLzB6UzUzaE1uejhO?=
 =?utf-8?B?VnhWSm1ybmZtNnR2cEVtb2FjanBVNTAwOWk0cVNXTVBuUU9BR2NMblBJWVZu?=
 =?utf-8?B?dU0zYU9IV1ZYWHovelc4RUVvT2FwZDJHZWZSd241Zll4MWFFT2czcE11V0kx?=
 =?utf-8?B?NklyVk5hTWNvVTQ2bVZTZzhqWnYralViT1MrOGVUbXEvcnlWWHh4QjBIZHlt?=
 =?utf-8?B?VmVlMXlwcUdrWTFTRmhHT1NCWldMS2lFVFRMZ1kxdVlsTG9la0hnTE90ajVq?=
 =?utf-8?B?bUNPcDFnQ2ErQy90SUF6dElsdHl0YnZOTUNRam9YYzN3blhCaDNGNnE0K2M2?=
 =?utf-8?B?cjNud1BWOHNWY0d3dDdLSEltRlVkZEtjRTdDOXEwRnR5VmRzZC9Xci90TEta?=
 =?utf-8?B?RmpBa01vaXp1UStXZ3ZDVWlNSFFNU2tVZ1c1Q2d2WDVyYUswUjVtZkFoUGRi?=
 =?utf-8?B?OU54TWN4VTZnVksvVHpZUzBERXNLS3ZpWWNVcTAzSEdJQWFzOVpvTFR5cy83?=
 =?utf-8?B?ZTFkMHZGNnJyM05LU3RSY1Vad2g1TzlsMjNQak9KbWlJRTZHYVpJOTdnNDBI?=
 =?utf-8?B?ZlBZSFIvTE9YaGZkQjV4UjZNZUR6UzQxNWFmL3JiaTFEM2NaQVNPRHNWeVRr?=
 =?utf-8?B?TVFzTWE3bXNHVXlZb3JGOEVraTZ0V0pyUjVWV1FwOW9rdHdoY3V3ZFdjSFNs?=
 =?utf-8?B?RWFBbStjTkpVdHRVM3YrK24vM0kvTnMzUGFLcDhPbERQWWdPbVpHSWduOUhL?=
 =?utf-8?B?QkhtR0tLN1haVU8vREtwYVd6dFhtTTYzYU9TRnZUdXk3QzBXY3JFS0JURXlQ?=
 =?utf-8?B?RkxpUS9LYkZaWlROVFhyWGc2eXJEZEdjQU02czh0SWx3dEJLbjhPalVxbGls?=
 =?utf-8?B?RS91WXlCVEUzcHpNb2pOTkZsSTZjMHc3b0hUMUkyN2RWZW9sSXdsMndjY3BS?=
 =?utf-8?B?dytmZnhnNjhSanpwZ29PNHV4c21WajhZaXY5cjlBckQvSk95WDVubVNNQmd3?=
 =?utf-8?B?ODF4K3RJU0ZJUHplYmRjc1ZkQUYwVEoyTUR4b0ZFc04rWUNNSGhKenQwUmZt?=
 =?utf-8?B?QW1YTk40SHd4RzhzZ1M5Yjh4c0tHSmU2dGl4Yk54eXhCL0VpQXpPSWwvNXZi?=
 =?utf-8?B?cDRPYkpQaWhiZWhmUEVKeERMMnIxSXdxWmU4N3BRc1BTYTRxRjgvK2FicEtL?=
 =?utf-8?B?aWNKS0ZGQjJXSi91K3ZwN1JQM0lWSTlNZEVkTTl2djF2aE1XcDYvdWlBMk9u?=
 =?utf-8?B?bzZFbXN4dnZ0YnNucDYrWDNSRTFOUUZ2SGRMQWxCQnlwY3J2SnhOSU9sRUQz?=
 =?utf-8?B?cDIyWDc1UHZ6dVFGVHNWMFBZbk8zbTNzZ2t1WkxvTGVoQmVPVTB5TVg4QlNV?=
 =?utf-8?B?bWdBcWRlSHQ1dGRWMzFKK1pUcDNyenVmWTFpcjZvbk50ckNJYW13Ty9tdS9t?=
 =?utf-8?B?eFVnMXdBVXAvcXF4ZUE4RVBqZ0dFYTRhUnJEOSttVCt6WjE3aVlOcUVBd1FW?=
 =?utf-8?B?TXNOblhOb0FReEZKeWViYzNTcWRQaHhobUNjNVIwc1c3RE42RzR2bjZhTUVD?=
 =?utf-8?B?RlRseWpOZkVTbTNYTjFhVmNXRXY3ejJTVCtnVkVZb1U4aXRGR2h3cmRDM3RB?=
 =?utf-8?B?WkZTS3Uyb1kzRnU0Qjg4VGQwTS9HWEw1bTFrcDVPM05IOUx4WnhBb0E3MTJG?=
 =?utf-8?B?aVdkWWZscnRnazRSTnhxYWdKRWV6ZGpsbWRNcWx5R0FnbmxmQ0tsWVZMak5L?=
 =?utf-8?B?bFVpbC9tcmdLenhoZzJmN3lkR2tvU0k1K0wxUG0zV1JURUJYcnV1V3ExMnpl?=
 =?utf-8?B?R3NPNkZUZnF3UitucUlzdmZkT2ZkbE5NNk5BQ0krZy9aZ1pMaGNjSEFmditI?=
 =?utf-8?B?OG0zbE1mT3JpWTY1SkhibUZYUHRBNTVMTjA2NHR5d241UXQwNllMVmdBenBn?=
 =?utf-8?B?bjYrWnltZGVjMDhmVzlzWXdnc1NLOXhGbFdCb0NNMzJ0UVhGRXpTU3Azb2Rk?=
 =?utf-8?B?ZGdabVVPZHY0SWJ3eGFPem4xc2ljSDJCa3R4NG1ud0hFaVNLdmU0cnNCR0ZE?=
 =?utf-8?B?VjdheVkyRmgwS3FMMjhyRmRBUmZHQUJSTGJZUjhDTG1RakhDbk1HdGhueEZC?=
 =?utf-8?Q?tseat7fjuehM2nQ2wYE+cUkKP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 656f0126-bfa6-4304-23dc-08db672b102c
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2961.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 07:44:45.8332 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /NXMgT3UBFisaSXaUmbFJIO5JX2fFLk563B40o/6iB8JlaG4OH0MWUYSo3ilI5omZDJqC4ZJgANqMKX4rrDcRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6510
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
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Chris
 Wilson <chris.p.wilson@intel.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sushma Venkatesh Reddy <sushma.venkatesh.reddy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/6/2023 10:56 PM, Andi Shyti wrote:
> Hi Nirmoy,
>
> On Tue, Jun 06, 2023 at 10:27:55PM +0200, Nirmoy Das wrote:
>> Ensure correct handling of closed VMAs on multi-gt platforms to prevent
>> Use-After-Free. Currently, when GT0 goes idle, closed VMAs that are
>> exclusively added to GT0's closed_vma link (gt->closed_vma) and
>> subsequently freed by i915_vma_parked(), which assumes the entire GPU is
>> idle. However, on platforms with multiple GTs, such as MTL, GT1 may
>> remain active while GT0 is idle. This causes GT0 to mistakenly consider
>> the closed VMAs in its closed_vma list as unnecessary, potentially
>> leading to Use-After-Free issues if a job for GT1 attempts to access a
>> freed VMA.
>>
>> Although we do take a wakeref for GT0 but it happens later, after
>> evaluating VMAs. To mitigate this, it is necessary to hold a GT0 wakeref
>> early.
>>
>> v2: Use gt id to detect multi-tile(Andi)
>>      Fix the incorrect error path.
>>
>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Chris Wilson <chris.p.wilson@intel.com>
>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>> Cc: Sushma Venkatesh Reddy <sushma.venkatesh.reddy@intel.com>
>> Tested-by: Andi Shyti <andi.shyti@linux.intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> I wonder if we need any Fixes tag here, maybe this:
>
> Fixes: d93939730347 ("drm/i915: Remove the vma refcount")

No, vma refcount is not enough unfortunately. Issue is i915_vma_parked() 
expects only one GT.


>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>> index 3aeede6aee4d..c2a67435acfa 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>> @@ -2683,6 +2683,7 @@ static int
>>   eb_select_engine(struct i915_execbuffer *eb)
>>   {
>>   	struct intel_context *ce, *child;
>> +	struct intel_gt *gt;
>>   	unsigned int idx;
>>   	int err;
>>   
>> @@ -2706,10 +2707,16 @@ eb_select_engine(struct i915_execbuffer *eb)
>>   		}
>>   	}
>>   	eb->num_batches = ce->parallel.number_children + 1;
>> +	gt = ce->engine->gt;
>>   
>>   	for_each_child(ce, child)
>>   		intel_context_get(child);
>>   	intel_gt_pm_get(ce->engine->gt);
>> +	/* Keep GT0 active on MTL so that i915_vma_parked() doesn't
>> +	 * free VMAs while execbuf ioctl is validating VMAs.
>> +	 */
>> +	if (gt->info.id)
>> +		intel_gt_pm_get(to_gt(gt->i915));
>>   
>>   	if (!test_bit(CONTEXT_ALLOC_BIT, &ce->flags)) {
>>   		err = intel_context_alloc_state(ce);
>> @@ -2748,6 +2755,9 @@ eb_select_engine(struct i915_execbuffer *eb)
>>   	return err;
>>   
>>   err:
>> +	if (gt->info.id)
>> +		intel_gt_pm_put(to_gt(gt->i915));
>> +
>>   	intel_gt_pm_put(ce->engine->gt);
>>   	for_each_child(ce, child)
>>   		intel_context_put(child);
>> @@ -2761,6 +2771,8 @@ eb_put_engine(struct i915_execbuffer *eb)
>>   	struct intel_context *child;
>>   
>>   	i915_vm_put(eb->context->vm);
>> +	if (eb->gt->info.id)
>> +		intel_gt_pm_put(to_gt(eb->gt->i915));
>>   	intel_gt_pm_put(eb->gt);
> I would add a comment up here, just not to scare people when they
> see this.


I can add a comment pairing comment mentioning

eb_select_engine().

> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>


Thanks,

Nirmoy

>
> Andi
>
>>   	for_each_child(eb->context, child)
>>   		intel_context_put(child);
>> -- 
>> 2.39.0
