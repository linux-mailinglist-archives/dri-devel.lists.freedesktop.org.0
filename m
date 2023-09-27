Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6E17AFBD3
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 09:19:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37A6610E02F;
	Wed, 27 Sep 2023 07:19:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC59A10E02F
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 07:19:37 +0000 (UTC)
X-UUID: 34b6475c5d0611ee8051498923ad61e6-20230927
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=tZil2Omb0SwrkdUk+oYD8yzEFuBo3HP16iHP2OzbgeI=; 
 b=EEAiFQq3NS90N+vm7SUIfFj2ZSxFEDGnkycIicyDXYHrtVBaZLOjJGbHjhft65DESZdUrgYdNXJ2zmYoGttARXoiS7RhThwzpFwspVeDf69BHjJMsqo76o4gRpNAzdr7gM3OxpGyMAAbPOj6X8YnHLAxYL3UyXhs2psVwiLN99o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:00b43205-3e7b-4e65-8a22-5dbbd58088fd, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5f78ec9, CLOUDID:47d06d14-4929-4845-9571-38c601e9c3c9,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 34b6475c5d0611ee8051498923ad61e6-20230927
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw02.mediatek.com (envelope-from <moudy.ho@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 853811309; Wed, 27 Sep 2023 15:19:33 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 27 Sep 2023 15:19:32 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Wed, 27 Sep 2023 15:19:32 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cABgP91mQRAG4WhkzPN/6NwAQJ+uYWmuW5bqMJvyQbxNnWmoWUnfv+AIoYan8DoJe+Y3WrMkiYkcgS072Iv2gs9NUoDatupvRbKiqlE2BIenGJNqNhh4EwGtzZyXIjg4mWdgIqUknwKJgEBvSKQUZ7H1KtIJIKneT5TmCvMYui+ngNKJL23IBxAv/2GWw1ottIGseDqhZZkgv5m7u1ja82cpp0dvhHNZxymmkfxzIWxRyO2dIkewvFB2d2CWJ7yjdF1k8AO4eaViS1KV8BCFHqmOhMRWgYvMzarj/YXQIerE+gEv3GOJ9HDw6s12zcYyYmav74VOZvwqtXQC9aM0MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tZil2Omb0SwrkdUk+oYD8yzEFuBo3HP16iHP2OzbgeI=;
 b=T6cCFEPSinYCTYtQWsh5fNR0pOSk0oEEP0DEU6UsUEHZF0Kp7gAk6CYfeEKwOeIq6WiOT5/raTDWL58k6y+4w16wtXZmPoz25EOM2/cQhZTjJzVggZQUX96XjqK//5cuhPJjLBpwZedN4A7G+O1NO11MXG6gZzxET4pCBEyeAY35rK7ILupwVmuV5VtdU81CeLkg3vtjpII8RtgXfR0F9ReXjag8zCGs2LlfT6xhVUBu87OxQ0+YBN/eFs9hSN6KR8kuG547HZhiO5GupchTFMx+x6Vk2Wo769q7fTlDCjHEWZoJZBuaaaDzYs49O0+mFANQQ412VuLNPxQiO1nhag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tZil2Omb0SwrkdUk+oYD8yzEFuBo3HP16iHP2OzbgeI=;
 b=d76w0jP3LoDjEAIlgl9Cj0o2d/BfuW205CH3+2M/79xL31HQfEoUl83mkmYZrwWifK7YRObO0c+Ug1E8GZomSRzfYbBb7yCciRyzIojTbVTgg9A/04cVS1OHu1hlLbhnQAKegv8JVW0CNIBV3/rLnLjlVAWsq4IdKgdrMGCpf58=
Received: from TY0PR03MB6356.apcprd03.prod.outlook.com (2603:1096:400:14c::9)
 by TYZPR03MB5710.apcprd03.prod.outlook.com (2603:1096:400:8a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 27 Sep
 2023 07:19:29 +0000
Received: from TY0PR03MB6356.apcprd03.prod.outlook.com
 ([fe80::2d8b:d64e:65cb:b7af]) by TY0PR03MB6356.apcprd03.prod.outlook.com
 ([fe80::2d8b:d64e:65cb:b7af%6]) with mapi id 15.20.6813.027; Wed, 27 Sep 2023
 07:19:28 +0000
From: =?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>
To: "conor@kernel.org" <conor@kernel.org>
Subject: Re: [PATCH v6 12/16] dt-bindings: display: mediatek: color: add
 compatible for MT8195
Thread-Topic: [PATCH v6 12/16] dt-bindings: display: mediatek: color: add
 compatible for MT8195
Thread-Index: AQHZ7SWDmGuBlsrdL0eRbWKT0x+2ILAm/mEAgAAAgACAB0y5gA==
Date: Wed, 27 Sep 2023 07:19:28 +0000
Message-ID: <7c445195e17e15d5af5fcb30ae53f76c713e958b.camel@mediatek.com>
References: <20230922072116.11009-1-moudy.ho@mediatek.com>
 <20230922072116.11009-13-moudy.ho@mediatek.com>
 <20230922-zebra-modify-87ff23c70bb3@spud>
 <20230922-overhung-deception-e9b461ba0372@spud>
In-Reply-To: <20230922-overhung-deception-e9b461ba0372@spud>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY0PR03MB6356:EE_|TYZPR03MB5710:EE_
x-ms-office365-filtering-correlation-id: 53285421-de0b-409f-fc25-08dbbf2a1665
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1Ujsjk2t/uLqox1wcHGLZJwX8+qLnG90sC7iDCOChotXOuX1AwdNCW9HBRvAD0zWW4NlbBwWQcnW2Lca3j+WOLpqbn6eloj59u2o++KuzbG6q/vq+KtviJyCwdyujKl6un7Y3eFsrAOp70Xt8l+Z30PPFUyVK2akRmJ+LnB73RpmuhJFHp1XUbBxN3RqsUOu4KTMpyGaP+6u4g60jaLXR293HObRKxxrJiBBo6duvy+ol7p1Rx6Tpnt6MwKzlr+TbcoajtwF4MfbIzteU4paiu0OcqiiAWQcUgh88PidZCAfEvK3s9aCATFHqqOqOMuiIUhTVkKc7/g9NtVP8SCf36npu1SGgRkP69csGXPeJ2fHFR01tvzT9ZqmQPmRjxmG8UYu1UDF0u20TZBp3UMhxWGm8HjZ1Q9VG4Hx0swmpfIiDIOEOz3B1xXMXP7NgOXR39SHTZQsjn/wRtEdou6KS1ZIvFrHCXu31iJvT78IsTbybuRj3LzKgdU4/6/IBpsDBlnPBocIjhZG8pEFqkl+Alo7LBns5xTF43xRfp0UQxkvrsqKTqEm7NpGq77N2ye3wdlVuJ7IlyaDvcfBqewQo8tGjRYSa6QCt9LOdQK8bOpGDn963eDtA/1kLmSlAoDFt7bB7Idw2ejqr9y0Cr9RiK8QO7HPFKquZzCVjMQrfyGksJeLcMo8d4T/6eyexm3i
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY0PR03MB6356.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(136003)(39860400002)(396003)(346002)(230922051799003)(186009)(451199024)(1800799009)(76116006)(4326008)(83380400001)(26005)(8936002)(8676002)(66556008)(478600001)(316002)(41300700001)(66946007)(6486002)(54906003)(6916009)(64756008)(2906002)(2616005)(71200400001)(66476007)(66446008)(6506007)(6512007)(122000001)(5660300002)(7416002)(85182001)(36756003)(38070700005)(38100700002)(86362001)(99106002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Mjd1TmFDSGc4eTBvSVpid21aeTVIMVMwZHVuak9PenY4ekhvMVNDbDZnRGgr?=
 =?utf-8?B?QnZ0WWNmU3d5RUhVbzlyQ0hoZFpGbzk2My9MN2xFRHU0VXhuR25QWFhxYjZo?=
 =?utf-8?B?SDhCUWk0TE14K1VoaFJpNzF6RUI5WVpnWkVhQlJpc0JjQTFlaEdXWkdQb1pW?=
 =?utf-8?B?UVV5eTRhU3pBT0piaVgzWVN3VjNqS3hid3VvUEZRTGFSejAybVh0cDIvU3hm?=
 =?utf-8?B?cURJZUlmNVlmbDVPL0syb1c1Rm1QU0VWZ2NtbzRSdDk0M0IvT1Z6REx2WGQy?=
 =?utf-8?B?aHBsWmhVS0NpRmVjMGRveUIxbWtqTEdsalQ5YmRubUZrMlJHVVorZklzVUlK?=
 =?utf-8?B?NFpJaHVDd1ZpbzBuTWpjRC9acTk2ejM0SlFpS1VCQVVmWXA1L3UxOFI4OEJZ?=
 =?utf-8?B?aE1haUVtNnRlTUplSmJoZSt0QWc5WDlzbVJ1UXdTejBFWFppV2tiQ3NPYjlq?=
 =?utf-8?B?bStzRFluYzBrUDdRc1E3Rmg4bWZYTHd3c1A3OWdtYW1hRlUxYmU1a21CakNh?=
 =?utf-8?B?dUcyeTlQWm1peFR3dldPTkt4YlhuU3Mrd2VmWHE0RWxlN2Zma1NHNGJydUhM?=
 =?utf-8?B?WjdQWFk1Ri8vNjQrK3ZvdnFVenFMT3ZvUFRmWVdCbTNxQnpPS3NsTTVLMDlu?=
 =?utf-8?B?dkkxa2JSMytFU0QyUXZEdzdYWGV6YUwveTlsZGdwNGZRZCtnMWp3c3lhb1Bl?=
 =?utf-8?B?Vm5ta2VHeFlrWHRETHVmVkpYUEhlakFwZHZDWFdGZEU2aEx6UzNGc0xqTGpC?=
 =?utf-8?B?OURaTnRyVGxSNE0raEZzTFZNenpzSHF4d21HUGZYdkFOUExKZ0YwR0cvOEQw?=
 =?utf-8?B?cTlTZ25ibHZEVU9DdmEvUkNGQWYzQUpSUmtEWER1QmVGM0RzRmhNNDg1aS9Z?=
 =?utf-8?B?OGpVckUzYkZXUEMvVEt3VGJrQjlBRHV4YTBvMWRFSHFKckZ5UDd4YUpneTBU?=
 =?utf-8?B?STd2Ym5XU3RBd0dkb04rZnNETGtDcHJwOHdWbWlKLzI1Q21HY2daalZyand5?=
 =?utf-8?B?dVJoL0FWZ0V1eXpMM1g3QlBoZEZ0QzVObVFndzdMZjVRdGU4VDEwUVpTakdD?=
 =?utf-8?B?UisybE1Qbi82SmxwSncxeWN0b3hMK2hkcnpiSnBHWlFFNFdIWitiNUFrZnFI?=
 =?utf-8?B?Y1BTbDNJWVkrWHJ2MGZvbmZzSXdMUXRiL3Z2U1N0N1FQV3pBdW01ZVNZRmZp?=
 =?utf-8?B?VklmRkJ1U3ZLUVI2b0NpTWJTTVkxNk16TElISTNlY3kvcjhpY2RwQjJtSm1P?=
 =?utf-8?B?cjBUK21kZDhaeHU1ZUpCWG1lNFo5ZUZsR2J0SndLa3l1aXRDb1dLTDJ3SkJL?=
 =?utf-8?B?THVrMlpRWGNIQ2dtZjE2VXVsZnFCQ1NKYjA5dEc5Qi8rdGlEK3NjZHltbStQ?=
 =?utf-8?B?MU83Z3NKTXdvenR5SXhOZWdIaDR4cXdlcHBVOFVlVkNTZXY2WW5WVFlFaXNz?=
 =?utf-8?B?RjJlNUg3cnQrN0pMK2Njam1mK2I5bEhzTUU5cExhaUZRZzNHS0lOT0tPM3Bu?=
 =?utf-8?B?SzBHTkQ1RjJwSkw3RlVHMlNqSTQ4TkRPNjdMWTNLaDB2bVFxZ2Y2QkprY0pS?=
 =?utf-8?B?azRubi9uVVR5ZmRKNTl4RWl1Q01iZTErQ3BQQ1hNQk5IaThmQXBLY1NHa2ll?=
 =?utf-8?B?bWtsemhFb3VvT0lYVmtmNko4S1hvT3F1R2NYTXZwdE5ZTFo0dVZLMEdtcTdw?=
 =?utf-8?B?NVlSUlF5Q2Y3UE8xRnZzMmVkTFZxQkZwRzFQVURhN3FLL1JhYStzd2RQT0N1?=
 =?utf-8?B?NHIyMXBVWHdpbmZhcGpWQWJmN3JGOC9ZSWJMUFlwYWc0dHBTdnpMMlAwWUYz?=
 =?utf-8?B?dm5lYnBDdWNqcTdoMFZ3OGZSVFdad05HMHZVVmJiWEt5aUF5ekIxdGlYdlZl?=
 =?utf-8?B?Z25oOGhCdExSa0M4Tk5yNUVEOHJXQ3ZlSWVDRjVWRll6WkZIYS9ROWRnZzIw?=
 =?utf-8?B?VVN6MFhIWnNwVGo1SHppZnVSdEhYNXowZ2ovQXBSbXE3V1M1blpDeWtYS1gv?=
 =?utf-8?B?cTJrVmxOQjIrMUJzaTdoVnBKemZTNHV1N3lrODZuMGxWRW5LMnBwTm5acVFX?=
 =?utf-8?B?Mms0QUFqendmSTJLZzNwU3FiZzR3T0lIcVZFMjhEZWU1cHMrWk11QlcxTHl6?=
 =?utf-8?B?UmJoejF1UEMyRVAxTTlNWllNdlVNS2dZSHAvKzd1MHU0clUzcnpJWi9qbG54?=
 =?utf-8?B?clE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8373C06F3F2F6A4D8E0F515B41784DF1@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY0PR03MB6356.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53285421-de0b-409f-fc25-08dbbf2a1665
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2023 07:19:28.7953 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UI4jb6Xe879Sl49luIuRy49f/p2fh37Vy0+xA5ksHilTt0fjHQtILYlDy3xlaFFQQ+3gjQQhRyJW+taW4h2mAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB5710
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--14.569000-8.000000
X-TMASE-MatchedRID: u8usGLXufdjUL3YCMmnG4ia1MaKuob8Pt3aeg7g/usCe9toQ6h6LE9yi
 JF4Y8A5b0W/jG0/KDRLxHXxxAO/d2Ws/tFw6ZTQWeUyVZX4ivrvg/EG5TeijVbUpYagt6jzoNE7
 kMskA+NvTRtQAQ4mUjzPj/iaMsH0RerMnjfibghlvZuNIxXfMLxxlHnS3TyBRx3KcddPgAYG3AS
 WSZLkabNA4Md7yW2rbu0JMc/t7MjZJI5ZUl647UNIFVVzYGjNKnCGS1WQEGtDfwtq4jZ/G3iq2r
 l3dzGQ16okghugziKZplxzwthk07IfFOSvGGX0/yitoUMTbRPIrmG18cZ+OMg==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--14.569000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: B64C8D9DD328E2C197225C1F707FD721FD85CEA5D0DD93FE86C5037F9E4B1E3D2000:8
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

T24gRnJpLCAyMDIzLTA5LTIyIGF0IDE2OjUxICswMTAwLCBDb25vciBEb29sZXkgd3JvdGU6DQo+
IE9uIEZyaSwgU2VwIDIyLCAyMDIzIGF0IDA0OjQ5OjE0UE0gKzAxMDAsIENvbm9yIERvb2xleSB3
cm90ZToNCj4gPiBPbiBGcmksIFNlcCAyMiwgMjAyMyBhdCAwMzoyMToxMlBNICswODAwLCBNb3Vk
eSBIbyB3cm90ZToNCj4gPiA+IEFkZCBhIGNvbXBhdGlibGUgc3RyaW5nIGZvciB0aGUgQ09MT1Ig
YmxvY2sgaW4gTWVkaWFUZWsgTVQ4MTk1DQo+ID4gPiB0aGF0DQo+ID4gPiBpcyBjb250cm9sbGVk
IGJ5IE1EUDMuDQo+ID4gPiANCj4gPiA+IFNpZ25lZC1vZmYtYnk6IE1vdWR5IEhvIDxtb3VkeS5o
b0BtZWRpYXRlay5jb20+DQo+ID4gPiAtLS0NCj4gPiA+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGNvbG9yLnlhbWwgICAgDQo+ID4gPiAgfCAxICsN
Cj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4gPiA+IA0KPiA+ID4gZGlm
ZiAtLWdpdA0KPiA+ID4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9tZWRpYXRlay9tZWRpYXRlayxjb2wNCj4gPiA+IG9yLnlhbWwNCj4gPiA+IGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssY29sDQo+
ID4gPiBvci55YW1sDQo+ID4gPiBpbmRleCBmMjFlNDQwOTIwNDMuLmI4ODZjYTBkODllYSAxMDA2
NDQNCj4gPiA+IC0tLQ0KPiA+ID4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxjb2wNCj4gPiA+IG9yLnlhbWwNCj4gPiA+ICsrKw0K
PiA+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRl
ay9tZWRpYXRlayxjb2wNCj4gPiA+IG9yLnlhbWwNCj4gPiA+IEBAIC0yNiw2ICsyNiw3IEBAIHBy
b3BlcnRpZXM6DQo+ID4gPiAgICAgICAgICAgIC0gbWVkaWF0ZWssbXQyNzAxLWRpc3AtY29sb3IN
Cj4gPiA+ICAgICAgICAgICAgLSBtZWRpYXRlayxtdDgxNjctZGlzcC1jb2xvcg0KPiA+ID4gICAg
ICAgICAgICAtIG1lZGlhdGVrLG10ODE3My1kaXNwLWNvbG9yDQo+ID4gPiArICAgICAgICAgIC0g
bWVkaWF0ZWssbXQ4MTk1LW1kcDMtY29sb3INCj4gPiANCj4gPiBIb3cgY29tZSB0aGlzIG9uZSBp
cyBhICJtZHAzIiBub3QgYSAiZGlzcCI/DQo+IA0KPiBJIGRvbid0IGtub3cgd2hhdCBtZHAzIG1l
YW5zICYgZ29vZ2xpbmcgZ2l2ZXMgbWUgbm8gYW5zd2Vycy4gV2hhdCdzDQo+IHRoZQ0KPiAiZGlz
cCIgb25lIGNvbnRyb2xsZWQgYnksIHNpbmNlIGl0IGlzbid0IGNvbnRyb2xsZWQgYnkgbWRwMz8N
Cj4gDQoNCkhpIENvbm9yLA0KDQpNZWRpYXRlaydzIE1lZGlhIERhdGEgUGF0aCB2ZXIuMyAoTURQ
MykgaXMgYXNzb2NpYXRlZCB3aXRoIE1NU1lTIGFuZA0KYWN0cyBhcyBhbiBpbmRlcGVuZGVudCBk
cml2ZXIgdGhhdCBvcGVyYXRlcyBiZXR3ZWVuIFZERUMgYW5kIERJU1AuDQpCeSBjb250cm9sbGlu
ZyBtdWx0aXBsZSBjb21wb25lbnRzLCBpdCBjYXJyaWVzIG91dCB0YXNrcyBsaWtlDQpjb252ZXJ0
aW5nIGNvbG9yIGZvcm1hdHMsIHJlc2l6aW5nLCBhbmQgYXBwbHlpbmcgc3BlY2lmaWMgUGljdHVy
ZQ0KUXVhbGl0eSAoUFEpIGVmZmVjdHMuDQpUaGUgZHJpdmVyIGNhbiBiZSBmb3VuZCBhdCAiZHJp
dmVyL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL21kcDMiLg0KU2luY2UgdGhlIHNhbWUgaGFyZHdh
cmUgY29tcG9uZW50cyBhcmUgY29uZmlndXJlZCBpbiBib3RoIE1EUDMgYW5kDQpESVNQLCBjb25z
aWRlcmluZyBwcmV2aW91cyBkaXNjdXNzaW9ucywgSSBhdHRlbXBlZCB0byBpbnRlZ3JhdGUgaW50
byBhDQpzaW5nbGUgYmluZGluZywgbmFtZWQgYWZ0ZXIgdGhlIGNvbnRyb2xsaW5nIHVzZXIuDQoN
ClNpbmNlcmVseSwNCk1vdWR5DQo+ID4gDQo+ID4gPiAgICAgICAgLSBpdGVtczoNCj4gPiA+ICAg
ICAgICAgICAgLSBlbnVtOg0KPiA+ID4gICAgICAgICAgICAgICAgLSBtZWRpYXRlayxtdDc2MjMt
ZGlzcC1jb2xvcg0KPiA+ID4gLS0gDQo+ID4gPiAyLjE4LjANCj4gPiA+IA0KPiANCj4gDQo=
