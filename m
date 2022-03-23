Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DECE4E4E04
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 09:19:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7B6110E646;
	Wed, 23 Mar 2022 08:19:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062.outbound.protection.outlook.com [40.107.94.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA02A10E63F;
 Wed, 23 Mar 2022 08:19:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g6bc7K9mQDtxIEOujM/33Xyoyx7/eKtPFScTbIgh7iQkS19vnQ8xmg7mHkhRdXxU5D1XRvVWsYimDcEvfMVLbwFT1ESZdQ6Zs+g21P0OihVJXqKUzzF6zr2H0xxoRio+gkpdNAqHrRNeSridFly71TXoMC0Jb2gVifLHCZRtvorakCB7QSTkV/pV/8U7Wl3a3gmfsTdJNDMia8yiNgYfmxcXrh/UM0TKEqzF+kQBUxSwzrm0x7nYPwadWG4qP7HfQF7jxROXTt2Kq7+fJdCiLdTIJlYvtc4JQuN0AgSVsdU6utUXzWVM0gyqIQMWxPqVfg0ReWb2RAXxpNCF+46CvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=53eLsJ/F+Dak1FO7bR2OZF7aZ7HllSPP1FlnGO1rd5g=;
 b=Otp0q+RSwGOPrk61/O9nN+GWGjjPzZAFaUmHImcAgCFIKEs+c2PLe6U3YIYs+9Wyq7JEmnt5HFilRaYjytS5hfFcoadhwKAQVmGzhvsFR/Xa0BsWcQV+MEM9Z98FME0e9NlkX7ThMiIV9xMuUSIB9V4xMBH0ZA0AKJAcXX01YqMa9axcA/mVC/YuNMy13xkPu6rs4FBx28v2usbgB8AJ9bZ4wpjfbp4FOjRqOZLXJIhOal5VD6C3RNdpe5cCs9MNeZyeLAIOiIHi/i8OJOGIVVSTKu9da5/EkOU+deY+Phy+v+vF/A5RgqruoH8ZaaaOa76cKIhu8TULNfawU5akxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=53eLsJ/F+Dak1FO7bR2OZF7aZ7HllSPP1FlnGO1rd5g=;
 b=ulBCxasMkT8XbtuDuCqXebaiCLJA5jpuzcQ9FpU9hVvP4G/7FB90W4IVF6Ai3OciMBHojE528XuXNuNVHXlpDT10eNpgZeQKOM9Nzn9I5sZxt+z5BqNKgyGFj8v6aphRPf8fLTwzBKGMY+F8i/1yVjDVwpvzKFsYKHBWlJ9Dpjs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH2PR12MB4972.namprd12.prod.outlook.com (2603:10b6:610:69::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Wed, 23 Mar
 2022 08:19:06 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5081.024; Wed, 23 Mar 2022
 08:19:06 +0000
Message-ID: <398f8851-d37b-4020-24ce-8f2ab9723e40@amd.com>
Date: Wed, 23 Mar 2022 09:18:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Commit messages (was: [PATCH v11] drm/amdgpu: add drm buddy
 support to amdgpu)
Content-Language: en-US
To: Paul Menzel <pmenzel@molgen.mpg.de>
References: <20220323062552.228429-1-Arunpravin.PaneerSelvam@amd.com>
 <7addb3e7-d265-c1a7-d449-7d0056f06d63@molgen.mpg.de>
 <fc60c561-c12a-c031-9558-abae3e3474ec@amd.com>
 <6f0888a2-f74d-f41f-d593-a8362e7dc673@molgen.mpg.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <6f0888a2-f74d-f41f-d593-a8362e7dc673@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0019.eurprd06.prod.outlook.com
 (2603:10a6:20b:462::12) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a5bc1b4c-602b-419e-c585-08da0ca5cc0a
X-MS-TrafficTypeDiagnostic: CH2PR12MB4972:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB497270A86CEB62F70F07D49183189@CH2PR12MB4972.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oFeW1fNUGmODbRtRqM7SR5Do15rICZeXDwffgfnn/IpvbLewlMX4na5U/vnkD3FUrJeCv3bQAcB38NwR6zIgVN4BO6B4JioEs5EyRVzvpyM9V2oRdyMDHWoTjE+mcJywEWA8sW/HmjvTckqgBzARW/qXTNiA/P3EmafRzb9yF/BDCm1J9leXrSq+6ONrFgtobD81ZrfhrN3h8+/aPVH62B0KB2XzARUnYVP4n6U3y9lgLHNL4kxSRJalezLW8fA143AbkHj49qL4zirWrStsc2LH5U9GWRxGSXSmBjo0R4EpGucvObgqmL/y/g/oC8ZxHl1mQBsYE/RaEElp11CRRvSOYG/Nn8zdbo7bxjohktlK7ik3LWCjYStB3+F1Z91dtZuDiJsOgNdiS8Lk3601KqgqyVSSI4umzwi5FTiYQb7SLoEaIrXG0vuGTwydmFXAOdMBKjlQogWp16Csb3GnF497MoenCQuU/IcOTmWQxtdrUgEhKwOT42WB8lHaTEAXqYQP5H9wO/rLdiNAiZYhKoIEgFCKlRav40rukiVxlGTzArkLxwzOJ1k0Yl2gBsoH2d7xMgYN8wcP6CQ0ju/5W7mfmwdplZ4PZUI4B7dJUl9oLUEuj4oRi5qWR5Cto9e/qquzUa5ig+Poq+faYL+iRyZ61Z9PGi/Niegp1f3sJt+xTyYj10wJYu30R7eHgCO8JjIC9EIc//b4Rv/v/ZcPsrC2Satkf9s5XLEeWJGGg91ad3LOsLrpwKPdLx+QZCytJQ8DKiI6CuJHND/gRxg9mCsuOdKyHxfIJGGfOGm9TbOwTJXC/EDb8klagNthkpFt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2616005)(8936002)(5660300002)(45080400002)(38100700002)(186003)(2906002)(6512007)(26005)(6506007)(6666004)(15650500001)(83380400001)(66574015)(86362001)(31696002)(966005)(66946007)(66556008)(66476007)(31686004)(36756003)(4326008)(8676002)(316002)(6916009)(508600001)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODBXcFozWW5vd2ZBcXZGMmxkYWw0bDJhblVDd201TU9uYUs4dFRyc3RObk9T?=
 =?utf-8?B?Qlh0NGpzNlFLRnRGSGtJeU5KejRPbzRsRnd2bWcrcVF1a0pobVdNcHNpWUJW?=
 =?utf-8?B?TWY4bm55RDZDb0JRZWh3T3AyOVV2NFNJUmpUSkdDMGNRSHZkSEhOWlh0c0dh?=
 =?utf-8?B?ckJRN3BudUlvb05yWGZPU2tjcVkwTXRPRDRIcVUyK28vL0taS0o1WGRNdjNy?=
 =?utf-8?B?RlNodFo0UGRwQVNwM3RDellMWE91cm50YjFiN0txdjB0dEJoNjF2WGtWQSsx?=
 =?utf-8?B?eThtM01RN2tQL0kyaTBqOFJNci9SS3FockNSVE12MkVlVHQ4R055c1BzUXY2?=
 =?utf-8?B?UnZjVnA3Qi9yY3hGeiswYlpPeEY0dVpseGtoelNteUhzZHRDb0laaDhLbG9W?=
 =?utf-8?B?ejFzU0R1ZHpKWmladnJYeVB4ZFdYU2c4ZzR1NG1LMFZUY25zaEw1T2NNbE9O?=
 =?utf-8?B?V25JN1poRTdpV3hUSkJqWGJodUZSQmQ4V09kT0EyU043bXNJTC9MSUwxUCt1?=
 =?utf-8?B?bmNORkg1SWtwV3lpdGVBd1ZkSGdKbGZ5NDZqa1l2ekgwdTlYdXl5NEQwU1Yz?=
 =?utf-8?B?cmczczRFVCtEMExWc0J0TXJuYURwZmRucUVTZDgwU254QUNaRVYzTDFYMndL?=
 =?utf-8?B?UXhiYVF4MmFnRmE2QjRmeEc3YUpHcDdWZjJiaGFDdlN5ZUg4T2lVc2taandP?=
 =?utf-8?B?cCtZMVpUZEt5aXd6ZW9tZ2syc2p5bWZiTG1RMjJ1YjJUSWIyWk9xbEtRU29C?=
 =?utf-8?B?U2JxV2VkTlp0SS9mMG1ETXVmZVIvdHhuNWs3bmNtNlFGTjM3Z2hEbUI2c3g1?=
 =?utf-8?B?SEZ3NThIWUU0cjNaeFF5M3Izc0NOMloxRFdkSldIQXZMalJoWTE3RVdOUDhY?=
 =?utf-8?B?ZWRXNVd3Mk5LOFRZQzJnaFQ3NmRKbllCQlFRNlZSbDhod20xL2dqdm9rbWgz?=
 =?utf-8?B?N1hKRUJFdjk5YUJEN0JjenlXbVN1dDNPampCblAvc0xxYWhhOGVJYTBmZ2dm?=
 =?utf-8?B?WGFaQ044cjJnSjZ4NXRzbHEyL0xhNUNRVDJIZklmVWt5WkNxVXptQTVzd3NN?=
 =?utf-8?B?aXhjcS9yRUFPUnd5d1NBRzlRMC9uLyt5WldJcS9BRGhCNHhPMmdYTkM4am1x?=
 =?utf-8?B?V2JnZlpGT2RQWFVWY05mRkNyLzlEY3Qzd0psdlFHS0piRVNQazhaSDRBVFor?=
 =?utf-8?B?Y2pLUUN5MzRneStsRTdSRVFRNmxGb1dCdXlxYmhlOTJsaGE4K2ErSjhjNXMy?=
 =?utf-8?B?b3Y2REFzZ0lZZHZwRndsKzRtbHpGL1c2Y0p3MzQ5cFhqVU9tck5DZkVSWjV0?=
 =?utf-8?B?dVpjbllOT0pINTRnVytqa2pyTWhOODd2cTczUGhjK2doakRWQ0dMU21NNXV1?=
 =?utf-8?B?eTFnM25xTjFxVFhzb2k0WDR5eTV1SjVsaUN1bjJPK05jWEZ1T0VQUHZEeUty?=
 =?utf-8?B?MmplL0NJVWVYVVordzZ3bjl6akxYbWRTYlp1SlFuUjlEeFI5cUcrM0t6MHpI?=
 =?utf-8?B?RXhFZ05mcFJBN3ljT0dFaW5rWVpxSmp5Sis3RGRVUnFTTElmTDkzSkhLOGt5?=
 =?utf-8?B?OThGaVhLQnRvK1ZNNDAvOU5XQ3Rtd2JwaHA0aTdwenlWTVF4aUVWRlJ1REor?=
 =?utf-8?B?SGtXVHFSSlNIZVRsT3BJZkdDR0JoTnkyWFhzbGVFNVJTQkxjSkxtNE9laU5E?=
 =?utf-8?B?dk44UWxLTGdVOXNSdkJoSlI3VElwd3BvRjVJc053cHRkcFVEMnVRclBHaW9D?=
 =?utf-8?B?N2Q4M0F0bm5QYVo4LzRIQStxckliUDdJTzFLRmlLM0p3WHQ3Mm9lK2R1SUQ0?=
 =?utf-8?B?VTFNY2RGdHhjWnd2REY1b0x6c2JsdlQvTEtPcGNweUNMK2x2aUZyaGp4eTk2?=
 =?utf-8?B?bEtVRklnQ2hHYktrNXErUS8xdGdraU13UHZoN3pqVXVxbElOVmdYQXp1d1Ax?=
 =?utf-8?Q?wdZ6Pvv28kCQuzd0aEQl7yUZxqoixGr5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5bc1b4c-602b-419e-c585-08da0ca5cc0a
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2022 08:19:06.1553 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 718i0gN/gt1Rd/Cyau00MidWyseAoT/B+224nel7y9bZsNyDdzLP0kMH9vzPXZCr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4972
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
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul,

Am 23.03.22 um 09:10 schrieb Paul Menzel:
> Dear Christian,
>
>
> Am 23.03.22 um 08:42 schrieb Christian König:
>
>> Am 23.03.22 um 07:42 schrieb Paul Menzel:
>
>>> Am 23.03.22 um 07:25 schrieb Arunpravin Paneer Selvam:
>>>> - Remove drm_mm references and replace with drm buddy functionalities
>>>
>>> The commit message summary to me suggested, you can somehow use both 
>>> allocators now. Two suggestions below:
>>>
>>> 1.  Switch to drm buddy allocator
>>> 2.  Use drm buddy alllocator
>>>
>>>> - Add res cursor support for drm buddy
>>>
>>> As an allocator switch sounds invasive, could you please extend the 
>>> commit message, briefly describing the current situation, saying 
>>> what the downsides are, and why the buddy allocator is “better”.
>>
>> Well, Paul please stop bothering developers with those requests.
>>
>> It's my job as maintainer to supervise the commit messages and it is 
>> certainly NOT require to explain all the details of the current 
>> situation in a commit message. That is just overkill.
>
> I did not request all the details, and I think my requests are totally 
> reasonable. But let’s change the perspective. If there were not any 
> AMD graphics drivers bug, I would have never needed to look at the 
> code and deal with it. Unfortunately the AMD graphics driver situation 
> – which improved a lot in recent years – with no public documentation, 
> proprietary firmware and complex devices is still not optimal, and a 
> lot of bugs get reported, and I am also hit by bugs, taking time to 
> deal with them, and maybe reporting and helping to analyze them. So to 
> keep your wording, if you would stop bothering users with bugs and 
> requesting their help in fixing them – asking the user to bisect the 
> issue is often the first thing. Actually it should not be unreasonable 
> for customers buying an AMD device to expect get bug free drivers. 
> It’s strange and a sad fact, that the software industry succeeded to 
> sway that valid expectation and customers now except they need to 
> regularly install software updates, and do not get, for example, a 
> price reduction when there are bugs.
>
> Also, as stated everywhere, reviewer time is scarce, so commit authors 
> should make it easy to attract new folks.
>
>> A simple note that we are switching from the drm_mm backend to the 
>> buddy backend is sufficient, and that is exactly what the commit 
>> message is saying here.
>
> Sorry, I disagree. The motivation needs to be part of the commit 
> message. For example see recent discussion on the LWN article 
> *Donenfeld: Random number generator enhancements for Linux 5.17 and 
> 5.18* [1].
>
> How much the commit message should be extended, I do not know, but the 
> current state is insufficient (too terse).

Well the key point is it's not about you to judge that.

If you want to complain about the commit message then come to me with 
that and don't request information which isn't supposed to be publicly 
available.

So to make it clear: The information is intentionally hold back and not 
made public.

Regards,
Christian.

>
>
> Kind regards,
>
> Paul
>
>
> [1]: 
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flwn.net%2FArticles%2F888413%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C466afc41893d4f43ab6a08da0ca48c0a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637836198129744073%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=Ar0P8Yc61MTXP0khtoH6WVRDAKhvxXNaOJY0LRnl8Qk%3D&amp;reserved=0
>      "Donenfeld: Random number generator enhancements for Linux 5.17 
> and 5.18"

