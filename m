Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7848F1AB905
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 09:00:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 377886EAF8;
	Thu, 16 Apr 2020 06:59:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail1.bemta23.messagelabs.com (mail1.bemta23.messagelabs.com
 [67.219.246.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F00D46EA94
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 21:51:29 +0000 (UTC)
Received: from [100.112.5.244] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-4.bemta.az-c.us-east-1.aws.symcld.net id E8/BA-23081-AD1879E5;
 Wed, 15 Apr 2020 21:51:22 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA1VTf1CTZRzneX+MF+PlXsaEh9m8WsiZ1xZrRi9
 dEKHe7S5Iu6I/SKkXmGwJG+0dOrIfs0yjSY0jmcDpBgoYoSgU/UAsMYaDsAIM2xWCLHWTmsGp
 E416370n1T/PfT7fz+f76+77EKj4jkhKaC1mrcnAlMhFS7Di5QFc4d3hyE9x+R6gq856EPrrc
 UgPz17D6b+7q1F67HpQRM8MOBC6dbQD0I21rdzz52cYvauyBacPt+0D9Kcz1XhmtKb3hgvTuD
 rLNZ1tlSLN5zcmcc0Bz7OaC7YBRBM8eU6k6RravoHIw/WGAqPlZVw3HUosq3zc8sOIB7WCw2n
 vgyWEmLIisKmlQSSQAICOwT3oonL8TgAI5DaAo4HhSJ4AqhmF8zvrEIG4MXjF3oIK5BiAtvm5
 cA5G9aDw1EQIFwp8iMDu0HdcnyiO/MrZzqTyWESthM6GOozHEsoMG93+cAJKHUfh1ME9OC/EU
 QZYveDlGhKcyQhnz6wX/FnQ21WL8hijVsCrDUcRHpPURhgMjgOhlxOBY36KT42iMuD0zXQ+DK
 h4eHOwPWxHqQTo9TnDGFIUPHTie1TAS6F/egEX/LnQ28tPQ3Dx++DcJ1sFiwyOOG1AwDlw4JA
 tUsCrYL99r0jAT8D+yy5MSE2CC30VQngL/HJuIdIO1PX/GaKec6HUg7Djq4eF8P3wI9tUZH14
 rVjoqfNhLoC1gdQCk75YZy5l9CUKVUqKQqV6RLFaoVI/pmReUxQqy1mFlmHNCpWS2cYq2YrSw
 pIipUFr7gTcCRaVYZVfgItHgso+kEgg8qWkUe/IF8cUGIsqdAyre8lUXqJl+8C9BCGH5M9WTo
 s1aYu1ls36Eu6Q78qQiJZLyKO8TLJlTCmrLxakQaAm7P79TSjx7f7mJlSMGYwGrTSBjOOtFG/
 VlRsWC939FCNAJo0jQUREhDi6TGsq1Zv/rwdAAgHkcWQ3XyVabzAv9uOulttCQr6YGR7FzPwr
 Sa3IW4/emlvWn5OZtNt3+nJhWqvLrZZl1XQ0Zn+8adCa5zjd7ajWeHfFjNUlm565vfvAvD/6Z
 PKTI0N/4dt/qoqt0gWnZ0OFb+yIr61KN1+fkKanZaxZe2vU9NvzMz2wfcNVmVcr0/1y4m21p7
 KX9iYY5t09ypY/8tisc+viJFO+cemVV3z2rSvGbVEzA5cOSt58KJsRf/Cju2tz7lPrEpbNvlN
 //sLQzoU1YOJa6rFvGoPZqzPoS90vHDnVqw7hEYnmi7pt2Yb1IJAck/Nq87uvK1d6kS1JT0/d
 I/HWbMz9/bn3nNbJ+Bp3ExXfqCxlSWe7Ze/Z5eeHh9L3bbLmu2UF0km8Vo6xOka1CjWxzD/Ln
 qJTjwQAAA==
X-Env-Sender: mpearson@lenovo.com
X-Msg-Ref: server-8.tower-406.messagelabs.com!1586987479!1621975!1
X-Originating-IP: [103.30.234.5]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.50.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16438 invoked from network); 15 Apr 2020 21:51:22 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.5)
 by server-8.tower-406.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Apr 2020 21:51:22 -0000
Received: from HKGWPEMAIL04.lenovo.com (unknown [10.128.3.72])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id 6A36FB0FC75E105D7876;
 Thu, 16 Apr 2020 05:51:19 +0800 (CST)
Received: from HKGWPEMAIL04.lenovo.com (10.128.3.72) by
 HKGWPEMAIL04.lenovo.com (10.128.3.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1779.2; Thu, 16 Apr 2020 05:51:41 +0800
Received: from HKEXEDGE01.lenovo.com (10.128.62.71) by HKGWPEMAIL04.lenovo.com
 (10.128.3.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.1779.2 via Frontend
 Transport; Thu, 16 Apr 2020 05:51:41 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (104.47.125.54)
 by mail.lenovo.com (10.128.62.71) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.1779.2; Thu, 16 Apr
 2020 05:51:18 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bfS030W+Lji9JtRhQwbjyA78u1h6Df9oX2GrP09HMQoaq8Xl0f36DgWL6NrI5ouxrfqVFSGfvtmNzd/P+4FrjsDxLbkjeYt8fBUH8LmzO15Z2DO8UbhblahoIGzAIOPO+UdnhVKggllUtBSIRuXoLbDUy9Zy2yY9wxYeSFo/IXXPdolNLq45ffn1awWVzbk8gSHdY2ajbI5uCcOaQAqgC5VwLXvFgrN93hfnDhNUj4wnSCqfEM9zZbDoOZACT3l0GmOMGrHJccer72U7citLyGA7/ctWVGZJGCkXeohFmbZkPg3xJopHIhc5koSxuFBHGXeOlkjypq/9YTHSY/AbVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PqmDl3uPlSSYJrHOL3Cnbd01gLjDdENiEhMaPqx9w3s=;
 b=oNwYhpQxz9kHydTZXURxI/H/mplAWRpJMns9i2SLJO1Y0hpXHzJWiGpl0DU2VFDeU7FAelupXo68dln5G/0JIEOCaWwsp0Ktl6tdiwuantvPiSxPY929Rub5YL+5+WiDdXsh+XAy/mN4bcAFUaSaRNw4A1LkcY7xZY6VwhJxPVTvT1pNZUXHccIve19fBVJ1ZSC4MKplneF0tLJcHP+YJ/AgKWUxiF1RX61fbhes2XSzOEOJUDpHZ5m9lCgzFTMYuFTgjBWqsBYD8k1/3W2B5X3vwYf3ACMvYYL8fQGDDHb4Rlv7PNkGywE6vWISq/mjpRSW5UsMs6KTtYSf3DATaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lenovo.com; dmarc=pass action=none header.from=lenovo.com;
 dkim=pass header.d=lenovo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=LenovoBeijing.onmicrosoft.com; s=selector2-LenovoBeijing-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PqmDl3uPlSSYJrHOL3Cnbd01gLjDdENiEhMaPqx9w3s=;
 b=pcZ9UJDn245mXyMOARmEFvp8Pm4xS5TPJ+eOKqIou4w5b8ltVVPjUQVUbhzmL+W5M0XFsHfxftAfAA5rlwQbFld1U4XHsFvsatySUFlzvtIuZuAlDmWYtQieJ1FTxO3k6ZI3fzELMLuIycD4qHWLocfo4WmWR1TdZoa09s+0vaQ=
Received: from SG2PR03MB3324.apcprd03.prod.outlook.com (20.177.12.140) by
 SG2PR03MB4040.apcprd03.prod.outlook.com (20.177.95.78) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2921.21; Wed, 15 Apr 2020 21:51:17 +0000
Received: from SG2PR03MB3324.apcprd03.prod.outlook.com
 ([fe80::3417:bbb:2260:50f6]) by SG2PR03MB3324.apcprd03.prod.outlook.com
 ([fe80::3417:bbb:2260:50f6%4]) with mapi id 15.20.2921.024; Wed, 15 Apr 2020
 21:51:17 +0000
From: Mark Pearson <mpearson@lenovo.com>
To: Hans de Goede <hdegoede@redhat.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Rajat Jain <rajatja@google.com>
Subject: RE: [External] Re: RFC: Drm-connector properties managed by another
 driver / privacy screen support
Thread-Topic: [External] Re: RFC: Drm-connector properties managed by another
 driver / privacy screen support
Thread-Index: AQHWE1rlGOF50eGZBkWkqbN2jA9AQ6h6rcMAgAADKoCAAAGy0A==
Date: Wed, 15 Apr 2020 21:51:17 +0000
Message-ID: <SG2PR03MB3324788D668B20594E6463FBBDDB0@SG2PR03MB3324.apcprd03.prod.outlook.com>
References: <783240e9-e8d1-fc28-6c11-14c8f8e35cfa@redhat.com>
 <87tv1k4vl6.fsf@intel.com> <d47ba6ef-efd0-9f28-1ae4-b971b95a8f8b@redhat.com>
 <CACK8Z6HZe0iiyYUR57LvQVJjZCt+dbK9Vc9Tr+Ch8fUuh0h-gw@mail.gmail.com>
 <87pnc84frl.fsf@intel.com> <895edf22-8138-b3c7-52e8-5a46588badd4@redhat.com>
In-Reply-To: <895edf22-8138-b3c7-52e8-5a46588badd4@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.48.229.51]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ff881616-870d-434b-4400-08d7e187205c
x-ms-traffictypediagnostic: SG2PR03MB4040:
x-ld-processed: 5c7d0b28-bdf8-410c-aa93-4df372b16203,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SG2PR03MB4040445B87DCA5D3B6F014EABDDB0@SG2PR03MB4040.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0374433C81
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR03MB3324.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(376002)(346002)(396003)(39860400002)(366004)(136003)(86362001)(186003)(66556008)(2906002)(9686003)(64756008)(66446008)(55016002)(26005)(66946007)(66476007)(8676002)(5660300002)(7416002)(52536014)(81156014)(8936002)(33656002)(71200400001)(316002)(54906003)(6506007)(478600001)(110136005)(107886003)(76116006)(4326008)(53546011)(7696005);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: lenovo.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZXNiSsd8rm1iG7B335CVmZ01rQSRxZFCQkx3VOmm6B5VInnSJkJ718awimECjAKy/6gPxKcYjKkDDLcuQL313B9C30OwB1fUJ0poIZyXt5hiNQ6VYdXOC9IS304R4FIQYG7AXV3QOsRgIeEeTjOohUAC+jy62kCiLgQGjsfNcz5tBFZSG1TdI9KWHHacKS16v+FcCv7Nw/ZglBYOGd10wrCyu1rqlzELM030s2k0apm8AfKicnfG4QJD2UBtlhX6zOVhYL2aIrN1e1tBH9Tql/Pq8lhBBKjbpclRkmYp2RwtrJxXDeK3xGjaht7GtiuReIG943A3U74uuREWrWJQN2txp18MFyrG8QsHG/0baqEdHsMx21e6US1EDcqZR5ywqndxATDx4GMv585Anr6mcj4k+PVVgwHQe5hubjKn+R63UatkyFx/Dm+s5n1WzrvL
x-ms-exchange-antispam-messagedata: eK5si2lzTuH7Voc/+nqifQPpUT9vdBq8HFT7FaTPNi4ZaKWQ8Rn1mDZ6QuCdIMtVJ+Jd7htXxPnqeTczlJyUKGJIGD/V+TPJx1LBIc+228c3Sh7tD54taYUXbgApEtn7Lb6au+nHEV3DDBnsM3N0+w==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ff881616-870d-434b-4400-08d7e187205c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2020 21:51:17.5586 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3NQzzK6EiV6g5XMmuw7Vq5rzI4EdMU+1C/QIukTsYq2ilXmzBgnqnuiJ24qOg0czipb1sv91NMAgAtAuqgMsSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB4040
X-OriginatorOrg: lenovo.com
X-Mailman-Approved-At: Thu, 16 Apr 2020 06:59:07 +0000
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Christian Kellner <ckellner@redhat.com>, Javier Martinez
 Canillas <javierm@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Nitin Joshi1 <njoshi1@lenovo.com>, Benjamin Berg <bberg@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSGFucyBkZSBHb2Vk
ZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCBBcHJpbCAxNSwgMjAy
MCA1OjIxIFBNDQo+IA0KPiBIaSwNCj4gDQo+IE9uIDQvMTUvMjAgMTE6MTAgUE0sIEphbmkgTmlr
dWxhIHdyb3RlOg0KPiA+IE9uIFdlZCwgMTUgQXByIDIwMjAsIFJhamF0IEphaW4gPHJhamF0amFA
Z29vZ2xlLmNvbT4gd3JvdGU6DQo+ID4+IEhlbGxvLA0KPiA+Pg0KPiA+PiBPbiBXZWQsIEFwciAx
NSwgMjAyMCBhdCA4OjQwIEFNIEhhbnMgZGUgR29lZGUNCj4gPGhkZWdvZWRlQHJlZGhhdC5jb20+
IHdyb3RlOg0KPiA+Pj4NCj4gPj4+IEhpLA0KPiA+Pj4NCj4gPj4+IE9uIDQvMTUvMjAgNToyOCBQ
TSwgSmFuaSBOaWt1bGEgd3JvdGU6DQo+ID4+Pj4gT24gV2VkLCAxNSBBcHIgMjAyMCwgSGFucyBk
ZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4NCj4gd3JvdGU6DQo+ID4+Pj4+IGlpLiBDdXJy
ZW50bHkgdGhlICJwcml2YWN5LXNjcmVlbiIgcHJvcGVydHkgYWRkZWQgYnkgUmFqYXQncw0KPiA+
Pj4+PiBwYXRjaC1zZXQgaXMgYW4gZW51bSB3aXRoIDIgcG9zc2libGUgdmFsdWVzOg0KPiA+Pj4+
PiAiRW5hYmxlZCINCj4gPj4+Pj4gIkRpc2FibGVkIg0KPiA+Pj4+Pg0KPiA+Pj4+PiBXZSBjb3Vs
ZCBhZGQgYSB0aGlyZCB2YWx1ZSAiTm90IEF2YWlsYWJsZSIsIHdoaWNoIHdvdWxkIGJlIHRoZQ0K
PiA+Pj4+PiBkZWZhdWx0IGFuZCB0aGVuIGZvciBpbnRlcm5hbCBwYW5lbHMgYWx3YXlzIGFkZCB0
aGUgcHJvcGVydHkNCj4gPj4+Pj4gc28gdGhhdCB3ZSBhdm9pZCB0aGUgcHJvYmxlbSB0aGF0IGRl
dGVjdGluZyBpZiB0aGUgbGFwdG9wIGhhcw0KPiA+Pj4+PiBhbiBpbnRlcm5hbCBwcml2YWN5IHNj
cmVlbiBuZWVkcyB0byBiZSBkb25lIGJlZm9yZSB0aGUgY29ubmVjdG9yDQo+ID4+Pj4+IGlzIHJl
Z2lzdGVyZWQuIFRoZW4gd2UgY2FuIGFkZCBzb21lIGhvb2tzIHdoaWNoIGFsbG93IGFuDQo+ID4+
Pj4+IGxjZHNoYWRvdy1kcml2ZXIgdG8gcmVnaXN0ZXIgaXRzZWxmIGFnYWluc3QgYSBjb25uZWN0
b3IgbGF0ZXINCj4gPj4+Pj4gKHdoaWNoIGlzIG5vbiB0cml2aWFsIHdydCBwcm9iZSBvcmRlciwg
YnV0IGxldHMgaWdub3JlIHRoYXQgZm9yIG5vdykuDQo+ID4+Pj4NCj4gPj4+PiBJIHJlZ3JldCBk
cm9wcGluZyB0aGUgYmFsbCBvbiBSYWphdCdzIHNlcmllcyAoc29ycnkhKS4NCj4gPj4+Pg0KPiA+
Pj4+IEkgZG8gdGhpbmsgaGF2aW5nIHRoZSBjb25uZWN0b3IgcHJvcGVydHkgZm9yIHRoaXMgaXMg
dGhlIHdheSB0byBnby4NCj4gPj4+DQo+ID4+PiBJIDEwMCUgYWdyZWUuDQo+ID4+Pg0KPiA+Pj4+
IEV2ZW4NCj4gPj4+PiBpZiB3ZSBjb3VsZG4ndCBuZWNlc3NhcmlseSBmaWd1cmUgb3V0IGFsbCB0
aGUgZGV0YWlscyBvbiB0aGUga2VybmVsDQo+ID4+Pj4gaW50ZXJuYWwgY29ubmVjdGlvbnMsIGNh
biB3ZSBzZXR0bGUgb24gdGhlIHByb3BlcnR5IHRob3VnaCwgc28gd2UgY291bGQNCj4gPj4+PiBt
b3ZlIGZvcndhcmQgd2l0aCBSYWphdCdzIHNlcmllcz8NCj4gPj4NCj4gPj4gVGhhbmtzLCBpdCB3
b3VsZCBiZSBncmVhdCEuDQo+ID4+DQo+ID4+Pg0KPiA+Pj4gWWVzIHBsZWFzZSwgdGhpcyB3aWxs
IGFsc28gYWxsb3cgdXMgdG8gbW92ZSBmb3J3YXJkIHdpdGggdXNlcnNwYWNlDQo+ID4+PiBzdXBw
b3J0IGV2ZW4gaWYgZm9yIHRlc3RpbmcgdGhhdCB3ZSBkbyBzb21lIGhhY2tzIGZvciB0aGUga2Vy
bmVsJ3MNCj4gPj4+IGludGVybmFsIGNvbm5lY3Rpb25zIGZvciBub3cuDQo+ID4+Pg0KPiA+Pj4+
IE1vcmVvdmVyLCBkbyB3ZSBhY3R1YWxseSBuZWVkIHR3byBwcm9wZXJ0aWVzLCBvbmUgd2hpY2gg
Y291bGQNCj4gaW5kaWNhdGUNCj4gPj4+PiB1c2Vyc3BhY2UncyBkZXNpcmUgZm9yIHRoZSBwcm9w
ZXJ0eSwgYW5kIGFub3RoZXIgdGhhdCB0ZWxscyB0aGUgaGFyZHdhcmUNCj4gPj4+PiBzdGF0ZT8N
Cj4gPj4+DQo+ID4+PiBObyBJIGRvIG5vdCB0aGluayBzby4gSSB3b3VsZCBleHBlY3QgdGhlcmUg
dG8ganVzdCBiZSBvbmUgcHJvcGVydHksDQo+ID4+PiBJIGd1ZXNzIHRoYXQgaWYgdGhlIHN0YXRl
IGlzIChwYXJ0bHkpIGZpcm13YXJlIGNvbnRyb2xsZWQgdGhlbiB0aGVyZQ0KPiA+Pj4gbWlnaHQg
YmUgYSByYWNlLCBidXQgd2Ugd2lsbCBuZWVkIGEgbm90aWZpY2F0aW9uIG1lY2hhbmlzbSAoKikg
Zm9yDQo+ID4+PiBmaXJtd2FyZSB0cmlnZ2VyZWQgc3RhdGUgY2hhbmdlcyBhbnl3YXlzLCBzbyBz
aG9ydGx5IGFmdGVyIGxvb3NpbmcNCj4gPj4+IHRoZSByYWNlIHVzZXJzcGFjZSB3aWxsIHByb2Nl
c3MgdGhlIG5vdGlmaWNhdGlvbiBhbmQgaXQgd2lsbCBrbm93DQo+ID4+PiBhYm91dCBpdC4NCj4g
Pj4NCj4gPj4gSSBhZ3JlZSB3aXRoIEhhbnMgaGVyZSB0aGF0IEkgdGhpbmsgaXQgd291bGQgYmUg
YmV0dGVyIGlmIHdlIGNvdWxkIGRvDQo+ID4+IGl0IHdpdGggb25lIHByb3BlcnR5Lg0KPiA+Pg0K
PiA+PiAgICogSSBjYW4gaW1hZ2luZSBkZW1hbmQgZm9yIGxhcHRvcHMgdGhhdCBoYXZlIGEgImhh
cmR3YXJlIGtpbGwgc3dpdGNoIg0KPiA+PiBmb3IgcHJpdmFjeSBzY3JlZW4gKGp1c3QgbGlrZSB0
aGVyZSBhcmUgZm9yIGNhbWVyYSBldGMgdG9kYXkpLiBTbyBJDQo+ID4+IHRoaW5rIGluIGZ1dHVy
ZSB3ZSBtYXkgaGF2ZSB0byBkZWFsIHdpdGggdGhpcyBjYXNlIGFueXdheS4gSW4gc3VjaA0KPiA+
PiBkZXZpY2VzIGl0J3MgdGhlIGhhcmR3YXJlIChhcyBvcHBvc2l0ZSB0byBmaXJtd2FyZSkgdGhh
dCB3aWxsIGNoYW5nZQ0KPiA+PiB0aGUgc3RhdGUuIFRoZSBIVyB3aWxsIGxpa2VseSBwcm92aWRl
IGFuIGludGVycnVwdCB0byB0aGUgc29mdHdhcmUgdG8NCj4gPj4gbm90aWZ5IG9mIHRoZSBjaGFu
Z2UuIFRoaXMgaXMgYWxsIGltYWdpbmF0aXZlIGF0IHRoaXMgcG9pbnQgdGhvdWdoLg0KPiA+Pg0K
PiA+PiAqIEkgdGhpbmsgaGF2aW5nIDIgcHJvcGVydGllcyBtaWdodCBiZSBhIGNvbmZ1c2luZyBV
QVBJLiBBbHNvLCB3ZSBoYXZlDQo+ID4+IGV4aXN0aW5nIHByb3BlcnRpZXMgbGlrZSBsaW5rLXN0
YXR1cyB0aGF0IGNhbiBiZSBjaGFuZ2VkIGJ5IGJvdGggdGhlDQo+ID4+IHVzZXIgYW5kIHRoZSBo
YXJkd2FyZS4NCj4gPg0KPiA+IEkgdGhpbmsgdGhlIGNvbnNlbnN1cyBpcyB0aGF0IGFsbCBwcm9w
ZXJ0aWVzIHRoYXQgZ2V0IGNoYW5nZWQgYnkgYm90aA0KPiA+IHVzZXJzcGFjZSBhbmQgdGhlIGtl
cm5lbCBhcmUgbWlzdGFrZXMsIGFuZCB0aGUgd2F5IHRvIGhhbmRsZSBpdCBpcyB0bw0KPiA+IGhh
dmUgdHdvIHByb3BlcnRpZXMuDQo+IA0KPiBCdXQgdGhlIGFjdHVhbCBwcml2YWN5IHNjcmVlbiBo
YXMgb25seSAxIHN0YXRlLCBoYXZpbmcgdHdvIHByb3BlcnRpZXMNCj4gZm9yIHRoaXMgd2lsbCBv
bmx5IGJlIGNvbmZ1c2luZy4gQXMgSSBtZW50aW9uZWQgYmVmb3JlIHdlIGhhdmUgYSBzaW1pbGFy
DQo+IGNhc2Ugd2l0aCBlLmcuIGtleWJvYXJkIGJhY2tsaWdodGluZyBhbmQgdGhlcmUgdGhlIHVz
ZXJzcGFjZSBBUEkNCj4gYWxzbyBoYXMgYSBzaW5nbGUgc3lzZnMgYXR0cmlidXRlIGZvciB0aGUg
YnJpZ2h0bmVzcywgd2l0aCBjaGFuZ2UNCj4gbm90aWZpY2F0aW9ucyB0byB1c2Vyc3BhY2UgaWYg
dGhlIGZpcm13YXJlIGNoYW5nZXMgdGhlIGJyaWdodG5lc3MNCj4gb24gaXRzIG93biBhbmQgdGhp
cyB3b3JrcyB3ZWxsLg0KPiANCj4gV2hhdCB3b3VsZCB0aGUgc2VtYW50aWNzIG9mIHRoZXNlIDIg
ZGlmZmVyZW50IHByb3BlcnRpZXMgYmU/IEFuZA0KPiB3aGF0IHNvcnQgb2YgZXh0cmEgZnVuY3Rp
b25hbGl0eSB3b3VsZCB0aGVzZSBzZW1hbnRpY3Mgb2ZmZXIgd2hpY2gNCj4gdGhlIHNpbmdsZSBw
cm9wZXJ0eSB2ZXJzaW9ucyBkb2VzIG5vdCBvZmZlcj8NCj4gDQpJJ20gd29ycmllZCBJJ20gbWlz
c2luZyB0aGUgcG9pbnQgYnV0IGxvZ2ljYWxseSB0aGlzIGRvZXNuJ3QgbWFrZSBzZW5zZSB0byBt
ZSANCmVpdGhlci4gV2UncmUganVzdCBwcm92aWRpbmcgdHdvIG1lY2hhbmlzbXMgZm9yIGNvbnRy
b2xsaW5nIGVQcml2YWN5IC0gbmVpdGhlciANCmlzIHdyb25nLiBJJ20gbm90IHN1cmUgd2hlcmUg
dGhlIGNvbnNlbnN1cyB3YXMgcmVhY2hlZCBhbmQgd2h5IC0gSSdtIGFmcmFpZCBJIA0KZG9uJ3Qg
aGF2ZSB0aGF0IGhpc3RvcnkuIA0KTm90IHN1cmUgaXQncyB0aGUgYmVzdCBleGFtcGxlIGJ1dCB5
b3UgY2FuIGNvbnRyb2wgdGhlIHN5c3RlbSB2b2x1bWUgdXNpbmcgDQpidXR0b25zIG9yIHRoZSBT
VyBzbGlkZXIuIEl0J3Mgc3RpbGwganVzdCB0aGUgdm9sdW1lLiBJc24ndCB0aGlzIHNpbWlsYXIg
KGlzaCkuIEJvdGggDQpoYXZlIHRoZWlyIHBsYWNlIGFuZCBiZW5lZml0cy4NCg0KV2hhdCBpZiB1
c2VycyB3YW50IHRoZSBob3RrZXkgZnVuY3Rpb25hbGl0eT8gSXQgaXMgYWZ0ZXIgYWxsIHF1aXRl
IGhlbHBmdWw6IA0KZG9pbmcgRm4rZCBpcyBhIGxvdCBxdWlja2VyIHRoYW4gZmluZGluZyB0aGUg
Y29udHJvbCBib3ggYW5kIHRvZ2dsaW5nIHNvbWV0aGluZyANCmlmIHNvbWVvbmUgaXMgbG9va2lu
ZyBvdmVyIHlvdXIgc2hvdWxkZXIgYW5kIHlvdSBkb24ndCB3YW50IHRoZW0gdG8gc2VlLiBJJ20g
DQpub3Qgc3VyZSB3aHkgYSB1c2VyIHdvdWxkIHdhbnQgaXQgZGlzYWJsZWQgLSBhcyBsb25nIGFz
IGl0IGlzIHRpZWQgaW4gcHJvcGVybHkgd2l0aCANCnRoZSB1c2VyIHNwYWNlIHJlcG9ydGluZy4N
Cg0KPExlbm92byBoYXQgb24+DQpPbiB0aGF0IG5vdGUgLSAoSSBzdGFydGVkIHJlcGx5aW5nIGlu
IGFuIGVhcmxpZXIgdGhyZWFkIGJ1dCBnb3Qgc2lkZSB0cmFja2VkKSB0aGVyZSBpcyANCmxpdHRs
ZSBjaGFuY2UgdGhlIEJJT1MgdGVhbSB3aWxsIG1ha2Ugc2lnbmlmaWNhbnQgY2hhbmdlcyB0byBl
eGlzdGluZyBCSU9TDQpmb3IgYWRkaW5nIGV4dHJhIGRpc2FibGUgZnVuY3Rpb25hbGl0eS4gVGhl
cmUgYXJlIGp1c3QgdG9vIG1hbnkgcmVwZXJjdXNzaW9ucyANCm9uIHRlc3RpbmcgYXMgaXQgaW1w
YWN0cyBXaW5kb3dzLiBJIGtub3cgaXQgc3Vja3MgYnV0IGl0J3MganVzdCB0aGUgd2F5IGl0IGlz
IGFuZCBJIA0KZG9uJ3QgdGhpbmsgdGhlcmUgaXMgYSBzdHJvbmcgZW5vdWdoIHN0b3J5IHRvIHJl
YWxseSBwdXNoIGZvciBpdC4gTGV0IG1lIGtub3cgaWYgSSdtIA0Kb3V0IHRvIGx1bmNoIG9yIGJl
aW5nIHVucmVhc29uYWJsZSDwn5iKSSdtIGhhcHB5IHRvIGhhdmUgdGhhdCBjb252ZXJzYXRpb24g
d2l0aCB0aGVtDQpidXQgSSBhbHJlYWR5IGtub3cgdGhlIHJlc3VsdHMuLi5tYXliZSBmb3IgZnV0
dXJlIHBsYXRmb3JtcyBidXQgdGhlcmUgYXJlIGlzc3VlcyB0aGVyZQ0KdG9vICh3aGVuIHNoaXBw
aW5nIExpbnV4IHN5c3RlbXMgaXQncyBqdXN0IGFub3RoZXIgc2V0dGluZyB0byB0d2VhayBhbmQg
d2UncmUgdHJ5aW5nIHRvDQpyZWR1Y2UgdGhlbSBub3QgaW5jcmVhc2UgdGhlbS4uLmJ1dCB0aGF0
J3MgYW5vdGhlciBzdG9yeSkNCg0KTWFyaw0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
