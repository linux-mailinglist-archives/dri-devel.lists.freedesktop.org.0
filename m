Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EF87469AC
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 08:28:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA1710E098;
	Tue,  4 Jul 2023 06:28:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB72E10E098
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 06:28:39 +0000 (UTC)
X-UUID: ffaedc5a1a3311eeb20a276fd37b9834-20230704
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=Vnaw0NB0o337yeKaInLu/J7NorQOa8YtyQN5X2Iyx+0=; 
 b=S1VlCqNJz6cGsJn0v6fKu/HoR/yn/gjdYE89YgDe72WxNOIxug2z8+HZ/Yj4U9HQyR9yHFnBUQv6FjeyrZKK+xVgE2aTc6sVyzXBhouLGT6WadhpDP2uTtC+Ff52aHQChHKdgrSD8mfhJ2/EmaDtJujW4YUgBA1Qw50LQKqwK10=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.27, REQID:56d4ffd3-33b5-4720-a0e2-198326418119, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:01c9525, CLOUDID:ba0cac82-5a99-42ae-a2dd-e4afb731b474,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ffaedc5a1a3311eeb20a276fd37b9834-20230704
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1254308414; Tue, 04 Jul 2023 14:28:33 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 4 Jul 2023 14:28:31 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Tue, 4 Jul 2023 14:28:31 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A1lGBeA1LzLHPuzM9PW1Vy0e1vZnCucr7kEGMLW640raiNDYdC0UpB2Na4LusQmsUq/LIBsQ5FV6QW+FEh9ZY79ItQJpTcIs0tAn16ptb5YTNyMpWwntp5Q1iYaQymw7TlExsYg6mLsPwMMiOcUK54rghatRX6jMWj8X2tAZhpQ+YVQuZEWlFiDQ1eTrfM1pJFi1hGp/oN+LSsrJfNYS4VNUn6/tidJTx7vVM6s8XSYJ9YKwkrjBWdtJLhwj4juI7SyHxdLV2JnoUHorP82pUH7gk+nXC87gaXByYrrMma+SI3Apx652Nf28ywk0cd3lSNCD2UKqTV0h0ThM91Qmvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KFYQ/0Zx0sZ4Dxx1DODgwjHMKFH4IRs6949GMNqmRCw=;
 b=IXc1GKd46i+X46F/zBfucHfllE1N18/pjTvOJ980cBiw+oyFW55481PU/o6K9MrpoDCMlD672aD+bJAuJV4gcDwr59HHvRJPdtvBb6haWFBLcOpKUwsAPY+V9uskrgP6+6CvWby+ISRh5m8dPOSWFDov7GjoWWb9aKS09DVICjMeddk4YTXjLD0Pt/18HlmRchEEY+y3Uxuyozg7MslOa7J/5CCTysE8mGMYDbCvn5MfPsbp2Wz1K9htQr4x/F4dHzli8GWZ0LLlq/Rs+PsBT4Cm66Fldny0OLa4thZ4Q9YIIoISlwrTZxMzEipWZnTmuIt/KL7shHL5jq11nd6BZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KFYQ/0Zx0sZ4Dxx1DODgwjHMKFH4IRs6949GMNqmRCw=;
 b=Jwacgfu5xWog78RNNIk+ImR2YftPDU1XhRuwO+OQZYv6qeYbqPRru4LaoFFfdpMLRipvWmlveUKTfdXHK98jYc+WOL21wlxM1WvkuyD0Ftc5Mt9wS/Q92EZtVE9KHjwPJ4bq3OnQa/Iby4BnbUJY1v/lDZF1MIwJNtcrQmAzNQI=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEYPR03MB7965.apcprd03.prod.outlook.com (2603:1096:101:177::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 06:28:29 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::6fdb:ba2c:bcfc:d5ed]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::6fdb:ba2c:bcfc:d5ed%7]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 06:28:29 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>
Subject: Re: [PATCH 1/3] drm/mediatek: Use
 devm_platform_get_and_ioremap_resource()
Thread-Topic: [PATCH 1/3] drm/mediatek: Use
 devm_platform_get_and_ioremap_resource()
Thread-Index: AQHZmfHO8p97D3IThESdC3pIXNPA4K+pTZqA
Date: Tue, 4 Jul 2023 06:28:29 +0000
Message-ID: <ef62141b4b9940d9642e1318763ea6c687deaa8d.camel@mediatek.com>
References: <20230608101209.126499-1-angelogioacchino.delregno@collabora.com>
 <20230608101209.126499-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230608101209.126499-2-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEYPR03MB7965:EE_
x-ms-office365-filtering-correlation-id: 2af0c742-0238-40c2-95a5-08db7c57e1f1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2OqP9wWcLLL0nCfiZhuLINasYHZutavLiOchnQkuZMpndM97SjFea6bbDDS448gdZhUYEBUOmFeWwcgA9IpeIgRpKFcBChs1Ob/5epA7kZWva8i5PON0w93cyIatCvfPVcxwNIRyda5ha07ivwxL3b6FrWK5zMOAcdZYa9ZS3WgigThkNHmSXAR85YyLhZ04ZhfHRSCH2IrIkpdzkcF88OwF8Df9JxzTZdXYfsJocjPbaGkzSiZgBr5wg5FMfH1+SenbBHjlKASHZw5f/G2kXvUQcSc0FjM26Ar7pa4GFYnzmyk/hvygURGnBXSZZdbLMuTd5Xlwr9kOACNqPnLCIG5ggsYm4+XLjX1ItQaXbfIthY095R7SusYtPUNBR5uJ1Zv4OE+m1TRD6sD/TCL8ueUI7AWaQUGYx/+gCFAP0ac19yvRC0Wt4198dTiApliXOoWmhG9SQiGKTbkBdE/YXU6TP1Zihox8OtC1rhMQ9m0K+XEYGAbbORCKoTB1aKhN5KljYki7BgQpvNOIk0Niu8iFcneRyJQUwfYNPDiXXrwUGnqWU9/CjuJURmyTpGlEWcPVUXP5PjY/OEJQO4VusO6KOUGIEQzD1loh1WT7j7c7kteTRfDFsa8Lz9l1j+UdAJVMn73PceqWNl4ae8u2r3YU1Y31BmgzmBHH3DzdOC8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(366004)(39860400002)(376002)(396003)(136003)(451199021)(41300700001)(38100700002)(6486002)(26005)(2616005)(71200400001)(122000001)(186003)(83380400001)(6506007)(6512007)(54906003)(86362001)(38070700005)(110136005)(478600001)(85182001)(66446008)(2906002)(36756003)(316002)(66556008)(64756008)(4326008)(66476007)(76116006)(66946007)(8936002)(8676002)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OExEQzRPS2NjWE5vZ3J2S3ZkNmdwNFRWLzRkdHpGTmJpU1dZUjVSTi9IQWd1?=
 =?utf-8?B?UmRvU1hsRTM1RlNBZzgxTHB2RlVoMHp3OGgwYVNVcnZXYWhIWGlKcjNIbVVj?=
 =?utf-8?B?dWlxRlliWUVnNWg2V3VHbUVxMTRCWExMUmppZVBRQWw2WkM5OTB4NWJKdDF4?=
 =?utf-8?B?dlhiYU1ucUpvbXBvdElyeHVRdGpDSkNRNnZRelBZd0t5VVZ4ZmRFN2RtL0N5?=
 =?utf-8?B?a0toczBiWmdIVkpCaThMbkdXUS9VVmpId2g1L3NzU2hoN2IvK2lDTng4d3p3?=
 =?utf-8?B?dTFPajd5ZUw2YzhQdFlUb3dDVE9xSjc5T0VrdTIva0dBVEozSGQyMis0VDRD?=
 =?utf-8?B?QnY0YmdYNWx2OUQ1a0gxaUFsT20zSU96SDgxVU8zQVBXWEw1akpDVG1ab09m?=
 =?utf-8?B?M0k5TzNRYTZzM3owODVkUWs4V2dJcUUvbXdRZExtREtBcVp5czlYbjJBOFVC?=
 =?utf-8?B?RGFVVkJnSmlhSFZzR2JZOUhMYmdmSGJTelFvZjFwa0ZRREh5OERJcWp0MnZq?=
 =?utf-8?B?Y3pDYkpEK1FCZUovMytpK1lvNzVLV0pGeXI4MzlIbEZ0c3ZPcE5VTUZsL1hx?=
 =?utf-8?B?VHk4UUlWTVh0Vmp0eUFYc2xNMGwrL083UVdjVnlkTC84ZlV1VGViYkF2YU9G?=
 =?utf-8?B?c0EvcTdTcjNNbHd2U1BxcTV4UWxpRkZIZE9XaVhjaml0NUFlempKUE5nVnBY?=
 =?utf-8?B?Umo1MklwdGd0Q0EzZll2M0xzSTVVZ040dUk1QUJuQXRtRk9jK1BFT0t3NFJM?=
 =?utf-8?B?T0ZuQlVadkhUUm9tSmtjWE5MQkxjNmFPN3FhbnJtTENISWJjaWFZV2V4REhm?=
 =?utf-8?B?TXQyQk1EYlN3WFowZHphN2hGS1lMR3ZQZDlqQjkvUjJPbjM4eExDdmZsYlo1?=
 =?utf-8?B?ZHJPT0o2ZzNHMkNLZlZvRGRlWEgzcFZ1VWNyWUJjT1Q3NXh1M1dkU1R4akUw?=
 =?utf-8?B?aVIxVlRyU3FnVSt1MkpGeHVZNmdJam5DQlh3NjZVNzdoVFdhNzVpSC8ycUta?=
 =?utf-8?B?OVBiTVhaNmsxZkZmaklySWxNZkN3QWdPQVdmbkNOdTE2WEtSR0RBRE1qRjdu?=
 =?utf-8?B?TE5tblRmVkRUZ1hxc2hDWG44RDV1ZmhNZGNLNjZhcnVmWlZ4bXgwbElsa2Zl?=
 =?utf-8?B?VURWbFY5dTJ0anRUSFBteTBPMkZUckhFdmdibnJDNUxiS05pVzlZWkVrNnRl?=
 =?utf-8?B?UUJYVlk3eUdFbU9jeXpBcHpvM1VDa2RFSzZLUFd6YzZtUklPWm1JSkxDVzVt?=
 =?utf-8?B?SHhCdkZ5dmEwVjdyNjBkOFRMMXo1MTJ6UlhkWUxGaHNoK0ovTFdsZ0plTzlQ?=
 =?utf-8?B?VThQOVh2cms2LzNLdmVGalpTUnlRUlZxU3RxZG1GSTdlcnBVMVJ2VGd2Q3NS?=
 =?utf-8?B?R0dKT3Q5MkF4b0tvak9DN1ZOS0xaMnd5TjNvcFNwR2NFNzBBZ2lJaU80NWY3?=
 =?utf-8?B?YXBpbHJuZEswOXRDUFM1Ynh2dG8yM3gzRWo2UDE0WFZZOXZqaGxjVzVTWkUv?=
 =?utf-8?B?TjdpMlRTWnJZQWM2U2M1WnpxUUJGMUJQaytwa0h2elcxd0pINXN6MXptNWhn?=
 =?utf-8?B?L2xWZElLQWRrQm9JM3hSU0tGMVJNNWNEallGYVV5K0ZYbW1CQWJuYnJhbGRJ?=
 =?utf-8?B?TXZPc2tnbmx1M25heFRXS1ZvcDFuU0hnV2d1eFpUSEVuMzl3MmJJUmZhK0ND?=
 =?utf-8?B?YSt2eGZxUGE0SXBqZXFXV2x1RzBNSWxYWHZERm80TDFETDJuZ2c2bmpPMURL?=
 =?utf-8?B?eU42dEFUZ3JwamROTFVUZGJhTGV2Nkt1c1ZnZEdPQ24renc5WVNrbmNqT25N?=
 =?utf-8?B?SURySzF4OGlYaWZXYkpvL0J2RmZyL3lHQVRzckoralRNYy9UNWc5MURUUXJw?=
 =?utf-8?B?RkppYnpYQktjaitzZHU1a0gzcHVPSzJDbm9NSStlTWt3bEltSFphN01wNVpS?=
 =?utf-8?B?QncyQThzU1ZoYlFLR0ZWRDJvMXJpMCtLZSsvYWFPOXR3VTlrRklIcHFkMFd0?=
 =?utf-8?B?SnhIV2tlMlZVdm5wdk50MUxINDc5VExZV1I3c3hlN1pHTFhGVzJrSDlUYkI4?=
 =?utf-8?B?SG5yM1lpeDAzbzYzaFdDaWlKRjFmL25lQ2l3bFdTODVkS1ZuWUI2NUVCejhH?=
 =?utf-8?Q?6X7QmlCZzaRkVAXnW419iTyoL?=
Content-ID: <2D8E85548984294393885267B43E4EF5@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2af0c742-0238-40c2-95a5-08db7c57e1f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2023 06:28:29.7325 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H3pu2OM96Q5E/CHjV3vg/fZ0cxX3IltHZ9h5b/C4oQH4AN4CthTAMcGSerwCJfs0+6JBDeWVx+UaZPcMMb8AzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7965
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_006_591045229.1631661456"
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_006_591045229.1631661456
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpLCYjMzI7QW5nZWxvOg0KDQpPbiYjMzI7VGh1LCYjMzI7MjAyMy0wNi0wOCYjMzI7
YXQmIzMyOzEyOjEyJiMzMjsrMDIwMCwmIzMyO0FuZ2Vsb0dpb2FjY2hpbm8mIzMyO0RlbCYjMzI7
UmVnbm8mIzMyO3dyb3RlOg0KJmd0OyYjMzI7JiMzMjsmIzMyOw0KJmd0OyYjMzI7RXh0ZXJuYWwm
IzMyO2VtYWlsJiMzMjs6JiMzMjtQbGVhc2UmIzMyO2RvJiMzMjtub3QmIzMyO2NsaWNrJiMzMjts
aW5rcyYjMzI7b3ImIzMyO29wZW4mIzMyO2F0dGFjaG1lbnRzJiMzMjt1bnRpbA0KJmd0OyYjMzI7
eW91JiMzMjtoYXZlJiMzMjt2ZXJpZmllZCYjMzI7dGhlJiMzMjtzZW5kZXImIzMyO29yJiMzMjt0
aGUmIzMyO2NvbnRlbnQuDQomZ3Q7JiMzMjsmIzMyO0luc3RlYWQmIzMyO29mJiMzMjtvcGVuJiMz
Mjtjb2RpbmcmIzMyO2NhbGxzJiMzMjt0byYjMzI7cGxhdGZvcm1fZ2V0X3Jlc291cmNlKCkmIzMy
O2ZvbGxvd2VkJiMzMjtieQ0KJmd0OyYjMzI7ZGV2bV9pb3JlbWFwX3Jlc291cmNlKCksJiMzMjtw
ZXJmb3JtJiMzMjthJiMzMjtzaW5nbGUmIzMyO2NhbGwmIzMyO3RvJiMzMjt0aGUmIzMyO2hlbHBl
cg0KJmd0OyYjMzI7ZGV2bV9wbGF0Zm9ybV9nZXRfYW5kX2lvcmVtYXBfcmVzb3VyY2UoKS4NCiZn
dDsmIzMyOw0KJmd0OyYjMzI7VGhpcyYjMzI7Y29tbWl0JiMzMjticmluZ3MmIzMyO25vJiMzMjtm
dW5jdGlvbmFsJiMzMjtjaGFuZ2VzLg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtTaWduZWQtb2ZmLWJ5
OiYjMzI7QW5nZWxvR2lvYWNjaGlubyYjMzI7RGVsJiMzMjtSZWdubyYjMzI7Jmx0Ow0KJmd0OyYj
MzI7YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tJmd0Ow0KJmd0OyYjMzI7
LS0tDQomZ3Q7JiMzMjsmIzMyO2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfY2VjLmMmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7fCYjMzI7MyYjMzI7Ky0tDQomZ3Q7
JiMzMjsmIzMyO2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9hYWwuYyYjMzI7JiMz
MjsmIzMyO3wmIzMyOzMmIzMyOystLQ0KJmd0OyYjMzI7JiMzMjtkcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2Rpc3BfY2NvcnIuYyYjMzI7fCYjMzI7MyYjMzI7Ky0tDQomZ3Q7JiMzMjsmIzMy
O2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9jb2xvci5jJiMzMjt8JiMzMjszJiMz
MjsrLS0NCiZndDsmIzMyOyYjMzI7ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX2dh
bW1hLmMmIzMyO3wmIzMyOzMmIzMyOystLQ0KJmd0OyYjMzI7JiMzMjtkcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2Rpc3BfbWVyZ2UuYyYjMzI7fCYjMzI7MyYjMzI7Ky0tDQomZ3Q7JiMzMjsm
IzMyO2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYyYjMzI7JiMzMjsmIzMy
O3wmIzMyOzMmIzMyOystLQ0KJmd0OyYjMzI7JiMzMjtkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2Rpc3BfcmRtYS5jJiMzMjsmIzMyO3wmIzMyOzMmIzMyOystLQ0KJmd0OyYjMzI7JiMzMjtk
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyO3wmIzMyOzMmIzMyOystLQ0KJmd0OyYjMzI7JiMzMjtkcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7fCYjMzI7MyYjMzI7Ky0tDQomZ3Q7JiMzMjsmIzMyO2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfaGRtaV9kZGMuYyYjMzI7JiMzMjsmIzMyO3wmIzMyOzMmIzMyOystLQ0KJmd0OyYjMzI7
JiMzMjtkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX21kcF9yZG1hLmMmIzMyOyYjMzI7JiMz
Mjt8JiMzMjszJiMzMjsrLS0NCiZndDsmIzMyOyYjMzI7MTImIzMyO2ZpbGVzJiMzMjtjaGFuZ2Vk
LCYjMzI7MTImIzMyO2luc2VydGlvbnMoKyksJiMzMjsyNCYjMzI7ZGVsZXRpb25zKC0pDQomZ3Q7
JiMzMjsNCiZndDsmIzMyO2RpZmYmIzMyOy0tZ2l0JiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfY2VjLmMNCiZndDsmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19j
ZWMuYw0KJmd0OyYjMzI7aW5kZXgmIzMyO2I2NDBiYzA1NTllNy4uNTEzNmFhZGE5MDIzJiMzMjsx
MDA2NDQNCiZndDsmIzMyOy0tLSYjMzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Nl
Yy5jDQomZ3Q7JiMzMjsrKysmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19jZWMu
Yw0KJmd0OyYjMzI7QEAmIzMyOy0xOTUsOCYjMzI7KzE5NSw3JiMzMjtAQCYjMzI7c3RhdGljJiMz
MjtpbnQmIzMyO210a19jZWNfcHJvYmUoc3RydWN0JiMzMjtwbGF0Zm9ybV9kZXZpY2UNCiZndDsm
IzMyOypwZGV2KQ0KJmd0OyYjMzI7JiMzMjtwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCYjMzI7
Y2VjKTsNCiZndDsmIzMyOyYjMzI7c3Bpbl9sb2NrX2luaXQoJmFtcDtjZWMtJmd0O2xvY2spOw0K
Jmd0OyYjMzI7JiMzMjsNCiZndDsmIzMyOy1yZXMmIzMyOz0mIzMyO3BsYXRmb3JtX2dldF9yZXNv
dXJjZShwZGV2LCYjMzI7SU9SRVNPVVJDRV9NRU0sJiMzMjswKTsNCiZndDsmIzMyOy1jZWMtJmd0
O3JlZ3MmIzMyOz0mIzMyO2Rldm1faW9yZW1hcF9yZXNvdXJjZShkZXYsJiMzMjtyZXMpOw0KJmd0
OyYjMzI7K2NlYy0mZ3Q7cmVncyYjMzI7PSYjMzI7ZGV2bV9wbGF0Zm9ybV9nZXRfYW5kX2lvcmVt
YXBfcmVzb3VyY2UocGRldiwmIzMyOzAsDQomZ3Q7JiMzMjsmYW1wO3Jlcyk7DQoNClRoZSYjMzI7
JiMzOTtyZXMmIzM5OyYjMzI7aXMmIzMyO3VzZWxlc3MsJiMzMjtzbyYjMzI7ZHJvcCYjMzI7aXQu
DQoNClJlZ2FyZHMsDQpDSw0KDQomZ3Q7JiMzMjsmIzMyO2lmJiMzMjsoSVNfRVJSKGNlYy0mZ3Q7
cmVncykpJiMzMjt7DQomZ3Q7JiMzMjsmIzMyO3JldCYjMzI7PSYjMzI7UFRSX0VSUihjZWMtJmd0
O3JlZ3MpOw0KJmd0OyYjMzI7JiMzMjtkZXZfZXJyKGRldiwmIzMyOyZxdW90O0ZhaWxlZCYjMzI7
dG8mIzMyO2lvcmVtYXAmIzMyO2NlYzomIzMyOyVkJiM5MjtuJnF1b3Q7LCYjMzI7cmV0KTsNCiZn
dDsmIzMyOw0KDQo8L3ByZT48IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioqKioq
KiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZSAqKioqKioqKioqKioqKioqKioqKg0K
VGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRp
bmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBw
cml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBw
bGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhl
IGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3Ry
aWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChp
bmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlz
IHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5v
dCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUgDQp0aGF0
IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRo
ZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxl
dGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwgKGluY2x1ZGluZyBhbnkgYXR0
YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBjb250
ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24uIFRoYW5rIHlvdSENCjwvcHJl
PjwhLS19LS0+

--__=_Part_Boundary_006_591045229.1631661456
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEFuZ2VsbzoNCg0KT24gVGh1LCAyMDIzLTA2LTA4IGF0IDEyOjEyICswMjAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gIAkgDQo+IEV4dGVybmFsIGVtYWlsIDogUGxl
YXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBo
YXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+ICBJbnN0ZWFkIG9mIG9w
ZW4gY29kaW5nIGNhbGxzIHRvIHBsYXRmb3JtX2dldF9yZXNvdXJjZSgpIGZvbGxvd2VkIGJ5DQo+
IGRldm1faW9yZW1hcF9yZXNvdXJjZSgpLCBwZXJmb3JtIGEgc2luZ2xlIGNhbGwgdG8gdGhlIGhl
bHBlcg0KPiBkZXZtX3BsYXRmb3JtX2dldF9hbmRfaW9yZW1hcF9yZXNvdXJjZSgpLg0KPiANCj4g
VGhpcyBjb21taXQgYnJpbmdzIG5vIGZ1bmN0aW9uYWwgY2hhbmdlcy4NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDwNCj4gYW5nZWxvZ2lvYWNjaGluby5k
ZWxyZWdub0Bjb2xsYWJvcmEuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfY2VjLmMgICAgICAgIHwgMyArLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZGlzcF9hYWwuYyAgIHwgMyArLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZGlzcF9jY29yci5jIHwgMyArLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlz
cF9jb2xvci5jIHwgMyArLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9n
YW1tYS5jIHwgMyArLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9tZXJn
ZS5jIHwgMyArLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYyAg
IHwgMyArLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9yZG1hLmMgIHwg
MyArLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgICAgICAgIHwgMyAr
LS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jICAgICAgIHwgMyArLS0N
Cj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaV9kZGMuYyAgIHwgMyArLS0NCj4g
IGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfbWRwX3JkbWEuYyAgIHwgMyArLS0NCj4gIDEy
IGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDI0IGRlbGV0aW9ucygtKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfY2VjLmMNCj4gYi9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2NlYy5jDQo+IGluZGV4IGI2NDBiYzA1NTllNy4uNTEz
NmFhZGE5MDIzIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Nl
Yy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfY2VjLmMNCj4gQEAgLTE5
NSw4ICsxOTUsNyBAQCBzdGF0aWMgaW50IG10a19jZWNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rl
dmljZQ0KPiAqcGRldikNCj4gIAlwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBjZWMpOw0KPiAg
CXNwaW5fbG9ja19pbml0KCZjZWMtPmxvY2spOw0KPiAgDQo+IC0JcmVzID0gcGxhdGZvcm1fZ2V0
X3Jlc291cmNlKHBkZXYsIElPUkVTT1VSQ0VfTUVNLCAwKTsNCj4gLQljZWMtPnJlZ3MgPSBkZXZt
X2lvcmVtYXBfcmVzb3VyY2UoZGV2LCByZXMpOw0KPiArCWNlYy0+cmVncyA9IGRldm1fcGxhdGZv
cm1fZ2V0X2FuZF9pb3JlbWFwX3Jlc291cmNlKHBkZXYsIDAsDQo+ICZyZXMpOw0KDQpUaGUgJ3Jl
cycgaXMgdXNlbGVzcywgc28gZHJvcCBpdC4NCg0KUmVnYXJkcywNCkNLDQoNCj4gIAlpZiAoSVNf
RVJSKGNlYy0+cmVncykpIHsNCj4gIAkJcmV0ID0gUFRSX0VSUihjZWMtPnJlZ3MpOw0KPiAgCQlk
ZXZfZXJyKGRldiwgIkZhaWxlZCB0byBpb3JlbWFwIGNlYzogJWRcbiIsIHJldCk7DQo+IA0K

--__=_Part_Boundary_006_591045229.1631661456--

