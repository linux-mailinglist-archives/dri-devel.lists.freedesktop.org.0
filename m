Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF61D6E1190
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 17:59:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FF0210EB83;
	Thu, 13 Apr 2023 15:59:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 995EF10EB83;
 Thu, 13 Apr 2023 15:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681401559; x=1712937559;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=LNi1XSPeG9IlckjZ1aaNBtsWWbGQTTcj1KMm8dAs9Nw=;
 b=DJD9mrKDsYS3FmED7TSscFznHcKeYG4F5gjZQADVNLKWT9C7fEHDN0rw
 8KJV6O/Gfx7m9VPDY1fZ3P8oscad/i4snAmhA0tnFMEJRKge3Rs5Uox0F
 lKAx51ZmrV7VnPIAo6KuTkrQ6mIO5bkHjoBMsJuRaUIpZJBhX5VIKGpID
 ECXsNLBWziT78D/0EmkYIsvOAsry5Qu4HnDQH8okENkg9ZisufGGRmYXQ
 Xyin/OU6yUFCCzMG4bQ4/IJHwov7iL5nfa9WqQtVQNjkKSPWi1ZEADE/r
 Z6UPvOmugbshpd39en9D2aLEvYWvWNpF5DmIdU+4sX1/leyBARCTTmM2t Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="409400483"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; d="scan'208";a="409400483"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 08:58:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="689400969"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; d="scan'208";a="689400969"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP; 13 Apr 2023 08:58:53 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 13 Apr 2023 08:58:52 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 13 Apr 2023 08:58:52 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 13 Apr 2023 08:58:52 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.42) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 13 Apr 2023 08:58:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=idbLrB2X3WA7XQ5A3yNbhJmCcmYJsNYLaoetjPxLXZ4eHOzdS5OarU99m7uaFF3WHzJ9PJZccSH8JBQSoEImqJLuccZSH3h3WVOUM5vVpPErg8m7LvBtqB4bHXb50DkX5ti+Q4Ddas7o7VuZYbWZwz0xhUwIPXIBACUdGumcVl9kv1OYrIDkxC3721kDuHdvxevgFV/FQbuJUyq+/ufdW2k8X4SnoQ8joiAKX+iZ72KUehNBxTinROW8sqygtjoLPFVQ0z/PxxJo+oVYtrPJf8xxcy4r1mzR5AvhWr98GDxgWkcPtg0cq3NGVVib8w6BRYLQ32MGsbDi6h1nUdO+Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LNi1XSPeG9IlckjZ1aaNBtsWWbGQTTcj1KMm8dAs9Nw=;
 b=Ist5HXoJhuVfuWfxrMsN/c5kPpvavmcAii2g0WVPHTEON2F6ELPtc2IUTsQiuMciq+eYh9vmCh4yMlnK+khr9ATnHp6TioXiYQUk3+jKW6MUpxXFgRVPnrjEQtY0toIJVP4jmqOZ+2rAa1YWgPl5vnPURlUtE1s7dLvAumdXokBPBwOOR2tBTFmtzuJuORCvrAIMx0aLdVShavP3NsGF0i9XaE7D2l42JV2zOL8ItVH+40hWCd8PesjAiDOhTODKA2Nv9t27lCZoYtRT0kiPxakLpkDu/K3rIFmfbTEqIRRFBvYRebkF7fQ8STbmPdl3/sC34VEozrKoYiiU+PnEOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CO6PR11MB5620.namprd11.prod.outlook.com (2603:10b6:303:13e::17)
 by SA2PR11MB4937.namprd11.prod.outlook.com (2603:10b6:806:118::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.34; Thu, 13 Apr
 2023 15:58:42 +0000
Received: from CO6PR11MB5620.namprd11.prod.outlook.com
 ([fe80::4188:60ae:e3ba:a6ce]) by CO6PR11MB5620.namprd11.prod.outlook.com
 ([fe80::4188:60ae:e3ba:a6ce%4]) with mapi id 15.20.6277.038; Thu, 13 Apr 2023
 15:58:42 +0000
From: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "andi.shyti@linux.intel.com" <andi.shyti@linux.intel.com>
Subject: Re: [PATCH v2] drm/i915: Make IRQ reset and postinstall multi-gt aware
Thread-Topic: [PATCH v2] drm/i915: Make IRQ reset and postinstall multi-gt
 aware
Thread-Index: AQHZbelJdHHhapJxskeRmTADrtb0Fa8pZc+A
Date: Thu, 13 Apr 2023 15:58:42 +0000
Message-ID: <e4044e9e057eb6a9cb886278caeb4c36b1729359.camel@intel.com>
References: <20230413092006.931861-1-andi.shyti@linux.intel.com>
In-Reply-To: <20230413092006.931861-1-andi.shyti@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.3-1+deb11u1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5620:EE_|SA2PR11MB4937:EE_
x-ms-office365-filtering-correlation-id: f0a0c716-7180-402b-c593-08db3c37f46f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WvRg0j0L19NuIw1ChjlNyTtFUseMMlKrfqZy3HCtR7XOqxacrkuCecxEGNOm9pCiWZgBogWSOZgUfRgQ9wkb+kbq8v8AeqCM3O9hR1hTkIFiccNOxgdGQ8KEUJ8pBeNJ3cXCdioSBMXfxE3YlnnK2QVk4WHoOXdw0iFed1kLenuQgObDjNzolve+RKTfO5X45cI8ApGvBc21RPWxfrWRPdb5t3CrgF0FflGJoyB1bCUfKefYML7bCYiigYpsOu/Y1h6j7gt/GVv0a2DtOG8OaBjIUhw12hsExvGmzmRvzlKewf3+qeIKZ24I4LTaI63SEmKz9xFZGiUqduWtbDIMvm5wpwOE/aIWVwJ5HE7OtKHk71k8e5a9kY6pa4P/DYTXqdPkGW9vY2rvExNxc5l/ShzZ0TizeNkJbF7KcB6TCR86r+8ufIahy2wfeGEfm/zRv66KnXE901hFSsWP8spNVAV7ihhCzTO0Epp1sPList2yPOlv5xYHTVQaLem+N6R8/A6ZtxhHTSHdI+XhkgXerwjAmHAzl7gvBLdZjPp9E9WpeSLwIKIvuCL67nu75qBzTIoLz0BxK7iefXMZEeo1Vao9jnIMcXmNR42xTkmfBd4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5620.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(136003)(366004)(376002)(39860400002)(451199021)(71200400001)(478600001)(6506007)(186003)(110136005)(316002)(6512007)(66476007)(91956017)(966005)(2906002)(64756008)(76116006)(66946007)(54906003)(41300700001)(6486002)(66446008)(5660300002)(4326008)(8936002)(66556008)(8676002)(82960400001)(38100700002)(122000001)(38070700005)(83380400001)(86362001)(36756003)(2616005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dmtpYlhWbW1nQW8ydDNUK1hDa2NWV1pEd1p0aDJ3VENRbXNRY1BKTnFETlJK?=
 =?utf-8?B?bmtjWWZhWndlYkxwaEdIRWVETVM0dWZxYjRKanN2bStLZk1heDB5TXgvR3Nw?=
 =?utf-8?B?aExLVnhsNUxFT2dBWkhHU0FIenMyckFraHc3U0E1NFVMNWVremxhU29uaWti?=
 =?utf-8?B?RXlWSVB2cU9yR3JxYnhpWkxIMWplK0R4NFU5bk52dUFOUWlac2VLTmFwb2Jo?=
 =?utf-8?B?ZXU5SG12SjdPd2pROXlKczRFZ1NnZFY2STdRbG9EWGZGbzZXTXBhdkc0RXYv?=
 =?utf-8?B?Y2JLaEZMaXhDSFRzN1J0bTNZOCs5bVdORFNTK2Z3VHJualB2WUlyRmp4WTI4?=
 =?utf-8?B?MkpXK3FGVm1CNGZCVUJ2QTNLNXp4TG1pNU1LemppVDkzR2o5S1JrZWRHODZ1?=
 =?utf-8?B?RE5YNThRdUxtRVpKQlM0alRyWWpvM1k3TnRzczNNYUdVMmNxYjBreTJHdmhl?=
 =?utf-8?B?VDRPZHdSWjh4M3RRcms5TTR6aU5NY3FaNGFENFZHbk9GZnpHUktob3dYTERn?=
 =?utf-8?B?aXdGTmZNcndYbEx5bkVsT0pDWjVESWExV1JoN1dnMDB5WGt4NHJuMjBuelZJ?=
 =?utf-8?B?WlAyajVWWWhtNVB2dEdjYmhsUU1IZW00TldoU0hoZVJ4MmEwYUVzdHZqeS9Z?=
 =?utf-8?B?dDdHNllFay96c0xDWXVvNDBLUTVMMlBab3NLUUxJSDRKQlVsaXkyL2tVSCt5?=
 =?utf-8?B?aWl5VXZpZEsvSzVKQ3JualRjcGVwMjNYSHU3NTlPRFdZd1huZXdqMFdya2sy?=
 =?utf-8?B?ZTFPRDhWaVE1TmdtQjFSVXJadG5FUFpPRFMvcTkralNUaXcrYkpVbXFzc1o2?=
 =?utf-8?B?Wm5nS21YUGhkVGVoTGVqOFBSeFNzeE5mWC8yZmZ4SUIvWGJDRDR6ajR6MFJo?=
 =?utf-8?B?YllsVWFiNmM1NklaVTd0UzRRNXBad3c0RmV3VHFpLzBXR2FpZTNueHNjTDJM?=
 =?utf-8?B?U3VhRW9iQmtRd3VNWXdSbGNGb0RDaEpadW4yRi9CVk16K00xSUhTZ2RSYVpt?=
 =?utf-8?B?bzJ1QWU5eklySE1kUFBLMDRodm1XcG42L0RZbDY2ZWV4cU1LUHpWYmR6MUgv?=
 =?utf-8?B?VWs3cmo4NXFmUTFFNjZ6Ync1WjRINjE5WWszZFE4eksySXNPcWhYMjRPM2U2?=
 =?utf-8?B?YWp6eGpaVHROWW94NnR1anBZQkZDcEtQVXgvUVFiZnhEL3g3Vy9sL1Z0UHRM?=
 =?utf-8?B?U3l6OWR6VDZQY3M3bldjMmxxSnY1U0VlZmN1Njl1VURINitsOFNOSmJGQkZG?=
 =?utf-8?B?NldoZXFTNUsvb0NvdnZhNEhHYzJZWWJXSW1yZkhPSFRrTzE1VlRoRkp0cmFD?=
 =?utf-8?B?dzFwTE5IUENvb1ZlTTNmbUZ5SHVVbzZ4WStCSnRCcy9SRTNMNGNmeDcydkZX?=
 =?utf-8?B?blZMbm9NUkVpMGhSSUI1YWZWSHU3QmM0SnJuRFRESkxXOG8ybURsRmo5VGlk?=
 =?utf-8?B?dHpGWWhkcHQ5dVZjNm16NGxqWklhOEJQdGJ5cmJYRGtjNjNNVG9Xc0ZGenlJ?=
 =?utf-8?B?djlLWmt5Ny9ZZnpkeFQ3UktqWW1TNEd5OXVDVk9OdEhmZC81bVdiU3RIckZu?=
 =?utf-8?B?Z1ZCNUMyZHFzWTlGMFdya0hpVFg5cmo1U2pQTDYxS0Z0cnNxYUtVeVlKL0d5?=
 =?utf-8?B?ZTVrcTE5UzgxK01EcklrTjNTU1lWVlIrK0xKdXo4OVQxeWM1UUNnc082VGNu?=
 =?utf-8?B?d3o0TXNCTUVTTjBLclAyY3liUVpWb2xrY0xtZGxWZ3pOS2FCYlE0ZXoveCt0?=
 =?utf-8?B?a0F3UytoMXRUVTZ3RVUwL29QeXQ2eWV5dDhPeWplR01veUlIZ1lBeXZzdFoz?=
 =?utf-8?B?S2RVeTBGYkExTFJjWk5FckRsYkhrR3NOZTBRUjJIMEdPSnZ0OHE0K0JMU0xW?=
 =?utf-8?B?MXVuK0YyZjJlb3UxeHFqZkFLSjZjbXlYR0hpNk1qKzNEWUhyUFpISHRVMnlJ?=
 =?utf-8?B?SzNENm1rS21ickJzL1hQTFpBUjFmY0hmSjB6RzJkY1FYbU13WVRqNVBDbWJS?=
 =?utf-8?B?TWlPVSs4Z1JJN2hOZlBLRmZPLzdRSnR2Z0xySlc4UVNFYm56UGlwbUdBK2gz?=
 =?utf-8?B?aEJXUXJCV1A5YldTUHVqQVhPR0JHQzR5YmdyUTBKdjFDZVFMQ28yTmxybjRW?=
 =?utf-8?B?NHpnVS9QY1Jud2pKSWJRR3hBZE1XY05CR1l6Y3JXcjFPRTJFV1hIb1d1NWdO?=
 =?utf-8?B?c2ZCTkpuREppUGlCM1VUTmpsbXg4aVpPNmUxTko4WEp3RXIrOWpERXk0Ukh3?=
 =?utf-8?B?V0szM2JseklqdWxJUGc3QWVrcnNRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E4E256283B813B4482CBA82AA8735348@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5620.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0a0c716-7180-402b-c593-08db3c37f46f
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2023 15:58:42.4464 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E/XvGcIaPHMADGWuSBs5CpokdP2xkKw0MhdUAdJiU28OQLQmSdLSZ0GOdqBjcoOqN6842L0TXh261XSjeX58xqgRfnfsCPBuSzMwyGkZ7lo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4937
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
Cc: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Ursulin,
 Tvrtko" <tvrtko.ursulin@intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>,
 "andi.shyti@kernel.org" <andi.shyti@kernel.org>, "Das,
 Nirmoy" <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIzLTA0LTEzIGF0IDExOjIwICswMjAwLCBBbmRpIFNoeXRpIHdyb3RlOg0KPiBG
cm9tOiBQYXVsbyBaYW5vbmkgPHBhdWxvLnIuemFub25pQGludGVsLmNvbT4NCkhpDQoNCmh0dHBz
Oi8vZW4ud2lraXBlZGlhLm9yZy93aWtpL1NoaXBfb2ZfVGhlc2V1cw0KDQpNeSBvcmlnaW5hbCBw
YXRjaCB3YXMgd3JpdHRlbiBpbiAyMDE4LiBTaW5jZSB0aGVuLCB0aGUgaW1wbGVtZW50YXRpb24N
CmhhcyBiZWVuIHJlYmFzZWQgYW5kIGNoYW5nZWQgbXVsdGlwbGUgdGltZXMsIHRoZSBjb21taXQg
bWVzc2FnZSBoYXMNCmJlZW4gY2hhbmdlZCwgdGhlIHN1YmplY3QgbGluZSBoYXMgYmVlbiBjaGFu
Z2VkLCB5ZXQgbm9uZSBvZiB0aGF0IGlzDQpkb2N1bWVudGVkIGluIHRoZSBwYXRjaCdzIHJldmlz
aW9uIGhpc3Rvcnk6IGl0IHdhcyBhbGwgcmVtb3ZlZCBhbmQgaXQNCm5vdyBsb29rcyBsaWtlIEkn
bSB0aGUgYXV0aG9yIG9mIHRoZSB2ZXJzaW9uIHRoYXQgd2FzIHN1Ym1pdHRlZCB0aGlzDQptb250
aC4gSSBuZXZlciBsaWtlZCB0aGlzICJlcmFzZSB0aGUgaW50ZXJuYWwgcGF0Y2gncyBjaGFuZ2Vs
b2cgYmVmb3JlDQpzdWJtaXR0aW5nIGl0IHVwc3RyZWFtIGZvciB0aGUgZmlyc3QgdGltZSIgcHJv
Y2VzcywgSSB0aGluayBpdCBlcmFzZXMNCmNydWNpYWwgaW5mb3JtYXRpb24gYW5kIG1pc2xlYWRz
IHBlb3BsZS4NCg0KSSBrbm93IEkgc2FpZCBzb21ldGhpbmcgZGlmZmVyZW50IGVhcmxpZXIgaW4g
cHJpdmF0ZSwgYnV0IGFmdGVyIGZ1cnRoZXINCnJlZmxlY3Rpb24sIEkgY29uY2x1ZGVkIEkgZG8g
bm90IGZlZWwgY29tZm9ydGFibGUgaGF2aW5nIG15IG5hbWUgYXMgdGhlDQpBdXRob3Igb3IgYXMg
dGhlIFNpZ25lZC1vZmYtYnkgaW4gdGhpcyBwYXRjaC4gUGxlYXNlIHJlbW92ZSBpdC4gWW91IGNh
bg0KYWRkIGEgIkJhc2VkLW9uLXBhdGNoLWJ5OiBQYXVsbyBaYW5vbmkgPHBhdWxvLnIuemFub25p
QGludGVsLmNvbT4iIGlmDQp5b3Ugd2FudCwgYnV0IHRoYXQncyBub3QgbmVjZXNzYXJ5Lg0KDQpU
aGlzIHNob3VsZCBhbHNvIGhlbHAgaW4gY2FzZSBzb21lIGJ1ZyBpcyBiaXNlY3RlZCB0byB0aGlz
IHBhdGNoLCB0aGVuDQpJIHdvbid0IG5lZWQgdG8gc3BlbmQgdGltZSByZXNlYXJjaGluZyB3aG8g
SSBzaG91bGQgZm9yd2FyZCB0aGUgZW1haWxzDQp0by4NCg0KVGhhbmtzLA0KUGF1bG8NCg0KPiAN
Cj4gSW4gbXVsdGl0aWxlIHN5c3RlbXMgSVJRIG5lZWQgdG8gYmUgcmVzZXQgYW5kIGVuYWJsZWQg
cGVyIEdULg0KPiANCj4gQWx0aG91Z2ggaW4gTVRMIHRoZSBHVW5pdCBtaXNjIGludGVycnVwdHMg
cmVnaXN0ZXIgc2V0IGFyZQ0KPiBhdmFpbGFibGUgb25seSBpbiBHVC0wLCB3ZSBuZWVkIHRvIGxv
b3AgdGhyb3VnaCBhbGwgdGhlIEdUJ3MNCj4gaW4gb3JkZXIgdG8gaW5pdGlhbGl6ZSB0aGUgbWVk
aWEgZW5naW5lIHdoaWNoIGxpZXMgb24gYSBkaWZmZXJlbnQNCj4gR1QuDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBQYXVsbyBaYW5vbmkgPHBhdWxvLnIuemFub25pQGludGVsLmNvbT4NCj4gQ2M6IFR2
cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBpbnRlbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6
IEFuZGkgU2h5dGkgPGFuZGkuc2h5dGlAbGludXguaW50ZWwuY29tPg0KPiAtLS0NCj4gSGksDQo+
IA0KPiBwcm9wb3NpbmcgYWdhaW4gdGhpcyBwYXRjaCwgYXBwYXJlbnRseSBHdUMgbmVlZHMgdGhp
cyBwYXRjaCB0bw0KPiBpbml0aWFsaXplIHRoZSBtZWRpYSBHVC4NCj4gDQo+IEFuZGkNCj4gDQo+
IENoYW5nZWxvZw0KPiA9PT09PT09PT0NCj4gdjEgLT4gdjINCj4gwqAtIGltcHJvdmUgZGVzY3Jp
cHRpb24gaW4gdGhlIGNvbW1pdCBsb2cuDQo+IA0KPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5
MTVfaXJxLmMgfCAyOCArKysrKysrKysrKysrKysrKystLS0tLS0tLS0tDQo+IMKgMSBmaWxlIGNo
YW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfaXJxLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9pOTE1X2lycS5jDQo+IGluZGV4IGQyNGJkZWE2NWEzZGMuLjUyNGQ2NGJmNWQxODYgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfaXJxLmMNCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvaTkxNV9pcnEuYw0KPiBAQCAtMjc2NCwxNCArMjc2NCwxOSBAQCBzdGF0
aWMgdm9pZCBkZzFfaXJxX3Jlc2V0KHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdikN
Cj4gwqB7DQo+IMKgCXN0cnVjdCBpbnRlbF9ndCAqZ3QgPSB0b19ndChkZXZfcHJpdik7DQo+IMKg
CXN0cnVjdCBpbnRlbF91bmNvcmUgKnVuY29yZSA9IGd0LT51bmNvcmU7DQo+ICsJdW5zaWduZWQg
aW50IGk7DQo+IMKgDQo+IA0KPiANCj4gDQo+IMKgCWRnMV9tYXN0ZXJfaW50cl9kaXNhYmxlKGRl
dl9wcml2LT51bmNvcmUucmVncyk7DQo+IMKgDQo+IA0KPiANCj4gDQo+IC0JZ2VuMTFfZ3RfaXJx
X3Jlc2V0KGd0KTsNCj4gLQlnZW4xMV9kaXNwbGF5X2lycV9yZXNldChkZXZfcHJpdik7DQo+ICsJ
Zm9yX2VhY2hfZ3QoZ3QsIGRldl9wcml2LCBpKSB7DQo+ICsJCWdlbjExX2d0X2lycV9yZXNldChn
dCk7DQo+IMKgDQo+IA0KPiANCj4gDQo+IC0JR0VOM19JUlFfUkVTRVQodW5jb3JlLCBHRU4xMV9H
VV9NSVNDXyk7DQo+IC0JR0VOM19JUlFfUkVTRVQodW5jb3JlLCBHRU44X1BDVV8pOw0KPiArCQl1
bmNvcmUgPSBndC0+dW5jb3JlOw0KPiArCQlHRU4zX0lSUV9SRVNFVCh1bmNvcmUsIEdFTjExX0dV
X01JU0NfKTsNCj4gKwkJR0VOM19JUlFfUkVTRVQodW5jb3JlLCBHRU44X1BDVV8pOw0KPiArCX0N
Cj4gKw0KPiArCWdlbjExX2Rpc3BsYXlfaXJxX3Jlc2V0KGRldl9wcml2KTsNCj4gwqB9DQo+IMKg
DQo+IA0KPiANCj4gDQo+IMKgdm9pZCBnZW44X2lycV9wb3dlcl93ZWxsX3Bvc3RfZW5hYmxlKHN0
cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdiwNCj4gQEAgLTM0MjUsMTMgKzM0MzAsMTYg
QEAgc3RhdGljIHZvaWQgZ2VuMTFfaXJxX3Bvc3RpbnN0YWxsKHN0cnVjdCBkcm1faTkxNV9wcml2
YXRlICpkZXZfcHJpdikNCj4gwqANCj4gDQo+IA0KPiANCj4gwqBzdGF0aWMgdm9pZCBkZzFfaXJx
X3Bvc3RpbnN0YWxsKHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdikNCj4gwqB7DQo+
IC0Jc3RydWN0IGludGVsX2d0ICpndCA9IHRvX2d0KGRldl9wcml2KTsNCj4gLQlzdHJ1Y3QgaW50
ZWxfdW5jb3JlICp1bmNvcmUgPSBndC0+dW5jb3JlOw0KPiDCoAl1MzIgZ3VfbWlzY19tYXNrZWQg
PSBHRU4xMV9HVV9NSVNDX0dTRTsNCj4gKwlzdHJ1Y3QgaW50ZWxfZ3QgKmd0Ow0KPiArCXVuc2ln
bmVkIGludCBpOw0KPiDCoA0KPiANCj4gDQo+IA0KPiAtCWdlbjExX2d0X2lycV9wb3N0aW5zdGFs
bChndCk7DQo+ICsJZm9yX2VhY2hfZ3QoZ3QsIGRldl9wcml2LCBpKSB7DQo+ICsJCWdlbjExX2d0
X2lycV9wb3N0aW5zdGFsbChndCk7DQo+IMKgDQo+IA0KPiANCj4gDQo+IC0JR0VOM19JUlFfSU5J
VCh1bmNvcmUsIEdFTjExX0dVX01JU0NfLCB+Z3VfbWlzY19tYXNrZWQsIGd1X21pc2NfbWFza2Vk
KTsNCj4gKwkJR0VOM19JUlFfSU5JVChndC0+dW5jb3JlLCBHRU4xMV9HVV9NSVNDXywgfmd1X21p
c2NfbWFza2VkLA0KPiArCQkJICAgICAgZ3VfbWlzY19tYXNrZWQpOw0KPiArCX0NCj4gwqANCj4g
DQo+IA0KPiANCj4gwqAJaWYgKEhBU19ESVNQTEFZKGRldl9wcml2KSkgew0KPiDCoAkJaWNwX2ly
cV9wb3N0aW5zdGFsbChkZXZfcHJpdik7DQo+IEBAIC0zNDQwLDggKzM0NDgsOCBAQCBzdGF0aWMg
dm9pZCBkZzFfaXJxX3Bvc3RpbnN0YWxsKHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJp
dikNCj4gwqAJCQkJICAgR0VOMTFfRElTUExBWV9JUlFfRU5BQkxFKTsNCj4gwqAJfQ0KPiDCoA0K
PiANCj4gDQo+IA0KPiAtCWRnMV9tYXN0ZXJfaW50cl9lbmFibGUodW5jb3JlLT5yZWdzKTsNCj4g
LQlpbnRlbF91bmNvcmVfcG9zdGluZ19yZWFkKHVuY29yZSwgREcxX01TVFJfVElMRV9JTlRSKTsN
Cj4gKwlkZzFfbWFzdGVyX2ludHJfZW5hYmxlKHRvX2d0KGRldl9wcml2KS0+dW5jb3JlLT5yZWdz
KTsNCj4gKwlpbnRlbF91bmNvcmVfcG9zdGluZ19yZWFkKHRvX2d0KGRldl9wcml2KS0+dW5jb3Jl
LCBERzFfTVNUUl9USUxFX0lOVFIpOw0KPiDCoH0NCj4gwqANCj4gDQo+IA0KPiANCj4gwqBzdGF0
aWMgdm9pZCBjaGVycnl2aWV3X2lycV9wb3N0aW5zdGFsbChzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0
ZSAqZGV2X3ByaXYpDQo=
