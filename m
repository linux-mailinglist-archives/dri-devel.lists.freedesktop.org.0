Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC20A89635
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 10:14:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E29210E681;
	Tue, 15 Apr 2025 08:14:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Gr0Wi3/2";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="XAYkUWSq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B5F210E680
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 08:14:28 +0000 (UTC)
X-UUID: 9ead0b2619d111f08eb9c36241bbb6fb-20250415
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=RsIZi3xDmLWI7WgTzl9rmiEpPnDKqk/ksHdRIIYAno4=; 
 b=Gr0Wi3/2a1MrOs5jhG/q+WtfAs+FX3BYRWXx6OnMLbK4vbTG7jaw//pYsPDfNSfL+tkxrwaW37vx/N8NhBxsQ67/M/7jwNKOlE+L7Ab3SrCfGfp2/k6/7VbQH0YFDN/R976qwd88uRNBvn7QJPP7YB90rgcbuGR55JyBomY7CN4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1, REQID:1e2c98c1-1666-4f85-a1c4-be502a68fef9, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:0ef645f, CLOUDID:a67fa08d-f5b8-47d5-8cf3-b68fe7530c9a,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
 nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
 OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 9ead0b2619d111f08eb9c36241bbb6fb-20250415
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 948478134; Tue, 15 Apr 2025 16:14:14 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 15 Apr 2025 16:14:13 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 15 Apr 2025 16:14:13 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K1PmiqpsiZuGy3AsXqeYefD/EAKv0V97gUobdzSHNsGqjqDgadrfRv9IjnoT7vy7torEutaZ+xoVfZjOEawAlbohDKKDHwJNqXHmcGqOS0XCbZFo0220CE8sL68Cm3r6k3Yg4Hq4a34apISGgxkxQAFZ2Z73SUKXUP58vJEEEi5Shkwn/46FgSqXo0nEfRwdfvd3w7HYBjpS7K3p8ESHU6u2QqfE0INQdKs4OLF6and6sC0pQGV83+QXRmZ2UuVMXeWvk2CyIuJVXAHozYRiCDAMIRsE+a1cchCbmL3y7WA9YCn0fD/UIGk3A2yBQXtjxGSdf0RtMFbIHdOfu9E10g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CcMijCRD7dyTwYUmUYvTzqqgLCWuO+dJkcSjSLQ1AUc=;
 b=dqqmxFnLZQvoidrh+69dr7RH5kfwYcds780U4PwJd3xWmWv81gcY17MouwpvSQA/E8GO5hn/GITWBv//BD/aPnDxaUnMusMpOkTZPcF8mVXK9Q7KemNUANNWebiS1AdkAPVGLg0KxA/Gl35LyMMJlpu3B9AGJIEdVF6Bb6I2uCM4WP7IhSMAVR5Yde0Q46ZeC5EQyWUjfNjZrA3tlRwE4LjUlNF02SmQxyuFA+7uCk4g2YDcf/bG5h+/nAV5xNPYg0c05OSYQOsXIuJBGwp3z+34qQqpHiPU6ZdYtSjqLnyhQyLuqtpJRFQR9+z2Vb32r9wyi5xR3ZHUJzooxvzrug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CcMijCRD7dyTwYUmUYvTzqqgLCWuO+dJkcSjSLQ1AUc=;
 b=XAYkUWSqMzBMdfk52kgzkZonxLOTwQnbcjhZbyJzUmfzCHIvwO7K1qxXrpGJW7ERWqX2oU6bUls16+mO3puducPCn5Chv8kwLTN62TfwVJXKttWnSaMpD9RDKaANZpYRrVyCNnOqt6RK2SA8YZIoG2RMjLacR/emgY+mD0a9V8c=
Received: from SEYPR03MB6626.apcprd03.prod.outlook.com (2603:1096:101:83::7)
 by JH0PR03MB8810.apcprd03.prod.outlook.com (2603:1096:990:a9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.36; Tue, 15 Apr
 2025 08:14:11 +0000
Received: from SEYPR03MB6626.apcprd03.prod.outlook.com
 ([fe80::9fa0:ee98:d5ed:beba]) by SEYPR03MB6626.apcprd03.prod.outlook.com
 ([fe80::9fa0:ee98:d5ed:beba%3]) with mapi id 15.20.8632.035; Tue, 15 Apr 2025
 08:14:11 +0000
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
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 =?utf-8?B?TGV3aXMgTGlhbyAo5buW5p+P6YieKQ==?= <Lewis.Liao@mediatek.com>,
 "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, =?utf-8?B?VG9tbXlZTCBDaGVuICjpmbPlvaXoia8p?=
 <TommyYL.Chen@mediatek.com>, =?utf-8?B?SXZlcyBDaGVuamggKOmZs+S/iuW8mCk=?=
 <Ives.Chenjh@mediatek.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?=
 <Jason-JH.Lin@mediatek.com>, "junzhi.zhao@mediatek.com"
 <junzhi.zhao@mediatek.com>
Subject: Re: [PATCH v8 23/23] drm/mediatek/hdmi: Use
 syscon_regmap_lookup_by_phandle_args
Thread-Topic: [PATCH v8 23/23] drm/mediatek/hdmi: Use
 syscon_regmap_lookup_by_phandle_args
Thread-Index: AQHbqVGCVlkQkp8w90q75SV+vls81rOkahaA
Date: Tue, 15 Apr 2025 08:14:11 +0000
Message-ID: <a73ae86c406de1002c7fcff9f34c2eeaaa5f03dc.camel@mediatek.com>
References: <20250409131318.108690-1-angelogioacchino.delregno@collabora.com>
 <20250409131318.108690-24-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250409131318.108690-24-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB6626:EE_|JH0PR03MB8810:EE_
x-ms-office365-filtering-correlation-id: 05a2094c-b9bb-4cc1-2429-08dd7bf580af
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?azBSa2xpdmp4M0g2Ylp2UDJtWVgyNVFxVDExdHZkU0N2TnQwUXJIWVBMc0FE?=
 =?utf-8?B?V1lnZXJHUmFDNWtyTHEvMG5kOStaSndMVFFOTEtlcm5QQmhJWWh4dDhMR0g2?=
 =?utf-8?B?RzNmeW1MTklJWUQrOURpbHBzYjMwVnpjbzd5UkYrc2hEdStuMWdKNVZ5amxa?=
 =?utf-8?B?cnZNOU00bnBtTXMzZGdCT2xlSlhYRHlCSUNBaE0wckpCY041eGFpQXBOUlF4?=
 =?utf-8?B?d0ovcWViTktIZHZKL1RTSEtvRCtGd0xMYWNIeU91cHA1MkoyOWZrc2FrNmgr?=
 =?utf-8?B?QWlsSm83a0lUaHlnODBOclJmRkNVaC9yQUJ1eVVxQ1EwOEVPR2xKMEJ6SXhl?=
 =?utf-8?B?Q2JCMDV0bGJGYlNxUTFqUnJPd3VOZTFJVWpLeFdjU09KQUpTM01HdzNMZ1hS?=
 =?utf-8?B?emN6RnphRmNhc1JiQXcxQUR4dDlqQ1A4SjJsaXpFd254TXRaT3lOT0FMZVhT?=
 =?utf-8?B?L0VuZVQ5TDIxSTVUS0FSV2Z0cDl0ZDdDK3F2d2RGbXJaYXlFY0ZlMnAvSHQ4?=
 =?utf-8?B?aElSOGhMMlZXTzhVckVXQmNMTDlUR0ZGVjl3ajNIS1RHcmVodGtUeUdoS2Iv?=
 =?utf-8?B?K2p1US9DY2R6NnZIZ0lnUjVIZ2ZwNXg4VTNKNHBjcERjUlcyQWFRanFaSHNy?=
 =?utf-8?B?Wkw3akp5cUV4UjlZM2pUbHRBeFpjTW5rcThsbXJJdGl3aEtFUGhQNFdnMmVx?=
 =?utf-8?B?SC9kUWpGQ1lNdXpwQmhrRVdDcEN4VXpEZFJvN2MwT3h5dU5RWWJVT1FwS0Mz?=
 =?utf-8?B?QVNpVS94K3R2K1ByekcwN3o1RWN6VFB2YXFEY2RiZmRtWGdTeE05eTFud0Nx?=
 =?utf-8?B?VldsSWNqd1diMERJZE1ERUhUUnlra201STAvQjFBc1JCUGVTSUNhWHNIa25Z?=
 =?utf-8?B?MFhtVVdCaHlOeHhFOVhBcjBuOFJuRGwxY0gxOFdMTjhkRXM1U0FDRXlpOFZV?=
 =?utf-8?B?UEhPSVRjR1AwM1JzNDIrbFRyUy91NWNjOU1IcFRNNjh0SU9TclZmdndBS2Va?=
 =?utf-8?B?eEoxTE51ZkdzKzN2NWxzRUwrdHE4UkpGaEx3OU1FZjBCYThjMXZhZUVXbXdn?=
 =?utf-8?B?Kyt0ampFaEpBU29KQUNseHNka3FqZVhKWFB2Y01RUlA1SzBtdWJHNVRvK2I3?=
 =?utf-8?B?Wjl5Mm9weDFteDJaYk1nRkJPRU5Rekc4dm93V3lrNGdVSVF6OXNOQi95b1BC?=
 =?utf-8?B?c0I3Lzl0RDBDdDB0VjdXcDFoaU1aM2xtSU5hY1BtU2w4TkFrWGlUb0xITnhV?=
 =?utf-8?B?WE9RRGc0UmF6WC82R1M1MTU1ZURzTVNyZHlZWHU0OWZlSjBEWTRmcDRDQ29v?=
 =?utf-8?B?TjM3UzB1MERzS05ycWxRL0FOSlUrengvTHpUaE41TURTVDRJMjBKazZHSTRN?=
 =?utf-8?B?VHkrZzVXVVV1OWN0NUIvNGI0M1g4TU4wbkVrbXBFNXNESEdSazhMbjZBRS9t?=
 =?utf-8?B?bmlDcDFyNFdxeWVXZk40NEptbkFYbkNHWXdZZHh6aVI0a3ZzYUlTazRFNklX?=
 =?utf-8?B?VlFpSVA3QzUwb1hUaW5IOUpQUXZ3RzlIOVVQVEFlQUt3Tis0MS8yb2NacjEr?=
 =?utf-8?B?QUVxWUlYS2xMN0hrTGl3Z29WRlY5dFVGbmNmOG02QnFVU2VUYXZmeTk3aGJ1?=
 =?utf-8?B?Qi9SczBELzdBL2k0dDhFbWpRazlGT2dqMk9hbGR0RmhYVlEzRWdlSi8wMzJT?=
 =?utf-8?B?cUt2ZUg5Z0xJTlUwWk55dWdieHBlakpmdWhqSmttTE92ZWVyNkhiQjBsbm5y?=
 =?utf-8?B?THYrQTFJenJURXN1ZDVvRUwvZjZLckRIRkY2dnRzZjR3d2NNUitTalVzQ3pC?=
 =?utf-8?B?QlhBUnk2T1d2eGcrKzBtaVNCVDllOUY5blFHUG96OWtOWEtHQWNiOHhyYnlk?=
 =?utf-8?B?cUg1ell4NzYwdVoyYXlhOU5nUXNjT00vK0gyRG1ScFBjbm0veE5yVW14Q0R2?=
 =?utf-8?B?L2w5eW14MGw3cXBheVplN1lLWER4VHloMjBPNEdyYU5VQktrNzBZUDhUTFdO?=
 =?utf-8?B?bkRyMzZESmF3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB6626.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SFptT1Z5cVFYblpGS21Pb1VjRkxTREFNcFlmd2RtVmpEblF3QldIYWZURFEz?=
 =?utf-8?B?aU1ON09TOTBMb1F3S0trQkxrVHpXTGpxV2VucGlxUEtyaTdaYnBrRzAvdDBG?=
 =?utf-8?B?T242Mkt1UkViKytGcnB0TmdqT2hMRlpSQkl4UjZGblhBZHFmMFRWeldZZmtP?=
 =?utf-8?B?ZHcwcnlIUDdtRlJxQmhxb0YvSlEvWlBnVlJ4cHYxMGtvWUtYOWk5TitGZzZP?=
 =?utf-8?B?dkZqZVhGWEt5K0VMdzA0UGJESEVTS0lyaEdncDkzR2hlbTRjZk9lZlh5akE2?=
 =?utf-8?B?T3YzNnROQkZTV1ByVjZ1LyszS1J1aTJjWjFZYVZyTGtZNHBWU2RMMTk2V29N?=
 =?utf-8?B?d3hUOGZEWW9talUxQ05Sb0pIeW1oVDl3Z2xVNlp2T1BBZkNmM2p4YVhLZDVs?=
 =?utf-8?B?L1cvQUxTS2ttL0RiNEJ5Q2g2S094L1lwTktsd3QrTnJZRWhnY2ZPOE0rQkVD?=
 =?utf-8?B?VFJhUW84NEFkOFRUcDFvRERqMTB6UDRLUWNaZGtGR1ljd1dLbG81Y0xkaGZk?=
 =?utf-8?B?QmcvdU5kckoxVWo4Z3ZNajhwT0dZWFBKRngyMFFPL0dEbzVFdjAyT2prU01k?=
 =?utf-8?B?VXFzNFVPYWZrUk16cHBHV2Y5M1IwSmxiTnd4TnVVbWREZzQwY3dheG95ZDVV?=
 =?utf-8?B?UEhUWVlFUHNUUUZXNExZa2czMGZWa1kzdXF5R1VXTDJqeVpmRUlQV3lBdlJB?=
 =?utf-8?B?ZG1XV1RyRm53c3M1Skp1TkNuQXUvZTB3UTRtOFQzd3d3TUhVS2NPV2ppZTdX?=
 =?utf-8?B?VStITkdvQlRZZ1phVzhPWVpkR2o1UmQrMmpFMHRONFRwVmhXTWtDNjQ1YTVs?=
 =?utf-8?B?NkQ0OFkxTVNwUHBoZDBudzIwOUl3cjFXMmZ0WkpaQ0o0Y2NHWmQrRXVpeGtX?=
 =?utf-8?B?VHdISGJ5emlZeFVLeWkzajg1RHJpbmpEaTJlNXgzM0ttbXVIaWRpbXoyaUxH?=
 =?utf-8?B?akE1UWJPcWdIZFlrVnA0N3ZORURjeXlPMDFOcWRLSUdxcWhUU09lUjBLUVF3?=
 =?utf-8?B?VnRJa2VzMStuZmZMa1d4TTdkR1FxRzVNT0hTRHRBcFFiR1hlNUhzSFVRSWdn?=
 =?utf-8?B?Snd0dFVVNm9LYjkzdE1KK0kxdEM3Q3RxWjA1TUJid3hmdzg4eHZtVUNUZFBk?=
 =?utf-8?B?aDZmR1J5eEVtUm9ZOGdpaVllMFQvK1QwalRnTC8ydEpCbm5sTm5ZRFIwN1lF?=
 =?utf-8?B?YlNnaENOOVhTQUx4SzczajRiRHVCL0ZxTzVhV1dKd3dHV0RMZk9aMW5zMSs3?=
 =?utf-8?B?ZFlrRFZPcTdxSGU0SDVNN2YyRmhXajhuOFpJSXR6NTlUY0ZzaUltUDlqTkxo?=
 =?utf-8?B?ekVnYlZ2bGFLVENDNCtxdExWVHFjMDdldjRyOG0yaHJPMU1JalVMdGtmYjNK?=
 =?utf-8?B?aVNCb2hyNGt2WlpRamVNZHBzcHkwQkJYYXZYSHlxeEJZK1c0M2RJQ01zWWN0?=
 =?utf-8?B?T1RXeFFOY2dWNVJNZXpHOGpGTWVEWkVIRnREYlNRN3ZXSEFrYlVOYXlOQTc1?=
 =?utf-8?B?NEJad3AxVE1CSnFIQWpMTzMxak5ua0ZybWRoR2lsVDVUa3lBUmgzQmdqTFVU?=
 =?utf-8?B?RjZBVnUvakdjcStyYUNheFI4bi9MRlpwMmVKREFqSG51dTBvWjdkMWZpa2p5?=
 =?utf-8?B?V2hrUkxMaVhMYm5teU9wS3V2bzlMbDVvVVFzS0Q3N2lsRnprZWxQc0FweHBs?=
 =?utf-8?B?UXdmNXV2amNubWhTYWduYlgxZjhLYVVWN3pjaGd4OFRJampKaFpxVTRmZkFx?=
 =?utf-8?B?RkllZTRHWG4zMk04djU5ZkdkKzhxZDV5V2pKRWI5WmtnYUVyeDgyc3BLTmFP?=
 =?utf-8?B?akZYUUV3MUdrOVJoMUduTThBbElCM2FmQllxNSt4VjlBV1FRNitLTENTaHM0?=
 =?utf-8?B?YndabmxEWHJtQVMvRVVrVnJ6RThhMlJYRlpWZkg0ZXJ0Y2FVMmt4TWRmVE13?=
 =?utf-8?B?a2hYVzB5U1cwT2hCS3QrQlhLNXBSQzB2RGk0Qkg5OTU2azdScmxXdllrYUdu?=
 =?utf-8?B?VzFIQ0JSUUg0N0hSZXZMcXQzL2krMDhBd01NTWVtaDB5UThZYjgxSG80NGxS?=
 =?utf-8?B?ZFdXVkRrNVdPdkg0YnFsUS9GaVpYRWxzcllBTmtLRU1ScnkrcklHQW9waWJR?=
 =?utf-8?B?eXZVbmdGWDhUWVB3MmxhR3BoZUdFZDFaZlhKdWNvZHhDVS9oaUdsa3ZFbTVr?=
 =?utf-8?B?MGc9PQ==?=
Content-ID: <650FD8405F9B574088B312A1A6CD95C3@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB6626.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05a2094c-b9bb-4cc1-2429-08dd7bf580af
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2025 08:14:11.2548 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uF61ebSUZaU9MzFiKERpdxYMvVHuucBIQDLcptrzhIz7xTIGbqP6J9xxk7PYmxRpIOSdAOMok4tSmVbDUgHALg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB8810
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_003_217441217.352315572"
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

--__=_Part_Boundary_003_217441217.352315572
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEFuZ2VsbzoNCg0KT24gV2VkLCAyMDI1LTA0LTA5IGF0IDE1OjEzICswMjAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZp
ZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBGcm9tOiBLcnp5c3p0b2Yg
S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+DQo+IA0KPiBVc2Ugc3lz
Y29uX3JlZ21hcF9sb29rdXBfYnlfcGhhbmRsZV9hcmdzKCkgd2hpY2ggaXMgYSB3cmFwcGVyIG92
ZXINCj4gc3lzY29uX3JlZ21hcF9sb29rdXBfYnlfcGhhbmRsZSgpIGNvbWJpbmVkIHdpdGggZ2V0
dGluZyB0aGUgc3lzY29uDQo+IGFyZ3VtZW50LiAgRXhjZXB0IHNpbXBsZXIgY29kZSB0aGlzIGFu
bm90YXRlcyB3aXRoaW4gb25lIGxpbmUgdGhhdCBnaXZlbg0KPiBwaGFuZGxlIGhhcyBhcmd1bWVu
dHMsIHNvIGdyZXBwaW5nIGZvciBjb2RlIHdvdWxkIGJlIGVhc2llci4NCj4gDQo+IFRoZXJlIGlz
IGFsc28gbm8gcmVhbCBiZW5lZml0IGluIHByaW50aW5nIGVycm9ycyBvbiBtaXNzaW5nIHN5c2Nv
bg0KPiBhcmd1bWVudCwgYmVjYXVzZSB0aGlzIGlzIGRvbmUganVzdCB0b28gbGF0ZTogcnVudGlt
ZSBjaGVjayBvbg0KPiBzdGF0aWMvYnVpbGQtdGltZSBkYXRhLiAgRHRzY2hlbWEgYW5kIERldmlj
ZXRyZWUgYmluZGluZ3Mgb2ZmZXIgdGhlDQo+IHN0YXRpYy9idWlsZC10aW1lIGNoZWNrIGZvciB0
aGlzIGFscmVhZHkuDQoNClBsZWFzZSByZWJhc2UgdGhpcyBwYXRjaCB0byB0aGUgZmlyc3QgcGF0
Y2ggb2YgdGhpcyBzZXJpZXMuDQpJIHdvdWxkIGxpa2UgdG8gYXBwbHkgcmVmaW5lbWVudCBwYXRj
aCBmaXJzdCB0aGVuIGFwcGx5IGhkbWkgdjIgcGF0Y2hlcy4NCg0KUmVnYXJkcywNCkNLDQoNCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dz
a2lAbGluYXJvLm9yZz4NCj4gW0FuZ2VsbzogUmViYXNlZCBvdmVyIEhETUl2Mi9EREN2MiBzZXJp
ZXMgY2xlYW51cHNdDQo+IFJldmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPg0K
PiBTaWduZWQtb2ZmLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8YW5nZWxvZ2lvYWNj
aGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfaGRtaV9jb21tb24uYyB8IDcgKystLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWlfY29tbW9uLmMgYi9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2hkbWlfY29tbW9uLmMNCj4gaW5kZXggNzg0YmMwNWM5NTQxLi4wMGE2Mzhh
M2NhZjQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaV9j
b21tb24uYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWlfY29tbW9u
LmMNCj4gQEAgLTI2OSwxMiArMjY5LDkgQEAgc3RhdGljIGludCBtdGtfaGRtaV9nZXRfY2VjX2Rl
dihzdHJ1Y3QgbXRrX2hkbWkgKmhkbWksIHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWMNCj4gICAg
ICAgICAgKiBNTVNZU19DT05GSUcgZGV2aWNlIGFuZCB0aGUgcmVnaXN0ZXIgb2Zmc2V0IG9mIHRo
ZSBIRE1JX1NZU19DRkcNCj4gICAgICAgICAgKiByZWdpc3RlcnMgaXQgY29udGFpbnMuDQo+ICAg
ICAgICAgICovDQo+IC0gICAgICAgaGRtaS0+c3lzX3JlZ21hcCA9IHN5c2Nvbl9yZWdtYXBfbG9v
a3VwX2J5X3BoYW5kbGUobnAsICJtZWRpYXRlayxzeXNjb24taGRtaSIpOw0KPiArICAgICAgIGhk
bWktPnN5c19yZWdtYXAgPSBzeXNjb25fcmVnbWFwX2xvb2t1cF9ieV9waGFuZGxlX2FyZ3MobnAs
ICJtZWRpYXRlayxzeXNjb24taGRtaSIsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAxLCAmaGRtaS0+c3lzX29mZnNldCk7
DQo+ICAgICAgICAgaWYgKElTX0VSUihoZG1pLT5zeXNfcmVnbWFwKSkNCj4gLSAgICAgICAgICAg
ICAgIHJldHVybiBQVFJfRVJSKGhkbWktPnN5c19yZWdtYXApOw0KPiAtDQo+IC0gICAgICAgcmV0
ID0gb2ZfcHJvcGVydHlfcmVhZF91MzJfaW5kZXgobnAsICJtZWRpYXRlayxzeXNjb24taGRtaSIs
IDEsICZoZG1pLT5zeXNfb2Zmc2V0KTsNCj4gLSAgICAgICBpZiAocmV0KQ0KPiAgICAgICAgICAg
ICAgICAgcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCByZXQsDQo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAiRmFpbGVkIHRvIGdldCBzeXN0ZW0gY29uZmlndXJhdGlvbiBy
ZWdpc3RlcnNcbiIpOw0KPiANCj4gLS0NCj4gMi40OS4wDQo+IA0KDQo=

--__=_Part_Boundary_003_217441217.352315572
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtBbmdlbG86DQoNCk9uJiMzMjtXZWQsJiMz
MjsyMDI1LTA0LTA5JiMzMjthdCYjMzI7MTU6MTMmIzMyOyswMjAwLCYjMzI7QW5nZWxvR2lvYWNj
aGlubyYjMzI7RGVsJiMzMjtSZWdubyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjtFeHRlcm5hbCYjMzI7
ZW1haWwmIzMyOzomIzMyO1BsZWFzZSYjMzI7ZG8mIzMyO25vdCYjMzI7Y2xpY2smIzMyO2xpbmtz
JiMzMjtvciYjMzI7b3BlbiYjMzI7YXR0YWNobWVudHMmIzMyO3VudGlsJiMzMjt5b3UmIzMyO2hh
dmUmIzMyO3ZlcmlmaWVkJiMzMjt0aGUmIzMyO3NlbmRlciYjMzI7b3ImIzMyO3RoZSYjMzI7Y29u
dGVudC4NCiZndDsmIzMyOw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtGcm9tOiYjMzI7S3J6eXN6dG9m
JiMzMjtLb3psb3dza2kmIzMyOyZsdDtrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmcmZ3Q7
DQomZ3Q7JiMzMjsNCiZndDsmIzMyO1VzZSYjMzI7c3lzY29uX3JlZ21hcF9sb29rdXBfYnlfcGhh
bmRsZV9hcmdzKCkmIzMyO3doaWNoJiMzMjtpcyYjMzI7YSYjMzI7d3JhcHBlciYjMzI7b3Zlcg0K
Jmd0OyYjMzI7c3lzY29uX3JlZ21hcF9sb29rdXBfYnlfcGhhbmRsZSgpJiMzMjtjb21iaW5lZCYj
MzI7d2l0aCYjMzI7Z2V0dGluZyYjMzI7dGhlJiMzMjtzeXNjb24NCiZndDsmIzMyO2FyZ3VtZW50
LiYjMzI7JiMzMjtFeGNlcHQmIzMyO3NpbXBsZXImIzMyO2NvZGUmIzMyO3RoaXMmIzMyO2Fubm90
YXRlcyYjMzI7d2l0aGluJiMzMjtvbmUmIzMyO2xpbmUmIzMyO3RoYXQmIzMyO2dpdmVuDQomZ3Q7
JiMzMjtwaGFuZGxlJiMzMjtoYXMmIzMyO2FyZ3VtZW50cywmIzMyO3NvJiMzMjtncmVwcGluZyYj
MzI7Zm9yJiMzMjtjb2RlJiMzMjt3b3VsZCYjMzI7YmUmIzMyO2Vhc2llci4NCiZndDsmIzMyOw0K
Jmd0OyYjMzI7VGhlcmUmIzMyO2lzJiMzMjthbHNvJiMzMjtubyYjMzI7cmVhbCYjMzI7YmVuZWZp
dCYjMzI7aW4mIzMyO3ByaW50aW5nJiMzMjtlcnJvcnMmIzMyO29uJiMzMjttaXNzaW5nJiMzMjtz
eXNjb24NCiZndDsmIzMyO2FyZ3VtZW50LCYjMzI7YmVjYXVzZSYjMzI7dGhpcyYjMzI7aXMmIzMy
O2RvbmUmIzMyO2p1c3QmIzMyO3RvbyYjMzI7bGF0ZTomIzMyO3J1bnRpbWUmIzMyO2NoZWNrJiMz
Mjtvbg0KJmd0OyYjMzI7c3RhdGljL2J1aWxkLXRpbWUmIzMyO2RhdGEuJiMzMjsmIzMyO0R0c2No
ZW1hJiMzMjthbmQmIzMyO0RldmljZXRyZWUmIzMyO2JpbmRpbmdzJiMzMjtvZmZlciYjMzI7dGhl
DQomZ3Q7JiMzMjtzdGF0aWMvYnVpbGQtdGltZSYjMzI7Y2hlY2smIzMyO2ZvciYjMzI7dGhpcyYj
MzI7YWxyZWFkeS4NCg0KUGxlYXNlJiMzMjtyZWJhc2UmIzMyO3RoaXMmIzMyO3BhdGNoJiMzMjt0
byYjMzI7dGhlJiMzMjtmaXJzdCYjMzI7cGF0Y2gmIzMyO29mJiMzMjt0aGlzJiMzMjtzZXJpZXMu
DQpJJiMzMjt3b3VsZCYjMzI7bGlrZSYjMzI7dG8mIzMyO2FwcGx5JiMzMjtyZWZpbmVtZW50JiMz
MjtwYXRjaCYjMzI7Zmlyc3QmIzMyO3RoZW4mIzMyO2FwcGx5JiMzMjtoZG1pJiMzMjt2MiYjMzI7
cGF0Y2hlcy4NCg0KUmVnYXJkcywNCkNLDQoNCiZndDsmIzMyOw0KJmd0OyYjMzI7U2lnbmVkLW9m
Zi1ieTomIzMyO0tyenlzenRvZiYjMzI7S296bG93c2tpJiMzMjsmbHQ7a3J6eXN6dG9mLmtvemxv
d3NraUBsaW5hcm8ub3JnJmd0Ow0KJmd0OyYjMzI7W0FuZ2VsbzomIzMyO1JlYmFzZWQmIzMyO292
ZXImIzMyO0hETUl2Mi9EREN2MiYjMzI7c2VyaWVzJiMzMjtjbGVhbnVwc10NCiZndDsmIzMyO1Jl
dmlld2VkLWJ5OiYjMzI7Q0smIzMyO0h1JiMzMjsmbHQ7Y2suaHVAbWVkaWF0ZWsuY29tJmd0Ow0K
Jmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMyO0FuZ2Vsb0dpb2FjY2hpbm8mIzMyO0RlbCYjMzI7
UmVnbm8mIzMyOyZsdDthbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20mZ3Q7
DQomZ3Q7JiMzMjstLS0NCiZndDsmIzMyOyYjMzI7ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19oZG1pX2NvbW1vbi5jJiMzMjt8JiMzMjs3JiMzMjsrKy0tLS0tDQomZ3Q7JiMzMjsmIzMyOzEm
IzMyO2ZpbGUmIzMyO2NoYW5nZWQsJiMzMjsyJiMzMjtpbnNlcnRpb25zKCspLCYjMzI7NSYjMzI7
ZGVsZXRpb25zKC0pDQomZ3Q7JiMzMjsNCiZndDsmIzMyO2RpZmYmIzMyOy0tZ2l0JiMzMjthL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaV9jb21tb24uYyYjMzI7Yi9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWlfY29tbW9uLmMNCiZndDsmIzMyO2luZGV4JiMzMjs3ODRi
YzA1Yzk1NDEuLjAwYTYzOGEzY2FmNCYjMzI7MTAwNjQ0DQomZ3Q7JiMzMjstLS0mIzMyO2EvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pX2NvbW1vbi5jDQomZ3Q7JiMzMjsrKysmIzMy
O2IvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pX2NvbW1vbi5jDQomZ3Q7JiMzMjtA
QCYjMzI7LTI2OSwxMiYjMzI7KzI2OSw5JiMzMjtAQCYjMzI7c3RhdGljJiMzMjtpbnQmIzMyO210
a19oZG1pX2dldF9jZWNfZGV2KHN0cnVjdCYjMzI7bXRrX2hkbWkmIzMyOypoZG1pLCYjMzI7c3Ry
dWN0JiMzMjtkZXZpY2UmIzMyOypkZXYsJiMzMjtzdHJ1Yw0KJmd0OyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7KiYjMzI7TU1TWVNfQ09ORklHJiMzMjtk
ZXZpY2UmIzMyO2FuZCYjMzI7dGhlJiMzMjtyZWdpc3RlciYjMzI7b2Zmc2V0JiMzMjtvZiYjMzI7
dGhlJiMzMjtIRE1JX1NZU19DRkcNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyomIzMyO3JlZ2lzdGVycyYjMzI7aXQmIzMyO2NvbnRhaW5zLg0K
Jmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7Ki8N
CiZndDsmIzMyOy0mIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO2hkbWktJmd0O3N5
c19yZWdtYXAmIzMyOz0mIzMyO3N5c2Nvbl9yZWdtYXBfbG9va3VwX2J5X3BoYW5kbGUobnAsJiMz
MjsmcXVvdDttZWRpYXRlayxzeXNjb24taGRtaSZxdW90Oyk7DQomZ3Q7JiMzMjsrJiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtoZG1pLSZndDtzeXNfcmVnbWFwJiMzMjs9JiMzMjtz
eXNjb25fcmVnbWFwX2xvb2t1cF9ieV9waGFuZGxlX2FyZ3MobnAsJiMzMjsmcXVvdDttZWRpYXRl
ayxzeXNjb24taGRtaSZxdW90OywNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsxLCYjMzI7JmFtcDtoZG1pLSZndDtzeXNfb2Zmc2V0KTsNCiZndDsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtpZiYjMzI7KElTX0VSUihoZG1pLSZndDtz
eXNfcmVnbWFwKSkNCiZndDsmIzMyOy0mIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtyZXR1cm4mIzMyO1BUUl9F
UlIoaGRtaS0mZ3Q7c3lzX3JlZ21hcCk7DQomZ3Q7JiMzMjstDQomZ3Q7JiMzMjstJiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtyZXQmIzMyOz0mIzMyO29mX3Byb3BlcnR5X3JlYWRf
dTMyX2luZGV4KG5wLCYjMzI7JnF1b3Q7bWVkaWF0ZWssc3lzY29uLWhkbWkmcXVvdDssJiMzMjsx
LCYjMzI7JmFtcDtoZG1pLSZndDtzeXNfb2Zmc2V0KTsNCiZndDsmIzMyOy0mIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyO2lmJiMzMjsocmV0KQ0KJmd0OyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjtyZXR1cm4mIzMyO2Rldl9lcnJfcHJvYmUoZGV2LCYjMzI7cmV0LA0KJmd0OyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmcXVvdDtGYWlsZWQmIzMyO3RvJiMzMjtnZXQmIzMyO3N5c3RlbSYj
MzI7Y29uZmlndXJhdGlvbiYjMzI7cmVnaXN0ZXJzJiM5MjtuJnF1b3Q7KTsNCiZndDsmIzMyOw0K
Jmd0OyYjMzI7LS0NCiZndDsmIzMyOzIuNDkuMA0KJmd0OyYjMzI7DQoNCg0KPC9wcmU+DQo8L3A+
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

--__=_Part_Boundary_003_217441217.352315572--

