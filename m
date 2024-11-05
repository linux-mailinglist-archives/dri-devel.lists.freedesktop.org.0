Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE37B9BC3E9
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 04:33:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A497110E506;
	Tue,  5 Nov 2024 03:33:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="ARJefmIE";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="raNFVCyr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87F9E10E506
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 03:33:11 +0000 (UTC)
X-UUID: abb59b469b2611efbd192953cf12861f-20241105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=XrnOvQSEvbefqgvH1ahaF35rQJbUPhV+ufX46Ma5aH0=; 
 b=ARJefmIEOP13x/lz3i2hY5BKhJh5g8tGjewBoZDAgQgYZ/ApfuEAK960ILYrRUjqkrwaG77sAVv2JgYhQBlzaTAzsU33A1fUWLhwwafLE8sWE+cYq6sQH3Gt3RX87nafofpC0vGGf/+beODm6p97zmmD6QKOpTEAwFxFTWoLgKc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42, REQID:33b1e90a-756f-4482-91ad-bde62fea1ba6, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:b0fcdc3, CLOUDID:2355b248-ca13-40ea-8070-fa012edab362,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: abb59b469b2611efbd192953cf12861f-20241105
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1208068875; Tue, 05 Nov 2024 11:33:06 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 5 Nov 2024 11:33:04 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Tue, 5 Nov 2024 11:33:03 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hjYaAxJQ5T/ZwK+GjxZAG4pOrteQ6n5FTgbpdbh9xZYaRdf5TPendDgde+mCDlbNGKZbxGc+gH0mFKG8iNcujK9q/EHn9pnBh1ZnHAnVhXGTQhsfYRAI5TRBM4RTzUsCVKGXoagxi4QbdNQRD2nNK4DrvB6oZ3WJ+fhOOaZ7uILgMNUef/DDZlppFjaxPCP/AtO++8Dk+VDdU9/LjeFYvB5ojT6V/0g7uJY313G49qXw/3U49oDstkHeOh+27Ch817Za5muRvm8gnwC3zYK7NQNrfIcmSZzaOPqzF4WcVvuO7iR7VicoVIFvnVVsoI+dwr2OwRN4vKfaQBHhfuzXWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zTSgH/r7vieWtyrTUhofFt+j67/7rfOBEo4qjHCCoN4=;
 b=W4bNOZXYf/I9j/Bp71ZsxLQRcpjrNaI8Y1z4QpDgdFxysDkEB3jd2/iL02McEe/kqTUBAXD5AwYSDa1y8sfVpMC2SbIM1SO5jVHSOktILV+2zXlmhsuOXOQHcrg1TIpoGDife0XjSlmASym86V+a8dHlijJkjIriWB0NqPjmz2bdy5hBAm8W54fRrSBCTVa0NZyoBMuG3Y49UH4z8AehS2W5tSa8Et2TI6OTZ53YZ5tNiCdTX3DehNR7AJVlIH6fR/GZQ/e0vF/5PFdDTFVFpCXsArwHUr5IbkS5YdqNh6Tl6901V++fYW5ReZw/87GpDgwrzu0Vi/EoHjCK8d1o3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zTSgH/r7vieWtyrTUhofFt+j67/7rfOBEo4qjHCCoN4=;
 b=raNFVCyr0GBGhLx7qqGLnH7TYaLQS7mk9Q0ScsdQemv6ko+01bszFkgTMY5ydzsh6TtBgYC4wHw3u4hjqzO1aozEWjAZvxJ2a/K+35KdU0vyGfOcdrIXOKkQHk7gbE8fDFNVocpMUCBFaAClvHsRGvc4S/1U6/xImMEEN7uc490=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEYPR03MB7024.apcprd03.prod.outlook.com (2603:1096:101:d1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.29; Tue, 5 Nov
 2024 03:33:00 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 03:33:00 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>, "mchehab@kernel.org"
 <mchehab@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?utf-8?B?U2h1LWhzaWFuZyBZYW5nICjmpYroiJLnv5Qp?=
 <Shu-hsiang.Yang@mediatek.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "yunkec@chromium.org" <yunkec@chromium.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, =?utf-8?B?WWF5YSBDaGFuZyAo5by16ZuF5riFKQ==?=
 <Yaya.Chang@mediatek.com>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?utf-8?B?VGVkZHkgQ2hlbiAo6Zmz5Lm+5YWDKQ==?= <Teddy.Chen@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "hidenorik@chromium.org"
 <hidenorik@chromium.org>, =?utf-8?B?U2h1bi1ZaSBXYW5nICjnjovpoIblhIQp?=
 <Shun-Yi.Wang@mediatek.com>
Subject: Re: [PATCH v1 06/10] media: platform: mediatek: add isp_7x utility
Thread-Topic: [PATCH v1 06/10] media: platform: mediatek: add isp_7x utility
Thread-Index: AQHbGj2JaAd/ufwz/0W0Edv5eKs5YbKoMleA
Date: Tue, 5 Nov 2024 03:33:00 +0000
Message-ID: <3b600215d94ccb6f5c51dfd66aaeef6555cec8bf.camel@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
 <20241009111551.27052-7-Shu-hsiang.Yang@mediatek.com>
In-Reply-To: <20241009111551.27052-7-Shu-hsiang.Yang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEYPR03MB7024:EE_
x-ms-office365-filtering-correlation-id: 7f93ecd6-1421-4519-a113-08dcfd4a8c7d
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?UmJtYVdEREZ2K3dVbE5hNHFpVTdvVjBHbk9PRk1UNHN4aXZJMWJWcFhBaUFs?=
 =?utf-8?B?KzQwRGV0RkV5UU1MTzdQL2JYbzdUc1ZvNUZ6cmNmMUFPRm0yMjVwWUM5bUFk?=
 =?utf-8?B?YTYrVGxpYXdOUVBJR2ZrcGNUcHhtMEFFV0tKQkdWL0pjMEdVNEd2cURoQ2hN?=
 =?utf-8?B?VmhxSGNlWFl6eGFsSVNyM1JWZHl5elJDaHBwWEREdnZoR1Z4eFIwL3Bpc2FL?=
 =?utf-8?B?anNXL2hPR002YnpGaUptdGxFNXZLR2V6M1BFd09ycnZZMEx0UklzZnBhQ2Rj?=
 =?utf-8?B?b0RKbHM5N0wxRStwWm56YWZmZnJ1NXVCaDN6NkNLcDloSW5kRk4wV1lnSWN3?=
 =?utf-8?B?NGtFVWVIcXUrS1VOWmVqMFJPL0htMVB3QjNtZTVOUkJJeFJLaTVaWVFVNlcv?=
 =?utf-8?B?b1hsNVBCQkZVYlZpZHdud250SjQ2V0lDWHdYTkZuWEFpbGwrRjNFMUVpR01L?=
 =?utf-8?B?bXJTaUtNc1o0WE1DRGVZclZ6VWd1S3gvVlQ1TEF0TERLY3h0Y2tFd1NyeW9x?=
 =?utf-8?B?YzBNYnBkRDRnUUZtWm5LdndoYytVdkZPRWM4dTJBYnZRN1lwb1pUc1VCbGxw?=
 =?utf-8?B?ak1pTDIwVmJ5Z2pNUmUvWW12NGgzUnQrSXEwcGREZndOaEYvZ0tZaUtwZnMv?=
 =?utf-8?B?eXRXRFVCVGFYSys2ZW51cVhHS0djZGgwVkpLSDl2aHMwMEFZR2U1dWVSNHFw?=
 =?utf-8?B?NndYNEl1TjB4cjFtTzFpa1crdnZCVjhMeHI0VVhWaUdTME42ekoxUHg3SUdN?=
 =?utf-8?B?UEJ2KzhXZUwrOUVnczJ2N0l0bzlDY0lpT1ZMbnZCd0VmZ2lCNFozTGVQMXRK?=
 =?utf-8?B?Mnc2RGYvbUpLMEQxREJJTjE0YmZVV2ZuOTBCSUtLSE9pNUxzZ2VjZkdEdURa?=
 =?utf-8?B?NlV0aXU3cVJzb01PUzIvcHF3dGJLNDJWTCsrYlNSWDBEWmhNOTNEMDBTcFh6?=
 =?utf-8?B?VmFsbkVySUhzVWtHc3RKcDdYOWVjd3Avc2Z3aW5BeDI0S1kzVGNuTHdZQVJM?=
 =?utf-8?B?d05aMGJad2FBeWtUdlA1dEdHVVYxN01uSmlqWXljUVZMV1dYYjBrSXdnaDhq?=
 =?utf-8?B?OUZGWC81TEsxcWFhQjEvdGdmMjJLMlEzRHd3RWo1WWNzc1ZxUGdyT0RuN2s5?=
 =?utf-8?B?RTFJM0lSZlp3YTZYcXN6NjNPR1BzTCsyaG5maGdXRGg5QW85UzVXaGtrck5z?=
 =?utf-8?B?Q0wyd3I4OHlkem5GZGZDVjQ3MnZqaEQwVjhQcHpCYUVOQmdMcy9kRFhvbzFW?=
 =?utf-8?B?QS8reWpqZ0JiWEZLcG1SNnFTeFhVbUdpa296YkdYMjBYenVlL2loSE8rSTAy?=
 =?utf-8?B?VllHS21UaUJjcHlMYmNHclZxdjExVmx2SnRvOG9Ic2M0V1dET29BKzFFN0dX?=
 =?utf-8?B?QmZ5M2Y5d0FEMXBWaWNJOWh1TU1UT1JxRDhid1EzWEhmeUxvSGFIaDVuTVIx?=
 =?utf-8?B?RFB2V0FYeGp2c1BzTVhzK1JUWUFDUHhoMlpkQlVJTUtBMzc5MThOUXJrQlFI?=
 =?utf-8?B?SGRVOFdyUmdSaXVvQnZ0WmlPVkk4ZlBNam0yQ01wQUExdFlSM1RXWWtINVA4?=
 =?utf-8?B?ME85dlFTTEpTOTBGNFhXUUUxUXpUZ1lCZzFNS3FtM21MdUFxc3Y1Uk5VcVZu?=
 =?utf-8?B?a2JSSFZxbFQ1L0VpRU9nY1BoY1M5dzNlRWltZDZmRGhadlMra2xVeXFoR05U?=
 =?utf-8?B?cjFCNzhadnB3UTFwVDgwZGU5VHlDVklUQnRoT1dSaWtDTUZ2UDhZb3N0d0xN?=
 =?utf-8?B?dzZBQ1N6MEVscUhPaDhocnJ3Z0tjRE1KK2FTdmpXWGhkWXhVbC9KZ2czQzdy?=
 =?utf-8?Q?nVRgyHv3yYD71glDDCwnEOCTk/ZssV1AGvsls=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MWkvSEhTVzEreDZmYjFXZENOK01OcTQvd2VJZ2g4L1c1V2xIVUg0MWF5a2g3?=
 =?utf-8?B?RngwK1Vmd2dzdWIxZ0pyVjNoQk5BUGFxd1ZJMGtxRHU1WXNuQy9SWGlnZWw2?=
 =?utf-8?B?V1BpK2t4NUxvZlBKaHR2Y2VIZlJ4aTJnZzlSQ2NiYkthOTB4RFRDYUJibzJT?=
 =?utf-8?B?UHRENWRCSWRnY3owOTVpMTdBV1M2b2dUSVZJbDg4OEx6VzRHMklHcHFxU1pP?=
 =?utf-8?B?WDI3aGh0UGRrZFJ0VEFrdlhWeUxaMCs3S0MxOFJxQmpCcWRsaUp6L0xtc1ZR?=
 =?utf-8?B?cEtVeHJ2cUpqK2RrSjBKQ1FmblRxei9LOG1RUUM3MEhNSEVIV3NwZE9PMW9y?=
 =?utf-8?B?YzFmN3dybzNEN2R1S2JIenE3aG5Ed2FqZ3FOM2VGaVFpampkdTRNc1JZZWdK?=
 =?utf-8?B?U3RxTkQ3dFVsMlZJdmY5Ry9DaHZlMFNMelVaL25VYjlzZlkra2R4UXNOL2tZ?=
 =?utf-8?B?R1lQNDVRdVlXbW5sQ3A0VGc1U1dMaHRyaEVaR240VlJwaDd6OTZ1cXZwU2l0?=
 =?utf-8?B?TzlQS29YcW1tN3NJMUdwTjFYRUZhaDVuaGlmb3lFUzVzZ0l2eEQ5ZDU2eFE3?=
 =?utf-8?B?VGNkL05HVmorRUliR0RKaVhnWDJKbjMyOUgwSkNYMmZjdGVOZ1lXckwrb2o5?=
 =?utf-8?B?WEdwaEYvQ3VxN0F5NU1sZTVOaG5NUGNFaU9rUnFQcDY4UnRQV3Y3ZWxlWUV0?=
 =?utf-8?B?L1VoUlh3empRL1dwUEU3MUpVVHJZMjhZcFQzRVdQNFMxMDNqbjgzSEVRaE5n?=
 =?utf-8?B?U3hoaGNWSExza2lublhiOTV6Zmx4bERoWVhuRVM1MXdpSnpmU3FpNVg0SVFH?=
 =?utf-8?B?N3d0cEhTaHpXaEx0S3grWE9kejBldUxYVzl2Zi9odVhKdUx3NWQrYjZpWTl5?=
 =?utf-8?B?cEFMUnV1UlVsSWVZN096M3BGcTYzNEpZUXcvRGxxOVFpeTNuM085NlVWWFlW?=
 =?utf-8?B?RnRPRmZWendENzNOampqNE1mVGZhMW5BSFMyRUQ5SWd1TzEreWVsd2I1N2du?=
 =?utf-8?B?UDNGbUFmOFJDSG1YaGlKaVk4czVhSlM4bjBTblVLVUR6MVlzSTVSclIvNFJC?=
 =?utf-8?B?am52Qzh2S1V4Y0hSMlpPbTNnS2VyT0dXTSsxb2doR2I1VUp4K0pmSTIwRWRn?=
 =?utf-8?B?K0tRaHJIb0FLVm51bVlmeGVJaitDRG9oVHBOM2Q5S3h1RHhiQzVaMnRBSW1M?=
 =?utf-8?B?c0pVZ1VxSE9SNy9yYlR5akY3TmFuK0N2V3FTcTZ4Z1lXYzdSY0dVZ1FSdVY2?=
 =?utf-8?B?WlJLOWhxN25ZcExrKzIxdnZMdklrTTB2V1pMdmg2TEdzdVFZaEM5MDVialJV?=
 =?utf-8?B?WVpmMHU4UUhCbFl2N3AySFBLOUNaVmk0d2kraEpFOXdac1c5TGRxRksyTG5V?=
 =?utf-8?B?M0t3dFBFVE40ZWJNWWxURDBzc1hPSndiUm1zZlI3SitOVXlTY3QvTi9XdTdI?=
 =?utf-8?B?RnB5TWJwOWltWlZPcENwSkw2bmpOQ1MrY2tKcTVSdXh5U09uUkRUS2swNkJo?=
 =?utf-8?B?Q3NIbldVRFd3anhpVmhYUHZabitIcE55VHNEWUxxemVVYW92cEhHaXdIQjRG?=
 =?utf-8?B?bW9JQldMcTcxeEdHRWplZGFNV1FjSGY4bjFIRlpkNWluWTVYSEV3VThMdWdv?=
 =?utf-8?B?TmE4Z1ZHc0ZBc0JSc1NWcjZuRXJBU1UzU0g4S0pPNXlmTzY5WHZWOUI2RXBL?=
 =?utf-8?B?bG1Hd1ZPa0xEN1FvQWZLTkttMXVicmlFSHZ6MHl0Z0VyUkFRWDhlNWgrSHgx?=
 =?utf-8?B?cU1NMmdQdlFSN3dudGQzV0grUnJCRnN2UUp0d3JLM3p4Y3Z6cTlnQTdZeFIz?=
 =?utf-8?B?aUpTQjRITENhVEdhYXF0MjIwYXFxWnlYVFo2bngrQVpoUHhtOTZsUlRKUVp0?=
 =?utf-8?B?ZTkya3BjS1JTSEs2cVM3Vk9nTFZsdW5BUi9QT3dNRWQxNWlxV3NCTlR6QVhT?=
 =?utf-8?B?Rk5ocE14T3VKNFJCTXk0eTVMWmtTaHhCeXJ2S0NuRmhWc0VUMGpnVzh3UGlD?=
 =?utf-8?B?cjU0MkpHSnJKREt1bmU4ZlcrYldTdWh3aWw0NXJaRVd5YnJ3Q0VTVHVRYkRx?=
 =?utf-8?B?STk1TnkrQ08zb2pLS1ZiZjBPbFZtL2ZQM0VNNkx5eUY5WVFDbG0vV3FGRWdv?=
 =?utf-8?B?dCtuNEE2c25SbWFwRkI5UlVHQW5vUkdQRTh3VWFHZGVvRitJbG5yVjN4TUlX?=
 =?utf-8?B?YXc9PQ==?=
Content-ID: <66221D7964599D4D8B848873BACB268A@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f93ecd6-1421-4519-a113-08dcfd4a8c7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2024 03:33:00.5957 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ARXHbAfnj4mD1I/Xzfl1v4Y/wDk2BfPooMZzYNm6fBTnfVj40qEMiCcX2BzPs8ZWYyVXEwNU0WPP9axlehGI7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7024
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--12.055500-8.000000
X-TMASE-MatchedRID: nVQUmLJJeyZm6oeM5+OJFCaix8JZpk78jLOy13Cgb4+qvcIF1TcLYEmo
 bOLhIyMmCPYbugXTgR+M5TCLNNgDParukyhyG02kylAqNTt8FdX54F/2i/DwjRrUQ7A9MrmGjse
 1+4fQ7uu2XuqHnmj9+0yb6E0Dw6IRuIonElFF+KGVOwZbcOalS30tCKdnhB58pTwPRvSoXL2y5/
 tFZu9S3Ku6xVHLhqfxIAcCikR3vq+fMsioQSoA6sMbruRyoNh49GdO1wuJiFQsYgdkaOnLHFXbe
 VjxjZeK
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--12.055500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: D5C80C698CF5087C640FA46D84CD3845018A25C3C6E6D88420AB2EB828D904AD2000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_004_1235781014.951127908"
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

--__=_Part_Boundary_004_1235781014.951127908
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIFNodS1oc2lhbmc6DQoNCk9uIFdlZCwgMjAyNC0xMC0wOSBhdCAxOToxNSArMDgwMCwgU2h1
LWhzaWFuZyBZYW5nIHdyb3RlOg0KPiBJbnRyb2R1Y2VzIHV0aWxpdHkgZmlsZXMgZm9yIHRoZSBN
ZWRpYVRlayBJU1A3LnggY2Ftc3lzIGRyaXZlci4gVGhlc2UNCj4gdXRpbGl0aWVzIHByb3ZpZGUg
ZXNzZW50aWFsIHBsYXRmb3JtIGRlZmluaXRpb25zLCBkZWJ1Z2dpbmcgdG9vbHMsIGFuZA0KPiBt
YW5hZ2VtZW50IGZ1bmN0aW9ucyB0byBzdXBwb3J0IElTUCBvcGVyYXRpb25zIGFuZCBTQ1AgY29t
bXVuaWNhdGlvbi4NCj4gS2V5IGZ1bmN0aW9uYWxpdGllcyBpbmNsdWRlOg0KPiAxLkhhcmR3YXJl
IHBpcGVsaW5lIGFuZCByZWdpc3RlciBkZWZpbml0aW9ucyBmb3IgbWFuYWdpbmcgaW1hZ2UNCj4g
cHJvY2Vzc2luZyBtb2R1bGVzLg0KPiAyLkRNQSBkZWJ1Z2dpbmcgdXRpbGl0aWVzIGFuZCBidWZm
ZXIgbWFuYWdlbWVudCBmdW5jdGlvbnMuDQo+IDMuRGVmaW5pdGlvbnMgb2Ygc3VwcG9ydGVkIGlt
YWdlIGZvcm1hdHMgZm9yIHByb3BlciBkYXRhIGhhbmRsaW5nLg0KPiA0LklQSSBhbmQgU0NQIGNv
bW11bmljYXRpb24gc3RydWN0dXJlcyBmb3IgbW9kdWxlIHN0YXRlIG1hbmFnZW1lbnQgYW5kDQo+
IGNvbmZpZ3VyaW5nIElTUC4NCj4gNS5NZXRhZGF0YSBwYXJhbWV0ZXJzIGZvciBjb25maWd1cmlu
ZyBpbWFnZSBwcm9jZXNzaW5nLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogU2h1LWhzaWFuZyBZYW5n
IDxTaHUtaHNpYW5nLllhbmdAbWVkaWF0ZWsuY29tPg0KPiAtLS0NCg0KW3NuaXBdDQoNCj4gKy8q
IFJBVyBpbnB1dCB0cmlnZ2VyIGN0cmwqLw0KPiArI2RlZmluZSBSQVdJX1IyX1RSSUcJCQkJCQlC
SVQoMCkNCj4gKyNkZWZpbmUgUkFXSV9SM19UUklHCQkJCQkJQklUKDEpDQo+ICsjZGVmaW5lIFJB
V0lfUjRfVFJJRwkJCQkJCUJJVCgyKQ0KDQpSQVdJX1I0X1RSSUcgaXMgbm90IHVzZWQsIHNvIGRy
b3AgaXQuDQoNClJlZ2FyZHMsDQpDSw0KDQo+ICsjZGVmaW5lIFJBV0lfUjVfVFJJRwkJCQkJCUJJ
VCgzKQ0KPiArI2RlZmluZSBSQVdJX1I2X1RSSUcJCQkJCQlCSVQoNCkNCj4gKw0KDQo=

--__=_Part_Boundary_004_1235781014.951127908
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtTaHUtaHNpYW5nOg0KDQpPbiYjMzI7V2Vk
LCYjMzI7MjAyNC0xMC0wOSYjMzI7YXQmIzMyOzE5OjE1JiMzMjsrMDgwMCwmIzMyO1NodS1oc2lh
bmcmIzMyO1lhbmcmIzMyO3dyb3RlOg0KJmd0OyYjMzI7SW50cm9kdWNlcyYjMzI7dXRpbGl0eSYj
MzI7ZmlsZXMmIzMyO2ZvciYjMzI7dGhlJiMzMjtNZWRpYVRlayYjMzI7SVNQNy54JiMzMjtjYW1z
eXMmIzMyO2RyaXZlci4mIzMyO1RoZXNlDQomZ3Q7JiMzMjt1dGlsaXRpZXMmIzMyO3Byb3ZpZGUm
IzMyO2Vzc2VudGlhbCYjMzI7cGxhdGZvcm0mIzMyO2RlZmluaXRpb25zLCYjMzI7ZGVidWdnaW5n
JiMzMjt0b29scywmIzMyO2FuZA0KJmd0OyYjMzI7bWFuYWdlbWVudCYjMzI7ZnVuY3Rpb25zJiMz
Mjt0byYjMzI7c3VwcG9ydCYjMzI7SVNQJiMzMjtvcGVyYXRpb25zJiMzMjthbmQmIzMyO1NDUCYj
MzI7Y29tbXVuaWNhdGlvbi4NCiZndDsmIzMyO0tleSYjMzI7ZnVuY3Rpb25hbGl0aWVzJiMzMjtp
bmNsdWRlOg0KJmd0OyYjMzI7MS5IYXJkd2FyZSYjMzI7cGlwZWxpbmUmIzMyO2FuZCYjMzI7cmVn
aXN0ZXImIzMyO2RlZmluaXRpb25zJiMzMjtmb3ImIzMyO21hbmFnaW5nJiMzMjtpbWFnZQ0KJmd0
OyYjMzI7cHJvY2Vzc2luZyYjMzI7bW9kdWxlcy4NCiZndDsmIzMyOzIuRE1BJiMzMjtkZWJ1Z2dp
bmcmIzMyO3V0aWxpdGllcyYjMzI7YW5kJiMzMjtidWZmZXImIzMyO21hbmFnZW1lbnQmIzMyO2Z1
bmN0aW9ucy4NCiZndDsmIzMyOzMuRGVmaW5pdGlvbnMmIzMyO29mJiMzMjtzdXBwb3J0ZWQmIzMy
O2ltYWdlJiMzMjtmb3JtYXRzJiMzMjtmb3ImIzMyO3Byb3BlciYjMzI7ZGF0YSYjMzI7aGFuZGxp
bmcuDQomZ3Q7JiMzMjs0LklQSSYjMzI7YW5kJiMzMjtTQ1AmIzMyO2NvbW11bmljYXRpb24mIzMy
O3N0cnVjdHVyZXMmIzMyO2ZvciYjMzI7bW9kdWxlJiMzMjtzdGF0ZSYjMzI7bWFuYWdlbWVudCYj
MzI7YW5kDQomZ3Q7JiMzMjtjb25maWd1cmluZyYjMzI7SVNQLg0KJmd0OyYjMzI7NS5NZXRhZGF0
YSYjMzI7cGFyYW1ldGVycyYjMzI7Zm9yJiMzMjtjb25maWd1cmluZyYjMzI7aW1hZ2UmIzMyO3By
b2Nlc3NpbmcuDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtTaHUtaHNp
YW5nJiMzMjtZYW5nJiMzMjsmbHQ7U2h1LWhzaWFuZy5ZYW5nQG1lZGlhdGVrLmNvbSZndDsNCiZn
dDsmIzMyOy0tLQ0KDQpbc25pcF0NCg0KJmd0OyYjMzI7Ky8qJiMzMjtSQVcmIzMyO2lucHV0JiMz
Mjt0cmlnZ2VyJiMzMjtjdHJsKi8NCiZndDsmIzMyOysjZGVmaW5lJiMzMjtSQVdJX1IyX1RSSUdC
SVQoMCkNCiZndDsmIzMyOysjZGVmaW5lJiMzMjtSQVdJX1IzX1RSSUdCSVQoMSkNCiZndDsmIzMy
OysjZGVmaW5lJiMzMjtSQVdJX1I0X1RSSUdCSVQoMikNCg0KUkFXSV9SNF9UUklHJiMzMjtpcyYj
MzI7bm90JiMzMjt1c2VkLCYjMzI7c28mIzMyO2Ryb3AmIzMyO2l0Lg0KDQpSZWdhcmRzLA0KQ0sN
Cg0KJmd0OyYjMzI7KyNkZWZpbmUmIzMyO1JBV0lfUjVfVFJJR0JJVCgzKQ0KJmd0OyYjMzI7KyNk
ZWZpbmUmIzMyO1JBV0lfUjZfVFJJR0JJVCg0KQ0KJmd0OyYjMzI7Kw0KDQoNCjwvcHJlPg0KPC9w
PjwvYm9keT48L2h0bWw+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioqKioq
IE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UNCiAqKioqKioqKioqKioqKioqKioqKg0K
VGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRp
bmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBw
cml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBw
bGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhl
IGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3Ry
aWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChp
bmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlz
IHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5v
dCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUNCiANCnRo
YXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkg
dGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRl
bGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBh
dHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNv
bnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9w
cmU+PCEtLX0tLT4=

--__=_Part_Boundary_004_1235781014.951127908--

