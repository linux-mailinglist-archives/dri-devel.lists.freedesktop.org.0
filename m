Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QD79EFrXjGm+tgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 20:24:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B43127245
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 20:24:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ED0F10E63E;
	Wed, 11 Feb 2026 19:24:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WUO/oTLH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010044.outbound.protection.outlook.com
 [52.101.193.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F0FB10E0DC
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 19:24:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ffOqXXPxCfShsAt3H3HZ6gX1XKokuVFv2ebz1PfQ6LmshxUm50FwGB0DS/nQf1lMw4CtItQqn1lEvQcombpBC0VpTr5W23vB/HNDl40v91KqN3O3of0zvDrPX2rqYCEytdsvXM59TR2CmuM3fRae60kqwPyRbncdXFRYrnZGNYJSUOx/yoF3PkVFqixXXpNN3Y9ghmcXapO4JtXdZTNGtvLivM0/qqWoEcH22ecxeRgiscuiK/Fg7DcXjsOH5bO5gIUJ6+sbC1wit8o9o/wSjfpMiofbV+BtZS4m/jcfk7G+Hd+sxYG+gn+TNi7d5AetvX5Mzcjtt7zOTfxyZo5DTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+G20epkHCHghblnxybdwAR7XeetGORkBr4G1n8fMz7c=;
 b=oMl6ial6EDf6AhUgyDpuXjzWPnUkHo3zz6M+ubLFUUOeHrWsad1/s1lHsXT8esGTlsPF9/Up1k0hIckPFnVREdcD4NSuw+1FOo4dOsbHJmZeITSgr6fUmseu14jOv/6rQlh5VRnJ/fYcB8f9qKXgBFUArNihSz6qNt3DHOJC4Vf7g7mtVLJy3VhNjeMpKQmZ7AODeVd6/VW5htR4dfuJ84d4o+7Dpx7Eg7uCjN9VdVy29wchUBCaStFEuLeg+r7myEWcTBoy7Gqm2qtthCVxVtuMK8/7gN2l9peOLaFnwNMBJlZoDuZ85wDB7FKuVLd0/fw2INcjcjFkD7ih2lqNdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+G20epkHCHghblnxybdwAR7XeetGORkBr4G1n8fMz7c=;
 b=WUO/oTLHa5O/2/kIBMnQWSSY9gGQiV7e4RLreo82Nm+ye9iQHc0XSr9WOduvMURxi+rfulWQ65V0ACi9HD1WK8Q/ywQg8XFLSsvaktd0nlCI+oew/zMjU/hjXH+NC2wGeXw2Iq9XnL2AXxypI3AYdKMONirjSzvraor2HTQ45cU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH0PR12MB8005.namprd12.prod.outlook.com (2603:10b6:510:26c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 19:24:02 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce%4]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 19:24:02 +0000
Message-ID: <9bbdad18-91a8-430c-8ee0-b0f8d4747e58@amd.com>
Date: Wed, 11 Feb 2026 13:23:59 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] accel/amdxdna: Fix suspend failure after enabling
 turbo mode
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org,
 maciej.falkowski@linux.intel.com
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com
References: <20260210191652.312000-1-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260210191652.312000-1-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0040.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2d0::8) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|PH0PR12MB8005:EE_
X-MS-Office365-Filtering-Correlation-Id: b1937f38-5c11-4c2c-4926-08de69a31cfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WWtLVkRCSGV3YnREck9qSXVWdFU0QkFKc0RVY2ttd3RmMzNjZ0t0dnlNTEpu?=
 =?utf-8?B?T3Rpb1hNMjVXOUhyWWJNOEtQTWo4N1FFeHZzK2JFSURpRlc0bWk1KzY3Umda?=
 =?utf-8?B?amJCTlRMbUJhOHVYeW43VEtZc2pWUStlaEVoUEUzMHFETHIvS1lnbTBwd3BV?=
 =?utf-8?B?K0IwOUVkYURtalF0VURUK21SZmY0MGZSNHQvSXdVK0ZCRDlZeEdPdS9OckRn?=
 =?utf-8?B?NFBsaUdwT3Z0QkJaWHBaL2pyZk5PNDkzcStNekNVRWF1QlQxSlB6cFRrUFY1?=
 =?utf-8?B?YTJXajIrTkYySVFuZzhrU2UrQllRUDdnTW1LVSt0RlByUlRzZUMreE9GeEto?=
 =?utf-8?B?OFRBVCtnVjArTkFadWZkNXhRc0ZKYnU3ZGhoN2NPMjRrWG5SMHUwdXZQVWZ0?=
 =?utf-8?B?R3ltUFBYdG5DNkRTZXF3Q3p5dnpRLzJDRklaaWVYMmFQLy9qSzV6RnRhS1dT?=
 =?utf-8?B?R2Fpa0xSa2hqOWVndUt4cFU1M28zMnFNY2pscERnMk5FSWZqZjliWnpYRVdF?=
 =?utf-8?B?MG44cmtjNEh2NWp1d090MlI4bUNrMWhKWVRsL0dEZmtoWEYxQUFuelVoeWI2?=
 =?utf-8?B?c2ZJMzhFaU0xSnhlNExrTVlybFBGTElKQS9lU29vVWhzMFBZVkR1aUNHQWEx?=
 =?utf-8?B?NVZYanRjM0w1YXZObzlmQk16TDFOZklncHFVZnprcXVVMkY2QXNQMkltQmNN?=
 =?utf-8?B?c0hYd3FiSi9xTVZNVUcyNmFaTWYzNTY0SEgrOStTS1VsbENTWFhSQ1hLMFM0?=
 =?utf-8?B?cHBlbHUwWUNvZDdjQTR4bkhBcVlxZysxZUpzMHRBNmQwak5lN0J5SExYU281?=
 =?utf-8?B?bHdYQWQ5aWRhZ0tCYzJFeHAxSk9OSUdma3d5QzNYbUtKa1lZMkRnQ1J3dnNr?=
 =?utf-8?B?MnpyYnJtS0hEdkNSTUVPNzlySldURVBPcmp4eTBOYnlUbUpQSGN3SmdwQ1lz?=
 =?utf-8?B?K2g2eFltOUtzajR1b3ZGZ3BDWjNqM2ZKMjBxUU5BV013TXdhR3cvNndBUFdo?=
 =?utf-8?B?UjhWa051UGs2ZkhwaEQ5K0RaMFRlb2JXaUthMVpFNzdmZmJWM0FTY082QXhR?=
 =?utf-8?B?Rm9lNEd4OTRsaHM4NXdJNlNva2NiS09VbkFLUWtiOFhnV2hYVHJlMWdEdU1S?=
 =?utf-8?B?Tm91M1hkTllldzd4M01WU0ZwaE9sVlhYY1d0M3J2OHduNkNTVEFmdXdablQx?=
 =?utf-8?B?UjUrSlJqdmxzZEZJdGdVclBiS09IRE9XdENsNUozSFJ2czF1RnE4dzF3VEY1?=
 =?utf-8?B?N1g2cjlkUzM2RE5TM3dHYm1WVTNDUVljTXoyOEh3OXJmcXUwT2F6THVhbCtF?=
 =?utf-8?B?QnBJeUlvTVF0TVBvNGV2SnZ5M0YrZmlmVW9jY08vK3lBcDIxc2trKzYwSG80?=
 =?utf-8?B?MGVwQktmWXlTa0hLdHhUaGk5YXNSOEdZcXNYZEd4b2x1d2NXOGZJMmRzVGov?=
 =?utf-8?B?aXVRUFZ6U3hGVHJoUTg4dnpTemhodjJnNm1jQndtaXRYcEowTWFCWTM5Vitv?=
 =?utf-8?B?bW1JZEluMWdTOFBKcVlOaWNXdUt3WGwzeVZvTWE0YThXVzhtWUxHcjFPSm1m?=
 =?utf-8?B?TWhlcHNmdGhpQkZPdWZHQ0ZURlBJU0NmNFdyUUZET0E2cEZFVEpRN2k3dGl5?=
 =?utf-8?B?SngxWm5leVhRKzIvMnF0WTc4VE9OaWY2MXkyd2lqWk4yWm42ZjhoNFZUNExw?=
 =?utf-8?B?N2lpUHhlclV1VmtZVk92MkFzRlNMSUI2VzUwZHRLMHk0bE1BZmg5VTJXanVz?=
 =?utf-8?B?Q0ZURGwzOVpyNWV5dGVTUzV3SjF6WFdsK0g0VGhFMk8zUDZqV2lyc096cTJO?=
 =?utf-8?B?cFpxOW9FYWhMaHNvbnBFck9UNFVwNnpibnZwYk8wR1FoUUlwdHlxU3YrSUIw?=
 =?utf-8?B?a2NCSjA5QW5ocngrWVpna2Y4SGNtUG0rTTRKajJQeDMweXBDUGVVYXl3dGlk?=
 =?utf-8?B?N1JMU1pKR3hiWk4zRzVoM2NRenJ3ZmZVT2MvRHJiZWpWQ0ltcmZoZXFLNUg0?=
 =?utf-8?B?dU0rcjJRRE5EaVI5a0dzRnhVUW1aV054SGFKZE85Wnk0WWlUa2FqTkwvZTRh?=
 =?utf-8?B?bmJTK0ZwZzBCMDhUdUxPZTJHYXU4MXEyalFtaGFYblZvb252NXV3dmorOTh4?=
 =?utf-8?Q?u4Nk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDFWZklpVkhWNTd2ZkRCYWQ1M2tlK3E0T254UllNanBZZE9FUlUvckVjU2NN?=
 =?utf-8?B?c0RRYzFUbk53aExuNXNTYmI1cmxNNFU1NWJiYWUrMGpMcXA3U29vNk4rRlpE?=
 =?utf-8?B?THJDeFMvQlRqdDMzaGl3VmZGM2JqWnVxM0JPdlhYb1N5Z3JvRm41WlZWdjBa?=
 =?utf-8?B?MnJlVUdlM0lrdy9GNFhscHBpMEJOK1QwVlBLWVBKUG41N1NUM3pVUmkzNFl4?=
 =?utf-8?B?NkdOQXlsTUovWkZmVlVzYVhUbDBhdFRUcjdGYmMrbzhDU0JpVXpNZDdIWklD?=
 =?utf-8?B?bW81ZnNZMDBpRjI4MWlNZ1dxNWpibmxUTUpqTGhwOEJONEZuV2xjK2lic0hz?=
 =?utf-8?B?NHJRR3BlcnFFYk5sWTRoT252dkhGQ1hic0w1SklnaVlseGIyMm16ZE1VSDNZ?=
 =?utf-8?B?UU1zT283eUNkTDBkRXNoNlhiNHNXbUZzOFlwcW5KUXhNZWR3YlN2bHl6SHFl?=
 =?utf-8?B?WjA2MnBtMFhDa00vTFFZWHIvSFJrRW9UK0ZxNUZJWU5rNWJFUEFCbUlnTk90?=
 =?utf-8?B?VE0wbmFHQTZ4ZWtIb1JQU3NVUHMwS0ZKcVpPOXNGYkY5MXNvVXJBcE9qU25q?=
 =?utf-8?B?UHFoblAwOHhvYVZvd0VqN2lDTFJhWEtpQlgvNkt6ak1Dc21oYVJGVlNpcjNs?=
 =?utf-8?B?QmRPcVZsYXNKc1N3SDVqUzQzSHFlR3JCQXNHRXhidlYxU2RtMjlJWWIvTG9n?=
 =?utf-8?B?bnhHZlRQblp3b2t0RFJ5K0NDR1RaamJZa2RSNFZZcnhqVFRoUldNL1dkenB1?=
 =?utf-8?B?RFpyUnE1ZHp0dDE1Nm1TSFVqYWpMa1dzOHZBdlcrS291WS9CQm0vKzBVUVdI?=
 =?utf-8?B?Uk9NR3lSRHBUVkdqNGlPc2tSWXo5TFR6ODFsWUNiVVpIZElYQUxjWFBVZGxm?=
 =?utf-8?B?bmlyMThwSlJiTkdyanZtVmVlMjl6MWMzRUZlQVcyc3AxeTBRVXYxcitEd2sw?=
 =?utf-8?B?N3YwYVlsellxVkNDeDdwOVJQU1IzWUpzUGU2a242L283UlB4c3c5V1ZmYkg2?=
 =?utf-8?B?MUljaUJYYXQ2WktyRWYrSkJ6SlJRZUF5UW1HQ1VoNW03ZHQ2U3krZjY2RlJI?=
 =?utf-8?B?SXlVUnY1WE9UK2NMdStjeGpwVXc0bWZ2Q1ZzSU9qUjZKbFJGUk5WdGZDaE5X?=
 =?utf-8?B?RzcyOUNLNWRlWHZFQlp1MGtFTXpLN1gyRGpRYkpUL1ppZzJNbDc3ekwzYmpJ?=
 =?utf-8?B?dTVsTmhSaHNlbE9yQlE2d0I5QnQrbEZkRkI4WWFlTHpJd3dCampiME1KQzM4?=
 =?utf-8?B?YStZOXJiNm15SEtQeDJ2TElIeTZzWHVxNFgxSTcxaWxYZUJxNExuOXpRQ21i?=
 =?utf-8?B?VG1uQ1ZKaXJzcm0vOFNzWlBycGxtVUZ5RzNrSlczZ213Tnd2KytVUWordHpp?=
 =?utf-8?B?M2lKbGJ4d3crREUybVpLbmFwQTBqSHBwWjMwS09hUmpPVmZkNzBsRWRRTytP?=
 =?utf-8?B?NTE0bEdCQmFkR2tKQ3R3L1o0enF1d0MrVGVnb2lDaXdmenBqUWFSWmMwd1pM?=
 =?utf-8?B?ODZla3dhby83S1psbCswODNVbVJpVWZLZi9KRHQzM3BGdTU4TW94N24wMWNj?=
 =?utf-8?B?VXhLK0RFZ3VjRWxhdGM5VTF4MTR4UlpEUlJydGxuZzFXSWFkd3RYREdRTjJL?=
 =?utf-8?B?eGUyWWIzU0VHZlcwdmt5bUVaVnF4TVhFd0h2aFBWVlpiaXdRU2ZJREIrOUVL?=
 =?utf-8?B?d1lGaFZYa1pYcjhuQWQyS1loaVVLeFdDUmIyYzJKSkxGazVWZWNvWjhZN1J4?=
 =?utf-8?B?VEI3TUtQeU9lN1BpVklpMDU1SVMvSUFHdXFCUDZlcklaNWt1d3JkM2xYcGNM?=
 =?utf-8?B?aTRGK3Q1eGFzSFBwdW8vTUJjQnZrMjV3OWRueUt1MmptWHE3NVQrRmxtWHB1?=
 =?utf-8?B?VmViNUlPRWV1TEs2K3JjWkJubUpJcnVhdStycmpwZkp3RTlreVVsaGNoOTA3?=
 =?utf-8?B?RDI4OXg4dFB3ckhLbjZXUWd3b0ZOYWpWOG4rYy9nWXdxdUxtVEl5enNLSk9u?=
 =?utf-8?B?K1NXdy9kenpTM0pWUzhIVUVoTUpTbXQ0ZEgxY1ZpRDNEMDUvbnVhWEZsTERo?=
 =?utf-8?B?TlQzVHF5Yjd1Z2l1YXE4bTVydEZXeUQ3TThhdStYaTZuZGxzWWJXYUxLZSt2?=
 =?utf-8?B?MURrbzBZaE5xdlNRaU5IQzVyNmtHR1hDNWk0OU80MXcvMmFJdTBsMU1RTkNP?=
 =?utf-8?B?N25ob2dGaWxpSVIvTHY1OUVmSzVlbENmY0pTVGM2Z2hpRitPSmxDbHFESERX?=
 =?utf-8?B?TlpkV0pON010aXUrN2puM2FOLytVa2JVdy9JenBHdHVUayt2TTZpNTUyODk0?=
 =?utf-8?B?VDl0RVptRHJYOWxpczgzaEFSMjdXZTJ1dEZYby8zUnBDWFZFSkpwZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1937f38-5c11-4c2c-4926-08de69a31cfc
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 19:24:02.1843 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F766VNLihN7A+07FJnEVYjlDqBl6EblQJmYA2ttX+5icrl5cntqVfNAN/oB/ftGQADZcnVsdvaZNJeuDgfOObg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8005
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
	FORGED_RECIPIENTS(0.00)[m:lizhi.hou@amd.com,m:ogabbay@kernel.org,m:quic_jhugo@quicinc.com,m:maciej.falkowski@linux.intel.com,m:linux-kernel@vger.kernel.org,m:max.zhen@amd.com,m:sonal.santan@amd.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[mario.limonciello@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mario.limonciello@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim,amd.com:email]
X-Rspamd-Queue-Id: B3B43127245
X-Rspamd-Action: no action

On 2/10/26 1:16 PM, Lizhi Hou wrote:
> Enabling turbo mode disables hardware clock gating. Suspend requires
> hardware clock gating to be re-enabled, otherwise suspend will fail.
> Fix this by calling aie2_runtime_cfg() from aie2_hw_stop() to
> re-enable clock gating during suspend. Also ensure that firmware is
> initialized in aie2_hw_start() before modifying clock-gating
> settings during resume.
> 
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
Fixes tag?
> ---
>   drivers/accel/amdxdna/aie2_pci.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
> index 5b326e4610e6..0d41a6764892 100644
> --- a/drivers/accel/amdxdna/aie2_pci.c
> +++ b/drivers/accel/amdxdna/aie2_pci.c
> @@ -323,6 +323,7 @@ static void aie2_hw_stop(struct amdxdna_dev *xdna)
>   		return;
>   	}
>   
> +	aie2_runtime_cfg(ndev, AIE2_RT_CFG_CLK_GATING, NULL);
>   	aie2_mgmt_fw_fini(ndev);
>   	xdna_mailbox_stop_channel(ndev->mgmt_chann);
>   	xdna_mailbox_destroy_channel(ndev->mgmt_chann);
> @@ -406,15 +407,15 @@ static int aie2_hw_start(struct amdxdna_dev *xdna)
>   		goto stop_psp;
>   	}
>   
> -	ret = aie2_pm_init(ndev);
> +	ret = aie2_mgmt_fw_init(ndev);
>   	if (ret) {
> -		XDNA_ERR(xdna, "failed to init pm, ret %d", ret);
> +		XDNA_ERR(xdna, "initial mgmt firmware failed, ret %d", ret);
>   		goto destroy_mgmt_chann;
>   	}
>   
> -	ret = aie2_mgmt_fw_init(ndev);
> +	ret = aie2_pm_init(ndev);
>   	if (ret) {
> -		XDNA_ERR(xdna, "initial mgmt firmware failed, ret %d", ret);
> +		XDNA_ERR(xdna, "failed to init pm, ret %d", ret);
>   		goto destroy_mgmt_chann;
>   	}
>   

