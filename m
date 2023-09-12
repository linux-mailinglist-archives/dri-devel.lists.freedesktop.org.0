Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E42B879CA9C
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 10:52:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1303510E3C7;
	Tue, 12 Sep 2023 08:52:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DEF810E3C7
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 08:52:21 +0000 (UTC)
X-UUID: abc27cda514911eea33bb35ae8d461a2-20230912
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=ZHBVaVLDNHmw4wdKZLrsRQ8vgR9xW0fPmXOQLFAFMNY=; 
 b=jtdXDTjN212JoE7+IVm3XphVzADmjP8NrOTajmFf4Z+ujiI7S1hBrJbB+j643LB2j3Zrdfl1JwOn0SW5XNLPQ5tE9NM+8DRdM5hgUWJbFLZ4QuEEqVHoa67G9HdkbvnsWmQc0qzBy8Yq5hUfdr7EcIMUi7y3NZaW3B1vpzF7Y68=;
X-CID-CACHE: Type:Local,Time:202309121647+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31, REQID:2fb8f144-7c61-4fab-afa2-40453af056c1, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:0ad78a4, CLOUDID:0799bdbe-14cc-44ca-b657-2d2783296e72,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: abc27cda514911eea33bb35ae8d461a2-20230912
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw01.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2058944229; Tue, 12 Sep 2023 16:52:15 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 12 Sep 2023 16:52:11 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Tue, 12 Sep 2023 16:52:11 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SPmoz9D2DtmXo1V6MXO7GxGokG4GXP7aciPQZYvDqAL0w54vbh1QVJSwRboJr+zja2g45EG4HirfA9x29BBjoT4VV816pTiHTfnGb8k0OyMWdqXO98TW4ogjiE58wG1KyAo8e+2XU78gfLOjAi9oZDemi6jqEV7WVxTMY824bvoFCmX+u17mNrvbuSBkty4hljYEM4x0EkbNJxs1Gvq8bRb49LlkeGZVmhkK9b78muqjS24T5deoW2n+8Et3sXTJNq016weRaGUlmExNHxC1n20H7UftJkOsOBzAQS6RCvzuT/f5mEnSKIddpSaDIo51coyMFZE+ChyO4dtIhTC9xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZHBVaVLDNHmw4wdKZLrsRQ8vgR9xW0fPmXOQLFAFMNY=;
 b=XpDNyW3QVSzxGnbPXOw5o4N1lRpO0I+sBPnrmIB44THTRTkl2GjewFV4v2+wJnWdXYJAL5nhb/YJDuUWqVMrCUc9/GVBIXGW+DAPzNNzWLYwfL6KFbYPXey8GyNL2kUybGhuxiEosFkhbBA+GHhic9u9RcpFlvvYgi/0Bj9547pyn6zBV+v+305lqUKAfIxikWAA6kcNBWOZXkxdAuN6KU3vRNTgxSY+q2EJzcjYPxmkUbQa52jUqOlIZ0AwAcYVoJsRGaUYYdw70etwmUCZtI42J/WzsCcdj6TSzJotMXeuowBkb6WEy+VJh6l5MsP9e+CypkIiN5/8XpbizayEZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZHBVaVLDNHmw4wdKZLrsRQ8vgR9xW0fPmXOQLFAFMNY=;
 b=Bh+Emcsjqjs00mn2fuSZXljOC1HO8kYpGLPCb4+W/yP1elmM5uZ9NFpCk0JHcuj0YxIe5hzXCYVcR357KtFhITr2vAeLSjjp3vyLmJLLz00+xSACUWQ3leS4ii0xp9pe5o8E/YPdEk9Avca1WQ/YTsB9cXO4elq2IfUhwcHUCu0=
Received: from SI2PR03MB5885.apcprd03.prod.outlook.com (2603:1096:4:142::7) by
 SEZPR03MB7659.apcprd03.prod.outlook.com (2603:1096:101:126::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Tue, 12 Sep
 2023 08:52:09 +0000
Received: from SI2PR03MB5885.apcprd03.prod.outlook.com
 ([fe80::e148:3390:1eb2:28e3]) by SI2PR03MB5885.apcprd03.prod.outlook.com
 ([fe80::e148:3390:1eb2:28e3%7]) with mapi id 15.20.6768.029; Tue, 12 Sep 2023
 08:52:09 +0000
From: =?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>
To: "jstultz@google.com" <jstultz@google.com>,
 "ckoenig.leichtzumerken@gmail.com" <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 3/9] dma-heap: Provide accessors so that in-kernel drivers
 can allocate dmabufs from specific heaps
Thread-Topic: [PATCH 3/9] dma-heap: Provide accessors so that in-kernel
 drivers can allocate dmabufs from specific heaps
Thread-Index: AQHZ5FgOSAh5MZm7Ik69mQtVpHaxabAVaJ2AgACKb4CAANN/AIAAHZcA
Date: Tue, 12 Sep 2023 08:52:09 +0000
Message-ID: <255ae6b9ac1b6bea9262069747824b8461475e70.camel@mediatek.com>
References: <20230911023038.30649-1-yong.wu@mediatek.com>
 <20230911023038.30649-4-yong.wu@mediatek.com>
 <803846bc-fd1d-d2ec-2855-456af22c82f8@amd.com>
 <CANDhNCrQyiFZ+8DnG0iyKBXC0H1698K1a9d2AxOq4whDsZBn+Q@mail.gmail.com>
 <23e71d1f-08c1-3834-5b1f-2b5714c7bfaa@gmail.com>
In-Reply-To: <23e71d1f-08c1-3834-5b1f-2b5714c7bfaa@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB5885:EE_|SEZPR03MB7659:EE_
x-ms-office365-filtering-correlation-id: b320308e-dab2-4498-aa7c-08dbb36d8c90
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: k1qPqTymWX2l3Yzb45xjVlj+ihrv+Kf80OoOiMXQXGW5qGtMkShgGEX67Q0MlrhbbjvxJJNPJcc4ZTZvJ7NcFY7TYStzS2UEWZ+vgv8H91cXQAE+3GjmMxtugL3YncGgBA2E3bSvdFW7aCZXTzElUM4UYlnHOgC0hFjd2jUhmVAxRbZnX99bw/fpgp+fNmgmYLwVrX6vZg7vYL3wmx6OkgDaMTtcfD1PjFux7WUdFPPkUSWoCu7mHwWZtmLqxJKHQuWmY2vRgunVMpZ4z/h3nTV/YfhdEvnh2lclsB/+g87eTK27NEFoe6f8EbNwDfTJi86x0tNbNYjMmxOc8VSiERXH17eMHryytAu4R9rwPgI0i05wHMxrHPHlu3QybEwmx6sh7ce/CrDkO9NRVBpDiAe7Yj8C9Z6IqDKJWLmHN/pH2uITam1loXCpAuQcy0Pc18Sr7JxiaePArDkvBNQriaJD4PZIiEe9KwgqtUp5cCrM5ctnaE3Cdjp7j6d8hhTzUJOvDxGZOu3/ToVN/DlA2E/q7x9V1hbvwkPgsBQ05TrFOBHAmp6klo0OXWnsUwhdijerqfbqJB9I/aSFcCjF21FkShrDkgu92cuwXiPiYmEXQWdehqVr6Xr3wx8VGcfSp5aWLqkv6YbwVFgABQbV+4ZkBMW8JD+GZhe4+05reuUwy58pN7Evl09BzNxha/C4
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR03MB5885.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(396003)(376002)(136003)(39860400002)(186009)(1800799009)(451199024)(66899024)(122000001)(71200400001)(6486002)(6506007)(53546011)(36756003)(85182001)(38070700005)(38100700002)(86362001)(2616005)(26005)(66574015)(6512007)(966005)(478600001)(83380400001)(110136005)(41300700001)(5660300002)(8676002)(8936002)(4326008)(316002)(2906002)(66556008)(66446008)(7416002)(66946007)(54906003)(66476007)(64756008)(76116006)(99106002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cUpMN285bWhmTThZTzk5ODY4eWlFWENsQmdVVEo4aTlsWVZrc2lpaHZuT1Q1?=
 =?utf-8?B?WjBTSEgvbHhIL09uRHBvUGcxbm5ZYTZFTjRqS2NpWGNQSEtrYmVweGtadGJW?=
 =?utf-8?B?Snh2QmkyalJUYXM3cSttWGpndDg0dUR3REdZWXEzMzFMR2oxdkhxYSttWmlh?=
 =?utf-8?B?TDQvTGdmYmxOc1hkNHFTVkJObFFxQ2MyRFc5RE4vMGs3ZUZ6b1FsS1FMc3dM?=
 =?utf-8?B?YVA0R0MwRnZpQjI1d25BQ3dvbmdjdnZucUQyVFBEeVZHL2dVS09WU0RlOWpV?=
 =?utf-8?B?SWNUVGh2V0xJUVo2eGRzTE5ab2RHOGlROU1LTDlTZkRWeEhkSGNkelY3K2Rt?=
 =?utf-8?B?Y2VsckJLVlpzRFJCSFY3YktnUkxtMWNBelNiSThFYU0vMTJza1YyUTdkT1p4?=
 =?utf-8?B?VEJTaXdjZTdNOFM3SXBTK3VzV0g4eU56S2UyeG9rSTRyVjI3MVRrTmVsUEhh?=
 =?utf-8?B?cXBTSmRvRzJkOEZBNkJYVW9YRXpSRGw5TVhJeHVMSEJabmVuWWlIZk9wMVc2?=
 =?utf-8?B?U3VuWVZKUVhEaUNHQ0txSHRjbHJQbnhURWkrYnVhaHBvam15c01QcExHRmZh?=
 =?utf-8?B?ZU1COHVFRDlSUW9YVkJ0WlpyRUZNdW5UN2l1UE91SDZPSnpJZ0IxL0pCS3ow?=
 =?utf-8?B?YjNzaUNiT3didS9UdmVsUjNPazU0V3A2U005aytHYzhTL3RlaFRlc0lSN3VP?=
 =?utf-8?B?L29jZXFXNytsSmlDZmpOUllkT3NodHhZbXFvZDYzakRlTEgrMHR5V0I0N2RV?=
 =?utf-8?B?cVdpSC9zL2JNQUR0VFJOdG9TMFYzdk9LeUsyZXVJejNNRjZUcEJReWRHK2JO?=
 =?utf-8?B?UGpDczl0d2U0QjdPT3g5VnZoNEM0ZjE3NWgyOHcrVEozRGFucm5OUFAxMktB?=
 =?utf-8?B?NmErcGlGNUJmc09qOHdNUjhKNy9xaUhWbm9VWFRBUm5KdndVSUdCQUlQcGtG?=
 =?utf-8?B?ditGRFZ1a2loZWlCY1RSVUEvckxTQVYrZVRXeFpsRFlBTmVRUXVxVWw1eSt0?=
 =?utf-8?B?VmZaa1k0R2Fvd1BDMzNESjBtcWxqVHJpa2d0NHNSeWNISjdIY0hja21HcjQy?=
 =?utf-8?B?eUgyb2pHb2hoSC9uRnhDWklmR1U4eG9UVU1KbHgwcHROcnA1YW1CaFVoTmZN?=
 =?utf-8?B?MDR4akdTQkdNYTU1cEVVU2YrSGs1amJoTnV4Umc1SlcvZXI4R2RERmlCcEFT?=
 =?utf-8?B?MEZhOS9KKzJiRkp4a1ZPRGtWK2lwMW4zanpOVHFNZ1BYNkFiUExTTXVjd08w?=
 =?utf-8?B?YkFvRCtFQTlJV2JmeFk2ckhrYU9hNDZEWStKbmNQTVBNSE9BZjVRK3lDNGcw?=
 =?utf-8?B?eHRFWVBqQU8rN0gvdHhtQUh4YTB2UDFKUCtxWldCdXZaZnFnTllVVXVxTG8z?=
 =?utf-8?B?bWZVaitKVzFpRTFNelQ0bkNIUERUbWtad3UxOXJlMDB3S1g1NUpmN1NOMmw5?=
 =?utf-8?B?OXl2QTZSOHkwd0FJeXlNT0JLdXBpcENNbWlCMHQvWnpRK3FyUEJhN29OSGtQ?=
 =?utf-8?B?emtlM2pxdVlKVnF3YXo2Ti8zQnBiVnlmNVlXMkxndDR3ZEY5amlCZ3JnRGR0?=
 =?utf-8?B?a21ndXh2cU42TWFsUUs2THAxZGt5d2c2eExQdnVTNlF3T0lGeUdFU1RQbkRh?=
 =?utf-8?B?MDh0T29OQW5IM3VVWnpRcE10Zk9JSVU4ZDR6K1A2S05DQ2tGdzl4dFZ1Slcw?=
 =?utf-8?B?cEIwY1M5cE5hdjU1TkZjbjIvS3lFV3g0NHhhNE5jbFAxalZYUWl2cGlKazBz?=
 =?utf-8?B?QnZaMVJxQmNQdW1FK0dtcmZZc0xJYlVBSGVaWXlSaEVzMHFzTFhsNHBOcW1C?=
 =?utf-8?B?M1VMZnlzdVd2eE9ldXptOG5lUTRpb2JLcVBkTnZYbng2MmYzbU4rak9Tdzd5?=
 =?utf-8?B?Vm9IZVg0VzJBa0hEMzZpN2dmYUNtSWQwd0Q4anNiVStLZkVtMmMyV1JKRmUy?=
 =?utf-8?B?cW4rYmxmbVR5c1RibzkvM3hlTkd5RDJtb2J6cFh4WHBPdTdEQ0dJN2tHZGpv?=
 =?utf-8?B?a3dHb2syRldNNE00Ri9TYXV2djJ2MHM5Ukx3c293dGpTdkJMMG9CeHlMaEZY?=
 =?utf-8?B?UEdFaFdqSU9veXdCRDdwUEI4Z2dlN1ZYdXZiTHRybU5oYWlRaXJsV2pSSzFo?=
 =?utf-8?B?aENaRWRRVzFoMFlGQ2VsUVpHSFNLN1BNeFh3VytTd2UwS05BRzRoZjNQdHQ2?=
 =?utf-8?B?Y3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A862AD773E056F4A8F6E2D58D1C61032@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5885.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b320308e-dab2-4498-aa7c-08dbb36d8c90
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2023 08:52:09.3886 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o64tL3zfoT/9sX2JZh36TW9Rdcz8hdp/1l43LJR1thQxFqFcisicrbzXdOZ2/2IIVPHYbmB695LrGyiIGQobQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7659
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--37.038100-8.000000
X-TMASE-MatchedRID: ediyJTvK8erUL3YCMmnG4ia1MaKuob8PCJpCCsn6HCHBnyal/eRn3gzR
 CsGHURLuwpcJm2NYlPAF6GY0Fb6yCpZFiZjLlbTymlaAItiONP35bNUY+JJjyFpbYq2f4jz+xUD
 TxL3vuSCNp1zsYFtLQIVfcgwwd9snlNn1XnREFDsVglQa/gMvfHhcs0GMz0PkNicYKk+uuBKg0M
 wxckOuOnFzyb5tPE+uKCFLeKtx5G1WUDeOJ3BUdaOuVibdZNTvM3PBQtDBME8aY6jtvQSYNZTpe
 SELhXxRW05UR6QkmXK7JvVMP/DJ/3AUwvUpRIyqK1evL8EEpMpDGFvBeB2nXIBUWI9+sJ+Wp56A
 jxnx9+zXfpUWgdmCb3rQgI8W/NVky0VPpWGlsb5mVHNo7XGkncMdI0UcXEHzHFSQk97VYGoyr56
 f45o267DDuk1x6Kps7cRjVRFJuf/deQjqNZdjdOGonqgs5zxBIaLR+2xKRDLJYIv7y0tu9jrDnv
 Xal8MvAI9v+AVVZW3joczoGax53SVqTewNlt0esaPcs3T4TL34qCLIu0mtIGHZ+cd7VyKXlw+39
 nTtEGzcdKNxcwuvT36/Pf+cdhqi7QMY8jaYRNItR8fVMTBo3VTlBlTn0y5amyiLZetSf8n5kvmj
 69FXvKEwgORH8p/AjaPj0W1qn0SQZS2ujCtcuA==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--37.038100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 7E4835DC55BB171757440AB2A3EBEF646B801F0C1C9CC87D6FD438FE41E01B462000:8
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
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 =?utf-8?B?S3VvaG9uZyBXYW5nICjnjovlnIvptLsp?= <kuohong.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "tjmercier@google.com" <tjmercier@google.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 =?utf-8?B?SmlhbmppYW8gWmVuZyAo5pu+5YGl5aejKQ==?= <Jianjiao.Zeng@mediatek.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIzLTA5LTEyIGF0IDA5OjA2ICswMjAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3Rl
Og0KPiAgCSANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9y
IG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBv
ciB0aGUgY29udGVudC4NCj4gIEFtIDExLjA5LjIzIHVtIDIwOjI5IHNjaHJpZWIgSm9obiBTdHVs
dHo6DQo+ID4gT24gTW9uLCBTZXAgMTEsIDIwMjMgYXQgMzoxNOKAr0FNIENocmlzdGlhbiBLw7Zu
aWcNCj4gPiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPiB3cm90ZToNCj4gPj4gQW0gMTEuMDku
MjMgdW0gMDQ6MzAgc2NocmllYiBZb25nIFd1Og0KPiA+Pj4gRnJvbTogSm9obiBTdHVsdHogPGpz
dHVsdHpAZ29vZ2xlLmNvbT4NCj4gPj4+DQo+ID4+PiBUaGlzIGFsbG93cyBkcml2ZXJzIHdobyBk
b24ndCB3YW50IHRvIGNyZWF0ZSB0aGVpciBvd24NCj4gPj4+IERNQS1CVUYgZXhwb3J0ZXIgdG8g
YmUgYWJsZSB0byBhbGxvY2F0ZSBETUEtQlVGcyBkaXJlY3RseQ0KPiA+Pj4gZnJvbSBleGlzdGlu
ZyBETUEtQlVGIEhlYXBzLg0KPiA+Pj4NCj4gPj4+IFRoZXJlIGlzIHNvbWUgY29uY2VybiB0aGF0
IHRoZSBwcmVtaXNlIG9mIERNQS1CVUYgaGVhcHMgaXMNCj4gPj4+IHRoYXQgdXNlcmxhbmQga25v
d3MgYmV0dGVyIGFib3V0IHdoYXQgdHlwZSBvZiBoZWFwIG1lbW9yeQ0KPiA+Pj4gaXMgbmVlZGVk
IGZvciBhIHBpcGVsaW5lLCBzbyBpdCB3b3VsZCBsaWtlbHkgYmUgYmVzdCBmb3INCj4gPj4+IGRy
aXZlcnMgdG8gaW1wb3J0IGFuZCBmaWxsIERNQS1CVUZzIGFsbG9jYXRlZCBieSB1c2VybGFuZA0K
PiA+Pj4gaW5zdGVhZCBvZiBhbGxvY2F0aW5nIG9uZSB0aGVtc2VsdmVzLCBidXQgdGhpcyBpcyBz
dGlsbA0KPiA+Pj4gdXAgZm9yIGRlYmF0ZS4NCj4gPj4gVGhlIG1haW4gZGVzaWduIGdvYWwgb2Yg
aGF2aW5nIERNQS1oZWFwcyBpbiB0aGUgZmlyc3QgcGxhY2UgaXMgdG8NCj4gYXZvaWQNCj4gPj4g
cGVyIGRyaXZlciBhbGxvY2F0aW9uIGFuZCB0aGlzIGlzIG5vdCBuZWNlc3NhcnkgYmVjYXVzZSB1
c2VybGFuZA0KPiBrbm93DQo+ID4+IGJldHRlciB3aGF0IHR5cGUgb2YgbWVtb3J5IGl0IHdhbnRz
Lg0KPiA+Pg0KPiA+PiBUaGUgYmFja2dyb3VuZCBpcyByYXRoZXIgdGhhdCB3ZSBnZW5lcmFsbHkg
d2FudCB0byBkZWNvdXBsZQ0KPiBhbGxvY2F0aW9uDQo+ID4+IGZyb20gaGF2aW5nIGEgZGV2aWNl
IGRyaXZlciBjb25uZWN0aW9uIHNvIHRoYXQgd2UgaGF2ZSBiZXR0ZXINCj4gY2hhbmNlDQo+ID4+
IHRoYXQgbXVsdGlwbGUgZGV2aWNlcyBjYW4gd29yayB3aXRoIHRoZSBzYW1lIG1lbW9yeS4NCj4g
PiBZZXAsIHZlcnkgbXVjaCBhZ3JlZWQsIGFuZCB0aGlzIGlzIHdoYXQgdGhlIGNvbW1lbnQgYWJv
dmUgaXMgdHJ5aW5nDQo+IHRvIGRlc2NyaWJlLg0KPiA+DQo+ID4gSWRlYWxseSB1c2VyLWFsbG9j
YXRlZCBidWZmZXJzIHdvdWxkIGJlIHVzZWQgdG8gZW5zdXJlIGRyaXZlcidzDQo+IGRvbid0DQo+
ID4gY3JlYXRlIGJ1ZmZlcnMgd2l0aCBjb25zdHJhaW50cyB0aGF0IGxpbWl0IHdoaWNoIGRldmlj
ZXMgdGhlDQo+IGJ1ZmZlcnMNCj4gPiBtaWdodCBsYXRlciBiZSBzaGFyZWQgd2l0aC4NCj4gPg0K
PiA+IEhvd2V2ZXIsIHRoaXMgcGF0Y2ggd2FzIGNyZWF0ZWQgYXMgYSBob2xkLW92ZXIgZnJvbSB0
aGUgb2xkIElPTg0KPiBsb2dpYw0KPiA+IHRvIGhlbHAgdmVuZG9ycyB0cmFuc2l0aW9uIHRvIGRt
YWJ1ZiBoZWFwcywgYXMgdmVuZG9ycyBoYWQNCj4gc2l0dWF0aW9ucw0KPiA+IHdoZXJlIHRoZXkg
c3RpbGwgd2FudGVkIHRvIGV4cG9ydCBkbWFidWZzIHRoYXQgd2VyZSBub3QgdG8gYmUNCj4gPiBn
ZW5lcmFsbHkgc2hhcmVkIGFuZCBmb2xrcyB3YW50ZWQgdG8gYXZvaWQgZHVwbGljYXRpb24gb2Yg
bG9naWMNCj4gPiBhbHJlYWR5IGluIGV4aXN0aW5nIGhlYXBzLiAgQXQgdGhlIHRpbWUsIEkgbmV2
ZXIgcHVzaGVkIGl0IHVwc3RyZWFtDQo+IGFzDQo+ID4gdGhlcmUgd2VyZSBubyB1cHN0cmVhbSB1
c2Vycy4gIEJ1dCBJIHRoaW5rIGlmIHRoZXJlIGlzIG5vdyBhDQo+IHBvdGVudGlhbA0KPiA+IHVw
c3RyZWFtIHVzZXIsIGl0J3Mgd29ydGggaGF2aW5nIHRoZSBkaXNjdXNzaW9uIHRvIGJldHRlcg0K
PiB1bmRlcnN0YW5kDQo+ID4gdGhlIG5lZWQuDQo+IA0KPiBZZWFoLCB0aGF0IGluZGVlZCBtYWtl
cyBtdWNoIG1vcmUgc2Vuc2UuDQo+IA0KPiBXaGVuIGV4aXN0aW5nIGRyaXZlcnMgd2FudCB0byBh
dm9pZCB0aGVpciBvd24gaGFuZGxpbmcgYW5kIG1vdmUNCj4gdGhlaXIgDQo+IG1lbW9yeSBtYW5h
Z2VtZW50IG92ZXIgdG8gdXNpbmcgRE1BLWhlYXBzIGV2ZW4gZm9yIGludGVybmFsDQo+IGFsbG9j
YXRpb25zIA0KPiB0aGVuIG5vIG9iamVjdGlvbnMgZnJvbSBteSBzaWRlLiBUaGF0IGlzIGNlcnRh
aW5seSBzb21ldGhpbmcgd2UNCj4gc2hvdWxkIA0KPiBhaW0gZm9yIGlmIHBvc3NpYmxlLg0KDQpU
aGFua3MuDQoNCj4gDQo+IEJ1dCB3aGF0IHdlIHNob3VsZCB0cnkgdG8gYXZvaWQgaXMgdGhhdCBu
ZXdseSBtZXJnZWQgZHJpdmVycyBwcm92aWRlIA0KPiBib3RoIGEgZHJpdmVyIHNwZWNpZmljIFVB
UEkgYW5kIERNQS1oZWFwcy4gVGhlIGp1c3RpZmljYXRpb24gdGhhdA0KPiB0aGlzIA0KPiBtYWtl
cyBpdCBlYXNpZXIgdG8gdHJhbnNpdCB1c2Vyc3BhY2UgdG8gdGhlIG5ldyBVQVBJIGRvZXNuJ3Qg
cmVhbGx5DQo+IGNvdW50Lg0KPiANCj4gVGhhdCB3b3VsZCBiZSBhZGRpbmcgVUFQSSBhbHJlYWR5
IHdpdGggYSBwbGFuIHRvIGRlcHJlY2F0ZSBpdCBhbmQNCj4gdGhhdCANCj4gaXMgbW9zdCBsaWtl
bHkgbm90IGhlbHBmdWwgY29uc2lkZXJpbmcgdGhhdCBVQVBJIG11c3QgYmUgc3VwcG9ydGVkIA0K
PiBmb3JldmVyIGFzIHNvb24gYXMgaXQgaXMgdXBzdHJlYW0uDQoNClNvcnJ5LCBJIGRpZG4ndCB1
bmRlcnN0YW5kIHRoaXMuIEkgdGhpbmsgd2UgaGF2ZSBub3QgY2hhbmdlIHRoZSBVQVBJLg0KV2hp
Y2ggY29kZSBhcmUgeW91IHJlZmVycmluZyB0bz8NCg0KPiANCj4gPiBTbyBJIHRoaW5rIHRoaXMg
cGF0Y2ggaXMgYSBsaXR0bGUgY29uZnVzaW5nIGluIHRoaXMgc2VyaWVzLCBhcyBJDQo+IGRvbid0
DQo+ID4gc2VlIG11Y2ggb2YgaXQgYWN0dWFsbHkgYmVpbmcgdXNlZCBoZXJlICh0aG91Z2ggZm9y
Z2l2ZSBtZSBpZiBJJ20NCj4gPiBtaXNzaW5nIGl0KS4NCj4gPg0KPiA+IEluc3RlYWQsIEl0IHNl
ZW1zIGl0IGdldCB1c2VkIGluIGEgc2VwYXJhdGUgcGF0Y2ggc2VyaWVzIGhlcmU6DQo+ID4gICAg
DQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMDkxMTEyNTkzNi4xMDY0OC0xLXl1
bmZlaS5kb25nQG1lZGlhdGVrLmNvbS8NCj4gDQo+IFBsZWFzZSB0cnkgdG8gYXZvaWQgc3R1ZmYg
bGlrZSB0aGF0IGl0IGlzIHJlYWxseSBjb25mdXNpbmcgYW5kIGVhdHMgDQo+IHJldmlld2VycyB0
aW1lLg0KDQpNeSBmYXVsdCwgSSB0aG91Z2h0IGRtYS1idWYgYW5kIG1lZGlhIGJlbG9uZ2VkIHRv
IHRoZSBkaWZmZXJlbnQgdHJlZSwNCnNvIEkgc2VuZCB0aGVtIHNlcGFyYXRlbHkuIFRoZSBjb3Zl
ciBsZXR0ZXIganVzdCBzYWlkICJUaGUgY29uc3VtZXJzIG9mDQp0aGUgbmV3IGhlYXAgYW5kIG5l
dyBpbnRlcmZhY2UgYXJlIG91ciBjb2RlY3MgYW5kIERSTSwgd2hpY2ggd2lsbCBiZQ0Kc2VudCB1
cHN0cmVhbSBzb29uIiwgYW5kIHRoZXJlIHdhcyBubyB2Y29kZWMgbGluayBhdCB0aGF0IHRpbWUu
DQoNCkluIHRoZSBuZXh0IHZlcnNpb24sIHdlIHdpbGwgcHV0IHRoZSBmaXJzdCB0aHJlZSBwYXRj
aGVzIGludG8gdGhlDQp2Y29kZWMgcGF0Y2hzZXQuDQoNClRoYW5rcy4NCg0KPiANCj4gUmVnYXJk
cywNCj4gQ2hyaXN0aWFuLg0KPiANCj4gPg0KPiA+IFlvbmcsIEkgYXBwcmVjaWF0ZSB5b3Ugc2Vu
ZGluZyB0aGlzIG91dCEgQnV0IG1heWJlIGlmIHRoZSBzZWN1cmUNCj4gaGVhcA0KPiA+IHN1Ym1p
c3Npb24gZG9lc24ndCBkZXBlbmQgb24gdGhpcyBmdW5jdGlvbmFsaXR5LCBJIG1pZ2h0IHN1Z2dl
c3QNCj4gPiBtb3ZpbmcgdGhpcyBwYXRjaCAob3IgYXQgbGVhc3QgdGhlIG1ham9yaXR5IG9mIGl0
KSB0byBiZSBwYXJ0IG9mDQo+IHRoZQ0KPiA+IHZjb2RlYyBzZXJpZXMgaW5zdGVhZD8gIFRoYXQg
d2F5IHJldmlld2VycyB3aWxsIGhhdmUgbW9yZSBjb250ZXh0DQo+IGZvcg0KPiA+IGhvdyB0aGUg
Y29kZSBiZWluZyBhZGRlZCBpcyB1c2VkPw0KDQpXaWxsIGRvLg0KVGhhbmtzLg0KDQo+ID4NCj4g
PiB0aGFua3MNCj4gPiAtam9obg0KPiANCg==
