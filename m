Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C32858CB88
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 17:48:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94BDA10F165;
	Mon,  8 Aug 2022 15:48:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98E0F10E74C;
 Mon,  8 Aug 2022 15:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659973694; x=1691509694;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=/sxkM1XlF/iSNWepqq59WOSlHz5yY6/77NZ7Slz2tYs=;
 b=YfioGYgmlUSK/RkIjMtgE3H5n+PPg6IusQm9kAjcpijQY1PDnLRHANx1
 TmS8rDkr0OhzFmwoh7Dj97GyiaRBAnceNbfabRY/rLz+VDGXAXerhv+xE
 stKl59Jl5vkN2jFrko0CY5qpXMwy/zA9JXK8QJFQKcHuKInZ63fAizSOp
 9bOerG8u22ft/p8BdPMtqntsDxMC9zrO270m5mgRjNKPADwFVokRRNajB
 2/351ehhsBlQuwRksQ9QIq0lRmeqBvVW7He+IA/9OYtuBVIiyYsT+S8OU
 s/4eBkJoikr/PF3DaFop1L7QDSue+E4TOXmG7yuNdfqPzkhll+OYMqtN9 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10433"; a="288190383"
X-IronPort-AV: E=Sophos;i="5.93,222,1654585200"; d="scan'208";a="288190383"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2022 08:48:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,222,1654585200"; d="scan'208";a="672535618"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP; 08 Aug 2022 08:48:06 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 8 Aug 2022 08:48:05 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Mon, 8 Aug 2022 08:48:05 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Mon, 8 Aug 2022 08:48:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ee2wBtG5Mdo9X5eLyUBxg7YiKPI4OwnT8h3nwWHIhv6aN6CSpNkgY+IM6qIIbRpuT3xdtM/T60DiA0QRqrvNxuBGS7htWXR0fiDLkqp6D1mzXP5w5rlJdybZfLh+CM5gnfnjlUvaY0fSOh8Xyrge1ONZZBZ8std34OSAATNpaHBr8gvLA8U/FiLdzkAb7fw1S5K0I/IJYI6XWm+VVeVMzWsTIcjWN5LJI8godu+GGUkeozsYLsyL8lU5FRqJ4N6B9x0ITzOvwrOFH51CgwlGYwtNw5/bxI+0YQ9lVBAgA9g6RE9VJrkQJvOIqKUxkKrAz7Z6VAsJKEIZdmVmv/lGWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/sxkM1XlF/iSNWepqq59WOSlHz5yY6/77NZ7Slz2tYs=;
 b=UpzpYSCiSY3510+A5ayxj1ybNsBxwqfz+FW/z2uCLJIP0y7f+y5Focrle70xl9LnGNl2RJMy3+Lw1TRZpcAYatBGDc3rl44g8OZCY3zhMXKH7XhPJWuLhZEsXJco1h0uh9L9ztlS6NPX0zYl1QtaD5/RF4K8svdmAmf4jqFU4+GTOrYgk7g37eeTgdfSox+OfEswTpn3+X0aJPXyC/c2wFoigJonPz7VzFvYh4jwQVJTg/b4czQ84pkDZtyYHw7GMUPoY+f9MqqUdFswW4TnXfZXsGQfTHPpCgV9UUZOwJ4AeRh+oqjKUGdnVO/5/5zU6itzZMu0uOoAKRcj9l2R2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3114.namprd11.prod.outlook.com (2603:10b6:5:6d::11) by
 BYAPR11MB3477.namprd11.prod.outlook.com (2603:10b6:a03:7c::28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.17; Mon, 8 Aug 2022 15:48:02 +0000
Received: from DM6PR11MB3114.namprd11.prod.outlook.com
 ([fe80::c1e0:f556:b4b2:f786]) by DM6PR11MB3114.namprd11.prod.outlook.com
 ([fe80::c1e0:f556:b4b2:f786%3]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 15:48:02 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "daniel@ffwll.ch" <daniel@ffwll.ch>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "bob.beckett@collabora.com" <bob.beckett@collabora.com>,
 "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "airlied@linux.ie" <airlied@linux.ie>
Subject: Re: [PATCH v5] drm/i915: stop using swiotlb
Thread-Topic: [PATCH v5] drm/i915: stop using swiotlb
Thread-Index: AQHYoQYOzb0CoTFuS0awczhJA9Gioa2lOmuA
Date: Mon, 8 Aug 2022 15:48:02 +0000
Message-ID: <1160a7c31084ab2259088e4bfe88b41ad61c2bcc.camel@intel.com>
References: <20220726153935.2272777-1-bob.beckett@collabora.com>
In-Reply-To: <20220726153935.2272777-1-bob.beckett@collabora.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.3 (3.44.3-1.fc36) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1bdf61a8-40b2-4759-5b2e-08da79556088
x-ms-traffictypediagnostic: BYAPR11MB3477:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nYUJZrcNdATJGE6/vqd+jiKY/ppsdxxH7XTeEg8akyG+5dYwzNh0oq5YZtOQRk9MR14fpljUfb9TPmoZG7g18hwrY9rwJOF4nJBTEPs3OKhkd87kyBb9jblOoLYfMedi6HlJDVQu67HULY3edUrmA9eWeHAsAaYa3e9PH15gIy4uyusnQAYNeTr15zs3Te4khbgBaaeidoyZZHrTMzfPnMqbnxf8jE+Q9J4TiI0bFp0QScnYxk/gvlFcqsKXZwDDnm7vgG8Xz3n79NIt4qJ7KSeGHosvYGwrrk239x3Vj+BdX/S7zEzRC8SrIn35fHc9nLQ3Lgxmf0d/4mttjMrjvKT4GLHepkpsQb/KvpATc5bR16YWPQnGj/0KntUSINR0zEz+xU28y8SOAGwKXIjj3Mh/flACk2+yMJLMlat8vhMSX6+Za74P7meCzu0v615Ky++Cr+hRwaQaaZPBH29KDmRywS20Asamu9Lc4eC8z6Uj5SxmLvbYBxRYo1HeLwjvZ/l65ia2dFlrtK2TEJwCoxgjtDssW798oo2VT0Lws9+76Lu/yXeNiemCffzET7+vxlxcyq0GPbnGjCdu3CHPlhv2t2DTRkDwTV0q/W/i7mxzsKvUky1/se42QeE3G9liR7qgkVkoYW5OS7TLJAIO9r/3/bLO/1RJ6xm3dlO82AlW6G9aQvG7zLP0e8mev8Co7DzQq/jaDntIi5B0X/uQN+eb/IJ93tEpyO3uQdJVJQrOW+sOfj16jUzv3cMCN2dQerFR5HPB3CtxtWB+iVTJGkrp7Rt3nmKgtET5xEr6sgLMKVchgwTzNp2b9Jt0H4uQm75ASss68m9Ae6lja0s5ZQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3114.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(39860400002)(346002)(136003)(366004)(396003)(316002)(54906003)(110136005)(966005)(41300700001)(6512007)(26005)(2906002)(36756003)(6506007)(7416002)(4326008)(66476007)(82960400001)(66556008)(76116006)(66446008)(64756008)(66946007)(8936002)(5660300002)(86362001)(91956017)(6486002)(478600001)(2616005)(83380400001)(71200400001)(38100700002)(186003)(38070700005)(8676002)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UkN1NTRLMmxTQkRjMTJsSWs4eUc3eVY2MkFiUmxoOUJDTHJUOWFySG0rdFpH?=
 =?utf-8?B?SkQ1WHZ4Z2pqL1RncENIdlp0NUp3cCtsNGE2cFZSeFNJVkRnOVhDaEdqKzJE?=
 =?utf-8?B?Q2lhTlh5bENlb0NnZ0kvZWxINklqczVic2htM1UrVUhJbjMyb3dXZm9sQXV1?=
 =?utf-8?B?Rld1U2x3MkxJNHg5dXdZcjcrSjhtY3Y5UllWWEVVQmdnVHBnUWdHME14TkxU?=
 =?utf-8?B?dUtNRThNNXFJSlpuajRCUHlNc0VUWkJkVS95NUVUbU9zekhKNGN6VUtRVlEz?=
 =?utf-8?B?OGJ0QkVOQkZrRDhDekptR08rYUQyZEpIYUt4WHJMS1hienRqVVdicUt3R1RX?=
 =?utf-8?B?aW03dStlR2tINXR6UkdQUjNaWldqUk5ISzhxeEo1UC9hSHlKa3JKY1RNU3k0?=
 =?utf-8?B?MXFsQXY5YzNrSHhjeUJDVnllV0pCTDRqaGlxUmI2VmZsbE1FcndYZmdjbnI3?=
 =?utf-8?B?T3pBOFpkV1pDMXkxZzNzanFhM3pjWDI0eTZxRHN4MW02ZlVvSGZBUVp1QzJo?=
 =?utf-8?B?UVBMakdRY1VvZzliRWRXMWxvalFUQVBMVGJmNjZnS0hPYWFmUS9TS21EeDRp?=
 =?utf-8?B?MVdQNTRXTGMxcEl1RUNSQzhlSW05TmlYZ3h4K3kyNGt2T0hDbjJuUTVlbjVj?=
 =?utf-8?B?bVhqQ3E4dDhaTEF2SVlxbzdISU1KT1ZGazZKM3dtcG9VQmV1NkEwNmFHRVZM?=
 =?utf-8?B?Uk9RWGhZQXdxb2pSbW8yZ3Jsci9iQWlZdGhyUGFRdDROWWMxQXZDeGNKa1E0?=
 =?utf-8?B?SWdqSnJKSW9QbFFjTjZKRlRqdm1lR2piNGJzNWxZS05YLy9FaW4yY0ZVN0JQ?=
 =?utf-8?B?N1VUakFsZVlpTzRYNFdKRWV0eHc5dVNTazZBMlRXQ0tCYlBQSEpHZVNQOXRV?=
 =?utf-8?B?RENtUWM4MGF5MGtGV0FHT29kWlhhZTVVcFltaVIwSW9ERklRVXVKeUFrY0Zp?=
 =?utf-8?B?aVVxVSt4Ym5BTmZBOGxweGJUdHE5ditoYUZDZU5UWlJQd3pMVXhiZ1MrdXhV?=
 =?utf-8?B?c2ZEUjlsckhYS1RNdDVoZGd2allnNEtHYjN6YVVpM2dNaHcySE9yV01RaXI5?=
 =?utf-8?B?L3lBak56YTlXMTRqVW0rSnFCQVZleVF5d3dCNFFESzJHQ3lLeDBOeWFxdU1l?=
 =?utf-8?B?Z2JxcVhEV21RdG9iQktWUHJQcEhxYVRTQTBHWGg3eW9PUVArVVdvenR3RUN0?=
 =?utf-8?B?ZVRtZFBETnN6L0dwYmN1cDNkdlYyVkdyODcrTGVCL3dXVFpwK3Y2UTlEZUdz?=
 =?utf-8?B?eEwxOVV3VWU4M09YM0VhczhGZWFoOXprS29sTGJhQVM1NUd2ZVB0VlFFVTMx?=
 =?utf-8?B?ZHVEY09tM1UxWXRZQjBROW1aZzduQ0pkVzViYWF2alJVK3gzVURoSGZ1TTVB?=
 =?utf-8?B?d0pwd0N0NGhiNEgzTDVqTjc1UkEwM2dXaVZpV3VWNWpJUWhhc25nb1U5emJH?=
 =?utf-8?B?NC96L2JGN2Y4RnpvanlBb3JCb0c2elRXVDd6dUJkOStiNVlnVDZGZVZGNytK?=
 =?utf-8?B?NEFIZE1OenVrbm85MmRJbjJ2aUw5NWsySldwVmY1TlVjeHhUSXM1bHptclRj?=
 =?utf-8?B?RVZ2ZFhIWjRkTUp2OGFsQm9lb1hESmF1NCtwc0dBTmRSdUdSUUdhOS9zZFRj?=
 =?utf-8?B?NVFidC94UW9NcVRlVytuTmh1YmFlOWIyeXFUNkM5aThjcW1aaDZHTkxRRkhq?=
 =?utf-8?B?cTVMbjYrMUQyc09WbjFzZzJJN2srbWFMNnBtWmE1a1RoKzJnS1JKc0hvUm8w?=
 =?utf-8?B?bDNSVW1FV0tDNGkxWmxIQUdDSHlibUdnUkJ5cVVoaGlBdXdlQ3ZmcU5TemxK?=
 =?utf-8?B?VG83NU1WNy9SSGZQNG0yeERHbklpcXdyWHMwdGc0dFF6czY4cmlmUmtKYkYy?=
 =?utf-8?B?dzVjQlZhVEZYVFpFOTRWUVZFVnJSR0dZNUZUckpNRTFtbnI3Z205TjhwSnhM?=
 =?utf-8?B?YVNoenZNeGdzV1JVZGU1OXNRVXp6cjRDbGhLampLdksrcmhvL0RTam5VZ1o1?=
 =?utf-8?B?WlhFQ0Q1dmtWblpTMzliOUdxVmZ5RGpzQnZwVXYrYVJxR1NGSWJjYkdJKy9X?=
 =?utf-8?B?MklkYXd4S2FKTFBMZzRDbW5EM2ZSR0ZNaVlGTCs4R1p1Y3FTS0dYeFJ5WGwx?=
 =?utf-8?B?eW52aWhhOC9jT1QrSGRwa3JmNGpMeEpwenJkU1pWTHNyMFhjVTVENDk0QkN4?=
 =?utf-8?B?VEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E65BA8C01E17C940AB557E12C0CAC992@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3114.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bdf61a8-40b2-4759-5b2e-08da79556088
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2022 15:48:02.4451 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0Odi7V2eRVfLD4e5ahIMGZJZoGpjCIkYm+8H3egLi9YD7xqoq9S1E1R2Qa82mEt96XDe3K2tUXvvIo09ikfwGgMGBVuwE6hWC5LDeR0NAGQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3477
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
Cc: "Ursulin, Tvrtko" <tvrtko.ursulin@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Auld,
 Matthew" <matthew.auld@intel.com>,
 "kernel@collabora.com" <kernel@collabora.com>, "hch@lst.de" <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFtiYWNrIGZyb20gdmFjYXRpb25dDQoNCk9uIFR1ZSwgMjAyMi0wNy0yNiBhdCAxNjozOSAr
MDEwMCwgUm9iZXJ0IEJlY2tldHQgd3JvdGU6DQo+IENhbGxpbmcgc3dpb3RsYiBmdW5jdGlvbnMg
ZGlyZWN0bHkgaXMgbm93YWRheXMgY29uc2lkZXJlZCBoYXJtZnVsLg0KPiBTZWUNCj4gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvaW50ZWwtZ2Z4LzIwMjIwNzExMDgyNjE0LkdBMjk0ODdAbHN0LmRl
Lw0KPiANCj4gUmVwbGFjZSBzd2lvdGxiX21heF9zZWdtZW50KCkgY2FsbHMgd2l0aCBkbWFfbWF4
X21hcHBpbmdfc2l6ZSgpLg0KPiBJbiBpOTE1X2dlbV9vYmplY3RfZ2V0X3BhZ2VzX2ludGVybmFs
KCkgbm8gbG9uZ2VyIGNvbnNpZGVyDQo+IG1heF9zZWdtZW50DQo+IG9ubHkgaWYgQ09ORklHX1NX
SU9UTEIgaXMgZW5hYmxlZC4gVGhlcmUgY2FuIGJlIG90aGVyIChpb21tdSByZWxhdGVkKQ0KPiBj
YXVzZXMgb2Ygc3BlY2lmaWMgbWF4IHNlZ21lbnQgc2l6ZXMuDQo+IA0KPiBDYzogQ2hyaXN0b3Bo
IEhlbGx3aWcgPGhjaEBsc3QuZGU+DQo+IENjOiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3Vs
aW5AbGludXguaW50ZWwuY29tPg0KPiBDYzogVGhvbWFzIEhlbGxzdHJvbSA8dGhvbWFzLmhlbGxz
dHJvbUBpbnRlbC5jb20+DQo+IENjOiBNYXR0aGV3IEF1bGQgPG1hdHRoZXcuYXVsZEBpbnRlbC5j
b20+DQo+IA0KPiB2MjogLSByZXN0b3JlIFVJTlRfTUFYIGNsYW1wIGluIGk5MTVfc2dfc2VnbWVu
dF9zaXplKCkNCj4gwqDCoMKgIC0gZHJvcCBQQUdFX1NJWkUgY2hlY2sgYXMgaXQgd2lsbCBhbHdh
eXMgYmUgPj0gUEFHRV9TSVpFDQo+IHYzOiAtIGFjdHVhbGx5IGNsYW1wIHRvIFVJTlRfTUFYIGlu
IGk5MTVfc2dfc2VnbWVudF9zaXplKCkNCj4gdjQ6IC0gcm91bmQgZG93biBtYXggc2VnbWVudCBz
aXplIHRvIFBBR0VfU0laRQ0KPiB2NTogLSBmaXggY2hlY2twYXRjaCB3aGl0ZXNwYWNlIGlzc3Vl
DQo+IA0KPiBSZXZpZXdlZC1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+DQo+IFJl
dmlld2VkLWJ5OiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPg0KPiBT
aWduZWQtb2ZmLWJ5OiBSb2JlcnQgQmVja2V0dCA8Ym9iLmJlY2tldHRAY29sbGFib3JhLmNvbT4N
Cg0KSG1tLA0KDQpUaGlzIHdob2xlIHRoaW5nIGxvb2tzIGEgYml0IHN0cmFuZ2UgdG8gbWUgc2lu
Y2Ugd2l0aCBTV0lPVExCIGFjdHVhbGx5DQp1c2VkIGZvciBpOTE1LCB0aGUgZHJpdmVyIHNob3Vs
ZCBtYWxmdW5jdGlvbiBhbnl3YXkgYXMgaXQgZG9lc24ndCBkbw0KYW55IGRtYV9zeW5jX3NnX2Zv
cl9jcHUoKSBvciBkbWFfc3luY19zZ19mb3JfZGV2aWNlKCksIGFuZCB0aGUgZHJpdmVyDQphc3N1
bWVzIGFsbCBjb2hlcmVudCBkbWEuIElzIHRoYXQgU1dJT1RMQj1mb3JjZSBrZXJuZWwgb3B0aW9u
IHN0aWxsDQphdmFpbGFibGU/DQoNCkFsc28sIGNvcnJlY3QgbWUgaWYgSSdtIHdyb25nLCBidXQg
dGhlIG9yaWdpbmFsIGRyaXZlciBzZWdtZW50IHNpemUNCmFwcGVhcnMgdG8gbWVhbiAidGhlIGxh
cmdlc3QgY29udGlndW91cyBhcmVhIHRoYXQgY2FuIGJlIGhhbmRsZWQgZWl0aGVyDQpieSB0aGUg
ZGV2aWNlIG9yIHRoZSBkbWEgbWFwcGluZyBsYXllciIgcmF0aGVyIHRoYW4gdGhlIHRvdGFsIHNw
YWNlDQphdmFpbGFibGUgZm9yIGRtYSBtYXBwaW5ncz8gTm90IGNvbXBsZXRlbHkgc3VyZSB3aGF0
DQpkbWFfbWF4X21hcHBpbmdfc2l6ZSgpIGlzIHJldHVybmluZywgdGhvdWdoPw0KDQovVGhvbWFz
DQoNCg0K
