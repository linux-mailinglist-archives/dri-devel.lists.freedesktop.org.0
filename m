Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7A443B505
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 17:02:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC70D8991C;
	Tue, 26 Oct 2021 15:02:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2066.outbound.protection.outlook.com [40.107.94.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0A2889911;
 Tue, 26 Oct 2021 15:02:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dbs5uIXr3GvvNfNeUM9KCgK2sX6mPam+287pQ/Q6R+JiWqzZg3LfuV3hZ2KQ8Fx4aBX0hodYrnk5T8D5q6PwG6TUP7rNK9D3FQvkQpbCVFfKGrqGDmHpVRs03pdpvwrYyknpDQctrKglYYwZuvHxvUyKczcklZ6o+pmoUPG5+fZW39zkFTAsa5mO2cD4p9U+qLe9WmoUqcW8pL0Ea/hIYqBO3/UKIKbCZ4EGgIKwk+5tiCHrx/hecqgB52Ou7jRw7j8pIwovayUQzldmkS4HxM1BGT2ZiBmsm1E7Ip5Qj4gD9f5c2D5H10NXc6w05gQxZ1e8wJ0ANLJOb3PfJnmUnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E7GUNXkvOWCP3eBLpyzZUVL99jn1n9xZehWHibFjmNM=;
 b=bG6v+ekL0tLIkxekXz2HL7/wBAfMeo/3NeHQjyG4KxUIfLx7d+ll86Vh6Sw2qNsfoR7D92+BElHe+QA2CuDGG3gIX8j2tdWKD2qiMZYsfHVJF1qXfLPuVkrO53aUeNakwpirywcXy0L+r9QqQz/dotRWnqUjgMoCuQjH/h8o9MYv8Tzu3wvy+Tx4urqsMRCTw+ss4FSBMhTeTDkYdef0F1jocWPWevenM0BYPWgsieW7fx9XvP89d3cKrTLeUFggGcUh+nzgAysyr+Otq4f9gQ10CNoP6Ntf6hMJbb9MW7K17VDdM/KHvCHkkLrsHLlZKLhqfoqKVH5iFieRL07PKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E7GUNXkvOWCP3eBLpyzZUVL99jn1n9xZehWHibFjmNM=;
 b=l2PGth37plyCAqtuOrp7EHjRHFKfZVf8RAAVDyk2cyDkIqLLJmQN02QkcMUWUqVu7zJ6PA3CuvlpfCC5k7gQBXH7eZKTJof2T843naq+kLo39hgqkBN3caNJQWPsTB1ebcUdBBC7XmDGMUTw3dcIRgooXWflFjEGMCAqdPb36cc=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Tue, 26 Oct
 2021 15:02:36 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::d095:131a:b99a:9975]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::d095:131a:b99a:9975%3]) with mapi id 15.20.4649.014; Tue, 26 Oct 2021
 15:02:36 +0000
Message-ID: <24c8bf32-2eea-8f32-33b1-0628701c22bd@amd.com>
Date: Tue, 26 Oct 2021 11:02:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC v2 00/22] Add Support for Plane Color Lut and CSC features
Content-Language: en-US
To: "Shankar, Uma" <uma.shankar@intel.com>,
 Pekka Paalanen <ppaalanen@gmail.com>
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "brian.starkey@arm.com" <brian.starkey@arm.com>,
 "sebastian@sebastianwick.net" <sebastian@sebastianwick.net>,
 "Shashank.Sharma@amd.com" <Shashank.Sharma@amd.com>,
 "Cyr, Aric" <Aric.Cyr@amd.com>, Vitaly Prosyak <Vitaly.Prosyak@amd.com>
References: <20210906213904.27918-1-uma.shankar@intel.com>
 <20211012145529.687dfdee@eldfell>
 <1260585655bd41ebb734056dd1f42740@intel.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <1260585655bd41ebb734056dd1f42740@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0020.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01::28)
 To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
Received: from [192.168.50.4] (198.200.67.104) by
 YQBPR01CA0020.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14 via Frontend Transport; Tue, 26 Oct 2021 15:02:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 139b6c37-f392-4ef8-3ce3-08d99891a56f
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:
X-Microsoft-Antispam-PRVS: <CO6PR12MB5427C606E9836C18CE076A748C849@CO6PR12MB5427.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +HaMuO09xm1RalYhA4DV2r1Eumnci9ncOvtsd/lxC2QssgVUMcM12kTE4vFwYw1jeuwQ1GpZgvsFquMTVpQ5VTYoMdP4KS8v6Z7USTH7sA+q+6gRMVwZwm60YfL6/39v+YAVNBiyI2nOmpVxl6J+/LdMnhZzg6UUm4Z7zMIf3aeTfbZE8PwWk1i6Kn5umgaf009ml3ouvjimtiV7TfzGkbClPthV3FBm4TNjZpVKywMY/CZjRPD/zPQM6uAB1Rl4u/vYTpRPkd6iK/Z8g1Qhgi0njRAWXjHqWap3xPdybdyWasQGC7SWuh5C3xocplkAfFuleHWnXbEohD9WGwAOxB7XtDIH3wBJzDiiwqKOcwi6hAJHQhUKoyeRv1w+vHZB3EectoQ0ConYRAF0foNuh+grXVG3GVZelkUYaOTvsJzQ1AlHdhk5nIr3As7bNWYPO0OohpO0fn17vRsYu8YWipmGANjz6OFw5mFzgpqwdgrC+jtemz8nTMrei6doAbd/kBL/WHTfFHM+VKacq6fHJv0j76N5Nf95pg/IzJ7yrWToVrEbjAtIQk0zvYuUKwg9sWcmodG8Jwe45NJW67yBE3q99cNxGKwqG9KzQfsGOLc3rxRYKw4589EhWFSRZX0QXR8Vojt1uG+uy4UjzqYKOYHnZ218GE+EMVEWbmWgUNoREhtNpLy82SmD5VMnpeci9vNHqIhmQYdOhuhJV8RNhgNTVgRyRu8/4PwqUCD8EKgoAgI20EIrmZgzwl6BhIeo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(16576012)(66946007)(66476007)(66556008)(316002)(31686004)(186003)(966005)(5660300002)(6486002)(8676002)(110136005)(54906003)(508600001)(38100700002)(4326008)(8936002)(956004)(26005)(53546011)(2906002)(6666004)(36756003)(83380400001)(86362001)(31696002)(44832011)(2616005)(4001150100001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3RvdGVpWUhVRVZKeStTRDRhaUhlQnprSEMySGJrTkR1NWU2K3B6cXFRZlFO?=
 =?utf-8?B?MzJyTHlQK3VSMGdLeDF2dUxTSDljQXNjaElIZzVxVE5ya2NHdzFDMXBtRVpy?=
 =?utf-8?B?dVVESGxmQmcyQ2diV3dobGpERTF6d004T3Rsa3ZmMWRjaEQ1NXJHU0Z0UWlu?=
 =?utf-8?B?VU12YlBZN3FqWEd1ZU5Yd1orUzFFN1VDeU1VcnhpZEdpa2pVTHo2dTdaaDNx?=
 =?utf-8?B?QlMyZDBiYWlzV0IrTm5HQ0lyVStXVUVNYmdsa1NKYkFubUNKcVJyZjVMY2gx?=
 =?utf-8?B?aVN4UzFRZGNjNmNPYUxoeklZM0x4MEhFMEFIdGpFRFF5b1NEdlBUejB2ampH?=
 =?utf-8?B?RFdUY0xwTkVzSk9rWklYWW4xblp0RVlwS2d0TWN6TWJsYVpqQlhNSSs0TXVO?=
 =?utf-8?B?WGpLS1Z3MlZ3MUZwc1NGS1NzdkFEbmVSbDFMRDFLTG9iWG9rcFZiNFVsS3J3?=
 =?utf-8?B?M2pQeCtJRzJLdUlBTGRUNkFkZWEyVFdFemRtRmdlODZzNG1VcUFiUnduTVpj?=
 =?utf-8?B?alFmRm82My9LTkI0UjhkaWdqTHA5eDJiVEJsdWJ3YVh2WFp1TU9ONDJlaVVT?=
 =?utf-8?B?RHZ1OVR1YUhiMU0rM29HUkhnVGE0TW1RMDVja1RmOEtvLzkzZnpBaXZaYXJJ?=
 =?utf-8?B?dU4rSTZPUFN1RkxGZEM0dHRmVHlOMmJuVkl6N1JPVXNwY2RDelB5bm5wUThN?=
 =?utf-8?B?TFF4WTVTc0x3R1EzSzd0eFJkMGlsWExWcjZmendvc1dkRFY0UUltNDAzTTR3?=
 =?utf-8?B?ZVBQdkhFelpBWFdQQTVYenFHQ3M5V1VzWE5MdjgzWFgvU2xnQzN4b0JNd2F2?=
 =?utf-8?B?bTBsUjNadmRZcDEyME1WblNLMXRkanVCN1hpNExrWlRDSEJJY0Z6Wmx1QVIv?=
 =?utf-8?B?b2R1dWRwQ1JxODI2UkxxdDBUdFh0bGMwV2F4Lys5KzRSeWJaVXZ5R2ptZVZu?=
 =?utf-8?B?N2ZSYUcvVUw0d3RkS0xqK0YwV1ZXRjFYTHlGT1hEQjJuSXVrdUp2NVMvZ2Ur?=
 =?utf-8?B?dWFDWEthaTJuWEdGOXV4RlVXVy9FV3dpaTdaRW5GTktZUUFuc0NidEpjNFl1?=
 =?utf-8?B?SU9UZnRpNTFqWmJGZWtBTlg1RXdVN1luYmo3cytEM0lFQVZXbHFpVS9qalQw?=
 =?utf-8?B?RHZpZUU1L0ZFZWFyRGFOeXdmS0V5MnZ1UjBSSFozNlcwQWZud0NxTTBSVy9l?=
 =?utf-8?B?VmNDQnRoM01OVk5HUTdGWjA2dWE1Y2lsUVREZjU1SGx0U1lDNTZUbFowbDlK?=
 =?utf-8?B?TDh0VVBtcGF3dlRHdDZKU1ZSZzFKVkx4ZmN5bjJiWmhpdHRNd1BldUJHTmJZ?=
 =?utf-8?B?aDVXTktMbDgxVStqaUk5Q0wvWmxVZEw3bFI4cHhqWVVzTWlLVDljYUpiclcw?=
 =?utf-8?B?S1NBai84dzBVYm54YTBpejltNHZvWWg0RTFNTCt6WGVJcHh2RUpObldGdFAv?=
 =?utf-8?B?MHg4WjY1bE5CVjUwWFFPTUY4YldMa2lYZnFxOVE4UWJ0TEl6d1VONlNuWHQx?=
 =?utf-8?B?TDh4NTV6Y2JqWGQ3N2hqT2c1RG9Yc3FEMDdpU2Nkc29VUVQwNC9neU1kUmJl?=
 =?utf-8?B?S0RMMzY3TTRIdW81MVpPVHlnSjAxdWVYNGFzYkJBaEQ1L2h5N3dRNnE3aHlr?=
 =?utf-8?B?eUNuT21DazJ0WFNsNWhmZ1ZLcmVWVVh6by9UZXphTXdKazdOYkRHVzRFL0VJ?=
 =?utf-8?B?THNsWHB3SFZkVU5MRkFCQ01wUnNxYlBCZy92dkZIeUZPak5SOFdHeFJVYVlZ?=
 =?utf-8?B?TEVJK3hhSG5YR3FqU1hXQUZVRm9YR0dmZXF2ZkczMmUvNW9TVXNpSGxLSjlH?=
 =?utf-8?B?SUtCOFJmaE9FOW0xczM0djhNTnhrNHBobFJ5RUVSemFwWjUyM0d6V1ZGNS9j?=
 =?utf-8?B?SVE5UnlNRWJMZHIwdWZrZ3B1YzMxbXl6WEE5Zy94ckc1NlN3Rk8yLzNzajdj?=
 =?utf-8?B?RkRCaG5UZjJRUWhaV3dsN0ozQkc0Mzc4dHVxUmJkR2ZrU2J3d3h6dWc5SmVi?=
 =?utf-8?B?RVlHT05vbVB1SnVuak4xU3RVK2NLYnMrYnRRRDZ3cGY0Z2tWc0xLL2ZValho?=
 =?utf-8?B?ZG12eVA3SFlneVRrOERIMjFWM0gxTE5qY3JaWTFPM0NjYXZNaVNNdlBSbWJE?=
 =?utf-8?B?dktwM2NHOEFOc2Z5NXVJOXlyWk5zUXNieUNpcFlzZCtzQVhoNzVybENEaUh1?=
 =?utf-8?Q?6Od1Cx+iuI82Fi0nouhABrk=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 139b6c37-f392-4ef8-3ce3-08d99891a56f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 15:02:36.5146 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FeLY9eC/GL+S60taHlWwTRkPcThc0k6WaK7UDtUe8HL/YodNPGjjCvZEemCnVTtZGdOJv+pU8U7IAcr/9gjN0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5427
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



On 2021-10-12 17:01, Shankar, Uma wrote:
> 
> 
>> -----Original Message-----
>> From: Pekka Paalanen <ppaalanen@gmail.com>
>> Sent: Tuesday, October 12, 2021 5:25 PM
>> To: Shankar, Uma <uma.shankar@intel.com>
>> Cc: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org;
>> harry.wentland@amd.com; ville.syrjala@linux.intel.com; brian.starkey@arm.com;
>> sebastian@sebastianwick.net; Shashank.Sharma@amd.com
>> Subject: Re: [RFC v2 00/22] Add Support for Plane Color Lut and CSC features
>>
>> On Tue,  7 Sep 2021 03:08:42 +0530
>> Uma Shankar <uma.shankar@intel.com> wrote:
>>
>>> This is how a typical display color hardware pipeline looks like:
>>>  +-------------------------------------------+
>>>  |                RAM                        |
>>>  |  +------+    +---------+    +---------+   |
>>>  |  | FB 1 |    |  FB 2   |    | FB N    |   |
>>>  |  +------+    +---------+    +---------+   |
>>>  +-------------------------------------------+
>>>        |  Plane Color Hardware Block |
>>> +--------------------------------------------+
>>>  | +---v-----+   +---v-------+   +---v------+ |
>>>  | | Plane A |   | Plane B   |   | Plane N  | |
>>>  | | DeGamma |   | Degamma   |   | Degamma  | |
>>>  | +---+-----+   +---+-------+   +---+------+ |
>>>  |     |             |               |        |
>>>  | +---v-----+   +---v-------+   +---v------+ |
>>>  | |Plane A  |   | Plane B   |   | Plane N  | |
>>>  | |CSC/CTM  |   | CSC/CTM   |   | CSC/CTM  | |
>>>  | +---+-----+   +----+------+   +----+-----+ |
>>>  |     |              |               |       |
>>>  | +---v-----+   +----v------+   +----v-----+ |
>>>  | | Plane A |   | Plane B   |   | Plane N  | |
>>>  | | Gamma   |   | Gamma     |   | Gamma    | |
>>>  | +---+-----+   +----+------+   +----+-----+ |
>>>  |     |              |               |       |
>>>  +--------------------------------------------+
>>> +------v--------------v---------------v-------|
>>> ||                                           ||
>>> ||           Pipe Blender                    ||
>>> +--------------------+------------------------+
>>> |                    |                        |
>>> |        +-----------v----------+             |
>>> |        |  Pipe DeGamma        |             |
>>> |        |                      |             |
>>> |        +-----------+----------+             |
>>> |                    |            Pipe Color  |
>>> |        +-----------v----------+ Hardware    |
>>> |        |  Pipe CSC/CTM        |             |
>>> |        |                      |             |
>>> |        +-----------+----------+             |
>>> |                    |                        |
>>> |        +-----------v----------+             |
>>> |        |  Pipe Gamma          |             |
>>> |        |                      |             |
>>> |        +-----------+----------+             |
>>> |                    |                        |
>>> +---------------------------------------------+
>>>                      |
>>>                      v
>>>                Pipe Output
>>>
>>> This patch series adds properties for plane color features. It adds
>>> properties for degamma used to linearize data and CSC used for gamut
>>> conversion. It also includes Gamma support used to again non-linearize
>>> data as per panel supported color space. These can be utilize by user
>>> space to convert planes from one format to another, one color space to
>>> another etc.
>>>
>>> Userspace can take smart blending decisions and utilize these hardware
>>> supported plane color features to get accurate color profile. The same
>>> can help in consistent color quality from source to panel taking
>>> advantage of advanced color features in hardware.
>>>
>>> These patches add the property interfaces and enable helper functions.
>>> This series adds Intel's XE_LPD hw specific plane gamma feature. We
>>> can build up and add other platform/hardware specific implementation
>>> on top of this series.
>>>
>>> Credits: Special mention and credits to Ville Syrjala for coming up
>>> with a design for this feature and inputs. This series is based on his
>>> original design and idea.
>>>
>>> Note: Userspace support for this new UAPI will be done on Chrome in
>>> alignment with weston and general opensource community.
>>> Discussion ongoing with Harry Wentland, Pekka and community on color
>>> pipeline and UAPI design. Harry's RFC below:
>>> https://patchwork.freedesktop.org/series/89506/>>>> We need to converge on a common UAPI interface which caters to all the
>>> modern color hardware pipelines.
>>>
>>> ToDo: State readout for this feature will be added next.
>>>
>>> v2: Added UAPI description and added change in the rfc section of
>>> kernel Documentation folder
>>
>> Hi,
>>
>> thank you for this. I do believe the KMS UAPI should expose what hardware can do
>> (prescribed operations) rather than how they would be often used (to realize a
>> conversion from one space description to another). This proposal fits quite nicely
>> with what I have envisioned for Weston.
> 

It's taken me a while but I am starting to agree with the prescriptive approach to
expose HW functionality. One thing we'll want to be careful of is to make sure
this isn't tied to specific HW more than it needs to be. I'll comment in other
places of this patchset to elaborate.

What's making me come around, i.e. change from a prescriptive (these are the
input/output/blending spaces/formats) to a descriptive (these are the LUTs and
CTMs) approach?

1) The prescriptive way has no good way of dealing with gamut and tone mapping.
   To do so we would need explicit OOTFs and CTMs or 3D LUTs anyways.

2) The prescriptive way provides no semblance of guarantee that transforms
   are equivalent when the compositor uses shaders transforms and composition
   vs when the compositor uses KMS transforms and composition.

3) Policy about treatment of surfaces/planes and blending is best left with
   the compositor (for the above reasons).

>> I mainly went over the big picture by commenting in detail on the proposal
>> document, and not looking too carefully at the other documentation or UAPI details
>> at this time.
> 
> Thanks Pekka for the feedback.
> 
>> Unfortunately I was unable to decipher how userspace is supposed to use the
>> XE_LPD special gamma features.
> 
> I will include the details on how userspace should actually get this through a sample
> IGT reference, that should help make this clear.
> 

It looks like with your current definitions each userspace compositor (Weston, kwin,
mutter, wlroots, Chrome's compositor, Android's compositor, etc.) would need to learn
how to program the XE_LPD LUTs as well as AMD LUTs. Would these definitions change
in future Intel HW generations? Would this mean all compositors would need to learn
again how to program the future LUT format?

Other options would be to give userspace a generic LUT with 4k FP16 entries and then
re-map that to the HW LUT in the kernel driver.

I might be missing some of the nuances of the XE_LPD LUT but it seems to me that the
main difference between different PWL implementations is the distribution of the
points used to define the LUT. Maybe a more generic PWL implementation could have
a kernel driver report one (or more) PWL point distributions. We could encode these
as enums and pre-defined arrays in a UAPI header. That way the compositor could have
a single, generic implementation of programming PWL in FP16 and the kernel driver
would only need to remap the FP16 to the HW-internal format, which is a trivial
conversion. Using this approach compositors would implement PWL support once and won't
have to touch it again in the future. Is there anything that would make this approach
a bad idea for Intel HW (or other HW)? (Credit for this idea goes to Vitaly)

Harry

> Regards,
> Uma Shankar
> 
>>
>> Thanks,
>> pq
>>
>>>
>>> Uma Shankar (22):
>>>   drm: RFC for Plane Color Hardware Pipeline
>>>   drm: Add Enhanced Gamma and color lut range attributes
>>>   drm: Add Plane Degamma Mode property
>>>   drm: Add Plane Degamma Lut property
>>>   drm/i915/xelpd: Define Degamma Lut range struct for HDR planes
>>>   drm/i915/xelpd: Add register definitions for Plane Degamma
>>>   drm/i915/xelpd: Enable plane color features
>>>   drm/i915/xelpd: Add color capabilities of SDR planes
>>>   drm/i915/xelpd: Program Plane Degamma Registers
>>>   drm/i915/xelpd: Add plane color check to glk_plane_color_ctl
>>>   drm/i915/xelpd: Initialize plane color features
>>>   drm/i915/xelpd: Load plane color luts from atomic flip
>>>   drm: Add Plane CTM property
>>>   drm: Add helper to attach Plane ctm property
>>>   drm/i915/xelpd: Define Plane CSC Registers
>>>   drm/i915/xelpd: Enable Plane CSC
>>>   drm: Add Plane Gamma Mode property
>>>   drm: Add Plane Gamma Lut property
>>>   drm/i915/xelpd: Define and Initialize Plane Gamma Lut range
>>>   drm/i915/xelpd: Add register definitions for Plane Gamma
>>>   drm/i915/xelpd: Program Plane Gamma Registers
>>>   drm/i915/xelpd: Enable plane gamma
>>>
>>>  Documentation/gpu/drm-kms.rst                 |  90 +++
>>>  Documentation/gpu/rfc/drm_color_pipeline.rst  | 167 ++++++
>>>  drivers/gpu/drm/drm_atomic.c                  |   1 +
>>>  drivers/gpu/drm/drm_atomic_state_helper.c     |  12 +
>>>  drivers/gpu/drm/drm_atomic_uapi.c             |  38 ++
>>>  drivers/gpu/drm/drm_color_mgmt.c              | 177 +++++-
>>>  .../gpu/drm/i915/display/intel_atomic_plane.c |   6 +
>>>  .../gpu/drm/i915/display/intel_atomic_plane.h |   2 +
>>>  drivers/gpu/drm/i915/display/intel_color.c    | 513 ++++++++++++++++++
>>>  drivers/gpu/drm/i915/display/intel_color.h    |   2 +
>>>  .../drm/i915/display/skl_universal_plane.c    |  15 +-
>>>  drivers/gpu/drm/i915/i915_drv.h               |   3 +
>>>  drivers/gpu/drm/i915/i915_reg.h               | 176 +++++-
>>>  include/drm/drm_mode_object.h                 |   2 +-
>>>  include/drm/drm_plane.h                       |  81 +++
>>>  include/uapi/drm/drm_mode.h                   |  58 ++
>>>  16 files changed, 1337 insertions(+), 6 deletions(-)  create mode
>>> 100644 Documentation/gpu/rfc/drm_color_pipeline.rst
>>>
> 

