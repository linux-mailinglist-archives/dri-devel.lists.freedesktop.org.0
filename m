Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC56067FD02
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jan 2023 07:00:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96E7C10E07A;
	Sun, 29 Jan 2023 06:00:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR02CU001-vft-obe.outbound.protection.outlook.com
 (mail-westus2azlp170110001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c007::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5288A10E037
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jan 2023 06:00:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A8wUidPfgcgpOoXBGWDlUM0lL+w+7C4j2j1hLorMt9G30hVVO5FGtVi4YUBMC/ArmIslm8JMxyn3QcVUWcuw7nK8Dljl52WCIDYu56FlJJeR/a25vNicctraDwtG+W2raJYx9I77P/OID6h0pjLbcxSIxJQRg+7pg/GKvIbQiwkgsqeVxBP6Q+JKM41iI5LQHtJvrRFBaUUpoAlSmpfcNtSxwDyg13MyK3XTOLt2L7eaPgPchAB9Hbm+Fmoip5cNZgoR1pAMDZPTO+7AWGMd4O1RZycz8x5GVchb6Z5IsdJXeblyV64GLfef/7DUFVfOMxFD1z93y15eH58GLepxAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xGRvIwASW2mfmyQJ+QhowXEFMP6rscnD5zmmgVPYcCE=;
 b=oJPaH+JUOz1Tx6C11bba/9EYIxb8qWQ0IEMfqZLM/ZH7TQVd8N2Ab4LRtLECPvW0SrKoVj2WNvTK8c0oV8RS2aalirMk5IM3wAg+c+0DIvzpujunhKvudiMwoMAMuHSfQPj3bqAansKJJD6qy5ufqK2RdmgeGG4wlUr3Ey+3cVIJu5Dg/6TDLbsmKwuTL4KhCqIH6tS5KVsMJDs7C8yaCDQc+soaz+fsjiP2MCaCcEbxlOT1vQap7aiBfB4LZyrorFKxVWxO+lgC/dJhaaCwEGctq3NOE7UGnEMv/yu0VtUrpM0UL+rwz2VcHZ3f2VcCkr5j42FtI6XU9M/BiengHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xGRvIwASW2mfmyQJ+QhowXEFMP6rscnD5zmmgVPYcCE=;
 b=xagfYrQsNtuf4by4w8V/ZtkJxuivknaJnknGych1dpeBg+xtpSqPDen+XXJHg1jhK+gdqiEfsXPcRA73lMfiE+ln0DiDjsy3Xbz5BJsUOqhBfryY4hHaWZzHksbrUdHwIu6w/jOrMLFpD0edSzRFCRo1vrHg11TwZnY9V67YW8s=
Received: from CH3PR05MB10206.namprd05.prod.outlook.com
 (2603:10b6:610:155::10) by DM6PR05MB5274.namprd05.prod.outlook.com
 (2603:10b6:5:77::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.33; Sun, 29 Jan
 2023 06:00:18 +0000
Received: from CH3PR05MB10206.namprd05.prod.outlook.com
 ([fe80::ad2d:cb08:253b:26e7]) by CH3PR05MB10206.namprd05.prod.outlook.com
 ([fe80::ad2d:cb08:253b:26e7%8]) with mapi id 15.20.6043.033; Sun, 29 Jan 2023
 06:00:18 +0000
From: Zack Rusin <zackr@vmware.com>
To: "penguin-kernel@I-love.SAKURA.ne.jp" <penguin-kernel@I-love.SAKURA.ne.jp>, 
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>
Subject: Re: [vmwgfx] crash upon vmw_open_channel() when booting on Oracle VM
 VirtualBox
Thread-Topic: [vmwgfx] crash upon vmw_open_channel() when booting on Oracle VM
 VirtualBox
Thread-Index: AQHZMw3wQ9pFUo92V0yToOgi1i+0E660582A
Date: Sun, 29 Jan 2023 06:00:18 +0000
Message-ID: <34c6e0413acb43d746e7dc95e0886ea22fd1cc82.camel@vmware.com>
References: <c59cbadb-7671-2d7c-d535-24f41aff18cc@I-love.SAKURA.ne.jp>
In-Reply-To: <c59cbadb-7671-2d7c-d535-24f41aff18cc@I-love.SAKURA.ne.jp>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.2-1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR05MB10206:EE_|DM6PR05MB5274:EE_
x-ms-office365-filtering-correlation-id: e4ed2eca-7066-4c4a-2dc9-08db01be1951
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7FLgPm28XIZr3etYNACWx6thnIll4nHw7VKw4+K1pGO0TC/tNRWbEENuwsiTl/028J6A72P18RtvRoHz7/MpcDGS5rd7y+zp8cP/KYJgxAqizq699SC7sy0gIVAGc8NRjiuqsJ6YH3ZMGN2Yci1OfUdLAvutRFv8K8NMfCzCXQ5eULxUcsAwzLQdr42ojtCzFQOvMbcQez99h2tQPJvxFH+NcRZt3KBrr67qAsImZQt0tHYPWoCmd8MIVPcQhB/xd5yk5O9l5uazU9lo1gGRypdQBmpdXjotqUfbj2GbYXh4va616m8tQYRpG6AtTVnnSeZBdYt6qn0tX7rucF3xfLxW3UmlZStIVnlRfnSt3hbX4jPNYb+C3WrNZvnCPDrO71KkvUjrhuJoBstZ2lJVqRtdNoHnm5Bg+6psHTtpPt7jGaPUhpZhALMcup0/Sws9+svt+QloxAPLYOBrxzFM5hMXAGzZiEga4k1X/d+DuzydmJ5lUiGEzDmQrb+YCQVJE04UTvEwEy9kyfcXAD4Me6rlQyk1qvMraF1OzzCdWzAhq68ZdLftNAHyx2vui2H0ZLhvPRMQUodFRhrsnO3/p9ZR81EA7x3IAiULAfhFh0HahFTGqlcy0dn09cSr173d/mrCcgFSpTlmEdySQrVOTAKLmWdX7PBHgFNY7qNKF6IttAMkwg+DVmnBRAGV/U8AePJiKRc+15SsgNIPPYGinA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR05MB10206.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(366004)(346002)(376002)(39860400002)(396003)(451199018)(8936002)(316002)(6506007)(71200400001)(478600001)(86362001)(6486002)(38100700002)(2616005)(38070700005)(99936003)(26005)(186003)(6512007)(122000001)(36756003)(110136005)(5660300002)(6636002)(54906003)(2906002)(83380400001)(66476007)(66556008)(66946007)(76116006)(66446008)(64756008)(8676002)(4326008)(91956017)(41300700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T1ZJenFHODh0Q0d3OGQ1cGdrZ3hGWWhGWUh4SUhCZ3pidms2U1VBMmdabzFp?=
 =?utf-8?B?bHRwMEhoNy9waWUrNDRGSUFucXJPSWp1QVMwRG5WR3NsekRsaCtvc1F3WDRh?=
 =?utf-8?B?cXdTcGRRdFQvMTY0dVpXNFdHaFUzMGlyTFhqWDNwSkQ4a0ZhNkJIdm1oTTlo?=
 =?utf-8?B?ck5hVmQzUkdqbVl6TVduRDltamxNdlAvRk9zc1RVMld0aFRXbEVHV29FVXlG?=
 =?utf-8?B?dnJwaGFWWUJvblZ0Yk9xbkhUWUVaVEJxRkZ4aVlYRDBrayt1alB2WnBFamFJ?=
 =?utf-8?B?NjBndmJ4UHFQaE4wRGVKcVozdEVCSWZsb29TSkh4R24xYWlzcGNJY3hKb1BP?=
 =?utf-8?B?VXlmOHRrdU04UUhGSmhSdG01ZERNMmxQYWUvSjVBZzg3RVR2TWtCYlpVMUlN?=
 =?utf-8?B?Y3Jybm9zSUNndGJORUZwTU53dnI1MXhZVVJPcDExZkUyeW44RS9SbnZxZXBY?=
 =?utf-8?B?RVVnL0JRbDRUUCsycHFwYXRXYkZGeW9NbVo4SDlXSkZ4UHBTSC9rUDc5TEN6?=
 =?utf-8?B?Y0cyMEJuSldsQlNCT0ZYUnQ0TFM5MnQ4cWVOSERWbU9INk1JSWNxSzRPdHBZ?=
 =?utf-8?B?N1ZhSGw0akxvaktQalh3cFdRTU9MZkJRZTF0TnM5WEY1R1pDWE5SaGhQZlFh?=
 =?utf-8?B?Z1BQOXhpTXVSa0FYS1Y1UGFQNFhJa3hQYmE1bXdrUDFSUmxVTlhYT1RWcGFF?=
 =?utf-8?B?bzBYamZYZVA5dnlxWUFwR2xKU1VHQnQ3ZHpvYy8wblpZT2pBMGY4VXlSSjFG?=
 =?utf-8?B?SHdRT2RtbEtRMDIwd2ZuRUhGWUpwa20rVGdBeTRJNFNFMCs2Qm44SVF6eWhz?=
 =?utf-8?B?SXJkUDkrWmJhbkhENUIwdlV5WDQvd2FPVnovNlJHTExqUXJsUzJzYVNqRi9r?=
 =?utf-8?B?SXNkVmNySzNhZUQ0WkxOelpQejloY3U1OXhwNXNQeEJrWGdRSVJ2eVFwOW9P?=
 =?utf-8?B?Z09LZHlKRDh1SElKYzduMXNYajVSRjVoV3IwYVZIYUdodVVWMktGcmxwWlZQ?=
 =?utf-8?B?S2p4VGlCTzRISjlCeGNwNmk0ZW4wS2pJdzAxNktkcEhxWDhUZVVCSmtYUFF5?=
 =?utf-8?B?QlhGMWhzL0lWQ3pZTGJiUlVDcXo3Mk9TWUNLZmVqZjNqSDdYdEFXR0hOaUxn?=
 =?utf-8?B?bXdKTC9wTDFmVVRoSGh1eXJkWkxzZjJzQk8yY05SK1JkK0hiVzRKb0czcnNp?=
 =?utf-8?B?NGdHU3RJaVFPVllyQlNyVTJFaGZ6L3AzZ0VUYmlFYTg3VE5mMjZ2NDc4WmYz?=
 =?utf-8?B?eGxMYUt1NEFkeEFjNGM3RDFoMTJraTFZaGVBVWhhWVZxR2l0aVE0TVlVMkZH?=
 =?utf-8?B?WTZ3WDNHYVpaS0JnK1c3bzZpL3EwU1l3Qzhpc0g5MlVUSkdaVzV5QmtvSTZX?=
 =?utf-8?B?dlBQSWZRa0t3YVNCUzhFMFpJRllHYzFRRmpOOFFHTkliZ3g5YXdJSHl3Zmtu?=
 =?utf-8?B?L05NSEhWbGd6OUpFK3J5Mit5S3grL3FpQ0NkaWxrenRVeXFNQUEzR0lOSTll?=
 =?utf-8?B?YkVzSU9LVUhwUHlHOEtZWnd1WDJndXREMkM3bytEV3ZvQXkrUVYrMEQzQlJK?=
 =?utf-8?B?bUpKMFpDYjltR1ZPbWpmeWtuT3lzUHRKSWVGRnpZZG1RSUdhR29URWNXWVZ4?=
 =?utf-8?B?WHNXZlgrc3l4TWZlWWVmbGFQRmFkTEdwbkljcnYzd2h1S0dMY2c5clpmYkFw?=
 =?utf-8?B?YksvMzN4V0FhR3k5cVF5VXl2ejFHc0VuWFFadVY5a3pZSERmU2E3cUxxczBJ?=
 =?utf-8?B?SCs5MUZwMENYMGVhMnJmK1c4alJKVUhuVGZIVkpDbVI2cXg5eXJQdnV6VDFE?=
 =?utf-8?B?U3NwS2xkRWozdmZPWDFyRzFkSzhBNG5GSzVyRUhHQjJCbXNEVUVRNHQ5ZFB1?=
 =?utf-8?B?UFZISytlRjM0cSt2R0xkUFM1enk0MXhTdmJjWEFNaUd1cyt6QlNtUzhjZnpE?=
 =?utf-8?B?SGtzaFVqU1FzdERPdjV1N3M5Mkd1cmU4cU1ML2YxcmR2dEwyampKa3VuWExi?=
 =?utf-8?B?Sm55R0hSczd5SWpnd2pSejdQcEhXWlRPR1Q3Z0xUVWJnZkFyTkpzRzRsZzVh?=
 =?utf-8?B?MGJKTnpiWFdINCtRc1lyZHppUlh2MEI5MVI5Mmo4cmMvKzZNeFZIOUQwY2U1?=
 =?utf-8?Q?xs3R72FdXRSnA/5Eb/+tgIzpX?=
Content-Type: multipart/mixed;
 boundary="_002_34c6e0413acb43d746e7dc95e0886ea22fd1cc82camelvmwarecom_"
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR05MB10206.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4ed2eca-7066-4c4a-2dc9-08db01be1951
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2023 06:00:18.2752 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CFGnEwLXODaUv8gEdJBDakZJPz/xDvud34zJhNUYOi3q8cQchemQblicJXx9Z9USN8yjU15xe2y+kz6rpO3JKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR05MB5274
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

--_002_34c6e0413acb43d746e7dc95e0886ea22fd1cc82camelvmwarecom_
Content-Type: text/plain; charset="utf-8"
Content-ID: <6F88E2E7C4702F48A2759F3604077F02@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gU2F0LCAyMDIzLTAxLTI4IGF0IDIwOjQ0ICswOTAwLCBUZXRzdW8gSGFuZGEgd3JvdGU6DQo+
IEhlbGxvLg0KPiANCj4gSSBub3RpY2VkIHRoYXQgYSBrZXJuZWwgYnVpbHQgd2l0aCB2bXdnZngg
ZHJpdmVyIGZhaWxzIHRvIGJvb3QgYSBMaW51eCBndWVzdA0KPiBvbiBPcmFjbGUgVk0gVmlydHVh
bEJveCA3LjAuNCBvbiBXaW5kb3dzIDExIG9uIERFTEwgSW5zcGlyb24gMTQgNTQyMC4NCj4gSSBk
aWRuJ3Qgbm90aWNlIHRoaXMgcHJvYmxlbSB3aGVuIEkgYm9vdGVkIGFuIG9sZGVyIGtlcm5lbCBv
biBhbiBvbGRlciB2ZXJzaW9uDQo+IG9mIE9yYWNsZSBWTSBWaXJ0dWFsQm94IG9uIFdpbmRvd3Mg
OC4xIG9uIGFuIG9sZGVyIFBDLg0KPiANCj4gVGhlIGxvY2F0aW9uIHRoYXQgY3Jhc2hlcyBpcw0K
PiANCj4gwqDCoMKgwqDCoMKgwqAgVk1XX1BPUlQoVk1XX1BPUlRfQ01EX09QRU5fQ0hBTk5FTCwN
Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIChwcm90b2NvbCB8IEdVRVNUTVNHX0ZM
QUdfQ09PS0lFKSwgc2ksIGRpLA0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMCwN
Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFZNV19IWVBFUlZJU09SX01BR0lDLA0K
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZWF4LCBlYngsIGVjeCwgZWR4LCBzaSwg
ZGkpOw0KPiANCj4gaW4gdm13X29wZW5fY2hhbm5lbCgpLiBJdCBtaWdodCBiZSB0aGF0IHNvbWUg
Y2hhbmdlcyBpbiBWaXJ0dWFsQm94IHNpZGUNCj4gaXMgY29uZmxpY3Rpbmcgd2l0aCBob3cgVk13
YXJlIHRyaWVzIHRvIHRlc3QgaWYgdGhlIGd1ZXN0IGlzIFZNd2FyZS4NCj4gSG93IGNhbiBJIGRl
YnVnIHRoaXMgcHJvYmxlbT8NCg0KWW91J2QgaGF2ZSB0byBmaWd1cmUgb3V0IHdoYXQgZXhhY3Rs
eSBpcyB0aGUgcHJvYmxlbS4gSSBjb3VsZG4ndCByZXByb2R1Y2UgaXQgb24NCnZtd2FyZSBoeXBl
cnZpc29ycyB3aXRoIHlvdXIgLmNvbmZpZy4gRldJVyB0aGF0IGNvZGUgaGFzIGJlZW4gdGhlcmUg
YW5kIGhhc24ndCBiZWVuDQpjaGFuZ2VkIGluIHllYXJzLiBPcmFjbGUgZW11bGF0ZWQgc3ZnYSBk
ZXZpY2UgYWx3YXlzIGhhZCBwcm9ibGVtcywgd2FzIG5ldmVyDQpzdXBwb3J0ZWQgYnkgdm13Z2Z4
IGFuZCBhZmFpY3QgaXMgbm90IG1haW50YWluZWQgYnkgT3JhY2xlIHNvIEknZCBzdHJvbmdseSBz
dWdnZXN0DQp0aGF0IHlvdSBzd2l0Y2ggdG8gc29tZSBvdGhlciBncmFwaGljcyBkZXZpY2Ugb24g
dmlydHVhbGJveC4NCg0KSW4gdGhlIG1lYW50aW1lIEkgdGhpbmsgdGhlIGF0dGFjaGVkIHBhdGNo
IHNob3VsZCBhdCBsZWFzdCBnZXQgeW91IGJvb3RpbmcuIFlvdSBjYW4NCmdpdmUgaXQgYSB0cnkg
YW5kIGlmIGl0IHdvcmtzIEkgY2FuIHB1c2ggaXQgc29tZXRpbWUgdGhpcyB3ZWVrLg0KDQp6DQoN
Cg==

--_002_34c6e0413acb43d746e7dc95e0886ea22fd1cc82camelvmwarecom_
Content-Type: text/x-patch;
	name="0001-drm-vmwgfx-Print-errors-when-running-on-broken-unsup.patch"
Content-Description:  0001-drm-vmwgfx-Print-errors-when-running-on-broken-unsup.patch
Content-Disposition: attachment;
	filename="0001-drm-vmwgfx-Print-errors-when-running-on-broken-unsup.patch";
	size=3733; creation-date="Sun, 29 Jan 2023 06:00:15 GMT";
	modification-date="Sun, 29 Jan 2023 06:00:15 GMT"
Content-ID: <30ECAA00182C5B4CA8E7DFDF9388C169@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64

RnJvbSBkYjY0MDVmYjIyMWE5YjhlODIzMmRmZjg2OTU3NzU1ODRkMzQxY2E4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBaYWNrIFJ1c2luIDx6YWNrckB2bXdhcmUuY29tPgpEYXRlOiBT
dW4sIDI5IEphbiAyMDIzIDAwOjQyOjIwIC0wNTAwClN1YmplY3Q6IFtQQVRDSF0gZHJtL3Ztd2dm
eDogUHJpbnQgZXJyb3JzIHdoZW4gcnVubmluZyBvbiBicm9rZW4vdW5zdXBwb3J0ZWQKIGNvbmZp
Z3MKCnZpcnR1YWxib3ggaW1wbGVtZW50ZWQgYW4gaW5jb21wbGV0ZSB2ZXJzaW9uIG9mIHRoZSBz
dmdhIGRldmljZSB3aGljaAp0aGV5IGRlY2lkZWQgdG8gZHJvcCBzb29uIGFmdGVyIHRoZSBpbml0
aWFsIHJlbGVhc2UuIFRoZSBkZXZpY2Ugd2FzCmFsd2F5cyBicm9rZW4gaW4gdmFyaW91cyB3YXlz
IGFuZCBuZXZlciBzdXBwb3J0ZWQgYnkgdm13Z2Z4LgoKdm13Z2Z4IHNob3VsZCByZWZ1c2UgdG8g
bG9hZCBvbiB0aG9zZSBjb25maWd1cmF0aW9ucyBidXQgY3VycmVudGx5CmRybSBoYXMgbm8gd2F5
IG9mIHJlbG9hZGluZyBmYmRldiB3aGVuIHRoZSBzcGVjaWZpYyBwY2kgZHJpdmVyIHJlZnVzZXMK
dG8gbG9hZCwgd2hpY2ggd291bGQgbGVhdmUgdXNlcnMgd2l0aG91dCBhIHVzYWJsZSBmYi4gSW5z
dGVhZCBvZgpyZWZ1c2luZyB0byBsb2FkIHByaW50IGFuIGVycm9yIGFuZCBkaXNhYmxlIGEgYnVu
Y2ggb2YgZnVuY3Rpb25hbGl0eQp0aGF0IHZpcnR1YWxib3ggbmV2ZXIgaW1wbGVtZW50ZWQgdG8g
YXQgbGVhc3QgZ2V0IGZiIHRvIHdvcmsgb24gdGhlaXIKc2V0dXAuCgpTaWduZWQtb2ZmLWJ5OiBa
YWNrIFJ1c2luIDx6YWNrckB2bXdhcmUuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS92bXdnZngv
dm13Z2Z4X2Rydi5jIHwgMjggKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogZHJpdmVycy9n
cHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmggfCAgMyArKysKIGRyaXZlcnMvZ3B1L2RybS92bXdn
Zngvdm13Z2Z4X21zZy5jIHwgIDIgKy0KIDMgZmlsZXMgY2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13
Z2Z4X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMKaW5kZXggOGUx
Y2Q5ZDZjZWQyLi4zMzlhMDcyNWVkMGMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92bXdn
Zngvdm13Z2Z4X2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Rydi5j
CkBAIC00Niw2ICs0Niw3IEBACiAjaW5jbHVkZSA8ZHJtL3R0bS90dG1fcGxhY2VtZW50Lmg+CiAj
aW5jbHVkZSA8Z2VuZXJhdGVkL3V0c3JlbGVhc2UuaD4KIAorI2luY2x1ZGUgPGFzbS9oeXBlcnZp
c29yLmg+CiAjaW5jbHVkZSA8bGludXgvY2NfcGxhdGZvcm0uaD4KICNpbmNsdWRlIDxsaW51eC9k
bWEtbWFwcGluZy5oPgogI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgpAQCAtODk4LDYgKzg5OSwx
NiBAQCBzdGF0aWMgaW50IHZtd19kcml2ZXJfbG9hZChzdHJ1Y3Qgdm13X3ByaXZhdGUgKmRldl9w
cml2LCB1MzIgcGNpX2lkKQogCQkJCSBjYXAyX25hbWVzLCBBUlJBWV9TSVpFKGNhcDJfbmFtZXMp
KTsKIAl9CiAKKwlpZiAoIXZtd2dmeF9zdXBwb3J0ZWQoZGV2X3ByaXYpKSB7CisJCXZtd19tc2df
ZW5hYmxlZCA9IDA7CisJCWRybV9lcnJfb25jZSgKKwkJCSZkZXZfcHJpdi0+ZHJtLAorCQkJInZt
d2dmeCBzZWVtcyB0byBiZSBydW5uaW5nIG9uIGFuIHVuc3VwcG9ydGVkIGh5cGVydmlzb3IuICIK
KwkJCSJUaGlzIGNvbmZpZ3VyYXRpb24gaXMgbGlrZWx5IGJyb2tlbi4gIgorCQkJIlBsZWFzZSBz
d2l0Y2ggdG8gYSBzdXBwb3J0ZWQgZ3JhcGhpY3MgZGV2aWNlIHRvIGF2b2lkIHByb2JsZW1zLiIK
KwkJCSk7CisJfQorCiAJcmV0ID0gdm13X2RtYV9zZWxlY3RfbW9kZShkZXZfcHJpdik7CiAJaWYg
KHVubGlrZWx5KHJldCAhPSAwKSkgewogCQlkcm1faW5mbygmZGV2X3ByaXYtPmRybSwKQEAgLTEz
MjEsNiArMTMzMiwyMyBAQCBzdGF0aWMgdm9pZCB2bXdfbWFzdGVyX2Ryb3Aoc3RydWN0IGRybV9k
ZXZpY2UgKmRldiwKIAl2bXdfa21zX2xlZ2FjeV9ob3RzcG90X2NsZWFyKGRldl9wcml2KTsKIH0K
IAorCitib29sIHZtd2dmeF9zdXBwb3J0ZWQoc3RydWN0IHZtd19wcml2YXRlICp2bXcpCit7Cisj
aWYgZGVmaW5lZChfX2kzODZfXykgfHwgZGVmaW5lZChfX3g4Nl82NF9fKQorCXJldHVybiBoeXBl
cnZpc29yX2lzX3R5cGUoWDg2X0hZUEVSX1ZNV0FSRSk7CisjZWxpZiBkZWZpbmVkKF9fYWFyY2g2
NF9fKQorCS8qCisJICogT24gYWFyY2g2NCBvbmx5IHN2Z2EzIGlzIHN1cHBvcnRlZAorCSAqLwor
CXJldHVybiB2bXctPnBjaV9pZCA9PSBWTVdHRlhfUENJX0lEX1NWR0EzOworI2Vsc2UKKwlkcm1f
d2Fybl9vbmNlKCZkZXYtPmRybSwKKwkJInZtd2dmeCBpcyBydW5uaW5nIG9uIGFuIHVua25vd24g
YXJjaGl0ZWN0dXJlLiIpOworCXJldHVybiBmYWxzZTsKKyNlbmRpZgorfQorCiAvKioKICAqIF9f
dm13X3N2Z2FfZW5hYmxlIC0gRW5hYmxlIFNWR0EgbW9kZSwgRklGTyBhbmQgdXNlIG9mIFZSQU0u
CiAgKgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmggYi9k
cml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuaAppbmRleCBjMjMwY2RmYTE0NzUuLmU0
MzZiOGQwNDJiYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2
LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmgKQEAgLTY1Myw2ICs2
NTMsOCBAQCBzdHJ1Y3Qgdm13X3ByaXZhdGUgewogI2VuZGlmCiB9OwogCitib29sIHZtd2dmeF9z
dXBwb3J0ZWQoc3RydWN0IHZtd19wcml2YXRlICp2bXcpOworCiBzdGF0aWMgaW5saW5lIHN0cnVj
dCB2bXdfc3VyZmFjZSAqdm13X3Jlc190b19zcmYoc3RydWN0IHZtd19yZXNvdXJjZSAqcmVzKQog
ewogCXJldHVybiBjb250YWluZXJfb2YocmVzLCBzdHJ1Y3Qgdm13X3N1cmZhY2UsIHJlcyk7CkBA
IC0xMzU2LDYgKzEzNTgsNyBAQCBpbnQgdm13X2JvX2NwdV9ibGl0KHN0cnVjdCB0dG1fYnVmZmVy
X29iamVjdCAqZHN0LAogCQkgICAgc3RydWN0IHZtd19kaWZmX2NweSAqZGlmZik7CiAKIC8qIEhv
c3QgbWVzc2FnaW5nIC12bXdnZnhfbXNnLmM6ICovCitleHRlcm4gdTMyIHZtd19tc2dfZW5hYmxl
ZDsKIGludCB2bXdfaG9zdF9nZXRfZ3Vlc3RpbmZvKGNvbnN0IGNoYXIgKmd1ZXN0X2luZm9fcGFy
YW0sCiAJCQkgICBjaGFyICpidWZmZXIsIHNpemVfdCAqbGVuZ3RoKTsKIF9fcHJpbnRmKDEsIDIp
IGludCB2bXdfaG9zdF9wcmludGYoY29uc3QgY2hhciAqZm10LCAuLi4pOwpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfbXNnLmMgYi9kcml2ZXJzL2dwdS9kcm0vdm13
Z2Z4L3Ztd2dmeF9tc2cuYwppbmRleCBlNzY5NzZhOTVhMWUuLjE0NThlMWFkOTY3YSAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfbXNnLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL3Ztd2dmeC92bXdnZnhfbXNnLmMKQEAgLTY3LDcgKzY3LDcgQEAKIAogI2RlZmluZSBN
QVhfVVNFUl9NU0dfTEVOR1RICVBBR0VfU0laRQogCi1zdGF0aWMgdTMyIHZtd19tc2dfZW5hYmxl
ZCA9IDE7Cit1MzIgdm13X21zZ19lbmFibGVkID0gMTsKIAogZW51bSBycGNfbXNnX3R5cGUgewog
CU1TR19UWVBFX09QRU4sCi0tIAoyLjM4LjEKCg==

--_002_34c6e0413acb43d746e7dc95e0886ea22fd1cc82camelvmwarecom_--
