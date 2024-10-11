Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB53999C66
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 08:03:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA62E10EA3A;
	Fri, 11 Oct 2024 06:03:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="UDMnJ92X";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="dLHDypn3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B055610EA3A
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 06:03:28 +0000 (UTC)
X-UUID: 85c48968879611ef8b96093e013ec31c-20241011
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=YzQjsB4EqIKTmS92yy8DP7OTXuLTCsWsqnT9lqCu1K0=; 
 b=UDMnJ92XkjYIafRUny9kS/gJoh6KYARQ6bO0RID7OqH0/gV9keQnXVkNylgwBBBdiqMPYB6p6yGynTA5TlNanpLAb0ATxqdrDbOXV8vDecq1uQMfr939YrFJ8CwH3KtAhAStJ8wO1oA/I5EfoAstX/7n3KzL7Ss+kTjcT6FQ36g=;
X-CID-CACHE: Type:Local,Time:202410111341+08,HitQuantity:2
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41, REQID:79a9b395-bfbf-4fbd-836f-5bf7d3703365, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6dc6a47, CLOUDID:14379f26-5902-4533-af4f-d0904aa89b3c,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
 l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 85c48968879611ef8b96093e013ec31c-20241011
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 97570768; Fri, 11 Oct 2024 14:03:23 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 10 Oct 2024 23:03:21 -0700
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Fri, 11 Oct 2024 14:03:21 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OnZ/KmWh02ea84+1of16x1CYPgmWUceOzn0898lCYVUKifjXvTV0NJQwGTd18eWyYdbMVv+H6DOBa7UCVqTOO/Psds/KdL4CPJFgI/oHGxgx0pe/MNKQzyePAHYIFnQcjPQ/fBZtgpX9gQy0G9TEU/ZaU2Wy5rOCB5YVbz7wYaUsT1mSQR6uTF/55ttYCigiGAoMSBU7ku3mUUY9ob/CwkTePV6+CxlFXlayIGkE04LWVKh2bHrcy25dnKly0vyaMVNZ435IPumk/BnggperyDxjpHrezY+0L613UEDu0OpSQhcebNQFIhavjyoYVjsg7KTrZEnjCDaAGgBotcl/XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EtBzIPDC2zqvSgGBYi9qG+9h405wSW5YXLtiARuhHgQ=;
 b=d3UsXIvNST4IzvgwQU6XndAnAGZjvB3mJaLGxHO16a1Cat7LzTqoTml/WWEGeByocwy/sfG2pPu9Xk+xhiFGwIfoEYStyRmt6oN95nFb5Cz8rh+1LarMX24J8hlRqLBMRmIfKJlek0LdcFSd8c2Jm2Ff5JDD6PdkyjMpsUXVrARCumv3CTfHmJz4PzcugQ3y3JLekE7HYkYfsDYE5NXzysXVTyQQwuwhZmIgu6drrqku9NMT0GQ4hJ3h2bKgSHCOztvd/9QK/s4udcV6zKlFN2IAZIjn3Izs8K8ufJzA20c73JMaWK87QrPn0YMB3FJD5Jd5mymAOGWiQt+/hk/Eug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EtBzIPDC2zqvSgGBYi9qG+9h405wSW5YXLtiARuhHgQ=;
 b=dLHDypn3kzoOvufk+Eq6hpmd5H58Bq5oUHZ8avs7wDJtk0hexUe0PSDUgp1AvDGznutG4LZvPC99nEvPntOnJ6vXWJ3VaSpGs159Bpo+Z36PlnZN7APZpEwrwGw8lmeLu8EK/BvDyONap+GZRAvKYy6hQPXdj2LkAsq5MYiEFMU=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SI2PR03MB6662.apcprd03.prod.outlook.com (2603:1096:4:1e9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Fri, 11 Oct
 2024 06:03:18 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8048.017; Fri, 11 Oct 2024
 06:03:18 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>, "mchehab@kernel.org"
 <mchehab@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?utf-8?B?U2h1LWhzaWFuZyBZYW5nICjmpYroiJLnv5Qp?=
 <Shu-hsiang.Yang@mediatek.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "yunkec@chromium.org" <yunkec@chromium.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, =?utf-8?B?WWF5YSBDaGFuZyAo5by16ZuF5riFKQ==?=
 <Yaya.Chang@mediatek.com>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?utf-8?B?VGVkZHkgQ2hlbiAo6Zmz5Lm+5YWDKQ==?= <Teddy.Chen@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "hidenorik@chromium.org"
 <hidenorik@chromium.org>, =?utf-8?B?U2h1bi1ZaSBXYW5nICjnjovpoIblhIQp?=
 <Shun-Yi.Wang@mediatek.com>
Subject: Re: [PATCH v1 04/10] media: platform: mediatek: add isp_7x cam-raw
 unit
Thread-Topic: [PATCH v1 04/10] media: platform: mediatek: add isp_7x cam-raw
 unit
Thread-Index: AQHbGj2G8utVn4Ab5UaBggOzyqwWS7KBEgkA
Date: Fri, 11 Oct 2024 06:03:18 +0000
Message-ID: <c8b93bc4b3e21b6cde404323fb10198b686ad65d.camel@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
 <20241009111551.27052-5-Shu-hsiang.Yang@mediatek.com>
In-Reply-To: <20241009111551.27052-5-Shu-hsiang.Yang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SI2PR03MB6662:EE_
x-ms-office365-filtering-correlation-id: e9341699-1663-4d30-a585-08dce9ba676e
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?d2hDaGV2SEdFNFlyY2RzVFpJWVpBaENNYlRBcUdqWDNpVDJOZXlleXlJOFlV?=
 =?utf-8?B?a0xPb0kzYmUzQlBsSHhkd0Uvc2R2aXdOVXpNM1FGZnBudkRzM1NRQm1XaW10?=
 =?utf-8?B?c2RETUJPZXBNZDZzOERaYndOU3NPdng3Z1dBUVNSMjg4R0YwK0pUY2ZTa2Z4?=
 =?utf-8?B?M0l4WUpOSUNWSXVvK1R5WnlXcHExMmdzREt3cUV5a3BkNVJtT1JHaTRzVkZ3?=
 =?utf-8?B?b3FTMm9iVGhxNUpIT09xYndvODQ4VklHenpoblcyUTJmVGhuVkFHNDJRUHo2?=
 =?utf-8?B?YktldWpKcE56WTE1R01zazk3NUR3bGRoWXJKUnNQc09TSEVDTTJGQ2ljeHNF?=
 =?utf-8?B?S3EvTGo4a3d0U1owQzZFbUZpRlFjRW1PS0oxMFhGKzlGWEd4ZUxHeGwyYzdu?=
 =?utf-8?B?eHhkOUhleE9NRUs3L0JWZkxZU2IrYm9PUzdCaTdPYS96UWZJMzRzaGFkN1Vn?=
 =?utf-8?B?TkxhTmlwZGVaS3JJTWlPU1lhMUVXZmhPT2NTemxYVG9vajNMcldSUkl2TDlN?=
 =?utf-8?B?TTByQVZSZVFtZWlsclQrbHRQSlM5czV1WDZENituSVhtZDVYa1ByZG5hVGxK?=
 =?utf-8?B?OVNrWXcwZlgvMnRNWnFudzhVdlpLcDE0N1NRRCtrVDgzWlpYYWtBSUNyUWJE?=
 =?utf-8?B?TU03Um5OM2pmK29QbC9oM01EaWxmb3ZQUWdDMG5ndG8zNTUwcEhzQWdaUGdH?=
 =?utf-8?B?VUlrZ2NCRTR3N1gybVpIU1orbnozQ2tqN1V1WHNhNzdSbTNMVjhOME93SU13?=
 =?utf-8?B?T2RkNHU3Yk5qTnk2NXM0d3E0VU9VR256cVhReU5NcTB4enVoQkNjcytzZGdF?=
 =?utf-8?B?eDJxUlFHTmpYTTFzenAwYW5aWTYrN29URmpiRTVORnVIRlRmMnNPRVY2eEM4?=
 =?utf-8?B?RG12bW4xZkQ0Z28rYURycDQ4RkNTcWtiUHlsYTRXVy9xcEtLUTR0N1FKSmlu?=
 =?utf-8?B?QVJ1WlhIL0dpQnVKOFJTS1EzS21EOEt0dkJ2UVlPNFpuYnZtakhLKzVyNCtW?=
 =?utf-8?B?eGo5b3c3VE9XN0ZhcitJNzV2aFpoRW11OFRKVlp6UDJDdnlBT1JMV0pWajZU?=
 =?utf-8?B?S1JIZXpveVpMeGhRdFNnYkpLZjg4UXZuRWhIL3VxekY0WEMzN2Fmd2xtQjFr?=
 =?utf-8?B?d3RxZFFUeWEyL0EyN0ZlTnNEUkk4SS9aZkpaRSswSWpJa1lpVHAyUzg3dWJP?=
 =?utf-8?B?VFVuSEFieEJHYnRJN3JTMDhQbGJDZW1jTmZkQzM0T3plR25oOGp0QU91czV4?=
 =?utf-8?B?bk1BM09wbVZESDIzWk05bmtxUTJlQzRIZ2xyUDZOWFE5M21QclZCVVFHSDJk?=
 =?utf-8?B?cUt5amRnM3lwOHVzVCtZb0NWUHJHNGNRVW5CWTB5SVMxUG5aNXlCQlE2Nkx0?=
 =?utf-8?B?SFVDVWdlaC9wcFlhbzh0NlhPMkZYeHIzRnZzM3l0V3N2TUV6eGhtMWFnYis2?=
 =?utf-8?B?Mm1sYUh4amhlNGladndBRHZFK2YrU3ZZNEdBckY5TG9JK0ZCY0FQSktWa3k3?=
 =?utf-8?B?a2cvWldjUjBwYzFMU0FQZDU5dy9jWkw0dnVWMzRvODJWeXJsWWZxcEw0aU4r?=
 =?utf-8?B?QzQ3azNVaml5dFpYMEUvLytNK050ZzhXcW40MU15RXpIWkNWYWJIbndyS0g3?=
 =?utf-8?B?cTBvVitIaEl3NTRUQm4zT1JhTHlaY2FsVXlkSXg1L0JZcVBjOUFrRVd6QjRC?=
 =?utf-8?B?Ym1qeGx3eXVJaDNMODlZUGwyeEhmTnV4N1JzWDZ1ZUk5Ni81WldaWWU3c044?=
 =?utf-8?B?NkZpQnpHKzVCaHVZUEswWDJwSE9JTEtmc0ZRLy9EemY3SGhXdlNTSkdPL1hL?=
 =?utf-8?B?QjJ5bVBRZlpNdzVPQmpidz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S2lzQW43MXJGYXpObG9CbHNEREY0RkZ3c2ZzOEFPUXVDc0JyN3pNbTJFVmJR?=
 =?utf-8?B?d3lmMXYyM05Bb2FyNHIrbk01a2ViUS81dmV4S1RLN3lUdVdhQ2pvbUtaVXFV?=
 =?utf-8?B?bzhvaTZGdjU2dUZpalhwcW5iY2xBTXNRcXZ1VG9nSmIvK0Qva3N6cnF3T2N3?=
 =?utf-8?B?aENxOEJ0dHEwN3gyR2FBODhPRytGRVQwZXJYNEhpQlRQVldKRGJ2eXhmWDZu?=
 =?utf-8?B?clFXU0c5eEFQbU5vK016MURVakZQdENKSHBmUlR1UWkybUZySVVNY2huRzEz?=
 =?utf-8?B?NkhjVDVnSzBGbDFXU3lpNXlBZ2pCaFFPMlZ2eE9oRklVM1ZuMm9BRmpkQXNv?=
 =?utf-8?B?SHFrb2x1ZG9QYVJ6alRLMWcxdUlodGhCOFlLRktjN1RhQ2c2UjhwbGIxWWZL?=
 =?utf-8?B?L0NDYWlMMCs4UHRSMjdidWhqN2FReU1UWDhaK1cwUnYzQXAwZjR4TWh4RFlq?=
 =?utf-8?B?aHdtYTRpZUQvdjd3eG1SU09tbEovTzNFdS82Y3p0SUxMMFRObmNLSlE0SXFV?=
 =?utf-8?B?Y1pPOEp5U0tMdWZWSlRZWDRBWkRrb0ExS2JHV2JMSy9aYUFXd1d4MjltVEtt?=
 =?utf-8?B?UDUrRktrZTN6NnlHcHdrYXVRUjJtQ2ZiMGV3dWxPaUVJdTNTdVJEcFZpSERj?=
 =?utf-8?B?RE4wdEhmeVpkU29BcnJyd1FwVG5UVFozVU5NK1NIaDkrZjVmcm50L2Y4b0dN?=
 =?utf-8?B?UXltZnRGdWFOcDg2ZDZRc2tQbzV2c0xISzVNNUpmckFWazlQeDZxWDlMS25T?=
 =?utf-8?B?RThSdTNvQnNMS3Z2OGd0bDdONUxVem5ZdkhYMEhNcCtiVnlGRTVGaDNJWnFE?=
 =?utf-8?B?eldNeWVhTkJHd3UwSjJDUEgxdkMrNVVOSzFoTjVoeU9aUjg0VlFVNnptamZv?=
 =?utf-8?B?Ynlkb1dTdzNpRTZlMkorUWlHMjZ5dytodWQzMDREMG9qWURsSm12cUp1cnBO?=
 =?utf-8?B?TjdQTzJpNjdmVHlZUVhWZWRHUkN2VTE4OXhHQ20xeGVFZDZDMjVvbzJOR241?=
 =?utf-8?B?WVpmMUlkV2pKRlV2QjF6ZmZTTkFidXY4VjNsbGNqVWJCNENtL2o1VEl6cnhF?=
 =?utf-8?B?M0taWWZISnlvME1HZkx1T1RzMGFxUU1NWms1SlRROXFvaDVPb2VudjcyaDVW?=
 =?utf-8?B?REYvam9ZSWdYbmR6VW53TnlzNlFoQTFicHZNcmNZSjAyS1U4Slp3WHJRU0pK?=
 =?utf-8?B?WTEzV05FTDFibU9UTDBYQmVXRzVJbWJZb2tueXVzNHFqOGVVdjV3UmR3WHdP?=
 =?utf-8?B?ejR2NlpGdVkxTGoyTDVEbHhoTjVPWWY4bTVMemxwekMzSjlvQ3c3Qmp1Uksv?=
 =?utf-8?B?TENETFQ5bitSam1vNlZrd3pLbXlsY1p3UXAyUUdac21QQ0grRC9Hd0FWcEZp?=
 =?utf-8?B?bUpqVGNrNWo1cDZtYXZ4d09yY0lPYmVjVENjc2QrL3hJK0hBbmJ0K2MwMmp6?=
 =?utf-8?B?TkxlVmlDTU1yUFJqYnI3Z1JENkNYZDJkbFlCSDM1QkJyVThkL3hXUlozd21L?=
 =?utf-8?B?THZiOTlLcTRxcyt4KzJhaTcrMHh5VWRGbHZFUG1XWEE3OFdzMDNZaTV5Vnh2?=
 =?utf-8?B?MkpjRWFmcDZhLzNSSWxKVHRyMDNTMFdkWXhMZDVWNS84V1RLTmE1TDFEUzJ0?=
 =?utf-8?B?dy9IckpCRzBQWjNKbjZWKzlrZmQvSFRjRGVMeUZGVW1jaGNoMTJQeEJKVEtW?=
 =?utf-8?B?SXcxcWRkYmNvaFFIaUdlSnVpRVk4OWt1dWlzSURxR3FPN2ZOS2pMREtSUWFa?=
 =?utf-8?B?UjJ5QjVwU3ZTN3g5eGk3MnFodTFCNkwybzlHcHFXRGtGckk3OWVYU3hjR0JV?=
 =?utf-8?B?ZzNndzVYKzBhZ3dhRTJlK0t2ZUJ0Vm9XMWdOUC92SWpIL2luczFoNGx4Mjhm?=
 =?utf-8?B?S3pmTWNpcWpxM2tuT2FEV2lmZmJuL2NYc3VyU3pjM1FWUzVEWkZuaGlCRnh1?=
 =?utf-8?B?TElGZUQ3c2J5M1FjV3pUSlBBNDFsbFpLaXpwdFByRFVwN2tlQldIbkdyUmlF?=
 =?utf-8?B?RFFJYUNxbmJWMmZoSE1zc3hvZ2ZueXM3Ykh4VGVEUkF6OWwyeGtsK001VStj?=
 =?utf-8?B?dm95azJYOFBRWW1yZlFyckVpNVNmYlU4K1VWYWF1RzlUaVdZWUNvZm5lbWF5?=
 =?utf-8?Q?YlJwYSK8hWLUtnd1AsBzhn/MA?=
Content-ID: <35B3CA20C5D64A4092BC14C3025B5F9F@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9341699-1663-4d30-a585-08dce9ba676e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2024 06:03:18.7892 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aAwogCkRgZx/J12lIRq6Dwis2Ho2dE9R+np9x1dxVW5r+VgTNaOPO/VkqR9VJJbD/IAxButiRR3HIQO/kDcgVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB6662
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_005_182056650.1642214634"
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

--__=_Part_Boundary_005_182056650.1642214634
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIFNodS1oc2lhbmc6DQoNCk9uIFdlZCwgMjAyNC0xMC0wOSBhdCAxOToxNSArMDgwMCwgU2h1
LWhzaWFuZyBZYW5nIHdyb3RlOg0KPiBJbnRyb2R1Y2VzIHRoZSBJU1AgcGlwZWxpbmUgZHJpdmVy
IGZvciB0aGUgTWVkaWFUZWsgSVNQIHJhdyBhbmQgeXV2DQo+IG1vZHVsZXMuIEtleSBmdW5jdGlv
bmFsaXRpZXMgaW5jbHVkZSBkYXRhIHByb2Nlc3NpbmcsIFY0TDIgaW50ZWdyYXRpb24sDQo+IHJl
c291cmNlIG1hbmFnZW1lbnQsIGRlYnVnIHN1cHBvcnQsIGFuZCB2YXJpb3VzIGNvbnRyb2wgb3Bl
cmF0aW9ucy4NCj4gQWRkaXRpb25hbGx5LCBJUlEgaGFuZGxpbmcsIHBsYXRmb3JtIGRldmljZSBt
YW5hZ2VtZW50LCBhbmQgTWVkaWFUZWsNCj4gSVNQIERNQSBmb3JtYXQgc3VwcG9ydCBhcmUgYWxz
byBpbmNsdWRlZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFNodS1oc2lhbmcgWWFuZyA8U2h1LWhz
aWFuZy5ZYW5nQG1lZGlhdGVrLmNvbT4NCj4gLS0tDQoNCltzbmlwXQ0KDQo+ICsNCj4gKy8qIGZl
YXR1cmUgbWFzayB0byBjYXRlZ29yaXplIGFsbCByYXcgZnVuY3Rpb25zICovDQo+ICsjZGVmaW5l
IE1US19DQU1fRkVBVFVSRV9IRFJfTUFTSwkJMHgwMDAwMDAwRg0KPiArI2RlZmluZSBNVEtfQ0FN
X0ZFQVRVUkVfU1VCU0FNUExFX01BU0sJCTB4MDAwMDAwRjANCj4gKyNkZWZpbmUgTVRLX0NBTV9G
RUFUVVJFX09GRkxJTkVfTTJNX01BU0sJMHgwMDAwMDEwMA0KPiArI2RlZmluZSBNVEtfQ0FNX0ZF
QVRVUkVfUFVSRV9PRkZMSU5FX00yTV9NQVNLCTB4MDAwMDAyMDANCg0KSXQgc2VlbXMgdGhhdCBN
Mk0gaXMgbm90IGJhc2ljIGZ1bmN0aW9uLiBJdCdzIGFuIGFkdmFuY2VkIGZ1bmN0aW9uLCBzbyBz
ZXBhcmF0ZSBNMk0gcmVsYXRlZCBjb2RlIHRvIGFuIGluZGVwZW5kZW50IHBhdGNoLg0KTWFrZSB0
aGUgZmlyc3QgcGF0Y2ggYXMgc2ltcGxlIGFzIHBvc3NpYmxlLg0KDQpSZWdhcmRzLA0KQ0sNCg0K
PiArDQo+ICtlbnVtIHJhd19mdW5jdGlvbl9pZCB7DQo+ICsJLyogYml0IFswfjNdIGhkciAqLw0K
PiArCS8qIGJpdCBbNH43XSBmcHMgKi8NCj4gKwkvKiBiaXQgWzh+OV0gbTJtICovDQo+ICsJT0ZG
TElORV9NMk0JCQk9ICgxIDw8IDgpLA0KPiArCVBVUkVfT0ZGTElORV9NMk0JCT0gKDEgPDwgOSks
DQo+ICsJUkFXX0ZVTkNUSU9OX0VORAkJPSAweEYwMDAwMDAwLA0KPiArfTsNCj4gKw0KDQo=

--__=_Part_Boundary_005_182056650.1642214634
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtTaHUtaHNpYW5nOg0KDQpPbiYjMzI7V2Vk
LCYjMzI7MjAyNC0xMC0wOSYjMzI7YXQmIzMyOzE5OjE1JiMzMjsrMDgwMCwmIzMyO1NodS1oc2lh
bmcmIzMyO1lhbmcmIzMyO3dyb3RlOg0KJmd0OyYjMzI7SW50cm9kdWNlcyYjMzI7dGhlJiMzMjtJ
U1AmIzMyO3BpcGVsaW5lJiMzMjtkcml2ZXImIzMyO2ZvciYjMzI7dGhlJiMzMjtNZWRpYVRlayYj
MzI7SVNQJiMzMjtyYXcmIzMyO2FuZCYjMzI7eXV2DQomZ3Q7JiMzMjttb2R1bGVzLiYjMzI7S2V5
JiMzMjtmdW5jdGlvbmFsaXRpZXMmIzMyO2luY2x1ZGUmIzMyO2RhdGEmIzMyO3Byb2Nlc3Npbmcs
JiMzMjtWNEwyJiMzMjtpbnRlZ3JhdGlvbiwNCiZndDsmIzMyO3Jlc291cmNlJiMzMjttYW5hZ2Vt
ZW50LCYjMzI7ZGVidWcmIzMyO3N1cHBvcnQsJiMzMjthbmQmIzMyO3ZhcmlvdXMmIzMyO2NvbnRy
b2wmIzMyO29wZXJhdGlvbnMuDQomZ3Q7JiMzMjtBZGRpdGlvbmFsbHksJiMzMjtJUlEmIzMyO2hh
bmRsaW5nLCYjMzI7cGxhdGZvcm0mIzMyO2RldmljZSYjMzI7bWFuYWdlbWVudCwmIzMyO2FuZCYj
MzI7TWVkaWFUZWsNCiZndDsmIzMyO0lTUCYjMzI7RE1BJiMzMjtmb3JtYXQmIzMyO3N1cHBvcnQm
IzMyO2FyZSYjMzI7YWxzbyYjMzI7aW5jbHVkZWQuDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1NpZ25l
ZC1vZmYtYnk6JiMzMjtTaHUtaHNpYW5nJiMzMjtZYW5nJiMzMjsmbHQ7U2h1LWhzaWFuZy5ZYW5n
QG1lZGlhdGVrLmNvbSZndDsNCiZndDsmIzMyOy0tLQ0KDQpbc25pcF0NCg0KJmd0OyYjMzI7Kw0K
Jmd0OyYjMzI7Ky8qJiMzMjtmZWF0dXJlJiMzMjttYXNrJiMzMjt0byYjMzI7Y2F0ZWdvcml6ZSYj
MzI7YWxsJiMzMjtyYXcmIzMyO2Z1bmN0aW9ucyYjMzI7Ki8NCiZndDsmIzMyOysjZGVmaW5lJiMz
MjtNVEtfQ0FNX0ZFQVRVUkVfSERSX01BU0sweDAwMDAwMDBGDQomZ3Q7JiMzMjsrI2RlZmluZSYj
MzI7TVRLX0NBTV9GRUFUVVJFX1NVQlNBTVBMRV9NQVNLMHgwMDAwMDBGMA0KJmd0OyYjMzI7KyNk
ZWZpbmUmIzMyO01US19DQU1fRkVBVFVSRV9PRkZMSU5FX00yTV9NQVNLMHgwMDAwMDEwMA0KJmd0
OyYjMzI7KyNkZWZpbmUmIzMyO01US19DQU1fRkVBVFVSRV9QVVJFX09GRkxJTkVfTTJNX01BU0sw
eDAwMDAwMjAwDQoNCkl0JiMzMjtzZWVtcyYjMzI7dGhhdCYjMzI7TTJNJiMzMjtpcyYjMzI7bm90
JiMzMjtiYXNpYyYjMzI7ZnVuY3Rpb24uJiMzMjtJdCYjMzk7cyYjMzI7YW4mIzMyO2FkdmFuY2Vk
JiMzMjtmdW5jdGlvbiwmIzMyO3NvJiMzMjtzZXBhcmF0ZSYjMzI7TTJNJiMzMjtyZWxhdGVkJiMz
Mjtjb2RlJiMzMjt0byYjMzI7YW4mIzMyO2luZGVwZW5kZW50JiMzMjtwYXRjaC4NCk1ha2UmIzMy
O3RoZSYjMzI7Zmlyc3QmIzMyO3BhdGNoJiMzMjthcyYjMzI7c2ltcGxlJiMzMjthcyYjMzI7cG9z
c2libGUuDQoNClJlZ2FyZHMsDQpDSw0KDQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrZW51bSYjMzI7
cmF3X2Z1bmN0aW9uX2lkJiMzMjt7DQomZ3Q7JiMzMjsrLyomIzMyO2JpdCYjMzI7WzAmIzEyNjsz
XSYjMzI7aGRyJiMzMjsqLw0KJmd0OyYjMzI7Ky8qJiMzMjtiaXQmIzMyO1s0JiMxMjY7N10mIzMy
O2ZwcyYjMzI7Ki8NCiZndDsmIzMyOysvKiYjMzI7Yml0JiMzMjtbOCYjMTI2OzldJiMzMjttMm0m
IzMyOyovDQomZ3Q7JiMzMjsrT0ZGTElORV9NMk09JiMzMjsoMSYjMzI7Jmx0OyZsdDsmIzMyOzgp
LA0KJmd0OyYjMzI7K1BVUkVfT0ZGTElORV9NMk09JiMzMjsoMSYjMzI7Jmx0OyZsdDsmIzMyOzkp
LA0KJmd0OyYjMzI7K1JBV19GVU5DVElPTl9FTkQ9JiMzMjsweEYwMDAwMDAwLA0KJmd0OyYjMzI7
K307DQomZ3Q7JiMzMjsrDQoNCg0KPC9wcmU+DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0tdHlwZTp0
ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5
IE5vdGljZSAqKioqKioqKioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBp
biB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBi
ZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4
ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRl
ZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBB
bnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmlu
ZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMp
IGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1h
eSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2Yg
dGhpcyBlLW1haWwsIG9yIGJlbGlldmUgDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1t
YWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkg
cmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0K
dGhpcyBlLW1haWwgKGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0s
IGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBv
dGhlciBwZXJzb24uIFRoYW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_005_182056650.1642214634--

