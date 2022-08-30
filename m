Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB4B5A5D6F
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 09:54:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E707B10E9A9;
	Tue, 30 Aug 2022 07:54:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50116.outbound.protection.outlook.com [40.107.5.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B498010E9A9
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 07:54:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X2r0JniUtu4ZzkZhjUKi2BfoeqleBko4uggywEWHsEYmdm098DKzmmo8ySvppN/k8IwQGjZ+djCDFOu53KozJZt1ubWsvjBZOuZWlAcW2igukjogBH7aKJv8xekHHC8SUXKPekLH745cwRELMnhJxvxxNIJxbL9iKPWaCzeOlOIpE9E3O+Br7tpwx//SWNvYpcgU7kl231rl0NitvAWbjulqOz1n2egc5V73CgjiWtwcaJ6/Sg0InBXDZB2rERF9rvkT88BAeZeKIyhu68yLDJjT09ewa+Z5xe+vaDfP+xqprp2So6Nbbxs7pCWsi+RQfBuFMZA8DwGCllAfh8/2aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ETyIuYjmz+64Enud35e0I4P4LRZyEC8dvQu3MHtwKUI=;
 b=cFj4TEUUAGugClIbQazzL9ILKZVXgFQHdJKNN73CVE4sPrx+5xohU/iUMzVJ1KaSsLUceIlSG/MihJ837phS4uhuN1PE73T2xLbHv22POEY/e03XnGK2/IhJgLsZTacVUUHlKE4V42H+Zq/aE9lEqUCBIOsP8URiOJ1TkjYsSduCHIFdWst9tyrWN70Mhjd1V+npCaE5jCzuETotXbSraA7K/+/+2k5NhyMLDGjTh++q/lUSgVJJYZmQ4s9iz0jJFKyE5ub0YVYK+i3XePJotVsAX/8l+WsXfJ0MJ/ojx4tpE/q9HxaHzz27834T/3LdQnDBERGl8oC0l+WU9yO07Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bang-olufsen.dk; dmarc=pass action=none
 header.from=bang-olufsen.dk; dkim=pass header.d=bang-olufsen.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bang-olufsen.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ETyIuYjmz+64Enud35e0I4P4LRZyEC8dvQu3MHtwKUI=;
 b=BDU21s4tfNZvEMO+dzPjYVZ1o5YGlZbQFglzDKfTxCsHCNvSExOSO4bUuXLe/mSHNfcUJjv5uufCQWNAOEutNQm9W0RlvYLrf1l3j/UEt94EmoiBk+h0FfhOR6z2kocccKSoTB707tRK8yGgfT2gjn8e/Zj18SuMgOiWF6b4U8Q=
Received: from VI1PR03MB3950.eurprd03.prod.outlook.com (2603:10a6:803:75::30)
 by DU0PR03MB9517.eurprd03.prod.outlook.com (2603:10a6:10:41c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.21; Tue, 30 Aug
 2022 07:54:29 +0000
Received: from VI1PR03MB3950.eurprd03.prod.outlook.com
 ([fe80::c5c0:bc03:55e5:51d8]) by VI1PR03MB3950.eurprd03.prod.outlook.com
 ([fe80::c5c0:bc03:55e5:51d8%7]) with mapi id 15.20.5566.021; Tue, 30 Aug 2022
 07:54:29 +0000
From: =?utf-8?B?QWx2aW4gxaBpcHJhZ2E=?= <ALSI@bang-olufsen.dk>
To: Robert Foss <robert.foss@linaro.org>
Subject: Re: [PATCH 0/2] drm: bridge: adv7511: CEC support for ADV7535
Thread-Topic: [PATCH 0/2] drm: bridge: adv7511: CEC support for ADV7535
Thread-Index: AQHYO6OCVOJRs7Nvz0GZ18cQ9Q+Tf63HCiWAgAEKCoA=
Date: Tue, 30 Aug 2022 07:54:29 +0000
Message-ID: <20220830075429.5rkb7mna3qf4mwcs@bang-olufsen.dk>
References: <20220319151016.983348-1-alvin@pqrs.dk>
 <CAG3jFyvqPFL4d=s6DsbVZOzkuMwwi-GUZwFYyeajr=jLqmdm4Q@mail.gmail.com>
In-Reply-To: <CAG3jFyvqPFL4d=s6DsbVZOzkuMwwi-GUZwFYyeajr=jLqmdm4Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bang-olufsen.dk;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e94fd4c0-91c6-4161-d9ab-08da8a5cde54
x-ms-traffictypediagnostic: DU0PR03MB9517:EE_
x-ms-exchange-atpmessageproperties: SA|SL
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zOGj/5SNwM27t9o/FdJHBbAptyAJMJNzX6SPAZPYrRL3cgxCUyMeRAMfXrv6IxarfeRw7O5K45Ol5Tojn52ClJ+WdMWKBHUqavjeVCfXbXbqRCdQPFoHegup0Pi8MkTQrd7rOTtMGc0zlyxHkVzKTImKdzffJrZhjoRDXQu3m5CpOZoFm3hqHvqBHLAeA1ttDrj2OuIjsJ2g5NMTYF/Oy9S/Id1stCeOVORPUFKWFrj+ryRuNXCqx3vVHZ+wPwUzFFfiee6qu8oQvCo3WpE18pUQ1v7KNP715PIme0sPdvLCW3GOiCprS+y50iLg8L5bm4Iqd35eu9LKU40LpfF7JvPEOLAsWX5MMWRVqbY+WZNu+dtTllu/KCQNWJMyFfZPbpv+CSCbsbJ2LxcpzEOlB91lAxVie4j6AntZQ5naFsrtQ8cicamwj1gVP4fwMDiN49tdRKuGjzcAwRkQVsmxaUHNEZ07+T5rGlhsiQSQpVeN9B4ce0NWS3ZV96yVqBntd8hCGdtHnnGLNwpNbvvymwJsqaOXin+nwk8arpDUr/rOROBXYyJ21kfnwMZI+p06YORQZZnoDBQRjqzimAyN22f33kl0C6J9H72MMF6XcxgPPGQ02Z6o/tm5grkrl0QRx81s8s5qZxeYwrZtNmA1PLVGJK55Bp28VeYmM+DKgMKijYhGHsrZ7GijCqu2KoMAzhricaUzduoi44yaW0HbQGzkZskyDiivNRNuAeqYflfND8858fAo1k1tiYMDAoRQALERNi9dgbRO1ReWG8Ts53or+dOIQB/fUqBKmczXwAE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR03MB3950.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(136003)(366004)(396003)(39850400004)(376002)(36756003)(38100700002)(38070700005)(91956017)(8676002)(64756008)(66446008)(4326008)(71200400001)(316002)(66946007)(76116006)(85202003)(66556008)(66476007)(54906003)(85182001)(122000001)(6916009)(7416002)(86362001)(2616005)(478600001)(6486002)(8976002)(8936002)(1076003)(5660300002)(41300700001)(186003)(6506007)(966005)(6512007)(2906002)(83380400001)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SG01My9FQlcvamo0RGM4YTRVT1N4bDBrbnJXTGFHbTRTYWNWQ3FXTlhyTTI4?=
 =?utf-8?B?UGJGY2kzYzBqVjFtL3JaOHlhTG1sWWFOL3NJYndmQWRFbzA1OG9USmIyVHl5?=
 =?utf-8?B?YnhnSS9MWEx4SXhrSEwzRW1FQkEyS1VXSjNlTlpXL2M0WndrdWVpMVMrNGl4?=
 =?utf-8?B?TDlSUXFuS3EzZ0FYa25mWmx3aDRPYmg3dkdUcFRyN01uZS9pMEJSekRoaDRs?=
 =?utf-8?B?a1ZpcTNSdm9FVXpPUm1NenR4YTdTMUJqVFl5YitxR0w2MitYK3RnU0draFM1?=
 =?utf-8?B?TSt0c2xlWWdrdkw0Q0xCTzdTK1N1YlpzSFdoaklVRitSUE8wQm5NNGVESjNI?=
 =?utf-8?B?UzhRMmVCMEVZNDd1a1hvby82Q09iblNpWURydUFjUHlqK0JvL1VkaVQyMGJI?=
 =?utf-8?B?NFlucDNNdUpjSkdEQlF4c0NqUFRQbnZoa0d0OEVzWDhueTVnU3dmUGRIMHYx?=
 =?utf-8?B?amdLcHg5WDNXU0VsWmozN0drdktrS1ZmSEMxKzFqenBxSDZ3blpXbEtnY3FD?=
 =?utf-8?B?MHRMdXRHdkI2R0RqY0E0blYzOVo3VzBhbFgxSGd6Sk1EQm1IVFV2QkpKdHlV?=
 =?utf-8?B?cWYzNUVCaWxRNGFKd1Uyc3FQUnhnc2RJZE1weEFFZWtWQ2FsdG01Vmx3VHN4?=
 =?utf-8?B?Y1Z0SHdIc3EzNmNUU0xtdjlnT0JmY1g1N0FyaWJFSHpLZ1QrQUswKzBqa1JT?=
 =?utf-8?B?RmJCUTlVUTF0dmNRUjdhL3h5MGJEeXZzU25MdFhTMW5Jd3BOWjlmMlhaUWkv?=
 =?utf-8?B?OTVhcHZTdy9iV0piTDRrUjMxclRRZlNCSWFVb2RRQk1jQlZPM1R2Nk13L1cz?=
 =?utf-8?B?eEl1STB0WnR2SFFhTWpHblJENUE5TEhOVjlJTi9sQU9CRjljT3poTGR4WExT?=
 =?utf-8?B?TkZHY2xUd3g5SGFkdnA0STVIOEdtbG9uOGdOdGhPRU1WckxIWlR5TGU4d1Vw?=
 =?utf-8?B?UER0YmplK1l5ZDVCdmk3d0pkNUVSSEtzM0NZeklMRWFCZll5b3BrSDBodGNX?=
 =?utf-8?B?ZHNoR2xOM29jcWJwZld0ODFWOEtTNCtYQUlRMjVtMmtqbVcraVhPekF5SnhL?=
 =?utf-8?B?c2hiWFJvenRlTEdZUVJIaFJGMjR6YWVEYjlmOERuNW1lNG5PcUV5RjdzRU03?=
 =?utf-8?B?SUxqaFBjcXdqRVpFWjdlbndHTXQ1bGNmWjh6a2RpRDFhMnNuZENZTUl2aHRM?=
 =?utf-8?B?Vk1EcFdYelhXT2tNbkRaZS9NY2VuZ2FIV1EwS1JjbHRBTHlTOEtxcnA4SjI0?=
 =?utf-8?B?TWl4OVBqSFpERlZvRDRDVlNHUy9LZFZkaFdaOVUvWlpzc0YxaTlvL29VQ1Zr?=
 =?utf-8?B?UTRLY253NDlDclo4emxORWFWampXZDc0Z3Ivb2RxaEhxVnVPa2pZS243RSto?=
 =?utf-8?B?RGhBaGJ3U1IxWFl1cTR4MHAya3FoSEdWbXhNdzRCMWdacGk5ZTNEYVpRejdZ?=
 =?utf-8?B?M0ZIL0p2Vk95SHZDVitsYW9JVWs0L2hqMFFocmViWjlwVzlqOHBNbnRvMlR3?=
 =?utf-8?B?bU1zYXJZeENSYmo4VFhobHV3TGNoNDVaY251dUtrYjlrVFVWRnFuRXVTbEpu?=
 =?utf-8?B?ZTNBVzVKWjc4allIS3dBV0lHakhhaXBSZnhKcStjbTY4K2RNQ3Rpa1M0QVB0?=
 =?utf-8?B?ZTZ0bnFveG0vZkZzZ1hQbzB1eUdSdW1rNkVNVWwxbmN3NzhhOWlOWHRtWHRm?=
 =?utf-8?B?Tjd1WUpNTnQwUy9XRDl1b3U0Q2VSam1xN2Rid0NKbGh0Q0hZV3RMZVRYWUth?=
 =?utf-8?B?MmNRa1J0T2dPai9pVmx6eHVQbVlQTVlCcDQzQ244RkpMVVhEVFN0eTNnYnM0?=
 =?utf-8?B?SHRIWmkxb3pPbVhSRGJyWnRlU2JrWUlwWlU4dlA2SFBHcktiQTVycVkrdDNC?=
 =?utf-8?B?MytyY1dhUXh2Q0gycllLcTBHL21hNXdmL2JkOUFtbGlSV0NFS3llMjZVcVNH?=
 =?utf-8?B?UkdjdU5saWtIZDJqbDhOUkprekpvR2ZGSTRGMDJVRkpuT2p4bVdBR0hDWjZz?=
 =?utf-8?B?eWh5d29OUjQ1bEVGQ1VCOUdYa01CaHM4cVJ6VzA0aFlWRm8wL0U0Q09EaU5Z?=
 =?utf-8?B?dlBqZkhRZUdoTWtSeDU2Q2dpMWsxWnpvRXRWc1k0OEdIMFFqTHhyUzM1ZFlV?=
 =?utf-8?B?K0NPVTNpUSs4MWJ4b1hXR0U5N1BYS3FmMGpJeE1LUkJodWFuRDUycnp2dlRE?=
 =?utf-8?B?Q0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F93934C0BD7E474FB8A21BB9F1C4DD8E@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bang-olufsen.dk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3950.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e94fd4c0-91c6-4161-d9ab-08da8a5cde54
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2022 07:54:29.7761 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 210d08b8-83f7-470a-bc96-381193ca14a1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3OwsNmYbVSbANS7vUcVkH6rOUFoYxpU2CINnP/4bMq6ycMUo5X4B68KrgmxczoVkIrD7xJ9kARPm5NmzHtLmGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9517
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 =?utf-8?B?QWx2aW4gxaBpcHJhZ2E=?= <alvin@pqrs.dk>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iZXJ0LA0KDQpPbiBNb24sIEF1ZyAyOSwgMjAyMiBhdCAwNjowMjoxN1BNICswMjAwLCBS
b2JlcnQgRm9zcyB3cm90ZToNCj4gSGkgQWx2aW4sDQo+IA0KPiBTb3JyeSBhYm91dCBiZWluZyBz
bG93IHRvIGdldCB0byB0aGlzIHNlcmllcy4NCg0KTm90aGluZyB0byBiZSBzb3JyeSBhYm91dCAt
IGluIGZhY3QgaXQgd2FzIGFscmVhZHkgYXBwbGllZCEgOy0pDQoNCmFiMGFmMDkzYmY5MCBkcm06
IGJyaWRnZTogYWR2NzUxMTogdXNlIG5vbi1sZWdhY3kgbW9kZSBmb3IgQ0VDIFJYDQowYWFlNzYy
M2I0OTUgZHJtOiBicmlkZ2U6IGFkdjc1MTE6IGVuYWJsZSBDRUMgc3VwcG9ydCBmb3IgQURWNzUz
NQ0KDQpUaGUgb25lIHBhdGNoIEkgYW0gc3RpbGwgd2FpdGluZyBmb3IgZmVlZGJhY2sgb24gaXMg
aGVyZToNCg0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjIwMzE5MTUyOTMyLjk5NTkw
NC0xLWFsdmluQHBxcnMuZGsvDQoNCkJ1dCBpdCBpcyBhbiBSRkMgcGF0Y2ggYW5kIG5vdCBvZiBh
biB1cmdlbnQgbmF0dXJlLg0KDQpUaGFua3MhDQoNCktpbmQgcmVnYXJkcywNCkFsdmluDQoNCj4g
DQo+IENhbiB5b3UgcmViYXNlIGl0IG9uIGRybS1taXNjLW5leHQgYW5kIHNlbmQgb3V0IHRoZSBu
ZXh0IHZlcnNpb24/DQo+IA0KPiBPbiBTYXQsIDE5IE1hciAyMDIyIGF0IDE2OjEwLCBBbHZpbiDF
oGlwcmFnYSA8YWx2aW5AcHFycy5kaz4gd3JvdGU6DQo+ID4NCj4gPiBGcm9tOiBBbHZpbiDFoGlw
cmFnYSA8YWxzaUBiYW5nLW9sdWZzZW4uZGs+DQo+ID4NCj4gPiBXZSBoYXZlIGFuIEFEVjc1MzUg
d2hpY2ggaXMgbm9taW5hbGx5IHN1cHBvcnRlZCBieSB0aGlzIGRyaXZlci4gVGhlc2UNCj4gPiB0
d28gcGF0Y2hlcyBmaXggdXAgdGhlIGRyaXZlciB0byBnZXQgQ0VDIHdvcmtpbmcgdG9vLg0KPiA+
DQo+ID4gVGhlIGZpcnN0IGFkZHMgdGhlIGJhc2ljIHN1cHBvcnQgYnkgY29ycmVjdGluZyBzb21l
IHJlZ2lzdGVyIG9mZnNldHMuDQo+ID4NCj4gPiBUaGUgc2Vjb25kIGFkZHJlc3NlcyBhbiBpc3N1
ZSB3ZSBzYXcgd2l0aCBDRUMgUlggb24gdGhlIEFEVjc1MzUuIEl0DQo+ID4gaGFzbid0IGJlZW4g
dGVzdGVkIHdpdGggdGhlIG90aGVyIGNoaXBzIChlLmcuIEFEVjc1MzMpLCBhbHRob3VnaCBpdA0K
PiA+IHNob3VsZCBiZSBjb21wYXRpYmxlLiBJJ20gc2VuZGluZyBpdCBhZ2FpbnN0IGRybS1taXNj
LW5leHQgYmVjYXVzZSB0aGUNCj4gPiBpc3N1ZSB3YXNuJ3QgcmVwb3J0ZWQgZm9yIG90aGVyIGNo
aXBzLCBhbmQgQURWNzUzNSBkaWRuJ3QgaGF2ZSBDRUMNCj4gPiBzdXBwb3J0IGJlZm9yZS4gQnV0
IGZlZWwgZnJlZSB0byB0YWtlIGl0IGludG8gLWZpeGVzIGluc3RlYWQuDQo+ID4NCj4gPiBBbHZp
biDFoGlwcmFnYSAoMik6DQo+ID4gICBkcm06IGJyaWRnZTogYWR2NzUxMTogZW5hYmxlIENFQyBz
dXBwb3J0IGZvciBBRFY3NTM1DQo+ID4gICBkcm06IGJyaWRnZTogYWR2NzUxMTogdXNlIG5vbi1s
ZWdhY3kgbW9kZSBmb3IgQ0VDIFJYDQo+ID4NCj4gPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9h
ZHY3NTExL2Fkdjc1MTEuaCAgICAgfCAgMjcgKysrKy0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9hZHY3NTExL2Fkdjc1MTFfY2VjLmMgfCAxMTYgKysrKysrKysrKysrKy0tLS0tLQ0KPiA+
ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUxMV9kcnYuYyB8ICAyMiArKyst
DQo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgMTE5IGluc2VydGlvbnMoKyksIDQ2IGRlbGV0aW9ucygt
KQ0KPiA+DQo+ID4gLS0NCj4gPiAyLjM1LjENCj4gPg==
