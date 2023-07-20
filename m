Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E23FA75A848
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 09:53:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7844E10E57A;
	Thu, 20 Jul 2023 07:52:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19C9F10E577
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 07:52:54 +0000 (UTC)
X-UUID: 69666b0e26d211eeb20a276fd37b9834-20230720
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=CHJfC2GlUSa7mqA6JTv9MtUExXI2/Sg7UVVrhzPMkvQ=; 
 b=XAuKtuXMxbUNjP6jJJB3nYt6jNx0qco4Naks5mxq5K4KiZNxjSBhNfE30sZ0aORBNUJePY5ny+6K2GmJzUoWhSMFSgkexsTHgPTMD90anyvGPmayLyMnGt0bjidKi7UI2Klxd7JZteGuDAgeK8sshu7xR2iTmQSKocz8B2ZBNl0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.28, REQID:cd95972e-3ed8-42aa-b681-79185808e45a, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:45
X-CID-INFO: VERSION:1.1.28, REQID:cd95972e-3ed8-42aa-b681-79185808e45a, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:45
X-CID-META: VersionHash:176cd25, CLOUDID:70d3cfdc-dc79-4898-9235-1134b97257a8,
 B
 ulkID:230720155247FYZ4PZYG,BulkQuantity:0,Recheck:0,SF:29|28|17|19|48|102,
 TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,C
 OL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:PA,DKP:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_FAS, TF_CID_SPAM_FSD, TF_CID_SPAM_ULN,
 TF_CID_SPAM_SNR, TF_CID_SPAM_SDM
X-UUID: 69666b0e26d211eeb20a276fd37b9834-20230720
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 922282141; Thu, 20 Jul 2023 15:52:44 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 20 Jul 2023 15:52:43 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Thu, 20 Jul 2023 15:52:43 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LWMtMgleCeWK9hkfXcZxNo15BRNxyfs0U5htH//0ZhhacVV2GqfMMbWaWsCK4Ai5z36Zr/YF7c/umRoZwTmdhRIYnofygR8ekeALjIHJCAh2g89A0X2atjNEef7hIzdXzfttQsq6qWrW1DpvW+5XHvPysdz91VlmHwhHHOFv2EjRb8KZB3TwSGpKI1MbGpp3lonssv4A4+SfopDVmBEjo/70LP6INerUaIoogheumIYBSpvJO9KYVe2bgLS/UuX+lZSlGLIcSQBtFjlQSAYK71+n6QaZFrsIBvu+e7E8X+Tu25fOOmKiw3OeRRM3Zej+Ut8Q2s9nkE1y3rDzWFG5Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gzTH4JAUYZJkMQSBXaOlJyntOm1fWWaMrTWJlG9JEPk=;
 b=UiWPHX+WhnoSs8JMeEXGPuupxC08hqqj14W9LU94Bgyemdzn5nLM7y0IhX69j9UE26JwPuK6VtoebPkunMLxmbmh003HcFAY/ERaEd5Bz7iQnH4MOHM8pEtWsPIwBnT/UcBm6mR17xKxemKDe1xyrGYAhPE7CovcWA0Sr+XsBzc9XhgvPvDaac57HfQFDHCYqqSDMzqEe4MSlROwt6gRE8sb/vvwvmrZqI+aNX0Ygr59pPEH8qNxBIlTD2ck3j2QmJiw6XWJ058iKNLa910YpWwUjLUS7mNxrRydF43s8QFC/egVt/gHIcwXw0bk/PyYA6IQsodyAjD2U22YyC27Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gzTH4JAUYZJkMQSBXaOlJyntOm1fWWaMrTWJlG9JEPk=;
 b=u8p1ZCxTiLHFaouQ414g5TtiNmdAGhcXHcO/LcehqcqAgLnQAK8/SH3u9OfmBeRn2NmO9oP8q0itNW4FS98pJwwv3tDGnWsV/rm5joFobLYioVVUIcycX5oW/pmeszFAkaAG9J/h3lQyg/3xKsRCnOp9quMutNAVna9uNe2Js0c=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SG2PR03MB6660.apcprd03.prod.outlook.com (2603:1096:4:1b9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Thu, 20 Jul
 2023 07:52:40 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::d126:7f34:9e4f:a95]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::d126:7f34:9e4f:a95%4]) with mapi id 15.20.6588.031; Thu, 20 Jul 2023
 07:52:40 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "fshao@chromium.org" <fshao@chromium.org>
Subject: Re: [PATCH v2] drm/mediatek: fix uninitialized symbol
Thread-Topic: [PATCH v2] drm/mediatek: fix uninitialized symbol
Thread-Index: AQHZc/dS0+UnhHpH9UKQpbsnSvSsEK+5gs+AgARbeACABPgZgA==
Date: Thu, 20 Jul 2023 07:52:40 +0000
Message-ID: <7e1124a15395dbb6906c17e240e5011a4274a9b5.camel@mediatek.com>
References: <20230421021609.7730-1-nancy.lin@mediatek.com>
 <ae96299cffaacdbf51beae96e3a257c95a04ac95.camel@mediatek.com>
 <CAC=S1njEG2sV28XAWDw8FoQ0p5w=-sU4i+D-ESfapHMQC1ZW3Q@mail.gmail.com>
In-Reply-To: <CAC=S1njEG2sV28XAWDw8FoQ0p5w=-sU4i+D-ESfapHMQC1ZW3Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SG2PR03MB6660:EE_
x-ms-office365-filtering-correlation-id: f310637e-8970-4cfc-0b87-08db88f64af6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vHPXN72VG1XHQlkgJ+sc8bxAexMpKBW3YTX2Kj2j3ppwGlJIOifjlXiIySNdJnmYXWD5pEAFRkK9DOl16RqC69l5xZ+KCmFzAJioTTQ+dIMiqaLSUikXT1EHAHpBqDWbVlohxrsHamicnCHyJyU71gHCVXqlmM+PDM0ojDo3b9AjEnU279yoGCd1+uWwgUN/JQsvdwyxWmmG6SfSLi7uX9jEm5zfJD0EEmc9gEnLPXdmNsoYl3z1i1zkdv4Ihq4fXnACdJm2AiBWjdrP/kSrwVOM3fHQAS4Dd38FkRviGtMrC/Z7eQ/UEYmMsVQAH7t6X3J5eY5Y8lxz2h3knnzCtva3Qv43xMq0qTdX7+fB07tvmKrsaQ7eLa9HvEuuhn1qlUKIyHd+susrXzZupvyvCQJbsA40QrQDzYjBAKt4hFGdiHJXSWAx+9Hb2RciADO5iYHHeTsaTtc6pj96AYfEBjbqtMMoKrqnedMpvkeBCeZ9tAe203BD5j0K8miD+a/ophI2QV5N+6YRHiuZ7o7C1mYv0bO7HL6mexgDHL/vNYQfoSmzS4IECp0URDoX0f93l757BMr0hF8OK1N52p3Jm0tS7Inb/sJ8v1jnA481r3cA6Nrrixa7SYvQDou/RbeVuk649Py5ZVp7eHO2zIKxct9Hau+5l2MthFJ+t2NokOg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(396003)(346002)(366004)(136003)(376002)(451199021)(122000001)(38100700002)(85182001)(38070700005)(86362001)(36756003)(6512007)(6486002)(71200400001)(478600001)(26005)(2906002)(186003)(6506007)(53546011)(8676002)(316002)(76116006)(8936002)(41300700001)(54906003)(4326008)(7416002)(66946007)(66476007)(66446008)(6916009)(66556008)(64756008)(5660300002)(2616005)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?blMrY2FNTS9ETnU3WEZBc3dMWnJLUXFzTXVXSlJHcjdpNmJnRGIvbm5MSlND?=
 =?utf-8?B?RG1FdHBpRjFWQm9YS3hraVdNcEtNZXVJUzhzbGpBKzkxOENqQXYyRjR0S3RQ?=
 =?utf-8?B?Nk9uMUNmbklqaGNSMlQ4Ky8yRjRzM3UyZEdEME1PT2ZselRLd1hYa3Zpakk4?=
 =?utf-8?B?UGsxSStLZGhJa2dzRWtFTVhqN2xwa2NzT2RQeXRqcVMwc1p2R2hld2dLelMx?=
 =?utf-8?B?akJGclNLLzZRV3JtdFYyZURrejJrRkFZd3ZDNWNCWUNacFh5TlROU3NWQ3ZP?=
 =?utf-8?B?MSs3MDNCYkRIMk54cnpISUJ5Ym16QkZlcHNIbkYvQkdpTFlzeWJJM01HZVgr?=
 =?utf-8?B?eDFLU1F2VTlUY2V3aVl2ckdoQVlocXhwbGJ5V3BHWXE5dkI4c0EvSWVRa0t4?=
 =?utf-8?B?N0VYTWJackNWQnY3eEZmWGlER2srVmExQXN2SGhqbmdleS9sUW92OGhjeDc1?=
 =?utf-8?B?VHpIUkdneC9TdzRMZmRUcEx2amY1WFhoZXNvd0hkbjB3MEV4YmV6eVozdC83?=
 =?utf-8?B?SUgrT2hyc2R6bWhlc2pvUU5nbDJPV2RNQlFOS2ttTjhKamM4UGFRVFl6Q1Vv?=
 =?utf-8?B?eTFhdU5EZnk0U1lrRjR6czhSOVV0VWppTWV1OFZLdS9aUDIyQUlNbC94M1k0?=
 =?utf-8?B?YzB4WTJ0c09vdlFvM2EwMmdraEd6NWpXTTRLS0gwTHdNMkVQblg2V0tVQ0lq?=
 =?utf-8?B?N0FrZFJ2ZCtMVlVhRWpZZzBmbmJJYSsxNmh3ZFc5MmJXOW9mSENFdHdjUHNh?=
 =?utf-8?B?MklIWkx6MkJTVndsbUpVS2d2TGNUYkc0ZXZRTGtaR3ROUmdxbzd4NEFFRVht?=
 =?utf-8?B?SWhYV0pYSVFJOUFPME5RVTRSbkVRZHZWYjV2NGJaMjJ0YVlVYTBGTElCUzJu?=
 =?utf-8?B?eDRPQTdCV2kza3h0Z2NRVVFIcm5Cci81emd0ajBKWEp6VXhvMnlObm1HUk16?=
 =?utf-8?B?aithcHJQTzFBQjhlQkVrT0dRbU1mVHNZOVZ0V29vY1pwRGl0SkJ0eGVGVWZs?=
 =?utf-8?B?SXhDbVliZW9wYjlqaWlhaEVhOEFnaktYTGFoc3o2aUJCQ3JqTWRKbWU5ejNJ?=
 =?utf-8?B?RFU1OEtRNHQ3Qjd4OGZzdjEzSmFRUURybkVVV282KzBTZEwvZHRlWEQxU2xS?=
 =?utf-8?B?MFdSZVBjMWpiUFZpVUZHY3E3SU9zK1pSNkRsZXlDZS9mWWhxTUpXdlJoWjRN?=
 =?utf-8?B?L2ZveCtDWGtuWkIwT1NMaThtYXlrOVpINmVHNUs0cnRwVUZSaEU1cW5lZ3RQ?=
 =?utf-8?B?MGI5Znc0aDNCQmlJL1lXV1ZXdlJveHR2WFhNZ2ZTRnVpMldPVUtwNjVqQWJ6?=
 =?utf-8?B?U0xTMG5KYnNxN0kya3FEOEFwcXFDazd1dmZnWUNVRS9OWWV0blZ0SjV2clBk?=
 =?utf-8?B?STdWWjNvMzhhTUpmTWZpaWE3REVPbGlCWUFFUzdqYXUzQUZPNEIrOVIxNjU5?=
 =?utf-8?B?UU9nazhCWFY1N29GUU5HaFJReTRZVlhCK1pkWVl2Q3g3TFBJaXBqelRPSGlQ?=
 =?utf-8?B?QTgzUTBORHpOdU15M3NPdFFSSjcrWVZKQ1UxK3pYV2VBSkhReXB3TGxvVit6?=
 =?utf-8?B?WEJGOGYrY2RldXFEMmhUbXZCbDM0MXdjU2pwSWNVSU41U0NCSmNpUHg1eTN4?=
 =?utf-8?B?cUJ4R0IyS2Vmbmp5WnQ4dEtuU3FXTnhXak1pS05WRGd1eEVRRlNDRWgvWHNo?=
 =?utf-8?B?cU9KdnZaMCswT0wybVhvdzdPWmQzcWw0TXlGbktYbG9ocEdrRkk4UU94ZVF0?=
 =?utf-8?B?ZWF4ZElzNkZwK0pXSlB2QWFKa245M1RMT2dnWmJqWnc0UGRXZzBtTy9sckd5?=
 =?utf-8?B?eHFXWHBqWlZMVkN4amxmTXZaVkhGVlhQSlFVbDc4R2hiZ09QWXgvaFdIZEhx?=
 =?utf-8?B?MTJLNkJMTlM5cThydGkzR2s0V0pyd29XRUIya3lDN2VwY0pSbTRJdnhSTU8r?=
 =?utf-8?B?eml6UzJQMThlWGltV0RuS3o5T1czaWNLay9wRURtbW16NUlaQVl0eVhuMHdZ?=
 =?utf-8?B?RU90M3BvemQ3MnV1VlJOZHpPUkFteG10RjdUcXRveUhnbm1uNTJ4N0poM09F?=
 =?utf-8?B?MFc3VWo5ak51RXF6VmNFaXFHQ3h4bVc3RG5BNVZ1YzZ6UTRCNzlMV1pPQkc2?=
 =?utf-8?Q?YIb1VpBmAECLVnu43n3EJC+ev?=
Content-ID: <BB8D395E7828364EA4623A9A8163BC65@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f310637e-8970-4cfc-0b87-08db88f64af6
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2023 07:52:40.3306 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PAKnAXxU3APQIVeZGzJqv4xffQkGQKJKNzRva3NJ6RSnbPeMBVVZY6+npeS7A4ezOwO1un6oWFdVTaPj/ZOZpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB6660
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_009_650922250.1456923924"
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
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "clang-built-linux@googlegroups.com" <clang-built-linux@googlegroups.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_009_650922250.1456923924
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpLCYjMzI7RmVpOg0KDQpPbiYjMzI7TW9uLCYjMzI7MjAyMy0wNy0xNyYjMzI7YXQm
IzMyOzExOjU5JiMzMjsrMDgwMCwmIzMyO0ZlaSYjMzI7U2hhbyYjMzI7d3JvdGU6DQomZ3Q7JiMz
MjsmIzMyOyYjMzI7DQomZ3Q7JiMzMjtFeHRlcm5hbCYjMzI7ZW1haWwmIzMyOzomIzMyO1BsZWFz
ZSYjMzI7ZG8mIzMyO25vdCYjMzI7Y2xpY2smIzMyO2xpbmtzJiMzMjtvciYjMzI7b3BlbiYjMzI7
YXR0YWNobWVudHMmIzMyO3VudGlsDQomZ3Q7JiMzMjt5b3UmIzMyO2hhdmUmIzMyO3ZlcmlmaWVk
JiMzMjt0aGUmIzMyO3NlbmRlciYjMzI7b3ImIzMyO3RoZSYjMzI7Y29udGVudC4NCiZndDsmIzMy
OyYjMzI7SGkmIzMyO0NLLA0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtPbiYjMzI7RnJpLCYjMzI7SnVs
JiMzMjsxNCwmIzMyOzIwMjMmIzMyO2F0JiMzMjs1OjI3JiM4MjM5O1BNJiMzMjtDSyYjMzI7SHUm
IzMyOygmIzMyOTkzOyYjMjA0MjY7JiMyMDgwOTspJiMzMjsmbHQ7Y2suaHVAbWVkaWF0ZWsuY29t
Jmd0Ow0KJmd0OyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjsmZ3Q7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtI
aSwmIzMyO05hbmN5Og0KJmd0OyYjMzI7Jmd0Ow0KJmd0OyYjMzI7Jmd0OyYjMzI7T24mIzMyO0Zy
aSwmIzMyOzIwMjMtMDQtMjEmIzMyO2F0JiMzMjsxMDoxNiYjMzI7KzA4MDAsJiMzMjtOYW5jeS5M
aW4mIzMyO3dyb3RlOg0KJmd0OyYjMzI7c25pcA0KJmd0OyYjMzI7Jmd0Ow0KJmd0OyYjMzI7Jmd0
OyYjMzI7SW4mIzMyO2xpbmUmIzMyOzU2NiwmIzMyO3RoZSYjMzI7c3RhdGVtZW50JiMzMjtpcw0K
Jmd0OyYjMzI7Jmd0Ow0KJmd0OyYjMzI7Jmd0OyYjMzI7aWYmIzMyOyhub2RvKSYjMzI7ew0KJmd0
OyYjMzI7Jmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO2Nv
bXBfcGRldiYjMzI7PSYjMzI7Li4uDQomZ3Q7JiMzMjsmZ3Q7JiMzMjt9DQomZ3Q7JiMzMjsmZ3Q7
DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtUaGUmIzMyO2NvbW1lbnQmIzMyO3NheXMmIzMyO3RoYXQmIzMy
O29ubHkmIzMyO292bF9hZGFwdG9lciYjMzI7aGFzJiMzMjtubyYjMzI7ZGV2aWNlJiMzMjtub2Rl
LCYjMzI7c28mIzMyO3RoZQ0KJmd0OyYjMzI7Jmd0OyYjMzI7Y2hlY2tpbmcmIzMyO3Nob3VsZCYj
MzI7YmUNCiZndDsmIzMyOyZndDsNCiZndDsmIzMyOyZndDsmIzMyO2lmJiMzMjsodHlwZSYjMzI7
IT0mIzMyO01US19ESVNQX09WTF9BREFQVE9SKSYjMzI7ew0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO2NvbXBfcGRldiYjMzI7PSYjMzI7
Li4uDQomZ3Q7JiMzMjsmZ3Q7JiMzMjt9DQomZ3Q7JiMzMjsmZ3Q7DQomZ3Q7JiMzMjsmZ3Q7JiMz
MjthbmQmIzMyO2xhdGVyJiMzMjtpdCYjMzI7d291bGQmIzMyO3JldHVybiYjMzI7d2hlbiYjMzI7
dHlwZSYjMzI7PSYjMzI7TVRLX0RJU1BfT1ZMX0FEQVBUT1IsDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtz
byYjMzI7dGhlcmUmIzMyO3dvdWxkJiMzMjtiZSYjMzI7bm8mIzMyO3Byb2JsZW0mIzMyO29mJiMz
Mjt1bmluaXRpYWxpemVkJiMzMjtzeW1ib2wuDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1RoYXQmIzMy
O3NvdW5kcyYjMzI7ZmFpciwmIzMyO2J1dCYjMzI7SUlVQyYjMzI7d2hhdCYjMzI7TmFuY3kmIzMy
O3RyaWVzJiMzMjt0byYjMzI7cmVzb2x2ZSYjMzI7aGVyZSYjMzI7aXMmIzMyO3RoZQ0KJmd0OyYj
MzI7ZmFsc2UtcG9zaXRpdmUmIzMyO1NtYXRjaCYjMzI7d2FybmluZy4NCiZndDsmIzMyO0hvdyYj
MzI7YWJvdXQmIzMyO3RoaXM6JiMzMjtnaXZlbiYjMzI7dGhlJiMzMjsmIzk2O2lmJiMzMjsobm9k
ZSkmIzk2OyYjMzI7YmxvY2smIzMyO3dhcyYjMzI7ZXhjbHVzaXZlbHkmIzMyO2FkZGVkJiMzMjtm
b3INCiZndDsmIzMyO292bF9hZGFwdG9yJiMzMjtpbiYjMzI7WzFdLCYjMzI7cGx1cyYjMzI7dGhl
JiMzMjtpbml0JiMzMjtmdW5jdGlvbiYjMzI7d2lsbCYjMzI7aW1tZWRpYXRlbHkmIzMyO3JldHVy
bg0KJmd0OyYjMzI7YWZ0ZXImIzMyO3RoYXQmIzMyO2luJiMzMjt0aGlzJiMzMjtjYXNlLCYjMzI7
aXQmIzMyO3Nob3VsZCYjMzI7YmUmIzMyO3NhZmUmIzMyO3RvJiMzMjtkbyYjMzI7dGhlJiMzMjtm
b2xsb3dpbmcNCiZndDsmIzMyOw0KJmd0OyYjMzI7JiM5NjsmIzk2OyYjOTY7DQomZ3Q7JiMzMjsv
KiYjMzI7Tm90JiMzMjthbGwmIzMyO2RybSYjMzI7Y29tcG9uZW50cyYjMzI7aGF2ZSYjMzI7YSYj
MzI7RFRTJiMzMjtkZXZpY2UmIzMyO25vZGUuLi4mIzMyOyovDQomZ3Q7JiMzMjtpZiYjMzI7KG5v
ZGUmIzMyOz09JiMzMjtOVUxMKQ0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtyZXR1cm4m
IzMyOzA7DQomZ3Q7JiMzMjsNCiZndDsmIzMyO2NvbXBfcGRldiYjMzI7PSYjMzI7b2ZfZmluZF9k
ZXZpY2VfYnlfbm9kZShub2RlKTsNCiZndDsmIzMyOy4uLg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtp
ZiYjMzI7KHR5cGUmIzMyOz09JiMzMjtNVEtfRElTUF9BQUwmIzMyO3x8DQomZ3Q7JiMzMjsuLi4N
CiZndDsmIzMyOyYjOTY7JiM5NjsmIzk2Ow0KJmd0OyYjMzI7DQomZ3Q7JiMzMjt3aGljaCYjMzI7
aXMmIzMyO2VxdWl2YWxlbnQmIzMyO3RvJiMzMjthZGRpbmcmIzMyO2EmIzMyOyYjOTY7bm9kZSYj
MzI7PT0mIzMyO05VTEwmIzk2OyYjMzI7Y2hlY2smIzMyO2JlZm9yZSYjMzI7WzFdLg0KJmd0OyYj
MzI7VGhpcyYjMzI7c2hvdWxkJiMzMjtzdXBwcmVzcyYjMzI7dGhlJiMzMjtTbWF0Y2gmIzMyO3dh
cm5pbmcmIzMyO2JlY2F1c2UmIzMyOyYjOTY7Y29tcF9wZGV2JiM5NjsmIzMyO3dpbGwmIzMyO2Jl
DQomZ3Q7JiMzMjsoYWdhaW4pJiMzMjt1bmNvbmRpdGlvbmFsbHkmIzMyO2Fzc2lnbmVkJiMzMjt0
byYjMzI7c29tZXRoaW5nLCYjMzI7YW5kJiMzMjt0aGUmIzMyOyYjOTY7dHlwZSYjMzI7PT0NCiZn
dDsmIzMyO01US19ESVNQX09WTF9BREFQVE9SJiM5NjsmIzMyO2xpbmUmIzMyO2NhbiYjMzI7YmUm
IzMyO2Ryb3BwZWQmIzMyO2Fsc28mIzMyOyhvcHRpb25hbCYjNjM7KS4NCg0KVGhpcyYjMzI7c29s
dXRpb24mIzMyO2Fsc28mIzMyO2xvb2tzJiMzMjtnb29kJiMzMjt0byYjMzI7bWUuDQoNClJlZ2Fy
ZHMsDQpDSw0KDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1sxXTomIzMyO2NvbW1pdCYjMzI7MGQ5ZWVl
OTExOGI3JiMzMjsoJnF1b3Q7ZHJtL21lZGlhdGVrOiYjMzI7QWRkJiMzMjtkcm0mIzMyO292bF9h
ZGFwdG9yJiMzMjtzdWINCiZndDsmIzMyO2RyaXZlciYjMzI7Zm9yJiMzMjtNVDgxOTUmcXVvdDsp
DQomZ3Q7JiMzMjsNCiZndDsmIzMyO1JlZ2FyZHMsDQomZ3Q7JiMzMjtGZWkNCg0KPC9wcmU+PCEt
LXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVLIENvbmZpZGVu
dGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioqKioqKioqKioNClRoZSBpbmZvcm1hdGlvbiBjb250
YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSANCmF0dGFjaG1lbnRz
KSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3
aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMg
aW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVu
dChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmlidXRpb24sIHByaW50aW5nLCBy
ZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0dGFj
aG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVk
IGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBp
ZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0
aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRl
bHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGll
cyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIg
c3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0
byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_009_650922250.1456923924
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEZlaToNCg0KT24gTW9uLCAyMDIzLTA3LTE3IGF0IDExOjU5ICswODAwLCBGZWkgU2hhbyB3
cm90ZToNCj4gIAkgDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5r
cyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5k
ZXIgb3IgdGhlIGNvbnRlbnQuDQo+ICBIaSBDSywNCj4gDQo+IE9uIEZyaSwgSnVsIDE0LCAyMDIz
IGF0IDU6MjfigK9QTSBDSyBIdSAo6IOh5L+K5YWJKSA8Y2suaHVAbWVkaWF0ZWsuY29tPg0KPiB3
cm90ZToNCj4gPg0KPiA+IEhpLCBOYW5jeToNCj4gPg0KPiA+IE9uIEZyaSwgMjAyMy0wNC0yMSBh
dCAxMDoxNiArMDgwMCwgTmFuY3kuTGluIHdyb3RlOg0KPiBzbmlwDQo+ID4NCj4gPiBJbiBsaW5l
IDU2NiwgdGhlIHN0YXRlbWVudCBpcw0KPiA+DQo+ID4gaWYgKG5vZG8pIHsNCj4gPiAgICAgICAg
IGNvbXBfcGRldiA9IC4uLg0KPiA+IH0NCj4gPg0KPiA+IFRoZSBjb21tZW50IHNheXMgdGhhdCBv
bmx5IG92bF9hZGFwdG9lciBoYXMgbm8gZGV2aWNlIG5vZGUsIHNvIHRoZQ0KPiA+IGNoZWNraW5n
IHNob3VsZCBiZQ0KPiA+DQo+ID4gaWYgKHR5cGUgIT0gTVRLX0RJU1BfT1ZMX0FEQVBUT1IpIHsN
Cj4gPiAgICAgICAgIGNvbXBfcGRldiA9IC4uLg0KPiA+IH0NCj4gPg0KPiA+IGFuZCBsYXRlciBp
dCB3b3VsZCByZXR1cm4gd2hlbiB0eXBlID0gTVRLX0RJU1BfT1ZMX0FEQVBUT1IsDQo+ID4gc28g
dGhlcmUgd291bGQgYmUgbm8gcHJvYmxlbSBvZiB1bmluaXRpYWxpemVkIHN5bWJvbC4NCj4gDQo+
IFRoYXQgc291bmRzIGZhaXIsIGJ1dCBJSVVDIHdoYXQgTmFuY3kgdHJpZXMgdG8gcmVzb2x2ZSBo
ZXJlIGlzIHRoZQ0KPiBmYWxzZS1wb3NpdGl2ZSBTbWF0Y2ggd2FybmluZy4NCj4gSG93IGFib3V0
IHRoaXM6IGdpdmVuIHRoZSBgaWYgKG5vZGUpYCBibG9jayB3YXMgZXhjbHVzaXZlbHkgYWRkZWQg
Zm9yDQo+IG92bF9hZGFwdG9yIGluIFsxXSwgcGx1cyB0aGUgaW5pdCBmdW5jdGlvbiB3aWxsIGlt
bWVkaWF0ZWx5IHJldHVybg0KPiBhZnRlciB0aGF0IGluIHRoaXMgY2FzZSwgaXQgc2hvdWxkIGJl
IHNhZmUgdG8gZG8gdGhlIGZvbGxvd2luZw0KPiANCj4gYGBgDQo+IC8qIE5vdCBhbGwgZHJtIGNv
bXBvbmVudHMgaGF2ZSBhIERUUyBkZXZpY2Ugbm9kZS4uLiAqLw0KPiBpZiAobm9kZSA9PSBOVUxM
KQ0KPiAgICAgcmV0dXJuIDA7DQo+IA0KPiBjb21wX3BkZXYgPSBvZl9maW5kX2RldmljZV9ieV9u
b2RlKG5vZGUpOw0KPiAuLi4NCj4gDQo+IGlmICh0eXBlID09IE1US19ESVNQX0FBTCB8fA0KPiAu
Li4NCj4gYGBgDQo+IA0KPiB3aGljaCBpcyBlcXVpdmFsZW50IHRvIGFkZGluZyBhIGBub2RlID09
IE5VTExgIGNoZWNrIGJlZm9yZSBbMV0uDQo+IFRoaXMgc2hvdWxkIHN1cHByZXNzIHRoZSBTbWF0
Y2ggd2FybmluZyBiZWNhdXNlIGBjb21wX3BkZXZgIHdpbGwgYmUNCj4gKGFnYWluKSB1bmNvbmRp
dGlvbmFsbHkgYXNzaWduZWQgdG8gc29tZXRoaW5nLCBhbmQgdGhlIGB0eXBlID09DQo+IE1US19E
SVNQX09WTF9BREFQVE9SYCBsaW5lIGNhbiBiZSBkcm9wcGVkIGFsc28gKG9wdGlvbmFsPykuDQoN
ClRoaXMgc29sdXRpb24gYWxzbyBsb29rcyBnb29kIHRvIG1lLg0KDQpSZWdhcmRzLA0KQ0sNCg0K
PiANCj4gWzFdOiBjb21taXQgMGQ5ZWVlOTExOGI3ICgiZHJtL21lZGlhdGVrOiBBZGQgZHJtIG92
bF9hZGFwdG9yIHN1Yg0KPiBkcml2ZXIgZm9yIE1UODE5NSIpDQo+IA0KPiBSZWdhcmRzLA0KPiBG
ZWkNCg==

--__=_Part_Boundary_009_650922250.1456923924--

