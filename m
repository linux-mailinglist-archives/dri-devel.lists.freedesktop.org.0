Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E35A753233
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 08:45:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ACE910E7C8;
	Fri, 14 Jul 2023 06:45:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A032910E7CC
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 06:45:49 +0000 (UTC)
X-UUID: 0f09843a221211ee9cb5633481061a41-20230714
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=BLWfU+oCFLYqZWBUzGctzReyTdew/sKq8JLuGPl7PSc=; 
 b=qTbTADtFUO19HfUC2h/wzYDce9Lr3XMTeZj2b1dPk6fKev/cuOdEQ/YTKn/W72qRvS+aXGcZRvTwWugz4yonAhb3qoloFmiY3TwZFKlwtY87+4S+9OjVximsFMw9CuUMx81lxR+9uFe5rAt2bIChKNPgycA9Jkk8Yww+oyDK8c0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.28, REQID:0b781a64-b2ec-411f-9113-a90c82b0b4ef, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:45
X-CID-INFO: VERSION:1.1.28, REQID:0b781a64-b2ec-411f-9113-a90c82b0b4ef, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:45
X-CID-META: VersionHash:176cd25, CLOUDID:cf48b34c-06c1-468b-847d-5b62d44dbb9b,
 B
 ulkID:230714134512055O1J91,BulkQuantity:7,Recheck:0,SF:38|29|28|17|19|48|1
 02,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,CO
 L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:PA,DKP:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SDM,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_SNR
X-UUID: 0f09843a221211ee9cb5633481061a41-20230714
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 167640148; Fri, 14 Jul 2023 14:45:45 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 14 Jul 2023 14:45:44 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Fri, 14 Jul 2023 14:45:43 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B93YDnbiImkOssuI8E3cjLo6p0nuxlOH5SRB9x+1ADMuA+JL08Zzc/+bRuWYziaPK2HpZ1m8xF+yapBM9NIJUI4ygQqFLlD657pMLN9cQPHb0RAKLOY/OA8J4OaKzgn31bR/JRMAnr/oIxs1afUDJjxvH7ta32I/OWNxZeIFooNhjH1mcrVkvlR6S6Nhs7ob86MXgD7vDP4ywi/y5PPKVG0cxkqsUkpZOZDHVJ+HHstkkEk+aSFgZUT5+HdMYe9oSuo/JuBQwb1am/Ww0DInbTHLWaETFw79ncOou2lZR6+HQy8YeSOIKU1SSZMcwyQmmokvxW0lwN3Ep9yOxuJW9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SAsBQaAzeppUr5tRnv57wikcxRi+5ynEaFB6g4fUpzM=;
 b=menW/jVGXHism5WiQQxyM+J9XC9mLUV0tvFfVwRzCvNyu7LnhRsEs1enyryfETpFqhdFOeQErIGzNqnvgJkxuX4/REkH7QxjwrcekcBUY+l33V0itbIWdhdOP3NJYs5icjD3o0cZlcKSXx68fnJg26Zoip2rPo3t1PRPMO8EL5P587mKuAyiUm9TGiWyaPWMqXrPRuG5rXC5r9FzyAs+0shprQxfHrCmcMh/3KM1jhvfAh4HsgbBEczJUv07CDSNvUXCTPNA93XBfP8tkuNn9xyp8vBGrFHW+/omUkZKp6DaeTgbFFVuWOiVg5kQdULx7o2+mQzu0tP1CF51dYaTVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SAsBQaAzeppUr5tRnv57wikcxRi+5ynEaFB6g4fUpzM=;
 b=gG7XFuR3iU/cajm8+6jYQrOE2MpG4sfGGJko4i7gNnREVtWpyLJlhMcBSAZYxDgQKcvTRqns+gfSmNDuY4nrjKlzQUbfkX1qDJY4/06z0DvxWHw3crWIkO7rT5D8eFQfLxWMMgAZVFTKfPVl9LuGI6D+u1rYXWIVJpwpttXapcA=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by TYZPR03MB6134.apcprd03.prod.outlook.com (2603:1096:400:12d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 06:45:39 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::8cad:9f8b:a761:21d4]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::8cad:9f8b:a761:21d4%7]) with mapi id 15.20.6565.028; Fri, 14 Jul 2023
 06:45:39 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "amergnat@baylibre.com" <amergnat@baylibre.com>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v3 3/4] drm/mediatek: Add casting before assign
Thread-Topic: [PATCH v3 3/4] drm/mediatek: Add casting before assign
Thread-Index: AQHZpCpze4o/ajTsOEOlfRNPyXn/w6+45FuAgAAQ54A=
Date: Fri, 14 Jul 2023 06:45:38 +0000
Message-ID: <9d2e3526bd30e9f307eab32b67f487fa4ab102eb.camel@mediatek.com>
References: <20230621102247.10116-1-jason-jh.lin@mediatek.com>
 <20230621102247.10116-4-jason-jh.lin@mediatek.com>
 <f8a838524f0ce324495fcf2994488d76768cae2f.camel@mediatek.com>
In-Reply-To: <f8a838524f0ce324495fcf2994488d76768cae2f.camel@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|TYZPR03MB6134:EE_
x-ms-office365-filtering-correlation-id: 144cd4bf-6fc9-4fa6-22c9-08db8435ef78
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Qb+f6e6gqbewKUG8rwXZNuoDWa/ouA/7GwRB4cItb/IDRLGg4lAoLuHy8SvEFH1WMUYw5OA4KhNlKurrJqlNpMl4D2SeiiMWREA+Dtk6tmgvu42gEfLCtuY44XIo+C1RrgOzrwCZShZovfrPsg5Rr7G/mzyyuOuij1Xgws+PQ/6T0lGwRiJ4f6gSujAd3FhkuwDrsa+SRbjxf7zZGY0JTIngeIEw7s6CckRKhiklH/KeGCFU775QBNPv1GwStQF35gRPY69R65z326LGTT8y3LNNQGpDWHfktutXTk2Q00mlDLbI7OSGQ8FtKYcmCYnx9GNVjSRvOQnOYu2gUnzo6IdyDtPvzNLVLVgLwaAwTu/V3R/pr77qFDtHL3Gasz5GzWvs6mZ/WZlbDuJz7I8QERbj2jcTJwNd8btfwSXs8oevmJmi1NTev2hIiKXsJg90vzSAdxEOGXVIlHXK4hGrHqAkFWTWtzvDqBE0MtVt5oGGsHro2gvEmWjYjOjSxyOZHV/jy10MUf3GfzqJ7NRx/wtDTcPNUwM/ERHR2MiRx1oJx8V16vUJVRYBC49/1YkZ+7x34+kYIvVoxa0eHXwtXFZWutCN9h0TLHXeABW78nglhpD0RFsqB3JTyeMojrLAst/V6fImc2b+OoQBSYdFyKDM9Kkkt1GAu44bJ9RfPKrxpCjtWo5Dv8XmicsSA1VD
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(39860400002)(376002)(136003)(396003)(346002)(451199021)(478600001)(26005)(6506007)(6512007)(6486002)(71200400001)(8936002)(8676002)(38070700005)(5660300002)(2616005)(316002)(41300700001)(86362001)(2906002)(4744005)(122000001)(186003)(38100700002)(85182001)(36756003)(64756008)(66556008)(66446008)(66476007)(76116006)(66946007)(4326008)(91956017)(110136005)(54906003)(266184004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RFY2M2sxODY5Tkw3TGhhK1lvbVZDaEVtV2ZYMENmVWlaWmtiUG51U3IzSDZ4?=
 =?utf-8?B?V09jaFUyYkI0K1p5S2tkbXQ4YjMwalA5Z2cyeFZibWhGbklpRWJWRVJtdzhT?=
 =?utf-8?B?dUJ0ZkhzcDlnR2pqa05nUS9VZHAxN3pNU3h3T1pyZFBqT3pjdTZ0bVhoWUpU?=
 =?utf-8?B?a01CczAwcW5zTU05QndGQ1lNTVJIL05JbEs4NHhpeVo2ZzZJMW5kb2R4amNO?=
 =?utf-8?B?Nmt4Q3J0bmR4bVZ6ZnJHckNKZDdjY08xSnk2TEVHVXl0YkwzZ1N3c01QUFl0?=
 =?utf-8?B?QThnczB2c1RBSEVjcTAzbFVOTnpad3pSQmhZR0MzRWhHVEk3aG9jWTdpd1dL?=
 =?utf-8?B?MWhUYi9RS1BjaVRrYis4K1kraG16dXA2TU1wZ295U25BaEgzMDhyN2FqNlh3?=
 =?utf-8?B?MGtrS043bmRGN3M5aXI4MVR6YWpETjJ1OWtnS3IrTldKaURxMlJNcDlwRXpV?=
 =?utf-8?B?Mm1ITTViVWdXTEw2d1pvbXVOcnJaMVpGQkxqbmFZU2RyR09SRk15OVBjOEha?=
 =?utf-8?B?cVR1QVNEYjZIQW9tOWJFbUNteWczYnk1L2VBNVZIN2xmOXFHbVBEcmlRVy9M?=
 =?utf-8?B?Q0ZOYlJ1TjZsOTZ1aFl2b0Z6amJaQWhUUXRYR1VQR2l1bi9HbEs4TGVVbzky?=
 =?utf-8?B?akdpcHErV2Q5SEtmNEc4VGg1eDJTZ0xTTHJsOWN4RTNobVdTOUIxRVRpNHNX?=
 =?utf-8?B?TDB5Q0l1RjNkalY3R21qcG51Q0R4aFVENVF4RjFnMUZnYldNU0U0MHFqZ2Rh?=
 =?utf-8?B?Vk93TUlab0lBWVlsV0IxMTZiWW00c004RTYxY3hiSlFJVzArd2Q3UWt2MHFF?=
 =?utf-8?B?d2c1bDFTU0hzZTVHVTJrR0lTSUNWblp3enBOQi9iQ3p3ZTA0VU9MWFhIanJJ?=
 =?utf-8?B?dlkyQnlTZG9GelFoY29URXNNYURQcUp5aXZxQWxBZTFuTkhrT1ZNTmtrUnFS?=
 =?utf-8?B?dzJQQk5maUNETmk4eFFxNnhZRUJRRXNxeE5QV2tDUklMQnZva0dVWnAxaDkz?=
 =?utf-8?B?NE1IZWRNRVJ3T3ZqM3hiQmVPL2tDbHByOUI5T05vcmdyQmc5eno0VTUyeUpn?=
 =?utf-8?B?aWVJM0FLVGJzNWNGclJsSm90NG1Ia3RTTjR4WFNOenVSWm11Vk55ZlV6Z1lv?=
 =?utf-8?B?Uyt6M1J4KzVkVGNmRkJRYWZGKzNsTHpTUXgvQytTT1NTOEVqM3NTM0V6c0Fm?=
 =?utf-8?B?UjYyRzg5aVovMXMzbk00NzNQQlg4Z3N3ZEJFYmxCYUR0eHkyQkpiU2FmZW93?=
 =?utf-8?B?bUtvR2tjblBTSVErYzdxWVVqckNsd0IwWjQrOFpRNkpna1BhOEhOajh3OEdR?=
 =?utf-8?B?cWVTcEg2TjFmdnJRbG8zN256SmFlMkpKMGNlaTBJMDArbHRHQkIra213NkFs?=
 =?utf-8?B?VjdGVVNVZTcrMS9hbEZoVi8rVmloTnFGRlMyQ3FocmFSWGUzMW9nZmhGL1Ey?=
 =?utf-8?B?YmxCT0Vyak5iSFFvbmc0dGQ5UnFDd01vekZJeG5qa3pPcnhMS214ZExyOVpW?=
 =?utf-8?B?SDB1NUV6RHV2T3RnZ2Y2MlZXODZ4NkZFY2RKYlEvT2RVWjVBMHpsRmJSUi9y?=
 =?utf-8?B?UURFcUM5WFMxM09BVVJLM1dWeStQdVNEWGJYQitBV1p1eTVOaUtjUjdNMExu?=
 =?utf-8?B?YS8vNXFGWUZzUCtROE9kdFJXa1luYnZHalNJMnlzSkd4RGxrcWFGN0FaYzBL?=
 =?utf-8?B?aVJad3N1cFR0ak5GZSs2VU1wQU01bGRHV0hHUFpyNk9QT3ZYYVpNS2pYZEZL?=
 =?utf-8?B?NGF4Um9HV1orVGVGM2JzeDJaQ25pRGFPd0ZzbTVJaEZuTmhpNG52cXBydUEr?=
 =?utf-8?B?MjM2b2FNQkJNMVIrNUJlMTM3Tjllc094SXpOcTdkdzMxdWFUVXNvVXB2Q0JW?=
 =?utf-8?B?U3MvYjhUengxVW5GaGNaNnYxcUs5b2pRdlJ4L2ZyS1BPRDdpWXE3RTZkd2k4?=
 =?utf-8?B?REdHaEp0U2haVFF4alp5SUtKZmU5U1lHWEY1WmxNak55aHorMmJVc0wvN29v?=
 =?utf-8?B?K0p4aXhLOFI1WG5iQi8vVFk4ZzRnY1JYZjZPSXBselRHRjlnNnI5ZlNISlpj?=
 =?utf-8?B?N2MzY2FmVFNLemxDYUlPZjRqb3ZQRHFhdUVKZTJ3Wi9sTE5wNXo4VkJYaFBP?=
 =?utf-8?B?R0dEYTdYd2NKaGlWMmtRb1habExZaEk2dWUxdEVKWUdjWlUvVEVtcjlGTERH?=
 =?utf-8?B?cWc9PQ==?=
Content-ID: <868BEBE7FE854B40B6881D6ABEBCB9D8@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 144cd4bf-6fc9-4fa6-22c9-08db8435ef78
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2023 06:45:38.8797 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YqfyGFJt0UHHSjFfJrNf7xBwu/dcOpK9C9jECTdqZ6z+p/rfqdluxkeMK/zrhQymW55T8CgN2CF1iYKsgqSVlgLLAm0ghU72z+rGob0QHyU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6134
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_001_416429341.2858955"
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

--__=_Part_Boundary_001_416429341.2858955
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpJiMzMjtDSywNCg0KVGhhbmtzJiMzMjtmb3ImIzMyO3RoZSYjMzI7cmV2aWV3cy4N
Cg0KT24mIzMyO0ZyaSwmIzMyOzIwMjMtMDctMTQmIzMyO2F0JiMzMjswNTo0NSYjMzI7KzAwMDAs
JiMzMjtDSyYjMzI7SHUmIzMyOygmIzMyOTkzOyYjMjA0MjY7JiMyMDgwOTspJiMzMjt3cm90ZToN
CiZndDsmIzMyO0hpLCYjMzI7SmFzb246DQomZ3Q7JiMzMjsNCiZndDsmIzMyO09uJiMzMjtXZWQs
JiMzMjsyMDIzLTA2LTIxJiMzMjthdCYjMzI7MTg6MjImIzMyOyswODAwLCYjMzI7SmFzb24tSkgu
TGluJiMzMjt3cm90ZToNCiZndDsmIzMyOyZndDsmIzMyOzEuJiMzMjtBZGQmIzMyO2Nhc3Rpbmcm
IzMyO2JlZm9yZSYjMzI7YXNzaWduJiMzMjt0byYjMzI7YXZvaWQmIzMyO3RoZSYjMzI7dW5pbnRl
bnRpb25hbCYjMzI7aW50ZWdlcg0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7b3Zl
cmZsb3cmIzMyO29yJiMzMjt1bmludGVuZGVkJiMzMjtzaWduJiMzMjtleHRlbnNpb24uDQomZ3Q7
JiMzMjsmZ3Q7JiMzMjsyLiYjMzI7QWRkJiMzMjthJiMzMjtpbnQmIzMyO3ZhcnJpYWJsZSYjMzI7
Zm9yJiMzMjttdWx0aXBsaWVyJiMzMjtjYWxjdWxhdGlvbiYjMzI7aW5zdGVhZCYjMzI7b2YNCiZn
dDsmIzMyOyZndDsmIzMyO2NhbGN1bGF0aW5nDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMyOyYjMzI7
JiMzMjtkaWZmZXJlbnQmIzMyO3R5cGVzJiMzMjttdWx0aXBsaWVyJiMzMjt3aXRoJiMzMjtkbWFf
YWRkcl90JiMzMjt2YXJyaWFibGUmIzMyO2RpcmVjdGx5Lg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtJ
JiMzMjthZ3JlZSYjMzI7d2l0aCYjMzI7dGhlc2UmIzMyO21vZGlmaWNhdGlvbiwmIzMyO2J1dCYj
MzI7dGhlJiMzMjt0aXRsZSYjMzI7ZG9lcyYjMzI7bm90JiMzMjttYXRjaCYjMzI7dGhlDQomZ3Q7
JiMzMjttb2RpZmljYXRpb24uDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1JlZ2FyZHMsDQomZ3Q7JiMz
MjtDSw0KDQpJJiMzOTtsbCYjMzI7Y2hhbmdlJiMzMjt0aGUmIzMyO3RpdGxlJiMzMjthbmQmIzMy
O2NvbW1pdCYjMzI7bXNnJiMzMjthdCYjMzI7dGhlJiMzMjtuZXh0JiMzMjt2ZXJzaW9uJiMzMjti
ZWxvdzoNCg0KRml4JiMzMjt1bmludGVudGlvbmFsJiMzMjtpbnRlZ2VyJiMzMjtvdmVyZmxvdyYj
MzI7aW4mIzMyO211bHRpcGx5aW5nJiMzMjtkaWZmZXJlbnQmIzMyO3R5cGVzDQoNCjEuJiMzMjtJ
bnN0ZWFkJiMzMjtvZiYjMzI7bXVsdGlwbHlpbmcmIzMyOzImIzMyO3ZhcmlhYmxlJiMzMjtvZiYj
MzI7ZGlmZmVyZW50JiMzMjt0eXBlcy4mIzMyO0NoYW5nZSYjMzI7dG8NCmFzc2lnbiYjMzI7YSYj
MzI7dmFsdWUmIzMyO29mJiMzMjtvbmUmIzMyO3ZhcmlhYmxlJiMzMjthbmQmIzMyO3RoZW4mIzMy
O211bHRpcGx5JiMzMjt0aGUmIzMyO290aGVyJiMzMjt2YXJpYWJsZS4NCg0KMi4mIzMyO0FkZCYj
MzI7YSYjMzI7aW50JiMzMjt2YXJpYWJsZSYjMzI7Zm9yJiMzMjttdWx0aXBsaWVyJiMzMjtjYWxj
dWxhdGlvbiYjMzI7aW5zdGVhZCYjMzI7b2YmIzMyO2NhbGN1bGF0aW5nDQpkaWZmZXJlbnQmIzMy
O3R5cGVzJiMzMjttdWx0aXBsaWVyJiMzMjt3aXRoJiMzMjtkbWFfYWRkcl90JiMzMjt2YXJpYWJs
ZSYjMzI7ZGlyZWN0bHkuDQoNCg0KVGhhbmtzIQ0KDQpSZWdhcmRzLA0KSmFzb24tSkguTGluDQom
Z3Q7JiMzMjsNCg0KPC9wcmU+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioq
KioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioqKioqKioqKioN
ClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVk
aW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwg
cHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFw
cGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRvIHRo
ZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0
cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAo
aW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBp
cyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBu
b3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlIA0KdGhh
dCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0
aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVs
ZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0
dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29u
dGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3By
ZT48IS0tfS0tPg==

--__=_Part_Boundary_001_416429341.2858955
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQ0ssDQoNClRoYW5rcyBmb3IgdGhlIHJldmlld3MuDQoNCk9uIEZyaSwgMjAyMy0wNy0xNCBh
dCAwNTo0NSArMDAwMCwgQ0sgSHUgKOiDoeS/iuWFiSkgd3JvdGU6DQo+IEhpLCBKYXNvbjoNCj4g
DQo+IE9uIFdlZCwgMjAyMy0wNi0yMSBhdCAxODoyMiArMDgwMCwgSmFzb24tSkguTGluIHdyb3Rl
Og0KPiA+IDEuIEFkZCBjYXN0aW5nIGJlZm9yZSBhc3NpZ24gdG8gYXZvaWQgdGhlIHVuaW50ZW50
aW9uYWwgaW50ZWdlcg0KPiA+ICAgIG92ZXJmbG93IG9yIHVuaW50ZW5kZWQgc2lnbiBleHRlbnNp
b24uDQo+ID4gMi4gQWRkIGEgaW50IHZhcnJpYWJsZSBmb3IgbXVsdGlwbGllciBjYWxjdWxhdGlv
biBpbnN0ZWFkIG9mDQo+ID4gY2FsY3VsYXRpbmcNCj4gPiAgICBkaWZmZXJlbnQgdHlwZXMgbXVs
dGlwbGllciB3aXRoIGRtYV9hZGRyX3QgdmFycmlhYmxlIGRpcmVjdGx5Lg0KPiANCj4gSSBhZ3Jl
ZSB3aXRoIHRoZXNlIG1vZGlmaWNhdGlvbiwgYnV0IHRoZSB0aXRsZSBkb2VzIG5vdCBtYXRjaCB0
aGUNCj4gbW9kaWZpY2F0aW9uLg0KPiANCj4gUmVnYXJkcywNCj4gQ0sNCg0KSSdsbCBjaGFuZ2Ug
dGhlIHRpdGxlIGFuZCBjb21taXQgbXNnIGF0IHRoZSBuZXh0IHZlcnNpb24gYmVsb3c6DQoNCkZp
eCB1bmludGVudGlvbmFsIGludGVnZXIgb3ZlcmZsb3cgaW4gbXVsdGlwbHlpbmcgZGlmZmVyZW50
IHR5cGVzDQoNCjEuIEluc3RlYWQgb2YgbXVsdGlwbHlpbmcgMiB2YXJpYWJsZSBvZiBkaWZmZXJl
bnQgdHlwZXMuIENoYW5nZSB0bw0KYXNzaWduIGEgdmFsdWUgb2Ygb25lIHZhcmlhYmxlIGFuZCB0
aGVuIG11bHRpcGx5IHRoZSBvdGhlciB2YXJpYWJsZS4NCg0KMi4gQWRkIGEgaW50IHZhcmlhYmxl
IGZvciBtdWx0aXBsaWVyIGNhbGN1bGF0aW9uIGluc3RlYWQgb2YgY2FsY3VsYXRpbmcNCmRpZmZl
cmVudCB0eXBlcyBtdWx0aXBsaWVyIHdpdGggZG1hX2FkZHJfdCB2YXJpYWJsZSBkaXJlY3RseS4N
Cg0KDQpUaGFua3MhDQoNClJlZ2FyZHMsDQpKYXNvbi1KSC5MaW4NCj4gDQo=

--__=_Part_Boundary_001_416429341.2858955--

