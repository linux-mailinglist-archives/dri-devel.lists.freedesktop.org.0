Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C64C734579
	for <lists+dri-devel@lfdr.de>; Sun, 18 Jun 2023 10:22:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F9CF10E0FB;
	Sun, 18 Jun 2023 08:22:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EC7E10E106
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jun 2023 08:21:48 +0000 (UTC)
X-UUID: 28bcf5080db111ee9cb5633481061a41-20230618
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=COgxuk7uK/mTQPvw4muwJMSblHQQ97IZZbdY8tGd+Nk=; 
 b=Kk/k86RZN5lRLJNqp6FYxLRtNzdhfRDk0NShwmYA3k2MeZvVWwxSpqb+bmIL/efeMVhx/YgRHidZtddpu8etodBPVVlufyp/V8OXfqQ5VVKpwB3nhQot/4Wab7ER+kHcNjkBIZ9iesBeiXVRCuNns+w4YXnsSr+b0rTXsB8+Jok=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.26, REQID:1ef7b178-00c3-4a96-a696-692b5582cf5e, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-META: VersionHash:cb9a4e1, CLOUDID:3fdef93e-7aa7-41f3-a6bd-0433bee822f3,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:0,Content:0,EDM:-3,IP:nil,URL
 :0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 28bcf5080db111ee9cb5633481061a41-20230618
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 192277729; Sun, 18 Jun 2023 16:21:43 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sun, 18 Jun 2023 16:21:42 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Sun, 18 Jun 2023 16:21:42 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WWWGUUARKGx/BAv3q9k/YRLpf5XkTn5tAuxaRSwUK28WlvmmhLY4j7JdXFvJ3QwRBYBhMc/wB3nEHw5Nk0PViYpE4xrM8SI0HbIk+BqnAjh/0C+OUF2WUM/6B+FEUcIHDRbJy5a2xM2TkdIgQ5fD1ENkwaJTMQZpOD0aeV7j61dzrQhqYSZ7rsf0augkAprsj+CArMbrJsYsk1d6pztiCYM6m7Iq+bWq+Kh6vLaGFXBb6NS3eRlObEmRfLbscaCL3/8wAsmc59TA4ZNnxAdhdvApeA5wyNpoStgnv5bkDnJVh9iHUOLVd+Gl0VTCtTMaqenTrK6kmHBT4hQRJld/SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eCBYnScoUPOLu2DcLGH5ibD4B72hWiLXyqBPL/Jmfvg=;
 b=U1fjqSo0PESWB1jL40ye1W4O5gY+aOXLP9IwDQGDws5IXbB+tHcwEpsmILV1ayQghXSs8z2etlAH1Qc0GU6VRTn9dO7iJ5sCy4Vqx6ZKt3umG7XJzzLfmhIJcX6dbRoeP5ylbpGJqXDyiYY0Qj2BA6Pzh22QmRQJjUB5guyUcqwV/Hl9t0GmfXsWbdcWfj+Kyk59vBMn5zciFaUZTM46kuz3SU1RNih1qE0w0dFewzqwDpFXKHu02cWfSDGoQhYLAldrlauVzn0w5ASi1P2vAzBluI0QzaWjQE+ee+Drzy68NV2TDASRjwJtnPX+KqrCthFSGzoZWdAxEyaIgEy5MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eCBYnScoUPOLu2DcLGH5ibD4B72hWiLXyqBPL/Jmfvg=;
 b=iAcNjFJYS7Dm1Q+KrAMZ4Z6GHGfYIty40v5eShD3P+oe7px6EeK3jqcPXqysSEdMg9bqujSaTjlIpx1Z1K3N37Mj1osd/1VvFKfEbLvpOr7jIczmpxSm9iwqlorM6DfXtzrNdPYkG0k8MnGB3vI3h0gfA28gPSF4LXKf4N4n7Lg=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by TYSPR03MB7942.apcprd03.prod.outlook.com (2603:1096:400:474::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.25; Sun, 18 Jun
 2023 08:21:40 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::8b05:4869:405a:924d]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::8b05:4869:405a:924d%4]) with mapi id 15.20.6455.045; Sun, 18 Jun 2023
 08:21:40 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "amergnat@baylibre.com" <amergnat@baylibre.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>
Subject: Re: [PATCH v2 4/4] drm/mediatek: Fix dereference before null check
Thread-Topic: [PATCH v2 4/4] drm/mediatek: Fix dereference before null check
Thread-Index: AQHZnerQDg74imZeYkWYy7jwUnp9iK+J/N6AgAZDG4A=
Date: Sun, 18 Jun 2023 08:21:40 +0000
Message-ID: <b585acdc929c381b4ea6f1550104dd609505a742.camel@mediatek.com>
References: <20230613113210.24949-1-jason-jh.lin@mediatek.com>
 <20230613113210.24949-5-jason-jh.lin@mediatek.com>
 <98809b8a-1d30-a686-0da8-5032bb362560@collabora.com>
In-Reply-To: <98809b8a-1d30-a686-0da8-5032bb362560@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|TYSPR03MB7942:EE_
x-ms-office365-filtering-correlation-id: cb8cfd6e-3733-4e5f-e1b4-08db6fd50aab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nxwpR2dT1/lPMWtWQcWGoJkP9nb/BFq4Hwsu/FwR5g/at84P/yW5X9uGgIe8oOR2Vq9OthywSGDrM+QBBMMirkXF6fD0iKQP3zZmVgXju8260XW3qGi7m45BAvqtEEmRPoGsrKkBaR00CKWuebkDG31/uM82MMFsp2ASU2QpFGGUwlgIVd3emyWTuSpbBolI4RQ73tDJjYb5QVE8T7bSQ7F3a6NUbPl2TJ6CB63hgJTNQ7tzx9+hCdydBv1zKNisdlt7BdL4XjzQZEhY7zpFYUXQ/TMMKWJ3vUC7x65roq0rTnAIOfu/sGVY5iNCQI7SdP3FpC5tb98jAHp080O0zVkJ4DSbKbujhLaroCxUFmrjNGrN0N5VPplreDqM4uHmxPI04fZrJAQK1byWrGBBvm/1m5I218FRwVAwMufHClSVkcWAElzf8oDBCDryZWNNLPQz7WVlwaRZEy94ZaLpGF0znpbtgwv46s5bxNEC7k/daQCbRxLG0HoM4JGXEpDu2db6kOiwJ8vAAIQv04tLoQks84zlM8fzc92tMbE+s6J3dr1onHpQr7MKYIKFH5DoMQVpDA5s+Xdg21ib31KcX6AVfgdIQ906vdpiedvdY/3vSSMrlyN+t4DOBDVjiaR7Jvt+QQVr5+jzGaw5lhusboStyx5sdLL/BHmohyWamJc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(396003)(136003)(346002)(39850400004)(366004)(451199021)(6512007)(6506007)(107886003)(26005)(36756003)(478600001)(85182001)(186003)(71200400001)(6486002)(2906002)(4744005)(316002)(41300700001)(38070700005)(8936002)(86362001)(8676002)(5660300002)(122000001)(38100700002)(54906003)(110136005)(83380400001)(66556008)(2616005)(64756008)(4326008)(66946007)(76116006)(66476007)(91956017)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L3pxNFBHR1ZqRy9ralJPRldoNnpZUUVoY09HbTY1QkJkNkFVQjZOa2xBWDlU?=
 =?utf-8?B?c2ZjcUtXRi8yMmJ1UzV1QzRkQXRha0ZXOTdxY25nUTZSUmVZZm1xN0tsb2R2?=
 =?utf-8?B?Vk4ybUw2ZHVXVDViMUQrK3JRc3N2MFZRUEpsL2t4YWRyUE1lYXd3RWl0MldN?=
 =?utf-8?B?UjZJWVMvUTdsUDh0bE5CbGRJc2JyRGJRUG9MQkl2cHZnYzFqZUpRamxDU1RR?=
 =?utf-8?B?OHFVcnp0ZWh1OFJBKy8xQ0JwSjc0SFI1L2xZSEVEMndJTHEyWWpqMWo2cHNt?=
 =?utf-8?B?Rjd4OGhPOEhuRlNzdituNjRySXhyNFZ6UjNaN1RxTktnYk9LM09qRkRPWDlo?=
 =?utf-8?B?cTNFcU1sb3dITTF2bmxWd0g4bG5mdzJIbHJ0dnZtRWc3ZmtSREc0RTdVMXFi?=
 =?utf-8?B?WGJoV0hjODNnS0RmSHQxeHdDNFpKZFlwVEEydzRrdDBHS3dTNisxU2J2S1J3?=
 =?utf-8?B?NmVaYzVVbjltUm1yak1Vb2toVW05VXdCR3FmK0swaWN2ZHVwTDNHbEs3cU91?=
 =?utf-8?B?MGtsRVluN1ZkZzJWWnpIYWY3dmptOEVOMmowVWhWSC8zdmxFdDFGVTRMNEdI?=
 =?utf-8?B?VER4aUR3T2Jxd2s4UmtuV1Fhcmx6V21tejNObVpDbmR2NXp6L041eGlRcjQ2?=
 =?utf-8?B?UjB1TzIrT1BDV2xpM2ZLdmFnekdEeEh2RlFBRzdlMklTb2RyZk5DdVRFakh5?=
 =?utf-8?B?K0U2YW52eDM1amYvb2p2dWplQnpOek5SakhJTWJYMmFRb3BQWEYrc05lb2ky?=
 =?utf-8?B?N01FZHlqNElxNXBDSDZteWd1ZVRuMldWNXVGQUd2Z1BWOFAxSWVkOHpqQzdX?=
 =?utf-8?B?ME9IaTZRZFB4L2I4UWkvdzE5bEpTdXVFSlJ2NURMSXZtV0IySVIyZ3l2RUVV?=
 =?utf-8?B?UnNEWWxZNHRWa1hoVTN4QTgxdEZCQ2ltWUhhcHdUWVpieXo0T2xLalFsemZj?=
 =?utf-8?B?Rm5hdGhMZi9VSUhsVDdmc0tNSEo3bVFXOENtUTdvb1lMdFI2bTR1bXF4MlhY?=
 =?utf-8?B?T2VVdnBrdyttR0JOY0tYU0dRSXBTNGgvaDlnSWNtSGhsMnVvdXN4bnc3Vi9o?=
 =?utf-8?B?SUVGZjhnbHRFd1BwQldrdXpVQUFEeGF6WDZNeTFQcmhPRTArcllYVVVNckxy?=
 =?utf-8?B?Mjl1VlJrZlVGdDlWUEFnZEkySVlqaGY5VFA4dDZDYytDWlRnQWJva1FBYmpJ?=
 =?utf-8?B?b2JsOHY5QTFzcWVZWk1DMSthNEw0ZHFXcmhXVlVuTVduQWNtMVlrTU9iNko1?=
 =?utf-8?B?WnA2UnJRVzYvM0QwajJIKzlOMjRiNmdudjhRbWNLNlhUWjhJdVl0Vk5CMndG?=
 =?utf-8?B?NGIvMFpPT0JscXJ4aklPYUhXVXNjUkFCMGJLT2hzTks4RGlQOU9ueHIzU2Z1?=
 =?utf-8?B?WmsvdkhaTjZnUGx0bWpiUGhEaGE4Y21nOVZDK09LZGoxYmdnb0tjNjFqLzVE?=
 =?utf-8?B?bzMxaWVQd1VJWExPMmUzUDZjZHU3V0pnVE03Z2tnU1BFdmhwWFFQMzAxaUJz?=
 =?utf-8?B?R294Q2hCNGhSUkZ3VW91Rm9OSldoSlVWQmR6aXdHRWtRaytkM0ErZ1FSTDlR?=
 =?utf-8?B?V1JCMHQwNHBmWmd4a01lWDJSMGNmdEV2VmxTV0t4aWp1MTFLZXlzRU1qL2dX?=
 =?utf-8?B?YW5HbmZqQ2lWd3M1L1hhUGhhVFAzUUx1VjR4Y0ZRMnFvRUNtcVVnbFdFUU1P?=
 =?utf-8?B?aHYzOHJ5UWZ1cCtWbkppc2loUEJvaUVQQ1JqcnBrL2h6b1Izc3VCVi85WGxE?=
 =?utf-8?B?cDFEbjJrU2o2V3Zubkw5aS9wKzdvNXlDQzBlWm8rVnI5M2JPclVLdzRlR3JY?=
 =?utf-8?B?aUpqZnNxdC94SVE1SUNNTWkvWlU4TEtGNXpUTytNM3lYMEdnR25ad0VuaEZv?=
 =?utf-8?B?WHBuYWJVMGVNelYvb0c5V3h1VmhzY3lwKzNXOUI1cENCY0NRN1lrSkFQT0kx?=
 =?utf-8?B?eG5zdVNzemxTa1VXVGlINjhVMmlWbmZaWlQ2eFh2OVFJSE5URnNZNnZHa2FN?=
 =?utf-8?B?dFh0bnFtdmpwSU01WnNYWE5HNzVSRjlLUGJUMXpDZWZkVlVoa2VGYWE2VFFP?=
 =?utf-8?B?dFZldHh1ZzFwZGdwNmdIRjRHVEtVK0JLd0Z3R21yRVRqc1VzUnZ6TEVDZTM2?=
 =?utf-8?B?V3dtR25lSDdsUmpxVVBWTUF0aTNQay81VlBEZ0wxWk1xMUtpTXhuTjVDeWs2?=
 =?utf-8?B?Vnc9PQ==?=
Content-Type: multipart/alternative;
 boundary="_000_b585acdc929c381b4ea6f1550104dd609505a742camelmediatekco_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb8cfd6e-3733-4e5f-e1b4-08db6fd50aab
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2023 08:21:40.0572 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cMe3U8BMEdCRO9MI4O1ZxYfcp5OtQZs4+iHosG6DS+eieU/mOzY2SMaSnsy2rOHuyrqke0rMkeU94epbLJKPvKRzULNlel3OTW1bNsL89nM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7942
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
 =?utf-8?B?UmV4LUJDIENoZW4gKOmZs+afj+i+sCk=?= <Rex-BC.Chen@mediatek.com>,
 =?utf-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?= <Jason-ch.Chen@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?utf-8?B?Sm9obnNvbiBXYW5nICjnjovogZbpkasp?= <Johnson.Wang@mediatek.com>,
 =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_b585acdc929c381b4ea6f1550104dd609505a742camelmediatekco_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQW5nZWxvLA0KDQoNCk9uIFdlZCwgMjAyMy0wNi0xNCBhdCAxMDo0MyArMDIwMCwgQW5nZWxv
R2lvYWNjaGlubyBEZWwgUmVnbm8gd3JvdGU6DQpFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBu
b3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bnRpbCB5b3UgaGF2ZSB2ZXJpZmll
ZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250ZW50Lg0KDQpJbCAxMy8wNi8yMyAxMzozMiwgSmFzb24t
SkguTGluIGhhIHNjcml0dG86DQoNCj4gTnVsbC1jaGVja2luZyBzdGF0ZSBzdWdnZXN0cyB0aGF0
IGl0IG1heSBiZSBudWxsLCBidXQgaXQgaGFzIGFscmVhZHkNCg0KPiBiZWVuIGRlcmVmZXJlbmNl
ZCBvbiBkcm1fYXRvbWljX2dldF9uZXdfcGxhbmVfc3RhdGUoc3RhdGUsIHBsYW5lKS4NCg0KPg0K
DQo+IFRoZSBwYXJhbWV0ZXIgc3RhdGUgd2lsbCBuZXZlciBiZSBOVUxMIGN1cnJlbnRseSwgc28g
anVzdCByZW1vdmUgdGhlDQoNCj4gc3RhdGUgaXMgTlVMTCBmbG93IGluIHRoaXMgZnVuY3Rpb24u
DQoNCj4NCg0KPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbi1KSC5MaW4gPGphc29uLWpoLmxpbkBtZWRp
YXRlay5jb20+DQoNCj4gRml4ZXM6IDVkZGIwYmQ0ZGRjMyAoImRybS9hdG9taWM6IFBhc3MgdGhl
IGZ1bGwgc3RhdGUgdG8gcGxhbmVzIGFzeW5jIGF0b21pYyBjaGVjayBhbmQgdXBkYXRlIikNCg0K
DQpGaXhlcyBiZWZvcmUgUy1vLWIuLi4NCg0KDQpSZXZpZXdlZC1ieTogQW5nZWxvR2lvYWNjaGlu
byBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4NCg0K
DQpUaGFua3MsIEknbGwgc3dhcCBpdCBhdCB0aGUgbmV4dCB2ZXJzaW9uLg0KDQpSZWdhcmRzLA0K
SmFzb24tSkguTGluDQoNCg==

--_000_b585acdc929c381b4ea6f1550104dd609505a742camelmediatekco_
Content-Type: text/html; charset="utf-8"
Content-ID: <9CF8258DA854E1409FF9FA42FA5F6F57@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWwgZGlyPSJsdHIiPg0KPGhlYWQ+DQo8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUi
IGNvbnRlbnQ9InRleHQvaHRtbDsgY2hhcnNldD11dGYtOCI+DQo8L2hlYWQ+DQo8Ym9keSBzdHls
ZT0idGV4dC1hbGlnbjpsZWZ0OyBkaXJlY3Rpb246bHRyOyI+DQo8ZGl2PkhpIEFuZ2Vsbyw8L2Rp
dj4NCjxkaXY+PGJyPg0KPC9kaXY+DQo8ZGl2Pjxicj4NCjwvZGl2Pg0KPGRpdj5PbiBXZWQsIDIw
MjMtMDYtMTQgYXQgMTA6NDMgKzAyMDAsIEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIHdyb3Rl
OjwvZGl2Pg0KPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIgc3R5bGU9Im1hcmdpbjowIDAgMCAuOGV4
OyBib3JkZXItbGVmdDoycHggIzcyOWZjZiBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij4NCjx0YWJs
ZSBjbGFzcz0iTXNvTm9ybWFsVGFibGUiIGJvcmRlcj0iMCIgY2VsbHNwYWNpbmc9IjAiIGNlbGxw
YWRkaW5nPSIwIiBhbGlnbj0ibGVmdCIgd2lkdGg9IjEwMCUiIHN0eWxlPSJ3aWR0aDoxMDAuMCU7
YmFja2dyb3VuZDojNzdGRkNDIj4NCjx0Ym9keT4NCjx0cj4NCjx0ZCB3aWR0aD0iOSIgc3R5bGU9
IndpZHRoOjcuMHB0O2JhY2tncm91bmQ6I0VBMDYyMTtwYWRkaW5nOjUuMjVwdCAxLjVwdA0KIDUu
MjVwdCAxLjVwdCI+DQo8L3RkPg0KPHRkIHdpZHRoPSIxMDAlIiBzdHlsZT0id2lkdGg6MTAwLjAl
O2JhY2tncm91bmQ6I0ZGRDRENDtwYWRkaW5nOjUuMjVwdA0KIDMuNzVwdCA1LjI1cHQgMTEuMjVw
dCI+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1zby1lbGVtZW50OmZyYW1l
O21zby1lbGVtZW50LWZyYW1lLWhzcGFjZToyLjI1cHQ7bXNvLWVsZW1lbnQtd3JhcDphcm91bmQ7
bXNvLWVsZW1lbnQtYW5jaG9yLXZlcnRpY2FsOnBhcmFncmFwaDttc28tZWxlbWVudC1hbmNob3It
aG9yaXpvbnRhbDpjb2x1bW47bXNvLWhlaWdodC1ydWxlOmV4YWN0bHkiPg0KPHNwYW4gbGFuZz0i
RU4tVVMiIHN0eWxlPSJmb250LXNpemU6OS41cHQ7Zm9udC1mYW1pbHk6JnF1b3Q7U2Vnb2UNCiBV
SSZxdW90OyxzYW5zLXNlcmlmO2NvbG9yOiMyMTIxMjEiPkV4dGVybmFsIGVtYWlsIDogUGxlYXNl
IGRvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsIHlvdSBoYXZlIHZl
cmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuPG86cD48L286cD48L3NwYW4+PC9wPg0K
PC9kaXY+DQo8L3RkPg0KPC90cj4NCjwvdGJvZHk+DQo8L3RhYmxlPg0KPCEtLX0tLT4NCjxwcmU+
SWwgMTMvMDYvMjMgMTM6MzIsIEphc29uLUpILkxpbiBoYSBzY3JpdHRvOjwvcHJlPg0KPHByZT4m
Z3Q7IE51bGwtY2hlY2tpbmcgc3RhdGUgc3VnZ2VzdHMgdGhhdCBpdCBtYXkgYmUgbnVsbCwgYnV0
IGl0IGhhcyBhbHJlYWR5PC9wcmU+DQo8cHJlPiZndDsgYmVlbiBkZXJlZmVyZW5jZWQgb24gZHJt
X2F0b21pY19nZXRfbmV3X3BsYW5lX3N0YXRlKHN0YXRlLCBwbGFuZSkuPC9wcmU+DQo8cHJlPiZn
dDsgPC9wcmU+DQo8cHJlPiZndDsgVGhlIHBhcmFtZXRlciBzdGF0ZSB3aWxsIG5ldmVyIGJlIE5V
TEwgY3VycmVudGx5LCBzbyBqdXN0IHJlbW92ZSB0aGU8L3ByZT4NCjxwcmU+Jmd0OyBzdGF0ZSBp
cyBOVUxMIGZsb3cgaW4gdGhpcyBmdW5jdGlvbi48L3ByZT4NCjxwcmU+Jmd0OyA8L3ByZT4NCjxw
cmU+Jmd0OyBTaWduZWQtb2ZmLWJ5OiBKYXNvbi1KSC5MaW4gJmx0O2phc29uLWpoLmxpbkBtZWRp
YXRlay5jb20mZ3Q7PC9wcmU+DQo8cHJlPiZndDsgRml4ZXM6IDVkZGIwYmQ0ZGRjMyAoJnF1b3Q7
ZHJtL2F0b21pYzogUGFzcyB0aGUgZnVsbCBzdGF0ZSB0byBwbGFuZXMgYXN5bmMgYXRvbWljIGNo
ZWNrIGFuZCB1cGRhdGUmcXVvdDspPC9wcmU+DQo8cHJlPjxicj48L3ByZT4NCjxwcmU+Rml4ZXMg
YmVmb3JlIFMtby1iLi4uPC9wcmU+DQo8cHJlPjxicj48L3ByZT4NCjxwcmU+UmV2aWV3ZWQtYnk6
IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vICZsdDthbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25v
QGNvbGxhYm9yYS5jb20mZ3Q7PC9wcmU+DQo8cHJlPjxicj48L3ByZT4NCjxwcmU+VGhhbmtzLCBJ
J2xsIHN3YXAgaXQgYXQgdGhlIG5leHQgdmVyc2lvbi48L3ByZT4NCjwvYmxvY2txdW90ZT4NCjxk
aXY+PGJyPg0KPC9kaXY+DQo8ZGl2PlJlZ2FyZHMsPC9kaXY+DQo8ZGl2Pkphc29uLUpILkxpbjwv
ZGl2Pg0KPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIgc3R5bGU9Im1hcmdpbjowIDAgMCAuOGV4OyBi
b3JkZXItbGVmdDoycHggIzcyOWZjZiBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij4NCjxwcmU+PGJy
PjwvcHJlPg0KPC9ibG9ja3F1b3RlPg0KPC9ib2R5Pg0KPC9odG1sPg0KPCEtLXR5cGU6dGV4dC0t
PjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3Rp
Y2UgKioqKioqKioqKioqKioqKioqKioNClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhp
cyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29u
ZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQg
ZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8g
YmUgDQpjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVz
ZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3Ig
Y29weWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1
bmludGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpi
ZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMg
ZS1tYWlsLCBvciBiZWxpZXZlIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBp
biBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5
aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMg
ZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQg
ZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIg
cGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--_000_b585acdc929c381b4ea6f1550104dd609505a742camelmediatekco_--

