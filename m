Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD2E5777D3
	for <lists+dri-devel@lfdr.de>; Sun, 17 Jul 2022 20:48:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7151092DDB;
	Sun, 17 Jul 2022 18:48:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11D8A92DCD
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Jul 2022 18:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658083695; x=1689619695;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ppqfKFtb5TKaI+aRqKWCn6VdDKvVoiRlP2zUTmKB20I=;
 b=LIaFtXUlfPyHPL7oq0dWt/icikFg4VHw/PtuKIRtWsFXP00nkU9YmFTn
 PSIIf8V99DgtrbX4o9NkvdyiiBosOKz2SA1e6gBBYpBa4oG5h9a4piG6d
 8ZImPK4q66mgC+B8W8W1W1isxniPP1+BdbeIna90iBKiOHJgYDIX32u1A
 SN6UhnOWCHyt9Cj8mGgcl8yVBiQxVMjAY0s3PYTI/zcFl8XFo1ZMdjUyP
 +PIFsHJX95t504tfUIR904C3InIvUnEfNFmysMtWuZvb7hxk3OeYEqCCT
 05YQPqnXLpeOBujKgX4qkGJsJ8ALLonLI19Fpfp9E0+40jT1wuxTlwPNv A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10411"; a="286820441"
X-IronPort-AV: E=Sophos;i="5.92,279,1650956400"; d="scan'208";a="286820441"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2022 11:48:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,279,1650956400"; d="scan'208";a="547232316"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga003.jf.intel.com with ESMTP; 17 Jul 2022 11:48:14 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sun, 17 Jul 2022 11:48:13 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sun, 17 Jul 2022 11:48:13 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Sun, 17 Jul 2022 11:48:13 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Sun, 17 Jul 2022 11:48:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UCsVYXYtxc7m2p39YB88j0iLFrZ/ywV0++nnQH/8zI+EM+PT/FSyWSHB4XGrHY7eta45X7qPZmVmPTPQYmN7eeOsokaB4qb/w5Nd63HuLRKapGQ5tP5SSIl5XJ0FMkgJTFcQ+GBs+kuOXRNkqzfuvwOTcdc84JCDxv8msGVgL2Be3SuMXYN0t+zhH9C/MJO4f3Zqx6KFbTRaL++zfYRbyagUMkDsgs1cVZ44ke25Hw9ztJEMVup/dyNIyxOx9kMevNSPna8C9B6PGLtKfF1afVTcR67a1XEWQsg93FPGmioPqEKZWZy4FK1k0LiWpbwhpbq08GUdvYIuP0fTnuee1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ppqfKFtb5TKaI+aRqKWCn6VdDKvVoiRlP2zUTmKB20I=;
 b=APi5OFDYCTLWF1QhuPGqWEH9tWvbxRwt65Mv602a4LPEHUzRin5qQeNkFf5yhhm/3InjXuXYHG0mf/zlTsPBpUxqK1IB7sm3TgIdPhKQMNJm8pR90B/ssA9o16yUSdueSkNITyKSYn6Lfup+AoMqu0nqbD4mOLQAfmIRXs25m8WNTWxcpu7YP0ioMR3A+pHWa3A9jKTMyGSu5qBtQKi/09UnoZiM4eGmLfsXJQ0+KTYby6rE31iqfflI92JSAGCeXvU0IdP0o0/XNhc6+Tkb4W3sp2WP1SLbV9XRl5AvyzMUCc7UTtoCXyuBG3uTnlYsnJ4/tdhdm6XxTr0FiF2GKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM6PR11MB3898.namprd11.prod.outlook.com (2603:10b6:5:19f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.22; Sun, 17 Jul
 2022 18:48:11 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615%9]) with mapi id 15.20.5438.022; Sun, 17 Jul 2022
 18:48:11 +0000
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "Torvalds, Linus" <torvalds@linux-foundation.org>, "nathan@kernel.org"
 <nathan@kernel.org>, "Das, Nirmoy" <nirmoy.das@intel.com>, "Auld, Matthew"
 <matthew.auld@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [git pull] drm fixes for 5.19-rc7
Thread-Topic: [git pull] drm fixes for 5.19-rc7
Thread-Index: AQHYmVwr3m5FXszqikCViwwDQl5xra2BjnyAgAFaTgA=
Date: Sun, 17 Jul 2022 18:48:11 +0000
Message-ID: <67f51bb22eb9fd8e7fd7233027ab849e4ac83d68.camel@intel.com>
References: <CAPM=9twM75GDM9t+9-CSCPDZG3QdcEpQ-X+FzQ4CLUCM7cKLkw@mail.gmail.com>
 <YtHXe4PcWXfihF9Q@dev-arch.thelio-3990X>
 <CAHk-=wh5DB+OL2QvWPqRhpLLCqW7u_bLucFJpm4v6rZT3T5+zQ@mail.gmail.com>
 <CAHk-=wgcECb3cwnB=7Zgf8CBfEYaTWcSzAjfQpTM75_Q5aO7dA@mail.gmail.com>
In-Reply-To: <CAHk-=wgcECb3cwnB=7Zgf8CBfEYaTWcSzAjfQpTM75_Q5aO7dA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.4 (3.42.4-2.fc35) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e9616c49-20ac-43ef-ba90-08da6824e637
x-ms-traffictypediagnostic: DM6PR11MB3898:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rHtnNlVy3UeRV4kuzJ3iEODC6yQd7wWzOkRMVSmhOh5sjKJyV6DekjkfLai071qZhVdYccRrPmqN3aV75TgOY1kPG2ewY0q1zq5Q8gjSLPNAq0JmGOwz7VlxOvjwk9dRM9zCftCqJYVtnFpqMHTC81X95z6d+yL//bvBifu4n1DMAG4eILAuHdkZsjPXUxBPx0+8ODT6wZUAclH2ZbF09nJFEnoiXOQ24BcgDEiuVBCdGaRL5oqMNuXh/uQfUHctBZwBVnb5wZrML4GB7g3u0Fhe+h0yd4imx8VGfKeHxT2AXcaV8UkJjIvlYevoVUiuMOnYR9dC6gbiuIP7m1D9ngSAMQ2gFZBObt7vdp6votLhw8xuyeC8bHktkHP4UUD8Aw6AKUKY4rKfS52fasq+cNdXHelKAuwI92xO315ch8UEd68k9YMP1XxKMAAnJ5lCDAvIzFl0An5MpTk4dOGptGqpE9G6dDUOOlzYJrisu8kZ3uojDcJAQmUe00M4YiCa4pJ3tI3cNVeWDcwbFBMP4KnC4qliWa1YmG6sHyS8n7WRZ4UF0OkkRXhCjvQ6330arwyx5yWo+xCPWG09x+saC94FqBJp6hHPInF1fgH0A/yzh0FTXThH+ZK5SObelBpho2Lsn15Yvt/0isT07FV8egVXc7ibDWONbhUU3gbT2wo/OLYx/6jYGKIxAV964qftWaHdFFzTpB5OepuGVfj7YG4DluDI3y1NpTPK4lA5rTi8my/RIMONGHdMikUO7FU/U/iiiSjG1IbLWyUL8ySs2w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(376002)(366004)(136003)(346002)(39860400002)(8676002)(71200400001)(6512007)(966005)(86362001)(26005)(2616005)(91956017)(6486002)(2906002)(38100700002)(4326008)(76116006)(66946007)(66556008)(38070700005)(66446008)(122000001)(41300700001)(8936002)(478600001)(5660300002)(53546011)(82960400001)(316002)(54906003)(6506007)(110136005)(186003)(36756003)(66476007)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y1dvNC9RYkpLS3Yxb2kxS0FYZ3VvcEVOdUFqMkwwWm1iZWF5a2RqWFpBNUZr?=
 =?utf-8?B?dVRXa1k4N3N0MEJZdlRaN3hQdWFucFU1VnBUSjdXTmo1ZjE4bWwrQk1hckls?=
 =?utf-8?B?OWp1NktPeG5tVmlqdnBqYUsrbUJrYjVuVWVrek9wWkZ5Q0E1ZHJKdXhTNE15?=
 =?utf-8?B?OHFQblNyR0UyTTBIYkhFbzRmSzAwRlZtMis5ZUk4VGFMeEFxZUhoUmR3Q0hh?=
 =?utf-8?B?Y1llMWZrSGRuVDUvVXZHMXJhWlcyektBYTFKZDZ0ZVVCZTEzRzdJU0had0tC?=
 =?utf-8?B?ZHNXN2dtbkI1emJScWVRVlE2QnVIZjB2TW9zZ2pjTjhqWTg4SDRxVW9NbGc5?=
 =?utf-8?B?Y0dQMVB0WTdJNC85akdkS3dXd2R4L2tiQjBJOVByLzA0SFV2TGx2M2wyWTlZ?=
 =?utf-8?B?U1I2MWJpNWRKUUwvWE03MXNWU3k4b2pRYkZyeDdLa2NUWG01YW5aWXdYRWZ6?=
 =?utf-8?B?dVhScVFOSjY2Rlh1OVIvMTdMbGU5SytoY3N1djN2QnRZdWhWZndzYkpoM05P?=
 =?utf-8?B?NHBKaENnMVczMDdRRlB5WFZxUXBoVElIYXVhVEJLSUR0YWhuRzBpTVdXNEhs?=
 =?utf-8?B?Mnp6NWNuWkNkUnIvSVRYMDNsSXNIQ1hyY0VDeVlhV2RiK1l4aHp6WkpjK2hk?=
 =?utf-8?B?a2FIRlFaU0hidzY2VU9RcUNHY1NTdkdQa2VXOVJDZWhqL21XUXY4R1JUL3di?=
 =?utf-8?B?c1JuZmZJSWoxaXI5ejRRaldUWC9kQnBFMGdQbmFueUFRMnhRa01DTG1FaXV3?=
 =?utf-8?B?MlBPa3ZNdVl6M3NEQ2k2Y053VUdkMzd3WDRiYjdHcWV4VGR3RFJhNzRXa0ZS?=
 =?utf-8?B?TXRyc3BVYVA0Z0s5U1ZBOWRHZ2thenNOR2lPZnU0aWFSTGZwOWFmUENVOHhW?=
 =?utf-8?B?RXUzczlWdE1SMzk0QjhlK3VpSnlIc2NpQlFTT0JVZHlGdm1DY214bkZ4TTFp?=
 =?utf-8?B?UHhEbFVYZ21qdklDcXhpUmxKaUl4ZmsrektXcmhCZ2k5dTFrUW9qTTN6U0VW?=
 =?utf-8?B?aXFrcUU2VEVBU2wxelNVUUl4SDhSTlcrV2FNZHRWd2ZtZTJvOEtIcVMxWUlO?=
 =?utf-8?B?UnIwSUNTcjJYWmd3eERDMVVLb05UMDBtbUZpM3p6b05USitaK3QvRzNxbmxN?=
 =?utf-8?B?bzZEMEMzZHhNUE9RVEhiZ1RVK2J1QVRHSS9vODV2cEtYUW1zVElmRmdCdnBn?=
 =?utf-8?B?WjIvTUJZbndjblV2TE5zbzJtdjJsMG1ObElTVk9sODNJZVdlNzZMdGVuQTZE?=
 =?utf-8?B?ZTNKVklRYXhEbjk2azNZV2xkZmg0VG1hNGx1aUdjb3BKRDVicm4vS3Eyc1Y5?=
 =?utf-8?B?aFRVa3lDd05DK21NZSswTUVoT2dmbzBKcjFDTW5TSVNQeGNDMURvL0ZHNTRB?=
 =?utf-8?B?MGxmTjFiQjdWNkIrWWhXcEdlN2t0U2s1c0lpWE5Za1JPMkVZbU5UQzBGNERu?=
 =?utf-8?B?TTdPNldicDVKZEt5OGgwQ2x1ZEhZN1hDT2xNUmVMRE1YdnYrZ2tneG9oT0tz?=
 =?utf-8?B?UWRTNXhObXVtRlJINmRxdWJBMXRSbkxvb2pJMWFtOHYwZ241aVIrcm1OTWZm?=
 =?utf-8?B?czQ1ei9POFN6UXJHMm5KYWFEZGFuNDNubTVyMmV2dDNVU3dRNEhvL0VRbE5x?=
 =?utf-8?B?Ylg0WHc2V0NBUzBtem5oa2N6SE95NURGaFdRbDZXVldsYm5vNEE4SXVPRWcx?=
 =?utf-8?B?cXQ1bVV0K1ZldXpRSXJ5S0NDdDlVVmNJcGZ0VDZYUWlGTFFjaVNKMG5Za1V4?=
 =?utf-8?B?M0xkdnlaOE5RMnkyTlRXZDI2ZlNCWERaQ1pPemVvczhNWlkxTHdJSUxxUDhB?=
 =?utf-8?B?ZERjNGdLUWEzc3JwQjYyQndXU3FaTVUwNWFkNlRISU9rRGd5OGZBMUNFZ21T?=
 =?utf-8?B?V0doM01lNlNKTjRXdmt6NWpETFdIcThtS2RhZlloMmVlZHlRUkpkd1pOKzFI?=
 =?utf-8?B?Uk1PWTVqL3ZHSEV0SFhoamFRSXBTOXJGd2RXVi8vRWtSUEtrQ09HZUF2Z01t?=
 =?utf-8?B?UTY1empDc0srcW9XdTg0bnFhVGltMFFPTWh4amZUYXRodXczOFl0ODJmRHZq?=
 =?utf-8?B?dDNGR3cxa3pOeloxY0tIVVREY1hNNUU1VWZ5SU1tRDFTdkNWWWtHdDVHVzRq?=
 =?utf-8?B?VEpiRmNMK0xDdkIrMUttTW9RZHZiOTlNZHhFZVVvT1hsaVE1cVpldytxRGQ3?=
 =?utf-8?B?T2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4BCB2C6EF3165948B4DC34EC78C1EB19@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9616c49-20ac-43ef-ba90-08da6824e637
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2022 18:48:11.6245 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tvK/YeYaBqdB5b/6L3t0ozbZslf98R5O1NJctd/HTwzU9HFjJLVJdFbJRrfcu9ti6yqf4P4f/+HAe3XHBwMT1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3898
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
Cc: "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCAyMDIyLTA3LTE2IGF0IDE1OjA4IC0wNzAwLCBMaW51cyBUb3J2YWxkcyB3cm90ZToN
Cj4gT24gU2F0LCBKdWwgMTYsIDIwMjIgYXQgMjozNSBQTSBMaW51cyBUb3J2YWxkcw0KPiA8dG9y
dmFsZHNAbGludXgtZm91bmRhdGlvbi5vcmc+IHdyb3RlOg0KPiA+IA0KPiA+IFRoYXQgc2FpZCwg
ZXZlbiB0aG9zZSB0eXBlIHNpbXBsaWZpY2F0aW9ucyBkbyBub3QgZml4IHRoZQ0KPiA+IGZ1bmRh
bWVudGFsDQo+ID4gaXNzdWUuIFRoYXQgIkRJVl9ST1VORF9VUCgpIiBzdGlsbCBlbmRzIHVwIGJl
aW5nIGEgNjQtYml0IGRpdmlkZSwNCj4gPiBhbHRob3VnaCBub3cgaXQncyBhdCBsZWFzdCBhICI2
NC1ieS0zMiIgYml0IGRpdmlkZS4NCj4gDQo+IEhtbS4gVGhlICJESVZfUk9VTkRfVVAoKSIgaXNz
dWUgY291bGQgYmUgc29sdmVkIGJ5IGp1c3QgbWFraW5nIHRoZQ0KPiBydWxlIGJlIHRoYXQgdGhl
IG1heF9zZWdtZW50IHNpemUgaXMgYWx3YXlzIGEgcG93ZXIgb2YgdHdvLg0KPiANCj4gVGhlbiB5
b3UgZG9uJ3QgbmVlZCB0aGUgKGV4cGVuc2l2ZSEpIERJVl9ST1VORF9VUCgpLCBhbmQgY2FuIGp1
c3QgdXNlDQo+IHRoZSByZWd1bGFyICJyb3VuZF91cCgpIiB0aGF0IHdvcmtzIG9uIHBvd2Vycy1v
Zi10d28uDQo+IA0KPiBBbmQgdGhlIHNpbXBsZXN0IHdheSB0byBkbyB0aGF0IGlzIHRvIGp1c3Qg
bWFrZSAibWF4X3NlZ21lbnRzIiBiZQ0KPiAyR0IuDQo+IA0KPiBUaGUgd2hvbGUgInJvdW5kX2Rv
d24oVUlOVF9NQVgsIHBhZ2VfYWxpZ25tZW50KSIgc2VlbXMgZW50aXJlbHkNCj4gcG9pbnRsZXNz
LiBEbyB5b3UgcmVhbGx5IHdhbnQgc2VnbWVudHMgdGhhdCBhcmUgc29tZSBvZGQgbnVtYmVyIGp1
c3QNCj4gdW5kZXIgdGhlIDRHQiBtYXJrLCBhbmQgZm9yY2UgZXhwZW5zaXZlIGRpdmlkZXM/DQoN
CkkgZnVsbHkgYWdyZWUgd2l0aCB5b3UgdGhhdCBpZiB3ZSBoYXZlIG9ubHkgdGhpbmdzIGF0IDMy
Yml0IHdlIGNvdWxkDQp1c2UgdGhlIHJvdW5kIHVwIGFuZCBhdm9pZCB0aGUgZGl2aXNpb24uDQoN
Cj4gDQo+IEZvciBjb25zaXN0ZW5jeSwgSSB1c2VkIHRoZSBzYW1lIHZhbHVlIGluDQo+IGk5MTVf
cnNndF9mcm9tX2J1ZGR5X3Jlc291cmNlKCkuIEkgaGF2ZSBubyBpZGVhIGlmIHRoYXQgbWFrZXMg
c2Vuc2UuDQo+IA0KPiBBbnl3YXksIHRoZSBhdHRhY2hlZCBwYXRjaCBpcyBDT01QTEVURUxZIFVO
VEVTVEVELiBCdXQgaXQgYXQgbGVhc3QNCj4gc2VlbXMgdG8gY29tcGlsZS4gTWF5YmUuDQoNClRo
YW5rcy4gV2Ugc2hvdWxkIGNoZWNrIHRoaXMuDQoNCk1lYW53aGlsZSBJJ2QgbGlrZSB0byBzYXkg
dGhhdCB0aGUgdGVhbSBoYWQgd29ya2VkIGFscmVhZHkgdG8gZml4IHRoZQ0KaG9ycmlibGUgMzIg
dnMgNjQgYml0cyBpbmNvbnNpc3RlbmN5IGFuZCB0aGUgYnVpbGQgYnJlYWthZ2UgYWxyZWFkeS4N
Cg0KVGhlIGZpeCBbMV0gd2FzIG1lcmdlZCBKdWwgMTMuDQoNClsxXSBodHRwczovL3BhdGNod29y
ay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvNDkzNjM3Lz9zZXJpZXM9MTA2MjYwJnJldj0xDQoNCkkn
bSB0aGUgb25lIHRvIGJsYW1lIGZvciBub3QgaGF2aW5nDQpwcm9wYWdhdGVkIHRoaXMgYWxvbmcg
d2l0aCB0aGUgbGF0ZXN0IGRybS1pbnRlbC1maXhlcyByb3VuZC4NCg0KUGxlYXNlIGFjY2VwdCBt
eSBhcG9sb2dpZXMuDQoNCkkgd2lsbCBjaGVjayByaWdodCBub3cgd2h5IHRoaXMgd2FzIG1pc3Nl
ZCBvbiBteSBzaWRlIGFuZCBjaGVjayBob3cgdG8NCnByb3BhZ2F0ZSBxdWlja2x5Lg0KDQpTb3Jy
eSwNClJvZHJpZ28uDQoNCj4gDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
TGludXMNCg0K
