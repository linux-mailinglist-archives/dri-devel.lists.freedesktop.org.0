Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B817CA74A0C
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 13:46:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC6CC10E1B0;
	Fri, 28 Mar 2025 12:46:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Z2beEMYQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062.outbound.protection.outlook.com [40.107.236.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E054510E1B0;
 Fri, 28 Mar 2025 12:46:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ama6yLBH+Y6JS01bNasbcFoc1AkvR+gpRj/62sj32am+Nyn7S32fPjgSE1QV6SLdGlKOM2E21xsYjCZgTxSyWgmtMZEW2514WWlVb5V/kAdn/8ebZYIQJnJrEw2ZyJcZIlSSOftOLXHzTuUpMfkjRse6HO8sGejOF89qkhQm57fboCdNrzfg9f9wUkE6a5rGoF9zo+VSMJNy1Xlx1kF+bmlKZbW+4gRcF3eGeU4bgd4vJX/3E3L3b4JIH32kYQSivsBs0RJ6chhqIuC3m5YCrEiOub4tvU/OB2FDuwYeQ7W2CwfvN0/dNTy+hBgc5R7KVg7DeHnmYfNAwL8oqTMlKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ckeK1p94K3sq7sJ4hndbFaNmw5zBsXUCO3vcTy41Q9o=;
 b=iQHWwz2kYxqduOv/zS6nKR/7lS2plGR+4wvVjCkEmaXwxiowA0rnT3fc+P7BwmaJjdka6SFwaJpNkKqdqBiCkYD6vvKzciTgcyt/zBi4BRQDqC/vsawcDsEQnVtuycLXqP2sPqmG7k2YpBtMlaPcyOM1anfLbGpLhc9geS4ciZc9eBCCGWAkuUqUC1s8QYNQptFZWv+/xR/mG7CAMwQrjrSGmta9P/Jb49CfbBrYm2HOnbDMUKcO6SWEjWUjcw3x1yhH6gniiDm2QoZhUoWWe3x+XS2tDFOfc+1r0NB+mroyJyhhKm7YxMukmTn54DY26KSedNeU4aaf1y9Oar/9zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ckeK1p94K3sq7sJ4hndbFaNmw5zBsXUCO3vcTy41Q9o=;
 b=Z2beEMYQ06lPIBY4I2LZrw6Vm1Zr4Zf4CYHPq+W2Khc4HWjA7ySG/cEEFfoXl5BuYqtvznB4Esk+JMFppMYwbL2HxdqlyusmqrCgRORZ5340mCP+BBfO42MhHXycoJUoB3ybkFEWgsdr/5DuKSuOKAT9bytw7EZCE16tjAhyil8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN0PR12MB6319.namprd12.prod.outlook.com (2603:10b6:208:3c0::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 12:46:29 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 12:46:29 +0000
Message-ID: <8a4772c0-7789-4697-94c7-5cb364fc4ee6@amd.com>
Date: Fri, 28 Mar 2025 13:46:23 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/prime: fix drm_prime_gem_destroy comment
To: Danilo Krummrich <dakr@kernel.org>,
 Chris Bainbridge <chris.bainbridge@gmail.com>
Cc: nouveau@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 lyude@redhat.com, sumit.semwal@linaro.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <Z9GHj-edWJmyzpdY@debian.local>
 <00e4d9c4-ecfc-4784-b603-12db04cda806@amd.com>
 <Z9q-ggKKgTsvW-Rz@debian.local> <Z9rA0G2urlVHFOSx@cassiopeiae>
 <1f4a534f-8883-4793-b191-60c2773f6217@amd.com> <Z9rSTkXlub-JZAz0@cassiopeiae>
 <Z-P4zQ1464SeZGmB@debian.local>
 <94eeb36a-9aa5-4afd-9ba6-76e8ace10122@amd.com>
 <Z-P84iMUP4NBAY7k@debian.local> <Z-aBkc2p5BZLrBJH@pollux>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <Z-aBkc2p5BZLrBJH@pollux>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0112.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN0PR12MB6319:EE_
X-MS-Office365-Filtering-Correlation-Id: eedf39bd-b26c-417b-4de3-08dd6df68f36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MFYrUDVpdmVSNXBUTVNhS0p1WXJXV3NtL0Qrd2E5OUVCSXF2ZU44WjVSckJN?=
 =?utf-8?B?RWdWNGhjcTlGZkt6ZjBjVXhtL3NiSmhvZ0w0akJXZ3BUdmNUdHVwdTNNQ1pM?=
 =?utf-8?B?S3dWRW1LZmxuM2Z3VlFGRkxMRW4rY1JQR09nellXb09mbER5eVdHekl6TjhM?=
 =?utf-8?B?MFBvRVk4OHRLR2RRT3lwdytnWFNhcUNFK2xjRnVTb3BwMnc4R2ZZY01acmk4?=
 =?utf-8?B?VEJPY1p1UEhLeVdaaG11SmYxcmlCazc0NUxkQnhyQW1IMkVEQTNLWVJYWnZ0?=
 =?utf-8?B?VVRRSjI4U2l0c2lIb0lhZU1hYUo1UW01Q3JOTm1UNmpkR2tkbGxlZlNEWlVJ?=
 =?utf-8?B?U0ZiWDVmaFpadXhKaklqcmxLNXMrYzZxUU5GLzlKLzlDZnpwNUgxcWVwWXlJ?=
 =?utf-8?B?NTlXKzBoYVJoWWprRTR2T1JveG9qYllZK29TWFlyU3FJY0JJYW5HOVBkdExW?=
 =?utf-8?B?Z08ya0s3NTEyM3QwUjZKdk05b1NpUFBTNmtEazI1YjRPQTRjbXdPQkFDTzBY?=
 =?utf-8?B?WWhUT3BLcTNNdGVPbWNjalIrd1VST0lQbmV0a21hT2cydEdOTkdmaEhHSkJ2?=
 =?utf-8?B?Wm0rMGI4UjBVNWNYenZxSjFUUytpcy9PbXQ4Tmo4NURwVmhYMnNXcUJjNEdm?=
 =?utf-8?B?eDN2RW1WamxOWmxxM05tdFNNNGM1UHczM3hTYW85NitHbFlMVnFqSU5SYjdI?=
 =?utf-8?B?TWNaaU5MZ1hHQWZDeHRnbkNvajVpMDRnVXpaaGU0Ly9JTzA4NlBQMVBiL3Yy?=
 =?utf-8?B?RGtOWnFQbnJuU2I3enJtdWJ5NVBrWTJFVlpVcTZqSEZIcDNDeDZOT1ExZFJ0?=
 =?utf-8?B?Qk1nQnkrQWNxNDZMUkV5K09oNFAxcVNGeXBzeDhaekhNRkkxK01pSXFISnVS?=
 =?utf-8?B?MmJlaTJNVG1ncVM3dmNjbThmaUk1U2xyR25YU0dhbkZKMmlYUnk4Y1RBREds?=
 =?utf-8?B?aGJJamI5UGRTeU5YdkQ0aCtNM2Nqb1BMRkRQY3hNRldtYkQ2R3JYWmtkNUxu?=
 =?utf-8?B?Y3VlZDhmUWJRa3ZoUXduRlZTSDFuQVNQeUZJS2ZVazA2NXB0cUdnaVM0VDN1?=
 =?utf-8?B?dXhJSHZSYTZreFNVM01HTlQ2MFZPenJ3QW1lRUZXa2diYzZVZngyZkxlYlFn?=
 =?utf-8?B?MjVodDE2c3NEU2JDZEJrU3c0bTE0NUV3clJhRXNlMnZBQlV2THhZQVQvT05D?=
 =?utf-8?B?RU41eFA5MWZQbW1yRytOSU9IdzBXd1RXd1VXNFV4TSttTVFUY3VRTEc1ai8v?=
 =?utf-8?B?ZVR5THF2QkU5MllnVUs0UG8rMmVtZXc1VFJnN1ZxeWRJSmt5ajJxZUdVWmNv?=
 =?utf-8?B?QUhEWlc4ZXdvUDFvdk9vOHpCc0Z4SHUwSUNEVm5INmdCcjhQMElDSFVDdmJX?=
 =?utf-8?B?bGJ4MkkzY1E0VVE0aFBraS83NTlxcEF3c04rVFhQOFBXU0VMVkRYNW1tN2pS?=
 =?utf-8?B?Z3QzMGw0OTBUL1ZrWUhTNkl0OVpJNEJCM3R4azdtVCs3cXhuSFRjUkZLYUcw?=
 =?utf-8?B?RTN6Sm95MWMvcXAxN1k4bXVFWitQNkZxR2tpbzJvaTN1OWdlUXZPVmZaT3RL?=
 =?utf-8?B?THpNT1pRTjEvYnlzWDNVK1VuZHN3Q1YvMGdWQ1FPd3ZqNGhCdE0xM3M0ZnZm?=
 =?utf-8?B?MGwvMWJkekgwVzRpODJiSm44VlUwd2tpcGFTaEtIZ3BBUjcwRnFlWXJrcGEv?=
 =?utf-8?B?T1orUHphaldQaW5YZmlsMFhOYzZCMlJCY253NkpTbVpwY2xuUzlrY3ZrNGpU?=
 =?utf-8?B?WHRvM0ZHOVZLMEUwUTJRRnh1Q1FDNDkvc01UbDZFc2wwaXpUdFdmZmtxRHh1?=
 =?utf-8?B?eVh5WDJGTllyZFRYdHR1QlUyTk9DNzJ1L0tqYkI3N2J4WHArcWVteHNLbUZ4?=
 =?utf-8?Q?RzJcAWxnCiHnq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enhUREc0ZWE0MW5IdnU1L2ZNc3U1Q05NZmNvbWxLTU9jUFlNVWh5VVpKR1Y2?=
 =?utf-8?B?ZWZubGZpK1JNS1AwQktZRGZQMUZZMUFmcVFpemV3UTM1T29aa2hPeGFkNmxK?=
 =?utf-8?B?cU92dGdnL0dNYmh1VytXNlFGRmxuTEhCNEJ6WHlxb0N3aXF0REVyYm80TWEz?=
 =?utf-8?B?V2hJcldzeUlxU3ZSTnRGdy9oRE10RGZyd0Q2bEZhMUp2OTRIaFNYdHhva0RE?=
 =?utf-8?B?YTU3eTlHcDdCUWlDSXU0b3RIY2FmdFUySnZETmFXWlZ3VWUyV1FLRlBjYW5z?=
 =?utf-8?B?QVFrZDdKTThtdkRzVmNrM0EyNENEQVI2TEFFYVQrbjAzUDhDY2VJdXZ5ZGdi?=
 =?utf-8?B?S1UzQlhRcmQvb0pHWWFKbklxREFBYTgrZWlvUm5sZE1GUDVuT1N1S0d6S2l4?=
 =?utf-8?B?S1ZlS0pucHc4Y1M4dktIcjQ4aWZKNEN3S3hrUy8zMW0va3UwV05kK0J6b2l4?=
 =?utf-8?B?dThHUGlVRWFyUHNMWE5RejRhL2hjNkM4SlRqVExlUDVwUVgrb2REZlUyQVBB?=
 =?utf-8?B?OUx3UjJkVldZL3gyaVh6OXZRdU1CMllVWVZtWjBpM2RiNmdiK3Jad2NLVzBX?=
 =?utf-8?B?aFdWS2QrSDhSOHF4K2h4S0ZlTW9WMmg0NE5DK1NsTHMzL1hJN1c3VHF1bjUx?=
 =?utf-8?B?RFZIVVkxRy9VY2hZRzFlRjY2aDNLN2FTMUlaTUpOZkxYSDdGdHB2ZjZYaGNX?=
 =?utf-8?B?K3RzaEZoWEY5SDB3R1FvRHlxWVlhMFg3VlhienlEaW11N011V0VSWnAzUk8x?=
 =?utf-8?B?bnhWQlhvSzk4S3lxZW00dGVoUmhhQS9DTExLaWp0MWdJQXVYMEcvQllDMXU0?=
 =?utf-8?B?YWR3OEhJUHcxb0FUV1BKWU9tK1FtYXBnU3RlYzBqcVU3bUlXM2J6M1htTkFa?=
 =?utf-8?B?WlNGeDMxbDBkTzdQOHBMam1QcXREL0hVVTIzOVA1Sm1SME0rQXpJVzlId3dw?=
 =?utf-8?B?ZU5WeEkwWWEwTWV3K3dBdnJZOUtBajQ2ZFE0bG1nTnB5RUpqanZYbnlkK1FU?=
 =?utf-8?B?cVVSMWxQS2dIamRjekw4VGJaREtxUnFKa0pLN1Z2dUU1QjV6RjNFVldHRjJW?=
 =?utf-8?B?YkkwaFZkZnVLWmQybTI3K3NYWlhpZkpBS1NqcmNmTzVXRlo1UXBhbWNXeXdZ?=
 =?utf-8?B?YjBNaHJ1YnhZWjRPekVhQjdPcnBtQVZiQ2F0UXZPN291VWFwRnRuRXJWcjV2?=
 =?utf-8?B?TTJvT0VPSFRsOVg3VEd3Yi9nY3ZERjNhSGRGZGxCRzN3by94L3JETG80N0d1?=
 =?utf-8?B?SEU4M1p2eGh6S1FFaHkvSmIxV2Q4ZmVEcVI1UlVJTEREWjc1bTJwQzZKcUR0?=
 =?utf-8?B?cnN1ckZYVnV6VkR2NEJhazg4ZUhhWFFmVHhtcUgrQXV1SFdkQ0wzQ3p2bzNM?=
 =?utf-8?B?czJNcExQT3g3UVhEZG5mZkFPQ0FEY1NQcmo1QVVQRytOSmV1YTJOMXZPVnBj?=
 =?utf-8?B?N25LTnNlWHo3OTk3RDRiaGxjTmN5RkIzcVJ0WVdkYzVBYnMrUW1uRXcyVnF1?=
 =?utf-8?B?QlhsOXpxNlF5Nnp0SHFBTCtiaFdrd2pjalhvUVVQeDV1KzkvbXU2RWNUaEE3?=
 =?utf-8?B?ekgxZEZlQkMxRzhuUnExVko2cWJNVnRIazdiRTA0VERrWFJxRjFXS2Qxc3Zr?=
 =?utf-8?B?NDNZbzdCMHRqRWFPWTVMcVM3UzVBbTUrbWRBTFE3SFNrTzkxeUtRdnhWbXlk?=
 =?utf-8?B?UlNCMXd2aUdIbW5RNURaejNWSUx2ZXRMaUgzaUNzOVo0bTAzdER0bThpY1BM?=
 =?utf-8?B?bkRXdXROTTc2VnlqNXNqZzlORlBzNjdudWNjVlpJd3BhUXgzbjB4TzZpdXVx?=
 =?utf-8?B?eUlJdWhCOVZUNkVPYjVkd1FhTk1XSlM0YXVsTmtGellmWlpPTTdJOERpY0Fn?=
 =?utf-8?B?eUl2N0lZZUdQcjNuQTY4TlZOQ2ZqaTVPelorcGZBZlkwQnVjSTNTejhuellK?=
 =?utf-8?B?RXRsOXdMckFzdEJ0M2c2ZzBCS0Y0WHJUWW9QMFpLRE81V0g2dTlESTZjamhk?=
 =?utf-8?B?UXBrcXhxbE1aTHdDb2hkbjl6Z1hkNzhZd2h6SDEwb2dXRkhNV1lNSmV3NmI4?=
 =?utf-8?B?TU9OSSs3MWNJcGxnODBNd1N2c2ZpVnQrczNsYm5HK08zU25NdGVKSHlSOU91?=
 =?utf-8?Q?Y5Fxv+87DeQ/2u0TViXWdmwJU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eedf39bd-b26c-417b-4de3-08dd6df68f36
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 12:46:29.1104 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gA9ibj6/uGPXAIMzlcZUtCEg50lQK8Szlr2HI0xCkia9apFmErYCP4H7oTmsxcKY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6319
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

Am 28.03.25 um 12:01 schrieb Danilo Krummrich:
> On Wed, Mar 26, 2025 at 01:10:58PM +0000, Chris Bainbridge wrote:
>> Edit the comments on correct usage of drm_prime_gem_destroy to note
>> that, if using TTM, drm_prime_gem_destroy must be called in the
>> ttm_buffer_object.destroy hook, to avoid the dma_buf being freed leaving
>> a dangling pointer which will be later dereferenced by
>> ttm_bo_delayed_delete.
>>
>> Signed-off-by: Chris Bainbridge <chris.bainbridge@gmail.com>
>> Suggested-by: Christian König <christian.koenig@amd.com>
> Can you please send new version of patches as a new mail thread (not in reply to
> previous versions) please?
>
> Otherwise,
>
> 	Reviewed-by: Danilo Krummrich <dakr@kernel.org>
>
> @Christian, I assume you will pick this one up?

Sure, I can take care of that.

Regards,
Christian.
