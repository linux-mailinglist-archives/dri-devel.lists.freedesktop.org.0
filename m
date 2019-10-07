Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF19CE4D5
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 16:13:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88E216E0E1;
	Mon,  7 Oct 2019 14:13:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700055.outbound.protection.outlook.com [40.107.70.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A8C56E04A;
 Mon,  7 Oct 2019 14:13:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VxEl4ru/btN2pLDIIlD4ueYs4E4pzGTbbbGk4ydgSDOiNhiy2rBAUZVRHzPTcIbe9BT796fCzGlnHvAK/mvaAdfQUmMi+oQwx3sV4vyXfDcBSeFPHoeynPzMfhxnFx1eNCc84srETVY8dDzjwgJ4Rngf4ozlxbT56wCCLm+/cmRrMo26cLT76pF1fqNiWj6ObDyHbcX24RiRu1RNK7fzDVQ/MDyJ5Z0GNlLPPwOvrL1hJuQMaKjExbUkzdYC3OF1kX5H+sYqnoO1pGRlvhd33aVVD77YFiLBbBADohFET3NSrF5cf5Jw/VG8qAYj3dBXJY5gR9YD3lEBz6OLAxhZOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JXON0sIeHZ2wNwMyyQbQ2fwIi8wQ7ZP9+Mol11hgLPY=;
 b=BqdHPkNw8peO5YFKxEqWJlomOGANn3l7tH4B17++lbol/lRBrnhqEfTGmsq2Sns1dNMTDkOYB0YuLzkWkADN6TG3DPsS7qeacS3pFygZpqw01JKVTVbIjJSN5+Z++nZbZEUeM3V5K3XHtGdTj4eb301Kee0LsYGM+2N3+WmuMqL77JfYFRbA4OqgdQTs6GAN3coKypN/6c3TdG+P2AzkU1zir2BxCtAWfKlxPstdfmZGuUyOP661Gmxel2YD89NvR26WdJf9cdWZCnpOKWBQXtoBgAtnmJmQOj/n0p2s+zD7Z02sfO+Ev2O9wHEm+vyEHUHJKvzeyEEAkSwlVRmD4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB2516.namprd12.prod.outlook.com (10.172.121.141) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Mon, 7 Oct 2019 14:13:44 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::5471:f58b:733e:1a61]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::5471:f58b:733e:1a61%7]) with mapi id 15.20.2327.023; Mon, 7 Oct 2019
 14:13:44 +0000
From: Harry Wentland <hwentlan@amd.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, "Wentland, Harry"
 <Harry.Wentland@amd.com>, "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Zhou, David(ChunMing)" <David1.Zhou@amd.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/amd/display: Fix typo in some comments
Thread-Topic: [PATCH] drm/amd/display: Fix typo in some comments
Thread-Index: AQHVe3CP7mPuXXwvtkyI5VRfn5sIiKdPO/aA
Date: Mon, 7 Oct 2019 14:13:44 +0000
Message-ID: <04e006aa-a354-dfe3-3d13-d674c662c300@amd.com>
References: <20191005113205.14601-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20191005113205.14601-1-christophe.jaillet@wanadoo.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
x-clientproxiedby: YTXPR0101CA0064.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::41) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5a7fbf91-6241-4e0d-6846-08d74b308fcc
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: CY4PR1201MB2516:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB2516AA1730D18C593E4315118C9B0@CY4PR1201MB2516.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 01834E39B7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(346002)(136003)(376002)(366004)(199004)(189003)(66446008)(446003)(2201001)(11346002)(6116002)(186003)(2501003)(476003)(2616005)(3846002)(26005)(58126008)(54906003)(5660300002)(316002)(65806001)(65956001)(66066001)(25786009)(110136005)(64756008)(8936002)(31696002)(66556008)(31686004)(66476007)(8676002)(2906002)(66946007)(81166006)(486006)(81156014)(36756003)(76176011)(6512007)(14454004)(6436002)(6246003)(305945005)(6486002)(478600001)(71190400001)(71200400001)(256004)(52116002)(99286004)(14444005)(229853002)(4326008)(386003)(6506007)(53546011)(102836004)(7736002)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB2516;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nMLMUQDqfadKl8adIH0tn+dzNX6afgQFCIQdCfIHUdvSjH9f94Q/v7cahFOv36PN6MnGQBUkfwhCiBu77CImqFv8LDcxQB8pXYHPPQ3jxO+sBGwIvtWIklw6bhFkCs6sx+dViKo2r+b1t8vKkCevDEGlQ9PWtWUKL2fm2j1IEBwL+e/y99ycJtqGot88cys3ywHbnhDKyKX9i0z4wGVh5xyn37V/NOMlQ+x0TSpt0sRAwABMgh/CKDD+cu6+/6Iy/iXV00pEIsJ4zQIQgb3TsnpXIcG5A1kuSXnq2T1rE6QEQ114ezdCl5TevRIQzrwmPy0U/zxzAnim+VrTjAzxtgYVe0vK6PgJoh+bJGoWLlEORCnwo1I5lWUTAJRM+F30WMPN2ECcbKSVoOqY83OcqZpVGd08QqfRu/KAfMiwpis=
Content-ID: <CEAFFC5EF80DCA4887F9FA2FF3BF475B@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a7fbf91-6241-4e0d-6846-08d74b308fcc
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2019 14:13:44.2494 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zaNEZM4Hdd7p913D9bXoIQyCWdcjEIMItp95EaPS0z4Rf+M8e7Y1Dk0mkHlb3heK8kGuAt/b+Jcp350YvaeBLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2516
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JXON0sIeHZ2wNwMyyQbQ2fwIi8wQ7ZP9+Mol11hgLPY=;
 b=mYSvhDDh5Mw9sS/vH5wMZYxxeQ0Is+MEtJ0iuxbZalLQY7yRRQ0wQtuvHNdcVfBUltnBOUn8rXFH3n4DENgYrkeFtlctk3UxVvslr9myDu+WXygohuooBA2dhtyAiMiUqm4pm2A28/KBLYE8V9Q3qSTNse6h1OsEPvUObJBX8oQ=
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
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0xMC0wNSA3OjMyIGEubS4sIENocmlzdG9waGUgSkFJTExFVCB3cm90ZToNCj4gcCBh
bmQgZyBhcmUgc3dpdGNoZWQgaW4gJ2FtZHBndV9kbScNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IENo
cmlzdG9waGUgSkFJTExFVCA8Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI+DQoNClJldmll
d2VkLWJ5OiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4NCg0KSGFycnkN
Cg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1
X2RtLmMgfCA0ICsrLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2FtZGdwdV9kbS9hbWRncHVfZG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRn
cHVfZG0vYW1kZ3B1X2RtLmMNCj4gaW5kZXggOTI5MzJkNTIxZDdmLi5iOWMyZTFhOTMwYWIgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1
X2RtLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRn
cHVfZG0uYw0KPiBAQCAtMTA0Myw3ICsxMDQzLDcgQEAgc3RhdGljIHZvaWQgczNfaGFuZGxlX21z
dChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBib29sIHN1c3BlbmQpDQo+ICANCj4gIC8qKg0KPiAg
ICogZG1faHdfaW5pdCgpIC0gSW5pdGlhbGl6ZSBEQyBkZXZpY2UNCj4gLSAqIEBoYW5kbGU6IFRo
ZSBiYXNlIGRyaXZlciBkZXZpY2UgY29udGFpbmluZyB0aGUgYW1kcGd1X2RtIGRldmljZS4NCj4g
KyAqIEBoYW5kbGU6IFRoZSBiYXNlIGRyaXZlciBkZXZpY2UgY29udGFpbmluZyB0aGUgYW1kZ3B1
X2RtIGRldmljZS4NCj4gICAqDQo+ICAgKiBJbml0aWFsaXplIHRoZSAmc3RydWN0IGFtZGdwdV9k
aXNwbGF5X21hbmFnZXIgZGV2aWNlLiBUaGlzIGludm9sdmVzIGNhbGxpbmcNCj4gICAqIHRoZSBp
bml0aWFsaXplcnMgb2YgZWFjaCBETSBjb21wb25lbnQsIHRoZW4gcG9wdWxhdGluZyB0aGUgc3Ry
dWN0IHdpdGggdGhlbS4NCj4gQEAgLTEwNzMsNyArMTA3Myw3IEBAIHN0YXRpYyBpbnQgZG1faHdf
aW5pdCh2b2lkICpoYW5kbGUpDQo+ICANCj4gIC8qKg0KPiAgICogZG1faHdfZmluaSgpIC0gVGVh
cmRvd24gREMgZGV2aWNlDQo+IC0gKiBAaGFuZGxlOiBUaGUgYmFzZSBkcml2ZXIgZGV2aWNlIGNv
bnRhaW5pbmcgdGhlIGFtZHBndV9kbSBkZXZpY2UuDQo+ICsgKiBAaGFuZGxlOiBUaGUgYmFzZSBk
cml2ZXIgZGV2aWNlIGNvbnRhaW5pbmcgdGhlIGFtZGdwdV9kbSBkZXZpY2UuDQo+ICAgKg0KPiAg
ICogVGVhcmRvd24gY29tcG9uZW50cyB3aXRoaW4gJnN0cnVjdCBhbWRncHVfZGlzcGxheV9tYW5h
Z2VyIHRoYXQgcmVxdWlyZQ0KPiAgICogY2xlYW51cC4gVGhpcyBpbnZvbHZlcyBjbGVhbmluZyB1
cCB0aGUgRFJNIGRldmljZSwgREMsIGFuZCBhbnkgbW9kdWxlcyB0aGF0DQo+IA0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
