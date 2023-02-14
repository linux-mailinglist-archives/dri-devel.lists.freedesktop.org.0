Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EF1696A6C
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 17:57:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01C1710E104;
	Tue, 14 Feb 2023 16:56:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2057.outbound.protection.outlook.com [40.107.93.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B2ED10E0EE;
 Tue, 14 Feb 2023 16:56:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IfFniP4489h6aaD4MbAHzz9EvdzJWAaAVOpKu6wGtmAWMiS/94TJsuPIKFkgzNGfbuOnO1opD3x3oSkhIGTCm2WSxV1MIN0uB7hEYRvBF1J0Pmbb49iaYk3pntqLtLkGG/ACr6QfDEpUv1mvlLMjUbNzE/D+soMynquSrFkiGamWsD5YA/UKzgBlDpvRix1/6EgYvdxDe88Mjw2p8/x6inFV0GFb+VwlZRZ8LiW57uhc7w5xusCUmJ+DHpixYruztDUaHJUxQ72ABCUltjJamwJ+Sfc8k0/snHfI7lXxHy9jMyXcjYXjFMJlItxaJQDxJv4bVop+xzJwEl1J8hbDgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kG53IebBiaroVrOJ5CixDSdTF55i+ZdWuhnan+lnGP4=;
 b=XcoifFSLvk2Mkv7rhiTrLcOCJdSy62M1+v7qJPyjSc3fhsPKBuM2YSb4KDGwBiEKH4dOohcg2iDlm6MJU7p9NwJTvPviPKeOq7irsiATUU1MSXNS04I+MKvNGWWPcNBEtOhoniG0D++eCAYgYQwsMxzx2NvLCW5B9WuBtMRMko+qrQnzOS2KZpPka8YnnEomyRcyDRFo0q7ROPTgq2uLRW6Z7OX23qGE1g+2zYEgdmMy6ftdqSG/WT57gVnyGBncNHb4GZKeZIzJ0QTOuQbPCCmCcF9u+w/6tleUtlx0f7aeVihRjNW9cmuedjaTMVpYXwoU3s6bBmUfVo29HxEMfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kG53IebBiaroVrOJ5CixDSdTF55i+ZdWuhnan+lnGP4=;
 b=bqkV6gjLLjOw7/ooG52kwPFGXxsL3QkgEVJlbuEaELIuA9h/B3JvFSjIHejMGNHqOBzOpqOaM5cdzgSrE2xzW2AcVi/PaTd6P4nZn+ulu38qu6w5GOgGNn5lxp8NRR7cC3KkhqvP46f1BdOQ8/to/3++DH9Mi3iSdzRJJizutBI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DS7PR12MB5981.namprd12.prod.outlook.com (2603:10b6:8:7c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Tue, 14 Feb
 2023 16:56:51 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::aa28:9378:593:868a]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::aa28:9378:593:868a%9]) with mapi id 15.20.6086.024; Tue, 14 Feb 2023
 16:56:51 +0000
Message-ID: <98d1d22a-1c29-5271-1eaf-89c962eb9678@amd.com>
Date: Tue, 14 Feb 2023 11:56:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/3] drm/connector: Deprecate split for BT.2020 in
 drm_colorspace enum
To: Sebastian Wick <sebastian.wick@redhat.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20230203020744.30745-1-joshua@froggi.es>
 <20230203020744.30745-3-joshua@froggi.es> <Y9zkef5FjtZ7guVS@intel.com>
 <CA+hFU4ymiOg06MQeKLcn5MSrR=BZnOLODdZCFvGUdWqt_ha61A@mail.gmail.com>
 <0fc18aec-0703-55f4-f635-d09d345e8dc0@amd.com> <Y90l+DY0rSaMvN1U@intel.com>
 <758e5cf6-53e0-567c-c760-5b773bc7a11c@amd.com> <Y90vrEa3/1RbaGOV@intel.com>
 <CA+hFU4wuM_xHniFyRT+jouQ3k_S3UJsRpAtd1Lgx9UVLtrqZrQ@mail.gmail.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <CA+hFU4wuM_xHniFyRT+jouQ3k_S3UJsRpAtd1Lgx9UVLtrqZrQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0053.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:82::20) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|DS7PR12MB5981:EE_
X-MS-Office365-Filtering-Correlation-Id: 536adf12-96f0-4f74-769c-08db0eac780e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ta/7HNW4RPfevBJwxYEmDwtJTHSXpxjH+0gjd5mNH2JBO7N/4251rSpRWiCUU2IJw76rAPZPWCknXXHve+auWbZgwcUhhMslC1QP0DN5jPY0ib2d9Qh3NCFmuTao2F10KMqtkQkEZXmNUGFbIHETaJxj5ith6TapffI+7Agvt3CIsbQc7o1J7wdWg0Srg1wN5r5Tly6qSnxutMrp/XhRGYVkkb2T3U+aesTM4BO/57v6kre0ZLlrf9HTzuaPqMaGZVgdtmanp6pJZ2JfFgWTcjtmfq/CODYQWvSrBWtaEQKvO97xP3C2m4BcZd3AejnWrl+0/eLzrN0UBVHSH+XM53aI8xBhW0zx9TC4ieTBeJ1gi8UBgKKlxVI9i2olrtTvzvwVzyjmDVN61hM8eGR4xSAUUEhLzcUUQI1tj6g+BGfm0+IjSZ0VV/cQ3mErbmetTNMfwpVwqBIECSkt0NstE4THsvyo0QpdRMviB+l2BgAWtUvM27B2xX3ZSBDIz4YtqzqFhcqIphM25LUZ9NLUFy+bDErbyv4VVoNupg/m9wDIfP7Z+q66rniIdXgwLhS5jpAKTmIBpLaZPuhx8lzwgmWrb7t+0101Xnd7xOp36hnkC3LF9WEf1FwQWNwchQn9OLbNgxNFumsi5BhIQkjW7Y2r+bgvf0CZ7iqXvRLb18x7bo5loq3aAq/qBOBpqNb9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(376002)(136003)(39860400002)(396003)(366004)(451199018)(31686004)(2906002)(86362001)(6512007)(186003)(38100700002)(26005)(53546011)(44832011)(6506007)(2616005)(5660300002)(8936002)(478600001)(6666004)(41300700001)(6486002)(31696002)(316002)(966005)(66556008)(4326008)(66476007)(110136005)(66574015)(83380400001)(54906003)(66946007)(8676002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEF0SHBZaDZyS2JuT0tEcmJkZk50R0xlZkdMb29nQWUyVUYrL2E5eHk4OExV?=
 =?utf-8?B?b3NzTUFGaWN6TzJGUFA5eDRQV0tEMFZwUGE3SGJReFdsUDJONS9tNnRjTlhX?=
 =?utf-8?B?TGxXUExxcUFNZ3pUTVpJa1Q4TkgvTXZKdC9UVTFuMGpiaHVmd3loZ1ZvL244?=
 =?utf-8?B?bm9WSzVxeUV6dDBCL0N4emVteS9UQzJvT05TRlEzVVYzbGYrclZDTnRlbkJq?=
 =?utf-8?B?bWdVUVp0UU5hRGJjTytaY0JvQUFLS1RHNTQ0WDZVc3JQQ3dycnROZ1VMcXhE?=
 =?utf-8?B?ZHBQVVB3SXFYZTZnWjRMenpFbVF0UElzVGR0aGRMSHZ4R1JxUmY2VnBJWDFB?=
 =?utf-8?B?OXIxNzBYTHpXcjRLYjRtOXlKVFJwNy9jZTAyeHZibkN5TFZydXp4NHFYTnZN?=
 =?utf-8?B?cWliM05iMy9jLytoMTB2OUpGLzVPblh4aVB4Si84eE03SUZYS0trcFFJS1pC?=
 =?utf-8?B?REZBSVhlbjA5UHlKR3RwdSt2M0NPVkk4OVczbEhuUGR6Z20yWnhsM1cvZDN3?=
 =?utf-8?B?bXJudDRyTTF0UFdCNXhRTzc4eUx5cklCejJjeU0xK0pjSEhNaEQ5VFI4ejZG?=
 =?utf-8?B?T21QdjMzOEd5ZTJocnN5anUwK3JFZm1KNS9FcEJjOS8zSGwvUzJTcVVjdmxC?=
 =?utf-8?B?anVsVHpLZ25Eb2Q5Z3ZZaUtNWDhLM1VVZlZpYXBWT0E2QklJQm1FbHVUK1Fu?=
 =?utf-8?B?OGhUNjVBUzZ5VXRMVEJ1Z3Q2b0N3bXMwT0hna1g2ZVp2akRLYk91NDhwR1I2?=
 =?utf-8?B?WjR5c0JoMTE4Wkt1dzlJaDhheEcxSHhCTituZ0RjZy9GQVh4QTZoNXYva3hv?=
 =?utf-8?B?K2hIam9lMkU0VWRVRlBwRkRtVGxVZHFrdWRtczVjYkFBd2twYlg1dVdnQTJu?=
 =?utf-8?B?YzVITUt0cHl5V2wxMC9nWkV0VUtlc0hyekM5THA2OWpsbnZtZHBEd0tkWGcy?=
 =?utf-8?B?YzhhWTQzOE1malNTMFhGMFQwbVA1S0pONXhKbm4xTmF5M3cvdGVnbHRNaU5I?=
 =?utf-8?B?a24yUC9oc09QOW9SQVphYjhCSElSbmFjNSt4a3JPaU05Yzl0ZDFtZGFKWnh6?=
 =?utf-8?B?ZGdrQ3FucWUyUmkvZmpRSXhqb284RXkvS2Y2Z2EzcU1vVUJzSjJTOFJHU1JN?=
 =?utf-8?B?R0I5enlJVGtEMk1zMEtEMjJHbS9BUSt1T1Y4c1BGTTJ6M1E1WHdCWDc1Z0FP?=
 =?utf-8?B?QWdVdTJ3K2tLRzV0UGp4WTNLaUJkZ0RrZ2o4a2VNYlZ4UTRiQWoxcHZMdEZX?=
 =?utf-8?B?TGhuMFF4d1dWTi9wWkpiNHhBMGtBMmU1OUNsSVJUZEFtMUNtQms5Tk1UYnk0?=
 =?utf-8?B?dnJkOTB3UmlZSGlZRng4dlBESTJHdDQ4eTRRSTQwTy95eUcvN1pVUGkwRk9o?=
 =?utf-8?B?TWhVUENlQVRJYVp5YjBvd1RNNGZSN0pkOWRINnVFbmt4aVFLUUxlUXZRemZ0?=
 =?utf-8?B?NHgwNk92Sy80UGg2dlBpK2V2Y0dlUmp6ZEJ1a2hXK1ZvZU9iS1BLa3doV2c1?=
 =?utf-8?B?ekV0cVUreGZmdEdLZTZXMCs2OXhRS0ZIazdxcmFaa0w0ZXUrWkIzY1UwSTl4?=
 =?utf-8?B?ZGxEWVZyV3pZbm9Rbkd0Y0gwdjZ6UEgrdTBlQVNpeHJEYkgrZjJDcnVJKzk2?=
 =?utf-8?B?TFI2STRsemNNaFcvMXdZTTNHRENSQVc1SFR4ZmwwbnowMFlIUkRBZDZCdXZC?=
 =?utf-8?B?U3BmMHJLakxBenZodDFRTlNMOGtiTjdUTWwra0pnYm1JRGdOOUcrVnpxVmVC?=
 =?utf-8?B?Ny9Qd2tnblBtZzJjRlM3RVE1bm1Sam9uTUQzdUxvb1J5RHhsbit3RHgvOHpK?=
 =?utf-8?B?NEJsUnJlbUlwbExaN1lKNkFQbEpNZW9PTHFaVTZWZC85a0N0eEUvRVR0YUNo?=
 =?utf-8?B?dXQ0ajZ3ZjEzVWZ6bW80Y1NGNll3bWhBcC9JL29JZXoyVW94NnBCTWhwVU80?=
 =?utf-8?B?SU9ocDNVK2hJNGZzdVVPY25TSzBURXdmZTFzK0I4ZGU2STNTRmU5NnR4dVdq?=
 =?utf-8?B?Y0NkbmNHSVM1L0YzQTYrMDVCOFUvVHBrbC9DUW9vRXdibVVYYTNNNkRCNldB?=
 =?utf-8?B?REJWYWV6bmh0cTd5aXY5dy9DL3pDbS9qV2Nra2FXRzExdzdqNjRGVDBhUmc2?=
 =?utf-8?Q?PhUcHxChMdy2Gv2ns4n6QIHJS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 536adf12-96f0-4f74-769c-08db0eac780e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 16:56:51.6309 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rVZE4S+iEsQ5HGI8K5fGXxN36Gij2x+KR/9IG2x6TiaIrjXNGJM+NmaviPZwblTPSyX4rn1zXQ/Um1dGY2dRVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5981
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
Cc: dri-devel@lists.freedesktop.org, Pekka Paalanen <ppaalanen@gmail.com>,
 Uma Shankar <uma.shankar@intel.com>, amd-gfx@lists.freedesktop.org,
 Joshua Ashton <joshua@froggi.es>, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/14/23 10:49, Sebastian Wick wrote:
> On Fri, Feb 3, 2023 at 5:00 PM Ville Syrjälä
> <ville.syrjala@linux.intel.com> wrote:
>>
>> On Fri, Feb 03, 2023 at 10:24:52AM -0500, Harry Wentland wrote:
>>>
>>>
>>> On 2/3/23 10:19, Ville Syrjälä wrote:
>>>> On Fri, Feb 03, 2023 at 09:39:42AM -0500, Harry Wentland wrote:
>>>>>
>>>>>
>>>>> On 2/3/23 07:59, Sebastian Wick wrote:
>>>>>> On Fri, Feb 3, 2023 at 11:40 AM Ville Syrjälä
>>>>>> <ville.syrjala@linux.intel.com> wrote:
>>>>>>>
>>>>>>> On Fri, Feb 03, 2023 at 02:07:44AM +0000, Joshua Ashton wrote:
>>>>>>>> Userspace has no way of controlling or knowing the pixel encoding
>>>>>>>> currently, so there is no way for it to ever get the right values here.
>>>>>>>
>>>>>>> That applies to a lot of the other values as well (they are
>>>>>>> explicitly RGB or YCC). The idea was that this property sets the
>>>>>>> infoframe/MSA/SDP value exactly, and other properties should be
>>>>>>> added to for use userspace to control the pixel encoding/colorspace
>>>>>>> conversion(if desired, or userspace just makes sure to
>>>>>>> directly feed in correct kind of data).
>>>>>>
>>>>>> I'm all for getting userspace control over pixel encoding but even
>>>>>> then the kernel always knows which pixel encoding is selected and
>>>>>> which InfoFrame has to be sent. Is there a reason why userspace would
>>>>>> want to control the variant explicitly to the wrong value?
>>>>>>
>>>>>
>>>>> I've asked this before but haven't seen an answer: Is there an existing
>>>>> upstream userspace project that makes use of this property (other than
>>>>> what Joshua is working on in gamescope right now)? That would help us
>>>>> understand the intent better.
>>>>
>>>> The intent was to control the infoframe colorimetry bits,
>>>> nothing more. No idea what real userspace there was, if any.
>>>>
>>>>>
>>>>> I don't think giving userspace explicit control over the exact infoframe
>>>>> values is the right thing to do.
>>>>
>>>> Only userspace knows what kind of data it's stuffing into
>>>> the pixels (and/or how it configures the csc units/etc.) to
>>>> generate them.
>>>>
>>>
>>> Yes, but userspace doesn't control or know whether we drive
>>> RGB or YCbCr on the wire. In fact, in some cases our driver
>>> needs to fallback to YCbCr420 for bandwidth reasons. There
>>> is currently no way for userspace to know that and I don't
>>> think it makes sense.
>>
>> People want that control as well for whatever reason. We've
>> been asked to allow YCbCr 4:4:4 output many times.
> 
> I don't really think it's a question of if we want it but rather how
> we get there. Harry is completely right that if we would make the
> subsampling controllable by user space instead of the kernel handling
> it magically, user space which does not adapt to the new control won't
> be able to light up some modes which worked before.
> 

Thanks for continuing this discussion and touching on the model of how
we get to where we want to go.

> This is obviously a problem and not one we can easily fix. We would
> need a new cap for user space to signal "I know that I can control
> bpc, subsampling and compression to lower the bandwidth and light up
> modes which otherwise fail". That cap would also remove all the
> properties which require kernel magic to work (that's also what I
> proposed for my KMS color pipeline API).
> 
> We all want to expose more of the scanout capability and give user
> space more control but I don't think an incremental approach works
> here and we would all do better if we accept that the current API
> requires kernel magic to work and has a few implicit assumptions baked
> in.
> 
> With all that being said, I think the right decision here is to
> 
> 1. Ignore subsampling for now
> 2. Let the kernel select YCC or RGB on the cable
> 3. Let the kernel figure out the conversion between RGB and YCC based
> on the color space selected
> 4. Let the kernel send the correct infoframe based on the selected
> color space and cable encoding
> 5. Only expose color spaces for which the kernel can do the conversion
> and send the infoframe

I agree. We don't want to break or change existing behavior (that is
used by userspace) and this will get us far without breaking things.

> 6. Work on the new API which is hidden behind a cap
> 

I assume you mean something like
https://gitlab.freedesktop.org/pq/color-and-hdr/-/issues/11

Above you say that you don't think an incremental approach works
here. Can you elaborate?

From what I've seen recently I am inclined to favor an incremental
approach more. The reason is that any API, or portion thereof, is
useless unless it's enabled full stack. When it isn't it becomes
dead code quickly, or never really works because we overlooked
one thing. The colorspace debacle shows how even something as
simple as extra enum values in KMS APIs shouldn't be added unless
someone in a canonical upstream project actually uses them. I
would argue that such a canonical upstream project actually has
to be a production environment and not something like Weston.

I could see us getting to a fully new color pipeline API but
the only way to do that is with a development model that supports
it. While upstream needs to be our ultimate goal, a good way
to bring in new APIs and ensure a full-stack implementation is
to develop them in a downstream production kernel, alongside
userspace that makes use of it. Once the implementation is
proven in the downstream repos it can then go upstream. This
brings new challenges, though, as things don't get wide
testing and get out of sync with upstream quickly. The
alternative is the incremental approach.

We should look at this from a use-case angle, similar to what
the gamescope guys are doing. Small steps, like:
1) Add HDR10 output (PQ, BT.2020) to the display
2) Add ability to do sRGB linear blending
3) Add ability to do sRGB and PQ linear blending
4) Post-blending 3D LUT
5) Pre-blending 3D LUT

At each stage the whole stack needs to work together in production.

If we go to a new color pipeline programming model it might
make sense to enable this as an "experimental" API that is
under development. I don't know if we've ever done that in
DRM/KMS. One way to do this might be with a new CONFIG option
that only exposes the new color pipeline API when enabled and
defaults to off, alongside a client cap for clients that
are advertising a desire to use the (experimental) API.

If we have that we could then look at porting all existing
use-cases over and verifying them (including IGT tests) before
moving on to HDR and wide-gamut use-cases. It's a large
undertaking and while I'm not opposed to it I don't know
if there are enough people willing to invest a large amount
of effort to make this happen.

Harry

>> The automagic 4:2:0 fallback I think is rather fundementally
>> incompatible with fancy color management. How would we even
>> know whether to use eg. BT.2020 vs. BT.709 matrix? In i915
>> that stuff is just always BT.709 limited range, no questions
>> asked.
>>
>> So I think if userspace wants real color management it's
>> going to have to set up the whole pipeline. And for that
>> we need at least one new property to control the RGB->YCbCr
>> conversion (or to explicitly avoid it).
>>
>> And given that the proposed patch just swept all the
>> non-BT.2020 issues under the rug makes me think no
>> one has actually come up with any kind of consistent
>> plan for anything else really.
>>
>>>
>>> Userspace needs full control of framebuffer pixel formats,
>>> as well as control over DEGAMMA, GAMMA, CTM color operations.
>>> It also needs to be able to select whether to drive the panel
>>> as sRGB or BT.2020/PQ but it doesn't make sense for it to
>>> control the pixel encoding on the wire (RGB vs YCbCr).
>>>
>>>> I really don't want a repeat of the disaster of the
>>>> 'Broadcast RGB' which has coupled together the infoframe
>>>> and automagic conversion stuff. And I think this one would
>>>> be about 100x worse given this property has something
>>>> to do with actual colorspaces as well.
>>>>
>>>
>>> I'm unaware of this disaster. Could you elaborate?
>>
>> The property now controls both the infoframe stuff (and
>> whatever super vague stuff DP has for it in MSA) and
>> full->limited range compression in the display pipeline.
>> And as a result  there is no way to eg. allow already
>> limited range input, which is what some people wanted.
>>
>> And naturally it's all made a lot more terrible by all
>> the displays that fail to implement the spec correctly,
>> but that's another topic.
>>
>> --
>> Ville Syrjälä
>> Intel
>>
> 

