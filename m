Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3671B22919B
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jul 2020 09:05:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EBD588FF7;
	Wed, 22 Jul 2020 07:05:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2052.outbound.protection.outlook.com [40.107.236.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E80B788FF7
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 07:05:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S7PdZUH3XOlWv2ohiwU3zc8xFiAgBlVh927BDSVVEvWYsRh2EScC/1rl1RpWrpERG3PULDSructeAHcqv5TB/Ln4MqLSzXCCsal5PnRh8pH2d3fr3x+RiHrzniv/Tkicj/EazdJZomF6Jc/bgerDsMslqRicOjIDy1s8g/HVohOVF1URM/T7mqlQRpxOhfFloMUhMspK5B/+sQRZ/5FKN58+ZQ/xxZvkYElUbZ44OHN9M9WLFC7jOe6ndm2UlVIufIqomew2Bz635U6laSu44xNdxJTBHdV3p6Jtzhzpw6DOorbbZT9N7o6Rehe/R8Oq733G7xYfs+TgzRfcJ07G+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZaOlPIamvI0J96JX81jbcnAiGnxYB1qmp2H1MEZJdMs=;
 b=jbnoQKOvx+pZwMFqM9WhLVHccMpNBfaBtyvPhdLxTy3CBkKIBdwy9jYYMQcpjHDGov3ymit5h0R3D6lyGoWO5SO2WQ7WL8cm8N9iHP7qFKo77g6rY1Uziah0wVornc49lTFn/fDdGsc/4AAm7hi+urOQWGFMkZIJ03AU1F9/xMVY60WtNQk+XopguPhlPxYw6xRAwUkP32RDuNVWIbEVz5BOTW/GqyjlghIK/XRTwXFLtfKwjemUdf7PJqhu7EoLFMSB3g0/oHNGf39Od/3u0C8MHGG1XGHBJ973Nd0tydBjoAbWxi4jxAqCVqW/0JfwquEcvtKtcngLtiinLG6ejg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZaOlPIamvI0J96JX81jbcnAiGnxYB1qmp2H1MEZJdMs=;
 b=Ed1izm4ETcjAQONSRTGlrYv2h/H5K7dm0r1HcFqieQb55WvVZqkQswLlq0lsxff4IL96TCE2lKrbXEcxkwQ97WQqgoXKEDFKvecKnE/tg9GEpgERUv4zDLsN4w2Flxgi08z7Z5bMhYLKZmVO4ZDED1oa0l/o+G1GvBfaKz3qJ3I=
Received: from BL0PR12MB2433.namprd12.prod.outlook.com (2603:10b6:207:4a::25)
 by MN2PR12MB4176.namprd12.prod.outlook.com (2603:10b6:208:1d5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.23; Wed, 22 Jul
 2020 07:05:18 +0000
Received: from BL0PR12MB2433.namprd12.prod.outlook.com
 ([fe80::8106:ca24:2065:cf04]) by BL0PR12MB2433.namprd12.prod.outlook.com
 ([fe80::8106:ca24:2065:cf04%7]) with mapi id 15.20.3195.025; Wed, 22 Jul 2020
 07:05:18 +0000
From: "Chauhan, Madhav" <Madhav.Chauhan@amd.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 02/11] drm/ttm: cleanup io_mem interface with nouveau
Thread-Topic: [PATCH 02/11] drm/ttm: cleanup io_mem interface with nouveau
Thread-Index: AQHWXzEjU74jenn95kmHsyL+CBdliKkTHhDw
Date: Wed, 22 Jul 2020 07:05:17 +0000
Message-ID: <BL0PR12MB24339E86A7D0DC8BF2A2782B9C790@BL0PR12MB2433.namprd12.prod.outlook.com>
References: <20200721073245.2484-1-christian.koenig@amd.com>
 <20200721073245.2484-2-christian.koenig@amd.com>
In-Reply-To: <20200721073245.2484-2-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=true;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2020-07-22T07:05:14Z; 
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=Public_0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ActionId=f849eddf-0b14-4500-9f0c-0000123dfd62;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=1
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_enabled: true
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_setdate: 2020-07-22T07:05:09Z
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_method: Standard
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_name: Internal Use Only -
 Unrestricted
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_actionid: 3c70b2b6-b502-4405-886b-0000750d3674
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_contentbits: 0
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_enabled: true
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_setdate: 2020-07-22T07:05:15Z
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_method: Privileged
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_name: Public_0
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_actionid: 5e982a57-7c9b-4eae-bb66-0000d25a5ef4
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_contentbits: 0
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [171.61.68.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c1943d6a-bb0a-464c-3f55-08d82e0d974c
x-ms-traffictypediagnostic: MN2PR12MB4176:
x-microsoft-antispam-prvs: <MN2PR12MB41761C7AC8D75A3706E74CE39C790@MN2PR12MB4176.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2276;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MoimlUS8FhnuuQt/f5y52xavWOpp0RNPtcatN2mC8r41MPfAlpnyxE1ni/z3Ic4DeNKMyb6e5XSgObQVtvbcw/eVj6PCnpCm5PFgpKswZU8QfIYH6IDQ8EmwS4ew7xZNpTdJj/paTblLe+rElA+tgoFfy2anaUw7J41W4n5mgWwI4IzlKGLTU1ZKWTdIY+8F/vzVrZZVqt2sYeDxce0IREn1L2RC7CCqLaU4WLWjJN5uRBCrwgnMZ/zdvUWwZLTc5I7NLFGCqOUf6hZXZO+hAIdTzMlZvnRU2HvWGs2IN2Tbp3G0BbgX1iXX7BW5fp52xWVHaGSwppzUgtIxpQwayQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2433.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(39850400004)(376002)(136003)(366004)(396003)(5660300002)(76116006)(66946007)(64756008)(66446008)(66556008)(66476007)(110136005)(52536014)(478600001)(2906002)(83380400001)(33656002)(26005)(54906003)(8676002)(55016002)(8936002)(6506007)(316002)(53546011)(86362001)(9686003)(7696005)(71200400001)(186003)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: DGwYDtMHkBgpxIv6fF5+E+7mb5H2RopXw6qWkYzJvTS98zZ7EZTyI+e1k/VkoNdH9qQ/mzkVx/hksD/+dn1N/ArBC04yHLd1q1ecSyU2DdR0SBIkni4Yu69PFbr6TN9XBMUrFZOdVmGCtTeQZ4cyYwbaGsstP7MipIhWBFCnpoxtliyZzN9IDFanmdFaPS8x8Oai91f7Ytny08Q97+a5nXwLi7xqRTJJ8JjeVZhWQZIn9BPt83JZQ9K+s/DsHQAtZzwZQd3cXYc2NSm/RhN+KK5/Qqy2Z/BqjSpmzPmIkz/tg+53MgybYVx3bha9DWtcYqgQTWYQVadvly0Thp2NfZLsAODFI5Ucl7d6Q9Y5P9Qe3SXrnkFI7VPkMgZTjumLWzXTIgp6zWTZL25sO/+oZKc05oXXqDUiMCYm2lgRPCT6Ujsf2K4lsRvpdOyZxW3PrjXgjMAyvQJI7auqPV2QsX0yUWXT9Y6LihDFV6nn2g4=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2433.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1943d6a-bb0a-464c-3f55-08d82e0d974c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2020 07:05:17.9365 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ep1BjLcHjdq09PUnei4Xlt8V1gt7NtFlVk6f8NikCk9yIzfhweDfrMdK+wlzBNBRWrhsu0xOAT2OxyIw+gg5yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4176
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
Cc: "michael.j.ruhl@intel.com" <michael.j.ruhl@intel.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W0FNRCBQdWJsaWMgVXNlXQ0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogQ2hy
aXN0aWFuIEvDtm5pZyA8Y2tvZW5pZy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IA0KU2VudDog
VHVlc2RheSwgSnVseSAyMSwgMjAyMCAxOjAzIFBNDQpUbzogZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZw0KQ2M6IENoYXVoYW4sIE1hZGhhdiA8TWFkaGF2LkNoYXVoYW5AYW1kLmNvbT47
IHR6aW1tZXJtYW5uQHN1c2UuZGU7IG1pY2hhZWwuai5ydWhsQGludGVsLmNvbQ0KU3ViamVjdDog
W1BBVENIIDAyLzExXSBkcm0vdHRtOiBjbGVhbnVwIGlvX21lbSBpbnRlcmZhY2Ugd2l0aCBub3V2
ZWF1DQoNCk5vdXZlYXUgaXMgdGhlIG9ubHkgdXNlciBvZiB0aGlzIGZ1bmN0aW9uYWxpdHkgYW5k
IGV2aWN0aW5nIGlvIHNwYWNlIG9uIC1FQUdBSU4gaXMgcmVhbGx5IGEgbWlzdXNlIG9mIHRoZSBy
ZXR1cm4gY29kZS4NCg0KSW5zdGVhZCBzd2l0Y2ggdG8gdXNpbmcgLUVOT1NQQyBoZXJlIHdoaWNo
IG1ha2VzIG11Y2ggbW9yZSBzZW5zZSBhbmQgc2ltcGxpZmllcyB0aGUgY29kZS4NCg0KU2lnbmVk
LW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KDQpD
b21wbGV0ZSByZW1haW5pbmcgY2xlYW51cCBwYXRjaGVzIChQYXRjaCAyLSAxMSkgbG9va3MgZmlu
ZSwNClBhdGNoIDItMTE6IFJldmlld2VkLWJ5OiBNYWRoYXYgQ2hhdWhhbiA8bWFkaGF2LmNoYXVo
YW5AYW1kLmNvbT4NCg0KUmVnYXJkcywNCk1hZGhhdg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvbm91dmVhdV9iby5jIHwgMiAtLQ0KIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3V0
aWwuYyAgICB8IDQgKystLQ0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVh
dV9iby5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jDQppbmRleCA2MTM1
NWNmYjczMzUuLmE0ODY1MjgyNmY2NyAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2
ZWF1L25vdXZlYXVfYm8uYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9i
by5jDQpAQCAtMTUwNSw4ICsxNTA1LDYgQEAgbm91dmVhdV90dG1faW9fbWVtX3Jlc2VydmUoc3Ry
dWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsIHN0cnVjdCB0dG1fbWVtX3JlZyAqcmVnKQ0KIAkJCWlm
IChyZXQgIT0gMSkgew0KIAkJCQlpZiAoV0FSTl9PTihyZXQgPT0gMCkpDQogCQkJCQlyZXR1cm4g
LUVJTlZBTDsNCi0JCQkJaWYgKHJldCA9PSAtRU5PU1BDKQ0KLQkJCQkJcmV0dXJuIC1FQUdBSU47
DQogCQkJCXJldHVybiByZXQ7DQogCQkJfQ0KIA0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS90dG0vdHRtX2JvX3V0aWwuYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3V0aWwuYw0K
aW5kZXggNWUwZjNhOWNhZWRjLi43ZDJjNTBmZWY0NTYgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9ib191dGlsLmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2Jv
X3V0aWwuYw0KQEAgLTExNiw3ICsxMTYsNyBAQCBzdGF0aWMgaW50IHR0bV9tZW1faW9fZXZpY3Qo
c3RydWN0IHR0bV9tZW1fdHlwZV9tYW5hZ2VyICptYW4pDQogCXN0cnVjdCB0dG1fYnVmZmVyX29i
amVjdCAqYm87DQogDQogCWlmICghbWFuLT51c2VfaW9fcmVzZXJ2ZV9scnUgfHwgbGlzdF9lbXB0
eSgmbWFuLT5pb19yZXNlcnZlX2xydSkpDQotCQlyZXR1cm4gLUVBR0FJTjsNCisJCXJldHVybiAt
RU5PU1BDOw0KIA0KIAlibyA9IGxpc3RfZmlyc3RfZW50cnkoJm1hbi0+aW9fcmVzZXJ2ZV9scnUs
DQogCQkJICAgICAgc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0LA0KQEAgLTE0Myw3ICsxNDMsNyBA
QCBpbnQgdHRtX21lbV9pb19yZXNlcnZlKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LA0KIAkg
ICAgbWVtLT5idXMuaW9fcmVzZXJ2ZWRfY291bnQrKyA9PSAwKSB7DQogcmV0cnk6DQogCQlyZXQg
PSBiZGV2LT5kcml2ZXItPmlvX21lbV9yZXNlcnZlKGJkZXYsIG1lbSk7DQotCQlpZiAocmV0ID09
IC1FQUdBSU4pIHsNCisJCWlmIChyZXQgPT0gLUVOT1NQQykgew0KIAkJCXJldCA9IHR0bV9tZW1f
aW9fZXZpY3QobWFuKTsNCiAJCQlpZiAocmV0ID09IDApDQogCQkJCWdvdG8gcmV0cnk7DQotLQ0K
Mi4xNy4xDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
