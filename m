Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A447C580B08
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 08:16:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2174710E2E4;
	Tue, 26 Jul 2022 06:16:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo-csw.securemx.jp (mo-csw1514.securemx.jp [210.130.202.153])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D4E510E399
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 06:16:04 +0000 (UTC)
Received: by mo-csw.securemx.jp (mx-mo-csw1514) id 26Q6Fkd7006691;
 Tue, 26 Jul 2022 15:15:46 +0900
X-Iguazu-Qid: 34trAWry5ZXIG3rx6Q
X-Iguazu-QSIG: v=2; s=0; t=1658816146; q=34trAWry5ZXIG3rx6Q;
 m=gV8bIluEiykHQgo8eHHa8m3c7O2mWQn4RGZyhImE7zY=
Received: from imx12-a.toshiba.co.jp ([38.106.60.135])
 by relay.securemx.jp (mx-mr1513) id 26Q6FjpC031974
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 26 Jul 2022 15:15:45 +0900
X-SA-MID: 39433835
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TR9T6FRcL12Ve2IRo2kLDwJDU8j1SUzTRston69zmKOZKKyKRZMpMQHM71uNr/wYeEnWJD7HitU6pzzYu8SJdvnOWfobEthmwsiatHa27ITtS4zXJVoUZJ2EftB/9+sZdWgWbMh90/0T3sRzqk92U4TzVWQHvlyS6syD3y3t8H6Gr4vD0dLfvpJTVsmAW60td8rO6YcttWY6GV8XFuJHX7aumb2S19Y1n3WZTGcjDJ1XFjRJubSpn8uv77HPHOYa9+MQAfl8iquWU38LQLbpTGgVUchr095A+edaAcQgfKZ3TVUG9Wai3NNE4OueBIu8ACFM0pCBDnQ7CC6Ag8GBbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VizuasVqvDOgx1qYQvSUQyobAyjp4UOhJb8MZ0BgfvI=;
 b=goOZ1PI58T90bROn0lY5KBfhXlmWmdNWCBq0IYuy4mDx4t0AguvoKTVJ0hYDJMUDdUCexGVUuQZFzqXvpxF5nkqdzNB7gHbw+Dc5GrKjRbv07jUfvFD8/AAQaFpEUNMDwaB2T9TJIQVVbnZ0PXBtvxWz3J+sdlZ4gtLfpOvHqQEjqjtPP/hNzuslnUW4dq2ajd/vUCWmLTzgX5LVFrNGRtpjwLSB9zmArXk55fTRVPJeibf+wOwpMJce7Eedlp9MiagnMZOsJ6FE4zwKcsxToCtkUyD3PDoY8X8smmKeNkw86PflmdWYue5LS/fZCGO9kZFEokJrx+ZlEHn0SDFf3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toshiba.co.jp; dmarc=pass action=none
 header.from=toshiba.co.jp; dkim=pass header.d=toshiba.co.jp; arc=none
From: <yuji2.ishikawa@toshiba.co.jp>
To: <gregkh@linuxfoundation.org>
Subject: RE: [PATCH v2 3/5] soc: visconti: Add Toshiba Visconti DNN image
 processing accelerator
Thread-Topic: [PATCH v2 3/5] soc: visconti: Add Toshiba Visconti DNN image
 processing accelerator
Thread-Index: AQHYnaUq2USs7z33O02SH8FDO7LUpq2PDxGAgAEPI/A=
Date: Tue, 26 Jul 2022 06:10:37 +0000
X-TSB-HOP2: ON
Message-ID: <TYAPR01MB62013C42CB26FD456929C0D592949@TYAPR01MB6201.jpnprd01.prod.outlook.com>
References: <20220722082858.17880-1-yuji2.ishikawa@toshiba.co.jp>
 <20220722082858.17880-4-yuji2.ishikawa@toshiba.co.jp>
 <Yt6Rryi4SHVc4DR4@kroah.com>
In-Reply-To: <Yt6Rryi4SHVc4DR4@kroah.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=toshiba.co.jp;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e7cb51a9-5555-46e8-6f0b-08da6ecd8f3a
x-ms-traffictypediagnostic: TYAPR01MB3424:EE_
x-ld-processed: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: N4u2zUKGdTI4VcI/tHsyRkKcUbgpoM1xe3QQSRZQ8zgMjz6pl8EICXtHWVYMQ7lNNNWyd35p5of4JGy5t0pUW6FA6Mx6qHkHepqFre2QfLArQXMPmC51gkpZHJ/7IG7hytF2DSDcAx0gMMsV1SZK4OSqNpmOtaSqtZ1XJhGhPmKZzCO3h4MjI6MPj7X4dkbZ2KrKtcYfOmZHEB9MaVZQlRxQLmpEFflBY6JopjcYGq4DE2Fi78ELaYYkJiobXbXw0nHeQ+IbncTtEckstp7z0ATGP6G/0/EuqGxYRYG6e4Ob0c905yBue+d/XiDK3wbZo1YaYafsw47T2TU6sGLaegQX6epdvuSWJy+az2KXswwYyzYexSWqQQVQY5gZ2cT27yc64XYuv3+eta6EfOElnfC6bdOwn38bbNthg7kxgRdUNDyDWawUoyhNS1Pz62IphV8DDc/eZlCatf7XPp/aYNTkHK8WaTfWpO5f9t5e/5+2x6U7wyWx7YshYPCGYeHNzOhmL/FpqVrj+2lbgx45c26wKeP9yKv+arVLGqtrV8udBPbHYfJOsW/iAlk6PepqtHPSeDNy5zZ2lnQ7ACMETmdOFhbZ8uevv6El+HAKidWTKDO7qaKiVourEBNCY1EMg0keKbKkrrILeoca/YtiI6wuYfVWWNNtVugJ0WvbD/vuWoqtRDB17Tvcp5bMCCK3/ci88kXcBkkTBaKPLfCe9aKakDHeVuMu4fqWP6E5ITXzHAMNCzTvvy1LInK9nlHPzevACsL46fty6X9l3cKGXzeK3LdrRPnUauVvA642wLl+uGGxyIRo26PDsEtD5T8g
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYAPR01MB6201.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(376002)(346002)(396003)(366004)(39860400002)(4326008)(316002)(55016003)(66556008)(66946007)(66476007)(64756008)(66446008)(8676002)(71200400001)(8936002)(54906003)(478600001)(76116006)(6916009)(52536014)(5660300002)(7416002)(2906002)(41300700001)(6506007)(7696005)(53546011)(86362001)(33656002)(186003)(38070700005)(66574015)(38100700002)(83380400001)(9686003)(26005)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S1NzYi8rVjVLOVYzSmcySk5NTDRxYVlmalh4TFNaWjJGTDI1SFQ5MEt0UjV0?=
 =?utf-8?B?ZzNETTJmcHo1TjFraFNvRzFTTi9VRjl2WXp4T1o3anN1czhzZTgxU0I3bzh6?=
 =?utf-8?B?eDREbGZ5UFdHRk42WlBnV3EwRVl3Mjk4eFpXZmkxS2hxd0VxVExncXZwSGJU?=
 =?utf-8?B?eXMrZ3AyNEIwcklNY0R6Y056U3NSY0ZXYmpiNlFiMmg1L3g1YmxjMUNrQjJs?=
 =?utf-8?B?My9kTDRXVGFNOXY3WHBmV2NzSjB6RHhOODBITTJJVGs1Vk13ZUlpZ2hKeVly?=
 =?utf-8?B?M0l0cjI3b1BrZndNZTNFcktKdXM1cWlsdENzQndqeERoZks5dmFzc1JiUUkw?=
 =?utf-8?B?WnBSclR0OHZybW85SGUvOWV4UlBnUHJxTmZnYnRaUEpvNCtjUlVoRVNXVmxT?=
 =?utf-8?B?VzRHY3l5YnAyTDdsbDNlNnhuYXE2TzFRNXRFaDVZQmRYNGU5TERPRm5Cb01w?=
 =?utf-8?B?aTVXMkg3YnRlSnMyYllSUzZiN0JPclg5WkdkcWZxTFVVa2xSVGdlM3BySGJE?=
 =?utf-8?B?d3BSdXBYYjNBTks0TzVMNkE1TWFKSEZTOVU4cnd6Ung4VGlKVUUvdExaKzZC?=
 =?utf-8?B?eC9WS2lQbDRmdnNvcWFNR2ZvazBmNUFDc1FSanE2eE81M3ExNVdUMU56RlFG?=
 =?utf-8?B?alhkKzh1REFTSWlYZUQ2NlVrVlpWeHE1ZFkzRzZnaEwxWUJ3YVRFN3QzNHph?=
 =?utf-8?B?WFFNQ3BXYXVsM1JYb3JnNjJjNmkzWDdrWlpyWnRzSG45UHFDNEs2b0lZeDdv?=
 =?utf-8?B?cTVxRWZ5cVVKWFhyUGVZWWZtYVBNWnU0Y1VNeTNQOXgrZ2lnMzcycWxubXpy?=
 =?utf-8?B?WjYzbFFUVDRXM1hYWEg4WmVrbnhUWm1Bb3d4R09GUHBxUW5yaUJ2WDdiUFE4?=
 =?utf-8?B?SVNLY2htdzJLcFNjZmpHWm4yQkFrRHNWdVYvQWwyMUp6cDRaMUR2d0U4SXAw?=
 =?utf-8?B?ZHNQVGh1eGN2eUxsYUJtTHFhUXhvKzhqODFrNmpJRXhDWGkxQWZLQ3lrYzhi?=
 =?utf-8?B?djFQcXY5a0tPeGxDMnVOTmZyeUVFSGZIUmx4L3V5VXdWZ1MxLzJSTDltU3RB?=
 =?utf-8?B?eTNucUJ3aUpMdWd5a0Rac3FPRFROV0JJK3FBeHBCOGdjLzJJT05xSklhWVFh?=
 =?utf-8?B?blVLWUJDRzZPbjgxRmZXVmJhVEdMdlMyMVArb0pkcUtGcXVTbVduUkI3ZGVE?=
 =?utf-8?B?RGNONmlXOE1UVmY2c2llTDZaN2U4cHZwZDhucWozWmlHaGVUcFhYYk4wRU9t?=
 =?utf-8?B?YjJuYzhid2wwSGZyUlRXZkFHSnFneC9VVEpEa2hINjNIVU9sSXR6V1RpbVZx?=
 =?utf-8?B?RVYzZTdBUXpNYkRnMXVWeXY2cEdtT054NWNxS0h3QmV6azJnOU1LdDczS2dQ?=
 =?utf-8?B?MXRWcFdkVmFqa3BMT0ZUeHVDclprdXZYQ25HY1d6SUppT1B4Wkl5UWQ1Q3pB?=
 =?utf-8?B?RXNLUGZ6VjhHU0VDMDJoTW5EWTBtVnBOZnJOQ0hwdzdlUDNBMHB1eWg3a1Nq?=
 =?utf-8?B?bStwYkhidkFac0U1M2dSUzhueVp2dG1VT1d2emZjWVM0ZU50NWlRc2dxRCtH?=
 =?utf-8?B?RUN4b3NqdWJpWW5sOGk1OVVwQkZNcmNSS3R0UE9DL2VMNmhOamY4S1dDazdB?=
 =?utf-8?B?NEYvenR4T3h4NllCQUwzZzg3N3hHaVdHa2lMbXJXaG5LQU5raTVNbGtNa3hI?=
 =?utf-8?B?STFiVk1JQW9mUlh5QUJPT0ltTzVyLzlkb1BBZi9FeWUxMUU3YjNXeTFsQmxE?=
 =?utf-8?B?RldsL2tEV0xSRW9QckdEWlZFcDRYTmkyR0xmRXhNNkhvY20wR04rYUNwR0hv?=
 =?utf-8?B?V2hDejNvbFNMSlBTRDgvL3FyaGVLSzkrOXlqMFo2SXl6Ym1TY3RxR3RQdWxi?=
 =?utf-8?B?Skd0c0N2N0xJbzMzMFh5MjhLMkRpWGRHQlVUSi91ZlN4ZEdMV29waFlOcENK?=
 =?utf-8?B?S0IyTXlXZzhnd1hjaTdFajQ0c1RlR2IxOWdzT1p0MStsUlAvZ2JaSGx0RUY2?=
 =?utf-8?B?V084cVR0ZDBhdS9SMzBDa2lyaTNPWmtOZ3RIdWorRllaOENxQkoydlVVNVAx?=
 =?utf-8?B?NC81VVZYVUtIYjFybldFeTFNN0VEUXR5cFQvNTZ0b1BCS0MxZFJuTW9BTy9n?=
 =?utf-8?B?RHpiNGJxMjFpOE1QaFo2Mk4wc0VxYkRuak1GVlJEOGQyNklpbWxWUSs0OXlN?=
 =?utf-8?B?Z1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYAPR01MB6201.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7cb51a9-5555-46e8-6f0b-08da6ecd8f3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2022 06:10:37.6512 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5vDcBwj1tBkNjpssYZMQo88FyiXM1sVkF4IO12C8fQHZEncFDlJXqA4mOg8+RbAO0SvyjcN6mgLOFMWJI6SinXSLhmRDcyVTM5hhdStzcjE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3424
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
Cc: linaro-mm-sig@lists.linaro.org, corbet@lwn.net,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 sumit.semwal@linaro.org, hverkuil@xs4all.nl, robh+dt@kernel.org,
 nobuhiro1.iwamatsu@toshiba.co.jp, christian.koenig@amd.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR3JlZw0KDQpUaGFuayB5b3UgZm9yIHlvdXIgY29tbWVudHMuDQoNCj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR3JlZyBLSCA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5v
cmc+DQo+IFNlbnQ6IE1vbmRheSwgSnVseSAyNSwgMjAyMiA5OjUxIFBNDQo+IFRvOiBpc2hpa2F3
YSB5dWppKOefs+W3nSDmgqDlj7gg4peL77yy77yk77yj4pah77yh77yp77y077yj4peL77yl77yh
6ZaLKQ0KPiA8eXVqaTIuaXNoaWthd2FAdG9zaGliYS5jby5qcD4NCj4gQ2M6IFJvYiBIZXJyaW5n
IDxyb2JoK2R0QGtlcm5lbC5vcmc+OyBIYW5zIFZlcmt1aWwgPGh2ZXJrdWlsQHhzNGFsbC5ubD47
DQo+IGl3YW1hdHN1IG5vYnVoaXJvKOWyqeadviDkv6HmtIsg4pah77yz77y377yj4pev77yh77yj
77y0KQ0KPiA8bm9idWhpcm8xLml3YW1hdHN1QHRvc2hpYmEuY28uanA+OyBKb25hdGhhbiBDb3Ji
ZXQgPGNvcmJldEBsd24ubmV0PjsNCj4gU3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13YWxAbGluYXJv
Lm9yZz47IENocmlzdGlhbiBLw7ZuaWcNCj4gPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT47IGxp
bnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsNCj4gbGludXgta2VybmVsQHZnZXIu
a2VybmVsLm9yZzsgbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnOw0KPiBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnOyBsaW5hcm8tbW0tc2lnQGxpc3RzLmxpbmFyby5vcmcNCj4gU3Vi
amVjdDogUmU6IFtQQVRDSCB2MiAzLzVdIHNvYzogdmlzY29udGk6IEFkZCBUb3NoaWJhIFZpc2Nv
bnRpIEROTiBpbWFnZQ0KPiBwcm9jZXNzaW5nIGFjY2VsZXJhdG9yDQo+IA0KPiBPbiBGcmksIEp1
bCAyMiwgMjAyMiBhdCAwNToyODo1NlBNICswOTAwLCBZdWppIElzaGlrYXdhIHdyb3RlOg0KPiA+
IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9kcml2ZXJzL3NvYy92aXNjb250aS91YXBpL2Rubi5o
DQo+ID4gQEAgLTAsMCArMSw3NyBAQA0KPiA+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
R1BMLTIuMCBXSVRIIExpbnV4LXN5c2NhbGwtbm90ZSAqLw0KPiA+ICsvKiBUb3NoaWJhIFZpc2Nv
bnRpIEROTiBBY2NlbGVyYXRvciBTdXBwb3J0DQo+ID4gKyAqDQo+ID4gKyAqIChDKSBDb3B5cmln
aHQgMjAyMiBUT1NISUJBIENPUlBPUkFUSU9ODQo+ID4gKyAqIChDKSBDb3B5cmlnaHQgMjAyMiBU
b3NoaWJhIEVsZWN0cm9uaWMgRGV2aWNlcyAmIFN0b3JhZ2UNCj4gPiArQ29ycG9yYXRpb24gICov
DQo+ID4gKw0KPiA+ICsjaWZuZGVmIF9VQVBJX0xJTlVYX0ROTl9IDQo+ID4gKyNkZWZpbmUgX1VB
UElfTElOVVhfRE5OX0gNCj4gPiArDQo+ID4gKyNpbmNsdWRlIDxsaW51eC9pb2N0bC5oPg0KPiA+
ICsjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4NCj4gPiArI2luY2x1ZGUgImlwYS5oIg0KPiA+ICsN
Cj4gPiArI2RlZmluZSBEUlZfRE5OX0JJVF9DT05GSUdfREVTQ19GSU5BTCAoMHg4MDAwVSkNCj4g
PiArI2RlZmluZSBEUlZfRE5OX0JVRkZFUl9JTkRFWF9NQVggICAgICAoMTUpDQo+ID4gKw0KPiA+
ICsjZGVmaW5lIERSVl9ETk5fQkFTRV9BRERSX05VTSAoOFUpIC8qIEROTiBudW1iZXIgb2YgYmFz
ZQ0KPiBhZGRyZXNzICovDQo+ID4gKw0KPiA+ICsjZGVmaW5lIERSVl9ETk5fQkFTRV9BRERSX1BV
UlBPU0VfSU5QVVQJICAgICgxVSkNCj4gPiArI2RlZmluZSBEUlZfRE5OX0JBU0VfQUREUl9QVVJQ
T1NFX09VVFBVVCAgICAoMlUpDQo+ID4gKyNkZWZpbmUgRFJWX0ROTl9CQVNFX0FERFJfUFVSUE9T
RV9BV0IJICAgICgzVSkNCj4gPiArI2RlZmluZSBEUlZfRE5OX0JBU0VfQUREUl9QVVJQT1NFX1RF
TVBPUkFSWSAoNFUpDQo+ID4gKw0KPiA+ICsvKioNCj4gPiArICogc3RydWN0IGRydl9kbm5fc3Rh
dHVzIC0gRE5OIElQQSBzdGF0dXMgZm9yIElPQ19JUEFfR0VUX1NUQVRVUw0KPiA+ICsgKg0KPiA+
ICsgKiBAc3RhdGU6ICAgICBTdGF0ZSBvZiBkcml2ZXINCj4gPiArICogQGVlcl9jbWQ6ICAgRXhl
Y3V0aW9uIGVycm9yIGNvbW1hbmQNCj4gPiArICogQGVlcjogICAgICAgRXhlY3V0aW9uIGVycm9y
DQo+ID4gKyAqIEByZXNlcnZlZDogIFBhZGRpbmcNCj4gPiArICogQGVlcl9mbGFnczogRXhlY3V0
aW9uIGVycm9yIGZsYWdzDQo+ID4gKyAqLw0KPiA+ICtzdHJ1Y3QgZHJ2X2Rubl9zdGF0dXMgew0K
PiA+ICsJZW51bSBkcnZfaXBhX3N0YXRlIHN0YXRlOw0KPiA+ICsJX191MzIgZWVyX2NtZDsNCj4g
PiArCV9fdTMyIGVlciA6IDE7DQo+ID4gKwlfX3UzMiByZXNlcnZlZCA6IDMxOw0KPiANCj4gYml0
ZmllbGRzIHdpbGwgbm90IHdvcmsgbGlrZSB0aGlzIGZvciB1YXBpIGZpbGVzLCBzb3JyeS4NCg0K
SSdsbCBjaGFuZ2UgdGhlIHR5cGUgb2YgdGhlIG1lbWJlciBlZXIgZnJvbSBiaXRmaWVsZCB0byBi
b29sLg0KDQo+IA0KPiA+ICsJX191MzIgZWVyX2ZsYWdzWzMyXTsNCj4gDQo+IFdoYXQgZW5kaWFu
IGlzIGFsbCBvZiB0aGVzZT8gIEJpZz8gIExpdHRsZT8gIFVua25vd24/DQoNClRoZSBwcm9jZXNz
b3JzIGFuZCBhY2NlbGVyYXRvcnMgYXJlIGxpdHRsZSBlbmRpYW4gaW4gVmlzY29udGkgU29DLg0K
RG8gSSBoYXZlIHRvIHVzZSBtb3JlIHNwZWNpZmljIHR5cGUgc3VjaCBhcyBfX2xlMzIgPw0KDQo+
IA0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArc3RydWN0IGRydl9kbm5fYmFzZV9hZGRyIHsNCj4gPiAr
CV9fdTMyIHB1cnBvc2U7DQo+ID4gKwl1bmlvbiB7DQo+ID4gKwkJc3RydWN0IGRydl9pcGFfYWRk
ciBpcGFfYWRkcjsNCj4gPiArCQl1aW50cHRyX3QgbGlzdF9hZGRyOw0KPiANCj4gWW91IHJlYWxs
eSBkbyBub3QgZXZlciB3YW50IGEgdWludHB0cl90IGluIGEgdWFwaSBmaWxlLCB0aGF0J3Mgbm90
IGdvaW5nIHRvIGJlDQo+IHBvcnRhYmxlIGF0IGFsbC4gIEl0J3MgYWxzbyBub3QgYSB2YWxpZCBr
ZXJuZWwgdHlwZSA6KA0KDQpJIHVuZGVyc3RhbmQuIFRoZSBtZW1iZXIgbGlzdF9hZGRyIHNob3Vs
ZCBiZSB0eXBlZCAic3RydWN0IGRydl9pcGFfYWRkcioiLg0KDQo+IE5vIGRvY3VtZW50YXRpb24g
b24gd2hhdCAicHVycG9zZSIgaXMgZm9yPw0KDQpJJ2xsIGFkZCBkZXNjcmlwdGlvbiBmb3Igc3Ry
dWN0IGRydl9kbm5fYmFzZV9hZGRyIHdpdGgga2VybmVsLWRvYyBzdHlsZS4NCg0KPg0KPiA+ICsJ
fSBhZGRyOw0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArLyoqDQo+ID4gKyAqIHN0cnVjdCBkcnZfZG5u
X2Rlc2NyaXB0b3IgLSBETk4gSVBBIERlc2NyaXB0b3IgZm9yIElPQ19JUEFfU1RBUlQNCj4gPiAr
ICoNCj4gPiArICogQGNvbmZpZ3VyYXRpb246ICAgICAgICBBZGRyZXNzIG9mIGNvbmZpZ3VyYXRp
b24gZGF0YQ0KPiA+ICsgKiBAY29uZmlndXJhdGlvbl9vZmZzZXQ6IENvbmZpZ3VyYXRpb24gb2Zm
c2V0DQo+ID4gKyAqIEBjb25maWd1cmF0aW9uX3NpemU6ICAgQ29uZmlndXJhdGlvbiBkYXRhIHNp
emUNCj4gPiArICogQGxpc3RfbnVtOiAgICAgICAgICAgICBOdW1iZXIgb2YgaW5wdXQvb3V0cHV0
IGxpc3QNCj4gPiArICogQGJhc2VfYWRkcjogICAgICAgICAgICBCYXNlIGFkZHJlc3Nlcw0KPiA+
ICsgKiBAYmFzZV9hZGRyX2ZsYWc6ICAgICAgIEJpdC1maWVsZHMgb2YgYmFzZV9hZGRyIGxpc3Qg
Y29uZmlnOw0KPiA+ICsgKiAgICAgICAgICAgICAgICAgICAgICAgIDAgZm9yIGZpeGVkIGFkZHJl
c3MsDQo+ID4gKyAqICAgICAgICAgICAgICAgICAgICAgICAgMSBmb3IgYWRkcmVzcyBsaXN0Lg0K
PiANCj4gV2hlcmUgYXJlIHRoZSBiaXRmaWVsZCBkZWZpbml0aW9ucz8NCj4gV2hhdCBhYm91dCB1
bnVzZWQgYml0cywgd2hhdCBoYXBwZW5zIHdpdGggdGhlbT8gIFlvdSBhcmUgY2hlY2tpbmcgdGhl
bSwNCj4gcmlnaHQ/DQo+DQoNCkknbGwgdXBkYXRlIGNvbW1lbnRzIGZvciAiYmFzZV9hZGRyIiBh
bmQgImJhc2VfYWRkcl9mbGFnIi4NClRoZSBtZW1iZXIgYmFzZV9hZGRyW25dIGFyZSBoYW5kbGVk
IGRpZmZlcmVudGx5DQphY2NvcmRpbmcgdG8gdGhlIG4ndGggYml0IG9mIHRoZSBtZW1iZXIgYmFz
ZV9hZGRyX2ZsYWc7DQp3aGVyZSAwIDw9IG4gPCBIV0RfRE5OX0JBU0VfQUREUl9OVU0tMS4NCg0K
PiA+ICsgKiBAY29uZmlnX2RvbmU6ICAgICAgICAgIEZsYWdzIG9mIGNhbGxlZCBjb25maWd1cmF0
aW9uDQo+ID4gKyAqIEBidWZmZXJfaW5mbzogICAgICAgICAgVGFibGUgb2YgYnVmZmVyIGluZm9y
bWF0aW9uDQo+ID4gKyAqIEBidWZmZXJfaW5mb19udW06ICAgICAgTnVtYmVyIG9mIGJ1ZmZlcl9p
bmZvDQo+ID4gKyAqLw0KPiA+ICtzdHJ1Y3QgZHJ2X2Rubl9kZXNjcmlwdG9yIHsNCj4gPiArCXN0
cnVjdCBkcnZfaXBhX2FkZHIgY29uZmlndXJhdGlvbjsNCj4gPiArCV9fdTMyIGNvbmZpZ3VyYXRp
b25fb2Zmc2V0Ow0KPiANCj4gV2hhdCBlbmRpYW4gYXJlIGFueSBvZiB0aGVzZT8NCg0KVGhleSBh
cmUgbGl0dGxlIGVuZGlhbiBhcyBwcm9jZXNzb3JzIGFuZCBhY2NlbGVyYXRvcnMgYXJlIExFLg0K
RG8gSSBoYXZlIHRvIHVzZSBzcGVjaWZpYyB0eXBlIHN1Y2ggYXMgX19sZTMyPw0KDQpEbyB3ZSBu
ZWVkIHNwZWNpYWwgY2FyZSBmb3IgZW5kaWFubmVzcwl3aGVuIHVzZXJsYW5kIGFuZCBrZXJuZWwg
YXJlIHNoYXJpbmcgZGF0YSAoYSBkcnZfZG5uX2Rlc2NyaXB0b3IgaW5zdGFuY2UpID8NCkkgdGhv
dWdodCB0aGVyZSdyZSBubyBlbmRpYW5uZXNzIHByb2JsZW0gd2hlbiB0aGUgZHJpdmVyIGlzIHJl
YWRpbmcvd3JpdGluZyBIVydzIDMyYml0IHJlZ2lzdGVycy4NCkkgdW5kZXJzdGFuZCwgZ2VuZXJh
bGx5LCBzcGVjaWFsIGNhcmVzIGFyZSBuZWVkZWQgZm9yIHNvbWUgY2FzZXMgbGlrZToNCiogbmV0
d29yayBieXRlIG9yZGVyIC0tLSBlbmRpYW5uZXNzIGlzIHNwZWNpZmllZCBpbiBhIHNwZWNpZmlj
YXRpb24uDQoqIGRhdGEgYmxvY2tzIGFyZSBzdG9yZWQgdG8gYnl0ZS1hZGRyZXNzYWJsZSBtZW1v
cnkgYW5kIHJlYWQgYnkgYW5vdGhlciBwcm9jZXNzaW5nIGVsZW1lbnRzIChIVyBvciBDUFUgaW4g
YW5vdGhlciBzeXN0ZW0pLg0KKiBIVyBkZXNpZ25lZCBmb3IgbGl0dGxlIGVuZGlhbiBpcyBwbGFj
ZWQgaW4gYmlnIGVuZGlhbiBzeXN0ZW0uDQoNCj4gdGhhbmtzLA0KPiANCj4gZ3JlZyBrLWgNCg0K
UmVnYXJkcywNCiAgWXVqaQ0K

