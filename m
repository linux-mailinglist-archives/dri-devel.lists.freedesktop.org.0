Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B15EC99618
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 23:29:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B93D10E42A;
	Mon,  1 Dec 2025 22:29:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="wDkSxhzH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010046.outbound.protection.outlook.com
 [40.93.198.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83DFE10E42A;
 Mon,  1 Dec 2025 22:29:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bq+bdAoLzsnK5ud0FAtRhiuUFisN1o3XePj5JdKkEPC8x6C/uiqZwmZgEpwYqkGyIdbmPvTczkKGRnAC3OQrfZP9SczrFyK5j2PFyOTSn73fwPsO7UjsJ5ByeaNd6n0vf6gcRATS1//+ycrJv5+M/PVwRnbvCnNI42Ck5nkgTVTsZFr3Q+ObIGaewTu9rkuFfqFvudLdyjv7fSp87t29yBMhz8IQRB/EGqoM09ADOJJqoaGWmAbtxogUGq19UTTRs3rHB4ztu0a8cJYGPElIcWlmQ+Jh9ZMwyRU7OQxAdanuOTTT7tBarB0aBnvu7fZqjb2P44rZoS20hQS7MCgsoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0OHQw0oDYIgSi+gya5yt2c2AHwoOYt7sKBBuFBUBVBE=;
 b=ifl//zOtm9m6KgO6TtUSS9hQPaIch8TY2L5N4hQuzAvhzk4Jk5jryqq+LRVNvuKJAkB4Y5+Q4XxCz0ZbAVLf5Pm/POBw7/mppmvPN5TacReGDNlRlzoWj5+QPoqsMcqkrAp7PGedrxNoejFPlPuQ9UoLyerkiq70HjuYB/8MDjEA0aNGRIPKlCGnt2og/V+4J2f7P6p5n+PSYPAFfhkC4pfRJ/5gT43MG7e0HOgf17AaaTmUJOEUAJSSUEVzWpavwJp7vhvisSk7kbCa7ep/W1RGqsFFXVEQkzXWzMCk7ZyjVcF/VYCZOQ3/+oQYzlTWlvKonjYrGc85OKSgqyA9Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0OHQw0oDYIgSi+gya5yt2c2AHwoOYt7sKBBuFBUBVBE=;
 b=wDkSxhzHf019GtVYzM0sn+AOK8N8KH+GtZ5kHX7CK9DLXrM3y2YpENOmM/OYGxxL3pP9K2LB6pqy+37ZpMICUtReCNCeZBSm032hWjRLvqqveQ7CGwMLIzulxehU8qTpek1CNM8FGXTB1gH+fprUdJ1PitjcgKWrMEKvW7tSBxE=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by SA3PR12MB8021.namprd12.prod.outlook.com (2603:10b6:806:305::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 22:29:34 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::491a:cce3:e531:3c42]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::491a:cce3:e531:3c42%4]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 22:29:34 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Shuah Khan <skhan@linuxfoundation.org>
CC: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, dri-devel <dri-devel@lists.freedesktop.org>
Subject: RE: Linux 6.18 amdgpu build error
Thread-Topic: Linux 6.18 amdgpu build error
Thread-Index: AQHcYxBZs9KE/Y7yhkeZDGOZn+c/JbUNW+gg
Date: Mon, 1 Dec 2025 22:29:33 +0000
Message-ID: <BL1PR12MB514433045BCF463849273660F7DBA@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <74032153-813a-4a40-8363-cce264f4d5ea@linuxfoundation.org>
In-Reply-To: <74032153-813a-4a40-8363-cce264f4d5ea@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-12-01T22:22:57.0000000Z;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source; MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5144:EE_|SA3PR12MB8021:EE_
x-ms-office365-filtering-correlation-id: d9d0cd00-dce2-4071-2fcb-08de31291a6d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?ejNaNGoyWlZJdDJEcGRpVmdjZ2p4di8zampDV2U2WCt5a1Y1MHBJdUtWWTlp?=
 =?utf-8?B?WkNmRXE5WG81OUFReWdnWlJpK2FlRHBWMkp6Z250OWl3R2t4dzBOeXVYcVdt?=
 =?utf-8?B?NFpORURvOThvNUREdDNwa0dGWnJ1czg1SW1HaG9PTXc2bzZOd0t0ZTJXMGc3?=
 =?utf-8?B?dDRBRVZ4NE1sUitsVUpqVUxZSGZ5NGFZSUhwUVFZUGVnYkFHOEw2enVsV2tQ?=
 =?utf-8?B?cDZxWkRDalk3Q3pFWXhGZkRrRTlPQTRkQldKVllETHhvT3R3eEU1aFlrUDlp?=
 =?utf-8?B?U1JVQnpGdWJvY1NDQ0lWWFdEYUZteFVHaUMxellqQjFwajZGTGQyaytRek9v?=
 =?utf-8?B?TzVoaHFKdExCa2Y5dXIrcFlYQWhrYTRYUVIxWlpPT3l1Z2htMGFHcUtoem9U?=
 =?utf-8?B?RXdxb0dIRHNrUXNVa3JsTitiMFRSNWRya1NhY2k5T1poZ3FudlJmV2IyUGZo?=
 =?utf-8?B?TkZidlRKc0FPNUhTQk1LWW12a21IWnpONU9xSzRaTUxJZ2tnZ0pseGYvRFZi?=
 =?utf-8?B?T2puNGwyNXR3SURWdWtDL1AzVjhROFhMSnliMlhKaEZZUEkxZHpseHNrWklW?=
 =?utf-8?B?aUVySmRLVnYrVUtoZUl4Y0hqYW1Tc2NRRFZrVWxHVnpwaGkrd2V0TWJaVUxq?=
 =?utf-8?B?UFlrVHlJcEVvakxUeUtsS1NnRE1HeS93VnVpaW85MEtnalBoSE4xNzI2M3Bw?=
 =?utf-8?B?YlkzcUVaNTYxMmJGUVFQcktTbWY0M1dtTk9YTmFiQ0Z3OXd2TWxvVHQ5TENu?=
 =?utf-8?B?SnVBbXJHY0lrNlU3NUcrNVdENitNMlJuZ3l5VVFhaEU0enQyaTZLczQyQVZr?=
 =?utf-8?B?MGRsc3B0Ly8xajVVRlFrekxxbHYxSG9rQzdLQWFldWJ5QmtoWHNEM3FKNTdL?=
 =?utf-8?B?ZWdqQXR6a1pFZWZIWHRBZFFBTjRRRWdua2k5a0lFVVRTV2ZpWTNTVFljZk9q?=
 =?utf-8?B?SVBtei9QNFBKdHhLVldSdVlBV2pVNjl2NjBJTktwSzZGSWRQWDA2ei9POXor?=
 =?utf-8?B?cnY3U1FER3FhVWRVWkRra3RqSlV1RjF1TTdQbzFWL1BaSDBoWU9kZUIzeTBa?=
 =?utf-8?B?ODlSbi9VZUZhdTlvWEJUUVZsM2lWR0lpSE54SXIzNWhTVkFuUlpldTJ5Tmlq?=
 =?utf-8?B?dzBCNW50VHgxNHNmUk95ZllQczRXajVNZ1ZSNytDQW9VSEtRVzhGVDhYTSsy?=
 =?utf-8?B?c21ZRGhjYXdJUUpJZEpHU0dYdzJVWW1FNGJCZ2VQS21LUGJLa291ZHFGR2dU?=
 =?utf-8?B?bm1sbzRpNERIUDFoUUlIeVVVRVFVc3FqNnRPQk9lTmpCMTJNbWNCWTdzc1No?=
 =?utf-8?B?aDlCdUQ5UmpaVU5EdXNpdlBHNEpKUnVhNkRXS0lwSFl6UnVsTG5wNjFseCtx?=
 =?utf-8?B?TUdnNGQzYkhpK1p4ekN4NkR3K3VHbmluam5jTTBadENXdEJBeDVObC9SRWZV?=
 =?utf-8?B?NXgyMlF4a2ZlSUNtTkVaRnRtVVE0QUVSbENuZ3BEaW9ZM3BLWHYxWDk5WjQ1?=
 =?utf-8?B?ck5HQ2dQNTl0dHhuVGpJUnhLWkttSkxCV2Q0ZzN6UDJ6Nm93UzBUTDdkQjJ3?=
 =?utf-8?B?dEd4a05TbFdsQ2tHMGhvRUprUEZCVzVTTkZOZ3czOXczclhBckRIa29Pbnk3?=
 =?utf-8?B?azBILzlTbHpFRlBUMEwvVWdMdzFSM0JTVGhKTGRHT25GWi84ejE4TTJWWmRK?=
 =?utf-8?B?Z1lYaktiZUdFbit6MzdWTDlrUmdNRlVFTW5RSGRQL0lYZmVwaVA2R1dNbGZG?=
 =?utf-8?B?bFV5V25KY1dLMkZZRHdSaHR6UU5hZ2Y3T2gxV3JlQk1SQStDTzJyRHdCV2NG?=
 =?utf-8?B?bTBKdk5yakg2RlZkMlJvd1dDOS9qaHNjeEZ0SXorZ05IYWVxdzYvTW8zcnZ3?=
 =?utf-8?B?WG84K0l2bVBiRWw3NXRleXhrY01aWkRqYnJSUVFiQjBZU09pS0Z2Vm1hNFdu?=
 =?utf-8?B?NHBmQzFuaW5SN2ZudWl0WVpZZHdaSmNnMjM1NTFTV21PVXJHZ3RMWXJJc2ov?=
 =?utf-8?B?eDliU0g4SWNHdWhDOUxOQkpEN2tEcVBEU21HOUFINWFUdUlPSlRhbGM2S28w?=
 =?utf-8?Q?lTo0Bp?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aVpTVnIzd2xJa0tTa1pJSDNZNUNBbkxDUjVCSXk2bU5GM0gvck1ZZ1creVQ5?=
 =?utf-8?B?WTArZ0l5Z1lXdmY1eXdXOGlVYUtDS0I2L0VJTzlMdG9pd3hMRlhFWWNRdHIz?=
 =?utf-8?B?WW82UWh6VGZBMVd4czZ1Z3JGVk56QW1pWlI5dkFabWlsKzU3TWNFODRyYmFt?=
 =?utf-8?B?WUdjbzBnWW1DVzc2VnY4WXp5aXNack5WL0dwaklkc1JsYkk3VExHQzI2VnNV?=
 =?utf-8?B?YmZIZ2NqQlFXTXZ2SzY2aHFHNkhyNkhHa3BadXVPN0E1RTBOZGd6SWZYVlBq?=
 =?utf-8?B?Y3kyczZJeWpqSFNmRW84Snl1UWNpdXBuV25ZUWN6bkhjUHpybzlOdVlBT3N4?=
 =?utf-8?B?RVkzdzRtS2ZQWnV4M2hFVUIrSENxU29HdCtEZFViV2N4aUx6dGVVbVlCSUdn?=
 =?utf-8?B?S2tSUEMvR3BHQmtMOVR3R2Vld2s5ZzdtR0NvVmgzT3d4Rzlrc09ZS1dXVUFq?=
 =?utf-8?B?RjVVWlB2MmhWaGJWNVJWRThhS0pORklacUVHKzM2aTEyL25SSzJodXZpQVE1?=
 =?utf-8?B?UXRTVlBDeHFsSWRyNkxLb3N3T1NPbmJhM2RQNEFlUEdlSGplaDE5VnY3MzRX?=
 =?utf-8?B?SDdDYUJ2M0M0OUxEM3ptZ1lvYkttUnZxeGlXdDFyM0tabm1DZnROZkIzSng4?=
 =?utf-8?B?Z1FNUnhDcnc0TUVjYWlQV2hUWjhYenBFWUh6SVlIWEhmbmxDWUFEZEt6TXVq?=
 =?utf-8?B?TXhhdDQwVE5IMVhGcUxKYWYwV1NFQndoNVB3WmdXaFExQy8wcmtoYnhuRE1G?=
 =?utf-8?B?bklXOHJsQmRveGNqUk13RGQ0ajRicWxoaHlqVmtKUDNoVVg0K3lNQXYyZHZN?=
 =?utf-8?B?alpSRE91anNqdHZCRTkxRHVRYWdZTzJUWmQzbzd5dTgyNEk0NGNZWmJhaVJF?=
 =?utf-8?B?ZlBUMnlERFYxNXpyRGJ1dzZUZC9idnNteHdTWWd5aDhCUExpeldLRC9uWFAy?=
 =?utf-8?B?d3NkVEgzMEFqZExKOGtkNmZFSEU2dVZlbmtxYTBNWlk2UjBMRXp3QWswT09U?=
 =?utf-8?B?eGlZNmxmZ09hTlFPYzFHbXhoMXZNeTNxa2pFcmdBb2NLU1pEbzM3YnVIZTIx?=
 =?utf-8?B?dFUxM2szUWhrM3QxQlJXQ2p1Z1BsRjRHdUVXUEZjVzRFOTRBMXJRbFRsQy9B?=
 =?utf-8?B?a2JxMzZpN1F3QVh2NnBRbE82K3hzdzM3TDB0OEZwQjNhV24rWjRsTSt3YmJD?=
 =?utf-8?B?THlMdjFWTjhCbjFVeWlNOXRRR3V0UmNBYmRyMitqZkc1TTVWSlR3eWY5YjRE?=
 =?utf-8?B?U3hCMUdYY1c1QzkydjYvUkhJeWVuMFN2RC90ellhNEE5V3ZpQjd1TVZKQVhV?=
 =?utf-8?B?YUtzUkg4aFF1UVVKV25mcU91cCtPazN0M09LSWNMMXo2cVE0K1ZsY2xRU2dm?=
 =?utf-8?B?Q05OcFNqRDVaZVlkU0QyaWMyZ3hXeDkxTWJBYTgzV2VTeWJQbDBIOFNkMnVR?=
 =?utf-8?B?NC9WVE1DQVc1a2sycXp2WDR3VjFKUjdDazlaOFNhdWNXOUhqUTd0ekRISlo4?=
 =?utf-8?B?RU1kSkFoVDVuZFJlZHNoZWN0a0JDdUZiOEYxdHBsbWNBamZad1Z1M01vYWZU?=
 =?utf-8?B?VXNxWUx6MzZVTWliNHZ6TDZjbnR3NjZWQlJLSVRHdnE4alMwQWdyN2VQcnY5?=
 =?utf-8?B?Y0gxN1dQdHRUWEkwblBITElPUFQ2TVNiL3dBQzdRVWFRVGNtTlJIYmlUTU5a?=
 =?utf-8?B?THYrajhHdFV0cndqTHpJWk9IblRyZ0xCS2hqeGFWL0ZBYVVveW4wdDJEQXc1?=
 =?utf-8?B?T1NWVHVRR3d3ajAvcGxVSEZXY284ZHd1Vk9yLzhyeE5XMW8vWjEzeHBwWGJQ?=
 =?utf-8?B?cHVSQS8xVlN1cFUycC8wZFphdjIvc1FZRlp5TUEwSXVRQ05NbE5MYVhzbU94?=
 =?utf-8?B?d0NCaGVJS2kyZGx2OE0ySmxmRzdSa2l1UkJYSXZZbVJuRWNLem9yeVJadllV?=
 =?utf-8?B?SjJnS09yWXdJWHFTTG9GVFkxc1h1Z3ZWQmJkcnlSLzV1U3lhSFlnSWlZTzR0?=
 =?utf-8?B?YU1LMUJ0bitodHJONlhTUGFvYk8wNU1QeHNZbkloc09iZTFmZENUdlNRQ01s?=
 =?utf-8?B?MDk0aEhDNmdmK3VCRmNFQXNaM3U2dWI5RmhQSE05U0FVdmRYU0RabEY3RHZK?=
 =?utf-8?Q?veX0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9d0cd00-dce2-4071-2fcb-08de31291a6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2025 22:29:33.9456 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W3vUNHEKYj1ztn8pPpJXK2YVthL2ErvLyq0TW6qtP1O5uuSYG9Rf9+F++XZs+0f7w20E34UL/vscqHKh4LijHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8021
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

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTaHVhaCBL
aGFuIDxza2hhbkBsaW51eGZvdW5kYXRpb24ub3JnPg0KPiBTZW50OiBNb25kYXksIERlY2VtYmVy
IDEsIDIwMjUgNToxOCBQTQ0KPiBUbzogRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1
Y2hlckBhbWQuY29tPg0KPiBDYzogTGludXMgVG9ydmFsZHMgPHRvcnZhbGRzQGxpbnV4LWZvdW5k
YXRpb24ub3JnPjsgTGludXggS2VybmVsIE1haWxpbmcgTGlzdA0KPiA8bGludXgta2VybmVsQHZn
ZXIua2VybmVsLm9yZz47IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBkcmktZGV2ZWwg
PGRyaS0NCj4gZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPg0KPiBTdWJqZWN0OiBMaW51eCA2
LjE4IGFtZGdwdSBidWlsZCBlcnJvcg0KPg0KPiBIaSBBbGV4LA0KPg0KPiBJIGFtIHNlZWluZyB0
aGUgZm9sbG93aW5nIG1ha2UgZXJyb3Igb24gTGludXggNi4xOC4NCj4gSSBzdGFydGVkIHNlZWlu
ZyBidWlsZCBmYWlsdXJlcyBzaW5jZSByYzcgYW5kIHJjNiBidWlsZCB3YXMganVzdCBmaW5lIG9u
IHRoZSBzYW1lDQo+IGNvbmZpZyBmaWxlLg0KPg0KPiBMRCBbTV0gIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdS5vDQo+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5v
OiBlcnJvcjogb2JqdG9vbDogZWxmX2luaXRfcmVsb2M6DQo+IC5yZWxhLm9yY191bndpbmRfaXA6
IHJlbG9jIDM5OTM1IGFscmVhZHkgaW5pdGlhbGl6ZWQhDQo+IG1ha2VbNl06ICoqKiBbc2NyaXB0
cy9NYWtlZmlsZS5idWlsZDo1MDM6DQo+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dS5vXSBFcnJvciAyNTUNCj4gbWFrZVs2XTogKioqIERlbGV0aW5nIGZpbGUgJ2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5vJw0KPiBtYWtlWzVdOiAqKiogW3NjcmlwdHMvTWFrZWZp
bGUuYnVpbGQ6NTU2OiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdV0NCj4gRXJyb3IgMg0KPiBt
YWtlWzRdOiAqKiogW3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6NTU2OiBkcml2ZXJzL2dwdS9kcm1d
IEVycm9yIDINCj4gbWFrZVszXTogKioqIFtzY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjU1NjogZHJp
dmVycy9ncHVdIEVycm9yIDINCj4gbWFrZVsyXTogKioqIFtzY3JpcHRzL01ha2VmaWxlLmJ1aWxk
OjU1NjogZHJpdmVyc10gRXJyb3IgMg0KPiBtYWtlWzFdOiAqKiogWy9saW51eC9saW51eF82LjE4
L01ha2VmaWxlOjIwMTA6IC5dIEVycm9yIDINCj4gbWFrZTogKioqIFtNYWtlZmlsZToyNDg6IF9f
c3ViLW1ha2VdIEVycm9yIDINCj4NCj4gSSB0cmllZCAibWFrZSBjbGVhbiIgYW5kICJtYWtlIGRp
c3RjbGVhbiIganVzdCBpbiBjYXNlLCBzdGlsbCBzZWUgdGhlIHNhbWUgZXJyb3IuDQo+DQo+IElz
IHRoaXMgYSBrbm93biBwcm9ibGVtPyBJIHRob3VnaHQgSSB3b3VsZCBhc2sgYmVmb3JlIEkgZ28g
ZmlndXJlIG91dCB3aGF0J3MNCj4gaGFwcGVuaW5nLg0KDQpJdCdzIG5vdCBhIGtub3duIGlzc3Vl
IGFzIGZhciBhcyBJIGtub3cuICBUaGVyZSBhcmUgdGhlc2UgcmVwb3J0cyBmcm9tIGxhc3Qgd2Vl
ayB3aGljaCBtYXkgYmUgcmVsYXRlZCwgYnV0IHNvIGZhciB3ZSd2ZSB5ZXQgdG8gcmVwcm9kdWNl
IHRoZW0gYW5kIHRoZXkgYXJlIG5vdCBxdWl0ZSB0aGUgc2FtZS4NCmh0dHBzOi8vZ2l0bGFiLmZy
ZWVkZXNrdG9wLm9yZy9kcm0vYW1kLy0vaXNzdWVzLzQ3MTkNCmh0dHBzOi8vZ2l0bGFiLmZyZWVk
ZXNrdG9wLm9yZy9kcm0vYW1kLy0vaXNzdWVzLzQ3MjQNCg0KVGhhbmtzLA0KDQpBbGV4DQo=
