Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1955990A68C
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 09:12:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2D9010E1C3;
	Mon, 17 Jun 2024 07:12:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="aNcsGjr0";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="DVIf26x9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B97A10E1C3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 07:12:04 +0000 (UTC)
X-UUID: e31107002c7811efa54bbfbb386b949c-20240617
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=KsE9LPt7bSwQ6LMSTfF51BaGCxkB3ugc/OYWFPvF1WE=; 
 b=aNcsGjr0aDO6S25siMbpxu8jab7+rVTo1+c1qjRkLdn+cfVEPCYquiTPf4dBpR/KoDh51J0/K2upayJ0+Nyp5hT6CP9t6Gjryyn0eHn0ZHG4fhW0kLQVkfNqd/Y8tR0rfg0RIdae/em3WBB8a/WN1/PkfJ0xZbF2+aormDWiTQ0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39, REQID:df8f3822-e97f-42e3-9e91-636b518a2daa, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-META: VersionHash:393d96e, CLOUDID:624daa44-4544-4d06-b2b2-d7e12813c598,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e31107002c7811efa54bbfbb386b949c-20240617
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw01.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2116047130; Mon, 17 Jun 2024 15:11:58 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 17 Jun 2024 15:11:56 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Mon, 17 Jun 2024 15:11:57 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EjdgS5B+XLThRcwc6MdLxudmp4f9lhy/D2FSbJmKtZPD/GWQvFaPFTeyu7688sagKdBJ/0AbrF/K7w+z13+PcrZy2VKIe9YTjcGsCqBNo3pWgB4I4QyiALQTJ7PaVpOBBNJVsSI2XJLRDsunLcAhYsS12FozWtciweeVLcW4is8RbyZeaWjy0nwH029riwTkOpOyZ9G4/sdn1FV0M7q0/5S1Pcov76EeNZ+bO6cvOE4vnZWLGLh2qoHS6a/qMB86+Kv3bySqCj0pDcFMbMytjeE/iEMXWq2lxRwxIx+L08fqP1QRnVqW51GwhwnQttjS50tpx/TJaW9cMkduSTiTSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KsE9LPt7bSwQ6LMSTfF51BaGCxkB3ugc/OYWFPvF1WE=;
 b=AgxTeJp/TDo9JEgEUSpoT6pHrSfYOYEsDIetLAhfhMSxyHWoNaBl0UxVm85pFp35StDDDgOxcOa2dcHXT2R+GYb1jKAHKWbwG69u9iEntdITSMn2V18ZM6eKYVKEYTJZbS39OMh3pQzC1xtg5rc4mNCTtN1QhJoc5JQnmFlRDCHaW5CGnNZEP2cMC0JMX6bUDbOmZYG0d2crbFztMjK8x8XIajCp8/PtNGf4shOkhIWnNMkBia5XRtbpYtGDaIp+6JXEMicdHdWV7vZH1XWaYWYS0fwq3bY6hvJow+tQ+5CvuYHrM+Fn7V7CFUYVZ5DG+q2Uqh2J7QWWNX/t11UAsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KsE9LPt7bSwQ6LMSTfF51BaGCxkB3ugc/OYWFPvF1WE=;
 b=DVIf26x9fPslBKT1lqIUkZsSN2/QzPREqyeRw1JYtDWU+hZ9TvLi9IyGSBVtS+UhJyrQKa/DdeDlq33Jv5J0XQyUOj3OvwFrZaEQg6GGog4oYhXtTEBEU/N8RlM7GNVtAJzuW01Top3GCDVkGn5FZQ21ZsR4qW4MiSTeOIqTmyc=
Received: from OSQPR03MB8697.apcprd03.prod.outlook.com (2603:1096:604:292::8)
 by SEYPR03MB8269.apcprd03.prod.outlook.com (2603:1096:101:1ad::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 07:11:54 +0000
Received: from OSQPR03MB8697.apcprd03.prod.outlook.com
 ([fe80::133a:a06f:d11e:2c6d]) by OSQPR03MB8697.apcprd03.prod.outlook.com
 ([fe80::133a:a06f:d11e:2c6d%5]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 07:11:54 +0000
From: =?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>
To: "andrzej.p@collabora.com" <andrzej.p@collabora.com>, "tfiga@chromium.org"
 <tfiga@chromium.org>, "nhebert@chromium.org" <nhebert@chromium.org>,
 "nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>, "m.szyprowski@samsung.com"
 <m.szyprowski@samsung.com>, "jkardatzke@google.com" <jkardatzke@google.com>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
 "sebastian.fricke@collabora.com" <sebastian.fricke@collabora.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "nfraprado@collabora.com"
 <nfraprado@collabora.com>
CC: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "frkoenig@chromium.org" <frkoenig@chromium.org>, "stevecho@chromium.org"
 <stevecho@chromium.org>, "wenst@chromium.org" <wenst@chromium.org>,
 "jstultz@google.com" <jstultz@google.com>, "christian.koenig@amd.com"
 <christian.koenig@amd.com>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 =?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>,
 "Brian.Starkey@arm.com" <Brian.Starkey@arm.com>, "hsinyi@chromium.org"
 <hsinyi@chromium.org>, "tjmercier@google.com" <tjmercier@google.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: [PATCH v6,02/24] v4l2: handle restricted memory flags in queue
 setup
Thread-Topic: [PATCH v6,02/24] v4l2: handle restricted memory flags in queue
 setup
Thread-Index: AQHap4uaxmJ8LcQMDkiMNJwulBpLArGjNcUAgCiGZoA=
Date: Mon, 17 Jun 2024 07:11:54 +0000
Message-ID: <d6a571a13d41516f17d531c6d53b302a4a0911fb.camel@mediatek.com>
References: <20240516122102.16379-1-yunfei.dong@mediatek.com>
 <20240516122102.16379-3-yunfei.dong@mediatek.com>
 <643d9d0e-a2ff-43ee-933b-55dd191407ae@collabora.com>
In-Reply-To: <643d9d0e-a2ff-43ee-933b-55dd191407ae@collabora.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR03MB8697:EE_|SEYPR03MB8269:EE_
x-ms-office365-filtering-correlation-id: c3d3f0c9-8048-40a2-abaa-08dc8e9cc4c1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230037|376011|7416011|1800799021|366013|38070700015|921017; 
x-microsoft-antispam-message-info: =?utf-8?B?U1doUDEzQm5WSmNaWXZvNEFUa3M4NlRLSDNhOFViT0VSR2Vxc1d0VkxWMXBh?=
 =?utf-8?B?ZDlJZmNhYjd5dlo0TUNqS2VkRGF6eURVL2ZSYTByVnlvRWpJTXJiR1BDc2pC?=
 =?utf-8?B?d0J5Vjl5a2YvV2NMYmo3QUdWb29pbzlPODlGQWxGRmZNckM0YytVaVdSYXVF?=
 =?utf-8?B?QmdScmxaNW53a0RhOVVIWDFUbHhvT3NNeXBwUnpVZ1BQT2c2TnhPdWtjSkNz?=
 =?utf-8?B?VTVCazlqdWsrSEdVT21JdEVTUXZtV2VBV3RaTXhpOWVybWxMQ1lzYzVNL0VX?=
 =?utf-8?B?NnB4K0pmVmdFZ01PNnd6QldOT3NCeHNFUml6aHVRWHJEeEpCRWlwYkhrUWZC?=
 =?utf-8?B?VUFSeEpMOThpSjN6bVAwWitzbGVVS3luSll3MU9GbU1Ja3E2eFlZbW03ZEdV?=
 =?utf-8?B?YUErc1pHUU1FVzI1UlM4S1l3WHF0SzlRam1FU081R1YzV3F6b2gyNWtTbVR2?=
 =?utf-8?B?cElnd2YzQ2s0a1lscDNVbTFzMFBrYlJiQWErM3VvNHArcSs5dC81amVON1ZR?=
 =?utf-8?B?YW1peUZIWjBOTEkzMFJrRUg2V3ZGMXVERlhUbkFSalJlQmt0WXdGbVhVNWQ1?=
 =?utf-8?B?eE42M2JEdkVOVExZM3lMVzhycHRlMlUwa1NGLzRFM2huNVltTGhGamljZmlM?=
 =?utf-8?B?WnNJcVVvZFg2NFRLd2FQa2pKdTJaMVFWbFNib1drb0syZUJzVVJOV0x6M29V?=
 =?utf-8?B?RWV5VFpDTmc5bm54KzFzY2NPaEdwYjVCd2REc2c3UlJ2N0RKclJSaEJKNHc2?=
 =?utf-8?B?M05HNlhtVjNRRWh1SUcvQmdhbFh5TjRFZyt3czBNMDJwVkRIc2NYWUpVNDN0?=
 =?utf-8?B?dENld245S0pFQ3NOR3RRakRlL0VqL0pkNEhnMG9MN0NqbE1YMUo0d2RzQk8v?=
 =?utf-8?B?U0xZYXRaMzdJODlpdzB1OFRvM0pnb0NEUjZzQ1duY2J0Yy9YbTFDOVQ5eW1I?=
 =?utf-8?B?TE9JNWpleHA0R0lBQ1FsWGNaMWVDb0VMVmRKbDlodFh3MTRTY1NFQldZSWth?=
 =?utf-8?B?VlVBUzhrZGcwV1hlblRRYld1dlU1WDVDT2N4bzMxYzRIbFZ2MW9CNjBNbHY3?=
 =?utf-8?B?dVZ5RmFpdWFoa2tsd0JOVlFUOTZzSlpDNHZGQkFrRHJhQUgxc1lVRU8xNlZS?=
 =?utf-8?B?M2dKRXBTRXJTUk5YRSsyL2dKN0VLNzZXbHRRNEh2YWZkTFg4amptZHRESmxY?=
 =?utf-8?B?RlI2RGt2cVY5Z09DY25UbXpoaFExMVl5WW1raVJ5RnFpNUZCdURzdi81dGNn?=
 =?utf-8?B?Wm5IeURTMzI5enh6cXovVmYvc0Q4YnJLN3AxcC9OdHJLOWdYRWZtQ3JjNzZT?=
 =?utf-8?B?SXhXbHIvQWhSYUlHMzNBMjRyOElZcjFzMkJteTVudCtVMENudDRENGhKY3hv?=
 =?utf-8?B?clhJcHhOanNaajU3RTJSa0NUM0o5Si8zYitUZzBqZWZlMEU3dDdvb0dta1BE?=
 =?utf-8?B?bmVlTFdLZlQwRzQ0YmdjSG1RUCtyNTZJZWJVMnBaT0V3aGd6UUxPUXNiTjhB?=
 =?utf-8?B?WGNaaExOT2ZjdFFFNlZHdUtramVLUmZsL2NwOEtQVjhUTm5HWk5HZytKKzFK?=
 =?utf-8?B?K3JXclcrcllLSkptM1JjTzlWTW1POERqS0FMdUlxZWpMUWhqN0RobCs0Sjho?=
 =?utf-8?B?aXpFT21rdElpamllaWlydDJyOFJDbzJndDVHU3F6VkErckZVN05lam5yZWVX?=
 =?utf-8?B?alAvVllFT0NmVkhiTWI3YnhRbnRCNzhtZWpQMnpMZ05RR29jbC9RS1lqSEtn?=
 =?utf-8?B?bGtldnU0T2ZRYlVUanFsWU5HLytWaWdCbTZDS2h5WWJUSDdldUtOTUlMbUd5?=
 =?utf-8?B?L3hmTXFUVnN1TDhpNXhXaDFBUUpBdElhYTdaS1dJYmFlRWZ1RSs0TjNIWTAw?=
 =?utf-8?Q?AiRUkuosGtUqk?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OSQPR03MB8697.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(7416011)(1800799021)(366013)(38070700015)(921017);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dlk3dHpKdDNZMWhUQmRhK0VHdnF1QlYwdi9FYlhHdmhra1ZYR0ZBd3R6Q2Na?=
 =?utf-8?B?NE1oM3JlRmxsbklSTjdkRUFwejZtMEFLb0dReGpIWmpkQS9rbERXU2gwVkln?=
 =?utf-8?B?VFlMcDU2NUJ3K1hlOUVFVlJFdGx4c25oaWR5c3pnZXI1dFEzeVFETG1LWSt5?=
 =?utf-8?B?TWIxWGprdjFydmNSWjVOS2oyVllZMWNZeDJ1YVZuVlUwOEJ1MVY1RE1KYjJ4?=
 =?utf-8?B?R3J1QW5ybllQUGVzVWlrT2xaTk9JMDBlakwwQW4zTGk2bkZpaWpGeFdJdHhI?=
 =?utf-8?B?UkVIeFA1aXoyR2tURzdPTWlONUs2eU1SZmdNbG5lRGhyT0dwcnhzMVZ0SU1a?=
 =?utf-8?B?Z2Q3U1k2cjJrclhxaFJDZmthRVZSalo5TU9SL0p1dUtITGhjdGNXQ1MwWDFs?=
 =?utf-8?B?WHZOZDZYSi9nRUdaMHBOZUdWeDFxaDFxUmkwZlV2cmI1RHJOOUJ6MGlJalVu?=
 =?utf-8?B?SWN6VFFLZUJMVzU3NnlyR1cza3puSi9ick02VkFCVUtvVU5Vb21heU5pa3Ur?=
 =?utf-8?B?QTY1N1NZUk9Da2VJODg2TUtVYUQweFlsM3ozaVF4YXZIbjhRbUFkN05nR2xv?=
 =?utf-8?B?K1ZTZnBNTUpETDNwQ1VJS0hkNEZ1cys5dHY5NHMreTNpWjhoa2k0bWc5V21W?=
 =?utf-8?B?Um9Sb3BaeVNXdVc3cWhDNUp4Tzlhc09ZWnN6eDcvbmk3Ky8yVys1Nm5DOWJM?=
 =?utf-8?B?NCs2V3hhRklJWTZMbkEyeVhDWXBtUXdxYWhObmszalY3TEx6OGdJZTNIRXJD?=
 =?utf-8?B?L0RGYjloaGU1NThDNy9ZbUl5UlZOVVRndFcreU1hdFhucHdQU2R6WE9GM3M1?=
 =?utf-8?B?U0JGRlBTZmJDQmUwMExCN25mMGVyNG9tOXR2NFBoZXVzYTJUUmFld2RNWm1s?=
 =?utf-8?B?RUNOdVZlWEl0bUNjd3IzNHpjUDJhL1Q3eVVOL3M2LzV1M1pYWXVla2k4dXY0?=
 =?utf-8?B?MEJRQW5HZ0RTazZpSy9WUGc3S1NHUC9NQjMwWm5aTGFqNmVwUXNEMUIvc1FS?=
 =?utf-8?B?cUpFSFQ4ZmNEUCs5Z0l5SThvTDJaWjIxVE42c0NycnQzNDVmdDNDWHFqeDlh?=
 =?utf-8?B?WmZPWGN2ZUJrS2JZWGs1MEN6bGNicFYybU9hZkFHT2I1Um1uNCtBZk9TamR3?=
 =?utf-8?B?dU5FZDZiMFBpdFpMSEhJUElxbTZVZWlmaHk0RjVCMjZIanBRWWpWVWN1ckpz?=
 =?utf-8?B?T0RSNDNYOTVmdGpSNThhQXFDemhzdHQ1TUVmZzRPSEhOcjVLbkdLT2dLVkpK?=
 =?utf-8?B?Vmg2YnlPQXdsbjlZa1FGVll6M2s1bWdWeFpBcUp4ZzI1TkNTaWhoOHhDY2lI?=
 =?utf-8?B?eThTZDQvdkpGTGpyVjVyRXpMenNxU2ppUmgvY2Rndk5XTUtGcFo4cWZNZzdE?=
 =?utf-8?B?SnZCUW9IaTdZL3ZXeVYycjlVSkRIOHlTS1JNV1ArT29XUUdDd2tPSXFwRFJD?=
 =?utf-8?B?ZlRGOFVSQkR3NEdhWDZad2RkelZCblZndGtUclRGZTVpL2szbzIwblZWenp5?=
 =?utf-8?B?OFFpMFRCYjBVOXRGNVpJNmhZNXFYT0NnbngwT2lkMzhJSndsd0pZbnRBM1Fn?=
 =?utf-8?B?RFdQQXBBTEZPS0dkT0puZ1JML2FNRzhSUVZwTG05L0VWQ01nN0pMdHNKV0xo?=
 =?utf-8?B?SVI1R0JyUVZBYWNBNm1wUDkzaXVubDJzRXZjNS9URG4vekNzY3p0WlJnb3Bt?=
 =?utf-8?B?RDJOU3JpTXlMTTdVTThQc0Y5UFI4UGtscGg2bWszSXB4aTUxYVFYcTVCYXhy?=
 =?utf-8?B?T1BqQWJiMmkyekorTUFvbm1NL1hwc2NUYlBGM1NIRENCVElyRlFXOHpvb2t4?=
 =?utf-8?B?MExPNitnTFJySFhLMUpndGxsWFM5M2N2ajNOWlF1YXFSYjI1YWJySlMrTjVF?=
 =?utf-8?B?MC9NcUdpZ09yZmo4M01BTGx6Z1RwNE9TRUFsSDh3b1pqR3RmNjFhT0QwOTJQ?=
 =?utf-8?B?SThqR3RrRUJBWDBmdm1PbGdJVklHYVp2MFN3RnFSZ01Qdzg0QzNYaS9jVk5p?=
 =?utf-8?B?N2NyWFVnNWJjTFR5eWVkNW5HZUdQbTZuZzM5NXQ2eUZ1MVJFQUl3bmJ3OEVU?=
 =?utf-8?B?OXlscmtZa0pZeGhDYnFnZVpuTldPZmc4Ky9MdEtBWlZ3ZFFqM2gxZkZ4NFFm?=
 =?utf-8?B?dzBFMi9yVjNxaUhNZDJ0MTFhRXlkd3NVelhCbUVlVnl2dkhKWE8wSEN6ZHRt?=
 =?utf-8?B?V2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7BB16418376E6E41AE2367B62CA7C1AB@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSQPR03MB8697.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3d3f0c9-8048-40a2-abaa-08dc8e9cc4c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2024 07:11:54.6519 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zwaMOwnCxFzhvi5nezb6z3zU/z+6ZE/RYmc6FOoDhMHoBFAKefVcoO1aVFoeAKyR9/dflArtxwI2rD0/IRXN0MTxsFzEXi9YGXP6zVZsBoc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8269
X-MTK: N
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

SGkgQW5kcnplaiwNCg0KVGhhbmtzIGZvciB5b3VyIGhlbHAgdG8gcmV2aWV3IHRoaXMgcGF0Y2gu
DQoNCllvdXIgc3VnZ2VzdGlvbiBpcyB2ZXJ5IHJlYXNvbmFibGUsIEkgd2lsbCBjaGFuZ2UgaXQg
bGF0ZXIuDQoNCkJlc3QgUmVnYXJkcywNCll1bmZlaSBEb25nDQpPbiBXZWQsIDIwMjQtMDUtMjIg
YXQgMTQ6MjAgKzAyMDAsIEFuZHJ6ZWogUGlldHJhc2lld2ljeiB3cm90ZToNCj4gSGkgWXVuZmVp
ICYgSmVmZnJleSwNCj4gDQo+IFcgZG5pdSAxNi4wNS4yMDI0IG8gMTQ6MjAsIFl1bmZlaSBEb25n
IHBpc3plOg0KPiA+IEZyb206IEplZmZyZXkgS2FyZGF0emtlIDxqa2FyZGF0emtlQGdvb2dsZS5j
b20+DQo+ID4gDQo+ID4gVmFsaWRhdGVzIHRoZSByZXN0cmljdGVkIG1lbW9yeSBmbGFncyB3aGVu
IHNldHRpbmcgdXAgYSBxdWV1ZSBhbmQNCj4gPiBlbnN1cmVzIHRoZSBxdWV1ZSBoYXMgdGhlIHBy
b3BlciBjYXBhYmlsaXR5Lg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEplZmZyZXkgS2FyZGF0
emtlIDxqa2FyZGF0emtlQGdvb2dsZS5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogWXVuZmVpIERv
bmcgPHl1bmZlaS5kb25nQG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgIC4uLi9tZWRpYS9j
b21tb24vdmlkZW9idWYyL3ZpZGVvYnVmMi1jb3JlLmMgICB8IDIxDQo+ID4gKysrKysrKysrKysr
KysrKysrKw0KPiA+ICAgLi4uL21lZGlhL2NvbW1vbi92aWRlb2J1ZjIvdmlkZW9idWYyLXY0bDIu
YyAgIHwgIDQgKysrLQ0KPiA+ICAgMiBmaWxlcyBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvY29tbW9u
L3ZpZGVvYnVmMi92aWRlb2J1ZjItY29yZS5jDQo+ID4gYi9kcml2ZXJzL21lZGlhL2NvbW1vbi92
aWRlb2J1ZjIvdmlkZW9idWYyLWNvcmUuYw0KPiA+IGluZGV4IDM1OGYxZmU0Mjk3NS4uZmU0YzA1
OTRhYjgxIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEvY29tbW9uL3ZpZGVvYnVmMi92
aWRlb2J1ZjItY29yZS5jDQo+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9jb21tb24vdmlkZW9idWYy
L3ZpZGVvYnVmMi1jb3JlLmMNCj4gPiBAQCAtODMxLDYgKzgzMSwxNSBAQCBzdGF0aWMgYm9vbCB2
ZXJpZnlfY29oZXJlbmN5X2ZsYWdzKHN0cnVjdA0KPiA+IHZiMl9xdWV1ZSAqcSwgYm9vbCBub25f
Y29oZXJlbnRfbWVtKQ0KPiA+ICAgCXJldHVybiB0cnVlOw0KPiA+ICAgfQ0KPiA+ICAgDQo+ID4g
K3N0YXRpYyBib29sIHZlcmlmeV9yZXN0cmljdGVkX21lbV9mbGFncyhzdHJ1Y3QgdmIyX3F1ZXVl
ICpxLCBib29sDQo+ID4gcmVzdHJpY3RlZF9tZW0pDQo+ID4gK3sNCj4gPiArCWlmIChyZXN0cmlj
dGVkX21lbSAhPSBxLT5yZXN0cmljdGVkX21lbSkgew0KPiA+ICsJCWRwcmludGsocSwgMSwgInJl
c3RyaWN0ZWQgbWVtb3J5IG1vZGVsIG1pc21hdGNoXG4iKTsNCj4gPiArCQlyZXR1cm4gZmFsc2U7
DQo+ID4gKwl9DQo+ID4gKwlyZXR1cm4gdHJ1ZTsNCj4gPiArfQ0KPiA+ICsNCj4gPiAgIHN0YXRp
YyBpbnQgdmIyX2NvcmVfYWxsb2NhdGVkX2J1ZmZlcnNfc3RvcmFnZShzdHJ1Y3QgdmIyX3F1ZXVl
DQo+ID4gKnEpDQo+ID4gICB7DQo+ID4gICAJaWYgKCFxLT5idWZzKQ0KPiA+IEBAIC04NjQsNiAr
ODczLDcgQEAgaW50IHZiMl9jb3JlX3JlcWJ1ZnMoc3RydWN0IHZiMl9xdWV1ZSAqcSwgZW51bQ0K
PiA+IHZiMl9tZW1vcnkgbWVtb3J5LA0KPiA+ICAgCXVuc2lnbmVkIGludCBxX251bV9idWZzID0g
dmIyX2dldF9udW1fYnVmZmVycyhxKTsNCj4gPiAgIAl1bnNpZ25lZCBwbGFuZV9zaXplc1tWQjJf
TUFYX1BMQU5FU10gPSB7IH07DQo+ID4gICAJYm9vbCBub25fY29oZXJlbnRfbWVtID0gZmxhZ3Mg
JiBWNEwyX01FTU9SWV9GTEFHX05PTl9DT0hFUkVOVDsNCj4gPiArCWJvb2wgcmVzdHJpY3RlZF9t
ZW0gPSBmbGFncyAmIFY0TDJfTUVNT1JZX0ZMQUdfUkVTVFJJQ1RFRDsNCj4gPiAgIAl1bnNpZ25l
ZCBpbnQgaSwgZmlyc3RfaW5kZXg7DQo+ID4gICAJaW50IHJldCA9IDA7DQo+ID4gICANCj4gPiBA
QCAtOTA3LDYgKzkxNyw5IEBAIGludCB2YjJfY29yZV9yZXFidWZzKHN0cnVjdCB2YjJfcXVldWUg
KnEsIGVudW0NCj4gPiB2YjJfbWVtb3J5IG1lbW9yeSwNCj4gPiAgIAkJCXJldHVybiAwOw0KPiA+
ICAgCX0NCj4gPiAgIA0KPiA+ICsJaWYgKHJlc3RyaWN0ZWRfbWVtICYmICghcS0+YWxsb3dfcmVz
dHJpY3RlZF9tZW0gfHwgbWVtb3J5ICE9DQo+ID4gVkIyX01FTU9SWV9ETUFCVUYpKQ0KPiA+ICsJ
CXJldHVybiAtRUlOVkFMOw0KPiA+ICsNCj4gPiAgIAkvKg0KPiA+ICAgCSAqIE1ha2Ugc3VyZSB0
aGUgcmVxdWVzdGVkIHZhbHVlcyBhbmQgY3VycmVudCBkZWZhdWx0cyBhcmUNCj4gPiBzYW5lLg0K
PiA+ICAgCSAqLw0KPiA+IEBAIC05MjQsNiArOTM3LDcgQEAgaW50IHZiMl9jb3JlX3JlcWJ1ZnMo
c3RydWN0IHZiMl9xdWV1ZSAqcSwgZW51bQ0KPiA+IHZiMl9tZW1vcnkgbWVtb3J5LA0KPiA+ICAg
CWlmIChyZXQpDQo+ID4gICAJCXJldHVybiByZXQ7DQo+ID4gICAJc2V0X3F1ZXVlX2NvaGVyZW5j
eShxLCBub25fY29oZXJlbnRfbWVtKTsNCj4gPiArCXEtPnJlc3RyaWN0ZWRfbWVtID0gcmVzdHJp
Y3RlZF9tZW07DQo+ID4gICANCj4gPiAgIAkvKg0KPiA+ICAgCSAqIEFzayB0aGUgZHJpdmVyIGhv
dyBtYW55IGJ1ZmZlcnMgYW5kIHBsYW5lcyBwZXIgYnVmZmVyIGl0DQo+ID4gcmVxdWlyZXMuDQo+
ID4gQEAgLTEwMzIsNiArMTA0Niw3IEBAIGludCB2YjJfY29yZV9jcmVhdGVfYnVmcyhzdHJ1Y3Qg
dmIyX3F1ZXVlICpxLA0KPiA+IGVudW0gdmIyX21lbW9yeSBtZW1vcnksDQo+ID4gICAJdW5zaWdu
ZWQgcGxhbmVfc2l6ZXNbVkIyX01BWF9QTEFORVNdID0geyB9Ow0KPiA+ICAgCWJvb2wgbm9uX2Nv
aGVyZW50X21lbSA9IGZsYWdzICYgVjRMMl9NRU1PUllfRkxBR19OT05fQ09IRVJFTlQ7DQo+ID4g
ICAJdW5zaWduZWQgaW50IHFfbnVtX2J1ZnMgPSB2YjJfZ2V0X251bV9idWZmZXJzKHEpOw0KPiA+
ICsJYm9vbCByZXN0cmljdGVkX21lbSA9IGZsYWdzICYgVjRMMl9NRU1PUllfRkxBR19SRVNUUklD
VEVEOw0KPiA+ICAgCWJvb2wgbm9fcHJldmlvdXNfYnVmZmVycyA9ICFxX251bV9idWZzOw0KPiA+
ICAgCWludCByZXQgPSAwOw0KPiA+ICAgDQo+ID4gQEAgLTEwNDAsNiArMTA1NSw5IEBAIGludCB2
YjJfY29yZV9jcmVhdGVfYnVmcyhzdHJ1Y3QgdmIyX3F1ZXVlICpxLA0KPiA+IGVudW0gdmIyX21l
bW9yeSBtZW1vcnksDQo+ID4gICAJCXJldHVybiAtRU5PQlVGUzsNCj4gPiAgIAl9DQo+ID4gICAN
Cj4gPiArCWlmIChyZXN0cmljdGVkX21lbSAmJiAoIXEtPmFsbG93X3Jlc3RyaWN0ZWRfbWVtIHx8
IG1lbW9yeSAhPQ0KPiA+IFZCMl9NRU1PUllfRE1BQlVGKSkNCj4gPiArCQlyZXR1cm4gLUVJTlZB
TDsNCj4gPiArDQo+IA0KPiBUaGlzIGNvbmRpdGlvbiBpcyByZXBlYXRlZCBpbiBhbm90aGVyIHBs
YWNlLiBJZiBpdCBpcyBldmVyIHRvIGJlDQo+IGNoYW5nZWQsIHRoZSBwZXJzb24gY2hhbmdpbmcg
aXQgbXVzdCByZW1lbWJlciB0byBsb29rIGF0IGJvdGgNCj4gcGxhY2VzLiBNYXliZToNCj4gDQo+
IHN0YXRpYyBpbmxpbmUgaW50IHJlc3RyaWN0ZWRfbWVtX21pc21hdGNoKGJvb2wgcmVzdHJpY3Rl
ZF9tZW0sDQo+IAkJCQlzdHJ1Y3QgdmIyX3F1ZXVlICpxLCBlbnVtIHZiMl9tZW1vcnkNCj4gbWVt
b3J5KQ0KPiB7DQo+IAlyZXR1cm4gcmVzdHJpY3RlZF9tZW0gJiYNCj4gCQkoIXEtPmFsbG93X3Jl
c3RyaWN0ZWRfbWVtIHx8IG1lbW9yeSAhPQ0KPiBWQjJfTUVNT1JZX0RNQUJVRikgPw0KPiAJCS0x
IDogMDsNCj4gfQ0KPiANCj4gKHlvdSBwcm9iYWJseSB3YW50IHRvIGNsZWFuIHVwIGxpbmUgYnJl
YWtzKQ0KPiANCj4gYW5kOg0KPiANCj4gCWlmIChyZXN0cmljdGVkX21lbV9taXNtYXRjaChyZXN0
cmljdGVkX21lbSwgcSwgbWVtb3J5KSkNCj4gCQlyZXR1cm4gLUVJTlZBTDsNCj4gDQo+IFJlZ2Fy
ZHMsDQo+IA0KPiBBbmRyemVqDQo+IA0KPiA+ICAgCWlmIChub19wcmV2aW91c19idWZmZXJzKSB7
DQo+ID4gICAJCWlmIChxLT53YWl0aW5nX2luX2RxYnVmICYmICpjb3VudCkgew0KPiA+ICAgCQkJ
ZHByaW50ayhxLCAxLCAiYW5vdGhlciBkdXAoKXBlZCBmZCBpcyB3YWl0aW5nDQo+ID4gZm9yIGEg
YnVmZmVyXG4iKTsNCj4gPiBAQCAtMTA1OCw2ICsxMDc2LDcgQEAgaW50IHZiMl9jb3JlX2NyZWF0
ZV9idWZzKHN0cnVjdCB2YjJfcXVldWUgKnEsDQo+ID4gZW51bSB2YjJfbWVtb3J5IG1lbW9yeSwN
Cj4gPiAgIAkJCXJldHVybiByZXQ7DQo+ID4gICAJCXEtPndhaXRpbmdfZm9yX2J1ZmZlcnMgPSAh
cS0+aXNfb3V0cHV0Ow0KPiA+ICAgCQlzZXRfcXVldWVfY29oZXJlbmN5KHEsIG5vbl9jb2hlcmVu
dF9tZW0pOw0KPiA+ICsJCXEtPnJlc3RyaWN0ZWRfbWVtID0gcmVzdHJpY3RlZF9tZW07DQo+ID4g
ICAJfSBlbHNlIHsNCj4gPiAgIAkJaWYgKHEtPm1lbW9yeSAhPSBtZW1vcnkpIHsNCj4gPiAgIAkJ
CWRwcmludGsocSwgMSwgIm1lbW9yeSBtb2RlbCBtaXNtYXRjaFxuIik7DQo+ID4gQEAgLTEwNjUs
NiArMTA4NCw4IEBAIGludCB2YjJfY29yZV9jcmVhdGVfYnVmcyhzdHJ1Y3QgdmIyX3F1ZXVlICpx
LA0KPiA+IGVudW0gdmIyX21lbW9yeSBtZW1vcnksDQo+ID4gICAJCX0NCj4gPiAgIAkJaWYgKCF2
ZXJpZnlfY29oZXJlbmN5X2ZsYWdzKHEsIG5vbl9jb2hlcmVudF9tZW0pKQ0KPiA+ICAgCQkJcmV0
dXJuIC1FSU5WQUw7DQo+ID4gKwkJaWYgKCF2ZXJpZnlfcmVzdHJpY3RlZF9tZW1fZmxhZ3MocSwg
cmVzdHJpY3RlZF9tZW0pKQ0KPiA+ICsJCQlyZXR1cm4gLUVJTlZBTDsNCj4gPiAgIAl9DQo+ID4g
ICANCj4gPiAgIAludW1fYnVmZmVycyA9IG1pbigqY291bnQsIHEtPm1heF9udW1fYnVmZmVycyAt
IHFfbnVtX2J1ZnMpOw0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL2NvbW1vbi92aWRl
b2J1ZjIvdmlkZW9idWYyLXY0bDIuYw0KPiA+IGIvZHJpdmVycy9tZWRpYS9jb21tb24vdmlkZW9i
dWYyL3ZpZGVvYnVmMi12NGwyLmMNCj4gPiBpbmRleCAyOTNmM2Q1ZjFjNGUuLjllZTI0ZTUzN2Uw
YyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL2NvbW1vbi92aWRlb2J1ZjIvdmlkZW9i
dWYyLXY0bDIuYw0KPiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEvY29tbW9uL3ZpZGVvYnVmMi92aWRl
b2J1ZjItdjRsMi5jDQo+ID4gQEAgLTY4Miw3ICs2ODIsNyBAQCBzdGF0aWMgdm9pZCB2YjJfc2V0
X2ZsYWdzX2FuZF9jYXBzKHN0cnVjdA0KPiA+IHZiMl9xdWV1ZSAqcSwgdTMyIG1lbW9yeSwNCj4g
PiAgIAkJKmZsYWdzID0gMDsNCj4gPiAgIAl9IGVsc2Ugew0KPiA+ICAgCQkvKiBDbGVhciBhbGwg
dW5rbm93biBmbGFncy4gKi8NCj4gPiAtCQkqZmxhZ3MgJj0gVjRMMl9NRU1PUllfRkxBR19OT05f
Q09IRVJFTlQ7DQo+ID4gKwkJKmZsYWdzICY9IFY0TDJfTUVNT1JZX0ZMQUdfTk9OX0NPSEVSRU5U
IHwNCj4gPiBWNEwyX01FTU9SWV9GTEFHX1JFU1RSSUNURUQ7DQo+ID4gICAJfQ0KPiA+ICAgDQo+
ID4gICAJKmNhcHMgfD0gVjRMMl9CVUZfQ0FQX1NVUFBPUlRTX09SUEhBTkVEX0JVRlM7DQo+ID4g
QEAgLTY5OCw2ICs2OTgsOCBAQCBzdGF0aWMgdm9pZCB2YjJfc2V0X2ZsYWdzX2FuZF9jYXBzKHN0
cnVjdA0KPiA+IHZiMl9xdWV1ZSAqcSwgdTMyIG1lbW9yeSwNCj4gPiAgIAkJKmNhcHMgfD0gVjRM
Ml9CVUZfQ0FQX1NVUFBPUlRTX01NQVBfQ0FDSEVfSElOVFM7DQo+ID4gICAJaWYgKHEtPnN1cHBv
cnRzX3JlcXVlc3RzKQ0KPiA+ICAgCQkqY2FwcyB8PSBWNEwyX0JVRl9DQVBfU1VQUE9SVFNfUkVR
VUVTVFM7DQo+ID4gKwlpZiAocS0+YWxsb3dfcmVzdHJpY3RlZF9tZW0gJiYgcS0+aW9fbW9kZXMg
JiBWQjJfRE1BQlVGKQ0KPiA+ICsJCSpjYXBzIHw9IFY0TDJfQlVGX0NBUF9TVVBQT1JUU19SRVNU
UklDVEVEX01FTTsNCj4gPiAgIAlpZiAobWF4X251bV9idWZzKSB7DQo+ID4gICAJCSptYXhfbnVt
X2J1ZnMgPSBxLT5tYXhfbnVtX2J1ZmZlcnM7DQo+ID4gICAJCSpjYXBzIHw9IFY0TDJfQlVGX0NB
UF9TVVBQT1JUU19NQVhfTlVNX0JVRkZFUlM7DQo+IA0KPiANCg==
