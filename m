Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3636B4E5509
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 16:19:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B03A310E163;
	Wed, 23 Mar 2022 15:19:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2050.outbound.protection.outlook.com [40.107.220.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6B6E10E163;
 Wed, 23 Mar 2022 15:19:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GT5UT0Twop/VBQJxP3doyKm7K+eHQdwbQE/AsMJLkvKy2mSSoGpgQZabZfVh0DqLX5J5/oFSvPEWBP2OCUqCT4tqH++KqRn5A/WUvJnZKzs6F2Slpvw6HVIbf+Yf50Safq2sajvNLB3lht5i/+UVvpaGeqQg7MN2M87zynjc4fFXediPVSLcszUYAQCcmfbgRntjOVlcWB3oacIhllgGv8Wr2XOj1AkHMlPniawol3W5QGvu7nFfiNlGzb6JzUM9BLOVw0hxMygzdO6e/OKvw0eFluuE8/p90QdmCaFjRIHDe6v5ujDGQxPmknnSn7ma5yUcf7dvY5YFz/EOmFYWBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8qHq2j9GoCWG26oI3HAwlyJQTKWYTaM7d62EA9S/Qbs=;
 b=mjHXLFZVQKiwwcfGWJwBvlSW3zVn0/5G87JF5C8cEEiFww8A6NDKikoiy0QXBdSIGe9IewCoa8NrAgT5l+N7Fe43FHEOc5wB0ne5W8IWA6QyTucUDkIBDfDieQyL+3k6IqcmXSACx+qDdwAnHd9AERNil7Wh7B9ni4qSbLcqdWlXLyy1wGxcWQho7Jh3niQfR7x7/2eomhUsHPicv1ok/exFYd9ifUiYkmJEeSqSvHm+wBCp1LX+2J1I73k8qe3JpA73AQQoumvFm5S9aNWJ3A0IKAK0PfwI0QQUl+Kz/YNlZHidc15AARvr4hlI9x1PgvSh0kHUQLL7fQ4sZwVP8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8qHq2j9GoCWG26oI3HAwlyJQTKWYTaM7d62EA9S/Qbs=;
 b=G1Cx4oMzPcRI7bbPMm0iISC6FXyElPv1dLMiowqCIasdrGUaHzqpaaJR5XtFN7KwDPzJdI+GdcfxcdWph0v0iX8/wJJbGI2R1EmpwRdZDPPM2ozuML/o0gBbzPOC4JAknziPaItGH2PheHuR1s8A4/m0p2qDuNekmX5hSFnhHiw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3589.namprd12.prod.outlook.com (2603:10b6:a03:df::29)
 by BN6PR1201MB0084.namprd12.prod.outlook.com (2603:10b6:405:57::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Wed, 23 Mar
 2022 15:19:26 +0000
Received: from BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::54ea:af56:9e64:7e51]) by BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::54ea:af56:9e64:7e51%7]) with mapi id 15.20.5081.023; Wed, 23 Mar 2022
 15:19:25 +0000
Message-ID: <e0de20aa-fcd9-f847-783d-cd4794ca05be@amd.com>
Date: Wed, 23 Mar 2022 16:19:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Commit messages (was: [PATCH v11] drm/amdgpu: add drm buddy
 support to amdgpu)
Content-Language: en-US
To: Daniel Stone <daniel@fooishbar.org>
References: <20220323062552.228429-1-Arunpravin.PaneerSelvam@amd.com>
 <7addb3e7-d265-c1a7-d449-7d0056f06d63@molgen.mpg.de>
 <fc60c561-c12a-c031-9558-abae3e3474ec@amd.com>
 <6f0888a2-f74d-f41f-d593-a8362e7dc673@molgen.mpg.de>
 <398f8851-d37b-4020-24ce-8f2ab9723e40@amd.com>
 <CAPj87rMETV9UkpbGRYAT3mjVhRtW75m0e9OLON6_+gdcD0Fo2Q@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAPj87rMETV9UkpbGRYAT3mjVhRtW75m0e9OLON6_+gdcD0Fo2Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0416.eurprd06.prod.outlook.com
 (2603:10a6:20b:461::10) To BYAPR12MB3589.namprd12.prod.outlook.com
 (2603:10b6:a03:df::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3376b83-82c9-468b-8ec0-08da0ce083e1
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0084:EE_
X-Microsoft-Antispam-PRVS: <BN6PR1201MB0084BF98C3A63DC03939BC4783189@BN6PR1201MB0084.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HUD3F3UNjv9lgX8l0lYOQ7XeWQOqDSqYDNpvlxTfGgW1NEOvA8CvfvNnvAKDpNUtoisdgRG/J+ECBc7oTfe9pOUo/BmXUq/qivXKq3EOUNXNWmEmMOnPCoHzwGvUHFKeeAVU7OjL/CW0sWbJCVuqTuNrRqFTRJvEV1h3/syD/J1nxGidF/M0btBYtJgfYxvC0xW9NhCOUn5zQFkUseaw65PE/RUFq4Wlx3agTv3g7AluapRroU8wvP4kWO8JQoDjnT3MQ97ije66bp5PHzqdNwfAv3fNo0WYgQZChPgMFnYxFjGNAY2EqhOBN/28AePzaTjxjIQpxls/NZEetp+dNXK+3L4FayZg6xZfNem4GekZz3K5OcG8hzYmNEtULYvSNEGYgQ9lMXu8Vtnrckg8OO8zUKPig4diAZ1DVDYCU9DmiJbKAY+ShfSbY/VbH5f0sC/K5j62fQhpVATkFb93wZs/NDSrigYShusaeSk1BI4CwO/je1UUDAO/Zq9VlRwzX0aO771ZcHGxxBf/Y6Sl1y2v3suwYOutjPkwxNulBKY0HmmI84QERk+NkhRE0wVguWGP4tktN3woGfFVg8WTgQhk+xveW7732gGjRkj3ZEzmGHI71/0WcAtrRZ1EQNgf6Ox65W7neej5O4KqANIGdLIsY74Sq/stAEMZxLvZ2mAF1dUjZJBT/CY2kjc47IcH+0Lhkp1RQmAjuRZk7YubH+lE2zRfrxhawwNlKgtj32s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3589.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(6486002)(86362001)(38100700002)(31696002)(5660300002)(508600001)(8936002)(6666004)(15650500001)(2906002)(6916009)(54906003)(316002)(66476007)(66556008)(4326008)(8676002)(66946007)(186003)(36756003)(6512007)(2616005)(31686004)(66574015)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXdCYjNtVEZCdjNpM2U5NXVQQXhaVXZJMnRVUEl4a0tQNndVbmZWK1lja0cz?=
 =?utf-8?B?aFE4RUMzWnZ1SXlqWVJ5U0VKRzFtRzJKT1JKK2hEZ0tYY3B6VWNkeUU2L1Vl?=
 =?utf-8?B?MGl3bVdJUGJkbHM4Y1lqVjFtd0orMytvZ3FHd0N3T1c2WWlCSW5DSnU3VUxn?=
 =?utf-8?B?TW0yK0V2ejhwemErTmZVaUJ3MmFlRm5aeEhkSm5yYldOVHZrYjFrY3RSRlpC?=
 =?utf-8?B?ZExaQnlDaExDTmZwV3hhQTM0TmVmNTd0Y20zLzVpb3Vnai9kbUpoajJ1N0JT?=
 =?utf-8?B?b2ViNUtSNGpSUTcxeWxPM1lvNGwwRXQ4cmdQN24yZ0Q4NWtPT1RjR0p1NTRu?=
 =?utf-8?B?WVhDY2VFUVFUZkhldldIZXIvZkVmRGdkdzBsNVJ5N2JkVVF3MzJxbnVQUGZH?=
 =?utf-8?B?ZFI1MzhHYTN0NWZMdjluM0tiNlFkVEovMy9raGNXUFdoS1RjL2pUWjBrSTNS?=
 =?utf-8?B?STN5UDllSC84eDQxWTB2NkxLTGRpWU5yRkplN2ZERUVOeWJTK0JselJXWGZy?=
 =?utf-8?B?SCtOUWtHRndyYm9wdlBsb0JIRmNGVlZrRmxVWkdDZHpwSkNDSkQySzNsSWcw?=
 =?utf-8?B?NTlKdnZkR0NKS3VHZVBOU2tJeVFlV011N3MyUHBGTTNjTkV1U05mbkxIcnFP?=
 =?utf-8?B?OWxCMitlbnpHMWlkMDU0L0VFeE5sNStkM2JDb2N1dXlqWWwyYVpqN1dtN1NP?=
 =?utf-8?B?NWJpTXAvNGpUUzU2Qkk2bkxFZEd1bWp4OGFZZTh1dGg5NExIREtDUnNWczI5?=
 =?utf-8?B?bTNMV29wcUVsY1dFNFVsSzE2Y0locHNNdUMrVEFWVnZxbFd3azdXK0k3SmJD?=
 =?utf-8?B?MUFkbEdyOWpaR3l0QVE3QlFaNlBWQ1FuTGFJcEk3amw0Y255TmsyRkZwcWxw?=
 =?utf-8?B?Nmc5ZGpEcTE3NE9EcHdzRWU3Uk1HcmhGVGpuTk54VGxXMGRydVN4NEZJWmRC?=
 =?utf-8?B?dEtXNXV1blpCNTZvNVNaaDBIN2xkWnFOM3RiVGdTWmRuT0hJNENKVzB5RVls?=
 =?utf-8?B?enI4bEovT3ByUHdqWUkxQkpiVGVIUm9JZWtEL3RMN3pkVlZmeWVPYUhEOUIv?=
 =?utf-8?B?Nk5SV2NjdTI3Qml0OEZJNFRaVk9PN29QdEFuamVGYXROR0htR2FNT2xQYTdM?=
 =?utf-8?B?bEhGS1Q4Q3VOVHJNKzN0WiszMmlBWGNOd0Z0bGpwWkJURzk5eWVqMFRYYW0y?=
 =?utf-8?B?Q2FpVGw0UDhiK2M0Lzc5R2laVithZTlneHRxdVY4VmpSaERRV24vb0dXaEJ6?=
 =?utf-8?B?QmRDUUZLTExGU2d2TXFrL1RVcmpwR2ZDU2lvMytHalBiQkFEVklycjZqZUhU?=
 =?utf-8?B?aDJyV01oVXVjNThQRm5scW1POUF6Y05uVFdCV1lYTVBUcEhWajhtMkJId2Nx?=
 =?utf-8?B?N0w2R0VWQXdtU25oTkY2dDh0ZWpxRE9ueldaQ05VL21nME1aN0NNWmtxNDI3?=
 =?utf-8?B?RDBnQmN2b0dwd1poTHdYbTI0V3I1c1lZQjQwRzhTa3pyMktEbDVZSVN5ZlIz?=
 =?utf-8?B?b092a3RyeXhxdm9aM0poVnh2dlpQWTh4dkdqS0k1V3R3cVc0TlRWOXdaSjlp?=
 =?utf-8?B?Ym13MVhianIvdWFvcjN4ZVc0bUNtWjBGWmp0NmxTUVJ5NitaUWFKZ2NWUEJ6?=
 =?utf-8?B?T0JGTVVPNmpLUUpRQ2VKMlE2Ym9VbjZaZkJUSXhrZ3RCRCsrOXRzcEZrZm1q?=
 =?utf-8?B?OVFOMnp3amhhSFF5WVBDbXd2a1AyQ1hCbVgzMGlpaTVYcEZ3ejZMcksrZWdp?=
 =?utf-8?B?bjRkUVNvWTBsSFp4a0JVbnRZcnlqdmNQYzRJNFg4a01XRWJOSGhWVWxJNTg1?=
 =?utf-8?B?ODl0RmpYbzhyNVZhck80V1NlbEdhT1BDcEdVVlkwZU5ab0c2MTNWbWFaSW1v?=
 =?utf-8?B?akZnOHAyTEE0eGM1bTRhUEdMeEpMdGxmbVFCR0JqVlZ5OU5xc1k4ZXJlV0FS?=
 =?utf-8?B?OTUzMXNDWmpkUXB6NnFXWkI1V2tuSXhha1RqV3VPY2Y5K0Z0RjgvcjIwVEJ1?=
 =?utf-8?B?dm9OYi9VLzlLK2dsMnlVcmhGSHFCVTZLeTkwK05EdTBJMFBJOURoOGpJMWF0?=
 =?utf-8?Q?3MQyw2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3376b83-82c9-468b-8ec0-08da0ce083e1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3589.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2022 15:19:25.8026 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RLg6ZOoN9OPeA0fGlwmCumFRwHTNnaJM+m7sluQLYTL1lkW2zhojaF8nl7lJM/Xm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0084
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>,
 Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 23.03.22 um 15:00 schrieb Daniel Stone:
> On Wed, 23 Mar 2022 at 08:19, Christian König <christian.koenig@amd.com> wrote:
>> Am 23.03.22 um 09:10 schrieb Paul Menzel:
>>> Sorry, I disagree. The motivation needs to be part of the commit
>>> message. For example see recent discussion on the LWN article
>>> *Donenfeld: Random number generator enhancements for Linux 5.17 and
>>> 5.18* [1].
>>>
>>> How much the commit message should be extended, I do not know, but the
>>> current state is insufficient (too terse).
>> Well the key point is it's not about you to judge that.
>>
>> If you want to complain about the commit message then come to me with
>> that and don't request information which isn't supposed to be publicly
>> available.
>>
>> So to make it clear: The information is intentionally hold back and not
>> made public.
> In that case, the code isn't suitable to be merged into upstream
> trees; it can be resubmitted when it can be explained.

Well what Paul is requesting here are business information, not 
technical information.

In other words we perfectly explained why it is technically necessary 
already which is sufficient.

Regards,
Christian.

>
> Cheers,
> Daniel

