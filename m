Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6901C90832C
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 07:09:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C07D910EC2C;
	Fri, 14 Jun 2024 05:09:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Y2JcBV4x";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="g/thwG1t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E38D110EC2C
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 05:09:07 +0000 (UTC)
X-UUID: 36850fc22a0c11efa22eafcdcd04c131-20240614
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=vSFb3lxkphQDRjp5qrFK9SGg8ld1kGbq66VrhaFZZH0=; 
 b=Y2JcBV4xwdms9iGndX1tv8D6GM+qJI8YQ0Vqbt2HUK1eONZ8l9ECuzCNON6mTzClk92qQuorgmHpTEizpJsth+AGifRkggV54Tr1KO/TePp9rN/4rQBJOb6PU6nTJZh1fCeiU3bKrOIIvEMXFZivoFCLa4k9g9OQEUePZUdz9sE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39, REQID:19102fa7-97d7-4c37-adf1-d0711972ff18, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:393d96e, CLOUDID:1a6c9388-8d4f-477b-89d2-1e3bdbef96d1,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 36850fc22a0c11efa22eafcdcd04c131-20240614
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 624313870; Fri, 14 Jun 2024 13:09:01 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 14 Jun 2024 13:09:00 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Fri, 14 Jun 2024 13:09:00 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZYHAS8Tr954II9FABv+rRuJpW15JovmEkXr/oqLV+j6I93LBeUs88rbsBYx3Bu9Ttseh5j7rCZXRLDofMEWSyeLQYp94mddiQOYZibXp1R2dvy8GEVY+nCw3dnWDE1My2rxkaFiN4CfFLeGTkkxlc1CIov/S6E9Qzh380eG5OEOI5sjE6jaGn7sHCtubO87scaiK2iizKtOBxTTXrUbMqDAKsydWDCYKEbUfy/RSfHPf0xFx4tPh+yfakVuaT9gPdrdN4AOaEDY2MP34sL7fyikyyAuw/VRtty8ybQRyB/AnWSc+TzUhdw7tKNs+jXPv0Q/2oS6VUlGEzdFuGomm7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FKzFNM2tXN4nsKb2QCSaEB7HSmpjYQU+QPGV1q9Mws0=;
 b=TggB3eVsU8jj/Mr6HaMmk2lFsqom+TLaFBtYM5akr0HUb3Eu+KDmc+oQL8PmgkNL3nNsDMpGLy9F3aJhZrCILXb5Fte17Gwhxt+M4pw3Ej42v/5XxpPWEhPYSiqsmwpGZz/dEWX/9Z47xJIrD9npKn6dtIoD0dfyablqURbzdEeJZMijQteghJICfchl07dPChfxxDU5hWj3jn+JavzlXp7FoENJ/z08Ks6joABTzdynOelk+pVvP+Ng+UkbFZ2r95VGACR9fvOaKnEIE8RM7qdtoj39o3I9sclxNJse6s3EUY0t43BQJLIPszDmJqSFpZbVpvGoCWCMOk7yML0Cbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FKzFNM2tXN4nsKb2QCSaEB7HSmpjYQU+QPGV1q9Mws0=;
 b=g/thwG1t9VwinPCB8NlktVuG6iHYKU2JVDn/ia5/3Hdcq+iPiyoCLKq8V5ENtOro2TOf9LzY7FN8aeKDWhj9BflrbGkDRF5+efua3UOtAWmL/S86VH47CiNTqdjUqNJwRTr0kWgMP5YIOuwRqe7TRbrlEsPaLtOIF7YZQCVwJMM=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB7241.apcprd03.prod.outlook.com (2603:1096:400:289::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25; Fri, 14 Jun
 2024 05:08:56 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%6]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 05:08:56 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?utf-8?B?QmliYnkgSHNpZWggKOisnea/n+mBoCk=?= <Bibby.Hsieh@mediatek.com>,
 "jason-ch.chen@mediatek.corp-partner.google.com"
 <jason-ch.chen@mediatek.corp-partner.google.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "airlied@gmail.com" <airlied@gmail.com>,
 "sean@poorly.run" <sean@poorly.run>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "fshao@chromium.org" <fshao@chromium.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v9 13/21] drm/mediatek: Support DRM plane alpha in Mixer
Thread-Topic: [PATCH v9 13/21] drm/mediatek: Support DRM plane alpha in Mixer
Thread-Index: AQHavgUvSeDfE+/ZckSrDCxnNxMfPrHGtd8A
Date: Fri, 14 Jun 2024 05:08:56 +0000
Message-ID: <f0a9558a6553def2289aa4a092e8bc721d5d922a.camel@mediatek.com>
References: <20240614024620.19011-1-shawn.sung@mediatek.com>
 <20240614024620.19011-14-shawn.sung@mediatek.com>
In-Reply-To: <20240614024620.19011-14-shawn.sung@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB7241:EE_
x-ms-office365-filtering-correlation-id: 0b058a1f-5324-4316-3c86-08dc8c3017f5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230035|376009|7416009|366011|1800799019|38070700013; 
x-microsoft-antispam-message-info: =?utf-8?B?QUZvOFlpdkwvTmRWMVhUOGpPamRmdi82Y2Zya3dDQ0lmR01BbTdGdFU1NElB?=
 =?utf-8?B?MzJLZi9IMiszYjY3TmtHSEZSS0JzRWNYdkU3ZzhrbUo1ejRCdjRmY2NkSTly?=
 =?utf-8?B?UW1WRTRFVExxaXdEaTRCZ3V4ZnRsWlh5R1lFUXJJaWk5cmp3TjNVNUUwZUNG?=
 =?utf-8?B?RktTNnA2cHhSRUZJZHdCdjI5bzVsNDFNWFdtQmp5eVhoS3IwOXFqMnNuOHVO?=
 =?utf-8?B?dGYzaVBEWEp1b3JjQllyY2swTDdOY21BY05EVjd4WnBodzFjbmtRRTk0K2h3?=
 =?utf-8?B?WGFhY2Y0OVo4bmN5WnBQYXhabW9GbVREWllTWGVSZ2NyRTlVMEJCb3dkdUcx?=
 =?utf-8?B?UlBBaTNSdzBIRXl4eURKNWpFYkhncU9zQithMi83bTcwWm1MUnYzVnJwSmVL?=
 =?utf-8?B?THNRQy9vSUs2eFRnV0FkNEFnQVowQzdxL2g2STlyME9GUXl1T1dsczBxd2hW?=
 =?utf-8?B?L3BycklFODIra3hGM1dPallXUUF1SGJ1VlVGNENkU2xzaEp3Q0RyaFNaRXU4?=
 =?utf-8?B?TTFFdXhsb3ZxeGwrSGc0UmhGZ1lHRDhjbjNoYmpSQ3orODAxaGpKcHRMUy8v?=
 =?utf-8?B?NHovcDlwUlZGeU15YkYvUzlnOE92L25NTDRBazNXSXRGM1N1bExTYWxQQWt3?=
 =?utf-8?B?bUcvWkM2alA3b0ZDZFRGeUpnZHY4ZWRVQW9WaXBuMm5TNVpVWXVmQkRjMmpC?=
 =?utf-8?B?OU0vS2wra3Jad2FDamtmZExpWjlaQkxTU2ZNNHpnd0UranpQQmowUzlhbGRX?=
 =?utf-8?B?WUMzb2xNRTRVMVhWVzV1NXJadTNWSW9oNFlMQVFGeUVNTnJ5bkNnZGpiVi9Z?=
 =?utf-8?B?UVYraysvMmhwZktuMDQ3QzVQNnMvblBvdU5CeHRRZFk4ZVNVeHVRV1lUNGRQ?=
 =?utf-8?B?Ni9FNXVLMlQ3NHNCWnB0ZFMyTzk0ZW9PUmxQbHA1Y0tSamNwWjhwRFZLMFVU?=
 =?utf-8?B?SzdKMGdoT0ttaUZQZ09VOUdiVzU0WFM1WTdxV29MRWUwcGg2bWZqMmdCbFA1?=
 =?utf-8?B?NTY0bUdBb1IyUDdxcUZrcHNUWFpBODRzbUtTVCtzVk9CQjV4WHR6TU05WmxB?=
 =?utf-8?B?OUIrMzNLRTZYcnkzUnN3Tm1od202dXRPamhOdHVwM21yV1dFdjdUcFFrM2lO?=
 =?utf-8?B?cXh2ZlVwWllKSHFvRzk2SFBHbzRMZ1FleUYyY1lEL2ZEZHlwM1hUb3p0d3pw?=
 =?utf-8?B?RWZnWWJpNDdQY0F4OXJybnJUT2xUR1RxWFMyYkNoeHdDUzVScGNoL0JnTWdJ?=
 =?utf-8?B?anpTS0xsOWowSnJzYnlkTW5IZFVYZlA3a2ZkbFhOdkk2T0FaQjY2QnRpQyty?=
 =?utf-8?B?aUNWeFlmbFVDV2VvMm5FaWVqbU55QmNLbEhjTFR2Ym1uZEdLak5JR3diSVBS?=
 =?utf-8?B?RTIyWGMzdUFBQWtOQ1hkZFNHZUFiQ0lRTkJTTFBJYjl1Z3VkdUNYdytVVkVG?=
 =?utf-8?B?aStHVFJQR2xubFNjend0OGVxd0k4ZnV1UmovaHprd1Vrd0tIQW0xWGpRSUVV?=
 =?utf-8?B?QnRIdHlTYy95UUlBMndIREtWcW5GcWoxQVpLZHhnOWNrTk1Gc0o0NnF4MkYx?=
 =?utf-8?B?dlowOENxNHVsa3Y5WDRqZWRQOEMyZXRiYS8rUWZ3OWVjaGFkeXlJVHhhUU9s?=
 =?utf-8?B?YlEzNmhMcEhmK2hkdVV1WWJneHdOQmY2VkpITXFSMkVuUzg3UXJoYktjWTMw?=
 =?utf-8?B?WDl3L2F4QUF6d2h3VzNIZFlsRFRKS2F5cG5LZWRJZUtWYXBubkhEa3dqeUxD?=
 =?utf-8?B?QUJXQVlXd2ZrMW1RbW1XYm0xRTgyUkVYdzFSS21yOTRMckd5Y2ExaWhxOWJB?=
 =?utf-8?Q?ZJGk5k3C5Qp43pfyq5WdGqL5WJRImgkeBsNds=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230035)(376009)(7416009)(366011)(1800799019)(38070700013); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dVlnRnFCdHNzbDdINmdqV3pIVTM1clVPaGFsUW54YU5aUlNJTGwzSWtzQmF4?=
 =?utf-8?B?VVZYMEdGYTFXaFZRdnMzUnJBa0ZUcXdHTUErTWxVTHdmRjBEZ3YzdklVLy83?=
 =?utf-8?B?b0FPNEZkQ3FMQWxsWFp2akl4a28vdGJ2RmtJR0tYQ3JFZm80UGR3VUF5dG1t?=
 =?utf-8?B?UHZSNUx4VlF1T1Z3cFp5TnByVkNldDRMMnZyTGVYbU5NZkFLMnpBOVRZVWN0?=
 =?utf-8?B?YjhTNVBDalRsMStTTjdEQlN6bDFYcHhxS3NTNmJFeHVDamJyR1Q4NmFmSEhi?=
 =?utf-8?B?ZVVBZUZOc1dxSnE5c04weGs4VTNGRENxNFJDQkY1SUl4OXZla2dXZmRnaWRP?=
 =?utf-8?B?OURFaVN3VlBsa2hoTzlMTy9sMTllQmVtNnRXT3FvSC9XRVFOS2VxMG9qUnVB?=
 =?utf-8?B?bkZtNTl6QVBPdDFZZC9GY0UycXZZUWp1RGU3ekNRbEQ0UERydjNZbklJVTg4?=
 =?utf-8?B?R1A1ZVRubS9QdE1KNmlJbnVWT0tTTlZvVGczY1VWRGs3TDRnNXdBaWxENEFr?=
 =?utf-8?B?bWlFajRnU3Q2bG1Pd2pKdTlxTWpFUEpGeUNETFAvS0Vud01rUUdFdkxwcmdz?=
 =?utf-8?B?ck03bUNTdEc0bmJTeXZqWFJIUHNtN0tXamd1ZU9OMzNJWG9RckM2Y0x4VG1o?=
 =?utf-8?B?VEhyNmQxTGhybFBxM3FpV0VjYzhlckE4YzJIT3h1cVdNUEZLdTRQNWZORlZK?=
 =?utf-8?B?TGZmQW90RVgxcUZ3aTRBNEhZYmU5TWM5d2JwZGJnTUtkS3haMVdQLzVpNjFS?=
 =?utf-8?B?Q2pjYU5kdWx5aDdpWTlGTDk1ZC9Ld24wcEVSOWZFN21BUDZDNjV2VXBLc05j?=
 =?utf-8?B?OFpZMU5HYmRISHRSSXE4TXMxSFJiUHJYaHRSbVJXWG4xZzcreXhtYzhiNDFW?=
 =?utf-8?B?bGEvL1VzdThNKzhwSWp5cDR4ZU9wRDNDOFNHT0NpZWZIQXlRbEYvd0oxNEVO?=
 =?utf-8?B?dHh5RXVoN1hxYzRMU0FSM295OWZsM1RDNE9vcitaZjJ2SlZjM1RtemRaNHdI?=
 =?utf-8?B?ZzFoc21CcEVqdHQ3KytRdkZUNDR0bk12U3Z2cFRyUnp0Y3E1RlZNNjNsVUsy?=
 =?utf-8?B?RVg5ZnB5anY1VDh1cUdCTDFaUTNHNklWTDdObDlZSUhLWkJTQnp5OVJTZk5O?=
 =?utf-8?B?RGNGaHEySTVNeWFCeVVQeTVrT3g3TTMzM0RKQ0tzZWJNQ085azBkNWZlcTN1?=
 =?utf-8?B?Y3hWNXR6bVlTZ25qSkVRRkp3L1YxNW5IMjc5YkNHVDJmdHpKY01hSFB5TktN?=
 =?utf-8?B?bm0wNFN0QmVGeVFwa2cxeVU5dkFqRlAvV1lyY3dEdWNXaUVNVkswcUo2NFF0?=
 =?utf-8?B?bHNLMTNkSlBpcWY2eVdyQ1U0Tmd3bnhEbExKWU9qOWhQZVpuMDBFQ1FHeHMw?=
 =?utf-8?B?TzJ2SVdUcWx3VG9pNUJmZ0c3ckNSdDhnNjlEMG4zd0NFMmlRbE4vUHRJQ29M?=
 =?utf-8?B?SVIzZWRFcUQxRTdwS3RRbFc5WjJVMlE2bXcxWUkxV3pDQ0ZJU0ttVU1wcXVu?=
 =?utf-8?B?MmVHQ2dpMUo5cnJRUTB5Q2pmK2VrQTRTQjhFYzVzL253em9XUHlCTXJPUDND?=
 =?utf-8?B?dDI1VlBaOFhnaWszMUZienVQWXdYenhFcGlSaXFyMUFkVU5rNFhMODZiVkZJ?=
 =?utf-8?B?NVJqa3REQXArUWdta1pzUXBrcnlqNGZZVWcvVlJBZU9FbzFnQlNlaFpvOHJX?=
 =?utf-8?B?QkI5RGlXTm5GYVp5TU9ORWNqc1kzTk1MWE5VVnJqWkFmNW1vNGpjSmtTb2R5?=
 =?utf-8?B?M0RlSmdPYll3SVBXMVBlRHNrQ1FPOXo5TW5IWGtHZWc2c0dHejBhTi83cllJ?=
 =?utf-8?B?cVYxVEc2Qm81cnBCTzRFZWV0Y0tidUNkS2lBOUQ2blpwTFVNaUNHMUFGZUNh?=
 =?utf-8?B?ME5CQWRmRkdldmlKUFV3QS8yN0ZPb2VKUUF5Sk5VU05OZXQ5R1FJbnJXMHl0?=
 =?utf-8?B?elJPOS9IRHViSXNVbDl4UGZNR0g4NG1DOThySmxsS0NJSkE3M0tBc1BqdjN4?=
 =?utf-8?B?cDZqRmZWTWZWZGZGRzRQM2FBUEs0K2xzU3FsVGQ0YkRrNTV6NmlDNDBYaEVX?=
 =?utf-8?B?RmRYNlhEN001ajVzS1gwd29INDV4akQrV0I4VmxZVGkyeVhYdGhnYklRTU9L?=
 =?utf-8?Q?CVCf+NhDG7pipTVzpJTJqe/La?=
Content-ID: <E9F49C26CD42BF4883DD06B33D891B69@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b058a1f-5324-4316-3c86-08dc8c3017f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2024 05:08:56.7597 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ybkZnIXnIDPJDeeiaOepEM3lcGER9FeeuvrN1lPVo+6BKWKDVvyJ76N+BSwJHGfFYM865YOYnXJW8ODKwEwRZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7241
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_008_1473002291.387438273"
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

--__=_Part_Boundary_008_1473002291.387438273
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIFNoYXduOg0KDQpPbiBGcmksIDIwMjQtMDYtMTQgYXQgMTA6NDYgKzA4MDAsIFNoYXduIFN1
bmcgd3JvdGU6DQo+IEZyb206IEhzaWFvIENoaWVuIFN1bmcgPHNoYXduLnN1bmdAbWVkaWF0ZWsu
Y29tPg0KPiANCj4gU2V0IHRoZSBwbGFuZSBhbHBoYSBhY2NvcmRpbmcgdG8gRFJNIHBsYW5lIHBy
b3BlcnR5Lg0KDQpSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4NCg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogSHNpYW8gQ2hpZW4gU3VuZyA8c2hhd24uc3VuZ0BtZWRpYXRlay5j
b20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19ldGhkci5jIHwgNiAr
KysrLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19ldGhkci5j
IGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19ldGhkci5jDQo+IGluZGV4IDkwMmRlYzAz
YTdkZC4uN2VhYWZkNDRmMzIwIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2V0aGRyLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19ldGhk
ci5jDQo+IEBAIC0xNzAsOCArMTcwLDEwIEBAIHZvaWQgbXRrX2V0aGRyX2xheWVyX2NvbmZpZyhz
dHJ1Y3QgZGV2aWNlICpkZXYsIHVuc2lnbmVkIGludCBpZHgsDQo+ICAJCXJldHVybjsNCj4gIAl9
DQo+ICANCj4gLQlpZiAoc3RhdGUtPmJhc2UuZmIgJiYgc3RhdGUtPmJhc2UuZmItPmZvcm1hdC0+
aGFzX2FscGhhKQ0KPiAtCQlhbHBoYV9jb24gPSBNSVhFUl9BTFBIQV9BRU4gfCBNSVhFUl9BTFBI
QTsNCj4gKwlpZiAoc3RhdGUtPmJhc2UuZmIpIHsNCj4gKwkJYWxwaGFfY29uIHw9IE1JWEVSX0FM
UEhBX0FFTjsNCj4gKwkJYWxwaGFfY29uIHw9IHN0YXRlLT5iYXNlLmFscGhhICYgTUlYRVJfQUxQ
SEE7DQo+ICsJfQ0KPiAgDQo+ICAJaWYgKHN0YXRlLT5iYXNlLmZiICYmICFzdGF0ZS0+YmFzZS5m
Yi0+Zm9ybWF0LT5oYXNfYWxwaGEpIHsNCj4gIAkJLyoNCg==

--__=_Part_Boundary_008_1473002291.387438273
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtTaGF3bjoNCg0KT24mIzMyO0ZyaSwmIzMy
OzIwMjQtMDYtMTQmIzMyO2F0JiMzMjsxMDo0NiYjMzI7KzA4MDAsJiMzMjtTaGF3biYjMzI7U3Vu
ZyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjtGcm9tOiYjMzI7SHNpYW8mIzMyO0NoaWVuJiMzMjtTdW5n
JiMzMjsmbHQ7c2hhd24uc3VuZ0BtZWRpYXRlay5jb20mZ3Q7DQomZ3Q7JiMzMjsNCiZndDsmIzMy
O1NldCYjMzI7dGhlJiMzMjtwbGFuZSYjMzI7YWxwaGEmIzMyO2FjY29yZGluZyYjMzI7dG8mIzMy
O0RSTSYjMzI7cGxhbmUmIzMyO3Byb3BlcnR5Lg0KDQpSZXZpZXdlZC1ieTomIzMyO0NLJiMzMjtI
dSYjMzI7Jmx0O2NrLmh1QG1lZGlhdGVrLmNvbSZndDsNCg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtT
aWduZWQtb2ZmLWJ5OiYjMzI7SHNpYW8mIzMyO0NoaWVuJiMzMjtTdW5nJiMzMjsmbHQ7c2hhd24u
c3VuZ0BtZWRpYXRlay5jb20mZ3Q7DQomZ3Q7JiMzMjstLS0NCiZndDsmIzMyOyYjMzI7ZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19ldGhkci5jJiMzMjt8JiMzMjs2JiMzMjsrKysrLS0NCiZn
dDsmIzMyOyYjMzI7MSYjMzI7ZmlsZSYjMzI7Y2hhbmdlZCwmIzMyOzQmIzMyO2luc2VydGlvbnMo
KyksJiMzMjsyJiMzMjtkZWxldGlvbnMoLSkNCiZndDsmIzMyOw0KJmd0OyYjMzI7ZGlmZiYjMzI7
LS1naXQmIzMyO2EvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19ldGhkci5jJiMzMjtiL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZXRoZHIuYw0KJmd0OyYjMzI7aW5kZXgmIzMyOzkw
MmRlYzAzYTdkZC4uN2VhYWZkNDRmMzIwJiMzMjsxMDA2NDQNCiZndDsmIzMyOy0tLSYjMzI7YS9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2V0aGRyLmMNCiZndDsmIzMyOysrKyYjMzI7Yi9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2V0aGRyLmMNCiZndDsmIzMyO0BAJiMzMjstMTcw
LDgmIzMyOysxNzAsMTAmIzMyO0BAJiMzMjt2b2lkJiMzMjttdGtfZXRoZHJfbGF5ZXJfY29uZmln
KHN0cnVjdCYjMzI7ZGV2aWNlJiMzMjsqZGV2LCYjMzI7dW5zaWduZWQmIzMyO2ludCYjMzI7aWR4
LA0KJmd0OyYjMzI7JiMzMjtyZXR1cm47DQomZ3Q7JiMzMjsmIzMyO30NCiZndDsmIzMyOyYjMzI7
DQomZ3Q7JiMzMjstaWYmIzMyOyhzdGF0ZS0mZ3Q7YmFzZS5mYiYjMzI7JmFtcDsmYW1wOyYjMzI7
c3RhdGUtJmd0O2Jhc2UuZmItJmd0O2Zvcm1hdC0mZ3Q7aGFzX2FscGhhKQ0KJmd0OyYjMzI7LWFs
cGhhX2NvbiYjMzI7PSYjMzI7TUlYRVJfQUxQSEFfQUVOJiMzMjt8JiMzMjtNSVhFUl9BTFBIQTsN
CiZndDsmIzMyOytpZiYjMzI7KHN0YXRlLSZndDtiYXNlLmZiKSYjMzI7ew0KJmd0OyYjMzI7K2Fs
cGhhX2NvbiYjMzI7fD0mIzMyO01JWEVSX0FMUEhBX0FFTjsNCiZndDsmIzMyOythbHBoYV9jb24m
IzMyO3w9JiMzMjtzdGF0ZS0mZ3Q7YmFzZS5hbHBoYSYjMzI7JmFtcDsmIzMyO01JWEVSX0FMUEhB
Ow0KJmd0OyYjMzI7K30NCiZndDsmIzMyOyYjMzI7DQomZ3Q7JiMzMjsmIzMyO2lmJiMzMjsoc3Rh
dGUtJmd0O2Jhc2UuZmImIzMyOyZhbXA7JmFtcDsmIzMyOyFzdGF0ZS0mZ3Q7YmFzZS5mYi0mZ3Q7
Zm9ybWF0LSZndDtoYXNfYWxwaGEpJiMzMjt7DQomZ3Q7JiMzMjsmIzMyOy8qDQoNCjwvcHJlPg0K
PC9wPjwvYm9keT48L2h0bWw+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioq
KioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioqKioqKioqKioN
ClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVk
aW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwg
cHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFw
cGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRvIHRo
ZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0
cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAo
aW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBp
cyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBu
b3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlIA0KdGhh
dCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0
aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVs
ZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0
dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29u
dGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3By
ZT48IS0tfS0tPg==

--__=_Part_Boundary_008_1473002291.387438273--

