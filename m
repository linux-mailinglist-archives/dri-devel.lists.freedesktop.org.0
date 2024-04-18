Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9798A90EC
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 04:01:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF748113070;
	Thu, 18 Apr 2024 02:01:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="LabsX+qU";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="AbfPlukW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE96C10FE0F
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 02:01:20 +0000 (UTC)
X-UUID: 895b0caefd2711ee935d6952f98a51a9-20240418
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:To:From;
 bh=xd31EPDpalHPiJuadpy7NJRHQmqoXt1gNyfLmYVdYZE=; 
 b=LabsX+qUdZA1eyWHTKpesn41HSLIrtJ2XVpiurT+VgZgAriPG1grWl6nTWXxJ+qi6wr3fzrn0CX8pLYQl7vPn6xSwTPwo80rWqbR3tOFaEmxSqTRYewK2Dyxuqum/NRYq8fhcSv5RF4ppmtlnHvjmfzL7JrhsEkQVC4O91+75AE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38, REQID:5415f8b1-7143-4b47-8e85-801031a14ab3, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:82c5f88, CLOUDID:8bf6b591-e2c0-40b0-a8fe-7c7e47299109,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 895b0caefd2711ee935d6952f98a51a9-20240418
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1840758567; Thu, 18 Apr 2024 10:01:14 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 18 Apr 2024 10:01:10 +0800
Received: from SG2PR03CU006.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 18 Apr 2024 10:01:10 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cefT8IPQRQTH5mkWL1GbZ6FqTWjUgzedfD/rOIgXZGVgBwnfPJEp7Bv5YxGnrf2ERpqqmztb1tLq2spg0Zzpca78nb3EgZTxi1Ugl8nDVV9IMEQxNpo1up7y8EUZQOoNKpAWruueyrj/3G5h+zhBzRXBIllkhNw5SIX/GMAYP3oKKrW/0Kgs4se8bJ/0uX4HHrr3KFfT6eWw4Pf2tYCOKd75rZ8o3bWltt27l7XAJS0phaNLzfBvbFSHanOTYmmlqrFvX1m4vRaz8peSJvwl2VZiKgcNs2px0kQoa2oaJs0sqA15TadBFMhB+0YunSqWZkPs2qmKPptLUth75F1FMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vp43QWdUKlV0+GuVh9BZFiOAQjCYU8bxOHoa5UZpY/4=;
 b=Nr3wAa9434izm/308/RipnpYkf2GwZ28FpW7aW/0M+2e6FU/ZxcBLerwRXoClOqmWkNLcihCy4qSusyJtzd2/pR6x8B/2MJeI1jEve0LeMYRjEKgCf0EwruEiCP7mis5B/TLaGW6WM2ieMC0XU0jaGWXm3OMz/lhmjBc/Egatr6wUqurJ7TvF4lmu4wo39lf38RQdHAHOOtfJFLMzgxX8hUGwLdGSErGnIktUUzAJLLKOIVWE1VLTOtdjQZ9ruzaqDnasK2d4ni0+P9VsMp9j/+Fr5rAaoe8s+k2TITpaJRVqeE2EteRVMOwDzwGYOKz5yztl3dBHewFT3MVW56KxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vp43QWdUKlV0+GuVh9BZFiOAQjCYU8bxOHoa5UZpY/4=;
 b=AbfPlukWgjgDI/x7asx1MUqc2EdQDkKvheVME7vgQcpdmIcI/OyIyo2ZCO5RbzpVE5Ux+KtFlwcfYKdNVT5Xm017kOC+QhQtIA3JfSE+DHMuRSo85sraTk8iKIL6+ydhF5A2uev9qtlLOQwxLpC3gZvUU6P2l7nyFGjwMkpoCD0=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SG2PR03MB6827.apcprd03.prod.outlook.com (2603:1096:4:1d7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.39; Thu, 18 Apr
 2024 02:01:07 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.7472.037; Thu, 18 Apr 2024
 02:01:07 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "wmacek@chromium.org" <wmacek@chromium.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "chrome-platform@lists.linux.dev" <chrome-platform@lists.linux.dev>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2] drm/mediatek/dp: fix mtk_dp_aux_transfer return value
Thread-Topic: [PATCH v2] drm/mediatek/dp: fix mtk_dp_aux_transfer return value
Thread-Index: AQHakLN1UbNPDjH+JkqFTPHQc+yIhrFtRyaA
Date: Thu, 18 Apr 2024 02:01:07 +0000
Message-ID: <ab733c8d178fffc897563eb46f1f5d2df475733d.camel@mediatek.com>
References: <20240417103819.990512-1-wmacek@chromium.org>
In-Reply-To: <20240417103819.990512-1-wmacek@chromium.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SG2PR03MB6827:EE_
x-ms-office365-filtering-correlation-id: 7cc01c75-71e3-4b59-9211-08dc5f4b6994
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: =?utf-8?B?eEZFdm1ZYlpaNFgzUCtGSWxYaFdVaUQ0T2FjMVpCU01adjlxeXY5TWZXUHVx?=
 =?utf-8?B?WGdTaWVGSDJiSE5kMHpBazI5L1RoMlVJWE5nd0lubUJHazRvWnpHSmxTUito?=
 =?utf-8?B?WlJaSEkzdG9KTU5hd3BtOU0rT016cktxeWwrZ0lOZmk3bytJVWRvUU84VVZU?=
 =?utf-8?B?R2U1bExlNWF5Mzdlb25WTXFGQUhMVllOOHl6ZUs2eW81ckRWbVkrQTVKc21M?=
 =?utf-8?B?SzBqUndjWDgyNWdMbFNSdDBBeitqeDk3NmJ0QjVncE1MRUR5bHJZTDBRKzIw?=
 =?utf-8?B?K3kvMWNpMENmdTZ0NXN5b1liT2NuRTRxbzluRDJ5ZEJDTHA3aDlxVDlPMTRB?=
 =?utf-8?B?amwrU2lMZVdSNVZnUmZRbHBHbEJCbGZuLzNxRG9RSCtXeVp0VjgvTUhVZGY1?=
 =?utf-8?B?NmVKNWhlWldrVkNhVlFMWHd3Y1ZVQUFsODJ3NXRoeUlYMGFmTjJaMmJMRXY0?=
 =?utf-8?B?bkExZTlNWDFmZlo3eWF4TytGZjdqVkJNdUdrQkFsL3JvZmRQdUZCcnlGYkFs?=
 =?utf-8?B?OTBxR3RBcGc1ZElOUy9jVDhYd3RTVnFPenZ4RWx3aUFaK3JKbE14a25CYkNM?=
 =?utf-8?B?aEdkNzBocUlGOXZPTXI2cHA5Tmtua3NuU1hTdXIrTHV4dnFOUEo0S3dWWnVW?=
 =?utf-8?B?N0t4c2NFeFNsc3E5b1htd3Njb2NLS3VtUk82dUJlZi91VWlzbUFZSVBRUEx5?=
 =?utf-8?B?S2w1U0czZjBBOEZ5UjROKzVHRGt2N285di83NEU1T3V4eG9PWDZmaHlBTHRT?=
 =?utf-8?B?K0JzMDZ1bmFGMXB4WGFUQVAxQXJOcEZDSGllaXlTMmU0NWtCUklmTzgvMk5h?=
 =?utf-8?B?dm5MdGt1ZTBoTGRVVGNtUGQwd05VNVhHR3lyc0RSaUpRN1RLY3FZajQ0emVh?=
 =?utf-8?B?bHkwc25aODIxRWFrVHFRVHZXMndCd1ZHQUc1ZWV4ZmhWUXpxeU5rVVRsMmto?=
 =?utf-8?B?aUZESWwwSTNXcjhRZ2hoSm9IcWZON3dUaWtudEpOb05iMXVIaEo2OFFxMjdI?=
 =?utf-8?B?V01kL3VBNFhkaGpKZXVDM1BVK0dMczAvSW9KNy9TSWJQOEFxU21GWFlTTytV?=
 =?utf-8?B?UFNtb0dpU0JWR2xyaGxFVVY2NnBmQ1NGR0RTdjVXSEpjdmdBRmdremdPalps?=
 =?utf-8?B?TWtRRm42NHdyKzBPMmpMV0lqTCt3MzcyK3dCVVI1eEI3Yk9CaURHWFhFQkdr?=
 =?utf-8?B?c0w1c2tZZWZvTDlCYm5LTkd6MWRFcEZKWWlSeFlNUlI2dFkvbGFvR2VoQm85?=
 =?utf-8?B?OVcvbzZyYWVrNWg2Q0tPVlRGWTlSd2dzNWs3UnJDQzgyb0wzblN1L0xlMG5t?=
 =?utf-8?B?WWI0ZFc5TlBDcElES0xraVJ6cGJ4emVjTEw4WnBGRGRsZlUxQ2NBc2wzbzhT?=
 =?utf-8?B?SFEyU1o3ZFZmaW9UY3cxT3Qwci9Od1BjR2dBdHovVWZtQlpCM2tzckx5R2Vi?=
 =?utf-8?B?OW9OTHdaK1d1NnUxYm5NbzBUSXg5akdBN1RaUGV3V2sxbXBWcklZOGpvN2Zi?=
 =?utf-8?B?OUxxRFN3aUQzNVc4aFdhNC9wYjdHcmdpS0JNbVQ5UEozcUFTU3FFeGtxUkZH?=
 =?utf-8?B?ZDVmQU44cHI2aHA5SFp2NXUwdktnSFBKMDBaNTJhRU9RRnFpbm55cG0rUHRw?=
 =?utf-8?B?K0dpbjJyWkpwVVd6TGlXb3UzQVZGSk5VY3pSVmlSTUhMSmxWS0hITExrRTEv?=
 =?utf-8?B?VjIvamFxNlVwZXZJc0gyd01GY1k0WG1UTnREeDY3SzlxSWRDYnFUWGMydGJm?=
 =?utf-8?B?N3RQeENQWG9QWkRqeGhBWmFSSWxyRnZaUDhsTlN0bURBd0pFdEM3c01TOTFC?=
 =?utf-8?B?S0IybTFpTVZZM3BGMk1nZz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(376005)(1800799015)(366007)(921011)(38070700009);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bFcrWkpFRExaaWZpeGlnbjZOYzdxeDRJQWNlZUJNSHNSTGJOalI0TFJlY3Vh?=
 =?utf-8?B?ZEtPYUVoR2U4ZW9pNmFiNHZKcTJZK1hiZStCVllBU1l5RVV4RjJ3eDVZWWdV?=
 =?utf-8?B?SnNwSWNUNmpaV0RaOUUwVWtrNHVaWGJKbXpmQkg4Z01NL0pFZ3VucWdXRVBX?=
 =?utf-8?B?WjdBQysyTk5pbnlWdUg3eW9GS1ExSGcyMHhPYzdUWld1cndNUUMzMmxnbm5H?=
 =?utf-8?B?d3dVQmlmTkgxT0VhWmh0VjVyU1dKZU9zVXVVTkVUQzdOSTRxNHpRSmNKR3JX?=
 =?utf-8?B?RDFkQmhUMFNXYXBZRjZ5a1R5Tm1XSkkwWVFJT1NRcjkwRWZjNFJKZldPdEFs?=
 =?utf-8?B?OTdGVVMzSzduYy8rZWd5ZW1uU2pjbFFURWh6VWg5cU1IQ25ZdzlJdVBQbGJP?=
 =?utf-8?B?djRJUStpM25JeHY5TU9LcHVHb1Qyb2RBRWd2bEd0N043d2hyZ040MHd6QW4x?=
 =?utf-8?B?RVpkYkY2KytxRWxVeU5NT0ZaUzBQUVNLNzRra01aNkVCTTZUOFlxUG5TMEQ5?=
 =?utf-8?B?cVgxZms0SFZlbW50VFFobllPRDQvN3ZMNnp5eE0zZ0J2bWNUWXBWOHMybnpD?=
 =?utf-8?B?WDVYd3ZZdTlnWnJjTXVZNzl1MjYwNnBqSy9sdXB0bWRPUGlMdThYUngvaW5k?=
 =?utf-8?B?R1k4Qzg1MDE0eTh2dzFGVHIyUjQwbEQxWExPWUUrSUZCUWFHcEppajVKcUo5?=
 =?utf-8?B?TUpVMDdidk9tS0ZpNTFMN1FJOTh3OGsrSi9PRW5xbVJ6b2ZTZlRpNmE1WDR5?=
 =?utf-8?B?cHJ4dEdPZGdhNTdmZ3NmTXZRdnpDVWpvUHRDekQ5QzE5eUpwTWwyc1ZMMGt3?=
 =?utf-8?B?blNudytLV3NRNVZmb2gzSGRsRWJpR01Cc3FtZWw3cmJ4T1A1ZDN2MzRPR0px?=
 =?utf-8?B?SnlVN0pYZGNlOWNJN05nbmJmeVZIS3BycTBMN3E0WU55T0lNOGlzSk02Ukxo?=
 =?utf-8?B?MklHOStiYVd5UUFheERxZ2t2RTFRNzF3NkduZkFhQjhaRU9YYjZsamk5L3Zl?=
 =?utf-8?B?QXRWOTRnRDhDWnJEcm4xdkw1WkljdFNjeGVkdDkzN29kWVo4NHM2MVh4RXIz?=
 =?utf-8?B?cENBOXJncnBMRHl5UE42MlhpdSs5SHJDQjVHVWk3cU03TXNBNHVvZ1hvZ29C?=
 =?utf-8?B?UG9oOFJSYmdERmVUVUVvczU3V1ZMQ2dQUForbklYQkFhZjhldUF1RzNKaVcw?=
 =?utf-8?B?TXlpMForMkhFWnFXZkNYbDB0ZzgvTFlpbjUxZlFOSkFNOEtWWnR4VDQwVHpw?=
 =?utf-8?B?RlJqTFJBcWU1ME9NMmd6MkNLYlJMVmFDamY3c3lyc0VHOHN0ckJpWTM2cW1F?=
 =?utf-8?B?OVp5M1hoQzJ4Z2p5OVZQOWNRZzRXWHhobHhOYWdjc2Z4RjZNdy8vdlJBVVdI?=
 =?utf-8?B?UFh1S3QvODMzUGhCUXNtS0RCSUN2azA5SEJJQ3ZzYkVnSUxIZW82ZzU3Z0gr?=
 =?utf-8?B?Zlo5c0VUYzVndW5zRXFob3g4YVQzTGtOWDRSTXRGR2JacDErdFM0a0h6RDl2?=
 =?utf-8?B?ZTRFTVlvTTNuMWdETFNHVzZrbmZhTDBjUTlrVW5OQmYxdVUreFkra0pUQVZW?=
 =?utf-8?B?UTErTXFBMlh3bnd0b1c3c2l0dzg5Z1piSGNhcTlGc1d3QmthcE03TDVoWG5r?=
 =?utf-8?B?NGhCNTlKVGxKNGZJMWlhbDU0TFpLc0M0OGwvbUVJcG80SG5YOEpxdTU2czNr?=
 =?utf-8?B?c2I3ckZTeFUwZ3JVbnlmRlFQS2NvbUpBUFlmb2dMTS83UXByRE0zU3ZMTEdo?=
 =?utf-8?B?YzJDN0E2UFhVUFEremVUUU8wZU5lemFYUDdPc2JWQWkyM0xGZ2tsTzlwaElM?=
 =?utf-8?B?UDhDMVlNcTZuL3dNeGdsV1c2Vkw2a0Z3S1R0a1dCUG5hVldEUzRNNlZ2TEJV?=
 =?utf-8?B?UEM2TGtveXhyQUREd0FRdkh3OXFEZWhnUUdPTzAvb2oyR0FBbFRTekxzeWNP?=
 =?utf-8?B?S1ViUVlxQ05VZWJONTRqVm9jUzQ3SmdpWUM0NGdmZmJyU01rMldweGhmdzVE?=
 =?utf-8?B?Y3hYYVhubVBCakF6SDVmNGhpMXJsQUMrVmFFelRXeTZXdHFKQW1IN3VRT20v?=
 =?utf-8?B?SG9oQ0pLU1BvQXpCcU9BRFNyQm1aZEc1b2VIT1NoSnR2WnNiakFGMTBYQkFt?=
 =?utf-8?Q?jtUXnzG6gVTZMSaRJ4FZyMEkt?=
Content-ID: <89C7A66E39A28D4BA53A12C4FF88CB89@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cc01c75-71e3-4b59-9211-08dc5f4b6994
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2024 02:01:07.8260 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X4iLuJ0OT+16hgCBzVjtw9hSVXhUC4WgjtYEiMfpWQRxcf/0C9EppeWNloy7fPSwgVl2M8BguGpUYbODA6ywTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB6827
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--16.083100-8.000000
X-TMASE-MatchedRID: 6otD/cJAac0OwH4pD14DsPHkpkyUphL9meN8m2FdGic3xO2R3boBWFbu
 qIY+/skQkABPgKBt/0rfCSrpooSeTLsl8Gv1eXkKFYJUGv4DL3w2UmRdjImQYBBVEcLcHoVgQ0U
 kLoLY8eZBSbpGcFdbMWCbDHcFmAa4jFiQSsgCqNFjVtAwIy+afjGZtPrBBPZr21it1MEktDd4eZ
 bgec4RVuqlJbe7i52t6kYlIAdAgKwfSeW2aiWyCXvBWikXzNqDAGtjp3Iz9RuOUV82NDH4AlO4B
 D7nLMxnThbvLLI8RvMVIevNJESdLLhzq4QWtOF2141MZ0dY1L99LQinZ4QefKU8D0b0qFy9suf7
 RWbvUtyrusVRy4an8SAHAopEd76vxAki6aAS/xtBcHmj0/FQba6rtHYmPzMjuPZSsTQwX+kX+8T
 Zuvy99w==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--16.083100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 30B8F50824A0C411E9C83A39CD96DB6DD777547D500CEE0DD9B69CB54A257DF42000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_008_1614702191.2047964880"
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

--__=_Part_Boundary_008_1614702191.2047964880
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIFdvamNpZWNoOg0KDQpPbiBXZWQsIDIwMjQtMDQtMTcgYXQgMTA6MzggKzAwMDAsIFdvamNp
ZWNoIE1hY2VrIHdyb3RlOg0KPiAgCSANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90
IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZp
ZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gIEluIGNhc2UgdGhlcmUgaXMgbm8gRFAg
ZGV2aWNlIGF0dGFjaGVkIHRvIHRoZSBwb3J0IHRoZQ0KPiB0cmFuc2ZlciBmdW5jdGlvbiBzaG91
bGQgcmV0dXJuIElPIGVycm9yLCBzaW1pbGFyIHRvIHdoYXQNCj4gb3RoZXIgZHJpdmVycyBkby4N
Cj4gSW4gY2FzZSBFQUdBSU4gaXMgcmV0dXJuZWQgdGhlbiBhbnkgcmVhZCBmcm9tIC9kZXYvZHJt
X2RwX2F1eA0KPiBkZXZpY2UgZW5kcyB1cCBpbiBhbiBpbmZpbml0ZSBsb29wIGFzIHRoZSB1cHBl
ciBsYXllcnMNCj4gY29uc3RhbnRseSByZXBlYXRzIHRoZSB0cmFuc2ZlciByZXF1ZXN0Lg0KDQpS
ZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4NCg0KPiANCj4gRml4ZXM6IGY3
MGFjMDk3YTJjZiAoImRybS9tZWRpYXRlazogQWRkIE1UODE5NSBFbWJlZGRlZCBEaXNwbGF5UG9y
dA0KPiBkcml2ZXIiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBXb2pjaWVjaCBNYWNlayA8d21hY2VrQGNo
cm9taXVtLm9yZz4NCj4gLS0tDQo+IENoYW5nZWxvZyB2Mi12MToNCj4gIC0gYWRkZWQgIkZpeGVz
IiB0YWcNCj4gIC0gY29ycmVjdGVkIGUtbWFpbCBhZGRyZXNzDQo+IA0KPiBWMTogDQo+IGh0dHBz
Oi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2pl
Y3QvbGludXgtbWVkaWF0ZWsvcGF0Y2gvMjAyNDA0MDIwNzExMTMuMzEzNTkwMy0xLXdtYWNla0Bj
aHJvbWl1bS5vcmcvX187ISFDVFJOS0E5d01nMEFSYncha0JZX3g1a0d2ZGF1M2JhQ1Z3R3dSdUtv
amhIVklFVzhIdmJ3Mzg1eDJwWGlfMXBDR01DbnRwdHBtT25FUG9NYndBMGRnQTRKVHh3Znk2byQN
Cj4gIA0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcC5jIHwgMiArLQ0KPiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcC5jDQo+IGIvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kcC5jDQo+IGluZGV4IDBiYTcyMTAyNjM2YS4uNTM2MzY2OTU2NDQ3
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwLmMNCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcC5jDQo+IEBAIC0yMTA0LDcgKzIxMDQs
NyBAQCBzdGF0aWMgc3NpemVfdCBtdGtfZHBfYXV4X3RyYW5zZmVyKHN0cnVjdA0KPiBkcm1fZHBf
YXV4ICptdGtfYXV4LA0KPiAgDQo+ICAJaWYgKG10a19kcC0+YnJpZGdlLnR5cGUgIT0gRFJNX01P
REVfQ09OTkVDVE9SX2VEUCAmJg0KPiAgCSAgICAhbXRrX2RwLT50cmFpbl9pbmZvLmNhYmxlX3Bs
dWdnZWRfaW4pIHsNCj4gLQkJcmV0ID0gLUVBR0FJTjsNCj4gKwkJcmV0ID0gLUVJTzsNCj4gIAkJ
Z290byBlcnI7DQo+ICAJfQ0KPiAgDQo=

--__=_Part_Boundary_008_1614702191.2047964880
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtXb2pjaWVjaDoNCg0KT24mIzMyO1dlZCwm
IzMyOzIwMjQtMDQtMTcmIzMyO2F0JiMzMjsxMDozOCYjMzI7KzAwMDAsJiMzMjtXb2pjaWVjaCYj
MzI7TWFjZWsmIzMyO3dyb3RlOg0KJmd0OyYjMzI7JiMzMjsmIzMyOw0KJmd0OyYjMzI7RXh0ZXJu
YWwmIzMyO2VtYWlsJiMzMjs6JiMzMjtQbGVhc2UmIzMyO2RvJiMzMjtub3QmIzMyO2NsaWNrJiMz
MjtsaW5rcyYjMzI7b3ImIzMyO29wZW4mIzMyO2F0dGFjaG1lbnRzJiMzMjt1bnRpbA0KJmd0OyYj
MzI7eW91JiMzMjtoYXZlJiMzMjt2ZXJpZmllZCYjMzI7dGhlJiMzMjtzZW5kZXImIzMyO29yJiMz
Mjt0aGUmIzMyO2NvbnRlbnQuDQomZ3Q7JiMzMjsmIzMyO0luJiMzMjtjYXNlJiMzMjt0aGVyZSYj
MzI7aXMmIzMyO25vJiMzMjtEUCYjMzI7ZGV2aWNlJiMzMjthdHRhY2hlZCYjMzI7dG8mIzMyO3Ro
ZSYjMzI7cG9ydCYjMzI7dGhlDQomZ3Q7JiMzMjt0cmFuc2ZlciYjMzI7ZnVuY3Rpb24mIzMyO3No
b3VsZCYjMzI7cmV0dXJuJiMzMjtJTyYjMzI7ZXJyb3IsJiMzMjtzaW1pbGFyJiMzMjt0byYjMzI7
d2hhdA0KJmd0OyYjMzI7b3RoZXImIzMyO2RyaXZlcnMmIzMyO2RvLg0KJmd0OyYjMzI7SW4mIzMy
O2Nhc2UmIzMyO0VBR0FJTiYjMzI7aXMmIzMyO3JldHVybmVkJiMzMjt0aGVuJiMzMjthbnkmIzMy
O3JlYWQmIzMyO2Zyb20mIzMyOy9kZXYvZHJtX2RwX2F1eA0KJmd0OyYjMzI7ZGV2aWNlJiMzMjtl
bmRzJiMzMjt1cCYjMzI7aW4mIzMyO2FuJiMzMjtpbmZpbml0ZSYjMzI7bG9vcCYjMzI7YXMmIzMy
O3RoZSYjMzI7dXBwZXImIzMyO2xheWVycw0KJmd0OyYjMzI7Y29uc3RhbnRseSYjMzI7cmVwZWF0
cyYjMzI7dGhlJiMzMjt0cmFuc2ZlciYjMzI7cmVxdWVzdC4NCg0KUmV2aWV3ZWQtYnk6JiMzMjtD
SyYjMzI7SHUmIzMyOyZsdDtjay5odUBtZWRpYXRlay5jb20mZ3Q7DQoNCiZndDsmIzMyOw0KJmd0
OyYjMzI7Rml4ZXM6JiMzMjtmNzBhYzA5N2EyY2YmIzMyOygmcXVvdDtkcm0vbWVkaWF0ZWs6JiMz
MjtBZGQmIzMyO01UODE5NSYjMzI7RW1iZWRkZWQmIzMyO0Rpc3BsYXlQb3J0DQomZ3Q7JiMzMjtk
cml2ZXImcXVvdDspDQomZ3Q7JiMzMjtTaWduZWQtb2ZmLWJ5OiYjMzI7V29qY2llY2gmIzMyO01h
Y2VrJiMzMjsmbHQ7d21hY2VrQGNocm9taXVtLm9yZyZndDsNCiZndDsmIzMyOy0tLQ0KJmd0OyYj
MzI7Q2hhbmdlbG9nJiMzMjt2Mi12MToNCiZndDsmIzMyOyYjMzI7LSYjMzI7YWRkZWQmIzMyOyZx
dW90O0ZpeGVzJnF1b3Q7JiMzMjt0YWcNCiZndDsmIzMyOyYjMzI7LSYjMzI7Y29ycmVjdGVkJiMz
MjtlLW1haWwmIzMyO2FkZHJlc3MNCiZndDsmIzMyOw0KJmd0OyYjMzI7VjE6JiMzMjsNCiZndDsm
IzMyO2h0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL3BhdGNod29yay5rZXJuZWwu
b3JnL3Byb2plY3QvbGludXgtbWVkaWF0ZWsvcGF0Y2gvMjAyNDA0MDIwNzExMTMuMzEzNTkwMy0x
LXdtYWNla0BjaHJvbWl1bS5vcmcvX187ISFDVFJOS0E5d01nMEFSYncha0JZX3g1a0d2ZGF1M2Jh
Q1Z3R3dSdUtvamhIVklFVzhIdmJ3Mzg1eDJwWGlfMXBDR01DbnRwdHBtT25FUG9NYndBMGRnQTRK
VHh3Znk2byYjMzY7DQomZ3Q7JiMzMjsmIzMyOw0KJmd0OyYjMzI7JiMzMjtkcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RwLmMmIzMyO3wmIzMyOzImIzMyOystDQomZ3Q7JiMzMjsmIzMyOzEm
IzMyO2ZpbGUmIzMyO2NoYW5nZWQsJiMzMjsxJiMzMjtpbnNlcnRpb24oKyksJiMzMjsxJiMzMjtk
ZWxldGlvbigtKQ0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtkaWZmJiMzMjstLWdpdCYjMzI7YS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwLmMNCiZndDsmIzMyO2IvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kcC5jDQomZ3Q7JiMzMjtpbmRleCYjMzI7MGJhNzIxMDI2MzZhLi41MzYz
NjY5NTY0NDcmIzMyOzEwMDY0NA0KJmd0OyYjMzI7LS0tJiMzMjthL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHAuYw0KJmd0OyYjMzI7KysrJiMzMjtiL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHAuYw0KJmd0OyYjMzI7QEAmIzMyOy0yMTA0LDcmIzMyOysyMTA0LDcmIzMyO0BA
JiMzMjtzdGF0aWMmIzMyO3NzaXplX3QmIzMyO210a19kcF9hdXhfdHJhbnNmZXIoc3RydWN0DQom
Z3Q7JiMzMjtkcm1fZHBfYXV4JiMzMjsqbXRrX2F1eCwNCiZndDsmIzMyOyYjMzI7DQomZ3Q7JiMz
MjsmIzMyO2lmJiMzMjsobXRrX2RwLSZndDticmlkZ2UudHlwZSYjMzI7IT0mIzMyO0RSTV9NT0RF
X0NPTk5FQ1RPUl9lRFAmIzMyOyZhbXA7JmFtcDsNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjshbXRrX2RwLSZndDt0cmFpbl9pbmZvLmNhYmxlX3BsdWdnZWRfaW4pJiMzMjt7DQom
Z3Q7JiMzMjstcmV0JiMzMjs9JiMzMjstRUFHQUlOOw0KJmd0OyYjMzI7K3JldCYjMzI7PSYjMzI7
LUVJTzsNCiZndDsmIzMyOyYjMzI7Z290byYjMzI7ZXJyOw0KJmd0OyYjMzI7JiMzMjt9DQomZ3Q7
JiMzMjsmIzMyOw0KDQo8L3ByZT4NCjwvcD48L2JvZHk+PC9odG1sPjwhLS10eXBlOnRleHQtLT48
IS0tey0tPjxwcmU+KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNl
ICoqKioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMg
ZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZp
ZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZy
b20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJl
IA0KY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2Us
IGRpc3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNv
cHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5p
bnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUg
dW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUt
bWFpbCwgb3IgYmVsaWV2ZSANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4g
ZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWlu
ZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUt
bWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRv
IG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBl
cnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_008_1614702191.2047964880--

