Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 563DB72415D
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 13:56:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3C1B10E337;
	Tue,  6 Jun 2023 11:56:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 453AF10E330;
 Tue,  6 Jun 2023 11:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686052606; x=1717588606;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ikplJpiPy3T+RSpN2R9V0ZCOAbjXImUCpLFL6wnWeyU=;
 b=h019SZrVasdZXk+LEOCOCfLO2qLC4dVFnJ5i30rBhLDXVDUFDomATYwN
 ufCFjQ++fNuqZA4qdBMXMOvUTLRY9D9rk4wvPrW92jfJ2gOvLE68tm0fg
 cg3f3V/QVGVLHUehej3BPDKA1A3XbG59OpcGp77HLjKcCVqW/bpfrSA3c
 tuxA6IIyRtnI16JfkT+EBJpHRoRdtNfYexcbu4aq1aGE873hzyN6VrEe6
 JlcxwRwF2AWYLblM5oiWjDIEO3Q+0vJk0uKFuwszmQYdyf7VruUTSNT7E
 DbQattpXV82/zA9eszhqxxO/qPWd/cpBR3CB+Fo2lXhYVRo4QKbUaH7d7 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="354142337"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="354142337"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 04:56:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="774098208"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="774098208"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 06 Jun 2023 04:56:41 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 04:56:41 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 6 Jun 2023 04:56:41 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.42) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 6 Jun 2023 04:56:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JkJemIaUNtJdHGllfqCQufLpfgSE0xUQ1B5WyBFOW7ayGFzAn/NeTnK7R0WwGot+LgcySifCU13T6bvmtXyocsuMKa3ZPE+iG3/LKhONS0FpXnVr9ovvg+ZwfLs5NF2CR0JThraJMUOSRFd/97mV7zPImhtSNBK2jpgkidZSG/XxOjkIk2dXvnjNBqnfYV8nb1Ai52FoDfwE9wOXgcxe636A63U3kn/7I/r4wnmpWmQwTDiQGdyCGU25YKsd9ciWrhEuNCUnCrkJSAlb+KQZsutd12/QJOufaa0aCHyr9MpINf4UI6lDmAxb3P43dJOQYeL5Nmmm+qxk/aZQeXDtwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0gSISrxBs1TlX7YQWU3snc0wTmMlfowzNFLaKFtpqqU=;
 b=cphuhGeeBv/ndbLedFm3btNUPG0HqP7+r691OVESTCoI44C554g7HI1Hs/bemJz4TkTLGmhika/EydPgtAW5arqMgFxwIxeg8zdnjrysfnCDX9AEHqYgqGY4HleK4Fvml2Pto2NoNakjgkIZIECCAIrlRGpowPu+paQjptKaoez3qCZj4VGOtyiWk6cyU19i/nykIr1JEgFLEQ2rDyE/couxY9FSr18N8ulbkB0l4cDxr4Lac/2kuLa8s2JGhWYVjlbhYuNgFVLIeQLyLXyPSV0JZibJMu8Sg9xMwhaxOikqjoLQLH2PAxNzfLi4LGDydG9j3JSiJzJCGlw65KxDVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by DM4PR11MB6336.namprd11.prod.outlook.com (2603:10b6:8:b9::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.33; Tue, 6 Jun 2023 11:56:36 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::6082:8da2:e39:aeff]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::6082:8da2:e39:aeff%4]) with mapi id 15.20.6455.030; Tue, 6 Jun 2023
 11:56:36 +0000
Message-ID: <d696b472-c307-6034-25bc-5241aa1bb847@intel.com>
Date: Tue, 6 Jun 2023 17:26:24 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.2
Subject: Re: [RFC 0/5] Proposal to use netlink for RAS and Telemetry across
 drm subsystem
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>, Hawking Zhang
 <Hawking.Zhang@amd.com>, Harish Kasiviswanathan
 <Harish.Kasiviswanathan@amd.com>, "Kuehling, Felix" <Felix.Kuehling@amd.com>, 
 "Tuikov, Luben" <Luben.Tuikov@amd.com>
References: <20230526162016.428357-1-aravind.iddamsetty@intel.com>
 <CADnq5_ME+iXQjx1nqY2ZKHDr_SYRv4jDMVq0MdNXHTHD_pFo3A@mail.gmail.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <CADnq5_ME+iXQjx1nqY2ZKHDr_SYRv4jDMVq0MdNXHTHD_pFo3A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0197.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::6) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|DM4PR11MB6336:EE_
X-MS-Office365-Filtering-Correlation-Id: ed48c238-cec0-4274-4fb0-08db66851418
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J/zfsfulgdMkitTAlEZsFWxKLce778WkNm1d5r3y7j1vGAoo+G9q9KgC6groJWyFMB/ofT16LKk65ZJdVRrSzj4MDuSMCsUmrto2TtnzzSrZI9CDqnY8Qe4k0XmyQMTXNLTB9WtlhQoeugqHtWJM3TIy8WgLyHEOWn6p7xYBT31Z+wgL89Ty1MG/XtH/Wz+K/uE+4dZOIGBh1PAX1xEqzZfc5HxsA174M36x8WBopkU88Aa+8M6gcnLfyFgdLd/E3XRnpQG7uwksGq//XWOyfr3DNH/+twvUj4E7CZsQ7n+hKw6467ElCznFCTOB5zFuAaf0rc7iJAJEq5pdHNtf+NtBo4w264bXTL7efDBY4vwnsCKZZ6M7kU4KovMPPoBOuAS4aDHJg3Uzu3V3X9lLhx+ocPcsYK5lNQZkBEkCcXEoXn7oPSxGLfiScL9VGHXpxGgxxMU4opRGYL3Ti1g1Ex1eu8O7B2hKJvaqYfvC85CV1RjG7wqMBAg9J6DkxgpbZULY+DsxrXtEzhsJtF29RmXRhRnrP6XPrbR3Nrk4HZzMy4vUgcZyiw3xSgVQoJa2lLcDtweisEaYLyiXVf1zYr7/ivm/6jVk9PKXJyjtOxaKEEacwa/IhbVfooEFC9KV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(366004)(136003)(39860400002)(396003)(376002)(451199021)(186003)(110136005)(82960400001)(478600001)(8676002)(8936002)(4326008)(41300700001)(66946007)(38100700002)(316002)(66556008)(66476007)(2616005)(83380400001)(6486002)(966005)(6666004)(26005)(6512007)(6506007)(53546011)(31696002)(86362001)(5660300002)(7416002)(2906002)(30864003)(36756003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVBvTTRQYlJwU0gxSEFackhNZmVHRFZuZnhPRGEvdlhWVFlkcytBTTByWGRk?=
 =?utf-8?B?RW1DMUt2SmtkNWhjZTlaQ01vVlF2cG9qWGh3TE9zZlFLL2djaG4zTVI1YlM3?=
 =?utf-8?B?bEd3aWNMSmN2TVU4WTJjMkNCeVRleisxaU4yd2MzMEFodkZFWUltNHh6ZFZx?=
 =?utf-8?B?SmlhVnk5T3gzTGNlVDdmZW9laEd0TGtZejlOaDROYkZnRysyYVZadWpZSHhI?=
 =?utf-8?B?RXhPU09sNzMyczZQTXBrS2RCbFVkZllDQ2dWWmFoMFowbGFxQk1sR3FFaDFQ?=
 =?utf-8?B?cUZTS08wUCtPK3FPeEVsMy9icktuT2dRSm5wWDc1Vk8rMUFHN1ZXRS9ITmFW?=
 =?utf-8?B?eEJ4VzczZTVrdXRPWFFaVTlHY2R5a2xqMHhMRFg2ZDZ1cUdpRE5odFMzWHNs?=
 =?utf-8?B?bHNVeWlwN2ZQdGhtQTNXTkx6OVZJaXhCQm9ZZ1BQeGg5YjNGNXhUbG9ld016?=
 =?utf-8?B?NjJ0c1ZuakdVNnN3eGFUcGlvMFA0a0d3eUl6RlArQ1k3RGJIdU1zV1pwWThl?=
 =?utf-8?B?ald6K0ZjVndRVlR5R1Y0UTVEajhKUDRlNzRwRVlWYThoc01BUzVKdXZUKzZw?=
 =?utf-8?B?QllFbGc0L1ZHUjBBbmVnUWFmMSt3eGRldFRDbmxLeVZDVW1xeEhVS1FWOENj?=
 =?utf-8?B?UXl5Y3VrdFdXT2RUejdUNkhZcEZGLzFjNHB6ZnF6bEpxMUR4bVhpQWdtb1Fh?=
 =?utf-8?B?M2FjVUllSUxWaS9CM21FM2VxbnZHOW02QnJZL0JpbDB2MEt0cGgxcEFpbEY4?=
 =?utf-8?B?R1hOcTJrUkdvMWRWZWcvc1p6WUthME80akNkQTNibFJKMEFjZ0VETDNtRytt?=
 =?utf-8?B?Q29Xd1pCa0VwYlBtN3p3ZVBaTitIZUs3WmhzNUNVT0czejJVOEg0TlhvN3Nk?=
 =?utf-8?B?V3g4R1QvQVljdXQvM3BIY0c1QVhzUEtVeFdCUEZNUklzejBXNjU1WXZBdkdI?=
 =?utf-8?B?OFVhZ2FjNlNzem9pWjdWSU5YQmplSGp2ZURTOEpWSjhYZXF4cDVlUllUa2Rz?=
 =?utf-8?B?NkhoQnprejY4QUtiaUVCYWs3bjdUWkxVdkt6NDVoWmRWRWJUSmMvdUwxbXFB?=
 =?utf-8?B?YkZ4ZndkQ1IxSHpQL0RabE9BSlA4dk02SmVCUmlHYVp6RHkzNUprNjFIdUlV?=
 =?utf-8?B?TzhxNWxDZEE4RTlOQU9tVVRtK1Y4SGNFSDJnK0RJRkRnVHZmSjlVdTlOK0N4?=
 =?utf-8?B?VStxZHdUY01QM3luaEhPb28xQ0hBWTRPbGdXaE5qeU0wR3pHS2F6NVJHM2ZF?=
 =?utf-8?B?UXEvaU1qVytlNy8wOUZ1Um5kYkpDbG1KNTZvdGtDSm96VDNIaldEeVFNZWZm?=
 =?utf-8?B?MjE3Q25BNldLZ3FDb3RCcXo5Y1FJak1wOXVLSGpieUVUbUF5aWFnK1RwVzFT?=
 =?utf-8?B?UGhYeFZPQUFCRHB3RE5xckVLdkcwMjFwR291dm5RTFRSTkRRWVZFMWUvS2Ur?=
 =?utf-8?B?dDU5dE1rTkNidTk0U3g5ZXpZQjQyanRkMDJLRmlhM3NLOE4ySFJoR0R5aVdu?=
 =?utf-8?B?NGtxb3VidEdZMkk0cnB2YWZRVjhlRkNleTBlbWNKaDZqSklRU1JyWkczWE56?=
 =?utf-8?B?Q0xGaWdiOFYxTFowaXpoR3hYZ25BWWo4dkZucUR2OHc1K1paQzJDODZJQmVj?=
 =?utf-8?B?LzB0WW1icXRScUQ0d1VpTGgrT1NSYkE5OXBwaHdXR1ZHbFpzYWJobFlQZ0lF?=
 =?utf-8?B?cDUveVJEalgvbVZHWHJiZFdjV3ZWVFpOREkxdlNFeDd3NC95T3hseXY5SUtX?=
 =?utf-8?B?OWNONFVOeDduTEMxWXZ6bHcrblczeHhhK2dHK21IS290czhSalBseG9hNTVE?=
 =?utf-8?B?Ynp5SU04eWUyRGhoR0gvSk5OUVdNbURaRVRWM3lvV1phQVVRZ3lPRkJiL2tP?=
 =?utf-8?B?Nk80SnI3dzdwRjlaSEhyS2xScW42WDdwcW5pelIzRmhvZ01LQVE4M0hvb0lC?=
 =?utf-8?B?WmZMTXRsdDZSeVY4QW8zaVoxaFYwallwQ3VidUV4ZzFJRGxtaHBrYUlRV1J0?=
 =?utf-8?B?YUkzcEltZW1uOEF0RE9sZSt0dW1RdTRwUGJ6V2NZMWhRMW9GOHpWYWdoRWpB?=
 =?utf-8?B?NEVFU2xQSy9SNXYrWm5RZ3BPKytNS25mRkhnaFZiZ1h0SzJ6d0U0b0Racy81?=
 =?utf-8?B?MEhOWlpBVVJGTWRLQ0ZHY1ZFUFMvQlAxRk1GTmhtK2c2RXk4R3p5L3M1THda?=
 =?utf-8?Q?1DJOe/sxBQjG3j9KP9L09F0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ed48c238-cec0-4274-4fb0-08db66851418
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2023 11:56:36.0809 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vZxYJtuFIVIGfHWqHKy2eGdFVPYh9l6NNlUI0Yq9j7zbBDUMyY6VErqU8M7K+/uRrhZmJ3l4qo1p5SmEavH29zPSsJiIdCQkz5yM7hxGmWc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6336
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
Cc: alexander.deucher@amd.com, ogabbay@kernel.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 05-06-2023 22:17, Alex Deucher wrote:
> Adding the relevant AMD folks for RAS.  We currently expose RAS via
> sysfs, but also have an event interface in KFD which may be somewhat
> similar to this.
> 
> If we were to converge on a common RAS interface, would we want to
> look at any commonality in bad page storage/reporting for device
> memory?

Could you please elaborate a bit on this.

Thanks,
Aravind.
> 
> Alex
> 
> On Fri, May 26, 2023 at 12:21 PM Aravind Iddamsetty
> <aravind.iddamsetty@intel.com> wrote:
>>
>> Our hardware supports RAS(Reliability, Availability, Serviceability) by
>> exposing a set of error counters which can be used by observability
>> tools to take corrective actions or repairs. Traditionally there were
>> being exposed via PMU (for relative counters) and sysfs interface (for
>> absolute value) in our internal branch. But, due to the limitations in
>> this approach to use two interfaces and also not able to have an event
>> based reporting or configurability, an alternative approach to try
>> netlink was suggested by community for drm subsystem wide UAPI for RAS
>> and telemetry as discussed in [1].
>>
>> This [1] is the inspiration to this series. It uses the generic
>> netlink(genl) family subsystem and exposes a set of commands that can
>> be used by every drm driver, the framework provides a means to have
>> custom commands too. Each drm driver instance in this example xe driver
>> instance registers a family and operations to the genl subsystem through
>> which it enumerates and reports the error counters. An event based
>> notification is also supported to which userpace can subscribe to and
>> be notified when any error occurs and read the error counter this avoids
>> continuous polling on error counter. This can also be extended to
>> threshold based notification.
>>
>> [1]: https://airlied.blogspot.com/2022/09/accelerators-bof-outcomes-summary.html
>>
>> this series is on top of https://patchwork.freedesktop.org/series/116181/
>>
>> Below is an example tool drm_ras which demonstrates the use of the
>> supported commands. The tool will be sent to ML with the subject
>> "[RFC i-g-t 0/1] A tool to demonstrate use of netlink sockets to read RAS error counters"
>>
>> read single error counter:
>>
>> $ ./drm_ras READ_ONE --device=drm:/dev/dri/card1 --error_id=0x0000000000000005
>> counter value 0
>>
>> read all error counters:
>>
>> $ ./drm_ras READ_ALL --device=drm:/dev/dri/card1
>> name                                                    config-id               counter
>>
>> error-gt0-correctable-guc                               0x0000000000000001      0
>> error-gt0-correctable-slm                               0x0000000000000003      0
>> error-gt0-correctable-eu-ic                             0x0000000000000004      0
>> error-gt0-correctable-eu-grf                            0x0000000000000005      0
>> error-gt0-fatal-guc                                     0x0000000000000009      0
>> error-gt0-fatal-slm                                     0x000000000000000d      0
>> error-gt0-fatal-eu-grf                                  0x000000000000000f      0
>> error-gt0-fatal-fpu                                     0x0000000000000010      0
>> error-gt0-fatal-tlb                                     0x0000000000000011      0
>> error-gt0-fatal-l3-fabric                               0x0000000000000012      0
>> error-gt0-correctable-subslice                          0x0000000000000013      0
>> error-gt0-correctable-l3bank                            0x0000000000000014      0
>> error-gt0-fatal-subslice                                0x0000000000000015      0
>> error-gt0-fatal-l3bank                                  0x0000000000000016      0
>> error-gt0-sgunit-correctable                            0x0000000000000017      0
>> error-gt0-sgunit-nonfatal                               0x0000000000000018      0
>> error-gt0-sgunit-fatal                                  0x0000000000000019      0
>> error-gt0-soc-fatal-psf-csc-0                           0x000000000000001a      0
>> error-gt0-soc-fatal-psf-csc-1                           0x000000000000001b      0
>> error-gt0-soc-fatal-psf-csc-2                           0x000000000000001c      0
>> error-gt0-soc-fatal-punit                               0x000000000000001d      0
>> error-gt0-soc-fatal-psf-0                               0x000000000000001e      0
>> error-gt0-soc-fatal-psf-1                               0x000000000000001f      0
>> error-gt0-soc-fatal-psf-2                               0x0000000000000020      0
>> error-gt0-soc-fatal-cd0                                 0x0000000000000021      0
>> error-gt0-soc-fatal-cd0-mdfi                            0x0000000000000022      0
>> error-gt0-soc-fatal-mdfi-east                           0x0000000000000023      0
>> error-gt0-soc-fatal-mdfi-south                          0x0000000000000024      0
>> error-gt0-soc-fatal-hbm-ss0-0                           0x0000000000000025      0
>> error-gt0-soc-fatal-hbm-ss0-1                           0x0000000000000026      0
>> error-gt0-soc-fatal-hbm-ss0-2                           0x0000000000000027      0
>> error-gt0-soc-fatal-hbm-ss0-3                           0x0000000000000028      0
>> error-gt0-soc-fatal-hbm-ss0-4                           0x0000000000000029      0
>> error-gt0-soc-fatal-hbm-ss0-5                           0x000000000000002a      0
>> error-gt0-soc-fatal-hbm-ss0-6                           0x000000000000002b      0
>> error-gt0-soc-fatal-hbm-ss0-7                           0x000000000000002c      0
>> error-gt0-soc-fatal-hbm-ss1-0                           0x000000000000002d      0
>> error-gt0-soc-fatal-hbm-ss1-1                           0x000000000000002e      0
>> error-gt0-soc-fatal-hbm-ss1-2                           0x000000000000002f      0
>> error-gt0-soc-fatal-hbm-ss1-3                           0x0000000000000030      0
>> error-gt0-soc-fatal-hbm-ss1-4                           0x0000000000000031      0
>> error-gt0-soc-fatal-hbm-ss1-5                           0x0000000000000032      0
>> error-gt0-soc-fatal-hbm-ss1-6                           0x0000000000000033      0
>> error-gt0-soc-fatal-hbm-ss1-7                           0x0000000000000034      0
>> error-gt0-soc-fatal-hbm-ss2-0                           0x0000000000000035      0
>> error-gt0-soc-fatal-hbm-ss2-1                           0x0000000000000036      0
>> error-gt0-soc-fatal-hbm-ss2-2                           0x0000000000000037      0
>> error-gt0-soc-fatal-hbm-ss2-3                           0x0000000000000038      0
>> error-gt0-soc-fatal-hbm-ss2-4                           0x0000000000000039      0
>> error-gt0-soc-fatal-hbm-ss2-5                           0x000000000000003a      0
>> error-gt0-soc-fatal-hbm-ss2-6                           0x000000000000003b      0
>> error-gt0-soc-fatal-hbm-ss2-7                           0x000000000000003c      0
>> error-gt0-soc-fatal-hbm-ss3-0                           0x000000000000003d      0
>> error-gt0-soc-fatal-hbm-ss3-1                           0x000000000000003e      0
>> error-gt0-soc-fatal-hbm-ss3-2                           0x000000000000003f      0
>> error-gt0-soc-fatal-hbm-ss3-3                           0x0000000000000040      0
>> error-gt0-soc-fatal-hbm-ss3-4                           0x0000000000000041      0
>> error-gt0-soc-fatal-hbm-ss3-5                           0x0000000000000042      0
>> error-gt0-soc-fatal-hbm-ss3-6                           0x0000000000000043      0
>> error-gt0-soc-fatal-hbm-ss3-7                           0x0000000000000044      0
>> error-gt0-gsc-correctable-sram-ecc                      0x0000000000000045      0
>> error-gt0-gsc-nonfatal-mia-shutdown                     0x0000000000000046      0
>> error-gt0-gsc-nonfatal-mia-int                          0x0000000000000047      0
>> error-gt0-gsc-nonfatal-sram-ecc                         0x0000000000000048      0
>> error-gt0-gsc-nonfatal-wdg-timeout                      0x0000000000000049      0
>> error-gt0-gsc-nonfatal-rom-parity                       0x000000000000004a      0
>> error-gt0-gsc-nonfatal-ucode-parity                     0x000000000000004b      0
>> error-gt0-gsc-nonfatal-glitch-det                       0x000000000000004c      0
>> error-gt0-gsc-nonfatal-fuse-pull                        0x000000000000004d      0
>> error-gt0-gsc-nonfatal-fuse-crc-check                   0x000000000000004e      0
>> error-gt0-gsc-nonfatal-selfmbist                        0x000000000000004f      0
>> error-gt0-gsc-nonfatal-aon-parity                       0x0000000000000050      0
>> error-gt1-correctable-guc                               0x1000000000000001      0
>> error-gt1-correctable-slm                               0x1000000000000003      0
>> error-gt1-correctable-eu-ic                             0x1000000000000004      0
>> error-gt1-correctable-eu-grf                            0x1000000000000005      0
>> error-gt1-fatal-guc                                     0x1000000000000009      0
>> error-gt1-fatal-slm                                     0x100000000000000d      0
>> error-gt1-fatal-eu-grf                                  0x100000000000000f      0
>> error-gt1-fatal-fpu                                     0x1000000000000010      0
>> error-gt1-fatal-tlb                                     0x1000000000000011      0
>> error-gt1-fatal-l3-fabric                               0x1000000000000012      0
>> error-gt1-correctable-subslice                          0x1000000000000013      0
>> error-gt1-correctable-l3bank                            0x1000000000000014      0
>> error-gt1-fatal-subslice                                0x1000000000000015      0
>> error-gt1-fatal-l3bank                                  0x1000000000000016      0
>> error-gt1-sgunit-correctable                            0x1000000000000017      0
>> error-gt1-sgunit-nonfatal                               0x1000000000000018      0
>> error-gt1-sgunit-fatal                                  0x1000000000000019      0
>> error-gt1-soc-fatal-psf-csc-0                           0x100000000000001a      0
>> error-gt1-soc-fatal-psf-csc-1                           0x100000000000001b      0
>> error-gt1-soc-fatal-psf-csc-2                           0x100000000000001c      0
>> error-gt1-soc-fatal-punit                               0x100000000000001d      0
>> error-gt1-soc-fatal-psf-0                               0x100000000000001e      0
>> error-gt1-soc-fatal-psf-1                               0x100000000000001f      0
>> error-gt1-soc-fatal-psf-2                               0x1000000000000020      0
>> error-gt1-soc-fatal-cd0                                 0x1000000000000021      0
>> error-gt1-soc-fatal-cd0-mdfi                            0x1000000000000022      0
>> error-gt1-soc-fatal-mdfi-east                           0x1000000000000023      0
>> error-gt1-soc-fatal-mdfi-south                          0x1000000000000024      0
>> error-gt1-soc-fatal-hbm-ss0-0                           0x1000000000000025      0
>> error-gt1-soc-fatal-hbm-ss0-1                           0x1000000000000026      0
>> error-gt1-soc-fatal-hbm-ss0-2                           0x1000000000000027      0
>> error-gt1-soc-fatal-hbm-ss0-3                           0x1000000000000028      0
>> error-gt1-soc-fatal-hbm-ss0-4                           0x1000000000000029      0
>> error-gt1-soc-fatal-hbm-ss0-5                           0x100000000000002a      0
>> error-gt1-soc-fatal-hbm-ss0-6                           0x100000000000002b      0
>> error-gt1-soc-fatal-hbm-ss0-7                           0x100000000000002c      0
>> error-gt1-soc-fatal-hbm-ss1-0                           0x100000000000002d      0
>> error-gt1-soc-fatal-hbm-ss1-1                           0x100000000000002e      0
>> error-gt1-soc-fatal-hbm-ss1-2                           0x100000000000002f      0
>> error-gt1-soc-fatal-hbm-ss1-3                           0x1000000000000030      0
>> error-gt1-soc-fatal-hbm-ss1-4                           0x1000000000000031      0
>> error-gt1-soc-fatal-hbm-ss1-5                           0x1000000000000032      0
>> error-gt1-soc-fatal-hbm-ss1-6                           0x1000000000000033      0
>> error-gt1-soc-fatal-hbm-ss1-7                           0x1000000000000034      0
>> error-gt1-soc-fatal-hbm-ss2-0                           0x1000000000000035      0
>> error-gt1-soc-fatal-hbm-ss2-1                           0x1000000000000036      0
>> error-gt1-soc-fatal-hbm-ss2-2                           0x1000000000000037      0
>> error-gt1-soc-fatal-hbm-ss2-3                           0x1000000000000038      0
>> error-gt1-soc-fatal-hbm-ss2-4                           0x1000000000000039      0
>> error-gt1-soc-fatal-hbm-ss2-5                           0x100000000000003a      0
>> error-gt1-soc-fatal-hbm-ss2-6                           0x100000000000003b      0
>> error-gt1-soc-fatal-hbm-ss2-7                           0x100000000000003c      0
>> error-gt1-soc-fatal-hbm-ss3-0                           0x100000000000003d      0
>> error-gt1-soc-fatal-hbm-ss3-1                           0x100000000000003e      0
>> error-gt1-soc-fatal-hbm-ss3-2                           0x100000000000003f      0
>> error-gt1-soc-fatal-hbm-ss3-3                           0x1000000000000040      0
>> error-gt1-soc-fatal-hbm-ss3-4                           0x1000000000000041      0
>> error-gt1-soc-fatal-hbm-ss3-5                           0x1000000000000042      0
>> error-gt1-soc-fatal-hbm-ss3-6                           0x1000000000000043      0
>> error-gt1-soc-fatal-hbm-ss3-7                           0x1000000000000044      0
>>
>> wait on a error event:
>>
>> $ ./drm_ras WAIT_ON_EVENT --device=drm:/dev/dri/card1
>> waiting for error event
>> error event received
>> counter value 0
>>
>> list all errors:
>>
>> $ ./drm_ras LIST_ERRORS --device=drm:/dev/dri/card1
>> name                                                    config-id
>>
>> error-gt0-correctable-guc                               0x0000000000000001
>> error-gt0-correctable-slm                               0x0000000000000003
>> error-gt0-correctable-eu-ic                             0x0000000000000004
>> error-gt0-correctable-eu-grf                            0x0000000000000005
>> error-gt0-fatal-guc                                     0x0000000000000009
>> error-gt0-fatal-slm                                     0x000000000000000d
>> error-gt0-fatal-eu-grf                                  0x000000000000000f
>> error-gt0-fatal-fpu                                     0x0000000000000010
>> error-gt0-fatal-tlb                                     0x0000000000000011
>> error-gt0-fatal-l3-fabric                               0x0000000000000012
>> error-gt0-correctable-subslice                          0x0000000000000013
>> error-gt0-correctable-l3bank                            0x0000000000000014
>> error-gt0-fatal-subslice                                0x0000000000000015
>> error-gt0-fatal-l3bank                                  0x0000000000000016
>> error-gt0-sgunit-correctable                            0x0000000000000017
>> error-gt0-sgunit-nonfatal                               0x0000000000000018
>> error-gt0-sgunit-fatal                                  0x0000000000000019
>> error-gt0-soc-fatal-psf-csc-0                           0x000000000000001a
>> error-gt0-soc-fatal-psf-csc-1                           0x000000000000001b
>> error-gt0-soc-fatal-psf-csc-2                           0x000000000000001c
>> error-gt0-soc-fatal-punit                               0x000000000000001d
>> error-gt0-soc-fatal-psf-0                               0x000000000000001e
>> error-gt0-soc-fatal-psf-1                               0x000000000000001f
>> error-gt0-soc-fatal-psf-2                               0x0000000000000020
>> error-gt0-soc-fatal-cd0                                 0x0000000000000021
>> error-gt0-soc-fatal-cd0-mdfi                            0x0000000000000022
>> error-gt0-soc-fatal-mdfi-east                           0x0000000000000023
>> error-gt0-soc-fatal-mdfi-south                          0x0000000000000024
>> error-gt0-soc-fatal-hbm-ss0-0                           0x0000000000000025
>> error-gt0-soc-fatal-hbm-ss0-1                           0x0000000000000026
>> error-gt0-soc-fatal-hbm-ss0-2                           0x0000000000000027
>> error-gt0-soc-fatal-hbm-ss0-3                           0x0000000000000028
>> error-gt0-soc-fatal-hbm-ss0-4                           0x0000000000000029
>> error-gt0-soc-fatal-hbm-ss0-5                           0x000000000000002a
>> error-gt0-soc-fatal-hbm-ss0-6                           0x000000000000002b
>> error-gt0-soc-fatal-hbm-ss0-7                           0x000000000000002c
>> error-gt0-soc-fatal-hbm-ss1-0                           0x000000000000002d
>> error-gt0-soc-fatal-hbm-ss1-1                           0x000000000000002e
>> error-gt0-soc-fatal-hbm-ss1-2                           0x000000000000002f
>> error-gt0-soc-fatal-hbm-ss1-3                           0x0000000000000030
>> error-gt0-soc-fatal-hbm-ss1-4                           0x0000000000000031
>> error-gt0-soc-fatal-hbm-ss1-5                           0x0000000000000032
>> error-gt0-soc-fatal-hbm-ss1-6                           0x0000000000000033
>> error-gt0-soc-fatal-hbm-ss1-7                           0x0000000000000034
>> error-gt0-soc-fatal-hbm-ss2-0                           0x0000000000000035
>> error-gt0-soc-fatal-hbm-ss2-1                           0x0000000000000036
>> error-gt0-soc-fatal-hbm-ss2-2                           0x0000000000000037
>> error-gt0-soc-fatal-hbm-ss2-3                           0x0000000000000038
>> error-gt0-soc-fatal-hbm-ss2-4                           0x0000000000000039
>> error-gt0-soc-fatal-hbm-ss2-5                           0x000000000000003a
>> error-gt0-soc-fatal-hbm-ss2-6                           0x000000000000003b
>> error-gt0-soc-fatal-hbm-ss2-7                           0x000000000000003c
>> error-gt0-soc-fatal-hbm-ss3-0                           0x000000000000003d
>> error-gt0-soc-fatal-hbm-ss3-1                           0x000000000000003e
>> error-gt0-soc-fatal-hbm-ss3-2                           0x000000000000003f
>> error-gt0-soc-fatal-hbm-ss3-3                           0x0000000000000040
>> error-gt0-soc-fatal-hbm-ss3-4                           0x0000000000000041
>> error-gt0-soc-fatal-hbm-ss3-5                           0x0000000000000042
>> error-gt0-soc-fatal-hbm-ss3-6                           0x0000000000000043
>> error-gt0-soc-fatal-hbm-ss3-7                           0x0000000000000044
>> error-gt0-gsc-correctable-sram-ecc                      0x0000000000000045
>> error-gt0-gsc-nonfatal-mia-shutdown                     0x0000000000000046
>> error-gt0-gsc-nonfatal-mia-int                          0x0000000000000047
>> error-gt0-gsc-nonfatal-sram-ecc                         0x0000000000000048
>> error-gt0-gsc-nonfatal-wdg-timeout                      0x0000000000000049
>> error-gt0-gsc-nonfatal-rom-parity                       0x000000000000004a
>> error-gt0-gsc-nonfatal-ucode-parity                     0x000000000000004b
>> error-gt0-gsc-nonfatal-glitch-det                       0x000000000000004c
>> error-gt0-gsc-nonfatal-fuse-pull                        0x000000000000004d
>> error-gt0-gsc-nonfatal-fuse-crc-check                   0x000000000000004e
>> error-gt0-gsc-nonfatal-selfmbist                        0x000000000000004f
>> error-gt0-gsc-nonfatal-aon-parity                       0x0000000000000050
>> error-gt1-correctable-guc                               0x1000000000000001
>> error-gt1-correctable-slm                               0x1000000000000003
>> error-gt1-correctable-eu-ic                             0x1000000000000004
>> error-gt1-correctable-eu-grf                            0x1000000000000005
>> error-gt1-fatal-guc                                     0x1000000000000009
>> error-gt1-fatal-slm                                     0x100000000000000d
>> error-gt1-fatal-eu-grf                                  0x100000000000000f
>> error-gt1-fatal-fpu                                     0x1000000000000010
>> error-gt1-fatal-tlb                                     0x1000000000000011
>> error-gt1-fatal-l3-fabric                               0x1000000000000012
>> error-gt1-correctable-subslice                          0x1000000000000013
>> error-gt1-correctable-l3bank                            0x1000000000000014
>> error-gt1-fatal-subslice                                0x1000000000000015
>> error-gt1-fatal-l3bank                                  0x1000000000000016
>> error-gt1-sgunit-correctable                            0x1000000000000017
>> error-gt1-sgunit-nonfatal                               0x1000000000000018
>> error-gt1-sgunit-fatal                                  0x1000000000000019
>> error-gt1-soc-fatal-psf-csc-0                           0x100000000000001a
>> error-gt1-soc-fatal-psf-csc-1                           0x100000000000001b
>> error-gt1-soc-fatal-psf-csc-2                           0x100000000000001c
>> error-gt1-soc-fatal-punit                               0x100000000000001d
>> error-gt1-soc-fatal-psf-0                               0x100000000000001e
>> error-gt1-soc-fatal-psf-1                               0x100000000000001f
>> error-gt1-soc-fatal-psf-2                               0x1000000000000020
>> error-gt1-soc-fatal-cd0                                 0x1000000000000021
>> error-gt1-soc-fatal-cd0-mdfi                            0x1000000000000022
>> error-gt1-soc-fatal-mdfi-east                           0x1000000000000023
>> error-gt1-soc-fatal-mdfi-south                          0x1000000000000024
>> error-gt1-soc-fatal-hbm-ss0-0                           0x1000000000000025
>> error-gt1-soc-fatal-hbm-ss0-1                           0x1000000000000026
>> error-gt1-soc-fatal-hbm-ss0-2                           0x1000000000000027
>> error-gt1-soc-fatal-hbm-ss0-3                           0x1000000000000028
>> error-gt1-soc-fatal-hbm-ss0-4                           0x1000000000000029
>> error-gt1-soc-fatal-hbm-ss0-5                           0x100000000000002a
>> error-gt1-soc-fatal-hbm-ss0-6                           0x100000000000002b
>> error-gt1-soc-fatal-hbm-ss0-7                           0x100000000000002c
>> error-gt1-soc-fatal-hbm-ss1-0                           0x100000000000002d
>> error-gt1-soc-fatal-hbm-ss1-1                           0x100000000000002e
>> error-gt1-soc-fatal-hbm-ss1-2                           0x100000000000002f
>> error-gt1-soc-fatal-hbm-ss1-3                           0x1000000000000030
>> error-gt1-soc-fatal-hbm-ss1-4                           0x1000000000000031
>> error-gt1-soc-fatal-hbm-ss1-5                           0x1000000000000032
>> error-gt1-soc-fatal-hbm-ss1-6                           0x1000000000000033
>> error-gt1-soc-fatal-hbm-ss1-7                           0x1000000000000034
>> error-gt1-soc-fatal-hbm-ss2-0                           0x1000000000000035
>> error-gt1-soc-fatal-hbm-ss2-1                           0x1000000000000036
>> error-gt1-soc-fatal-hbm-ss2-2                           0x1000000000000037
>> error-gt1-soc-fatal-hbm-ss2-3                           0x1000000000000038
>> error-gt1-soc-fatal-hbm-ss2-4                           0x1000000000000039
>> error-gt1-soc-fatal-hbm-ss2-5                           0x100000000000003a
>> error-gt1-soc-fatal-hbm-ss2-6                           0x100000000000003b
>> error-gt1-soc-fatal-hbm-ss2-7                           0x100000000000003c
>> error-gt1-soc-fatal-hbm-ss3-0                           0x100000000000003d
>> error-gt1-soc-fatal-hbm-ss3-1                           0x100000000000003e
>> error-gt1-soc-fatal-hbm-ss3-2                           0x100000000000003f
>> error-gt1-soc-fatal-hbm-ss3-3                           0x1000000000000040
>> error-gt1-soc-fatal-hbm-ss3-4                           0x1000000000000041
>> error-gt1-soc-fatal-hbm-ss3-5                           0x1000000000000042
>> error-gt1-soc-fatal-hbm-ss3-6                           0x1000000000000043
>> error-gt1-soc-fatal-hbm-ss3-7                           0x1000000000000044
>>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>> Cc: Oded Gabbay <ogabbay@kernel.org>
>>
>>
>> Aravind Iddamsetty (5):
>>   drm/netlink: Add netlink infrastructure
>>   drm/xe/RAS: Register a genl netlink family
>>   drm/xe/RAS: Expose the error counters
>>   drm/netlink: define multicast groups
>>   drm/xe/RAS: send multicast event on occurrence of an error
>>
>>  drivers/gpu/drm/xe/Makefile          |   1 +
>>  drivers/gpu/drm/xe/xe_device.c       |   3 +
>>  drivers/gpu/drm/xe/xe_device_types.h |   2 +
>>  drivers/gpu/drm/xe/xe_irq.c          |  32 ++
>>  drivers/gpu/drm/xe/xe_module.c       |   2 +
>>  drivers/gpu/drm/xe/xe_netlink.c      | 526 +++++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_netlink.h      |  14 +
>>  include/uapi/drm/drm_netlink.h       |  81 +++++
>>  include/uapi/drm/xe_drm.h            |  64 ++++
>>  9 files changed, 725 insertions(+)
>>  create mode 100644 drivers/gpu/drm/xe/xe_netlink.c
>>  create mode 100644 drivers/gpu/drm/xe/xe_netlink.h
>>  create mode 100644 include/uapi/drm/drm_netlink.h
>>
>> --
>> 2.25.1
>>
