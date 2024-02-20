Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF4D85BF68
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 16:04:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33DA810E4A4;
	Tue, 20 Feb 2024 15:04:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fbJQ8qWe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2065.outbound.protection.outlook.com [40.107.94.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6186810E4A4
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 15:04:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NHWp1FDdUkbkC0LfdYiyjhE1nNeK3ag4tbh7fzoeEEg+9HRg9/n60Z0YiO6NmwVQFtUGPsNJRY/beTjQJl+wTCnX/40KHmkHBbY9dZ6jY6+EajzIuvaZrKer3KjrpWe0XrP7T9m3iZ/6ceLhngfxJeRjcp/fEq9rb/Zlh7OfHkho0GQxpdF5UL9s+RRYcNoMDBjFzVukHCajmYOuE0FSneTN04hQr2y45Q9ZMLN/OzdOswT6ilGZgmSv5b1e9+WoG4FUlNZkjbwPa9UuucTXv4buyWBnrVWzKO8EH8/0GlEAUfU59RZKX5Y+JxaLaae9OpxIwvacslmuymJ/v56dVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3N4dna1QUpeAPw6JP5cqNECUTGX/DYXDDYu6xIJ9gJI=;
 b=gQijPH109tJtiMRUwxjGfFZoZ4chJz3knOUSO0HjNC0+JI3GWMobk3Mh8uPtkzVnefr1egd8stHxEotYgBjPhESaKxW1XWDZr8Ym0QIMvuEJ/QYeGI5zeh72u+eB2CcaqUh7nLK1YkowT225Vmm/ggBDRov7hfdJemtuu4TwaLSgpKnIaOKO83AdMqxYHEwXwYnb403X3SgJ1YRmxEtw55bDKsJ2wKdtApTs3TIuXxz73xvwYnmRNlYmYDccbf/GPjqhebcuTA2JNXSn/FjTYFmExYLu/7jTqDQdR+gECxBqp20CztILAAWQvsMM2XG6ZJpeu+8nnSEmrLUA1E3dYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3N4dna1QUpeAPw6JP5cqNECUTGX/DYXDDYu6xIJ9gJI=;
 b=fbJQ8qWeYcpogqEBqKPDlwu26riEl5DpR7e5JFiWMw4hZx8mNn5mDKkoE74shVxgcqBr2/SXbiuYLdgSBNAaKio9ZflRjKUGVu+FSjGQh57rvEeQOs5/QHEGhGTdAipAGRMqXmhealf+8zI73uE7UGxJqV1r0XWzrrMgdyrkHBw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by LV8PR12MB9269.namprd12.prod.outlook.com (2603:10b6:408:1fe::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.19; Tue, 20 Feb
 2024 15:04:04 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7316.018; Tue, 20 Feb 2024
 15:04:04 +0000
Content-Type: multipart/alternative;
 boundary="------------zbVsIlHE2Alsq0lH4D52SWCD"
Message-ID: <535f9089-b988-45ac-b3f3-a7d593861723@amd.com>
Date: Tue, 20 Feb 2024 16:03:57 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Running ttm_device_test leads to list_add corruption. prev->next
 should be next (ffffffffc05cd428), but was 6b6b6b6b6b6b6b6b.
 (prev=ffffa0b1a5c034f0) (kernel 6.7.5)
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>,
 Erhard Furtner <erhard_f@mailbox.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Huang Rui <ray.huang@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Karolina Stolarek <karolina.stolarek@intel.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>
References: <20240219230116.77b8ad68@yea> <ZdRtDOhQGQUm5X4d@archie.me>
 <9cdf0baa-f544-4fa8-bee3-568b790527cc@amd.com>
 <4xggxtkk44m3xcfucbougtuhr66s2pc7tilpnju7xnyw45facb@odsrpqp57kiz>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <4xggxtkk44m3xcfucbougtuhr66s2pc7tilpnju7xnyw45facb@odsrpqp57kiz>
X-ClientProxiedBy: FR0P281CA0067.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::21) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|LV8PR12MB9269:EE_
X-MS-Office365-Filtering-Correlation-Id: 2de34f20-9d91-4304-b503-08dc32252db2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HDOluOaIczbwshWqpY52gIv8HmAxkOAOOxqMHNHGN3E40DNwjllO87Jr+XB95rBCHAjhFyQLUM97qfVK2ByDnqnr4bCEdYTT56rObceuvPIJ2F4EtFXWJmnvHFcPCqEqPZy6Nv2Qvgcyi2+1DRRhtxPgQLFldUcpcLNz3EcPwNTsaLGaR029TTOip/2u9eOvQACtt1QAa7x2IdSwUxjI9WZwniJNG60eGTdsULCl6ejkT8JARAKNMNJIxwxOZfepictFZXi2iQ7qbV/yaN5drln1ukwnTdmARW8QJptbyz0rz6cocEA5FhJeAqN8OqPF4GxSYlrAYVa3/7PYoBYPz+dI7qGhsXasmFgoBu8jXWh21bCvz8wBH+oqz1IIshbOa5cPMn0VwUPEPUEqgrzbjdGtgIAzp/dHItd43j3HYRXfLgNpQUVUJzcCzyt6Aof/kJ7jWQ5NSRVQeOj3dyFGynHu96QjsOIpw6KMbqgOyrc/zYLw45bFKUSO20tdQIjI0SeIgGJEOd77FK71JSYJPLW4Zjn/8ntzkOuN0eEwZ2c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDFpdzZMODRQdC9Wak02WmFaVUdLSkV2ZCtEeW4zdi94ZWJiaHJqZC9TcVZx?=
 =?utf-8?B?UTc1U1FxNHZoWXoyOFVFc29ubDhqeUNNQXl6NmR0NzRTcnlqZENZWWVZNjlC?=
 =?utf-8?B?SjU2bXd0S1BxQ1dFWGRZWkIwUDZpK2g1dUI1RndXRDFsVzZvS1lRcFZpMEhL?=
 =?utf-8?B?SmRhWm5uSVNkQXlmZEUyT1UwbXlPMGRGSVBzTlZ4Ykc4dFNrQTY0NkxlU0Rx?=
 =?utf-8?B?ckFjaVlPN1NibDVTQ3pkRHoyWHJQREhaZ2wrd2pDNExvazJnUFh1bUhhTVZj?=
 =?utf-8?B?cWJ0MndsYmxOUDNRVG9hRWRDR1kzTFVjZmdJM2pxWUlvQzJVUWFpOFB0dGtm?=
 =?utf-8?B?MjdPbmxvTUd4MUtXZ1ZXajB6R1Uza3V1cCtlb2JqQ1NtMVhjMC8wcFEvRmxt?=
 =?utf-8?B?aFdWRk5sUkVmTVcrY0RHWFdBWktGaTJhSng2QzRyTjlUNjY2RGxPQVpCWGg0?=
 =?utf-8?B?UnNEb1RyVHJ2NmNkRnl0bFNrUmttVkEyVWFMNENlRG1tUWRqakRGS1I5Y2to?=
 =?utf-8?B?N0l1dm5zM1VXMkZRMEhxWFkrTFhwM0x6WWxKbGNCM3ZBVzhyNmpKeGI1SXdh?=
 =?utf-8?B?bk0rNUI0UDJJVHU0N0p0Y3VGajVaMkFhcThTdnBjQURmZzE1cTVaN0Vtcm92?=
 =?utf-8?B?SlRlMFdDRERVTVBMeHYrOW5taG1CdExGcG9XRWpOTUNldlU2cFk2ZHA1M3B6?=
 =?utf-8?B?d2s1L3gzOUxSakhnVXpBWDUzRE44VHlWelV1b3dMc2tzVW1GZFZETGo4emFy?=
 =?utf-8?B?RS9YT1lBWE5CZVlNWDNBQmZFWWRoSnFreklsVG9wZVFKZU01TTEzVFZGMlNx?=
 =?utf-8?B?L2I0RVlYOWxaSnFnSFd6Z0hwcm1XMTc4TnZHeHZWNzVSa2hvY1h3RVQ0YVlF?=
 =?utf-8?B?KzJ2STlYS3pZcHNwemJlN3hQcnVheS9VN1dYVUtQVHRvRkJIemdjSUxIeTRy?=
 =?utf-8?B?azltM3pYK2RVOWFPWGVubEp4SVYybWlCNEpUSTJHQi9yV2JuZTVmNW0xeHc1?=
 =?utf-8?B?c0ZYeS8wbTVUY1BYZXFOR1FYZzNMbzNJZnJ1RG9DK3FGSEpkV2d3U0ZKSktC?=
 =?utf-8?B?SE9IR052dy91UGEwTXBOTjVDWUxnZFZ4NDFCYVptdjBXR1JtUWJMVzZJMjJI?=
 =?utf-8?B?TU1nb2hNdkxMb1lzdFkvL0Q3cmV5OW9CSjFQcFR1a2p2dk1WSjU2aktGc0ky?=
 =?utf-8?B?TjNqVGEyQ0txSnd5TzFqdnlZODlwdTJXNTgvZEd5QnFrdUVVbU5GK3VHQ25Q?=
 =?utf-8?B?YWRLdjVOS3RlV1NpS0tuNHpSQ1hpMFB0ckNja2cyWXJJYVRSOG5hUDVDMFZp?=
 =?utf-8?B?WVltd1Z2VVRxdnAzUWludHpmaWR1dXBvK01CQXJwd250dFdaL2t1bERZOWNJ?=
 =?utf-8?B?ZHE1SEduWFpJVDQrZGcvTWZCNXl4ckxiZEUrdGt6VkRqQVE4YTRhWTlQYmVE?=
 =?utf-8?B?MnlMYS9zSUhYNW5wakRjT1hHY0d1NU8wN3c3dWJDRjNTNWJQN0VUYlVxRlhj?=
 =?utf-8?B?UWsyVVg2L0xDNWt3QytHNFRSOHhqZGlkM1YwUWh5SnZ6QmMwRHBqNHdWNW5N?=
 =?utf-8?B?UTZ6V2Rmd3RPYThLOUhMUmJ3RTNPeCtYdFZ0UGxiKzd2ZWUrOVNiY2k4NXgx?=
 =?utf-8?B?WStxanZPZ3I1KzJnSWhEVWgvMldMNWUrTW1Va0NwSGVNam1McGlDV2ZiN2FL?=
 =?utf-8?B?Vi9SaDBsYUVFMG1nTkZzRm50cXcrYVlteThiUDhmejI2U2xTV2VwQVJCMStX?=
 =?utf-8?B?SmpCdVFzcXkrb1J1SmJCSXZOYVVtKzNDMUluNk9Oa3h6Mzd0M0hpZ05Za0ts?=
 =?utf-8?B?Zmo1bEp0K2NaSkpZYmsvZENtdEo4L1I0VURVWU5BNDVNQjcyaCtOVTA1WUJ4?=
 =?utf-8?B?VExoQnIvNFZOVDZoSGlVTkJwSTU0NTJNV2l3TDdiRzZKM3BqQVhmNlE1TExT?=
 =?utf-8?B?cjNEc2xWWis5dGwxMEo1RksxalFPaElQTFlOTHc4QkRDVlhpalh0TTFJaVZH?=
 =?utf-8?B?N2RmbnFpM1RraU5ndnk1eThlczlSU3ZLL3RzQnYvYlFSZDBWZEpSajFaaXY3?=
 =?utf-8?B?Szl1L1lnSU1pUFpCNkZnVGEvemd2Z3RiamJtMnBCeE5nR2EyYURYbnRINzQ1?=
 =?utf-8?Q?3HnlmUgJP5CFcTTX5O4IrMBEb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2de34f20-9d91-4304-b503-08dc32252db2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 15:04:04.4279 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 41fAPPINKuHtagfKe4Ge3zYH9XxccReKjE323V8D9n0ppsNi7Wz1emkPorfL2Izy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9269
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------zbVsIlHE2Alsq0lH4D52SWCD
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 20.02.24 um 15:56 schrieb Maxime Ripard:
> On Tue, Feb 20, 2024 at 02:28:53PM +0100, Christian König wrote:
>> [SNIP]
>> This kunit test is not meant to be run on real hardware, but rather just as
>> stand a long kunit tests within user mode linux. I was assuming that it
>> doesn't even compiles on bare metal.
>>
>> We should probably either double check the kconfig options to prevent
>> compiling it or modify the test so that it can run on real hardware as well.
> I think any cross-compiled kunit run will be impossible to differentiate
> from running on real hardware. We should just make it work there.

The problem is what the unit test basically does is registering and 
destroying a dummy device to see if initializing and tear down of the 
global pools work correctly.

If you run on real hardware and have a real device additionally to the 
dummy device the reference count of the global pool never goes down to 
zero and so it is never torn down.

So running this test just doesn't make any sense in that environment. 
Any idea how to work around that?

Thanks,
Christian.

>
> Maxime

--------------zbVsIlHE2Alsq0lH4D52SWCD
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 20.02.24 um 15:56 schrieb Maxime Ripard:<br>
    <blockquote type="cite" cite="mid:4xggxtkk44m3xcfucbougtuhr66s2pc7tilpnju7xnyw45facb@odsrpqp57kiz">
      <pre class="moz-quote-pre" wrap="">On Tue, Feb 20, 2024 at 02:28:53PM +0100, Christian König wrote:
</pre>
      <blockquote type="cite">[SNIP]<span style="white-space: pre-wrap">
</span>
        <pre class="moz-quote-pre" wrap="">This kunit test is not meant to be run on real hardware, but rather just as
stand a long kunit tests within user mode linux. I was assuming that it
doesn't even compiles on bare metal.

We should probably either double check the kconfig options to prevent
compiling it or modify the test so that it can run on real hardware as well.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I think any cross-compiled kunit run will be impossible to differentiate
from running on real hardware. We should just make it work there.</pre>
    </blockquote>
    <br>
    The problem is what the unit test basically does is registering and
    destroying a dummy device to see if initializing and tear down of
    the global pools work correctly.<br>
    <br>
    If you run on real hardware and have a real device additionally to
    the dummy device the reference count of the global pool never goes
    down to zero and so it is never torn down.<br>
    <br>
    So running this test just doesn't make any sense in that
    environment. Any idea how to work around that?<br>
    <br>
    Thanks,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:4xggxtkk44m3xcfucbougtuhr66s2pc7tilpnju7xnyw45facb@odsrpqp57kiz">
      <pre class="moz-quote-pre" wrap="">

Maxime
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------zbVsIlHE2Alsq0lH4D52SWCD--
