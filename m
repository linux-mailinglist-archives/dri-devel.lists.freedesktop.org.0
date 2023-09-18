Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC39A7A452A
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 10:53:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8905810E0AB;
	Mon, 18 Sep 2023 08:53:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 925BE10E083
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 08:53:05 +0000 (UTC)
X-UUID: c5e10dbe560011eea33bb35ae8d461a2-20230918
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=pHy8wiACSiZ3vfZgfvEtu7U/xVU/lvr/wwDagmLUjw0=; 
 b=mJsR4PNlsZMIJ7jnBYH8M9TqRHwbz9MPDtV978LUh+kaQElQykXTiIUVdJu1VAArKpb3NswiTUjTEZ6MrSvJ+71ON2PhayV7TUBdORaG29lmsRnPHu25759LljLsU4erR+y5AMNUJ0wkD2fc4zauePG18BTiqgc8C5WwBd8O6Gw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31, REQID:425c94bf-cd4b-410a-a683-aab80a4067f1, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:0ad78a4, CLOUDID:b411d3ef-9a6e-4c39-b73e-f2bc08ca3dc5,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: c5e10dbe560011eea33bb35ae8d461a2-20230918
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1578666746; Mon, 18 Sep 2023 16:53:01 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 18 Sep 2023 16:53:00 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Mon, 18 Sep 2023 16:53:00 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U2dZ48Jo39eqTMzdTyoLNHhd5VnERYgwq2nK42e5cOBJrZM+Qvj/PEwtOEV6HgK5S/3hI+/a7ac094EKDrrcVbCKf3WNVUd+7nWaeBwE4vCo8hgI8Dk7BhyCmYExyxxA5MiG2maLc8uT5qNZVrGdtxuDdEIZz3IT9hM0Lrl6bfAN8pENU6vKO/ChmVzhLC8LdBa2gAk2tOlqEzBIXoavsFmDw1x090O/pRYR9e/SZ1TWP5uPfQG9ya2Xjy7Lyk/mBFwuMRbmdr/BuIIpQ6dRnd5BA1CesVZ1yZMupztJaPAxUplqtSw7KPKyBeItL6YGIyF9sPepZpbwEJUZt3wd/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e3cXOdM2/Ba/W/opiBat0CAlHXRnc0ZIR5mxjAuwScc=;
 b=EKW1qegcfPg6hZ+1LA49xTFhi/OxzJcEZ+zwjxhLVoh3IgX/c3w+7I/aDSuI8K22qfL9rFB//ayGrx1j+puHkkJUM00fj0B0xT3prmoVez7P/oaRhvr+adTaaT+mqjmmo08Ut99Y3fNdP2mY+tSSM251orN+EOOTRMxH1L+JVpzYKg06e9TBxp365PDSbdkDx+Veb4vKlGL5m+DAcpXVrx+drkkIdBHh3POY6LXtF94Xm+cpi5vc4bglX+f4DMI5cymO9w9i7SoQqhG+f2cy7+VpKMCcQI2HpqWy+c2bBSwgTlamwJRI8RJyWzoqRJNAAsOrxEXL+vFVjK/7PGwIXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e3cXOdM2/Ba/W/opiBat0CAlHXRnc0ZIR5mxjAuwScc=;
 b=qETL9Rw9XEnWIzX3RxzHzpk0cSwM6eNh8ipa793ksU0x91O/sO9kWrWT+95qPpKRJ2IcGBCNd+By/JRrUCGlwsBnp/T9kidmRV8fiWLFQuPLxTMdHVNkIQ01Vm8RkhWPp/4n0lj6z2HAsxL/qi3PHKnTGektaD1QavMG7FcDygo=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEYPR03MB7793.apcprd03.prod.outlook.com (2603:1096:101:16a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.24; Mon, 18 Sep
 2023 08:51:27 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9c2c:c08a:212f:e984]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9c2c:c08a:212f:e984%6]) with mapi id 15.20.6792.022; Mon, 18 Sep 2023
 08:51:27 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>
Subject: Re: [PATCH v2 02/11] soc: mediatek: Support GCE jump to absolute
Thread-Topic: [PATCH v2 02/11] soc: mediatek: Support GCE jump to absolute
Thread-Index: AQHZ6gwiisdoITke2EGSqJsfiabWzbAgRoUA
Date: Mon, 18 Sep 2023 08:51:27 +0000
Message-ID: <c618e1af098554e4befec787b3bbc073081577e7.camel@mediatek.com>
References: <20230918084207.23604-1-shawn.sung@mediatek.com>
 <20230918084207.23604-3-shawn.sung@mediatek.com>
In-Reply-To: <20230918084207.23604-3-shawn.sung@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEYPR03MB7793:EE_
x-ms-office365-filtering-correlation-id: 7c70ce12-d7ee-413e-36dc-08dbb82471c8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pScqHi3dSZEak6w8+4NUslYRaDNt6Zko/aoYnxHdTdaKQcSBTebmLov1V4IdDwqGA8sPkb6xatcJqzLseXB6v0OkuopmELkvUY5WH8tUYO3caGBto3cqeelnqPRgJHFYImYukFu0BMs/AFMeJ6j0Mtv4Hi7vLpknTlc54dYCxdQnK92Vdys6zRcqYXMuYHa5LxlNb5kIvbPr5/T8kl/9xkQGOzfUnttMA1uMiPDVeOnbpBrx4GlNU3WkeW7Up1ZeAXzTnvoTOrwsXVCrnp+kT8fqpvNAV0GBFo8urFcuBsxMnTndWQFqMt1jka4hudMUdD6qWgTGEWvl3izNlA/DO+PoVW5Ya/ljvoOOGy2ykC0nPEMdyPWrxHQhvAn0DPf/8UnM/n6N0ATYFGsW4T9fe0h/7qvTJ9Qg8I99uMdY2g2BBhlBo5YY8sHgFAiak0nXuFeI1mko6ZfEtGhTHP1uPzspWjrXMjlAqkEW9xoS0XOWEpX8QSjVqpv60xoUFmcIWadaxFO6UAanzdlYuM9cn0J9GZYL5a4J7trzeNteOXf40nbMDpgwLKp68ZYB/3r+0V9lMN+blUe794UCB3ps0HLwsHXPXuFi90yJqHAq80xpU3QwXcWb7mWNYXyreaKdhPK3MJFMfdOixqJ4p+oN3Fv0G0IsLs1YiaRTEfrCTVo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(376002)(39860400002)(346002)(396003)(451199024)(186009)(1800799009)(122000001)(85182001)(36756003)(38070700005)(38100700002)(86362001)(6506007)(478600001)(2906002)(66946007)(5660300002)(64756008)(54906003)(66476007)(66446008)(76116006)(8676002)(4326008)(66556008)(6486002)(6512007)(83380400001)(71200400001)(41300700001)(7416002)(110136005)(316002)(8936002)(26005)(2616005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TDN5T0prOW52MkdxcktUTXM0cXdnWHBYZ2l6T3BnNEpFTmNqRGpMTVVqdFNV?=
 =?utf-8?B?Zi80YnJ1c2Z5WHFqOGNoWUxZSzVrRk95dmltVmF6VVFRMW8rZTU0Uy9iSHdi?=
 =?utf-8?B?WENuZkVsbnFYaENBNjNwTndFU2I1TzM5OGNlaFNXdy9DT1dGcXVpRXFVQk5N?=
 =?utf-8?B?ZWdXNCs2WmczeUdOazFqNW5sdWM3Mm1QTkxMVExGc1lnNGxnMUd5TC82d2R2?=
 =?utf-8?B?VmV5TUlrMkw1Y2Y0RXQ1V0tFMTZpWTRwNnlYTy9VbTBPNzF4MDMzSEVWVnZz?=
 =?utf-8?B?NjBmSktwNzljVjVMajBuRjJUVEtUSEZOOXRLT2Q0QnV0c3JhUFdkUmM2d2pP?=
 =?utf-8?B?Vi8wbFMyZnNZOWNoWGNLNTVKMG1hS1ZBdGpzR3lySjVoMkhlMzNSK0NsV0hD?=
 =?utf-8?B?K254RWpuNW9QRGsyMkRiVjFxdHNseWRhUFdtb3pndlV6ckw0SUVzSGtKaUJH?=
 =?utf-8?B?NXBkMWJqRENVcUlGS0t5bDc4WWtvTTNwM0Fxcm9RL1ZJRHozbDJqZmpVK3dz?=
 =?utf-8?B?SlJ5WWdYTmRQc0NMVmlneTNmRTZwbmt3T3FnUUREblBHSDNyYnlRN0tNT3gx?=
 =?utf-8?B?Y0twT3ZaQkMzQ0hZUUFGM1JQYUhnbWJCSCt4Sko1UHlvc0xqTnB3K2poajQx?=
 =?utf-8?B?eUJKVE1nZlJwMlY5MUljODN2M0ZPSlZjelQxWmMzTldzTCtjamJmQ25oZ1RE?=
 =?utf-8?B?QklzY1orZU5Sa0xEVVl4YjkvVzczclRKYVprenhYa1pwQnVwLzlHT3dzUzdY?=
 =?utf-8?B?UHZ6b2FOeGc4SFI4NUkvY0ZMSE5PellVbWNncmtUdktNMEk3QmdsWGRXWk9a?=
 =?utf-8?B?QXo2U0F4TEt2Wm9iTXhBbG9rdUxhQ3RIK1VheEd0WkZhN29tQWlPb0lQYjBp?=
 =?utf-8?B?MHl5RkYyVVRTSjZUaTNXZXdZUmpFRWR1THp5aWd6a1pGQ0RIUzhhdFh5KzJa?=
 =?utf-8?B?a29rTmFUOGRKQVQzOGduMFVPTU5Gdm94bEhSQTdzdUlSQnF3YnFWQUdxSnZ1?=
 =?utf-8?B?ZDFkK3A5UTdLZXNlZFQrNDAvOUc0UVoyV3p1cHRQVCtuMVk3TGpMQWNRUW1j?=
 =?utf-8?B?Tnd6TkJxZHh4MDdLZFZFdDJMcXVxNFArSVhaTi9CbGRrRVloS25CSVc3Mzdv?=
 =?utf-8?B?QzJJSXoxb01TbUIwRjUvbEZnSTljV2tKU0FnWUNSdXYyOUw3cytiZXB5eUVU?=
 =?utf-8?B?L1Y0MmJZRm9UQnBHSFdTR3kxWStCdnZBRDYvd2xKRzFSbUNwU0dUSitJMk1z?=
 =?utf-8?B?cTV0a3VGTUg5Wnc2SVRJVGJhZHpuZ3dwOFBpVm9nK2ZEVy8zZFc2cXhVMno3?=
 =?utf-8?B?eFZZOTVaQXRrbnNGTm1ncGpBZy9DdS9BT2hkUDVYMTdVbEVXckdUejczQ2Rr?=
 =?utf-8?B?dlUwMGZ2WmVSSmpWL1lnWnVMc0R3YVcwQjFTODJGdVVwWGJpZmFYcWFpdFJu?=
 =?utf-8?B?VkJnWk43TTdrUENxMnovWnZSZnVxM3UrdXZLZ09yblBtNTdYaG5ORjVTQkZC?=
 =?utf-8?B?WFB3MzA4Y1NrbStRVi9pQ3lmZXNOY1NFYUxVRGg0UG9xaUlLVHhsTUtuMVhS?=
 =?utf-8?B?bVcwQnBGeTFQSkp3Yk1hd2l0MnE2bSs0eDVCR1FwVUdWa0RqeWd5d1d0STRj?=
 =?utf-8?B?TVJmVEw0bnFjTllaUFJ2dFpYbEl1S1JXVkd5WEl6c3ozL0FoT1kvR01TVnhC?=
 =?utf-8?B?ODluSm5JK3F1c0N6OXd2dVp4S0ZOY2cyMXR2NDVvQkVMZzR6Tm43Wk54bHZ1?=
 =?utf-8?B?OVIrZ0haQitzdVVtNzNEN1dJY3UvQjF5MFZJVjdpSFo1ZkEwT0JObVpZdTBO?=
 =?utf-8?B?cE9INGl6K2YvNHRmQndEQ0tPOXBKL1owZ09sbERrcFpORzBUWTh1ZHliQnBC?=
 =?utf-8?B?S0FSbk5uSXlZZ0RuRkIySGpUZ3VpK2M0eGJJUllMOGhHYkJVWU45V2V3M2pw?=
 =?utf-8?B?NlRRei9NOHdYUjZwUDlnRHFqbVl6QUE3YXE4dTN4OG9ib1NmRG9RVTh4RGRX?=
 =?utf-8?B?dk9MQXRrMlFzYVlLVWpHMWE2aW9GZTd5ZXlGVlRlWndQTjZZRXBCTysrWERF?=
 =?utf-8?B?ZHdoNnViUHV2ZXlSWWptS1lLcTc4NFJqUTl1YWRzL2ltbzYyVkV6VjBzUHJj?=
 =?utf-8?Q?pdL75TCDmjKqc7hfCPW5R/G9v?=
Content-ID: <F1B2E9DA8424D942867CE17A8258B4EC@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c70ce12-d7ee-413e-36dc-08dbb82471c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2023 08:51:27.0211 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sDO8Q0mJWh71kHbUT41uB8Bq5vr6D+mWk/pf5XFFoggOU67awudHWluV8uKKw99sMXdmPXHPShuhFUj+5xQW4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7793
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_004_1017050413.1623172457"
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "wenst@chromium.org" <wenst@chromium.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_004_1017050413.1623172457
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpLCYjMzI7SHNpYW8tY2hpZW46DQoNCk9uJiMzMjtNb24sJiMzMjsyMDIzLTA5LTE4
JiMzMjthdCYjMzI7MTY6NDEmIzMyOyswODAwLCYjMzI7SHNpYW8mIzMyO0NoaWVuJiMzMjtTdW5n
JiMzMjt3cm90ZToNCiZndDsmIzMyO0FkZCYjMzI7YSYjMzI7bmV3JiMzMjtBUEkmIzMyO3RvJiMz
MjtqdW1wJiMzMjt0byYjMzI7dGhlJiMzMjtoZWFkJiMzMjtvZiYjMzI7Y21kcSYjMzI7cGFja2V0
JiMzMjtieQ0KJmd0OyYjMzI7YXBwZW5kaW5nJiMzMjthJiMzMjtqdW1wJiMzMjtjb21tYW5kJiMz
MjthdCYjMzI7dGhlJiMzMjtlbmQmIzMyO29mJiMzMjtpdC4NCiZndDsmIzMyOw0KJmd0OyYjMzI7
U2lnbmVkLW9mZi1ieTomIzMyO0hzaWFvJiMzMjtDaGllbiYjMzI7U3VuZyYjMzI7Jmx0O3NoYXdu
LnN1bmdAbWVkaWF0ZWsuY29tJmd0Ow0KJmd0OyYjMzI7LS0tDQomZ3Q7JiMzMjsmIzMyO2RyaXZl
cnMvc29jL21lZGlhdGVrL210ay1jbWRxLWhlbHBlci5jJiMzMjt8JiMzMjsxNiYjMzI7KysrKysr
KysrKysrKysrKw0KJmd0OyYjMzI7JiMzMjtpbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGst
Y21kcS5oJiMzMjsmIzMyO3wmIzMyOyYjMzI7MiYjMzI7KysNCiZndDsmIzMyOyYjMzI7MiYjMzI7
ZmlsZXMmIzMyO2NoYW5nZWQsJiMzMjsxOCYjMzI7aW5zZXJ0aW9ucygrKQ0KJmd0OyYjMzI7DQom
Z3Q7JiMzMjtkaWZmJiMzMjstLWdpdCYjMzI7YS9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstY21k
cS1oZWxwZXIuYw0KJmd0OyYjMzI7Yi9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstY21kcS1oZWxw
ZXIuYw0KJmd0OyYjMzI7aW5kZXgmIzMyO2IwY2QwNzFjNDcxOS4uZTAyOWNlMjMxZGYxJiMzMjsx
MDA2NDQNCiZndDsmIzMyOy0tLSYjMzI7YS9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstY21kcS1o
ZWxwZXIuYw0KJmd0OyYjMzI7KysrJiMzMjtiL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1jbWRx
LWhlbHBlci5jDQomZ3Q7JiMzMjtAQCYjMzI7LTQ0MSw0JiMzMjsrNDQxLDIwJiMzMjtAQCYjMzI7
aW50JiMzMjtjbWRxX3BrdF9mbHVzaF9hc3luYyhzdHJ1Y3QmIzMyO2NtZHFfcGt0JiMzMjsqcGt0
KQ0KJmd0OyYjMzI7JiMzMjt9DQomZ3Q7JiMzMjsmIzMyO0VYUE9SVF9TWU1CT0woY21kcV9wa3Rf
Zmx1c2hfYXN5bmMpOw0KJmd0OyYjMzI7JiMzMjsNCiZndDsmIzMyOytpbnQmIzMyO2NtZHFfcGt0
X2p1bXBfYWJzb2x1dGUoc3RydWN0JiMzMjtjbWRxX3BrdCYjMzI7KnBrdCkNCg0KQ01EUSYjMzI7
cHJvdmlkZSYjMzI7YWJpbGl0eSYjMzI7dG8mIzMyO2p1bXAmIzMyO3RvJiMzMjthbnkmIzMyO3Bo
eXNpY2FsJiMzMjthZGRyZXNzLCYjMzI7YnV0JiMzMjt0aGlzDQppbnRlcmZhY2UmIzMyO2xpbWl0
JiMzMjt0aGUmIzMyO2p1bXAmIzMyO3RvJiMzMjtoZWFkJiMzMjtvZiYjMzI7cGFja2V0LiYjMzI7
U28mIzMyO0kmIzMyO3dvdWxkJiMzMjtsaWtlJiMzMjt0aGUNCmludGVyZmFjZSYjMzI7dG8mIzMy
O2JlDQoNCmludCYjMzI7Y21kcV9wa3RfanVtcF9hYnNvbHV0ZShzdHJ1Y3QmIzMyO2NtZHFfcGt0
JiMzMjsqcGt0LCYjMzI7ZG1hX2FkZHJfdCYjMzI7cGEpOw0KDQpGb3ImIzMyO2NsaWVudCYjMzI7
ZHJpdmVyLCYjMzI7aXQmIzMyO2NvdWxkJiMzMjtqdW1wJiMzMjt0byYjMzI7YW55d2hlcmUmIzMy
O2l0JiMzMjt3YW50Lg0KDQpSZWdhcmRzLA0KQ0sNCg0KDQomZ3Q7JiMzMjsrew0KJmd0OyYjMzI7
K3N0cnVjdCYjMzI7Y21kcV9pbnN0cnVjdGlvbiYjMzI7aW5zdCYjMzI7PSYjMzI7eyYjMzI7MCYj
MzI7fTsNCiZndDsmIzMyOyt1OCYjMzI7c2hpZnRfcGE7DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsr
c2hpZnRfcGEmIzMyOz0mIzMyO2NtZHFfZ2V0X3NoaWZ0X3BhKCgoc3RydWN0JiMzMjtjbWRxX2Ns
aWVudCYjMzI7Kilwa3QtJmd0O2NsKS0NCiZndDsmIzMyOyZndDtjaGFuKTsNCiZndDsmIzMyOysN
CiZndDsmIzMyOysvKiYjMzI7anVtcCYjMzI7dG8mIzMyO2hlYWQmIzMyO29mJiMzMjt0aGUmIzMy
O3BhY2tldCYjMzI7Ki8NCiZndDsmIzMyOytpbnN0Lm9wJiMzMjs9JiMzMjtDTURRX0NPREVfSlVN
UDsNCiZndDsmIzMyOytpbnN0Lm9mZnNldCYjMzI7PSYjMzI7Q01EUV9KVU1QX1JFTEFUSVZFOw0K
Jmd0OyYjMzI7K2luc3QudmFsdWUmIzMyOz0mIzMyO3BrdC0mZ3Q7cGFfYmFzZSYjMzI7Jmd0OyZn
dDsmIzMyO3NoaWZ0X3BhOw0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7K3JldHVybiYjMzI7Y21kcV9w
a3RfYXBwZW5kX2NvbW1hbmQocGt0LCYjMzI7aW5zdCk7DQomZ3Q7JiMzMjsrfQ0KJmd0OyYjMzI7
K0VYUE9SVF9TWU1CT0woY21kcV9wa3RfanVtcF9hYnNvbHV0ZSk7DQomZ3Q7JiMzMjsrDQomZ3Q7
JiMzMjsmIzMyO01PRFVMRV9MSUNFTlNFKCZxdW90O0dQTCYjMzI7djImcXVvdDspOw0KJmd0OyYj
MzI7ZGlmZiYjMzI7LS1naXQmIzMyO2EvaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRrLWNt
ZHEuaA0KJmd0OyYjMzI7Yi9pbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstY21kcS5oDQom
Z3Q7JiMzMjtpbmRleCYjMzI7YTI1M2MwMDFjODYxLi4xMDY5ODhjYzVmMDEmIzMyOzEwMDY0NA0K
Jmd0OyYjMzI7LS0tJiMzMjthL2luY2x1ZGUvbGludXgvc29jL21lZGlhdGVrL210ay1jbWRxLmgN
CiZndDsmIzMyOysrKyYjMzI7Yi9pbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstY21kcS5o
DQomZ3Q7JiMzMjtAQCYjMzI7LTI3Niw2JiMzMjsrMjc2LDgmIzMyO0BAJiMzMjtpbnQmIzMyO2Nt
ZHFfcGt0X2p1bXAoc3RydWN0JiMzMjtjbWRxX3BrdCYjMzI7KnBrdCwNCiZndDsmIzMyO2RtYV9h
ZGRyX3QmIzMyO2FkZHIpOw0KJmd0OyYjMzI7JiMzMjsmIzMyOyovDQomZ3Q7JiMzMjsmIzMyO2lu
dCYjMzI7Y21kcV9wa3RfZmluYWxpemUoc3RydWN0JiMzMjtjbWRxX3BrdCYjMzI7KnBrdCk7DQom
Z3Q7JiMzMjsmIzMyOw0KJmd0OyYjMzI7K2ludCYjMzI7Y21kcV9wa3RfanVtcF9hYnNvbHV0ZShz
dHJ1Y3QmIzMyO2NtZHFfcGt0JiMzMjsqcGt0KTsNCiZndDsmIzMyOysNCiZndDsmIzMyOyYjMzI7
LyoqDQomZ3Q7JiMzMjsmIzMyOyYjMzI7KiYjMzI7Y21kcV9wa3RfZmx1c2hfYXN5bmMoKSYjMzI7
LSYjMzI7dHJpZ2dlciYjMzI7Q01EUSYjMzI7dG8mIzMyO2FzeW5jaHJvbm91c2x5JiMzMjtleGVj
dXRlDQomZ3Q7JiMzMjt0aGUmIzMyO0NNRFENCiZndDsmIzMyOyYjMzI7JiMzMjsqJiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyO3BhY2tldCYjMzI7YW5kJiMzMjtjYWxsJiMzMjtiYWNrJiMzMjthdCYjMzI7dGhlJiMz
MjtlbmQmIzMyO29mJiMzMjtkb25lDQomZ3Q7JiMzMjtwYWNrZXQNCg0KPC9wcmU+PCEtLXR5cGU6
dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0
eSBOb3RpY2UgKioqKioqKioqKioqKioqKioqKioNClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQg
aW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkg
YmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpl
eGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5k
ZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4g
QW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5p
bmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRz
KSBieSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBt
YXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9m
IHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUt
bWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5
IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiAN
CnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVt
LCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkg
b3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_004_1017050413.1623172457
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEhzaWFvLWNoaWVuOg0KDQpPbiBNb24sIDIwMjMtMDktMTggYXQgMTY6NDEgKzA4MDAsIEhz
aWFvIENoaWVuIFN1bmcgd3JvdGU6DQo+IEFkZCBhIG5ldyBBUEkgdG8ganVtcCB0byB0aGUgaGVh
ZCBvZiBjbWRxIHBhY2tldCBieQ0KPiBhcHBlbmRpbmcgYSBqdW1wIGNvbW1hbmQgYXQgdGhlIGVu
ZCBvZiBpdC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEhzaWFvIENoaWVuIFN1bmcgPHNoYXduLnN1
bmdAbWVkaWF0ZWsuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvc29jL21lZGlhdGVrL210ay1jbWRx
LWhlbHBlci5jIHwgMTYgKysrKysrKysrKysrKysrKw0KPiAgaW5jbHVkZS9saW51eC9zb2MvbWVk
aWF0ZWsvbXRrLWNtZHEuaCAgfCAgMiArKw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRp
b25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLWNtZHEt
aGVscGVyLmMNCj4gYi9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstY21kcS1oZWxwZXIuYw0KPiBp
bmRleCBiMGNkMDcxYzQ3MTkuLmUwMjljZTIzMWRmMSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9z
b2MvbWVkaWF0ZWsvbXRrLWNtZHEtaGVscGVyLmMNCj4gKysrIGIvZHJpdmVycy9zb2MvbWVkaWF0
ZWsvbXRrLWNtZHEtaGVscGVyLmMNCj4gQEAgLTQ0MSw0ICs0NDEsMjAgQEAgaW50IGNtZHFfcGt0
X2ZsdXNoX2FzeW5jKHN0cnVjdCBjbWRxX3BrdCAqcGt0KQ0KPiAgfQ0KPiAgRVhQT1JUX1NZTUJP
TChjbWRxX3BrdF9mbHVzaF9hc3luYyk7DQo+ICANCj4gK2ludCBjbWRxX3BrdF9qdW1wX2Fic29s
dXRlKHN0cnVjdCBjbWRxX3BrdCAqcGt0KQ0KDQpDTURRIHByb3ZpZGUgYWJpbGl0eSB0byBqdW1w
IHRvIGFueSBwaHlzaWNhbCBhZGRyZXNzLCBidXQgdGhpcw0KaW50ZXJmYWNlIGxpbWl0IHRoZSBq
dW1wIHRvIGhlYWQgb2YgcGFja2V0LiBTbyBJIHdvdWxkIGxpa2UgdGhlDQppbnRlcmZhY2UgdG8g
YmUNCg0KaW50IGNtZHFfcGt0X2p1bXBfYWJzb2x1dGUoc3RydWN0IGNtZHFfcGt0ICpwa3QsIGRt
YV9hZGRyX3QgcGEpOw0KDQpGb3IgY2xpZW50IGRyaXZlciwgaXQgY291bGQganVtcCB0byBhbnl3
aGVyZSBpdCB3YW50Lg0KDQpSZWdhcmRzLA0KQ0sNCg0KDQo+ICt7DQo+ICsJc3RydWN0IGNtZHFf
aW5zdHJ1Y3Rpb24gaW5zdCA9IHsgMCB9Ow0KPiArCXU4IHNoaWZ0X3BhOw0KPiArDQo+ICsJc2hp
ZnRfcGEgPSBjbWRxX2dldF9zaGlmdF9wYSgoKHN0cnVjdCBjbWRxX2NsaWVudCAqKXBrdC0+Y2wp
LQ0KPiA+Y2hhbik7DQo+ICsNCj4gKwkvKiBqdW1wIHRvIGhlYWQgb2YgdGhlIHBhY2tldCAqLw0K
PiArCWluc3Qub3AgPSBDTURRX0NPREVfSlVNUDsNCj4gKwlpbnN0Lm9mZnNldCA9IENNRFFfSlVN
UF9SRUxBVElWRTsNCj4gKwlpbnN0LnZhbHVlID0gcGt0LT5wYV9iYXNlID4+IHNoaWZ0X3BhOw0K
PiArDQo+ICsJcmV0dXJuIGNtZHFfcGt0X2FwcGVuZF9jb21tYW5kKHBrdCwgaW5zdCk7DQo+ICt9
DQo+ICtFWFBPUlRfU1lNQk9MKGNtZHFfcGt0X2p1bXBfYWJzb2x1dGUpOw0KPiArDQo+ICBNT0RV
TEVfTElDRU5TRSgiR1BMIHYyIik7DQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3NvYy9t
ZWRpYXRlay9tdGstY21kcS5oDQo+IGIvaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRrLWNt
ZHEuaA0KPiBpbmRleCBhMjUzYzAwMWM4NjEuLjEwNjk4OGNjNWYwMSAxMDA2NDQNCj4gLS0tIGEv
aW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRrLWNtZHEuaA0KPiArKysgYi9pbmNsdWRlL2xp
bnV4L3NvYy9tZWRpYXRlay9tdGstY21kcS5oDQo+IEBAIC0yNzYsNiArMjc2LDggQEAgaW50IGNt
ZHFfcGt0X2p1bXAoc3RydWN0IGNtZHFfcGt0ICpwa3QsDQo+IGRtYV9hZGRyX3QgYWRkcik7DQo+
ICAgKi8NCj4gIGludCBjbWRxX3BrdF9maW5hbGl6ZShzdHJ1Y3QgY21kcV9wa3QgKnBrdCk7DQo+
ICANCj4gK2ludCBjbWRxX3BrdF9qdW1wX2Fic29sdXRlKHN0cnVjdCBjbWRxX3BrdCAqcGt0KTsN
Cj4gKw0KPiAgLyoqDQo+ICAgKiBjbWRxX3BrdF9mbHVzaF9hc3luYygpIC0gdHJpZ2dlciBDTURR
IHRvIGFzeW5jaHJvbm91c2x5IGV4ZWN1dGUNCj4gdGhlIENNRFENCj4gICAqICAgICAgICAgICAg
ICAgICAgICAgICAgICBwYWNrZXQgYW5kIGNhbGwgYmFjayBhdCB0aGUgZW5kIG9mIGRvbmUNCj4g
cGFja2V0DQo=

--__=_Part_Boundary_004_1017050413.1623172457--

