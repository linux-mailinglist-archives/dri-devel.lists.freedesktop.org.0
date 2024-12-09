Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20ECF9E8E65
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 10:09:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6F0510E047;
	Mon,  9 Dec 2024 09:09:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="ptf4Tkmp";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="e7tciIeZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EED5110E047
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 09:09:34 +0000 (UTC)
X-UUID: 4169b892b60d11efbd192953cf12861f-20241209
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=OLZabMnY2/gzmGrnEhgZQofCxuCM4nVcEhy0cHWgPiU=; 
 b=ptf4TkmpqyiIdLZUVZ7B/2ZAbYX38Z+XBzVeUi7eRnkdUEajXZLOr/x/eKGTVPp3PWmrlWB+3AJa7PQohjD4/Ea3SYd3lQVlLJwXnbGVMgOiqcFscy7i24iV5aGN+EAMWGnAJUjdQ56c1FrVzQ6ksc/ff6DAjomS74WZX8ER2v0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45, REQID:7fb36d8e-2c07-4c20-9bba-909dba9b6e2a, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6493067, CLOUDID:8260aa3b-e809-4df3-83cd-88f012b9e9ba,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
 :-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
 ,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 4169b892b60d11efbd192953cf12861f-20241209
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1983328994; Mon, 09 Dec 2024 17:09:12 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 9 Dec 2024 17:09:10 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Mon, 9 Dec 2024 17:09:10 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ww9zWalflSRgRprMI3FYLVYKoe54AOPmNEV4uoxQSklJawMOofgJ8h+mWzlmbOLLGm/ZRGzp5CfGKopPvM7jkmeH4bURmw+x7svDT44zjzJUIo9O1S+IcVWa/lFAAWPxm7Yloi/L0rmDQiKCrTgb5oQV0HJj4KCMsOJzVHqOeJyBFSoxiCVX1v6bslTSmYFZXqJP7F4NstQ0+z+WALGxyTFwzLOvtU+qMMMStnkar7t1N+6Xcuj6x1qn4Zm1G3MUkUH0cymz0ozKJVh2YJjyNwPu/6kaneXkjT9AWYb1nacxaPw/veOGaEy0n2kKdotNyllqk3GEvFISJZNwp6BPvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bWfwm9Zgm/v0lrY39yo2HAO7uOpofyDvaSRtdn95hSg=;
 b=IF9IL4E333iid8LFyTQ2kMtLHAlKGBQmfq3IBXoRaGtIK5BwJyKQjLhalzAhdn4KfXp9WNJ48YpFZ3r4YfnzCID5+J8m8DJaoy1zh8nMmb2akPVf1+XVCaEzaVrZ6aaNe7BaoOsz+jexEtCSbeGn7w5kl3tHAaukyU/UAXtfdWqI3QzClqv3ekg8mUQrjnBc/MV1rrNragCXq+++1/XB2T9BUgyUoxAGMp6jkqhlNimjTTFpBzaA2i20sZdD+DTzR5NbbesKZghQvQZ06ijJgG3yY+VorjnAifgAf5PfICi8OEs9jAfvgE3G14YPujIQ7kDmm8G/P7POwu2f74sOrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bWfwm9Zgm/v0lrY39yo2HAO7uOpofyDvaSRtdn95hSg=;
 b=e7tciIeZ63kr7cIPcUd8LRPMCaoMo9UQlu9lH0mCoqVnTeUb3biU0m+K0YPGEIiewkDj89kPqbvykFczSB0CGXGcGn5SSkNKkXDjXHkSFhtNhGCBTUaR3MCk+kSwOfkIadhDpbA9+Qy+SCnjla2vqJsSKczWxy10CTkD+PJ0THg=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by PUZPR03MB6885.apcprd03.prod.outlook.com (2603:1096:301:103::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.17; Mon, 9 Dec
 2024 09:09:06 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8207.014; Mon, 9 Dec 2024
 09:09:06 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "jie.qiu@mediatek.com"
 <jie.qiu@mediatek.com>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "mripard@kernel.org"
 <mripard@kernel.org>, =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?=
 <jitao.shi@mediatek.com>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "kernel@collabora.com" <kernel@collabora.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "junzhi.zhao@mediatek.com"
 <junzhi.zhao@mediatek.com>
Subject: Re: [PATCH v2 14/15] drm/mediatek: mtk_hdmi_common: Add OP_HDMI,
 vendor and product strings
Thread-Topic: [PATCH v2 14/15] drm/mediatek: mtk_hdmi_common: Add OP_HDMI,
 vendor and product strings
Thread-Index: AQHbRwt4xV/d1hvrLUKjHjxK6fEG0rLdpeeA
Date: Mon, 9 Dec 2024 09:09:06 +0000
Message-ID: <6697eef88677950d36fbfbd6676f82f291621159.camel@mediatek.com>
References: <20241205114518.53527-1-angelogioacchino.delregno@collabora.com>
 <20241205114518.53527-15-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20241205114518.53527-15-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|PUZPR03MB6885:EE_
x-ms-office365-filtering-correlation-id: 116573e2-3b21-48ec-1184-08dd1831224b
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?T0NJdW9kWmxpTmpCUEJWT0d4a0hXd0MvS0RNMjZ6RTlzcmorQkpHdVE4cXFI?=
 =?utf-8?B?VVJhSmxZNnhpV3lhLy9iY2tXRXAyREFkb1Blc2VVNGx4dENINUtmQ0xXOWlJ?=
 =?utf-8?B?SGl4dXYvYWRwa2p5YmI0aVpSTldvUitNeG5oTU00SzRtbVBhVVNMdFVDZkdu?=
 =?utf-8?B?c0REYTFxdGFiaTBNU010WWpWTkdKQzYzWjJiTkRtdUM5Um1taTh5RzVzWDgy?=
 =?utf-8?B?TW51YjFFRWJPb1pIZU5MM1JGNldNM2NqZzJPZTcxT3VOQUFwU2pzenZlZWR3?=
 =?utf-8?B?cktJWG9CaEMySFdLaG1KY3krS3pxamVWMDdwTXc0a0xEWVNQWWRnd0RjeXM1?=
 =?utf-8?B?aWI1emlHUjg0Wi8rcnNqOXZNUjlqTnJQVGtPVlVBT1FzbnpHWGhrOWtVdVhx?=
 =?utf-8?B?MDJkNTkrSGEydXhyWktNbnNybGxJcjNOZitNVzNqWlh2aHFYd2p2d1BqVjZR?=
 =?utf-8?B?b2U2K1FLU1YwdENEUmxFMVhRNGpQODhVcTNFZDN3WmVwTkYxUDhiWGVBNFBZ?=
 =?utf-8?B?RGNQRUhwbytxMzM5RmpLMEtXVXhWNUptMVM0b0oxY1RrT254cjdFdDVIMW9G?=
 =?utf-8?B?K0daYm9WRzlESkwrd1dxT0xPcW10eHdjRVpzTktIOURkV25vaXpwa0VIWkt4?=
 =?utf-8?B?R3dRR2NDbEJNMmhsQlcvY05iN2p2UVRTWUFwMlNreVlyUno5Vy9tcUozVmZG?=
 =?utf-8?B?RVllT0E5dXFhUXFLNjVXcGp0UG15dFBoSGloRjJ3UXlIM05kWHFUdXFDSXoz?=
 =?utf-8?B?a1pSLytDNzNpT0NmaWxEeGwrcHRWSUM5RHdxbDJqWGtLcFJGZm1neWQrc05C?=
 =?utf-8?B?R0V3Y3FvdElwVVk5ZXVyaGtKNUg2ay9qaHYybjQ4Z3VyMndUTnh3Q0c4QkVV?=
 =?utf-8?B?NkJrRUg5aVZhM2gyajhtVzROWUtKM2pvZWNsQmVNWjEvN2R3TFJSYzM0M1FM?=
 =?utf-8?B?Zk4vZFFLZzBnOW9tZkRVUVFBNG5IMmVIU2NxL0xBMFp2TDVVdjQ3M2pNbTE2?=
 =?utf-8?B?d041VENJU0RFamd4MHRSRzQ1a0FaSGxId0ZYTUhiNWwyR1JhRm05OE5BUWNl?=
 =?utf-8?B?VWlVWHErVHJZVXhrZXJBbWErQ055OHFyaWhJbHprVFJRZ1JLN1Z4eXJZb3VG?=
 =?utf-8?B?U2NKUnRBY1RuWXA0RlhZekZhc1VpdW5UbWIyMDY0dnFrU3ozRTRHZ215THFV?=
 =?utf-8?B?cXpzUkxlZk5hTVNzQzRjNk5EazBHeFU2MHpIcUIvZUJtdzZ5QnRCb082NlEz?=
 =?utf-8?B?Tzh2dXFwc3B3SVkrcGVJU3ZvaFVta0kweFdpU2dDaWZWTHY5RXErUlQ5Q3hG?=
 =?utf-8?B?dzRSM1hEdGFCazJCQTZrSEJhdTA0Z3ZYNjFYUitKajgvYmNwRDdUTEk1N1ov?=
 =?utf-8?B?aWgwcDFKSVhwTHJmaFdMN0R5bE50TFhwR2NWY21rKzk4UmNMcWxXRmxLRkpF?=
 =?utf-8?B?WHdBUGJaTlJ6NGVaZFZaVFcwM2RPVWwzMWU2RDlKU3hjbHBhR203ZlpBN2x1?=
 =?utf-8?B?SEx2Rzd3NnZVU0drdG9GSklwTzhnK25uWG9ybXJkYU01UVBZWTRucCtVV0JG?=
 =?utf-8?B?MTBycHUrV3VFaiszcE1BV1F2bVFPbVZNWHJ6V1hoWXU0N1puMVdZQ2dMY2Fz?=
 =?utf-8?B?Q0ZaeG5IVStzWHVwTm5jelZzZzVMU3FPMEpQZEFhb0Rjd1BjdVFWbzF6MG1O?=
 =?utf-8?B?Sk1oeHJ1bmhvTlBCalFrT05QdzhtVTA4OERoYm1BdjlWa3FBbllyYm5qeWVv?=
 =?utf-8?B?Z0ZwNkNyR2JiRFVBSzZwaFpLSnA2SE5XOGZBRllVemNLaWpGSEN1VTNMVEFu?=
 =?utf-8?B?cTdqNmdFcFVDcXhFaGpxSnJwaUhqYXJsOWlldzJQYzhJMFMxTjgwdmJKNmds?=
 =?utf-8?B?U0ZXVHF0eUtqd0kxa056TFcvN3E3Ylc2aFRndmVmTFNOOWc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QUlEamI5QmNpZ2Y3cmV0SFhPZnRNVTlGWEVFQXdUdHE3WTdrM3BzV0dVTzlt?=
 =?utf-8?B?ZVJvWlFVaVhFa3JiWkJ2aEU1dis1RDNiVFBCdFJCZ1lhaG1kRGN1Q2EzaG5u?=
 =?utf-8?B?M05QSDB5cmo1elpHK0UyWnNzYmRnZUxnMlU4a0RsRWg3b0Y4T1FNSkluNDFQ?=
 =?utf-8?B?S1VHaHpORDJNQ2kvZ2N6Rk10RXBqT2UyTGt5aHRva3Y2UUNwcm1YanFCYnZP?=
 =?utf-8?B?REVpVUFBa0JicTQzdjUrZDdhaE9PRldrYUZlTUJxSW9ueVBtcVFPTWxJcVVF?=
 =?utf-8?B?ekpxMkowOWVHYU5DT29rSlF1Q3BGYmRMNk00dG5ORnVmWVB1eWRBMXFoV3Ev?=
 =?utf-8?B?TjNtUHBDVFREbUFqbzBMSzdhTkMzbDVBUnkzNTEyeisrZWsrUmg0QkZkSXNP?=
 =?utf-8?B?K3VhbzJqRmZ2ZTVTM1dmc2dyTTA0RzU4bFk2a25FLytjMjVtMnYzaHlabjda?=
 =?utf-8?B?S0FIeXAxeCtzZVh6WHdPMjNsNU5INUlsclRrUUJPRUFCaUIwakZ4bVdTTUVE?=
 =?utf-8?B?ZFdEaC91djdLemZyblNONEorUm0wc1VmYW83cklSSFk4YTNQZTZBRXd0SnVJ?=
 =?utf-8?B?TkZ6U05jNUJMeStaYVRrVEdydncxKys5c2JFKzU5ZVdSK1lRQTh1Rm5oWXJH?=
 =?utf-8?B?Y3VjY254clY2T1U3eGV2TW4vSjg4clhVbklKbWExNzNuVkFnbCs5S0lPd0pP?=
 =?utf-8?B?ejVWVVFBaDFqbkFhZDRjMmd2YzlCZDR0RW9JM0pLYVBjWGJ2SG94MUY3QXZ3?=
 =?utf-8?B?QzUwakE4c3JZQkoxakQ1TFpqQlpJZnJyOXhBTjJ6WGVWU0h4b2VaWTZEdHF5?=
 =?utf-8?B?Z25DR2xrK0hhWmJyVGRpbWFhenFUUzFXWTZGOTBSUnBQcFNJMVRNbCswWWxW?=
 =?utf-8?B?ZWdqYUF0MzhDZ2Q1QSs1NFNhc1lOdEVXVWZ5WTdoNWVURkJmQSt4SDBHTTNN?=
 =?utf-8?B?ZkJsS2tzMzRtaVJyZzlIM2N3Smhtamxua2hwWTZSUUtjNjFKQytPMEJtNmdM?=
 =?utf-8?B?V2tjQzRjdkozNlBKRXZibUgxbllxNHcvV3BTVVdrV3pqdFBnYmlpT2NTNTNj?=
 =?utf-8?B?RWQ0ZG5JMFRaQkFObUFmbkp6bEd1aUU2UlNvbnZ2SmEwNGsrSld5NktyNFJF?=
 =?utf-8?B?dmhXcGhWQWZocHNMZGpvSzEzdVZXLzNuOWpZY0tUM292d0loQ0tPNXlJUzlo?=
 =?utf-8?B?L1E0aEtNbThlT2l3QzQrbVpXQzNROXlLUXJxNkZlYUpldVI5bDdnY21PZDFN?=
 =?utf-8?B?NlgyRFcrTitBejltMTZZdEo1NXZSMVVFZWF4MlJjRUQyRXAyWWlNdTdsbzM1?=
 =?utf-8?B?N2k5NVhOVDNDNjZRME05T1gwdnJDTkc1N1ZjZGJ1Q0FOemNIQnU2Zm5LS1BD?=
 =?utf-8?B?YkVJYjRiRVhjcVVYTS9INGgrYnBUbEdST1k0R3ZNYjBlOTYrOUttYWw1NEtK?=
 =?utf-8?B?WUYrbkFoZUU3WFRJclMzaFRNYjFPUTJidGZFQmZaK1FieXBSREVPT2h0NGh5?=
 =?utf-8?B?cnpvTkRxZzBrRHNFd3BJZG4yQm5IWnU0SDVMSkQvUWtMZS92NlVhYi95THFH?=
 =?utf-8?B?YktJYkpnL1lKRGFnUDNmLzgyb01KU1hzaDBVS2hMTk42QlBIRE1YL0IydFFK?=
 =?utf-8?B?N0ZteVRaQ0RqY2NCdkticVNKK01tQlNUWWJVNklqbFovZjhtN2FqWmFZNkxI?=
 =?utf-8?B?UWdVRGg0Y2ttaHZydjZUQlFjUVdJemRGaHc1cWtlbTUvOWlBc3NMclU1V1hH?=
 =?utf-8?B?UlN4bDNKdThxWnpVRG9nSWlqNW1pdjBzZ1IwdzRMSjNRbldLV05wRzZBQnlI?=
 =?utf-8?B?dDI1cm45NEVvMVZwV1FlU1hrakdEanBGV0cyL1dCUzBzWlluM1RDY0hLN2Jn?=
 =?utf-8?B?a0puN0s1Z3pFNFZJT1B2dmJqZ1FJSEh1MytXb3IwQXJDc3h3NkVqZUdkakds?=
 =?utf-8?B?UEZwS2hBTFlWeTNEL09iL3hjaWdzNzI2ekt6RHBaWUJ5QUFSR2ZjZENBM2xM?=
 =?utf-8?B?WG1BaUtERDJSZERRRnZpNjNHNnNPYnFGeGFZTkQ1YmdlVFVMUlRrQk1Odlc2?=
 =?utf-8?B?OTM4ZXZwckRrMGs4dC9wZUY1Q1pmaXBrQmJ5bzVJRytVOG53cElXR2NPSisy?=
 =?utf-8?Q?LsofDUjvGnOuzQntK8ZLlq3lu?=
Content-ID: <A47F07249782B14F9E7E18BE421BC440@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 116573e2-3b21-48ec-1184-08dd1831224b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2024 09:09:06.3902 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GuwTsCWWDcuUUO0ndZMDOE10jzDM+OmikUmE14Er7umvXMKrDNHC5ND0/rE58uX5t1L9fKUDfUwwVlcAj1cUGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB6885
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_007_49410904.1384393456"
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

--__=_Part_Boundary_007_49410904.1384393456
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEFuZ2VsbzoNCg0KT24gVGh1LCAyMDI0LTEyLTA1IGF0IDEyOjQ1ICswMTAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZp
ZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBJbiBwcmVwYXJhdGlvbiBm
b3IgYWRkaW5nIHRoZSBIRE1JIFRYIHYyIGRyaXZlciwgYW5kIHRvIGFsbG93DQo+IGEgZnV0dXJl
IG1vZGVybml6YXRpb24gb2YgdGhlIEhETUkgdjEgb25lLCBwZXJmb3JtIGNoYW5nZXMNCj4gdGhh
dCBlbmFibGUgdGhlIHVzYWdlIG9mIHRoZSBIRE1JIEhlbHBlcnMgcHJvdmlkZWQgYnkgRFJNLg0K
PiANCj4gQ2hlY2sgaWYgdGhlIEhETUkgZHJpdmVyIHByb3ZpZGVzIHRoZSBmdW5jdGlvbiBwb2lu
dGVycyB0bw0KPiBoZG1pX3tjbGVhcix3cml0ZX1faW5mb2ZyYW1lIHVzZWQgYnkgdGhlIEhETUkg
SGVscGVyIEFQSSBhbmQsDQo+IGlmIHByZXNlbnQsIGFkZCBEUk1fQlJJREdFX09QX0hETUkgdG8g
dGhlIGRybV9icmlkZ2Ugb3BzLA0KPiBlbmFibGluZyB0aGUgZHJtIEFQSSB0byByZWdpc3RlciB0
aGUgYnJpZGdlIGFzIEhETUkgYW5kIHRvIHVzZQ0KPiB0aGUgSERNSSBIZWxwZXIgZnVuY3Rpb25z
Lg0KPiANCj4gTW9yZW92ZXIsIGFzIHBhcnQgb2YgZGF0YSBleGNsdXNpdmVseSB1c2VkIChpbiB0
aGUgY29udGV4dCBvZg0KPiBIRE1JIGJyaWRnZXMpIGJ5IHRoZSBoZWxwZXJzLCBhc3NpZ24gdGhl
IHZlbmRvciAiTWVkaWFUZWsiIGFuZA0KPiBwcm9kdWN0ICJPbi1DaGlwIEhETUkiIHN0cmluZ3Mg
dG8gdGhlIGRybV9icmlkZ2Ugc3RydWN0Lg0KPiANCj4gSWYgdGhlIGhkbWlfe3dyaXRlLGNsZWFy
fV9pbmZvZnJhbWUgcG9pbnRlcnMgYXJlIG5vdCBhc3NpZ25lZCwNCj4gdmVuZG9yIGFuZCBwcm9k
dWN0IHN0cmluZ3MgYW5kIEhETUkgaGVscGVycyB3aWxsIG5vdCBiZSB1c2VkLA0KPiBoZW5jZSB0
aGlzIGNvbW1pdCBicmluZ3Mgbm8gZnVuY3Rpb25hbCBjaGFuZ2VzIHRvIGRyaXZlcnMgdGhhdA0K
PiBoYXZlIG5vdCBiZWVuIHJlZmFjdG9yZWQgdG8gdXNlIHRoZSBuZXcgaGVscGVycy4NCj4gDQo+
IFRoaXMgYWxzbyBtZWFucyB0aGF0LCBpbiB0aGUgY3VycmVudCBzdGF0ZSwgdGhlcmUgaXMgZWZm
ZWN0aXZlbHkNCj4gbm8gZnVuY3Rpb25hbCBjaGFuZ2UgdG8gbXRrX2hkbWkgYW5kIGl0cyBvdGhl
ciBjb21wb25lbnRzLg0KDQpPUF9IRE1JIGlzIGZvciB2Mi4NCnZlbmRvciBhbmQgcHJvZHVjdCBz
dHJpbmdzIGlzIGZvciBib3RoIHYxIGFuZCB2Mi4NClNvIHNlcGFyYXRlIHRoaXMgcGF0Y2ggdG8g
dHdvIHBhdGNoZXMuDQoNClJlZ2FyZHMsDQpDSw0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbmdl
bG9HaW9hY2NoaW5vIERlbCBSZWdubyA8YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJv
cmEuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaV9jb21t
b24uYyB8IDcgKysrKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaV9jb21tb24u
YyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaV9jb21tb24uYw0KPiBpbmRleCA0
ZjcwOGIwNGY1ZTguLjBmNjA4NDI0NjJiMCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19oZG1pX2NvbW1vbi5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfaGRtaV9jb21tb24uYw0KPiBAQCAtNDA4LDkgKzQwOCwxNiBAQCBzdHJ1Y3QgbXRr
X2hkbWkgKm10a19oZG1pX2NvbW1vbl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQ0KPiANCj4gICAgICAgICBoZG1pLT5icmlkZ2UuZnVuY3MgPSB2ZXJfY29uZi0+YnJpZGdlX2Z1
bmNzOw0KPiAgICAgICAgIGhkbWktPmJyaWRnZS5vcHMgPSBEUk1fQlJJREdFX09QX0RFVEVDVCB8
IERSTV9CUklER0VfT1BfRURJRCB8IERSTV9CUklER0VfT1BfSFBEOw0KPiArDQo+ICsgICAgICAg
aWYgKHZlcl9jb25mLT5icmlkZ2VfZnVuY3MtPmhkbWlfd3JpdGVfaW5mb2ZyYW1lICYmDQo+ICsg
ICAgICAgICAgIHZlcl9jb25mLT5icmlkZ2VfZnVuY3MtPmhkbWlfY2xlYXJfaW5mb2ZyYW1lKQ0K
PiArICAgICAgICAgICAgICAgaGRtaS0+YnJpZGdlLm9wcyB8PSBEUk1fQlJJREdFX09QX0hETUk7
DQo+ICsNCj4gICAgICAgICBoZG1pLT5icmlkZ2UudHlwZSA9IERSTV9NT0RFX0NPTk5FQ1RPUl9I
RE1JQTsNCj4gICAgICAgICBoZG1pLT5icmlkZ2Uub2Zfbm9kZSA9IHBkZXYtPmRldi5vZl9ub2Rl
Ow0KPiAgICAgICAgIGhkbWktPmJyaWRnZS5kZGMgPSBoZG1pLT5kZGNfYWRwdDsNCj4gKyAgICAg
ICBoZG1pLT5icmlkZ2UudmVuZG9yID0gIk1lZGlhVGVrIjsNCj4gKyAgICAgICBoZG1pLT5icmlk
Z2UucHJvZHVjdCA9ICJPbi1DaGlwIEhETUkiOw0KPiANCj4gICAgICAgICByZXQgPSBkZXZtX2Ry
bV9icmlkZ2VfYWRkKGRldiwgJmhkbWktPmJyaWRnZSk7DQo+ICAgICAgICAgaWYgKHJldCkNCj4g
LS0NCj4gMi40Ny4wDQo+IA0KDQo=

--__=_Part_Boundary_007_49410904.1384393456
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtBbmdlbG86DQoNCk9uJiMzMjtUaHUsJiMz
MjsyMDI0LTEyLTA1JiMzMjthdCYjMzI7MTI6NDUmIzMyOyswMTAwLCYjMzI7QW5nZWxvR2lvYWNj
aGlubyYjMzI7RGVsJiMzMjtSZWdubyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjtFeHRlcm5hbCYjMzI7
ZW1haWwmIzMyOzomIzMyO1BsZWFzZSYjMzI7ZG8mIzMyO25vdCYjMzI7Y2xpY2smIzMyO2xpbmtz
JiMzMjtvciYjMzI7b3BlbiYjMzI7YXR0YWNobWVudHMmIzMyO3VudGlsJiMzMjt5b3UmIzMyO2hh
dmUmIzMyO3ZlcmlmaWVkJiMzMjt0aGUmIzMyO3NlbmRlciYjMzI7b3ImIzMyO3RoZSYjMzI7Y29u
dGVudC4NCiZndDsmIzMyOw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtJbiYjMzI7cHJlcGFyYXRpb24m
IzMyO2ZvciYjMzI7YWRkaW5nJiMzMjt0aGUmIzMyO0hETUkmIzMyO1RYJiMzMjt2MiYjMzI7ZHJp
dmVyLCYjMzI7YW5kJiMzMjt0byYjMzI7YWxsb3cNCiZndDsmIzMyO2EmIzMyO2Z1dHVyZSYjMzI7
bW9kZXJuaXphdGlvbiYjMzI7b2YmIzMyO3RoZSYjMzI7SERNSSYjMzI7djEmIzMyO29uZSwmIzMy
O3BlcmZvcm0mIzMyO2NoYW5nZXMNCiZndDsmIzMyO3RoYXQmIzMyO2VuYWJsZSYjMzI7dGhlJiMz
Mjt1c2FnZSYjMzI7b2YmIzMyO3RoZSYjMzI7SERNSSYjMzI7SGVscGVycyYjMzI7cHJvdmlkZWQm
IzMyO2J5JiMzMjtEUk0uDQomZ3Q7JiMzMjsNCiZndDsmIzMyO0NoZWNrJiMzMjtpZiYjMzI7dGhl
JiMzMjtIRE1JJiMzMjtkcml2ZXImIzMyO3Byb3ZpZGVzJiMzMjt0aGUmIzMyO2Z1bmN0aW9uJiMz
Mjtwb2ludGVycyYjMzI7dG8NCiZndDsmIzMyO2hkbWlfe2NsZWFyLHdyaXRlfV9pbmZvZnJhbWUm
IzMyO3VzZWQmIzMyO2J5JiMzMjt0aGUmIzMyO0hETUkmIzMyO0hlbHBlciYjMzI7QVBJJiMzMjth
bmQsDQomZ3Q7JiMzMjtpZiYjMzI7cHJlc2VudCwmIzMyO2FkZCYjMzI7RFJNX0JSSURHRV9PUF9I
RE1JJiMzMjt0byYjMzI7dGhlJiMzMjtkcm1fYnJpZGdlJiMzMjtvcHMsDQomZ3Q7JiMzMjtlbmFi
bGluZyYjMzI7dGhlJiMzMjtkcm0mIzMyO0FQSSYjMzI7dG8mIzMyO3JlZ2lzdGVyJiMzMjt0aGUm
IzMyO2JyaWRnZSYjMzI7YXMmIzMyO0hETUkmIzMyO2FuZCYjMzI7dG8mIzMyO3VzZQ0KJmd0OyYj
MzI7dGhlJiMzMjtIRE1JJiMzMjtIZWxwZXImIzMyO2Z1bmN0aW9ucy4NCiZndDsmIzMyOw0KJmd0
OyYjMzI7TW9yZW92ZXIsJiMzMjthcyYjMzI7cGFydCYjMzI7b2YmIzMyO2RhdGEmIzMyO2V4Y2x1
c2l2ZWx5JiMzMjt1c2VkJiMzMjsoaW4mIzMyO3RoZSYjMzI7Y29udGV4dCYjMzI7b2YNCiZndDsm
IzMyO0hETUkmIzMyO2JyaWRnZXMpJiMzMjtieSYjMzI7dGhlJiMzMjtoZWxwZXJzLCYjMzI7YXNz
aWduJiMzMjt0aGUmIzMyO3ZlbmRvciYjMzI7JnF1b3Q7TWVkaWFUZWsmcXVvdDsmIzMyO2FuZA0K
Jmd0OyYjMzI7cHJvZHVjdCYjMzI7JnF1b3Q7T24tQ2hpcCYjMzI7SERNSSZxdW90OyYjMzI7c3Ry
aW5ncyYjMzI7dG8mIzMyO3RoZSYjMzI7ZHJtX2JyaWRnZSYjMzI7c3RydWN0Lg0KJmd0OyYjMzI7
DQomZ3Q7JiMzMjtJZiYjMzI7dGhlJiMzMjtoZG1pX3t3cml0ZSxjbGVhcn1faW5mb2ZyYW1lJiMz
Mjtwb2ludGVycyYjMzI7YXJlJiMzMjtub3QmIzMyO2Fzc2lnbmVkLA0KJmd0OyYjMzI7dmVuZG9y
JiMzMjthbmQmIzMyO3Byb2R1Y3QmIzMyO3N0cmluZ3MmIzMyO2FuZCYjMzI7SERNSSYjMzI7aGVs
cGVycyYjMzI7d2lsbCYjMzI7bm90JiMzMjtiZSYjMzI7dXNlZCwNCiZndDsmIzMyO2hlbmNlJiMz
Mjt0aGlzJiMzMjtjb21taXQmIzMyO2JyaW5ncyYjMzI7bm8mIzMyO2Z1bmN0aW9uYWwmIzMyO2No
YW5nZXMmIzMyO3RvJiMzMjtkcml2ZXJzJiMzMjt0aGF0DQomZ3Q7JiMzMjtoYXZlJiMzMjtub3Qm
IzMyO2JlZW4mIzMyO3JlZmFjdG9yZWQmIzMyO3RvJiMzMjt1c2UmIzMyO3RoZSYjMzI7bmV3JiMz
MjtoZWxwZXJzLg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtUaGlzJiMzMjthbHNvJiMzMjttZWFucyYj
MzI7dGhhdCwmIzMyO2luJiMzMjt0aGUmIzMyO2N1cnJlbnQmIzMyO3N0YXRlLCYjMzI7dGhlcmUm
IzMyO2lzJiMzMjtlZmZlY3RpdmVseQ0KJmd0OyYjMzI7bm8mIzMyO2Z1bmN0aW9uYWwmIzMyO2No
YW5nZSYjMzI7dG8mIzMyO210a19oZG1pJiMzMjthbmQmIzMyO2l0cyYjMzI7b3RoZXImIzMyO2Nv
bXBvbmVudHMuDQoNCk9QX0hETUkmIzMyO2lzJiMzMjtmb3ImIzMyO3YyLg0KdmVuZG9yJiMzMjth
bmQmIzMyO3Byb2R1Y3QmIzMyO3N0cmluZ3MmIzMyO2lzJiMzMjtmb3ImIzMyO2JvdGgmIzMyO3Yx
JiMzMjthbmQmIzMyO3YyLg0KU28mIzMyO3NlcGFyYXRlJiMzMjt0aGlzJiMzMjtwYXRjaCYjMzI7
dG8mIzMyO3R3byYjMzI7cGF0Y2hlcy4NCg0KUmVnYXJkcywNCkNLDQoNCiZndDsmIzMyOw0KJmd0
OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMyO0FuZ2Vsb0dpb2FjY2hpbm8mIzMyO0RlbCYjMzI7UmVn
bm8mIzMyOyZsdDthbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20mZ3Q7DQom
Z3Q7JiMzMjstLS0NCiZndDsmIzMyOyYjMzI7ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19o
ZG1pX2NvbW1vbi5jJiMzMjt8JiMzMjs3JiMzMjsrKysrKysrDQomZ3Q7JiMzMjsmIzMyOzEmIzMy
O2ZpbGUmIzMyO2NoYW5nZWQsJiMzMjs3JiMzMjtpbnNlcnRpb25zKCspDQomZ3Q7JiMzMjsNCiZn
dDsmIzMyO2RpZmYmIzMyOy0tZ2l0JiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
aGRtaV9jb21tb24uYyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWlfY29t
bW9uLmMNCiZndDsmIzMyO2luZGV4JiMzMjs0ZjcwOGIwNGY1ZTguLjBmNjA4NDI0NjJiMCYjMzI7
MTAwNjQ0DQomZ3Q7JiMzMjstLS0mIzMyO2EvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19o
ZG1pX2NvbW1vbi5jDQomZ3Q7JiMzMjsrKysmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19oZG1pX2NvbW1vbi5jDQomZ3Q7JiMzMjtAQCYjMzI7LTQwOCw5JiMzMjsrNDA4LDE2JiMz
MjtAQCYjMzI7c3RydWN0JiMzMjttdGtfaGRtaSYjMzI7Km10a19oZG1pX2NvbW1vbl9wcm9iZShz
dHJ1Y3QmIzMyO3BsYXRmb3JtX2RldmljZSYjMzI7KnBkZXYpDQomZ3Q7JiMzMjsNCiZndDsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtoZG1pLSZndDticmlkZ2Uu
ZnVuY3MmIzMyOz0mIzMyO3Zlcl9jb25mLSZndDticmlkZ2VfZnVuY3M7DQomZ3Q7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7aGRtaS0mZ3Q7YnJpZGdlLm9wcyYj
MzI7PSYjMzI7RFJNX0JSSURHRV9PUF9ERVRFQ1QmIzMyO3wmIzMyO0RSTV9CUklER0VfT1BfRURJ
RCYjMzI7fCYjMzI7RFJNX0JSSURHRV9PUF9IUEQ7DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrJiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtpZiYjMzI7KHZlcl9jb25mLSZndDticmlk
Z2VfZnVuY3MtJmd0O2hkbWlfd3JpdGVfaW5mb2ZyYW1lJiMzMjsmYW1wOyZhbXA7DQomZ3Q7JiMz
MjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
O3Zlcl9jb25mLSZndDticmlkZ2VfZnVuY3MtJmd0O2hkbWlfY2xlYXJfaW5mb2ZyYW1lKQ0KJmd0
OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO2hkbWktJmd0O2JyaWRnZS5vcHMmIzMyO3w9JiMzMjtE
Uk1fQlJJREdFX09QX0hETUk7DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7aGRtaS0mZ3Q7YnJpZGdlLnR5cGUmIzMyOz0mIzMyO0RS
TV9NT0RFX0NPTk5FQ1RPUl9IRE1JQTsNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjtoZG1pLSZndDticmlkZ2Uub2Zfbm9kZSYjMzI7PSYjMzI7cGRldi0m
Z3Q7ZGV2Lm9mX25vZGU7DQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7aGRtaS0mZ3Q7YnJpZGdlLmRkYyYjMzI7PSYjMzI7aGRtaS0mZ3Q7ZGRjX2FkcHQ7
DQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtoZG1pLSZndDti
cmlkZ2UudmVuZG9yJiMzMjs9JiMzMjsmcXVvdDtNZWRpYVRlayZxdW90OzsNCiZndDsmIzMyOysm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO2hkbWktJmd0O2JyaWRnZS5wcm9kdWN0
JiMzMjs9JiMzMjsmcXVvdDtPbi1DaGlwJiMzMjtIRE1JJnF1b3Q7Ow0KJmd0OyYjMzI7DQomZ3Q7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7cmV0JiMzMjs9JiMz
MjtkZXZtX2RybV9icmlkZ2VfYWRkKGRldiwmIzMyOyZhbXA7aGRtaS0mZ3Q7YnJpZGdlKTsNCiZn
dDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtpZiYjMzI7KHJl
dCkNCiZndDsmIzMyOy0tDQomZ3Q7JiMzMjsyLjQ3LjANCiZndDsmIzMyOw0KDQoNCjwvcHJlPg0K
PC9wPjwvYm9keT48L2h0bWw+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioq
KioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UNCiAqKioqKioqKioqKioqKioqKioq
Kg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNs
dWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5
LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIg
YXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8g
dGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRp
c3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWls
IChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMp
IGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJl
IG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUNCiAN
CnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3Rp
ZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCks
IGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFu
eSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhl
IGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0K
PC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_007_49410904.1384393456--

