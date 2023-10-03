Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E08747B5F61
	for <lists+dri-devel@lfdr.de>; Tue,  3 Oct 2023 05:32:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3009710E087;
	Tue,  3 Oct 2023 03:32:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B7C210E087
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Oct 2023 03:32:50 +0000 (UTC)
X-UUID: 83e24196619d11ee8051498923ad61e6-20231003
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=qSewTzC+xKCiFMX8RfPFa+LzTEp2QZuWebXt60sYWPM=; 
 b=toVy8MwJpdHB3X8E1BMsNLY3clBxqx5/SAVx4SHOs1b8xlGsg0qYPXwG6RCJ7lDmaaumJ5KP3mVQDkpBcbg15QzDzrGcRssywUUgaYFu4ddbA9/RJxrgHc8gLk/XZNm1yfmdgI9M4ctITXv6mIATCiY1n/m6dI619IASqgBf0l8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:3668e0d3-edc5-4d02-b779-55c23c13c03f, IP:0,
 U
 RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:25
X-CID-META: VersionHash:5f78ec9, CLOUDID:d99c60f0-9a6e-4c39-b73e-f2bc08ca3dc5,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 83e24196619d11ee8051498923ad61e6-20231003
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw02.mediatek.com (envelope-from <moudy.ho@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 675676906; Tue, 03 Oct 2023 11:32:44 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 3 Oct 2023 11:32:43 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Tue, 3 Oct 2023 11:32:42 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M6P2m2NC4RgKyj5fx2TzztueEPfIJ+PzS64h0MKNMxRJmkEvc483l9+oA1aXDSL7OEQTqtYsus4dju7DIzuA8+Q5eufkXteqrKWTT78D7NDfIIUtqsVeE7EVnFxQP0hZWd8i25BFfnm4CTUV747yv0pfL7YCt1t1s6ZuWc+WRvFb2LDBhugFOleUev0J/ztNGGzhwlSSz5zp9+shzqWYkL8wiqWa574pMkbkkuJqaWzlRK2YhOuI2Cmir+j0Nf6Vle5Msy+i2oMNAX5viGwR+g30A9FTeedOqfZyaMoIdqxtSaC9Dc5+gfqa3Oj1HhxDfKYcmQ9BLZFRpyBb/KwUlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qSewTzC+xKCiFMX8RfPFa+LzTEp2QZuWebXt60sYWPM=;
 b=COsWg1yBNFPR2OA8A550KzMRVIUJxIbL8d5huqSp+TcFL5DuA1trDDRTzGkRTt/HQLq7PWQJg+I0qzvTs9Zy3SdL+t9afMioICrutXL6MhXGGtaAjqll3ntpMA8QDFbpIq+SaidC9KPAAfv0lZLikClEA1FIfZ8DBX4jkW9EXx97aIA+25LXPN119n7BcZqZqMSoRVlES4hQ1Bp7uZvTfwhgSk58DFcuk+VAo9ApS33LG4dX2h21gsFGskK0i3uo4AIXejrhhPSpB300Bvu6f181PW0e44N+y67IiIIDTLZr93I0S3UHL9JniPtb2t20Y+zjqPxe0hK3RKKA+XKvWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qSewTzC+xKCiFMX8RfPFa+LzTEp2QZuWebXt60sYWPM=;
 b=HdtZob/ZDjSDtxvB1p9XU2Tr3fArwjw56sLa0JNg/bAtVueUazjSnkyyCq45TYZBCtfturqPkLUwyajUr69ZeoLDX1qlxc0SM9O9BycdhistuAx4vDHmUy+rDvWzJqaZEmeRgGAVFKMEn6Bju5DHRbv9aaxhfa3CVEBzrPQgz2Q=
Received: from SG2PR03MB6343.apcprd03.prod.outlook.com (2603:1096:4:17a::6) by
 TYZPR03MB6576.apcprd03.prod.outlook.com (2603:1096:400:1fd::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.33; Tue, 3 Oct 2023 03:32:41 +0000
Received: from SG2PR03MB6343.apcprd03.prod.outlook.com
 ([fe80::10c2:a420:e409:a1b8]) by SG2PR03MB6343.apcprd03.prod.outlook.com
 ([fe80::10c2:a420:e409:a1b8%7]) with mapi id 15.20.6838.033; Tue, 3 Oct 2023
 03:32:41 +0000
From: =?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>
To: "conor@kernel.org" <conor@kernel.org>
Subject: Re: [PATCH v6 05/16] dt-bindings: media: mediatek: mdp3: add support
 MT8195 RDMA
Thread-Topic: [PATCH v6 05/16] dt-bindings: media: mediatek: mdp3: add support
 MT8195 RDMA
Thread-Index: AQHZ7SWHwV7413lkAUmXk0fh0nOKCLAm/bIAgBB8iAA=
Date: Tue, 3 Oct 2023 03:32:41 +0000
Message-ID: <5734776bbf913932367439e2b7ee860114f8adaa.camel@mediatek.com>
References: <20230922072116.11009-1-moudy.ho@mediatek.com>
 <20230922072116.11009-6-moudy.ho@mediatek.com>
 <20230922-squealing-tipoff-e2fc6117ba7e@spud>
In-Reply-To: <20230922-squealing-tipoff-e2fc6117ba7e@spud>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR03MB6343:EE_|TYZPR03MB6576:EE_
x-ms-office365-filtering-correlation-id: 4e5ce0b9-828e-4f42-ce71-08dbc3c16606
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JTCYlYIvs4EJjcWROos/hDVbS1dTvsrm9KtcdRZWcMtZ0wFfoRHlGpbQmwPRCkT8eCIMkBoJ7dDYzWTqb1WFYGfZcs3ot7tWS4rqpPcP2TtmfimHHhVD1owjXIfYkjlvnG4MAzv2yrjFOAISN5csRSq4RO6WQ8bqi9tUwgQZjcBBhL0bP458jmxGTc6WVKYS5FmOllkGueXLT/bFdO3PyZeDnzDgqvGlgWDvKFhrfPztA59ynXGtiUufoPYS92wBgtWVfKtKFoIQxRJBIsbZfZGDQ48hj4DJwrTc7SOzRLZdZe53UxCsmOBtN1wvmgl/lmBayoEF3Pmvo8DK4Yu9V/9nVB/LRhksjII9d2jBBhdW87OA+JlC7qYbWhbt4MQZ3nSoLN85tb36tPlLZuWeNMg+VZp7zXA/16Hqv9cXnhHBBcuRm+4/IM/W8ZXuMuNDI7erYpSL/p4DedPiu5bWWpR3WyP5c54sdqTiwisaceqHx8dcAZZN80s3r/10cw3LNdNFnPC9c+BemYJn/gjna+UFoB/ZW8K0iOkhFtSdS/RGwj57CwDAs4qaQF1v04wRP4RWTDaChGMBD848KGPTYA0mxsMrcgjCPbBdqk/e4fHxP0GpAXC3txSnMgG4CWTLA/7b06G6Awvc12gQ4r81FYBDC1elQ3Xdyi6YRb15c5MjCr/hMgizb78mL23DpGu517nYoii0VQUIELVO4mUNjg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR03MB6343.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(396003)(366004)(136003)(376002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(2906002)(83380400001)(7416002)(86362001)(36756003)(85182001)(38070700005)(38100700002)(122000001)(316002)(6916009)(66946007)(76116006)(54906003)(66446008)(66476007)(66556008)(64756008)(6506007)(6512007)(91956017)(41300700001)(2616005)(6486002)(966005)(478600001)(71200400001)(4326008)(8676002)(5660300002)(26005)(8936002)(99106002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S1BUY2xLRVJVektrZFBvak1SZnBTbkpYUHZqTlZNd1h4KzFTS3JadjJRMjFS?=
 =?utf-8?B?ME55WWFFSGMvYXlFcTNXWldLMTczVlRVa3F4NGJNc1NkVnpnUlpVSU82TEFm?=
 =?utf-8?B?bnRSY1g2UmxGS2xsWXpYbjFnSHE4QlZPRnh3ZUtFank5VnNBWmJ6dzdjNUlh?=
 =?utf-8?B?RTFCb2hTR29hbWVvMVJzMDY5czAwQUQ2K0Eyd1Z6c0tSTlc3aG5TeDJEbFVY?=
 =?utf-8?B?N1k5SzJyS3pHd3RJalpWYmoyY1hLRllCdGlCMVNmNGxUcEZWc1QrbndiTVJE?=
 =?utf-8?B?M3lFYUpqRVdRUjBJclRoS01aL2VCMGxGdDF4WEJQbThMcjlGdFRSQ0VSTUFC?=
 =?utf-8?B?RW13VFc4NXhINnpTZ1dTN2I3bWNrcVRqVy84d1VDSlNYcVI4WHlPTUFoYkxV?=
 =?utf-8?B?SG5pbkp2MkoyNU8zU2pSTHNVVkxjWnlsK3pXRnIwQmxtTDJxS0xRY3JMeFRW?=
 =?utf-8?B?dXpjQnJtSFdKS3hBeTIzZ3gydHBwTDkzdjBZOW83dzVzdVphY3ZYcXIzeHQy?=
 =?utf-8?B?Vmc0dkZiclBUaHBxZXN1V25jT0RTTkU3WTU2ZGxNUXVBMjhHZTNOVjZ1LzhO?=
 =?utf-8?B?RVh6NXcrOE51ZnBsOCtkV1BTY2lOZTBhSVhBUGNRSSs0eWVXdFlpUWYrakF1?=
 =?utf-8?B?VGpiWncyWU9icTE0U1RBMjhRWWptajNHZS9UUnBmbFFUajZkVUFDR1VHMHpP?=
 =?utf-8?B?OGxGUkxrdFBGb1diUjF6YjYrQVFxSVFENzhBTmhOZjR0TXRuVWY0bE1HYmNk?=
 =?utf-8?B?TDBMcDB6OXV0T2pyMVZHV0d4Z0NrS1BxdERYYlRkTldONnM0Z0ZaTElBcFA0?=
 =?utf-8?B?Z09nNXJ3VDVvVTgzY2pKY3RtdlpDa1JScFVPeTRjUVliODh3amw0dm54ZmVq?=
 =?utf-8?B?VGpCVkR4dzR4cTFkTEhqWldIMzVwRVFoNmM3R0FLS1FiOWhkMkF2UlYwVkJB?=
 =?utf-8?B?enRTQ2N1VlFPQWRDdy9aa1JKb3pac2R2TXFtK0owbkFFOWxaRUhqdEdNc0Rm?=
 =?utf-8?B?THF2T1JEcm9WUHpCKys4aGRPcWpxYStsZG9vdVBtNGl5TTNkVThiYzBGcUFh?=
 =?utf-8?B?dWg1TVFqZWZSYnJOVTRMYVU2a3FiaHFzcmI0ZVFFQ2RBSy9FL0VjV3VCY2J5?=
 =?utf-8?B?dGM2aW1Fd3NSMzdjeTU0eEYzUDVxV0M3dytqWnErV1BqNHZKV1RUMHFKU1BY?=
 =?utf-8?B?WUVoRDBKOEczNW5oMFRNYTVlK2FDK0NqUDR2UVIxZzhUa0dmbTBFamlHSTlH?=
 =?utf-8?B?WUduakRwMDczM00vTGlXckxFeGg1bkFNZ0ZsMzdFWEprNENPMkhiOExONnBq?=
 =?utf-8?B?dEtEUnpIL1ptbEJwS0NnL0dGNHEvU1F4UFpmSUtvMVkwVFZ0SnRPRWVNa3Jk?=
 =?utf-8?B?U1U0N0ppck1CenkyN0syTHZsUlBsWE8rejRKY25GUEtOK2lOOEpVUlp5WDdC?=
 =?utf-8?B?VUI1L1JFUEp4b3ozTmNiMDJBY1ZiWDNhQ0Vmdis5OFBHaWJvSUpPeXJQS1Zz?=
 =?utf-8?B?TFI4V3JYUEljZUpzKzlyNmFjQyt3cDkyRmZNeE9LdVJqdXpPTWtpMmM3Ni9H?=
 =?utf-8?B?QlF6L2xVajAyeVo1anEvVVpubWRGWGEyeVZWM3VFVkxRUFNaT0tHd0hsQWx2?=
 =?utf-8?B?Smg2MEdqRlYwZ1Rack5KWTBWalFxMTM3d2pNaTVLT0Y0dC8zTjlJK0thR21T?=
 =?utf-8?B?K1NmY0hxdGZRRjJvQVhNRWZjOTJGSGFlRjFzQk1zc2Y2RThHSkE4ZEluWFdO?=
 =?utf-8?B?aXNnb2laN2VoU2ZrRGkranZpcU5PZDAxc0NiSkRMK2FXM1A2Q2NiV1hFL1JC?=
 =?utf-8?B?OGpKd0FJYnIxYWd3T1BXcHRWYmdYdXdKN0VVUGljWXVJbHhIcXlwQmRWR3dI?=
 =?utf-8?B?cDZJVExvVk1jRnVNbjZEdDNiSmJOV1pBaTVCRU5OMnZwMGNZYU90ckhZaGty?=
 =?utf-8?B?Q3NUcVNqVnNQaDE2Z1NYTlF4dnpxNFpkNXBZMDFOQzFlNzJ4ZFowSDVVYita?=
 =?utf-8?B?MEkwcWlWb2JMT3hxUE9qbFc4Q1RHdzIwb05SU0Qxb3ZyMERsbkcvaTl5TlNQ?=
 =?utf-8?B?d0ZGNzZLbW1BUWM3NndVY3NmblhHN3ExdkdMb09mdFFpeFpFU052WE1jZ2Ry?=
 =?utf-8?B?aVZHQmNveUtucTdjL1Z1QnVNZXliQU15OG1WOHNPMlZPVHJqUzhqM2NMOVpV?=
 =?utf-8?B?UVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <108E30A3297D9848BB6D179B46682248@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB6343.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e5ce0b9-828e-4f42-ce71-08dbc3c16606
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2023 03:32:41.0865 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L4sgypayTp+uZC2XOB2scuOs9G7/5E2xkDfJw+q9ickP/D3Wwh90BNUuC/+Ch+mEIFE8+H32nesqnnd/OagvCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6576
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--20.603500-8.000000
X-TMASE-MatchedRID: Nail4dlEBNHUL3YCMmnG4ia1MaKuob8Pt3aeg7g/usCe9toQ6h6LE3g0
 GWb/hrt97KxF6knvyMlUte//x0qO3RmN40CNJF1HnbUZkYTzXIZyp78wDsMtDuQydRUvl3QTbwV
 Nh8LIIepjAliRE3rK/oVOjT1T8KvPsEBAuoaUqK/uykw7cfAoIBbjReJSRusbZ5yuplze9pssVU
 53f9voZESzbG6EEhqp0cKu2FU9FOt0IN30kgMbOGwbuvhCHs3cM3PBQtDBME9MOjKUxCZwryOhB
 /49+Z8oV1GJ6JhJGlTTL/y/4Qp+yE4UaRczphxf6/xAZojbl7f/lBG+uXYJkLStxTlX+hJ7Yxoo
 fwwmCfHL7a7vhpw6CJGTpe1iiCJq0u+wqOGzSV0WeMpVNhsMwMRB0bsfrpPI6T/LTDsmJmg=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--20.603500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: F1E734D699B1E2661E688C007033E66ECB48D3367EE8C5452B88781F04100D4D2000:8
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
Cc: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIzLTA5LTIyIGF0IDE2OjQ2ICswMTAwLCBDb25vciBEb29sZXkgd3JvdGU6DQo+
IE9uIEZyaSwgU2VwIDIyLCAyMDIzIGF0IDAzOjIxOjA1UE0gKzA4MDAsIE1vdWR5IEhvIHdyb3Rl
Og0KPiA+IFN1cHBvcnQgZm9yIE1UODE5NSBSRE1BIGhhcyBiZWVuIGFkZGVkLCBhbGxvd2luZyBm
b3INCj4gPiB0aGUgY29uZmlndXJhdGlvbiBvZiBtdWx0aXBsZSBNRFAzIHBpcGVzLg0KPiA+IEZ1
cnRoZXJtb3JlLCB0aGlzIHBhcnRpY3VsYXIgZGV2aWNlIGRvZXMgbm90IHJlcXVpcmUNCj4gPiBz
aGFyaW5nIFNSQU0gd2l0aCBSU1ouDQo+IA0KPiBJJ20gc29ycnkgaWYgSSBhbSBnb2luZyBvdmVy
IHBhc3QgYXJndW1lbnRzLCBpZiB0aGlzIGlzIDkwJSB0aGUgc2FtZQ0KPiBhcw0KPiB0aGUgODE5
MyByZG1hLCB3aHkgdGhlIGV4dHJhY3Rpb24gKyBtb3N0bHkgZHVwbGljYXRlIGZpbGUsIHJhdGhl
cg0KPiB0aGFuDQo+IGNvdmVyaW5nIHdoYXRldmVyIGNsb2Nrcy9tYm94ZXMgZGlmZmVyZW5jZXMg
d2l0aCBhbiBpZi90aGVuL2Vsc2UgaW4gYQ0KPiBzaW5nbGUgZmlsZT8NCj4gDQo+IFRoYW5rcywN
Cj4gQ29ub3IuDQo+IA0KDQpIaSBDb25vciwNCg0KQXMgbWVudGlvbmVkIGluIFsyLzE2XSwgcGxl
YXNlIGRpc3JlZ2FyZCB0aGVzZSBjaGFuZ2VzLg0KDQpTaW5jZXJlbHksDQpNb3VkeQ0KDQo+ID4g
DQo+ID4gU2lnbmVkLW9mZi1ieTogTW91ZHkgSG8gPG1vdWR5LmhvQG1lZGlhdGVrLmNvbT4NCj4g
PiAtLS0NCj4gPiAgLi4uL21lZGlhL21lZGlhdGVrLG1kcDMtcmRtYS04MTk1LnlhbWwgICAgICAg
IHwgNjQNCj4gPiArKysrKysrKysrKysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA2NCBp
bnNlcnRpb25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+IERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayxtZHAzLXJkbWEtDQo+ID4gODE5NS55
YW1sDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tZWRpYS9tZWRpYXRlayxtZHAzLQ0KPiA+IHJkbWEtODE5NS55YW1sDQo+ID4gYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWssbWRwMy1yZG1hLQ0K
PiA+IDgxOTUueWFtbA0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAw
MDAwMDAwLi5mMTAxMzlhZWMzYzUNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLG1kcDMtcmRtYS0NCj4g
PiA4MTk1LnlhbWwNCj4gPiBAQCAtMCwwICsxLDY0IEBADQo+ID4gKyMgU1BEWC1MaWNlbnNlLUlk
ZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQ0KPiA+ICslWUFNTCAxLjIN
Cj4gPiArLS0tDQo+ID4gKyRpZDogDQo+ID4gaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMv
bWVkaWEvbWVkaWF0ZWssbWRwMy1yZG1hLTgxOTUueWFtbCMNCj4gPiArJHNjaGVtYTogaHR0cDov
L2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjDQo+ID4gKw0KPiA+ICt0aXRs
ZTogTWVkaWFUZWsgTVQ4MTk1IFJlYWQgRGlyZWN0IE1lbW9yeSBBY2Nlc3MNCj4gPiArDQo+ID4g
K21haW50YWluZXJzOg0KPiA+ICsgIC0gTWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhpYXMuYmdnQGdt
YWlsLmNvbT4NCj4gPiArICAtIE1vdWR5IEhvIDxtb3VkeS5ob0BtZWRpYXRlay5jb20+DQo+ID4g
Kw0KPiA+ICtkZXNjcmlwdGlvbjogfA0KPiA+ICsgIE1lZGlhVGVrIFJlYWQgRGlyZWN0IE1lbW9y
eSBBY2Nlc3MoUkRNQSkgY29tcG9uZW50IHVzZWQgdG8gZG8NCj4gPiByZWFkIERNQS4NCj4gPiAr
ICBUaGlzIHR5cGUgb2YgY29tcG9uZW50IGlzIGNvbmZpZ3VyZWQgd2hlbiB0aGVyZSBhcmUgbXVs
dGlwbGUNCj4gPiBNRFAzIHBpcGVsaW5lcw0KPiA+ICsgIHRoYXQgYmVsb25nIHRvIGRpZmZlcmVu
dCBNTVNZUyBzdWJzeXN0ZW1zLg0KPiA+ICsgIEl0IGNvbnRhaW5zIG9uZSBsaW5lIGJ1ZmZlciB0
byBzdG9yZSB0aGUgc3VmZmljaWVudCBwaXhlbCBkYXRhLA0KPiA+IGFuZA0KPiA+ICsgIG11c3Qg
YmUgc2libGluZ3MgdG8gdGhlIGNlbnRyYWwgTU1TWVNfQ09ORklHIG5vZGUuDQo+ID4gKyAgRm9y
IGEgZGVzY3JpcHRpb24gb2YgdGhlIE1NU1lTX0NPTkZJRyBiaW5kaW5nLCBzZWUNCj4gPiArICBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL21lZGlhdGVrL21lZGlhdGVrLG1t
c3lzLnlhDQo+ID4gbWwNCj4gPiArICBmb3IgZGV0YWlscy4NCj4gPiArDQo+ID4gK2FsbE9mOg0K
PiA+ICsgIC0gJHJlZjogbWVkaWF0ZWssbWRwMy1yZG1hLWNvbW1vbi55YW1sIw0KPiA+ICsNCj4g
PiArcHJvcGVydGllczoNCj4gPiArICBjb21wYXRpYmxlOg0KPiA+ICsgICAgaXRlbXM6DQo+ID4g
KyAgICAgIC0gY29uc3Q6IG1lZGlhdGVrLG10ODE5NS1tZHAzLXJkbWENCj4gPiArDQo+ID4gKyAg
Y2xvY2tzOg0KPiA+ICsgICAgbWF4SXRlbXM6IDENCj4gPiArDQo+ID4gKyAgbWJveGVzOg0KPiA+
ICsgICAgbWF4SXRlbXM6IDUNCj4gPiArDQo+ID4gK3JlcXVpcmVkOg0KPiA+ICsgIC0gY29tcGF0
aWJsZQ0KPiA+ICsNCj4gPiArYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQo+ID4gKw0KPiA+
ICtleGFtcGxlczoNCj4gPiArICAtIHwNCj4gPiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9j
bG9jay9tdDgxOTUtY2xrLmg+DQo+ID4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvZ2NlL210
ODE5NS1nY2UuaD4NCj4gPiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9wb3dlci9tdDgxOTUt
cG93ZXIuaD4NCj4gPiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9tZW1vcnkvbXQ4MTk1LW1l
bW9yeS1wb3J0Lmg+DQo+ID4gKw0KPiA+ICsgICAgZG1hLWNvbnRyb2xsZXJAMTQwMDEwMDAgew0K
PiA+ICsgICAgICAgIGNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTk1LW1kcDMtcmRtYSI7DQo+
ID4gKyAgICAgICAgcmVnID0gPDB4MTQwMDEwMDAgMHgxMDAwPjsNCj4gPiArICAgICAgICBtZWRp
YXRlayxnY2UtY2xpZW50LXJlZyA9IDwmZ2NlMSBTVUJTWVNfMTQwMFhYWFggMHgxMDAwDQo+ID4g
MHgxMDAwPjsNCj4gPiArICAgICAgICBtZWRpYXRlayxnY2UtZXZlbnRzID0gPENNRFFfRVZFTlRf
VlBQMF9NRFBfUkRNQV9TT0Y+LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8
Q01EUV9FVkVOVF9WUFAwX01EUF9SRE1BX0ZSQU1FX0RPTkUNCj4gPiA+Ow0KPiA+ICsgICAgICAg
IHBvd2VyLWRvbWFpbnMgPSA8JnNwbSBNVDgxOTVfUE9XRVJfRE9NQUlOX1ZQUFNZUzA+Ow0KPiA+
ICsgICAgICAgIGlvbW11cyA9IDwmaW9tbXVfdnBwIE00VV9QT1JUX0w0X01EUF9SRE1BPjsNCj4g
PiArICAgICAgICBjbG9ja3MgPSA8JnZwcHN5czAgQ0xLX1ZQUDBfTURQX1JETUE+Ow0KPiA+ICsg
ICAgICAgIG1ib3hlcyA9IDwmZ2NlMSAxMiBDTURRX1RIUl9QUklPXzE+LA0KPiA+ICsgICAgICAg
ICAgICAgICAgIDwmZ2NlMSAxMyBDTURRX1RIUl9QUklPXzE+LA0KPiA+ICsgICAgICAgICAgICAg
ICAgIDwmZ2NlMSAxNCBDTURRX1RIUl9QUklPXzE+LA0KPiA+ICsgICAgICAgICAgICAgICAgIDwm
Z2NlMSAyMSBDTURRX1RIUl9QUklPXzE+LA0KPiA+ICsgICAgICAgICAgICAgICAgIDwmZ2NlMSAy
MiBDTURRX1RIUl9QUklPXzE+Ow0KPiA+ICsgICAgICAgICNkbWEtY2VsbHMgPSA8MT47DQo+ID4g
KyAgICB9Ow0KPiA+IC0tIA0KPiA+IDIuMTguMA0KPiA+IA0K
