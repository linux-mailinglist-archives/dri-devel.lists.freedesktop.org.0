Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CF5505ED5
	for <lists+dri-devel@lfdr.de>; Mon, 18 Apr 2022 22:09:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D6E710E1B0;
	Mon, 18 Apr 2022 20:09:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2086.outbound.protection.outlook.com [40.107.223.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 625E110E1B0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Apr 2022 20:09:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bly08NV2nrYaPObi1TgbFi1KYUekdlcZTgbOo/kN/KxpwnZUJZmnD8EGuw2+I7cG4pmQCNNz8zrXcqO8OkjWOhZ1vSWWy5SSAOUg+xjboGIsYamA7O0Nluwok8qdnniQQaNDueXKXxptYQJRhJgTHbElIU/aSI6ttgj/atQ34w/8n02JdUF0D+Go68VCietO7K48rco0xQdw8mOgrEqzKCMsBKUroHMyMamuGn/Jp49i41Hjap0TzqGNr6aNbqpVCRRDBuiGL4JRgMb3uMCmipvLBreKNfQ0biF2j6RIpgnkC3NbIDtYWB7UGqkxaNYq10ZDxXABMwANkp6zi1nFkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tqYoDfvHZ6rlMA0F3K/HvPEbVM0HzeAQSBPYI/Qj0Ok=;
 b=mzYCFz1LTwBrlrQFZuB/ubF3BDCeEVkmKBfdb3X8W/QdXfCX9VYaYeZBEbWvhWpoI6y7m11ThxwmVh8M7oolzIqaQQe1n+JHqwKXG5x1R/tmHRRXxg9qKC1bGaXvrria4j2zWvyIKBp3K+AVBru3IOHE6Xb5Mmw/UXIwSWe/6MuFVuDi0cVl8511iwIuZscyAFuOQqjD0+rlwdgfPWRKmlhG5665TQMjSXiPkQbYWhMTTHSwFcR2lLMMkwnEo/jSorCiMtJyU0YM+2JYObIWPMBCZsngGEiMYEfm0efg8deLIm17QiIm8uHYQjouMQwFPZ/Gx8/fd1V68/ccKrQ4EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tqYoDfvHZ6rlMA0F3K/HvPEbVM0HzeAQSBPYI/Qj0Ok=;
 b=WbrxmAaOChL3a8nNJaKqFmdY7nozua8OBiCze+RKUQvzLb7gCqQOM0nJy3XpmsUBliHhZowsO3lHToCac1wIO+n6S9tN/juv8bmULwVfApaQvwkL5cz8Av04Bz9dzFF76u0AhI5vnnMxFZuOwy5m6RPmaJrKfERzcXlXToWjkmc=
Received: from BN8PR05MB6611.namprd05.prod.outlook.com (2603:10b6:408:57::15)
 by BYAPR05MB5541.namprd05.prod.outlook.com (2603:10b6:a03:1b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.12; Mon, 18 Apr
 2022 20:09:26 +0000
Received: from BN8PR05MB6611.namprd05.prod.outlook.com
 ([fe80::2cee:3759:958:cf21]) by BN8PR05MB6611.namprd05.prod.outlook.com
 ([fe80::2cee:3759:958:cf21%7]) with mapi id 15.20.5186.012; Mon, 18 Apr 2022
 20:09:26 +0000
From: Zack Rusin <zackr@vmware.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Subject: Re: [PATCH v2 0/5] drm/ttm: Introduce TTM res manager debugfs helpers
Thread-Topic: [PATCH v2 0/5] drm/ttm: Introduce TTM res manager debugfs helpers
Thread-Index: AQHYTh5fRNMgzUptx0yWTQ2snBZ/aqzr/4AAgAokqYA=
Date: Mon, 18 Apr 2022 20:09:26 +0000
Message-ID: <7a371fee4378221e0a68bfcf928b0c0ffc3cded0.camel@vmware.com>
References: <20220412033526.369115-1-zack@kde.org>
 <ce6b5402-c7ac-b382-f7bf-1581afa59322@amd.com>
In-Reply-To: <ce6b5402-c7ac-b382-f7bf-1581afa59322@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4-1ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 88c85da9-06aa-4737-085e-08da21775687
x-ms-traffictypediagnostic: BYAPR05MB5541:EE_
x-ms-exchange-atpmessageproperties: SA|SL
x-microsoft-antispam-prvs: <BYAPR05MB55416F89B4AAAF6246F8709CCEF39@BYAPR05MB5541.namprd05.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: l2Ff+EoTVFDhW1whWdysNLebWKEbk2uD8Kjk85dIJDkSsgDuU0HPf5mGH9Fx5dexOTYlJkhUEJw2dD3/TpN2DKuVNX0RulTpZ9DY4AJ3Q8Nes0kBr0MFASwtxvwBTpRos5MYH1YSHcpaPnf5C2Xd/3OHD+zcZrA6dyNOdSPjrGXT2LyMfEz0Upm9XrBEik0Q92sY2vEGGHPTUqLoMnbrDQKzTHOssCw7VhIrajNfCq/hcyrWbubXhqAt5XrkEoRsgOoYdUreG6RbR2Jr2lHriYrFuEQKoRhVb0SKuxMt6Z5iWX5pKhpbW6yZ0FVtc5K/iFf95EG6RVwxO8KYhVPppN9irjSwafIA9AL3Jj77JFhurTYLb9xyU+dOT5PBr7Sh3PmNL7M3vj6hU2MGZhnigwWu0zFClAae6sZpU1hNiYwTkq2owAdobo7iD+neML0k7WdKZIDlDC+XMP7jCcDK1uxmCutWjKY0aSBmsdevFVuHcyWbCeTAc4Y0pduqm9s6KyF5klr2cAojSIQYr0aS2+WDX+pkf61qTAzvGyd1aSSrORHZHwj6k8L7bkDEweGT3k1Sv9456w1N5kvBUdBIMydMdZ+2pX1cK2VzmFTCl9MF8MUSSt8Ot62G/QoyiWQJgrqGhVNO8MlUs0MO0XrbA2j9L1Yc/LWZnoDgfZFH6yQDlhf4C3FCztrbcl9fMPYMwbHB1jbdpfVn2vraaxJsEA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR05MB6611.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2616005)(6486002)(186003)(54906003)(26005)(86362001)(4744005)(64756008)(76116006)(8676002)(4326008)(8936002)(66556008)(66446008)(66946007)(5660300002)(91956017)(36756003)(66476007)(6512007)(71200400001)(110136005)(508600001)(316002)(2906002)(6506007)(38100700002)(122000001)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dkpkQlBtdE5NTmQ3eXpLb3NhN2QyRSthUDE3Vjg1OHY1eHRmYnRWU3BIamxF?=
 =?utf-8?B?LzdyVDNUcFV4azNqd2NSYzR5ODNqT0owU1kxV1g2aXNlSzNCNDZBckVZUTlz?=
 =?utf-8?B?N0w2ay9xeUZGNmpMNU1RUzFSNUtNdWVrSWlydHE5VCtTd2srS21LYzNkWHd1?=
 =?utf-8?B?aElyY0dObXFJMk9wMnpWWVAxUEJQb0hFK1lYT0ZDMlFTOGtEK3ZjaHBYMGZ5?=
 =?utf-8?B?b0NLSVJWVWRlTExqRXNwdFV1dW5WVzA0YUs2aDE4SUJHaGp2ZFFoVlVMRDFV?=
 =?utf-8?B?Tk9zQU9CVkdESHJnUTl5QlVtZDJzWmwyZ1Z0OUtqQkg4eS9WNFp4QmRUQTFF?=
 =?utf-8?B?N3JqK2o1UnV1TnFiNzRCZHJVMW1IQTQ2QVA0Ky9nTUd2QThJVGZXV05HbXhI?=
 =?utf-8?B?ZnJIb3ZLazF6aVRramNJQlVyY21sZTBGck9LMHFTeDhsanJnOW92bnNDZG8z?=
 =?utf-8?B?V2xpUEw1blg0OW4xekFXMjZCWDBKMEQ4eDJ6bytqNEJMQjdwK1B4MG8vcm5Z?=
 =?utf-8?B?ZTdBclZSNHIyY285TnZnNHNIbitxWWtSbENMUEg2bElkRDh4UkltRXF6MXVE?=
 =?utf-8?B?QUFnd1FOb2hwR3Z2RDNBQ1FFK2NiNFdXb0w0U0o3NXNUUXdOR2l1bDBUSmtK?=
 =?utf-8?B?QUkzOFdIT0cxZXprSmtUUkhTZ0NwaHYyS1E4alY5ZEVFOEwxN0FMZ3dsSDdC?=
 =?utf-8?B?NHBQM3hOekFrbHZIWG03ODJiNi90SnR5UkJ0aVV0SzlkL3ArUmk4R3hKalor?=
 =?utf-8?B?aTJqd0VUVHQ0U0xTUlFxaFI5SmJXN0hCdlFWWlFvRTB5MUVWL2MyRFIwbXFG?=
 =?utf-8?B?UVIwTXBtUUFNUmJKQUVvNTV5eUdQN0lqU1FsVUhJYjV0d3NqR09JNmU4emRp?=
 =?utf-8?B?ZmdrYXZjOGloazlUVmJZNnBVYm9FeFhrWlZGSGdveFJrb3hOM0F1dHcxckdi?=
 =?utf-8?B?amFoblBuaGdpRXdrVDJqMk4wLzVwYVhYdkVkdTBhK3FUQUF2WFN2OEdULzFW?=
 =?utf-8?B?WFVQbnVOa2RlL3pQYndiZ3orRGhNcXJzY1pOQkIrOFRta1JxaGtxQ1dUSGtD?=
 =?utf-8?B?cERjQ3h3QXY0cXF2Yk9ER1ZIYVJNQ1NwRGo0UDA1WldLS2ZVL1hwU2NNcnBR?=
 =?utf-8?B?NzdRbGhuWGdBcmJIeUhLU0FUNGdnUERBTU9hbDBnUWRac2haay9Md1hSdzJ1?=
 =?utf-8?B?blB1cHlseFMrektacU12cHpQOGtveWE1L2NXS0I0S1c5Qk1FQmZvMFhLZjRG?=
 =?utf-8?B?a0lhVVpGaU5RekNlNTcxdDJVZVh2SWFqbWd1MkxDUnltcXZQNjcrUVRRREFk?=
 =?utf-8?B?TkQ3U2M2UWROWjB6b3U0Y1VMT1VoNjdOV211VVMzdWtqdTNySVRIOVdYc3RU?=
 =?utf-8?B?by9EVnBEOTgzaU5mK1dWNkh2M0xYbjdBNUJTaHBlNTI2TEk4RWl0WTcyOGZu?=
 =?utf-8?B?VWp4TmtRSWdpcWtSZ2JYWStKclFkRXB5K2laTUtaWUZNZVJ1aWlmZnNVV1Ro?=
 =?utf-8?B?dHErUzh0WWNaWkNSTWVZUTNUNmFtZ0xENGREdU9DdlBNbXgrejEvOWJYWWp0?=
 =?utf-8?B?TENrV0FwK0MzOE9zN1JvV3JnaGJKUUd4MjdsT1RtamVETnVkOFFJbXl1SGJO?=
 =?utf-8?B?RFVjZVFhZ2d2Zi9FQUNLUTlxOXY3bDVZWjRqT1hKM1ZBaGNvaXJBcnRRVHJv?=
 =?utf-8?B?Vkk0L1BNQytrTURGRExrYThWa2tXOTJZYXZuZ3RxSTd4NWRtTmNmVUg1bzVn?=
 =?utf-8?B?SVZBbktSMUVPcUVCQ245Rys1OURvYTh6M3pjUWZHOWkxZ2pkWDM1Wm9CVVhw?=
 =?utf-8?B?MzhpcHJGQ1FYVTloeVVKUDh5YndWNUxBZHhjSmZGbWxoQWZSdWJmdDlXdTA1?=
 =?utf-8?B?bHlmckkwK3pBNW5HSlFIYUR0Q1dSbTN1U1pOT0syRmx0SlBsdjB5UG81YUNs?=
 =?utf-8?B?Yk5OTk9IaGEvZlR3TlNaZTZ5SXlmWG9od0ZyRWNGaGRpQ0lvb214MG51d3Vr?=
 =?utf-8?B?U0VGbU85TXBuYnNXYU1WUWt0Q05mUlVMRTFyZ3J0bEE3WkFiNW5ucDVXdkNt?=
 =?utf-8?B?TkUweEp4TFJBZWJTSGNZOWJ2NEdKMGhqdS9yMzFJSWdSZUthWTRGV3J1MEdJ?=
 =?utf-8?B?WFdMdklLRGlWMXpMMitFY2dTU0pRNjVzZlZCQ0dCOERaZGVCaWJZSUtlU0hU?=
 =?utf-8?B?bW9sK0FxNGsvczlOT3RTUWp4L1hNT2RxUFFZQnlIY2RIV0ZGT1dRU2hsL2pu?=
 =?utf-8?B?V09uTHByVUZpUHpMY2NIUGVoNlBWd3d6VWZmRGpCQlh2bkc2YTdIM3JWTDY1?=
 =?utf-8?B?bUxGTFFzRGV6Sy85eGpoZkdOWldZc0MzRTg1cy8zU05jMHZCSEMwdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1FD545876CF8094A8567DE83708BA13A@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR05MB6611.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88c85da9-06aa-4737-085e-08da21775687
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2022 20:09:26.2705 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 76wcTe+hICJoPkT8J30BBaNSUgsZpP5VeNbFH0q1DcTxD1imRuYEk5Hb2ZM4UEW99Tfzpu/HB8/AdsdEMaLcyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR05MB5541
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
Cc: "airlied@linux.ie" <airlied@linux.ie>, Martin Krastev <krastevm@vmware.com>,
 "ray.huang@amd.com" <ray.huang@amd.com>,
 Maaz Mombasawala <mombasawalam@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIyLTA0LTEyIGF0IDExOjE1ICswMjAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3Rl
Og0KPiANCj4gSGkgWmFjaywNCj4gDQo+IFJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxj
aHJpc3RpYW4ua29lbmlnQGFtZC5jb20+IGZvciB0aGUNCj4gZW50aXJlDQo+IHNlcmllcy4NCj4g
DQo+IE9uZSBuaXQgcGljayBpcyB0aGF0IEkgd2FudCB0byBnZXQgcmlkIG9mIHVzaW5nIHR0bV9t
YW5hZ2VyX3R5cGUoKSBpbg0KPiBkcml2ZXJzIGFuZCB1c2UgcG9pbnRlcnMgdG8gdGhlIG1lbWJl
cnMgZGlyZWN0bHkuIEJ1dCB0aGF0J3MNCj4gc29tZXRoaW5nDQo+IGZvciBhIGxhdGVyIGNsZWFu
dXAgYW55d2F5Lg0KDQpUaGF0IHNvdW5kcyBnb29kIHRvIG1lLiBMZXQgbWUga25vdyBpZiB5b3Un
ZCBsaWtlIG1lIHRvIGhvbGQgb2ZmIG9uDQpwdXNoaW5nIHRoaXMgdW50aWwgdGhlIHR0bV9tYW5h
Z2VyX3R5cGUgY2hhbmdlcyBhcmUgcmVhZHksIG90aGVyd2lzZQ0KSSdsbCBwdXNoIGl0IHRvIGRy
bS1taXNjLW5leHQgdG9tb3Jyb3cuDQoNCnoNCg0K
