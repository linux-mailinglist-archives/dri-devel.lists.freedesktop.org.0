Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB36D599536
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 08:21:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C1DA10E72B;
	Fri, 19 Aug 2022 06:20:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DEU01-BE0-obe.outbound.protection.outlook.com
 (mail-be0deu01on2097.outbound.protection.outlook.com [40.107.127.97])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0968D1412
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 12:04:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fSI1rUnlzRvWqQNt6KNLVS82HtJXL7J0ZI8N16ZqCtvdPkdJxigujGTriJI6Zm8cm4QUwCYJJleLusxzq39+GYwVl++udHVj9fiziBn900Ir6MT/25tdixpljylW+6shcPUBPhY7D330UaERoJ29S1rKS24Tx7l2ewoC8QLJQpAWOjg8oJaGTmMsstA3u6GnEevNMIt2ISvbIry7yTthSozaRBFb0cOwr3gaIUYH00nTx/fyl11sJbvb6wcRNXJnLC+YqB8xfSsBakEXwweega/30fKpkHfNC3w10m9Tpb99jYlwTDIzLeTV8OpR2CaiwntSWptJNgJs/86AFRojSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UVt0mXibzBFqq8FybJ7m5rMuiIBI3vU3lDrXonK6EBw=;
 b=P62c4pTscvNT8KRGa9gn03je2EeaNHcDJyMp9Y3zU8SgstieWEKyhX1EN0AnmSY1nlSnlgAFgNeC0l+VgghaKIp4cg/ojeIwyRaFVCVM/fgwK2iPHHRz2YOQfCV1QBcgg468oU+jHw0WHLOO6lfNnzTu9AB/glMX2QV9GGeP2YqJAC+Deb6HBxxzC6pPnTQS323SltU9cH5LyIaIStbOLiI+3XAbKPk2tGjEsBSWysvIaoaQ+somd8JlILGblE3Zy2IicdW2ohFtj2MG+HHfeEE7s5LTOgDby/B2W01C38QaY+jx69yZxUA7wQpmIdRVoyzWyhpBDsoHzMH0q84N7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductor.onmicrosoft.com;
 s=selector2-rohmsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UVt0mXibzBFqq8FybJ7m5rMuiIBI3vU3lDrXonK6EBw=;
 b=GWx5VcnUfD/qEnrTqiZTUdZbZ6hddOAbdINYa80Gy7kyXvY3ZMp2jru2jc3CX7sMfubVg/Us6IqDbSpaTUlFvIvKQxiIQywv3jyerzNe12/Grjw1j8D0YmCC18p9y7ACum/tdz2LUAEqkMbMrVEQcFqnPexwCjyYEaDiJhfsTWM=
Received: from BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:59::10)
 by BE1P281MB2996.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:68::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.4; Thu, 18 Aug
 2022 12:04:28 +0000
Received: from BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM
 ([fe80::58c1:f1e5:729f:ad7f]) by BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM
 ([fe80::58c1:f1e5:729f:ad7f%6]) with mapi id 15.20.5566.004; Thu, 18 Aug 2022
 12:04:28 +0000
From: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To: Mark Brown <broonie@kernel.org>, Matti Vaittinen <mazziesaccount@gmail.com>
Subject: Re: (subset) [PATCH v2 0/7] Devm helpers for regulator get and enable
Thread-Topic: (subset) [PATCH v2 0/7] Devm helpers for regulator get and enable
Thread-Index: AQHYrjODEkpLnjXMEEiLI50ZP+QfK62wH3oAgARw6ICAAAW5AIAAAtGA
Date: Thu, 18 Aug 2022 12:04:28 +0000
Message-ID: <cf12a982-7694-76b1-7cb1-6b228f0bb0a7@fi.rohmeurope.com>
References: <cover.1660292316.git.mazziesaccount@gmail.com>
 <166057828406.697572.228317501909350108.b4-ty@kernel.org>
 <52d307d7-04f2-89fd-ff4b-9a6c0d247350@gmail.com>
 <Yv4obo9MUw+Lc+nr@sirena.org.uk>
In-Reply-To: <Yv4obo9MUw+Lc+nr@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fi.rohmeurope.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ceca9d43-fa89-4f90-5083-08da8111cd41
x-ms-traffictypediagnostic: BE1P281MB2996:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zA4MVxUNz/6MoqPUYx+327JtwCSSJAh5QNfG4BGqBiF8RT7hyqZ3wBt8ztrYGXA/ihzqHiYJQ8SLmIb48DkMjI/ug5PuQgBFSfXH0zOVpMNX+gu2bmul2pVQ6VwsBXk/kP9R1oHm83URoF28JPai4xOSOGVH5y8bHx+jbXdoYmbngEvJQnueXJk8H5+R1YdAIP2hVHJ2hfa91LKVJHQwNeWH1BDLf0fVdl/2S4QnmGIz5TukjHpAKSdkmm0hrmDSZDjhrgnRR6nSeb2BcgpmJfnIR0aqWDw8VR/Ymk1wAicaDU5G9EGpNC5K7mRlE5spDCG1RAdb/jMS0MZnacHwtZUxHltaQjaYBtbwp8YvsFZs0CgdXgEblEZ+SDysvSDCtJn4WUE4EIg8gFzgBrSXbyJDYv63675EemYBRdxHA6C7YDTUJFp9t9Qg/UzuM9tvi/YZZ9B1z2kAqPHHZiMObOlLmoZLjw1Y2PD1l+bm1BArJAOzFVS3+X5uqwmpZSxSWGrREVWDrX95Rm76G0TSSoK5PELCXScEy+2ALPEY4mEFE+x7Wxjofom8BsTNCuxtBdSx4qSEwmvFWPWhznK0bLdIjF29JqqrNAxaif6SA2rE9dNzeaf9tUOd6EGBvI7Z9ad7zOxj7Xe8wCXiGCmeLaMvBPukC3TQYo2eTKLYA+XlLWfV/0K8yRaJ3y6vpD6aot+vSzHaI9xx3lknaf+Ci4kPQVVM1xkakuU1Xwow9nnaQMmSzHCSOz4CRPjaT4sLRMJLu8h33v9sB+eAlq1h0YpWv6mbDB0hxZWuC1xGxtBBf6mhcX+Kv3zS9zd5PWBjvHN2M38TVfyPUQjSs9tsfQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(136003)(376002)(396003)(366004)(39850400004)(41300700001)(53546011)(4744005)(2906002)(122000001)(6506007)(38070700005)(7416002)(31686004)(110136005)(38100700002)(5660300002)(54906003)(186003)(7406005)(316002)(8936002)(4326008)(26005)(83380400001)(64756008)(91956017)(478600001)(66476007)(6486002)(31696002)(76116006)(66556008)(6512007)(66946007)(71200400001)(86362001)(66446008)(2616005)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aVc5WjEzNDI2S3FlZHVibTdzdDRFay95U2Q3WmdWdGZWL2dLR3FYekpvUU5D?=
 =?utf-8?B?UHBxRXZnc1ppdVJhYU01UzdwdXFXNWdJdlJPR0dNQW5BS2VScE5kSGVDaU5j?=
 =?utf-8?B?SURHOXVHN2hLMHJmRjdyRHZJL1pqa0huTmNhYmdyekZYOUsxSktyNDJ0RlBr?=
 =?utf-8?B?d3A0cEVZSGRnQ01hVUw4bFZPOFJZZ1NQZ1lWVmlzZ0NSQ2NUS3EwaXJmYmVa?=
 =?utf-8?B?aXY0K01hUTBaUk5nMUJwWDBUQ1A5c2diNGJXZ0VlU2IyNU5JTWlwOU1yUmlN?=
 =?utf-8?B?YXdkc3hTdkUxUnFXWUNNN29PRHRpb3hpdndVc29YdjZ4TVpmdGFLNUxuRVQ4?=
 =?utf-8?B?R0toWlpidG54MlhlL25Vc20vSkY1L1RkTGd5VkJsSW5HY3M3MXM1cFdPb0dV?=
 =?utf-8?B?UWFMRG4wb2pFR0IvR3ZiKzJBU1dDWk0zK1o0NGVzSDVEZnVwbVZpZG5XNmpw?=
 =?utf-8?B?Y2Q4d1VvTmhQek5MR1dQeDlJcC9oU3R6MWJOZGkwd1R3Uit5ZW5GUFlaUEhF?=
 =?utf-8?B?elFzZElLeDA5cjY5T0ZIZmFNWTYxd2ZtaWtSYlp5ekg5MkVhc0hPWFN1c3pD?=
 =?utf-8?B?ZHM2akIyRXZ5dWE1KzlVcjV1d1VTbmVlN3lTNGVvbnhFNitEdTFjT1p0Rm8z?=
 =?utf-8?B?a0FiemNrNU45K3U3YXY2UUYyb3RBYVBPVUw2eUlRQnZISXI1YkhqZ3hCb1pw?=
 =?utf-8?B?R1JqQXJRbTBFUE9odWROSitKT2tIRjhreGlPc1prNkVwT291OE5BUWdRdlow?=
 =?utf-8?B?Y1FwSGNLUmprbnByUGFlTzJYMEpzNTBNWTdMRkJmK0xINStyYzZoVDE4Mk4r?=
 =?utf-8?B?a2VPM2F0Nm1qbEtoaEtZbHBWN0RGdys3Q0pma1p1Y3ZrN1NXdFpaR0ZKcU9U?=
 =?utf-8?B?bVZIcmIyTkEyc2oyUDRPQitJdUlLdTNCRlF6RUZtMXFzUDBaK1hkcnIwcXhz?=
 =?utf-8?B?OEpUM2F2M2N6dVVMTVc3TUF0aHpLK2dSSk1MUUZGejRyZkZWVWZjWnBJT3dG?=
 =?utf-8?B?bllQNC8vdmJsY25Tb2lwRWhkKzdCZ3d4RjR6UDNOQXFpWTRKOFNsNGtnbzBp?=
 =?utf-8?B?T1Bjd2lySGVKNVE5Sll5WlhBYmg4Vlh0a1JFRmNTNjJIUDNJcGFCSERjNzJI?=
 =?utf-8?B?Um5zd2EycXd3a0JhT1FIWTdwRnRaRUZhMVdwSUlSV2xBTXpuL090L3J3T0JM?=
 =?utf-8?B?OFVhdWRMU2pkSmowZ1VoeDB0NFFGYkR1dFFNaFI5ZExrVXR1eHJMbEs0MW45?=
 =?utf-8?B?T2lZZGxNMWNWQTNqK2FVb2lLVjlSNXhLemlyY1d1SDBFb0hvRDNXSVVldTJp?=
 =?utf-8?B?bGZ5V3RQckgvUGZ3QnpzQlFLc2lPN2VGSFYwRC9IZGJ1WUdadWdyTnFsQlZt?=
 =?utf-8?B?VXgxNUNGTnhzUnJJWTdCRnNtQm9YdDlCOEJrbUZYVEJCRzAwWFlOZWlkbGJs?=
 =?utf-8?B?SWF5UXU5cEJCUm9zTUVVdUNWZ1lDVFhFVTdFMVRFYStvWXlOYW9UUWtPMkt4?=
 =?utf-8?B?bHBXanduYXk2cVEzazEvSU5MYXZVNE9sdjVpOFpOZ0J1dmxiTWhrWGIzdDhk?=
 =?utf-8?B?NlQwZjVybythK3lKaGNqZVpiZTZwZS82YXNyVVpnczl0YW1WZTBsTUkreDRF?=
 =?utf-8?B?ZmpqVTVyQXhUdjdOamVNNGZTSHA3ZVNWWGNvdFVHUmZRSFU1QXlUYXd0Q1BC?=
 =?utf-8?B?SThlMFhrVTZaUitRZ1VWbk90QllwLytJN2hRSkQ5QXNhbGpDbE9PTkJFN2RX?=
 =?utf-8?B?Qm5vcFNEaXVpYzVuNTRtMThwaE5IN3lmTkZVejFJeUtVdCs2MitoUzZpVExB?=
 =?utf-8?B?ZTZYWkJSQnJVSkp4cTRPdXRQMEtOY25CM2tZMGw4dFYvYWlkTWFZdmMrTmJJ?=
 =?utf-8?B?WVZ6M1JkY2ZCWFBuVGovOFZhTXV2aHV4WDY4YTZBT29FcEhNTENFc2RwdmJp?=
 =?utf-8?B?b0hVZVBydnExTHJEeEkwR0hIVTJ3azJRbEU4d1pYMkZwWjI0bktsQlM5KzZF?=
 =?utf-8?B?N1FWUlU4M1Y1TnZJb0RWNGxnZFcrL0h6bDVtSVNFbUdQVnpUSG16dFkvaUhn?=
 =?utf-8?B?TDhGcW05Qm1VSWE1cUJWTjdGTVplQjR2SnBPd040WXg1bi9lUy8zS3J0a0x5?=
 =?utf-8?B?anVDNXpQSmlMSG8wcGtlcW1pQUpyUFZEOSt6aDhJT3lNeCtvOEFVUTh2bUcz?=
 =?utf-8?B?ZUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B502E9C5BDADAB4B9DE28375B14BE2F7@DEUP281.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ceca9d43-fa89-4f90-5083-08da8111cd41
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2022 12:04:28.4227 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b24d4f96-5b40-44b1-ac2e-2ed7fdbde1c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IE6/IfQGl5FkV/wWycoUa6fRnT8Iz70Pk8kzExG1UqA4dX52g5xYxkVke7JBiQ2z0M6nLU1wt3JRh3esG++yUSk1uBgwueUaLbi0kbIWOrZeSqRXbRZButWE2xRpG4WV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BE1P281MB2996
X-Mailman-Approved-At: Fri, 19 Aug 2022 06:20:23 +0000
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
Cc: Miaoqian Lin <linmq006@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, Michael Turquette <mturquette@baylibre.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Jonathan Corbet <corbet@lwn.net>,
 Kevin Hilman <khilman@baylibre.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 Johan Hovold <johan+linaro@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, Alexandru Ardelean <aardelean@deviqon.com>,
 Alexandru Tachici <alexandru.tachici@analog.com>,
 Jean Delvare <jdelvare@suse.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Aswath Govindraju <a-govindraju@ti.com>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>,
 =?utf-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOC8xOC8yMiAxNDo1NCwgTWFyayBCcm93biB3cm90ZToNCj4gT24gVGh1LCBBdWcgMTgsIDIw
MjIgYXQgMDI6MzM6NTNQTSArMDMwMCwgTWF0dGkgVmFpdHRpbmVuIHdyb3RlOg0KPj4gT24gOC8x
NS8yMiAxODo0NCwgTWFyayBCcm93biB3cm90ZToNCj4gDQo+Pj4gWzIvN10gcmVndWxhdG9yOiBB
ZGQgZGV2bSBoZWxwZXJzIGZvciBnZXQgYW5kIGVuYWJsZQ0KPj4+ICAgICAgICAgKG5vIGNvbW1p
dCBpbmZvKQ0KPiANCj4+IEkgd2FzIHBsYW5uaW5nIHRvIHNlbmQgb3V0IHRoZSB2MyAod2hlcmUg
SUlPIHBhdGNoZXMgYXJlIG5vIGxvbmdlciBzcXVhc2hlZA0KPj4gaW50byBvbmUpLiBJIGRpZG4n
dCBzcG90IHRoZSBhYm92ZSBtZW50aW9uZWQgcGF0Y2ggMi83IGZyb20NCj4+IHJlZ3VsYXRvci9m
b3ItbmV4dC4gSSdkIGp1c3QgbGlrZSB0byBnZXQgY29uZmlybWF0aW9uIHRoZSAyLzcgd2FzIG5v
dCBtZXJnZWQNCj4+IGV2ZW4gdGhvdWdoIGl0J3MgbWVudGlvbmVkIGluIHRoaXMgbWFpbCBiZWZv
cmUgcmUtc3Bpbm5pbmcgdGhlIHNlcmllcyB3aXRoDQo+PiBpdC4NCj4gDQo+IEl0J3Mgbm90IHRo
ZXJlIHlldCAodGhhdCdzIHRoZSAibm8gY29tbWl0IGluZm8iKSwgYnV0IGl0IGlzIHF1ZXVlZCBm
b3INCj4gdG9kYXkuDQoNClVuZGVyc3Rvb2QuIFRoYW5rcyEgSSdsbCByZWJhc2UgdGhlIG5leHQg
dmVyc2lvbiBvbiB0b3Agb2YgdGhlIA0KcmVndWxhdG9yL2Zvci1uZXh0IHdoZW4gaXQncyBvdXQg
dGhlbi4NCg0KLS1NYXR0aQ0K
