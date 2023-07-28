Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D07D47665CC
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 09:54:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90F1410E67D;
	Fri, 28 Jul 2023 07:54:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29CC110E665
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 07:54:14 +0000 (UTC)
X-UUID: f075007a2d1b11ee9cb5633481061a41-20230728
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=eFlXagHENj8X0J5b8fm4m9XDbDiPDlm+vwu3U1ZzMwI=; 
 b=WPq28BbBoeG6a+l1VcFuT8eM9EjQbM2aPg4wGsqqqxBOEVXC+1FJyvOAtUQ1Tq31sR0B0/cz10PVfwGIm970G+Ha/xwS3faajVhwgGkwOD2vl00wpHV9jYGFB07aHC2l8SGxWBAXXPE/cD6nlvL26C2N7aJLa4SgBcFi8yE1pw4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.30, REQID:952380e7-ec9a-4ed5-b55f-fe9965510bde, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:45
X-CID-INFO: VERSION:1.1.30, REQID:952380e7-ec9a-4ed5-b55f-fe9965510bde, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:45
X-CID-META: VersionHash:1fcc6f8, CLOUDID:109be3b3-a467-4aa9-9e04-f584452e3794,
 B
 ulkID:230728155412VEL24BSR,BulkQuantity:0,Recheck:0,SF:38|29|28|17|19|48|1
 02,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:nil,QS:nil,BEC:ni
 l,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:PA,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR, TF_CID_SPAM_SDM, TF_CID_SPAM_FAS,
 TF_CID_SPAM_FSD, TF_CID_SPAM_ULN
X-UUID: f075007a2d1b11ee9cb5633481061a41-20230728
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1253280614; Fri, 28 Jul 2023 15:54:11 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 28 Jul 2023 15:54:10 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Fri, 28 Jul 2023 15:54:10 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TOZvLi3D6NpMSHt47iLK1VJqWN9XtxjWq+5XXXGX+sFqidQKXfDho2cbEwYYpsutJaKBW1EQbk3x7YKLfOPqZEu0++k1ollZDSlNVGL39yfolXAan7wzUfrOIN/Xii32bTTPseSg3Btdc3/nFjfCi7lmWOPL7u+s46j+mAo/Z8wcidDqjoiYCnIaKRXBniIePHGzHmABUBRE1RXXY/ZwqI/ieq4jFSZ8aJBC7CQ/MKUPJh7B0TGwnGfojCBI9OcNq0pIy3EaKJ9nP5tZ+ogAhnikLace9vOR/gkGRodsbYN0qxdFRO+P/aW2AVVRGCugX9+5PgZ41rvcweuo3p7q8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N0l/KWrqizG7wRxWcRuXTUPGF62vrxu7HR3Sd7QhgzU=;
 b=SIfFGjy78ajdHOrIndiMJlmAO4AhsKSli/i37bjIvyjg+SGfMZBDWlPTGTjWbeMCOPIEiskcHJNCfHuHC6Rl9SC4nci4kT5PcXLVu/6rO0n4eLrgEWlvzMM1OJOr5G9XYKhLX/81hfXe04ewdz8mYWCPNAaO3ty7e8vhpLpl7/kn685omc647HUD/9Ff6odJDXuqOOQfXo+y1p6U6GWQbhI822vg4JqWHtlQuoXQB9z6AqmXUQafTu3E9X5yNk0pd9rDyEEwgVF5SZpgzahcwK2EE9HCcNHgKXgXcZl8tQMF1oRHtlZ32H4TTp7Ir6GJBmSlPHDASMU5bWhN0k42Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N0l/KWrqizG7wRxWcRuXTUPGF62vrxu7HR3Sd7QhgzU=;
 b=F4wmZXrlYZ7evzVIxdzkK7Q6A9li8v2YugpqOWv7V2x48FC16FFoAZbUwxRlFkRgMESs72jlJYH6xFItKoC+l/oboX9s5dF38GX/zVH6o9n4uSxgplfd/Y24HRmUFoyCmkYbm3DaCJXfCSRibS86TjBIf+mICHXx0MGTFQ3px2c=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KL1PR03MB8164.apcprd03.prod.outlook.com (2603:1096:820:ff::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Fri, 28 Jul
 2023 07:53:12 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::d126:7f34:9e4f:a95]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::d126:7f34:9e4f:a95%4]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 07:53:12 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, 
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v7 1/4] drm/mediatek: Add mmsys_dev_num to mt8188 vdosys0
 driver data
Thread-Topic: [PATCH v7 1/4] drm/mediatek: Add mmsys_dev_num to mt8188 vdosys0
 driver data
Thread-Index: AQHZwKk4HfkzhGIMM06gXp4K6tA+ua/Oz8mA
Date: Fri, 28 Jul 2023 07:53:12 +0000
Message-ID: <7ccff501df5909936e27e352b08aee4c6276ffe6.camel@mediatek.com>
References: <20230727164114.20638-1-jason-jh.lin@mediatek.com>
 <20230727164114.20638-2-jason-jh.lin@mediatek.com>
In-Reply-To: <20230727164114.20638-2-jason-jh.lin@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KL1PR03MB8164:EE_
x-ms-office365-filtering-correlation-id: 5e625d90-963c-4045-9326-08db8f3fb185
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jcb+4bPPpSPUzjnnVUk/eph/e8CiIlx1FWI4NPaJIzsyjuhmtEC07wl4mNYM0CBADqpCgj0JiGhyaXSg3aDS4Q66tA9p2pQ/9XOgpVVP/ucsp8yG75qxMsfxG/Q0tD0RDtwPJUxp2PrWPrIJHyWQ7wn6OGcxTNwTk3neQvN+dsgOxzsAhgnt1z0HRjzgVFj5amdxUN/Mp3raHh4fUL45ACZR9dRGZLQ5EXs+1AlJhzHhEFmG6WAM6E+dOi6YlIOnJDKucCcC0qXbG0kUZ17UlwCDeFImQR3t9KwbSScghVdIOuZovM+4qRHQVy3tUewTXcrD7nm7WwgmsF00EJMmCNS62LOXRJXhk7ENPSDD/VqjS6+mvGRgIraFv/DmJHo+x3fooPeUWwFN4KPQoprh/3dXXqmKTiOo2yqqSBn8iEZHrNJ4lBcA4/4AsqdtN8wzJLt5O60WVOFaTNkaA3WJ41m01UiwRAazR4NKKmumxxuGpJ5nIHSoOvd3cRLSFZ7XvRrRA7ttVwsGUiC+iFQTBfu4yACV3bg8z4d4D0aCsMH9sxZPgmKT+KfOLG83yzfOMe3H/veZuQMKhWIkP1P9Q4WSD4wnGBJx/XPqIfUhTxSJ7T5j5faD/rLZZmwSEvuJI8WGKWHlPTOLmXK8BgkyWNZrH4PIG7dPjrM/PpaP8XM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(396003)(39860400002)(366004)(346002)(136003)(451199021)(6512007)(26005)(6506007)(54906003)(36756003)(110136005)(86362001)(85182001)(38100700002)(316002)(38070700005)(5660300002)(4744005)(76116006)(66556008)(66476007)(41300700001)(4326008)(66446008)(8676002)(71200400001)(66946007)(64756008)(8936002)(2906002)(6486002)(478600001)(122000001)(2616005)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TkhIVWsyUGhZMXZ6ejIwY2ZudWpkWFVZaDJRZTNGRlBQc2FVRVNFV2RPSkg0?=
 =?utf-8?B?bnFYc0pkSCtOeGdsM1Y1MFFYa1p6Qmtpbld2SU9LVllsb2dQeit0Y2E5RTFO?=
 =?utf-8?B?RGI0UzdmZFR0b21KYTE5VUlucVV5eXdHRFdwM2pHRjl5eDl5NlZpT29HSDZR?=
 =?utf-8?B?bXpBNVcrUWdTVHNkcEJwMGhlcGpnMFZwZDM2bWtsWnpaWFVaWGg0TVk2dkVM?=
 =?utf-8?B?N1ZuYVJiQncxVnVqVkJXQWY1V1VpbHUxQU1GVUNtUFg5dW5PcjBKS2E5RDFE?=
 =?utf-8?B?TWk2NXNTSVJFMHpPbWZlekpTZWN6aHA2cDAxd2pBczNQSU9KQnpSQWo5U2Y4?=
 =?utf-8?B?Um12WmppcGNZcGo3WlBnb3p3UzVuVFBLTUtweGJsWm5VcXNoa2JUbG1HMU9M?=
 =?utf-8?B?YkVmaC8rcWxLRDlRemZZTTFTWDhMRm1ncm1wTTlTbEJpQW5xVnFwakJNN05P?=
 =?utf-8?B?ZjM0T0ZIZHJFYWtnV25seXNCYU9aZjkzbVpaTnoxaVRSdys4dXEvdFVkS3JO?=
 =?utf-8?B?cHZXdUMzZlJZbzFtcGhPVFFmbmllNS9NU2QveVIzN01HUUx6QUhleHpMVW5C?=
 =?utf-8?B?UzZET3RWU3dBc0xrVXNRTHJQQk9GOHdOVnhobzdWdkVQUUo1cDZ2WEw2cEt2?=
 =?utf-8?B?YktpZlFPWldEQlJFMjBpYUpyaGRneVZRR3ZldkN6czJVWmhmK05SWEwxSmlr?=
 =?utf-8?B?T2MxeEx1N1Rma2wzRUwzOTVGQjlJS09taC9IWXBKMTk3RC9kQ1ovYU9NRDBN?=
 =?utf-8?B?RG1aS0F6UEZUbFQvYVQ1M0tpY3orcVRwMjBFd2FvaTF5NTJxRGVZYmgzd3lz?=
 =?utf-8?B?eEx1Mk1hTk1leTUvNUVQay8wUzJVbEJRdnZ6ckZaRDY2dUNDQmhpOGcyQWg3?=
 =?utf-8?B?UHZmWkpUWkZxbnZtMUNqK2w1UEVXTFRDUUJUVlB5YXNNZCtEUUpxWWliMHBu?=
 =?utf-8?B?REh1SHM4cHFXMVBwMERCSHhwaGtNNWlkMzhvSFlRcVNobmVnUjE2TldzS1FL?=
 =?utf-8?B?QWNPUDZWbE5OUXNRZHV4VkF5bUVZTE9FSmY4T1QyS3VOZXRXVVFIY2tOSHU2?=
 =?utf-8?B?akFsNVk0ajFEdnhKMWR6Ym9BVEdaWWI4NDhsalN1NmxXYVZOamNUNWQranRF?=
 =?utf-8?B?QTlXSklNS0dDK0pSQmFYR2hXSXV6SWtsbFE0SXA5eGViYURRM3lCMjEreUkz?=
 =?utf-8?B?d3l4L0p1NUE4NlRzUmEzTWF5UXBISDlUa0R5ZjJKTTZGcFlWVVhxbXVWTU05?=
 =?utf-8?B?cTBSaEgvYzRyUlkyZ1V2SGdxMURoTG5ERWNpT0ltMW90QWczaG1nNE8vMURK?=
 =?utf-8?B?bkxHbzc5VGNOTGtJTlEwbkdOd284TFVlMU56dzIydE1GenZpTGdIdnV4STl1?=
 =?utf-8?B?cjM4RnlKeUpLcjg3V1ZmOEZnT0ZJeG9CRGNSY0R6bmlMZklmcitaNTFOLzVG?=
 =?utf-8?B?ZTNYc1pIaFVPWlZZNEk5RXpWMGEvcWlwWVVNWEdvYVVIQXMzWUgyb21ycnRV?=
 =?utf-8?B?RUk1OTJ5M3pQVkUxTmxrdUM1Z1hYMjM4TE0xaTMzazhHVmExK1I1L2lCMXdB?=
 =?utf-8?B?b3pTYk5IalNJcVVZRmZxSlVpQmNwT2dRMVNKYjlhM0Rsd2ZVZlFFZG51UWF5?=
 =?utf-8?B?aGExQ2hRVW9LYVVGQ1JkY1hCQUo5MmFqN3ZNNVlndWNMNUxuM05yTWtBL1li?=
 =?utf-8?B?SkZMblBwRFNDTlNzS2tpTmhoVmNRSU9kS2VFRkFlVlFkWWw4VTV0RkpOYU1C?=
 =?utf-8?B?WC9Xa3doRW5xMkhjTzl0WGJ4Z0Ftb0VzZTJZOFJKQ04zVUd1RnlIQlVzbnBY?=
 =?utf-8?B?Slp5NXNRWVRSVWkxS3QyT1hRK1lHWHdkM0FMR25JeHZzWjBOMXRvUmhKc2Ni?=
 =?utf-8?B?TEthWjFyWHBBUW8zWE9QekFmTW9jbHVQQjZlNzdGM2RzWkZXRDY1cWtWWkI0?=
 =?utf-8?B?MzVwS2licFRqRG11RDNzYm54Q1RDR1o3TnF2azBoNlQ3djZrdHZZV1pNZ1lj?=
 =?utf-8?B?Q2JFS3NQcFdYRlNkd3gvS29nWjBoTnIvSjcxakVtN081TXFCOTZUL0ROdjBo?=
 =?utf-8?B?UTRLYW12c0N4eE81RVVTWTAxV0ZWRG43cytIaGwvdDhyYlQxU2FvUk5nck44?=
 =?utf-8?Q?KVXqRnGl3SDxq2drdCPOwDLqb?=
Content-ID: <8BBDF13B9A592C4E93655585DFAAADBF@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e625d90-963c-4045-9326-08db8f3fb185
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2023 07:53:12.6523 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8drPCeuSDqmf+uVPKx1REatONtv2y/bSFvgSmfm9JEF9DHcU44wDHSipp32g8d5838zmNIvQLzwUpBE5Q+r9jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8164
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_004_1316581065.1583528385"
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
Cc: =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?utf-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?= <Jason-ch.Chen@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 =?utf-8?B?Sm9obnNvbiBXYW5nICjnjovogZbpkasp?= <Johnson.Wang@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_004_1316581065.1583528385
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpLCYjMzI7SmFzb246DQoNCk9uJiMzMjtGcmksJiMzMjsyMDIzLTA3LTI4JiMzMjth
dCYjMzI7MDA6NDEmIzMyOyswODAwLCYjMzI7SmFzb24tSkguTGluJiMzMjt3cm90ZToNCiZndDsm
IzMyO0FkZCYjMzI7bWlzc2luZyYjMzI7bW1zeXNfZGV2X251bSYjMzI7dG8mIzMyO210ODE4OCYj
MzI7dmRvc3lzMCYjMzI7ZHJpdmVyJiMzMjtkYXRhLg0KDQpSZXZpZXdlZC1ieTomIzMyO0NLJiMz
MjtIdSYjMzI7Jmx0O2NrLmh1QG1lZGlhdGVrLmNvbSZndDsNCg0KJmd0OyYjMzI7DQomZ3Q7JiMz
MjtGaXhlczomIzMyOzU0YjQ4MDgwMjc4YSYjMzI7KCZxdW90O2RybS9tZWRpYXRlazomIzMyO0Fk
ZCYjMzI7bWVkaWF0ZWstZHJtJiMzMjtvZiYjMzI7dmRvc3lzMA0KJmd0OyYjMzI7c3VwcG9ydCYj
MzI7Zm9yJiMzMjttdDgxODgmcXVvdDspDQomZ3Q7JiMzMjtTaWduZWQtb2ZmLWJ5OiYjMzI7SmFz
b24tSkguTGluJiMzMjsmbHQ7amFzb24tamgubGluQG1lZGlhdGVrLmNvbSZndDsNCiZndDsmIzMy
Oy0tLQ0KJmd0OyYjMzI7JiMzMjtkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYu
YyYjMzI7fCYjMzI7MSYjMzI7Kw0KJmd0OyYjMzI7JiMzMjsxJiMzMjtmaWxlJiMzMjtjaGFuZ2Vk
LCYjMzI7MSYjMzI7aW5zZXJ0aW9uKCspDQomZ3Q7JiMzMjsNCiZndDsmIzMyO2RpZmYmIzMyOy0t
Z2l0JiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jDQomZ3Q7JiMz
MjtiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jDQomZ3Q7JiMzMjtpbmRl
eCYjMzI7NmRjYjRiYTI0NjZjLi4yNDljOWZkNjM0N2UmIzMyOzEwMDY0NA0KJmd0OyYjMzI7LS0t
JiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jDQomZ3Q7JiMzMjsr
KysmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMNCiZndDsmIzMy
O0BAJiMzMjstMjg3LDYmIzMyOysyODcsNyYjMzI7QEAmIzMyO3N0YXRpYyYjMzI7Y29uc3QmIzMy
O3N0cnVjdCYjMzI7bXRrX21tc3lzX2RyaXZlcl9kYXRhDQomZ3Q7JiMzMjttdDgxODZfbW1zeXNf
ZHJpdmVyX2RhdGEmIzMyOz0mIzMyO3sNCiZndDsmIzMyOyYjMzI7c3RhdGljJiMzMjtjb25zdCYj
MzI7c3RydWN0JiMzMjttdGtfbW1zeXNfZHJpdmVyX2RhdGEmIzMyO210ODE4OF92ZG9zeXMwX2Ry
aXZlcl9kYXRhDQomZ3Q7JiMzMjs9JiMzMjt7DQomZ3Q7JiMzMjsmIzMyOy5tYWluX3BhdGgmIzMy
Oz0mIzMyO210ODE4OF9tdGtfZGRwX21haW4sDQomZ3Q7JiMzMjsmIzMyOy5tYWluX2xlbiYjMzI7
PSYjMzI7QVJSQVlfU0laRShtdDgxODhfbXRrX2RkcF9tYWluKSwNCiZndDsmIzMyOysubW1zeXNf
ZGV2X251bSYjMzI7PSYjMzI7MSwNCiZndDsmIzMyOyYjMzI7fTsNCiZndDsmIzMyOyYjMzI7DQom
Z3Q7JiMzMjsmIzMyO3N0YXRpYyYjMzI7Y29uc3QmIzMyO3N0cnVjdCYjMzI7bXRrX21tc3lzX2Ry
aXZlcl9kYXRhJiMzMjttdDgxOTJfbW1zeXNfZHJpdmVyX2RhdGEmIzMyOz0NCiZndDsmIzMyO3sN
Cg0KPC9wcmU+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1FRElB
VEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioqKioqKioqKioNClRoZSBpbmZv
cm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSAN
CmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdl
ZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUg
bGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25h
dGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmlidXRpb24s
IHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5n
IGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3Rs
eSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50
ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlIA0KdGhhdCB5b3UgaGF2
ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVy
IA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBh
bmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRz
KSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0
aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0t
Pg==

--__=_Part_Boundary_004_1316581065.1583528385
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEphc29uOg0KDQpPbiBGcmksIDIwMjMtMDctMjggYXQgMDA6NDEgKzA4MDAsIEphc29uLUpI
LkxpbiB3cm90ZToNCj4gQWRkIG1pc3NpbmcgbW1zeXNfZGV2X251bSB0byBtdDgxODggdmRvc3lz
MCBkcml2ZXIgZGF0YS4NCg0KUmV2aWV3ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+
DQoNCj4gDQo+IEZpeGVzOiA1NGI0ODA4MDI3OGEgKCJkcm0vbWVkaWF0ZWs6IEFkZCBtZWRpYXRl
ay1kcm0gb2YgdmRvc3lzMA0KPiBzdXBwb3J0IGZvciBtdDgxODgiKQ0KPiBTaWduZWQtb2ZmLWJ5
OiBKYXNvbi1KSC5MaW4gPGphc29uLWpoLmxpbkBtZWRpYXRlay5jb20+DQo+IC0tLQ0KPiAgZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMgfCAxICsNCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHJtX2Rydi5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cm1fZHJ2LmMNCj4gaW5kZXggNmRjYjRiYTI0NjZjLi4yNDljOWZkNjM0N2UgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jDQo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jDQo+IEBAIC0yODcsNiArMjg3LDcgQEAg
c3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfbW1zeXNfZHJpdmVyX2RhdGENCj4gbXQ4MTg2X21tc3lz
X2RyaXZlcl9kYXRhID0gew0KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfbW1zeXNfZHJpdmVy
X2RhdGEgbXQ4MTg4X3Zkb3N5czBfZHJpdmVyX2RhdGENCj4gPSB7DQo+ICAJLm1haW5fcGF0aCA9
IG10ODE4OF9tdGtfZGRwX21haW4sDQo+ICAJLm1haW5fbGVuID0gQVJSQVlfU0laRShtdDgxODhf
bXRrX2RkcF9tYWluKSwNCj4gKwkubW1zeXNfZGV2X251bSA9IDEsDQo+ICB9Ow0KPiAgDQo+ICBz
dGF0aWMgY29uc3Qgc3RydWN0IG10a19tbXN5c19kcml2ZXJfZGF0YSBtdDgxOTJfbW1zeXNfZHJp
dmVyX2RhdGEgPQ0KPiB7DQo=

--__=_Part_Boundary_004_1316581065.1583528385--

