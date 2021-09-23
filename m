Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1EF416028
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 15:40:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D65DB6ED22;
	Thu, 23 Sep 2021 13:40:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2083.outbound.protection.outlook.com [40.107.244.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D976ED22;
 Thu, 23 Sep 2021 13:40:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SMAy3DGVQqv4y2bZKx8ocVAtjLNojBpzpusGvaCoBEvGKPMU1bFccHy1jlpksigbpt4AOYdePxuXtwcIx12aUsGsJJGQkVfUzQSC43VIUTL9a/dN82x80iUFEuBTe2mPdyY8/T3ysPO0NoydYNL+6XkiCL1U4xlLKjX4s3D/FXe6xyackih+TnADpKfD9l3dpM7NAVd95ISK4dIePBOoEItOJI0u6aU7s1JsOhkarQ82K5nu+ktjp/2vIfCpsqCzSEUVkHtOmm4cxitDoz3tKKC8LWtWOnZtNlYc7ru2TnsfsW/Xn3GQm5Sl8uKf6CFeEF+Q9MANYFr05T06FACilQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=zjaXWFFkxeu2jzdOiC4H90ewpU0DXdir5Dhh5O7RdtU=;
 b=fssR9bzUaE3IyZ1jC5KzpkKmR40PzUE3QkISxcglHLj2DYxHyeEhe2Dd2iArREY/uw9Z8bYxheV0/TDLIXLuPImyu/lfPdmZdlng53nWYkqrHsUNAdQcBfAzZI/6UlfmGHdoUKxn2qmBokhoEi01z1gQRgtOTaShODNDXgf/VQMNSAhpWxHsgovH7JZP4t9oS3CMEOIyxbAAaAq996G/e+lfRkdojvCm8j72cWM3Cx5m4WUXX0qXfCtHYrILn3Kh3J6ZOgKxI/8twQsD3YEGReJ4lCCbIiNgpBYKSeC1q4wpXmL86uer0nKVIN5+7h7jeISWstjDLD49NsIngKemOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zjaXWFFkxeu2jzdOiC4H90ewpU0DXdir5Dhh5O7RdtU=;
 b=lmrd4e8P6siatT02rhXZ3lg+faAYQc9J3nGcZEuyDkQ2MEB9JuyjeZxIhPvfpNrd2FqUmevdz+VXVdT/6OP+TtrjirHoMduQGT1dtk8bqz6qGJNZeRYFXpga1OO7k6LnYIImBTbbXPZmh+WX8oJUR1J3kqhEvdTZ8C0lQPqMvIE=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5457.namprd12.prod.outlook.com (2603:10b6:5:355::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Thu, 23 Sep
 2021 13:40:14 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::d82f:e8c3:96ac:5465]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::d82f:e8c3:96ac:5465%9]) with mapi id 15.20.4544.015; Thu, 23 Sep 2021
 13:40:14 +0000
Message-ID: <27a41be5-3563-6334-7bf8-e6d8f334359a@amd.com>
Date: Thu, 23 Sep 2021 09:40:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [RFC PATCH v3 1/6] drm/doc: Color Management and HDR10 RFC
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 sebastian@sebastianwick.net, mcasas@google.com, jshargo@google.com,
 Shashank.Sharma@amd.com, Deepak.Sharma@amd.com, Shirish.S@amd.com,
 Vitaly.Prosyak@amd.com, aric.cyr@amd.com, Bhawanpreet.Lakha@amd.com,
 Krunoslav.Kovac@amd.com, hersenxs.wu@amd.com, Nicholas.Kazlauskas@amd.com,
 laurentiu.palcu@oss.nxp.com, ville.syrjala@linux.intel.com,
 jeremy@jcline.org, Brian Starkey <brian.starkey@arm.com>
References: <20210730204134.21769-1-harry.wentland@amd.com>
 <20210730204134.21769-2-harry.wentland@amd.com>
 <20210915170127.31377385@eldfell>
 <4ed51ca0-ca98-cf84-33ed-ab172e3548d3@amd.com>
 <a13d64b1-7b24-5fd5-41d3-b55d2bd388e0@amd.com>
 <20210923110130.1928d8bf@eldfell>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20210923110130.1928d8bf@eldfell>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN0PR02CA0019.namprd02.prod.outlook.com
 (2603:10b6:408:e4::24) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
Received: from [10.254.41.68] (165.204.84.11) by
 BN0PR02CA0019.namprd02.prod.outlook.com (2603:10b6:408:e4::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.14 via Frontend Transport; Thu, 23 Sep 2021 13:40:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dfb68d89-bb5e-4e44-bd54-08d97e97ab9b
X-MS-TrafficTypeDiagnostic: CO6PR12MB5457:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR12MB545708F238100FCEB1F57C018CA39@CO6PR12MB5457.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9ywTExTK+Hl+hA1B9H8H9KPLVradLwvQ/CX9vCm/u+CmvGwOGwku3RXGWeMeAcUPLwCo7mg9ne3RwMqwq4A5WMR52Wd2w9/p9UmIsVCZHLG/c1hFrxfnTUjXSwGLnExtJRnDuby2K3uJKeseZWG5wQSSLO3y+0orGNdVcznZaW/cS8jZVaiUx83XQU6E5YZjCuCT+VbdrOB4graMqp7+fs7ZEz/EU4BRNq+p4rNLOPQnXRcO1ovvohadCJRn5hw7onzpLzKLPZN5f0FotCsHtXRWuoS0UHdN0DWipGLZWcPFpjEZslvfcHEB402zcMN16K0IQqkHSxOgPBD/S3sIdKrkXpS9kC8pn8zSGCsPGWLnAFa+71RCc+LJPV7p6d34bPxOSutcWh4pTQJ834X7tcfCvQL1VxhkAw4fDCiuSiapYYQbNwequfaQK/abyc33Syjrewt0Jn2SDp87/nGIClnhw7ceOpN6E66HAOAl9ejKdkttZpJpIYFDsd/FIhXaNcoP+5VSwvRfnxTwe/XlYFT3gMiJI5xJ9Rcu9mRfHQZio9CEq1eR6Np/vnB3csF4bLu9spkYyioCsSmybhvT4PnUSoXYfZuAMiPFE+l4OZFL9XKa87akuAUDu18o2q9U8d0ZAHHkzxzZJbRryiCCALoaQVgZTkL10o8FYrX4vZqRuPTMlYNWlaRFw+ivF7Nq4PI0STW+wJa9cK8fXmm80xcEKFsIuprp+7dgKSxcMU4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6916009)(31696002)(86362001)(44832011)(83380400001)(508600001)(66476007)(66556008)(36756003)(7416002)(6666004)(8676002)(66946007)(2616005)(956004)(966005)(38100700002)(2906002)(8936002)(5660300002)(16576012)(4326008)(186003)(316002)(53546011)(31686004)(26005)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVdPM0w2V3Z0UU1nVy9QamY4K0xOT1ZtYW9QNURQSXRWS09lemVaVXlEUmZv?=
 =?utf-8?B?eVVnbmdnakxSRFVveS8rRWFYQWNmMXZJV3dQWHUrV3ZpZzh6VFJnN0E5SnBn?=
 =?utf-8?B?MmRKbVh6U1E2S090ZzI2R2ZKRWR4Z2VMZkxjWTQ4MjJ3cFlQaEZvb0sxR3Vu?=
 =?utf-8?B?czFsMnNXc3JjVzVQclFCVzgrbkZzcStqVnZXaXZ4MzQrYUhmeXgzN3BJcDFt?=
 =?utf-8?B?TzZZd1dBSWVwZFNsSE1pcHVlTTFPT1ZteWYxaHgwbkNpVnpwWmc0UjVjZCtC?=
 =?utf-8?B?L1BIRGM0K0ZMYnlGQThlb1JPUWQ1bUUzakk0ZlFsQ0ZaT3hIalBDWk5aU0tJ?=
 =?utf-8?B?dENwSTdFb2w1OFd6VUNwMlo5S1N6YU9qQXh3cExnUlRGTWJhSHN0UERhYWVL?=
 =?utf-8?B?VGZ1Sjh6dm96Nk43QUt0V3lxWkRXK2d2K1VMWFI3MGxITmgzcHVvSVhhVENJ?=
 =?utf-8?B?RUplNG5GSlBEbnk2TnlqUmRLVlY1ZzJjZTJOcHk1bWNtZks5aEZMVE5tMXBL?=
 =?utf-8?B?V2JaOUZ3ajgzc1J0YWVJL29naTZVaU5mdFhkdlA4eTRwTEd0OS83cHUrNmhI?=
 =?utf-8?B?a1VuWVlxOFgyR05kWkJ1RHJraXQvQzh4M1Q0TGZzUHRoTEdFQUZuUnByVndu?=
 =?utf-8?B?eHVlenE5NmJ6Y1Z2WmYyRmxWb3pQeVdVQWg3UDFKVXhBRkV3MFNROTJqNXVE?=
 =?utf-8?B?VjhLSEhzM0NjUy83c1JPalpKR3NJNzJjOWZkVkpNMUhwMzRMcVZmWUxrR1ZF?=
 =?utf-8?B?M3Bqc2ZZelZjNXo2VnR6THVYVnZyTlVFTmJXRjBDM2ZDTVJiOEJLazhhL3BF?=
 =?utf-8?B?WmMzbUZTcWNXL3EvZjlSYktVdjZQUEx5VzFnN21XRnZWclpMcTdBZ3hzUGNX?=
 =?utf-8?B?dlpTcnA3aW56cERFcTJwUGVBbzlmT0t1K29HaTBqL0lDQSt5ZmRvS0t2QzRi?=
 =?utf-8?B?NGo3TG1hWnkxdExoOHl1dTZ0TDNoalNyaFJFMzJCSEhET2ZPV0RzVzExRkg1?=
 =?utf-8?B?RnQxSUZXMjhNVThqTURDc1cwa0JNT0NFdko0WGdVakpHZG1WYnRjWE5zOHJV?=
 =?utf-8?B?WTk4Mll4a3ZJakhYNExiWWs2V0RScGZNa29kVGVkdjRqQkVkd3E1bHB2dHh5?=
 =?utf-8?B?Nkk1MVZ6OW9CM2FIQnlEaEh0RktOakFDOFYyRFFjbWlycWtNV3I1REJnYWRv?=
 =?utf-8?B?eWVVVG5kUGVvTldOVjlxRzMxaFZUUUREc1NVWk90RzN0SWhmbmMzUFdIWXVM?=
 =?utf-8?B?dnl4VDI0RXljTExhTXlGTEM3S0RxaWZBbUN5SDBpTXpxcEc2bFkwTXR6bi94?=
 =?utf-8?B?MUJmSVdEcTdzYVQ5elFCV0pxZ1pndE5qeUJzcFRiYWxBdzB5WkkxelZkZmMz?=
 =?utf-8?B?cHF1dG5ENUtSYzRlVXhkZUJrdkhHRlZIaFh5eVYwVUJzUXV6ZGxyQk15RW5l?=
 =?utf-8?B?b2JUVzBoaDRoQlBoUjRnRW9qNmNmRDlPNC9SUmpHZ3R6NVA4SlQ0ZVhuSEtR?=
 =?utf-8?B?N1FIYnNYbTRyUmQ3Tk5BeGJpbGc0MGZrdlNNWjdxTjd0T1JlY3B2d3lCcFQr?=
 =?utf-8?B?QThJUEhNQmlLTHFvdjA3S1BsczVHVWp6WkVxbyt5K0psU3VRMHVvNFlIV3RY?=
 =?utf-8?B?d0FUNElLMXRIOUk3Ymk0K3c2NnVRSzB3VUdyaXYybCtYZTV1ZSttWWxxM3RI?=
 =?utf-8?B?WUN0RFg2QmMyb2lUZjNQb01tanh0MW10UnpuRnBQQmlzZTkxUzUzU3BUS2Zm?=
 =?utf-8?Q?jsZzlAx/xM8XQjQnbjvBNO/3q0DJfHEIjJfqbrb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfb68d89-bb5e-4e44-bd54-08d97e97ab9b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 13:40:13.8119 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ij+gNEJFgu32liiZ6z2DttWKbApPZs80Rp0Et7MFc9k4KycMR2wVS16d5uGndmhLSG8v8OBtBi4VP5aG+3llxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5457
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



On 2021-09-23 04:01, Pekka Paalanen wrote:
> On Wed, 22 Sep 2021 11:06:53 -0400
> Harry Wentland <harry.wentland@amd.com> wrote:
> 
>> On 2021-09-20 20:14, Harry Wentland wrote:
>>> On 2021-09-15 10:01, Pekka Paalanen wrote:> On Fri, 30 Jul 2021 16:41:29 -0400  
>>>> Harry Wentland <harry.wentland@amd.com> wrote:
>>>>  
>>
>> <snip>
>>
>>>>> +If a display's maximum HDR white level is correctly reported it is trivial
>>>>> +to convert between all of the above representations of SDR white level. If
>>>>> +it is not, defining SDR luminance as a nits value, or a ratio vs a fixed
>>>>> +nits value is preferred, assuming we are blending in linear space.
>>>>> +
>>>>> +It is our experience that many HDR displays do not report maximum white
>>>>> +level correctly  
>>>>
>>>> Which value do you refer to as "maximum white", and how did you measure
>>>> it?
>>>>  
>>> Good question. I haven't played with those displays myself but I'll try to
>>> find out a bit more background behind this statement.
>>>   
>>
>>
>> Some TVs report the EOTF but not the luminance values.
>> For an example edid-code capture of my eDP HDR panel:
>>
>>   HDR Static Metadata Data Block:
>>     Electro optical transfer functions:
>>       Traditional gamma - SDR luminance range
>>       SMPTE ST2084
>>     Supported static metadata descriptors:
>>       Static metadata type 1
>>     Desired content max luminance: 115 (603.666 cd/m^2)
>>     Desired content max frame-average luminance: 109 (530.095 cd/m^2)
>>     Desired content min luminance: 7 (0.005 cd/m^2)
>>
> 
> I forget where I heard (you, Vitaly, someone?) that integrated panels
> may not have the magic gamut and tone mapping hardware, which means
> that software (or display engine) must do the full correct thing.
> 
> That's another reason to not rely on magic display functionality, which
> suits my plans perfectly.
> 

I've mentioned it before but there aren't really a lot of integrated
HDR panels yet. I think we've only seen one or two without tone-mapping
ability.

Either way we probably need at least the ability to tone-map the output
on the transmitter side (SW, GPU, or display HW).

>> I suspect on those TVs it looks like this:
>>
>>   HDR Static Metadata Data Block:
>>     Electro optical transfer functions:
>>       Traditional gamma - SDR luminance range
>>       SMPTE ST2084
>>     Supported static metadata descriptors:
>>       Static metadata type 1
>>
>> Windows has some defaults in this case and our Windows driver also has
>> some defaults.
> 
> Oh, missing information. Yay.
> 
>> Using defaults in the 1000-2000 nits range would yield much better
>> tone-mapping results than assuming the monitor can support a full
>> 10k nits.
> 
> Obviously.
> 
>> As an aside, recently we've come across displays where the max
>> average luminance is higher than the max peak luminance. This is
>> not a mistake but due to how the display's dimming zones work.
> 
> IOW, the actual max peak luminance in absolute units depends on the
> current image average luminance. Wonderful, but what am I (the content
> producer, the display server) supposed to do with that information...
> 
>> Not sure what impact this might have on tone-mapping, other than
>> to keep in mind that we can assume that max_avg < max_peak.
> 
> *cannot
> 

Right

> Seems like it would lead to a very different tone mapping algorithm
> which needs to compute the image average luminance before it can
> account for max peak luminance (which I wouldn't know how to infer). So
> either a two-pass algorithm, or taking the average from the previous
> frame.
> 
> I imagine that is going to be fun considering one needs to composite
> different types of input images together, and the final tone mapping
> might need to differ for each. Strictly thinking that might lead to an
> iterative optimisation algorithm which would be quite intractable in
> practise to complete for a single frame at a time.
> 

Maybe a good approach for this would be to just consider MaxAvg = MaxPeak
in this case. At least until one would want to consider dynamic tone-mapping,
i.e. tone-mapping that is changing frame-by-frame based on content.
Dynamic tone-mapping might be challenging to do in SW but could be a possibility
with specialized HW. Though I'm not sure exactly how that HW would look like.
Maybe something like a histogram engine like Laurent mentions in 
https://lists.freedesktop.org/archives/dri-devel/2021-June/311689.html.

Harry

> 
> Thanks,
> pq
> 

