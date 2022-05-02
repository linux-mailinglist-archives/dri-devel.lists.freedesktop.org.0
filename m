Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0055176F9
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 20:54:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9291110E434;
	Mon,  2 May 2022 18:54:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2082.outbound.protection.outlook.com [40.107.92.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9202C10E229;
 Mon,  2 May 2022 18:54:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SkZ8BVx75dVOYx7s3UdW5LZoPxDr2Sr7vURldrGnbyPwMhskHNu3Q1cP+UC86Fwx4c8oEmQUSYOy9dVrNAgT3aVUO/Gm0Oi6gho0oeKljMKLWAbuiqxm18kVPSqjsvcDeXzLc9aHa6z4M/nyWT1MWorhm2uuIBaOwpOWnalvzs+7kKbnM5LSh1g9GnWM4YJjJb2n073ddabfhfaYTI6B40/B5UD1B9WJdQqrIkQekAeVwQsPsRvCHEyd8ZTpsYdXT4KtFjGRd15pvxXgfprZbljFXDg740jx2S30ie+S2qssx0b5DGBJEWLjiuaztjU89+Wk6HJgtG8vJ2G7EgE3yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YaMCqRZh/ZrGxf3ijdLLITQFTzPtj9HKFXhH6UXSvT0=;
 b=aw9aAlAKaimw9O4HJsjTw6BIQ1lz3no54uJx2mgYdDw6+UY26zTpp99kGFRG6Nexn0QbeYwY1AhtOC2KDO1K+Y4//kHQza4rsN1hEanl2VI//uMtrpW2yiFaHbDrb/rAOQeYpvNsF7MnWVO4s6hsN/bkN+3S0BGlrZfFyXiL4z+RdKT3xjP9gorBySPfwl13krTDU5AMHkHBCWwmlQnsCdds8meqBHjV3XuhE7SsMxJKS5OoFZrD/XAY/926yibplTPPuMqMui51w8ZpjIKPws5sjyROI0WznP85UPuY+Xok3DcGfMLdw217J7siAo/j0TG9CRFOo2DIAqz+josEFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YaMCqRZh/ZrGxf3ijdLLITQFTzPtj9HKFXhH6UXSvT0=;
 b=0AdGINl6TXdMTDpk9pcm4fnbyXrBvJ3rQsEeBC872i+krt+DqqPMTHZhDNvvy9dgM9YVk01gYSk8YNzW9XkM8/MtBTQfnFj0qNUGoGYFbB63WVPca+XBYPaN6oU8fqp56Ih4pJT64Pli4nF4JIY1c0q1Xnd2jP2X5MelHB+18tk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by PH7PR12MB5758.namprd12.prod.outlook.com (2603:10b6:510:1d1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Mon, 2 May
 2022 18:54:37 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::540e:d76a:bdf0:ed0d]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::540e:d76a:bdf0:ed0d%6]) with mapi id 15.20.5206.013; Mon, 2 May 2022
 18:54:37 +0000
Message-ID: <642bd366-7918-0f0f-a6fb-e6422eb7501d@amd.com>
Date: Mon, 2 May 2022 14:54:24 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [Intel-gfx] [V2 3/3] drm/amd/display: Move connector debugfs to
 drm
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "Sharma, Swati2" <swati2.sharma@intel.com>
References: <20220411095129.1652096-1-bhanuprakash.modem@intel.com>
 <20220411095129.1652096-4-bhanuprakash.modem@intel.com>
 <DM6PR11MB31778321FCA58010AE44D867BAFC9@DM6PR11MB3177.namprd11.prod.outlook.com>
 <29f40e83-a9a8-c0ac-1702-f9d0bf0f8861@intel.com>
 <8a9ba046-5e2c-442f-aec2-f1683097d100@amd.com>
 <576d5993-8108-218e-45a0-bab1ae4ca84b@intel.com>
 <b87db6af-a2a0-8fba-b204-140db03ab79b@amd.com>
In-Reply-To: <b87db6af-a2a0-8fba-b204-140db03ab79b@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0048.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:82::32) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37c421ce-1306-4691-d77f-08da2c6d34ab
X-MS-TrafficTypeDiagnostic: PH7PR12MB5758:EE_
X-Microsoft-Antispam-PRVS: <PH7PR12MB57587C72F76194AAF31834268CC19@PH7PR12MB5758.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lcEPZQ5ngyUKL+SzIFLFBZkF74bbM0SxeoHZBHb8aTmuzXacGBPIhcuvyHK7WzL7s3EbzmYIRmR1+BQrsamPWkyrlqoFx/rIOAsIoxak1z/Fb/FtMT9ik9PAMWhUpKJ5AzzoC6pWjxN5Hsg7BFJeoTPFPzp7JLuMtHTbKVqxgQXlJQRgJaLDsJpt0vNxkb/JN+eHDEC2agO1MLt56hT8U+T1fcYs+rAi+UwdvGwpdV2WBAd4KNsrYAWtWr5tL0MJ+C1528F+mD+FA3kzzDDW6yS4SXLPYp0L9gYbAO5aKvLLqyCiMBfBreyNV3qpNvrA0KeCOeRi5chG1/kpQp2D5ucauRZbF75otX/69ghlOQb8V+9IhNf2ZZfH3ylGcaEUXtzenh8fY/ZS39wD3ebHEuCwSfPHEbh4e9vNIFGdJp2ojQK2Us5NmFI20hYKqpCq+TNka3CRfYRLVsBRgZHqLAZEng+OiUOUKr9BCykImfy9ySSG9WPf3iut0VlwWEdXPiTrHrJr+SWu6yqEO75xg06B7uEy/cExZ1MdasN2w0LCl51h1OQCvlt85qtNosTxx3WLCnSnlW3YrOjApFdTUDfyAMhKiBmS77VPYWyoHjZTFgZEKTTbUWXKmmaomAHFExgE8hXrE7A+8wWofpQ4Nez+RZMOg93O6th1HpPDjq4C0yA/J27Zpgy9s+64Cgak0EVZ91hFvmCNxxCp5lXvTuWS6XreG1ViqJ6rFnZDf+NkulDgQT3w22fDdq0dx+HS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(31696002)(6486002)(5660300002)(45080400002)(966005)(2906002)(508600001)(36756003)(110136005)(44832011)(38100700002)(316002)(83380400001)(2616005)(66556008)(66476007)(4326008)(66946007)(8676002)(6666004)(186003)(86362001)(921005)(31686004)(6512007)(6506007)(26005)(53546011)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3RjU1lhZUR3UDM2elBqVjNtVHl5QTY5LzhjM2JOWkV0ZHJuQ3IzQVp6K2JL?=
 =?utf-8?B?WG9aczhWWUNCbFJyRTUxckRxMjY1bVhYRDRBNHo0QWdobUFEcU5DRm1xUVpB?=
 =?utf-8?B?LzVsbWxKV1VGU3BDUXFXUkw2akorNEYrVzBDM3NxTktoNU90UzZqUC9aWlI4?=
 =?utf-8?B?YnQ2cWRhYkJQSnhGWVRCRU1PODdJTVNMeHNtTEUwc1ZwMVdXT2p5dkwwd2dy?=
 =?utf-8?B?QzJ5Z0FjMjFMMXU3V00ydUo5REgzRm9ER0oxVHNkT2R6TG56K2Fkakk0M09y?=
 =?utf-8?B?bllpTDF2Y21sTHcrcVp0a3R0bW52aWRWU01GVEk2U21jUXBYclN6Z1J2RCto?=
 =?utf-8?B?Qy8ra3lPTGdOL3ZBd3VpMkZncVR5UlFEa1Fkd0tVS0JyR25pRFZiWWsrK2la?=
 =?utf-8?B?aFgybjE5a1o3VFlUbGFtcGc2ZW9XL2Q0MWN5US9ZNG9vQ3MxU1lTQ3ZZTkht?=
 =?utf-8?B?L0VnaGhoUW1ZTUpTVmpkZEJZWFlUZnNZUERtSDZsaUU2cWhzbDBjZWZDOFJx?=
 =?utf-8?B?UjdoL1d6Um5rc2M4Tk1YNzJiak5PTVh2TTdycGsvWHhiZkJZZ3VwU0I0TDhO?=
 =?utf-8?B?bUdOSk5XeUpLRDVWaHFPNkxDS3RBd282b0JoU1RZYzNsNFlxMWNYN0g0SGsw?=
 =?utf-8?B?bUtabnV0TVIwcjFwRkxYVllOOHZwdTJUbEFOVGJ1dmFTcWNGTTNFTkd0MzFS?=
 =?utf-8?B?Yi96YmVlaXU2dmg0SDVvTXJydTI2K1J2dnE5V1VEdnlQSjlic3cvVjc4dzVn?=
 =?utf-8?B?czR1RUFnMjlKVy9CUlh6MStkTUNETFhOaXN5RXJueTZFQlord0h0QkVrZGRq?=
 =?utf-8?B?ZnNhKzJZaFBSZFZldnJONlFad3hSU0Jrdlg0SmNzM2dKWVV4SExYOXhuYkVO?=
 =?utf-8?B?RlUrcVNhVVNWUk92aHZzQVp6djNCek9oQVBTa21OYnBJUFhCYmI1YlJ4WE1z?=
 =?utf-8?B?QWNpQ1NIRGYzdG9RdmQybnFqdDVnUVdXK0MvdjlvbllMSzNxU1FVcUpqd01R?=
 =?utf-8?B?Nm5tSmpxbVBZc2x0bVZnZTRYVHhDUzdla2dySHBUNjVDajdFaGtzMG1reUcz?=
 =?utf-8?B?bmtTdk5LSW9zOE44S3QvK0RhanNlUktiNzdnSDRZNDlLaFdCUjRZNm1HTTRm?=
 =?utf-8?B?WnlBaFlZS0ZpZGgrbWFseXJEeEFkS0F2K0E1em1BeWtLWDl5dmZLSjdBeFVS?=
 =?utf-8?B?aiszd1JDNlprM2N6Mk1lcTJ2QVNGaUVwNHFJM0YvZjNLak8vQjNtcUpXRUxF?=
 =?utf-8?B?K0M0SndJZGhtVHZ1TVVOQko5c1Z6MThrWmEwdGxUejF6bXp4eVR5WGNSbCs0?=
 =?utf-8?B?Q3ZMOXMwZ21nU1pOQUxGNmhzWDFWWTdYdVdYWkNFZk9LV0drRWtEcWIvZFBB?=
 =?utf-8?B?TG9IRkJSTnZOOHVhMUpmbGxTdVJ6S3Y5TXhGSUFKNDBMMGJVeFMrK1lhQU1k?=
 =?utf-8?B?a3FBQlhyTFdPeis1dmh0d1cvNGtqTk1kY0htM2V3WFdsbHpDNk9lZVBZbHBI?=
 =?utf-8?B?aTRBNTU5TTYxTi9rQTcrSk9vWGNxbmwxSTg4TGZpbEJHNkhna1hpeGF6V0E2?=
 =?utf-8?B?bVNYejZxdjg5U0ROeldUOXdJZ0NPK1ZMRHAwYmlqakhIRjdmUjk0QVJ3eW0x?=
 =?utf-8?B?eWQ2R09sMjRoOHVvcmxGOW5CeG9kWVh6WkI2ZzhhTERkc2hKMFExYTh3dUdz?=
 =?utf-8?B?em5JK3FUdlVDQUcyRmpCVTRPdHJKVTRneGk3ZlNVdUxHU2tnV09RR0ZRQS9H?=
 =?utf-8?B?dW5KT2x4RmhWQnpwWERIS2ltSlFDd3hHc3YvQmh6RytEaVZIdUNDQ1NJYXlW?=
 =?utf-8?B?TGZNaC83ZXFqSnFPUGVTMzBNWUh1a2RhYUJFaFZubis2TExvM3EvNlVOOFRC?=
 =?utf-8?B?L2xwc3Ewb1NWanZRaXFlWUFUY3IwUkRSQjZiNklvSmMwZ2psaEhJL3A2NVRR?=
 =?utf-8?B?MmpYbnpWdUQ3cTgrenZnb1FjbTF3T2s3TWsxOXNJbzhzL1RGeW5CZTRSYXZI?=
 =?utf-8?B?bVc5L0QyYkphT2lLRmpGRWJGT25UWEFESW1BdDcvUWV2WTRPVmt0Ulk3QzJ4?=
 =?utf-8?B?K29YMjh6YWlHRTZBdzM0cWYvVjZiU21KUW5KczE1NG1XM1pSeDQ1TFptSXBk?=
 =?utf-8?B?bDJBeTdzODNVVDhzRzkzcS9pRFdaM01lVXVWWWtMK2dLTWRyU0hvUVhiVGFE?=
 =?utf-8?B?ZUtuWDNja0UxNkptSmVRdDE1MVVlNlBHQzRwdHNvSWpxMlRCMWRIZEIzbTNK?=
 =?utf-8?B?ZlNiK2Q3ckR5MEhlY2FzWEJQcEhleGVSTHljemFBM1Q1ckFvcXhEcXZZZmhI?=
 =?utf-8?B?dnpHQkVmbk9ZSWpnWXpUTEJZYWFHSXFqNkdhWk9zeWlUQm8ySHB1Zz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37c421ce-1306-4691-d77f-08da2c6d34ab
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2022 18:54:37.4956 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 90DVaL8JTHnEWyD1jkhR1PO0HvEC4t4M4dVvgBPeOdQnrr3M01umlriVoJCqEL9z0noUsHDD49IfyYPKcunmWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5758
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
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-05-02 10:29, Harry Wentland wrote:
> 
> 
> On 2022-05-02 10:27, Modem, Bhanuprakash wrote:
>> On Mon-02-05-2022 07:08 pm, Harry Wentland wrote:
>>>
>>>
>>> On 2022-05-02 09:28, Modem, Bhanuprakash wrote:
>>>> On Fri-29-04-2022 08:02 pm, Murthy, Arun R wrote:
>>>>>
>>>>>
>>>>>> -----Original Message-----
>>>>>> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of
>>>>>> Bhanuprakash Modem
>>>>>> Sent: Monday, April 11, 2022 3:21 PM
>>>>>> To: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org;
>>>>>> amd-
>>>>>> gfx@lists.freedesktop.org; jani.nikula@linux.intel.com;
>>>>>> ville.syrjala@linux.intel.com; harry.wentland@amd.com; Sharma, Swati2
>>>>>> <swati2.sharma@intel.com>
>>>>>> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>>>>>> Subject: [Intel-gfx] [V2 3/3] drm/amd/display: Move connector
>>>>>> debugfs to
>>>>>> drm
>>>>>>
>>>>>> As drm_connector already have the display_info, instead of creating
>>>>>> "output_bpc" debugfs in vendor specific driver, move the logic to the
>>>>>> drm
>>>>>> layer.
>>>>>>
>>>>>> This patch will also move "Current" bpc to the crtc debugfs from
>>>>>> connector
>>>>>> debugfs, since we are getting this info from crtc_state.
>>>>>>
>>>>>> Cc: Harry Wentland <harry.wentland@amd.com>
>>>>>> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>>>>>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>>>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>>>> ---
>>>>> Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
>>>>
>>>> Thanks Arun,
>>>>
>>>> @Harry/@Rodrigo, If this change sounds good to you, can you please help
>>>> to push it?
>>>>
>>>
>>> This changes the output_bpc debugfs behavior on amdgpu and breaks
>>> the amd_max_bpc IGT test. I don't think we should merge this as-is.
>>
>> Yeah, I have floated the IGT changes to support this series:
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fseries%2F102387%2F&amp;data=05%7C01%7Charry.wentland%40amd.com%7C8cb627c63b194b3b82f808da2c4839b0%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637870985961376064%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=kn26Et7wc9IUkYhSG3R%2FXVKIJoqyKlQ1%2FNcduVh9Fuo%3D&amp;reserved=0
>>
>>
>> With this IGT change, we can merge this series as-is. I would like to
>> request you to review IGT patches too.
>>
>>>
>>> This patch also seems dependent on patch 1 of the series. Shouldn't
>>> they be merged together (please don't merge them as-is, though)?
>>
>> Yes, as other patches in this series are already reviewed, I think we
>> need to plan to merge all patches in this series together (If above IGT
>> & this patch looks good to you).
>>
> 
> Thanks for the context again and apologies I haven't had the time to
> have a closer look so far. I'll go over these and the IGT patches today
> and get back to you.
> 

Both the kernel and IGT series look good to me.

I recommend you merge the entire kernel set as one into drm-next. We
can pull it into amd-staging-drm-next so as not to break our CI once
the IGT patches land.

Harry

> Harry
> 
>> - Bhanu
>>
>>>
>>> Harry
>>>
>>>> - Bhanu
>>>>
>>>>>
>>>>> Thanks and Regards,
>>>>> Arun R Murthy
>>>>> --------------------
>>>>
>>
