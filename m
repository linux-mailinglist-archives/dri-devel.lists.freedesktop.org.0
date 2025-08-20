Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B436B2D202
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 04:37:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC63C10E056;
	Wed, 20 Aug 2025 02:37:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="RWRg2F9d";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="Ez6uYeBd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E184F10E056
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 02:37:53 +0000 (UTC)
X-UUID: a923f9107d6e11f0b33aeb1e7f16c2b6-20250820
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=Xsn5AUYefGctxMH0z8UzFGtX1aZfr7VcxcKzzjlGe4Y=; 
 b=RWRg2F9diO0tybw76I3vjB/uJtx3Vn+hFxX0anPXjG6JHlIMsXIfcyqBsnSBeNmkj2SaO17rSnAVcFUC7YZOXpzFHNTvVQplFVqehsA7RvdDsKExXPG6MVZ1C7YtJNEn2ptAD77hoZpHtyORFTpjJtzsiib8DghtLxCc/qRZ41Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3, REQID:b6bc6961-d500-4e79-b45c-0614d23f97ab, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:f1326cf, CLOUDID:e7dea744-18c5-4075-a135-4c0afe29f9d6,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:-5,Conten
 t:0|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:
 0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a923f9107d6e11f0b33aeb1e7f16c2b6-20250820
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2004606615; Wed, 20 Aug 2025 10:37:48 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 20 Aug 2025 10:37:45 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 20 Aug 2025 10:37:45 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J+hej+R6L5kmY+H+vhtMz6VqbLBUCRXpJb7KwjCv99Zr4kqeyDmRtrjKjoJOxTbdEIdhKpiekmr7ZyIFwWWxs8NJaAiwfHJ+BmsXtLIgfNvdaCWiIiCe2WehIQiAfbR0K1x+RYuJioYcFDfAt9LTZyE2aG2/dANmYUYku9F0kBppRr46q8v4fhg1uOn4ToyEl1sUb0E2X2gYU0KsaAe0bO20iSZvUu+w4qC9MOuNPEpKDRi22jqOswGTRG4y04owYsh4liRcXI0e0reXgs+dVDAbf73AWlQbBjEgG0xoBORmrbZK6TD/wFnZ+g0TeUs9wSdjMS3921eVxB4xSPZdmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=azxirOxN2rKYVULF22j8FKW+h7vAscrLFOQaBluMr38=;
 b=lntYW32PZZj+nEGXRBEtHTtN9A0S4pCb/EJoYoXVFmVU29U/4BZO1xF92Gm8A2nvWSGYlSWnyqIFuSPBhIsmpox3Y9hJ/eMKef/14w/EHbnKqGfU63+4BwW3hnTSve1474rxNNHRD54w3Wxfa5JMkg8zYClKvRJQ2I3K9bUd1UqMsw+AVlJy/gMIvCfUlhvQEUvxW7xlVh0Q1tN2kG/iO6ysAUgqUw24RQU0PPDM7Ph8ju+Tpr80o19kcUJBCGvH+Algyuc5yKvZr0/TVLrMOB4Apz0LpeiCzZRc+5W7AaBLLdIvLtVsze42TT4VkCCQjt9M8AtOhd8DU5zuWy07tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=azxirOxN2rKYVULF22j8FKW+h7vAscrLFOQaBluMr38=;
 b=Ez6uYeBd4dxcGgF8Asm8xW76YTh2Neqn3xSx16aA7KIHfzrPQ/QaoUKbzX/ToGcjeQkWGlMDWa466KNbdW42W4TBwy1g+11g42nOBSnnk1yVdjXmPF0rgBJxJYlol5rmWy7RUVC+yEf5URK1sKo8tAgRjDhxOFjLylTZeM4c2as=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB8054.apcprd03.prod.outlook.com (2603:1096:400:463::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Wed, 20 Aug
 2025 02:37:44 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.9031.023; Wed, 20 Aug 2025
 02:37:44 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "granquet@baylibre.com" <granquet@baylibre.com>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, "simona@ffwll.ch" <simona@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "kernel@collabora.com"
 <kernel@collabora.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/mediatek: mtk_hdmi: fix inverted parameters in some
 regmap_update_bits calls
Thread-Topic: [PATCH] drm/mediatek: mtk_hdmi: fix inverted parameters in some
 regmap_update_bits calls
Thread-Index: AQHcEEr5pv4HNyYkM0W8Jswx2VOwJLRq1joA
Date: Wed, 20 Aug 2025 02:37:44 +0000
Message-ID: <a4538873bba257529435b28ff65dab85703b13be.camel@mediatek.com>
References: <20250818-mt8173-fix-hdmi-issue-v1-1-55aff9b0295d@collabora.com>
In-Reply-To: <20250818-mt8173-fix-hdmi-issue-v1-1-55aff9b0295d@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB8054:EE_
x-ms-office365-filtering-correlation-id: 6a821d16-5859-43a3-8471-08dddf928b06
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|42112799006|376014|1800799024|7416014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?VUZSRjZGRk5OUGhqWlhlY0YzV2xlYUpQaEdYbmx2ZXlLaHZYNjNUOTZSTEZq?=
 =?utf-8?B?WE9XckN6MktVdGluUnBTSjlkVGNPZjlQclhoTTZlcHg5UUxXdkxycWdvUWxm?=
 =?utf-8?B?Z3QvVGxVWTBzb2tmZllnU01uM3hQdXRQUG1JZnNkRUlsdjRUdmljNjQ3c1A3?=
 =?utf-8?B?NHQvWjJBR2dKZ0ZpR2JxUG9sd3NpUWkvbTN2MHhQWUtBRjVsRTFwT0lxd1JI?=
 =?utf-8?B?bVY0MHdNMERSeDBud0FqZWwzZ0VVb0FyenNHOHJWUU9ycEpIN2RvelBCajlx?=
 =?utf-8?B?K0x3RTRvblY4QjlzVjd6RHVpMFdVZ09JWjkzZlNjc1Q2ZnN3OWJNMGpoRnRF?=
 =?utf-8?B?WERVVVhSSWdGTHBBRUtZMFdOZFNxQkkvM2VaWjRRcHFnaURwRHgzWERiRGN3?=
 =?utf-8?B?Y3BGT0Jnc2szZGhabml4TmVGM1oxbU9GaTU3RlhSU3c0RUtmVUg3M0xPY1oz?=
 =?utf-8?B?UGtmUVpEQk5zcFNsNWs5UVRLYitiLzJIbExTV1Y0T0c0ZDE3RnliUDduay9s?=
 =?utf-8?B?WnhUSjloU003c2hmeDNLenRmZVVPY1ZhbURLbU5WaXlSWlBzTGNQckVybTdO?=
 =?utf-8?B?ZnJsaTNHcDd0UVJLVE5FY01rRDUzVzB3bEFUcENTYnAxUThpakpsN3YrOXIy?=
 =?utf-8?B?WHpJUVZEU1p3VHNqdGovSC9BdTBqM21ZVDAyalVWd1FDc1FjZDA2dk8vRHlQ?=
 =?utf-8?B?YUdtN0N0bWdIUmNWQ2lCMGV6S01kMG41aWY4WWtheGxKeWQzbjIyRVhZZkNN?=
 =?utf-8?B?Sm1VRCtkblJMVEc2Rkpza3VYRHNrVmRwK3ZmcWY5Nk9qMWZad04rcG1TOXNv?=
 =?utf-8?B?UEYwWUJRUkZ1d1MybG8yaGY2M1NCSzBQb05BckRzaU9kUkUrTm9SY0Z0eWh0?=
 =?utf-8?B?WU9OWTFqanNsQ3orTExJK0dKWEZrWEZMWlg4SUlKTlFtek1SYTdxS0NLaE1Q?=
 =?utf-8?B?a09BektEL2NxamNDLzY5aWowUTVqb0NlcjZnSHM3Q3dyUzYxS05NbWcxd05R?=
 =?utf-8?B?YnVsMzQyUVVYL2NnTlZVT3F5M01CWmU4T0p6QXlyWXJuUmYvNmVxOTVmUW9i?=
 =?utf-8?B?VEltZjQvdWQvcllPc1htcVN5WjJMSlg4R0FVa0xNK29LaHlMZG9qdXV0NUNz?=
 =?utf-8?B?dE1mSElNckFSS0MyelpheWs4ZEIzSFJhNW1OSmxOWjVnOFVwZ3F6S0dJVUMx?=
 =?utf-8?B?N0QwQ3d4MS9zUlh3NU9MVHJPV090QnNTcmxVVkF1aWtvb24xcng4VWYrMXJz?=
 =?utf-8?B?Qk5YL0xHYlRUUTRtOGFEK3FKRDZ6Yy9uMDVLbVlWV2g0S2ZKaDZKSEdyQ0Ju?=
 =?utf-8?B?anF6VlNpN0dla0pJV09WR254VFg2ZWsrUktjWnQ4UTlOV3FEaElCVjduOWpv?=
 =?utf-8?B?Z3Y4RVZFMDdHRHdQbHpRYmVpRWltUWM4WnBHWVh3WjBVUGtzTEs2a2VSYm5O?=
 =?utf-8?B?THptZXVUUklRSkVZTUNzMElpYjZWcEUwTWNkVWJYMGFTZDRHRFVaMXdibmEy?=
 =?utf-8?B?UlExSlpwVGZQVGhkTkhYd2ZxNnppd2pibmFkZm9oMUE4UldGcE5OYVVKSkVQ?=
 =?utf-8?B?eGo2d3hKUXM5SDZBNFh2MzEyZVVXZXJRRXA0WXpQeGlwaEk3KzdTRzJ2dWFJ?=
 =?utf-8?B?dnNwMGJqUEYzQkYxQUIrMnRSU2tjT1U0QnRYMkU1VmMvWUpoRmFIaGFDeEw4?=
 =?utf-8?B?Tzk2L2FGNXBYNis3a09ONEpxdzZiQTZNMlhJYWJjZUkzbWtGcFpSM2wzUU1J?=
 =?utf-8?B?OVEwV21EZmozTUIvWnRRUUk5K2J6SnpMWGZQaUZNS0UxV1l1dGtrSnBtSTJ1?=
 =?utf-8?B?ZmNCbE5mSXpzMVdscHRJK2JWTUNmWlp2SXpOQ090Y2QrMXRWWTRJZmU4QVVZ?=
 =?utf-8?B?TkRUMHpkTmNmVnkzKzJYVDQ3K0hsUmhhT2tBemNLekFYZlJJbk9FekxHeHkz?=
 =?utf-8?B?QUtSZ24veG9MMmU3c0ZlY0NwZE9DQ0RXUDNQell5Y3FiZ0FvVzEwQzNOMG04?=
 =?utf-8?Q?5ThN6DMhwvvNnS1EpPFCThxBwr87nc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(42112799006)(376014)(1800799024)(7416014)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dXVIYUlSV3hzOW1BUVlMc3ROdm11T0lsQ1IwdVFTcEpRVUUwSzUxYUVBbm4y?=
 =?utf-8?B?bmVJSENFaGpiZ2R4bGpiK3RZeUVCV21xRkNsQS9LN005MG5yWmsxT1ZXQ2V4?=
 =?utf-8?B?M3c0d0xIZnJnVEtvazdGV25nc1lBRktuV1ZjYTlaUDc2V21ZV3pOL2FEcGhR?=
 =?utf-8?B?NFNNRU8vMFYwdzl5U2R2dUdaa21qTEdHM3I0d3F4bjZNSXFiYi8vZ1BKbTcv?=
 =?utf-8?B?aGJlSmh0N3AyeERGeG55RmVyL05aZW9nNGNSZm42eCsvM25HR203TlBJQVRp?=
 =?utf-8?B?a2Y5Y2ZnZjREaGREb2lpOGpURUcyd2dVOWpFbVZXejZubkVPbG9uTWlLTTk0?=
 =?utf-8?B?b0hjbmlHSndPMEZSa0VHcStaOWsyNlNPakg3Ukk3VWZEUzRmMldvR0VkQytI?=
 =?utf-8?B?WFFaWjhMZkI5VjBXRjBRb3F5ZEtxSi81eDdQSjlPMFIzaVk3TmdxaHdnNEdQ?=
 =?utf-8?B?YUpna0lmZHlCVkVTZkg2WElVREpMS1dBbndEWlhsOHlSWlplRlAzLytBOG04?=
 =?utf-8?B?dTlzbjEweTRudUR5SjBSUHVyN2sraC9kY0FCQ3NVS0xBekFDcFBVYTJ0Tmhq?=
 =?utf-8?B?QXgxT1E5ZnRTQUt0NkpWSGZveWR5WHJZdHdMSXpUSkJKWmcvd2U4VUhoNmt5?=
 =?utf-8?B?YnhINlYwRFQraWg1WEFvT0tQTTk5Rkp0eXMzZXk3d2s1L1BUc2lqZnBLVGxL?=
 =?utf-8?B?em01K09BUDZIYU1pWERBRjZTQmNHN3p1KzI5cHhJTnNkWC90dS9pdStPLy96?=
 =?utf-8?B?Zm1ud0ZQamVKVThQR3FhcFZhZGptaVpUNU13WWZuOHQwN1ZvVmdLdW03YjdG?=
 =?utf-8?B?WVJpVENNS2ZKdzNuYm9kNUxRUWFxajVmOU5vWnRCcEkzTzRvcm5tZ2UrTUVm?=
 =?utf-8?B?S3J6K0VKOW1TWlRyL0FhM0NvVng4aXZDS0dMUWJIa1lHQjV0UlEzRVBCeUU1?=
 =?utf-8?B?elBpQ0NBUVRzTUFkVHIyZnJRWW1jUC9yY2pmWUlLT1hUQXJmdnQ3bTJUL01N?=
 =?utf-8?B?cU5WNm1DY3lVcEEwL2dCOVlhMXJmZGhFN1Rsb1VMWGs5eUd1K3dhVGc5c3Bk?=
 =?utf-8?B?M1NCeURLMHJLOFJ6V25BeXM5UlphRHIycCs1RVZubHZqMCtJcjR4V0VYK09y?=
 =?utf-8?B?MXNtOEFDellTY21sY25ha3l4ZmY4bTU5TUNDMTVzZTQ1RVBoWGtZeFJtKzBG?=
 =?utf-8?B?R1plajluc0U4TXR2V0tVOFhYYnVDdzY4UkhMQnJMZCtyVUNEOTdEaVc1aVJj?=
 =?utf-8?B?U1RIa1ZvU3grRDdFNUt5K1pCY1lmd0J6cXBOWkEyMUVRd21zdmo3ZFpNK2pD?=
 =?utf-8?B?ejlycEVic0syeWNMMU5qVVZUWVJqeWdiWWJVK0Zzbkh5SkFtQVhNOS9KaFRv?=
 =?utf-8?B?NDg4QXV2cHd6L3JwUEFkVVp5cUoxT1dDVXVVazFMM1BmZHFqWDBUbWZhZTNl?=
 =?utf-8?B?K0x4REhlVDNyWS9mQmhTUUpCU1FrNmV5OXRJa095c0xaTHFjQzgvRzRkcFQx?=
 =?utf-8?B?b1lpd1pBVVE3a0loMnE2SFJFTTZKZE5lT3FjbzFPNjA0TzIvd1RlZWtLb3dS?=
 =?utf-8?B?VlZMemgwYnlBUjh0QmxWVllqdkhTZGdwUHBPUnNFTjlTQjF6QWxsSTg5eWNu?=
 =?utf-8?B?Q0NCNmJFZ0o1dHJWdjYxRjVJV2REb3grdFJ6L0crUi9aUVRJZ3BXYXhZMEhT?=
 =?utf-8?B?WGNOQXJIdElJdHo3ZWNrUlVBSjJseXZ1UDNCV0ZodC9EejZBaXVCSXFqOEgw?=
 =?utf-8?B?Y3N4enFzNGdqcXN2NGlGU05FcTd1NTZsdHc0bk84MHo2UEdnZ2FLbjhUMzNx?=
 =?utf-8?B?VG9BZFkrVmJNZThjT295MmJ5SmNmWWJpZ1ROMW1tYkNKOCsrd2k2U3JXQlhJ?=
 =?utf-8?B?RWhyMGlySUtyZVlTU2l6eG1EcnJRQ2pwM0JESDIxZUs0YnBKNGVGbHI4UWhG?=
 =?utf-8?B?UWtjQmFEYVBaa3JlS0dmRWl2di9wRm43QzBUeEJhMHhvd0tBYW1TeUkxNnBR?=
 =?utf-8?B?T0E4UXdQLytxNU9WVytyOGpVU3pLODNCaHkvM0dsMVB2S3E0VzFmV0FFcEJQ?=
 =?utf-8?B?YThJK0o3cDllb055QmNua1hFc29JOHVTODg0K0NsWW1JT3VRUnF2R0x2aHFz?=
 =?utf-8?B?SWxXRFk0ODg3MU84NDh3TUFaRGdnSXNYT29pUXZ3L21TT0FZc2JWVVN6dWVr?=
 =?utf-8?B?akE9PQ==?=
Content-ID: <588379980EF37846A46AED3398518867@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a821d16-5859-43a3-8471-08dddf928b06
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2025 02:37:44.6607 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DODDPhut2Y7eBpZC3Dc9bliujsoLHx7LBA7/X+v46geO6CUwTeW534Q73Cv8zMhslJIzeXh0IqxZVqvHBz2r/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8054
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_008_1104855161.1225590925"
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

--__=_Part_Boundary_008_1104855161.1225590925
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCAyMDI1LTA4LTE4IGF0IDE2OjE3ICswMjAwLCBMb3Vpcy1BbGV4aXMgRXlyYXVkIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbCB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBj
b250ZW50Lg0KPiANCj4gDQo+IEluIG10a19oZG1pIGRyaXZlciwgYSByZWNlbnQgY2hhbmdlIHJl
cGxhY2VkIGN1c3RvbSByZWdpc3RlciBhY2Nlc3MNCj4gZnVuY3Rpb24gY2FsbHMgYnkgcmVnbWFw
IG9uZXMsIGJ1dCB0d28gcmVwbGFjZW1lbnRzIGJ5IHJlZ21hcF91cGRhdGVfYml0cw0KPiB3ZXJl
IGRvbmUgaW5jb3JyZWN0bHksIGJlY2F1c2Ugb3JpZ2luYWwgb2Zmc2V0IGFuZCBtYXNrIHBhcmFt
ZXRlcnMgd2VyZQ0KPiBpbnZlcnRlZCwgc28gZml4IHRoZW0uDQoNClJldmlld2VkLWJ5OiBDSyBI
dSA8Y2suaHVAbWVkaWF0ZWsuY29tPg0KDQo+IA0KPiBGaXhlczogZDZlMjViMzU5MGEwICgiZHJt
L21lZGlhdGVrOiBoZG1pOiBVc2UgcmVnbWFwIGluc3RlYWQgb2YgaW9tZW0gZm9yIG1haW4gcmVn
aXN0ZXJzIikNCj4gU2lnbmVkLW9mZi1ieTogTG91aXMtQWxleGlzIEV5cmF1ZCA8bG91aXNhbGV4
aXMuZXlyYXVkQGNvbGxhYm9yYS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19oZG1pLmMgfCA4ICsrKystLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1p
LmMNCj4gaW5kZXggODQ1ZmQ4YWE0M2MzYzkxNjU5ODA4ZDllNmJiNzg3NThkMWY5Yjg1Ny4uYjc2
NmRkNWU2YzhkZTZkMTZiZmY1MDk3MmI0NWMzYzFhMDgzYjk4NSAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19oZG1pLmMNCj4gQEAgLTE4Miw4ICsxODIsOCBAQCBzdGF0aWMgaW5saW5l
IHN0cnVjdCBtdGtfaGRtaSAqaGRtaV9jdHhfZnJvbV9icmlkZ2Uoc3RydWN0IGRybV9icmlkZ2Ug
KmIpDQo+IA0KPiAgc3RhdGljIHZvaWQgbXRrX2hkbWlfaHdfdmlkX2JsYWNrKHN0cnVjdCBtdGtf
aGRtaSAqaGRtaSwgYm9vbCBibGFjaykNCj4gIHsNCj4gLSAgICAgICByZWdtYXBfdXBkYXRlX2Jp
dHMoaGRtaS0+cmVncywgVklERU9fU09VUkNFX1NFTCwNCj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgVklERU9fQ0ZHXzQsIGJsYWNrID8gR0VOX1JHQiA6IE5PUk1BTF9QQVRIKTsNCj4gKyAg
ICAgICByZWdtYXBfdXBkYXRlX2JpdHMoaGRtaS0+cmVncywgVklERU9fQ0ZHXzQsDQo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgIFZJREVPX1NPVVJDRV9TRUwsIGJsYWNrID8gR0VOX1JHQiA6
IE5PUk1BTF9QQVRIKTsNCj4gIH0NCj4gDQo+ICBzdGF0aWMgdm9pZCBtdGtfaGRtaV9od19tYWtl
X3JlZ193cml0YWJsZShzdHJ1Y3QgbXRrX2hkbWkgKmhkbWksIGJvb2wgZW5hYmxlKQ0KPiBAQCAt
MzEwLDggKzMxMCw4IEBAIHN0YXRpYyB2b2lkIG10a19oZG1pX2h3X3NlbmRfaW5mb19mcmFtZShz
dHJ1Y3QgbXRrX2hkbWkgKmhkbWksIHU4ICpidWZmZXIsDQo+IA0KPiAgc3RhdGljIHZvaWQgbXRr
X2hkbWlfaHdfc2VuZF9hdWRfcGFja2V0KHN0cnVjdCBtdGtfaGRtaSAqaGRtaSwgYm9vbCBlbmFi
bGUpDQo+ICB7DQo+IC0gICAgICAgcmVnbWFwX3VwZGF0ZV9iaXRzKGhkbWktPnJlZ3MsIEFVRElP
X1BBQ0tFVF9PRkYsDQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgIEdSTF9TSElGVF9SMiwg
ZW5hYmxlID8gMCA6IEFVRElPX1BBQ0tFVF9PRkYpOw0KPiArICAgICAgIHJlZ21hcF91cGRhdGVf
Yml0cyhoZG1pLT5yZWdzLCBHUkxfU0hJRlRfUjIsDQo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgIEFVRElPX1BBQ0tFVF9PRkYsIGVuYWJsZSA/IDAgOiBBVURJT19QQUNLRVRfT0ZGKTsNCj4g
IH0NCj4gDQo+ICBzdGF0aWMgdm9pZCBtdGtfaGRtaV9od19jb25maWdfc3lzKHN0cnVjdCBtdGtf
aGRtaSAqaGRtaSkNCj4gDQo+IC0tLQ0KPiBiYXNlLWNvbW1pdDogYWZiMzk1NDJiYmYxNGFjZjkx
MDAxMmVlZTJkNDE1OWFkZDA1ZDM4NA0KPiBjaGFuZ2UtaWQ6IDIwMjUwODE4LW10ODE3My1maXgt
aGRtaS1pc3N1ZS0yODdjZjM1M2IwNzcNCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gLS0NCj4gTG91
aXMtQWxleGlzIEV5cmF1ZCA8bG91aXNhbGV4aXMuZXlyYXVkQGNvbGxhYm9yYS5jb20+DQo+IA0K
DQo=

--__=_Part_Boundary_008_1104855161.1225590925
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO01vbiwmIzMyOzIwMjUtMDgtMTgmIzMyO2F0
JiMzMjsxNjoxNyYjMzI7KzAyMDAsJiMzMjtMb3Vpcy1BbGV4aXMmIzMyO0V5cmF1ZCYjMzI7d3Jv
dGU6DQomZ3Q7JiMzMjtFeHRlcm5hbCYjMzI7ZW1haWwmIzMyOzomIzMyO1BsZWFzZSYjMzI7ZG8m
IzMyO25vdCYjMzI7Y2xpY2smIzMyO2xpbmtzJiMzMjtvciYjMzI7b3BlbiYjMzI7YXR0YWNobWVu
dHMmIzMyO3VudGlsJiMzMjt5b3UmIzMyO2hhdmUmIzMyO3ZlcmlmaWVkJiMzMjt0aGUmIzMyO3Nl
bmRlciYjMzI7b3ImIzMyO3RoZSYjMzI7Y29udGVudC4NCiZndDsmIzMyOw0KJmd0OyYjMzI7DQom
Z3Q7JiMzMjtJbiYjMzI7bXRrX2hkbWkmIzMyO2RyaXZlciwmIzMyO2EmIzMyO3JlY2VudCYjMzI7
Y2hhbmdlJiMzMjtyZXBsYWNlZCYjMzI7Y3VzdG9tJiMzMjtyZWdpc3RlciYjMzI7YWNjZXNzDQom
Z3Q7JiMzMjtmdW5jdGlvbiYjMzI7Y2FsbHMmIzMyO2J5JiMzMjtyZWdtYXAmIzMyO29uZXMsJiMz
MjtidXQmIzMyO3R3byYjMzI7cmVwbGFjZW1lbnRzJiMzMjtieSYjMzI7cmVnbWFwX3VwZGF0ZV9i
aXRzDQomZ3Q7JiMzMjt3ZXJlJiMzMjtkb25lJiMzMjtpbmNvcnJlY3RseSwmIzMyO2JlY2F1c2Um
IzMyO29yaWdpbmFsJiMzMjtvZmZzZXQmIzMyO2FuZCYjMzI7bWFzayYjMzI7cGFyYW1ldGVycyYj
MzI7d2VyZQ0KJmd0OyYjMzI7aW52ZXJ0ZWQsJiMzMjtzbyYjMzI7Zml4JiMzMjt0aGVtLg0KDQpS
ZXZpZXdlZC1ieTomIzMyO0NLJiMzMjtIdSYjMzI7Jmx0O2NrLmh1QG1lZGlhdGVrLmNvbSZndDsN
Cg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtGaXhlczomIzMyO2Q2ZTI1YjM1OTBhMCYjMzI7KCZxdW90
O2RybS9tZWRpYXRlazomIzMyO2hkbWk6JiMzMjtVc2UmIzMyO3JlZ21hcCYjMzI7aW5zdGVhZCYj
MzI7b2YmIzMyO2lvbWVtJiMzMjtmb3ImIzMyO21haW4mIzMyO3JlZ2lzdGVycyZxdW90OykNCiZn
dDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtMb3Vpcy1BbGV4aXMmIzMyO0V5cmF1ZCYjMzI7Jmx0
O2xvdWlzYWxleGlzLmV5cmF1ZEBjb2xsYWJvcmEuY29tJmd0Ow0KJmd0OyYjMzI7LS0tDQomZ3Q7
JiMzMjsmIzMyO2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jJiMzMjt8JiMzMjs4
JiMzMjsrKysrLS0tLQ0KJmd0OyYjMzI7JiMzMjsxJiMzMjtmaWxlJiMzMjtjaGFuZ2VkLCYjMzI7
NCYjMzI7aW5zZXJ0aW9ucygrKSwmIzMyOzQmIzMyO2RlbGV0aW9ucygtKQ0KJmd0OyYjMzI7DQom
Z3Q7JiMzMjtkaWZmJiMzMjstLWdpdCYjMzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2hkbWkuYyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYw0KJmd0OyYj
MzI7aW5kZXgmIzMyOzg0NWZkOGFhNDNjM2M5MTY1OTgwOGQ5ZTZiYjc4NzU4ZDFmOWI4NTcuLmI3
NjZkZDVlNmM4ZGU2ZDE2YmZmNTA5NzJiNDVjM2MxYTA4M2I5ODUmIzMyOzEwMDY0NA0KJmd0OyYj
MzI7LS0tJiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jDQomZ3Q7JiMz
MjsrKysmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMNCiZndDsmIzMy
O0BAJiMzMjstMTgyLDgmIzMyOysxODIsOCYjMzI7QEAmIzMyO3N0YXRpYyYjMzI7aW5saW5lJiMz
MjtzdHJ1Y3QmIzMyO210a19oZG1pJiMzMjsqaGRtaV9jdHhfZnJvbV9icmlkZ2Uoc3RydWN0JiMz
Mjtkcm1fYnJpZGdlJiMzMjsqYikNCiZndDsmIzMyOw0KJmd0OyYjMzI7JiMzMjtzdGF0aWMmIzMy
O3ZvaWQmIzMyO210a19oZG1pX2h3X3ZpZF9ibGFjayhzdHJ1Y3QmIzMyO210a19oZG1pJiMzMjsq
aGRtaSwmIzMyO2Jvb2wmIzMyO2JsYWNrKQ0KJmd0OyYjMzI7JiMzMjt7DQomZ3Q7JiMzMjstJiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtyZWdtYXBfdXBkYXRlX2JpdHMoaGRtaS0m
Z3Q7cmVncywmIzMyO1ZJREVPX1NPVVJDRV9TRUwsDQomZ3Q7JiMzMjstJiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
O1ZJREVPX0NGR180LCYjMzI7YmxhY2smIzMyOyYjNjM7JiMzMjtHRU5fUkdCJiMzMjs6JiMzMjtO
T1JNQUxfUEFUSCk7DQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjtyZWdtYXBfdXBkYXRlX2JpdHMoaGRtaS0mZ3Q7cmVncywmIzMyO1ZJREVPX0NGR180LA0KJmd0
OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtWSURFT19TT1VSQ0VfU0VMLCYjMzI7YmxhY2smIzMyOyYj
NjM7JiMzMjtHRU5fUkdCJiMzMjs6JiMzMjtOT1JNQUxfUEFUSCk7DQomZ3Q7JiMzMjsmIzMyO30N
CiZndDsmIzMyOw0KJmd0OyYjMzI7JiMzMjtzdGF0aWMmIzMyO3ZvaWQmIzMyO210a19oZG1pX2h3
X21ha2VfcmVnX3dyaXRhYmxlKHN0cnVjdCYjMzI7bXRrX2hkbWkmIzMyOypoZG1pLCYjMzI7Ym9v
bCYjMzI7ZW5hYmxlKQ0KJmd0OyYjMzI7QEAmIzMyOy0zMTAsOCYjMzI7KzMxMCw4JiMzMjtAQCYj
MzI7c3RhdGljJiMzMjt2b2lkJiMzMjttdGtfaGRtaV9od19zZW5kX2luZm9fZnJhbWUoc3RydWN0
JiMzMjttdGtfaGRtaSYjMzI7KmhkbWksJiMzMjt1OCYjMzI7KmJ1ZmZlciwNCiZndDsmIzMyOw0K
Jmd0OyYjMzI7JiMzMjtzdGF0aWMmIzMyO3ZvaWQmIzMyO210a19oZG1pX2h3X3NlbmRfYXVkX3Bh
Y2tldChzdHJ1Y3QmIzMyO210a19oZG1pJiMzMjsqaGRtaSwmIzMyO2Jvb2wmIzMyO2VuYWJsZSkN
CiZndDsmIzMyOyYjMzI7ew0KJmd0OyYjMzI7LSYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7cmVnbWFwX3VwZGF0ZV9iaXRzKGhkbWktJmd0O3JlZ3MsJiMzMjtBVURJT19QQUNLRVRf
T0ZGLA0KJmd0OyYjMzI7LSYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtHUkxfU0hJRlRfUjIsJiMzMjtlbmFibGUm
IzMyOyYjNjM7JiMzMjswJiMzMjs6JiMzMjtBVURJT19QQUNLRVRfT0ZGKTsNCiZndDsmIzMyOysm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3JlZ21hcF91cGRhdGVfYml0cyhoZG1p
LSZndDtyZWdzLCYjMzI7R1JMX1NISUZUX1IyLA0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtB
VURJT19QQUNLRVRfT0ZGLCYjMzI7ZW5hYmxlJiMzMjsmIzYzOyYjMzI7MCYjMzI7OiYjMzI7QVVE
SU9fUEFDS0VUX09GRik7DQomZ3Q7JiMzMjsmIzMyO30NCiZndDsmIzMyOw0KJmd0OyYjMzI7JiMz
MjtzdGF0aWMmIzMyO3ZvaWQmIzMyO210a19oZG1pX2h3X2NvbmZpZ19zeXMoc3RydWN0JiMzMjtt
dGtfaGRtaSYjMzI7KmhkbWkpDQomZ3Q7JiMzMjsNCiZndDsmIzMyOy0tLQ0KJmd0OyYjMzI7YmFz
ZS1jb21taXQ6JiMzMjthZmIzOTU0MmJiZjE0YWNmOTEwMDEyZWVlMmQ0MTU5YWRkMDVkMzg0DQom
Z3Q7JiMzMjtjaGFuZ2UtaWQ6JiMzMjsyMDI1MDgxOC1tdDgxNzMtZml4LWhkbWktaXNzdWUtMjg3
Y2YzNTNiMDc3DQomZ3Q7JiMzMjsNCiZndDsmIzMyO0Jlc3QmIzMyO3JlZ2FyZHMsDQomZ3Q7JiMz
MjstLQ0KJmd0OyYjMzI7TG91aXMtQWxleGlzJiMzMjtFeXJhdWQmIzMyOyZsdDtsb3Vpc2FsZXhp
cy5leXJhdWRAY29sbGFib3JhLmNvbSZndDsNCiZndDsmIzMyOw0KDQoNCjwvcHJlPg0KPC9wPjwv
Ym9keT48L2h0bWw+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1F
RElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UNCiAqKioqKioqKioqKioqKioqKioqKg0KVGhl
IGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcg
YW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2
aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGlj
YWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRl
c2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1
dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNs
dWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0
cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBh
biBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUNCiANCnRoYXQg
eW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhl
IHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0
ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRh
Y2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRl
bnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+
PCEtLX0tLT4=

--__=_Part_Boundary_008_1104855161.1225590925--

