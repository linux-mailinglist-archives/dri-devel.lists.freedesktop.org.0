Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8105294E7B6
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 09:25:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4884F10E11A;
	Mon, 12 Aug 2024 07:25:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="nrWPEopQ";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="uA1o8+an";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD37510E11A
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 07:25:37 +0000 (UTC)
X-UUID: 0d393ece587c11ef9a4e6796c666300c-20240812
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=tDAXNyuIGoHIZoUeLzK30BUmoBeTefmwHBFOTKAwJ/o=; 
 b=nrWPEopQyAPlgjtmkIeKlO1+I2/u3p8jKtlCARqowatl36pz6ZqeYZIUH5zg3D5mVbIRCg40c7mZ0WR2Dh4t6lVKQseOJlA4PfQWu4PXMrRUYN4GWc9HNd3X1looWwcOlthblf7uWuoEywEQ0OX6XE7GnhiOT+O1PO+HwqA+qrA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41, REQID:7a25efa0-94e2-49c3-8f7a-0c4528347f2f, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6dc6a47, CLOUDID:9d3c0d3e-6aa5-4057-84d5-0e7d47251781,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 0d393ece587c11ef9a4e6796c666300c-20240812
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1940561994; Mon, 12 Aug 2024 15:25:29 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 12 Aug 2024 00:25:31 -0700
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Mon, 12 Aug 2024 15:25:30 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=psFD3atwsFZgD+T6UnhUQ4oOzzCgoQSK/CkXXXfrRDRA3edVfq8o9TA/X0snoCYN5FHFhx7mVsPHHsKZObFJDK1QTvIgKssWmeDgxK5j/+opvzV+3bhB5E8poKFlct5XNOzMDob4j8BgWQG+dlOGjvtZP9QmrxDWsPFr4Al1mhUZuAsRlZyC+l9JJGq+rk++ZjTmojoggjpTef1VSTF4lSZAJS9UZt0v67dNwAaq6HvL3xKuUBVOIx/ufZKPz8I1Iho4R1R0pitJn8hufmdhC1zowCUu5FwGZEJywPF4yNlu3qqrTxM0OFlNo50eonP/3Ej10oKqaxnWPXOiJgf8OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XB0fHDD6vFfDEO5F8CEwRyIkTFhWcBQ/jTx8n03PjEU=;
 b=wskA97pGqR3BRJPSqa5OpkTLTNLDKKrOJiH9Dizk+vg40sgZvdHy//jRVxRCqdB9XLCVPAKcmMBKc7fc5GTBQvRLlnSPjpkpeR/F0GZz3ff9GhNgpgcplz9FJC9p7XXJSGtR29WSuaKpEn5V0DIvFe7wBMtEf69mmzZayV8dD1ZRm+LEuGuTFmYRm5NM+veQBt/xag+Z53LZ3xBTk0IdKHaP16sDJRDS3+mVI+dp1ydepVQ+fVkWs7nc/099c4ENcxiMsGy+JA2sdEhvToAJXaXv7fwrLT7a0ArGPHA7WqdcsOTuBZQtIwdvCqws1jdcyuC0WAg0Jci/PoyATzM0Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XB0fHDD6vFfDEO5F8CEwRyIkTFhWcBQ/jTx8n03PjEU=;
 b=uA1o8+anUsQmshzwPAEG0M9mbsgRO+YpnLOz0dJgaLbfCaopCc45XQkuAPITfOhKpnbKL52bsPgR+4kV87ZlLFiLodTWmY1ZT8Tyea3mNQa2sDqV9N1X+McMxg4vVdObVGAQ99bqhTLkxOjsvKgUAEg2aEx+sxJCLcxQG6n6Mzo=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEYPR03MB6531.apcprd03.prod.outlook.com (2603:1096:101:8a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Mon, 12 Aug
 2024 07:25:27 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.7849.019; Mon, 12 Aug 2024
 07:25:27 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?TWFjIFNoZW4gKOayiOS/iik=?= <Mac.Shen@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?= <jitao.shi@mediatek.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?utf-8?B?U2h1aWppbmcgTGkgKOadjuawtOmdmSk=?= <Shuijing.Li@mediatek.com>
Subject: Re: [PATCH v3 2/3] Subject: [PATCH] drm/mediatek/dp: Add HDCP2.x
 feature for DisplayPort
Thread-Topic: [PATCH v3 2/3] Subject: [PATCH] drm/mediatek/dp: Add HDCP2.x
 feature for DisplayPort
Thread-Index: AQHauZvjSsoBOfJjC0GAI+NtmELueLIjnmIA
Date: Mon, 12 Aug 2024 07:25:27 +0000
Message-ID: <9b4197e053d8c138eb8418bfa268e83b91dcfc92.camel@mediatek.com>
References: <20240608120219.21817-1-mac.shen@mediatek.com>
 <20240608120219.21817-3-mac.shen@mediatek.com>
In-Reply-To: <20240608120219.21817-3-mac.shen@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEYPR03MB6531:EE_
x-ms-office365-filtering-correlation-id: 620ff295-fba8-419a-6f9c-08dcba9ff06e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?aWZad2FCek9RWVdQNlo4aWNpL2pUZVZWbSsrRzNEOFptVjc4b041VlFYUm04?=
 =?utf-8?B?L2hFYVFoZ0hNaGJiNURtdmpneVhXem5RUkJ0N0NnRzY0L015UFh6Vk54M0xV?=
 =?utf-8?B?NWRERXVTRDZ5RFBEK3dhUmhKaHJyV2JmZXhKQXlieVlLYWxMQTU3azhjd0lH?=
 =?utf-8?B?UWlJbnJDamFPNXpidlJCQXhDeFVBRlVLV1FjR1FCYVVWZmtXY3FlVTRkdHpa?=
 =?utf-8?B?RFhMNHRaaWNueTYvY1lhM21KdER4b3g2T2NpekxMQ2FDcnpVWlI4SGZmemJh?=
 =?utf-8?B?dDR4N1NkZFNiM1JOQklmYlgvQS9zUWhhSmhyK1h2MnZxaFoyanZCYUZvem1J?=
 =?utf-8?B?TXFKLzJVNm9sMkZoUExXb2ZjMXJRRHhlZU4xRHRYaXpoanVjaVJ2cmdyY25L?=
 =?utf-8?B?WGh5Y2RQTlExZEVaYVlMcXJFSmttVkZBSnVMNHFzQm9tekpwR2E5VERVTW5Q?=
 =?utf-8?B?S1V5RURmaUpFc0EwSkg4YmZIR3hxVEJWVG03UlRiQWJvc1FvSlJCNnJRVkh2?=
 =?utf-8?B?RmNuQ28yT1RXdU1PS0NsZXNtdXRvMmdVU0dkNFh3NTV3UmZnMTlKOFYvZkh4?=
 =?utf-8?B?Z0xVMUJZTW1zSndueFQyMUVINWRRR1YyZkJnd3R0eDJnMzFud1VUbmV5bUNV?=
 =?utf-8?B?OGFzQVprVHBoNUhoOXR5Z2Ryc1NDVHlBSjljbURDZVljOGxoUzI2VFJRZGVa?=
 =?utf-8?B?WmlUN2pSNFAxOE1Zdmt3R1JIN1dyYXl4MHBLQkxEL3o5V1VnMGg5UzE2c21S?=
 =?utf-8?B?Rjg2RnRiMWxZc2sxS1JvbVlNaWVOdjBRcUthZmdGVitLd3VYOWgyMXhTZlV2?=
 =?utf-8?B?SUFCMWhTRjZIR3BIazhkVGRlRjZKNEt0eVpWVVp4TjN2WVFjdTY2OTV1a2t3?=
 =?utf-8?B?RExqUDByOXBBNTFlbEEyVHNEOStOb09qQjFmK0JVWHdEZWZXZ25DZG8xd1Zl?=
 =?utf-8?B?MHRPQXREWWNidy92ZzBXcHQ2dDZDZk1JR3NicTNKUGYveHVLenp3YVQ3cFZ5?=
 =?utf-8?B?R0cwZnMwS0MvV2lzazJJalVOSllIYVJBUUM3MitYdDd3KzZqWmNmQWlpRU5o?=
 =?utf-8?B?VEFzM29BbFFFb2M4R2FBSisvYVRSUWcwZVM4Zjd4a0ZMQ1F6RjlXNXBVK3Rv?=
 =?utf-8?B?WkREdGVzZjJXalBDUVA1ay9Ya1BFaXVGMnR3b0RZQ3NWenRCSCs0WkcwOGcr?=
 =?utf-8?B?Nm95eE1OVWNNVjNrWThPZ3Ftd0oxT203WGE3RVdLOW04RlZJU25SMlVac3h1?=
 =?utf-8?B?anBVdGpMYU1ZeVZlc255RDNNTVVLZTJlajV5VXlQNXhBSjhQamNNNisxYjdX?=
 =?utf-8?B?UWo1ZG9KRFJMcU54dWlKRkIzeDY3OXN4RmtDV2xCS1JHakNEWnhPWll6WkZR?=
 =?utf-8?B?UUFFL2t0a0pDSEo2Slg5OWhsR3I1RlFMWDlvSmltUGlKVUdXUzZnRnNEd042?=
 =?utf-8?B?dEJsa1pJQk9XQVNOTFdOZVovRnh0YU9jbGpOM2w4RnRnVjE4b3N6T3hhQ0ZB?=
 =?utf-8?B?TjlpKzN5dlZIMGVKek01ZndlbWJkVDFIaC9YTkxtNDNlKzNtQUNWT25zRkFQ?=
 =?utf-8?B?N2xraGhzSkVNdXBCdUlkenR6anVKZDJQY2JvblVycDArMGJDQVlaNFBmUWZk?=
 =?utf-8?B?QnNvREJyUEcvSlNSczNNc3RYYVdUVi9MRzlqN2w5RHMxNHR3dkNHOHEwMkFC?=
 =?utf-8?B?MS9rQUZwdEo3Qkg0UFRuaE1qcVRrczVWaVIwSDhrUkNRaVRBVnZUclE5c0Jx?=
 =?utf-8?Q?GslAbvH92//tXxxYpo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eTlKenpMWTdKV2xFRnJzdXZGTy8wTXBpcVZBdmRIOEdxNzU0Yk9vRlVuK1VD?=
 =?utf-8?B?REZWakI4M3BUcDI3blBPNndUUWRoZ0lNVy9hbkVKMXpnMC9yck5UbjVsWVdF?=
 =?utf-8?B?enJTSy9CRzM1a0NVYXVoalNHSGFUV2RIOGM1ZklEdS9NL29obkpiOVV6bDR0?=
 =?utf-8?B?M0hibEtvRzV3K2tzSXUrWnR5d3JWMUNxNkVyWjg4VXVIN0JibDNVTkZxbG5J?=
 =?utf-8?B?aDNXam1lMGxESkxRZWM0cGNlYjFmY2JKZ0VkckJ0dHJ0bmIvcm5oSlpLeFRV?=
 =?utf-8?B?WEtsdDhLbnNxQ0grcVpGNWVKeElKODdKOC9DNGVObWJ5WGp4cnRrSUlheERl?=
 =?utf-8?B?dHpYUVg0OGxwdUxnY1IrQTY2SlpIVEU3MHZ6SkJ1SCtBQkF3RVRDa3lsQ0Zj?=
 =?utf-8?B?OUE3WmFtdmJ4ZXcybENiclpZemMxL3ZJa1pXbjJud045YitMRnpqUmRQRlFW?=
 =?utf-8?B?RTBsdVdoQ2NIYXlNR3NLcnIwM1k5OVdYNGZ2QW5pbXZUMXg4a2RLV1lLT0Vs?=
 =?utf-8?B?WS81Y1c1UVBxN1BPcU9aZno1VUFqUkdma3R3eXQ0eE1kSWdlTHFobzVPNDNU?=
 =?utf-8?B?L3ZmRUtaV0VDUnFsQ1JVbjZZU1Q0ckhSK09LZUxyMmFiN3dwSFVnUTB5eWZj?=
 =?utf-8?B?a21mMW5KODRyaEl3Yi93Y3lieGxBTGZVQm5wcDRxeG1ySGhoai9BYXp6czlZ?=
 =?utf-8?B?SXVpd25zUmFBb2plcElLRTZCZlZiYTdia2dBRnRxeWhaR0xzMFNzakYraVNO?=
 =?utf-8?B?S2p4NGVpMVd0L3pBaXZuZFNUQ1ZDSW1iblJ6eVRnSVVQS2RzYjVjRzB5Wnpk?=
 =?utf-8?B?c2hESDF5N1B2OHQrdzVUb3g5c3RLU3JtZ0RxRFlSR1B6bVA1N3NXOE5mN0VL?=
 =?utf-8?B?Qzh0RTZVOE1KcEJjKzVacSs0MVN1YzRWeldTOWYwbUY1WEpOeWZjVWx5eVNL?=
 =?utf-8?B?L1VZTlNJYjdla2p2NUhXRzFsOElTekwyYmoyUVJEYmw0L2NSdWExVDM3c09q?=
 =?utf-8?B?U0ZLYUhwZU8raGNvT3ErRHRFemNBU05rWit3U2dvQmtIQTNNdHZGMUJVUGw3?=
 =?utf-8?B?Yy9hekljM05nTmxEMGJlN3dobndINWc0em1qbTZDOTVWa1JqNlhDc2pUYXY0?=
 =?utf-8?B?RXhDMEF4elgvbjJmZjFmaXpqcHVRMzVkSXJ5WFAwOGpkZXMzczlVT3JKNHFh?=
 =?utf-8?B?TlMvQ2FUeWlHbkZ3aHQ1VXVSYU1McXNBS0NWVnpVbGFiMDMzQlRkdjdrUVhL?=
 =?utf-8?B?d25lbmowcW45R1J0MFVqaWVPLzFFZVN6UmFTRmcxSFNYamZPWUlKVWZEN0Z6?=
 =?utf-8?B?RmE2RjNkaTlHdGl3Vk1nbVZOd21TWWhOK0hzTndTcEZ5c3luZlFDMzEvY3Bq?=
 =?utf-8?B?R0dyOEJpakZTSVJoYnZmVkh1RkFlY2srakNDVXQzNkJwTVE2Z3d3VW5lSWxi?=
 =?utf-8?B?Nk5KNGRqT0d5OURwVys3N2loTGlEdFdzN29vRitrTFNTZXo4NGwvTFpoWnor?=
 =?utf-8?B?NjN3bml1K2N4bTRqZlFpOWxWSlUwTi92dmlURmlYRjZjTnRuMDZENDZKOEIy?=
 =?utf-8?B?S2YxQ2dSYmJmTkpBdEVUNHVYVEFTTWFDMGlybXpJcFYyR0x2a3BQTlFrb1Jo?=
 =?utf-8?B?ODJKMU5EeG5lSnc2OE9KdkIraGJNMEFkc0djOE11N2tkVUtrblhnSjcwRGUw?=
 =?utf-8?B?T3NkUkg4eS91eFVCRVp3NVlBMjRhckN4bk9US0p4NWV1WVF2bFNpRWdJenhP?=
 =?utf-8?B?REFTU2FRTjJOVVBFVFVpUVhBb0ZrazRnakpLdXVGUG1vR3BVb3B1TjJ4cEl6?=
 =?utf-8?B?R3J2a1lGemJFSkxIZ2NpSnVDRTVQREJ5WU1HbUt3YkVSQ2MyK0tveUUrdGE2?=
 =?utf-8?B?T1ZTSTRrQjNDU3hFL0lObzI5VkNad2pZTjllRkd6R1dGZUhiMkcvNTI2ZERs?=
 =?utf-8?B?SWw5YXNEVVVwcWRhRnAyWTNteGt5bm9pTnZNUk1MRFVNVTExQjA1dGlQZGZF?=
 =?utf-8?B?VVZWNFVzWU16ZHc0WHd6QkhQQ0RtRC9sblRNRHVGZ2xSTXpHTS8wM0pQUUlD?=
 =?utf-8?B?VitXYktBbThTV1FxQzk2MUZnNTFJZVEyKzBJVTNJZW1meWxBenhQcmMxVFBB?=
 =?utf-8?Q?jNHY4P9qL9pinDj3ioour52zi?=
Content-ID: <317E7707ABE578488525DCB771E1560A@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 620ff295-fba8-419a-6f9c-08dcba9ff06e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2024 07:25:27.5961 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QBhZ7RHD7hkGUnAfa6KWIxadxhA3u+8pYcSWbp/9g/T4ijyQDy5olDCTA5kuhDktcuCl2qOz7GxhQCKEluM/ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6531
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_002_193997788.1932516409"
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

--__=_Part_Boundary_002_193997788.1932516409
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIE1hYzoNCg0KT24gU2F0LCAyMDI0LTA2LTA4IGF0IDIwOjAxICswODAwLCBtYWMuc2hlbiB3
cm90ZToNCj4gQ2hhbmdlcyBpbiB2MzoNCj4gLSByZWZpbmUgdGhlIGZ1bmN0aW9uIHRvIGdldCBz
eXN0ZW0gdGltZQ0KPiAtIHJlZmluZSB0aGUgZmxvdyB0byBkbyBIRENQIHdpdGggY29udGVudCB0
eXBlIGFuZA0KPiAgIHByb3RlY3Rpb24gdmFsdWUgd2hpY2ggc2V0IGJ5IHVzZXIgc3BhY2UNCj4g
LSByZWZpbmUgdGhlIGZsb3cgdG8gdXBkYXRlIGNvbnRlbnQgcHJvdGVjdGlvbg0KPiAtIHJlZmlu
ZSB0aGUgZmxvdyB0byBkbyBIRENQMi54IGF1dGhlbnRpY2F0aW9uDQo+IHBlciBzdWdnZXN0aW9u
IGZyb20gdGhlIHByZXZpb3VzIHRocmVhZDoNCj4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9f
X2h0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRla19fOyEh
Q1RSTktBOXdNZzBBUmJ3IW1kNnhVaVlOODhEMlltRVRzOEZRZ2FFeE0yekg4UzFTbUFFVTlHUmNo
d3BOc1hPeURGdWwzemlWS2hScENKYWo4UmNuLWd2TS04MDFydW5qd0EkIA0KPiAvcGF0Y2gvMjAy
NDAyMDUwNTUwNTUuMjUzNDAtMy1tYWMuc2hlbkBtZWRpYXRlay5jb20vDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBtYWMuc2hlbiA8bWFjLnNoZW5AbWVkaWF0ZWsuY29tPg0KPiAtLS0NCg0KW3NuaXBd
DQoNCj4gQEAgLTIyNDIsNiArMjM3Myw3IEBAIHN0YXRpYyB2b2lkIG10a19kcF9icmlkZ2VfYXRv
bWljX2VuYWJsZShzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLA0KPiAgCQkJCQlzdHJ1Y3QgZHJt
X2JyaWRnZV9zdGF0ZSAqb2xkX3N0YXRlKQ0KPiAgew0KPiAgCXN0cnVjdCBtdGtfZHAgKm10a19k
cCA9IG10a19kcF9mcm9tX2JyaWRnZShicmlkZ2UpOw0KPiArCXN0cnVjdCBkcm1fY29ubmVjdG9y
X3N0YXRlICpjb25uZWN0b3Jfc3RhdGU7DQo+ICAJaW50IHJldDsNCj4gIA0KPiAgCW10a19kcC0+
Y29ubiA9IGRybV9hdG9taWNfZ2V0X25ld19jb25uZWN0b3JfZm9yX2VuY29kZXIob2xkX3N0YXRl
LT5iYXNlLnN0YXRlLA0KPiBAQCAtMjI1Miw2ICsyMzg0LDggQEAgc3RhdGljIHZvaWQgbXRrX2Rw
X2JyaWRnZV9hdG9taWNfZW5hYmxlKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UsDQo+ICAJCXJl
dHVybjsNCj4gIAl9DQo+ICANCj4gKwljb25uZWN0b3Jfc3RhdGUgPSBkcm1fYXRvbWljX2dldF9j
b25uZWN0b3Jfc3RhdGUob2xkX3N0YXRlLT5iYXNlLnN0YXRlLCBtdGtfZHAtPmNvbm4pOw0KPiAr
DQo+ICAJbXRrX2RwX2F1eF9wYW5lbF9wb3dlcm9uKG10a19kcCwgdHJ1ZSk7DQo+ICANCj4gIAkv
KiBUcmFpbmluZyAqLw0KPiBAQCAtMjI4MSw2ICsyNDE1LDE0IEBAIHN0YXRpYyB2b2lkIG10a19k
cF9icmlkZ2VfYXRvbWljX2VuYWJsZShzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLA0KPiAgCW10
a19kcC0+ZW5hYmxlZCA9IHRydWU7DQo+ICAJbXRrX2RwX3VwZGF0ZV9wbHVnZ2VkX3N0YXR1cyht
dGtfZHApOw0KPiAgDQo+ICsJLyogRW5hYmxlIGhkY3AgaWYgaXQncyBkZXNpcmVkICovDQo+ICsJ
ZGV2X2RiZyhtdGtfZHAtPmRldiwgImhkY3BfY29udGVudF90eXBlOiVkLCBjb250ZW50IHByb3Rl
Y3Rpb246ICVkIiwNCj4gKwkJY29ubmVjdG9yX3N0YXRlLT5oZGNwX2NvbnRlbnRfdHlwZSwgY29u
bmVjdG9yX3N0YXRlLT5jb250ZW50X3Byb3RlY3Rpb24pOw0KPiArCWlmIChjb25uZWN0b3Jfc3Rh
dGUtPmNvbnRlbnRfcHJvdGVjdGlvbiA9PSBEUk1fTU9ERV9DT05URU5UX1BST1RFQ1RJT05fREVT
SVJFRCkgew0KPiArCQltdGtfZHAtPmhkY3BfaW5mby5oZGNwX2NvbnRlbnRfdHlwZSA9IGNvbm5l
Y3Rvcl9zdGF0ZS0+aGRjcF9jb250ZW50X3R5cGU7DQo+ICsJCW10a19kcF9oZGNwX2VuYWJsZSht
dGtfZHApOw0KPiArCX0NCj4gKw0KPiAgCXJldHVybjsNCj4gIHBvd2VyX29mZl9hdXg6DQo+ICAJ
bXRrX2RwX3VwZGF0ZV9iaXRzKG10a19kcCwgTVRLX0RQX1RPUF9QV1JfU1RBVEUsDQo+IEBAIC0y
NDI3LDYgKzI1NjksOCBAQCBzdGF0aWMgaW50IG10a19kcF9icmlkZ2VfYXRvbWljX2NoZWNrKHN0
cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UsDQo+ICANCj4gIAlkcm1fZGlzcGxheV9tb2RlX3RvX3Zp
ZGVvbW9kZSgmY3J0Y19zdGF0ZS0+YWRqdXN0ZWRfbW9kZSwgJm10a19kcC0+aW5mby52bSk7DQo+
ICANCj4gKwltdGtfZHBfaGRjcF9hdG9taWNfY2hlY2sobXRrX2RwLCBjb25uX3N0YXRlKTsNCj4g
Kw0KPiAgCXJldHVybiAwOw0KPiAgfQ0KDQpJbiBtdGtfZHBfYnJpZGdlX2F0b21pY19lbmFibGUo
KSwgeW91IGVuYWJsZSBoZGNwLg0KU28gaW4gbXRrX2RwX2JyaWRnZV9hdG9taWNfZGlzYWJsZSgp
LCB5b3Ugc2hvdWxkIGRpc2FibGUgaGRjcC4NCg0KUmVnYXJkcywNCkNLDQoNCj4gIA0K

--__=_Part_Boundary_002_193997788.1932516409
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtNYWM6DQoNCk9uJiMzMjtTYXQsJiMzMjsy
MDI0LTA2LTA4JiMzMjthdCYjMzI7MjA6MDEmIzMyOyswODAwLCYjMzI7bWFjLnNoZW4mIzMyO3dy
b3RlOg0KJmd0OyYjMzI7Q2hhbmdlcyYjMzI7aW4mIzMyO3YzOg0KJmd0OyYjMzI7LSYjMzI7cmVm
aW5lJiMzMjt0aGUmIzMyO2Z1bmN0aW9uJiMzMjt0byYjMzI7Z2V0JiMzMjtzeXN0ZW0mIzMyO3Rp
bWUNCiZndDsmIzMyOy0mIzMyO3JlZmluZSYjMzI7dGhlJiMzMjtmbG93JiMzMjt0byYjMzI7ZG8m
IzMyO0hEQ1AmIzMyO3dpdGgmIzMyO2NvbnRlbnQmIzMyO3R5cGUmIzMyO2FuZA0KJmd0OyYjMzI7
JiMzMjsmIzMyO3Byb3RlY3Rpb24mIzMyO3ZhbHVlJiMzMjt3aGljaCYjMzI7c2V0JiMzMjtieSYj
MzI7dXNlciYjMzI7c3BhY2UNCiZndDsmIzMyOy0mIzMyO3JlZmluZSYjMzI7dGhlJiMzMjtmbG93
JiMzMjt0byYjMzI7dXBkYXRlJiMzMjtjb250ZW50JiMzMjtwcm90ZWN0aW9uDQomZ3Q7JiMzMjst
JiMzMjtyZWZpbmUmIzMyO3RoZSYjMzI7ZmxvdyYjMzI7dG8mIzMyO2RvJiMzMjtIRENQMi54JiMz
MjthdXRoZW50aWNhdGlvbg0KJmd0OyYjMzI7cGVyJiMzMjtzdWdnZXN0aW9uJiMzMjtmcm9tJiMz
Mjt0aGUmIzMyO3ByZXZpb3VzJiMzMjt0aHJlYWQ6DQomZ3Q7JiMzMjtodHRwczovL3VybGRlZmVu
c2UuY29tL3YzL19faHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1l
ZGlhdGVrX187ISFDVFJOS0E5d01nMEFSYnchbWQ2eFVpWU44OEQyWW1FVHM4RlFnYUV4TTJ6SDhT
MVNtQUVVOUdSY2h3cE5zWE95REZ1bDN6aVZLaFJwQ0phajhSY24tZ3ZNLTgwMXJ1bmp3QSYjMzY7
JiMzMjsNCiZndDsmIzMyOy9wYXRjaC8yMDI0MDIwNTA1NTA1NS4yNTM0MC0zLW1hYy5zaGVuQG1l
ZGlhdGVrLmNvbS8NCiZndDsmIzMyOw0KJmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMyO21hYy5z
aGVuJiMzMjsmbHQ7bWFjLnNoZW5AbWVkaWF0ZWsuY29tJmd0Ow0KJmd0OyYjMzI7LS0tDQoNCltz
bmlwXQ0KDQomZ3Q7JiMzMjtAQCYjMzI7LTIyNDIsNiYjMzI7KzIzNzMsNyYjMzI7QEAmIzMyO3N0
YXRpYyYjMzI7dm9pZCYjMzI7bXRrX2RwX2JyaWRnZV9hdG9taWNfZW5hYmxlKHN0cnVjdCYjMzI7
ZHJtX2JyaWRnZSYjMzI7KmJyaWRnZSwNCiZndDsmIzMyOyYjMzI7c3RydWN0JiMzMjtkcm1fYnJp
ZGdlX3N0YXRlJiMzMjsqb2xkX3N0YXRlKQ0KJmd0OyYjMzI7JiMzMjt7DQomZ3Q7JiMzMjsmIzMy
O3N0cnVjdCYjMzI7bXRrX2RwJiMzMjsqbXRrX2RwJiMzMjs9JiMzMjttdGtfZHBfZnJvbV9icmlk
Z2UoYnJpZGdlKTsNCiZndDsmIzMyOytzdHJ1Y3QmIzMyO2RybV9jb25uZWN0b3Jfc3RhdGUmIzMy
Oypjb25uZWN0b3Jfc3RhdGU7DQomZ3Q7JiMzMjsmIzMyO2ludCYjMzI7cmV0Ow0KJmd0OyYjMzI7
JiMzMjsNCiZndDsmIzMyOyYjMzI7bXRrX2RwLSZndDtjb25uJiMzMjs9JiMzMjtkcm1fYXRvbWlj
X2dldF9uZXdfY29ubmVjdG9yX2Zvcl9lbmNvZGVyKG9sZF9zdGF0ZS0mZ3Q7YmFzZS5zdGF0ZSwN
CiZndDsmIzMyO0BAJiMzMjstMjI1Miw2JiMzMjsrMjM4NCw4JiMzMjtAQCYjMzI7c3RhdGljJiMz
Mjt2b2lkJiMzMjttdGtfZHBfYnJpZGdlX2F0b21pY19lbmFibGUoc3RydWN0JiMzMjtkcm1fYnJp
ZGdlJiMzMjsqYnJpZGdlLA0KJmd0OyYjMzI7JiMzMjtyZXR1cm47DQomZ3Q7JiMzMjsmIzMyO30N
CiZndDsmIzMyOyYjMzI7DQomZ3Q7JiMzMjsrY29ubmVjdG9yX3N0YXRlJiMzMjs9JiMzMjtkcm1f
YXRvbWljX2dldF9jb25uZWN0b3Jfc3RhdGUob2xkX3N0YXRlLSZndDtiYXNlLnN0YXRlLCYjMzI7
bXRrX2RwLSZndDtjb25uKTsNCiZndDsmIzMyOysNCiZndDsmIzMyOyYjMzI7bXRrX2RwX2F1eF9w
YW5lbF9wb3dlcm9uKG10a19kcCwmIzMyO3RydWUpOw0KJmd0OyYjMzI7JiMzMjsNCiZndDsmIzMy
OyYjMzI7LyomIzMyO1RyYWluaW5nJiMzMjsqLw0KJmd0OyYjMzI7QEAmIzMyOy0yMjgxLDYmIzMy
OysyNDE1LDE0JiMzMjtAQCYjMzI7c3RhdGljJiMzMjt2b2lkJiMzMjttdGtfZHBfYnJpZGdlX2F0
b21pY19lbmFibGUoc3RydWN0JiMzMjtkcm1fYnJpZGdlJiMzMjsqYnJpZGdlLA0KJmd0OyYjMzI7
JiMzMjttdGtfZHAtJmd0O2VuYWJsZWQmIzMyOz0mIzMyO3RydWU7DQomZ3Q7JiMzMjsmIzMyO210
a19kcF91cGRhdGVfcGx1Z2dlZF9zdGF0dXMobXRrX2RwKTsNCiZndDsmIzMyOyYjMzI7DQomZ3Q7
JiMzMjsrLyomIzMyO0VuYWJsZSYjMzI7aGRjcCYjMzI7aWYmIzMyO2l0JiMzOTtzJiMzMjtkZXNp
cmVkJiMzMjsqLw0KJmd0OyYjMzI7K2Rldl9kYmcobXRrX2RwLSZndDtkZXYsJiMzMjsmcXVvdDto
ZGNwX2NvbnRlbnRfdHlwZTolZCwmIzMyO2NvbnRlbnQmIzMyO3Byb3RlY3Rpb246JiMzMjslZCZx
dW90OywNCiZndDsmIzMyOytjb25uZWN0b3Jfc3RhdGUtJmd0O2hkY3BfY29udGVudF90eXBlLCYj
MzI7Y29ubmVjdG9yX3N0YXRlLSZndDtjb250ZW50X3Byb3RlY3Rpb24pOw0KJmd0OyYjMzI7K2lm
JiMzMjsoY29ubmVjdG9yX3N0YXRlLSZndDtjb250ZW50X3Byb3RlY3Rpb24mIzMyOz09JiMzMjtE
Uk1fTU9ERV9DT05URU5UX1BST1RFQ1RJT05fREVTSVJFRCkmIzMyO3sNCiZndDsmIzMyOyttdGtf
ZHAtJmd0O2hkY3BfaW5mby5oZGNwX2NvbnRlbnRfdHlwZSYjMzI7PSYjMzI7Y29ubmVjdG9yX3N0
YXRlLSZndDtoZGNwX2NvbnRlbnRfdHlwZTsNCiZndDsmIzMyOyttdGtfZHBfaGRjcF9lbmFibGUo
bXRrX2RwKTsNCiZndDsmIzMyOyt9DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsmIzMyO3JldHVybjsN
CiZndDsmIzMyOyYjMzI7cG93ZXJfb2ZmX2F1eDoNCiZndDsmIzMyOyYjMzI7bXRrX2RwX3VwZGF0
ZV9iaXRzKG10a19kcCwmIzMyO01US19EUF9UT1BfUFdSX1NUQVRFLA0KJmd0OyYjMzI7QEAmIzMy
Oy0yNDI3LDYmIzMyOysyNTY5LDgmIzMyO0BAJiMzMjtzdGF0aWMmIzMyO2ludCYjMzI7bXRrX2Rw
X2JyaWRnZV9hdG9taWNfY2hlY2soc3RydWN0JiMzMjtkcm1fYnJpZGdlJiMzMjsqYnJpZGdlLA0K
Jmd0OyYjMzI7JiMzMjsNCiZndDsmIzMyOyYjMzI7ZHJtX2Rpc3BsYXlfbW9kZV90b192aWRlb21v
ZGUoJmFtcDtjcnRjX3N0YXRlLSZndDthZGp1c3RlZF9tb2RlLCYjMzI7JmFtcDttdGtfZHAtJmd0
O2luZm8udm0pOw0KJmd0OyYjMzI7JiMzMjsNCiZndDsmIzMyOyttdGtfZHBfaGRjcF9hdG9taWNf
Y2hlY2sobXRrX2RwLCYjMzI7Y29ubl9zdGF0ZSk7DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsmIzMy
O3JldHVybiYjMzI7MDsNCiZndDsmIzMyOyYjMzI7fQ0KDQpJbiYjMzI7bXRrX2RwX2JyaWRnZV9h
dG9taWNfZW5hYmxlKCksJiMzMjt5b3UmIzMyO2VuYWJsZSYjMzI7aGRjcC4NClNvJiMzMjtpbiYj
MzI7bXRrX2RwX2JyaWRnZV9hdG9taWNfZGlzYWJsZSgpLCYjMzI7eW91JiMzMjtzaG91bGQmIzMy
O2Rpc2FibGUmIzMyO2hkY3AuDQoNClJlZ2FyZHMsDQpDSw0KDQomZ3Q7JiMzMjsmIzMyOw0KDQo8
L3ByZT4NCjwvcD48L2JvZHk+PC9odG1sPjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxwcmU+Kioq
KioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlICoqKioqKioqKioqKioq
KioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2Ug
KGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJp
ZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1
bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29udmV5ZWQgb25s
eSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24s
IA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBl
LW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGll
bnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwuIElmIHlv
dSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2
ZSANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBu
b3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFp
bCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5n
IGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2Ug
dGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91
IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_002_193997788.1932516409--

