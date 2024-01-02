Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF308217A3
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jan 2024 07:13:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2451210E10B;
	Tue,  2 Jan 2024 06:13:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A4AF10E10B
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jan 2024 06:13:24 +0000 (UTC)
X-UUID: 05570b0aa93611eea2298b7352fd921d-20240102
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=V5ktba9XB2bScwC+eLr8NIrObVnuKp3ot+6XWAFhUOc=; 
 b=F6dhld2J1PLxJfnqRBstnQU40PeVqfjxxyP0CgyK4r0VFWOaKl+mZhByd0z+uYEFrUKucDwPJmwX+UHOv5EgoreM1OpA6pza1bCoVNXC3AEv67WF1XtfXYkm3/8zTr2kDbQmJjdP7y+h27SpGNxRg+67966naOsWIOVbhGWFGr4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35, REQID:e724aa01-b3ea-40a3-b90b-88d02404acd7, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5d391d7, CLOUDID:0f2a6482-8d4f-477b-89d2-1e3bdbef96d1,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 05570b0aa93611eea2298b7352fd921d-20240102
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1716244224; Tue, 02 Jan 2024 14:13:17 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 2 Jan 2024 14:13:16 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Tue, 2 Jan 2024 14:13:16 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mStvK5yybKcf6CXSjoN8dvplZSY1Sjbx9uyRM/IXZVQq2TcxKiwD8OjrjlWAi0VzSRHbV+uglyCZzEqa2KYViN0k5lIZVeiH1Hr3y+z3vgCK6lGYinUKkBBpiYaUw5jMpV6pb93bCPSuEqMv+LWHikGwDiREfQt9SUVyOXlgnJ7LJOIdO3IDO4Xcu9vFOsL4am3U2jfyQyfhL0GNuy2/py2f2SCpQxGqaVlI3eexldfE9e06ctJ0lOlsK0t75alxGcA6HrffWkA2cgAMobFmIdhRd1Zwm4pVKTZ8xaKJ9BI48UM4+TCugziIV/l/DvsAIulBaCtp61BvU9A7fzEF8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O4s3m93yiGHDTN63zIaPe5M1ZkIo08X3ZN4YoBZYphs=;
 b=JjOQFaLDcIRmLdf8jTh2IoG6s2hTNSmPSuV7f3fhoxyJXHIPyc2emSxV/y/588ukDgZMQJzfDeunFMoPQ48EO4FKA5mFtjbNcffoTcP9wpWMG37DS94IsBLYoOifyooYnIKVRRs8xV5GzJSBxak1qsopXhFWyMKumIu+4gY5jkTuLCSDPBtKcs1L47HZEme/Gz0Jx97q/wRJuhGp6AOplM4fBSkqKiNchEnKXHrh9DhD4vNXBqDhEFF9HaIWBkc7NwVSwDh82DWX0S7V+FgWRp5CdEDNiLy9CV8nI1DfQ30p9a0SlEmUtSxr/kcMw9kGOP4Awr0qNii57BhbQcjL0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O4s3m93yiGHDTN63zIaPe5M1ZkIo08X3ZN4YoBZYphs=;
 b=cz3j+HU7usX5sO9FCJOSMrpIFphMcnb9vJF5TCwFYN/SAUkOBNzgARWc4WG5SGhLyHVHG2DOu5R/K7hTFnAmPmjb4F/dgJPRe63yU2bdOITsD5RnR1QsLYwfIUNmEwxXzWW3nD3iAB9cMaEtMfa6A0zKQjU8WNW2nwXZyFcdLV0=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by PUZPR03MB7044.apcprd03.prod.outlook.com (2603:1096:301:11c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.25; Tue, 2 Jan
 2024 06:13:12 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::eb43:57cb:edfd:3762]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::eb43:57cb:edfd:3762%7]) with mapi id 15.20.7135.023; Tue, 2 Jan 2024
 06:13:12 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>
Subject: Re: [PATCH v4 08/17] drm/mediatek: Support alpha blending in display
 driver
Thread-Topic: [PATCH v4 08/17] drm/mediatek: Support alpha blending in display
 driver
Thread-Index: AQHaLPWa6N55KhGZh0qGR9cV5awFLbDGK5qA
Date: Tue, 2 Jan 2024 06:13:12 +0000
Message-ID: <f53e0738de630c196e4cf37e18cbd3ef2c3aac26.camel@mediatek.com>
References: <20231212121957.19231-1-shawn.sung@mediatek.com>
 <20231212121957.19231-9-shawn.sung@mediatek.com>
In-Reply-To: <20231212121957.19231-9-shawn.sung@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|PUZPR03MB7044:EE_
x-ms-office365-filtering-correlation-id: 59fedd8d-fbb0-4369-c367-08dc0b59e627
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2/HTkeo0dqmUHyNRrCRaZrg5/l4lZHNHke88cEKg1SnIAOtADCAh+7SjbLsKknE5DxgS8ixj0GgvZiyuziWuNSOLhmbPMVOhhOS/z4frtKHOH/12rwhmgx1SL+HoWrdvBWDXo7Snj7RCY1svhiLZecrejzcVPA3YLJ3Zdl82kxR0bOx+wkLddl50UO93ysMApKnLZ6PkaOU7MP6vIKs/oEHDLhMkMfFPKl5hFKUREG9y4SNt5Q1H8SNOu+u/IO11g5CWwJsNj+2mX0PggE22h4ouzMMGEZDkVKgV8VU2DnJgH3JMYgXIXqHBcgIbq/ideWwSStjtPpiNzQxiGoKilxUhDYgRK+Y4RoI9CFbaecxnrUpqls8tpOvzA9ZBpdFCkulWCS+1grRPXgLIUMqXimVwW9Hp37gwgYrVPMapOPczmWmCSH0LnpXS/wQRu60F0nJYtGK2gUqC4NWHDWz6VMZBzU3HaBdvEo2jhbCWKMUrjVP5SwOov5gJPSMqw9hllfxGLylCYYuhFX/dAfE47+WbbtQXw/ol2GaeukQqkVOCXCg6wfOv+ddAiwYgLqh4UhQIBYHucTZUjIB6S/m2HCxhD7vYUsR0dUyrCWAJhKKk+uwsNzy01mKjfjrf0vMeSELwWY6JIfxOIOjB5PctUlrFPSY8zNc/tBf3QATKttU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(366004)(346002)(39860400002)(136003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(66946007)(76116006)(4326008)(66556008)(66476007)(64756008)(66446008)(478600001)(6486002)(110136005)(8936002)(316002)(54906003)(8676002)(71200400001)(6506007)(6512007)(2616005)(26005)(5660300002)(4001150100001)(2906002)(7416002)(41300700001)(38070700009)(85182001)(36756003)(122000001)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M0tVc1VKeUdENDNrZVlwbnZjaUoweUhRb0gxNUxCQ0FHa2NES0xOMzMzblkv?=
 =?utf-8?B?TFFLOUJUT005dmR3TGFrNHNpYThwdXV6WVVJdkZ3N1hHcXQvWk5QWTJlTTZX?=
 =?utf-8?B?RjdRR0FTM3hEVmtLRGtwTXIzZ293cS9pWTUyOVhpc0NsQXgrRUtXeTBIbHl6?=
 =?utf-8?B?a0FHMDVyZGVrTFZBc3ExS2thUEUxS3pKRG9qR3J2azZIZG9nSXdEU09hbkFw?=
 =?utf-8?B?OS9FbkExcXI2SHFDZ1N6L0FMWlhwS3VwcjNSVXpWOFhzenN2L1BqWVB6dCtM?=
 =?utf-8?B?c1VHbkptU2NEK0ZWNi83Wi82YnlFSHN2QVBOSytEMUhybks0c2M0WUtFQ29I?=
 =?utf-8?B?SSt1aFVJSEdsUUdsZGJPeDZDQTVGYVRCWnFERTVnc1dUdDNHMmR1NUZISnJr?=
 =?utf-8?B?cTFqZDFyVWE1N0h2TDlvaWVBY0NhbG5VaTRsS1J6VnVxMkZXZmVzZ2VsT0R5?=
 =?utf-8?B?bDhzVXQxMUJvM1pZNUdLMk1uMkJqN29aSXc1T2V5MjlkeFFTR2x5SFV0MXNk?=
 =?utf-8?B?L0ZsUFFGV1RLRVVYcWFKa0QrQ2dpazVuemV1ZjNuYjBIZ1llNi9XVVpUZzUw?=
 =?utf-8?B?TENoZk4xOVdEQW5PZzIyQXU2ZUdJTkl0UW5WVndMR3F1aGtpY3hDR1lVQk5L?=
 =?utf-8?B?STVUN0tITk1wYXE0eXAxeEFxdk9GMmE0cDlibEQ0RmxkK0tpK3R6T1FRT0dI?=
 =?utf-8?B?TmhhWmxMUC9IcVc2LzFqTVdiWU9zSmU1Z05zbXZKWGdKSUtIdVpoeG9uTUJy?=
 =?utf-8?B?cFYvYnJqbEczWlg0SnZQcVF6V1M1VlM4KzJnaExlb0xOR1JkQ0JYYmtDc3F0?=
 =?utf-8?B?Z1k5TU51MUQ0U0swOXVHdk5ON1R4cEpaWkJqa05VWWY4b3JIQkNVVmNTaW1M?=
 =?utf-8?B?VVBlVHJUbzlXbXhXUGduYXJ5bW84MWxVYnBjVmJnVHNuaFN6MkJIWk1FcHlS?=
 =?utf-8?B?RHhaR3NzYW9LbmR3WnU3WFdHNG15MUNNaVA5SjRjN09kRGw1SVBOY3pkRFR4?=
 =?utf-8?B?cWU4Q2dSdmlhdVE2U2tKUG9NSDl5WTlHUEpJK2ZXL0t4SitzWmR6dkYzclpn?=
 =?utf-8?B?N3BzU2VaUC9USzc1Vm5OdUg4ZStTU2xOSEJHOGpxZVhLM0wxaWZOajMydENi?=
 =?utf-8?B?WUE0d0NQYmw4K2dTWG1YWUo4Sm55SFoycUdaaS94UHBTT0RRcFZXR2ZPYTMy?=
 =?utf-8?B?T3lxQmwrdzJsWVhGZjFhaXMrRHdJSzhiWXJqcXBza3dqOFMvY04wZzZxQUho?=
 =?utf-8?B?cUtpWlF2NUFseGp2SW9xeU1sRjR0YUZEMVMySGVuUWdNMkhtNHRzY1FPUFJP?=
 =?utf-8?B?SjZ1ZE11L3VTWGJPYjloVnkzcmt2QmxEU0JXdnp1UXpyZ2huYktnVUxCMFFX?=
 =?utf-8?B?emVyVjZ5eURDeTE1ZGgvc2xHYmZzOUF4WWFkSURtQ3RmUHY4ZzVUYXczTkVV?=
 =?utf-8?B?UnRuMlZ4dkQ2ZENoaTFjc3poREZUbFpUR2thN3RZa2lhOWgwTzhVaWdXWFRG?=
 =?utf-8?B?TlZtdmZMQkwxOUgwaXdmM09OY1hvL0IvNXozTXRDWEl6Rk9oYUpUdFRDWERJ?=
 =?utf-8?B?azE1YWFVVHl5TU5DMnp1WHFRMUdTSmtlSlhHYXFkd3Zpb0ZyRXhSWHIwdkF2?=
 =?utf-8?B?QVN2TWtKQkcyNVFxWDQwU2ZYQ2xMTjRwS2g5aDlGNyt0WDFVaU95RjVWTkl3?=
 =?utf-8?B?Z1lHMk9DWFJwMUg1Y0wvc3JiUjA1YndGOFZhbmZyNTlHeXFlUTcrbTN5Y1Y0?=
 =?utf-8?B?QUdUOEhKTjJtQ0JkVkRKd1lNYWM5ZHRGOTk1KzF1WTRBSlhSNlhnT1lRclor?=
 =?utf-8?B?ZUt6R1VYT3EzZTl6T3R3a2tkdDdBSlVxSGI5WitvcHUwcWIwMjZyeWp0RmtR?=
 =?utf-8?B?aHpreG9NU21BYnNTa2YzU1dIZTliYzJHYStTWElmUUEwVFl0OVlOZGxVeFdP?=
 =?utf-8?B?WXFYRXpPR1hiSGd3TG9GVUZUUTBBeklkYmZlOWltVkJ2SEltb0hLK0FaME83?=
 =?utf-8?B?ekRTN0QxYVBubnVkK3R6bDlCQWovc3pMMFZHMmcrajZRVDBHcUFaUU4za2d3?=
 =?utf-8?B?dG1LMnN6VVQ1QXlRK1ZtbFVNRGdBSm9jOUJ6ZDVZeUZ2M2Z1bDBsbCtzOW41?=
 =?utf-8?Q?NeC8+ppajuea4wyopHMy52EvR?=
Content-ID: <5DD3A1774C8BA44DA659A5AF8484958D@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59fedd8d-fbb0-4369-c367-08dc0b59e627
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jan 2024 06:13:12.0532 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PPZcSU388pKGPxlgBDuxEBYwhExJ9Abuvb0ebOJgkz7GC/6AF4FWk47SG0oqMkMnZzyK7cuke5VGpvwYlufr1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB7044
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--11.521300-8.000000
X-TMASE-MatchedRID: wQVy7q402w0/XHdICuW5rya1MaKuob8PC/ExpXrHizwE6M1YtcX6vHkX
 3+3gSeXPKsiucgwl76qyXQ+vh/zqYiUtdpGicV4RA9lly13c/gEK3n1SHen81RL6MU7t349bKBD
 u9B2tQknG/k2zFq8ZNJGTpe1iiCJq0u+wqOGzSV1WdFebWIc3VsRB0bsfrpPIfiAqrjYtFiR8I2
 h9HpBHLTPPZtPs1KMGb2DRDMWOr5W3xEN9Ocrpdn7cGd19dSFd
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--11.521300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 4D011D4F0F17E3B7FC171FDCB1A6A10497A75C0059D80A154BDBAAF4E5811F8C2000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_003_1944430088.1459188889"
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
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "fshao@chromium.org" <fshao@chromium.org>, "sean@poorly.run" <sean@poorly.run>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "wenst@chromium.org" <wenst@chromium.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_003_1944430088.1459188889
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtIc2lhby1jaGllbjoNCg0KT24mIzMyO1R1
ZSwmIzMyOzIwMjMtMTItMTImIzMyO2F0JiMzMjsyMDoxOSYjMzI7KzA4MDAsJiMzMjtIc2lhbyYj
MzI7Q2hpZW4mIzMyO1N1bmcmIzMyO3dyb3RlOg0KJmd0OyYjMzI7U3VwcG9ydCYjMzI7YWxwaGEm
IzMyO2JsZW5kaW5nJiMzMjtieSYjMzI7YWRkaW5nJiMzMjtjb3JyZWN0JiMzMjtibGVuZCYjMzI7
bW9kZSYjMzI7YW5kDQomZ3Q7JiMzMjthbHBoYSYjMzI7cHJvcGVydHkmIzMyO2luJiMzMjtwbGFu
ZSYjMzI7aW5pdGlhbGl6YXRpb24uDQoNClJldmlld2VkLWJ5OiYjMzI7Q0smIzMyO0h1JiMzMjsm
bHQ7Y2suaHVAbWVkaWF0ZWsuY29tJmd0Ow0KDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1NpZ25lZC1v
ZmYtYnk6JiMzMjtIc2lhbyYjMzI7Q2hpZW4mIzMyO1N1bmcmIzMyOyZsdDtzaGF3bi5zdW5nQG1l
ZGlhdGVrLmNvbSZndDsNCiZndDsmIzMyOy0tLQ0KJmd0OyYjMzI7JiMzMjtkcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RybV9wbGFuZS5jJiMzMjt8JiMzMjsxMSYjMzI7KysrKysrKysrKysN
CiZndDsmIzMyOyYjMzI7MSYjMzI7ZmlsZSYjMzI7Y2hhbmdlZCwmIzMyOzExJiMzMjtpbnNlcnRp
b25zKCspDQomZ3Q7JiMzMjsNCiZndDsmIzMyO2RpZmYmIzMyOy0tZ2l0JiMzMjthL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX3BsYW5lLmMNCiZndDsmIzMyO2IvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kcm1fcGxhbmUuYw0KJmd0OyYjMzI7aW5kZXgmIzMyOzkyMDhmMDNi
M2Y4Yy4uZGZkODExNzJhOTQwJiMzMjsxMDA2NDQNCiZndDsmIzMyOy0tLSYjMzI7YS9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9wbGFuZS5jDQomZ3Q7JiMzMjsrKysmIzMyO2IvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fcGxhbmUuYw0KJmd0OyYjMzI7QEAmIzMyOy0z
NDksNiYjMzI7KzM0OSwxNyYjMzI7QEAmIzMyO2ludCYjMzI7bXRrX3BsYW5lX2luaXQoc3RydWN0
JiMzMjtkcm1fZGV2aWNlJiMzMjsqZGV2LA0KJmd0OyYjMzI7c3RydWN0JiMzMjtkcm1fcGxhbmUm
IzMyOypwbGFuZSwNCiZndDsmIzMyOyYjMzI7RFJNX0lORk8oJnF1b3Q7Q3JlYXRlJiMzMjtyb3Rh
dGlvbiYjMzI7cHJvcGVydHkmIzMyO2ZhaWxlZCYjOTI7biZxdW90Oyk7DQomZ3Q7JiMzMjsmIzMy
O30NCiZndDsmIzMyOyYjMzI7DQomZ3Q7JiMzMjsrZXJyJiMzMjs9JiMzMjtkcm1fcGxhbmVfY3Jl
YXRlX2FscGhhX3Byb3BlcnR5KHBsYW5lKTsNCiZndDsmIzMyOytpZiYjMzI7KGVycikNCiZndDsm
IzMyOytEUk1fRVJST1IoJnF1b3Q7ZmFpbGVkJiMzMjt0byYjMzI7Y3JlYXRlJiMzMjtwcm9wZXJ0
eTomIzMyO2FscGhhJiM5MjtuJnF1b3Q7KTsNCiZndDsmIzMyOysNCiZndDsmIzMyOytlcnImIzMy
Oz0mIzMyO2RybV9wbGFuZV9jcmVhdGVfYmxlbmRfbW9kZV9wcm9wZXJ0eShwbGFuZSwNCiZndDsm
IzMyOysmIzMyOyYjMzI7JiMzMjtCSVQoRFJNX01PREVfQkxFTkRfUA0KJmd0OyYjMzI7UkVNVUxU
SSkmIzMyO3wNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjtCSVQoRFJNX01PREVfQkxFTkRfQw0K
Jmd0OyYjMzI7T1ZFUkFHRSkmIzMyO3wNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjtCSVQoRFJN
X01PREVfQkxFTkRfUA0KJmd0OyYjMzI7SVhFTF9OT05FKSk7DQomZ3Q7JiMzMjsraWYmIzMyOyhl
cnIpDQomZ3Q7JiMzMjsrRFJNX0VSUk9SKCZxdW90O2ZhaWxlZCYjMzI7dG8mIzMyO2NyZWF0ZSYj
MzI7cHJvcGVydHk6JiMzMjtibGVuZF9tb2RlJiM5MjtuJnF1b3Q7KTsNCiZndDsmIzMyOysNCiZn
dDsmIzMyOyYjMzI7ZHJtX3BsYW5lX2hlbHBlcl9hZGQocGxhbmUsJiMzMjsmYW1wO210a19wbGFu
ZV9oZWxwZXJfZnVuY3MpOw0KJmd0OyYjMzI7JiMzMjsNCiZndDsmIzMyOyYjMzI7cmV0dXJuJiMz
MjswOw0KDQo8L3ByZT4NCjwvcD48L2JvZHk+PC9odG1sPjwhLS10eXBlOnRleHQtLT48IS0tey0t
PjxwcmU+KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlICoqKioq
KioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWls
IG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlh
bCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlz
Y2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29u
dmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3Nl
bWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcg
b2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRl
ZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdm
dWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwg
b3IgYmVsaWV2ZSANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3Is
IHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0
aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAo
aW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0K
ZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4g
VGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_003_1944430088.1459188889
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEhzaWFvLWNoaWVuOg0KDQpPbiBUdWUsIDIwMjMtMTItMTIgYXQgMjA6MTkgKzA4MDAsIEhz
aWFvIENoaWVuIFN1bmcgd3JvdGU6DQo+IFN1cHBvcnQgYWxwaGEgYmxlbmRpbmcgYnkgYWRkaW5n
IGNvcnJlY3QgYmxlbmQgbW9kZSBhbmQNCj4gYWxwaGEgcHJvcGVydHkgaW4gcGxhbmUgaW5pdGlh
bGl6YXRpb24uDQoNClJldmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPg0KDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBIc2lhbyBDaGllbiBTdW5nIDxzaGF3bi5zdW5nQG1lZGlhdGVr
LmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9wbGFuZS5j
IHwgMTEgKysrKysrKysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fcGxhbmUu
Yw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX3BsYW5lLmMNCj4gaW5kZXgg
OTIwOGYwM2IzZjhjLi5kZmQ4MTE3MmE5NDAgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHJtX3BsYW5lLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kcm1fcGxhbmUuYw0KPiBAQCAtMzQ5LDYgKzM0OSwxNyBAQCBpbnQgbXRrX3BsYW5l
X2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwNCj4gc3RydWN0IGRybV9wbGFuZSAqcGxhbmUs
DQo+ICAJCQlEUk1fSU5GTygiQ3JlYXRlIHJvdGF0aW9uIHByb3BlcnR5IGZhaWxlZFxuIik7DQo+
ICAJfQ0KPiAgDQo+ICsJZXJyID0gZHJtX3BsYW5lX2NyZWF0ZV9hbHBoYV9wcm9wZXJ0eShwbGFu
ZSk7DQo+ICsJaWYgKGVycikNCj4gKwkJRFJNX0VSUk9SKCJmYWlsZWQgdG8gY3JlYXRlIHByb3Bl
cnR5OiBhbHBoYVxuIik7DQo+ICsNCj4gKwllcnIgPSBkcm1fcGxhbmVfY3JlYXRlX2JsZW5kX21v
ZGVfcHJvcGVydHkocGxhbmUsDQo+ICsJCQkJCQkgICBCSVQoRFJNX01PREVfQkxFTkRfUA0KPiBS
RU1VTFRJKSB8DQo+ICsJCQkJCQkgICBCSVQoRFJNX01PREVfQkxFTkRfQw0KPiBPVkVSQUdFKSB8
DQo+ICsJCQkJCQkgICBCSVQoRFJNX01PREVfQkxFTkRfUA0KPiBJWEVMX05PTkUpKTsNCj4gKwlp
ZiAoZXJyKQ0KPiArCQlEUk1fRVJST1IoImZhaWxlZCB0byBjcmVhdGUgcHJvcGVydHk6IGJsZW5k
X21vZGVcbiIpOw0KPiArDQo+ICAJZHJtX3BsYW5lX2hlbHBlcl9hZGQocGxhbmUsICZtdGtfcGxh
bmVfaGVscGVyX2Z1bmNzKTsNCj4gIA0KPiAgCXJldHVybiAwOw0K

--__=_Part_Boundary_003_1944430088.1459188889--

