Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EAE5674559
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 23:00:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A6CC10E268;
	Thu, 19 Jan 2023 22:00:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6CEB10E268;
 Thu, 19 Jan 2023 22:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674165643; x=1705701643;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=cihQkSu+12xo3Wz8HZsMUpVxiJ33LCTcbbw/bGvsM6Q=;
 b=MEyhNO1m93HBTU8usDi6r7JJabHkkdAOiDldumRSn7lROz+DNsvqJup9
 PTggGU7/LRwOvnbZAUUu/815kLgeM8vBdxXXJeu3p+PUZIcriZPljSIzq
 AhmmcSSkIO8Oo9ZM2GvhcmCnrVOFs4Qpt4uwic1THo4rW7EeyS2hlV/Rp
 9AUPwmQ6q0JKv3cymGbPoEvLlK4R06fapTXih4/qM7huvL23dO8zbcjlW
 gBZK3t9QGbAfbu0aeP0jy9X+zLlAvk4LDgpAk+UTsNgirRJwZ4MnMQcia
 pszk8HA3qy9Wyoo4dbiGzs2xNlWBbdwduRRt0p7tgiwERIrSB6h2WodUv A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="325476869"
X-IronPort-AV: E=Sophos;i="5.97,230,1669104000"; d="scan'208";a="325476869"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 14:00:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="653545956"
X-IronPort-AV: E=Sophos;i="5.97,230,1669104000"; d="scan'208";a="653545956"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga007.jf.intel.com with ESMTP; 19 Jan 2023 14:00:42 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 19 Jan 2023 14:00:42 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 19 Jan 2023 14:00:41 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 19 Jan 2023 14:00:41 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 19 Jan 2023 14:00:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jEkZKvoiDvlmqYtzWaDhh28jUj0OzoiOB9xv6JhfbP4uwQ/bMqoO6ryfICzFsXdGJMwIrHCxmQOgmDag7/gpOIogRAHTULkBaFCBOM6xxFTAlFvL+tOKPuIlp8wyxYVBODNdNwTltl5JMEVKyVZwjKl33oHwGIEvRHVZVhVhAVruKflPpeFPs26eC8gw0CTFVieZbu/R4v62DfxZRp6F/zCeZfDY296dhrfTmooR5ZlmMFboEHBqf5waLCUkeoDDxnOcUK49X92P72oNq90NdaCxpk5V5S1M85VFZWgDxtMnuw+mArl1w8M+PgspRgX1k9WRvzeUydb3vw86tVcpMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cihQkSu+12xo3Wz8HZsMUpVxiJ33LCTcbbw/bGvsM6Q=;
 b=DZAFTwzKQ8JTpw8NWDiDLjmNGQjUJ0hUN1RcTC2LcldhDXNPEmzkypNqI9PtMzD4ACABuU2jkswOnZoUugz6MIdM1bMCWrBuAcKLGyYGHpEllIvHKS5gfJd7h2Gy0GzVJzjjI0hlaniB1gEX/7PIcEcKV4HWMLQsISSz55sNrFa2gHbxnKpLyerhhH38IS9j7t+EAlW/VCqNaVV6MbpMx3ygri7BZdrHNAQ2zAlhXrGobVKR6n/3B5tw06qP/gj5mvGiIF2Sf0I17cepJaT7UY1UqoXg4frkaOBW6cui02scF31LISz/+3VgjDSI/tkmjpxKkpi+sK8AmCsGA4twFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 SJ0PR11MB6766.namprd11.prod.outlook.com (2603:10b6:a03:47c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Thu, 19 Jan
 2023 22:00:39 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::8901:2af2:6e02:c95c]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::8901:2af2:6e02:c95c%4]) with mapi id 15.20.6002.025; Thu, 19 Jan 2023
 22:00:39 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [Intel-gfx] [PATCH v5 4/6] drm/i915/pxp: Invalidate all PXP fw
 sessions during teardown
Thread-Topic: [Intel-gfx] [PATCH v5 4/6] drm/i915/pxp: Invalidate all PXP fw
 sessions during teardown
Thread-Index: AQHZJu0F2LerbNtFBEiNfDh/fv1vIK6mKnUAgAAqnYA=
Date: Thu, 19 Jan 2023 22:00:39 +0000
Message-ID: <12bb17e66e5baf3207035230564bee941dca1974.camel@intel.com>
References: <20230113011850.1463965-1-alan.previn.teres.alexis@intel.com>
 <20230113011850.1463965-5-alan.previn.teres.alexis@intel.com>
 <Y8mZxg0FvcGWy9RV@intel.com>
In-Reply-To: <Y8mZxg0FvcGWy9RV@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|SJ0PR11MB6766:EE_
x-ms-office365-filtering-correlation-id: a40798fd-ef6f-4ff3-5484-08dafa689a0b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4bNAKLy7ZEpfFba6tk8olVIklx6NZC/uo9u2CN0KYaOJJKPgkXt98J1BXpBEusUZ6FTYxadxj05i4QqhWQM3Ibs4uc5pQoPBQVeqmavYHLMvV/Zxvjcfjjfopl4pgd1s06fvDyAPPryTQW7S1J8eUYvO2b9PrU61pS//HtgYF6xLpgc94r0YMJHp80z7o3CtXLUzjOW1KE/RNx6XMfqSF8EAEOBZrFizUSrZxZJtXKP8nmfAdaq6o73E7/84bQnM023yaMvaFa46EjntBuuV1CPRaqCyLs7lCKatF3CbXSXdEj/6yIyoDGVCV9AZdOeI9f4F0+TtZ2Xr3Z7lccpCRvqnDM27HzonVbjxwNlqG7rh3jnRQ7JVvhudMszV/iBEScBgImIHN6BEdGks9V+aXYctteFTMaqglpZ86TbmYrlBGl+w8pDrM90U5MpiL4672lbucTpsBZZRVVyUPiSw9NtPQTxrC9uzJDk8AgLOQ5xpcon1TndyEYgyroU3r0y8j57nenVprtePkTxgwejyZzffEaILCjS4oooQtWox7KKDNi4fqw4qYgHr/nuOaTsrKhvZarGKd0jqnTmjuYAewCYq9gmRTsBN1ny+mc5ojQvHYJLdsY/xmkqF1EADJ5tmmDMsxzq27f4qNkdNAh2zuXI4+H63AlbNm0AFfxrTmaSE8enDtIG+Mw+WsMia6xx1
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(136003)(39860400002)(396003)(346002)(366004)(451199015)(478600001)(86362001)(66556008)(122000001)(66946007)(2906002)(91956017)(6862004)(8936002)(5660300002)(66476007)(82960400001)(76116006)(38100700002)(316002)(6636002)(54906003)(107886003)(37006003)(71200400001)(38070700005)(6506007)(6486002)(36756003)(26005)(64756008)(8676002)(4326008)(66446008)(41300700001)(2616005)(186003)(6512007)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MnJ4VXdldHBGWjRjMlNtVW5ZWElPYnhSaWJzeXVrZGMzMDlwVGNpcy9FZU5T?=
 =?utf-8?B?NHl4bERVeGl4WCs5eTFpY0xPREZINzExTkJrbTc2RkZRZFlJT3VrTTlqcS9N?=
 =?utf-8?B?MGdKYVNxbFF4L3REZFBNdkU1NlQyc0dYajlhNVNiQ3IwbUM4TmZDNjJLT3lS?=
 =?utf-8?B?YzZHbm5JTDVzR1BWaitEM1JIbjZyWmNsdENZSnRSTm9OMjVhZGczTFRiRTQv?=
 =?utf-8?B?a2ozKytzd0plZjRaTDJlRzZ2MHVSRk5wTG4rWkVkQXRjNXhWdkpsZGRTQ0Vl?=
 =?utf-8?B?d1hWd3RVdEZpOXFqcmh4YXpyNFBJOWZ4L2xxWS9EeHdQbFdCcVliSWxnRVcw?=
 =?utf-8?B?K3MyZ3creUYydW1lTFpwV05aZ1dKZi9PVUkzRTBvTGcwaVJEMTZoNmNyM28x?=
 =?utf-8?B?SzZ3UVpadmN0MzNxUkppa1A4MmJwMUlsVnlnemkyZ1RmSWZ6cG5UVVNjcWdO?=
 =?utf-8?B?Qk5ERkRtcFltYlpvWUdZenhqYWFVVVNhZ0tMTmJGNnUwK0ZXV0N0Wm1ianM2?=
 =?utf-8?B?b3JVU2NZR0J3dDhYa1lBamVLaXB3SE9uUEFnaWxlaGhWdzNrdlM0Q2t4SkZX?=
 =?utf-8?B?RTZ6aTl6Qk5kR0swMjFGRjl3UmlEVGVNSEJzL1FtRmRTV2ZRbUZ1R1MzTUdm?=
 =?utf-8?B?Y0p0blp3a0o1SXRzeHBjd284eWVYT3piWXlIeXRKSWhjZmFNaHBkd1hBZ1lw?=
 =?utf-8?B?OXRqUEw5elZnbG50RmNyR2UxMCtOVjhtMXlqNlhBUTdiTk5pKzZ2SzF6Rm5F?=
 =?utf-8?B?WlNlTEEwNzJ0ZzRXZHpmMHByc0phMW9OTVZkM05HRnhtUXlDMWdGZ3g0TkFz?=
 =?utf-8?B?VzdOVmp2STJkc05BSEY4V2JSaVU5d3I4dFlNL1ZialR0dHltTldHbHo5L0pk?=
 =?utf-8?B?Rlh1VW82RjEyaWVEa0dXRStMdDViQWMraTFaaVd5em9MUlEzMVRlUko0bHJ5?=
 =?utf-8?B?cmtJSG51a1dvNGMxTnJCK21IcXMwZ1dPTCsvNXNOT3U0QlRnMlBRSi9UQTVY?=
 =?utf-8?B?Q1Z1TmtBS1dGWGdWTTJ5WEVkdUFWeDZ0d0thdDFxcU0ybWlrVFN5ODZseGlu?=
 =?utf-8?B?cmhVR2YyUmdpbHQyZTRzNUFSVjNIeGFKN1NuZ1hwK0NYVFJPQWVJNjVJQnJL?=
 =?utf-8?B?SnNrbllsTG8wcjRmMlZLNVVCeG4rbGcvS0oxdFQxWnRUeitqV2NRaDVuU0lD?=
 =?utf-8?B?UFJkS25Mc0h5cEQxRTV6RGhWYlNhUkwzOVZCTUJXbnIvbzFqOXg4eXZSeVhk?=
 =?utf-8?B?amhtOUk5dzR6KytKdU9wOFh0aStHSmUwMkFiYmtHd1UyNkJVTkJDNHU5VnQ3?=
 =?utf-8?B?UEZkU0dkVE1qeWpRcFZkYVJDeEVaaVlzWkpwempYcWFpUkFVUnpjdGdYS0pY?=
 =?utf-8?B?Mm9oRkZjejYzZmZ3L1gwU2hqNXcxWFI5UlJ4NzJDQkVCY2xNRHRqb2lPbkRS?=
 =?utf-8?B?ZW9ua2k1T3o3YlFWNG9RMnF2WTVsTHg1VE5mMU8yS082TlN1czhuMmZkOXgw?=
 =?utf-8?B?bHRTVDEyMzdOTEVBTDRwcytCV3NHNlkzRThQRjIzdUtCRzY5R1JMQ3FSZWpl?=
 =?utf-8?B?cEJ6aEI0R3dTVld5YXpZSkRDQUkvb1U3clVQUmVhR1lmazNKVUtiR3JoeG90?=
 =?utf-8?B?aGU2Q09veGdNUjl3UHp1cXN0SUlpV1hNa01Hd2gyNTZpWGNMZXh0YWs0ZHps?=
 =?utf-8?B?Vk5aYk1OSVJyTWJBZGpkNVYzeExhUWtuSVlnbUVhbU9wY1BpV2czOFl5UVlz?=
 =?utf-8?B?THhUNkNVd3M0WVl2cHRueW92dGlzOTVYTkQ2bkNyUld2emhaNVZTSXhQWFRE?=
 =?utf-8?B?akIvNDhpMGhxZ045Rll6d0w3aElYdjNyTFlNSE1qc3EvbHNxWXgvYkVxMnRJ?=
 =?utf-8?B?YjBiczBVbVRSS0VuTnA3ZlBXUmJ5MmhqanptM2p0blhnbDJoaUs1MitaZzBi?=
 =?utf-8?B?cWFBb2xLRkZRUGFwRUd5Ky9tck02TGtHWlQyWlZQc0IyRys4cHE4aXh2dTFT?=
 =?utf-8?B?V0RLWlEzQXEvRnplVjVOSEU5Z3o3NFlqWHFLck1XT0UrT1RVYVAxSTFMV216?=
 =?utf-8?B?UlZwQkRKV2ZyT1E3RkhiRW5lQUlpYUxEbFpaejVGZDV3K3pib0Z1WG5SWWxx?=
 =?utf-8?B?ejU0UnhoVzZjdjRmbEVDcmhSWWpkQU5iYXk3TisrL1JyT0dmS3RWN0dHZHJr?=
 =?utf-8?Q?lNo05s65KrDM8YLccM4GiB5rlvyJ10tbxRWqT3Tui6b6?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ED67DC8437290745AD331D36612DE235@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a40798fd-ef6f-4ff3-5484-08dafa689a0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 22:00:39.3854 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V+GiW0pMSMwC9RURVhGKafmV7hpqfFzM7GhEJjay4f7xrricQtxiIpOqY1+6z5eNtAOIX8f662JFjUMHLWZRM1RmA2kLRKG2HEge970T1RvLCr9BNYKslIxqypHgPXLn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6766
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
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Usyskin,
 Alexander" <alexander.usyskin@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Vivi@freedesktop.org" <Vivi@freedesktop.org>, "Winkler,
 Tomas" <tomas.winkler@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhhbmtzIFJvZHJpZ28gZm9yIHRoZSBhY2suDQoNCk9uIFRodSwgMjAyMy0wMS0xOSBhdCAxNDoy
OCAtMDUwMCwgVml2aSwgUm9kcmlnbyB3cm90ZToNCj4gT24gVGh1LCBKYW4gMTIsIDIwMjMgYXQg
MDU6MTg6NDhQTSAtMDgwMCwgQWxhbiBQcmV2aW4gd3JvdGU6DQo+ID4gQSBnYXAgd2FzIHJlY2Vu
dGx5IGRpc2NvdmVyZWQgd2hlcmUgaWYgYW4gYXBwbGljYXRpb24gZGlkIG5vdA0KPiA+IGludmFs
aWRhdGUgYWxsIG9mIHRoZSBzdHJlYW0ga2V5cyAoaW50ZW50aW9uYWxseSBvciBub3QpLCBhbmQg
dGhlDQo+ID4gZHJpdmVyIGRpZCBhIGZ1bGwgUFhQIGdsb2JhbCB0ZWFyZG93biBvbiB0aGUgR1Qg
c3Vic3lzdGVtLCB3ZQ0KPiA+IGZpbmQgdGhhdCBmdXR1cmUgc2Vzc2lvbiBjcmVhdGlvbiB3b3Vs
ZCBmYWlsIG9uIHRoZSBzZWN1cml0eQ0KPiA+IGZpcm13YXJlJ3Mgc2lkZSBvZiB0aGUgZXF1YXRp
b24uIGk5MTUgaXMgdGhlIGVudGl0eSB0aGF0IG5lZWRzDQo+ID4gZW5zdXJlIHRoZSBzZXNzaW9u
cycgc3RhdGUgYWNyb3NzIGJvdGggaUdUIGFuZCBzZWN1cml0eSBmaXJtd2FyZQ0KPiA+IGFyZSBh
dCBhIGtub3duIGNsZWFuIHBvaW50IHdoZW4gcGVyZm9ybWluZyBhIGZ1bGwgZ2xvYmFsIHRlYXJk
b3duLg0KPiA+IA0KPiA+IEFyY2hpdGVjdHVyYWxseSBzcGVha2luZywgaTkxNSBzaG91bGQgaW5z
cGVjdCBhbGwgYWN0aXZlIHNlc3Npb25zDQo+ID4gYW5kIHN1Ym1pdCB0aGUgaW52YWxpZGF0ZS1z
dHJlYW0ta2V5IFBYUCBjb21tYW5kIHRvIHRoZSBzZWN1cml0eQ0KPiA+IGZpcm13YXJlIGZvciBl
YWNoIG9mIHRoZW0uIEhvd2V2ZXIsIGZvciB0aGUgdXBzdHJlYW0gaTkxNSBkcml2ZXINCj4gPiB3
ZSBvbmx5IHN1cHBvcnQgdGhlIGFyYml0cmF0aW9uIHNlc3Npb24gdGhhdCBjYW4gYmUgY3JlYXRl
ZA0KPiA+IHNvIHRoYXQgd2lsbCBiZSB0aGUgb25seSBzZXNzaW9uIHdlIHdpbGwgY2xlYW51cC4N
Cj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbGFuIFByZXZpbiA8YWxhbi5wcmV2aW4udGVyZXMu
YWxleGlzQGludGVsLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogSnVzdG9uIExpIDxqdXN0b25saUBj
aHJvbWl1bS5vcmc+DQo+IA0KPiBBY2tlZC1ieTogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlA
aW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvcHhwL2ludGVs
X3B4cC5owqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAxICsNCj4gPiDCoC4uLi9kcm0vaTkxNS9weHAv
aW50ZWxfcHhwX2NtZF9pbnRlcmZhY2VfNDIuaCB8IDE1ICsrKysrKysrDQo+ID4gwqAuLi4vaTkx
NS9weHAvaW50ZWxfcHhwX2NtZF9pbnRlcmZhY2VfY21uLmjCoMKgwqAgfMKgIDMgKysNCj4gPiDC
oGRyaXZlcnMvZ3B1L2RybS9pOTE1L3B4cC9pbnRlbF9weHBfc2Vzc2lvbi5jwqAgfMKgIDIgKysN
Cj4gPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L3B4cC9pbnRlbF9weHBfdGVlLmPCoMKgwqDCoMKg
IHwgMzUgKysrKysrKysrKysrKysrKysrKw0KPiA+IMKgNSBmaWxlcyBjaGFuZ2VkLCA1NiBpbnNl
cnRpb25zKCspDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L3B4
cC9pbnRlbF9weHAuaCBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L3B4cC9pbnRlbF9weHAuaA0KPiA+
IGluZGV4IDA0NDQwZmFkYTcxMS4uOTY1OGQzMDA1MjIyIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L3B4cC9pbnRlbF9weHAuaA0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L3B4cC9pbnRlbF9weHAuaA0KPiA+IEBAIC0yNCw2ICsyNCw3IEBAIHZvaWQgaW50ZWxf
cHhwX2luaXRfaHcoc3RydWN0IGludGVsX3B4cCAqcHhwKTsNCj4gPiDCoHZvaWQgaW50ZWxfcHhw
X2ZpbmlfaHcoc3RydWN0IGludGVsX3B4cCAqcHhwKTsNCj4gPiDCoA0KPiA+IMKgdm9pZCBpbnRl
bF9weHBfbWFya190ZXJtaW5hdGlvbl9pbl9wcm9ncmVzcyhzdHJ1Y3QgaW50ZWxfcHhwICpweHAp
Ow0KPiA+ICt2b2lkIGludGVsX3B4cF90ZWVfZW5kX2FyYl9md19zZXNzaW9uKHN0cnVjdCBpbnRl
bF9weHAgKnB4cCwgdTMyIGFyYl9zZXNzaW9uX2lkKTsNCj4gPiDCoA0KPiA+IMKgaW50IGludGVs
X3B4cF9zdGFydChzdHJ1Y3QgaW50ZWxfcHhwICpweHApOw0KPiA+IMKgDQo+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L3B4cC9pbnRlbF9weHBfY21kX2ludGVyZmFjZV80Mi5o
IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvcHhwL2ludGVsX3B4cF9jbWRfaW50ZXJmYWNlXzQyLmgN
Cj4gPiBpbmRleCA3MzlmOTA3MmZhNWYuLjI2ZjdkOWYwMWJmMyAxMDA2NDQNCj4gPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9weHAvaW50ZWxfcHhwX2NtZF9pbnRlcmZhY2VfNDIuaA0KPiA+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L3B4cC9pbnRlbF9weHBfY21kX2ludGVyZmFjZV80
Mi5oDQo+ID4gQEAgLTEyLDYgKzEyLDkgQEANCj4gPiDCoC8qIFBYUC1PcGNvZGUgZm9yIEluaXQg
U2Vzc2lvbiAqLw0KPiA+IMKgI2RlZmluZSBQWFA0Ml9DTURJRF9JTklUX1NFU1NJT04gMHgxZQ0K
PiA+IMKgDQo+ID4gKy8qIFBYUC1PcGNvZGUgZm9yIEludmFsaWRhdGUgU3RyZWFtIEtleSAqLw0K
PiA+ICsjZGVmaW5lIFBYUDQyX0NNRElEX0lOVkFMSURBVEVfU1RSRUFNX0tFWSAweDAwMDAwMDA3
DQo+ID4gKw0KPiA+IMKgLyogUFhQLUlucHV0LVBhY2tldDogSW5pdCBTZXNzaW9uIChBcmItU2Vz
c2lvbikgKi8NCj4gPiDCoHN0cnVjdCBweHA0Ml9jcmVhdGVfYXJiX2luIHsNCj4gPiDCoMKgwqDC
oMKgwqDCoMKgc3RydWN0IHB4cF9jbWRfaGVhZGVyIGhlYWRlcjsNCj4gPiBAQCAtMjUsNCArMjgs
MTYgQEAgc3RydWN0IHB4cDQyX2NyZWF0ZV9hcmJfb3V0IHsNCj4gPiDCoMKgwqDCoMKgwqDCoMKg
c3RydWN0IHB4cF9jbWRfaGVhZGVyIGhlYWRlcjsNCj4gPiDCoH0gX19wYWNrZWQ7DQo+ID4gwqAN
Cj4gPiArLyogUFhQLUlucHV0LVBhY2tldDogSW52YWxpZGF0ZSBTdHJlYW0gS2V5ICovDQo+ID4g
K3N0cnVjdCBweHA0Ml9pbnZfc3RyZWFtX2tleV9pbiB7DQo+ID4gK8KgwqDCoMKgwqDCoMKgc3Ry
dWN0IHB4cF9jbWRfaGVhZGVyIGhlYWRlcjsNCj4gPiArwqDCoMKgwqDCoMKgwqB1MzIgcnN2ZFsz
XTsNCj4gPiArfSBfX3BhY2tlZDsNCj4gPiArDQo+ID4gKy8qIFBYUC1PdXRwdXQtUGFja2V0OiBJ
bnZhbGlkYXRlIFN0cmVhbSBLZXkgKi8NCj4gPiArc3RydWN0IHB4cDQyX2ludl9zdHJlYW1fa2V5
X291dCB7DQo+ID4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IHB4cF9jbWRfaGVhZGVyIGhlYWRlcjsN
Cj4gPiArwqDCoMKgwqDCoMKgwqB1MzIgcnN2ZDsNCj4gPiArfSBfX3BhY2tlZDsNCj4gPiArDQo+
ID4gwqAjZW5kaWYgLyogX19JTlRFTF9QWFBfRldfSU5URVJGQUNFXzQyX0hfXyAqLw0KPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9weHAvaW50ZWxfcHhwX2NtZF9pbnRlcmZh
Y2VfY21uLmggYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9weHAvaW50ZWxfcHhwX2NtZF9pbnRlcmZh
Y2VfY21uLmgNCj4gPiBpbmRleCBjMmYyMzM5NGY5YjguLjY5ZTM0ZWM0OWU3OCAxMDA2NDQNCj4g
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9weHAvaW50ZWxfcHhwX2NtZF9pbnRlcmZhY2Vf
Y21uLmgNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9weHAvaW50ZWxfcHhwX2NtZF9p
bnRlcmZhY2VfY21uLmgNCj4gPiBAQCAtMjcsNiArMjcsOSBAQCBzdHJ1Y3QgcHhwX2NtZF9oZWFk
ZXIgew0KPiA+IMKgwqDCoMKgwqDCoMKgwqB1bmlvbiB7DQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqB1MzIgc3RhdHVzOyAvKiBvdXQgKi8NCj4gPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoHUzMiBzdHJlYW1faWQ7IC8qIGluICovDQo+ID4gKyNkZWZpbmUgUFhQ
X0NNREhEUl9FWFREQVRBX1NFU1NJT05fVkFMSUQgR0VOTUFTSygwLCAwKQ0KPiA+ICsjZGVmaW5l
IFBYUF9DTURIRFJfRVhUREFUQV9BUFBfVFlQRSBHRU5NQVNLKDEsIDEpDQo+ID4gKyNkZWZpbmUg
UFhQX0NNREhEUl9FWFREQVRBX1NFU1NJT05fSUQgR0VOTUFTSygxNywgMikNCj4gPiDCoMKgwqDC
oMKgwqDCoMKgfTsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgLyogTGVuZ3RoIG9mIHRoZSBtZXNzYWdl
IChleGNsdWRpbmcgdGhlIGhlYWRlcikgKi8NCj4gPiDCoMKgwqDCoMKgwqDCoMKgdTMyIGJ1ZmZl
cl9sZW47DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L3B4cC9pbnRlbF9w
eHBfc2Vzc2lvbi5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvcHhwL2ludGVsX3B4cF9zZXNzaW9u
LmMNCj4gPiBpbmRleCBhZTQxMzU4MGI4MWEuLjc0ZWQ3ZTE2ZTQ4MSAxMDA2NDQNCj4gPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9weHAvaW50ZWxfcHhwX3Nlc3Npb24uYw0KPiA+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L3B4cC9pbnRlbF9weHBfc2Vzc2lvbi5jDQo+ID4gQEAgLTEx
MCw2ICsxMTAsOCBAQCBzdGF0aWMgaW50IHB4cF90ZXJtaW5hdGVfYXJiX3Nlc3Npb25fYW5kX2ds
b2JhbChzdHJ1Y3QgaW50ZWxfcHhwICpweHApDQo+ID4gwqANCj4gPiDCoMKgwqDCoMKgwqDCoMKg
aW50ZWxfdW5jb3JlX3dyaXRlKGd0LT51bmNvcmUsIFBYUF9HTE9CQUxfVEVSTUlOQVRFLCAxKTsN
Cj4gPiDCoA0KPiA+ICvCoMKgwqDCoMKgwqDCoGludGVsX3B4cF90ZWVfZW5kX2FyYl9md19zZXNz
aW9uKHB4cCwgQVJCX1NFU1NJT04pOw0KPiA+ICsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgcmV0dXJu
IHJldDsNCj4gPiDCoH0NCj4gPiDCoA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9weHAvaW50ZWxfcHhwX3RlZS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvcHhwL2ludGVs
X3B4cF90ZWUuYw0KPiA+IGluZGV4IGJlZjZkN2Y4YWM1NS4uOWUyNDdmMzhmM2JkIDEwMDY0NA0K
PiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L3B4cC9pbnRlbF9weHBfdGVlLmMNCj4gPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9weHAvaW50ZWxfcHhwX3RlZS5jDQo+ID4gQEAgLTMx
MSwzICszMTEsMzggQEAgaW50IGludGVsX3B4cF90ZWVfY21kX2NyZWF0ZV9hcmJfc2Vzc2lvbihz
dHJ1Y3QgaW50ZWxfcHhwICpweHAsDQo+ID4gwqANCj4gPiDCoMKgwqDCoMKgwqDCoMKgcmV0dXJu
IHJldDsNCj4gPiDCoH0NCj4gPiArDQo+ID4gK3ZvaWQgaW50ZWxfcHhwX3RlZV9lbmRfYXJiX2Z3
X3Nlc3Npb24oc3RydWN0IGludGVsX3B4cCAqcHhwLCB1MzIgc2Vzc2lvbl9pZCkNCj4gPiArew0K
PiA+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICppOTE1ID0gcHhwLT5j
dHJsX2d0LT5pOTE1Ow0KPiA+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCBweHA0Ml9pbnZfc3RyZWFt
X2tleV9pbiBtc2dfaW4gPSB7MH07DQo+ID4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IHB4cDQyX2lu
dl9zdHJlYW1fa2V5X291dCBtc2dfb3V0ID0gezB9Ow0KPiA+ICvCoMKgwqDCoMKgwqDCoGludCBy
ZXQsIHRyaWFscyA9IDA7DQo+ID4gKw0KPiA+ICt0cnlfYWdhaW46DQo+ID4gK8KgwqDCoMKgwqDC
oMKgbWVtc2V0KCZtc2dfaW4sIDAsIHNpemVvZihtc2dfaW4pKTsNCj4gPiArwqDCoMKgwqDCoMKg
wqBtZW1zZXQoJm1zZ19vdXQsIDAsIHNpemVvZihtc2dfb3V0KSk7DQo+ID4gK8KgwqDCoMKgwqDC
oMKgbXNnX2luLmhlYWRlci5hcGlfdmVyc2lvbiA9IFBYUF9BUElWRVIoNCwgMik7DQo+ID4gK8Kg
wqDCoMKgwqDCoMKgbXNnX2luLmhlYWRlci5jb21tYW5kX2lkID0gUFhQNDJfQ01ESURfSU5WQUxJ
REFURV9TVFJFQU1fS0VZOw0KPiA+ICvCoMKgwqDCoMKgwqDCoG1zZ19pbi5oZWFkZXIuYnVmZmVy
X2xlbiA9IHNpemVvZihtc2dfaW4pIC0gc2l6ZW9mKG1zZ19pbi5oZWFkZXIpOw0KPiA+ICsNCj4g
PiArwqDCoMKgwqDCoMKgwqBtc2dfaW4uaGVhZGVyLnN0cmVhbV9pZCA9IEZJRUxEX1BSRVAoUFhQ
X0NNREhEUl9FWFREQVRBX1NFU1NJT05fVkFMSUQsIDEpOw0KPiA+ICvCoMKgwqDCoMKgwqDCoG1z
Z19pbi5oZWFkZXIuc3RyZWFtX2lkIHw9IEZJRUxEX1BSRVAoUFhQX0NNREhEUl9FWFREQVRBX0FQ
UF9UWVBFLCAwKTsNCj4gPiArwqDCoMKgwqDCoMKgwqBtc2dfaW4uaGVhZGVyLnN0cmVhbV9pZCB8
PSBGSUVMRF9QUkVQKFBYUF9DTURIRFJfRVhUREFUQV9TRVNTSU9OX0lELCBzZXNzaW9uX2lkKTsN
Cj4gPiArDQo+ID4gK8KgwqDCoMKgwqDCoMKgcmV0ID0gaW50ZWxfcHhwX3RlZV9pb19tZXNzYWdl
KHB4cCwNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJm1zZ19pbiwgc2l6ZW9mKG1zZ19pbiksDQo+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgICZtc2dfb3V0LCBzaXplb2YobXNnX291dCksDQo+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIE5VTEwpOw0KPiA+ICsNCj4gPiArwqDCoMKgwqDCoMKgwqAvKiBDbGVh
bnVwIGNvaGVyZW5jeSBiZXR3ZWVuIEdUIGFuZCBGaXJtd2FyZSBpcyBjcml0aWNhbCwgc28gdHJ5
IGFnYWluIGlmIGl0IGZhaWxzICovDQo+ID4gK8KgwqDCoMKgwqDCoMKgaWYgKChyZXQgfHwgbXNn
X291dC5oZWFkZXIuc3RhdHVzICE9IDB4MCkgJiYgKyt0cmlhbHMgPCAzKQ0KPiA+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBnb3RvIHRyeV9hZ2FpbjsNCj4gPiArDQo+ID4gK8KgwqDC
oMKgwqDCoMKgaWYgKHJldCkNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZHJt
X2VycigmaTkxNS0+ZHJtLCAiRmFpbGVkIHRvIHNlbmQgdGVlIG1zZyBmb3IgaW52LXN0cmVhbS1r
ZXktJWQsIHJldD1bJWRdXG4iLA0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgc2Vzc2lvbl9pZCwgcmV0KTsNCj4gPiArwqDCoMKgwqDCoMKgwqBlbHNl
IGlmIChtc2dfb3V0LmhlYWRlci5zdGF0dXMgIT0gMHgwKQ0KPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBkcm1fd2FybigmaTkxNS0+ZHJtLCAiUFhQIGZpcm13YXJlIGZhaWxlZCBp
bnYtc3RyZWFtLWtleS0lZCB3aXRoIHN0YXR1cyAweCUwOHhcbiIsDQo+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2Vzc2lvbl9pZCwgbXNnX291dC5o
ZWFkZXIuc3RhdHVzKTsNCj4gPiArfQ0KPiA+IC0tIA0KPiA+IDIuMzkuMA0KPiA+IA0KDQo=
