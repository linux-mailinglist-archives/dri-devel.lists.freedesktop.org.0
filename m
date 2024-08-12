Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D0F94E659
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 08:02:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04E0710E0CF;
	Mon, 12 Aug 2024 06:02:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="QhOZ4Pd0";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="wPoItWX0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD1E610E0CF
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 06:02:36 +0000 (UTC)
X-UUID: 74acc302587011ef87684b57767b52b1-20240812
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=ie/x3FMMSQuefDQpMxApuTcBuOFBtzPRUXjsWhlzYu4=; 
 b=QhOZ4Pd0gmUe0KpZv35EU403Z1S4YqkUNZ4WOd9oqHifBLNnL4tu5eyfUl8GQOuHVz4MRfBJmvsYOMzBQbDqyNdtQZeUezNgQwfI1hodhnPFBGPI/QTkc4bSYOKdooiLBcU77HfMuB/gHNxA9KCaS1vxbyrWzC25SDUJpcOzjvk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41, REQID:f688038b-6b4f-4f07-a35d-63003ab42970, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6dc6a47, CLOUDID:5c250c3e-6aa5-4057-84d5-0e7d47251781,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 74acc302587011ef87684b57767b52b1-20240812
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 425026136; Mon, 12 Aug 2024 14:02:28 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 12 Aug 2024 14:02:26 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Mon, 12 Aug 2024 14:02:25 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QW9OEJ1S8jUVS9esVn3imNJmQv5PyOq4TQ75gRDfPP+MybZI2P7lUmquWGekvZOZFWYiYojoRw7ho7bgE0fVDHYyPTSW19rdRFmcuL+crUryxRIRGaCUiAEXTBM+KZvA4JxXDcRob49kvRvtpH1QwOOgNn0UDJehMDjpsNajc2tMhreAIj1yUflyNDSNDX3afz8q3Xzu1k6XSTO32ZHPtrcmMat9h8xRJBMkDscI0HwUAFkqYVTuqjpnOpWS5NJuXGv65YWqxBOB2JXxi0eqCN28HIl/TsGk8qPfCE4DUjWa1xR2eVwZGvx8MEnXbzjEEtiubgDvwZcQCxtlTvLvMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dYdyAtc/MyvCLSN3R26Bja966sRNFVQHSrHry7nJkUA=;
 b=VN05UG6uqm21PTtcQln6jfY+Ug2Tn8JsAAFYgJ7u6G9O9CnqFaNfj4ZFoY7Fh8exPxghm6Q7aCHCWoCDxCWooVDKtinxh63jCcQBPKU1wz/MzG3BBRYF71e5lby5QNXRNwQUAG5Fb/0Hzz27XUqdSKWLVZpaENz01PGL1RdsGGkM0KC73Z6AykWzwnCa3gHrDwjbHcvVmOQmtjrJevmmsi3HQJxW0i0fvoNKZ1unJvNqw3QPhRoMv4gbjBla0Qz0KCBzqcKp9Vnh1tzdiIfRNsZf/9qpHjJqm7pJsUndTSlAAkiXDYo4Zha8iBvYv3Ubf2pH+4mdC83LQMPRbFCrpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dYdyAtc/MyvCLSN3R26Bja966sRNFVQHSrHry7nJkUA=;
 b=wPoItWX0JKymq0b29Vahs5GDn7YeVzaTEmfzyYaUsrG58uT34/KoRyd2AygBCXQxb/XpYg8oQp4eDHKLY2P5b8l8c3PDLeXL+tQMmMGL0ACMGQVVO67/GDZZwCBfbxtdUtV5u4VnAFRyVHPUqFcZo+0hwpr69MIPoBVo5ug6Iko=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB6672.apcprd03.prod.outlook.com (2603:1096:400:1f0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.19; Mon, 12 Aug
 2024 06:02:22 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.7849.019; Mon, 12 Aug 2024
 06:02:22 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "javier.carrasco.cruz@gmail.com" <javier.carrasco.cruz@gmail.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 3/3] drm/mediatek: ovl_adaptor: use scoped variant of
 for_each_child_of_node()
Thread-Topic: [PATCH 3/3] drm/mediatek: ovl_adaptor: use scoped variant of
 for_each_child_of_node()
Thread-Index: AQHaxlXJ3QTpO0d/4UWp7aZGW8/ODLIjbbkA
Date: Mon, 12 Aug 2024 06:02:22 +0000
Message-ID: <d00fe6d1b49caf86949afe4b849dd1b4af3a287b.camel@mediatek.com>
References: <20240624-mtk_disp_ovl_adaptor_scoped-v1-0-9fa1e074d881@gmail.com>
 <20240624-mtk_disp_ovl_adaptor_scoped-v1-3-9fa1e074d881@gmail.com>
In-Reply-To: <20240624-mtk_disp_ovl_adaptor_scoped-v1-3-9fa1e074d881@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB6672:EE_
x-ms-office365-filtering-correlation-id: 1bf5dd2e-3997-4687-d68f-08dcba94552f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?N2FvcnExSExXYzg4YWhsaVFtcTUwRGV5Y2FRU0Q4THlsVWx4L1ZSSzdtNXF3?=
 =?utf-8?B?T05laEI4YWNqajZGS2pBTDVVOTV5cStFZkRJOS9MYnJoT1dMUnpEYkFuam1I?=
 =?utf-8?B?aXhvSk11TFE2elNCc3A2MXJBME5Pc1EwNjRELzc1enhGOUtxMEhoNlVhR3lh?=
 =?utf-8?B?Tk9yTHA1aGhwdlIxdnkrOHU3ajVjT0hJdFVXT0pZSWp3eDdHTWhwaENwVVIr?=
 =?utf-8?B?Q2NNeDZ6S3gxcFVwWE13dDZnNUFCdmxrSTVNakdGdm1SK1FvYnR5MzdWVEda?=
 =?utf-8?B?YktQdVVkcUFCWkJ0emxFd0FZcDFCeEY2U3hWK01wMWlVM0JWdHJaRWFCQkdl?=
 =?utf-8?B?ZWpzeFlBZUhYK0RjZ1RsdkJ3M3A3SkU3SEZ5c29rU2ZSLzdBMDRiaUlLQllj?=
 =?utf-8?B?aG9iYXJlekVzSzQ3dzFHRGsxRzlGYjR5OHYxZ2EyUmZyMlRyNTdVSUhwTWRx?=
 =?utf-8?B?QUxGVlZhM1Q4TFJmQ0xYZmFMWDlUUm9iMm5uQjQwSWVMczBlKzBIb1ZnMjZD?=
 =?utf-8?B?cExtbWpBZEM2aFRPOGMzNU4yMitHOFBWNzRRZEc3Uk0ydjhyT2ZrMzJ1OEg2?=
 =?utf-8?B?UUN5RDZHR2dUVjhKZHRzS1hXMThwbnluS2YwZkJsdmlnQzY4MFVrU2l2THdp?=
 =?utf-8?B?cFRtU0Q5SkVEaDJCMitJdGZIQTNxN1lXd2tYeUNCb0tIYjJUUWFwNmxnbTVF?=
 =?utf-8?B?K3RSQUxXaDFOcUh5MW44Wk11WGpuWWg5d2I3VlkxT0RQSjBRNXVoTGFrbEY5?=
 =?utf-8?B?alRMQ21sVzd0YTNPeVlBMXR1SnNyV3F0Nmg3NGJYRFR5NVVkZHhwbGliaDhH?=
 =?utf-8?B?cVpodFhQYzdIQnZjL2xaOFBnb2lnTVNzWCtNSUNYc3ZpWHc3b0dMR2VWT3BL?=
 =?utf-8?B?Ym82WmtRV2pJbFY5U2V5czRZWUZ5cGp3RGxzK2VHdWNHSWtpaUFMZ2hPY1Ez?=
 =?utf-8?B?QWF6eFNwZS9pdENHSzRrZ3JSZ3ZzV3ZCU2Fxdit0VW1RRlhJVWwraE5CZXBs?=
 =?utf-8?B?YXhMYWY2bmhtaXFITGdRRWMxRGFLUGM4VnNaUkM4enZmZktzVk9LbW1sekM4?=
 =?utf-8?B?YWVLN1BWV2o3c0lDRGszNjdUQU4zTE1vYlQvUUg5QTUwekIzcFB6M2tRR3FD?=
 =?utf-8?B?TjdrTHZYZ05rTDIyR3hMeTBjQlcrWmRUcUxsbG1tZ1hqTWNxa2pwMWVhNVAr?=
 =?utf-8?B?QnlBY0p2Z2pxb1k1U1BaQ0tYYitXSmpHaDczK1VuUFE4eWVQaWdvOTdlTkxo?=
 =?utf-8?B?MXhDNTFiTnNhSUN6UmJsR21MeFBWam0rb1QwbG85NW10TXN6dnNOeDlaWndx?=
 =?utf-8?B?MTNXYnRMREpKMUYySVJUa2pMMXloMjdDMlhwZDNWU2x6S2pPYXdwTVMzVmlU?=
 =?utf-8?B?aHJ0ZW9LMERPNllTTWhmU0paL1lJS3A4czFuTjJqdHdTVGk1aVhFaVVPUUZa?=
 =?utf-8?B?VzhlYTQ5MXFVRGRkSllodGkyMmk2ZjVuQ1o5VzlaaFk2L0swMGF3VjB0dEhE?=
 =?utf-8?B?V0RSUHRXcHplUXdINkhVZUJNYTVOWHRlTDljVHVKSHVoS0RJZll5N3kzeDhR?=
 =?utf-8?B?a1dnZ2hyTFFtU2svVUJ2cy9HSERHUjY2NXFCY1hSdHNONnNyM2xvQ2VHTU1N?=
 =?utf-8?B?NmIrZml4K1REQTY1bDcyL0FnRG9DRXVHMDFLWVFsVllicUJsL2J4KzltWHVD?=
 =?utf-8?B?bXBOTm91TXJJbEVsVFRsS0lZdUhBTkprWnFPWUJxUXpta1VyZzdNZUdqakhx?=
 =?utf-8?B?ZHlaOHBheFVBL1dLc0ViRjlKclNUbzNSblJWSUY0bWppZE9uT3RIQ3Z5d3RS?=
 =?utf-8?Q?ocaytoHsyWHDsvVPKBR3RjiRf2Gw0vzmamSzA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dE1FVm1WMEVpemVYTXM5MXRHdUxjbDF6c01xT295WWppU1lOejlLQ0ljN3hD?=
 =?utf-8?B?U0psUy9wNFNMaE1WdzdlNHhpTEZBNEVKTlMzaUI3V2FiWTlIK1lsNm94TVZS?=
 =?utf-8?B?RTdqZTExTytDcktoL3lOYUNSWWlrZnpsM2lWRWV5cUo3Z2w0emhVbkJ3MEFo?=
 =?utf-8?B?RDZHa0dzUmROYlRlUlY1aTVPZHRDbElGZHRZV21VdlBLZDRHb3lEeTI3dVdR?=
 =?utf-8?B?ZmZIaisxWmVKcVZoUXhWbEgrVUowNitVaStLYS9WRUlrMU9sZEVPckt0TkFE?=
 =?utf-8?B?UklLOUNMKyt4dzAyYWhZNDJnYllHOUxrVVdKU1VlRTFiSEVrUVc0SGlrZEZ6?=
 =?utf-8?B?Qjdncmk1SGhSaWdueXJObCswWHhqNHNJdzRFZUoxeXZ6UlhLY2Zjcy9qc3Iz?=
 =?utf-8?B?NFgybWVTK1BZRmJNakQ3WUZ3K2RHc3pZOVd1Ykl1dU5kUzc4N3R5NlZTWW1V?=
 =?utf-8?B?enAxM1FSQ1k3Z1FxbG03SWNhYitkOFUra3NKbkQ2SVNXcEZGMmNVZlFKRFdv?=
 =?utf-8?B?d05McGJlMFUyTmZmUk1sRkUrM05ZQ2wrdFlZdlJLcG56Z05VWlo1eCtwQjBl?=
 =?utf-8?B?N0tQQS9qWmVUYklOMEJKM2JaWHpoRExiUXVMampDNFBHbGFqek9GaUpwekVX?=
 =?utf-8?B?OXAxa05lY0NMcEhQbEY1RnhNeXRTSjFlSlBNVTdYRGwzSHQzbDMyTTREcUJ5?=
 =?utf-8?B?cDVoYkZsSDU0citJS0pLSFlQQldBOU1CTUN6cGxMVk9KS0NqYjFQakU1UXRF?=
 =?utf-8?B?QjAxY1YwZXpZN3BDUUJmR0ZBUTVPMXVka1BMNkZPS2pmQVBsK1I5b284MDZG?=
 =?utf-8?B?dGlwL25GMEw0bmhON0VGK2UvYVUxV3Jjci9vQy9uUi9sT1hCRUYza1M3R0dV?=
 =?utf-8?B?em5sY0FOZis2TG9TY2d6enpSa2FQUmQxd1pnZCtiZkxpTjV1L1Y1WWhSMXdy?=
 =?utf-8?B?WWZOMzA2Wi9xYStjOHM5Y3A2aE0vMUZKREE0OGhWb1BZYlh1Szdpa1lnVXRX?=
 =?utf-8?B?QkRza2t4ZWRSN3hpa3VidUlaRFV6cmhJTUpqKzlwMzdaU0xEdU1zU0I5M1pk?=
 =?utf-8?B?d24rNm80bm52UHB4VnMwQW1kY3gzTndpOWVMdzlxVkF6MlRtY2l0SFZBcERw?=
 =?utf-8?B?NE5ubkFnS0E4cXhnUXN0cXEwVnNiSzJoWGhKQkVzQ3lpRFNONmtGTHp4SVY4?=
 =?utf-8?B?VWtLeXNWSU9PQzQyQ2pVM2Z3UlhqVVY3RGNGSENJUmRvZjVQU3Nidi9XcG5m?=
 =?utf-8?B?TW54T0lDWEZqZjlsRmxBbFM4MXIvZFBaMUZkYmpEUVBiUUpWcTNJK0NtUmxp?=
 =?utf-8?B?dFd5L09YSnRBQU90cjBXajc3TEIvVkJkdVdlRUdPelI2cVJwVW90TUJVOC82?=
 =?utf-8?B?TEZMWHFDcjdlS2xPeEdTWUFNZUV4cHJ1cVJMdE9RSTFXSDdCYVVmWkV6cFZ5?=
 =?utf-8?B?MlMvV0I2azd6M2RaeUQrN0xIZWhEelg5TDduaFFVOUlhSUxkNEdQUlFOV3ZM?=
 =?utf-8?B?TkZoNUlGbEozNC9NQTJaT3RCMC9lU1M3M1JNb3ZjU2JRSlNGcmlDZlBWWEVW?=
 =?utf-8?B?ekpaOU5MWmczQVBwd2RpY1oyQ28xdGwzdWh5QVQrcm5sV3ZUaUd5UEkwQzVQ?=
 =?utf-8?B?dWlwRkVTWk9MNFl6M2xOcUxxWUFsa3pPbEFLdTlJVmRLWUxZMVlRN05yVFg5?=
 =?utf-8?B?TWNsclNKZXh2YVFLL1Q5dVJOTmJ6UFJ0UExhQ0oveWlFSXNqUDQ3c0RrSC9L?=
 =?utf-8?B?VE9waDhuRUFuWmVEZnFWc3B6aEZqWVR5NzRWbUphODh5YnRmYzN6bE9kK2Fi?=
 =?utf-8?B?YVhEdS9BR1FZNWZTcXpQVUV5VSs3dDBHOVo0KzRyWkxaVEVJL3F0MlZ3Vkhm?=
 =?utf-8?B?UldhV1lzTVd5NDNiS1V0VTdJQVBOQUo2VlJsaXBjT2VydVl4dUlhZlM3clFk?=
 =?utf-8?B?c0lTemkyb2s1bFNSanZDVlNwM20vMnU4S2dwSUxKWWJ2STV0TEhNd0ZIdmtS?=
 =?utf-8?B?cVFiNGtvd0lJN2xsc0Q4eEUvbUZRTDBKdUtJS1JQMTJ5bkxPaE9HVE93ZS80?=
 =?utf-8?B?WGNldmJKV0QzKzBaRUVoOFpBaFVaRDFBNWlkaVpBeFhFeUtVa1p5YTdvQzlk?=
 =?utf-8?Q?+FJE2F3bFFmiTAGK9FJES9vWs?=
Content-ID: <DD3722133B3C634585F74724326081F3@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bf5dd2e-3997-4687-d68f-08dcba94552f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2024 06:02:22.6834 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pVBVxCn2DSJOS8b6ZhXdgFMWbGVIGad4BcO4a9cULPVBdYBmTYPrlr0ZDeoHy5SQx+lYjijbyNLCxpzz7FnR6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6672
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--18.594100-8.000000
X-TMASE-MatchedRID: VPleTT1nwdT4OiVTWoD8RAO6RQiVjr6mjLOy13Cgb4/n0eNPmPPe5KWz
 WoIRiV9DM/Se/q/gEyf5MiS7M8c1eGmXMi7Ntyo2RsqQuQlRTh/DHSNFHFxB88UmcSma304TFER
 dnCEO4XEwUXvzn8RoTGp8RlREs2NnPCKP9KRK0eZDiyuN5FvFNkyQ5fRSh265CqIJhrrDy29ynC
 +RoYX/O+LzNWBegCW2PZex/kxUIHW3sNbcHjySQd0H8LFZNFG7bkV4e2xSge5BOW7VJmfrcz7bV
 hI/9cpOFE+6S0CCVZb5xKQwACwUq2gGZNLBHGNe
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--18.594100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: CE9C3F4204581B653534381A74DAAF31E766F9B155409BEC22299EF2AC794D032000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_005_762723839.247445825"
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

--__=_Part_Boundary_005_762723839.247445825
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEphdmllcjoNCg0KT24gTW9uLCAyMDI0LTA2LTI0IGF0IDE4OjQzICswMjAwLCBKYXZpZXIg
Q2FycmFzY28gd3JvdGU6DQo+ICAJIA0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3Qg
Y2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bnRpbCB5b3UgaGF2ZSB2ZXJpZmllZCB0
aGUgc2VuZGVyIG9yIHRoZSBjb250ZW50Lg0KPiAgSW4gb3JkZXIgdG8gYXZvaWQgcG90ZW50aWFs
IG1lbW9yeSBsZWFrcyBpZiBuZXcgZXJyb3IgcGF0aHMgYXJlIGFkZGVkDQo+IHdpdGhvdXQgYSBj
YWxsIHRvIG9mX25vZGVfcHV0KCksIHVzZSBmb3JfZWFjaF9jaGlsZF9vZl9ub2RlX3Njb3BlZCgp
DQo+IGluc3RlYWQgb2YgZm9yX2VhY2hfY2hpbGRfb2Zfbm9kZSgpLiBUaGUgZm9ybWVyIGF1dG9t
YXRpY2FsbHkgZGVjcmVtZW50cw0KPiB0aGUgcmVmY291bnQgd2hlbiB0aGUgY2hpbGQgZ29lcyBv
dXQgb2Ygc2NvcGUsIHdoaWNoIHJlbW92ZXMgdGhlIG5lZWQNCj4gZm9yIGV4cGxpY2l0IGNhbGxz
IHRvIG9mX25vZGVfcHV0KCkuDQoNClJldmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsu
Y29tPg0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKYXZpZXIgQ2FycmFzY28gPGphdmllci5jYXJy
YXNjby5jcnV6QGdtYWlsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2Rpc3Bfb3ZsX2FkYXB0b3IuYyB8IDggKysrLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bF9hZGFwdG9yLmMgYi9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsX2FkYXB0b3IuYw0KPiBpbmRleCAzZmFmMjZhNTVlNzcu
LmFlYzkyN2NjZTQ2OCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kaXNwX292bF9hZGFwdG9yLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kaXNwX292bF9hZGFwdG9yLmMNCj4gQEAgLTQ5MywxMiArNDkzLDEyIEBAIHN0YXRpYyBpbnQg
Y29tcGFyZV9vZihzdHJ1Y3QgZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEpDQo+ICBzdGF0aWMgaW50
IG92bF9hZGFwdG9yX2NvbXBfaW5pdChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBjb21wb25l
bnRfbWF0Y2ggKiptYXRjaCkNCj4gIHsNCj4gIHN0cnVjdCBtdGtfZGlzcF9vdmxfYWRhcHRvciAq
cHJpdiA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOw0KPiAtc3RydWN0IGRldmljZV9ub2RlICpub2Rl
LCAqcGFyZW50Ow0KPiArc3RydWN0IGRldmljZV9ub2RlICpwYXJlbnQ7DQo+ICBzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpjb21wX3BkZXY7DQo+ICANCj4gIHBhcmVudCA9IGRldi0+cGFyZW50LT5w
YXJlbnQtPm9mX25vZGUtPnBhcmVudDsNCj4gIA0KPiAtZm9yX2VhY2hfY2hpbGRfb2Zfbm9kZShw
YXJlbnQsIG5vZGUpIHsNCj4gK2Zvcl9lYWNoX2NoaWxkX29mX25vZGVfc2NvcGVkKHBhcmVudCwg
bm9kZSkgew0KPiAgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCAqb2ZfaWQ7DQo+ICBlbnVtIG10
a19vdmxfYWRhcHRvcl9jb21wX3R5cGUgdHlwZTsNCj4gIGludCBpZDsNCj4gQEAgLTUyMiwxMCAr
NTIyLDggQEAgc3RhdGljIGludCBvdmxfYWRhcHRvcl9jb21wX2luaXQoc3RydWN0IGRldmljZSAq
ZGV2LCBzdHJ1Y3QgY29tcG9uZW50X21hdGNoICoqbWENCj4gIH0NCj4gIA0KPiAgY29tcF9wZGV2
ID0gb2ZfZmluZF9kZXZpY2VfYnlfbm9kZShub2RlKTsNCj4gLWlmICghY29tcF9wZGV2KSB7DQo+
IC1vZl9ub2RlX3B1dChub2RlKTsNCj4gK2lmICghY29tcF9wZGV2KQ0KPiAgcmV0dXJuIC1FUFJP
QkVfREVGRVI7DQo+IC19DQo+ICANCj4gIHByaXYtPm92bF9hZGFwdG9yX2NvbXBbaWRdID0gJmNv
bXBfcGRldi0+ZGV2Ow0KPiAgDQo+IA0KPiAtLSANCj4gMi40MC4xDQo+IA0K

--__=_Part_Boundary_005_762723839.247445825
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtKYXZpZXI6DQoNCk9uJiMzMjtNb24sJiMz
MjsyMDI0LTA2LTI0JiMzMjthdCYjMzI7MTg6NDMmIzMyOyswMjAwLCYjMzI7SmF2aWVyJiMzMjtD
YXJyYXNjbyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjsmIzMyOyYjMzI7DQomZ3Q7JiMzMjtFeHRlcm5h
bCYjMzI7ZW1haWwmIzMyOzomIzMyO1BsZWFzZSYjMzI7ZG8mIzMyO25vdCYjMzI7Y2xpY2smIzMy
O2xpbmtzJiMzMjtvciYjMzI7b3BlbiYjMzI7YXR0YWNobWVudHMmIzMyO3VudGlsJiMzMjt5b3Um
IzMyO2hhdmUmIzMyO3ZlcmlmaWVkJiMzMjt0aGUmIzMyO3NlbmRlciYjMzI7b3ImIzMyO3RoZSYj
MzI7Y29udGVudC4NCiZndDsmIzMyOyYjMzI7SW4mIzMyO29yZGVyJiMzMjt0byYjMzI7YXZvaWQm
IzMyO3BvdGVudGlhbCYjMzI7bWVtb3J5JiMzMjtsZWFrcyYjMzI7aWYmIzMyO25ldyYjMzI7ZXJy
b3ImIzMyO3BhdGhzJiMzMjthcmUmIzMyO2FkZGVkDQomZ3Q7JiMzMjt3aXRob3V0JiMzMjthJiMz
MjtjYWxsJiMzMjt0byYjMzI7b2Zfbm9kZV9wdXQoKSwmIzMyO3VzZSYjMzI7Zm9yX2VhY2hfY2hp
bGRfb2Zfbm9kZV9zY29wZWQoKQ0KJmd0OyYjMzI7aW5zdGVhZCYjMzI7b2YmIzMyO2Zvcl9lYWNo
X2NoaWxkX29mX25vZGUoKS4mIzMyO1RoZSYjMzI7Zm9ybWVyJiMzMjthdXRvbWF0aWNhbGx5JiMz
MjtkZWNyZW1lbnRzDQomZ3Q7JiMzMjt0aGUmIzMyO3JlZmNvdW50JiMzMjt3aGVuJiMzMjt0aGUm
IzMyO2NoaWxkJiMzMjtnb2VzJiMzMjtvdXQmIzMyO29mJiMzMjtzY29wZSwmIzMyO3doaWNoJiMz
MjtyZW1vdmVzJiMzMjt0aGUmIzMyO25lZWQNCiZndDsmIzMyO2ZvciYjMzI7ZXhwbGljaXQmIzMy
O2NhbGxzJiMzMjt0byYjMzI7b2Zfbm9kZV9wdXQoKS4NCg0KUmV2aWV3ZWQtYnk6JiMzMjtDSyYj
MzI7SHUmIzMyOyZsdDtjay5odUBtZWRpYXRlay5jb20mZ3Q7DQoNCiZndDsmIzMyOw0KJmd0OyYj
MzI7U2lnbmVkLW9mZi1ieTomIzMyO0phdmllciYjMzI7Q2FycmFzY28mIzMyOyZsdDtqYXZpZXIu
Y2FycmFzY28uY3J1ekBnbWFpbC5jb20mZ3Q7DQomZ3Q7JiMzMjstLS0NCiZndDsmIzMyOyYjMzI7
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bF9hZGFwdG9yLmMmIzMyO3wmIzMy
OzgmIzMyOysrKy0tLS0tDQomZ3Q7JiMzMjsmIzMyOzEmIzMyO2ZpbGUmIzMyO2NoYW5nZWQsJiMz
MjszJiMzMjtpbnNlcnRpb25zKCspLCYjMzI7NSYjMzI7ZGVsZXRpb25zKC0pDQomZ3Q7JiMzMjsN
CiZndDsmIzMyO2RpZmYmIzMyOy0tZ2l0JiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZGlzcF9vdmxfYWRhcHRvci5jJiMzMjtiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZGlzcF9vdmxfYWRhcHRvci5jDQomZ3Q7JiMzMjtpbmRleCYjMzI7M2ZhZjI2YTU1ZTc3Li5hZWM5
MjdjY2U0NjgmIzMyOzEwMDY0NA0KJmd0OyYjMzI7LS0tJiMzMjthL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZGlzcF9vdmxfYWRhcHRvci5jDQomZ3Q7JiMzMjsrKysmIzMyO2IvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bF9hZGFwdG9yLmMNCiZndDsmIzMyO0BAJiMz
MjstNDkzLDEyJiMzMjsrNDkzLDEyJiMzMjtAQCYjMzI7c3RhdGljJiMzMjtpbnQmIzMyO2NvbXBh
cmVfb2Yoc3RydWN0JiMzMjtkZXZpY2UmIzMyOypkZXYsJiMzMjt2b2lkJiMzMjsqZGF0YSkNCiZn
dDsmIzMyOyYjMzI7c3RhdGljJiMzMjtpbnQmIzMyO292bF9hZGFwdG9yX2NvbXBfaW5pdChzdHJ1
Y3QmIzMyO2RldmljZSYjMzI7KmRldiwmIzMyO3N0cnVjdCYjMzI7Y29tcG9uZW50X21hdGNoJiMz
MjsqKm1hdGNoKQ0KJmd0OyYjMzI7JiMzMjt7DQomZ3Q7JiMzMjsmIzMyO3N0cnVjdCYjMzI7bXRr
X2Rpc3Bfb3ZsX2FkYXB0b3ImIzMyOypwcml2JiMzMjs9JiMzMjtkZXZfZ2V0X2RydmRhdGEoZGV2
KTsNCiZndDsmIzMyOy1zdHJ1Y3QmIzMyO2RldmljZV9ub2RlJiMzMjsqbm9kZSwmIzMyOypwYXJl
bnQ7DQomZ3Q7JiMzMjsrc3RydWN0JiMzMjtkZXZpY2Vfbm9kZSYjMzI7KnBhcmVudDsNCiZndDsm
IzMyOyYjMzI7c3RydWN0JiMzMjtwbGF0Zm9ybV9kZXZpY2UmIzMyOypjb21wX3BkZXY7DQomZ3Q7
JiMzMjsmIzMyOw0KJmd0OyYjMzI7JiMzMjtwYXJlbnQmIzMyOz0mIzMyO2Rldi0mZ3Q7cGFyZW50
LSZndDtwYXJlbnQtJmd0O29mX25vZGUtJmd0O3BhcmVudDsNCiZndDsmIzMyOyYjMzI7DQomZ3Q7
JiMzMjstZm9yX2VhY2hfY2hpbGRfb2Zfbm9kZShwYXJlbnQsJiMzMjtub2RlKSYjMzI7ew0KJmd0
OyYjMzI7K2Zvcl9lYWNoX2NoaWxkX29mX25vZGVfc2NvcGVkKHBhcmVudCwmIzMyO25vZGUpJiMz
Mjt7DQomZ3Q7JiMzMjsmIzMyO2NvbnN0JiMzMjtzdHJ1Y3QmIzMyO29mX2RldmljZV9pZCYjMzI7
Km9mX2lkOw0KJmd0OyYjMzI7JiMzMjtlbnVtJiMzMjttdGtfb3ZsX2FkYXB0b3JfY29tcF90eXBl
JiMzMjt0eXBlOw0KJmd0OyYjMzI7JiMzMjtpbnQmIzMyO2lkOw0KJmd0OyYjMzI7QEAmIzMyOy01
MjIsMTAmIzMyOys1MjIsOCYjMzI7QEAmIzMyO3N0YXRpYyYjMzI7aW50JiMzMjtvdmxfYWRhcHRv
cl9jb21wX2luaXQoc3RydWN0JiMzMjtkZXZpY2UmIzMyOypkZXYsJiMzMjtzdHJ1Y3QmIzMyO2Nv
bXBvbmVudF9tYXRjaCYjMzI7KiptYQ0KJmd0OyYjMzI7JiMzMjt9DQomZ3Q7JiMzMjsmIzMyOw0K
Jmd0OyYjMzI7JiMzMjtjb21wX3BkZXYmIzMyOz0mIzMyO29mX2ZpbmRfZGV2aWNlX2J5X25vZGUo
bm9kZSk7DQomZ3Q7JiMzMjstaWYmIzMyOyghY29tcF9wZGV2KSYjMzI7ew0KJmd0OyYjMzI7LW9m
X25vZGVfcHV0KG5vZGUpOw0KJmd0OyYjMzI7K2lmJiMzMjsoIWNvbXBfcGRldikNCiZndDsmIzMy
OyYjMzI7cmV0dXJuJiMzMjstRVBST0JFX0RFRkVSOw0KJmd0OyYjMzI7LX0NCiZndDsmIzMyOyYj
MzI7DQomZ3Q7JiMzMjsmIzMyO3ByaXYtJmd0O292bF9hZGFwdG9yX2NvbXBbaWRdJiMzMjs9JiMz
MjsmYW1wO2NvbXBfcGRldi0mZ3Q7ZGV2Ow0KJmd0OyYjMzI7JiMzMjsNCiZndDsmIzMyOw0KJmd0
OyYjMzI7LS0mIzMyOw0KJmd0OyYjMzI7Mi40MC4xDQomZ3Q7JiMzMjsNCg0KPC9wcmU+DQo8L3A+
PC9ib2R5PjwvaHRtbD48IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioqKioqKiog
TUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZSAqKioqKioqKioqKioqKioqKioqKg0KVGhl
IGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcg
YW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2
aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGlj
YWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRl
c2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1
dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNs
dWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0
cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBh
biBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUgDQp0aGF0IHlv
dSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBz
ZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUg
YW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwgKGluY2x1ZGluZyBhbnkgYXR0YWNo
bWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50
IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24uIFRoYW5rIHlvdSENCjwvcHJlPjwh
LS19LS0+

--__=_Part_Boundary_005_762723839.247445825--

