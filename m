Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8867EA2CA
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 19:26:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9071E10E0D9;
	Mon, 13 Nov 2023 18:26:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB53610E0D9
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 18:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699899972; x=1731435972;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2CjMuGPic+IEtIWqSAqHo0M74x1DWAlZ8h9d/AN7v+M=;
 b=ishuAVmaSrQ32KUJYuKepzYhGS4zgJxzHOwmo8YQ2Nz2Aybo+dtbblpW
 YCWb77Y/i3nYRL+qTar0htRj7nQKV9dervreioCefoEOtFmIsQ1AxRQKh
 lXFzACsZ/dcHZ3NBZuGN3qomt/EFMA28sy/WlOlT9BhzbY+eiBMaQQBHz
 1UsFOj4jwYRe2hJIjhvfYtPKEHDyeInPIRLOqQHOJHLKXgxXbMriVwbQJ
 ilqYRboAPxYOMj3FufJ+jtUWEWXCxr2+PI7be/99tu4fWOTpfJNBGfFoQ
 KTBMy7NQ8EF9UU0yJOWcHzKAXMEGl4dIpDTrhabh5NHnbne2Fvv434tg1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="389349746"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="389349746"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 10:25:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="908116602"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="908116602"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Nov 2023 10:25:59 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 13 Nov 2023 10:25:58 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 13 Nov 2023 10:25:58 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 13 Nov 2023 10:25:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TKdQuJaRVOhIMe9+K4cFz1ZoVKgiRZf1PrGTlUaiyhhfsePWYr+Ruf8mDYownL6J1H9ROcdpEsgvvKbOgoKlQPlYsNO7GjC96ICYM+0Xjo3ehTGdtNikMcTuScOHOFN2P55w7TGza1Fiu6LpVOfXFqk5N+kmJcF3IcN93gqGJO3EvMkn7HPcxPiTarnJf+LpyU3oyHU2P47ldtNVaSMpzW+JQs3lGJwz3zRZDoQTN44dpao02c1QdB7vT+S/qurNgVB0Z8QF9RDQaYOGi/EiB2AJ6RQxw+GNVnZJ5hn1KzbonlmyPtoJpeG339OHQUTBuVf1ckUEey8n6uG7i/SRvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2CjMuGPic+IEtIWqSAqHo0M74x1DWAlZ8h9d/AN7v+M=;
 b=T7LC1A3JwXrr1A8FuN8v1jK+vxGmGpUMwKDTt953i19qMQ9eT/znGALjpaL18TK9NcGpLTZhLr7stlid6ntyIAjB/OnWm9WJ9CHZ5gJ49ERb8VAX/IFkOU4TJOsdek1p7HwDc5Jb7h4UHkIVYGAIZ8AHfF48F8DhtKqY3e8ixhWiam3sWHu1nomzIbck79dfGl31jcUCbP/69dVMBfQDnIhsIJ80ma1lZAhkq3qKndLle0fYRfMk4XSxXb3O6h+ow3uKDjmEeRJImXpVfuBv8kR9RScF+x0n2juvtXkZx1zF0quPIY3zJSKzRBQn2Ps1Zfsr6kBF6wHkW3mns6QB4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH8PR11MB6879.namprd11.prod.outlook.com (2603:10b6:510:229::22)
 by DS7PR11MB7905.namprd11.prod.outlook.com (2603:10b6:8:ed::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.22; Mon, 13 Nov
 2023 18:25:55 +0000
Received: from PH8PR11MB6879.namprd11.prod.outlook.com
 ([fe80::908d:4fdf:abf6:c6f6]) by PH8PR11MB6879.namprd11.prod.outlook.com
 ([fe80::908d:4fdf:abf6:c6f6%6]) with mapi id 15.20.6977.029; Mon, 13 Nov 2023
 18:25:55 +0000
From: "Kim, Dongwon" <dongwon.kim@intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [RFC PATCH v2 1/1] drm/virtio: new fence for every plane update
Thread-Topic: [RFC PATCH v2 1/1] drm/virtio: new fence for every plane update
Thread-Index: AQHZ9Zi0A+Y/RdCIRkiBrXvK5F+qy7BXbHsAgABTHpCAIO6TgIAAGfAA
Date: Mon, 13 Nov 2023 18:25:54 +0000
Message-ID: <PH8PR11MB6879F8FB8A0B898207E503EFFAB3A@PH8PR11MB6879.namprd11.prod.outlook.com>
References: <20231003010013.15794-1-dongwon.kim@intel.com>
 <20231003010013.15794-2-dongwon.kim@intel.com>
 <675400bf-74fb-8495-b2b8-3ff717979369@collabora.com>
 <PH8PR11MB687986353C7E238B2298897EFAD8A@PH8PR11MB6879.namprd11.prod.outlook.com>
 <0185fa33-b0c7-194b-d44f-3d6ac967c4b5@collabora.com>
In-Reply-To: <0185fa33-b0c7-194b-d44f-3d6ac967c4b5@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6879:EE_|DS7PR11MB7905:EE_
x-ms-office365-filtering-correlation-id: 352677a1-02aa-422a-f9ca-08dbe475f96c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FagBdsvurs9RCUElf7ERSURfbsGuZC3q47z0cbZFKDImnrLLVX9d5RANH6mbXZ8HcccvzV2khPA5wt3Lg8ICUagSosz0UTj0PhTYZRlQzIdoE2FMZom7r13rx4QEe4ypJAOnkkfVyUVNK5fjIs7mRU012yex12greV0k9waIdrcD72fWhbdlZ7cKXx9IGB9hFq61WqvHhA1ZLX0TMfiC2Cyvku0PaUYft912/yDSAgYUN9ijypjHaE4HvMRf3aGtOaDr/3YCYYbhGpZEF6pC1iAPTToeX7GvR1/GSxgCMM1m5N39KTwOW7s2Npc7Ic7skv2tD/zcH7qs0essehH22LjYjon1+Uw73PNhHqHJZaTJ5XHJRBn3neb6P/nU4ZUYiJ4y47Ih/r5FDhdFi6s2Ysz2r8k2I7h2RjyIowDyA8tZYF8rEUdJStByBLhKy+miHk41FIVYxHXZKJP6EYXbffPSW8vHQXSXmoRYAcYn5CEsgl9GgkDvSZJ7KvRR/yFe3lQNCkxbTKT1G+RjawJEm8ky+ZOg3zMAU0kHoA/7XQx0rFjog3QTT5U0/GlWnRt/G9csZ4/cQKiYG1cFeGiFqIQjwFC4Dx9tByB+BSaR7WI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6879.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(136003)(366004)(376002)(346002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(38070700009)(33656002)(55016003)(86362001)(82960400001)(122000001)(83380400001)(38100700002)(26005)(478600001)(107886003)(71200400001)(9686003)(53546011)(7696005)(6506007)(110136005)(8676002)(4326008)(8936002)(316002)(76116006)(66556008)(66946007)(54906003)(66476007)(66446008)(64756008)(5660300002)(41300700001)(15650500001)(2906002)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZnJkY0lnOE43RVJzb20veUNPTUJya1krUzdvMmFlL01zOVZ2Q2tBam9uYnpl?=
 =?utf-8?B?WGhYTkc5ajI2MGVFL2RKUmIzMnM3Zko0VG9OeXhlNTFibDhnUjYycEpySG5z?=
 =?utf-8?B?MHZNd0VWZmRSY0xKTDc4YW5ycmwzZFc2bmQ5Q1M0aWJKNHBIeGU4NGpQTzNP?=
 =?utf-8?B?b0lBbDA3dU5ZNE43YkhBK3V5aHMrVWNwRWszSmt4MUN3ampjK3dZL2tBT1dw?=
 =?utf-8?B?ZlVuWFJmTEszdUxlWlpETnZJalNTUS9raGxuRDRDSzBHVWJTcFAzZU00VUZk?=
 =?utf-8?B?NGVwbERGSG9aQzBZMThUMGFRQlZGU2R2ZXc2VDlDeXhnOTN4Yys0clA1U3BL?=
 =?utf-8?B?dk1jMDBIcThvdEJhTE1BbGh2Vi9jQjFZRkVKeC9NVWFQWUIzd0tVWlpDd3hq?=
 =?utf-8?B?Z0VGSVo2VVhWTHYzazZCMWlWZmxGSU9LM2xaQUUwek1ua3ZNNDU1Ym9nZ2Yv?=
 =?utf-8?B?ZVlPN0JId0o2OWEyWnVkRlA1M0MvSTNrUkdRejlCOWJZdit1YzNJazhhV0FY?=
 =?utf-8?B?aXhuOU5PN3pvN2pySzFMNU5wczhXY0tsbnFHS005bEM4emhpdGIrSlBYUEpa?=
 =?utf-8?B?N1NTSENyS1VHL1c3TzFWdFQyQmZYNVZMS3ZjeU0vR2NWRmpFbCsrUW5tNDAx?=
 =?utf-8?B?dGFUOTZEOHU0VThGeU90SWV5YkhrOUVpMGpBQW5qTU4rYjZkbzVvQ3JheHE3?=
 =?utf-8?B?VDVTeVZkVXdzSzNUYnFCUmpmdkVyanNJMXVZMmVLcWV2b1krUlU5MzlmUmU2?=
 =?utf-8?B?WTJUZWFDdFhUc3RUdFdCQWRxMVBtWDZBT2NMUjlHVGdENE9BdW85SGRHUzg2?=
 =?utf-8?B?NG1xemVjeG45d2hCTDc0cE5DVTVPQUZCNnNLZXcwZUFUWFdnZGc3amV2aUh1?=
 =?utf-8?B?Q1N2WVpvS0ZMT3VuejNXKzZOWTV0WTUzeEpMaHR2TlBWSDJXMzJGWDhsZlFl?=
 =?utf-8?B?ZzhCT3pPN0RWRFhrRTZOMFpieWFCeVlqU09MblV0MFMwNGFxbUI4akpKbnFp?=
 =?utf-8?B?aTBLaFlpRW15TktuZGt2NHFPR0pzcWUrSnlvNGFYcG1CL0U3OXZ5WnFmSnNt?=
 =?utf-8?B?MVVTWEpMRmV4Y0FIakdZZnBxOUtPQTFLWE9hTDhMNnl6bVdjdlpkaWlzWS9l?=
 =?utf-8?B?c0hEa1FhWVRoMHh5TFVSZlFNZ01zRjRJT2hWN2pSZk90ZXFvck1td2VuSm1E?=
 =?utf-8?B?QXZ1Nngyd04yc3FoYlJKYTdSWUdBdzRTWUg4WlhJQTBmSjZmV3UyUnR6YWxi?=
 =?utf-8?B?bFFkQm02dXQ0bFl1ZWxxUDNOT0szYTI5OGdUZFczYmt2Sk1reVNvNTYwb0FG?=
 =?utf-8?B?YWg5V2ZMbUcxK0hwQTJMVkI4NXpNbXAxL2p5eWFqc0Y3dzA5MHFlQmErVkRK?=
 =?utf-8?B?VG5malB4Wjh0bG9oaEhjSEFoZFJBRC8wbDRBN2tJUjliUEpEc1VGWWtSNkg1?=
 =?utf-8?B?LzdnZzJWVWlZQnp5bS9NSk90TVcybDZYc1FYRk5TM0ppT2Z4bDlOdVdiRG1q?=
 =?utf-8?B?MXRrSTVJOXo2WGY5VDZHaS9Jdm0wVUtmMTN1SmFDUGxKbVRyWmNHQ0xCWldV?=
 =?utf-8?B?VXJRU0dVQTdPRWdmQTlnQUVSbFRzdnVnd3NmN3VLT29hc212S042QllDYXNs?=
 =?utf-8?B?eTZzbURNMUlPMm1tREZZdnNkVlprZ2lMbDBnRTVOeEFVZE9pcSt0TFZjTEVp?=
 =?utf-8?B?aU95R3EzYlNtcldTRm5ZcHJhbnF0dlN3MW5TZUJUOUN1QlVhRW01QmRUdzBr?=
 =?utf-8?B?TE1pK0VmZzZHZ0lUOGdPZlFaL1B4dUszeTVGNm9JV0FPZ1ZXQ3ZodmUvUlNJ?=
 =?utf-8?B?YndPbUYxZFdkSllRVnEwL2RRS0d6TU1JdE1FZ1I5dFBGU0Q5VkNSMTBvOWhK?=
 =?utf-8?B?TkZ1Yml1M3kzUmZGMEh0UVlvV0hzNUN2QlFnQ0xjZ25Fam00ZmUwOGRaRGp4?=
 =?utf-8?B?L1lVaGZpL0ROWDAyME9reTF0M3VCQ1Uxa1Q1d1VnU21nMUkrRjhEYnFTUUJV?=
 =?utf-8?B?eWJjb2ZjaXZCUEtOMFhXVVU5US8xUUJva1d0OWxlQ1o0Wkp6cWRhMC9hL1pq?=
 =?utf-8?B?MDBTYk9ORmx4QUpVOWFmQ3BGVjBnMlp1SDN1TzRlYXlVNHNIUlZib05DY29V?=
 =?utf-8?Q?UnFtuukY2nG/r73FaUqspGgpz?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6879.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 352677a1-02aa-422a-f9ca-08dbe475f96c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2023 18:25:54.9926 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uY93NALzKfSlfxnEaZ/+yQWf/QkfybGpSldBKap8PSQmio4l7MSJ7r6eovVVZCNX3tc1HiJ3IE1IlzsGLTOihg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7905
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
Cc: "kraxel@redhat.com" <kraxel@redhat.com>, "Kasireddy,
 Vivek" <vivek.kasireddy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRG1pdHJ5LA0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRG1p
dHJ5IE9zaXBlbmtvIDxkbWl0cnkub3NpcGVua29AY29sbGFib3JhLmNvbT4NCj4gU2VudDogTW9u
ZGF5LCBOb3ZlbWJlciAxMywgMjAyMyA4OjE2IEFNDQo+IFRvOiBLaW0sIERvbmd3b24gPGRvbmd3
b24ua2ltQGludGVsLmNvbT47IGRyaS0NCj4gZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+
IENjOiBrcmF4ZWxAcmVkaGF0LmNvbTsgS2FzaXJlZGR5LCBWaXZlayA8dml2ZWsua2FzaXJlZGR5
QGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtSRkMgUEFUQ0ggdjIgMS8xXSBkcm0vdmlydGlv
OiBuZXcgZmVuY2UgZm9yIGV2ZXJ5IHBsYW5lIHVwZGF0ZQ0KPiANCj4gT24gMTAvMjMvMjMgMjA6
MzEsIEtpbSwgRG9uZ3dvbiB3cm90ZToNCj4gLi4uDQo+ID4+IFBsZWFzZSB3cml0ZSBhIGd1aWRl
IGhvdyB0byB0ZXN0IGl0LiBBcmUgeW91IHVzaW5nIHNwaWNlIGZvciB0aGUNCj4gPj4gbXVsdGkt
ZGlzcGxheSB2aWV3ZXI/DQo+ID4NCj4gPiBbRFddIFllYWgsIGxldCBtZSBjb21lIHVwIHdpdGgg
YSBzaW1wbGUgdGVzdCBjYXNlLiBTbyB3ZSB1c2UgdmlydGlvLWdwdSBhcw0KPiBLTVMgZGV2aWNl
LiBJdCBpcyB1c2VkIHRvIHNoYXJlIHRoZSBndWVzdCBmcmFtZSB3aXRoIFFFTVUuDQo+ID4gU1BJ
Q0UgaXMgb25lIG9mIGNsaWVudCBzb2x1dGlvbnMgd2UgdXNlIGJ1dCB3ZSBwcmltYXJpbHkgdXNl
IFFFTVUgR1RLLVVJDQo+IHcvIG11bHRpIGRpc3BsYXlzIChRRU1VIHdpdGggdGhpcyBwYXJhbXMg
Jy1kZXZpY2UgdmlydGlvLQ0KPiB2Z2EsbWF4X291dHB1dHM9MixibG9iPXRydWUnKS4NCj4gPiBU
aGFua3MhDQo+IA0KPiANCg0KPiBJJ20gaGF2aW5nIHRyb3VibGUgd2l0IGggcmVwcm9kdWNpbmcg
dGhlIGlzc3VlLiBGb3IgR1RLLVVJIHlvdSBzaG91bGQgYmUNCj4gdXNpbmcgdmlydGlvLXZnYS1n
bCwgc2hvdWxkbid0IHlvdT8NCg0KW0tpbSwgRG9uZ3dvbl0gDQpJIHdhcyB0cnlpbmcgdG8gcmVw
bGljYXRlIHRoZSBpc3N1ZSB3aXRoIG1vcmUgZ2VuZXJhbCBjYXNlIGFzIG91ciBzb2x1dGlvbiAt
IE1lc2Ega21zcm8gKGlyaXMgdy8gcmVuZGVyIHRhcmdldCBpbXBvcnRlZCBmcm9tIHZpcnRpby1n
cHUpLCB1c2luZyANCmk5MTUgZm9yIHJlbmRlci1vbmx5IGRldmljZSBhbmQgdmlydGlvLWdwdSBh
cyBhIGRpc3BsYXkgb25seSBkZXZpY2UgLWh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9t
ZXNhL21lc2EvLS9tZXJnZV9yZXF1ZXN0cy85NTkyDQpoYXNuJ3QgYmVlbiB1cHN0cmVhbWVkIHll
dC4gQnV0IEkgZ290IG5vIGx1Y2suIFdoYXQgSSB0cmllZCB3YXMgTWVzYSAtIHN3LXJhc3Rlcml6
ZXIgKyB2aXJ0aW8tZ3B1IGFuZCBpdCB3b3JrZWQganVzdCBmaW5lIHdpdGhvdXQgYW55IGlzc3Vl
Lg0KSSB0aGluayB0aGUgcmVhc29uIHdvdWxkIGJlIHNvbWUgdGltaW5nIGRpZmZlcmVuY2UuIFRo
ZSBwcm9ibGVtIGhhcHBlbnMgd2hlbiBhIGN5Y2xlIG9mIHByZXBhcmUtPnVwZGF0ZS1wbGFuZS0+
Y2xlYW51cCBpcyBvdmVybGFwcGVkIHdpdGggYW5vdGhlciwNCmJ1dCB0aGF0IGRpZG4ndCBzZWVt
IHRvIGhhcHBlbiBpbiB0aGUgdGVzdCBjYXNlcyBJIHRyaWVkLg0KDQo+IA0KPiBJIGFzc3VtZSB5
b3UgbWVhbnQgdGhhdCB5b3VyIHNpbXBsZSBjYXNlIGlzIHJlcHJvZHVjaWJsZSB1c2luZyBkR1BV
LA0KPiBjb3JyZWN0PyBJIG5lZWQgYSB0ZXN0IGNhc2UgdGhhdCBpcyByZXByb2R1Y2luZyB1c2lu
ZyB2aXJnbCBhbmQgbm8gZEdQVS4NCg0KW0tpbSwgRG9uZ3dvbl0gDQpXZSB1c2UgaUdQVSBvbmx5
LiBBbmQgd2UgZG9u4oCZdCB1c2UgdmlyZ2wuIFdlIGVuYWJsZWQgU1ItSU9WIG9uIGlHUFUgc28g
dmlydHVhbCBtYWNoaW5lIGNhbiBzZWUgaXQgYXMgYSBkZWRpY2F0ZWQgSFcgYW5kIGl0IGNhbiBy
dW4NCkhXIGRyaXZlciAoaTkxNSArIElyaXMpIG9uIGl0LiAgDQoNCj4gDQo+IFVzaW5nIHZpcnRp
by12Z2EtZ2wrdmlyZ2wrbWF4X291dHB1dHM9MiBJIGRvbid0IHNlZSBhbnkgaXNzdWVzLiBJbiB0
aGUgc2FtZQ0KDQpbS2ltLCBEb25nd29uXSANClllYWgsIHRoaXMgbWFrZXMgbWUgdGhpbmsgYWdh
aW4gdGhlIHByb2JsZW0gY2FuIGJlIHJlcGxpY2F0ZWQgb25seSBpbiBvdXIgY3VycmVudCBzZXR1
cCAtIElyaXMvaTkxNSArIHZpcnRpby1ncHUgYW5kIHplcm8gY29weQ0KdmlydGlvLWdwdSBkaXNw
bGF5IHNoYXJpbmcgKGJsb2I9dHJ1ZSkNCg0KPiB0aW1lIHN3aXRjaGluZyB0byB0aGUgc2Vjb25k
IHZpcnR1YWwgZGlzcGxheSBkb2Vzbid0IHdvcmsgd2l0aCBRZW11J3MgR1RLIFVJLA0KPiBJJ20g
Z2V0dGluZyBibGFjayBzY3JlZW4gZm9yIHRoZSBzZWNvbmQgZGlzcGxheS4gSW4gdGhlIEtERSBz
ZXR0aW5ncyBJIGhhdmUgdHdvDQo+IGRpc3BsYXlzIGFuZCBpdCBzYXlzIGJvdGggYXJlIGFjdGl2
ZS4gRm9yIHRoZSBmaXJzdCBkaXNwbGF5IHRoYXQgd29ya3MsIEkgZG9uJ3QNCj4gc2VlIHdyb25n
IGZyYW1lcyBvcmRlcmluZy4NCg0KW0tpbSwgRG9uZ3dvbl0gDQpZb3UgbWVhbiB5b3Ugc3dpdGNo
ZWQgdG8gdGhlIHNlY29uZCB2aXJ0dWFsIGRpc3BsYXkgYnkgY2hhbmdpbmcgYmV0d2VlbiB0YWJz
PyBUaGVyZSB3ZXJlIHNvbWUgaXNzdWUgd2l0aCBHVEstVUkgcmVnYXJkaW5nDQp0YWIgaGFuZGxp
bmcuIEkgZml4ZWQgc29tZSBvZiB0aGVtLiBXaGF0IHZlcnNpb24gb2YgUUVNVSBhcmUgeW91IHVz
aW5nPyBIYXZlIHlvdSB0cmllZCB0aGUgbGF0ZXN0IG9uZSBsaWtlID4gOC4wPw0KDQpXcm9uZyBv
cmRlcmluZyBvZiBmcmFtZSBpcyBhY3R1YWxseSB3aGF0IHRoZSBvdGhlciBwYXRjaCAtIGRybS92
aXJ0aW86IGRybV9nZW1fcGxhbmVfaGVscGVyX3ByZXBhcmVfZmIgZm9yIG9iaiBpcyBzb2x2aW5n
Lg0KVGhlIHByb2JsZW0gdGhpcyBwYXRjaCBpcyB0cnlpbmcgdG8gc29sdmUgaXMgY29tcGxldGUg
bG9jayB1cCBvZiB2aXJ0dWFsIGRpc3BsYXkgdXBkYXRlIGFuZCBmZW5jZSB0aW1lb3V0IGVycm9y
cyAoaTkxNSkgb24gdGhlIGRtZXNnLiANCg0KQW55d2F5LCBJIGp1c3QgY2FuJ3Qgc2F5IHRoZSBw
cm9ibGVtIEkgaGF2ZSBiZWVuIHRyeWluZyB0byBzb2x2ZSBjYW4gaGFwcGVuIG9uIG1vc3Qgb2Yg
Z2VuZXJhbCBjYXNlcyBidXQgd291bGRuJ3QgaXQgbWFrZXMgc2Vuc2UNCnRvIHlvdSB0aGF0IHRo
ZSBmZW5jZSBzaG91bGQgYmUgYXNzaWduZWQgcGVyIHBsYW5lIHVwZGF0ZSBpbnN0ZWFkIG9mIEZC
IGluIGdlbmVyYWw/IEhhdmluZyBmZW5jZSBwZXIgcGxhbmUgdXBkYXRlIGlzIHdvcmtpbmcgaW4g
dGhlDQpzYW1lIHdheSBhcyBiZWZvcmUgYnV0IGl0IHByZXZlbnRzIGFueSBwb3RlbnRpYWwgaXNz
dWUgbGlrZSBvdXIgY2FzZS4gDQoNCj4gDQo+IFBsZWFzZSBnaXZlIG1lIGEgdGVzdCBjYXNlIHRo
YXQgaXMgcmVwcm9kdWNpbmcgdXNpbmcgbGF0ZXN0IHZlcnNpb24gb2YNCj4gdmFuaWxsYS91cHN0
cmVhbSBRZW11Lg0KPiANCj4gLS0NCj4gQmVzdCByZWdhcmRzLA0KPiBEbWl0cnkNCg0K
