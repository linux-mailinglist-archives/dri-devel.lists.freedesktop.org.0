Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB8697B31D
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 18:44:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69CEC10E4BF;
	Tue, 17 Sep 2024 16:44:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Bi+55jla";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="SJr8MGtE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1610D10E4BF
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2024 16:44:27 +0000 (UTC)
X-UUID: 16b4501a751411ef8b96093e013ec31c-20240918
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=D4cZhvtx5/FJw5lXXY1MKaAA7NU+SeoMtvISciCcMWU=; 
 b=Bi+55jla+sRf5wKUTQVmHdnitbjVosEmh/PpmMUv6cIQnZ06+6V7zrFpNNqCJAvtrhUNcA7JyQfMrYVTqCGx9pUP3elXzP8ieQlxONGIq3QTsMgcR3mJ3TXaETw8x6Sq2BNNH4rezZ3lEiTz2O3QRbwQ7CK1hKl8jMqWMywYGoI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41, REQID:c20b66ee-dad1-4ae4-84b9-fddcadb1a410, IP:0,
 U
 RL:0,TC:0,Content:2,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:2
X-CID-META: VersionHash:6dc6a47, CLOUDID:6db316c0-d7af-4351-93aa-42531abf0c7b,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:817|102,TC:nil,Content:4|-5,EDM:-3,I
 P:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
 ,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 1,FCT|NGT
X-CID-BAS: 1,FCT|NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 16b4501a751411ef8b96093e013ec31c-20240918
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 91232808; Wed, 18 Sep 2024 00:44:21 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 18 Sep 2024 00:44:20 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Wed, 18 Sep 2024 00:44:19 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZDQyIFiLjiWXalLxnNUYO2YaIlECVBQmmySN9nyUFsWP/gqStr5xQ7Yq+nz7I4JE7e79Z9hAajclw0udibCLb5NMNKqX0KXLwu4mxenfgNnmIafXougkSBuIjZOqcx9fwzdl8AC7xATmESu6flH5tQAN6SgAomcp/+LXuqs0XmE40RjGxLX/5N9HXHxgu4YIqVOFJ3wGxLntfL6lsrxqHTkZFhi+QCm2PNAtc5l42DWiDiVoqlmDKKOvkOa+++qQmO7UBT3C81YrY226OpEGll97ybk7sHJ8PYaqO2GP5AJE+/W5/p9+emCiwyibW6GoqCyj3cAz4qNb0jho3kRfbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Nr+KrcdeV13W3t/H+JZ+eBpdOBi+cIqC3X2z+xoYZY=;
 b=sTMkL0L3y9teTkJg1586GzSQu+Nfm6Q0IRRcEGEa/rTAwbtHWzHTzY6YRV3pkE4iwMfoJ69KyF47fmASt2YRBzAMpgyzfvvmxAlx2/BphI94/M47yo5BMxbI5eE8S+fJ4g44EHdlFQr7zBjo07E19AL3SvFZfMClW5kLYSbgkbFc2Jfeuij6KqBurj/+tXI0P9RA2Z24m417NQvWebu14hq30RrSABR66QjzVCMJy6IJ0Off0em0QZaGVFhuYhRQ4xDu06JgN1Pk+530nc9tbFgydBcisuUdfQf+kgqKXvys5lQfbGptdQ9r+YWEWARlbdauA/8DF5+pzTv3vT1BSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Nr+KrcdeV13W3t/H+JZ+eBpdOBi+cIqC3X2z+xoYZY=;
 b=SJr8MGtE0L94w2LyWDKz7rd1GawR6QMiLqm7fLFmm97f5p+TUjYzbXJOrixlqMZAGUY0bL4Af7PK5YUYM+NRrave4t4jtMr1s8ZFv8EXp1iTYrzn+9mLtKRRKJ3PBpDZS3H5SezYuISqlZov9K7pH52Eh9qqsIqZNafSr49aTB8=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by OSQPR03MB8484.apcprd03.prod.outlook.com (2603:1096:604:27a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Tue, 17 Sep
 2024 16:44:15 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%5]) with mapi id 15.20.7939.022; Tue, 17 Sep 2024
 16:44:14 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "alpernebiyasak@gmail.com" <alpernebiyasak@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2] drm/mediatek: ovl: Add fmt_support_man for MT8192 and
 MT8195
Thread-Topic: [PATCH v2] drm/mediatek: ovl: Add fmt_support_man for MT8192 and
 MT8195
Thread-Index: AQHbB4oicvGqeV+dyU631/44yO9DSrJaRygAgAHraoA=
Date: Tue, 17 Sep 2024 16:44:14 +0000
Message-ID: <8b5ca1f048565e8826c826716c4e8c515ca0de81.camel@mediatek.com>
References: <20240915161245.30296-1-jason-jh.lin@mediatek.com>
 <01020191fa9480c6-b4e6cdff-4134-4713-b255-1c65e0a97f87-000000@eu-west-1.amazonses.com>
In-Reply-To: <01020191fa9480c6-b4e6cdff-4134-4713-b255-1c65e0a97f87-000000@eu-west-1.amazonses.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|OSQPR03MB8484:EE_
x-ms-office365-filtering-correlation-id: fe86ff48-103d-4e93-a98e-08dcd737f6b0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?TUhMNjgvQllwTWZ6TloyTjlkZFhzRjJpNEl5dlVWTlZnaFNBSXQzbFBpOUVZ?=
 =?utf-8?B?UW5ZUzlTaE9pa3lmek1GaHZJTkcwaW9tTE1GUTMyTk9TbGJzOG9rN0sxTDJo?=
 =?utf-8?B?VmgrbWlEOW5PT0Vqamx4dk9sSkV6RlZ3ZTlNdGdvd2g3ZXdzcGVGVWtsVVBR?=
 =?utf-8?B?emJuc0ZqWEdYR3hnMjlGL0RmQkJja0tUaHhreVJuSHdGY0FmYVAwNkU5TmR4?=
 =?utf-8?B?N2pqRTEzQU1MM2drWWQwMXJyaFJXRlNYa0RpTnMzMGpFcnVWODY5cXpDeTU4?=
 =?utf-8?B?R1grVGdrb3FGQnZ5ZzZhTHB0TDA4N1BzTWdtQUxlM29UZWxXMXVCR3dRTmJz?=
 =?utf-8?B?SHNubC82cHV6TlU3Yll0RXFaSndEQnUyWi9XSE9xb09IbXR0YUdqME9hdnVU?=
 =?utf-8?B?Z2ZjZ0xlUmREaXppZy9lRjY1VUduUW05Ty9TZE9jS0MrRXBMaTloMGZnS3hE?=
 =?utf-8?B?NXphZHR2YVFIZUJzNnY4aWVFZWM3aDhJZ05wdHEzNFNtUlVTdFdtMG5RUXFw?=
 =?utf-8?B?cnNHRlRXbk55WnhlNlFGdkUyUmFaTVI4TEtXRkhRMlpPTEo4Z3hpYm5FRTU2?=
 =?utf-8?B?RWlmam5GaCtuRmowbTZiSGMwVitRSHNWOGtTM0hFMmdGeGp0RkF5M0hFd3ZR?=
 =?utf-8?B?OGJqTnZFVHlmRHQvVHBDWkdnSHBhc1d5Yjh3K25Yd3ZxOXFrNHJVd1RQd3Zz?=
 =?utf-8?B?YkJNT0czaUNDTEVydFhPcmtrZGJ1M001bWxvYlQ1dFYzcUdic2ZuV2RGZmJM?=
 =?utf-8?B?UGZDUlMySFFkZkRFdURnN1NYZE4wV2ZNS216TTRwdUdicC9ZY3k4SXpyRHY3?=
 =?utf-8?B?K2c2OXRJeXcrSVc4STNkaGZhYmtFYmhxUE80KzlGYnM0Q2U5eFNiQzFTdElO?=
 =?utf-8?B?VVk5bW5rdVRBTC96VTdhQUg0Vis5eUU1d21CTlFmNHc2WHJTa0hZS2ZGK2xP?=
 =?utf-8?B?Rk1IcW9vRnh1eWJBY0ZUc3ZlVlVVdVZIeSt2dlVsWjl4NkZVNG1Kbm4yMnJM?=
 =?utf-8?B?TExkNjIzUGloWHZ2eU10Q24vdmhoZzA0dTJWQ0lUQ1U0UW9aTUsreWk3RFNQ?=
 =?utf-8?B?ZmpsQ2lVOXVMMjMxdzZ3dVh1R2ZhVzc1L0Z6Uk0vZ0tBUitvRTZkSk9xK3BR?=
 =?utf-8?B?ZUZqZGU2VDJOWXpDekNCVFI5SWNhNHBGQUhId240YTV6TnpoQWZkRVhOZ24z?=
 =?utf-8?B?SVI4eU14RG5xb25tNVNSb3N3QWhqcW9QcXBQVkZQZ0V0Kzh0VVNyalJ6SWR6?=
 =?utf-8?B?a0E4Y0c5WGZyeGRRUWJ2aWlMT2pLaWZkSlRDL1JMcDlBUjRDZGErTVNwcjFi?=
 =?utf-8?B?NDUrb1p6anQ1R1NGcFdVRURhSWU2Zys1dmN1eWNVbG9FRTV2R0dqdlk0aEht?=
 =?utf-8?B?UFhneElaWWxEV1ZyWEZKZmpEVEtIZ2phWUpxK0dya0pieWd1T1NHZ3Ezempy?=
 =?utf-8?B?SU9IdDlVUzlkUHZHbWtPR0VoSnFsREdyejNUK2t0TVEzNDNwM0NQQ2VlNWVL?=
 =?utf-8?B?bnBTNTJvenF2dWVhaS95YUlZcG5BZ3dsV1loZ1F3NkJ2Ty9xcDNTOFpOVUh2?=
 =?utf-8?B?LzY3bHJKOWJ2ZTNNdmVhMVdOV1o5OVZ0c2FwU2NEekswMFB4RUkrV2RXdWk2?=
 =?utf-8?B?T2xXNVByeWNFVEZzdUZreDN0dTBWT09XWXZnZGtzYnFEcksvVTJnNXNFc21a?=
 =?utf-8?B?dlBsWWhTYWd6QmI0dGg1OUFoUkJlSnFuM2RoMWh3clZheU9zNGhubnMyRWdy?=
 =?utf-8?B?V3draTFRazNjTzlDL0ZYS1lXNlpDQTNoVHpseDB5dlljaGNmekl5Y1A0dWZm?=
 =?utf-8?B?ZW15b2ZMbGJPNmpjUHNjUT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bnZJNEkzL214MkorODZGUGtlVmxPNjczUE5XSjM4R2t1a1Nib2xBSEszU29M?=
 =?utf-8?B?eXN5SlBCUWQrOHFka3R0MWlWak4yZ2Q0YnVRNEhvemd0M010bklSKzl4WC9M?=
 =?utf-8?B?QVd0WlFMOEV3NVVtbDlxMWM5V0V3eU1TRmowOUM2YW5uekFPZkU3UEQzUXhv?=
 =?utf-8?B?c2IraVI4ZVVjRG5HZWJhYUp1Wngwb0QvN0VrbVdoL1NMOUxHM29TWDB3WFE3?=
 =?utf-8?B?QjZLMm5DcjdqTzg4U0tpVjJOcUFPK3dqamx4ZE9lSjVnbnBtQ2djMHhhRGhF?=
 =?utf-8?B?dnpGQ1JkQ2tvZmVueC9xSW9xRmJxcEZ2M1ZrTzFzTjlSTlcyY1ZTbTYvN203?=
 =?utf-8?B?RGs0blphRmRTNnlzWUplc2FHSHpQQURHV2NzTGNaeml3VE1FbFpzMWFpL2xa?=
 =?utf-8?B?R0ducEFsdkk1Mnh1U3F6UkZrUHNLTXVYVzlqcjhTUm9KZmpwc3dVcDNJK1hP?=
 =?utf-8?B?d29rN3laRCtCQXQvNmNPdEorT1o0Mmt2UkdhQ2NUQWxNdEFpU1JwbkNzMlBR?=
 =?utf-8?B?azQvQkRLSFBDaURMbWN5K3JkNkIxckduSDZjYmlGdlZQeGlTdFE2ZUJ2K1Mz?=
 =?utf-8?B?ZU1Wc1ArUURmclQ5TW1CcWVrUE1LazJ1cm80b3JXRGZOQnF6VysvUlpnbGF0?=
 =?utf-8?B?eDhIRVFKVkh1LzRUS2Z4S056T1oxNlBGZWFqZjFUdVlPenQvTDgrVXVJdlNH?=
 =?utf-8?B?SncrU0FwOGtNUGhoUDdxRUNLbDEwelJVb3AwWllJK1ZMUEdTSHNmSWNxb2J5?=
 =?utf-8?B?Yks1V29vb015alR0SnN2NFlhR2thbWZzVlJMeHMrNS9XZFlKdkRvSUt1WFR6?=
 =?utf-8?B?a2FDdjEyS0lLVjIwTU84UmpJSjRjT0YwbW5qNktPU0JWczVGcG1DaEFmSlo3?=
 =?utf-8?B?MVVEWEdDUjZ6UEJ4azk1d2JIZ3hiWExKaDNvNjU5V2lJdm94Z0tBNjJhbDc3?=
 =?utf-8?B?VEZaTmtoaU4rYnNhMTh2MG53T2ZxVDhqeUU1Q2hFU2JkaisrRVNyejZLaEpt?=
 =?utf-8?B?dlBLaEFlMTBiOFpRVjMrYnptQm95ZG9UTW1GSzljbnVMdTJRL1Q0K3Irb05E?=
 =?utf-8?B?ZFU2eHRpdUF6MWlkTFM2S3UzQ3ZxTTVDbk9uVUtCYzdrazNPYTJJc2IwaE9H?=
 =?utf-8?B?Q0djN1FROXd0b1lLY1NFd050Zktqb3FTNXlITXRxR1F4RXFuS0xlSUJ0djlE?=
 =?utf-8?B?UGwxeUMxRjdwNENtWHVONXV3NFlYazJvRnJ6Z0grV0dOZUN0dnZSQ1NvVklz?=
 =?utf-8?B?OU4wU2szTmt4Z3lBaDkzejNsMFR0bjV6dTFGUUIyYi9mMzFqTjBoeU5VOG1t?=
 =?utf-8?B?cERjU245bk9tVmpTcHpKTlhmTzJjOGJSUENlNDE0c1gwTWwwNC9IZEJuTW1m?=
 =?utf-8?B?c3NoT1FrTzFWZlEySzNnaFR2YXh6RVZYYmk2SHhybUFleDQwUk5SdnFzWXB0?=
 =?utf-8?B?NXpZdEp6N3BWNUpkWTVJd2kyTGNSOGc5K0NXNEQ2aGc5VEZDYW5aVVNSRWN1?=
 =?utf-8?B?dUZ5R01BWkVZeEhBRnZCdk5iTDMyQ3l1V0t1NjR2anVLUElSMjYzaHNrRUZL?=
 =?utf-8?B?cmt3aW9HUThYakFIbjNLUE5jWXlBMmxFREtWSWY2eXRYRGVsWWs5MWtrV21L?=
 =?utf-8?B?VmxtTGdkRUNYVlhMdzIxdGhQUnFTeXZHREhsNUtqY041RzJtcmtUenh6SFJj?=
 =?utf-8?B?NGZBYlNrR3g1bERlcC9jRFVseXJ6TzB3cjlnTlZ0Q0FXVHZDVnBXTGZIY2Zk?=
 =?utf-8?B?MThkVVJsd1dWVjNHbTU2WjVldENWNVZGek1SaTdDeW1lY0dhWDJrOGtEMTRy?=
 =?utf-8?B?ZVBEYzBLRHVLZHg4UTY1OEEvR0wzeVVVcXB1aFZiRTYvenZFa2Qza0VvMXpw?=
 =?utf-8?B?VzVPWGZUYlFjQUp1ZkpiN2Rjc1hGWlFreHE3SnI0Qzc5eGlXaVJTUEwzeExJ?=
 =?utf-8?B?MnZXWjErVEQvNy9WcDllbTRjeFY2WGhZWmt1VDhQdkR6UlZ0dFljTTVxVmsz?=
 =?utf-8?B?Z1NrNGd3S1JvYjF0aXpWaVd4U3VtaXEzTDZsS05RN3NkamVwa0o5a2pkYUVY?=
 =?utf-8?B?dnVuZU5SUjd5alRjdXJyOFJCdGVpeC8yb0J1bWp4QUFUT2ZhV3VzcmdvWENx?=
 =?utf-8?B?bElJaTJsMVF1aGdPQ0U0Sm1wcDhIRjZBcFhjS1VYK1lmc1pyRnFUYk1uWTlr?=
 =?utf-8?B?alE9PQ==?=
Content-ID: <A547C5B978CED34D82CC611BC7C98A4F@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe86ff48-103d-4e93-a98e-08dcd737f6b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2024 16:44:14.1541 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sbqOnBpLGwhRZvx5wSFnMSed8US7qCO5ocUaHSdWQeUZ+7Ny0BSQNsSQOBYJPp+u06kuPpchr3SP6/b85pjVgu3ckkVAwZR35PhayRT15N8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR03MB8484
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_004_376440093.1242378974"
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

--__=_Part_Boundary_004_376440093.1242378974
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

PiA+ICsNCj4gPiArI2RlZmluZSBPVkxfQ09OX0NMUkZNVF9QQVJHQjg4ODgob3ZsKSAgKHsgXA0K
PiA+ICsJc3RydWN0IG10a19kaXNwX292bCAqX292bCA9IChvdmwpOyBcDQo+ID4gKwkoX292bC0+
ZGF0YS0+Zm10X3N1cHBvcnRfbWFuID8gXA0KPiA+ICsJKCgzIDw8IDEyKSB8IE9WTF9DT05fQ0xS
Rk1UX01BTikgOiBPVkxfQ09OX0NMUkZNVF9BUkdCODg4OCk7IFwNCj4gPiArfSkNCj4gDQo+IElz
bid0IGl0IGp1c3Qgc2ltcGxlciB0byBwYXNzIGFuICJleHRlbmRlZCBpbnB1dCBmb3JtYXQgc2Vs
ZWN0aW9uIg0KPiBmbGFnIHRvDQo+IHRoZXNlIG1hY3JvcywgaW5zdGVhZCBvZiB0aGUgZW50aXJl
IG10a19kaXNwX292bCBzdHJ1Y3R1cmU/DQo+IA0KPiBTb21ldGhpbmcgbGlrZS4uLg0KPiANCj4g
I2RlZmluZSBPVkxfQ09OX0NMUkZNVF9QQVJHQjg4ODgoZm10X3N1cHBvcnRfbWFuKQ0KPiANCj4g
Li4ub3IgYWx0ZXJuYXRpdmVseSwgaXQncyBwcm9iYWJseSBzaW1wbHkgbW9yZSBzdHJhaWdodGZv
cndhcmQgdG8NCj4gYXNzaWduDQo+IGZ1bmN0aW9uIHBvaW50ZXJzIHRvIHN0cnVjdCBtdGtfZGlz
cF9vdmxfZGF0YToNCj4gDQo+IGAuZm10X2NvbnZlcnQgPSBvdmxfZm10X2NvbnZlcnRfbXQ4MTcz
YCBmb3IgTVQ4MTczLXN0eWxlIGNvbnRyb2xsZXJzDQo+IGFuZA0KPiBgLmZtdF9jb252ZXJ0ID0g
b3ZsX2ZtdF9jb252ZXJ0X210ODE5NWAgZm9yIE1UODE5NS1zdHlsZSBjb250cm9sbGVycywNCj4g
DQo+IHNvIHRoYXQgeW91IGNhbiBzaW1wbHkgY2FsbCBgY29uID0gb3ZsLT5kYXRhLT5mbXRfY29u
dmVydChvdmwsIGZtdCwNCj4gYmxlbmRfbW9kZSlgDQo+IGluIG10a19vdmxfbGF5ZXJfY29uZmln
KCkuDQo+IA0KPiBUaGUgdGhpbmcgaXMgLSB0aG9zZSBtYWNyb3Mgc2VlbSB0byBiZSB1bm5lY2Vz
c2FyaWx5IGNvbXBsaWNhdGVkLCBhbmQNCj4gaXQncyBhdA0KPiBsZWFzdCBpbXBhY3Rpbmcgb24g
cmVhZGFiaWxpdHkuLi4gOi0pDQoNCk9LLCBJJ2xsIGFkZA0KYC5mbXRfY29udmVydCA9IG10a19v
dmxfZm10X2NvbnZlcnRfd2l0aF9ibGVuZGAgdG8gdGhlIGRyaXZlciBkYXRhIGZvcg0KTVQ4MTky
IGFuZCBNVDgxOTUNCmFuZCBhZGQNCmAuZm10X2NvbnZlcnQgPSBtdGtfb3ZsX2ZtdF9jb252ZXJ0
YCB0byB0aGUgZHJpdmVyIGRhdGEgZm9yIG90aGVyIFNvQ3MuDQoNClJlZ2FyZHMsDQpKYXNvbi1K
SC5MaW4NCg0KPiANCj4gQ2hlZXJzLA0KPiBBbmdlbG8NCj4gDQo+ID4gDQo=

--__=_Part_Boundary_004_376440093.1242378974
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KJmd0OyYjMzI7Jmd0OyYjMzI7Kw0KJmd0OyYjMzI7Jmd0
OyYjMzI7KyNkZWZpbmUmIzMyO09WTF9DT05fQ0xSRk1UX1BBUkdCODg4OChvdmwpJiMzMjsmIzMy
Oyh7JiMzMjsmIzkyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7K3N0cnVjdCYjMzI7bXRrX2Rpc3Bfb3Zs
JiMzMjsqX292bCYjMzI7PSYjMzI7KG92bCk7JiMzMjsmIzkyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7
Kyhfb3ZsLSZndDtkYXRhLSZndDtmbXRfc3VwcG9ydF9tYW4mIzMyOyYjNjM7JiMzMjsmIzkyOw0K
Jmd0OyYjMzI7Jmd0OyYjMzI7KygoMyYjMzI7Jmx0OyZsdDsmIzMyOzEyKSYjMzI7fCYjMzI7T1ZM
X0NPTl9DTFJGTVRfTUFOKSYjMzI7OiYjMzI7T1ZMX0NPTl9DTFJGTVRfQVJHQjg4ODgpOyYjMzI7
JiM5MjsNCiZndDsmIzMyOyZndDsmIzMyOyt9KQ0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtJc24mIzM5
O3QmIzMyO2l0JiMzMjtqdXN0JiMzMjtzaW1wbGVyJiMzMjt0byYjMzI7cGFzcyYjMzI7YW4mIzMy
OyZxdW90O2V4dGVuZGVkJiMzMjtpbnB1dCYjMzI7Zm9ybWF0JiMzMjtzZWxlY3Rpb24mcXVvdDsN
CiZndDsmIzMyO2ZsYWcmIzMyO3RvDQomZ3Q7JiMzMjt0aGVzZSYjMzI7bWFjcm9zLCYjMzI7aW5z
dGVhZCYjMzI7b2YmIzMyO3RoZSYjMzI7ZW50aXJlJiMzMjttdGtfZGlzcF9vdmwmIzMyO3N0cnVj
dHVyZSYjNjM7DQomZ3Q7JiMzMjsNCiZndDsmIzMyO1NvbWV0aGluZyYjMzI7bGlrZS4uLg0KJmd0
OyYjMzI7DQomZ3Q7JiMzMjsjZGVmaW5lJiMzMjtPVkxfQ09OX0NMUkZNVF9QQVJHQjg4ODgoZm10
X3N1cHBvcnRfbWFuKQ0KJmd0OyYjMzI7DQomZ3Q7JiMzMjsuLi5vciYjMzI7YWx0ZXJuYXRpdmVs
eSwmIzMyO2l0JiMzOTtzJiMzMjtwcm9iYWJseSYjMzI7c2ltcGx5JiMzMjttb3JlJiMzMjtzdHJh
aWdodGZvcndhcmQmIzMyO3RvDQomZ3Q7JiMzMjthc3NpZ24NCiZndDsmIzMyO2Z1bmN0aW9uJiMz
Mjtwb2ludGVycyYjMzI7dG8mIzMyO3N0cnVjdCYjMzI7bXRrX2Rpc3Bfb3ZsX2RhdGE6DQomZ3Q7
JiMzMjsNCiZndDsmIzMyOyYjOTY7LmZtdF9jb252ZXJ0JiMzMjs9JiMzMjtvdmxfZm10X2NvbnZl
cnRfbXQ4MTczJiM5NjsmIzMyO2ZvciYjMzI7TVQ4MTczLXN0eWxlJiMzMjtjb250cm9sbGVycw0K
Jmd0OyYjMzI7YW5kDQomZ3Q7JiMzMjsmIzk2Oy5mbXRfY29udmVydCYjMzI7PSYjMzI7b3ZsX2Zt
dF9jb252ZXJ0X210ODE5NSYjOTY7JiMzMjtmb3ImIzMyO01UODE5NS1zdHlsZSYjMzI7Y29udHJv
bGxlcnMsDQomZ3Q7JiMzMjsNCiZndDsmIzMyO3NvJiMzMjt0aGF0JiMzMjt5b3UmIzMyO2NhbiYj
MzI7c2ltcGx5JiMzMjtjYWxsJiMzMjsmIzk2O2NvbiYjMzI7PSYjMzI7b3ZsLSZndDtkYXRhLSZn
dDtmbXRfY29udmVydChvdmwsJiMzMjtmbXQsDQomZ3Q7JiMzMjtibGVuZF9tb2RlKSYjOTY7DQom
Z3Q7JiMzMjtpbiYjMzI7bXRrX292bF9sYXllcl9jb25maWcoKS4NCiZndDsmIzMyOw0KJmd0OyYj
MzI7VGhlJiMzMjt0aGluZyYjMzI7aXMmIzMyOy0mIzMyO3Rob3NlJiMzMjttYWNyb3MmIzMyO3Nl
ZW0mIzMyO3RvJiMzMjtiZSYjMzI7dW5uZWNlc3NhcmlseSYjMzI7Y29tcGxpY2F0ZWQsJiMzMjth
bmQNCiZndDsmIzMyO2l0JiMzOTtzJiMzMjthdA0KJmd0OyYjMzI7bGVhc3QmIzMyO2ltcGFjdGlu
ZyYjMzI7b24mIzMyO3JlYWRhYmlsaXR5Li4uJiMzMjs6LSkNCg0KT0ssJiMzMjtJJiMzOTtsbCYj
MzI7YWRkDQomIzk2Oy5mbXRfY29udmVydCYjMzI7PSYjMzI7bXRrX292bF9mbXRfY29udmVydF93
aXRoX2JsZW5kJiM5NjsmIzMyO3RvJiMzMjt0aGUmIzMyO2RyaXZlciYjMzI7ZGF0YSYjMzI7Zm9y
DQpNVDgxOTImIzMyO2FuZCYjMzI7TVQ4MTk1DQphbmQmIzMyO2FkZA0KJiM5NjsuZm10X2NvbnZl
cnQmIzMyOz0mIzMyO210a19vdmxfZm10X2NvbnZlcnQmIzk2OyYjMzI7dG8mIzMyO3RoZSYjMzI7
ZHJpdmVyJiMzMjtkYXRhJiMzMjtmb3ImIzMyO290aGVyJiMzMjtTb0NzLg0KDQpSZWdhcmRzLA0K
SmFzb24tSkguTGluDQoNCiZndDsmIzMyOw0KJmd0OyYjMzI7Q2hlZXJzLA0KJmd0OyYjMzI7QW5n
ZWxvDQomZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyOw0KDQo8L3ByZT4NCjwvcD48L2JvZHk+
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

--__=_Part_Boundary_004_376440093.1242378974--

