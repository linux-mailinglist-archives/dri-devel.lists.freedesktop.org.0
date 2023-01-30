Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6F4680389
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 02:43:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA90510E0B0;
	Mon, 30 Jan 2023 01:43:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM4PR02CU002-vft-obe.outbound.protection.outlook.com
 (mail-centralusazon11013000.outbound.protection.outlook.com [52.101.64.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BCF410E0B0
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jan 2023 01:43:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bsIZx3Bvecpd72inmeiq5Pl1lP65MCMbgTaYWTHnh+x4lZQPOGhtEj6ijdbwBT0XG3UKuMFhIncXOkkkV8omr5ny5D486lfCrc6pSR8+46j2DB6VCp6QG0BSwO934fQ2qbzy5zL1Dnxauzdl0lzmKN+ohKNUNVsGJvcw/6z3Bm9DePXis1wo6cnlfAmrA46kU//SZfaKJPMme551sYcV1JPzsDfz+pLIobRhwMb5Qc3ld9IAqjIg3hgUw0vGEueBqSUN8/Djd4gmxPku8HZ7pxRMTVYuVha9AQ/vj1J5pAliE2LC0V+YZzvZsDB6zZn2z3C+onJ7qlmSv+DXYM345Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KQszBB2JxQnJOUHf6LMUENQQ4dnSCWoNUyjZW1bjVg0=;
 b=nOGusOHK2y1P48s/KDIhwwfjU/XrQFTGv2FtfLL3FJedJCd7muGK2hhMf/mBNVoX/c54ZrbcUWNsQS5L0NaJNPMwTX6bESdXNcT5QgriZ9ijm9DhT7EXlV7x8riEBjPdLRa2Yitw16FSWR2arrQUW3UqB/u+MFBOXpRwhAu7dFRjqcgnHK4hMV1kaObBtulBOGf6Nce24dBb4BLvyC9CSCQqFRlQTqxg1G9jn73N5Oegf9jBc/r6e5i8p85W3x++9ENERTIaYkKoq57pc5DhZmT4s1LBsKspKOxIJelTW7/A6hHY1EsnvKIIhWrrIPoutqmvleAwm1VmHX7kJjQDLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KQszBB2JxQnJOUHf6LMUENQQ4dnSCWoNUyjZW1bjVg0=;
 b=wI48QA38YtC3fsU/8vp3ZI4nIPYv12IpnjMXeow3McpJFtqcqMEsikbZuVoY9BeD4AyXhRUS9q+CJ9V8pAjVM1yFI1M2i1o639pUKzybaEM91UHS7EjPpdID3hO/LaWdx3pqxyhJaue3Dk7vs1ypOFSdvAbgXAIVOHroZLLKaMU=
Received: from CH3PR05MB10206.namprd05.prod.outlook.com
 (2603:10b6:610:155::10) by DM4PR05MB9463.namprd05.prod.outlook.com
 (2603:10b6:8:10d::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.33; Mon, 30 Jan
 2023 01:43:21 +0000
Received: from CH3PR05MB10206.namprd05.prod.outlook.com
 ([fe80::ad2d:cb08:253b:26e7]) by CH3PR05MB10206.namprd05.prod.outlook.com
 ([fe80::ad2d:cb08:253b:26e7%8]) with mapi id 15.20.6043.033; Mon, 30 Jan 2023
 01:43:21 +0000
From: Zack Rusin <zackr@vmware.com>
To: "penguin-kernel@I-love.SAKURA.ne.jp" <penguin-kernel@I-love.SAKURA.ne.jp>, 
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>
Subject: Re: [vmwgfx] crash upon vmw_open_channel() when booting on Oracle VM
 VirtualBox
Thread-Topic: [vmwgfx] crash upon vmw_open_channel() when booting on Oracle VM
 VirtualBox
Thread-Index: AQHZMw3wQ9pFUo92V0yToOgi1i+0E660582AgAAkn4CAASXuAA==
Date: Mon, 30 Jan 2023 01:43:20 +0000
Message-ID: <f77307307d1d517f383424f364fd9a846b0234a2.camel@vmware.com>
References: <c59cbadb-7671-2d7c-d535-24f41aff18cc@I-love.SAKURA.ne.jp>
 <34c6e0413acb43d746e7dc95e0886ea22fd1cc82.camel@vmware.com>
 <bb654908-4cd2-c6a5-c1f0-ee64c5a75078@I-love.SAKURA.ne.jp>
In-Reply-To: <bb654908-4cd2-c6a5-c1f0-ee64c5a75078@I-love.SAKURA.ne.jp>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.2-1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR05MB10206:EE_|DM4PR05MB9463:EE_
x-ms-office365-filtering-correlation-id: a698c941-0caf-4ee5-c26a-08db02635e46
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZRPsEYCKWwBJR47W6tZG6PtouBQTe436rNPfAX62rzcR8qIt7udXqfOOqMWODrBMAotF0ejBTuAGwubGGNU5WU/OwQvfmVOszVDFtu1Ghwv+5HzoY6s65xYYStB2QuqhhR+dzOOAo2KYyzcich3e+uWMyf0nHVJpL00HnHsgLlyEvsdhfqaZJj8fGcdexcsqbWbRpRVMkrQE8eak1XG5d0RxTS+Fbo4gX3z/1rwj+/V0yZ0zWgVxhqva8xZjFFwJ+21NDjXsdXYeAL7PZNKsqhIAuY8mGsdKiPqP+8iF5TMNT4uussGjDaAQqavoEG6erujjINQx5CeqP8ZtEj/caRt8Ixe4dzha4QT/AwXLdFxdoAtOoy4KjDmUKd2opaSe3qLDIvpqbxj5AAZgtAR6YMGiA/XrEOaYjB0xja1zP3HZoGyI7P0jyv7jAmgfESepdjC9vfnz4Wf/wYZIYqwyMJPjtg1lXisiLXvoxmDxPqgf/gmGcPyNXd6mGnfIDxNrhTMJrQBmD+La7Pc6c0lRcObC+zN+22dOuUaWcv/SK88Ni4Qma55CRcpW/7zZVEmehY/oRj8IyNCcD18bv1l7HrIcaqC0tZ3qNAsPFtCwpsnmJcyBPMAbAit0NJ9LyXexUeM9pY1scxxmRBrj4CWZIJZehpLWFR3icwhHN5KGspr3meL859/v08yN08//lad+1DMgiGfyFXaVUuiZCSiBLIwqpzqzHiS6oyY7qzVTikLDbP16Thuiuw65glGOOI1S
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR05MB10206.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(376002)(136003)(366004)(39860400002)(396003)(451199018)(6512007)(26005)(186003)(53546011)(6506007)(38100700002)(122000001)(86362001)(38070700005)(36756003)(2616005)(83380400001)(41300700001)(8936002)(2906002)(5660300002)(6486002)(71200400001)(478600001)(4326008)(8676002)(91956017)(76116006)(66446008)(64756008)(66946007)(66556008)(110136005)(54906003)(6636002)(66476007)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MUt1Q0k0c0ZFejRmMGdJTGpBVUFXVGEyZmFhUnR4UHhQb0NteGFORVJlM1Uv?=
 =?utf-8?B?YXFkNVozSklKSkd5Ry9DWjV3ZnYrSzJjcWRYWUhwN1YrYk94ZkJ4YnpLeklP?=
 =?utf-8?B?NERNUTVDMDFsQ1BuSGVBQW01YXM2a09kUmlwTHFmRlJpMmRLcGM3SDRLMDlY?=
 =?utf-8?B?aWUwUXVqUkNndGZOWjZWQUZweUV2aXl2clJzQjIzNkNFeDVsZGlDd0RaZURr?=
 =?utf-8?B?UXg3YnFHNUFNRkdpVUE2TU5DdkZNR3pucDY5RklqcTB2Tms2WkJqcFZGTTY0?=
 =?utf-8?B?WXZhM2RDNFV3ck1sU25mdkVLcUg1K0FpV1N1ZTBySjAxNTVoUW9YN0hVMldv?=
 =?utf-8?B?TW0yZUJlUnFGYkE2UGZVbDBxUjZOczVPYzV2dEd6NXAyb2h1bUtqVlk0ZUx0?=
 =?utf-8?B?L1M0emZHL3V5OXV5bUpjd2hHSjJoNGlkN1kyamFwNUVoaG9pTmszUDRFczZi?=
 =?utf-8?B?UTh2S0pyYVc5b1gxYlhWTkRtQmtpaU9TV1ZkL3FoRXg0UTN1VGRDVloyTTNG?=
 =?utf-8?B?Z3lYRHhCWjBLaWtRZE5WL0NlYktxQXZyV3I2WEZoTXY2UCtCVkFXT2R2Tkw5?=
 =?utf-8?B?T1c4VWRTUFY0akZ5dzlVdDZmcUpqTnZ2aDhMQWFyTTBYTWVuSFhQK0NIV3ZG?=
 =?utf-8?B?YURleDk1cGNhbXVPakUwMnE5MnQ0L3dtVklvTmRleHlWRVVnc3IwU1R0aCtZ?=
 =?utf-8?B?OWV6SGdPdjhmUzZZUW5nYllSNitPQWhzRnIrOTMya2xRWDJSb29YaDE1VHZ6?=
 =?utf-8?B?L1g2UEZrU0w0Y1FhMSs1UEtSYjdoWSt0a084b0J6dkQxaVcwejJXVTZGdVBy?=
 =?utf-8?B?bkVMdTdDYkF1QWZWNllIa3ovR1JTQS9Pa1dQUVY2RGI5eTBVM2pmRDNRek90?=
 =?utf-8?B?Q3hQT1JjNk1FbHQyU2poenRjeHEyRUNPYys5WU9aWm1oRVdDMS93TE1hMUZ3?=
 =?utf-8?B?UENwWXhuUU1tcDV3d1dHaGZGQjR5bDBmTWRBZHZqdExDT3pqRW16Snp3b1FL?=
 =?utf-8?B?K2ExcnltUWhqbTBFWHlsUFFrVkRyZko1VGZ4SmRZRWgyYlZSaFdhOWRuSWhE?=
 =?utf-8?B?VGJ6eG9uU1B2RVJmK3lQaW1VRmUxUU1TaXZ3RVllZitPdmV0MVB5bkd4bU5N?=
 =?utf-8?B?V25NNk9FUElGdFhiYWtSRTJYNTBCWlZIYTcxY2hLNDJDcXRXMkpyY1c4clVU?=
 =?utf-8?B?UGJ3RW1UaFE0ZVZaRUhzYkNnaGNYdUV2OW01ajZXWncybEFtTzlJLzVBL3Zt?=
 =?utf-8?B?K2s3NVZHWWNabVBWeStxaVc1dDlncy9MbEVCSDE5SVVwa0xHNDYxaitMbGln?=
 =?utf-8?B?QjFnSW85NUZnckJ3OHdiUHMrYUM4ZVRRb3RCRjhhSXByZnNhV0pNNHRxd0pO?=
 =?utf-8?B?RWZrYUlSSm04eHpFUGZOdzBLdHcreTFmUEVzR1N2T0dFSWdnMGcxNFhPSXdx?=
 =?utf-8?B?OFlJSk5kZGxMOUNNYnYwcEZHU3NvVGg1WmVkK1hxWDBQd2FNS0JlNXdFQ3Nk?=
 =?utf-8?B?OUZOV1luRXNtT01rVk1lSE02UnlnL2RBcngvWFcrbjZaNFI3K3ExY29EZnJN?=
 =?utf-8?B?R3pjSUdVdVRjUE1yNmMzaGdiWWFucytBR3pGSngwa091c1FmbVJuUTE1ZVpk?=
 =?utf-8?B?SWc2dUw4eHJFYzFwUDIrTkxHc3MrSFB3b3h6RExUamJYV056bk1aMVoxTzNo?=
 =?utf-8?B?Uy83d0hqemhFR3dGQmlPNW5xcE9sN0JsYWYxem9OTkw1M04vTHZLaXJOMnRq?=
 =?utf-8?B?ZldxTTF2SDRWUEdma2VWZnpSc1NhVFRIQXlBNjY0eWhFakVaaTNRR0ZrbUpJ?=
 =?utf-8?B?cmVuQ1g1dXcrNzRQc1hsVCtPTHEwTkxtSjVCd2dmaXcyWk1lTEcrTkU2UU84?=
 =?utf-8?B?VytQN0lQYTFpVzh5cWxGS3VGUnlZQzVWNjlvR28wMnVyL214NEtrUmhZMkZo?=
 =?utf-8?B?RjJNMEtOWGVPS3p5SkYzZ2hqWnJiby9EdEdYOCtubm9ocGgrRktwVUVxVHRj?=
 =?utf-8?B?UENVMmVYajNxNCtiWXZ4VjB3MndXbWRqazNDckE4aDVkMDh4VUdxYU5maUxh?=
 =?utf-8?B?TEV0T3RHUXJabVh0RHpheWhtVXZLVHc4R0p2UTRJRUtCclY5US9qdE1WVVpD?=
 =?utf-8?Q?VM7i59o6yHEDPYzawGAchy7sm?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EFA2FAB96901644D84CCA32D3F55C7F0@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR05MB10206.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a698c941-0caf-4ee5-c26a-08db02635e46
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2023 01:43:20.9614 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JGoo+Uj11ohy6wgWpN0/H1lfSOnh/gi7URsgjilw6v4IIFpfCSoGI+VxsCCln6pFrVKknyJTVKVanidTEXbL7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR05MB9463
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCAyMDIzLTAxLTI5IGF0IDE3OjExICswOTAwLCBUZXRzdW8gSGFuZGEgd3JvdGU6DQo+
IE9uIDIwMjMvMDEvMjkgMTU6MDAsIFphY2sgUnVzaW4gd3JvdGU6DQo+ID4gT24gU2F0LCAyMDIz
LTAxLTI4IGF0IDIwOjQ0ICswOTAwLCBUZXRzdW8gSGFuZGEgd3JvdGU6DQo+ID4gPiBIZWxsby4N
Cj4gPiA+IA0KPiA+ID4gSSBub3RpY2VkIHRoYXQgYSBrZXJuZWwgYnVpbHQgd2l0aCB2bXdnZngg
ZHJpdmVyIGZhaWxzIHRvIGJvb3QgYSBMaW51eCBndWVzdA0KPiA+ID4gb24gT3JhY2xlIFZNIFZp
cnR1YWxCb3ggNy4wLjQgb24gV2luZG93cyAxMSBvbiBERUxMIEluc3Bpcm9uIDE0IDU0MjAuDQo+
ID4gPiBJIGRpZG4ndCBub3RpY2UgdGhpcyBwcm9ibGVtIHdoZW4gSSBib290ZWQgYW4gb2xkZXIg
a2VybmVsIG9uIGFuIG9sZGVyIHZlcnNpb24NCj4gPiA+IG9mIE9yYWNsZSBWTSBWaXJ0dWFsQm94
IG9uIFdpbmRvd3MgOC4xIG9uIGFuIG9sZGVyIFBDLg0KPiA+ID4gDQo+ID4gPiBUaGUgbG9jYXRp
b24gdGhhdCBjcmFzaGVzIGlzDQo+ID4gPiANCj4gPiA+IMKgwqDCoMKgwqDCoMKgIFZNV19QT1JU
KFZNV19QT1JUX0NNRF9PUEVOX0NIQU5ORUwsDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgKHByb3RvY29sIHwgR1VFU1RNU0dfRkxBR19DT09LSUUpLCBzaSwgZGksDQo+ID4g
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMCwNCj4gPiA+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBWTVdfSFlQRVJWSVNPUl9NQUdJQywNCj4gPiA+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBlYXgsIGVieCwgZWN4LCBlZHgsIHNpLCBkaSk7DQo+ID4gPiAN
Cj4gPiA+IGluIHZtd19vcGVuX2NoYW5uZWwoKS4gSXQgbWlnaHQgYmUgdGhhdCBzb21lIGNoYW5n
ZXMgaW4gVmlydHVhbEJveCBzaWRlDQo+ID4gPiBpcyBjb25mbGljdGluZyB3aXRoIGhvdyBWTXdh
cmUgdHJpZXMgdG8gdGVzdCBpZiB0aGUgZ3Vlc3QgaXMgVk13YXJlLg0KPiA+ID4gSG93IGNhbiBJ
IGRlYnVnIHRoaXMgcHJvYmxlbT8NCj4gPiANCj4gPiBZb3UnZCBoYXZlIHRvIGZpZ3VyZSBvdXQg
d2hhdCBleGFjdGx5IGlzIHRoZSBwcm9ibGVtLiBJIGNvdWxkbid0IHJlcHJvZHVjZSBpdCBvbg0K
PiA+IHZtd2FyZSBoeXBlcnZpc29ycyB3aXRoIHlvdXIgLmNvbmZpZy4NCj4gDQo+IFRoaXMgcHJv
YmxlbSBoYXBwZW5zIG9uIG5vdCBWTXdhcmUgaHlwZXJ2aXNvcnMgYnV0IFZpcnR1YWxCb3ggaHlw
ZXJ2aXNvcnMuIA0KDQpZZWEsIHRoYXQncyB3aHkgSSBjYW4ndCBkZWJ1ZyBpdCBteXNlbGYgYW5k
IHdvdWxkIG5lZWQgc29tZW9uZSBlbHNlIHRvIGZpZ3VyZSBvdXQNCnRoZSBleGFjdCBpc3N1ZS4N
Cg0KPiANCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBGV0lXIHRoYXQgY29kZSBoYXMgYmVlbiB0aGVy
ZSBhbmQgaGFzbid0DQo+ID4gYmVlbg0KPiA+IGNoYW5nZWQgaW4geWVhcnMuIE9yYWNsZSBlbXVs
YXRlZCBzdmdhIGRldmljZSBhbHdheXMgaGFkIHByb2JsZW1zLCB3YXMgbmV2ZXINCj4gPiBzdXBw
b3J0ZWQgYnkgdm13Z2Z4IGFuZCBhZmFpY3QgaXMgbm90IG1haW50YWluZWQgYnkgT3JhY2xlIHNv
IEknZCBzdHJvbmdseQ0KPiA+IHN1Z2dlc3QNCj4gPiB0aGF0IHlvdSBzd2l0Y2ggdG8gc29tZSBv
dGhlciBncmFwaGljcyBkZXZpY2Ugb24gdmlydHVhbGJveC4NCj4gDQo+IEluZGVlZCwgbm90IHNl
bGVjdGluZyBWTVNWR0EgYXMgR3JhcGhpY3MgQ29udHJvbGxlciBpbiB0aGUgc2NyZWVuIHRhYiBv
ZiBkaXNwbGF5DQo+IHNldHRpbmcgYWxsb3dlZCBtZSB0byBib290IHRoZSBndWVzdC4NCj4gDQo+
IFRoZSByZWFzb24gSSBidWlsdC1pbiB2bXdnZnggaXMgdGhhdCBJIHdhbnQgdG8gcmV1c2UgdGhl
IHNhbWUga2VybmVsIGNvbmZpZ3VyYXRpb24NCj4gb24NCj4gbXVsdGlwbGUgZW52aXJvbm1lbnRz
OyBzeXpib3QgdXNlcyBhIGxhcmdlIGtlcm5lbCBjb25maWd1cmF0aW9uIHRoYXQgYnVpbHRzLWlu
DQo+IGFsbW9zdA0KPiBldmVyeXRoaW5nLg0KDQpCdWlsZGluZyB2bXdnZnggaXMgZ3JlYXQsIGl0
J3Mgc2VsZWN0aW5nIHRoZSB2bXN2Z2EgZGV2aWNlIGluIHZpcnR1YWxib3ggdGhhdCdzIHRoZQ0K
cHJvYmxlbS4gYWZhaWN0IHRoYXQgZGV2aWNlIGlzIHVubWFpbnRhaW5lZCBhbmQgdW5zdXBwb3J0
ZWQuDQoNCg0KPiA+IEluIHRoZSBtZWFudGltZSBJIHRoaW5rIHRoZSBhdHRhY2hlZCBwYXRjaCBz
aG91bGQgYXQgbGVhc3QgZ2V0IHlvdSBib290aW5nLiBZb3UNCj4gPiBjYW4NCj4gPiBnaXZlIGl0
IGEgdHJ5IGFuZCBpZiBpdCB3b3JrcyBJIGNhbiBwdXNoIGl0IHNvbWV0aW1lIHRoaXMgd2Vlay4N
Cj4gDQo+IFllcywgdGhpcyBwYXRjaCBhbGxvd2VkIG1lIHRvIGJvb3QgdGhlIGd1ZXN0IHdoZW4g
c2VsZWN0aW5nIFZNU1ZHQSBhcyBHcmFwaGljcw0KPiBDb250cm9sbGVyLg0KPiANCj4gVGhhbmsg
eW91Lg0KDQpHcmVhdC4gSSdsbCBjbGVhbiBpdCB1cCBhbmQgc2VuZCBpdCBmb3IgcmV2aWV3IHRv
IGRyaS1kZXZlbCBzb21ldGltZSB0aGlzIHdlZWsuDQoNCnoNCg==
