Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A10B4FB531
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 09:47:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01C2210EFE9;
	Mon, 11 Apr 2022 07:47:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60062.outbound.protection.outlook.com [40.107.6.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3E4910EFE9
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 07:47:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OgAZErSg7x41+bbuBwyf5mfp8PfctqX5fe/fG/lyKlL9bAC6HQk9RSIl2SkPD5gUZ50770SCJUpZnI2GBjH3FDaG0NF1Lw7xHPQooWm/hfqWYX3cIVVQYaaCiJysk1GWqZFmRr3Juf/Dv3gwKyyW1K5APA4JxIaxXw0AoxPoCMPM06fpx1lwpmaJjsVFfj+YGlPanB7M90krBw4ZtBlcXBnLdLBtYUUHAoDZuSLr6E6UJR5DgqCQq8Wh2lpbKUlh8fmyynN1aXn6U7tkmEblVTniBePSjTfLGyPP0uP7wH1ywFHMQoAyJ/34/PVBXJhzHoPEDChs7yptRZMMfRClWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f8xxOA5tTjTt95ipZbeqSwhKZW2KMVR3VPSuV0Tbj5Y=;
 b=ftJJJ5d9UGgLsK6Wb2KkauTaEmNHeLr/NN/ChLUgUi+7CnHdFJNt6giLzR3R/oR9gr/1b3VkKhW13sLoa4RLzBw0hrl/5s+iSpZvoeFzz9V7fTQtJhVZSG0CW3hOKDcC3DHDbtLYXe5gDHH+3rXXygmkUNB7Ly2nGb55/B75yOqkPU/u03Givb4g4t5DAZEUyOs3PQx1y5xp266mULXOjkNaSIsYLDjkbH93cmYJe/LSrRFlNgzpJpdTiWVNgHlGE2wVIhvrLUE8oCOOLA0bmG5c2JBr6+/GAuT9yglwDdMVJ+fUL8dTu6SliIh7DLdNyuq3J80ijL67rP4fVpnDhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f8xxOA5tTjTt95ipZbeqSwhKZW2KMVR3VPSuV0Tbj5Y=;
 b=IFxqe1RHZE1Lb/dWI12A2mGy/FIJaebMCFvbpUqIijizZjZjgIVfvJtNbpw7EsMD+7+1xccfz9/r7ywNTyWa3YPg29hsTouIx8msX/J9xVBZltWVU1urX0n/80Mge5Mpjvv/s76P3EtYOqKZRS0zYHH2KL+KH8l2z6sit/O70YI=
Received: from DB7PR04MB5450.eurprd04.prod.outlook.com (2603:10a6:10:86::11)
 by DB7PR04MB4906.eurprd04.prod.outlook.com (2603:10a6:10:21::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 07:47:13 +0000
Received: from DB7PR04MB5450.eurprd04.prod.outlook.com
 ([fe80::7997:2892:d230:2430]) by DB7PR04MB5450.eurprd04.prod.outlook.com
 ([fe80::7997:2892:d230:2430%7]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 07:47:13 +0000
From: Sandor Yu <sandor.yu@nxp.com>
To: =?utf-8?B?SmVybmVqIMWga3JhYmVj?= <jernej.skrabec@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>, "robert.foss@linaro.org"
 <robert.foss@linaro.org>, "Laurent.pinchart@ideasonboard.com"
 <Laurent.pinchart@ideasonboard.com>, "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>, Neil Armstrong
 <narmstrong@baylibre.com>
Subject: RE: [EXT] Re: [PATCH v2 1/5] drm: bridge: dw_hdmi: cec: Add cec
 suspend/resume function
Thread-Topic: [EXT] Re: [PATCH v2 1/5] drm: bridge: dw_hdmi: cec: Add cec
 suspend/resume function
Thread-Index: AQHYSzQIE6381L2540mTD9C6EIcgh6zmBlMAgALqaQCAAQ8vAA==
Date: Mon, 11 Apr 2022 07:47:13 +0000
Message-ID: <DB7PR04MB545064049A36468CA859CE61F4EA9@DB7PR04MB5450.eurprd04.prod.outlook.com>
References: <cover.1649412256.git.Sandor.yu@nxp.com>
 <45739041a743cd435415ca53264678e57a653147.1649412256.git.Sandor.yu@nxp.com>
 <4a6a4b70-3e24-3043-4e9d-f62e4798f28b@baylibre.com>
 <3658461.kQq0lBPeGt@jernej-laptop>
In-Reply-To: <3658461.kQq0lBPeGt@jernej-laptop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e9a6b070-baf6-4613-2414-08da1b8f7de5
x-ms-traffictypediagnostic: DB7PR04MB4906:EE_
x-microsoft-antispam-prvs: <DB7PR04MB490651C9093B15652173F7B9F4EA9@DB7PR04MB4906.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jaUIVHhTYLYiLXFiDLwEaXrF45RqjldjVwgjGGveFA8Y2baASsN0Vm+IaC1EhTHTDD3Hm4mvH+CTPnv6MvD7oXYb13BgY08BTcYsJR1jpzdWWcer3kEkejpLoI3zMKwH+pWews1zlcMPQBU4la+cAYYMujZv7CPH9qUj1SKoi5BwI82+Z5RiA3t/3Y6uz7cvLVCFLRqx0uu4X5hyNsXgf0sxBzfbEFb9U5IS8ZVYpa1zjTVq7hjUUdvN43SxZSqM6wAbLFlMGBQkhzNzYLO0iA3O7Xb2jeDmX0gy02OueVXYra5F+CkcNMspcFcb0ldHZFIPeA27jMtbyUOnyhhtKYQyZ0PiCb7Yg2ddtmxOTEDydoEi5Dno4psysDRODhZbKS0s/wxdKtvr42xOTBoQHWUVmpS9kbnZK2Y73FmX6UHbNfX1+bTQZn0Fw2uPpSFytRKU+e9OokXU8j2sxTmaFdjqMXJQooy2cRdiNmJu19IxdgVaBotdl5qcpqSXGr4d4T5umrwF98t1FDrwwGQ5Ph7T80/uhBqQMm9e19WBetJUjCKFUjou5Txe5LLpV5SdFL0Anra5Uutc9Yw1ZEM9O1CwrK1Awnud8Ve2EeVzpN+yX9TAPjMIIIXYvouD6ZX4R+Nns5ELhmrQO8gW8hjKMMgmvG9L9fNtBQLQNnXkBSAMwKNoRBVNVHFEzj7RZ3gxzIOuYphQbEjofPXBJRebbA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB7PR04MB5450.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(76116006)(8936002)(7416002)(5660300002)(71200400001)(66946007)(66556008)(44832011)(38070700005)(66476007)(55016003)(38100700002)(9686003)(7696005)(186003)(33656002)(6506007)(53546011)(26005)(66574015)(122000001)(15650500001)(508600001)(2906002)(86362001)(110136005)(54906003)(83380400001)(64756008)(66446008)(8676002)(4326008)(52536014)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aWtNcFZXT21vSWVIMGZMaEhWTngzVWdndDRGUHRWZ1hwRVhPMTlObTZEc20w?=
 =?utf-8?B?VjJ4eDcxN054OU5JS25tOS85TnZIa2xrOGxQTHRlVDJFTGc2aDh5YXpOSUhl?=
 =?utf-8?B?THF3N1VOR050Q1Axb1ZmUXB1amdxV3Y4MlFKZUNoV2p1c2tJNHdUN0ovK3RZ?=
 =?utf-8?B?anNrcXQ1NzRKT291aU93Tm5RcTk5em9XL0tpbmRiY3pXSHFJR3Fyb2REM29u?=
 =?utf-8?B?RkNKc3hLdnhMVHg5azlKeEVIN05aTVBlVzFhTkQ5MmxsN2l6SFlVS282cm9S?=
 =?utf-8?B?Ri9laStnYzlrQnc1QkU0WmdaNkRySFpUbE56emdndFlJV3NWL1dRRnBwQ1F3?=
 =?utf-8?B?eGY0OS9zcWhVeFNLQU05Zit1UmZCYzZMcGRpWnFEb3lyWDk4ZnNFRVRjU2lO?=
 =?utf-8?B?QjlMQmU3ZFZSQjVzbzloL0QyR1dVaTlGNVdSN3hyUGV5WWIzWW0vQ2FKU0E4?=
 =?utf-8?B?Ni9xMkpkclVFNy85dzYycmZMTkFybGpLYlRxN2lkZGdTRlB0Wk5lN2I0YU1m?=
 =?utf-8?B?R1FjcjFCZ0ozdDNmZmkra09lWFB4dDdDYVUzenVQUWFIM0x2V0ZaMVJXV2pZ?=
 =?utf-8?B?QnljWmtTRDFWb2xPZmZwZE5YeFFxWFdyZEdDc3htTks5eGNkbCtCbHBJL0tM?=
 =?utf-8?B?RnFUOXQ1RmlEWjZVZys1YnZqY3Q2WEkvRzBGZjIzT25WYjF3SEdWaVBJOFoz?=
 =?utf-8?B?YWRYRGRMVTQwSThrMUN3QnNqdEE1QlpCUGlaaHV3dUJuNENDZnZka3BDaWRk?=
 =?utf-8?B?ZEdHMnUxSG0vMmtPZEJTekQ0UjdxN3BPeWVuRGl1cnE1VmQ4T0FwYVhlOXJL?=
 =?utf-8?B?aVZaQ205ZEhZd1V4d3NGZDFkYTdsbGV1YytreDNaMkY1WWlKQWhvL0Nyd1lh?=
 =?utf-8?B?SVBVYzJpQjJ3eTRRYldHY1FuUTdjeStoOEpndlY3K3NMRDFOYkxKbWh2WEtQ?=
 =?utf-8?B?VG55WG9OMVplYTRwbUpiMGpJMVFjQVplaUhoMmpoWnVKVzdodHFPTGR5YXRj?=
 =?utf-8?B?TWN2QTUxQUkyRU82Mi9jenl5WCtLRW4zQk9wbzVUNUQyM0J6Qmh0UUMxeVEy?=
 =?utf-8?B?MEd6ZDlHZGRZNC9sbExQWXFFVnRUMGs1R3ZFQXgrT1hTdWxCQWorY0J2SDRo?=
 =?utf-8?B?UEtndlVLbXhGeHZnMDJtUnhrL05RK2NZRG9LVnk4RmRmcWRNaXgxdS9QVmUx?=
 =?utf-8?B?Nk02WkREV3RkUjZ5Ti9SUXNnbXgreC8rbk0zbUllUmoxQldEYWM2OGVrQ05G?=
 =?utf-8?B?cTdGYkUrUFEyTzh4Mm5MZUZLSGlzaVhyUC9zdGVyMW9ZbFpqL3FRc2NXNGl0?=
 =?utf-8?B?bHIxRkZmd2lIQThCNzZZWmJFd3RBT2kwUnAxUk81SlRiK05qWVVqYjFkbFNL?=
 =?utf-8?B?OHJTakJhaUFxQUJ3NVhoQXBML3krRnNXejVPWndOemRJRDFIdHhwOGhlUjRq?=
 =?utf-8?B?RTg3N1UybW1WNDQ0RGZEM0ZJRllBU2NaTkFlZDJpK3VFekVxRERQMWtQemNM?=
 =?utf-8?B?WHREWVFhNmN5QVJYdWtBUFRhRGNSR0tHQWdQc0NwbU41cFNNeFJid0JzWGdx?=
 =?utf-8?B?R056WFB4WlgrMXJzcm5xK0h1L2dTeGdraDlSZ0szd09HYUtFaGJxdVh0bk1K?=
 =?utf-8?B?OXBwSGhMeWpPaVlsTFcwUG9lZG16Rnp0VVBLazMwVnVvZ3FmY1hDMTZFNDVt?=
 =?utf-8?B?d0oyVGtPeC9LNjVPS1IxVTJpajJScnpodXErREpCd0VQQ1NMMWlTaFF4R0pR?=
 =?utf-8?B?ZlVaUlN2cEVUWlFOOWNkQ0o4UndIcStRRXYydjNsKzZMUDZHVEtNZDQxNHls?=
 =?utf-8?B?WHlGNWRRVkh3Qmk4S1lHSWg4QlY5cFhici9vSUJlc2JJSW44QnBPNGhkb3JH?=
 =?utf-8?B?RDZRM0tlU1VtTmFzVVVZS3RoZEthMGtNdFd1N1BKMC8rd0ZySi9FK0VKdGIz?=
 =?utf-8?B?MGVieGdyaXREY2t0RlE5c0o2REJaR29XRTRrd29vMlVIb1hkeERjNXVhVk1y?=
 =?utf-8?B?NUE3TElhT3pVbkdQQS95NUN0YXI1M0duaHpITkt2cExMTDZaczh6QXh2NlNY?=
 =?utf-8?B?MXpjWnY1T0VGZW5oU1NPQzRsbE5lRHNiSzlLdUJSTnBndUpTZWxpTG0rMHBC?=
 =?utf-8?B?UU5IUDh2LzBZbFpsSEx5NWxIUDZmNWpSZXdMVDRtWWlEYlZUWG1hSStNbk92?=
 =?utf-8?B?QWZRWGNxTGwyazdGdGQraE9GTTVtN3NtbStqdlFXUlhMSHdHZXl2WUdTVFF2?=
 =?utf-8?B?Y3NDd1BlV3lEcUhwOGhiRW9VWjgvb2FEQTBiMCtJUmNRYWExb3czajdXSkg0?=
 =?utf-8?Q?CLJZ80DuddEl7skU4G?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5450.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9a6b070-baf6-4613-2414-08da1b8f7de5
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2022 07:47:13.2163 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y5jg4gL44pCE5px1Qxo2Lo/tM++UJEix+hVkgSqliUaxd3AnKRlbK9yjv7H1q5dMttuYS+UM8IusFYyniz+nrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4906
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
Cc: "S.J. Wang" <shengjiu.wang@nxp.com>,
 "cai.huoqing@linux.dev" <cai.huoqing@linux.dev>,
 "maxime@cerno.tech" <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEplcm5laiDFoGtyYWJlYyA8
amVybmVqLnNrcmFiZWNAZ21haWwuY29tPg0KPiBTZW50OiAyMDIy5bm0NOaciDEw5pelIDE4OjEz
DQo+IFRvOiBTYW5kb3IgWXUgPHNhbmRvci55dUBueHAuY29tPjsgZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZzsNCj4gbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgYW5kcnplai5o
YWpkYUBpbnRlbC5jb207DQo+IHJvYmVydC5mb3NzQGxpbmFyby5vcmc7IExhdXJlbnQucGluY2hh
cnRAaWRlYXNvbmJvYXJkLmNvbTsNCj4gam9uYXNAa3dpYm9vLnNlOyBodmVya3VpbC1jaXNjb0B4
czRhbGwubmw7IE5laWwgQXJtc3Ryb25nDQo+IDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4NCj4g
Q2M6IFMuSi4gV2FuZyA8c2hlbmdqaXUud2FuZ0BueHAuY29tPjsgY2FpLmh1b3FpbmdAbGludXgu
ZGV2Ow0KPiBtYXhpbWVAY2Vybm8udGVjaDsgaGFycnkud2VudGxhbmRAYW1kLmNvbQ0KPiBTdWJq
ZWN0OiBbRVhUXSBSZTogW1BBVENIIHYyIDEvNV0gZHJtOiBicmlkZ2U6IGR3X2hkbWk6IGNlYzog
QWRkIGNlYw0KPiBzdXNwZW5kL3Jlc3VtZSBmdW5jdGlvbg0KPiANCj4gQ2F1dGlvbjogRVhUIEVt
YWlsDQo+IA0KPiBEbmUgcGV0ZWssIDA4LiBhcHJpbCAyMDIyIG9iIDE1OjQxOjM2IENFU1QgamUg
TmVpbCBBcm1zdHJvbmcgbmFwaXNhbChhKToNCj4gPiBPbiAwOC8wNC8yMDIyIDEyOjMyLCBTYW5k
b3IgWXUgd3JvdGU6DQo+ID4gPiBDRUMgaW50ZXJydXB0IHN0YXR1cy9tYXNrIGFuZCBsb2dpY2Fs
IGFkZHJlc3MgcmVnaXN0ZXJzIHdpbGwgYmUNCj4gPiA+IHJlc2V0IHdoZW4gZGV2aWNlIGVudGVy
IHN1c3BlbmQuDQo+ID4gPiBJdCB3aWxsIGNhdXNlIGNlYyBmYWlsIHRvIHdvcmsgYWZ0ZXIgZGV2
aWNlIHJlc3VtZS4NCj4gPiA+IEFkZCBDRUMgc3VzcGVuZC9yZXN1bWUgZnVuY3Rpb25zLCByZWlu
aXRpYWxpemUgbG9naWNhbCBhZGRyZXNzDQo+ID4gPiByZWdpc3RlcnMgYW5kIHJlc3RvcmUgaW50
ZXJydXB0IHN0YXR1cy9tYXNrIHJlZ2lzdGVycyBhZnRlciByZXN1bWUuDQo+ID4gPg0KPiA+ID4g
U2lnbmVkLW9mZi1ieTogU2FuZG9yIFl1IDxTYW5kb3IueXVAbnhwLmNvbT4NCj4gPiA+IC0tLQ0K
PiA+ID4NCj4gPiA+ICAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLWNl
Yy5jIHwgMzcNCj4gKysrKysrKysrKysrKysrKysrKw0KPiA+ID4gICAxIGZpbGUgY2hhbmdlZCwg
MzcgaW5zZXJ0aW9ucygrKQ0KPiA+ID4NCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWktY2VjLmMNCj4gPiA+IGIvZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLWNlYy5jIGluZGV4DQo+ID4gPiBjOGY0NGJjYjI5OGEu
LmFiMTc2NDAxYjcyNyAxMDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
c3lub3BzeXMvZHctaGRtaS1jZWMuYw0KPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9zeW5vcHN5cy9kdy1oZG1pLWNlYy5jDQo+ID4gPiBAQCAtNjIsNiArNjIsMTAgQEAgc3RydWN0
IGR3X2hkbWlfY2VjIHsNCj4gPiA+DQo+ID4gPiAgICAgYm9vbCByeF9kb25lOw0KPiA+ID4gICAg
IHN0cnVjdCBjZWNfbm90aWZpZXIgKm5vdGlmeTsNCj4gPiA+ICAgICBpbnQgaXJxOw0KPiA+ID4N
Cj4gPiA+ICsNCj4gPiA+ICsgICB1OCByZWdzX3BvbGFyaXR5Ow0KPiA+ID4gKyAgIHU4IHJlZ3Nf
bWFzazsNCj4gPiA+ICsgICB1OCByZWdzX211dGVfc3RhdDA7DQo+ID4gPg0KPiA+ID4gICB9Ow0K
PiA+ID4NCj4gPiA+ICAgc3RhdGljIHZvaWQgZHdfaGRtaV93cml0ZShzdHJ1Y3QgZHdfaGRtaV9j
ZWMgKmNlYywgdTggdmFsLCBpbnQNCj4gPiA+IG9mZnNldCkNCj4gPiA+DQo+ID4gPiBAQCAtMzA2
LDExICszMTAsNDQgQEAgc3RhdGljIGludCBkd19oZG1pX2NlY19yZW1vdmUoc3RydWN0DQo+ID4g
PiBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpPg0KPiA+ID4gICAgIHJldHVybiAwOw0KPiA+ID4NCj4g
PiA+ICAgfQ0KPiA+ID4NCj4gPiA+ICtzdGF0aWMgaW50IF9fbWF5YmVfdW51c2VkIGR3X2hkbWlf
Y2VjX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpIHsNCj4gPiA+ICsgICBzdHJ1Y3QgZHdfaGRt
aV9jZWMgKmNlYyA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOw0KPiA+ID4gKw0KPiA+ID4gKyAgIC8q
IFJlc3RvcmUgbG9naWNhbCBhZGRyZXNzICovDQo+ID4gPiArICAgZHdfaGRtaV93cml0ZShjZWMs
IGNlYy0+YWRkcmVzc2VzICYgMjU1LCBIRE1JX0NFQ19BRERSX0wpOw0KPiA+ID4gKyAgIGR3X2hk
bWlfd3JpdGUoY2VjLCBjZWMtPmFkZHJlc3NlcyA+PiA4LCBIRE1JX0NFQ19BRERSX0gpOw0KPiA+
ID4gKw0KPiA+ID4gKyAgIC8qIFJlc3RvcmUgaW50ZXJydXB0IHN0YXR1cy9tYXNrIHJlZ2lzdGVy
ICovDQo+ID4gPiArICAgZHdfaGRtaV93cml0ZShjZWMsIGNlYy0+cmVnc19wb2xhcml0eSwgSERN
SV9DRUNfUE9MQVJJVFkpOw0KPiA+ID4gKyAgIGR3X2hkbWlfd3JpdGUoY2VjLCBjZWMtPnJlZ3Nf
bWFzaywgSERNSV9DRUNfTUFTSyk7DQo+ID4gPiArICAgZHdfaGRtaV93cml0ZShjZWMsIGNlYy0+
cmVnc19tdXRlX3N0YXQwLA0KPiA+ID4gKyBIRE1JX0lIX01VVEVfQ0VDX1NUQVQwKTsNCj4gPiA+
ICsNCj4gPiA+ICsgICByZXR1cm4gMDsNCj4gPiA+ICt9DQo+ID4gPiArDQo+ID4gPiArc3RhdGlj
IGludCBfX21heWJlX3VudXNlZCBkd19oZG1pX2NlY19zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRl
dikgew0KPiA+ID4gKyAgIHN0cnVjdCBkd19oZG1pX2NlYyAqY2VjID0gZGV2X2dldF9kcnZkYXRh
KGRldik7DQo+ID4gPiArDQo+ID4gPiArICAgLyogc3RvcmUgaW50ZXJydXB0IHN0YXR1cy9tYXNr
IHJlZ2lzdGVyICovDQo+ID4gPiArICAgIGNlYy0+cmVnc19wb2xhcml0eSA9IGR3X2hkbWlfcmVh
ZChjZWMsIEhETUlfQ0VDX1BPTEFSSVRZKTsNCj4gPiA+ICsgICAgY2VjLT5yZWdzX21hc2sgPSBk
d19oZG1pX3JlYWQoY2VjLCBIRE1JX0NFQ19NQVNLKTsNCj4gPiA+ICsgICAgY2VjLT5yZWdzX211
dGVfc3RhdDAgPSBkd19oZG1pX3JlYWQoY2VjLA0KPiA+ID4gKyBIRE1JX0lIX01VVEVfQ0VDX1NU
QVQwKTsNCj4gPiA+ICsNCj4gPiA+ICsgICByZXR1cm4gMDsNCj4gPiA+ICt9DQo+ID4gPiArDQo+
ID4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBkZXZfcG1fb3BzIGR3X2hkbWlfY2VjX3BtID0gew0K
PiA+ID4gKyAgIFNFVF9TWVNURU1fU0xFRVBfUE1fT1BTKGR3X2hkbWlfY2VjX3N1c3BlbmQsDQo+
IGR3X2hkbWlfY2VjX3Jlc3VtZSkNCj4gPiA+ICt9Ow0KPiA+ID4gKw0KPiA+ID4NCj4gPiA+ICAg
c3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgZHdfaGRtaV9jZWNfZHJpdmVyID0gew0KPiA+
ID4NCj4gPiA+ICAgICAucHJvYmUgID0gZHdfaGRtaV9jZWNfcHJvYmUsDQo+ID4gPiAgICAgLnJl
bW92ZSA9IGR3X2hkbWlfY2VjX3JlbW92ZSwNCj4gPiA+ICAgICAuZHJpdmVyID0gew0KPiA+ID4N
Cj4gPiA+ICAgICAgICAgICAgIC5uYW1lID0gImR3LWhkbWktY2VjIiwNCj4gPiA+DQo+ID4gPiAr
ICAgICAgICAgICAucG0gPSAmZHdfaGRtaV9jZWNfcG0sDQo+ID4gPg0KPiA+ID4gICAgIH0sDQo+
ID4gPg0KPiA+ID4gICB9Ow0KPiA+ID4gICBtb2R1bGVfcGxhdGZvcm1fZHJpdmVyKGR3X2hkbWlf
Y2VjX2RyaXZlcik7DQo+ID4NCj4gPiBBcyBIYW5zIHNhaWQgb24gdjEsIHdoeSBkb24ndCB5b3Ug
Y2FsbCBkd19oZG1pX2NlY19lbmFibGUoY2VjLT5hZGFwLA0KPiA+IGZhbHNlKSBpbiBzdXNwZW5k
IGFuZCBkd19oZG1pX2NlY19lbmFibGUoY2VjLT5hZGFwLCB0cnVlKSBpbiByZXN1bWUgPw0KPiA+
DQo+ID4gV2l0aCB0aGlzLCBDRUMgZW5naW5lIGlzIG5vdCBkaXNhYmxlZCBvbiBzdXNwZW5kLg0K
PiANCj4gVGhpcyBzaG91bGQgbm90IGJlIGRvbmUsIGF0IGxlYXN0IG5vdCB1bmNvbmRpdGlvbmFs
bHkuIENFQyB3YWtldXANCj4gZnVuY3Rpb25hbGl0eSBpcyB1c2VkIGJ5IENydXN0IGZpcm13YXJl
IGZvciBBbGx3aW5uZXIgYm9hcmRzLiBJbiBmYWN0LCBEVyBIRE1JDQo+IENFQyBjb250cm9sbGVy
IHdhcyBkZXNpZ25lZCB3aXRoIHN1c3BlbmQvcmVzdW1lIGZ1bmN0aW9uYWxpdHkgaW4gbWluZC4g
SWYNCj4gcHJvcGVybHkgc2V0LCBpdCBjYW4gYXV0b25vbW91c2x5IHNjYW4gZm9yIHByZXNldCBD
RUMgbWVzc2FnZXMgYW5kIGdlbmVyYXRlDQo+IGludGVycnVwdCB3aGVuIGZvdW5kLg0KPiANCj4g
QWN0dWFsbHksIEknbSBub3QgZmFuIG9mIHRoaXMgcGF0Y2gsIHNpbmNlIGl0IGxvb2tzIGxpa2Ug
d29ya2Fyb3VuZCBmb3IgcG93ZXINCj4gbWFuYWdlbWVudCBmaXJtd2FyZSBub3QgcmVzdG9yaW5n
IHByZXZpb3VzIHN0YXRlLiBPciBpcyB0aGlzIEhXIGlzc3VlPyBJbg0KPiBhbnkgY2FzZSwgQWxs
d2lubmVyIFNvQ3Mgd2l0aCBEVy1IRE1JIENFQyBkb24ndCBuZWVkIHJlc3RvcmluZyBhbnkgcmVn
aXN0ZXIsDQo+IHNvIGl0J3MgY2VydGFpbmx5IG5vdCBhIGdlbmVyYWwgaXNzdWUuDQo+IA0KRm9y
IE5YUCBpLk1YOE1QbHVzIFNPQywgQ0VDIHdha2V1cCBmdW5jdGlvbiBpcyBub3QgcmVxdWlyZWQu
DQpBbmQgdGhlIEhETUkgVFggcG93ZXIgZG9tYWluIGNvdWxkIGJlIGdhdGVkIG9mZiB3aXRoIENF
QyBlbmdpbmUgd2hlbiBzdXNwZW5kLiANClJlc3RvcmUgdGhvc2UgcmVnaXN0ZXJzIGluIG9yZGVy
IHRvIGtlZXAgRUFSQy9BUkMgaW4gd29ya2luZyBhZnRlciByZXN1bWUgd2hlbiBIRE1JIFRYIHBv
d2VyIGRvbWFpbiBvZmYgaW4gc3VzcGVuZC4NCkl0IGNvdWxkIGJlIHVzZSBieSBvdGhlciBTT0Mg
Zm9yIGV4dHJlbWVseSBsb3cgcG93ZXIgY2FzZS4NCg0KQi5SDQpTYW5kb3INCj4gIA0KPiA+DQo+
ID4gRG8geW91IHBsYW4gdG8gdXNlIHRoZSBlbmdpbmUgZnJvbSB0aGUgc3VzcGVuZCBjb2RlID8N
Cj4gDQo+IEFzIG1lbnRpb25lZCBiZWZvcmUsIGl0J3MgYWxyZWFkeSBkb25lIGZvciBBbGx3aW5u
ZXIsIHNvIENFQyBzaG91bGQgcmVtYWluDQo+IGVuYWJsZWQuDQo+IA0KPiBCZXN0IHJlZ2FyZHMs
DQo+IEplcm5lag0KPiANCj4gPg0KPiA+IE5laWwNCj4gDQo+IA0KPiANCg0K
