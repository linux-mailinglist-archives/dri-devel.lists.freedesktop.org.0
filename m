Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMXjCEa3d2nKkQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 19:49:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 733B38C35A
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 19:49:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD4DE10E247;
	Mon, 26 Jan 2026 18:49:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="oJubfraf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011055.outbound.protection.outlook.com
 [40.93.194.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE88E10E247
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 18:49:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CQbeqdtCzYUgIy/4bs4jKgBCioe3liOviefXppGA5M0/5Hsj/E9S170CJfxf3DWbBMCybz44bqNSps8qDS6R8aeSrkeOJ8GRv/zo/63OOSlTjad+o4s5iIk9gC15w1hll1/+OtrTmOcJQPN/EJ1/J/oNC19cbJ28yRi2B049atI4v3X19S7jR8+ufoZff2ZPCZb5RZBUbBgN6ZT13U1ehpdNIx3Q9DPxOQ//vSw3HA7PqYAyXESytOeQun/CaCgpasXDxitm2LOpQWjWh5KupJ7KlbTawdUAv3AZYfKJu9hIQy6o83axb/khQLPNamO1snlpbMVjkygWd0B3p04Z8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JS9/p4mkbUKBScJtLlYp+Kwg/6Ti8ISGjI34hFUPs68=;
 b=tGRu3r5X4qYCFB64yNmXuf+mKs7JBMRBca5/GWCS0qH6NXyWAT/3QLuJZiSJmSx+ts+gSMQHd63TgVF+JwTKgAS+32vs4Ag1TMAAS3vpqf69v6MUlmbviAtVn1cpun6r1dWxR2+Uw1TUPKWo8azFz6Sk1wfXHZ2AhUDRCFFtJUHrCS2D/pTkSgBL06FOEo/nfrFE+SmO69KQqmjdBYf6zZ7srzf2+mIXHAeu8Qi8QPTqOSWor+YFeyBGYZva3aJVlVoQ59+VPQgsY7rbYvWwBZ7qtGA00Nwcbx4U2x+4ZJZouQxrs8h7QvFi9owc8yDLep6FYsVwuwE+SQ+8WVvtZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JS9/p4mkbUKBScJtLlYp+Kwg/6Ti8ISGjI34hFUPs68=;
 b=oJubfrafy2XS24oy1mNzbYeUfFYwgXUHFv5fW9+gqGLAKyf1UgPBJIrGi+sAoNoD0TsWQyjWf+AjwGHF/3S864BIstBJHe8sB1Gc2Eqe7LB3rmBXlXd3hUd9zI34TOpENI2K/sWbI4lXiQ82DGYy1wEAcb2srM0e28Xj8ogJNUs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MN6PR12MB8567.namprd12.prod.outlook.com (2603:10b6:208:478::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Mon, 26 Jan
 2026 18:49:34 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce%4]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 18:49:34 +0000
Message-ID: <de37cf64-219d-45e0-ba5d-82472dad0eae@amd.com>
Date: Mon, 26 Jan 2026 12:49:32 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] accel/amdxdna: Allow forcing IOVA-based DMA via module
 parameter
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org,
 maciej.falkowski@linux.intel.com
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com
References: <20260123212734.948505-1-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260123212734.948505-1-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7P222CA0007.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::17) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|MN6PR12MB8567:EE_
X-MS-Office365-Filtering-Correlation-Id: 37fae1ec-c981-47b5-1cdb-08de5d0ba5cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dDhMRkxkbUlXWXo5OVczN1Vpa05TU1JGbDR6VFFjQXRmQ1pQYzlpa3p0aTlM?=
 =?utf-8?B?c2QzbmlvdzBnMzJOTWkzOUhzZ1lUVFBmMnp2WXVTK1NjY29Ra25oeU12OUcz?=
 =?utf-8?B?clZHUGk3KzVEUDhYYkcwajdHTFZ0ZHVlRG0rK3NxNWpQZkYxREFrOHJvcEd1?=
 =?utf-8?B?NTFPeGJ1ekw4ejZrdXg2OExDcXgzVlFZRXpvMFdRM0tNMjFaWjFYYUxOZHNp?=
 =?utf-8?B?dUZuZHFicjN2SmJEaGdtcW83dEtNQkxUTW1qUDRjUTJwWGlPeGRMcTVnMStO?=
 =?utf-8?B?dHQyYXdqMXR3UEtVdzRoTE5tWWxwZzBGbzd6OVE1U3JvRDdxSEpHQ29tZG5z?=
 =?utf-8?B?R3Z3bFZvaGlVSXROcDBYaGNQVVBiamYrNTZvYjNCV3k5c3U1R0l6cFd0UU96?=
 =?utf-8?B?RWtJNUpheUtCRzhickpjMGQ4ZFJaTjRIaE9SWGVkMnB2dVU5ZmlyRkFockJP?=
 =?utf-8?B?eEw0Sitjc0lyY3dvSjFZQXpxNGgvc1RIKzFKMkYvUGcrN0IwS3U0cmo3Vmgy?=
 =?utf-8?B?NTRNUnhQSExEd0hPYjFVTWJpb2xLNzJmdWJSNUJrNTFicjBFYmxDV08rUjVw?=
 =?utf-8?B?VzFCK0Fvc2ozUGVkUy81ZFZ1ZC9lY2FreUt6eFBYK1NCaGNUWkQvK1hOcy9U?=
 =?utf-8?B?cVMvME9hdzcybSszdUE1Ylp3TkhDTGpVRDI5U0NKWVZiRVVMWUhvVmI2NVBV?=
 =?utf-8?B?amx1dVBqRGk0eE9GMjIrSU9iT1dZRTB4U1AxY2l5bzJTSHI2NXVadjZ0akcz?=
 =?utf-8?B?YlRPM2ZLckZmVzhhTE12QzUyQmFLV1NRajRPRXgzSEFhUDFBT2swRXo5V0p6?=
 =?utf-8?B?WHBtNStWc3lwcHNKdE00NUJYNWYwaEtlSVcweTVuTy8vTHV6OFNva3BWZ3Mv?=
 =?utf-8?B?akFqR3oyZVJGVTJhWi9PU3k4VFdnK1Q5RDlMNkpHaHV1OG5WUmN1SmpnMWdP?=
 =?utf-8?B?VFQ3Y0hsdzZZNzF3MzZEU3V3MDFFRDFwQVBod1JJMm1kL0RnemQwZk1FMFVU?=
 =?utf-8?B?Z3BlTllVWW84RzViN0JDd25iVE1IZGVDMzdpamVFK2FMbm9xNkh5OUt6Um5Y?=
 =?utf-8?B?Tlo4VDVIQnd4WmtqREwrNlVTenNzZ1RHRGd6SXo1aFp3c0VqQUE3MEJjb3U5?=
 =?utf-8?B?VDhGYndQaTU5QXNtSFBnOTk5b1RhUHpZRXFFQVBXcmdxUStFdC9aOGhDbzVr?=
 =?utf-8?B?YW9EVEEvSDJFd0FybjRBTGZPUnhYRGFSYVpsa0xLU1VIRkZQQWZJUVRibTFF?=
 =?utf-8?B?aHVFWVIvTHBPdFcxM2Q4SHdKY2tGS0Y5Vjk1K0hPS0pPRDRubzdKRlVJOTF5?=
 =?utf-8?B?OFFQR3k4SDhaMGJkalVmOVVSNnpwVjN3djM5V0hXZHMxcnVQUEJqYUpzY1VF?=
 =?utf-8?B?T3RFamNEV21Pd0o5WitjbVpNbUVpU3cvQkZQS2xqZWxVTDZCTlhFS1R2Mmxl?=
 =?utf-8?B?ZjJWOFFFL0haUVJYcHYxKzhKUDVuTXJielVuMjBIQzRGejZkV1hESzdCTnFz?=
 =?utf-8?B?bFpNQXlLRkpxL2phOGFBWmlhNkY2TWZ2R3VqNmF1YitObm52dVZiL0d3NDRN?=
 =?utf-8?B?cDlqbzJtOWh1bnArNndRYnkrdmg0VjNWSFl6Nm9TSlR1Q2d3Z0VrR29sOGJt?=
 =?utf-8?B?MWNUTmJEbUpnSXZMRXFrY1gyYUQvUmFHMFpRandTR1daQmlDWHhiQWRwZ3JN?=
 =?utf-8?B?TkZzNDhSVHJ4Wmx4bnFLbEpnS0k2eHpIeXhNaFJqNXRodHA5cTYreUYrMVFW?=
 =?utf-8?B?aEhZZ05NOEFoa2UrQ1BuMmE4ZHIrY3lReTBhY0Q5bUZ4OTRYTy9Dc0tYM01M?=
 =?utf-8?B?T3Y2SnlmbHEyeVRCRjBBSC9SbGFWa21DN1RnOTVKNTcyb3RMR3YyVXd0SVdR?=
 =?utf-8?B?Q1dIQVp6N0ZDam5PTWZuYTRWOSsyQVhnQlRmUU5rdWtaa2krTmdSMWZzY1Np?=
 =?utf-8?B?enF1WVdYOE1YWVVwQ0lIZUNNK1dPUHlOdVYrZ2NlS0JKbitydS9uSmVkbksw?=
 =?utf-8?B?MElMcEhsREJja2ljekdnTlJaQTYzOVdnM05uMTB3dENXcFhVYi9OWHA1RXRJ?=
 =?utf-8?B?RGhkTjJRUDR4cm0wTm1LZkxES29sS1c0Mmljd0pxcGdYKzZpa0gyNHFOV0g5?=
 =?utf-8?Q?Vh6Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFB1UXpZNDJ2L1ppRkNtR21KazVwSTRYa3JrNFFmaVQwZzVadWRoS25oMEtK?=
 =?utf-8?B?TDJjL0RMNVBFaERPNSthd3dCb1lxaDRlQ3ZHY3A5Y3RrNHJGaVhOUldUeGtm?=
 =?utf-8?B?dHM0aEt2US9helRlMDI0UmN0YUFLejVRaEUwamhOa0V2SW9tNDhnQktTU2RP?=
 =?utf-8?B?REpWQVd3Qy92MEdGNUtNWnFsSm1XQ25mUzgrSmRKRG1Sa1ZLWTlDZVJrRE1L?=
 =?utf-8?B?Ukk2YWFBdjAyV1VrTjh1aWlpYmlCUWdxYXJXU3ZZN1YyQzAzQTlJREI5U2xw?=
 =?utf-8?B?NHBSRWd3N2lPdVRnd0d0TVlsTU1Rc2RyMUlkV2lzVkxwcDRpL3RTM0J3ZnAw?=
 =?utf-8?B?SUJEUHl1RGVPSGN3NGVLbzR4ODRXYzRTRVoycWtFa1N6TUM5NkZDWVhqRjJB?=
 =?utf-8?B?YUNDemFTYUdlTlUvRDVwZlVvUlVtaEYzOU01eTZiNHN3NlBCSDFnWmFOcFU2?=
 =?utf-8?B?MHZWMkFJSHRwNUttcW54OGpOU0lVdVVlVVdPY1prNDVZZWdmM0gzK09qdVlG?=
 =?utf-8?B?bmFocG93RjA0di93VFFsV2x3djBoRTRndUpWQ1lOVXIzN1kzemtjbGZIT08x?=
 =?utf-8?B?bEZ0anRDbW5qZ1VKRTN4RkNmM0Q0ZDlkTDQ2MytVd2lYdmZFNW1sWmVsUTdL?=
 =?utf-8?B?c2p6cC9ZbVUxckROaDlOQ21ZYXFVeGJsQlJISUpRdTA4RDJxSmhqZDZZTTZn?=
 =?utf-8?B?R2NTcHNTdm5mbGZERjAwbW1vbUR5azJWblI4Uy9DMmpMUTBGVGN3b2dScHE1?=
 =?utf-8?B?eUVwcHhiU0ZzR2ZqRDg2eEpuQnpndHRYQldDRnVVN1R5MEoyY2RUYmliQ3NK?=
 =?utf-8?B?aFY2Z1JFN3REK29DenlnMVhieGtKL2g3QjZwSTFFcG0xL1JRem5OSVRFR2Nr?=
 =?utf-8?B?WTM3bDJqVnozOHlSRDU4TGQ2RU91aGxRRDJnaHA4QW54MkQwWEI5RW9QK1kw?=
 =?utf-8?B?eWdUQWozWU9NTDBUK1VNVUpzUzJ0NDZoTVhycUdISTVsMFJER1lvM0JiZ3dX?=
 =?utf-8?B?YWJBM2lrYmpnZXp4M3hRd0xNaUhzdnBxSTRUSysvQ1RjdER1S1pYaXdMNTZ5?=
 =?utf-8?B?aU54NkZHZVMwc1VHaFBQWjhzR0x0NGxlNnpPU3U1bWRMVk1kTVlsTUVJdFRB?=
 =?utf-8?B?dlR0N2R4MDJjTDhNTkc0anpjNHVvenBRNWJrYU91RE4rdjIwUkgyeEpZVVBm?=
 =?utf-8?B?ZjBjOTlkaitsMEM5dEpHd2lpRVV0Y3l4a1B6NTk2MEVZMG1XOHRCTm9aRmto?=
 =?utf-8?B?Qm12TzVwREhNL0lnakFGNDA4Qlg1STJ4OEpmSC94d3ZPOHo0QzV1THhJa2NF?=
 =?utf-8?B?TkUyNkNWTksyUENROEo1SGZmY1YxaWtablB3RW5YbnRpUStjbDlNdU1qRGpW?=
 =?utf-8?B?aXBCMGV4a2ZCeFJqT24xMGMwY0xXb1dub09wMzBzemRHaFZTRytBMWRmYkdO?=
 =?utf-8?B?Tm4yMm1JbnVEZTVMQ21kdXh1QXJSVnBOS3o3K1V1UFVCUVlxalBLbHpDenJm?=
 =?utf-8?B?NytMNVpEc2RLK2ZydWhsbUFPNVpSbEhVeHBPSHJsSjBVbXJwSmpWdWJ3cDI4?=
 =?utf-8?B?TDJiam51d3lCeXlJcEtMU3N5UHd2bkF3aFBFY3lLNWk0TVgrcklRN2dmeU5z?=
 =?utf-8?B?OFA4YXlqSzRWYm1VeXFNS0lOQVJvUGc0M0lnaDNSbnAzd2xvSGx4WHVIMnNw?=
 =?utf-8?B?SVdocVVudEI5c3BvWWV5aU9wSW5ud2JjUUU2WVU3Z3NWdDc2QTZvc2NsQmRL?=
 =?utf-8?B?b2k5UktVMERCYXRncGNDTVNWVmc0ZWlwR2Z3WUN3U3lEMmczK2ZUNXZDWDdX?=
 =?utf-8?B?WkEyM2pMTElGRmxtcm9tZnhucm94OTRrMUlvQkNJczd5MlZUQkdudWdTTURL?=
 =?utf-8?B?T2NiRWhNbW1HajM1UitWZGxwTklxZzZKRC9lYUFyd2w5S012cFFpNzNEV2Rm?=
 =?utf-8?B?ZloyNmszSDc1RHRocXZLWk81MXg0bFlVZ2FzOVRZUUEyUGRRMjdZZEdDaENj?=
 =?utf-8?B?K1ROd0hEeG1tZG9EOWFISytxaUJqVkowSUVTb042ZDNoYU0xQ2FFMFZGWE5X?=
 =?utf-8?B?ZjVHM3dGcy9qUlpsT1VCQkw5dk5KenJ4K3BsbUE1SEVYTVpLUC80U1JlNkhv?=
 =?utf-8?B?T25kWkVSc0JmL0FrYzlmdlpWWVhkcVRBWWRLQjkvaWhleS9VZTFYVmdOcXFG?=
 =?utf-8?B?Z1hsZGxYc0JzeW5yL2x4bSsyL21EYTZ5WFFZK3E5VTUrTUV4NHFub3JTM0U0?=
 =?utf-8?B?d2c1YTJVV3RGRHJ6blBZUWxPaytlTHZMQ3kzMzhUYWx0dGtlQit6ZS9QaTFi?=
 =?utf-8?B?SkdHNjBEYjBaUDFxVHZKT2YxZXdkL1FhWFo5SGd3MVFzMmRGTDNoUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37fae1ec-c981-47b5-1cdb-08de5d0ba5cd
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 18:49:34.3679 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XsjqzigtHTgyF14SerZvN7Oqdi+8nyJn6UYBEHFxx+Fi5kysfuN+M5G2ydLtr/0x8XrEGKxSPHki7Mk5umFDeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8567
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
X-Rspamd-Queue-Id: 733B38C35A
X-Rspamd-Action: no action



On 1/23/2026 3:27 PM, Lizhi Hou wrote:
> The amdxdna driver normally performs DMA using userspace virtual address
> plus PASID. For debugging and validation purposes, add a module parameter,
> force_iova, to force DMA to go through IOMMU IOVA mapping.
> 
> When force_iova=1 is set, the driver will allocate and map DMA buffers
> using IOVA.

Do you perhaps want to put a warning in the logs that this has been set? 
  Otherwise it might not be obvious someone did it when debugging an 
issue and reviewing their logs.

> 
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> ---
>   drivers/accel/amdxdna/Makefile          |   1 +
>   drivers/accel/amdxdna/aie2_ctx.c        |   6 +-
>   drivers/accel/amdxdna/aie2_error.c      |   5 +-
>   drivers/accel/amdxdna/aie2_message.c    |  30 +++-
>   drivers/accel/amdxdna/aie2_pci.h        |   5 +-
>   drivers/accel/amdxdna/amdxdna_gem.c     |  44 +++++-
>   drivers/accel/amdxdna/amdxdna_gem.h     |  11 ++
>   drivers/accel/amdxdna/amdxdna_iommu.c   | 183 ++++++++++++++++++++++++
>   drivers/accel/amdxdna/amdxdna_pci_drv.c |  47 +++---
>   drivers/accel/amdxdna/amdxdna_pci_drv.h |  24 ++++
>   10 files changed, 324 insertions(+), 32 deletions(-)
>   create mode 100644 drivers/accel/amdxdna/amdxdna_iommu.c
> 
> diff --git a/drivers/accel/amdxdna/Makefile b/drivers/accel/amdxdna/Makefile
> index 3fa0e74fd8f5..cf9bf19dedb9 100644
> --- a/drivers/accel/amdxdna/Makefile
> +++ b/drivers/accel/amdxdna/Makefile
> @@ -11,6 +11,7 @@ amdxdna-y := \
>   	aie2_solver.o \
>   	amdxdna_ctx.o \
>   	amdxdna_gem.o \
> +	amdxdna_iommu.o \
>   	amdxdna_mailbox.o \
>   	amdxdna_mailbox_helper.o \
>   	amdxdna_pci_drv.o \
> diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
> index 5511ab2ef242..3c1173eca43a 100644
> --- a/drivers/accel/amdxdna/aie2_ctx.c
> +++ b/drivers/accel/amdxdna/aie2_ctx.c
> @@ -78,7 +78,8 @@ static int aie2_hwctx_restart(struct amdxdna_dev *xdna, struct amdxdna_hwctx *hw
>   	}
>   
>   	ret = aie2_map_host_buf(xdna->dev_handle, hwctx->fw_ctx_id,
> -				heap->mem.userptr, heap->mem.size);
> +				amdxdna_obj_dma_addr(hwctx->client, heap),
> +				heap->mem.size);
>   	if (ret) {
>   		XDNA_ERR(xdna, "Map host buf failed, ret %d", ret);
>   		goto out;
> @@ -650,7 +651,8 @@ int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
>   	}
>   
>   	ret = aie2_map_host_buf(xdna->dev_handle, hwctx->fw_ctx_id,
> -				heap->mem.userptr, heap->mem.size);
> +				amdxdna_obj_dma_addr(hwctx->client, heap),
> +				heap->mem.size);
>   	if (ret) {
>   		XDNA_ERR(xdna, "Map host buffer failed, ret %d", ret);
>   		goto release_resource;
> diff --git a/drivers/accel/amdxdna/aie2_error.c b/drivers/accel/amdxdna/aie2_error.c
> index 5e82df2b7cf6..2966b7e34a96 100644
> --- a/drivers/accel/amdxdna/aie2_error.c
> +++ b/drivers/accel/amdxdna/aie2_error.c
> @@ -355,9 +355,8 @@ int aie2_error_async_events_alloc(struct amdxdna_dev_hdl *ndev)
>   		return -ENOMEM;
>   
>   	events->buf = aie2_alloc_msg_buffer(ndev, &total_size, &events->addr);
> -
> -	if (!events->buf) {
> -		ret = -ENOMEM;
> +	if (IS_ERR(events->buf)) {
> +		ret = PTR_ERR(events->buf);
>   		goto free_events;
>   	}
>   	events->size = total_size;
> diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
> index 99215328505e..a590b3ed4d80 100644
> --- a/drivers/accel/amdxdna/aie2_message.c
> +++ b/drivers/accel/amdxdna/aie2_message.c
> @@ -64,11 +64,27 @@ void *aie2_alloc_msg_buffer(struct amdxdna_dev_hdl *ndev, u32 *size,
>   	*size = max(*size, SZ_8K);
>   	order = get_order(*size);
>   	if (order > MAX_PAGE_ORDER)
> -		return NULL;
> +		return ERR_PTR(-EINVAL);
>   	*size = PAGE_SIZE << order;
>   
> +	if (amdxdna_iova_on(xdna))
> +		return amdxdna_iommu_alloc(xdna, *size, dma_addr);
> +
>   	return dma_alloc_noncoherent(xdna->ddev.dev, *size, dma_addr,
> -				     DMA_FROM_DEVICE, GFP_KERNEL);
> +				      DMA_FROM_DEVICE, GFP_KERNEL);
> +}
> +
> +void aie2_free_msg_buffer(struct amdxdna_dev_hdl *ndev, size_t size,
> +			  void *cpu_addr, dma_addr_t dma_addr)
> +{
> +	struct amdxdna_dev *xdna = ndev->xdna;
> +
> +	if (amdxdna_iova_on(xdna)) {
> +		amdxdna_iommu_free(xdna, size, cpu_addr, dma_addr);
> +		return;
> +	}
> +
> +	dma_free_noncoherent(xdna->ddev.dev, size, cpu_addr, dma_addr, DMA_FROM_DEVICE);
>   }
>   
>   int aie2_suspend_fw(struct amdxdna_dev_hdl *ndev)
> @@ -257,7 +273,7 @@ int aie2_create_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwct
>   	req.num_col = hwctx->num_col;
>   	req.num_unused_col = hwctx->num_unused_col;
>   	req.num_cq_pairs_requested = 1;
> -	req.pasid = hwctx->client->pasid;
> +	req.pasid = amdxdna_pasid_on(hwctx->client) ? hwctx->client->pasid : 0;
>   	req.context_priority = aie2_get_context_priority(ndev, hwctx);
>   
>   	ret = aie2_send_mgmt_msg_wait(ndev, &msg);
> @@ -369,8 +385,8 @@ int aie2_query_status(struct amdxdna_dev_hdl *ndev, char __user *buf,
>   	int ret;
>   
>   	buff_addr = aie2_alloc_msg_buffer(ndev, &buf_sz, &dma_addr);
> -	if (!buff_addr)
> -		return -ENOMEM;
> +	if (IS_ERR(buff_addr))
> +		return PTR_ERR(buff_addr);
>   
>   	/* Go through each hardware context and mark the AIE columns that are active */
>   	list_for_each_entry(client, &xdna->client_list, node)
> @@ -425,8 +441,8 @@ int aie2_query_telemetry(struct amdxdna_dev_hdl *ndev,
>   		return -EINVAL;
>   
>   	addr = aie2_alloc_msg_buffer(ndev, &buf_sz, &dma_addr);
> -	if (!addr)
> -		return -ENOMEM;
> +	if (IS_ERR(addr))
> +		return PTR_ERR(addr);
>   
>   	req.buf_addr = dma_addr;
>   	req.buf_size = buf_sz;
> diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
> index b20a3661078c..18c252690d9c 100644
> --- a/drivers/accel/amdxdna/aie2_pci.h
> +++ b/drivers/accel/amdxdna/aie2_pci.h
> @@ -337,9 +337,8 @@ int aie2_config_debug_bo(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *
>   			 int (*notify_cb)(void *, void __iomem *, size_t));
>   void *aie2_alloc_msg_buffer(struct amdxdna_dev_hdl *ndev, u32 *size,
>   			    dma_addr_t *dma_addr);
> -#define aie2_free_msg_buffer(ndev, size, buff_addr, dma_addr)		\
> -	dma_free_noncoherent((ndev)->xdna->ddev.dev, size, buff_addr,	\
> -			     dma_addr, DMA_FROM_DEVICE)
> +void aie2_free_msg_buffer(struct amdxdna_dev_hdl *ndev, size_t size,
> +			  void *cpu_addr, dma_addr_t dma_addr);
>   
>   /* aie2_hwctx.c */
>   int aie2_hwctx_init(struct amdxdna_hwctx *hwctx);
> diff --git a/drivers/accel/amdxdna/amdxdna_gem.c b/drivers/accel/amdxdna/amdxdna_gem.c
> index dfa916eeb2d9..dfc9c2d593d4 100644
> --- a/drivers/accel/amdxdna/amdxdna_gem.c
> +++ b/drivers/accel/amdxdna/amdxdna_gem.c
> @@ -237,6 +237,7 @@ static int amdxdna_hmm_register(struct amdxdna_gem_obj *abo,
>   
>   	if (abo->mem.userptr == AMDXDNA_INVALID_ADDR)
>   		abo->mem.userptr = addr;
> +
>   	INIT_WORK(&mapp->hmm_unreg_work, amdxdna_hmm_unreg_work);
>   	if (is_import_bo(abo) && vma->vm_file && vma->vm_file->f_mapping)
>   		mapping_set_unevictable(vma->vm_file->f_mapping);
> @@ -477,12 +478,48 @@ static void amdxdna_gem_obj_free(struct drm_gem_object *gobj)
>   	drm_gem_shmem_free(&abo->base);
>   }
>   
> +static int amdxdna_gem_obj_open(struct drm_gem_object *gobj, struct drm_file *filp)
> +{
> +	struct amdxdna_dev *xdna = to_xdna_dev(gobj->dev);
> +	struct amdxdna_gem_obj *abo = to_xdna_obj(gobj);
> +	int ret;
> +
> +	if (abo->ref) {
> +		abo->ref++;
> +		return 0;
> +	}
> +
> +	if (amdxdna_iova_on(xdna)) {
> +		ret = amdxdna_iommu_map_bo(xdna, abo);
> +		if (ret)
> +			return ret;
> +	}
> +	abo->ref++;
> +
> +	return 0;
> +}
> +
> +static void amdxdna_gem_obj_close(struct drm_gem_object *gobj, struct drm_file *filp)
> +{
> +	struct amdxdna_dev *xdna = to_xdna_dev(gobj->dev);
> +	struct amdxdna_gem_obj *abo = to_xdna_obj(gobj);
> +
> +	abo->ref--;
> +	if (abo->ref)
> +		return;
> +
> +	if (amdxdna_iova_on(xdna))
> +		amdxdna_iommu_unmap_bo(xdna, abo);
> +}
> +
>   static const struct drm_gem_object_funcs amdxdna_gem_dev_obj_funcs = {
>   	.free = amdxdna_gem_dev_obj_free,
>   };
>   
>   static const struct drm_gem_object_funcs amdxdna_gem_shmem_funcs = {
>   	.free = amdxdna_gem_obj_free,
> +	.open = amdxdna_gem_obj_open,
> +	.close = amdxdna_gem_obj_close,
>   	.print_info = drm_gem_shmem_object_print_info,
>   	.pin = drm_gem_shmem_object_pin,
>   	.unpin = drm_gem_shmem_object_unpin,
> @@ -509,6 +546,7 @@ amdxdna_gem_create_obj(struct drm_device *dev, size_t size)
>   
>   	abo->mem.userptr = AMDXDNA_INVALID_ADDR;
>   	abo->mem.dev_addr = AMDXDNA_INVALID_ADDR;
> +	abo->mem.dma_addr = AMDXDNA_INVALID_ADDR;
>   	abo->mem.size = size;
>   	INIT_LIST_HEAD(&abo->mem.umap_list);
>   
> @@ -624,6 +662,7 @@ amdxdna_gem_prime_import(struct drm_device *dev, struct dma_buf *dma_buf)
>   	abo = to_xdna_obj(gobj);
>   	abo->attach = attach;
>   	abo->dma_buf = dma_buf;
> +	abo->type = AMDXDNA_BO_SHMEM;
>   
>   	return gobj;
>   
> @@ -906,7 +945,10 @@ int amdxdna_drm_get_bo_info_ioctl(struct drm_device *dev, void *data, struct drm
>   
>   	abo = to_xdna_obj(gobj);
>   	args->vaddr = abo->mem.userptr;
> -	args->xdna_addr = abo->mem.dev_addr;
> +	if (abo->mem.dev_addr != AMDXDNA_INVALID_ADDR)
> +		args->xdna_addr = abo->mem.dev_addr;
> +	else
> +		args->xdna_addr = abo->mem.dma_addr;
>   
>   	if (abo->type != AMDXDNA_BO_DEV)
>   		args->map_offset = drm_vma_node_offset_addr(&gobj->vma_node);
> diff --git a/drivers/accel/amdxdna/amdxdna_gem.h b/drivers/accel/amdxdna/amdxdna_gem.h
> index f79fc7f3c93b..01a03cab382b 100644
> --- a/drivers/accel/amdxdna/amdxdna_gem.h
> +++ b/drivers/accel/amdxdna/amdxdna_gem.h
> @@ -6,7 +6,9 @@
>   #ifndef _AMDXDNA_GEM_H_
>   #define _AMDXDNA_GEM_H_
>   
> +#include <drm/drm_gem_shmem_helper.h>
>   #include <linux/hmm.h>
> +#include <linux/iova.h>
>   #include "amdxdna_pci_drv.h"
>   
>   struct amdxdna_umap {
> @@ -25,6 +27,7 @@ struct amdxdna_mem {
>   	u64				userptr;
>   	void				*kva;
>   	u64				dev_addr;
> +	u64				dma_addr;
>   	size_t				size;
>   	struct page			**pages;
>   	u32				nr_pages;
> @@ -46,6 +49,8 @@ struct amdxdna_gem_obj {
>   	u32				assigned_hwctx;
>   	struct dma_buf			*dma_buf;
>   	struct dma_buf_attachment	*attach;
> +
> +	u32				ref;
>   };
>   
>   #define to_gobj(obj)    (&(obj)->base.base)
> @@ -68,6 +73,12 @@ static inline u64 amdxdna_dev_bo_offset(struct amdxdna_gem_obj *abo)
>   	return abo->mem.dev_addr - abo->client->dev_heap->mem.dev_addr;
>   }
>   
> +static inline u64 amdxdna_obj_dma_addr(struct amdxdna_client *client,
> +				       struct amdxdna_gem_obj *abo)
> +{
> +	return amdxdna_pasid_on(client) ? abo->mem.userptr : abo->mem.dma_addr;
> +}
> +
>   void amdxdna_umap_put(struct amdxdna_umap *mapp);
>   
>   struct drm_gem_object *
> diff --git a/drivers/accel/amdxdna/amdxdna_iommu.c b/drivers/accel/amdxdna/amdxdna_iommu.c
> new file mode 100644
> index 000000000000..f9b1d6522b82
> --- /dev/null
> +++ b/drivers/accel/amdxdna/amdxdna_iommu.c
> @@ -0,0 +1,183 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2025, Advanced Micro Devices, Inc.
> + */
> +
> +#include <drm/amdxdna_accel.h>
> +#include <linux/iommu.h>
> +#include <linux/iova.h>
> +
> +#include "amdxdna_gem.h"
> +#include "amdxdna_pci_drv.h"
> +
> +static bool force_iova;
> +module_param(force_iova, bool, 0600);
> +MODULE_PARM_DESC(force_iova, "Force use IOVA (Default false)");
> +
> +static struct iova *amdxdna_iommu_alloc_iova(struct amdxdna_dev *xdna,
> +					     size_t size,
> +					     dma_addr_t *dma_addr,
> +					     bool size_aligned)
> +{
> +	unsigned long shift, end;
> +	struct iova *iova;
> +
> +	end = xdna->domain->geometry.aperture_end;
> +	shift = iova_shift(&xdna->iovad);
> +	size = iova_align(&xdna->iovad, size);
> +
> +	iova = alloc_iova(&xdna->iovad, size >> shift, end >> shift, size_aligned);
> +	if (!iova)
> +		return ERR_PTR(-ENOMEM);
> +
> +	*dma_addr = iova_dma_addr(&xdna->iovad, iova);
> +
> +	return iova;
> +}
> +
> +int amdxdna_iommu_map_bo(struct amdxdna_dev *xdna, struct amdxdna_gem_obj *abo)
> +{
> +	struct sg_table *sgt;
> +	dma_addr_t dma_addr;
> +	struct iova *iova;
> +	size_t size;
> +
> +	if (abo->type != AMDXDNA_BO_DEV_HEAP && abo->type != AMDXDNA_BO_SHMEM)
> +		return 0;
> +
> +	sgt = drm_gem_shmem_get_pages_sgt(&abo->base);
> +	if (IS_ERR(sgt)) {
> +		XDNA_ERR(xdna, "Get sgt failed, ret %ld", PTR_ERR(sgt));
> +		return PTR_ERR(sgt);
> +	}
> +
> +	if (!sgt->orig_nents || !sg_page(sgt->sgl)) {
> +		XDNA_ERR(xdna, "sgl is zero length or not page backed");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	iova = amdxdna_iommu_alloc_iova(xdna, abo->mem.size, &dma_addr,
> +					(abo->type == AMDXDNA_BO_DEV_HEAP));
> +	if (IS_ERR(iova)) {
> +		XDNA_ERR(xdna, "Alloc iova failed, ret %ld", PTR_ERR(iova));
> +		return PTR_ERR(iova);
> +	}
> +
> +	size = iommu_map_sgtable(xdna->domain, dma_addr, sgt,
> +				 IOMMU_READ | IOMMU_WRITE);
> +	if (size < abo->mem.size) {
> +		__free_iova(&xdna->iovad, iova);
> +		return -ENXIO;
> +	}
> +
> +	abo->mem.dma_addr = dma_addr;
> +
> +	return 0;
> +}
> +
> +void amdxdna_iommu_unmap_bo(struct amdxdna_dev *xdna, struct amdxdna_gem_obj *abo)
> +{
> +	size_t size;
> +
> +	if (abo->mem.dma_addr == AMDXDNA_INVALID_ADDR)
> +		return;
> +
> +	size = iova_align(&xdna->iovad, abo->mem.size);
> +	iommu_unmap(xdna->domain, abo->mem.dma_addr, size);
> +	free_iova(&xdna->iovad, iova_pfn(&xdna->iovad, abo->mem.dma_addr));
> +	abo->mem.dma_addr = AMDXDNA_INVALID_ADDR;
> +}
> +
> +void *amdxdna_iommu_alloc(struct amdxdna_dev *xdna, size_t size, dma_addr_t *dma_addr)
> +{
> +	struct iova *iova;
> +	void *cpu_addr;
> +	int ret;
> +
> +	iova = amdxdna_iommu_alloc_iova(xdna, size, dma_addr, true);
> +	if (IS_ERR(iova)) {
> +		XDNA_ERR(xdna, "Alloc iova failed, ret %ld", PTR_ERR(iova));
> +		return iova;
> +	}
> +
> +	cpu_addr = (void *)__get_free_pages(GFP_KERNEL, get_order(size));
> +	if (!cpu_addr) {
> +		ret = -ENOMEM;
> +		goto free_iova;
> +	}
> +
> +	ret = iommu_map(xdna->domain, *dma_addr, virt_to_phys(cpu_addr),
> +			iova_align(&xdna->iovad, size),
> +			IOMMU_READ | IOMMU_WRITE, GFP_KERNEL);
> +	if (ret)
> +		goto free_iova;
> +
> +	return cpu_addr;
> +
> +free_iova:
> +	__free_iova(&xdna->iovad, iova);
> +	return ERR_PTR(ret);
> +}
> +
> +void amdxdna_iommu_free(struct amdxdna_dev *xdna, size_t size,
> +			void *cpu_addr, dma_addr_t dma_addr)
> +{
> +	iommu_unmap(xdna->domain, dma_addr, iova_align(&xdna->iovad, size));
> +	free_iova(&xdna->iovad, iova_pfn(&xdna->iovad, dma_addr));
> +	free_pages((unsigned long)cpu_addr, get_order(size));
> +}
> +
> +int amdxdna_iommu_init(struct amdxdna_dev *xdna)
> +{
> +	unsigned long order;
> +	int ret;
> +
> +	xdna->group = iommu_group_get(xdna->ddev.dev);
> +	if (!xdna->group || !force_iova)
> +		return 0;
> +
> +	xdna->domain = iommu_paging_domain_alloc_flags(xdna->ddev.dev,
> +						       IOMMU_HWPT_ALLOC_PASID);
> +	if (IS_ERR(xdna->domain)) {
> +		XDNA_ERR(xdna, "Failed to alloc iommu domain");
> +		ret = PTR_ERR(xdna->domain);
> +		goto put_group;
> +	}
> +
> +	ret = iova_cache_get();
> +	if (ret)
> +		goto free_domain;
> +
> +	order = __ffs(xdna->domain->pgsize_bitmap);
> +	init_iova_domain(&xdna->iovad, 1UL << order, 0);
> +
> +	ret = iommu_attach_group(xdna->domain, xdna->group);
> +	if (ret)
> +		goto put_iova;
> +
> +	return 0;
> +
> +put_iova:
> +	put_iova_domain(&xdna->iovad);
> +	iova_cache_put();
> +free_domain:
> +	iommu_domain_free(xdna->domain);
> +put_group:
> +	iommu_group_put(xdna->group);
> +	xdna->domain = NULL;
> +
> +	return ret;
> +}
> +
> +void amdxdna_iommu_fini(struct amdxdna_dev *xdna)
> +{
> +	if (xdna->domain) {
> +		iommu_detach_group(xdna->domain, xdna->group);
> +		put_iova_domain(&xdna->iovad);
> +		iova_cache_put();
> +		iommu_domain_free(xdna->domain);
> +	}
> +
> +	if (xdna->group)
> +		iommu_group_put(xdna->group);
> +}
> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
> index 45f5c12fc67f..ed5fe643293d 100644
> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
> @@ -69,18 +69,21 @@ static int amdxdna_drm_open(struct drm_device *ddev, struct drm_file *filp)
>   
>   	client->pid = pid_nr(rcu_access_pointer(filp->pid));
>   	client->xdna = xdna;
> -
> -	client->sva = iommu_sva_bind_device(xdna->ddev.dev, current->mm);
> -	if (IS_ERR(client->sva)) {
> -		ret = PTR_ERR(client->sva);
> -		XDNA_ERR(xdna, "SVA bind device failed, ret %d", ret);
> -		goto failed;
> -	}
> -	client->pasid = iommu_sva_get_pasid(client->sva);
> -	if (client->pasid == IOMMU_PASID_INVALID) {
> -		XDNA_ERR(xdna, "SVA get pasid failed");
> -		ret = -ENODEV;
> -		goto unbind_sva;
> +	client->pasid = IOMMU_PASID_INVALID;
> +
> +	if (!amdxdna_iova_on(xdna)) {
> +		client->sva = iommu_sva_bind_device(xdna->ddev.dev, current->mm);
> +		if (IS_ERR(client->sva)) {
> +			ret = PTR_ERR(client->sva);
> +			XDNA_ERR(xdna, "SVA bind device failed, ret %d", ret);
> +			goto failed;
> +		}
> +		client->pasid = iommu_sva_get_pasid(client->sva);
> +		if (client->pasid == IOMMU_PASID_INVALID) {
> +			XDNA_ERR(xdna, "SVA get pasid failed");
> +			ret = -ENODEV;
> +			goto unbind_sva;
> +		}
>   	}
>   	init_srcu_struct(&client->hwctx_srcu);
>   	xa_init_flags(&client->hwctx_xa, XA_FLAGS_ALLOC);
> @@ -97,7 +100,8 @@ static int amdxdna_drm_open(struct drm_device *ddev, struct drm_file *filp)
>   	return 0;
>   
>   unbind_sva:
> -	iommu_sva_unbind_device(client->sva);
> +	if (!IS_ERR_OR_NULL(client->sva))
> +		iommu_sva_unbind_device(client->sva);
>   failed:
>   	kfree(client);
>   
> @@ -115,7 +119,8 @@ static void amdxdna_client_cleanup(struct amdxdna_client *client)
>   	if (client->dev_heap)
>   		drm_gem_object_put(to_gobj(client->dev_heap));
>   
> -	iommu_sva_unbind_device(client->sva);
> +	if (!IS_ERR_OR_NULL(client->sva))
> +		iommu_sva_unbind_device(client->sva);
>   
>   	kfree(client);
>   }
> @@ -275,9 +280,15 @@ static int amdxdna_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>   		fs_reclaim_release(GFP_KERNEL);
>   	}
>   
> +	ret = amdxdna_iommu_init(xdna);
> +	if (ret)
> +		return ret;
> +
>   	xdna->notifier_wq = alloc_ordered_workqueue("notifier_wq", WQ_MEM_RECLAIM);
> -	if (!xdna->notifier_wq)
> -		return -ENOMEM;
> +	if (!xdna->notifier_wq) {
> +		ret = -ENOMEM;
> +		goto iommu_fini;
> +	}
>   
>   	mutex_lock(&xdna->dev_lock);
>   	ret = xdna->dev_info->ops->init(xdna);
> @@ -309,6 +320,8 @@ static int amdxdna_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>   	mutex_unlock(&xdna->dev_lock);
>   destroy_notifier_wq:
>   	destroy_workqueue(xdna->notifier_wq);
> +iommu_fini:
> +	amdxdna_iommu_fini(xdna);
>   	return ret;
>   }
>   
> @@ -334,6 +347,8 @@ static void amdxdna_remove(struct pci_dev *pdev)
>   
>   	xdna->dev_info->ops->fini(xdna);
>   	mutex_unlock(&xdna->dev_lock);
> +
> +	amdxdna_iommu_fini(xdna);
>   }
>   
>   static const struct dev_pm_ops amdxdna_pm_ops = {
> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.h b/drivers/accel/amdxdna/amdxdna_pci_drv.h
> index 6580cb5ec7e2..231f8c127781 100644
> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.h
> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.h
> @@ -6,7 +6,10 @@
>   #ifndef _AMDXDNA_PCI_DRV_H_
>   #define _AMDXDNA_PCI_DRV_H_
>   
> +#include <drm/amdxdna_accel.h>
>   #include <drm/drm_print.h>
> +#include <linux/iommu.h>
> +#include <linux/iova.h>
>   #include <linux/workqueue.h>
>   #include <linux/xarray.h>
>   
> @@ -101,6 +104,10 @@ struct amdxdna_dev {
>   	struct amdxdna_fw_ver		fw_ver;
>   	struct rw_semaphore		notifier_lock; /* for mmu notifier*/
>   	struct workqueue_struct		*notifier_wq;
> +
> +	struct iommu_group		*group;
> +	struct iommu_domain		*domain;
> +	struct iova_domain		iovad;
>   };
>   
>   /*
> @@ -144,4 +151,21 @@ extern const struct amdxdna_dev_info dev_npu6_info;
>   int amdxdna_sysfs_init(struct amdxdna_dev *xdna);
>   void amdxdna_sysfs_fini(struct amdxdna_dev *xdna);
>   
> +int amdxdna_iommu_init(struct amdxdna_dev *xdna);
> +void amdxdna_iommu_fini(struct amdxdna_dev *xdna);
> +int amdxdna_iommu_map_bo(struct amdxdna_dev *xdna, struct amdxdna_gem_obj *abo);
> +void amdxdna_iommu_unmap_bo(struct amdxdna_dev *xdna, struct amdxdna_gem_obj *abo);
> +void *amdxdna_iommu_alloc(struct amdxdna_dev *xdna, size_t size, dma_addr_t *dma_addr);
> +void amdxdna_iommu_free(struct amdxdna_dev *xdna, size_t size,
> +			void *cpu_addr, dma_addr_t dma_addr);
> +
> +static inline bool amdxdna_iova_on(struct amdxdna_dev *xdna)
> +{
> +	return !!xdna->domain;
> +}
> +
> +static inline bool amdxdna_pasid_on(struct amdxdna_client *client)
> +{
> +	return client->pasid != IOMMU_PASID_INVALID;
> +}
>   #endif /* _AMDXDNA_PCI_DRV_H_ */

