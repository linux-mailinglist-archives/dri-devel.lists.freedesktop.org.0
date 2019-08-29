Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDFDA1C74
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2019 16:12:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 800046E127;
	Thu, 29 Aug 2019 14:12:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 970 seconds by postgrey-1.36 at gabe;
 Thu, 29 Aug 2019 14:12:16 UTC
Received: from rfout2.hes.trendmicro.com (rfout2.hes.trendmicro.com
 [54.67.111.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B0B36E127
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 14:12:16 +0000 (UTC)
Received: from 0.0.0.0_hes.trendmicro.com (unknown [10.64.4.116])
 by rfout2.hes.trendmicro.com (Postfix) with ESMTPS id 05317110A287
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 13:56:05 +0000 (UTC)
Received: from 0.0.0.0_hes.trendmicro.com (unknown [10.64.10.197])
 by rout1.hes.trendmicro.com (Postfix) with SMTP id 117B9EFC078;
 Thu, 29 Aug 2019 13:56:05 +0000 (UTC)
Received: from IND01-MA1-obe.outbound.protection.outlook.com (unknown
 [104.47.100.57])
 by relay1.hes.trendmicro.com (TrendMicro Hosted Email Security) with ESMTPS id
 AD8CBAFA01B; Thu, 29 Aug 2019 13:56:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WU5uZX8GGVYVkdiGCV/sRY6mUIYsXKalY5vp3CeucrXAiWJxqZvg6NQYGVvRgTbd7dz/Uw5963Psqp6u59ffd4xcWQwbys6aEpc+X6s+XpTA7FKDLuUXFVhbQ/ohhZ/L/0KaQ9tWK2vy/KpsP8GWfZYmxH9LqMvtlUhpuqFPlSiI3M+1+Upa/9pFOnIsmK0mr+xnIqSA15B+qo66d+UJtloktF3fGRxOed/FVIBnadPeH5scQ7shTmr/XDxuxobEVOxvQXxkGs2P7YnU2bhANPviubvf2YZweF9r6jiytM0Y3po8LQmtCpg3FFW857K+efi4LBRtMJfPNDMhksu6bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lhW04vdyyUyk3jzPC9n2h/kxKQfVZx7iMcTT7/dXR8c=;
 b=kcnP09ptCqQ8lXjVVs1I4W55bSL919X3NUKoQx3jnsAU9laXO0RH03Ucrb/1Fm+iDRxuIA/ToxTmRvDDf9qwbG8X1RtzFsXryDNpZuRh5miGMaYY3pk/g+qBU34Kow0f/HCzdyPoK2nNE/d7vWDjtZdvucIkHb1AO9/V0ckx1rdQ+UvgUMudDCFcACUpYlTWnGA1cMA2Lfkfln71Rgt9eS8RzYb2FdNnNVXK6bTa4kt1LmevnO8O1r/+D3Uf8GYV54SToq7CXXyEo+LR1G/dHMhyRiRjPx1A4FL18fxMxFmZy7GxNO7fPa69iL/6g/16iq3pXPjk6VudfjcXgV8QQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=thinci.com; dmarc=pass action=none header.from=thinci.com;
 dkim=pass header.d=thinci.com; arc=none
Received: from MA1PR0101MB1157.INDPRD01.PROD.OUTLOOK.COM (52.134.142.22) by
 MA1PR0101MB1544.INDPRD01.PROD.OUTLOOK.COM (52.134.142.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.18; Thu, 29 Aug 2019 13:55:58 +0000
Received: from MA1PR0101MB1157.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::dc45:5527:fe51:b7f2]) by MA1PR0101MB1157.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::dc45:5527:fe51:b7f2%9]) with mapi id 15.20.2199.021; Thu, 29 Aug 2019
 13:55:58 +0000
From: Matt Redfearn <matt.redfearn@thinci.com>
To: Andrzej Hajda <a.hajda@samsung.com>, John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH v2] drm/bridge: adv7511: Attach to DSI host at probe time
Thread-Topic: [PATCH v2] drm/bridge: adv7511: Attach to DSI host at probe time
Thread-Index: AQHVLPuBf6e2UB9VrkOb0fCrDf7+WqcDYKAAgAxqToCAALkGgIACBQMA
Date: Thu, 29 Aug 2019 13:55:58 +0000
Message-ID: <83dbc355-790a-3940-9fc3-fa9567d4c3bf@thinci.com>
References: <20190627151740.2277-1-matt.redfearn@thinci.com>
 <CALAqxLUsf4HJBcAcd+qzycFC3d8XbKk9HyQ7FfCrH8Ewc3mzvw@mail.gmail.com>
 <CGME20190827200326epcas3p4628e49747ff7e20b5451cb6e33235dc6@epcas3p4.samsung.com>
 <CALAqxLVtzQSgVL0B0M2RNB_U-TvNs7+C=k6VUk0VJywdgJbNFQ@mail.gmail.com>
 <7b7736ed-6cf1-d7ab-ae03-83b70b351261@samsung.com>
In-Reply-To: <7b7736ed-6cf1-d7ab-ae03-83b70b351261@samsung.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0049.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::13) To MA1PR0101MB1157.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:2c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [213.106.91.208]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0168f2ee-118c-4592-2a5a-08d72c889e94
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MA1PR0101MB1544; 
x-ms-traffictypediagnostic: MA1PR0101MB1544:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MA1PR0101MB1544D3173156C525C66BC5CBF1A20@MA1PR0101MB1544.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0144B30E41
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(39840400004)(346002)(366004)(136003)(376002)(199004)(189003)(53754006)(81156014)(81166006)(6512007)(11346002)(2616005)(476003)(76176011)(386003)(6506007)(102836004)(25786009)(53936002)(6246003)(4326008)(3846002)(6116002)(5024004)(486006)(256004)(14444005)(53546011)(446003)(99286004)(2906002)(6436002)(7416002)(478600001)(31686004)(8676002)(7736002)(36756003)(305945005)(316002)(31696002)(66446008)(64756008)(71190400001)(66946007)(71200400001)(66556008)(66476007)(52116002)(186003)(26005)(5660300002)(6486002)(229853002)(54906003)(66066001)(14454004)(8936002)(110136005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MA1PR0101MB1544;
 H:MA1PR0101MB1157.INDPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: thinci.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Ekkx8ZKQe5S/sgG/ZTodWfp3Zi0LhtzKz7jA3sqyyeuY4G3OY1LL1heyzMQASkmnJKzJ7CVr+R1SW+ZVUynIdL9Vo9Z/CZIaKTYIC2qs4pSihcOVQBzPZBP0k6YNmeQMn+xPIGXJ9t1Q3DogXpV2MtOtyXhrV/eNWsP9VteV5cL/FTwgrYD2TSVZ/yqgqjHGkBew7wmUUIdZ6oLqDIzPMsKXnTuvYBJAc9iXQwwI1pLPLuk29ZQN1hYmgyeWTrZ5tqLHR+eVwFfj3eWHLfSQYbC6sYVRaGhLua16Pw+iQ9lzs8QFfXE5tf18zg0Vw0uWNpnVVkGiRV1HExCHLcXEsNwzjEymhFedwyNG941IAGt9lGSmTm9q2D1DwK3083rkIjaKA4zrXadxCRVB/52AE2nXGztkYVogowVoMCvnJqE=
Content-ID: <6269D30CC083BE4AB1F04413C2A7B513@INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: thinci.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0168f2ee-118c-4592-2a5a-08d72c889e94
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2019 13:55:58.6118 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9d1c3c89-8615-4064-88a7-bb1a8537c779
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1vErukf/wTtmqkWhFBtpw3rjmFaod9KJl2Hf7wwn5jNWeYrJDqLZV7rr3o2PE0Js9sigYggy+EGABwAUGeTZqFB8NkuzEgpbKJ1UWeNT0bY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA1PR0101MB1544
X-TMASE-Version: StarCloud-1.3-8.5.1020-24876.007
X-TMASE-Result: 10--20.022700-4.000000
X-TMASE-MatchedRID: x2HXvaraFonmLzc6AOD8DfHkpkyUphL9SeIjeghh/zPI13IEGi/KkyUK
 s+aXgMyjBCJmNbrkQwGcrsdAk7L4CtJGUnV5uUQkvOAv94sAIMQsUWjPAeWLoceQfu6iwSfsqU7
 Z6SqUMjp3GWoCrrIz3m9B/Mr/PxUf3hX0rxG54rQ/dmr18jDpdIbetYyAIAndRjHvrQ40Nxbr0W
 FAxQ6paOjFWkoAvZU3XdvTetpAkbYs6FBV2DQWB8jz0VPUnBA1+IfriO3cV8QnzvR+mP3cviU6o
 Uw3uoPHVDUZoCgDcHckV7sNrtYQjBYmQPJ29t10AjZKqJCAyXkQAiYeAVgD3g82uCvKa/W3eLX1
 WZ155N6vuwvt7wERymiu9ucBHnw+tIwr4+JqLn2a+cpJvTbSHNFTR6mnbN4Lea+vcRhRJ0Azn85
 L9kDJDAi399JDtZNFMSPjUMycTXeBv8gzkmASmx23b+lJHvPArkGhd90/DD4C/nuPl5P0FmIA8S
 iylTuqNpfoTUECEG3lXNMoACM6DT+bcMAaG0neN+75FOVyJeD+KQH+alYPp4dNBdz0Uj9LngIgp
 j8eDcAtF6rzS51sWQpz7p6N8xf0+ZL5o+vRV7yhMIDkR/KfwI2j49Ftap9Eymsk/wUE4hoD/dHy
 T/Xh7Q==
X-TM-Deliver-Signature: 545568F033994A95A5ECAF9FED988800
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=thinciit.onmicrosoft.com; s=selector2-thinciit-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lhW04vdyyUyk3jzPC9n2h/kxKQfVZx7iMcTT7/dXR8c=;
 b=rCoITx03QegiDDtFXD4KyHk2bvZusjwyd+ycDCRwuqK9TPy6vYEdLV9v/d1VKqP0ghHR+UWZtiH//oDgrAEVtNTYly8l10sed3PnN4H4j7NSuSdhW0FuFxoyaO5W3wPKIKOrgykxengUNg+sM5aLRlS8hxmDsTVCMfLVmBi7mc0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=matthew.redfearn@thinci.com; 
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Matthew Redfearn <matthew.redfearn@thinci.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCk9uIDI4LzA4LzIwMTkgMDg6MDUsIEFuZHJ6ZWogSGFqZGEgd3JvdGU6DQo+IE9uIDI3LjA4
LjIwMTkgMjI6MDMsIEpvaG4gU3R1bHR6IHdyb3RlOg0KPj4gT24gTW9uLCBBdWcgMTksIDIwMTkg
YXQgMzoyNyBQTSBKb2huIFN0dWx0eiA8am9obi5zdHVsdHpAbGluYXJvLm9yZz4gd3JvdGU6DQo+
Pj4gT24gVGh1LCBKdW4gMjcsIDIwMTkgYXQgODoxOCBBTSBNYXR0IFJlZGZlYXJuIDxtYXR0LnJl
ZGZlYXJuQHRoaW5jaS5jb20+IHdyb3RlOg0KPj4+PiBJbiBjb250cmFzdCB0byBhbGwgb2YgdGhl
IERTSSBwYW5lbCBkcml2ZXJzIGluIGRyaXZlcnMvZ3B1L2RybS9wYW5lbA0KPj4+PiB3aGljaCBh
dHRhY2ggdG8gdGhlIERTSSBob3N0IHZpYSBtaXBpX2RzaV9hdHRhY2goKSBhdCBwcm9iZSB0aW1l
LCB0aGUNCj4+Pj4gQURWNzUzMyBicmlkZ2UgZGV2aWNlIGRvZXMgbm90LiBJbnN0ZWFkIGl0IGRl
ZmVycyB0aGlzIHRvIHRoZSBwb2ludCB0aGF0DQo+Pj4+IHRoZSB1cHN0cmVhbSBkZXZpY2UgY29u
bmVjdHMgdG8gaXRzIGJyaWRnZSB2aWEgZHJtX2JyaWRnZV9hdHRhY2goKS4NCj4+Pj4gVGhlIGdl
bmVyaWMgU3lub3BzeXMgTUlQSSBEU0kgaG9zdCBkcml2ZXIgZG9lcyBub3QgcmVnaXN0ZXIgaXQn
cyBvd24NCj4+Pj4gZHJtX2JyaWRnZSB1bnRpbCB0aGUgTUlQSSBEU0kgaGFzIGF0dGFjaGVkLiBC
dXQgaXQgZG9lcyBub3QgY2FsbA0KPj4+PiBkcm1fYnJpZGdlX2F0dGFjaCgpIG9uIHRoZSBkb3du
c3RyZWFtIGRldmljZSB1bnRpbCB0aGUgdXBzdHJlYW0gZGV2aWNlDQo+Pj4+IGhhcyBhdHRhY2hl
ZC4gVGhpcyBsZWFkcyB0byBhIGNoaWNrZW4gYW5kIHRoZSBlZ2cgZmFpbHVyZSBhbmQgdGhlIERS
TQ0KPj4+PiBwaXBlbGluZSBkb2VzIG5vdCBjb21wbGV0ZS4NCj4+Pj4gU2luY2UgYWxsIG90aGVy
IG1pcGlfZHNpX2RldmljZSBkcml2ZXJzIGNhbGwgbWlwaV9kc2lfYXR0YWNoKCkgaW4NCj4+Pj4g
cHJvYmUoKSwgbWFrZSB0aGUgYWR2NzUzMyBtaXBpX2RzaV9kZXZpY2UgZG8gdGhlIHNhbWUuIFRo
aXMgZW5zdXJlcyB0aGF0DQo+Pj4+IHRoZSBTeW5vcHN5cyBNSVBJIERTSSBob3N0IHJlZ2lzdGVy
cyBpdCdzIGJyaWRnZSBzdWNoIHRoYXQgaXQgaXMNCj4+Pj4gYXZhaWxhYmxlIGZvciB0aGUgdXBz
dHJlYW0gZGV2aWNlIHRvIGNvbm5lY3QgdG8uDQo+Pj4+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IE1h
dHQgUmVkZmVhcm4gPG1hdHQucmVkZmVhcm5AdGhpbmNpLmNvbT4NCj4+Pj4NCj4+Pj4gLS0tDQo+
Pj4gQXMgYSBoZWFkcyB1cCwgSSBqdXN0IGRpZCBzb21lIHRlc3Rpbmcgb24gZHJtLW1pc2MtbmV4
dCBhbmQgdGhpcyBwYXRjaA0KPj4+IHNlZW1zIHRvIGJlIGJyZWFraW5nIHRoZSBIaUtleSBib2Fy
ZC4gIE9uIGJvb3R1cCwgSSdtIHNlZWluZzoNCj4+PiBbICAgIDQuMjA5NjE1XSBhZHY3NTExIDIt
MDAzOTogMi0wMDM5IHN1cHBseSBhdmRkIG5vdCBmb3VuZCwgdXNpbmcNCj4+PiBkdW1teSByZWd1
bGF0b3INCj4+PiBbICAgIDQuMjE3MDc1XSBhZHY3NTExIDItMDAzOTogMi0wMDM5IHN1cHBseSBk
dmRkIG5vdCBmb3VuZCwgdXNpbmcNCj4+PiBkdW1teSByZWd1bGF0b3INCj4+PiBbICAgIDQuMjI0
NDUzXSBhZHY3NTExIDItMDAzOTogMi0wMDM5IHN1cHBseSBwdmRkIG5vdCBmb3VuZCwgdXNpbmcN
Cj4+PiBkdW1teSByZWd1bGF0b3INCj4+PiBbICAgIDQuMjMxODA0XSBhZHY3NTExIDItMDAzOTog
Mi0wMDM5IHN1cHBseSBhMnZkZCBub3QgZm91bmQsIHVzaW5nDQo+Pj4gZHVtbXkgcmVndWxhdG9y
DQo+Pj4gWyAgICA0LjIzOTI0Ml0gYWR2NzUxMSAyLTAwMzk6IDItMDAzOSBzdXBwbHkgdjNwMyBu
b3QgZm91bmQsIHVzaW5nDQo+Pj4gZHVtbXkgcmVndWxhdG9yDQo+Pj4gWyAgICA0LjI0NjYxNV0g
YWR2NzUxMSAyLTAwMzk6IDItMDAzOSBzdXBwbHkgdjFwMiBub3QgZm91bmQsIHVzaW5nDQo+Pj4g
ZHVtbXkgcmVndWxhdG9yDQo+Pj4gWyAgICA0LjI3Mjk3MF0gYWR2NzUxMSAyLTAwMzk6IGZhaWxl
ZCB0byBmaW5kIGRzaSBob3N0DQo+Pj4NCj4+PiBvdmVyIGFuZCBvdmVyLiAgVGhlIGR1bW15IHJl
Z3VsYXRvciBtZXNzYWdlcyBhcmUgbm9ybWFsLCBidXQgdXN1YWxseQ0KPj4+IFsgICAgNC40NDQz
MTVdIGtpcmluLWRybSBmNDEwMDAwMC5hZGU6IGJvdW5kIGY0MTA3ODAwLmRzaSAob3BzIGRzaV9v
cHMpDQo+Pj4NCj4+PiBTdGFydHMgdXAgcmlnaHQgYWZ0ZXJ3YXJkLg0KPj4gSGV5IE1hdHQsIEFu
ZHJ6ZWosDQo+PiAgICBJIGp1c3Qgd2FudGVkIHRvIGZvbGxvdyB1cCBvbiB0aGlzIGFzIHRoaXMg
cGF0Y2ggaXMgYnJlYWtpbmcgYQ0KPj4gY291cGxlIG9mIGJvYXJkcy4gQW55IHNlbnNlIG9mIHdo
YXQgbWlnaHQgYmUgbWlzc2luZywgb3IgaXMgdGhpcw0KPj4gc29tZXRoaW5nIHdlIHNob3VsZCBy
ZXZlcnQ/DQo+Pg0KPj4gSSdtIGhhcHB5IHRvIHRlc3QgYW55IHBhdGNoIGlkZWFzIHlvdSBoYXZl
Lg0KPiANCj4gDQo+IEkgZ3Vlc3MgdGhpcyBpcyBjaXJjdWxhciBkZXBlbmRlbmN5IGlzc3VlOg0K
PiANCj4gLSBhZHYgd2FpdHMgZm9yIGRzaS1ob3N0LCB0aGVuIGl0IGNyZWF0ZXMgZHJtX2JyaWRn
ZSwNCj4gDQo+IC0gZHNpLWRyaXZlciB3YWl0cyBmb3IgZHJtX2JyaWRnZSwgdGhlbiBpdCBjcmVh
dGVzIGRzaSBob3N0Lg0KPiANCj4gDQo+IFRoZSBwYXRjaCBpbnRyb2R1Y2VzIHByb3BlciBvcmRl
cjoNCj4gDQo+IC0gMXN0IHdlIHNob3VsZCByZWdpc3RlciBkZXZpY2VzIGJ1c2VzLA0KPiANCj4g
LSB0aGVuIHdlIHNob3VsZCB3YWl0IGZvciBkcm0gY29tcG9uZW50cy4NCj4gDQo+IA0KPiBTbyB0
aGUgYmVzdCBzb2x1dGlvbiB3b3VsZCBiZSB0byBmaXggZjQxMDc4MDAuZHNpIGRyaXZlciAtIGl0
IHNob3VsZG4ndA0KPiBsb29rIGZvciBkcm1fYnJpZGdlIGluIHByb2JlLCBpbnN0ZWFkIGl0IHNo
b3VsZCByZWdpc3RlciBkc2lfaG9zdCwgYW5kDQo+IGluIGRzaSBob3N0IGF0dGFjaCBjYWxsYmFj
ayBsb29rIGZvciBkcm1fYnJpZGdlLCB0aGVuIGNhbGwgY29tcG9uZW50X2FkZA0KPiAoaWYgYWxs
IHJlcXVpcmVkIHJlc291cmNlcyBhcmUgZ2F0aGVyZWQpLCBzZWUNCj4gZHdfbWlwaV9kc2lfcm9j
a2NoaXBfaG9zdF9hdHRhY2ggZm9yIGV4YW1wbGUuDQoNCkhpIGFsbCwNCg0KU29ycnkgdGhhdCBt
eSBwYXRjaCBzZWVtcyB0byBoYXZlIGJyb2tlbiB0aGluZ3MuIEl0IHdhcyB1c2luZyB0aGUgDQpn
ZW5lcmljIHN5bm9wc3lzIGRzaSBkcml2ZXIgDQooZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5v
cHN5cy9kdy1taXBpLWRzaS5jKSB0aGF0IEkgZm91bmQgdGhlIA0KY2lyY3VsYXIgZGVwZW5kZW5j
eSBmaXhlZCBieSBteSBwYXRjaC4NCg0KSXQgYXBwZWFycyB0aGF0IHRoZSBwYXRjaCBoYXMgYnJv
a2VuIHRoaW5ncyBmb3IgdGhlIHBsYXRmb3JtIHNwZWNpZmljIA0Kc3lub3BzeXMgZHNpIGRyaXZl
ciBmb3IgS2lyaW4uIFNvIGFub3RoZXIgYXBwcm9hY2ggKHRob3VnaCBhIGxvdCBtb3JlIA0Kd29y
aykgd291bGQgYmUgdG8gc3dpdGNoIEtpcmluIG92ZXIgdG8gdXNpbmcgdGhlIGdlbmVyaWMgc3lu
b3BzeXMgZHNpIA0KZHJpdmVyIHNvIHRoYXQgd2UgaGF2ZSBsZXNzIHJlZHVuZGFuY3kgaW4gdGhl
IHRyZWUuDQoNClRoYW5rcywNCk1hdHQNCg0KPiANCj4gDQo+IFJlZ2FyZHMNCj4gDQo+IEFuZHJ6
ZWoNCj4gDQo+IA0KPiANCj4+DQo+PiB0aGFua3MNCj4+IC1qb2huDQo+Pg0KPj4NCj4gDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
