Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E02B22797
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 15:00:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEF5A10E11C;
	Tue, 12 Aug 2025 13:00:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="QUt3F6Jf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2049.outbound.protection.outlook.com [40.107.223.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 308FD10E11C
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 13:00:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PnLt/Y2mcOOV1IBwdBDo5zKaWhqEUSK/gnBOeSEgdUVYZLXY29C8bSH8zX2Zajk/TjrCRG1niqpRevo/SqOR95IETOGouOTz+lecDKzR9SLFfL6Ne0fT77zQ9C6qNWgcgCbRvkP2gEXYQgeuIk3yNtOSBsshS1u6cOb8wQmYzA8puhV6W/WUc9YrIHNODCYwElDFZ/pq9D5NJhTEuMU3f2PaznyYbfMKvpImKZgNtM2hRsin/B14Nz7iAwoP11/a4F7/A9V6wt67vRiixkYFV/0712uFtIy2C8iJI5CBm5bwYdi/jDmmSsyVci6d8NUnTpUaCOh7eQ2Vwku1vZ+bqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TA3Amt4GlrkM/kG6DjXxuvnLeYWZlfBzHkgv8BaG1SU=;
 b=cfeZOsz+AnRF4+YN0ldAQPEp6g6Zy0lWxIzVshHKr51s0/LGaoCG91zaZc8U+MWJfdgzQGsn8zp2CACaMKU2W2IzYWUDt2wIFcrKAzGoxq9KQdpyb2xGAvbEJnyflYSThXR5PNeUfVsYk0DOtpkTDzgQH+EezAxLDSI7kv8Dig9Z2MFgdVaqTVsJKFvHdRNn7vD7nhBCaKAurvnAWuGhy8kUehOKSMmitRjH+nD6++2sE84ii0UwpDSvoWZEuNSP+9YAoa7iRvtq1OU8n9POG58Rvhge0oW6+lU3255tAkRLptbCYLjsfW/2Xin7NwnqXDylbUeUVXdmBpXjA7j3xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TA3Amt4GlrkM/kG6DjXxuvnLeYWZlfBzHkgv8BaG1SU=;
 b=QUt3F6Jf6aYdnQz0wofQWLsomzpaOs/zW1LgO8KzVeIxLiTMkS1Lc8vg9VL6I4HF/MH3DvqnJSdkZP3JzmInzL813QlZoD1it7/awC2Rez8nF4W9MIrS/fJYcUYh8nEwBv8Kk2Vvrfspw8zSso2SoLcKjAgRIF2o5IKkPfs2yPI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH8PR12MB6817.namprd12.prod.outlook.com (2603:10b6:510:1c8::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.22; Tue, 12 Aug
 2025 13:00:09 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9009.018; Tue, 12 Aug 2025
 13:00:09 +0000
Message-ID: <e69e074a-6c7d-4b3c-a10c-73b304f0efdd@amd.com>
Date: Tue, 12 Aug 2025 15:00:03 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: fix task hang from failed job submission
 during process kill
To: phasta@kernel.org, "Liu01, Tong (Esther)" <Tong.Liu01@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: "dakr@kernel.org" <dakr@kernel.org>,
 "matthew.brost@intel.com" <matthew.brost@intel.com>,
 "Ba, Gang" <Gang.Ba@amd.com>,
 "matthew.schwartz@linux.dev" <matthew.schwartz@linux.dev>,
 "cao, lin" <lin.cao@amd.com>
References: <20250811072050.3838241-1-Tong.Liu01@amd.com>
 <b2e02500-0d50-4d84-8ec5-fb8cb753c91a@amd.com>
 <DM4PR12MB613427A4B81ED0A910B530B59028A@DM4PR12MB6134.namprd12.prod.outlook.com>
 <323722ba-257a-4808-b369-5b9e35435fda@amd.com>
 <DM4PR12MB6134C087D13FE3608AC597D5902BA@DM4PR12MB6134.namprd12.prod.outlook.com>
 <b1a98f9f-78d4-4dcc-9477-e8529d34dcd7@amd.com>
 <61787d6cdbfbcb8acdd28c9b6ead50dfb0641899.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <61787d6cdbfbcb8acdd28c9b6ead50dfb0641899.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1P221CA0012.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH8PR12MB6817:EE_
X-MS-Office365-Filtering-Correlation-Id: c102b262-70c3-42da-935a-08ddd9a02ac8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L1plakFwZUk3dHI3TC9WMDI2UlBza1JFRjdxZlNvQ1RyTXFWUE1sbE0rS1lT?=
 =?utf-8?B?WEVMYmZaT2RpNFNRTHdhaVhCUjRCYVEvaWo2Z2NFc2Fha2htbEticXhpeUpa?=
 =?utf-8?B?Ykp2aE1saDVDMFBJUnAvOUZCcUx1MHgwTGI1YVRHY0dRbWM0UlJrRkZhVk1M?=
 =?utf-8?B?U1lRK2lXaE9VbHVQZW94V21jM2tWaUw5eHg5bitDZFRRZUVPV3V2MEtNaVZ6?=
 =?utf-8?B?Yks3Mkk3M0tjUkdJZzEzUGo3bkRmTk51RTRYQkdHT2Nnc1ZpTzZtY3VrVFRn?=
 =?utf-8?B?SzY0QzNzWjhaV2xmL3FYTXlxcG9TWk1MbHlBcUpqdjR2SUpQNjJMcmJBeG54?=
 =?utf-8?B?alJaYWM1Rkw5VW5nTjRHTTcrVGM4WHlJYnBqczIycmlCekhML1BSUkkxVWdF?=
 =?utf-8?B?TmZJc20vWlVKL2VBMlZSTGFId3B2R2tZbVdMUldFc2FqMzk2OWcvb01mS1NN?=
 =?utf-8?B?aTNTYm5pRm1NMU1TaUFNMytjK25iYlFpazdKMG56dHR1M0tYVTlIekJmaE1O?=
 =?utf-8?B?clQxcDk1YTZ5WGRGSzZhM1VxVDJkTFNBRkg5bzRMM3NuSGJZVkdvdGJWYXVq?=
 =?utf-8?B?QTNsZTFTWTBpZE9hdmVKemtwSGxnSmg5YXJURnMyRUJhMTR2c2wvOU1iWXJB?=
 =?utf-8?B?aDJCQVp5SlBNUUxjVjZhRlhieTliTG1FWE5yUkFnSXo2elluTTRzYjBVMlpM?=
 =?utf-8?B?OWEzK2NJY1l3amNxcUh6TEV0VG9hU282T0dVOTd2VjVwQVEwYnIxMkxGenBG?=
 =?utf-8?B?VEFpMVJ2dlBqdWJ6Ty9RRDBQOVNjT0Uvdm13QUh5UzFtZGNQNFZlYThXV2xV?=
 =?utf-8?B?YS9Ud1EzSTN5Wm4weWdtM0dtU2dzdk1ScWljWlRnN2lhWFUzR2hwZU56Wndi?=
 =?utf-8?B?MFMzRVNObFJWSkpXM0hzU2t1ZnUwYTRkekJJZXhndkN0Yjgrci84cElsQUFQ?=
 =?utf-8?B?ajErSTJWT3ZqeExBZVVwTXZYTXBzR2JtMTdLQXg5OW1sRHZLY0Q5T2pyMEEr?=
 =?utf-8?B?a2FFWklIaG5JUnAyTUtCekp5b3lTQWN2UDdWRzVNU1VTQ0RuMEFRakUxOWcv?=
 =?utf-8?B?WmRDeFRLRm1LcnJFTzBVM3VvcjVlaUwwWWlNWlR4bUd5WXQ3eGduMytVb3Rj?=
 =?utf-8?B?SmR1U2p3M0tmNlpOcnRlbHJEcStReWUwU0lLN3JPbkEwcEZhWGxjTW43Z3l1?=
 =?utf-8?B?am1JQ0U3UVh1ZHZuTFYycDZISE5qclhMcG0yajh2UkdxKzAvS1pXWXhTY1RQ?=
 =?utf-8?B?VEw5TnBLa21WQzhtcGU3Z2o3N2hhak5HTWx2ajUrWm9lLy9TUkhNTjg1NlBj?=
 =?utf-8?B?T1NROVJIaTJJMStKVHgyTDVGLzVHMUdQL1U2UmhpSDhBZGdaSy9NWFFjK0li?=
 =?utf-8?B?OFlqYUpUelNrc1ZKZGgrUG1PejhBbk80WGFQT3Z5N1dkbjhSVFl3Ry9WRlFI?=
 =?utf-8?B?VTRaNWlMOGxSanIwWWhBTlE2YUt4eFZZZm9FOXpqaWZJS21Ic1paaFJmdTk2?=
 =?utf-8?B?NEZFbDVPVkc0MlBqamlBZGRRMitIWU54d3A1ZG9TZVBodEs0L043OTFvNnQz?=
 =?utf-8?B?TVpuRnJBSDZzcFFVY3ZnSm5ZWGtTS0ZUMWdCb3YxUnVoZmo4YlNaNE5NdWp3?=
 =?utf-8?B?dXNqN1p4S2RSQWVhQnh6RkROMnRieStHai9pSFhZWmh3bEFnMnFvY01TUXBL?=
 =?utf-8?B?Ym42b1JLZGlnQ2J3TnFyU2FaUzlEV25xZmpKbHM0N1dHcG1zdWZINUNQNERJ?=
 =?utf-8?B?OWxiUUdTSXpVbWNCV3NmdS94NjlaeHVwaHdOSFZMcEp2cVdsQnViSE1tRnFs?=
 =?utf-8?B?TE9IazdBbStOZnlOR0NrWElrRjZlQkZnNnpLYlFNaGdBS2NENmFvVVJxQ1Jz?=
 =?utf-8?B?dWZmNVJYZ1o0dkhRK0pLL0MxL25ONTEzVkZwQXJJdTBGY2ZXNS9meHRwcVFv?=
 =?utf-8?Q?qjnmoVEuRN0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wkd2R1RPeTNtQy80ZFlnWEUvQnhWaEkwbnpTMXU1THJPQkZQUTR6TGc2cG1u?=
 =?utf-8?B?dFVZSXM4VC9zNVI2MmdLaHNSdEdiam9IMXpZd2ptUTZDb3kyWW43bTRsYXNv?=
 =?utf-8?B?WmwvTU5zZ3p2anNMenRQTzdXWE1yYmhpYWhYd2JzSzZ0aUlrTVVQbjNYcmxz?=
 =?utf-8?B?MCtSUTZmZHc3a3NqbXdvVnlZU21mYmpVUU5keHRKWW90UEwwTjM1MXRLUzcx?=
 =?utf-8?B?clpNMlIwV25GUGoxN3lvbEJMZmV3b054YW5lMFFaWE5pcC9LWGFDV1l4eWdi?=
 =?utf-8?B?TTYydDgwQzZHSXUycWxOSXd4MUpEYTVzdCtjcHFjUTJIVENOVHNuR3B4VHpo?=
 =?utf-8?B?UVN3RVpCbnlucGZDdmt0MG1yM3NLL3pLYW1iT0g0TVlUbm0zeGcrTnFZYnF2?=
 =?utf-8?B?Vm1ESVI3YXlIek5Wd0Z0SjRRa0RlQmFua0JwaEpDTHJjTXBvNmNxMkVvVk5P?=
 =?utf-8?B?SWc4Z1RYcWhtZkxmWDFsc2p2dSs3dnZkSnAwNXhYS2ZmQ3NPWStuRmxycXdJ?=
 =?utf-8?B?TG5vaURWTEFXT2NyQ3lEL0JudEZQdzNpcFVJaGVRelEwTGN5ZUtmV1hYc1ZK?=
 =?utf-8?B?cHM0OHJOSHRLN3ZYQUxLMHU0cWlaU01EQnp1SXBHVDRKWEdUZkdvcVFCTVMv?=
 =?utf-8?B?TGRMUHVENlZyOFc2bTN6OW1vNFJHUTlxT1d1MWRYelYxZDEzaURaanFMeGxI?=
 =?utf-8?B?QzNyRXZFSk1vSWlXOXFIOXpZLzlIT1h2cnh0S1orb2lUeTUwbCsrMUNTei81?=
 =?utf-8?B?OWxHUnpqTlk2c0VJUzRsWlYvRnBzZ0htQjRteVFJK2YrVzExZ3l1VlRpYTJL?=
 =?utf-8?B?VzNIcmRCRmlML0YrMzZjZGFRRFlxRTZhZDNwQjkxRDZhb0liZkJRS3p0N2xj?=
 =?utf-8?B?L1pScjc1YzJCdTVJVzJoOHd0RjZ6V1BCYWxQVk9BbG12dVB0S3E4VXYwanhZ?=
 =?utf-8?B?YUE5ckJqWVExbUx0L2xURjZ4L1NFTlplMTVldlZRM3FBVk0vSmxENmtwRnpU?=
 =?utf-8?B?SEs4ajA1c0dLSS9kZ2gyWktKWnB1NDNVakhPT0JPUXp2Mm5WKytmSWlWMTNu?=
 =?utf-8?B?Q2V4N1B2dEpQd2hzeDNoRFJzZklqT2RIcmFzVndGYXA0cDBkNUlGMXV3MElY?=
 =?utf-8?B?Z2sxNkhhVUljUnRuc3BveEFJcThxNlUxODFSMEsxZ2tYZG9kT2FKNlJINUE5?=
 =?utf-8?B?dGxheXZzZzlSTUhMa0o2SkJRL1hWMGw0bTViSk1nWjA2dWFNWHdDOEZPSjJv?=
 =?utf-8?B?aitMMFdnTWYrQnYvdHByVlZmckVkODZoSFVpdzhkWm42YlRFVEllU0pQWjJ4?=
 =?utf-8?B?ZHFwaHYzOFpKY1NXMXZwNUFwa0VraDFPZzl4WnJRaHhvY2UydE16Q1FUSkJo?=
 =?utf-8?B?VlB0RDFVL1d3cmJsUHNFTHRUcUhEclQzYjhUZzlyRWJtV0V4WUU4eDdwUmpX?=
 =?utf-8?B?OG80RldsQVpHcUR1Vkx3S09wbmF1QkVURWpGc0dZLzBUQndmMExsckc2UUNu?=
 =?utf-8?B?MVpEUzdXc0h2WlN5S25zNmlkT1FkSVBQcEt1ZHQ0bVhUU1N5MVhXekhITFhk?=
 =?utf-8?B?NzBVS3QxeWgzT0VtOUxRamx3UDhmcXM5ZmFxTmU1WGY5R01laGlLbU1TSGw4?=
 =?utf-8?B?ZWg2RnBMS0x0elkvRVJqMVZSTjJhYWFyVUJ5TktiK1ZSTmhJb2QwWnNZc0lX?=
 =?utf-8?B?b3hUMStTdlZjRzZsSUpJR1hSZnBudm1uUnBLOWxTMnRtaWVjT2NnUHN3c243?=
 =?utf-8?B?MTJDandiSDI4RENYV0FWR1lZWEd6cmFuNXpaVXVXTHM5ZjRMb2VUT0FpQnpU?=
 =?utf-8?B?akxZVk8xUE1rWnRwckZJWmJRek1LcWZJMWRFQUxXK09zcnAwWlBLNzFrRTMx?=
 =?utf-8?B?UFhmb3F3YjR0MHRITXRmYkhrc2VqaldoakFwQWtvYXhYK3lPMGhjY3dOby9I?=
 =?utf-8?B?OHRmNG9NSkdKaWZ1d01ZN3pHSzJkMkRVZUl1Qm5sZmhQcmRUMTBaaHM3R1NI?=
 =?utf-8?B?WFFyNkp3MzU3L0VxeHRzUHJjUzZwQXdQU3ZOd1QzTi95MmZ6TVU5WlJCSEc4?=
 =?utf-8?B?SncwZVZLcEZQdWdjZnRSWlpnQ2kyWnBXVzhWRkg0UllSRzUrNlVOUloxbUNm?=
 =?utf-8?Q?DhX/gSaWQuNO3TW8QutRetG55?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c102b262-70c3-42da-935a-08ddd9a02ac8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 13:00:09.6661 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L/bq6gc0AReWOsiKCaBHE1KoMC0kWW8YWOTpRKTfSeYaucN9F4e5cJJ1KD3Vlw6L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6817
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

On 12.08.25 14:52, Philipp Stanner wrote:
> On Tue, 2025-08-12 at 08:58 +0200, Christian König wrote:
>> On 12.08.25 08:37, Liu01, Tong (Esther) wrote:
>>> [AMD Official Use Only - AMD Internal Distribution Only]
>>>
>>> Hi Christian,
>>>
>>> If a job is submitted into a stopped entity, in addition to an error log, it will also cause task to hang and timeout
>>
>> Oh that's really ugly and needs to get fixed.
> 
> And we agree that the proposed fix is to stop the driver from
> submitting to killed entities, don't we?

Yes, absolutely.

It's basically the cleanup procedure which tries to update page tables of a killed process and is missing a check to not do that.

Regards,
Christian.

> 
> P.
> 
>>
>>> , and subsequently generate a call trace since the fence of the submitted job is not signaled. Moreover, the refcnt of amdgpu will not decrease because process killing fails, resulting in the inability to unload amdgpu.
>>>
>>> [Tue Aug  5 11:05:20 2025] [drm:amddrm_sched_entity_push_job [amd_sched]] *ERROR* Trying to push to a killed entity
>>> [Tue Aug  5 11:07:43 2025] INFO: task kworker/u17:0:117 blocked for more than 122 seconds.
>>> [Tue Aug  5 11:07:43 2025]       Tainted: G           OE      6.8.0-45-generic #45-Ubuntu
>>> [Tue Aug  5 11:07:43 2025] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
>>> [Tue Aug  5 11:07:43 2025] task:kworker/u17:0   state:D stack:0     pid:117   tgid:117   ppid:2      flags:0x00004000
>>> [Tue Aug  5 11:07:43 2025] Workqueue: ttm ttm_bo_delayed_delete [amdttm]
>>> [Tue Aug  5 11:07:43 2025] Call Trace:
>>> [Tue Aug  5 11:07:43 2025]  <TASK>
>>> [Tue Aug  5 11:07:43 2025]  __schedule+0x27c/0x6b0
>>> [Tue Aug  5 11:07:43 2025]  schedule+0x33/0x110
>>> [Tue Aug  5 11:07:43 2025]  schedule_timeout+0x157/0x170
>>> [Tue Aug  5 11:07:43 2025]  dma_fence_default_wait+0x1e1/0x220
>>> [Tue Aug  5 11:07:43 2025]  ? __pfx_dma_fence_default_wait_cb+0x10/0x10
>>> [Tue Aug  5 11:07:43 2025]  dma_fence_wait_timeout+0x116/0x140
>>> [Tue Aug  5 11:07:43 2025]  amddma_resv_wait_timeout+0x7f/0xf0 [amdkcl]
>>> [Tue Aug  5 11:07:43 2025]  ttm_bo_delayed_delete+0x2a/0xc0 [amdttm]
>>> [Tue Aug  5 11:07:43 2025]  process_one_work+0x16f/0x350
>>> [Tue Aug  5 11:07:43 2025]  worker_thread+0x306/0x440
>>> [Tue Aug  5 11:07:43 2025]  ? __pfx_worker_thread+0x10/0x10
>>> [Tue Aug  5 11:07:43 2025]  kthread+0xf2/0x120
>>> [Tue Aug  5 11:07:43 2025]  ? __pfx_kthread+0x10/0x10
>>> [Tue Aug  5 11:07:43 2025]  ret_from_fork+0x47/0x70
>>> [Tue Aug  5 11:07:43 2025]  ? __pfx_kthread+0x10/0x10
>>> [Tue Aug  5 11:07:43 2025]  ret_from_fork_asm+0x1b/0x30
>>> [Tue Aug  5 11:07:43 2025]  </TASK>
>>>
>>> Checking vm entity stopped or not in amdgpu_vm_ready() can avoid to submit job to stopped entity. But as I understand it there still has risk of memory leaks and resource leaks since amdgpu_vm_clear_freed() is skipped during killing process. In amdgpu_vm_clear_freed() , it will update page table to remove mappings and free the mapping structures. If this clean up is skipped, the page table entries remain in VRAM pointing to freed buffer object and mapping structures are allocated but not freed. Please correct me if I have any misunderstanding.
>>
>> No your understanding is correct, but that page tables are not cleared is completely harmless.
>>
>> The application is killed and can't submit anything any more. We should just make sure that we check amdgpu_vm_ready() in the submit path as well.
>>
>> Regards,
>> Christian.
>>
>>>
>>> Kind regards,
>>> Esther
>>>
>>> -----Original Message-----
>>> From: Koenig, Christian <Christian.Koenig@amd.com>
>>> Sent: Monday, August 11, 2025 8:17 PM
>>> To: Liu01, Tong (Esther) <Tong.Liu01@amd.com>; dri-devel@lists.freedesktop.org
>>> Cc: phasta@kernel.org; dakr@kernel.org; matthew.brost@intel.com; Ba, Gang <Gang.Ba@amd.com>; matthew.schwartz@linux.dev; cao, lin <lin.cao@amd.com>
>>> Subject: Re: [PATCH] drm/amdgpu: fix task hang from failed job submission during process kill
>>>
>>> Hi Esther,
>>>
>>> but that is harmless and potentially only gives a warning in the system log.
>>>
>>> You could adjust amdgpu_vm_ready() if necessary.
>>>
>>> Regards,
>>> Christian.
>>>
>>> On 11.08.25 11:05, Liu01, Tong (Esther) wrote:
>>>> [AMD Official Use Only - AMD Internal Distribution Only]
>>>>
>>>> Hi Christian,
>>>>
>>>> The real issue is a race condition during process exit after patch https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1f02f2044bda1db1fd995bc35961ab075fa7b5a2. This patch changed amdgpu_vm_wait_idle to use drm_sched_entity_flush instead of dma_resv_wait_timeout. Here is what happens:
>>>>
>>>> do_exit
>>>>     |
>>>>     exit_files(tsk) ... amdgpu_flush ... amdgpu_vm_wait_idle ... drm_sched_entity_flush (kills entity)
>>>>     ...
>>>>     exit_task_work(tsk) ...amdgpu_gem_object_close  ...
>>>> amdgpu_vm_clear_freed (tries to submit to killed entity)
>>>>
>>>> The entity gets killed in amdgpu_vm_wait_idle(), but amdgpu_vm_clear_freed() called by exit_task_work() still tries to submit jobs.
>>>>
>>>> Kind regards,
>>>> Esther
>>>>
>>>> -----Original Message-----
>>>> From: Koenig, Christian <Christian.Koenig@amd.com>
>>>> Sent: Monday, August 11, 2025 4:25 PM
>>>> To: Liu01, Tong (Esther) <Tong.Liu01@amd.com>;
>>>> dri-devel@lists.freedesktop.org
>>>> Cc: phasta@kernel.org; dakr@kernel.org; matthew.brost@intel.com; Ba,
>>>> Gang <Gang.Ba@amd.com>; matthew.schwartz@linux.dev; cao, lin
>>>> <lin.cao@amd.com>; cao, lin <lin.cao@amd.com>
>>>> Subject: Re: [PATCH] drm/amdgpu: fix task hang from failed job
>>>> submission during process kill
>>>>
>>>> On 11.08.25 09:20, Liu01 Tong wrote:
>>>>> During process kill, drm_sched_entity_flush() will kill the vm
>>>>> entities. The following job submissions of this process will fail
>>>>
>>>> Well when the process is killed how can it still make job submissions?
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> , and
>>>>> the resources of these jobs have not been released, nor have the
>>>>> fences  been signalled, causing tasks to hang.
>>>>>
>>>>> Fix by not doing job init when the entity is stopped. And when the
>>>>> job is already submitted, free the job resource if the entity is stopped.
>>>>>
>>>>> Signed-off-by: Liu01 Tong <Tong.Liu01@amd.com>
>>>>> Signed-off-by: Lin.Cao <lincao12@amd.com>
>>>>> ---
>>>>>  drivers/gpu/drm/scheduler/sched_entity.c | 13 +++++++------
>>>>>  drivers/gpu/drm/scheduler/sched_main.c   |  5 +++++
>>>>>  2 files changed, 12 insertions(+), 6 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
>>>>> b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>> index ac678de7fe5e..1e744b2eb2db 100644
>>>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>> @@ -570,6 +570,13 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>>>>>       bool first;
>>>>>       ktime_t submit_ts;
>>>>>
>>>>> +     if (entity->stopped) {
>>>>> +             DRM_ERROR("Trying to push job to a killed entity\n");
>>>>> +             INIT_WORK(&sched_job->work, drm_sched_entity_kill_jobs_work);
>>>>> +             schedule_work(&sched_job->work);
>>>>> +             return;
>>>>> +     }
>>>>> +
>>>>>       trace_drm_sched_job(sched_job, entity);
>>>>>       atomic_inc(entity->rq->sched->score);
>>>>>       WRITE_ONCE(entity->last_user, current->group_leader); @@
>>>>> -589,12
>>>>> +596,6 @@ void drm_sched_entity_push_job(struct drm_sched_job
>>>>> *sched_job)
>>>>>
>>>>>               /* Add the entity to the run queue */
>>>>>               spin_lock(&entity->lock);
>>>>> -             if (entity->stopped) {
>>>>> -                     spin_unlock(&entity->lock);
>>>>> -
>>>>> -                     DRM_ERROR("Trying to push to a killed entity\n");
>>>>> -                     return;
>>>>> -             }
>>>>>
>>>>>               rq = entity->rq;
>>>>>               sched = rq->sched;
>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>>>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>>>> index bfea608a7106..c15b17d9ffe3 100644
>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>> @@ -795,6 +795,11 @@ int drm_sched_job_init(struct drm_sched_job *job,
>>>>>               return -ENOENT;
>>>>>       }
>>>>>
>>>>> +     if (unlikely(entity->stopped)) {
>>>>> +             pr_err("*ERROR* %s: entity is stopped!\n", __func__);
>>>>> +             return -EINVAL;
>>>>> +     }
>>>>> +
>>>>>       if (unlikely(!credits)) {
>>>>>               pr_err("*ERROR* %s: credits cannot be 0!\n", __func__);
>>>>>               return -EINVAL;
>>>>
>>>
>>
> 

