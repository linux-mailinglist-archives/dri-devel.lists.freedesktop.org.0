Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBVMDGgFfWmpPwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 20:24:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70389BE15D
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 20:24:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEE6C10E36C;
	Fri, 30 Jan 2026 19:24:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zYY3tlx+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012017.outbound.protection.outlook.com [52.101.48.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6CC210E36C
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 19:24:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NgNGilLrBCrEY9PqWbQAEj7E5thOWKITC54X3UyvPlRrIRVDNYphogFD0P32zPCBnbnsmwywIRpC6hhZMLihzqomPdbDAqA8KxzylSY2ImvWBZvnt1Ene0wgBxDVZdwWEieL9iwe1gnEJstJiILp3WfP8dN1bBAeVGWAWnxSqUEY03PbZLcl7URCHGtGb8h3vJsDs3C4zLQUNlwXoKAE4PXYozgFo+BqOQcIonYdydcGj1NSlz/kbVTem1V4GFHBaX2vc+1QKzfZAhBD6BZrgefU7vALlQea9i4qS7SX8EJ0FcdwFsvTtWTcTEaisX6zVe1kmynSeqHtzYpM7Pacaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=195uK1JLvwVYuCXzlvnXz6ydy83ImGbMRUTKVd7ZFNI=;
 b=bsz3he87S13x69rFu9cN6MRnmhzJrjuh4T1chi7vhevfLdHDlMsk9gca+60vLzcDlzqDKjzFP79esZL75146uKkNh0l6I+FYxM6L7M6OoBXOjz0jalZj+19J7pHvT+51l+20dry4IrdCOm4k9lhk9fCKbx+DCuGETlWhplTNJdKOoJG3IBWCSC6P02QmEWYtHqSnGHMwnkL1y4/b4vc84NTWTmn0Gvzl9a+VRpWj6u3WquXNSz1mvfm1NaCY8BQAvo6l4J8X0LuNMIaxao3BUh6n8bGVec9rIR45DvbTnNDLQW24qFBI9dqcoDeupHMdG/NPr0T9BJ8TIYVOIomu+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=195uK1JLvwVYuCXzlvnXz6ydy83ImGbMRUTKVd7ZFNI=;
 b=zYY3tlx+SbPCKZoQHs1HZ1H3EzsLutdeIhipHEUIz04EMOpcj10JqvbSajEN+OwX/Pv4+P+rJife4hUa3HVWFXRav5A6xl10M9fFej8ZWCEgBUI2HulTE/hHovH3IT/US+SQ7quQNj9ZHjmONVZzPjLCvEqMpGKNgO6pLDR1bEA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MN0PR12MB6176.namprd12.prod.outlook.com (2603:10b6:208:3c3::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Fri, 30 Jan
 2026 19:24:17 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce%4]) with mapi id 15.20.9564.006; Fri, 30 Jan 2026
 19:24:17 +0000
Message-ID: <9eef4eb7-3fcc-411b-ba80-838926006e9d@amd.com>
Date: Fri, 30 Jan 2026 13:24:14 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] accel/amdxdna: Stop job scheduling across
 aie2_release_resource()
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org,
 maciej.falkowski@linux.intel.com
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com
References: <20260130003255.2083255-1-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260130003255.2083255-1-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0053.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2d0::27) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|MN0PR12MB6176:EE_
X-MS-Office365-Filtering-Correlation-Id: b0f78868-d70a-4bec-5500-08de6035291e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VGp3TkxpVnZKUk5abmNjZ09vRmtOVGgwK2FGUHJBSWVMRTJ4ZHBrUGJGempm?=
 =?utf-8?B?SVp4WXVHMjRXMFFWNE9BWlJrY2pqUVNOeWhCZEJDMzJlOHdBWlVNTWNyUXdG?=
 =?utf-8?B?TzF3eWo4K25GNjkrS0NTTy82RmZmZytjQ0htQ0FmdUVoOGVuUmJyMldoSElL?=
 =?utf-8?B?VWVKUlVubXBOOXFtaGlad1UyZ04wUlIrL0NYeFlUSDBkNVhZWUpxV3VRdTd6?=
 =?utf-8?B?Rk9ZSWtERWJ0Lzk0L2RwYVlzNGVLdW5lN1ZFelBvV1hCVCtLRldSTXNIY1hF?=
 =?utf-8?B?NFZLN25CeVNuWTJReUlnVnZHdC95M0YrWEtTSnh1M2JYaXlmR1dPQnp6bkNG?=
 =?utf-8?B?VWxxOWRkQk40UWtBbEVIN1FwRDNYcE5HNDgvY01TTVJUNmpJZ2NDUnRZNmJ2?=
 =?utf-8?B?TlQzVnVCcDUrTXIyVU5JYUgzbFR0WmlqcDhudkVWRmFwNUtXWjJiQUtOQ2Uv?=
 =?utf-8?B?SnAvREl4ZkVXUTJKb3BiaFVmcWw0U1ZCMFdGRnJoTEN4c3g2d0tjNjdyeDZn?=
 =?utf-8?B?QTQ4SUFLRkxEWXFYWm1XQ3ZQUDFsQ2pEZWs5NUszWFNvbmVlUmgzd2NMSG02?=
 =?utf-8?B?eHlSclc0N2l6N2tiQWR2RHpLQjQyVzVQR2FCZzlEOUEvTm5XV25sZVpCWFYv?=
 =?utf-8?B?VElaNXlHSkJybVlHOHVNTkJIQVcvbEkyYzhNVUJIM29KOUU3QmRUSHJoeHJm?=
 =?utf-8?B?MkNFSmNXcHBMMzBvNlhGbWY0eEJnVVV1QnJUWWQ3Ri9MNjFKVHJ0NUlPYlV6?=
 =?utf-8?B?aFI0L1ZlMzBOWG9oUmJHYU1xUTdNa092VjBkQXpVYkZYTzBGZElFM0swWm1w?=
 =?utf-8?B?SDV6RXd3NDYrM3NKR2EvUnprNlJxb1ZIMkdLbTBzY29MVDhYT0N3ajNWdE1M?=
 =?utf-8?B?TWVxdWowMTlIMG9oU1lXYjJxeVJlZHpJNHNPbDBSbUZST2ZLcllqTEFTdnlq?=
 =?utf-8?B?OTgyQSttT1FzZ0lzaW5qbG9NS213dFZwU3hPOGpkRG0vVEtWVE5uM24yckhN?=
 =?utf-8?B?YVZ1ZVB6MldpZ3QvTFIzbjVja05TQk5CWUpoeEsvL0FyTUV6dHVObWtHcG9U?=
 =?utf-8?B?cHpzRW1DNWo4UHBVUFJXdGR4a3EzdTZaY3U2cDNHdUVwWTFDQXJtSEdLbFlW?=
 =?utf-8?B?bTBDWlF5Y1pNZlpIT0N4Z3JLUWNxUlhuaks5L3pUMm9XRlYzaW55VDg4NE9T?=
 =?utf-8?B?MGdnSWs4TTN3c2dBc2w3clBiKzZuVDBMTXlpUmhxd3F2RjZhQkhYdG54ZHJH?=
 =?utf-8?B?K0VHbVZJanl6d3U0dEhUUGdqRDJmMDdvZ2Flbzc1cVFVK2hiQVN0alVUcGh4?=
 =?utf-8?B?cHFXeVk2WVU3d2g1cHpZWUw3dTBKdjJoYk15WGUwSXdOY1RpQWFYbjhmRkhZ?=
 =?utf-8?B?NnNqQXU0Y0NKVS9sVVZpZHRIQkQ4UG40Nk1XUjB2c2hnd2Q5MTZrMnh3bndu?=
 =?utf-8?B?MWZuaUs5WlBsQTV4Umt5TklHZFlpYk0rNlVKRmRPKy9ZZVdGc3ZKK2JjMHFR?=
 =?utf-8?B?b21ldFpWWXpjdlptVFJxdU43ZUZQUFNEZFhObWFDZGRwYnZUUWJZWlZlbHVw?=
 =?utf-8?B?Q1lZNlhKRCt4QU1kNFJYT00rZU42VDc0L0UxalI2cXlZSGM2UEZUMGF3MFA3?=
 =?utf-8?B?MFVKVmZoSzNKZ3ovV1Z4Ynd5Y2pRT1N0REM4VnNaRkh3QkpjUlUvZFltbDdy?=
 =?utf-8?B?NmRiMUpjMWpHcWhBaDFZMzA0MHkreDFmYmhqYWQ3QTBjZkpHbGdVZ2hta1NR?=
 =?utf-8?B?RXliRGFBS3BBSmRaUjVjbkxPUHJCd2FlMHkvS21QNUxqcWlBQVpHVDJsR1Vh?=
 =?utf-8?B?LzVjeVk3dkxpam9wV2QzUk52QllUeEtPa29VdVpoSCtIbWV5NzF1Y3JRL2h6?=
 =?utf-8?B?elV2b1piL3N2Q1VpYXgxZnB4OVdrSk9IcHNkdUtoOExlbFpJcVUyRU9lbysr?=
 =?utf-8?B?djNDQ3VDTk8rcHZzMzB3OWRZaDNENFJ1NWtzY2FTRDRSNG9WUWkwYjZydXhU?=
 =?utf-8?B?S0FId2xIZFhrYVhZTTVWWndRQ0xTVFdSVkw0UzJrNm9GNklTaWlsM25TSDBG?=
 =?utf-8?B?WVkycXd5US95djV2eHlyVjRFTHdKa2ZXSEkzelZLNEI3c0FtS3NJRHBMa25s?=
 =?utf-8?Q?3nI0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wm9zaHIvcVNnazJVZUVUZEpJaWcxNWJUbklpclk1Y3lCc2FxV3daZ21jcUtt?=
 =?utf-8?B?SHF1amwwc0M3ck9iWUVWS3YxSXNTZHFrcUFXNzRMOUhIeE9sS2NkYStiVStl?=
 =?utf-8?B?cCtVK2NhZDVGRHZSVlRWQnpjMUw1Q0N3R0UxRXlabm90S2xsclJCUTdPdTRM?=
 =?utf-8?B?SEhHbXpUV01iNGE3LzFQdGx1bmxkaUJVS1RBb0xIWkg4dTFrQWlUZnliSzJW?=
 =?utf-8?B?b1dlcVJUOVBxVWRGNXpoejRaQlVLVkxTTnVzY1orbHdJR0JhY3pUSHRERWxy?=
 =?utf-8?B?UHJHT1pYZ0NDUTl3QVNZbUNmdU9rNXkwZm1MYzdsZ2ppcmpCNTd0cVZMZmE1?=
 =?utf-8?B?dmN2UWpQQTFuVVd1bVlvMDNnS1l0b1RnbWR3V2F5ZEdWNDBKUjVmY2JJejlU?=
 =?utf-8?B?QTU5Rmc2WktGRUxScTdMaElOVGFlT0kxVTlleDgvV3IxSWlBRHRMNm5NRTRD?=
 =?utf-8?B?bEtZcUxnRXFzSzRZb0FZNGx6bWQwYUV4cDlhN2NiTldyMUMwcndtaTk4bFJi?=
 =?utf-8?B?L1d3bkxwaTF6emo1ZUl1dlM2NGt3bmltaUttRGllaEhEdE5sSFM2R2VRUkww?=
 =?utf-8?B?SzRTemF4WFBUeTF3bTBTWmg0MHBqYTFlU24zRmN6TC9VTC9yMjhtK1pCemM4?=
 =?utf-8?B?M1I0SnJWYnhKQ1RrRUNINVBISXNvS1NXNHA5dVdVYjB4NXRpZnVKK295alB2?=
 =?utf-8?B?T2VxanFoakpZdmozYTd1VTdLeVU0dlp4ZG5VckszRGN6TGF3bzZubFVXNVQ2?=
 =?utf-8?B?RXJYdXE4aTdjOVBhU21Gcld6RFVwU3NTZ29yVEtxMVZvZC9Jank0U0tVY0ZK?=
 =?utf-8?B?TlJMY0szcklzVkJteUQ3MlJYVnVQZENtTmVETHVHVUFFTDBIY0ZpcGdyOWJL?=
 =?utf-8?B?L0hQT0RhMldqZkFrSHV4QUQ3MVVyUkhDZmNQSFR3WFhyamlDNVNFUFpobXZi?=
 =?utf-8?B?dFpxUnFXRUFEVGZJa1YwRVZZOC9maEFkODY2UEJ4UkdoTGxVR2YzRFRtdVIv?=
 =?utf-8?B?bUp6M3FtYjdFY0hxK0pwa2dlalZ3S1JLYWZ1RFk2OHJNNnZCSk92aHFhOG1R?=
 =?utf-8?B?a2o5ek5WSHBWVXpEa1I3Mmh4cEt0Wk5UK3FzOUdKT3lNUlhaUmU2alBnMkV2?=
 =?utf-8?B?NWl4VmxTOFVneGZoUGNxZW1ZclJmWXM2TGJsVGg0Y0VQbnZpb3AwSWtrb2hm?=
 =?utf-8?B?dkxmM25qelphcWR0Z1E4bk1ieFBNQ3Y4Z1lVWlI0a0ZxRGIvd2Q3WGoyWCs5?=
 =?utf-8?B?biswN0s0YVN1QkUzL0NjRlF5djVTZkNQaW52bVRidFY2MzBYOC9QczJyV1NW?=
 =?utf-8?B?THI2a2NoUHFZU2RnUjJ4VTdtWWFoQ3k4ZEhmVWlaODJaOHhrVG1ZekVGamkw?=
 =?utf-8?B?VTdDSEtPeXZINGUxeldlOXBiUTRSKzgxS0dNeEFhVU5sS2VCcWg1RHJIWVM1?=
 =?utf-8?B?YVFxZjlqN2xCbmF1Z2pzaTloUGR2dmRTcEZ4OXNNN210S3liTmxzdVpucU8r?=
 =?utf-8?B?RVJ4YjRWOHNnZWFpWkczcVNXL2tZNEl2amIxNnp3MkhxSm5icnhmcUJYcEZw?=
 =?utf-8?B?NERzTjNPNVJGSWczU0FRdGRMUFRRQmNzWlM5NlBWeDY3U2xlNFByZktvSS82?=
 =?utf-8?B?T0Y4U2JGeC9xUlg5VmI4aXFXeXRITVllU2svVGF4UE1LYzBKWVRuYmpIKzJm?=
 =?utf-8?B?ZFJ6Y1hxSTBjcWxZN0pQMmdvYlFYNUpPUDdOVmx1d3VhS0lOSFM4aThCSVVi?=
 =?utf-8?B?d0poVkR2RFo0OTA5YjhWSVMvYWhMQmtGVThWNkJIVUlSVVdDQXpjdk5sNmR5?=
 =?utf-8?B?MkFnV0VqRTViUTlhMGMrN0RTRlNnR2hKS09Zamh1OFdhSklYU3ZWV0E2Wktr?=
 =?utf-8?B?cEdBeldkbjgyRDFvYndkQTdwbmRTc3pNTDZ1czZvTE1Ja3EyRjVoQXpnSWlH?=
 =?utf-8?B?b0ZZaSt3ODRRbjk2dGcxNWFScDNFY1FyNzJaeG1oZ1k4TEtYTGVkVGdINDFt?=
 =?utf-8?B?bnN6Ym03bG5CUkIzQm9DcDFoTFc4SWxhUllDNUpwckxPNnZkbmViTnRkZmdk?=
 =?utf-8?B?MzJBWGJscWZiWjd2Mktsd2hSNzJBNVY1SVV2Mi9JNFFqK2ZTNVgySG12QTBh?=
 =?utf-8?B?cGhLeWZEWUtFaEowblRWRHZDb21aVlVueHNnZ0FyTUQ2WktUNTlGZ3pvSnpW?=
 =?utf-8?B?SXNnOW01c2lMZUdxM0xsMVRnSEJuMjVXMVlMSGNSeld3WEhwZ1IvTFBYZjQz?=
 =?utf-8?B?T00vZXU2VXlEWkhBdHorbkdzTXF4NUltTWRTVVdjTW45TzB4Vi9QOW5ERng0?=
 =?utf-8?B?TEdRL3AzcFpiK01pUDdmUStnUTArZUJtc3FPVVFkekJZNTN2Z09Bdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0f78868-d70a-4bec-5500-08de6035291e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 19:24:17.4164 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7zkTSSShLXGsPcipsWQZneFV1RPFA9NuSlDtv79Bfgcq9LKR4W08MgQchMSSGxCpukht3x3DJRhH34jyG2Oo+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6176
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lizhi.hou@amd.com,m:ogabbay@kernel.org,m:quic_jhugo@quicinc.com,m:maciej.falkowski@linux.intel.com,m:linux-kernel@vger.kernel.org,m:max.zhen@amd.com,m:sonal.santan@amd.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mario.limonciello@amd.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mario.limonciello@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 70389BE15D
X-Rspamd-Action: no action

On 1/29/26 6:32 PM, Lizhi Hou wrote:
> Running jobs on a hardware context while it is in the process of
> releasing resources can lead to use-after-free and crashes.
> 
> Fix this by stopping job scheduling before calling
> aie2_release_resource() and restarting it after the release completes.
> Additionally, aie2_sched_job_run() now checks whether the hardware
> context is still active.
> 
> Fixes: 4fd6ca90fc7f ("accel/amdxdna: Refactor hardware context destroy routine")
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> ---
>   drivers/accel/amdxdna/aie2_ctx.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
> index 5511ab2ef242..c4a58c00e442 100644
> --- a/drivers/accel/amdxdna/aie2_ctx.c
> +++ b/drivers/accel/amdxdna/aie2_ctx.c
> @@ -315,6 +315,9 @@ aie2_sched_job_run(struct drm_sched_job *sched_job)
>   	struct dma_fence *fence;
>   	int ret;
>   
> +	if (hwctx->status != HWCTX_STAT_READY)
> +		return NULL;
> +
>   	if (!mmget_not_zero(job->mm))
>   		return ERR_PTR(-ESRCH);
>   
> @@ -705,7 +708,10 @@ void aie2_hwctx_fini(struct amdxdna_hwctx *hwctx)
>   	aie2_hwctx_wait_for_idle(hwctx);
>   
>   	/* Request fw to destroy hwctx and cancel the rest pending requests */
> +	drm_sched_stop(&hwctx->priv->sched, NULL);
>   	aie2_release_resource(hwctx);
> +	hwctx->status = HWCTX_STAT_STOP;
> +	drm_sched_start(&hwctx->priv->sched, 0);
>   
>   	mutex_unlock(&xdna->dev_lock);
>   	drm_sched_entity_destroy(&hwctx->priv->entity);

