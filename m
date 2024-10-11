Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCC8999C28
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 07:41:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82BD310EA34;
	Fri, 11 Oct 2024 05:41:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="JpKpq+eA";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="dio+9JL4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0F5E10EA33
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 05:41:07 +0000 (UTC)
X-UUID: 66c1a4c2879311ef8b96093e013ec31c-20241011
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=mKziQjGIU6jVatJdUQoF4bVjIpGSegUmtRBiTeleuqg=; 
 b=JpKpq+eAAW3bl6ygvrnKm0j6kZLbkvPcqUmWaWR6lRxxsdWTK5QqBHCa1Xcq8biTpodcGWX6RjGIHbPqRhjgIgElnoE1rgFmfPyviYXpXdI3KF9SMnq7wXLZiPmykX9QVda/OLtF5lwFPeFnYCAu5GRR5xYDg8lSc8plmURPHQg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41, REQID:f8d8cee3-2f1a-4905-82be-199ef99c1527, IP:0,
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
X-UUID: 66c1a4c2879311ef8b96093e013ec31c-20241011
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 802085371; Fri, 11 Oct 2024 13:41:02 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 11 Oct 2024 13:41:00 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Fri, 11 Oct 2024 13:41:00 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rA3SQ0ip8ZpPQiUpkWTJVED5FZyUJfy8KySePG17XWucXE/t+yIWaBK3aeqZLo8r3UIFNbwBl+hE1l6DNFUmRg2KjnAYtXx0LunfbNojBEQfkeoVGhB1x+coGhPb62cxI9ItoI7kgEFiIIFGh/dEg0iQasA/3ESRNKukEqGx8txVzIvP85i+SgnIQfNlKljdp0se7psTRFB0P6fcQdMfD/VR4lFHOOzBJyjhsMJyZQ7NsPMwuVihR+maS1ZG4ETgWaSPXcM8CzUGEpOunznWIiGSrMRCXBIYx0jBj69nGsgwnb/ixWWNOA8YTmPGRbQDts9Bor1F4BrNPYnYANP4jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8LS5Y/7ak4+gDJw8FqL8w+mtIZudakLrIopcRSyNNN8=;
 b=lj+sJZPRuwGQ3iKid+OfARxyFWWRqTNZwNlhmqOTjda8dahy9AE9cpXiaWzAPqh/V1TB5gAVX4hNpd30d9RgMr4i41X6M6aOWSiW/UPJdpdSWl2bi6QZfNvejtRd0ADDeOIV85Q7yG9B0fnP+CS8QlcJhATWSQdH4CPwOWdRc7GVqPPVx2gYHGVwQ8eTbfG67x3FCQ0+GRJnbH/50Y0KP6beC2c6IVHpX2AuMFFTLaB88MRp6wU4ySuPStLFY/9KcY6GiVawnhnmv6aolF5jJ9kAoygOiroldaut8WU92NH262r5hSz1r04+gNHNO3cSLppoqcaOxKaDSRi9SxJ4Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8LS5Y/7ak4+gDJw8FqL8w+mtIZudakLrIopcRSyNNN8=;
 b=dio+9JL4T1G0gGLQb5Sg1R45BOSnlEozIubiEcquxYORu5wGKeGICi40SyhuiJHEaYb+fETvhkEIFfsXnTWsqM/UZzsuE2h5iIVtWgoH/wwc/gzN/bm59xOiaZP1GyaSTPidJbs6JKUvR/Dl4JrAAvajnskDD7VLibUutQwV2q8=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYSPR03MB8157.apcprd03.prod.outlook.com (2603:1096:400:473::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Fri, 11 Oct
 2024 05:40:57 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8048.017; Fri, 11 Oct 2024
 05:40:57 +0000
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
Thread-Index: AQHbGj2G8utVn4Ab5UaBggOzyqwWS7KBC84A
Date: Fri, 11 Oct 2024 05:40:57 +0000
Message-ID: <0dc5b6c767e340a8fccbfb812731371c0a0c6c45.camel@mediatek.com>
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
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYSPR03MB8157:EE_
x-ms-office365-filtering-correlation-id: ed671455-e1ba-4adc-b35c-08dce9b747af
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|7416014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?MitEeXo5YnYzb2NjcDZwVUlYU2xyUFJiYXhTQ3RHVlNGRmNoTXIrZkw3SEVD?=
 =?utf-8?B?bUM5YXZqdVNsYVBoUEVIMklLY1VhWHFuVDdBdjFEc3JtMmFTMjVmb0tveWd6?=
 =?utf-8?B?M1FMQ3BmcHI3dlVLQ0VBb2lieEMxYWlmN2orcnhSR3lVTjUvR2NYYTljeTNi?=
 =?utf-8?B?Uk9yL1YzTFEvcHZjcTZYVW1YT2NQcGsycnlOS3lqM0lPN2JPYlA3d3FwK2dY?=
 =?utf-8?B?SCt1YUZ6Nzk2OWRkRmtzMkNFMXpzaTZZdE1QQS9IakZNblQrMW92SDNtcEdu?=
 =?utf-8?B?YmNXUnVRV1FhWVc4anJPaklhc2xtTG5BSXQwdGdrQWpOZTZQeml1QU5sNW1Q?=
 =?utf-8?B?MjVMSk1la1FjVG1YVm01OEJZTitKWTZ3cjFnQjZHSGJubWJBR1k5cHkwUFo2?=
 =?utf-8?B?cFFqckEwVnd0NWNSWjZ3RkdJVlFodm1Qbm1qclltM0RwRmRzVEZWZE42aHRE?=
 =?utf-8?B?MHo0cWtTSGV0UUZOalAvb2g2a3lZdTJNSkd2TjhxRTVSUnJvL2RBOWRGcGNt?=
 =?utf-8?B?M3FIY0pMcENZanQ5VFljZ2QwaTM5S3JxZ245S3VTL29KbzhhdGloUjVPYUhp?=
 =?utf-8?B?eDlYaVgwMFRZazdsN2ttZ1REV0QvamN2YTRhMDBkdzNZcVh5ME1FdXllTDUr?=
 =?utf-8?B?TnpaUExLMUhiWkJXV2JETmFkZjBvem9kTjVyRkRseGNOblc2azNPL1Qzbm5Z?=
 =?utf-8?B?NFJvdGxGcTJVNEZlZVVxS085TVlWN1F2LzE2YlNuOGxjUXUzUEJ2TE5GZVhE?=
 =?utf-8?B?NlNKVlFrc25nTTVObDVzRGVscGtjTGdqcGd1UVRLcEFZZGwyZzlCQmVYcHl3?=
 =?utf-8?B?ZVhZOFF0T3pwSFVsUmowcWZRT3hOV05xTDlhVld1MTR0MStET0JoUWNGVVpE?=
 =?utf-8?B?ckRoUXh4QzFLL0Fsa2dGRGcrbHVDL2ZucTdPckpwdThjOGNXRTcwNG9yaFJa?=
 =?utf-8?B?VklPT0Q1ZGdJaDdOeUUxWXFIaFpzY3dtVGpobDZuOTRiWENCMzBLRUlVSC9S?=
 =?utf-8?B?cGNjbGNxMDJpelJSZm1OaHh1YjdBcTdwNVZINGVWQ3hNZnVZRmFDWDFURjZE?=
 =?utf-8?B?eUljTk9rNHlidEFieWtqNDRlVm9OTDdBNTVwbndlYS9td0pQS1Z4SjdkVlFP?=
 =?utf-8?B?dHR0UjByU0hFanp0eHJ4Ryt2dmx4UE54VHZFUlpXdXZ4aSs2TEFIMGtlZ2Nv?=
 =?utf-8?B?TU1vRTNDV0VaWjVSYkpLY0dQOXg4Qk9weVNNTG1abkN1aWIxVVBLc0pxdjY3?=
 =?utf-8?B?Tm0xa21ybGRrWGxvOGE3NHlFemU0VDUrVXYraXhxU3VMZlhqOTVIRVhEdDEy?=
 =?utf-8?B?WHlIUndPNDFKWSt2UDJmMk9IN0lWcnJpbkJIOU95QVBCV0dMektiaytxV1I5?=
 =?utf-8?B?STREU0o3bUE4dnpuZlpuY2pDUlJsYmVrN2puTnV3QWJkUXpieElKUFhaMkpQ?=
 =?utf-8?B?eVZJbHl3eHZPVmViSXNNaUNnRGZoYW5aS1lsYjUzcnBJcGVTdnBSb216SUNM?=
 =?utf-8?B?WEIrelhZck9kTXU2V3lBbE80TWQ4VWVUb2JabTFiYjVwZUZnVmtPbGJPcjU4?=
 =?utf-8?B?eC9xQkFEWVRHdUJvTlJZVWd6NjAvVjNndmgvS2x5Tkl5aDZGY3pPRGZ5cjYy?=
 =?utf-8?B?MldWQkh4MHVXQm9wdkUxcUtxbzExS05pUEt3SUsvV3ErRmN5QTFsT3JZSlg5?=
 =?utf-8?B?MENaNFZLak1IdGZyeGpkb3QyYUlEQ3BMT21rK2dEWHVEcEZkMkx3SlI3TXlD?=
 =?utf-8?B?THhldXRNdGtlaG9laFczUnc2ZElYemZleFNSendoeEFtZHFUd3hXaGFjVE9O?=
 =?utf-8?B?RFc4V0JRd0xRVlI5Q0pBdz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(7416014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bEYzand0blQyeXIvYTlJZldvYVFRQnYyZWlxZGtsOHg2aHNpbHlxMGpQMUti?=
 =?utf-8?B?SzlkMFoxcVErUmx0RVJkN2NGSUVwTlc5NTRXMWtoUFZQeWJ4SjFhMFlsam1D?=
 =?utf-8?B?cHk4SjJmRTFtZGUwN2l2QytCV3c5ZjVUSHd6VEk0YlROaEwzbEtVaTRLcGtW?=
 =?utf-8?B?dWliNkF2VkZHQUlhSWhOR0lydGZuYVN6aUROb2F2OElSMjB2OWg2VUxBMHVE?=
 =?utf-8?B?TkxSTjZwc0ZDeDZvNmlDcW5ZK2Z2aTJKeW4rVWJoQ2ZWVnIrUHNKY0hvaWVO?=
 =?utf-8?B?L0VwYStWYzd6WnA0RXlJNkNoK2FicjBGSzUrQ0QxWmY1NVBrczJJR0R2OURL?=
 =?utf-8?B?c1JBOGE3blBRbnhDMUVabUpYcHJIU29COXZtQkNzMTVVa1UycStzYXpkRzhX?=
 =?utf-8?B?dHRuZXlTSDRCelRMZENPSmloQ3czdkwzQjQxSGs1V1YwNWZqalM4YkpKMjA5?=
 =?utf-8?B?RlZYeE1KeHMxK29Ja2tFLzBvTlBkTEd5N04yN0tVdzZFY2lnVm1OQ1VvOXJ6?=
 =?utf-8?B?ZVRza3UrZTJmbEc1Sm13bE42Q01nUVlaTFdzS2lmTW5yNEd2d1hmajJDK2hu?=
 =?utf-8?B?a1hXaStscXFBZXlZZkxEZXhFMDEwYXByUzdtcm9GWVkzRWZsaEVZb2xOMGlq?=
 =?utf-8?B?UHFMNlBWSDB0cDY2TjdJMVdRcDFyak5RSHhMOUFGbHhaL01jQU5EY3lNYjhK?=
 =?utf-8?B?STAwaGordWk5TmNqQXI2MUI0VnR3SU9Sd3loL2pZZThxSnhYYWJPdzVIVmRa?=
 =?utf-8?B?bm9QOVl1ekRyTWsyamUxUklFZmxMRzFGRGV3eGl3TlgxRVBza29BM1p1N1da?=
 =?utf-8?B?dUt2c0VYOXkwTXRnKzIxckk0RDhqR2ZXSjNFSUhOWGdOLzBVVExUQ0V0YW10?=
 =?utf-8?B?QnBFU0lNSVM4RFpCK2lQdTJjSlVEaWFWYlhGc1hNNkdrTG4wV0RXYWMyRXBm?=
 =?utf-8?B?ZmlNYVJPYzJTQmNnU3lTV015UUdCL3hzQkd2NTcxUDc2SVgvZ2puTVZaNUJl?=
 =?utf-8?B?RHhSSXFGcldZcFRrUWxWamtFWVp0YS9FcEt3UEY2c3EzZjUremFHdXlGanBN?=
 =?utf-8?B?R1ZFWktqWlB5ZGtLMi9TZzQyU09BSGZWMStDSVIvNDYvelB0UXBlcnVCSUdl?=
 =?utf-8?B?b2xUWFczOFZ2eWVNQ0U3ZFEveU4wOGkxTVhONFJrS0NSazF2bmgvVWV2NSta?=
 =?utf-8?B?b21uUU5CYnVqc1Yvek5iUndvcXVKY2J6bFJqYUk1WVRqaG13SUhFbzBTa0Jp?=
 =?utf-8?B?b3dCMGVrcXB4MU5yalB5dDdjWXhnL3pCZXArVEQ3R3VWbEV5Nkh4ajJsTlJW?=
 =?utf-8?B?YVVIR25EMmpFQ21uTlpQVk0vYUM1WU4zaXU5R1pSNm91MXpsWWhBeHdSOEZO?=
 =?utf-8?B?MkV4cG5jQjZmMFFxc3pvby9NT3E4TU5jd2d2YVA3a09HOWlGWkVSZzhxeU8x?=
 =?utf-8?B?R3l3MUROeVp3UWRZZHVJbmw2ZVdYSXBDNEZseEJ0U2NPVnN5cEg3SHpBM3Qw?=
 =?utf-8?B?NXBmd3dVQVdRZjVsdERXTTVxYUJlNkpnN253KzVrWGNiVHIrMVlYWnpjR2R0?=
 =?utf-8?B?VlBTOHpkaE4yamg0Z0tIa1pXU2oxcnpsRUhicDJ2Q2Z2dkFaUXdXWnVGc21h?=
 =?utf-8?B?dXlZYThFa0lCVXoveCtHUlZCWUM1SHl3UTlYVTlCTHVaRTl0WjM1YnlVSTB6?=
 =?utf-8?B?TzlGRXFvcmdLTkpNUmJ2MEFDVVExaFV4aFJCeW84S0dzMjRjTGxqVjdGci9I?=
 =?utf-8?B?THNVLzY2R0dZVFhyY3JiRStKK2JYbjl4UXJjamhORklNbVBuUVZSRGFqdy8r?=
 =?utf-8?B?c0c2bURYbTltUCtlaFhIcWozdVBzbEVTa0ltUGtNWEFtV1g4MHA1QmNsanZP?=
 =?utf-8?B?VEtwMng0dC85MlpiTGJpTzJaQVduK0QwcFh5T3NSWWRwa0NJS1B1bGQxM1pD?=
 =?utf-8?B?QUVOcGh2eXA3cUFnSTNrbU5iZTI2dks3cHkralUxNzJWMWJDOExPVHlmTkVK?=
 =?utf-8?B?U0FrR3VwMTdZUURqT3hMQWloMEhZZkdSWlRJUDhacWx0ZW1QbHJVVVkxOW9N?=
 =?utf-8?B?VVRBK05tT3RzQm5vTVVzTjlZd0YrYTIzbm4xeGVHek0rQ2ZjQ1pIK2lxOFNa?=
 =?utf-8?Q?Wsvi/GAcE30c9rvIOlzCsN4C8?=
Content-ID: <B68099CEC14BE347B7B76109F101838B@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed671455-e1ba-4adc-b35c-08dce9b747af
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2024 05:40:57.0258 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bSPiGk/trdl+c79zeIw+TYYMqvPNjLBB1dUPQ7MBMvbCXPnILMGH6RkdARZRi5kxv8ElncMYeuzHcpaNEGdVfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB8157
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--11.043200-8.000000
X-TMASE-MatchedRID: oTBA/+sdKaZm6oeM5+OJFCaix8JZpk78jLOy13Cgb4+qvcIF1TcLYCQ5
 BpELg58DN51S4DAAHl+b/PTCT63STGA2IAXETeuKFYJUGv4DL3wK3iJpXUOQQxxeYFneYjlJ8ha
 W4U9IrFqFWYX2TPbDErbiymPk2A1fcNf8KQA4w7yiAZ3zAhQYgo4lnIgC6UzTbcPp/oilssjrWA
 SuUOczV5EurbKWnro51vRwxUNeqRUhvnLuzo4LTJ4CIKY/Hg3AwWulRtvvYxTUHQeTVDUrItRnE
 QCUU+jzjoczmuoPCq2622xc4m398iGcDLI6z781SfHeum2ZAs1An9w+WFcB2qqR6mp41nNF
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--11.043200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: D8DF9C8CD4E61AB9412B9763742DA6F72BEBD548A06545A2968A79B57EB287DE2000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_005_1708889780.615636417"
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

--__=_Part_Boundary_005_1708889780.615636417
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
aWFuZy5ZYW5nQG1lZGlhdGVrLmNvbT4NCj4gLS0tDQoNCltzbmlwXQ0KDQo+ICsNCj4gK3N0YXRp
YyBpcnFyZXR1cm5fdCBtdGtfdGhyZWFkX2lycV9yYXcoaW50IGlycSwgdm9pZCAqZGF0YSkNCj4g
K3sNCj4gKwlzdHJ1Y3QgbXRrX3Jhd19kZXZpY2UgKnJhd19kZXYgPSAoc3RydWN0IG10a19yYXdf
ZGV2aWNlICopZGF0YTsNCj4gKwlzdHJ1Y3QgbXRrX2NhbXN5c19pcnFfaW5mbyBpcnFfaW5mbzsN
Cj4gKw0KPiArCWlmICh1bmxpa2VseShhdG9taWNfY21weGNoZygmcmF3X2Rldi0+aXNfZmlmb19v
dmVyZmxvdywgMSwgMCkpKQ0KPiArCQlkZXZfaW5mbyhyYXdfZGV2LT5kZXYsICJtc2cgZmlmbyBv
dmVyZmxvd1xuIik7DQo+ICsNCj4gKwl3aGlsZSAoa2ZpZm9fbGVuKCZyYXdfZGV2LT5tc2dfZmlm
bykgPj0gc2l6ZW9mKGlycV9pbmZvKSkgew0KPiArCQlpbnQgbGVuID0ga2ZpZm9fb3V0KCZyYXdf
ZGV2LT5tc2dfZmlmbywgJmlycV9pbmZvLCBzaXplb2YoaXJxX2luZm8pKTsNCj4gKw0KPiArCQlX
QVJOX09OKGxlbiAhPSBzaXplb2YoaXJxX2luZm8pKTsNCj4gKw0KPiArCQlkZXZfZGJnKHJhd19k
ZXYtPmRldiwgInRzPSVsbHUgaXJxX3R5cGUgJWQsIHJlcTolZC8lZFxuIiwNCj4gKwkJCWlycV9p
bmZvLnRzX25zLCBpcnFfaW5mby5pcnFfdHlwZSwNCj4gKwkJCWlycV9pbmZvLmZyYW1lX2lkeF9p
bm5lciwgaXJxX2luZm8uZnJhbWVfaWR4KTsNCj4gKw0KPiArCQkvKiBlcnJvciBjYXNlICovDQo+
ICsJCWlmICh1bmxpa2VseShpcnFfaW5mby5pcnFfdHlwZSA9PSAoMSA8PCBDQU1TWVNfSVJRX0VS
Uk9SKSkpIHsNCj4gKwkJCXJhd19oYW5kbGVfZXJyb3IocmF3X2RldiwgJmlycV9pbmZvKTsNCj4g
KwkJCWNvbnRpbnVlOw0KPiArCQl9DQo+ICsNCj4gKwkJLyogbm9ybWFsIGNhc2UgKi8NCj4gKwkJ
LyogaW5mb3JtIGludGVycnVwdCBpbmZvcm1hdGlvbiB0byBjYW1zeXMgY29udHJvbGxlciAqLw0K
PiArCQltdGtfY2Ftc3lzX2lzcl9ldmVudChyYXdfZGV2LT5jYW0sIENBTVNZU19FTkdJTkVfUkFX
LA0KPiArCQkJCSAgICAgcmF3X2Rldi0+aWQsICZpcnFfaW5mbyk7DQoNCm10a19jYW1zeXNfaXNy
X2V2ZW50KCkgaXMgbm90IGRlZmluZWQgaW4gdGhpcyBwYXRjaCBidXQgZGVmaW5lZCBpbiBbOC8x
MF0gcGF0Y2guDQpUaGlzIGlzIHdlaXJkIHRvIHVzZSBhIGZ1bmN0aW9uIGRlZmluZWQgaW4gZnV0
dXJlLg0KRGVmaW5lIHRoaXMgZnVuY3Rpb24gaW4gdGhpcyBwYXRjaCBvciBwcmV2aW91cyBwYXRj
aC4NCg0KUmVnYXJkcywNCkNLDQoNCj4gKwl9DQo+ICsNCj4gKwlyZXR1cm4gSVJRX0hBTkRMRUQ7
DQo+ICt9DQo+ICsNCg0K

--__=_Part_Boundary_005_1708889780.615636417
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
Jmd0OyYjMzI7K3N0YXRpYyYjMzI7aXJxcmV0dXJuX3QmIzMyO210a190aHJlYWRfaXJxX3Jhdyhp
bnQmIzMyO2lycSwmIzMyO3ZvaWQmIzMyOypkYXRhKQ0KJmd0OyYjMzI7K3sNCiZndDsmIzMyOytz
dHJ1Y3QmIzMyO210a19yYXdfZGV2aWNlJiMzMjsqcmF3X2RldiYjMzI7PSYjMzI7KHN0cnVjdCYj
MzI7bXRrX3Jhd19kZXZpY2UmIzMyOyopZGF0YTsNCiZndDsmIzMyOytzdHJ1Y3QmIzMyO210a19j
YW1zeXNfaXJxX2luZm8mIzMyO2lycV9pbmZvOw0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7K2lmJiMz
MjsodW5saWtlbHkoYXRvbWljX2NtcHhjaGcoJmFtcDtyYXdfZGV2LSZndDtpc19maWZvX292ZXJm
bG93LCYjMzI7MSwmIzMyOzApKSkNCiZndDsmIzMyOytkZXZfaW5mbyhyYXdfZGV2LSZndDtkZXYs
JiMzMjsmcXVvdDttc2cmIzMyO2ZpZm8mIzMyO292ZXJmbG93JiM5MjtuJnF1b3Q7KTsNCiZndDsm
IzMyOysNCiZndDsmIzMyOyt3aGlsZSYjMzI7KGtmaWZvX2xlbigmYW1wO3Jhd19kZXYtJmd0O21z
Z19maWZvKSYjMzI7Jmd0Oz0mIzMyO3NpemVvZihpcnFfaW5mbykpJiMzMjt7DQomZ3Q7JiMzMjsr
aW50JiMzMjtsZW4mIzMyOz0mIzMyO2tmaWZvX291dCgmYW1wO3Jhd19kZXYtJmd0O21zZ19maWZv
LCYjMzI7JmFtcDtpcnFfaW5mbywmIzMyO3NpemVvZihpcnFfaW5mbykpOw0KJmd0OyYjMzI7Kw0K
Jmd0OyYjMzI7K1dBUk5fT04obGVuJiMzMjshPSYjMzI7c2l6ZW9mKGlycV9pbmZvKSk7DQomZ3Q7
JiMzMjsrDQomZ3Q7JiMzMjsrZGV2X2RiZyhyYXdfZGV2LSZndDtkZXYsJiMzMjsmcXVvdDt0cz0l
bGx1JiMzMjtpcnFfdHlwZSYjMzI7JWQsJiMzMjtyZXE6JWQvJWQmIzkyO24mcXVvdDssDQomZ3Q7
JiMzMjsraXJxX2luZm8udHNfbnMsJiMzMjtpcnFfaW5mby5pcnFfdHlwZSwNCiZndDsmIzMyOytp
cnFfaW5mby5mcmFtZV9pZHhfaW5uZXIsJiMzMjtpcnFfaW5mby5mcmFtZV9pZHgpOw0KJmd0OyYj
MzI7Kw0KJmd0OyYjMzI7Ky8qJiMzMjtlcnJvciYjMzI7Y2FzZSYjMzI7Ki8NCiZndDsmIzMyOytp
ZiYjMzI7KHVubGlrZWx5KGlycV9pbmZvLmlycV90eXBlJiMzMjs9PSYjMzI7KDEmIzMyOyZsdDsm
bHQ7JiMzMjtDQU1TWVNfSVJRX0VSUk9SKSkpJiMzMjt7DQomZ3Q7JiMzMjsrcmF3X2hhbmRsZV9l
cnJvcihyYXdfZGV2LCYjMzI7JmFtcDtpcnFfaW5mbyk7DQomZ3Q7JiMzMjsrY29udGludWU7DQom
Z3Q7JiMzMjsrfQ0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7Ky8qJiMzMjtub3JtYWwmIzMyO2Nhc2Um
IzMyOyovDQomZ3Q7JiMzMjsrLyomIzMyO2luZm9ybSYjMzI7aW50ZXJydXB0JiMzMjtpbmZvcm1h
dGlvbiYjMzI7dG8mIzMyO2NhbXN5cyYjMzI7Y29udHJvbGxlciYjMzI7Ki8NCiZndDsmIzMyOytt
dGtfY2Ftc3lzX2lzcl9ldmVudChyYXdfZGV2LSZndDtjYW0sJiMzMjtDQU1TWVNfRU5HSU5FX1JB
VywNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7cmF3X2Rldi0mZ3Q7aWQsJiMz
MjsmYW1wO2lycV9pbmZvKTsNCg0KbXRrX2NhbXN5c19pc3JfZXZlbnQoKSYjMzI7aXMmIzMyO25v
dCYjMzI7ZGVmaW5lZCYjMzI7aW4mIzMyO3RoaXMmIzMyO3BhdGNoJiMzMjtidXQmIzMyO2RlZmlu
ZWQmIzMyO2luJiMzMjtbOC8xMF0mIzMyO3BhdGNoLg0KVGhpcyYjMzI7aXMmIzMyO3dlaXJkJiMz
Mjt0byYjMzI7dXNlJiMzMjthJiMzMjtmdW5jdGlvbiYjMzI7ZGVmaW5lZCYjMzI7aW4mIzMyO2Z1
dHVyZS4NCkRlZmluZSYjMzI7dGhpcyYjMzI7ZnVuY3Rpb24mIzMyO2luJiMzMjt0aGlzJiMzMjtw
YXRjaCYjMzI7b3ImIzMyO3ByZXZpb3VzJiMzMjtwYXRjaC4NCg0KUmVnYXJkcywNCkNLDQoNCiZn
dDsmIzMyOyt9DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrcmV0dXJuJiMzMjtJUlFfSEFORExFRDsN
CiZndDsmIzMyOyt9DQomZ3Q7JiMzMjsrDQoNCg0KPC9wcmU+DQo8L3A+PC9ib2R5PjwvaHRtbD48
IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlk
ZW50aWFsaXR5IE5vdGljZSAqKioqKioqKioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNv
bnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVu
dHMpIG1heSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhl
cndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBp
cyBpbnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBp
ZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcs
IHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0
YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0
ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNp
cGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUgDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVk
IHRoaXMgZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlh
dGVseSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29w
aWVzIG9mIA0KdGhpcyBlLW1haWwgKGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91
ciBzeXN0ZW0sIGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWls
IHRvIGFueSBvdGhlciBwZXJzb24uIFRoYW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_005_1708889780.615636417--

