Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C42778F53C
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 00:02:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D5A710E6F1;
	Thu, 31 Aug 2023 22:01:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2081.outbound.protection.outlook.com [40.107.223.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7F7710E6EE;
 Thu, 31 Aug 2023 22:01:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T2evLfKqP1e1zqLYMIMGONcwyrZS7hVMVTjU3e41KxM8KMHIKHSU9C5XB14L164LG3luhdodFxbzMOW6LGEEzI3uI+QzsSivzTtYhUvMQXvYG7dHF/ZJOVxfYuGyifggXmAlzCz5WHC9DVgNk6yx/ZVnfDG7LEily9soqBh2dkOOGfbbDNuOoEX9GpbhzGOrBiwODlAABFxiOl60ZoBiFTPldsKrb0JvjgXSAfUsWfO41u5uuvbKEOQXtGRbFHa/urTHsl9hgEvz/09gtJVEACszxkwNPBu/Ye1LxEBbIO8gYX5SBeB8vE2vfkvmHG79f8l92eq9ZyeDa5q0cL9TZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kvoAvqlVmZaPSsRMmyCg7yGw6rSE8NMsh3Oa0t2DAuk=;
 b=a4bnyHx84b8WajiqQK8mScCDmOGoezE54SWaE58bWZ27VoqBW7k9IXPwpt5uPASu9ws0mMh5fvamAo1/NUAIXFhmyIHu9kujf13Ak9tIKEbP/GNWNRKHWMQs1TIUA64QeN8aEovO1vt1phQHSZQBxmGrAszb/gdhsRl6GbiZvDJMyCPL03rqWRg7Haqil9xzP+q2YY/AG/qU+KZYYnbErvPEuSlBnkxejLZijYyDjiA1lFClQgGBsiOgPLzEAe2wf+lioK8jmeStNNhuBFI7FzfqzoE/HUvvkwHy6ufthSYp1Z54zfaAMvpUuqnb06UFvoPrJ4C6ECG/xX9GMs+hDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kvoAvqlVmZaPSsRMmyCg7yGw6rSE8NMsh3Oa0t2DAuk=;
 b=3vaMi7CENh5xOU2QYMdbXeopGeQMk0QooAQNl8ViuD+kAzrWmUSxweJo0iyzhVyRbz8Lg/EcAYPCN9m3hlGoSNsgCTC+ZKYNP9vbE+dm9oe/B1YB1RecLght8ilxnHbq57cTH714TFsgsXhIRFYbKir42rvdq944/iXA0BTeM2Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3048.namprd12.prod.outlook.com (2603:10b6:a03:ad::33)
 by MN2PR12MB4550.namprd12.prod.outlook.com (2603:10b6:208:24e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.21; Thu, 31 Aug
 2023 22:01:50 +0000
Received: from BYAPR12MB3048.namprd12.prod.outlook.com
 ([fe80::1dd2:153c:f0bc:b80d]) by BYAPR12MB3048.namprd12.prod.outlook.com
 ([fe80::1dd2:153c:f0bc:b80d%6]) with mapi id 15.20.6745.020; Thu, 31 Aug 2023
 22:01:49 +0000
Message-ID: <b32199ef-7179-3908-3bed-dd164cadc5de@amd.com>
Date: Thu, 31 Aug 2023 16:01:43 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [Intel-gfx] [PATCH 0/4] drm/amd/display: stop using
 drm_edid_override_connector_update()
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>, Alex Deucher <alexdeucher@gmail.com>
References: <cover.1692705543.git.jani.nikula@intel.com>
 <788721f6-afff-e0b2-db7c-32ab2dd075a9@amd.com> <87il965gob.fsf@intel.com>
 <871qfm2kg1.fsf@intel.com>
 <CADnq5_P49U3dcqiZhB-CjS8UbOtB7K2jNObS0ZQqMhOr3UhLQg@mail.gmail.com>
 <87o7ip252r.fsf@intel.com> <87jztd2332.fsf@intel.com>
 <1e6aa1ff-9aa9-6b2f-84f4-e0304205085c@amd.com> <87h6oh0yz9.fsf@intel.com>
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <87h6oh0yz9.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0373.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::18) To BYAPR12MB3048.namprd12.prod.outlook.com
 (2603:10b6:a03:ad::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3048:EE_|MN2PR12MB4550:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f4fca7b-4c51-4cc3-dc39-08dbaa6ddffc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YV6PcgqmedmWB99CTj5JZhkS4+GLiL8w3ySxtjnfC+dq4h6PeoQiH3zZef7Srj5eUUtUvbaUsEUx3VTbErLZjZRQSL6qtKzifIo6bqWY+Xf3SFOIJjVh3MTke/CUuPzyUrWxZ19UA05M/LnUg/n+tgp4aCOSRA6WMZ6f4rx751OHP4tByi4HM85ezIQpInsijJpsFoGJm18iLgti+opH7syNBM/vX0djd4SDdc1DMEAsZGaHqw6ZvPm4vZIoRhk1jNrjruMzk1/Br+TvJhVjxlBPY2AqKGn270EI9NDzMBN1OZ82ghVkRG6QYRbmh6NmNF1/Pw0Di1dfaXGCKUCkDys/6ApUUaXjEQXvpgVFbsYf5iF9Tz6d+RdP2cEvHce2MDMypo7h7p4Mvz9rjDUMBfsJdtm42ZSvRRBb0Z6jwwYlG/wSnM2Ve36h7gLMaPwSncESJ3pZSD52kcL7wCcs2yWikLj0Wizx91Pq7w6ngpSuPygT9OigTEDiZJjrff7g1xFZRRBYQJGPcWXBbLdXIXCbppn5J9i3rjY898kkz/hxOulJ56y8loCes5OjIBefdieWilJKMnBOcw4hx48rSJj32ygwNgowuXRnju4vW1bioLC89EMftErIftee44AE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3048.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(346002)(136003)(39860400002)(376002)(186009)(451199024)(1800799009)(31686004)(6512007)(6506007)(6666004)(6486002)(36756003)(31696002)(86362001)(38100700002)(2616005)(2906002)(26005)(53546011)(966005)(83380400001)(478600001)(110136005)(66946007)(4326008)(8936002)(8676002)(316002)(5660300002)(54906003)(44832011)(41300700001)(66476007)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0xlb3JvQWVJQkpnWm5iTWtUUXVhTDJkU1Bpem4yYlQ0d0tXdWZobExURk1Q?=
 =?utf-8?B?M2lQK0QrVHByWVYvZW0xdTZrdkplRDlKTDArbDhLZmhKTWhaK0dNYlZEcGFi?=
 =?utf-8?B?azRxU3k5akZLakM4Ulkza1pCZ2hXVHNCb08zbHJMeCtFNDBITEIrcUg5OUw3?=
 =?utf-8?B?WW5zemt3UXA2c0VSbzc4MzQ0d3pkOUNxSXIwaHgxbGZKYXRoLzEydWkycHhX?=
 =?utf-8?B?NjdyWGV2UHBpU1U3dDRNTDJLR0Z6WWtzTWh0R1Q3K1BTVnpzYTE2a082R3Qv?=
 =?utf-8?B?WXZHRXJua2dyVW5MWXQ1VEVrSzF0UkE0RGcycVdlMWo5VTNpa2pkRVBURFF5?=
 =?utf-8?B?a3pDazA1MWNBa3cyNVJvU25kbDYzVnQ3MFpIdmE1ZkczSkN5MERwclN2TFVS?=
 =?utf-8?B?Q3FNMk0xeWVRMU56U0pBTVI0RWNrUXVMaXJzTUsrSFdhd2JBV1NjOVg1NWly?=
 =?utf-8?B?K1dpL3RvN0hnVnM1TnYwK0M1UlEzMDhzNStidVovUlpiY2dCK1FiZnBTcytB?=
 =?utf-8?B?czZkNS9QTmpZbW1aVXcvVUtqVHRuQzcrSndGbFJZREN1TEsyQ1EyS2NtMjVV?=
 =?utf-8?B?emFEclV4U0FtSWtnNDd1R0ZacUNrZ2xwZVJ6VHhYOVVlb0pmQUZzVWhiZnBs?=
 =?utf-8?B?VEcrai9ZelA4MmhwNFlvNHF4RjZ5TE1NVGFnd2F0dHVBM0pJa25MZjBmeEFa?=
 =?utf-8?B?ZzZtMGtmaWVzR3ZpZlVrRG9GZ2UzdURIS2ptOUF0TnI2WXJQKzlzcmRhOXdz?=
 =?utf-8?B?ZEttc2JmanJaZVVmM0M5Zy9FN2hYaHRwTjVSU2d5Y0dDTWFpdUs0RGVpbWIz?=
 =?utf-8?B?ODl0dUtrWUJVUmJNK0Y4MkVGZm9HNXJkMVdoZENkcGkrUElhSjdpZG8rQ05Y?=
 =?utf-8?B?RENocXJSZkc2VE5WdGpzNFhWMXZoSXJNM3VnOEZDS0NQRFcrYS9peU9CdUtC?=
 =?utf-8?B?K1lLYzkzNGdhSG9YdFQvb2hhcDlVTDZkdnpIc1ZPL2J6SmhONWNVcHdlaHkz?=
 =?utf-8?B?eFUvYUk3c2lNc1NpS2poV1pqRHNSSEMxMEFXNmlVZCtWcjFRc0xnV2E4UzVu?=
 =?utf-8?B?V2Y4b2FFSHI4TFovTDZmZzBkZEpXbC9iWDRPd2RzalUzTHQ2eHJRRnVEbzhC?=
 =?utf-8?B?MEJWMTVsak04bHlXM0phcTlHTnFYanlXVVUrODk0V1g1Umd0d2hEeVB6cE1v?=
 =?utf-8?B?aXFhNjMyR0x0Wm1BMytoNGc4VTR4ZFlvODluQXJFMWhxZThaRE9QUUtJbmpr?=
 =?utf-8?B?Z2tBSklVZUNQbEtoa1NnelhRdHhzc3RjNW5XcC9PQ1dGcFlEWlRYdDhxZjBZ?=
 =?utf-8?B?RXNpVzA5VDgyQ1l4dTZoSVh6NW9JTWkxVytnRUgvVnRSclA3dDM5eXg2Zm96?=
 =?utf-8?B?OVQ2K1FsUjExQWZKYlIzdVlCVXRYUDJmM2dwejRYY29sTG5jNGRvZFdLWWxL?=
 =?utf-8?B?Tmtqa0NRNGVrdmRDYWptQkNLUUhRNm1TNFoyM1VhVmdrKytDQ05rcDFOWXVP?=
 =?utf-8?B?NXBYMldoU25EME81dzdFMVRLWFVIdFZjRmxvd2tHcmZIRmhVZGlINTJkYlB1?=
 =?utf-8?B?NW5aT2pHTWV4Q3RyYTQ4SVpNK1k0WmRmTnVXa2RieU50MTQ5Q0VPMzJJYTNv?=
 =?utf-8?B?UTBudVRqSEs5VUZBOFp0YU9mN2xXU2hHRmVPVmNYa0RpOHJELzNrYzNXblZm?=
 =?utf-8?B?OUFnRjVSRjZBOERjQTJ4bDlscjFCMVRIVDlhSEJGTnZlQ3VVayt2akpkL1hN?=
 =?utf-8?B?Nzl5RVdGanNwT1h1L0lHYW93M0QwZUJQYUhHL0hTZkQwdVNic09ZK3NHVTd1?=
 =?utf-8?B?YkF3WmorODBodmR3azFPZGt2RllOcnRUeW5uYTd1U05HKy9sOUh6bmZPZVNn?=
 =?utf-8?B?WGF1QWo1V3daZ1FlUWt4RVp1QXZITHZIQ0NpVFl2VnpBTmlPSVR4YmxpZ1Bo?=
 =?utf-8?B?SUpVUTA2eE4vR283eHNENzR5cTFLVXFkYTNkQmtvNGt4dHJ2eWczVTNOR0Fm?=
 =?utf-8?B?N2l5RlFaL3ZpamUyWTF2S1hsRzk3SldDb0pmVnVUaDVWY1pPZ0ZqYXdBZDUr?=
 =?utf-8?B?ajdYRnl0SHpIVHRjNWpYMnlWV1ZqV3o3WDlDYVFLSVpBRnliN0oybjhuUXFT?=
 =?utf-8?Q?0fZ/wNEvOzXzLw0fZ41+W4D6G?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f4fca7b-4c51-4cc3-dc39-08dbaa6ddffc
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3048.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 22:01:49.1258 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I0Sv+rsmwkdRYTVmUaiEZKz2T23OQ3JOPH4IwkfsiMYxgjnpMnpcRt1DEAefGIkeRhyO0nRFs/c5lRado0miTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4550
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
Cc: Leo Li <sunpeng.li@amd.com>, intel-gfx@lists.freedesktop.org,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 "Wang, Yu \(Charlie\)" <Yu.Wang4@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>, Hersen Wu <hersenxs.wu@amd.com>,
 dri-devel@lists.freedesktop.org, Wenchieh Chien <wenchieh.chien@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023-08-30 01:29, Jani Nikula wrote:
> On Tue, 29 Aug 2023, Alex Hung <alex.hung@amd.com> wrote:
>> On 2023-08-29 11:03, Jani Nikula wrote:
>>> On Tue, 29 Aug 2023, Jani Nikula <jani.nikula@intel.com> wrote:
>>>> On Tue, 29 Aug 2023, Alex Deucher <alexdeucher@gmail.com> wrote:
>>>>> On Tue, Aug 29, 2023 at 6:48 AM Jani Nikula <jani.nikula@intel.com> wrote:
>>>>>>
>>>>>> On Wed, 23 Aug 2023, Jani Nikula <jani.nikula@intel.com> wrote:
>>>>>>> On Tue, 22 Aug 2023, Alex Hung <alex.hung@amd.com> wrote:
>>>>>>>> On 2023-08-22 06:01, Jani Nikula wrote:
>>>>>>>>> Over the past years I've been trying to unify the override and firmware
>>>>>>>>> EDID handling as well as EDID property updates. It won't work if drivers
>>>>>>>>> do their own random things.
>>>>>>>> Let's check how to replace these references by appropriate ones or fork
>>>>>>>> the function as reverting these patches causes regressions.
>>>>>>>
>>>>>>> I think the fundamental problem you have is conflating connector forcing
>>>>>>> with EDID override. They're orthogonal. The .force callback has no
>>>>>>> business basing the decisions on connector->edid_override. Force is
>>>>>>> force, override is override.
>>>>>>>
>>>>>>> The driver isn't even supposed to know or care if the EDID originates
>>>>>>> from the firmware loader or override EDID debugfs. drm_get_edid() will
>>>>>>> handle that for you transparently. It'll return the EDID, and you
>>>>>>> shouldn't look at connector->edid_blob_ptr either. Using that will make
>>>>>>> future work in drm_edid.c harder.
>>>>>>>
>>>>>>> You can't fix that with minor tweaks. I think you'll be better off
>>>>>>> starting from scratch.
>>>>>>>
>>>>>>> Also, connector->edid_override is debugfs. You actually can change the
>>>>>>> behaviour. If your userspace, whatever it is, has been written to assume
>>>>>>> connector forcing if EDID override is set, you *do* have to fix that,
>>>>>>> and set both.
>>>>>>
>>>>>> Any updates on fixing this, or shall we proceed with the reverts?
>>
>> There is a patch under internal reviews. It removes calls edid_override
>> and drm_edid_override_connector_update as intended in this patchset but
>> does not remove the functionality.
> 
> While I am happy to hear there's progress, I'm somewhat baffled the
> review is internal. The commits that I suggested to revert were also
> only reviewed internally, as far as I can see... And that's kind of the
> problem.
> 
> Upstream code should be reviewed in public.

Hi Jani,

All patches are sent for public reviews, the progress is summarized as 
the followings:

== internal ==

1. a patch or patches are tested by CI.
2. internal technical and IP reviews are performed to ensure no concerns 
before patches are merged to internal branch.

== public ==

3. a regression test and IP reviews are performed by engineers before 
sending to public mailing lists.
4. the patchset is sent for public reviews ex. 
https://patchwork.freedesktop.org/series/122498/
5. patches are merged to public repo.

> 
> 
> BR,
> Jani.
> 
> 
>>
>> With the patch. both following git grep commands return nothing in
>> amd-staging-drm-next.
>>
>> $ git grep drm_edid_override_connector_update -- drivers/gpu/drm/amd
>> $ git grep edid_override -- drivers/gpu/drm/amd
>>
>> Best regards,
>> Alex Hung
>>
>>>>>
>>>>> What is the goal of the reverts?  I don't disagree that we may be
>>>>> using the interfaces wrong, but reverting them will regess
>>>>> functionality in the driver.
>>>>
>>>> The commits are in v6.5-rc1, but not yet in a release. No user depends
>>>> on them yet. I'd strongly prefer them not reaching v6.5 final and users.
>>>
>>> Sorry for confusion here, that's obviously come and gone already. :(
>>>
>>>> The firmware EDID, override EDID, connector forcing, the EDID property,
>>>> etc. have been and somewhat still are a hairy mess that we must keep
>>>> untangling, and this isn't helping.
>>>>
>>>> I've put in crazy amounts of work on this, and I've added kernel-doc
>>>> comments about stuff that should and should not be done, but they go
>>>> unread and ignored.
>>>>
>>>> I really don't want to end up having to clean this up myself before I
>>>> can embark on further cleanups and refactoring.
>>>>
>>>> And again, if the functionality in the driver depends on conflating two
>>>> things that should be separate, it's probably not such a hot idea to let
>>>> it reach users either. Even if it's just debugfs.
>>>>
>>>>
>>>> BR,
>>>> Jani.
>>>
> 
