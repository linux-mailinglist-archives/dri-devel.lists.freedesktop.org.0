Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5357E465F
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 17:52:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C2B210E0CF;
	Tue,  7 Nov 2023 16:52:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2080.outbound.protection.outlook.com [40.107.96.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2024610E0CF;
 Tue,  7 Nov 2023 16:52:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lU56r0xxxgXU+fHgDrmDtEjz6LMmeLs0dLqdSYY6/lkjAkhVbxdUh/LIaPseEAUhw7qxZt4QMdROhfyKlH3eIgELJowyFY6gIL50mJ7jiW2WzZBYSpQyKX4ali1N6tK8cIEvoOvkX05W4p1BksaEK7ee2koJBYjqiuUn8eTgV/QgA9XveOvY56WaOG5vYISAi3n+wuTO1attBi5GAqvlNM917TfYdyIGFH2FFWlIu/+JfdsVOqSJmVVpkmDec6cm26k4sVsINwx/BITUzcp1mSs4t6/eJs3SAkIG+7eatBoRL+XrGxpRWWlq1wRzqb4Q6xK3ANjEAXdIW/VtP8uTfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GTlE51p+dLHfE2wO20ew/vLhSa/n35ME3/O+4/uB6qs=;
 b=hh3tNnQbmxmtXDcBIyQrjiscdgeZtGH0e9Eb5iGU+QDXdLnUTlGhsa9z+8muIcapmQAv6vRV4iq5kNEvF8mtjA+Om9DoyrRXdnMZKK/zHzfHOBrNSInPV2E51H1gjzr7AnUY8RyQvgAPndWa/myLbVIc/5cUhrcYCyzEg8JAQSjLfKyfAnU5Et9VZ4tkwz/kWyVI+16bXFOEMkl/VgMUd7TVzFONpQ/6y8OtA5NzEwmO/+cPrP48xqduK+ebInuE+LvBMwYvXDoAAUlolrc96SXjWsxE7sdAKn4JjonoooorU178dRNW7meIzKna7kYvazfhkISuAdPEZn7SeC3oDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GTlE51p+dLHfE2wO20ew/vLhSa/n35ME3/O+4/uB6qs=;
 b=rDccn3eM5mUV0ZUs97uyyl6NQ6AmYvmT5ufwXvf/iQkfB6YGdCYYm8DBim4WAscTqNND42mOHo5o9Lv4IRgGRhXAkBSnrYIWCi9AB5dct+6Wn+JMGllFyVhWPMC5p9PQT6f2/ygF4bT/dTE6ltReXnphBwD4nVAzekZVSZbV6Js=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by PH0PR12MB5418.namprd12.prod.outlook.com (2603:10b6:510:e5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Tue, 7 Nov
 2023 16:52:08 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::5e7e:d568:2bfd:a53a]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::5e7e:d568:2bfd:a53a%4]) with mapi id 15.20.6954.029; Tue, 7 Nov 2023
 16:52:08 +0000
Message-ID: <b6277f5c-9135-4767-b1c5-fb4ab2ceec02@amd.com>
Date: Tue, 7 Nov 2023 11:52:06 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 06/17] drm/doc/rfc: Describe why prescriptive color
 pipeline is needed
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>, Alex Goins <agoins@nvidia.com>
References: <20231019212133.245155-1-harry.wentland@amd.com>
 <20231019212133.245155-7-harry.wentland@amd.com>
 <20231020142256.GA859375@toolbox> <20231020175703.09cd2578@eldfell>
 <20f33898-4c40-4854-a1e8-afaef52f6524@amd.com>
 <20231023111219.6e287958@eldfell>
 <bf69b740-dce7-94f1-293d-a4b274b52f55@nvidia.com>
 <20231026115747.44cbddad@eldfell>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20231026115747.44cbddad@eldfell>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0304.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10e::20) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|PH0PR12MB5418:EE_
X-MS-Office365-Filtering-Correlation-Id: f6ffb018-00e6-44c8-2018-08dbdfb1e130
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qUYaJ3DYHlJqMr/VeMCzuiuRJ0J23fbzlQxVlvhss3wsjgf2d8MtBr2m4lewd98OIEyXd4rXHOQm3TY3dOTHXgHDcqB1603czk2t+RowDIlUJ2HjEQqqL1DCKpU9WxuIY7hvR4AAWBlYF4HbY051o2KpzuV/acWX0mpRNHccBkm/jtMagz7nWbY2NXo1bMKH7ey5vf9qOih3RFvJsCR+/CqoiLZYyfBOqSdBgl3QZhTTJApPfpitOcrl7MwOt/AzJyBKFQio3gHI53RNjV7awKcab4FqxBDSzxdxkQgYsU3Sg316ZcvSHzRNKpWw3coJYY66kIwxHnDrF6QZh1dKbAEBaz8FvTRY4iyn3GsDygTZszUn87cXPixwJEhcbK7lNYUce20O4/NwkcFGELYyyDMW8WWqiplENWMSEuZT8v56/ZFazZx+KQfcZBrx356S/LC74qxF/SDFEwQ98BUTzAs1e5UBLy97gzIMLlyTBU+8mwjJ/oHbCo5Yw4oPnTW3SC2NYafZGChr2R0mQ/numBX/zlKB3Mky9oUELJKn+xd8a0KUBjsus3tJ5B/RjHkQxNd8KlrzJl12WvwdtXLCpcHYaz4rzar6PZxveH+/szaz8EV6fQCu0jZgF8Q/iKJLdX19SrlZNoAZjJrV5Au0bg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(39860400002)(346002)(366004)(396003)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(66899024)(31686004)(478600001)(6506007)(6512007)(2616005)(53546011)(6486002)(36756003)(31696002)(38100700002)(86362001)(5660300002)(110136005)(4001150100001)(44832011)(7416002)(316002)(66556008)(41300700001)(66476007)(83380400001)(54906003)(2906002)(30864003)(26005)(66946007)(4326008)(8936002)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTFBdzF0Ync4YWhNUHgwd3pUcEZzVkJoTzJXTUdrbHBwNzdYMitSc3ZZY2hI?=
 =?utf-8?B?OFJEdnU5aERiQnpNRk5rbEVpMnE4WHptdnBuMUpCaEFEVFE3MzRLM21XeUg3?=
 =?utf-8?B?ZFZIY1R3ck02dUhJZ1VoNzl5MldnK0dSeUpodHkvcDB5eEMvTVdmQmx3aUFi?=
 =?utf-8?B?RmlCMVEveUZqRS8raE1zS3FoQ3BtSUpOTVM2b0pTSUxDZWFVeWVxdWFCNUhk?=
 =?utf-8?B?NGZhdWNVZkZsZ2EydllYcUlvd2xtam5uYnF3dkl3aHRQMitNM3IwMWpPZ0pm?=
 =?utf-8?B?akFOdEk2NldaSkV4dU56aFN6K2VsamJ4SVRVNlB1Snp0NnYySlNqZ3pqWVlp?=
 =?utf-8?B?dWVKZGRpeXBiRE5EaXpSV21HWjgxeGI4b2tPcjJUdU1Sa0hNMmFhbkhvdXFZ?=
 =?utf-8?B?Y2x2R0hiakFBd1ZKK1Jxa01zTGdtaHVqaDNaWXI2cjBMc053cDF0S0pEcW9w?=
 =?utf-8?B?dkNVZ3d6UVBOOTJMUnBlM01UL1BRbXYwOEQrN2k4UXFMd095a3lnTWlreHJO?=
 =?utf-8?B?emF1SmhndUo3RWlZR3ZUNXcwaitHeVBneC9qN3p1LzNFcnlIZ295QlA3TXFO?=
 =?utf-8?B?clo5UGZJK2xQdjYvZTN5T2xQMmVXdmtGblVoSXhkc1A0NURtOW1hVzdvQzhn?=
 =?utf-8?B?SlFQR3VaN3huRzdJbm4yWEdub2VMVHozVUs1YTM1bWJOQUhPMmhFei9DelI3?=
 =?utf-8?B?dTlOVFI0NUV6WS9KUU8rSUREN3lFakJPVklKL0V5MllmbHMzYzFhWWxLTDJ2?=
 =?utf-8?B?c3FJUlIyMmFsRTNkTTFNUUFJdWxEVFFjdEswZ2xYeHN4a3pQem0vbFhpa0h4?=
 =?utf-8?B?SHo5K3dZanVVM2Y5UUkrVWR4R3EyZkptdmttWkZEM3llQlA1SUtaVmZ4d3VK?=
 =?utf-8?B?S2NCRnlWdk5EZm9SWTNrb3dIR1d0RWR6RVQzSDlGWEtwWk1lcGdUSXlXVllL?=
 =?utf-8?B?SHh2TzdqenZrS0RDWHhpUzU2ZCtnVExkaHluTDNOQkpXZmMzbjlwWXlFTDNW?=
 =?utf-8?B?SlRXbzNJRWFkV25ZYXVvaWJIaitLYi8vYWp5VnFZUWJadVhBUFRreEVJUXc3?=
 =?utf-8?B?UzBxVTcxNW5MYjFkSjRrZWZSbjFZL3dpR284dko2VTBGZklWWFEwR2hZcUhw?=
 =?utf-8?B?QWRXY1FwOEtYcUdGR1VtVHdvTDd3dlRGcnJ4NzJMekg4NDRYWGlNK3JsM1Iz?=
 =?utf-8?B?QmpwSDc0QWV3ZUk3N3Z0OHBiZFJGaERxbjhoNFVFUUwyWmFFWm9MWWErdHpx?=
 =?utf-8?B?NVA1T3V6b3FHK2ZmdmRnbEpocWR4eS94SkxMa3QzTWs4YkdHY3dIZGxRbkt6?=
 =?utf-8?B?M2VqbzNKdUVFQ29QSjZZTStqamh1SFJJVkY1ZUR5ZWp4cVFEZmpPNDdoR3Vj?=
 =?utf-8?B?MWluTkdZTkNvOE8vZjBUOEY5eTNXZVpIeXNqU2twbVhwYXlJYnlES3EyVXYw?=
 =?utf-8?B?MFdXR3FvdDNkZC9Lc3dicFloNngvbTBQaEMwUDlURzJ3TG1iT21aVjRNVjZF?=
 =?utf-8?B?SFFyK2k5cXZxRW9yT25wUU5aUElVanAwUGhtMEI1OWF5UGF4dUZ3eTIxM2ZK?=
 =?utf-8?B?MEZQSGtiTWdyYnR0MlBqSzN2U0JaZFdKS2ZPZVp2bzhxUmFvNVN6bmxEN0Zv?=
 =?utf-8?B?UlBFWStJL1FFVFhzK2Zqd3dOY0diY3pKamRvOG9ZQ29uS3RlSDZ0akttRzl3?=
 =?utf-8?B?dHBPd2JhYjhzdHJPd2NTNmtzbXV5QVdXbmFERk9LVnIzcFRYV2drK1BxdjN1?=
 =?utf-8?B?MjY1VEc0RjJlTGZzOEx6RExWT3RNU3o0MHN3OXhCOUR6YXdXRk1KeW1VUnhB?=
 =?utf-8?B?bFZJTXZQYUNIQVRZUnVZNjZBaHo1Y3pFbTZSS3JEUUdGaUlHNzZxaHF2YVh5?=
 =?utf-8?B?TUFTOGZhUHUwVG9FRTdTV2t3bmpBYTUzV2R3WTB6L0d4K2RaSDhCTERvS0Rz?=
 =?utf-8?B?WGxsUWwrNWVqMW82Wno0cXczd253RFVNRmRYWnJoN1hCeS85SXB6YnBldUVn?=
 =?utf-8?B?TnVhelpJNWNyZ2lQWW9OM0lISCt4amJYQUt6cXVFZFBZUjN4eHNNcnhKWUVp?=
 =?utf-8?B?aTdUaUtKOFcrRCtLRWtKcE1DOWhnQ0YvMUdiQ0xndGN2UWRhVEpDa2NJVHAv?=
 =?utf-8?Q?mCcfrhRGJOZIvkuonUsq3rLXj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6ffb018-00e6-44c8-2018-08dbdfb1e130
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 16:52:08.4173 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uh83odD9msCsOS7qg/YB9P58hFLy9Ixjg3IOiPOXXW240qbLiL6edeRrch27rxCBtFA9d0DMsaIvh9yqY0+eSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5418
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Sasha McIntosh <sashamcintosh@google.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Shashank Sharma <shashank.sharma@amd.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 Hector Martin <marcan@marcan.st>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Victoria Brekenfeld <victoria@system76.com>, dri-devel@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 =?UTF-8?Q?Jonas_=C3=85dahl?= <jadahl@redhat.com>,
 Joshua Ashton <joshua@froggi.es>, Aleix Pol <aleixpol@kde.org>,
 Naseer Ahmed <quic_naseer@quicinc.com>, Uma Shankar <uma.shankar@intel.com>,
 Christopher Braga <quic_cbraga@quicinc.com>,
 Arthur Grillo <arthurgrillo@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023-10-26 04:57, Pekka Paalanen wrote:
> On Wed, 25 Oct 2023 15:16:08 -0500 (CDT)
> Alex Goins <agoins@nvidia.com> wrote:
> 
>> Thank you Harry and all other contributors for your work on this. Responses
>> inline -
>>
>> On Mon, 23 Oct 2023, Pekka Paalanen wrote:
>>
>>> On Fri, 20 Oct 2023 11:23:28 -0400
>>> Harry Wentland <harry.wentland@amd.com> wrote:
>>>   
>>>> On 2023-10-20 10:57, Pekka Paalanen wrote:  
>>>>> On Fri, 20 Oct 2023 16:22:56 +0200
>>>>> Sebastian Wick <sebastian.wick@redhat.com> wrote:
>>>>>     
>>>>>> Thanks for continuing to work on this!
>>>>>>
>>>>>> On Thu, Oct 19, 2023 at 05:21:22PM -0400, Harry Wentland wrote:    
>>>>>>> v2:
>>>>>>>  - Update colorop visualizations to match reality (Sebastian, Alex Hung)
>>>>>>>  - Updated wording (Pekka)
>>>>>>>  - Change BYPASS wording to make it non-mandatory (Sebastian)
>>>>>>>  - Drop cover-letter-like paragraph from COLOR_PIPELINE Plane Property
>>>>>>>    section (Pekka)
>>>>>>>  - Use PQ EOTF instead of its inverse in Pipeline Programming example (Melissa)
>>>>>>>  - Add "Driver Implementer's Guide" section (Pekka)
>>>>>>>  - Add "Driver Forward/Backward Compatibility" section (Sebastian, Pekka)  
>>>>>
>>>>> ...
>>>>>  
>>>>>>> +An example of a drm_colorop object might look like one of these::
>>>>>>> +
>>>>>>> +    /* 1D enumerated curve */
>>>>>>> +    Color operation 42
>>>>>>> +    ├─ "TYPE": immutable enum {1D enumerated curve, 1D LUT, 3x3 matrix, 3x4 matrix, 3D LUT, etc.} = 1D enumerated curve
>>>>>>> +    ├─ "BYPASS": bool {true, false}
>>>>>>> +    ├─ "CURVE_1D_TYPE": enum {sRGB EOTF, sRGB inverse EOTF, PQ EOTF, PQ inverse EOTF, …}
>>>>>>> +    └─ "NEXT": immutable color operation ID = 43  
>>
>> I know these are just examples, but I would also like to suggest the possibility
>> of an "identity" CURVE_1D_TYPE. BYPASS = true might get different results
>> compared to setting an identity in some cases depending on the hardware. See
>> below for more on this, RE: implicit format conversions.
>>
>> Although NVIDIA hardware doesn't use a ROM for enumerated curves, it came up in
>> offline discussions that it would nonetheless be helpful to expose enumerated
>> curves in order to hide the vendor-specific complexities of programming
>> segmented LUTs from clients. In that case, we would simply refer to the
>> enumerated curve when calculating/choosing segmented LUT entries.
> 
> That's a good idea.
> 
>> Another thing that came up in offline discussions is that we could use multiple
>> color operations to program a single operation in hardware. As I understand it,
>> AMD has a ROM-defined LUT, followed by a custom 4K entry LUT, followed by an
>> "HDR Multiplier". On NVIDIA we don't have these as separate hardware stages, but
>> we could combine them into a singular LUT in software, such that you can combine
>> e.g. segmented PQ EOTF with night light. One caveat is that you will lose
>> precision from the custom LUT where it overlaps with the linear section of the
>> enumerated curve, but that is unavoidable and shouldn't be an issue in most
>> use-cases.
> 
> Indeed.
> 
>> Actually, the current examples in the proposal don't include a multiplier color
>> op, which might be useful. For AMD as above, but also for NVIDIA as the
>> following issue arises:
>>
>> As discussed further below, the NVIDIA "degamma" LUT performs an implicit fixed
>> point to FP16 conversion. In that conversion, what fixed point 0xFFFFFFFF maps
>> to in floating point varies depending on the source content. If it's SDR
>> content, we want the max value in FP16 to be 1.0 (80 nits), subject to a
>> potential boost multiplier if we want SDR content to be brighter. If it's HDR PQ
>> content, we want the max value in FP16 to be 125.0 (10,000 nits). My assumption
>> is that this is also what AMD's "HDR Multiplier" stage is used for, is that
>> correct?
> 
> It would be against the UAPI design principles to tag content as HDR or
> SDR. What you can do instead is to expose a colorop with a multiplier of
> 1.0 or 125.0 to match your hardware behaviour, then tell your hardware
> that the input is SDR or HDR to get the expected multiplier. You will
> never know what the content actually is, anyway.
> 
> Of course, if we want to have a arbitrary multiplier colorop that is
> somewhat standard, as in, exposed by many drivers to ease userspace
> development, you can certainly use any combination of your hardware
> features you need to realize the UAPI prescribed mathematical operation.
> 
> Since we are talking about floating-point in hardware, a multiplier
> does not significantly affect precision.
> 
> In order to mathematically define all colorops, I believe it is
> necessary to define all colorops in terms of floating-point values (as
> in math), even if they operate on fixed-point or integer. By this I
> mean that if the input is 8 bpc unsigned integer pixel format for
> instance, 0 raw pixel channel value is mapped to 0.0 and 255 is mapped
> to 1.0, and the color pipeline starts with [0.0, 1.0], not [0, 255]
> domain. We have to agree on this mapping for all channels on all pixel
> formats. However, there is a "but" further below.
> 
> I also propose that quantization range is NOT considered in the raw
> value mapping, so that we can handle quantization range in colorops
> explicitly, allowing us to e.g. handle sub-blacks and super-whites when
> necessary. (These are currently impossible to represent in the legacy
> color properties, because everything is converted to full range and
> clipped before any color operations.)
> 

I pretty much agree with anything you say up to here. :)

>> From the given enumerated curves, it's not clear how they would map to the
>> above. Should sRGB EOTF have a max FP16 value of 1.0, and the PQ EOTF a max FP16
>> value of 125.0? That may work, but it tends towards the "descriptive" notion of
>> assuming the source content, which may not be accurate in all cases. This is
>> also an issue for the custom 1D LUT, as the blob will need to be converted to
>> FP16 in order to populate our "degamma" LUT. What should the resulting max FP16
>> value be, given that we no longer have any hint as to the source content?
> 
> In my opinion, all finite non-negative transfer functions should
> operate with [0.0, 1.0] domain and [0.0, 1.0] range, and that includes
> all sRGB, power 2.2, and PQ curves.
> 

That wouldn't work with AMD HW that encodes a PQ transfer function that
has an output range of [0.0, 125.0]. I suggest making the range a part
of the named TF definition.

> If we look at BT.2100, there is no such encoding even mentioned where
> 125.0 would correspond to 10k cd/m². That 125.0 convention already has
> a built-in assumption what the color spaces are and what the conversion
> is aiming to do. IOW, I would say that choice is opinionated from the
> start. The multiplier in BT.2100 is always 10000.
> 

Sure, the choice is opinionated but a certain large OS vendor has had
a large influence in how HW vendors designed their color pipelines.

snip

>> On recent hardware, the NVIDIA pre-blending pipeline includes LUTs that do
>> implicit fixed-point to FP16 conversions, and vice versa.
> 
> Above, I claimed that the UAPI should be defined in nominal
> floating-point values, but I wonder, would that work? Would we need to
> have explicit colorops for converting from raw pixel data values into
> nominal floating-point in the UAPI?
> 

I think it's important that we keep a level of abstraction a the driver level.
I'm not sure it would serve anyone if we defined this.

snip

>>>>> I think we also need a definition of "informational".
>>>>>
>>>>> Counter-example 1: a colorop that represents a non-configurable    
>>>>
>>>> Not sure what's "counter" for these examples?
>>>>   
>>>>> YUV<->RGB conversion. Maybe it determines its operation from FB pixel
>>>>> format. It cannot be set to bypass, it cannot be configured, and it
>>>>> will alter color values.  
>>
>> Would it be reasonable to expose this is a 3x4 matrix with a read-only blob and
>> no BYPASS property? I already brought up a similar idea at the XDC HDR Workshop
>> based on the principle that read-only blobs could be used to express some static
>> pipeline elements without the need to define a new type, but got mixed opinions.
>> I think this demonstrates the principle further, as clients could detect this
>> programmatically instead of having to special-case the informational element.
> 
> If the blob depends on the pixel format (i.e. the driver automatically
> chooses a different blob per pixel format), then I think we would need
> to expose all the blobs and how they correspond to pixel formats.
> Otherwise ok, I guess.
> 
> However, do we want or need to make a color pipeline or colorop
> conditional on pixel formats? For example, if you use a YUV 4:2:0 type
> of pixel format, then you must use this pipeline and not any other. Or
> floating-point type of pixel format. I did not anticipate this before,
> I assumed that all color pipelines and colorops are independent of the
> framebuffer pixel format. A specific colorop might have a property that
> needs to agree with the framebuffer pixel format, but I didn't expect
> further limitations.
> 

Yes, I think we'll want that.

> "Without the need to define a new type" is something I think we need to
> consider case by case. I have a hard time giving a general opinion.
> 
>>>>>
>>>>> Counter-example 2: image size scaling colorop. It might not be
>>>>> configurable, it is controlled by the plane CRTC_* and SRC_*
>>>>> properties. You still need to understand what it does, so you can
>>>>> arrange the scaling to work correctly. (Do not want to scale an image
>>>>> with PQ-encoded values as Josh demonstrated in XDC.)
>>>>>     
>>>>
>>>> IMO the position of the scaling operation is the thing that's important
>>>> here as the color pipeline won't define scaling properties.  
>>
>> I agree that blending should ideally be done in linear space, and I remember
>> that from Josh's presentation at XDC, but I don't recall the same being said for
>> scaling. In fact, the NVIDIA pre-blending scaler exists in a stage of the
>> pipeline that is meant to be in PQ space (more on this below), and that was
>> found to achieve better results at HDR/SDR boundaries. Of course, this only
>> bolsters the argument that it would be helpful to have an informational "scaler"
>> element to understand at which stage scaling takes place.
> 
> Both blending and scaling are fundamentally the same operation: you
> have two or more source colors (pixels), and you want to compute a
> weighted average of them following what happens in nature, that is,
> physics, as that is what humans are used to.
> 
> Both blending and scaling will suffer from the same problems if the
> operation is performed on not light-linear values. The result of the
> weighted average does not correspond to physics.
> 
> The problem may be hard to observe with natural imagery, but Josh's
> example shows it very clearly. Maybe that effect is sometimes useful
> for some imagery in some use cases, but it is still an accidental
> side-effect. You might get even better results if you don't rely on
> accidental side-effects but design a separate operation for the exact
> goal you have.
> 

Many people looked at this problem inside AMD and probably at other
companies. Not all of them arrive at the same conclusion. The type of
image will also greatly affect what one considers better.

But it sounds like we'll need an informational scaling element at least
for compositors that care. Do we need that as a first iteration of a
working DRM/KMS solution, though? So far other OSes have not cared and
people have (probably) not complained about it.

snip

>> Despite being programmable, the LUTs are updated in a manner that is less
>> efficient as compared to e.g. the non-static "degamma" LUT. Would it be helpful
>> if there was some way to tag operations according to their performance,
>> for example so that clients can prefer a high performance one when they
>> intend to do an animated transition? I recall from the XDC HDR workshop
>> that this is also an issue with AMD's 3DLUT, where updates can be too
>> slow to animate.
> 
> I can certainly see such information being useful, but then we need to
> somehow quantize the performance.
> 
> What I was left puzzled about after the XDC workshop is that is it
> possible to pre-load configurations in the background (slow), and then
> quickly switch between them? Hardware-wise I mean.
> 

On AMD HW, yes. How to fit that into the atomic API is a separate
question. :D

Harry

> 
> Thanks,
> pq

