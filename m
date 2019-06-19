Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9704AF34
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 02:54:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DF2D6E276;
	Wed, 19 Jun 2019 00:53:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810040.outbound.protection.outlook.com [40.107.81.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA1156E273;
 Wed, 19 Jun 2019 00:53:57 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3449.namprd12.prod.outlook.com (20.178.198.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Wed, 19 Jun 2019 00:53:55 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480%2]) with mapi id 15.20.1987.014; Wed, 19 Jun 2019
 00:53:55 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v3 hmm 11/12] mm/hmm: Remove confusing comment and logic
 from hmm_release
Thread-Topic: [PATCH v3 hmm 11/12] mm/hmm: Remove confusing comment and logic
 from hmm_release
Thread-Index: AQHVIk0QeCItTUOe+UqO7ZSHV3sMaKacxokAgAPTBYCAAFGygIABQxSA
Date: Wed, 19 Jun 2019 00:53:55 +0000
Message-ID: <be4f8573-6284-04a6-7862-23bb357bfe3c@amd.com>
References: <20190614004450.20252-1-jgg@ziepe.ca>
 <20190614004450.20252-12-jgg@ziepe.ca> <20190615142106.GK17724@infradead.org>
 <20190618004509.GE30762@ziepe.ca> <20190618053733.GA25048@infradead.org>
In-Reply-To: <20190618053733.GA25048@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.54.211]
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
x-clientproxiedby: YTXPR0101CA0070.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::47) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a80b948e-d657-4f2f-8718-08d6f4509ac3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR12MB3449; 
x-ms-traffictypediagnostic: DM6PR12MB3449:
x-microsoft-antispam-prvs: <DM6PR12MB34492FFD87A8C64FFE095F9892E50@DM6PR12MB3449.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0073BFEF03
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(366004)(346002)(39860400002)(396003)(136003)(189003)(199004)(256004)(229853002)(73956011)(2906002)(71190400001)(102836004)(36756003)(7736002)(68736007)(65826007)(66556008)(305945005)(66946007)(71200400001)(316002)(25786009)(66446008)(64756008)(8936002)(6246003)(6436002)(66476007)(6486002)(4326008)(86362001)(486006)(76176011)(64126003)(26005)(186003)(476003)(14444005)(58126008)(8676002)(110136005)(54906003)(7416002)(53936002)(66066001)(5660300002)(65956001)(65806001)(478600001)(53546011)(6506007)(31686004)(3846002)(52116002)(386003)(99286004)(14454004)(6512007)(72206003)(81166006)(31696002)(6116002)(11346002)(446003)(81156014)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3449;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7mbPSu11w5H5HDPC8boobnD4i4zVCPxr5tSqYE/HnTIKDM5LD0I4pMmL6UNAej57LNEKD9u/jR1Fb+hQDa3NTTIy0gT4w+d+0Ua1pdXvA+RQH26w3gU+CPdOWLwOfdTT4Bz5JvUqBXcfFhqPwytRGbmP2jhKfWP/DPW4dJgYDaxn6AzTk4Av6HCP2L226B5xWsUGg/DYfSmu5k1CGW3zbphMZgrp1bbhV77OzPBnvx+27joWMd8hj2KnfFcKdiiTDhBcCRys2QM/9UROLoKIunBGx+p9hy6Lsmjv3Pg8/9uTPs1B8tGcTP3TBjnSoTYZYn+c+ody14uJ0SPo4k8Lb88+p6gbJxMrNCSRCp3YxoIfTHvIAY2A5oQaZ0qpQDMGfBqkDx5rbwacQ3EBIsYXvDrdt1XnfDesrhAlbUxXSSQ=
Content-ID: <BDC9BD32EDDEB14C9515C4D0AC9287F7@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a80b948e-d657-4f2f-8718-08d6f4509ac3
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2019 00:53:55.4418 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3449
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OdvVMWVc4CxJp888G8h5ta2Gb+IW1NMgVjFOLbLHn/o=;
 b=VJFE7xDUaRVP/mLJxtgnAhwu+rG5uEISn/JPAB560feOteDvfnQS4ffajwijnWrBp3l/2Aq2dF0xVxa/RDhyH0FPmvOAabO1hTDG2bGPj8hvRa9hvZvdv9BNJublXrbCMKTxiaUMyzqZG4lL8PaZbHF+jXLvTbndHBRFhIrfJMs=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, "Yang,
 Philip" <Philip.Yang@amd.com>, Ralph Campbell <rcampbell@nvidia.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 John Hubbard <jhubbard@nvidia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jerome Glisse <jglisse@redhat.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wNi0xOCAxOjM3LCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToNCj4gT24gTW9uLCBK
dW4gMTcsIDIwMTkgYXQgMDk6NDU6MDlQTSAtMDMwMCwgSmFzb24gR3VudGhvcnBlIHdyb3RlOg0K
Pj4gQW0gSSBsb29raW5nIGF0IHRoZSB3cm9uZyB0aGluZz8gTG9va3MgbGlrZSBpdCBjYWxscyBp
dCB0aHJvdWdoIGEgd29yaw0KPj4gcXVldWUgc2hvdWxkIHNob3VsZCBiZSBPSy4uDQo+IFllcywg
aXQgY2FsbHMgaXQgdGhyb3VnaCBhIHdvcmsgcXVldWUuICBJIGd1ZXNzIHRoYXQgaXMgZmluZSBi
ZWNhdXNlDQo+IGl0IG5lZWRzIHRvIHRha2UgdGhlIGxvY2sgYWdhaW4uDQo+DQo+PiBUaG91Z2gg
dmVyeSBzdHJhbmdlIHRoYXQgYW1kZ3B1IG9ubHkgZGVzdHJveXMgdGhlIG1pcnJvciB2aWEgcmVs
ZWFzZSwNCj4+IHRoYXQgY2Fubm90IGJlIHJpZ2h0Lg0KPiBBcyBzYWlkIHRoZSB3aG9sZSB0aGlu
Z3MgbG9va3MgcmF0aGVyIG9kZCB0byBtZS4NCg0KVGhpcyBjb2RlIGlzIGRlcml2ZWQgZnJvbSBv
dXIgb2xkIE1NVSBub3RpZmllciBjb2RlLiBCZWZvcmUgSE1NIHdlIHVzZWQgDQp0byByZWdpc3Rl
ciBhIHNpbmdsZSBNTVUgbm90aWZpZXIgcGVyIG1tX3N0cnVjdCBhbmQgbG9vayB1cCB2aXJ0dWFs
IA0KYWRkcmVzcyByYW5nZXMgdGhhdCBoYWQgYmVlbiByZWdpc3RlcmVkIGZvciBtaXJyb3Jpbmcg
dmlhIGRyaXZlciBBUEkgDQpjYWxscy4gVGhlIGlkZWEgd2FzIHRvIHJldXNlIGEgc2luZ2xlIE1N
VSBub3RpZmllciBmb3IgdGhlIGxpZmUgdGltZSBvZiANCnRoZSBwcm9jZXNzLiBJdCB3b3VsZCBy
ZW1haW4gcmVnaXN0ZXJlZCB1bnRpbCB3ZSBnb3QgYSBub3RpZmllcl9yZWxlYXNlLg0KDQpobW1f
bWlycm9yIHRvb2sgdGhlIHBsYWNlIG9mIHRoYXQgd2hlbiB3ZSBjb252ZXJ0ZWQgdGhlIGNvZGUg
dG8gSE1NLg0KDQpJIHN1cHBvc2Ugd2UgY291bGQgZGVzdHJveSB0aGUgbWlycm9yIGVhcmxpZXIs
IHdoZW4gd2UgaGF2ZSBubyBtb3JlIA0KcmVnaXN0ZXJlZCB2aXJ0dWFsIGFkZHJlc3MgcmFuZ2Vz
LCBhbmQgY3JlYXRlIGEgbmV3IG9uZSBpZiBuZWVkZWQgbGF0ZXIuDQoNClJlZ2FyZHMsDQogwqAg
RmVsaXgNCg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
