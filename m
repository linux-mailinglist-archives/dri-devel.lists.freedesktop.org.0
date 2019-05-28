Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A667E2CA2F
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 17:17:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D29089E3E;
	Tue, 28 May 2019 15:17:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790085.outbound.protection.outlook.com [40.107.79.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EB9A89E3E
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 15:17:46 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1163.namprd12.prod.outlook.com (10.168.240.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.18; Tue, 28 May 2019 15:17:44 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5%7]) with mapi id 15.20.1922.021; Tue, 28 May 2019
 15:17:44 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Thomas Hellstrom <thomas@shipmail.org>, "Lendacky, Thomas"
 <Thomas.Lendacky@amd.com>
Subject: Re: [RFC PATCH] drm/ttm, drm/vmwgfx: Have TTM support AMD SEV
 encryption
Thread-Topic: [RFC PATCH] drm/ttm, drm/vmwgfx: Have TTM support AMD SEV
 encryption
Thread-Index: AQHVEghVWyfc42SAm0iQ56wuAPU/AaZ589eAgAAJjQCAAAwvAIAABk4AgAAFh4CAABf0gIAAB2kAgAAsKICABcndAIAAeesAgAAGZ4CAAAHLAA==
Date: Tue, 28 May 2019 15:17:44 +0000
Message-ID: <cc1d736d-9a8f-03d0-26ab-60a686ad71bd@amd.com>
References: <20190524081114.53661-1-thomas@shipmail.org>
 <f2c4ccdd-49c9-2188-3378-2f333a8f605f@amd.com>
 <d397836b-13a4-b6cd-e059-035203f2edc6@shipmail.org>
 <d59cb481-1360-25eb-a2da-1ae64c648daf@shipmail.org>
 <84fa57da-7bb7-8322-125a-89596fbb2145@amd.com>
 <33816cbd-ddfb-b47a-a305-2760f8568eff@shipmail.org>
 <79c8d26a-d2dd-3e2c-f0bc-cbfc47a67fee@amd.com>
 <deef176a-5467-5beb-7f1b-fcd7bd1deab7@shipmail.org>
 <CADnq5_O+L-aJ_WU4ZcBmLYOV3RqNouw_P-2wYfCoJwXxj6ny3g@mail.gmail.com>
 <52df61a9-028e-8ff6-0850-20ddddb11de3@shipmail.org>
 <5b1b3f22-beea-16c4-a98f-9e632b408020@amd.com>
 <6b9b8536-bfea-5817-06e4-23881b86ab31@shipmail.org>
In-Reply-To: <6b9b8536-bfea-5817-06e4-23881b86ab31@shipmail.org>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM5PR0202CA0001.eurprd02.prod.outlook.com
 (2603:10a6:203:69::11) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 72afe7c6-2674-49b3-9863-08d6e37fa248
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1163; 
x-ms-traffictypediagnostic: DM5PR12MB1163:
x-microsoft-antispam-prvs: <DM5PR12MB11632672E4C9675CF0DA0C89831E0@DM5PR12MB1163.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 00514A2FE6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(39860400002)(366004)(376002)(396003)(136003)(51914003)(189003)(199004)(4326008)(305945005)(65826007)(31686004)(71200400001)(71190400001)(7736002)(186003)(66446008)(76176011)(73956011)(102836004)(99286004)(6636002)(316002)(64756008)(52116002)(58126008)(65956001)(66476007)(65806001)(66556008)(66946007)(54906003)(25786009)(110136005)(6246003)(386003)(6506007)(53546011)(256004)(46003)(14444005)(31696002)(478600001)(5660300002)(8676002)(81166006)(81156014)(36756003)(72206003)(8936002)(6486002)(2906002)(446003)(53936002)(86362001)(11346002)(2616005)(486006)(229853002)(6512007)(14454004)(476003)(6116002)(68736007)(6436002)(64126003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1163;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gdCayv+6Wvkzwp+7YM9Ak8Oj9h9q/Y5MfDjQQ2MSOnzYUjmJIiDI7aa9A16z3fO+Dh1+MIJyI/gydmItgH5Rv48h99YochI7Rtx1f6ps01XOyQ0gJnK3uNgyAN0T3rEDZYhJjNnjth6KHPvHteBP+gGAUwHYNjoowQnWM/MYnLd6JkCTQnXTnQBLYKv/J8lTFskc7YGs+SjqYc7mu8QurjbXGjDhW20eSoD74A3gmo5ESvSGUQQ9m1i+u+9zIhKAW+Oa2NtHRkp5my8D2Wr4Wu8yVQHFMwRCycdXQ33reaOj6YztdBOfRj/tDP+gvXktEsFBSMb+x4yf7wfP7QKRygcoFZ6QYg7NebxZzi7dx+2vTGU7H+sgbXoFZux6zuX0Ywpn/MH0x8/StP/GPq/G88QS0iIkdjAyQpgxUdaZ75I=
Content-ID: <2E4D57E044886942950738942C0C0BC6@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72afe7c6-2674-49b3-9863-08d6e37fa248
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2019 15:17:44.5364 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1163
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sMc84va6TCDUDceOAzXpIVtV6KpUTScgQkP5oHuazcI=;
 b=aCWdZYm3n9kg4zGiP9W0KYzyp1cSu3oLps2G1y9hmT96qEoBve1dMO5eFKSRFSrLFhQDh6FgIpPLtu9xXxHUsDHFvfjSXBc5/UVpNXQgJtMNS3z1rjrX7kronUq1B909hVqcQap86YlmyLshoeSeiESI/PR3ZTSO9wd4UG6rkhU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVGhvbWFzLA0KDQpBbSAyOC4wNS4xOSB1bSAxNzoxMSBzY2hyaWViIFRob21hcyBIZWxsc3Ry
b206DQo+IEhpLCBUb20sDQo+DQo+IFRoYW5rcyBmb3IgdGhlIHJlcGx5LiBUaGUgcXVlc3Rpb24g
aXMgbm90IGdyYXBoaWNzIHNwZWNpZmljLCBidXQgbGllcyANCj4gaW4geW91ciBhbnN3ZXIgZnVy
dGhlciBiZWxvdzoNCj4NCj4gT24gNS8yOC8xOSA0OjQ4IFBNLCBMZW5kYWNreSwgVGhvbWFzIHdy
b3RlOg0KPj4gT24gNS8yOC8xOSAyOjMxIEFNLCBUaG9tYXMgSGVsbHN0cm9tIHdyb3RlOg0KPj4g
W1NOSVBdDQo+PiBBcyBmb3Iga2VybmVsIHZtYXBzIGFuZCB1c2VyLW1hcHMsIHRob3NlIHBhZ2Vz
IHdpbGwgYmUgbWFya2VkIGVuY3J5cHRlZA0KPj4gKHVubGVzcyBleHBsaWNpdGx5IG1hZGUgdW4t
ZW5jcnlwdGVkIGJ5IGNhbGxpbmcgc2V0X21lbW9yeV9kZWNyeXB0ZWQoKSkuDQo+PiBCdXQsIGlm
IHlvdSBhcmUgY29weWluZyB0by9mcm9tIHRob3NlIGFyZWFzIGludG8gdGhlIHVuLWVuY3J5cHRl
ZCBETUENCj4+IGFyZWEgdGhlbiBldmVyeXRoaW5nIHdpbGwgYmUgb2suDQo+DQo+IFRoZSBxdWVz
dGlvbiBpcyByZWdhcmRpbmcgdGhlIGFib3ZlIHBhcmFncmFwaC4NCj4NCj4gQUZBSUNULMKgIHNl
dF9tZW1vcnlfZGVjcnlwdGVkKCkgb25seSBjaGFuZ2VzIHRoZSBmaXhlZCBrZXJuZWwgbWFwIFBU
RXMuDQo+IEJ1dCB3aGVuIHNldHRpbmcgdXAgb3RoZXIgYWxpYXNlZCBQVEVzIHRvIHRoZSBleGFj
dCBzYW1lIGRlY3J5cHRlZCANCj4gcGFnZXMsIGZvciBleGFtcGxlIHVzaW5nIGRtYV9tbWFwX2Nv
aGVyZW50KCksIGttYXBfYXRvbWljX3Byb3QoKSwgDQo+IHZtYXAoKSBldGMuIFdoYXQgY29kZSBp
cyByZXNwb25zaWJsZSBmb3IgY2xlYXJpbmcgdGhlIGVuY3J5cHRlZCBmbGFnIA0KPiBvbiB0aG9z
ZSBQVEVzPyBJcyB0aGVyZSBzb21ldGhpbmcgaW4gdGhlIHg4NiBwbGF0Zm9ybSBjb2RlIGRvaW5n
IHRoYXQ/DQoNClRvbSBhY3R1YWxseSBleHBsYWluZWQgdGhpczoNCj4gVGhlIGVuY3J5cHRpb24g
Yml0IGlzIGJpdC00NyBvZiBhIHBoeXNpY2FsIGFkZHJlc3MuDQoNCkluIG90aGVyIHdvcmRzIHNl
dF9tZW1vcnlfZGVjcnlwdGVkKCkgY2hhbmdlcyB0aGUgcGh5c2ljYWwgYWRkcmVzcyBpbiANCnRo
ZSBQVEVzIG9mIHRoZSBrZXJuZWwgbWFwcGluZyBhbmQgYWxsIG90aGVyIHVzZSBjYXNlcyBqdXN0
IGNvcHkgdGhhdCANCmZyb20gdGhlcmUuDQoNClRoYXQncyByYXRoZXIgbmlmdHksIGJlY2F1c2Ug
dGhpcyB3YXkgZXZlcnlib2R5IHdpbGwgZWl0aGVyIHVzZSBvciBub3QgDQp1c2UgZW5jcnlwdGlv
biBvbiB0aGUgcGFnZS4NCg0KQ2hyaXN0aWFuLg0KDQo+DQo+IFRoYW5rcywNCj4gVGhvbWFzDQo+
DQo+DQo+Pg0KPj4gVGhpbmdzIGdldCBmdXp6eSBmb3IgbWUgd2hlbiBpdCBjb21lcyB0byB0aGUg
R1BVIGFjY2VzcyBvZiB0aGUgbWVtb3J5DQo+PiBhbmQgd2hhdCBhbmQgaG93IGl0IGlzIGFjY2Vz
c2VkLg0KPj4NCj4+IFRoYW5rcywNCj4+IFRvbQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
