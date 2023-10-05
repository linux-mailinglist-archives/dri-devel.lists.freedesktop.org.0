Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B017B9B30
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 08:56:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E00DD10E1B3;
	Thu,  5 Oct 2023 06:56:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F4B310E3D7
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Oct 2023 06:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1696488980; x=1728024980;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=4379VObwtIIL4QT0Lxxeyc31PeaNHglUSCTNBsbrjpE=;
 b=sx/N/17rxe1B6Rg5FX6O5VHZUM5wtD3XhULs0covRBmi5URLd1oNnevM
 v7NoaayHbmdQh+LqbIzqnR2bqPppbadPyrsquZXvuvI/SHE0lJAM4iQ4q
 +aMK4QCtyxIdTZqQ37oeLL7AhDol5WufgAMCPC875HIfPpZmyUwDu3yW5
 evHdEuajOq0PzZvBvFAaNVaqFTmeTm72J38FfUktp0sD3hnYysVfHXm5/
 8XlGzrpb43UfwinsgXD+eVGgyyABaKnW5PBMV9DMCG4VXxm/CnHnx1QV8
 5hdyJSUKIN+F3YYcqAQI+K5IKs57c1E8DLxNKTb0ajHhqh6UVSnTBTjke Q==;
X-CSE-ConnectionGUID: 7+CRdmPqTuy2HW4pTs6Kfw==
X-CSE-MsgGUID: 7mytFCt3RvaXFbZHWgRqcQ==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; 
   d="scan'208";a="8159037"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Oct 2023 23:56:19 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 4 Oct 2023 23:55:40 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 4 Oct 2023 23:55:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XRscN4ziSLvEvOcQrw1YxcsksDPtVdIc2kV4doLvU2QfCerwjbWYhlC6/aftyFa+nDhuSTyxLdusmBOKU+YqYIJwH4yf3T+ok4Ro5Z7X4VzrTNSHtZLTDCdWrO7eqOa5/7/2KMx6ykCJytxZk63SV0A0zw8/HA0KD9ZhebDn7DTfMrH07fVvvlIJAnYyN0VzHKBXd2TB13h1jBmxmSKQsFWPdKdCQe17IOuSNV8Cix1gHInQQAbsWjgZ9WLR5UMpK5CQqScrSnw2idvSLzBf29xqArkVL4Kyg4ZvZEHP3nITvzQW2E2rReSGtTIRZCEp9oEIIXx90KCPLQuqyFLIjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4379VObwtIIL4QT0Lxxeyc31PeaNHglUSCTNBsbrjpE=;
 b=Es9UHkK9BvQHjDDkmQjt+S+qmuI1AU1HvCDAHMgVv6+y86g4Ailo1xktSUaXeL2Iduw0LeSbUnRgBhe/3AXe8kx5OVPlYBnnDWxyPsA1Ua4nT1crrPkb/FKJwSmmUw28+OddcjmOq+WhzsszJ0uXOMMQMvIiizH9BxRqnRnsX1LK4e5kHGiQ5GOJBvIsG1q7OLe6rwFVNsxwS+AS6Qo2KNVDugHTR5pEyABKja5LKmFgOjaUk3A87HL3p83Wqel3o1al7LZuaOe86p/Zlwz+k0TIe6anausafO1VpWgBS0Hd6HUoc7DBwKQpLPke+3JsDbtjBe2QSs53bZJl1YSOOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4379VObwtIIL4QT0Lxxeyc31PeaNHglUSCTNBsbrjpE=;
 b=OG8QAgE4VD8yryStNe+4qtLudssRt0vhAEeEBsz8bbiLfQVfUBMEhv1bhpQ8sAi73v0E/sFPrRuckVdcDg6V2AUilkMVPB/6a96q5hZINsfA5osAfLfbca5WuutUefNjPcWM55vfUUZVLe9kTB88YSw2Sx6fflD45uqxDE4ubS4=
Received: from IA1PR11MB6193.namprd11.prod.outlook.com (2603:10b6:208:3eb::19)
 by SN7PR11MB6826.namprd11.prod.outlook.com (2603:10b6:806:2a1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Thu, 5 Oct
 2023 06:55:38 +0000
Received: from IA1PR11MB6193.namprd11.prod.outlook.com
 ([fe80::8bf2:b185:cfb9:de89]) by IA1PR11MB6193.namprd11.prod.outlook.com
 ([fe80::8bf2:b185:cfb9:de89%5]) with mapi id 15.20.6813.017; Thu, 5 Oct 2023
 06:55:37 +0000
From: <Manikandan.M@microchip.com>
To: <claudiu.beznea@tuxon.dev>, <sam@ravnborg.org>, <bbrezillon@kernel.org>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <Nicolas.Ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <lee@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 1/7] drm: atmel-hlcdc: add flag and driver ops to
 differentiate XLCDC and HLCDC IP
Thread-Topic: [PATCH v6 1/7] drm: atmel-hlcdc: add flag and driver ops to
 differentiate XLCDC and HLCDC IP
Thread-Index: AQHZ8SfBdAZUB301qEihS7VC9aVTxbAvwDQAgAe+2ICAAIVlgIACyyCA
Date: Thu, 5 Oct 2023 06:55:37 +0000
Message-ID: <4f12d34b-5351-c561-d9a7-e672682b313b@microchip.com>
References: <20230927094732.490228-1-manikandan.m@microchip.com>
 <20230927094732.490228-2-manikandan.m@microchip.com>
 <35d861b5-eca0-c817-684c-e39a841f17db@tuxon.dev>
 <8b721bd5-187c-6aad-39ee-e9a5ded6cee5@microchip.com>
 <31bce134-7e9a-0293-5d5a-fba657daed07@tuxon.dev>
In-Reply-To: <31bce134-7e9a-0293-5d5a-fba657daed07@tuxon.dev>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6193:EE_|SN7PR11MB6826:EE_
x-ms-office365-filtering-correlation-id: ed8c96f8-a736-444d-a9f0-08dbc57014c2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: G0FhNM9iyiHw5mmNLvLDIrDWN2bucB9OWTdIvd1FCN/ZQL/7JxhA0hwpIvZs7yzo6nO+CVzvkTuoXBkyZHy3A6I3ZDElsUG1iKv2XIiMduEfM5vhqGSAxNJnzZUoaWt56YeVAW7SD6/op+dNIYCKc1seNb6aYJKEod5nF1JSeHDXJv5GkudWAji/NJHn2eM0sgQlqGglZstcEXhJ7BAY6TmV4lctvIi+Q7atyDnabuSzfpSilHF3cXcymTPTuR5HbIOPdgMFwVbFcR2ThIdMC59JgjtJaCu4Kj54PHgE5kemZo4BjtR2JbdLDjcaSCqXuuY8D9NGZ5ktZRBGmNb3BUU7WP09pkZzupeh87D1HTda8ZUUXLYRDLD6a4EYzShKq3gliCygnaqQ5/wU/7Ocqftf89httQKBF+7GhDDtyv0UGTu/Bt6lnxj92BGw2WRfW44nJ5tr/iGhW+YHVnKjGcpEhCiVhKAuraQQkhJoSB3bk8HX5U9QP+IFn3Wkc136JAQ6hZXXNuU4TChDPKZIOFpwB/KJAMuttRjuIh1NmO0GMNY9iqk+42wjKjjURD7o2lqj9uqoixKGArAQMLu/KznVS5yY9RlruLOIokXwTcJSHx3gUZOq/KwQ5/CREE2tHLQ3RwhxKtEPaEAT05d+nTNKCMcGfyDMxXPOBMktQjY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6193.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39850400004)(366004)(136003)(346002)(376002)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(110136005)(107886003)(91956017)(54906003)(66476007)(66446008)(66556008)(66946007)(316002)(64756008)(38100700002)(41300700001)(6512007)(7416002)(2906002)(53546011)(36756003)(38070700005)(83380400001)(6506007)(26005)(5660300002)(4326008)(71200400001)(8936002)(8676002)(122000001)(2616005)(76116006)(31696002)(921005)(6486002)(478600001)(86362001)(31686004)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZnpIbWZ4ekxDRDZzek44WFV2aFo2OVNxaE5sZndxMEtneSsvQmg5QlJGMml4?=
 =?utf-8?B?NHBOREZyK2ROVWdyYU82bkJVb3B6MlBUNTJkeWVpMHhLeUFjL015MXRBNmJ2?=
 =?utf-8?B?bkNobEthckFVUmhsNGU5SWV4WFVvQjlScms5YTAvTUsrdXp4Q05ZY0l5OWFW?=
 =?utf-8?B?RTVDRGRTWndYUWtURXhvUGYyUDV3eVZUUUF4SnhnZUJGZGx6d1lpUXB4ZlRx?=
 =?utf-8?B?WTNuOUhZaGFvaFlFaUlLb2hKb0RrOHNqUkFlQVJWR0t5cHBZME9DenB5anEw?=
 =?utf-8?B?Z25zaGtuWTFLS0lqVFQrVDNTbTM5d0h6L3NGTXFOcXNla09QeklOUEFQTDJR?=
 =?utf-8?B?b1RWUGFJcnRwZnJFbjdnVGJ6Z2NlTWhlWWVrK0hRdnBrYVMzdXhlZFl2bWJv?=
 =?utf-8?B?K0dMSm5jc1kzaE9qUnRaV2xvTG1FM1R5dVlXU1RIdC95WHdveVVvY2tydU80?=
 =?utf-8?B?RGl1RGtoU3NrdlE5Nys2YnY0Q2lCRXUyY256M1Y1Tkk0cmovejBqZFVPNExB?=
 =?utf-8?B?Q2ZGell1UkZNMGxJdTVBMGlLQ2V3OTNDT1ZpZ0FkZG1hMnB4WU5pNW1rUjBC?=
 =?utf-8?B?MDdqTitOdWZPNktiWWtzeWxmTk1hVTRvR1VBenNUSGxuWW9XbGJhREFTTG03?=
 =?utf-8?B?ZmtXRjdpMTNQWWZKRkhMdDUxdEY2QkM1T3lmZUY0YXFCMER5SERLTkpEWTVE?=
 =?utf-8?B?bFREbVBJV3hWU0VxS3FQSXhZOHl3MGRPWUJFeGpIN3hYSHpDSDdUSWZVam53?=
 =?utf-8?B?Si9jSWpIZDRHN1EyWmN6STNLWGduV1I4anJrWkp3MHh1dVo5YklJVlhzK3ow?=
 =?utf-8?B?WjJLbkowa0FHbnhpSnlMUFEvUTlpbVF4THFldHFBOENUL3p3TXZYdzNTTDJl?=
 =?utf-8?B?dGg0cXhBMklUT21odFJtWDRSZDk1bW0zUjY1Q3lOVStHd1hldnBjN1ZtSFFz?=
 =?utf-8?B?d3BOdTlFTEpVRkdzNFBmczU1aTAyaDVwRWcySC9lYkNHYnlFRzBLcFNhTXlo?=
 =?utf-8?B?c1ZoVEZBWWNna3RiS0wrS2h0K1FxWXI0NnR0NkZsNGRpdjc1ajUwYXFaUHdQ?=
 =?utf-8?B?RVlyVkpNRDRZZTQrWlNGc0JNMmlINnhwS1dhTHl0OGZORVVIWHJlM3dRK1h1?=
 =?utf-8?B?eVhQQ2VWVG14b2ZobG1xUitJcDFWU1A0OFNNZjRzYjl6MEtHcEN5UFBaNmp4?=
 =?utf-8?B?L2J4YzNwUWVaMFJmSnE3US9zTm5oM2YrL0RTbUpRTmphenZvRFgvRk5mdHdP?=
 =?utf-8?B?cDIrNmpLWEtWcFhZMmQ1eENYMUxPcTRXY0MxTUV2eXhya0toTU9Jc1JLc2Rm?=
 =?utf-8?B?WG82VXFkd2RBbGNOeGhPV050UXN2Z2xBeXZ4K1NwZ0p6ekx2QVRxTkh6TUFi?=
 =?utf-8?B?LzhZMFFQS0RFd0ZIa0ZNOFh4QUlVTTc1T2Y5VEhDTDVkMmU3TWRBZkM3Qjgv?=
 =?utf-8?B?c1RoMTcrUjd0eDhHU29TelZMUHlVeitNTHpnVnRKZDV0V0hNL0t4SzROaE42?=
 =?utf-8?B?SE1pNGkzaENnYVNBYlJabWhCWkZjN0huV0hOU0pZaWJsYnJDN1JDUjJ2MEFH?=
 =?utf-8?B?NE52UTJvUSt6dzY3OVhnR2NUVWNGWmNVajRiNDY5ZUJDUEdvUzlLNUJvcnpm?=
 =?utf-8?B?cWwvaFRDekFYb1pJWGxlVmxPNk1MOVZLdCs5QUNwNm5aRjhkQzhCVGNSSU5I?=
 =?utf-8?B?M1RiSjdUbzQ0MXl5ellVRlhCbjN4b0pndU11U2didWJ5NFNmZys3cFZuRnJ5?=
 =?utf-8?B?dndlMHY3T2g2UmRhMW5RZEtWbUpOUUhqb3RkcFowc2o4Q043N3dlQ2R0cEpm?=
 =?utf-8?B?MkR3cGpDZlpvSmM2TUZrL0QrZTV5Y2xNYU1wVnc2c0U0QUNURmplZXNSVTBY?=
 =?utf-8?B?SnQyNnEvNnIxNUpSck5IQktPT3dNV2ZvYWtlbkx4eDA1OE5rRXZ1T0xwaGlj?=
 =?utf-8?B?WUJ6SUhFZHl4Nzkwa1p2RzZZekVHNHFUenQ3VjlhdjVtSFdtSC9LVFhkdlN1?=
 =?utf-8?B?akxFdWFrUGMySlNhY0x6dDcwd0V1S29zM29mcFR4NHN1N3U1T3pBTklKQ0hj?=
 =?utf-8?B?RFJ2Sk9KZVNEVW1UaU8zNU00bGhXSmI2MERmWTFuSEUydzlIeEpLeWxpWjZY?=
 =?utf-8?Q?tKkgu6cagd0eVWVRIGMKb+vBP?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5ECD0BB9DDD0404882BDB6D142374614@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6193.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed8c96f8-a736-444d-a9f0-08dbc57014c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2023 06:55:37.7815 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qADIBw7ce+dk5nPEW07lNp6kocIbRAveXtjhJae6N6xvb0BkLH7UJg38B06Fc+8WaxsH3T+S0F/nubZDp0zhEOED9GkZ4XEpBelTxHTqg7Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6826
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
Cc: Balakrishnan.S@microchip.com, Nayabbasha.Sayed@microchip.com,
 Balamanikandan.Gunasundar@microchip.com, Varshini.Rajendran@microchip.com,
 Dharma.B@microchip.com, Durai.ManickamKR@microchip.com,
 Hari.PrasathGE@microchip.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDMvMTAvMjMgNTo0NiBwbSwgY2xhdWRpdSBiZXpuZWEgd3JvdGU6DQo+IEVYVEVSTkFMIEVN
QUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtu
b3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gT24gMDMuMTAuMjAyMyAwNzoxOCwgTWFuaWth
bmRhbi5NQG1pY3JvY2hpcC5jb20gd3JvdGU6DQo+PiBPbiAyOC8wOS8yMyAxMTozMSBhbSwgY2xh
dWRpdSBiZXpuZWEgd3JvdGU6DQo+Pj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5r
cyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZl
DQo+Pj4NCj4+PiBIaSwgTWFuaWthbmRhbiwNCj4+Pg0KPj4+IE9uIDI3LjA5LjIwMjMgMTI6NDcs
IE1hbmlrYW5kYW4gTXVyYWxpZGhhcmFuIHdyb3RlOg0KPj4+PiArdm9pZCBhdG1lbF9obGNkY19w
bGFuZV9zZXR1cF9zY2FsZXIoc3RydWN0IGF0bWVsX2hsY2RjX3BsYW5lICpwbGFuZSwNCj4+Pj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBhdG1lbF9obGNkY19wbGFu
ZV9zdGF0ZSAqc3RhdGUpOw0KPj4+PiArdm9pZCBhdG1lbF94bGNkY19wbGFuZV9zZXR1cF9zY2Fs
ZXIoc3RydWN0IGF0bWVsX2hsY2RjX3BsYW5lICpwbGFuZSwNCj4+Pj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHN0cnVjdCBhdG1lbF9obGNkY19wbGFuZV9zdGF0ZSAqc3RhdGUp
Ow0KPj4+PiArdm9pZCB1cGRhdGVfaGxjZGNfYnVmZmVycyhzdHJ1Y3QgYXRtZWxfaGxjZGNfcGxh
bmUgKnBsYW5lLA0KPj4+PiArICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgYXRtZWxfaGxj
ZGNfcGxhbmVfc3RhdGUgKnN0YXRlLA0KPj4+PiArICAgICAgICAgICAgICAgICAgICAgICB1MzIg
c3IsIGludCBpKTsNCj4+Pj4gK3ZvaWQgdXBkYXRlX3hsY2RjX2J1ZmZlcnMoc3RydWN0IGF0bWVs
X2hsY2RjX3BsYW5lICpwbGFuZSwNCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0
IGF0bWVsX2hsY2RjX3BsYW5lX3N0YXRlICpzdGF0ZSwNCj4+Pj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgdTMyIHNyLCBpbnQgaSk7DQo+Pj4+ICt2b2lkIGhsY2RjX2F0b21pY19kaXNhYmxlKHN0
cnVjdCBhdG1lbF9obGNkY19wbGFuZSAqcGxhbmUpOw0KPj4+PiArdm9pZCB4bGNkY19hdG9taWNf
ZGlzYWJsZShzdHJ1Y3QgYXRtZWxfaGxjZGNfcGxhbmUgKnBsYW5lKTsNCj4+Pj4gK3ZvaWQNCj4+
Pj4gK2F0bWVsX2hsY2RjX3BsYW5lX3VwZGF0ZV9nZW5lcmFsX3NldHRpbmdzKHN0cnVjdCBhdG1l
bF9obGNkY19wbGFuZSAqcGxhbmUsDQo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzdHJ1Y3QgYXRtZWxfaGxjZGNfcGxhbmVfc3RhdGUgKnN0YXRlKTsNCj4+Pj4g
K3ZvaWQNCj4+Pj4gK2F0bWVsX3hsY2RjX3BsYW5lX3VwZGF0ZV9nZW5lcmFsX3NldHRpbmdzKHN0
cnVjdCBhdG1lbF9obGNkY19wbGFuZSAqcGxhbmUsDQo+Pj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgYXRtZWxfaGxjZGNfcGxhbmVfc3RhdGUgKnN0YXRl
KTsNCj4+Pj4gK3ZvaWQgaGxjZGNfYXRvbWljX3VwZGF0ZShzdHJ1Y3QgYXRtZWxfaGxjZGNfcGxh
bmUgKnBsYW5lLA0KPj4+PiArICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBhdG1lbF9obGNk
Y19kYyAqZGMpOw0KPj4+PiArdm9pZCB4bGNkY19hdG9taWNfdXBkYXRlKHN0cnVjdCBhdG1lbF9o
bGNkY19wbGFuZSAqcGxhbmUsDQo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGF0
bWVsX2hsY2RjX2RjICpkYyk7DQo+Pj4+ICt2b2lkIGhsY2RjX2NzY19pbml0KHN0cnVjdCBhdG1l
bF9obGNkY19wbGFuZSAqcGxhbmUsDQo+Pj4+ICsgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVj
dCBhdG1lbF9obGNkY19sYXllcl9kZXNjICpkZXNjKTsNCj4+Pj4gK3ZvaWQgeGxjZGNfY3NjX2lu
aXQoc3RydWN0IGF0bWVsX2hsY2RjX3BsYW5lICpwbGFuZSwNCj4+Pj4gKyAgICAgICAgICAgICAg
ICAgY29uc3Qgc3RydWN0IGF0bWVsX2hsY2RjX2xheWVyX2Rlc2MgKmRlc2MpOw0KPj4+PiArdm9p
ZCBobGNkY19pcnFfZGJnKHN0cnVjdCBhdG1lbF9obGNkY19wbGFuZSAqcGxhbmUsDQo+Pj4+ICsg
ICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGF0bWVsX2hsY2RjX2xheWVyX2Rlc2MgKmRlc2Mp
Ow0KPj4+PiArdm9pZCB4bGNkY19pcnFfZGJnKHN0cnVjdCBhdG1lbF9obGNkY19wbGFuZSAqcGxh
bmUsDQo+Pj4+ICsgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGF0bWVsX2hsY2RjX2xheWVy
X2Rlc2MgKmRlc2MpOw0KPj4+PiArDQo+Pj4NCj4+PiBUaGVzZSBhcmUgc3RpbGwgaGVyZS4uLiBJ
c24ndCB0aGUgc29sdXRpb24gSSBwcm9wb3NlZCB0byB5b3UgaW4gdGhlDQo+Pj4gcHJldmlvdXMg
dmVyc2lvbiBnb29kIGVub3VnaD8NCj4+IEhpIENsYXVkaXUNCj4+DQo+PiBUaGVzZSBjaGFuZ2Vz
IHdlcmUgaW50ZWdyYXRlZCBpbiB0aGUgY3VycmVudCBwYXRjaCBzZXQgYmFzZWQgb24gdGhlDQo+
PiBzb2x1dGlvbiB3aGljaCB5b3UgcHJvcG9zZWQgaW4gdGhlIHByZXZpb3VzIHNlcmllcy4NCj4+
IFRoZSBYTENEQyBhbmQgSExDREMgZnVuY3Rpb25zIGNhbGxzIGFyZSBtb3ZlZCB0byBJUCBzcGVj
aWZpYyBkcml2ZXItPm9wcw0KPj4gYW5kIHRoZWlyIGZ1bmN0aW9uIGRlY2xhcmF0aW9ucyBhcmUg
bWFkZSBoZXJlIGluIGF0bWVsX2hsY2RjX2RjLmgNCj4+IFJlc3Qgb2YgdGhlIGNoYW5nZXMgYXJl
IGludGVncmF0ZWQgaW4gUGF0Y2ggNC83Lg0KPiANCj4gSSBzdGlsbCB0aGluayAoYW5kIEkndmUg
Y2hlY2tlZCBpdCBsYXN0IHRpbWUpIHlvdSBjYW4gcmVtb3ZlIHRoZXNlDQo+IGRlY2xhcmF0aW9u
LiBTZWUgY29tbWVudCBmcm9tIHByZXZpb3VzIHZlcnNpb246DQo+IA0KPiAiWW91IGNhbiBnZXQg
cmlkIG9mIHRoZXNlIGFuZCBrZWVwIHRoZSBmdW5jdGlvbiBkZWZpbml0aW9ucyBzdGF0aWMgdG8N
Cj4gYXRtZWxfaGxjZGNfcGxhbmUuYyBpZiB5b3UgZGVmaW5lIHN0cnVjdCBhdG1lbF9sY2RjX2Rj
X29wcyBvYmplY3RzIGRpcmVjdGx5DQo+IHRvIGF0bWVsX2hsY2RjX3BsYW5lLmMuIEluIGF0bWVs
X2hsY2RjX2RjLmMgeW91IGNhbiBoYXZlIHNvbWV0aGluZyBsaWtlOg0KPiANCj4gZXh0ZXJuIGNv
bnN0IHN0cnVjdCBhdG1lbF9sY2RjX2RjX29wcyAgYXRtZWxfaGxjZGNfb3BzOw0KPiBleHRlcm4g
Y29uc3Qgc3RydWN0IGF0bWVsX2xjZGNfZGNfb3BzICBhdG1lbF94bGNkY19vcHM7DQo+ICINCkhp
IENsYXVkaXUNCg0KVGhhbmsgeW91LiBJIHdpbGwgaW50ZWdyYXRlIHRoZSBjaGFuZ2VzIGluIHRo
ZSBuZXh0IHZlcnNpb24uDQo+IA0KPj4+DQo+Pj4gVGhhbmsgeW91LA0KPj4+IENsYXVkaXUgQmV6
bmVhDQo+Pg0KDQotLSANClRoYW5rcyBhbmQgUmVnYXJkcywNCk1hbmlrYW5kYW4gTS4NCg0K
