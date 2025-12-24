Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC5ACDB256
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 03:18:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89A1D10E10A;
	Wed, 24 Dec 2025 02:18:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="a+DwXM7j";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="Al2927qm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6159910E10A
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 02:18:00 +0000 (UTC)
X-UUID: c053736ee06e11f0b33aeb1e7f16c2b6-20251224
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=R4X3Kma2VC5c5wkn55UmwCCeeXnI13+ONUfqrVkRdBY=; 
 b=a+DwXM7jnxF45ttgeQT+gc2Bga1KkA5bcKZLBmnwet1z9L1q2vy2zphBsfVxOSSmVIFakejW8P3F6nB6P/7SGen3T3w9ua6193Fjbf7Mq1uoA2QSaN+yFriNX0jMWpmyP5VaKG3bz+w51pGjPOCH3WKDQnk4Kex/cebuSIrP/SM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.9, REQID:a64c67eb-904b-4113-a3d2-dd2273ecd55b, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:5047765, CLOUDID:a6aec6c6-8a73-4871-aac2-7b886d064f36,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
 TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
 C:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c053736ee06e11f0b33aeb1e7f16c2b6-20251224
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw02.mediatek.com (envelope-from <macpaul.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1834647022; Wed, 24 Dec 2025 10:17:52 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 24 Dec 2025 10:17:51 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 24 Dec 2025 10:17:51 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mraEzrvk3VMkaqha+SvEVfc0kuK3YzCCY8+cPNIi6TQ50/uo15Y3qy4nq83VJ9m6fXjhs4qkK4sZAuj0pY+MsqQU+kbmxeDiQNP7Jloucl4/b4lnEJMmfCwDTHLICaUmmr5qgbdv9VUrs0h6X3xt2r+8kTRQrIE6aIhRog8CsapzYzuUqhnsPo30mKXs8TtnKhJRn5POxyKmYHMhhpfCPvOYrO0gSg5EYUUd6dyK8m0qF3FeCpZVvFDEnQKLKQG6tKzFikM4ved+ADnYlCC/9J7RNFI6jEV1Meswr6WoOG7MTL4Rxaqss+lyIUm5x4vHJrKRoYav6KIg+np+epZZNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YosbWqvDh8i/20zUCjkr5bBNbYCL4t7xW/0f8zy7b9M=;
 b=u/EWASV4sVAv6wD8GyjHxRbjIDVqMHYcn1hTVdm45ygqAC9KdTW78GULZK8uvPNR5gLfGfnqQsO1hxy1mQc0PNGRy4pNgWhOJX0ZGSCc1+UmlsEdE3ywKM1d8qW0PjFG62i9ZgZZDit4U6uzkv3k5bUUhXUBgtwJfpSeoumk9qqDOHNSqDRkpZlkRS+GqaCE+yU91O+V43NqpgqoSTI6NiB8weUrR9ZvQ1ad53mGbqM2InTniPcXsUY6TRWoW7HklGtuHGtWKywXVcgXov/4jGipU0Ue/e/Yclp9NgJEvvJB3heD6g3K5ISiE1yeLxXshwH05v9QNfLo9Avwa/JCmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YosbWqvDh8i/20zUCjkr5bBNbYCL4t7xW/0f8zy7b9M=;
 b=Al2927qm2EH/6BJ01q7HHWjrS9fuq1WrWrHKYxR0Fg8RaUyYGKxzr7gS6JoQJ9sZcj221DnsnwgR5V/Jo0z1+GD9eAJnV1QwzaqsITO2ZsnSlZ1Ow9dn7BUBa2KBkq89Cs4Blq5e1bu+yuh3ECveTMKKsmfAj8Fq+pEcTPVrdYA=
Received: from SEZPR03MB7810.apcprd03.prod.outlook.com (2603:1096:101:184::13)
 by KL1PR03MB6899.apcprd03.prod.outlook.com (2603:1096:820:9e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Wed, 24 Dec
 2025 02:17:49 +0000
Received: from SEZPR03MB7810.apcprd03.prod.outlook.com
 ([fe80::2557:de4d:a3c7:41e8]) by SEZPR03MB7810.apcprd03.prod.outlook.com
 ([fe80::2557:de4d:a3c7:41e8%4]) with mapi id 15.20.9456.008; Wed, 24 Dec 2025
 02:17:49 +0000
From: =?utf-8?B?TWFjcGF1bCBMaW4gKOael+aZuuaWjCk=?= <Macpaul.Lin@mediatek.com>
To: "tzimmermann@suse.de" <tzimmermann@suse.de>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, "simona@ffwll.ch" <simona@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, Nicolas Prado <nfraprado@collabora.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Daniel Stone <daniels@collabora.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Ariel D'Alessandro
 <ariel.dalessandro@collabora.com>, "kernel@collabora.com"
 <kernel@collabora.com>
Subject: Re: [PATCH 03/11] drm/mediatek: ovl: Add supports_plane_colorops flag
Thread-Topic: [PATCH 03/11] drm/mediatek: ovl: Add supports_plane_colorops flag
Thread-Index: AQHcdET2ms9rZ3WHy0eDQyEK6bFiKbUwDnQA
Date: Wed, 24 Dec 2025 02:17:48 +0000
Message-ID: <4d639355fb6071d568e079778eee50b89ffbb0da.camel@mediatek.com>
References: <20251223-mtk-ovl-pre-blend-colorops-v1-0-0cb99bd0ab33@collabora.com>
 <20251223-mtk-ovl-pre-blend-colorops-v1-3-0cb99bd0ab33@collabora.com>
In-Reply-To: <20251223-mtk-ovl-pre-blend-colorops-v1-3-0cb99bd0ab33@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR03MB7810:EE_|KL1PR03MB6899:EE_
x-ms-office365-filtering-correlation-id: f14af3e4-7f50-4bac-fd7b-08de4292a259
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?N3YxeXpycDJqakJCb1NnUDlRd1AxenJJaU5STnlBTitCTUtEeE93WlZEUmJ0?=
 =?utf-8?B?ZEVza2dtOUZJdkZWZ3loT2FLN1ZFZHN2ZUVnbTlHeHNCTFFvYXZ4NFNtOWd4?=
 =?utf-8?B?eUVUb1hTSlhlV2N1di9aNnVKNWg0bEFuL0tBL3V5TnFGVkJ0aEhnRjJLRWZ4?=
 =?utf-8?B?UGFCSHNNZnNSK2VCbmhZcTduTE9iWGtlNlFmS1U4aTNGK3JuSmtGMS9ncmpP?=
 =?utf-8?B?SURtbnhDNjZLbzBQeUZFT1JpODUra09WeVY1dm9kSXpMYW5TSjQzdFFrT2FQ?=
 =?utf-8?B?UXlBWDdxcFFKSlg1OFduM2hRemlpNzZVMDVualN2alJWZzVjRnlxWStXaFBJ?=
 =?utf-8?B?Y2IvTGNEUzZzdTF3RUhWTkYrSmJpNklsMzVoUVJyOVBValU4TlJqcGo3aXl0?=
 =?utf-8?B?OGdSbXlmb0hJY0hiR0JDeFlDUU5nNlJaTkpJMzV0N1NBQWRZa1lUTDkxL0hO?=
 =?utf-8?B?TWlTTFFEd1ZTVVh1K1lZSzh4cUtuWG1wUkF6NEFkbmFBYjFLeUFlMjJwMnNL?=
 =?utf-8?B?ZENyQmUxNTZvdXZ5MEQrTVA0UlFvNGllQng4M0tpa0NMWjB3a3JLNGh5a3ZH?=
 =?utf-8?B?b3dIUk9LcFVidTF6d3JyVzIvRlJsUnpSRko2S1hBTktEdWxTaU5ORlhOYjlo?=
 =?utf-8?B?NnU2MGtDNEQwamFnSUlzRmlMRlVDV3ZwTThlRGZ3enYwNjRuQmdvdGpVVEJt?=
 =?utf-8?B?TW9KMGFKNXltUGd1d0pwaTYzSnd2SUVjRDRiNTVPcXNrNVIzTG5wcStlNkl3?=
 =?utf-8?B?RnpNOEhWQktCM1l2Qi9uMHJCWVNGSGVoOUgzOUdxMUFLR3VWcVZvbEV2V2pR?=
 =?utf-8?B?QVV6ZW80SmM5MjFZRldjbkhGbWNBOVFtcitocUpsVHNVMEExVWUzRnk2eHBO?=
 =?utf-8?B?YkxhZjVoMlh2ZnFTTnpMOG1tM3FTZEpLWlFOQ0MrYlN0c3lsSkhKNkNKZ2JW?=
 =?utf-8?B?QVk0cEh2SktGNGRXc2hhTjJLN045YTJxMVgzbk9BZkJJbTcydk9PamlQbjJN?=
 =?utf-8?B?bUZ4UllPMk5Ec3hza1pSdUwwZ3NVKzBaMjVIa1pKbGppcEhoTlRPZklQcFVE?=
 =?utf-8?B?ak1GbEFTUnpzS2VJSlZML3FnRUdFY2Y1Q2tzUEo5VXpwbzNKeEdpU3JvZ0dm?=
 =?utf-8?B?MFkvVndUTndOaDBWcXNiRjgvdFMwWmNqcUUwOU1HeENIZkJuQnB1Nm11MXAy?=
 =?utf-8?B?NFlJTTVCWmw5ZHF3N3hxbXA2QjliNDJtenJKVGVsRUpyL0crV1VneEJtMzhr?=
 =?utf-8?B?bnlUcFlMMHRJYUdpamIzYXUzY3RCMWpCUkM2cGlkbmo4cE5XcjhndDZqczFj?=
 =?utf-8?B?eFYxbG00aDhHQ0FLTGdpTEVQTnBDSnhkTDJhcy9hMUxLK1VNRDI3ci82VDFS?=
 =?utf-8?B?RXFOWDZLYUpGNVpTcnYzckJUWWduMGZmKzluRnRwU2tUZXZ2VTJwUVdEUTFK?=
 =?utf-8?B?bkVMZXhqZXE3MmxsYnlSOUtmR01YSXF4MUpkZHB2NGhac2haS0VPNXlVdTI0?=
 =?utf-8?B?cm5raG8zNXhtN1gwWFZUWFFQOGNHalFPd0pkeWRxOURkcXM1MHVWdjNaT2kx?=
 =?utf-8?B?dUlqcmt6RCtOdEhpQ2lYUjJpbEs2OFN3L2tuVkJxK1JNZ3l6bVFDMkE2cC9a?=
 =?utf-8?B?K3F1VlRJb1pNbFdJQURGQ01DV2Q4eHJleEdGZkdnNlZadWZTTEN3Y3c5dUV3?=
 =?utf-8?B?eFU5MTZQQU94UEMzOERPYmVxbEg4ZUlSbldZQmhFbHZvaVZTTVdYQStSR3Z4?=
 =?utf-8?B?dnoxZHUvOUQxYk8rV2ZpYlFtWmd1bjZ1cnlBdFNpS0xETEJoSlRHaXRJN3pt?=
 =?utf-8?B?N1RyVGtQQnZSRDBxeXpvNkFaRHU2U2E1K0t1cU9PYm45bTZBSlgxeTdtMU9q?=
 =?utf-8?B?VmFSNFZ2bmd3akhaL1ZESkw0Z0lSSFJqNURROFBhOHhtanZzVGk2TitlUi9o?=
 =?utf-8?B?elVQNDBnaVpqZzduZzZxN3N3ZHVzMDNSMUlpei9QSjNrMXVyR1ZYTENtcmtU?=
 =?utf-8?B?RWtDeFAzWXc2RklVS3d6Rm80L0pkUm1JUmIrb3o2dnp3bnlscHFhTmVNa1kv?=
 =?utf-8?B?WmJ3TkpYSHdmNHFsSVpnUVgxcFZuL1ZSMDhYUT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR03MB7810.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UjAzV0tBZk1POFZEbHNhWUZLbTNlUEM0ZVptN05QUHVsejIzYSs5SWpaTFhU?=
 =?utf-8?B?cXFWS0lBTEFRTzdvNjhrMnlXUDl5QmMzRkZ0UmhTd1BUdEEwbzNJSGxmQ2Z5?=
 =?utf-8?B?T0Q3eURmN0VzQnlJUWlIV0NwOUtOSGxxZWpIMTNBQWEwa2h6K1ROMzRWc3FR?=
 =?utf-8?B?KzYzMVAxWEVsb3Z3amJGRzBiSlRha2xaZnlpVUNobjMybGkyTkNWYTcvWFJM?=
 =?utf-8?B?M1Q1dmFPK21Cb1dNTzZGK0w3d0VaNDlEV2pUMkZhbVBpeDlrcVIzbUk5RFVQ?=
 =?utf-8?B?eW1DZjlrV1VYUWRKS2tFcFVKNmtRYzFvMEVBWFJ3WkE4R3hUQlRjT3R3S2lF?=
 =?utf-8?B?TWxHQ0FnK0k4T3IxUjR0WkduTTQyNDZaUUxpVDBtdExWNE9SbnJwOXpwK3lH?=
 =?utf-8?B?c0lSdDNWdDY0QTRvUWxmVUk4RUxKWGN1aEhFMFVWMFVRalZYRlU3OTVhVUFS?=
 =?utf-8?B?MXc0TVJicDNpLzhoUGdpcXFPTHFYL3JMckNTTTVxL0pWMEJuYU1MaEtoL1NM?=
 =?utf-8?B?SjRsZkkvejFPMk53cmRjdlVnNjFZM3h3QmM2dUlMaHpYcG1tcmluMFU2RStk?=
 =?utf-8?B?ajZUQmd0VTVsT25BamNtN1lBMkZRdHkyb2VoK0NRTjYwMG5ZbUg4K01UL3dV?=
 =?utf-8?B?S0J5WWdTeHlnSkVnOW95U2lGcWp3a05EL3FsU2toS1c2eUpwaThVbHFiYXg5?=
 =?utf-8?B?OXZneCtwUHFCL3RHWTZRUjR0L2pUN0VxS1FNcVF1djFHdmNHNldaZDE2OEZD?=
 =?utf-8?B?cFFOSi9hcmhFSkwrVnBYUEF0M3BncEdkUU15cC94ZmYzVWpQbVdPR3Q5MGVL?=
 =?utf-8?B?UDFlTDUyVmxJL3NJWUZiK0ZBZXZ5WW5mcjFOUjhJUnNKZ3F5QmZYRS91YjBN?=
 =?utf-8?B?bWlJbWFqZytNWTJ4T1Jpb1FwZ0VBemNyMnRZZ1NtZG95QXkrSjhFZTY3dmY5?=
 =?utf-8?B?eGF0VEFha25ZZnBNd2dMTFJjc3UrWFE3S2JEMmZ1K0RkVitiMUNFNFl5UFMv?=
 =?utf-8?B?Qm5ZVStLOUJpSHg2aDhZMGZuaHhZeUNXdjFSbHh1KytaMWhvUnJzcmFicitJ?=
 =?utf-8?B?OEoxNE80LzN5MDErWDhSL0xSaHJJUU56UytMNDlObURrQzFXUkZMcjFkdm03?=
 =?utf-8?B?dzd2TTNHZlY2ZkF2bjI5RUJRbFZlRVYwSVNqL2xrdHZwLzMyM3pzL1VGZlZR?=
 =?utf-8?B?VVpqdmxIVmNMOVFjeHdZQWtVbnZDOTZMUVNaa3FOdktNZUdoNlVtYzY1VVgr?=
 =?utf-8?B?MDRpSEExQ1JLYnFFZFVaRytTZ1luOHdJc1dnaDcvTkJCZXJlbHdoajRZaHF5?=
 =?utf-8?B?L2ZjVmhlSWVadUg3THdMZlZINGhOZWo3RzBMNXFCRm5yQmgxZUw4WVB5YmNl?=
 =?utf-8?B?c3d0a3dES0g3VkpzQlgrWWhIN29QSjBpK1VCV2Q4NUNQNVN3c09RcWx5bFow?=
 =?utf-8?B?eVlZUkhXQVBGeHZDbjRFN2NkL2szakhPNnJpV3Y0V2hXZVh3NDVBRWthYzJi?=
 =?utf-8?B?c0NxYjB1amY1alF6VVpES3g2dkJUemFKTnYxL2prdkpzdGF3cmkvU0JxWm9I?=
 =?utf-8?B?ZXRIb2tNc1JxbytKeUErRzFRSENFandBZ1hTOUEyYysrNVRzd29lQnlCTVUw?=
 =?utf-8?B?OE13cnk1U05DSlZIKzJJTWkvR2JNalVsZEdnSllab1JhK0pqUWQ4WUlsZHBi?=
 =?utf-8?B?Syt2Um1yOW5uWmQ3TU5aRGFQd0pjNVgvaU9xNG9nTWtjaTArQ1hPbGpwSXNM?=
 =?utf-8?B?ekVoMitYOE1jUVJjcUNoSFNrZ0Q3Wm9XT09JV3hBZDUvVHpqSU9aU0tpaVN4?=
 =?utf-8?B?SENCMERpeE5ya2lPYXQ0U1lOeGwxYUhQeWx2U1pVQVE5azVWREtPT29XYXhj?=
 =?utf-8?B?Z3JDTDNSUXBCZkVBT0RIRTErSnNLcnhBa01jcEIwQVZtMXhBNnRISFJ5TGo5?=
 =?utf-8?B?OU1qQUxaNVhWeUxYRnFoQjVUbm5DRnhqMWlqUW9mbEs4K0pEbnl1UlcvUGpw?=
 =?utf-8?B?bUpPOXY5b01KNCtvTCsxOVFHb28rWHhaUi9NdVRsZ2o1K1U2d2FxZDZYc2JR?=
 =?utf-8?B?NjBBNWNHZlBXNGowdTkxZ2pzSXVRVzNsLy8xOCtsUXk1QTIzblUwTWU5T0tR?=
 =?utf-8?B?WjcwMnViK3FkU3kvQVVVTTdWeU5ncHFJdUtKVnNXNys1bXRmLzhqK0tQZW5o?=
 =?utf-8?B?V1lWbFlFdjNXZUpvblYvaGRoMEQ2eEdpNHBtSkJiYmFZYlJCNEY3RkVwSkVQ?=
 =?utf-8?B?dG5EV3pDMzcxTjFZcFY2WngwZnVTaW82WVc5MG9hRis1WnJFcFI5MUJvckly?=
 =?utf-8?B?Tm15TjlPYWtKWEx2dStNcHlxVkZJdGtLYTdtZThxaFN5QUx4ZTFBVWZNMGVG?=
 =?utf-8?Q?x9gfoJJT6B4PMWiA=3D?=
Content-ID: <C9CA8707BAF62045BF51162DEF387854@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR03MB7810.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f14af3e4-7f50-4bac-fd7b-08de4292a259
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Dec 2025 02:17:48.9386 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yG6dmn36iN49wpWPU4g85cUdqj9H2Ooe+phg3dBvTos/NEHsEZP1p7gdLd/NoRe4Qj7Y16UNxJi3f6bsTi7ZEs+c0m+F6EKDwWJnxcHAKmU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB6899
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_003_1402938970.1907666976"
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

--__=_Part_Boundary_003_1402938970.1907666976
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDI1LTEyLTIzIGF0IDE2OjQ0IC0wMzAwLCBOw61jb2xhcyBGLiBSLiBBLiBQcmFk
byB3cm90ZToNCj4gQWRkIGEgc3VwcG9ydHNfcGxhbmVfY29sb3JvcHMgZmxhZyB0byB0aGUgZHJp
dmVyIGRhdGEgdG8gYWxsb3cgU29Dcw0KPiB0aGF0DQo+IHN1cHBvcnQgcGVyLXBsYW5lIGNvbG9y
IG9wZXJhdGlvbnMgdG8gZW5hYmxlIHN1cHBvcnQgZm9yIGl0IGluIHRoZQ0KPiBkcml2ZXIuDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyA8bmZyYXByYWRvQGNv
bGxhYm9yYS5jb20+DQo+IC0tLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlz
cF9vdmwuYyB8IDEgKw0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYw0KPiBi
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYw0KPiBpbmRleCA4ZTIwYjQ1
NDExZmMuLjQ2MjM4YzIxYjBhYyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kaXNwX292bC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZGlzcF9vdmwuYw0KPiBAQCAtMTUwLDYgKzE1MCw3IEBAIHN0cnVjdCBtdGtfZGlzcF9vdmxfZGF0
YSB7DQo+IMKgwqDCoMKgwqDCoMKgIGNvbnN0IHUzMiAqZm9ybWF0czsNCj4gwqDCoMKgwqDCoMKg
wqAgc2l6ZV90IG51bV9mb3JtYXRzOw0KPiDCoMKgwqDCoMKgwqDCoCBib29sIHN1cHBvcnRzX2Ns
cmZtdF9leHQ7DQo+ICvCoMKgwqDCoMKgwqAgYm9vbCBzdXBwb3J0c19wbGFuZV9jb2xvcm9wczsN
Cj4gwqB9Ow0KPiANCj4gwqAvKg0KPiANCj4gLS0NCj4gMi41MS4wDQo+IA0KPiANCg0KUmV2aWV3
ZWQtYnk6IE1hY3BhdWwgTGluIDxtYWNwYXVsLmxpbkBtZWRpYXRlay5jb20+DQoNCkJSLA0KTWFj
cGF1bCBMaW4NCg==

--__=_Part_Boundary_003_1402938970.1907666976
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1R1ZSwmIzMyOzIwMjUtMTItMjMmIzMyO2F0
JiMzMjsxNjo0NCYjMzI7LTAzMDAsJiMzMjtOJiMyMzc7Y29sYXMmIzMyO0YuJiMzMjtSLiYjMzI7
QS4mIzMyO1ByYWRvJiMzMjt3cm90ZToNCiZndDsmIzMyO0FkZCYjMzI7YSYjMzI7c3VwcG9ydHNf
cGxhbmVfY29sb3JvcHMmIzMyO2ZsYWcmIzMyO3RvJiMzMjt0aGUmIzMyO2RyaXZlciYjMzI7ZGF0
YSYjMzI7dG8mIzMyO2FsbG93JiMzMjtTb0NzDQomZ3Q7JiMzMjt0aGF0DQomZ3Q7JiMzMjtzdXBw
b3J0JiMzMjtwZXItcGxhbmUmIzMyO2NvbG9yJiMzMjtvcGVyYXRpb25zJiMzMjt0byYjMzI7ZW5h
YmxlJiMzMjtzdXBwb3J0JiMzMjtmb3ImIzMyO2l0JiMzMjtpbiYjMzI7dGhlDQomZ3Q7JiMzMjtk
cml2ZXIuDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtOJiMyMzc7Y29s
YXMmIzMyO0YuJiMzMjtSLiYjMzI7QS4mIzMyO1ByYWRvJiMzMjsmbHQ7bmZyYXByYWRvQGNvbGxh
Ym9yYS5jb20mZ3Q7DQomZ3Q7JiMzMjstLS0NCiZndDsmIzMyOyYjMTYwO2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYyYjMzI7fCYjMzI7MSYjMzI7Kw0KJmd0OyYjMzI7JiMx
NjA7MSYjMzI7ZmlsZSYjMzI7Y2hhbmdlZCwmIzMyOzEmIzMyO2luc2VydGlvbigrKQ0KJmd0OyYj
MzI7DQomZ3Q7JiMzMjtkaWZmJiMzMjstLWdpdCYjMzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2Rpc3Bfb3ZsLmMNCiZndDsmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kaXNwX292bC5jDQomZ3Q7JiMzMjtpbmRleCYjMzI7OGUyMGI0NTQxMWZjLi40NjIzOGMyMWIw
YWMmIzMyOzEwMDY0NA0KJmd0OyYjMzI7LS0tJiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZGlzcF9vdmwuYw0KJmd0OyYjMzI7KysrJiMzMjtiL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZGlzcF9vdmwuYw0KJmd0OyYjMzI7QEAmIzMyOy0xNTAsNiYjMzI7KzE1MCw3JiMz
MjtAQCYjMzI7c3RydWN0JiMzMjttdGtfZGlzcF9vdmxfZGF0YSYjMzI7ew0KJmd0OyYjMzI7JiMx
NjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMzMjtjb25zdCYjMzI7dTMy
JiMzMjsqZm9ybWF0czsNCiZndDsmIzMyOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYj
MTYwOyYjMTYwOyYjMzI7c2l6ZV90JiMzMjtudW1fZm9ybWF0czsNCiZndDsmIzMyOyYjMTYwOyYj
MTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMzI7Ym9vbCYjMzI7c3VwcG9ydHNf
Y2xyZm10X2V4dDsNCiZndDsmIzMyOysmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2
MDsmIzMyO2Jvb2wmIzMyO3N1cHBvcnRzX3BsYW5lX2NvbG9yb3BzOw0KJmd0OyYjMzI7JiMxNjA7
fTsNCiZndDsmIzMyOw0KJmd0OyYjMzI7JiMxNjA7LyoNCiZndDsmIzMyOw0KJmd0OyYjMzI7LS0N
CiZndDsmIzMyOzIuNTEuMA0KJmd0OyYjMzI7DQomZ3Q7JiMzMjsNCg0KUmV2aWV3ZWQtYnk6JiMz
MjtNYWNwYXVsJiMzMjtMaW4mIzMyOyZsdDttYWNwYXVsLmxpbkBtZWRpYXRlay5jb20mZ3Q7DQoN
CkJSLA0KTWFjcGF1bCYjMzI7TGluDQoNCjwvcHJlPg0KPC9wPjwvYm9keT48L2h0bWw+PCEtLXR5
cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlh
bGl0eSBOb3RpY2UNCiAqKioqKioqKioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRh
aW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMp
IG1heSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndp
c2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBp
bnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50
KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJl
dGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNo
bWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQg
YW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGll
bnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUNCiANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQg
dGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0
ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3Bp
ZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3Vy
IHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwg
dG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_003_1402938970.1907666976--

