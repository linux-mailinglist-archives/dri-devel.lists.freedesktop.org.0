Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id hauALifhmmlImAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 22 Feb 2026 11:57:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E2E16EEC6
	for <lists+dri-devel@lfdr.de>; Sun, 22 Feb 2026 11:57:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CD9110E163;
	Sun, 22 Feb 2026 10:57:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="UAQH437/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012058.outbound.protection.outlook.com [52.101.53.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E667910E163;
 Sun, 22 Feb 2026 10:57:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hOBufB4tiYjr3X196LoCa1VybFLRwAi6By49ySNfoMTQ738ppzCflUdD89lyzLNxbtNR2wMvUNIEeeDTQKy2Z7ve5tGDvzOTHaMbh+uDz3cBmwbZxaBJipxcvY8cbBjn2DcBP9DUl0YI0Jst0fYFOsw8I+HQi+dMtW0xwtYN+gejfi1ZqYUKPKWDpV1EjFvdhAwPdPGXyYVWfiKrWqyUW3oyyf8wHJlOF/xnN4ZH6bOqwj85crrK7Sb2NEu+jokyLbkpeOEbmRHZ/PG0+5HizVGVx7QPtNFo0JW+mYi0sDyQk0J+wjh4VKgzXFCYgtc0/bw3IpB9a4fHUOJmvtUlfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U2a2fk3TkhyWkDK1mvbqDDoPVc501AMC0bIO4eXnLdg=;
 b=Bbc+Bq4kQqCCVTJuYUNkRdkJeslSKzbVstFJqtfQJxSwCTIr644MRituhgNXNzgZPckGuTvfQiSMEwb1/Z+FjUwqsyJABA+dK0Gv7YqgQn8FrrkdJjbn2varKcn3EVegVUoLUTZyzfQh4XakJqMqlDGfSA1NtakqBUn9Pbq1JoB25SLDZqxBdNrmeMHtHSDfBw5cXTcAP7G9jxrlu1rLe8W+KrTzTsqNOApcgwQky2bnTSV45k8e/UiPmY5D4bS1kGJ4AE2ZXdCWrSg/K+PlktRykl2jefo4EUr9ZazgAkkHAiLR+fahOYy5rjRrJ5xJ+cQ/PCd+n5QViCakESouUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U2a2fk3TkhyWkDK1mvbqDDoPVc501AMC0bIO4eXnLdg=;
 b=UAQH437/phJWJoBMs0hoPY/CdtAb7EG7VTRhOzfzpBpEXZ8B4QxkMaiAKs8NdYPCnNeQxA629s47bZtRYbG1rwN2qz2oZ3ks7A2qbLEZ5DwFT8JBqF+Xf5grMN+ezKrjD0HnZVKPLZHOavB0Wka3dz+FelJhRGleuTn/gyZQZ6/JCTM6XDag2ts1D9GKmTatz9KKICjPa084r5xObMb5BHRYya3JuYjxge7i9VdnBMBAu0k+1g7QMuaUor10L2EsZqA6aSFQOYt/CqxB9gtoMWBkCxRnnZJX876HPSOUmT5p+wzzoYK25chn5VVqonpl8SjEvu53tDWRbllspV8vdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by IA0PR12MB7556.namprd12.prod.outlook.com (2603:10b6:208:43c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Sun, 22 Feb
 2026 10:57:33 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::73c6:e479:9b75:b2cf]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::73c6:e479:9b75:b2cf%3]) with mapi id 15.20.9632.017; Sun, 22 Feb 2026
 10:57:33 +0000
Content-Type: text/plain; charset=UTF-8
Date: Sun, 22 Feb 2026 19:57:28 +0900
Message-Id: <DGLFQMYLRF8S.1A7LGAMCW5XZ8@nvidia.com>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Alistair Popple" <apopple@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v9 6/9] gpu: nova-core: add PIO support for loading
 firmware images
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
Content-Transfer-Encoding: quoted-printable
References: <20260212-turing_prep-v9-0-238520ad8799@nvidia.com>
 <20260212-turing_prep-v9-6-238520ad8799@nvidia.com>
 <DGDWZHY8XCLX.19DI18CI9QSPQ@kernel.org>
In-Reply-To: <DGDWZHY8XCLX.19DI18CI9QSPQ@kernel.org>
X-ClientProxiedBy: TYCPR01CA0148.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::7) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|IA0PR12MB7556:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fa7674d-d1e5-4412-36a9-08de72012e17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|10070799003|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZjJlRTlKR2V4VytXV2RrVDc5cWVqZStRWHdFMW8xM21SeU82LzhuUTE3VGtM?=
 =?utf-8?B?TndmeEVORmhTSkVHeDZlRE1tSFlsNUVXUDU4N1haMWprOC9obnFPUjRYSFlN?=
 =?utf-8?B?UlFGVEZ3V3BNREh6MTVSOFNMMXgvK0RwN1EyYkprSytVaXMrV0dhZ3Nlbm5s?=
 =?utf-8?B?ajBPWkJESVAyM21CbG94VlJ1OVdQU0FIR0MxdDlpdThrK3lVWjNDTDR3TjBW?=
 =?utf-8?B?REkxZ3RHZ1M1aSt0dVZMclFKK1A1SlZrN1QvcHdzdVY5ZER1bUNHcW9QZnI5?=
 =?utf-8?B?d1hpK0Q5ZExKM0tBWEo4Zlhza2xSY2xvNnlUUkxVb1pJNjRGMS90cU96TDJS?=
 =?utf-8?B?emFjT0NhMGluSTkzdWN3K0l6NFYwVmUxZmc0S0N0K1plRyt3YnQ5OUtUNzlX?=
 =?utf-8?B?MmhlYmwvL2RpRDBhOWYxQWttMVd2UUx0STJwZGlUcUwvWlQ3Kzh2bHNsbHlv?=
 =?utf-8?B?WnpXVDhJRURMc0lxb05vQVZ0cGdnaHhoTllzNTFjVHVyNzNwMGlzdXZPeW9E?=
 =?utf-8?B?QU80T0NkdXZCSHVkeXZDdnVrRWxWQnFQQUhYaGNKNHVpRUNscTh3T3lWeklp?=
 =?utf-8?B?SnV3R3VHMGlRcm9Ba3pBUi94T2JSaWJYcGpoNWlMTFl1MkVNeFVmUkRFZXRO?=
 =?utf-8?B?RDJkLzJVeDl2aE9VMjRFRmRpNHYxdDJCRjQ1SEFCOG1zbUdUQ0RTdUhvOVJK?=
 =?utf-8?B?MGxvb2N5aFZoTEd1OUVZWDNsNCsxUDg5V0VUbUhVakpYQXczK2NPSlY3dDZy?=
 =?utf-8?B?T01EUXVoeUZ6Mld3VkxXS3kvdHYzRXhyNmxRckNjOEJLUC85UGsrUDRuV1Ax?=
 =?utf-8?B?L0tLaXFsdGs1WHZqQmNoY1hhdlJEYU1mZzRuMUxCTHVkQzBCcjZYamxRUFdm?=
 =?utf-8?B?U0hCSklXMVdraFY0bDdaRGorMXVrQU1sUmtyYWl5S2trSTI5Z2pjanZVUkVH?=
 =?utf-8?B?eDJYSlBHaDZBa2RweWZJNFZQWmVWZmFVVE4wWTZnc2hlV0srVnJ1MEw1TDhq?=
 =?utf-8?B?OFU5WmVpU0gzOTd6akxqeVA1Z3hzTkFacmQ5U1NDS3ZTUUwrd1VocUg3dnkz?=
 =?utf-8?B?SlB2MzlzVWQ3ZUJtQWlJSWloVWs3Q2VVb25FZWNBOFFrZ2lIYWZ1NEVFNGFM?=
 =?utf-8?B?Y0JGMkJrM1d6Rm5hVldQRExpdSt1YjBBbXlBOTNzWW9KK1N5elQzdUYyZ1J6?=
 =?utf-8?B?QWpJNUN3NDhKeFk0NWNyS0VSbC8wYjY0eFM2YTNvSzFJRkgvYU1QQXArTW50?=
 =?utf-8?B?eWhmRzkrL0JGdGJKUDAvdlZ2WW1iNEJDN1NOdTBDdXpRNlpZV010cEdDQy85?=
 =?utf-8?B?RnBLOFhYRTczNnhLWXBZUWxQTVkvRkFBcWhXZGdhRlZnaUhyUGxXTW01RXZo?=
 =?utf-8?B?bXhteWNudEN4OTJ1TGdyUGk3UUcyODJGbTIyV25pbVhwUk8zOGJRSmsvd2FR?=
 =?utf-8?B?U01YNTkzdkI4ZWxJME1hbkErMjVhNzZLQ1g0RXdrZkU4NUllRWJud3pQVEZp?=
 =?utf-8?B?QncxUkZXZ3BIbHd3S2kwSHlvakdoZnlIdytHTVRpa3N6aE9taXBKR29XeW5m?=
 =?utf-8?B?di9MTFNqV1ArRk9sNEFEL3BKUzZUUHVIZXpkOWQ1NGpBRGUzVmZHRUhYMjht?=
 =?utf-8?B?K3c2SGpSSUFkZUNpSVArQ0k1aGlQVms5V0ZXckxVeGthRUwwaTYyaEFFRDZ2?=
 =?utf-8?B?YjhSWTU1QzU3MXdvK09Fd2c4Q2FRamYxZXhCdTlGSTFGNys1S0xlUDJwNWpM?=
 =?utf-8?B?NW5sWVZEMUdTbnYzY1dlT2habTB0UUxTUnREa3QzbnNFOHBxc2FIeHQ4UDM3?=
 =?utf-8?B?YU92SHlTR0FScEZlMXIxQmVWb1FaRURjRkJ6QUVvdXRqTWdFZWVCUzM1enZG?=
 =?utf-8?B?b2J6VUlVR1BVZlp6UDF1V3hNeWtqRzhDYlRwSCsxeDMxbldibXdaaDVaYlRY?=
 =?utf-8?B?Y3VYUHBKNElXSG1qaGNoaC9ZajBEWldDWGllcnRnQVJGTHFTb0QvWHlydHlJ?=
 =?utf-8?B?RDhDUGhZblg2LzU1ZTJvUmdjdkZhVUFTZmQrMXRRbUgrWEo4YlZjQUFPQ0M0?=
 =?utf-8?B?MzFmVTl3bnBsQ2gzWGNGSXBxVDN5dExCdVZlV3N2RUZCcmdNZVVxVzlHSGtv?=
 =?utf-8?Q?42Ac=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3997.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vi91ZnBsRCtOa2ZubkhmbXpnZ1VSbnhIY3gvNFY0S0lPbEhFRjlzUEE5Qmxh?=
 =?utf-8?B?SzVFd3JYa3FwUEREaXlBcEU5RE8rd01KdDNUcGJVUVBJVTI3V01INDBydnZj?=
 =?utf-8?B?WkpWelF3NVVNcWFQd2FHUXhwWDNZcWIrdmJhU1Y4cWl5aUQxcHFWOXNGRzVL?=
 =?utf-8?B?VEpselZJa3BsK050dW5tR3Vqa2lmbDNGSTN6eDBzUFJ4WTc3VmlTcS8veFRp?=
 =?utf-8?B?ckY3NFFlYnlDcjUzTjY5VlJZQ0ZiM2JqQ0VJd3N1YTloUHFVRlZLcFR2MGlC?=
 =?utf-8?B?T3BEUGJPeGVSZmp3cVlKWHJlOXRBM3RPYUFmWTBKVXFnWXE1dE1TRFI4YWUy?=
 =?utf-8?B?SkM4UWJsVGVkL2hsUmR3UkJadVM5eVdSRStqcXRZajFjL0x6UWk0TEZOZEFk?=
 =?utf-8?B?VVZ4VmtFb3JGWUlhOVdtdkxuZ2ovUFN5a3ZBOGpUeit0M0xBMDZnN2pmMGlV?=
 =?utf-8?B?Wk1pbFY3ZHBLZ0FPbVljUVVzZHVtRk9JNjZ3Mko5NFYyZW9WNnNURHVxeDNN?=
 =?utf-8?B?WHExM0Q1SjBqWVpsUjgxZ0V2UUZVaFdtRm9wZ2sxUmJPTHQ2R1BLajVZdG1n?=
 =?utf-8?B?WXg2bjZLUlFwOUg5ZnpIT2tlbVVZckczeVdjRWZxaytkMEc5WUg3bEQ0dmMv?=
 =?utf-8?B?YWYrd0UwOUNEaExqaWYwQkQ0dHdCUGZORWlHL1ovZFArakh3Z0E0alNGSkxR?=
 =?utf-8?B?dTAyakRZZXF4VEhQZEZuc3NDQnlEZGdkQW5aeUpGNjZjYkwwU1MrZXlaeGJE?=
 =?utf-8?B?ajl4NmVrYXRmbms5dS9ZL3RiOHg5OGc1K0M1YTluamJVZ1VnV04yaE5JL3BN?=
 =?utf-8?B?Ry9ZZm1Ga280WnNNeHgwa09qcU1XRGFZSUFvalRHblZmc1VDM25iQ3pScEFy?=
 =?utf-8?B?bzA1TTVmSUFPMHpWbC8zdU1nWmFmaE9SZUxBalp5SHZmSmdPM0x6QVN1ZHJG?=
 =?utf-8?B?bThDKzBKOUh6RGd5VUcvNlV5NkZ1UDRDcUp5YzJkTUFqMlY3WUtWOUI3TXRW?=
 =?utf-8?B?OGFiVi9oVFo3S3M2OUVWR2gvT0RMc3BaMXdGTklaM3h6Ulo4Nks3dGl0NlRh?=
 =?utf-8?B?ekFGYnplNEJXUGh4aWVmaE50MFZyTmJwN3BrUjJPMUdHNTBJZ0xVRUtJTjJm?=
 =?utf-8?B?eDlJdVlvL0hZc1hpQU5vb1dZaFNycVkrU2RaK244ZmcyQWRnRDVzMURBVWxP?=
 =?utf-8?B?c2F4UmNNdTNLOVplOFhvK2xXeHUzQjh4Ym9UNk40eTVVOGpmdGJBYkY5L040?=
 =?utf-8?B?RkpLL0NhWUxDOE0vMWQzK1poclVJaWRoaVNKbU9YbVUybVdrY3I1RDlHTXd3?=
 =?utf-8?B?YlFZTEVGZjBCTkF2Q3ZXclFxUjc2eG5HWEJMc0h3cmZBbzJKYWd6ZlJLNWc3?=
 =?utf-8?B?L3Y0dWF1VDB5TkNxNTZOcXdhaGRSdG96b0NLbk0vRENWSC9DMytLVDQreEZY?=
 =?utf-8?B?czVteVRyZnhndEExaEFmWk1BNmhwQit4b00xTEprR2hYRDFUMGtmTUZtSEpE?=
 =?utf-8?B?UHF2OGl5aUF0WFU5TzRDYkV6MUdidVlmQnVTKzdoejgrZnNkQXcyd3gxZnVF?=
 =?utf-8?B?aGJBUXRqN2lBdml3QVdvRW83elNXbTMrM1BJV2dYaGhDYkpiRFJ5V1VSYXh2?=
 =?utf-8?B?WGlra3gwT0diN2ZBNTFzaUFKZnlhYWpaNkRiUWhkVHF5SjJxNnczQ3dFRG5I?=
 =?utf-8?B?VFNlb1BKcmZaSWxxZG40SGI4Um9rZXBrbjR0Wnp1L1d6TkFNamg5Z0g4VHBW?=
 =?utf-8?B?dENKTWg5Y0FMR1cxdWtxc1ZYdzdGanZ0WDM2SVZzR3NHZTNMVENIVFVnelNU?=
 =?utf-8?B?ck1JeXYveXpJN1JwQTR3eVlNd2txc3M1eFpMQTYrNC8yWjJHV0JIVVIvTkRx?=
 =?utf-8?B?Q0NJRmh2RnNsdHExUmxwKzBEVWYxZVZnTG9aZTUvczQ4cGcvTlgxMnNUYS9h?=
 =?utf-8?B?UUhnVmRqUC82NWlBVktIaG4zQnVObXFsL3RNdnBpWWM1TDEvb1RmZnNzaUdO?=
 =?utf-8?B?bjY3bXRoKzY3WCtSYWtBdlhFdEgvSEJXSHFKQStOY2tWTXBRWklSQ1dpSVN1?=
 =?utf-8?B?MDZSaENJdzFPSGd2SWhRc2U1VVl6bG8rekk2Ti9FYk5oaFdmTmFYN3JqdFZL?=
 =?utf-8?B?VGJEelh1NnVaeEZESXRGeXJwWlNnanRDa1RYNFpveGRRSlpNdmkwblBycW9V?=
 =?utf-8?B?QTY4WUt0bWswU0hNZ2c4Wk9JN2VVZGtPS25ka0U3cWNkNXI2NW5CUHplcjlo?=
 =?utf-8?B?bEJjRW1HRDlTZ1A4Y2pBc3JRdno0NzR1QWczTm1XeDVNclltWGNLQVpwVEdC?=
 =?utf-8?B?cWVNVUNqamZERStkRURhK2xJODlBYmdDd3F3QUxmTTgzR1VwNi85Tkl5UDlh?=
 =?utf-8?Q?/x7gCYHEKZ0EyA3c97Zlokv3F6d1K5SfvfeWfKNs0d7nv?=
X-MS-Exchange-AntiSpam-MessageData-1: ehrWF9vFpibn6w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fa7674d-d1e5-4412-36a9-08de72012e17
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2026 10:57:33.1110 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6CDINQ71vdUdMskhPXq/7y5esdc8gFicvIu0XbvY7GBB5O0xD1aa9dWqkykb2w/upHaCsh56IVLgcIuKkMiWKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7556
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
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 19E2E16EEC6
X-Rspamd-Action: no action

(sorry, took a while to come back to this)

On Fri Feb 13, 2026 at 11:47 PM JST, Danilo Krummrich wrote:
> On Thu Feb 12, 2026 at 9:26 AM CET, Alexandre Courbot wrote:
>> +    fn try_as_pio_loadable(&self) -> Result<FalconDmaFirmwarePioAdapter=
<'_, Self>> {
>
> [...]
>
>> +        let dmem =3D {
>> +            let params =3D self.dmem_load_params();
>> +
>> +            // SAFETY: we keep a reference to `self` for as long as thi=
s slice is alive, and the
>> +            // device will not access this DMA object since we are usin=
g PIO.
>
> How is this guaranteed by this function? I.e. how is it prevented that th=
is
> function is never called when the device acesses the DMA memory?

This relies on the fact that firmware loading and running is
synchronous, and that the firmware does not touch these objects once it
is done running. But yes, this is a pretty weak guarantee for Rust
standards.

>
>> +            let data =3D unsafe {
>> +                self.as_slice(
>> +                    usize::from_safe_cast(params.src_start),
>> +                    usize::from_safe_cast(params.len),
>> +                )?
>> +            };
>> +
>> +            let dst_start =3D u16::try_from(params.dst_start).map_err(|=
_| EINVAL)?;
>> +
>> +            FalconPioDmemLoadTarget { data, dst_start }
>> +        };
>> +
>> +        Ok(FalconDmaFirmwarePioAdapter {
>> +            fw: self,
>> +            imem_sec,
>> +            imem_ns,
>> +            dmem,
>> +        })
>> +    }
>> +}
>
> <snip>
>
>> +/// Adapter type that makes any DMA-loadable firmware also loadable via=
 PIO.
>> +///
>> +/// Created using [`FalconDmaLoadable::try_as_pio_loadable`].
>> +pub(crate) struct FalconDmaFirmwarePioAdapter<'a, T: FalconDmaLoadable =
+ ?Sized> {
>> +    /// Reference to the DMA firmware.
>> +    fw: &'a T,
>
> In v6 [1] I wrote:
>
> 	> @@ -221,6 +286,8 @@ pub(crate) struct FwsecFirmware {
> 	>      desc: FalconUCodeDesc,
> 	>      /// GPU-accessible DMA object containing the firmware.
> 	>      ucode: FirmwareDmaObject<Self, Signed>,
> 	> +    /// Generic bootloader
> 	> +    gen_bootloader: Option<GenericBootloader>,
>
> 	I'm not convinced this is a good idea. We probably want a HAL here and
> 	have different FwsecFirmware types:
>
> 	One with a DMA object and one with a system memory object when the
> 	architecture uses PIO. In the latter case the object can have a
> 	GenericBootloader field, i.e.  this also gets us rid of the Option and
> 	all the subsequent 'if chipset < Chipset::GA102' checks and 'match
> 	gbl_fw' matches below.
>
> So, I still wonder, why use an Adapter impl on top of DMA memory for PIO =
rather
> than different base types with a common trait to avoid DMA allocations in=
 the
> PIO case altogether?

This would require quite a lot of new (almost duplicated) code just for
handling the PIO path, and complicate things more than is worth IMHO.
All these problems (and a few others) stem from the fact that we create
the DMA object early during the loading process to avoid a copy; but
doing so also forces us to do the patching and other fun things on that
DMA object. The instance of "we cannot really guarantee that nobody else
is accessing that object" is not unique, the signature patching for
example is just as weak.

However, if we are willing to accept an extra copy of the ucode when DMA
is used, then we can change the loading process to work with a regular
KVec, and only move the ucode into a DmaObject at the last minute in
`dma_load`.

This would solve all the problems you raised while avoiding duplicating
code - it would actually *simplify* the code a bit and remove a bunch of
unsafes notably in `fwsec.rs`. WDYT? I'd say the unsafe removal alone
makes it worthwhile, and it's not like that copy would induce a
perceived slowdown anyway.
