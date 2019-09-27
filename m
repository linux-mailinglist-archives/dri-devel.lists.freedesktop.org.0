Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7844CC0A94
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 19:48:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E72036E199;
	Fri, 27 Sep 2019 17:48:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750054.outbound.protection.outlook.com [40.107.75.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9D766E198;
 Fri, 27 Sep 2019 17:48:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PKtE2uIMc9MO/5mQDQ2QlCWsOAhdPE60Kt5feqCXGjwekQ8HW2hXwLDdPSNH1z1SJStroiltkfhl1KSu5heIdxTRSHwLbQxELVTJoqM92x7l2BMGuqz5BizpiITSIYXQU8y9WoZmPjkDyp+5W1WuSI0T3/nRU0rGU4euW9WCQ70bx1vENI5fPUsVP6fbMOgsw1TR7gMlBqooUAZrouSOHNJA2huiBeLj6bZzF4ArgsDA2oAgnovTgOOHwwsEmeA1LdVQRO4zIp536Cdbbt+ogWXSK47QByEuv5E1na7dezDkIyIbxUnPxXvb4aAtWIAjyihAHkCR/hIJYY6FG8GyiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dhIf6PIf4I+LJ/iS8PWnECjfmsw8Osoo+DdeE2vgPbw=;
 b=bi/SHqqWnZjALhoS9K8785PjfSTLwGGlFDmOW9CF2IPQJNM5C5IUu+xbWUdRg/kZqOaVijTEOirowpGcsEdfH80i5BNb5Pu/ErHWjRGV7ee8pZOrnM1F7+ePS6ia7iqiu02OBo93AC6FG7SBhA6f+LXkF+9MmoqQe3aYwIC7VQ7hKeAHwaC5eA8khOgSvA5bjTCrf/2n1vpytVj1kyK/2CeuV0m9vbZA1iSN7AHOjQWf7YEfweWQXMa0Qd2qitxZxPq+ZG0vmsym12d7yqeqY5rnNohGWLmkGUl3OydT+s6KstSeXEtVgjmqoQ5p+urfuoF3xZ48Cw0IG389IqjGhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0181.namprd12.prod.outlook.com (10.172.79.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.26; Fri, 27 Sep 2019 17:48:06 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::708e:c826:5b05:e3f0]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::708e:c826:5b05:e3f0%11]) with mapi id 15.20.2284.023; Fri, 27 Sep
 2019 17:48:06 +0000
From: Harry Wentland <hwentlan@amd.com>
To: Lyude Paul <lyude@redhat.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/6] drm/amdgpu/dm/mst: Don't create MST topology managers
 for eDP ports
Thread-Topic: [PATCH 1/6] drm/amdgpu/dm/mst: Don't create MST topology
 managers for eDP ports
Thread-Index: AQHVdL0B5kLUEjAc5UmzYJX4Fbcbl6c/zfGA
Date: Fri, 27 Sep 2019 17:48:06 +0000
Message-ID: <2a1d5221-b801-44f9-c966-1163b8d67b3f@amd.com>
References: <20190926225122.31455-1-lyude@redhat.com>
 <20190926225122.31455-2-lyude@redhat.com>
In-Reply-To: <20190926225122.31455-2-lyude@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
x-clientproxiedby: YT1PR01CA0011.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::24)
 To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6828357a-1c99-488e-babf-08d74372da3b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:CY4PR1201MB0181; 
x-ms-traffictypediagnostic: CY4PR1201MB0181:
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB0181C9029F1B0473F8FA18368C810@CY4PR1201MB0181.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:346;
x-forefront-prvs: 0173C6D4D5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(366004)(396003)(376002)(136003)(189003)(199004)(256004)(4744005)(66476007)(25786009)(31696002)(7736002)(6246003)(81166006)(66946007)(478600001)(6512007)(305945005)(66556008)(229853002)(6486002)(6436002)(14454004)(66066001)(81156014)(64756008)(66446008)(8676002)(65806001)(446003)(110136005)(4326008)(58126008)(54906003)(316002)(31686004)(2501003)(65956001)(2906002)(52116002)(486006)(476003)(2616005)(26005)(8936002)(76176011)(386003)(6506007)(102836004)(53546011)(6116002)(186003)(99286004)(3846002)(11346002)(36756003)(71200400001)(71190400001)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0181;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1b5n473n/vqWYPvfseyfi8IFRnIGN0By/ny7B7K2H/IedsEEPloBkcbBeLNOlxb/Un8qQWjb7Wuo58fJpt5rK29R0U4LDfOw6WE8tseTZswRc5c3uuFcPmal7xbHDeUfOJlUVGQV1jQOB1dA5Q67JNagenyifF7jcDOhOd1V2hnFeptKzTFzubeqKPSbB0fF6+y30yF8m8JeDbVLrOaOBlR8pijGhxv/iMWT2qCbJRhrPTy4rsv3iFrt7QMTtWB4+HyaZ0mDYsc6QcWMb1C2bkNXci/cd1ybJTNSwN/MsDFGl1ZUXmilh52D3I8rWYkewH2tyiPT8Vcah/GcFYfNflZjyo0OOuc2htzg+rLWeY+7ujc/mnCsqQo6HueJE5PZNaMwDHbjqdGwLY/DwwSRNhC25+kxfnOMQ93XdUuSv6w=
Content-ID: <97FEF00A2C6A6741909CDC28AD6A4DC8@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6828357a-1c99-488e-babf-08d74372da3b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2019 17:48:06.6953 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eyh7jcfc7eI1Hqj+FoX6PoWCs6B7egPqmPVZaohyk/S2fz3Dzvo9KF7Yky7CtbVUu0xqHVW6YbYFM666Wh3STQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0181
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dhIf6PIf4I+LJ/iS8PWnECjfmsw8Osoo+DdeE2vgPbw=;
 b=eBCI9e2GCg5j+NIkCnjKA4CHOLQajEptyR6l6YyIApmy/ZZFnMhSlpc9FWX2MForcj0amBZ4q+ByIedNdki9KPwcrzXRG3trZnACTBZMOZPy/K6zU3Gw5D/1FQ+acosOliEZ2+0iALDsIJNG8rPeqDh9pJseJFcUhy3Z7DFtnls=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Thomas Lim <Thomas.Lim@amd.com>, "Li,
 Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Francis,
 David" <David.Francis@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, "Zuo, Jerry" <Jerry.Zuo@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wOS0yNiA2OjUxIHAubS4sIEx5dWRlIFBhdWwgd3JvdGU6DQo+IFNpZ25lZC1vZmYt
Ynk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+DQoNClJldmlld2VkLWJ5OiBIYXJyeSBX
ZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4NCg0KSGFycnkNCg0KPiAtLS0NCj4gIGRy
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX21zdF90eXBlcy5j
IHwgNCArKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1f
bXN0X3R5cGVzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdw
dV9kbV9tc3RfdHlwZXMuYw0KPiBpbmRleCA1ZWMxNGVmZDRkOGMuLjE4NWJmMGUyYmRhMiAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVf
ZG1fbXN0X3R5cGVzLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdw
dV9kbS9hbWRncHVfZG1fbXN0X3R5cGVzLmMNCj4gQEAgLTQxNyw2ICs0MTcsMTAgQEAgdm9pZCBh
bWRncHVfZG1faW5pdGlhbGl6ZV9kcF9jb25uZWN0b3Ioc3RydWN0IGFtZGdwdV9kaXNwbGF5X21h
bmFnZXIgKmRtLA0KPiAgCWRybV9kcF9hdXhfcmVnaXN0ZXIoJmFjb25uZWN0b3ItPmRtX2RwX2F1
eC5hdXgpOw0KPiAgCWRybV9kcF9jZWNfcmVnaXN0ZXJfY29ubmVjdG9yKCZhY29ubmVjdG9yLT5k
bV9kcF9hdXguYXV4LA0KPiAgCQkJCSAgICAgICZhY29ubmVjdG9yLT5iYXNlKTsNCj4gKw0KPiAr
CWlmIChhY29ubmVjdG9yLT5iYXNlLmNvbm5lY3Rvcl90eXBlID09IERSTV9NT0RFX0NPTk5FQ1RP
Ul9lRFApDQo+ICsJCXJldHVybjsNCj4gKw0KPiAgCWFjb25uZWN0b3ItPm1zdF9tZ3IuY2JzID0g
JmRtX21zdF9jYnM7DQo+ICAJZHJtX2RwX21zdF90b3BvbG9neV9tZ3JfaW5pdCgNCj4gIAkJJmFj
b25uZWN0b3ItPm1zdF9tZ3IsDQo+IA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
