Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C68CA9D595F
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 07:23:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2895310E213;
	Fri, 22 Nov 2024 06:23:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="ZuNmeHBA";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="VdiTiIgV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8937010E213
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 06:23:53 +0000 (UTC)
X-UUID: 55c0633ea89a11ef99858b75a2457dd9-20241122
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=mW4PAadSUc9WcVtLCGYUdwijbon8pH8YNEr8XTJmtZs=; 
 b=ZuNmeHBAbAdyWZCtaugsTEh/UaF1sBaK8bl9b9Mg92Rk1RiELjLEAfZsYwK+ONRAd87vvpIp48zAkNxzHxZoLEtD6E7jy2zep9Yk7KDnCWinC11LD0tgKC0wjf0LaaVePX/+k9vAvQ0+uZ8ricVlJRfQh8CTgiK6zOFH7u14gb4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44, REQID:de5e0e83-eb12-4bdc-a0af-91d3033af6cb, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:464815b, CLOUDID:5e7ca0a0-f395-4dfc-8188-ce2682df7fd8,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
 :-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
 ,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 55c0633ea89a11ef99858b75a2457dd9-20241122
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 503818164; Fri, 22 Nov 2024 14:23:48 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 22 Nov 2024 14:23:48 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Fri, 22 Nov 2024 14:23:48 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kxE1QpuC1IYftUWFD9HGNc+qR5o6geDalYiQVz3rp/r4rAXtMrlHG9UVWNhgLeu53CCG5OAfTHYmd2KvrIr6mqYlZ38ADqPwQl/AZYc7JlM8zNy9o287DMLOgfnxpiF+PSQWVIglETUf6kvbwMIlxhuZvmYgFuE6q6OpsQkPKKwEb9QKrKdH4P3sxKHoGJR8GWTbFzK2HhRswJBs3/Ee64mjkdUNGDevRjWVCe0CYU1d8OtdDwApBjkt8uWv8E3RQwEHUW/FEFfmKeNj/0Em/CyeUgxgH02N5z4Lr1OMToUCzl7LTvoVlWmkgyHPGbxjMn9DmrAgZx2Ap9HM7f1D/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ag0UBY51W+tPag8NIYCQHY7lo7hvQd5UpkzLdja5voo=;
 b=n9RW6irYsmIOXg0107VVerEYB48e5nSWAYApwvA+LvUW0iIwDjk6jtZnLoJecWOBKh5/Fx0SAOueGRenkm6aeHYbp1lPhu/fs78mlaMldi3eRoLF27gXeNZGyb+b0mcjutcEQAk8KqHvhU+V8ShHFITnGS74TuCepFnod1Ex1IKQvqqVNOIwKOodWBUaDBTZy32YS/H0T/uF3nGsdl1fiU/Np4QsesqZGzJa3bJuuh6u4P2+3Mof1584iWD2LglIjnflgDayWCZaGKeliKPUoIl2/tJcl9wJirJkQPcyUw2gfoKipRM039FogObMdtaJvuJhu3VePfcKjA789oUi4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ag0UBY51W+tPag8NIYCQHY7lo7hvQd5UpkzLdja5voo=;
 b=VdiTiIgVpRk7FkzzmQwAjMQ1f4r8J910+krK6DKNf2LZof+v5SgClqlvzqcfl9L0qhC1r4Xs1X1OfHmc4dm1KbNgeiWnb2xjTdVk3OBHnn2M1zqNSRPOliMEvaKJtqUSN9MXg9HlNHjLapTuBSIKE3Hajjgo65zpjB2d9rwp/3s=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by OSQPR03MB8673.apcprd03.prod.outlook.com (2603:1096:604:298::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Fri, 22 Nov
 2024 06:23:44 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8158.017; Fri, 22 Nov 2024
 06:23:44 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "mripard@kernel.org" <mripard@kernel.org>,
 =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?= <jitao.shi@mediatek.com>,
 "kernel@collabora.com" <kernel@collabora.com>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>
Subject: Re: [PATCH v1 3/6] drm/mediatek: mtk_dpi: Use an array for pixclk
 factor calculation
Thread-Topic: [PATCH v1 3/6] drm/mediatek: mtk_dpi: Use an array for pixclk
 factor calculation
Thread-Index: AQHbO0ovL6/Z3MShYU+XiLxJngQ4cbLCrdsAgAApuIA=
Date: Fri, 22 Nov 2024 06:23:44 +0000
Message-ID: <120c65e7c21821a72fa5165e578cc1c39cf0c864.camel@mediatek.com>
References: <20241120124420.133914-1-angelogioacchino.delregno@collabora.com>
 <20241120124420.133914-4-angelogioacchino.delregno@collabora.com>
 <6e07043e70111920848cc3d22e5c60371c0fb65d.camel@mediatek.com>
In-Reply-To: <6e07043e70111920848cc3d22e5c60371c0fb65d.camel@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|OSQPR03MB8673:EE_
x-ms-office365-filtering-correlation-id: ef805277-c220-49e5-9d06-08dd0abe3723
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?MjZYeUtKTGUra3lzL3hVdVo0VGgvV0Znd2hGVVhYM3g0UnlOZVhKbGtPYnpO?=
 =?utf-8?B?alBGNXcrQ25sQ3BjNkh5dDhjQVFmYlNRMEMvRURhQ0tKbm9uZGdFTDhsTm5I?=
 =?utf-8?B?RnhsbmZFTk5yQ1NUNTVVaWVob2ZVL3UzQ3JNREwxYnFFUVc0bmNNVmc5dE45?=
 =?utf-8?B?M3R0dlZnV3N0aUhWOUtGaVBvR3Z3cmkvSTN6dE9WdXRXbDFkdzJSWllXTXZC?=
 =?utf-8?B?ZWZKdnJGZnhDa1VyMDB6QUsxbkRuQVB6Nm9LaEZuajJWMEUvRGMwOHczdlQr?=
 =?utf-8?B?RlVKOFBwUGgySUNxVjRHdWxJQUE5akIzQTBNQll2L2RUaE9yaFhOWjQ5RXhP?=
 =?utf-8?B?ZGNtY0sxbjF4dGlzNjR2T2VNc1ZIMXBRWEY2czBhckVmM2F5RXlFV1F1UWZE?=
 =?utf-8?B?MnNCVTRndytMbWtycDEvLzFBOWhxRnFJQkQxRmxSZEZxQTZqNFlQYll0SW1i?=
 =?utf-8?B?VjFRMHhsYkg5eDVEYlM2REdlTVJXQUl6Y2dqTWVlZ1RsaEUvV1lnSzg3ektS?=
 =?utf-8?B?bFQ5cUJrS2ZjYVl2TmFleWNZVElqS01zUVpCMkNHVGZLRGFrM1NyWERVSE1J?=
 =?utf-8?B?RzZ0SXp2aDdtaS9ZeGQvU2lacnAzcDFnZ25uWmJDTGlFemlQak9ZNWwyckFE?=
 =?utf-8?B?Qk5mNzdadUthRTQrREtUS0Q1SHJONzM4R3ZoVUx1c3pOc1F3N3FBWFFYVEVJ?=
 =?utf-8?B?N1pwbnNvSmZxS1N5ZW5IT1B5TDFvdmorUWVvMVVmbVNwaXNFT1N0WjZjdmpQ?=
 =?utf-8?B?M2lLV2ZpZGtuRzRPTm8xLytCNlZ3OVF2RktmZkt5enNPbnZ3U0x0c3BuME1K?=
 =?utf-8?B?ZlJ2Q0YvRXZRSlNLV0M2VUdjaGFZdEp5YURZaCtaZUZpZnNlQW5KUlA0UFNI?=
 =?utf-8?B?SytkRjlMMm1UbWZSK0FOS0UzY2ZrRHlKMUxwcnZXY1VDZmU0aDVZTHVWZFI2?=
 =?utf-8?B?cGVMcnFSVlNMTDFHZEZYenFuYkQzaERHYnZOaHhIelowZko1enZwVzlVQlRI?=
 =?utf-8?B?K2pQdUxjbFFDQUVoeDdWSjlUaXhtZHFlUmtZNTRZb1ZzWVVBbTJKdTRCWHhB?=
 =?utf-8?B?di9wZTVLLzFXWkhOSHowQkY1Q0kyL2Y4SFVLZVBzVExlekl5OFhkdm5sbytV?=
 =?utf-8?B?a0RnUGxpekFZb2F1YVRuSmEzcXo0UnVBemZIOGEyd291UTdDUmgvbk1tU0ZJ?=
 =?utf-8?B?NWhKUDg5RGlzeE1XYnFEdG04dnljWHJMVGtpQ3J5UmhzdlI2WkEzZlhGSUxw?=
 =?utf-8?B?cDUxRUIwL0RsV2E2RTQvM1AySHFwTGIyUmowNVRVUWl1bkxPMlF4UnRHeFhz?=
 =?utf-8?B?UUlHT3RSZ0FCSEFpRkwxdFpibFBxUnh6d0pMbjVBUERYVWNqenVhWE9lK2x0?=
 =?utf-8?B?TDN3bldGTUVjekFPOVhPeHNKazg5bC84dXllVktBQjNuaEc4Z3p1QzZERCtM?=
 =?utf-8?B?QkNuUmN0K1QzbEYxb0VjVHZsOTdEN1ROZ1J4RUZsaTRHenl6K0UxbW1JcWc3?=
 =?utf-8?B?R1NibkIzT1FxcjFLRDJWeHFsM2NlQmtkOUpDNnJ6cENlUnJuc0RwRUpyd2ho?=
 =?utf-8?B?YXYvd2ZwT3FTbjFuWE5aRDlYdVg4V3M0T21paWo3UzdOV0IwUnZnb2FHd1B3?=
 =?utf-8?B?YmF0R1lNOUZtQ05yT2lTeWFHZWhWS0FNSG0zazlobnRFTjVqNTVXYmJQMFUv?=
 =?utf-8?B?VHErQzdaWHlHc2NRdTBuUmExWEJhMzgzNHFxQ0VtOFUzNVVQM1dqaHFmWEtn?=
 =?utf-8?B?WThkQktFMkY0UDJBRXFDTFRTc2FhK1ZUVTQxQUVDRlZGR2dvYVowUVFTSzlq?=
 =?utf-8?B?SDV6WGJONlo2bFJyUDRCbEJBeXMxeEp2UmdEQ0hTSHhnck0zKytPejRmc2Qw?=
 =?utf-8?B?S1pBTlM0WkErSGY3MnA1eVJzK0luMUVNT2NZYXdSMFlFYmc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NjhsWVhhVkJwRVBsSHRCeERLQ3MzVEVNVFBPV3RTdEN5dW1BVC9CSmFrWFVT?=
 =?utf-8?B?RGlKZlBpTGR0ZVVncUp0OGJBMXFPTVJUVFgxeUN2ZDdZb25CcUMzTDQ1anhT?=
 =?utf-8?B?eFhzWnpNa242dGJtUkZWQUwzcUpzMkJJMVd0WkdYTGNoMUlEejIvOHFHUkJG?=
 =?utf-8?B?UlJLSUFLemtmNkp4b3pKOWxTS3dIRWdXd0pueTErZWlybS9IZERDdy9FRGhC?=
 =?utf-8?B?QnB2RVZnTUx5Q1d2R0R4TnFGWFZKMkxtc0VINGUwdlh5NzJqS3ZlM2tjMEVP?=
 =?utf-8?B?TDRpMnIzN1lKSmE4RkcwWDZLMHZXODNLWWRsSUdJUEpxTWs4RElkWkFlN1VI?=
 =?utf-8?B?RmNXYjNkbVFnUFVuVEt2R0xmaEJvdGRCL293djBXUUwvaUdkYzYyVVJDRDdl?=
 =?utf-8?B?TmJIbFFadUZMK0NDVFZsRVEvcmQrUGx4NVhJcGJaZ3dkekdUNlRTVEpLVTc1?=
 =?utf-8?B?ZTNtZktRN1dBY3pLemdmQ0g5N25BMlV1ZjlTVFZWWHQrdVQxLzdmbzRLcXJY?=
 =?utf-8?B?eVlOYzBWN2UzNkdOWFZtN0FjUzhSbkNzV0JGV2VqVGlCK0lZMmF0ZFQyTFpi?=
 =?utf-8?B?aG5TNjEvMzJqZEFQcFRWemYyMi8zZTAwdytqS3VHT2ZTZTRyYVpORzlFWHlD?=
 =?utf-8?B?ajVzeWdMQi9BS0FGVGlsQjR1MktzUGwxYUJWMjNOVDdvRXJySFJOdkVpVXpq?=
 =?utf-8?B?WUdSTmFKaytIdTRJb1hNMHcvdjhFUTRucE5EM216bXRMYjBubTB2eklNU2Z3?=
 =?utf-8?B?eEVKMEw4Y1p0OVhFeDc5SU8xZytCanFSV2lLOXpiU1ZIWFdGWDc5dEtnczJm?=
 =?utf-8?B?RDRHUktoMFJ4ekFXUk9JNUJ5V1ZZZ0dyOHBMQUxyQ0haSWN2VWJqd1NWMURE?=
 =?utf-8?B?RkgvbU5TbEVlRlowN0xqdUYxTFpjcEw0NjBNMFNsWGJBNEQ0T20vdDhUNDFu?=
 =?utf-8?B?YTRuM0xocXd1Vk83TjNCdkd2bXJFLzRPdzRXL2JwSk9ScDJDTHlUYXFzUXR3?=
 =?utf-8?B?REFiQWEwd3VYSktNRDdPbXdacHlKUk9HSWZiakVzVEcvWkNCYzZYL3Q4bUgx?=
 =?utf-8?B?R0ZCZ1czZnBZWkNWSUxJYWVldklhU2QxTHY0NEdMTGJmSnVpTHU3Y0RzYW9O?=
 =?utf-8?B?NkhTUVBxWFNaaEw4ZHZsT2VsZlZTWHI3ZlU2T0x2eE1XWmEzRnBKRjdIUlNz?=
 =?utf-8?B?ZkxPU3BDT0J2OE5KMzlkL3lHVUVMckUvOUUwWHZIenRqMm42UEp3YUUrVTE4?=
 =?utf-8?B?SHRueDViaE1iMHh2bXZLN3ZSLzV6dm9qRUJSVUV2SFp3bGNqSDVNaFg3R2VF?=
 =?utf-8?B?cldDSWhabll4UWlTZUI3VnljWVlmdUhZL2lSckxMdVJ4VTNRR2lkWFJyL1Q2?=
 =?utf-8?B?ZThJRFdRdG1JS3kxQlhoUHBSLzRLTjV0SDgvMzNSNFlqVU95L0l4MnVLSGZv?=
 =?utf-8?B?OW1WTURNS1BmUDRwMEJXRlZ6Si9zeUJGY3RhbE4xa01HWnpwRG1hMyswQmR2?=
 =?utf-8?B?dUV4YmhtQS9wZXp6NjdmU0J4Um1OZTBNaUE0UWY1Wm1IUU5abDhUeTVONjVN?=
 =?utf-8?B?dVVwNlhIN3M4RUJmTzQwN1h6L1pJMzU1c2F0SlA5YUIySjAvUWpwbUc1eEJh?=
 =?utf-8?B?eDBGRzJIOHNPYy9oRWtSaGZYT0llVlV4Z2xXdzBoZ2hvVm5ybUhINFRzdzIr?=
 =?utf-8?B?cHM0cXJ2cHcrLytIU0pPWHlLMFRMR1BqTVdjdXR5L3Qzb09lbjdCOUNUMFFy?=
 =?utf-8?B?a2wxeUJHT2dTRWdQRGl3Y2kzRlZEM0VNQVdMdWlpVU9TdUhSbHpQTXorU2Rs?=
 =?utf-8?B?WEV6Z1EwZHY5NGdmUTFScTVVR2tqcW1jRTNOTVVKSUMxTzNwWEdPR3dEb3F0?=
 =?utf-8?B?VzJtaDlZamtXVThlOUZmcENPWVJVTU5zTWFaSnA5bWJhS0liUCsyd3EwVTBz?=
 =?utf-8?B?SUpxejlkMGhpL0h4UmhOcXRKSmdDbEFBZGxBdjNLOG15NFZXWlg5bmo1NVZk?=
 =?utf-8?B?VGkxRDQ2UzdVMVJMcXU5bDQzS0VoS2ppYXdRcno0WE5Dc01DRkJZNkxjSDkw?=
 =?utf-8?B?dVc4dXIrMkRHc0owVXhTcVZnV0I0TFZiVU1wM3haRnJsNnVDK2ZPRDROUzZR?=
 =?utf-8?Q?mjDjyRoJGTuuS3D005Fu+ndcP?=
Content-ID: <C06D2C741F4E0E418E64A43BE697164B@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef805277-c220-49e5-9d06-08dd0abe3723
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2024 06:23:44.1569 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vrCNiONDna/hTcxRZGw6BhtZfdhvKF4nsY6GwFrTbwQrMLJkZTy7cm3mcTZfBjUZG8slPcD7yYFpN6QKCkp+jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR03MB8673
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_005_1245943777.1480847710"
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

--__=_Part_Boundary_005_1245943777.1480847710
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEFuZ2VsbzoNCg0KT24gRnJpLCAyMDI0LTExLTIyIGF0IDExOjU0ICswODAwLCBDSyBIdSB3
cm90ZToNCj4gSGksIEFuZ2VsbzoNCj4gDQo+IE9uIFdlZCwgMjAyNC0xMS0yMCBhdCAxMzo0NCAr
MDEwMCwgQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gd3JvdGU6DQo+ID4gRXh0ZXJuYWwgZW1h
aWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwg
eW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gPiANCj4gPiAN
Cj4gPiBTZXR0aW5nIHRoZSBUVkQgUExMIGNsb2NrIHJlcXVpcmVzIHRvIG11bHRpcGx5IHRoZSB0
YXJnZXQgcGl4ZWwNCj4gPiBjbG9jayBieSBhIHNwZWNpZmljIGNvbnN0YW50IGZhY3RvciB0byBh
Y2hpZXZlIHRoZSB0YXJnZXQgUExMDQo+ID4gZnJlcXVlbmN5LCBhbmQgdGhpcyBpcyBkb25lIHRv
IHJlZHVjZSBqaXR0ZXIgdG8gYWNjZXB0YWJsZSBsZXZlbHMuDQo+ID4gDQo+ID4gT24gYWxsIE1l
ZGlhVGVrIFNvQ3MsIHRoZSBmYWN0b3IgaXMgbm90IHJldHJpZXZlZCBieSBhbnkgcmVhbCBraW5k
DQo+ID4gb2YgY2FsY3VsYXRpb24gYnV0IHJhdGhlciBieSBjaGVja2luZyBpZiB0aGUgdGFyZ2V0
IHBpeGVsIGNsb2NrDQo+ID4gaXMgbGVzcyB0aGFuIGEgc3BlY2lmaWVkIGZyZXF1ZW5jeSwgaGVu
Y2UgYXNzaWduaW5nIGEgZnVuY3Rpb24NCj4gPiBwb2ludGVyIGZvciBqdXN0IGEgYnVuY2ggb2Yg
aWYgYnJhbmNoZXMgZG9lcyBlbmxhcmdlIHRoZSBjb2RlDQo+ID4gc2l6ZSBmb3IgbGl0dGxlIHJl
YXNvbi4NCj4gPiANCj4gPiBSZW1vdmUgYWxsIFNvQy1zcGVjaWZpYyBmdW5jdGlvbnMsIGFkZCBh
IHN0cnVjdHVyZSBgbXRrX2RwaV9mYWN0b3JgDQo+ID4gdGhhdCBob2xkcyBhIGNsb2NrIGZyZXF1
ZW5jeSBhbmQgY29ycmVzcG9uZGluZyBQTEwgZmFjdG9yLCBhbmQNCj4gPiBkZWNsYXJlIHRoZSBj
b25zdHJhaW50cyBmb3IgZWFjaCBTb0MgaW4gZm9ybSBvZiBhbiBhcnJheSBvZiBzYWlkDQo+ID4g
c3RydWN0dXJlLg0KPiA+IEluc3RlYWQgb2YgZnVuY3Rpb24gcG9pbnRlcnMsIHRoaXMgc3RydWN0
dXJlIChhbmQgaXRzIHNpemUpIGlzIHRoZW4NCj4gPiBhc3NpZ25lZCB0byBlYWNoIFNvQydzIHBs
YXRmb3JtIGRhdGEuDQo+ID4gDQo+ID4gVGhlICJjYWxjdWxhdGlvbiIgaXMgdGhlbiBwZXJmb3Jt
ZWQgd2l0aCBhIG5ldyBzdGF0aWMgZnVuY3Rpb24NCj4gPiBtdGtfZHBpX2NhbGN1bGF0ZV9mYWN0
b3IoZHBpLCBtb2RlX2NsaykgdGhhdCBpdGVyYXRlcyB0aHJvdWdoIGFsbA0KPiA+IG9mIHRoZSBl
bnRyaWVzIG9mIHRoZSBhZm9yZW1lbnRpb25lZCBhcnJheSBhbmQgcmV0dXJucyB0aGUgcmlnaHQN
Cj4gPiBmYWN0b3IuDQo+ID4gDQo+ID4gSWYgbm8gZmFjdG9yIGlzIGZvdW5kLCB0aGUgbG93ZXN0
IHBvc3NpYmxlIGZhY3RvciBpcyByZXR1cm5lZCwNCj4gPiBtaW1pY2tpbmcgdGhlIHNhbWUgZmxv
dyBhcyBhbGwgb2YgdGhlIG9sZCBwZXItU29DIGNhbGN1bGF0aW9uDQo+ID4gZnVuY3Rpb25zLg0K
PiA+IA0KPiA+IFRoaXMgY29tbWl0IGJyaW5ncyBubyBmdW5jdGlvbmFsIGNoYW5nZS4NCj4gDQoN
CltzbmlwXQ0KDQo+ID4gIHN0YXRpYyBpbnQgbXRrX2RwaV9zZXRfZGlzcGxheV9tb2RlKHN0cnVj
dCBtdGtfZHBpICpkcGksDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
c3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUpDQo+ID4gIHsNCj4gPiBAQCAtNTI5LDcgKzU1
MCw3IEBAIHN0YXRpYyBpbnQgbXRrX2RwaV9zZXRfZGlzcGxheV9tb2RlKHN0cnVjdCBtdGtfZHBp
ICpkcGksDQo+ID4gICAgICAgICB1bnNpZ25lZCBpbnQgZmFjdG9yOw0KPiA+IA0KPiA+ICAgICAg
ICAgLyogbGV0IHBsbF9yYXRlIGNhbiBmaXggdGhlIHZhbGlkIHJhbmdlIG9mIHR2ZHBsbCAoMUd+
MkdIeikgKi8NCj4gPiAtICAgICAgIGZhY3RvciA9IGRwaS0+Y29uZi0+Y2FsX2ZhY3Rvcihtb2Rl
LT5jbG9jayk7DQo+ID4gKyAgICAgICBmYWN0b3IgPSBtdGtfZHBpX2NhbGN1bGF0ZV9mYWN0b3Io
ZHBpLCBtb2RlX2Nsayk7DQoNCm1vZGVfY2xrIGlzIGRlZmluZWQgaW4gbmV4dCBwYXRjaC4NCmtl
ZXAgbW9kZS0+Y2xvY2sgaW4gdGhpcyBwYXRjaCB0byBrZWVwIG15IHJldmlld2VkLWJ5IHRhZy4N
Cg0KUmVnYXJkcywNCkNLDQoNCj4gPiAgICAgICAgIGRybV9kaXNwbGF5X21vZGVfdG9fdmlkZW9t
b2RlKG1vZGUsICZ2bSk7DQo+ID4gICAgICAgICBwbGxfcmF0ZSA9IHZtLnBpeGVsY2xvY2sgKiBm
YWN0b3I7DQo+ID4gDQo+ID4gQEAgLTk2NCw0OCArOTg1LDYgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBjb21wb25lbnRfb3BzIG10a19kcGlfY29tcG9uZW50X29wcyA9IHsNCj4gPiAgICAgICAgIC51
bmJpbmQgPSBtdGtfZHBpX3VuYmluZCwNCj4gPiAgfTsNCj4gPiANCg0KDQo=

--__=_Part_Boundary_005_1245943777.1480847710
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtBbmdlbG86DQoNCk9uJiMzMjtGcmksJiMz
MjsyMDI0LTExLTIyJiMzMjthdCYjMzI7MTE6NTQmIzMyOyswODAwLCYjMzI7Q0smIzMyO0h1JiMz
Mjt3cm90ZToNCiZndDsmIzMyO0hpLCYjMzI7QW5nZWxvOg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtP
biYjMzI7V2VkLCYjMzI7MjAyNC0xMS0yMCYjMzI7YXQmIzMyOzEzOjQ0JiMzMjsrMDEwMCwmIzMy
O0FuZ2Vsb0dpb2FjY2hpbm8mIzMyO0RlbCYjMzI7UmVnbm8mIzMyO3dyb3RlOg0KJmd0OyYjMzI7
Jmd0OyYjMzI7RXh0ZXJuYWwmIzMyO2VtYWlsJiMzMjs6JiMzMjtQbGVhc2UmIzMyO2RvJiMzMjtu
b3QmIzMyO2NsaWNrJiMzMjtsaW5rcyYjMzI7b3ImIzMyO29wZW4mIzMyO2F0dGFjaG1lbnRzJiMz
Mjt1bnRpbCYjMzI7eW91JiMzMjtoYXZlJiMzMjt2ZXJpZmllZCYjMzI7dGhlJiMzMjtzZW5kZXIm
IzMyO29yJiMzMjt0aGUmIzMyO2NvbnRlbnQuDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMy
OyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7U2V0dGluZyYjMzI7dGhlJiMzMjtUVkQmIzMy
O1BMTCYjMzI7Y2xvY2smIzMyO3JlcXVpcmVzJiMzMjt0byYjMzI7bXVsdGlwbHkmIzMyO3RoZSYj
MzI7dGFyZ2V0JiMzMjtwaXhlbA0KJmd0OyYjMzI7Jmd0OyYjMzI7Y2xvY2smIzMyO2J5JiMzMjth
JiMzMjtzcGVjaWZpYyYjMzI7Y29uc3RhbnQmIzMyO2ZhY3RvciYjMzI7dG8mIzMyO2FjaGlldmUm
IzMyO3RoZSYjMzI7dGFyZ2V0JiMzMjtQTEwNCiZndDsmIzMyOyZndDsmIzMyO2ZyZXF1ZW5jeSwm
IzMyO2FuZCYjMzI7dGhpcyYjMzI7aXMmIzMyO2RvbmUmIzMyO3RvJiMzMjtyZWR1Y2UmIzMyO2pp
dHRlciYjMzI7dG8mIzMyO2FjY2VwdGFibGUmIzMyO2xldmVscy4NCiZndDsmIzMyOyZndDsmIzMy
Ow0KJmd0OyYjMzI7Jmd0OyYjMzI7T24mIzMyO2FsbCYjMzI7TWVkaWFUZWsmIzMyO1NvQ3MsJiMz
Mjt0aGUmIzMyO2ZhY3RvciYjMzI7aXMmIzMyO25vdCYjMzI7cmV0cmlldmVkJiMzMjtieSYjMzI7
YW55JiMzMjtyZWFsJiMzMjtraW5kDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtvZiYjMzI7Y2FsY3VsYXRp
b24mIzMyO2J1dCYjMzI7cmF0aGVyJiMzMjtieSYjMzI7Y2hlY2tpbmcmIzMyO2lmJiMzMjt0aGUm
IzMyO3RhcmdldCYjMzI7cGl4ZWwmIzMyO2Nsb2NrDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtpcyYjMzI7
bGVzcyYjMzI7dGhhbiYjMzI7YSYjMzI7c3BlY2lmaWVkJiMzMjtmcmVxdWVuY3ksJiMzMjtoZW5j
ZSYjMzI7YXNzaWduaW5nJiMzMjthJiMzMjtmdW5jdGlvbg0KJmd0OyYjMzI7Jmd0OyYjMzI7cG9p
bnRlciYjMzI7Zm9yJiMzMjtqdXN0JiMzMjthJiMzMjtidW5jaCYjMzI7b2YmIzMyO2lmJiMzMjti
cmFuY2hlcyYjMzI7ZG9lcyYjMzI7ZW5sYXJnZSYjMzI7dGhlJiMzMjtjb2RlDQomZ3Q7JiMzMjsm
Z3Q7JiMzMjtzaXplJiMzMjtmb3ImIzMyO2xpdHRsZSYjMzI7cmVhc29uLg0KJmd0OyYjMzI7Jmd0
OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtSZW1vdmUmIzMyO2FsbCYjMzI7U29DLXNwZWNpZmlj
JiMzMjtmdW5jdGlvbnMsJiMzMjthZGQmIzMyO2EmIzMyO3N0cnVjdHVyZSYjMzI7JiM5NjttdGtf
ZHBpX2ZhY3RvciYjOTY7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjt0aGF0JiMzMjtob2xkcyYjMzI7YSYj
MzI7Y2xvY2smIzMyO2ZyZXF1ZW5jeSYjMzI7YW5kJiMzMjtjb3JyZXNwb25kaW5nJiMzMjtQTEwm
IzMyO2ZhY3RvciwmIzMyO2FuZA0KJmd0OyYjMzI7Jmd0OyYjMzI7ZGVjbGFyZSYjMzI7dGhlJiMz
Mjtjb25zdHJhaW50cyYjMzI7Zm9yJiMzMjtlYWNoJiMzMjtTb0MmIzMyO2luJiMzMjtmb3JtJiMz
MjtvZiYjMzI7YW4mIzMyO2FycmF5JiMzMjtvZiYjMzI7c2FpZA0KJmd0OyYjMzI7Jmd0OyYjMzI7
c3RydWN0dXJlLg0KJmd0OyYjMzI7Jmd0OyYjMzI7SW5zdGVhZCYjMzI7b2YmIzMyO2Z1bmN0aW9u
JiMzMjtwb2ludGVycywmIzMyO3RoaXMmIzMyO3N0cnVjdHVyZSYjMzI7KGFuZCYjMzI7aXRzJiMz
MjtzaXplKSYjMzI7aXMmIzMyO3RoZW4NCiZndDsmIzMyOyZndDsmIzMyO2Fzc2lnbmVkJiMzMjt0
byYjMzI7ZWFjaCYjMzI7U29DJiMzOTtzJiMzMjtwbGF0Zm9ybSYjMzI7ZGF0YS4NCiZndDsmIzMy
OyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7VGhlJiMzMjsmcXVvdDtjYWxjdWxhdGlvbiZx
dW90OyYjMzI7aXMmIzMyO3RoZW4mIzMyO3BlcmZvcm1lZCYjMzI7d2l0aCYjMzI7YSYjMzI7bmV3
JiMzMjtzdGF0aWMmIzMyO2Z1bmN0aW9uDQomZ3Q7JiMzMjsmZ3Q7JiMzMjttdGtfZHBpX2NhbGN1
bGF0ZV9mYWN0b3IoZHBpLCYjMzI7bW9kZV9jbGspJiMzMjt0aGF0JiMzMjtpdGVyYXRlcyYjMzI7
dGhyb3VnaCYjMzI7YWxsDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtvZiYjMzI7dGhlJiMzMjtlbnRyaWVz
JiMzMjtvZiYjMzI7dGhlJiMzMjthZm9yZW1lbnRpb25lZCYjMzI7YXJyYXkmIzMyO2FuZCYjMzI7
cmV0dXJucyYjMzI7dGhlJiMzMjtyaWdodA0KJmd0OyYjMzI7Jmd0OyYjMzI7ZmFjdG9yLg0KJmd0
OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtJZiYjMzI7bm8mIzMyO2ZhY3RvciYj
MzI7aXMmIzMyO2ZvdW5kLCYjMzI7dGhlJiMzMjtsb3dlc3QmIzMyO3Bvc3NpYmxlJiMzMjtmYWN0
b3ImIzMyO2lzJiMzMjtyZXR1cm5lZCwNCiZndDsmIzMyOyZndDsmIzMyO21pbWlja2luZyYjMzI7
dGhlJiMzMjtzYW1lJiMzMjtmbG93JiMzMjthcyYjMzI7YWxsJiMzMjtvZiYjMzI7dGhlJiMzMjtv
bGQmIzMyO3Blci1Tb0MmIzMyO2NhbGN1bGF0aW9uDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtmdW5jdGlv
bnMuDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyO1RoaXMmIzMyO2NvbW1p
dCYjMzI7YnJpbmdzJiMzMjtubyYjMzI7ZnVuY3Rpb25hbCYjMzI7Y2hhbmdlLg0KJmd0OyYjMzI7
DQoNCltzbmlwXQ0KDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMyO3N0YXRpYyYjMzI7aW50JiMzMjtt
dGtfZHBpX3NldF9kaXNwbGF5X21vZGUoc3RydWN0JiMzMjttdGtfZHBpJiMzMjsqZHBpLA0KJmd0
OyYjMzI7Jmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7c3RydWN0JiMzMjtkcm1fZGlzcGxheV9tb2RlJiMzMjsq
bW9kZSkNCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7ew0KJmd0OyYjMzI7Jmd0OyYjMzI7QEAmIzMy
Oy01MjksNyYjMzI7KzU1MCw3JiMzMjtAQCYjMzI7c3RhdGljJiMzMjtpbnQmIzMyO210a19kcGlf
c2V0X2Rpc3BsYXlfbW9kZShzdHJ1Y3QmIzMyO210a19kcGkmIzMyOypkcGksDQomZ3Q7JiMzMjsm
Z3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7dW5zaWduZWQm
IzMyO2ludCYjMzI7ZmFjdG9yOw0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7LyomIzMyO2xldCYjMzI7
cGxsX3JhdGUmIzMyO2NhbiYjMzI7Zml4JiMzMjt0aGUmIzMyO3ZhbGlkJiMzMjtyYW5nZSYjMzI7
b2YmIzMyO3R2ZHBsbCYjMzI7KDFHJiMxMjY7MkdIeikmIzMyOyovDQomZ3Q7JiMzMjsmZ3Q7JiMz
MjstJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtmYWN0b3ImIzMyOz0mIzMyO2Rw
aS0mZ3Q7Y29uZi0mZ3Q7Y2FsX2ZhY3Rvcihtb2RlLSZndDtjbG9jayk7DQomZ3Q7JiMzMjsmZ3Q7
JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtmYWN0b3ImIzMyOz0mIzMy
O210a19kcGlfY2FsY3VsYXRlX2ZhY3RvcihkcGksJiMzMjttb2RlX2Nsayk7DQoNCm1vZGVfY2xr
JiMzMjtpcyYjMzI7ZGVmaW5lZCYjMzI7aW4mIzMyO25leHQmIzMyO3BhdGNoLg0Ka2VlcCYjMzI7
bW9kZS0mZ3Q7Y2xvY2smIzMyO2luJiMzMjt0aGlzJiMzMjtwYXRjaCYjMzI7dG8mIzMyO2tlZXAm
IzMyO215JiMzMjtyZXZpZXdlZC1ieSYjMzI7dGFnLg0KDQpSZWdhcmRzLA0KQ0sNCg0KJmd0OyYj
MzI7Jmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO2RybV9k
aXNwbGF5X21vZGVfdG9fdmlkZW9tb2RlKG1vZGUsJiMzMjsmYW1wO3ZtKTsNCiZndDsmIzMyOyZn
dDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtwbGxfcmF0ZSYj
MzI7PSYjMzI7dm0ucGl4ZWxjbG9jayYjMzI7KiYjMzI7ZmFjdG9yOw0KJmd0OyYjMzI7Jmd0OyYj
MzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtAQCYjMzI7LTk2NCw0OCYjMzI7Kzk4NSw2JiMzMjtAQCYj
MzI7c3RhdGljJiMzMjtjb25zdCYjMzI7c3RydWN0JiMzMjtjb21wb25lbnRfb3BzJiMzMjttdGtf
ZHBpX2NvbXBvbmVudF9vcHMmIzMyOz0mIzMyO3sNCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsudW5iaW5kJiMzMjs9JiMzMjttdGtfZHBp
X3VuYmluZCwNCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7fTsNCiZndDsmIzMyOyZndDsmIzMyOw0K
DQoNCg0KPC9wcmU+DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48
cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZSAqKioqKioq
KioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBt
ZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRpYWws
IHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Ns
b3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNvbnZl
eWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1p
bmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9m
IHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQg
cmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVs
LiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9y
IGJlbGlldmUgDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCBw
bGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhp
cyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwgKGlu
Y2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QNCmRp
c2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24uIFRo
YW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_005_1245943777.1480847710--

