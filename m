Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C448CC18
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 08:51:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 502F56E1D6;
	Wed, 14 Aug 2019 06:51:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720059.outbound.protection.outlook.com [40.107.72.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A87A06E1D6;
 Wed, 14 Aug 2019 06:51:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K08PLPjWW6OUm5IE3OzFDzVB7BICK62hfpC+tNxR4V/voU3XgzSalPXEhwm3f4B8OvcC57RAkLtR6OgSMkUnCnF0FA7+Xl4ormdQUXceay9kTKABIBn4ZDCJ8ESdNZRTzBvLETcPYLRc1baoGvii4R5hRe3t8pXFThE+MhdnVurbX8ew0OQ6XcjNpY7vaepkLzuEiqGV/1gf6LsAuDgCw7e8CbkFAN5XbTl28xLAmS5cXsVj2IoaS5xUiWCsdwU8kOB1+BaHi679Pd7blLv8TZH6gQC3jiKe/nCf3ki1aHF1nZlv2lDrT/QHkIlE/yKz0Rl8d4OBS1dZ8Qf7B6kyTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bQLbhLpF3pFqnMMVnZ5BzcnSwsoqkvTkvcowJf+JhQ0=;
 b=NI0X+41CwxT375XwMHm/j3UkCNhMNCmhhTjk4YTgJfYjCDolejjrKdohz2m5a8iYWQI2/VdtT427UqLtumoeX+aUlDfRpWk7lqzjL9frEvg7HpRfAHSDiuoDPvwtUD2OKyWKSdlvUDJ07rluWCNBWZzkZ7OlOxtzsdBYZQAWGj1CWN37PCtj/7yH6VpRf6+4rEheF/1LEKOV5T7j7b4YJiQV5pKHpcDmdb9na3dyJnJG79IazqfwvGnnzxxYYUtBN9xI5HjycVjevfjhsqLwnghd+Aie7kqfPTI5PPmvUzW4lrn1AJvo6FS/+ME+WXTPAQABa/4+LyNkT4bfsgJEYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1164.namprd12.prod.outlook.com (10.168.238.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.21; Wed, 14 Aug 2019 06:51:46 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3%5]) with mapi id 15.20.2157.022; Wed, 14 Aug 2019
 06:51:46 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>, Dave Airlie <airlied@linux.ie>, Jani
 Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: linux-next: manual merge of the drm-misc tree with the drm and
 drm-intel trees
Thread-Topic: linux-next: manual merge of the drm-misc tree with the drm and
 drm-intel trees
Thread-Index: AQHVUkugxUnkwyv7mk21q1VjAp+d+6b6NNkA
Date: Wed, 14 Aug 2019 06:51:46 +0000
Message-ID: <3878b698-e49e-0e62-0db6-2a06bda0c92d@amd.com>
References: <20190814125433.20147fb7@canb.auug.org.au>
In-Reply-To: <20190814125433.20147fb7@canb.auug.org.au>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR2P264CA0038.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::26) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6b4a8e65-d907-407e-46b7-08d72083df5e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1164; 
x-ms-traffictypediagnostic: DM5PR12MB1164:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1164FBAC20E59F636D0E686B83AD0@DM5PR12MB1164.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01294F875B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(189003)(199004)(53754006)(8676002)(65806001)(71190400001)(110136005)(99286004)(86362001)(2906002)(54906003)(65956001)(25786009)(31686004)(71200400001)(66574012)(81166006)(81156014)(8936002)(6436002)(229853002)(6246003)(6486002)(6116002)(478600001)(6512007)(31696002)(53936002)(7416002)(14454004)(66556008)(64756008)(7736002)(66446008)(76176011)(2616005)(102836004)(11346002)(186003)(46003)(446003)(6506007)(486006)(316002)(256004)(14444005)(305945005)(58126008)(53546011)(66946007)(65826007)(66476007)(64126003)(386003)(5660300002)(4326008)(52116002)(476003)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1164;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: z9EQZBpFgyaoA0m6Zn8g1RaZIRdxqxKx9S+DIArKO9FpVrjWXU0f5NA1jBveXqgs1SmW5CykAgNvrDmtmWzxTuuM5u/jyz6/THmKI+HmL27XMzBxM3n10LAZ/N0nbVWqNbLCOdBET5UWxRsyuy4zkey+od8LcNftlHGi4kQ1fWUg5lQWPktzMRha66AAuN4xaQP9YpI2VzsTPy5vCL+X63uhEZZBANxOu86MC2bvFrMWI+MbZ5AOJW6EFkP9MaoWDvkOwQzmsbSbbzU2pY1rQ7/f3xGklRFTbrqfpX/njnE06Y8JFquVvqRHh/fHW7Wug2UDjVlXb7+sRMRf9jINVpQ0jsF1aSM4sX5vhE6qWJbfkFTGV4IFD8AmbJx+fAX31RYxdlnanNoNvMZhXqsNKHo28TfVPdUiIiO15JrD/cQ=
Content-ID: <653DF9D14AD3B24F85F0C52A2ACA963D@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b4a8e65-d907-407e-46b7-08d72083df5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2019 06:51:46.1984 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eh9yeXAT+EP0+mEil1rU5+K/dooyutrRH9C3JRtp7UC9FlAxm2FDOZr9No+6eKvo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1164
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bQLbhLpF3pFqnMMVnZ5BzcnSwsoqkvTkvcowJf+JhQ0=;
 b=Bk60yPdEf4z8u+M95MBQAOvTn4QE4Q/6HiuO3h/UhHAAhO8lcaiE2KBackVL74zzsUJzQGQjzwO247zxcpdKgXt2Od0uPlX43DpKUCuko6vpmmUVMJNQpvMit4K3QxT7W40SHvlIgWa3bB3U/s40bDhNoGC4ASgqQYZkBiGZMt8=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTQuMDguMTkgdW0gMDQ6NTQgc2NocmllYiBTdGVwaGVuIFJvdGh3ZWxsOgo+IEhpIGFsbCwK
Pgo+IFRvZGF5J3MgbGludXgtbmV4dCBtZXJnZSBvZiB0aGUgZHJtLW1pc2MgdHJlZSBnb3QgYSBj
b25mbGljdCBpbjoKPgo+ICAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmpl
Y3QuYwo+ICAgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfdm1hLmMKPiAgICBkcml2ZXJzL2dw
dS9kcm0vaTkxNS9pOTE1X2dlbV9iYXRjaF9wb29sLmMKPiAgICBkcml2ZXJzL2dwdS9kcm0vaTkx
NS9nZW0vaTkxNV9nZW1fb2JqZWN0LmMKPiAgICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRl
bF9lbmdpbmVfcG9vbC5jCj4KPiBiZXR3ZWVuIGNvbW1pdHM6Cj4KPiAgICBhOTM2MTVmOTAwYmQg
KCJkcm0vaTkxNTogVGhyb3cgYXdheSB0aGUgYWN0aXZlIG9iamVjdCByZXRpcmVtZW50IGNvbXBs
ZXhpdHkiKQo+ICAgIDEyYzI1NWI1ZGFkMSAoImRybS9pOTE1OiBQcm92aWRlIGFuIGk5MTVfYWN0
aXZlLmFjcXVpcmUgY2FsbGJhY2siKQo+ICAgIGNkMmE0ZWFmOGM3OSAoImRybS9pOTE1OiBSZXBv
cnQgcmVzdl9vYmogYWxsb2NhdGlvbiBmYWlsdXJlIikKPiAgICBiNDBkNzM3ODRmZmMgKCJkcm0v
aTkxNTogUmVwbGFjZSBzdHJ1Y3RfbXV0ZXggZm9yIGJhdGNoIHBvb2wgc2VyaWFsaXNhdGlvbiIp
Cj4gICAgYWIyZjdhNWMxOGI1ICgiZHJtL2FtZGdwdTogSW1wbGVtZW50IFZSQU0gd2lwZSBvbiBy
ZWxlYXNlIikKPiAgICAwYzE1OWZmZWY2MjggKCJkcm0vaTkxNS9nZW06IERlZmVyIG9iai0+YmFz
ZS5yZXN2IGZpbmkgdW50aWwgUkNVIGNhbGxiYWNrIikKPgo+IGZyb20gdGhlIGRybSBhbmQgZHJt
LWludGVsIHRyZWVzIGFuZCBjb21taXQ6Cj4KPiAgICA1Mjc5MWVlZWMxZDkgKCJkbWEtYnVmOiBy
ZW5hbWUgcmVzZXJ2YXRpb25fb2JqZWN0IHRvIGRtYV9yZXN2IikKPgo+IGZyb20gdGhlIGRybS1t
aXNjIHRyZWUuCj4KPiBJIGZpeGVkIGl0IHVwIChzZWUgYmVsb3cgYW5kIEkgYWRkZWQgdGhlIGZv
bGxvd2luZyBtZXJnZSBmaXggcGF0Y2gpIGFuZAo+IGNhbiBjYXJyeSB0aGUgZml4IGFzIG5lY2Vz
c2FyeS4gVGhpcyBpcyBub3cgZml4ZWQgYXMgZmFyIGFzIGxpbnV4LW5leHQKPiBpcyBjb25jZXJu
ZWQsIGJ1dCBhbnkgbm9uIHRyaXZpYWwgY29uZmxpY3RzIHNob3VsZCBiZSBtZW50aW9uZWQgdG8g
eW91cgo+IHVwc3RyZWFtIG1haW50YWluZXIgd2hlbiB5b3VyIHRyZWUgaXMgc3VibWl0dGVkIGZv
ciBtZXJnaW5nLiAgWW91IG1heQo+IGFsc28gd2FudCB0byBjb25zaWRlciBjb29wZXJhdGluZyB3
aXRoIHRoZSBtYWludGFpbmVyIG9mIHRoZQo+IGNvbmZsaWN0aW5nIHRyZWUgdG8gbWluaW1pc2Ug
YW55IHBhcnRpY3VsYXJseSBjb21wbGV4IGNvbmZsaWN0cy4KPgo+IEZyb206IFN0ZXBoZW4gUm90
aHdlbGwgPHNmckBjYW5iLmF1dWcub3JnLmF1Pgo+IERhdGU6IFdlZCwgMTQgQXVnIDIwMTkgMTI6
NDg6MzkgKzEwMDAKPiBTdWJqZWN0OiBbUEFUQ0hdIGRybTogZml4IHVwIGZhbGxvdXQgZnJvbSAi
ZG1hLWJ1ZjogcmVuYW1lIHJlc2VydmF0aW9uX29iamVjdCB0byBkbWFfcmVzdiIKPgo+IFNpZ25l
ZC1vZmYtYnk6IFN0ZXBoZW4gUm90aHdlbGwgPHNmckBjYW5iLmF1dWcub3JnLmF1PgoKWWVhaCwg
aXQgd2FzIHRvIGJlIGV4cGVjdGVkIHRoYXQgdGhpcyBjYXVzZXMgYSBiaXQgdHJvdWJsZS4KClJl
dmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cgo+
IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jICB8IDQg
KystLQo+ICAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX29iamVjdC5jICB8IDIg
Ky0KPiAgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2VuZ2luZV9wb29sLmMgfCA4ICsr
KystLS0tCj4gICAzIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMo
LSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2Jq
ZWN0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmMKPiBpbmRl
eCBkZmQ0YWE2OGM4MDYuLjZlYmU2MWUxNGYyOSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfb2JqZWN0LmMKPiBAQCAtMTI0Miw3ICsxMjQyLDcgQEAgdm9pZCBhbWRn
cHVfYm9fcmVsZWFzZV9ub3RpZnkoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibykKPiAgIAkg
ICAgIShhYm8tPmZsYWdzICYgQU1ER1BVX0dFTV9DUkVBVEVfVlJBTV9XSVBFX09OX1JFTEVBU0Up
KQo+ICAgCQlyZXR1cm47Cj4gICAKPiAtCXJlc2VydmF0aW9uX29iamVjdF9sb2NrKGJvLT5iYXNl
LnJlc3YsIE5VTEwpOwo+ICsJZG1hX3Jlc3ZfbG9jayhiby0+YmFzZS5yZXN2LCBOVUxMKTsKPiAg
IAo+ICAgCXIgPSBhbWRncHVfZmlsbF9idWZmZXIoYWJvLCBBTURHUFVfUE9JU09OLCBiby0+YmFz
ZS5yZXN2LCAmZmVuY2UpOwo+ICAgCWlmICghV0FSTl9PTihyKSkgewo+IEBAIC0xMjUwLDcgKzEy
NTAsNyBAQCB2b2lkIGFtZGdwdV9ib19yZWxlYXNlX25vdGlmeShzdHJ1Y3QgdHRtX2J1ZmZlcl9v
YmplY3QgKmJvKQo+ICAgCQlkbWFfZmVuY2VfcHV0KGZlbmNlKTsKPiAgIAl9Cj4gICAKPiAtCXJl
c2VydmF0aW9uX29iamVjdF91bmxvY2soYm8tPmJhc2UucmVzdik7Cj4gKwlkbWFfcmVzdl91bmxv
Y2soYm8tPmJhc2UucmVzdik7Cj4gICB9Cj4gICAKPiAgIC8qKgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fb2JqZWN0LmMgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9nZW0vaTkxNV9nZW1fb2JqZWN0LmMKPiBpbmRleCAzOTI5YzNhNmIyODEuLjY3ZGM2MWUw
MmM5ZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fb2Jq
ZWN0LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fb2JqZWN0LmMK
PiBAQCAtMTU0LDcgKzE1NCw3IEBAIHN0YXRpYyB2b2lkIF9faTkxNV9nZW1fZnJlZV9vYmplY3Rf
cmN1KHN0cnVjdCByY3VfaGVhZCAqaGVhZCkKPiAgIAkJY29udGFpbmVyX29mKGhlYWQsIHR5cGVv
Zigqb2JqKSwgcmN1KTsKPiAgIAlzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqaTkxNSA9IHRvX2k5
MTUob2JqLT5iYXNlLmRldik7Cj4gICAKPiAtCXJlc2VydmF0aW9uX29iamVjdF9maW5pKCZvYmot
PmJhc2UuX3Jlc3YpOwo+ICsJZG1hX3Jlc3ZfZmluaSgmb2JqLT5iYXNlLl9yZXN2KTsKPiAgIAlp
OTE1X2dlbV9vYmplY3RfZnJlZShvYmopOwo+ICAgCj4gICAJR0VNX0JVR19PTighYXRvbWljX3Jl
YWQoJmk5MTUtPm1tLmZyZWVfY291bnQpKTsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3QvaW50ZWxfZW5naW5lX3Bvb2wuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2lu
dGVsX2VuZ2luZV9wb29sLmMKPiBpbmRleCAwM2Q5MGI0OTU4NGEuLjRjZDU0YzU2OTkxMSAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9lbmdpbmVfcG9vbC5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfZW5naW5lX3Bvb2wuYwo+IEBAIC00
MywxMiArNDMsMTIgQEAgc3RhdGljIGludCBwb29sX2FjdGl2ZShzdHJ1Y3QgaTkxNV9hY3RpdmUg
KnJlZikKPiAgIHsKPiAgIAlzdHJ1Y3QgaW50ZWxfZW5naW5lX3Bvb2xfbm9kZSAqbm9kZSA9Cj4g
ICAJCWNvbnRhaW5lcl9vZihyZWYsIHR5cGVvZigqbm9kZSksIGFjdGl2ZSk7Cj4gLQlzdHJ1Y3Qg
cmVzZXJ2YXRpb25fb2JqZWN0ICpyZXN2ID0gbm9kZS0+b2JqLT5iYXNlLnJlc3Y7Cj4gKwlzdHJ1
Y3QgZG1hX3Jlc3YgKnJlc3YgPSBub2RlLT5vYmotPmJhc2UucmVzdjsKPiAgIAlpbnQgZXJyOwo+
ICAgCj4gLQlpZiAocmVzZXJ2YXRpb25fb2JqZWN0X3RyeWxvY2socmVzdikpIHsKPiAtCQlyZXNl
cnZhdGlvbl9vYmplY3RfYWRkX2V4Y2xfZmVuY2UocmVzdiwgTlVMTCk7Cj4gLQkJcmVzZXJ2YXRp
b25fb2JqZWN0X3VubG9jayhyZXN2KTsKPiArCWlmIChkbWFfcmVzdl90cnlsb2NrKHJlc3YpKSB7
Cj4gKwkJZG1hX3Jlc3ZfYWRkX2V4Y2xfZmVuY2UocmVzdiwgTlVMTCk7Cj4gKwkJZG1hX3Jlc3Zf
dW5sb2NrKHJlc3YpOwo+ICAgCX0KPiAgIAo+ICAgCWVyciA9IGk5MTVfZ2VtX29iamVjdF9waW5f
cGFnZXMobm9kZS0+b2JqKTsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
