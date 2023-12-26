Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF79881E4F8
	for <lists+dri-devel@lfdr.de>; Tue, 26 Dec 2023 06:24:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 559A210E038;
	Tue, 26 Dec 2023 05:24:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BA0710E038
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Dec 2023 05:24:47 +0000 (UTC)
X-UUID: 120dee36a3af11eeba30773df0976c77-20231226
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=yIYmFHLeYxSkjEBvx5neR2U9F3JFtQajJdtrg27NcAA=; 
 b=ttjtW2PaZu1oZ6NGQwabMRYHTO1ByV2HC2q1pT7j1AUfKM3mB+MAzp5APjMNkH3k2c8MiyFO26ucg2tSm48Gg6moffyhCIKXrzwhrQeadprC3miWiLMc5BNPzH8xKtj5oHsbZx3gz7rIFbljSxlut7yLt4/Nps/LnqVoWCWq3ek=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35, REQID:9e4b0abb-f0c2-437a-883b-b7eb5bfbe629, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5d391d7, CLOUDID:a8007d2e-1ab8-4133-9780-81938111c800,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 120dee36a3af11eeba30773df0976c77-20231226
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2021448960; Tue, 26 Dec 2023 13:24:41 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 26 Dec 2023 13:24:39 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Tue, 26 Dec 2023 13:24:39 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hWx7p2nR4OT/eQoJzxZWhVhmjA/OgAI5q6NyV8S0frluvio8/twBtVrBzx9fB+ZkSL16LfSns2uE/ZkWDRQkI4Fk8e8xsK4NodozPgtd48xNI/Y9qYDGWcgU/RDEBe3LkZwlsqHyb5Mc/qOqMhSE/DO31CoiXeqNDv5CFi0i87ik3WwQC6MI+5UN4ZS2q5joDr10E+GUvyBkj+ynWD+IBRmUCIk9lXId/B9/s0GSjIk4IJB/ShqrwSri9cT5scmYxDUKGV2VxdamQ1leGhK089JAi3PCaJdvkRh71wpzCKz+oyTcZPSDpMg38qXXLN2WKn06n2/p26XDL4vJUDTK3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2sPG/uVtLoig4VKgOGBJ7f2yNA7fwnTddyMl4QAIBgU=;
 b=WAaqtwvV68ShAf5wzSMJexL1ifqYmO18M2ic6+k9sVyG3WOzozsCL0/7PLpaUoWEXcvPyGt9i9VZCaHRTGbBlbCthwixfZwwDFV25CpDW0auf5MIsbHucXrWgkdNbkF2mgAdhAB7SXqceYs3dHoAw2yZZAiPftoyKhYl8mebDJZS4J0EgR2qcR55KtsU9L8sE/o1Fds1TyzbMZuvR3BG27ZBPeoyvaOfx/cXZh9A8J2rtsLT+QC6+TxSfl9UZdqaa1qoeooAXJrNBf1B/bqXeXhMXi6DPPU0kTGWuyqO6Yl77VOLKxeb0In1UkTcDDfIkb/gYj/X+1fruKRwyF8teA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2sPG/uVtLoig4VKgOGBJ7f2yNA7fwnTddyMl4QAIBgU=;
 b=GvjhYsABCwf4DPM5E6og8yOfokf26GpXSh8v2Dl6aIT/W9idXxCODAClqknYoMVg5476Z7tVxuywuN2vVSRN8ipEkS96LzSdgi+VA1kG+alKXjJX/lxU/8m/2YlQZhejCzuIl/KnD2OgTXwft8WjSFjbSAnY/IsffoTCsdQggrs=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by OSQPR03MB8457.apcprd03.prod.outlook.com (2603:1096:604:274::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27; Tue, 26 Dec
 2023 05:24:37 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::eb43:57cb:edfd:3762]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::eb43:57cb:edfd:3762%7]) with mapi id 15.20.7113.027; Tue, 26 Dec 2023
 05:24:37 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v3 06/11] drm/mediatek: Add get_sec_port interface to
 mtk_ddp_comp
Thread-Topic: [PATCH v3 06/11] drm/mediatek: Add get_sec_port interface to
 mtk_ddp_comp
Thread-Index: AQHaNc4i7cI6v2Po60+LN2zyqBzlMrC7DAUA
Date: Tue, 26 Dec 2023 05:24:37 +0000
Message-ID: <4165d71dd9d0043346ca57d1a556f21639885d18.camel@mediatek.com>
References: <20231223182932.27683-1-jason-jh.lin@mediatek.com>
 <20231223182932.27683-7-jason-jh.lin@mediatek.com>
In-Reply-To: <20231223182932.27683-7-jason-jh.lin@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|OSQPR03MB8457:EE_
x-ms-office365-filtering-correlation-id: 940600d5-8c94-4dac-6d4d-08dc05d2f3e8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: W22+lDPTDVpg/E+uAAcO+5xfZDBTO+G5Bl+B/BA7NU9ySc0LnnetzX9v+a1c7kfkqQJOWXudlr1S5GGyBSUsjjjFBZbM5ldVawNBPPoUA4usH07dNmyR759RJSMKPeOioqZ0f2OP4FRN0F2yWXC8io11Q3x+kI7rd12Ek2/cLyk3B2n9umlUbgceLKsewx9RkMksgHvu70mfLCA7Eo+GemGRv2mErIi5r196NnMNEnUtNsVoeKll0VbMMacFWyG0502IfOcAifTLDSJTqLnbBdjJ2I34sK8mdn9Txd1wx9fK/JCNgI/Ch0Cb9pbY4WKnryY6GxgA2fO65eSzpgxstGYfLPclHfiHTttQMLR4EYrzjYUr1pIY0a2Fwl8F/pGuJfTSrGa7NmlrIbU61uvRM3caH6nhbfACCKhHoZCpxcMVMXWaeHSpl+UpL74mleEpg8vWZrUdvIu2bb04KlC4mP/kGwjc7U0ePDYU3CulnHcqYSzcLPIaoSmmersxPDCR9caB/yci7l0amhGnSaaqYO3LO39Z46iFsqwpEjxqJ6u7sd3gw4SR7z8oxNOAGUu50i09BB8KoGAGywOnqyixRXNBBZosYbnJrjmkQE0JNdG6mn1aZjFMhuHCs3QlJx6KcmS3qDlHoHlasRNs083/Vjyu0Xqhd2ONNjDDDhJ6HjQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(346002)(396003)(136003)(366004)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(85182001)(36756003)(71200400001)(6512007)(6506007)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(6486002)(86362001)(38070700009)(38100700002)(26005)(122000001)(83380400001)(2616005)(41300700001)(2906002)(5660300002)(4001150100001)(8936002)(7416002)(8676002)(478600001)(316002)(54906003)(4326008)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZFBoNzJiSzhtUEFEalk1aUhTdHhQOUNQazlKZFVObDRxeWROOS9QUDMrMGNx?=
 =?utf-8?B?a29NVHRPR2luSEI4V01ZVld6aEhtN2QvY2R3Z2JYSi9qQnd6SWpFV3RlY0U0?=
 =?utf-8?B?NGRKOFlHc0lUZnM3dWN2Nm1ieVNNK0lNMi9LaUxPcmJoa2hseXZlclQ2OXJF?=
 =?utf-8?B?MkpSeWJMam9VQmt0bmduYW5HSlJ3Q3pGdWR2SkZ0d1UwL2dvYnBiZFp3Q1Z3?=
 =?utf-8?B?RUtnSzVXRG1TTkw2bE9xaVFJRVZWUWVrUUF1WFd2aGhoZkJVb01YWVF4Z044?=
 =?utf-8?B?R1lwZ0FpQmphNGZwajRDSjlSTHBaZ05hcHB3RkQvUUQ5blcvZnYzRHNNS1BX?=
 =?utf-8?B?NXZmbGFoNUNCYURiQXY2YW5nZGI0eWN2THFtS2R6eFNURStUaTVmY0d4QW5i?=
 =?utf-8?B?QzFvVS9ic2xIOHE1cHJtWlM3aWdDZWY0TmdHMzJUYXNuSXVvMVg3VWZTWHYv?=
 =?utf-8?B?QnpGZ21ZdU5OS3UyZktvbEtCL3l3OURKYzlnd2sreEhtWG1lK3NCZ0tqVUxu?=
 =?utf-8?B?VHFLZEFpcjc5VVYyN05IajJoYU9zUUNHZGRWOTMyM2M1ZWRzNVIvd29WajBw?=
 =?utf-8?B?ZnVYQzlHeWVSbEhqZ0Qzb1Y2Rkh1VjVjU3l1czRSWkNuaFE4bXFJbzRlQ1hQ?=
 =?utf-8?B?VVJmbkV0UnFFMjJGMjBOUHpTcVJzZEZqZHZGVGFrUlJUMFl3eVZFWklFWDRH?=
 =?utf-8?B?UmxKSXk5R2E3VjllU0hlSlFFT1lPbDMzeTQzVXRxNjVWUm4zWVhocU9qRGN1?=
 =?utf-8?B?UDdCdDM0ZDg2QlUwN1N1NittMG1kRkZwc3NYVE5QMzdRY290WURUOXlpZmlU?=
 =?utf-8?B?NXNPVzllNnZ3ZWV3OVlPK0ZwN0d2M0FVNVBXU2VNb2JLZEU5VkN1T3VXZTQx?=
 =?utf-8?B?QXdUeW5JM3ZHWlBxY3F4NWNnRmRRbE1LNGJYQzRaejdubUhoeUsydnVxZGN6?=
 =?utf-8?B?KzFzQXRMcWxWWFBmQkk4RkR4OXhqVGR6TWlsRElnWjVZOTg3V2YzWHlRUnFM?=
 =?utf-8?B?SWJCKzVCU1FHMEs3V3VmM0FTRjlNa3dDdU9hb3dVT1l1VFF1enBXNCtZNHhI?=
 =?utf-8?B?L2tiYmo2eUxWM1VVVE42ZHpzRVpMdG5TeXlMd0dsYzVWaTBDaU9LUFpWMng2?=
 =?utf-8?B?RWRQTDNyWjFYM3U1eHdjVEhXdkNyVGxUanZMSEZaQXBpZnc0WXRuNlkrdUl6?=
 =?utf-8?B?REdMSG0vd202NXF0RlE2WWlYUnpybEdEdVgxQy81OExOSWFzYmVTZzI2L0hP?=
 =?utf-8?B?WmlibHJ0Qno5T3l2UmwyMzlnRzR5QXFmTGEvMFhvRndvQW1WR0pnaFh1Q2JJ?=
 =?utf-8?B?SzBBamlPWVozVGIrdWxTQWRwQStUcTNIeXVBY3kxRHl4aUZEbFE0YmpiY0d2?=
 =?utf-8?B?NWNLbGtmUVY5bmxqWFBCVnlvQURuNWdRWkNtWWk4N3cxeGdDa2VyQXpsb2Yv?=
 =?utf-8?B?d0xIZFdMaythcmkvMWhjSGZmQ3c1RDZYem9GSVZqRnFCcTN6ejhqYXo1RUtl?=
 =?utf-8?B?NkxnYnZydFBOUWxVYVpEYUpzcURNMS9paEp2RjdnaHhlaFowNkZtdmFHVk9I?=
 =?utf-8?B?N1NBbTFMZHA5ajAzaUN0eTllbHhJOERDWHNtQjV1Y213TkZsM2xKdGlDRXBw?=
 =?utf-8?B?OFRjYWQ4dnBQV0dDaTc3emxadVg2VHlJVEMyUE02eEpUTG9LdFo2ME9qZ2RO?=
 =?utf-8?B?TEsrdmh1MFhUNTFmVklqY3ZLdkErc04ydUlNWVJTeUllMlJVWXB2b1BHRk5U?=
 =?utf-8?B?RzJDclRSUUVNbm8wdS9aQUZLSXlsUDkzckZxWnF5bmVkVnR5VEgzU1dvNXg3?=
 =?utf-8?B?TG94Tkw4Sm1LMTY1V005aGovZGJsRFg1UW12dEJxOTYwc0pyMVlHSG41eDdj?=
 =?utf-8?B?MW52MG5WRjVJay9nSXc2UFZsMHQ3ZEs3LzJCTmlJQTh4dGpqeUNaQnZZbjJ3?=
 =?utf-8?B?djJtUTFFZWtlQ2lqeW5sWW44V2NiSkEvZjJ4bHJBWUZadUxUVjBkRDd6blg3?=
 =?utf-8?B?WWhCS2FHRDlOdktWUnV0YkJNUEE4eitITHZXdWdNWkNqcFhidGRpVklzN1hE?=
 =?utf-8?B?Z0lrZVdhZWJzTVRjMGZ4dzEzRWpzTUtqSW9DbkdBOWFkUENsLy9CR2ZxUDgy?=
 =?utf-8?Q?53qr8KlYTGGMT27knrpap0IiM?=
Content-ID: <7F1E7273D9128545AAAADF00FB4CE1CD@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 940600d5-8c94-4dac-6d4d-08dc05d2f3e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Dec 2023 05:24:37.2915 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +I1ei5jdK+OfjCPEjH9sKRZcrH05Th44R4/7LP8QGtOeo5CfjKjaelHk1tuWJ95OKMHxXHg8A5Xbr/y3VF2P6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR03MB8457
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--12.354500-8.000000
X-TMASE-MatchedRID: 7ySqCuYCpfg6yy6RAAEPcya1MaKuob8PC/ExpXrHizxcKZwALwMGs48L
 9E3YVK3KmSouTgBPZUccqoDU4VZ+l+WMRWp11p3rMSjlkes0Ka8RvEpVd3vS1d9RlPzeVuQQMG4
 kjAsJeaCH2vPYF3S6b3gscjoXnCecXHEPHmpuRH3SBVVc2BozSlkMvWAuahr8+gD2vYtOFhgqtq
 5d3cxkNWpLYSIdl6JxMGox0uFlJtY4rASHKeGnZjMzNOM655RPGUxbCUG9YTo=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--12.354500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 3BD89BAE811C7A0F58B9103D3123C7574C12C64BE0EEDE2986D3B2D16CA8EF5F2000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_004_344717865.258120719"
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
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 =?utf-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?= <Jason-ch.Chen@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?utf-8?B?Sm9obnNvbiBXYW5nICjnjovogZbpkasp?= <Johnson.Wang@mediatek.com>,
 =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_004_344717865.258120719
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCk9uJiMzMjtTdW4sJiMzMjsyMDIzLTEyLTI0JiMzMjthdCYjMzI7MDI6MjkmIzMyOysw
ODAwLCYjMzI7SmFzb24tSkguTGluJiMzMjt3cm90ZToNCiZndDsmIzMyO0FkZCYjMzI7Z2V0X3Nl
Y19wb3J0JiMzMjtpbnRlcmZhY2UmIzMyO3RvJiMzMjtkZHBfY29tcCYjMzI7dG8mIzMyO2dldCYj
MzI7dGhlJiMzMjtzZWN1cmUmIzMyO3BvcnQNCiZndDsmIzMyO3NldHRpbmdzDQomZ3Q7JiMzMjtm
cm9tJiMzMjtvdmwmIzMyO2FuZCYjMzI7b3ZsX2FkYXB0b3IuDQomZ3Q7JiMzMjtUaGVuJiMzMjtt
ZWRpYXRlay1kcm0mIzMyO3dpbGwmIzMyO3VzZSYjMzI7c2VjdXJlJiMzMjtjbWRxJiMzMjtkcml2
ZXImIzMyO3RvJiMzMjtjb25maWd1cmUmIzMyO0RSQU0NCiZndDsmIzMyO2FjY2Vzcw0KJmd0OyYj
MzI7cGVybWlzc2lvbiYjMzI7aW4mIzMyO3NlY3VyZSYjMzI7d29ybGQmIzMyO2J5JiMzMjt0aGVp
ciYjMzI7c2VjdXJlJiMzMjtwb3J0JiMzMjtzZXR0aW5ncy4NCiZndDsmIzMyOw0KJmd0OyYjMzI7
U2lnbmVkLW9mZi1ieTomIzMyO0phc29uLUpILkxpbiYjMzI7Jmx0O2phc29uLWpoLmxpbkBtZWRp
YXRlay5jb20mZ3Q7DQomZ3Q7JiMzMjstLS0NCg0KVE9ETzomIzMyO2Ryb3AmIzMyO3RoaXMmIzMy
O3BhdGNoLg0KDQoNClJlZ2FyZHMsDQpDSw0KDQomZ3Q7JiMzMjsmIzMyO2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmgmIzMyO3wmIzMyOzkmIzMyOysrKysrKysrKw0K
Jmd0OyYjMzI7JiMzMjsxJiMzMjtmaWxlJiMzMjtjaGFuZ2VkLCYjMzI7OSYjMzI7aW5zZXJ0aW9u
cygrKQ0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtkaWZmJiMzMjstLWdpdCYjMzI7YS9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5oDQomZ3Q7JiMzMjtiL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmgNCiZndDsmIzMyO2luZGV4JiMzMjtiNWEw
NWNhM2EzODUuLjFlNmExMjBhMTAzZCYjMzI7MTAwNjQ0DQomZ3Q7JiMzMjstLS0mIzMyO2EvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuaA0KJmd0OyYjMzI7KysrJiMz
MjtiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmgNCiZndDsmIzMy
O0BAJiMzMjstODQsNiYjMzI7Kzg0LDcmIzMyO0BAJiMzMjtzdHJ1Y3QmIzMyO210a19kZHBfY29t
cF9mdW5jcyYjMzI7ew0KJmd0OyYjMzI7JiMzMjt2b2lkJiMzMjsoKmFkZCkoc3RydWN0JiMzMjtk
ZXZpY2UmIzMyOypkZXYsJiMzMjtzdHJ1Y3QmIzMyO210a19tdXRleCYjMzI7Km11dGV4KTsNCiZn
dDsmIzMyOyYjMzI7dm9pZCYjMzI7KCpyZW1vdmUpKHN0cnVjdCYjMzI7ZGV2aWNlJiMzMjsqZGV2
LCYjMzI7c3RydWN0JiMzMjttdGtfbXV0ZXgmIzMyOyptdXRleCk7DQomZ3Q7JiMzMjsmIzMyO3Vu
c2lnbmVkJiMzMjtpbnQmIzMyOygqZW5jb2Rlcl9pbmRleCkoc3RydWN0JiMzMjtkZXZpY2UmIzMy
OypkZXYpOw0KJmd0OyYjMzI7K3U2NCYjMzI7KCpnZXRfc2VjX3BvcnQpKHN0cnVjdCYjMzI7bXRr
X2RkcF9jb21wJiMzMjsqY29tcCwmIzMyO3Vuc2lnbmVkJiMzMjtpbnQNCiZndDsmIzMyO2lkeCk7
DQomZ3Q7JiMzMjsmIzMyO307DQomZ3Q7JiMzMjsmIzMyOw0KJmd0OyYjMzI7JiMzMjtzdHJ1Y3Qm
IzMyO210a19kZHBfY29tcCYjMzI7ew0KJmd0OyYjMzI7QEAmIzMyOy0xOTksNiYjMzI7KzIwMCwx
NCYjMzI7QEAmIzMyO3N0YXRpYyYjMzI7aW5saW5lJiMzMjt1bnNpZ25lZCYjMzI7aW50DQomZ3Q7
JiMzMjttdGtfZGRwX2dhbW1hX2dldF9sdXRfc2l6ZShzdHJ1Y3QmIzMyO210a19kZHBfY29tcCYj
MzI7KmNvbXApDQomZ3Q7JiMzMjsmIzMyO3JldHVybiYjMzI7MDsNCiZndDsmIzMyOyYjMzI7fQ0K
Jmd0OyYjMzI7JiMzMjsNCiZndDsmIzMyOytzdGF0aWMmIzMyO2lubGluZSYjMzI7dTY0JiMzMjtt
dGtfZGRwX2NvbXBfbGF5ZXJfZ2V0X3NlY19wb3J0KHN0cnVjdA0KJmd0OyYjMzI7bXRrX2RkcF9j
b21wJiMzMjsqY29tcCwNCiZndDsmIzMyOysmIzMyOyYjMzI7dW5zaWduZWQmIzMyO2ludCYjMzI7
aWR4KQ0KJmd0OyYjMzI7K3sNCiZndDsmIzMyOytpZiYjMzI7KGNvbXAtJmd0O2Z1bmNzJiMzMjsm
YW1wOyZhbXA7JiMzMjtjb21wLSZndDtmdW5jcy0mZ3Q7Z2V0X3NlY19wb3J0KQ0KJmd0OyYjMzI7
K3JldHVybiYjMzI7Y29tcC0mZ3Q7ZnVuY3MtJmd0O2dldF9zZWNfcG9ydChjb21wLCYjMzI7aWR4
KTsNCiZndDsmIzMyOytyZXR1cm4mIzMyOzA7DQomZ3Q7JiMzMjsrfQ0KJmd0OyYjMzI7Kw0KJmd0
OyYjMzI7JiMzMjtzdGF0aWMmIzMyO2lubGluZSYjMzI7dm9pZCYjMzI7bXRrX2RkcF9nYW1tYV9z
ZXQoc3RydWN0JiMzMjttdGtfZGRwX2NvbXAmIzMyOypjb21wLA0KJmd0OyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7c3RydWN0JiMzMjtkcm1fY3J0Y19zdGF0ZSYjMzI7KnN0YXRl
KQ0KJmd0OyYjMzI7JiMzMjt7DQoNCjwvcHJlPjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxwcmU+
KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlDQogKioqKioqKioq
KioqKioqKioqKioNClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVz
c2FnZSAoaW5jbHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBw
cm9wcmlldGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9z
dXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXll
ZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5h
dGlvbiwgDQpkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0
aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJl
Y2lwaWVudChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4g
SWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBi
ZWxpZXZlDQogDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCBw
bGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhp
cyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwgKGlu
Y2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QNCmRp
c2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24uIFRo
YW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_004_344717865.258120719
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gU3VuLCAyMDIzLTEyLTI0IGF0IDAyOjI5ICswODAwLCBKYXNvbi1KSC5MaW4gd3JvdGU6DQo+
IEFkZCBnZXRfc2VjX3BvcnQgaW50ZXJmYWNlIHRvIGRkcF9jb21wIHRvIGdldCB0aGUgc2VjdXJl
IHBvcnQNCj4gc2V0dGluZ3MNCj4gZnJvbSBvdmwgYW5kIG92bF9hZGFwdG9yLg0KPiBUaGVuIG1l
ZGlhdGVrLWRybSB3aWxsIHVzZSBzZWN1cmUgY21kcSBkcml2ZXIgdG8gY29uZmlndXJlIERSQU0N
Cj4gYWNjZXNzDQo+IHBlcm1pc3Npb24gaW4gc2VjdXJlIHdvcmxkIGJ5IHRoZWlyIHNlY3VyZSBw
b3J0IHNldHRpbmdzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSmFzb24tSkguTGluIDxqYXNvbi1q
aC5saW5AbWVkaWF0ZWsuY29tPg0KPiAtLS0NCg0KVE9ETzogZHJvcCB0aGlzIHBhdGNoLg0KDQoN
ClJlZ2FyZHMsDQpDSw0KDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBf
Y29tcC5oIHwgOSArKysrKysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykN
Cj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBf
Y29tcC5oDQo+IGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuaA0K
PiBpbmRleCBiNWEwNWNhM2EzODUuLjFlNmExMjBhMTAzZCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuaA0KPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5oDQo+IEBAIC04NCw2ICs4NCw3IEBAIHN0
cnVjdCBtdGtfZGRwX2NvbXBfZnVuY3Mgew0KPiAgCXZvaWQgKCphZGQpKHN0cnVjdCBkZXZpY2Ug
KmRldiwgc3RydWN0IG10a19tdXRleCAqbXV0ZXgpOw0KPiAgCXZvaWQgKCpyZW1vdmUpKHN0cnVj
dCBkZXZpY2UgKmRldiwgc3RydWN0IG10a19tdXRleCAqbXV0ZXgpOw0KPiAgCXVuc2lnbmVkIGlu
dCAoKmVuY29kZXJfaW5kZXgpKHN0cnVjdCBkZXZpY2UgKmRldik7DQo+ICsJdTY0ICgqZ2V0X3Nl
Y19wb3J0KShzdHJ1Y3QgbXRrX2RkcF9jb21wICpjb21wLCB1bnNpZ25lZCBpbnQNCj4gaWR4KTsN
Cj4gIH07DQo+ICANCj4gIHN0cnVjdCBtdGtfZGRwX2NvbXAgew0KPiBAQCAtMTk5LDYgKzIwMCwx
NCBAQCBzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGludA0KPiBtdGtfZGRwX2dhbW1hX2dldF9sdXRf
c2l6ZShzdHJ1Y3QgbXRrX2RkcF9jb21wICpjb21wKQ0KPiAgCXJldHVybiAwOw0KPiAgfQ0KPiAg
DQo+ICtzdGF0aWMgaW5saW5lIHU2NCBtdGtfZGRwX2NvbXBfbGF5ZXJfZ2V0X3NlY19wb3J0KHN0
cnVjdA0KPiBtdGtfZGRwX2NvbXAgKmNvbXAsDQo+ICsJCQkJCQkgIHVuc2lnbmVkIGludCBpZHgp
DQo+ICt7DQo+ICsJaWYgKGNvbXAtPmZ1bmNzICYmIGNvbXAtPmZ1bmNzLT5nZXRfc2VjX3BvcnQp
DQo+ICsJCXJldHVybiBjb21wLT5mdW5jcy0+Z2V0X3NlY19wb3J0KGNvbXAsIGlkeCk7DQo+ICsJ
cmV0dXJuIDA7DQo+ICt9DQo+ICsNCj4gIHN0YXRpYyBpbmxpbmUgdm9pZCBtdGtfZGRwX2dhbW1h
X3NldChzdHJ1Y3QgbXRrX2RkcF9jb21wICpjb21wLA0KPiAgCQkJCSAgICAgc3RydWN0IGRybV9j
cnRjX3N0YXRlICpzdGF0ZSkNCj4gIHsNCg==

--__=_Part_Boundary_004_344717865.258120719--

