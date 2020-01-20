Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDF414309D
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2020 18:09:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 200A36EA2B;
	Mon, 20 Jan 2020 17:09:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on0604.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe06::604])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6F8C6E904
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2020 11:41:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hv04nZf1aFeRD41MUFx1G0pWYNou+riGmwoNK7PBVSMhqxzjla/ptdPiINzQW5o0ZkLZ4sWQNRMOOGc5bVpKnR2rMlzw7sqKAV4XULjtXwySr5lHr+V+tAI5tFaHiDOUpQqzrtrtmW5WQy0ZMIfSo5YDcLFshFiWqMK4c6DH1fczaIBfLyXWTMPuyg8NoWQ4t+8Xr7w9GPO04UlaTu6LPTjml9+9ymFHYBZ33ee4ssvmKblT0D/hBS/TzOsi2k/VmbvfZuujVyJA/6S91lYRguwPtP2FubBM6wU9VGbc/IPi/N1QVxSyYH8V5XeQgrE6oNoWTloXBQJy95zKKZ0ang==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VD3DOSJk+J7xH1Dm472pHLGyOA/mDcyI3NzfTo7jwnQ=;
 b=PclAGbZZNCiL4E3hmC67TlEiUFmOgkxf41V/mhNT3En0povlhNiinDkXyRpxqcWXXDkHQ7rkPRTWuEZESLSuN3m6dJEEPkQ8gsgpDmFbs+PPIDoGLHkSvTh0LSM7J7U8Om3ocKHvf41XKoe0Rm+K4yVdsSihUXKekoxnH5SGNpLIIwgBz5hb0sQdv6FlJsg1rsVsJuMml+mLFnMvCytCqUqEJKYwpI3E1ofGS8a8nfUKQBywKaouwIUlJ25F23jbmgSGdNwje903nHBFGt72Vkk7/hH0LNUsYVkFLO6nVuZbeOe9rlIihA//Sdj0rgtgDp0/bpX6vjBqd0nIkhf6uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nextfour.com; dmarc=pass action=none header.from=nextfour.com;
 dkim=pass header.d=nextfour.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NextfourGroupOy.onmicrosoft.com;
 s=selector2-NextfourGroupOy-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VD3DOSJk+J7xH1Dm472pHLGyOA/mDcyI3NzfTo7jwnQ=;
 b=WYwkh6Zu4m7Ks2oQOQgZntl7niUZaemHX5Kn7hGgZms+S9selpFTSORrztY46gzaIiskvqBnMjYFLqtD2KfNY7sq5Dgn/X036xSFj5krumLHYzOYMx1yqEePDvOEtrsDfI17ZwzH6EnUMl9e3GFSVmRbUWWlTY9f83Ogw1vZgrM=
Received: from VI1PR03MB3775.eurprd03.prod.outlook.com (52.134.21.155) by
 VI1PR03MB3006.eurprd03.prod.outlook.com (10.165.190.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.23; Mon, 20 Jan 2020 11:41:09 +0000
Received: from VI1PR03MB3775.eurprd03.prod.outlook.com
 ([fe80::fdfe:b987:16ad:9de9]) by VI1PR03MB3775.eurprd03.prod.outlook.com
 ([fe80::fdfe:b987:16ad:9de9%5]) with mapi id 15.20.2644.024; Mon, 20 Jan 2020
 11:41:09 +0000
Received: from [10.10.10.144] (194.157.170.35) by
 HE1PR05CA0308.eurprd05.prod.outlook.com (2603:10a6:7:93::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.18 via Frontend Transport; Mon, 20 Jan 2020 11:41:08 +0000
From: =?utf-8?B?TWlrYSBQZW50dGlsw6Q=?= <mika.penttila@nextfour.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: rk3399 mipi phy force stop mode
Thread-Topic: rk3399 mipi phy force stop mode
Thread-Index: AQHVz4aBUtguwgPls0KEovK+RTT2dg==
Date: Mon, 20 Jan 2020 11:41:08 +0000
Message-ID: <7c86ac0d-507e-3bab-fee1-ce41ec08a665@nextfour.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR05CA0308.eurprd05.prod.outlook.com
 (2603:10a6:7:93::39) To VI1PR03MB3775.eurprd03.prod.outlook.com
 (2603:10a6:803:2b::27)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=mika.penttila@nextfour.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-pep-version: 2.0
x-originating-ip: [194.157.170.35]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 48ac8670-75de-4f18-42e7-08d79d9da417
x-ms-traffictypediagnostic: VI1PR03MB3006:
x-microsoft-antispam-prvs: <VI1PR03MB3006608D12D78F621224751483320@VI1PR03MB3006.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0288CD37D9
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(136003)(396003)(376002)(366004)(39830400003)(199004)(189003)(316002)(16576012)(2906002)(2616005)(956004)(6916009)(8936002)(52116002)(81166006)(8676002)(81156014)(36756003)(508600001)(66946007)(66476007)(64756008)(186003)(66616009)(66556008)(66446008)(26005)(16526019)(86362001)(31696002)(4744005)(6486002)(5660300002)(31686004)(71200400001)(85182001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR03MB3006;
 H:VI1PR03MB3775.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nextfour.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6UqbM2IRuE8OIt3/4Zzz+gy0+yWmhxnVFhEgpY+PWtwTAHSQlSpqYLwu4E29XOhzs1TMWwBlTrRVovaZGrxrBGyN8pCMt+YQ+KISS13Fb3GX/JPRmYwTXzlsX6OEMITJFSUV1A/4jCjqNnhfzUjuaGCzsQRfirdkTYJfEM/qo2bw7x0BX/pzBJDdkf3c12d7ePOYl9uA8GRku7CxI467QpicvGNqdv36i7lXXI5g45xegWfu+xutofBC+aTYnjBz+FR0hxvn0POPzgewLW2DS2QWk+Sdv6siU8jxXQtnxrDGysAKsgg+5VJqCi70d2t1G7iZ6QEMW+IJq1klkTb7LDVMgqEl2oGh+63qWfktjoDuPhQU8wFsxcBFrp31AONBXIht6z9xPJeRQ478zzwhW24mM39XM9WdjttZtKe7ZfxqhBgkgYB1C9Pi0t0vrXgn
x-ms-exchange-transport-forked: True
Content-Type: multipart/mixed;
 boundary="_002_7c86ac0d507e3babfee1ce41ec08a665nextfourcom_"
MIME-Version: 1.0
X-OriginatorOrg: nextfour.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48ac8670-75de-4f18-42e7-08d79d9da417
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2020 11:41:08.8156 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 972e95c2-9290-4a02-8705-4014700ea294
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fnIEho0Jk7IUSVDARf1/DkEWAsJf3mU0Rr77mwZgrGa+ydu9swnA5fVdIfZvmIkUYslpWbRJhg+HUQZgRR2kc+YHshv5Zcb67QrTeEv9540=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB3006
X-Mailman-Approved-At: Mon, 20 Jan 2020 17:09:27 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_002_7c86ac0d507e3babfee1ce41ec08a665nextfourcom_
Content-Type: text/plain; charset="utf-8"
Content-ID: <A2EFCD65355E0D43971A44CAAD2DC3DF@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64

SGksCgpXZSBhcmUgZGV2ZWxvcGluZyBhIGN1c3RvbSByazMzOTkgYmFzZWQgYm9hcmQuIFdlIGhh
dmUgYSBuZWVkIGZvciB0aGUKTUlQSSBwaHkgZGF0YSBsYW5lcyB0byBjb21lIHVwIGluIHN0b3Ag
KExQLTExKSBtb2RlIGFuZCBzdGF5IHRoZXJlIHVudGlsCmNvbW1hbmRlZC4gV2UgYXJlIGludGVy
ZmFjaW5nIGEgVEkgU042NURTSTg0IG1pcGkgdG8gbHZkcyBicmlkZ2UsIGFuZCBpdApkZW1hbmRz
IHRoZSBkYXRhIGxhbmVzIHRvIHN0YXkgaW4gTFAtMTEgc3RhdGUgZm9yIHRoZSB0aW1lIG9mIHRo
ZQppbml0aWFsaXphdGlvbi4KCldoYXQgd2Ugc2VlIG5vdywgaXMgdGhhdCBkYXRhIGxpbmVzIGNv
bWUgb3V0IG9mIExQLTExIGJlZm9yZSB0aGUgYnJpZGdlCmhhcyBjb25maWd1cmVkIGl0c2VsZiwg
d2hpY2ggbGVhZHMgdG8gYnJpZGdlIG1hbGZ1bmN0aW9uLgoKSSBoYXZlIHRyaWVkIHRvIGFkZCBS
SzMzOTlfRFNJMV9GT1JDRVRYU1RPUE1PREUgdG8KZHctbWlwaS1kc2ktcm9ja2NoaXAuYyBsaWtl
IHRoaXMgOgoKwqDCoMKgIMKgwqDCoCAubGFuZWNmZzEgPSBISVdPUkRfVVBEQVRFKFJLMzM5OV9E
U0kxX0ZPUkNFVFhTVE9QTU9ERSwKwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCBS
SzMzOTlfRFNJMV9UVVJORElTQUJMRSB8CsKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKg
wqAgUkszMzk5X0RTSTFfRk9SQ0VUWFNUT1BNT0RFIHwKwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDC
oMKgIMKgwqDCoCBSSzMzOTlfRFNJMV9GT1JDRVJYTU9ERSB8CsKgwqDCoCDCoMKgwqAgwqDCoMKg
IMKgwqDCoCDCoMKgwqAgUkszMzk5X0RTSTFfRU5BQkxFKSwKCmJ1dCB0aGlzIGRvZXNuJ3QgZG8g
dGhlIHRyaWNrLiBIb3cgY291bGQgd2UgcHV0IHRoZSBzdG9wIG1vZGUgb24sIGFuZAphZnRlciBi
cmlkZ2UgY29uZmlnLCBnZXQgcmlkIG9mIGl0PwoKVGhhbmtzLApNaWthIFBlbnR0aWzDpApOZXh0
Zm91ciBHcm91cAoKCg==

--_002_7c86ac0d507e3babfee1ce41ec08a665nextfourcom_
Content-Type: application/pgp-keys; name="pEpkey.asc"
Content-Description: pEpkey.asc
Content-Disposition: attachment; filename="pEpkey.asc"; size=3157;
	creation-date="Mon, 20 Jan 2020 11:41:08 GMT";
	modification-date="Mon, 20 Jan 2020 11:41:08 GMT"
Content-ID: <C69956DB2A9E064597F4C7A9C2F20264@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64

LS0tLS1CRUdJTiBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tDQoNCm1RR05CRnZYMjBRQkRBREhm
U1VzR2tvY2JsMCt0T1R5TXYyYnQxdVZnWVNDN09QQTE5d3FwWXZhTk9ZdjN1d0UNCnUxRmo0QUl3
Tkp1cjZHZWlETzhheXZ0NHlMSzErUnQraGUxQzNlQmJvbnlPNGVIVml5QmdoYkdoN0JsM0xqemEN
CndONVo2WmR0alBzZFVrUTROWGhoWXJDL041QXAwWi80U1VIOWwwMS9LdkgyTy9ERUZwUWVGekFY
TG9DYVBFTnQNCmJ6bnNmdTlGN2VWV3FUa0ZtdTVLNkR3MFJaMzRHNlJQaGtFUG5Uc0VPWkZLbENT
WkJUNFhXZWQ3dys3Y0d1R2YNCmJSVmNzQ3QwSThXNzlEQU12WTl0Qk4wOGVtUXZUeWsrWnF5SUNN
UVFIR0dyVGhpcWVRbVZhNEcxYzBuaW5YWG0NCkNXaHZ4MUxiYUxlOFhuVG4rODV2SndTb092N2NH
R00yUXJGY2sza1A4cGdsbEd1c0hsU0JNUkVwQWEvZmFKVk4NCmJXL1c1TS8yVGtuS3I0YjZjYWNq
NjduOGVTalIxb0VsOVMxR09CM0xSYWRmYlJ2NDhVNXRsRFhtSlEwMHdURlcNCjZNZE5Oc0Q5dnRP
OXJ6UkEyWlhNUnJxTTkxV0RReHdFYW9mTDc5RjU1a3E2eW5FQmJWNEdKbG11TTdHS1h4RWkNCjZw
ZWIvVGNVeUN0YzBzRUFFUUVBQWJRclRXbHJZU0JRWlc1MGRHbHN3NlFnUEcxcGEyRXVjR1Z1ZEhS
cGJHRkENCmJtVjRkR1p2ZFhJdVkyOXRQb2tCMUFRVEFRZ0FQZ0liQXdVTENRZ0hBZ1lWQ2drSUN3
SUVGZ0lEQVFJZUFRSVgNCmdCWWhCRmF0YTJrVEl4ZWtsTWhPWU1RR2VjZnoyd3pGQlFKZHI5Z1VC
UWtEdVc3TUFBb0pFTVFHZWNmejJ3ekYNCmZxME1BS1N1M2hIc1ZOZG1BaUEreDhYU3o4SEhVTnFo
ZVEyM053U2MwZEJleDZibytGdVUwT1hLTmZhODRUZTgNCnpwQ2V5OU80bWY0L0ZyQ09temF5U2xh
a2ZrRFZhQy9lSm5ETTV1Ny9yVy9pZnJ6a1pRMWdjcXpKcTJud1lTUzANCittbDZBcVpOYU9SWEFz
bjlRNkZWZVlFR1BremNNK0pLcGxqQllwTUN0ckhqOG1JSCsxL0JOcGR4VGplVThPTSsNCmpKbTQy
R1RtRXVDZGI3a1M1WXdFcTNTajZ3bXdnOFI3RFpnQTlraG9GMHcyUFdCYi9LNk1NMHZQZjZvTE9o
RFANCk1KTXlaSjQzMUpJQ0FlTFl6V3ZCQitCdCtDYkRqQkpUcFBPYmRhYTd1VnVuOGlUVUJYZEc2
RVNBY3VPUzlTMlENCnBRMkhVV3A1WkZxbWpmb0lCcklWTTFXSnVRZmgrSXBsWTc0MHhVUWVvd2VZ
TVVndVFEekVFSVlPT3ZXNzVrMFANCkdUYUcxSjdJVktuRjcrRHIzcWxUd29vMWVpeVMzakxuYVlH
VWRvS1h5dDVXcythU2liYWlIV1pUUkFQM3R6MWUNClFCUmU0Mml3aVBOUFlVOWNyaTNlMHkxT0VN
M0Rqd0ErMmJGbm05aFEyaGVMQUV6ZkswWTBHMmJ6R00ydWJSN0INCnY2WnBBb2tCMUFRVEFRZ0FQ
aFloQkZhdGEya1RJeGVrbE1oT1lNUUdlY2Z6Mnd6RkJRSmIxOXVMQWhzREJRa0INCjRUT0FCUXNK
Q0FjQ0JoVUtDUWdMQWdRV0FnTUJBaDRCQWhlQUFBb0pFTVFHZWNmejJ3ekZWandMLzM1UzU0dEkN
CmRXT0xGZXUzcHdUT3ZjKzY1SzR4V1l4cE5aMVRxWVltWW9pUG9IUERTT1pnUDlQeEV2eFk3ODZ1
OTV4M0dPekkNCk9WbkFWRkxtYTZPeDdnbEVISThwYkNUZEs0ZTdZb2o0NHdqcWcyeTFoMWl4N2d4
Ny94MEpyU2dadG9oMEJCeG0NCjM4UENTamg1QUtwTGt5ZmlhWktpblJUWE1SejROL0VPSHBKQlJv
eHN5V2U4aFNsUFdGbXpRVE81SGJ5NzdNZ1ENCnAzajRLV1ZNYnUxdWVUQi9HZzgxN2hLTUViWFo5
SnlMYVhmdDIxUjFvYU8zUDdwajhPWk9RN0F5OFBwWTlxbTgNCkVKZHo4R2VIUVZQMEhadHdJMXdZ
YWFYS1FuMzVWRThVU21MNndUZmVtRW55bVFEMWUyYU9nVGNIb1NOR001a3gNCnNuQUd4VjcrK0pr
Njh6K2hBVHpoajJ4SmpKNjRHdGoySlJFNU52T011RG4yM2QrcnlHblZjZmQwcHdTMU9UUEoNCmVK
V3lZb0xCNm1sRUliT2NoUmhaeVFweGNNZktkdkJhTURNK0l2YXo0aWFldDhiWHlVdVhhMXBzR0o2
NGpycUMNCnFiUDBzK2xBLzBPVTBidHNoTjNNWjZCSGxrR3A0WFBhSFFaVVc2dDlPSitrQnhaaXpl
WjRvOTdRWUxrQmpRUmINCjE5dEpBUXdBcmJUTW8wbGFTaG1WODJXV1lBM1NjRmYzT3NyYmt2aTVN
VGxyTkpTUTRjZGhNVmZHeVU2cmlOM2INCjU0OTVFQm1BQ21FRTduWjduQVJyYllUN0E1UENKUFpz
YUU0Mnp3cTNBWjg5MEFvRWpqTEYrU2x1VUJHWmtaeisNCmxMQnhwTHh5aGxxQ2gwaUkyR3JnRVZG
aGtlRExNSkZRT2ZUdm1HeVFRWXUzRllJMlpvNG9CcHFtaXd5WlZOaTgNCllKbUNZSksrMTFZT1I4
U21SVC9nN3c1cG95Mldla3RIZmhJbUdwZE1FUmtUTnp6U3g5cmUra1NmRUlLRWxlQ2ENClhDZjNK
VW4wWU1ZYlY3Z2lnV2RqR0tFYmZIODJYbm1qejFkd2pjcVBoRitUbHhsaHNvTDF3ZGh1eUJCTGpm
SE8NCjEzLzh3YUQwRGxtdFpibmdCSW5kVkJDQmV0Qzl3cDk3MkdQamN5VkFQTHlHUWE5cGs1SklP
Z0lVRWRNcjV0VG8NClkyZ0hqS2pKMzFrUk9FbDhWRnppdGt1K2ZzSXNaYmRQZnFwMmdPVW9xZ1ZF
RGt5M0hZRmlhWnVsek5QVW1ZUlkNCkovR0hvOEFMVThoNE5TdkNkazk3Q3pIdmRrQjEvRThIMTlL
dmswYVpIekZRY0JuaGt6cStuMFpiU2FUSlM3TTQNCmFxUmFJOGY3QUJFQkFBR0pBYndFR0FFSUFD
WUNHd3dXSVFSV3JXdHBFeU1YcEpUSVRtREVCbm5IODlzTXhRVUMNClhhL1lGQVVKQTdsdXh3QUtD
UkRFQm5uSDg5c014WUx4Qy85THUxeGpkVVRkbWQxMC81RXpBMWkwYmROQm9qQlkNCjNQSjRPNGJo
R3BiOUtHbnhzaFRPRVduY05teXk0MHM4YUhMYmRyZ0VWS0N0a1Mra3dBcm1URmptazQ5R3pRaWUN
CnJSTzJjTlUwV2tVZXBjWDl3cjUxcUtTYnJuZDdFMHJ6MHlNbXVXdlJIalJ0ejErRDhkUi9HSmhK
ZFlyRUtxbmwNCnZQVm5yT05qNVp4WFc4d2pzZ1FtczVpTHVWUXp1eVJ5WDRROHhiSFJiYWlsWEVE
TlUrSFRXUjU4YUFtdzRpeWwNCjI4N0x0RHd5VS9JU2M3T3FNMkVzVFBPaFNlWWpPbkxIWnZvdCt1
ZnU2cU9HS2tBaUthTm53TjZwUkprVzF6S1kNCnFuUVJZMEhKNmt5cmoxWmFKdzFONEMzVm9wQkxq
Qy9Qbm44dldBekgzNVJMKzJvaGs0MTY4ZEhhQXJVYVJOV0sNCnF1REFWK3psOGRsR0wySDVVMHlu
cUxCNWtvU0NINHpnUURtY0gycHQyN3pCcXVxNE1ySzNwTC85emduWE9VeWENClZuUGVjTGRHakhS
YTIyS2xkb05WT2Y0MWtJQ2wxTFo2ZllXcXhWWEl2ZUE2N0hTcWlmZHVjVVA5bjUwYVdUeWcNCkZx
L1JFbVVlcmFVV2NZeWRFK0IrNFh0NXlJRi9WL1p3bTBvPQ0KPVoyVkoNCi0tLS0tRU5EIFBHUCBQ
VUJMSUMgS0VZIEJMT0NLLS0tLS0NCg==

--_002_7c86ac0d507e3babfee1ce41ec08a665nextfourcom_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--_002_7c86ac0d507e3babfee1ce41ec08a665nextfourcom_--
