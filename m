Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DBE7B76AF
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 04:45:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96B7910E0AC;
	Wed,  4 Oct 2023 02:45:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BA9310E0AC
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Oct 2023 02:45:32 +0000 (UTC)
X-UUID: 1211a336626011eea33bb35ae8d461a2-20231004
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=tV9fHETFml8ys493unGv3YWgyfP3Twci9JOsXZBKBV0=; 
 b=lX5RbJexnCLtJDsdCtI8JxNfHdkhPy9tMOuOnj+PUpqE6AbZ2/C8Oi2JcLJsN8oVwhmAHwo5njm2YzcnEMZb5wsc4DcgIEg1qyHK5Rnc7Go+Cdrbeok9PY66OsW86Fxh23gpTkHBMhnXkewrxqNrXJDsnuGNHJKEajli6bMLi9M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:d9be01ae-9731-46ea-bc97-0572ce0d1241, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5f78ec9, CLOUDID:957e8ebf-14cc-44ca-b657-2d2783296e72,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1211a336626011eea33bb35ae8d461a2-20231004
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 723427275; Wed, 04 Oct 2023 10:45:25 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 4 Oct 2023 10:45:24 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Wed, 4 Oct 2023 10:45:24 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AHzcGYOcszmQ+OhX9dhF9fHzhBFxESBHdqz5fDfKeHBQlzPkcbPIyGxzitdlWLr76wG5EL8jwg7aRHiGpC5Eli37G0rmYhVKvMPBJgeQRM2C1oKitgVN+BW2nd37TYrVraWr1j5ZKbxjrWO6i+3IqdjZf8sfjpOp04pJ8D9DLpbOakAssEBhz7HPm6/4wyNchSSnBbxtuPQqnlkWo8U8UfRxpGk130ptzL28kGT1SlrXvj3xXeelzdz4c1HPtv680wfmZ8lXC0XqXgNe6ORM2AZb6HOtmboIi+5u6sm6NY1HG6AK1D8/dfxO/xPks7u12lLsCW7GJjy0adDGey7kCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C6M28plXO08UuHQlTwrvcX8bHQFWz1v06HanIzmw6+k=;
 b=IenPdiyPcW/Jap9xQVSUJO+hRXyi5TaH75HtIlQoPPh4z3FQd7Z8pOtDWsRMqXV7TFVBeP5ASU9/U0fnG9+5TsOh/BWjYYP6JGchhIjjiI9g9tR90knldLHI6HDOUEuHG84ALyRghPwfzLiZjqamdgfaPbATi6aW5BjNV+UbdoUbkV62/VAfFCyFrSPPhrPmoicRjtHLyBc4Qmblck6FKz/xlvuwnhT0sRSnZj3axftm9LetDCN1pqulvy4TKJy28J90XAO0vZnJsyhEjUzVXYKCPTYGRKr83MJK4M7jg15IKqurE57gBvsWcW6T1R+95k8WmaLlMJJwEKWbZWxOFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C6M28plXO08UuHQlTwrvcX8bHQFWz1v06HanIzmw6+k=;
 b=O3Y4jesZkirr8qXwFcDtZ6cI/460bQ0HQtbzDh5ONoom9kggn3PyiCIhgGrZ9GjqjOo2NwhhFLcLwvrhf2HIAZV8KKLRPCtOjUigSHlQcb4LA+IXzvb1tvBKCuR7R2YkuhnuMqe7gQQKr2Inm8mNwgmuqIbLMFH83UvFm90x320=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SI2PR03MB5832.apcprd03.prod.outlook.com (2603:1096:4:144::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.35; Wed, 4 Oct
 2023 02:45:21 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::ceab:94f0:6e70:b85e]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::ceab:94f0:6e70:b85e%6]) with mapi id 15.20.6838.024; Wed, 4 Oct 2023
 02:45:21 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "jkardatzke@google.com" <jkardatzke@google.com>
Subject: Re: [PATCH 01/10] drm/mediatek: Add interface to allocate MediaTek
 GEM buffer.
Thread-Topic: [PATCH 01/10] drm/mediatek: Add interface to allocate MediaTek
 GEM buffer.
Thread-Index: AQHZ9iS+JIjOlHTx30SOmUGGfp/SF7A47VcA
Date: Wed, 4 Oct 2023 02:45:21 +0000
Message-ID: <aaf3c67e9c1c566436d6c8ebbfe72f12105690b5.camel@mediatek.com>
References: <CA+ddPcPS8oUsMk0ziumwdTTWetekE37cK0Gkt9x5w2ig1m2pXQ@mail.gmail.com>
In-Reply-To: <CA+ddPcPS8oUsMk0ziumwdTTWetekE37cK0Gkt9x5w2ig1m2pXQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SI2PR03MB5832:EE_
x-ms-office365-filtering-correlation-id: 08249125-35c3-4fb2-2b55-08dbc483f3d3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7OIzi/8zFPryfgwueVNwOzLM8vmKn3QUYNOsUiWYrq17xhzjACmMJFfTJa6TnwrGavrNh9VR7fCgURe0iCNWqtdlGjyK0G9/+K1WH2H3kMLPB3hhpisa4uRQOqkZUQgfxK1vMZm5zviw/XqGXcaUhzY+7SgCrj53QCAcgGE1kgnfLcDIc1RteqHWROZNMOKFL9VaYvJN5zyfMqpDtV4r2PpxZqFwBgtb83WYAww9um0vvl6JORot76AXO3Mwhd3Mp+UxKH4flp0JwXcF+KHhznKj+DU6SozWhGJvRmefx3RjWd5fGXW+ozV1JJMHKiCQHWBfmP49Y/AnG+VksCcI/eMtMSwedtQwp6m0RqVbQH8QJt9zlkyszF+YyL6AXQLBVKkKFU0BOCY8q/pT1G/X0BgV0dZfVac5YlLySpFhky8pq7Cype0kbTQOpcR/No3v0b8DFdGLzw2HccmF+8Zr/DDvSsKN+V8YbtPZwiBlXIVH1y8ghjGuAK8F1cnJtM3W2fr6BQeu2UW/6G+HM+2Xggedcsxfabp2yNkLSV/ZXb3Ilisw9PV4rCxBpV2HwBtTKDA6kFCwNismABSDN976JU8Qnge+yb6YsAbkEDInoaxhBSgRVjVr5RvORTRSK0GL/89groyq5nwIJ4ibbeEWluMCZxczY63rBerqzJJiCvE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(346002)(366004)(136003)(39860400002)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(71200400001)(6506007)(478600001)(6486002)(6512007)(83380400001)(2616005)(316002)(26005)(7416002)(2906002)(41300700001)(91956017)(76116006)(66946007)(54906003)(64756008)(6916009)(5660300002)(66556008)(66446008)(4326008)(8676002)(8936002)(66476007)(36756003)(85182001)(4744005)(38070700005)(38100700002)(86362001)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QXIrbUF2SE5DNmRrWnA4RU1LdFUvKzlPK3pvWnI2aG5OUnRhdWVDMmoraW5q?=
 =?utf-8?B?eFdVZzVzanN4a0t4ajgrZjN0L0drR0dLSlJtaFhCRXI2NEgwYzFqTDRRV0Na?=
 =?utf-8?B?aHErZk1NSXBzYUpiM1VyL01QeXBGaEZUTy9nb3RGYUNyQmZibEtYZ2dLZFkx?=
 =?utf-8?B?bCtNQmtmWUk2Qk4rZnFhODA4VjA0bDk4RytWR0NQZTAxcy85VVJWejNwdUxn?=
 =?utf-8?B?WVdadFhZbGhCRXB0Wlc0eXI0a3VRSXFsbiszdldFNTBGZTMvL01mYnk4ZWdh?=
 =?utf-8?B?bngrM09mY0FIR1RQWHQxS2lMWjRRRGNlcnAxSURHSWE3V1pYVkFEZUZXTWl0?=
 =?utf-8?B?Y3FPakFJa2ZCSW16MlQ2SE1ObWFjbndoZmRWY2s5a01sam15ZFRDR3NBN0hR?=
 =?utf-8?B?LzNieDIwNWMxemdIYy9lRnlvaU5CQlFYMGdOZ3lrYk5OakZVTjhOakhFaUdL?=
 =?utf-8?B?RWZka3FjM1V5OVVaOW9yWmdodGo4OVl4QVRnZURrYWdSdndoT2ZDVGhLR3pB?=
 =?utf-8?B?aVlTMEtWRDNLSXlWSkNCOEFkZkIwVjZMM21wN1hjNVF2MFppSFU2QzlqY3VY?=
 =?utf-8?B?dGlaY3dMRkdQeHU2b1VYR3d6NkV6NEVpckpIL0FaRndnYm1OTFNyZU9UYlRz?=
 =?utf-8?B?bStLbUFSSVYwaEt5bVNQV0JFbmpDT01mZFZMLzd6Wkp5V3JaSUx5WlltZGxY?=
 =?utf-8?B?TExFZ1BnRTlRclZkam1mNjdjNGx1dW01d3pLMWQwdDVBTlA2TDlHd2RiTnl3?=
 =?utf-8?B?MkpmdWNWQVdIbWsvSDhLb2UzTXFJTlptYnloM2VvNndhVzBKdjFBTE9HeWVN?=
 =?utf-8?B?R2RTR2RGWVd0ekJheVhWdTVGa3B0ajJaWTJlTmNKQmo3TFplSWxEVCtKK3pm?=
 =?utf-8?B?QW9CK1FmQVdtTFY1cHNLdW9NMmk1cmxtOGlDVXp0ZVh4Q2YxRGdKT084UWcv?=
 =?utf-8?B?WnZ6V3YvSk9PVjFrbmIzV1liRTBLbS82L1A0a1gvaVZmaTVmd3pFK2VqZEFN?=
 =?utf-8?B?L0h3K3VtQmpxdFBONHNDTFRnRHpVNk5sc1RNZW42cXpuUUtIQ2lDYmcxME9H?=
 =?utf-8?B?d2Y5LzY5c0kvNEJySGRsaXkrUFF1Z0grMXVoaUlEdGNHM2M0UGcrWm8rdDNs?=
 =?utf-8?B?ekRGQ1J6NUkwNkZla3RHL3o0OFlzSnlxL1lSWFVuWFRrOXNLcjE3akVoemJX?=
 =?utf-8?B?ZERrQkRTZGRTb25obFlVVkl0YUhrZlcwQUxBUFFWeGcyZkRNVlpoUnhHSi9U?=
 =?utf-8?B?c2pnV0dhSGJLZGxvN1UxajVHUi9xMlptRHpKQ2I2OWxoQ1F3SDM2bFp2YU5S?=
 =?utf-8?B?OFR5emZGdG91eHZqZzZTd3NidWxxTVQ5T0hQYWNMUXdSU3lqRzJmOXVycndt?=
 =?utf-8?B?UFl6Z3pJWUVMWGRsZlJvazZBU2JKcER1TEo0YXo0aUhuV2RLWTZtWUFNUkpv?=
 =?utf-8?B?YkViMEo0YTVja0pPaE54VnNyRGZOUmMvcEI5Y2kvKy9ORDlwc3ZTTnk1UkFa?=
 =?utf-8?B?SGFCQnl1aG1YUWFqM2QzSWVNbnFCMGRXdmJ2Yit0TTFodXFHRm9RMFRKNm9I?=
 =?utf-8?B?S2c0TXlLRmVNcXBsOXBjRlNFK0hFZ3R4Z0ZLVmozUFlFMmJaeVJPVVhhNEo0?=
 =?utf-8?B?VmlSQkJvUjhqcnplS1RudTUydmMwVVF1VnNRazBHN1JpYmFvdG5CbzBWT05Z?=
 =?utf-8?B?M3N0MWN2blYyTGxsUEc5TWFOT1djbmdPUi9FM1UyL1kzMmNDR1dzd1l5aW5Q?=
 =?utf-8?B?RUx4bjRFZUtOK0l1R1hRcnlYSUVRNnpubmliMDR5dGtHZGVMZ2kvTVdobmNG?=
 =?utf-8?B?eE5BcDVKNSt6bDZZZnFYbFdsK1RWK2NhMEh6Yit1Z1lhRHhqWnh0cVBxaFp2?=
 =?utf-8?B?aHAzQ0I4dDBYb0lYVHpSbkk1RHBLZFJGMjMxVlplVk5iWFIvVGU4TlhZQlFX?=
 =?utf-8?B?QWhWSVdBdk5Xc0xDYlpiRSt6cFZqOFBWc1VkZkF0Y3pnQ3hrNDVrcmtKYUZp?=
 =?utf-8?B?Mk5pWlNpdml5aW54RXBKS240K0RNMXd0b3lQN2JuTjhtOUcwMUF6cjJEdzZY?=
 =?utf-8?B?dzN3QWNVN21XdUk4dXk1ZHhRcHBQeTlaeFRHdmwxOUh0RURVNnNSaFZPV2s0?=
 =?utf-8?B?QkgrNGozdEJ6VHZQS1d6UktFd2I5R0tKNTE4aC9vYzc0SEtsNTljR1FkQU1r?=
 =?utf-8?B?M3c9PQ==?=
Content-ID: <F4F2FB866D9EAC4DA82855039D18036A@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08249125-35c3-4fb2-2b55-08dbc483f3d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2023 02:45:21.2908 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yBSB+Odl8mWjT53vzzlc3qbbwUFSFMaXQ7azALTnnszjZQmECC3A+svnjokMAPYYqblfTJgoklsjaQYfz6yMhZ6rxzL80yvzgIjDevrBFj0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB5832
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--6.103500-8.000000
X-TMASE-MatchedRID: 7ySqCuYCpfgOwH4pD14DsPHkpkyUphL9meN8m2FdGic3xO2R3boBWFbu
 qIY+/skQkABPgKBt/0p0BGBq7A++1hAq4jU0QZlBiUPZPmKZOQmpD1R7N5OROO2bjZi+EXNn2mK
 pI8uzzwDA2G3OXMO97L1Odlcux5HWQv21zJNl0CyDGx/OQ1GV8khax4LkeV5t+gtHj7OwNO2Ohz
 Oa6g8KrZgXRoWuDp1J6pk1acVu7CQv++0FMo9MWiKEfPrVrEa4JCgGgWOU8LRDDKa3G4nrLQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--6.103500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 2B09B5359053E08ECD1E837F0BB19C439E1DD177E7F15C5E8B4EB163E8926D522000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_002_1359115821.105329539"
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
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "drinkcat@chromium.org" <drinkcat@chromium.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 =?utf-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?= <Jason-ch.Chen@mediatek.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 =?utf-8?B?Sm9obnNvbiBXYW5nICjnjovogZbpkasp?= <Johnson.Wang@mediatek.com>,
 =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_002_1359115821.105329539
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCk9uJiMzMjtUdWUsJiMzMjsyMDIzLTEwLTAzJiMzMjthdCYjMzI7MTE6MDkmIzMyOy0w
NzAwLCYjMzI7SmVmZnJleSYjMzI7S2FyZGF0emtlJiMzMjt3cm90ZToNCiZndDsmIzMyOyYjMzI7
JiMzMjsNCiZndDsmIzMyO0V4dGVybmFsJiMzMjtlbWFpbCYjMzI7OiYjMzI7UGxlYXNlJiMzMjtk
byYjMzI7bm90JiMzMjtjbGljayYjMzI7bGlua3MmIzMyO29yJiMzMjtvcGVuJiMzMjthdHRhY2ht
ZW50cyYjMzI7dW50aWwNCiZndDsmIzMyO3lvdSYjMzI7aGF2ZSYjMzI7dmVyaWZpZWQmIzMyO3Ro
ZSYjMzI7c2VuZGVyJiMzMjtvciYjMzI7dGhlJiMzMjtjb250ZW50Lg0KJmd0OyYjMzI7JiMzMjtZ
b3UmIzMyO2NhbiYjMzI7cmVtb3ZlJiMzMjt0aGUmIzMyO0RSSVZFUl9SRU5ERVImIzMyO2ZsYWcm
IzMyO2Zyb20mIzMyO3RoaXMmIzMyO3BhdGNoc2V0LiYjMzI7VGhhdA0KJmd0OyYjMzI7c2hvdWxk
DQomZ3Q7JiMzMjtub3QmIzMyO2JlJiMzMjt1cHN0cmVhbWVkLiYjMzI7VGhlJiMzMjtJT0NUTHMm
IzMyO2FyZSYjMzI7c3RpbGwmIzMyO25lZWRlZCYjMzI7dGhvdWdoJiMzMjtiZWNhdXNlJiMzMjtv
ZiYjMzI7dGhlDQomZ3Q7JiMzMjtmbGFnJiMzMjtmb3ImIzMyO2FsbG9jYXRpbmcmIzMyO2EmIzMy
O3NlY3VyZSYjMzI7c3VyZmFjZSYjMzI7dGhhdCYjMzI7aXMmIzMyO2luJiMzMjt0aGUmIzMyO25l
eHQmIzMyO3BhdGNoLiYjMzI7SWYNCiZndDsmIzMyO3RoYXQmIzMyO2ZsYWcmIzMyO3dhc24mIzM5
O3QmIzMyO25lZWRlZCwmIzMyO3RoZW4mIzMyO2R1bWImIzMyO2J1ZmZlciYjMzI7YWxsb2NhdGlv
bnMmIzMyO2NvdWxkJiMzMjtiZSYjMzI7dXNlZA0KJmd0OyYjMzI7aW5zdGVhZC4NCiZndDsmIzMy
Ow0KJmd0OyYjMzI7VGhhbmtzLA0KJmd0OyYjMzI7SmVmZiYjMzI7S2FyZGF0emtlDQoNCk9LLCYj
MzI7SWxsJiMzMjtyZW1vdmUmIzMyO0RSSVZFUl9SRU5ERVImIzMyO2ZsYWcmIzMyO2luJiMzMjt0
aGUmIzMyO25leHQmIzMyO3ZlcnNpb24uJiMzMjtUaGFua3MhDQoNClJlZ2FyZHMsDQpKYXNvbi1K
SC5MaW4NCg0KPC9wcmU+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioqKioq
IE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UNCiAqKioqKioqKioqKioqKioqKioqKg0K
VGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRp
bmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBw
cml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBw
bGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhl
IGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3Ry
aWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChp
bmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlz
IHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5v
dCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUNCiANCnRo
YXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkg
dGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRl
bGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBh
dHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNv
bnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9w
cmU+PCEtLX0tLT4=

--__=_Part_Boundary_002_1359115821.105329539
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDIzLTEwLTAzIGF0IDExOjA5IC0wNzAwLCBKZWZmcmV5IEthcmRhdHprZSB3cm90
ZToNCj4gIAkgDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBv
ciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIg
b3IgdGhlIGNvbnRlbnQuDQo+ICBZb3UgY2FuIHJlbW92ZSB0aGUgRFJJVkVSX1JFTkRFUiBmbGFn
IGZyb20gdGhpcyBwYXRjaHNldC4gVGhhdA0KPiBzaG91bGQNCj4gbm90IGJlIHVwc3RyZWFtZWQu
IFRoZSBJT0NUTHMgYXJlIHN0aWxsIG5lZWRlZCB0aG91Z2ggYmVjYXVzZSBvZiB0aGUNCj4gZmxh
ZyBmb3IgYWxsb2NhdGluZyBhIHNlY3VyZSBzdXJmYWNlIHRoYXQgaXMgaW4gdGhlIG5leHQgcGF0
Y2guIElmDQo+IHRoYXQgZmxhZyB3YXNuJ3QgbmVlZGVkLCB0aGVuIGR1bWIgYnVmZmVyIGFsbG9j
YXRpb25zIGNvdWxkIGJlIHVzZWQNCj4gaW5zdGVhZC4NCj4gDQo+IFRoYW5rcywNCj4gSmVmZiBL
YXJkYXR6a2UNCg0KT0ssIElsbCByZW1vdmUgRFJJVkVSX1JFTkRFUiBmbGFnIGluIHRoZSBuZXh0
IHZlcnNpb24uIFRoYW5rcyENCg0KUmVnYXJkcywNCkphc29uLUpILkxpbg0K

--__=_Part_Boundary_002_1359115821.105329539--

