Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A256A5CA4
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 16:59:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A578810E4D9;
	Tue, 28 Feb 2023 15:58:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A29B510E4D9;
 Tue, 28 Feb 2023 15:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677599936; x=1709135936;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lqvFAYJAWbVGvmR1WBIVo1cJGnQ2ZogQITUu9iflmaE=;
 b=JMnr5QA9cL5ZpW5P/H3FYY6TYM3hpxoE8QDOF1CeU9kBhkjqVQVEXqQ5
 p9YPAYh03IZ83gIJ1KtbC3J+aowZDn7Kl6eKWocUxC24BBGj+AqkdJYqd
 JLlbJgcSTX2Mf6/BdWYPrVh4h7T8isd0QAXUkAYcwI67V5/HpSiC8tWkd
 JCl4IsUhzcA/ND+fCMwkhnbifjol8up+xo0nDZbnuSJr1w1GaxVj5Sgfm
 LJ+FfN7c9lxdr0PzWZvdqJMeqnMmNU80XuL2ABhRi0s7eMHsVkxkbwC4k
 OyLpqakoYernPC29wzBjrA+fF3ProTe+cRpiRICQ4IlOaqoIMPQGFleFU g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="331651478"
X-IronPort-AV: E=Sophos;i="5.98,222,1673942400"; d="scan'208";a="331651478"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2023 07:58:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="848287778"
X-IronPort-AV: E=Sophos;i="5.98,222,1673942400"; d="scan'208";a="848287778"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP; 28 Feb 2023 07:58:55 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 28 Feb 2023 07:58:55 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 28 Feb 2023 07:58:55 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.46) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 28 Feb 2023 07:58:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i9stACpkKsKzBHJCzgBMzP8DsPaG+Ylw8x972+vCKJByPUfL5053Wi2a11ECCebIMiEhBU1/GaytNI1z0/uLuSJLKNVugE1L855sNicIPpd6LQEiRT8hNT/Kwyco+PwPfDBEyG1Kg8ft+4tcJpHl/G6OnDLvtmlv9y4mr9CkKtTtN1hQ5Lq6vBMVXVEg3WptymL2LS0ry07Bf2D7ITQkJd4i2esm6yGJxNt7khLFlyxvDbo0ZVvmG2PbIDPodGftyTN9bVUGjyU+HJ1/lI0LqOSeQzWy8DiKQFBU1w0r5QQAnx7dX0KC1hiWeGQErWw7KrsASsWhHJaEUcfmYNoGGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lqvFAYJAWbVGvmR1WBIVo1cJGnQ2ZogQITUu9iflmaE=;
 b=WBAs8AP34fb0XMXTHU5cjaYLU4pG+urf7a9h7910mfBNIs3y3/q46V7+os53gY3vbeUGBs67kytoDwhO8MEyJ5+UObC+tZYrCGTxZPzyiH42ruLI1efS5x0Q4OfNJi3IZeAgvvZTAZGe559t2eLv969ot3MP1bg5FApiMw+IGKYhGXXnSihMW3+zBMb4DRz22+8T2mup630uaI0yEJX8nbFgt6Q4X8USWtRFvhKiW3mQUJhwMnxSwsijiL2dsYz1uKt3ftdmZ+6mmKoguk4rV0MpXn7WJrsm5Odrk4+pJ2kkWZxxQR33AIFMM5KmXFHzvmAKbphaxP4s3SPvybXoAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5655.namprd11.prod.outlook.com (2603:10b6:8:28::10) by
 MN2PR11MB4632.namprd11.prod.outlook.com (2603:10b6:208:24f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Tue, 28 Feb
 2023 15:58:49 +0000
Received: from DM8PR11MB5655.namprd11.prod.outlook.com
 ([fe80::9fb9:e089:9c08:dad]) by DM8PR11MB5655.namprd11.prod.outlook.com
 ([fe80::9fb9:e089:9c08:dad%3]) with mapi id 15.20.6134.030; Tue, 28 Feb 2023
 15:58:49 +0000
From: "Saarinen, Jani" <jani.saarinen@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Dmitry Osipenko
 <dmitry.osipenko@collabora.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "airlied@gmail.com" <airlied@gmail.com>, 
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "Nikula, Jani" <jani.nikula@intel.com>
Subject: RE: [Intel-gfx] [PATCH] Revert "drm/shmem-helper: Switch to
 reservation lock"
Thread-Topic: [Intel-gfx] [PATCH] Revert "drm/shmem-helper: Switch to
 reservation lock"
Thread-Index: AQHZS4kP00vmXSCrUEqA7QY5bP9mqa7ke3qAgAAE+oCAAAN8AA==
Date: Tue, 28 Feb 2023 15:58:49 +0000
Message-ID: <DM8PR11MB56557B7BECE539356E4469CFE0AC9@DM8PR11MB5655.namprd11.prod.outlook.com>
References: <20230228152612.19971-1-tzimmermann@suse.de>
 <d48476f0-3c00-047d-c3cc-511b95fede5d@collabora.com>
 <07cb2cc5-5491-a5a4-874f-f1e10ffe4882@suse.de>
In-Reply-To: <07cb2cc5-5491-a5a4-874f-f1e10ffe4882@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5655:EE_|MN2PR11MB4632:EE_
x-ms-office365-filtering-correlation-id: 7325c079-7edf-4827-e08c-08db19a4ae8c
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dJDCejLFbhhPxK/sTe1Ser0HRh5nNQO5ZA7OOozjTEZkz+uxudzF2VTkRNhzKEuAaT7k1ASeWCKi3MGRE5o8h6z28YjkdJ+Bq7UWZ4+l3AVI/eY+898u+GYmv5U/uiSZVibY5AxH5cUkmwdyVz3WoP0NNimf2CeWk7BLRMcuf/oRwOSF53ZCSThe3fQvfV0ka5ExfoT5zUmgy1cLAV205xU16hJ4zTISvUqVe7GDi4FWnzJAmM9amz8h0Rnu1W+OsDYlKBX4jPh57Yk9Lu2o4a58XDOi+lVyu5dE5VIOhoF58z9dZu9V08OllAAypRdprXOd5GVeyavVGJh1CWlELDsiecYkfdWg738ARVdFRo70jQyTb/OXABq7xIekmHiNTBUjfPoT43Q/lK4p32lFyVUKQy9nFdfvKNBrYaa+H+He4InCIYjgBaQusvvBf+cqtmaQk/fAJVJkII6MH858P04afWeKm8kY1uUaE8lxrTc+ikytt04dC2pjFIdutx7DIQrZ00/n0zBZk5WTnSxWlFAtOGnDFHPD7p4KUa0iOHvQAYACodlTVB2Q4r1R3eJhRF7flEORIeQ1tq0Fxz8lwq/1UXIPDyyfJR0ADWT2Ihc1BKOilrvzhe1zTNN48RKCkpJZ0vJikuWbQ6eIA/XNl48qMzZUJ++S+hhB1nHDxxuxfFzs2fCqhXkyxP4nGq2C
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5655.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(376002)(396003)(39860400002)(366004)(136003)(451199018)(86362001)(33656002)(66946007)(66476007)(66446008)(55016003)(66556008)(64756008)(8676002)(5660300002)(4326008)(41300700001)(8936002)(2906002)(38100700002)(82960400001)(38070700005)(122000001)(7696005)(71200400001)(52536014)(966005)(6636002)(478600001)(54906003)(316002)(76116006)(83380400001)(66574015)(110136005)(26005)(9686003)(186003)(53546011)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b1FwV01ZM25MYk5ZRlNZZWlEMWJDWU5mZmhCVnNaelBIbVhWWURRTTlUSXlX?=
 =?utf-8?B?Rm5XK0dKQVNBY1hsdHdseWpTNytBUk9hL0JXcTNNV0hZeWk2NFNhRWp6dkVq?=
 =?utf-8?B?aGgySFFORWtDajY2a1FpT0w1bEwzVlE0ZVZCMWFqQkQyMjZUNFp5aldKeEN5?=
 =?utf-8?B?dzkreWhMZUJMc0lldUN4QU9vNThBejlHd2ZoVjRoYjRFOGhIZ3p2Z3gzclNr?=
 =?utf-8?B?VDlLQ1hyRFhYQkd1ZjNQZytYeUhraFFJWG53aWF0dkZRZVBuczNxbFRFSTB1?=
 =?utf-8?B?aWQraFRoSGJhSGhHR1R5S3NYWHhtUFVMMlNHSnFVdFJ4ZzNwVVM3Z1FEOFRL?=
 =?utf-8?B?U0RFVWpWS05VbzZVZDNPdDZPR21DRzdEcmtzWVB6WVRMRmwvS0hyWU4yanQ2?=
 =?utf-8?B?RUZTanJvN3cvQTFiWU5mR1V2ZUpGN1psYldwRmVaRnhxRVZ1WHAvM3o2TDFR?=
 =?utf-8?B?TlF0bExyOGdUNmYzNWRMTzJKOXFHdytSbzA0bWpxUGYyWWx3TTZuUEtwY1Rt?=
 =?utf-8?B?THRKR0lPei96UGRZV2pndUVNdS9nbVJJWWlycG9OenFrRS9zQmV2NEZkanlw?=
 =?utf-8?B?YVN4SmF1c3ZHYmdEQW02UnhKK1Y1NDUrRmNXcnRSZnRZWFFpS0k3S1lSSzJN?=
 =?utf-8?B?b29OZmlvV090UWdwNHl1N3J0WmJUUkVPWjBNK1lmb2lLMzF2VnNKYXJaTWdK?=
 =?utf-8?B?aEVmN1ZHQzd4SmtnSEw1c21KWk5IdGo2RW1hTmppTGpPUk91dnJnWFo5RU5O?=
 =?utf-8?B?YnJPdVZ6b29kQnhTVEdwZUdibVNiMERpR1JFNmtESUQwTHR1QTB6eXk4bEhV?=
 =?utf-8?B?LzRrUlhUNXBMbE5ZekNMYnpPRXB0NVpnalFXUGpaVjFxV0JoMDN0R3F3UkxJ?=
 =?utf-8?B?K2NHZ0VjK202K0NBNC9wNkJxeHZUdnMxVHlYVElWOW9tZnVOL3pteCtVUTU3?=
 =?utf-8?B?M3ZrK0N1T3g0OU1DMXZJSm9oTVZ2MTArblJYT2h1TFJYYkJnTnBGdEU2TkZo?=
 =?utf-8?B?bE9NSHFlRUZHcGhPNGJ6aFIrbzB3NldRMlV4M2hNQks2czl6YzhzZHk3bExC?=
 =?utf-8?B?TVF5V21TY0NpNjYyelhMbkZrcVlWRkpoTktjdG1FZ3BDUlFneXJrWk81dklH?=
 =?utf-8?B?ekJFbzIyemNLclFZOW5Sb1hkaldWVkVhMVNhMk9qL0FRZldHZ0RDWktUUnQr?=
 =?utf-8?B?a0lZQ0lIRVBFenJ5SXgzQS9URkZqa3ErbitaNFA1Q2pPRGlXc0tnb0NxVTVL?=
 =?utf-8?B?ZDhSbXVQbVdHa3pWZkJxcTFWS3N6bHFnUEtnZ0FOYTRuSHluN3ZhMFA1dVRR?=
 =?utf-8?B?RFpMMncvSkdFbmF4a0FXS0RmcFAvS2Qwb1dHb2RqcEtVV2tNb3VoYmZMUkQv?=
 =?utf-8?B?UnZJWmJDRmJVYjhvcEhtTi84MEhjOWJYWnFYVVZFUlBCdzNzM1JkUERVU2JW?=
 =?utf-8?B?ZG13dGROdmRtODdBdHdCaXFmamJiQStXRzlicTEwT0w5VC9CSjBNaXlhUFN3?=
 =?utf-8?B?ZUNaMDllbjl4cUVHZXBSVHlaTWJoelVHeTc4Qm1YYkVRaUxsL2h1bk5Lbm1L?=
 =?utf-8?B?QTdvVCtydXB6U1RGaTRvaTIyRnB0THAyNUJzWVgwVy9QTEJUbGwyaEV2Unpr?=
 =?utf-8?B?Qkl6b3VlSXp3MUxkQ1pMU3JqdXdSNG54bFBTbGNzSUFTWmN2ZXpJblBRVFhj?=
 =?utf-8?B?OVZqUExtTVdEK1JyVlhtTmFxbGo1SGF3STNnNHM5TG1XT2MwbU42MG0rN1VN?=
 =?utf-8?B?SjI2UVlwdHRsK3JIRDZObWZGWCtETGZHSHlDaC9rVVE5cG5pQWhwWHIrWHM4?=
 =?utf-8?B?blNuaGFtaDJjMGxlVWdhRFdtdEpHTWxwaE90aHZ3NWUxZkFCdkZnQ3pvclRD?=
 =?utf-8?B?elhJN0RjSHVkZzN2dXFsbm9Ed0Q1NE9qdHlTMGhlVDI3Zit6ZmpQL2pjU2cv?=
 =?utf-8?B?NDZ1SDREaVBRd2d0bUNKRE5MNVgyelpoUW1lWmgwdWJQNDFqeXRwRDl4eW1n?=
 =?utf-8?B?UWRjQUdOcytEZUJJMmI3eW9XMkZCUWZ3SEJyeFE0UnZrSVpWOGlua2NjT3Rt?=
 =?utf-8?B?OUZSd1p2VEwzMlY0ZHhlZ0VnRldwTDJZRUpNSVRRMEtCZ21CWDNXOHFoWEw5?=
 =?utf-8?Q?444NWT+qlNhA/cuRL63qZ2ASN?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5655.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7325c079-7edf-4827-e08c-08db19a4ae8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2023 15:58:49.6543 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WBVVTnXTMq5KgPqE82jeKPOWUHPTzWp+AaMF3qf0h2vhpC7YyOclq5mGaXf02BQjXX/jaVQQi36NUb7u4bLRYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4632
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSW50ZWwtZ2Z4IDxpbnRl
bC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBUaG9tYXMN
Cj4gWmltbWVybWFubg0KPiBTZW50OiB0aWlzdGFpIDI4LiBoZWxtaWt1dXRhIDIwMjMgMTcuNDYN
Cj4gVG86IERtaXRyeSBPc2lwZW5rbyA8ZG1pdHJ5Lm9zaXBlbmtvQGNvbGxhYm9yYS5jb20+Ow0K
PiBtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb207IGFpcmxpZWRAZ21haWwuY29tOyBk
YW5pZWxAZmZ3bGwuY2g7IE5pa3VsYSwNCj4gSmFuaSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPg0K
PiBDYzogaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0OiBSZTogW0ludGVsLWdmeF0gW1BBVENIXSBSZXZlcnQg
ImRybS9zaG1lbS1oZWxwZXI6IFN3aXRjaCB0bw0KPiByZXNlcnZhdGlvbiBsb2NrIg0KPiANCj4g
SGkNCj4gDQo+IEFtIDI4LjAyLjIzIHVtIDE2OjI4IHNjaHJpZWIgRG1pdHJ5IE9zaXBlbmtvOg0K
PiA+IE9uIDIvMjgvMjMgMTg6MjYsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPiA+PiBUaGlz
IHJldmVydHMgY29tbWl0IDY3Yjc4MzZkNDQ1ODc5MGYxMjYxZTMxZmUwY2UzMjUwOTg5Nzg0ZjAu
DQo+ID4+DQo+ID4+IFRoZSBsb2NraW5nIGFwcGVhcnMgaW5jb21wbGV0ZS4gQSBjYWxsZXIgb2Yg
U0hNRU0gaGVscGVyJ3MgcGluDQo+ID4+IGZ1bmN0aW9uIG5ldmVyIGFjcXVpcmVzIHRoZSBkbWEt
YnVmIHJlc2VydmF0aW9uIGxvY2suIFNvIHdlIGdldA0KPiA+Pg0KPiA+PiAgICBXQVJOSU5HOiBD
UFU6IDMgUElEOiA5NjcgYXQNCj4gPj4gZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1faGVs
cGVyLmM6MjQzDQo+ID4+IGRybV9nZW1fc2htZW1fcGluKzB4NDIvMHg5MCBbZHJtX3NobWVtX2hl
bHBlcl0NCj4gPj4NCj4gPj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1t
ZXJtYW5uQHN1c2UuZGU+DQo+ID4+IC0tLQ0KPiA+DQo+ID4gVGhhbmtzIFRob21hcywNCj4gPg0K
PiA+IEFja2VkLWJ5OiBEbWl0cnkgT3NpcGVua28gPGRtaXRyeS5vc2lwZW5rb0Bjb2xsYWJvcmEu
Y29tPg0KPiA+DQo+IA0KPiBUaGFua3MsIG1lcmdlZCBub3cuIEkgaG9wZSB0aGlzIGZpeGVzIHRo
ZSBpbW1lZGlhdGUgaXNzdWVzLg0KQWNjb3JkaW5nIHRvIHByZS1tZXJnZSByZXN1bHRzOiBodHRw
czovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL1BhdGNod29ya18xMTQ0Nzh2MS9p
bmRleC5odG1sPyANClNvIHNob3VsZCBmaXguIA0KDQo+IA0KPiBCZXN0IHJlZ2FyZHMNCj4gVGhv
bWFzDQo+IA0KPiAtLQ0KPiBUaG9tYXMgWmltbWVybWFubg0KPiBHcmFwaGljcyBEcml2ZXIgRGV2
ZWxvcGVyDQo+IFNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KPiBNYXhmZWxk
c3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCj4gKEhSQiAzNjgwOSwgQUcgTsO8cm5i
ZXJnKQ0KPiBHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=
