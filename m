Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6195EE447
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 20:25:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8134E10E6EF;
	Wed, 28 Sep 2022 18:25:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C489410E641;
 Wed, 28 Sep 2022 18:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664389526; x=1695925526;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dfrbPvUPbjr17qJfJVCDKZwWc5rAxdiyEdRlKYqt1CE=;
 b=RI8UJx20PrH8yMXW2Rf55pQlX55IqnNCgy3kRHH2o6PLAw197C6U6vqu
 mW9XOZkV0a1nDpqZe1KLDu6e9Z9S8vDZCNfPSFReTOofCbUjs6/srkV2W
 3r9fwVg+DSUjJ1JOsHTxEBrDOS9oZZL0+b+3QClM/6sAL07IZGpaq+3dt
 vTZgrN5kkfB5o78y9G9Byf633td8UOW6YXdtO1m469OPWQ9a0mYup2UKo
 1ESPA2sDmEyHzq7KO0EojNV0133cMlR7Bk5mUmvFWIGuG4k1Vy5iBq37A
 WuU93Jbxr21Y+jqxtii6/9+GD+VFqMtdeuZHwKCdz8Aol9o5rBZtejWJ+ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="303166986"
X-IronPort-AV: E=Sophos;i="5.93,352,1654585200"; d="scan'208";a="303166986"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2022 11:25:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="711069286"
X-IronPort-AV: E=Sophos;i="5.93,352,1654585200"; d="scan'208";a="711069286"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP; 28 Sep 2022 11:25:20 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 28 Sep 2022 11:25:19 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 28 Sep 2022 11:25:19 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 28 Sep 2022 11:25:19 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 28 Sep 2022 11:25:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EIYgDAq2IoVypUzqhKi3ejCRgC9yRonEusT4gun1DabXfsaPlsJIxCva4guUOCBdYLUv9xhuSyxAKv17JBhuKDVk/w0Ju3LHaG2h6PWeyfEmPV+cBtLryn4nDdL3dx3k4ExFXMDVLzTqkSCha60ToxVgjnBZYm34EHnVb8TJSr3sjUReKAB+9eFGpS50VnHzY49MfERFZw6lUqKj4XHiiSRoeuZKogc0BeHQPtRELM/jNyrfYp2RRKvBdtEkVNBJ9d+eEnPHxNDaLOza4YenoxRBP2kxJRCBg1mYFauZJlmTsHMAbubBRozts6W2iuS776kh4mAwliZpLj57G1Gpaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uDqGYi+VboX1pNF9I2hSXXXXXxqDFZ9La8jXJU70nNo=;
 b=IskhZLwRd5mCmcHgmicg68iYuDnmSWevsUMF6ajKdY2LkVauqsXsC/EoIdzQ3rIseIyLEtKd+HwuUtWXSnJYEx0O5k6/3exchcz9enppowtqIHdn4qhlnOzgOvTm83396RVOOMQr9RvmCwQ0Wj3HWzMDnxVGyVFF+iq9HsCz8dDW25UEYs6kVEQ6K1kIuy//3JPxxgBvAtx+vngh6rgmnnxDyuLKB/gTamyaNL3/HI4K4mL0tFEoVxdoE3pZGYNPxhDoWdnHmLd/WVYqmrinwOHKqlGL7/rcthatR5uNJ2sqMb0Bo8lgTlyQwBiKBWw6iadf2IZWv2UFoah5F+4Wkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 SJ0PR11MB6573.namprd11.prod.outlook.com (2603:10b6:a03:44d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Wed, 28 Sep
 2022 18:25:16 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::280f:75b5:17ad:1668]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::280f:75b5:17ad:1668%4]) with mapi id 15.20.5676.017; Wed, 28 Sep 2022
 18:25:15 +0000
Message-ID: <76be4267-04e2-5155-832d-b92b954ec831@intel.com>
Date: Wed, 28 Sep 2022 11:25:13 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH 7/7] drm/i915/guc: handle interrupts from media GuC
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>
References: <20220922221117.458087-1-daniele.ceraolospurio@intel.com>
 <20220922221117.458087-8-daniele.ceraolospurio@intel.com>
 <YzOQ+bcBA+PwRZek@mdroper-desk1.amr.corp.intel.com>
 <87978a20-0f9e-62e8-63b8-9ffb94e71463@intel.com>
 <YzSNdLG7hVPoyCoU@mdroper-desk1.amr.corp.intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <YzSNdLG7hVPoyCoU@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::11) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|SJ0PR11MB6573:EE_
X-MS-Office365-Filtering-Correlation-Id: e6da91ff-bb24-41c1-d99a-08daa17eca1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ribVUgiswqyM0xIvcoagTQp+J2vl9QJbXyr62hAwZOLY/SfkzEU1A304fHB7Q6UcDnBbhX9uEKMwXiKI19JPc4RVIjyvzIXmKPxOB2cK83CyinJVObKwaEyNKKKi8o1G2xxuFX2YnxSedShdpevZf6LluspkQx2ysakBY1VNT4lmdGAKELARCLWTWUlqIzuSM9kBeq2Fwq0YGmATnuaNmkX3m03ysa0LHp+abU5V4v9Okr01MMjR9eNvxFJinfNxkhvBNVpnn/uv7dvsRemCjYwH8eXDB0LIznIRpb8HJc40N7Mc1TcQ3UuVAOXIjLJQNJGZgVGY4h/DaZVq0rr7QaEwxi/aBaZkD+k0h2au+4kLa95KE5deoC5i9qX042BR6BfWSoEpyXZdkk7336ln+cowIUZs6EpAtV0m5RdKOFInbHNlHEuAtbTtxP8mHTmIkzPb5+drLzQViRXI5Ij/WkjN43rUV1IxCI47CunFQgw24bjNsEm0Zu+rQpukhQKuD00kbpbEDTZjplT4zq1QgPJEvwT/TLwRjLVmohh0zm3iLMV0+cip+HCrWUHDgYb64FPR8W2pxQ/3za2GpSOIn1tbxyruVy6BUroj8CdrzuwtR37UFFCjf+lBXzPHk46uO82UQD2sgcGe4O5ljKKtusHxwEhDHXmoiPH2xGUWo+hQgUrpqwOAnc5tje1iFCLSXXSAVlt4+/9buAIO/RC1VK4fbC+WfTI9z0K8Ykd+M45a/jSBZTRkx8RVNaYvD1Vr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(396003)(366004)(376002)(39860400002)(136003)(451199015)(53546011)(6486002)(2906002)(83380400001)(966005)(6506007)(478600001)(36756003)(316002)(38100700002)(82960400001)(66556008)(8676002)(4326008)(66946007)(31696002)(86362001)(30864003)(41300700001)(8936002)(6862004)(37006003)(54906003)(6636002)(5660300002)(31686004)(186003)(2616005)(66476007)(6512007)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUFYUXV0bnJhYnlYTzNaMm5EVVJOTU5PMjFTcHc5YW01MXl2bS9vVFBkRSsy?=
 =?utf-8?B?SmZZc1BUdTNkWjBKNEJMeFprM1hUMkdQek1LQ2JJUkdXb0Vtd2ZEN3B5eDFR?=
 =?utf-8?B?OE5ENGt2akhKaGxSK3NLTWxUOVprSmpmZFFFdndmcUc2TjZwZXFCTXNibklB?=
 =?utf-8?B?TStLNEJvUkhtbzd3Y2JEMXNtMmh4clNqWmp6UXQ0ZTExZ0FVRzBtUzQ5OENQ?=
 =?utf-8?B?andjSmM1R2drVmJ2ZmF3SVV6VVJZSXdxSGJwWGVqTytlN0twNldheFBrYkN6?=
 =?utf-8?B?TWphTGROZTNHbzZwQnErV3N6QjBUMDByZVNydy90dXNmL1d5ZWF1MVYrM0s5?=
 =?utf-8?B?UVkwTzRQdC9lRUlicXh4T2FHWndlQXV6bUd4V3VsUmE4OGN2dGJXeTM1djND?=
 =?utf-8?B?UjhFelFHa1lQbFN4OUcrM3Y5SFpHOFBOanl0R0tGZ3FBR1hmUStqZ3NxUlJx?=
 =?utf-8?B?cnd0dGxGaWE1VUYxWUNwZ2JVKzFxVGRnU1h4RHRLcGJFRURJT2Z4QTJqcWN2?=
 =?utf-8?B?MTc1L2dndzhMZEZjVUl1cEs1ZjFUMjNBbUpBTVhmanRYUFFkY2psMEdDZWdV?=
 =?utf-8?B?VVJiWkNoajlKS2t2Q1ZjUmhRM0h2MGx2L2R5QmhaN0F4aDR1clFTUWF5TDdI?=
 =?utf-8?B?by9FOEJaQVBjbnNSZVduZ3EyakdlOWRpd0RLWWpqU1IrSFJZR2dXRnlQUzhS?=
 =?utf-8?B?Z2hMVm1ZQ1FDSTVSMExMSDlVU3lwM0dYekE2SWhNaHZDL1E2ZUZsY0xLVXdt?=
 =?utf-8?B?TzZ4Q2xZM2hZcnJ5c2RYQWVnK3lwenlHb2pSbEpMenZhTERpYzBiWURaeDdU?=
 =?utf-8?B?L1Z4VnBGU3NlcmY5QUNIa3lJUkkzNi8wY21KenorUGJRY0htUE9uZ09tVEd3?=
 =?utf-8?B?SmNxM1JtVFhNZWlSTElyVlBMTUFCVXdzT0cyRFY0cllOTkorSUd4ZDZ3K1Bx?=
 =?utf-8?B?aWFmYTE4bjZmbHhrVUhnc0JIQ245QUljMFd1RzF4MjQ0UWdiUVl0ZjJDeEp5?=
 =?utf-8?B?a3B6MnJCNWpTdkw5cmVxNFBFajgxK094dHYrSlNhMU1ZSnMxYXFncld4STd2?=
 =?utf-8?B?b1BnWE40dzRMMTArT0dKSFdFRXFIR0JHOG9NUnlXelpyWEdsZWRGQzZEc01q?=
 =?utf-8?B?Ni9lcVdLUlB6MlhvRlZvZjRPL01qQ2tsWVBPY2xMWVk3YUhmdTFFRllCTUZJ?=
 =?utf-8?B?eVBLdG9oTXBkQVloNStIdEJXb0EyNkdVT2swSlhDbFFWemNIbDZOSUd6Z2d6?=
 =?utf-8?B?STZaUHdaZ1N4KzlGbnRndXFldUNkOVdtWGVOR292SDlJaHV0MVhtVUZBL0FH?=
 =?utf-8?B?cnBKYXE2SHUzMXQ3VFF4UGQ2MlNOOXI0VWJKU2lINmVkWXVpaFdUNUNzcUUy?=
 =?utf-8?B?S0lSZDZWbW1Ubzk5TmpTaVZSWmF2bXhmOUJuVDNGNTA4ZHo5aGJlZXh5YTRZ?=
 =?utf-8?B?Y1lIOVIxY1IxRWJFbGdlTFB2SFNaQ0tod0NKdXFSd3dxKzFsbkh5YWtWdXJh?=
 =?utf-8?B?d1hqRUFrSnZFdDFiTytBa1R3ekhwMnpRM0pWQlZuV3c0dXBOQWViV3hpd1Bv?=
 =?utf-8?B?ZDhqMFRxVm1oaHZVMS9JOE9HZHZLbkt5L1RqUjlPeUd0V0k0cVZIM2Y5R0Jw?=
 =?utf-8?B?NkhVMU9CNitWaXByOEdnRDd2bEdlUllUK3U5ZjExOCtDdjc0K3YwZ21veEZl?=
 =?utf-8?B?bnBpbnlSSU1oeWhvdlFWVGNlUEV5ZEdYbjJ6b0dUZDY1MVBFcWsxRTVVZDNS?=
 =?utf-8?B?NmJpMnREaCs4UWhKWThVUUhnU0lYR1BpZ1hRZVliZnc0eXdjY243Zk5ESFNZ?=
 =?utf-8?B?am55eGhiUHlXWWZqdlBlUUtSOVVlN2dSKzFUckFPZGVUVXNyUDdqRExvTG1l?=
 =?utf-8?B?Y2Y4d0Q3dVJ3UHNLNVU1NVp1OGhPd1A0aUYrZytvTFBETUtJc3c3UTFhZkhn?=
 =?utf-8?B?M0RkWjlXdDZiYXlTdW8zcTM5eCtISWxtMnNyUWQxZWdQZGZVOTRZS1I2TmNs?=
 =?utf-8?B?VFJHOG9vTGN4bjMvU2YvL1E5L0xsQmNaM2owbmYwV0N3dzRBekF1NEkwYnlu?=
 =?utf-8?B?VWo4dDZCQ2xzTDVkQzY1RjZzdWhQdmlKNnd1SzBteHNzUWtqSEIrMHhkc29h?=
 =?utf-8?B?T05oTFZNWDVHTlJwYWNaaCtNbkQvd29KRVVRT0phNlRzcEFUTmhHU0tjSUxD?=
 =?utf-8?B?d1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e6da91ff-bb24-41c1-d99a-08daa17eca1c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2022 18:25:15.7060 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ltRsmGQZ70fhFboiNwtkaS8DpK33Cc8lPibaPYuJIdy+L1dkjJNK1JZM3XaIzSljncIFlPWVtN+yhUV0zjQeagwipRbZypTETcdiM1uFrQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6573
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, John Harrison <John.C.Harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/28/2022 11:07 AM, Matt Roper wrote:
> On Tue, Sep 27, 2022 at 05:22:41PM -0700, Ceraolo Spurio, Daniele wrote:
>>
>> On 9/27/2022 5:10 PM, Matt Roper wrote:
>>> On Thu, Sep 22, 2022 at 03:11:17PM -0700, Daniele Ceraolo Spurio wrote:
>>>> The render and media GuCs share the same interrupt enable register, so
>>>> we can no longer disable interrupts when we disable communication for
>>>> one of the GuCs as this would impact the other GuC. Instead, we keep the
>>>> interrupts always enabled in HW and use a variable in the GuC structure
>>>> to determine if we want to service the received interrupts or not.
>>> Even if they have a unified enable bit, can't we still just update the
>>> per-GuC mask bit to get the same behavior (i.e., no interrupts
>>> delivered to the host for that specific GuC)?
>> We could yes, but we've avoided dynamically using masks for gen11+ because
>> it can mess with rc6 (e.g., see
>> https://patchwork.freedesktop.org/patch/207829/).
> +Cc Mika & Tvrtko in case they remember more historic details.
>
> Is that expected/documented behavior?  Or is it an unlabelled workaround
> that might not be an issue anymore on newer platforms?  Also, it looks
> like that patch only applies to RING_IMR and doesn't necessarily impact
> other interrupt masking such as the GuC mask.

It was documented, though don't ask me where because it was an ICL doc 
and it's been too long :).
IIRC the issue is that enabled but masked interrupts are still 
accumulated (and immediately triggered once the mask is cleared) and 
they can keep the power up until they're actually serviced.

>
> The code today (which seems to be in use without problem on both gen12
> and xehp) is setting all mask bits in GEN11_GUC_SG_INTR_MASK and only
> clearing the single G2H bit at the point G2H interrupts are enabled.
> GEN11_GUC_SG_INTR_MASK has now become GEN12_GUC_MGUC_INTR_MASK, but it
> seems like keeping the masking logic the same as we've been using on
> gen12 and xehp would be fine if we just never clear the enable bit?

The main difference is that with the current gen12 code the interrupts 
are enabled and unmasked at the same time, so the situation above 
(pending interrupt stuck behind the mask keeping the power up) can never 
happen, while it can if we keep interrupts always enabled and start 
using the masks dynamically. We usually only disable and re-enable 
interrupts when the GuC is dead so it's not likely that we get an 
interrupt stuck behind the mask, but I'm not confident that all paths 
are safe (particularly around suspend). Instead of sanitizing all 
possible paths to make sure they're ok, keeping the interrupts enabled 
and dropping the rare unexpected ones seemed simpler to me.

Daniele

>>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/i915/gt/intel_gt_irq.c  | 21 ++++++++++++++----
>>>>    drivers/gpu/drm/i915/gt/intel_gt_regs.h |  2 ++
>>>>    drivers/gpu/drm/i915/gt/uc/intel_guc.c  | 29 ++++++++++++++-----------
>>>>    drivers/gpu/drm/i915/gt/uc/intel_guc.h  |  5 ++++-
>>>>    drivers/gpu/drm/i915/gt/uc/intel_uc.c   |  8 +++++--
>>>>    5 files changed, 45 insertions(+), 20 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_irq.c b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
>>>> index f26882fdc24c..e33ed9ae1439 100644
>>>> --- a/drivers/gpu/drm/i915/gt/intel_gt_irq.c
>>>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
>>>> @@ -17,6 +17,9 @@
>>>>    static void guc_irq_handler(struct intel_guc *guc, u16 iir)
>>>>    {
>>>> +	if (unlikely(!guc->interrupts.enabled))
>>>> +		return;
>>>> +
>>>>    	if (iir & GUC_INTR_GUC2HOST)
>>>>    		intel_guc_to_host_event_handler(guc);
>>>>    }
>>>> @@ -249,6 +252,7 @@ void gen11_gt_irq_postinstall(struct intel_gt *gt)
>>>>    {
>>>>    	struct intel_uncore *uncore = gt->uncore;
>>>>    	u32 irqs = GT_RENDER_USER_INTERRUPT;
>>>> +	u32 guc_mask = intel_uc_wants_guc(&gt->uc) ? GUC_INTR_GUC2HOST : 0;
>>>>    	const u32 gsc_mask = GSC_IRQ_INTF(0) | GSC_IRQ_INTF(1);
>>>>    	u32 dmask;
>>>>    	u32 smask;
>>>> @@ -299,6 +303,19 @@ void gen11_gt_irq_postinstall(struct intel_gt *gt)
>>>>    	if (HAS_HECI_GSC(gt->i915))
>>>>    		intel_uncore_write(uncore, GEN11_GUNIT_CSME_INTR_MASK, ~gsc_mask);
>>>> +	if (guc_mask) {
>>>> +		/* the enable bit is common for both GTs but the masks are separate */
>>>> +		u32 mask = gt->type == GT_MEDIA ?
>>>> +			REG_FIELD_PREP(ENGINE0_MASK, guc_mask) :
>>>> +			REG_FIELD_PREP(ENGINE1_MASK, guc_mask);
>>>> +
>>>> +		intel_uncore_write(uncore, GEN11_GUC_SG_INTR_ENABLE,
>>>> +				   REG_FIELD_PREP(ENGINE1_MASK, guc_mask));
>>>> +
>>>> +		/* we might not be the first GT to write this reg */
>>>> +		intel_uncore_rmw(uncore, GEN12_GUC_MGUC_INTR_MASK, mask, 0);
>>>> +	}
>>>> +
>>>>    	/*
>>>>    	 * RPS interrupts will get enabled/disabled on demand when RPS itself
>>>>    	 * is enabled/disabled.
>>>> @@ -307,10 +324,6 @@ void gen11_gt_irq_postinstall(struct intel_gt *gt)
>>>>    	gt->pm_imr = ~gt->pm_ier;
>>>>    	intel_uncore_write(uncore, GEN11_GPM_WGBOXPERF_INTR_ENABLE, 0);
>>>>    	intel_uncore_write(uncore, GEN11_GPM_WGBOXPERF_INTR_MASK,  ~0);
>>>> -
>>>> -	/* Same thing for GuC interrupts */
>>>> -	intel_uncore_write(uncore, GEN11_GUC_SG_INTR_ENABLE, 0);
>>>> -	intel_uncore_write(uncore, GEN11_GUC_SG_INTR_MASK,  ~0);
>>>>    }
>>>>    void gen5_gt_irq_handler(struct intel_gt *gt, u32 gt_iir)
>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>>>> index 1cbb7226400b..792809e49680 100644
>>>> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>>>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>>>> @@ -1519,6 +1519,7 @@
>>>>    #define   GEN11_CSME				(31)
>>>>    #define   GEN11_GUNIT				(28)
>>>>    #define   GEN11_GUC				(25)
>>>> +#define   GEN12_GUCM				(24)
>>>>    #define   GEN11_WDPERF				(20)
>>>>    #define   GEN11_KCR				(19)
>>>>    #define   GEN11_GTPM				(16)
>>>> @@ -1573,6 +1574,7 @@
>>>>    #define GEN11_VECS0_VECS1_INTR_MASK		_MMIO(0x1900d0)
>>>>    #define GEN12_VECS2_VECS3_INTR_MASK		_MMIO(0x1900d4)
>>>>    #define GEN11_GUC_SG_INTR_MASK			_MMIO(0x1900e8)
>>>> +#define GEN12_GUC_MGUC_INTR_MASK		_MMIO(0x1900e8) /* MTL+ */
>>> Technically we should probably give this a "MTL_" prefix or something
>>> since we're not referring to new platforms as "gen12" anymore.
>> ok. Should I change GEN12_GUCM as well?
> Yeah, at this point "gen12" is a historic term that only covers the
> pre-Xe_HP platforms and we've been asked not to use it for any newer
> platforms, even if they happen to have an IP version with a major number
> of "12."
>
>>>>    #define GEN11_GPM_WGBOXPERF_INTR_MASK		_MMIO(0x1900ec)
>>>>    #define GEN11_CRYPTO_RSVD_INTR_MASK		_MMIO(0x1900f0)
>>>>    #define GEN11_GUNIT_CSME_INTR_MASK		_MMIO(0x1900f4)
>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>>>> index b0beab44b34c..ab0263d8e1cf 100644
>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>>>> @@ -98,6 +98,8 @@ static void gen9_enable_guc_interrupts(struct intel_guc *guc)
>>>>    		     gt->pm_guc_events);
>>>>    	gen6_gt_pm_enable_irq(gt, gt->pm_guc_events);
>>>>    	spin_unlock_irq(gt->irq_lock);
>>>> +
>>>> +	guc->interrupts.enabled = true;
>>>>    }
>>>>    static void gen9_disable_guc_interrupts(struct intel_guc *guc)
>>>> @@ -105,6 +107,7 @@ static void gen9_disable_guc_interrupts(struct intel_guc *guc)
>>>>    	struct intel_gt *gt = guc_to_gt(guc);
>>>>    	assert_rpm_wakelock_held(&gt->i915->runtime_pm);
>>>> +	guc->interrupts.enabled = false;
>>>>    	spin_lock_irq(gt->irq_lock);
>>>> @@ -116,39 +119,39 @@ static void gen9_disable_guc_interrupts(struct intel_guc *guc)
>>>>    	gen9_reset_guc_interrupts(guc);
>>>>    }
>>>> +static bool __gen11_reset_guc_interrupts(struct intel_gt *gt)
>>>> +{
>>>> +	u32 irq = gt->type == GT_MEDIA ? GEN12_GUCM : GEN11_GUC;
>>>> +
>>>> +	lockdep_assert_held(gt->irq_lock);
>>>> +	return gen11_gt_reset_one_iir(gt, 0, irq);
>>>> +}
>>>> +
>>>>    static void gen11_reset_guc_interrupts(struct intel_guc *guc)
>>>>    {
>>>>    	struct intel_gt *gt = guc_to_gt(guc);
>>>>    	spin_lock_irq(gt->irq_lock);
>>>> -	gen11_gt_reset_one_iir(gt, 0, GEN11_GUC);
>>>> +	__gen11_reset_guc_interrupts(gt);
>>>>    	spin_unlock_irq(gt->irq_lock);
>>>>    }
>>>>    static void gen11_enable_guc_interrupts(struct intel_guc *guc)
>>>>    {
>>>>    	struct intel_gt *gt = guc_to_gt(guc);
>>>> -	u32 events = REG_FIELD_PREP(ENGINE1_MASK, GUC_INTR_GUC2HOST);
>>>>    	spin_lock_irq(gt->irq_lock);
>>>> -	WARN_ON_ONCE(gen11_gt_reset_one_iir(gt, 0, GEN11_GUC));
>>>> -	intel_uncore_write(gt->uncore,
>>>> -			   GEN11_GUC_SG_INTR_ENABLE, events);
>>>> -	intel_uncore_write(gt->uncore,
>>>> -			   GEN11_GUC_SG_INTR_MASK, ~events);
>>> The modified postinstall left us with GUC2HOST enabled but masked.
>>> Don't we still need to clear the mask so the interrupts will start being
>>> delivered?
>> The postinstall does:
>>
>> intel_uncore_rmw(uncore, GEN12_GUC_MGUC_INTR_MASK, mask, 0);
>>
>> which clears the "mask" (i.e. the G2H interrupt shifted based on which GuC
>> it is) in the mask register, so the G2H is allowed.
> Woops, yeah.  I got the order of the rmw parameters mixed up here.
>
>
> Matt
>
>> Daniele
>>
>>>
>>> Matt
>>>
>>>> +	__gen11_reset_guc_interrupts(gt);
>>>>    	spin_unlock_irq(gt->irq_lock);
>>>> +
>>>> +	guc->interrupts.enabled = true;
>>>>    }
>>>>    static void gen11_disable_guc_interrupts(struct intel_guc *guc)
>>>>    {
>>>>    	struct intel_gt *gt = guc_to_gt(guc);
>>>> -	spin_lock_irq(gt->irq_lock);
>>>> -
>>>> -	intel_uncore_write(gt->uncore, GEN11_GUC_SG_INTR_MASK, ~0);
>>>> -	intel_uncore_write(gt->uncore, GEN11_GUC_SG_INTR_ENABLE, 0);
>>>> -
>>>> -	spin_unlock_irq(gt->irq_lock);
>>>> +	guc->interrupts.enabled = false;
>>>>    	intel_synchronize_irq(gt->i915);
>>>>    	gen11_reset_guc_interrupts(guc);
>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>>>> index 804133df1ac9..061d55de3a94 100644
>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>>>> @@ -78,6 +78,7 @@ struct intel_guc {
>>>>    	/** @interrupts: pointers to GuC interrupt-managing functions. */
>>>>    	struct {
>>>> +		bool enabled;
>>>>    		void (*reset)(struct intel_guc *guc);
>>>>    		void (*enable)(struct intel_guc *guc);
>>>>    		void (*disable)(struct intel_guc *guc);
>>>> @@ -316,9 +317,11 @@ static inline int intel_guc_send_busy_loop(struct intel_guc *guc,
>>>>    	return err;
>>>>    }
>>>> +/* Only call this from the interrupt handler code */
>>>>    static inline void intel_guc_to_host_event_handler(struct intel_guc *guc)
>>>>    {
>>>> -	intel_guc_ct_event_handler(&guc->ct);
>>>> +	if (guc->interrupts.enabled)
>>>> +		intel_guc_ct_event_handler(&guc->ct);
>>>>    }
>>>>    /* GuC addresses above GUC_GGTT_TOP also don't map through the GTT */
>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>>>> index 4cd8a787f9e5..1d28286e6f06 100644
>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>>>> @@ -636,8 +636,10 @@ void intel_uc_runtime_suspend(struct intel_uc *uc)
>>>>    {
>>>>    	struct intel_guc *guc = &uc->guc;
>>>> -	if (!intel_guc_is_ready(guc))
>>>> +	if (!intel_guc_is_ready(guc)) {
>>>> +		guc->interrupts.enabled = false;
>>>>    		return;
>>>> +	}
>>>>    	/*
>>>>    	 * Wait for any outstanding CTB before tearing down communication /w the
>>>> @@ -657,8 +659,10 @@ void intel_uc_suspend(struct intel_uc *uc)
>>>>    	intel_wakeref_t wakeref;
>>>>    	int err;
>>>> -	if (!intel_guc_is_ready(guc))
>>>> +	if (!intel_guc_is_ready(guc)) {
>>>> +		guc->interrupts.enabled = false;
>>>>    		return;
>>>> +	}
>>>>    	with_intel_runtime_pm(&uc_to_gt(uc)->i915->runtime_pm, wakeref) {
>>>>    		err = intel_guc_suspend(guc);
>>>> -- 
>>>> 2.37.3
>>>>

