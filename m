Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D33615BE9
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 06:38:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C46B10E030;
	Wed,  2 Nov 2022 05:38:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B13D10E030
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Nov 2022 05:38:00 +0000 (UTC)
X-UUID: c03cb30bf9ef48778ec54ff6eff8d4ac-20221102
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=QGvvvJe74xE3tGimdMMjt2UFgZqRosmQMZftm8aNqmg=; 
 b=tmoLUniRa6gQdYx+sd8keQMUi5A1zUyOptKNFe3EElmNNVg0g+yMii3muOk9lfMI5UKNg6jdKt1mLKXc3oKN2a0rDFvSbmL6gCVQLPOuTQvTqN+0pdxYeUjz6F6ilGevffDFkvAxzlw1Gmxxf+zQf/va5akJOMHh+pjUj0HxR1o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12, REQID:695e4c12-494c-48ac-8ac4-b34c127cea8e, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:62cd327, CLOUDID:09c05c81-3116-4fbc-b86b-83475c3df513,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: c03cb30bf9ef48778ec54ff6eff8d4ac-20221102
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 170763220; Wed, 02 Nov 2022 13:37:56 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 2 Nov 2022 13:37:55 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n1.mediatek.com (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.792.15 via Frontend Transport; Wed, 2 Nov 2022 13:37:55 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C+XGJfUq7zsh5SOjgWexMYFwRasWFhD1LLCdFs9jREw553vjGixpMfUybtRqhtvahAEOKLxJUML6QZSxPeJXb43JBYmcqjCL6LU2dcm5FDWlk1mGpUBW6aG6d2ZaCchMo0a8yo2EDjOgXRf3l7OmmaRuEtsy/KDk+SOi1fxbFLlPHYIbkbKIOeq0QxLnTUcTQjSJS/rz+i1+84x2BU0fVgmB2od0srLkUTN2veYX/W8Lge55eTgX2uPw3E7Gkj8GIrdk0cyh5onT+fC51zk28ViNKl6FVgsVADJrSYyhUaVZz72kab0ki3pJ3uJFSKX7y17KAvsTooFbKYDFCVlDPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CNwEm/Q1K3H3AV1rMEnQIPB6QOT/V1JMPp7tY1nzxOM=;
 b=CDMCol1jhlE6fpu7XaDaWKEsxuub74HLhk+d++6hZ4kpb3lbcuDBpI56rlluo7lfPjGUHFZQ5FGZ24yKc2AFcqfm6030zS5fLgAFvScZMg0DiLXL46s5G/bHrteC+l1v8bON+oxcYbXix5s7lFD8kyIcUTqCVElemyIkwQXPgBgk66K9EDVOEjanjzaDywmP0SJlvQV7NYi0utok/5N7AplrkxxX9ccILGOnbxeW/mvkrWMYDGQYWwvVD+50hyNbf/fyciftxt1pW7GRqFaf3iPEqyyBEVinrMwZYZY3yN7wxonxHZDgbRIBoD2tVA9HYVbiwqUjURHt+nn0zXTGgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CNwEm/Q1K3H3AV1rMEnQIPB6QOT/V1JMPp7tY1nzxOM=;
 b=ll2XImx2qrbH2KqXIPtopWpGmT0KNUTFX3wzjnjt/983BnndWD2zUrz1dv/91cGkF0v6j4Ch2fNur6ORrohMWW8zZUp59+7OToSyfdQTWG2FGra7kGZsyOgBysnn5R679WIuDMCzRrK1/Tgb76/dcmxeYjMXd/MRMKt68/jvttc=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEYPR03MB6602.apcprd03.prod.outlook.com (2603:1096:101:86::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.10; Wed, 2 Nov
 2022 05:37:53 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9df1:f970:54b3:a25a]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9df1:f970:54b3:a25a%9]) with mapi id 15.20.5791.019; Wed, 2 Nov 2022
 05:37:53 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "seanpaul@chromium.org" <seanpaul@chromium.org>, "dianders@chromium.org"
 <dianders@chromium.org>, "hsinyi@chromium.org" <hsinyi@chromium.org>
Subject: Re: [PATCH] drm_bridge: register content protect property
Thread-Topic: [PATCH] drm_bridge: register content protect property
Thread-Index: AQHY3Vr+KZE3j3AN3k2CNKhgXJGsPa4rP8oA
Date: Wed, 2 Nov 2022 05:37:53 +0000
Message-ID: <fa5cb82c422c5774130e88da9bc19943291cd754.camel@mediatek.com>
References: <20221011101850.200455-1-hsinyi@chromium.org>
In-Reply-To: <20221011101850.200455-1-hsinyi@chromium.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEYPR03MB6602:EE_
x-ms-office365-filtering-correlation-id: de6dc9b0-a523-4004-4406-08dabc946363
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i/k8YV21IKcLHT4uXGF9JuGR5M5ZniDZe99QhFyRnLwc1kqamQDpoa9bnjM9ZJacSoqP1m4vWs0/JbswqRaqN4tmjcLJJ0Edwxd1n6EkH0Th+PtdxzsFdVLS/YHerdzWl880ocS+hDTV79BDcrGsFXF83FTLAfD/z5MfRp5cdjnhBWb8IBG734tRdM2/cjlaxwYbYrRI1Y+UdOBZmfaU/L4b9RIe7wDmB6D+nktrx8L1rw6hjyRlPUKnx09mIlM9mruVRJ9dZN4wiFMx59w/J05xBXm4+VqF/6eTxnrzaSEl6zYs+IFyEQYBz9X4Z1r/urGF/L+kzoqD0C2xBiyWvXtjYwKfbJddprlWsGgE8l6T1BvspRAMICu1NNxKiFO/LdJuIpwpr8yG3WSmvVaQSxBSDQvNyzFLcLSxp04M0M1UMcZQIs4FJ78iBArwlcFAbglWBG9YHDcdvpQxz8aHT5hWGOMjS/rM8qgPp5AJs5Y3lOwXtNekuG1asn7yLpEfwwYewSVjUb6cQQuJ3qnACd9AQbQv8NR4KIL+edLyOeuIu/1DakhyO6ymDIlluc4KdxGJADzsi3HDgMUxhqDs8yb/ejm/Sf2YU/jSnh3NJI7cHisEVQ67VxgrhRl1R+O5JiIIu7BLvcyX0gUO0Yf2GGRWLKuv5PH9FNlNBWjKUm45EAGxjiNqzlBLFQlSAvf2JEm6iJlcjHXO6yGjDhHg6uGeuxUKlHMpAi+IQWD7ek1UfQ4pEKmQUR4KTePlgcuX
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(396003)(136003)(366004)(346002)(451199015)(83380400001)(86362001)(6512007)(38070700005)(122000001)(38100700002)(2906002)(5660300002)(64756008)(66476007)(4326008)(76116006)(4001150100001)(66946007)(41300700001)(8936002)(6506007)(478600001)(186003)(110136005)(54906003)(71200400001)(8676002)(66556008)(316002)(66446008)(26005)(6486002)(36756003)(85182001)(2616005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aUQ1anBkaXVrZ3hCbW41TzBrTThia2xOYU9ZclI3ZG1aK2xoWm1kMStMTFZY?=
 =?utf-8?B?bFNnYXFKSStpN0dqbmFRbGl4aGU2TXc3NGVXV29EMVZ3ajVvNXhJMC9MQkJP?=
 =?utf-8?B?ZDcwdHQ4RllUeGVwWVpSbHB2a2tQbGxFU3IvNlVBN0Q2U1JjNktIVnd1M29X?=
 =?utf-8?B?NzZwZFlOZEw5bFlJRmxucm9meHh2YkhqQnVVSk5ya05nUXRQbkdQRmhxNVdH?=
 =?utf-8?B?WlJxUTU0VEtSMEorQUY1S3ZBbWpjRDlQY0dIQm9PVVZwY01ONnMxMVEraWFC?=
 =?utf-8?B?WVJoUVBBSFltNTc5S2drSTNGQlZsMllMVWJsWG9LK1BLWFFlMmZFR29LZHR4?=
 =?utf-8?B?Z2hkeFZzMEphV3F3NEtvcTNDbEdYajk5ZURvWXBMM3R0dDNNZVc0MUN6em5M?=
 =?utf-8?B?TEJTTnJFTThTUnFDS2J4T3RGTld0OWRGbG5GaVJESXJWVXNUUlhYeXNmYmRt?=
 =?utf-8?B?ZEZNTmVadVk5Z3h0alBNaUZweEU5Nk1sUG9mZDhJOXZnbDAyU2FjK1hlV2NQ?=
 =?utf-8?B?dUl5Q1R1K1cvcnNibDhYU1JnUEpGMW1pazFyTGxSUzEwRWRhMDB1amRXQ1ZM?=
 =?utf-8?B?dElGRHR4MG0yUUhlTzA5Wno4dklpYlU4aTRHa0V0UGc5ekpiNjdKdE9RMEpU?=
 =?utf-8?B?VVRQemNLeEhaZXl2K2ppem94SEpaSmFPNmZ4bmRVREFzT3E5YSsrVmk4M1Ur?=
 =?utf-8?B?d2NQbWJ5Z282TG5lc050TWw5NEFHTVNadEhSSE9mOUFBbVp0YVZXazBScDJt?=
 =?utf-8?B?cXZvM0ZqT0s4RGVGN0lJVzNIdXNsS096aXFTQjU1QWtuM3A2cTZSemJ2cDdM?=
 =?utf-8?B?Qkx1Qzg2Wk9NNGhHSGs0UEYzVEVlSWR5ZWxEWVNCMkJJdlk2SmlYamE3T2c0?=
 =?utf-8?B?TG1sOGU1MjFxaCtaQVFoWHYySml0UDEwZHhFZFluSUcwM2k3ekY4M0hKMDRV?=
 =?utf-8?B?RVVBQSsvbTBXK3hFVVgxcmdhUmpEeGk1MkpPVmFvTWtqUzd3MGFPY25Odkta?=
 =?utf-8?B?VkxUMEFRdzdMZG5SU3NhOGRPMGlFYlR6TDgzUGVjYUlsNmVUTk84cHFOTTlX?=
 =?utf-8?B?RytNMndYNW1pU3NtekZ3Y3RXTktVblFmblhqV1d6eUxud3RsVGwvMStBbkhJ?=
 =?utf-8?B?a3hVcWY2U2NpMDc1Y0xEMWRlQXNhNXpkS1Z4NG5PNE5DRTRDRHRvMjVGbEd6?=
 =?utf-8?B?UmFtVXpiKzZUN2g5Uk5pRERKcVVoN2RSNUFsUUdWRHNsWVdza1N2dXNaQktJ?=
 =?utf-8?B?NTdQMmVJcVI0dExsRGNsTFNSeEpwc1Y3L0VnbHk0Vlk2ajRxNlkwY251SkV3?=
 =?utf-8?B?cjVqSlhnektVY2Jkc01JUVY5MTBYem5UZXg4bWx0WndkRDg3d3dDYjhvZmtT?=
 =?utf-8?B?ZmdyVUlYMzA5dlZWQ0JLNTdUQzRGWUVmaFRqQ1dJYkRzMVNGY2VLOUwrTVJK?=
 =?utf-8?B?cVNBbUpmams1QTBTTFZaVkM4U3RVOXZSMHZ3bEl3a055TjRNM1grc1oyNHdV?=
 =?utf-8?B?VzlTVlNQMTJlN0tuWEVPRlFaaEhTaitTRkU3MUFvSjZkR0lia1RscCs4S21o?=
 =?utf-8?B?ck1zRUJzRHhKVEtZTVdJb1pPTUJlRGxXWm9XRU1zWXFTQkpLeEdGTVpQODJw?=
 =?utf-8?B?MnlQNkJjKzYzYzNnbitZSW9uY2tiSHdsSkhIOWJnbDVGT2MzQnI0bmR1eWd2?=
 =?utf-8?B?cHNHMUN4QVAxVWdiTWtuWXJpZVhTOU9TMjJaWkV6UFBacVo3RW1MRUEzV3lF?=
 =?utf-8?B?bm1URHljODBHc1FBMjVyRjZtSExONXVpeHdJcGNDa0pOVUVieWFqeGhxcnpM?=
 =?utf-8?B?NDJXbG9td0VDKzZ5WDRlUDFrWXZEamxiU1QwTkNYWlpBamJvL0o3TzdXWWtv?=
 =?utf-8?B?NmhQU1ZsYVBTN2QzQXphditob1R2OWQzdnNWNitvZ1ZJM0RrcllockNteVJn?=
 =?utf-8?B?aGxaOXRLZ2phaUp0dUplMXAreDBzaHFlYU9oNSs0ckV2V3htMmlaZjBMdDc3?=
 =?utf-8?B?WlNJaDlDQnptdFZpbnRVaWlObm4zTnhhQTNsUWhuRm16TWNpajBxYkpnMEUx?=
 =?utf-8?B?MWozY0h1V0UxU3NkMzdpZ1hhby9EQ1Iyb2lPWkZPMjlBcWpWclFzeGtML2pK?=
 =?utf-8?Q?GbuwgLAATideOUjioawoaEorx?=
Content-ID: <0B5E3130916D7142BB03F18CD85F3AC7@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de6dc9b0-a523-4004-4406-08dabc946363
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2022 05:37:53.4822 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EEdCKm6wbQH70R+iRVVEmjyxA+rciz18ndjWUMDNiFG5tbNuMMGvDq0Akxsm5WMYLpauQKVUHdOUIUWoGw9v+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6602
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_005_815174373.924776292"
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_005_815174373.924776292
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpLCYjMzI7SHNpbi1ZaToNCg0KT24mIzMyO1R1ZSwmIzMyOzIwMjItMTAtMTEmIzMy
O2F0JiMzMjsxODoxOCYjMzI7KzA4MDAsJiMzMjtIc2luLVlpJiMzMjtXYW5nJiMzMjt3cm90ZToN
CiZndDsmIzMyO1NvbWUmIzMyO2JyaWRnZXMmIzMyO2FyZSYjMzI7YWJsZSYjMzI7dG8mIzMyO3Vw
ZGF0ZSYjMzI7SERDUCYjMzI7c3RhdHVzJiMzMjtmcm9tJiMzMjt1c2Vyc3BhY2UmIzMyO3JlcXVl
c3RzDQomZ3Q7JiMzMjtpZg0KJmd0OyYjMzI7dGhleSYjMzI7c3VwcG9ydCYjMzI7SERDUC4NCiZn
dDsmIzMyOw0KJmd0OyYjMzI7SERDUCYjMzI7cHJvcGVydHkmIzMyO2lzJiMzMjt0aGUmIzMyO3Nh
bWUmIzMyO2FzJiMzMjtvdGhlciYjMzI7Y29ubmVjdG9yJiMzMjtwcm9wZXJ0aWVzJiMzMjt0aGF0
JiMzMjtuZWVkJiMzMjt0bw0KJmd0OyYjMzI7YmUNCiZndDsmIzMyO2NyZWF0ZWQmIzMyO2FmdGVy
JiMzMjt0aGUmIzMyO2Nvbm5lY3RlciYjMzI7aXMmIzMyO2luaXRpYWxpemVkJiMzMjthbmQmIzMy
O2JlZm9yZSYjMzI7dGhlJiMzMjtjb25uZWN0b3INCiZndDsmIzMyO2lzDQomZ3Q7JiMzMjtyZWdp
c3RlcmVkLg0KDQpTbyYjMzI7dGhpcyYjMzI7aXMmIzMyO2FueDc2MjUmIzMyO3N1cHBvcnQmIzMy
O0hEQ1AsJiMzMjtyaWdodCYjNjM7DQpBbGwmIzMyO2Nvbm5lY3RvciYjMzI7d2l0aCYjMzI7YW54
NzYyNSYjMzI7aGFzJiMzMjt0aGlzJiMzMjtwcm9ibGVtLCYjMzI7c28mIzMyO0kmIzMyO3RoaW5r
JiMzMjt0aGlzJiMzMjtzaG91bGQmIzMyO2JlDQpkb25lJiMzMjtpbiYjMzI7ZHJtJiMzMjtjb3Jl
JiMzMjtub3QmIzMyO2luJiMzMjtlYWNoJiMzMjtTb0MmIzMyO2RyaXZlci4NCg0KUmVnYXJkcywN
CkNLDQoNCiZndDsmIzMyOw0KJmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMyO0hzaW4tWWkmIzMy
O1dhbmcmIzMyOyZsdDtoc2lueWlAY2hyb21pdW0ub3JnJmd0Ow0KJmd0OyYjMzI7LS0tDQomZ3Q7
JiMzMjsmIzMyO2RyaXZlcnMvZ3B1L2RybS9kcm1fYnJpZGdlX2Nvbm5lY3Rvci5jJiMzMjt8JiMz
MjszJiMzMjsrKysNCiZndDsmIzMyOyYjMzI7MSYjMzI7ZmlsZSYjMzI7Y2hhbmdlZCwmIzMyOzMm
IzMyO2luc2VydGlvbnMoKykNCiZndDsmIzMyOw0KJmd0OyYjMzI7ZGlmZiYjMzI7LS1naXQmIzMy
O2EvZHJpdmVycy9ncHUvZHJtL2RybV9icmlkZ2VfY29ubmVjdG9yLmMNCiZndDsmIzMyO2IvZHJp
dmVycy9ncHUvZHJtL2RybV9icmlkZ2VfY29ubmVjdG9yLmMNCiZndDsmIzMyO2luZGV4JiMzMjsx
YzdkOTM2NTIzZGY1Li5hM2I5ZWY4ZGMzZjBiJiMzMjsxMDA2NDQNCiZndDsmIzMyOy0tLSYjMzI7
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX2JyaWRnZV9jb25uZWN0b3IuYw0KJmd0OyYjMzI7KysrJiMz
MjtiL2RyaXZlcnMvZ3B1L2RybS9kcm1fYnJpZGdlX2Nvbm5lY3Rvci5jDQomZ3Q7JiMzMjtAQCYj
MzI7LTcsNiYjMzI7KzcsNyYjMzI7QEANCiZndDsmIzMyOyYjMzI7I2luY2x1ZGUmIzMyOyZsdDts
aW51eC9tb2R1bGUuaCZndDsNCiZndDsmIzMyOyYjMzI7I2luY2x1ZGUmIzMyOyZsdDtsaW51eC9z
bGFiLmgmZ3Q7DQomZ3Q7JiMzMjsmIzMyOw0KJmd0OyYjMzI7KyNpbmNsdWRlJiMzMjsmbHQ7ZHJt
L2Rpc3BsYXkvZHJtX2hkY3BfaGVscGVyLmgmZ3Q7DQomZ3Q7JiMzMjsmIzMyOyNpbmNsdWRlJiMz
MjsmbHQ7ZHJtL2RybV9hdG9taWNfc3RhdGVfaGVscGVyLmgmZ3Q7DQomZ3Q7JiMzMjsmIzMyOyNp
bmNsdWRlJiMzMjsmbHQ7ZHJtL2RybV9icmlkZ2UuaCZndDsNCiZndDsmIzMyOyYjMzI7I2luY2x1
ZGUmIzMyOyZsdDtkcm0vZHJtX2JyaWRnZV9jb25uZWN0b3IuaCZndDsNCiZndDsmIzMyO0BAJiMz
MjstMzk4LDYmIzMyOyszOTksOCYjMzI7QEAmIzMyO3N0cnVjdCYjMzI7ZHJtX2Nvbm5lY3Rvcg0K
Jmd0OyYjMzI7KmRybV9icmlkZ2VfY29ubmVjdG9yX2luaXQoc3RydWN0JiMzMjtkcm1fZGV2aWNl
JiMzMjsqZHJtLA0KJmd0OyYjMzI7JiMzMjtpZiYjMzI7KHBhbmVsX2JyaWRnZSkNCiZndDsmIzMy
OyYjMzI7ZHJtX3BhbmVsX2JyaWRnZV9zZXRfb3JpZW50YXRpb24oY29ubmVjdG9yLA0KJmd0OyYj
MzI7cGFuZWxfYnJpZGdlKTsNCiZndDsmIzMyOyYjMzI7DQomZ3Q7JiMzMjsrZHJtX2Nvbm5lY3Rv
cl9hdHRhY2hfY29udGVudF9wcm90ZWN0aW9uX3Byb3BlcnR5KGNvbm5lY3RvciwNCiZndDsmIzMy
O3RydWUpOw0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7JiMzMjtyZXR1cm4mIzMyO2Nvbm5lY3RvcjsN
CiZndDsmIzMyOyYjMzI7fQ0KJmd0OyYjMzI7JiMzMjtFWFBPUlRfU1lNQk9MX0dQTChkcm1fYnJp
ZGdlX2Nvbm5lY3Rvcl9pbml0KTsNCg0KPC9wcmU+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHBy
ZT4qKioqKioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UNCiAqKioqKioq
KioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBt
ZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRpYWws
IHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Ns
b3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNvbnZl
eWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1p
bmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9m
IHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQg
cmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVs
LiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9y
IGJlbGlldmUNCiANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3Is
IHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0
aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAo
aW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0K
ZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4g
VGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_005_815174373.924776292
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEhzaW4tWWk6DQoNCk9uIFR1ZSwgMjAyMi0xMC0xMSBhdCAxODoxOCArMDgwMCwgSHNpbi1Z
aSBXYW5nIHdyb3RlOg0KPiBTb21lIGJyaWRnZXMgYXJlIGFibGUgdG8gdXBkYXRlIEhEQ1Agc3Rh
dHVzIGZyb20gdXNlcnNwYWNlIHJlcXVlc3RzDQo+IGlmDQo+IHRoZXkgc3VwcG9ydCBIRENQLg0K
PiANCj4gSERDUCBwcm9wZXJ0eSBpcyB0aGUgc2FtZSBhcyBvdGhlciBjb25uZWN0b3IgcHJvcGVy
dGllcyB0aGF0IG5lZWQgdG8NCj4gYmUNCj4gY3JlYXRlZCBhZnRlciB0aGUgY29ubmVjdGVyIGlz
IGluaXRpYWxpemVkIGFuZCBiZWZvcmUgdGhlIGNvbm5lY3Rvcg0KPiBpcw0KPiByZWdpc3RlcmVk
Lg0KDQpTbyB0aGlzIGlzIGFueDc2MjUgc3VwcG9ydCBIRENQLCByaWdodD8NCkFsbCBjb25uZWN0
b3Igd2l0aCBhbng3NjI1IGhhcyB0aGlzIHByb2JsZW0sIHNvIEkgdGhpbmsgdGhpcyBzaG91bGQg
YmUNCmRvbmUgaW4gZHJtIGNvcmUgbm90IGluIGVhY2ggU29DIGRyaXZlci4NCg0KUmVnYXJkcywN
CkNLDQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEhzaW4tWWkgV2FuZyA8aHNpbnlpQGNocm9taXVt
Lm9yZz4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2JyaWRnZV9jb25uZWN0b3IuYyB8
IDMgKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9icmlkZ2VfY29ubmVjdG9yLmMNCj4gYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX2JyaWRnZV9jb25uZWN0b3IuYw0KPiBpbmRleCAxYzdkOTM2NTIzZGY1Li5h
M2I5ZWY4ZGMzZjBiIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2JyaWRnZV9j
b25uZWN0b3IuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2JyaWRnZV9jb25uZWN0b3Iu
Yw0KPiBAQCAtNyw2ICs3LDcgQEANCj4gICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4NCj4gICNp
bmNsdWRlIDxsaW51eC9zbGFiLmg+DQo+ICANCj4gKyNpbmNsdWRlIDxkcm0vZGlzcGxheS9kcm1f
aGRjcF9oZWxwZXIuaD4NCj4gICNpbmNsdWRlIDxkcm0vZHJtX2F0b21pY19zdGF0ZV9oZWxwZXIu
aD4NCj4gICNpbmNsdWRlIDxkcm0vZHJtX2JyaWRnZS5oPg0KPiAgI2luY2x1ZGUgPGRybS9kcm1f
YnJpZGdlX2Nvbm5lY3Rvci5oPg0KPiBAQCAtMzk4LDYgKzM5OSw4IEBAIHN0cnVjdCBkcm1fY29u
bmVjdG9yDQo+ICpkcm1fYnJpZGdlX2Nvbm5lY3Rvcl9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpk
cm0sDQo+ICAJaWYgKHBhbmVsX2JyaWRnZSkNCj4gIAkJZHJtX3BhbmVsX2JyaWRnZV9zZXRfb3Jp
ZW50YXRpb24oY29ubmVjdG9yLA0KPiBwYW5lbF9icmlkZ2UpOw0KPiAgDQo+ICsJZHJtX2Nvbm5l
Y3Rvcl9hdHRhY2hfY29udGVudF9wcm90ZWN0aW9uX3Byb3BlcnR5KGNvbm5lY3RvciwNCj4gdHJ1
ZSk7DQo+ICsNCj4gIAlyZXR1cm4gY29ubmVjdG9yOw0KPiAgfQ0KPiAgRVhQT1JUX1NZTUJPTF9H
UEwoZHJtX2JyaWRnZV9jb25uZWN0b3JfaW5pdCk7DQo=

--__=_Part_Boundary_005_815174373.924776292--

