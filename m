Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DBDD2DD68
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 09:16:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62E4E10E826;
	Fri, 16 Jan 2026 08:16:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="N5yDKvh2";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="t1RBwAdc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83FC210E827
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 08:16:00 +0000 (UTC)
X-UUID: 93d0bd72f2b311f0bb3cf39eaa2364eb-20260116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=u1HaKO3zXpRHQr9y/frVL79EfenK3ol9Okd7CaEIgIQ=; 
 b=N5yDKvh2rYNouAQsJh0FytUrIc95e1FRv3AwfbYpy5yVuSr7OiG+JJycTXnMPmnqmtnLZdHgSbIboQ30QZ8Obwl+2YhOVhCEC5zGe8dKX5oedZUDV7HFa+Surbqlpeut41MrIJFqZpz9XPjL/Q7dJpJvi7AqJk+yJqdnfb2NWW4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.9, REQID:5e2aea9f-eaf3-4523-82d8-771031c95250, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:5047765, CLOUDID:3e96335a-a957-4259-bcca-d3af718d7034,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
 TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
 C:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 93d0bd72f2b311f0bb3cf39eaa2364eb-20260116
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1557742526; Fri, 16 Jan 2026 16:15:54 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 16:15:52 +0800
Received: from SI4PR04CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 16 Jan 2026 16:15:52 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VG0hR6VjnILOqneEs35RpqNkynw9SuS+0dI2c59iIYaQkwww0jUlX20q7/ApqWG7t4zqE6u3c9V0PwumBsLBdopvatzNZ9KzlnJ47GRJ2RYTxhUhUYEEtO9YGqmlcn2Pix5lAlU6TcTonbuASuD3fHn2e38d6PKy++UyiTooDl4GlQs32iNLm1ZUIEwonOJKCdKhAijsETz12F4NxoF2Vp7E3cx0g6fyccia5OCeUDWopw3XBIg9kbSSqbNvexEqtprX0cheGAIQeXtRdPbDa7PRS+viqPyrVJl+GGErtG0JCT1hTz7DdzdG8An2yfVLMoDzrkfMUrlY5kojraI5mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gQTR2C7HpSz6owyDQ8bD/BLqJO/NyRyH3iYirxNbSRU=;
 b=wXF/gIKwrkEkU5f807g1ezk4qX0Lc6fbLZdp6YS0fLKlW3Uyv4tzJNtXquTJ6UsZJIoL9afyuAj71WKFc9a3oeTP2Y2XnD7cBPexs6R6YStttbLJE3EnsLXwbLTs58AJG9IgrgH8In2z/kxrI9K3eVwol6V2PRMEMjIjxYm/B3myo8RG2jfuxaD1bVkzeEzTuU0oZpp/DZ9FJfaP3UK72wTm5uuiCq93nHToMMHO86cbhtCtTdFbxvLIP4j64iKDEGTkH1DtWUBRh+52+KYf4kw6VMMNXuWy7W909fQqccQzxAGy1CHxbX3FWJ44VWBsNPo90yMH0xXbjVkn0p0C8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gQTR2C7HpSz6owyDQ8bD/BLqJO/NyRyH3iYirxNbSRU=;
 b=t1RBwAdc6Jo6dRRJQWOkWv3UwqLHYxuDNkdtLJW1OkIkDJKl32wisrnU4dXz+Z2nEdlUw0/OylbSCpK8A6GfXciOHQ36uM/R/l6cOXuzgO4wZWU0IfsI+hCv24DiwKcD7CbXcdiylfarb9vaPu2JJJOn7Y4lMhIwGbRbuRw5RMg=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB8275.apcprd03.prod.outlook.com (2603:1096:101:18e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 08:15:50 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640%5]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 08:15:48 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: "simona@ffwll.ch" <simona@ffwll.ch>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "airlied@gmail.com" <airlied@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "bisson.gary@gmail.com" <bisson.gary@gmail.com>, "kernel@collabora.com"
 <kernel@collabora.com>
Subject: Re: [PATCH] drm/mediatek: mtk_dsi: Add support for High Speed (HS)
 mode
Thread-Topic: [PATCH] drm/mediatek: mtk_dsi: Add support for High Speed (HS)
 mode
Thread-Index: AQHcgIh0TkZrId1cZ0SamoaDpO5II7VUf5GA
Date: Fri, 16 Jan 2026 08:15:48 +0000
Message-ID: <65ed11044d6a52267d6121bcc68cf9c6d9b60b4d.camel@mediatek.com>
References: <20260108101959.14872-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260108101959.14872-1-angelogioacchino.delregno@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB8275:EE_
x-ms-office365-filtering-correlation-id: b0b73508-f10b-4432-d5b1-08de54d7748b
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|42112799006|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?WC80UlVmQXg1Um00K2hnVXF3ajEvY1ZxZW9GYTRFemh3NW1WYjh5b3YzeVQ2?=
 =?utf-8?B?QkZheUlQSklSSTExMERSc0lxOGxKK1kvQzJDZ2ZFMlNaUTBqM0tvWFFvQlln?=
 =?utf-8?B?RTBDMFBMcE1mb2xlVk1SU093M0hRQ3FSQkdYbGFIOVBjOWtlM0p4K2J4ZkpQ?=
 =?utf-8?B?WldZSWFxbnk3V0tQNTFkUWp6OVorVUlVZWlKTGxCL3JVUU80TUduUWxHUlVN?=
 =?utf-8?B?VzVOeWZsTzF4OXJ6SmRiZFduMkNGa1lBR2VsdzF1aEx6L3l3SEswdW9OU1ow?=
 =?utf-8?B?Zm5Lb0FoczMzTCtRYlQ1b01lRWp2V2tOWG9SOUZ2a2FMZDBSU2tjZXJvWmg5?=
 =?utf-8?B?ZGdISFNieExibFpnVVFoTVBrb0poZlRhZDNqZWRDYXoycjVYUU55bHh0U3BJ?=
 =?utf-8?B?eGxIaDFROGF0ODN2ZWVqUG1aV2MzVHdvN1RlMDdCdmFoYlVyT1ZUd0c5Qmdm?=
 =?utf-8?B?L0VySmRDYkVONFhTcHZKV1pTcVJ5VktUUy9DQWl3YzVTMUoyelFVeDVraHBS?=
 =?utf-8?B?NnJZTFVjUHZhL3RIdDhaTWMwcm4rcW5DY01xZ3RxKy9MRHZJYVNDMGRhY2l4?=
 =?utf-8?B?M2xrK1hMSVdGWWlmZThiWFBXME5HVXN6eGZaeC96THRyaW5sN3VqK1o2T1Uv?=
 =?utf-8?B?clVQWmVZV0dsajYrMkJpOEk2dFYvSnowRXBwcEN3N3hXV1FyVGxGMXdSRU9J?=
 =?utf-8?B?amJQeUtnbTk4ZE9kSkdCakd3MGdPTHBEQThmUXpqN3pwQUx1Z3MrKytWYlRi?=
 =?utf-8?B?T0RveU4vTDZuc1NCakMwMGphdGhMckxrTGZpTEx6czk4YlZYRkdUSXRnV1hS?=
 =?utf-8?B?VytOOTZNeXloTWEzRVNrQktiWWs0VnV2ZG5mUjRUVm50WWtqaEtXeFFpVldr?=
 =?utf-8?B?cFdtckxZeU8zejhFZlFyV1d0ZnpCVWRQZElyRzNHMHVRTnZnV0N0WW1zZDJi?=
 =?utf-8?B?SkRuTDd5WEQraWFVRUVYeXJLTzE2Qk9iTTNGR0crYXhZS0Rxc095RnVwYTUr?=
 =?utf-8?B?MmtJVHFpZElCVElLbnJWdkdZajdjZVZBaXlkSXgrUHhUQVkzMU1zVlZMSDBK?=
 =?utf-8?B?U2Y5WHR3VmJUZ3NHM2RqanVlek1YZTY4MGJUaHQ0YzF5dlBIeXJZVUZ1b1JY?=
 =?utf-8?B?VUdWL05JQlJXN25pWlAxUTVLb2xydm5TQTl3VzVxOHJ0cEFtTjk1ejcvekxI?=
 =?utf-8?B?WS9rblpQY3duK1RkdWNraHh2ZHZKWFJzWGdoa0xia3dEQjBOTnk1ZGFBK01E?=
 =?utf-8?B?OHFmRjF1ODcxTUp5aFBieHBZOHFhMWdaOW1vek5tMU9LT2lJM0JmWGJiVW5m?=
 =?utf-8?B?cHd6VzFxZnVwSVNLWWZETlJyRWFVQVJRa2RVbU1UdGtMczZ0YkpKOXo5M1pY?=
 =?utf-8?B?L0xUSUs2dkx5Rk1yY0Z0clMrbXY2dFN0b2ZrdnhTeFlaNDBxTDlEeHJoQko3?=
 =?utf-8?B?OFk2akNoTzFGQk9ocURsSm5DODNoTU9VQWxCa0F6SksvVTRadDJOV1BYU1RC?=
 =?utf-8?B?ZXJMQUw1RTg0ck9GMWpGMHZ6dkFzYld6MzU0YXczc01KUlZrVWVxelE4RThN?=
 =?utf-8?B?MW14VkJzWDE0NmJDWEtpWXR0Vk1jNUpkanJxZ3dQSVlEMTd3UkFSUUsvRWd5?=
 =?utf-8?B?c00zUkJvTzlkU2R3NURQMC9SWG1USTBveVRJMWJBaUlPenNwcUpnTDY5YXdl?=
 =?utf-8?B?emh5M2VrbXZReUoxeS9GemdaS081bUxXREtzdUZDNjA1S2RSQmJhWUlnNEp5?=
 =?utf-8?B?bkpkUkVYYlZ3bFMzNzFQa2RlYXlxc21qMGtTL05iQVJjVjNDaVgzYnZLdnl2?=
 =?utf-8?B?UGRmeWxzald6NHVPZC9zanZCemZrZ3dwcWJIaTJDRHN0eEJWZjRReUd3QzZG?=
 =?utf-8?B?WXJPN1pQV0VlQ3RodXdWMTNEeXI5dXBHOEVLMGFpQ05pMnFxbi9uNW1odUNy?=
 =?utf-8?B?SVJFUlVFNm9qSVBpaGNYa29FV0JrbTBOZEs3dXZUNVVJUyt5b2tJSHVMWlAz?=
 =?utf-8?B?YzFCNEJXa1VZc0lyMkNtTnN1ZnFmTk9YVm1kSEZSaktYMHRXSHVtbUpOYWI3?=
 =?utf-8?B?RDJiWENuKzFNTkRHZmRhcWdTcnJFQmpjd0cwNWQramsvY1pEcHJ2OHluR2xU?=
 =?utf-8?B?cXFIb3ZXN09DV1dnRG95WnRCaFk4NVlQQ0MrRGpUM1VwdEhLdVIyemp3NDYz?=
 =?utf-8?Q?/ktOyPCGNqHTkVU7hUTTkEI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(42112799006)(366016)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OVJaektyekl0N0FlZWlVTDJEeWFBL2pKQ2pvaURpeXMrRHJXanlwenRlbGJz?=
 =?utf-8?B?elhNdEsyN1ZtM1JYMi9WZ2hHZjBxOEN6SkVyNEdlOVdhSXdTdHNXOStHSkRN?=
 =?utf-8?B?emJKSE1xY3RGU3YzdlhNdEEvaVZsUVVPckVFVUcybWRjTGtzMkRyZ2pmdjNv?=
 =?utf-8?B?RzRjVENiUmhHODJzR1ZYODFGblNsbFZVSTZUQzRmSC82WkJFbk5FbW9QK00x?=
 =?utf-8?B?bUlCKzd2UU02cGE4b2I3NWVxeXVWVGNEUC83anR3YnZ3QU1oTlpWYzFwaEw3?=
 =?utf-8?B?VS92MkxGSTBFc0VWZ1BPOXdaUUdUTjc2VVRzVjhaZENOOENGaG5RYlBmU0dC?=
 =?utf-8?B?eHMzNUFndUN0dzN3dGFNV3NPazQ2L055azIwa2VSOU1QK1puWnErYkc2SHFN?=
 =?utf-8?B?cW9Ub0p0SU5GOGRyYzJ5SENaZzJvVU5rZERGQStpRWRmL09DZGpBNmthM2kw?=
 =?utf-8?B?TWFpZHdaY3QzVS9FL1lCV1dZSm5zZU5jVG5EVFhvckU2ZFp0a0gvVlRqUmp2?=
 =?utf-8?B?WWhSRlo5RUVxR1hESkpDTDhpK3pUNnRGM0hFUHRZalV4VndaQ2tSMm9ZWVha?=
 =?utf-8?B?K0hjREhLUTlzVDRjdXJyZ2doS285bTMxZEhZeEJhdm9GeUxMd0pFVXZIL0RO?=
 =?utf-8?B?QUtOVWdic3duRmE0TzVFUFpiR2M4dklpcmpab2RFbTRUbHBMU1pLZk8yeWRn?=
 =?utf-8?B?VjJsTWtKNDRCN0VYai9jaHBRbnc1Qm44NEszc1JJQktEZkhadk1PWVVHN0Zr?=
 =?utf-8?B?YlhBNXRIYkdTc2dWbzdRb3hCc3AzaWg4ODJZa0FUSDgzRVdxQ0M5QmI5REts?=
 =?utf-8?B?alZPc2tTNkJ0TldpcXRFaDl2R0xSQlBFblNiQ1RsSFpScEZUeDFoR05CSnZ0?=
 =?utf-8?B?eHJTMnRRZjA5akFrZTA3Mzdvd0dMY2dkYkRUNDUzWC82RDhKZkJSVHkvRW1E?=
 =?utf-8?B?OTh2VkMvWlJtZkhPUTllS3A1dEY1TlV3OGwxUEhLdkx4bGZLY0xVV1EyMTNX?=
 =?utf-8?B?c3lBZytwQTRaZGtRampsRkF2a3dTdmxObndlakxGYnBIZFlrNEhiN0pZOXhp?=
 =?utf-8?B?T25KUlNXazRrR0ZCZzVJUHNJZzQzNGtvZG00OFVGMllnM3p5anc3d1ZYRXpW?=
 =?utf-8?B?NU1mb2Evb1RqczhVUGpEVmZsMUY2VGNyaXJPT0lIZEozTnJIYlE1OS8wSUFH?=
 =?utf-8?B?azY1alF3c0hkN1VHR2Q4YnU0TXFEeVRxU2oxR3F5TmxoN1JqUXdiZUVQRWJ5?=
 =?utf-8?B?UnhVWmFBakt1MFRac2gzVTd6T1FyMlpaRGpKekNWSTlHancxUFo4bHV4a05m?=
 =?utf-8?B?dE1ycmxORFA0VnZEdXNjZDVmQmI4RSsxRlY2ZTFVaTFPZzE0L3ZmUmM1Rm8r?=
 =?utf-8?B?a0J4aW95RkFSZGVqNUtJT0lzYVdlYTFuR1VaUGdYRVMzUjlFcVVqMkZLY2pj?=
 =?utf-8?B?RTZYZDNyaTR3M1JabnAvL2FCZlFNdVM1NG83K1lqV0FISS9yblBvMkgrOTVn?=
 =?utf-8?B?SXNPaFhWUTJBK1pPZjcyeGtsVGtTV3ZLOThQS1F5LzFOUy9ob0p4UXYzSmJJ?=
 =?utf-8?B?YjgrNTlCanpCdXhmRm56NjRQbFRBR0x3alYwV3Q4TEhFWXk3aG9nVTViR2VY?=
 =?utf-8?B?Y0lwUENJYzdqaTQyRjJZT2tKajJkSldVQUlPNVh5UUQ3VXhhWkUybEdSLyt5?=
 =?utf-8?B?RnkvNXY1elFoT3BiMnRVaUozUStleGlTRE9KdnBpTjQvdDFURWdoc3FCNi9h?=
 =?utf-8?B?QlhVN0lDWmtOaWx6NG16a0w0ZUx3QXEybFYydkk4MkwrU0JpSXdqZ01NeDdy?=
 =?utf-8?B?L3g0UkdPS3lTemRDb2R3VDZXS2RQclM5c3Nkb2ViTlpvdEtjd3VkVkpDWEgv?=
 =?utf-8?B?dERFYmNJNWdreFJOZGlVQURJVU5pWFE4bDBMRjJvREdtckpjdUVramJRVlhL?=
 =?utf-8?B?eWZ2SWpyRkY4bG9oZ0xXSUs4dlViVXQ2UDFUNUF6QVlUdmc2cEhVais4bC9G?=
 =?utf-8?B?dURabzRWS0tOTk90eG84TUF5cGdxaUlZamUwMUNjVE5VcDVHMzZPWTNIajJR?=
 =?utf-8?B?OFNlbnRXeStTbHlTWDY3enBteFErT1ZlU2xtQzl0bUZIZ0JjbTdDTSt0T0lU?=
 =?utf-8?B?bnhUOHlIRnF1RGt5R0NVZVJOSjgzcGlkVGlCb05LV2Z3RTg3Q05VRWRXNE9s?=
 =?utf-8?B?dmpXNDVrUlVGc0RLdm9xL0lNM0lvRHVXcEpFMGRPeUwyMCswcXk0dkZoSm00?=
 =?utf-8?B?dW9FdW51dUQ4bVI2WllWQ2ZaMmJ2Y0ZRWnhodno4aDNZS0s5SUl5VnFoQXdX?=
 =?utf-8?B?TDhKSEJGT2kxMEd5TnYzVXVsTXJub2VsOU9SNHd0dGQxNDlaMDQ5Zz09?=
Content-ID: <B88BFFA20F824D4AAC15A106E1A468B7@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0b73508-f10b-4432-d5b1-08de54d7748b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2026 08:15:48.2599 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1hdN9n+o+1gwCzCDQk4FGwjYhOijbD1IK/6S0SqxrXQt6rCU+PZJwGwx4xlQtRj3riFyuEVQ4B6efwgaO0Z9Rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8275
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_001_2095224021.841179796"
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

--__=_Part_Boundary_001_2095224021.841179796
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDI2LTAxLTA4IGF0IDExOjE5ICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gVXAgdW50aWwgbm93LCB0aGUgTWVkaWFUZWsgRFNJIENvbnRyb2xsZXIg
aGFzIGFsd2F5cyBiZWVuIHdvcmtpbmcNCj4gaW4gTG93IFBvd2VyIE1vZGUgKExQTSksIGFzIHRo
aXMgZHJpdmVyIGhhcyBhbHdheXMgaWdub3JlZCB0aGUNCj4gTUlQSV9EU0lfTVNHX1VTRV9MUE0g
ZmxhZyBoZW5jZSBuZXZlciBzZXR0aW5nIEhTIG1vZGUuDQo+IA0KPiBJbiB0aGUgY3VycmVudCBz
dGF0ZSBvZiB0aGUgZHJpdmVyIHRoZSBvbmx5IHRoaW5nIHRoYXQgaXMgbmVlZGVkDQo+IHRvIGFk
ZCBzdXBwb3J0IGZvciBEU0kgSGlnaCBTcGVlZCAoSFMpIHRyYW5zbWl0IGlzIHRvIHNpbXBseSBz
ZXQNCj4gdGhlICJIU1RYIiBjb25maWcgYml0IGluIHRoZSBjb25maWd1cmF0aW9uIHJlZ2lzdGVy
Lg0KPiANCj4gQ2hlY2sgaWYgZmxhZyBNSVBJX0RTSV9NU0dfVVNFX0xQTSBpcyBzZXQgYW5kLCBp
ZiBub3QsIHNldCBIU1RYLg0KDQpSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNv
bT4NCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFu
Z2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIHwgNCArKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kc2kuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMNCj4gaW5k
ZXggZTQ5NTNkNWNiNmE4Li5hOTBjYWU5NTEyYzUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHNpLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kc2kuYw0KPiBAQCAtMTU1LDYgKzE1NSw3IEBADQo+ICAjZGVmaW5lIFNIT1JUX1BBQ0tF
VAkJCTANCj4gICNkZWZpbmUgTE9OR19QQUNLRVQJCQkyDQo+ICAjZGVmaW5lIEJUQQkJCQlCSVQo
MikNCj4gKyNkZWZpbmUgSFNUWAkJCQlCSVQoMykNCj4gICNkZWZpbmUgREFUQV9JRAkJCQlHRU5N
QVNLKDE1LCA4KQ0KPiAgI2RlZmluZSBEQVRBXzAJCQkJR0VOTUFTSygyMywgMTYpDQo+ICAjZGVm
aW5lIERBVEFfMQkJCQlHRU5NQVNLKDMxLCAyNCkNCj4gQEAgLTExNzcsNiArMTE3OCw5IEBAIHN0
YXRpYyB2b2lkIG10a19kc2lfY21kcShzdHJ1Y3QgbXRrX2RzaSAqZHNpLCBjb25zdCBzdHJ1Y3Qg
bWlwaV9kc2lfbXNnICptc2cpDQo+ICAJZWxzZQ0KPiAgCQljb25maWcgPSAobXNnLT50eF9sZW4g
PiAyKSA/IExPTkdfUEFDS0VUIDogU0hPUlRfUEFDS0VUOw0KPiAgDQo+ICsJaWYgKCEobXNnLT5m
bGFncyAmIE1JUElfRFNJX01TR19VU0VfTFBNKSkNCj4gKwkJY29uZmlnIHw9IEhTVFg7DQo+ICsN
Cj4gIAlpZiAobXNnLT50eF9sZW4gPiAyKSB7DQo+ICAJCWNtZHFfc2l6ZSA9IDEgKyAobXNnLT50
eF9sZW4gKyAzKSAvIDQ7DQo+ICAJCWNtZHFfb2ZmID0gNDsNCg0K

--__=_Part_Boundary_001_2095224021.841179796
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1RodSwmIzMyOzIwMjYtMDEtMDgmIzMyO2F0
JiMzMjsxMToxOSYjMzI7KzAxMDAsJiMzMjtBbmdlbG9HaW9hY2NoaW5vJiMzMjtEZWwmIzMyO1Jl
Z25vJiMzMjt3cm90ZToNCiZndDsmIzMyO1VwJiMzMjt1bnRpbCYjMzI7bm93LCYjMzI7dGhlJiMz
MjtNZWRpYVRlayYjMzI7RFNJJiMzMjtDb250cm9sbGVyJiMzMjtoYXMmIzMyO2Fsd2F5cyYjMzI7
YmVlbiYjMzI7d29ya2luZw0KJmd0OyYjMzI7aW4mIzMyO0xvdyYjMzI7UG93ZXImIzMyO01vZGUm
IzMyOyhMUE0pLCYjMzI7YXMmIzMyO3RoaXMmIzMyO2RyaXZlciYjMzI7aGFzJiMzMjthbHdheXMm
IzMyO2lnbm9yZWQmIzMyO3RoZQ0KJmd0OyYjMzI7TUlQSV9EU0lfTVNHX1VTRV9MUE0mIzMyO2Zs
YWcmIzMyO2hlbmNlJiMzMjtuZXZlciYjMzI7c2V0dGluZyYjMzI7SFMmIzMyO21vZGUuDQomZ3Q7
JiMzMjsNCiZndDsmIzMyO0luJiMzMjt0aGUmIzMyO2N1cnJlbnQmIzMyO3N0YXRlJiMzMjtvZiYj
MzI7dGhlJiMzMjtkcml2ZXImIzMyO3RoZSYjMzI7b25seSYjMzI7dGhpbmcmIzMyO3RoYXQmIzMy
O2lzJiMzMjtuZWVkZWQNCiZndDsmIzMyO3RvJiMzMjthZGQmIzMyO3N1cHBvcnQmIzMyO2ZvciYj
MzI7RFNJJiMzMjtIaWdoJiMzMjtTcGVlZCYjMzI7KEhTKSYjMzI7dHJhbnNtaXQmIzMyO2lzJiMz
Mjt0byYjMzI7c2ltcGx5JiMzMjtzZXQNCiZndDsmIzMyO3RoZSYjMzI7JnF1b3Q7SFNUWCZxdW90
OyYjMzI7Y29uZmlnJiMzMjtiaXQmIzMyO2luJiMzMjt0aGUmIzMyO2NvbmZpZ3VyYXRpb24mIzMy
O3JlZ2lzdGVyLg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtDaGVjayYjMzI7aWYmIzMyO2ZsYWcmIzMy
O01JUElfRFNJX01TR19VU0VfTFBNJiMzMjtpcyYjMzI7c2V0JiMzMjthbmQsJiMzMjtpZiYjMzI7
bm90LCYjMzI7c2V0JiMzMjtIU1RYLg0KDQpSZXZpZXdlZC1ieTomIzMyO0NLJiMzMjtIdSYjMzI7
Jmx0O2NrLmh1QG1lZGlhdGVrLmNvbSZndDsNCg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtTaWduZWQt
b2ZmLWJ5OiYjMzI7QW5nZWxvR2lvYWNjaGlubyYjMzI7RGVsJiMzMjtSZWdubyYjMzI7Jmx0O2Fu
Z2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbSZndDsNCiZndDsmIzMyOy0tLQ0K
Jmd0OyYjMzI7JiMzMjtkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jJiMzMjt8JiMz
Mjs0JiMzMjsrKysrDQomZ3Q7JiMzMjsmIzMyOzEmIzMyO2ZpbGUmIzMyO2NoYW5nZWQsJiMzMjs0
JiMzMjtpbnNlcnRpb25zKCspDQomZ3Q7JiMzMjsNCiZndDsmIzMyO2RpZmYmIzMyOy0tZ2l0JiMz
MjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMmIzMyO2IvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kc2kuYw0KJmd0OyYjMzI7aW5kZXgmIzMyO2U0OTUzZDVjYjZhOC4u
YTkwY2FlOTUxMmM1JiMzMjsxMDA2NDQNCiZndDsmIzMyOy0tLSYjMzI7YS9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RzaS5jDQomZ3Q7JiMzMjsrKysmIzMyO2IvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kc2kuYw0KJmd0OyYjMzI7QEAmIzMyOy0xNTUsNiYjMzI7KzE1NSw3JiMz
MjtAQA0KJmd0OyYjMzI7JiMzMjsjZGVmaW5lJiMzMjtTSE9SVF9QQUNLRVQwDQomZ3Q7JiMzMjsm
IzMyOyNkZWZpbmUmIzMyO0xPTkdfUEFDS0VUMg0KJmd0OyYjMzI7JiMzMjsjZGVmaW5lJiMzMjtC
VEFCSVQoMikNCiZndDsmIzMyOysjZGVmaW5lJiMzMjtIU1RYQklUKDMpDQomZ3Q7JiMzMjsmIzMy
OyNkZWZpbmUmIzMyO0RBVEFfSURHRU5NQVNLKDE1LCYjMzI7OCkNCiZndDsmIzMyOyYjMzI7I2Rl
ZmluZSYjMzI7REFUQV8wR0VOTUFTSygyMywmIzMyOzE2KQ0KJmd0OyYjMzI7JiMzMjsjZGVmaW5l
JiMzMjtEQVRBXzFHRU5NQVNLKDMxLCYjMzI7MjQpDQomZ3Q7JiMzMjtAQCYjMzI7LTExNzcsNiYj
MzI7KzExNzgsOSYjMzI7QEAmIzMyO3N0YXRpYyYjMzI7dm9pZCYjMzI7bXRrX2RzaV9jbWRxKHN0
cnVjdCYjMzI7bXRrX2RzaSYjMzI7KmRzaSwmIzMyO2NvbnN0JiMzMjtzdHJ1Y3QmIzMyO21pcGlf
ZHNpX21zZyYjMzI7Km1zZykNCiZndDsmIzMyOyYjMzI7ZWxzZQ0KJmd0OyYjMzI7JiMzMjtjb25m
aWcmIzMyOz0mIzMyOyhtc2ctJmd0O3R4X2xlbiYjMzI7Jmd0OyYjMzI7MikmIzMyOyYjNjM7JiMz
MjtMT05HX1BBQ0tFVCYjMzI7OiYjMzI7U0hPUlRfUEFDS0VUOw0KJmd0OyYjMzI7JiMzMjsNCiZn
dDsmIzMyOytpZiYjMzI7KCEobXNnLSZndDtmbGFncyYjMzI7JmFtcDsmIzMyO01JUElfRFNJX01T
R19VU0VfTFBNKSkNCiZndDsmIzMyOytjb25maWcmIzMyO3w9JiMzMjtIU1RYOw0KJmd0OyYjMzI7
Kw0KJmd0OyYjMzI7JiMzMjtpZiYjMzI7KG1zZy0mZ3Q7dHhfbGVuJiMzMjsmZ3Q7JiMzMjsyKSYj
MzI7ew0KJmd0OyYjMzI7JiMzMjtjbWRxX3NpemUmIzMyOz0mIzMyOzEmIzMyOysmIzMyOyhtc2ct
Jmd0O3R4X2xlbiYjMzI7KyYjMzI7MykmIzMyOy8mIzMyOzQ7DQomZ3Q7JiMzMjsmIzMyO2NtZHFf
b2ZmJiMzMjs9JiMzMjs0Ow0KDQoNCjwvcHJlPg0KPC9wPjwvYm9keT48L2h0bWw+PCEtLXR5cGU6
dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0
eSBOb3RpY2UNCiAqKioqKioqKioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5l
ZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1h
eSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UN
CmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRl
bmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMp
LiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFp
bmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVu
dHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5k
IG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQg
b2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUNCiANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhp
cyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5
IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMg
b2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5
c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8g
YW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_001_2095224021.841179796--

