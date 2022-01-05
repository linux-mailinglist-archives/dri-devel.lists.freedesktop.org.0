Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFFE485B70
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jan 2022 23:13:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE9D10E405;
	Wed,  5 Jan 2022 22:13:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2066.outbound.protection.outlook.com [40.107.212.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7352C10E405;
 Wed,  5 Jan 2022 22:13:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HnQRoMZyoeGcRHOQWP7LuYdJibTFYtSrZ1HKB1X591WdZLsPvGmmr0X+GCZPUUQRF/6pskLhPg7DSn6W3zR5qRf/RdqZC7CuqlF6Q6OdmuqGjPI+p9+AH+f8JCw+IST6HMZTv0qgJSBeXFWhN/xKuAD+r3t+r3FsEI/+2qX4odI1envn4WVXkuLN+t7VhyBdvSOHMupFs0IIoVb/raw7JP/w7GO2gduwsMSt+sVY0qdygUXMlhSAI2WfZONKSjaDcnNeF9AAVJH026LbdzeGSit9mf4wcXnsi35dNEAqGSGICHofYQI+MTBvuTTwpOeg3mBJP7Q4VmEZ/JTmF8Sw8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e5y8wetj/GYNOxux18Ty+h7m9i089OtoDsSYICuJWTo=;
 b=jc7RybU0E76MzvzQvC6VIbziJLbQmEwKf6S5k8DGuwnLEN3cUqFzeb5t74OFhGBtDtEq38YnRkO5GYjKvXZByYct1UmDw1hTv4ZKN2HV0sYCDlLZiviiZPVQEyQ0V6qLW0EmXKo8jaZqsKgopovnDYxDFxCuk3GhXci1hsMKjaKWdPWwTLX2eRYJsej6Q6fvZzFwGi6/d/oEscjq1TFgvmQaZi0cQLPphGTMl2G1m43wpmayERk9bmdycIh9yydIYuRJef78T3Ff+vo4YRRLpVz2AWey0o2dDMF7fAeDBXoSvlBGpgAPYqS0KkwDBTNaC4UnNYDHwU3g5090if0LMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e5y8wetj/GYNOxux18Ty+h7m9i089OtoDsSYICuJWTo=;
 b=2+YNWONjXMAjgjF3qGiFtKGuQDpU3VN5wtC82f1B1QczDyI9p1TQ55cm+DQCeggvE9Y0YEqMhG4Ga6Uq6k2EioCpLvVdFmd3nTs181zdGjGjA2JC5QzmsaaZjrQZlvrR/3y0j87fxygJo8QgpAEmn60Quy3i22SOh8ryGZwcpOQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5491.namprd12.prod.outlook.com (2603:10b6:303:13b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Wed, 5 Jan
 2022 22:13:06 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::dd4b:b67b:1688:b52]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::dd4b:b67b:1688:b52%9]) with mapi id 15.20.4867.009; Wed, 5 Jan 2022
 22:13:06 +0000
Message-ID: <b5f80a04-e191-3ce6-193e-492f4494c19b@amd.com>
Date: Wed, 5 Jan 2022 17:13:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [i-g-t 04/14] tests/kms_color: New subtests for Plane gamma
Content-Language: en-US
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20211115094759.520955-1-bhanuprakash.modem@intel.com>
 <20211115094759.520955-5-bhanuprakash.modem@intel.com>
 <bfd0e880-491f-015b-256d-9adb0193e78d@amd.com>
 <DM8PR11MB57196030D9E75C34F6A4CA4D8D499@DM8PR11MB5719.namprd11.prod.outlook.com>
 <d8d00fe5-da3c-cf8a-f7ef-6f525b1d551a@amd.com>
 <DM8PR11MB57195370429C802075416FCC8D4B9@DM8PR11MB5719.namprd11.prod.outlook.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <DM8PR11MB57195370429C802075416FCC8D4B9@DM8PR11MB5719.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0153.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:e::26) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f6abb7e-8d46-47ef-e054-08d9d0988c56
X-MS-TrafficTypeDiagnostic: CO6PR12MB5491:EE_
X-Microsoft-Antispam-PRVS: <CO6PR12MB5491F68D7547F786FA5062738C4B9@CO6PR12MB5491.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vki9Ylh+vGL4GaQ0dwdfvG55ujaPe9qPzJ+PnQyqGDlokT58BKdC9x0zxgL9V1A4tEkcut5b4jVqoCVyGzTg8LUbeSOKU31a92cLgsi4BgL3x0BUHkl0AIzE+xXYx1A3pnizSTvYkSlOs/ZJ2vojQgIgdgn4io2K90vRlylLIJIu75/H+nhJ9sdsTQ5Tw8xP1+I1b6RFLxpmXTMcYCnCqMIft+mNRfsnC3lTz8gZV+wqxy14BFgu8aXCHwsoS5hrvW7CUcmMZsNT8JvwfbpuTxChQE2xdkB5NMhflf22aN6aF/5HQ6f2gy6VFzA3vZpxdKvb3nT1LsxStYKD8DJwlATArf9VMdJMipiaF4O2OfaxAMui2WNeqesRz4JJ8Sy3XDYaMV2obwgTgleQ/jKTeQKJMng7HUXk7zVzgYRYEJuE/aF7GFexNZ8PDl9Tck3BDhI2pLXVIZKCI8h2X2N9ABuTlzZ6Yj/2VMRtMpFgPoI4SV19jOx99frVe0vRKTnB+E5oM76QCPIwe783WH2SVLPdAkvM5Z1s+hHxStLX7O6SzC4DuSXgKLQx+6J803L4kYOlxNJ1R7HzJ60oR3mnnvaVNeP38ZV6aVdyPMXafvJe1ouorq3bAcMota2KEZEV04U/rXbIMnsG3j5yjzuKEHYFz4nri1lAo1IynjwvulRaQZ7vkii0WRHQUVUarWLC+2sRaiG/14QwNpbcd4kp3+A3l9HVSw+x5A7LeqjUJoY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(186003)(4001150100001)(66556008)(508600001)(110136005)(44832011)(66574015)(8676002)(31686004)(2616005)(30864003)(8936002)(6512007)(86362001)(83380400001)(66476007)(38100700002)(4326008)(6666004)(5660300002)(316002)(31696002)(26005)(53546011)(6506007)(54906003)(6486002)(66946007)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmpQWWN4TEdXODR0MnlRb0FaaHg5QW0zN2V0WDFFZzVIWHExQzdSSUN6cHRO?=
 =?utf-8?B?MTQ2RHpQV0hGaExWN3lxcWs2VFpFTjNkNVhzb1FFUGFuMElQSm1ucE04VDk2?=
 =?utf-8?B?OGd4RTZ6T25UdStOM2ZFNkJQMWxKcVQ2T2RDTk1ncWV3RkhnblNrbXdRbmxJ?=
 =?utf-8?B?UnZYQjFoVzBaY0tzczc3bmNQRmh2RlZFbGxqZXZrQzM5Rk9hbERyZ2o3YUJ3?=
 =?utf-8?B?QTY0U01XeU5FZVcwT1J6cDkxRE55U0l4S3lGV0ZHRzdWc2VSdVpEQ3FMUzlw?=
 =?utf-8?B?SFNpT0FTQkF2Zlk0MXdkVXhkRmM5bDZKdzZsdlhqRFdDOTA1ZHNwYW9zaXZl?=
 =?utf-8?B?UndLQzFReUVtYjlNV21WdWRkOG1WcVpUV08vemt1aE5YT1pwVEZ3UDl2ZlAz?=
 =?utf-8?B?Ylg0Y0Fjb3M2aWgyM05UNldjajZweE5xS3BZclROYXh4S0YvdkRuMTU3SHlo?=
 =?utf-8?B?Y05OanNBOVBZOG42dVFvN0Nid3dycEJXZVRqL3pZQlhQM2FMS0pPaXVIVTdI?=
 =?utf-8?B?NHI0cnZSMTA2WndBUXlpWXhNbE8vbGkvektiUThlVUc5cjZjTlNaZ2VoYjcy?=
 =?utf-8?B?dXJhbFNqZjAvQ2pJdXBMNkh5TTVXQkNUdjFQSGhpOThwSVNMdTM0SjBKcHda?=
 =?utf-8?B?VUxFWHcyNnJwc3JiRVVYZVo5SmIrdnVIQW9MekJ5bjlKZE1QV3Bxdk5uNjdM?=
 =?utf-8?B?YmVSUXN0T291d2x3WU5TSnV5MHdGOU1PVTRRQXlhLzJxajhsWVFsME9hYXd3?=
 =?utf-8?B?c2c1Rno1bjgwWVZKTTZmRTJHZDNtVjQveDZRYmNTOFVvYWVEY3dsSmpwQXdB?=
 =?utf-8?B?UVVqeXlNOFRhT0tzSTZuNkwvb2xCTmhxbDZGbXZxQzhCaEFrK01GeUs1SjNC?=
 =?utf-8?B?eHp6Z3pPMHlnMVU3T3hwOGpXbGx1Nm8rYkdBL3lFSjFFS0FRbVJyS1lpclNh?=
 =?utf-8?B?cEkxRzU5ZE0zdytxelJEb3p1UUVuNTFMQmV6MVp3ZTVsLzZzZkZHUnRJM2Vz?=
 =?utf-8?B?WkR5N2VGNytpWENIcWMrS1ErTHdxS2JhTXV3aW8xOS9zNGhUa0ErczhXMUFt?=
 =?utf-8?B?VERXNzRLVU5zaW1LdlF1aGMwSmxZR0svVHdIakEvZVI4Uk81RXQ1Sk1KTkVs?=
 =?utf-8?B?cHJMRHhqNWZGWjV1OWRha3FYVmRRWVpzYU9iZnpZOWJSenl6TWNHK05Ma2xx?=
 =?utf-8?B?bTRVeUJPczdKdVhFOENpNGJpNVA2TlgwRWhQaXpTTFJMV2RDaktXZ3htSEli?=
 =?utf-8?B?MVAvcUhBaUhRMGNXWHNycE81b29DTXRYYTRyUkViQTBrZTVDdndDWVRtVXZv?=
 =?utf-8?B?YW1RRHVCSkFiMG5KNTJaRWpRRnJjN0U5SkQ2ZGZxZklsU0xZRjNmSGFXcnRh?=
 =?utf-8?B?T05SZ0RwZkhLSEczaHd1a3F0UkUvQmR3ZDVRZ2E1NnloNEp1Q0p2aHQyVDFI?=
 =?utf-8?B?Q24wa2tTeXpXcVNnK0M1Y0dCVkZQNnhjdytsRVg2a3c1Y0s3UFlVWU5SU1ow?=
 =?utf-8?B?ZUMvQk5mdFlVNnczV3NSSnEwUkJXUWNWK0lKeTJkODROT2liMTAyT2JKV0lT?=
 =?utf-8?B?K0tWZjAvcW5DMDBPT2lpcy9hbDFqa3Rldml4d1BheWdzdXFMbnBOYW44MHdp?=
 =?utf-8?B?bDFjZXlzaHdWS09tSGdkeWdsT0hBd1pmUlR0R2h5eStpenRCajZjUk00dmVa?=
 =?utf-8?B?ZUk3eGkzN3pRZFk3Z1VrU1pQWTVZTWFFNi8yeHdmdmJYTzZDbUlqdWhIVDBS?=
 =?utf-8?B?Tk82R1lTWEdwaGRSOVduZXN6S3RxV2ptcjE4YkgxUEdnT1Q4UmRvNy9wdnlk?=
 =?utf-8?B?NVd5QXNTcWd5TmtwbVdZZWRGUGxRbzkwVE94bzNINkxkSVRma3E0WnRYUFM3?=
 =?utf-8?B?d0htMlg2VHY3VTBTQ3dWRllzWUQxK1J5V0FPZ1Uzd1hCY0JwcHR5K09iTVp3?=
 =?utf-8?B?N0oxR0J2VjE1RmJxT0tqemFDNGNxS1hvQTBSZzdCaFZvT3R3R0M1ZVNSQVBl?=
 =?utf-8?B?YmVUb2NRaE54MnFhTjVzRVpoMUpCbjVaVENyVjBCQWFTK2FjTkdwREI5d3lW?=
 =?utf-8?B?TmRvTjh6UDBqYlVsd0JTcU1Ud0pBbzVDVnNvNSswNzVPZXMrbXFiQkZUZDRZ?=
 =?utf-8?B?dFQra1pxMkNYL1JjWmFGMnBVL0FxbXB3RDhqU1dUbHhlQXBmZEFCN3BlWWl5?=
 =?utf-8?Q?awNtDp3mXE20W2tyrWXK2A8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f6abb7e-8d46-47ef-e054-08d9d0988c56
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2022 22:13:06.0245 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z3ETsSmvY6FksKK7lkjMYFh2DuuT263N4CqkXE6v/qPxZaWJ8Nzyjmy6mM8X8xRz7HALY4PpXFPbzMohuEPEdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5491
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
Cc: "Shankar, Uma" <uma.shankar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-01-05 06:21, Modem, Bhanuprakash wrote:
>> From: Harry Wentland <harry.wentland@amd.com>
>> Sent: Wednesday, January 5, 2022 2:49 AM
>> To: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>; igt-
>> dev@lists.freedesktop.org; dri-devel@lists.freedesktop.org
>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>; Shankar, Uma
>> <uma.shankar@intel.com>; ppaalanen@gmail.com
>> Subject: Re: [i-g-t 04/14] tests/kms_color: New subtests for Plane gamma
>>
>> On 2022-01-02 23:05, Modem, Bhanuprakash wrote:
>>>> From: Harry Wentland <harry.wentland@amd.com>
>>>> Sent: Friday, November 26, 2021 10:25 PM
>>>> To: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>; igt-
>>>> dev@lists.freedesktop.org; dri-devel@lists.freedesktop.org
>>>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>; Juha-Pekka Heikkila
>>>> <juhapekka.heikkila@gmail.com>; Shankar, Uma <uma.shankar@intel.com>
>>>> Subject: Re: [i-g-t 04/14] tests/kms_color: New subtests for Plane gamma
>>>>
>>>> On 2021-11-15 04:47, Bhanuprakash Modem wrote:
>>>>> To verify Plane gamma, draw 3 gradient rectangles in red, green and blue,
>>>>> with a maxed out gamma LUT and verify we have the same CRC as drawing
>> solid
>>>>> color rectangles.
>>>>>
>>>>> Cc: Harry Wentland <harry.wentland@amd.com>
>>>>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
>>>>> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>>>>> Cc: Uma Shankar <uma.shankar@intel.com>
>>>>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>>>>> ---
>>>>>  tests/kms_color.c | 179 +++++++++++++++++++++++++++++++++++++++++++++-
>>>>>  1 file changed, 178 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/tests/kms_color.c b/tests/kms_color.c
>>>>> index 775f35964f..b45d66762f 100644
>>>>> --- a/tests/kms_color.c
>>>>> +++ b/tests/kms_color.c
>>>>> @@ -24,7 +24,34 @@
>>>>>
>>>>>  #include "kms_color_helper.h"
>>>>>
>>>>> -IGT_TEST_DESCRIPTION("Test Color Features at Pipe level");
>>>>> +IGT_TEST_DESCRIPTION("Test Color Features at Pipe & Plane level");
>>>>> +
>>>>> +#define MAX_SUPPORTED_PLANES 7
>>>>> +#define SDR_PLANE_BASE 3
>>>>> +
>>>>> +typedef bool (*test_t)(data_t*, igt_plane_t*);
>>>>> +
>>>>> +static bool is_hdr_plane(const igt_plane_t *plane)
>>>>> +{
>>>>> +	return plane->index >= 0 && plane->index < SDR_PLANE_BASE;
>>>>> +}
>>>>> +
>>>>> +static bool is_valid_plane(igt_plane_t *plane)
>>>>> +{
>>>>> +	int index = plane->index;
>>>>> +
>>>>> +	if (plane->type != DRM_PLANE_TYPE_PRIMARY)
>>>>> +		return false;
>>>>> +
>>>>> +	/*
>>>>> +	 * Test 1 HDR plane, 1 SDR plane.
>>>>> +	 *
>>>>> +	 * 0,1,2 HDR planes
>>>>> +	 * 3,4,5,6 SDR planes
>>>>> +	 *
>>>>> +	 */
>>>>
>>>> This seems to be about Intel HW. AMD HW for example does
>>>> not have HDR or SDR planes, only one generic plane.
>>>>
>>>>> +	return index >= 0 && index < MAX_SUPPORTED_PLANES;
>>>>> +}
>>>>>
>>>>>  static void test_pipe_degamma(data_t *data,
>>>>>  			      igt_plane_t *primary)
>>>>> @@ -638,6 +665,122 @@ static void test_pipe_limited_range_ctm(data_t
>> *data,
>>>>>  }
>>>>>  #endif
>>>>>
>>>>> +static bool plane_gamma_test(data_t *data, igt_plane_t *plane)
>>>>> +{
>>>>> +	igt_output_t *output;
>>>>> +	igt_display_t *display = &data->display;
>>>>> +	drmModeModeInfo *mode;
>>>>> +	struct igt_fb fb;
>>>>> +	drmModePropertyPtr gamma_mode = NULL;
>>>>> +	uint32_t i;
>>>>> +	bool ret = true;
>>>>> +	igt_pipe_crc_t *pipe_crc = NULL;
>>>>> +	color_t red_green_blue[] = {
>>>>> +		{ 1.0, 0.0, 0.0 },
>>>>> +		{ 0.0, 1.0, 0.0 },
>>>>> +		{ 0.0, 0.0, 1.0 }
>>>>> +	};
>>>>> +
>>>>> +	igt_info("Plane gamma test is running on pipe-%s plane-%s(%s)\n",
>>>>> +			kmstest_pipe_name(plane->pipe->pipe),
>>>>> +			kmstest_plane_type_name(plane->type),
>>>>> +			is_hdr_plane(plane) ? "hdr":"sdr");
>>>>> +
>>>>
>>>> is_hdr_plane is Intel-specific.
>>>>
>>>>> +	igt_require(igt_plane_has_prop(plane, IGT_PLANE_GAMMA_MODE));
>>>>> +	igt_require(igt_plane_has_prop(plane, IGT_PLANE_GAMMA_LUT));
>>>>> +
>>>>> +	pipe_crc = igt_pipe_crc_new(data->drm_fd,
>>>>> +				  plane->pipe->pipe,
>>>>> +				  INTEL_PIPE_CRC_SOURCE_AUTO);
>>>>> +
>>>>> +	output = igt_get_single_output_for_pipe(display, plane->pipe->pipe);
>>>>> +	igt_assert(output);
>>>>> +
>>>>> +	igt_output_set_pipe(output, plane->pipe->pipe);
>>>>> +	mode = igt_output_get_mode(output);
>>>>> +
>>>>> +	/* Create a framebuffer at the size of the output. */
>>>>> +	igt_assert(igt_create_fb(data->drm_fd,
>>>>> +			      mode->hdisplay,
>>>>> +			      mode->vdisplay,
>>>>> +			      DRM_FORMAT_XRGB8888,
>>>>> +			      DRM_FORMAT_MOD_LINEAR,
>>>>> +			      &fb));
>>>>> +	igt_plane_set_fb(plane, &fb);
>>>>> +
>>>>> +	/* Disable Pipe color props. */
>>>>> +	disable_ctm(plane->pipe);
>>>>> +	disable_degamma(plane->pipe);
>>>>> +	disable_gamma(plane->pipe);
>>>>> +
>>>>> +	disable_plane_ctm(plane);
>>>>> +	disable_plane_degamma(plane);
>>>>> +	igt_display_commit2(display, display->is_atomic ?
>>>>> +					COMMIT_ATOMIC : COMMIT_LEGACY);
>>>>> +
>>>>> +	gamma_mode = get_plane_gamma_degamma_mode(plane, IGT_PLANE_GAMMA_MODE);
>>>>> +
>>>>> +	/* Iterate all supported gamma modes. */
>>>>> +	for (i = 0; i < gamma_mode->count_enums; i++) {
>>>>> +		igt_crc_t crc_gamma, crc_fullcolors;
>>>>> +		segment_data_t *segment_info = NULL;
>>>>> +		struct drm_color_lut_ext *lut = NULL;
>>>>> +		uint32_t lut_size = 0;
>>>>> +
>>>>> +		/* Ignore 'no gamma' from enum list. */
>>>>> +		if (!strcmp(gamma_mode->enums[i].name, "no gamma"))
>>>>> +			continue;
>>>>> +
>>>>
>>>> It might still make sense to test that this is doing bypass.
>>>
>>> As we know gamma_mode->enum[i].name represents the name of the
>>> gamma mode and gamma_mode->enum[i].value would be the LUT blob
>>> address of that particular gamma_mode.
>>>
>>> For "no gamma" case the blob address is NULL, so we can't commit
>>> this mode. Hence skipping this mode.
>>>
>>
>> I was thinking it'd be good to test the "no gamma" case as well
>> here, i.e. the case were we set a NULL blob. I'm not sure what
>> you mean when you say "we can't commit this mode."
> 
> Sorry for the confusion, "no gamma" is intentional to disable the gamma.
> I think, we just need to check that we can able to flip with this mode.
> So, we need to update disable_plane_gamma() to use this mode.
> 
> Or are you thinking any specific usecase for this?
> 

I understand that "no gamma" is used to disable the gamma block
but where do we test that the driver disables it correctly?

I'm fine to skip it here if we test it elsewhere but it almost
makes sense to test this here as just another gamma mode.

Harry

> - Bhanu
>  
>>
>> Harry
>>
>>>>
>>>>> +		igt_info("Trying to use gamma mode: \'%s\'\n", gamma_mode-
>>>>> enums[i].name);
>>>>> +
>>>>> +		/* Draw solid colors with no gamma transformation. */
>>>>> +		disable_plane_gamma(plane);
>>>>> +		paint_rectangles(data, mode, red_green_blue, &fb);
>>>>> +		igt_plane_set_fb(plane, &fb);
>>>>> +		igt_display_commit2(display, display->is_atomic ?
>>>>> +					COMMIT_ATOMIC : COMMIT_LEGACY);
>>>>> +		igt_wait_for_vblank(data->drm_fd,
>>>>> +			display->pipes[plane->pipe->pipe].crtc_offset);
>>>>> +		igt_pipe_crc_collect_crc(pipe_crc, &crc_fullcolors);
>>>>> +
>>>>> +		/* Draw gradient colors with gamma LUT to remap all
>>>>> +		 * values to max red/green/blue.
>>>>> +		 */
>>>>> +		segment_info = get_segment_data(data, gamma_mode->enums[i].value,
>>>>> +				gamma_mode->enums[i].name);
>>>>> +		lut_size = sizeof(struct drm_color_lut_ext) * segment_info-
>>>>> entries_count;
>>>>> +		lut = create_max_lut(segment_info);
>>>>> +		set_plane_gamma(plane, gamma_mode->enums[i].name, lut, lut_size);
>>>>> +
>>>>> +		paint_gradient_rectangles(data, mode, red_green_blue, &fb);
>>>>> +		igt_plane_set_fb(plane, &fb);
>>>>> +		igt_display_commit2(display, display->is_atomic ?
>>>>> +					COMMIT_ATOMIC : COMMIT_LEGACY);
>>>>> +		igt_wait_for_vblank(data->drm_fd,
>>>>> +			display->pipes[plane->pipe->pipe].crtc_offset);
>>>>> +		igt_pipe_crc_collect_crc(pipe_crc, &crc_gamma);
>>>>> +
>>>>> +		/* Verify that the CRC of the software computed output is
>>>>> +		 * equal to the CRC of the gamma LUT transformation output.
>>>>> +		 */
>>>>> +		ret &= igt_check_crc_equal(&crc_gamma, &crc_fullcolors);
>>>>> +
>>>>> +		free(lut);
>>>>> +		clear_segment_data(segment_info);
>>>>> +	}
>>>>> +
>>>>> +	disable_plane_gamma(plane);
>>>>> +	igt_plane_set_fb(plane, NULL);
>>>>> +	igt_output_set_pipe(output, PIPE_NONE);
>>>>> +	igt_display_commit2(display, display->is_atomic ?
>>>>> +					COMMIT_ATOMIC : COMMIT_LEGACY);
>>>>> +
>>>>> +	igt_pipe_crc_free(pipe_crc);
>>>>> +	drmModeFreeProperty(gamma_mode);
>>>>> +
>>>>> +	return ret;
>>>>> +}
>>>>> +
>>>>>  static void
>>>>>  prep_pipe(data_t *data, enum pipe p)
>>>>>  {
>>>>> @@ -890,6 +1033,37 @@ run_invalid_tests_for_pipe(data_t *data, enum pipe
>> p)
>>>>>  		invalid_ctm_matrix_sizes(data, p);
>>>>>  }
>>>>>
>>>>> +static void run_plane_color_test(data_t *data, enum pipe pipe, test_t
>> test)
>>>>> +{
>>>>> +	igt_plane_t *plane;
>>>>> +	int count = 0;
>>>>> +
>>>>> +	for_each_plane_on_pipe(&data->display, pipe, plane) {
>>>>> +		if (!is_valid_plane(plane))
>>>>> +			continue;
>>>>> +
>>>>> +		igt_assert(test(data, plane));
>>>>> +
>>>>> +		count++;
>>>>> +	}
>>>>> +
>>>>> +	igt_require_f(count, "No valid planes found.\n");
>>>>> +}
>>>>> +
>>>>> +static void run_tests_for_plane(data_t *data, enum pipe pipe)
>>>>> +{
>>>>> +	igt_fixture {
>>>>> +		igt_require_pipe(&data->display, pipe);
>>>>> +		igt_require_pipe_crc(data->drm_fd);
>>>>> +		igt_require(data->display.pipes[pipe].n_planes > 0);
>>>>> +		igt_display_require_output_on_pipe(&data->display, pipe);
>>>>> +	}
>>>>> +
>>>>> +	igt_describe("Compare maxed out plane gamma LUT and solid color linear
>>>> LUT");
>>>>
>>>> I can't seem to see the linear LUT test. This only seems to test
>>>> the max LUT.
>>>>
>>>> Harry
>>>>
>>>>> +	igt_subtest_f("pipe-%s-plane-gamma", kmstest_pipe_name(pipe))
>>>>> +		run_plane_color_test(data, pipe, plane_gamma_test);
>>>>> +}
>>>>> +
>>>>>  igt_main
>>>>>  {
>>>>>  	data_t data = {};
>>>>> @@ -910,6 +1084,9 @@ igt_main
>>>>>
>>>>>  		igt_subtest_group
>>>>>  			run_invalid_tests_for_pipe(&data, pipe);
>>>>> +
>>>>> +		igt_subtest_group
>>>>> +			run_tests_for_plane(&data, pipe);
>>>>>  	}
>>>>>
>>>>>  	igt_fixture {
>>>>>
>>>

