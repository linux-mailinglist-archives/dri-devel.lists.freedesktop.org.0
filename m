Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A4D102E05
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 22:09:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD4146E3F2;
	Tue, 19 Nov 2019 21:09:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790089.outbound.protection.outlook.com [40.107.79.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6AA56E3F2;
 Tue, 19 Nov 2019 21:09:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NSgc3jH7tBGe7PATq1LiGQZV/eywone20swPFmjGrz+kY+FHbJ8LkWqKQc6ZIJ7KdbWBRzBsU4lUoEmoP0+DhqjTzAM9ttsAgY0NIeeBpkUvbjEw+3DBJuhDp82aOYiZIsL3z9hXMFWOfx0/zngGQYHvtjc1pmgTjBao42e9h6lXoWX6lzy8hD97GJw6hzsoZ7QakgDiDJzQZVMgQ5NY/FWHcYnV1K1o0ZK5NKfgGAAecRwUbFpKa8RMuvmlRPdhOdVJPR1Xc9SarWjGeDGJGcLjmdcENM4awFJ09y0/h3AkJfI6BdrwXMvKJToMGXtkKzX5Up6yRg/gNBpCEjS53A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GzoSK0p81yw+WuOd7ueA6TQRLJF7RG8G/TeOQz7aNWk=;
 b=VvSGz3DsRMu3AAdGMOdy1yZD2p73kRpl9T5zwoXqpptSSPHX3Q6EIPldsEZkIhqDk16/ZMt4dtP7gA06HndkYXJqGTtTWk1JcYeBCwCF5Xjcd6yBXIRqfqmNm43L38R380dObNE/qvxyJUy24g7mKdUhwwy++ZARr1Cu4hRNgtHLT5YBbdBQVwh1wa4uk9u4RcGYB6Fkgrbhvx9yviSa3EytpOpII6CZKcMt03o/DTKSMTNLAe1UA0wx8bZb7hyMbLgLBDZEQD1r7mgklk+YfFdKtKKwSUn+lj2LizsKEhfvcD1SA0NDAjKJ0Ba1AOdDeModuBzhVULRP995eoyKWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB3013.namprd12.prod.outlook.com (20.178.55.219) by
 BYAPR12MB3031.namprd12.prod.outlook.com (20.178.53.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.16; Tue, 19 Nov 2019 21:09:22 +0000
Received: from BYAPR12MB3013.namprd12.prod.outlook.com
 ([fe80::1174:3feb:de01:4fb9]) by BYAPR12MB3013.namprd12.prod.outlook.com
 ([fe80::1174:3feb:de01:4fb9%6]) with mapi id 15.20.2451.031; Tue, 19 Nov 2019
 21:09:22 +0000
Subject: Re: [PATCH] drm/dsc: Return unsigned long on compute offset
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 "Cornij, Nikola" <Nikola.Cornij@amd.com>
References: <20191119144526.31797-1-mikita.lipski@amd.com>
 <20191119145649.GZ1208@intel.com>
 <f7b705a8-9d6a-1db3-e261-a80aca57454a@amd.com>
 <BL0PR12MB24039F7D8CC95CCCC10C3103EE4C0@BL0PR12MB2403.namprd12.prod.outlook.com>
 <20191119171132.GB1208@intel.com>
From: Mikita Lipski <mlipski@amd.com>
Organization: AMD
Message-ID: <2a61d60c-98f9-a5a2-6e7b-dc94df3fc510@amd.com>
Date: Tue, 19 Nov 2019 16:09:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20191119171132.GB1208@intel.com>
Content-Language: en-US
X-ClientProxiedBy: YTXPR0101CA0014.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::27) To BYAPR12MB3013.namprd12.prod.outlook.com
 (2603:10b6:a03:a9::27)
MIME-Version: 1.0
X-Originating-IP: [165.204.55.250]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1ba439b1-1203-4b33-d4c1-08d76d34bfb4
X-MS-TrafficTypeDiagnostic: BYAPR12MB3031:
X-MS-Exchange-PUrlCount: 1
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR12MB303132F7289895765EA2DFF2E44C0@BYAPR12MB3031.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 022649CC2C
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(136003)(39860400002)(346002)(376002)(189003)(199004)(13464003)(76176011)(66476007)(5660300002)(66574012)(229853002)(7736002)(966005)(305945005)(99286004)(6306002)(36756003)(476003)(31686004)(6486002)(6246003)(2870700001)(2616005)(6436002)(6512007)(11346002)(486006)(6636002)(2906002)(478600001)(6666004)(50466002)(14444005)(54906003)(66066001)(65806001)(65956001)(14454004)(47776003)(2486003)(23676004)(36916002)(6116002)(110136005)(3846002)(52116002)(81166006)(81156014)(8676002)(446003)(8936002)(316002)(25786009)(58126008)(53546011)(6506007)(386003)(66556008)(26005)(186003)(4326008)(31696002)(66946007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3031;
 H:BYAPR12MB3013.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MZ8WLQbmEfNhZ/vNJFpe8+BWSmy5Sy2gu5RGwMyZma4VKm2b1kzsdxv1tbxh/IAqZ3lAdY8iFTh9lE+l0wGspMWPTy0MiLLdIInVdBIbxGXughcZ6HJCS3SAuFHF3ObUJsO3EgIjVcHAarySNxAfF3ffGeN1d8Mn2KwtEfwg0dL2E/dnXYDtDke/KTlVp5CP6JDPNqGZsAIdXp8hLXs5+xwL2LfrQz/BbZoIdJsd7wgPGH0KK1uoMMMq1V1/QNgRjLwTfp2DW4fHW6PVj387X0D7Fn0tTlWFhrUSs02XF7585cd+CNkcMiMHnr3nRWUQrhq4f3SFNCqkgyFCyBOG6p3ts/1npSnV7lwQRikTAaigrtBY3u+DicXwsEck96QtHOh7EEavdT+XnAywBx+rFmya2YEHXcedoGvimZ/EpQjNyenHjv3aGuYHBorVvfsYwIZY2ULWKucXn8uRlcczOG58EEDW52b32qMI6EsHKAA=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ba439b1-1203-4b33-d4c1-08d76d34bfb4
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2019 21:09:22.0379 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dFlzR05NdxFcgfOiGD/pOGonsuiDTk8WR/etqDQxcfV+bNSM9pGXR3d449hn2ibN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3031
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GzoSK0p81yw+WuOd7ueA6TQRLJF7RG8G/TeOQz7aNWk=;
 b=Oaw0nXRFzztLrbHtOKr4KY930pl3383IsTgXUK+JbOeQIxoME6oA46drVAY7sV98yTi6nC2CQ19/NwftxfO3PKzqrsWowv3svUF5KXuM/NTC8kPm6nntTdjeLwYP8UJY6tDJMHd0Ypx4fVPHvVf3l9tOsZmG4X0DXEwEPGF06vY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mikita.Lipski@amd.com; 
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
Cc: "Lipski, Mikita" <Mikita.Lipski@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiAxOS8xMS8yMDE5IDEyOjExLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6Cj4gT24gVHVlLCBO
b3YgMTksIDIwMTkgYXQgMDQ6NTk6NDBQTSArMDAwMCwgQ29ybmlqLCBOaWtvbGEgd3JvdGU6Cj4+
IElmIHlvdSdyZSBnb2luZyB0byBtYWtlIGFsbCBvZiB0aGVtIHRoZSBzYW1lLCB0aGVuIHU2NCwg
cGxlYXNlLgo+Pgo+PiBUaGlzIGlzIGJlY2F1c2UgSSdtIG5vdCBzdXJlIGlmIGNhbGN1bGF0aW9u
cyByZXF1aXJlIDY0LWJpdCBhdCBzb21lIHN0YWdlLgo+IAo+IElmIGl0IGRvZXMgdGhlbiBpdCdz
IGFscmVhZHkgYnJva2VuLiBTb21lb25lIHNob3VsZCBwcm9iYWJseSBmaWd1cmUgb3V0Cj4gd2hh
dCdzIGFjdGFsbHkgbmVlZGVkIGluc3RlYWQgb2Ygc2hvb3RpbmcgZHVja3Mgd2l0aCBhbiBpY2Jt
Lgo+IApJIGRvbid0IHRoaW5rIGl0IGlzIG5vdCBicm9rZW4sIGNhdXNlIEknbSBjdXJyZW50bHkg
dGVzdGluZyBEU0MuClRoZSBwYXRjaCBJIHNlbnQgZWFybHkgc2ltcGx5IGZpeGVzIHRoZSBlcnJv
ciBvZiBjb21wYXJpbmcgIHNpZ25lZCBhbmQgCnVuc2lnbmVkIHZhcmlhYmxlcy4KCldlIGNhbiB0
aGVuIHN1Ym1pdCBhIHNlY29uZCBwYXRjaCBhZGRyZXNzaW5nIHRoZSBpc3N1ZSBvZiB1c2luZyB1
bnNpZ25lZCAKbG9uZyBpbnQgaW5zdGVhZCBvZiB1MzIuIEFsc28sIHNpbmNlIHRoZSB2YXJpYWJs
ZXMgaW4gZHJtX2RzY19jb25maWcgCnN0cnVjdHVyZSBhcmUgYWxsIG9mIHR5cGUgdTggYW5kIHUx
NiwgdGhlIGNhbGN1bGF0aW9uIHZhbHVlcyBzaG91bGRuJ3QgCmV4Y2VlZCB0aGUgc2l6ZSBvZiB1
MzIuCgpUaGFua3MKCj4+Cj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4+IEZyb206IExp
cHNraSwgTWlraXRhIDxNaWtpdGEuTGlwc2tpQGFtZC5jb20+Cj4+IFNlbnQ6IE5vdmVtYmVyIDE5
LCAyMDE5IDEwOjA4IEFNCj4+IFRvOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGlu
dXguaW50ZWwuY29tPjsgTGlwc2tpLCBNaWtpdGEgPE1pa2l0YS5MaXBza2lAYW1kLmNvbT4KPj4g
Q2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnOyBDb3JuaWosIE5pa29sYSA8Tmlrb2xhLkNvcm5pakBhbWQuY29tPgo+PiBTdWJq
ZWN0OiBSZTogW1BBVENIXSBkcm0vZHNjOiBSZXR1cm4gdW5zaWduZWQgbG9uZyBvbiBjb21wdXRl
IG9mZnNldAo+Pgo+Pgo+Pgo+PiBPbiAxOS8xMS8yMDE5IDA5OjU2LCBWaWxsZSBTeXJqw6Rsw6Qg
d3JvdGU6Cj4+PiBPbiBUdWUsIE5vdiAxOSwgMjAxOSBhdCAwOTo0NToyNkFNIC0wNTAwLCBtaWtp
dGEubGlwc2tpQGFtZC5jb20gd3JvdGU6Cj4+Pj4gRnJvbTogTWlraXRhIExpcHNraSA8bWlraXRh
LmxpcHNraUBhbWQuY29tPgo+Pj4+Cj4+Pj4gV2Ugc2hvdWxkbid0IGNvbXBhcmUgaW50IHdpdGgg
dW5zaWduZWQgbG9uZyB0byBmaW5kIHRoZSBtYXggdmFsdWUgYW5kCj4+Pj4gc2luY2Ugd2UgYXJl
IG5vdCBleHBlY3RpbmcgbmVnYXRpdmUgdmFsdWUgcmV0dXJuZWQgZnJvbQo+Pj4+IGNvbXB1dGVf
b2Zmc2V0IHdlIHNob3VsZCBtYWtlIHRoaXMgZnVuY3Rpb24gcmV0dXJuIHVuc2lnbmVkIGxvbmcg
c28KPj4+PiB3ZSBjYW4gY29tcGFyZSB0aGUgdmFsdWVzIHdoZW4gY29tcHV0aW5nIHJjIHBhcmFt
ZXRlcnMuCj4+Pgo+Pj4gV2h5IGFyZSB0aGVyZSBvdGhlciB1bnNpZ25lZCBsb25ncyBpbiBkc2Mg
cGFyYW1ldGVyIGNvbXB1dGF0aW9uIGluIHRoZQo+Pj4gZmlyc3QgcGxhY2U/Cj4+Cj4+IEkgYmVs
aWV2ZSBpdCB3YXMgaW5pdGlhbGx5IHNldCB0byBiZSB1bnNpZ25lZCBsb25nIGZvciB2YXJpYWJs
ZSBjb25zaXN0ZW5jeSwgd2hlbiB3ZSBwb3J0ZWQgaW50ZWxfY29tcHV0ZV9yY19wYXJhbWV0ZXJz
IGludG8gZHJtX2RzY19jb21wdXRlX3JjX3BhcmFtZXRlcnMuIEJ1dCBub3cgdGhhdCBJIGxvb2sg
YXQgaXQsIHdlIGNhbiBhY3R1YWxseSBqdXN0IHNldCB0aGVtIHRvIHUzMiBvciB1NjQsIGFzIG5v
dGhpbmcgc2hvdWxkIGV4Y2VlZCB0aGF0Lgo+Pj4KPj4+Pgo+Pj4+IENjOiBOaWtvbGEgQ29ybmlq
IDxuaWtvbGEuY29ybmlqQGFtZC5jb20+Cj4+Pj4gQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53
ZW50bGFuZEBhbWQuY29tPgo+Pj4+IFNpZ25lZC1vZmYtYnk6IE1pa2l0YSBMaXBza2kgPG1pa2l0
YS5saXBza2lAYW1kLmNvbT4KPj4+PiAtLS0KPj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vZHJtX2Rz
Yy5jIHwgNiArKystLS0KPj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
ZHNjLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RzYy5jCj4+Pj4gaW5kZXggNzRmMzUyN2Y1Njdk
Li5lYzQwNjA0YWI2YTIgMTAwNjQ0Cj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kc2Mu
Ywo+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHNjLmMKPj4+PiBAQCAtMjQ1LDExICsy
NDUsMTEgQEAgdm9pZCBkcm1fZHNjX3Bwc19wYXlsb2FkX3BhY2soc3RydWN0IGRybV9kc2NfcGlj
dHVyZV9wYXJhbWV0ZXJfc2V0ICpwcHNfcGF5bG9hZCwKPj4+PiAgICB9Cj4+Pj4gICAgRVhQT1JU
X1NZTUJPTChkcm1fZHNjX3Bwc19wYXlsb2FkX3BhY2spOwo+Pj4+ICAgIAo+Pj4+IC1zdGF0aWMg
aW50IGNvbXB1dGVfb2Zmc2V0KHN0cnVjdCBkcm1fZHNjX2NvbmZpZyAqdmRzY19jZmcsIGludCBw
aXhlbHNfcGVyX2dyb3VwLAo+Pj4+ICtzdGF0aWMgdW5zaWduZWQgbG9uZyBjb21wdXRlX29mZnNl
dChzdHJ1Y3QgZHJtX2RzY19jb25maWcgKnZkc2NfY2ZnLCBpbnQgcGl4ZWxzX3Blcl9ncm91cCwK
Pj4+PiAgICAJCQkJaW50IGdyb3Vwc19wZXJfbGluZSwgaW50IGdycGNudCkKPj4+PiAgICB7Cj4+
Pj4gLQlpbnQgb2Zmc2V0ID0gMDsKPj4+PiAtCWludCBncnBjbnRfaWQgPSBESVZfUk9VTkRfVVAo
dmRzY19jZmctPmluaXRpYWxfeG1pdF9kZWxheSwgcGl4ZWxzX3Blcl9ncm91cCk7Cj4+Pj4gKwl1
bnNpZ25lZCBsb25nIG9mZnNldCA9IDA7Cj4+Pj4gKwl1bnNpZ25lZCBsb25nIGdycGNudF9pZCA9
IERJVl9ST1VORF9VUCh2ZHNjX2NmZy0+aW5pdGlhbF94bWl0X2RlbGF5LCBwaXhlbHNfcGVyX2dy
b3VwKTsKPj4+PiAgICAKPj4+PiAgICAJaWYgKGdycGNudCA8PSBncnBjbnRfaWQpCj4+Pj4gICAg
CQlvZmZzZXQgPSBESVZfUk9VTkRfVVAoZ3JwY250ICogcGl4ZWxzX3Blcl9ncm91cCAqIHZkc2Nf
Y2ZnLT5iaXRzX3Blcl9waXhlbCwgMTYpOwo+Pj4+IC0tIAo+Pj4+IDIuMTcuMQo+Pj4+Cj4+Pj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+PiBkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0Cj4+Pj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+
Pj4+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCj4+Pgo+Pgo+PiAtLSAKPj4gVGhhbmtzLAo+PiBNaWtpdGEgTGlwc2tpCj4+IFNvZnR3YXJl
IEVuZ2luZWVyIDIsIEFNRAo+PiBtaWtpdGEubGlwc2tpQGFtZC5jb20KPiAKCi0tIApUaGFua3Ms
Ck1pa2l0YSBMaXBza2kKU29mdHdhcmUgRW5naW5lZXIgMiwgQU1ECm1pa2l0YS5saXBza2lAYW1k
LmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
