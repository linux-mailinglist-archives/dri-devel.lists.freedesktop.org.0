Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A31695C361
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 04:45:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95F8410EC01;
	Fri, 23 Aug 2024 02:44:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="K2R0v7L6";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="i1mHeJrw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A580510EC01
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 02:44:54 +0000 (UTC)
X-UUID: a9ee597260f911ef8b96093e013ec31c-20240823
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=6W6H5lPXiFsbrMTlBUhT4fjkcJ/4jwFYSvAmkM/RZ58=; 
 b=K2R0v7L6hiLqYS2G9kL0ysoPJgmU/Q/RvbT4Ne0q+JfRs5KnDxcahmrtmEbkCgfG4894K54IJ3+SKGGR+6ydXdZB0fuGp9ZtVaZED2uWJrA0bP1DAbQUukCmgilcwHCQ7/S5GbTAdgLyw46N1to1ztXRDI995aV3N++M0q/7r1s=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41, REQID:1819ee33-e00a-4926-a10d-adb6c7c189ed, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6dc6a47, CLOUDID:c8160bcf-7921-4900-88a1-3aef019a55ce,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
 l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: a9ee597260f911ef8b96093e013ec31c-20240823
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2091006559; Fri, 23 Aug 2024 10:44:48 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 22 Aug 2024 19:44:48 -0700
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Fri, 23 Aug 2024 10:44:48 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gDa0V91BHsI6GYmJNjAMAnGsI7NKZTYguxz6QuBYHu+/yhSaWhxn5VhAr3CUTzs4s0vv4xFdmhX6XQbR2QXLOSNV8AxVPj7Ibtnq5QTpdq59TEUtYJZtENKdN+Y0x93LACMQLc4DMsXQWq/OFw8WDQYFxIQse915gQI9sibFFwtnL6Gt6eyd6bGLyvUmgvv0RTEPlQ4NDqL4NWF4PFaEi2GK3XRDbVb6vjnh1TT/3o8250OLTJ8w4E9Z0+PnSS/VNO2u8cu6Yuntr5SBizB2XBvoWAIn2ldNF666BbQYtim0+E0YWPw9HFjuJtPaWYF2Dkgmem9mKADbdCiCDaHtdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cSZ5gKFzKpmkVyQ8I0j2VPnMKIpqpVu+agAnvqinzeo=;
 b=NExLXAFUfXsFGjpHg03lOcjoeOdcOv1cLKr5WEMjWijRJAbiHF0eAp+7iOKuLcCSJdwFBF7pdROJLKKl2erz+jhvAlJ2QaovKMqIIqoaGJ6LaEEkC2+/DzB6j/UHnOfsGQ8YSAkWFGPwiMjjNDn8VpoM1Ex9bMxunHiI7TWAoVKiZHb3B13NOXLvA3XBN058+26qIbx4l37+KDk8brgqzGAukGbwNmzqwOCoc1yJkmylpz0LGh5hzKFJckAXBWYardBlDAEtUHhXVDEZWEG0agMqZiediFbT+IDXugywCulvpQZb+6pMxlAFj09EZFIWdqme2ozkC0VtLJ72po3hCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cSZ5gKFzKpmkVyQ8I0j2VPnMKIpqpVu+agAnvqinzeo=;
 b=i1mHeJrwhkVAq0VCx1v0FK6VqrDBZ/NmyMO9/5ohMDEU6vAP+HRd8+F8m3f0O683vbFpZy5dzAY1ZwMveMiCHbqvwhI+xmLRxLdkNo75CLsF2Mp3YkHcmS6MAkRfIVQR0KxVyZ2stq1VdXQXXdwdS59DK9F0OTxOyPGq2/HpT9A=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEYPR03MB8790.apcprd03.prod.outlook.com (2603:1096:101:202::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Fri, 23 Aug
 2024 02:44:46 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.7875.023; Fri, 23 Aug 2024
 02:44:45 +0000
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
Thread-Index: AQHauZvjSsoBOfJjC0GAI+NtmELueLI0mZoA
Date: Fri, 23 Aug 2024 02:44:45 +0000
Message-ID: <83db4ae9af159a2cf4ccce9b98c07824597500c5.camel@mediatek.com>
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
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEYPR03MB8790:EE_
x-ms-office365-filtering-correlation-id: a2271f93-01fc-43f9-de4b-08dcc31d8c4a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?Lzd2WTdKYzJkL2VaVUFOalV5amovd2U4b29YKzJEeitLdXhJVlByUlhwUFRp?=
 =?utf-8?B?bXNyUmZNKzBBS0c3ZUtiQ0pRdFdCTWxXWFlpMzkya3hHT3RVZVBtckVCZjZD?=
 =?utf-8?B?c1RhYnV1N3Frb3Vtem5rRXlaMmU0UllTOWovVllvdW1sZ1lwaUxOdXk0QkF5?=
 =?utf-8?B?VmEvMWM2dXFUV0Z1dzZ3V3J1ZldveTI4Y3AwLytiendzWGVZcFlGc3hvRWM1?=
 =?utf-8?B?MG5RMUZqMi8yUUp5ZVNDWUFUN2x5UEtKd1VRMm0yUGRWNlg0UkJxbHhXVlE3?=
 =?utf-8?B?SUlCZnVDUGY1d0xTRVRTZVpWS3NYQTRnQ0hiZzFqdjhRV1BhTldSL3ZEbzY2?=
 =?utf-8?B?UngyNFpXM3VTWXpGOFppQ1hIV0hDY1RTQ1hzOHJENk1mVVZ4ZzhyUEczNmdC?=
 =?utf-8?B?WmJqRkVSaDJyckQ2VGUwelhDbEljSUpGNWhiSHdZZTV3dUNSaUhhcWR2M2o0?=
 =?utf-8?B?TmN1aVZnMXh2TTY1LzhaOVdEQStIeFdCTXFDcEZHZnFIS1FyRUNta3MvcjRY?=
 =?utf-8?B?WXhpYlgvR2Qxa2JvdHg3dU1TK1JjaG9QRVdzZDArK1VkTHV5ZmVZenNZZVBF?=
 =?utf-8?B?cEVtdFpBaisxMHpsV2pWVUVySEtpbWV1NklDUDJMZThYcGtTZ2ZUemgxZjU4?=
 =?utf-8?B?Y3hmOElGcm1iMnIyWUdSZHliL0F3VWxldm9aQnMvN1FTWTdpaWhWRVBTSzNy?=
 =?utf-8?B?M2F3amlORlBYM1VCdDBmaTRlS2Zhamx1OWtXemlPMUYwYTcreWcxTUVZYklH?=
 =?utf-8?B?OFpKSDdLRWlneUZzWVhFQk5RL0RZcGtlWTJ6dVJRWHkwdk1yR2JreHB6K3JB?=
 =?utf-8?B?b0hITUh3ZnYrTWFSWUc5cTdrbWVrSXRQUlRTQmJLdDZSa05YcnpBU0EvRStm?=
 =?utf-8?B?VzYwTFo0ZW5ySXREaDNqSWdzK3RnZVJwemN2Q3c1ZlByWnh5NWVLaU83Rzdn?=
 =?utf-8?B?akZpMHZuejBNbzQxVDVpTVpXMUREeC92cm14N2NiN3lWUm9wUDZubjBreGYy?=
 =?utf-8?B?MmpkVjdFSUhKbjZadlBOTHNiaGFGNlNYZUszWm91Vm1iMUNKcXM3WmlQR3hF?=
 =?utf-8?B?UjNWRGxYOXJJc3ZQMlBYNVNsRDg4aXM1Y0dJYVBhQXdTMm54cElLL0t4RE1q?=
 =?utf-8?B?YmtlOUNLY2ROcmdmcU9LTi8xd2N1VUhTbEhZUk90MDZlQXpaQTlHQXJLV3Ru?=
 =?utf-8?B?MFlDdFhrT1F6ekRWYU9IZWVMQzZId2U0QTROOS9iRkxuL2szMDd2clRxTFF0?=
 =?utf-8?B?R3YvMyt4bGtUVkgyaU1ESDYyV0plMmdOSW54RkdSSm1xNHBTZ21ka1Blb29M?=
 =?utf-8?B?V3hScDhjWSt0RnY0K3c2Q25GRlBDRFBrTkxkYXBDOFBBWU5iaDRlRHdLZDQz?=
 =?utf-8?B?V1BHV0FFZnd2RWRwZkV0dWtmNW9MMDRaQ09xaFlFNm1zbUo4QjZjUlRoWStk?=
 =?utf-8?B?bDk4bmRlZnF5eTRwV2NmQThzMVhUM1hrSWtXK1NzMzlORWxDNFRQYy96TUtF?=
 =?utf-8?B?RXo5TWNpT0N3NmdNYzVBL2hya2ovSytGaVRNdUpzUXpyTnZJdzZzUE40UTQx?=
 =?utf-8?B?NlIwUUdKVmdPNmVjQ1NoQXcyQnlSOEFacjhJYTEzYnQ3Wk11aVNDY3ZsL3hn?=
 =?utf-8?B?VEEvVXBUSi9pOWkxUmtONjBNbWxNSEpQQ0dHU0ZmWXM0RUpzem80bytWNWxF?=
 =?utf-8?B?TzM2Y3FlaWZOU0JFNEVyUWVHRmFxNnp2b2IwcDF6ZUM1QXpYNi9tamVIR0wx?=
 =?utf-8?B?dmZ6WDBFNTNRalU1Y0VtSXpqenFJaHNGOHVFZklPdjExSkdSN2FXd2JmT0VF?=
 =?utf-8?Q?spwY/zyEiL0FI9m3TiiyOcBgHvYilmOM+MBgc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VmVkcHJpL1hNN3o5S1hwRnlTbDNOQlBrcXJvVHdsN0I5RlZFanJJNXBIc1dM?=
 =?utf-8?B?ZU90NVVxV0ZFc3VWY2R1dThjVU92N3YyOTM4VGxGYUhpVU92cnkxQ0t2cHp2?=
 =?utf-8?B?QzZSaDNkby9SWFhCTkRSNXlwVENjRXI3V3oxM3ZNdW9TYUtRV0d1NC9Dcm94?=
 =?utf-8?B?SlR3QldsU2ZSZHhqQ2oxaXlRN1RwWElTaUgyMTZPSnVmWmNVc3RPUE85blVF?=
 =?utf-8?B?YkQwdlI0bmhNbmZXZXFsVFhOK0tZNTZCSEtVeFBvaXk1Q0NHR0JHMkRaSS9T?=
 =?utf-8?B?cEgxb2x6SG9DMC80VkpHTUhqaWJTN3Ard3JhYXFqdWpCOGdmMnRuR2gvcncr?=
 =?utf-8?B?QkR5Zzd4dmVDVUIxbyt6Z2xCUXdLNFZhdndONFp5MVZOOEwyYnpBMGk0MVlj?=
 =?utf-8?B?cEp1YjJtQ1MrQ2FhNHcvZmJ2R1JlV1ZQMytPQWNFOS90WXN2YWRlRXB6aWZt?=
 =?utf-8?B?dVF4Zi9ZREVnVUw5SGR4WE5aU0FVUE9KbHVPRFJ0WGl1ditudEZJWFYrbGVL?=
 =?utf-8?B?bFJkbDlyd0ZCRWJQYks4REdObUN5QW1tZGlkVzdXLytFL2dBOEUvUzQ3cDFk?=
 =?utf-8?B?TmhMSG9yMkVIQmt3R1EzbVF4eGxSWXRJRFlEREpwUHM4R2d0bmpRTml0aUp3?=
 =?utf-8?B?WURLZDdVdTdGZmkyUHRLU0lPOStJbU9ZdzVQcDFKMk9YdE9WSmFXRHA1ZnBr?=
 =?utf-8?B?S2xieHB1TUNUeWV2cVFCN1A2VWxscmNSVzFGVXgvK3hpczlZVXp2VHpZODV1?=
 =?utf-8?B?bEk2azhrRU4xK3VsakFJYUtSZzVlTEZpUW9IQnFiVnpJZ05oU25qUHdEMXA2?=
 =?utf-8?B?YlNkOW1WQi9Calc2Qld5djE5MW5MM1pESnJ6b24va3BRUHM5RWFiSHFXSlFH?=
 =?utf-8?B?eHBlK2xYbjF5RUJUeVZCcDBrd0RISGhrMTRJSFpjejBFbzFkODZMRFhOQzNr?=
 =?utf-8?B?OFc0LzhqS1dlUGl2eTAvWnVzdTZ1eU1iOHl5b0FDaEFDZ0xWOFJNRkg4TW5D?=
 =?utf-8?B?b0FxM0xoOVdkVjd4L0JJUTlyTjFBY2FITWJXRWFSOS9sakNvc3V1bHQzUGpF?=
 =?utf-8?B?RmpvRWxPMk8yZkhJcys3Q2xzNU53N2VFd3dRUDd2QmFYSVluVVgwaVAwMVhi?=
 =?utf-8?B?cjdKQVhkUG45OTNnRFljb1ZBRGw2Z0NJYmhsYlRQSFY5bk50eFpDNVBSdHJu?=
 =?utf-8?B?cFVCQ2FkbGJKR3RGTEppRlVNYWlaWW0yczhJcW44b3VCOElHUTNSQlhpQnhh?=
 =?utf-8?B?WDdYR2NUVFQyTlVtY3ZHaHB6eXJCWGdQNWhIUFZXeWcyRFI4SW9KOURkNHU4?=
 =?utf-8?B?YU16d1ZlRmJnc2Z2WUYyZzQ3czVCVnk5b2twN3lXTHZYQjg2ZjA3Mnc2UTZS?=
 =?utf-8?B?QkJMcVMyQkdXWlkxM0VzNml3Z0lyVS8vM1BzSTNCaCtvckpBR0J6N2xZdXo2?=
 =?utf-8?B?S1lGT2dSUURhdTZtV0wweEVVR051bExkaml6RzYwTVpkazZkWGZaRTNBUWNx?=
 =?utf-8?B?dGRVMlZCd01uemNZMXNob1llS21yZnhJMTlkL1ZLYWZNV0MzcElZaWV1SEwv?=
 =?utf-8?B?ckpPdHpWNHlKZVRLWWFodUNDb3M2SzVTdjRScUVZckRxMTJWdU9BMjRCdnlj?=
 =?utf-8?B?Y3RVTWdUV1BPWkEzdmc2RmltUkVSRjlTU0Z4R3k4OFVJSUYzNFFiOEFxTHRn?=
 =?utf-8?B?SFRMV0o5TThpK3ErZTRlbFZEc1ZTSmgxSy94NzhFQ1p0NzJxNXdIdmRQMXM0?=
 =?utf-8?B?bm5yWDl0ZHZYZm5xZlBYbzZnNDZXSXZtNWJSV3lwL2ZkQmhuazdBSTQ1bEpD?=
 =?utf-8?B?SWZNSVBSWVBNK1BUNzROOVBtWGdjZ1VQeXMxZmQ0cFBqZnU1anRtMEJsVVhl?=
 =?utf-8?B?VzdmOFNxWW9UWUp2SUd2blBkRXZLazUrYmxHc0EyNlJZcVdyaGwyWS9JWGlJ?=
 =?utf-8?B?bW9jMlFmd3F0WkZENXRvU2t6Qkd2OTFkclJJZTljTURlTS9FNUduYWhmcmhy?=
 =?utf-8?B?cXlWbXlwd0FkWlcwVkNpR0daVlN6OTdETld6WThuZmthREY1TUdWR2FqazJ5?=
 =?utf-8?B?czA0Skp4M3g2cHp6bitzY1JTSkd6QXJQVWFSZ29pQVBLc0hQTVNtUWE4ZEE0?=
 =?utf-8?Q?eyzYvsmI8qZSZYSKAjQsIh2/0?=
Content-ID: <DE14122ED1610B42B782F7A573A6F72E@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2271f93-01fc-43f9-de4b-08dcc31d8c4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2024 02:44:45.4749 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 00vi3XYPQ5o9z5g3l97mUtbynFjNzSATVTa08qmJmLtvFP6HiGySkQZhA0YMbQFwXTrULTc18XvEvOQIJNhcWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8790
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_007_829954379.204648697"
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

--__=_Part_Boundary_007_829954379.204648697
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
DQoNCj4gK3N0YXRpYyBpbnQgZHBfdHhfaGRjcDJ4X3dyaXRlX3NrZV9zZW5kX2VrcyhzdHJ1Y3Qg
bXRrX2hkY3BfaW5mbyAqaGRjcF9pbmZvKQ0KPiArew0KPiArCXN0cnVjdCBtdGtfZHAgKm10a19k
cCA9IGNvbnRhaW5lcl9vZihoZGNwX2luZm8sIHN0cnVjdCBtdGtfZHAsIGhkY3BfaW5mbyk7DQo+
ICsJc3NpemVfdCByZXQ7DQo+ICsNCj4gKwlkZXZfZGJnKG10a19kcC0+ZGV2LCAiW0hEQ1AyLlhd
IEhEQ1BfMl8yX1NLRV9TRU5EX0VLU1xuIik7DQo+ICsNCj4gKwlyZXQgPSBkcm1fZHBfZHBjZF93
cml0ZSgmbXRrX2RwLT5hdXgsIERQX0hEQ1BfMl8yX1NLRV9TRU5EX0VLU19PRkZTRVQsDQo+ICsJ
CQkJaGRjcF9pbmZvLT5oZGNwMl9pbmZvLmhkY3BfdHguc2VuZF9la3MuZV9ka2V5X2tzLA0KPiAr
CQlIRENQXzJfMl9FX0RLRVlfS1NfTEVOKTsNCj4gKwlpZiAocmV0IDwgMCkNCj4gKwkJcmV0dXJu
IHJldDsNCj4gKw0KPiArCXJldCA9IGRybV9kcF9kcGNkX3dyaXRlKCZtdGtfZHAtPmF1eCwgRFBf
SERDUF8yXzJfUkVHX1JJVl9PRkZTRVQsDQo+ICsJCQkJaGRjcF9pbmZvLT5oZGNwMl9pbmZvLmhk
Y3BfdHguc2VuZF9la3Mucml2LCBIRENQXzJfMl9SSVZfTEVOKTsNCj4gKwlpZiAocmV0IDwgMCkN
Cj4gKwkJcmV0dXJuIHJldDsNCj4gKw0KPiArCXJldHVybiAwOw0KDQpUaGlzIGZ1bmN0aW9uIGlz
IGNhbGxlZCBvbmx5IGJ5IGRwX3R4X2hkY3AyeF9zZXNzaW9uX2tleV9leGNoYW5nZSgpIGFuZCBv
bmx5IGRvZXMgdHdvIHRoaW5ncy4NClNvIG1lcmdlIHRoaXMgZnVuY3Rpb24gaW50byBkcF90eF9o
ZGNwMnhfc2Vzc2lvbl9rZXlfZXhjaGFuZ2UoKS4NCg0KUmVnYXJkcywNCkNLDQoNCj4gK30NCj4g
Kw0K

--__=_Part_Boundary_007_829954379.204648697
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
bmlwXQ0KDQomZ3Q7JiMzMjsrc3RhdGljJiMzMjtpbnQmIzMyO2RwX3R4X2hkY3AyeF93cml0ZV9z
a2Vfc2VuZF9la3Moc3RydWN0JiMzMjttdGtfaGRjcF9pbmZvJiMzMjsqaGRjcF9pbmZvKQ0KJmd0
OyYjMzI7K3sNCiZndDsmIzMyOytzdHJ1Y3QmIzMyO210a19kcCYjMzI7Km10a19kcCYjMzI7PSYj
MzI7Y29udGFpbmVyX29mKGhkY3BfaW5mbywmIzMyO3N0cnVjdCYjMzI7bXRrX2RwLCYjMzI7aGRj
cF9pbmZvKTsNCiZndDsmIzMyOytzc2l6ZV90JiMzMjtyZXQ7DQomZ3Q7JiMzMjsrDQomZ3Q7JiMz
MjsrZGV2X2RiZyhtdGtfZHAtJmd0O2RldiwmIzMyOyZxdW90O1tIRENQMi5YXSYjMzI7SERDUF8y
XzJfU0tFX1NFTkRfRUtTJiM5MjtuJnF1b3Q7KTsNCiZndDsmIzMyOysNCiZndDsmIzMyOytyZXQm
IzMyOz0mIzMyO2RybV9kcF9kcGNkX3dyaXRlKCZhbXA7bXRrX2RwLSZndDthdXgsJiMzMjtEUF9I
RENQXzJfMl9TS0VfU0VORF9FS1NfT0ZGU0VULA0KJmd0OyYjMzI7K2hkY3BfaW5mby0mZ3Q7aGRj
cDJfaW5mby5oZGNwX3R4LnNlbmRfZWtzLmVfZGtleV9rcywNCiZndDsmIzMyOytIRENQXzJfMl9F
X0RLRVlfS1NfTEVOKTsNCiZndDsmIzMyOytpZiYjMzI7KHJldCYjMzI7Jmx0OyYjMzI7MCkNCiZn
dDsmIzMyOytyZXR1cm4mIzMyO3JldDsNCiZndDsmIzMyOysNCiZndDsmIzMyOytyZXQmIzMyOz0m
IzMyO2RybV9kcF9kcGNkX3dyaXRlKCZhbXA7bXRrX2RwLSZndDthdXgsJiMzMjtEUF9IRENQXzJf
Ml9SRUdfUklWX09GRlNFVCwNCiZndDsmIzMyOytoZGNwX2luZm8tJmd0O2hkY3AyX2luZm8uaGRj
cF90eC5zZW5kX2Vrcy5yaXYsJiMzMjtIRENQXzJfMl9SSVZfTEVOKTsNCiZndDsmIzMyOytpZiYj
MzI7KHJldCYjMzI7Jmx0OyYjMzI7MCkNCiZndDsmIzMyOytyZXR1cm4mIzMyO3JldDsNCiZndDsm
IzMyOysNCiZndDsmIzMyOytyZXR1cm4mIzMyOzA7DQoNClRoaXMmIzMyO2Z1bmN0aW9uJiMzMjtp
cyYjMzI7Y2FsbGVkJiMzMjtvbmx5JiMzMjtieSYjMzI7ZHBfdHhfaGRjcDJ4X3Nlc3Npb25fa2V5
X2V4Y2hhbmdlKCkmIzMyO2FuZCYjMzI7b25seSYjMzI7ZG9lcyYjMzI7dHdvJiMzMjt0aGluZ3Mu
DQpTbyYjMzI7bWVyZ2UmIzMyO3RoaXMmIzMyO2Z1bmN0aW9uJiMzMjtpbnRvJiMzMjtkcF90eF9o
ZGNwMnhfc2Vzc2lvbl9rZXlfZXhjaGFuZ2UoKS4NCg0KUmVnYXJkcywNCkNLDQoNCiZndDsmIzMy
Oyt9DQomZ3Q7JiMzMjsrDQoNCjwvcHJlPg0KPC9wPjwvYm9keT48L2h0bWw+PCEtLXR5cGU6dGV4
dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBO
b3RpY2UgKioqKioqKioqKioqKioqKioqKioNClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4g
dGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUg
Y29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVt
cHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQg
dG8gYmUgDQpjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55
IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcg
b3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBi
eSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkg
DQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRo
aXMgZS1tYWlsLCBvciBiZWxpZXZlIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFp
bCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJl
cGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRo
aXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBh
bmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3Ro
ZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_007_829954379.204648697--

