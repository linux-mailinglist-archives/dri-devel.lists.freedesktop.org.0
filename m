Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GRNEtptjmnuCAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 01:18:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E1E132089
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 01:18:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66D8310E0BC;
	Fri, 13 Feb 2026 00:18:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="wagXv8KB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012054.outbound.protection.outlook.com [40.107.209.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A638810E0BC;
 Fri, 13 Feb 2026 00:18:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mhyM5FAF5Mr5h87Jc894qBxEYUp94QeXtAvR34ZTBhHuWyyThlUnHEdVZ3W8/ZnSadIMqhk13NmuA7omQI04w1jeOtJBN01tUowHMlIrqQXh+D7eb+zIC/Z3bD5L67H4Cz/KGPTZIKMY3NdCr2MxN8rvdKjYp3K/kP2geAyNBnIDq6+wIuOcF2sW3CYrgqXseWlwiAyz48FwaRQDXhk6GFwISLojIIt4Uz69ElDEvXltFtelSykUf+lqSJrm9CI1ZYi9s+RE1ZoOblMwJyYMokkYyCAs1zebiLy/rJKVG8BxfZ+9ImqBB2uI8v2Ve4amFaBSI2DhE6BO9HyCYToxww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=izgU/k1oRwoXMJXoNYxezQiihyS+t90EqGRjURNaTM4=;
 b=FeUS5LasT11JuqCClM4W9E9NiplPmNHDXVh+nwnBmZeQ9hwbpof+xapq937mOL+NSBnU/mbjuAY9nNyjjCl7H5Bmm2xLTawdv+0uP//SaCkZKKGyWL9/b1UzoRly1NNmkMLZ557rrhT6IssJ/x7HSLGV1CwlMM6tqQD5EhRS77UpJtt9PrXMlAk+msCqbpPhF4NOT+nZ1yCnMq/feEPKPv4F7dtsahxUX4d3uMyii+SRYi5BI76D3tBadct+LgN6Q1hFYZ9Fu59e3Yq/XANheLu0StaJ+1dZYfRi0efEO0sWoWe+OzTk5iwbQ33xA7LkJU/P9dZ8n4/7ClSNqEyrPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=izgU/k1oRwoXMJXoNYxezQiihyS+t90EqGRjURNaTM4=;
 b=wagXv8KBDar9XS2a3CmdyDMue0RUswd/nFaJLXdLQGD97eUTmN6r/NhxR0guG+ReUS6BuI7u25+nGF1b60Ijp/guN/Jo/Hu9mm4adE44Se3XqtKE1GTPC3L17fQjqUax1SdUxzL3gd+HIQE/QaZcaPSQp1+hA5fyFXLhnELCmvo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH8PR12MB7229.namprd12.prod.outlook.com (2603:10b6:510:227::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Fri, 13 Feb
 2026 00:18:24 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce%4]) with mapi id 15.20.9611.012; Fri, 13 Feb 2026
 00:18:24 +0000
Message-ID: <2e359cd9-0192-44d0-886f-7f93a8b0a4fa@amd.com>
Date: Thu, 12 Feb 2026 18:18:17 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] drm: introduce KMS recovery mechanism
To: Hamza Mahfooz <someguy@effective-light.com>,
 dri-devel@lists.freedesktop.org
Cc: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Hung <alex.hung@amd.com>, Wayne Lin <Wayne.Lin@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Ivan Lipski <ivan.lipski@amd.com>, =?UTF-8?Q?Timur_Krist=C3=B3f?=
 <timur.kristof@gmail.com>, Dominik Kaszewski <dominik.kaszewski@amd.com>,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260212230905.688006-1-someguy@effective-light.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260212230905.688006-1-someguy@effective-light.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0143.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::28) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|PH8PR12MB7229:EE_
X-MS-Office365-Filtering-Correlation-Id: 38e9e1e1-1118-490f-d189-08de6a9566e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TGFwek1XYTRoY3p3SDdjNjI5RGlIdEt4QWV2cmo4ZmIvTHc3ZzhEZDdEUXRQ?=
 =?utf-8?B?NHh6dkZpQVlkN3NkVzJNZVJPc0g5SEl6c3V6d0tSNHpPVDlSeFBud3pGbkhI?=
 =?utf-8?B?aFpQUW96TVU4Z2krYjJYRk9OTmpWekJCRnQxMnJ1U25ENmp0SUo4VDBkV1du?=
 =?utf-8?B?czk1dFl5QU1aZDFSTjdYayt0MmxadENrejdvbklOL3luWHhUL0E5Vmh4dzI0?=
 =?utf-8?B?NTZSRDcwVGpiL0ZSaEJVdUR5OUN0TCtWYkZwOEF2amxTZGVvK1FDTmRDdmpm?=
 =?utf-8?B?TzhUUk5ZOER0M1JpS1puOVdTTDd1NHdzcE5xL2hqOU5HelFIL0NRZlkzNnlD?=
 =?utf-8?B?UXVMczY0bys4VEhhcGl6Rm1kdExSeTk5QzF3WStYTVFQOTFsVStySG1hL2pw?=
 =?utf-8?B?NXN0YWlOVkJXYUx5SkN3dFRrVm9WbmFEeUNvSTJhRzVqa3UrTW0yUWJNS2dU?=
 =?utf-8?B?K0lNTEV3bENSNFQxZUQ3YXZVRk9tUlh0d2JzSTVqL2RQdmtzOVZDeEkzWmpD?=
 =?utf-8?B?TUlUNHdTRG1OM2w2MjluVjhaL2RZM2FBSWdYUlUxUDl3eVFxdi9jSTBncnlp?=
 =?utf-8?B?VEFkN2lKT25BTHI0eVgzaEI1Z0wzb29VYnJFMm5tbVVVOVlDczhDeDNsZkVO?=
 =?utf-8?B?aWFRUWk5SHh6dVJKUVZyU1I4NmVVOFRZdVBuUDFkY2lJRzNjZHp3SGxqcVRM?=
 =?utf-8?B?ZzhvTkRFVHhoRjRaNWUwOFJHd2tjLzl6Nk5QRWFPYUUwc25FZkdTN0xONHRJ?=
 =?utf-8?B?aE53eVUwbzUzZ1RwVVdXaE5PZ3lQMG1tSHU0SnR2N2FLclQ5NFZSSmltTnZC?=
 =?utf-8?B?OTFEa1hnZjJLcUJiTmdQbWZneVQ3Zm01ampCMmJIcnRMMFRKTjhzaTkrckRl?=
 =?utf-8?B?K09HTzg2eVJ3ZXdIWnF4em5ac3RHd1h6Q3ZvS2ZLdGU1bXNzazd0aGlOeFhM?=
 =?utf-8?B?cjA0U0QxZ3pEV24zelVzNFFPdGZ6YW9PWXF3YUZGZWNiS001MGlZUlZMeXEv?=
 =?utf-8?B?TXNTTUNhaUZ3bWdsNzFhMTJEeHhZNGh3R1pKV1VFcXFYYy8xK0JHUEZOMTht?=
 =?utf-8?B?ai9mZzJQdE1UVUxqc09XdERCRTNlT2NtNFFieEJzNE9Rb1c2QzZ0NkZxbEh2?=
 =?utf-8?B?RFIzdXRicCs2ekp1SmpjVHNGUUxvbXhFSE5uQnpZU1E0eXg2amVrYmlKYTVj?=
 =?utf-8?B?OEEvaVkzdTU4eWRoZDNLcDAxbGNqdDA4ZzFMVFlKM3Q1TWVCYWVxSlJSSVNF?=
 =?utf-8?B?QnNuOG50SFVFai9ab1JmWm5xMmJYckIxMi9EMXBwVnRLdVdicWVaSnpmd0RH?=
 =?utf-8?B?bWV4MVdZVWg5MXFsN0ZkZUJLYjRFS0hrZTYyRS8ybW9IZDQwZlhJT1ZvUlBN?=
 =?utf-8?B?RXlOMEdtMHhrb0htNnhRZHJMT2hvNk96N2lSN09JTVdod2ZsU05McXNpc25y?=
 =?utf-8?B?OUlON25KdWxmdjRPM25RajJzOEV3bnZzYWhhWTBCdm14bHBSbm5JTGFnblRl?=
 =?utf-8?B?RmhlajNxR2ZucTdwR1NCcWRzMWhFdWlDYUFmU05IWUg5V2k5dzZDQ2dnNTlx?=
 =?utf-8?B?NmNxK0kxYWZteERkV05pd0tBVktsSS9kMHdPdTZFRGptbWVoOWprR2RyWTNY?=
 =?utf-8?B?MWRMTHFTS2luUjEzd1UxaVFzaXdLbkJSNjFBMjR6N1MvdDV1WDd4ZXV6dHMz?=
 =?utf-8?B?cnVtZGRJZjc4VHU3NlROSXZ5b1ZNRmY3SVh6bTBEMHZwSXNUQXZxV1NrMWcw?=
 =?utf-8?B?cXBSbGVyRWMvR1ExZExuWG1PdHhJeUswLzlQZzBWSzUwV1doS0xCSEQwaVFn?=
 =?utf-8?B?NDltZEw3YUN3Z2VlY3htbXdTbzVLZmRkUG5zUUl5dG9rRmczbWQwNFp3dVdr?=
 =?utf-8?B?NVgzUFdyc2MxZERleWNtek9SKzlpbHNLMUxmc042TFo0K1pRK3M4bmtaWlJh?=
 =?utf-8?B?MmtXa1pTWlNiMWZ4WGhkTkUwcllGUGcvVG1hcTd0US9OSEZ0VHJlemRsNzVj?=
 =?utf-8?B?OTBCZmtWVG9VRHBwaUNJNU9UR0crb2tkUkxkWm1zcFhwQ1FTNGxOSzg1NDlE?=
 =?utf-8?B?V0J2UGljVno0ajRIdkN1aW11TVpHQ0hHcGVMemVpRUQ3QmlMU3NDZWYzMEly?=
 =?utf-8?Q?O2Ew=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUVjeWtLWDNhK0ZxdUNMVUs5bURLTGdLTFhWTVFIeDczTVV4MG9nWjRZMzh6?=
 =?utf-8?B?dW82ajNpbXNLUldOL3BSN015RTBBRHJwZDVaSVJnMTFQKzkrYXlVd1pGMURx?=
 =?utf-8?B?MjV3NXVsa3hYcGsram5LYmZYL1hzVU9EZW91QlFHem1ReENxVUcrYjhPMTE3?=
 =?utf-8?B?OFZ0dlVBNVowUkxUbCtnT3BGWjRhZVkxeU9sdEVkOUZ0SVI4emt5TGNNMWcr?=
 =?utf-8?B?V0VkMzRMQXJxUnV1TDgzdExzR3pNT1UyL0lLdFdmSm1ybU54WjR1NXZXZHEw?=
 =?utf-8?B?dmNMbG9YMDdIR0ljbGVOYkJZRFFCZjk2RjdYeEU2YzNrK29ldEZiUmQrUG1h?=
 =?utf-8?B?eU9JZElyeng2VXlrN2NYaVhGQkNXVDMrVVJvalRmQUhQb2p0WnB5eXlGMHFQ?=
 =?utf-8?B?VGJXdzIwczZnQ1dlaXp1STdKeHhEMTlOVDNHRlFZS3d4RmpWcXp0ZlNhRm8v?=
 =?utf-8?B?Wld4ZHZDOVpiRytIOHFPcnVOK1M1cVc0UzRzR3JWSEVjMUtaaFlXRVNtWk9x?=
 =?utf-8?B?NDdqTzlQWldGblpmTENJc2h5NnQ0Y1lxSTdsNW9VcmowS2ltNFZTOWhxWUpP?=
 =?utf-8?B?TWdENFZFdzZ0R3RELzJhWWNZa2s2cVpjOUlwRkM1a2U3NnJjNG9BNWYvMDBB?=
 =?utf-8?B?NDcvc0ovTkxSc014Mi8vYmdEVmUxYXRNU0VhaGNOZVUwbU4vNUtyUDRhY3Qz?=
 =?utf-8?B?alJFdjJmdldyZytLVzRsSHUycThFeXJqZ2paRWovNThFZTd1NHRVWDVGeWFN?=
 =?utf-8?B?aEFpYVZRNWxHWU51cFVxdmtCZ1RSUlNEbXhJNkRtZUJqdHRnVXd2K2ZuWmdj?=
 =?utf-8?B?ZnI0K2RqZEptNWF5Y3hGY3JLbGtETXhKMkxBb0VScms4OG5uMzVMZUZaRWdF?=
 =?utf-8?B?MXprRGkxVVAvZmt2V0JnalVvbjQ0Wmx0QzdVaWw1WHVPbGxkSlNJV3NMYWd3?=
 =?utf-8?B?Tks4NzdFVEhrNlZFUG1JNlhYU3poQUlHWG4wbFNhSlFxSkJWQWEveEdXeW9a?=
 =?utf-8?B?WE55SUhJSnFlUEJZbjZTbWpmc2ViN1VIKzdTQk9GMC9DYWhDSUNsS0NuVnBl?=
 =?utf-8?B?YlQ2bEQ5SzByeVM5MXdXdFArUTNSUzNzSUE4SGpGcFhpVXFIZHhjRTcwYkZs?=
 =?utf-8?B?ZEIzMDhCS3BuVHA4azhDOXhNYnV1NHh1dlBmVzFHRkRYUm9VNS9jeVFkZTV4?=
 =?utf-8?B?N1ltVkZvU0dncjIyRFFUR1ExNmlvZ0ZQQTMrOEEybFoyTlRZMWFiZWViSlNV?=
 =?utf-8?B?NURCR2NETlZQTDlNUE1lbUJBMDJzQXp3RjZKOWxHTnUvVllqZFNXQlpPbFJG?=
 =?utf-8?B?UENHTDlSd216TE96S1N5bWlaOWlkM2QzYy9ZL2FkNDhWNEZybHhxNzVON254?=
 =?utf-8?B?SmRhVHUrV1E5V3kvMG0yNlQzSURoVzhQR3h2QnRHOTdrVmNJcVRhSDBxU2VN?=
 =?utf-8?B?aUZodzVWRlZUZXlkWmVpc0pFMWd0Z3F4QmxzbjJOTE1JRXB1Sk1VZ0lBNFFN?=
 =?utf-8?B?eDV3bFBBVlFFUm5mTzJjaHdzSEM3bkpDWDhYemZMN2l5Snd0aFU0Sml0ZWNt?=
 =?utf-8?B?enJwRnlzSGx1NkFoV0JYNXpCWXJuSEg3WU05QWVtWkFJUFp3WUFLa3VlcGIz?=
 =?utf-8?B?TlVOUkVNZEQ4NzIra2NrZVVybHhGbkdtY2xwdVBnenZGd2NscFVhcUsxZHM1?=
 =?utf-8?B?R2RDdHdRYXB4WlNHYVIzRnU0MTRMSWtQa2lYZ2tnMjJlRUgzNUNaOW1JQ0Jh?=
 =?utf-8?B?WGF1bmFFUkdOdDR6blMxR2tZZ3BZOGVZMVZvSGZkZVJYQXJjSGJCZzJ1OGxm?=
 =?utf-8?B?dzhRcmNSK0pLNUk1WWFDdVFvSkRLWnBEVEZtV3RBck0xdS8zY0N2KzF1am5y?=
 =?utf-8?B?dlZJRFgydytmUnk2S3J2SVFDdnQwbjFpdGRSWU4vSmM5UW5PemNka0tZYk92?=
 =?utf-8?B?VUNmTUI1bzUvdXpRdlRTeXkyYXFHTjBPNk9lVzRRZ3JOUTkzQm1lU0tPT2pQ?=
 =?utf-8?B?eTc2VEQrSXdkcGNISWtwendqNWtaSTUwb1dDTGVPNjhjWEN0d2ZERUZUbkdj?=
 =?utf-8?B?RzN2ZEJqbWFSRDdNVHVTL29xQTNtbGw5NGV1ZXN0eFFuV3M4QjBReUdqaTVK?=
 =?utf-8?B?dGd4RlQwaVQ5YjhXd0syMWl1VWZNUTBnWGRua1FVZ25NSGk0ekk5UlM1MUZW?=
 =?utf-8?B?OUJtSUtBVkRQbFpLei9hdlVOVjZGaVpIK3I4K01ybEsyNFNvYXBXTHoxNjBT?=
 =?utf-8?B?YUNUWXJtRDJYcDlZbGdLWVFONXRzdFJOcDJCdTQwa2FBVmVmYUR6TXVPQkU5?=
 =?utf-8?B?cXdrblhpemFCUGV3RUFENGZDSy9PRnBETGVpYUNqdFV1WjllMmtaQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38e9e1e1-1118-490f-d189-08de6a9566e4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 00:18:24.4136 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hwdAaLflmAnR/8qQ7SYGYpcyZETLyIqhlc64PD2BG0E1jIo120aLFQq/2YqJhcj5MKhvS+fKbC+G3nCxN+UpFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7229
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mario.limonciello@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[mailbox.org,amd.com,igalia.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,effective-light.com:email]
X-Rspamd-Queue-Id: F0E1E132089
X-Rspamd-Action: no action



On 2/12/2026 5:08 PM, Hamza Mahfooz wrote:
> There should be a mechanism for drivers to respond to flip_done
> timeouts. Since, as it stands it is possible for the display to stall
> indefinitely, necessitating a hard reset. So, introduce a new mechanism
> that tries various methods of recovery with increasing aggression, in
> the following order:
> 
> 1. Force a full modeset (have the compositor reprogram the state from
>     scratch).
> 2. As a last resort, have the driver attempt a vendor specific reset
>     (which they can do by reading the return value of
>     drm_atomic_helper_wait_for_flip_done()).

Since you were able to (relatively) reliably reproduce a problem in 
amdgpu, how far in your iterative flow did you get?  Did you manage to 
need the vendor specific handling?  And presumably that helped?

> 
> Signed-off-by: Hamza Mahfooz <someguy@effective-light.com>
> ---
> v2: new to the series
> v3: get rid of page_flip_timeout() and have
>      drm_atomic_helper_wait_for_flip_done() return a error.
> ---
>   drivers/gpu/drm/drm_atomic_helper.c | 45 +++++++++++++++++++++++++----
>   include/drm/drm_atomic_helper.h     |  4 +--
>   include/drm/drm_device.h            | 24 +++++++++++++++
>   3 files changed, 66 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 5840e9cc6f66..6ae1234b9e20 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -42,6 +42,7 @@
>   #include <drm/drm_gem_atomic_helper.h>
>   #include <drm/drm_panic.h>
>   #include <drm/drm_print.h>
> +#include <drm/drm_probe_helper.h>
>   #include <drm/drm_self_refresh_helper.h>
>   #include <drm/drm_vblank.h>
>   #include <drm/drm_writeback.h>
> @@ -1864,11 +1865,15 @@ EXPORT_SYMBOL(drm_atomic_helper_wait_for_vblanks);
>    *
>    * This requires that drivers use the nonblocking commit tracking support
>    * initialized using drm_atomic_helper_setup_commit().
> + *
> + * Returns:
> + * -ETIMEDOUT to indicate that drivers can attempt a vendor reset, 0 otherwise.
>    */
> -void drm_atomic_helper_wait_for_flip_done(struct drm_device *dev,
> -					  struct drm_atomic_state *state)
> +int drm_atomic_helper_wait_for_flip_done(struct drm_device *dev,
> +					 struct drm_atomic_state *state)
>   {
>   	struct drm_crtc *crtc;
> +	int ret = 0;
>   	int i;
>   
>   	for (i = 0; i < dev->mode_config.num_crtc; i++) {
> @@ -1881,13 +1886,43 @@ void drm_atomic_helper_wait_for_flip_done(struct drm_device *dev,
>   			continue;
>   
>   		ret = wait_for_completion_timeout(&commit->flip_done, 10 * HZ);
> -		if (ret == 0)
> -			drm_err(dev, "[CRTC:%d:%s] flip_done timed out\n",
> -				crtc->base.id, crtc->name);
> +		if (!ret) {
> +			switch (dev->reset_phase) {
> +			case DRM_KMS_RESET_NONE:
> +				drm_err(dev, "[CRTC:%d:%s] flip_done timed out\n",
> +					crtc->base.id, crtc->name);
> +				dev->reset_phase = DRM_KMS_RESET_FORCE_MODESET;
> +				drm_kms_helper_hotplug_event(dev);
> +				break;

Since you're iterating multiple CRTCs if you manage to recover from one
with this call shouldn't you keep iterating the rest?

> +			case DRM_KMS_RESET_FORCE_MODESET:
> +				drm_err(dev, "[CRTC:%d:%s] force full modeset failed\n",
> +					crtc->base.id, crtc->name);
> +				dev->reset_phase = DRM_KMS_RESET_VENDOR;
> +				ret = -ETIMEDOUT;
> +				break;
> +			case DRM_KMS_RESET_VENDOR:
> +				drm_err(dev, "[CRTC:%d:%s] KMS recovery failed!\n",
> +					crtc->base.id, crtc->name);
> +				dev->reset_phase = DRM_KMS_RESET_GIVE_UP;
> +				break;
> +			default:
> +				break;
> +			}
> +
> +			goto exit;
> +		}
> +	}
> +
> +	if (dev->reset_phase) {
> +		drm_info(dev, "KMS recovery succeeded!\n");
> +		dev->reset_phase = DRM_KMS_RESET_NONE;
>   	}
>   
> +exit:
>   	if (state->fake_commit)
>   		complete_all(&state->fake_commit->flip_done);
> +
> +	return ret;
>   }
>   EXPORT_SYMBOL(drm_atomic_helper_wait_for_flip_done);
>   
> diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
> index 53382fe93537..298c8dff3993 100644
> --- a/include/drm/drm_atomic_helper.h
> +++ b/include/drm/drm_atomic_helper.h
> @@ -79,8 +79,8 @@ int drm_atomic_helper_wait_for_fences(struct drm_device *dev,
>   void drm_atomic_helper_wait_for_vblanks(struct drm_device *dev,
>   					struct drm_atomic_state *old_state);
>   
> -void drm_atomic_helper_wait_for_flip_done(struct drm_device *dev,
> -					  struct drm_atomic_state *old_state);
> +int drm_atomic_helper_wait_for_flip_done(struct drm_device *dev,
> +					 struct drm_atomic_state *old_state);
>   
>   void
>   drm_atomic_helper_update_legacy_modeset_state(struct drm_device *dev,
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index bc78fb77cc27..1244d7527e7b 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -66,6 +66,23 @@ enum switch_power_state {
>   	DRM_SWITCH_POWER_DYNAMIC_OFF = 3,
>   };
>   
> +/**
> + * enum drm_kms_reset_phase - reset phase of drm device
> + */
> +enum drm_kms_reset_phase {
> +	/** @DRM_KMS_RESET_NONE: Not currently attempting recovery */
> +	DRM_KMS_RESET_NONE,
> +
> +	/** @DRM_KMS_RESET_FORCE_MODESET: Force a full modeset */
> +	DRM_KMS_RESET_FORCE_MODESET,
> +
> +	/** @DRM_KMS_RESET_VENDOR: Attempt a vendor reset */
> +	DRM_KMS_RESET_VENDOR,
> +
> +	/** @DRM_KMS_RESET_GIVE_UP: All recovery methods failed */
> +	DRM_KMS_RESET_GIVE_UP,
> +};
> +
>   /**
>    * struct drm_device - DRM device structure
>    *
> @@ -375,6 +392,13 @@ struct drm_device {
>   	 * Root directory for debugfs files.
>   	 */
>   	struct dentry *debugfs_root;
> +
> +	/**
> +	 * @reset_phase:
> +	 *
> +	 * Reset phase that the device is in.
> +	 */
> +	enum drm_kms_reset_phase reset_phase;
>   };
>   
>   void drm_dev_set_dma_dev(struct drm_device *dev, struct device *dma_dev);

