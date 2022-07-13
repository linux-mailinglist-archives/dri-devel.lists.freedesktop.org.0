Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3914573789
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 15:36:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 956329AB83;
	Wed, 13 Jul 2022 13:36:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2063.outbound.protection.outlook.com [40.107.212.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 168969AB80
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jul 2022 13:36:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PryakEJ+ARWGa4wgAfh59KL9Rd21+gFh6mNOAYJpWQoXPPJlY1/t7VRq+yGXmrHxkdouDZ1VcFRuKpWvlGaARPObWIz2FmZ1b/UdQZrrDfGa/2IdRT/GaF6B2yUGNGVCw+cMMvORZqCKyYMln2X6LTVZDTD2W3WAI/qv+3blA9uFxhWrPJC+VY4BqEZuo9dEo96N/sPJsgotE7liXKaa57Rv33NQ/SXoNqs6twyX9aj+L+q17GYJz9w4VKFz//393Lna7LTXs5oIKu/vq2rpfgN5Ggt88FLFmYc9qTUm4PRQdO2cAlP1wF5xVXsGwZQb/xO8kV4+iIwWqE07je9l+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7YpLfaZdn6xELbbUU3WEnJ/fG/PRFJ7tuEV+w+bDlkE=;
 b=fqjjjhG0RDSX+qgK5a1Q257oR39szNoi8Z45X2aG7VSW7UKo2M6px+TpRv/fIjdidyDqcM/k/O3+G5Pk1gFe86XLg+1QSj3Eqwl/tJzwBmHhPpkPmSXQHMrFsWJ7NGPDENYs+IoYOwb7UWUiRBM7Rr/xqI/Ll8JkgiJbAYtqPoGdupfmmpaOfT7Bl/JhtE7XATTIVN0YnBwhwgjFbqgnllXVSuIg4G9/V6esbQzM55N6ZQ0fYWNucW2dwlJ1TGmDPMwxA04YbMmECVdOx2fNL0spde38etwckFD1hWuNidfjslgxPMEKJoghTzJBiHTdfA4RS0tt0y2xZB+WEooCkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7YpLfaZdn6xELbbUU3WEnJ/fG/PRFJ7tuEV+w+bDlkE=;
 b=08X9Jad+1ez/gYLjjvV5DCIn58n23E9D9RS3wPxnYS1ZNA/cb5GuMhOBIk6zKFeWEC9OYOLSgaxxH5/Hvi/KbMCeDgGKQHP6TTKATpujYmtbBmIZ7sMtVL7s/0esFQX68ZBitmLLs2IvH0QCsh8VN7GfsRz1K+0Uoa+7a7wlUdM=
Received: from CY4PR05MB3047.namprd05.prod.outlook.com (2603:10b6:903:f4::7)
 by SN6PR05MB4832.namprd05.prod.outlook.com (2603:10b6:805:9c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.11; Wed, 13 Jul
 2022 13:35:57 +0000
Received: from CY4PR05MB3047.namprd05.prod.outlook.com
 ([fe80::14fc:26d8:a523:ce02]) by CY4PR05MB3047.namprd05.prod.outlook.com
 ([fe80::14fc:26d8:a523:ce02%3]) with mapi id 15.20.5438.014; Wed, 13 Jul 2022
 13:35:56 +0000
From: Zack Rusin <zackr@vmware.com>
To: "ppaalanen@gmail.com" <ppaalanen@gmail.com>
Subject: Re: [PATCH v2 5/8] drm/vboxvideo: Use the hotspot properties from
 cursor planes
Thread-Topic: [PATCH v2 5/8] drm/vboxvideo: Use the hotspot properties from
 cursor planes
Thread-Index: AQHYlaAcd8dP2Bwi00as7BiZD+A/Za16XmYAgAFJrYCAAD7EAIAAaN2A
Date: Wed, 13 Jul 2022 13:35:56 +0000
Message-ID: <dec419841e594094949ea86d1fe2c017e1c6555d.camel@vmware.com>
References: <20220712033246.1148476-1-zack@kde.org>
 <20220712033246.1148476-6-zack@kde.org> <20220712105600.4a8592c1@eldfell>
 <50fd57193508f33a1e559ef74599c9e52764850d.camel@vmware.com>
 <20220713102036.13aa93ee@eldfell>
In-Reply-To: <20220713102036.13aa93ee@eldfell>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 86a48d9c-0b8a-4ccb-45a4-08da64d49dc9
x-ms-traffictypediagnostic: SN6PR05MB4832:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gJ4mjK0SFWa+7orBJMkfuVSNrYqEug39BpuwMJNOocNMgFvxch7AcFtneVKbxIBqAYTFhcTWELpFEzpD8jboIn8Wy1UD9OYqUh1tk2MXwTpcPczXGZRxYdhycFeNQKp6j7mkajdKZDAwq8CVdA/K6raZUn/wAa4KtrIE2higTKQq1bHl4OIqOztgnnuxH5+yfyDnfqcCoMtVafGmb8zXwzLhiY2lFisDn+J7MR6plwUDc9/zk/L1c8U6P3GbkgjLWdrsl6zpJ/o0vdkNaiOWbe2fcHKrKJ1W/FiNpuprTPiKIPv1wTPg7t20EA4/2CC98QwrBKuX9jdBN0urJSk5B3QjEyHZwfFSvFaMsYdjYQ+1FwEXvvz6ZKX/Vi7PIXw1dnJa4AJOTdAFgEpdrm5EM5GDZn4zwm1ekh/FeJlYSvLBzfC/b+ugV6ri1sQjaRTWyIDNdUyoFPYjO6n2g/F5KcNmSJE5Zx0jX8ev2ANxdV5eg6L7joJncCtnLgCv7bjNDPMLAKHqCb5olrbO3+Ub5fIgOuD3dNqYz8fVPVkiDFkdTU7X9ZJ2lb9mwPfcLXmIlbLzUz9dEVG+taiJO9fRyKqscAdBvYze8pFE5Q1m1y6+0PlP8LV0bwbANX7O7yBnGS/MGccpDkUYPVbi6KSbzADevhTPzs7B4SlTyU0RNmPRPJ24tg0Ga1rGucvlZqX5H0BpZkwAx3mjhie8nRq7BWOaJyz/9V4c1SD1ExjleGFXSYqOxRJvuOx58UejbewndOsBPoFpBOb27cuFgVp/7X9K7xeT/jFav5HWsKX+xqnjIRk4XWh9Eq9qRBWGXEWhbghunR4s/a3xLsf5aB+2SKYAXV5KgDgUq4BvRe40cZJ2F9DXTwk1llneaz1+R2Fv
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR05MB3047.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(396003)(376002)(136003)(346002)(366004)(36756003)(54906003)(186003)(6506007)(41300700001)(66446008)(2616005)(38070700005)(6916009)(316002)(83380400001)(2906002)(64756008)(478600001)(4326008)(91956017)(66946007)(76116006)(66476007)(8676002)(66556008)(38100700002)(8936002)(19627235002)(71200400001)(5660300002)(6512007)(122000001)(26005)(6486002)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WWEyM3dYV1hxajc2K01UdkVZSzViZ2JaM0lITnlwSkJReXVSbHQzZVlEQnJz?=
 =?utf-8?B?OWk2b0hEK1ZRWVhEYVBmek50blA0Vk9nRkxPRTZ4VmJkWDFBU04wTjY0bTdn?=
 =?utf-8?B?Y3plRFA2U1Nza1JzdVVmZXRzSjZKMzBMUFZHQktnQ2RxSUpjWVBvc0NxQ0tk?=
 =?utf-8?B?UE5GQ3dGbk5XUkJBZzJqbWlqRDhOU3ZWallHVGF0R29tYnRja0lqaVhvMlI0?=
 =?utf-8?B?MVhPazgrQldnTVRtRlhidUlBcFBBWE5zenR6ZWNVekZ3SDd0SjdDMEw1L1I1?=
 =?utf-8?B?akJ5enhBTUFnNHROdUh1UjlsUHlTVkYzRHlJQlN1RFpCRklkam1kRDdwemVi?=
 =?utf-8?B?N203YnhJcHJTWXcyVGIvbWY0K1VMTFZJc0EvQm14MzdSQnY2cnJod3dYVnhu?=
 =?utf-8?B?NHRiS2FWR0NmWW02WnhadkdORHdFcGRTNTBVMkRSSCtjZE9uL0pFNElHdFBp?=
 =?utf-8?B?QTZ6WWJZbHE5Qk5WQ1RRaVl5UlJhV3RNRmhhT1VWdzFYeDdMaDlta0p2T090?=
 =?utf-8?B?MFU3OCt1T1ROSlVhNkNzeGNFSndicjV3aXBCclJQS0dmTTlBeEJ0VExKRTRK?=
 =?utf-8?B?UzdIWTlNSHBsTENCQ2llOTZ4eGlxbGllZkdkVDhUTlU4MCtrNGNxQTVEV1M0?=
 =?utf-8?B?Z0o5ay9sOUVyMXdiRHl4a3gra2FaTnZyZERwWkRqc21yTHBkTW9STUdrSFJv?=
 =?utf-8?B?KzZ5UVd2RXREQ2ZVQ2RmZnY1QnJ3V3Vkd2hjdzNrSVV0d0kveUVoTlJRd1lT?=
 =?utf-8?B?V1lxeUYrK1ZOVXQ4VVFPRTIyNjF1YjFvWnYrVW12SThtM2Npcnpyek9TeEVk?=
 =?utf-8?B?UVhIUkw0bEs0Y01Hb0taSWV6ejl6V29SWS8xU2pRRjN2TDc2QkdvYWN6UEQy?=
 =?utf-8?B?M1FsTGxiZkdDSllnQlcyL1JXbVE5MHU0azlzbzdkQjRhNStXS2lwSUhjVHhM?=
 =?utf-8?B?a0k0RVJ2SnF6K3FKZldFa29iNW1FdWYyS05VQTc2QTR1b2pvZm5XRWg4Q0Vj?=
 =?utf-8?B?bEVKc25RTkRBcnFDUG9CZXdiZTNWWGVlWkFjQXNPMUFEcm9HdXB4S0lGVHY5?=
 =?utf-8?B?OWhjQmx5NHpsaVNZRTcxcWUrekFGeVZBcWlLN3dGVEh5b0FaNVBpRWFxUnJo?=
 =?utf-8?B?dUhrOTFFbitSWTZVS1QwbjNIQjMrQm5wZHIzeWdsRWxRU081RlNldTJTK3N1?=
 =?utf-8?B?RFJBd3ZjSnd6SmlaSDRGOUlpRTd2ZGdaM05FdldCSDBOUzVoWUZYS2RDSXg1?=
 =?utf-8?B?UDR3b29Ic1Q3QURkdWlDRmRkaVJoV1hSNUNpbWl6enNCL01PNDBJaEtGRnNm?=
 =?utf-8?B?aFZzTzRaVmJTMlVKcTZmcHhianZxTFpiUVRFbEZzTHhJc0hJR0tETC9zSDIw?=
 =?utf-8?B?eVQrSnZWeGo4dmNyY3VodXNHQ0U1dU8vMEV0Z3V4S01EVmhreU5GQUhzTXd2?=
 =?utf-8?B?YTQvZEltUkpGTDROQkdiU24wL3c0b2VWdHg4MFBycVFybXVRcDN2LzhPenRj?=
 =?utf-8?B?dHpHNUpIckhpVnlrUkFzZjZBU0J1VWdQQUNEWU5OWFpxMU56dUFwV3dDY29y?=
 =?utf-8?B?bUZSSmtRdkMydXQ1NllyUUR0OGFIVEpWRHBodURYRHQzNTRuRUNkYTh2Rk1y?=
 =?utf-8?B?ZzcrZEpJRVZZNnIzNkF3cURQNXRzM0JDdmpPZnVvL2ptY2VNaEFFN21TSDZk?=
 =?utf-8?B?cFRLdE1DcE13Tmo1b0orZ1FsZDY0UTlNSWtYRkVMb1FUclpISDR2VWRsQlZ4?=
 =?utf-8?B?Q2JvYWZ6Tk5MOXRmZXEzeWl6MXVCNmthOE1uOHBMRXFzUzY0SUhRN2lURWJJ?=
 =?utf-8?B?dkhVcXZpRDZOdmpTNGxrNXFpbFFBblQ5UFVVMVJBS1JqczdzS0FpL2FKZjY1?=
 =?utf-8?B?Um5pdGFkeDUwajAvTUMwNmpreVZvcHFINDNvM1BnRXdZa1U5OEtSTGZhdkJF?=
 =?utf-8?B?Um1ETlE3TXZ2OHp1MUhsMkxXazU0RWpBdUFkUnEwOTF0Nit2b1VybFhZUWN2?=
 =?utf-8?B?TTRld1lOL3JucUlEeTQwNWZwbHJhbE94QmJuQ2lsbGJEcjhLbWtMT201Y1RP?=
 =?utf-8?B?Ym4ySVd2SVdrY3FVVis0YmdFLytwTEhjUjdvcXZNY1lkNEc2Y1hUNjlCTzNz?=
 =?utf-8?Q?Vli9OvPxiRotUPx0DBwjVeXTG?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CD750B7DC7A34242A9C86A02093C563F@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR05MB3047.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86a48d9c-0b8a-4ccb-45a4-08da64d49dc9
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2022 13:35:56.9091 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jy5T3Np0e2lVZiWeWWfw3KK5xDSHuR7C+QGHuGXpjUGI3wbr0cCUTKdw/LsmuTO23LQ3cxoQxSQjhTkya2yImg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR05MB4832
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
Cc: Martin Krastev <krastevm@vmware.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>,
 Maaz Mombasawala <mombasawalam@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIyLTA3LTEzIGF0IDEwOjIwICswMzAwLCBQZWtrYSBQYWFsYW5lbiB3cm90ZToN
Cj4gT24gV2VkLCAxMyBKdWwgMjAyMiAwMzozNTo1NyArMDAwMA0KPiBaYWNrIFJ1c2luIDx6YWNr
ckB2bXdhcmUuY29tPiB3cm90ZToNCj4gDQo+ID4gT24gVHVlLCAyMDIyLTA3LTEyIGF0IDEwOjU2
ICswMzAwLCBQZWtrYSBQYWFsYW5lbiB3cm90ZToNCj4gPiA+IE9uIE1vbiwgMTEgSnVsIDIwMjIg
MjM6MzI6NDMgLTA0MDANCj4gPiA+IFphY2sgUnVzaW4gPHphY2tAa2RlLm9yZz4gd3JvdGU6DQo+
ID4gPiAgIA0KPiA+ID4gPiBGcm9tOiBaYWNrIFJ1c2luIDx6YWNrckB2bXdhcmUuY29tPg0KPiA+
ID4gPiANCj4gPiA+ID4gQXRvbWljIG1vZGVzZXR0aW5nIGdvdCBzdXBwb3J0IGZvciBtb3VzZSBo
b3RzcG90cyB2aWEgdGhlIGhvdHNwb3QNCj4gPiA+ID4gcHJvcGVydGllcy4gUG9ydCB0aGUgbGVn
YWN5IGttcyBob3RzcG90IGhhbmRsaW5nIHRvIHRoZSBuZXcgcHJvcGVydGllcw0KPiA+ID4gPiBv
biBjdXJzb3IgcGxhbmVzLg0KPiA+ID4gPiANCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogWmFjayBS
dXNpbiA8emFja3JAdm13YXJlLmNvbT4NCj4gPiA+ID4gQ2M6IEhhbnMgZGUgR29lZGUgPGhkZWdv
ZWRlQHJlZGhhdC5jb20+DQo+ID4gPiA+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXgu
aWU+DQo+ID4gPiA+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+DQo+ID4gPiA+
IC0tLQ0KPiA+ID4gPiAgZHJpdmVycy9ncHUvZHJtL3Zib3h2aWRlby92Ym94X21vZGUuYyB8IDQg
KystLQ0KPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkNCj4gPiA+ID4gDQo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmJv
eHZpZGVvL3Zib3hfbW9kZS5jIGIvZHJpdmVycy9ncHUvZHJtL3Zib3h2aWRlby92Ym94X21vZGUu
Yw0KPiA+ID4gPiBpbmRleCBmYTBkNzNjZTA3YmMuLmNhMzEzNGFkYjEwNCAxMDA2NDQNCj4gPiA+
ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Zib3h2aWRlby92Ym94X21vZGUuYw0KPiA+ID4gPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vdmJveHZpZGVvL3Zib3hfbW9kZS5jDQo+ID4gPiA+IEBAIC00
MjksOCArNDI5LDggQEAgc3RhdGljIHZvaWQgdmJveF9jdXJzb3JfYXRvbWljX3VwZGF0ZShzdHJ1
Y3QgZHJtX3BsYW5lICpwbGFuZSwNCj4gPiA+ID4gIAlmbGFncyA9IFZCT1hfTU9VU0VfUE9JTlRF
Ul9WSVNJQkxFIHwgVkJPWF9NT1VTRV9QT0lOVEVSX1NIQVBFIHwNCj4gPiA+ID4gIAkJVkJPWF9N
T1VTRV9QT0lOVEVSX0FMUEhBOw0KPiA+ID4gPiAgCWhnc21pX3VwZGF0ZV9wb2ludGVyX3NoYXBl
KHZib3gtPmd1ZXN0X3Bvb2wsIGZsYWdzLA0KPiA+ID4gPiAtCQkJCSAgIG1pbl90KHUzMiwgbWF4
KGZiLT5ob3RfeCwgMCksIHdpZHRoKSwNCj4gPiA+ID4gLQkJCQkgICBtaW5fdCh1MzIsIG1heChm
Yi0+aG90X3ksIDApLCBoZWlnaHQpLA0KPiA+ID4gPiArCQkJCSAgIG1pbl90KHUzMiwgbWF4KG5l
d19zdGF0ZS0+aG90c3BvdF94LCAwKSwgd2lkdGgpLA0KPiA+ID4gPiArCQkJCSAgIG1pbl90KHUz
MiwgbWF4KG5ld19zdGF0ZS0+aG90c3BvdF95LCAwKSwgaGVpZ2h0KSwNCj4gPiA+ID4gIAkJCQkg
ICB3aWR0aCwgaGVpZ2h0LCB2Ym94LT5jdXJzb3JfZGF0YSwgZGF0YV9zaXplKTsNCj4gPiA+ID4g
IA0KPiA+ID4gPiAgCW11dGV4X3VubG9jaygmdmJveC0+aHdfbXV0ZXgpOyAgDQo+ID4gPiANCj4g
PiA+IEhpLA0KPiA+ID4gDQo+ID4gPiB0aGlzIGxvb2tzIGxpa2Ugc2lsZW50IGNsYW1waW5nIG9m
IHRoZSBob3RzcG90IGNvb3JkaW5hdGVzLg0KPiA+ID4gDQo+ID4gPiBTaG91bGQgdGhlIERSTSBj
b3JlIHBlcmhhcHMgYWxyZWFkeSBlbnN1cmUgdGhhdCB0aGUgaG90c3BvdCBtdXN0IHJlc2lkZQ0K
PiA+ID4gaW5zaWRlIHRoZSBwbGFuZSAoZmIpIGJvdW5kYXJpZXMgYW5kIHJlamVjdCB0aGUgYXRv
bWljIChURVNUX09OTFkpDQo+ID4gPiBjb21taXQgd2hlbiBpdCdzIG91dHNpZGU/DQo+ID4gPiAN
Cj4gPiA+IE9yIGlmIHRoaXMgcmVzdHJpY3Rpb24gaXMgbm90IHVuaXZlcnNhbCwgbWF5YmUgdGhp
cyBkcml2ZXIgc2hvdWxkDQo+ID4gPiByZWplY3QgaW52YWxpZCBob3RzcG90cyByYXRoZXIgdGhh
biBzaWxlbnRseSBtYW5nbGUgdGhlbT8gIA0KPiA+IA0KPiA+IFRCSCwgSSdtIG5vdCByZWFsbHkg
c3VyZSB3aHkgdmJveHZpZGVvIGlzIGNsYW1waW5nIHRob3NlIHZhbHVlcy4gSSBkaWRuJ3Qgd2Fu
dCB0bw0KPiA+IGludHJvZHVjZSBhbnkgcmVncmVzc2lvbnMgYnkgY2hhbmdpbmcgaXQgaGVyZSwg
YnV0IHRoZSBob3RzcG90IGNvZGUgbmV2ZXIgc3BlY2lmaWVkDQo+ID4gdGhhdCB0aGUgaG90c3Bv
dCBvZmZzZXRzIGhhdmUgdG8gYmUgcG9zaXRpdmUgb3IgZXZlbiB3aXRoaW4gdGhlIHBsYW5lLiBJ
biBhIHF1aWNrDQo+ID4gc2VhcmNoIEkgY291bGRuJ3QgZmluZCByZWFsIHdvcmxkIGN1cnNvcnMg
dGhhdCB3ZXJlIGRvaW5nIGFueXRoaW5nIGxpa2UgdGhhdCB0aG91Z2gNCj4gPiBzbyBJIGp1c3Qg
bGVmdCBpdC4NCj4gPiANCj4gPiA+IEFsc28sIGlmIHN1cHBvcnRzX3ZpcnR1YWxfY3Vyc29yX3Bs
YW5lIGlzIGZhbHNlLCBzaG91bGQgdGhlcmUgbm90IGJlDQo+ID4gPiBzb21ld2hlcmUgY29kZSB0
aGF0IHdpbGwgaWdub3JlIHRoZSB2YWx1ZXMgc2V0IHRvIHRoZSBhdG9taWMgaG90c3BvdA0KPiA+
ID4gcHJvcGVydGllcz8gIA0KPiA+IA0KPiA+IEhtbSwgZ29vZCBxdWVzdGlvbi4gSSdtIG5vdCBz
dXJlIGlmIHRoZXJlJ3MgYSBjYXNlIHdoZXJlIHRoYXQgY291bGQgYmUgcG9zc2libGU6DQo+ID4g
d2l0aG91dCBzdXBwb3J0c192aXJ0dWFsX2N1cnNvciB3ZSBlaXRoZXIgd29uJ3QgaGF2ZSBhIGN1
cnNvciBwbGFuZSBvciB0aGUgY2xpZW50DQo+ID4gd29uJ3QgYmUgYXRvbWljIGFuZCB3aWxsIG9u
bHkgYmUgYWxsb3dlZCB0byB1c2UgdGhlIG9sZCBsZWdhY3kga21zIGlvY3RsJ3MsIGkuZS4NCj4g
PiBkcm1Nb2RlU2V0Q3Vyc29yMi4NCj4gPiANCj4gPiA+IFdoZW4gb25lIEtNUyBjbGllbnQgc3dp
dGNoZXMgdG8gYW5vdGhlciwgdGhlIGZpcnN0IG9uZSBiZWluZyBob3RzcG90DQo+ID4gPiBhd2Fy
ZSBhbmQgdGhlIGxhdHRlciBub3QsIGFuZCBib3RoIGF0b21pYywgdGhlbiB0aGUgbGF0dGVyIEtN
UyBjbGllbnQNCj4gPiA+IHdobyBkb2Vzbid0IGtub3cgdG8gZHJpdmUgdGhlIGhvdHNwb3Qgd2ls
bCBpbmhlcml0IHBvdGVudGlhbGx5IGludmFsaWQNCj4gPiA+IGhvdHNwb3QgZnJvbSB0aGUgcHJl
dmlvdXMgS01TIGNsaWVudC4gRG9lcyBzb21ldGhpbmcgcHJldmVudCB0aGF0IGZyb20NCj4gPiA+
IGJlaW5nIGEgcHJvYmxlbT8gIA0KPiA+IA0KPiA+IFRoYXQgc3dpdGNoIHdpbGwgcmVzdWx0IGlu
IHBsYW5lIHN0YXRlIHJlc2V0LCBlbmRpbmcgaW4NCj4gPiBfX2RybV9hdG9taWNfaGVscGVyX3Bs
YW5lX3N0YXRlX3Jlc2V0IHdoaWNoIHdpbGwgcmVzZXQgYm90aCBob3RzcG90IHByb3BlcnRpZXMg
KHNldA0KPiA+IHRoZW0gdG8gMCkuDQo+IA0KPiBJdCB3aWxsPw0KPiANCj4gVG8gbXkga25vd2xl
ZGdlLCBLTVMgaGFzIG5ldmVyIHJlc2V0IGFueXRoaW5nIHdoZW4gb25lIEtNUyBjbGllbnQNCj4g
c3dpdGNoZXMgdG8gdGhlIG5leHQsIHNvIHRoYXQncyBuZXcuDQo+IA0KPiBXaGF0IHRyaWdnZXJz
IGl0Pw0KPiANCj4gT25seSBpZiB5b3UgYWN0dWFsbHkgc3dpdGNoIHRvIGZiZGV2L2ZiY29uIGlu
c3RlYWQgb2YgYW5vdGhlciB1c2Vyc3BhY2UNCj4gS01TIGNsaWVudCwgdGhlIGZiZGV2IGNvZGUg
bWlnaHQgcmVzZXQgc29tZSB0aGluZ3MsIGJ1dCBub3QgYWxsLg0KPiANCj4gPiA+IFRoZSBvbGQg
S01TIGNsaWVudCBtYXkgaGF2ZSBsZWZ0IHRoZSB2aXJ0dWFsIGN1cnNvciBwbGFuZSB2aXNpYmxl
LCBhbmQNCj4gPiA+IHRoZSBuZXcgS01TIGNsaWVudCBkb2Vzbid0IGV2ZW4ga25vdyB0aGUgdmly
dHVhbCBjdXJzb3IgcGxhbmUgZXhpc3RzDQo+ID4gPiBiZWNhdXNlIGl0IGRvZXNuJ3Qgc2V0IHRo
ZSBEUk0gY2xpZW50IGNhcC4gU29tZXRoaW5nIHNob3VsZCBwcm9iYWJseQ0KPiA+ID4gZW5zdXJl
IHRoZSB2aXJ0dWFsIGN1cnNvciBwbGFuZSBnZXRzIGRpc2FibGVkLCByaWdodD8gIA0KPiA+IA0K
PiA+IEhhaCwgdGhhdCdzIGFsc28gYSBnb29kIHF1ZXN0aW9uLiBJICp0aGluayogdGhlIHNhbWUg
Y29kZSB0byBhYm92ZSB3b3VsZCBiZSByYW4sDQo+ID4gaS5lLiBwbGFuZSByZXNldCB3aGljaCBz
aG91bGQgcmVzdWx0IGluIHRoZSBwbGFuZSBkaXNhcHBlYXJpbmcgYW5kIHRoZSBuZXcgY2xpZW50
DQo+ID4gbm90IGJlaW5nIGFibGUgdG8gZHJpdmUgaXQgYW55bW9yZS4gQXQgbGVhc3Qgd2hlbiBy
dW5uaW5nIGdub21lLXNoZWxsLCBzd2l0Y2hpbmcgdG8NCj4gPiB3ZXN0b24gYW5kIHRoZW4gc3dp
dGNoaW5nIHRvIGdub21lLXNoZWxsIHRoaW5ncyBsb29rIG9rLCBidXQgSSBoYXZlbid0IHRyaWVk
IHJ1bm5pbmcNCj4gPiBzdWNoIGNsaWVudHMgYXQgdGhlIHNhbWUgdGltZS4NCj4gDQo+IFRoYXQn
cyBhbiBpbnRlcmVzdGluZyBleHBlcmltZW50LCBidXQgaG93IGlzICJhdCB0aGUgc2FtZSB0aW1l
Ig0KPiBkaWZmZXJlbnQgZnJvbSB3aGF0IHlvdSB0ZXN0ZWQ/DQo+IA0KPiBBcyBpIG1lbnRpb25l
ZCBhYm92ZSwgaWYgeW91IHN3aXRjaCB0byBmYmNvbiBpbiBiZXR3ZWVuLCB0aGVuIHlvdSBhcmUN
Cj4gbm90IHN3aXRjaGluZyBmcm9tIG9uZSB1c2Vyc3BhY2UgS01TIGNsaWVudCB0byB0aGUgbmV4
dC4NCg0KRldJVywgcnVubmluZyB3ZXN0b24gaW5zaWRlIGdub21lLXNoZWxsIGFzIGEgd2luZG93
IGFsc28gd29ya3MgZmluZS4gQW5kIHJ1bm5pbmcgDQp3ZXN0b24tc2ltcGxlLWRhbWFnZSAtLXdp
ZHRoPTYwIC0taGVpZ2h0PTYwIHdoaWNoLCBjdXJyZW50bHkgd291bGQgbWFrZSB0aGF0IGNsaWVu
dA0KcG9wIHVwIGluIHRoZSBjdXJzb3IgcGxhbmUsIHdoaWxlIHJ1bm5pbmcgd2VzdG9uIGluIGEg
d2luZG93IGluc2lkZSBnbm9tZS1zaGVsbCBhbHNvDQp3b3Jrcy4gSSdtIG5vdCBzdXJlIHdoYXQg
YXJlIHRoZSBwYXRocyBjbGllbnRzIGFyZSB0YWtpbmcgaW4gdGhvc2UgY2FzZXMgc28gSSBkb24n
dA0Kd2FudCB0byBzcGVjdWxhdGUgYnV0IEknZCBiZSBoYXBweSB0byB0cnkgYW55IG90aGVyIGV4
cGVyaW1lbnRzIG9yIGNhc2VzIHlvdSB0aGluaw0KbWlnaHQgYnJlYWsuDQoNCnogDQo=
