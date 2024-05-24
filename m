Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A10F68CE2D2
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2024 11:02:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D31310E13E;
	Fri, 24 May 2024 09:02:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="grbQoowy";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="n9WwgqDY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8624110E13E
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 09:02:32 +0000 (UTC)
X-UUID: 5786414819ac11efbfff99f2466cf0b4-20240524
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=s3LejxVoshEScwCrHEXrctNlt2G6urrPzyJi4qRX6V4=; 
 b=grbQoowyb4Q7O6ZzvoDwNSQ1pE0P1QtiC4hmv68PFWotRkjGYgSGIXcd4xBN0jgT4eDBlbzii5cYLoxo/sCP+1y4DJm/Gq6mhclJhW+rXQKqqjocSU0Hgq0OfgtyDqgitKBV9YhSiTRsa7BersmqXCduhPiri180aXzL0u6QZvE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38, REQID:ca24190a-e3b7-46fb-8f19-9dddfd7a0da3, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:82c5f88, CLOUDID:ef774484-4f93-4875-95e7-8c66ea833d57,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:1,EDM:-3,IP:nil,U
 RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 5786414819ac11efbfff99f2466cf0b4-20240524
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 30735448; Fri, 24 May 2024 17:02:26 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 24 May 2024 17:02:24 +0800
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 24 May 2024 17:02:24 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ggQBlzWh5DI9w6fi6KybLyMTMLXFrcStch1UOpM2yzVA6vyKv2MEuPwB3PUHK01R6rdRPd+f6biyokX4YBsl5xJmvIC7cJ+s3ZS2rIpAcPimmIUnNy5Pn/Afp1Uap3PVfxqBzUd3+GPE+6zzAZZQAyCg8IppefL9ZMLu9VcRbRQLgBz+tyD0aOKpqKBPqLzO/8lp4hY9Kf7Ap/KAP5HHNCcL66I/qsge3tj55Rdlf8Uyrl+uMxOOZmolcWmjmXiWRjyMIH2JMP65Z2EOUbfgaO8Xnug2QRe+hfjKOevJSQDjEUgwvpwF5Vq159HJXF3DJB8uTA2dBDoqaSphjKnqMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/HdSAjTj8prAQkdxDjV55wU2g9z8tXr33eIQwQpac5Q=;
 b=U6G8vttUMxDbCUNO1mAazudKjt8kP6wI+oPP5PNlWHFs5t6Fu5gIfWeDsA9+WSl7AvZ+CFG0zN79+CUbdVDLzths0/b3pXW640gjlg9V1nZFZebdWpscOKltKp64sfSU0FHPyQ0ljKcJmLBJHpcbOstnGaGoZfmNNNDx3BrCDc53AYaodxYJC/d7dheMIF5dqANxqR9txCDVgQkSEA553TzqhQV8BQ+lfP+RB3u60cSmNH17f4033JUv5lhZ6ZFzk6C84ZbK+5dCVXNwAwoOuqQNSWtd/XVL1VH/Xp2VRZQaUqGmpndRFvsvZM61cGxIQbjmFadZviKWOPpJbwTN2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/HdSAjTj8prAQkdxDjV55wU2g9z8tXr33eIQwQpac5Q=;
 b=n9WwgqDYmbLTvY3qrivhZ1jEEApGWzCpsbV7zybdAbYgv2T8mQzUGvC0jJUUCx9wQQv0B6IHFksaCLQOTMgRPOXccBIekDOgO7NCRpCpmiu3EFta0atnyAVGsTWxiDmTVzJ1tG3RK1GH6vPX0OYVHGQVEuKZwhEmY7AZ7NVVCFI=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by JH0PR03MB7610.apcprd03.prod.outlook.com (2603:1096:990:18::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Fri, 24 May
 2024 09:02:22 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.7611.016; Fri, 24 May 2024
 09:02:22 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "mripard@kernel.org" <mripard@kernel.org>,
 =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?= <jitao.shi@mediatek.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, "amergnat@baylibre.com" <amergnat@baylibre.com>,
 "robh@kernel.org" <robh@kernel.org>, "airlied@gmail.com" <airlied@gmail.com>, 
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "will@kernel.org"
 <will@kernel.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH v4 07/15] dt-bindings: display: mediatek: dpi: add
 compatible for MT8365
Thread-Topic: [PATCH v4 07/15] dt-bindings: display: mediatek: dpi: add
 compatible for MT8365
Thread-Index: AQHarQ/IYNDozH0Rm0a6uOkzB4InUbGmGA0A
Date: Fri, 24 May 2024 09:02:22 +0000
Message-ID: <4348c01cdf3737d1dabdc22263aaee9f30469fab.camel@mediatek.com>
References: <20231023-display-support-v4-0-ed82eb168fb1@baylibre.com>
 <20231023-display-support-v4-7-ed82eb168fb1@baylibre.com>
In-Reply-To: <20231023-display-support-v4-7-ed82eb168fb1@baylibre.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|JH0PR03MB7610:EE_
x-ms-office365-filtering-correlation-id: fa9933e5-6ae6-44de-9ca4-08dc7bd0395c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|7416005|376005|1800799015|366007|921011|38070700009; 
x-microsoft-antispam-message-info: =?utf-8?B?YmMxTzR4eTFmZERRUGFsblkxeUsraExNMjVCY0xmd3dobGMrUUVVNE9sbWtN?=
 =?utf-8?B?Z3QxUW5YanpmdjRhamJ5MGxESXlNYXNGR0w4WFJkWlUwdS9tZDRXMW5GaXdS?=
 =?utf-8?B?ZHJZMFdCQmM0TW1LM0pYWUM3MURMK0lQR2dyempoNEdhdVozdERObDk1OW5K?=
 =?utf-8?B?cFdSR3FQbVFaTnZUbTBlLy9HemNCd2dGSjhHa3ZrQUJFMlZpeW9hQTlXWTB4?=
 =?utf-8?B?M3gralFVY3FXcXRDY1h2OUJWOEZWME1rN1VwbXlnaklTTDVRdVZhSmhYSW1D?=
 =?utf-8?B?ZkhyUGY0blViL1kzZXJtUWpNUis0cEZXKzZtZitpOHBreVp1d2dMTGlsZGQz?=
 =?utf-8?B?QTF2bDZhbWZZVm4vVWg5MlZpK01ML0F4eW9WOHJORGlWT3FvZkNsMnBIV0Fr?=
 =?utf-8?B?NkpydnNsWnhHb2k3bjgxVlVMa0daQUhnMU4xV2pybUlxbmkvMThISWhMcXpw?=
 =?utf-8?B?YXJOM0Frd3ZXeHZoYWNtME8yOFV4c3pLUWJJajA1d2VrSlVyYkJhTzhFdmJX?=
 =?utf-8?B?R1ZPanN3T1pIbHpxSVozV0p0TlErdmxZV1NzWFJaQXZRaDNUU0hraTNDSFhP?=
 =?utf-8?B?YVFjM2kxbnIwdXlJUXhXRDcvUWFDQXMxNnJOeFp3Mkd3VGl1SkhmNUhrVmpq?=
 =?utf-8?B?TW9LSEZDVGxRMGxhS3U3dFNzeFdxSHZpK0xHZjFWQmJzalg4VDJCekNPK29P?=
 =?utf-8?B?K0M0b25WWHUwU1RIV0RvWTB4SXJMbitXMVB2Q21yTHR1QWpLNnFEcEhVZWI2?=
 =?utf-8?B?VUZwV0tGME42RTkrZ0VoR2JqTGNNZGNPbmpWMUNWdkdDTTBuMkRQbnpPcXhK?=
 =?utf-8?B?RytGS050VFdwcVdCRCt1eW14ckd3YUZBZEZQTS9RdDVhQ0p0d01mQ1A3S2lE?=
 =?utf-8?B?WHlJWDM1QUh0QjhYYkk0U1NmRTh3bTBMUWdnSmNjRXY5WnNTd29NcUdHTVds?=
 =?utf-8?B?UlVMM29GWkNxeHYyL2JyeU9OQ1ZjNEF0WXdpb1QrSk5BeERYc0lhaU1CVXFF?=
 =?utf-8?B?bGs3WmFDbnlDUmRmSWl5ZDd1UG40WUNhTUM5VVZzTzRqUndqNy9GRnVBNmRa?=
 =?utf-8?B?SjVrTE5OMU1kL2ZrTGIxL0xUYlF5YVVsUlEzVXNtTC9WYVBxZFhJUkZ0amow?=
 =?utf-8?B?REU3aWVxNXZGUlUxWDUySmZrdFZlS3ZBbWovaVdMRHVwenZTejlZQlJzay9G?=
 =?utf-8?B?R2t2VlhEL0IzbzU5QVJ3K3R5SE1uejB0RERNM3NXVXpUUTJvY21xd2JYeldk?=
 =?utf-8?B?VENjalhKWXpVUEFvN1JmM2lkR2NmRGdTb3hzalovVXVEK2xDZU1tMGlwTlly?=
 =?utf-8?B?Y3pRQTg0OEkzaHJFUWR4TEY1TWFud005amVFYXV1WGpvTkphVlkvWGE3TU5K?=
 =?utf-8?B?MUdpN2thYW1GR2x3L2g0TkxzV2ZQMDhMNVcvb2l2RnR3WCtwQ1A3T3ZKRk93?=
 =?utf-8?B?OG0rdmYrNmNWaEpPYWpHSlN2QVF1Q1JKUnBVL3BvZlZmNGJwSHJlTkVmeEFG?=
 =?utf-8?B?dCtPbksrU1JobGlUZG0rdzFGamtiUnlvUjlqZHZlTFFtV0pmOStCSzlVRlVt?=
 =?utf-8?B?d010TCtZMEE4TjZTK0NBQlVZTzhiM2E5MVdMRUNKcXA0ZERCNVFGSTJ1TXlP?=
 =?utf-8?B?d0hzQldvcXBEMVlEYWdNclhmSG9FSHFhUHB5aTlZUnJob1BNblBoVlNQTVgx?=
 =?utf-8?B?NUNWN0N6ZVNqSkpXd1J4S1EzMGE2dE1jRm9UZktEbnFZRjBKWUo4emJxd3dM?=
 =?utf-8?B?L1p0cnNOUS9jM2d3TDRML1JnMUtNbjBBNUFzS2l5MWljUWRhWjJySFNJbVlW?=
 =?utf-8?Q?fP3ciU3lkXriNPammHuZcE89GBwvcezXZ8Dcs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(376005)(1800799015)(366007)(921011)(38070700009);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MU9STnJWN3k2WkhKSmlNakZRYkVEa01YUHA4aGx0R2pZT3d6TXI0R0dVTVI4?=
 =?utf-8?B?M1RUQ01FNzhmRVVqOVpsMDhkbXpERURKZ0Z4Q3lmb2puOFVjalEvRWdhWDJz?=
 =?utf-8?B?UzRBSHBkeWFlVitGSFZ6L2tNTXNyaWQyaHhpcHJEbDBXSHJzMkJCRk9JM0FJ?=
 =?utf-8?B?Zzg1eVh5cXFKN1VsYkFteEFkZEtvMUQwZzFWb09XM2xRNHZxaVZwelAwMGJk?=
 =?utf-8?B?UFBjS09NSFYyemhMeXEyYmthU3N2VkxZMzh4T2UvWkRENkhITzF3VkovZUxh?=
 =?utf-8?B?MkdQci9YdUZIM1dpNk9kNnN5YTNKKzVHN2NJT0c4WHI3VW5ETW5BeUlQSUZY?=
 =?utf-8?B?VWFSbDA0blMybHRRUEtjMjVuM0xPa0RNRDhvWEo5bms2aHRYWkt2ZmgzRDlm?=
 =?utf-8?B?dEVqQi9DaDBzdytrRFhQcDNueWEyS3VMVnNwbVRlSDh5UWpHRThwWjhpSlY3?=
 =?utf-8?B?clRIZG5pdW5KZ0tBOUZ6VFJVb25HOUR0V0xORUN4Y0YzSVpsamIweFBuZEla?=
 =?utf-8?B?MHVHQ0MvQzNjUG83dS93RkZxNHVKb0NnR1BJdFdSdmptM242TXhVR1hQS0Jx?=
 =?utf-8?B?bk5ZL0ZSN2dETnFJN28rWHlTWDZBZ0dSVHRFVnJXOHdxNlUxbnUxaUl5bm5I?=
 =?utf-8?B?RzVEa2RxV0UyK3dyVnA4ZC9DS1MvWEFZR21NOGdBZXFPVnl5T09tZTF0ZFh0?=
 =?utf-8?B?ekhuZE9KUGUvbk9OcnF3Mk9DMGNCcWFPdkUwYWxST0J3RWJlWFFNTy9qcXlt?=
 =?utf-8?B?T1gveEV5S2ZEVjErR09vWG1uODFUa0NwU1Rxc0hleXQwNUxicUd4ckNCTFNY?=
 =?utf-8?B?dHJHMmt1cUtLb2Q2aUlZUUZMV0NzUGVWaGZVckNWT3pqU0h4b0FQZGFiT3hQ?=
 =?utf-8?B?V2J2bVQvUFVaVk5Rd09SZ1NkNEVXcTBOTUFZTXo3OUVYcHdmUk44azBoRlZ3?=
 =?utf-8?B?L2oySGtxYnovM2NEa0YvTFVhaDNSRzUvWXltdFpMTWFvbGJqYlhtQlJUeTBZ?=
 =?utf-8?B?TUhrNmo2M3FIT1F4RzN5RFBnL3drcGVhOVNHWVowalFEWFB2SjJtZmg5TVdx?=
 =?utf-8?B?OHVMcjh1Y0lIbnNpdXQ4bG54VWNvejNMZnJYZUU0VXZvTUpHbS9hWklWbFBa?=
 =?utf-8?B?eW8xU1pGSmU2ZVdwenBTTmpBZlBHZDJUbHdPZS9JdUd4WnZFeFJJUGdLcCt0?=
 =?utf-8?B?U0VYandGdlAzaklFTVo2NFNrZkZ4TE02UWlGRDRnNTlrZ3A0eXcxL2RvUExs?=
 =?utf-8?B?dUw2Z3F1VlRDY21YdENkNEdnK0tsV0V4TXlRSFVnaDc0Y1FEMHo2VERDUGll?=
 =?utf-8?B?VG5SNldQTkdVU0djWEZkVng4K0dIWklIcGVERkU3WFM3dTl3OGhNdk9TRkhM?=
 =?utf-8?B?UEcxVUxvVW1yNml0dkhaTmtGQXhvRWlKVHc1TFpSYVY1c0dQR3NZakg4Q3JK?=
 =?utf-8?B?L3c3RWwwWDNvUDBsK1dFZHB5SEVxSzFQV2dBTmlnK0g3dThnTGg0RXVBd0lP?=
 =?utf-8?B?a0FrUWhuc2FyU1pmY0lKZDl4bCt1Wk9pOW1hZUJUODUyRXZmU2tEeGVrVUdx?=
 =?utf-8?B?eFM3SFh2N2JVeitMd1czRTZyRytOZWZwaXIySVFrcUlVd054WGdMS1Frc24r?=
 =?utf-8?B?SUxRRmcwWk54bUFZOHd1OER4NlJoUGFpeU1ZQXVnN2VrY0N4Zkc2Y2wxZ29R?=
 =?utf-8?B?K0tmZ3A1NnJ1eEJ0L3NpcTQ5YUJ5YW5YRURsRzdKLzBQbEZOdTdLYXZsejEw?=
 =?utf-8?B?dzRBOUU0V29TZW11U1RpSjNBZDA5blU5SDI2KzJ1YXBGS1RiT2d5WEV2YjN6?=
 =?utf-8?B?ek9naGhxNm56bnJvaUJzYm1YckdtY3NzZ2ZxaGViT1ZsOGRTaDB5bHJuTXZR?=
 =?utf-8?B?ZWhJTjNMcWliK3FPUkYrelV2b1hXMGZvVkdsS2dZV2hkdzl2MzBkSEpWaENl?=
 =?utf-8?B?eWc2NjFLdnBEME1WcTFOVWdoMk11eGNqaUxKNEtYY3FublBuUDE2ZjlpSG9o?=
 =?utf-8?B?WEpxUUhtUEpaUHg0VlpZcGlGTE8vSVhXN25xdzJuSlFRRDdDNkxGUTZ6Q293?=
 =?utf-8?B?TXBla3M2NjNLOXY3dlRKcmxPSyt3cEhDTGhxa3VlVm1aM3NVZjc2akk4Y0N5?=
 =?utf-8?Q?asvnjBkQWzLNA5NTCGoJN2LU9?=
Content-ID: <6EC841F2571942428A3001D12213515A@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa9933e5-6ae6-44de-9ca4-08dc7bd0395c
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2024 09:02:22.5221 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v500EteHcpTj3ulgKK09nbMBbdvTNQiGBvBKofQGbwoZAsrK8L5rHMJ2mCUo1LnjXBtWkN9//pZPDnA5ZtL6WA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7610
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--12.378200-8.000000
X-TMASE-MatchedRID: pBwXUM+nCwsOwH4pD14DsPHkpkyUphL9meN8m2FdGic3xO2R3boBWFbu
 qIY+/skQkABPgKBt/0qbqzDH9G7eTMcIKE0FtlOFY1bQMCMvmn5h59nsX2QuC1iPAfsxl1xU6BX
 hOTEsTTHi8zVgXoAltj2Xsf5MVCB1t7DW3B48kkHdB/CxWTRRu25FeHtsUoHutV89kSreZKOfFo
 U1WwfdOTgIiIYZ2hfGl5AgUYVE601fCOKFKuVYGg==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--12.378200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 33B948889D532D65F0B92AFEDA682F8BC9E4DBD55855210E15B329A282D3954B2000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_006_1852455871.437385461"
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

--__=_Part_Boundary_006_1852455871.437385461
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEFsZXhhbmRyZToNCg0KT24gVGh1LCAyMDI0LTA1LTIzIGF0IDE0OjQ5ICswMjAwLCBBbGV4
YW5kcmUgTWVyZ25hdCB3cm90ZToNCj4gIAkgDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRv
IG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsIHlvdSBoYXZlIHZlcmlm
aWVkIHRoZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+ICBBZGQgZHQtYmluZGluZyBkb2N1bWVu
dGF0aW9uIG9mIGRwaSBmb3IgTWVkaWFUZWsgTVQ4MzY1IFNvQy4NCg0KUmV2aWV3ZWQtYnk6IENL
IEh1IDxjay5odUBtZWRpYXRlay5jb20+DQoNCj4gDQo+IFJldmlld2VkLWJ5OiBBbmdlbG9HaW9h
Y2NoaW5vIERlbCBSZWdubyA8YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29t
Pg0KPiBBY2tlZC1ieTogUm9iIEhlcnJpbmcgKEFybSkgPHJvYmhAa2VybmVsLm9yZz4NCj4gU2ln
bmVkLW9mZi1ieTogQWxleGFuZHJlIE1lcmduYXQgPGFtZXJnbmF0QGJheWxpYnJlLmNvbT4NCj4g
LS0tDQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRl
ay9tZWRpYXRlayxkcGkueWFtbCB8IDQgKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRwaS55YW1sIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZHBpLnlhbWwNCj4g
aW5kZXggMTY5ZDA1NGQ4MWZmLi4yMWI5M2YzNTY5MDEgMTAwNjQ0DQo+IC0tLSBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRwaS55
YW1sDQo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21l
ZGlhdGVrL21lZGlhdGVrLGRwaS55YW1sDQo+IEBAIC0zMSw2ICszMSwxMCBAQCBwcm9wZXJ0aWVz
Og0KPiAgICAgICAgICAgIC0gZW51bToNCj4gICAgICAgICAgICAgICAgLSBtZWRpYXRlayxtdDY3
OTUtZHBpDQo+ICAgICAgICAgICAgLSBjb25zdDogbWVkaWF0ZWssbXQ4MTgzLWRwaQ0KPiArICAg
ICAgLSBpdGVtczoNCj4gKyAgICAgICAgICAtIGVudW06DQo+ICsgICAgICAgICAgICAgIC0gbWVk
aWF0ZWssbXQ4MzY1LWRwaQ0KPiArICAgICAgICAgIC0gY29uc3Q6IG1lZGlhdGVrLG10ODE5Mi1k
cGkNCj4gIA0KPiAgICByZWc6DQo+ICAgICAgbWF4SXRlbXM6IDENCj4gDQo+IC0tIA0KPiAyLjI1
LjENCj4gDQo=

--__=_Part_Boundary_006_1852455871.437385461
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtBbGV4YW5kcmU6DQoNCk9uJiMzMjtUaHUs
JiMzMjsyMDI0LTA1LTIzJiMzMjthdCYjMzI7MTQ6NDkmIzMyOyswMjAwLCYjMzI7QWxleGFuZHJl
JiMzMjtNZXJnbmF0JiMzMjt3cm90ZToNCiZndDsmIzMyOyYjMzI7JiMzMjsNCiZndDsmIzMyO0V4
dGVybmFsJiMzMjtlbWFpbCYjMzI7OiYjMzI7UGxlYXNlJiMzMjtkbyYjMzI7bm90JiMzMjtjbGlj
ayYjMzI7bGlua3MmIzMyO29yJiMzMjtvcGVuJiMzMjthdHRhY2htZW50cyYjMzI7dW50aWwmIzMy
O3lvdSYjMzI7aGF2ZSYjMzI7dmVyaWZpZWQmIzMyO3RoZSYjMzI7c2VuZGVyJiMzMjtvciYjMzI7
dGhlJiMzMjtjb250ZW50Lg0KJmd0OyYjMzI7JiMzMjtBZGQmIzMyO2R0LWJpbmRpbmcmIzMyO2Rv
Y3VtZW50YXRpb24mIzMyO29mJiMzMjtkcGkmIzMyO2ZvciYjMzI7TWVkaWFUZWsmIzMyO01UODM2
NSYjMzI7U29DLg0KDQpSZXZpZXdlZC1ieTomIzMyO0NLJiMzMjtIdSYjMzI7Jmx0O2NrLmh1QG1l
ZGlhdGVrLmNvbSZndDsNCg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtSZXZpZXdlZC1ieTomIzMyO0Fu
Z2Vsb0dpb2FjY2hpbm8mIzMyO0RlbCYjMzI7UmVnbm8mIzMyOyZsdDthbmdlbG9naW9hY2NoaW5v
LmRlbHJlZ25vQGNvbGxhYm9yYS5jb20mZ3Q7DQomZ3Q7JiMzMjtBY2tlZC1ieTomIzMyO1JvYiYj
MzI7SGVycmluZyYjMzI7KEFybSkmIzMyOyZsdDtyb2JoQGtlcm5lbC5vcmcmZ3Q7DQomZ3Q7JiMz
MjtTaWduZWQtb2ZmLWJ5OiYjMzI7QWxleGFuZHJlJiMzMjtNZXJnbmF0JiMzMjsmbHQ7YW1lcmdu
YXRAYmF5bGlicmUuY29tJmd0Ow0KJmd0OyYjMzI7LS0tDQomZ3Q7JiMzMjsmIzMyO0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRwaS55
YW1sJiMzMjt8JiMzMjs0JiMzMjsrKysrDQomZ3Q7JiMzMjsmIzMyOzEmIzMyO2ZpbGUmIzMyO2No
YW5nZWQsJiMzMjs0JiMzMjtpbnNlcnRpb25zKCspDQomZ3Q7JiMzMjsNCiZndDsmIzMyO2RpZmYm
IzMyOy0tZ2l0JiMzMjthL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L21lZGlhdGVrL21lZGlhdGVrLGRwaS55YW1sJiMzMjtiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRwaS55YW1sDQomZ3Q7JiMzMjtp
bmRleCYjMzI7MTY5ZDA1NGQ4MWZmLi4yMWI5M2YzNTY5MDEmIzMyOzEwMDY0NA0KJmd0OyYjMzI7
LS0tJiMzMjthL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlh
dGVrL21lZGlhdGVrLGRwaS55YW1sDQomZ3Q7JiMzMjsrKysmIzMyO2IvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZHBpLnlhbWwNCiZn
dDsmIzMyO0BAJiMzMjstMzEsNiYjMzI7KzMxLDEwJiMzMjtAQCYjMzI7cHJvcGVydGllczoNCiZn
dDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjstJiMzMjtlbnVtOg0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7LSYjMzI7bWVkaWF0
ZWssbXQ2Nzk1LWRwaQ0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOy0mIzMyO2NvbnN0OiYjMzI7bWVkaWF0ZWssbXQ4MTgzLWRw
aQ0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOy0mIzMyO2l0ZW1zOg0K
Jmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7LSYjMzI7ZW51bToNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7LSYjMzI7bWVkaWF0ZWssbXQ4
MzY1LWRwaQ0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7LSYjMzI7Y29uc3Q6JiMzMjttZWRpYXRlayxtdDgxOTItZHBpDQomZ3Q7JiMz
MjsmIzMyOw0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7cmVnOg0KJmd0OyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyO21heEl0ZW1zOiYjMzI7MQ0KJmd0OyYjMzI7DQomZ3Q7JiMzMjstLSYj
MzI7DQomZ3Q7JiMzMjsyLjI1LjENCiZndDsmIzMyOw0KDQo8L3ByZT4NCjwvcD48L2JvZHk+PC9o
dG1sPjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxwcmU+KioqKioqKioqKioqKiBNRURJQVRFSyBD
b25maWRlbnRpYWxpdHkgTm90aWNlICoqKioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRp
b24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRh
Y2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9y
IG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3Mu
IEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCBy
ZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmlu
dGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMg
DQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJv
aGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVk
IHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZSANCnRoYXQgeW91IGhhdmUgcmVj
ZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmlt
bWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFs
bCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJv
bSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBl
LW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_006_1852455871.437385461--

