Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C5768A32E
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 20:44:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FACE10E095;
	Fri,  3 Feb 2023 19:43:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2059.outbound.protection.outlook.com [40.107.96.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E33B910E009;
 Fri,  3 Feb 2023 19:43:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QhBdqq0WFdeCOAAhDKFD4+dJbTLDc0+J7yCewjJe/hSrELJwfQb32w0s3sdhXbdmyKP5W+4EuohBDW7TeUUfoH1MUjCWpeDGTQ+2WgNU+qHIQmW/fsctpHMhMXdMY6HO4/lLCws4LgdPMBE5Gg5mDnFqGx668XHAMSwbSTPD6DU+aPUgOFqdeeGRemgk/EMAADGl55wjF7/y7vnFO5lA0a/9WR47i74HZUH7s2XS3HWVeqc7gDWs6naCN1rhmF6y6YX5eFF/3wbrrEqMB2fcLGBuBd4/3ilo8H8TwYATM6RwncXtapuslSkt1K2SeAUq5bv6H7TzNVz/KV5LLMj0ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HdavGXPAp8KiD6WnEifP9Sc+EQEMu9vn/7kZbllXR9M=;
 b=ChQc3nT8TEw5ZiI8WKL+jlLdCgoGc0ktv7u0lerJxOBZRMy7nI0Xy0FH+wgAPHRNNRoXd9RBCu/MRxhLt8kxLHnEI6Avd9/8QJ5TbEhelnSgGXqSpD9I5GysIH6SB78h3XlUjTUxN1UJLHoKrXCFD9fCBLVfQmPvHuXqtzgKSWUET0rS/4T4DKZklmC9d4l4VBFqQigufRpZXcy+FotDHdbbqe2HnZJx4f+HMZIKmOa6+HFVVcCloha5jOaQIqMYDpXLuFJPbvybNARqkDnHYp8SvektWmH9Hp6PnNcP7q0rQaPRzCWREChP1a0XF0od4qeP8yb/4wItTCR0zF14Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HdavGXPAp8KiD6WnEifP9Sc+EQEMu9vn/7kZbllXR9M=;
 b=0AXL4zMOqHTsDnf60ksKcmufeZa3aXBCW3P72x3SDiWUXn/AQnSqzKBQPdAi0eFDkimP4TrkzuCuqq0v68/20nv8fAuEdSNKxvdCkPyP0bC8Hx4ZEdQPRHQZWwrskUajTYddCdyUuvp1LB4VF3VgdWQOFHoIYdPWuoQIe0jd8iU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM8PR12MB5431.namprd12.prod.outlook.com (2603:10b6:8:34::8) by
 DS0PR12MB7804.namprd12.prod.outlook.com (2603:10b6:8:142::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.29; Fri, 3 Feb 2023 19:43:51 +0000
Received: from DM8PR12MB5431.namprd12.prod.outlook.com
 ([fe80::b63d:60d7:923a:4ee9]) by DM8PR12MB5431.namprd12.prod.outlook.com
 ([fe80::b63d:60d7:923a:4ee9%5]) with mapi id 15.20.6064.031; Fri, 3 Feb 2023
 19:43:51 +0000
Message-ID: <70836f99-2705-0512-700b-887f1ca0d91a@amd.com>
Date: Fri, 3 Feb 2023 14:43:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 3/3] drm/connector: Deprecate split for BT.2020 in
 drm_colorspace enum
Content-Language: en-US
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20230203020744.30745-3-joshua@froggi.es>
 <Y9zkef5FjtZ7guVS@intel.com>
 <CA+hFU4ymiOg06MQeKLcn5MSrR=BZnOLODdZCFvGUdWqt_ha61A@mail.gmail.com>
 <0fc18aec-0703-55f4-f635-d09d345e8dc0@amd.com> <Y90l+DY0rSaMvN1U@intel.com>
 <758e5cf6-53e0-567c-c760-5b773bc7a11c@amd.com> <Y90vrEa3/1RbaGOV@intel.com>
 <f9633729-2db0-3bf1-311d-f03bd04d47a6@amd.com> <Y91Y98jyOimabC3O@intel.com>
 <Y91fsmgAx65koWI5@intel.com> <Y91hyNAplv4nuW5Y@intel.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <Y91hyNAplv4nuW5Y@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0146.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::25) To DM8PR12MB5431.namprd12.prod.outlook.com
 (2603:10b6:8:34::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR12MB5431:EE_|DS0PR12MB7804:EE_
X-MS-Office365-Filtering-Correlation-Id: ac3160ec-1178-4aa3-d3c0-08db061ef9c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +5UFb66OKtrx5jeBMFYMjCQbFl4fARAmw/dkWVbFZ7yo7PbsPnK9selkCkYUuwxtQwO2Qoi2qJiBRVEolqibp9mRq+gwYDYXe3o6N2cbN8LmaF8Q1K/IHshvbZj0fr4nzplWPIt0dm4f0/JQJvbH/VcQaIKVM1FWJUdJJGUR3KNKfAXD9lJ9qskFSYBV2F7XloCB+sB7o58q5hhl9bZdZt6ke87M5Xpc7BO1/2uXpXGP7Wh8Ad1FGtpJ+2prHkG3d4Gt6nBwRR0OGBJXZJVHj4oYXiJnI8JZmWQC97Tw5ZSSmXkW4FWmag+lRfO83HXKb9XVG2gjJt+1J0U0adF7pj9dyZKzSS9GYUT6+pCFQu/JN+J1i8kxW8dj+fYfkHo3RnwJW3KiEoN30ieQs77AijQhGIvHPBb+0TBiUS5uK0Uens8/5zVjJydOJ7l8vZJ/UY6rTs0Gn3tSfiQdpgA1IIU3iT+ChTsOooZt7QB5nhTF/Wv5Iu7LPJ8B0nKYsj49j4bq9Ay5NXyANvvKo0qC8iI6S3s8+EgzhBz6U+k1ay6eKfFARX78Q1yp+Si2kDRNoYuvqw4FwVKOuGShfnwK3dggwUmqYyI83tXU9+qREK2uuVYAMzWb6kK10OMX05EnP6K7HX4CuOvtJn8cJrtnBuSNDefKdW92NoWtEpoSqn5PbVWGc9w7127JkZuGYzJe
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR12MB5431.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(366004)(376002)(136003)(396003)(39860400002)(451199018)(2906002)(5660300002)(53546011)(6506007)(36756003)(316002)(26005)(44832011)(6512007)(66946007)(66476007)(66556008)(86362001)(6916009)(966005)(31696002)(6486002)(6666004)(4326008)(478600001)(8936002)(8676002)(41300700001)(38100700002)(54906003)(186003)(66899018)(2616005)(31686004)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MW5WTnI3SVc5dnJmY3BYMUljbVJOem03SUZEaGZwNEUzR3YyUzBWbGVtYld5?=
 =?utf-8?B?VGo1M0VEODVUYlh2ckdtaW9IdEVKM0lXVWNvMDlZam5sS3BtTjdOSklkYS9w?=
 =?utf-8?B?bXk4RHBNYjlVcHpUSWxMNDdDcURGenRRSVRoZGtjTFcrQjZMSSsyNXBiRTBT?=
 =?utf-8?B?VEZ2MHh1TjYrUnovZTJhZWZmbVVOR1dNUk9kZEhkeVMzTEwzTTBxUWhrbGV4?=
 =?utf-8?B?YitFWVlHK3dxSk1VQkI5TnFBblhpN0ZiZlo3Q25rdW9HZTZJUE5ZaUQrYmlL?=
 =?utf-8?B?ZHVRMWtiSG1wMDlOTExtVmwwaUk3SnFBQVc4MEJlN0I0Vm0rMUxpZXdXS2Vw?=
 =?utf-8?B?cEVMOU12WnN4UFoycUxNMFFhQWM1TVNpWFNWb0FuMjJmeFpURWdBcHgzaHEy?=
 =?utf-8?B?eVZiVmhrRUduOFRSTjV0dG1mQUhaTFNUWUFNMzFiOWZzNmVqTjkrVERCcjR0?=
 =?utf-8?B?dHRPdzAyZWVrbjN2c3FGTG1GQlN4RW5pSFJuVW1pd3dMWmRGRGk2UVYwRXBy?=
 =?utf-8?B?bGtzU2FKZkNuUEdCdExobEZWZGNTVXg1NlZ6bk94OWdYMThzdkJmRHRISjl2?=
 =?utf-8?B?SmpnaUhZMVN5b1VrenVrcXp3eEF2enRLM1ZVQ0dtQ1ZOZkU0QnBMcEpiM3BP?=
 =?utf-8?B?d2hsb1AzTzl5MGtBaTFWWXpmNDlDTVlNa212WnRETEtSZ2wwVnVIa0x4YW4w?=
 =?utf-8?B?RE1NYklZcUNIZVEvSnFsNkRiWTlJNC9WTDZKZ3NObTJjaUtrcnBTT2EvRWZY?=
 =?utf-8?B?LzVEN0lYQ2lvYlRuVEdTVDFzYng3WkVva3JiWFpqaFBwMG9heHFkWmNOV1FV?=
 =?utf-8?B?R0tIczZKUkRIQ3J1SCtZZExCS2dYR2ZkblJUWVExZnZ5WGZMa0tsc0x3OGd3?=
 =?utf-8?B?aHMvZzFnalpOK2wxdzB4NVBIc3V2WC9mdXgwNVhBVGdEVU9LaWFSbC9tclVn?=
 =?utf-8?B?RTBXaWZ1VjhpZ0U0VFp4TUhGZWRFL0NibTZYYVRJQW0xdjB4d2s5cExoQUsr?=
 =?utf-8?B?UmpkU2FXaXpoMGRJRnV3d0doZHlZc2VnREV0WkVSYjZrQmNBQjhhMjZ3VndE?=
 =?utf-8?B?dUcwc29pd25JVVFDTSttbzVCSzM1bGZNRS96RUZmd3N6RTg5d2YzczRIaHhM?=
 =?utf-8?B?eHd6NjUxYjRLZmk5LzJYV2hYbjNTTEppQVNyTVFBeVByRlVXd09XdEtLT2NZ?=
 =?utf-8?B?eWxOQUxsRXlxcXVFaWNCRjVxQWNYejA2Tll4Um4vWE9veHJ3MmM2UGJoUFQ5?=
 =?utf-8?B?S2liNEt5KzdkN1pod0hSRzBucEtwV1VQVkg0UEJadW9oNitJcmM4WVYvT2hi?=
 =?utf-8?B?b1lLNGpLQmZxRE5INkdMUzZUcXJqRDk1dUp0OGdRMStPd1FnQk92QUpjSVdG?=
 =?utf-8?B?Zkg0cVRwbHhLM3VHL2VXaCtCUGR2WFVialJ0aTc4amI2bXdTTkN1NEZUT3Ju?=
 =?utf-8?B?REp0UWZqTzdiYUljR3ExZEhzTHMzUTA5bURiUzBuNjUzZFFMcFozY3FDaWdo?=
 =?utf-8?B?N0NzeFlmQzByeHArb1dWOXlwUjFNWnEvUFdGNnV3dG00ZkhZc1J0OW9rdnBa?=
 =?utf-8?B?TzdGOUtaM3RnbHZjcDFmU3RtMjZpQUtiNlk0S0RNUlhFVTBIbUNOKzZGZjlR?=
 =?utf-8?B?bTNnZkNYQ1RpdjhhZEhyUmQxRjF0bVBGTkNCR1dWZXlhcDdodERYYTdWeVI1?=
 =?utf-8?B?WHZFRVNQRE9LdFpTQkE0QzF1N0k3ZFhlNFVTYkxaM04wenNrTVd1eTZEcXFX?=
 =?utf-8?B?MTd3Q29NbitmZzM4aVUxcEhMU0hBVmVtR0pxKzhna1QvY05BVnYvM0FNWG0y?=
 =?utf-8?B?TzgycGgwZUZrbW5PbEQ4NVFZTU1CUTkvMEY4S2t4cVhkYU1UNHpPeG1zNTd6?=
 =?utf-8?B?TENoc3QzcHdST3QxamlYaForTHhFSExkNWlObTAyamhzS2ZyK2RUUU5JTkdF?=
 =?utf-8?B?M2dqUGtaZ25WdGdLczhXMXZTOHdtekx5WkNUSjB4TWhsVkYwQnpydlAzZFRG?=
 =?utf-8?B?eW5kM1NyNjJaU24wQ2JsRW5yQ2xnM2hyaEJMQUJ5UVlsWVE2ZjRKT3lEb2tH?=
 =?utf-8?B?Nmk3d0N3eEF2TVlPWlREOTJMM3BBUGZaZHk2aTN2dzA4N1dubGlFOGwwaldO?=
 =?utf-8?Q?4TPayA6QQ/KbeF+XslH3PCe8j?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac3160ec-1178-4aa3-d3c0-08db061ef9c0
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5431.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 19:43:51.3880 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bKS7IAYZl0ChG6Zd8fPdfmEOuxV2TflcGTF18hhD7ywx66PTI1VZ18dTbG5S94doiY6XMGZbZvbeUCDOZH+MDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7804
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, amd-gfx@lists.freedesktop.org,
 Pekka Paalanen <ppaalanen@gmail.com>, Uma Shankar <uma.shankar@intel.com>,
 dri-devel@lists.freedesktop.org, Joshua Ashton <joshua@froggi.es>,
 Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/3/23 14:34, Ville Syrjälä wrote:
> On Fri, Feb 03, 2023 at 09:25:38PM +0200, Ville Syrjälä wrote:
>> On Fri, Feb 03, 2023 at 08:56:55PM +0200, Ville Syrjälä wrote:
>>> On Fri, Feb 03, 2023 at 01:28:20PM -0500, Harry Wentland wrote:
>>>>
>>>>
>>>> On 2/3/23 11:00, Ville Syrjälä wrote:
>>>>> On Fri, Feb 03, 2023 at 10:24:52AM -0500, Harry Wentland wrote:
>>>>>>
>>>>>>
>>>>>> On 2/3/23 10:19, Ville Syrjälä wrote:
>>>>>>> On Fri, Feb 03, 2023 at 09:39:42AM -0500, Harry Wentland wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 2/3/23 07:59, Sebastian Wick wrote:
>>>>>>>>> On Fri, Feb 3, 2023 at 11:40 AM Ville Syrjälä
>>>>>>>>> <ville.syrjala@linux.intel.com> wrote:
>>>>>>>>>>
>>>>>>>>>> On Fri, Feb 03, 2023 at 02:07:44AM +0000, Joshua Ashton wrote:
>>>>>>>>>>> Userspace has no way of controlling or knowing the pixel encoding
>>>>>>>>>>> currently, so there is no way for it to ever get the right values here.
>>>>>>>>>>
>>>>>>>>>> That applies to a lot of the other values as well (they are
>>>>>>>>>> explicitly RGB or YCC). The idea was that this property sets the
>>>>>>>>>> infoframe/MSA/SDP value exactly, and other properties should be
>>>>>>>>>> added to for use userspace to control the pixel encoding/colorspace
>>>>>>>>>> conversion(if desired, or userspace just makes sure to
>>>>>>>>>> directly feed in correct kind of data).
>>>>>>>>>
>>>>>>>>> I'm all for getting userspace control over pixel encoding but even
>>>>>>>>> then the kernel always knows which pixel encoding is selected and
>>>>>>>>> which InfoFrame has to be sent. Is there a reason why userspace would
>>>>>>>>> want to control the variant explicitly to the wrong value?
>>>>>>>>>
>>>>>>>>
>>>>>>>> I've asked this before but haven't seen an answer: Is there an existing
>>>>>>>> upstream userspace project that makes use of this property (other than
>>>>>>>> what Joshua is working on in gamescope right now)? That would help us
>>>>>>>> understand the intent better.
>>>>>>>
>>>>>>> The intent was to control the infoframe colorimetry bits,
>>>>>>> nothing more. No idea what real userspace there was, if any.
>>>>>>>
>>>>>>>>
>>>>>>>> I don't think giving userspace explicit control over the exact infoframe
>>>>>>>> values is the right thing to do.
>>>>>>>
>>>>>>> Only userspace knows what kind of data it's stuffing into
>>>>>>> the pixels (and/or how it configures the csc units/etc.) to
>>>>>>> generate them.
>>>>>>>
>>>>>>
>>>>>> Yes, but userspace doesn't control or know whether we drive
>>>>>> RGB or YCbCr on the wire. In fact, in some cases our driver
>>>>>> needs to fallback to YCbCr420 for bandwidth reasons. There
>>>>>> is currently no way for userspace to know that and I don't
>>>>>> think it makes sense.
>>>>>
>>>>> People want that control as well for whatever reason. We've
>>>>> been asked to allow YCbCr 4:4:4 output many times.
>>>>>
>>>>> The automagic 4:2:0 fallback I think is rather fundementally
>>>>> incompatible with fancy color management. How would we even
>>>>> know whether to use eg. BT.2020 vs. BT.709 matrix? In i915
>>>>> that stuff is just always BT.709 limited range, no questions
>>>>> asked.
>>>>>
>>>>
>>>> We use what we're telling the display, i.e., the value in the
>>>> colorspace property. That way we know whether to use a BT.2020
>>>> or BT.709 matrix.
>>>
>>> And given how these things have gone in the past I think
>>> that is likey to bite someone at in the future. Also not
>>> what this property was meant to do nor does on any other
>>> driver AFAIK.
>>>
>>>> I don't see how it's fundamentally incompatible with fancy
>>>> color management stuff.
>>>>
>>>> If we start forbidding drivers from falling back to YCbCr
>>>> (whether 4:4:4 or 4:2:0) we will break existing behavior on
>>>> amdgpu and will see bug reports.
>>>
>>> The compositors could deal with that if/when they start doing
>>> the full color management stuff. The current stuff only really
>>> works when the kernel is allowed to do whatever it wants.
>>>
>>>>
>>>>> So I think if userspace wants real color management it's
>>>>> going to have to set up the whole pipeline. And for that
>>>>> we need at least one new property to control the RGB->YCbCr
>>>>> conversion (or to explicitly avoid it).
>>>>>
>>>>> And given that the proposed patch just swept all the
>>>>> non-BT.2020 issues under the rug makes me think no
>>>>> one has actually come up with any kind of consistent
>>>>> plan for anything else really.
>>>>>
>>>>
>>>> Does anyone actually use the non-BT.2020 colorspace stuff?
>>>
>>> No idea if anyone is using any of it. It's a bit hard to do
>>> right now outside the full passthrough case since we have no
>>> properties to control how the hardware will convert stuff.
>>>
>>> Anyways, sounds like what you're basically proposing is
>>> getting rid of this property and starting from scratch.
>>
>> Hmm. I guess one option would be to add that property to
>> control the output encoding, but include a few extra
>> "automagic" values to it which would retain the kernel's
>> freedom to select whether to do the RGB->YCbCr conversion
>> or not.
>>
>> enum output_encoding {
>> 	auto rgb=default/nodata,ycbcr=bt601
>> 	auto rgb=default/nodata,ycbcr=bt709
>> 	auto rgb=bt2020,ycbcr=bt2020
>> 	passthrough,
>> 	rgb->ycbcr bt601,
>> 	rgb->ycbcr bt709,
>> 	rgb->ycbcr bt2020,
>> }
> 
> In fact there should perhaps be a lot more of the explicit
> options to get all subsamlings and quantizations ranges
> coverted. That might actually be really nice for an igt
> to get more full test coverage.
> 

I'd really like for IGT to get full test coverage but I'm still
conflicted by [1], i.e., the "chicken and egg problem" of the
DRM/KMS uAPI:

"The short summary is that any addition of DRM uAPI requires
corresponding open-sourced userspace patches, and those patches
must be reviewed and ready for merging into a suitable and
canonical upstream project."

[1] https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#open-source-userspace-requirements

We want low-level function in our DRM drivers and expose that up
to userspace. But when we do so the low level functionality might
be quite broad, e.g., all HDMI-spec defined colorspace formats in
the AVI infoframe, while a userspace implementation (if it exists)
is usually only interested in one new use case at a time. We then
go and define a couple handfuls of colorspaces but only use one,
in one scenario where the encoding is possible RGB anyways, and
the rest of the behavior is left unclear.

In short, what value does a new, well-designed and thought-out
property in DRM have if it isn't well covered by implementations
in upstream projects in production (not just testing, or
prototyping)?

Harry
