Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD5F49FEAD
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 18:09:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ACAD10E46E;
	Fri, 28 Jan 2022 17:09:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2067.outbound.protection.outlook.com [40.107.95.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8899C10E455;
 Fri, 28 Jan 2022 17:09:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HhopFBWSjt3C62osILfYA0kJTwe6iz1plB/PpUqDgdmWcns8TpdoF1ygX1H3W0uVTspJhivNKvu6B7yllRs1porfm1unJUGnGZl/LEPTj1XFF0nASQ1yPDMZOrm+lDpjMrZfo1+N1VctLIo6LdMZ3jnZRHfWydyf007CfoZHr4t2ObT8+h9O2RWjQCm8khFQzftaTFMSebBue8av+gYAoFYxXXm1WV5AzYsnkaVGBmvH4LmcAkFWaaFPpZn7CLUSdYtd4o11oqHX8PJIYhghlNTFjfS0W3hA6jwdiA1eDwkXU/fA4oOJli3HudWybOyr+tKn6kAX/Na5U/WVmSHPTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eAtkJH2Dsh18nBHj2c0nNmwIhi+G258gZolBzNFB2eU=;
 b=eRr8aBbGTl7bZJ6Itk9yFk5gUIpaccG18X7RJG8ETNRFe2sraub4oKC5mLJNnPhUJq1QVMSiXYIkU2xbF2OhrowPu5n/PmJxjZXN0ma3G156brav/Md3PIRptN9+OTZ+NBxjTRa5oAM/OUTRW2PFDmxBD69AP7o4c/+fOCgd+iAXFEi0fH82u6wON9PkWmghXbbqMIMuiFyHX5z/PuQsy8/F+Gje3454N1he/VC8+XfhiTDFvr3LkSzZybyyCsV6L7DMB80YC4F1jTLyp7W8j167ankoN61vwq8tlS9tbT5g40Rv50MyQKT7+UZRh63PHXTb0AzQP3fyplpdMlDM2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eAtkJH2Dsh18nBHj2c0nNmwIhi+G258gZolBzNFB2eU=;
 b=Nmgm+KdUzmMpPENWCPVyr8EWXvETGZ3KttqfixAN/HgXFDVDVXKNgU9SX6suT+gbUW+73gIqJ83XszEfhVm0z4QPKfTysOr7WxEMwWtabn+uKRAGGRRxI+qsMn11a3aVFbQJVrWpRjlGnVQWea09hQQDDgoB6C0Ib0Cr9vfmDrk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BN8PR12MB3188.namprd12.prod.outlook.com (2603:10b6:408:6b::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Fri, 28 Jan
 2022 17:09:10 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::971:531c:e4f4:8a9a]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::971:531c:e4f4:8a9a%7]) with mapi id 15.20.4930.019; Fri, 28 Jan 2022
 17:09:10 +0000
Message-ID: <6963d9ea-7ecc-a09f-6256-a2a132782fe8@amd.com>
Date: Fri, 28 Jan 2022 12:09:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 00/10] Add MEMORY_DEVICE_COHERENT for coherent device
 memory mapping
Content-Language: en-US
To: "Sierra Guiza, Alejandro (Alex)" <alex.sierra@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>
References: <20220127030949.19396-1-alex.sierra@amd.com>
 <20220127143258.8da663659948ad1e6f0c0ea8@linux-foundation.org>
 <6434ba24-a219-6a5a-d902-0b48974a0e43@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <6434ba24-a219-6a5a-d902-0b48974a0e43@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQXPR0101CA0031.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:15::44) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 092dfd78-f42a-4d7d-2a9c-08d9e280e644
X-MS-TrafficTypeDiagnostic: BN8PR12MB3188:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB3188E320821C67F8CAC7B93392229@BN8PR12MB3188.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C3nkF4+N9irCXxxMKfagpuR/7jyoyyFMwKbLmVnQVRD0dzyLDyjlc3NDNuylxPFilnS0B+k2tZuK9aSDVQUKnP3kPPGN8kgZkGV0Oy/j28ZvD4uERg11+a7386/sktO0Ewho73l6riuma/XVlo8JBwa68+ZGAzrq/a47rT3eah+Adqjq6bEQ4e74X1n9torjRFFk9U7VvFp9B7X/J1/Btvq5KgFa9fYuaAydNpBq5vcKSnEQwkefSzd+L1AtvgOpwsFkM5nf30/K5MYqf93axf95qCO+Kyx8NCR79ASqlEOumInUiLmX8/4Q8nhv0siagmMNPKBd8QxEzn7PR4EwC4Efiss20Iyl6nRBOyADlq0Yy0WPHs7Aa4lgLdRQHCoTT+CBB1aOTvJXw5XhTBnw7lxy3GGEIkb9DWWEYobrkb6noy2qneWHq/wO5T4t2bBGYEpwYFYdzVjik3BVX6Ezc8Ft+1p0j2zQEwh5jZ2gwWFY4RmbtoLhUTZBkLGQ9ybyS3mZtU1jqvE388rfFis77w5c70INhPuwCFmeklgCnHqvaX5/Ytrn2rbPnsvOhLww6ai9D2Lr0HEkZvA90Z5gz4iwsSd35oxX1q5Z6Y6Niba1qZv4wIfR4y0b2FOlvSvSJEK28sP/1MdiXiB3S64u5qRpoHH/RXLzSyWgW2LTcHnCXMd599sSi4X8PVth7eBrwj9LedfCbcHQm7PzzWKs4fKmJ3F8G5mvH4gk5rrkFcvOzs2+428N+N3EcpAz7EzZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(44832011)(31696002)(36756003)(2906002)(7416002)(6486002)(6666004)(6506007)(2616005)(5660300002)(508600001)(53546011)(31686004)(6512007)(8676002)(110136005)(316002)(186003)(26005)(8936002)(66556008)(66476007)(66946007)(38100700002)(4326008)(45980500001)(43740500002)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlZnSEJBUGtMWkthU1dSRC9CNnF4UzZ1VFRKd09aWGQ4VEhIYm1hU2JkKzhO?=
 =?utf-8?B?eFo3L0RvOUpGR3piUW9JQmp5WWRTRDJBbms3VTdXcXVyMnBFTzlvRzlwVjJy?=
 =?utf-8?B?M2EwYkErb05vN2hxRDVWT3UxVWF6Ty9oNWl5cGNYRGVkRzlmVkx4TExWZnBl?=
 =?utf-8?B?QnppNWhySWpVY2pKV29CdllSaEdiblRCMWVZNVBEZmZnVHVvU2pSWktZQjUy?=
 =?utf-8?B?bklDTHpuS2ZlL2cxeUtkVFlSMGdjbS9Fd0FSaUI5aWFtaW9iU3NtQTF5bVcr?=
 =?utf-8?B?VnVTYVNTYWovT2FLWnFIbXFsQmIya0p4aTZleThyd1JLWW4xZUJ4UktvNXNy?=
 =?utf-8?B?MWtSRWV6bTlVd2oyc0M1bTdHUW9SMVozdnJzMVFrYWZETVUwV0xpQ0NMcGZu?=
 =?utf-8?B?QzBFVE1WVk9qa0Y4ZTVjNHJYeDlvWU1DUnJtRi9xYTgxdHg0T0JNbFRubXR2?=
 =?utf-8?B?bk1Vc1E2ZTFDN092WGlhN3ErMlVseW1rYlA3MWVrcU5DSHg5K0NjWEhrSGRv?=
 =?utf-8?B?ZktockJlVHJCLytrdE0xRGxEcGdEYnU3OE5BcXM4bEtwVUN4cktVTUgvYzBn?=
 =?utf-8?B?M0RKdVJzb0ZBMUtLUXBDdy9kdHRBVkQ2bjc4RER5MEl3ckJiK0pHWFdLeFFr?=
 =?utf-8?B?ajhtTGRKdDhiYmNjTFE3Z2JYS20xSWo0b20yYnNUN25nbU1Xa01aTGNIZzl2?=
 =?utf-8?B?NnAxRmFQMzlzbkpieFZ5anRPNkpiZFZsMkJxampqQzlTdHNTYk9vekFwdEdl?=
 =?utf-8?B?VFNHL2ZCZ1UzVFh6QVNML1NSaXlleVI5M3AzbHV3Wm9CWVQxOGJURHZ4SmVh?=
 =?utf-8?B?UVMxVDRtSzdhTzNJREZFa3IyRlFZNGI3TzJVbFRqZTEwVE1MUnoyRzUvQnB3?=
 =?utf-8?B?eEY3eTVwSVkvaVlxRFNORHpBWUE1bEYrYkZURkdkeVdScWZiK1FyY2tveklB?=
 =?utf-8?B?cmhSdlF2U1UxRnJkMjIzSVlId2xZc3QzMGlPdjhhK0lVNHRrZWdZS2Z2bWJ2?=
 =?utf-8?B?Wm1kQWgzalY2VDduNWMwUE9TS1hpMGV3ekZBSEh5bVdmTHpPK2hhQzV0MW5L?=
 =?utf-8?B?MW5sOUk0QTZXYnlVOFpHVWRPS09JdVo5bHJnazlVTWRWNnFRRUp4cjVkWjdQ?=
 =?utf-8?B?ZEl1THRZV0VjMHJwMDh5WW0rL1JIRUoxQ0dYakJ6alhFWmV2K3hLZEtVWXFH?=
 =?utf-8?B?QlBWbjBJQWZvVXR1dDB1c2g4MFhRN21zQ3orL3ZnTytYUW85QWhoSnZDb3FN?=
 =?utf-8?B?dTl3eTNIQStwU2NONHNVaEhnWWUvclRwZjF0UHVGQnpVcUc5TFVhaEUydHFa?=
 =?utf-8?B?bWJGWjlZc2s3TzNhVDkzWDY2dW45UFZkUllxT3pLTW1qaDJXeVp0bkQ1VWtI?=
 =?utf-8?B?bnlCQmlZM1ZyMnQ5WU5tMjdtb3lZUVlzREVSTXBOOGRGZnRXMXJLeTIralhi?=
 =?utf-8?B?bE1DTGJYZnUwVVFnb1UrdmhTMHNtYVNzN0pkaVgvdFZvRWhEZ084b1I1L3Y2?=
 =?utf-8?B?cFRCang1NTVtRFVYeWR1K05qSCsybCsvR0NsREZMRkhCbjFNeHFjeTN1bWN6?=
 =?utf-8?B?TmNKaEU4YitJNi9nTWdweFhvV1U5dERyZ3BDV1VXQzJHMzQyK0JnYUE0U1R2?=
 =?utf-8?B?YjdiYjBhbjNKRzlOU2s1WTZaTkdwRHNEQWI2Vzl3L3lOVnB0SWRCODRLVWVN?=
 =?utf-8?B?a1p0cTdjL29GVFF1WFg3TElhaEl1SDRibTU0TTBGM3hVRW5yY3dqamFxYS9m?=
 =?utf-8?B?c0lUblhLelFiRFJRbm45RE1jdkhnMkpvRllNbWtrWThVY1VZeXlPYkRkdXcr?=
 =?utf-8?B?eFRvQmx4VjZSd3ZGVnBBam0yUHJpSTJNV0hCUmdCTVd3ZW8xd0xwRWRXSUgw?=
 =?utf-8?B?YjhBMVQ5YTlKYlo0djhFdmk1ZnpQZXp3TWdLZ0UvMU5aQWQ0ZkZIbmhZN2dE?=
 =?utf-8?B?Nm5aMEo3NjhKVW5xUFhTTDRTYVFvVVg3c3V1UkhHRDd6UDNPbmRzUWhmWXZr?=
 =?utf-8?B?RlBuaWFVZTlwY3pGcUdQRUlXNDhkOHFQTHAxWlYvSFc3RXVEWWxBZzlkMCt5?=
 =?utf-8?B?aTJZeFErQzdiN3ZuQkJUU3NrSW94YkFOQTV3cit3NUIzNEFTTWVvT0ZpRCsw?=
 =?utf-8?B?R0hmc084M3FETXhPK25MMmh5cmJYc0JBUFBIQ2pUbXFOQ3ZpczYwY2xuM0tv?=
 =?utf-8?Q?De3vkJuPYSBakf9Z+UVmlf8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 092dfd78-f42a-4d7d-2a9c-08d9e280e644
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 17:09:09.9536 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rXTXyvkNCdrtny0tBRT8kr8M4beHH0u2Gu0LN9vfetGva5MrKbjnv+m0G1pBjAM33XNnfaDeU0vrrTdepZYoIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3188
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
Cc: rcampbell@nvidia.com, willy@infradead.org, apopple@nvidia.com,
 dri-devel@lists.freedesktop.org, linux-xfs@vger.kernel.org, linux-mm@kvack.org,
 jglisse@redhat.com, amd-gfx@lists.freedesktop.org, jgg@nvidia.com, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thank you, Alex for your persistence with this patch series. Fee free to 
add my Acked-by to all the patches that don't already have my R-b. I 
have done pretty through reviews of previous versions of those patches, 
but obviously missed a lot of issues pointed out by real MM experts.

Thank you Alistair for your reviews, feedback and collaboration!

Regards,
   Felix


Am 2022-01-27 um 18:20 schrieb Sierra Guiza, Alejandro (Alex):
> Andrew,
> We're somehow new on this procedure. Are you referring to rebase this 
> patch series to
> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git 
> <5.17-rc1 tag>?
>
> Regards,
> Alex Sierra
>
> Alex Deucher,
> Just a quick heads up. This patch series contains changes to the 
> amdgpu driver which we're
> planning to merge through Andrew's tree, If that's ok with you.
>
> Regards,
> Alex Sierra
>
> On 1/27/2022 4:32 PM, Andrew Morton wrote:
>> On Wed, 26 Jan 2022 21:09:39 -0600 Alex Sierra <alex.sierra@amd.com> 
>> wrote:
>>
>>> This patch series introduces MEMORY_DEVICE_COHERENT, a type of memory
>>> owned by a device that can be mapped into CPU page tables like
>>> MEMORY_DEVICE_GENERIC and can also be migrated like
>>> MEMORY_DEVICE_PRIVATE.
>> Some more reviewer input appears to be desirable here.
>>
>> I was going to tentatively add it to -mm and -next, but problems.
>> 5.17-rc1's mm/migrate.c:migrate_vma_check_page() is rather different
>> from the tree you patched.  Please redo, refresh and resend?
>>
