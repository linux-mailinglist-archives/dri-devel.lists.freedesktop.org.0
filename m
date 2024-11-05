Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 370F39BC8D5
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 10:15:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B472110E142;
	Tue,  5 Nov 2024 09:15:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Qu0GIEPv";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="jGEALKE3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6179710E142
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 09:15:14 +0000 (UTC)
X-UUID: 73ce37e49b5611efb88477ffae1fc7a5-20241105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=YVBmcAumXPUdrG1oPXRGh6VgK/Nrbqa8fNGEFCpT8OA=; 
 b=Qu0GIEPviY0bO9SZYJvXuccxviPV0+6ZFcfuPnj8ugPiIhEhpGtPjreyFXym1fghADvNKweefGA7XgOptfMPDJ/nJskg9VF30wSbjsDBpPBbF8B4/NqSqX0m99r+Grc3V/vl8QiC87pB3Gx4q1YgmkTI5j42kHU4g2myRpbPVs8=;
X-CID-CACHE: Type:Local,Time:202411051643+08,HitQuantity:3
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42, REQID:dbf14394-3027-4771-a888-3edc7e1bdf99, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:b0fcdc3, CLOUDID:c262b748-ca13-40ea-8070-fa012edab362,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 73ce37e49b5611efb88477ffae1fc7a5-20241105
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1918162501; Tue, 05 Nov 2024 17:15:08 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 5 Nov 2024 17:14:52 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Tue, 5 Nov 2024 17:14:52 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k04NN5UxYHI3vNd9k1dkcddRsWV7KQynjmUHBvnw8W2xSqhCiJDrG7DMXj1QK8+mj2pbiHFpEjkIJZ2tyIZjCs/4ONwICUNoydOFQK2Kvdhlv92xqQQzqOgCkHVYR2xJMiPHv3AZVZna9soxUh3eoLBvdDTirgD0soqQuRU94DLgKP0XI67yUevWSQ5o5EFonFZT+DI/Z+CoQJE3etVjE/l2Eq+fBkfyHsAjWtFcJS63hu4UiXvJEW3JYSjtGvCbmAdvN7We3zeshGHg/xEUrtj1JsjF84SUO2OjnGzJXuAiHo+o4cRL+A2pxQ+h0LmOspzV3QcUyMhWeLY1rk9W8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BCzXsU8aF106wxvWsG5NrW/Y7CPjxaysyWVXgU1qR7k=;
 b=tWkFyty7l/zq0Dq24vWGbdnEKCzV43881SzhjllfeYLUSa1V8NNOKII2Stpfuh0i5eYaI5xgrIP/OUUnUV9APS4ULxPJ8/1m4SRhjS7S2l/t9X/KFXe9zHn7/NzJBxi3qfN+ECLPL2+2irF9oFqMBSqA1t6WXatqL0AoVJjM+yTXlIdIqv1pBCJDZgh3o+/mpnzr9hJ05N5W3TQjWk66k1Ae+6SFvZ0gb62Q8FmamaCxeCslPn72w3xNq35CaQTeiND0DlZTZZpu7neEpAX0sNOarbVpgm7pOGnR7y8u91Hel08KByUYtLlrG20hzdfnec1ccQhtJ1+NnkLXLPpIGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BCzXsU8aF106wxvWsG5NrW/Y7CPjxaysyWVXgU1qR7k=;
 b=jGEALKE3fksxd3Bk72MxYYmEWUgwzYp4U9Zt4kuuEFA9r83P2WJ5koIBdGB/+CiPL9+FvC+HKIjmabsicGXLTD6sInfe9F7FDDTgdwxKFoSdgkXatRH7lhfNctgV753ftw3/mbrBS6RawesaSG1gUZstDVEK6k5AqLf3CVUXTOc=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TY0PR03MB8173.apcprd03.prod.outlook.com (2603:1096:405:1a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 09:14:49 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 09:14:48 +0000
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
Subject: Re: [PATCH v1 06/10] media: platform: mediatek: add isp_7x utility
Thread-Topic: [PATCH v1 06/10] media: platform: mediatek: add isp_7x utility
Thread-Index: AQHbGj2JaAd/ufwz/0W0Edv5eKs5YbKokdaA
Date: Tue, 5 Nov 2024 09:14:48 +0000
Message-ID: <177e318c52d2a7be77f37f2c16a10b14b28e8383.camel@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
 <20241009111551.27052-7-Shu-hsiang.Yang@mediatek.com>
In-Reply-To: <20241009111551.27052-7-Shu-hsiang.Yang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TY0PR03MB8173:EE_
x-ms-office365-filtering-correlation-id: 1884384a-4214-41e6-6a06-08dcfd7a4c2e
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?ZGVBQ2xWSU9HUUVWT1lBQTBSUk5BTFZLUktGYlFhMnhSOHRYR0I0VDNueWlZ?=
 =?utf-8?B?d3hTSXhhVHZNK1NFV1lLY09WZXVzeW9sWXViNjRwclNlWjRvdHBMT3BYaG5t?=
 =?utf-8?B?QWJjSzZtelpkeEV5NTRQcjdqRUppemlnMDNJdFI0Q1lYbHIzWWozOHpYQjN0?=
 =?utf-8?B?RUJ0Uk5FV3o5NmJDVXIxWGpWdUg5N2xOczByL0daNHNVSGs2czRURTc4cUFj?=
 =?utf-8?B?c0poUFFnM3Q2OTEyWEkzYW1JVVdWRXhuSU1mQUV3cXo2aktqT3czOTJMSlRo?=
 =?utf-8?B?bzl4bkRIbE9rRWlESWYvSWN0ak5XcGxZSEhVNzZwNXhVOVlYUDJvejQ3QzZW?=
 =?utf-8?B?NVVRVGVqNW9sZjc2NlBpMFVkSHorZjZQMlptSVFpNWMvdjE3TjNZeU10bldo?=
 =?utf-8?B?UUYreER4OVRSK3FvMjE2cWJtOUo2VzFTNnpSSVVHYlRublk4dUUyc0xSL0Qz?=
 =?utf-8?B?MGFWNWExSjBvYlNxb3c0dGZOVnFhRHplMkZxTzZJcFVqQ0o0TmRublVoT3Y2?=
 =?utf-8?B?VklQU20yS2lzbTdibUlKMElTLy9BRWJrTjFCS29kcHJFTnNxRXU1WlYwaVVY?=
 =?utf-8?B?TWJtVUUzQUVQcjBSMDdNejZuU3J2M1JDSVd4c2wyWjhMbk1jWmZ2ZVRjN0ZY?=
 =?utf-8?B?UWJicGN5UGxBNmV6S29qZVJGZzFqem9WamJLZVNmT1FkcEYvdGtINUN4UDVh?=
 =?utf-8?B?RnZrWHBaV3JLREoxVER0RFp0NFhBQlB0akE0TzFZVmR0M295T2JDQkY5S20w?=
 =?utf-8?B?M3U4dHp5c3V5aHpQWU8vTEJqTmFpeEdzV1JHL1NBNk11bm81VUFMRjAzTWhv?=
 =?utf-8?B?dEFqSWFVdndRR1VBUC9FT2NHaVRscFpRa202b0JxclZBRENyTkNJZTBUaU5p?=
 =?utf-8?B?MnE2MWFEcG1vUS96cFl6ZmJDaGlMZXZBd2JKbDk4RHNpL2w4V1NQajB0bXh0?=
 =?utf-8?B?d1RZdk1QbHZLREROM04vZ0RIR29rOWJUaFk5UVh0NzZPNFcyRFROaDZvL0NT?=
 =?utf-8?B?Njl0b0s5RTNpbm5XSXZDdHQ2QUMvcno0RFE2UVkyZkJTSmorMFdGcXNwejg3?=
 =?utf-8?B?bVdnVE5lWFo2SFVVSHJybTM5RWVWWjhwTDdSY1Y5UzlCV0RodEMySWlYUmQx?=
 =?utf-8?B?eTd1V2ROWkNhNmJLY3lYam96MW80TFFVWDZXM3l4c0lWbmpZQkxOejl5V3dX?=
 =?utf-8?B?YmtCREtXKzg5NWJpUk16ak91TklqbXFMRFdsNWFuMUx2V0Q3UTAxaGpJTzl0?=
 =?utf-8?B?RnV2QUw2NVZKZW9ZcXhrV3pRandNNVhuTW9LdlBrNWsxb25jdU15eUwvWDZt?=
 =?utf-8?B?ZG9vRGxBYlM5M0lWSTNlMTQwbTAyZFNnRHN6SWhZZlNlSUNFaG5XcXl1RHhy?=
 =?utf-8?B?TXBJajdYZzA1MWkxREVQZmQ1Y1NCMXd3amhieWhmRmRRdjM0enZseGh0eG9E?=
 =?utf-8?B?RHBpcmlRRUtKaVhGdUVzaUpFdHpBNFo5QzlmOWpZNFF3NEQwalhtdnNtWWVS?=
 =?utf-8?B?aU5yajdPSE9OSWxKaHlXZ3czQXpTamdlY3dCRklwUU1kZHhSWGFyMFBDUW5W?=
 =?utf-8?B?QjN4OU9qZnVMNTFJUVpDSXRTZjhhU1M2ZHhhQlRhVVJmVFovOXBGWFQzRS9I?=
 =?utf-8?B?OGZRNmZyNW1CbGg5Qy8rNEdvZVBrNHFmSGpNeW5zWWg1U2ErdWNZWWFaWU1V?=
 =?utf-8?B?RmNhWTROMzdQQTJzazVoSWk2OWVZd3Y3NUttc1NSZHhNUWFsSm5TQVNaYUh1?=
 =?utf-8?B?UG9RZVFyUzBlTHZjSGZhSlNPcWY0azViL3NuUEpQcFZFd0Q3WStvaVYyWFA0?=
 =?utf-8?Q?3QDorsfQPQ22vibiltCyyVbo3SFlK784jG3K0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cEMvZUNOVG13M0JMS25SOVlySnZINk5kQ2R3V01wZVFERy94NkYveStXckZJ?=
 =?utf-8?B?b0VTRVVKZGQzTDhVRGpsaC9MRWJYL05QVHUxa1VxdEt5OWQxYW05UHJ0cDMr?=
 =?utf-8?B?SFhYRGg5eUJsMmtNTFhhdUV6RG40N0Y1N2h1N0tCMjN2UnFEQnZ0d1JicWY2?=
 =?utf-8?B?TTBmcldBS0RpajcxTCtOeXkyMUF3Zm41YjIySmtxcXNTU1NTeU4rYjdCdEJI?=
 =?utf-8?B?Y0h0SDN0WFY4U29uRFcrV2pOREpoWU1hUzRpekR6OUwyTHBlV3RTL1BueGRn?=
 =?utf-8?B?WWNJamFEOHJYNjhvN1lRUTExRVovMkZScHl4b1dzU1RCbm1QOUl0anhLbm9E?=
 =?utf-8?B?N1dqcUtGRzc4SEZDbnljdHNtOCtsNElVcEpPVm9Ic3BEOFNoRFNUWEU5Rk41?=
 =?utf-8?B?TXhLOTFjdUxXbm1LSFNGL2xtM29LREprK1Y0ZHpBeVQ2dW5UMUl0aDdEaEhK?=
 =?utf-8?B?K0dEa1hGenZtbGNtd01vaVFwR3phY1Zhci82SWkrVnNlOUpBTGU5NHpJaFE5?=
 =?utf-8?B?dUJLdGtOemVZZytoRGNlc1V5OVNkVm42U1JiZ2lrcnJobHJ6NHp0VW03bDNU?=
 =?utf-8?B?NnpqVFFXcDlMVHY1STl6bUxwSzRLS25HaVVqemVySnZybGZTdU15djRQcDQx?=
 =?utf-8?B?bVhSMzBSVzJIZVViZHVTaUEySVlNWWdoVWtickIrK2NBeG5hQ3FXUGZGdG02?=
 =?utf-8?B?MkRuN3dqYU1vaEZoS0hhTEdaUWs4aEFta2xkZEkwMFh0NUV2V0FyaWNscWh5?=
 =?utf-8?B?S1I5dmJtQkVON1UxTndMWll3dkhaK1pRZmdXYWx5czdGNGRrcVNHTE9aa1Zr?=
 =?utf-8?B?VmFqbHFVQlVXcGh2bmdPQ094TmxLY2NZRExiQXFrS3ZnazN3aVJ0QnRMTERi?=
 =?utf-8?B?VVd4cGlmUm9leUtldDczTFM2YTYyMnJJVi9ZcjVmaGJ3QW9zb29MOGFZOFNH?=
 =?utf-8?B?Zy9LOVpaSlY5dnR2dDlaL0pRdWhLOWQ1WlVJZmdJYXkyc1dlaS9NU0tqRDJl?=
 =?utf-8?B?QW44Y1N6NlFuNVJoMGtLM2tnOG54UnhoR3VoM084YWEyUFpGSVowYlViTmtM?=
 =?utf-8?B?UFIwRGU2dU5sS0RZK3VrdUlSUG45MjJQUE9LSHh3M3BKYkl6Mm1wcDM1UGZh?=
 =?utf-8?B?Z2cxVEpwdnFIV2VuWURKczRJSVBKUndnQkM5Y1l6NDlDT1pxa2h4d09UcUZv?=
 =?utf-8?B?dUNWRDljK1JTaVVVQ1ROTUZBemxlZENPTFZQby95MmxxY3paZTZ5aUZDZzA0?=
 =?utf-8?B?dzc0N2FUT2JOVU1BcERpZVdic1luQWZGcG1WVmJDcGZnRUwwemVkazFIb2Q2?=
 =?utf-8?B?clo3ejlUaU1FU25PMzRDN0V3STk4em1ZTHFQRUI0ZEQxWnBxcUdxR1A3Zlc3?=
 =?utf-8?B?NzNOdFJkMGo1QWZBa0t4QTk3UUpCSkorazByejYrTFBiVE9Wb1MvelRhVzRU?=
 =?utf-8?B?QnFHMHZObTB3TXQxTUhiWXFibkhIMzU4WDUvWVdKbzNsS21kUjVlY25OMjhl?=
 =?utf-8?B?Q1pRSHlyRHp5ZktFckFndTNPQi9SNnErQ1ZxeHZKSEVpVjJ4OEY3dEplM05k?=
 =?utf-8?B?cGVaMDJRaFpiK2VRVm9EKy9MZTd3VXZqc1p2TWpJN1dMd2pzMWFZOWQ1NSty?=
 =?utf-8?B?dE9GQUV2b2RMSmRoVko1TnRXVkZhRUFuM1c5VWJ0QW9ZTkphdDMxN0NYMWNq?=
 =?utf-8?B?SFlwcmtDaWFrcWVwVWpBYytRSFZORE1jclorcHJ6N2FKcTNxdGhxb25MVDc2?=
 =?utf-8?B?czdIbG5pbkFVZE8xR2JVcVN2L0tLckNaQ3ZCQzVlaDB5U2hvdkd3N2tEKy9T?=
 =?utf-8?B?QTJvM2FKYlhSTE9jdkk2cDdBN1RlOTNjNll3UnFJN3ZlWjBPRzZ5cFNHLzFj?=
 =?utf-8?B?VGgzYjYzcWtnVUlvRWV4MkJobmVLSlRZMlNCaXE5YUIzNmUrVktYbkZiUFF2?=
 =?utf-8?B?NFRiTjlXQlZKMDhVRmNzeGY2ZkhRNkZTbEE3cXBESGM5eHNmRXFtVEdmVzRv?=
 =?utf-8?B?ZzFKdmFQRG9KZEhodmRQQ056RlpEdGRxUUQ5Zmdhc0ltMFQ3V3pLZ09HdG1R?=
 =?utf-8?B?UVVQTzZjVzlwV0xSS2JvVEVhdVBOQjVvM0pGR2c3ZjNpUmE0a1U2VUJJc3lN?=
 =?utf-8?Q?0RnHnIFenyLWzpjt2qucDli4e?=
Content-ID: <94D4626EFCAB374D8C08D2A26241B43D@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1884384a-4214-41e6-6a06-08dcfd7a4c2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2024 09:14:48.5408 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bRQC9riyqBJi/os4KbALMcqObeFe/8W3YXLjK52ppLpFEprGdtpyf8AlxTHhggp7gPzd3nArsThV59eSrWLu+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB8173
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--7.961600-8.000000
X-TMASE-MatchedRID: 7ySqCuYCpfhm6oeM5+OJFCaix8JZpk78jLOy13Cgb4+qvcIF1TcLYEmo
 bOLhIyMmCPYbugXTgR+M5TCLNNgDParukyhyG02kylAqNTt8FdX54F/2i/DwjRrUQ7A9MrmGjse
 1+4fQ7uu2XuqHnmj9+2n1p0p3lnwIGAdnzrnkM4/SBVVc2BozSnJnzNw42kCx2bNx1HEv7HAqtq
 5d3cxkNVeT361n7e9NLLdGVchhC+Y/WHbVV9zip8dT87IIVTqz/VjeDujAuGU=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--7.961600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 74D7F2EDF72C8A07395AD8CC33CC9D20709FD31BC23361045C98B3835F6E47E52000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_007_670706672.2021110632"
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

--__=_Part_Boundary_007_670706672.2021110632
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIFNodS1oc2lhbmc6DQoNCk9uIFdlZCwgMjAyNC0xMC0wOSBhdCAxOToxNSArMDgwMCwgU2h1
LWhzaWFuZyBZYW5nIHdyb3RlOg0KPiBJbnRyb2R1Y2VzIHV0aWxpdHkgZmlsZXMgZm9yIHRoZSBN
ZWRpYVRlayBJU1A3LnggY2Ftc3lzIGRyaXZlci4gVGhlc2UNCj4gdXRpbGl0aWVzIHByb3ZpZGUg
ZXNzZW50aWFsIHBsYXRmb3JtIGRlZmluaXRpb25zLCBkZWJ1Z2dpbmcgdG9vbHMsIGFuZA0KPiBt
YW5hZ2VtZW50IGZ1bmN0aW9ucyB0byBzdXBwb3J0IElTUCBvcGVyYXRpb25zIGFuZCBTQ1AgY29t
bXVuaWNhdGlvbi4NCj4gS2V5IGZ1bmN0aW9uYWxpdGllcyBpbmNsdWRlOg0KPiAxLkhhcmR3YXJl
IHBpcGVsaW5lIGFuZCByZWdpc3RlciBkZWZpbml0aW9ucyBmb3IgbWFuYWdpbmcgaW1hZ2UNCj4g
cHJvY2Vzc2luZyBtb2R1bGVzLg0KPiAyLkRNQSBkZWJ1Z2dpbmcgdXRpbGl0aWVzIGFuZCBidWZm
ZXIgbWFuYWdlbWVudCBmdW5jdGlvbnMuDQo+IDMuRGVmaW5pdGlvbnMgb2Ygc3VwcG9ydGVkIGlt
YWdlIGZvcm1hdHMgZm9yIHByb3BlciBkYXRhIGhhbmRsaW5nLg0KPiA0LklQSSBhbmQgU0NQIGNv
bW11bmljYXRpb24gc3RydWN0dXJlcyBmb3IgbW9kdWxlIHN0YXRlIG1hbmFnZW1lbnQgYW5kDQo+
IGNvbmZpZ3VyaW5nIElTUC4NCj4gNS5NZXRhZGF0YSBwYXJhbWV0ZXJzIGZvciBjb25maWd1cmlu
ZyBpbWFnZSBwcm9jZXNzaW5nLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogU2h1LWhzaWFuZyBZYW5n
IDxTaHUtaHNpYW5nLllhbmdAbWVkaWF0ZWsuY29tPg0KPiAtLS0NCg0KW3NuaXBdDQoNCj4gKw0K
PiArI2RlZmluZSBNVEtfQ0FNX0lQSV9WRVJTSU9OX01BSk9SICgwKQ0KDQpNVEtfQ0FNX0lQSV9W
RVJTSU9OX01BSk9SIGlzIHVzZWxlc3MsIHNvIGRyb3AgaXQuDQoNCj4gKyNkZWZpbmUgTVRLX0NB
TV9JUElfVkVSU0lPTl9NSU5PUiAoMSkNCg0KRGl0dG8uDQoNClJlZ2FyZHMsDQpDSw0KDQo+ICsN
Cj4gDQo=

--__=_Part_Boundary_007_670706672.2021110632
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtTaHUtaHNpYW5nOg0KDQpPbiYjMzI7V2Vk
LCYjMzI7MjAyNC0xMC0wOSYjMzI7YXQmIzMyOzE5OjE1JiMzMjsrMDgwMCwmIzMyO1NodS1oc2lh
bmcmIzMyO1lhbmcmIzMyO3dyb3RlOg0KJmd0OyYjMzI7SW50cm9kdWNlcyYjMzI7dXRpbGl0eSYj
MzI7ZmlsZXMmIzMyO2ZvciYjMzI7dGhlJiMzMjtNZWRpYVRlayYjMzI7SVNQNy54JiMzMjtjYW1z
eXMmIzMyO2RyaXZlci4mIzMyO1RoZXNlDQomZ3Q7JiMzMjt1dGlsaXRpZXMmIzMyO3Byb3ZpZGUm
IzMyO2Vzc2VudGlhbCYjMzI7cGxhdGZvcm0mIzMyO2RlZmluaXRpb25zLCYjMzI7ZGVidWdnaW5n
JiMzMjt0b29scywmIzMyO2FuZA0KJmd0OyYjMzI7bWFuYWdlbWVudCYjMzI7ZnVuY3Rpb25zJiMz
Mjt0byYjMzI7c3VwcG9ydCYjMzI7SVNQJiMzMjtvcGVyYXRpb25zJiMzMjthbmQmIzMyO1NDUCYj
MzI7Y29tbXVuaWNhdGlvbi4NCiZndDsmIzMyO0tleSYjMzI7ZnVuY3Rpb25hbGl0aWVzJiMzMjtp
bmNsdWRlOg0KJmd0OyYjMzI7MS5IYXJkd2FyZSYjMzI7cGlwZWxpbmUmIzMyO2FuZCYjMzI7cmVn
aXN0ZXImIzMyO2RlZmluaXRpb25zJiMzMjtmb3ImIzMyO21hbmFnaW5nJiMzMjtpbWFnZQ0KJmd0
OyYjMzI7cHJvY2Vzc2luZyYjMzI7bW9kdWxlcy4NCiZndDsmIzMyOzIuRE1BJiMzMjtkZWJ1Z2dp
bmcmIzMyO3V0aWxpdGllcyYjMzI7YW5kJiMzMjtidWZmZXImIzMyO21hbmFnZW1lbnQmIzMyO2Z1
bmN0aW9ucy4NCiZndDsmIzMyOzMuRGVmaW5pdGlvbnMmIzMyO29mJiMzMjtzdXBwb3J0ZWQmIzMy
O2ltYWdlJiMzMjtmb3JtYXRzJiMzMjtmb3ImIzMyO3Byb3BlciYjMzI7ZGF0YSYjMzI7aGFuZGxp
bmcuDQomZ3Q7JiMzMjs0LklQSSYjMzI7YW5kJiMzMjtTQ1AmIzMyO2NvbW11bmljYXRpb24mIzMy
O3N0cnVjdHVyZXMmIzMyO2ZvciYjMzI7bW9kdWxlJiMzMjtzdGF0ZSYjMzI7bWFuYWdlbWVudCYj
MzI7YW5kDQomZ3Q7JiMzMjtjb25maWd1cmluZyYjMzI7SVNQLg0KJmd0OyYjMzI7NS5NZXRhZGF0
YSYjMzI7cGFyYW1ldGVycyYjMzI7Zm9yJiMzMjtjb25maWd1cmluZyYjMzI7aW1hZ2UmIzMyO3By
b2Nlc3NpbmcuDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtTaHUtaHNp
YW5nJiMzMjtZYW5nJiMzMjsmbHQ7U2h1LWhzaWFuZy5ZYW5nQG1lZGlhdGVrLmNvbSZndDsNCiZn
dDsmIzMyOy0tLQ0KDQpbc25pcF0NCg0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7KyNkZWZpbmUmIzMy
O01US19DQU1fSVBJX1ZFUlNJT05fTUFKT1ImIzMyOygwKQ0KDQpNVEtfQ0FNX0lQSV9WRVJTSU9O
X01BSk9SJiMzMjtpcyYjMzI7dXNlbGVzcywmIzMyO3NvJiMzMjtkcm9wJiMzMjtpdC4NCg0KJmd0
OyYjMzI7KyNkZWZpbmUmIzMyO01US19DQU1fSVBJX1ZFUlNJT05fTUlOT1ImIzMyOygxKQ0KDQpE
aXR0by4NCg0KUmVnYXJkcywNCkNLDQoNCiZndDsmIzMyOysNCiZndDsmIzMyOw0KDQo8L3ByZT4N
CjwvcD48L2JvZHk+PC9odG1sPjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxwcmU+KioqKioqKioq
KioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlICoqKioqKioqKioqKioqKioqKioq
DQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1
ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnks
IHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBh
cHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0
aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlz
dHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwg
KGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykg
aXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUg
bm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZSANCnRo
YXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkg
dGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRl
bGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBh
dHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNv
bnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9w
cmU+PCEtLX0tLT4=

--__=_Part_Boundary_007_670706672.2021110632--

