Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id co4NLKFld2nCfQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 14:01:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A808887D
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 14:01:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B04010E12F;
	Mon, 26 Jan 2026 13:01:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qwntJScD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010036.outbound.protection.outlook.com [52.101.56.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60D8710E12F;
 Mon, 26 Jan 2026 13:01:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CrC0qdKvqk2YR617qgSfETeT1We9vUNMugwZGkAYOL8mQNf+CQPHKzkMXf5PsoJ+P+q5woe1spagDpdL7JR90adeP//WrebUBFWfx2j0ls1IGlV9C97bb8rgxgTZ+pf3cbVzc6NnpaHGYKEke9HVp4qs8l6XRwpnmyuMf7oMBxcCzt5atouJ4GIsYQA/E+/lLibZQFI/n3/a2PgusFrGEB1LDEOm3Px3K4sexF0qGkWJTMALVKf8fo6tvqO2hUdllYwWXQoSG7ermAHHJUUiSJcR+i9tNUjxs+7ZRsewWWpzVMn6wgtaqpmDJ8aa2OfWfHJSZ41toaoUI0Lhgzk4Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3PIn7jtxZRxabtfZKvpBgaA762IMALlVEraSYsyFCMU=;
 b=tnCzcTep/um8Zqxrtl0/8377EEfYk8iRCdpVAlkZoVQNONcd1n48WDb4UWmKkOhniIbVC/8H7hYkoGoa5+FVVcaBnTnn0z1w3iWWeNA25k2jRHAWU9qYGtvHHRv3Qm3LHv+BLvi6BIxzvZRN0IhsTuVAyVtkj7PP0+PoTXbVVaMAgvzbCFo0DH42DUq8lSX3eZwui04Vbyd4hsH5a2DSS+Os4frJllpcLwOtXxg8n3g/5U9CXAvqmVutEz6BEMj7G8kscXoN5+x1fF1VULImt2lUfDghthmzhsX8XvFifRg+YNMDJErNzxhLoZXhr9yBJVxuDQzBnK9C84a2U1H5/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3PIn7jtxZRxabtfZKvpBgaA762IMALlVEraSYsyFCMU=;
 b=qwntJScDkAeQ5t+KG1RpNGiX9D/X0ulT+67qDg2NKZNG+ToDDnTY6HPaidaqsbF/sHX/RH0pM/RGEN58qKDV2GP3weIY10VI/CHhtOFgXttraykdaF5fzYKuVXWeGh5sUErhny151GmNiCGQOaAjpoWTySzv7TRo1ulmrAvN07w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB6836.namprd12.prod.outlook.com (2603:10b6:510:1b6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 13:01:11 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9542.009; Mon, 26 Jan 2026
 13:01:11 +0000
Message-ID: <601b38b5-1890-48f9-adf9-54fb85650852@amd.com>
Date: Mon, 26 Jan 2026 14:00:59 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm: introduce page_flip_timeout()
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>,
 Hamza Mahfooz <someguy@effective-light.com>, dri-devel@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sunil Khatri <sunil.khatri@amd.com>, Ce Sun <cesun102@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Kenneth Feng <kenneth.feng@amd.com>,
 Ivan Lipski <ivan.lipski@amd.com>, Alex Hung <alex.hung@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Mario Limonciello <mario.limonciello@amd.com>
References: <20260123000537.2450496-1-someguy@effective-light.com>
 <2de6d428-b997-4ba8-8766-a211e5612e72@amd.com>
 <2349754.vFx2qVVIhK@timur-hyperion>
 <fd3f2b16-41e7-4a9b-999d-e137e5abb7df@amd.com>
 <79ed136a-cedd-4e97-adb8-bc3f4f2b8bb4@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <79ed136a-cedd-4e97-adb8-bc3f4f2b8bb4@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0171.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB6836:EE_
X-MS-Office365-Filtering-Correlation-Id: 34001abc-6ac5-4288-cd09-08de5cdafa86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZS9tOUsxTVV0UW1oajdtV2F0MmZMZm9nbDRUdWpVL0ZjcTRqVERzY1dHeWYw?=
 =?utf-8?B?ZysrSy9GT1dHMm5MbTNGTG5CeWU5bGlNQUl5QVpMRnZRTFVqR0F6bnJ6Z2ps?=
 =?utf-8?B?aUN1dEJ4cnptaXhhNXJneVZEb2p0NWZQUlYrelM2SXVSRHd1aWNKckhqU05N?=
 =?utf-8?B?Y2tUbGwvcmxNTy9iV1RydlpBTGhJbFNVVUlNbzZhQlExQTZlU2o2UmdqRVY2?=
 =?utf-8?B?Z1VqSmhSNFlDaiszNCtwTHhUUWpvTGR2Zkt5OU1YbjRZMkIraUlpN0RFVlhZ?=
 =?utf-8?B?OWxPbTREWVQ3STdmRFlsR1hsdUdMZlN1OER5VEhDK013UWhvM0VhVU9hb21k?=
 =?utf-8?B?V2JMYlVPNmtvL0VXUk9pTGIvUThtTEprZktxNVFhTWRnSWRqWDBlTWVXaHhW?=
 =?utf-8?B?Um1QRHhheFNQZm11RHR3VTZtQ0tETXV3TFVLb2lpTDJUdldGZGViVktqYnp3?=
 =?utf-8?B?ZE5kc1ZReWg1bzFwQW1xYVRoNGhkZjREcTFmSWUyc2RwcjQyckswckE5UFV5?=
 =?utf-8?B?TUp6RFVidDdCeXpGcXd5WENrL1ZKY3ZZajFmTDl1enFST3c3ZHpUUUFuN1JW?=
 =?utf-8?B?UEpzUG13YmpWUHE2cFVmemUwb2UyL1RIYWo4N2syaXhvaG9hSHZxWUlyNzhX?=
 =?utf-8?B?Q1RsdnlPR3FkZ3NWQVN1bU5KZnRsTjFkUUVReXFXRFN2QXFlMnloSkRaVWh3?=
 =?utf-8?B?MjBiQzEzYnNlQVFVSUhkMW03VzYvWnNSaGlmM3ZSbXhHaStCeWNDZ0pSRnpV?=
 =?utf-8?B?djIrRmh2azFBeGhMN2ZidkJ4ZU1obWlHMTVsYnBkWUdQVXVNL1ZPZG5qOS9a?=
 =?utf-8?B?Y2EvMVdSd0dERGJNaDB4a25QUkNDeXhDUnNzeFMrMlJUV0kxVzJSb2JkK05n?=
 =?utf-8?B?cStWRXczZDZORVZaMkJ4WWtpdlIzNkdzZGsva0JrMVVqWEsybUtqanlmMUVi?=
 =?utf-8?B?NDFnRGJ3S2NlK0xIQnM3OVAyc3F1eGRpYkRKTXVEd0syWWRjUTNlRGUrK09x?=
 =?utf-8?B?VlNLZXM0K3dpWEZPSFFTUCtsMUxuQ1EveFg2SUtkSkRReFZJMll6a3o3RU1Y?=
 =?utf-8?B?cGkzK0R2bHVqZmR0WGZ2VU13QlRYcjRjYnZUYjlpUmYxek91TkYwaEM2T0h1?=
 =?utf-8?B?Ti9KZ2ovZVZ3T3hueFlCNFBBYlBPZWlFUVJaR2t0NVVhL3JzbFB1dmduTU40?=
 =?utf-8?B?dEJENERzaGY3N3Bud3FPMW9SL0JkdGNsbHZYNzVHTVhGbzZ0YmRlbVFVcStk?=
 =?utf-8?B?bjMyUG1rcXNGaHEySmlqQ3hJT1hyb01Rd0pVdUdHQ1R5bGpMS2VCYnYzUjJu?=
 =?utf-8?B?ZjkrSWY1T1pmSm0yVnpCRkc0TG0zaUdKZ0lGZ1NSRG91djNXWU0vZEJPTDNO?=
 =?utf-8?B?NGh5WDhtWVBUbkVBN2grMHcvWC9wbEtmck1rMTlYZjFQMFkxYmxINEhjcGJz?=
 =?utf-8?B?VFJHY0hpMFM2VVlpd3hvYnR1bmFMSGkrb1R2aTFnY2Z4REJwM2YrZmkrVkZC?=
 =?utf-8?B?RVZqOFJET0NtclV4V0xBTFROdjJrNis1V200aUtYWVllOHprS0FSUURJMWpI?=
 =?utf-8?B?VFdnbjc0R2FYd2ttZlNTTFdaN21YOWlvb09BbW4wL1pwZ0k1QnhsWjJuakhD?=
 =?utf-8?B?NU5LTDI0VlJxbGRjaUZzMWc3N3oxR2xsZ2NETUZnM0xMME9zOXRQaW5CS2lh?=
 =?utf-8?B?VWVUM0J2U3dUMEpvY3lmb2ZrOUh3NlZUcS9MVDBJTkI2cldkQWRzczNkdGdG?=
 =?utf-8?B?TVBVSmluZmlzZmZHUFNuVTRMSjRTTVdUemNVQVNaa3pjZ0tVbGhORnFEK1l4?=
 =?utf-8?B?eVJkK1FXMWl6bXI5REpJeWpid09YcjBhM1A0aS92bzNqYnB4aUUxd2h0aEVR?=
 =?utf-8?B?ZUtJVVQrSFN6ZmlhaTg1MjMyZ3JCYUdlanlOeEd4NE5Bc1FGVWI4VzM3VzE4?=
 =?utf-8?B?SGppY3A0UVorWWYxVUh3N0UvODE4KzI2MS84Y2lWRzdOLzJIbHBWNnJRUjBi?=
 =?utf-8?B?Q0tGSVRGMmNFN3VSbUVzV1pCUnBhZG0vMXQ2SE1oYXgzVzhNdzc0Zk5iYWky?=
 =?utf-8?Q?teVUPU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzMwOXYxR1h2UjkrVW9wM01yN3NEUktoVE1TUFNSUnRadDhuUXRVL0NOS0Ft?=
 =?utf-8?B?UXpiR1JBY2hMZllqYzdFaW9YRExxQ05HZDMyTmFhMW1FWWlMYzJsQjF5cXdv?=
 =?utf-8?B?YlJwR3ZJaFk4Ymd5TVoyRE9GVXB3aUpZWVdUQmpHb0NHYTcwUjlJaU11WVpy?=
 =?utf-8?B?MGptbUhjV0REVHYzSllGUnEwb05YVWxkSWhBekxZMXp2YTd2T1R1R3ZQRk8x?=
 =?utf-8?B?N0RvY1NWYTcvZmRNMW5SZGRZSnkvcWREcWxWaTBWeTRvVC9JWVFrQkxiV3Jp?=
 =?utf-8?B?STMzSnVXQk1qVmRFSE11OFhEMS9XRlRsK3NUdVBtQXRnbDBCSEVZMEt0WU9D?=
 =?utf-8?B?SUxkRG10QUQrNERoaWNPdlB5QkxaaXpQbkxBcWhJU2d5K3lCYXdoV0ZnWXhO?=
 =?utf-8?B?RDBhV1hUamRkNURnZzlBZVU2ZXhiSzlVU3RaRzdUdVg2b0JxcHdDdzhoUGRk?=
 =?utf-8?B?Wm1SM3NSdlJ0bEc3U2FkYysrUUFTek9tcEtONmJkYUFDWkhkNGpQMGxrblRw?=
 =?utf-8?B?OFB4N1MvbTBldkhWK1lJbnVQUVQvb2FrU0FlcnBPRzYvR0NCSWZ5Qlk3K084?=
 =?utf-8?B?c25BQkNWZWlFbkRMa29YMW1MWFZhbjNKZElXZVZyUEFHQVFVK0srS1RTTWJu?=
 =?utf-8?B?cUVXMkE3dmdXSnhyMWM2d1N2VEgrNEZpeHRROWVUQXhVWXJNZ0YyMEhKVUJt?=
 =?utf-8?B?K1l4YzZQMzRvNngvYjJMLzNjVnJjNHVBcjJqVFI0U3VpYzlrMjZtYW5NaXZ3?=
 =?utf-8?B?T0d6WTJZaUFPZWZDdlhRbHBzL3BrbHlVeFdmSmVBd1BVdnlPM1VWODliMU9y?=
 =?utf-8?B?eTZSN09mL1pvMzA0em9LVEdQeUFjOGlMZGFad0NBNXlFdlNveHN2UXhxMGs3?=
 =?utf-8?B?b2l5UzJYUVoxcnJoZ1QzOC9aYU9qV29HTzU1ay9KdGNWSzRoSUgvZmQ2cHRW?=
 =?utf-8?B?MzhSQ0NLZzJ1N1pRNVVESm5PeHgzcUZhaWNvNEpXQjIrYjZOSDBNaldBRG9a?=
 =?utf-8?B?ZSs1czB3V29vV09saDJ6cnI3S0JwR0pMdG1Rd21NRWNiYUY5a2FRVEYyZXVu?=
 =?utf-8?B?cStUMFdIamYvMkphWjZmVkdHRTUvQlRwYW5sdHVsSERBbzZESHl0QTJJbGVw?=
 =?utf-8?B?b2dzcVlmTDdCeHNlN2xwQXJuMzBoOE5nU0JLTW83TTd0NVJtZTMxeGJmZHRV?=
 =?utf-8?B?L2JRRXRYQUh1NWYwVEZWa0F2dWxhMXNjNXlITEpBckExL09KcCs3SUVGZG1M?=
 =?utf-8?B?VHh1Y3JZRUtkL1VGSXorN3hKMkN3Smt6SEVtVmovSVprRHlORHZUMXhwVzMr?=
 =?utf-8?B?cCtndmRROUxFOEl4Qm5ZOW0vOVlvUEZmNHFJRUdvUDdtMm1BMTNLR0ZZZTZj?=
 =?utf-8?B?NUprSWNWcWlzbGlqWXpRTjlhcE9ubmpOeDlpQnFSRml0cURTbDFycVdPYUpT?=
 =?utf-8?B?U0l0Vk90VGhEaGVQaG5GdnZzQVdhWDNVd2FTU3o0Y0RvRnZvaGRUd2Y1SVFH?=
 =?utf-8?B?WUJSNkVuL0Q3OUlCTGZFcTk4OTRHRm5pdi9SU2tXdjk5dG9RK3Jkbm1DVzhD?=
 =?utf-8?B?MmZyUlg0cWZMRzAzTEhIbkVrNDFjdFF4Um45U0J1aWM3LzhlajRCTmNqVFVO?=
 =?utf-8?B?NlFJSU9PYXp6cWZUSm84cE5OSUJWWFBqZmdxYitjcmlVL2hpUWdVQVRpZi9h?=
 =?utf-8?B?ejJxU2NhZHBNR0NNanRGMzJ5MnFNRG5ZZlkySXdqYmUrQlNtM2U4TWhlM1RR?=
 =?utf-8?B?dytiZXh3VTJZUVlPUUV3YXJxeVVGWXkvNlRsQmhQbS9mb1gycDNQYnNhTWU1?=
 =?utf-8?B?VUdXeUtPaWpJcHpQZnd6NzZqT1VlVTc3V3VKSDdZZUdSNEhmUFRjaWxra1Fa?=
 =?utf-8?B?TUN2VjJkN2RYbXlBZFB3ZXdEM2FYay9zZGdvbE00a2JibjdmM0Z3S09JcGRN?=
 =?utf-8?B?TDJFdXo1aHpXSlc4Q3JmUWYzRTNNUWIyRSs4S0NlTVVhZUIvZHkyNTFtcCtn?=
 =?utf-8?B?SDB0ZjJiUXBwVGduSGxqL01zK3U2TFZNRGRheTVBcnpZSmp4UlZDOG5BWG55?=
 =?utf-8?B?RitpSXZFUEdVSStpRkhWYXlvbFdwUXZmNVR6OTNsN0N1SEZlVlNENmRFSysv?=
 =?utf-8?B?MkU5bHh4UThDS1VqVFR2K0dtUE9oSVUwK2Z6cmx6RXNqdU5WWUdoU0RLblpq?=
 =?utf-8?B?Rk1hTjliSXpJYmJXc3NlMUd2R2pPd0NEcno1dTF4Ykt6UXJlZ0JTQkMvKzd0?=
 =?utf-8?B?ZzU1VzlCL0pyMnZIMmlrdFpOdWN0RmtuL0hTa1o4TjViclNLRHluaU5RYTNu?=
 =?utf-8?Q?Tq4XYAcBs+D+cPSTf7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34001abc-6ac5-4288-cd09-08de5cdafa86
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 13:01:11.1050 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NuODMKHaV+u25/MhWdRmnwVnlRqkReuIo1NskUNdywESote8dq7H+y7LFhpG2dC9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6836
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[mailbox.org,gmail.com,effective-light.com,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,igalia.com,linux.intel.com,kernel.org,suse.de,redhat.com,lists.freedesktop.org,vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 13A808887D
X-Rspamd-Action: no action

On 1/26/26 11:27, Michel Dänzer wrote:
> On 1/26/26 11:14, Christian König wrote:
>> On 1/23/26 15:44, Timur Kristóf wrote:
>>> On Friday, January 23, 2026 2:52:44 PM Central European Standard Time 
>>> Christian König wrote:
>>>
>>>> So as far as I can see the whole approach doesn't make any sense at all.
>>>
>>> Actually this approach was proposed as a solution at XDC 2025 in Harry's 
>>> presentation, "DRM calls driver callback to attempt recovery", see page 9 in 
>>> this slide deck:
>>>
>>> https://indico.freedesktop.org/event/10/contributions/431/attachments/
>>> 267/355/2025%20XDC%20Hackfest%20Update%20v1.2.pdf
>>>
>>> If you disagree with Harry, please make a counter-proposal.
>>
>> Well I must have missed that detail otherwise I would have objected.
>>
>> But looking at the slide Harry actually pointed out what immediately came to my mind as well, e.g. that the Compositor needs to issue a full modeset to re-program the CRTC.
> 
> In principle, the kernel driver has all the information it needs to reprogram the HW by itself. Not sure why the compositor would need to be actively involved.

Well first of all I'm not sure if we can reprogram the HW even if all information are available.

Please keep in mind that we are in a dma_fence timeout handler here with the usual rat tail of consequences. So no allocation of memory or taking locks under which memory is allocated or are part of preparing the page flip etc... I'm not so deep in the atomic code, so Alex, Sima and probably you as well can answer that much better than I do, but of hand it sounds questionable.

On the other hand we could of course postpone reprogramming the CRTC into an async work item, but that might created more problems then it solves.

Then second even if the kernel can do it I'm not sure if it should do it.

I mean userspace asked for a quick page flip and not some expensive CRTC/PLL reprogramming. Stuff like that usually takes some time and by then the frame which should be displayed by the page flip might already be stale and it would be better to tell userspace that we couldn't display it on time and wait for a new frame to be generated.

And third, there must be a root cause of the page flip not completing.

My educated guess is that we have some atomic property change or even turning the CRTC off in parallel with the page flip. I mean HW rarely turns off its reoccurring vblank interrupt on its own.

Returning an error to userspace might actually help identify the root cause.

Regards,
Christian.
