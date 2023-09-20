Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD407A7280
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 08:06:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39E9D10E12E;
	Wed, 20 Sep 2023 06:06:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04B7610E0FC
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 06:06:17 +0000 (UTC)
X-UUID: cd3d4998577b11ee8051498923ad61e6-20230920
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=WrQCLfuAeCW2/RGCLyhnaRkUsDB71OzG4Xl3Z7rqPok=; 
 b=aiUqT4qD6pi6ajtw3ZAgCOBBbziNtDJwfmXWVxOYTPYDFGelgkXyxFj2AHhnT5VA7uy1o/7aOuL1SVy7t/RHRXvB6YrLmGiIliURtlWAvdON2QdBCs2AM9eEZ7+dG3aXEuv13K3v7A/aMRtmL0ZlGiuNO4+23rU84++ERYxbhu4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:c9c62edd-256a-46c4-8da7-358bac3777dd, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5f78ec9, CLOUDID:5ffd3cc3-1e57-4345-9d31-31ad9818b39f,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: cd3d4998577b11ee8051498923ad61e6-20230920
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1340373197; Wed, 20 Sep 2023 14:06:13 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 20 Sep 2023 14:06:11 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Wed, 20 Sep 2023 14:06:11 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BaGt2YsOCjtkE+wd7FopTWTJ9vh1ucdwqjQSsHCcmXvnVc8mlmOKVj38lzN6JInfmiiqPjLcVA80jZthmee0NuJdCDU8x09oWoHXVFVe+/0PlEkVUuweHkjlGN7UrzeezC+TK1vGdDEqta4T0vKUSYf+kdjP23g408nCaKnAyNdWjoAAoNW9iGB6lNgG9WJKgiuFLq90CakdA+3GzfUkS3x2P0pYYjwJ7fC1yYEY64ov0coE0kjWWPRrX+7tUq2HjgRDfSw/ZlxM7QGDjXkViBLn3eNkQc1X6e0xTAgjJxLP5T1MHR9Z51Y6SK4x0fF2DIHNhx3h2ieZ+ChSq5imfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=25fqdOIQDtdF2xvO7u8SLHIQsCbRtX+ntWSZBTIqvvY=;
 b=HeHWrwvKyaXUPyuLPn+7HBgzC+6Gr2Yy4rLV/690vOvDytpCzKMxeotJpnkS4Odi6fy/KEa66o9j4xkZzQru31whQt6Op3HdJ2/sP8GR5ooIhLBzGkhq6hh7rYmlANh+Ms17dEdOwUZywRZbNlDv46Y+LJfQs6ZD+Sp4dv5mMIVgD4sVPCbIFKUezNR0yufmDsExN2IaSzHU6EsWOA4p1soby9rn/w7KO8pyDmBjppFBgh+7fi7umed7TI2lnHp/rCsj6ahAyC/sy+iFVKUAYBR9A6Px9P1uU/kPLXf3hKfyT4mNkssYEScKV7PQ3URcoYLfrwokh6wkHYELXWuppw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=25fqdOIQDtdF2xvO7u8SLHIQsCbRtX+ntWSZBTIqvvY=;
 b=Dt0McfQ80zvGjTzpRF41rE6aJz/m3vMtOmnf4QSZs0whtxhIQ86hurBxSM1G9pc7m2G+hWtE5ndAD5/gyIIo6xq04GtCS0UQy9WIZSaixWWDP1TdTz6t0D4Eeg8aUTrte5VwnRRLu+H/2lXeDCl9J776pCynsV+7+iquPUFoG7I=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KL1PR03MB7598.apcprd03.prod.outlook.com (2603:1096:820:e0::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Wed, 20 Sep
 2023 06:05:31 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9c2c:c08a:212f:e984]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9c2c:c08a:212f:e984%6]) with mapi id 15.20.6792.026; Wed, 20 Sep 2023
 06:05:31 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [RESEND PATCH v6 02/20] dt-bindings: display: mediatek: mdp-rdma:
 Add compatible for MT8188
Thread-Topic: [RESEND PATCH v6 02/20] dt-bindings: display: mediatek:
 mdp-rdma: Add compatible for MT8188
Thread-Index: AQHZ5IOsiookTJjrakCaCjdgbjcM/7AjR+MA
Date: Wed, 20 Sep 2023 06:05:31 +0000
Message-ID: <a901611a3c3f7df4401cdfbd1373ffb76ecf833e.camel@mediatek.com>
References: <20230911074233.31556-1-shawn.sung@mediatek.com>
 <20230911074233.31556-3-shawn.sung@mediatek.com>
In-Reply-To: <20230911074233.31556-3-shawn.sung@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KL1PR03MB7598:EE_
x-ms-office365-filtering-correlation-id: 6451ef95-8e31-4b1d-0a35-08dbb99f98af
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ShKe6DTpVFHVRf3pbZymyDPBSnuQncTj6Z3oGlQhr9GDZhZ04HEnv/PsHLkPZquH4OLSaYRShnKHkXu7HH8Pw10hSv3lvRqsy1KamTsBJBT8G06D2j4kvwdtiM+GQvop+5CHA4f+GIN7vMeDatF6YZWd/x0g7JoZJIHWDpbZiZSQZ3259qj7CiJI1VL/XL4W3dbk2+B8q1TWcBhDYbfNfQBmraA+gmBLnXmNkqig8lsxKM1QpuE4NZL1Ow2edzEHVQId6Myr6ELWGmH2v4GFA9B/sTM9WeoUyD2il1ygrH56LggS/85LOafehkP5aABJy3TbpxYY2KdBKXC9YI+ASZwTBB1R+le654ZbZk+WN1i1mB4IpGqp4t8QvQwCgLlZ1zD56ACNLuGDzABpS/wwBW3PhDWN1e/Lc1/1sVkTsk+T91ocvF+jAotrlmV0br1EYHYGaYLxUTIjkDnkR1C9UWCt56LJsKDGP19xmq4hLsfJ7AUbT3fPKuaZLMOmawqzPYMz5kWDzzyyiFtlXwoGlXuvZ2zW9DWKNvZXSOsvrEDQTf99/J7cm6efHikdj9kITzo41sHWLRVEauSEHlu9HbOm48TfMG9Wtt0bO0f6as0s2PBAzvO2WzYo2Ji7rVM05VdgIVars8WI8DUu6Jt43AcggqiwrZkpzf99woPe0Mk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(136003)(346002)(396003)(376002)(1800799009)(186009)(451199024)(2616005)(83380400001)(4326008)(5660300002)(8676002)(8936002)(6506007)(6486002)(6512007)(26005)(478600001)(71200400001)(122000001)(66476007)(316002)(66946007)(76116006)(110136005)(54906003)(64756008)(66556008)(66446008)(41300700001)(7416002)(86362001)(36756003)(85182001)(2906002)(38100700002)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MG1PdkMyQzJxcldnMHpiSm95ci9NTGcxRk5UbWpzZEk0c1lmUkloZkdpM1ZN?=
 =?utf-8?B?bTVBclI3ZU14L1RRRkNhNm1KeWNvSmZYT0RGSXEzS0tZb1lIbDVvR3VwZnFR?=
 =?utf-8?B?OEN6M1dWM3Brb2NyZjlCZER0dDFMRzhZelF2d0psVDE5MC9qYk9pYysxek05?=
 =?utf-8?B?NkZLZDZEbDd0QXk2MEl5ZzNtMDRJekY1VEtTUUUrZzQwR0crekhyY2tMTlQz?=
 =?utf-8?B?U0doU2YwNERMMUtoOVZwdEVkZzhxSEllSWh2TFRyZEI0RTlYdFZBdTBraGtF?=
 =?utf-8?B?bytEYzNvdFdPNW5KRUtrekJKbkZlR3pEWVpJU3FLQVloaUZDL1ZIS3JpZUJH?=
 =?utf-8?B?dG51ZHFhb3lJVFZBKy82QWR3Nk05NnUwaTFpcElqRkZWRHVjMkdOQVRBSVgx?=
 =?utf-8?B?TE1BZTVXck1jWmsydjhzZy9KZXpCN0NZU0lnTWNOTlF2aVVic2tQQm1qalZP?=
 =?utf-8?B?enZRWndsaG4xWnF2N0czbjhBUEgxTkVseFF6amZMM01hbW8vZGVjUHN0OG8x?=
 =?utf-8?B?SldtTTVYMXI0ditDR25GWVJrdjNsa3JNbTBQMWU1ak1Dd25wNndRNktHSi91?=
 =?utf-8?B?WVZ6NUJaYU5VTEYyV1BsdmNEbWs0WXF5TkZnYnB6SHFLZXkzL2RpaWxwTTd4?=
 =?utf-8?B?MEJKNUt6dk15S1hIcDNRVy9DWHBSaTEzVjR5S2Q3dThpUFpTL0tRbmNBNHZG?=
 =?utf-8?B?OCtYMmMrMFlpMWpUYmsvS0RxYnJueGVNMnR6U1o3TjZoQ2doMUw4K0dzWkdy?=
 =?utf-8?B?QllacVFUSWNzc0htNTBzQy8vanlUd2NRazhzTnQ3YlJYdXZMSG1vQzhrOEMz?=
 =?utf-8?B?aHRwanlKd2pSVDd0c1ErdTIvWFhPZjZEUitSek5qZldCb0lSeWcvL2hESXJZ?=
 =?utf-8?B?RUlodDFYaG5MeDQwN2ZkU05ObmIvaThjYkN6azQrZWg0TW5lZTFQUzEybkda?=
 =?utf-8?B?eVFnY0tLNXRZZ3dQckN6Y3VjS2t1bzhuWW9hTThreDhKVW5oaTdrdHliYmdR?=
 =?utf-8?B?VTlvRHlDRG5OVE9RZkJyS3hDajFLdlZoWWMwZEd1eFJOc2lvNkxjTSszTyt4?=
 =?utf-8?B?SFB5Z3l5SGhPYXV2Zk1yaXJIdXk2ODdCcFNmdjJMOHJ1amJNRzZpK2pNbmlM?=
 =?utf-8?B?cVpUeUpCUlN1R04zcnY0eTlrREhSb0xXU0RaY1l2czFNRnJNWExOMkVzRE9u?=
 =?utf-8?B?QzVoQmZsaDNKN1MxdmdWSFFBZWd5WjdraFZlRDlvajk3RzVPZG9jQzBWRU1q?=
 =?utf-8?B?aEh0aFgvbDAyRzBsSXhSSVNOZVZJL3VIeWVLWVMvUlZVRFVFS3RUbWZwZENz?=
 =?utf-8?B?U0xtYWk2YktLS1RQMGlxTHE1QWE3V1E5cEVTMG12UTV3UG42dHJyMkQxZko4?=
 =?utf-8?B?T1pYOWpWNlBFdDRpc2JFdDZTeW00VDVZN2k2SFVDYm55OGhVRFJHdjZqUGFt?=
 =?utf-8?B?ZGtTend6TWZWLzBrRE1QVks0SVpTMnQrRXhFTVhXUUpaaEQrSWNFcmwwdUo3?=
 =?utf-8?B?Z0tjSS82NncrUU1xekY5Um12eXBvR0V4R0lxeVpNQk1wbHF1TkMzaHhUWFp1?=
 =?utf-8?B?QVIyN3ZqYW9EK3RoTS9hdzZTWDNSU3FXOGpDMVAxVFFqdU5NK1VRZWdQQUJY?=
 =?utf-8?B?RGxLQ2dBOWYxOS8xN3hZL1Z0VUZab3hoYXptNVFBVW5POFB3Nk1BSFlqRy93?=
 =?utf-8?B?SHlxcDY1a3pGWHpUYU9Lb0NBL3p4VS9PeHQyS0lPV0d1UWh5NXU3QjdUditx?=
 =?utf-8?B?SThEaDN6MXU2UEJMSDNEZEJ4eExRbjlXS3pxQ3VRV2dZYld4aUc3SmN3amJ2?=
 =?utf-8?B?UFk4YWJzZU9kMEdsLzFpaDNWeU9lVUZEZHMvaEVJVHoyNDJRQ21mWlFyajY1?=
 =?utf-8?B?djBXcEhaclFUUlpBL3E3K2FKVzlLSWl6d3VvQ0JqazY1TmEwa0J4Y2hPSHpk?=
 =?utf-8?B?T0dLYXJHQ1dJTk1xZVc3dndiQ3dteHNmdGEwazJSTEhiS2FPNDZSUEZzYTJW?=
 =?utf-8?B?VldlOEs5bS9TdGVPMUd4bnNUM2JnK1o4NzhtRzBQRWdwU0JpZlI1eHpCRnZB?=
 =?utf-8?B?ODZQc1Jqdzl5QVJNZTBRNmM2SEFXTlNNTTBERmhRekxqNmpQVjJ1MEtiV04y?=
 =?utf-8?Q?1qiZOV2YPkCu+ES8z0BA9d2el?=
Content-ID: <6280A5389882C049B810F2737BE7A6B8@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6451ef95-8e31-4b1d-0a35-08dbb99f98af
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2023 06:05:31.5088 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 43yUQ2qMu2qdL8NQhRUvDpFLmCr6E9C5TKaffhh9gA/I98tbhebRJDXq/EhP65ioXJRNjHvO8FHKUODxkpMAtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7598
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_008_2090730407.1464113018"
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
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
 =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_008_2090730407.1464113018
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpLCYjMzI7SHNpYW8tY2hpZW46DQoNCk9uJiMzMjtNb24sJiMzMjsyMDIzLTA5LTEx
JiMzMjthdCYjMzI7MTU6NDImIzMyOyswODAwLCYjMzI7SHNpYW8mIzMyO0NoaWVuJiMzMjtTdW5n
JiMzMjt3cm90ZToNCiZndDsmIzMyO0FkZCYjMzI7Y29tcGF0aWJsZSYjMzI7bmFtZSYjMzI7Zm9y
JiMzMjtNZWRpYVRlayYjMzI7TVQ4MTg4JiMzMjtNRFAtUkRNQS4NCg0KUmV2aWV3ZWQtYnk6JiMz
MjtDSyYjMzI7SHUmIzMyOyZsdDtjay5odUBtZWRpYXRlay5jb20mZ3Q7DQoNCiZndDsmIzMyOw0K
Jmd0OyYjMzI7UmV2aWV3ZWQtYnk6JiMzMjtBbmdlbG9HaW9hY2NoaW5vJiMzMjtEZWwmIzMyO1Jl
Z25vJiMzMjsmbHQ7DQomZ3Q7JiMzMjthbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9y
YS5jb20mZ3Q7DQomZ3Q7JiMzMjtBY2tlZC1ieTomIzMyO0tyenlzenRvZiYjMzI7S296bG93c2tp
JiMzMjsmbHQ7a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnJmd0Ow0KJmd0OyYjMzI7U2ln
bmVkLW9mZi1ieTomIzMyO0hzaWFvJiMzMjtDaGllbiYjMzI7U3VuZyYjMzI7Jmx0O3NoYXduLnN1
bmdAbWVkaWF0ZWsuY29tJmd0Ow0KJmd0OyYjMzI7LS0tDQomZ3Q7JiMzMjsmIzMyOy4uLi9iaW5k
aW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLG1kcC1yZG1hLnlhbWwmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7fCYjMzI7Ng0KJmd0OyYjMzI7KysrKystDQomZ3Q7
JiMzMjsmIzMyOzEmIzMyO2ZpbGUmIzMyO2NoYW5nZWQsJiMzMjs1JiMzMjtpbnNlcnRpb25zKCsp
LCYjMzI7MSYjMzI7ZGVsZXRpb24oLSkNCiZndDsmIzMyOw0KJmd0OyYjMzI7ZGlmZiYjMzI7LS1n
aXQNCiZndDsmIzMyO2EvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
bWVkaWF0ZWsvbWVkaWF0ZWssbWRwLQ0KJmd0OyYjMzI7cmRtYS55YW1sDQomZ3Q7JiMzMjtiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVr
LG1kcC0NCiZndDsmIzMyO3JkbWEueWFtbA0KJmd0OyYjMzI7aW5kZXgmIzMyO2RkMTJlMmZmNjg1
Yy4uNzU3MGEwNjg0OTY3JiMzMjsxMDA2NDQNCiZndDsmIzMyOy0tLQ0KJmd0OyYjMzI7YS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxt
ZHAtDQomZ3Q7JiMzMjtyZG1hLnlhbWwNCiZndDsmIzMyOysrKw0KJmd0OyYjMzI7Yi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxtZHAt
DQomZ3Q7JiMzMjtyZG1hLnlhbWwNCiZndDsmIzMyO0BAJiMzMjstMjEsNyYjMzI7KzIxLDExJiMz
MjtAQCYjMzI7ZGVzY3JpcHRpb246DQomZ3Q7JiMzMjsNCiZndDsmIzMyOyYjMzI7cHJvcGVydGll
czoNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyO2NvbXBhdGlibGU6DQomZ3Q7JiMzMjstJiMzMjsm
IzMyOyYjMzI7JiMzMjtjb25zdDomIzMyO21lZGlhdGVrLG10ODE5NS12ZG8xLXJkbWENCiZndDsm
IzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyO29uZU9mOg0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOy0mIzMyO2NvbnN0OiYjMzI7bWVkaWF0ZWssbXQ4MTk1LXZkbzEtcmRt
YQ0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOy0mIzMyO2l0ZW1zOg0K
Jmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7LSYjMzI7Y29uc3Q6JiMzMjttZWRpYXRlayxtdDgxODgtdmRvMS1yZG1hDQomZ3Q7JiMzMjsr
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjstJiMzMjtj
b25zdDomIzMyO21lZGlhdGVrLG10ODE5NS12ZG8xLXJkbWENCiZndDsmIzMyOw0KJmd0OyYjMzI7
JiMzMjsmIzMyOyYjMzI7cmVnOg0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO21h
eEl0ZW1zOiYjMzI7MQ0KJmd0OyYjMzI7LS0NCiZndDsmIzMyOzIuMTguMA0KJmd0OyYjMzI7DQoN
CjwvcHJlPjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxwcmU+KioqKioqKioqKioqKiBNRURJQVRF
SyBDb25maWRlbnRpYWxpdHkgTm90aWNlICoqKioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3Jt
YXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQph
dHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQs
IG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxh
d3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRl
ZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBw
cmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBp
dHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkg
cHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVu
ZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZSANCnRoYXQgeW91IGhhdmUg
cmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciAN
CmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5k
IGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykg
ZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhp
cyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_008_2090730407.1464113018
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEhzaWFvLWNoaWVuOg0KDQpPbiBNb24sIDIwMjMtMDktMTEgYXQgMTU6NDIgKzA4MDAsIEhz
aWFvIENoaWVuIFN1bmcgd3JvdGU6DQo+IEFkZCBjb21wYXRpYmxlIG5hbWUgZm9yIE1lZGlhVGVr
IE1UODE4OCBNRFAtUkRNQS4NCg0KUmV2aWV3ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5j
b20+DQoNCj4gDQo+IFJldmlld2VkLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8DQo+
IGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4NCj4gQWNrZWQtYnk6IEty
enlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4NCj4gU2ln
bmVkLW9mZi1ieTogSHNpYW8gQ2hpZW4gU3VuZyA8c2hhd24uc3VuZ0BtZWRpYXRlay5jb20+DQo+
IC0tLQ0KPiAgLi4uL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssbWRwLXJkbWEu
eWFtbCAgICAgICAgfCA2DQo+ICsrKysrLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdA0KPiBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLG1kcC0NCj4gcmRt
YS55YW1sDQo+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVk
aWF0ZWsvbWVkaWF0ZWssbWRwLQ0KPiByZG1hLnlhbWwNCj4gaW5kZXggZGQxMmUyZmY2ODVjLi43
NTcwYTA2ODQ5NjcgMTAwNjQ0DQo+IC0tLQ0KPiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLG1kcC0NCj4gcmRtYS55YW1sDQo+ICsr
Kw0KPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVr
L21lZGlhdGVrLG1kcC0NCj4gcmRtYS55YW1sDQo+IEBAIC0yMSw3ICsyMSwxMSBAQCBkZXNjcmlw
dGlvbjoNCj4gDQo+ICBwcm9wZXJ0aWVzOg0KPiAgICBjb21wYXRpYmxlOg0KPiAtICAgIGNvbnN0
OiBtZWRpYXRlayxtdDgxOTUtdmRvMS1yZG1hDQo+ICsgICAgb25lT2Y6DQo+ICsgICAgICAtIGNv
bnN0OiBtZWRpYXRlayxtdDgxOTUtdmRvMS1yZG1hDQo+ICsgICAgICAtIGl0ZW1zOg0KPiArICAg
ICAgICAgIC0gY29uc3Q6IG1lZGlhdGVrLG10ODE4OC12ZG8xLXJkbWENCj4gKyAgICAgICAgICAt
IGNvbnN0OiBtZWRpYXRlayxtdDgxOTUtdmRvMS1yZG1hDQo+IA0KPiAgICByZWc6DQo+ICAgICAg
bWF4SXRlbXM6IDENCj4gLS0NCj4gMi4xOC4wDQo+IA0K

--__=_Part_Boundary_008_2090730407.1464113018--

