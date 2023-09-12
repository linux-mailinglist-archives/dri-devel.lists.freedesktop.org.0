Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0229879CA84
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 10:47:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4804410E3C2;
	Tue, 12 Sep 2023 08:47:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B6A910E3C2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 08:47:28 +0000 (UTC)
X-UUID: fcd3d584514811eea33bb35ae8d461a2-20230912
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=2pc2gb3T86FZ/RkCCpuMM8LJn95fTxqqkWMMFOCt2+4=; 
 b=HYb0TknC0N216ULhIYDvBxjUPAGEfhv7qVaUhm+EtyVNPffRjJhBmpon9rb0kzV71EQzoc85sDeqx16LnpZ3wi6RJxCXBfZ0cue1ZITK0acIC5wdL7MmPR6Yb6USiKp1nP8QD4VuhRvOReXBnbkSJU5nMcmTSb8jfpDPHa/cPgI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31, REQID:8672a61f-ddd8-481e-849c-5b852dc19d45, IP:0,
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
X-UUID: fcd3d584514811eea33bb35ae8d461a2-20230912
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 365675625; Tue, 12 Sep 2023 16:47:21 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 12 Sep 2023 16:47:20 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Tue, 12 Sep 2023 16:47:20 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HXEKLpStY/pXnoPM+Q5Qt188s17mggeZYXm7jV6czGzOiVGmGI8UShalsOBgHzdRZ0PWtIeIlYs3MS596WmhWDXg7RFEbJRtTlPfZ/0sXiLiPIFETwIDGFQmaKRKBNOHcbNa554H+1U8h5ZKruuaixK2Zb3OakSI3ZgQ1IPruUw6jt3JNMBkpKJV4MKTOPYoM5FsAJ50nL2EqjZWu38O7fVqiYBh2qb0rGAuHBoD6JoxQrqt8aFL64aFj69yCTm0ibLUmU3vMXFgZ0tUkDrfav9jow/JR63yk66RSOEx0x2HfQk4534dPkPbyXDBb4Z60SPBbBwTWPx3CYMvb0Erfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2pc2gb3T86FZ/RkCCpuMM8LJn95fTxqqkWMMFOCt2+4=;
 b=Byn1/3UCYLsfmTLU+p6IerNlP1DdKoxDPNpjws1NbH7+iMFpFsKnItVC0JKPXqQ+y9yUClnm21qcr4Tr0f6ZQye9f780eNDm+sz3bFRZp8heQBDWTJNhRqwzUl4uJPF0zUI0Vyyt5nnBbAcMLMvck40QYLEpWKNs2zSXMzITuCpZTX35yxV++ZXzyRsG4B8pFhbppzFCg2vaiiUs3G/P20qELb2ZKhXIMwEf0Xp5vQ4z9mVzrVz+MuQ0A8sUh0/jN37DmHJzDtuTJ7KSaGVUXgIy6u+NSaEqYlH2TB5BwfK3dfZ2eS1Z5tdF+7EDgGyXMCdL/4+KDaW4/idpEK7zKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2pc2gb3T86FZ/RkCCpuMM8LJn95fTxqqkWMMFOCt2+4=;
 b=lMAqJVNvpDszWs9wl93I+SJkmxGtuALw0wHxLwbQZ9WCX4jD9Gf7xKgtZD279Y1NDOvdJbzlM3TMzVNH/SFpzPESexvxdl3LiTr5EmU477DBUH4wFqfS9sGWEasMzVk3z6fZyXyHvfR+/9CVE7QQsSiYcBU9V+DfWkpikgvyDTc=
Received: from SI2PR03MB5885.apcprd03.prod.outlook.com (2603:1096:4:142::7) by
 SEZPR03MB7659.apcprd03.prod.outlook.com (2603:1096:101:126::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Tue, 12 Sep
 2023 08:47:16 +0000
Received: from SI2PR03MB5885.apcprd03.prod.outlook.com
 ([fe80::e148:3390:1eb2:28e3]) by SI2PR03MB5885.apcprd03.prod.outlook.com
 ([fe80::e148:3390:1eb2:28e3%7]) with mapi id 15.20.6768.029; Tue, 12 Sep 2023
 08:47:15 +0000
From: =?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>
To: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>, "nicolas@ndufresne.ca"
 <nicolas@ndufresne.ca>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>
Subject: Re: [PATCH 3/9] dma-heap: Provide accessors so that in-kernel drivers
 can allocate dmabufs from specific heaps
Thread-Topic: [PATCH 3/9] dma-heap: Provide accessors so that in-kernel
 drivers can allocate dmabufs from specific heaps
Thread-Index: AQHZ5FgOSAh5MZm7Ik69mQtVpHaxabAVzMeAgAEV/AA=
Date: Tue, 12 Sep 2023 08:47:15 +0000
Message-ID: <8e795311ff93c7a336eb688818f055c5c569741e.camel@mediatek.com>
References: <20230911023038.30649-1-yong.wu@mediatek.com>
 <20230911023038.30649-4-yong.wu@mediatek.com>
 <827b859e3ff8176ef0b18c29bc17481b4105e368.camel@ndufresne.ca>
In-Reply-To: <827b859e3ff8176ef0b18c29bc17481b4105e368.camel@ndufresne.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB5885:EE_|SEZPR03MB7659:EE_
x-ms-office365-filtering-correlation-id: 0515f476-86ce-41c0-dc31-08dbb36cdd95
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 09he8iCHQVJx90XELq+jVsBj0b+Oejr1K39rKgTyDFreKyV7VG4ESFMezUHEuCMTyALh4L8A/0ADN/bJFftCD45xgp0QYT8YFutluYQeSkSoofKlmBtcEym00I+BOZcvQ/9mGlyat1cPk+GSysCUdUik7rPYvBOzDtyjBoVdgAlZbMNile88AEUFRkwMt9RTxR7pD51H4vVeHj++byi19TzBFaonu0bT5WAThWeNq24kV6T0hYFxG1IwTolIdKkPgT1O1aUXIRQOWjXdXOiY0Nd+VjXLJ/tTU5QlJlxm3s3lJ9b9P2iGHXvN0CqOod2q8n22Q5WZEg5AsMncj0HJUKITcWStGGT0MJ897/Y2c+8cvTjUDhNzadAJnC36tM5W5dL9bd0Au0/dnL1RjHHmendvyrWrD8NbUrSHiS/5jhthbqw0zfzyEPuyKtZMQ72M8DVSewad31bVbq6g2nyYGXQ9yiY8EQPchm0ihePlWBLNuLLko2oDuAHLca1mLSVLchxa3bmTkB0C+GjRRk4FxntwfGnfvlWUb1k2AEVe4pEbaT8t1VYAUcSm29GTT302e1FYz7ypD93ISlfyleJ9bVcuCRjQ+/hxYxZNH3hssD6w3cp0dIhxEUz1LFa753v9qGael5SDSzx3krXNwxWvI5r7W4yaOqJF9qihpZ3sV0pUQUVRclm/z/T7F8gb55U4
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR03MB5885.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(396003)(376002)(136003)(39860400002)(186009)(1800799009)(451199024)(122000001)(71200400001)(6486002)(6506007)(36756003)(85182001)(38070700005)(38100700002)(86362001)(2616005)(26005)(66574015)(6512007)(478600001)(83380400001)(110136005)(41300700001)(5660300002)(8676002)(8936002)(4326008)(316002)(2906002)(66556008)(66446008)(7416002)(66946007)(54906003)(66476007)(64756008)(76116006)(99106002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MWZrWnZzYXJ3L1QycXVDdFRzY3JxSW9icjhsNFAwVnFpOUlXa2VwLzU1Vk1Y?=
 =?utf-8?B?Y3A3dk1aMjg3TDlQQ0NoUWpId2kzQmRxY09tRlJVaHVBSElkRzFhZm9Jbk5y?=
 =?utf-8?B?MnZJRVRTRFVQUHl5OXlJc3VmbkJBSTBvYU1RTUJMQkNybHFuR2creTgxY0Vu?=
 =?utf-8?B?S0lCV05hSklGQU1ybmhvWU9Hb0xVbXFlTTEwamJxdjFnYk5hMUQ4N1NQd2xG?=
 =?utf-8?B?WmZQL2xGWnhGL1R2NEpJNkFRYjZsN0ZJaEpMNEpLR1dpU0xBTlRLTHZhbVBJ?=
 =?utf-8?B?b1F2VGF4UFpCRlFVZkVMMlY5dW5Db1RSSXYwaUR4U1R6NTZGNTVqYWJ2aFBi?=
 =?utf-8?B?MkYrZGFDSktCVDkyTHNzbVIwMHM2ejI1cUJNSkVlN05HS29FdjlacGduNy9P?=
 =?utf-8?B?SDE2eVBXQWswYjJFMnJHRHBxOUNRbVhMelUyd05sTDFtTmUyOE84RDlTK21D?=
 =?utf-8?B?QUYzUFdLc0hPVncrSzRBYks1eFhOQmpwR3RNQjVpWS9kQStoK1hhNVVJcmZj?=
 =?utf-8?B?SGtBbWdvWXJDQlJwZVlkM1E2OHJoejNweU8wOXMwNUIwb2w1bWZCZEVIVW1p?=
 =?utf-8?B?MCsrbm03TEVYaVJWVUhtejEwd0pKODFRYkIvblh5U24zWk5IMkIxZWIydldC?=
 =?utf-8?B?NjZyRjlmaXJWTmYyOHpCTGRWenBGeUxDcGdLZVM3QmNHdEhBVUk0ZUpjZUVY?=
 =?utf-8?B?bzJFK3RXTlNEeERacE1JVFFYb3UrV2JUYkVYa0RUb3hTd25TajkvOEw3U0tH?=
 =?utf-8?B?cmRWOXhXajVxRHN5SmVuWlVSS0w3TXh6TE5BNy8vVFVURWU2OXBobzBYdXNO?=
 =?utf-8?B?VWNEREZ1MHZXK0d2OHA1SjZLRnI0OEtSZFNiZ2kwaGFwbXdHSi9ycXU4V3dl?=
 =?utf-8?B?cWw4SW12TzZSelZsWEkrV1pDenRnQUZFWmFqZ2dIUkFxN2IrWGpkQUZFeVQz?=
 =?utf-8?B?SFFNOU9xM2JMTTFxUFhQcG9ncEhVOG9pYXZ2ZEs3WCs3NXErKzI2TE5Qd1hB?=
 =?utf-8?B?QVZna3pBaGVrbXFnd0t5V3hGZXNHQXRVR1JBYTArSHRwdTRQV2pJNkJZUlFW?=
 =?utf-8?B?U01qckVxZERCMllDRDAybis0ZFRZVy9VTUFkbkRBZVdLSzc0ejlRUHh1WFlU?=
 =?utf-8?B?WkhtVUp0N1RTTndkQjFYcEt0azZLVEhIWHVONUVlQjZRLy9QQklpbFhRODBI?=
 =?utf-8?B?cmFHRU0rbmkzT1g2UVJDMXJpMklsM1R1ZUh4TE5nTVpLK292T1hBMU92bjdo?=
 =?utf-8?B?c25vMzU2N3F5R3N0M0ZFKzZ2bGlZN2pyQW9QVnFQYmdQY0JDK3orVlEyWWVT?=
 =?utf-8?B?MjVqa1Qwd3VkS3JPWjI0TWF6QkZDSDlqZmlwbXh3L3pwNDhQWHhXRGVUQ2dG?=
 =?utf-8?B?KzFkMWQxTUYrS3BIbWUwZFpLbTJIajhyeXhYWHVrdnZ5SnVNNDVoRFArLzNs?=
 =?utf-8?B?WHJPZlVlM0hDdHM5dHQwWnJlQ2NKaXlwaEJKM0JIQzk0WUdabHN1aTc1OTVm?=
 =?utf-8?B?cFV4WC9DYUFWZUtmMlFTblhMM3NCajArb3NzQnltVUtGNCtpZEZac1RFUE94?=
 =?utf-8?B?and1b0tXdVJPYXhwcFg2M080d2ZqaDVMTlZDREpyRkZ0WE5vK0VxQkJ3ZVNw?=
 =?utf-8?B?NTFkNnNPTUtlRXpESHRicXZIakcybUh2aXJVUmlVMG5iZDZGZHFMM1F0aEZu?=
 =?utf-8?B?ZUxtcW04SlV0UXlsY3IrVmtrbUJ3ZUNqQ1lodkloMGNVb1laRjlxMmNaNkRv?=
 =?utf-8?B?bDdFbWdiaitNaU1UbEd1b25aL2IzS1NqL3N0dTFZN0xjS3BaVER0OFdUUlZK?=
 =?utf-8?B?Slh4SkUrWllOVGlkd2ZEMW5NeXZQd25XRkU2dktjWGFoSjlmYWRYR0RXZDR4?=
 =?utf-8?B?K1J1cEszbjBRZ3BRVGwvM3pmWDV3c0EvNWVaTkZSZ0J4NHU1NXY5MUQ5NFNW?=
 =?utf-8?B?YTlCd0ZKdndnTFpyTXZKTjQ5N0lSSFFKTFdjb0Q5TUExY3BjcEZ2WVRGVlhh?=
 =?utf-8?B?V1V4TGxYMUZtb2lTR2pjRXFIQ2VKZEtsZzBVUzZLL0VGVHBXb2J6aE1MQnBp?=
 =?utf-8?B?Qko5OHJYN2E3Z1lMaGxGOG5DVW14RDJDeDlDcnBvQ2xINU9XRXlNc1Z5T2NU?=
 =?utf-8?B?VFFBMTVGWEMvRnMwUUIrSm5JWWlhT3FJSzdScFhTNXZTVDU5eUk0d2paSE9V?=
 =?utf-8?B?MXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2C8C8A45D269B14EA77E56257E2AA608@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5885.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0515f476-86ce-41c0-dc31-08dbb36cdd95
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2023 08:47:15.7886 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +1a9iU3+9Vz8pqlbajd6TlpIuvynuk708eLnzGm6ENynV+tVyLM5tj4laSTnx9aLR9YbiSl3YNsUw9JfeLULZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7659
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--36.076100-8.000000
X-TMASE-MatchedRID: tnElfsy+/XrUL3YCMmnG4t7SWiiWSV/1jLOy13Cgb4/n0eNPmPPe5KWz
 WoIRiV9DM/Se/q/gEyf5MiS7M8c1eGmXMi7Ntyo2mlaAItiONP1Aq6/y5AEOOtvpj5+dNlQvLOx
 C6suyQ8a3TQE1hd7P2AY4ukDrG+XlzpFIpbxp7n24jAucHcCqnShRWQHuJ8me/k12Sb2MaHnuc/
 n71nc6Da7+d6Fd+0xWt43B5J96WnlC9qEX7ASCsb0dPFETpBAHqQ9UezeTkTgKA2OoGAlTk8VJI
 RTDvqF7I85AAY8dYvvYVjTEv2zPIaV+SUdLT6ob7TLIvnWov9EXRHoL/W4Y6kS/boWSGMtdrqHM
 1KIOYyjkn6SkMwS8XegqGV6KStbQ4vZjlIwkBi9w2v4L43/x+KQhvErQWbGrCoAikymLoZ30/WA
 k5AfCSyclTBqPe67EWKNxvq78azV6Dnv/STSepp4CIKY/Hg3AwWulRtvvYxTUHQeTVDUrItRnEQ
 CUU+jz9xS3mVzWUuC1PimItaljun7cGd19dSFd
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--36.076100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 24FA676AC0669AF1B14185350CED23549F67DF7D3C3BDAE7E968BDE93617D5752000:8
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
 "tjmercier@google.com" <tjmercier@google.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "jstultz@google.com" <jstultz@google.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 =?utf-8?B?SmlhbmppYW8gWmVuZyAo5pu+5YGl5aejKQ==?= <Jianjiao.Zeng@mediatek.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIzLTA5LTExIGF0IDEyOjEyIC0wNDAwLCBOaWNvbGFzIER1ZnJlc25lIHdyb3Rl
Og0KPiAgCSANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9y
IG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBv
ciB0aGUgY29udGVudC4NCj4gIEhpLA0KPiANCj4gTGUgbHVuZGkgMTEgc2VwdGVtYnJlIDIwMjMg
w6AgMTA6MzAgKzA4MDAsIFlvbmcgV3UgYSDDqWNyaXQgOg0KPiA+IEZyb206IEpvaG4gU3R1bHR6
IDxqc3R1bHR6QGdvb2dsZS5jb20+DQo+ID4gDQo+ID4gVGhpcyBhbGxvd3MgZHJpdmVycyB3aG8g
ZG9uJ3Qgd2FudCB0byBjcmVhdGUgdGhlaXIgb3duDQo+ID4gRE1BLUJVRiBleHBvcnRlciB0byBi
ZSBhYmxlIHRvIGFsbG9jYXRlIERNQS1CVUZzIGRpcmVjdGx5DQo+ID4gZnJvbSBleGlzdGluZyBE
TUEtQlVGIEhlYXBzLg0KPiA+IA0KPiA+IFRoZXJlIGlzIHNvbWUgY29uY2VybiB0aGF0IHRoZSBw
cmVtaXNlIG9mIERNQS1CVUYgaGVhcHMgaXMNCj4gPiB0aGF0IHVzZXJsYW5kIGtub3dzIGJldHRl
ciBhYm91dCB3aGF0IHR5cGUgb2YgaGVhcCBtZW1vcnkNCj4gPiBpcyBuZWVkZWQgZm9yIGEgcGlw
ZWxpbmUsIHNvIGl0IHdvdWxkIGxpa2VseSBiZSBiZXN0IGZvcg0KPiA+IGRyaXZlcnMgdG8gaW1w
b3J0IGFuZCBmaWxsIERNQS1CVUZzIGFsbG9jYXRlZCBieSB1c2VybGFuZA0KPiA+IGluc3RlYWQg
b2YgYWxsb2NhdGluZyBvbmUgdGhlbXNlbHZlcywgYnV0IHRoaXMgaXMgc3RpbGwNCj4gPiB1cCBm
b3IgZGViYXRlLg0KPiANCj4gDQo+IFdvdWxkIGJlIG5pY2UgZm9yIHRoZSByZXZpZXdlcnMgdG8g
cHJvdmlkZSB0aGUgaW5mb3JtYXRpb24gYWJvdXQgdGhlDQo+IHVzZXIgb2YNCj4gdGhpcyBuZXcg
aW4ta2VybmVsIEFQSS4gSSBub3RpY2VkIGl0IGJlY2F1c2UgSSB3YXMgQ0NlZCwgYnV0DQo+IHN0
cmFuZ2VseSBpdCBkaWRuJ3QNCj4gbWFrZSBpdCB0byB0aGUgbWFpbGluZyBsaXN0IHlldCBhbmQg
aXRzIG5vdCBjbGVhciBpbiB0aGUgY292ZXIgd2hhdA0KPiB0aGlzIGlzIHVzZWQNCj4gd2l0aC4g
DQo+IA0KPiBJIGNhbiBleHBsYWluIGluIG15IHdvcmRzIHRob3VnaCwgbXkgcmVhZCBpcyB0aGF0
IHRoaXMgaXMgdXNlZCB0bw0KPiBhbGxvY2F0ZSBib3RoDQo+IHVzZXIgdmlzaWJsZSBhbmQgZHJp
dmVyIGludGVybmFsIG1lbW9yeSBzZWdtZW50cyBpbiBNVEsgVkNPREVDDQo+IGRyaXZlci4NCj4g
DQo+IEknbSBzb21ld2hhdCBjb25jZXJuZWQgdGhhdCBETUFCdWYgb2JqZWN0cyBhcmUgdXNlZCB0
byBhYnN0cmFjdA0KPiBzZWN1cmUgbWVtb3J5DQo+IGFsbG9jYXRpb24gZnJvbSB0ZWUuIEZvciBm
cmFtZWJ1ZmZlcnMgdGhhdCBhcmUgZ29pbmcgdG8gYmUgZXhwb3J0ZWQNCj4gYW5kIHNoYXJlZA0K
PiBpdHMgcHJvYmFibHkgZmFpciB1c2UsIGJ1dCBpdCBzZWVtcyB0aGF0IGludGVybmFsIHNoYXJl
ZCBtZW1vcnkgYW5kDQo+IGNvZGVjDQo+IHNwZWNpZmljIHJlZmVyZW5jZSBidWZmZXJzIGFsc28g
ZW5kdXAgd2l0aCBhIGRtYWJ1ZiBmZCAob2Z0ZW4gY2FsbGVkDQo+IGEgc2VjdXJlIGZkDQo+IGlu
IHRoZSB2NGwyIHBhdGNoc2V0KSBmb3IgZGF0YSB0aGF0IGlzIG5vdCBiZWluZyBzaGFyZWQsIGFu
ZCByZXF1aXJlcw0KPiBhIDE6MQ0KPiBtYXBwaW5nIHRvIGEgdGVlIGhhbmRsZSBhbnl3YXkuIElz
IHRoYXQgdGhlIGRlc2lnbiB3ZSdkIGxpa2UgdG8NCj4gZm9sbG93ID8gDQoNClllcy4gYmFzaWNh
bGx5IHRoaXMgaXMgcmlnaHQuDQoNCj4gQ2FuJ3QNCj4gd2UgZGlyZWN0bHkgYWxsb2NhdGUgZnJv
bSB0aGUgdGVlLCBhZGRpbmcgbmVlZGVkIGhlbHBlciB0byBtYWtlIHRoaXMNCj4gYXMgc2ltcGxl
DQo+IGFzIGFsbG9jYXRpbmcgZnJvbSBhIEhFQVAgPw0KDQpJZiB0aGlzIGhhcHBlbnMsIHRoZSBt
ZW1vcnkgd2lsbCBhbHdheXMgYmUgaW5zaWRlIFRFRS4gSGVyZSB3ZSBjcmVhdGUgYQ0KbmV3IF9D
TUEgaGVhcCwgaXQgd2lsbCBjbWFfYWxsb2MvZnJlZSBkeW5hbWljYWxseS4gUmVzZXJ2ZSBpdCBi
ZWZvcmUNClNWUCBzdGFydCwgYW5kIHJlbGVhc2UgdG8ga2VybmVsIGFmdGVyIFNWUCBkb25lLg0K
ICANClNlY29uZGx5LiB0aGUgdjRsMi9kcm0gaGFzIHRoZSBtYXR1cmUgZHJpdmVyIGNvbnRyb2wg
ZmxvdywgbGlrZQ0KZHJtX2dlbV9wcmltZV9pbXBvcnRfZGV2IHRoYXQgYWx3YXlzIHVzZSBkbWFf
YnVmIG9wcy4gU28gd2UgY2FuIHVzZSB0aGUNCmN1cnJlbnQgZmxvdyBhcyBtdWNoIGFzIHBvc3Np
YmxlIHdpdGhvdXQgaGF2aW5nIHRvIHJlLXBsYW4gYSBmbG93IGluDQp0aGUgVEVFLg0KDQo+IA0K
PiBOaWNvbGFzDQo+IA0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEpvaG4gU3R1bHR6IDxqc3R1
bHR6QGdvb2dsZS5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogVC5KLiBNZXJjaWVyIDx0am1lcmNp
ZXJAZ29vZ2xlLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBZb25nIFd1IDx5b25nLnd1QG1lZGlh
dGVrLmNvbT4NCj4gPiBbWW9uZzogRml4IHRoZSBjaGVja3BhdGNoIGFsaWdubWVudCB3YXJuaW5n
XQ0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2RtYS1idWYvZG1hLWhlYXAuYyB8IDYwICsrKysrKysr
KysrKysrKysrKysrKysrKysrKystLS0tDQo+IC0tLS0tLQ0KPiA+ICBpbmNsdWRlL2xpbnV4L2Rt
YS1oZWFwLmggICB8IDI1ICsrKysrKysrKysrKysrKysNCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA2
OSBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkNCj4gPiANCltzbmlwXQ0K
