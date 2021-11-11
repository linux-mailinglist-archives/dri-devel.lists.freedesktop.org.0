Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 849FF44DCE6
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 22:10:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A27996E0F4;
	Thu, 11 Nov 2021 21:10:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2049.outbound.protection.outlook.com [40.107.243.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A03386E0F4;
 Thu, 11 Nov 2021 21:10:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cVavFGNbwWoG7qa9DutYRycbDtgECWO686wA0KERxo17ehk2goUkkli6pe+xwniwoCQTfm4Lhs7RwWxWBCTDzYJ1JE2teIR8viymOmcP9VqIwZOX4RcWZ5divYPi2ZZJHuu7M/XyFvfg5DxBhuKYQyqCJyh58dVaDbOzh8wXIlVzkuTbA9Hs5pdtGkClJwC9xeV643EG5QyX3cV76GyTYNYITumRTjzb4fsiWgSEOkA+ockoKjkyypcif8zhKk045rr/2yovOl0tAICxkzxBBBh28WDIQSzFRNpUZigKyC3AqfMIGdn9sOZeQrpbsZX89xXFPSOeSiYBkeE885GAIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B24kvmDoLaqNUKZB3PwzbI3REFVkWbfAl9kjrNcrkcU=;
 b=QECyASlLYI2sP4nnfqQ8t9z62DJKhVP8jkERguoG0Nt4cFiz4XCQLshgWBTcRW7/DML6XogWSOaRlKxVDUomIFTxGUw8vOYzYCgsweimFbYSd0lAjPw1MJXYnP9j8Lvkd81wyehyOZbHyteHZ/mhjIbalTGx8e1IBeyZZvmzvC/HMk6X790cyBwEx3k9DRouQa42zYSpngGIuy+zGp2nFPTvcvCAKK+vBPsd75EXUiztkJpiSIhkdzIhkOWA17byUMO5+UVitF4GI55bvS5qADTf4zRdPYZ0XsRlt4remBT2Gd3XzGQBdR76pGrU8+l6XUT5HIY5TTr9tsI2YircKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B24kvmDoLaqNUKZB3PwzbI3REFVkWbfAl9kjrNcrkcU=;
 b=SfK4x6i/GN0G7qOgMAqmjBG1CtbVf+QdtbXst8a4PVM7/tZARuEARNXXSxwkJYYB95A0+Ugu1O2RpdUbszfsSXkkOY4db/DZyVsAeNOWl6H9w6zRrkB1SBXb5Heo0q4xA7sLkSUqo26o2YU50AA5xDDnvRvHWrT+0n2LfTLbf1k=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5475.namprd12.prod.outlook.com (2603:10b6:5:354::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.16; Thu, 11 Nov
 2021 21:10:44 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::d095:131a:b99a:9975]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::d095:131a:b99a:9975%3]) with mapi id 15.20.4669.016; Thu, 11 Nov 2021
 21:10:44 +0000
Message-ID: <4a26ada6-feaa-76df-3ffe-d694e367d809@amd.com>
Date: Thu, 11 Nov 2021 16:10:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [RFC v2 05/22] drm/i915/xelpd: Define Degamma Lut range struct
 for HDR planes
Content-Language: en-US
To: "Shankar, Uma" <uma.shankar@intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20210906213904.27918-1-uma.shankar@intel.com>
 <20210906213904.27918-6-uma.shankar@intel.com>
 <52ce874c-64ae-d7a9-bc4e-255cfa49f410@amd.com> <YY1H//+XISVMFZNL@intel.com>
 <edc4b80279354ec7bcdb0a890dae7d79@intel.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <edc4b80279354ec7bcdb0a890dae7d79@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0137.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:e::10) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
Received: from [192.168.50.4] (198.200.67.104) by
 YQBPR0101CA0137.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend
 Transport; Thu, 11 Nov 2021 21:10:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 13e8467c-5138-4218-b515-08d9a557b982
X-MS-TrafficTypeDiagnostic: CO6PR12MB5475:
X-Microsoft-Antispam-PRVS: <CO6PR12MB5475B0EB0D72FD03392822938C949@CO6PR12MB5475.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fjFe3QfviqQ6iSevf7eC5lzJQua8EtEOgMFaCZUrs1Yr5FtQMhqzF2XW2ShFUL9/RdHvUFCEF1Zoa8QMlEhxgvQ/TW8oOymjxl4ZbSF1Fz6QTEiq9R4At7NDfOeynwTYQdL4gI3zkswyLTinEDVUjoQyg3U5R2vM2rF8w6LKu3rV5EmIK+460D7f2Ty2rmpgiffSZmnACbjZ3gw3plPfTZ9p+SOOXZSIpguj6FIuysI0YoggehZS7eSObyZR2g4cniS5tXl3sq47Nfw4Ep1+6x7AyN83WW3UauluuzLK6rsshgG52pDpgdN9IudTYYeUET5C3w9qhmCvIySnX2862AJW9ClNuWLcMSjUkS0zN3GEDnSSd97QbSj7Nj9qNrte0cGlgmnHCBs6coihSxsW/gmraSGGhhLAysvvPpr+BZmzHbdXxNHY4EX1fM6T/1bbNIfxL88B7aAz6PNCRkgrn0KbZJflTtl6besulZ7cYMi38oOZfMH4q5RkWMuBvRG0umioyINf1YoHRh94pFk41i/bfc7FZDmrCvQNNj7Yf23ERjQ/WFdGKoVWy02dbH/dnN1quft9mf5M+GEMaUlMn9I5ysB5MMXo2iyIHAKomom7UmcfwjR9RR6zJbrVurpN85lC3XTZJC46F8bJsTyfvEC9ua/RxKjrtxwXjgyajQvJqFpAGv1/2iwLtFhrfflrvTyjcl0DxCKKbkhIDOB2aMdPw/zyeufKl03nqNvVwNI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(956004)(2616005)(110136005)(31696002)(316002)(66476007)(966005)(54906003)(38100700002)(66556008)(186003)(26005)(53546011)(8676002)(4326008)(8936002)(2906002)(5660300002)(508600001)(16576012)(83380400001)(36756003)(31686004)(66574015)(86362001)(44832011)(4001150100001)(6486002)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmVhN1kwVlVFMEpWVmtxaVBkdXdnMXgzRXprNU1PVFRSRVNrazlpNUtmb2dx?=
 =?utf-8?B?dkx4VjVaSU9oWWwvR2RiWGQrYXBpN2dHd2NKY2VCZHdjc0N1NnVaVEtkK1pj?=
 =?utf-8?B?SUFjZ3Fyc01Jc1FHbC9US2NodGhzeXFSSy9ETnlmRDVpUk5DdU03YTdaTWhz?=
 =?utf-8?B?b0dOOVNwS2NncTVZTk9pWFlmUlVCb0lYczZpRmNlbHpsU3JQUG45MDRrV3Bx?=
 =?utf-8?B?SHFEd05nRDVKMXoydElJVUZWVnpDNnlsSnEraDROWnNIVjYzMkgrelE5MUhQ?=
 =?utf-8?B?dFozUE9pT2gxaFVqclB3OWpkZSt3VFQ1N3Nxb1l3WFdnOXNCMkNDZ0hGQzFj?=
 =?utf-8?B?aEFPMTRqK2Naek9zMlNXeWk4YVlUNHhUcjYvV2pUUWNIOEI0NWxVeFdXT3JU?=
 =?utf-8?B?dHRqci83cWxVRElXNFpLeGsxOUVGVEVPVFh3cG9aQ2ptcCtVc0FwTDk5VXo2?=
 =?utf-8?B?emdyTmxodjBNMUNlVnhCSGNhZm94LytsYnREK0g1N1hsdFZBR3lWcURYaVhI?=
 =?utf-8?B?RnhWQnV0VVFDR3kwZEpaRnd5MEVsc3FSQVJZbHV6OTM5VFZVNWVWTFZWWlBW?=
 =?utf-8?B?MjhKeVhLSVVoTitEVldZeStEMFFKUHZZK1cvdnRmZms2WW5ML1EvODFBazdF?=
 =?utf-8?B?OWdKYk5FVGp2Vy9xOU5jdVZOS0FPaVJoUUdmSTUyM0NlUHBMSzN3V1htRDI2?=
 =?utf-8?B?SUJuV05PUjBSS0hKb1UzZXM1WTVJOUVrZ0h3Y2RKdWdYOWtjcUZHVWxCR0Ez?=
 =?utf-8?B?c3IrQ1hMVndhS2c3dnVEZXpOYmNPZi9uN0QyT2lQekRuLy9ENVZvSSt0MXNT?=
 =?utf-8?B?TzliNWlGUmhzQTdoWHZibk9HL2hHdW80RGJxK3dxdWx5MWR6QUNRQnNwVnV2?=
 =?utf-8?B?WTRnUWlWT3M3WTBzVmd5WlBQbUxnWjI3V3h2QmpMWWhZZi9wZXJUS016ZlhM?=
 =?utf-8?B?WWRyME1WSldsNXdhQWJUM2x0UE85M2J2TmI0TWdkSFVPODVhQ25ESWQ0WUla?=
 =?utf-8?B?dThheER0bTEyN2srcS81M2NkVjRkZkxOOWtJN2prMm14Y0VXa0VQWG04RUhD?=
 =?utf-8?B?L0VEZ3FQanR3YS9TbnBMZW1mT0t4WFpWR2k1UTBVeHQvRmJyakZtK0pYUHpx?=
 =?utf-8?B?aWhJS2ZwMTUzbUJ1UGlDQkFBNCt6U3MwK0xCejRXZm1XNHdaTVA1VW1LYVVJ?=
 =?utf-8?B?dXBnOGJEQkxXeDBSUUU3VFkwQkY5em5nL251OGIvcHdwdWZlLzBxK1JkcGt4?=
 =?utf-8?B?Qk5iZFBETVV1OTlaYnVpc3kycld1RUlXdkRZTWFCNWl4YXZQdzJGRlNWS0d0?=
 =?utf-8?B?cUxodTIwSzVDbE05V04vN0ZCRE5ON2hyYVc3aHc4VlE3eWM1THVEY09DWmd6?=
 =?utf-8?B?aThtcVBoQjl5aEZ1dXBQdU0wVEYyQVh1SE5heXRCV0ZMcEFPTk0vOW9VU1pz?=
 =?utf-8?B?M1FzL3dTK3Y0dGhrMUZXMDUxa1lyUWNMZ0ZkZkt2OTBHRHpxVWJnNnh2UW1F?=
 =?utf-8?B?WGE3VTdRMWJ5cEk3T3RXeDU5MTBWZUJIcWhhcHZlSTRTeG9QdUd2cUNsUkdi?=
 =?utf-8?B?bm9kM0dDalV6Mml0R0hVMkNRSzh3bTFMOWcwTGluRnZVUG9RaG9QS1kxcEFr?=
 =?utf-8?B?SGJJU0F5dlo3MG5SYWJBS3hPMSsxN2JyWnpDa3k2S2lGQlhOQUw0eFlRZzVV?=
 =?utf-8?B?T2dxNVNUSnU2VWl3MkwzaFVZWGJEMTVlZkRTZW5JKzBLb1R5V2p3QnliV2Fo?=
 =?utf-8?B?amliSlpoeVVLd0xKUi91RVd6ZjRzbGNjQzBpdWRGenNQMHFRLzJRVUNwVFdJ?=
 =?utf-8?B?U1p1RGVldDVJN3RPVk03dGpMNzJ1eCs1RmI0cW4xUVFzODRWVFlhNGE1SG1N?=
 =?utf-8?B?UFJlTE9JOW5KcEp1SnNZUkJlQjAwd3IzaGk0ei92ODhYVTFsWUR2Yi9HU3Bs?=
 =?utf-8?B?M3NxSUk2eHJ4VGZjaURXQWZiKzlkSDFxdDErMVJhV0I5Z2lmU0tvbmVmS2Nl?=
 =?utf-8?B?eWJ3M1Y5bWVOL0dHT2RnZjJSOEF0Mnh0OGcwd1IxK3ZGOCtidW0zbWFYWWgw?=
 =?utf-8?B?RDV4WjFnVllEeGlRUlp0bDZoZU02MytFc0RhRURlS0c1aHlpMWVtY2dGa1RG?=
 =?utf-8?B?Yk44WUViZDh0NysxNTMwamF6RlZ1UXFEaDRQOGQzeXc4QURkUjFmWEFVbTFy?=
 =?utf-8?Q?2mSQKNlxN+zeRlls6ZFF0UA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13e8467c-5138-4218-b515-08d9a557b982
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2021 21:10:44.4984 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mlwOM4zdB1q9IkqQ8v3kOS2D/MrOt+Cp9JepSsceGRLO/LB0bygFofNlbgVxn2SFoFL285vcCr68v21T7UnPiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5475
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
Cc: "Shashank.Sharma@amd.com" <Shashank.Sharma@amd.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "sebastian@sebastianwick.net" <sebastian@sebastianwick.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2021-11-11 15:42, Shankar, Uma wrote:
> 
> 
>> -----Original Message-----
>> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>> Sent: Thursday, November 11, 2021 10:13 PM
>> To: Harry Wentland <harry.wentland@amd.com>
>> Cc: Shankar, Uma <uma.shankar@intel.com>; intel-gfx@lists.freedesktop.org; dri-
>> devel@lists.freedesktop.org; ppaalanen@gmail.com; brian.starkey@arm.com;
>> sebastian@sebastianwick.net; Shashank.Sharma@amd.com
>> Subject: Re: [RFC v2 05/22] drm/i915/xelpd: Define Degamma Lut range struct for
>> HDR planes
>>
>> On Thu, Nov 11, 2021 at 10:17:17AM -0500, Harry Wentland wrote:
>>>
>>>
>>> On 2021-09-06 17:38, Uma Shankar wrote:
>>>> Define the structure with XE_LPD degamma lut ranges. HDR and SDR
>>>> planes have different capabilities, implemented respective structure
>>>> for the HDR planes.
>>>>
>>>> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
>>>> ---
>>>>  drivers/gpu/drm/i915/display/intel_color.c | 52
>>>> ++++++++++++++++++++++
>>>>  1 file changed, 52 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/display/intel_color.c
>>>> b/drivers/gpu/drm/i915/display/intel_color.c
>>>> index afcb4bf3826c..6403bd74324b 100644
>>>> --- a/drivers/gpu/drm/i915/display/intel_color.c
>>>> +++ b/drivers/gpu/drm/i915/display/intel_color.c
>>>> @@ -2092,6 +2092,58 @@ static void icl_read_luts(struct intel_crtc_state
>> *crtc_state)
>>>>  	}
>>>>  }
>>>>
>>>> + /* FIXME input bpc? */
>>>> +__maybe_unused
>>>> +static const struct drm_color_lut_range d13_degamma_hdr[] = {
>>>> +	/* segment 1 */
>>>> +	{
>>>> +		.flags = (DRM_MODE_LUT_GAMMA |
>>>> +			  DRM_MODE_LUT_REFLECT_NEGATIVE |
>>>> +			  DRM_MODE_LUT_INTERPOLATE |
>>>> +			  DRM_MODE_LUT_NON_DECREASING),
>>>> +		.count = 128,
>>>> +		.input_bpc = 24, .output_bpc = 16,
>>>> +		.start = 0, .end = (1 << 24) - 1,
>>>> +		.min = 0, .max = (1 << 24) - 1,
>>>> +	},
>>>> +	/* segment 2 */
>>>> +	{
>>>> +		.flags = (DRM_MODE_LUT_GAMMA |
>>>> +			  DRM_MODE_LUT_REFLECT_NEGATIVE |
>>>> +			  DRM_MODE_LUT_INTERPOLATE |
>>>> +			  DRM_MODE_LUT_REUSE_LAST |
>>>> +			  DRM_MODE_LUT_NON_DECREASING),
>>>> +		.count = 1,
>>>> +		.input_bpc = 24, .output_bpc = 16,
>>>> +		.start = (1 << 24) - 1, .end = 1 << 24,
>>>> +		.min = 0, .max = (1 << 27) - 1,
>>>> +	},
>>>> +	/* Segment 3 */
>>>> +	{
>>>> +		.flags = (DRM_MODE_LUT_GAMMA |
>>>> +			  DRM_MODE_LUT_REFLECT_NEGATIVE |
>>>> +			  DRM_MODE_LUT_INTERPOLATE |
>>>> +			  DRM_MODE_LUT_REUSE_LAST |
>>>> +			  DRM_MODE_LUT_NON_DECREASING),
>>>> +		.count = 1,
>>>> +		.input_bpc = 24, .output_bpc = 16,
>>>> +		.start = 1 << 24, .end = 3 << 24,
>>>> +		.min = 0, .max = (1 << 27) - 1,
>>>> +	},
>>>> +	/* Segment 4 */
>>>> +	{
>>>> +		.flags = (DRM_MODE_LUT_GAMMA |
>>>> +			  DRM_MODE_LUT_REFLECT_NEGATIVE |
>>>> +			  DRM_MODE_LUT_INTERPOLATE |
>>>> +			  DRM_MODE_LUT_REUSE_LAST |
>>>> +			  DRM_MODE_LUT_NON_DECREASING),
>>>> +		.count = 1,
>>>> +		.input_bpc = 24, .output_bpc = 16,
>>>> +		.start = 3 << 24, .end = 7 << 24,
>>>> +		.min = 0, .max = (1 << 27) - 1,
>>>> +	},
>>>> +};
>>>
>>> If I understand this right, userspace would need this definition in
>>> order to populate the degamma blob. Should this sit in a UAPI header?
> 
> Hi Harry, Pekka and Ville,
> Sorry for being a bit late on the replies, got side tracked with various issues.
> I am back on this. Apologies for delay.
> 
>> My original idea (not sure it's fully realized in this series) is to have a new
>> GAMMA_MODE/etc. enum property on each crtc (or plane) for which each enum
>> value points to a kernel provided blob that contains one of these LUT descriptors.
>> Userspace can then query them dynamically and pick the best one for its current use
>> case.
> 
> We have this as part of the series Ville. Patch 3 of this series creates a DEGAMMA_MODE
> property just for this. With that userspace can just query the blob_id's and will get the
> various degamma mode possible and the respective segment and lut distributions.
> 
> This will be generic, so for userspace it should just be able to query this and parse and get
> the lut distribution and segment ranges.
> 

Thanks for the explanation.

Uma, have you had a chance to sketch some of this out in IGT? I'm trying
to see how userspace would do this in practice and will try to sketch an
IGT test for this myself, but if you have it already we could share the
effort.

>> The algorithm for choosing the best one might be something like:
>> - prefer LUT with bpc >= FB bpc, but perhaps not needlessly high bpc
>> - prefer interpolated vs. direct lookup based on current needs (eg. X
>>   could prefer direct lookup to get directcolor visuals).
>> - prefer one with extended range values if needed
>> - for HDR prefer smaller step size in dark tones,
>>   for SDR perhaps prefer a more uniform step size
>>
>> Or maybe we should include some kind of usage hints as well?
> 
> I think the segment range and distribution of lut should be enough for a userspace
> to pick the right ones, but we can add some examples in UAPI descriptions as hints.
> 

The range might be enough, but we're already parsing hints like "GAMMA"
or "DEGAMMA". I wonder if it would make sense to add a flag for "HDR" or
"SDR" as well.

>> And I was thinking of even adding a new property type (eg.
>> ENUM_BLOB) just for this sort of usecase. That could let us have a bit more generic
>> code to do all the validation around the property values and whatnot.
>>
>> The one nagging concern I really have with GAMMA_MODE is how a mix of old and
>> new userspace would work. Though that is more of a generic issue with any new
>> property really.
> 
> For plane properties getting added newly, old userspace will not get it so I think this should be ok.
> Newer userspace will implement this and get the new functionality.
> Problem will be in extending this to crtc where we have a legacy baggage, the client caps approach
> may help us there. Have it as part of separate series just to not mix it with this new plane stuff, though
> the idea remains same based on your design. Series below for reference:
> https://patchwork.freedesktop.org/series/90821/>> 

Could we just assume we do a uniform LUT if userspace doesn't
set a _MODE enum value for the respective gamma?

Maybe the _MODE should have a default enum value that means
a uniform (legacy) LUT.

Harry

> Regards,
> Uma Shankar
> 
>> --
>> Ville Syrjälä
>> Intel

