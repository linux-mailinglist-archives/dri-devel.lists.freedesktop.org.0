Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE956965C44
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 11:03:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEBF510E9A3;
	Fri, 30 Aug 2024 09:03:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="h1Hn3CpM";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="T8UwMgTe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1943F10E9A3
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 09:03:23 +0000 (UTC)
X-UUID: b204c15e66ae11ef8b96093e013ec31c-20240830
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=OwYwlqdYJtzU4kgjRFhcPPgjO/pPlCetow5s3SUZfiA=; 
 b=h1Hn3CpMDzdauYl9iZbC9zDR7pWhwhZbLMnTkLrG8bzcuYHKa6vIdOZa3pDUgRywxCbFaKnsfQb/enIWaVY6Kw1pDjGJdvsx/CuE+6uAJ0qXsy1hKRpia2Z7pc7p9XO16m0XigIEjjfMq/hkpL66szT1+Olx7uvKViK7c55FT8k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41, REQID:9a3a2c09-ca62-4a1d-b27e-415831ebaf48, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6dc6a47, CLOUDID:fc9c6dcf-7921-4900-88a1-3aef019a55ce,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
 l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: b204c15e66ae11ef8b96093e013ec31c-20240830
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 296760649; Fri, 30 Aug 2024 17:03:16 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 30 Aug 2024 02:03:17 -0700
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 30 Aug 2024 17:03:17 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=urf3ZBfQZZxYbYe1IXHsLHXNRGwWer9WO8sbTnknYuCP9ozbhJKHPFj0qd4ouwGNsVIH69WjAwt6Xb2tsQS8sfRjkjedo1jm0zob8TC8tAQyTsmfruUPUVS10SkzkO+I26wdVhYqLmX0BeoIW542fNpelYV0KZkXbxi3NqCGIXyV0RHEF/LaC2AybfTRGaAC6ZyJ1oyMNhEhUSZccPO5jzJDBe833hCMMFDot/UEJFtVXJ9WNLict2NWzMi42dDUIv9ZsCYFwk/4CTbLFDgwJC1ni//y+X+Lt6TsRbb4wSPqP49WgWfATMHPmzP9tx6mUwwDq2h6I4dyMS0D/QhlMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mV0CCaMIjyvTG8nrKmJ5hPG5QzT3flzKabGYI7i4pww=;
 b=U1lpo6artioyHdd2XZeqEVg4Dd02bMJaIlXl8whkFtu964C1Ceq5F3QbX8nU3ZowBXFYImuUPsVx3n4ROx/jYMfVtwjowAIJKr9Jnp+aU0Pb2tCzL8M9JuVp5HSD7dGfUuDy1zdB+GnJf3ohj6Pf8YR7xD2jm3aYELiGshdrCcgGkqT3ikbrcYP/fUyOKtM/ViBhR1dpXu4P+02HENuA4DKqYi//IpkSjJG77Wi3eUK2YXKK/AnxYxP+bnRydHTw4da5/DQTrlWpl4UPcs4PgvKkqub3osPQohFITEjRot2ExInPeIxtf7zdLMdSOKowz2/Xi8j2L1rX/yinLtfqnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mV0CCaMIjyvTG8nrKmJ5hPG5QzT3flzKabGYI7i4pww=;
 b=T8UwMgTet5Ru8CHK1yMZDH4xGBrhiK86qSQTBeLjQsFViAbShokl1cO7cV2LaIc8lEhwY6jGGEjnduSmfEMXogYS8lctJQM92NRFaRBFXkFJXotvUepb8ojavaytvXXGFdEdBEAqZ+1NkxQUcZWywSzuBDljsKMQVUGup03Q5wQ=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB8381.apcprd03.prod.outlook.com (2603:1096:101:222::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Fri, 30 Aug
 2024 09:03:15 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.7918.019; Fri, 30 Aug 2024
 09:03:15 +0000
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
Subject: Re: [PATCH v3 3/3] Subject: [PATCH] drm/mediatek/dp: Add HDCP1.x
 feature for DisplayPort
Thread-Topic: [PATCH v3 3/3] Subject: [PATCH] drm/mediatek/dp: Add HDCP1.x
 feature for DisplayPort
Thread-Index: AQHauZvRErk8l0amMEOChLNTPEmqU7JAA6wA
Date: Fri, 30 Aug 2024 09:03:15 +0000
Message-ID: <e03d36b4d8e6ddfe55f58987cb9ebb97db9c1957.camel@mediatek.com>
References: <20240608120219.21817-1-mac.shen@mediatek.com>
 <20240608120219.21817-4-mac.shen@mediatek.com>
In-Reply-To: <20240608120219.21817-4-mac.shen@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB8381:EE_
x-ms-office365-filtering-correlation-id: 04da4670-8f4b-4e81-4967-08dcc8d2951f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|1800799024|366016|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?NjBHSjRxMFNTMzd3K3JTVC9XMVExWXpudTg4Vk1peHp4MURYd2pCNVNTZDN6?=
 =?utf-8?B?eldTdXM3RGdhS1FOR0haZDB1RjNrVzNIbEdiVUtwbVhwa3M4R0J1UUcyak5r?=
 =?utf-8?B?YzVJUW9jQWZ0MEpMR3JuUEF4TEZ5MXE4VGRqRjBtTytRa3EyNUlSa0VoL1d5?=
 =?utf-8?B?eVliZEV1ZnJBK3NDYllBV1REM0lTU2RqYm8zK2plSjI2ZFpFbEpoVy94cEpP?=
 =?utf-8?B?bWxWa0tLKzNqeUVEYVpzMC9Xc0NjVjZYTzBDY0RCay83T0wwT2NrTGxSeTFz?=
 =?utf-8?B?dEl5Y0RTS3hQWHExVDVHdklXUFd2VmsxM1hnVXFzTThFR0xNbUNvSGdKWXlw?=
 =?utf-8?B?MlUxRzVwYlM5eGJ1SXkyMTBqSTFEdUxER05zM1ZBMTBsRm5DSFdkbGluQlFq?=
 =?utf-8?B?Zm9FbFF5MTF4NDl3MWQrcXh6UEN6U2VTS0REdHluTHRYM2M2RXBHSFpSdmtw?=
 =?utf-8?B?aC9md0Q3Um1ITENRNiszSnJneEY2YWJSRUZQTnBuL0dzbmpuVitKMHp5OHUr?=
 =?utf-8?B?UUhkL1I0dnZJWGg0M2lkMmhVQStkR1htVDE4SzQvSG9qdWdodC9vTThGUm5i?=
 =?utf-8?B?TFo1WWp4aXdoRHBxVFV3T1BacXdYWWF1Zmx4T2YwdDFkVk9nT0U1bHF5b1F3?=
 =?utf-8?B?UnJRYVkwcWUxQi9NdVlEMlRSNDRUSUwzcVNNY0hVMWFoS0ZXU2MzQWF4eHlT?=
 =?utf-8?B?WGZyYkt0bU1CZ1JucEk1dndmakN3OHVzRm9zMDVKVWIwUU54QWV5QWpSbXdO?=
 =?utf-8?B?YjFQRC9EdjU1MTBZSGlnR0pMcnBmMjhZTmpZd09BN3MvdnNzTGl2RVBCK3Ji?=
 =?utf-8?B?V2N0N0wzWGhPYUZYWFF1MGxGMTEwVWh1cVk5ZERRYnlPcUNnenF2TElPWjZR?=
 =?utf-8?B?Z2dKSk5haGhWbWs2dmZzR1FraUgrY0lESS9RaUZWK2UrYkc5RjFPeEUyNnBQ?=
 =?utf-8?B?OWNnejZOUnlqb2VJSVcrbUozN0VhOFRaQUtaeGZadkpsRWRkT0ZkNzBmdVZZ?=
 =?utf-8?B?cE82K2dERmZid3RFa212SFc5QUlVWTZGVi81R3REbjVXbDRQN1BVSzdlRE9R?=
 =?utf-8?B?Yk5vNWZuTmNvRnE2U3BlSVpONFNsUE9xdTJNQkh4U0RobUxXc0d6ZFN5NlMx?=
 =?utf-8?B?KzVlSGoySjI0eUUyTUpGWEM0emtwRGxzNGtVUmZvSVk2U0FaS0R5V1B3WUF5?=
 =?utf-8?B?cWtKYnlrQ1dTdmtJZzRwVHBycTNiN05aR2RDTnhkSjFWL2d0OTNIMVZiK0Jk?=
 =?utf-8?B?ODU2Nmw2OERTTThObnhReGFpbjNocHZub1h1OTVFdFoycE9URHlVU3JTSXNq?=
 =?utf-8?B?WGlCVXNQYWpLaW1sZ0RQczNhazVac1NicEdMdmdtc1dna2QwWVN5WjFBaXhj?=
 =?utf-8?B?bE03MkxBenA3MDlTY2ZodGdqQ2c0UUVtb1ErZnVmY1BJVWw2ZS95R1EwNU0w?=
 =?utf-8?B?M0xUalJGTjkzSTRUVjJDUUJnN2cwWW8vUnZhYWNRbTB5K0tYZEFER0dSSkx2?=
 =?utf-8?B?K1laZjc3dTJLZE92RHlNNTBHVkJvODJTREhVb0ttUHc0QXUvMkFjUmczMW92?=
 =?utf-8?B?VXZJK3N1TkhYWVV4NUQrRkRoZ2crM0xhRWlaNkkrK1NPeXFKejZ0V1ZZWStQ?=
 =?utf-8?B?Y1BuRUliYjlVdTN0NXI5NjhSU01PUVp3VWJ0Ukc1Uld5SXd3elE3QVlpS3hW?=
 =?utf-8?B?N0wzVFVJd3pxT3NWVkhWMkQrZDhjYURsUHN5SkxjbmRqNUlIU2FtWjM0WXlp?=
 =?utf-8?B?Z2tiRzY3Y1JPSHFlajNvc1NwcXdEbThkd0pieklBbGhyT3hpNDRaSy9TK3hN?=
 =?utf-8?B?TTdPL0c2S2ZQMHg2Wjh4Vk03T0VIYWFtdTR1QWttcTdPd3I4QXdreWl0RURJ?=
 =?utf-8?B?cWgyYXQvUHc2UXAxK3pad1NCYytQanRNdkFQeThtcFBmY0E9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NXcvcWRVNGNWaGpobHUyeVllc3ByOUl5bzVTVnE3Y0xCM2VBb0dZU0xTVWhh?=
 =?utf-8?B?OHVGS1ZaVXVDUFdnNFlJMkhSVWFDbmt4VThBWm1SclRkbU9sWkNkQ2w4Smpx?=
 =?utf-8?B?RUNmRE45YlA5QXB6MjBoU0dMSkpmSE1kcFRxTHRZckNtcGtaZWIwTXlsMXU1?=
 =?utf-8?B?bkRkYjJ0NDA5THJtc3luVHRHOHFQelBKRGo1SE9KTmQ0SXpXbCtrRmpvbDFU?=
 =?utf-8?B?L0IrRVdJQ1BMME4rUGFvYlFrVWQySkJmMWNmTi81U0NJTTRqc3FCTkkrK1JL?=
 =?utf-8?B?WmNjc1Nqdk1YTUdXOVVJaE1RZWcwRHRDYlBoRlBQWjZzMExjOURPN0kwYUY3?=
 =?utf-8?B?VWRIWFAwdTZDQkl3dDd6bHFOR1lIcUVjWC92RHdmU0hYaWUzYTh1RUlhS2Ex?=
 =?utf-8?B?U2tYbEhOdmZ4OEFtMFBUOWFBZFpkZUpzN2xCQmRFckFucHpDTmE5RldtME5l?=
 =?utf-8?B?OFByU3g5dFZPeEhkNzBRZ0tNN0VGQnpUZzJHYVZhUTNVdW9TcUlJSzExWDVs?=
 =?utf-8?B?azBUbEo1ZVgydW9JVVpibk1iUWwvVUZnU1BQUldhNkE1MjI1d0lBbUdPZE5R?=
 =?utf-8?B?NGFqMXFET0JsUnF3WnRBQlZpMDFIdm1ZdVVHQlZnUUgwKzFLNjdmaHhEOTgr?=
 =?utf-8?B?UUFjYU4xZ2JqYXptaTNySDNobnNKRW5vRDFqekdRbGlITXhQWTY4UXhhU3Rt?=
 =?utf-8?B?TnpVcS94dnh5cVllL1REVk80a085Y0F0S1lrbjJDZXQ4NXZuUHlMMHp6aXZC?=
 =?utf-8?B?MTJqTnNVUVh3eXdQVDlxSTNGeVJPQmJlcUNwU0tCU3B6UE1kTjV0TmVKYVNG?=
 =?utf-8?B?dkZyeXJEYzBhRDVwVWRudTF5QmJtTTk2bXlMS3k5VzRmTlRNNEJsRnNEcnov?=
 =?utf-8?B?aVhZYXM1QTd3T2ZzQS9TQ3VVNjRkTGlVL1NkaXNON0lqTVdWUzB4NEdoTk5U?=
 =?utf-8?B?QnUrNnJMamdFV2hZSk1McDZBNDlrS1pZczZpYTU1MGIvaUpyY1QvR2hJMWRZ?=
 =?utf-8?B?azc4T24veVcwd2FKcmtvTTdUZ2M1TGdwMnR1OU12NzNFNDVjMjdiZUR0S0pv?=
 =?utf-8?B?eUIyTFh1WVdYWUVJOFgzUVoyN3c3TUViZVVWM292OUlyK3ljK0VSd2RURi9o?=
 =?utf-8?B?akhrNW1wY3pTT29VWU81QmwveDY3TFBCOTFXd1NzTFJKMFNPcUtheWthTElr?=
 =?utf-8?B?d0tpaEs3U04ySHdaYk00NWQxK2w5UjJEby9vVDBiNE43UHlheWIrNkUwVVhs?=
 =?utf-8?B?Skx3V2ZjbTVtMlJoU0YxSzhLNDljOWdTMFRvakZuYnNRdzdmOWY5aFE4QUd5?=
 =?utf-8?B?dDA4K0dySmZIMnZVeks4aGFNaVo1NzVCZ09qNGRTK1hYdGUwUEdiN0FnbnQ5?=
 =?utf-8?B?akN5YkMzbG9CYmQ3QWcwVmJqV2tYTFYzUFFycnBwMk80YU0ycWFjZDlCcXZo?=
 =?utf-8?B?UTNJcXFnNWtxY01LVHlRTzJjaDk1a2NrZTgyUFVsaUNYblBPZFZrM0MrQzVk?=
 =?utf-8?B?UmVrdGtHemhGR2lKTU5PdWxNZGdxSFNoOXZ0a0F3U1l5eW4wVjUzVDVsZFZ2?=
 =?utf-8?B?ejVLSENtQ3I4cWRrWW94ZVE5NEVLTSt5RTYwdElOMnZNdGNlWDA1Tk1nZEJD?=
 =?utf-8?B?cGVGR2dWMVBhc2pZNFdXaWY1MWtzbWc5UzUwQjFYM3JrbXc5VzYyZDVQWUw3?=
 =?utf-8?B?MGdmMkZMUzNhWk5zSENSektjTGIvOCs4eGY4UUs2VzdqYjR0aENCSWhJQVNM?=
 =?utf-8?B?cE1NMS9ySEU1SjJDR1AyNGpudmt3SVR3ZGxuWVFxMGNhUEovSFkwaWdmQXd4?=
 =?utf-8?B?a2FWZVZKa3N6SzR5WUpkSi9EdmFxTlFvbUx6NDdsTWlyVkk3RkJkZk9pd1RZ?=
 =?utf-8?B?K2JYYVRoYnQ4QjFoWHFBbUVneXZsb1FLb1RpQ1Zoc0gyL3F1YjNKUG12ZG9X?=
 =?utf-8?B?R3k1ckdYY0VWYVRZSWU4OHJ4SGxlUmMzYmZET0ppekVzQ3BEeEZ4Mm5vUWdZ?=
 =?utf-8?B?cVFnU21WNzBjZm42Wm02M1R5UVFyc2kwbHA0cGdDWmJjVytqakJ2OG1pOXdn?=
 =?utf-8?B?VUhzVUMxMzBlWU5LQ1VsSFpFZndtM2IyQWVNbkZheTl2RlF2cFdRQ3RvOVVo?=
 =?utf-8?Q?D8b9YCZVJtEeHk+Q2NIRZo3wo?=
Content-ID: <E13B07EE3AD57B44A829B53BEC86D939@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04da4670-8f4b-4e81-4967-08dcc8d2951f
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2024 09:03:15.0150 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 115WOJv0jlUkBa6A3keTvVy5CmT2YBFcS7Yx2RskErpknT0v2TH8n38WqoDy8VLOrvwSWGLMYZD3j/9zrrvG/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8381
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_007_2068062188.1086169647"
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

--__=_Part_Boundary_007_2068062188.1086169647
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gU2F0LCAyMDI0LTA2LTA4IGF0IDIwOjAxICswODAwLCBtYWMuc2hlbiB3cm90ZToNCj4gQ2hh
bmdlcyBpbiB2MzoNCj4gLSByZW1vdmUgdXNlbGVzcyBjb2RlDQo+IC0gcmVtb3ZlIG1hZ2ljIG51
bWJlcg0KPiAtIHJlZmluZSB0aGUgZmxvdyB0byBkbyBIRENQMS54IGF1dGhlbnRpY2F0aW9uDQo+
IHBlciBzdWdnZXN0aW9uIGZyb20gdGhlIHByZXZpb3VzIHRocmVhZDoNCj4gaHR0cHM6Ly91cmxk
ZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51
eC1tZWRpYXRla19fOyEhQ1RSTktBOXdNZzBBUmJ3IWwzbVZlUHVLTjAzOHJkNVhvQ3VJT04welA0
MEJ0V0JiNzE0OGhIc1hzN2hDV0RUUmdFU0lrZk5IdUV0UFExUmI0UDlNT3BKWnN0Z0U0ajJMSmck
IA0KPiAvcGF0Y2gvMjAyNDAyMDUwNTUwNTUuMjUzNDAtNC1tYWMuc2hlbkBtZWRpYXRlay5jb20v
DQoNCk1vdmUgdGhlIHZlcnNpb24gY2hhbmdlIGluZm9ybWF0aW9uIGFmdGVyICctLS0nLg0KDQpJ
biBoZXJlLCBkZXNjcmliZSBIRENQMS54Lg0KRG9lcyBNZWRpYVRlayBEUCBoYXMgc29tZSBsaW1p
dGF0aW9uPyBJZiBzbywgZGVzY3JpYmUgaXQuDQoNCkkgd291bGQgbGlrZSB0byBIRENQMS54IHBh
dGNoIGluIGZyb250IG9mIEhEQ1AyLnggYmVjYXVzZSB0aGUgc3BlYyBkZXZlbG9wbWVudCBpcyBm
cm9tIDEueCB0byAyLnguDQpTbyBtb3ZlIHRoaXMgcGF0Y2ggYmVmb3JlIEhEQ1AyLnggcGF0Y2gu
DQoNClJlZ2FyZHMsDQpDSw0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBtYWMuc2hlbiA8bWFjLnNo
ZW5AbWVkaWF0ZWsuY29tPg0KPiAtLS0NCg0KDQoNCg==

--__=_Part_Boundary_007_2068062188.1086169647
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1NhdCwmIzMyOzIwMjQtMDYtMDgmIzMyO2F0
JiMzMjsyMDowMSYjMzI7KzA4MDAsJiMzMjttYWMuc2hlbiYjMzI7d3JvdGU6DQomZ3Q7JiMzMjtD
aGFuZ2VzJiMzMjtpbiYjMzI7djM6DQomZ3Q7JiMzMjstJiMzMjtyZW1vdmUmIzMyO3VzZWxlc3Mm
IzMyO2NvZGUNCiZndDsmIzMyOy0mIzMyO3JlbW92ZSYjMzI7bWFnaWMmIzMyO251bWJlcg0KJmd0
OyYjMzI7LSYjMzI7cmVmaW5lJiMzMjt0aGUmIzMyO2Zsb3cmIzMyO3RvJiMzMjtkbyYjMzI7SERD
UDEueCYjMzI7YXV0aGVudGljYXRpb24NCiZndDsmIzMyO3BlciYjMzI7c3VnZ2VzdGlvbiYjMzI7
ZnJvbSYjMzI7dGhlJiMzMjtwcmV2aW91cyYjMzI7dGhyZWFkOg0KJmd0OyYjMzI7aHR0cHM6Ly91
cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9s
aW51eC1tZWRpYXRla19fOyEhQ1RSTktBOXdNZzBBUmJ3IWwzbVZlUHVLTjAzOHJkNVhvQ3VJT04w
elA0MEJ0V0JiNzE0OGhIc1hzN2hDV0RUUmdFU0lrZk5IdUV0UFExUmI0UDlNT3BKWnN0Z0U0ajJM
SmcmIzM2OyYjMzI7DQomZ3Q7JiMzMjsvcGF0Y2gvMjAyNDAyMDUwNTUwNTUuMjUzNDAtNC1tYWMu
c2hlbkBtZWRpYXRlay5jb20vDQoNCk1vdmUmIzMyO3RoZSYjMzI7dmVyc2lvbiYjMzI7Y2hhbmdl
JiMzMjtpbmZvcm1hdGlvbiYjMzI7YWZ0ZXImIzMyOyYjMzk7LS0tJiMzOTsuDQoNCkluJiMzMjto
ZXJlLCYjMzI7ZGVzY3JpYmUmIzMyO0hEQ1AxLnguDQpEb2VzJiMzMjtNZWRpYVRlayYjMzI7RFAm
IzMyO2hhcyYjMzI7c29tZSYjMzI7bGltaXRhdGlvbiYjNjM7JiMzMjtJZiYjMzI7c28sJiMzMjtk
ZXNjcmliZSYjMzI7aXQuDQoNCkkmIzMyO3dvdWxkJiMzMjtsaWtlJiMzMjt0byYjMzI7SERDUDEu
eCYjMzI7cGF0Y2gmIzMyO2luJiMzMjtmcm9udCYjMzI7b2YmIzMyO0hEQ1AyLngmIzMyO2JlY2F1
c2UmIzMyO3RoZSYjMzI7c3BlYyYjMzI7ZGV2ZWxvcG1lbnQmIzMyO2lzJiMzMjtmcm9tJiMzMjsx
LngmIzMyO3RvJiMzMjsyLnguDQpTbyYjMzI7bW92ZSYjMzI7dGhpcyYjMzI7cGF0Y2gmIzMyO2Jl
Zm9yZSYjMzI7SERDUDIueCYjMzI7cGF0Y2guDQoNClJlZ2FyZHMsDQpDSw0KDQomZ3Q7JiMzMjsN
CiZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjttYWMuc2hlbiYjMzI7Jmx0O21hYy5zaGVuQG1l
ZGlhdGVrLmNvbSZndDsNCiZndDsmIzMyOy0tLQ0KDQoNCg0KDQo8L3ByZT4NCjwvcD48L2JvZHk+
PC9odG1sPjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxwcmU+KioqKioqKioqKioqKiBNRURJQVRF
SyBDb25maWRlbnRpYWxpdHkgTm90aWNlICoqKioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3Jt
YXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQph
dHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQs
IG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxh
d3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRl
ZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBw
cmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBp
dHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkg
cHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVu
ZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZSANCnRoYXQgeW91IGhhdmUg
cmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciAN
CmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5k
IGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykg
ZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhp
cyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_007_2068062188.1086169647--

