Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7835BB4CB9
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 13:22:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A4B76EBCF;
	Tue, 17 Sep 2019 11:22:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800043.outbound.protection.outlook.com [40.107.80.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1568B6EBCF
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 11:22:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WOFFla+M8Rhq1vZbYU/EQL+7GPJs+EnphPshzR7pF2iqgpWKCd0TKDDvGEifFsiQiFgc53qlGvLDEbTzJzyuuzJn5ZdMh8oV7w8b1+hlBj96AOnSerc1/gaJnsV2xLpKekG9IbOpx/eYOrjeF3r5hdnOclHJrHYleJ3+9lDCCia+fA/Q5mg9zedpmLl9TsIqnQuiS4jVM5NKtIcWgAkmvjpJZi2alIn+0PcQ4z2hWwzAxyeJ/1J3sr1tE6y4pjOJbrJ+tQgvBSHrrs4rSjwuuvcGEhBH3xbfs3hEyydBNsgsIKLSNPoXqXQEgGLA1IqA0pSxcBqyHp6u+e99TflBWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WkeFA31HAvpvKC8umA+WVOXMySRmHSU+0+kali0P2CU=;
 b=RdbO7jEo18WVuW+XayXt+Kmvj7UrulapLzkk8KcddHMOLzw6IoXYzrDuHtmPALMXtWZI+DhQud4y1Dh00HiU/rmq4blgI+b6t/LQ+brQTQJO2Q0Cds5jTvPBlbXpRYHzkV1QVQ9j/8qafMruHLkCZd7jx1GyjEGi94APyNTtvp613pM6vugW7l3g1G2yuhURLbeWvybDbpwyNZf/ae+F2GNlAMFt5+c4tlgdsPZyY5qdOhIa04U6YDdE90BXcg1MDowFTNgoMSgWf2VHlfmaMortsVkva3jwcEx74obkbD/o3r2NCa4ScfH+UQngPnDK/AN2578biZmr0Bo8NFr3pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1404.namprd12.prod.outlook.com (10.168.238.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.24; Tue, 17 Sep 2019 11:22:35 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc%8]) with mapi id 15.20.2263.023; Tue, 17 Sep 2019
 11:22:35 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Gerd Hoffmann <kraxel@redhat.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2 07/11] drm/ttm: drop VM_DONTDUMP
Thread-Topic: [PATCH v2 07/11] drm/ttm: drop VM_DONTDUMP
Thread-Index: AQHVbTmsx2EByWAHbUyFT5pF6Z8Ra6cvuewA
Date: Tue, 17 Sep 2019 11:22:35 +0000
Message-ID: <c29222f7-2737-2416-62c9-eafd4d608ded@amd.com>
References: <20190917092404.9982-1-kraxel@redhat.com>
 <20190917092404.9982-8-kraxel@redhat.com>
In-Reply-To: <20190917092404.9982-8-kraxel@redhat.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0180.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1c::24) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 24e9c727-1787-4cba-a1e3-08d73b6156dd
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM5PR12MB1404; 
x-ms-traffictypediagnostic: DM5PR12MB1404:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB140453F2D1E676440CED63F6838F0@DM5PR12MB1404.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 01630974C0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(366004)(346002)(39860400002)(136003)(189003)(199004)(5660300002)(31696002)(71190400001)(4326008)(6436002)(6486002)(6512007)(66556008)(31686004)(2501003)(2616005)(14444005)(256004)(476003)(186003)(66446008)(446003)(11346002)(71200400001)(65806001)(65956001)(8676002)(81156014)(81166006)(478600001)(229853002)(46003)(8936002)(7736002)(14454004)(99286004)(36756003)(316002)(25786009)(486006)(52116002)(58126008)(86362001)(6246003)(305945005)(66946007)(64756008)(66476007)(6116002)(110136005)(54906003)(102836004)(76176011)(2906002)(386003)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1404;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vynQ+4/Ti0Y5PU9M0MxsBcQjuLT3IvdeIexi488U0DfuxrzrBbl0osooYz13nAL5Dw6FzIJH+zTIW+F/DgfBhrhNYXfqqFJFFkLHmcDMbOvydpjMwWsvjdd6PdgC2mzzWXNZub8XDTz1/jN/TtA4Hp3mPPBBCFDs1n2gJ53k/s8VeOk9uvAFLWKqbMiolLSnqTF5lCLoTMcmhE/uM6abZu7ktAck5EkA6DF8U/A2ecZI6qMCul9CHovxAIJ2w62Dy9kFtdDiipc1zK8X9KWKiLcx5xLAwpYMlrVHtth26kZDLobhqT9O9a3u/lAkzUhyehgx3Jwj71EiWe/Ss6qMLPqun6bfQeFWRxTXHycCNPr6izs/eCwfUGlyI+AEfiKyLmVZ30Cn4JDrYouubzaqw7lf/JTz9WNcf1oNyD9UEkM=
Content-ID: <2AD654A6AD6845418CACA25ACCA8A252@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24e9c727-1787-4cba-a1e3-08d73b6156dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2019 11:22:35.5904 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /Tr/28H9iAQH6DgG0FxJWuvEaNs+gEKHOFPPNKB2RpmLvYnPZ57rLJc8DFf940M6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1404
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WkeFA31HAvpvKC8umA+WVOXMySRmHSU+0+kali0P2CU=;
 b=jAcJG8Hw832BY6MOBSgxfCSngavDCFIAI4cVivHnDPgwS3wgMkn+YDmVhEQ68x+3QpFPFCqmXsuMqudwmK/HBj3Hi92qNBdBX+1eq4HmNQrjLxp+obJYiA6V7lvd7rGKAwPlA6YiPYSVyJkDPrnd+pbmdcieXWGJZyuSZKt53ys=
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>, "Huang, Ray" <Ray.Huang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTcuMDkuMTkgdW0gMTE6MjQgc2NocmllYiBHZXJkIEhvZmZtYW5uOg0KPiBOb3Qgb2J2aW91
cyB3aHkgdGhpcyBpcyBuZWVkZWQuICBBY2NvcmRpbmcgdG8gRGVuaWVsIFZldHRlciB0aGlzIGlz
IG1vc3QNCj4gbGlrZWx5IGEgaGlzdG9yaWMgYXJ0ZWZhY3QgZGF0aW5nIGJhY2sgdG8gdGhlIGRh
eXMgd2hlcmUgZHJtIGRyaXZlcnMNCj4gZXhwb3NlZCBoYXJkd2FyZSByZWdpc3RlcnMgYXMgbW1h
cCdhYmxlIGdlbSBvYmplY3RzLCB0byBhdm9pZCBkdW1waW5nDQo+IHRvdWNoaW5nIHRob3NlIHJl
Z2lzdGVycy4NCg0KQ2xlYXJseSBhIE5BSy4NCg0KV2Ugc3RpbGwgaGF2ZSB0aGF0IGFuZCByZWFs
bHkgZG9uJ3Qgd2FudCB0byB0cnkgZHVtcGluZyBhbnkgQ1BVIA0KaW5hY2Nlc3NpYmxlIFZSQU0g
Y29udGVudCBldmVuIGlmIGl0IGlzIG1hcHBlZCBpbnRvIHRoZSBhZGRyZXNzIHNwYWNlIA0Kc29t
ZXdoZXJlLg0KDQpSZWdhcmRzLA0KQ2hyaXN0aWFuLg0KDQo+DQo+IFNpZ25lZC1vZmYtYnk6IEdl
cmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9k
cm0vdHRtL3R0bV9ib192bS5jIHwgMiArLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0
bS90dG1fYm9fdm0uYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMNCj4gaW5kZXgg
N2MwZTg1YzEwZTBlLi40ZGM3N2E2NmFhZjYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS90dG0vdHRtX2JvX3ZtLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0u
Yw0KPiBAQCAtNDQ1LDcgKzQ0NSw3IEBAIHZvaWQgdHRtX2JvX21tYXBfdm1hX3NldHVwKHN0cnVj
dCB0dG1fYnVmZmVyX29iamVjdCAqYm8sIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqDQo+ICAgCSAq
IFZNX01JWEVETUFQIG9uIGFsbCBtYXBwaW5ncy4gU2VlIGZyZWVkZXNrdG9wLm9yZyBidWcgIzc1
NzE5DQo+ICAgCSAqLw0KPiAgIAl2bWEtPnZtX2ZsYWdzIHw9IFZNX01JWEVETUFQOw0KPiAtCXZt
YS0+dm1fZmxhZ3MgfD0gVk1fSU8gfCBWTV9ET05URVhQQU5EIHwgVk1fRE9OVERVTVA7DQo+ICsJ
dm1hLT52bV9mbGFncyB8PSBWTV9JTyB8IFZNX0RPTlRFWFBBTkQ7DQo+ICAgfQ0KPiAgIEVYUE9S
VF9TWU1CT0wodHRtX2JvX21tYXBfdm1hX3NldHVwKTsNCj4gICANCg0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
