Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D27A4823C58
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 07:46:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07D1610E392;
	Thu,  4 Jan 2024 06:46:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 258C410E05A
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 06:46:42 +0000 (UTC)
X-UUID: 00e5ddceaacd11eea2298b7352fd921d-20240104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=diEFun533xAAVtxovaTaqRp/hsCUtBLYK5UU5Z75rF8=; 
 b=WEvZiE6c296MWfwFe8KM8/DFkU3QThx74lSTvPQF6DnT/fTl0UGCCsRG96V54kVqS+3ywmwUM39KoM9rEYcQDFR5Hrw0ZUDgTMzNMc7QInf6O7EnDrG/ViyqcgsFLIp0f3N16CHqCxZq7T6++x2F8W1gX6I3VXCTqvtTpOIYa8k=;
X-CID-CACHE: Type:Local,Time:202401041400+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35, REQID:1c601250-a904-4910-8960-f19ccbb2062a, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5d391d7, CLOUDID:7e77f97e-4f93-4875-95e7-8c66ea833d57,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 00e5ddceaacd11eea2298b7352fd921d-20240104
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2045511851; Thu, 04 Jan 2024 14:46:35 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 4 Jan 2024 14:46:33 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Thu, 4 Jan 2024 14:46:33 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K6e2NYQ+0T1uAHcV7W54veMyyX2atbKJxPK2l/vINyZufkYpT1cJDWQJZtn2bHQngLt6UuBH0BBSjXwVxJfIiW0u/YB8bEyk0s+g9mq5geIeHuvVEokPZCB2CK0DduvyRIBk9huK/TWpl1a0US1mjhMyzimjN3loTOClTET70yEef7PvWjaxaJElpsd4nhGjvwaaswUq7y0ggnRN89gBpV/YiEHKxvn64JvPjhHRfduxvcEOx1QI76CiilZoj7+oZiMLJZFstsSUFu2bOKUwITvySH2dGbbSasneqUaDoC37rgXNsNRJFmT/c6Fs8mBepziXbCtZP2XOu+rqRE2Eeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HkvmCcesFMxoUMJ+J8Tk5aW86s7WGBOLQ5fuWWU0iyM=;
 b=A13PhN5c6VJExximpdMnPNGe2jcrIrXcljPtLLjZnDJPIP/TeTSwQfLK6w/k0Uv0ycmUXc+GQ7W12wrC0mea5NPV/qjnMLmSjWnE8Zj9zi3QyUpby0eBYPktIQhiO/KoowdNwOk3Q7R10BpdY//3+2r8XmXozr7WL2pTFj4kxgbGj5Xu0Ny5jByMjCAhNlPdCcYjWG5PHyYLtTNH+cT7cnhWduZfj/fvvpWPPAFxtQ/ADYIg8bicl0jvS4gI8c0hNOexAt6H7Ip1MTnTZH3NbQTETkBFQZS0kHoc5hOB9A3kwmAI15wjWSjOTCOEdu0RO5J+AZ38chEQujLCfBomMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HkvmCcesFMxoUMJ+J8Tk5aW86s7WGBOLQ5fuWWU0iyM=;
 b=bVcag7vi+gDXLUOHmOUdzkLTV9Bo0TnGWvJvtvVwLhjdBGf88DWipFwx46bFzg0K3HGsjDsRYiU69TqwATSUkuWafqXXOwh3/fZoAS2NLfNMVqi0UOa2mggcReb09zN9zYZEch9JlR5M8EhCIwGdjnZ1ohaZKS47nQuXkT7jKhs=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KL1PR03MB8373.apcprd03.prod.outlook.com (2603:1096:820:13b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.14; Thu, 4 Jan
 2024 06:46:30 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::eb43:57cb:edfd:3762]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::eb43:57cb:edfd:3762%7]) with mapi id 15.20.7159.013; Thu, 4 Jan 2024
 06:46:29 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?TWFjIFNoZW4gKOayiOS/iik=?= <Mac.Shen@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?= <jitao.shi@mediatek.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] drm/mediatek/dp: Add the HDCP feature for DisplayPort
Thread-Topic: [PATCH] drm/mediatek/dp: Add the HDCP feature for DisplayPort
Thread-Index: AQHaHrPjdunoffcOCEGmErF8vNrJIrDJdhQA
Date: Thu, 4 Jan 2024 06:46:29 +0000
Message-ID: <1343a774e6b0841a5de4520916c3f6761eb683d8.camel@mediatek.com>
References: <20231124085346.26602-1-mac.shen@mediatek.com>
In-Reply-To: <20231124085346.26602-1-mac.shen@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KL1PR03MB8373:EE_
x-ms-office365-filtering-correlation-id: 5f122158-194e-4e6f-c3c6-08dc0cf0e186
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kKBO+V5qf87XJPlDrUnErmeFT9EKzVG2TMdm8OEcjO6GMS4BBjqzwL6HVk7nGLiL0VkPivO4Jy41lb63FUfQRphXwlQdJpxJ05ZOr3nRO3iwyOxh4BRkSgnTCj20UC8c2VQGAxzDufr4TwH68ggI2R8lkwbBdGNuhJsa7b0rNxOvQk0Slh1EcgPMWeBhKEHGmD7IfFU1DUil81b/qLJ6WZ5mxS7yXvu5aNaGR7KD5/qnvwzE3WkpcWhqdxK5EAPXQv42+6XecFPTxum04RFuyTwLLO8SeZBukXESzoYUzcdi+Ek7H+tA44fV0odCCl+uVq5/vXmSMzK9sxDECP8Be2jCHva5CwUhO6CvgTjMRSfOoIGU+8zpEgl/Q6bvsQiw30fsh4YW8Y3NZ24bVqeW702JPgR3RHDjwutMrBdpeJSf1jgHWcYqH8afiPaHrWhZDwVUSLuoamhB4YZl+7TIec6cxkHTIV4GiT/eHIpTYlXXtBIOE1f3a7QPl8B5EIplD4n/hBoabfL2PLJFzJhKaGPDzcDAT5MQP0BDtb8pnjj44ooqt5L5z87VoNwJ3k7PVXNEEYmO48/M4G8izMQpvwwCowR68wbODEkvQzLA0MGu1n+DMn2fgoJvrX1NfROic0l7H3IAawl+Vfc27eaOSnCvhR+NnYupZnWUKni2ZkE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(136003)(396003)(39860400002)(346002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(122000001)(36756003)(85182001)(41300700001)(38100700002)(86362001)(2616005)(107886003)(26005)(38070700009)(6512007)(71200400001)(478600001)(8676002)(8936002)(6486002)(316002)(54906003)(110136005)(6506007)(66556008)(66476007)(66446008)(64756008)(76116006)(4001150100001)(2906002)(4326008)(7416002)(5660300002)(4744005)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a29nbm5wb05xa2llam8wZmlOc3hGVUlsK2twVDEyV2FKb1h1cTNPclF1Mm4w?=
 =?utf-8?B?UE5OdlhGZWF0MHQ5cUhaakw2Z3A3MGZub0hUbFZyVkZnVVo3a1ZlVWd6TGZB?=
 =?utf-8?B?cCsxY1MvaU9KdUoyQ3g1ak1kNzRPQ0NGRS9QWlVtVEp6YlRUUHUyaHhTQjNN?=
 =?utf-8?B?VzJuNEU1Yms0aU4zeGJRODgxMEhOOTh6QWliNW9PZW9Oek5heW44dkdOVHJm?=
 =?utf-8?B?SXFjR0hMd0lwT3NpeVhNa1V2OG5ub2NZUjBhSWlIL3h2UFMxZVE0enBLakJX?=
 =?utf-8?B?R2tXQnZMbHBHZWhnNk5GUno4MExxdW16djUwTE50d0pGakFTbGY5cmdJRHB5?=
 =?utf-8?B?dWxZaldlOTA2d1Z3Q3ZnOUZSbEpUVktnTGFjeHpTOG9pOC8yUk5OOENTREVG?=
 =?utf-8?B?QTJPdkZKWmFaSTduVDU5REFiR2xCNUlEVEVVdW0wUmlLVzRyejBPRXZZUXlS?=
 =?utf-8?B?cGpDOFVIcHU5QjlxSHhOSUZiaXhhelgzTm5uU05JeFZzNWxrU05BK1FwNEpD?=
 =?utf-8?B?bitFZnFkZ0FtRGpKc2grSGRKbVRMVzlwWXFxOEVFM0taQzB2SFFKeDAxdmxW?=
 =?utf-8?B?U2RZZkc1M2FTQ3VJTklWUldDcy9KMkhMU2VoazQ0ZzNOM2lEdU9pN3JxaFpv?=
 =?utf-8?B?VVl5NDJ5UVFGeUc0em1waWl5Ulg5WVNHQ2QxNWhJd1BWZFFVdFpVcWZRR0g4?=
 =?utf-8?B?TTBCSjd2WVUyM3FFSmNHR0tUd0JPRzVnWitPd0x3d29zU0VZUXNSaHFsUURx?=
 =?utf-8?B?VEM2cWZYcFlnVGtIbng0YytRSTNUZkNIM0Jxb1grRyt5dlVPU2tIRDQvZ3pG?=
 =?utf-8?B?OUh3MEs3QUZOV1lxVjA3dGtvbko0Nzhaai83WmNWemVRYkJpVi9iU1hwN01n?=
 =?utf-8?B?WHZMdGZDdEk1eFJvcFMxTlFYUzd4MUZENUhKT1N1STFiOW9CZGJtSTlPZnlJ?=
 =?utf-8?B?eG9vY2k5WTRCYlhOak9jK000dy9vMG1XMmZRRms1dzhUb3BHdm90M20yb3Jk?=
 =?utf-8?B?dC9pYWQvNHJ6MXdkZXRMQVVrTTdIQjhNRERIMjNFVXBDRkZwWTBLVGV4aDBU?=
 =?utf-8?B?cWtCM0E0STRrTWgrK3lSUGdSMHh1aTl1VjhjRmJ2YjFnVS8rSXBvZDg5eFBw?=
 =?utf-8?B?ZW5jZFR4V1RyZ1A3NmdlUHNQQlV5L2dkRk5qbmhERmFuOE5IWG14V1ZFaE41?=
 =?utf-8?B?dkRqNXpodnVyajV2MGMyR3VyRHJ2WGdCaFNiaEV4RzRRakkzeEZUTE9aOHhu?=
 =?utf-8?B?TEpmVnppRlUxMzNvbGZEN1dnQ29Bc0RIcG9aSHJ1aVBmS2thK24wK3NHRlZo?=
 =?utf-8?B?bjVNT0NncDlaMWw4N2dqb3ZTZXpvQXA3WTdjeWFGY0lsbGE3MjVxNUZReDJr?=
 =?utf-8?B?UmN2cFBGSWk4aVRtNHAwTUsxZU1CNU1HUWxucHFCSGFiU3dPcFB5RWx0Mlp1?=
 =?utf-8?B?SmVSQVhZUXZML2oyemdHT3pyejgwaUVpM3gwL1RpUUV6N2lXMjZLUlgrNTlk?=
 =?utf-8?B?UXlBdzFOMUh0WTBZNndvQTNhT3ZTcmZVUEtEMGtIdmRBS3RPNk1ESkJQSW1S?=
 =?utf-8?B?U2tCVVk0Yys0ZWhVMVU5UXMrTzk1ekt6a2pFOVg0TWtlQVNXbmF3M05ZaCtB?=
 =?utf-8?B?ZG9wckxGWXZHN3AwemRIOElWM1JSc2lmLzdkRzh1Z2ZvcStwWGhQdVNJTW5v?=
 =?utf-8?B?NDdRbnFvdHk1OVo5OWx3NnF6ZEJpb3pwN3RwL2duR1lhWGhBUDhkRmZYbUZr?=
 =?utf-8?B?cTVQVk1mR1pmQXh6ZHd2UFRYOEpndnNFdS8xU0dNMERTMkxGV1krR3VwaTNh?=
 =?utf-8?B?YnJ3eGVZcUNQZ2FoYlA0UUtGNnRkWlBFTjF2UFJ5Nm44OXBqNkNOMlBPYXE4?=
 =?utf-8?B?MjZkZFZlR2hzb25QY3BsWnhZNUR6WVBLc29aSzNuWVpHdXFDc0NYNW9oUDBG?=
 =?utf-8?B?RG4rL2N0d1c1WUR4djVlM3dyU2s4aUxiamFaOHBzUzFVS3lMRFFlcTVMaXF5?=
 =?utf-8?B?TFVzSHBrblZLcTlmSlIvcFQxcWdNVC9VM21vWEFFdmNMVEJsRkRUalprUWov?=
 =?utf-8?B?RmUrZjdwVmp4bzFVTHFtQ21EM2wyeno5MjNRTndtQXJodlhLczF1WGhTVmNy?=
 =?utf-8?Q?ShzTSDHhay4aZtEg9EairezS7?=
Content-ID: <4A68755E5E92994EA8F548EEE1AE328B@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f122158-194e-4e6f-c3c6-08dc0cf0e186
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2024 06:46:29.5095 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ih0v+YODNGsB/WzU9Wo4vaaYvOhq4+8WYwATaJAxiYzf7WZc/mael/953jyC229JmT4BKPX3uo6Gl/KP3069rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8373
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--12.767600-8.000000
X-TMASE-MatchedRID: 7ySqCuYCpfjPaPH51LTU5Ca1MaKuob8PC/ExpXrHizxcKZwALwMGs8uj
 Rkt05a7cM2MQQW7DL3i1q48Rh4wr9en2wHlv5vGu4RtSDjG+z7AHQj6IJQ7jnfgnJH5vm2+gFWo
 Asts4LpWHCK0k/G3OkbpjAjMHHtZlQv21zJNl0CyDGx/OQ1GV8l/EokdYvzRR+gtHj7OwNO2Ohz
 Oa6g8Krbbfr/V9q3MCOvREmEeeswjJyH8dhqdTBL7mcMMkg2fh5pNs+y03i6U=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--12.767600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: F518FCD252E3E6500CC3CE4F83F59ADFDC0F8C7088EC440D7838783AA178D79A2000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_003_1518251567.870228649"
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
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?utf-8?B?U2h1aWppbmcgTGkgKOadjuawtOmdmSk=?= <Shuijing.Li@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_003_1518251567.870228649
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtNYWM6DQoNCk9uJiMzMjtGcmksJiMzMjsy
MDIzLTExLTI0JiMzMjthdCYjMzI7MTY6NTMmIzMyOyswODAwLCYjMzI7bWFjLnNoZW4mIzMyO3dy
b3RlOg0KJmd0OyYjMzI7QWRkJiMzMjt0ZWUmIzMyO2NsaWVudCYjMzI7YXBwbGljYXRpb24sJiMz
MjtIRENQJiMzMjsxLngmIzMyO2FuZCYjMzI7Mi54JiMzMjthdXRoZW50aWNhdGlvbiYjMzI7Zm9y
DQomZ3Q7JiMzMjtEaXNwbGF5UG9ydA0KJmd0OyYjMzI7dG8mIzMyO3N1cHBvcnQmIzMyO3RoZSYj
MzI7SERDUCYjMzI7ZmVhdHVyZS4NCiZndDsmIzMyOw0KJmd0OyYjMzI7U2lnbmVkLW9mZi1ieTom
IzMyO21hYy5zaGVuJiMzMjsmbHQ7bWFjLnNoZW5AbWVkaWF0ZWsuY29tJmd0Ow0KJmd0OyYjMzI7
LS0tDQoNCltzbmlwXQ0KDQomZ3Q7JiMzMjsrc3RhdGljJiMzMjtib29sJiMzMjttZHJ2X2RwX3R4
X2hkY3AyX2luY19zZXFfbnVtX20oc3RydWN0JiMzMjttdGtfaGRjcF9pbmZvDQomZ3Q7JiMzMjsq
aGRjcF9pbmZvKQ0KJmd0OyYjMzI7K3sNCiZndDsmIzMyOyt1OCYjMzI7aSYjMzI7PSYjMzI7MDsN
CiZndDsmIzMyOyt1MzImIzMyO3RlbXBfdmFsdWUmIzMyOz0mIzMyOzA7DQoNClVzZSYjMzI7dG1w
JiMzMjtpcyYjMzI7ZW5vdWdoLg0KDQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrZm9yJiMzMjsoaSYj
MzI7PSYjMzI7MDsmIzMyO2kmIzMyOyZsdDsmIzMyO0hEQ1AyX1NFUV9OVU1fTV9TSVpFOyYjMzI7
aSsrKQ0KJmd0OyYjMzI7K3RlbXBfdmFsdWUmIzMyO3w9JiMzMjtoZGNwX2luZm8tDQomZ3Q7JiMz
MjsmZ3Q7aGRjcDJfaW5mby5oZGNwX3R4LnNlcV9udW1fbVtpXSYjMzI7Jmx0OyZsdDsmIzMyOyhp
JiMzMjsqJiMzMjs4KTsNCiZndDsmIzMyOysNCg0KdG1wJiMzMjs9JiMzMjtkcm1faGRjcF9iZTI0
X3RvX2NwdShoZGNwX2luZm8tJmd0O2hkY3AyX2luZm8uaGRjcF90eC5zZXFfbnVtX20pOw0KDQom
Z3Q7JiMzMjsraWYmIzMyOyh0ZW1wX3ZhbHVlJiMzMjs9PSYjMzI7MHhGRkZGRkYpDQomZ3Q7JiMz
MjsrcmV0dXJuJiMzMjtmYWxzZTsNCiZndDsmIzMyOysNCiZndDsmIzMyOyt0ZW1wX3ZhbHVlKys7
DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrZm9yJiMzMjsoaSYjMzI7PSYjMzI7MDsmIzMyO2kmIzMy
OyZsdDsmIzMyO0hEQ1AyX1NFUV9OVU1fTV9TSVpFOyYjMzI7aSsrKQ0KJmd0OyYjMzI7K2hkY3Bf
aW5mby0mZ3Q7aGRjcDJfaW5mby5oZGNwX3R4LnNlcV9udW1fbVtpXSYjMzI7PQ0KJmd0OyYjMzI7
Kyh0ZW1wX3ZhbHVlJiMzMjsmYW1wOyYjMzI7KCh1MzIpMHhGRiYjMzI7Jmx0OyZsdDsmIzMyOyhp
JiMzMjsqJiMzMjs4KSkpJiMzMjsmZ3Q7Jmd0OyYjMzI7KGkmIzMyOyoNCiZndDsmIzMyOzgpOw0K
DQpkcm1faGRjcF9jcHVfdG9fYmUyNChoZGNwX2luZm8tJmd0O2hkY3AyX2luZm8uaGRjcF90eC5z
ZXFfbnVtX20sJiMzMjt0bXApOw0KDQpSZWdhcmRzLA0KQ0sNCg0KJmd0OyYjMzI7K3JldHVybiYj
MzI7dHJ1ZTsNCiZndDsmIzMyOyt9DQoNCjwvcHJlPg0KPC9wPjwvYm9keT48L2h0bWw+PCEtLXR5
cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlh
bGl0eSBOb3RpY2UgKioqKioqKioqKioqKioqKioqKioNClRoZSBpbmZvcm1hdGlvbiBjb250YWlu
ZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBt
YXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNl
DQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50
ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChz
KS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRh
aW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1l
bnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFu
ZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50
IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlz
IGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkg
KGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBv
ZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lz
dGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBh
bnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_003_1518251567.870228649
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIE1hYzoNCg0KT24gRnJpLCAyMDIzLTExLTI0IGF0IDE2OjUzICswODAwLCBtYWMuc2hlbiB3
cm90ZToNCj4gQWRkIHRlZSBjbGllbnQgYXBwbGljYXRpb24sIEhEQ1AgMS54IGFuZCAyLnggYXV0
aGVudGljYXRpb24gZm9yDQo+IERpc3BsYXlQb3J0DQo+IHRvIHN1cHBvcnQgdGhlIEhEQ1AgZmVh
dHVyZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IG1hYy5zaGVuIDxtYWMuc2hlbkBtZWRpYXRlay5j
b20+DQo+IC0tLQ0KDQpbc25pcF0NCg0KPiArc3RhdGljIGJvb2wgbWRydl9kcF90eF9oZGNwMl9p
bmNfc2VxX251bV9tKHN0cnVjdCBtdGtfaGRjcF9pbmZvDQo+ICpoZGNwX2luZm8pDQo+ICt7DQo+
ICsJdTggaSA9IDA7DQo+ICsJdTMyIHRlbXBfdmFsdWUgPSAwOw0KDQpVc2UgdG1wIGlzIGVub3Vn
aC4NCg0KPiArDQo+ICsJZm9yIChpID0gMDsgaSA8IEhEQ1AyX1NFUV9OVU1fTV9TSVpFOyBpKysp
DQo+ICsJCXRlbXBfdmFsdWUgfD0gaGRjcF9pbmZvLQ0KPiA+aGRjcDJfaW5mby5oZGNwX3R4LnNl
cV9udW1fbVtpXSA8PCAoaSAqIDgpOw0KPiArDQoNCnRtcCA9IGRybV9oZGNwX2JlMjRfdG9fY3B1
KGhkY3BfaW5mby0+aGRjcDJfaW5mby5oZGNwX3R4LnNlcV9udW1fbSk7DQoNCj4gKwlpZiAodGVt
cF92YWx1ZSA9PSAweEZGRkZGRikNCj4gKwkJcmV0dXJuIGZhbHNlOw0KPiArDQo+ICsJdGVtcF92
YWx1ZSsrOw0KPiArDQo+ICsJZm9yIChpID0gMDsgaSA8IEhEQ1AyX1NFUV9OVU1fTV9TSVpFOyBp
KyspDQo+ICsJCWhkY3BfaW5mby0+aGRjcDJfaW5mby5oZGNwX3R4LnNlcV9udW1fbVtpXSA9DQo+
ICsJCQkodGVtcF92YWx1ZSAmICgodTMyKTB4RkYgPDwgKGkgKiA4KSkpID4+IChpICoNCj4gOCk7
DQoNCmRybV9oZGNwX2NwdV90b19iZTI0KGhkY3BfaW5mby0+aGRjcDJfaW5mby5oZGNwX3R4LnNl
cV9udW1fbSwgdG1wKTsNCg0KUmVnYXJkcywNCkNLDQoNCj4gKwlyZXR1cm4gdHJ1ZTsNCj4gK30N
Cg==

--__=_Part_Boundary_003_1518251567.870228649--

