Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34ABF6193AA
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 10:37:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAF3410E722;
	Fri,  4 Nov 2022 09:37:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF67610E722
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 09:37:49 +0000 (UTC)
X-UUID: 09a13a9b8fa14beda9783817ea1e4cbe-20221104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=jKZ45ziWvuwlTAA2eMUY71juxANEOY/1xnf1xQqshPw=; 
 b=VzN3DelNJ0DtxPR0Uho6/A1Hc4x1X/HNyhPLtdHiaT4rT7sDMY/d53b2B4m6Nzd2fwDjdfaHG3JkNXbst3bM8mmdKVPcijvZPSSCcvlo8pbRPdyMM6q42DzqrsNv9zH3i1jbqjfQyIXyPRYkGX6QUtlinLL2MyWkf8lhwrtR7Po=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12, REQID:8cd96f04-45d5-46a5-b0a8-812805ef9d03, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:28,RULE:Release_Ham,ACTIO
 N:release,TS:23
X-CID-INFO: VERSION:1.1.12, REQID:8cd96f04-45d5-46a5-b0a8-812805ef9d03, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:28,RULE:Release_Ham,ACTION:
 release,TS:23
X-CID-META: VersionHash:62cd327, CLOUDID:b56572eb-84ac-4628-a416-bc50d5503da6,
 B
 ulkID:2211040503281UYX1RAC,BulkQuantity:8,Recheck:0,SF:17|19|102,TC:nil,Co
 ntent:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40|20,QS:nil,BEC:nil,COL:0
X-UUID: 09a13a9b8fa14beda9783817ea1e4cbe-20221104
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1926772144; Fri, 04 Nov 2022 17:37:33 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 4 Nov 2022 17:37:32 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n1.mediatek.com (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.792.15 via Frontend Transport; Fri, 4 Nov 2022 17:37:32 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hbWsKdIL8vXdYOm2j1sWvNpTDLSLpVfjfMaozSHTwrAqRe3wjhZCcT/xkYToLfTj18qMjW0Zx5G7bPhM9CgEhhxazRJ0ion2OOmbSES6mKP2dnlv4qZxy+aab36ZUT/nOZ/kbejZ43J7qI3EXkIvcZjGN0rPXkWZZAILZX8QR8SLpELKPyS2fQAgAiXIQNss7J8Rg/VWZIQZnIDgSmYfyoucaJfR2nzF6ziOGPlwDsoBiMICI4WxVCxtXUlgVMRW+aSUgWA94bZw3WvHRIrsvL0MGio52bdR80wURsiwvD6fUmPr/3deRtW7imzlyeu2AQKrme2+Q7POqvAyEufbJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EvEdrJjSyIi9FmqtnTFdOEweRyNMcuNEXxqemkImADw=;
 b=O25DoypCM7cbPiI8GAzG+bOohsqOVKC29a9Pqh6QsQYEP23ejTu/hsEfJU6xnwZIBrBYC2IzlDXlnjZhqR+gCkStAPBI5L7Jwha7bLHkkLlAyXSG5oACbNx3o7Y346MrVksGMzOzir2hprOzpwpyVM1YQ9LNI4fwpIVD3WTEQVvY9dxL5qkycaWoH2b4nOVNS5Y+gotvEqK0r4TKVleiGx3Xk9O4LjIE5kdsVU+Tx36+pC6QLEqnbr/xGtD5VF8lS7XJYt2ZqOHk8Jk52R574z7AtETR/mzcJX4agPjPAbjv65OKntMwc4Dv2dXpiKsO6dJ0fmjiTlSJhrAInUPIsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EvEdrJjSyIi9FmqtnTFdOEweRyNMcuNEXxqemkImADw=;
 b=fY1+MKxJH3n8+t+CfFM83HHXfkg4d/1kVt9K468Q/ra8RQ6tYCmAePiF1rDriU6lW9rwjyFqQGbnT8IbrNKBB2FgmZaWDH63u4u1+7NGZxwpyOnUcZbJsg8Ftf2vHzV9+nLgwWM+PFgUgTEVZexYKsz4ix/omCpGW22RByNoWLY=
Received: from KL1PR03MB5175.apcprd03.prod.outlook.com (2603:1096:820:8::11)
 by PSAPR03MB6234.apcprd03.prod.outlook.com (2603:1096:301:9b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Fri, 4 Nov
 2022 09:37:29 +0000
Received: from KL1PR03MB5175.apcprd03.prod.outlook.com
 ([fe80::8cda:5c09:3c2e:19]) by KL1PR03MB5175.apcprd03.prod.outlook.com
 ([fe80::8cda:5c09:3c2e:19%7]) with mapi id 15.20.5791.020; Fri, 4 Nov 2022
 09:37:29 +0000
From: =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>
To: "nfraprado@collabora.com" <nfraprado@collabora.com>
Subject: Re: [PATCH v27 2/7] drm/mediatek: add ETHDR support for MT8195
Thread-Topic: [PATCH v27 2/7] drm/mediatek: add ETHDR support for MT8195
Thread-Index: AQHY7zQjpIVEF/5XUkm/CB1yRDcjA64tsPmAgADSuQA=
Date: Fri, 4 Nov 2022 09:37:29 +0000
Message-ID: <aef16e8fb787491e4cdba4b472f73aec38efe21c.camel@mediatek.com>
References: <20221103032610.9217-1-nancy.lin@mediatek.com>
 <20221103032610.9217-3-nancy.lin@mediatek.com>
 <20221103210315.lm2d3n4uolra44no@notapiano>
In-Reply-To: <20221103210315.lm2d3n4uolra44no@notapiano>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB5175:EE_|PSAPR03MB6234:EE_
x-ms-office365-filtering-correlation-id: 1a63af73-2cb5-4b5e-a4e6-08dabe4830ea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: P7qEI5sDZNWP/rKeZtlrXBYfX4Z4IdGUqsWrUur24MssKQtHUtzRM+uxG55ZBMoitGavvgJQzd94Jwc01XacNUDQ7ZH5DJPAJ8OB8b/1Sk8tKIt6ENfiMjYwWJ4iC+qeV8y2yMB1/EwOejwwt8U1H/REkuyIDdJG8cuaYTwRsCp6mYcM8MD14M0y+HbT0VEQ4ZMvdvI20rWzntZ31Av5yCc5oB9HZoQGzLcGp0X/R9UitjpKw7iih2nmq31gIli6AowWD9iQH4IOfDHFbBiuWg042ibAfKBF7ocXDEp0epoDj+aybC7AahNXR0e8KlXV1DtawZ7HAvdU71ErkL3TF6IQrvup+k2Ljj7v+Cj4I6vVwQADM51352wOaQbSm7YfviKTr7rVvjDkZEMrwUqtn/AhclwEMd3GcAvuu6wz7HZqR/vL62lBVBWpPdArZiASNZVy17MuGNyyYnLc/MSJjWFoX8oBOlPUKyGokid01q5EPFPbQegIFq73Us31xPpxzSYOpgIpYA+dHS/Jc12G7L2fn+WwVCJ6of72WUf+sRTgjjXXt9g1LN4qP87LtrxC/L2TyYE0F3G3TIzqtB4ImZNIguTNGvAFxbQk56kn9RXaNdbJZp73CsMfDY7Wgf8IJUCWUw1OttDkfNgwGdYo015cS+/x725B5z1xa0JUOyvwnJnvzAZrn0viCZRIAQ7PrlQF1mUVQQ4TkJZqvBut+TenJ87dSbPB8O0Ep0patXcMg1SFxie45dQK6SM1rJqIe9tn3kReYuoyV4ZLxF2TsA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR03MB5175.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(39860400002)(136003)(366004)(396003)(451199015)(38070700005)(86362001)(8936002)(4326008)(41300700001)(85182001)(36756003)(8676002)(66556008)(64756008)(76116006)(6512007)(66476007)(66446008)(66946007)(4744005)(186003)(5660300002)(2616005)(7416002)(6486002)(478600001)(71200400001)(6506007)(122000001)(91956017)(54906003)(6916009)(316002)(26005)(38100700002)(66574015)(2906002)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cGo3RVl2MHBES2V6SDR2cUdWdGxxZ2VITnVCa2FFckZXRGRBU0NnRE5YRDd2?=
 =?utf-8?B?TEt1aldQcnI1MldiMm93Y2s5YUt2RUlocTFnQVhMNUwvSWFVbTNJYThTZmVv?=
 =?utf-8?B?ejM3MjJrb0Y0SGYxVTZzV1g5dGZvQUgzS3hFZjRQWDdRcWdTaEhvUG8rNTRR?=
 =?utf-8?B?M0ZKbWowV3pPMXErMHpUYnI5TTRERUJ3aXZsRVl0Vk5sY3NhTHZ3eXFlOXpP?=
 =?utf-8?B?SDV2cmdoa3NLUWJWYkFXSzIrcXZiSWFZaFhyd1dBNmpZKzNOZHNWVitIMXQ3?=
 =?utf-8?B?SWwyZHJWb0FKLzRuMUY4ZWRUcitxdVlpYWZ4U3oyYzlIclB0TG1DV3B6NVJV?=
 =?utf-8?B?ZExnaFBteU5adTBNWnpXT3lPd2JzYWJNYzVlVGVLUzVEUHBMd0tuZnhSNU9H?=
 =?utf-8?B?UzN4LzRRRlV6SkdMS1JKY2VzakZvTW5JV0dlSHFNTEtyNzltZEMwT21IdndB?=
 =?utf-8?B?clNld1QwTnVNUERWdm00VnpwSFVLaUwwOFkvKzltbFVSTjRETU9lOFhhdUNI?=
 =?utf-8?B?blNybkN3S2ZYcm9FSDNBV1ZSR04xY1d6a2djQTFrVW01SkNKMWsrV2hEQmJh?=
 =?utf-8?B?a2JuNHA0cjgvQ21veGRGcy85RXh2NEszL1paMFBqc2t3dWJ3U1NrOThnUVpM?=
 =?utf-8?B?Rk9jL1V5ckc0WWRuR01CQU9BNmRuaDQ5c0xPMXBJMjMyaVU3a0pJTFFVdlBP?=
 =?utf-8?B?eTRCQTZLY0w1eWRuR1RxUTBKRDZUY2RRMWxmTWpXVk9oeTN5VUtSajBLeGFa?=
 =?utf-8?B?RHpDQUtQZWpDTDVoNnF1UEZydlJldE1aYUEwcCtaa3F0VEFJREhSblNubzVn?=
 =?utf-8?B?VzlSd2RJVjJJeVFIMWpIL1VmQVI0RDFzcVU3MTRFL1BrQkNueWJsWDdBQkxo?=
 =?utf-8?B?R0Exd2pGVW43d05iU0gzVDUrcVFXdGp4bDI3QjV4TldXVUVGOEZHTkt1aFg0?=
 =?utf-8?B?cmRMN2E2clhTUGJ2dnRlY0xKdnRRVm0vSkdOYXhpUlR5bitiNGVYelFWOGtV?=
 =?utf-8?B?N3RJSnlmTC9IalBrWGdwQU93VTZranlDRE8zOTZ4TFZhYVBwaHN5aWZielBk?=
 =?utf-8?B?dWhqL1lvNGdNNUFyak1LZk1MNEhiR1l6d1FsempRQWE5VGJIdGNUakR1aWtC?=
 =?utf-8?B?WFdINDdsV2hoVlB2ZFoxeUd4Zk1aRG44L2E4bHBlUU04WUZFVUIyQlFHWE5M?=
 =?utf-8?B?VlB3cjRhaGZ6dWgxbGYxM0VhZGNyUzFnN3MreVRhYnZieWY4SUtieXhNWGFp?=
 =?utf-8?B?RDBWVDYwYzdNem03dGdhRngxOUEyL3ZBT05kbG50dTQveExUcUREVnBYVmsx?=
 =?utf-8?B?ZkdMRE01WE5BZ1dyQTIzMmNzUUNhVUZjQzhuR3V3aHdrWVFjdkorYXJFRU9K?=
 =?utf-8?B?a3RSQTdiTWhjeEZoZjhJTU1IcHZ6UzdoOEowMEtHdWRhdHV3c3UrQ2hCall2?=
 =?utf-8?B?R00xY3lyYTFGRitFaU5sWkdzMlFXdXRSM3VQemVhNXVQa0wzU1dGYnZvYVYv?=
 =?utf-8?B?RDR6S2FpcGRyaXhUYi9mRW5ZY0h1SHV3N3VXZ2UrdkxIcDRFY1F6ak1IZW9K?=
 =?utf-8?B?MWZHOERrSVk0R0ZsSTRoNHBtdS92VFk5eldQVW1BMVMrcXhnY1RrWERwVWVy?=
 =?utf-8?B?NnJkTzJJWm9HZmxqK0MzaWkzNXBGL1pZTmZvWjdiSjNocDAxcm9yOUFHcTRK?=
 =?utf-8?B?VXA5Sk5RKzV5RWhsc1psK2RmSjhORTJOTXZFeXViTkRMUG1mRkh3ZGV0aU1o?=
 =?utf-8?B?OHlKelVjVSs2YmcyQjMzdUw0cC9wQlZxcG9hc2xMYU4rb0laV0RqNFh0NW82?=
 =?utf-8?B?MzlaOS9RdFlNRHlPR3hmdTJFYmNwQ3RyUjhZRG91UisxZTdWeWVBcE9XTml4?=
 =?utf-8?B?Y0tnUk9ubCsvaTVQNWNIYzkwOVRYWVhtNUhWWlhxV0hib0N3QWlTMm1JNDdL?=
 =?utf-8?B?NHlkU1Z1WWkyYVY0Z1JMeWtrTmlySWpXUngwR0JKYVgrVkpONHBWcTNqZjEv?=
 =?utf-8?B?RXMzdyt5QzdXcVlRM1dKT2Q4bW9DNFlHekFCdTFJandtSkY3Ujh4a2luZXZm?=
 =?utf-8?B?TzdSb0tQbzVYeEN1cDZMVHQxS21SVGpGbGlLTHZiMDhUV05YQ1dsUjhJdVlU?=
 =?utf-8?B?aWFRN1IyZDYrUURRRnM0KzNxOVZHQzhPTFozQ1JwR3l6Zkx3T0ZjeSs0ODBl?=
 =?utf-8?B?OUE9PQ==?=
Content-ID: <1A89DB71564C5348B6DF978C5F613121@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5175.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a63af73-2cb5-4b5e-a4e6-08dabe4830ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2022 09:37:29.3484 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fam0k0yYLZHPmuCN945u/HdnUlp/7BvhpLiT4UCszAlSYYoXepuHhUpThCC4auh5WkHRmHWSR88hUrI86uv9WA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR03MB6234
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_007_1987321547.1254639678"
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
Cc: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
 "ndesaulniers@google.com" <ndesaulniers@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nathan@kernel.org" <nathan@kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 =?utf-8?B?WW9uZ3FpYW5nIE5pdSAo54mb5rC45by6KQ==?= <yongqiang.niu@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
 "linux@roeck-us.net" <linux@roeck-us.net>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_007_1987321547.1254639678
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkRlYXImIzMyO05pY29sYXMsDQoNClRoYW5rcyYjMzI7Zm9yJiMzMjt0aGUmIzMyO3Jl
dmlldy4NCg0KT24mIzMyO1RodSwmIzMyOzIwMjItMTEtMDMmIzMyO2F0JiMzMjsxNzowMyYjMzI7
LTA0MDAsJiMzMjtOJiMyMzc7Y29sYXMmIzMyO0YuJiMzMjtSLiYjMzI7QS4mIzMyO1ByYWRvJiMz
Mjt3cm90ZToNCiZndDsmIzMyO09uJiMzMjtUaHUsJiMzMjtOb3YmIzMyOzAzLCYjMzI7MjAyMiYj
MzI7YXQmIzMyOzExOjI2OjA1QU0mIzMyOyswODAwLCYjMzI7TmFuY3kuTGluJiMzMjt3cm90ZToN
CiZndDsmIzMyO1suLl0NCiZndDsmIzMyOyZndDsmIzMyOy0tLSYjMzI7L2Rldi9udWxsDQomZ3Q7
JiMzMjsmZ3Q7JiMzMjsrKysmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19ldGhk
ci5oDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1suLl0NCiZndDsmIzMyOyZndDsmIzMyOyt2b2lkJiMz
MjttdGtfZXRoZHJfdW5yZWdpc3Rlcl92YmxhbmtfY2Ioc3RydWN0JiMzMjtkZXZpY2UmIzMyOypk
ZXYpOw0KJmd0OyYjMzI7Jmd0OyYjMzI7K3ZvaWQmIzMyO210a19ldGhkcl9lbmFibGVfdmJsYW5r
KHN0cnVjdCYjMzI7ZGV2aWNlJiMzMjsqZGV2KTsNCiZndDsmIzMyOyZndDsmIzMyOyt2b2lkJiMz
MjttdGtfZXRoZHJfZGlzYWJsZV92Ymxhbmsoc3RydWN0JiMzMjtkZXZpY2UmIzMyOypkZXYpOw0K
Jmd0OyYjMzI7Jmd0OyYjMzI7KyNlbmRpZg0KJmd0OyYjMzI7Jmd0OyYjMzI7Kw0KJmd0OyYjMzI7
DQomZ3Q7JiMzMjtBcyYjMzI7d2FybmVkJiMzMjtieSYjMzI7Z2l0JiMzMjt3aGVuJiMzMjthcHBs
eWluZyYjMzI7dGhlJiMzMjtwYXRjaCwmIzMyO3lvdSYjMzI7aGF2ZSYjMzI7YW4mIzMyO2V4dHJh
JiMzMjtuZXcmIzMyO2xpbmUNCiZndDsmIzMyO2F0JiMzMjt0aGUmIzMyO2VuZA0KJmd0OyYjMzI7
aGVyZS4NCiZndDsmIzMyOw0KJmd0OyYjMzI7QXBwbHlpbmc6JiMzMjtkcm0vbWVkaWF0ZWs6JiMz
MjthZGQmIzMyO0VUSERSJiMzMjtzdXBwb3J0JiMzMjtmb3ImIzMyO01UODE5NQ0KJmd0OyYjMzI7
LmdpdC9yZWJhc2UtYXBwbHkvcGF0Y2g6NDU0OiYjMzI7bmV3JiMzMjtibGFuayYjMzI7bGluZSYj
MzI7YXQmIzMyO0VPRi4NCiZndDsmIzMyOysNCiZndDsmIzMyO3dhcm5pbmc6JiMzMjsxJiMzMjts
aW5lJiMzMjthZGRzJiMzMjt3aGl0ZXNwYWNlJiMzMjtlcnJvcnMuDQoNCkkmIzMyO3dpbGwmIzMy
O2ZpeCYjMzI7aXQuDQoNClRoYW5rcw0KTmFuY3kNCg0KPC9wcmU+PCEtLXR5cGU6dGV4dC0tPjwh
LS17LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2Ug
KioqKioqKioqKioqKioqKioqKioNClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBl
LW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlk
ZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJv
bSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUg
DQpjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwg
ZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29w
eWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmlu
dGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1
bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1t
YWlsLCBvciBiZWxpZXZlIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBl
cnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5n
IHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1t
YWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8g
bm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVy
c29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_007_1987321547.1254639678
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

RGVhciBOaWNvbGFzLA0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXcuDQoNCk9uIFRodSwgMjAyMi0x
MS0wMyBhdCAxNzowMyAtMDQwMCwgTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gd3JvdGU6DQo+IE9u
IFRodSwgTm92IDAzLCAyMDIyIGF0IDExOjI2OjA1QU0gKzA4MDAsIE5hbmN5LkxpbiB3cm90ZToN
Cj4gWy4uXQ0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2V0aGRyLmgNCj4gDQo+IFsuLl0NCj4gPiArdm9pZCBtdGtfZXRoZHJfdW5yZWdp
c3Rlcl92YmxhbmtfY2Ioc3RydWN0IGRldmljZSAqZGV2KTsNCj4gPiArdm9pZCBtdGtfZXRoZHJf
ZW5hYmxlX3ZibGFuayhzdHJ1Y3QgZGV2aWNlICpkZXYpOw0KPiA+ICt2b2lkIG10a19ldGhkcl9k
aXNhYmxlX3ZibGFuayhzdHJ1Y3QgZGV2aWNlICpkZXYpOw0KPiA+ICsjZW5kaWYNCj4gPiArDQo+
IA0KPiBBcyB3YXJuZWQgYnkgZ2l0IHdoZW4gYXBwbHlpbmcgdGhlIHBhdGNoLCB5b3UgaGF2ZSBh
biBleHRyYSBuZXcgbGluZQ0KPiBhdCB0aGUgZW5kDQo+IGhlcmUuDQo+IA0KPiBBcHBseWluZzog
ZHJtL21lZGlhdGVrOiBhZGQgRVRIRFIgc3VwcG9ydCBmb3IgTVQ4MTk1DQo+IC5naXQvcmViYXNl
LWFwcGx5L3BhdGNoOjQ1NDogbmV3IGJsYW5rIGxpbmUgYXQgRU9GLg0KPiArDQo+IHdhcm5pbmc6
IDEgbGluZSBhZGRzIHdoaXRlc3BhY2UgZXJyb3JzLg0KDQpJIHdpbGwgZml4IGl0Lg0KDQpUaGFu
a3MNCk5hbmN5DQo=

--__=_Part_Boundary_007_1987321547.1254639678--

