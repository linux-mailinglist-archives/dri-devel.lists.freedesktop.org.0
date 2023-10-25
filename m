Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D20E7D63F6
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 09:49:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1997810E580;
	Wed, 25 Oct 2023 07:49:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67C7910E576;
 Wed, 25 Oct 2023 07:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698220163; x=1729756163;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=GRzCwiHDjQkfIRid5+JUiBq1e+JtiXTWqBbM0AfsyWk=;
 b=e52WKDAoRwSdulIl+KndaMeOtGNlyOhiVLy8fh+y0VnVHFsiUNoIfwZ8
 5q5tRYmmuZRJlcP9galYAlHsFZG2w56iQ3f4AoOP7LdVoGiaeyX6dsJRj
 k/GnEAxd5TDUiOv+IBzvksbfcx8Eb4Xk6BTIRWgf1edxC8brqhDMAmqO3
 qmSAv45JulEEdTj76B7EuYE0OAfNfHe8wOkhkrKy4NemuC3jaHYhxcM5r
 EfRLXpJ02AHTqHHwvuGoP+jtC5IxLl7UqyvR3mF1CEId7Mtj6kDw2mrd0
 cZUxGQIunoy4wn9sadoluJ6blfBJzY3jt14NlgWiQDrXxBEY9vKAc9VAJ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="453730161"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="453730161"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 00:49:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="902473361"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="902473361"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Oct 2023 00:46:59 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 25 Oct 2023 00:49:20 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 25 Oct 2023 00:49:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 25 Oct 2023 00:49:20 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 25 Oct 2023 00:49:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SBKMAiW7iviPlxnLY5jvzx0SPSLlxMwZN2UzWbReTPI9lJkh4G4to8UcCFfxa4ZbiuOEVx7/5zAhvB0NKj0PW1WugELFKQQzL0N/V1gqVqkYVPV6CwDyZNkDT9KG4/lapiFI+vk23mxgYbbgS4KwmnzNPr2rPJK8AqqfDOqamJMT5Lf4+SfOsOdWH9T106repxKTbG2NNejdF5ZbATDqeU3AK5Kb7AK+LjbJ9qh8HhLQ6aSbV9Y5eVA0mQl16oY4h5dKlwjUWp3H5rzkzhfvHy0C8V4mdlVHvmw4V8a6mwmslDBklT3zTWzW9qbXQOyIGpyTF4/nuQWA0sgvQSIVKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GRzCwiHDjQkfIRid5+JUiBq1e+JtiXTWqBbM0AfsyWk=;
 b=Zg14gL/W5ZBApgRDxrhyr0pIGvJiOpK9JCV3kMOXH4pJPVftIUzqJ72WdpJrW4rZFioKP5w/L7CKfPlBCJPznOWvYffS5+H1ekPRyLL6fXEbnAddit7Msfj6VCxBcz2eSdeFnZC0N3nqCoLZjK81sX+DpdqYuTE1Yyxc6iH+vaVETKVwiJZj+q4cgttelpP5tWMvXCm1OJM9BHLGrOeGrz5ncJ+ka0V16B+OorxgJTNZxGSYn2iTd2vqTinOu75dEMIyRWGYTwQdo/Fsuksmus+4KOJX4R/APeJjpK7f/Bv7g9/xvazk/6PP4q8dSyXNqlETKE7d5dXVRv96lKkP5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 MW5PR11MB5763.namprd11.prod.outlook.com (2603:10b6:303:19a::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6886.36; Wed, 25 Oct 2023 07:49:17 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::ea97:f0a2:fffc:b892]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::ea97:f0a2:fffc:b892%3]) with mapi id 15.20.6907.028; Wed, 25 Oct 2023
 07:49:17 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "ville.syrjala@linux.intel.com"
 <ville.syrjala@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "javierm@redhat.com" <javierm@redhat.com>, "tvrtko.ursulin@linux.intel.com"
 <tvrtko.ursulin@linux.intel.com>, "Deak, Imre" <imre.deak@intel.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>
Subject: Re: [PATCH v5 4/7] drm/i915: Move fbdev functions
Thread-Topic: [PATCH v5 4/7] drm/i915: Move fbdev functions
Thread-Index: AQHZ8S1rmyRAq6yHmU2zgDQ8+nfR1bBaTSWA
Date: Wed, 25 Oct 2023 07:49:17 +0000
Message-ID: <26299391e5f558ce20e88e93bc988be418769a65.camel@intel.com>
References: <20230927102808.18650-1-tzimmermann@suse.de>
 <20230927102808.18650-5-tzimmermann@suse.de>
In-Reply-To: <20230927102808.18650-5-tzimmermann@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|MW5PR11MB5763:EE_
x-ms-office365-filtering-correlation-id: 91afe2f0-8a30-4bd3-6da0-08dbd52ee443
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: y7ziipAPe2fAyr+c9h2j65kkhwM0q1p1d37JozlbgfRKc8X/it8rtvzG5kug/qwklsr8Mj+D4pLrQt3Cbxq1iI4RE319H3q10sF3RyWiefrh/yb4q9GOmSOSvOTxga4l3mq+mdDbl12GTB4vkE5uY7H/MBurTCHzpehARPw/shkis8Th6fstmv6sS6rx8FT5+uD7Cv1owrUnFyz8rCoBJTrd6qR7ce93eCT24MUurBDsEzBmkL7AXHsheAvBBfNGPG799WBCy1/dNgVAJfqPAK/3ivfB1fQOfmGRk49S67JBTkIPqf8LO+YUvnBvnlnjAalOcwaLDUBN9EAn1iICZdgr31mMSSLSs/+1SYtgjkIMWC2YL1bdmQNvyOFtqUP+klzzE18Sxmjp/ZgsYdIeAPTWEKYnnQ1ujJCaOiF+Av5op6xuBQ7yXYXnWfZQzvYUhIxuipXbudFWZXj/R3puOhlMA3Gr48DiK9++Fa94M3MzGKTXx0M4rrfhVPKxxxqcE2IrdD2kt/3NlQa0CA4J50tMWWSCZJIVfT0rS6Cl1ZNjRpwbqk3DAfKaZjg7xsY6wJFY6wG0mv94Gua9TdQGSUXMNA6l4ELqPvNkgnzVqcjv0b3quEji+4XEKLYsfQPEW/QakchOVrTcZ0PMqUTLYQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(376002)(39860400002)(366004)(396003)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(66574015)(64756008)(122000001)(110136005)(6506007)(71200400001)(5660300002)(8936002)(91956017)(2906002)(2616005)(76116006)(41300700001)(6512007)(8676002)(83380400001)(7416002)(6486002)(4326008)(66946007)(316002)(66446008)(478600001)(38100700002)(66556008)(66476007)(26005)(54906003)(82960400001)(86362001)(38070700009)(36756003)(921008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b3JRTDlkN0VlREtYenJ3MU5jQU5DamNwSzA2RXFOYnQwdzlMdlFDR2tqS3pa?=
 =?utf-8?B?Y1YySVh3TU91TjVQMTM1UVFEdnhWSzNtaytnbXg3bFprYnFCZ3BNelNTZGM4?=
 =?utf-8?B?YjZ2VXNuZ0VxdDZETTRHSm9FZG9iOXdvU0NiNlpndmNNbUdxd3dra05rSVdC?=
 =?utf-8?B?Qjg2M0ZVWjVjQVV4R1NaYzQxN0tTTGhlZ2o1Nng4cG1JRW9uY0VVYUlLak9t?=
 =?utf-8?B?SlNEUFhJMzZ1eXQ3T2UwUXFxajN4YUV4Si9sQUtUV0VIeC9XREMrdCtaMHZG?=
 =?utf-8?B?Ukg1Mld5OWZ5REtJYmJ6REI3MTFKT3hKN0x2cmk0R2hzZm1DQStmdlY5QjJ3?=
 =?utf-8?B?YlNJTDBoS3pYMGVTOWNRdzl0ck5WUEg3YVUyNFJOdTVpTjd2VC9MNUhucGN2?=
 =?utf-8?B?a2QzZDBBQlhLc295MGhOMXJGK20vMUxSWDl6VEJKYjFTZGhvWjJ4K0xqbVJ1?=
 =?utf-8?B?N0IvVlhzbjV3NWROS0JXT3NkYUY5alNwOVRCM2xUajhVRmRVWXEzTHV3dFFl?=
 =?utf-8?B?alpkRTJTejlOTENHSFJBblc2VmFZRCtLUzJ2L1NCdkxpbTBxOXlITDNxeElw?=
 =?utf-8?B?L1grMSsybUY1ZGxCN0dQRlJ1d0FCWEdlbjFlcTlxQlhFQXdzYkp1eDY3MlU1?=
 =?utf-8?B?U1RzZEw0ZHcvT1QrNzdRZFBqVk1VRzc0ZW1EWmNyY09ud2RndDRxdlJlYXFQ?=
 =?utf-8?B?VzJLem96eDVVdXV4Z1Q0NWJjQjNwWVdCTGs4Q3Q5K1NQd0Rwc2VYK3k5cEJV?=
 =?utf-8?B?eGlNVkErMllreWwxRXIzRkpuZzByS3pOWkpFTmZiUHdDbDlnMm9YdE9RVng5?=
 =?utf-8?B?blMwZ0dXNU8zcS80Z2RkYWFLd3VzQnBzVS9hK3l3MWU0TGFvc1VndDk2UUlx?=
 =?utf-8?B?aHU3c09PRys4anNoWkZKaUNxWW1jM1FWQU0wV0JkeEhnL1RlSjNXVTQvTWFK?=
 =?utf-8?B?OW5UWFF2TVNYelY2cjU3Qjc4cnN3UUpCVlBUdU9tTXprV1crTmtZQ2U3S01O?=
 =?utf-8?B?ZHdjSktUa3hYa015eDBLdE9mSkYrVUNvK2pjZkRwVUJYVG9yUWR3QzVNalhN?=
 =?utf-8?B?NTlMbTkyV2pSeFY2TGc0QUVGVXp6Sm5uUU5PTjNrS0VVYzdoVmFySjU5NHdz?=
 =?utf-8?B?Qkk2SFdkNXRmTC9LYTFobUIyRE9UaG9WK0VOL3hMUUdQRk1xYTFVZDJBbGxa?=
 =?utf-8?B?S1BYWG1YSnREQU9ObG9wREl2R0hiajFRL1VvaGc4djcybEdoUEIzUEFuTHlE?=
 =?utf-8?B?WmxoWERzTWpiRGY2cHVCcXI5dTZGRzRibHJXbGhydzJVa3lsTFo4RUd1Nm15?=
 =?utf-8?B?QzBIdVg1R1JyLzl2WVR3bGhCL21LczdJZkRPTDg2U2NyTllCSlRjOE9vVlZz?=
 =?utf-8?B?OWlqVTlDRkQwOUNBSTJQdEw5NVRibUI4OURTRWJSSHhCZ3ZmemhoNElzRnFD?=
 =?utf-8?B?cm1pbkZ2bVgwWHl4NXgyc0NPb3NDS3pMUFAyem5rT1RqMUFySy9SelRXVVFK?=
 =?utf-8?B?c1dYVWZCRG40OENGL2RHZnliYXNVbmZKaHpRSWJTMmMxVlVlYmdQZWhQTHZ0?=
 =?utf-8?B?elVJSTZCL3BaTS81Wm1xMUFsbWJ6cTg0czRjamJtNzZzOHlVZ2tvOEsyV1hZ?=
 =?utf-8?B?eHRmRTRSVG1na2xVeDhHeEl0QytqNElrTmVNUEp4amNFakN1UlZYR0orS21l?=
 =?utf-8?B?bk02eUluQjI5KzdURHRGNzhIYUJaQ1grQW5Jcy9RQUNqbVZUOGY3aWxndFkx?=
 =?utf-8?B?OU5PSm9EcHlTZTdMU1owWUtxbVY1STlEcnR1SWRRc2kxNzYybDlWanJtdnRI?=
 =?utf-8?B?K0xDNFRzS1V2VjhiZGNCaERxZzgzV1BmTGhiL2U1dXNLaWc2cVVESUpYRURu?=
 =?utf-8?B?SWtTTE1abjhzbzZOVGl1c2JSQ3lNRFRTZDMyR3lxZE5zTThMekg0T01BTGdV?=
 =?utf-8?B?LzVWRmdRTzh3M084Y0daMUxpZW44RUh5ZFZuVGQrYldtWWNDK1pVWEk3dkRy?=
 =?utf-8?B?cDBKSVY0a2o0a2MrSHgzbFJTQmJSRTVuVXd3WEpucVdLTUdOa2Q3RnpTb1lW?=
 =?utf-8?B?TlRxdUlsUjNzTmVkb2ZFUnpVWk8raWZEa1FoMytpMFB5eUs1dExRUjhpemRv?=
 =?utf-8?B?YTlpeEpSVFlZN0JoVFVaRUxNQTBlbzk3MTZ5VXh1MkxmdDlQSFI0b2NkQzRq?=
 =?utf-8?B?a0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D8DF9426A7AD4947BF2479CAEBBD9238@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91afe2f0-8a30-4bd3-6da0-08dbd52ee443
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2023 07:49:17.7472 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qTZdGyiSOLkwnH2UlnekjhiVNDfeJBIkCroUtdz67f0EfFxyZnoXx2Z/kR4VX9uIaU+9mIgqDPs+g5YjRiy+6eznear711ZTC5BEkJ6F/c4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5763
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

T24gV2VkLCAyMDIzLTA5LTI3IGF0IDEyOjI2ICswMjAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90
ZToKPiBNb3ZlIGZ1bmN0aW9ucyB3aXRoaW4gaW50ZWxfZmJkZXYuYyB0byBzaW1wbGlmeSBsYXRl
ciB1cGRhdGVzLiBNaW5vcgo+IHN0eWxlIGZpeGVzIHRvIG1ha2UgY2hlY2twYXRjaCBoYXBweSwg
YnV0IG5vIGZ1bmN0aW9uYWwgY2hhbmdlcy4KPiAKPiB2NToKPiDCoMKgwqDCoMKgwqDCoMKgKiBz
dHlsZSBmaXhlcyAoY2hlY2twYXRjaCkKPiAKPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVy
bWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KClJldmlld2VkLWJ5OiBKb3VuaSBIw7ZnYW5kZXIg
PGpvdW5pLmhvZ2FuZGVyQGludGVsLmNvbT4KCj4gLS0tCj4gwqBkcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX2ZiZGV2LmMgfCAxNTQgKysrKysrKysrKy0tLS0tLS0tLQo+IC0tCj4g
wqAxIGZpbGUgY2hhbmdlZCwgNzcgaW5zZXJ0aW9ucygrKSwgNzcgZGVsZXRpb25zKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZmJkZXYuYwo+
IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9mYmRldi5jCj4gaW5kZXggMzFk
MGQ2OTVkNTY3MS4uMjY5NWM2NWI1NWRkYyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX2ZiZGV2LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2ZiZGV2LmMKPiBAQCAtNTQ1LDU4ICs1NDUsNiBAQCBzdGF0aWMgdm9pZCBp
bnRlbF9mYmRldl9zdXNwZW5kX3dvcmtlcihzdHJ1Y3QKPiB3b3JrX3N0cnVjdCAqd29yaykKPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgdHJ1ZSk7Cj4gwqB9Cj4gwqAKPiAtaW50IGludGVsX2ZiZGV2X2luaXQoc3RydWN0IGRy
bV9kZXZpY2UgKmRldikKPiAtewo+IC3CoMKgwqDCoMKgwqDCoHN0cnVjdCBkcm1faTkxNV9wcml2
YXRlICpkZXZfcHJpdiA9IHRvX2k5MTUoZGV2KTsKPiAtwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgaW50
ZWxfZmJkZXYgKmlmYmRldjsKPiAtwqDCoMKgwqDCoMKgwqBpbnQgcmV0Owo+IC0KPiAtwqDCoMKg
wqDCoMKgwqBpZiAoZHJtX1dBUk5fT04oZGV2LCAhSEFTX0RJU1BMQVkoZGV2X3ByaXYpKSkKPiAt
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIC1FTk9ERVY7Cj4gLQo+IC3CoMKg
wqDCoMKgwqDCoGlmYmRldiA9IGt6YWxsb2Moc2l6ZW9mKHN0cnVjdCBpbnRlbF9mYmRldiksIEdG
UF9LRVJORUwpOwo+IC3CoMKgwqDCoMKgwqDCoGlmIChpZmJkZXYgPT0gTlVMTCkKPiAtwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIC1FTk9NRU07Cj4gLQo+IC3CoMKgwqDCoMKg
wqDCoG11dGV4X2luaXQoJmlmYmRldi0+aHBkX2xvY2spOwo+IC3CoMKgwqDCoMKgwqDCoGRybV9m
Yl9oZWxwZXJfcHJlcGFyZShkZXYsICZpZmJkZXYtPmhlbHBlciwgMzIsCj4gJmludGVsX2ZiX2hl
bHBlcl9mdW5jcyk7Cj4gLQo+IC3CoMKgwqDCoMKgwqDCoGlmIChpbnRlbF9mYmRldl9pbml0X2Jp
b3MoZGV2LCBpZmJkZXYpKQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZmJkZXYt
PmhlbHBlci5wcmVmZXJyZWRfYnBwID0gaWZiZGV2LT5wcmVmZXJyZWRfYnBwOwo+IC3CoMKgwqDC
oMKgwqDCoGVsc2UKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWZiZGV2LT5wcmVm
ZXJyZWRfYnBwID0gaWZiZGV2LT5oZWxwZXIucHJlZmVycmVkX2JwcDsKPiAtCj4gLcKgwqDCoMKg
wqDCoMKgcmV0ID0gZHJtX2ZiX2hlbHBlcl9pbml0KGRldiwgJmlmYmRldi0+aGVscGVyKTsKPiAt
wqDCoMKgwqDCoMKgwqBpZiAocmV0KSB7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oGtmcmVlKGlmYmRldik7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiBy
ZXQ7Cj4gLcKgwqDCoMKgwqDCoMKgfQo+IC0KPiAtwqDCoMKgwqDCoMKgwqBkZXZfcHJpdi0+ZGlz
cGxheS5mYmRldi5mYmRldiA9IGlmYmRldjsKPiAtwqDCoMKgwqDCoMKgwqBJTklUX1dPUksoJmRl
dl9wcml2LT5kaXNwbGF5LmZiZGV2LnN1c3BlbmRfd29yaywKPiBpbnRlbF9mYmRldl9zdXNwZW5k
X3dvcmtlcik7Cj4gLQo+IC3CoMKgwqDCoMKgwqDCoHJldHVybiAwOwo+IC19Cj4gLQo+IC1zdGF0
aWMgdm9pZCBpbnRlbF9mYmRldl9pbml0aWFsX2NvbmZpZyh2b2lkICpkYXRhLCBhc3luY19jb29r
aWVfdAo+IGNvb2tpZSkKPiAtewo+IC3CoMKgwqDCoMKgwqDCoHN0cnVjdCBpbnRlbF9mYmRldiAq
aWZiZGV2ID0gZGF0YTsKPiAtCj4gLcKgwqDCoMKgwqDCoMKgLyogRHVlIHRvIHBlY3VsaWFyIGlu
aXQgb3JkZXIgd3J0IHRvIGhwZCBoYW5kbGluZyB0aGlzIGlzCj4gc2VwYXJhdGUuICovCj4gLcKg
wqDCoMKgwqDCoMKgaWYgKGRybV9mYl9oZWxwZXJfaW5pdGlhbF9jb25maWcoJmlmYmRldi0+aGVs
cGVyKSkKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaW50ZWxfZmJkZXZfdW5yZWdp
c3Rlcih0b19pOTE1KGlmYmRldi0+aGVscGVyLmRldikpOwo+IC19Cj4gLQo+IC12b2lkIGludGVs
X2ZiZGV2X2luaXRpYWxfY29uZmlnX2FzeW5jKHN0cnVjdCBkcm1faTkxNV9wcml2YXRlCj4gKmRl
dl9wcml2KQo+IC17Cj4gLcKgwqDCoMKgwqDCoMKgc3RydWN0IGludGVsX2ZiZGV2ICppZmJkZXYg
PSBkZXZfcHJpdi0+ZGlzcGxheS5mYmRldi5mYmRldjsKPiAtCj4gLcKgwqDCoMKgwqDCoMKgaWYg
KCFpZmJkZXYpCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybjsKPiAtCj4g
LcKgwqDCoMKgwqDCoMKgaWZiZGV2LT5jb29raWUgPSBhc3luY19zY2hlZHVsZShpbnRlbF9mYmRl
dl9pbml0aWFsX2NvbmZpZywKPiBpZmJkZXYpOwo+IC19Cj4gLQo+IMKgc3RhdGljIHZvaWQgaW50
ZWxfZmJkZXZfc3luYyhzdHJ1Y3QgaW50ZWxfZmJkZXYgKmlmYmRldikKPiDCoHsKPiDCoMKgwqDC
oMKgwqDCoMKgaWYgKCFpZmJkZXYtPmNvb2tpZSkKPiBAQCAtNjA3LDMxICs1NTUsNiBAQCBzdGF0
aWMgdm9pZCBpbnRlbF9mYmRldl9zeW5jKHN0cnVjdCBpbnRlbF9mYmRldgo+ICppZmJkZXYpCj4g
wqDCoMKgwqDCoMKgwqDCoGlmYmRldi0+Y29va2llID0gMDsKPiDCoH0KPiDCoAo+IC12b2lkIGlu
dGVsX2ZiZGV2X3VucmVnaXN0ZXIoc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9wcml2KQo+
IC17Cj4gLcKgwqDCoMKgwqDCoMKgc3RydWN0IGludGVsX2ZiZGV2ICppZmJkZXYgPSBkZXZfcHJp
di0+ZGlzcGxheS5mYmRldi5mYmRldjsKPiAtCj4gLcKgwqDCoMKgwqDCoMKgaWYgKCFpZmJkZXYp
Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybjsKPiAtCj4gLcKgwqDCoMKg
wqDCoMKgaW50ZWxfZmJkZXZfc2V0X3N1c3BlbmQoJmRldl9wcml2LT5kcm0sCj4gRkJJTkZPX1NU
QVRFX1NVU1BFTkRFRCwgdHJ1ZSk7Cj4gLQo+IC3CoMKgwqDCoMKgwqDCoGlmICghY3VycmVudF9p
c19hc3luYygpKQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpbnRlbF9mYmRldl9z
eW5jKGlmYmRldik7Cj4gLQo+IC3CoMKgwqDCoMKgwqDCoGRybV9mYl9oZWxwZXJfdW5yZWdpc3Rl
cl9pbmZvKCZpZmJkZXYtPmhlbHBlcik7Cj4gLX0KPiAtCj4gLXZvaWQgaW50ZWxfZmJkZXZfZmlu
aShzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqZGV2X3ByaXYpCj4gLXsKPiAtwqDCoMKgwqDCoMKg
wqBzdHJ1Y3QgaW50ZWxfZmJkZXYgKmlmYmRldiA9IGZldGNoX2FuZF96ZXJvKCZkZXZfcHJpdi0K
PiA+ZGlzcGxheS5mYmRldi5mYmRldik7Cj4gLQo+IC3CoMKgwqDCoMKgwqDCoGlmICghaWZiZGV2
KQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm47Cj4gLQo+IC3CoMKgwqDC
oMKgwqDCoGludGVsX2ZiZGV2X2Rlc3Ryb3koaWZiZGV2KTsKPiAtfQo+IC0KPiDCoC8qIFN1c3Bl
bmRzL3Jlc3VtZXMgZmJkZXYgcHJvY2Vzc2luZyBvZiBpbmNvbWluZyBIUEQgZXZlbnRzLiBXaGVu
Cj4gcmVzdW1pbmcgSFBECj4gwqAgKiBwcm9jZXNzaW5nLCBmYmRldiB3aWxsIHBlcmZvcm0gYSBm
dWxsIGNvbm5lY3RvciByZXByb2JlIGlmIGEKPiBob3RwbHVnIGV2ZW50Cj4gwqAgKiB3YXMgcmVj
ZWl2ZWQgd2hpbGUgSFBEIHdhcyBzdXNwZW5kZWQuCj4gQEAgLTc0OCw2ICs2NzEsODMgQEAgdm9p
ZCBpbnRlbF9mYmRldl9yZXN0b3JlX21vZGUoc3RydWN0Cj4gZHJtX2k5MTVfcHJpdmF0ZSAqZGV2
X3ByaXYpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpbnRlbF9mYmRldl9pbnZh
bGlkYXRlKGlmYmRldik7Cj4gwqB9Cj4gwqAKPiAraW50IGludGVsX2ZiZGV2X2luaXQoc3RydWN0
IGRybV9kZXZpY2UgKmRldikKPiArewo+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCBkcm1faTkxNV9w
cml2YXRlICpkZXZfcHJpdiA9IHRvX2k5MTUoZGV2KTsKPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3Qg
aW50ZWxfZmJkZXYgKmlmYmRldjsKPiArwqDCoMKgwqDCoMKgwqBpbnQgcmV0Owo+ICsKPiArwqDC
oMKgwqDCoMKgwqBpZiAoZHJtX1dBUk5fT04oZGV2LCAhSEFTX0RJU1BMQVkoZGV2X3ByaXYpKSkK
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIC1FTk9ERVY7Cj4gKwo+ICvC
oMKgwqDCoMKgwqDCoGlmYmRldiA9IGt6YWxsb2Moc2l6ZW9mKCppZmJkZXYpLCBHRlBfS0VSTkVM
KTsKPiArwqDCoMKgwqDCoMKgwqBpZiAoIWlmYmRldikKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgcmV0dXJuIC1FTk9NRU07Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoG11dGV4X2luaXQo
JmlmYmRldi0+aHBkX2xvY2spOwo+ICvCoMKgwqDCoMKgwqDCoGRybV9mYl9oZWxwZXJfcHJlcGFy
ZShkZXYsICZpZmJkZXYtPmhlbHBlciwgMzIsCj4gJmludGVsX2ZiX2hlbHBlcl9mdW5jcyk7Cj4g
Kwo+ICvCoMKgwqDCoMKgwqDCoGlmIChpbnRlbF9mYmRldl9pbml0X2Jpb3MoZGV2LCBpZmJkZXYp
KQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZmJkZXYtPmhlbHBlci5wcmVmZXJy
ZWRfYnBwID0gaWZiZGV2LT5wcmVmZXJyZWRfYnBwOwo+ICvCoMKgwqDCoMKgwqDCoGVsc2UKPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWZiZGV2LT5wcmVmZXJyZWRfYnBwID0gaWZi
ZGV2LT5oZWxwZXIucHJlZmVycmVkX2JwcDsKPiArCj4gK8KgwqDCoMKgwqDCoMKgcmV0ID0gZHJt
X2ZiX2hlbHBlcl9pbml0KGRldiwgJmlmYmRldi0+aGVscGVyKTsKPiArwqDCoMKgwqDCoMKgwqBp
ZiAocmV0KSB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGtmcmVlKGlmYmRldik7
Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiByZXQ7Cj4gK8KgwqDCoMKg
wqDCoMKgfQo+ICsKPiArwqDCoMKgwqDCoMKgwqBkZXZfcHJpdi0+ZGlzcGxheS5mYmRldi5mYmRl
diA9IGlmYmRldjsKPiArwqDCoMKgwqDCoMKgwqBJTklUX1dPUksoJmRldl9wcml2LT5kaXNwbGF5
LmZiZGV2LnN1c3BlbmRfd29yaywKPiBpbnRlbF9mYmRldl9zdXNwZW5kX3dvcmtlcik7Cj4gKwo+
ICvCoMKgwqDCoMKgwqDCoHJldHVybiAwOwo+ICt9Cj4gKwo+ICtzdGF0aWMgdm9pZCBpbnRlbF9m
YmRldl9pbml0aWFsX2NvbmZpZyh2b2lkICpkYXRhLCBhc3luY19jb29raWVfdAo+IGNvb2tpZSkK
PiArewo+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCBpbnRlbF9mYmRldiAqaWZiZGV2ID0gZGF0YTsK
PiArCj4gK8KgwqDCoMKgwqDCoMKgLyogRHVlIHRvIHBlY3VsaWFyIGluaXQgb3JkZXIgd3J0IHRv
IGhwZCBoYW5kbGluZyB0aGlzIGlzCj4gc2VwYXJhdGUuICovCj4gK8KgwqDCoMKgwqDCoMKgaWYg
KGRybV9mYl9oZWxwZXJfaW5pdGlhbF9jb25maWcoJmlmYmRldi0+aGVscGVyKSkKPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaW50ZWxfZmJkZXZfdW5yZWdpc3Rlcih0b19pOTE1KGlm
YmRldi0+aGVscGVyLmRldikpOwo+ICt9Cj4gKwo+ICt2b2lkIGludGVsX2ZiZGV2X2luaXRpYWxf
Y29uZmlnX2FzeW5jKHN0cnVjdCBkcm1faTkxNV9wcml2YXRlCj4gKmRldl9wcml2KQo+ICt7Cj4g
K8KgwqDCoMKgwqDCoMKgc3RydWN0IGludGVsX2ZiZGV2ICppZmJkZXYgPSBkZXZfcHJpdi0+ZGlz
cGxheS5mYmRldi5mYmRldjsKPiArCj4gK8KgwqDCoMKgwqDCoMKgaWYgKCFpZmJkZXYpCj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybjsKPiArCj4gK8KgwqDCoMKgwqDCoMKg
aWZiZGV2LT5jb29raWUgPSBhc3luY19zY2hlZHVsZShpbnRlbF9mYmRldl9pbml0aWFsX2NvbmZp
ZywKPiBpZmJkZXYpOwo+ICt9Cj4gKwo+ICt2b2lkIGludGVsX2ZiZGV2X3VucmVnaXN0ZXIoc3Ry
dWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9wcml2KQo+ICt7Cj4gK8KgwqDCoMKgwqDCoMKgc3Ry
dWN0IGludGVsX2ZiZGV2ICppZmJkZXYgPSBkZXZfcHJpdi0+ZGlzcGxheS5mYmRldi5mYmRldjsK
PiArCj4gK8KgwqDCoMKgwqDCoMKgaWYgKCFpZmJkZXYpCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoHJldHVybjsKPiArCj4gK8KgwqDCoMKgwqDCoMKgaW50ZWxfZmJkZXZfc2V0X3N1
c3BlbmQoJmRldl9wcml2LT5kcm0sCj4gRkJJTkZPX1NUQVRFX1NVU1BFTkRFRCwgdHJ1ZSk7Cj4g
Kwo+ICvCoMKgwqDCoMKgwqDCoGlmICghY3VycmVudF9pc19hc3luYygpKQo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBpbnRlbF9mYmRldl9zeW5jKGlmYmRldik7Cj4gKwo+ICvCoMKg
wqDCoMKgwqDCoGRybV9mYl9oZWxwZXJfdW5yZWdpc3Rlcl9pbmZvKCZpZmJkZXYtPmhlbHBlcik7
Cj4gK30KPiArCj4gK3ZvaWQgaW50ZWxfZmJkZXZfZmluaShzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0
ZSAqZGV2X3ByaXYpCj4gK3sKPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgaW50ZWxfZmJkZXYgKmlm
YmRldiA9IGZldGNoX2FuZF96ZXJvKCZkZXZfcHJpdi0KPiA+ZGlzcGxheS5mYmRldi5mYmRldik7
Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoGlmICghaWZiZGV2KQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqByZXR1cm47Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoGludGVsX2ZiZGV2X2Rlc3Ry
b3koaWZiZGV2KTsKPiArfQo+ICsKPiDCoHN0cnVjdCBpbnRlbF9mcmFtZWJ1ZmZlciAqaW50ZWxf
ZmJkZXZfZnJhbWVidWZmZXIoc3RydWN0IGludGVsX2ZiZGV2Cj4gKmZiZGV2KQo+IMKgewo+IMKg
wqDCoMKgwqDCoMKgwqBpZiAoIWZiZGV2IHx8ICFmYmRldi0+aGVscGVyLmZiKQoK
