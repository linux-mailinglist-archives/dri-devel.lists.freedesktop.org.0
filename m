Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A762E7DDC94
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 07:27:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C8C310E62E;
	Wed,  1 Nov 2023 06:26:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF13110E62E;
 Wed,  1 Nov 2023 06:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698820013; x=1730356013;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=CIJ13GrcR8FEXwbGBay2cu9jDtSSOT+jsZv9aLiUCNc=;
 b=D9hMw8VOPo34NstnCAoWa2SckMciWOESdgDWEs2i7stbVN5yUAsoeX1d
 mJPB4uAhMByxKDqwuTrKa9Scm53e2h1b1+lxG7ZK7QW7e/CMtzynn4zR3
 Oyuv0ww+oGQ8NVAmJ+vx+KrAPwqxMQtj7c+tqjbyCsg43gtexXW1QOI93
 XsLkDzFJZTvtgGQWG1sNrZNrvKV0EXnXA9OzHiSNh8jRSaufDw87vNMsL
 RqSkszXblaLdF1MQpTOzXfVy+QGr1VYQYok3eV+h9tZqEhedoPFpSZVAd
 Cewesn0rF2sn3wkAxy+FYpmrcK1EGn7sbHwStbdFJE/0LI3kJnSUQYEev w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="474682498"
X-IronPort-AV: E=Sophos;i="6.03,267,1694761200"; d="scan'208";a="474682498"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 23:26:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="826666904"
X-IronPort-AV: E=Sophos;i="6.03,267,1694761200"; d="scan'208";a="826666904"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Oct 2023 23:26:52 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 31 Oct 2023 23:26:50 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 31 Oct 2023 23:26:50 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 31 Oct 2023 23:26:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n+qgFw7RZ4AVc6QEUN+BGzkDgLh1Ho2pcdIVcXrv8+AWCM9Dy5bVqHETOkvJaEwFi8l6xxXJ4OQvLxHLR0BZSjDLpQkKm/omukaWtqwHW/mjX9Ll93Tl8pKmMRST4afOW2E2MRt/vf5YM9vJb0+sVns/sofshqm63ZqOfEs4v2qw+GIIJTLO3i5RBHMKu1cRTwJU55sV1iaLm7ggk6SzMlADnDHxQGczZ/WzpCrvQfkyvh6ieHnWFlJyFAee2/i0H7FMVg+rBev0br+DzzNxYkFTmh6/pn3hyQ8w3yy4ZzV4xQ6sM0gY9AC4Tv52wTWnjU0Yke0tPS2Pr4faJhavpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CIJ13GrcR8FEXwbGBay2cu9jDtSSOT+jsZv9aLiUCNc=;
 b=TW5rel+aKUkLqoAO2QtoNaHZoLW5jER20Ta/Yo/RSwF1WfCjCBtjXyUfS2LpTiKmuShhVMfyOewt+pkDOaktMoWYdXyxRYP0WB2t2qMCkMXZ63t2xIncEB6SpE+xpZ7KrInY4wG1WlM2K7hST8PNQLtPv+p0pWxERZTe239HqZvphdjNyeetD2+HmrRKwIH8Pg0pbZGhmOrjgXcEEa650HTREnn4mBJZfIwn3BOw4aGjj0JDIEuFcfCAxInaQIZJA1SOaD1Q1fmluZXPf7dyWqrdZZHwKFgmmu6l3udoFMJ6H3Ye0NgtDIescj4sBNFXoxc3wESvSreVK9QybeX5JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 DM4PR11MB5229.namprd11.prod.outlook.com (2603:10b6:5:39f::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6954.19; Wed, 1 Nov 2023 06:26:48 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::ea97:f0a2:fffc:b892]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::ea97:f0a2:fffc:b892%3]) with mapi id 15.20.6933.024; Wed, 1 Nov 2023
 06:26:47 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "pazz@chromium.org" <pazz@chromium.org>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] drm/i915/display: Only fail fastset on PSR2
Thread-Topic: [PATCH] drm/i915/display: Only fail fastset on PSR2
Thread-Index: AQHaDFFB1TU3jx0oqEuMIQxwEGpG3rBlACMA
Date: Wed, 1 Nov 2023 06:26:47 +0000
Message-ID: <4cff3a2f0b286fe166a6c1fe0434d34489c34f6a.camel@intel.com>
References: <20231031232245.1331194-1-pazz@google.com>
In-Reply-To: <20231031232245.1331194-1-pazz@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|DM4PR11MB5229:EE_
x-ms-office365-filtering-correlation-id: 085f2f6e-f9c2-4cf3-3f1f-08dbdaa38692
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: g9jgLGK5/FyguZycU349W151EToXqg5M6KiEW8VNqRwG+Fc5xCMBXNE7zeVbS+4O1GHGz46caSfJW2t/ZUvWXSGjgXFzfjEWVIuDWDQC/3wn1NOxyCpDvVj/y14clFOSXdHiPMCpS7c9DvJTf37H7H8rlSCNKIea3bY4dd7+Sv4y3g48fndaxnJi4j61nZPV2a9R7jq5zbNgX95ck8YBzDfwrimv5Oi07zOEp9gGDD0/CpsQ3/RpgOUjfIDO9Jk+IdB6PLx2EbRi46j0azRXrYzBfIm7x3ak6auahhH2dtuX+w5Oafb1/qTFfDFiC0K8aSYBqMyE1+NwmUaOT3MEdJoGiYbar9ZFay5HET+m45pT1cC+6PM0EoTkNA8ldJ9KomANha4WqI3UIJqkqahZAbOr+ei/FLT0qS+0GX5vyQZSXAOjUQgtL+Ija9BUq10x9l98/QKopvijrZAaWXPyf8lWiQ88Fi1Zud2nKBHPSv+Fz3OFzqNwGyGQCMDtPVEywyny8UOSgbPIF7zeu5TPOtfQTIq7HcYOEoxYrxWJk0LtB9P0Gh7mK8EblK6ekx65vtDCU6zIH3PBxvT4RtHdaC+AYDBKTGFOGZe+5omZjgg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(346002)(376002)(136003)(366004)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(966005)(6486002)(8676002)(8936002)(4326008)(478600001)(7416002)(38070700009)(5660300002)(2906002)(122000001)(41300700001)(4001150100001)(86362001)(66446008)(66476007)(36756003)(91956017)(316002)(110136005)(76116006)(54906003)(66946007)(66556008)(64756008)(66574015)(83380400001)(82960400001)(38100700002)(26005)(71200400001)(6506007)(6512007)(2616005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cWljeUhuRTk5eXNGN3ZValdwbWs2UlpJbzlrZWNBMEk0eVZybEdpMC9OV29V?=
 =?utf-8?B?aCsxSUpPWlRLTVJ2S1dxOVM3TXlnc3ZjaGg3ditjYUlGNHhoeXdnWEU4TVJl?=
 =?utf-8?B?ZkNCS1hScFlwRlNvQjdONStVaDduVjV3VDJDK2F4Z3NTTks4aThTR1NyQ2R6?=
 =?utf-8?B?QXZzVk5wZGc0Znoxc2sweGVFUDFTdXpiRWNBcDkrYjhNZGQ5T1kzeDYxLzE5?=
 =?utf-8?B?WW9CQ1RiZ1RtMFVCTmlIQlJDa2ljYmhMMWw3c2grVzRydFJSbjhpL3lGOGZ4?=
 =?utf-8?B?MzlEVFNVOXBLZytHcCtQYUF6a2xCcmtHbkRIcmVLMDdxSUN5akEvM1dGWnUw?=
 =?utf-8?B?VVhkSHdBRlFvSUlvaWJaWTJ5SE01T0ZuZE8zRkVrWEhxMXhBNGt5UjFZa0dV?=
 =?utf-8?B?QnhaUy9GbThvUVVsVTNqOGQ0ZHlRVkdtVy94NTBuSzZQb1dwTmhSNEdPNTZt?=
 =?utf-8?B?OThEV2UzMDhyWDljM2p6YVVjdmJiVUlqOXFTOXZlSDREV21nOG9zUFFUUFBD?=
 =?utf-8?B?cmlYVTF3U0RFMmlpaVBYUXBVc1p6UUovTFZtUGZlMy9SamNPQ3c5Mmg4MWNP?=
 =?utf-8?B?ZmFFU0FTVGQyS2ZNeHB2ZjFESzFKZUNNaHdFY2VkRjdjUVJFTFU1emxxZjZ6?=
 =?utf-8?B?aVF0WUFOSlZFcWZpWFp4VWV6cVMzU1NMWnl5TjNWTytBaUQxUFNTUzMwNWVk?=
 =?utf-8?B?Mnh6UnZ2b1dSVXBUbHNKemMzTUVHcGVPaWN3RDFPYmdGdDV6aDJVeVQ0bk5H?=
 =?utf-8?B?b0dUZEVGQjNWdVgvaXJjdHJNb0J2SGZEUUJUVUFLYVZ5Ym5qR0NyZUVYZjRK?=
 =?utf-8?B?THN5Ym5qaUhDemhOdDA2aVRFMTB6UUpadG01NjlXTDAzQTkvVEh5MFAxdElR?=
 =?utf-8?B?VS9WQ2kxdkw2SjN1MmVUWkhuWkFDYU9keVB3c0FJNXN4aTB3djd3RWI5SkIr?=
 =?utf-8?B?TjVJWkxrWnZUZVlNV3lFdzY2ZVNzVUZUR2lQSU9KM0JDYksveSt0dFlGNElm?=
 =?utf-8?B?djA3WXM0c0VtT2JPTHMreW82QmhOZEZjZ2cxbkRRditheDhpeGJEOStpckl0?=
 =?utf-8?B?TDFiT3BIZlNyemhSM3MyUjlTejAwNVVHSDJwRVRlelJ4bmNQaGM5d3JHelFB?=
 =?utf-8?B?ZzhONlNsdjUwNCtTejNMQXZOTmRiMWd0czB3TUZMS0dTeFI3L1V0NjBtajMy?=
 =?utf-8?B?NDRBbWM2K29MSVp0RWdnL2JFR3k0ejVYYVZpaWFVZExTS29DNDZuV21YUTZX?=
 =?utf-8?B?b3o5YWhIR05DRXR1ZGdaVlNkVno5dG9lVUlieVlyNElWTlpOczVxbDU1Ykps?=
 =?utf-8?B?ano0dElKZi81Sm9GQUhPQ2tpSHd2Q05lSjJxUEFYak1OUWFPeWp0U1p6Mitx?=
 =?utf-8?B?czVuL2ZOWXEzTHlRbXRVVENLQWxYZ3dPVEc4RThZVXVvaDJqOU44QTFWc2lo?=
 =?utf-8?B?K1ppQkxidWVZVXRhYXgrUEp4OEVKd1NVbzVtZmVYOUtOY0tEMGxyalU3eU5U?=
 =?utf-8?B?RXVIbkhKajdXS3VkNlVWQkM3ajlBc3RWaWg5aWJaLzZxV29RZXpvR2hYYnBB?=
 =?utf-8?B?MnJ3SitTYnczN0JLeU5tdFM0Y0NlYlVrUXF1SW9NUkZRN0o2OTR1OU1XV2w0?=
 =?utf-8?B?WXc0eVJuYVNNVGZLdHl4TzIzeTlKRXNTVk5seHU1N3R0Njg1VkpIaEFBMUxo?=
 =?utf-8?B?aGdSZXZKNy9rbzVQcVAwNklSTnQ5bk1iVml3UTJrdDlkTWNBOXUxZG82RTdj?=
 =?utf-8?B?N1N5Qzl2aCtuYmRyemtNL3NuTnFZNHo1clhFbmkraytKdjBzRTd2bWt1K2lH?=
 =?utf-8?B?R2ZjR2VCS29GRnYvYnluT0hncW9YOVJwTEZScHRrMXExQm43T09XK0VaK3Vz?=
 =?utf-8?B?Nis0TE40VUhEN0dUbGY1bVJCLzkvd09mOXVsUHFOaXhqS3NPVWhIV3VEdVll?=
 =?utf-8?B?aGJubDBNMWxNc1B1M0VsR2pSYUxQaGJTNHNsNHEyaUw2Qnk0aW90VzhHRzAw?=
 =?utf-8?B?V2NMdnJnKzl2QzZJZHhqdWM2c2ZNNytSYVNIeDNRTXloSVBYYklaQzN2REdY?=
 =?utf-8?B?YXdxcmVOYXJadkY5QzVaaHBoYjU5SXN2QWdMN2JUVjV4NTNjZmZJMDZMTlhH?=
 =?utf-8?B?TFM3S0NMbncvUmRlTy9DSTdIMHFjUlJrZTBLY2diTWVHN3c0TU8xZlJadFFB?=
 =?utf-8?B?M0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0734249A32FA5B48BD57254A19E38914@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 085f2f6e-f9c2-4cf3-3f1f-08dbdaa38692
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2023 06:26:47.4866 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TrcNnoVnEbLCte/bdQWvdEDQv1zLCZmm4eG/GNh+Hb93Oo6zHz/9cGP2gFxWmiaW0HKTbXOzxpV6AxCglQZ0399gGWjn4NmKDmGIHRZGNL0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5229
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
Cc: "Kandpal, Suraj" <suraj.kandpal@intel.com>, "Zcharya,
 Paz" <pazz@google.com>, "Hajda, 
 Andrzej" <andrzej.hajda@intel.com>, "Banik, Subrata" <subratabanik@google.com>,
 "Kahola, Mika" <mika.kahola@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "navaremanasi@chromium.org" <navaremanasi@chromium.org>, "Lisovskiy,
 Stanislav" <stanislav.lisovskiy@intel.com>, "Shankar,
 Uma" <uma.shankar@intel.com>, "Coelho, Luciano" <luciano.coelho@intel.com>,
 "Souza, Jose" <jose.souza@intel.com>,
 "ddavenport@chromium.org" <ddavenport@chromium.org>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>, "Nautiyal,
 Ankit K" <ankit.k.nautiyal@intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>, "Almahallawy, 
 Khaled" <khaled.almahallawy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIzLTEwLTMxIGF0IDIzOjIxICswMDAwLCBQYXogWmNoYXJ5YSB3cm90ZToNCj4g
Q3VycmVudGx5LCBpOTE1IGZhaWxzIGZhc3RzZXQgaWYgYm90aCB0aGUgc2luayBhbmQgdGhlIHNv
dXJjZSBzdXBwb3J0DQo+IGFueSB2ZXJzaW9uIG9mIFBTUiBhbmQgcmVnYXJkbGVzcyBvZiB0aGUg
Y29uZmlndXJhdGlvbiBzZXR0aW5nIG9mIHRoZQ0KPiBkcml2ZXIgKGkuZS4sIGk5MTUuZW5hYmxl
X3BzciBrZXJuZWwgYXJndW1lbnQpLiBIb3dldmVyLCB0aGUNCj4gaW1wbGVtZW50YXRpb24gb2Yg
UFNSMSBlbmFibGUgc2VxdWVuY2UgaXMgYWxyZWFkeSBzZWFtbGVzcw0KPiBhbmQgd29ya3Mgc21v
b3RobHkgd2l0aCBmYXN0c2V0LiBBY2NvcmRpbmdseSwgZG8gbm90IGZhaWwgZmFzdHNldA0KPiBp
ZiBQU1IyIGlzIG5vdCBlbmFibGVkLg0KDQpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4gQ2hlY2sg
c2ltaWxhciBwYXRjaCBJIHNlbnQgc29tZSB0aW1lIGFnbyB0bw0KdHJ5Ym90Og0KDQpodHRwczov
L3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzEyNTM5Mi8NCg0KSWYgd2Ugd2FudCB0
byB0ZW1wb3JhcmlseSBkbyB0aGlzIG9ubHkgZm9yIHBzcjEgSSB0aGluayB5b3UgY291bGQgY2hl
Y2sNCndoYXQgSSd2ZSBkb25lIGluIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
ZGlzcGxheS5jIGluIG15DQpwYXRjaCBhbmQgbW9kaWZ5IHlvdXIgcGF0Y2ggYWNjb3JkaW5nbHku
IE90aGVyd2lzZSBlLmcuIG91ciBJR1QNCnRlc3RjYXNlcyB3aGljaCBhcmUgdG9nZ2xpbmcgUFNS
IGVuYWJsZS9kaXNhYmxlL3BzcjEvcHNyMiBhcmUgdG8gbXkNCnVuZGVyc3RhbmRpbmcgcGVyZm9y
bWluZyBmdWxsIG1vZGVzZXQgYW5kIHBvc3NpYmxlIGlzc3VlcyBhcmUgbm90DQpyZXZlYWxlZC4N
Cg0KQWZ0ZXIgbW9kaWZ5aW5nIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlz
cGxheS5jIHlvdSBjYW4NCmFsc28gdmVyaWZ5IGl0IGlzIHJlYWxseSBzZWFtbGVzcyBhbmQgc21v
b3RoIGJ5IHRvZ2dsaW5nIGRpZmZlcmVudCBQU1INCnN0YXRlcyB2aWEgL3N5cy9rZXJuZWwvZGVi
dWcvZHJpLzAvaTkxNV9lZHBfcHNyX2RlYnVnLiBUaGF0IGludGVyZmFjZQ0KaXMgcGVyZm9ybWlu
ZyBhdG9taWMgY29tbWl0IHdoZW4gUFNSIG1vZGUgaXMgY2hhbmdlZC4NCg0KQlIsDQoNCkpvdW5p
IEjDtmdhbmRlcg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUGF6IFpjaGFyeWEgPHBhenpAZ29vZ2xl
LmNvbT4NCj4gLS0tDQo+IA0KPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
ZHAuY8KgIHwgNCArKy0tDQo+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9w
c3IuYyB8IDIgKy0NCj4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzci5o
IHwgMSArDQo+IMKgMyBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9kcC5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jDQo+IGlu
ZGV4IGUwZTRjYjUyOTI4NC4uYTFhZjk2ZTMxNTE4IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9kcC5jDQo+IEBAIC0yNTg0LDggKzI1ODQsOCBAQCBib29sIGludGVs
X2RwX2luaXRpYWxfZmFzdHNldF9jaGVjayhzdHJ1Y3QNCj4gaW50ZWxfZW5jb2RlciAqZW5jb2Rl
ciwNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBmYXN0c2V0ID0gZmFsc2U7DQo+
IMKgwqDCoMKgwqDCoMKgwqB9DQo+IMKgDQo+IC3CoMKgwqDCoMKgwqDCoGlmIChDQU5fUFNSKGlu
dGVsX2RwKSkgew0KPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZHJtX2RiZ19rbXMo
Jmk5MTUtPmRybSwgIltFTkNPREVSOiVkOiVzXSBGb3JjaW5nIGZ1bGwNCj4gbW9kZXNldCB0byBj
b21wdXRlIFBTUiBzdGF0ZVxuIiwNCj4gK8KgwqDCoMKgwqDCoMKgaWYgKENBTl9QU1IoaW50ZWxf
ZHApICYmIHBzcjJfZ2xvYmFsX2VuYWJsZWQoaW50ZWxfZHApKSB7DQo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBkcm1fZGJnX2ttcygmaTkxNS0+ZHJtLCAiW0VOQ09ERVI6JWQ6JXNd
IEZvcmNpbmcgZnVsbA0KPiBtb2Rlc2V0IGR1ZSB0byBQU1IyXG4iLA0KPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZW5jb2Rlci0+YmFzZS5i
YXNlLmlkLCBlbmNvZGVyLQ0KPiA+YmFzZS5uYW1lKTsNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBjcnRjX3N0YXRlLT51YXBpLm1vZGVfY2hhbmdlZCA9IHRydWU7DQo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZmFzdHNldCA9IGZhbHNlOw0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3IuYw0KPiBiL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNyLmMNCj4gaW5kZXggOTdkNWVlZjEwMTMwLi4z
ODhiYzMyNDZkYjkgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfcHNyLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9w
c3IuYw0KPiBAQCAtMTg3LDcgKzE4Nyw3IEBAIHN0YXRpYyBib29sIHBzcl9nbG9iYWxfZW5hYmxl
ZChzdHJ1Y3QgaW50ZWxfZHANCj4gKmludGVsX2RwKQ0KPiDCoMKgwqDCoMKgwqDCoMKgfQ0KPiDC
oH0NCj4gwqANCj4gLXN0YXRpYyBib29sIHBzcjJfZ2xvYmFsX2VuYWJsZWQoc3RydWN0IGludGVs
X2RwICppbnRlbF9kcCkNCj4gK2Jvb2wgcHNyMl9nbG9iYWxfZW5hYmxlZChzdHJ1Y3QgaW50ZWxf
ZHAgKmludGVsX2RwKQ0KPiDCoHsNCj4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBkcm1faTkxNV9w
cml2YXRlICppOTE1ID0gZHBfdG9faTkxNShpbnRlbF9kcCk7DQo+IMKgDQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzci5oDQo+IGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3IuaA0KPiBpbmRleCAwYjk1ZThhYTYxNWYuLjZm
M2MzNjM4OWNkMyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9wc3IuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bz
ci5oDQo+IEBAIC0yMSw2ICsyMSw3IEBAIHN0cnVjdCBpbnRlbF9lbmNvZGVyOw0KPiDCoHN0cnVj
dCBpbnRlbF9wbGFuZTsNCj4gwqBzdHJ1Y3QgaW50ZWxfcGxhbmVfc3RhdGU7DQo+IMKgDQo+ICti
b29sIHBzcjJfZ2xvYmFsX2VuYWJsZWQoc3RydWN0IGludGVsX2RwICppbnRlbF9kcCk7DQo+IMKg
dm9pZCBpbnRlbF9wc3JfaW5pdF9kcGNkKHN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHApOw0KPiDC
oHZvaWQgaW50ZWxfcHNyX3ByZV9wbGFuZV91cGRhdGUoc3RydWN0IGludGVsX2F0b21pY19zdGF0
ZSAqc3RhdGUsDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgaW50ZWxfY3J0YyAqY3J0Yyk7DQoNCg==
