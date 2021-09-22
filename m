Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B74A414CFE
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 17:28:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 989B289D7C;
	Wed, 22 Sep 2021 15:28:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2064.outbound.protection.outlook.com [40.107.223.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C43989D7C;
 Wed, 22 Sep 2021 15:28:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YQC0sQZA4HhfqcMULBZAjlUU+BDatQTJEqIeeA+0PsZMoRlqJS7Y0EtNcIGT/JPHAhdFegTg7pCbCigL4XSH1qcGaJC0tJAUYZ8fmhEQE7aV3zv6rwIFAp7RjDx6gCsHPsHmxReDqVHT2bV4rgvBUAPlYKassbA3tLqwYhaPF2lFzMqsIh4XGQ39U91RfFClC1d14Arkp1hDkTrCWf2QsYx/t6zGxI9fkCbfHC7HX1uVn4QdxrcD3ZGXpWrsyLGY9v1Q0u0IBaw8gDVgMR17NKXE9nXJYe4Owq7c91dM7feSYibqbXbx2P98P8joegiXr1otAaN3C8Wy/7V9uaRCNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=G1fOHXxw4KoCjxn5QC+kW69aNX4hSh1x/EIkPzJsev8=;
 b=ZoX06r7btmNDCACkXtUlEECPqd8Ft/TYSclAHq/eQeyEgXeLfrHr3GKHqHbgxxPiGSD0W2yWhmNt5+ZxMFUPrgEJAhxnY2UbkHV7ROHo1NHMzucDIw+/6ynMbQXXgBiluhHuX8nHdKtSRK3Ek7xfG6YPjvDKmnfYpOLKNKvplMyBZ9TBOYe5sYYj90vavLoEErwKYf724js2rBhM+Slk777Bt6wL0ygaAs3NcPrvldiOqU8A737rICSS778XiVsRHZl0OriclPJCHRHClLn7aDmzwrBceW/EIwptPYuokSmF5yZqo+oJFnFHwUOj/8vbAmvSHM+uXmJBnjTO80rb1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G1fOHXxw4KoCjxn5QC+kW69aNX4hSh1x/EIkPzJsev8=;
 b=L3ZNa3tbIMRQ7VhQmQ5vUj/N+cC6MZMSwrSzhn1TwnUX7Lm1GD/i2gBu6hyy98sYmCDpNwbhWdH+1S1XQnG6d2UA9P252N5YrSUnAiXykw0AKcYO232FgGVOfKLC8aoEDieAA/PoAEi1RPJXN8toagpUlCto+z+gL5+I5MmGo14=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5428.namprd12.prod.outlook.com (2603:10b6:5:35c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Wed, 22 Sep
 2021 15:28:43 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::d82f:e8c3:96ac:5465]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::d82f:e8c3:96ac:5465%9]) with mapi id 15.20.4544.014; Wed, 22 Sep 2021
 15:28:43 +0000
Message-ID: <823898e8-a8fe-cc74-e5b4-c4907826efbc@amd.com>
Date: Wed, 22 Sep 2021 11:28:37 -0400
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
 <20210921163158.688c26bc@eldfell>
 <0c673cf8-2b90-c1ca-a0b0-c809e7e10c2c@amd.com>
 <20210922113105.2e42754c@eldfell>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20210922113105.2e42754c@eldfell>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0190.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:f::33) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
Received: from [192.168.50.4] (198.200.67.104) by
 YQBPR0101CA0190.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:f::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14 via Frontend
 Transport; Wed, 22 Sep 2021 15:28:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef98c44e-8581-478e-edfe-08d97ddda90c
X-MS-TrafficTypeDiagnostic: CO6PR12MB5428:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR12MB542896DE312BF1F811BCB4E58CA29@CO6PR12MB5428.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HujBMsoBtR9F5l8hgzRcjHv/F8063Tnp50FC7dFKSQ8aYh8t4fWysyURwOFhnbm02dxyk6AlFGxeaqNMYxcQEG5Vc44DDpZWio3ehjMgjXfJVkjek+GLXLJUWIOMW1rkDggf5rW4Hz7JZoTZnkayWPY5XTsFtsq/fbU/crX7tpz3pfwk+iiUu0xwfhbKnZgV52VmCua7oW/7DKqWgy9IjcH8X+WC9hzBPYwaJ40ZcN1nZKFk0Y0iL3Jc3FaBqoxmnJUtincbbXYKQIXxn0TShMJwP0flxh7QIMJokIbBmNoHiqG+FDyd5sxrpOTv+p1CyYUcQfMcc1eCDvLx7ctXU8xhuqGo6mIxBuG3p3sfLROIlb89N3m7TgHsgjiFpHhbTesmXTkUHjrKyTTiyhvrvDOK0F5D0WAyd6kLNustuvNwLZTNmahJQSOELuxMn/lcOslcUyAR/lZK9mJlS3F+bcbD7tKsq8ub616tVNNvkLL3Lj+005034sWaSClrboVHG88VaoE2aVFTC+uTApTMSUxQVf7L2OKUGg7oLgPVDrZJ+TYWGfVOj2pP2x577Uflc4XL9byNxF+HlB0+p1ITiVv37bco5geHR7B3IthJzkhrQ1sGFnM2zqfQ5+5Kkp0X1Wmf7ZwWRtv1jcMZVsB4aoC4YGe2Rmmyys3hMAnELjwTtA59Mi3pSq0IhVI7AoZeyDq/8ii+SHZu1mv4VTa1XpvUaYMOGlrVTRZ+0ruR+w3HKNNY+iOLCWy9uVdpiyhR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(44832011)(6916009)(7416002)(86362001)(83380400001)(508600001)(66476007)(66556008)(8676002)(66946007)(6486002)(966005)(31696002)(38100700002)(2616005)(956004)(186003)(316002)(16576012)(5660300002)(8936002)(4326008)(31686004)(2906002)(36756003)(6666004)(26005)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGp1SVdpWTlmRzhzTUNzQ2JqYjNaYTZDU2FGL2hPMGdXWGRiWW1veUlmSGtL?=
 =?utf-8?B?ZTlFVnF2RVY0TkVLdDhYS2VIWmhYcjY4TlI0RTYxMDRCL1hDTEY2dmFYTUFa?=
 =?utf-8?B?bkRnejdhSlZMeG9vOE50YlJWemRpaVFsYXNHZUZTR3pSVHJ2aHpRVmI0aXds?=
 =?utf-8?B?L2JzY1BEeXExQjhLOXVFVFlJbE1PMzF6aUhmSUhkYzhSNDJvWVRWd0Y2MkN4?=
 =?utf-8?B?aXFxV0t6VjhlcGovMlhIYmM1LzNNNHp5RUlNWkEvSlgwU1FZS2lBMEZ6QVRZ?=
 =?utf-8?B?enBnWGhIQ3U3bldGdy9VWmVDVGNMV0JueW9FMTB0MXpPNkNtWFJ2VkwyU0hh?=
 =?utf-8?B?ckUxQUFaNGVKeHR5Y2tnZEFaVVphV2Q5SkxQSXl1VUdTWi9hSjZkZzUzYml6?=
 =?utf-8?B?NG9nUVd4L1VQWFdrTVJDNjdNbjc5RWdWdWdiZDFMUGE4OUJIbXFsQm9XQm9H?=
 =?utf-8?B?a3FYQkdVeDVIN3krUkVGNDBUNmJvUkhyYkc0N2ZzQ3BYVmQ0OHJheEtjRUtq?=
 =?utf-8?B?UG5JdHpLbExyMmFXZlB4Vk1sTzJhMWtjTTE5a2FMa3VlVGd2TFc3M0dHUEd5?=
 =?utf-8?B?Uit3QmZ6WEg5aGhubk5MS0JpZUE5SEZUUFd5ejFsaW9pOTJvZStDNmRBMDF6?=
 =?utf-8?B?WUhRaC9xcW9uREtNb1dzV0VaOXVlWWtUU25DTnF2T1BhWnF3ODIwRWxtRmVZ?=
 =?utf-8?B?eW9nenFiZ1d3RG1yRGhFNnlMVjd1UDJCcWtIRmR2aG1vR3NCT1hLRU00UVY5?=
 =?utf-8?B?RnFET0h5SDNtVFZWcmNYZHVZWFNkc2paRFp5d0xNRHN0VzRHMmVHVGFielV6?=
 =?utf-8?B?d25WZUdML2dEbWRNYnFjOTR2VnR2UVdlTlJwR0EySEJOMHpZNTNQOFpsdVUy?=
 =?utf-8?B?OE0razZxWmQyZGx0WlVUWXZST1FtaHN5MVlrZ25XQjRvaW16SXpVa2k1WGZt?=
 =?utf-8?B?M2FCcUhjVzcydWIvRDV0SVJoaTJYODJPN2I0cGM5ZEVIRThhdFI0RzlxeUVr?=
 =?utf-8?B?RDF6UDVTWU9PZUUvMEQxVjFRakdmSDcwaWFkVzdHV1Q4emdWazJ3SnVJa1FS?=
 =?utf-8?B?NVdjUWlCRHBzNTRaclhpdEhaOFQyakoreDNuRDRqUk05NkN5MFpRNFdzQWFw?=
 =?utf-8?B?NnlMMFprblJNSVhXRHZLZUdmeHNId0Izb1NTMnJOV3diZWc5SVJYS2Z1UVFY?=
 =?utf-8?B?WGNOUmdVVEs3b1o2dGkrNmNGdW91dHZON08vNW5ldmJlemtFam9MSE42LzY0?=
 =?utf-8?B?Zmp1Mjk3UmRqWms3QzlTYzRYZ1JZN1FTQWErQ0ZBdVlzZFIwZGI2MzVrd3dD?=
 =?utf-8?B?S0o0cE9URTJ5d0VFUktrazYyZkkxTUM4RWJhaVFyR0dSWjJiUEUxT3BkWFM1?=
 =?utf-8?B?YTBKT2pDNS83dXRZOHFHc3JQRWlPSGQ5clg2MkFUMHNNUmYrcVNVZVJjMW1i?=
 =?utf-8?B?V0hhMFVZY0FhRWVaMmVWQTBpMnJXYWdBeHR3UXNwNm1Lc1M4aW5QMlB4b3Uy?=
 =?utf-8?B?ZmZVM1p2Nm5VMHZNNDdJd1hNVHdWTDVsQldGRHRTcnZ6ODNuY2lGd25EeG9P?=
 =?utf-8?B?TnUrVkZxeUM5QVVwOWZmcnJxK0YwdE9CS1dKdytTOXg3NjhZcWVHY05hOVBC?=
 =?utf-8?B?TEx2NjBpbnE2UG5VR2xJTS9YU3YyNlVRTUtMWXh5TXhKMi9veTRUdkxLcWcz?=
 =?utf-8?B?ZDlFOFRtWTE5UExQUnlmKzlDdE8yS2RUTE9xb0FPcDVtcS9XdEpsVXN3VEN2?=
 =?utf-8?Q?ezpCO473fdufFW1ir/BekAa+NgOM97HH2VmN2Ir?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef98c44e-8581-478e-edfe-08d97ddda90c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 15:28:43.0283 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3iqpzp+PAAu5jR72l6RdynqqfOxZGgwR5DBa9DaNy3Go3ItNswkAcW5OD4KRf7haEjtpK/n9Q4Vrxi6c6ZK+Og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5428
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



On 2021-09-22 04:31, Pekka Paalanen wrote:
> On Tue, 21 Sep 2021 14:05:05 -0400
> Harry Wentland <harry.wentland@amd.com> wrote:
> 
>> On 2021-09-21 09:31, Pekka Paalanen wrote:
>>> On Mon, 20 Sep 2021 20:14:50 -0400
>>> Harry Wentland <harry.wentland@amd.com> wrote:
>>>   

...

> 
>> Did anybody start any CM doc patches in Weston or Wayland yet?
> 
> There is the
> https://gitlab.freedesktop.org/swick/wayland-protocols/-/blob/color/unstable/color-management/color.rst
> we started a long time ago, and have not really touched it for a while.
> Since we last touched it, at least my understanding has developed
> somewhat.
> 
> It is linked from the overview in
> https://gitlab.freedesktop.org/wayland/wayland-protocols/-/merge_requests/14
> and if you want to propose changes, the way to do it is file a MR in
> https://gitlab.freedesktop.org/swick/wayland-protocols/-/merge_requests
> against the 'color' branch. Patches very much welcome, that doc does
> not need to limit itself to Wayland. :-)
> 

Right, I've read all that a while back.

It might be a good place to consolidate most of the Linux CM/HDR discussion,
since gitlab is good with allowing discussions, we can track changes, and
it's more formatting and diagram friendly than text-only email.

> We also have issues tracked at
> https://gitlab.freedesktop.org/swick/wayland-protocols/-/issues?scope=all&utf8=%E2%9C%93&state=opened
> 
>>> Pre-curve for instance could be a combination of decoding to linear
>>> light and a shaper for the 3D LUT coming next. That's why we don't call
>>> them gamma or EOTF, that would be too limiting.
>>>
>>> (Using a shaper may help to keep the 3D LUT size reasonable - I suppose
>>> very much like those multi-segmented LUTs.)
>>>   
>>
>> AFAIU a 3D LUTs will need a shaper as they don't have enough precision.
>> But that's going deeper into color theory than I understand. Vitaly would
>> know better all the details around 3D LUT usage.
> 
> There is a very practical problem: the sheer number of elements in a 3D
> LUT grows to the power of three. So you can't have very many taps per
> channel without storage requirements blowing up. Each element needs to
> be a 3-channel value, too. And then 8 bits is not enough.
> 

And those storage requirements would have a direct impact on silicon real
estate and therefore the price and power usage of the HW.

Harry

> I'm really happy that Vitaly is working with us on Weston and Wayland. :-)
> He's a huge help, and I feel like I'm currently the one slowing things
> down by being backlogged in reviews.
> 
> 
> Thanks,
> pq
> 

