Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17929580B0C
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 08:16:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D20C810E1AA;
	Tue, 26 Jul 2022 06:16:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo-csw.securemx.jp (mo-csw1114.securemx.jp [210.130.202.156])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78BCC10E42D
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 06:16:13 +0000 (UTC)
Received: by mo-csw.securemx.jp (mx-mo-csw1114) id 26Q6FqJb007516;
 Tue, 26 Jul 2022 15:15:52 +0900
X-Iguazu-Qid: 2wHHoF6uBaMqSIssTr
X-Iguazu-QSIG: v=2; s=0; t=1658816152; q=2wHHoF6uBaMqSIssTr;
 m=fEt1UvIaqh1juYBxkM/D3qyUOP2Bf8DTiXq3lUzwUCI=
Received: from imx12-a.toshiba.co.jp ([38.106.60.135])
 by relay.securemx.jp (mx-mr1113) id 26Q6FoMB034365
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 26 Jul 2022 15:15:51 +0900
X-SA-MID: 39433850
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W3zCQYCgEe2qQBlcMRZWe2MfBKdPkTZbAqK9XJkii22Es23X8fQBdQ1dCooI6t4eGs7VEy0OXvFONMZ+7qyKvOFkKGNxtgNSFOoitXKuSpLaXHD+vN4nNvrK4lV7/XUr5zwimDa+FEQ/enHCu5D4SiRlTF9+0TB5F8VLi73n557WiNCyYVZFCGz9pYaX22xz6AYwM9ansdilFkGL61aHkKF4CPJM502ylzrZLx5F7hVl44e9oBZUuv9VVX0FI7bNXhE5vMpSTaLUmaxy2W8xWo+wxDDkRWc8/e/3LDHMCYfK2VVkwgm/j2KQH9G6g2ItQKVLiQ8VKrnNuETw1c1onQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jhhuj4xs+XjTuV5WnLy+5f9Xqs8H5ql4OIBC0Hr1Op4=;
 b=iDv2f1TSnPDUcrwFF9th49FX92YNXFDO59g4oega6u90Hx4rxg0WIltcBlAu5EB36uzcXXd5ruqglp/HBvAtTGcPgNRNy0gspbjvUPLefOIUelRedbx2V9jC1NCIWd/Ss2ixQgHJHSZgG1zCgP0dnM7zR+z0v3LFVCWCRZ6Lp8AnAe1ZKbIRtr4Y7PuTbP5dNL7VcB3HNek4BhrdlcQx+5fxmYBLkv+QXrzLm5tfCA9+D4ogQPxw8Ykv6B9mSMZsUQzSInc270VF0apOvcm0vsknt5WhIZ5uIWWd2cNKoM1FaaCY+KvNYxtWKGFvIGOnT+c4pyA3HSKblfDI1jzMmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toshiba.co.jp; dmarc=pass action=none
 header.from=toshiba.co.jp; dkim=pass header.d=toshiba.co.jp; arc=none
From: <yuji2.ishikawa@toshiba.co.jp>
To: <corbet@lwn.net>, <robh+dt@kernel.org>, <hverkuil@xs4all.nl>,
 <nobuhiro1.iwamatsu@toshiba.co.jp>, <sumit.semwal@linaro.org>,
 <christian.koenig@amd.com>
Subject: RE: [PATCH v2 5/5] Documentation: driver-api: visconti: add a
 description of DNN driver.
Thread-Topic: [PATCH v2 5/5] Documentation: driver-api: visconti: add a
 description of DNN driver.
Thread-Index: AQHYnaUsWtn65bnhlEWUqyKsfeCQSK2KY9IAgAWz2EA=
Date: Tue, 26 Jul 2022 06:10:43 +0000
X-TSB-HOP2: ON
Message-ID: <TYAPR01MB6201F55F3E0B036E875963E692949@TYAPR01MB6201.jpnprd01.prod.outlook.com>
References: <20220722082858.17880-1-yuji2.ishikawa@toshiba.co.jp>
 <20220722082858.17880-6-yuji2.ishikawa@toshiba.co.jp>
 <87zgh1jmr9.fsf@meer.lwn.net>
In-Reply-To: <87zgh1jmr9.fsf@meer.lwn.net>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=toshiba.co.jp;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 110e4d82-da38-499d-26b3-08da6ecd928e
x-ms-traffictypediagnostic: TY2PR01MB1900:EE_
x-ld-processed: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AizmFmu1cDC8GjGg+1yFW1nVZABAzVIMTV0saVZ9FncXL9SoT3tfZ7WVL3m+3YHStbH6s//yVeKpyPQ/HNF3yO5fP9ZyfnppAiuBujoRS80waU1ENmZ76Mwc07gwvan4PKy8j49CMjlAHqq6KtD9jS0lgEdfmvoPLrLClM/HkzriQ0pRqCaOP1Hq9xf34pUaKRqZKN7Ly0RO+kPB0LTT49iji99NHh8QMVubstezAGHASPKZCNtQidDl0QwlJWov16k2Wc0yPenI9AQPx+cmcIaMflVA7km0sM/dt3pcTXVGvl6IJtZ0ZRoe7xW22T2aJvyQk6nXb0VlA/yI91ejr0cB7sumJdqFMRh69Uby0FOlvxTVY3evXRiXRhuXkNpea53rUlA7DPsG+nqPp88CWdDnQlqrZgu6r/dorgnpP29yWsfCBwtmBkycAvSSYv5bS36/6KhiU8VX6F+GeD/pMPGZgLz7La9mrU1q5wwGGImIrqBxU9EvUWVUlkdmLEjNORHfnchXWfenCUXhIejGtUAO9ZxJfCO2FcaRrXJmu8g5hT8ZMNnrgKEFuIyW9NVqxJCGX5sisvLS7REwUM3JuUPE/THR1aOd5ZqgxLEvv1hTkaimwi6WR7Tsrzt6g6rslnB1Z4ApZ7wD7RDheHqj3gw6QwKekkOzl7Y23sKc1lPF34O6gidXjBpYMOGXRUiq1EI8YbucIGheDKOY3Bu1C+V9slsK4AD0RCizM7XBDQyYq52twNx26RUW2ShYOgwYBw6HRVbO2GN+yLEXwi6Cw1POgoisXOz9AuDcfyU001wmvFppLFsHVlsItlb+++WE
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYAPR01MB6201.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(346002)(376002)(366004)(136003)(39860400002)(110136005)(41300700001)(71200400001)(316002)(478600001)(55016003)(54906003)(2906002)(66446008)(66946007)(66556008)(8676002)(64756008)(7416002)(4326008)(66476007)(5660300002)(76116006)(83380400001)(8936002)(86362001)(38100700002)(122000001)(186003)(7696005)(6506007)(9686003)(33656002)(53546011)(38070700005)(26005)(52536014);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aFVUK2s3bFkxQXJGTVJPdHZUT1NhUld6YU5LcytEdFh0OVBnUUsxaHFhdDRL?=
 =?utf-8?B?UTFoMTZNZ0ZzbE1IM3FqNHFLSlZEZzJKd1BzeWttVEFUdC9Hd3R2N04vQThz?=
 =?utf-8?B?VFJ3VkMyMmM1QWtaWEhKeWYrV1BJVVpGY1FFNUVLM09iRDM1SjhoSUpXNVdK?=
 =?utf-8?B?TS9jM0ZzV2dHZ05XcEplc1RiTUZvZGVHVWxEejd2cUtHZTAxNGcwSnNZdkxj?=
 =?utf-8?B?Q0lHYjhqaU1rRVdxa2pmVlBWRDcyOVBJRk1ET3FoRzRxbGRkY1hIVjhuOGN1?=
 =?utf-8?B?T1ZVU2NhWTJwd1crcHFkYzM1dGQ4eDFOQkxpMGdRakFZbXVsTVpGdmFMMXJz?=
 =?utf-8?B?TkZQZDFUcjUwVmgwTTRxeEFJZ21VVkVENTBXdHpWS1JVK0JVRFJTcDhzZm43?=
 =?utf-8?B?SnJEU0FSUHlrOXVmcDNrazZ2RDU2Q0tKQnhXZG9YMVhvbEd6TDFiMVlibHRJ?=
 =?utf-8?B?YTlZZHNtd2hnTExaaUpoWm9LRWRaalJJNE9UR01QbjFmMXFESTl0cnJrTWhm?=
 =?utf-8?B?MGJFcmhmSjRlVTYxWkRFMHlkWTcvVURHa3QwMjlodU52bjdmT25EZEt4blc0?=
 =?utf-8?B?aVlKZjI2L1VFdTJMdkFPSG4zZ3hDRmdlNGRqdi94T0Z5NzZTdHFwZjllTWl5?=
 =?utf-8?B?ekN2eUlYZE1iR0R2QVZvWjJIUHJoK3pMM2lIbUwrem5kTFJydi9OcDYyN0xN?=
 =?utf-8?B?N2V1dllxdGpzaTVGaTEyUlpGZ2gyTUd4MzFSWk1RZTdoNi9OZlZwdXlodkh3?=
 =?utf-8?B?cEhSdFo3WXhqZFN3Um9mWUMxY2IyVmRnMHdZNWt2UmtvMjZnVlArT1VnY3dx?=
 =?utf-8?B?Nm5YeWdnSi9neXFvaDIvMGtJR1dZNlhEUmdQY0hyR091MFNhYjlBSStrRFJU?=
 =?utf-8?B?MWhSK0VwVEE1MDBnZUF1SEptRVI1TkVSM0V4MDUrUE11dUpKV3BIaWRHbUo3?=
 =?utf-8?B?K1paczc3SEdSL1EydEVhaVdxZVBMMDFLOGlyd0pGUkpuU0hzK28zd1Y3eG9o?=
 =?utf-8?B?Z1ZQMTBsb0c2aW5IWk1JTndUcjMzTzk3enA3TlRVTmlodjlEdlhyWUNHUTF3?=
 =?utf-8?B?RjgrVittNUd0aXBkUUV6cmJRVm5zTm5ZWFlDdHMzV3h3MWhRVXkrVTBWdjNU?=
 =?utf-8?B?RnpNQ0ozNnIrNUZvMEN1cVJ4NS8zVFFJNFRuaWMyQzFnWExjcXA0Qm1DcTh0?=
 =?utf-8?B?a1JRL0xpYklLbnN2SmNOdjhldnpvTUF1aXROUUVDYlFFR0J4Z0ZpVFV5NUZM?=
 =?utf-8?B?VWVjUXFJemhsWXlVN1B3NFZTbDVwRldKcHdVUmx1dGJId0JwcWlxYlBvNjNV?=
 =?utf-8?B?azdlaHVDSzlZOXgva2wyTEF1cnFtQVY4L05Vdk1nbW5Xd0JWNnJnU3BSTGgy?=
 =?utf-8?B?WUZ4SVBJNE55ZG8rbmgrbUw4M01KYlEwekppZDdxcDJ6dG9tdG9hTmxoVEFs?=
 =?utf-8?B?amZFRXhiejhKaFFtYUxaV0lTcWVWTmMwbkt3a1NEanZ3VU1CN3VDRWNQci9r?=
 =?utf-8?B?WjU1Q3ZCK1ZQZWNtRFNqeUphVmRFZVJ5TmtrYW5IQm5ueUdjQk9rbXpiS1Zp?=
 =?utf-8?B?OEc5SjNvUmk0UjFSVFpCaDNRSDV3UU94YUpSYmNDL015Q0hUTDBDL1BGUEFn?=
 =?utf-8?B?eE9nTDFzWGcwRzNRdWlIS2krLzk5Y0pDVjdWWThwNTNNVUR1M2ZpNmhobjMv?=
 =?utf-8?B?WjY5aUVXKzcveWhncWdzMFY0NVhDVWUzc1RUTGxtc0VOU3I5N3AwZTUvQlBR?=
 =?utf-8?B?aUhWSjhNVWJ6bGpZSlRXUHBDSDByNHFpdmZsNnBKdzV0Q21wbGZOZytCcC85?=
 =?utf-8?B?R0dWaTJ4SU1rSGE2c2poZFh5UHF6dUNCSG9SWk1UNEM5NW50Tm1Idk5OY2xv?=
 =?utf-8?B?NEZGVU5CTXNOVnV0TDRMV1JCZVJ0enBRWk5LcHdiMi9vWldSZk5sbUJXSS9z?=
 =?utf-8?B?V29JcTJKRUZBNTA3NDhYMjZ1MEs5Ymc1eGNwUXQ4YXFhWFRyYVJZczl2TWNw?=
 =?utf-8?B?eXlCL09DYzhHZlJaTXZ6R2NLcGVqM2tPRE05ZXhPWTVRaUpOYVJxSkZ5V3Ro?=
 =?utf-8?B?UmN6TFNaNjlPcU8xa29na1VmZU4zOTRJMy9xdWNlQmFyZWljc3V5V3BRV1dC?=
 =?utf-8?B?eHM2NTdHczVvTDdEbHZwd2I3Y0xJeXlqaU1oMG5CdTFSKzVVZy9TU1RSMjVk?=
 =?utf-8?B?NkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYAPR01MB6201.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 110e4d82-da38-499d-26b3-08da6ecd928e
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2022 06:10:43.2174 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AbDwNKhQ+rUQDDpyDxPEMxJ11NPJQHD6tNDMXAzepsvGomRZlSz6Pj8IFFmwZfzXB+kJ85D66koGp7OMJfoKFLK/DLCVWQHcAj7hdj6Ptb0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB1900
X-OriginatorOrg: toshiba.co.jp
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSm9uYXRoYW4NCg0KVGhhbmsgeW91IGZvciB5b3VyIGNvbW1lbnRzDQoNCj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSm9uYXRoYW4gQ29yYmV0IDxjb3JiZXRAbHduLm5l
dD4NCj4gU2VudDogRnJpZGF5LCBKdWx5IDIyLCAyMDIyIDEwOjMzIFBNDQo+IFRvOiBpc2hpa2F3
YSB5dWppKOefs+W3nSDmgqDlj7gg4peL77yy77yk77yj4pah77yh77yp77y077yj4peL77yl77yh
6ZaLKQ0KPiA8eXVqaTIuaXNoaWthd2FAdG9zaGliYS5jby5qcD47IFJvYiBIZXJyaW5nIDxyb2Jo
K2R0QGtlcm5lbC5vcmc+OyBIYW5zDQo+IFZlcmt1aWwgPGh2ZXJrdWlsQHhzNGFsbC5ubD47IGl3
YW1hdHN1IG5vYnVoaXJvKOWyqeadviDkv6HmtIsg4pah77yz77y377yj4pev77yh77yj77y0KQ0K
PiA8bm9idWhpcm8xLml3YW1hdHN1QHRvc2hpYmEuY28uanA+OyBTdW1pdCBTZW13YWwNCj4gPHN1
bWl0LnNlbXdhbEBsaW5hcm8ub3JnPjsgQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5p
Z0BhbWQuY29tPg0KPiBDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBs
aW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOw0KPiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5v
cmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7DQo+IGxpbmFyby1tbS1zaWdAbGlz
dHMubGluYXJvLm9yZzsgaXNoaWthd2EgeXVqaSjnn7Plt50g5oKg5Y+4IOKXi++8su+8pO+8o+KW
oe+8oe+8qe+8tO+8o+KXiw0KPiDvvKXvvKHplospIDx5dWppMi5pc2hpa2F3YUB0b3NoaWJhLmNv
LmpwPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDUvNV0gRG9jdW1lbnRhdGlvbjogZHJpdmVy
LWFwaTogdmlzY29udGk6IGFkZCBhDQo+IGRlc2NyaXB0aW9uIG9mIEROTiBkcml2ZXIuDQo+IA0K
PiBZdWppIElzaGlrYXdhIDx5dWppMi5pc2hpa2F3YUB0b3NoaWJhLmNvLmpwPiB3cml0ZXM6DQo+
IA0KPiBObyBjaGFuZ2Vsb2c/DQo+IA0KDQpJJ2xsIGFkZCBtb3JlIGRldGFpbGVkIGNoYW5nZWxv
Zy4NCg0KPiA+IFNpZ25lZC1vZmYtYnk6IFl1amkgSXNoaWthd2EgPHl1amkyLmlzaGlrYXdhQHRv
c2hpYmEuY28uanA+DQo+ID4gLS0tDQo+ID4gdjEgLT4gdjI6DQo+ID4gICAtIG5ld2x5IGFkZGVk
IGRvY3VtZW50cw0KPiA+IC0tLQ0KPiA+ICBEb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvdmlzY29u
dGkvY29tbW9uLnJzdCB8IDExNSArKysrKysNCj4gPiAgRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBp
L3Zpc2NvbnRpL2Rubi5yc3QgICAgfCAzOTQNCj4gKysrKysrKysrKysrKysrKysrKw0KPiA+ICAy
IGZpbGVzIGNoYW5nZWQsIDUwOSBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCBEb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvdmlzY29udGkvY29tbW9uLnJzdA0KPiA+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL3Zpc2NvbnRpL2Rubi5yc3QN
Cj4gDQo+IFR3byBvdmVyYWxsIGNvbW1lbnRzOg0KPiANCj4gIC0gWW91J3ZlIGFkZGVkIG5ldyBS
U1QgZmlsZXMgd2l0aG91dCBhZGRpbmcgdGhlbSB0byBpbmRleC5yc3Q7IHRoYXQNCj4gICAgd2ls
bCBrZWVwIHRoZW0gZnJvbSBiZWluZyBwYXJ0IG9mIHRoZSBrZXJuZWwgZG9jcyBidWlsZCBhbmQg
d2lsbCBhZGQNCj4gICAgbmV3IHdhcm5pbmdzLg0KDQpJJ2xsIGFkZCBpbmRleC5yc3QgdG8gcHV0
IHRoZXNlIGRvY3VtZW50cyBpbnRvIHRoZSB0b2MgdHJlZS4NCg0KPiAgLSBQbGVhc2UgYXZvaWQg
dGhlIHVzZSBvZiBmbGF0LXRhYmxlIGFuZCBqdXN0IHVzZSByZWd1bGFyIFJTVA0KPiAgICBhc2Np
aS1hcnQgdGFibGVzLiAgT3RoZXJ3aXNlIHRoZSByZXN1bHQgaXMgbmVhcmx5IHVucmVhZGFibGUg
aW4gdGhlDQo+ICAgIHBsYWluLXRlc3QgZm9ybWF0Lg0KDQpBbGwgcmlnaHQsIGZsYXQtdGFibGUg
d2lsbCBiZSByZXBsYWNlZCB3aXRoIHJlZ3VsYXIgdGFibGUuDQoNCj4gVGhhbmtzLA0KPiANCj4g
am9uDQoNClJlZ2FyZHMsDQogIFl1amkNCg==

