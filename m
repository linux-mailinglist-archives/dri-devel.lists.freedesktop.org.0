Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F48BDA71
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 11:05:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A7989FF7;
	Wed, 25 Sep 2019 09:04:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680084.outbound.protection.outlook.com [40.107.68.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B033C89FF7;
 Wed, 25 Sep 2019 09:04:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KnPXixXbykSTalqizCOFm5KVfdHzNQ//+SzcQ6eJYaMzpdeJ6UyEHB/aTHOZUS7S2m8+PizEz7hqeRlOJlWa0MBw1cQuyiZeFCDUxCqP0KRlT5+SWBQ1ch7gxuiZFpK/16ChFzv9SXptfiwIAvz6yuqf7r1dCUJ53Nai7tc6+jOHhtXDtqX1w+oqHmR6RFewwJBYQ4cYMbvZucuO0tAw2C0ZHaoq3IO3yGIbzYJTC18yjwyag1C0qBI6wW6/mC3SelfhaEoD1rQqStP0Go9NtLRk1w6J2E9Sje34ZWSMbjr8cCUBmvBWjXO0fnCnxgl2TU4fMMBZN66kDzuNyVI0DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+WgbD5+LCICU9j1ab2sbpJEqnHAHAugOwTaRlCeW3O8=;
 b=bPjA9NEMG8VuK3T7JT2RGRb4fykHBbbVuFH7Vr4zbVrsopJWV6uC0AIpNmDeP8iRfpEbEYuHzNz2JXHitGyIHaOIkZ3u6N7SFy/25SfqkISGkSY0qQ2xLsB54ppq8E2mSoHHWxxNvRAoGkNYD87ypBxXOinTW+6zKU/x5zXpEXPD9yIh03uaVquLKc1wwt4nzsixsMMd359ojd3uM0o1MFV39q+CuCgfyNX+yS24TcCzn61Iuo57D7+iVJyGjUgRxp/9CxXVb4rLBKXc5RSXDh3KQCYV2r2/+VWDoCEloyJvJFM9ku6kdDChizpOnJu0MqexrUo37bTd7987COMheg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1577.namprd12.prod.outlook.com (10.172.39.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.26; Wed, 25 Sep 2019 09:04:57 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc%8]) with mapi id 15.20.2284.023; Wed, 25 Sep 2019
 09:04:57 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Dave Airlie <airlied@gmail.com>, Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 2/2] drm/amdgpu: Add modeset module option
Thread-Topic: [PATCH 2/2] drm/amdgpu: Add modeset module option
Thread-Index: AQHTyGgEYyQ5qTPgKEGFa6cM4PjL86c/X8cAgAAP+oA=
Date: Wed, 25 Sep 2019 09:04:56 +0000
Message-ID: <72bba8fc-7f1c-35b4-cf62-f2b598922c0f@amd.com>
References: <20180330204512.16863-1-tiwai@suse.de>
 <20180330204512.16863-2-tiwai@suse.de>
 <CAPM=9txseCB_0msp2_WoOAoi0iCRCoLsFgcqppiTyw+tD1Qe8A@mail.gmail.com>
In-Reply-To: <CAPM=9txseCB_0msp2_WoOAoi0iCRCoLsFgcqppiTyw+tD1Qe8A@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM4PR0202CA0010.eurprd02.prod.outlook.com
 (2603:10a6:200:89::20) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b72e931b-75ee-494c-cb55-08d741976fb4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1577; 
x-ms-traffictypediagnostic: DM5PR12MB1577:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1577AEAE53D78AE7DFC4B91883870@DM5PR12MB1577.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01713B2841
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(376002)(39860400002)(396003)(346002)(189003)(199004)(186003)(6486002)(14454004)(5660300002)(4326008)(46003)(6436002)(229853002)(6246003)(52116002)(86362001)(476003)(31696002)(99286004)(102836004)(2616005)(76176011)(6506007)(478600001)(6512007)(11346002)(386003)(25786009)(446003)(6116002)(8936002)(31686004)(81166006)(81156014)(2906002)(8676002)(64756008)(66556008)(66476007)(71200400001)(66946007)(66446008)(486006)(65956001)(65806001)(71190400001)(305945005)(7736002)(316002)(58126008)(36756003)(110136005)(256004)(54906003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1577;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: eC8/5bx4ooBHmYWb9fwNH0D/QxN6fjnYeyULb2eg1kRMZMPdu6u7He4yV0774ts7pdl1JptJtkHuU/8ob5AvAjOhCfijjTJHmP8wemXiY9Am6cQmIeAfvukQPctfvlQ/pXo8GpsQToAeSU/zmmog8qbjk4gMqDtfY1c/66d1Jz8xUPjcieBzyA44iC09YzsnPJf5SsBqe4Yc4c/5+XRmpiZy9GCMJ80Sh3glefMUDt1pQ+Wy10/wfrp2Pz/3hAa8o96YtlHInix127/sRXApWcSvo4XWJrz83eA40mAlZkwns3sYoQ0aynz/RJ/5Rrl01hAhZAltfINoUv2An+PIfklxID5bNQS9uUVEMckJWWcRP56QQQ5J+u3ykJuIM2xxpDQyd7kguE2bhPvfWb0jF1hlWi0ZnjU4D6LXuEiVu0I=
Content-ID: <8070E7DF261B2B449343A6230665B91E@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b72e931b-75ee-494c-cb55-08d741976fb4
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2019 09:04:56.9269 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9YXASdo6sscSHDrnFfCEc2p8rjFdsbZgkj0MhpAQRQXjnn3CVB2d/xbnZ2CEE3jp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1577
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+WgbD5+LCICU9j1ab2sbpJEqnHAHAugOwTaRlCeW3O8=;
 b=I6I1aVJFAS6ihHBN5Z8E9Uocd/NS6FY7KWBrhU2rRaE58KRzcmWl+qGu7/CUKJNFwkZapki7Mcx2lnFvbbIl8OYm1oSGVmxZWxf1VvO00orItsJr9VSqmbqcNe4fQcdWmsdjhteQPbQ7oW2tBphVwizjbEQ5u1+lFOslvBY4aFA=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 David Airlie <airlied@linux.ie>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjUuMDkuMTkgdW0gMTA6MDcgc2NocmllYiBEYXZlIEFpcmxpZToNCj4gT24gU2F0LCAzMSBN
YXIgMjAxOCBhdCAwNjo0NSwgVGFrYXNoaSBJd2FpIDx0aXdhaUBzdXNlLmRlPiB3cm90ZToNCj4+
IGFtZGdwdSBkcml2ZXIgbGFja3Mgb2YgbW9kZXNldCBtb2R1bGUgb3B0aW9uIG90aGVyIGRybSBk
cml2ZXJzIHByb3ZpZGUNCj4+IGZvciBlbmZvcmNpbmcgb3IgZGlzYWJsaW5nIHRoZSBkcml2ZXIg
bG9hZC4gIEludGVyZXN0aW5nbHksIHRoZQ0KPj4gYW1kZ3B1X21vZGUgdmFyaWFibGUgZGVjbGFy
YXRpb24gaXMgYWxyZWFkeSBmb3VuZCBpbiB0aGUgaGVhZGVyIGZpbGUsDQo+PiBidXQgdGhlIGFj
dHVhbCBpbXBsZW1lbnRhdGlvbiBzZWVtcyB0byBoYXZlIGJlZW4gZm9yZ290dGVuLg0KPj4NCj4+
IFRoaXMgcGF0Y2ggYWRkcyB0aGUgbWlzc2luZyBwaWVjZS4NCj4gSSdkIGxpa2UgdG8gbGFuZCB0
aGlzIHBhdGNoLCBJIHJlYWxpc2UgcGVvcGxlIGhhdmUgTkFLZWQgaXQgYnV0IGZvcg0KPiBjb25z
aXN0ZW5jeSBhY3Jvc3MgZHJpdmVycyBJJ20gZ29pbmcgdG8gYXNrIHdlIGxhbmQgaXQgb3Igc29t
ZXRoaW5nDQo+IGxpa2UgaXQuDQo+DQo+IFRoZSBtYWluIHVzZSBjYXNlIGZvciB0aGlzIGlzIGFj
dHVhbGx5IHdoZXJlIHlvdSBoYXZlIGFtZGdwdSBjcmFzaGVzDQo+IG9uIGxvYWQsIGFuZCB5b3Ug
d2FudCB0byBkZWJ1ZyB0aGVtLCBwZW9wbGUgYm9vdCB3aXRoIG5vbW9kZXNldCBhbmQNCj4gdGhl
biBtb2Rwcm9iZSBhbWRncHUgbW9kZXNldD0xIHRvIGdldCB0aGUgY3Jhc2ggaW4gYSBydW5uaW5n
IHN5c3RlbS4NCj4gVGhpcyB3b3JrcyBmb3IgbnVtZXJvdXMgb3RoZXIgZHJpdmVycywgSSdtIG5v
dCBzdXJlIHdoeSBhbWRncHUgbmVlZHMNCj4gdG8gYmUgdGhlIG9kZCBvbmUgb3V0Lg0KDQpCZWNh
dXNlIHRoaXMgaXMgZXNzZW50aWFsbHkgdGhlIHdyb25nIGFwcHJvYWNoLg0KDQpUaGUgY29ycmVj
dCB3YXkgdG8gcHJldmVudCBhIG1vZHVsZSBmcm9tIGF1dG9tYXRpY2FsbHkgbG9hZGluZyBpcyB0
byBhZGQgDQptb2Rwcm9iZS5ibGFja2xpc3Q9JG5hbWUgdG8gdGhlIGtlcm5lbCBjb21tYW5kIGxp
bmUuDQoNClRoZSBtb2Rlc2V0IGFuZCBub21vZGVzZXQga2VybmVsIG9wdGlvbnMgd2hlcmUgdXNl
ZCB0byBzd2l0Y2ggYmV0d2VlbiANCktNUyBhbmQgVU1TIGFuZCBub3QgdG8gZGlzYWJsZSBkcml2
ZXIgbG9hZC4NCg0KV2Ugc2hvdWxkIGhhdmUgcmVtb3ZlZCB0aG9zZSBvcHRpb25zIHdpdGggdGhl
IHJlbW92YWwgb2YgVU1TIG9yIA0Kb3RoZXJ3aXNlIGl0IGJlY29tZXMganVzdCBhbm90aGVyIGFu
Y2llbnQgY3J1ZnQgd2UgbmVlZCB0byBjYXJyeSBmb3J3YXJkIA0KaW4gcG90ZW50aWFsbHkgYWxs
IGRyaXZlcnMuDQoNClJlZ2FyZHMsDQpDaHJpc3RpYW4uDQoNCj4NCj4gUmV2aWV3ZWQtYnk6IERh
dmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+DQo+DQo+IERhdmUuDQoNCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
