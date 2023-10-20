Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 644BD7D0C78
	for <lists+dri-devel@lfdr.de>; Fri, 20 Oct 2023 11:59:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D608D10E0EB;
	Fri, 20 Oct 2023 09:59:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D08710E0EB
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Oct 2023 09:59:29 +0000 (UTC)
X-UUID: 57a21f586f2f11eea33bb35ae8d461a2-20231020
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=DWq3sydXgcZWEsu/9Wl3uzVW1tusMXXlLKm5vby17AI=; 
 b=LwfKxcEghlFySQn/zTO4eZOhndpIGFtyFw+yOmLKnD8tGyNPc3wCQ80rdmKKVC+LLfAXFsvJCzBE60FIPciJ5xPe9FkrfOWERJr0zhe/W04yqu6GJ5PMVJ2gkpsOiEQsmzZCrnWqrNHUVihksKrHVH9xMfojGWnC5CzK5liT9qM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:fb6493e4-bfee-4142-852c-8b28416297ae, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5f78ec9, CLOUDID:10eb1dd7-04a0-4e50-8742-3543eab8cb8e,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 57a21f586f2f11eea33bb35ae8d461a2-20231020
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw01.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 575609232; Fri, 20 Oct 2023 17:59:21 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 20 Oct 2023 17:59:20 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Fri, 20 Oct 2023 17:59:20 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AB5on8rQ/MuNZKYbQBgzxUvHAukZL+76pjsDuwAYxRbRGdFtWtuzzSUDOV3ueL7jvzDfMG1Sxe6kFloeCHXgn47GmE/zG9dvMa9s1yIrSLa979jdlMXS6IC50p4SBdlHFitgw8EtZ/RUzrpl+6dwvckQIcRTspD1MI1NNn0PwVp2Oc804WCAin/SE+7dqIMIWQYBICv8aVoeyyCyqYMGsjMc2KRRT3etczEiYbbIzZpNVov9N9uRgMm0gGZIYoVs9/c2hMZnozOAKHZJamGTcaW105hxzANSSUwPsl415HEXvdkpd2uuJveVnzVmPUREHubScfu5UlE6i+KBc12+aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DWq3sydXgcZWEsu/9Wl3uzVW1tusMXXlLKm5vby17AI=;
 b=EQTJUO+VsdBAn/kjGSv6STXqZCetGAwFhaOjJ85Rrj2dzz7Lo/TS/43JvbPlzNFmEuemybT9wz8lp23gSkq9nGTAupaLy7DSAChjXWC1TZTv91y/H7KMSK60QjCZ4Z37kSpX3iiASDNPhbVY63df4LZr/D7up9tE6eEDLQ4/vnmnDgRBbnwRB/ONhsdav+VPL8OzeD8Fhrb8nlB7I4rLHsLSgCd0Ti5FasPN+mng8sfb2GGXJw+cuDYAVqD0ROSIdBY+vSIbnJQOvVIfp/A0/XP9yr4jspEOxkaKe0JIP7SgynIMWK6tRZZi5SZbQlNrNJST+erHkwkyZC1pjhz7KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DWq3sydXgcZWEsu/9Wl3uzVW1tusMXXlLKm5vby17AI=;
 b=XXlym5KDqlSw7zahKSN/0zZ/G3pwNwKKbdyJH9Xa24c7ivilTvgNq3iCtLZ/b0xUTQqpiYFpm7JYlX2JzbSbDPTIYno1MXh6fRqitxyyd/jIthrsPIFIe18ED4fYfbkrEaJeT2dBiS4vX4tmXZT/P7pfByOHiC0bMYGlL+6dn4E=
Received: from SI2PR03MB5885.apcprd03.prod.outlook.com (2603:1096:4:142::7) by
 SEZPR03MB7471.apcprd03.prod.outlook.com (2603:1096:101:132::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.26; Fri, 20 Oct 2023 09:59:17 +0000
Received: from SI2PR03MB5885.apcprd03.prod.outlook.com
 ([fe80::3dfd:5783:26bf:c189]) by SI2PR03MB5885.apcprd03.prod.outlook.com
 ([fe80::3dfd:5783:26bf:c189%4]) with mapi id 15.20.6907.025; Fri, 20 Oct 2023
 09:59:17 +0000
From: =?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>
To: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "quic_vjitta@quicinc.com" <quic_vjitta@quicinc.com>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>
Subject: Re: [PATCH 4/9] dma-buf: heaps: Initialise MediaTek secure heap
Thread-Topic: [PATCH 4/9] dma-buf: heaps: Initialise MediaTek secure heap
Thread-Index: AQHZ5FgcsYZL1VMcSUC+/rX+uk2OfbBQxXUAgAHqBgA=
Date: Fri, 20 Oct 2023 09:59:16 +0000
Message-ID: <c8bf01a083182fdc83742de8daad8c5ce8d56d5b.camel@mediatek.com>
References: <20230911023038.30649-1-yong.wu@mediatek.com>
 <20230911023038.30649-5-yong.wu@mediatek.com>
 <5d806772-a2b4-4304-be45-7c2ed2930fcc@quicinc.com>
In-Reply-To: <5d806772-a2b4-4304-be45-7c2ed2930fcc@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB5885:EE_|SEZPR03MB7471:EE_
x-ms-office365-filtering-correlation-id: 6bb8d399-21ef-4496-fdf4-08dbd15338e3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Jl4Zd4fjdkl53OpSfm1e8fk/p29HXCzT0PNW/r1UZ53ObBf+ci0Wl0mASrpntplqMeCq6/W7D/ise/NnNxj37ySdQ3pFeF7Mq1T+mut2j98yKQarxiughoK/ZmOopbYg8f9KJtOdE59LE2iwFrjD3pPIa+YbojD9c00MO1F3sqn8SkCIkug6TY7Xu9GAcjrqOJ+UloYQJ6Qb5mPNSd243IjMvm+T24LZS44W6fXDmjbIlWHcjKeD6OVBCdB3u7x7I0T+D93sinP0xhcuW8jed0ShEBMRm8O2rjqGDr2obD0da6PZ7Y+P/XFJ1vMNDkx+2A3+jdZL0GlxggbitE1c1XhODN7v9xDsrXKeoBap3/u/69vTXibksapZ/B+LzemtYvORv8RaG+hswUaa1VJGZ+1UNaIMJ6i3FM5XnqHO7DPMlvk/14YYhQVC6tAjGq//LbJScKHpCV/zDmbl1rycGPXQurW+7hgDpawIONv26rKPDYu6vH/GOE6phvVi3NRTnQ5zMqMZGIGyEVPlDd75DxNaN1wUHoUuP1Z59ZY/X8r40RCtZ3SzWKu5glkPnLkfbXdiHycOe28JMLjYSnwNM5uPoHFJdXNmq1oBcFLNd+b8UnGcE6NZC+fbl8FnHzbvRdMy2S04fWTgHK4rKPEHUQ//xPoimhElLg36uYb1cugTkZ1l/gM+B7SBIZ1vVyHo
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR03MB5885.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(136003)(366004)(39860400002)(346002)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(7416002)(2906002)(316002)(66946007)(76116006)(66476007)(66556008)(110136005)(66446008)(54906003)(64756008)(71200400001)(478600001)(6486002)(8676002)(8936002)(4001150100001)(41300700001)(5660300002)(36756003)(4326008)(6506007)(38100700002)(85182001)(2616005)(53546011)(86362001)(26005)(83380400001)(6512007)(122000001)(38070700009)(99106002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WjY5NDhZdjYwcENyS3hhNEFiVWZCUm5DUU0zSDdsTFh3ZVIxenlMVzBJUVJ0?=
 =?utf-8?B?KzczMnBVemZpcmIwTW94ZDUyay9UeDVIWkNOdzNXS0NDL21DZXNoenlObnVv?=
 =?utf-8?B?OERzL1Q4NTc5bkNhNDlSTnRta2RHMzdVTHJrbkdCa1laclRnVVhpbXhjMUxO?=
 =?utf-8?B?QW1md2xwTTFoMy90VDZqbFhDSU5TQ1lTUll3SGNMNXMwUEtnUEtXOW5sOXRx?=
 =?utf-8?B?b1V1L05BTjJ4NHhvVXl5cU9qN012TXB4RkJNdFFLT3VlVDlZNjFOTXNRWTht?=
 =?utf-8?B?N0tkeUVWSVRWMlc4dkoyT2llMktrUnAwNUhTZCtMdlhJcTl5SDIwQ0U5eUMz?=
 =?utf-8?B?NzhvQ1ZIUm5HNnMxbi9aWWJuK2V2UEMvWCtmTEN4SUJZSlBZZWE4Uy85VG5N?=
 =?utf-8?B?YnQ5eFBaenM3UWR2Q3FCTklkZHFPeEY5YlhKMFRsN2l6MnNYWHgweVZDMTJI?=
 =?utf-8?B?NGRCSUhJV2F0aU1HS3JvU1NYTUVWVFR3MDd6aVFMYmE5N1hDN0J4NmJ6YmJU?=
 =?utf-8?B?NWVjWTMraUo3UDMvODVNSmxpQWNyK2pNc1gwcnFkTHlTYml4QkFqbE1GdGlZ?=
 =?utf-8?B?QmZNM25DNVhxTlB0WmZsclA2OWdiRmlyZHlTMGhvb2tvUUlEdSt3QmQ3ZmJB?=
 =?utf-8?B?aDY3VDBFazVGN2lkL3RSQ0NNM1ByN0ljRjBicnhsQ285YzNMUDRrU0E2RVBw?=
 =?utf-8?B?ZGMwdjkwb2tSN0FmVjFhZmMwYzJUK08xWVE0Y1g1dDVoclpxSDlzL2g4dTQ5?=
 =?utf-8?B?SmVUVnU3WFp4b3crL1YrK2ZjUUE1WGMreDliaUF2VC9pM3FBWHJZUlFncDZt?=
 =?utf-8?B?V05IbWVaY0JTZmxVQmFlUGsxZTZvUTVkVVMySHArWHU0YTRCZmRsc3FERzdw?=
 =?utf-8?B?Z3JBUnZhZUhTMkRPOU9HVkRBVHNROER4US8xSkQ5SmEzVzFJVGRYVURWRGlW?=
 =?utf-8?B?dkpEUmFLMnVEdHVMbWo2cUs2WlJMTGp1R2xtWkJ0QVRrcy9obk1Xbk41SWlM?=
 =?utf-8?B?dWptTlZtWjk3Q0RwU0svSWVYSGsyTWlwSjVzV0x3dUVkL0d1L3VBdjVjRlUx?=
 =?utf-8?B?Tmc0N3I2L0lMdER1R1FKbDc4NVgrMmlkR0pvdnV5UDI3K21VRFZ0NjNCNytn?=
 =?utf-8?B?QWppeEpzbHltTFV4VlpkbU9vc0c5TTZsS1cySXYrSWNtQmVPTFp6Z2Z4NnNo?=
 =?utf-8?B?T2dkeTArUTlvSVpHaWFldXVxTFp2L0lJZDRlSXNpaGV4MCtxcE5Ea01tTWNz?=
 =?utf-8?B?U1MvWUNoTU5Na2ZZd2JWMEhCWWdkUlE0Nk5IU0xjWWg2eWVKNjRlMCtUMFdi?=
 =?utf-8?B?UjRxZUk1ZVhaOHBVTzBOZURFQVByNmFnWVhmSWRmUU5SVUg1SWx6MUF2Z3Yw?=
 =?utf-8?B?WEMrVnFXR1NsalNCVFhwWGo2Qkp5WUxPbG0wdlVTRmFnRlRZOExTUXNYVGdH?=
 =?utf-8?B?MlNPdzFmeTZmQ1BudkRyazh6bFFPKzBneTZ3YjNBN2dPT2svaE54NFFoUXly?=
 =?utf-8?B?Qk5RaGoycm8wbkJyWVRXY2Z5MXVuOFR5RytkZ0dCYUdBcWVyTEMwSGNicXhK?=
 =?utf-8?B?bGtVd21DQXhTcXZyZmdYL2plKzkzZnZiZVhPQ0doUlpuYXlvNFloTkJlTExi?=
 =?utf-8?B?ZWs3VlEyRTUrZXlNQWx3VE9HQksycTFxMlY2MFBrejlvdGNNWXRQM2RuMjUr?=
 =?utf-8?B?S1VUS3JnVGpTN29xT054WXk1eWJDMW5lZ0xPR0RnVjBhL00xTHJHei9sbmZC?=
 =?utf-8?B?blJmaytHVStnTkdsaTlJV2dzcU1CcjM0SCtYUlNkRzdab3M3aklDRDV0MUZj?=
 =?utf-8?B?Vk1idUZUbHdhUEczajgzUngyVENyZE5GUEk5K2F6eXRGMmRzc2JkZ3JNdXAz?=
 =?utf-8?B?S01jbjF5a0NrTFhyemFVcG9zS250Q1BJTThWNmJvWUpoUVA0YU53Z1F5Z0Vy?=
 =?utf-8?B?Zld6UFlONFE2QnFPK3V0bmdHWEVibXdsNkRneEtaK3ZXeXIrcXpmREhxRFFq?=
 =?utf-8?B?T1R0VXF0cE1aVFc4eW5uVk5Ic0tnTlNoZ0xCZTBEd0x3UW1Dd0M0UFJydVc5?=
 =?utf-8?B?ZU9WVGkzci9zcjZUWEVCNzM2NDF0Qk5aTFRsQnRMbndjZVpwWDVOVTcrY05x?=
 =?utf-8?B?MWJQT3JXSG8rZkdhN0RuUk1DMy9aZDNlVHV0d0J5TEtQakpVaTNtNXhzdXJF?=
 =?utf-8?B?TWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <88D3B3ABEF2C774E920E6FAACDB76493@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5885.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bb8d399-21ef-4496-fdf4-08dbd15338e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2023 09:59:16.9942 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +JXKrpkP1bZwOrPUy5cWt/VYR+MEeRrSCk6+Loi1GoYi71yX4hVz72oM2wypvHFlhTDQGH4BbDyfBw6rg5vWJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7471
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--18.732000-8.000000
X-TMASE-MatchedRID: UWn79NfEZzbUL3YCMmnG4ia1MaKuob8PCJpCCsn6HCHBnyal/eRn3gzR
 CsGHURLuwpcJm2NYlPAF6GY0Fb6yCifZYRtbOr2tXP5rFAucBUHljSRvSGpq3PdsGrGaOKdNMKw
 CZ7huGiG36SL29gBZ5rBuXDodorqao27xiIuUglANiHVTPrO/oy4tncCojEfcVz8J52OVy+Qh9u
 bLG9wIkLtIN7DxycS/PsyXYoMXngjyvEPF1PTYC6DH6drx3JPVxKAxBgoYewnrVro3qcqd85c1q
 CkooZMTJRbAnoNOMbBSVSlfR6k3DMpFJHzzp4rSr9nDy1FvnfnSde/CNbaZJYzZ6FNX6KaL/lA8
 xyitUkIhJ/ufappeEpGTpe1iiCJq0u+wqOGzSV1WdFebWIc3VsRB0bsfrpPIqxB32o9eGcm/84a
 JNDeaGfa3cADtQ6Vc1QDhOKg6hXrz/YOv/xf/1VK++zmwxPem
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--18.732000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 82004C9708EAEE39D91FA415D93B04B129D828E93C2EFD5B5EEEECDFDD889BFB2000:8
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

T24gVGh1LCAyMDIzLTEwLTE5IGF0IDEwOjE1ICswNTMwLCBWaWpheWFuYW5kIEppdHRhIHdyb3Rl
Og0KPiAgCSANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9y
IG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBv
ciB0aGUgY29udGVudC4NCj4gIA0KPiANCj4gT24gOS8xMS8yMDIzIDg6MDAgQU0sIFlvbmcgV3Ug
d3JvdGU6DQo+ID4gSW5pdGlhbGlzZSBhIG10a19zdnAgaGVhcC4gQ3VycmVudGx5IGp1c3QgYWRk
IGEgbnVsbCBoZWFwLCBQcmVwYXJlDQo+IGZvcg0KPiA+IHRoZSBsYXRlciBwYXRjaGVzLg0KPiA+
IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFlvbmcgV3UgPHlvbmcud3VAbWVkaWF0ZWsuY29tPg0KPiA+
IC0tLQ0KPiA+ICBkcml2ZXJzL2RtYS1idWYvaGVhcHMvS2NvbmZpZyAgICAgICAgICAgfCAgOCAr
Kw0KPiA+ICBkcml2ZXJzL2RtYS1idWYvaGVhcHMvTWFrZWZpbGUgICAgICAgICAgfCAgMSArDQo+
ID4gIGRyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9tdGtfc2VjdXJlX2hlYXAuYyB8IDk5DQo+ICsrKysr
KysrKysrKysrKysrKysrKysrKysNCj4gPiAgMyBmaWxlcyBjaGFuZ2VkLCAxMDggaW5zZXJ0aW9u
cygrKQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9kbWEtYnVmL2hlYXBzL210a19z
ZWN1cmVfaGVhcC5jDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi9oZWFw
cy9LY29uZmlnIGIvZHJpdmVycy9kbWEtDQo+IGJ1Zi9oZWFwcy9LY29uZmlnDQo+ID4gaW5kZXgg
YTVlZWYwNmM0MjI2Li43MjljMGNmM2ViN2MgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9kbWEt
YnVmL2hlYXBzL0tjb25maWcNCj4gPiArKysgYi9kcml2ZXJzL2RtYS1idWYvaGVhcHMvS2NvbmZp
Zw0KPiA+IEBAIC0xMiwzICsxMiwxMSBAQCBjb25maWcgRE1BQlVGX0hFQVBTX0NNQQ0KPiA+ICAg
IENob29zZSB0aGlzIG9wdGlvbiB0byBlbmFibGUgZG1hLWJ1ZiBDTUEgaGVhcC4gVGhpcyBoZWFw
IGlzDQo+IGJhY2tlZA0KPiA+ICAgIGJ5IHRoZSBDb250aWd1b3VzIE1lbW9yeSBBbGxvY2F0b3Ig
KENNQSkuIElmIHlvdXIgc3lzdGVtIGhhcw0KPiB0aGVzZQ0KPiA+ICAgIHJlZ2lvbnMsIHlvdSBz
aG91bGQgc2F5IFkgaGVyZS4NCj4gPiArDQo+ID4gK2NvbmZpZyBETUFCVUZfSEVBUFNfTVRLX1NF
Q1VSRQ0KPiA+ICtib29sICJETUEtQlVGIE1lZGlhVGVrIFNlY3VyZSBIZWFwIg0KPiA+ICtkZXBl
bmRzIG9uIERNQUJVRl9IRUFQUyAmJiBURUUNCj4gPiAraGVscA0KPiA+ICsgIENob29zZSB0aGlz
IG9wdGlvbiB0byBlbmFibGUgZG1hLWJ1ZiBNZWRpYVRlayBzZWN1cmUgaGVhcCBmb3INCj4gU2Vj
dXJlDQo+ID4gKyAgVmlkZW8gUGF0aC4gVGhpcyBoZWFwIGlzIGJhY2tlZCBieSBURUUgY2xpZW50
IGludGVyZmFjZXMuIElmIGluDQo+ID4gKyAgZG91YnQsIHNheSBOLg0KPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2RtYS1idWYvaGVhcHMvTWFrZWZpbGUgYi9kcml2ZXJzL2RtYS0NCj4gYnVmL2hl
YXBzL01ha2VmaWxlDQo+ID4gaW5kZXggOTc0NDY3NzkxMDMyLi5kZjU1OWRiZTMzZmUgMTAwNjQ0
DQo+ID4gLS0tIGEvZHJpdmVycy9kbWEtYnVmL2hlYXBzL01ha2VmaWxlDQo+ID4gKysrIGIvZHJp
dmVycy9kbWEtYnVmL2hlYXBzL01ha2VmaWxlDQo+ID4gQEAgLTEsMyArMSw0IEBADQo+ID4gICMg
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCj4gPiAgb2JqLSQoQ09ORklHX0RNQUJV
Rl9IRUFQU19TWVNURU0pKz0gc3lzdGVtX2hlYXAubw0KPiA+ICBvYmotJChDT05GSUdfRE1BQlVG
X0hFQVBTX0NNQSkrPSBjbWFfaGVhcC5vDQo+ID4gK29iai0kKENPTkZJR19ETUFCVUZfSEVBUFNf
TVRLX1NFQ1VSRSkrPSBtdGtfc2VjdXJlX2hlYXAubw0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2RtYS1idWYvaGVhcHMvbXRrX3NlY3VyZV9oZWFwLmMgYi9kcml2ZXJzL2RtYS0NCj4gYnVmL2hl
YXBzL210a19zZWN1cmVfaGVhcC5jDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRl
eCAwMDAwMDAwMDAwMDAuLmJiZjFjOGRjZTIzZQ0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysg
Yi9kcml2ZXJzL2RtYS1idWYvaGVhcHMvbXRrX3NlY3VyZV9oZWFwLmMNCj4gPiBAQCAtMCwwICsx
LDk5IEBADQo+ID4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wDQo+ID4gKy8q
DQo+ID4gKyAqIERNQUJVRiBtdGtfc2VjdXJlX2hlYXAgZXhwb3J0ZXINCj4gPiArICoNCj4gPiAr
ICogQ29weXJpZ2h0IChDKSAyMDIzIE1lZGlhVGVrIEluYy4NCj4gPiArICovDQo+ID4gKw0KPiA+
ICsjaW5jbHVkZSA8bGludXgvZG1hLWJ1Zi5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvZG1hLWhl
YXAuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L2Vyci5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgv
bW9kdWxlLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9zbGFiLmg+DQo+ID4gKw0KPiA+ICsvKg0K
PiA+ICsgKiBNZWRpYVRlayBzZWN1cmUgKGNodW5rKSBtZW1vcnkgdHlwZQ0KPiA+ICsgKg0KPiA+
ICsgKiBAS1JFRV9NRU1fU0VDX0NNX1RaOiBzdGF0aWMgY2h1bmsgbWVtb3J5IGNhcnZlZCBvdXQg
Zm9yDQo+IHRydXN0em9uZS4NCj4gPiArICovDQo+ID4gK2VudW0ga3JlZV9tZW1fdHlwZSB7DQo+
ID4gK0tSRUVfTUVNX1NFQ19DTV9UWiA9IDEsDQo+ID4gK307DQo+ID4gKw0KPiA+ICtzdHJ1Y3Qg
bXRrX3NlY3VyZV9oZWFwX2J1ZmZlciB7DQo+ID4gK3N0cnVjdCBkbWFfaGVhcCpoZWFwOw0KPiA+
ICtzaXplX3RzaXplOw0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArc3RydWN0IG10a19zZWN1cmVfaGVh
cCB7DQo+ID4gK2NvbnN0IGNoYXIqbmFtZTsNCj4gPiArY29uc3QgZW51bSBrcmVlX21lbV90eXBl
IG1lbV90eXBlOw0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArc3RhdGljIHN0cnVjdCBkbWFfYnVmICoN
Cj4gPiArbXRrX3NlY19oZWFwX2FsbG9jYXRlKHN0cnVjdCBkbWFfaGVhcCAqaGVhcCwgc2l6ZV90
IHNpemUsDQo+ID4gKyAgICAgIHVuc2lnbmVkIGxvbmcgZmRfZmxhZ3MsIHVuc2lnbmVkIGxvbmcg
aGVhcF9mbGFncykNCj4gPiArew0KPiA+ICtzdHJ1Y3QgbXRrX3NlY3VyZV9oZWFwX2J1ZmZlciAq
c2VjX2J1ZjsNCj4gPiArREVGSU5FX0RNQV9CVUZfRVhQT1JUX0lORk8oZXhwX2luZm8pOw0KPiA+
ICtzdHJ1Y3QgZG1hX2J1ZiAqZG1hYnVmOw0KPiA+ICtpbnQgcmV0Ow0KPiA+ICsNCj4gPiArc2Vj
X2J1ZiA9IGt6YWxsb2Moc2l6ZW9mKCpzZWNfYnVmKSwgR0ZQX0tFUk5FTCk7DQo+IA0KPiBBcyB3
ZSBrbm93LCBremFsbG9jIGNhbiBvbmx5IGFsbG9jYXRlIDRNQiBhdCBtYXguIFNvLCBzZWN1cmUg
aGVhcCBoYXMNCj4gdGhpcyBsaW1pdGF0aW9uLg0KPiBjYW4gd2UgaGF2ZSBhIHdheSB0byBhbGxv
Y2F0ZSBtb3JlIG1lbW9yeSBpbiBzZWN1cmUgaGVhcCA/IG1heWJlDQo+IHNpbWlsYXIgdG8gaG93
IHN5c3RlbSBoZWFwIGRvZXM/DQoNClRoaXMgaXMganVzdCB0aGUgc2l6ZSBvZiBhIGludGVybmFs
IHN0cnVjdHVyZS4gSSBndWVzcyB5b3UgbWVhbiB0aGUNCnNlY3VyZSBtZW1vcnkgc2l6ZSBoZXJl
LiBSZWdhcmRpbmcgc2VjdXJlIG1lbW9yeSBhbGxvY2F0aW5nIGZsb3csIG91cg0KZmxvdyBtYXkg
YmUgZGlmZmVyZW50IHdpdGggeW91cnMuDQoNCkxldCBtZSBleHBsYWluIG91ciBmbG93LCB3ZSBo
YXZlIHR3byBzZWN1cmUgYnVmZmVyIHR5cGVzKGhlYXBzKS4NCmEpIG10a19zdnANCmIpIG10a19z
dnBfY21hIHdoaWNoIHJlcXVpcmVzIHRoZSBjbWEgYmluZGluZy4NCg0KVGhlIG1lbW9yeSBtYW5h
Z2VtZW50IG9mIGJvdGggaXMgaW5zaWRlIHRoZSBURUUuIFdlIG9ubHkgbmVlZCB0byB0ZWxsDQp0
aGUgVEVFIHdoaWNoIHR5cGUgYW5kIHNpemUgb2YgYnVmZmVyIHdlIHdhbnQsIGFuZCB0aGVuIHRo
ZSBURUUgd2lsbA0KcGVyZm9ybSBhbmQgcmV0dXJuIHRoZSBtZW1vcnkgaGFuZGxlIHRvIHRoZSBr
ZXJuZWwuIFRoZQ0Ka3phbGxvYy9hbGxvY19wYWdlcyBpcyBmb3IgdGhlIG5vcm1hbCBidWZmZXJz
Lg0KDQpSZWdhcmRpbmcgdGhlIENNQSBidWZmZXIsIHdlIG9ubHkgY2FsbCBjbWFfYWxsb2Mgb25j
ZSwgYW5kIGl0cw0KbWFuYWdlbWVudCBpcyBhbHNvIHdpdGhpbiB0aGUgVEVFLg0KDQo+IA0KPiBU
aGFua3MsDQo+IFZpamF5DQo+IA0K
