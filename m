Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47362A1AB98
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 21:52:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C69C10E8AA;
	Thu, 23 Jan 2025 20:52:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="QVvU4eBW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2083.outbound.protection.outlook.com [40.107.237.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CB9610E8C3;
 Thu, 23 Jan 2025 20:52:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g9Djh5aQZYzym+IaRcTctcdtlyNLXNdyevabPXG4J2uk1f1aW09vavvshS2iw8euNHc0z1puv4te3FHCX+vw9CJ+GF+7LmiUHiC3P26Zb7lq8VQOeVwu4HvUTtfD+N2crcLza+dUcCvxhZLLZ7xwE4sSOumpcUHbC1a7yFuhiSW5N78LAdvLWiLo0VZp7s6mydT19CFw20K3O/KUpyV4XkATu0E8n1+f4Dv1kKvb23MqyiSWUds0tyaRK/6cU9G9ZLuEBb48zDzCohO4Q5Fb7Hv02/F5860nFRHeBj8Njsdu9Uh8qy9NsZWFnhUQ2QHDhw0MQifdtfcPuGkOwAWdkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rjteE1qinSUS9GLRxgdeiG5MXWnAdfygB23e7wSvs8s=;
 b=nzLmPAhHzF6N0Vd1PKIbQI+PQBvbgEqeibPZcr1hdO4ZxFT5OL6wBBRYzvutDCxY+UQNC8vlas3u11IBkBvaH3MjofBMzfxzESabPBVLpXabDxFnMEj1Hg3DLoryb8YiIu5BPv5m2+CwNpI+aMLIPaRTGx9rQC1JaF8vHvEhXL4DzuCVF54NjfA9RCw5JPjKqI6tBm6xS/+/DHSmj+qJiUy0fesIEmVIp4p9kJ2Zgs5Fo1Ti4xqmaVWh5qJyEcjG6hiAtPIPqynL0PHJQ4uvld3ZVCCLhciY75hCMS05ULjDAiDGISKSJnARGyRy1bUPl4a7xYHb8NjHFWfqBJSlxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rjteE1qinSUS9GLRxgdeiG5MXWnAdfygB23e7wSvs8s=;
 b=QVvU4eBWgXWQ6EPZS4mPBr47XMiJSFGN7V06aKUDaBnxGev4KbBLTnz7QYFBBc+FVSUKO0WXXgUKGucw3BidGc9XpSU/uK9AKo97nMrWk1JBLMaaCtdm23RgrbDkZt4DaxSZKBznNu8g9aSmXifxaSpn6xhdZ2isOy7bmbmb67U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CYYPR12MB8732.namprd12.prod.outlook.com (2603:10b6:930:c8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Thu, 23 Jan
 2025 20:52:29 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%4]) with mapi id 15.20.8356.020; Thu, 23 Jan 2025
 20:52:28 +0000
Message-ID: <1d03eca9-8199-4d44-89d2-e168e272e9d7@amd.com>
Date: Thu, 23 Jan 2025 15:52:26 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [V7 43/45] drm/amd/display: Add AMD color pipeline doc
To: Pekka Paalanen <pekka.paalanen@haloniitty.fi>,
 Alex Hung <alex.hung@amd.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org
References: <20241220043410.416867-1-alex.hung@amd.com>
 <20241220043410.416867-44-alex.hung@amd.com>
 <20250117111952.66d09977@eldfell>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20250117111952.66d09977@eldfell>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4P288CA0048.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d3::25) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|CYYPR12MB8732:EE_
X-MS-Office365-Filtering-Correlation-Id: 90190d15-b1a3-4e89-da3c-08dd3befd946
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WEtVcnlCKzUrT3hMR0hPR3dVbXJzcmxheDRhaHJ5K0QrR3dSVHRXT3cwVXFl?=
 =?utf-8?B?dk95ZGtEd3l1d3cwWndEbnEvSWpEbFZ2V1p0bFFKS1FxYnBhSTRXQ0J4QVMw?=
 =?utf-8?B?SlgydHRtdVovRFRiSElSdW8rTFZyd3lZN3I0TzNrUFJkSExaQ0tZaHNzN2lJ?=
 =?utf-8?B?ZHlnSDZ6eGl6a3BqVmczZk4zTkxSazhKN2pLbzRQVFVVcXJVTDVyM3NXelVH?=
 =?utf-8?B?OU5ObVNXMGkxNy9GUTlSUHdCbXhaZGFHN0NZWGFWWU5IWFVlUDBKK2o1MXJL?=
 =?utf-8?B?ZFRQczY1amJ3OE4vb1BaT2orMHJQclB0M1UvNDRaOXBtZWVRZDhXd2pIRGxD?=
 =?utf-8?B?SUh5d2dOMjhBTVdpc2h1Si9hMWZXWmJZeFJTWjRoSTJUeTRRaDFNeU1yR3Fq?=
 =?utf-8?B?ZVR4MkJlWjdaKzU4eFBiN1FuazZObEhrelBhR2dCN20xMndaNWY5N0JPWVY2?=
 =?utf-8?B?cUhpdGRPN1JSZW9ML1VCQkZsaVNVTlUyWlhaUUpIQVRYRFdtMkp4YUVjc1NY?=
 =?utf-8?B?VktsMERxcDdRUmtjRHFXdnNGL3hJT1FobHZ4d3B2L0s5QWY4S1VMYWdTYnhm?=
 =?utf-8?B?T0Q5bzc5MFZQQld1d25WUUFlanBVWERwSE52SzNuTkx6Z3VjRzdUdmVydXpJ?=
 =?utf-8?B?NHpnSWgrZHByQUxBOUtucVNnckRlR2dUaHZFbElwdFVUK1ZuZlhWcDB6VUZo?=
 =?utf-8?B?SGR0T256b2UwZmhMN3pISWtKcFVNV0NCSm1sZ3YyT1VkZTB6eVh6akx2R3ND?=
 =?utf-8?B?MHNkOXcwNERQZUxacUFYb3NlS1pPNW1VYi9abzU1dzJhM3NpNk51RnlvVmRr?=
 =?utf-8?B?UDloZE9seWQvVkk1MzlRQmt1WVNjQlhIbzJsTEhFVkpDSHFkeGxKSUd6cHVy?=
 =?utf-8?B?OXdaMUhPVktRYWlrWVh3Q2JHK1N2bVc3cjFuQmVTSjh2TTRJSXE2S1liWDRW?=
 =?utf-8?B?U2RxMHBOWUFQYzg4b0R2QTlCbG9kMjY3UkREY3pYQjNrTDdGL3FlNEErNzlr?=
 =?utf-8?B?cUdIQ2ttVTVLb3JMWkY1QnZiQU9vN0FGUUp6UzlOMUNXRUp0ODUvN2puekRm?=
 =?utf-8?B?MTZRblIzZnFhN0RCR0RCbEdOZjhLRlBmdmxyNFhiLzhqUXpZRzFaNXdGWFhQ?=
 =?utf-8?B?MmRHblNBOWYwRjMvYk9yNWZtblpybEpqQ3NYTnBoa2Q2WHZ3ZzdQTXg5bG5T?=
 =?utf-8?B?U3hZUVhMQWZhVHhERzN2NFdoamEyK2gyNkN5YVl2eWRQSFlOenoxdTBDQWpu?=
 =?utf-8?B?YlRaSERFQzlNQ1FIWExzbktITG5jc2VJcFB6eWxkR1hqY1kvMFFXdDFMMjJF?=
 =?utf-8?B?ZFFHTkpaVHdLMkdDcW1iUlcxaUt2MEUxb3lLQWg0eTlNSWpUWUtDM3BoY3dl?=
 =?utf-8?B?V1dBOVFhWjhtYzA3c0NEWWY5Vkh2SUZxVXhiUUNUcUg3UlNtZWZ3MFRsNzFE?=
 =?utf-8?B?NlFQdW51ekwxQnJqSTJ1dm5kdHR3UjkwUHIvdlpGbmR0bi80cjRtVDE5d0hX?=
 =?utf-8?B?U01LcjhiTzNpc21YTXBCY3lXUHVwckVhQ3RiWHFWTEVoZ1BZNzJVcFlsdU9X?=
 =?utf-8?B?UmxvTDJCZDlJUS83MXI1S1l4QTBhdUc1S3k3Y0ZTOHR2MVVhUXFDR3pIYW9Z?=
 =?utf-8?B?aFZXUm0yUXhhRmp4MENHYkR1Nm5yZ3hRM0xaTlZlM2ZwZlFGRjV3Vk5PK1RI?=
 =?utf-8?B?S202WGRmY2oxcU1LNGZEM3hqUWdxMEo4Y29vRGVwQ1dBQVFseXFCZDJyR0tW?=
 =?utf-8?B?Y3FXNjJUd1lvY1h6MFNkcjArV1dTR1JITlU1WVNSU0pVWHBtMm5yT1dBK2hQ?=
 =?utf-8?B?OGIxVnBheEVIMjBPMzJLZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zysyc0w4WEJxZXE0c01UL3gvL1daaFFTU0hpRGRvdVB4SWp2VGVZbWpvQ2ZS?=
 =?utf-8?B?SS9FbmZYUWwybmtzYUJrQzBneDNxRXYvUFg3REJEZU91ME9YSisyMExZeEpr?=
 =?utf-8?B?Z2t3L2xuSFAyWUZia0RmZkdjK0duaVA5dFBpRjZ6amZDejExWXRtTkwzQWRk?=
 =?utf-8?B?ME9VTVB1TU95WjM5L2VyT2k0OU9tVlI3dTRJaFp3WStOZ1JHeVAzM0dzbFQx?=
 =?utf-8?B?aWRlVTJEUVpnM09lT2hPSHZ5UW5oME1jdHo0TUMyd0hnNDUyVTNMSUtZMlND?=
 =?utf-8?B?N1g4eFVSK1JodzBnYjZDc01weElDZXlwTTVtWTVkeFJXSE1PN3lGVDdGUm5l?=
 =?utf-8?B?c2xkcmo3MGVVVWdHOVM4M1IrZnUrUnAxdko1QlR5VzN6TnZzVkhaTUtlZWJY?=
 =?utf-8?B?Sm1CMDNWdEFEZVV2VG1jVDV1N01JZWVBR1VkdDNtNzRNdThDMVU3VzZ2K3pO?=
 =?utf-8?B?Z2JpK1NlUnJ1TkNVZjhXUmd3cHZGK0JPVU5OOWZsdjdlZngrMk41dGU3YlJi?=
 =?utf-8?B?SG84VFlwM2M1UlRnY0VrTWpGbFZTZ0pSQ1pxTXhmWHhWSXJrUURnMVB0K0JL?=
 =?utf-8?B?NE4ySHMzK2xzWTZ5TXhqNXp4VW1UdUh6TGVCbTdEb29HVzFQNTFEK1BTMGEz?=
 =?utf-8?B?SklJNWw3bEtOWUdYSnlyNzBiNTN4YUNqcmRYbjI5OUtGbVB6aUh3NFF3Mndm?=
 =?utf-8?B?N3JKOXhJbWRxQzRtUGNyZ0pXMEhudFpwMll2TURTdjlJZUFVNDYxOC9pcE15?=
 =?utf-8?B?M2ttckZwbVh1UGl4dHdMTzZjMVFoRGErYmJhMWl0YmVsR2c1MUNSV2N5Tnhz?=
 =?utf-8?B?eXZIeGpOK2dwbXhnUmxTaSt4TU9UZDFPVlpRb2RMUGd5VTNXMWJoRnBjSVVD?=
 =?utf-8?B?NVluMUVDSXpFaG1MM1lzaU9vZzZRSGhvQXVIR1plamNsbEhwaVUrV2paeStM?=
 =?utf-8?B?ME5PZlpHVGYwYzNaVFdYd2swejVVTmVWOEhXY1NYRFdBVE0rSUx2TDdKVnBy?=
 =?utf-8?B?T1pMM2ZMQk55SXBXV2xQOHd1ZEJZdW1FZWRHcjIzcnYxN3d3MXR3cUVFdzN4?=
 =?utf-8?B?czdlSndFTWRLK3pWaHRYNU9aZ2Z4OHJnUWJEa1Vnb3IrZnkzeEJHTUthbTNz?=
 =?utf-8?B?dFBwd3E0Q010UkVRemdlVkc1VmR1RkpSbVBRNkppVXRkSnBRNHZ5dWE5dEZK?=
 =?utf-8?B?MmV2blRuRlJ2OXdOL0pNRndnRTBGNFQwMkRTV1ZZM3dqWWhZVnRmekg2UDkz?=
 =?utf-8?B?ZmllUEIxdmhET3o4UjBYM1lZNzc3REwwZjJ2RjlNeUlPM1Y3U0xXR2JIN2tC?=
 =?utf-8?B?NGE1VzlzNGRPYVgxaG1IZ3Z6alV6bGhqMng4ek8wSjV3QVRTc0dHQUEzdHhZ?=
 =?utf-8?B?WnRlTHJkbnNJanZoRXh2MFBlSTI1bGdDQ0pTRnFoQ1pLYVNoZmpNa1pEcHFR?=
 =?utf-8?B?UGpDYlVsck9jVjRKNkhpcWE3S0xLT3hKVG1lMkh5T3JCN0RvRE9pZW9EbU1C?=
 =?utf-8?B?RWR2Y0V0WWJlS214VStWMUtua3dRVjdJTTJhZWFsZE12UmlFU1J6WDFmQ0Np?=
 =?utf-8?B?UHFXeEx2SUcrRXRQU1JnRHpkQzRtMUM5UEpjTGNnRUl5U0hMdmU1elFFZXo0?=
 =?utf-8?B?alVmMVR0Y2l1b09mT1krcFRHVjI0VXV1L0Uyb1JjREVQQnJhajhrZ3BsQU5x?=
 =?utf-8?B?UzR3SmZremFQQ2NOanExNFNxZ0l5VDZDTkt4T0hQVWI2MlA5VGlNUHpBcy9z?=
 =?utf-8?B?M0owM28zWjEwbVlSMSthVEpyNkVCRmtqWnFqZW56T1gzZEsyR1VBd3VoM2JH?=
 =?utf-8?B?d0FhQmhHMTYyT3d5WWFEM0lyeWxLUGR6a2U1TEZaQ25yVzRyLyswSmdYOGsr?=
 =?utf-8?B?dElEUWw1bUs3U0ZKNkIybmU3eVEzVVorU1dxbnZMRnArT0tMQlhyWTYzcTB4?=
 =?utf-8?B?RmVIK283NW1mUVVQUXpCaHVVWU5EcFJoV0FSL3JZRzVZaGx3Tnk0d25Db1p3?=
 =?utf-8?B?ZGZsVEV4WmxtZGkzRWowOVB0V1pRVUlBN2NMeVdqM0hWMmJXZklCUUUvU3gw?=
 =?utf-8?B?N3I2a2dmYTFEbENOdjhla056a3J5K3d2eXFVZ0RQdGlmaVErVnhTVE83bGQ1?=
 =?utf-8?Q?3gW9Km4fBhWTPbBQEp7+5NyhI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90190d15-b1a3-4e89-da3c-08dd3befd946
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 20:52:28.6918 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VXXWSQgbRnoXpM47Ki+BKbniL5M84et1tJq6sPLjCXFVC7OddxvIPXHBwII1QnbYh7vwREwnVdgurct1A2vD1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8732
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



On 2025-01-17 04:19, Pekka Paalanen wrote:
> On Thu, 19 Dec 2024 21:33:49 -0700
> Alex Hung <alex.hung@amd.com> wrote:
> 
>> From: Harry Wentland <harry.wentland@amd.com>
>>
>> Add kernel doc for AMD color pipeline.
>>
>> Signed-off-by: Alex Hung <alex.hung@amd.com>
>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
>> ---
>>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 122 +++++++++++++++---
>>  1 file changed, 102 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
>> index 5e8c5c0657c4..56fb0870a2fc 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> 
> ...
> 
>> + * AMD plane color pipeline
>> + * ------------------------
>> + *
>> + * The AMD &drm_plane color pipeline is advertised for DCN generations
>> + * 3.0 and newer. It exposes these elements in this order:
>> + *
>> + * 1. 1D curve colorop
>> + * 2. Multiplier
>> + * 3. 3x4 CTM
>> + * 4. 1D curve colorop
>> + * 5. 1D LUT
>> + * 6. 3D LUT
>> + * 7. 1D curve colorop
>> + * 8. 1D LUT
>> + *
>> + * The multiplier (#2) is a simple multiplier that is applied to all
>> + * channels.
>> + *
>> + * The 3x4 CTM (#3) is a simple 3x4 matrix.
> 
> Hi,
> 
> I'm curious of why does the multiplier exist? Under what conditions is
> it not feasible to precompute the multiplier into the CTM coefficients
> and must instead be programmed as a separate colorop?
> 

AMD HW only supports S2.13 and S3.13 for the CTM coefficients [1] and
our driver only ever picks S2.13. The multiplier is programmed as a
floating point value instead.

[1] https://gitlab.freedesktop.org/agd5f/linux/-/blob/amd-staging-drm-next/drivers/gpu/drm/amd/display/dc/dc_hw_types.h#L1089

Harry

> 
> Thanks,
> pq
> 
>>   *
>> - * The pipe blending also happens after these blocks so we don't actually
>> - * support any CRTC props with correct blending with multiple planes - but we
>> - * can still support CRTC color management properties in DM in most single
>> - * plane cases correctly with clever management of the DC interface in DM.
>> + * #1, and #7 are non-linear to linear curves. #4 is a linear to
>> + * non-linear curve. They support sRGB, PQ, and BT.709/BT.2020 EOTFs or
>> + * their inverse.
>>   *
>> - * As per DRM documentation, blocks should be in hardware bypass when their
>> - * respective property is set to NULL. A linear DGM/RGM LUT should also
>> - * considered as putting the respective block into bypass mode.
>> + * The 1D LUTs (#5 and #8) are plain 4096 entry LUTs.
>>   *
>> - * This means that the following
>> - * configuration is assumed to be the default:
>> + * The 3DLUT (#6) is a tetrahedrally interpolated 17 cube LUT.
>>   *
>> - * Plane DGM Bypass -> Plane CTM Bypass -> Plane RGM Bypass -> ...
>> - * CRTC DGM Bypass -> CRTC CTM Bypass -> CRTC RGM Bypass
>>   */
>>  
>>  #define MAX_DRM_LUT_VALUE 0xFFFF
> 

