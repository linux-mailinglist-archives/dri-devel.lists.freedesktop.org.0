Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 742509B5E36
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2024 09:48:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7214710E761;
	Wed, 30 Oct 2024 08:48:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="p3hLd5zd";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="lsAHrvnz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DBDD10E763
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 08:48:32 +0000 (UTC)
X-UUID: bc3afcde969b11efb88477ffae1fc7a5-20241030
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=7tOXBch/76AUF6RLkkGoGdpd9p6kAOnc00xrUzf0U7w=; 
 b=p3hLd5zdd8FglaCrTT8/Nizyq5/xwtIMZo+/TJ6jWjS0/HKbFzrAkvRCC7/IAZYog8kmyGYb/Fy8DoOxbH4QPPeLRGcw3ylAMEbDUXW+dUh6ZH1HV2xwD1I4tcxZhVgcaggPwKHB6buTWYMwml72ZUwEEAi/OpgT4qvqHPU92ks=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42, REQID:ad3e05b2-fae0-4b8b-b1b1-ab6f0447f3f1, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:b0fcdc3, CLOUDID:e54949e7-cb6b-4a59-bfa3-98f245b4912e,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: bc3afcde969b11efb88477ffae1fc7a5-20241030
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 661514516; Wed, 30 Oct 2024 16:48:29 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 30 Oct 2024 16:48:27 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 30 Oct 2024 16:48:27 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RqDnhY//EIdaP9POod8z1VQbemnpoPsm08ghApzmwqndMVfFea+BlUpBP07lxiGR1hadw8Ld/zbh4IVbuwa3QQfS6eGdsgCT2mtQu6Ole2mkMuJZ1a13YEV74uk5+JdaezPVQxz2ICcqcE5XGSujPFPfJx4Zu/W8E1O9+XNt0di6uwn1mdV8l0N/P0783r1wDg12Nt0D+lzXigNY8QyYuhxZToX+/jbl8mk+6vATmgYHIhYHZ/Nd40xhRJIiKAfLAqYl9ZstUqkIS09S2ehNSU7arfi57snQFO4m1Yem+nB/Vk4GXI3FeLelYy1MfM+gHS/GGypPApRCP+JFhE4nYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H31kIyZyjaUgwaS3yuknDQjBoxN/3V01N4GXlnp61CE=;
 b=qFLLlKN4VIRCHH2la99kKXlWWZG42HSOmZcrZfUIT4/7iPLR2Ez/6ubZmh1Zvm5CUmrI5pVkhAX/gxPsv2OWq9Vd3IRzRWNgLrjUvD2i0h8L9YX1iR2eDpfz29K+wOzbllysb+YCNcL4SKKrAuTUSP8WPEeo8Cf6sWdsiA58WSUFaD0rDb9YYbFS+sR9It+uB5Rm23QXq5WrVRtY9qb3XbDAIgQYVOFgFeOeQNkDDhZCQcZxmvQTse57I/oIy2BObnDf8ey+4+/dzPGWdtFTUPJIxJIPyOssayiR8zefG6Un0HRSMIzO7URrVDLOEc0hNnp/nSUIQZi+3RmMC9CMtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H31kIyZyjaUgwaS3yuknDQjBoxN/3V01N4GXlnp61CE=;
 b=lsAHrvnzqSc2nu+qbaYnBnpdWq8Ntykg1bVOs+1ElQFrsnS4zL8ao897BW4Qrq/7+g4sX3oumPdETAtQJT9MwrgeTfa0d0W5M+A1QK4Lpbl+eaBgE+ouXky1ORoob0s4YqITPCQdUutIRoF9IqOg7rNfh1xjth05/VHP4/oMDGU=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SI2PR03MB6567.apcprd03.prod.outlook.com (2603:1096:4:1e2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Wed, 30 Oct
 2024 08:48:24 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8093.021; Wed, 30 Oct 2024
 08:48:23 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "mripard@kernel.org" <mripard@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "wenst@chromium.org" <wenst@chromium.org>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "ville.syrjala@linux.intel.com"
 <ville.syrjala@linux.intel.com>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "airlied@gmail.com" <airlied@gmail.com>
Subject: Re: [PATCH] drm/mediatek: Drop dependency on ARM
Thread-Topic: [PATCH] drm/mediatek: Drop dependency on ARM
Thread-Index: AQHbKfOlKgrWu8XeBkaWOJ8UqtA9E7KepD+AgABSgoCAAAZKAA==
Date: Wed, 30 Oct 2024 08:48:23 +0000
Message-ID: <0cfba5bdc9443fb4b9719c47ee93c2a467cc66bd.camel@mediatek.com>
References: <20241029111309.737263-1-wenst@chromium.org>
 <d9177ba80fc78b1f74dc54260c0c43440ec5a804.camel@mediatek.com>
 <20241030-hot-peridot-falcon-57bdbb@houat>
In-Reply-To: <20241030-hot-peridot-falcon-57bdbb@houat>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SI2PR03MB6567:EE_
x-ms-office365-filtering-correlation-id: 6e916400-3a42-4fd6-5f44-08dcf8bf9ce8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?VnE0WUtuZTZJLzg3ci9YTVRNUmp5ZE5UT1NjTG9WaXJ4d0VmcThUNHo0Smgv?=
 =?utf-8?B?bzhEUVhpMWg3ckMxWU85R0N3L2pjZFdHNUtpKzNualV1NzN3RHFKVVpJZFNq?=
 =?utf-8?B?bEowWlUzaE83ZXlaZDAyQkNyb20rbzRlWkxRL2NHb0krdFBoVFJQUDBnTTQv?=
 =?utf-8?B?Ui9PcjhzNDMxdk9hcFRCbkw3b1JvaldyMXZub2swQ1R1VUtrRHNjd0d4L1Jl?=
 =?utf-8?B?OFVZdnFkRnh2d044TDJ0dnZ0ZHluK2JPQjJ0eU1NTjVmV1l2aU84OVB3L0tJ?=
 =?utf-8?B?cVhONUpqazczeFFKM3ZHc0hld0RPMGx6eFoyYXdmODJXb0lRS1JnL283WVY5?=
 =?utf-8?B?STJneHppeTJieVRzUkdCbHFhU25MRWQ2M0swd0NJZ09HR3VzY3lCOVlKcGhz?=
 =?utf-8?B?dTdPMGRweWQvb1FYS1U3Sk5INm5rVlNkRTNaN2FDVlhYVE1aWVZSSmZMZ0dx?=
 =?utf-8?B?dnhWSFdIMjRlcXAwclFlSXpkTlpEQVdzcFdOSFdnRW1jekpJcjdEcmJQSDFz?=
 =?utf-8?B?T3JhODF0UHhoT2ZUZjJzeDMvZ3F6QkhOMFI2OXZzbDV3VjJXUHdaenRNSXcr?=
 =?utf-8?B?R29VU0lPcXM4cThuVjhWY3h0RDMrMTJ3UVlocDdxbTNSNWd2cUVuSzFLSEFh?=
 =?utf-8?B?SkxhclBVVkQ3a25DTnpZc1VhM2ZPa0JzaEtYcDJabmF1ZlJKYzdFM0s1amNH?=
 =?utf-8?B?V1V4ejZqRTdXdXpKcEdpbDI5aG9Dc09PSGkwVVp0MzZBZGhtRmIwdGprTUdn?=
 =?utf-8?B?NWFxUEplQlZPOEdXSzhJbEFHUHorTEVMUkFTWlorRG4vRDM1OFMxK29KdnFk?=
 =?utf-8?B?dk0rOC9kWE9NaEozWng3NTJWbmVydm5ic0FHb05nY0hqM3d5M0p4ZHhkL0NL?=
 =?utf-8?B?SUlFeXN5Q0hadFR5b0hUUW9mT2JQeVdRU2hlQjdtUnZVTHUzVVJBcjBMNnZN?=
 =?utf-8?B?b2lZbmh4dFMydTJEd3ByelY3SURIRkVNRUdOeVYvOHprZGIrYlYwUE50VXdE?=
 =?utf-8?B?b0NKWTZnQXc3amtOSXZMSHllTG9WV0JYaTA4NFBiQmpJVE8zU2E3V0lHMUU2?=
 =?utf-8?B?bU1NSUVSNjNyOHQxdXNUaTZmeDgzRHNPS3hyMzFqa0hvZFJ1SUtscHR5QWE5?=
 =?utf-8?B?M0FiTVlIKzBVdmo2SHdGTGZXd1A1am5XckhPS0c2b3F5YzN5U1o3N1Z4V3VS?=
 =?utf-8?B?RG1GWmRxdFZONWtuNmI4TDBXeHFyQ3lRb21ZVStocVUyeE43QWVhZVBXTTBQ?=
 =?utf-8?B?WjZTSEI3d3l1V2RNMFdoNVFsTG13T0wyVDMyYk9NVDVTZ2hOM2JBTVRzaEs2?=
 =?utf-8?B?eEU2bGRSZ3VmNmVNaUN6cW5YVVZpa2UwSWp5WUc4ME1lZFpUWW11ZUE4NDJQ?=
 =?utf-8?B?bkdZb0NiMWVIbzBDSDFmd1g4VzZCbkFtR3lUdEM2a0pwOEtHTE1YVy91bzlH?=
 =?utf-8?B?blkrN2lkQVZGUko2VzFMRHRybS9GbnhBMU94bFdsWDJ6VFQ3SnFGbEJ5RzVT?=
 =?utf-8?B?OTFZUmwyQ1N0MjdxMFVFY2daZjQ1cGRzYWRwR2EvaFBvbW9LRm9COERORXZp?=
 =?utf-8?B?bzBlaHo0KzdhN2lhaHlRdUY3SkVseWp6SFZwZnFadG5pN3hoa3llT3lRRDRo?=
 =?utf-8?B?K2ZBZ1QyNFl4a0dPNkxWZzFCLzlpK1RJN1V4L0pEWVR1MFdyYVFHM3U5OTJn?=
 =?utf-8?B?RUhxd2JRblE1M3F0dVI2elVaUzVEcmFXWkpkRnQ3Y3ZuZU5tZlF6RjI3dWJS?=
 =?utf-8?B?UEcxRHBxbi9mM1R0RzVVNDVqTUJrMVdpR2ZKcitMa0Rwd09DbTBKUTFiUTRO?=
 =?utf-8?Q?MTu9wA9stmB3Y6jSjGhXi+6bmbVdTuZnPW5dY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MFdyRm5CZzFvWWpzTi9USzhQRW1Kb0dpanRrVE8zZVdnbWdVMHpndHRQbVV6?=
 =?utf-8?B?d2g5MndGTkVFYk5UUVB3MWRZK01jK2NkS09nTzAwVFAvMjJvNDhQQnI0Tlkw?=
 =?utf-8?B?WmxBNUt0V1g2OS9NOXFYNU8xNlROcWs2L2xxS0tXNGFkMGt6WnoxdVNIMGd6?=
 =?utf-8?B?TkJmbFBML1ZRNytJTXRISU81WGc4YmpTdzVjNzFFSHd6MDlzMmM4dG1YQXhZ?=
 =?utf-8?B?aGFnRzJyRnVteHdtbGxVYjBKQWdLVXVqSTBxcTVVYUVzWlhaak0wYzNyeWE3?=
 =?utf-8?B?aDhFM1hDbDNlU3hOOFU4UWxiKytLYU5zdU1NZXF6M3JMbzZoTFAzNGYzcGl3?=
 =?utf-8?B?UVZGQU8zNVQ0T3g5VHorc3ZSMVgyaFFQSmp3OUhZVFdnSjBhbTR3VFQxSGlY?=
 =?utf-8?B?MXdHTHpsbjRzb1ZscER0VVpBK2JNNHpzdjJaci9SM0E0SHB6VE04V2Z1akQ3?=
 =?utf-8?B?cmZqUndlOUdOeThCVGpiRWlQZnVteTFKOGdEUlYxajFndHpWMDlIcXhnWDd5?=
 =?utf-8?B?V0pCUDdkQ0JZcUtUQ3Y4VEptOFp6TUJuNTRkYk0yMXFleDVtMVVMWDRHSDEv?=
 =?utf-8?B?WHdUQW9WTE12M2NRbGhXU3VxcFlLSnl2ZGxQdHByMXJtYzRYL0hWQWhhVHlo?=
 =?utf-8?B?K0lZbDREVWUzc0t6OXZzc2xNRjVWV2wyRERXZXF0UTZFOWRLVnRxa3d5dmJ2?=
 =?utf-8?B?b21ESU5nNEt3WkR6a0dzQkRlQVZZQ2YyY0xralBhTVI4a2YrZGRWU1F5MkxJ?=
 =?utf-8?B?aXNUSmY0VnhuWm5qNDNhbmFKbjBDemxKeUY5eHJCRWV2YVUzWUsvVXBLOTFq?=
 =?utf-8?B?d2szNElUMVJRNUlFS0xUdUxJU3VLMUllT2JlM1BFdkN6TWpUWEdvQnJPKzZq?=
 =?utf-8?B?TmZmVTNzSmZUNkZXUkNweW8rWUs4Qk1UVWlOcHAzSmNUWDV3aHB1emwrUkpj?=
 =?utf-8?B?Q1lGQk9nRW02MHhMdGNra0VhTUw5OEc0VVdLelIvY1gwRlB5SXd1QUo5cm1S?=
 =?utf-8?B?c1RId0hnbjJKL1VIZTR1eFVzbW14Y1RmU21oWHdNMit4THZKdFdyT3VEOFBv?=
 =?utf-8?B?c21rU1o5OG9nRzVYSU1YTzl5UE1WNDRNbHpSRnhWMVI2S3ZEcTFIcVdnK2Ny?=
 =?utf-8?B?YndQNWIwREszeitHb1UvVHdSL0lFUWJCWnJMdHZoQ09wZGRGWTBDelA1d3hi?=
 =?utf-8?B?aFhlc0VZdWs5KzZPWVhjMlNpajV3SVhvUkFjRmlTWWFnYTdDSVhQVlFwb1JX?=
 =?utf-8?B?M0tEb1V4UVliK25FeE02Z2VmWVRXWDJFZDcvRnpaV01waWFKaE03ZCt6WCta?=
 =?utf-8?B?N2pQWXFHTDhGQnpIeW52Q1F6TnhUMG9oZW82aDFkNmdYNlpoWXR1SzJjZ01G?=
 =?utf-8?B?ckVvMHU4L3puTDBUNG13TktSNWV1N0w0c2hka3hMUG1TU3JCSlpCdmQ3TVli?=
 =?utf-8?B?RFpQeUoyRkJGV3dTY2ZMZ0JGZmxidHVIblJkMHdlVHhKN2dTUlI2eWVMcWp2?=
 =?utf-8?B?K2Y4M2ZvaHZqenZRbUZCL3hTcy94TllDMlhCNU9YOE1vN2lmb0pGS0YvTWU2?=
 =?utf-8?B?bTVQSkpLV29lUFplQ1VGSlY2WkJDNDF4R2RBZ1hxbFZvN291b1VNMXk2bkNn?=
 =?utf-8?B?ODB4YTh2dXZSL2d6OWtPUVk5eXdKdTA5ZWduYkhBVTdJbS9oUUI4MUVQZlNK?=
 =?utf-8?B?elNxUC9mSDY1b21LcDRhRGZzNkNNeloxeWVjK3BVMkhTTkpXSkdlbHlLdGs5?=
 =?utf-8?B?RlpVOEtWV3VYdGk2Y0tvNUVyZjkrYm5oTG95Y2hoSElYZ2l4T2I3TVpscWh1?=
 =?utf-8?B?OTJ4bkVaS3NSaDlxY1JTWmUrS1hlUkZFSTU5cWQxckFtbWRHYVZLSEE3S3p1?=
 =?utf-8?B?cU5xUGM0c2hQOXU4b2VwaDVURDI3MktKd2VZaEhOcmdxYUhIcm4xOUZXcDAx?=
 =?utf-8?B?T1F2akRNRVpGcE9rUHNUcVVzU21OU0FoUURTMGprY2NIdFhJVGsybnNHamtI?=
 =?utf-8?B?bzNZTFJ3WTVnVngwRTFFSmlEOStzbGpBYXFCVkI4elViR1FWeHZFNlFVL3ND?=
 =?utf-8?B?NXhkNGY1T3ZvMzRhc1pxMEc2L1haR0lqTUoyTnNIajZPUmpUTk1mWUNQbFA0?=
 =?utf-8?Q?hHdJjsFi7OvLxAujLDTTHXPCh?=
Content-ID: <1EB541894DB1A0469124CB0E1438AC9D@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e916400-3a42-4fd6-5f44-08dcf8bf9ce8
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2024 08:48:23.4354 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X5Y8dLz4F1+sSYm1SNH0Jk80qjnuVR7xMZ73+ZMYTbUbPKCAR66pZl0WarKK3GuikSTk9wtaYLHHU8/0E09NWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB6567
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--17.271100-8.000000
X-TMASE-MatchedRID: 9zTThWtzImvKRSR886eK0ia1MaKuob8PC/ExpXrHizwJ3JxKjb/Mqtpu
 f2sIyxhOshXHqIHwr0zD0KDb21Sxj3jxgHkp9duCQty8giCJW42r3d1rmRdCgKXJ9vMysD/CGU3
 GI9BKWefx4l/1nQjDTKvscqiup2xXc4SuAICAZm5IRA38P/dwbiDQvhfLY4eVemIOfEwRhx1X2a
 lgP5+nkuLzNWBegCW2PZex/kxUIHWNo+PRbWqfRJBlLa6MK1y4
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--17.271100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: EE52A2A6916F482A3D2443F5B5625A1A1597D101805ACF2F1B795C634855E1972000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_001_112422416.1398417579"
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

--__=_Part_Boundary_001_112422416.1398417579
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDI0LTEwLTMwIGF0IDA5OjI1ICswMTAwLCBtcmlwYXJkQGtlcm5lbC5vcmcgd3Jv
dGU6DQo+IE9uIFdlZCwgT2N0IDMwLCAyMDI0IGF0IDAzOjMwOjM0QU0gKzAwMDAsIENLIEh1ICjo
g6Hkv4rlhYkpIHdyb3RlOg0KPiA+IEhpLCBDaGVuLXl1Og0KPiA+IA0KPiA+IE9uIFR1ZSwgMjAy
NC0xMC0yOSBhdCAxOToxMyArMDgwMCwgQ2hlbi1ZdSBUc2FpIHdyb3RlOg0KPiA+ID4gRXh0ZXJu
YWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMg
dW50aWwgeW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gPiA+
IA0KPiA+ID4gDQo+ID4gPiBUaGUgcmVjZW50IGF0dGVtcHQgdG8gbWFrZSB0aGUgTWVkaWFUZWsg
RFJNIGRyaXZlciBidWlsZCBmb3Igbm9uLUFSTQ0KPiA+ID4gY29tcGlsZSB0ZXN0cyBtYWRlIHRo
ZSBkcml2ZXIgdW5idWlsZGFibGUgZm9yIGFybTY0IHBsYXRmb3Jtcy4gU2luY2UNCj4gPiA+IHRo
aXMgaXMgdXNlZCBvbiBib3RoIEFSTSBhbmQgYXJtNjQgcGxhdGZvcm1zLCBqdXN0IGRyb3AgdGhl
IGRlcGVuZGVuY3kNCj4gPiA+IG9uIEFSTS4NCj4gPiANCj4gPiBSZXZpZXdlZC1ieTogQ0sgSHUg
PGNrLmh1QG1lZGlhdGVrLmNvbT4NCj4gPiANCj4gPiBJIGZpbmQgdGhpcyBkYXlzIGFnbywgYnV0
IEkgZG9uJ3Qga25vdyB0aGVyZSBpcyBzb21lb25lIHdobyBhcHBseSBpdC4NCj4gPiBMZXQgdGhp
cyBwYXRjaCBnbyB0aHJvdWdoIGRybS1taXNjIHRyZWUgd2hpY2ggYWxyZWFkeSBoYXMgdGhlIGJ1
ZyBwYXRjaC4NCj4gDQo+IElmIHlvdSBhcmUgb2sgd2l0aCB0aGlzIHBhdGNoLCB3aHkgZGlkbid0
IHlvdSBhcHBseSBpdCB5b3Vyc2VsZj8NCj4gDQo+IEkgdGhpbmsgdGhhdCdzIHZlcnkgbXVjaCB0
aGUgZXhwZWN0YXRpb24sIHNvIGl0J3MgcHJvYmFibHkgdG9vayBhIHdoaWxlIHRvIG1lcmdlLg0K
DQpUaGF0J3Mgb2sgZm9yIG1lIHRvIGFwcGx5IGl0IGlmIGRybS1taXNjIGhhcyBubyBwbGFuIHRv
IGFwcGx5IGl0Lg0KDQpSZWdhcmRzLA0KQ0sNCg0KPiANCj4gTWF4aW1lDQo=

--__=_Part_Boundary_001_112422416.1398417579
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1dlZCwmIzMyOzIwMjQtMTAtMzAmIzMyO2F0
JiMzMjswOToyNSYjMzI7KzAxMDAsJiMzMjttcmlwYXJkQGtlcm5lbC5vcmcmIzMyO3dyb3RlOg0K
Jmd0OyYjMzI7T24mIzMyO1dlZCwmIzMyO09jdCYjMzI7MzAsJiMzMjsyMDI0JiMzMjthdCYjMzI7
MDM6MzA6MzRBTSYjMzI7KzAwMDAsJiMzMjtDSyYjMzI7SHUmIzMyOygmIzMyOTkzOyYjMjA0MjY7
JiMyMDgwOTspJiMzMjt3cm90ZToNCiZndDsmIzMyOyZndDsmIzMyO0hpLCYjMzI7Q2hlbi15dToN
CiZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7T24mIzMyO1R1ZSwmIzMyOzIw
MjQtMTAtMjkmIzMyO2F0JiMzMjsxOToxMyYjMzI7KzA4MDAsJiMzMjtDaGVuLVl1JiMzMjtUc2Fp
JiMzMjt3cm90ZToNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyO0V4dGVybmFsJiMzMjtlbWFp
bCYjMzI7OiYjMzI7UGxlYXNlJiMzMjtkbyYjMzI7bm90JiMzMjtjbGljayYjMzI7bGlua3MmIzMy
O29yJiMzMjtvcGVuJiMzMjthdHRhY2htZW50cyYjMzI7dW50aWwmIzMyO3lvdSYjMzI7aGF2ZSYj
MzI7dmVyaWZpZWQmIzMyO3RoZSYjMzI7c2VuZGVyJiMzMjtvciYjMzI7dGhlJiMzMjtjb250ZW50
Lg0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMz
MjsNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyO1RoZSYjMzI7cmVjZW50JiMzMjthdHRlbXB0
JiMzMjt0byYjMzI7bWFrZSYjMzI7dGhlJiMzMjtNZWRpYVRlayYjMzI7RFJNJiMzMjtkcml2ZXIm
IzMyO2J1aWxkJiMzMjtmb3ImIzMyO25vbi1BUk0NCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMy
O2NvbXBpbGUmIzMyO3Rlc3RzJiMzMjttYWRlJiMzMjt0aGUmIzMyO2RyaXZlciYjMzI7dW5idWls
ZGFibGUmIzMyO2ZvciYjMzI7YXJtNjQmIzMyO3BsYXRmb3Jtcy4mIzMyO1NpbmNlDQomZ3Q7JiMz
MjsmZ3Q7JiMzMjsmZ3Q7JiMzMjt0aGlzJiMzMjtpcyYjMzI7dXNlZCYjMzI7b24mIzMyO2JvdGgm
IzMyO0FSTSYjMzI7YW5kJiMzMjthcm02NCYjMzI7cGxhdGZvcm1zLCYjMzI7anVzdCYjMzI7ZHJv
cCYjMzI7dGhlJiMzMjtkZXBlbmRlbmN5DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtvbiYj
MzI7QVJNLg0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtSZXZpZXdlZC1i
eTomIzMyO0NLJiMzMjtIdSYjMzI7Jmx0O2NrLmh1QG1lZGlhdGVrLmNvbSZndDsNCiZndDsmIzMy
OyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7SSYjMzI7ZmluZCYjMzI7dGhpcyYjMzI7ZGF5
cyYjMzI7YWdvLCYjMzI7YnV0JiMzMjtJJiMzMjtkb24mIzM5O3QmIzMyO2tub3cmIzMyO3RoZXJl
JiMzMjtpcyYjMzI7c29tZW9uZSYjMzI7d2hvJiMzMjthcHBseSYjMzI7aXQuDQomZ3Q7JiMzMjsm
Z3Q7JiMzMjtMZXQmIzMyO3RoaXMmIzMyO3BhdGNoJiMzMjtnbyYjMzI7dGhyb3VnaCYjMzI7ZHJt
LW1pc2MmIzMyO3RyZWUmIzMyO3doaWNoJiMzMjthbHJlYWR5JiMzMjtoYXMmIzMyO3RoZSYjMzI7
YnVnJiMzMjtwYXRjaC4NCiZndDsmIzMyOw0KJmd0OyYjMzI7SWYmIzMyO3lvdSYjMzI7YXJlJiMz
MjtvayYjMzI7d2l0aCYjMzI7dGhpcyYjMzI7cGF0Y2gsJiMzMjt3aHkmIzMyO2RpZG4mIzM5O3Qm
IzMyO3lvdSYjMzI7YXBwbHkmIzMyO2l0JiMzMjt5b3Vyc2VsZiYjNjM7DQomZ3Q7JiMzMjsNCiZn
dDsmIzMyO0kmIzMyO3RoaW5rJiMzMjt0aGF0JiMzOTtzJiMzMjt2ZXJ5JiMzMjttdWNoJiMzMjt0
aGUmIzMyO2V4cGVjdGF0aW9uLCYjMzI7c28mIzMyO2l0JiMzOTtzJiMzMjtwcm9iYWJseSYjMzI7
dG9vayYjMzI7YSYjMzI7d2hpbGUmIzMyO3RvJiMzMjttZXJnZS4NCg0KVGhhdCYjMzk7cyYjMzI7
b2smIzMyO2ZvciYjMzI7bWUmIzMyO3RvJiMzMjthcHBseSYjMzI7aXQmIzMyO2lmJiMzMjtkcm0t
bWlzYyYjMzI7aGFzJiMzMjtubyYjMzI7cGxhbiYjMzI7dG8mIzMyO2FwcGx5JiMzMjtpdC4NCg0K
UmVnYXJkcywNCkNLDQoNCiZndDsmIzMyOw0KJmd0OyYjMzI7TWF4aW1lDQoNCjwvcHJlPg0KPC9w
PjwvYm9keT48L2h0bWw+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioqKioq
IE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioqKioqKioqKioNClRo
ZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5n
IGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJp
dmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxp
Y2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRvIHRoZSBk
ZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmli
dXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAoaW5j
bHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBpcyBz
dHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3Qg
YW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlIA0KdGhhdCB5
b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUg
c2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRl
IGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFj
aG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVu
dCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48
IS0tfS0tPg==

--__=_Part_Boundary_001_112422416.1398417579--

