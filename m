Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE544E5546
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 16:32:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AD8410E6E1;
	Wed, 23 Mar 2022 15:32:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2049.outbound.protection.outlook.com [40.107.220.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F3B789A08;
 Wed, 23 Mar 2022 15:32:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DYkIczAfj0j2rH0GVZO8jmrKioX4JLm5RY/YLI3ndDJYR8MntwWOCD6QOxC3XDXzGU1RWZMO8okxnrpvaAObpAu/i87B0R6yjGdj/VqYin1Ppdk6ZwmIdq3v1wfnjE/LFyz6owfa+UnNRxMSDTdueB9eOXxkllwiI0aLBtylncW19VCQwScoNJ28litS8P/IVIyUHWi0y7OQutiOf1+wqdgWhTRaOdzGY0XPbCqxQS6nPt744QCWfcEuaEekx/2yNATv2p5MPN19P5e4mFxb/r7AIs3j+Gjj5yJfzHBGl6LbCP/8C1AM2aCMA00U/Jo5B12VgvR50O+PjvBen69jMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B6MpcyuGlaxItHrU0M0IA7AUBkzuu70BGiils0rA8cI=;
 b=Hbgof7TXCUWHa6dwgH0+zWh3eb88C6u6OiImrL9kjtmYj4hUH4Uqn6jKZfDX8UvWisruVXnUYsKllT7mDJq/zS6HKyCPiUpB0lIIWGHW1uQqPJeMx6nsFU5TnlPKLZlc4jCUAqTSvOXI9fa1lXawvoSRTMMaOOSCMPs/hKIGQGCqp9qKTaHDOIlwJrjBCqLH5PCikC4phaMLjWKlGh4NGXgLp1CLcvCaF5pkYO/YUvsuQGR6D/UXrhDHCxRtImPLuIAykPkRj4/caRZPBNWB3A1R4n6fS3CY/G/rMjBp1So5fqlUBXr4Vln2gTlbWp989jrV+um0LPN2WRUmwmCp2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B6MpcyuGlaxItHrU0M0IA7AUBkzuu70BGiils0rA8cI=;
 b=uJnDr22W9rINW0bdULiJdLDyOPrdFoJk2kdwTEnvCCV9ar02SzZIZ+hn26sidployqZyNrKzKB4Uw9wMAH8vXqHC7Z3N154ISXq3IVNahL4L3PeXlhBGzH9kUqT/n93xpXC/4ROENlLmgT8SRQNTKtR+kjLW4XhoxzyM7ZA8opE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3589.namprd12.prod.outlook.com (2603:10b6:a03:df::29)
 by MWHPR12MB1566.namprd12.prod.outlook.com (2603:10b6:301:11::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.18; Wed, 23 Mar
 2022 15:32:18 +0000
Received: from BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::54ea:af56:9e64:7e51]) by BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::54ea:af56:9e64:7e51%7]) with mapi id 15.20.5081.023; Wed, 23 Mar 2022
 15:32:18 +0000
Message-ID: <c41203c8-841b-889f-5c9b-5982ee961849@amd.com>
Date: Wed, 23 Mar 2022 16:32:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Commit messages (was: [PATCH v11] drm/amdgpu: add drm buddy
 support to amdgpu)
Content-Language: en-US
To: Daniel Stone <daniel@fooishbar.org>, Alex Deucher <alexdeucher@gmail.com>
References: <20220323062552.228429-1-Arunpravin.PaneerSelvam@amd.com>
 <7addb3e7-d265-c1a7-d449-7d0056f06d63@molgen.mpg.de>
 <fc60c561-c12a-c031-9558-abae3e3474ec@amd.com>
 <6f0888a2-f74d-f41f-d593-a8362e7dc673@molgen.mpg.de>
 <398f8851-d37b-4020-24ce-8f2ab9723e40@amd.com>
 <CAPj87rMETV9UkpbGRYAT3mjVhRtW75m0e9OLON6_+gdcD0Fo2Q@mail.gmail.com>
 <CADnq5_NuaN_ZziNipdqvvTQ41you==VqJg5oxQovowokaJ2K1Q@mail.gmail.com>
 <CAPj87rNyjd1xkEEARMoiaEdjLxy2rvcKa03fnNCnpN91DLhF1A@mail.gmail.com>
 <CADnq5_Mt5sWCC7hLLBH_DJdvXGqSTbNNaxWpY+cWWD9Vpa8KGQ@mail.gmail.com>
 <CAPj87rPhuVTDJSsY-HsKfvV3xkDhEn7nUd3WLsxNuJD=Mx2Zxg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAPj87rPhuVTDJSsY-HsKfvV3xkDhEn7nUd3WLsxNuJD=Mx2Zxg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0274.eurprd06.prod.outlook.com
 (2603:10a6:20b:45a::20) To BYAPR12MB3589.namprd12.prod.outlook.com
 (2603:10b6:a03:df::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0050d770-364d-4abd-025a-08da0ce250d9
X-MS-TrafficTypeDiagnostic: MWHPR12MB1566:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB15666846799CE7860959FCBF83189@MWHPR12MB1566.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wy/dpaHpBhzcn7SmemLce0OBuE+PlATN5EpzFhQszhbpYdUGjluHY1p1IoNUYPUCe2rP/U6GlF6m7qf6g/4TveJU3YJpwEvRuJBKNcVn23hHtbLxaWoIaWRqhkZQAkwMB9UfUjzyrMKoqyffX2ZZefm+6/4IghGDi935OR3S/uhnNFTqQgU0/LrCKOFNzBbe49sZIMRHr7iZmQPEeRl9gx66ePNAroksMHfg9zMvvLOXopR5Je/t1ZMDJbSEBpsJ5JgkBYqBM71HSa9n3jyUoJsBa7ITQ0hrWENbYrY5ZoYU8ycdjN81fsPsBrpegCtoBiq7ArZ+GaUE5/AbNeMQgpFfigZdjdezREo4Myjue4nCaFe4zX2fwMv0kJ76fSUTTj0l2wLuRPuGlWu4WcLmDsOIdKmOeGqyl6BK0OxErUKs2qhV4d12pgi/sZeGOPEJn4U84kjAlTJa2wsy2BSomAzdNZaQStTvXz5/rtPU69z91y7ocYm7T6wArBbLcD9z2ZjLm1aRmrK88xCkFk8BLM28n/ZmfyP62/5fXPhZRr3E7P8XQ4DLaQ4SA/gMRo6Ru9kwJWxWjqyfaYiNJGHa9DSeK++4N8vdvscZ0vXptewcvl6gp41ensOZEIVfWTIAJ1RljK+Otp++GnbIeVa6IyRv0jiq4zJDQeVmw40K+v1szSofSguL4jK1VLmJduHlTQCEvw0XhCRH7qDLcAAU74vLb9d/STmOIPXsTuPajKetlFyEVfZNlEhyo18yTuPXKrou43y0OWGHt2/m8wwDnRMBZAsGmE9eafb/y1N2yGud1nwe0p7X+45qGFbpqJNjLg6EFlqVdH5hiF41xFKJuw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3589.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(53546011)(83380400001)(2906002)(6666004)(5660300002)(15650500001)(8936002)(45080400002)(6486002)(966005)(508600001)(6506007)(316002)(38100700002)(31686004)(2616005)(186003)(110136005)(54906003)(66574015)(66946007)(66556008)(66476007)(4326008)(8676002)(6512007)(31696002)(86362001)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWZGc2kvbHZQK0ZkY3A2VHhQVjRLbkR5V09KSmk0TkxYTXRuNHhrU2srRHlw?=
 =?utf-8?B?ZCszaHhURE9HZUZ3N0lGTUl1REhLcS9TOW1OcHZoV2NYRGladi9saGN2SXQ2?=
 =?utf-8?B?bDRGTW03ZVBtb0dReTFtd21neXNzZjJRYUpIR0U4aHg0YkdTU2liaWVCangy?=
 =?utf-8?B?Zm1XMFh6ZXNoTEZ6WlhXQ3gzandsTjQzb1hwaXovaUF6TUhSZ25zdHN0dVNq?=
 =?utf-8?B?ZU5HTi9zeG9IbGR0MW94b2k0anVWa1NtaSttcUU4Wnd3OS9sWEtJRzlPV0pJ?=
 =?utf-8?B?eDVwNWpRQVB2QmpTV0dzOUsvWmk1dWZPYmp2QmpwMXZWREM0SlFBZHQ3Q2Zn?=
 =?utf-8?B?SWRXaXJ4b0EzRUhwSngvdzdsaHVOSmg2QzQ4WGRYVXdNbUMrRXZYVWxwODNp?=
 =?utf-8?B?c0JpVnNYd0dqWlN2VnlNMlduNVc5eEFBQ2RxT013N01BbmhMZTQwSzlIeXN0?=
 =?utf-8?B?Y1g0WXR6TkNCV29JNnE4SXJRYVdoN3JCaG1nRHRQZWFBV2FSSG1CaURmMnVM?=
 =?utf-8?B?bHJJMDhlZkFONkd5VUNac2xjOUhSRXRBeVV0YjVoUTliU0JzSy9GdWV0SFlR?=
 =?utf-8?B?OTlYR1d2L0w2RFlhTnZxM2J6YWRMMHl3MGZWUzM5NVZ1eHh4d2R3U3AwUm14?=
 =?utf-8?B?MHNhb3lpc1BqbWR6NGpENHNaT2ZtTVlQNlNQTk9MRS9lVm1vemttRk9ZUFVx?=
 =?utf-8?B?V0diSVE4eFFnM1JSVWtncktNYnpkZ282U09uNjU4SXRjTlRUU3dIMkZjWUhq?=
 =?utf-8?B?MU42SlhlMnNKMTJ6SHdUWFY1SDZ6WFdWajJOUUttTlVCVHNTTmpXSk5UaWJY?=
 =?utf-8?B?b2RSV2RhNzk5ZzVtSXk3VDRRbk5VMEF3eTE4ZlNmcHhuTC9ZQ3RoRDNGQmNT?=
 =?utf-8?B?VVVaMklRYWVSQlVzMno4SkNxdzJaVXdVek05L3ZwUlZxbC9tNVRJU0x3SlhS?=
 =?utf-8?B?cUJIQ002ZjEwY0Z0NEFwcUNudjZNQmlJTkdxUFYvdXhaWHVOUGFpZVp0RmdN?=
 =?utf-8?B?YzYzV0N1S0tVR2R5bFE4SXlLSUNKVk96aGlxZE9tOHpwSGlVUnEwS0VwSGts?=
 =?utf-8?B?UlpzQVZoQ1lnRTZQYVh5Wk5jS1E1OW9SS1haQmJpbnBMeUJLTGFaUkF2SG1I?=
 =?utf-8?B?dG9NcVU4Qlc0VXFPZDJtSGNOMThNd2VrMGlnaGxvQUZDNXNRNmRsTW1oQi9Y?=
 =?utf-8?B?SlFwbEhSdFVYMEMwajNobXFuUFRoNVdaZnNGemNYRDcybEh3S2lXL1d6Q3JT?=
 =?utf-8?B?RWZwK1hKTi8vdGxzNVZIaE9lWGFLMHp5SnA3bVFRV1NJcnB5b0lWaE9GL3NR?=
 =?utf-8?B?S3p6a0ZWMEp5b1FmRlZCZWpJRVZoUG81QWpQYUhsMmRCVGY0QnRHZVkzQmpI?=
 =?utf-8?B?QkJ2UTNabzROOW82OFJsWDlHMWlPN3BSL0U2aVMvNVdsVlhsamwyeUJaV3RM?=
 =?utf-8?B?MkJtVTJLMndsSi95VXBzYVIyY1NsWDRaTFEyRzg5NUhUQVE3VnU3TUw5VjRt?=
 =?utf-8?B?aGx5UXFERTlaRThsaTZ6aXVIYnNMZ2tURlJtNEMxTEdQNEZ1UXZITy9uZ3Y5?=
 =?utf-8?B?dTU4YzE0eHhuNkpOQ2FuZ1JvRmU3QnZ3TXQ3ZVh5cm42RnV3d3pzNlNRNG1S?=
 =?utf-8?B?elp3TDMxZWYyQzEvZ0phRENuaTJhb2JzQ0FYUFBEVUNDbHlBUCtqb1Y3OUd5?=
 =?utf-8?B?SVFhTzUzT1Q1VmQrZkpCY2d6ZkRPellDSEJRYzBFUlNzeVVBdWRCUTgzMmNm?=
 =?utf-8?B?M1FhV2d2dTJBWk9FMVhLQmFMOGF1WFpNQmlRckJJdWVhZ1BwQUxrYlBUajAx?=
 =?utf-8?B?aTZWVE0yY3Vac24vSG9XalVmdVBMdU9pQ3BTVmJEWHMzcWtFRU9OZk9Qd1hQ?=
 =?utf-8?B?SlBhUnFmT3ljb0hlZXZmejZxeHFpT2xOdkxqUmNGVzVkUDVoUC95amRJejlS?=
 =?utf-8?B?WjJSNGxHOFpsOHdwU2RVVWt0YWZhMDJiTTNqMnlrb0dvM1JSZm9za005WWtX?=
 =?utf-8?B?c0c5NFl1ckRyZGduTHVXbFQ0TFlIeFNQQmNlMEh1Z1ErQ2dHM2VkOE1OQ3lj?=
 =?utf-8?Q?iJGFKv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0050d770-364d-4abd-025a-08da0ce250d9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3589.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2022 15:32:18.6450 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q974tDxUAe9TuVjwY9q7WI/oIxplGdAl3+wN7qHria4cQowSAF7fXY13kKNvFImz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1566
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
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 23.03.22 um 16:24 schrieb Daniel Stone:
> On Wed, 23 Mar 2022 at 15:14, Alex Deucher <alexdeucher@gmail.com> wrote:
>> On Wed, Mar 23, 2022 at 11:04 AM Daniel Stone <daniel@fooishbar.org> wrote:
>>> That's not what anyone's saying here ...
>>>
>>> No-one's demanding AMD publish RTL, or internal design docs, or
>>> hardware specs, or URLs to JIRA tickets no-one can access.
>>>
>>> This is a large and invasive commit with pretty big ramifications;
>>> containing exactly two lines of commit message, one of which just
>>> duplicates the subject.
>>>
>>> It cannot be the case that it's completely impossible to provide any
>>> justification, background, or details, about this commit being made.
>>> Unless, of course, it's to fix a non-public security issue, that is
>>> reasonable justification for eliding some of the details. But then
>>> again, 'huge change which is very deliberately opaque' is a really
>>> good way to draw a lot of attention to the commit, and it would be
>>> better to provide more detail about the change to help it slip under
>>> the radar.
>>>
>>> If dri-devel@ isn't allowed to inquire about patches which are posted,
>>> then CCing the list is just a façade; might as well just do it all
>>> internally and periodically dump out pull requests.
>> I think we are in agreement. I think the withheld information
>> Christian was referring to was on another thread with Christian and
>> Paul discussing a workaround for a hardware bug:
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.spinics.net%2Flists%2Famd-gfx%2Fmsg75908.html&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C6a3f2815d83b4872577008da0ce1347a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637836458652370599%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=QtNB0XHMhTgH%2FNHMwF23Qn%2BgSdYyHJSenbpP%2FHG%2BkxE%3D&amp;reserved=0
> Right, that definitely seems like some crossed wires. I don't see
> anything wrong with that commit at all: the commit message and a
> comment notes that there is a hardware issue preventing Raven from
> being able to do TMZ+GTT, and the code does the very straightforward
> and obvious thing to ensure that on VCN 1.0, any TMZ buffer must be
> VRAM-placed.
>
> This one, on the other hand, is much less clear ...

Yes, completely agree. I mean a good bunch of comments on commit 
messages are certainly valid and we could improve them.

But this patch here was worked on by both AMD and Intel developers. 
Where both sides and I think even people from other companies perfectly 
understands why, what, how etc...

When now somebody comes along and asks for a whole explanation of the 
context why we do it then that sounds really strange to me.

Thanks for jumping in here,
Christian.

>
> Cheers,
> Daniel

