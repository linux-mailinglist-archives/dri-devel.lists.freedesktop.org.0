Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B774B2194F
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2019 15:44:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F127C8940F;
	Fri, 17 May 2019 13:44:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690058.outbound.protection.outlook.com [40.107.69.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7FEA8940F
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2019 13:44:02 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1162.namprd12.prod.outlook.com (10.168.236.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.18; Fri, 17 May 2019 13:43:58 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5%7]) with mapi id 15.20.1900.010; Fri, 17 May 2019
 13:43:58 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Zhou, David(ChunMing)" <David1.Zhou@amd.com>,
 =?utf-8?B?TWljaGVsIETDpG56ZXI=?= <michel@daenzer.net>
Subject: Re: [PATCH libdrm] enable syncobj test depending on capability
Thread-Topic: [PATCH libdrm] enable syncobj test depending on capability
Thread-Index: AQHVDLaTGlkE2aTDPE2B9cNA+9RDfA==
Date: Fri, 17 May 2019 13:43:57 +0000
Message-ID: <243bd55d-6dbc-9814-621d-3d76e3ae9b31@amd.com>
References: <20190516104642.21450-1-david1.zhou@amd.com>
 <278437b6-c5f0-209b-443b-573b4143f944@amd.com>
 <-yw2q6u7xkjpo-i83eg9msudz1wgjn7w-b101h0-sfv5ag1noxjz2wg54r-iuw7ml-f519uls55cqypexnfa-et96uc-nx96jg5fu1d3-wn1hxg-td9bpo5n1nbv-wmnwfr84y609mm8lnpxqaf92-n4k5l3.1558004611599@email.android.com>
 <144963b9-d1e5-2afb-c02e-58dd6ba19a3e@amd.com>
 <f80c8b88-1dad-26ae-4de2-ec5e3fac289d@daenzer.net>
 <dd6450e5-a622-94bb-9bef-bed7dd901af8@amd.com>
 <iuca3rriuy61ilmprn7wjpxafclwjn-par0kv-n5se1uvs8pejoxgl1d1tv9e7-suc50po1nq5dp8g58yk4yiap-pn8vbp-u5q05h-bqtpqfswj30t-5msp9f-xh7906-cs7026x7ja36kggkcls4qiau.1558096119187@email.android.com>
In-Reply-To: <iuca3rriuy61ilmprn7wjpxafclwjn-par0kv-n5se1uvs8pejoxgl1d1tv9e7-suc50po1nq5dp8g58yk4yiap-pn8vbp-u5q05h-bqtpqfswj30t-5msp9f-xh7906-cs7026x7ja36kggkcls4qiau.1558096119187@email.android.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM6PR06CA0019.eurprd06.prod.outlook.com
 (2603:10a6:20b:14::32) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 272889d7-830f-478f-97ef-08d6dacdb5e4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1162; 
x-ms-traffictypediagnostic: DM5PR12MB1162:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR12MB1162742EC26ACD00D8A82A6A830B0@DM5PR12MB1162.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0040126723
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(366004)(376002)(346002)(396003)(39850400004)(189003)(199004)(13464003)(46003)(2616005)(53936002)(8936002)(71200400001)(11346002)(2906002)(71190400001)(7736002)(81166006)(81156014)(6116002)(36756003)(4326008)(8676002)(53546011)(102836004)(6506007)(386003)(186003)(5660300002)(31696002)(86362001)(486006)(64126003)(476003)(66574012)(65826007)(446003)(58126008)(316002)(110136005)(76176011)(52116002)(68736007)(99286004)(6306002)(14444005)(6246003)(14454004)(256004)(6436002)(54896002)(606006)(6512007)(236005)(72206003)(229853002)(65956001)(73956011)(66946007)(65806001)(66476007)(66556008)(64756008)(66446008)(966005)(31686004)(478600001)(6486002)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1162;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: nOy1ux9zLhxWjzhcGHTlWI/2Qq2NN73Jywx2gHPizcuXo5ohORhtDGG8om8eMIcEpW0D2PJG2Z3HxTfTEHHZ2SFUCC3B4JCCJL+UwPzBwpKOlvp8hBHJOvIjs3H0iiifw9hMvnmQc45HI3dwleRmLaABiEsG7coJYsWjkK3DAL1g5lk8Q4lTWN3rtNgLgq5WmKTCYb9ygKBpySK9snZ2MH2tMgKqqLXuud2xEXMwtoxuTuJIVLZ0Z6vi1ujTOQax97zh/LTedSoWrHlw1ntmUsLzr/RRMe57ezgiyrVrfo+ocv45n2jHZf9+sJOwdOmw4PZiEyDE/CvdB+gCWNhfKeWrxPWILi5pcQtB3NKXlZjrpR9Ab6slyFl+n+Fs2QxauwneYp7N59qZnV6oQblUTFhoTBR0phcaCnkHzqg1EZ0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 272889d7-830f-478f-97ef-08d6dacdb5e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2019 13:43:58.0947 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1162
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f2tkBn+qVrM3j1Ehu6ydooFDFAKZ6PnYsKz7+2aqf4I=;
 b=jJL8MCiiVLrsqpUHjSzyMSMOZKybKgO6iNVjawiau6DS5ET/ghLfyCnAvEnExqY5VgPVSa7uVgl3pjp8qbR1BW3tlxHfBUeTOpKY1aT8fHmVhsEnAq/hFxkbrMJY4hgnsiYBTwz1bc178qk0fBH4boc4ikIXXHoDjN2F+Vh8D2Y=
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1414931440=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1414931440==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_243bd55d6dbc9814621d3d76e3ae9b31amdcom_"

--_000_243bd55d6dbc9814621d3d76e3ae9b31amdcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Tm8sIGZpcnN0IG9mIGFsbCBJJ20gcmVhbGx5IGJ1c3kgd2l0aCB0aG9zZSBUVE0gcHJvYmxlbXMu
DQoNCkFuZCBzZWNvbmQgSSdtIGFjdHVhbGx5IG5vdCB2ZXJ5IGZhbWlsaWFyIHdpdGggdGhpcyBl
aXRoZXIuDQoNClBsZWFzZSBqdXN0IHNwbGl0IHRoZSBwYXRjaCB1cCBpbnRvIHR3bywgb25lIHVw
ZGF0aW5nIHRoZSBoZWFkZXJzIGFuZCBvbmUgZml4aW5nIHRoZSB0ZXN0IGNhc2UuDQoNCk1heWJl
IHRoYXQncyBlbm91Z2ggZm9yIE1pY2hlbCwNCkNocmlzdGlhbi4NCg0KQW0gMTcuMDUuMTkgdW0g
MTQ6Mjggc2NocmllYiBaaG91LCBEYXZpZChDaHVuTWluZyk6DQpDYW4geW91IGd1eSBkbyB0aGF0
PyBPdGhlcndpc2UgaWYga2VybmVsIGRyaXZlciBkb2Vzbid0IHNldCB0aGF0IGNhcCwgdGVzdCBj
b3VsZCBmYWlsLg0KDQpUaGFua3MsDQotRGF2aWQNCg0KLS0tLS0tLS0gT3JpZ2luYWwgTWVzc2Fn
ZSAtLS0tLS0tLQ0KU3ViamVjdDogUmU6IFtQQVRDSCBsaWJkcm1dIGVuYWJsZSBzeW5jb2JqIHRl
c3QgZGVwZW5kaW5nIG9uIGNhcGFiaWxpdHkNCkZyb206ICJLb2VuaWcsIENocmlzdGlhbiINClRv
OiBNaWNoZWwgRMOkbnplciAsIlpob3UsIERhdmlkKENodW5NaW5nKSIgLCJaaG91LCBEYXZpZChD
aHVuTWluZykiDQpDQzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzxtYWlsdG86ZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4NCg0KQW0gMTcuMDUuMTkgdW0gMTE6NTUgc2No
cmllYiBNaWNoZWwgRMOkbnplcjoNCj4gW0NBVVRJT046IEV4dGVybmFsIEVtYWlsXQ0KPg0KPiBP
biAyMDE5LTA1LTE3IDExOjQ3IGEubS4sIHpob3VjbTEgd3JvdGU6DQo+PiBwaW5nLCBDb3VsZCB5
b3UgaGVscCBjaGVjayBpbiBwYXRjaCB0byBnaXRsYWI/IE15IGNvbm5lY3Rpb24gdG8gZ2l0bGFi
DQo+PiBzdGlsbCBoYXMgcHJvYmxlbS4NCj4gUGxlYXNlIGZvbGxvdyB0aGUgcHJvY2VzcyBkb2N1
bWVudGVkIGluIGluY2x1ZGUvZHJtL1JFQURNRSBmb3INCj4gaW5jbHVkZS9kcm0vZHJtLmggLg0K
DQpZZWFoLCB0aGUgaGVhZGVyIHNob3VsZCBiZSB1cGRhdGVkIHNlcGFyYXRlbHkgdG8gd2hhdCBp
cyBjdXJyZW50bHkgaW4NCmRybS1uZXh0IChvciBkcm0tbWlzYy1uZXh0KS4NCg0KQW5kIHRoZW4g
d2UgY2FuIHVwZGF0ZSB0aGUgZml4IG9uIHRvcCBvZiB0aGF0LA0KQ2hyaXN0aWFuLg0KDQo+DQo+
DQo+IC0tDQo+IEVhcnRobGluZyBNaWNoZWwgRMOkbnplciAgICAgICAgICAgICAgIHwgICAgICAg
ICAgICAgIGh0dHBzOi8vd3d3LmFtZC5jb20NCj4gTGlicmUgc29mdHdhcmUgZW50aHVzaWFzdCAg
ICAgICAgICAgICB8ICAgICAgICAgICAgIE1lc2EgYW5kIFggZGV2ZWxvcGVyDQoNCg0K

--_000_243bd55d6dbc9814621d3d76e3ae9b31amdcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <644CBD6377E84F4C89DC62A2AE3FE592@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5IHRleHQ9IiMwMDAwMDAi
IGJnY29sb3I9IiNGRkZGRkYiPg0KPGRpdiBjbGFzcz0ibW96LWNpdGUtcHJlZml4Ij5ObywgZmly
c3Qgb2YgYWxsIEknbSByZWFsbHkgYnVzeSB3aXRoIHRob3NlIFRUTSBwcm9ibGVtcy48YnI+DQo8
YnI+DQpBbmQgc2Vjb25kIEknbSBhY3R1YWxseSBub3QgdmVyeSBmYW1pbGlhciB3aXRoIHRoaXMg
ZWl0aGVyLjxicj4NCjxicj4NClBsZWFzZSBqdXN0IHNwbGl0IHRoZSBwYXRjaCB1cCBpbnRvIHR3
bywgb25lIHVwZGF0aW5nIHRoZSBoZWFkZXJzIGFuZCBvbmUgZml4aW5nIHRoZSB0ZXN0IGNhc2Uu
PGJyPg0KPGJyPg0KTWF5YmUgdGhhdCdzIGVub3VnaCBmb3IgTWljaGVsLDxicj4NCkNocmlzdGlh
bi48YnI+DQo8YnI+DQpBbSAxNy4wNS4xOSB1bSAxNDoyOCBzY2hyaWViIFpob3UsIERhdmlkKENo
dW5NaW5nKTo8YnI+DQo8L2Rpdj4NCjxibG9ja3F1b3RlIHR5cGU9ImNpdGUiIGNpdGU9Im1pZDpp
dWNhM3JyaXV5NjFpbG1wcm43d2pweGFmY2x3am4tcGFyMGt2LW41c2UxdXZzOHBlam94Z2wxZDF0
djllNy1zdWM1MHBvMW5xNWRwOGc1OHlrNHlpYXAtcG44dmJwLXU1cTA1aC1icXRwcWZzd2ozMHQt
NW1zcDlmLXhoNzkwNi1jczcwMjZ4N2phMzZrZ2drY2xzNHFpYXUuMTU1ODA5NjExOTE4N0BlbWFp
bC5hbmRyb2lkLmNvbSI+DQo8bWV0YSBuYW1lPSJHZW5lcmF0b3IiIGNvbnRlbnQ9Ik1pY3Jvc29m
dCBFeGNoYW5nZSBTZXJ2ZXIiPg0KPCEtLSBjb252ZXJ0ZWQgZnJvbSB0ZXh0IC0tPjxzdHlsZT48
IS0tIC5FbWFpbFF1b3RlIHsgbWFyZ2luLWxlZnQ6IDFwdDsgcGFkZGluZy1sZWZ0OiA0cHQ7IGJv
cmRlci1sZWZ0OiAjODAwMDAwIDJweCBzb2xpZDsgfSAtLT48L3N0eWxlPg0KPGRpdj5DYW4geW91
IGd1eSBkbyB0aGF0PyBPdGhlcndpc2UgaWYga2VybmVsIGRyaXZlciBkb2Vzbid0IHNldCB0aGF0
IGNhcCwgdGVzdCBjb3VsZCBmYWlsLjxicj4NCjxicj4NClRoYW5rcyw8YnI+DQotRGF2aWQ8YnI+
DQo8YnI+DQotLS0tLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tLS0tPGJyPg0KU3ViamVjdDog
UmU6IFtQQVRDSCBsaWJkcm1dIGVuYWJsZSBzeW5jb2JqIHRlc3QgZGVwZW5kaW5nIG9uIGNhcGFi
aWxpdHk8YnI+DQpGcm9tOiAmcXVvdDtLb2VuaWcsIENocmlzdGlhbiZxdW90OyA8YnI+DQpUbzog
TWljaGVsIETDpG56ZXIgLCZxdW90O1pob3UsIERhdmlkKENodW5NaW5nKSZxdW90OyAsJnF1b3Q7
WmhvdSwgRGF2aWQoQ2h1bk1pbmcpJnF1b3Q7IDxicj4NCkNDOiA8YSBjbGFzcz0ibW96LXR4dC1s
aW5rLWFiYnJldmlhdGVkIiBocmVmPSJtYWlsdG86ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZyI+DQpkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPC9hPjxicj4NCjxicj4NCjwv
ZGl2Pg0KPGZvbnQgc2l6ZT0iMiI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMXB0OyI+DQo8ZGl2
IGNsYXNzPSJQbGFpblRleHQiPkFtIDE3LjA1LjE5IHVtIDExOjU1IHNjaHJpZWIgTWljaGVsIETD
pG56ZXI6PGJyPg0KJmd0OyBbQ0FVVElPTjogRXh0ZXJuYWwgRW1haWxdPGJyPg0KJmd0Ozxicj4N
CiZndDsgT24gMjAxOS0wNS0xNyAxMTo0NyBhLm0uLCB6aG91Y20xIHdyb3RlOjxicj4NCiZndDsm
Z3Q7IHBpbmcsIENvdWxkIHlvdSBoZWxwIGNoZWNrIGluIHBhdGNoIHRvIGdpdGxhYj8gTXkgY29u
bmVjdGlvbiB0byBnaXRsYWI8YnI+DQomZ3Q7Jmd0OyBzdGlsbCBoYXMgcHJvYmxlbS48YnI+DQom
Z3Q7IFBsZWFzZSBmb2xsb3cgdGhlIHByb2Nlc3MgZG9jdW1lbnRlZCBpbiBpbmNsdWRlL2RybS9S
RUFETUUgZm9yPGJyPg0KJmd0OyBpbmNsdWRlL2RybS9kcm0uaCAuPGJyPg0KPGJyPg0KWWVhaCwg
dGhlIGhlYWRlciBzaG91bGQgYmUgdXBkYXRlZCBzZXBhcmF0ZWx5IHRvIHdoYXQgaXMgY3VycmVu
dGx5IGluIDxicj4NCmRybS1uZXh0IChvciBkcm0tbWlzYy1uZXh0KS48YnI+DQo8YnI+DQpBbmQg
dGhlbiB3ZSBjYW4gdXBkYXRlIHRoZSBmaXggb24gdG9wIG9mIHRoYXQsPGJyPg0KQ2hyaXN0aWFu
Ljxicj4NCjxicj4NCiZndDs8YnI+DQomZ3Q7PGJyPg0KJmd0OyAtLTxicj4NCiZndDsgRWFydGhs
aW5nIE1pY2hlbCBEw6RuemVyJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHwmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsgPGEgaHJlZj0iaHR0cHM6Ly93d3cuYW1kLmNvbSIgbW96LWRvLW5vdC1zZW5k
PSJ0cnVlIj4NCmh0dHBzOi8vd3d3LmFtZC5jb208L2E+PGJyPg0KJmd0OyBMaWJyZSBzb2Z0d2Fy
ZSBlbnRodXNpYXN0Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHwmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgTWVzYSBhbmQgWCBk
ZXZlbG9wZXI8YnI+DQo8YnI+DQo8L2Rpdj4NCjwvc3Bhbj48L2ZvbnQ+PC9ibG9ja3F1b3RlPg0K
PGJyPg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_243bd55d6dbc9814621d3d76e3ae9b31amdcom_--

--===============1414931440==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1414931440==--
