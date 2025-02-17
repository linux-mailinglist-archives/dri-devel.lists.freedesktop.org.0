Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09888A37DB0
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 10:01:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF31910E3C5;
	Mon, 17 Feb 2025 09:00:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="uundQ6nC";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="PQ+xVDuE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4CC310E3D9
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 09:00:55 +0000 (UTC)
X-UUID: ae2a39a2ed0d11ef8eb9c36241bbb6fb-20250217
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=EZxkO1PNKKNRBEHyqbR5tZ3OH6g0Eo7NZ0IFQ7uVPEQ=; 
 b=uundQ6nCmegsz6chCdUXt72/HstkrAxbYbBKfuCidG53SSlSd256u7/xyJAWvQkl3NcsU/f2ChKKZmrVYVH8EzeOzdTBgRNJ9AOkqnKlLF4CWAyMQuBCUnD3F8v+jswLwuAyZFvRXwyjV/rDCwVrfpf9dZ6MBhRecpOAR6lKey8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46, REQID:0230034f-0b13-4ebd-a2cb-49e8b749be80, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:60aa074, CLOUDID:53c678fc-7800-43c5-b97b-ddbe32561a5b,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
 EDM:-3,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
 A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: ae2a39a2ed0d11ef8eb9c36241bbb6fb-20250217
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 526045170; Mon, 17 Feb 2025 17:00:48 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 17 Feb 2025 17:00:47 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Mon, 17 Feb 2025 17:00:47 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I3wfH8h/4lC+SjxK8oEApE6taFE9XIOl9xIjaChbnIoNEypvi/ZV947XwXJxw/y9LSK3F4TUAVstoOfquPvZb3spW7kd1c3JpGFULP0EGRb8PAebfeyA8kWnfK65b90I7XDQK2KSvWJMic1M0zsPEUv7XG1pbFXATCBjnOphN7ZgPrAgpUWuSUBPN0MmXJaVSJBiB5vYOkNAPEYkFpNBdDtFwwegSfBjok+SHn38nB+SCleXXwikVPcjISP647BFlzlRyR/MZCYO8buCz+hqZKqIJQUwB6VjSFmIQMU9LUMcjf1nMwSFr+5PAN+3ZNEAWNH+s0uFLLfKIHBuKNBZlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C09b5p1ycqcO7kjXCUA+fbD7OUrDjmJEK9ULZeq5kF4=;
 b=heULAMRpzy+43IwNSjM3YcFU/Ubst3lUAm+49eMgoXrgMQn37pYUaFzzkUH+S+Kn3bWqB2sDiz6g1HQxYDvfdLiHlsy18MSLyO5Fhw+tDHP1Jm3Yx34qKRZ2iAqF4fvFcN2O1FeqvLb1e1wIrTgm29UCnKQpLqhuFtRy7UgxMJD46SbxSOU/EePMnAR8Ne5nEmjj4kj/dlFFjBFGHWCj44HEWWek58hKJ3QHlXuBwZI8CoGcztgXGNVpyDsF+cOJYQ3KNZImPT8UkuxnyO9oJJMOBeI8eNUHi6CW9sWDEpHfN6uzFM6R/VET3okjLWFxuUz/lttmclNinvCAOGnfbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C09b5p1ycqcO7kjXCUA+fbD7OUrDjmJEK9ULZeq5kF4=;
 b=PQ+xVDuEvA48BMne9C0QJ5koIAViirbYIRGSI0x7xHhZUStAFuy+rrXWPoOSAOdOoZy2Ssp2UBGoewg/4sz9TQehzUz2Tm7H9ibttRNxJ0lVRZunlEf3Jl18IR0LxDmkREx5t2BEszYNTP7TjHIefLCvFmMEYexk4QtB9wucjKs=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TY0PR03MB6905.apcprd03.prod.outlook.com (2603:1096:400:267::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.17; Mon, 17 Feb
 2025 09:00:44 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8445.013; Mon, 17 Feb 2025
 09:00:43 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: Julien Stephan <jstephan@baylibre.com>, "dan.carpenter@linaro.org"
 <dan.carpenter@linaro.org>
CC: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "mkorpershoek@baylibre.com" <mkorpershoek@baylibre.com>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH RESEND] drm/mediatek: dsi: fix error codes in
 mtk_dsi_host_transfer()
Thread-Topic: [PATCH RESEND] drm/mediatek: dsi: fix error codes in
 mtk_dsi_host_transfer()
Thread-Index: AQHbYbDQlGCNLzErmUSwwJssLHQ4qbNLcXeA
Date: Mon, 17 Feb 2025 09:00:43 +0000
Message-ID: <6d6bf950d7a2b611f215cb52e4aa3e6aa9c51282.camel@mediatek.com>
References: <b754a408-4f39-4e37-b52d-7706c132e27f@stanley.mountain>
In-Reply-To: <b754a408-4f39-4e37-b52d-7706c132e27f@stanley.mountain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TY0PR03MB6905:EE_
x-ms-office365-filtering-correlation-id: ee8ea816-8ac7-4dd8-1351-08dd4f318f6e
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?S1VZYVZ1d0JHR3dvZGVUNExvWUxwTXRwVk5kbkxZSm9YNVErMndxQWJzRXdU?=
 =?utf-8?B?SFhGMEpiMUFLM1lWV2g4dmV0dXE1aHFkcTBFZ1pnSW94NTRHc1RXODY5VlUw?=
 =?utf-8?B?VzZpNjVDc1NVSDQxU2ZCc1F0bEM0SCtJWGRYQVdHcGdDemdhV1hUVHQwUXdn?=
 =?utf-8?B?bG04S0lXcHkyOHVscWpUY1lZYmhXK0hMYzRyNW8vbUZEZlVicWdJSS9yRXdQ?=
 =?utf-8?B?cGdQRzR5b2tyUHprMXp4MVV1dUd3VU1CMUQzWkNHN3VLQkVhRzFnTnNvQU53?=
 =?utf-8?B?UDE2MllGbWFWbGFncnNyR1hScWRUdWdBSTR0QmxMRktKM1EwL3hpUUIrN21v?=
 =?utf-8?B?aHhwd2VNQzI0VUk4WFA2MUhURmRTVXJwRFp4REs2SkpoNWlHMnlSSXlQeXBo?=
 =?utf-8?B?ME9xRzJBeXNITm8vMlV3cnJVcnRVSVNhOVR2RXp4TVB6ZlVJU054N2prcWtw?=
 =?utf-8?B?ZmVjNWpqa244b3dGK2hKOW1kWkNlakhPdlhCYmhPYXM5ZUZ1QmZJWkh1NHFh?=
 =?utf-8?B?R2NUSWM5TFV1a01WVFJiSkFVV1RyWkYyQTludE1ySk5ESVZXTmkxZEpXZTUz?=
 =?utf-8?B?aEV3aS9vUDJ6L0RHd2hTYXI3U1VPNjRlZ05TRWNzdjJzZ0hEdVU4WWZqN1B6?=
 =?utf-8?B?dW1jRkV4TzArNjdXYkxvQjYvWmhpZEkrQkpIdVVQVG50ZkhBWkwrdXlRT3lu?=
 =?utf-8?B?QmRORlJkNHVyRS85bVlWdEpreUN0TlJOQXhFTlBGZytaTlA5elAveW5RVW90?=
 =?utf-8?B?NEplY0ZaVFFiZWdaeFNDdzNYQjc2QzVJZFdIZ3ZmSENaODhrQ3VDRi9vdUhP?=
 =?utf-8?B?cy9Qd3duY1lQSE1PYndCa1VqR2d1aC8vOEZEZWdhaDkrMldMQ2tGV0JNMkNQ?=
 =?utf-8?B?b3ZnU3IwUWNpWFNUaDJ2M0l6SDQ3MkIweXR0bGhJQklRNk1qOTAwUjRmYlBs?=
 =?utf-8?B?Z2lBNG9RSitvOUpJS0R4bmpBSkZUai9UTEs1REtFT3ZJakJOdHRFLytVc1Bt?=
 =?utf-8?B?TndnK1RZNDZIK0V1NEQ1bjU1aU9QYnZUbjJwaXgwU1pOaThuMCttdXRCNUx0?=
 =?utf-8?B?VDJ5M0tjb1NtK3ZIdjVEYkVkQ0pLZ0d2VE44MytsV2k1ajNRUmF1TEU1b0hh?=
 =?utf-8?B?REJYVDgvSSs5b0dnSDNkemFMbjNMN0k0Z1RuVXZ0SEZVRlkvWDh1WTdOcTRr?=
 =?utf-8?B?TTFwbVF6aGV3aW5ZbDYxR0p1ZjlhV1JjZ0VldTVoMjlrU0hxZERWMmZPQjVK?=
 =?utf-8?B?VVpxaWhDeTZhajhVUEhLcU1UYU9JR0JVRmRBZjVKbk9CbDVpc1JmMU1ITGha?=
 =?utf-8?B?bkNic0ZnNkdoazlCOGlsWnBIMGNMNUE3QTdBNW9SZm1kT2d4Z1ZxaU9WMStP?=
 =?utf-8?B?azZ2ZGo2dW1iNndWVEJBVlRJbVVLK2l3aWZvR0h5QTFMS3k1NnppV1BXSmFD?=
 =?utf-8?B?dVJQNGFkR3lCNzM1TS9FMkE2dkZ4MElDZ2RhU08rZTgraGRDNUFZdDM5N0l2?=
 =?utf-8?B?WFZ4RTMwRkR3REt5SGFFQUJveDkxc0xEWlVvWlVKNlhhaG5PTzhMODhPNk9h?=
 =?utf-8?B?c0R5Z05yeUQzRkY2VExBMVl0YzFjaDRzdlFpZDE1b012clpFWGt0dUFQRkJX?=
 =?utf-8?B?QjQyVmRVWmV2Z2o1d2EySkNiRjBOa3FrU1BId0dQeVRjM1VPSDJLaUlUbDJO?=
 =?utf-8?B?bGpVUDQzZkhabHVUK0R3eGFBb3hLS051SkRvaGZYWlJYSXU2TE5KRkRXRStD?=
 =?utf-8?B?ZzQwaDBSM2RHeFBnYjJXckpRMHhlVVJhM1NpTHVuVHVoOGpLV2Ird1ltMTV5?=
 =?utf-8?B?clQ5WjBFM0wyakp6MUdneldWZWc1M09KV3pQWC9CcXVRZ3VJVjRNQ0o3cXZM?=
 =?utf-8?B?cXcwK3ZGMUtjdFA0dGQ3TUd3dEVZRXI2Mit0dG5XSkYxL3c9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YUNqMlk0OHNZTDlQMVIrWjRSNXl2a1lJcERveHBZRHVSbVlUVVlUb09SSjNl?=
 =?utf-8?B?Vms0N3p5YzVrZnNJSkhETENybEdlcTBXYi9zemJRUHVBY0Jwa3hNSkZPSlc5?=
 =?utf-8?B?Sll0SnUrQWsrekdhUDVsaGNlVG5UbFRwTTlmN2lYYnhQck5WMmFtVjE5WDgv?=
 =?utf-8?B?U1JEK1pYWlphNzFkeVJOUDZXRStLVHFlKzdnVlJrUXJKdEpURmxwNG9NaVhL?=
 =?utf-8?B?dlZ6MDVNNkJ6M1VHYW92MFFyNmtyWnd6aTBPWXh4cGNYOVFlQTFJeUdhL0cy?=
 =?utf-8?B?Wkg2WURKUStqZ0Y1VGYrcWlHS2piV1JDZ0tuYjQ4WFlNNkI2Y0RNRXhab3Q1?=
 =?utf-8?B?RjFKSGtQOUQ1bWFTL1BIcFFUWk9zTmhYZ2p5dW1HNnF0T1Y0TVhvN0thNCts?=
 =?utf-8?B?bG95VHcwL29LRk9oc0lTTWFFVlhtSGh0Sm9SRU9VeksweitpbnFEZWlIeU0r?=
 =?utf-8?B?ZjB0UkU2c3VUTWZ3WGpRRTdGcTF1R0VhTk92S0hxOGxvRndqN0pkZXkrQmxk?=
 =?utf-8?B?V01tLytoemp5dis1ZnlLd2JkcndUQ2hGYXVyOVNpd011TkJsUERPTy9memlE?=
 =?utf-8?B?d21uMThFUitUN3lXZ2dZUDEzOS9SV2NkSVk0NG55YkVFZ3gzVEtMNlBpUlQy?=
 =?utf-8?B?TklUZkEzSXhhNGNadlZVb21OU0hCcHZtMDZuTnVNNzMxS3pYYWwrTUlJc0F6?=
 =?utf-8?B?NkhtRDdXMll4c1pwN1MvWHFZVEJkRFdiRnl1OFJBUXJzRGdwMExqNjRaYTI2?=
 =?utf-8?B?Q0FWS2phZU9NdWV5MkdVYm96ODlDMUdURmthYkR5bDB6MUZHSU5YT2R6ZkJp?=
 =?utf-8?B?UWZZV1J6Zzc3UDBZZXVQK2MrYlkvYTJEYnFmS3pxblI1SzMydFk2eEpwWmtv?=
 =?utf-8?B?b1lsMHkxc09ObE1HdFRxS2tsWlZSUU1zc1lSVmExTmlFS1MzOWk2b0JqNGlo?=
 =?utf-8?B?Q2xralA1WFl2cEkrZWNjTDRFcDF0SHFmY1B5Zm9YK25reGdlTHZtaUg1QnpJ?=
 =?utf-8?B?c25VYTMwb213azM5SjR2NVpnQ09EQmNGMzVQenpZS1FRcEsvcFpzR2djK2Fo?=
 =?utf-8?B?ejhCR3dxQTdXQnFteEs1czFodzJGTmx3WHFsWDJIU0hQenpUZnhkQlg3SnpY?=
 =?utf-8?B?eEc2WVpjdnhxbmIrYTJRNmZNM3A5eGo2cDMzM1VvRzM0UjMyWHVoUStkczdk?=
 =?utf-8?B?VGdLa2FwellJcTZYdlcyUlljNVVlemcxeVJJUVo4MFUvSmt3ZThGeDc1TUdB?=
 =?utf-8?B?UzdyWU12dWVFVVdzZ1JRSW93UXZVWmNweVEvUDJQcVB6Q1FZbk4xMEVnejJk?=
 =?utf-8?B?M1laUmsva2ZnVUlMWlBZWVBrN0pLOWNlWW9WbDZuRXZzSTg4c3EwK0xQWXlL?=
 =?utf-8?B?Wkh1bXdaODZYSkZ3b283aEJ4NFZkMkdpUVYrN2RBSFVlZ1VFZkNMOGhrcHlv?=
 =?utf-8?B?eER6aWFFUDBCUFg0NnoxNkxpd3JlRzBSU3p3MU9KQ1cxN2t1SGhnblJKNjVW?=
 =?utf-8?B?Y2E5a1QyQUhtc3A4MzlsUk9uVXg4cWhORTVyUHVQQXpyY04zM09qUUdUempl?=
 =?utf-8?B?WDZ0MjV4K01QcmFUamlyYTdLK2VKWWtRR3BDSzdiQW5qS0xZL3RwOWJRWHRs?=
 =?utf-8?B?SWMvL2xaMGZpeW1yMXo0UUxBN29rVyszV01JVU1Seno1YUd6ODRYSnZZNzIx?=
 =?utf-8?B?R3F4bnhjRnFrbStjc1NiM05YQXJDWkl0L0hGMGF2MC9WSTEyLy9kOWV2Mlpv?=
 =?utf-8?B?bmJHTnJmL0RxcnkxUVZMSG9ZT0lEWXJtbnRMVzRhR2RBMWFOcElVQld1SURI?=
 =?utf-8?B?QnlGckxVSC80TUVGdmJCaTIzKzhSbWsyQ3FoRXNrNXlyZDJKZGZ6ZmE5QUVj?=
 =?utf-8?B?R1YvN09sYkRFT056c3pPNXdUZzV3KzJGcElXa2c0NUVzbDdpU0RKZGR1aWFZ?=
 =?utf-8?B?bEd2MHZySFBvQVNNbW0yVnBTMDBEZnhuRnlSdHBYK3JsdERtUFcwUmNObmhI?=
 =?utf-8?B?bFRCckN1L3JLNG0waGhEZkd6WnRQOXJxTUE5enFRUjRuK3NRdThMOExwK3Jt?=
 =?utf-8?B?VFphVDdjVllEbWNGZmpHVDNsK1JqTHRmWEhQOWtiMWNIQktYbEhqdzFEakYy?=
 =?utf-8?Q?vFYiWtCnvEdOa1Z51t7yZZWzn?=
Content-ID: <E47A7B551957914BB483CA0A7BC704CE@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee8ea816-8ac7-4dd8-1351-08dd4f318f6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2025 09:00:43.4314 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sz3q2xKwVGFbe9YXJv0YChlFVr2IqvdStRX5hsqUhnmM6ojwh3X8WIDSfBPUWdUbM+y2eethuibbQlQbn2aQNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6905
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_008_1836096468.581250163"
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

--__=_Part_Boundary_008_1836096468.581250163
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDI1LTAxLTA4IGF0IDEyOjM1ICswMzAwLCBEYW4gQ2FycGVudGVyIHdyb3RlOg0K
PiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRh
Y2htZW50cyB1bnRpbCB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250ZW50
Lg0KPiANCj4gDQo+IFRoZXJlIGlzIGEgdHlwZSBidWcgYmVjYXVzZSB0aGUgcmV0dXJuIHN0YXRl
bWVudDoNCj4gDQo+ICAgICAgICAgcmV0dXJuIHJldCA8IDAgPyByZXQgOiByZWN2X2NudDsNCj4g
DQo+IFRoZSBpc3N1ZSBpcyB0aGF0IHJldCBpcyBhbiBpbnQsIHJlY3ZfY250IGlzIGEgdTMyIGFu
ZCB0aGUgZnVuY3Rpb24NCj4gcmV0dXJucyBzc2l6ZV90LCB3aGljaCBpcyBhIHNpZ25lZCBsb25n
LiAgVGhlIHdheSB0aGF0IHRoZSB0eXBlIHByb21vdGlvbg0KPiB3b3JrcyBpcyB0aGF0IHRoZSBu
ZWdhdGl2ZSBlcnJvciBjb2RlcyBhcmUgZmlyc3QgY2FzdCB0byB1MzIgYW5kIHRoZW4NCj4gdG8g
c2lnbmVkIGxvbmcuICBUaGUgZXJyb3IgY29kZXMgZW5kIHVwIGJlaW5nIHBvc2l0aXZlIGluc3Rl
YWQgb2YNCj4gbmVnYXRpdmUgYW5kIHRoZSBjYWxsZXJzIHRyZWF0IHRoZW0gYXMgc3VjY2Vzcy4N
Cg0KUmV2aWV3ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+DQoNCj4gDQo+IEZpeGVz
OiA4MWNjN2U1MWM0ZjEgKCJkcm0vbWVkaWF0ZWs6IEFsbG93IGNvbW1hbmRzIHRvIGJlIHNlbnQg
ZHVyaW5nIHZpZGVvIG1vZGUiKQ0KPiBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxr
cEBpbnRlbC5jb20+DQo+IENsb3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MTIy
MTA4MDEuaUFEdzBvSUgtbGtwQGludGVsLmNvbS8NCj4gU2lnbmVkLW9mZi1ieTogRGFuIENhcnBl
bnRlciA8ZGFuLmNhcnBlbnRlckBsaW5hcm8ub3JnPg0KPiBSZXZpZXdlZC1ieTogTWF0dGlqcyBL
b3JwZXJzaG9layA8bWtvcnBlcnNob2VrQGJheWxpYnJlLmNvbT4NCj4gUmV2aWV3ZWQtYnk6IEFu
Z2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxh
Ym9yYS5jb20+DQo+IC0tLQ0KPiBJIHNlbnQgdGhpcyBwYXRjaCBlYXJsaWVyOg0KPiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9hbGwvWSUyRnlCQzR5eFRzK1BvMFRHQGtpbGkvDQo+IGJ1dCBpdCB3
YXNuJ3QgYXBwbGllZC4gIEkndmUgY2hhbmdlZCB0aGUgY29tbWl0IG1lc3NhZ2UgYSBiaXQgYW5k
IGFkZGVkDQo+IG5ldyB0YWdzLg0KPiANCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHNpLmMgfCA2ICsrKy0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RzaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYw0KPiBpbmRleCBk
ODcxYjFkYmEwODMuLjBhY2ZkYTQ3ZjAwMiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kc2kuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RzaS5jDQo+IEBAIC0xMDE1LDEyICsxMDE1LDEyIEBAIHN0YXRpYyBzc2l6ZV90IG10a19kc2lf
aG9zdF90cmFuc2ZlcihzdHJ1Y3QgbWlwaV9kc2lfaG9zdCAqaG9zdCwNCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBtaXBpX2RzaV9tc2cgKm1zZykN
Cj4gIHsNCj4gICAgICAgICBzdHJ1Y3QgbXRrX2RzaSAqZHNpID0gaG9zdF90b19kc2koaG9zdCk7
DQo+IC0gICAgICAgdTMyIHJlY3ZfY250LCBpOw0KPiArICAgICAgIHNzaXplX3QgcmVjdl9jbnQ7
DQo+ICAgICAgICAgdTggcmVhZF9kYXRhWzE2XTsNCj4gICAgICAgICB2b2lkICpzcmNfYWRkcjsN
Cj4gICAgICAgICB1OCBpcnFfZmxhZyA9IENNRF9ET05FX0lOVF9GTEFHOw0KPiAgICAgICAgIHUz
MiBkc2lfbW9kZTsNCj4gLSAgICAgICBpbnQgcmV0Ow0KPiArICAgICAgIGludCByZXQsIGk7DQo+
IA0KPiAgICAgICAgIGRzaV9tb2RlID0gcmVhZGwoZHNpLT5yZWdzICsgRFNJX01PREVfQ1RSTCk7
DQo+ICAgICAgICAgaWYgKGRzaV9tb2RlICYgTU9ERSkgew0KPiBAQCAtMTA2OSw3ICsxMDY5LDcg
QEAgc3RhdGljIHNzaXplX3QgbXRrX2RzaV9ob3N0X3RyYW5zZmVyKHN0cnVjdCBtaXBpX2RzaV9o
b3N0ICpob3N0LA0KPiAgICAgICAgIGlmIChyZWN2X2NudCkNCj4gICAgICAgICAgICAgICAgIG1l
bWNweShtc2ctPnJ4X2J1Ziwgc3JjX2FkZHIsIHJlY3ZfY250KTsNCj4gDQo+IC0gICAgICAgRFJN
X0lORk8oImRzaSBnZXQgJWQgYnl0ZSBkYXRhIGZyb20gdGhlIHBhbmVsIGFkZHJlc3MoMHgleClc
biIsDQo+ICsgICAgICAgRFJNX0lORk8oImRzaSBnZXQgJXpkIGJ5dGUgZGF0YSBmcm9tIHRoZSBw
YW5lbCBhZGRyZXNzKDB4JXgpXG4iLA0KPiAgICAgICAgICAgICAgICAgIHJlY3ZfY250LCAqKCh1
OCAqKShtc2ctPnR4X2J1ZikpKTsNCj4gDQo+ICByZXN0b3JlX2RzaV9tb2RlOg0KPiAtLQ0KPiAy
LjQ1LjINCj4gDQo+IA0KDQo=

--__=_Part_Boundary_008_1836096468.581250163
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1dlZCwmIzMyOzIwMjUtMDEtMDgmIzMyO2F0
JiMzMjsxMjozNSYjMzI7KzAzMDAsJiMzMjtEYW4mIzMyO0NhcnBlbnRlciYjMzI7d3JvdGU6DQom
Z3Q7JiMzMjtFeHRlcm5hbCYjMzI7ZW1haWwmIzMyOzomIzMyO1BsZWFzZSYjMzI7ZG8mIzMyO25v
dCYjMzI7Y2xpY2smIzMyO2xpbmtzJiMzMjtvciYjMzI7b3BlbiYjMzI7YXR0YWNobWVudHMmIzMy
O3VudGlsJiMzMjt5b3UmIzMyO2hhdmUmIzMyO3ZlcmlmaWVkJiMzMjt0aGUmIzMyO3NlbmRlciYj
MzI7b3ImIzMyO3RoZSYjMzI7Y29udGVudC4NCiZndDsmIzMyOw0KJmd0OyYjMzI7DQomZ3Q7JiMz
MjtUaGVyZSYjMzI7aXMmIzMyO2EmIzMyO3R5cGUmIzMyO2J1ZyYjMzI7YmVjYXVzZSYjMzI7dGhl
JiMzMjtyZXR1cm4mIzMyO3N0YXRlbWVudDoNCiZndDsmIzMyOw0KJmd0OyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3JldHVybiYjMzI7cmV0JiMzMjsmbHQ7JiMz
MjswJiMzMjsmIzYzOyYjMzI7cmV0JiMzMjs6JiMzMjtyZWN2X2NudDsNCiZndDsmIzMyOw0KJmd0
OyYjMzI7VGhlJiMzMjtpc3N1ZSYjMzI7aXMmIzMyO3RoYXQmIzMyO3JldCYjMzI7aXMmIzMyO2Fu
JiMzMjtpbnQsJiMzMjtyZWN2X2NudCYjMzI7aXMmIzMyO2EmIzMyO3UzMiYjMzI7YW5kJiMzMjt0
aGUmIzMyO2Z1bmN0aW9uDQomZ3Q7JiMzMjtyZXR1cm5zJiMzMjtzc2l6ZV90LCYjMzI7d2hpY2gm
IzMyO2lzJiMzMjthJiMzMjtzaWduZWQmIzMyO2xvbmcuJiMzMjsmIzMyO1RoZSYjMzI7d2F5JiMz
Mjt0aGF0JiMzMjt0aGUmIzMyO3R5cGUmIzMyO3Byb21vdGlvbg0KJmd0OyYjMzI7d29ya3MmIzMy
O2lzJiMzMjt0aGF0JiMzMjt0aGUmIzMyO25lZ2F0aXZlJiMzMjtlcnJvciYjMzI7Y29kZXMmIzMy
O2FyZSYjMzI7Zmlyc3QmIzMyO2Nhc3QmIzMyO3RvJiMzMjt1MzImIzMyO2FuZCYjMzI7dGhlbg0K
Jmd0OyYjMzI7dG8mIzMyO3NpZ25lZCYjMzI7bG9uZy4mIzMyOyYjMzI7VGhlJiMzMjtlcnJvciYj
MzI7Y29kZXMmIzMyO2VuZCYjMzI7dXAmIzMyO2JlaW5nJiMzMjtwb3NpdGl2ZSYjMzI7aW5zdGVh
ZCYjMzI7b2YNCiZndDsmIzMyO25lZ2F0aXZlJiMzMjthbmQmIzMyO3RoZSYjMzI7Y2FsbGVycyYj
MzI7dHJlYXQmIzMyO3RoZW0mIzMyO2FzJiMzMjtzdWNjZXNzLg0KDQpSZXZpZXdlZC1ieTomIzMy
O0NLJiMzMjtIdSYjMzI7Jmx0O2NrLmh1QG1lZGlhdGVrLmNvbSZndDsNCg0KJmd0OyYjMzI7DQom
Z3Q7JiMzMjtGaXhlczomIzMyOzgxY2M3ZTUxYzRmMSYjMzI7KCZxdW90O2RybS9tZWRpYXRlazom
IzMyO0FsbG93JiMzMjtjb21tYW5kcyYjMzI7dG8mIzMyO2JlJiMzMjtzZW50JiMzMjtkdXJpbmcm
IzMyO3ZpZGVvJiMzMjttb2RlJnF1b3Q7KQ0KJmd0OyYjMzI7UmVwb3J0ZWQtYnk6JiMzMjtrZXJu
ZWwmIzMyO3Rlc3QmIzMyO3JvYm90JiMzMjsmbHQ7bGtwQGludGVsLmNvbSZndDsNCiZndDsmIzMy
O0Nsb3NlczomIzMyO2h0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDEyMjEwODAxLmlBRHcw
b0lILWxrcEBpbnRlbC5jb20vDQomZ3Q7JiMzMjtTaWduZWQtb2ZmLWJ5OiYjMzI7RGFuJiMzMjtD
YXJwZW50ZXImIzMyOyZsdDtkYW4uY2FycGVudGVyQGxpbmFyby5vcmcmZ3Q7DQomZ3Q7JiMzMjtS
ZXZpZXdlZC1ieTomIzMyO01hdHRpanMmIzMyO0tvcnBlcnNob2VrJiMzMjsmbHQ7bWtvcnBlcnNo
b2VrQGJheWxpYnJlLmNvbSZndDsNCiZndDsmIzMyO1Jldmlld2VkLWJ5OiYjMzI7QW5nZWxvR2lv
YWNjaGlubyYjMzI7RGVsJiMzMjtSZWdubyYjMzI7Jmx0O2FuZ2Vsb2dpb2FjY2hpbm8uZGVscmVn
bm9AY29sbGFib3JhLmNvbSZndDsNCiZndDsmIzMyOy0tLQ0KJmd0OyYjMzI7SSYjMzI7c2VudCYj
MzI7dGhpcyYjMzI7cGF0Y2gmIzMyO2VhcmxpZXI6DQomZ3Q7JiMzMjtodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9hbGwvWSUyRnlCQzR5eFRzK1BvMFRHQGtpbGkvDQomZ3Q7JiMzMjtidXQmIzMyO2l0
JiMzMjt3YXNuJiMzOTt0JiMzMjthcHBsaWVkLiYjMzI7JiMzMjtJJiMzOTt2ZSYjMzI7Y2hhbmdl
ZCYjMzI7dGhlJiMzMjtjb21taXQmIzMyO21lc3NhZ2UmIzMyO2EmIzMyO2JpdCYjMzI7YW5kJiMz
MjthZGRlZA0KJmd0OyYjMzI7bmV3JiMzMjt0YWdzLg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjsmIzMy
O2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMmIzMyO3wmIzMyOzYmIzMyOysrKy0t
LQ0KJmd0OyYjMzI7JiMzMjsxJiMzMjtmaWxlJiMzMjtjaGFuZ2VkLCYjMzI7MyYjMzI7aW5zZXJ0
aW9ucygrKSwmIzMyOzMmIzMyO2RlbGV0aW9ucygtKQ0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtkaWZm
JiMzMjstLWdpdCYjMzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jJiMzMjti
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMNCiZndDsmIzMyO2luZGV4JiMzMjtk
ODcxYjFkYmEwODMuLjBhY2ZkYTQ3ZjAwMiYjMzI7MTAwNjQ0DQomZ3Q7JiMzMjstLS0mIzMyO2Ev
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYw0KJmd0OyYjMzI7KysrJiMzMjtiL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMNCiZndDsmIzMyO0BAJiMzMjstMTAxNSwx
MiYjMzI7KzEwMTUsMTImIzMyO0BAJiMzMjtzdGF0aWMmIzMyO3NzaXplX3QmIzMyO210a19kc2lf
aG9zdF90cmFuc2ZlcihzdHJ1Y3QmIzMyO21pcGlfZHNpX2hvc3QmIzMyOypob3N0LA0KJmd0OyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjtjb25zdCYjMzI7c3RydWN0JiMzMjttaXBpX2RzaV9tc2cmIzMyOypt
c2cpDQomZ3Q7JiMzMjsmIzMyO3sNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjtzdHJ1Y3QmIzMyO210a19kc2kmIzMyOypkc2kmIzMyOz0mIzMyO2hvc3Rf
dG9fZHNpKGhvc3QpOw0KJmd0OyYjMzI7LSYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7dTMyJiMzMjtyZWN2X2NudCwmIzMyO2k7DQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjtzc2l6ZV90JiMzMjtyZWN2X2NudDsNCiZndDsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjt1OCYjMzI7cmVhZF9kYXRhWzE2XTsNCiZn
dDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjt2b2lkJiMzMjsq
c3JjX2FkZHI7DQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7dTgmIzMyO2lycV9mbGFnJiMzMjs9JiMzMjtDTURfRE9ORV9JTlRfRkxBRzsNCiZndDsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjt1MzImIzMyO2RzaV9tb2Rl
Ow0KJmd0OyYjMzI7LSYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7aW50JiMzMjty
ZXQ7DQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtpbnQmIzMy
O3JldCwmIzMyO2k7DQomZ3Q7JiMzMjsNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjtkc2lfbW9kZSYjMzI7PSYjMzI7cmVhZGwoZHNpLSZndDtyZWdzJiMz
MjsrJiMzMjtEU0lfTU9ERV9DVFJMKTsNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjtpZiYjMzI7KGRzaV9tb2RlJiMzMjsmYW1wOyYjMzI7TU9ERSkmIzMy
O3sNCiZndDsmIzMyO0BAJiMzMjstMTA2OSw3JiMzMjsrMTA2OSw3JiMzMjtAQCYjMzI7c3RhdGlj
JiMzMjtzc2l6ZV90JiMzMjttdGtfZHNpX2hvc3RfdHJhbnNmZXIoc3RydWN0JiMzMjttaXBpX2Rz
aV9ob3N0JiMzMjsqaG9zdCwNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjtpZiYjMzI7KHJlY3ZfY250KQ0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjttZW1jcHkobXNnLSZndDtyeF9idWYsJiMzMjtzcmNfYWRkciwmIzMyO3JlY3ZfY250KTsN
CiZndDsmIzMyOw0KJmd0OyYjMzI7LSYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
RFJNX0lORk8oJnF1b3Q7ZHNpJiMzMjtnZXQmIzMyOyVkJiMzMjtieXRlJiMzMjtkYXRhJiMzMjtm
cm9tJiMzMjt0aGUmIzMyO3BhbmVsJiMzMjthZGRyZXNzKDB4JXgpJiM5MjtuJnF1b3Q7LA0KJmd0
OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7RFJNX0lORk8oJnF1b3Q7
ZHNpJiMzMjtnZXQmIzMyOyV6ZCYjMzI7Ynl0ZSYjMzI7ZGF0YSYjMzI7ZnJvbSYjMzI7dGhlJiMz
MjtwYW5lbCYjMzI7YWRkcmVzcygweCV4KSYjOTI7biZxdW90OywNCiZndDsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjtyZWN2X2NudCwmIzMyOyooKHU4JiMzMjsqKShtc2ctJmd0O3R4
X2J1ZikpKTsNCiZndDsmIzMyOw0KJmd0OyYjMzI7JiMzMjtyZXN0b3JlX2RzaV9tb2RlOg0KJmd0
OyYjMzI7LS0NCiZndDsmIzMyOzIuNDUuMg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjsNCg0KDQo8L3By
ZT4NCjwvcD48L2JvZHk+PC9odG1sPjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxwcmU+KioqKioq
KioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlDQogKioqKioqKioqKioqKioq
KioqKioNClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAo
aW5jbHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmll
dGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVu
ZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5
IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwg
DQpkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUt
bWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVu
dChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91
IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZl
DQogDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ug
bm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1h
aWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwgKGluY2x1ZGlu
ZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QNCmRpc2Nsb3Nl
IHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24uIFRoYW5rIHlv
dSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_008_1836096468.581250163--

