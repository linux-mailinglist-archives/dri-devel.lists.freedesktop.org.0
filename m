Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7F472BBC6
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 11:11:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A37A10E08C;
	Mon, 12 Jun 2023 09:10:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 746CB10E08C
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 09:10:55 +0000 (UTC)
X-UUID: 046d2146090111eeb20a276fd37b9834-20230612
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=iGh7YVafEEC4RObSrPhahWEa3poyoSAQrSxLWyU+RB4=; 
 b=SfwdWeRzjRDfLOV/aPGBr6JLO1HYhUSjbZ2Yjoa37QJERMkCyibH4F8ToBpske+0mjBz7EUwQL/Eh+tFS535490hNNjWSf3zEAzp/Fe4U1BQ9VNbOAX+OhXLGOeo2+WqgQr9eoWXhcZLQd+0HlPjyN9l3R4GwxkonGKVs2HoaEA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.26, REQID:ab9fbbb7-5fe1-4887-9aff-3a518bdf3fd9, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:45
X-CID-INFO: VERSION:1.1.26, REQID:ab9fbbb7-5fe1-4887-9aff-3a518bdf3fd9, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:45
X-CID-META: VersionHash:cb9a4e1, CLOUDID:e752573e-7aa7-41f3-a6bd-0433bee822f3,
 B
 ulkID:230612162204ULKW7ZHP,BulkQuantity:16,Recheck:0,SF:28|17|19|48|38|29|
 102,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:41,QS:nil,BEC:nil,C
 OL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_OBB, TF_CID_SPAM_SNR, TF_CID_SPAM_SDM,
 TF_CID_SPAM_FAS, TF_CID_SPAM_FSD
X-UUID: 046d2146090111eeb20a276fd37b9834-20230612
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 390875334; Mon, 12 Jun 2023 17:10:46 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 12 Jun 2023 17:10:45 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Mon, 12 Jun 2023 17:10:45 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iDB21EEn5o5jwYdll77J0V2HvV7VHYBV1BTkn47Ej2/6cBJ7sPZ+eQY0yMX2NAOXYnplOZj9de+hS9Kdc6+KaKp9azkC1ktCVn2hYkbRPBaohKgt974Ki4MvUTl6LMtaqUbzuhB4HocjeTYWRW9dbwiU1vmISByEU/BbhUldfB0Otj5/Dy0afX/mc20ZQTEqiEQKZhu/hIJjJWaw3YNpflPhORmmhgU21PCozUEXTA0BemAeWhSYaAl/OyYS8XuJE0nujd/aqauAiKJRPrD7PK1yjPkzVUEM6w21MYVnK4+6nOchyF0TCuyvUGgvRG7VUiL1Wl5L+JhCkjkoNIEFcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Az7f+Ost5QmjERi6cAztioIBUPOiEqanmp9H0A4AieM=;
 b=VVwmEHXdXC9YaLD7+LE0J5ebjCQUsnvSfXQGUfbg7fAxJaQ1ZlRhJoaMmEwSCaA0vibX1SyiPTbHLD2g/Ujg0mIvDzFxU+HwZ4/KMgMy4Pi40ug5I6D2z+XGUBexWeIiwQExsMrNfP/HseJkdo/FfWgOJyn/EYQ6fSoFndwwiZXCeAzaaZwsdZdoy1VF6pDGoTYoUp40yx1+mJi33xJpaN33BN+NV/EmCZPJUJC/VE2WLhNBUzkl5cWjA+4/9yEm9UsK2o//7RbpTxW/za27WftxM5fLH640wmPpTfa5IjXNybsrtVwtMKATun6zTluFrBlsmGj5uGNdbYUS9BzWQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Az7f+Ost5QmjERi6cAztioIBUPOiEqanmp9H0A4AieM=;
 b=Gq0GhmKimPLyUG59qlk9Xg1lQ9MXT/wzPbJtCRcSYCg7MpeQyWGkXZfnPkaqLz7HUTycXmj20ve5jn4QwwmUM+LJiMBeP/NpjCz2DPjy5SFujxNLVUOpQfReKzH+9vFrK0l68PPi8owKTq1+WVytXnOqMKTOBWczs3LzXHC7rQ4=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KL1PR03MB6058.apcprd03.prod.outlook.com (2603:1096:820:87::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Mon, 12 Jun
 2023 09:10:40 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::6fdb:ba2c:bcfc:d5ed]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::6fdb:ba2c:bcfc:d5ed%6]) with mapi id 15.20.6455.037; Mon, 12 Jun 2023
 09:10:40 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, 
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 5/5] drm/mediatek: Fix dereference before null check
Thread-Topic: [PATCH 5/5] drm/mediatek: Fix dereference before null check
Thread-Index: AQHZaR0ZxHqGDI/IdEKFPDQOz0fsx6+HSUkA
Date: Mon, 12 Jun 2023 09:10:40 +0000
Message-ID: <4ea5f2579f802e886eab057cc2635e91766ac45a.camel@mediatek.com>
References: <20230407064657.12350-1-jason-jh.lin@mediatek.com>
 <20230407064657.12350-6-jason-jh.lin@mediatek.com>
In-Reply-To: <20230407064657.12350-6-jason-jh.lin@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KL1PR03MB6058:EE_
x-ms-office365-filtering-correlation-id: 674d6260-dcb8-414d-be48-08db6b24e4fb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: z/PbjZmk3dElzK7EH4PBch+qd6XuYqLkeDe97fu1NkW0hCen81UMjF7O3tO3iXsnB3wqKA1NWsX+d1lfX8ZBEBPx8oF8ie6wwyz7XlPvxE/eQl98jlp6ww2WK5BOu8HeCGek5js3V7NkJxa4EZHpqozMg5EXMNSZXR9Bx3OqIufPmMxqNP8DX/3ahp5QX/d7K+IrQxt+EnAF1O3D0xwNG4WSvfAJmNsqrq/YpCiqE/F9EmB1Jui/Y4X3klqSyFUafPvtmkea3TzWU7KUA1la4zqqHyqBcyF9vE1LmmTA5U1WMLYSyKQAQjVOE4j/gQiiUBScryf1jwHnuDXWRZDmcE5w8znSOHYJxNOVjfbflgqBaFZa9zOgRBEs607O/OSgT/sKriwzqzUnRXvQoyozSQ/G44Z4rMd9eh/nI2NKGztKmWk6MyDRM3/f1xcSJYTAKFtKO/lnpc/5Jdjme7dcvt8C4vKjLwojahkVU3nDPou+3l8rugan8w5fHNRPV2EQjzm3VuH6m+RxWIvL++CCz4H1s4TiFbU7U0nqjRUbX6zi7waSI+oiFZBnV0Z9nYKPsF6EwYJEsswLrUPC5rwxICKgNs/qp7zyf4yr/YHzMww29OKrjXHX3BSx9V4Oo83BUW6UPYZulA6OFs4FLRzh5OmS2lOh+0zHcuvWnGCnMfE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(346002)(39860400002)(136003)(396003)(366004)(451199021)(107886003)(6486002)(36756003)(85182001)(83380400001)(2616005)(38100700002)(86362001)(38070700005)(122000001)(6506007)(6512007)(26005)(186003)(2906002)(110136005)(54906003)(66476007)(4326008)(64756008)(316002)(66446008)(66556008)(76116006)(41300700001)(5660300002)(71200400001)(66946007)(478600001)(8936002)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cUs2UDhUb0NzNmFvWFpmNVA5L3U0bDBiQys3V0cwY0J4aTVZaFlpYVk3QkRY?=
 =?utf-8?B?VnZBalZ1R3NyN1F3NWxIdDVvaWQxVDJtWFpxdWxZZ1Y4UkYwOFZoUFJ3VCtP?=
 =?utf-8?B?REgydGhGZUE2cHg1aDlWcjIzaWlQTkFuYmpwdXNoZjVOTitDRVBwT3M2OVYr?=
 =?utf-8?B?eVBqT3lMUWxrdTI0NmpZTVRoS1Q0SU5JVEJwUnNhWER0L0ZCUXdVSUtzSXJ0?=
 =?utf-8?B?UVcrM3J1RzYwQTdMTnFLbWg4R25KZ015d2FKOUtDNzg1NXlPOEIxSmlDbWhL?=
 =?utf-8?B?R1VpZnZNS3NVanE0VVF5ZWRTMUxNU0xCUHpjNzBXQndPdDQ0NmV2NjVZTXRV?=
 =?utf-8?B?SmJCQlVyTVptU29xRGlNTXRPdkRFNHdSa0Vic0Y4RTJJeXovM3Z4WUFTOHlC?=
 =?utf-8?B?bERuc29ZdS9mY3JQL3JQSzEyWWY4bGtFY2gxdUU1U01mTG95NkJzQnJBbjNa?=
 =?utf-8?B?NElLcWMyWjZQSHlETU9FSWRvRGRuRC9VdDFnL29wZy9xZXk3TUdDNlNZc0VI?=
 =?utf-8?B?M0JQOGE1VjVhWFZTYzFVdmFORWZvOFB3N3lvb05VR3ZuL0hmanNJTnhCVzFa?=
 =?utf-8?B?akVPbzdUV0k2U3g1ZHdXTmJJYXpMcWF1dllBYzRncUM2eFdSb2huMkhMck9W?=
 =?utf-8?B?TDByaWxnRWNjbXM1RXZnRnlCT1ZEWXlpSDhCV0ZMU2h5Mm96b0RTN0xZb3Y1?=
 =?utf-8?B?QnZIcXdzazNUNGltYjJqY2MvNE1OeHBhaHJuODQrQ051eFBrWGk5YnVNMHN5?=
 =?utf-8?B?UGVQVWs2L21GMU5YcGFUWjZ5V3JhYUZsZjNITnJiSU9xUThURkFyV0RGWUVB?=
 =?utf-8?B?emFwbVdFUmlQYXo4ZFUxaERVZXRIUi9NUGVnSEZRUngrelZDd3pNMk4ySDdX?=
 =?utf-8?B?eXR3Tk9HYUxXR2lCYTAzY1pGSFVFb0lwYlBiRWZ1emhRZWFXYXNhUCtycU9V?=
 =?utf-8?B?RWhHbm4yVHk2RC8zNUp4bThOUHNIL2lUb1VnbVhEeHVTQjM4MXVxUDhPbEtO?=
 =?utf-8?B?WkFBTmFxUTducGtSU3VMTjlNbEdySHhpenVvRG5zdXM4MVorNnZrSzVRUmd1?=
 =?utf-8?B?cWFVdTVIODN1dnNmZU50NndkeEcyYkhIdko3cXJrVmF5QmlmRUlVNWFUdktX?=
 =?utf-8?B?K0FsdEVzYVlsdVNwV1Y4SExoZzZVSFBhaElBRnV0bEVNQzFaS01ZY1lZUTZX?=
 =?utf-8?B?bmFJS1NUK0lxZDVCYkpVQUVLdEhJdHdHWWRINFpHbmd6SzIvWk13RElRWXhr?=
 =?utf-8?B?amFhODB2dnY1RVovOHBub2RyUUtVSTVVNDhqQWlzcDhlV3Nvc1dTaWp6U1pL?=
 =?utf-8?B?UnRGc21obWlWMjlZVnNsRjlUL3oyVDVUQ0MxRGdSWlhveUFDamVSOGY5RHh2?=
 =?utf-8?B?a245eVU0eG43UFFWcXAvZ295N2NPYkNMRnVuODB1VFFLR0VkRmVQVzNMYTZy?=
 =?utf-8?B?WXZXM081dXNBZHdWWXVKTmZkVUE1K2Ezc3l0VXVmMjEyL2thUUNoUy8zNndO?=
 =?utf-8?B?Nk1Wb1ZYOEJqS3JoU3plYVQ1T1hwR3dla1VrNG4vRk5DcFdzTVltQUdRWXFH?=
 =?utf-8?B?LzhZaWxvYVdPNVo4aTFYYVJlUlFpUXI1NngwWjcwQklLZFZnVE5zRjBicGdo?=
 =?utf-8?B?ZGoyZTF0a1VIVUp0VFpjQjBtbG1OUGpIRFhQNVh1cGVLd2tTZVN4MWtIekdh?=
 =?utf-8?B?Zi83ODFESjR5czZlS1pMNjFrYXRRZDRTMEJPa21XdkcySXFqZHdFY3cyWGlR?=
 =?utf-8?B?SWJyYnZST3VqOHJab0VHQnczU2lYVC9oTnZxenpUZm9XUCt5YjlIcStaM3BV?=
 =?utf-8?B?d0FBd1BVNGFmMEIxL0pHQmRkajUrdGw0MjVGV0tPL0dUNFhGSTMrMTI3Kyth?=
 =?utf-8?B?YmZ1RmJUaXNQSjNZalBtWHZSRndmMGgyQS9BaVRBWGhCODVpR3FQdWNoOFpB?=
 =?utf-8?B?L0RVQmlHTlZLZC9yQmljNEoxSXF4QTZXV2IzUzhIZTVGcG1qT085MlFORHNm?=
 =?utf-8?B?aXBCS2Jqa1g1eHdPVkFIcXhwK0NIbkdxazJHdjRiZkRvZk52MFQwTTVMMUhx?=
 =?utf-8?B?aUpXeVRIYkZCemgvdm5weDZvYytBWmZhczlHM3lSanpUZG1lRWgzWGtVT3J6?=
 =?utf-8?Q?rImA825e8RtfrvirG1Y3e3ZA0?=
Content-ID: <65C715A026432746919D788B59F07A58@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 674d6260-dcb8-414d-be48-08db6b24e4fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2023 09:10:40.7425 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +djDFyntPqYzMNpbzs93om4xWAz7CayeqYIc+bVSAXVhwNh+Nq86MhOY8nZmlk/riOq+Q7Aw+ZuO2l/uzGKGog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB6058
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_001_894907309.1214394374"
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
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_001_894907309.1214394374
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpLCYjMzI7SmFzb246DQoNCk9uJiMzMjtGcmksJiMzMjsyMDIzLTA0LTA3JiMzMjth
dCYjMzI7MTQ6NDYmIzMyOyswODAwLCYjMzI7SmFzb24tSkguTGluJiMzMjt3cm90ZToNCiZndDsm
IzMyO051bGwtY2hlY2tpbmcmIzMyO3N0YXRlJiMzMjtzdWdnZXN0cyYjMzI7dGhhdCYjMzI7aXQm
IzMyO21heSYjMzI7YmUmIzMyO251bGwsJiMzMjtidXQmIzMyO2l0JiMzMjtoYXMmIzMyO2FscmVh
ZHkNCiZndDsmIzMyO2JlZW4mIzMyO2RlcmVmZXJlbmNlZCYjMzI7b24mIzMyO2RybV9hdG9taWNf
Z2V0X25ld19wbGFuZV9zdGF0ZShzdGF0ZSwmIzMyO3BsYW5lKS4NCiZndDsmIzMyOw0KJmd0OyYj
MzI7VGhlJiMzMjtwYXJhbWV0ZXImIzMyO3N0YXRlJiMzMjt3aWxsJiMzMjtuZXZlciYjMzI7YmUm
IzMyO05VTEwmIzMyO2N1cnJlbnRseSwmIzMyO3NvJiMzMjtqdXN0JiMzMjtyZW1vdmUmIzMyO3Ro
ZQ0KJmd0OyYjMzI7c3RhdGUmIzMyO2lzJiMzMjtOVUxMJiMzMjtmbG93JiMzMjtpbiYjMzI7dGhp
cyYjMzI7ZnVuY3Rpb24uDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtK
YXNvbi1KSC5MaW4mIzMyOyZsdDtqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tJmd0Ow0KJmd0OyYj
MzI7Rml4ZXM6JiMzMjs1ZGRiMGJkNGRkYzMmIzMyOygmcXVvdDtkcm0vYXRvbWljOiYjMzI7UGFz
cyYjMzI7dGhlJiMzMjtmdWxsJiMzMjtzdGF0ZSYjMzI7dG8mIzMyO3BsYW5lcyYjMzI7YXN5bmMN
CiZndDsmIzMyO2F0b21pYyYjMzI7Y2hlY2smIzMyO2FuZCYjMzI7dXBkYXRlJnF1b3Q7KQ0KJmd0
OyYjMzI7LS0tDQomZ3Q7JiMzMjsmIzMyO2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJt
X3BsYW5lLmMmIzMyO3wmIzMyOzkmIzMyOysrLS0tLS0tLQ0KJmd0OyYjMzI7JiMzMjsxJiMzMjtm
aWxlJiMzMjtjaGFuZ2VkLCYjMzI7MiYjMzI7aW5zZXJ0aW9ucygrKSwmIzMyOzcmIzMyO2RlbGV0
aW9ucygtKQ0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtkaWZmJiMzMjstLWdpdCYjMzI7YS9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9wbGFuZS5jDQomZ3Q7JiMzMjtiL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHJtX3BsYW5lLmMNCiZndDsmIzMyO2luZGV4JiMzMjthMTMzN2Yz
ODZiYmYuLmUxNGIyOTIwZDI0MiYjMzI7MTAwNjQ0DQomZ3Q7JiMzMjstLS0mIzMyO2EvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fcGxhbmUuYw0KJmd0OyYjMzI7KysrJiMzMjtiL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX3BsYW5lLmMNCiZndDsmIzMyO0BAJiMzMjst
MTAzLDgmIzMyOysxMDMsNyYjMzI7QEAmIzMyO3N0YXRpYyYjMzI7dm9pZCYjMzI7bXRrX2RybV9w
bGFuZV9kZXN0cm95X3N0YXRlKHN0cnVjdA0KJmd0OyYjMzI7ZHJtX3BsYW5lJiMzMjsqcGxhbmUs
DQomZ3Q7JiMzMjsmIzMyO3N0YXRpYyYjMzI7aW50JiMzMjttdGtfcGxhbmVfYXRvbWljX2FzeW5j
X2NoZWNrKHN0cnVjdCYjMzI7ZHJtX3BsYW5lJiMzMjsqcGxhbmUsDQomZ3Q7JiMzMjsmIzMyO3N0
cnVjdCYjMzI7ZHJtX2F0b21pY19zdGF0ZSYjMzI7KnN0YXRlKQ0KJmd0OyYjMzI7JiMzMjt7DQom
Z3Q7JiMzMjstc3RydWN0JiMzMjtkcm1fcGxhbmVfc3RhdGUmIzMyOypuZXdfcGxhbmVfc3RhdGUm
IzMyOz0NCiZndDsmIzMyO2RybV9hdG9taWNfZ2V0X25ld19wbGFuZV9zdGF0ZShzdGF0ZSwNCiZn
dDsmIzMyOy0NCiZndDsmIzMyOyYjMzI7cGxhbmUpOw0KJmd0OyYjMzI7K3N0cnVjdCYjMzI7ZHJt
X3BsYW5lX3N0YXRlJiMzMjsqbmV3X3BsYW5lX3N0YXRlJiMzMjs9DQomZ3Q7JiMzMjtkcm1fYXRv
bWljX2dldF9uZXdfcGxhbmVfc3RhdGUoc3RhdGUsJiMzMjtwbGFuZSk7DQoNClRoaXMmIzMyO2lz
JiMzMjtub3QmIzMyO3JlbGF0ZWQmIzMyO3RvJiMzMjt0aGlzJiMzMjtwYXRjaCwmIzMyO3NvJiMz
Mjttb3ZlJiMzMjt0byYjMzI7YW5vdGhlciYjMzI7cGF0Y2guDQoNClJlZ2FyZHMsDQpDSw0KDQom
Z3Q7JiMzMjsmIzMyO3N0cnVjdCYjMzI7ZHJtX2NydGNfc3RhdGUmIzMyOypjcnRjX3N0YXRlOw0K
Jmd0OyYjMzI7JiMzMjtpbnQmIzMyO3JldDsNCiZndDsmIzMyOyYjMzI7DQomZ3Q7JiMzMjtAQCYj
MzI7LTEyMiwxMSYjMzI7KzEyMSw3JiMzMjtAQCYjMzI7c3RhdGljJiMzMjtpbnQmIzMyO210a19w
bGFuZV9hdG9taWNfYXN5bmNfY2hlY2soc3RydWN0DQomZ3Q7JiMzMjtkcm1fcGxhbmUmIzMyOypw
bGFuZSwNCiZndDsmIzMyOyYjMzI7aWYmIzMyOyhyZXQpDQomZ3Q7JiMzMjsmIzMyO3JldHVybiYj
MzI7cmV0Ow0KJmd0OyYjMzI7JiMzMjsNCiZndDsmIzMyOy1pZiYjMzI7KHN0YXRlKQ0KJmd0OyYj
MzI7LWNydGNfc3RhdGUmIzMyOz0mIzMyO2RybV9hdG9taWNfZ2V0X2V4aXN0aW5nX2NydGNfc3Rh
dGUoc3RhdGUsDQomZ3Q7JiMzMjstbmV3X3BsYQ0KJmd0OyYjMzI7bmVfc3RhdGUtJmd0O2NydGMp
Ow0KJmd0OyYjMzI7LWVsc2UmIzMyOy8qJiMzMjtTcGVjaWFsJiMzMjtjYXNlJiMzMjtmb3ImIzMy
O2FzeW5jaHJvbm91cyYjMzI7Y3Vyc29yJiMzMjt1cGRhdGVzLiYjMzI7Ki8NCiZndDsmIzMyOy1j
cnRjX3N0YXRlJiMzMjs9JiMzMjtuZXdfcGxhbmVfc3RhdGUtJmd0O2NydGMtJmd0O3N0YXRlOw0K
Jmd0OyYjMzI7K2NydGNfc3RhdGUmIzMyOz0mIzMyO2RybV9hdG9taWNfZ2V0X2V4aXN0aW5nX2Ny
dGNfc3RhdGUoc3RhdGUsDQomZ3Q7JiMzMjtuZXdfcGxhbmVfc3RhdGUtJmd0O2NydGMpOw0KJmd0
OyYjMzI7JiMzMjsNCiZndDsmIzMyOyYjMzI7cmV0dXJuJiMzMjtkcm1fYXRvbWljX2hlbHBlcl9j
aGVja19wbGFuZV9zdGF0ZShwbGFuZS0mZ3Q7c3RhdGUsDQomZ3Q7JiMzMjtjcnRjX3N0YXRlLA0K
Jmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtEUk1fUExBTkVfTk9fU0NBTElORw0KJmd0OyYj
MzI7LA0KDQo8L3ByZT48IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioqKioqKiog
TUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZSAqKioqKioqKioqKioqKioqKioqKg0KVGhl
IGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcg
YW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2
aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGlj
YWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRl
c2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1
dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNs
dWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0
cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBh
biBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUgDQp0aGF0IHlv
dSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBz
ZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUg
YW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwgKGluY2x1ZGluZyBhbnkgYXR0YWNo
bWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50
IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24uIFRoYW5rIHlvdSENCjwvcHJlPjwh
LS19LS0+

--__=_Part_Boundary_001_894907309.1214394374
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEphc29uOg0KDQpPbiBGcmksIDIwMjMtMDQtMDcgYXQgMTQ6NDYgKzA4MDAsIEphc29uLUpI
LkxpbiB3cm90ZToNCj4gTnVsbC1jaGVja2luZyBzdGF0ZSBzdWdnZXN0cyB0aGF0IGl0IG1heSBi
ZSBudWxsLCBidXQgaXQgaGFzIGFscmVhZHkNCj4gYmVlbiBkZXJlZmVyZW5jZWQgb24gZHJtX2F0
b21pY19nZXRfbmV3X3BsYW5lX3N0YXRlKHN0YXRlLCBwbGFuZSkuDQo+IA0KPiBUaGUgcGFyYW1l
dGVyIHN0YXRlIHdpbGwgbmV2ZXIgYmUgTlVMTCBjdXJyZW50bHksIHNvIGp1c3QgcmVtb3ZlIHRo
ZQ0KPiBzdGF0ZSBpcyBOVUxMIGZsb3cgaW4gdGhpcyBmdW5jdGlvbi4NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IEphc29uLUpILkxpbiA8amFzb24tamgubGluQG1lZGlhdGVrLmNvbT4NCj4gRml4ZXM6
IDVkZGIwYmQ0ZGRjMyAoImRybS9hdG9taWM6IFBhc3MgdGhlIGZ1bGwgc3RhdGUgdG8gcGxhbmVz
IGFzeW5jDQo+IGF0b21pYyBjaGVjayBhbmQgdXBkYXRlIikNCj4gLS0tDQo+ICBkcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9wbGFuZS5jIHwgOSArKy0tLS0tLS0NCj4gIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fcGxhbmUuYw0KPiBiL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX3BsYW5lLmMNCj4gaW5kZXggYTEzMzdmMzg2YmJmLi5l
MTRiMjkyMGQyNDIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHJtX3BsYW5lLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fcGxh
bmUuYw0KPiBAQCAtMTAzLDggKzEwMyw3IEBAIHN0YXRpYyB2b2lkIG10a19kcm1fcGxhbmVfZGVz
dHJveV9zdGF0ZShzdHJ1Y3QNCj4gZHJtX3BsYW5lICpwbGFuZSwNCj4gIHN0YXRpYyBpbnQgbXRr
X3BsYW5lX2F0b21pY19hc3luY19jaGVjayhzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwNCj4gIAkJ
CQkJc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlKQ0KPiAgew0KPiAtCXN0cnVjdCBkcm1f
cGxhbmVfc3RhdGUgKm5ld19wbGFuZV9zdGF0ZSA9DQo+IGRybV9hdG9taWNfZ2V0X25ld19wbGFu
ZV9zdGF0ZShzdGF0ZSwNCj4gLQkJCQkJCQkJCQ0KPiAJIHBsYW5lKTsNCj4gKwlzdHJ1Y3QgZHJt
X3BsYW5lX3N0YXRlICpuZXdfcGxhbmVfc3RhdGUgPQ0KPiBkcm1fYXRvbWljX2dldF9uZXdfcGxh
bmVfc3RhdGUoc3RhdGUsIHBsYW5lKTsNCg0KVGhpcyBpcyBub3QgcmVsYXRlZCB0byB0aGlzIHBh
dGNoLCBzbyBtb3ZlIHRvIGFub3RoZXIgcGF0Y2guDQoNClJlZ2FyZHMsDQpDSw0KDQo+ICAJc3Ry
dWN0IGRybV9jcnRjX3N0YXRlICpjcnRjX3N0YXRlOw0KPiAgCWludCByZXQ7DQo+ICANCj4gQEAg
LTEyMiwxMSArMTIxLDcgQEAgc3RhdGljIGludCBtdGtfcGxhbmVfYXRvbWljX2FzeW5jX2NoZWNr
KHN0cnVjdA0KPiBkcm1fcGxhbmUgKnBsYW5lLA0KPiAgCWlmIChyZXQpDQo+ICAJCXJldHVybiBy
ZXQ7DQo+ICANCj4gLQlpZiAoc3RhdGUpDQo+IC0JCWNydGNfc3RhdGUgPSBkcm1fYXRvbWljX2dl
dF9leGlzdGluZ19jcnRjX3N0YXRlKHN0YXRlLA0KPiAtCQkJCQkJCQluZXdfcGxhDQo+IG5lX3N0
YXRlLT5jcnRjKTsNCj4gLQllbHNlIC8qIFNwZWNpYWwgY2FzZSBmb3IgYXN5bmNocm9ub3VzIGN1
cnNvciB1cGRhdGVzLiAqLw0KPiAtCQljcnRjX3N0YXRlID0gbmV3X3BsYW5lX3N0YXRlLT5jcnRj
LT5zdGF0ZTsNCj4gKwljcnRjX3N0YXRlID0gZHJtX2F0b21pY19nZXRfZXhpc3RpbmdfY3J0Y19z
dGF0ZShzdGF0ZSwNCj4gbmV3X3BsYW5lX3N0YXRlLT5jcnRjKTsNCj4gIA0KPiAgCXJldHVybiBk
cm1fYXRvbWljX2hlbHBlcl9jaGVja19wbGFuZV9zdGF0ZShwbGFuZS0+c3RhdGUsDQo+IGNydGNf
c3RhdGUsDQo+ICAJCQkJCQkgICBEUk1fUExBTkVfTk9fU0NBTElORw0KPiAsDQo=

--__=_Part_Boundary_001_894907309.1214394374--

