Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F87490A61F
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 08:53:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4AA810E1D6;
	Mon, 17 Jun 2024 06:53:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="jghTbNey";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="RX4rDvSj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE65310E1D6
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 06:53:14 +0000 (UTC)
X-UUID: 4358ceca2c7611efa54bbfbb386b949c-20240617
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=x8CteyC2LY78mph4t+PG4oQc0C/jofnpHvTIgCt5cb4=; 
 b=jghTbNey+JXU9iCQDRpmgMNk0i3uxWm0/xDCiGcvELLqPWNtaCVVLyHMsCU/gMs4ts3NkejRX/xJmJiPket08dnbd2HpIs2mr45dKfeaSB5hKRLdTbjAnsO9BDqGeQKGYU6xeC/bHsb0LmCskxzibH5Ds8GxfE2c+AEVJCeROqI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39, REQID:ad586716-7f6d-4c2d-9175-4b57fb91a33c, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:393d96e, CLOUDID:aa0faa44-4544-4d06-b2b2-d7e12813c598,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 4358ceca2c7611efa54bbfbb386b949c-20240617
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1032889422; Mon, 17 Jun 2024 14:53:11 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sun, 16 Jun 2024 23:53:11 -0700
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Mon, 17 Jun 2024 14:53:11 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TgXehTmcQXDppmbxBWVpbPWGxnNPFgL+okATcN8aoEsE2jhIvM3AQtIJrQvMVtWHPyiVXRvrbAxvEgBdtdh7GwHH0PT4qe+CRuORklh5Kz4P+qSIHx9yCClNvCj4l5ZWfi1q+PjyIZyp8rTuIoIsVSI9rYP7KMG/Z3xe9mD3HZNjZRO/RUgg3E9xi/nG8slBhk/Cw/2n6og07J8IPCnVfA8k4iDDbMZUMr0G2iLVIA1/G7FDS4obLKloMWBQkZEereJiu5mqN2R471682/LmRbOHBz48ooyjB5AJGk2wOft6MCiWvVxu/dxQz9uALCLUd5YWEllU6V5XrqKXoRE32g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x8CteyC2LY78mph4t+PG4oQc0C/jofnpHvTIgCt5cb4=;
 b=eUmi7vyLXMfleenfCvxQV4vL3Q90317XefZ/ZGJqqUeLi5oDXkxIdNrquLorr04wMH7Lg598pGncfZHtvBz1c8VE1qkueGmidECBD403AGOMi2lGDHWRTiplKOwgra87N2zA41Rp7EhVauWoX4pkuhDTCYYNrJogR7lx9zY0flQtByRpfKsG5zj/EmFMVeU17Gs1BhJv6CX01ZvBG9hm4NMtKsUUCoVL1GFEFySDjYUpesbWylLnHTh9YvC6jYilq9ibvkcQTGCPxyINR2RWTJi8FCcO54mDQqZ5Fo093GKK/Zet9kvQZg3MsK47idl/tTMp4IQW2d0eQ7UlCpjyKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x8CteyC2LY78mph4t+PG4oQc0C/jofnpHvTIgCt5cb4=;
 b=RX4rDvSjrb+zw/VlozxhEnT0fo9sCb1mIu4Q9pzONNCXO4Z6NKzCsPd9BNN17qIv9w1azvKR/CFwNTd8j1cwtLXV79/T6grDxiZWbH7AZJemOu5YJb+nPT4tXnmRNkyS7VQ3q7bogjSBZa4LiGzU7ZGCL1DMY2a3cTllN4EbG34=
Received: from SI2PR03MB5885.apcprd03.prod.outlook.com (2603:1096:4:142::7) by
 TYSPR03MB8719.apcprd03.prod.outlook.com (2603:1096:405:8f::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.30; Mon, 17 Jun 2024 06:53:08 +0000
Received: from SI2PR03MB5885.apcprd03.prod.outlook.com
 ([fe80::683a:246a:d31f:1c0]) by SI2PR03MB5885.apcprd03.prod.outlook.com
 ([fe80::683a:246a:d31f:1c0%5]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 06:53:07 +0000
From: =?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>
To: "tfiga@chromium.org" <tfiga@chromium.org>,
 =?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>
CC: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "frkoenig@chromium.org" <frkoenig@chromium.org>, "stevecho@chromium.org"
 <stevecho@chromium.org>, "wenst@chromium.org" <wenst@chromium.org>,
 "nhebert@chromium.org" <nhebert@chromium.org>, "christian.koenig@amd.com"
 <christian.koenig@amd.com>, "jstultz@google.com" <jstultz@google.com>,
 "nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>, "m.szyprowski@samsung.com"
 <m.szyprowski@samsung.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "jkardatzke@google.com" <jkardatzke@google.com>, "Brian.Starkey@arm.com"
 <Brian.Starkey@arm.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "sebastian.fricke@collabora.com"
 <sebastian.fricke@collabora.com>, "benjamin.gaignard@collabora.com"
 <benjamin.gaignard@collabora.com>, "tjmercier@google.com"
 <tjmercier@google.com>, "hverkuil-cisco@xs4all.nl"
 <hverkuil-cisco@xs4all.nl>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "hsinyi@chromium.org" <hsinyi@chromium.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "nfraprado@collabora.com"
 <nfraprado@collabora.com>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: [PATCH v6,12/24] media: mediatek: vcodec: add interface to
 allocate/free secure memory
Thread-Topic: [PATCH v6,12/24] media: mediatek: vcodec: add interface to
 allocate/free secure memory
Thread-Index: AQHap4uop8FE3IlRwUe2u2Cz6N4cnLHDwf8AgAf07YA=
Date: Mon, 17 Jun 2024 06:53:07 +0000
Message-ID: <20fec212d49cc3f0479be7a855d9816f5739ce93.camel@mediatek.com>
References: <20240516122102.16379-1-yunfei.dong@mediatek.com>
 <20240516122102.16379-13-yunfei.dong@mediatek.com>
 <4a5tf2cl744xzqslox4ddzmdpuvwksr54g3qk2jl4soatdts45@e6xmmm2ijmv6>
In-Reply-To: <4a5tf2cl744xzqslox4ddzmdpuvwksr54g3qk2jl4soatdts45@e6xmmm2ijmv6>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB5885:EE_|TYSPR03MB8719:EE_
x-ms-office365-filtering-correlation-id: a7371101-b232-4832-6ff6-08dc8e9a252c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230037|366013|376011|7416011|1800799021|38070700015; 
x-microsoft-antispam-message-info: =?utf-8?B?dEh5azZqc1dwQXFSbWlFdlVUbFczVmR2K1NpSmE2YTJrQjliVmpzeUpESURQ?=
 =?utf-8?B?Ri9ESm45cCt1Uk9DaTQ1Y0tBMngwb1ExQ1Z1UTJtc3AzYi9kdzdhUXd3ZUJa?=
 =?utf-8?B?dVMwbGRGNU5HYUQ4dmVqZnVXcGFycC9qNlIzRmdNTmtMUjhVTnJMOGp2SWR5?=
 =?utf-8?B?VjZxS1E5ZDVoYWZiUXBxVjZ2Q29idm9MVTV3UmNiUEN0Q2VjczUyOTRCRkIz?=
 =?utf-8?B?NTREdTRuZDBTSCt3R2piOW9BVndQckZ1WTAxL1B3VjE3OUVvNDRaWmx6SGF1?=
 =?utf-8?B?bDh1UWdqbGcyNDJyYWFOajU5MUQ2OGJORVcxQ1c1UmFKSElCWGUveVAwQVFG?=
 =?utf-8?B?a1VSN1lsYW1HTEpOc3NwTWx6dGJpWi9JbnpyWVhQMlE0bnE5ckpuK0dRRmIv?=
 =?utf-8?B?ZEdHL28xVzJKbk03QjBibG10L3E3dzVFamo1TUN6cWptc2w5T3V5QlJsV0U3?=
 =?utf-8?B?V09tQWd6Z2FXaFg3czFlRjFWVmxwdXlZSWhhaitDT0l4enJYdXNoVHBzNXVO?=
 =?utf-8?B?Vm9QVWN3N2JEc0VmYzRaeThiN2FQbnJDUmRjeXpqbUtjeTRXZHVDOFN0Tyto?=
 =?utf-8?B?YnkzcUZDOWpjZ2pjWmFJT1RMTzI1M0F0Rjc3aURRak5oc2NSN3hxOHYydVBq?=
 =?utf-8?B?TXZPR1BWelV4RFJqZ09nazRJeVEzTnozdkkvb2xPbTJMYTRSamYzckVuZEs4?=
 =?utf-8?B?TDh2VHVwemE0VjRSR3RQbXZicklkUzdURHoybzQ3RU11QUVPUmg5Y0NSQTlw?=
 =?utf-8?B?ejhFemVWZzU0R0g0V0Q4aTcrbXphMmlsRk9JNGFmbUtBVVZhRU5PT2tDZ1hP?=
 =?utf-8?B?bDN6MXNCcDdOUHAzSmViaWJORVdaWlcxTWY2ZlZTQW53aTBhUHZ3bzJIVW5W?=
 =?utf-8?B?YytWdmJBYU81L0M3THRsSnU2T0Y3Tm45dWdYeHhjTjdva3dTTklIUDVDN0xM?=
 =?utf-8?B?RnF3UUQ1SjVyKytzVGpwS0JEeVBCQVBEMWRoYzByakp5bGEweElacTIzZGcx?=
 =?utf-8?B?L1BqNmJHTjMydCtOOHZvQ2tydFJXRUpka1ZwM2c0R3RHQlp4TW5DR25iV1ky?=
 =?utf-8?B?MUFhdWZsZE1ib3R4eGRIM2k3elZIZTN1WWdFb3grVlRUSE9rcGR2K1d6YnMx?=
 =?utf-8?B?U3JTWXc5SGtRMkdVRGtnNFdFMkRCOEpuSHJmSUUwTWF3eW42WTM1b1JVN1N0?=
 =?utf-8?B?SU1NVm10NEVIenBFT0NqWWoxcS9hWU1jNlZXdlAxS3QzNEpUWkcrREVBRlRU?=
 =?utf-8?B?bDc1L1BMU3BWU3pBNUxQTDNLK3k0ZlRFMGl2cVRxZ09vK2FFSVpNdzhxZW96?=
 =?utf-8?B?aDNKYmlQLzV1TVFaOXNyZXRqeVBOVXBHTW1BL3lDcU81aE9hQWtkdkxyWU5q?=
 =?utf-8?B?OEVVSnBBZkxjbXlobW5zbjFNUG5ENmNGSGJucXI1cW5lWW9xY1VQTEVQRDNp?=
 =?utf-8?B?RkFCSUxuZWJCUHBwT1RlZ081R0xYN1NmNC9rdjdQUG43YlEzZytPZGtMNHRp?=
 =?utf-8?B?ZmFvZXNjcGRvS0kzelluY3Nkd0RET1pJR1l2ZzkxNUFaVVk1dTBFZGczMnZX?=
 =?utf-8?B?T0NrcGNkSzFDS2pYUVlkcVIyS2RoM3FoRWxxT09PUytYOCs4c2lQK2dzMVZX?=
 =?utf-8?B?Vi9DT0JWOHVkNzl2Um1aOFRzZXlacCtPUVBabzhTSnlnQzhZSThFNVk2cmdO?=
 =?utf-8?B?UUVML0NSNXRjZ0lHWjRPUVlSdHdPRDBXSDRzbzF2ODVNVHoxODMwK3NCZ0ZV?=
 =?utf-8?Q?KqY19H7DIbQEOplrDPuIuu7J9+9jUzN4nGjwmPg?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR03MB5885.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(7416011)(1800799021)(38070700015); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SHZoaW1XaFlualBwZlV0UWttSUY5R1pwZWFmTno5R0htalF2UHNGQmt6cm82?=
 =?utf-8?B?RVhUblNtc1d6dUtlbTBPQkl5QnN4Q25VdG5WYWZDNEhYejIvQUdzNkR2QnZo?=
 =?utf-8?B?NTd0Ym4rbE5zN2M4b0lJaWc2SVgvZkJJQkRaSHAzVHZuUU1qMnlGdkhTQ2h3?=
 =?utf-8?B?SjRIMjlNOC9sT0NGRm5OR2xza0prdU04Q21oMnJuZmlubXc3NnMyQ084UjFS?=
 =?utf-8?B?UkZyQmw2U2gwd2drblRtclNISnZnbElaTFJ5bjZaNVZ5c3ZxeEVzRmVHVzhy?=
 =?utf-8?B?b3craXNQcFR6YndVTkVHbS9tWitJeVk5ZllCWlRmMG1ndTRYYm82OWcwdGdo?=
 =?utf-8?B?TVFEWGRoY205Wm91ZXc1SG9JU3pNNHhSVGhzNzNyRHBIb3FxVU05aW5xU0lM?=
 =?utf-8?B?dTQrOEFLeUZrOGI3R2MvNGJIRVhzRVVDdUFRYU9YVFM0QXZLbGlJZWVDeG53?=
 =?utf-8?B?UnJDOU1HOW9hRzh5OUd2azJJUTdpTGZrTlpjb3FrVC9YQ0JHQ0orcnJUbVJk?=
 =?utf-8?B?dTNCTUFsQlFOZG1XT3JlZHpiNVB4RGJhSkpJL1NVS2lJclo2eUplaDFIc21V?=
 =?utf-8?B?Z01ZSkkxUkJpZkZkcjAwaXlRdEkvVzJMTWJqYzVpSmxKUjVyeFR5bEh0M2dI?=
 =?utf-8?B?UzVHbTZnSTZZK2ZITUowWUFsZkEvNGNYSUhnVmNnakhjWTBwWGtYZGVYeHE0?=
 =?utf-8?B?SndDYTY0bGc3b3RXQUhsYnZyZFNhSnRVUHhacytLOE5LaERGWC9VRndGV2I5?=
 =?utf-8?B?VUZEaXpyZGlsdWVUNENRb0V4WUN3VlVTNmYwajBuR2VKRmovc1N0WGMrSkh4?=
 =?utf-8?B?TndmVXFqZnlUN285aUdEMjhiaVU2TFpYeUdZeVVrVGlyV1BFZVViOXRpZVhx?=
 =?utf-8?B?bTlNUngrTm1NUkpEUUI4WVlEdVZJcmhtVW9vWHRPMGJrZFFHUU92MmJNKy91?=
 =?utf-8?B?enh2SnNTbGhqUGJqNkZVN2xQMDFSRmFEdUdMNEhkeTRURGtoZlFGaWdvam5i?=
 =?utf-8?B?L1ozeng4bis1dGIybmdtdUtIRW9hYlkvYm1wNlN3SDdqaTU5YWJ3TzVYTEds?=
 =?utf-8?B?d1Q5YmgwUmVqQm9hRkx2TWFGUWVWMUhqd3BEY3FoU0F0cFFNTks2b2Q2WjJi?=
 =?utf-8?B?WWpINXA2bDR3RGdIZFFhdGRtellhd3NoNUVpZTlyQXY4MmZsQTBkdkdIai9q?=
 =?utf-8?B?RkRiQk4vYlZid3hPUWtIUHdNTmEwd3lrc29tekRPbGVVY2ZGOWo2YlpPZjNJ?=
 =?utf-8?B?dVNzcjd3S2s4dk5Bb3FOQ29WOEwxZnNzZG85Rm5NWlZwNUREbWlnSnBQSVZD?=
 =?utf-8?B?RU5DeTZ3cHdmUWlyMEpZZi8zVWZpY2ZHdkxka0U3N2JNaFdKSVk1SGpiYmw0?=
 =?utf-8?B?MWJVbzVEdDhtOWFDcGNIVy9GUGxTb1VGYy9ucDR4OVdxRXFxZnBuaGhSd0Zp?=
 =?utf-8?B?ME01ZlFCOG0vNHNzYi8xRlJHNWNmcG1mY0JCeU9rV3RoVnU2ZVFBeDNjUzZU?=
 =?utf-8?B?dTl6Z2ltQzR4ankvK2RoZm9NZkdiTkErTk4wc1MxQlBSdElnZWtXNEZmNXpz?=
 =?utf-8?B?YkZHbHRkcG1vRjBQZm8zeVUwSjh5RzRmdHdrSG9KZkpLNlp6cklFWktpNmxN?=
 =?utf-8?B?M1BMODZiMlRtUmkvSy9EUzhLeUZERVI1OFlncEpWYVZzTmFtNEhVSHF0dnBI?=
 =?utf-8?B?UlhvaU5yaWxTbWczbHFPeC9zZ3ZNdnI5Q0MxaDk4VXF1ekxucDRSZkp2S1Vx?=
 =?utf-8?B?ZnN0N2NtQTNFakUyaW9yNkZkaURqY0FyYWdxeWo4eENFbW51T0EvNzFoemRr?=
 =?utf-8?B?a0U0YUkwT0I1UG1xQ2JoTDVFNzM4MGNlVTY1aWF2cCtKRWplUkVxOVhwVDU1?=
 =?utf-8?B?WHRkcDZ2L0RvWDY5L1hid1k1Q0E0bytrUlNqWGVIRzY3SVlwdlZDd2RpS3Rz?=
 =?utf-8?B?MlBOZURFWUdvbnFjalFPZHl0QllmTS9LNmhPazVtdmIzOU1meTRWN0lCQVM3?=
 =?utf-8?B?a1Q3cjJCYlA2eGIzZ0puTFN5amRMSG1HSGo1VW9QSThNbnVSOWN3TnVtWlAx?=
 =?utf-8?B?bGJPTTQyNzhaQ0QrdmRZeWQrSG5uQVo5Vi9aTU11MGJmaldGK1g4QkU2NSsz?=
 =?utf-8?Q?edYbv4p5keLzmwTB84Q4e4CnK?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AAB85E8724F73A43A7C4F165F373FD93@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5885.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7371101-b232-4832-6ff6-08dc8e9a252c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2024 06:53:07.9490 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SsLTpnnezSR8R/FvZjJE3B4F049i3AKFNuKuM6zGEZZV020i3ODQl+5SJWT4k7MCt5Ntf090gyVZBqVcMwrLNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB8719
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

T24gV2VkLCAyMDI0LTA2LTEyIGF0IDE0OjIyICswOTAwLCBUb21hc3ogRmlnYSB3cm90ZToNCj4g
IAkgDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBvcGVu
IGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhl
IGNvbnRlbnQuDQo+ICBPbiBUaHUsIE1heSAxNiwgMjAyNCBhdCAwODoyMDo1MFBNICswODAwLCBZ
dW5mZWkgRG9uZyB3cm90ZToNCj4gPiBOZWVkIHRvIGNhbGwgZG1hIGhlYXAgaW50ZXJmYWNlIHRv
IGFsbG9jYXRlL2ZyZWUgc2VjdXJlIG1lbW9yeSB3aGVuDQo+IHBsYXlpbmcNCj4gPiBzZWN1cmUg
dmlkZW8uDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogWXVuZmVpIERvbmcgPHl1bmZlaS5kb25n
QG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL21lZGlhL3BsYXRmb3JtL21lZGlhdGVr
L3Zjb2RlYy9LY29uZmlnICAgIHwgICAxICsNCj4gPiAgLi4uL21lZGlhdGVrL3Zjb2RlYy9jb21t
b24vbXRrX3Zjb2RlY191dGlsLmMgIHwgMTIyDQo+ICsrKysrKysrKysrKysrKysrLQ0KPiA+ICAu
Li4vbWVkaWF0ZWsvdmNvZGVjL2NvbW1vbi9tdGtfdmNvZGVjX3V0aWwuaCAgfCAgIDMgKw0KPiA+
ICAzIGZpbGVzIGNoYW5nZWQsIDEyMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiA+
IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2Rl
Yy9LY29uZmlnDQo+IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay92Y29kZWMvS2Nv
bmZpZw0KPiA+IGluZGV4IGJjODI5MjIzMjUzMC4uNzA3ODY1NzAzZTYxIDEwMDY0NA0KPiA+IC0t
LSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL0tjb25maWcNCj4gPiAr
KysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9LY29uZmlnDQo+ID4g
QEAgLTE3LDYgKzE3LDcgQEAgY29uZmlnIFZJREVPX01FRElBVEVLX1ZDT0RFQw0KDQpbc25pcF0N
CiAgDQo+ID4gLXZvaWQgbXRrX3Zjb2RlY19tZW1fZnJlZSh2b2lkICpwcml2LCBzdHJ1Y3QgbXRr
X3Zjb2RlY19tZW0gKm1lbSkNCj4gPiArc3RhdGljIGludCBtdGtfdmNvZGVjX21lbV9hbGxvY19z
ZWMoc3RydWN0IG10a192Y29kZWNfZGVjX2N0eA0KPiAqY3R4LCBzdHJ1Y3QgbXRrX3Zjb2RlY19t
ZW0gKm1lbSkNCj4gPiArew0KPiA+ICtzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmY3R4LT5kZXYtPnBs
YXRfZGV2LT5kZXY7DQo+ID4gK3N0cnVjdCBkbWFfYnVmICpkbWFfYnVmZmVyOw0KPiA+ICtzdHJ1
Y3QgZG1hX2hlYXAgKnZkZWNfaGVhcDsNCj4gPiArc3RydWN0IGRtYV9idWZfYXR0YWNobWVudCAq
YXR0YWNoOw0KPiA+ICtzdHJ1Y3Qgc2dfdGFibGUgKnNndDsNCj4gPiArdW5zaWduZWQgbG9uZyBz
aXplID0gbWVtLT5zaXplOw0KPiA+ICtpbnQgcmV0ID0gMDsNCj4gPiArDQo+ID4gK2lmICghc2l6
ZSkNCj4gPiArcmV0dXJuIC1FSU5WQUw7DQo+ID4gKw0KPiA+ICt2ZGVjX2hlYXAgPSBkbWFfaGVh
cF9maW5kKCJyZXN0cmljdGVkX210a19jbWEiKTsNCj4gPiAraWYgKCF2ZGVjX2hlYXApIHsNCj4g
PiArbXRrX3Y0bDJfdmRlY19lcnIoY3R4LCAiZG1hIGhlYXAgZmluZCBmYWlsZWQhIik7DQo+ID4g
K3JldHVybiAtRVBFUk07DQo+ID4gK30NCj4gDQo+IEhvdyBpcyB0aGUgaGVhcCBuYW1lIGRldGVy
bWluZWQgaGVyZT8gTXkgcmVjb2xsZWN0aW9uIGlzIHRoYXQgdGhlDQo+IGhlYXANCj4gbmFtZSBj
b21lcyBmcm9tIHRoZSBoZWFwIG5vZGUgaW4gdGhlIERULCBzbyBpdCBtYXkgdmFyeSBkZXBlbmRp
bmcgb24NCj4gdGhlDQo+IGJvYXJkLg0KPiANCj4gSXMgdGhlIGhlYXAgbmFtZSBkb2N1bWVudGVk
IGFueXdoZXJlIGluIHRoZSBEVCBiaW5kaW5ncz8NCj4gDQo+IFNob3VsZG4ndCB3ZSByYXRoZXIg
cXVlcnkgRFQgZm9yIGEgcGhhbmRsZSB0byB0aGUgcmlnaHQgaGVhcD8NCj4gDQoNCkhpIFRvbWFz
eiwNCg0KVGhpcyBoZWFwIG5hbWUgZG9lcyBub3QgY29tZSBmcm9tIGR0LWJpbmRpbmcuIEl0IGlz
IGhhcmQtY29kZWQgaW4gdGhlDQpkcml2ZXJbMV0uIEJlY2F1c2UgdGhlIGhlYXAgZHJpdmVyIGlz
IGEgcHVyZSBTVyBkcml2ZXIsIHRoZXJlIGlzIG5vDQpjb3JyZXNwb25kaW5nIEhXIHVuaXQsIGFu
ZCB0aGVyZSBpcyBubyB3YXkgdG8gYWRkIGEgZHRzaSBub2RlLg0KDQpbMV0gDQpodHRwczovL2xv
cmUua2VybmVsLm9yZy9saW51eC1tZWRpYXRlay8yMDI0MDUxNTExMjMwOC4xMDE3MS0xMC15b25n
Lnd1QG1lZGlhdGVrLmNvbS8NCg0KVGhhbmtzLg0K
