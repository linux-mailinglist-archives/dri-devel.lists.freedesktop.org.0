Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C5B7823BD
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 08:31:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26DE110E1E5;
	Mon, 21 Aug 2023 06:31:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12A7F10E1DE
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 06:31:43 +0000 (UTC)
X-UUID: 6268fbe03fec11ee9cb5633481061a41-20230821
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=fruISjlCrQRyY7cXAKUCR5GWlBEYxFjJYoJDWfrXpxE=; 
 b=N3tCxKYEjMy5ydwna1yfqiFvLjn5LE4pIhPiwaSBe4gLijqsUvdbHgwRkkjntpw/3/hx1RRHQ2li4kEKzzZXZN8oRp4IW6XNfsXwtETp2div7gFGa+Q5rn7evifNmobzAlMVOfRbLylJ+lnP7AmaLKOubX6J93CwGHGJhEIXG7M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31, REQID:160effea-97d7-4e6a-b92c-e9c7f23ee765, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:0ad78a4, CLOUDID:f2a5c1ee-9a6e-4c39-b73e-f2bc08ca3dc5,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 6268fbe03fec11ee9cb5633481061a41-20230821
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 36533620; Mon, 21 Aug 2023 14:31:39 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 21 Aug 2023 14:31:37 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Mon, 21 Aug 2023 14:31:37 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b/G0G4sZaKlqsnBu8KiZAAfIzNMw2BeSgiBLFF6iZHzbHHcMA80T88AIV7Bjjn/nf6Awidz+LzNy1v7QivV6OVB3v7HVppaQwSIafGm1VGIaEMd8gpZ7x0XBTCasowOe4D3dRNZSahjtmNjT0Fut0jly0fzq6YUqea78D438c8zHAa0SskQaPU0QbDsownWf6vDH3tMS1lKOk7HtZTXiXpsyXfd0/JDDZVbbPXXZx78rnYos4JvSOil8svUBhC3MkYSql1mxVMsPR18nfgQ38RXV6n2yS0tDHv6kI6K+K+8Ec0my1qji5HCsgkHykDv5O7ItAo/03C9CmYZRDH7Wmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QYZmg+KBDTnxH+nBf7xDprjxaoePE99FhZ0sZP9RjXw=;
 b=QawobT/HLiBF0JmEfmx8CUZYXwGf5U/E7DfVGS1fJlRRdyc0K/7w5PbWpkrEvdg6buDS8uvPtZNsbIuM0QvD6/pJ3q/jpNKO4R1qwXoZwGlK7nwDKXAv+zSzXHj8mZJ7Qr/GdrmKnLvAvgTk9Q74oFM+AIGiVVnS3ITsQ6uLX92/kWjgJKKZHaaIZpwI2HoTc9aLIQ09dsyEuhQkR7V+7UKf0LXqxszkXHhc6YDxGlDRBIkDZkYfsK6rQwSfr8fHQf1OvepEH8T9nYuoGLc3dPKjDjd/ZRlZZruaStLApVqVu5meI+fhFVGEhF/ctw3lUZgWnhhxPFEi22gU7Tn8hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QYZmg+KBDTnxH+nBf7xDprjxaoePE99FhZ0sZP9RjXw=;
 b=qd4dzJdk5iShn7UZhJvjbbzQMpKAK0rkei4rRysnvnxL9BT1CFmzlcD+luFdC0p/nJVwTZbZVbog9DObECWbjm19sPqBOTEQ+LkpWBokPWSFjbzrP7X/5q41DGeRsCQ+W+J0nVK/T3KztSEYRqrxIywLte7AmF1bIEBriXcSvWk=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TY0PR03MB6824.apcprd03.prod.outlook.com (2603:1096:400:219::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 06:31:33 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::d126:7f34:9e4f:a95]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::d126:7f34:9e4f:a95%4]) with mapi id 15.20.6678.029; Mon, 21 Aug 2023
 06:31:33 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, 
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "eugen.hristev@collabora.com"
 <eugen.hristev@collabora.com>
Subject: Re: [PATCH v9 2/7] drm/mediatek: Add crtc path enum for all_drm_priv
 array
Thread-Topic: [PATCH v9 2/7] drm/mediatek: Add crtc path enum for all_drm_priv
 array
Thread-Index: AQHZyu2VSiYY0zYtaEeoilBWmH3Gc6/0XGQA
Date: Mon, 21 Aug 2023 06:31:33 +0000
Message-ID: <17aa53585b0510f49752746ec64fd2838254848a.camel@mediatek.com>
References: <20230809181525.7561-1-jason-jh.lin@mediatek.com>
 <20230809181525.7561-3-jason-jh.lin@mediatek.com>
In-Reply-To: <20230809181525.7561-3-jason-jh.lin@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TY0PR03MB6824:EE_
x-ms-office365-filtering-correlation-id: 606e71c5-29c2-4345-bf33-08dba210430b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wPESnnhQKuv0tzVYg139p8Ou7yEkQzCGSQL+4Wm4LDFz6bKO3T7Lh926vnTBgdz/SFbhK+ZJp7Rmcw0Q1qXJN6wi19jgt95u1bCflGq9IJ59HAYFNdDQnUCE+4AeO/7qRi3ZwW8gC4W72H0/6ArT/ubRqpjSwtAklbz5tO5hDqrHccRstEYCVpQbMKLmsCzeX6uD1dACfbtQRW6bGp3dgI+CCVio0j2jAy9R6CshUxxjiQ/B2f6WBLMWL/JAgyIzJdpJ4dnPmQjnzsxaP9Z9V6TCVYvVIgdMijjhsxhtSsgTLflgQdVnlvgBX+mP8pQrPxPm0WZ13vHeJQHpWboa1Dyo03u8K0LRNPjTChH7wHsgOriGddQsSZCdsGSq+5hZU8LsNjirLgeL++A4VRFHUNEVXX8+gWS1fIfUAYD5YrQVgwNXY8MD2VcJT2BivW5IhT8Pu8SrPGlSyAJJbrqGrdtPItJS+6s96gguGEvMIQV1y42O4bxHs4I1j8AbH6VLqsnZ4BRPBXNTg3V5qTAeIcbG8xbCrn1Z0fgV2zb7NcJV/J18bqx7w4OyjH3RSIR/36/76w/77+cgCLBd2W31JJ1ojkjOPkV+IcYP3WrAPeB/TQxozFwWUuiqKYiVgxI7e1LWN8h1jI8pQTlC1jhXfgOMmVQxXgaiQ6zfERSVPFW61BRmMLLLlKO5MiWEgWu3
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(39860400002)(346002)(376002)(366004)(186009)(1800799009)(451199024)(2906002)(38070700005)(38100700002)(83380400001)(122000001)(6486002)(6506007)(316002)(66946007)(76116006)(66446008)(64756008)(54906003)(66556008)(66476007)(91956017)(110136005)(71200400001)(41300700001)(6512007)(36756003)(478600001)(85182001)(12101799020)(86362001)(26005)(5660300002)(2616005)(8676002)(8936002)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UTdLNlJ1WkV5VUtTbktZd3VydjJTV1dIWnBaRUoxalBtQys0aDFwQ3Q5TUtF?=
 =?utf-8?B?RW10Y3A3RC8vTWZETVJwNGFhWkhHalkzR3ZEamh4RGQwa1FGSkJjVytJSGov?=
 =?utf-8?B?K2N5QlVab2Y4Y3RKVGV4MS9ZUWttRFVHajBsdlp2NlcyQU1nbTZJb1BnWU1p?=
 =?utf-8?B?S1k0VWE5YnZjZ1ZQS0w0eHpMU2UwQjRxSmgzbUEzR2swbGxCNUZzOHI0QWNn?=
 =?utf-8?B?U2pMYldIZ1U1aWVKTzNaQk40amN0UTNybFMveWk0SHJQYWN4RnlpWjNDamRI?=
 =?utf-8?B?WUFSSWZjcWJVM3l3TjJQeEdsUzhGNjhCaElNQ2luQ09IUzZqODZYVXlxUDFX?=
 =?utf-8?B?LzJOdmxrMm5ZYjZPcTYxWVJhTjhOOXliYW9hZDVhQWlZTFpPQXhKcndCVzJI?=
 =?utf-8?B?TUs4VGFKYmdOdFh0cEJCZEdRWGw2cTZzTE9zcTF4bmR6TjhQRVRQN05WQ0pJ?=
 =?utf-8?B?eFpXeEhUNWV6UktNVy9nSlFOV2t0ajh2Vm54bURKY3NTeHZNK1E0NmIvTzNr?=
 =?utf-8?B?SWJhMFp4amYyeVltN2lHY3BkRjB4MXJqQ0MyODB6bGxWN2dJM3BqTHRFRGRr?=
 =?utf-8?B?cmE0Rkw3eVlpNTZ4dmprVWNIZ0NCeC9lRXBBbWhXWWJyVHVOMERWdEJydjFI?=
 =?utf-8?B?WVc4ZlN1dEFvTTFuR25IdkYyNU9HdTR4L3FiT3hNMjJMREpJVWR2R3NGSGFZ?=
 =?utf-8?B?VlNnUDJmYUZ2bDk3MEdXSGorZkp6ckpBNVo3K0FFb2FOUHVlQzltOWhnU3l6?=
 =?utf-8?B?c2JsYkdNZ2Ixc3NUeENVQnRXUTdJV05YWjkwc2xQQ01TNC9oSHZRbFVLenFy?=
 =?utf-8?B?R09JRFRxZm9CRDcrMnM1L3dGZElzRy9yUVE1emY3TGhLS0REU3FqZjdTR2tz?=
 =?utf-8?B?MG50M1lTSndhQjRiWXRNQVJTN1hUNW5QZUliUzYyOUE5YzR0eGhlSzNsY2tJ?=
 =?utf-8?B?dWoxc1hOcUdGZDd0aC95czdSVHliRmk4ZWhRdkxicHVkVXB6V2VlTWdZcThy?=
 =?utf-8?B?SDV0RlBRYkFBa01YL2RwYytxcUU3UVJQRCsxVlJ6bnpNQnEyMU9mUUpEL01T?=
 =?utf-8?B?Zm9jalZiVWJTS1d3d1FvUEpwU2Y4N0RTbFdXeDNsWTZvY0tDRitycVl6REpa?=
 =?utf-8?B?UE5NcGFsRUNXQ25TbE8wbXRBcG03TXpMcUhHeXNERThMZXhhTGs5ZU8ydCtU?=
 =?utf-8?B?VjZ1TDNodEJIeXptRU1uZkxMOWRyMFp2a2MyZWtRcUN0QWtuRFlIVytRN2k3?=
 =?utf-8?B?Q25lNEZjOWhmc1pZVjE1eWI1THBmL29DdFBhRTVSTitYVUFHRjkxdkYrcjhF?=
 =?utf-8?B?blpybG5HU0NYZVd1bUN4QS91TU5PRUZEZkRveGpKejV5blRoTXlhcldnUGpL?=
 =?utf-8?B?ZXdVbnZYOVVOcUNhM3N3QnRDbDQ3TS9DSVJYdGNNOXBUNm1mY3RMNFlJcTU2?=
 =?utf-8?B?bjU4WW5CYkFqTGtxUG80QzhGc1d5LzJSZEtHeHVTNm9zY3Y4NmZHakk3OTJz?=
 =?utf-8?B?ZEpxTGVTZEpBMEIra0hrMHcwa2U5dHdTTndSaVdjK1hJTDBQTmVHYmtFMUox?=
 =?utf-8?B?Y0lEczlXZG41d3VjVWFERkpQUDN0czYxQWh6L3VjcnIwcU9tZmxwaWYrU05L?=
 =?utf-8?B?ZTlpMU83YjdHcG5tL3huUEtlUGo4ZjRFMmlLWE5oK2gzMFpkTTBUZTRKSXJW?=
 =?utf-8?B?SE14N2p2Vlc2TC9Ecmx2clM3M1lhQ0h4UkNiaDFiMmlLRjN2NHNkMHBxWS9V?=
 =?utf-8?B?aUgyVmhPMnR5dmllWHB5bnpUMDk1ZWpEQUJIWkpERGIwajJZUjRuSUtuVWJW?=
 =?utf-8?B?aksyRzZsYkIvTEJ5ODF5ajlGdW1oOURxSmpEUmhZWmJCYjRwb2luNlEvU3FC?=
 =?utf-8?B?c2FGS0gzYjZlS1BIVWZjQy84Ylpsbnk4VDlUMTVPczVjRmxxZzdtNVdVWjA4?=
 =?utf-8?B?V2FrdHNyQ3djQnQyZ1pCT0dIa1U0aGorWE9CNXptK3pzN2UvWEJGdmhhMFp3?=
 =?utf-8?B?bFVHbWl6S0FMaUcyUitteWpRUlJVZGNtSGsvWUpwcEhQQ3d0c3JiNksvZ1dj?=
 =?utf-8?B?WXJXV0Q4UzlodTR0amo5OFN6ZlB1Z1l5UFZtWW9ScDdOTXVCZVh0V3VqVElL?=
 =?utf-8?Q?MUosaiyIOGa7QjC+gF3+175To?=
Content-ID: <161D9FE946C2BF45985E3F0DA55A296C@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 606e71c5-29c2-4345-bf33-08dba210430b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2023 06:31:33.0877 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 07u8cF2oUNoQJCtsNi43SCEdtT4BQX1VtPGBFT/Yea4bvl4ofWod9ddm/chDMlBbQpOOB4bDUwFwsA3wpTdzVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6824
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_006_1701701412.429603572"
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
 =?utf-8?B?Sm9obnNvbiBXYW5nICjnjovogZbpkasp?= <Johnson.Wang@mediatek.com>,
 =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_006_1701701412.429603572
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCk9uJiMzMjtUaHUsJiMzMjsyMDIzLTA4LTEwJiMzMjthdCYjMzI7MDI6MTUmIzMyOysw
ODAwLCYjMzI7SmFzb24tSkguTGluJiMzMjt3cm90ZToNCiZndDsmIzMyO0FkZCYjMzI7bXRrX2Ry
bV9jcnRjX3BhdGgmIzMyO2VudW0mIzMyO2ZvciYjMzI7ZWFjaCYjMzI7ZGlzcGxheSYjMzI7cGF0
aC4NCiZndDsmIzMyOw0KJmd0OyYjMzI7SW5zdGVhZCYjMzI7b2YmIzMyO3VzaW5nJiMzMjthcnJh
eSYjMzI7aW5kZXgmIzMyO29mJiMzMjthbGxfZHJtX3ByaXYmIzMyO2luJiMzMjttdGtfZHJtX2tt
c19pbml0KCksDQomZ3Q7JiMzMjttdGtfZHJtX2NydGNfcGF0aCYjMzI7ZW51bSYjMzI7Y2FuJiMz
MjttYWtlJiMzMjtjb2RlJiMzMjttb3JlJiMzMjtyZWFkYWJsZS4NCg0KUmV2aWV3ZWQtYnk6JiMz
MjtDSyYjMzI7SHUmIzMyOyZsdDtjay5odUBtZWRpYXRlay5jb20mZ3Q7DQoNCiZndDsmIzMyOw0K
Jmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMyO0phc29uLUpILkxpbiYjMzI7Jmx0O2phc29uLWpo
LmxpbkBtZWRpYXRlay5jb20mZ3Q7DQomZ3Q7JiMzMjstLS0NCiZndDsmIzMyOyYjMzI7ZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMmIzMyO3wmIzMyOzYmIzMyOysrKy0tLQ0K
Jmd0OyYjMzI7JiMzMjtkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuaCYjMzI7
fCYjMzI7OCYjMzI7KysrKysrKy0NCiZndDsmIzMyOyYjMzI7MiYjMzI7ZmlsZXMmIzMyO2NoYW5n
ZWQsJiMzMjsxMCYjMzI7aW5zZXJ0aW9ucygrKSwmIzMyOzQmIzMyO2RlbGV0aW9ucygtKQ0KJmd0
OyYjMzI7DQomZ3Q7JiMzMjtkaWZmJiMzMjstLWdpdCYjMzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RybV9kcnYuYw0KJmd0OyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RybV9kcnYuYw0KJmd0OyYjMzI7aW5kZXgmIzMyOzI0OWM5ZmQ2MzQ3ZS4uODlhMzg1NjFi
YTI3JiMzMjsxMDA2NDQNCiZndDsmIzMyOy0tLSYjMzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RybV9kcnYuYw0KJmd0OyYjMzI7KysrJiMzMjtiL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHJtX2Rydi5jDQomZ3Q7JiMzMjtAQCYjMzI7LTQ2NSwyMSYjMzI7KzQ2NSwyMSYj
MzI7QEAmIzMyO3N0YXRpYyYjMzI7aW50JiMzMjttdGtfZHJtX2ttc19pbml0KHN0cnVjdCYjMzI7
ZHJtX2RldmljZQ0KJmd0OyYjMzI7KmRybSkNCiZndDsmIzMyOyYjMzI7Zm9yJiMzMjsoaiYjMzI7
PSYjMzI7MDsmIzMyO2omIzMyOyZsdDsmIzMyO3ByaXZhdGUtJmd0O2RhdGEtJmd0O21tc3lzX2Rl
dl9udW07JiMzMjtqKyspJiMzMjt7DQomZ3Q7JiMzMjsmIzMyO3ByaXZfbiYjMzI7PSYjMzI7cHJp
dmF0ZS0mZ3Q7YWxsX2RybV9wcml2YXRlW2pdOw0KJmd0OyYjMzI7JiMzMjsNCiZndDsmIzMyOy1p
ZiYjMzI7KGkmIzMyOz09JiMzMjswJiMzMjsmYW1wOyZhbXA7JiMzMjtwcml2X24tJmd0O2RhdGEt
Jmd0O21haW5fbGVuKSYjMzI7ew0KJmd0OyYjMzI7K2lmJiMzMjsoaSYjMzI7PT0mIzMyO0NSVENf
TUFJTiYjMzI7JmFtcDsmYW1wOyYjMzI7cHJpdl9uLSZndDtkYXRhLSZndDttYWluX2xlbikmIzMy
O3sNCiZndDsmIzMyOyYjMzI7cmV0JiMzMjs9JiMzMjttdGtfZHJtX2NydGNfY3JlYXRlKGRybSwm
IzMyO3ByaXZfbi0NCiZndDsmIzMyOyZndDtkYXRhLSZndDttYWluX3BhdGgsDQomZ3Q7JiMzMjsm
IzMyOyYjMzI7JiMzMjtwcml2X24tJmd0O2RhdGEtDQomZ3Q7JiMzMjsmZ3Q7bWFpbl9sZW4sJiMz
MjtqKTsNCiZndDsmIzMyOyYjMzI7aWYmIzMyOyhyZXQpDQomZ3Q7JiMzMjsmIzMyO2dvdG8mIzMy
O2Vycl9jb21wb25lbnRfdW5iaW5kOw0KJmd0OyYjMzI7JiMzMjsNCiZndDsmIzMyOyYjMzI7Y29u
dGludWU7DQomZ3Q7JiMzMjstfSYjMzI7ZWxzZSYjMzI7aWYmIzMyOyhpJiMzMjs9PSYjMzI7MSYj
MzI7JmFtcDsmYW1wOyYjMzI7cHJpdl9uLSZndDtkYXRhLSZndDtleHRfbGVuKSYjMzI7ew0KJmd0
OyYjMzI7K30mIzMyO2Vsc2UmIzMyO2lmJiMzMjsoaSYjMzI7PT0mIzMyO0NSVENfRVhUJiMzMjsm
YW1wOyZhbXA7JiMzMjtwcml2X24tJmd0O2RhdGEtDQomZ3Q7JiMzMjsmZ3Q7ZXh0X2xlbikmIzMy
O3sNCiZndDsmIzMyOyYjMzI7cmV0JiMzMjs9JiMzMjttdGtfZHJtX2NydGNfY3JlYXRlKGRybSwm
IzMyO3ByaXZfbi0NCiZndDsmIzMyOyZndDtkYXRhLSZndDtleHRfcGF0aCwNCiZndDsmIzMyOyYj
MzI7JiMzMjsmIzMyO3ByaXZfbi0mZ3Q7ZGF0YS0NCiZndDsmIzMyOyZndDtleHRfbGVuLCYjMzI7
aik7DQomZ3Q7JiMzMjsmIzMyO2lmJiMzMjsocmV0KQ0KJmd0OyYjMzI7JiMzMjtnb3RvJiMzMjtl
cnJfY29tcG9uZW50X3VuYmluZDsNCiZndDsmIzMyOyYjMzI7DQomZ3Q7JiMzMjsmIzMyO2NvbnRp
bnVlOw0KJmd0OyYjMzI7LX0mIzMyO2Vsc2UmIzMyO2lmJiMzMjsoaSYjMzI7PT0mIzMyOzImIzMy
OyZhbXA7JmFtcDsmIzMyO3ByaXZfbi0mZ3Q7ZGF0YS0mZ3Q7dGhpcmRfbGVuKSYjMzI7ew0KJmd0
OyYjMzI7K30mIzMyO2Vsc2UmIzMyO2lmJiMzMjsoaSYjMzI7PT0mIzMyO0NSVENfVEhJUkQmIzMy
OyZhbXA7JmFtcDsmIzMyO3ByaXZfbi0mZ3Q7ZGF0YS0NCiZndDsmIzMyOyZndDt0aGlyZF9sZW4p
JiMzMjt7DQomZ3Q7JiMzMjsmIzMyO3JldCYjMzI7PSYjMzI7bXRrX2RybV9jcnRjX2NyZWF0ZShk
cm0sJiMzMjtwcml2X24tDQomZ3Q7JiMzMjsmZ3Q7ZGF0YS0mZ3Q7dGhpcmRfcGF0aCwNCiZndDsm
IzMyOyYjMzI7JiMzMjsmIzMyO3ByaXZfbi0mZ3Q7ZGF0YS0NCiZndDsmIzMyOyZndDt0aGlyZF9s
ZW4sJiMzMjtqKTsNCiZndDsmIzMyOyYjMzI7aWYmIzMyOyhyZXQpDQomZ3Q7JiMzMjtkaWZmJiMz
MjstLWdpdCYjMzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuaA0KJmd0
OyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuaA0KJmd0OyYjMzI7
aW5kZXgmIzMyO2ViMmZkNDU5NDFmMC4uZjRkZThiYjI3Njg1JiMzMjsxMDA2NDQNCiZndDsmIzMy
Oy0tLSYjMzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuaA0KJmd0OyYj
MzI7KysrJiMzMjtiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5oDQomZ3Q7
JiMzMjtAQCYjMzI7LTksMTEmIzMyOys5LDE3JiMzMjtAQA0KJmd0OyYjMzI7JiMzMjsjaW5jbHVk
ZSYjMzI7Jmx0O2xpbnV4L2lvLmgmZ3Q7DQomZ3Q7JiMzMjsmIzMyOyNpbmNsdWRlJiMzMjsmcXVv
dDttdGtfZHJtX2RkcF9jb21wLmgmcXVvdDsNCiZndDsmIzMyOyYjMzI7DQomZ3Q7JiMzMjstI2Rl
ZmluZSYjMzI7TUFYX0NSVEMzDQomZ3Q7JiMzMjsmIzMyOyNkZWZpbmUmIzMyO01BWF9DT05ORUNU
T1IyDQomZ3Q7JiMzMjsmIzMyOyNkZWZpbmUmIzMyO0REUF9DT01QT05FTlRfRFJNX09WTF9BREFQ
VE9SJiMzMjsoRERQX0NPTVBPTkVOVF9JRF9NQVgmIzMyOysmIzMyOzEpDQomZ3Q7JiMzMjsmIzMy
OyNkZWZpbmUmIzMyO0REUF9DT01QT05FTlRfRFJNX0lEX01BWCYjMzI7KEREUF9DT01QT05FTlRf
RFJNX09WTF9BREFQVE9SJiMzMjsrJiMzMjsxKQ0KJmd0OyYjMzI7JiMzMjsNCiZndDsmIzMyOytl
bnVtJiMzMjttdGtfZHJtX2NydGNfcGF0aCYjMzI7ew0KJmd0OyYjMzI7K0NSVENfTUFJTiwNCiZn
dDsmIzMyOytDUlRDX0VYVCwNCiZndDsmIzMyOytDUlRDX1RISVJELA0KJmd0OyYjMzI7K01BWF9D
UlRDLA0KJmd0OyYjMzI7K307DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsmIzMyO3N0cnVjdCYjMzI7
ZGV2aWNlOw0KJmd0OyYjMzI7JiMzMjtzdHJ1Y3QmIzMyO2RldmljZV9ub2RlOw0KJmd0OyYjMzI7
JiMzMjtzdHJ1Y3QmIzMyO2RybV9jcnRjOw0KDQo8L3ByZT48IS0tdHlwZTp0ZXh0LS0+PCEtLXst
LT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZSAqKioq
KioqKioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFp
bCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRp
YWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRp
c2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNv
bnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNz
ZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5n
IG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5k
ZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3
ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWws
IG9yIGJlbGlldmUgDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9y
LCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8g
dGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwg
KGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QN
CmRpc2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24u
IFRoYW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_006_1701701412.429603572
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDIzLTA4LTEwIGF0IDAyOjE1ICswODAwLCBKYXNvbi1KSC5MaW4gd3JvdGU6DQo+
IEFkZCBtdGtfZHJtX2NydGNfcGF0aCBlbnVtIGZvciBlYWNoIGRpc3BsYXkgcGF0aC4NCj4gDQo+
IEluc3RlYWQgb2YgdXNpbmcgYXJyYXkgaW5kZXggb2YgYWxsX2RybV9wcml2IGluIG10a19kcm1f
a21zX2luaXQoKSwNCj4gbXRrX2RybV9jcnRjX3BhdGggZW51bSBjYW4gbWFrZSBjb2RlIG1vcmUg
cmVhZGFibGUuDQoNClJldmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPg0KDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbi1KSC5MaW4gPGphc29uLWpoLmxpbkBtZWRpYXRlay5j
b20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMgfCA2
ICsrKy0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmggfCA4ICsr
KysrKystDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25z
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1f
ZHJ2LmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYw0KPiBpbmRl
eCAyNDljOWZkNjM0N2UuLjg5YTM4NTYxYmEyNyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kcm1fZHJ2LmMNCj4gQEAgLTQ2NSwyMSArNDY1LDIxIEBAIHN0YXRpYyBpbnQgbXRr
X2RybV9rbXNfaW5pdChzdHJ1Y3QgZHJtX2RldmljZQ0KPiAqZHJtKQ0KPiAgCQlmb3IgKGogPSAw
OyBqIDwgcHJpdmF0ZS0+ZGF0YS0+bW1zeXNfZGV2X251bTsgaisrKSB7DQo+ICAJCQlwcml2X24g
PSBwcml2YXRlLT5hbGxfZHJtX3ByaXZhdGVbal07DQo+ICANCj4gLQkJCWlmIChpID09IDAgJiYg
cHJpdl9uLT5kYXRhLT5tYWluX2xlbikgew0KPiArCQkJaWYgKGkgPT0gQ1JUQ19NQUlOICYmIHBy
aXZfbi0+ZGF0YS0+bWFpbl9sZW4pIHsNCj4gIAkJCQlyZXQgPSBtdGtfZHJtX2NydGNfY3JlYXRl
KGRybSwgcHJpdl9uLQ0KPiA+ZGF0YS0+bWFpbl9wYXRoLA0KPiAgCQkJCQkJCSAgcHJpdl9uLT5k
YXRhLQ0KPiA+bWFpbl9sZW4sIGopOw0KPiAgCQkJCWlmIChyZXQpDQo+ICAJCQkJCWdvdG8gZXJy
X2NvbXBvbmVudF91bmJpbmQ7DQo+ICANCj4gIAkJCQljb250aW51ZTsNCj4gLQkJCX0gZWxzZSBp
ZiAoaSA9PSAxICYmIHByaXZfbi0+ZGF0YS0+ZXh0X2xlbikgew0KPiArCQkJfSBlbHNlIGlmIChp
ID09IENSVENfRVhUICYmIHByaXZfbi0+ZGF0YS0NCj4gPmV4dF9sZW4pIHsNCj4gIAkJCQlyZXQg
PSBtdGtfZHJtX2NydGNfY3JlYXRlKGRybSwgcHJpdl9uLQ0KPiA+ZGF0YS0+ZXh0X3BhdGgsDQo+
ICAJCQkJCQkJICBwcml2X24tPmRhdGEtDQo+ID5leHRfbGVuLCBqKTsNCj4gIAkJCQlpZiAocmV0
KQ0KPiAgCQkJCQlnb3RvIGVycl9jb21wb25lbnRfdW5iaW5kOw0KPiAgDQo+ICAJCQkJY29udGlu
dWU7DQo+IC0JCQl9IGVsc2UgaWYgKGkgPT0gMiAmJiBwcml2X24tPmRhdGEtPnRoaXJkX2xlbikg
ew0KPiArCQkJfSBlbHNlIGlmIChpID09IENSVENfVEhJUkQgJiYgcHJpdl9uLT5kYXRhLQ0KPiA+
dGhpcmRfbGVuKSB7DQo+ICAJCQkJcmV0ID0gbXRrX2RybV9jcnRjX2NyZWF0ZShkcm0sIHByaXZf
bi0NCj4gPmRhdGEtPnRoaXJkX3BhdGgsDQo+ICAJCQkJCQkJICBwcml2X24tPmRhdGEtDQo+ID50
aGlyZF9sZW4sIGopOw0KPiAgCQkJCWlmIChyZXQpDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuaA0KPiBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZHJtX2Rydi5oDQo+IGluZGV4IGViMmZkNDU5NDFmMC4uZjRkZThiYjI3Njg1IDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuaA0KPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuaA0KPiBAQCAtOSwxMSArOSwx
NyBAQA0KPiAgI2luY2x1ZGUgPGxpbnV4L2lvLmg+DQo+ICAjaW5jbHVkZSAibXRrX2RybV9kZHBf
Y29tcC5oIg0KPiAgDQo+IC0jZGVmaW5lIE1BWF9DUlRDCTMNCj4gICNkZWZpbmUgTUFYX0NPTk5F
Q1RPUgkyDQo+ICAjZGVmaW5lIEREUF9DT01QT05FTlRfRFJNX09WTF9BREFQVE9SIChERFBfQ09N
UE9ORU5UX0lEX01BWCArIDEpDQo+ICAjZGVmaW5lIEREUF9DT01QT05FTlRfRFJNX0lEX01BWCAo
RERQX0NPTVBPTkVOVF9EUk1fT1ZMX0FEQVBUT1IgKyAxKQ0KPiAgDQo+ICtlbnVtIG10a19kcm1f
Y3J0Y19wYXRoIHsNCj4gKwlDUlRDX01BSU4sDQo+ICsJQ1JUQ19FWFQsDQo+ICsJQ1JUQ19USElS
RCwNCj4gKwlNQVhfQ1JUQywNCj4gK307DQo+ICsNCj4gIHN0cnVjdCBkZXZpY2U7DQo+ICBzdHJ1
Y3QgZGV2aWNlX25vZGU7DQo+ICBzdHJ1Y3QgZHJtX2NydGM7DQo=

--__=_Part_Boundary_006_1701701412.429603572--

