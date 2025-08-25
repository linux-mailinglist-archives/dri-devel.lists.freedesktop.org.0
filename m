Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8873B347EA
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 18:47:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 281F310E510;
	Mon, 25 Aug 2025 16:47:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Hif9ZAvF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2073.outbound.protection.outlook.com [40.107.244.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6E8010E50F;
 Mon, 25 Aug 2025 16:47:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ahgw4tfEN78JT9ClY84MhVu/yUmp0ZTQqIFfKS9/WO6FdEL/w66D6vNMr7uQA1RVCV/iotk1vgSef9h9ErhEeDt4TcsWhUG8lOHJxhanlsNCJUxxivUK52RKVSrWMMeBzuSBb1Dn+PvRxSilo/c/PEcRJWwK//eD2zMCseueMFape9nx37ge3DWQIiBS+/lpB0jiJuzzvQNMQ3vsR6MywqK8++bn8BvQwP1GwFA/HkNp39mksixYPFHrPiDFdWLUJQ8vOZm+W+X+32mwe8Jey7s2j5EDzJiL7G1FHJ8jUR0m0r9Byvob/SHmkq1HBxIt9N14y3ZuWu1QV5dNn4Oq2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X4DBF7GfdUGPwI9vJrQJ3r5vLndXgeprrwOlvDNCmu0=;
 b=Xbf++SO9KnbpICz1kUYhFtdKl4dwpuzmMcQ4czI7jwCFF2bvsKqha8PJw+toAdPlp1p2p1r4CArp48qF3/qj0SB+Wo2Pxs0h/30wAOAPqgV/D5Il5qoDRLhWgR5F7d6bN1KxElDmP5sQZmqfOW+cpRn+flJ09OARaqNfih2HKgkov+jTBW9S9qNIiXQ0qEj1FYFwyG7MSSaGJuWyoNfQMn3Z6rncFl8nPLAOua7sdnbx3iv49g1lWoeaZjNhtnFw0tEXIGy3zqn5VQB0wFic6RpksuRKmwhzsNkcr0XYAoGGFaiGsZiOjQCCG35jKN9UPDcRy/7fB32nZAZQv+nW5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X4DBF7GfdUGPwI9vJrQJ3r5vLndXgeprrwOlvDNCmu0=;
 b=Hif9ZAvF31w9MGeqzJBpuAK6z2nzxz7DpPsCOJZniqKyvkfYLZP3YvHcQoskaqYcqmpmao2HX7Vl03NjMj4we87/Fvs56bV2kh0DfYEip4KDX1cKm6iMxzuLyo1ARBSwAhUXzfNLXCdOjVMUttqcnNE2nPj6BPmWSsBd+Swz0DI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM6PR12MB4044.namprd12.prod.outlook.com (2603:10b6:5:21d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Mon, 25 Aug
 2025 16:47:11 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9052.017; Mon, 25 Aug 2025
 16:47:10 +0000
Message-ID: <f1ba9808-64a5-4d64-a4ef-b2a95cebae94@amd.com>
Date: Mon, 25 Aug 2025 11:47:08 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/5] drm: panel-backlight-quirks: Add Steam Decks
To: Antheas Kapenekakis <lkml@antheas.dev>, amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 philm@manjaro.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20250824200202.1744335-1-lkml@antheas.dev>
 <20250824200202.1744335-6-lkml@antheas.dev>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250824200202.1744335-6-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR01CA0011.prod.exchangelabs.com (2603:10b6:805:b6::24)
 To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DM6PR12MB4044:EE_
X-MS-Office365-Filtering-Correlation-Id: a6707dd9-4f8c-4b5c-f3c3-08dde3f70931
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N2l1NmloUmpKbUNkK3RQQUZadzhrTXhlRitHaFZBR1pwQUFpZjhhanZtdGoz?=
 =?utf-8?B?bDVJL0dURXpWakc1N3RIZEhNWUUzeGtIMDAxcTJaNFJsczJ3TW05dENwVGcr?=
 =?utf-8?B?NWtYNmNiNnp6d0xIOGRWdlljZi9xMXQzcm10aFVUY2oyMUptdWFETWJQaXBI?=
 =?utf-8?B?UlFmbDRrNmIxN2dLeFlUd0M3SmpSUTc5bmpxbFp5c0RMUmlkQ2RkU3RzcHU3?=
 =?utf-8?B?M0dIR3R4SkN5ayswUlQxTnNsSlFzc3UyUW1IR3JncXFEV1k3WkRoQU9BNVY2?=
 =?utf-8?B?NGZUVnd1SittMU5uYWdUVERxMUIwbGVyUnlKZmR0Y1doT0ZpYktFc3JWUUdh?=
 =?utf-8?B?aUpxb3FiNlhQQWRNQkUxZGUyOUJwVElDbWVVUFEzdHBIRm9HTGlLVEVHZ1JK?=
 =?utf-8?B?ampkL21xTmZjdHoyczVIbGtobVpKa2ZrMlZIbkp2YnJzaHYybGg2UHF6cFhS?=
 =?utf-8?B?akJSVkhHQnFpcEowaTFXWGpmL3NpVCt2bytndE1NNlcrSkUraE5pcThYT0Jh?=
 =?utf-8?B?QnNoVFBRcFUvVStDRWVkTlB4NlhDK1FRbTMwTE4rbmpBQjNCelU3cDNHcTRw?=
 =?utf-8?B?TEd5TDdyNnJ2ME9jRjlEcUE2b1psZEZQYWh1NGsxbW4xeGZlNEdYUkNvdGxl?=
 =?utf-8?B?NUlaQnAxb3JNQmJiMXBCcGV5QmFRR0I2WUhuWjdzZGVscFFIRi9jQVJXaTBC?=
 =?utf-8?B?SUFvNXZGL1dJbE43UVczQmxVektncHM5dFRPVkRqTCtwMmNGNFMwK1hLcURQ?=
 =?utf-8?B?ZVJ3bUw2d2RzOGdwZG5LL3RwM1gzaHY2ZUcyV29EOHh3M0srTTVML3VrR0hF?=
 =?utf-8?B?ZzVxZmdoSkQzV1R2bWc4M2FzdXdDb0ZYY1hrd0NkMmpFNndpM0MrRlp5MXhx?=
 =?utf-8?B?dm1Zanl4dTNCU1U3TmNEQjBLdUNsMGVPNTl4c3hpYXd2NHd3Y0xBOHVZSEFD?=
 =?utf-8?B?NCsveFhySHBEZUcvQWs2NkxPVXlHdUxTQ3ZBeHNJcDgvUGpsZGc2bk5pd1Bh?=
 =?utf-8?B?U1Uya29OSU9YSmdqVy9hKzlKbndhazB6a09nU3NFZzlBRTRvekh5aXNocmZw?=
 =?utf-8?B?U3ZBM0dpcVUxQ1dxS3Fsd0RobHg2RUtLZE1ibW1VcjBlNHhNejFVSGdGVDkx?=
 =?utf-8?B?R1RFVzRQTFZ3aGZSZlVtVHBCaWhKd2JFamxJeUgrSG5qbTI1cWxTemM2clBn?=
 =?utf-8?B?OW9RUkdPZnJiMDZoL0hnZkhZOWwybGFCTUcyVTVoZ2FvSVZsTEppSGlta3Ur?=
 =?utf-8?B?dWZDalg5WHpJaGdEYnZ1WnRDYnY3dXpqQUFYb1Y0dGhLNEFVVlY4U0xHczVY?=
 =?utf-8?B?SktJSG13ZWQxYlZxZDJzdm5KUUFYOHF6Sm9DY3c4ZWtaQWhOT3Q1Z2c2WDNQ?=
 =?utf-8?B?VWI1cFRTSDUzOVJjSEJteTBuU2lJN2Qyb1dDZURySkxReVRSUFMwY2dMOTY5?=
 =?utf-8?B?a2NBMTlsRXk1cWpwU3FvU2FNQndYTFAxOHp3TVgrUTRWK0huZWRabVBPaU1n?=
 =?utf-8?B?bmp3QzI4ZFd3WEc0TTdGenMwTlhtK3FGa0FXY1djMGs0ejlweHBuaGtCU2Nu?=
 =?utf-8?B?Z0kzSXBNZUgyZVlvckFTZm1CeS9iWE5hbnpPYmtIR0lPd051OXV2SGJObFpZ?=
 =?utf-8?B?dDJWVTJ5ak5pdDlrd1V4OEhUTGpxUENYaFoxMTY0TmZOWVQ0a21ZRG8reDUz?=
 =?utf-8?B?N2JHS1REbTZFRmE2WkI1a3JYK0lzbnREMWtiOU5OL01vck9FQWRsdEZyREFD?=
 =?utf-8?B?QkRKRFpkMC9DdTAvZko5a3NhL29OM3RGREg5RkdwWXhyQllnN1E2b0gvajN5?=
 =?utf-8?B?a1FYMFlLRW1uV3lnTXVCK0taejNEM2JwQjFiYWdEa2dtNTJHYVN6Z0hlTHFj?=
 =?utf-8?B?RzdWa3FrUU94Qk81L2hCaGRQL1R2RWR4Q3dUeGdQMUJzc2tqN2dzV09WclhF?=
 =?utf-8?Q?O2kDQkoHGrs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NEVlWW9HWU1JcXRTT1VIYnowS0ZQNlo3UnNLQ29XR3BjTktvbjgxZkN1bmc5?=
 =?utf-8?B?aUZGZTdJTVVmdFk1bGJlTnJpL3VCc3JjTDhVamlaTmxMWVdBVVlyczNIK2Fh?=
 =?utf-8?B?ZW8zUFlNUzh4U0F0S0JWVkFFVXpvbGdXRFIwdXhpaVhYMU04K1daSVE0R0lK?=
 =?utf-8?B?WmhIRVFVU2x1a0V4b0xCNkwyMXdIbEE0ZS8zRU9YTG9BRjEyOTFxV0IreERH?=
 =?utf-8?B?ZCsrSzRJeVVVSW1vOSs4TW5iMEYydlZ1ZWpUU1lyZ0JUWUZraDhmUS9jT2NY?=
 =?utf-8?B?U3RVMlBBWGM2dkJyeFdpVFkycDRPZkJTQ3lhVng3ZTlORUtiOVdNYVpJaHlX?=
 =?utf-8?B?eFI4UDhaVWdrRWczOG1XR0hYRlo4bFY2S2VEdmR4NUlnRHpEek1udXhoL3NE?=
 =?utf-8?B?RS8zRTc4bUlLOURBY253RjZSWGZOVVNIenJiVEJUL1BweHFBWUJtVGt2R2pQ?=
 =?utf-8?B?bHZ1OVJSVmhnTnBRcFF3SlRwNWYwNFdUSDVNZHB6TEtEVjNSNnliN1ZaeTNW?=
 =?utf-8?B?dTIvQ3M2QTc5dFNyRVlUZGZ4N09TK0Jva3ZQdUlWbmVVbCtONWxqVUFZbklt?=
 =?utf-8?B?eTR1aE9GaWVBM3hXWEVTMXNzclRUZzRWd3VPL2U3dU5kZy9EN3pKcmNkaE15?=
 =?utf-8?B?R2VGaXNyUUVPQ3p5UzR0UTFCWDFoeVdKOUREalM1MlNUalVocFJPQnVSTFpH?=
 =?utf-8?B?aXNkTHhYaWlqYWFSVks1cG4xWlNSV1lNMHl2QWhST0JzYWMyVTJLKzhYeVFj?=
 =?utf-8?B?MHBlZ2lEQTgraEN0UkM0Yyt1QzJhYTR2ZzhjNzZQSjhvcklFS2RubzJIMWlV?=
 =?utf-8?B?OWFBdVdVZnVuRGFvaWlzaG1lNzdqS1FRbkEra1R3RVUzeW1QZVdNTlVCQkZu?=
 =?utf-8?B?dkdqM0VQTUFMZlFCUWRZMmdBOWhMejRUZzdiL01tM3BhV05SQlZXUHJkcGdo?=
 =?utf-8?B?aHdXMnhiZkczOWp6KzZJMjN6bGxGbUVXaDRtVWlSUVFFMUlaUE9UbG9NY0N1?=
 =?utf-8?B?ckxVRXluL1F4UnNkNTdHbFNuR3RHS2RFVENIbzRySDV4M2ZudGppRUJyNzFI?=
 =?utf-8?B?NzlFNlpTNkFSVGRvd0g5UjBTeDhjUllzMmpHMGlEVUtKQzJqZnpxTk85N3VZ?=
 =?utf-8?B?aXV4STZGaTlYZDluY0dPcmJiRDVLUUxLSGcvREk0M1l1WExNN081UlVLS3dh?=
 =?utf-8?B?TnA2cVRnQVhiVzRFWHFCR2NXR1I2b0JtYWZ0UTIwUHFxTU5hNWJKUGNHRVV5?=
 =?utf-8?B?NDFuTFJuOFdwcTFqaVdzOWorMnJiUFArTGgyVk5oMzZuY1pGWURPTko0eklB?=
 =?utf-8?B?VlRIYTNycWV4ZGd1dlExenVYZFpyK1cxeFVyMUpTdUk3MUNvU2RMVWsvVk9I?=
 =?utf-8?B?VExkMHJ2OVoxaHhaTFR6bEZiUFpTN0NLZjQ3RGU0NmJVTEpBb2JRNDBJeFhy?=
 =?utf-8?B?V0lIVm1HUmZ4OG5kZWFJMkJqRC9FMW1hVnl1VmxyUWt3RzVxbjRzMlVtaCsr?=
 =?utf-8?B?bzNObjV1ZERWdUg5S3JLREFuNjhuenI5dGpLR3luS1BIRG80T0lnQkIyUGpU?=
 =?utf-8?B?QmE2YTBpNzBacm56cWR1YTRzVWFoeURQWERiV0FweW5SdW8wNTl1VmZZMDdr?=
 =?utf-8?B?UGRTdFZuUXJhZ0hWRGhaYnVvb1luS1c2dDZiWEI5ZXhuV0RBOGNXQlpLQWMw?=
 =?utf-8?B?M2o4emxCMXM1dnlqZktrWmY0bHV3aWZpZXhqczBTbWYveTVpQXg1VEwraGtS?=
 =?utf-8?B?RDM2TE5oUkpyL3dMZDhrdnJmdzJFNGdrTENaN2k3TFV5WDlTa0RqS21PbVBV?=
 =?utf-8?B?bGZNOUthWWZja3VuMnErZkpDeW4rQjVyVGVXMERJZGRCa0pjcnlNSnJKNjlV?=
 =?utf-8?B?ZHpWU0pJSi8yN2lWMjZaNlE4TTd2ZFdoYTJEcnRuRDlMeDFDR0lYcFV3ZDYw?=
 =?utf-8?B?dnVxTVEzRUozUVFaY1J6OXlHNmRDTUloVkVEYTUyb25VM1R6YmdWUnQzc093?=
 =?utf-8?B?NyswRkpDZTNWRzZDYzJIcmkzbXk4d2hlQy8rZ0ExS1diWFBZamZwMitoQity?=
 =?utf-8?B?Um9tTUkzMjRNSWxUbjY4WmJ3bnVJSjRCb01yN0dPZ21tdU9yUkdEVjJLT2h3?=
 =?utf-8?Q?NeomL6Rtn4k9uuIChh1yC2gBa?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6707dd9-4f8c-4b5c-f3c3-08dde3f70931
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 16:47:10.9020 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AyRbYDxvytgu6mbe1klisaqti1uEJzbdKxjeFBcQxRL+UitI3k0SkXqxL7NpBVmuKoidjCJTZfq0D0C3mKXzEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4044
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

On 8/24/2025 3:02 PM, Antheas Kapenekakis wrote:
> On the SteamOS kernel, Valve universally makes minimum brightness 0
> for all devices. SteamOS is (was?) meant for the Steam Deck, so
> enabling it universally is reasonable. However, it causes issues in
> certain devices. Therefore, introduce it just for the Steam Deck here.
> 
> SteamOS kernel does not have a public mirror, but this replaces commit
> 806dd74bb225 ("amd/drm: override backlight min value from 12 -> 0")
> in the latest, as of this writing, SteamOS kernel (6.11.11-valve24).
> See unofficial mirror reconstructed from sources below.
> 
> Link: https://gitlab.com/evlaV/linux-integration/-/commit/806dd74bb225
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---

Directionally I agree with this commit in favor of what the downstream 
kernel tree has that you linked above.

But I would rather see it sent alone and not tied to a series to 
overhaul how quirks work.  If it's sent alone we should be able to get 
it reviewed pretty easily and in drm-misc-fixes.

>   drivers/gpu/drm/drm_panel_backlight_quirks.c | 17 ++++++++++++++++-
>   1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_panel_backlight_quirks.c b/drivers/gpu/drm/drm_panel_backlight_quirks.c
> index 78c430b07d6a..5c24f4a86519 100644
> --- a/drivers/gpu/drm/drm_panel_backlight_quirks.c
> +++ b/drivers/gpu/drm/drm_panel_backlight_quirks.c
> @@ -73,7 +73,22 @@ static const struct drm_get_panel_backlight_quirk drm_panel_min_backlight_quirks
>   		.dmi_match_other.field = DMI_PRODUCT_NAME,
>   		.dmi_match_other.value = "ONEXPLAYER F1 EVA-02",
>   		.quirk = { .brightness_mask = 3, },
> -	}
> +	},
> +	/* Steam Deck models */
> +	{
> +		.dmi_match.field = DMI_SYS_VENDOR,
> +		.dmi_match.value = "Valve",
> +		.dmi_match_other.field = DMI_PRODUCT_NAME,
> +		.dmi_match_other.value = "Jupiter",
> +		.quirk = { .min_brightness = 1, },
> +	},
> +	{
> +		.dmi_match.field = DMI_SYS_VENDOR,
> +		.dmi_match.value = "Valve",
> +		.dmi_match_other.field = DMI_PRODUCT_NAME,
> +		.dmi_match_other.value = "Galileo",
> +		.quirk = { .min_brightness = 1, },
> +	},
>   };
>   
>   static bool drm_panel_min_backlight_quirk_matches(

