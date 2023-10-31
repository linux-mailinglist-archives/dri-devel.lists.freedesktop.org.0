Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB28C7DC766
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 08:37:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60CB110E40D;
	Tue, 31 Oct 2023 07:37:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B32F010E40D
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 07:37:51 +0000 (UTC)
X-UUID: 61bbc73e77c011ee8051498923ad61e6-20231031
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=zvmMWaSrKW0yDglwrAYyxUuWfq1lM5sHilF7nll9ESc=; 
 b=qNoigGAHJayFHxQZzB2uiw1PGVBNr40uQIrKDvuOeO4nWJubZ7RXZgY7jX4rNuueQOb98cxTJSJBZ59mQkl9qrzPCqGnOyaG80z3FCn3cqlZrCRiVal0OwKQXYpeBXz8Ya9Q6LlaTI9XEHNFlkMUHWszF5tJCuUXQBxR2TTeU2s=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33, REQID:8b818d49-898f-4fc8-8344-080b70cbfc52, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:364b77b, CLOUDID:764d1872-1bd3-4f48-b671-ada88705968c,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 61bbc73e77c011ee8051498923ad61e6-20231031
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com (envelope-from <moudy.ho@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 480232300; Tue, 31 Oct 2023 15:37:45 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 31 Oct 2023 15:37:43 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Tue, 31 Oct 2023 15:37:43 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=blVPat47/X/nx32Eugc88v6otLyy9FTEXykMLjtL2EM2OBnmtXZZczAfZZYHHcDTNXOoSGe/extQSrO6Di4Th4RDkuhP1rTwBFCN/qz5/TwKl1Syb1EGqabIOqHTN7wvE/CmFq9wUEQkLL1a4RLU8zAxXKL8ngX7IvqqLnJUTUo09Y7YpMvKHCEa2rvSLVsvxHlp1V+HrUgRRA+kw9e9GGH3FhLrFppPyx5MK6EEUhH6pssOchAkyMs6UTuM7h35lUiesMQ2zxj62QywSoJH/qKbbRjomKYcOY5TqtRxdNFNTruvj07D1NRigG+MfLc18xguJb47g4fdDt0dHq04BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zvmMWaSrKW0yDglwrAYyxUuWfq1lM5sHilF7nll9ESc=;
 b=MKdb5QQ+EcCB2O6sh5fkMBMDAh/E855Hw50/WRnICnRCMCa9C16aKY4fl+pZQkTiUBQvPTquI5AYLdjPVlbFy2AJ9yQmYyr60I169NFDdNV1qmBh4qM1T+ph4u7iRdLga92wnYJz04KKYKRLnxN+FtXg8uYmaTnfiqmPlY8/7z8oC1zi1a6wPnlYy/MomsgjqrSns97GCbHZ254ZGDo8ArWuhilMZoMuse60Ty4rAEKb7jQIC3X3b6r38luH4REOpp76czz2duxd/vVkbSVKK4dlW7Yv22GWDovorfpN4VDglzfayyc1WkvFWFhzvTwamU+5lHC54CLZUJCudF7obQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zvmMWaSrKW0yDglwrAYyxUuWfq1lM5sHilF7nll9ESc=;
 b=bf/QI/LLFL5OlmX+5q6Nc2hMIY7VvDomDeBQyr3ggdaf616DVC1Ouhi6l9phYXfcu+W0pdHZOylAD3Zk//JguNABD1LUInLFURyHBiEK1VtV3DkWENBb3mWY+llcfS4wtN+XkYho65NzkZGdW2r//qFgvJIP2rnSAneeFLXmO2M=
Received: from TY0PR03MB6356.apcprd03.prod.outlook.com (2603:1096:400:14c::9)
 by KL1PR03MB5834.apcprd03.prod.outlook.com (2603:1096:820:93::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29; Tue, 31 Oct
 2023 07:37:41 +0000
Received: from TY0PR03MB6356.apcprd03.prod.outlook.com
 ([fe80::9e24:980f:fc1d:d4ba]) by TY0PR03MB6356.apcprd03.prod.outlook.com
 ([fe80::9e24:980f:fc1d:d4ba%4]) with mapi id 15.20.6933.029; Tue, 31 Oct 2023
 07:37:41 +0000
From: =?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "mripard@kernel.org" <mripard@kernel.org>, "mchehab@kernel.org"
 <mchehab@kernel.org>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, "hverkuil-cisco@xs4all.nl"
 <hverkuil-cisco@xs4all.nl>, "airlied@gmail.com" <airlied@gmail.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v8 16/16] dt-bindings: display: mediatek: padding: add
 compatible for MT8195
Thread-Topic: [PATCH v8 16/16] dt-bindings: display: mediatek: padding: add
 compatible for MT8195
Thread-Index: AQHaCxf9Uo9mK2d1NEuS6fN2fs5uo7BjhBAA
Date: Tue, 31 Oct 2023 07:37:41 +0000
Message-ID: <33b064c52fa800679bb4b949d827be439ce11dba.camel@mediatek.com>
References: <20231030100022.9262-1-moudy.ho@mediatek.com>
 <20231030100022.9262-17-moudy.ho@mediatek.com>
In-Reply-To: <20231030100022.9262-17-moudy.ho@mediatek.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY0PR03MB6356:EE_|KL1PR03MB5834:EE_
x-ms-office365-filtering-correlation-id: 143a300d-6e97-4ee0-9228-08dbd9e4437d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gQcn/VtZlJFOybt1n/DvAzJAVJHw+vLoymV9fxT+5LkaCkf0C8MxxUp60g/YGhfY0D+lsuW8K3wcH6fI0E4xWolVO9gzV79oUGhwTqLmPWgR49JQ0R3LRgYM3iQ2PD3JiFFKTR/VIJsvIkLNVookVMUFywJRgqNP65/h5hhwpssqsnURY/9x1lwiZvynvXLL7xHob1oNSNKM80xIY1V6fEH7EAVeyEFaYjfXC71zDCc9QApgt2B9G65+8H2lHpEQ6BFSacdZ1bfPC1H0lcKRob/qCW+7iTTzTyvIRMkv1bkgf7AA6dV3zsXweUukbEpKw2t4cFeMfLvQFTgbd7TqDWwYUs2SeCYHd20gi5P8lPsaaEV48wQxaJPAH0L/xsY0AsbIsy4qCRF8pcDz+QpzNCTH/RY5swmCrvX/bIItQFqwjir+ve8eekwjKOxLFVUC/DV87wxewJLAKvsru+eSdnrfKEPZocmPh44diKSjQocDmgmCVLww2d9Q/UqZ5OZqln53hWXZ4aiYUfutwZb7cg9Q7H86pUeKIgHa/LGcpAhqBiDVwMW4F1tX7Kl9CJGu6uvyDkp3qPIwS6nfmE/hXpMrxp3iAfhSz8Syyp5gI582unBnJiiYnRNm+o2FJ8VqqC3mcm4LfPyJTAiElqu2uUo955pjxe37YasW5pDFOiEZ5CB1H4rOM7Z1zsLpGjYNhv7KcWHKA+3qK64gVamLGw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY0PR03MB6356.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(346002)(39860400002)(376002)(136003)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(36756003)(85182001)(38070700009)(64756008)(54906003)(316002)(66946007)(76116006)(110136005)(66446008)(66476007)(66556008)(921008)(38100700002)(86362001)(122000001)(6486002)(83380400001)(478600001)(6506007)(2616005)(71200400001)(6512007)(26005)(8936002)(4001150100001)(2906002)(41300700001)(7416002)(4326008)(5660300002)(8676002)(99106002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WmMrRHU2dStyUkpYaGZWazZQN0xpQUhzcU0zUDJOQ3pJcE1HdXNMdFBRR1Ba?=
 =?utf-8?B?a3g2WTI4NjNxUG50UDNtREJXUmJ5QTRGRkphZ3NobFFZZE13MlRBb2gvdTZC?=
 =?utf-8?B?MHFHVGJFVzB1MExkbndiWWZ2dlVjK3diamZkZWlCcTZFa2t3Tjd0L3lKMzdx?=
 =?utf-8?B?dlNPVVNSRUFGeTZ4UzUyRXlFbGx1eFRPZ0dLL0swa0prb0lYcTE1bGVDODFs?=
 =?utf-8?B?d3BvbUdZRXJzbGxYbDJiTU1xejhLQitqOVMyYXJCZmk0QUg3ZDBmQ0ZNaFlP?=
 =?utf-8?B?THh0SmpKM0RUcE1Wc1FLZEtJRmhRSUUwZTFNZ2Z2amwrd0t5bitxRjk2Z25J?=
 =?utf-8?B?czhRK1N4WUdOejFVYmFiRDYyeCt0cExqZnhEZGRWaFlVVG01TVh1UGxnQjUv?=
 =?utf-8?B?N1RBS0NoMVNOY1ZObVdCZEl4d0s4dWFYbWVZVVB2QmhnNXo3eVBIZW1zY1lk?=
 =?utf-8?B?aUV6WFNKY3BjVHY1U1ZIaHcvdXdVZHUxd0Fsc056dzJrRENXSkx0d3czS0lP?=
 =?utf-8?B?YURXR1hEclA0Y0pqZ1cvcmxJdkZFa0JwTER3SU1FZVZMTG5oV211QkNjdFVs?=
 =?utf-8?B?OENUbXBvUHNuTmxydWdCZURWUjdpQm5PZUYwVlJJU1haYzVrSm5ZbkI3S1Yz?=
 =?utf-8?B?ay95djJsOG54UUNzbkcyaVFRUnZ0ZFZObUpHenZwdHJGcFZEQmhuS3YrQ0pZ?=
 =?utf-8?B?dElFM2hiazNyd3MzK3R4eWgwb1U2MzlpcUVKYkZaYUlzajVRNnhpb2tLYTVS?=
 =?utf-8?B?QVBLcnN3VklsQ2szWEZ0djlXak1JMU9sZk9RWE9CVm1yNGpOcEdKVTZacDFn?=
 =?utf-8?B?NUtSTll4NkpaL2YvZm1LQ3dwb29qSE10eDQ0c1NCYmRjWkRtUW55ZXRBa2dE?=
 =?utf-8?B?STcrMGtON1lPbUgxWlRqYXRFRmFRMThDbjFHQkl1VFoxbDZZdmxJb1RQdVZR?=
 =?utf-8?B?SGM0RzVXdC9OcjJoN2cwdGlLU3ZQYkwvR09oNURhN2dXa3FOalZXdk4rbVly?=
 =?utf-8?B?M1ViN1pMbytxL2taWEFpamxkeEhpYWI0cmY4Y0RkOFlrcmxWczFERGRTQTBO?=
 =?utf-8?B?ZVhuV1FpRjBzdXdFTzJqUlAvUCsxdUg3ME9zT29uWk5qMTc0Qk9IQ3o5WWha?=
 =?utf-8?B?M0dXYWYwVHM2VitpeHFFOWJsVTFnU2k3V1VKTWVKWU5YeWpEMXdWL2UyQXJn?=
 =?utf-8?B?RzJlRG1EZUlVcXF3SGx3eHhRMTczbHVabzFER1lYcFgvZEM1WHVvVGlYb05r?=
 =?utf-8?B?WDJuMkhLYUpFY0N6S0xSb0FRVlRrS2N0d1ZxTVUySXpuUGFvTmF5VHVBclVr?=
 =?utf-8?B?WDZEZGIxMEhQeHBmRUVIUFlCZHhZTUEzRW1ObG5YZG5sTzhnSkxNU2IzSnNm?=
 =?utf-8?B?M0xOcWNmQVlJNmpPTHJKdVJHOU14YmFBdHZNRWtBRmhlZVBIZEp6eXplZGxO?=
 =?utf-8?B?NXhJSCt3ZnBjVnVRd1lLcWFVUWZpTUxTMzUrZFF1bjdXQmlBM0dvdFdKUldM?=
 =?utf-8?B?anRZUU5kcFVwdWMrNmhiNzhQdWRKRlV3NGRsUWQ2ZE1sTGplVC9kSlVlRkI0?=
 =?utf-8?B?SWdkQW5kRlN6M3RIVGNncWxSNDZVbW9PNThwWG8raWFQLzg0Q1dJWjh5Z3J4?=
 =?utf-8?B?MFdWemdPMnNKWEJPdmZucUlHYUNFNTlLWHV0RjBJeUE4WjdFOGZTdTE5SWxv?=
 =?utf-8?B?bVNXdW9sNSs2MERjUnhhTzVST1pYU245Mk1GeEY2M3pid25zdHpwdmF6dUFl?=
 =?utf-8?B?N25FQWRyKysvYVBRZ25TNCtHZm9nZ2xTN3loYU5IbStnUE8vOWZPbGw2VXRj?=
 =?utf-8?B?djVBV2Y2YWhzSWJMQ2hqQ0lJL2NBU013MU9XTTh3NlV6VFFqclo4Q05oaWty?=
 =?utf-8?B?WUtZVlhWUHFzbHVYRjJxMlZGQkdlZWUxQk5QUkQ0ZXZDcjBFUWJUWkRxY0po?=
 =?utf-8?B?OEVuSGQ2a1JDYUJQRWNINEhoV2RiaEQydlczMEgxdDBjRjRod0dSbFVoeU5E?=
 =?utf-8?B?RHBKN3VwUE5sYmxFUWpVdFZmTHUyeWVpRWY0cGEzTkRMNm5tcGRCYTErMUdr?=
 =?utf-8?B?eVJlSHFRTlk2a0hqSDVvdTBka1pqZ0VNRVJNS1pEUWxuam1BZzNXelE4QzR1?=
 =?utf-8?B?N3FCL1N6V0hjNTduUjhMS1ZKWmEwaEJuWVd4czJTRS9PS2dXMmt2aVJaMlRx?=
 =?utf-8?B?eUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F8B9CA762A04404A98027395757A690E@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY0PR03MB6356.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 143a300d-6e97-4ee0-9228-08dbd9e4437d
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2023 07:37:41.0518 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mFQxlww/BlT5tDng4BzXpbOuUNSFCCa1/BdpWKttk3xrHPXjiNTjadXCKP/NEjRCmtpxR67FToiWIa82OGWTCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB5834
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--11.000000-8.000000
X-TMASE-MatchedRID: zdfKSpJbRLjUL3YCMmnG4t7SWiiWSV/1jLOy13Cgb4+qvcIF1TcLYNyi
 JF4Y8A5b7wG10hKtUfp4xIuyG0zHEJDCbn5v5k09bBu6+EIezdy3Tv9y50YCeyDbJV2PcsBEEwa
 0+RTIVt0hJ/ufappeEpGTpe1iiCJq0u+wqOGzSV1WdFebWIc3VsRB0bsfrpPIfiAqrjYtFiTl1l
 hxtQySTAAw2ynIabrFiUKT21BMaFxvNKkODQrPIX7cGd19dSFd
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--11.000000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 506AA7A2CB031C90D5E830A16A567F93E7FC0C8D8DEECCFAC9D5E921654499382000:8
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIzLTEwLTMwIGF0IDE4OjAwICswODAwLCBNb3VkeSBIbyB3cm90ZToNCj4gQWRk
IGEgY29tcGF0aWJsZSBzdHJpbmcgZm9yIHRoZSBQQURESU5HIGJsb2NrIGluIE1lZGlhVGVrIE1U
ODE5NSB0aGF0DQo+IGlzIGNvbnRyb2xsZWQgYnkgTURQMy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IE1vdWR5IEhvIDxtb3VkeS5ob0BtZWRpYXRlay5jb20+DQo+IC0tLQ0KPiAgLi4uL2JpbmRpbmdz
L2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWsscGFkZGluZy55YW1sICAgICAgICAgICB8IDQNCj4g
KysrLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0K
PiANCj4gZGlmZiAtLWdpdA0KPiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLHBhZGRpbmcNCj4gLnlhbWwNCj4gYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxwYWRkaW5n
DQo+IC55YW1sDQo+IGluZGV4IGRiMjQ4MDFlYmM0OC4uMTk4NThkODI2ODA4IDEwMDY0NA0KPiAt
LS0NCj4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRl
ay9tZWRpYXRlayxwYWRkaW5nDQo+IC55YW1sDQo+ICsrKw0KPiBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLHBhZGRpbmcNCj4gLnlh
bWwNCj4gQEAgLTIwLDcgKzIwLDkgQEAgZGVzY3JpcHRpb246DQo+ICANCj4gIHByb3BlcnRpZXM6
DQo+ICAgIGNvbXBhdGlibGU6DQo+IC0gICAgY29uc3Q6IG1lZGlhdGVrLG10ODE4OC1wYWRkaW5n
DQo+ICsgICAgZW51bToNCj4gKyAgICAgIC0gbWVkaWF0ZWssbXQ4MTg4LXBhZGRpbmcNCg0KVGhl
IGNvbXBhdGlibGUgbmFtZSBvZiB0aGUgbXQ4MTg4IGRpc3BsYXkgcGFkZGluZywgb24gd2hpY2gg
dGhpcyBwYXRjaA0KZGVwZW5kcywgaGFzIGJlZW4gY2hhbmdlZCBpbiB2MTEuIFBsZWFzZSBkaXNy
ZWdhcmQgdGhlIHR5cG8gaGVyZS4gaXQNCndpbGwgYmUgdXBkYXRlZCBpbiB0aGUgbmV4dCB2ZXJz
aW9uIGFzIHNvb24gYXMgcG9zc2libGUuDQoNClRoYW5rcywNCk1vdWR5DQoNCj4gKyAgICAgIC0g
bWVkaWF0ZWssbXQ4MTk1LW1kcDMtcGFkZGluZw0KPiAgDQo+ICAgIHJlZzoNCj4gICAgICBtYXhJ
dGVtczogMQ0K
