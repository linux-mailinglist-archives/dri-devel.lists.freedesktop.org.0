Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5A178237B
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 08:14:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDC2710E1B6;
	Mon, 21 Aug 2023 06:14:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1B5410E1B6
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 06:14:07 +0000 (UTC)
X-UUID: eca631d63fe911eeb20a276fd37b9834-20230821
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=MiTzHpEIYmKUB7nJj/RHo58sKN56PBHGRZAJ/wTxDSE=; 
 b=ePiuVTnSz9WWLKnDbuPFfiy4JUxbKDLDNjqjPJ0GT7HCDMn+4zCkiUH1e8bo6FzfCfr9UHVL8QvAmZB2AhFYD6ooQNfw57MqoSksmZ8a8vv6yLQNhmHBQ71416rAMcPUZ7fPtLWSk5EeRiWMe0+MhpzNg92LW6aVLDuNrnMESoQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31, REQID:9b75e7ef-f116-445a-9662-052817eeed81, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:0ad78a4, CLOUDID:a0fc8e1f-33fd-4aaa-bb43-d3fd68d9d5ae,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: eca631d63fe911eeb20a276fd37b9834-20230821
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1142938822; Mon, 21 Aug 2023 14:14:02 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 21 Aug 2023 14:14:01 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Mon, 21 Aug 2023 14:14:01 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aEqCubCXCeLmoVJXBF50V7Ni5uPTjAEKVsqTkTR7i2e05K23l2tLQ2iau1kioZo6Ug9xMs7waN6C12+Y4yXjciLc9sUZ2qf541se3bL3BEYjKq9Zv/hCK3oyOSit6ibWjswyh74Zu5Iz5/Vljo+jpc5XvJ09OkdbPrb7iAQjzQx9AXK+qbwfRb2qODw3L6ehPXnEgVFB7rkyQv2d3nEROGuX1YHSoZydWuPNS2AZTJ3rib596KmIMKYONi670mfyAe7iqjBT35TpzrUFLoTq0V50bLWgKjfuZRshwXhtymWd2mQuX784LrI7CFl3mKxvAGt7g7/5uFT5iNNLUaIXvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yBPHOLf7rsfSwOWccuOVuBYF3cDwCxGd2Me4R6aT2Ss=;
 b=ggJf+qiwY9aFgfgUnK1nVQZE6bUyI8G6G1VAaHfMmUEp+8oxM2Po+hUSrILs9MKls2Vwo7Kv7JEGWcBuGEfzsAZfGxibq/j9yeAZwqpaiQxAOfg6liljxZGOIrpGt/yKDVh2ZqhGQWBtH4fT5vrEBEasE5vVw5JkwhAgjT/Kee+fFS2J+kHgOaCO/DMI4DmW7rQrWCW20CybPOnPdNtbqBkdPvPQnPoNpH+tI96bJ1jpL7jiHmo6WvTa+V1p5KgD8U2c+gMoL9VSVVsPGrS10hhk8idBqFJ6WPdq44wUEZIoNZlUTJQ5jTiRNELBSzKLk5Ge3ZKlGcIGWak858faZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yBPHOLf7rsfSwOWccuOVuBYF3cDwCxGd2Me4R6aT2Ss=;
 b=fBchqAOWihuR5qA1F38vW86RcSGYHgN6MopXFt8UIp4ZmiRePTNu30KpSYDxMDRhcIwO3yv0ydqtaumP/NzuGmbFldACt6k6V+cF/4J+6rJcgpdpwPAmeTBVLQVSfQgDyj7UBz6q/Onf+u1kQc5BrbQiuUmu5lJWNj8ibqdIeuE=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SI2PR03MB6859.apcprd03.prod.outlook.com (2603:1096:4:1f8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Mon, 21 Aug
 2023 06:13:58 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::d126:7f34:9e4f:a95]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::d126:7f34:9e4f:a95%4]) with mapi id 15.20.6678.029; Mon, 21 Aug 2023
 06:13:58 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?U2h1aWppbmcgTGkgKOadjuawtOmdmSk=?= <Shuijing.Li@mediatek.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?=
 <jitao.shi@mediatek.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, "airlied@gmail.com" <airlied@gmail.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v5,4/4] drm/mediatek: dp: Add support MT8188 dp/edp
 function
Thread-Topic: [PATCH v5,4/4] drm/mediatek: dp: Add support MT8188 dp/edp
 function
Thread-Index: AQHZ0NPU24OOWNH5V0OU15OsSP+qc6/0S66A
Date: Mon, 21 Aug 2023 06:13:58 +0000
Message-ID: <1d41747060c613ca0ae8e3b6395cc33bfa4d9056.camel@mediatek.com>
References: <20230817062635.8786-1-shuijing.li@mediatek.com>
 <20230817062635.8786-5-shuijing.li@mediatek.com>
In-Reply-To: <20230817062635.8786-5-shuijing.li@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SI2PR03MB6859:EE_
x-ms-office365-filtering-correlation-id: b60d42db-0d05-41ba-08c5-08dba20dce77
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sGecEeYo+7EdhiT4cxA0v1GJjUWNlYMkw/965Cjq5dtDxvZerzMiW0JOzz8x5yRBhquEo3q7TfKfYQulheKCjUwUvUIgNRRRwgMX26YHhKOLfLNscbZ1kgeAX3r/5M4FtHLTKbp80CHuceibSdROrQZnvf4ydPq+m7pOlEjjsAAjGfOjKRV51jcFpT+PBChIQ1Ty++CjvEptPwmP92fiRiXaFmALj9oD7aXf+heRTH/jD+hkGZ4fqE/gW0dyJ9awP5Clq5LXudBlL83Ob08fyH7V93KZSdNTnN/TaZO9+nOt3lcPKe2I3AIuI8xQe+7CdGX45VXz2yw4oXhQS1m0wGtOFdajEL5cZTdeOYL9yoilWg0569wtPDYC23AOKxKlGP4ja4QsDhWUmM4a1fZqA+CAwUh4n6b1rfHLKNycfemTTVxxAg+42uZgs2CBZjotAMmvv5qDi+QNQNVomAjm/Fste1q+ZwyhMhuZa8+QyGbXB62+Ylh1TkkLtotntDd0RhierZJx9PgRr1MCMKX48jLGWnFoyrtz6IlssbKNquNx3Y+hFkU0aofnNALCYftBGQp8pj9UvddJFyuSvz/zu0xwittyoNgwgFQLCQlwy3EVkmn9Qea9ALaWgQHajiX4YpnD5PIBB3Sf82pmhS38oTgqwYv1FwvrW9vDPG7DSXX7DKaS+5WRyJzi5Jz7CJPw
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(346002)(366004)(376002)(396003)(1800799009)(186009)(451199024)(64756008)(2616005)(107886003)(6512007)(71200400001)(6486002)(26005)(6506007)(83380400001)(8676002)(4326008)(8936002)(5660300002)(2906002)(7416002)(478600001)(41300700001)(966005)(110136005)(76116006)(316002)(66946007)(66446008)(66476007)(66556008)(54906003)(38070700005)(38100700002)(122000001)(85182001)(86362001)(36756003)(12101799020)(921005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZDBMcFQvSEdtZGRaREoxRUlGQXB4TGJ6OFZSUE1VOXl2RW5ackdrVGRFMXJ1?=
 =?utf-8?B?NnVwaDZZbzc4cFRlL1p6M2JZR3JVM04xNS9xZFowQ1NIdC9tMEZrakxYbWl1?=
 =?utf-8?B?b29kY0t4NHJ4emtJamNyekZhR2ltZ0xwZWVhc3Fuc3BXdHo1QkV0OURydVdw?=
 =?utf-8?B?d3hFSSthZlVlc0UrV0pEUnBTeGw3SEFoS2V6NzNXSGlXLys1MldJYThKQ0hh?=
 =?utf-8?B?alBuSUVOV08yYzZ5TTNFVStuQXZMcS96NzhjUTFDbTNIcmIwbWFjSUxZREkr?=
 =?utf-8?B?ZmtOeTVTQWptMk1CM2pOZHhlemV0Sk1xRWxnK2JaZjBLZ3hpUzY0UzU2Nmx3?=
 =?utf-8?B?QnNxSU9qOFlEN3prRmk1TSs4MWR0NUROeDA2Y3JYdGs4bFpLVUlxdGdIeU1h?=
 =?utf-8?B?N2RCVEZRc0FFbWtjSjVkTnJxbzI0MmdJR1FDdi8rQlI0RGN1d1RqN2EyNE4z?=
 =?utf-8?B?eVl5LzVaMU1od0dUTGJKZXcrRWJQSlJ5ajd6REI0QjlCb0xxRTUwcERoMkMy?=
 =?utf-8?B?Y0lKSjhNUTJNeEY5OXdTMkF3YlNmYWdoVTk0bGlNUW8vR0djZ1EzNkNYNDQ3?=
 =?utf-8?B?R3A0eFRERFN5OTJ1aFc2RVR3WEU4N1cwaXlOQUZYSHBrNGpWTFlvTE1lQ1ZH?=
 =?utf-8?B?QzIwUFRPcUc1OUFCY3RQeXlCWU9sMEVucEo4RWxGV1NwZWljS2U3UXBicHVr?=
 =?utf-8?B?bWtINkNyYjN6Q3FXd0hCVG43eFBsTW82UnRwY01aMVRjdVUzZzJteGlZaG5x?=
 =?utf-8?B?aldVYllscHZTVS9HWjVROHJ1ZkN0Q1F3UjUxTEZOckR2MFpUUk9NSUFIYzVm?=
 =?utf-8?B?OXdLYTB5UGd6NDNkV3g3OVdUKzRmeXZhMk1zbFV6dUdwN3JRYjc5NjlJK0RV?=
 =?utf-8?B?R01RV0FXYlpKTTNJQlptSHJUSDlQdW8xVHJGYUxFNkFEb2JQbVA3NTE3L3d1?=
 =?utf-8?B?UWZJalV0dUxiOFFrZjh2ek9wN0RUaWVCZUhPcnJpdlE1ajJCcm9tTXFWQUlL?=
 =?utf-8?B?NERMVUduMEpnUUpudmRyM2RzR3M1aWtKOStIMXFCb0MyUVIvRW8va0htTHlX?=
 =?utf-8?B?Q1B2RDJSdWFKcjkwSWh6bDJPTVREZEx0b2JYbGtHc1hiMjFEdy9TMWRaQ1Rq?=
 =?utf-8?B?ZnFLT1Ixd2tyZ3BQTFc0aWNOcEY0bWZDTEFmdkZzT21nQU9oZXBKRVNEVk5I?=
 =?utf-8?B?TVgrUDZNWTRUbTdWbkJ5WGhvQ1REOUtGUUxtQU56UWFiam9LZ2VESFpYQUlw?=
 =?utf-8?B?bURkenl6SkJ0YjAyWE1OUHh3VmZENFRuc0huMy9xMVcyYko1aTBvMFh5Njhq?=
 =?utf-8?B?dGNscW9WZGU0UzBXMjJpYU1aR1BDcHNzVWdrU0RGalhyajV5dGpzNlpnUXpa?=
 =?utf-8?B?WDlSSGhOVFVCVDdnUStHcG82U1BoQ1lSK1Z2THNSa0x6cXdhcFpJWlY4a2tq?=
 =?utf-8?B?cENzaldITGJOR3FLZ29GWlNwV1EvUDJEOTR6OFRpcm5DVFpPODZ3aTZqZ0o4?=
 =?utf-8?B?NTlrMVhKSVlXWCtCaXNqdGtLQU5VL1orREQxZGpGSG1uVU5Pcmt1Z2ZwRysx?=
 =?utf-8?B?QzVnbDJFYndOZnE2TE1kWUx6OTQzKzZkQUJQSmVqL1lDOFgyMjBkTGx1M2Vi?=
 =?utf-8?B?SW03MzB2clpHSG9ITmMwcW1pVXJsNytNWmJDNkdJSDVhakYwRFJTai93eDlo?=
 =?utf-8?B?ZnhmdVcvWEFxLzByeWdGVVB1UWFkalV1aFluTE9oaVpDbmw3bVFBOXVWclNQ?=
 =?utf-8?B?N0pJcTI5cDdIeTdYQVF6ZDcwMnduMjJsS0hnQmV0WFplNTFYdUMxc0NFTytl?=
 =?utf-8?B?dkltazdBVkt3SWhETjN2OEVJZXdlY05FcVNBRVpyYUIrTlJhUFgrNlpSZUUw?=
 =?utf-8?B?VDY1VDhSTHlmWnFNdUNRUFFZL0VKV0cyOVVmendoT3pxQTVDWHdRYk5VRmFq?=
 =?utf-8?B?SkVud2xKTTd5SE9wSW1JTm8zTHhVUWRmalpHRENkQlprbjVIV0ovQm8xbFBu?=
 =?utf-8?B?bVlYazVjYXFZdU1pQzAwYVhRVk5vbmI0UnhSaFhucFVzY3ZNcGdvamtCOHIx?=
 =?utf-8?B?aHJud24xa3RtZGxPMHJ1L0pNVEk3Y1h2c0FNeG9uQ1IvbDJrSHVrRXArV2x5?=
 =?utf-8?Q?WwNDJlLGQrVJ4XpsruTJDN4if?=
Content-ID: <5B8E3D1F996C72429BB388D12E3EC85C@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b60d42db-0d05-41ba-08c5-08dba20dce77
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2023 06:13:58.4670 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MZGY2NFiP5KvOv8Z7RbtjHsgQC96Y5ufxd9Qe4h/t6u9lc/ZyyO7Mpb8HlXVqofTPJrTMjbK+/WLyjfPK533aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB6859
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_008_760615272.1880702177"
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_008_760615272.1880702177
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpLCYjMzI7U2h1aWppbmc6DQoNCk9uJiMzMjtUaHUsJiMzMjsyMDIzLTA4LTE3JiMz
MjthdCYjMzI7MTQ6MjYmIzMyOyswODAwLCYjMzI7U2h1aWppbmcmIzMyO0xpJiMzMjt3cm90ZToN
CiZndDsmIzMyO0FkZCYjMzI7bXRrX2RwX2F1ZGlvX3NhbXBsZV9hcnJhbmdlX2Rpc2FibGUmIzMy
O2Z1bmN0aW9uJiMzMjtmb3ImIzMyO01UODE4OC4NCiZndDsmIzMyOw0KJmd0OyYjMzI7U2lnbmVk
LW9mZi1ieTomIzMyO1NodWlqaW5nJiMzMjtMaSYjMzI7Jmx0O3NodWlqaW5nLmxpQG1lZGlhdGVr
LmNvbSZndDsNCiZndDsmIzMyOy0tLQ0KJmd0OyYjMzI7Q2hhbmdlcyYjMzI7aW4mIzMyO3Y1Og0K
Jmd0OyYjMzI7U2VwYXJhdGUmIzMyO210ODE4OCYjMzI7cmVsYXRlZCYjMzI7Y29kZSYjMzI7aW50
byYjMzI7bXRrX2RwX2RhdGEmIzMyO3N0cnVjdHVyZSYjMzI7YW5kJiMzMjttdDgxODgNCiZndDsm
IzMyO2RwL2VkcCYjMzI7ZnVuY3Rpb24NCiZndDsmIzMyO3BlciYjMzI7c3VnZ2VzdGlvbiYjMzI7
ZnJvbSYjMzI7dGhlJiMzMjtwcmV2aW91cyYjMzI7dGhyZWFkOg0KJmd0OyYjMzI7DQpodHRwczov
L2xvcmUua2VybmVsLm9yZy9sa21sL2MxYzg0NjE2ZjNkYTgzYThhMmJjMjQ1YjBkM2M3Njk3MTUz
Y2Q4MWEuY2FtZWxAbWVkaWF0ZWsuY29tLw0KJmd0OyYjMzI7LS0tDQomZ3Q7JiMzMjsmIzMyO2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHAuYyYjMzI7fCYjMzI7MTMmIzMyOysrKysrKysr
KysrKysNCiZndDsmIzMyOyYjMzI7MSYjMzI7ZmlsZSYjMzI7Y2hhbmdlZCwmIzMyOzEzJiMzMjtp
bnNlcnRpb25zKCspDQomZ3Q7JiMzMjsNCiZndDsmIzMyO2RpZmYmIzMyOy0tZ2l0JiMzMjthL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHAuYw0KJmd0OyYjMzI7Yi9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RwLmMNCiZndDsmIzMyO2luZGV4JiMzMjtmYjExMDM3NGFkMWYuLjY3
OTg2ZGQ3YzlkNyYjMzI7MTAwNjQ0DQomZ3Q7JiMzMjstLS0mIzMyO2EvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kcC5jDQomZ3Q7JiMzMjsrKysmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kcC5jDQomZ3Q7JiMzMjtAQCYjMzI7LTEzNjQsNiYjMzI7KzEzNjQsMTgmIzMy
O0BAJiMzMjtzdGF0aWMmIzMyO3ZvaWQNCiZndDsmIzMyO210a19kcF9zZHBfc2V0X2Rvd25fY250
X2luaXRfaW5faGJsYW5rKHN0cnVjdCYjMzI7bXRrX2RwJiMzMjsqbXRrX2RwKQ0KJmd0OyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjtTRFBfRE9XTl9DTlRfSU5JVF9JTl9IQkxBTktfRFBfRU5DMV9Q
MF9NQVNLKQ0KJmd0OyYjMzI7Ow0KJmd0OyYjMzI7JiMzMjt9DQomZ3Q7JiMzMjsmIzMyOw0KJmd0
OyYjMzI7K3N0YXRpYyYjMzI7dm9pZCYjMzI7bXRrX2RwX2F1ZGlvX3NhbXBsZV9hcnJhbmdlX2Rp
c2FibGUoc3RydWN0JiMzMjttdGtfZHANCiZndDsmIzMyOyptdGtfZHApDQomZ3Q7JiMzMjsrew0K
Jmd0OyYjMzI7Ky8qJiMzMjthcnJhbmdlJiMzMjthdWRpbyYjMzI7cGFja2V0cyYjMzI7aW50byYj
MzI7dGhlJiMzMjtIYmxhbmtpbmcmIzMyO2FuZCYjMzI7VmJsYW5raW5nJiMzMjthcmVhDQomZ3Q7
JiMzMjsqLw0KJmd0OyYjMzI7K2lmJiMzMjsoIW10a19kcC0mZ3Q7ZGF0YS0mZ3Q7YXVkaW9fcGt0
X2luX2hibGFua19hcmVhKQ0KJmd0OyYjMzI7K3JldHVybjsNCiZndDsmIzMyOysNCiZndDsmIzMy
OyttdGtfZHBfdXBkYXRlX2JpdHMobXRrX2RwLCYjMzI7TVRLX0RQX0VOQzFfUDBfMzM3NCwmIzMy
OzAsDQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7U0RQX0FTUF9JTlNFUlRfSU5fSEJMQU5LX0RQ
X0VOQzFfUDBfTUFTSyk7DQomZ3Q7JiMzMjsrbXRrX2RwX3VwZGF0ZV9iaXRzKG10a19kcCwmIzMy
O01US19EUF9FTkMxX1AwXzMzNzQsJiMzMjswLA0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyO1NE
UF9ET1dOX0FTUF9DTlRfSU5JVF9EUF9FTkMxX1AwX01BU0spOw0KJmd0OyYjMzI7K30NCg0KTW92
ZSYjMzI7dGhpcyYjMzI7dG8mIzMyO3BhdGNoJiMzMjsmcXVvdDtbMi80XSYjMzI7QWRkJiMzMjt0
aGUmIzMyO2F1ZGlvJiMzMjtwYWNrZXQmIzMyO2ZsYWcmcXVvdDsNCg0KJmd0OyYjMzI7Kw0KJmd0
OyYjMzI7JiMzMjtzdGF0aWMmIzMyO3ZvaWQmIzMyO210a19kcF9zZXR1cF90dShzdHJ1Y3QmIzMy
O210a19kcCYjMzI7Km10a19kcCkNCiZndDsmIzMyOyYjMzI7ew0KJmd0OyYjMzI7JiMzMjt1MzIm
IzMyO3NyYW1fcmVhZF9zdGFydCYjMzI7PSYjMzI7bWluX3QodTMyLA0KJmd0OyYjMzI7TVRLX0RQ
X1RCQ19CVUZfUkVBRF9TVEFSVF9BRERSLA0KJmd0OyYjMzI7QEAmIzMyOy0xMzczLDYmIzMyOysx
Mzg1LDcmIzMyO0BAJiMzMjtzdGF0aWMmIzMyO3ZvaWQmIzMyO210a19kcF9zZXR1cF90dShzdHJ1
Y3QmIzMyO210a19kcA0KJmd0OyYjMzI7Km10a19kcCkNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjtNVEtfRFBfUElYX1BFUl9BRERSKTsNCiZndDsmIzMyOyYjMzI7bXRrX2RwX3Nl
dF9zcmFtX3JlYWRfc3RhcnQobXRrX2RwLCYjMzI7c3JhbV9yZWFkX3N0YXJ0KTsNCiZndDsmIzMy
OyYjMzI7bXRrX2RwX3NldHVwX2VuY29kZXIobXRrX2RwKTsNCiZndDsmIzMyOyttdGtfZHBfYXVk
aW9fc2FtcGxlX2FycmFuZ2VfZGlzYWJsZShtdGtfZHApOw0KDQpEaXR0by4NCg0KUmVnYXJkcywN
CkNLDQoNCiZndDsmIzMyOyYjMzI7bXRrX2RwX3NkcF9zZXRfZG93bl9jbnRfaW5pdF9pbl9oYmxh
bmsobXRrX2RwKTsNCiZndDsmIzMyOyYjMzI7bXRrX2RwX3NkcF9zZXRfZG93bl9jbnRfaW5pdCht
dGtfZHAsJiMzMjtzcmFtX3JlYWRfc3RhcnQpOw0KJmd0OyYjMzI7JiMzMjt9DQoNCjwvcHJlPjwh
LS10eXBlOnRleHQtLT48IS0tey0tPjxwcmU+KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRl
bnRpYWxpdHkgTm90aWNlICoqKioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29u
dGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50
cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVy
d2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlz
IGludGVuZGVkIHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGll
bnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywg
cmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRh
Y2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRl
ZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lw
aWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZSANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQg
dGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0
ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3Bp
ZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3Vy
IHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwg
dG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_008_760615272.1880702177
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIFNodWlqaW5nOg0KDQpPbiBUaHUsIDIwMjMtMDgtMTcgYXQgMTQ6MjYgKzA4MDAsIFNodWlq
aW5nIExpIHdyb3RlOg0KPiBBZGQgbXRrX2RwX2F1ZGlvX3NhbXBsZV9hcnJhbmdlX2Rpc2FibGUg
ZnVuY3Rpb24gZm9yIE1UODE4OC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFNodWlqaW5nIExpIDxz
aHVpamluZy5saUBtZWRpYXRlay5jb20+DQo+IC0tLQ0KPiBDaGFuZ2VzIGluIHY1Og0KPiBTZXBh
cmF0ZSBtdDgxODggcmVsYXRlZCBjb2RlIGludG8gbXRrX2RwX2RhdGEgc3RydWN0dXJlIGFuZCBt
dDgxODgNCj4gZHAvZWRwIGZ1bmN0aW9uDQo+IHBlciBzdWdnZXN0aW9uIGZyb20gdGhlIHByZXZp
b3VzIHRocmVhZDoNCj4gDQpodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sL2MxYzg0NjE2ZjNk
YTgzYThhMmJjMjQ1YjBkM2M3Njk3MTUzY2Q4MWEuY2FtZWxAbWVkaWF0ZWsuY29tLw0KPiAtLS0N
Cj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHAuYyB8IDEzICsrKysrKysrKysrKysN
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcC5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kcC5jDQo+IGluZGV4IGZiMTEwMzc0YWQxZi4uNjc5ODZkZDdjOWQ3IDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwLmMNCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcC5jDQo+IEBAIC0xMzY0LDYgKzEzNjQsMTggQEAg
c3RhdGljIHZvaWQNCj4gbXRrX2RwX3NkcF9zZXRfZG93bl9jbnRfaW5pdF9pbl9oYmxhbmsoc3Ry
dWN0IG10a19kcCAqbXRrX2RwKQ0KPiAgCQkJICAgU0RQX0RPV05fQ05UX0lOSVRfSU5fSEJMQU5L
X0RQX0VOQzFfUDBfTUFTSykNCj4gOw0KPiAgfQ0KPiAgDQo+ICtzdGF0aWMgdm9pZCBtdGtfZHBf
YXVkaW9fc2FtcGxlX2FycmFuZ2VfZGlzYWJsZShzdHJ1Y3QgbXRrX2RwDQo+ICptdGtfZHApDQo+
ICt7DQo+ICsJLyogYXJyYW5nZSBhdWRpbyBwYWNrZXRzIGludG8gdGhlIEhibGFua2luZyBhbmQg
VmJsYW5raW5nIGFyZWENCj4gKi8NCj4gKwlpZiAoIW10a19kcC0+ZGF0YS0+YXVkaW9fcGt0X2lu
X2hibGFua19hcmVhKQ0KPiArCQlyZXR1cm47DQo+ICsNCj4gKwltdGtfZHBfdXBkYXRlX2JpdHMo
bXRrX2RwLCBNVEtfRFBfRU5DMV9QMF8zMzc0LCAwLA0KPiArCQkJICAgU0RQX0FTUF9JTlNFUlRf
SU5fSEJMQU5LX0RQX0VOQzFfUDBfTUFTSyk7DQo+ICsJbXRrX2RwX3VwZGF0ZV9iaXRzKG10a19k
cCwgTVRLX0RQX0VOQzFfUDBfMzM3NCwgMCwNCj4gKwkJCSAgIFNEUF9ET1dOX0FTUF9DTlRfSU5J
VF9EUF9FTkMxX1AwX01BU0spOw0KPiArfQ0KDQpNb3ZlIHRoaXMgdG8gcGF0Y2ggIlsyLzRdIEFk
ZCB0aGUgYXVkaW8gcGFja2V0IGZsYWciDQoNCj4gKw0KPiAgc3RhdGljIHZvaWQgbXRrX2RwX3Nl
dHVwX3R1KHN0cnVjdCBtdGtfZHAgKm10a19kcCkNCj4gIHsNCj4gIAl1MzIgc3JhbV9yZWFkX3N0
YXJ0ID0gbWluX3QodTMyLA0KPiBNVEtfRFBfVEJDX0JVRl9SRUFEX1NUQVJUX0FERFIsDQo+IEBA
IC0xMzczLDYgKzEzODUsNyBAQCBzdGF0aWMgdm9pZCBtdGtfZHBfc2V0dXBfdHUoc3RydWN0IG10
a19kcA0KPiAqbXRrX2RwKQ0KPiAgCQkJCSAgICBNVEtfRFBfUElYX1BFUl9BRERSKTsNCj4gIAlt
dGtfZHBfc2V0X3NyYW1fcmVhZF9zdGFydChtdGtfZHAsIHNyYW1fcmVhZF9zdGFydCk7DQo+ICAJ
bXRrX2RwX3NldHVwX2VuY29kZXIobXRrX2RwKTsNCj4gKwltdGtfZHBfYXVkaW9fc2FtcGxlX2Fy
cmFuZ2VfZGlzYWJsZShtdGtfZHApOw0KDQpEaXR0by4NCg0KUmVnYXJkcywNCkNLDQoNCj4gIAlt
dGtfZHBfc2RwX3NldF9kb3duX2NudF9pbml0X2luX2hibGFuayhtdGtfZHApOw0KPiAgCW10a19k
cF9zZHBfc2V0X2Rvd25fY250X2luaXQobXRrX2RwLCBzcmFtX3JlYWRfc3RhcnQpOw0KPiAgfQ0K

--__=_Part_Boundary_008_760615272.1880702177--

