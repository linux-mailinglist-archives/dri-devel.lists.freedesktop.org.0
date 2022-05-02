Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2065179EA
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 00:24:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90B9110EAAD;
	Mon,  2 May 2022 22:23:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1908910EA1F;
 Mon,  2 May 2022 22:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651530236; x=1683066236;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=G5XKsnaYfiwca8jMLxCaSIcoWjuHHby+5Mc7NqQ2kxE=;
 b=WWAZha90ORa2G3VJ4QLBilL4yMf68A52spShgGLrfaEWIuJ5pAeIC948
 zI6p8LMLAm7bVZ/LI5tIN9L7OcU3iwfcn6RgAfVrGWNLKCzlzRWBgTuZ8
 b4/Uvi/OqW/lHOUXy4estDydhk0jTGlcQ2gFFuBlVi4QWFXniz1yevbmr
 mL16XMw1QjOxXVro0ZxvAnDWHzfNISDgp483DkYuJ9rHgKDK77CCqfwEG
 UK5KGQCuQLVWrhN+77BfJAKWsNGjWQik8V+2onxjssWwu24/gm6l8V9v3
 vxxl9jR+qsVHKdhThYMvLe8c6Kq0vWBl4foVaJALK2F2S48qIOygP0jM9 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="266931845"
X-IronPort-AV: E=Sophos;i="5.91,193,1647327600"; d="scan'208";a="266931845"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 15:23:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,193,1647327600"; d="scan'208";a="536074985"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP; 02 May 2022 15:23:55 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 2 May 2022 15:23:55 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 2 May 2022 15:23:54 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 2 May 2022 15:23:54 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 2 May 2022 15:23:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GNWbEvEZYFc544MbBH9KeBEzIs28kmT64vbr0a0uyYYXByaSZOhPSSfbEfO2jn72lTNVDKABWVdna9mHSeZzHNFVzy3Vds12vI7ipB+tDOvAH6ThMrhMluzHvMWsG5Vx4Di6kXjlKnLIdD3XLLEaFabdlZszqRhYNn6MGPdS8NV31erLufI/JK1wm0/t6keTYCeI1bklJH8CT9IFX0O6DOshrmZNijd/hHiLyOTbSVh48DK7jL8PBWO5EOWTqE4OaVcaAiQKd5ItF6swlJvWckkd3cC1wjIQ0DRw56xEz53R4d2VzbRBF2I+Hm82Hzi1Y2biqGL2gWYxJXv+tHuZLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G5XKsnaYfiwca8jMLxCaSIcoWjuHHby+5Mc7NqQ2kxE=;
 b=TZpiToMCChlZvfiQOk7YYA5g9OPLES4PeJrAbu4dnMRfznyVOFhIQNy46HOq/aYImLC2QpsHctypdmqcsdaJJlnxga0ie8LQLr8E4hi2kvW/DqpeAjkZ38HAfSlzsZtwXpPVIS4velaXCjNiH0Y6Xm3MPqx+aNWnYirrhnavOf6y8r0Za3ICOXgVPOccVc+pY2BC7FLoECXGKvivU/GRY44y6NG3egmheThMZTRsoYuKornSaUVFMpgzh+f2SGHtVRtB8DiNyktMupvNwp3WYCudXvdsf8NVOJ4349tuKizPZH6d6ElpQAW9aSSNkH1DLNXhi9Tnd93Yu34+LzGBBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 BYAPR11MB3143.namprd11.prod.outlook.com (2603:10b6:a03:92::32) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.24; Mon, 2 May 2022 22:23:52 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::bc45:8f18:bea9:46d8]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::bc45:8f18:bea9:46d8%5]) with mapi id 15.20.5206.014; Mon, 2 May 2022
 22:23:52 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH 09/11] drm/i915/pvc: Reset support for new
 copy engines
Thread-Topic: [Intel-gfx] [PATCH 09/11] drm/i915/pvc: Reset support for new
 copy engines
Thread-Index: AQHYXkKRMRQMmpaC6UCvFxw68mC1ta0MJP0A
Date: Mon, 2 May 2022 22:23:52 +0000
Message-ID: <b82181408961aa51432f24419d982eea7725501c.camel@intel.com>
References: <20220502163417.2635462-1-matthew.d.roper@intel.com>
 <20220502163417.2635462-10-matthew.d.roper@intel.com>
In-Reply-To: <20220502163417.2635462-10-matthew.d.roper@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 80c66612-5e67-465e-b047-08da2c8a7045
x-ms-traffictypediagnostic: BYAPR11MB3143:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BYAPR11MB31438A70731540998DD2E03196C19@BYAPR11MB3143.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VJDjKtLV+IKF0iUykUO4sZp3jirdKtxOAHkQ0SLRB4owfmouaZLoWXUZxtnrSVnyT+2OSz0mCaAvTXf8giWO+sMzKCF0uNfvEcZE5MSd2nyXwwWSlLkr9aheEoy9LiHCwj1RKRwUpLwABLvbFZtPGsRtCVm5kCqyN5nk/AaktdanFTSACX9NW3wnNgOmXdeMJv/0WKUO/ip/fAQ3kYqe9kWAODSOD7107CE9EOHq9mHpPlEUX+kCuOTD1xHOMgH/4s379RVRTxvcCeVL6An/JZ2QkATVB5y/+C9njteiJiPL3PxGj0F3qPQ956/ptxVeLfjHWO5j4QQItL8l3SFzrIBfue3Wt/GDLhq4265eMOI3OR/iOoUsRp1J4URsNOGhJyTFhE2xycXzhfHMxiiG0UcSMeiGhYXrIPbiR/wyUNAIfxS+JsAQX9vr8u+lE2rC2dX4Eq0rEBfhx8hCIltzQkX3jIjVawoC7m9rrBWMH8TOqvU0sVd1Boscwgb7FX5UpHERVeB1CBLxP4Hfe1253nsyaBII4yV/ldrmF5Jt1G5/tN3WmW55QDPdTXO9NwGGskSbHrU7DsG7J/OYvWKOI+Uwz8lpOBcfomG6ZcUsNojfnpwMEIsZdPEHm+UmaCEKODUEmzkLbBT3mfxCxCDudyqWoi/BNR6HV0jMEbvq9E0UiigD+NPRqUFZtxIzb9KKMUIPzSvH8HF9XxSmHeQCbg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(86362001)(36756003)(110136005)(83380400001)(2616005)(71200400001)(26005)(6512007)(316002)(6506007)(38100700002)(66556008)(66476007)(66446008)(64756008)(8936002)(66946007)(76116006)(508600001)(450100002)(91956017)(38070700005)(5660300002)(2906002)(8676002)(4326008)(6486002)(82960400001)(122000001)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UENtN3pxbHJiQ1RVUjFlLzNDQ1h2Z1Zjc2NBRGd1YVFsTTNOYzhZU2VuUVFa?=
 =?utf-8?B?QzRUdFZnTDdHY0MyRXNmemRRMTRtNzdHMjNoWWRvRHh3cUJPVGIxQlhFTVFM?=
 =?utf-8?B?ZjEwTlg4UkxJT1JJQWpoNkR4NUY3UTBJZ1pTeDJTT2Q0clRMWEJYdTNKaDFE?=
 =?utf-8?B?elV2NVN1cUNMTjJMYWM2ZzkwSGtGd1g2ZERFNlQrMWdIcDZiOVQwWnFXc0V6?=
 =?utf-8?B?ZW9Fa25NRDdYa1BTdmgzOC9kL3VJWFB0NHE3NXE3bk9PZE9UV3VnbVQzTUtJ?=
 =?utf-8?B?R3NaR1RLRm1EdnM0ell4QWo5eDBXMGdnY21vbVF6QTM1OU1MS0V1UUgzTlFC?=
 =?utf-8?B?a09rWGdEdmd1bXdGbU1IcHl6NzlmMHJ4aUx0MkJoYys1OTFGbkJ0RFNqZzJk?=
 =?utf-8?B?MmdSVmZaT200dnZhSzJ6S3ZJV2pnNVQ2SEZUellJNGp3VDZmNmFhbzVnZEVt?=
 =?utf-8?B?RTNmVG4wczZyWmFjdGZCTjQrako3eG96bFh2aU5WK2ZSQ25DT2tzbHczRC92?=
 =?utf-8?B?U2g4dFpSdHg0RGNCL0psd0RQTm9kbGRvOG9wdnVLSEw3OG9ObTQwRGNaZm5n?=
 =?utf-8?B?anNiUW5wekVrY1NxZFM5YUNPY2hHK1g4UFZvODgyVWYyVHBxUEZrR0p6RUZ4?=
 =?utf-8?B?VDZzNW5qbVZNS3BjWHV5V3RYQ2JLaFN3NGMzckdzY3dTaS83UEJoUm1yMCtH?=
 =?utf-8?B?TklrOXlWMEI4QVp4ZHJDQzVreHo4SWNKeldTR0ZhamkwT05TdmJLYWd6MnBn?=
 =?utf-8?B?cHZ4TDd6T29tQ0IrSEFJN0djTERVcEVGa01uYS9IWVNpSVFiZEI0TmdpdTFJ?=
 =?utf-8?B?YXRDZ3FoWmQ2b3Y1OEwvakVEK1NXeER5bVZuR2psdTV2ZXdnc1ZEWFUvK2Fy?=
 =?utf-8?B?T0J5cE1qNmJKUzd2RmJ4ejYxVnRxYnZFNUZKWWZYVHhNT21EcGpWL2kzcWUr?=
 =?utf-8?B?b09zckdrUzNtY1lZb2dCYjlBa0pmMDJLUmFhUU5FZ1F0YTBGKytjUGxSREVk?=
 =?utf-8?B?bW1XVzlJV1dyQ0ttY1VveUxTM2pyVGVNdzdJMUtIM0VyODZGMFZUK2pPREt4?=
 =?utf-8?B?amhnRFAxU2RuY1NJWTduK1F0NWNvVVQwV3hrK3NLYU1LWkpBa1JML3dYVWFh?=
 =?utf-8?B?aVFmeWNSbmFiMHJsdXdSL2F4bStGZTBTeGVMUWZLSDRxUEdlYnJQYkZyd2hR?=
 =?utf-8?B?d3RDQXVucmlmS0tCWU1IMUZYYk1zSEViRVFuRXdzLzREcktGejJKWkt3OFV6?=
 =?utf-8?B?RS94cmZwQW5HQWhDK0N1OVgxNGROWDYwUVkwdldRZ3hxNGlkUkxtcDRRV3Zj?=
 =?utf-8?B?NHh2OHk2KzdEM1FGZ3lIblpVek5pK1dsSmxWVlM4N2orRitNVFg1ejF0dDlH?=
 =?utf-8?B?bEtneGRwNVJtNGdDNUM2K1gwdTJCVnRnQ2VBUXl5RTZST0NqaDRxSzdPKzJQ?=
 =?utf-8?B?cXczZldCa0VVWWZKczRGOFpzRlZ2ejVzbHMySWhHdFJhRWtEcjVkOUM5c3ZL?=
 =?utf-8?B?NlM0NkJubkNiSDRZcy83THF3SE53Q0ZSM0dydHNLUVVxNzdIOGs0MVV0U2dv?=
 =?utf-8?B?S2dMV3l3bGhlZmR3WDhWS1AvaFhRZ1lHeHZEa1UraXF6dVVTa25rSEM2ZGNN?=
 =?utf-8?B?VXlNa1B2Q1lKcFg1dDNBWUR1RW9MbUtRd215MXlOamkyVGoxU09SdWRaMzIz?=
 =?utf-8?B?cHlVTWNTRHplYzYvK0gxaTV2WjRrOVlWWXlSNW9JSWpDOGxFMjRLcDhMbFBr?=
 =?utf-8?B?aHpwdGVwaHFLVHk0UVU2YytMWVBqemIxbVlWczdlcTdtQ3NSUUhUM1NDbk9C?=
 =?utf-8?B?dDZ4VU1HbldCRklNbnhlOC8vZC9OODJwaTdIcGMwcXRPTFZZdFRQOHFnRHhR?=
 =?utf-8?B?dHNJVC9ZRWRGVmQyK3cvdWZndHVkZTNoQzl4RjhPVS9WekNZR3VpZXl5cHhn?=
 =?utf-8?B?WFFRMVh5bnlVY0VJaVNJR2RJMVYxNCt0Sjg0cDR1TGVXOHo3OXh1bWFBSkZz?=
 =?utf-8?B?OGhUS3VSUmU5RHZhVit2eUZzSDk1SnBrUW9jM201SS9wSnlGUHE4SnYwd2Yz?=
 =?utf-8?B?ZG5QM1UrLzRJYm5QUk5tcG43N2dtMDZHUFpCRFdVVEU2K1cxZ2Vpa2pzT2Iv?=
 =?utf-8?B?WGtIOTZPUHZEeHB3MlVpZmFnNUtHbStRRFMxTzdIdE1WRXVlUUZnZkt3L2w5?=
 =?utf-8?B?MVlBdHJpRFZUcVJwWkkrak03YU1sU2grNm9NcWNTQ1hUOFhjdm11cmFiR1Rh?=
 =?utf-8?B?NTZ0SXMwSUVybXdDSS9VYlUrNVd6ZkhaSGEzeHpHMWQ1RlFhc2lTZmh3MHc4?=
 =?utf-8?B?K3pFWlZMTElFRjFJRzJERHBTZUo2bnRxZ2VtVjVmL3F6enFOZUwwZDV2UFRz?=
 =?utf-8?Q?zaQ1sl0JAg6SsDxw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <152B9335255DDB45BE7DA206B5682E30@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80c66612-5e67-465e-b047-08da2c8a7045
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2022 22:23:52.6914 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uM6TaDuo97lb0HeDx6mgAERS2GdagyDIYp+IJtID+71MtOiH+e3bM/AG1eXM98nBHOTCqlgYn89aNfFHh7mIxSYvOqcoguU5k9TgEGrDoKE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3143
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

T24gTW9uLCAyMDIyLTA1LTAyIGF0IDA5OjM0IC0wNzAwLCBNYXR0IFJvcGVyIHdyb3RlOg0KPiBU
aGlzIHBhdGNoIGFkZHMgdGhlIHJlc2V0IHN1cHBvcnQgZm9yIG5ldyBjb3B5IGVuZ2luZXMNCj4g
aW4gUFZDLg0KPiANCj4gQnNwZWM6IDUyNTQ5DQo+IE9yaWdpbmFsLWF1dGhvcjogQ1EgVGFuZw0K
PiBTaWduZWQtb2ZmLWJ5OiBNYXR0IFJvcGVyIDxtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29tPg0K
DQpSZXZpZXdlZC1ieTogU3R1YXJ0IFN1bW1lcnMgPHN0dWFydC5zdW1tZXJzQGludGVsLmNvbT4N
Cg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2VuZ2luZV9jcy5jIHwg
IDggKysrKysNCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2d0X3JlZ3MuaCAgIHwg
NDQgKysrKysrKysrKysrKy0tLS0tLQ0KPiAtLS0tDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDM0IGlu
c2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2d0L2ludGVsX2VuZ2luZV9jcy5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3QvaW50ZWxfZW5naW5lX2NzLmMNCj4gaW5kZXggNDUzMmMzZWE5YWNlLi5jNmU5M2RiMTM0
YjEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2VuZ2luZV9j
cy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2VuZ2luZV9jcy5jDQo+
IEBAIC0zOTAsNiArMzkwLDE0IEBAIHN0YXRpYyB1MzIgZ2V0X3Jlc2V0X2RvbWFpbih1OCB2ZXIs
IGVudW0NCj4gaW50ZWxfZW5naW5lX2lkIGlkKQ0KPiAgCQlzdGF0aWMgY29uc3QgdTMyIGVuZ2lu
ZV9yZXNldF9kb21haW5zW10gPSB7DQo+ICAJCQlbUkNTMF0gID0gR0VOMTFfR1JET01fUkVOREVS
LA0KPiAgCQkJW0JDUzBdICA9IEdFTjExX0dSRE9NX0JMVCwNCj4gKwkJCVtCQ1MxXSAgPSBYRUhQ
Q19HUkRPTV9CTFQxLA0KPiArCQkJW0JDUzJdICA9IFhFSFBDX0dSRE9NX0JMVDIsDQo+ICsJCQlb
QkNTM10gID0gWEVIUENfR1JET01fQkxUMywNCj4gKwkJCVtCQ1M0XSAgPSBYRUhQQ19HUkRPTV9C
TFQ0LA0KPiArCQkJW0JDUzVdICA9IFhFSFBDX0dSRE9NX0JMVDUsDQo+ICsJCQlbQkNTNl0gID0g
WEVIUENfR1JET01fQkxUNiwNCj4gKwkJCVtCQ1M3XSAgPSBYRUhQQ19HUkRPTV9CTFQ3LA0KPiAr
CQkJW0JDUzhdICA9IFhFSFBDX0dSRE9NX0JMVDgsDQo+ICAJCQlbVkNTMF0gID0gR0VOMTFfR1JE
T01fTUVESUEsDQo+ICAJCQlbVkNTMV0gID0gR0VOMTFfR1JET01fTUVESUEyLA0KPiAgCQkJW1ZD
UzJdICA9IEdFTjExX0dSRE9NX01FRElBMywNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2d0L2ludGVsX2d0X3JlZ3MuaA0KPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2lu
dGVsX2d0X3JlZ3MuaA0KPiBpbmRleCBmZTA5Mjg4YTMxNDUuLjk4ZWRlOWM5M2YwMCAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfZ3RfcmVncy5oDQo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2d0X3JlZ3MuaA0KPiBAQCAtNTk3LDI0ICs1
OTcsMzIgQEANCj4gIC8qIEdFTjExIGNoYW5nZWQgYWxsIGJpdCBkZWZzIGV4Y2VwdCBmb3IgRlVM
TCAmIFJFTkRFUiAqLw0KPiAgI2RlZmluZSAgIEdFTjExX0dSRE9NX0ZVTEwJCQlHRU42X0dSRE9N
X0ZVTEwNCj4gICNkZWZpbmUgICBHRU4xMV9HUkRPTV9SRU5ERVIJCQlHRU42X0dSRE9NX1JFTkRF
Ug0KPiAtI2RlZmluZSAgIEdFTjExX0dSRE9NX0JMVAkJCSgxIDw8IDIpDQo+IC0jZGVmaW5lICAg
R0VOMTFfR1JET01fR1VDCQkJKDEgPDwgMykNCj4gLSNkZWZpbmUgICBHRU4xMV9HUkRPTV9NRURJ
QQkJCSgxIDw8IDUpDQo+IC0jZGVmaW5lICAgR0VOMTFfR1JET01fTUVESUEyCQkJKDEgPDwgNikN
Cj4gLSNkZWZpbmUgICBHRU4xMV9HUkRPTV9NRURJQTMJCQkoMSA8PCA3KQ0KPiAtI2RlZmluZSAg
IEdFTjExX0dSRE9NX01FRElBNAkJCSgxIDw8IDgpDQo+IC0jZGVmaW5lICAgR0VOMTFfR1JET01f
TUVESUE1CQkJKDEgPDwgOSkNCj4gLSNkZWZpbmUgICBHRU4xMV9HUkRPTV9NRURJQTYJCQkoMSA8
PCAxMCkNCj4gLSNkZWZpbmUgICBHRU4xMV9HUkRPTV9NRURJQTcJCQkoMSA8PCAxMSkNCj4gLSNk
ZWZpbmUgICBHRU4xMV9HUkRPTV9NRURJQTgJCQkoMSA8PCAxMikNCj4gLSNkZWZpbmUgICBHRU4x
MV9HUkRPTV9WRUNTCQkJKDEgPDwgMTMpDQo+IC0jZGVmaW5lICAgR0VOMTFfR1JET01fVkVDUzIJ
CQkoMSA8PCAxNCkNCj4gLSNkZWZpbmUgICBHRU4xMV9HUkRPTV9WRUNTMwkJCSgxIDw8IDE1KQ0K
PiAtI2RlZmluZSAgIEdFTjExX0dSRE9NX1ZFQ1M0CQkJKDEgPDwgMTYpDQo+IC0jZGVmaW5lICAg
R0VOMTFfR1JET01fU0ZDMAkJCSgxIDw8IDE3KQ0KPiAtI2RlZmluZSAgIEdFTjExX0dSRE9NX1NG
QzEJCQkoMSA8PCAxOCkNCj4gLSNkZWZpbmUgICBHRU4xMV9HUkRPTV9TRkMyCQkJKDEgPDwgMTkp
DQo+IC0jZGVmaW5lICAgR0VOMTFfR1JET01fU0ZDMwkJCSgxIDw8IDIwKQ0KPiArI2RlZmluZSAg
IFhFSFBDX0dSRE9NX0JMVDgJCQlSRUdfQklUKDMxKQ0KPiArI2RlZmluZSAgIFhFSFBDX0dSRE9N
X0JMVDcJCQlSRUdfQklUKDMwKQ0KPiArI2RlZmluZSAgIFhFSFBDX0dSRE9NX0JMVDYJCQlSRUdf
QklUKDI5KQ0KPiArI2RlZmluZSAgIFhFSFBDX0dSRE9NX0JMVDUJCQlSRUdfQklUKDI4KQ0KPiAr
I2RlZmluZSAgIFhFSFBDX0dSRE9NX0JMVDQJCQlSRUdfQklUKDI3KQ0KPiArI2RlZmluZSAgIFhF
SFBDX0dSRE9NX0JMVDMJCQlSRUdfQklUKDI2KQ0KPiArI2RlZmluZSAgIFhFSFBDX0dSRE9NX0JM
VDIJCQlSRUdfQklUKDI1KQ0KPiArI2RlZmluZSAgIFhFSFBDX0dSRE9NX0JMVDEJCQlSRUdfQklU
KDI0KQ0KPiArI2RlZmluZSAgIEdFTjExX0dSRE9NX1NGQzMJCQlSRUdfQklUKDIwKQ0KPiArI2Rl
ZmluZSAgIEdFTjExX0dSRE9NX1NGQzIJCQlSRUdfQklUKDE5KQ0KPiArI2RlZmluZSAgIEdFTjEx
X0dSRE9NX1NGQzEJCQlSRUdfQklUKDE4KQ0KPiArI2RlZmluZSAgIEdFTjExX0dSRE9NX1NGQzAJ
CQlSRUdfQklUKDE3KQ0KPiArI2RlZmluZSAgIEdFTjExX0dSRE9NX1ZFQ1M0CQkJUkVHX0JJVCgx
NikNCj4gKyNkZWZpbmUgICBHRU4xMV9HUkRPTV9WRUNTMwkJCVJFR19CSVQoMTUpDQo+ICsjZGVm
aW5lICAgR0VOMTFfR1JET01fVkVDUzIJCQlSRUdfQklUKDE0KQ0KPiArI2RlZmluZSAgIEdFTjEx
X0dSRE9NX1ZFQ1MJCQlSRUdfQklUKDEzKQ0KPiArI2RlZmluZSAgIEdFTjExX0dSRE9NX01FRElB
OAkJCVJFR19CSVQoMTIpDQo+ICsjZGVmaW5lICAgR0VOMTFfR1JET01fTUVESUE3CQkJUkVHX0JJ
VCgxMSkNCj4gKyNkZWZpbmUgICBHRU4xMV9HUkRPTV9NRURJQTYJCQlSRUdfQklUKDEwKQ0KPiAr
I2RlZmluZSAgIEdFTjExX0dSRE9NX01FRElBNQkJCVJFR19CSVQoOSkNCj4gKyNkZWZpbmUgICBH
RU4xMV9HUkRPTV9NRURJQTQJCQlSRUdfQklUKDgpDQo+ICsjZGVmaW5lICAgR0VOMTFfR1JET01f
TUVESUEzCQkJUkVHX0JJVCg3KQ0KPiArI2RlZmluZSAgIEdFTjExX0dSRE9NX01FRElBMgkJCVJF
R19CSVQoNikNCj4gKyNkZWZpbmUgICBHRU4xMV9HUkRPTV9NRURJQQkJCVJFR19CSVQoNSkNCj4g
KyNkZWZpbmUgICBHRU4xMV9HUkRPTV9HVUMJCQlSRUdfQklUKDMpDQo+ICsjZGVmaW5lICAgR0VO
MTFfR1JET01fQkxUCQkJUkVHX0JJVCgyKQ0KPiAgI2RlZmluZSAgIEdFTjExX1ZDU19TRkNfUkVT
RVRfQklUKGluc3RhbmNlKQkoR0VOMTFfR1JET01fU0ZDMCA8PA0KPiAoKGluc3RhbmNlKSA+PiAx
KSkNCj4gICNkZWZpbmUgICBHRU4xMV9WRUNTX1NGQ19SRVNFVF9CSVQoaW5zdGFuY2UpCShHRU4x
MV9HUkRPTV9TRkMwIDw8DQo+IChpbnN0YW5jZSkpDQo+ICANCg==
