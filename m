Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3CC545512
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 21:39:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BE0211240D;
	Thu,  9 Jun 2022 19:39:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2079.outbound.protection.outlook.com [40.107.94.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 322A31123F4;
 Thu,  9 Jun 2022 19:39:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Heu1SYOBWbpf7gNjk0s7nbgPudgiA/JwEllcRKl+SQNG6GRc567FzaFuyZ5vVUS0J9qi94naJvYt798eZXX1g1gg6BvBybPp4gMDblH1WZ8CeBQBPvqocVnOvmai9f1BOAlGV1I9YNNLijxTJI4MM3HmmYyviqpey13die2iDg2U6Ehqk2eU6oEoiEgwJGxL7dVt2icthGfGwTFK9oRT6vj+mJ6M0fL/iObtiee6z2PLfD4yljtl1eh6rr79G26U1K60Ig9PiU5EsvHSbLIQZ7mkWuSA7aojWIfsLf0TR9GEXBJDn9mshokHce1tjWSlExt6x5alCbGCXLSJgFqlbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ZdQDx6f97YPKK6Qfa9Df24E3Vhucxnn39ZoYteKUto=;
 b=KEKQBNkVnZ/N/DU2XU+ZZOkHu2y/UBcVUrqpZzTTLNWDXONVjsgtjQ2K5/WxWBJDhALXuNrcHa6/gEkiQd7hKUcUCF8gWlgJnxc2Oc7Q3PCDU4n+oX9WY+ywxsZljjgwTaMT9VoImqHE6gagWSCOd5AEPKnjTMwnkEG6xU24YcMq7hqwiLvexaRuHp1W4FVJeK0ht6mK/nRQ8KKXIKikZ2ynBGVDj72qz1Sge6xyqDuz5mMUlmtYcNSIgElcnqn8J34w+UqwLdQ9zH4Y8STxPkZYT4suZ0UsaWdfLQo2HIa9L+2mhWCfaXDHy5VR0dJKTmEHaY8FDhOJJ3bXAKGSLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ZdQDx6f97YPKK6Qfa9Df24E3Vhucxnn39ZoYteKUto=;
 b=J0oKC5ElTaHvD0pmI2Z9SH4GJEaZ+dyQWbSyPhUsdvou86Egjzp6QJgp1X7pkqQiSU5dAk/2dNRhY9QU4/VXwins6RFPpVAUdjkQ0z9KcQuuayNRinxzzk6DoLfWFA4rpvJ0s+Gz+LPSqILO3TzAiM1fDB7Jv/Jl4F/1GKMB/4I=
Received: from CY4PR05MB3047.namprd05.prod.outlook.com (2603:10b6:903:f4::7)
 by PH0PR05MB8768.namprd05.prod.outlook.com (2603:10b6:510:bd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.7; Thu, 9 Jun
 2022 19:39:40 +0000
Received: from CY4PR05MB3047.namprd05.prod.outlook.com
 ([fe80::14fc:26d8:a523:ce02]) by CY4PR05MB3047.namprd05.prod.outlook.com
 ([fe80::14fc:26d8:a523:ce02%3]) with mapi id 15.20.5353.005; Thu, 9 Jun 2022
 19:39:39 +0000
From: Zack Rusin <zackr@vmware.com>
To: "ppaalanen@gmail.com" <ppaalanen@gmail.com>
Subject: Re: [PATCH 0/6] drm: Add mouse cursor hotspot support to atomic KMS
Thread-Topic: [PATCH 0/6] drm: Add mouse cursor hotspot support to atomic KMS
Thread-Index: AQHYdpeKjA+fIeSl9UGD1Oezsoj+Fa09u26AgAXii4CAAKL4AIAA65kAgAJXl4A=
Date: Thu, 9 Jun 2022 19:39:39 +0000
Message-ID: <0485fdf9844f8c89cd5670096b78f8090378b2a1.camel@vmware.com>
References: <20220602154243.1015688-1-zack@kde.org>
 <wRnf-Lm5zz6v1e-NlnFPteyARuLl-R98mOZZVjePHD5ue7QQNR_TSU7RwYBssgUa7xM5hf7Fe59-gMEj81ESrHY3mu_H7yE0dtGhFHFPTnc=@emersion.fr>
 <20220607110707.02eccda5@eldfell>
 <197201d5da2c504502b8c2225d6766338b18d732.camel@vmware.com>
 <20220608105338.22592a09@eldfell>
In-Reply-To: <20220608105338.22592a09@eldfell>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 60e43768-6874-4d20-f608-08da4a4fcb29
x-ms-traffictypediagnostic: PH0PR05MB8768:EE_
x-microsoft-antispam-prvs: <PH0PR05MB87687454A2914423A4249DDDCEA79@PH0PR05MB8768.namprd05.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kaFwEMSaTxbP+PtUUPY2vwstdK1hF94icaORU2IMW8X4Hx7NET9oSAxSThnSUiCAIgY/9LTete885u5OS16/F+FskEuC4Zc7g1CyomsCjBLZxEzAeoiD/j73fke4qA7JtHRxdVmztDtusopSmGUQKdvvA26Jzl8gAtEYwIIbi90ny40FD69WNIlPmKzGk1YSrOPcgGnhZnb+9x93osDcoOaCNoIYXJyDq/bq7TWqePqCpfeqd7MTX20Ey6PwUnOk200TXGxtgXlaEsCGKia7qa+uCNufjsUoAKopJpFGyXQ2ePKdFsPmL9IoBkmUJM1IEPQUsC6euLcoL+hX+AqBPGyVj6yW96y7R/TCu2+JusTexGiwxXCc7ZuYYDhv3MvgCTE55dfFwSLK6dKT3jl0dAZWuUhfIdrJtBuAkuJtzPeFhrgylUhgZ5mP769Qz8stee/hphRkli7hZ0VVA9ysfZAeEW1fH/k5o1u9g4ANffMn1mSt3YtY9m0f+bixH794JtJnkk1PEtdxokXrw180APVGcmSaakzpVIYuPw2GAp1RqPtDmloRLN1z2YNA/YNQqQ5k9ST1OWy+eikeNSgkykcunSAAfOyALDCtmiN6mUaoRESujwx6kSbspBDXOIRnfxCZOHT/IK1y8V1uXO2c0zfNXo7Xs/GVpDVKKRzpCjOPka2uAqlu/iuDXBp83ggJkIYIuKh7MesVfEMVM6VI71j0JEjwDBFcDzPOtCOaF4no/iCCFJwAhRPBwJ3ky/EP
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR05MB3047.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2616005)(86362001)(508600001)(186003)(8936002)(38100700002)(36756003)(91956017)(66946007)(26005)(6512007)(76116006)(8676002)(66476007)(64756008)(4326008)(66556008)(71200400001)(66446008)(6916009)(966005)(122000001)(6486002)(6506007)(54906003)(316002)(83380400001)(2906002)(5660300002)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V0NCbTdDVzB2SWEvVWxvR1JHR3pwUkJOWGppZDdNeUZXazJIOWhFR3ZrVVFL?=
 =?utf-8?B?RjB2N2gzRDNDK3FjR01wVXVjTEtTUnIxWTFhS0dsV1V4UVB3Ylc1OE1TYUlu?=
 =?utf-8?B?cjF4eGNKRTZlazlZYWpNdWJ4Znhod2QyTGRmc1J1NWZ2WitIV1hiRGJISVRH?=
 =?utf-8?B?QzFuNUc5Sk5pS3U1SnVDNmRUZm45dmVhK2hZaHJFMjJxVjlwNVQ2UGlERTVD?=
 =?utf-8?B?eDhFVlZDeGlJckV2RUNwQ2Z0V0pUSXZCV0pBQXlLay9MMFZrWXZmM0FpR0lL?=
 =?utf-8?B?SzYvSzhBZVVSTDAwWERURGVxMFZ3SXMvaERHZ1I3N0JSaHNkanVFcWZzcTRw?=
 =?utf-8?B?eXVsN0NjZHhrN05FZTg4bzFieW5icU5HMmFZWFIvV09jcGFMM3NVUnNndkV3?=
 =?utf-8?B?RTBpMEpIT0R6S3Z6L3FGeFkrMk02UUVzb3lXUzRETEZ6RzhPVFAvWVBDY05L?=
 =?utf-8?B?ZUZiSW5jblkvMmhxRzlneUZ5TklIc1BxOGNIV2tNQWkxS2d1eXpnTTE1eXFq?=
 =?utf-8?B?bk85VGR0d0gwd1Z3dkVWUTNDdjc2NHFBQ3RoMkorb0hqTC9Dd1czWVhGUDZz?=
 =?utf-8?B?VDVTUjFwWHFhcEs4TUVyNDhncXdBWlpxdDBYOXYwNEt5SW5TbGhrKzhkVmhk?=
 =?utf-8?B?WWE0Z3R5Y1E2NmZMU3U4WXVtV1ExdWhuSzNDRUR0NUQzdzhUWlU1bjFpMld3?=
 =?utf-8?B?dkdwNk1zVmQxM090ZnJFUWZRbWpUUThXZWNxZytXbkNIZVYwVkVOb3lvckJS?=
 =?utf-8?B?ejdpbGxFZm1UdEFvaVBjQnJNOTJxMUFNMldzbGFOc2xCV0NsczJjenIrODdm?=
 =?utf-8?B?Qk5zeGFrWSt6YWN2SFJ3UVh5YWlId3UzODNnWXRmYmhqaUZlWWhZVVRkTHJx?=
 =?utf-8?B?QmQ4SHBuay81SG1ISWIxRUVuaVBHcksyWE9FQU01UG03MVQ1TWpiQnRrS1g2?=
 =?utf-8?B?dzkxOUtiSitUL2VCZVFGbXlLSHJEQUh2WFZOVDVqczBOSkRtMlNjeWY0ZHBW?=
 =?utf-8?B?YlVEUFlRVUd2MUV0NnUva0ZQbHBwZ2lHMk1GOHNNNUh2ZjJVSy90UHdJQVBq?=
 =?utf-8?B?d1hWbXZJdVBvNlhtbW1pYTFFUnhyR1FrSFRPTVg1TXM3Zy9EOWxTczRUbWsx?=
 =?utf-8?B?RzMzQUZkeTRkVmN4NXk0M0xDNDU4bks3MUVyUXN2RkRVM0xNVHZnSVlZSmxv?=
 =?utf-8?B?VXR5OXZaeXJBN1JEODJQbWJscDhvckI3VlR4M3hYaUZJNlNyeFp1RkVISFh0?=
 =?utf-8?B?REo2T2hDNC9FS3VzbFIvRVRNeC9nTkI3Z2ZaU08vRWMvQUZiVUNHWS8rdWdm?=
 =?utf-8?B?a1RSaktQUVVFSW9qeVgxTVJacUJmUm1TaHJDQ0psMHVMM2lQbWk0LzJ4MkxC?=
 =?utf-8?B?KzFQSU5QLzVYNjhqV3ZEMXJjT1RlMFVDRG9aUjZXZ3JhaGh4d3h3aHZVcXhK?=
 =?utf-8?B?SU5Kd0NxdlZXM0sxWmovQy9XWFVybWUrM0ptK2Y5UUpQYWhzem12bVFVK0FU?=
 =?utf-8?B?VGNwY05oblQ3eTZsVmhTZFFZRDRVZ1E1Tzk1dm5XYzJFV1g1bUFJakxKMFZ2?=
 =?utf-8?B?YTN0bGVMNkZwME9aSUdlMldiK2dydmwyN2pXeEJWTURsYmZ6ZTRacHdaOGZH?=
 =?utf-8?B?NVc5dkN0ZVhhN1UvOFdHemZnUXVrOFBjK2QyK0k0bjFIZzZBNWpDNldCY0cr?=
 =?utf-8?B?YSt4ejZBM1NYSmNHbHdRRnY1a1NJQ1RwOC9rV01OVmpzT3Y1TFR0aGdnN2ow?=
 =?utf-8?B?WE43K204WjAxRUM1ZGRncFdyemtoekUrTEh4TytlNy96Rjl6clJJNFJmdmsx?=
 =?utf-8?B?K09DVER6aW1qd1gvVGxMUzhLaFg2aDlMcFRxb3Y5RUtraHRRbktKMnU1REpp?=
 =?utf-8?B?SGVNVERRWUU2dVNNMUQ3WGxnTG1iZWE1b205ZFVXejcvaVhsTTdibHpheFIv?=
 =?utf-8?B?aW5QbVdQS3g5Q24zUVh1SlJmS1dvWmwwWkplYkE3SlVjNExyVUlRUlpmZ2Vj?=
 =?utf-8?B?M1dpQ05JdkU3VzZxOEVTMkNxTW8zMFdBdDNSdS9sWStwZ2QrZGZVelR0U3d2?=
 =?utf-8?B?YVRGK2JUL0JBcWNFZXdSMmx3MXJsVHBBOGE3bkV1bERhVytIRENIOWVaUEpX?=
 =?utf-8?B?UlI3Y1ppVEoxekRxZE1idGV5WHUweENnZkdHQUFmWGM2cURqeXR4aUJKaDBZ?=
 =?utf-8?B?aVA1THRudFh4eXhQdmNzYzFzOVN2TnRQNDZqY2l2R2I1K0t0VldyK2F5Mmsy?=
 =?utf-8?B?UGtsSHNvZEJ4T3paSS9PYlZROVAvbkZ5TG9rbmJJcTBnWHBreENmT1NxWkZQ?=
 =?utf-8?B?MmdZTXRtZjdnRVBoQklaK2hHVTdpdU1CckJpRW5hNVV0OWJtYWN2Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <996BB2CC3BC9C04E8E83C9584D113055@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR05MB3047.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60e43768-6874-4d20-f608-08da4a4fcb29
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2022 19:39:39.7274 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pac0HzjNsz42qLezClbzUYs8oqHmxz2fNX5l2FaZaBjFVe1wLWzEGzS+5HGQfQrU8cwZm/wBH2lf7TVJ0+tjXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR05MB8768
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
Cc: "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "gurchetansingh@chromium.org" <gurchetansingh@chromium.org>,
 Martin Krastev <krastevm@vmware.com>, "kraxel@redhat.com" <kraxel@redhat.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "wayland-devel@lists.freedesktop.org" <wayland-devel@lists.freedesktop.org>,
 Maaz Mombasawala <mombasawalam@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIyLTA2LTA4IGF0IDEwOjUzICswMzAwLCBQZWtrYSBQYWFsYW5lbiB3cm90ZToN
Cj4gT24gVHVlLCA3IEp1biAyMDIyIDE3OjUwOjI0ICswMDAwDQo+IFphY2sgUnVzaW4gPHphY2ty
QHZtd2FyZS5jb20+IHdyb3RlOg0KPiANCj4gPiBPbiBUdWUsIDIwMjItMDYtMDcgYXQgMTE6MDcg
KzAzMDAsIFBla2thIFBhYWxhbmVuIHdyb3RlOg0KPiA+ID4gT24gRnJpLCAwMyBKdW4gMjAyMiAx
NDoxNDo1OSArMDAwMA0KPiA+ID4gU2ltb24gU2VyIDxjb250YWN0QGVtZXJzaW9uLmZyPiB3cm90
ZToNCj4gPiA+ICAgDQo+ID4gPiA+IEhpLA0KPiA+ID4gPiANCj4gPiA+ID4gUGxlYXNlLCByZWFk
IHRoaXMgdGhyZWFkOg0KPiA+ID4gPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNo
aXZlcy9kcmktZGV2ZWwvMjAyMC1NYXJjaC90aHJlYWQuaHRtbCMyNTk2MTUNCj4gPiA+ID4gDQo+
ID4gPiA+IEl0IGhhcyBhIGxvdCBvZiBpbmZvcm1hdGlvbiBhYm91dCB0aGUgcGl0ZmFsbHMgb2Yg
Y3Vyc29yIGhvdHNwb3QgYW5kDQo+ID4gPiA+IG90aGVyIHRoaW5ncyBkb25lIGJ5IFZNIHNvZnR3
YXJlLg0KPiA+ID4gPiANCj4gPiA+ID4gSW4gcGFydGljdWxhcjogc2luY2UgdGhlIGRyaXZlciB3
aWxsIGlnbm9yZSB0aGUgS01TIGN1cnNvciBwbGFuZQ0KPiA+ID4gPiBwb3NpdGlvbiBzZXQgYnkg
dXNlci1zcGFjZSwgSSBkb24ndCB0aGluayBpdCdzIG9rYXkgdG8ganVzdCBleHBvc2UNCj4gPiA+
ID4gd2l0aG91dCBvcHQtaW4gZnJvbSB1c2VyLXNwYWNlIChlLmcuIHdpdGggYSBEUk1fQ0xJRU5U
X0NBUCkuDQo+ID4gPiA+IA0KPiA+ID4gPiBjYyB3YXlsYW5kLWRldmVsIGFuZCBQZWtrYSBmb3Ig
dXNlci1zcGFjZSBmZWVkYmFjay4NCj4gPiA+ID4gDQo+ID4gPiA+IE9uIFRodXJzZGF5LCBKdW5l
IDJuZCwgMjAyMiBhdCAxNzo0MiwgWmFjayBSdXNpbiA8emFja0BrZGUub3JnPiB3cm90ZToNCj4g
PiA+ID4gICANCj4gPiA+ID4gPiAtIGFsbCB1c2Vyc3BhY2UgY29kZSBuZWVkcyB0byBoYXJkY29y
ZSBhIGxpc3Qgb2YgZHJpdmVycyB3aGljaCByZXF1aXJlDQo+ID4gPiA+ID4gaG90c3BvdHMgYmVj
YXVzZSB0aGVyZSdzIG5vIHdheSB0byBxdWVyeSBmcm9tIGRybSAiZG9lcyB0aGlzIGRyaXZlcg0K
PiA+ID4gPiA+IHJlcXVpcmUgaG90c3BvdCIgICAgDQo+ID4gPiA+IA0KPiA+ID4gPiBDYW4geW91
IGVsYWJvcmF0ZT8gSSdtIG5vdCBzdXJlIEkgdW5kZXJzdGFuZCB3aGF0IHlvdSBtZWFuIGhlcmUu
DQo+ID4gPiA+ICAgDQo+ID4gPiANCj4gPiA+IEhpIFphY2sgYW5kIGV2ZXJ5b25lLA0KPiA+ID4g
DQo+ID4gPiBJIHdvdWxkIGxpa2UgdG8gdHJ5IHRvIHJlYm9vdCB0aGlzIGRpc2N1c3Npb24gYW5k
IGV4cGxhaW4gd2hlcmUgSSBjb21lDQo+ID4gPiBmcm9tLiBNYXliZSBJIGhhdmUgbWlzdW5kZXJz
dG9vZCBzb21ldGhpbmcuICANCj4gPiANCj4gPiA8c25pcD4gRmlyc3Qgb2YgYWxsIHRoYW5rcyBm
b3IgcmVzdGFydGluZyB0aGUgZGlzY3Vzc2lvbnMuIEkgdGhpbmsgR2VyZCBkaWQgYSBnb29kDQo+
ID4gam9iIHJlc3BvbmRpbmcgdG8gaW5kaXZpZHVhbCBwb2ludHMsIHNvIGxldCBtZSB0YWtlIGEg
c3RlcCBiYWNrIGFuZCBleHBsYWluIHRoZSBiaWcNCj4gPiBwaWN0dXJlIGhlcmUgc28gd2UgY2Fu
IHJlYm9vdC4NCj4gPiANCj4gPiA+IFdoaWNoIHJvb3QgcHJvYmxlbXMgZG8geW91IHdhbnQgdG8g
c29sdmUgZXhhY3RseT8gIA0KPiA+IA0KPiA+IFRoZSBwcm9ibGVtIHRoYXQgdGhpcyBwYXRjaCBz
ZXQgaXMgc29sdmluZyBpcyB0aGUgcmVsYXRpdmVseSB0cml2aWFsIHByb2JsZW0gb2Ygbm90DQo+
ID4gaGF2aW5nIGEgd2F5IG9mIHNldHRpbmcgdGhlIGhvdHNwb3QgaW4gdGhlIGF0b21pYyBrbXMg
aW50ZXJmYWNlLiBXaGVuIHdlDQo+ID4gKHZpcnR1YWxpemVkIGRyaXZlcnMpIGFyZSB1c2luZyB0
aGUgbmF0aXZlIGN1cnNvciB3ZSBuZWVkIHRvIGtub3cgbm90IG9ubHkgdGhlIGltYWdlDQo+IA0K
PiBDb3VsZCB5b3UgY2xhcmlmeSB3aGF0IGlzICJuYXRpdmUgY3Vyc29yIiBoZXJlPw0KPiBJIGd1
ZXNzIGl0IGlzIHRoZSBob3N0IHdpbmRvdyBzeXN0ZW0gcG9pbnRlcidzIGN1cnNvcj8NCg0KUmln
aHQsIGV4YWN0bHkuIEknbSBhIGxpdHRsZSBoZXNpdGFudCB0byBjYWxsIGl0ICJob3N0IiBiZWNh
dXNlIGl0IGdldHMgdHJpY2t5IGluDQpyZW1vdGUgc2NlbmFyaW9zLCB3aGVyZSB0aGUgaG9zdCBp
cyBzb21lIEVTWGkgc2VydmVyIGJ1dCB0aGUgbG9jYWwgbWFjaGluZSBpcyB0aGUNCm9uZSB0aGF0
J3MgYWN0dWFsbHkgaW50ZXJhY3Rpbmcgd2l0aCB0aGUgZ3Vlc3QuIFNvIGl0J3MgdGhlIGN1cnNv
ciBvZiB0aGUgbWFjaGluZQ0Kd2hlcmUgdGhlIGd1ZXN0IHNjcmVlbiBpcyBkaXNwbGF5ZWQuDQoN
Cg0KPiA+IE5vdywgd2hlcmUgdGhlIGRpc2FncmVlbWVudHMgY29tZSBmcm9tIGlzIGZyb20gdGhl
IGZhY3QgdGhhdCBhbGwgdmlydHVhbGl6ZWQgZHJpdmVycw0KPiA+IGRvIG5vdCBpbXBsZW1lbnQg
dGhlIGF0b21pYyBLTVMgY3Vyc29yIHBsYW5lIGNvbnRyYWN0IGV4YWN0bHkgYXMgc3BlY2lmaWVk
LiBJbg0KPiA+IGF0b21pYyBrbXMgd2l0aCB1bml2ZXJzYWwgcGxhbmVzIHRoZSAiY3Vyc29yIiBw
bGFuZSBjYW4gYmUgYW55dGhpbmcgc28gYXNraW5nIGZvcg0KPiA+IGhvdHNwb3QncyBmb3Igc29t
ZXRoaW5nIHRoYXQncyBub3QgYSBjdXJzb3IgaXMgYSBiaXQgc2lsbHkgKGJ1dCBhcmd1YWJseSBz
byBpcw0KPiA+IGNhbGxpbmcgaXQgYSBjdXJzb3IgcGxhbmUgYW5kIHRoZW4gY29tcGxhaW5pbmcg
dGhhdCBwZW9wbGUgZXhwZWN0IGN1cnNvciBpbiBpdCkuDQo+ID4gDQo+ID4gU28gdGhlIGFyZ3Vt
ZW50IGlzIHRoYXQgd2UgY2FuJ3QgcHV0IGhvdHNwb3QgZGF0YSBpbnRvIGF0b21pYyBrbXMgd2l0
aG91dCBmaXJzdA0KPiA+IHJld3JpdGluZyBhbGwgb2YgdGhlIHZpcnR1YWxpemVkIGRyaXZlcnMg
Y3Vyc29yIGNvZGUgdG8gZml4IHRoZSB1bmRlcmx5aW5nIGNvbnRyYWN0DQo+ID4gdmlvbGF0aW9u
IHRoYXQgdGhleSBhbGwgY29tbWl0LiBUaGF0IHdvdWxkIGxpa2VseSBiZSBhIGxvdCBlYXNpZXIg
c2VsbCBpZiBub3QgdGhhdA0KPiA+IGdub21lL2tkZSBkb24ndCBwdXQgbm9uZSBjdXJzb3Igc3R1
ZmYgaW4gdGhlIGN1cnNvciBwbGFuZSwgc28gYWxsIHRoaXMgd29yayBpcyB0bw0KPiA+IGZpeCBi
cmVha2FnZXMgdGhhdCBzZWVtIHRvIGFmZmVjdCAwIG9mIG91ciB1c2VycyAoYW5kIEkgY29tcGxl
dGVseSB1bmRlcnN0YW5kIHRoYXQNCj4gPiB3ZSdkIHN0aWxsIGxpa2UgYWxsIHRoZSBkcml2ZXJz
IHRvIGJlIGNvcnJlY3QgYW5kIHVuaWZpZWQgaW4gdGVybXMgb2YgdGhlaXINCj4gPiBiZWhhdmlv
dXIsIEknbSBqdXN0IHNheWluZyBpdCdzIGEgaGFyZCBzZWxsIHdpdGhvdXQgc29tZXRoaW5nIHRo
YXQgd2UgY2FuIHBvaW50IHRvDQo+ID4gYW5kIHNheSAidGhpcyBmaXhlcy9pbXByb3ZlcyB0aGlu
Z3MgZm9yIG91ciBjdXN0b21lcnMiKSANCj4gDQo+IFdoYXQncyB0aGUgY29zdCBvZiBtYWtpbmcg
cGFyYXZpcnR1YWxpemVkIGRyaXZlcnMgaG9ub3VyIHRoZSBVQVBJIGNvbnRyYWN0Pw0KPiBDYW4n
dCB5b3UgZG8gdGhhdCBvbiB0aGUgc2lkZSBvZiBpbXBsZW1lbnRpbmcgdGhlc2UgbmV3IGhvdHNw
b3QNCj4gcHJvcGVydGllcywgd2l0aCB0aGUgbGl0dGxlIGFkZGl0aW9uIHRvIGFsbG93aW5nIGd1
ZXN0IHVzZXJzcGFjZSB0byBiZQ0KPiBleHBsaWNpdCBhYm91dCB3aGV0aGVyIGl0IHN1cHBvcnRz
IGNvbW1hbmRlZXJpbmcgb3Igbm90Pw0KDQpJJ20gcmVsdWN0YW50IGhlcmUgYmVjYXVzZSAiZml4
aW5nIiBoZXJlIHNlZW1zIHRvIGJlIGEgYml0IGVwaGVtZXJhbCBhcyB3ZSBtb3ZlIGZyb20NCm9u
ZSBzb2x1dGlvbiB0byB0aGUgbmV4dC4gSSdtIGhhcHB5IHRvIHdyaXRlIGEgcGF0Y2ggdGhhdCdz
IGFkZGluZyBhDQpEUk1fQ0xJRU5UX0NBUF9WSVJUVUFMX0NVUlNPUl9BV0FSRSBmbGFnIGFuZCBo
aWRpbmcgdGhlIGN1cnNvciBwbGFuZSBpbiB2aXJ0dWFsaXplZA0KZHJpdmVycyBmb3IgY2xpZW50
cyB0aGF0IGFkdmVydGlzZSBEUk1fQ0xJRU5UX0NBUF9BVE9NSUMgYnV0IG5vdA0KRFJNX0NMSUVO
VF9DQVBfVklSVFVBTF9DVVJTT1JfQVdBUkUsIGJ1dCB0aGF0IGRvZXNuJ3Qgc29sdmUgV2VzdG9u
IG9uIHZpcnR1YWxpemVkDQpkcml2ZXJzLg0KDQpJIGZlZWwgbGlrZSB0aGF0J3MgYSBsYXJnZXIg
ZGlzY3Vzc2lvbi4gT25lIHRoYXQgd2UgbmVlZCB0byBoYXZlIGluIGdlbmVyYWwgLSBpdCdzDQph
Ym91dCBzdGFuZGFyZGlzaW5nIG9uIGJlaGF2aW91ciBvZiB1c2Vyc3BhY2Ugd2l0aCB2aXJ0dWFs
aXplZCBkcml2ZXJzLCBlLmcuIG9uDQpXZXN0b24gZXZlbiB0aGUgbW9zdCBiYXNpYyBmdW5jdGlv
bmFsaXR5IG9mIHZpcnR1YWxpemVkIGRyaXZlcnMgd2hpY2ggaXMgcmVzaXppbmcgYQ0Kd2luZG93
IGRvZXNuJ3Qgd29yayBjb3JyZWN0bHkgKHZpcnR1YWxpemVkIGRyaXZlcnMgc2VuZCBkcm1fa21z
X2hlbHBlcl9ob3RwbHVnX2V2ZW50DQp3aGljaCBzZW5kcyBhIEhPVFBMVUc9MSBldmVudCB3aXRo
IGEgY2hhbmdlZCBwcmVmZXJyZWQgd2lkdGgvaGVpZ2h0IGJ1dCBXZXN0b24NCmRvZXNuJ3Qgc2Vl
bSB0byByZXNpemUgdGhlIGZiIG9uIHRoZW0gd2hpY2ggcmVzdWx0cyBpbiBXZXN0b24gbm90IHJl
c2l6aW5nIHRvIHRoZQ0KbmV3IHNpemUgb2YgdGhlIHdpbmRvdykgb3IgZXZlbiBjb25zaWRlcmlu
ZyB0aGUgc3VnZ2VzdGVkX3ggYW5kIHN1Z2dlc3RlZF95DQpwcm9wZXJ0aWVzLiBJdCBzZWVtcyBs
aWtlIHdlIG1pZ2h0IG5lZWQgdG8gaGF2ZSBhIHdpZGVyIGRpc2N1c3Npb24gb24gc3RhbmRhcmRp
c2luZw0KdGhvc2UgY29tbW9uIGlzc3VlcyBvbiB2aXJ0dWFsaXplZCBkcml2ZXJzIGJlY2F1c2Ug
Y3VycmVudGx5LCBJJ20gZ3Vlc3NpbmcsIHRoYXQNCmFwYXJ0IGZyb20gR25vbWUgYW5kIEtERSBt
b3N0IGNvbXBvc2l0b3JzIGFyZSBjb21wbGV0ZWx5IGJyb2tlbiBvbiB2aXJ0dWFsaXplZA0KZHJp
dmVycy4NCg0KSSdkIHByZWZlciBub3QgYmxvY2tpbmcgZml4aW5nIGhvdHNwb3RzIHVudGlsIGFs
bCB0aG9zZSBpc3N1ZXMgYXJlIHJlc29sdmVkIHNvIGlmIHdlDQpjYW4gYWdyZWUgb24gd2hhdCB3
ZSdkIGxpa2UgdG8gZml4IGJlZm9yZSBob3RzcG90cyBnbyBpbiwgdGhhdCdkIGJlIGdyZWF0Lg0K
DQp6DQo=
