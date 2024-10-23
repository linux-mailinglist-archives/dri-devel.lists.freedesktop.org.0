Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 264F29ABBDD
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 04:50:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C8BD10E710;
	Wed, 23 Oct 2024 02:50:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="bK9hfkfF";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="WF9ttm11";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F97F10E710
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 02:50:40 +0000 (UTC)
X-UUID: 927ed36490e911efbd192953cf12861f-20241023
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=6W6vskPDQP7+4ZWXIwICrAGKrNWEdp42VWUhrU/mw0w=; 
 b=bK9hfkfFhSuHGjF38tJcJCKvlFL88ivnm2AviohrzsEmDy5MHYs5AemN7o0mdgpWTWziM0znHGcDG7hKenyV2AUUNnMXorcmp4YG51olEQFG18A2lT1m08Kh83HAkjqgrFPdxmNYmTiZPkrEMfIhu63ojTT9re1m2hgzAbxVhnA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42, REQID:7041b5ff-011a-481c-9c46-edb62bd48653, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:b0fcdc3, CLOUDID:9730f62d-a7a0-4b06-8464-80be82133975,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
 l,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
 LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 927ed36490e911efbd192953cf12861f-20241023
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 145929689; Wed, 23 Oct 2024 10:50:33 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 23 Oct 2024 10:50:31 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 23 Oct 2024 10:50:31 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v0c5ValcHz6kZWJ0ZqjSnZZAYJhpu/EgPhR01ztVknQK1+0Ro5uTuWK0WhKj4lZeM5EguEzdLL8tMiD2i/ARtJJA+ACgTVJCYC7w7WIVIuk4bwl6HVn8Sc5CPXqLRePS51yzZSgk5iRuAL/l4OPkfFIiF6OtxaNTRVNUj/GUta0xmEQ0ypBrzB+gM18/mxuS/ZCfergGcgYCs4vnBIvSmTFNycOcT7yI+h01V+/hZwR/z/onGyPoQG04UoVw2u6+tUD+hJlTCrWp6VZ0VUxaz8FP+RcMaA2GiM6pY5eUMYfjmqaH8GdbDjsr9CoPzlvmLF9g5IvSt+zEtJeKLegLSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C0l4sQlwxW2Igmi8j+XjM+lPcqSno9gF14clJxQ80g8=;
 b=cy3gGPslcgMnXvMI7dAnNyc1B105Emcmrkk1xOB4nPqVh63fLQPEdTAHaEBOrMTi7QHZfOUQmuw4JFyYahJ/nLBUYxZstzCjTZGC6gqm9h2T8i4iwiFUuBHV+MnPytSjfL1kCVe1ztQmoPo0QGrv3aIn7+ecshVjYVnqd309BnvnSOmsL79PCU+vdLyQlydKfq3+qh9P9XdHhbHtkimaLo5st0Sxr8TwVJR7HVTMt42hGxxj1dhrQM8VJI8Yomi00j9aB+0J8Og2iaG3VBjNVQ8wCBAo34N64/mgFj4kmjExx0SUGe738GXwcLaUD1xFJXHbsPWRJmh1FeFoli38yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C0l4sQlwxW2Igmi8j+XjM+lPcqSno9gF14clJxQ80g8=;
 b=WF9ttm11zWSl4mjZQ3TU766E4j68j+/zTfzmH/33idT2MjjC7KnJlnBF7plZCAsHqzUaTOqN4MLaxOx51fXcvEp1o/h8OeaEuErTneIpvsNPRnaK/GGM+jyIzv5zpb5+cLVRcmiXSIhlfzcrMCGtaQQWvMbWQdlXiJKJGhdbpDQ=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB6595.apcprd03.prod.outlook.com (2603:1096:101:77::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17; Wed, 23 Oct
 2024 02:50:29 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8069.024; Wed, 23 Oct 2024
 02:50:29 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "javier.carrasco.cruz@gmail.com" <javier.carrasco.cruz@gmail.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, Alexandre Mergnat <amergnat@baylibre.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 2/2] drm/mediatek: Switch to
 for_each_child_of_node_scoped()
Thread-Topic: [PATCH 2/2] drm/mediatek: Switch to
 for_each_child_of_node_scoped()
Thread-Index: AQHbHBL5atdcAYWc3k6xq8+k/nopfbKTtHwA
Date: Wed, 23 Oct 2024 02:50:28 +0000
Message-ID: <9bf479c8faa0b26f89e479c970841c814eca06f5.camel@mediatek.com>
References: <20241011-mtk_drm_drv_memleak-v1-0-2b40c74c8d75@gmail.com>
 <20241011-mtk_drm_drv_memleak-v1-2-2b40c74c8d75@gmail.com>
In-Reply-To: <20241011-mtk_drm_drv_memleak-v1-2-2b40c74c8d75@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB6595:EE_
x-ms-office365-filtering-correlation-id: 7c6fb3f9-aea9-4cef-3878-08dcf30d7438
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?VWZCM2xjN1lCYlVsb2s1ZHZWNGVkam0wbjFvZVlrV2NuTU9oVEdpZGYyUDZ1?=
 =?utf-8?B?d21UY0MvbXZxNmU5eFpPbU8rUXZxNXQvRG0wa2VmSHBkelRuWWxmUHY5UUJ1?=
 =?utf-8?B?LzNnWkJGYTNsUE51eG1wRHFuWGQrVDBkWGhmeGJ1MzhSbGRFdlZGeDVkbjRH?=
 =?utf-8?B?K2JTdTJmQzNmMGVTMSt4L3lud3l6cDlsR3ZNVDJIM2pWTlZwTTlWR014WFVI?=
 =?utf-8?B?TDdNR2kyQlVnUk5leWxqd0h6dmlTbmhNcmFlTjQ1UXZFUnBNRGg1M1ZPUThm?=
 =?utf-8?B?cm02TU5CaHkycjV3Qi9TZEVBN0VuWDNobEdNWFdRZ1hSM2xqNWRWcjlwOHh1?=
 =?utf-8?B?alYyYmpqdHp5VGhjblMram81SlBEQkVBMHd0R0FjdnE1LzZrVjliTW1rbVRx?=
 =?utf-8?B?a0RmdEJBVk9CZzI4WjBIWVBQVi9MUktzVjlxNktOWFpqUldSZHZQWEg3d3dk?=
 =?utf-8?B?ZkJwTTJMNkQ2b0Jsbzl6SXJZbmIrTVRqVm8rUTlBcHFJMEJZWkNkakE1UzZq?=
 =?utf-8?B?akNlWWFOaVhuVnVISHhnQ0VlcjltSmVwL2xtNStnUk8yLzJYdUpZSm9ocERO?=
 =?utf-8?B?S2NqLzhSR2pTNnAxaUdsSkZNOWJUeGZySXB2UkJIYStncmVuZkVoTGJCOUlW?=
 =?utf-8?B?VUkzZnpQOE5RdnN1NGJ2YTNYOXBVejBmL2FybUZpV1NjSEZrYUVVQ1BVbFBY?=
 =?utf-8?B?MnZYc3YwcXFTZnF3QjNXQkJOZDZaeEpnQnpGdGhBMmdkdFBMRnc0N1Rld1l0?=
 =?utf-8?B?dFErSFhkaTVXdEtDdi9rMkhJVFJiL0psY3h1Rzl6RWM5VmZiN1Z3eFJGcG1F?=
 =?utf-8?B?clEwcTViOEpZWnp0VFFNZllpMTRwTjU5VGdGSWNSQXh6WCtsR1pHRFp5cyt1?=
 =?utf-8?B?NGhweFpkeWpCaGNXUURlaWZ3elRrdG5WUVNiMHFDaXRwOE0vZCtYZndMd3VN?=
 =?utf-8?B?TlE5QTE4Mm15aHA3Mk1QOGNQRzBWaVdHekh1UStNTWMzS1lnY2g2QzlDTnZt?=
 =?utf-8?B?ajdqUFhDV1VYbE5EZ0VOZ05vc0NYS0JTbms3U0xqUGdnRzFQazRZT01xYkJH?=
 =?utf-8?B?cW5oaGR2UkRQUlJocFlOVkwwQjNEcmw1RDFPcVdqV3FxOS9zY3FQZWFIa1hN?=
 =?utf-8?B?VnhpcGt6TFVabUdhdGU2b2YzZkd3emRsN3lkL3VBang2ZjU2bU4yTkxicE9a?=
 =?utf-8?B?ZU45enRickMwZzdGSGIzZ0VXdERVcVh1d3VBUXBSWWtyRnRFbVlLeEg5L3ZL?=
 =?utf-8?B?bDR4M0dLTXNQZS94ejVsa1FpR3Q4UmtSOGtKY3ZtRnAwTHd5ZHlHMDZJWHhm?=
 =?utf-8?B?b3p2c1h1aGlScTZZc0V1eEI4c1JxTVA2clh3R05waE5YSHlTcWxwRTlSOXVB?=
 =?utf-8?B?b0J0QWRqK1VMT2FVdjhuQkdlaEcyN1VpbXBaTEt1WDBRVktLdnAwVm5WS0l4?=
 =?utf-8?B?eDMzd1cvcDNHc0pON1Y4UDFJYllISEhLY0wzZnovSE93NS82eEtuQlRwbHhQ?=
 =?utf-8?B?YTEyNi9nTlZrcUZTdzRVbXFmZ0hpdjFnZ0pmdTJOK1c1L09sMEVCT2RVOXZj?=
 =?utf-8?B?TXFia1hDVllabXNsbCtJcGt0OWhoT2tvU2tjeWpHMWtTNGFYZTcwTEFuODBw?=
 =?utf-8?B?d2dsTkI1MXZkYnNmekg3OGcvc1dxUENPSjJha1ZhUGFSUlVXZU9RVHBORThO?=
 =?utf-8?B?Q1hwSWc1dEVNenNPV0VKd1BNSmQ2NU1vREhnQzhCdlRCT1A1bThxSUdzbVlk?=
 =?utf-8?B?bzdJMFJnVHI1MFArc1BkNG1ERlViemFVZUtpeXpHdG55aFoxWEtuMkpqR2J0?=
 =?utf-8?Q?FxkFtO8LW9ddK6LB684ybBJbRpHMooSFwDTfY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WW8vUTZRZjRhbVJuL3lWS2pYQVZ3MkFSa1Y2MDRSaC9SSlhIWDJ4U3BPS1Vu?=
 =?utf-8?B?VUZKWWppM2xlKyt4M2dpanVoaE9tOUd1NlVDMUVXTnVRYmc2a29uMTlRUkVD?=
 =?utf-8?B?dlFrY0dUN3luNitUNjRUK0M0RVdJOXYzQ2k0TGxSejRQcU1TckRPMU5vcDQz?=
 =?utf-8?B?TW9tUG5tTnZCZE9tb29uY3YvOWlnWXdTNHpiRGQ1ODE2enBrZndxOVBTb0hB?=
 =?utf-8?B?WC83WkVlUGNaY0NKRTIxamFPSG1adkkveEJ1QkpJSGNTcGwrVWNycG1jUU9s?=
 =?utf-8?B?TXAyclVWNE04U05OQ1Mvc3dtWlVBT3BQRTVUb3B2bWNOUkpXVGJiWERvTkZy?=
 =?utf-8?B?UGw0dVhyclZBcDBkMmNlYkg3SnV6aHR1dlc0Q2lMYTFlUXIzeVRqWFBiSmow?=
 =?utf-8?B?M0R5akcvZTA1QzQ2UmlnNDhZZncrcHUvYXVSK2h2Q3hFVzBWSndUMm03Q2ll?=
 =?utf-8?B?SWxObTljM0RzaTJ2RWVlWWl2emFDN1NnRGpGcFRTOTFaQzFtUFkzY1BGYkJz?=
 =?utf-8?B?Sjc4OEVuOVBPLzJoUkUySjFGZjVhN1NNbXlsbE9nS3JlUmJGWWZjbS9kR2Mz?=
 =?utf-8?B?OXZHSnRXYlN5L3VtdEVqdUNPNUlBZFpxRzU4NlRiaGdEb3FKU25OeWZNdVBV?=
 =?utf-8?B?MkRHRlBrUitCUEhXcmtidnI0SWt3RVM3WGF3N3JoNFV6MW9ZenFkTE9HaDR2?=
 =?utf-8?B?L3RVSDVSRERpWWloRStSOXFaYUd3ZU5XSkJxQjBHY0w3a1Z4RElUemU4aWt0?=
 =?utf-8?B?RVRoNnFSRnpVeG9KQ3pENGVzUU8zUi9SaVlLK2h4S1VWb3kzTE81UkYrT0VV?=
 =?utf-8?B?ZCtvWUthdUh0UFZBUnV1R2tDZXdWUWczRDRYbkhZSXhOM1R1dHp2aDZ4Z0Yr?=
 =?utf-8?B?SnJJc0QzR1Z1MDVUWjhOcmVFWGZpb3Y1aktsYXFHSXVhUERiSlFoUm9lMkJZ?=
 =?utf-8?B?TmNuQ1FBT0ppTWtITXJEZkIrWWZNeU12U1RNbTFqaUZTMmZQQlNaZWFwdEhG?=
 =?utf-8?B?UU9UdE0wdDlLWTJLQ1BCZC9LWWhRODFIZzRPSUJyMmp2dW1FR2FiL2p1OW1E?=
 =?utf-8?B?VlNrQXBTaHFpQXJudUxRaFVYcXNBaUZrcE00U3VRY3prbE8vMXQzOGV2Q1B1?=
 =?utf-8?B?cy9yN2k5N2ZFQlc5M243MGdqWDV4b3poWTJENnNKKzRwSmVqaHh1eHFwWC9U?=
 =?utf-8?B?SDNkWVk2Z3Nva2NiV21RVUpyQnY0RVovOGpoVWNacjRnUDMyeGFObWpuRlZ4?=
 =?utf-8?B?Mk13akYwV2MrTjZWVDFhVVlTeDZ3bFBQUmhnU0QrK1NsbUhOT2xFK2Q2ei9M?=
 =?utf-8?B?RUNrUTV1WFFqalA5U1g5Yllob0VUWkRCTzY4VEhkd1lSbVF2UzJsSi9lVFl5?=
 =?utf-8?B?anN4cUJRRGRyMW8xb3dqYXQ3cWs2K3BWTmVHdUp3aGttZm9LcFh1aDM1dzFO?=
 =?utf-8?B?b0V3RXRWM1luRFhGWmRPYW1jckJvUGphcHNoL1FuOUFWMThnVlg5N3QybWZU?=
 =?utf-8?B?bTFnQklNMGJ5MTlNS2xUMjlrMDRMejFMOVQyMGJDOEFsQ2FoeVpjR2o3NVRa?=
 =?utf-8?B?c2FhN3E5Ni9tVlVjUU9TT014QktnK0hoRVVpVWZVNGcxNmtxVk9mWHB1MXVu?=
 =?utf-8?B?eEVKeWJYQWZvdlhlKzd6OEoxckxvTHZnZWdvNnhTZmJzcFNqenlLekdZM1A5?=
 =?utf-8?B?T0pXbEtFOEl0ZkpDUDNCeDJySytIdkQybWtKaE5CWDBoOHFiV2NnZnNuc2Fm?=
 =?utf-8?B?cThBeW9mVEJIM1MxOGphUEUyMkNaUXB5L09EVmhKWmNDVkg3VTNaZVllZEZv?=
 =?utf-8?B?djJ2VWl3bE1KMmpNbFFBQW9MK05GTTNYYVZmODdaYU9VTDkwS1BicndhaHlQ?=
 =?utf-8?B?NWRmY3kyVkdOTWxzdVlmbE9ybldwUVJSSVJJTTIxUU44NGZZYzd3THd2RWtZ?=
 =?utf-8?B?cGtQdW4vWm1ZblBYS2RURDJ3c0tYcjNjTGp6bHBKQ2NzWDc3bW5DNzZnc3Q0?=
 =?utf-8?B?YmRpRlU4Uk5KNEhBQnNpWnI3Tk51Z0F6b3VIblRsWFlNQUdZMDdxY3RYUHhk?=
 =?utf-8?B?Z1BHVEduQ2krNndXU0FqNHhybmd2S3U3eXV6aWJjcWUvVWFFbmJMcFdwVWZS?=
 =?utf-8?B?RnhxQUJXOXg1cG1PL0tvT21UNGV5b1F3RFVLR3psZzVKZnAzRTdGTFYydG1U?=
 =?utf-8?B?N1E9PQ==?=
Content-ID: <471710B0CCDECE488E2CF3C030D8E41F@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c6fb3f9-aea9-4cef-3878-08dcf30d7438
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2024 02:50:28.9325 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bACzlXp7aO4Vsy4RwTQ6Tw8TgX3ml9QLvRP22oUP4FKoZDEF9t06LA4sWy2gX4NRYc3LuMpUIeSXFuYlGmE9Ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6595
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_001_1434842931.286799874"
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

--__=_Part_Boundary_001_1434842931.286799874
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEphdmllcjoNCg0KT24gRnJpLCAyMDI0LTEwLTExIGF0IDIxOjIxICswMjAwLCBKYXZpZXIg
Q2FycmFzY28gd3JvdGU6DQo+ICAJIA0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3Qg
Y2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bnRpbCB5b3UgaGF2ZSB2ZXJpZmllZCB0
aGUgc2VuZGVyIG9yIHRoZSBjb250ZW50Lg0KPiAgSW50cm9kdWNlIHRoZSBzY29wZWQgdmFyaWFu
dCBvZiB0aGUgbG9vcCB0byBhdXRvbWF0aWNhbGx5IHJlbGVhc2UgdGhlDQo+IGNoaWxkIG5vZGUg
d2hlbiBpdCBnb2VzIG91dCBvZiBzY29wZSwgd2hpY2ggaXMgbW9yZSByb2J1c3QgdGhhbiB0aGUN
Cj4gbm9uLXNjb3BlZCB2YXJpYW50LCBhbmQgYWNjb3VudHMgZm9yIG5ldyBlYXJseSBleGl0cyB0
aGF0IGNvdWxkIGJlIGFkZGVkDQo+IGluIHRoZSBmdXR1cmUuDQoNClJldmlld2VkLWJ5OiBDSyBI
dSA8Y2suaHVAbWVkaWF0ZWsuY29tPg0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKYXZpZXIgQ2Fy
cmFzY28gPGphdmllci5jYXJyYXNjby5jcnV6QGdtYWlsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYyB8IDcgKystLS0tLQ0KPiAgMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jDQo+IGluZGV4IDA4NzhkZjgzMjg1OS4uOWFiNjU2YjEw
YTQ5IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYu
Yw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYw0KPiBAQCAt
MzcyLDEyICszNzIsMTEgQEAgc3RhdGljIGJvb2wgbXRrX2RybV9nZXRfYWxsX2RybV9wcml2KHN0
cnVjdCBkZXZpY2UgKmRldikNCj4gIHN0cnVjdCBtdGtfZHJtX3ByaXZhdGUgKnRlbXBfZHJtX3By
aXY7DQo+ICBzdHJ1Y3QgZGV2aWNlX25vZGUgKnBoYW5kbGUgPSBkZXYtPnBhcmVudC0+b2Zfbm9k
ZTsNCj4gIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgKm9mX2lkOw0KPiAtc3RydWN0IGRldmlj
ZV9ub2RlICpub2RlOw0KPiAgc3RydWN0IGRldmljZSAqZHJtX2RldjsNCj4gIHVuc2lnbmVkIGlu
dCBjbnQgPSAwOw0KPiAgaW50IGksIGo7DQo+ICANCj4gLWZvcl9lYWNoX2NoaWxkX29mX25vZGUo
cGhhbmRsZS0+cGFyZW50LCBub2RlKSB7DQo+ICtmb3JfZWFjaF9jaGlsZF9vZl9ub2RlX3Njb3Bl
ZChwaGFuZGxlLT5wYXJlbnQsIG5vZGUpIHsNCj4gIHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXY7DQo+ICANCj4gIG9mX2lkID0gb2ZfbWF0Y2hfbm9kZShtdGtfZHJtX29mX2lkcywgbm9kZSk7
DQo+IEBAIC00MDYsMTAgKzQwNSw4IEBAIHN0YXRpYyBib29sIG10a19kcm1fZ2V0X2FsbF9kcm1f
cHJpdihzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ICBpZiAodGVtcF9kcm1fcHJpdi0+bXRrX2RybV9i
b3VuZCkNCj4gIGNudCsrOw0KPiAgDQo+IC1pZiAoY250ID09IE1BWF9DUlRDKSB7DQo+IC1vZl9u
b2RlX3B1dChub2RlKTsNCj4gK2lmIChjbnQgPT0gTUFYX0NSVEMpDQo+ICBicmVhazsNCj4gLX0N
Cj4gIH0NCj4gIA0KPiAgaWYgKGRybV9wcml2LT5kYXRhLT5tbXN5c19kZXZfbnVtID09IGNudCkg
ew0KPiANCj4gLS0gDQo+IDIuNDMuMA0KPiANCg==

--__=_Part_Boundary_001_1434842931.286799874
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtKYXZpZXI6DQoNCk9uJiMzMjtGcmksJiMz
MjsyMDI0LTEwLTExJiMzMjthdCYjMzI7MjE6MjEmIzMyOyswMjAwLCYjMzI7SmF2aWVyJiMzMjtD
YXJyYXNjbyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjsmIzMyOyYjMzI7DQomZ3Q7JiMzMjtFeHRlcm5h
bCYjMzI7ZW1haWwmIzMyOzomIzMyO1BsZWFzZSYjMzI7ZG8mIzMyO25vdCYjMzI7Y2xpY2smIzMy
O2xpbmtzJiMzMjtvciYjMzI7b3BlbiYjMzI7YXR0YWNobWVudHMmIzMyO3VudGlsJiMzMjt5b3Um
IzMyO2hhdmUmIzMyO3ZlcmlmaWVkJiMzMjt0aGUmIzMyO3NlbmRlciYjMzI7b3ImIzMyO3RoZSYj
MzI7Y29udGVudC4NCiZndDsmIzMyOyYjMzI7SW50cm9kdWNlJiMzMjt0aGUmIzMyO3Njb3BlZCYj
MzI7dmFyaWFudCYjMzI7b2YmIzMyO3RoZSYjMzI7bG9vcCYjMzI7dG8mIzMyO2F1dG9tYXRpY2Fs
bHkmIzMyO3JlbGVhc2UmIzMyO3RoZQ0KJmd0OyYjMzI7Y2hpbGQmIzMyO25vZGUmIzMyO3doZW4m
IzMyO2l0JiMzMjtnb2VzJiMzMjtvdXQmIzMyO29mJiMzMjtzY29wZSwmIzMyO3doaWNoJiMzMjtp
cyYjMzI7bW9yZSYjMzI7cm9idXN0JiMzMjt0aGFuJiMzMjt0aGUNCiZndDsmIzMyO25vbi1zY29w
ZWQmIzMyO3ZhcmlhbnQsJiMzMjthbmQmIzMyO2FjY291bnRzJiMzMjtmb3ImIzMyO25ldyYjMzI7
ZWFybHkmIzMyO2V4aXRzJiMzMjt0aGF0JiMzMjtjb3VsZCYjMzI7YmUmIzMyO2FkZGVkDQomZ3Q7
JiMzMjtpbiYjMzI7dGhlJiMzMjtmdXR1cmUuDQoNClJldmlld2VkLWJ5OiYjMzI7Q0smIzMyO0h1
JiMzMjsmbHQ7Y2suaHVAbWVkaWF0ZWsuY29tJmd0Ow0KDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1Np
Z25lZC1vZmYtYnk6JiMzMjtKYXZpZXImIzMyO0NhcnJhc2NvJiMzMjsmbHQ7amF2aWVyLmNhcnJh
c2NvLmNydXpAZ21haWwuY29tJmd0Ow0KJmd0OyYjMzI7LS0tDQomZ3Q7JiMzMjsmIzMyO2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jJiMzMjt8JiMzMjs3JiMzMjsrKy0tLS0t
DQomZ3Q7JiMzMjsmIzMyOzEmIzMyO2ZpbGUmIzMyO2NoYW5nZWQsJiMzMjsyJiMzMjtpbnNlcnRp
b25zKCspLCYjMzI7NSYjMzI7ZGVsZXRpb25zKC0pDQomZ3Q7JiMzMjsNCiZndDsmIzMyO2RpZmYm
IzMyOy0tZ2l0JiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jJiMz
MjtiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jDQomZ3Q7JiMzMjtpbmRl
eCYjMzI7MDg3OGRmODMyODU5Li45YWI2NTZiMTBhNDkmIzMyOzEwMDY0NA0KJmd0OyYjMzI7LS0t
JiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jDQomZ3Q7JiMzMjsr
KysmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMNCiZndDsmIzMy
O0BAJiMzMjstMzcyLDEyJiMzMjsrMzcyLDExJiMzMjtAQCYjMzI7c3RhdGljJiMzMjtib29sJiMz
MjttdGtfZHJtX2dldF9hbGxfZHJtX3ByaXYoc3RydWN0JiMzMjtkZXZpY2UmIzMyOypkZXYpDQom
Z3Q7JiMzMjsmIzMyO3N0cnVjdCYjMzI7bXRrX2RybV9wcml2YXRlJiMzMjsqdGVtcF9kcm1fcHJp
djsNCiZndDsmIzMyOyYjMzI7c3RydWN0JiMzMjtkZXZpY2Vfbm9kZSYjMzI7KnBoYW5kbGUmIzMy
Oz0mIzMyO2Rldi0mZ3Q7cGFyZW50LSZndDtvZl9ub2RlOw0KJmd0OyYjMzI7JiMzMjtjb25zdCYj
MzI7c3RydWN0JiMzMjtvZl9kZXZpY2VfaWQmIzMyOypvZl9pZDsNCiZndDsmIzMyOy1zdHJ1Y3Qm
IzMyO2RldmljZV9ub2RlJiMzMjsqbm9kZTsNCiZndDsmIzMyOyYjMzI7c3RydWN0JiMzMjtkZXZp
Y2UmIzMyOypkcm1fZGV2Ow0KJmd0OyYjMzI7JiMzMjt1bnNpZ25lZCYjMzI7aW50JiMzMjtjbnQm
IzMyOz0mIzMyOzA7DQomZ3Q7JiMzMjsmIzMyO2ludCYjMzI7aSwmIzMyO2o7DQomZ3Q7JiMzMjsm
IzMyOw0KJmd0OyYjMzI7LWZvcl9lYWNoX2NoaWxkX29mX25vZGUocGhhbmRsZS0mZ3Q7cGFyZW50
LCYjMzI7bm9kZSkmIzMyO3sNCiZndDsmIzMyOytmb3JfZWFjaF9jaGlsZF9vZl9ub2RlX3Njb3Bl
ZChwaGFuZGxlLSZndDtwYXJlbnQsJiMzMjtub2RlKSYjMzI7ew0KJmd0OyYjMzI7JiMzMjtzdHJ1
Y3QmIzMyO3BsYXRmb3JtX2RldmljZSYjMzI7KnBkZXY7DQomZ3Q7JiMzMjsmIzMyOw0KJmd0OyYj
MzI7JiMzMjtvZl9pZCYjMzI7PSYjMzI7b2ZfbWF0Y2hfbm9kZShtdGtfZHJtX29mX2lkcywmIzMy
O25vZGUpOw0KJmd0OyYjMzI7QEAmIzMyOy00MDYsMTAmIzMyOys0MDUsOCYjMzI7QEAmIzMyO3N0
YXRpYyYjMzI7Ym9vbCYjMzI7bXRrX2RybV9nZXRfYWxsX2RybV9wcml2KHN0cnVjdCYjMzI7ZGV2
aWNlJiMzMjsqZGV2KQ0KJmd0OyYjMzI7JiMzMjtpZiYjMzI7KHRlbXBfZHJtX3ByaXYtJmd0O210
a19kcm1fYm91bmQpDQomZ3Q7JiMzMjsmIzMyO2NudCsrOw0KJmd0OyYjMzI7JiMzMjsNCiZndDsm
IzMyOy1pZiYjMzI7KGNudCYjMzI7PT0mIzMyO01BWF9DUlRDKSYjMzI7ew0KJmd0OyYjMzI7LW9m
X25vZGVfcHV0KG5vZGUpOw0KJmd0OyYjMzI7K2lmJiMzMjsoY250JiMzMjs9PSYjMzI7TUFYX0NS
VEMpDQomZ3Q7JiMzMjsmIzMyO2JyZWFrOw0KJmd0OyYjMzI7LX0NCiZndDsmIzMyOyYjMzI7fQ0K
Jmd0OyYjMzI7JiMzMjsNCiZndDsmIzMyOyYjMzI7aWYmIzMyOyhkcm1fcHJpdi0mZ3Q7ZGF0YS0m
Z3Q7bW1zeXNfZGV2X251bSYjMzI7PT0mIzMyO2NudCkmIzMyO3sNCiZndDsmIzMyOw0KJmd0OyYj
MzI7LS0mIzMyOw0KJmd0OyYjMzI7Mi40My4wDQomZ3Q7JiMzMjsNCg0KPC9wcmU+DQo8L3A+PC9i
b2R5PjwvaHRtbD48IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioqKioqKiogTUVE
SUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZSAqKioqKioqKioqKioqKioqKioqKg0KVGhlIGlu
Zm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55
IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxl
Z2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJs
ZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2ln
bmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlv
biwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRp
bmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmlj
dGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBp
bnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUgDQp0aGF0IHlvdSBo
YXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5k
ZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUgYW55
IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwgKGluY2x1ZGluZyBhbnkgYXR0YWNobWVu
dHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50IG9m
IHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24uIFRoYW5rIHlvdSENCjwvcHJlPjwhLS19
LS0+

--__=_Part_Boundary_001_1434842931.286799874--

