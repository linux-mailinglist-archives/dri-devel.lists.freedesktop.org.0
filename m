Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4002E7A4786
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 12:48:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8595410E269;
	Mon, 18 Sep 2023 10:47:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA00210E05C
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 10:47:56 +0000 (UTC)
X-UUID: d06e434a561011ee8051498923ad61e6-20230918
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=fhTY7jkITaYXpvi2D58+ILbGypjyC7R4h5bfH4HnNX4=; 
 b=aWoskXGhW7yMP0dTq2UfHBbKT1dHBh778rajxYjeHT8ilL77JAt2DU2BQH4qHkQ/O532dl5tZQ2CCaukPdQ/USsLEM7JAVvD/8y8VmpbZRLs16xpC5+5cAYY2YqO/Bzt7B+v6jx2IYavwNGstgbarDwn+qr6Pw0kxr7xhMjm9Nk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31, REQID:ca79b400-9f59-4b2b-893d-abfb63c108e9, IP:0,
 U
 RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:25
X-CID-META: VersionHash:0ad78a4, CLOUDID:e51c1214-4929-4845-9571-38c601e9c3c9,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: d06e434a561011ee8051498923ad61e6-20230918
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 58196763; Mon, 18 Sep 2023 18:47:51 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 18 Sep 2023 18:47:49 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Mon, 18 Sep 2023 18:47:49 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RoF+prkx4r648Jys5VOzgtPiJCg4bo26H97rHQ+SvCL2s20aPlPPdQOi6DEJgUflrSQsMYgX53d66TUMs5lawcxB9h9mNVcqSl0od0PtDO7/PX7de4wGr3IGmRqfA0c/T4C0gYWxkCeORlbldAzGx06WPwngmG2RTOFi3cTQZOEjSqP0jkCSzaG021Kh+H/xyCPWFeW7LTni1ns8cChIyaQgZ3FA9Dr7tVuqmA6g+i8D9BNgQlibWgveYHZO46D/HazlFSPpmw8RWVF4V2Pg6GjgDD6NLywaRY0FsqQVcGRhn5oCb5l17FVTIAk59i11eqmwJaxLb3Z0knfHkaiXNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fhTY7jkITaYXpvi2D58+ILbGypjyC7R4h5bfH4HnNX4=;
 b=F+kbhKeDv9bckf4rcLlcG1TG3Uhwx2TCAFgZAnoLz36W0Isr3uryzm3hxOJUgDP5gGozb+FK2T/riw8xmzJflKWvPrLjwVG1OulFMmnhzBcypgVyoQir3BxvUvf7XwH+H6JHn1bUwSUyN7vk0dc2udUGYHqNHqHU8uJwg2AxHBxtQRraJli0ZnXFD32BcdSc15HSaYveOB2wYuAMkiI+9rBMZwvINq6iidDlQ/Xfxaq8yAFPpz48iYgzQHvlDHpkYuwgmDX6YOdYGAULl/hHER3MpDtWnbBoUn9Wu4ijNjvskfWmzyI0eCrlQYP0c19qO9gwTO+jC5qgSY6hz8Fubw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fhTY7jkITaYXpvi2D58+ILbGypjyC7R4h5bfH4HnNX4=;
 b=n3ZArPZTLuCc3ItYCLsfxTBqcpC8SntfPwCsEDnPE98AlDeBz2zPxl+oqpDwsuzBdRlMQySKWf0epwnxyZpbYNhmKDhlt5QxDOWJc2nzYc1iqTTmIoZ6XYal9uiLeKNV0MpkF5JgcoUSpJotYXpRvucDPNPY0lC1EFxdTZUGbJo=
Received: from SI2PR03MB5885.apcprd03.prod.outlook.com (2603:1096:4:142::7) by
 SEYPR03MB7968.apcprd03.prod.outlook.com (2603:1096:101:168::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Mon, 18 Sep
 2023 10:47:46 +0000
Received: from SI2PR03MB5885.apcprd03.prod.outlook.com
 ([fe80::e148:3390:1eb2:28e3]) by SI2PR03MB5885.apcprd03.prod.outlook.com
 ([fe80::e148:3390:1eb2:28e3%7]) with mapi id 15.20.6792.026; Mon, 18 Sep 2023
 10:47:45 +0000
From: =?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "robin.murphy@arm.com"
 <robin.murphy@arm.com>
Subject: Re: [PATCH 8/9] dt-bindings: reserved-memory: MediaTek: Add reserved
 memory for SVP
Thread-Topic: [PATCH 8/9] dt-bindings: reserved-memory: MediaTek: Add reserved
 memory for SVP
Thread-Index: AQHZ5FgxjegLVruM7kG7VRoFLocLPrAVxRkAgADzaICAACUMgIAAHWgAgABe8QCACRiEgA==
Date: Mon, 18 Sep 2023 10:47:45 +0000
Message-ID: <a63ab61fbf4d2bdadeb68441050ff5187c93ba96.camel@mediatek.com>
References: <20230911023038.30649-1-yong.wu@mediatek.com>
 <20230911023038.30649-9-yong.wu@mediatek.com>
 <20230911154448.GA1279317-robh@kernel.org>
 <c2f1df12cc2dc25b342029e49c6d3f120d380b47.camel@mediatek.com>
 <c62a7ed8-d80a-3a82-040a-d4c74a71285a@linaro.org>
 <95f9dd3b-1f33-4af5-8757-a97e8b9bb216@arm.com>
 <20230912155338.GA842444-robh@kernel.org>
In-Reply-To: <20230912155338.GA842444-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB5885:EE_|SEYPR03MB7968:EE_
x-ms-office365-filtering-correlation-id: 089eb555-7f84-4f83-1deb-08dbb834b137
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: twqKMMvroONY67PmMpTC8RX1+8zIYlH3UZkDY49FsHH70O8JAkQOPp9E3wqkPLBDniEjRtye8lntw7fjHCFQqAZI+oc2OwWzfHYwGftiQ60YD6Tqbg1UcZtvsad6seGUPclfAyTnFQycuaZTN7P3c1pYyeMUu++W+1zBPW30M5adLR85/RF/lZqp2okT9lZK3ms2jSHG3JWhxMwGk39OHJRZ9zZfvqN2na4Gs0AHYTpphLMpx7ppX8K8dmGVbGaN7uMWhrCJUtmW9nYLq/1JhsqjJ/83nT+C2qIQKBAgETPkC7uxqo/qH1IewqWUJ8TMkJ5DjEg5MfN6ZRVlnBYhC4pH1yexwg8g7jpLCpeZUJZMyI1/ghXJ94OQ2/WBnBRgMJCNwDmLV1osbobwrOgOzdxXA/o4wnA4W+yuRIgbnCPZH9mkj+QR2KkMDCVJfTYXb9PLldkEfWaTrlJxma/VcH2ftmMK+1onbGZUYlkGS9EzODubCgU9C986G1B4snUnC5wwXkRyoznmc+G1TTT1Jkk4oOgA6otMQJNMBHCj/nnpz1yRlVHS65DCi2PUphw6Qis4WQYHXZRAW4VHCyy7I1SaKSkfS/4ZbSC7JQ4LnIxvMAq1GczdXhYBSc3elXh49fKKDd8YOVyBelEB0rw3lk3E9Kv6BX6tPd5dyWk1kL908NbD5cNjRTsbW7r6CJBQx7mztUQpSaWbxdZwu071+g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR03MB5885.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(396003)(376002)(136003)(366004)(1800799009)(186009)(451199024)(6512007)(53546011)(6486002)(6506007)(71200400001)(83380400001)(122000001)(85182001)(86362001)(38100700002)(38070700005)(36756003)(2616005)(26005)(110136005)(66556008)(66946007)(66446008)(64756008)(91956017)(66476007)(54906003)(76116006)(7416002)(41300700001)(316002)(2906002)(5660300002)(8676002)(4326008)(8936002)(966005)(478600001)(99106002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ODljMWt6bkVlRVRYalRqazRLTDZETGVYNWs1Znk3YklFZFJUYUdMSEFVVnBO?=
 =?utf-8?B?bFNWaW52aEpCMHljOFFXclRqTjZxUERJMm93eXJ6OGpaYlEzUVgrZU43YlNO?=
 =?utf-8?B?Uk5RV1BqL1pra2hKRXozRkdyNFhpMWQ4ZWtPTTNHOXUydForNEpuaVROVUJI?=
 =?utf-8?B?c3FtSDMrU2FrbjVNTUVCWUllbFZoSVRuaEg3SGhGOWZOZHVmV3RUY3dBSnVG?=
 =?utf-8?B?S1pLU0J6NnMveDRkV0FlYjZwL1k0NVJoakJBd3BzdG9HRzI3aFZPWlE0Z3BM?=
 =?utf-8?B?UTlhbGhuQi9uSWVnWjVHeWNjNjVZdnpkYWhHcGVac3BSU3owT1dIMS8vZTNN?=
 =?utf-8?B?eWpHNFNnREdzZldvOExyeTRxOFZ4TlFyMTlYTlRxaDVoN1I3czZldGgvODZD?=
 =?utf-8?B?cDFBRVdmNytHd3ZXQm13R2RLZ2VONG5HZkl6dmo5SGFUTitkRkhjZVBhbkR6?=
 =?utf-8?B?Vzc4TUJnWWp2V2dBWmdVYkdhMUc0dldRTmU0S0hhcXdtMjJJaFZuQzhwWlRZ?=
 =?utf-8?B?SlhtSEJZeXhiUFJyS08waFFHdGRYQ1JWUVVudm9DdFRLRGdMSFlzRzhmSGNQ?=
 =?utf-8?B?OXFlZTBiZHllcTdZMG1UdWFXZkFOWFVOdFR1REk1N08vb0NxUDJCamJpQVpS?=
 =?utf-8?B?RllYMk5kM2V3WW84OE5HR3J6eERRdmp0NzZ6d2RUSlRlc1hlMkhza3N3ZWxY?=
 =?utf-8?B?WHY4Q2QyWEVnbkgwdHg1UG4wd3FzNlNZR0h0TEIwZ1RDTlBheGwxOU1JOUpH?=
 =?utf-8?B?ZGNlenp6OVBWcHQ5TTQ4ZFM2Qm9SQ3l4cjVrZER2Y0Nsemx1SWlZRG9OcVc3?=
 =?utf-8?B?VXB3M2pLOGVUMllOT1JvTDY5VGlZWkhnRm9mWnNCWWFOWVp2WHBod3p3OEJy?=
 =?utf-8?B?aENVVGdCdzNZNWcrY1F1M21UbWxkSEZmRUNiK0luQ0pJOEpLZDJKKzMycUhG?=
 =?utf-8?B?T0NBQ2M0NDlxYUNheFJ3VVJwUUg0bkdmT1d2T0hiRzZDU3pDdEc0azhQY0VR?=
 =?utf-8?B?Vkd2cVZzRGhVQXJhMDBCdmwrQXhNbDVxVE5HU2VwTWk0MmpxbGd4WXFDTGVi?=
 =?utf-8?B?WVYzVnVXQzYxY003VFlqQUxUcUxjaEcybUNTazFLZUFDQmhXOW5ZTHc5SndW?=
 =?utf-8?B?eUxtNnlZbERHYVBBbmJvOXRuM01BNDdSM0VGbjVwTU5DTWNUL2lyZ3p6L1lL?=
 =?utf-8?B?eDlJTmRkaGVtUks5UkJUeTg5NDM4WmExYTBGMWxibEVLUDZPWG9PaE1ja05z?=
 =?utf-8?B?cGI1ODRYbzVWMFhnQkpRU3FSRi9MYUI0SGZzaGNkQi8zaEQyNWpUdzZPbHpN?=
 =?utf-8?B?NVJlaVE2akNxdmJLZ1BKWDdPK1ZHT040Wmt1bFhIZklEQ2pYREt4VUl3eDRS?=
 =?utf-8?B?ZlRzNnJ3d3A4RGRXUHhZdFFyMUtBdXN0UWppMGswNTlxUVBFYnJHdVlCdFZH?=
 =?utf-8?B?QVpOSW1FdzIxTWswUnFIcEZCQlJaTXpsNFZMSU82YytheVozRlZ1RGxBR1Vh?=
 =?utf-8?B?SnJKK21xbllGM3kvQkMwbHdvK1RLTFh0TXJvV0JsS3VmRTRRTUkzbng1c0ts?=
 =?utf-8?B?U0NXbElyMnlIMWlBVWdFbUJ0czNUbmd1ZXdxKzhRN09ZZGpZOVlWNlNEUllp?=
 =?utf-8?B?anh1RFJ1c2Zaa2J4UExoOU5KSDRrSU9McXQrM3hLVC9Wc2FabHFBdWg0QkJR?=
 =?utf-8?B?U0Z5bFFyUTAvbHF4b1ZXaUQvR1A2U1RUd1lwdGd4YzBTYkY1R0h1OTFob0lp?=
 =?utf-8?B?N2tTczhxZldJV24zYVExbkdNRWY5cm13ZmpIVitqaC9DTWdieEtranROVmVu?=
 =?utf-8?B?dUt1ZlB2SmNla3plcHlpRVhxUmxJMUNUMTRieDcxb1lxeGlFSkVsL1hzVWdq?=
 =?utf-8?B?WWtjN1dsRFZYcUNVZHNxUC9PeTBSajZZcy9DNG44L0JXVVhHMUJoYVRpSjNt?=
 =?utf-8?B?ZFk3MmZjMXFPRWwzVXhvSW9mbGU0d2tQcFA4T2RRUnB2YllsSldkTXVoUFJr?=
 =?utf-8?B?RFA0ZzlOYk16T1I2YWZaaEU4c2g0S0EyRTZwWjlrOFNBclF4RzdlaURjNm9q?=
 =?utf-8?B?amZTM1dUNHRDMVNsYnAyZWtCVDYreWFHNFl4cGxnL3k1aklSOVNaZDBQODdt?=
 =?utf-8?B?ME50cjBYcnRMeTZBYTRNdVlzK3hZY0g2RExPYUNaeWV2WUhjUTZhVFZNaFhY?=
 =?utf-8?B?VkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D1BB8576DBC80D49962B36E79556A880@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5885.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 089eb555-7f84-4f83-1deb-08dbb834b137
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2023 10:47:45.4020 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +gpCu02DFx5dkpjIaTwk0CCgxo4i8yqLGZ58sFFtvUVQW0DhGhMkN/QhvRZg/aqLBTyKxSbaj8wlvHzvIXO5NA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7968
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--28.309600-8.000000
X-TMASE-MatchedRID: CML2QBp/u5TUL3YCMmnG4ia1MaKuob8PCJpCCsn6HCHBnyal/eRn3gzR
 CsGHURLuwpcJm2NYlPAF6GY0Fb6yCifZYRtbOr2t5gCHftmwEMLWSrKtwxqWpVXWVD8efRM6LIb
 YUWjS7yjbT4dHnV2cQbvrVFvaS3pvaz+0XDplNBbCz1ymGcrCUcMdI0UcXEHz8QkGgrel/G4QIz
 eIWm4OKNYl5+U3IeZnRRqEtlXbEyAEQqIqKFLtThWCVBr+Ay98hV0srjoqtx/4JyR+b5tvoHq1v
 ZPzlqkE9p+FCsxUVBOo2XCvbbzgXT2Rn1xnHewV04Rmz/agfdwpWss5kPUFdFpbYq2f4jz+v9+R
 vGSUdYDObesvhFq9iCmfkKd1ns/adLTHjoswkhrOUnHdMlbPm+oPCNnw8P0y5kPlQgZZtVOXjmy
 K2W3kzdpHRIOaj2YjQxNJhQGGn1lOw/F81QRZosFWmsryu9Zf0wYPwm4Fdk9IjvA1/YS+0ZGdFu
 mu59+H26TlE+g/8cgkmqnza8FwyfZomtZBUIXQOjf3A4DTYuEF15s6prCIu2HZ+cd7VyKX36IBB
 lSZdcZE2D4rLf+pxZGTpe1iiCJq0u+wqOGzSV1r34lUqic7t/oA9r2LThYYKrauXd3MZDUMFsa+
 1wyh/JRMZUCEHkRt
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--28.309600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 73BB92602AA03E46C4D8CA9F22764F12EACFB37B1A9A669A9E373225EA2B2CC82000:8
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
Cc: "jkardatzke@google.com" <jkardatzke@google.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "krzysztof.kozlow.ski+dt@linaro.org" <krzysztof.kozlow.ski+dt@linaro.org>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 =?utf-8?B?S3VvaG9uZyBXYW5nICjnjovlnIvptLsp?= <kuohong.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
 "jstultz@google.com" <jstultz@google.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "tjmercier@google.com" <tjmercier@google.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 =?utf-8?B?SmlhbmppYW8gWmVuZyAo5pu+5YGl5aejKQ==?= <Jianjiao.Zeng@mediatek.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIzLTA5LTEyIGF0IDEwOjUzIC0wNTAwLCBSb2IgSGVycmluZyB3cm90ZToNCj4g
IAkgDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBvcGVu
IGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhl
IGNvbnRlbnQuDQo+ICBPbiBUdWUsIFNlcCAxMiwgMjAyMyBhdCAxMToxMzo1MEFNICswMTAwLCBS
b2JpbiBNdXJwaHkgd3JvdGU6DQo+ID4gT24gMTIvMDkvMjAyMyA5OjI4IGFtLCBLcnp5c3p0b2Yg
S296bG93c2tpIHdyb3RlOg0KPiA+ID4gT24gMTIvMDkvMjAyMyAwODoxNiwgWW9uZyBXdSAo5ZC0
5YuHKSB3cm90ZToNCj4gPiA+ID4gSGkgUm9iLA0KPiA+ID4gPiANCj4gPiA+ID4gVGhhbmtzIGZv
ciB5b3VyIHJldmlldy4NCj4gPiA+ID4gDQo+ID4gPiA+IE9uIE1vbiwgMjAyMy0wOS0xMSBhdCAx
MDo0NCAtMDUwMCwgUm9iIEhlcnJpbmcgd3JvdGU6DQo+ID4gPiA+ID4gICANCj4gPiA+ID4gPiBF
eHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Blbg0KPiBhdHRh
Y2htZW50cyB1bnRpbA0KPiA+ID4gPiA+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3Ig
dGhlIGNvbnRlbnQuDQo+ID4gPiA+ID4gICBPbiBNb24sIFNlcCAxMSwgMjAyMyBhdCAxMDozMDoz
N0FNICswODAwLCBZb25nIFd1IHdyb3RlOg0KPiA+ID4gPiA+ID4gVGhpcyBhZGRzIHRoZSBiaW5k
aW5nIGZvciBkZXNjcmliaW5nIGEgQ01BIG1lbW9yeSBmb3INCj4gTWVkaWFUZWsNCj4gPiA+ID4g
PiBTVlAoU2VjdXJlDQo+ID4gPiA+ID4gPiBWaWRlbyBQYXRoKS4NCj4gPiA+ID4gPiANCj4gPiA+
ID4gPiBDTUEgaXMgYSBMaW51eCB0aGluZy4gSG93IGlzIHRoaXMgcmVsYXRlZCB0byBDTUE/DQo+
ID4gPiA+IA0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBZb25nIFd1
IDx5b25nLnd1QG1lZGlhdGVrLmNvbT4NCj4gPiA+ID4gPiA+IC0tLQ0KPiA+ID4gPiA+ID4gICAu
Li4vbWVkaWF0ZWssc2VjdXJlX2NtYV9jaHVua21lbS55YW1sICAgICAgICAgfCA0Mg0KPiA+ID4g
PiA+ICsrKysrKysrKysrKysrKysrKysNCj4gPiA+ID4gPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDQy
IGluc2VydGlvbnMoKykNCj4gPiA+ID4gPiA+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+IERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZXNlcnZlZC0NCj4gPiA+ID4gPiBtZW1vcnkv
bWVkaWF0ZWssc2VjdXJlX2NtYV9jaHVua21lbS55YW1sDQo+ID4gPiA+ID4gPiANCj4gPiA+ID4g
PiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVzZXJ2
ZWQtDQo+ID4gPiA+ID4gbWVtb3J5L21lZGlhdGVrLHNlY3VyZV9jbWFfY2h1bmttZW0ueWFtbA0K
PiA+ID4gPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jlc2VydmVkLQ0K
PiA+ID4gPiA+IG1lbW9yeS9tZWRpYXRlayxzZWN1cmVfY21hX2NodW5rbWVtLnlhbWwNCj4gPiA+
ID4gPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gPiA+ID4gPiBpbmRleCAwMDAwMDAwMDAw
MDAuLmNjMTBlMDBkMzVjNA0KPiA+ID4gPiA+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ID4gPiA+ID4g
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jlc2VydmVkLQ0KPiA+ID4g
PiA+IG1lbW9yeS9tZWRpYXRlayxzZWN1cmVfY21hX2NodW5rbWVtLnlhbWwNCj4gPiA+ID4gPiA+
IEBAIC0wLDAgKzEsNDIgQEANCj4gPiA+ID4gPiA+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkNCj4gPiA+ID4gPiA+ICslWUFNTCAxLjIN
Cj4gPiA+ID4gPiA+ICstLS0NCj4gPiA+ID4gPiA+ICskaWQ6DQo+ID4gPiA+ID4gDQo+IGh0dHA6
Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3Jlc2VydmVkLW1lbW9yeS9tZWRpYXRlayxzZWN1cmVf
Y21hX2NodW5rbWVtLnlhbWwjDQo+ID4gPiA+ID4gPiArJHNjaGVtYTogaHR0cDovL2RldmljZXRy
ZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjDQo+ID4gPiA+ID4gPiArDQo+ID4gPiA+ID4g
PiArdGl0bGU6IE1lZGlhVGVrIFNlY3VyZSBWaWRlbyBQYXRoIFJlc2VydmVkIE1lbW9yeQ0KPiA+
ID4gPiA+IA0KPiA+ID4gPiA+IFdoYXQgbWFrZXMgdGhpcyBzcGVjaWZpYyB0byBNZWRpYXRlaz8g
U2VjdXJlIHZpZGVvIHBhdGggaXMNCj4gZmFpcmx5DQo+ID4gPiA+ID4gY29tbW9uLCByaWdodD8N
Cj4gPiA+ID4gDQo+ID4gPiA+IEhlcmUgd2UganVzdCByZXNlcnZlIGEgYnVmZmVyIGFuZCB3b3Vs
ZCBsaWtlIHRvIGNyZWF0ZSBhIGRtYS0NCj4gYnVmIHNlY3VyZQ0KPiA+ID4gPiBoZWFwIGZvciBT
VlAsIHRoZW4gdGhlIHNlY3VyZSBlbmdpbmVzKFZjb2RlYyBhbmQgRFJNKSBjb3VsZA0KPiBwcmVw
YXJlDQo+ID4gPiA+IHNlY3VyZSBidWZmZXIgdGhyb3VnaCBpdC4NCj4gPiA+ID4gQnV0IHRoZSBo
ZWFwIGRyaXZlciBpcyBwdXJlIFNXIGRyaXZlciwgaXQgaXMgbm90IHBsYXRmb3JtDQo+IGRldmlj
ZSBhbmQNCj4gPiA+IA0KPiA+ID4gQWxsIGRyaXZlcnMgYXJlIHB1cmUgU1cuDQo+ID4gPiANCj4g
PiA+ID4gd2UgZG9uJ3QgaGF2ZSBhIGNvcnJlc3BvbmRpbmcgSFcgdW5pdCBmb3IgaXQuIFRodXMg
SSBkb24ndA0KPiB0aGluayBJDQo+ID4gPiA+IGNvdWxkIGNyZWF0ZSBhIHBsYXRmb3JtIGR0c2kg
bm9kZSBhbmQgdXNlICJtZW1vcnktcmVnaW9uIg0KPiBwb2ludGVyIHRvDQo+ID4gPiA+IHRoZSBy
ZWdpb24uIEkgdXNlZCBSRVNFUlZFRE1FTV9PRl9ERUNMQVJFIGN1cnJlbnRseShUaGUgY29kZSBp
cw0KPiBpbg0KPiA+ID4gPiBbOS85XSkuIFNvcnJ5IGlmIHRoaXMgaXMgbm90IHJpZ2h0Lg0KPiA+
ID4gDQo+ID4gPiBJZiB0aGlzIGlzIG5vdCBmb3IgYW55IGhhcmR3YXJlIGFuZCB5b3UgYWxyZWFk
eSB1bmRlcnN0YW5kIHRoaXMNCj4gKHNpbmNlDQo+ID4gPiB5b3UgY2Fubm90IHVzZSBvdGhlciBi
aW5kaW5ncykgdGhlbiB5b3UgY2Fubm90IGhhdmUgY3VzdG9tDQo+IGJpbmRpbmdzIGZvcg0KPiA+
ID4gaXQgZWl0aGVyLg0KPiA+ID4gDQo+ID4gPiA+IA0KPiA+ID4gPiBUaGVuIGluIG91ciB1c2Fn
ZSBjYXNlLCBpcyB0aGVyZSBzb21lIHNpbWlsYXIgbWV0aG9kIHRvIGRvDQo+IHRoaXM/IG9yDQo+
ID4gPiA+IGFueSBvdGhlciBzdWdnZXN0aW9uPw0KPiA+ID4gDQo+ID4gPiBEb24ndCBzdHVmZiBz
b2Z0d2FyZSBpbnRvIERUUy4NCj4gPiANCj4gPiBBcmVuJ3QgbW9zdCByZXNlcnZlZC1tZW1vcnkg
YmluZGluZ3MganVzdCBzb2Z0d2FyZSBwb2xpY3kgaWYgeW91DQo+IGxvb2sgYXQgaXQNCj4gPiB0
aGF0IHdheSwgdGhvdWdoPyBJSVVDIHRoaXMgaXMgYSBwb29sIG9mIG1lbW9yeSB0aGF0IGlzIHZp
c2libGUgYW5kDQo+ID4gYXZhaWxhYmxlIHRvIHRoZSBOb24tU2VjdXJlIE9TLCBidXQgaXMgZnVu
ZGFtZW50YWxseSBvd25lZCBieSB0aGUNCj4gU2VjdXJlDQo+ID4gVEVFLCBhbmQgcGFnZXMgdGhh
dCB0aGUgVEVFIGFsbG9jYXRlcyBmcm9tIGl0IHdpbGwgYmVjb21lDQo+IHBoeXNpY2FsbHkNCj4g
PiBpbmFjY2Vzc2libGUgdG8gdGhlIE9TLiBUaHVzIHRoZSBwbGF0Zm9ybSBkb2VzIGltcG9zZSBj
b25zdHJhaW50cw0KPiBvbiBob3cgdGhlDQo+ID4gTm9uLVNlY3VyZSBPUyBtYXkgdXNlIGl0LCBh
bmQgcGVyIHRoZSByZXN0IG9mIHRoZSByZXNlcnZlZC1tZW1vcnkNCj4gYmluZGluZ3MsDQo+ID4g
ZGVzY3JpYmluZyBpdCBhcyBhICJyZXVzYWJsZSIgcmVzZXJ2YXRpb24gc2VlbXMgZW50aXJlbHkN
Cj4gYXBwcm9wcmlhdGUuIElmDQo+ID4gYW55dGhpbmcgdGhhdCdzICptb3JlKiBwbGF0Zm9ybS1y
ZWxhdGVkIGFuZCBzbyBEVC1yZWxldmFudCB0aGFuDQo+IHR5cGljYWwNCj4gPiBhcmJpdHJhcnkg
cmVzZXJ2YXRpb25zIHdoaWNoIGp1c3QgcmVwcmVzZW50ICJzYXZlIHNvbWUgbWVtb3J5IHRvDQo+
IGRlZGljYXRlIHRvDQo+ID4gYSBwYXJ0aWN1bGFyIGRyaXZlciIgYW5kIGRvbid0IGFjdHVhbGx5
IGJlYXIgYW55IHJlbGF0aW9uc2hpcCB0bw0KPiBmaXJtd2FyZSBvcg0KPiA+IGhhcmR3YXJlIGF0
IGFsbC4NCj4gDQo+IFllcywgYSBtZW1vcnkgcmFuZ2UgZGVmaW5lZCBieSBoYXJkd2FyZSBvciBm
aXJtd2FyZSBpcyB3aXRoaW4gc2NvcGUNCj4gb2YgDQo+IERULiAoQ01BIGF0IGFyaWJpdHJhcnkg
YWRkcmVzcyB3YXMgcXVlc3Rpb25hYmxlLikNCg0KSSBndWVzcyB0aGUgbWVtb3J5IHJhbmdlIGlz
IG5vdCAiZGVmaW5lZCIgYnkgSFcgaW4gb3VyIGNhc2UsIGJ1dCB0aGlzDQpyZXNlcnZlIGJ1ZmZl
ciBpcyBpbmRlZWQgcHJlcGFyZWQgZm9yIGFuZCB1c2VkIGJ5IEhXLg0KDQpJZiB0aGlzIGlzIGEg
bm9ybWFsIHJlc2VydmVkIGJ1ZmZlciBmb3Igc29tZSBkZXZpY2UsIHdlIGNvdWxkIGRlZmluZSBh
DQpyZXNlcnZlZC1tZW1vcnkgd2l0aCAic2hhcmVkLWRtYS1wb29sIiwgdGhlbiB0aGUgZGV2aWNl
IHVzZSBpdCB2aWENCiJtZW1vcnktcmVnaW9uIiBwcm9wZXJ0eSwgaXMgdGhpcyByaWdodD8NCg0K
SGVyZSBpdCBpcyBhIHNlY3VyZSBidWZmZXIgY2FzZSBhbmQgdGhpcyB1c2FnZSByZWxhdGlvbnNo
aXAgaXMNCmluZGlyZWN0LiBXZSBjcmVhdGUgYSBuZXcgaGVhcCBmb3IgdGhpcyBuZXcgc2VjdXJl
IHR5cGUgbWVtb3J5LCBvdGhlcg0KdXNlcnMgc3VjaCBhcyBWQ09ERUMgYW5kIERSTSBhbGxvY2F0
ZSBzZWN1cmUgbWVtb3J5IHRocm91Z2ggdGhlIG5ldw0KaGVhcC4NCg0KQWJvdXQgdGhlIGFyaWJp
dHJhcnkgYWRkcmVzcyBpcyBiZWNhdXNlIHdlIGhhdmUgSFcgcmVnaXN0ZXIgZm9yIGl0LiBBcw0K
bG9uZyBhcyB0aGlzIGlzIGEgbGVnYWwgZHJhbSBhZGRyZXNzLCBpdCBpcyBmaW5lLiBXaGVuIHRo
aXMgYWRkcmVzcyBpcw0KcGFzc2VkIGludG8gVEVFLCBpdCB3aWxsIGJlIHByb3RlY3RlZCBieSBI
Vy4NCg0KPiANCj4gTXkgaXNzdWUgaGVyZSBpcyBtb3JlIHRoYXQgJ3NlY3VyZSB2aWRlbyBtZW1v
cnknIGlzIG5vdCBhbnkgd2F5DQo+IE1lZGlhdGVrIA0KPiBzcGVjaWZpYy4NCg0KU29ycnksIEkg
ZG9uJ3Qga25vdyBpZiB0aGVyZSBhbHJlYWR5IGlzIGFuIFNWUCBjYXNlIGluIHRoZSBjdXJyZW50
DQprZXJuZWwuIElmIHNvLCBjb3VsZCB5b3UgaGVscCBzaGFyZSBpdD8NCg0KUmVnYXJkaW5nIG91
ciBzcGVjaWFsLCB0aGUgbmV3IGhlYXAgZHJpdmVyIG1heSBiZSBkaWZmZXJlbnQsIGFuZCBvdGhl
cg0KSFdzIHNoYXJlIHRoaXMgcmVzZXJ2ZSBidWZmZXIgYW5kIG1hbmFnZSBpdCB0aHJvdWdoIHRo
aXMgcHVyZSBTVyBoZWFwLg0KDQo+ICBBSVVJLCBpdCdzIGEgcmVxdWlyZW1lbnQgZnJvbSBjZXJ0
YWluIGNvbnRlbnQgcHJvdmlkZXJzIGZvciANCj4gdmlkZW8gcGxheWJhY2sgdG8gd29yay4gU28g
d2h5IHRoZSBNZWRpYXRlayBzcGVjaWZpYyBiaW5kaW5nPw0KPiANCj4gUm9iDQo=
