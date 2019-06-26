Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 806BA565A8
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 11:28:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C90B16E33E;
	Wed, 26 Jun 2019 09:28:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730087.outbound.protection.outlook.com [40.107.73.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82BEB6E33E;
 Wed, 26 Jun 2019 09:28:45 +0000 (UTC)
Received: from CY4PR12MB1543.namprd12.prod.outlook.com (10.172.70.20) by
 CY4PR12MB1877.namprd12.prod.outlook.com (10.175.60.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Wed, 26 Jun 2019 09:28:43 +0000
Received: from CY4PR12MB1543.namprd12.prod.outlook.com
 ([fe80::dc0:35ce:ae83:f8d5]) by CY4PR12MB1543.namprd12.prod.outlook.com
 ([fe80::dc0:35ce:ae83:f8d5%6]) with mapi id 15.20.2008.018; Wed, 26 Jun 2019
 09:28:43 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH 1/6] dma-buf: add dynamic DMA-buf handling v12
Thread-Topic: [Intel-gfx] [PATCH 1/6] dma-buf: add dynamic DMA-buf handling v12
Thread-Index: AQHVK/eN/zRsn+t2zkCsTUgp+8jYAKatqyGA
Date: Wed, 26 Jun 2019 09:28:43 +0000
Message-ID: <edcfb3ce-e13c-fe38-c34c-9933f777ffce@amd.com>
References: <20190625124654.122364-1-christian.koenig@amd.com>
 <20190625160539.GB12905@phenom.ffwll.local>
 <819ef4bd-e862-6390-d2e3-60f9d6c9cab4@gmail.com>
 <20190626081711.GH12905@phenom.ffwll.local>
In-Reply-To: <20190626081711.GH12905@phenom.ffwll.local>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR1PR01CA0035.eurprd01.prod.exchangelabs.com
 (2603:10a6:102::48) To CY4PR12MB1543.namprd12.prod.outlook.com
 (2603:10b6:910:c::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7722224d-fa8f-444a-3c21-08d6fa18ae85
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CY4PR12MB1877; 
x-ms-traffictypediagnostic: CY4PR12MB1877:
x-microsoft-antispam-prvs: <CY4PR12MB18772207777FA0843BCE2BBD83E20@CY4PR12MB1877.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00808B16F3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(396003)(366004)(376002)(346002)(39860400002)(189003)(199004)(52314003)(4326008)(68736007)(65826007)(14454004)(72206003)(478600001)(31696002)(6116002)(2906002)(36756003)(25786009)(86362001)(6486002)(256004)(14444005)(8676002)(5024004)(476003)(2616005)(446003)(11346002)(71190400001)(31686004)(46003)(71200400001)(6512007)(6436002)(486006)(81156014)(81166006)(8936002)(76176011)(73956011)(66946007)(6506007)(64756008)(386003)(186003)(66476007)(66446008)(102836004)(52116002)(65806001)(65956001)(229853002)(66574012)(5660300002)(66556008)(99286004)(6246003)(54906003)(58126008)(316002)(64126003)(6916009)(7736002)(305945005)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1877;
 H:CY4PR12MB1543.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: o43ukqNOXsTI/a4I1Iz+47FFiPSxeZaaH2Hw/kwGf4UlxGizf74ASTaWUwE2nsz7oGFF7oaCHmqLi2VKoLKhmWyzRSuoAP7YIxn3EnCN8dmeIKISESmqybroL1TxZOlBlUPoZQ4bqjpxQthK5pXoLrv2FgYiZz0YW/eHQBNXyMCAxYTGfnjskRIOdV+gwI+depYkKEfhHymmg8OFrQpev8Np3LCFtk5XLrVaygS4X2YYSbTocH/Kc8rsxgfQ2lKo73gUEct681V5vCRtfMB5qVWRPDySLrAd/2XKHJeA6k2hGHbFuRjsHJw1rs5as8jCJ+tnPLemO6oZDxCmRYOsW+N2OWvv6MBT+dDgDUatXXnYdTojFIUwPypEoHPMXiT+C+tcmlSg+b5s++aWD5xYqjAlomX+WmSoZCtcAgeH8Lw=
Content-ID: <9A03E9FB4A7F4247982926A8F497FE79@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7722224d-fa8f-444a-3c21-08d6fa18ae85
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2019 09:28:43.6872 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1877
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y2N0qEOlYazf/HTD3y3sHbSKCTBrz0gfYZDeVcXzEFo=;
 b=Y9BIzR2KUCnZfQcULKeVT+iX5L6fgUOywRlWaeR+9RC0wFdZ9d2Sj+W/ZvF3uEn2ld1BH0qTSS6MDJnKzpsimCg1Mv1lVswMr/3LYl4lrrpBYwq9SkcFb0ZY3IPE/8hELq4nzD6ai6EyDBpY0RnynXi5kSOghn5+Q1LT74JUI+s=
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjYuMDYuMTkgdW0gMTA6MTcgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBPbiBXZWQsIEp1
biAyNiwgMjAxOSBhdCAwOTo0OTowM0FNICswMjAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOg0K
Pj4gQW0gMjUuMDYuMTkgdW0gMTg6MDUgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPj4+IE9uIFR1
ZSwgSnVuIDI1LCAyMDE5IGF0IDAyOjQ2OjQ5UE0gKzAyMDAsIENocmlzdGlhbiBLw7ZuaWcgd3Jv
dGU6DQo+Pj4+IE9uIHRoZSBleHBvcnRlciBzaWRlIHdlIGFkZCBvcHRpb25hbCBleHBsaWNpdCBw
aW5uaW5nIGNhbGxiYWNrcy4gSWYgdGhvc2UNCj4+Pj4gY2FsbGJhY2tzIGFyZSBpbXBsZW1lbnRl
ZCB0aGUgZnJhbWV3b3JrIG5vIGxvbmdlciBjYWNoZXMgc2cgdGFibGVzIGFuZCB0aGUNCj4+Pj4g
bWFwL3VubWFwIGNhbGxiYWNrcyBhcmUgYWx3YXlzIGNhbGxlZCB3aXRoIHRoZSBsb2NrIG9mIHRo
ZSByZXNlcnZhdGlvbiBvYmplY3QNCj4+Pj4gaGVsZC4NCj4+Pj4NCj4+Pj4gT24gdGhlIGltcG9y
dGVyIHNpZGUgd2UgYWRkIGFuIG9wdGlvbmFsIGludmFsaWRhdGUgY2FsbGJhY2suIFRoaXMgY2Fs
bGJhY2sgaXMNCj4+Pj4gdXNlZCBieSB0aGUgZXhwb3J0ZXIgdG8gaW5mb3JtIHRoZSBpbXBvcnRl
cnMgdGhhdCB0aGVpciBtYXBwaW5ncyBzaG91bGQgYmUNCj4+Pj4gZGVzdHJveWVkIGFzIHNvb24g
YXMgcG9zc2libGUuDQo+Pj4+DQo+Pj4+IFRoaXMgYWxsb3dzIHRoZSBleHBvcnRlciB0byBwcm92
aWRlIHRoZSBtYXBwaW5ncyB3aXRob3V0IHRoZSBuZWVkIHRvIHBpbg0KPj4+PiB0aGUgYmFja2lu
ZyBzdG9yZS4NCj4+Pj4NCj4+Pj4gdjI6IGRvbid0IHRyeSB0byBpbnZhbGlkYXRlIG1hcHBpbmdz
IHdoZW4gdGhlIGNhbGxiYWNrIGlzIE5VTEwsDQo+Pj4+ICAgICAgIGxvY2sgdGhlIHJlc2VydmF0
aW9uIG9iaiB3aGlsZSB1c2luZyB0aGUgYXR0YWNobWVudHMsDQo+Pj4+ICAgICAgIGFkZCBoZWxw
ZXIgdG8gc2V0IHRoZSBjYWxsYmFjaw0KPj4+PiB2MzogbW92ZSBmbGFnIGZvciBpbnZhbGlkYXRp
b24gc3VwcG9ydCBpbnRvIHRoZSBETUEtYnVmLA0KPj4+PiAgICAgICB1c2UgbmV3IGF0dGFjaF9p
bmZvIHN0cnVjdHVyZSB0byBzZXQgdGhlIGNhbGxiYWNrDQo+Pj4+IHY0OiB1c2UgaW1wb3J0ZXJf
cHJpdiBmaWVsZCBpbnN0ZWFkIG9mIG1hbmdsaW5nIGV4cG9ydGVyIHByaXYuDQo+Pj4+IHY1OiBk
cm9wIGludmFsaWRhdGlvbl9zdXBwb3J0ZWQgZmxhZw0KPj4+PiB2Njogc3F1YXNoIHRvZ2V0aGVy
IHdpdGggcGluL3VucGluIGNoYW5nZXMNCj4+Pj4gdjc6IHBpbi91bnBpbiB0YWtlcyBhbiBhdHRh
Y2htZW50IG5vdw0KPj4+PiB2ODogbnVrZSBkbWFfYnVmX2F0dGFjaG1lbnRfKG1hcHx1bm1hcClf
bG9ja2VkLA0KPj4+PiAgICAgICBldmVyeXRoaW5nIGlzIG5vdyBoYW5kbGVkIGJhY2t3YXJkIGNv
bXBhdGlibGUNCj4+Pj4gdjk6IGFsd2F5cyBjYWNoZSB3aGVuIGV4cG9ydC9pbXBvcnRlciBkb24n
dCBhZ3JlZSBvbiBkeW5hbWljIGhhbmRsaW5nDQo+Pj4+IHYxMDogbWluaW1hbCBzdHlsZSBjbGVh
bnVwDQo+Pj4+IHYxMTogZHJvcCBhdXRvbWF0aWNhbGx5IHJlLWVudHJ5IGF2b2lkYW5jZQ0KPj4+
PiB2MTI6IHJlbmFtZSBjYWxsYmFjayB0byBtb3ZlX25vdGlmeQ0KPj4+Pg0KPj4+PiBTaWduZWQt
b2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+DQo+Pj4g
T25lIHRoaW5nIEkndmUgZm9yZ290dGVuLCBqdXN0IHN0dW1ibGVkIG92ZXIgdHRtX2JvLT5tb3Zp
bmcuIEZvciBwaW5uZWQNCj4+PiBidWZmZXIgc2hhcmluZyB0aGF0J3Mgbm90IG5lZWRlZCwgYW5k
IEkgdGhpbmsgZm9yIGR5bmFtaWMgYnVmZmVyIHNoYXJpbmcNCj4+PiBpdCdzIGFsc28gbm90IGdv
aW5nIHRvIGJlIHRoZSBwcmltYXJ5IHJlcXVpcmVtZW50LiBCdXQgSSB0aGluayB0aGVyZSdzIHR3
bw0KPj4+IHJlYXNvbnMgd2Ugc2hvdWxkIG1heWJlIGxvb2sgaW50byBtb3ZpbmcgdGhhdCBmcm9t
IHR0bV9ibyB0byByZXN2X29iajoNCj4+IFRoYXQgaXMgYWxyZWFkeSBwYXJ0IG9mIHRoZSByZXN2
X29iai4gVGhlIGRpZmZlcmVuY2UgaXMgdGhhdCByYWRlb24gaXMNCj4+IG92ZXJ3cml0aW5nIHRo
ZSBvbmUgaW4gdGhlIHJlc3Zfb2JqIGR1cmluZyBDUyB3aGlsZSBhbWRncHUgaXNuJ3QuDQo+IEkn
bSBjb25mdXNlZCBoZXJlOiBBdG0gLT5tb3ZpbmcgaXNuJ3QgaW4gcmVzdl9vYmosIHRoZXJlJ3Mg
b25seSBvbmUNCj4gZXhjbHVzaXZlIGZlbmNlLiBBbmQgeWVzIHlvdSBuZWVkIHRvIHNldCB0aGF0
IGV2ZXJ5IHRpbWUgeW91IGRvIGEgbW92ZQ0KPiAoYmVjYXVzZSBhIG1vdmUgbmVlZHMgdG8gYmUg
cHJldHR5IGV4Y2x1c2l2ZSBhY2Nlc3MpLiBCdXQgSSdtIG5vdCBzZWVpbmcgYQ0KPiBzZXBhcmF0
ZSBub3RfcXVpdGVfZXhjbHVzaXZlIGZlbmNlIHNsb3QgZm9yIG1vdmVzLg0KDQpZZWFoLCBidXQg
c2hvdWxkbid0IHRoYXQgYmUgc3VmZmljaWVudD8gSSBtZWFuIHdoeSBkb2VzIHNvbWVib2R5IGVs
c2UgDQp0aGFuIHRoZSBleHBvcnRlciBuZWVkcyB0byBrbm93IHdoZW4gYSBCTyBpcyBtb3Zpbmc/
DQoNCj4+IFNvIGZvciBhbWRncHUgd2Uga2VlcCBhbiBleHRyYSBjb3B5IGluIHR0bV9iby0+bW92
aW5nIHRvIGtlZXAgdGhlIHBhZ2UgZmF1bHQNCj4+IGhhbmRsZXIgZnJvbSB1bm5lY2Vzc2FyeSB3
YWl0aW5nIGZvciBhIGZlbmNlIGluIHJhZGVvbi4NCj4gWWVhaCB0aGF0J3MgdGhlIG1haW4gb25l
LiBUaGUgb3RoZXIgaXMgaW4gQ1MgKGF0IGxlYXN0IGZvciBpOTE1KSB3ZSBjb3VsZA0KPiBydW4g
cGlwZWxpbmUgdGV4dHVyZSB1cGxvYWRzIGluIHBhcmFsbGVsIHdpdGggb3RoZXIgcmVuZGVyaW5n
IGFuZCBzdHVmZg0KPiBsaWtlIHRoYXQgKHdpdGggbXVsdGlwbGUgZW5naW5lcywgd2hpY2ggYXRt
IGlzIGFsc28gbm90IHRoZXJlIHlldCkuIEkNCj4gdGhpbmsgdGhhdCBjb3VsZCBiZSBzb21ld2hh
dCB1c2VmdWwgZm9yIHZrIGRyaXZlcnMuDQo+DQo+IEFueXdheSwgdG90YWxseSBub3QgdW5kZXJz
dGFuZCB3aGF0IHlvdSB3YW50ZWQgdG8gdGVsbCBtZSBoZXJlIGluIHRoZXNlDQo+IHR3byBsaW5l
cy4NCg0KU29ycnkgaXQncyAzM0MgaW4gbXkgaG9tZSBvZmZpY2UgaGVyZSBhbmQgSSBtaXhlZCB1
cCByYWRlb24vYW1kZ3B1IGluIA0KdGhlIHNlbnRlbmNlIGFib3ZlLg0KDQo+Pj4gLSBZb3Ugc291
bmQgbGlrZSB5b3Ugd2FudCB0byB1c2UgdGhpcyBhIGxvdCBtb3JlLCBldmVuIGludGVybmFsbHkg
aW4NCj4+PiAgICAgYW1kZ3B1LiBGb3IgdGhhdCBJIGRvIHRoaW5rIHRoZSBzZXBlYXJhdGUgZG1h
X2ZlbmNlIGp1c3QgdG8gbWFrZSBzdXJlDQo+Pj4gICAgIHRoZSBidWZmZXIgaXMgYWNjZXNzaWJs
ZSB3aWxsIGJlIG5lZWRlZCBpbiByZXN2X29iai4NCj4+Pg0KPj4+IC0gT25jZSB3ZSBoYXZlIC0+
bW92aW5nIEkgdGhpbmsgdGhlcmUncyBzb21lIGdvb2QgY2hhbmNlcyB0byBleHRyYWN0IGEgYml0
DQo+Pj4gICAgIG9mIHRoZSBldmljdGlvbi9waXBlbGluZSBibyBtb3ZlIGJvaWxlcnBsYXRlIGZy
b20gdHRtLCBhbmQgbWF5YmUgdXNlIGl0DQo+Pj4gICAgIGluIG90aGVyIGRyaXZlcnMuIGk5MTUg
Y291bGQgYWxyZWFkeSBtYWtlIHVzZSBvZiB0aGlzIGluIHVwc3RyZWFtLCBzaW5jZQ0KPj4+ICAg
ICB3ZSBhbHJlYWR5IHBpcGVsaW5lIGdldF9wYWdlcyBhbmQgY2xmbHVzaCBvZiBidWZmZXJzLiBP
ZmMgb25jZSB3ZSBoYXZlDQo+Pj4gICAgIHZyYW0gc3VwcG9ydCwgZXZlbiBtb3JlIHVzZWZ1bC4N
Cj4+IEkgYWN0dWFsbHkgaW5kZWVkIHdhbnRlZCB0byBhZGQgbW9yZSBzdHVmZiB0byB0aGUgcmVz
ZXJ2YXRpb24gb2JqZWN0DQo+PiBpbXBsZW1lbnRhdGlvbiwgbGlrZSBmaW5hbGx5IGNsZWFuaW5n
IHVwIHRoZSBkaXN0aW5jdGlvbiBvZiByZWFkZXJzL3dyaXRlcnMuDQo+IEhtLCBtb3JlIGRldGFp
bHM/IE5vdCByaW5naW5nIGEgYmVsbCAuLi4NCg0KSSdtIG5vdCB5ZXQgc3VyZSBhYm91dCB0aGUg
ZGV0YWlscyBlaXRoZXIsIHNvIHBsZWFzZSBqdXN0IHdhaXQgdW50aWwgSSANCnNvbHZlZCB0aGF0
IGFsbCB1cCBmb3IgbWUgZmlyc3QuDQoNCj4+IEFuZCBjbGVhbmluZyB1cCB0aGUgZmVuY2UgcmVt
b3ZhbCBoYWNrIHdlIGhhdmUgaW4gdGhlIEtGRCBmb3IgZnJlZWQgdXAgQk9zLg0KPj4gVGhhdCB3
b3VsZCBhbHNvIGFsbG93IGZvciBnZXR0aW5nIHJpZCBvZiB0aGlzIGluIHRoZSBsb25nIHRlcm0u
DQo+IEhtLCB3aGF0J3MgdGhhdCBmb3I/DQoNCldoZW4gdGhlIEtGRCBmcmVlcyB1cCBtZW1vcnkg
aXQgcmVtb3ZlcyB0aGVpciBldmljdGlvbiBmZW5jZSBmcm9tIHRoZSANCnJlc2VydmF0aW9uIG9i
amVjdCBpbnN0ZWFkIG9mIHNldHRpbmcgaXQgYXMgc2lnbmFsZWQgYW5kIGFkZGluZyBhIG5ldyAN
Cm9uZSB0byBhbGwgb3RoZXIgdXNlZCByZXNlcnZhdGlvbiBvYmplY3RzLg0KDQpDaHJpc3RpYW4u
DQoNCj4gLURhbmllbA0KPg0KPj4gQ2hyaXN0aWFuLg0KPj4NCj4+PiBBbmQgZG9pbmcgdGhhdCBz
bGlnaHQgc2VtYW50aWMgY2hhbmdlIGlzIG11Y2ggZWFzaWVyIG9uY2Ugd2Ugb25seSBoYXZlIGEN
Cj4+PiBmZXcgZHluYW1pYyBleHBvcnRlcnMvaW1wb3J0ZXJzLiBBbmQgc2luY2UgaXQncyBhIHB1
cmUgb3B0LWluIG9wdGltaXphdGlvbg0KPj4+ICh5b3UgY2FuIGFsd2F5cyBmYWxsIGJhY2sgdG8g
dGhlIGV4Y2x1c2l2ZSBmZW5jZSkgaXQgc2hvdWxkIGJlIGVhc3kgdG8NCj4+PiByb2xsIG91dC4N
Cj4+Pg0KPj4+IFRob3VnaHRzIGFib3V0IG1vdmluZyB0dG1fYm8tPm1vdmluZyB0byByZXN2X29i
aj8gT2ZjIHN0cmljdGx5IG9ubHkgYXMgYQ0KPj4+IGZvbGxvdyB1cC4gUGx1cyBtYXliZSB3aXRo
IGEgY2xlYXJlciBuYW1lIDotKQ0KPj4+DQo+Pj4gQ2hlZXJzLCBEYW5pZWwNCj4+Pg0KDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
