Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OF66GA1mc2mivQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 13:14:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAC07598A
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 13:14:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74B8910E125;
	Fri, 23 Jan 2026 12:14:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PUrJyslp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012026.outbound.protection.outlook.com
 [40.93.195.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C65010E125;
 Fri, 23 Jan 2026 12:14:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HyVeyfo4iYGAFjiMcCLFA0aUhqPrwuxpGv+CIMWetWtPr4TypZy+nTglxLYFtdquwfBhenEJI2Cjy/I8RjDfS1Czp39f7/Lw/Eux7o30a1VRFQu4j9yanAstj8dBDjqP97W0mdK1X4L5oDeWTP63OtYlvBeGLAFNPSvXnmBbs8vLVpI6oBlu87kIuOI3+OtDumFWpctnnjqr0lhI9+ruTtCu/odrKC+eqHYAJTJuuBqE48K+luc+1BFoz+R2iIiZ729CFy7yZiRoutx/nyHHloX88YgSdBRLrB1NzRUIPG9stOfyTpIe90C6AJE0EkeD47L/+qxziBqqNwXolaxIFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jWp1Dw4Mtgne2nN0setBn8O0NC4fCEQHQHP2I44C+g4=;
 b=Q9jGGQPIcmygpmtRkmL/KrFsPsi9yEv0P8c7vu+MGB0R7xf1FB/UB4IEgTCUokk9T7KYX6xmFO+YaQ2d/l2zhfBXQR8yT6j4sjPi3rU/6AXSbVOXtLpZyKjWQgm68MB33+Uuz4VzUIipfagl8a4+x5iHh6FRsXHNWGVqShJWDShmNePy4w8AxbtH9TU/oo39celJxVzwZtzve3ronHilI2HleuNqhLpE6xrcDD96ihYtLu4CUrCoXg6pHb0rm5G/8SzSZcfBmLwq2qQU3BT6keL71y4vFwoyXsXqf1eF7jTDSDIpSkMjWUCJbeJn90QVax1zCU/zMiRG3vv9O9zCkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jWp1Dw4Mtgne2nN0setBn8O0NC4fCEQHQHP2I44C+g4=;
 b=PUrJyslpaKgz/jHwNshZ4nwKViD0/RyqPuUqTY0Byg79y9fik5hxae5yHqfFk0H9JATWMrpYbmHfazjZgdXl1MDyo4hN3T2TSYAvEiFQAaHQy0oKUcxvlqt3CfJeRxa6Xggnso7yDhxNrB5mno4RsLG3M8FJ/lg8pavm2AcTEvwOD1v7DmxULNbe40J3aubX5ieHTfh2H6Ry36ImaPfDbUOYq4DN4NgJp5CSEGb6B9TJoUCaggCqVd8lzL7bjn8nfUtW2IJDvAWRwjF7IJ7/n1oSzV138o5OjJYv/QgC/tnKmOaa6rbSgT+Jl8nrwg3Du71uN+CM54vXHfn4H23rPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by SA1PR12MB8162.namprd12.prod.outlook.com (2603:10b6:806:33a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 12:13:56 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%6]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 12:13:56 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Subject: [PATCH v2 0/4] gpu: nova-core: gsp: fix command queue ring buffer bugs
Date: Fri, 23 Jan 2026 21:12:37 +0900
Message-Id: <20260123-nova-core-cmdq1-v2-0-e797ec1b714c@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WOQQ6CMBBFr0Jm7RhaCCIr72FYVDrILGilLQ2Gc
 HcruHP5JnnvzwqeHJOHJlvBUWTP1iSQpwy6QZknIevEIHNZ5UIKNDYq7Kwj7EY9CayUUkV1rWX
 ZlZCsl6Oel714bw92NM0pHI4jPJRPsh1HDk2m3Yhu9gENLQG+wsA+WPfeP4piN37j8m88Cszx0
 tc9lVVd9ELcTGTN6pzy0G7b9gHU8b5Z4AAAAA==
X-Change-ID: 20260121-nova-core-cmdq1-6aaa369824c4
To: Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Alistair Popple <apopple@nvidia.com>
Cc: nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4PR01CA0096.jpnprd01.prod.outlook.com
 (2603:1096:405:37d::19) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|SA1PR12MB8162:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a75a3e6-c9e0-4365-2333-08de5a78e1ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|10070799003|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NGp5eWJLWWl5OUdLOE9VaENVMFRGckNGcjJzcW45RTlvZi9zYTlnK29YRlZ0?=
 =?utf-8?B?R1FYTFZETDFaQ2lUbzFobHphbjIyWjBKa0FFeG42cDQyU0M3cGZqdUQ3aGpS?=
 =?utf-8?B?YjhzcTUyeFNDbmJMVlFvQ2Z4YVdDM1VrL0pvMTI1MEM1NktacDhhNEQ0R1B0?=
 =?utf-8?B?VVVuN25HWlkyd1U2akpJWSsrQTNRTkZRVTkzRHlXZGVHbnR1aFNEaEI3WUFo?=
 =?utf-8?B?a0xQU3drWnZ1dW9kZ2kyMTk3SjBJalduUURPVnk5T0k1ZHZ6NXpyQXp3akFX?=
 =?utf-8?B?Wml4Z3hFSk00VFNVUm96cEx4MDc5RTVFaTdjMEtPWlVIcngwZWVVMWlSaXFB?=
 =?utf-8?B?WG10MHRkVUt6b2IvcCtxWWMvUGFxUGYzNElHUlIrWm9leFB2N1VheWNaT3Ra?=
 =?utf-8?B?YkJNV2UzdDVkcmZZSTVvaEhQSWs3Vy9uc211U0hBRmFzNUJ3OGF1dGx2MGRM?=
 =?utf-8?B?b0tiYWFvaGI4eHFoSGtJTkZKSi9ydjRZdzRSZWw0NkQ2MTFjSHNMWlJYRCt4?=
 =?utf-8?B?ZUFWYWVXWTlSUlhuZE8zZnVSOEtWS0ljK1M4ak9VMTlSbG96ZVhMR210SDJ2?=
 =?utf-8?B?TmlMTmpNWVBhcjlDSW92SDVPQ2ZvM1o3MkZaL3c3VlBsK0dPZTRHRGdkTzd1?=
 =?utf-8?B?R0hQZmFDcFZBWXVnMTVNMFdrSHVLYjZiWjdkS2VmenREZVBCMHdLL0R6L3VJ?=
 =?utf-8?B?cWpNNy9jWVZqbEkyUWJZRWRneVpHZVMzTEtCK1RFQjd0NVlha0dHUFdpTEls?=
 =?utf-8?B?RURuRWtRQWdyYmJFUlArWDR6TjRIMDJCaWxaN3BITWtTUC9jUy9FczRUTG0x?=
 =?utf-8?B?dW9ZdE9EQnlPdFlraTFENVNXcnJJYnZpbVdjdlhrdFA1b1NOeWlIazBoZGpp?=
 =?utf-8?B?N2xmNTY4R0VMblo1M0xGR0NWSGxvZ09abFVCaXRpN0Vwc0swaFBZMXN6S0hm?=
 =?utf-8?B?YVZleFBVT2Z4NmRxT1U4TDJyK1d0aXJxR0lRbzR4c0ZSS2IwRk5aN0gvNTdU?=
 =?utf-8?B?UmdmcDFkWGVPeU9qL1FjYXdIUDQxa3QrOVpDY0hMYTgzQ2FhL3RuNEU0L0t5?=
 =?utf-8?B?UjdPLzJOWGZnWjhDSFIwWWx2Si84eGlGbmRUamVGaTNLRTN4Tm84eXZEYkxE?=
 =?utf-8?B?UklQaTJRaUZ1eS92U3QxZHY3UldTbHlRYUk3cFRlYmVoUUV4OStaTDNkYVFj?=
 =?utf-8?B?eWwrVERUSkZCRy9PekFTdXBIajZUeXRvUitiN0VDWkQwRzYyY2lCdnFXUUxZ?=
 =?utf-8?B?ZDE2ZCtNdkRLeDhLT2VzM3ZIVmtxTWdpYkM0OGZWZ3JrVnNYMG1VaUJKWFhk?=
 =?utf-8?B?UnhmQ0g5UkgzMTYrYXN5aUd5ZEZaR2xlOTVGWCt4dVcxUWZvT1FmNUNGVkQ5?=
 =?utf-8?B?cytJd1NoenhyWklPTHJCeW14aVR0M0k2YzA4aVM5Ty9tNEVldkVVbzVCd0tW?=
 =?utf-8?B?cm52SHRWZjlJODU3aU9lYmM2TFQ4bTVtM2NBSGFoNnMzTWMzMC9rTHMwV1Zx?=
 =?utf-8?B?T3NnZ0hUZ3Q1bkN3ZFhCUDlZOTMzWjhGVENNTUVOQnBjMEdsOXMxYnlsUFR5?=
 =?utf-8?B?YWl1djJXSXhWZXFiREgwRTlLY3NLRHRSa3hKTFZCckp1L2cxVDcyUDVUV0lq?=
 =?utf-8?B?NVpMMUZhOGhUNG53YU1vcDBpVms1UU9oSVU5SFNScXd0N2wyOWlFcHp3YmJF?=
 =?utf-8?B?MCt1NkJhS3FZWXlkOFZZQko1Zld1ZFMvTjBlYkN4YTRaaGZRcjdXZEdXRm9R?=
 =?utf-8?B?WnlhSG5SeTVGcjZkSElqbjc2WWpFcjRlY2UrWUUrbW1NYklFZ1J5elZUeS84?=
 =?utf-8?B?REk2Q0R2YkRRRVkxb2hFNEpKME1xZ3l1UVRvakthUjR6cjh1OUh4eUdWUTk4?=
 =?utf-8?B?NDFGNzgxV3c3MC9vM2pxTTRRZFJaaTZkVDNqQmNaMVNYTDhlYm5ESkVYdEZu?=
 =?utf-8?B?ZW42R28zR25IZGJ1Q2tPZDVqS3hDdFFoMWlWQVkxdG9sSGYydUtaSUVvdHcy?=
 =?utf-8?B?YUJDNDBUQWlXSlZkNDUvTTdqS1F1dDB4Zi9pTTRPYXJsWkw4MUJ3cDNGdUww?=
 =?utf-8?B?RFRyMkJaR1RBWUFWcDJwYTlkMGdscjAzOWtIZk96S3M3MzdWRUo1dFk1RmlM?=
 =?utf-8?Q?lF4A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THI1L3Y4WEpGV2p6VVFRZyt2WFlEOTQxRUVSQkF2UEp4czd3eDBLcWpMRDl6?=
 =?utf-8?B?Q05GV2VjeGxGWGl2ODZvdkcxcmNabmlDNGt6SDVxY0MweTh1RHpzMWJNZEdK?=
 =?utf-8?B?OVJDVzFwckgvOUM1OWExcFRPRnNZakZQODZubzlheWphY2IxdW5lVHdDM3RY?=
 =?utf-8?B?a0pzenkvVkxVTkJWSG9XNHNwem9CcHVibndnNU1XSzNzbmlaVzRBcDQ0cWQ5?=
 =?utf-8?B?Q3VJbjVUSk1tbE1QVkJDQkJkc3FxTDM5alR5RERtZ2J1SkhEalJIM0tRY1Mw?=
 =?utf-8?B?US90RmdyMGFjUnhjTzZaSVNTZUtPUklhNTlRQXJ2VVBhNXNvQ01IN1pHK2la?=
 =?utf-8?B?SXpBUit4UnBCS3E3bkplWStsVXVLQWptdFRwUmpvN04xUGF3VHQ5L2s5cjVM?=
 =?utf-8?B?WDAxTlQ4cVpvN1FoQkEvNkdOT3dtQ1ZudWhEV2VOaWxoVmxlSU9SVmtaeEwy?=
 =?utf-8?B?REd4MTZHYlZhdHZXTTRsVkZOaEtuenY2SzYzVGIxT1BpdVFUbE90WUdUcTZk?=
 =?utf-8?B?MUZLZEFlaHZpa0VLU2xGQUVMSHViTU1Zd3JjTEdGdEdzVnZJeHdrMnkxSU5n?=
 =?utf-8?B?clE1UUw2L25jblhZaXY2dmxlTm9MQm81Z3QxQWQzYW9LdXZOY3dOeFdzSjJz?=
 =?utf-8?B?bGUwbWVRL2J5dkcvTVVoalFJYnZ5R2dUN25MT1FhQk5RWVBoclFENGp3V2Fj?=
 =?utf-8?B?NmVIQTY1R3FhU0wwNEZMMmtvU0ZuNkxkSi9MU3hKdHFRaFV1QWJZdTFGbTBO?=
 =?utf-8?B?eWlOOVpRZWo0THpNTU1RTmZ6a0YrYzZVcEJ3QzE5dkVNRjdrVCtCcmJwakU4?=
 =?utf-8?B?c2FLVG4vNThnejd5eVZkeEFHeUFoaUdjRkEvQjcySFhIU09raGJqbzdOTmJt?=
 =?utf-8?B?OW4zWU11dkhkZlV4UDdrRFg1TDdKakt1RE5uYUF1a3FJNUJUN0ZJdWdSeE9h?=
 =?utf-8?B?cGdIQVZaeW5nTW1BZDc4dWg0UjZCOTNiL2QzTXhXay9UUXJGbzhzVFA4TWhX?=
 =?utf-8?B?Vm4xS0FNK2MwaGFWQ0lFMEUxZXZ4ZnV5Zk14QjI3N2NJbDNWdkRSNmYzQ29z?=
 =?utf-8?B?TnhySUNBZFI1TFhJWWpPR2hKTjc0dTdhVC9yQ1JUR0UyTGFFajBaVC9wOVlU?=
 =?utf-8?B?N2NhSmFXMjhzVENSYlpXTnhyUEY5cTdEdC9aazcvN1pGTm5pRlE3MkN1QW5m?=
 =?utf-8?B?Wk9KUGtHZjN3dDBVc3hMdVNoOHpEODhSVVN4ZlZ1VXZYai9PTUthV2JoWkRK?=
 =?utf-8?B?VitkK3ZqL2hGVVdFMWdraGhpYzNUNkxhbW5XUGp4MHZIT2xsUkJmZ1dDNHI2?=
 =?utf-8?B?OXRrc3paVjVTQVVyZURZN1M5RGZ5enJRdEREYnprbVpYc1pZNTB3NllBMjJj?=
 =?utf-8?B?R2lIRmE0UWVGVFQ4aTdwZHFZWUNvNHU0RDN1T2NpVUFuVGxndmRzNFh1S3Uz?=
 =?utf-8?B?NjFhTkhUa3poTHlWR1Q1VFljblVKTGlKWWliSGhYeDVCR1BNOVorbWRsaDZR?=
 =?utf-8?B?TnBKR1IvOStkOUxoelVqa3lHbWY4U29BN3hNaW1iVlhtWllMVk9XbG14Ymdi?=
 =?utf-8?B?YlJ1Q2MzL0VVWXRXNlAxcmllZmkzTlN0dndMNHVLT2hWRmlrOTNRcVNvcysw?=
 =?utf-8?B?MkZEZjQrY3RJdmNlTUMxM0oyRFhMRDI3TU1ielJXRmRRUmlWVUg2d3FWZkwv?=
 =?utf-8?B?NUFsdXlsbGFNV2pDOWFXaWNDWWJBc1pFVGY1R0VIVGVaTXlnM2xrYWxSakZ5?=
 =?utf-8?B?L1ljRkNyVlgzTUFvVktsblA2dkNNa1pLd0MwQXVxZE82dXNmZkxJTlplMUdj?=
 =?utf-8?B?VUFnY2NnT050RGsvQ2lLZ0Zsa3dXbW1OSFdqTUN2YVBYVXhMYXAwVGp2UXpu?=
 =?utf-8?B?TmRObnBiMzZGdUoydUdCRjYwNnlFQUIrZU5JTFZQR1p3blkzUWFSM3JCNndS?=
 =?utf-8?B?R2xON0xwVVVwdnZkNFdBUDVUeldrYjVWa2JuaDJreTQyQmxlNVpCdU1ISDRF?=
 =?utf-8?B?TENWWFNQSlhweWN5VkdoM240Q0szMFU1c0FZWDhCLy8vZG05WmpWWUVkK05v?=
 =?utf-8?B?dXdxT1l1dVBZaTVycDBwa2MxaFJkVjZyYkMzeUpEbmh3bmlXei80N0RmNHp6?=
 =?utf-8?B?MzB0Z3pEb281dzJyNUVwajRtN0hXMUFONk5YYWRJYk55TlJQU1hIaEJnZ2xX?=
 =?utf-8?B?MkxPTVRabDB3Q1oxaGk5L2RoOW1lU240N2lTWUw5QlBjTm1uNGxEdzNER0p6?=
 =?utf-8?B?T3lnS1NBUE80MmtLd3UwdXZuMTdVeVluV1kxbFkxcUpjS3NEN1E3cDFqazNa?=
 =?utf-8?B?Q3ZxSlp4TmxzYjBoWkxSZ1R5OFJBRTBYZVlDTXNreEJDZVhacnBCbXp2WEdC?=
 =?utf-8?Q?/jfzZdevq1tOSylmpnKQiolJSdavSZ049oP6JlpwgEIDK?=
X-MS-Exchange-AntiSpam-MessageData-1: xk2ErX6lmNpn4Q==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a75a3e6-c9e0-4365-2333-08de5a78e1ed
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 12:13:56.7047 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lSfjTCdcYjLHTSR9Xi94bMTRGF65YradRvCXo3FRGSVPLwMCReAtG4zIe5PRvcfJhs8fT7SpOEsAqUVIpF0sJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8162
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[dri-devel];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,google.com,gmail.com,ffwll.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Queue-Id: BDAC07598A
X-Rspamd-Action: no action

This series fixes a few bugs in the GSP command queue ring buffer
implementation in nova-core and also clarifies some of the comments.

The ring buffer uses read and write pointers (rx/tx) to track which areas
are available for the CPU vs the GSP to read/write into.

In the ring buffers there were some indexing issues which could end up
causing panics, so I fixed those and added more rigorous proofs of
correctness in the panic comments.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
Changes in v2:
- Modified PANIC comments to match existing style.
- Link to v1: https://lore.kernel.org/r/20260122-nova-core-cmdq1-v1-0-7f8fe4683f11@nvidia.com

---
Eliot Courtney (4):
      gpu: nova-core: gsp: fix incorrect advancing of write pointer
      gpu: nova-core: gsp: clarify comments about invariants and pointer roles
      gpu: nova-core: gsp: fix improper handling of empty slot in cmdq
      gpu: nova-core: gsp: fix improper indexing in driver_read_area

 drivers/gpu/nova-core/gsp/cmdq.rs | 72 ++++++++++++++++++++++++---------------
 1 file changed, 44 insertions(+), 28 deletions(-)
---
base-commit: 6ea52b6d8f33ae627f4dcf43b12b6e713a8b9331
change-id: 20260121-nova-core-cmdq1-6aaa369824c4

Best regards,
-- 
Eliot Courtney <ecourtney@nvidia.com>

