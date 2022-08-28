Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBB75A3C12
	for <lists+dri-devel@lfdr.de>; Sun, 28 Aug 2022 08:06:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D389010EE9E;
	Sun, 28 Aug 2022 06:06:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2114.outbound.protection.outlook.com [40.107.114.114])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83A3310EE9E
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Aug 2022 06:06:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ev+Div2KhvJvguPUjIm0lrPZ9YEUymrmuMxq9QkSED+7uJEEkKKUYqHPpg2QuDVZYiVBJTVXaNkrhmeYbQxOaBz8RYQHv4QqG2r84WAXH0W0oA00mR9Jyala3VzwjzrqtGH7CJGoS4525cPp0VEtCSMctGeYXhNMKLo/qqpZYcO59+/fOjmx20iEBn6bKxmEIk1I2ylBSTwwei9q7IUM4zPTZ2LD4SuwqimO6PK986WW8iS/h71u4w/804FaSVjkdfmaOG/jgRIQUL3iJA/b14d16sS4ikyHGEUTnVrKGHHYE7YKXM64JHvM1+aabduo4j4rOPLLqSxUSFIxMvL8+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+8jnRXnU9JBB9lY9LzrXggv2skd438d7WPdU9ElfBjk=;
 b=DKR52Eu73OUHrAjKhqLZrPbTV3YxNp0a2eqgKNgEbdH4gs6KwSzTK7x3M8CG7B4fh40RQlaIMfSbYFAEcg/awJ9gAN70B1rzAR65SuhAhiM4b0pmECa0YzVZA22U7YPlLEcjBBJY7rJXU46i4KkJ2qVPFl9/VeW8YfRqJhI8olSbynqGh3D/XIEMRx+xrn64ClYXHC3Ma0m5llSHr/d/bkd9EXKMVejOs1ofJokNFAI1LsFgo9qJtYMA/DkHIGozOjqRYfWPgYwFTHMNWCAwc7mskXuacpYBxAcS+R8e1BnvWfoNQgpP7Ilw2CfaoSHv++42TFi6tKfAv2NsC4i3ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+8jnRXnU9JBB9lY9LzrXggv2skd438d7WPdU9ElfBjk=;
 b=vUjg1FAdTZL6Crz/PNrpiomgJ+QFWrjwgk5pfubCBuerPXubt3tdHJyo+Lxk3aV+kxdct35fHxv/EVZMD/Jv4xaWl2hYhw5pJVGmC5PE7SG+PRI5tCBRhU+/jJ1eOupTuji+4J04qK5PFgF9nX3kFmaeq87fDRqhPhlVpvotZ/o=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYAPR01MB2879.jpnprd01.prod.outlook.com (2603:1096:404:8d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Sun, 28 Aug
 2022 06:05:57 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::14d3:5079:9de1:ceaf]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::14d3:5079:9de1:ceaf%3]) with mapi id 15.20.5566.021; Sun, 28 Aug 2022
 06:05:56 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH 2/2] drm: rcar-du: Use %p4cc to print 4CC format
Thread-Topic: [PATCH 2/2] drm: rcar-du: Use %p4cc to print 4CC format
Thread-Index: AQHYuG7t+14tWNeQw0+zXqAYnK1OK63B25yAgACX7+CAAKPCgIAAwAZQ
Date: Sun, 28 Aug 2022 06:05:55 +0000
Message-ID: <OS0PR01MB5922C8DD684D606BDBD3DE9F86779@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220825103905.2450049-1-biju.das.jz@bp.renesas.com>
 <20220825103905.2450049-2-biju.das.jz@bp.renesas.com>
 <YwlboWrxzP7JWeg/@pendragon.ideasonboard.com>
 <OS0PR01MB592284D23CEF5354170765A886749@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <Ywpkc5ut97L3kTb1@pendragon.ideasonboard.com>
In-Reply-To: <Ywpkc5ut97L3kTb1@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cc484f4c-6605-474e-803d-08da88bb5ef4
x-ms-traffictypediagnostic: TYAPR01MB2879:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YumbYOYmNs48OPC9vYt+WC3NA0vdx/QihCnbPLnxWK/tfoeek9i0dxFw2T1ibecGZ/LqLZlmoQQCY1Ye/DUiP2m/GUwkSHyH/kVLI47KOlF5E9GjbVp58kC5yF/g+Do6z6wgxsXmWuqczrYUT0c9wph38DFOQoOZ6lPnSCS53xtJqTuKL8PmwmrvklO1SLtKRXZEb6NNa9t9Ox763tBpVBoA0/sPOqt67493ZaYKifgp+vfKQkOkvsZ3vtKZ7S0N69fh6mc6ArNqN3HhlrI6UVUHLuOlGlzCdtfY8dRTnIeNKWi01x/HvbCdGqHLP6STC2JX6DYHoc+ajSAJK8PzxeyP0Bjh67GS9+Ekdweond9HqUr2Es6FUrIqoCnP3eTpbIjx7CmH8zYrkx3MNGVVAaQLCq0PIUrc31prBQkGEfiXGBXgM3wVw2SkNFeciTo5gKX7fWIF3ltnmBTOxAqrRCAcbMcHKaFxhvXtTPpHsEp8zB/TwWqElF+4mUYlwcrnvj7BylI16vAjOnzUJdty7AGd6Ia8oc9Io283nEyeFxcDHMrukAIJo07OawxBbn6fLUcYlJXhRT73nl12NeyVDg5LhAeMlxdS09/X9GNTEpqBltoXJcfwsGY5+HZoh+sTylvmDMn9/RMdyLwV2+hkjPHWvEAqYJrgdHa+PusLMj1qx9OGl4UkdbCGJOM/04LcjMSkn71zi7Nc1ZISa0/bdTbYKvD3UTtGDXR5YCUNYzC3CFSmbDTdEf4ZCLNesys2HGPO+qyuwSZnApwxCm+1Fg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(39860400002)(366004)(376002)(346002)(136003)(83380400001)(33656002)(6916009)(71200400001)(186003)(316002)(6506007)(107886003)(9686003)(7696005)(2906002)(26005)(38070700005)(55016003)(122000001)(41300700001)(478600001)(4326008)(8936002)(5660300002)(52536014)(76116006)(86362001)(54906003)(64756008)(66476007)(66946007)(38100700002)(8676002)(66446008)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZTEydFlwS1E5ZlVLTDNpVThRdjFIU08rakpiQmc5NHZSdlFpSWhMaGhmczg4?=
 =?utf-8?B?bk9LVFdmSXIxeVgrTStrNXl2OG9CV045SEp3bGtVYVBGYzdnd3Bjdld2WjI3?=
 =?utf-8?B?bmhaWnJvRmg1d0xzZWhuVmk0VmNzOFUrTFhWc3lyYzV1QWdsMWRTL0Q3dGhP?=
 =?utf-8?B?NVZTQStLSnZ5TlRXWkE2U0FCYm8rVHQzQWxvdzhIWmhvQ0hDU3dEcngvWm9y?=
 =?utf-8?B?RHRic2loVGM0ZGI2dzdFVmQxV2FYRXMvSHNRSVl5MGxKb2NXYm9NQ0JRWTZZ?=
 =?utf-8?B?M3gvVTZjOXlYOWVqTG4yQUQwdkNNR0M2Q2F2RkRkazJrcmV0K1dCNm9tbHhx?=
 =?utf-8?B?d3NVdXJRZnZ1K01FSHBabnVJVi9qdGZ1d2ZxbXpHTzBiaklXVEFGOU5DS0Zw?=
 =?utf-8?B?YlBDc1VmYitOclprM0ZkbmxUN09vYVJ1dHI0S3BGYmV6THVaL0lGVE1vNGUv?=
 =?utf-8?B?NHR1bTBHZm91Mng0RkF1OFo5a00xNFVnTkdJQXpxejhPcE82eTlyMzNEUUJM?=
 =?utf-8?B?bE52L0piWW8yVlJ0c28zYzBFM0Q5VnJ5RXFwK1dxMWJhY2tmMTNXZzFKdEw3?=
 =?utf-8?B?clIvbVdpejZ0RUVwdGFJNlF5Z1V5d3BnMmNPQXZlSE9PUy91RTB3elgwckdo?=
 =?utf-8?B?OTM3MmxzaXkzenhTbUtlY0JITXJFYkJhNDlLRjNDQjJSRzY1SG9weEkxSWhD?=
 =?utf-8?B?bE5KU1NIRzl0czUweXB2emlrYjJ6aE10ZE14UC9TRUpIZkJQWGRtSU4yVUFK?=
 =?utf-8?B?T0cxc1NPRG03K2xEQkJLK3BrY1dPbnNvU1JMRHZHbEprTng2a2RWaWlMc21M?=
 =?utf-8?B?WlR3am5pZFc3VmJ2WGpNbDd5RXIxckN2RW1kSkd3TXFtejZ4Uk0rTlpSMDZh?=
 =?utf-8?B?Tm1zY2tkUkZLTFZaNmN5VFZJa3RIOWxUREVyYVpXSm1oMzB1U3JpQS82YVBl?=
 =?utf-8?B?bThaODNwTVEyZE1IMWNvOGlmQ2o4ajFURDU2MXlaNEgvVEpMLzVaR1FrRTZh?=
 =?utf-8?B?T0UzNGpJSmlkcVNMZGZobVJBR0ZNMDZldUN0Z0tISG1qZnRRYmp5VVNrU0tr?=
 =?utf-8?B?QzVOTi9SK0FNcHFaNFdLK2FnQW80dlg5NTdGbjF1eTF0TGJ0dHpmeEJWQUFj?=
 =?utf-8?B?ZHZ2VnJYLzg2bUJRZW9HM3BFZmJWZUluc3kyOHRsNnkyUUNkMWc0djhvY0Q2?=
 =?utf-8?B?ekpTblRmWkFuMUVHb3dkUTRxNkREejRBWGluOWtBcG1NbDd4S29oclkzcjY0?=
 =?utf-8?B?MjFFS25YamoxT1BMY3JmSUYyRUlLMEh4WUROMTJOTWJEM2pvWE04bkVtWVFX?=
 =?utf-8?B?Sm5FZHE2MWEzTXNySE1GRU9EaWIzRmNNK1Nob01BTE1JSVlOcWM5SUJUTFJL?=
 =?utf-8?B?bnErTFZMekJaRUo3SzJqSmJVU0YxaHVHRTkva2FBNjRQclVZUWM4VXR1STdB?=
 =?utf-8?B?V1RZa094cHFCSjFkZjZZRW5LRFVKU1dBZTQzSUZFQ3d5RHlYSEtLaFFra1dB?=
 =?utf-8?B?R0pVTEpVOGFaQjlyMTVmQStITDJKMEZEKzE4d2RHVGY1Uk9pNGlZSUNPMlhq?=
 =?utf-8?B?M0ErbkNVbVJTOHNWT2F3ZktPcnVZSFZGNlJTWlRTdklqZFJkZ2dmQVZKVkNa?=
 =?utf-8?B?aGVHdDNIaTdnZTdIaWpNS1pwNW5GSUtXajJlWFEvVjBuTFovWEhuVFNhL2hP?=
 =?utf-8?B?b3l6amhIT2IwS0x0ZEgwL1ZtaVFsZy92VFBvelZBUzNsRWxNZzFYZlFSOWFp?=
 =?utf-8?B?RTNwVllRd1pwNlJvMUZVYm1EYWs3eHcrT1gwM3QxSjJYaDZhNWNXQ3pWUjlm?=
 =?utf-8?B?cjNYK1V3UHZmQ3lQakpLL0g1NDFMV1Y5S3VrMkNEUkFnRjJlbjZyT2o0eTZr?=
 =?utf-8?B?T1JmS0ZvMDVKMjVEMU45RU5aMFZVNkJsZzhDbjdMM2ZSVUdkUU5ZRTNPSUxa?=
 =?utf-8?B?NlNYRENoRmJNU0IwS1lGR2lWdXp6dHN0NHBHZkVwNGFNM2JPTGNPbFVBM0c1?=
 =?utf-8?B?N3FtNkR1aVJFbUJoUTlXcVVsWkJMaWM3Q01uWXVSNjdqMUNOZ1BoV25FT0xl?=
 =?utf-8?B?dnhvUUg5OHIwL2h1eHBvcFVRS1F1LzZ0UUhQcXFKZ0I2Mk5WNDhIamM5NEll?=
 =?utf-8?B?OUw5Y216VVJVYmpXZ3FaeEVYRnBOdEY0NXcxak9kL2tpVW52WVdLU3Nwa0hl?=
 =?utf-8?B?ZkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc484f4c-6605-474e-803d-08da88bb5ef4
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2022 06:05:55.9065 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IbrBPC7o/3Y8Ds9PDtr8oZfNCbPrS4AiAhw2+KK/H6+YJrTY5d8Zs1ZYSCJ4zmGnsWtWzEbK9ST6DJL8DrBmpJ5JmbubGmsTxRKwVzREMaU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2879
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
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCwNCg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDIvMl0gZHJtOiByY2FyLWR1OiBV
c2UgJXA0Y2MgdG8gcHJpbnQgNENDIGZvcm1hdA0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIFNh
dCwgQXVnIDI3LCAyMDIyIGF0IDA5OjA0OjI1QU0gKzAwMDAsIEJpanUgRGFzIHdyb3RlOg0KPiA+
IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMi8yXSBkcm06IHJjYXItZHU6IFVzZSAlcDRjYyB0byBwcmlu
dCA0Q0MgZm9ybWF0DQo+ID4gPiBPbiBUaHUsIEF1ZyAyNSwgMjAyMiBhdCAxMTozOTowNUFNICsw
MTAwLCBCaWp1IERhcyB3cm90ZToNCj4gPiA+ID4gUmVwbGFjZSB1c2Ugb2Ygc3RydWN0IHJjYXJf
ZHVfZm9ybWF0X2luZm8gd2l0aCAlcDRjYyBmb3IgcHJpbnRpbmcNCj4gPiA+ID4gNENDIGZvcm1h
dHMuDQo+ID4gPg0KPiA+ID4gVGhlIGNvZGUgY2hhbmdlIGxvb2tzIGdvb2QsIGJ1dCBkb2Vzbid0
IG1hdGNoIHRoZSBjb21taXQgbWVzc2FnZS4NCj4gPiA+IFlvdSdyZSBub3QgcmVwbGFjaW5nIHVz
YWdlIG9mIHN0cnVjdCByY2FyX2R1X2Zvcm1hdF9pbmZvLiBJIHByb3Bvc2UNCj4gPiA+IHRoZSBm
b2xsb3dpbmcgY29tbWl0IG1lc3NhZ2U6DQo+ID4gPg0KPiA+ID4gVXNlIHRoZSAlcDRjYyBmb3Jt
YXQgc3BlY2lmaWVyIHRvIHByaW50IDRDQ3MsIHdoaWNoIHdpbGwgcHJvdmlkZSBhDQo+ID4gPiBt
b3JlIHJlYWRhYmxlIG1lc3NhZ2UgdGhhbiB0aGUgcmF3IGhleCB2YWx1ZS4NCj4gPg0KPiA+IE9L
Lg0KPiA+DQo+ID4gPiA+IFJlcG9ydGVkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3Jl
bmVzYXNAZ2xpZGVyLmJlPg0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5k
YXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiAgZHJpdmVycy9ncHUv
ZHJtL3JjYXItZHUvcmNhcl9kdV9rbXMuYyB8IDQgKystLQ0KPiA+ID4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPiA+ID4NCj4gPiA+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfa21zLmMNCj4gPiA+ID4g
Yi9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2ttcy5jDQo+ID4gPiA+IGluZGV4IDIx
ODgxZmI1ZTg0YS4uOGMyNzE5ZWZkYTJhIDEwMDY0NA0KPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vcmNhci1kdS9yY2FyX2R1X2ttcy5jDQo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9yY2FyLWR1L3JjYXJfZHVfa21zLmMNCj4gPiA+ID4gQEAgLTQwNSw4ICs0MDUsOCBAQCByY2Fy
X2R1X2ZiX2NyZWF0ZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LA0KPiA+ID4gPiBzdHJ1Y3QgZHJt
X2ZpbGUgKmZpbGVfcHJpdiwNCj4gPiA+ID4NCj4gPiA+ID4gIAlmb3JtYXQgPSByY2FyX2R1X2Zv
cm1hdF9pbmZvKG1vZGVfY21kLT5waXhlbF9mb3JtYXQpOw0KPiA+ID4gPiAgCWlmIChmb3JtYXQg
PT0gTlVMTCkgew0KPiA+ID4gPiAtCQlkZXZfZGJnKGRldi0+ZGV2LCAidW5zdXBwb3J0ZWQgcGl4
ZWwgZm9ybWF0ICUwOHhcbiIsDQo+ID4gPiA+IC0JCQltb2RlX2NtZC0+cGl4ZWxfZm9ybWF0KTsN
Cj4gPiA+ID4gKwkJZGV2X2RiZyhkZXYtPmRldiwgInVuc3VwcG9ydGVkIHBpeGVsIGZvcm1hdCAl
cDRjY1xuIiwNCj4gPiA+ID4gKwkJCSZtb2RlX2NtZC0+cGl4ZWxfZm9ybWF0KTsNCj4gPiA+ID4g
IAkJcmV0dXJuIEVSUl9QVFIoLUVJTlZBTCk7DQo+ID4gPiA+ICAJfQ0KPiA+ID4gPg0KPiA+ID4N
Cj4gPiA+IFRoZXJlIGFyZSB0d28gb3RoZXIgb2NjdXJyZW5jZXM6DQo+ID4gPg0KPiA+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfcGxhbmUuYw0KPiA+ID4g
Yi9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X3BsYW5lLmMNCj4gPiA+IGluZGV4IDI2
YjI1Y2E1ODk2OC4uODM2MzFlZTJmZmYxIDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3JjYXItZHUvcmNhcl9kdV9wbGFuZS5jDQo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
cmNhci1kdS9yY2FyX2R1X3BsYW5lLmMNCj4gPiA+IEBAIC02MjYsOCArNjI2LDggQEAgaW50IF9f
cmNhcl9kdV9wbGFuZV9hdG9taWNfY2hlY2soc3RydWN0DQo+ID4gPiBkcm1fcGxhbmUgKnBsYW5l
LA0KPiA+ID4NCj4gPiA+ICAJKmZvcm1hdCA9IHJjYXJfZHVfZm9ybWF0X2luZm8oc3RhdGUtPmZi
LT5mb3JtYXQtPmZvcm1hdCk7DQo+ID4gPiAgCWlmICgqZm9ybWF0ID09IE5VTEwpIHsNCj4gPiA+
IC0JCWRldl9kYmcoZGV2LT5kZXYsICIlczogdW5zdXBwb3J0ZWQgZm9ybWF0ICUwOHhcbiIsIF9f
ZnVuY19fLA0KPiA+ID4gLQkJCXN0YXRlLT5mYi0+Zm9ybWF0LT5mb3JtYXQpOw0KPiA+ID4gKwkJ
ZGV2X2RiZyhkZXYtPmRldiwgIiVzOiB1bnN1cHBvcnRlZCBmb3JtYXQgJXA0Y2NcbiIsDQo+ID4g
PiBfX2Z1bmNfXywNCj4gPiA+ICsJCQkmc3RhdGUtPmZiLT5mb3JtYXQtPmZvcm1hdCk7DQo+ID4g
PiAgCQlyZXR1cm4gLUVJTlZBTDsNCj4gPiA+ICAJfQ0KPiA+ID4NCj4gPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X3dyaXRlYmFjay5jDQo+ID4gPiBiL2Ry
aXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfd3JpdGViYWNrLmMNCj4gPiA+IGluZGV4IDI1
ZjUwYTI5N2MxMS4uOGNkMzdkN2I4YWUyIDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3JjYXItZHUvcmNhcl9kdV93cml0ZWJhY2suYw0KPiA+ID4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3JjYXItZHUvcmNhcl9kdV93cml0ZWJhY2suYw0KPiA+ID4gQEAgLTE2Niw4ICsxNjYsOCBA
QCBzdGF0aWMgaW50IHJjYXJfZHVfd2JfZW5jX2F0b21pY19jaGVjayhzdHJ1Y3QNCj4gPiA+IGRy
bV9lbmNvZGVyICplbmNvZGVyLA0KPiA+ID4NCj4gPiA+ICAJd2Jfc3RhdGUtPmZvcm1hdCA9IHJj
YXJfZHVfZm9ybWF0X2luZm8oZmItPmZvcm1hdC0+Zm9ybWF0KTsNCj4gPiA+ICAJaWYgKHdiX3N0
YXRlLT5mb3JtYXQgPT0gTlVMTCkgew0KPiA+ID4gLQkJZGV2X2RiZyhkZXYtPmRldiwgIiVzOiB1
bnN1cHBvcnRlZCBmb3JtYXQgJTA4eFxuIiwgX19mdW5jX18sDQo+ID4gPiAtCQkJZmItPmZvcm1h
dC0+Zm9ybWF0KTsNCj4gPiA+ICsJCWRldl9kYmcoZGV2LT5kZXYsICIlczogdW5zdXBwb3J0ZWQg
Zm9ybWF0ICVwNGNjXG4iLA0KPiA+ID4gX19mdW5jX18sDQo+ID4gPiArCQkJJmZiLT5mb3JtYXQt
PmZvcm1hdCk7DQo+ID4gPiAgCQlyZXR1cm4gLUVJTlZBTDsNCj4gPiA+ICAJfQ0KPiA+ID4NCj4g
PiA+IEkgY2FuIGFkZCB0aGVzZSBjaGFuZ2VzIHRvIHRoZSBwYXRjaCBhbmQgdXBkYXRlIHRoZSBj
b21taXQgbWVzc2FnZQ0KPiA+ID4gd2hlbiBhcHBseWluZyBpZiB5b3UncmUgZmluZSB3aXRoIHRo
YXQuIEluIHRoYXQgY2FzZSwNCj4gPg0KPiA+IEkgYW0gb2sgd2l0aCBpdC4NCj4gPg0KPiA+IElz
IGl0IHBvc3NpYmxlIGZvciB5b3UgdG8gc2hhcmUgdGhlIGdpdCB0cmVlIHdpdGggbGF0ZXN0IFJD
YXIgRFUNCj4gY2hhbmdlcz8NCj4gPiBzbyB0aGF0IEkgY2FuIHJlYmFzZSBSQ2FyIERVIGxpYiBh
bmQgUlovRzJMIERVIHdvcmsgb24gdG9wIG9mIHRoYXQuDQo+ID4NCj4gPiBDdXJyZW50bHkgSSBh
bSByZWJhc2luZyBvbiB0b3Agb2YgZHJtX3RpcC4gUGxlYXNlIGxldCBtZSBrbm93Lg0KPiANCj4g
U3VyZS4gVGhlIHRyZWUgaXMgYXZhaWxhYmxlIGF0IGdpdDovL2xpbnV4dHYub3JnL3BpbmNoYXJ0
bC9tZWRpYS5naXQsDQo+IGFuZCBteSBkcm0gbmV4dCBicmFuY2ggZm9yIHRoZSBEVSBkcml2ZXIg
aXMgZHJtL2R1L25leHQuDQoNClRoYW5rIHlvdSwgV2lsbCByZWJhc2Ugb24gZHJtL2R1L25leHQN
Cg0KQ2hlZXJzLA0KQmlqdQ0KDQogDQo+ID4gPiBSZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFy
dCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPg0KPiANCj4gLS0NCj4gUmVnYXJk
cywNCj4gDQo+IExhdXJlbnQgUGluY2hhcnQNCg==
