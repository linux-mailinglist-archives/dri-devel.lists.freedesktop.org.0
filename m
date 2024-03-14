Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1CA87B7E1
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 07:24:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C59710F8DA;
	Thu, 14 Mar 2024 06:24:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="pdUsQski";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="MkbckHNO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D928B10F8DA
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 06:24:28 +0000 (UTC)
X-UUID: 7efec330e1cb11eeb8927bc1f75efef4-20240314
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=blryvQJG721pcST61l/0vP8cJj4E/Un38WAQaJXCPFw=; 
 b=pdUsQskiSCzV/Vwo7lrsDvd6xMc5GZYNW2Mphv2BBxB3cCHAlXRCri9ZvX+YmdZ5LNOXJXdCyy9XJ/OG5dDHoRb28Ea0RRaPLEurC3qaH6epcBfd8JbVfDNkutvtHGS2VGrv8CzqxS6YWyBxb6CAVImYIR2giZDM6nUAxJFENjs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:c3fb405b-5134-4325-b25f-cb6fcf9292d5, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6f543d0, CLOUDID:4d1bfd84-8d4f-477b-89d2-1e3bdbef96d1,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 7efec330e1cb11eeb8927bc1f75efef4-20240314
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1629596132; Thu, 14 Mar 2024 14:24:22 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 14 Mar 2024 14:24:20 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Thu, 14 Mar 2024 14:24:20 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tr/DgucZnY4ByWtrrIcQRneAioMqYlAXgleIZ0ZDcMd3FTe/JSvu+b+sPgGoNo+qe+JY1UPGDLLsVq/FGad/V/ruLBSdV+rLR0Fw3qzF2sm+WRVjil5I0L+13V6rhKIZZQPspTZ/j8aX14r0/oqkyVT4TOleGewaVWTY6PuyikexsIWg6W0/KYpfrn/XQUngRaVlvdYcPuE2mbz7kA1YBRmg8stsyVFKV/rsZKtbL9pDwYahgkxGkvSRel0LqxOz5DTxOtA5k2rvzGqMoQAA1hvICZ1M3jBcvbDno/euDjLY4zCpDhfwssuWgMzMSjjaraeR+ReFsy/H+XrnOhbHtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=56ecDTtMMQO9mE7hL9Y3HiT6J24jtLcRUKwrwvd5uyY=;
 b=INtsXh8Nzl8uyV+yak+QCvcbff9w6Wi8IE5o5CxUhY+YRVS2pzzPDqM76tgIHwZWkeocXgk3QhM8OXw21G6J/TEheuCIIvtVLw9L5sMQuOkUh1YgFWsHTJTHm+jTpNr2TInTp43By2SXCnJx42IT3PMwGmvRA9vjzPe4Y7knh945KXqtf4PzNA+iKFpDSQLXd+Z8Zr8t8Bf9aSO6zTLx+Qu6WwGzKRlRnseBkOwJinP/YEtThgWkKnSkzLWuKeqOZSOmHJjIPv0m+DJtKp0sBznUqVgdlo0X3MZH70rWTRxQG2p6VR+dWyF65vCbunOAyQfFPYh/viraAxk28+LRew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=56ecDTtMMQO9mE7hL9Y3HiT6J24jtLcRUKwrwvd5uyY=;
 b=MkbckHNOUdWQoq4eb7h0sCKkaTxo6wyNBLfpionxGwHCzyzpQf3weOy2BaWjrMK88BZ40Cxb+OYtgb1DsZF4OAQu8IHztFwtFmmPrcxftpkG8mp3kjwleb3+gYk+yZrBdQPFQhQyr3Rtn7qtCgrKYk9Zf9H4mMzY5dN9ZBBcBZI=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB8341.apcprd03.prod.outlook.com (2603:1096:405:24::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.19; Thu, 14 Mar
 2024 06:24:18 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::f3b6:91a7:e0fb:cb27]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::f3b6:91a7:e0fb:cb27%7]) with mapi id 15.20.7362.031; Thu, 14 Mar 2024
 06:24:18 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
CC: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>,
 "shawn.sung@mediatek.corp-partner.google.com"
 <shawn.sung@mediatek.corp-partner.google.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>
Subject: Re: [PATCH 05/11] drm/mediatek: Rename "mtk_drm_hdmi" to "mtk_hdmi"
Thread-Topic: [PATCH 05/11] drm/mediatek: Rename "mtk_drm_hdmi" to "mtk_hdmi"
Thread-Index: AQHaaJE8jx9DFrSmw0+/L1tbc6uq2bE231oA
Date: Thu, 14 Mar 2024 06:24:18 +0000
Message-ID: <f3976174c6e034d7498b0565dcbc88269fd74a2f.camel@mediatek.com>
References: <20240226085059.26850-1-shawn.sung@mediatek.com>
 <20240226085059.26850-6-shawn.sung@mediatek.com>
In-Reply-To: <20240226085059.26850-6-shawn.sung@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB8341:EE_
x-ms-office365-filtering-correlation-id: b6adc3e1-35f4-441b-fcd1-08dc43ef612f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Zw3ChJ3mXLR37qBGonUY4Ur32utb++EZhwE6n/0jHYIfhDwe8yk65hRMR8dpprlLvxp7QvOOsJTAyJJ10MRfDi/8r4aGnsvy/DKZMzQBYxAE+Gd3Fx8Z+HjlnkWySvgwNxw9ooGdTAvFmR438P7nHca/3+AYwjoBFy9YBUGvfGbWg2pa0HC4ypt+4U6EZhAuOqHAG3L01XZZg6wyaYl/Tx39NbyhDEOBkgr88VAjPuv0C2iPX36MFyhr0qZEKuDD30ixqZK9wqmfVMhcVV9XOI/zC9EBN5IbK9CN5bpJJ1VdCiriF5u5P1M/beJnqv5Ulq8qi/HJAbL/ODe2/eDB3quwV/aHrq8KqTxKZct+cbhJkuRno8T7vwSQtIvLmEQ6CRyIp8ZgkHaf9euHVK8lK5D0vry/4q4S2TVXLq9v4BcT2NRDONlbQVRuCMU0cusq1aGT5N56khPIJw8tl9yY53Q8xLg3O959lX7CVoGQczsPX4tqVpx8pBNvN5TUOsvSsuoLGb0pSItLlpq3keWt3GPSqn2nrjsBoFk+SqP3SHBa+AL83Qgym+2cdZv0DCdpjSk6JCU8MjWTDaWn7mqcGNfbtx1niJOdcUKLGR6rNHkDNwnbzPkXwGS8vffIWI696djV0M4j4kr3k6ByV82uDmCdGdCBHG/YHi5ahruiSvMgCRSSrpVCtoN+uBSiIWAinnJ2jt92ZqIAvQLV1EZ9Ow==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aGp5U2ZGYW9mdGFSNkc4bUtsWGhtVXEyQ2ZVamswSnAvdVdOU3RkS0svekJT?=
 =?utf-8?B?Q1NmWTdrSGtvNElkcjI5WE5VY2I3a0xtTy9zVFpCK0x5ME14dDQyOHQ2QW90?=
 =?utf-8?B?RzN2cllmWUsxYnd2RTJUZDRETklvdm5jYjFwbXRjdkJDeUM0dlRaQWRVazZX?=
 =?utf-8?B?ZnpaU0x4UEp6S3ovalZkNjZKeVNIbXlwMjRDd2pISEtWeTBzY25pR20zaWQy?=
 =?utf-8?B?a25la3lnQXpIWEU1NFVRd2c0YnpNb3lSN0pIVGdvMEtwbGg3a00rY21Xbmd4?=
 =?utf-8?B?WGV6bUMvUGVQaDZJR0V0Zmx2ZXBCR1Q3ckw4aXRkYTl1NlBYd3NLN3c4aXJ0?=
 =?utf-8?B?TXJHbFRZcmp6N1VoQUNTeE96bUxWZmJPZjhsVWF0NkpRVUF0ekpvT2Nzb1Rn?=
 =?utf-8?B?c0pEMFNlUU9NMWtCd29OWjFNbHFLU1JDaDc1R3lJbzd6cjA1dzF5ZGpiS2dp?=
 =?utf-8?B?ZHRHc09Nbm1PbE5QeW4veURxV2hFWWNTWFhhY3VZMTloUERmK21HZGVJZVU0?=
 =?utf-8?B?Slh2TkV0c0ZrUjlPcXNsK2hsWitBeXo5RDFPL1RmTGhEa0tBdGNORnlucElY?=
 =?utf-8?B?SWhMWFF1emNINDNFcVBRbC9PZHJGUDhKVTB0Q1RUT1ozTG5sU3FibXRSbURZ?=
 =?utf-8?B?c003QlVHbW1hT3lKN3ZxQnZtbHVJaCs2bnJzMFovcENxcW5kUzZaNHZDRWpJ?=
 =?utf-8?B?OU1OV3l4L0RjSEFDbzczOC85MFYrQnVZNDB0dVZrd3pncW84d2tPVysxYXlq?=
 =?utf-8?B?d1ByVWJFZUQ0ZG5LMHk4MS9ZSmV4ZGdtbkUxZnI3R3NVZ01KYytRL1ZsaUw0?=
 =?utf-8?B?eWZpay9zSnNQeHE1UTQvamttYldFaDBHNG8rM3hsb3JMdXg4ZmFJNE5vaERR?=
 =?utf-8?B?YjA4bnNheGZTWEdxOXNPSXRMT2F1R3c2TjVWQVhPYXNndDQ2Y1pBcGZ2bjla?=
 =?utf-8?B?WU91RVluRGI2UE5vc2FuRHpIZ2luL0MxODFkeWVHR2dTSVBWY3NXZDRoT0VS?=
 =?utf-8?B?TklwUTFNVFlHdFdGQ2M3ZDhoa2FSQjlZVlVoZjI5dUpaWUNBYU5NNG5SemJy?=
 =?utf-8?B?V01TYW03V3hNOE9VN2ZJbHNXbXdYSTh5TnBPRFBIbHltTFF5cUxvanN0ZnE0?=
 =?utf-8?B?clQyN3VzaTMzb0NWV3VzV1c2YStqRzNLdHV6eFJwTUkzT1RBSVExTklvdTlX?=
 =?utf-8?B?MVA0cUxpMC9uNjlmTE52ODZNZDE1Vmx4NTlQcXlNejd0Rmw5bjQ1dEFzTExE?=
 =?utf-8?B?RkVYZ1hyN1NmMElkZUFESFNyUlZMSWZERmFrUXZCSmJxV2QreE1pRTFUdGgw?=
 =?utf-8?B?ZU0rR3g1Q3BXT2c1dWhKakZkU2dJZEVURHdUelhZRCtETUFNZU1Vd3ZDb090?=
 =?utf-8?B?R21ZaGZlRzh2T2VrSlJuaWVYSnU2ZXNrdWt1cmtTdTR0ZHA5VVMxc0NzcEk0?=
 =?utf-8?B?NGdJRkMwN2kyS0lkYzduRTVPc1pDZFg1MGgyenZnbjE2azEzQitsTjlGUGRT?=
 =?utf-8?B?ajhtaG13dmRPUEp2ZjdreEJUQ2pRQ0U3M3l1eUV2SGRPNFNlVzA5QWZJa1Z1?=
 =?utf-8?B?U3NyTEg4VnNRVWtFSnhzVTdjdGMvRzBVY1h3eFRJS3FHWW9SWjBDRFlyVmw0?=
 =?utf-8?B?U0NqNjNkcnROcTFpamNnWUpjRVU3Yy9YQm40Vk5QZnFPWEpud21pRkp4ZjU0?=
 =?utf-8?B?bkt3TnU5TkQxM2dKeS9icCtqM1l2U1N4S3ZEZHJxTk5rNGhyOGwraEQraDA4?=
 =?utf-8?B?cFZ6SkZacTNHeE5vRlpCclpsM2RFSW9xMjdmd0NSQnlTVjd0cEF2ODlSNG9N?=
 =?utf-8?B?YnJtR0JNdUlkYmNQQTFVWFdCQnJ3bzhOblpWdHJIYW9TL3BFc0NoakJNSGV4?=
 =?utf-8?B?L2EvMC9FU3lVVE5MUy9ER3JQOTRRWU9sRHNQcUt2L0FvZVdublREYnhyS0pW?=
 =?utf-8?B?b0gwU1BQOC8wVzZDYUZxcGgyN1pxNUVyTEd2TlMzZnJDSjZwSzcva2k3TWFw?=
 =?utf-8?B?VzVtRlFXa3BaTmEwbUthaFBuZkVNeWZLQW5FWExTTDREN1RhV1hYdUpwa3VN?=
 =?utf-8?B?cm1jUmxzSnRjUG1aUUtnV2YvTUdhKzdXVXBBOXRCUnlKTDZNY00vVGMxb2lu?=
 =?utf-8?Q?yNziqe5KfBK3MePU2YFYP1rFD?=
Content-ID: <C99DBEE3BB5A9B41A72F035422DCA57A@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6adc3e1-35f4-441b-fcd1-08dc43ef612f
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2024 06:24:18.6266 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ldv3ujHDr6A+I1sYyFROV/2Q2u54zNOwBrdzjKVrwJw5U7XrNFkdHCoKJH8VaJaRmxipeOut9aMcdzA0CwfG+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8341
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--14.839800-8.000000
X-TMASE-MatchedRID: 9zTThWtzImv+DXQl7XSOUt7SWiiWSV/1jLOy13Cgb49qSjxROy+AU3a2
 v7MgC776yAUgFH8TZu6n86WFQ+HJup/1JE49xL3GDB+ErBr0bAPpJe7BSAYfSNiCsYPC4Ul2+Vi
 hXqn9xLHnYEGGAvPj/D0CGkQ7+PsOKc+6Aaw3enkSEYfcJF0pRaxwr8rYOW+O3BDlUOLc70GjxY
 yRBa/qJRVHsNBZf9aRAYt5KiTiutkLbigRnpKlKSPzRlrdFGDwWgYH/NwMk+woS00CDPFWEZE5+
 a+cIQmzAf3WYoL7bxKeBqpXlD9s+g==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--14.839800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: BD329B29C2DACD553DF55F78881D961BC7F6153B36F38BD291996569CE478A212000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_006_102781399.2043516170"
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

--__=_Part_Boundary_006_102781399.2043516170
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIFNoYXduOg0KDQpPbiBNb24sIDIwMjQtMDItMjYgYXQgMTY6NTAgKzA4MDAsIFNoYXduIFN1
bmcgd3JvdGU6DQo+IEZyb206IEhzaWFvIENoaWVuIFN1bmcgPHNoYXduLnN1bmdAbWVkaWF0ZWsu
Y29ycC1wYXJ0bmVyLmdvb2dsZS5jb20+DQo+IA0KPiBSZW5hbWUgYWxsICJtdGtfZHJtX2hkbWki
IHRvICJtdGtfaGRtaSI6DQo+IC0gVG8gYWxpZ24gdGhlIG5hbWluZyBydWxlDQo+IC0gVG8gcmVk
dWNlIHRoZSBjb2RlIHNpemUNCg0KUmV2aWV3ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5j
b20+DQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEhzaWFvIENoaWVuIFN1bmcgPA0KPiBzaGF3bi5z
dW5nQG1lZGlhdGVrLmNvcnAtcGFydG5lci5nb29nbGUuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jIHwgMTQgKysrKysrKy0tLS0tLS0NCj4gIDEgZmls
ZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMNCj4gYi9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYw0KPiBpbmRleCA4NjEzM2JmMTYzMjYuLmQyODc2ZGEx
YjQzYSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMN
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMNCj4gQEAgLTE2ODcs
NyArMTY4Nyw3IEBAIHN0YXRpYyBpbnQNCj4gbXRrX2hkbWlfcmVnaXN0ZXJfYXVkaW9fZHJpdmVy
KHN0cnVjdCBkZXZpY2UgKmRldikNCj4gIAlyZXR1cm4gMDsNCj4gIH0NCj4gIA0KPiAtc3RhdGlj
IGludCBtdGtfZHJtX2hkbWlfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4g
K3N0YXRpYyBpbnQgbXRrX2hkbWlfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikN
Cj4gIHsNCj4gIAlzdHJ1Y3QgbXRrX2hkbWkgKmhkbWk7DQo+ICAJc3RydWN0IGRldmljZSAqZGV2
ID0gJnBkZXYtPmRldjsNCj4gQEAgLTE3NDYsNyArMTc0Niw3IEBAIHN0YXRpYyBpbnQgbXRrX2Ry
bV9oZG1pX3Byb2JlKHN0cnVjdA0KPiBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICAJcmV0dXJu
IHJldDsNCj4gIH0NCj4gIA0KPiAtc3RhdGljIHZvaWQgbXRrX2RybV9oZG1pX3JlbW92ZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiArc3RhdGljIHZvaWQgbXRrX2hkbWlfcmVtb3Zl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICB7DQo+ICAJc3RydWN0IG10a19oZG1p
ICpoZG1pID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7DQo+ICANCj4gQEAgLTE3OTAsNyAr
MTc5MCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2hkbWlfY29uZg0KPiBtdGtfaGRtaV9j
b25mX210ODE2NyA9IHsNCj4gIAkuY2VhX21vZGVzX29ubHkgPSB0cnVlLA0KPiAgfTsNCj4gIA0K
PiAtc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgbXRrX2RybV9oZG1pX29mX2lkc1td
ID0gew0KPiArc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgbXRrX2hkbWlfb2ZfaWRz
W10gPSB7DQo+ICAJeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDI3MDEtaGRtaSIsDQo+ICAJ
ICAuZGF0YSA9ICZtdGtfaGRtaV9jb25mX210MjcwMSwNCj4gIAl9LA0KPiBAQCAtMTgwMSwxNCAr
MTgwMSwxNCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZA0KPiBtdGtfZHJtX2hk
bWlfb2ZfaWRzW10gPSB7DQo+ICAJfSwNCj4gIAl7fQ0KPiAgfTsNCj4gLU1PRFVMRV9ERVZJQ0Vf
VEFCTEUob2YsIG10a19kcm1faGRtaV9vZl9pZHMpOw0KPiArTU9EVUxFX0RFVklDRV9UQUJMRShv
ZiwgbXRrX2hkbWlfb2ZfaWRzKTsNCj4gIA0KPiAgc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2
ZXIgbXRrX2hkbWlfZHJpdmVyID0gew0KPiAtCS5wcm9iZSA9IG10a19kcm1faGRtaV9wcm9iZSwN
Cj4gLQkucmVtb3ZlX25ldyA9IG10a19kcm1faGRtaV9yZW1vdmUsDQo+ICsJLnByb2JlID0gbXRr
X2hkbWlfcHJvYmUsDQo+ICsJLnJlbW92ZV9uZXcgPSBtdGtfaGRtaV9yZW1vdmUsDQo+ICAJLmRy
aXZlciA9IHsNCj4gIAkJLm5hbWUgPSAibWVkaWF0ZWstZHJtLWhkbWkiLA0KPiAtCQkub2ZfbWF0
Y2hfdGFibGUgPSBtdGtfZHJtX2hkbWlfb2ZfaWRzLA0KPiArCQkub2ZfbWF0Y2hfdGFibGUgPSBt
dGtfaGRtaV9vZl9pZHMsDQo+ICAJCS5wbSA9ICZtdGtfaGRtaV9wbV9vcHMsDQo+ICAJfSwNCj4g
IH07DQo=

--__=_Part_Boundary_006_102781399.2043516170
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtTaGF3bjoNCg0KT24mIzMyO01vbiwmIzMy
OzIwMjQtMDItMjYmIzMyO2F0JiMzMjsxNjo1MCYjMzI7KzA4MDAsJiMzMjtTaGF3biYjMzI7U3Vu
ZyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjtGcm9tOiYjMzI7SHNpYW8mIzMyO0NoaWVuJiMzMjtTdW5n
JiMzMjsmbHQ7c2hhd24uc3VuZ0BtZWRpYXRlay5jb3JwLXBhcnRuZXIuZ29vZ2xlLmNvbSZndDsN
CiZndDsmIzMyOw0KJmd0OyYjMzI7UmVuYW1lJiMzMjthbGwmIzMyOyZxdW90O210a19kcm1faGRt
aSZxdW90OyYjMzI7dG8mIzMyOyZxdW90O210a19oZG1pJnF1b3Q7Og0KJmd0OyYjMzI7LSYjMzI7
VG8mIzMyO2FsaWduJiMzMjt0aGUmIzMyO25hbWluZyYjMzI7cnVsZQ0KJmd0OyYjMzI7LSYjMzI7
VG8mIzMyO3JlZHVjZSYjMzI7dGhlJiMzMjtjb2RlJiMzMjtzaXplDQoNClJldmlld2VkLWJ5OiYj
MzI7Q0smIzMyO0h1JiMzMjsmbHQ7Y2suaHVAbWVkaWF0ZWsuY29tJmd0Ow0KDQomZ3Q7JiMzMjsN
CiZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtIc2lhbyYjMzI7Q2hpZW4mIzMyO1N1bmcmIzMy
OyZsdDsNCiZndDsmIzMyO3NoYXduLnN1bmdAbWVkaWF0ZWsuY29ycC1wYXJ0bmVyLmdvb2dsZS5j
b20mZ3Q7DQomZ3Q7JiMzMjstLS0NCiZndDsmIzMyOyYjMzI7ZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19oZG1pLmMmIzMyO3wmIzMyOzE0JiMzMjsrKysrKysrLS0tLS0tLQ0KJmd0OyYjMzI7
JiMzMjsxJiMzMjtmaWxlJiMzMjtjaGFuZ2VkLCYjMzI7NyYjMzI7aW5zZXJ0aW9ucygrKSwmIzMy
OzcmIzMyO2RlbGV0aW9ucygtKQ0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtkaWZmJiMzMjstLWdpdCYj
MzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYw0KJmd0OyYjMzI7Yi9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYw0KJmd0OyYjMzI7aW5kZXgmIzMyOzg2MTMz
YmYxNjMyNi4uZDI4NzZkYTFiNDNhJiMzMjsxMDA2NDQNCiZndDsmIzMyOy0tLSYjMzI7YS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYw0KJmd0OyYjMzI7KysrJiMzMjtiL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jDQomZ3Q7JiMzMjtAQCYjMzI7LTE2ODcsNyYj
MzI7KzE2ODcsNyYjMzI7QEAmIzMyO3N0YXRpYyYjMzI7aW50DQomZ3Q7JiMzMjttdGtfaGRtaV9y
ZWdpc3Rlcl9hdWRpb19kcml2ZXIoc3RydWN0JiMzMjtkZXZpY2UmIzMyOypkZXYpDQomZ3Q7JiMz
MjsmIzMyO3JldHVybiYjMzI7MDsNCiZndDsmIzMyOyYjMzI7fQ0KJmd0OyYjMzI7JiMzMjsNCiZn
dDsmIzMyOy1zdGF0aWMmIzMyO2ludCYjMzI7bXRrX2RybV9oZG1pX3Byb2JlKHN0cnVjdCYjMzI7
cGxhdGZvcm1fZGV2aWNlJiMzMjsqcGRldikNCiZndDsmIzMyOytzdGF0aWMmIzMyO2ludCYjMzI7
bXRrX2hkbWlfcHJvYmUoc3RydWN0JiMzMjtwbGF0Zm9ybV9kZXZpY2UmIzMyOypwZGV2KQ0KJmd0
OyYjMzI7JiMzMjt7DQomZ3Q7JiMzMjsmIzMyO3N0cnVjdCYjMzI7bXRrX2hkbWkmIzMyOypoZG1p
Ow0KJmd0OyYjMzI7JiMzMjtzdHJ1Y3QmIzMyO2RldmljZSYjMzI7KmRldiYjMzI7PSYjMzI7JmFt
cDtwZGV2LSZndDtkZXY7DQomZ3Q7JiMzMjtAQCYjMzI7LTE3NDYsNyYjMzI7KzE3NDYsNyYjMzI7
QEAmIzMyO3N0YXRpYyYjMzI7aW50JiMzMjttdGtfZHJtX2hkbWlfcHJvYmUoc3RydWN0DQomZ3Q7
JiMzMjtwbGF0Zm9ybV9kZXZpY2UmIzMyOypwZGV2KQ0KJmd0OyYjMzI7JiMzMjtyZXR1cm4mIzMy
O3JldDsNCiZndDsmIzMyOyYjMzI7fQ0KJmd0OyYjMzI7JiMzMjsNCiZndDsmIzMyOy1zdGF0aWMm
IzMyO3ZvaWQmIzMyO210a19kcm1faGRtaV9yZW1vdmUoc3RydWN0JiMzMjtwbGF0Zm9ybV9kZXZp
Y2UmIzMyOypwZGV2KQ0KJmd0OyYjMzI7K3N0YXRpYyYjMzI7dm9pZCYjMzI7bXRrX2hkbWlfcmVt
b3ZlKHN0cnVjdCYjMzI7cGxhdGZvcm1fZGV2aWNlJiMzMjsqcGRldikNCiZndDsmIzMyOyYjMzI7
ew0KJmd0OyYjMzI7JiMzMjtzdHJ1Y3QmIzMyO210a19oZG1pJiMzMjsqaGRtaSYjMzI7PSYjMzI7
cGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7DQomZ3Q7JiMzMjsmIzMyOw0KJmd0OyYjMzI7QEAm
IzMyOy0xNzkwLDcmIzMyOysxNzkwLDcmIzMyO0BAJiMzMjtzdGF0aWMmIzMyO2NvbnN0JiMzMjtz
dHJ1Y3QmIzMyO210a19oZG1pX2NvbmYNCiZndDsmIzMyO210a19oZG1pX2NvbmZfbXQ4MTY3JiMz
Mjs9JiMzMjt7DQomZ3Q7JiMzMjsmIzMyOy5jZWFfbW9kZXNfb25seSYjMzI7PSYjMzI7dHJ1ZSwN
CiZndDsmIzMyOyYjMzI7fTsNCiZndDsmIzMyOyYjMzI7DQomZ3Q7JiMzMjstc3RhdGljJiMzMjtj
b25zdCYjMzI7c3RydWN0JiMzMjtvZl9kZXZpY2VfaWQmIzMyO210a19kcm1faGRtaV9vZl9pZHNb
XSYjMzI7PSYjMzI7ew0KJmd0OyYjMzI7K3N0YXRpYyYjMzI7Y29uc3QmIzMyO3N0cnVjdCYjMzI7
b2ZfZGV2aWNlX2lkJiMzMjttdGtfaGRtaV9vZl9pZHNbXSYjMzI7PSYjMzI7ew0KJmd0OyYjMzI7
JiMzMjt7JiMzMjsuY29tcGF0aWJsZSYjMzI7PSYjMzI7JnF1b3Q7bWVkaWF0ZWssbXQyNzAxLWhk
bWkmcXVvdDssDQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsuZGF0YSYjMzI7PSYjMzI7JmFtcDtt
dGtfaGRtaV9jb25mX210MjcwMSwNCiZndDsmIzMyOyYjMzI7fSwNCiZndDsmIzMyO0BAJiMzMjst
MTgwMSwxNCYjMzI7KzE4MDEsMTQmIzMyO0BAJiMzMjtzdGF0aWMmIzMyO2NvbnN0JiMzMjtzdHJ1
Y3QmIzMyO29mX2RldmljZV9pZA0KJmd0OyYjMzI7bXRrX2RybV9oZG1pX29mX2lkc1tdJiMzMjs9
JiMzMjt7DQomZ3Q7JiMzMjsmIzMyO30sDQomZ3Q7JiMzMjsmIzMyO3t9DQomZ3Q7JiMzMjsmIzMy
O307DQomZ3Q7JiMzMjstTU9EVUxFX0RFVklDRV9UQUJMRShvZiwmIzMyO210a19kcm1faGRtaV9v
Zl9pZHMpOw0KJmd0OyYjMzI7K01PRFVMRV9ERVZJQ0VfVEFCTEUob2YsJiMzMjttdGtfaGRtaV9v
Zl9pZHMpOw0KJmd0OyYjMzI7JiMzMjsNCiZndDsmIzMyOyYjMzI7c3RhdGljJiMzMjtzdHJ1Y3Qm
IzMyO3BsYXRmb3JtX2RyaXZlciYjMzI7bXRrX2hkbWlfZHJpdmVyJiMzMjs9JiMzMjt7DQomZ3Q7
JiMzMjstLnByb2JlJiMzMjs9JiMzMjttdGtfZHJtX2hkbWlfcHJvYmUsDQomZ3Q7JiMzMjstLnJl
bW92ZV9uZXcmIzMyOz0mIzMyO210a19kcm1faGRtaV9yZW1vdmUsDQomZ3Q7JiMzMjsrLnByb2Jl
JiMzMjs9JiMzMjttdGtfaGRtaV9wcm9iZSwNCiZndDsmIzMyOysucmVtb3ZlX25ldyYjMzI7PSYj
MzI7bXRrX2hkbWlfcmVtb3ZlLA0KJmd0OyYjMzI7JiMzMjsuZHJpdmVyJiMzMjs9JiMzMjt7DQom
Z3Q7JiMzMjsmIzMyOy5uYW1lJiMzMjs9JiMzMjsmcXVvdDttZWRpYXRlay1kcm0taGRtaSZxdW90
OywNCiZndDsmIzMyOy0ub2ZfbWF0Y2hfdGFibGUmIzMyOz0mIzMyO210a19kcm1faGRtaV9vZl9p
ZHMsDQomZ3Q7JiMzMjsrLm9mX21hdGNoX3RhYmxlJiMzMjs9JiMzMjttdGtfaGRtaV9vZl9pZHMs
DQomZ3Q7JiMzMjsmIzMyOy5wbSYjMzI7PSYjMzI7JmFtcDttdGtfaGRtaV9wbV9vcHMsDQomZ3Q7
JiMzMjsmIzMyO30sDQomZ3Q7JiMzMjsmIzMyO307DQoNCjwvcHJlPg0KPC9wPjwvYm9keT48L2h0
bWw+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVLIENv
bmZpZGVudGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioqKioqKioqKioNClRoZSBpbmZvcm1hdGlv
biBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSANCmF0dGFj
aG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwgb3Ig
b3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3cy4g
SXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJl
Y2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmlidXRpb24sIHByaW50
aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0cyAN
CmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBwcm9o
aWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQg
cmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlIA0KdGhhdCB5b3UgaGF2ZSByZWNl
aXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1t
ZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxs
IGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9t
IHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUt
bWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_006_102781399.2043516170--

