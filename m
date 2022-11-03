Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B4C617654
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 06:46:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC3D510E596;
	Thu,  3 Nov 2022 05:46:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 502A410E596
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 05:46:32 +0000 (UTC)
X-UUID: 443a7094c04a4ff6bb102aa20d3e0b04-20221103
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=CIplGAg1werGWXMICEIhkVnqsqJApwVVV+rPEBrj6Bw=; 
 b=eufN+Hj8sWgKIRIog9VAj04EZY8eDSNIeYhEqguBzvZkKyG2ZE1E31MGtwAhhI8Wr+o79+rDi9QddfLw8mIqaLirdg4ryFMAJfO9vrjcWm4QOLFkHO1Cb5HSfL16iu9lHDBomGDVNYlnVYW42dPlaxwDAzLOIlmVrGzV+YOT7l4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12, REQID:982a5fa5-1553-499d-8c66-431423dff465, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:62cd327, CLOUDID:44af7b81-3116-4fbc-b86b-83475c3df513,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 443a7094c04a4ff6bb102aa20d3e0b04-20221103
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 478881876; Thu, 03 Nov 2022 13:46:16 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 3 Nov 2022 13:46:15 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n1.mediatek.com (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.792.15 via Frontend Transport; Thu, 3 Nov 2022 13:46:14 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YHOCyNDRpbipePAqdTp3P/4DQrOb/DHwPpajqd0ZCigUR368Vcu6iw+tw/dBaPtOxutY5N3PAWJN1qYRw+UAWJYfysaQ/WnJO7xc+jarcyjzYPhHe7xCvTCLEEm8lc3YMwWXM+UsKzbgA+YmNrsRD5YCHGdkOk5TgOxxW9/s42C8++0KzJiTCOxhE3VR9ulp8qpeWpYegKkAvL58DluFrqOKGIiQiJMPgFyi2UtmGjKQaikXSGcQ7bY9pCoic5Gmx8bhklCyOnyBxcckZPdTxCb+zPxDdWNHDmTr3hS9AiuLHxpOc0DebczrXXTDtx9wgawEeEVoGTbYyDwUD2j2Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NP7fNFEp3Iyks1u+1GJkr+zcXyllPHlY43iFpMktfUc=;
 b=CLJWYLYlHY9aRLm7taN2eKzw49nw6s5nr/hNq4rDVyXgwVDnqy9UeS65XI19Peu0+WpNjEeJ2NpiqLP2iL5o1v2x/SM8MSaZj4ge8tJAPNPZfmO3kAoB0Rp+qpyJzXL8KTz3cvLIJixMGiPCRGUNUPwl1Hg+CAEl41LRWL39YkBM5VP7+/3x8bHdsfLJDsqBiY+fRH4Hx2vjgpEkJstNq12++dG93F4VROPp/l/ok+sKcsyjmHxKfVXdQtPOMGQ3Dp/x49vM9WFt7qO2QcRVPhptucHEiEv9AXO5lp6aH3RhedGTqWIKfZIzoxjhXM4Zbq0WP6+J6dN47UB3v4LRxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NP7fNFEp3Iyks1u+1GJkr+zcXyllPHlY43iFpMktfUc=;
 b=OTA2doZqTs1J5siUSpErlEL9KNl3vSy72550236dePAMFS6Kii16tTO1VJunByODq9PDhSQJ0oeN5pFc4IijAPj6FBELEgWoaGT+ePJqNdgVJuE6Ob09VYA02Alm3oysei399kS1/Hu9Gr16Yc/kBQFD9dQtgqVNT/G6hBvzpAU=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SI2PR03MB6488.apcprd03.prod.outlook.com (2603:1096:4:1a7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.19; Thu, 3 Nov
 2022 05:46:12 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9df1:f970:54b3:a25a]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9df1:f970:54b3:a25a%9]) with mapi id 15.20.5791.019; Thu, 3 Nov 2022
 05:46:12 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "seanpaul@chromium.org" <seanpaul@chromium.org>, "dianders@chromium.org"
 <dianders@chromium.org>, "hsinyi@chromium.org" <hsinyi@chromium.org>
Subject: Re: [PATCH] drm_bridge: register content protect property
Thread-Topic: [PATCH] drm_bridge: register content protect property
Thread-Index: AQHY3Vr+KZE3j3AN3k2CNKhgXJGsPa4rP8oAgAGUp4A=
Date: Thu, 3 Nov 2022 05:46:12 +0000
Message-ID: <50b564058516f98a211d72b1bd7a0e3b00c674e0.camel@mediatek.com>
References: <20221011101850.200455-1-hsinyi@chromium.org>
 <fa5cb82c422c5774130e88da9bc19943291cd754.camel@mediatek.com>
In-Reply-To: <fa5cb82c422c5774130e88da9bc19943291cd754.camel@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SI2PR03MB6488:EE_
x-ms-office365-filtering-correlation-id: a03ec82f-4f1a-43fe-12df-08dabd5eb77b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rxa2oRu/qH5KaB7qrBhkwi9Sl9YTAR9aoUqmApqq12xrXPMtueNTl9OMcA4Ru5GyA6bWASG3IhqL9MZcsytS3r5+y+u7GO3Kv2VOsqvxK8AEIP05WOFfo1AG9BL5v+7yooenSuWE1cv8v6aiMxoXtLl5SNB03ibEjLB70B0J/+Cm52EBT6DCks5aZqVt/+sMOiyTBAh+lp7tOhVdTSnmwHu98wOJOmuwBE+/+PMHqkEFOufGZI6nQ2cT4nuDyYgltQ+FeWRtA7qlLefm2HbaG2vQcdU8hbD/28Nr6m3eWHVllnOmXBcMj+vmVnv/sorE3rlsqZCpbCcyqQxQ7cHtP1v/lF1vYRxcYt53f97Dolpd/k/g2K92BwQeOTVoSG1ELOknC39AVmw+XTe+KvIG5ejXS3QBz7IQI8vkmw2bYmlKa3x/jbvAv+8bIaoJ9Mvtg76g85WJEqqUEHwPUqSr98oP3jN2PfSGMkhZxDjKTQFeGnhLsbGkYAVBEhdEtrOf8HeDHEIpmi4MJ+fUC7ZZ5uKX4pjDdPxEKUZFTsDLaCpq+ulHQl+VPmqqpQll7uRp4678KjDuOTgs1gNpXlxz5ZmG2uXMB201diij0Dn9B4sffNNMOABHHdpiHAkyBrwtIymjlDK+orUoOZXbjqKuHt+sChQ+XzcLVL33oQ4TVDbFz191YE1MO8HqajZIiRFVyLxo/4v2Y+RlSYPGgD0JaH6PFcOD+tO3f/0/Reen4DgLTRljvmS92os6RPkLXjBU
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(376002)(366004)(346002)(396003)(136003)(451199015)(110136005)(6486002)(5660300002)(478600001)(8936002)(4001150100001)(41300700001)(54906003)(86362001)(36756003)(316002)(2906002)(71200400001)(6512007)(26005)(2616005)(38100700002)(6506007)(83380400001)(38070700005)(122000001)(76116006)(186003)(4326008)(66946007)(91956017)(66556008)(85182001)(66446008)(66476007)(64756008)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q0cyVlZYMkJraE5WUFpHZlUrUWJ6VmhzVnNkN2s5K0NxTDIzVTY5QkNVY216?=
 =?utf-8?B?Z1kxb2VBSjc3c1hhVVpxc1pPMEl6OG5DSXU2NTJZUHBlK0tyaU1HZzlScVhH?=
 =?utf-8?B?VmhkQVdQYi9mVDNqUElwajRkYUw2aTFVY3dqNWNXUFhIbWd0V1FoeENWVzFE?=
 =?utf-8?B?Y2tnaG42TzI2ODlYTDZYNWF5REtqbGFwZHBwVTRsV2FmcnNlSy93RjNHSHEy?=
 =?utf-8?B?QzJocm5yblgrWmlUa3NhTzJUNVJ1UTZiRlpUQ3B3ZmxMMXB3TkZ2dVhvOTRn?=
 =?utf-8?B?OUcyTXdkb1c5S2hUUGZBVDJwRjNXcUFBL2xSSkZXYi9LQ3FRMi9nWFB3U0tz?=
 =?utf-8?B?ODVEWlZGL0MwbVBseGtsL2lXd0lHQzRmUjJ2NXBzeEZ5K21yYmV6eU91YXds?=
 =?utf-8?B?NnF1MnRvL1JLTFVlSGZUcjd4U0w4dzNoNENjTU1PMEdwVllxTzlDMzVtb0dG?=
 =?utf-8?B?T1B4Mjl1eU5xcHMwMlhBclU5QzJ1WUJ0cG5pbFdoMXRqS1R5ZHFLbmRFR1pD?=
 =?utf-8?B?QXNldmhUWnlwSm5FYWduWmhtYWk4N0FLMFhFeERRY0dXMnJ1RkkrV3hwM3NF?=
 =?utf-8?B?R3pIcjQrL1FaZjFpMlFjZk9oUldObXRWdHU0YUxkTGlLenovWnJTVnFLRVFr?=
 =?utf-8?B?TTRDZWFFNGw0S2E3bEhXRk5tKzZRWHhFUDhwRnRXWDhMY2ZESElEV29ZdDds?=
 =?utf-8?B?V0RnUGxyMFVqdWpwWGY5VHNwTnEzd2ErclJQMVFWbG5yNFprK3RtZkNuMlpM?=
 =?utf-8?B?MjZncXlaK1NEbDROdWNFalR4M2NzVW1CS3FkZ1Q0S1Y2TDFCdDQvRWFxeWt5?=
 =?utf-8?B?SFFjNXB0RTRVTXZ3cEZFTUllbXpCSzZ4MU5zTStzOFRGczRDRzJhU1Z3L2d4?=
 =?utf-8?B?c05Yanh2VW9LTHJXRmhaTDJHRWRmdTdZMmNIWDRmR2tCdnlPWEFoTHdPSCtz?=
 =?utf-8?B?K1c2blMwVXppb0RtNzBQMysvUU8yWHU1TXF3T0hGaTZkQ3hlUVJySG40ZWZI?=
 =?utf-8?B?ZTRQZ3ExMC85SDhpNWljVElONTI1VUpWV3RCWDlGMjRqVEtLck1qbkJuM1Fr?=
 =?utf-8?B?OGo4RWdpNmNVVFhqTWwzRTM2UytIMFY2bWVHejdRY3A5MVpRcXdwdzlNWVUv?=
 =?utf-8?B?RWJqdlR0bndTQ3RqL2ZJeVBkYllpZlBLdkdWUkxpcERBRzkyUFAzc2FGalJv?=
 =?utf-8?B?ZXg3enVXYVdqeTBDb1I3K25aWXRya2Y1c1VLUVF4Vks3eVk4ZU1CNTdXZFZz?=
 =?utf-8?B?RzNWd0l3SXpheHp3cDFSY0JYN21JSUFiY3lFN3hFU1hJM29JZk5SZm9ZbEpn?=
 =?utf-8?B?SFBZdXBCMGJVbHY5TTlUZDhFb2ZabnhHWmxNcHFCTUF5dkwrT3M1Mit4Z2pR?=
 =?utf-8?B?bjAyam8wWGRYL2FrS0twalN5UDZEV2xnTWZGTUJ2ZUt4dUxJY0RVT2V2elFt?=
 =?utf-8?B?Si9lTDg4eklIWUhDNnl2Y25uRnBkWVRsbHY0NGJKdno4bFVVbnRacDVvNWY3?=
 =?utf-8?B?Ui9HRXJmenRuRUlvdW5kR0JOZ2Fsa1Ewb2F6ZDRIN1RVeCtxR3NacTVBN1lh?=
 =?utf-8?B?YTFIYU9uWGJjK0EzaXdiRThTaVFBblh6d2JIRGcvSVlhK3UwVWIzdWVsU0RQ?=
 =?utf-8?B?VitCL3owU0o3QzFZSGxVbVlYMG1td3JBSzhzL3JYRUJjVlV3SkFrNW8rWGJz?=
 =?utf-8?B?b0NwemtXeWI5Y0Nodk1wd2dpY2lrODJLdTVvclpNM05kRlZVU0NXaVdSckVQ?=
 =?utf-8?B?VFVncEFJK0Z1KzFHUUFteVp1dy9aNXVZN0REajlqSDY0TkpJaWlJY3p1eHhL?=
 =?utf-8?B?VUhRdFZKTFVMUWhrclFONHpIejIwTHRYa05oMkEzVkJ3K0RPNXR1MWE0c1B0?=
 =?utf-8?B?cmtrbCtVUUVSTlBnTEtXSUV3WkwrUHJITjVuL2VaU0Q0NTl1VDhJVndLMWVv?=
 =?utf-8?B?VmdQWXA1b1ZMMVYwVXMzK2pIUXV1UmJVSDNrYjJmRjFPWnVPai9DU3h1d1l1?=
 =?utf-8?B?dlNoSjRNYmtKVW44RTFieWZQLy9mYTFuSnRCZEhZNW1zRVp1bEZqTVNXNUVZ?=
 =?utf-8?B?QjBLbWVKbVhsSTdjRGF4TWRHaklvamZ0WXdDcjRJSDA1dVBXMWVHZmdtWU9B?=
 =?utf-8?Q?qlzrPkamnQ84QSpfTzCf67l1d?=
Content-ID: <E70E6BC11B741F44A3E74286109DFCD5@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a03ec82f-4f1a-43fe-12df-08dabd5eb77b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2022 05:46:12.8906 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TosXGoGD5W/lTulz4PY/4SeMtZdlSNkpt3DeqepQdrWrb6KhfaHHKy8pQLJlfibqoJ4uv/SiTMiHMEGRjIFHAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB6488
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_007_1448536124.171808289"
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

--__=_Part_Boundary_007_1448536124.171808289
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpLCYjMzI7SHNpbi1ZaToNCg0KT24mIzMyO1dlZCwmIzMyOzIwMjItMTEtMDImIzMy
O2F0JiMzMjsxMzozNyYjMzI7KzA4MDAsJiMzMjtDSyYjMzI7SHUmIzMyO3dyb3RlOg0KJmd0OyYj
MzI7SGksJiMzMjtIc2luLVlpOg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtPbiYjMzI7VHVlLCYjMzI7
MjAyMi0xMC0xMSYjMzI7YXQmIzMyOzE4OjE4JiMzMjsrMDgwMCwmIzMyO0hzaW4tWWkmIzMyO1dh
bmcmIzMyO3dyb3RlOg0KJmd0OyYjMzI7Jmd0OyYjMzI7U29tZSYjMzI7YnJpZGdlcyYjMzI7YXJl
JiMzMjthYmxlJiMzMjt0byYjMzI7dXBkYXRlJiMzMjtIRENQJiMzMjtzdGF0dXMmIzMyO2Zyb20m
IzMyO3VzZXJzcGFjZSYjMzI7cmVxdWVzdHMNCiZndDsmIzMyOyZndDsmIzMyO2lmDQomZ3Q7JiMz
MjsmZ3Q7JiMzMjt0aGV5JiMzMjtzdXBwb3J0JiMzMjtIRENQLg0KJmd0OyYjMzI7Jmd0OyYjMzI7
DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtIRENQJiMzMjtwcm9wZXJ0eSYjMzI7aXMmIzMyO3RoZSYjMzI7
c2FtZSYjMzI7YXMmIzMyO290aGVyJiMzMjtjb25uZWN0b3ImIzMyO3Byb3BlcnRpZXMmIzMyO3Ro
YXQmIzMyO25lZWQNCiZndDsmIzMyOyZndDsmIzMyO3RvDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtiZQ0K
Jmd0OyYjMzI7Jmd0OyYjMzI7Y3JlYXRlZCYjMzI7YWZ0ZXImIzMyO3RoZSYjMzI7Y29ubmVjdGVy
JiMzMjtpcyYjMzI7aW5pdGlhbGl6ZWQmIzMyO2FuZCYjMzI7YmVmb3JlJiMzMjt0aGUmIzMyO2Nv
bm5lY3Rvcg0KJmd0OyYjMzI7Jmd0OyYjMzI7aXMNCiZndDsmIzMyOyZndDsmIzMyO3JlZ2lzdGVy
ZWQuDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1NvJiMzMjt0aGlzJiMzMjtpcyYjMzI7YW54NzYyNSYj
MzI7c3VwcG9ydCYjMzI7SERDUCwmIzMyO3JpZ2h0JiM2MzsNCiZndDsmIzMyO0FsbCYjMzI7Y29u
bmVjdG9yJiMzMjt3aXRoJiMzMjthbng3NjI1JiMzMjtoYXMmIzMyO3RoaXMmIzMyO3Byb2JsZW0s
JiMzMjtzbyYjMzI7SSYjMzI7dGhpbmsmIzMyO3RoaXMmIzMyO3Nob3VsZA0KJmd0OyYjMzI7YmUN
CiZndDsmIzMyO2RvbmUmIzMyO2luJiMzMjtkcm0mIzMyO2NvcmUmIzMyO25vdCYjMzI7aW4mIzMy
O2VhY2gmIzMyO1NvQyYjMzI7ZHJpdmVyLg0KDQpJJiMzMjttaXN1bmRlcnN0YW5kaW5nJiMzMjt0
aGlzJiMzMjtwYXRjaCwmIzMyO3NvJiMzMjtqdXN0JiMzMjtpZ25vcmUmIzMyO215JiMzMjtjb21t
ZW50Lg0KDQpSZWdhcmRzLA0KQ0sNCg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtSZWdhcmRzLA0KJmd0
OyYjMzI7Q0sNCiZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMz
MjtTaWduZWQtb2ZmLWJ5OiYjMzI7SHNpbi1ZaSYjMzI7V2FuZyYjMzI7Jmx0O2hzaW55aUBjaHJv
bWl1bS5vcmcmZ3Q7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjstLS0NCiZndDsmIzMyOyZndDsmIzMyOyYj
MzI7ZHJpdmVycy9ncHUvZHJtL2RybV9icmlkZ2VfY29ubmVjdG9yLmMmIzMyO3wmIzMyOzMmIzMy
OysrKw0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjsxJiMzMjtmaWxlJiMzMjtjaGFuZ2VkLCYjMzI7
MyYjMzI7aW5zZXJ0aW9ucygrKQ0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMz
MjtkaWZmJiMzMjstLWdpdCYjMzI7YS9kcml2ZXJzL2dwdS9kcm0vZHJtX2JyaWRnZV9jb25uZWN0
b3IuYw0KJmd0OyYjMzI7Jmd0OyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX2JyaWRnZV9jb25u
ZWN0b3IuYw0KJmd0OyYjMzI7Jmd0OyYjMzI7aW5kZXgmIzMyOzFjN2Q5MzY1MjNkZjUuLmEzYjll
ZjhkYzNmMGImIzMyOzEwMDY0NA0KJmd0OyYjMzI7Jmd0OyYjMzI7LS0tJiMzMjthL2RyaXZlcnMv
Z3B1L2RybS9kcm1fYnJpZGdlX2Nvbm5lY3Rvci5jDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrKysmIzMy
O2IvZHJpdmVycy9ncHUvZHJtL2RybV9icmlkZ2VfY29ubmVjdG9yLmMNCiZndDsmIzMyOyZndDsm
IzMyO0BAJiMzMjstNyw2JiMzMjsrNyw3JiMzMjtAQA0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjsj
aW5jbHVkZSYjMzI7Jmx0O2xpbnV4L21vZHVsZS5oJmd0Ow0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMz
MjsjaW5jbHVkZSYjMzI7Jmx0O2xpbnV4L3NsYWIuaCZndDsNCiZndDsmIzMyOyZndDsmIzMyOyYj
MzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrI2luY2x1ZGUmIzMyOyZsdDtkcm0vZGlzcGxheS9kcm1f
aGRjcF9oZWxwZXIuaCZndDsNCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7I2luY2x1ZGUmIzMyOyZs
dDtkcm0vZHJtX2F0b21pY19zdGF0ZV9oZWxwZXIuaCZndDsNCiZndDsmIzMyOyZndDsmIzMyOyYj
MzI7I2luY2x1ZGUmIzMyOyZsdDtkcm0vZHJtX2JyaWRnZS5oJmd0Ow0KJmd0OyYjMzI7Jmd0OyYj
MzI7JiMzMjsjaW5jbHVkZSYjMzI7Jmx0O2RybS9kcm1fYnJpZGdlX2Nvbm5lY3Rvci5oJmd0Ow0K
Jmd0OyYjMzI7Jmd0OyYjMzI7QEAmIzMyOy0zOTgsNiYjMzI7KzM5OSw4JiMzMjtAQCYjMzI7c3Ry
dWN0JiMzMjtkcm1fY29ubmVjdG9yDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsqZHJtX2JyaWRnZV9jb25u
ZWN0b3JfaW5pdChzdHJ1Y3QmIzMyO2RybV9kZXZpY2UmIzMyOypkcm0sDQomZ3Q7JiMzMjsmZ3Q7
JiMzMjsmIzMyO2lmJiMzMjsocGFuZWxfYnJpZGdlKQ0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjtk
cm1fcGFuZWxfYnJpZGdlX3NldF9vcmllbnRhdGlvbihjb25uZWN0b3IsDQomZ3Q7JiMzMjsmZ3Q7
JiMzMjtwYW5lbF9icmlkZ2UpOw0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjsNCiZndDsmIzMyOyZn
dDsmIzMyOytkcm1fY29ubmVjdG9yX2F0dGFjaF9jb250ZW50X3Byb3RlY3Rpb25fcHJvcGVydHko
Y29ubmVjdG9yLA0KJmd0OyYjMzI7Jmd0OyYjMzI7dHJ1ZSk7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsr
DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMyO3JldHVybiYjMzI7Y29ubmVjdG9yOw0KJmd0OyYjMzI7
Jmd0OyYjMzI7JiMzMjt9DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMyO0VYUE9SVF9TWU1CT0xfR1BM
KGRybV9icmlkZ2VfY29ubmVjdG9yX2luaXQpOw0KDQo8L3ByZT48IS0tdHlwZTp0ZXh0LS0+PCEt
LXstLT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZSAq
KioqKioqKioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUt
bWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRl
bnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9t
IGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSAN
CmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBk
aXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5
aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50
ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVu
bGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1h
aWwsIG9yIGJlbGlldmUgDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVy
cm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcg
dG8gdGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1h
aWwgKGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBu
b3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJz
b24uIFRoYW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_007_1448536124.171808289
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEhzaW4tWWk6DQoNCk9uIFdlZCwgMjAyMi0xMS0wMiBhdCAxMzozNyArMDgwMCwgQ0sgSHUg
d3JvdGU6DQo+IEhpLCBIc2luLVlpOg0KPiANCj4gT24gVHVlLCAyMDIyLTEwLTExIGF0IDE4OjE4
ICswODAwLCBIc2luLVlpIFdhbmcgd3JvdGU6DQo+ID4gU29tZSBicmlkZ2VzIGFyZSBhYmxlIHRv
IHVwZGF0ZSBIRENQIHN0YXR1cyBmcm9tIHVzZXJzcGFjZSByZXF1ZXN0cw0KPiA+IGlmDQo+ID4g
dGhleSBzdXBwb3J0IEhEQ1AuDQo+ID4gDQo+ID4gSERDUCBwcm9wZXJ0eSBpcyB0aGUgc2FtZSBh
cyBvdGhlciBjb25uZWN0b3IgcHJvcGVydGllcyB0aGF0IG5lZWQNCj4gPiB0bw0KPiA+IGJlDQo+
ID4gY3JlYXRlZCBhZnRlciB0aGUgY29ubmVjdGVyIGlzIGluaXRpYWxpemVkIGFuZCBiZWZvcmUg
dGhlIGNvbm5lY3Rvcg0KPiA+IGlzDQo+ID4gcmVnaXN0ZXJlZC4NCj4gDQo+IFNvIHRoaXMgaXMg
YW54NzYyNSBzdXBwb3J0IEhEQ1AsIHJpZ2h0Pw0KPiBBbGwgY29ubmVjdG9yIHdpdGggYW54NzYy
NSBoYXMgdGhpcyBwcm9ibGVtLCBzbyBJIHRoaW5rIHRoaXMgc2hvdWxkDQo+IGJlDQo+IGRvbmUg
aW4gZHJtIGNvcmUgbm90IGluIGVhY2ggU29DIGRyaXZlci4NCg0KSSBtaXN1bmRlcnN0YW5kaW5n
IHRoaXMgcGF0Y2gsIHNvIGp1c3QgaWdub3JlIG15IGNvbW1lbnQuDQoNClJlZ2FyZHMsDQpDSw0K
DQo+IA0KPiBSZWdhcmRzLA0KPiBDSw0KPiANCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBIc2lu
LVlpIFdhbmcgPGhzaW55aUBjaHJvbWl1bS5vcmc+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvZ3B1
L2RybS9kcm1fYnJpZGdlX2Nvbm5lY3Rvci5jIHwgMyArKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2JyaWRnZV9jb25uZWN0b3IuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL2RybV9icmlkZ2Vf
Y29ubmVjdG9yLmMNCj4gPiBpbmRleCAxYzdkOTM2NTIzZGY1Li5hM2I5ZWY4ZGMzZjBiIDEwMDY0
NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fYnJpZGdlX2Nvbm5lY3Rvci5jDQo+ID4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9icmlkZ2VfY29ubmVjdG9yLmMNCj4gPiBAQCAtNyw2
ICs3LDcgQEANCj4gPiAgI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPg0KPiA+ICAjaW5jbHVkZSA8
bGludXgvc2xhYi5oPg0KPiA+ICANCj4gPiArI2luY2x1ZGUgPGRybS9kaXNwbGF5L2RybV9oZGNw
X2hlbHBlci5oPg0KPiA+ICAjaW5jbHVkZSA8ZHJtL2RybV9hdG9taWNfc3RhdGVfaGVscGVyLmg+
DQo+ID4gICNpbmNsdWRlIDxkcm0vZHJtX2JyaWRnZS5oPg0KPiA+ICAjaW5jbHVkZSA8ZHJtL2Ry
bV9icmlkZ2VfY29ubmVjdG9yLmg+DQo+ID4gQEAgLTM5OCw2ICszOTksOCBAQCBzdHJ1Y3QgZHJt
X2Nvbm5lY3Rvcg0KPiA+ICpkcm1fYnJpZGdlX2Nvbm5lY3Rvcl9pbml0KHN0cnVjdCBkcm1fZGV2
aWNlICpkcm0sDQo+ID4gIAlpZiAocGFuZWxfYnJpZGdlKQ0KPiA+ICAJCWRybV9wYW5lbF9icmlk
Z2Vfc2V0X29yaWVudGF0aW9uKGNvbm5lY3RvciwNCj4gPiBwYW5lbF9icmlkZ2UpOw0KPiA+ICAN
Cj4gPiArCWRybV9jb25uZWN0b3JfYXR0YWNoX2NvbnRlbnRfcHJvdGVjdGlvbl9wcm9wZXJ0eShj
b25uZWN0b3IsDQo+ID4gdHJ1ZSk7DQo+ID4gKw0KPiA+ICAJcmV0dXJuIGNvbm5lY3RvcjsNCj4g
PiAgfQ0KPiA+ICBFWFBPUlRfU1lNQk9MX0dQTChkcm1fYnJpZGdlX2Nvbm5lY3Rvcl9pbml0KTsN
Cg==

--__=_Part_Boundary_007_1448536124.171808289--

