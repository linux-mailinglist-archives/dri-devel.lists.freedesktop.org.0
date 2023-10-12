Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC757C6C14
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 13:15:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3117010E03E;
	Thu, 12 Oct 2023 11:15:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4038F10E03E
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 11:15:29 +0000 (UTC)
X-UUID: a23ec8da68f011ee8051498923ad61e6-20231012
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=d5fRjRtO5F5L5P9Lx6Fha0h8vce0HZUs9GtNkhww5hc=; 
 b=hXNZMKf/lyiTjJ6jh20Ech5N111zVWr81uhtbPWBOamollRdTZR1aXhYBA/Hu3SsC74tEHBF8upGxidWwMVq/cv/8+cJW/7+7U4xNo1D5IGOmoduVDdJthWdCMR5HPS8LofBAZh9/DtNRVa52/ODWFs3kIAaVMgRfQIFvnlP67s=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:0f6bc0c1-aedd-4895-92cb-b7280e4d4cc3, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5f78ec9, CLOUDID:e4a90bc4-1e57-4345-9d31-31ad9818b39f,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a23ec8da68f011ee8051498923ad61e6-20231012
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw02.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 898407093; Thu, 12 Oct 2023 19:15:21 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 12 Oct 2023 19:15:20 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Thu, 12 Oct 2023 19:15:20 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PO9g04GaIpU8YS5B/nE7DUgTUOkIGt2+vAzVDAy+yNVFFAhx/4ittqS8TpH5SSZ4a5obsU70Q4pcGC/rhIouOFPYt5ihW/FuoGnFeyKctcJx2DS8ZulDckXURuID4FMv+c8YLf2H31FS5ssSIn9CZ+9nGJICHm+iALE6KFY3IYzmUW1XCN40G4RXQOzIro8ZVx2mOX4vfN4DRXnItYXqpL0gx4XyQEmYzrkzn2h9GNso6ffL9aapQejzr+kZBiylM4+KbxPBBRYmeKkfbvDLw8b9/tPk2vGwQAWLE0qXdidsICdMH7JJyoiSeDnkFrwCGLSdx4WPrYNPsqBZxYBr4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d5fRjRtO5F5L5P9Lx6Fha0h8vce0HZUs9GtNkhww5hc=;
 b=fwWeLaW78JEw/0x+4Oi01Jmx+B74ioXrtIzC/TSICxKNEYzjukqbca4yH37xWHCD2Q8tfRX+j8F8egWMHMtWGDREkkCcnkcQltbrzsZjv5doDqvXmC8n9ldItO2mdF6ix0eADeOph4I5R7HtlFxbIwuuu86XDwoTMIHTfJzca+UILQa86v9ojfj1VPMROK91WJRrLMZUCRfzaWocFvZORZm/zBJFpX4JRE37aWPPKeJpeAMMrqkP34GQTdTgycHwDlKRw+MjKpMR9dEjBcNt5wRtkBd4lXm6xc/S2wz2DD4u0aueBJFV9VfDAk/XfC+rCE4gxEHiEJcCSpSv3qi00Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d5fRjRtO5F5L5P9Lx6Fha0h8vce0HZUs9GtNkhww5hc=;
 b=ItKDSUoNukrjwuWrY3wKA5Fk+QCQqvPDmE40ySfl10/etvnQAnBmWZlGjoHfR6QWXxtYRO3iCIqHcKPIknYfO7l8s1yANec9by1ij4TesUVFZSDaRekFB6pBcbXkEkYzQtdyAQ6Ehmgi5M7mnpudaVXGL4bqTTFPD0XLOpsAtyo=
Received: from SI2PR03MB5885.apcprd03.prod.outlook.com (2603:1096:4:142::7) by
 TYZPR03MB5760.apcprd03.prod.outlook.com (2603:1096:400:70::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.45; Thu, 12 Oct 2023 11:15:18 +0000
Received: from SI2PR03MB5885.apcprd03.prod.outlook.com
 ([fe80::363a:e9b4:c6c7:48ef]) by SI2PR03MB5885.apcprd03.prod.outlook.com
 ([fe80::363a:e9b4:c6c7:48ef%7]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 11:15:18 +0000
From: =?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "krzysztof.kozlowski@linaro.org"
 <krzysztof.kozlowski@linaro.org>, "jkardatzke@google.com"
 <jkardatzke@google.com>
Subject: Re: [PATCH 8/9] dt-bindings: reserved-memory: MediaTek: Add reserved
 memory for SVP
Thread-Topic: [PATCH 8/9] dt-bindings: reserved-memory: MediaTek: Add reserved
 memory for SVP
Thread-Index: AQHZ5FgxjegLVruM7kG7VRoFLocLPrAVxRkAgADzaICAACUMgIAAHWgAgABe8QCACRiEgIACUqGAgCMkPoCAAAOoAIAARSCA
Date: Thu, 12 Oct 2023 11:15:18 +0000
Message-ID: <abefcc1c7e6143f1d8ff6b23d937056f34990359.camel@mediatek.com>
References: <20230911023038.30649-1-yong.wu@mediatek.com>
 <20230911023038.30649-9-yong.wu@mediatek.com>
 <20230911154448.GA1279317-robh@kernel.org>
 <c2f1df12cc2dc25b342029e49c6d3f120d380b47.camel@mediatek.com>
 <c62a7ed8-d80a-3a82-040a-d4c74a71285a@linaro.org>
 <95f9dd3b-1f33-4af5-8757-a97e8b9bb216@arm.com>
 <20230912155338.GA842444-robh@kernel.org>
 <a63ab61fbf4d2bdadeb68441050ff5187c93ba96.camel@mediatek.com>
 <CA+ddPcPFFpDA2qtxMg6BNztsXi3mVFRghBwe6556mAL54jB06g@mail.gmail.com>
 <8dbdb1e3e18cc290c8949947245b3c1eda83b6a3.camel@mediatek.com>
 <ac137ec0-3d52-4434-a8bc-91b250f28098@linaro.org>
In-Reply-To: <ac137ec0-3d52-4434-a8bc-91b250f28098@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB5885:EE_|TYZPR03MB5760:EE_
x-ms-office365-filtering-correlation-id: f6c139d2-04b6-46ca-ccb0-08dbcb14844d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Dc5mIb86vbFGbhniQ2VwuFh+zZHrBxXSIhVJsB91VRCVCA6PlcDtj+8G1SsC3Wmi4wpmKr08VmUZUw9rgUIFcCFZxV424yx3Rl5ufEw+JLx/Vs1adbqvuqOH/TKHEaS6953HynFbm/jigz53mFPDhHHSsLwFkCay/xYt/A29cMHBLNRqJqcc90EjBj1tR5J/z13Tcsot0yl8h191TE29zQeeXiVjXxcb/y5pCTrNS6FH1FjzfaW9WhkEjd4rKdah3yoAs42YHm3V0Gjqnz2SzZXiSdILKDxPE9UleyjIsWQ3I2tQrUdCyfdWr1QLIAjNO7491R4VSUwsZUwdkmj9kHqXiXb4JJhHWvEWTTZhT8RTixM0Y/OVHZIt2nk1j7qAOkuRBW0I8JNCi/y3+YP2L6fM6Z/dEvF7P0bM5vphwF9O+Ssf4tUokhblBlV5RpVKj0hwsczmhptbW/0YlvKWtKUp0EiuYaVNY/8OK1yoqeYcl9c3KKaD90kZyrgSLt14o8S2+8qAvi5U62nlOOKOxGvrcLpxlynCl+D3wY1AfWYZstizyz/RtN7lZ9G9rd4ROSiZ5yaXvL3nVFSdjFVx8OO5sndhjnRBR+dhCHTdNCwVKAn3Hq1oCVlpdTHPkrIU8j/zKqcxUKhnZcQH54N4wTlIyIDiTfA/dhajdVCbgkg/3sjWP1vAVyCk+he4AbJX
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR03MB5885.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(366004)(39860400002)(136003)(396003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(6506007)(36756003)(83380400001)(85182001)(54906003)(478600001)(6512007)(53546011)(71200400001)(66556008)(66476007)(316002)(38100700002)(6486002)(76116006)(66946007)(66446008)(64756008)(2616005)(26005)(110136005)(41300700001)(4326008)(8936002)(8676002)(122000001)(5660300002)(38070700005)(4744005)(2906002)(4001150100001)(86362001)(7416002)(99106002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?akFtaHFBdXlzL3ZEYmZGNGUrWk9nQnZZbmFYWFVGUGNjU05qdTVoaG9IdFJj?=
 =?utf-8?B?ajJERjRLam5IYVFBV0lkRTAyVjZ2czlZeFpPdHl5bnJ0ZGVFMUJhTEZjQjB4?=
 =?utf-8?B?UHpTSjc3aW5COGFyMkZwdFBxdFlZc3dXcDI3c3EzZlFKUkVscjdXWjZKd2pl?=
 =?utf-8?B?THFzak9JMkMvR252VFR5cC9sUW02UXBYZ1h2L1Y5dUUremdTUEpWckc3bDJH?=
 =?utf-8?B?Z3ZJczFEL2YzRzNvRzF2UTJiOHNWREpsbGRUQ1V5aTNyam5LTGo1aHlsSS80?=
 =?utf-8?B?aG5oZ0NnSG5FV2lGY054UEJqbkxZU3VHZGpSMHVoUWZaTGNJT2VsSEpxNkFS?=
 =?utf-8?B?UEFQb2J6VHlxRjF1QUxVbmM0T003SkxvYUNSbEpnRGZRSHAxUGMrUDk3NzFJ?=
 =?utf-8?B?TFJWb3RFbEZ1a1FMVEhkTjNERmpyaEVBU1JIeVVzMmNBT3UzUEtCTzNWY2l0?=
 =?utf-8?B?SHNxcnpQK3NjU0JWZ0VQa0pDblk4ZVRHa2FGVDRQRUN6YmFaY3VkVjdVTWs0?=
 =?utf-8?B?WGtDazBPWDZSbVBIS1FHbjBLZ1hHNUkrQUxQb2RvckVoZSsrYmZmc1RHZzNq?=
 =?utf-8?B?QnFTQ2d4TzB3UFdLNnNyMHVMekFlSXpDNVNlZTU3ajQwOWxsbXZhdXZVMElC?=
 =?utf-8?B?NEhUTHY0Q1dqa1UwMXFFRkNVS0NRbElsK3RTL1A5b0s0cW1RZzB4SW10SVYy?=
 =?utf-8?B?UXJmN3o4SXA4VnNUMFlsSHVpUXhBWmhuMVN5cDZwakpZTDg1WS9PNFVvWVU0?=
 =?utf-8?B?cnlMUzgva1Jod1pLdHljTG1HblhhYVZVd1JnVGlTUi8xOUUreDlHVVM5STRM?=
 =?utf-8?B?WEYrN042bGRDNEJCQkdJbkhOTXBMUVZWam1uelY0STkwdy95M0FTZndvb25M?=
 =?utf-8?B?NEp3WW5PVVJuOWwvbjlydHZ6am0rclBjcVZIYWYvR2JXd3NSRTl6K2NLNG9m?=
 =?utf-8?B?WDBYbGQ0UGUwL3c1aEVDS2hWZURTdEYyaGM1OHVRM3RhYTJZQXZObDhhR0JU?=
 =?utf-8?B?ZEZTNmJZS240QzliR1p0RVZkNCtMK2VxM1Z3MFdSZE5NNmlFRW1qNnFJNS96?=
 =?utf-8?B?ME52d29HY3UrbGMxU1JqNmdTS01qTkpxc1VxMlp5VTBHSjBmYS9WMUY0MnZq?=
 =?utf-8?B?NVlhMnQyRTdLMW5IRnQyZklJanBid1hBRDNiRDloZDNZdU5MdGZTY1pWZjFS?=
 =?utf-8?B?eGQxSXB4b29vYnZPVFMzTnBsdEVHdU90L21hQXBqcXErSjRuYndJUEZva0Ux?=
 =?utf-8?B?OXNJTERsUXdHT1BkUEEzaDNJdG0zUmNkNFFNOXV0QnNMT2NPL2gvaXBTbmFS?=
 =?utf-8?B?T0krWlVOYUc0WmZnTHpuZlZwMWNidGlvUXYvUW9tSXE1TzlYdVJ2T0RZK054?=
 =?utf-8?B?VUovNGg5V2xMVHZzbUJTRkZvc0I4WEp4WjBxTEF6ejBjL3FZWUlrT3prRk52?=
 =?utf-8?B?a1JRT0htS1VIRTFpN2ZxME5nK05xRDFTZ2JXV1ZXd0UxcURjSHVPVi9PeEZu?=
 =?utf-8?B?OEJseHhrdkFrZHJmZXE0NDlhQ2pubncvcm5WNUo3WFlTZG1rRllNZVdKYXdW?=
 =?utf-8?B?NlJyam9GcFo2Wkh5MjVwZmxCaTRxQmcrckd3WVgzem43Vmlnekd6bTgybVJx?=
 =?utf-8?B?SERqUWdkRXptcVFmeUhZTk13REhmVGdqb1FaTHJzMTJta3hyU3AzOXIzTURY?=
 =?utf-8?B?ZU0rb1VLYTBpbXZFNGZZNVJSa1IxMzQwQlp3Vlo1bDlVRWNrWXhBZnVmTEtt?=
 =?utf-8?B?NEFOUXloWUV0ekFobzdkT0Rqa3JDV3R2aTJGSnhla1psU2pEOThSMXZPem55?=
 =?utf-8?B?Q0Q4YUlmRmdVc0w1VHB1SU95anNwOUNDVm5SeHFYV2VKSGpIRGl6QVpCSEpl?=
 =?utf-8?B?L29lb3VRK0JEZGgyU3BvdjhFUm5DSVdxSW1zWFpRRVVuRzBHMTVuVmR3bWI5?=
 =?utf-8?B?SVpFcjBOelFha0E4Yzl5eWlCdUVSWEgzSEQrVFQrTDliempZRm15OTViSVdm?=
 =?utf-8?B?UzlGZ2huSUgxYkkxZlRLSnV0ZUZpUnJCdjkwMUtZN3FQQUE4TkVwKzlZQTFQ?=
 =?utf-8?B?dDlYUDlZQ250dFpxaTdkdjhyQVFSKzFvYk9lNTRYOWRtTlpxWHBTNFEveVJr?=
 =?utf-8?B?Vll6S0lmVGF6TSt5TXBtZ3hPL0pVTEowcDlPRVcwQ0RSOGRxb1ExUWUvTjFr?=
 =?utf-8?B?QXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <91B890F679E30C4EBCD651C706C8F98C@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5885.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6c139d2-04b6-46ca-ccb0-08dbcb14844d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2023 11:15:18.2432 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jrrYEQq5ikCro0yWO6xJgflc2P6u0O1Cd7+0uFoKxz3cTYcaKFv+c+e6PErQu+huFP7jMZjIm+fuWU7EqFhfsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB5760
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--15.484400-8.000000
X-TMASE-MatchedRID: TDQWNTPftUDUL3YCMmnG4ia1MaKuob8PCJpCCsn6HCHBnyal/eRn3gzR
 CsGHURLuwpcJm2NYlPAF6GY0Fb6yCifZYRtbOr2t5gCHftmwEMJ+S5m2/8VLmruLK9NZxo4JZvo
 +mFW19mD1MEWuQ5aoqRiKZm4oEbN2pUxzcSQ8HaTBVprK8rvWX98ZaRTF+TAgmyiLZetSf8n5kv
 mj69FXvAOkBnb8H8GWDV8DVAd6AO/dB/CxWTRRuyUIayx+Skid
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--15.484400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: FCAC2FBB16E9AB1FD123F7444485CD1E406C726DDEF358FA0D4B236AA36D4B952000:8
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
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "krzysztof.kozlow.ski+dt@linaro.org" <krzysztof.kozlow.ski+dt@linaro.org>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 =?utf-8?B?S3VvaG9uZyBXYW5nICjnjovlnIvptLsp?= <kuohong.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "jstultz@google.com" <jstultz@google.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "tjmercier@google.com" <tjmercier@google.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 =?utf-8?B?SmlhbmppYW8gWmVuZyAo5pu+5YGl5aejKQ==?= <Jianjiao.Zeng@mediatek.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIzLTEwLTEyIGF0IDA5OjA3ICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiAgCSANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRl
ciBvciB0aGUgY29udGVudC4NCj4gIE9uIDEyLzEwLzIwMjMgMDg6NTQsIFlvbmcgV3UgKOWQtOWL
hykgd3JvdGU6DQo+ID4gDQo+ID4gVGhhbmtzIEplZmZyZXkgZm9yIHRoZSBhZGRpdGlvbi4NCj4g
PiANCj4gPiBIaSBSb2IsIGtyenlzenRvZiwNCj4gPiANCj4gPiBKdXN0IGEgcGluZy4gSXMgSmVm
ZnJleSdzIHJlcGx5IG9rIGZvciB5b3U/DQo+IA0KPiBJIGRpZCBub3Qgc2VlIGFueSBwYXRjaCBw
b3N0ZWQgYW5kIEkgYW0gd2F5IGJlaGluZCByZXZpZXdpbmcgcGF0Y2hlcw0KPiB0bw0KPiByZXZp
ZXcgYWxzbyBub24tcGF0Y2hlcy1wYXRjaGVzLi4uDQoNClNvcnJ5LCBJIGhhdmVuJ3Qgc2VudCBh
IG5ldyB2ZXJzaW9uIHlldC4gSSBwbGFuIHRvIHByZXBhcmUgdGhlIG5ldw0KdmVyc2lvbiBhZnRl
ciBoYXZpbmcgYSBjb25jbHVzaW9uIGhlcmUuDQoNCkluIEplZmZyZXkncyBoZWxwIHJlcGx5LCB0
aGlzIG1lbW9yeSByYW5nZSBpcyBkZWZpbmVkIGluIFRFRSBmaXJtd2FyZSwNCnRodXMgdGhpcyBs
b29rcyBjb3VsZCBiZSBvayBmb3IgYSBiaW5kaW5nLCByaWdodD8NCg0KVGhhbmtzLg0KDQo+IA0K
PiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KPiANCg==
