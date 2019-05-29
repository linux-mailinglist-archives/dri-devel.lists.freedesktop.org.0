Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA28E2E969
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2019 01:32:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 333766E136;
	Wed, 29 May 2019 23:31:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810070.outbound.protection.outlook.com [40.107.81.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB94F6E134;
 Wed, 29 May 2019 23:31:56 +0000 (UTC)
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0216.namprd12.prod.outlook.com (10.172.76.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.18; Wed, 29 May 2019 23:31:55 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::7500:b13:ffcb:f9e3]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::7500:b13:ffcb:f9e3%10]) with mapi id 15.20.1922.021; Wed, 29 May 2019
 23:31:55 +0000
From: Harry Wentland <hwentlan@amd.com>
To: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 0/2] drm/amd/display: Add HDR output metadata support for
 amdgpu
Thread-Topic: [PATCH 0/2] drm/amd/display: Add HDR output metadata support for
 amdgpu
Thread-Index: AQHVFYjaBNkiEvpFMkCnfDYcKhr0xKaCwisA
Date: Wed, 29 May 2019 23:31:54 +0000
Message-ID: <77396fec-944e-291b-38fe-588e899fcb62@amd.com>
References: <20190528190836.10738-1-nicholas.kazlauskas@amd.com>
In-Reply-To: <20190528190836.10738-1-nicholas.kazlauskas@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [69.171.153.184]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-clientproxiedby: YTOPR0101CA0052.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::29) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 39e1a51d-514b-40f3-eda2-08d6e48dd5a9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CY4PR1201MB0216; 
x-ms-traffictypediagnostic: CY4PR1201MB0216:
x-microsoft-antispam-prvs: <CY4PR1201MB02162B43C188BCE4CD340BBD8C1F0@CY4PR1201MB0216.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0052308DC6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(136003)(39860400002)(396003)(366004)(346002)(189003)(199004)(76176011)(6246003)(8936002)(66476007)(72206003)(25786009)(478600001)(2906002)(64756008)(81156014)(99286004)(52116002)(386003)(66446008)(53546011)(450100002)(64126003)(66556008)(36756003)(66946007)(6506007)(73956011)(58126008)(5660300002)(31686004)(2501003)(4326008)(65806001)(81166006)(102836004)(229853002)(476003)(3846002)(53936002)(256004)(186003)(65956001)(486006)(26005)(6116002)(110136005)(316002)(7736002)(6486002)(14454004)(2616005)(2201001)(71200400001)(305945005)(6436002)(6512007)(11346002)(4744005)(31696002)(71190400001)(66066001)(446003)(65826007)(68736007)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0216;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: SfAn0NPSB3JVblF0r4C+nBl+NzcPUl9vki1anGr3Uxp9G+s2J9tEZc3BRGfykPsw9VpAk+/8Ly8Pqm3xyalab9qG/VpNN+em16w9m3t8TWkjLegosYGIXkigd5ACviz8yhesDIbhudMwVNcUIFJs8t1CMDlx0joq1Qz6CBFqudrdwL3SDaNl9oXZhVKhSyCvjddnYTgPEhissTotJvLJXuAhBJymbCFNz3YSdGb6JspjhDDLXBTFSg7uvcOSvbajKjUmYxI7MApUB5MTMCc/RYjt6lNWqswgW6nzLLFqwF6iXnw+TbkAj4WUJoDihRjpsZmWJ24qmz7qy76iYkC9fNHQ5g6qXsjpOxjvIEe7T+WLXxXc2IFqQ2gB5fI1Z5zNIOOWWnShGQPlInr4zIAXZb9nsR+3agd4N6X+doUoG1I=
Content-ID: <05A941C32605ED42926038A3A3AA4B8E@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39e1a51d-514b-40f3-eda2-08d6e48dd5a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2019 23:31:54.9171 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hwentlan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0216
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eJdn4dcHZ/Kb/8sc4+rc2pidScdCOC/LEjBjKgQU0OU=;
 b=JrO4TiWjTzFz2ddXE/AgC0AJ3dtWLCBB4P4/8+1UJUW8P1BplnllwAguGj4cF3+qHpYhrACgQDBcSGwMc/SmvFoGdumcl1u5FdPB9NkDwfwwxEiqGUJnwiERhJnKEEyEeXM7RLf3wgV2xJsQUVSfalMFJGr7ToMbWd4IwXTSZ+g=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wNS0yOCAzOjA4IHAubS4sIE5pY2hvbGFzIEthemxhdXNrYXMgd3JvdGU6DQo+IFRo
aXMgcGF0Y2ggc2VyaWVzIGVuYWJsZXMgSERSIG91dHB1dCBtZXRhZGF0YSBzdXBwb3J0IGluIGFt
ZGdwdSB1c2luZyB0aGUNCj4gRFJNIEhEUiBpbnRlcmZhY2UgbWVyZ2VkIGluIGRybS1taXNjLW5l
eHQuIEVuYWJsZWQgZm9yIERDRSBhbmQgRENOIEFTSUNzDQo+IG92ZXIgRFAgYW5kIEhETUkuDQo+
IA0KPiBJdCdzIGxpbWl0ZWQgdG8gc3RhdGljIEhEUiBtZXRhZGF0YSBzdXBwb3J0IGZvciBub3cg
c2luY2UgdGhhdCdzIGFsbCB0aGUNCj4gRFJNIGludGVyZmFjZSBzdXBwb3J0cy4gSXQgcmVxdWly
ZXMgYSBtb2Rlc2V0IGZvciBlbnRlcmluZyBhbmQgZXhpdGluZyBIRFINCj4gYnV0IHRoZSBtZXRh
ZGF0YSBjYW4gYmUgY2hhbmdlZCB3aXRob3V0IG9uZS4NCj4gDQo+IENjOiBIYXJyeSBXZW50bGFu
ZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4NCj4gDQoNClNlcmllcyBpcw0KUmV2aWV3ZWQtYnk6
IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPg0KDQpIYXJyeQ0KDQo+IE5p
Y2hvbGFzIEthemxhdXNrYXMgKDIpOg0KPiAgIGRybS9hbWQvZGlzcGxheTogRXhwb3NlIEhEUiBv
dXRwdXQgbWV0YWRhdGEgZm9yIHN1cHBvcnRlZCBjb25uZWN0b3JzDQo+ICAgZHJtL2FtZC9kaXNw
bGF5OiBPbmx5IGZvcmNlIG1vZGVzZXRzIHdoZW4gdG9nZ2xpbmcgSERSDQo+IA0KPiAgLi4uL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgMTU1ICsrKysrKysrKysr
KysrKysrLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDE1MSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9u
cygtKQ0KPiANCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
