Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB83675F2F
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 21:58:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1EA810E1B6;
	Fri, 20 Jan 2023 20:58:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ED2810E196;
 Fri, 20 Jan 2023 20:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674248311; x=1705784311;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=2IHIfIiTSlEUeluFMsqbQEr53wYxgmP9OSHBfWnb4SA=;
 b=V18HLJLkcbCuzcvKRyFHSXyjo0FThxRuIuMhcUf/jQRH83sw4I4mrFHM
 xAfqL4Fi7c3NkHeLwK7IqhFtLMLpLuOuVwD/hbAfQPgjb4SpRfOxiyLlQ
 8bO4hH1MAE9xk958DIxYpZcCtIFIB+g38lpCndQwNfwlhdvIf8LObQlcE
 t7lgs2BkNoUOakrrJQ26RbH6uC3aEucHOLWQjRBOaUNaZ8L1VewBW5/R0
 Dej9dbh4+gHTOnQaEORcVQ0Zc5GyHrURqhM0Qj1MrDlzyB7CYkUr7pquP
 IEWvVlQ4v83q8yj523P1GurJqjsyC6JalPB+b3rZa3yZl7CRCojNrYSWK g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="411923353"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; d="scan'208";a="411923353"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2023 12:58:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="834539955"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; d="scan'208";a="834539955"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP; 20 Jan 2023 12:58:20 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 20 Jan 2023 12:58:20 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 20 Jan 2023 12:58:20 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.46) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 20 Jan 2023 12:58:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mp2jzRdcyPRoqUidI3e9tH/WkJPY5nTMVU6rX/4Kfj7Xxrf5rwi0EDvkW/YzgnVeTuasl0BAWwW8kN2jprQPcJbYH/zYJsbC8jGj/jBkA+02OZBent99ly/83ftaZIKtacasIOfoSoBzt6nHrMaOVveOnSnNvJa7klDckFlcV9H78tbuu/kMRqDQfT+o1rbSIenJQAJGQxQX8DkAaf+vOlArX5EOMmSBLlAdCHnWHX7Qj8+1os4E1fEXwUZjc1FsRyMAUr7u0OOX6ZsKXYeiVvbnfsnA32J3QVrODI+1MenREGiI6nKzXolyQoqsbBLmMUi/Kch3HZ18WXMTPiE1dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2IHIfIiTSlEUeluFMsqbQEr53wYxgmP9OSHBfWnb4SA=;
 b=G2YiQq95tcr2DwzTeh6q14f7N6V+RPQIs+NnTcOMUQ6iC5zBwmrtpY4pRHvhYbQzedabRpQ7I2EiejSweoFHJ8y/HmwVc+leyFBNm9c2GcRoW+LZvXxXPTLvAdS6NKpXCfVR7pRKBOnOmel8yZV+9oOmYTFc0m3+WBJrN3vhlwb2CO/erFC8//QMqVu4wocTmAdYR29RHGMR7OFGzkyJqG2sOIcpCX+o7H/dMT0WdH7WuPFeAsMEwJn7PPURUtThLStS/Iu93kCcxKA+SgzD09annzHNRDw34OfapCDYh0V1lRrNWIm468y9rfLhof1r7E+iiBB1IZ6H2s8GuV1SBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 BN9PR11MB5225.namprd11.prod.outlook.com (2603:10b6:408:132::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27; Fri, 20 Jan
 2023 20:58:17 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::8901:2af2:6e02:c95c]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::8901:2af2:6e02:c95c%4]) with mapi id 15.20.6002.027; Fri, 20 Jan 2023
 20:58:17 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2 4/9] drm/i915/pxp: Add MTL helpers to submit
 Heci-Cmd-Packet to GSC
Thread-Topic: [PATCH v2 4/9] drm/i915/pxp: Add MTL helpers to submit
 Heci-Cmd-Packet to GSC
Thread-Index: AQHZJgWkiRYiC44ezE63YF9TnGnWtq6k/p+AgALZKYA=
Date: Fri, 20 Jan 2023 20:58:17 +0000
Message-ID: <e5629af210117dfd372dfaaa3f7229a95669f130.camel@intel.com>
References: <20230111214226.907536-1-alan.previn.teres.alexis@intel.com>
 <20230111214226.907536-5-alan.previn.teres.alexis@intel.com>
 <39ddb0e8-b605-66a2-e39c-c0481198cc19@intel.com>
In-Reply-To: <39ddb0e8-b605-66a2-e39c-c0481198cc19@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|BN9PR11MB5225:EE_
x-ms-office365-filtering-correlation-id: 536b732c-7413-4ca4-9da6-08dafb290e0f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: a0rOQihRKEISw3x+uNXnxLFD33LNj2qzY0QvExM+TTLUwXfM37c9XqwqUeynY1SVSJRv063pKjskk4KvaJnQKok0NtAe6zsXP7yY0FphRNcmc62W0FPLnBAYKE+bpHHlPBXHQdw5TMEMOf+4Mb6X6njXVZC/eZGLLbB8EmS4va8kO2ESfgkQu+NDNe3ZunNRnq3l0/ifjMfeQSjhobgN328X030MBIS1P3u1Gpxms5odqHkwV2jTUXhEFRMklJmxDzecOwypIVv8hQATHsqITlyhEwEpyq2VJ/xzNVYWdB66PF1evbfa8l19e6dnNZJS5/tcemDpxfAXEbF0mEkUrUp2tiuPtKGUrA+MdLtos02mghsYGS5CzkGHKruJdW54DNK+CXPWyBsLpTfbFlh7g8XWlRcbo3EJAs764nFs0bJyj1mzsbtmajMdPmSL3gxGsYzMLsru39knG5GwAH6mJlLtjUrN0GviNol+hxaZoRK0vmOxTWMJ05aPWxzmywo6KXt9qetZjOjlrf8qPrmCmUHTviYkUiWHD9Gj7Tj9zCa7y4+RlhMKyLkB+6kth9NYOqjQhP+bYashiFjuAY6S0DzwiENMxtj2o3ug/aPhulgKMKrc7PITWMGbajHax1gdAWu7U5deZULqlbQ4wIKpUQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(346002)(366004)(136003)(396003)(39860400002)(451199015)(186003)(26005)(6512007)(2906002)(86362001)(478600001)(83380400001)(66946007)(76116006)(38100700002)(966005)(6486002)(91956017)(66446008)(64756008)(316002)(66556008)(53546011)(5660300002)(82960400001)(66476007)(8676002)(4326008)(71200400001)(54906003)(122000001)(41300700001)(38070700005)(110136005)(6506007)(36756003)(8936002)(2616005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UVlYakpUZWdWc1lSL0ljOG11WE14RnhGdFZKK1RneWQ0OTVJa1I0a041RnV4?=
 =?utf-8?B?S2oyajgzMXJidkw0VGw5bHRUeFVxZ0ZxVFd6UmQ1Qko4a1YreFhGbW4vcUs4?=
 =?utf-8?B?YXpDWG9WZ0J0YUhuWmVjUDRSbjdaSHFqZjJIbTFjTk5ZcWY2RjBQRys2TDB1?=
 =?utf-8?B?dE44Z0NGLzVyenc2emYrY3ZJQjZodndhS0xIc0JMblJVaVY1a0VtaUN5aGox?=
 =?utf-8?B?TEFsMXdzNndsNE9OTmE5eUVkSkF5MUNQcTV0Qzh3Q2gwMW84cXBPcGtzcFlo?=
 =?utf-8?B?WEM4M1BPbzJ6aVdhU1c2YXlUVVpNQ2Zac21IeUJXYkZlOGpFdG5vZS9CK1hF?=
 =?utf-8?B?MDlQazBLL2JOam5uSTZWVlpqdTFqR0VRSzZjUDM4NEZOQ3V0T3NnaWFRTHNr?=
 =?utf-8?B?NEthQzJBSVdTY2J0dkdwejMrODJUMXVvZEp1NDkzUkZ4ZUdPZ1hPRlZuVC94?=
 =?utf-8?B?blpEK1JRNHV6YzhYakNrMDhBeXpqY3JJMnplUDZSMDM0SXBSZmg3QWdvQ2kx?=
 =?utf-8?B?Ynp2b3E1SWk2aHh3T0hMbElVQS9aNWhDTU44ZDF6Y0tYYnRIQlhDb2xHYm5l?=
 =?utf-8?B?a29QQjUybTRBajhzK00rOC96bnFVM3lkWm5Td0dWRWszSEw3U2t3RWwvdDFG?=
 =?utf-8?B?L0NldlhoZXBTS3pIMExVS1lZQ2pYNjlIN0VmdEd6WUs2NTl4MElVMkJQMUZG?=
 =?utf-8?B?NXlpMXhjb1hpQW5xdWc0WkFqT3FrTTFtY0k2ZjRRTVhKL0N0bVFreHlEYjd2?=
 =?utf-8?B?djBlSVNIRW0yc3FqZTl0VWFWQkdVemlja0xQejJ0czcrT3o3OUIzc0x3dXdl?=
 =?utf-8?B?OWl3RVVxcGFlN2c3M084clZlRVo4QlB4QVgyNUxqK3N5UFJvMFlNNFVvSmpV?=
 =?utf-8?B?dUhYSHZxTlppd1g2dFpyWHpUcDdnOFZUZnk3a0NjdjFReVd3MG85eU9mNDNG?=
 =?utf-8?B?bE0wdmRFSXBMQXJuZDRpU0xwWnZWUUhRU1FWN1FkQUxoSlhaaGZtN1hQTTBk?=
 =?utf-8?B?V2d3ZW9MckNoTE0raUxaQ1ZZbmFMOXgvY3hKUGk2Z0owM3ZqSUUyZTQvSjll?=
 =?utf-8?B?MUorVWVTRU54M3Vla2tBdE5oNlpwWEliWHU4VGp2RFI0TmVmaEtIdWZqVE1p?=
 =?utf-8?B?MEFaRHc2UWxRV013Q0JvTzJzNW0xTno0Zm9YUzloZGcwbmhDVHBJRGhxbmFM?=
 =?utf-8?B?SUY4ODJtVy9QOVNlQXhNcXRiaERiSHJ6bDJ2VXlqRzZabVl2eFZSa1pjUWtQ?=
 =?utf-8?B?cUErOTZLZW54T0pNSjhnbWlPd1I0L09PVGxucGE0SFRYMXBSbmMvZ0lpN0hF?=
 =?utf-8?B?eWkwbXFTdWw5dTIvZ1Nya0dVVkQrMU9wYmIzL01WekE5RmFpTGd3TGRpdmFq?=
 =?utf-8?B?NXdGS0w5c3ZsTEhDU29na0JCbDBUL1Z4aktGVXN2eUtMRTFrblZmblhHaG1L?=
 =?utf-8?B?TzYwYWZkZE9PMnNDZFdjWTF3Qjd1MFB5TzlmK3Z2UE84T3duQWFZWTV3YW5T?=
 =?utf-8?B?VEM2aEU3OTh0WU5hZk9kVFZNUjlIdXB3YXJjNGcrSVZCVGRHWmVleC9GTXJV?=
 =?utf-8?B?RUwxYis2SkZTNTdYUElUcndLRlIrSWdvOEtSWHVLNU52aDUrUTZ0UTZyM1Nt?=
 =?utf-8?B?c3hWNGc3NVM0SDNDTzAweHNQcmp0blRta0UzMWw1SU13Nnd0SngvdDFFM1JQ?=
 =?utf-8?B?bFRDd0F2eFBoVURNeEg1UC9KaktBY01lKzJZMXpyb2t3OWdRaHFPMHRKV1or?=
 =?utf-8?B?VWN1SjRlM0t3UVZ6UUFnZHl1V1dqdkh6QTJXVDZIeWdUTFZIaVhXaURNbWtp?=
 =?utf-8?B?c1AzVHdHYzlrOWN5NUpXNk4rKzRVNmN1emd0ZmdrR0dMSnpLNVBSUkVhb3M4?=
 =?utf-8?B?TndaZU9CT1lra0E5RTBia0lpcFNBcWRhemtCdENwMHl0VGF6VXNXSkNUdjl4?=
 =?utf-8?B?ejJ1dUlxWFNVbnpaUWZBa1RFcitRbm9pSmNlWk5XZjd6dzVqYVh5ODNLRjdx?=
 =?utf-8?B?dDFPWXR4eDBOVWs4M2o2bG4xZGV3ZXVWdG1OU2loaWIzQkpWK3BLajYrcE4y?=
 =?utf-8?B?azQzSldVVTc2K0x6Rjh5VTFqQ2lIT3V0VVdUWGJNV2dTV1BXYk5ZRzhzSi9L?=
 =?utf-8?B?eUlzWHdlWHRqVnp2RGpuaEU3bUVuaUc5akxWN3RQOHFvcW1ucmV0MFZQMDBz?=
 =?utf-8?Q?4EagHoPcLQrH37wltIm1Md+9ZbBjdZGTMQnt2vOb2VON?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4BF5C1B98BA36E47B862D1CF15CFBE31@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 536b732c-7413-4ca4-9da6-08dafb290e0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2023 20:58:17.4325 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CZaDpT2bdt0ZyUC2XmMBdgJz6ULB48fzFiRNLHsaZRA3YdFH0CvtcbuU8GmqYGGALHyJS3hzFHZu3MDGuifFV+0SOS9NSski/8FMeLjZEKRnxDNOs0cBVo5DBF/3KkkB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5225
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
Cc: "justonli@chromium.org" <justonli@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIzLTAxLTE4IGF0IDE3OjI4IC0wODAwLCBDZXJhb2xvIFNwdXJpbywgRGFuaWVs
ZSB3cm90ZToKPiA+IAo+ID4gCj4gPiBPbiAxLzExLzIwMjMgMTo0MiBQTSwgQWxhbiBQcmV2aW4g
d3JvdGU6Cj4gPiA+ID4gQWRkIGhlbHBlciBmdW5jdGlvbnMgaW50byAobmV3KSBjb21tb24gaGVj
aS1wYWNrZXQtc3VibWlzc2lvbiBmaWxlcwo+ID4gPiA+IHRvIGhhbmRsZSBnZW5lcmF0aW5nIHRo
ZSBNVEwgR1NDLUNTIE1lbW9yeS1IZWFkZXIgYW5kIGVtaXR0aW5nIG9mCj4gPiA+ID4gdGhlIEhl
Y2ktQ21kLVBhY2tldCBpbnN0cnVjdGlvbnMgdGhhdCBnZXRzIHN1Ym1pdHRlZCB0byB0aGUgZW5n
aW5lLgo+ID4gPiA+IAo+ID4gPiA+IE5PVEUxOiBUaGlzIGNvbW1vbiBmdW5jdGlvbnMgZm9yIGhl
Y2ktcGFja2V0LXN1Ym1pc3Npb24gd2lsbCBiZSB1c2VkIGJ5Cj4gPiA+ID4gZGlmZmVyZW50IGk5
MTUgY2FsbGVyczoKPiA+ID4gPiDCoMKgwqDCoMKgIDEtIEdTQy1TVy1Qcm94eTogVGhpcyBpcyBw
ZW5kaW5nIHVwc3RyZWFtIHB1YmxpY2F0aW9uIGF3YWl0aW5nCj4gPiA+ID4gwqDCoMKgwqDCoMKg
wqDCoCBhIGZldyByZW1haW5pbmcgb3BlbnMKPiA+ID4gPiDCoMKgwqDCoMKgIDItIE1UTC1IRENQ
OiBBbiBlcXVpdmFsZW50IHBhdGNoIGhhcyBhbHNvIGJlZW4gcHVibGlzaGVkIGF0Ogo+ID4gPiA+
IMKgwqDCoMKgwqDCoMKgwqAgaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmll
cy8xMTE4NzYvLiAoUGF0Y2ggMSkKPiA+ID4gPiDCoMKgwqDCoMKgIDMtIFBYUDogVGhpcyBzZXJp
ZXMuCj4gPiA+ID4gCj4gPiA+ID4gTk9URTM6IEFkZGl0aW9uYWwgY2xhcml0eSBhYm91dCB0aGUg
aGVjaS1jbWQtcGt0IGxheW91dCBhbmQgd2hlcmUgdGhlCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqAg
Y29tbW9uIGhlbHBlcnMgY29tZSBpbjoKPiA+ID4gPiDCoMKgwqDCoMKgIC0gV2hlbiBhbiBpbnRl
cm5hbCBzdWJzeXN0ZW0gbmVlZHMgdG8gc2VuZCBhIGNvbW1hbmQgcmVxdWVzdAo+ID4gPiA+IMKg
wqDCoMKgwqDCoMKgIHRvIHRoZSBzZWN1cml0eSBmaXJtd2FyZSBvbiBNVEwgb253YXJkcywgaXQg
d2lsbCBzZW5kIHRoYXQKPiA+ID4gPiDCoMKgwqDCoMKgwqDCoCB2aWEgdGhlIEdTQy1lbmdpbmUt
Y29tbWFuZC1zdHJlYW1lci4KPiA+ID4gPiDCoMKgwqDCoMKgIC0gSG93ZXZlciB0aG9zZSBjb21t
YW5kcywgKGxldHMgY2FsbCB0aGVtICJnc2Nfc3BlY2lmaWNfZndfYXBpIgo+ID4gPiA+IMKgwqDC
oMKgwqDCoMKgIGNhbGxzKSwgYXJlIG5vdCB1bmRlcnN0b29kIGJ5IHRoZSBHU0MgY29tbWFuZCBz
dHJlYW1lciBody4KPiA+ID4gPiDCoMKgwqDCoMKgIC0gVGhlIGNvbW1hbmQgc3RyZWFtZXIgRE9F
UyB1bmRlcnN0YW5kIEdTQ19IRUNJX0NNRF9QS1QgYnV0Cj4gPiA+ID4gwqDCoMKgwqDCoMKgwqAg
cmVxdWlyZXMgYW4gYWRkaXRpb25hbCBoZWFkZXIgYmVmb3JlIHRoZSAiZ3NjX3NwZWNpZmljX2Z3
X2FwaSIKPiA+ID4gPiDCoMKgwqDCoMKgwqDCoCBpcyBzZW50IGJ5IHRoZSBodyBlbmdpbmUgdG8g
dGhlIGZpcm13YXJlICh3aXRoIGFkZGl0aW9uYWwKPiA+ID4gPiDCoMKgwqDCoMKgwqDCoCBtZXRh
ZGF0YSkuCj4gPiAKPiA+IFRoaXMgaXMgc2xpZ2h0bHkgaW5jb3JyZWN0LiBUaGUgR1NDIENTIG9u
bHkgbG9va3MgYXQgdGhlIAo+ID4gR1NDX0hFQ0lfQ01EX1BLVCBpbnN0cnVjdGlvbi4gVGhlIGV4
dHJhIGhlYWRlciBpcyBhbHNvIHBhc3NlZCBvbiB0aGUgRlcgCj4gPiBhbmQgaXQgaXMgcGFydCBv
ZiB0aGUgRlcgc3BlY2lmaWMgQVBJLiBCYXNpY2FsbHkgdGhlIGZpcnN0IGhlYWRlciB0ZWxscyAK
PiA+IHRoZSBGVyBnZW5lcmljIGluZm8gYWJvdXQgdGhlIG1lc3NhZ2UgYW5kIHdoYXQgdHlwZSBv
ZiBjb21tYW5kIGl0IGlzLCAKPiA+IHdoaWxlIHRoZSBzZWNvbmQgaGVhZGVyIGlzIGluc3RlYWQg
ZmVhdHVyZS1zcGVjaWZpYyAoUFhQLCBIRENQLCBwcm94eSwgZXRjKS4KPiA+IApBbGFuOiB5dXAs
IG15IG1pc3Rha2UgLSB3aWxsIGZpeCB0aGlzLgoKQWxhbjogW3NuaXBdCgo+ID4gPiA+ICsKPiA+
ID4gPiAraW50Cj4gPiA+ID4gK2ludGVsX2dzY191Y19oZWNpX2NtZF9zdWJtaXRfbm9ucHJpdihz
dHJ1Y3QgaW50ZWxfZ3NjX3VjICpnc2MsCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGlu
dGVsX2NvbnRleHQgKmNlLAo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBpbnRlbF9nc2Nf
aGVjaV9ub25fcHJpdl9wa3QgKnBrdCwKPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1MzIgKmNzLCBp
bnQgdGltZW91dF9tcykKPiA+IAo+ID4gImNzIiBpcyB1c3VhbGx5IHVzZWQgZm9yIHdoZW4gd2Ug
d3JpdGUgZGlyZWN0bHkgaW4gdGhlIHJpbmcuIE1heWJlIHVzZSAKPiA+ICJjbWQiIGluc3RlYWQ/
IG5vdCBhIGJsb2NrZXIKPiA+IApBbGFuOiBzdXJlLgoKPiA+ID4gPiArewo+ID4gPiA+ICvCoMKg
wqDCoMKgwqDCoHN0cnVjdCBpbnRlbF9lbmdpbmVfY3MgKmVuZzsKPiA+ID4gPiArwqDCoMKgwqDC
oMKgwqBzdHJ1Y3QgaTkxNV9yZXF1ZXN0ICpycTsKPiA+ID4gPiArwqDCoMKgwqDCoMKgwqBpbnQg
ZXJyOwo+ID4gPiA+ICsKPiA+ID4gPiArwqDCoMKgwqDCoMKgwqBycSA9IGludGVsX2NvbnRleHRf
Y3JlYXRlX3JlcXVlc3QoY2UpOwo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoGlmIChJU19FUlIocnEp
KQo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gUFRSX0VSUihy
cSk7Cj4gPiA+ID4gKwo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoGVtaXRfZ3NjX2hlY2lfcGt0X25v
bnByaXYoY3MsIHBrdCk7Cj4gPiA+ID4gKwo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoGk5MTVfdm1h
X2xvY2socGt0LT5iYl92bWEpOwo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoGVyciA9IGk5MTVfdm1h
X21vdmVfdG9fYWN0aXZlKHBrdC0+YmJfdm1hLCBycSwgRVhFQ19PQkpFQ1RfV1JJVEUpOwo+ID4g
PiA+ICvCoMKgwqDCoMKgwqDCoGk5MTVfdm1hX3VubG9jayhwa3QtPmJiX3ZtYSk7Cj4gPiA+ID4g
Kwo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoGlmICghZXJyKSB7Cj4gPiA+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoGk5MTVfdm1hX2xvY2socGt0LT5oZWNpX3BrdF92bWEpOwo+ID4g
PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBlcnIgPSBpOTE1X3ZtYV9tb3ZlX3Rv
X2FjdGl2ZShwa3QtPmhlY2lfcGt0X3ZtYSwgcnEsIEVYRUNfT0JKRUNUX1dSSVRFKTsKPiA+ID4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaTkxNV92bWFfdW5sb2NrKHBrdC0+aGVj
aV9wa3Rfdm1hKTsKPiA+ID4gPiArwqDCoMKgwqDCoMKgwqB9Cj4gPiA+ID4gKwo+ID4gPiA+ICvC
oMKgwqDCoMKgwqDCoGVuZyA9IHJxLT5jb250ZXh0LT5lbmdpbmU7Cj4gPiA+ID4gK8KgwqDCoMKg
wqDCoMKgaWYgKCFlcnIgJiYgZW5nLT5lbWl0X2luaXRfYnJlYWRjcnVtYikKPiA+ID4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZXJyID0gZW5nLT5lbWl0X2luaXRfYnJlYWRjcnVt
YihycSk7Cj4gPiA+ID4gKwo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoGlmICghZXJyKQo+ID4gPiA+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBlcnIgPSBlbmctPmVtaXRfYmJfc3RhcnQo
cnEsIGk5MTVfdm1hX29mZnNldChwa3QtPmJiX3ZtYSksIFBBR0VfU0laRSwgMCk7Cj4gPiA+ID4g
Kwo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoGlmIChlcnIpIHsKPiA+ID4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgaTkxNV9yZXF1ZXN0X2FkZChycSk7Cj4gPiAKPiA+IFlvdSdyZSBt
aXNzaW5nIGEgaTkxNV9yZXF1ZXN0X3NldF9lcnJvcl9vbmNlIGhlcmUuIEkgc3VnZ2VzdCB1c2lu
ZyBhIAo+ID4gZ290byBhbmQgcnVubmluZyB0aGUgc2FtZSBjb2RlIGZvciB0aGUgcmVxdWVzdF9h
ZGQgaW4gYm90aCB0aGUgcGFzc2luZyAKPiA+IGFuZCBmYWlsdXJlIGNhc2VzLCBsaWtlIHdoYXQg
d2UgZG8gZm9yIHRoZSBweHAgc2Vzc2lvbiB0ZXJtaW5hdGlvbiAKPiA+IHN1Ym1pc3Npb24uCkFs
YW46IGdvdCBpdCAtIHdpbGwgZml4IGFjY29yZGluZ2x5Lgo+ID4gCj4gPiA+ID4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiBlcnI7Cj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKg
fQo+ID4gPiA+ICsKPiA+ID4gPiArwqDCoMKgwqDCoMKgwqBpOTE1X3JlcXVlc3RfZ2V0KHJxKTsK
PiA+ID4gPiArCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgaTkxNV9yZXF1ZXN0X2FkZChycSk7Cj4g
PiA+ID4gK8KgwqDCoMKgwqDCoMKgaWYgKGk5MTVfcmVxdWVzdF93YWl0KHJxLCBJOTE1X1dBSVRf
SU5URVJSVVBUSUJMRSwKPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbXNlY3NfdG9famlmZmllcyh0aW1lb3V0X21zKSkgPCAw
KSB7Cj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGk5MTVfcmVxdWVzdF9w
dXQocnEpOwo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gLUVU
SU1FOwo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoH0KPiA+ID4gPiArCj4gPiA+ID4gK8KgwqDCoMKg
wqDCoMKgaTkxNV9yZXF1ZXN0X3B1dChycSk7Cj4gPiA+ID4gKwo+ID4gPiA+ICvCoMKgwqDCoMKg
wqDCoGVyciA9IGNlLT5lbmdpbmUtPmVtaXRfZmx1c2gocnEsIDApOwo+ID4gPiA+ICvCoMKgwqDC
oMKgwqDCoGlmIChlcnIpCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRy
bV9lcnIoJmdzY191Y190b19ndChnc2MpLT5pOTE1LT5kcm0sCj4gPiA+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAiRmFpbGVkIGVtaXQtZmx1c2ggZm9y
IGdzYy1oZWNpLW5vbi1wcml2LXBrdGVycj0lZFxuIiwgZXJyKTsKPiA+ID4gPiArCj4gPiA+ID4g
K8KgwqDCoMKgwqDCoMKgaWYgKHVubGlrZWx5KGVycikpCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoGk5MTVfcmVxdWVzdF9zZXRfZXJyb3Jfb25jZShycSwgZXJyKTsKPiA+
IAo+ID4gdGhlIGVtaXRfZmx1c2ggYW5kIHRoZSBzZXRfZXJyb3IgbXVzdCBiZSBkb25lIGJlZm9y
ZSB0aGUgcmVxdWVzdF9hZGQuCkFsYW46IHllYWggLSBteSBiYWQgd2lsbCBkby4KPiA+IApBbGFu
OltzbmlwXQoKPiA+ID4gPiArc3RydWN0IGludGVsX2dzY19tdGxfaGVhZGVyIHsKPiA+ID4gPiAr
wqDCoMKgwqDCoMKgwqB1MzIgdmFsaWRpdHlfbWFya2VyOwo+ID4gPiA+ICsjZGVmaW5lIEdTQ19I
RUNJX1ZBTElESVRZX01BUktFUiAweEE1Nzg4NzVBCj4gPiA+ID4gKwo+ID4gPiA+ICvCoMKgwqDC
oMKgwqDCoHU4IGhlY2lfY2xpZW50X2lkOwo+ID4gPiA+ICsjZGVmaW5lIEdTQ19IRUNJX01FQURE
UkVTU19QWFAgMTcKPiA+ID4gPiArI2RlZmluZSBHU0NfSEVDSV9NRUFERFJFU1NfSERDUCAxOAo+
ID4gPiA+ICsKPiA+ID4gPiArwqDCoMKgwqDCoMKgwqB1OCByZXNlcnZlZDE7Cj4gPiA+ID4gKwo+
ID4gPiA+ICvCoMKgwqDCoMKgwqDCoHUxNiBoZWFkZXJfdmVyc2lvbjsKPiA+ID4gPiArI2RlZmlu
ZSBNVExfR1NDX0hFQ0lfSEVBREVSX1ZFUlNJT04gMQo+ID4gPiA+ICsKPiA+ID4gPiArwqDCoMKg
wqDCoMKgwqB1NjQgaG9zdF9zZXNzaW9uX2hhbmRsZTsKPiA+ID4gPiArI2RlZmluZSBHU0NfSEVD
SV9IT1NUX1NFU1NJT05fVVNBR0VfTUFTSyBSRUdfR0VOTUFTSzY0KDYzLCA2MCkKPiA+ID4gPiAr
I2RlZmluZSBHU0NfSEVDSV9TRVNTSU9OX1BYUF9TSU5HTEUgQklUX1VMTCg2MCkKPiA+IAo+ID4g
QXJlIHRob3NlIGluIHRoZSBzcGVjcyBhbnl3aGVyZT8gT3RoZXJ3aXNlLCBpZiB0aGV5J3JlIGk5
MTUtZGVmaW5lZCwgY2FuIAo+ID4geW91IGFkZCBhbiBleHBsYW5hdGlvbiBvbiBob3cgdGhleSdy
ZSBkZWZpbmVkPwo+ID4gCj4gPiBEYW5pZWxlCgpBbGFuOiBIVyBzcGVjcyBhbGxvd3Mgc29mdHdh
cmUgdG8gZGVmaW5lIHRoaXMgYXMgbG9uZyBhcyBpdHMgdW5pcXVlIHBlciB1c2VyLXByb2Nlc3Mg
YW5kIHVzYWdlLgpUaGlzIGJpdGZpZWxkIGlzIHNvbWV0aGluZyBJIGRpc2N1c3NlZCBvZmZsaW5l
IHdpdGggU3VyYWogdG8gZGlmZmVyZW50aWF0ZSBQWFAgZnJvbSBIRENQClRoaXMgd291bGQgYWxz
byBjb21lIGluIGhhbmR5IGZvciBkZWJ1Z2dhYmlsaXR5IGFzIHdlbGwuIFdpbGwgYWRkIGNvbW1l
bnRzIGFjY29yZGluZ2x5Cj4gPiAKPiAKCgo=
