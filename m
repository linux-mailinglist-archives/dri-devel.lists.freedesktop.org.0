Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E3055403B
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 03:47:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC53A113560;
	Wed, 22 Jun 2022 01:47:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060.outbound.protection.outlook.com [40.107.92.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D6E911355C;
 Wed, 22 Jun 2022 01:47:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hnRfosRx86vgLo7TT/fKj3RpYM11gdWd19mJo2iDzb3XBfqaRiu3dThV2aAcX/pHJshuDn+/iL8Nlc46QMoWU5Iz5PKsiVfHuIqcpHI7WxMaG+s9iO6Tm22XfRY9UZ8Nh17FyQu1iKoZ5vVwTHL0+1ptGP5UyM2K4r0kB+dlUfYsN2F98iBvgDafE6ibvttYKAj8JK0rqd+fA5e5KVd9NZjVbnaL6B4Ed9o37toLnZd/BQJNY1OwY8OHlI/CdFTJUSXf0cLFufRWPH8ToY1bNbPTR+jvqNAKIrlSAkofnAV/+CTJkh4Z4A+AKGnWAuS5AVzV5ik5QNaIzvDLBb3TrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YrNUX7B8Pi/Sd1w/hOXfHNChTU2hHRSEBviWp5zg8e4=;
 b=npnJd7vU7uOev4bsIOlCuyUV8wzg0MikU9XA2r+XPSA95p8Dh5YNi2s1uUDjgub4Qo9v1tOT6cyVGAinASmwgO9UsJbV0/1BkJT8zsxVBrRtkRINk4QjuP4w+c0XzwfzMjpx4EJ/VxOf2/7ILR4G13kJQ5yRXixc6b/y498eiX8TDgL2MIQmK+VAySJIkPAiBdKiwIxxbpNWTkrdGurSxsdP1eCU8V7mVp/Xy9WDo7wwW7qeGyxglLQkcS39aJxf5ANf2YbaepCf+cQHL1vs+gzmKdzjaMPdFJX2OyFkBFJP3+wAm6iAdkoKFZH9KdAnLiaHR20jqhyPaD5MZdQORA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YrNUX7B8Pi/Sd1w/hOXfHNChTU2hHRSEBviWp5zg8e4=;
 b=AiEt2RNUTRDiiOZChIrfWc6aog9tmWKtvs4WcESoIy8pF/M96ILNjTQ0WOBS38jqw6UWS739/TffgiyjJ4AYPYaeMvPy60wMmv+geqhVkj6Z6p0j6gsuYv5boaC2XDuV9scgHxHx3FWrTV9T8luv1TvFgeqtG4gYmvhfg8lcAmQ=
Received: from MW4PR12MB5668.namprd12.prod.outlook.com (2603:10b6:303:16b::13)
 by BN7PR12MB2674.namprd12.prod.outlook.com (2603:10b6:408:29::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.18; Wed, 22 Jun
 2022 01:47:19 +0000
Received: from MW4PR12MB5668.namprd12.prod.outlook.com
 ([fe80::a4a5:3b2f:9c38:54b7]) by MW4PR12MB5668.namprd12.prod.outlook.com
 ([fe80::a4a5:3b2f:9c38:54b7%5]) with mapi id 15.20.5353.018; Wed, 22 Jun 2022
 01:47:19 +0000
From: "VURDIGERENATARAJ, CHANDAN" <CHANDAN.VURDIGERENATARAJ@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 3/5] drm/amdgpu: Prevent race between late signaled fences
 and GPU reset.
Thread-Topic: [PATCH 3/5] drm/amdgpu: Prevent race between late signaled
 fences and GPU reset.
Thread-Index: AQHYhPGioKWL9MVy+0ixcpQzBhj24q1ZdjSAgADO24CAAGPegA==
Date: Wed, 22 Jun 2022 01:47:19 +0000
Message-ID: <MW4PR12MB56688CDB45612B014D92BA4796B29@MW4PR12MB5668.namprd12.prod.outlook.com>
References: <20220620220302.86389-1-andrey.grodzovsky@amd.com>
 <20220620220302.86389-4-andrey.grodzovsky@amd.com>
 <5b6b623b-9a6b-a615-d7ea-af436f1b4d92@gmail.com>
 <ad87356b-4018-ce95-317a-bfed07b7f745@amd.com>
In-Reply-To: <ad87356b-4018-ce95-317a-bfed07b7f745@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 35ef2c24-343b-41f4-fbcc-08da53f124a0
x-ms-traffictypediagnostic: BN7PR12MB2674:EE_
x-microsoft-antispam-prvs: <BN7PR12MB2674B84F94FCC7E8C7FF195B96B29@BN7PR12MB2674.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Wa0cHhRZk7w2holFjtPEbT/esBdDsQbjMLBCZzluxHP8PgF2Al/QJ/Us9gCRfGRo+X0U9Wb3QhkT1KN4oGZrGcnon4Nrk4e2/vsw/xKVo7+CFgxo0Dbhg41UC1DQvgNCyca1qWv1Vx/F9IQhqJVP7AEVGLQfWqQsQSzy+hnkHKzUmvb6ex6fs2AlyDbYfmeJlKv+wDhDA0+LaC2cUDwZRK+naeUL+dBkxGJpiwvpK4nTR/8V5+A/dCTXjOYSi0fqipYGvk7gZMd+0lbMbGTxQZNxwZncBeWHLffK28bVUfam/q0FtWv3wJRF5mJAlpqkt+nFVve4vSPxX74xL3h9K4Hoce2vMVpqy+h0S2zB9OuG9SRQfXWNxuyPez7b+x11rh34ESFV7wELqCg5yjFN82odRK6TNDBAMVQbQTT9d5Msl45PMmZG8R7Hqgwo9usORkxC/6oY6Zf5s7frXiWIVrvkfxKWIR4gedSLr998F93L22RCCTX1gKAYooh6aiWfhcTslJPifQ6iLSPdYzEDdlK3pzloXIeLymwllJpoDDhA6lGpsd5Pz25rFByQdXiEDKhJc43s2XujXmhngDtOR44mhpX482IGVi0sxf3ky/CAK2zLJWM6c56vaRSE4oz7JUY2BfdBtjbxRJHCfjwDIQnOZdrqX81AHXAt2Qbk5onOj22XL9eS0spBDwgOcPmF9W+cbi0omKsxl+TwY+mHEA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB5668.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(136003)(376002)(346002)(366004)(396003)(55016003)(83380400001)(86362001)(52536014)(122000001)(41300700001)(55236004)(64756008)(186003)(66476007)(26005)(66574015)(4326008)(38100700002)(8676002)(9686003)(5660300002)(66446008)(7696005)(2906002)(33656002)(38070700005)(6506007)(8936002)(66946007)(76116006)(110136005)(316002)(66556008)(71200400001)(54906003)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V3gyNlJPdnlVU2ZaT21vdVByUEtiZFhrT2k0TzEvUS9CZWVWZjlzcGZSRTJS?=
 =?utf-8?B?ZHhCZkh2VVRMUXZxZGY4TFJaNzJDbDZpa21IMEpPVjBKT3NNU3ZGUEY2aFJa?=
 =?utf-8?B?MEtGZ3V1NG1ndU44SGdteCttYXFLckF4cFBXMzBHT2I5cmFVdUg0M1dZRWk4?=
 =?utf-8?B?eEVGL2xBQWFraGVrZ2RWbllOajR0UGlJQVhMM3M3R2FxRFR1U2xla0EydDJq?=
 =?utf-8?B?VzdNbTE2Y2g1NlVEVEpvd1hUY25OR1JZUmR1Mm9TajVHQU50cnJQMWpoNWFT?=
 =?utf-8?B?U3BidjY0Y2ZDRmxKTGM0SDhXSkJxeG5DMWVjcGMyVW1LcEQ4WkZWbE5mOHNM?=
 =?utf-8?B?Qm4zN1BwYVhZK2FaMFdBTWdoOHd3VDNHOE15Qk5CMVZ0dUdYdFFhdTF1Z2Q4?=
 =?utf-8?B?T1ExVldCR2FFMWswV2ptNW9EOTNNVDZGdG94TU5Wek93c1JrNzNwQWxEajht?=
 =?utf-8?B?bE9NMnJ2NnNwWXRRVk52TmZXR0R1d3JTSXhiTEtkOCsvR05GUk8vSExvVkZl?=
 =?utf-8?B?ZndBTm5xNEJtTVhNN0NNUzZpY0dvMTNnTmpXUDQ2b2xWRGRRcTl6ci9pNEV2?=
 =?utf-8?B?V2o2b01UNDlWeHRIRmp2VlZkcTlIMWZtMmR2Tnp0R25kWWZZVXc1L1VzOXlK?=
 =?utf-8?B?N0pPcXFLQWNjQXI0aFJYcXZ2czI0SzBzeDNFKytJOVYyVW5CaEh6T3VHTnVL?=
 =?utf-8?B?WnNUYjU1U3FCQTJCSmhXay90UVE5dDcyRXVNYWxPOUIrRE1iN1N3Yi9kcDRU?=
 =?utf-8?B?aUV0WVIxVWNHNmFsSXFPNmlTZVFDN21oYXhLZ3RmeW5NTzZhaVF2K3M3aE9v?=
 =?utf-8?B?K3ZUQ1RIVGRDM1VuZndwR3ZkODlzN1cwTldaWjViWVF5K2VaMjlnRERvOEdR?=
 =?utf-8?B?ZXpycWJ1WHkyd2N3QnlKN1g5bDdmOXBqUHRMd29LWUVVdXkrK1JYV3ltSEZ4?=
 =?utf-8?B?bjJxdlhYVUxEMS9TbTlpTE50alZZL1k2MVcvaWpwK1RLOUt1L1ovTXZ0RHVH?=
 =?utf-8?B?d044VjNNSzZ6UEU4VjZLS0ltQ3dLRGJ5UisyaytTb0NEUGpJYnpsRnlWQnRh?=
 =?utf-8?B?WHJiWktQOE0vNE0zRTNaQkpIZEVJM3I0SC9RWW4zb3phYmNxdm52c2dHUjJl?=
 =?utf-8?B?WVM1c044cGV5Qkt0WFAwcTNGTnRvNlRtamVXQ2g0cmxocnludkZCUGYxYUYr?=
 =?utf-8?B?YjF5NExzbTIvNGhDMUVEb0VNUEhTU0xBUjlSR1FsbjIvOUlYOC95VW5KM2Qr?=
 =?utf-8?B?VmhRbjBFZmhKRU0xcXpvZE5YWXlXQlNmQkcvZjlnVVI0MC9xYklRUzR3YW1K?=
 =?utf-8?B?NWZQKzlKb2tlaGl1QkhzbnRWQnNPSHl3ZWNBNzN0czAya0VMWFhadHlVaUpF?=
 =?utf-8?B?eVR1QzRxTjVTWU9SaCtmRlF0U05xTUdDd0dQelRYaTNVNDhockpDNUNWbUMw?=
 =?utf-8?B?Zmx3djdabnhRVzdIL1FKUVo1QXpJbXFkYjJDVmpRRFFadURrVWJhK0N4RStP?=
 =?utf-8?B?VHJpNy9DVjhOam9rajRsa2FZWDR6ekx3QlBWSG5DQldiYWxYaEhNUFlQSC85?=
 =?utf-8?B?VUxXNG01bmozT1RFR1MySW15TlhuVXAvbGp6QlRPcXpBa2RZSEZxR1Q4bS8z?=
 =?utf-8?B?dmxoNW8rQ3ZQSWxTV3RlZEQxNUpVVnJtOG9oWmJqMjh0VytIS3ZaUzVDc2tN?=
 =?utf-8?B?eFNpWmZLZklWSGNGMmtYcm5ZL0NldHlFMnRWaXp6cnpkdUVMYVc0QW5DTXF5?=
 =?utf-8?B?b2kvbEFtdC8yWCtVWnhRZVFOc2xlT1U5RVlCWGwwbG1CWW12VXB2bXUzSTVn?=
 =?utf-8?B?SzBhaVpZczlESWFGaGJLUTZsQm5GTXE1Mkk4ZUxIaEFxSnBySkhDcExNaTl1?=
 =?utf-8?B?NnB6Y21QSUk4REhsZVJlR2tSd0dtMjR5Vk5SY0cvR3I0cUVoMmxsV3BEdnRk?=
 =?utf-8?B?R0N0QjhNV29VeWF2S2x5Y1djNEdhSlZnYWVIVHMvMHh6a200ZW5rb3lZUWpq?=
 =?utf-8?B?dHA4KzJHaU4rNUE4aE1QODVCaU82NjVyQW1qQ2VoL21OTHgvMjVScjFSZ0hY?=
 =?utf-8?B?OVFLSVh4aVVhY0NDZEY1TGVBdkI2OXhsU29kL2c3V0tqcnFTcExvSm5JMFN2?=
 =?utf-8?B?VytnNEdrMkNYeE52WklKdmhvekJTVGFLbTEyaG5rUjFoVHBuMWJPSjU2SUYw?=
 =?utf-8?B?SkxEb1BaYzdDRFFNODF4R2JtYjZacGwwV1lZWHpJZGVWNEJIamozWEQwaDQr?=
 =?utf-8?B?UnF1THlPVXJLU1NSSTkwSDRaaVBzQkRmc3lLS004eFNjWWxwRFFxZG1MeHM1?=
 =?utf-8?B?ckQ2V29sazRVTmkySEFoVWNFYXRWSHc3UGhVU21YVDdyVEV2cm9TUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB5668.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35ef2c24-343b-41f4-fbcc-08da53f124a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2022 01:47:19.2475 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xZzkrCMuRk4f35FS9qYQ5zangNHBNbXfRriBf7LEVwDewlULl9IxyYxbq3Y+MaUFd0O3AQqEiK0EoQhOwBxS/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2674
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
Cc: "Chen, JingWen \(Wayne\)" <JingWen.Chen2@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, "Liu, Monk" <Monk.Liu@amd.com>, "Yao, 
 Yiqing\(James\)" <YiQing.Yao@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksDQoNCklzIHRoaXMgYSBwcmV2ZW50aXZlIGZpeCBvciB5b3UgZm91bmQgZXJyb3JzL29vcHMv
aGFuZ3M/DQpJZiB5b3UgaGFkIGZvdW5kIGVycm9ycy9vb3BzL2hhbmdzLCBjYW4geW91IHBsZWFz
ZSBzaGFyZSB0aGUgZGV0YWlscz8NCg0KQlIsDQpDaGFuZGFuIFYgTg0KDQoNCj5PbiAyMDIyLTA2
LTIxIDAzOjI1LCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOg0KPj4gQW0gMjEuMDYuMjIgdW0gMDA6
MDMgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToNCj4+PiBQcm9ibGVtOg0KPj4+IEFmdGVyIHdl
IHN0YXJ0IGhhbmRsaW5nIHRpbWVkIG91dCBqb2JzIHdlIGFzc3VtZSB0aGVyZSBmZW5jZXMgd29u
J3QgDQo+Pj4gYmUgc2lnbmFsZWQgYnV0IHdlIGNhbm5vdCBiZSBzdXJlIGFuZCBzb21ldGltZXMg
dGhleSBmaXJlIGxhdGUuIFdlIA0KPj4+IG5lZWQgdG8gcHJldmVudCBjb25jdXJyZW50IGFjY2Vz
c2VzIHRvIGZlbmNlIGFycmF5IGZyb20gDQo+Pj4gYW1kZ3B1X2ZlbmNlX2RyaXZlcl9jbGVhcl9q
b2JfZmVuY2VzIGR1cmluZyBHUFUgcmVzZXQgYW5kIA0KPj4+IGFtZGdwdV9mZW5jZV9wcm9jZXNz
IGZyb20gYSBsYXRlIEVPUCBpbnRlcnJ1cHQuDQo+Pj4NCj4+PiBGaXg6DQo+Pj4gQmVmb3JlIGFj
Y2Vzc2luZyBmZW5jZSBhcnJheSBpbiBHUFUgZGlzYWJsZSBFT1AgaW50ZXJydXB0IGFuZCBmbHVz
aCANCj4+PiBhbGwgcGVuZGluZyBpbnRlcnJ1cHQgaGFuZGxlcnMgZm9yIGFtZGdwdSBkZXZpY2Un
cyBpbnRlcnJ1cHQgbGluZS4NCj4+DQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgR3Jv
ZHpvdnNreSA8YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4NCj4+PiAtLS0NCj4+PiDCoCBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgfMKgIDQgKysrKw0KPj4+IMKg
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9mZW5jZS5jwqAgfCAyNiANCj4+PiAr
KysrKysrKysrKysrKysrKysrKysrDQo+Pj4gwqAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3JpbmcuaMKgwqAgfMKgIDEgKw0KPj4+IMKgIDMgZmlsZXMgY2hhbmdlZCwgMzEgaW5z
ZXJ0aW9ucygrKQ0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9kZXZpY2UuYw0KPj4+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2RldmljZS5jDQo+Pj4gaW5kZXggMmI5MjI4MWRkMGMxLi5jOTk1NDE2ODU4MDQgMTAwNjQ0
DQo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jDQo+
Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jDQo+Pj4g
QEAgLTQ2MDUsNiArNDYwNSw4IEBAIGludCBhbWRncHVfZGV2aWNlX3ByZV9hc2ljX3Jlc2V0KHN0
cnVjdA0KPj4+IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGFt
ZGdwdV92aXJ0X2ZpbmlfZGF0YV9leGNoYW5nZShhZGV2KTsNCj4+PiDCoMKgwqDCoMKgIH0NCj4+
PiDCoCArwqDCoMKgIGFtZGdwdV9mZW5jZV9kcml2ZXJfaXNyX3RvZ2dsZShhZGV2LCB0cnVlKTsN
Cj4+PiArDQo+Pj4gwqDCoMKgwqDCoCAvKiBibG9jayBhbGwgc2NoZWR1bGVycyBhbmQgcmVzZXQg
Z2l2ZW4gam9iJ3MgcmluZyAqLw0KPj4+IMKgwqDCoMKgwqAgZm9yIChpID0gMDsgaSA8IEFNREdQ
VV9NQVhfUklOR1M7ICsraSkgew0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgYW1kZ3B1
X3JpbmcgKnJpbmcgPSBhZGV2LT5yaW5nc1tpXTsgQEAgLTQ2MjAsNiANCj4+PiArNDYyMiw4IEBA
IGludCBhbWRncHVfZGV2aWNlX3ByZV9hc2ljX3Jlc2V0KHN0cnVjdA0KPj4+IGFtZGdwdV9kZXZp
Y2UgKmFkZXYsDQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGFtZGdwdV9mZW5jZV9kcml2ZXJfZm9y
Y2VfY29tcGxldGlvbihyaW5nKTsNCj4+PiDCoMKgwqDCoMKgIH0NCj4+PiDCoCArwqDCoMKgIGFt
ZGdwdV9mZW5jZV9kcml2ZXJfaXNyX3RvZ2dsZShhZGV2LCBmYWxzZSk7DQo+Pj4gKw0KPj4+IMKg
wqDCoMKgwqAgaWYgKGpvYiAmJiBqb2ItPnZtKQ0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBkcm1f
c2NoZWRfaW5jcmVhc2Vfa2FybWEoJmpvYi0+YmFzZSk7DQo+Pj4gwqAgZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9mZW5jZS5jDQo+Pj4gYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZmVuY2UuYw0KPj4+IGluZGV4IGE5YWUzYmVhYTFkMy4u
ZDZkNTRiYTRjMTg1IDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9mZW5jZS5jDQo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2ZlbmNlLmMNCj4+PiBAQCAtNTMyLDYgKzUzMiwzMiBAQCB2b2lkIGFtZGdwdV9mZW5jZV9k
cml2ZXJfaHdfZmluaShzdHJ1Y3QNCj4+PiBhbWRncHVfZGV2aWNlICphZGV2KQ0KPj4+IMKgwqDC
oMKgwqAgfQ0KPj4+IMKgIH0NCj4+PiDCoCArdm9pZCBhbWRncHVfZmVuY2VfZHJpdmVyX2lzcl90
b2dnbGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIA0KPj4+IGJvb2wgc3RvcCkNCj4+PiAr
ew0KPj4+ICvCoMKgwqAgaW50IGk7DQo+Pj4gKw0KPj4+ICvCoMKgwqAgZm9yIChpID0gMDsgaSA8
IEFNREdQVV9NQVhfUklOR1M7IGkrKykgew0KPj4+ICvCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgYW1k
Z3B1X3JpbmcgKnJpbmcgPSBhZGV2LT5yaW5nc1tpXTsNCj4+PiArDQo+Pj4gK8KgwqDCoMKgwqDC
oMKgIGlmICghcmluZyB8fCAhcmluZy0+ZmVuY2VfZHJ2LmluaXRpYWxpemVkIHx8DQo+Pj4gIXJp
bmctPmZlbmNlX2Rydi5pcnFfc3JjKQ0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnRp
bnVlOw0KPj4+ICsNCj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKHN0b3ApDQo+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgYW1kZ3B1X2lycV9wdXQoYWRldiwgcmluZy0+ZmVuY2VfZHJ2LmlycV9z
cmMsDQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgcmluZy0+ZmVuY2VfZHJ2LmlycV90eXBlKTsNCj4+PiArwqDCoMKgwqDCoMKgwqAgZWxz
ZQ0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGFtZGdwdV9pcnFfZ2V0KGFkZXYsIHJpbmct
PmZlbmNlX2Rydi5pcnFfc3JjLA0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCByaW5nLT5mZW5jZV9kcnYuaXJxX3R5cGUpOw0KPj4NCj4+IFRoYXQgd29uJ3Qgd29y
ayBsaWtlIHRoaXMuIFRoaXMgaW5jcmVtZW50cy9kZWNyZW1lbnRzIHRoZSByZWZlcmVuY2UgDQo+
PiBjb3VudCBmb3IgdGhlIElSUSwgYnV0IGRvZXNuJ3QgZ3VhcmFudGVlIGluIGFueSB3YXkgdGhh
dCB0aGV5IGFyZSANCj4+IHN0b3BwZWQvc3RhcnRlZC4NCj4NCj4NCj5JIHVuZGVyc3RhbmQgdGhh
dCwgaSBqdXN0IGFzc3VtZWQgdGhhdCB0aGUgZmVuY2UgZHJpdmVyIGlzIHRoZSBvbmx5IGhvbGRl
ciBvZiB0aGlzIGludGVycnVwdCBzb3VyY2UgKGUuZy4gcmVnQ1BfSU5UX0NOVExfUklORzApID8N
Cj5JIGNhbiBkaXNhYmxlIGFtZGdwdSBpbnRlcnJ1cHQgbGluZSB0b3RhbGx5IHVzaW5nIGRpc2Fi
bGVfaXJxIC0gd291bGQgdGhpcyBiZSBiZXR0ZXIgPw0KPg0KPg0KPj4NCj4+DQo+Pj4gK8KgwqDC
oCB9DQo+Pj4gKw0KPj4+ICvCoMKgwqAgLyogVE9ETyBPbmx5IHdhaXRzIGZvciBpcnEgaGFuZGxl
cnMgb24gb3RoZXIgQ1BVcywgbWF5YmUNCj4+PiBsb2NhbF9pcnFfc2F2ZQ0KPj4+ICvCoMKgwqDC
oCAqIGxvY2FsX2lycV9sb2NhbF9pcnFfcmVzdG9yZSBhcmUgbmVlZGVkIGhlcmUgZm9yIGxvY2Fs
DQo+Pj4gaW50ZXJydXB0cyA/DQo+Pj4gK8KgwqDCoMKgICoNCj4+PiArwqDCoMKgwqAgKi8NCj4+
DQo+PiBXZWxsIHRoYXQgY29tbWVudCBtYWRlIG1lIHNtaWxlLiBUaGluayBmb3IgYSBtb21lbnQg
d2hhdCB0aGUgbG9jYWwgQ1BVIA0KPj4gd291bGQgYmUgZG9pbmcgaWYgYW4gaW50ZXJydXB0IHdv
dWxkIHJ1biA6KQ0KPg0KPg0KPk5vLCBJIHVuZGVyc3RhbmQgdGhpcyBvZiBjb3Vyc2UsIEkgYW0g
b2sgdG8gYmUgaW50ZXJydXB0ZWQgYnkgaW50ZXJydXB0IGhhbmRsZXIgYXQgdGhpcyBwb2ludCwg
d2hhdCBpIGFtIHRyeWluZyB0byBkbyBpcyB0byBwcmV2ZW50IGFtZGdwdV9mZW5jZV9wcm9jZXNz
IHRvIHJ1biBjb25jdXJyZW50bHkgd2l0aCBhbWRncHVfZmVuY2VfZHJpdmVyX2NsZWFyX2pvYl9m
ZW5jZXMgLSB0aGF0IGlzIHdoYXQgdGhpcyBmdW5jdGlvbiBpcyB0cnlpbmcgdG8gcHJldmVudCAt
IGkgZGlzYWJsZSBhbmQgPmZsdXNoIHBlbmRpbmcgRU9QIElTUiBoYW5kbGVycyBiZWZvcmUgdGhl
IGNhbGwgdG8gY2xlYXIgZmVuY2VzIGFuZCByZS1lbmFibGUgYWZ0ZXIuDQo+SSBndWVzcyB3ZSBj
YW4gYWxzbyBpbnRyb2R1Y2UgYSBzcGlubG9jayB0byBzZXJpYWxpemUgdGhlbSA/IFlpcWluZyBy
ZXBvcnRlZCBzZWVpbmcgYSByYWNlIGJldHdlZW4gdGhlbSBzbyB3ZSBoYXZlIHRvIGRvIHNvbWV0
aGluZy4NCj4NCj5BbmRyZXkNCj4NCj4NCj4+DQo+PiBDaGVlcnMsDQo+PiBDaHJpc3RpYW4uDQo+
Pg0KPj4+ICvCoMKgwqAgaWYgKHN0b3ApDQo+Pj4gK8KgwqDCoMKgwqDCoMKgIHN5bmNocm9uaXpl
X2lycShhZGV2LT5pcnEuaXJxKTsgfQ0KPj4+ICsNCj4+PiDCoCB2b2lkIGFtZGdwdV9mZW5jZV9k
cml2ZXJfc3dfZmluaShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCj4+PiDCoCB7DQo+Pj4g
wqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQgaSwgajsNCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3JpbmcuaA0KPj4+IGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3JpbmcuaA0KPj4+IGluZGV4IDdkODlhNTIwOTFjMC4uODJjMTc4YTkw
MzNhIDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9y
aW5nLmgNCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmluZy5o
DQo+Pj4gQEAgLTE0Myw2ICsxNDMsNyBAQCBzaWduZWQgbG9uZyBhbWRncHVfZmVuY2Vfd2FpdF9w
b2xsaW5nKHN0cnVjdCANCj4+PiBhbWRncHVfcmluZyAqcmluZywNCj4+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVpbnQzMl90IHdhaXRfc2VxLA0KPj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2lnbmVkIGxv
bmcgdGltZW91dCk7DQo+Pj4gwqAgdW5zaWduZWQgYW1kZ3B1X2ZlbmNlX2NvdW50X2VtaXR0ZWQo
c3RydWN0IGFtZGdwdV9yaW5nICpyaW5nKTsNCj4+PiArdm9pZCBhbWRncHVfZmVuY2VfZHJpdmVy
X2lzcl90b2dnbGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIGJvb2wNCj4+PiBzdG9wKTsN
Cj4+PiDCoCDCoCAvKg0KPj4+IMKgwqAgKiBSaW5ncy4NCj4+DQo=
