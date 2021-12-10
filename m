Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3ACA46FC71
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 09:12:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC7A310E2D4;
	Fri, 10 Dec 2021 08:12:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37E6D10E234;
 Fri, 10 Dec 2021 08:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639123944; x=1670659944;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=N3LH41EaSqQxgUmmUoCrHmsACRu/I9vRjcOi8LW0tfg=;
 b=FRPYDLWIHIvxEDMRA6Ds+e73QqLXHX7XyUcfpm3b+whWysmaRmBrw9Eq
 rGV/hQTBUE/sziXcX82XGAlZP2wUES+HH5eoZgGD480OHNEXimFTg93XZ
 wh6u54KECZeYM5oFHEjKl7UdX53M/6w0c34911Kcdfi4TCq8bzpjw0r86
 JzrO9S2JvPZlG0n6fJBkCVYv7SUZCPSSXFSjwFTwT3WbEBsSjT4SvFrBl
 qS5wGMiSqwY88OcB3gT1IVLxwTolsWoiynhXVXU7VcZUGoBb+m0/hQ9sP
 1+n+w4enazrMCYGccyQCbj6fw3XRqN6pyL8xtSro/DfztK3dShx00EG3Z Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10193"; a="225574116"
X-IronPort-AV: E=Sophos;i="5.88,194,1635231600"; d="scan'208";a="225574116"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 00:12:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,194,1635231600"; d="scan'208";a="612852321"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP; 10 Dec 2021 00:12:21 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 10 Dec 2021 00:12:21 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Fri, 10 Dec 2021 00:12:21 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 10 Dec 2021 00:12:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JbaYItDh/gq0yUouHfQ+GXJB9aJlOmASSbden/iM/TXBA8qKwETfBzpPTTOFdfsGz+aFFr7l9H/ezjSQ8IZXYkXJ33jT6wvxpVC+4I+YvlqDMSrGQWR82j3zRG9F1XNCF6p6XuTZuV3UjuwJGXqr50E52/42nZFV3OTZIGLLSjL9A+phqmfuD9/zERl6p/nGvYXV/QEZHlZnvQK20f6+nNf51Jzfwv99FLDLranax48C6zca+pCZGx+VwALbfbMxJGsRJm+AoDioV89n+YE+rGcEXMBSVA5hzcXZQjboA3BHWcHTIL1OlLcda7kAKavyIfIZrXYNS2WEzJB+7z9biQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N3LH41EaSqQxgUmmUoCrHmsACRu/I9vRjcOi8LW0tfg=;
 b=bozHWs+4oXHIC+D8HZvZOS9V0kCn+pyaT/LSFj5RpA/lL3aI0ysIKBF09Ca2yIf6ENh7GScuXEkrXdCqdFlDLo4NTdJwx6/g+UfloO6IbZSdrsJPTC7wQLqwv/QbjBfNvm56wTL5aM/dlbfYgx7S5wJv+oOT9zWT1IVBLJmWmIv+YynsK9dzw6nEhqOP++vwzCjwNcrqhBF4sQiCLwDg6RpZNYfLWjzojrMEz0/eYPikiC2kYE1bIN6lvWxhNs/QOiEXmoGD1oyu9lUuykT4QEpyjYfI/Omg0/oSVUhTLkFtUAMILill7gAFPIj4XTGQjVjG1ucfQpONgtIlE7QCng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N3LH41EaSqQxgUmmUoCrHmsACRu/I9vRjcOi8LW0tfg=;
 b=tJxhfU9Vh+CRxOcLX0KSbuuh12JQiDfVknhEaBKR9Yu+NBVHeMHCs/CF24/b+Ep/wNDulFTLyk2W3p1/6lbdK9IjNfA0B+WMpl12upnU79opa3oeKbj3tpXFWiPsIKM0YzRVMZY6cJwZafzbTF/pnRVQokyWJIVABeSrm2LDCo0=
Received: from BN9PR11MB5545.namprd11.prod.outlook.com (2603:10b6:408:102::19)
 by BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.15; Fri, 10 Dec
 2021 08:12:19 +0000
Received: from BN9PR11MB5545.namprd11.prod.outlook.com
 ([fe80::6533:7d95:6f60:aafd]) by BN9PR11MB5545.namprd11.prod.outlook.com
 ([fe80::6533:7d95:6f60:aafd%9]) with mapi id 15.20.4778.015; Fri, 10 Dec 2021
 08:12:19 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Rikard Falkeborn <rikard.falkeborn@gmail.com>, Zhenyu Wang
 <zhenyuw@linux.intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 5/9] drm/i915/gvt: Constify gvt_mmio_block
Thread-Topic: [PATCH 5/9] drm/i915/gvt: Constify gvt_mmio_block
Thread-Index: AQHX6P2DWv1QMW3pb0ioQNI49MRRCqwraVKA
Date: Fri, 10 Dec 2021 08:12:19 +0000
Message-ID: <c5f2fa2c-f24a-51ab-e0d2-4e48c86e3bdd@intel.com>
References: <20211204105527.15741-1-rikard.falkeborn@gmail.com>
 <20211204105527.15741-6-rikard.falkeborn@gmail.com>
In-Reply-To: <20211204105527.15741-6-rikard.falkeborn@gmail.com>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c882fe05-a89a-4aa5-23e5-08d9bbb4c957
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BN9PR11MB5276F5ED4AB6C0FF6E072F6ECA719@BN9PR11MB5276.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wk5JgFS7asfLPhTZcGxcbxVmdbHl8ymo4NB94yZR6hiCdNxupOx8yv7yoNuLKkn5MKqDgiRlwg0VAP8TRdojmppnziFPG+UYGK17mwc7hBh4UXZGgJABzHOlszDlVvVKvuNxSYe3CQitHhKsd9GcCR+UNRbtyUuQU1eM5GN02T8yNygpdpUIG7t8nfJvRvAw9I/BiYnGe6JHRFTlsOuAlcOyKqf3IVjE0LEhwoSD/kKyR4TUkGRHKsjk5Wc5KePPhTNJT7VQQvPirJT68k+O7E6Xh5vQKtfzmbXnP9DJVrvARMS1QIfFZ+BlMRfD702lvuzvcBtdFf2S8EAWS0ZWMp/lHtRkGj/9Jyyc8IEz3nZyNCjdf6Y0T3WvXEDIX0u1whD00qUXlcxjQru4hQd/6pN1isj2kJIDjtnAE4kTPg5e63VHfZh95XSEKkMs8he2Kz6cFHejo+qLlnGa0EUrwSzEQJHZdbb4/LvFsQ3LfdSJNgsIFBRQtkpTHWvbeJuRnTxlQoKdYoNqxlX2IhN6JN70fKGrOGJFvRy4cQjS7sFT3JhdDhgokavQokOLsYrYgvGAxbAzRHSFoBjgaWrVmi+ND3hIs7Nao5KLazIRIiAmoknf/31s35GxE8neEn1YwmBg5vDyJmF2/cwqcDWUyBXNPBG6U5BftRrtcggjJL+39F+e0oQy/t+OtrjjOLBTGpUaeQGLlrLumjLF0ePX4H0awABXQpsptLZ8n77vpkpnLjUSoGphcoBRX/sDecEkoqxwhwGGvvDxJ+fI5cEUAA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5545.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66446008)(66946007)(2616005)(31686004)(36756003)(66556008)(64756008)(91956017)(76116006)(66476007)(6512007)(31696002)(83380400001)(7416002)(5660300002)(508600001)(8676002)(8936002)(53546011)(71200400001)(6506007)(38100700002)(186003)(6486002)(38070700005)(4326008)(26005)(122000001)(110136005)(86362001)(82960400001)(316002)(2906002)(54906003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dHBIOU5PQ3NPbCs2Y25aT3dFS281ZVM5djdJZENOTEo1Y2YwbDF6Ky9JbjlN?=
 =?utf-8?B?ZXpsaDN1RWFkeFVYY3JQdSt1RTRtaFJORFhva1BGNlkvcURSQkN4UUFaM2lt?=
 =?utf-8?B?VW80SEg5V0tyamFuU3R3VjJVd2hPSEE2VXhGTFgwMjZiUVA5V3BhS0dTZTlX?=
 =?utf-8?B?eVpmUjMwV1p5RjJZMmd6UFlpT3VFWW8rbVVWQ2VLZEhtRlhxK2VTMnlpcHhn?=
 =?utf-8?B?ck93RHZ3UlQyWHFCc0ZiYkIycHNxempNelNaaHlxS2JqSEd0R0N2Q0RIUGVO?=
 =?utf-8?B?MkhqeEVpUnFrd0ozSThJOS9jQ3hPa0prMFZpRE5GSzB6NGhLNzFGRjhEaExw?=
 =?utf-8?B?VUlkN2JmRkIxbGtrZzNXMDlQaXpndkh0VUFKR1JPQlVidVpHRjVLR2FoZWh4?=
 =?utf-8?B?MXl1OGFMaFVlSUhMNmxob3pkQTkrZjl1Tk5nSXM1d2ZZOHAvSXl5dEZlVkxw?=
 =?utf-8?B?TmhOaHlnZjVpVFVwbkdjMENpM0FRTjQ0cTlBTFdZQXhwc2VUNW5FWmwybGRs?=
 =?utf-8?B?SkZPSWtqWmNDS1BJU0JFa3V4M0dTWlh0VEg2VG9ZM0lpeHk5RW96clZMVjcr?=
 =?utf-8?B?VWQyYUM2bmFWdHN3UUluNkY5NWZYd2xlOU1JZTVLSXA2N1o0U1NXdGpXUGVL?=
 =?utf-8?B?Q3d0dkVsWVhHdGRwcXRWTnNCY3dTc3FTYUgwb1RUTHFqNXlaOWhNVUUyS1Rq?=
 =?utf-8?B?VXJqTmNGdUcvYWFBK3lKdVFMdmZoLy9QTVd0eEhaTEFwT3lZdkV0QjkzMWJR?=
 =?utf-8?B?Z3NGMkF5ZVpucStCaDYzNmVZYnV0RHRYSS91UkFSWEpXdkZrMGE4RUhTdmlR?=
 =?utf-8?B?M01ydWU0MkJWb0Mva252K0tLTVRrTnJNNWVKNkpMNmpqMWhIcmUvRHBieTl5?=
 =?utf-8?B?Q2VZa2pWTXIvQmpqVlpBM1plNWw5VnNNbWs1NTJpY1JDUUlxbk1vZ3JOV2VL?=
 =?utf-8?B?ZzBFdDR2b296SWtDcmxUM005djdiQ0QxV0FCS3piN25JcHo5eGxsZE9hZlZT?=
 =?utf-8?B?RjBaOXFBazVlMURzMmFObllNM1RaQWV3cU9UTVNkZlplZjFpUUJsMjAvVUkz?=
 =?utf-8?B?bVA2MTc4eGpyNWJUV3Exc05VNXUydXkzQ0hxbzhVY1FGd0YzU3hkbWt2ekpX?=
 =?utf-8?B?TWRmT0xVUnBObVlWZVQ3QWpwbFBONVdlUkNMVTBNdnRWWmNPdXBJZEcwQ21r?=
 =?utf-8?B?NGhTRTZpWi84UnY4K1dTSTV3RXVVYzZ1Q095Yk00QlVPbzdacDdYbGFETTYv?=
 =?utf-8?B?clhuYlcyeVZWcXU1R0tySWQ1bmh3VU9sNmM2UzE3OVExQU5VeXlIbUI2WmU2?=
 =?utf-8?B?US9SRVJpbzdKeW1ndG5jeFA4YWNQU1V1Y2hCZ0hlczgvejBiVFJadDBOSExq?=
 =?utf-8?B?STI5SDhIdUtBbTBQbXlhV2FzU3oxaUlHZStMcUxLM0k4RzhxQ1NVNUp0d3Fz?=
 =?utf-8?B?dzFJVTZ6Q09Qa0JpTzQ2cSthd2luUXVoWHZ0czVtT3BlTHRxMVNVWVBrS0FK?=
 =?utf-8?B?U1BPdElxVFVURjFSaHVzcnl2YVZSSFJRREd0OWVBNEpNaFBJRnZBbnk3Ym9t?=
 =?utf-8?B?SHI1SXdNYmxhR0FIeFU0Yll0cEFoMlRzaXdVRDBNV3IzNjdYOU50WWRrelZF?=
 =?utf-8?B?dDJJK2dLZmNQS1JtVmFaaVowelYvYjNxZHVBK3dqMElQQ0RDbUJCRHE2dkZj?=
 =?utf-8?B?eXRMNFpBSEVtSXNiRkhUbldHOWdsU2ttMmx5bFgyMXlvQWMrbGd0cU5TcXpl?=
 =?utf-8?B?bFNOanJYeUo2aXEyb0Q0V0FvWGRNY3d3alNSV3lzN1k1Rms4a0ZJNXVkYkxR?=
 =?utf-8?B?Yk5HNFVNOXJHRFpzN0NYcUtVTzNqRnVia1BCWHdKNGF1Y1YvS1l5K1hXcmVU?=
 =?utf-8?B?cS9tcDYzdW1CMVM4ejFLNGViZ0VoR1pFQmYzZFFhbnJnUktVd0FVd2hiVFFv?=
 =?utf-8?B?VTNNWVg1b2laVnFEVG55Q0U0Q0p0b3VsbEN6YVZyMDZmVXFVcGJlOVg1WU9m?=
 =?utf-8?B?WTlxemRtVm9TbGZlckloNWlTdm9aZmZWT2pWOWJWcGJhbFBwempaM2Q4c2Fn?=
 =?utf-8?B?aS8wUHRJKzNIQ2RlcEtzWms5OFdDT0o1WFVtcTcxb1ZmSW5mYnJ5K0hXeGRo?=
 =?utf-8?B?UjNiZmpZMWtuT0h5cVFNUHNsajN3RzJnVGViZ2pTeWZzM0JRdlFYL21rdml0?=
 =?utf-8?B?a1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <123D2C2E4CB3C24B9B3399D3261455FE@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5545.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c882fe05-a89a-4aa5-23e5-08d9bbb4c957
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2021 08:12:19.5268 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nWCw0uAVMevpyKjwU2hZGMCHqoxcUUJ5S+hXp84N15M+eH5o8TarvBGQKt4PmxG9EDrsH54RSyVVd8YL999csg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5276
X-OriginatorOrg: intel.com
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTIvNC8yMDIxIDEyOjU1IFBNLCBSaWthcmQgRmFsa2Vib3JuIHdyb3RlOg0KPiBUaGVzZSBh
cmUgbmV2ZXIgbW9kaWZpZWQsIHNvIG1ha2UgdGhlbSBjb25zdCB0byBhbGxvdyB0aGUgY29tcGls
ZXIgdG8NCj4gcHV0IGl0IGluIHJlYWQtb25seSBtZW1vcnkuDQo+DQo+IFNpZ25lZC1vZmYtYnk6
IFJpa2FyZCBGYWxrZWJvcm4gPHJpa2FyZC5mYWxrZWJvcm5AZ21haWwuY29tPg0KPiAtLS0NCj4g
ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3Z0LmggICAgICB8ICAyICstDQo+ICAgZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMgfCAxMiArKysrKystLS0tLS0NCj4gICAyIGZp
bGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndnQuaCBiL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2d2dC9ndnQuaA0KPiBpbmRleCAwYzA2MTU2MDIzNDMuLjBlYmZmYzMyNzUyOCAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d2dC5oDQo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2d2dC9ndnQuaA0KPiBAQCAtMjcyLDcgKzI3Miw3IEBAIHN0cnVjdCBpbnRl
bF9ndnRfbW1pbyB7DQo+ICAgLyogVmFsdWUgb2YgY29tbWFuZCB3cml0ZSBvZiB0aGlzIHJlZyBu
ZWVkcyB0byBiZSBwYXRjaGVkICovDQo+ICAgI2RlZmluZSBGX0NNRF9XUklURV9QQVRDSAkoMSA8
PCA4KQ0KPiAgIA0KPiAtCXN0cnVjdCBndnRfbW1pb19ibG9jayAqbW1pb19ibG9jazsNCj4gKwlj
b25zdCBzdHJ1Y3QgZ3Z0X21taW9fYmxvY2sgKm1taW9fYmxvY2s7DQo+ICAgCXVuc2lnbmVkIGlu
dCBudW1fbW1pb19ibG9jazsNCj4gICANCj4gICAJREVDTEFSRV9IQVNIVEFCTEUobW1pb19pbmZv
X3RhYmxlLCBJTlRFTF9HVlRfTU1JT19IQVNIX0JJVFMpOw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQv
aGFuZGxlcnMuYw0KPiBpbmRleCBjZGUwYTQ3N2ZiNDkuLjVlODVhNzdkYTI1NyAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMNCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMNCj4gQEAgLTM2MjcsMTEgKzM2MjcsMTEgQEAg
c3RhdGljIGludCBpbml0X2J4dF9tbWlvX2luZm8oc3RydWN0IGludGVsX2d2dCAqZ3Z0KQ0KPiAg
IAlyZXR1cm4gMDsNCj4gICB9DQo+ICAgDQo+IC1zdGF0aWMgc3RydWN0IGd2dF9tbWlvX2Jsb2Nr
ICpmaW5kX21taW9fYmxvY2soc3RydWN0IGludGVsX2d2dCAqZ3Z0LA0KPiAtCQkJCQkgICAgICB1
bnNpZ25lZCBpbnQgb2Zmc2V0KQ0KPiArc3RhdGljIGNvbnN0IHN0cnVjdCBndnRfbW1pb19ibG9j
ayAqZmluZF9tbWlvX2Jsb2NrKHN0cnVjdCBpbnRlbF9ndnQgKmd2dCwNCj4gKwkJCQkJCSAgICB1
bnNpZ25lZCBpbnQgb2Zmc2V0KQ0KPiAgIHsNCj4gICAJdW5zaWduZWQgbG9uZyBkZXZpY2UgPSBp
bnRlbF9ndnRfZ2V0X2RldmljZV90eXBlKGd2dCk7DQo+IC0Jc3RydWN0IGd2dF9tbWlvX2Jsb2Nr
ICpibG9jayA9IGd2dC0+bW1pby5tbWlvX2Jsb2NrOw0KPiArCWNvbnN0IHN0cnVjdCBndnRfbW1p
b19ibG9jayAqYmxvY2sgPSBndnQtPm1taW8ubW1pb19ibG9jazsNCj4gICAJaW50IG51bSA9IGd2
dC0+bW1pby5udW1fbW1pb19ibG9jazsNCj4gICAJaW50IGk7DQo+ICAgDQo+IEBAIC0zNjcwLDcg
KzM2NzAsNyBAQCB2b2lkIGludGVsX2d2dF9jbGVhbl9tbWlvX2luZm8oc3RydWN0IGludGVsX2d2
dCAqZ3Z0KQ0KPiAgICAqIGFjY2Vzc2libGUgKHNob3VsZCBoYXZlIG5vIEZfQ01EX0FDQ0VTUyBm
bGFnKS4NCj4gICAgKiBvdGhlcndpc2UsIG5lZWQgdG8gdXBkYXRlIGNtZF9yZWdfaGFuZGxlciBp
biBjbWRfcGFyc2VyLmMNCj4gICAgKi8NCj4gLXN0YXRpYyBzdHJ1Y3QgZ3Z0X21taW9fYmxvY2sg
bW1pb19ibG9ja3NbXSA9IHsNCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZ3Z0X21taW9fYmxvY2sg
bW1pb19ibG9ja3NbXSA9IHsNCj4gICAJe0RfU0tMX1BMVVMsIF9NTUlPKERNQ19NTUlPX1NUQVJU
X1JBTkdFKSwgMHgzMDAwLCBOVUxMLCBOVUxMfSwNCj4gICAJe0RfQUxMLCBfTU1JTyhNQ0hCQVJf
TUlSUk9SX0JBU0VfU05CKSwgMHg0MDAwMCwgTlVMTCwgTlVMTH0sDQo+ICAgCXtEX0FMTCwgX01N
SU8oVkdUX1BWSU5GT19QQUdFKSwgVkdUX1BWSU5GT19TSVpFLA0KPiBAQCAtMzc1Myw3ICszNzUz
LDcgQEAgaW50IGludGVsX2d2dF9mb3JfZWFjaF90cmFja2VkX21taW8oc3RydWN0IGludGVsX2d2
dCAqZ3Z0LA0KPiAgIAlpbnQgKCpoYW5kbGVyKShzdHJ1Y3QgaW50ZWxfZ3Z0ICpndnQsIHUzMiBv
ZmZzZXQsIHZvaWQgKmRhdGEpLA0KPiAgIAl2b2lkICpkYXRhKQ0KPiAgIHsNCj4gLQlzdHJ1Y3Qg
Z3Z0X21taW9fYmxvY2sgKmJsb2NrID0gZ3Z0LT5tbWlvLm1taW9fYmxvY2s7DQo+ICsJY29uc3Qg
c3RydWN0IGd2dF9tbWlvX2Jsb2NrICpibG9jayA9IGd2dC0+bW1pby5tbWlvX2Jsb2NrOw0KPiAg
IAlzdHJ1Y3QgaW50ZWxfZ3Z0X21taW9faW5mbyAqZTsNCj4gICAJaW50IGksIGosIHJldDsNCj4g
ICANCj4gQEAgLTM4NzEsNyArMzg3MSw3IEBAIGludCBpbnRlbF92Z3B1X21taW9fcmVnX3J3KHN0
cnVjdCBpbnRlbF92Z3B1ICp2Z3B1LCB1bnNpZ25lZCBpbnQgb2Zmc2V0LA0KPiAgIAlzdHJ1Y3Qg
ZHJtX2k5MTVfcHJpdmF0ZSAqaTkxNSA9IHZncHUtPmd2dC0+Z3QtPmk5MTU7DQo+ICAgCXN0cnVj
dCBpbnRlbF9ndnQgKmd2dCA9IHZncHUtPmd2dDsNCj4gICAJc3RydWN0IGludGVsX2d2dF9tbWlv
X2luZm8gKm1taW9faW5mbzsNCj4gLQlzdHJ1Y3QgZ3Z0X21taW9fYmxvY2sgKm1taW9fYmxvY2s7
DQo+ICsJY29uc3Qgc3RydWN0IGd2dF9tbWlvX2Jsb2NrICptbWlvX2Jsb2NrOw0KPiAgIAlndnRf
bW1pb19mdW5jIGZ1bmM7DQo+ICAgCWludCByZXQ7DQo+ICAgDQoNClJldmlld2VkLWJ5OiBaaGkg
V2FuZyA8emhpLmEud2FuZ0BpbnRlbC5jb20+DQoNCg==
