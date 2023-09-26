Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 108F27AE3BA
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 04:45:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AA1410E00B;
	Tue, 26 Sep 2023 02:45:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CB2010E00B
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 02:45:34 +0000 (UTC)
X-UUID: c18964165c1611eea33bb35ae8d461a2-20230926
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=eptHX5MsT0K7h6P99Ei921zoG4m42J81gzWAgEKPpec=; 
 b=tocy0EL/XYOKz1l2+Jmh8owjyo6srnhAnnasVhsUQseR3A4z0hsjUyhvUa+R9qQKxexYu6sF/Ev5OlIVcnq7sDXBVYAkqUVzbaPRwJDch4IxLY8uOHbJ6erbqOE51W7kRTbWEG5RHN4vfAAcOPdFYVOsZqaxzYEfHB8N8gltkzs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:210fcbd5-8d76-452e-b18e-334f4de78b1c, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5f78ec9, CLOUDID:e0fa44bf-14cc-44ca-b657-2d2783296e72,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: c18964165c1611eea33bb35ae8d461a2-20230926
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 201341178; Tue, 26 Sep 2023 10:45:30 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 26 Sep 2023 10:45:28 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Tue, 26 Sep 2023 10:45:28 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VaFQouwRldZWqcsVfu9V5MBjvD0vsT5b59pNsni9YciQS9te7ZZ587zfCjv+BdTv+s9ldCAFoXtX9hDlcbIjz47myXY76e9su74aX5hH6VBoAml28xIt3Wlq3btm1JYU4tE5Lbap5yzz31dNBVq7aEyAziC3jBq9uv6IncgwqTYs5ic9LToA7qbW4oUX6kyU81ORONqh64d38fFFRgiGrXDdO/n5jiGv5Aql5iKeI0VaOb71DXG06IRvUaaeaAvisQzuMt0/+qunfOywap08uWAZ62ZlKbeCpVXIasxLLj6en8vnBoVFwgMibEYiNwPcEspU79uc7bY6nbqeViXK6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=64WoD24zS3rYuELzjuhSxeWioPSc1RMMVWR/FPWv0QA=;
 b=hL3ophedG9eNXPUfP8Dfaufcb6iqrphij6dE0gbI883LfTLooeWADrONC6vqXZ2UYgwmDJzxF+e247/27omLk7K0s4BrwuNbwcXOxdPG/yQ/InzMb2AglZGYpXsdJVw4RokGQpedAf2f4JudgNM+NWnTdL4DOJ2zNGi/BvZtN1oOu+hiXWjwwM6ubGCcbzN4IuQRJ+qhi25LJxqG8fwIsDAiUJ1Q8Ih/3vFWI3/H7sWBNxCTdkCCTEi6+++6TF3PXdixGAvN0pm7fegYZfH9cbEkzMJKAOfwN1ra+2ryFuRnONa8uLIxLwX77Ys4ADeV65H9v5H4mCjy5BhKQNkGQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=64WoD24zS3rYuELzjuhSxeWioPSc1RMMVWR/FPWv0QA=;
 b=jXUTOYev54cep6h6PDEI8Hjgwj9Sgg8Ro/Z4uQR1HSHdB0HEQO7p4kxTzC9nCa4NRuYPRZsYdkbD5u55K31vUWd2/5IzNC0PLRa9YCbaxN6SYlDQ0YyGP3dmrfQHme/LHRUBJAQKSQ7d1lDwTM96yYd5FK0NATcJgItHVVN+JXM=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by JH0PR03MB8097.apcprd03.prod.outlook.com (2603:1096:990:3a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 02:45:26 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1b82:a45d:e171:62e8]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1b82:a45d:e171:62e8%4]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 02:45:26 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 02/15] dt-bindings: gce: mt8195: Add
 CMDQ_SYNC_TOKEN_SECURE_THR_EOF event id
Thread-Topic: [PATCH 02/15] dt-bindings: gce: mt8195: Add
 CMDQ_SYNC_TOKEN_SECURE_THR_EOF event id
Thread-Index: AQHZ6mVuaEaAeOxsw0iaYveBj8ZT1bAouz6AgAJLx4CAABsCgIAAKbeAgAAE1YCAASGigA==
Date: Tue, 26 Sep 2023 02:45:26 +0000
Message-ID: <92e162c1c59d2139377f014a4027081482f57157.camel@mediatek.com>
References: <20230918192204.32263-1-jason-jh.lin@mediatek.com>
 <20230918192204.32263-3-jason-jh.lin@mediatek.com>
 <20372e40-e4fc-467a-d91a-fcf8e26728bc@linaro.org>
 <1f324b04cbd8faa7510a3519eb718c0be25af2be.camel@mediatek.com>
 <e69ca292-e0b9-4ee2-9f4e-6e9300a636a6@linaro.org>
 <354bb70cd3f1921dd58629a044af7bfe4f3306c0.camel@mediatek.com>
 <54b6ee93-1d36-46a4-a104-59129fe41a32@linaro.org>
In-Reply-To: <54b6ee93-1d36-46a4-a104-59129fe41a32@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|JH0PR03MB8097:EE_
x-ms-office365-filtering-correlation-id: cd205d97-441a-4dbb-e0f4-08dbbe3aa395
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YgZJkUv/fFvjMcmiw2ifLUiAU9e7DI2OPoYyym744CtFIvKUfXSOYl1pKVGaWC30Yawq3m0RPExFwBDymt/2rNF9obzAuq48pDYm1dh8Y6ii9nTEUk5Sv1+qkcpxcK1+2CRflg6rebphZejF9+ACKnf3uDXB2RpgnUiccb086VTN4Lok0qAO4uqLO9DLlZZPCUvXhlV6Tn3jE8kJnvgaW+3LzzLQm4VHsuJDKZlFKrnke3j7iKiFVjU1v1a9zFzmjlAwUhGIfoLzGYtMvylmncCs6VBJUSeeoFcNWYpLxt4A2OW6zdB0OPqVJTipq8Zlp/P9molKdpv+JRa1OtOp9CuWU/E9ZADr0P/6UZgKsXPgFZmUv0R/2kZjD7STxZoq3CPbv4itrUUUa6wd4UKleBrtZjBgsW18ELt+fHsFb3L0ptNUFB/hlMiiIrHOBJxaLifCPwyZXVEsbbaBWsN1kqimE8RBt81Y4YDGn9VYUmFqsYcgVdWC9JnciS3vw799psSkzNWEZ55hqn+KQ1kj/C9jauKmNrwNarcvkxHbW/OXC6mOTVTRndEtsqyUm34GHoAv8nAE7KjKXFi58D4yNVszWOWhksOgidjMVF1oW+pW/4I8lMK1ld6VeZkd3BELmE6tOrnaCEFtTTJa1X2LCcO3zdeR+UYHBs5wKmptQSA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(39860400002)(136003)(346002)(396003)(230922051799003)(186009)(1800799009)(451199024)(6512007)(6486002)(53546011)(71200400001)(6506007)(83380400001)(122000001)(86362001)(38070700005)(38100700002)(85182001)(36756003)(107886003)(2616005)(26005)(2906002)(316002)(7416002)(41300700001)(66446008)(64756008)(91956017)(54906003)(66946007)(66476007)(76116006)(478600001)(4326008)(8936002)(8676002)(5660300002)(110136005)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TjNHcjJNY1lIOTBUT0NMcTJEcTlCZlVvUmhpS3doMk1peHVOUkswU0dZeDF3?=
 =?utf-8?B?L2k1SjJ1aEU1RDhYSG5wUnM1ZWhEaVhWSzZ4RmlPTHNTZzNjZXpBdUpiS0tv?=
 =?utf-8?B?ZGh5ZzQ0enNFSW5QUmtrMit0NVE3QW5EY1c4UzlNOWJWcTRXSnQ2SUpVNzZD?=
 =?utf-8?B?MXJuelg2SXFxdWhPSHN4MjJaYjM3bjFIUldzc1Q0SW0xUi9udjZwUGZiSlZx?=
 =?utf-8?B?R0REeDhLSTNUOGVKa0hJUC81cWJNbXk1Z1IzeDBjSWRldUpoWmRPUXVRb1U1?=
 =?utf-8?B?aWZZYTlNemhpZklaQVFBaW9yMW1DLy9lSVRtK3hsVGc3Q09adEVXSTFZZ1Ji?=
 =?utf-8?B?elgxcS9hVTdwZ1NTSVlIS3V2WU1PcHE3SEorZ3Z6TU5TckRqNzF1S2lyTWlS?=
 =?utf-8?B?Ylc2NzdSbEVEU1I1MWwvTXpuRUZVTjJpYVRzM2VraEtLTjhUZG1sVEFxSDNh?=
 =?utf-8?B?cFArNW1SOWw0ZWxERU1WRUNKeTMzM0Vpb2plR1RQOE4ybWR4aTdacHpEUEEr?=
 =?utf-8?B?Sm9DOW5SRjR6OWxiZXZOcVNGbEFYdGVURzJ0V2R1dFIwekdtNXQ1ci9yMVBm?=
 =?utf-8?B?RWtwdHFRcXNSZVpVOCs3ZUZwYlo1VXVzTFNYM3BVb0VVd1VYSGN4M2dRYWxv?=
 =?utf-8?B?S2l3bE5VSEl1dXUyeHFhbStEbjkyVWV0dVNKVEVKVEM3ZDBhM004T28yVlU5?=
 =?utf-8?B?SzJRWmZad1NzeG04N3ZzMnIxQ05CWWNkdmZaZ0N0bWZndG9aYVI5b0M2djdN?=
 =?utf-8?B?VWhUVUZvTGRqMVhUSFVrTE1kOVhXNzNwOHI2b0lKdjlJZHd4am03Y21Jczdx?=
 =?utf-8?B?OXkxQ0JCMnlzZGt2NnpRZXl5dDRrclVFSFo2NzhDNnlWQ1YzT1pVQXhrZnls?=
 =?utf-8?B?TzRGRytZczd0c3hxQVlPYi9yRklxaWtGaUZZTUNvamhrU1ZJQ0lvQTRCOU10?=
 =?utf-8?B?ajlXMENGb1QrZ01IVVl6eFV4NzM0djZBdnFjdG1xVmlncmcwYzJKZG1oTTVs?=
 =?utf-8?B?Z1NNQW94eXV4UVI4N1pLdFo2WXJSTnRUVHhyY3dwQlhXaDVxWmNJeTJiczJq?=
 =?utf-8?B?WGwwYThSbVorS1ZLYXVTZGVQNzBleUVFWFkxcURSbWNyTktqcmlqb0lrVHQw?=
 =?utf-8?B?NUFqZ3pvZTVLRmlacmVDcHY1NjEybDI5NXJiajB2Ulk5aVd4bHhRd2ZVb1kx?=
 =?utf-8?B?NW9tdmNnT3MyTHRaa0wzUVRENENPemRhRDRvOGRSbEt6d0ZRczFqSlFYQWRu?=
 =?utf-8?B?bGJTaFlRcGNMQTdjVGNYOWpVVDNrWXc3aUdqYW51RXNMQ1pRYUtzRzJ5cE9Q?=
 =?utf-8?B?aFNQKzNjTXlEZXVPbldIdUZ6M3ZqZHd3UzZtWDZhdGl2bzJFQlFaSE9Wdzgy?=
 =?utf-8?B?OW1hWHlQMWJuMHFBd1NaUXhKUWhha3ZSVldGSmtJTWtYZ1IyMjloalc0SXQ5?=
 =?utf-8?B?ZHJYbDJiWmtDSUhTUWI4RStmd0ErckFjNVB1MjcvR3JtZFFuOVFmSVlPckR3?=
 =?utf-8?B?WmQwT1QrSjZWZnRsU3ZnRzBRaW9zWkgzNUtDb0ViK1RjRFMyVmlwRjFpQVph?=
 =?utf-8?B?a2Q3Y0ZST2tPVTlHK09rckVYQ2t0NHp5VjZRbkxoUlJnUlMzUU5wZGpzTThW?=
 =?utf-8?B?b3JVTllzMU1tcFVnM3lCdzdFUEdXenVwWlJENTRHOVVLUU1uM2NvM1VEcUw0?=
 =?utf-8?B?ZjhJMGNiblRwTTJUWm8rVklPaEluUzVpTERpZ1lQK2YvZkIxbGNzSk9FVTRu?=
 =?utf-8?B?em5KcHZPSnNFc245algwRUJFNytEZmJJMmM1VDJxTldOaHNVb0d6WGhkMkZm?=
 =?utf-8?B?Sm9QWmtXd0x1WkdrVUZZckUrS0FQUXRaVzRYTGZwcE1aak5zUFNCVkUzY0RS?=
 =?utf-8?B?aVliU3gxSkVHRlhEVU9FWXJPdjhic202YmdBbnFmQjhzeDZiektXSnplcWN5?=
 =?utf-8?B?ZStYR05oQTRzdEhJeThvQm1WekdYTi8xYlNSTTRVdVRUR3JNSGhpVTJXZ21Q?=
 =?utf-8?B?K2xteWZaNitxeWFtVCswOEROdHJWNGh6MlRPWjh2S2FKU2JyNGttYktJSFZ3?=
 =?utf-8?B?Y0hRY2pUQ3hGbkU4emxGZDFzTFV2Q1RYUTJuMXJKYUVvZlBNODlMRjBkaUdC?=
 =?utf-8?B?TWZzUWszU1NtTGdNMjFjcDkxUUpjaVpSblRXSkllU1BtaXN5OEpqRnFqeTJh?=
 =?utf-8?B?WGc9PQ==?=
Content-ID: <C8026F6A2E544B498F4A908591DE4B29@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd205d97-441a-4dbb-e0f4-08dbbe3aa395
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2023 02:45:26.4675 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hZUr0m7WC5bQrnIV6c6I/p2iudY/vRBFgZSIRZvvoU0zdzfR78CyNfj7phX1/IhCwbb0bGyxSmhV84NhVePyZnr2GqhYnrEUwoyq8FFiEEs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB8097
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_008_1825705706.158035776"
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
 =?utf-8?B?RWx2aXMgV2FuZyAo546L5YabKQ==?= <Elvis.Wang@mediatek.com>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?utf-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?= <Jason-ch.Chen@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?utf-8?B?Sm9obnNvbiBXYW5nICjnjovogZbpkasp?= <Johnson.Wang@mediatek.com>,
 =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_008_1825705706.158035776
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCk9uJiMzMjtNb24sJiMzMjsyMDIzLTA5LTI1JiMzMjthdCYjMzI7MTE6MjgmIzMyOysw
MjAwLCYjMzI7S3J6eXN6dG9mJiMzMjtLb3psb3dza2kmIzMyO3dyb3RlOg0KJmd0OyYjMzI7JiMz
MjsmIzMyOw0KJmd0OyYjMzI7RXh0ZXJuYWwmIzMyO2VtYWlsJiMzMjs6JiMzMjtQbGVhc2UmIzMy
O2RvJiMzMjtub3QmIzMyO2NsaWNrJiMzMjtsaW5rcyYjMzI7b3ImIzMyO29wZW4mIzMyO2F0dGFj
aG1lbnRzJiMzMjt1bnRpbA0KJmd0OyYjMzI7eW91JiMzMjtoYXZlJiMzMjt2ZXJpZmllZCYjMzI7
dGhlJiMzMjtzZW5kZXImIzMyO29yJiMzMjt0aGUmIzMyO2NvbnRlbnQuDQomZ3Q7JiMzMjsmIzMy
O09uJiMzMjsyNS8wOS8yMDIzJiMzMjsxMToxMSwmIzMyO0phc29uLUpIJiMzMjtMaW4mIzMyOygm
IzI2NTE5OyYjMzA1OTE7JiMzMTA3NzspJiMzMjt3cm90ZToNCiZndDsmIzMyOyZndDsmIzMyO09u
JiMzMjtNb24sJiMzMjsyMDIzLTA5LTI1JiMzMjthdCYjMzI7MDg6NDImIzMyOyswMjAwLCYjMzI7
S3J6eXN6dG9mJiMzMjtLb3psb3dza2kmIzMyO3dyb3RlOg0KJmd0OyYjMzI7Jmd0OyZndDsmIzMy
OyYjMzI7JiMzMjsNCiZndDsmIzMyOyZndDsmZ3Q7JiMzMjtFeHRlcm5hbCYjMzI7ZW1haWwmIzMy
OzomIzMyO1BsZWFzZSYjMzI7ZG8mIzMyO25vdCYjMzI7Y2xpY2smIzMyO2xpbmtzJiMzMjtvciYj
MzI7b3BlbiYjMzI7YXR0YWNobWVudHMNCiZndDsmIzMyO3VudGlsDQomZ3Q7JiMzMjsmZ3Q7Jmd0
OyYjMzI7eW91JiMzMjtoYXZlJiMzMjt2ZXJpZmllZCYjMzI7dGhlJiMzMjtzZW5kZXImIzMyO29y
JiMzMjt0aGUmIzMyO2NvbnRlbnQuDQomZ3Q7JiMzMjsmZ3Q7Jmd0OyYjMzI7JiMzMjtPbiYjMzI7
MjUvMDkvMjAyMyYjMzI7MDc6MDUsJiMzMjtKYXNvbi1KSCYjMzI7TGluJiMzMjsoJiMyNjUxOTsm
IzMwNTkxOyYjMzEwNzc7KSYjMzI7d3JvdGU6DQomZ3Q7JiMzMjsmZ3Q7Jmd0OyZndDsmIzMyO0hp
JiMzMjtLcnp5c3p0b2YsDQomZ3Q7JiMzMjsmZ3Q7Jmd0OyZndDsNCiZndDsmIzMyOyZndDsmZ3Q7
Jmd0OyYjMzI7VGhhbmtzJiMzMjtmb3ImIzMyO3RoZSYjMzI7cmV2aWV3cy4NCiZndDsmIzMyOyZn
dDsmZ3Q7Jmd0Ow0KJmd0OyYjMzI7Jmd0OyZndDsmZ3Q7JiMzMjtPbiYjMzI7U2F0LCYjMzI7MjAy
My0wOS0yMyYjMzI7YXQmIzMyOzIwOjAxJiMzMjsrMDIwMCwmIzMyO0tyenlzenRvZiYjMzI7S296
bG93c2tpJiMzMjt3cm90ZToNCiZndDsmIzMyOyZndDsmZ3Q7Jmd0OyZndDsmIzMyOyYjMzI7JiMz
MjsNCiZndDsmIzMyOyZndDsmZ3Q7Jmd0OyZndDsmIzMyO0V4dGVybmFsJiMzMjtlbWFpbCYjMzI7
OiYjMzI7UGxlYXNlJiMzMjtkbyYjMzI7bm90JiMzMjtjbGljayYjMzI7bGlua3MmIzMyO29yJiMz
MjtvcGVuJiMzMjthdHRhY2htZW50cw0KJmd0OyYjMzI7Jmd0OyZndDsmIzMyO3VudGlsDQomZ3Q7
JiMzMjsmZ3Q7Jmd0OyZndDsmZ3Q7JiMzMjt5b3UmIzMyO2hhdmUmIzMyO3ZlcmlmaWVkJiMzMjt0
aGUmIzMyO3NlbmRlciYjMzI7b3ImIzMyO3RoZSYjMzI7Y29udGVudC4NCiZndDsmIzMyOyZndDsm
Z3Q7Jmd0OyZndDsmIzMyOyYjMzI7T24mIzMyOzE4LzA5LzIwMjMmIzMyOzIxOjIxLCYjMzI7SmFz
b24tSkguTGluJiMzMjt3cm90ZToNCiZndDsmIzMyOyZndDsmZ3Q7Jmd0OyZndDsmZ3Q7JiMzMjtD
TURRX1NZTkNfVE9LRU5fU0VDVVJFX1RIUl9FT0YmIzMyO2lzJiMzMjt1c2VkJiMzMjthcyYjMzI7
c2VjdXJlJiMzMjtpcnEmIzMyO3RvJiMzMjtub3RpZnkNCiZndDsmIzMyOyZndDsmZ3Q7JiMzMjtD
TURRDQomZ3Q7JiMzMjsmZ3Q7Jmd0OyZndDsmZ3Q7Jmd0OyYjMzI7ZHJpdmVyJiMzMjtpbiYjMzI7
dGhlJiMzMjtub3JtYWwmIzMyO3dvcmxkJiMzMjt0aGF0JiMzMjtHQ0UmIzMyO3NlY3VyZSYjMzI7
dGhyZWFkJiMzMjtoYXMmIzMyO2NvbXBsZXRlZA0KJmd0OyYjMzI7YQ0KJmd0OyYjMzI7Jmd0OyZn
dDsmZ3Q7Jmd0OyYjMzI7dGFzaw0KJmd0OyYjMzI7Jmd0OyZndDsmZ3Q7Jmd0OyZndDsmIzMyO2lu
JiMzMjt0aGVlJiMzMjtzZWN1cmUmIzMyO3dvcmxkLg0KJmd0OyYjMzI7Jmd0OyZndDsmZ3Q7Jmd0
Ow0KJmd0OyYjMzI7Jmd0OyZndDsmZ3Q7Jmd0OyYjMzI7SG93JiMzMjtjYW4mIzMyOyNkZWZpbmUm
IzMyO2JlJiMzMjthZGRlZCYjMzI7YWZ0ZXImIzMyO2l0cyYjMzI7dXNhZ2UmIzYzOyYjMzI7RG9l
cyYjMzI7aXQmIzMyO2V2ZW4mIzMyO21ha2UmIzMyO2FueQ0KJmd0OyYjMzI7Jmd0OyZndDsmIzMy
O3NlbnNlDQomZ3Q7JiMzMjsmZ3Q7Jmd0OyZndDsmZ3Q7JiMzMjtvZg0KJmd0OyYjMzI7Jmd0OyZn
dDsmZ3Q7Jmd0OyYjMzI7YmVpbmcmIzMyO3NlcGFyYXRlJiMzMjtwYXRjaCYjNjM7DQomZ3Q7JiMz
MjsmZ3Q7Jmd0OyZndDsmZ3Q7DQomZ3Q7JiMzMjsmZ3Q7Jmd0OyZndDsNCiZndDsmIzMyOyZndDsm
Z3Q7Jmd0OyYjMzI7VGhpcyYjMzI7ZGVmaW5pdGlvbiYjMzI7aXMmIzMyO3VzZWQmIzMyO2luJiMz
Mjt0aGUmIzMyO210ODE5NS5kdHMmIzMyO2F0JiMzMjtbUEFUQ0gmIzMyOzE1LzE1XSYjMzI7YW5k
DQomZ3Q7JiMzMjt0aGUNCiZndDsmIzMyOyZndDsmZ3Q7JiMzMjtDTURRDQomZ3Q7JiMzMjsmZ3Q7
Jmd0Ow0KJmd0OyYjMzI7Jmd0OyZndDsmIzMyO05vLCYjMzI7dGhlJiMzMjtkZWZpbmUmIzMyO2lz
JiMzMjt1c2VkJiMzMjtpbiYjMzI7cHJldmlvdXMmIzMyO3BhdGNoLCYjMzI7d2hpY2gmIzMyO21l
YW5zJiMzMjt5b3VyDQomZ3Q7JiMzMjtwYXRjaHNldA0KJmd0OyYjMzI7Jmd0OyZndDsmIzMyO2lz
DQomZ3Q7JiMzMjsmZ3Q7Jmd0OyYjMzI7bm90JiMzMjtiaXNlY3RhYmxlJiMzMjthbmQmIzMyO25v
dCYjMzI7dGVzdGVkLg0KJmd0OyYjMzI7Jmd0OyZndDsNCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0
OyYjMzI7Jmd0OyYjMzI7RG8mIzMyO3lvdSYjMzI7bWVhbiYjMzI7dGhpcyYjMzI7cGF0Y2gmIzMy
O3Nob3VsZCYjMzI7YWRkJiMzMjtiZWZvcmUmIzMyO3BhdGNoJiMzMjsxJiM2MzsNCiZndDsmIzMy
OyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtUaGUmIzMy
O2V4YW1wbGUmIzMyO29mJiMzMjtkdHMmIzMyO2luJiMzMjtwYXRjaCYjMzI7MSYjMzI7aXMmIzMy
O3VzZWQmIzMyO3RoZSYjMzI7ZGVmaW5pdGlvbiYjMzI7b2YmIzMyO210ODE4OCwmIzMyO3NvDQom
Z3Q7JiMzMjtJDQomZ3Q7JiMzMjsmZ3Q7JiMzMjt0aGluayYjMzI7SSYjMzI7Y2FuJiMzMjthZGQm
IzMyO3RoaXMmIzMyO3BhdGNoJiMzMjt0byYjMzI7ZGVmaW5lJiMzMjt0aGUmIzMyO2djZSYjMzI7
ZXZlbnQmIzMyO2lkJiMzMjtmb3ImIzMyO210ODE5NQ0KJmd0OyYjMzI7YWZ0ZXINCiZndDsmIzMy
OyZndDsmIzMyO3BhdGNoJiMzMjsxLg0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7
JiMzMjtJJiMzMjt3aWxsJiMzMjtzd2FwJiMzMjt0aGUmIzMyO3BhdGNoJiMzMjsxJiMzMjthbmQm
IzMyO3RoZSYjMzI7cGF0Y2gmIzMyOzImIzMyO2luJiMzMjt0aGUmIzMyO25leHQmIzMyO3ZlcnNp
b24sJiMzMjtpZg0KJmd0OyYjMzI7dGhhdA0KJmd0OyYjMzI7Jmd0OyYjMzI7Y2FuJiMzMjttYWtl
JiMzMjtpdCYjMzI7bW9yZSYjMzI7YXBwcm9wcmlhdGUuDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1Jl
YWxseSwmIzMyO3Rlc3QmIzMyO3lvdXImIzMyO3BhdGNoZXMuJiMzMjtFYWNoJiMzMjtvZiYjMzI7
dGhlbSYjMzI7aW5kaXZpZHVhbGx5LiYjMzI7QXBwcm9wcmlhdGVuZXNzDQomZ3Q7JiMzMjtpcw0K
Jmd0OyYjMzI7b25lJiMzMjt0aGluZywmIzMyO2J1dCYjMzI7YnJva2VuJiMzMjtiaXNlY3RhYmls
aXR5JiMzMjtpcyYjMzI7YW4mIzMyO2Vycm9yLg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtBbnl3YXks
JiMzMjt0aGUmIzMyO3BhdGNoJiMzMjtpcyYjMzI7bG9naWNhbGx5JiMzMjtwYXJ0JiMzMjtvZiYj
MzI7YmluZGluZyYjMzI7YWRkaW5nJiMzMjt0aGlzLCYjMzI7c28mIzMyO2l0DQomZ3Q7JiMzMjtz
aG91bGQNCiZndDsmIzMyO2JlJiMzMjtzcXVhc2hlZC4mIzMyO0RvbiYjMzk7dCYjMzI7Y3JlYXRl
JiMzMjtzb21lJiMzMjt3ZWlyZCYjMzI7cGF0Y2gmIzMyO29yZGVyaW5nJiMzMjt3aGVyZSYjMzI7
ZXZlcnkNCiZndDsmIzMyO2RlZmluZQ0KJmd0OyYjMzI7b3ImIzMyO2V2ZXJ5JiMzMjtmdW5jdGlv
biYjMzI7aXMmIzMyO2luJiMzMjtpdHMmIzMyO293biYjMzI7cGF0Y2guJiMzMjtJJiMzMjtjb21t
ZW50ZWQmIzMyO2Fib3V0JiMzMjtpdCYjMzI7bXVsdGlwbGUNCiZndDsmIzMyO3RpbWVzJiMzMjtp
biYjMzI7dGhpcyYjMzI7cGF0Y2hzZXQuDQomZ3Q7JiMzMjsNCg0KT0ssJiMzMjtJJiMzOTtsbCYj
MzI7cmUtb3JkZXImIzMyO3RoZSYjMzI7ZGVmaW5pdGlvbiYjMzI7YmVmb3JlJiMzMjt0aGUmIzMy
O3BhdGNoJiMzMjt1c2luZyYjMzI7aXQmIzMyO29yJiMzMjtzcXVhc2gNCnRoZSYjMzI7ZGVmaW5p
dGlvbiYjMzI7dG8mIzMyO3RoZSYjMzI7cGF0Y2gmIzMyO3VzaW5nJiMzMjtpdC4NCg0KUmVnYXJk
cywNCkphc29uLUpILkxpbg0KDQomZ3Q7JiMzMjtCZXN0JiMzMjtyZWdhcmRzLA0KJmd0OyYjMzI7
S3J6eXN6dG9mDQomZ3Q7JiMzMjsNCg0KPC9wcmU+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHBy
ZT4qKioqKioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UgKioqKioqKioq
KioqKioqKioqKioNClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVz
c2FnZSAoaW5jbHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBw
cm9wcmlldGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9z
dXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXll
ZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5h
dGlvbiwgDQpkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0
aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJl
Y2lwaWVudChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4g
SWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBi
ZWxpZXZlIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxl
YXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMg
ZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNs
dWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNj
bG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFu
ayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_008_1825705706.158035776
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCAyMDIzLTA5LTI1IGF0IDExOjI4ICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiAgCSANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRl
ciBvciB0aGUgY29udGVudC4NCj4gIE9uIDI1LzA5LzIwMjMgMTE6MTEsIEphc29uLUpIIExpbiAo
5p6X552/56WlKSB3cm90ZToNCj4gPiBPbiBNb24sIDIwMjMtMDktMjUgYXQgMDg6NDIgKzAyMDAs
IEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+ID4+ICAgDQo+ID4+IEV4dGVybmFsIGVtYWls
IDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzDQo+IHVudGls
DQo+ID4+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+ID4+
ICBPbiAyNS8wOS8yMDIzIDA3OjA1LCBKYXNvbi1KSCBMaW4gKOael+edv+elpSkgd3JvdGU6DQo+
ID4+PiBIaSBLcnp5c3p0b2YsDQo+ID4+Pg0KPiA+Pj4gVGhhbmtzIGZvciB0aGUgcmV2aWV3cy4N
Cj4gPj4+DQo+ID4+PiBPbiBTYXQsIDIwMjMtMDktMjMgYXQgMjA6MDEgKzAyMDAsIEtyenlzenRv
ZiBLb3psb3dza2kgd3JvdGU6DQo+ID4+Pj4gICANCj4gPj4+PiBFeHRlcm5hbCBlbWFpbCA6IFBs
ZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cw0KPiA+PiB1bnRpbA0K
PiA+Pj4+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+ID4+
Pj4gIE9uIDE4LzA5LzIwMjMgMjE6MjEsIEphc29uLUpILkxpbiB3cm90ZToNCj4gPj4+Pj4gQ01E
UV9TWU5DX1RPS0VOX1NFQ1VSRV9USFJfRU9GIGlzIHVzZWQgYXMgc2VjdXJlIGlycSB0byBub3Rp
ZnkNCj4gPj4gQ01EUQ0KPiA+Pj4+PiBkcml2ZXIgaW4gdGhlIG5vcm1hbCB3b3JsZCB0aGF0IEdD
RSBzZWN1cmUgdGhyZWFkIGhhcyBjb21wbGV0ZWQNCj4gYQ0KPiA+Pj4+IHRhc2sNCj4gPj4+Pj4g
aW4gdGhlZSBzZWN1cmUgd29ybGQuDQo+ID4+Pj4NCj4gPj4+PiBIb3cgY2FuICNkZWZpbmUgYmUg
YWRkZWQgYWZ0ZXIgaXRzIHVzYWdlPyBEb2VzIGl0IGV2ZW4gbWFrZSBhbnkNCj4gPj4gc2Vuc2UN
Cj4gPj4+PiBvZg0KPiA+Pj4+IGJlaW5nIHNlcGFyYXRlIHBhdGNoPw0KPiA+Pj4+DQo+ID4+Pg0K
PiA+Pj4gVGhpcyBkZWZpbml0aW9uIGlzIHVzZWQgaW4gdGhlIG10ODE5NS5kdHMgYXQgW1BBVENI
IDE1LzE1XSBhbmQNCj4gdGhlDQo+ID4+IENNRFENCj4gPj4NCj4gPj4gTm8sIHRoZSBkZWZpbmUg
aXMgdXNlZCBpbiBwcmV2aW91cyBwYXRjaCwgd2hpY2ggbWVhbnMgeW91cg0KPiBwYXRjaHNldA0K
PiA+PiBpcw0KPiA+PiBub3QgYmlzZWN0YWJsZSBhbmQgbm90IHRlc3RlZC4NCj4gPj4NCj4gPiAN
Cj4gPiBEbyB5b3UgbWVhbiB0aGlzIHBhdGNoIHNob3VsZCBhZGQgYmVmb3JlIHBhdGNoIDE/DQo+
ID4gDQo+ID4gDQo+ID4gVGhlIGV4YW1wbGUgb2YgZHRzIGluIHBhdGNoIDEgaXMgdXNlZCB0aGUg
ZGVmaW5pdGlvbiBvZiBtdDgxODgsIHNvDQo+IEkNCj4gPiB0aGluayBJIGNhbiBhZGQgdGhpcyBw
YXRjaCB0byBkZWZpbmUgdGhlIGdjZSBldmVudCBpZCBmb3IgbXQ4MTk1DQo+IGFmdGVyDQo+ID4g
cGF0Y2ggMS4NCj4gPiANCj4gPiBJIHdpbGwgc3dhcCB0aGUgcGF0Y2ggMSBhbmQgdGhlIHBhdGNo
IDIgaW4gdGhlIG5leHQgdmVyc2lvbiwgaWYNCj4gdGhhdA0KPiA+IGNhbiBtYWtlIGl0IG1vcmUg
YXBwcm9wcmlhdGUuDQo+IA0KPiBSZWFsbHksIHRlc3QgeW91ciBwYXRjaGVzLiBFYWNoIG9mIHRo
ZW0gaW5kaXZpZHVhbGx5LiBBcHByb3ByaWF0ZW5lc3MNCj4gaXMNCj4gb25lIHRoaW5nLCBidXQg
YnJva2VuIGJpc2VjdGFiaWxpdHkgaXMgYW4gZXJyb3IuDQo+IA0KPiBBbnl3YXksIHRoZSBwYXRj
aCBpcyBsb2dpY2FsbHkgcGFydCBvZiBiaW5kaW5nIGFkZGluZyB0aGlzLCBzbyBpdA0KPiBzaG91
bGQNCj4gYmUgc3F1YXNoZWQuIERvbid0IGNyZWF0ZSBzb21lIHdlaXJkIHBhdGNoIG9yZGVyaW5n
IHdoZXJlIGV2ZXJ5DQo+IGRlZmluZQ0KPiBvciBldmVyeSBmdW5jdGlvbiBpcyBpbiBpdHMgb3du
IHBhdGNoLiBJIGNvbW1lbnRlZCBhYm91dCBpdCBtdWx0aXBsZQ0KPiB0aW1lcyBpbiB0aGlzIHBh
dGNoc2V0Lg0KPiANCg0KT0ssIEknbGwgcmUtb3JkZXIgdGhlIGRlZmluaXRpb24gYmVmb3JlIHRo
ZSBwYXRjaCB1c2luZyBpdCBvciBzcXVhc2gNCnRoZSBkZWZpbml0aW9uIHRvIHRoZSBwYXRjaCB1
c2luZyBpdC4NCg0KUmVnYXJkcywNCkphc29uLUpILkxpbg0KDQo+IEJlc3QgcmVnYXJkcywNCj4g
S3J6eXN6dG9mDQo+IA0K

--__=_Part_Boundary_008_1825705706.158035776--

