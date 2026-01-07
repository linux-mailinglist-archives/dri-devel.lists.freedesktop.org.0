Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBF2CFDBDC
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 13:47:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E288A10E5B7;
	Wed,  7 Jan 2026 12:47:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GECgLMGz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010015.outbound.protection.outlook.com [52.101.46.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF22C10E5B8;
 Wed,  7 Jan 2026 12:47:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qXmMwR7TTwtv9xcSm09eXhz334CoND1Iir8mJt590rnWeWmanf+3NTNaFNESUF1UJovixOusIIOeH0E4KGu6ZTIqemzhWzjy9KY/3jhetZ0w2RWKlqZFbKeFmthGkUVZI8dLmf6eVy9juM/DogFI/nPisi499SGaUwVUzcaq+5zNBj5U93wOY6gQ036umtB6xntA4YGP+eEICIEX7zNbvLGYdq5iX+FbSQUgjy856TFr/W2LYxfiEzMzwVzWvLFcahGAkAeJSu5mVP5TQ4vfe21s/1z+F6QsCL1M4R6Ry/rxlq6yf6A1OwXa6m6XAUBNGqYQUQkaXPNyR8B3L8/Ckw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AZ7fG8oPdwnnH5WTxqfYu57F2eOMFj+hPNaScz6AwV0=;
 b=ZO1+EEhvJa9q4HlBWh4UZLv/cni06RcfVgKynOBy8U9SiNGlARTLq8dbXpnzzccNAjbb5rZYwsnTqw1Kh6EPdhFKkM3N5kF08JN4TGV2RMHPYGxSwBbyBN2+DsTNx+EU0qWeEFudZXDPZGRftZ49uktZnxIsy6pzpw7YnczHFUgruHvpfhWhMwpiNB1+GduOOxw21Wca56SGG8HDzoe/N+veH8ATeAqm8jIZONKAQ0pOD9I3fXPwFAwl7tpeVT2CiwQiDnh5NaUB0lhwJNV5mRXg9f4tdFJ05L6SSkLoaNaL7bOAhE5yqurAC/2FkKcZuQCFbjJD8+O9F5oiC+hxww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AZ7fG8oPdwnnH5WTxqfYu57F2eOMFj+hPNaScz6AwV0=;
 b=GECgLMGzsg8AGGlE04ZX6I9KAnzKCTZmZTUsyGU+Fstmk67eFCdW/r06wCdGoV9x1T0ZvcrPBpQ/vQUMMpzpomlk7O1xQWM0yYR7hUHOJAznQRsKonS+V5XKu/aIeHbfzNl1Yylko99hfcYU1o9xUopm7WG4fMCVTTa2XLRkzNI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN0PR12MB5932.namprd12.prod.outlook.com (2603:10b6:208:37f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 7 Jan
 2026 12:47:12 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 12:47:12 +0000
Message-ID: <fde4b6ec-a7d6-40e1-96a6-a2f4b601d583@amd.com>
Date: Wed, 7 Jan 2026 13:47:08 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: Fix typos in amdgpu_vm_bo_update comments
To: Ding Yihan <dingyihan@uniontech.com>, alexander.deucher@amd.com
Cc: airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251223044120.1574243-1-dingyihan@uniontech.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251223044120.1574243-1-dingyihan@uniontech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0033.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:82::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN0PR12MB5932:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b7768dc-d655-4f53-5183-08de4deae105
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Wk51L2RBWTZwK1p2SnV5ZU00VmIvbVpqWk1pdklXMVNOVVArbEZ0MTF3VVRL?=
 =?utf-8?B?ajVCbzkwczR0elFNeENxVXpzbGhUV3NIRG9KMzc4Zlo0aFRqREt0cEY2SElH?=
 =?utf-8?B?UlJVdS9JL05JdlRLN0pRb0NFN3l1VmNKSzJYSWFiYnh4eGczbUU1NzBJWUIv?=
 =?utf-8?B?UDVIN0NoZzM1aEd4UmpCMktxcGRFT09SWnFGZWgrb0dpbUFQcUhJTTUzRmJx?=
 =?utf-8?B?Y3FVWS9tZTIwMmw3UFRvRUdrN0tFZW54RE1pZlBHOWpHbllhZDEwREVpa3dy?=
 =?utf-8?B?QTduMVZ1bmY5cEIvamRIRVJ4WHlLbEJaNjBEMXZQcDZYalRZR1ZSOTRuRW8w?=
 =?utf-8?B?QksxZVlSaTQ4M2hISHkreXdhM3Y1bWs4VDZIQ3kzTUMra3hyNVBWNjFCbGNQ?=
 =?utf-8?B?K2VwYy9pcXEyblVnWUJMS2Facm1kM1NwUFJ2OGMvenBUeml1RkNsOFhaWmh2?=
 =?utf-8?B?ODVBMFlETHFHNmpRQ1BOdTdlNUZxZ2EvYlA2V3poYVBYbmhLZForK2pYUXBy?=
 =?utf-8?B?NStIRWx1eW95ZUM4bDBXQnFzUm95YzM1a1E2S3d0UVl6cDlvZ0swRlFRTmtV?=
 =?utf-8?B?eHBnSTFaUzg4WEtqWjJEcVcrZVhmNkhqMVhyNVdlamNJSytDZGZsNDhVUnlZ?=
 =?utf-8?B?TlV3SVM1eG9rY2VjZG43cGlyQnFKR1JyaWk4YkRPRzVhbEljRGZIZTJyVmZX?=
 =?utf-8?B?b1JldTQ4RklSaWM1aDlQOE5zaHZVSWYrZzg5OHAybEJNRUI1SFpCS1V4SEVq?=
 =?utf-8?B?YXpCU01DZVZWUmgyajhLTldXMFU5cE9GN0hCWFAycy9YRnd5NTA3VWtRRlk2?=
 =?utf-8?B?YkdISEtjZGVudm16YjhyQVBqZHdTNWxUMlVPeVprSVJUbU13U1Y5YkVzYUtE?=
 =?utf-8?B?bGVQUmRSelVtdDI4TVN1UXFRb1lWU0tpTmw0aDBEeVVUckkyYk1XN0JySVVz?=
 =?utf-8?B?aUFWa3hjRWNjK1VwU3NGNS9YL3FtOFlVaUFvcXdLSk9tMWd5aFQwYnI3RWJj?=
 =?utf-8?B?KzZmQ0t2UjBJQlYvc0xrVmx4ajdpNlZxUEZPbVVOT1IvY1hhYXJRWnBxR0p4?=
 =?utf-8?B?aXJIZ05malFBVEp5bTZQNm5paHdQMldCR0k1TnhvdjQ1RVN3bTNuVVAxZWVF?=
 =?utf-8?B?b3pxMEVRVjJrcTJEVlJuUE5OQ2hnRFYzbEUzNnpETmY3cElKVHZXbmV0WUxC?=
 =?utf-8?B?UkJlSlVFbFBoTGYxSmY5VHJmaEljTXhacm00ZUVhZTJOZEkyVkZrUmVIYWlW?=
 =?utf-8?B?T1lST0Z1My9sQ3dSQlFmTVNMcFh1SUNPZVpzRGlybGdaTmJ3Z0FRWUVLSUsv?=
 =?utf-8?B?OGFDNDErbzdoMTlKR0swUlhjeEJjNVZ2RFhaaWRxYzFBRjVTQnhGTlh2UWV6?=
 =?utf-8?B?a1VvQ0NTUjBEQnBlaDhkYlZhTkpmRjZzbE9maDlLTnFRckVhK1gwZ2NsM3Fi?=
 =?utf-8?B?WndpL29hWjZxVUhVSWxkeU5BOU1pQW5WeG5wcjNnT2JQdlpiRGE1R0NLSXNE?=
 =?utf-8?B?UkEvWGthWS9EVzR5VG9aY3RwdTZjYnp4dFg4U0VCaTF5dlZVanFkR3FrUHpz?=
 =?utf-8?B?RHdhWVMrWktLT0tDY2dJR2h3ai82MXJBTlBzNkw0SFZYbWZFRWhWODNlMm13?=
 =?utf-8?B?ZlhpV1JlcXZ4aGJ1dCtLYWlXb2FHWnBCcnpLcFQ3UUFHZ2tDdXhqMEkxNFdO?=
 =?utf-8?B?cDMyOXhpb3RQaXNuaklLOTN1ZG1HZ3lnQk1BRG54WFduQ3pPZXE4NVZWbEpD?=
 =?utf-8?B?VnVZNmdiWTFZakR4SkxJcmxzaEovZVpNQWZjRFFMY21HUTN2YnAzam1ET1Vo?=
 =?utf-8?B?cXFGRktpaDNicm05MDhpdHptaFBtSDdwT2JDU1hlTnlOelpMek00SWErVzBT?=
 =?utf-8?B?OEpidzJzL0k2TklqMXhoWlM1YlAwSHFGeVU0VWhrTENSNG0zWHBUT2lETFVC?=
 =?utf-8?Q?qHkkPczaqsek4ygQ/7BfTkb/JehhGz+i?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUdNUGQxRnlLcVBpTGw0K0VnYnZGYjFJckFHZDNVamVRMkxxL3FKT0Jqc3h4?=
 =?utf-8?B?TTdGVFQrOUVYUGViUUFiVHIxVDExWnBmUGQ2OVdyVXBBTk14QklqQzZGazVj?=
 =?utf-8?B?VDExazB3R3pLQ29oeW1aL0JSK1VPSWpPcFFRc010VlptRkUydWVwcC9DckxY?=
 =?utf-8?B?bHNLM3JVcmN2MWlILzdGMXI0Mnl5NUZtdWdoamtuS0xpejR5NmRkL05ZcUR1?=
 =?utf-8?B?NnQwZ1RmbFVOWEV4S0hxa3ZBWUNZd01Qb3RPYlZYWWRRdXFHZFVBQzB3VWNy?=
 =?utf-8?B?TUttUEVBcGdKK29FdjhURzB1K1lGNGY4VFNQOWxBNHlYcFY3c2VUc0poRUJo?=
 =?utf-8?B?NTMxaU0ybG1uWmlVLzdKMEhIdjZLR1Vxc2piMkNuMnRUL3dsMCtaLzBPWnkw?=
 =?utf-8?B?MjljdlhGSm9yUUw1UVhHeE1iSHdxY2RxVko4MDBpS0U5Z0pqUEE5SUxOVnM1?=
 =?utf-8?B?dXRSbG9ScWt4eFQ5T2l6UEQydW1IQXIrRDJmOGdUT2JuSmcza1J6RVhzaW0w?=
 =?utf-8?B?Zk9jTlhHWDVqa2E3OTYrYXp5Z1VzRmtlTUZrdEFNczk2M2lYWjhYT1kxdkE1?=
 =?utf-8?B?Wm1xa2s1UFg3RUR4Zy9uQVVEVERmRWFyWGc0N1dvQW5zbERrUEgxdGpuUnpu?=
 =?utf-8?B?K3ZXZCs0TEpZM29CSU9Pam5namRUY3JNanRYZXNyN1lFdkFTeFZOTGtQTlM1?=
 =?utf-8?B?RmhjdUFZRlFEMHVKQnRMT1FQeFZmaG1selphdGRmK2psNWNiN3lTVWNwQVRI?=
 =?utf-8?B?VEg1MkRhdUZYSXVWRWl2Tmh0d0ZrYlIxc3plTEp0OGVvZzZUdnQxS3BkUWx6?=
 =?utf-8?B?K0ptNkVjcEFINzRlZUFtdnJyMHNaaFk0SWdNUHdTbTJDaDNHVm1iRExqOXEx?=
 =?utf-8?B?WUJWUGFzZEc5N2RCSkU1c01sakFMeFdnSWt5Q2Y4UXFmVmxFNXUzOTlHK3J4?=
 =?utf-8?B?ditPc0xERXJkLzNSTmNmNXNTNzY0NFlNVW93dk12Skc5NzRUTmFrc1Y1OG95?=
 =?utf-8?B?ZiszYUFDQTdFQmFGeGsvaVd6MlhtV0Mwa3lhR3g2VElMU21Ka1JtZ2VzSlF1?=
 =?utf-8?B?RU1kMjNERXdjR2JsQnc1R0x0WGgydHl2QjBrMkJrbDhkenRQL2toTDNKUXRs?=
 =?utf-8?B?WlFTdG5RRG9vV0VCd3pUWlNQSm1KbHZhUE03ZER5Y1NmY2M4YkcrcS9xWW92?=
 =?utf-8?B?MzJwMzg3SUhyaHFXUjd5T1hLUHBWTFdhTnRQWkJRZ3BleUYzaW9UWXRaT0dk?=
 =?utf-8?B?djdWdG1ON0FQR09GZzZZZ2pzVkhOa3V0WjBxUm9nUFZ4R285cWpKSkFDeCtT?=
 =?utf-8?B?QWRzeStwWEI4eDJlalJiTUpVOXF1bExRWDFHYmNXdTExaitIZ2ZZbWdaTGND?=
 =?utf-8?B?Njg0YVVYNENlWTBJcUZ6WGJCV3dQNHFNM1pITDV6Z0pPTk1sQVN6VUV5a2Va?=
 =?utf-8?B?Sy9TZytVdUo5eFl4Y3lDVmd2NVFmR1lMd0cyWGo5OWtpK2ZEYkpWUXNkdHRl?=
 =?utf-8?B?SzNvUCtKbEw4Vlo5Kzl2SlRoZXdHWFRBUHZSWWovUmx2YmhwUFY5UUZUZXBu?=
 =?utf-8?B?OGpDaXF3YlFRMWphemZaN1lGMDNwYzRwbXQ4TFZta1JwY2FLdFpTVXRyWk1Y?=
 =?utf-8?B?bzlCWFdWN296QmFSWXV5OWRrT2V3RW94V0R1K1YxL3lNdndPdkh3c21PSUYz?=
 =?utf-8?B?OVJHWDVrSWRKU2E0aExETFBndlpPb29TT2hNUHFvTWZMLzByTnZOcyt3Wndi?=
 =?utf-8?B?VGltY2FwaDZIZFpkOGI5M2NUOVM2VVlwVHAybElDQXIrbG5TMis1S244TFFY?=
 =?utf-8?B?YjJmTlozZEhQYTVxeHpOb1VKbEpwcnFDOUV3ZzJzT3JWT3BzMWJNS2oyNUJK?=
 =?utf-8?B?Q1BhTytaQWxHQ2ZWTW9ydytaRFl5WkhFcms0cXlOWXI1aXlxNGZpTm55NFU5?=
 =?utf-8?B?M2wzZElXeWdJZFIvcTZ0Yk8veXIxb2hSdzJWOUs2Tk9aekNXOU5pQlF6MWtu?=
 =?utf-8?B?NjVXa2IrR3puOHZYM3cwTUVtSjgxNXBnQ1dEeDRhSkgyazRkN3ZhSzRBYWU0?=
 =?utf-8?B?N3FtQTFkbUUyNzg5eTFKY3dOTHVTQmFtRkhjNEgrSVYvZEVlQ3U0ZTFmKzQv?=
 =?utf-8?B?QThmaEtNbDJOOWVQZjNYSmR5RnZBY3VqaXQ0b2cyWlhhQXFLVGlrREFzRmNn?=
 =?utf-8?B?ZFNmZXRJbU5ZbjJZNWptT0ZMdmx0cDNVdW9seWVSbFovT1E4M3lGOXF6dmdQ?=
 =?utf-8?B?VGxCVVNZdjliTkdUNTlMNnRpMnMvM1p3Y3dkbTNuTEtlT01nMUdycWNVNm5x?=
 =?utf-8?B?Uk1tb0VXd0xNQmVDejZnMDRZUEYrM0ROYnBsbWVOYjYzdzVvbXBkUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b7768dc-d655-4f53-5183-08de4deae105
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 12:47:12.7738 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NN/O/exSVEERreoxlzYnHlYwLQ5Ot4E6dGznFARGJz+ZxE+DubUud+h0581KRc3c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5932
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

On 12/23/25 05:41, Ding Yihan wrote:
> Fix spelling mistakes in the comment block within amdgpu_vm_bo_update().
> Specifically, correct "contians" to "contains" and "WIRTEABLE" to
> "WRITEABLE".
> 
> Additionally, improve the grammar, capitalization, and punctuation of
> the comment for better readability.
> 
> Signed-off-by: Ding Yihan <dingyihan@uniontech.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index c362d4dfb5bb..502d32728008 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -1352,8 +1352,8 @@ int amdgpu_vm_bo_update(struct amdgpu_device *adev, struct amdgpu_bo_va *bo_va,
>  	list_for_each_entry(mapping, &bo_va->invalids, list) {
>  		uint64_t update_flags = flags;
>  
> -		/* normally,bo_va->flags only contians READABLE and WIRTEABLE bit go here
> -		 * but in case of something, we filter the flags in first place
> +		/* Normally,bo_va->flags only contains READABLE and WRITEABLE bits here.
> +		 * But in case of something, we filter the flags in first place.
>  		 */
>  		if (!(mapping->flags & AMDGPU_VM_PAGE_READABLE))
>  			update_flags &= ~AMDGPU_PTE_READABLE;

