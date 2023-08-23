Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2352E785ACD
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 16:36:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9008610E427;
	Wed, 23 Aug 2023 14:36:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2070f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::70f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8096610E427
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 14:36:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h6aihGS1xS34Rwlkd0d7VvGl5rudWnWgs0BNZpzRIMmiC0ZRE6qyAc2Gc45YNZSUvUmEagQCZJBijzOa/bs39lPueXTUlP99Kplas3e/wfvI576/wcg4UHTTzF6u0SJC0aRHZhSAYkKGTI9/MRWFf2Z2FOWykt4uuR9fv+IfgEuakUpCaDD7PpeIiaNPw9weqhEGg+FPcjpIrcX9gLcXFHbEFAfkvJw3k9T7kAQmGNFYN9g+Bms6WbLHA6jzj9beK6NUKIrxkEPhmoALvvYygC/JYOz3vM3uZtGsfRnnh0rlIxvi8Em6ZZgRuaz9uXvUltm5I8lZT0AIP3p/2uZXzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yBV8cp5B9aevtQ1iG5EAaEPabwf5wU8cmAJjMw2uSfA=;
 b=EXRA0zPc/LQo909Id9GrcxUubDpxayDvYfPLuTfCHqfwXi9z8XqEQuQ/XMuoNHUiQCu4Kkmj+64fa+UFPcPuffvz7tZGGVCcfpC4xMvo4+ZHFjoBbYyuodxPFA228fCgS6PYqxFDvUGHfzcs6IiB+CR6gDkUSfreFV8js4E++SiE+fptikKcph4O6v0CmfyKj7BEwcIdd/04KPqjPNbAkBDfCn4n5JyCFubh02QGjGqaDG/M2hP3eYyp20UxPb75n8NfPz1SZ/xsm0rBDvRgxLu1ljqov2mQH/N9SKzD+efIjxTsOvRVUfGKmnWW5SgLjZVkTXxwaa1y3qtQZYCUpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yBV8cp5B9aevtQ1iG5EAaEPabwf5wU8cmAJjMw2uSfA=;
 b=pQmFs2akGK4q5La/Mxg5eeSqXwCC0GlJyfK0txxglUOaXhxbKLR33kw9ENscyFgySxuy0hBY8jEwEBEqRGS+lwswrmtwFk6s5/A0nnq32T97PYpn1o3JahRw/zohmAxPfVJKF26BFij75w7f6LkyTZ0jjvAyPpz9CCDjwJx2ttA=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYAPR01MB6041.jpnprd01.prod.outlook.com (2603:1096:402:31::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.26; Wed, 23 Aug
 2023 14:36:07 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706%4]) with mapi id 15.20.6699.026; Wed, 23 Aug 2023
 14:36:04 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Doug Anderson <dianders@chromium.org>
Subject: RE: [PATCH] drm/bridge/analogix/anx78xx: Extend match data support
 for ID table
Thread-Topic: [PATCH] drm/bridge/analogix/anx78xx: Extend match data support
 for ID table
Thread-Index: AQHZzcNjEmgmmPkABUWy2CTKLw1ZbK/4AAKAgAACe0A=
Date: Wed, 23 Aug 2023 14:36:04 +0000
Message-ID: <OS0PR01MB5922E0300F53BED1AFFD916E861CA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230813085137.74608-1-biju.das.jz@bp.renesas.com>
 <CAD=FV=W6aoaUuMx5OvG2xMX+fBG6B-c5Fmvmit4f2CTZq=x1vQ@mail.gmail.com>
In-Reply-To: <CAD=FV=W6aoaUuMx5OvG2xMX+fBG6B-c5Fmvmit4f2CTZq=x1vQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYAPR01MB6041:EE_
x-ms-office365-filtering-correlation-id: e4f253ca-e4dc-4384-3794-08dba3e647a7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4issDMgKfKXmL2dsqUV/3ohwL3XnJbs+gdn5ne72VqJ6lOFX+RsG2V52syYvWkb1gI2piAYR7mI06uXWMmblYVHuf0btm7eS38f6oZt4A7lacxUT0iNOjsOd5bmd/RRHOE8Phy+U7j0CKs7KI3OzAvm9lxboHQM3rq7xHLWjdbUeo2rvBgwJosQU0PC9qxnLv9vQ8v1s8GONkEIkzfHwsYv4fDSm9ign2zpTpaLU//3hW1x7N+1WZ8UoXIy6dAQuhPTOpmW2argfdNIbE9Bv4lwup0wzlSzZuwFAFF9aBHAtCZ9WIxXbVugH4Mn82sBjkQ/vovFqQ3cHzPVhUPb1I8X8Hj/oyl+keh/w6EGrLOe1rUuw2KzRufyCmdNIxaTsOJNiom7Yrd/fSpVhahIGTk28rTp2iaX7AEjkSquisPFSULAw5zpryqHfwpGvdpGhtxno/0jr1DlsuxDdfTU3y65/vlxiAOcwlBqnrFn9jL5X6CRffMMvonyyo44swGO2ldXcfEw8jjE9xH3B/4vGUSpP7xEOPe84XPUkfRcIGFP8IGVKXZVphdF3mXYsN//MWDW0NTeopk6kadk6nNaeGgwI3vWC7yc5qUUsOfYZIVgzcVNW6RVhYDyQU5NKABsX
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(396003)(366004)(136003)(39860400002)(1800799009)(451199024)(186009)(38070700005)(38100700002)(54906003)(64756008)(66446008)(122000001)(66556008)(66476007)(66946007)(76116006)(55016003)(9686003)(33656002)(478600001)(71200400001)(53546011)(6506007)(7696005)(86362001)(26005)(8676002)(8936002)(4326008)(52536014)(7416002)(5660300002)(41300700001)(2906002)(83380400001)(316002)(6916009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WjlWQVIzdWJsOXE3SkdyOGVoZmpnR3JGUHY2OGp4T2x6SmFua2FURFh1dFFv?=
 =?utf-8?B?WXM0b1dPa1h6UW1wNUlTeU5jejFHZ0UrL3ZQOTU1eDN2U0UzK0s0Z0w1dC8v?=
 =?utf-8?B?cmJEeXA1Yk5xL2FzOWFmSmVoZlRnb3drck93dWkxUHRFb2JtWWlVeEtXanU5?=
 =?utf-8?B?WEZPTWdMR1hmS1VYMHY5OFdDZXJibEZ6MStQRS9SUFRLT0wyVjFhU3QweUVB?=
 =?utf-8?B?Nzg4bHZySFZXVjhWazNYRWswYVZIcjhwL1dlL0FRdXBBN3g4ZEZLVkFYc0NM?=
 =?utf-8?B?U21kaFVlYjJ0b0JjNy9VRnMvODRFQVdqNGxEczlJV1ZYWHhrd0tVUFdKaTdX?=
 =?utf-8?B?dkx6MTQrNGs0a1Z0NmpTYlR1bDVXTUZ2b0xjY2lEMWhZQXByWVRCNWt1WXlD?=
 =?utf-8?B?SkxNcXVzMkpSKzZKTS9Yb3BsNlZRUEcwSk9tcGRubU9BeUc5NHR1L21HKzZ1?=
 =?utf-8?B?d050RVhYWEN2QjRPQUs5SUJRVFVScjdvSkZURHhqeEs0OWg1NnR5RU1MbWNj?=
 =?utf-8?B?b1c4ejY1eEFBRzNUdFN3aGdMYWZpdm1QdUhremFlY1RDMk13cmhmU2VqYnNC?=
 =?utf-8?B?djN2NTVYSnE5QnNBK0ZpWmwzTXhsV0Z2RmdFR2NvSzFDcXQveDl0R0o0QlFB?=
 =?utf-8?B?c2ZqYWhKQmkwMkRCSnNxS1AvUWJUcWdsYXIyUCtuTUV0dklLb3FCUm9Xb0pp?=
 =?utf-8?B?Qk5vaTZpNkVOZjgzY0VZc0lmc0ZqVXQ3RXlPSmpFTlN0NjJzLzhGRW9xNWlN?=
 =?utf-8?B?RmdaUjNmdlFPbXZsYVNNQUtXaTViY0VJT0VYMkkrb1o2NHdxZ2g5NGNzSlJH?=
 =?utf-8?B?Qy9nT25RWDhwclFqTTZ4cDNRZ2pyQnNKUzlRb3JmMkw0RVk2bTBzQW1kWGFo?=
 =?utf-8?B?L3J5cTBaK1VSVWc1WVllS1dlcWkzWk5LdllxN2g5VlN3RmM3UEZIU0Q3SXcx?=
 =?utf-8?B?NmhlYWowWGIveWsyTDhOSkxhWTB6bHh4M0FqMFp5bkxsYk5iZzQ4dWgwUlhv?=
 =?utf-8?B?aStocFVsb0I3N0pXZ3FzUFpHbC9BR1p6M3MrOWFWZ3p3aHlIT28wYW10NTVo?=
 =?utf-8?B?blRRZWU3Y1lPMHF3QzFhTm1tdEpuSjRzc3J2K0laOVo0aVN5WmU5UmRaTExq?=
 =?utf-8?B?VlZBcG1DSGNVNG10WVEyZkorU2s3ZWJ5VE1HUDdRNFN6aVFOUnBBelpZakFn?=
 =?utf-8?B?bldhYmVwcWliT2x1bGNyTnYyaG50bkhSSDY5U05pbmRRdEZWRno0aG9OSWhW?=
 =?utf-8?B?Znp6SjRMeXNjbDR1SUVoTWVjM25VOS9OWTh0WXNZZUtQL3RvK3hvTXZHNStO?=
 =?utf-8?B?SVJTUHNYZnV2TzR1M3ZQbjZQYlI2Zk14OEp3VDNPc0pheHVtQy9sR2hRUWtN?=
 =?utf-8?B?VW9RRTdFaEN5VmVmYndWS2h3TlhXSTdKcDl5M214TzNqNXFSWDVsUmNzSXdQ?=
 =?utf-8?B?OEcrdk95RFRYc2E0QkxmdmlEWmdJNFdNcVk0MkxGb3lScXhTMkEvVm5FZmRj?=
 =?utf-8?B?aWl2WllQSElUMmZrdDJCUmpIRkZzQWdLTkpOVWtaZW1oVXR3TFoyVW94czZ5?=
 =?utf-8?B?eWxPVXlsekw0bVBMclV6V0tkYXdoOUtUcmdIZW1GOFVjdEozV0lJQnYzVXZX?=
 =?utf-8?B?U2RlbTF0cDVlcjRVRXRzQUVCN1JGc1c2d0Qybm92QzhMWkhZZHJHVEFFUzFB?=
 =?utf-8?B?YzlQclZEbG1WTzVJa1E2RXVneHgvWXRsRy9GWDJQMURQc01WVytPU0pmYmZq?=
 =?utf-8?B?Y3hoVm9jbjhEOXZ0TVdiZnNPNFVkTlVRSjZWWDU1elhJd0ZxY0ZPVDhaTWVD?=
 =?utf-8?B?OEtURWQxb2lscnlkYkRJKzdtU2hUOGljbjR2YXBsTEZMMEk5ZGw2VUtnUndV?=
 =?utf-8?B?bmVyUFdkTElvT0FWTDVRb3FxbUZBZWpoT2dIcTV3VndsSGVPQnlmQ214QVRq?=
 =?utf-8?B?QzNOMXR4WnVHbEY1N1M2VzVSbWxOSFhFbUNPQlN1NkZkSnQ3QmFYVFJtMXM0?=
 =?utf-8?B?Y0RETzBEUXRVa0FLTTAyUzBweGhJT3M2OUhZRkUzS1pmUk10RElCL0JFUUp2?=
 =?utf-8?B?bkxOaDR4a3llYnZ5eVl0QjJSaFpwY29XNGpoSHRGMU1raGtBU3dyekZQRE8r?=
 =?utf-8?B?U0YvZEswYnI5RmNPUnFCNytTaW1sTTdybEJ0dzh3WWFaRXRmOUxzRSs0Wllh?=
 =?utf-8?B?aXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4f253ca-e4dc-4384-3794-08dba3e647a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2023 14:36:04.2840 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QjuGasb8n2cUSnFPXd2wPApHMuF2XQRpNQbIxbUfq0JR9qxrEryK2x2DiToH1bu44ig8Uc8Q49QBjvLnHlJGy5maFLu7mO8mnz/bZwlojuQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6041
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
Cc: =?utf-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Zhu Wang <wangzhu9@huawei.com>,
 Robert Foss <rfoss@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRG91ZyBBbmRlcnNvbiwNCg0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0vYnJpZGdlL2Fu
YWxvZ2l4L2FueDc4eHg6IEV4dGVuZCBtYXRjaCBkYXRhIHN1cHBvcnQNCj4gZm9yIElEIHRhYmxl
DQo+IA0KPiBIaSwNCj4gDQo+IE9uIFN1biwgQXVnIDEzLCAyMDIzIGF0IDE6NTHigK9BTSBCaWp1
IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IHdyb3RlOg0KPiA+DQo+ID4gVGhl
IGRyaXZlciBoYXMgSUQgIHRhYmxlLCBidXQgc3RpbGwgaXQgdXNlcyBkZXZpY2VfZ2V0X21hdGNo
X2RhdGEoKQ0KPiA+IGZvciByZXRyaWV2aW5nIG1hdGNoIGRhdGEuIFJlcGxhY2UgZGV2aWNlX2dl
dF9tYXRjaF9kYXRhLT4NCj4gPiBpMmNfZ2V0X21hdGNoX2RhdGEoKSBmb3IgcmV0cmlldmluZyBP
Ri9BQ1BJL0kyQyBtYXRjaCBkYXRhIGJ5IGFkZGluZw0KPiA+IG1hdGNoIGRhdGEgZm9yIElEIHRh
YmxlIHNpbWlsYXIgdG8gT0YgdGFibGUuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERh
cyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gLS0tDQo+ID4gVGhpcyBwYXRjaCBp
cyBvbmx5IGNvbXBpbGUgdGVzdGVkDQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvYW5hbG9naXgvYW5hbG9naXgtYW54Nzh4eC5jIHwgNCArKy0tDQo+ID4gIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBJdCBzZWVtcyBsaWtl
IHRoaXMgaXMgYSBzaWduIHRoYXQgbm9ib2R5IGlzIGFjdHVhbGx5IHVzaW5nIHRoZSBpMmMgbWF0
Y2gNCj4gdGFibGUuIEl0IHdhcyBwcm9iYWJseSBhZGRlZCBiZWNhdXNlIHRoZSBvcmlnaW5hbCBh
dXRob3IganVzdCBjb3B5L3Bhc3RlZA0KPiBmcm9tIHNvbWV0aGluZyBlbHNlLCBidXQgb2J2aW91
c2x5IGl0IGhhc24ndCBiZWVuIGtlcHQgdXAgdG8gZGF0ZSBhbmQgaXNuJ3QNCj4gd29ya2luZy4g
V2hpbGUgeW91ciBwYXRjaCB3b3VsZCBtYWtlIGl0IHdvcmsgZm9yICJhbng3ODE0IiwgaXQgd291
bGRuJ3QNCj4gbWFrZSBpdCB3b3JrIGZvciBhbnkgb2YgdGhlIG90aGVyIHNpbWlsYXIgcGFydHMu
IC4uLmFuZCB5ZXMsIHlvdSBjb3VsZCBhZGQNCj4gc3VwcG9ydCBmb3IgdGhvc2UgcGFydHMgaW4g
eW91ciBwYXRjaCB0b28sIGJ1dCBJTU8gaXQgbWFrZXMgbW9yZSBzZW5zZSB0bw0KPiBqdXN0IGRl
bGV0ZSB0aGUgaTJjIHRhYmxlIGFuZCB3aGVuIHNvbWVvbmUgaGFzIGFuIGFjdHVhbCBuZWVkIHRo
ZW4gdGhleSBjYW4NCj4gcmUtYWRkIGl0Lg0KPiANCj4gU291bmQgT0s/DQoNClllcywgaXQgbWFr
ZSBzZW5zZSwgYXMgaXQgc2F2ZXMgc29tZSBtZW1vcnkuDQoNCkNoZWVycywNCkJpanUNCg==
