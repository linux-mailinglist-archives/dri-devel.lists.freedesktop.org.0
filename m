Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE928D14DF
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 09:07:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5D5610E1FC;
	Tue, 28 May 2024 07:06:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="JnS6T87B";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="e2hd/P9b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A46C10EA17
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 07:06:51 +0000 (UTC)
X-UUID: d77ddd7c1cc011ef8c37dd7afa272265-20240528
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=F4xOBT16H4DBqyunMNzRCVl1T7cdvnYqmhxJicZ4W6M=; 
 b=JnS6T87B2Ui7tQmHjRkPS4TOsV84TOSCIeFi7mBWaQkFZvENzuRYzQNynNG+wNF48mSr9Zbn2dXdDifuxMVmGu+8E506LgmLS9AM+pKRIDnb//blauM0ybSuw+Wfd2uJEEsL63JFv6LWHCQ422fye9wR/meWTj97fqmfzOkAhV8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39, REQID:260980f1-88df-4b6a-b353-0bfaa2bc1930, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:393d96e, CLOUDID:6f85e787-8d4f-477b-89d2-1e3bdbef96d1,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: d77ddd7c1cc011ef8c37dd7afa272265-20240528
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 150513082; Tue, 28 May 2024 15:06:44 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 28 May 2024 15:06:43 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Tue, 28 May 2024 15:06:43 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RsbOtTUfzSSaPaFluxtvhINzYRCV9Sx1nCb2qblPAh8sZkAlT7xwjILo30+WmKXBBDQaNoSV+3d7yed9EdihDZIUjYTyb0g7EUrT3thytnqJqsZ8oAAVS7qWFTId1bL1kdM3p+txUyRt9s48LUnIYruQ79E6SgLWf5TVl6wotmJCNf9zL0lzMC+Y8xeJEsZyU/DEguwLIttlOyeTbnOKKkyHqrs9ysVuIW9U0e593r0/0ySKz2EuTTQgc5VvCvYkaF+P/siAYUzFvp+nj8e2Q3gTWymqiwS72kmjr055pYtJi3KJmEaHZJwyaz94tZI2c0kQMuruCcTG/mHAp+JLyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ED6t8wSAheCBhTjfWsRFkPQI3xrPXr4igIofmN58n74=;
 b=JGTr45Ey4DPaTulbO5+iSzPMPx8ycKZPx+8cbMHMPny6oZ5lmbwNYZ9zZms57cWwsv75vOuGgg5EAxIdHEhD+ODORAI60qlm2S3OTXoFrmBOQtNw7dbRqrLKNQOz1Un0WYPFuf71yUt6RgyIamTKI9+5wlXAm/ftlR64PhF7ItH53fnSI+IeCqmtGrvOOznPQ1fVQRVwx7IYWdo739r7D1NA+/gup+15wEgRrU37/KhRchUMebun1ZIzi6lgAWRGURwaEEll8RtTzM2tIM88wQILAr9iqZMNdEwnu9kChCmGi/oq8gJWeAUAtnCV2sSlRerqUYdmZNf3QzAnkMRlYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ED6t8wSAheCBhTjfWsRFkPQI3xrPXr4igIofmN58n74=;
 b=e2hd/P9bAMz9LlJMJCR4hKh1a3lkBwoTzqiEAd+joKmsxWdiW9SMZk/X0TuSmtTgwxBDxaj7ADuimjK1m4qA9qRA55LcZfLf63w+AwXSIKDG/eE9d7iKDrEuQ+GhrwTtbIEWUeqKUEOG3ethvk5ZH6a838anUFIiZ49X5dJ/Y24=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SEZPR03MB8737.apcprd03.prod.outlook.com (2603:1096:101:214::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.15; Tue, 28 May
 2024 07:06:40 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%7]) with mapi id 15.20.7633.001; Tue, 28 May 2024
 07:06:40 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "mripard@kernel.org" <mripard@kernel.org>
CC: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v5 2/9] drm/mediatek: Add secure buffer control flow to
 mtk_drm_gem
Thread-Topic: [PATCH v5 2/9] drm/mediatek: Add secure buffer control flow to
 mtk_drm_gem
Thread-Index: AQHahbGb/guw7LMrOkaV114NeCbG87FpJZYAgENqMQA=
Date: Tue, 28 May 2024 07:06:40 +0000
Message-ID: <5ed64ef3eb237cece6efd3e83477fcde93d38a17.camel@mediatek.com>
References: <20240403102701.369-1-shawn.sung@mediatek.com>
 <20240403102701.369-3-shawn.sung@mediatek.com>
 <20240415-guppy-of-perpetual-current-3a7974@houat>
In-Reply-To: <20240415-guppy-of-perpetual-current-3a7974@houat>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SEZPR03MB8737:EE_
x-ms-office365-filtering-correlation-id: 15990bc1-adb2-4f03-313b-08dc7ee4b922
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|366007|7416005|376005|1800799015|38070700009; 
x-microsoft-antispam-message-info: =?utf-8?B?OXhlTzhOSkVNRUdjVU5SdTlyUGJYK210Z0ZwT1JCMW9wNWFHU09OZ2MreWhU?=
 =?utf-8?B?cURxMWF1MjBvOVI4QjltSzdyeitIbkpKK1VZTmxzZ1VUc1RhRldkaHhQNmx0?=
 =?utf-8?B?MGwwUEQveDNENXVuNS9nSDNjWDRDYmpoWkdtMFVoVDhuamJXcEl6dFQzUzlw?=
 =?utf-8?B?dmtVcytoUE8yeEJGanFPMGJsMFZkbzZGQkNhelZyR01mQUZ2RUd4WFNVc3Qx?=
 =?utf-8?B?VGlyQWpuelVuZlI3a01BZ1lkaUZDQXBHRStPY0t1TjNXbHdodjVmQ2hXYXo2?=
 =?utf-8?B?Z2wxdlVjbTJSS0FJb0hxS05aNVVxT3I1ZkdDVXl0c1lxaENKQklFTkwrKzhl?=
 =?utf-8?B?OFhQSUY2cVBzYkVhc01lU1ZBUE02Y3pFbi96cXY1MWRhUTh5OUF5dXZJelNn?=
 =?utf-8?B?bWlLWFZqdWc0WlYxWU9IMHdSMjB4aUFZdnRUNW5RQnVRSkMvU05jbVdLeHMz?=
 =?utf-8?B?UnBDdDVBU3c1R1N1N1pVYjdlTEtFQURQZFNmVENENGp0MHV2YzhYVlNycyt0?=
 =?utf-8?B?WjgxQ3FCQkpOaVBLeEpOZ21JNWEwcWIxTHFqVS8vUWZHTEpId1ZkbjUxWHhG?=
 =?utf-8?B?dGNOQVJoaC9XOHFCQ2ZMTEFuSzhXWWg4VU80SDVQaEE0N3dURjJwQUQ0SW83?=
 =?utf-8?B?c3dGWHBLTFlycVY1UlVIeWU4RjFZMWw5OWp1RkhzdXZ1aFlkYXE1TjNUSmlJ?=
 =?utf-8?B?eFpESEpreHhIU09Od2Jtd1dQcUJHTzRpaDlVZndpOWVuaW1pNTZ4ZGxUd3JE?=
 =?utf-8?B?dzZWUzNxMW9XQXNOSFdCeWVqdmdsUWsxR09EajAvMmNIYmo1bU1PWTJ5RWtm?=
 =?utf-8?B?MVB6c1YxUHc4M0xGc2RaN0RqNmdsZHhQaTBWcWcyZkwzVHZ0aFVESCs3b21V?=
 =?utf-8?B?Qmc0Y2V2ODA4WTdINGd3WnJPR1NTZ3l2YVE1dVZzdWR3Y3RWTkExcWVUdGlp?=
 =?utf-8?B?UWFIT2VSREVINDZyTlYzMmNUWFpNVVM1aTVEOVU3RktDemp0NlZlckxCclFO?=
 =?utf-8?B?ZENXK1VvVnFkc292UG00b1RxWWVTTG41TUplTjF5K0phTjhRbzFOTlYxQjNw?=
 =?utf-8?B?SU1scUFZNWZ6U1VOaW1uYWtQTzlOYVNIZWEwOFdJQjdqdlRlNDBHMVRnRHJj?=
 =?utf-8?B?RXFOTlRVbDkvUHNMQmoyajUxdVdJeklFaGwyaXMyUk9oaGE1cHhaZUpXSkdG?=
 =?utf-8?B?SVZYR21DVGdwZEMrUy9TVzJoTEJhYjNGVHlUS29Rd0U2Qm5FVG56YVRjRmlX?=
 =?utf-8?B?VXRJcURJMkNGaWk5TENLdlJXbXpKZWo0cmhqOWVNR2JwZUhQOW9yckxocUtV?=
 =?utf-8?B?Q3pNUitidWZhNTh1Nmw5VG54NW9UOUdheVRnWkxlcHB2Nk9ZNi9KdktjaXJp?=
 =?utf-8?B?ZDRmZFRZd1l0QVN4KzlRNlhJdW93MnR4TkVTT0xjQlVVdU9jeGcrTDhEVU44?=
 =?utf-8?B?ZEJBZk9qQkFkdlQ4c2Z4U0lTcmVHVk1KYUtMYjZyUTlPdy9UM2xqN3dSU0FI?=
 =?utf-8?B?UllLN1ZPcnhwMlpFa3V4c3FFTksyL1NMZzk4aGVpTlZKY1AzcENjbnNVZk5G?=
 =?utf-8?B?ZHhyVEp0L1RGZkZJQWgrMVBlQ1YwU2tmeFR0c3N5eFV6WjFpWE1zeWs2NVBP?=
 =?utf-8?B?eVZZdlMwSGVQWk9qbEp6MWN0MjVJaGNJNUNDUWF0WTlmQ1FiV3Z0MDlqWHZB?=
 =?utf-8?B?Qm41K1lUWWduNWJ1SlNqZDRuTzVVYkFqaDFydjJKbXd5NHUrd1l4Tlcvb0sw?=
 =?utf-8?Q?10vBqJMAccMWxHFB4w=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(7416005)(376005)(1800799015)(38070700009); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T3Azd3NVY2pBdnlhdDJvb05qREU2TUh5azY4RFYxU0QyUTFMTnV0aTFOaUYx?=
 =?utf-8?B?dzYvSTR1MVNDeHhIaXlZOGF5YW1UbnZFK1hSTWRzMGwzdHEvdUlGQjgrMmNr?=
 =?utf-8?B?cVpXei94N0JlZCtKV1lYZEN1NlpDU05BNGVNZzNySjBrN1kwdmF2anZXdTcv?=
 =?utf-8?B?b3A4QXJsekdFcTRXSFNEdTJ3ODV4S21GMCtNMUpxN0FPemZLK3U5ZUZDR0NE?=
 =?utf-8?B?TTB3K3N1ajd5QTMyek1WL01MY3lHOFhYSDRmMGhiWkNadFltOEtialRneVly?=
 =?utf-8?B?eFRIcHAvbnNXc25iRE9DaDJSNVp4TEhwaHJBOTFwSFNzTWJBSndVQ1lsZzRo?=
 =?utf-8?B?KzFBYjJhOVh2MmIwZkVtbElmd2c1MUlGRUVGVFFxTXdUcTlnaHRqVVUyM2NL?=
 =?utf-8?B?VnZVdlZoYjlleExIZEh6dHkzZnQwck1pMWhveFJ2ZUFpNGNhMmFEVEdDUklm?=
 =?utf-8?B?a0VSbnUxWWtFNzFRY1ZONC92cytjckZyNFpMNWpDMjVFMjVPVGZNTm9ZajRh?=
 =?utf-8?B?Z3NRM2hIOTBnM2NIOGxSalc5UWRVN1pFdFh4NlVZa2JNN05EbmMwVHVNNEFz?=
 =?utf-8?B?ZFJjVThzTFFZNlBkc3JmSXozN1U0OVJ0U2habVYycFU1RjJ1eFhEUGdiNTdk?=
 =?utf-8?B?eFo2Q2RJMklXY1hxNlhaVGM5S1ltOHRVczhZQWdteFNNOUtvd2YyU2lsTUhp?=
 =?utf-8?B?RDkraHRFalF2bXBxbFJRMGZpTDdKQmY0SHM5cWhjNzFsWlg5UnV3MUNQL20v?=
 =?utf-8?B?MkRhWGhCRWFhSFk0ZTB0ZjExQzQwaThqOCtPOVhHaHVwcUR2c2ROWElKM1A5?=
 =?utf-8?B?aDhTbTBOWVNEbW1USGRoM2RwU01lWjVxQUpva1Jpblg0VmgzbWJHQzhBUXlR?=
 =?utf-8?B?anhLbEFrRDI3RzBwSjZtNGFjTElpODRVcWVwS1REWnNkcUp6bVoyZ0g5NzVz?=
 =?utf-8?B?d1Exbzd3STNQWXFXZGtNWW5tcHlVTE92bHdUZkFtWEM5N3ZJWm5HTFhsRU5k?=
 =?utf-8?B?WWhtbVpvRWhaOXVMb25pa2ozeE0vK1JpS2pXWW50TGVQK0N5R2twNXphMVNU?=
 =?utf-8?B?Rm9oNTdDaWxURlFEQzZzOVVDR3A0K1A5WThwaU9ralF0VTBFbERkQmwxZENy?=
 =?utf-8?B?QjdyNmRnMXhPMkpkVXY4c1B5WCs1L0lRdkxnYVdDaEtrb1VCWUFmeVZrbXBG?=
 =?utf-8?B?cWh3b0dPaUE2TUZCTys3U2ZvVE9UdG85WHlqTi9LMHpXb0szdzc4MkRlR1hU?=
 =?utf-8?B?RjdRRG1uTkE1QmYwWDdwT2Z6QTVkdG0zQ082NVZ1R0NFekdRVHVmS3ZPbTFz?=
 =?utf-8?B?b1BZZXdJS0VBZTBVVGpERVgxbWxSMUUyaW12YzVwRThvUjcrRElXQzVUWGdw?=
 =?utf-8?B?aXJScW1mYndwdDUwa2U5dE9RQW1YMk9INXBVbnR5cnNOeWdyak9GRWVUcWFG?=
 =?utf-8?B?azZiUC9KUU5zeHI5eUZ1YVZEZU5FMUdrenNaU2lBSWQzZ1pHNGZtRTgxRXRH?=
 =?utf-8?B?eFJWOE51L0VudGx1TytWbHBsYWtyNU05eDRHZHU0SE5jeXNwSWhaNDBZcDB6?=
 =?utf-8?B?MVJBd3FKUUFMVitUaTFRcXJteExNR0VGUGQrTklORGZKQWxUZ1pwZmo1SjE1?=
 =?utf-8?B?RzUwMmZLcmZRTHFoZkF3TUNlMmZzdi9tbHVKZ1ZZV1kvMFNKcFZrMUFUNkJV?=
 =?utf-8?B?TXNqaTNncUhLM21BUHQrYTJBdlNsdVJ4SFBOMXg3WCtScVhGN1dWQWNBYTlL?=
 =?utf-8?B?aFBSQ2w2aHFjSEZzOFJlVXpPTTZvSFRKR0I2N0NYRWN3aFliLzZHYVlvOGtZ?=
 =?utf-8?B?TjhnbmZUMGhORE5xb0o1VUpvOEF4RzRBenExOWRqSnV6SEhyejhGTmhmRkdW?=
 =?utf-8?B?UjVPUnAwVS9rNFo3U290S2hFSG9MOS9DRUZ3OWFaS0lncWpQUHE4YXF4NTRX?=
 =?utf-8?B?d0l1VXVwZ1JxcGRPdURrcHJ4cEpRcUZFRm9PTnU5RWN6OVNEblVuOXp4QmRS?=
 =?utf-8?B?NmEwMmVLWkt2QmdKclp6QWNRQTY3WEVjUGN0T0RDK2xkZUZIbXM5STEvQWhp?=
 =?utf-8?B?NkNqb1lEb0NGbXJxb2thV1FwRTBYUEZUT211LzJUbTE0cWxJQTFZOExCVHZz?=
 =?utf-8?B?UmlaVVZCWHJhbmg4ZzZ6bXpwNHhIOHg2VUpjZ1dIbFJ2TGkxK2JNRXFjVk55?=
 =?utf-8?B?dnc9PQ==?=
Content-ID: <317BC11C9DE7E74C8E087C56420FAF34@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15990bc1-adb2-4f03-313b-08dc7ee4b922
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2024 07:06:40.2842 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p/EsBLeGpNDNY3/wvtWKUIqjI8BPVZ4C3tKF8ChN44YR1RXnJnGf6PmN0UGxBQXy2qYP1M62LSI+gIdO2WQVuixqC5ihymSGGmVAqJ97BcM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8737
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_003_608296406.2143973400"
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

--__=_Part_Boundary_003_608296406.2143973400
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGkgTWF4aW1lLA0KDQpbc25pcF0NCg0KSSdtIHNvcnJ5IGZvciBsb3NpbmcgeW91ciBwcmV2aW91
cyBjb21tZW50IG1haWwuDQpJIGZpbmFsbHkgZm91bmQgYSB3YXkgdG8gaW1wb3J0IHRoaXMgbWFp
bCBiYWNrIHNvIEkgY2FuIHJlcGx5IHRvIHlvdS4NCg0KPiA+IC0JbXRrX2dlbSA9IG10a19nZW1f
Y3JlYXRlKGRldiwgYXJncy0+c2l6ZSwgZmFsc2UpOw0KPiA+ICsJaWYgKGFyZ3MtPmZsYWdzICYg
RFJNX01US19HRU1fQ1JFQVRFX0VOQ1JZUFRFRCkNCj4gPiArCQltdGtfZ2VtID0gbXRrX2dlbV9j
cmVhdGVfZnJvbV9oZWFwKGRldiwgIm10a19zdnBfY21hIiwNCj4gPiBhcmdzLT5zaXplKTsNCj4g
DQo+IFRoYXQgaGVhcCBkb2Vzbid0IGV4aXN0IHVwc3RyZWFtIGVpdGhlci4gQWxzbywgSSdtIHdv
bmRlcmluZyBpZiBpdCdzDQo+IHRoZQ0KPiByaWdodCBzb2x1dGlvbiB0aGVyZS4NCj4gDQoNClll
cywgSSBmb3VuZCB0aGF0IGl0cyBuYW1lIGNoYW5nZWQgdG8gInJlc3RyaWN0ZWRfbXRrX2NtYSIg
aW4gdGhlDQpsYXRlc3QgcGF0Y2g6IA0KaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9q
ZWN0L2xpbnV4LW1lZGlhdGVrL3BhdGNoLzIwMjQwNTE1MTEyMzA4LjEwMTcxLTEwLXlvbmcud3VA
bWVkaWF0ZWsuY29tLw0KDQo+IEZyb20gd2hhdCBJIGNhbiB0ZWxsLCB5b3Ugd2FudCB0byBhbGxv
dyB0byBjcmVhdGUgZW5jcnlwdGVkIGJ1ZmZlcnMNCj4gZnJvbQ0KPiB0aGUgVEVFLiBXaHkgZG8g
d2UgbmVlZCB0aGlzIGFzIGEgRFJNIGlvY3RsIGF0IGFsbD8gQSBoZWFwIHNlZW1zIGxpa2UNCj4g
dGhlIHBlcmZlY3Qgc29sdXRpb24gdG8gZG8gc28sIGFuZCB0aGVuIHlvdSBqdXN0IGhhdmUgdG8g
aW1wb3J0IGl0DQo+IGludG8NCj4gRFJNLg0KPiANCg0KT0ssIEknbGwgdHJ5IHRvIGNoYW5nZSB0
aGUgdXNlcnNwYWNlJ3MgaW9jdGwgZnJvbQ0KRFJNX0lPQ1RMX01US19HRU1fQ1JFQVRFIHRvIERN
QV9IRUFQX0lPQ1RMX0FMTE9DIHRvIGdldCB0aGUgYnVmZmVyIGZkLA0KdGhlbiBpbXBvcnQgdG8g
RFJNLg0KDQo+IEknbSBhbHNvIG5vdCBlbnRpcmVseSBzdXJlIHRoYXQgbm90IGhhdmluZyBhIFNH
IGxpc3QgaXMgZW5vdWdoIHRvDQo+IGNvbnNpZGVyIHRoZSBidWZmZXIgc2VjdXJlLiBXb3VsZG4n
dCBhIGJ1ZmZlciBhbGxvY2F0ZWQgd2l0aG91dCBhDQo+IGtlcm5lbA0KPiBtYXBwaW5nIGFsc28g
YmUgaW4gdGhhdCBzaXR1YXRpb24/DQo+IA0KDQpJIGhhdmUgY29uZmlybWVkIHRvIFlvbmcuV3Ug
dGhhdCBzZWN1cmUgYnVmZmVyIGFsc28gaGF2ZSBzZyBsaXN0LCBzbw0KdGhlIHNlY3VyZSBjaGVj
a2luZyBtZXRob2QgIiFzZ19wYWdlKHNnLT5zZ2wpIiB3aWxsIGJlIGRlcHJlY2F0ZWQuDQoNClJl
Z2FyZHMsDQpKYXNvbi1KSC5MaW4NCg0KPiBNYXhpbWUNCj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxp
c3QNCj4gbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnDQo+IGh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbA0KPiANCg==

--__=_Part_Boundary_003_608296406.2143973400
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGkmIzMyO01heGltZSwNCg0KW3NuaXBdDQoNCkkmIzM5
O20mIzMyO3NvcnJ5JiMzMjtmb3ImIzMyO2xvc2luZyYjMzI7eW91ciYjMzI7cHJldmlvdXMmIzMy
O2NvbW1lbnQmIzMyO21haWwuDQpJJiMzMjtmaW5hbGx5JiMzMjtmb3VuZCYjMzI7YSYjMzI7d2F5
JiMzMjt0byYjMzI7aW1wb3J0JiMzMjt0aGlzJiMzMjttYWlsJiMzMjtiYWNrJiMzMjtzbyYjMzI7
SSYjMzI7Y2FuJiMzMjtyZXBseSYjMzI7dG8mIzMyO3lvdS4NCg0KJmd0OyYjMzI7Jmd0OyYjMzI7
LW10a19nZW0mIzMyOz0mIzMyO210a19nZW1fY3JlYXRlKGRldiwmIzMyO2FyZ3MtJmd0O3NpemUs
JiMzMjtmYWxzZSk7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsraWYmIzMyOyhhcmdzLSZndDtmbGFncyYj
MzI7JmFtcDsmIzMyO0RSTV9NVEtfR0VNX0NSRUFURV9FTkNSWVBURUQpDQomZ3Q7JiMzMjsmZ3Q7
JiMzMjsrbXRrX2dlbSYjMzI7PSYjMzI7bXRrX2dlbV9jcmVhdGVfZnJvbV9oZWFwKGRldiwmIzMy
OyZxdW90O210a19zdnBfY21hJnF1b3Q7LA0KJmd0OyYjMzI7Jmd0OyYjMzI7YXJncy0mZ3Q7c2l6
ZSk7DQomZ3Q7JiMzMjsNCiZndDsmIzMyO1RoYXQmIzMyO2hlYXAmIzMyO2RvZXNuJiMzOTt0JiMz
MjtleGlzdCYjMzI7dXBzdHJlYW0mIzMyO2VpdGhlci4mIzMyO0Fsc28sJiMzMjtJJiMzOTttJiMz
Mjt3b25kZXJpbmcmIzMyO2lmJiMzMjtpdCYjMzk7cw0KJmd0OyYjMzI7dGhlDQomZ3Q7JiMzMjty
aWdodCYjMzI7c29sdXRpb24mIzMyO3RoZXJlLg0KJmd0OyYjMzI7DQoNClllcywmIzMyO0kmIzMy
O2ZvdW5kJiMzMjt0aGF0JiMzMjtpdHMmIzMyO25hbWUmIzMyO2NoYW5nZWQmIzMyO3RvJiMzMjsm
cXVvdDtyZXN0cmljdGVkX210a19jbWEmcXVvdDsmIzMyO2luJiMzMjt0aGUNCmxhdGVzdCYjMzI7
cGF0Y2g6JiMzMjsNCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1t
ZWRpYXRlay9wYXRjaC8yMDI0MDUxNTExMjMwOC4xMDE3MS0xMC15b25nLnd1QG1lZGlhdGVrLmNv
bS8NCg0KJmd0OyYjMzI7RnJvbSYjMzI7d2hhdCYjMzI7SSYjMzI7Y2FuJiMzMjt0ZWxsLCYjMzI7
eW91JiMzMjt3YW50JiMzMjt0byYjMzI7YWxsb3cmIzMyO3RvJiMzMjtjcmVhdGUmIzMyO2VuY3J5
cHRlZCYjMzI7YnVmZmVycw0KJmd0OyYjMzI7ZnJvbQ0KJmd0OyYjMzI7dGhlJiMzMjtURUUuJiMz
MjtXaHkmIzMyO2RvJiMzMjt3ZSYjMzI7bmVlZCYjMzI7dGhpcyYjMzI7YXMmIzMyO2EmIzMyO0RS
TSYjMzI7aW9jdGwmIzMyO2F0JiMzMjthbGwmIzYzOyYjMzI7QSYjMzI7aGVhcCYjMzI7c2VlbXMm
IzMyO2xpa2UNCiZndDsmIzMyO3RoZSYjMzI7cGVyZmVjdCYjMzI7c29sdXRpb24mIzMyO3RvJiMz
MjtkbyYjMzI7c28sJiMzMjthbmQmIzMyO3RoZW4mIzMyO3lvdSYjMzI7anVzdCYjMzI7aGF2ZSYj
MzI7dG8mIzMyO2ltcG9ydCYjMzI7aXQNCiZndDsmIzMyO2ludG8NCiZndDsmIzMyO0RSTS4NCiZn
dDsmIzMyOw0KDQpPSywmIzMyO0kmIzM5O2xsJiMzMjt0cnkmIzMyO3RvJiMzMjtjaGFuZ2UmIzMy
O3RoZSYjMzI7dXNlcnNwYWNlJiMzOTtzJiMzMjtpb2N0bCYjMzI7ZnJvbQ0KRFJNX0lPQ1RMX01U
S19HRU1fQ1JFQVRFJiMzMjt0byYjMzI7RE1BX0hFQVBfSU9DVExfQUxMT0MmIzMyO3RvJiMzMjtn
ZXQmIzMyO3RoZSYjMzI7YnVmZmVyJiMzMjtmZCwNCnRoZW4mIzMyO2ltcG9ydCYjMzI7dG8mIzMy
O0RSTS4NCg0KJmd0OyYjMzI7SSYjMzk7bSYjMzI7YWxzbyYjMzI7bm90JiMzMjtlbnRpcmVseSYj
MzI7c3VyZSYjMzI7dGhhdCYjMzI7bm90JiMzMjtoYXZpbmcmIzMyO2EmIzMyO1NHJiMzMjtsaXN0
JiMzMjtpcyYjMzI7ZW5vdWdoJiMzMjt0bw0KJmd0OyYjMzI7Y29uc2lkZXImIzMyO3RoZSYjMzI7
YnVmZmVyJiMzMjtzZWN1cmUuJiMzMjtXb3VsZG4mIzM5O3QmIzMyO2EmIzMyO2J1ZmZlciYjMzI7
YWxsb2NhdGVkJiMzMjt3aXRob3V0JiMzMjthDQomZ3Q7JiMzMjtrZXJuZWwNCiZndDsmIzMyO21h
cHBpbmcmIzMyO2Fsc28mIzMyO2JlJiMzMjtpbiYjMzI7dGhhdCYjMzI7c2l0dWF0aW9uJiM2MzsN
CiZndDsmIzMyOw0KDQpJJiMzMjtoYXZlJiMzMjtjb25maXJtZWQmIzMyO3RvJiMzMjtZb25nLld1
JiMzMjt0aGF0JiMzMjtzZWN1cmUmIzMyO2J1ZmZlciYjMzI7YWxzbyYjMzI7aGF2ZSYjMzI7c2cm
IzMyO2xpc3QsJiMzMjtzbw0KdGhlJiMzMjtzZWN1cmUmIzMyO2NoZWNraW5nJiMzMjttZXRob2Qm
IzMyOyZxdW90OyFzZ19wYWdlKHNnLSZndDtzZ2wpJnF1b3Q7JiMzMjt3aWxsJiMzMjtiZSYjMzI7
ZGVwcmVjYXRlZC4NCg0KUmVnYXJkcywNCkphc29uLUpILkxpbg0KDQomZ3Q7JiMzMjtNYXhpbWUN
CiZndDsmIzMyO19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
DQomZ3Q7JiMzMjtsaW51eC1hcm0ta2VybmVsJiMzMjttYWlsaW5nJiMzMjtsaXN0DQomZ3Q7JiMz
MjtsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcNCiZndDsmIzMyO2h0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbA0KJmd0
OyYjMzI7DQoNCjwvcHJlPg0KPC9wPjwvYm9keT48L2h0bWw+PCEtLXR5cGU6dGV4dC0tPjwhLS17
LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UgKioq
KioqKioqKioqKioqKioqKioNClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1h
aWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50
aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBk
aXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpj
b252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlz
c2VtaW5hdGlvbiwgDQpkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWlu
ZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVu
ZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxh
d2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWls
LCBvciBiZWxpZXZlIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJv
ciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRv
IHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWls
IChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90
DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29u
LiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_003_608296406.2143973400--

