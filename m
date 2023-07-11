Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CD074F7F2
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 20:22:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D905310E422;
	Tue, 11 Jul 2023 18:22:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACE6C10E0F4;
 Tue, 11 Jul 2023 18:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689099725; x=1720635725;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=sZ8jjPQ3IRwld+8A7+qYXbLaIScCYbGTMfvtrdboXz8=;
 b=Q4Ytc315/i5KsWfF4CiLw/vJdpNbvBd4owW0KUBujqOvuNJzGnsZe3xx
 iFZaN1gk3O53nS9i44+PTXbV3Il25ifMXrUEEjSzbh9aSThb16xQyEkT9
 7NCTSucTocxRfZxl66iL8nMXvBAQO19t6uW0+1zg2Ew4AZJ4NQHTE9/d4
 BPh2GBuplUJcl+6Be1pTg0eLth8KJnVvQZ6nBxlAhyveYHYzvkM7/dKgQ
 LxJxQZVMyfzmfAKvkb8pGb31bRmMwrvqF5ya+bKEH273loxHFeVt0qU7Z
 FgxH10yYP0sYtZA/usns7HS9LsTLl8/mk97v/IfXWfYI83CUGx6fTzR1y Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="349531780"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; d="scan'208";a="349531780"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 11:15:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="724546500"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; d="scan'208";a="724546500"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP; 11 Jul 2023 11:15:05 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 11 Jul 2023 11:15:05 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 11 Jul 2023 11:15:05 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 11 Jul 2023 11:15:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=chdMgOMB1B3xZyOCssIzq/la90RQztDD3LhJ+AIVQh3Sj2JeQCHppF72Jk1L3FGKj7bO5lWzoklPvnRd+iIHx8r90Dbrwx0lk4wbLH+t54gbATt2IigMKIW5FXimyZndEsFJceW8qQVpbxU3bnKlej4x5E9F9FYLX134j+Ivvfo6pQVeO+Gb8w+6jXVTOUlIcuoo5YteOWtpBWgfhrsu0XlA2StCKFoZuUIuMe9OLCvMCzf0gpBjz1vneMnQKD+0NV8ntkOKQLKbWbf7HDDg0LyFvMDYxlpBopu08TsLYobJHT9Oy0AttyKjthTmZw4yHMCpw54QZIjiD1f6Pl0uaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sZ8jjPQ3IRwld+8A7+qYXbLaIScCYbGTMfvtrdboXz8=;
 b=ImqkWkeYTUJAtqfJ9zv6Fjouoou48kPOK0x+fSQODACM4kZsEqL52y3uGbr9K4gdXig2p6JEf+T67tQlUWtIqYs4lddG03MN2xTGLNmv2ue01fOp4NU+PmYRA8nGkZBIIevCjjfW0R0tytRSdxvjP/W+c1wsGecWqRMc23tkJCKvNaCVw9G5z8K/jVbvuv1+rblnDhPWQOSmErtcMxqoifu6OcJk0nphvBJvIKcBxWpiPgNw9+cAOIC0qLrlMT2hJzA80t/lfnQhrq1M7rAveNvrxByurT1nEmS/pVBksfNkmxlTIyQj94CKtP86nN9kEF92tuvvFn4imRWWeSgJKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 PH0PR11MB7423.namprd11.prod.outlook.com (2603:10b6:510:282::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.29; Tue, 11 Jul 2023 18:15:03 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::f674:6c10:d181:ac70]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::f674:6c10:d181:ac70%6]) with mapi id 15.20.6588.017; Tue, 11 Jul 2023
 18:15:02 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH v3] drm/i915/selftest/gsc: Ensure GSC Proxy
 init completes before selftests
Thread-Topic: [Intel-gfx] [PATCH v3] drm/i915/selftest/gsc: Ensure GSC Proxy
 init completes before selftests
Thread-Index: AQHZqspHHM/XQjd/10GCdk8gDbshi6+iUFCAgBKhUQA=
Date: Tue, 11 Jul 2023 18:15:02 +0000
Message-ID: <20c097ddcc2eb63f25a766becbcd0d779855afe5.camel@intel.com>
References: <20230629204248.1283601-1-alan.previn.teres.alexis@intel.com>
 <29d9e289-42f8-8ae2-ad2b-9ddfe8c848cc@linux.intel.com>
In-Reply-To: <29d9e289-42f8-8ae2-ad2b-9ddfe8c848cc@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|PH0PR11MB7423:EE_
x-ms-office365-filtering-correlation-id: 3b153924-481a-4307-9502-08db823abedd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RcCFssy1k0brUxGMwchAfZpTb2KADn+eZHlwGwAiLtTJyiU3iFBVFG0x3Z5PketYoCgiw5TCepHLGwx/s0SPTWD6lQMbwtlO/Ka3p/M6p3KrrnuAQAOO+QgT+7In15/wE5O4g4nGfyS2aRUmOT7cRmn3fasGxhHXUqOgukPjC5mdbwEgqcCnzhnux/dpto+bv0E0fs9m82MWtezsAsc83XwdsWnGiNVmYD58O/OOd9qJfzNWeQmgPZ2SJaugF7cmjLKF7/1pgHdB7/UblHr8dVvzs2ODjcgQ59PkQ8jSi6XezRUK5nGvQjx6cx+RfiX3pyEsxb/aXx0zo1U48J5EnPaAFwtLmJLH+hLD3ixM3stYhCpN0tWBBpHTgTXUoHpYlBFGMSEfVfR5AQOdgQXh8BBkCovr/ENBTNUeHdcfhSWIFfHP3nD+mgFlYvs6KGCtyDY3Rfnox/AfQ4AJTdXm0u6ovVLElDBAWDm5QRjlifJlaGuQQ0Rt7s0BxBdPzY51GELU6iY44YAFzCKmnXNtUKNwi6B3ScWZcD6OdkNavicc6iXMbMN7Abq2utPf9ywJQUhB6IFIl+CyzbHkSxofGdQZQzx+9exFcZR/bdDVaHjCu7vOSlPAobLqV7QrHv3J
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(366004)(39860400002)(376002)(136003)(396003)(451199021)(38100700002)(38070700005)(86362001)(36756003)(91956017)(76116006)(6486002)(110136005)(71200400001)(122000001)(82960400001)(26005)(478600001)(6506007)(186003)(6512007)(2616005)(53546011)(8936002)(2906002)(5660300002)(316002)(66946007)(66446008)(66476007)(8676002)(66556008)(64756008)(83380400001)(4326008)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SzI2OFY5dTBhMUtseC9weWZUMk1OanJZaG82VE9vSUp1MDMvK1JtcFFiRTl3?=
 =?utf-8?B?L1Y4bmRIQktuWDBrVEpadE9wT0J6UjNOVUpmUVVSTFJjbVpKdWRia1l2amdX?=
 =?utf-8?B?YndJUmczRlBhOUc5bWVxQS8zeEVNeFRseHZOK2NhdmQ0YmJEVTVmcnVPdWE1?=
 =?utf-8?B?WU00SUNuM2xQS2xjTFU5Q3JxY1lrNXZrSStaeld4YUFwRG9seng5YWV0bVJu?=
 =?utf-8?B?cGJUVlVSTnFVaC9OUlQ5Q0hkOXhNaHlwRUhWd0VrUHE2MmsxSWNzZk5SM1RR?=
 =?utf-8?B?ZEszRGNXYXRtVlVmK1pGa3JvdEpONXZOdmZKS3NIRkpzamgrcFA2dGZXK05V?=
 =?utf-8?B?R1Y0VFF4K0hNWVBYRXVjYVpGZmcyb1lkS3dFUWZZUXVuaTUxaTZwU0VMUjVD?=
 =?utf-8?B?TUxRZlRrYzhOMk51Tkp4Z0dxZWFqRHYvR24xTDdXT0VQeU00QUw0U0tibUdO?=
 =?utf-8?B?RjNmTklid1hOWmJXVzV0ZVYxSGg4bDRwc1NPN1hPVUhIZEZWRStUOCt3TUp0?=
 =?utf-8?B?QjljNWI5dmJwSnY0N0l2bS9mR015V2ZQZHRwOWk4K3hrM2hQT1dYbGlIdGcv?=
 =?utf-8?B?d3VMQ0hKdEhGZW9KcEJLU2tJUVFxcmFKZldZSHJGMzhidC9DN0toSW9wUXky?=
 =?utf-8?B?cXpwVzRIcFNBbFZ6dlFnZWIySmpGUWlJMUM2cFpMMHdheUdZVGVKVlUxRE03?=
 =?utf-8?B?ek5nc2Y2YjV0VUw4SGI2SHB0Q2ZWaEM4Z2J0L0xZNW8rRTRsMXFrZ0RRM1pr?=
 =?utf-8?B?Q0RyVGxVM25NQjFDSGcvL2hCRzl6WGUwN3lzQXlNRGlqcEVsVlY4VW80c1RY?=
 =?utf-8?B?NkxLN0FUMXRITThZQ1pCS2FSdTl6VWIycFNlYldXT2hwTDhaUFNoRjJnYW42?=
 =?utf-8?B?OGRJaXhnUFB4VTRBUDhEMUFMenVCR2wvcVdIa3cwa3RSUjVwNmJlWktjaWtP?=
 =?utf-8?B?SENiSEJUZ2NkdVpqL29XRmtnVmg5VWtEcm1BVW55N2JwMlBsNTVxT2VSK1Ux?=
 =?utf-8?B?ZWxnUHMwUll1ZUZwc0U1MUJSZ3U0SUg2R2JOTDhUMGQyamE0K1N3SUlGKzZF?=
 =?utf-8?B?UnpkdDhsZFpZSE5VeVRyMUl3NnBPalRjZi9QR2ZtMm1XY0xWRU1TaWFJN2FV?=
 =?utf-8?B?SWNmNGhkQmwzM0lWREhTaUxMckhpYzQ4YUxHckZKRFRFRWJRcGQ1SnFzbUIw?=
 =?utf-8?B?ejVJTGV2L0hVS3d4YlFDenVOMmpFd1N3VFVtZGoyVDNrZGVxclpVMHJpcHlr?=
 =?utf-8?B?L2lYNFZnQ3NVYlRyNGRFRmYrSlRLOENjMlk5a0JUSmszeEMrNlZXQ0xLaTlN?=
 =?utf-8?B?U2VpT3ZvUFNVeVpISEZPdHRHUHhBZlpzR0htdlphL3NiaFl5ME9Nait4YkJW?=
 =?utf-8?B?ZEZnZHFzbHYyUDVPQ01MM3F5N2JPY1E1QnVoVzFEMEVWUFIxbENpV09QOFlp?=
 =?utf-8?B?Ym84U2J1TFc0RXB1Mk9zek0vMUh2NkVtWVZDNGdRVHhUb0VMOWlqbUJLVjZJ?=
 =?utf-8?B?emdiKzExMHo4Q21YbmRWRWFwaHZ2alFOeGU4bzBNV3B6Z0orcXFKMXFxeWk4?=
 =?utf-8?B?NElUTHJ5OXI0My9mYndTeFI4VTg1QjJScTBuYnVyOHJuTU1mTGhaYVpaRi9y?=
 =?utf-8?B?WnJ0SEd6cUNVSVlGenEyeTdFTGR1cTcxM2JCQVc2NTkzekxkeEd5Y01acFVU?=
 =?utf-8?B?WkY4QzloUFp5UG5uQ0V6c1ZjcytEU3l4cmZZMGhxLzlWS0huL1R0WTUzSzBQ?=
 =?utf-8?B?cW42K3dtckR0WUdyWnpQbmlhMlpkeU9uanZKNWwraXdqeVcxNDRrZ2NLN0tv?=
 =?utf-8?B?RUo2ZXlvL0YxZE5UamNVRFV1ek54NTQxYnRZQlVIQXp2RnZxWEN5QlZRSmlJ?=
 =?utf-8?B?UlZ3SmlFell2UTh6U0ZPREhseEg1TXNDZTJZUWk2N0RwV0lmNU96Mlc1QXlQ?=
 =?utf-8?B?dUljcFgxcFl0eURHL0crUmU5cXlVT1laekJsUlNxMmhienFNTEJTeVRwNXVE?=
 =?utf-8?B?bFBWM3dCOTZTd05NOFREcnpvZWtUVVkyaGNrUGZMVG4zWHEreDFUdFRiN05G?=
 =?utf-8?B?SGpwTis5WFN5QUJWeGNoYXl5WmQ2ZlRLb2R0N2YrY2lXZDFpWFBKVmRxdGxO?=
 =?utf-8?B?Ui9nMXNsc2FoZmVsSFVkOVl1dVo2YkxNYW5ka1lVT1lPR2xIM2piRTdvaDNa?=
 =?utf-8?Q?wc0j+3sSUNETzluztd3lhNg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9A380817A32B504A8BC30B156254DBE8@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b153924-481a-4307-9502-08db823abedd
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2023 18:15:02.4945 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kr9fjeyGHbSclbD1UqQJeMOtZmy2KAQR5Ld5iVa06JckMs2v8HU7xWuStxIttlF8ajJufWJmointGlQmZ2u+8MsTDU+KMrI81MCHw5qiKF3zBxFjmaB6c+/yqPWQBz/z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7423
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhhbmtzIGZvcmUgcmV2aWV3aW5nIFR2cnRrbywgYmVsb3cgYXJlIG15IHJlc3BvbnNlcy4NCkkn
bGwgcmVyZXYgd2l0aG91dCBnZW5lcmFsaXplZCBmdW5jIHB0ciBhbmQgb25seSBmb3IgdGhlIHN1
YnRlc3RzIHRoYXQgbmVlZCBpdC4NCi4uLmFsYW4NCg0KT24gVGh1LCAyMDIzLTA2LTI5IGF0IDIy
OjQ0ICswMTAwLCBUdnJ0a28gVXJzdWxpbiB3cm90ZToNCj4gT24gMjkvMDYvMjAyMyAyMTo0Miwg
QWxhbiBQcmV2aW4gd3JvdGU6DQo+ID4gT24gTVRMLCBpZiB0aGUgR1NDIFByb3h5IGluaXQgZmxv
d3MgaGF2ZW4ndCBjb21wbGV0ZWQsIHN1Ym1pc3Npb25zIHRvIHRoZQ0KPiA+IEdTQyBlbmdpbmUg
d2lsbCBmYWlsLiBUaG9zZSBpbml0IGZsb3dzIGFyZSBkZXBlbmRlbnQgb24gdGhlIG1laSdzDQo+
ID4gZ3NjX3Byb3h5IGNvbXBvbmVudCB0aGF0IGlzIGxvYWRlZCBpbiBwYXJhbGxlbCB3aXRoIGk5
MTUgYW5kIGENCj4gPiB3b3JrZXIgdGhhdCBjb3VsZCBwb3RlbnRpYWxseSBzdGFydCBhZnRlciBp
OTE1IGRyaXZlciBpbml0IGlzIGRvbmUuDQo+ID4gDQo+ID4gVGhhdCBzYWlkLCBhbGwgc3Vic3l0
ZW1zIHRoYXQgYWNjZXNzIHRoZSBHU0MgZW5naW5lIHRvZGF5IGRvZXMgY2hlY2sNCj4gPiBmb3Ig
c3VjaCBpbml0IGZsb3cgY29tcGxldGlvbiBiZWZvcmUgdXNpbmcgdGhlIEdTQyBlbmdpbmUuIEhv
d2V2ZXIsDQo+ID4gc2VsZnRlc3RzIGN1cnJlbnRseSBkb24ndCB3YWl0IG9uIGFueXRoaW5nIGJl
Zm9yZSBzdGFydGluZy4NCg0KYWxhbjpzbmlwDQo+ID4gK3N0YXRpYyBpbnQNCj4gPiArX193YWl0
X2dzY19wcm94eV9jb21wbGV0ZWQoc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmk5MTUsDQo+ID4g
KwkJCSAgIHVuc2lnbmVkIGxvbmcgdGltZW91dF9tcykNCj4gPiArew0KPiA+ICsJYm9vbCBuZWVk
X3RvX3dhaXQgPSAoSVNfRU5BQkxFRChDT05GSUdfSU5URUxfTUVJX0dTQ19QUk9YWSkgJiYNCj4g
PiArCQkJICAgICBpOTE1LT5tZWRpYV9ndCAmJg0KPiA+ICsJCQkgICAgIEhBU19FTkdJTkUoaTkx
NS0+bWVkaWFfZ3QsIEdTQzApICYmDQo+ID4gKwkJCSAgICAgaW50ZWxfdWNfZndfaXNfbG9hZGFi
bGUoJmk5MTUtPm1lZGlhX2d0LT51Yy5nc2MuZncpKTsNCj4gPiArDQo+ID4gKwkvKg0KPiA+ICsJ
ICogRm9yIGdzYyBwcm94eSBjb21wb25lbnQgbG9hZGluZyArIGluaXQsIHdlIG5lZWQgYSBtdWNo
IGxvbmdlciB0aW1lb3V0DQo+ID4gKwkgKiB0aGFuIHdoYXQgQ0kgc2VsZnRlc3QgaW5mcmFzdHJ1
Y3V0cmUgY3VycmVudGx5IHVzZXMuIFRoaXMgbG9uZ2VyIHdhaXQNCj4gPiArCSAqIHBlcmlvZCBk
ZXBlbmRzIG9uIHRoZSBrZXJuZWwgY29uZmlnIGFuZCBjb21wb25lbnQgZHJpdmVyIGxvYWQgb3Jk
ZXJpbmcNCj4gPiArCSAqLw0KPiANCj4gSG93IGlzIGEgQ0kgdGltZW91dCB2YWx1ZSByZWxldmFu
dD8NCj4gDQo+IFBsdXMgZnJvbSB0aGUgY29tbWl0IG1lc3NhZ2UgaXQgc291bmRzIGxpa2UgdGhl
IHBvaW50IG9mIHdhaXQgaXMgc28gDQo+IHN1Ym1pc3Npb24gdG8gZ3NjIGRvZXMgbm90IGZhaWwg
aWYgbG9hZGluZyBpcyBzdGlsbCBpbiBwcm9ncmVzcywgbm90IA0KPiB0aGF0IHRoZSBDSSB0aW1l
cyBvdXQuIFNvIHdoYXQgaXMgdGhlIG1haW4gcHJvYmxlbT8NCg0KQWxhbjogVGhlIGNvbW1lbnQg
d2FzIG1lYW50IHRvIGV4cGxhaW4gd2h5IHdlIG92ZXJyaWRlIHRoZSBDSSBzZWxmdGVzdCB0aW1l
b3V0IChhbiBpbnB1dCBwYXJhbQ0KdG8gdGhlIGdlbmVyYWxpemVkIGZ1bmMgcHRyIGxvb3ApIHRv
IHNvbWV0aGluZyBtdWNoIGxhcmdlciBzcGVjaWFsbHkgZm9yIGdzYy1wcm94eS13YWl0aW5nLg0K
SG93ZXZlcizCoHNpbmNlIHlvdXIgb3RoZXIgcmV2aWV3IGNvbW1lbnQgYmVsb3cgaXMgdG8gcmVt
b3ZlIHRoZSBnZW5lcmFsaXphdGlvbiwgdGhpcyBjb21tZW50DQp0aGVyZWZvcmUgd2lsbCBub3Qg
bWFrZSBzZW5zZSBzbyBJJ2xsIHJlbW92ZSBpdCBhY2NvcmRpbmdseS4gVGhlIHBvaW50IHdhcyB0
aGF0IENJIG1pZ2h0DQpoYXZlIGEgc3lzdGVtIGxldmVsIHNlbGZ0ZXN0IHRpbWVvdXQgb2Ygc29t
ZXRoaW5nIG11Y2ggc21hbGxlciBsaWtlIDUwMCBtaWxpc2VjcyAodXNlZCB0bw0KaGF2ZSBzb21l
IGNvbnRyb2wgb3ZlciB0aGUgZXhlY3V0aW9uIHRpbWUpLCBidXQgZm9yIHRoZSBnc2MtcHJveHkg
d2FpdGluZywgaXRzIG5vdCBpbiBpOTE1J3MNCmNvbnRyb2wgYnV0IGRlcGVuZHMgb24gdGhlIGtl
cm5lbCBjb21wb25lbnQgZHJpdmVyIGxvYWRpbmcgZmxvdyAoYW5kIGluIHJhcmUgb2NjYXNpb25z
LCBhZnRlcg0KYSBmcmVzaCBJRldJIHdhcyBmbGFzaGVkIHdoaWNoIGNhdXNlcyBhIDEtdGltZSBs
b25nZXIgcGVyaW9kIGZvciBmdy1wcm94eSBmbG93cyB0byBjb21wbGV0ZSkuDQpJbiBhbnkgY2Fz
ZSwgSSdsbCByZW1vdmUgdGhlIGNvbW1lbnQgYXMgcGVyIHlvdXIgZGlyZWN0aW9uLg0KDQo+IA0K
PiA+ICsJaWYgKHRpbWVvdXRfbXMgPCA4MDAwKQ0KPiA+ICsJCXRpbWVvdXRfbXMgPSA4MDAwOw0K
PiA+ICsNCj4gDQoNCmFsYW46c25pcA0KPiA+ICtzdGF0aWMgaW50IF9fd2FpdF9vbl9hbGxfc3lz
dGVtX2RlcGVuZGVuY2llcyhzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqaTkxNSkNCj4gPiArew0K
PiA+ICsJc3RydWN0IF9fc3RhcnR1cF93YWl0ZXIgKndhaXRlciA9IGFsbF9zdGFydHVwX3dhaXRl
cnM7DQo+ID4gKwlpbnQgY291bnQgPSBBUlJBWV9TSVpFKGFsbF9zdGFydHVwX3dhaXRlcnMpOw0K
PiA+ICsJaW50IHJldDsNCj4gPiArDQo+ID4gKwlpZiAoIXdhaXRlciB8fCAhY291bnQgfHwgIWk5
MTUpDQo+ID4gKwkJcmV0dXJuIDA7DQo+IA0KPiBVZ2guDQo+IA0KPiBJZiBpdCBldmVyIGJlY29t
ZXMgYW4gZW1wdHkgYXJyYXkganVzdCB6YXAgdGhpcyB3aG9sZSBjb2RlIGFuZCBub3QgaGF2ZSAN
Cj4gdGhlc2UgY2hlY2tzLg0KQWxhbjogT2theSBzdXJlIC0gd2lsbCByZW1vdmUgdGhlc2UgY2hl
Y2sgZXhjZXB0IHRoZSBpOTE1IC0gc2VlIGJlbG93Lg0KPiANCj4gQWxzbywgbm8gaTkxNSBpcyBh
IHBvc3NpYmlsaXR5Pw0KQWxhbjogaTkxNV9tb2NrX3NlbGZ0ZXN0cyBwYXNzZXMgaW4gTlVMTCBm
b3IgaTkxNS4gVGhpcyBjaGVja2luZyBvZiB0aGUgaTkxNQ0KYWxpZ25zIHdpdGggdGhlIGV4aXN0
aW5nIF9fcnVuX3NlbGZ0ZXN0cyBjb2RlIC0gYnV0IGluIHRoYXQgZnVuY3Rpb24gdGhlDQpwYXJh
bSBpcyBjYWxsZWQgImRhdGEiIGV2ZW50aG91Z2ggaW4gYWxsIGNhbGxlcnMgb2YgX19ydW5fc2Vs
ZnRlc3RzLCB0aGF0DQoiZGF0YSIgaXMgYWN0dWFsbHkgaTkxNSB3aGVuIGl0cyBub3QgbnVsbC4N
Cj4gDQo+IEJ1dCBhY3R1YWxseS4uIHBsZWFzZSBkb24ndCBhZGQgdGhlIGZ1bmN0aW9uIHRhYmxl
IGdlbmVyYWxpemF0aW9uIHVubGVzcyANCj4gaXQgaXMgYWxyZWFkeSBrbm93biBzb21ldGhpbmcg
ZWxzZSBpcyBjb21pbmcgdG8gYmUgcGx1Z2dlZCBpbnRvIGl0Lg0KQWxhbjogT2theS0gSSdsbCBy
ZW1vdmUgaXQuDQoNCmFsYW46c25pcA0KPiANCg0KPiA+IEBAIC0xMzQsNiArMTkzLDggQEAgc3Rh
dGljIGludCBfX3J1bl9zZWxmdGVzdHMoY29uc3QgY2hhciAqbmFtZSwNCj4gPiAgIHsNCj4gPiAg
IAlpbnQgZXJyID0gMDsNCj4gPiAgIA0KPiA+ICsJX193YWl0X29uX2FsbF9zeXN0ZW1fZGVwZW5k
ZW5jaWVzKGRhdGEpOw0KPiANCj4gV2h5IGRvZXMgdGhpcyBuZWVkIHRvIGJlIHRvcCBsZXZlbCBz
ZWxmdGVzdHMgYW5kIG5vdCBqdXN0IGEgd2FpdCBmb3IgDQo+IGludGVsX2dzY191Y19md19wcm94
eV9pbml0X2RvbmUgaW4gdGhlIHRlc3RzIHdoZXJlIGl0IGlzIHJlbGV2YW50LCB2aWEgDQo+IHNv
bWUgaGVscGVyIG9yIHNvbWV0aGluZz8NCkFsYW46IGl0IHdhcyBhbiBvZmZsaW5lIGRlY2lzaW9u
IGJlY2F1c2Ugd2UgZGlkbid0IHdhbnQgdG8gcmVwZWF0DQp0aGUgc2FtZSBjaGVjayBmb3IgYWxs
IHBlcm11dGF0aW9ucyBvZiBzZWxmdGVzdHMnIHN1YnRlc3RzIChpLmUuIGNvbnNpZGVyaW5nDQpt
b2R1bGUgcGFyYW1zIGNhbiBkaWN0YXRlIHRvIHNraXAgc29tZSBzdWJ0ZXN0cyBidXQgZXhlY3V0
ZSBvdGhlcnMpLg0KDQpBbnl3YXlzLCBsZXQgbWUgZ2V0IGJhY2sgdG8geW91IG9uIGhvdyBob3cg
bWFueSBzZWxmdGVzdHMnIHN1YnRlc3RzIGFjdHVhbGx5IGV4Y2VyY2lzZSB0aGUNCm5lZWQgZm9y
IHByb3h5LWluaXQgdG8gY29tcGxldGUgLSBpZiBpdHMganVzdCAxLXRvLTIgc3VidGVzdCBJJ2xs
IG1vdmUgdGhlIHJlbW92ZSB0aGUgY29kZQ0KZnJvbSBoZXJlIGFuZCBtb3ZlIHRoZW0gaW50byB0
aGUgaW5kaXZpZHVhbCBzdWJ0ZXN0cy4NCg0KYWxhbjpzbmlwDQo=
