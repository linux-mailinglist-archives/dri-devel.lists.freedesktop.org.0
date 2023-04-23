Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1429E6EBD86
	for <lists+dri-devel@lfdr.de>; Sun, 23 Apr 2023 08:52:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F47610E397;
	Sun, 23 Apr 2023 06:52:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D15EA10E38F;
 Sun, 23 Apr 2023 06:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682232744; x=1713768744;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vMik9wPEO4kTm8QZoANYWaT/ZXKJ6vImtYvni0xprVo=;
 b=id/W1Kh9vphvGElRsz6MhJFBgvrhc/B98vNrBNMmZmecyK713HckAm4L
 0Fgq0zhxUuQiP7atKAGA57oDpsSk30HnLFP+Zdm4TFjEoqEugafHp2AOn
 3j/tdGU9Cuq1IJ3EDYOS4CGy23/b8x1iclFz2qBvq6XpL1UACSHVW2XNE
 zQxAx7l0LMctkAn8Tk9ekuMZiNJ9XWTVXp7lpPiMMxuxMb/9yBc44gMQq
 O3xDR+ubVGNGi1zmINu2QMNovzCwSP1rP65oiB4Vk7DYjaAuSg7okPxb3
 CW8NxnFCnGggZ0sNfqWiMkOpLIkr0feTw3q1ZoBxo1mj8IJ1o1TC51pqB Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="330459443"
X-IronPort-AV: E=Sophos;i="5.99,219,1677571200"; d="scan'208";a="330459443"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2023 23:52:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="762025139"
X-IronPort-AV: E=Sophos;i="5.99,219,1677571200"; d="scan'208";a="762025139"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP; 22 Apr 2023 23:52:23 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sat, 22 Apr 2023 23:52:22 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Sat, 22 Apr 2023 23:52:22 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Sat, 22 Apr 2023 23:52:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lcr1ib0ZacrufUUCL/Ddl3rpRssmklkqo4zD2CYsHIk36HNdlqyx0THGi/r4gQtP+rCTTZB5zcLYml29PZ87ObVzy4Mgg3BlvJ7m+nDDDFWNb2Uv7GKiZfWDAT3RxCiKaBwuK8Md6dmg89V9CjK8WcOHaU78SL29fl1iASFRL05ybAlIB8udg6wJsWzYds+2mpFzbDqbnlu4A+3V6kqI3pO0/lgp9Pi/iPgXNdQlvjN06/55yDEqvcxKRKLo8y+EGmJdkZ3JrzYLQFu7j2OOGso7yqoF46ZtHvLQjoK6pqnFOCyzD7aYD2lWRnZVOfvblrLzsT6jkZaTc6VWY1wJ5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vMik9wPEO4kTm8QZoANYWaT/ZXKJ6vImtYvni0xprVo=;
 b=SWMthmdX5NXm/3KoXRZFmPWUoUX4zQxHAWp3yNQbTtl62lBQPqYb5gsM9oH4KZJnLYR9EJLRbFLWylmcvxfVWxZQktvCeUSVdMO7U+3f2cu71y8bqP1CHEJb2hhToM/03aTosNkKExdw7SgN5SStgbqJkhWORKtknsgRaksb6N1odptqynW6WzKOi+1ZzJqIg9Y/kUKKTgCbG7LmovtZ82UtbGNKyT340D8CK1XjtuFb+wki/5y8ZBLxtMRRzjyxmBCuizP4OPTZdH0z07H/P92CTPuj7dDObi41/sSTWwHnIVPT+80mKIbQD1juo7N7+BYLlV3gE/2oNMgWT9m8Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB2567.namprd11.prod.outlook.com (2603:10b6:a02:c5::32)
 by SA0PR11MB4590.namprd11.prod.outlook.com (2603:10b6:806:96::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.32; Sun, 23 Apr
 2023 06:52:20 +0000
Received: from BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::12b1:c9af:ed85:e3ee]) by BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::12b1:c9af:ed85:e3ee%4]) with mapi id 15.20.6319.032; Sun, 23 Apr 2023
 06:52:20 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH 7/8] drm/i915: use pat_index instead of
 cache_level
Thread-Topic: [Intel-gfx] [PATCH 7/8] drm/i915: use pat_index instead of
 cache_level
Thread-Index: AQHZcxKpqVeDDseo0UC0W5tSiHqhU681pdmAgALJTVA=
Date: Sun, 23 Apr 2023 06:52:20 +0000
Message-ID: <BYAPR11MB2567E4680658824BD81D01229A669@BYAPR11MB2567.namprd11.prod.outlook.com>
References: <20230419230058.2659455-1-fei.yang@intel.com>
 <20230419230058.2659455-8-fei.yang@intel.com>
 <3405a3c8-8ad4-958f-c1dd-4b3105daca31@linux.intel.com>
In-Reply-To: <3405a3c8-8ad4-958f-c1dd-4b3105daca31@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB2567:EE_|SA0PR11MB4590:EE_
x-ms-office365-filtering-correlation-id: a13bbf46-572a-4e1d-3964-08db43c748fe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YDtspIU+afdtw7VyJ1uq2nizsbTkIR7wiqozcXKn4lXZrHFBWFiWf9hzdHTVBAzUFbs50ZswbBTi9UVVDYXCMgPQZmqg7SPG0mcEEOZgrYjUPucLx+Y+fHhODhCY60jOLDZ4OLrSP0r9bPpgQVXCbVBfjvlz9FWbuL377KsK7tQbMdC5u0mnzN8rRsqVcrMhvignT4YF7yokdMPp/smuYmUTWpp9w29R13HMXYbB4nuRi3mVOcISdFRtKHbL9mda68sXC7W6MTqXSF+biHWNfctaOgoI827WhFS2YW0UxfdVUkR8s9e3wXWL7NcZgOWfocra6lwe/WP00wXHTyFOxtH6GXHqpeHzqccWDkrqzOIbnVF0OSC4kMRoTsBL4YZlOnSFJQj+MAPrbGzKvKBMoeYWKZwdlXex+7wchvLG3MwAlxYkJDnu1N+yi0C/Oq6lLvp2hG0VvRGjr9N+ATSgJ/x3ENMPpg7kqpuHlUkjkpMoUz3XTV65Zm0A5lIswax/12wKGKxiswt42YKe706OvScowSoM5Yqqf18GCds1xJRBAzRMxMSzEVAuhvdJljmUbIM/01Rf6w2eW164H0QVra9yKbHaN5JUc/+4gAZcbwI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2567.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(366004)(396003)(136003)(39860400002)(346002)(451199021)(71200400001)(7696005)(55016003)(33656002)(86362001)(5660300002)(54906003)(38070700005)(2906002)(478600001)(110136005)(82960400001)(52536014)(6506007)(53546011)(186003)(8676002)(8936002)(41300700001)(9686003)(26005)(122000001)(38100700002)(66476007)(64756008)(66556008)(76116006)(4326008)(66946007)(316002)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dXo1aE9rL3psenFzblQvMnovdVVsUGtUK0o1ZmkwMGM1d2NjMGNZT2xjUHFV?=
 =?utf-8?B?UVlZc3ZhVDh4aFdMdDVpUFlHeE1UQXgxbi92MFBwbkFTU2l5V1ZZSW9SVFVS?=
 =?utf-8?B?L1d2M0RpMU1iT3BOTWtEMFQvS0R4NTZZSnpWc3dJZmd0d2o2K3o4QjhRbnNI?=
 =?utf-8?B?aThFcmFZSFozUnhUZ01UOEZtVUtPVk5WRkRWc1RRMkh0d3JONjY3ZTYzc0Zu?=
 =?utf-8?B?UnNsUncyd2UxMU1jRlRPQnUzYjk0RkNQRC9yanJVWXE4cm00Zm0vSGlLbFdB?=
 =?utf-8?B?ZWJzZERSU1dOWFFPMEVOUWZnZ0pFMFB2SFhvYS9wY2NjcWw1TzlzeVcvN3Zk?=
 =?utf-8?B?M1VnOG1POGFoRi9sQ3JUaXFMY2pGV1NoSEovSTFXWU5CV0htc0Z5NG52NHoz?=
 =?utf-8?B?eUVYZGl5dGFWaXdjTGdiWjVnaEREOW1GSnBxS2V3Tktzd3dvWGhvT0JRRVZN?=
 =?utf-8?B?dzlZQ3paTDhhM1FQb2lsMk40MEdQZzIrTTc3Y2xPK0t6Zkd5bHBHTHhEQUtD?=
 =?utf-8?B?blZURmJaeU13NHpDdlBzcUhmbDJrSTdaN2VmUjE5cUJSVkJmWGRFNWtqaXNR?=
 =?utf-8?B?SVZsLzNMdm4vZlBEYnpoeXJuMlRIMldnVEJKeXdSL3pJRXBMM3VvWTZseTNo?=
 =?utf-8?B?U2FJSDQ2aXZkdGNMaUhjS3ZvN0E4MmZGaVZab0NhblRuWThlMkM1VjF5bGlo?=
 =?utf-8?B?MnVVUjJtaE85dExSSXpjbU9GbUpOMXo4aGlLY3pJRDhsTUtEZU1UU2FybFlw?=
 =?utf-8?B?bHFvU2VjUWRyeUU1Rm1jT052bzNBMEZ5UUpBLzZpSkRQSkF5VEVVOTh4OEx4?=
 =?utf-8?B?Q0RXS3dBSGlISVorZnBZdzRxdDBHd1BTRGtOeFNpUFYzazFPNWRNd3IxakFk?=
 =?utf-8?B?Qjh1RzMrN1ZpTnFUVFV1NHZCUWVZanZBOXJBaE9HOUdZVUhMTXd1dnRJWFVP?=
 =?utf-8?B?UUJUdGRTMDg2U0M5SU9saFcrMk5MNzRGUDFwKzhvdzdCZTBuZzJzSHhHc0hL?=
 =?utf-8?B?RnVsVlMyV2ZtTjRQRzl4QWs4WEdsYW5Pb25INVBuZ2M1S1lFTlk2Vm03dmQr?=
 =?utf-8?B?Nkw2S0tnSDlZemxva0pva0NqZzZ5ZUhZL0NvR0NzTVUzNjY1enl0elZ0dXBJ?=
 =?utf-8?B?YU9xNmZLUmY1bXdIREdRZTVraUU1cUt5QzVqaG1ZdEtFbzNrd2JNcWZubkxS?=
 =?utf-8?B?ZDBtTnJocGxndEpDWmw1b3JUVVF1TlNJZ2RQdWxlVndTcU9Ybjh6RGJhc3po?=
 =?utf-8?B?MFBsakFQcWdrYzAycDk2MThhcDNRbWtvSnRSdDBtcng4ajkzdERFdnhJV1ds?=
 =?utf-8?B?MXBMSHdJZVIvdG9lZUlyTk9wOHBMdjAxNHptbXZPREZQYTBKUEJORWRBOTRG?=
 =?utf-8?B?Z2wwc1NueFBCOGgzWEZ3SGV5eVF6UHd0SkdCZHBpSzUrY0RKVnRIajZCd0Iv?=
 =?utf-8?B?czA0MzRjM0wySUZOWnA4TWJHcHJTYnBvTDd0MHZJNGt3YXBQMW02b0hDdW5t?=
 =?utf-8?B?dXJUaTQ1TW5SUzlGK2ZCcDJkK3MrNWhpdUFkOEJmUVE2WkcvZWRRbjlERFlZ?=
 =?utf-8?B?T0tUd0g4N3pxYmR5bDdQL0d6dDBIYXVHSGQ5d0tFcENCcmU2TkpLbkRDdkRX?=
 =?utf-8?B?MFA0QmcycElqRmd4TlN5VVNaSWdqbE9iV0sxcFpKOTNIVVNXUk5PaFJTa3JQ?=
 =?utf-8?B?dHlpRmR6NkNwWkdxaVhJNGh6NkxZZUN1cy8yZHdGUnRWSkE1Vmt6akFPU3RD?=
 =?utf-8?B?b3g5d3J5c3ZTZk1IcGxrWU1QSEhtZ0N5WVpqRVYzVkRNdzRMYjhkTVh2OE5p?=
 =?utf-8?B?VVN0TmxZQmFxSkdXZ2ZVQ0pYZXNmZ3p5QWlGNVRnMXhtV3JHeWhaT2ZWa1Ey?=
 =?utf-8?B?Z3JJWjNETXJkVG5TbmdBSjNsTk1jVnBtTWl4R3d4UEVCb0craEd6aU43MVA1?=
 =?utf-8?B?VXBiVnUvZUVTTnY1UTFGa0dHbVVhME9vNERHcTBSZml2ODdZZDR6cThKcWVp?=
 =?utf-8?B?TVhERExmREJxTklidDdjSUphdmVta2lOcVE1VlZ5eDhnT3V0ZGdPUXJCSUw3?=
 =?utf-8?B?R1pSVXMvbG5SaGE0UUpNbThUaloyUDBadXd3blBuS08yK2NLNzRZZmgyK3B4?=
 =?utf-8?Q?EvlQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2567.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a13bbf46-572a-4e1d-3964-08db43c748fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2023 06:52:20.4624 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h9l56g/ZSoUx6N3oWdqGdmu/BmsZ90UjT7uEdHmjHszVdP5TEERV5upfRL469kmDK3gfywFQKO0S+2Zy3xzI9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4590
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
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBPbiAyMC8wNC8yMDIzIDAwOjAwLCBmZWkueWFuZ0BpbnRlbC5jb20gd3JvdGU6DQo+PiBGcm9t
OiBGZWkgWWFuZyA8ZmVpLnlhbmdAaW50ZWwuY29tPg0KPj4NCj4+IEN1cnJlbnRseSB0aGUgS01E
IGlzIHVzaW5nIGVudW0gaTkxNV9jYWNoZV9sZXZlbCB0byBzZXQgY2FjaGluZyBwb2xpY3kgZm9y
DQo+PiBidWZmZXIgb2JqZWN0cy4gVGhpcyBpcyBmbGFreSBiZWNhdXNlIHRoZSBQQVQgaW5kZXgg
d2hpY2ggcmVhbGx5IGNvbnRyb2xzDQo+PiB0aGUgY2FjaGluZyBiZWhhdmlvciBpbiBQVEUgaGFz
IGZhciBtb3JlIGxldmVscyB0aGFuIHdoYXQncyBkZWZpbmVkIGluIHRoZQ0KPj4gZW51bS4gSW4g
YWRkaXRpb24sIHRoZSBQQVQgaW5kZXggaXMgcGxhdGZvcm0gZGVwZW5kZW50LCBoYXZpbmcgdG8g
dHJhbnNsYXRlDQo+PiBiZXR3ZWVuIGk5MTVfY2FjaGVfbGV2ZWwgYW5kIFBBVCBpbmRleCBpcyBu
b3QgcmVsaWFibGUsIGFuZCBtYWtlcyB0aGUgY29kZQ0KPj4gbW9yZSBjb21wbGljYXRlZC4NCj4+
DQo+Pj5Gcm9tIFVNRCdzIHBlcnNwZWN0aXZlIHRoZXJlIGlzIGFsc28gYSBuZWNlc3NpdHkgdG8g
c2V0IGNhY2hpbmcgcG9saWN5IGZvcg0KPj4gcGVyZm9ybWFuY2UgZmluZSB0dW5pbmcuIEl0J3Mg
bXVjaCBlYXNpZXIgZm9yIHRoZSBVTUQgdG8gZGlyZWN0bHkgdXNlIFBBVA0KPj4gaW5kZXggYmVj
YXVzZSB0aGUgYmVoYXZpb3Igb2YgZWFjaCBQQVQgaW5kZXggaXMgY2xlYXJseSBkZWZpbmVkIGlu
IEJzcGVjLg0KPj4gSGF2aW5nIHRoZSBhYnN0cmFjdGVkIGk5MTVfY2FjaGVfbGV2ZWwgc2l0dGlu
ZyBpbiBiZXR3ZWVuIHdvdWxkIG9ubHkgY2F1c2UNCj4+IG1vcmUgYW1iaWd1aXR5Lg0KPj4NCj4+
IEZvciB0aGVzZSByZWFzb25zIHRoaXMgcGF0Y2ggcmVwbGFjZXMgaTkxNV9jYWNoZV9sZXZlbCB3
aXRoIFBBVCBpbmRleC4gQWxzbw0KPj4gbm90ZSwgdGhlIGNhY2hlX2xldmVsIGlzIG5vdCBjb21w
bGV0ZWx5IHJlbW92ZWQgeWV0LCBiZWNhdXNlIHRoZSBLTUQgc3RpbGwNCj4+IGhhcyB0aGUgbmVl
ZCBvZiBjcmVhdGluZyBidWZmZXIgb2JqZWN0cyB3aXRoIHNpbXBsZSBjYWNoZSBzZXR0aW5ncyBz
dWNoIGFzDQo+PiBjYWNoZWQsIHVuY2FjaGVkLCBvciB3cml0ZXRocm91Z2guIEZvciBzdWNoIHNp
bXBsZSBjYXNlcywgdXNpbmcgY2FjaGVfbGV2ZWwNCj4+IHdvdWxkIGhlbHAgc2ltcGxpZnkgdGhl
IGNvZGUuDQo+Pg0KPj4gQ2M6IENocmlzIFdpbHNvbiA8Y2hyaXMucC53aWxzb25AbGludXguaW50
ZWwuY29tPg0KPj4gQ2M6IE1hdHQgUm9wZXIgPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+DQo+
PiBTaWduZWQtb2ZmLWJ5OiBGZWkgWWFuZyA8ZmVpLnlhbmdAaW50ZWwuY29tPg0KPj4gUmV2aWV3
ZWQtYnk6IEFuZGkgU2h5dGkgPGFuZGkuc2h5dGlAbGludXguaW50ZWwuY29tPg0KPg0KPiBJIHRo
aW5rIGhhdmUgc29tZSBpZGVhcyBubyBob3cgdG8gcGVyaGFwcyBtYWtlIHRoaXMgc2ltcGxlciwg
cGxlYXNlIGJlYXINCj4gd2l0aCBtZS4NCj4NCj4gSW4gbXkgbWluZCBnZXQvc2V0IGNhY2hpbmcg
aW9jdGxzIG5lZWQgdG8gYmUgZmFpbGluZyBvbmNlIGV4cGxpY2l0IHBhdA0KPiBpbmRleCBoYXMg
YmVlbiBzZXQgYnkgdXNlcnNwYWNlLiBPciBhdCBsZWFzdCBub3QgcmV0dXJuIGZhbHNlIGluZm9y
bWF0aW9uLg0KDQpCeSBkZXNpZ24gd2UgYXJlIGVuZGluZyB0aGUgc3VwcG9ydCBmb3Igc2V0IGNh
Y2hpbmcgaW9jdGwuIFRoZSBwYXRjaCBpcyBpbmNsdWRlZA0KaW4gdGhpcyBzZXJpZXMsICJkcm0v
aTkxNS9tdGw6IGVuZCBzdXBwb3J0IGZvciBzZXQgY2FjaGluZyBpb2N0bCINCg0KKyAgICAgICBp
ZiAoR1JBUEhJQ1NfVkVSX0ZVTEwoaTkxNSkgPj0gSVBfVkVSKDEyLCA3MCkpDQorICAgICAgICAg
ICAgICAgcmV0dXJuIC1FT1BOT1RTVVBQOw0KKw0KDQo+IEFuZCBJIGRvbid0IGxpa2UgaTkxNV9n
ZW1fb2JqZWN0X2hhc19jYWNoZV9sZXZlbCBhbmQNCj4gaTkxNV9nZW1fZ2V0X3BhdF9pbmRleCBh
cyBhIHJlZmFjdG9yaW5nIHN0ZXAuDQo+DQo+IEl0IGFsc28gc2VlbXMgdGhhdCB0aGUgZHJpdmVy
IGhhcyBhIG5lZWQgdG8gcXVlcnkgdGhlIGNhY2hpbmcgbW9kZSBzZXQNCj4gcmVnYXJkbGVzcyBv
ZiB0aGUgcm91dGUgKG9mIHNldHRpbmcpLg0KDQpPbmx5IGZvciB0aGUgb2JqZWN0cyBjcmVhdGVk
IGJ5IHRoZSBLTUQuIEZvciBVTUQgY3JlYXRlZCBvYmplY3RzIHdpdGggUEFUDQppbmRleCBzZXQg
S01EIHNob3VsZCBuZXZlciB0b3VjaCB0aGUgc2V0dGluZy4NCg0KPiBTbyBob3cgYWJvdXQgdGhp
cy4NCj4NCj4gVGhyZWUgY2FsbGVycyB3aGljaCBxdWVyeSB0aGUgY2FjaGluZyBtb2RlOiB1c2Vf
Y3B1X3JlbG9jLCB2bV9mYXVsdF9ndHQsDQo+IGdwdV93cml0ZV9uZWVkc19jbGZsdXNoLg0KPg0K
PiBXZSBjb252ZXJ0IHRoZW0gdG8gYmUgbGlrZToNCj4NCj4gaTkxNV9nZW1fb2JqZWN0X2hhc19j
YWNoaW5nX21vZGUob2JqLCBQQVRfVUMgLyBQQVRfV1QgLyAuLi4pOw0KDQpQQVRfVUMvV1QvV0Ig
YXJlIHBsYXRmb3JtIGRlcGVuZGVudCAoaHR0cHM6Ly9nZnhzcGVjcy5pbnRlbC5jb20vUHJlZGF0
b3IvSG9tZS9JbmRleC80NTEwMSksDQpwZXJmb3JtaW5nIHRoaXMgY2hlY2sgeW91IHdvdWxkIGhh
dmUgdG8gZG8gc29tZXRoaW5nIGxpa2UsDQoNCmlmIChNVEwpDQogICAgICAgIC4uLg0KZWxzZSBp
ZiAoUFZDKQ0KICAgICAgICAuLi4NCmVsc2UgaWYgKEdFTjEyKQ0KICAgICAgICAuLi4NCmVsc2UN
CiAgICAgICAgLi4uDQoNCj4gVGhlbiBhcGFydCBmcm9tIHRoZSBwZXIgcGxhdGZvcm0gdGFibGVz
IGZvciBtYXBwaW5nIGJldHdlZW4gY2FjaGUgbGV2ZWwNCj4gdG8gcGF0IGluZGV4LCB5b3UgYWRk
IHRhYmxlcyB3aGljaCBtYXAgcGF0IGluZGV4IHRvIGNhY2hpbmcgbW9kZXMNCj4gKFBBVF9VQywg
ZXRjLCBuYW1pbmcgVEJELCBqdXN0IGVudW1zIG9yIGJpdG1hc2tzIGFsc28gVEJELCBJIGhhdmVu
J3QNCj4gbG9va2VkIGF0IHRoZSBic3BlYyB0byBzZWUgaG93IGV4YWN0bHkgaXQgd29ya3MpLg0K
Pg0KPiBZb3Ugd291bGQgdXNlIHRoYXQgdGFibGUgaW4gdGhlIGk5MTVfZ2VtX29iamVjdF9oYXNf
Y2FjaGluZ19tb2RlIGhlbHBlciwNCj4gY2FsbGVkIGZyb20gdGhlIGFib3ZlIHRocmVlIGZ1bmN0
aW9ucyBpbnN0ZWFkIG9mIG9iai0+Y2FjaGVfbGV2ZWwgZGlyZWN0DQo+IGNvbXBhcmlzb24uDQo+
DQo+IEkgYW0gYXNzdW1pbmcgYXQgbGVhc3QgZm9yIGluc3RhbmNlIGNhY2hlX2xldmVsICE9IEk5
MTVfQ0FDSEVfTk9ORSB3b3VsZA0KPiBiZSBlcXVpdmFsZW50IHRvIGk5MTVfZ2VtX29iamVjdF9o
YXNfY2FjaGluZ19tb2RlKG9iaiwgUEFUX1VDKSwgZXRjLg0KDQpTbyBmYXIga2VybmVsIG9ubHkg
bmVlZHMgNCBjYWNoZSBsZXZlbHMgZGVmaW5lZCBpbiBlbnVtIGk5MTVfY2FjaGVfbGV2ZWwsDQpr
ZXJuZWwgZG9lc24ndCBuZWVkIHRvIHVuZGVyc3RhbmQgYWxsIFBBVCBpbmRpY2VzLiBCeSBkZXNn
aW4gaWYgdGhlIHVzZXJzcGFjZQ0KaXMgc2V0dGluZyBQQVQgaW5kZXggZGlyZWN0bHksIGtlcm5l
bCBvbmx5IG5lZWRzIHRvIHBhc3MgdGhlIHNldHRpbmcgdG8gUFRFLg0KDQpGb3Igb2JqZWN0cyBj
cmVhdGVkIGJ5IGtlcm5lbCAoaW5jbHVkaW5nIG9iamVjdHMgY3JlYXRlZCBieSB1c2Vyc3BhY2Ug
d2l0aG91dA0Kc3BlY2lmeWluZyBwYXQgaW5kZXgpLCB0aGVyZSBhcmUgb25seSA0IG9wdGlvbnMg
KGRlZmluZWQgaW4gdGhlIGNhY2hlbGV2ZWxfdG9fcGF0KS4NCg0KRm9yIG9iamVjdHMgY3JlYXRl
ZCBieSB1c2Vyc3BhY2Ugd2l0aCBQQVQgaW5kZXggc2V0IChHRU1fQ1JFQVRFICsgc2V0X3BhdCBl
eHRlbnNpb24pLA0Ka2VybmVsIHNob3VsZCBub3QgdG91Y2ggdGhlIHNldHRpbmcsIGp1c3QgcGFz
cyBpdCB0byB0aGUgUEFUIGluZGV4IGJpdHMgaW4gUFRFLg0KDQpUaGF0J3Mgd2h5IEkgd2FzIG9u
bHkgY2hlY2tpbmcgY2FjaGVfbGV2ZWwuIEhhbmRsaW5nIFBBVCBpbmRleCBpcyBtdWNoIG1vcmUN
CmNvbXBsaWNhdGVkIGJlY2F1c2Ugb2YgaXRzIHBsYXRmb3JtIGRlcGVuZGVudCBuYXR1cmUgYW5k
IGV2ZW4gdGhlIG51bWJlciBvZg0KUEFUIGluZGljZXMgdmFyaWVzIGZyb20gcGxhdGZvcm0gdG8g
cGxhdGZvcm0uIEZvcnR1bmF0ZWx5IGtlcm5lbCBkb2Vzbid0IG5lZWQNCnRvIHVuZGVyc3RhbmQg
dGhhdC4NCg0KLUZlaQ0KDQo+IFNhbWUgbWFwcGluZyB0YWJsZSBjb3VsZCBhbHNvIGJlIHVzZWQg
aW4gZGVidWdmcyAoaTkxNV9jYWNoZV9sZXZlbF9zdHIpDQo+IHRvIHVuaXZlcnNhbGx5IGRlc2Ny
aWJlIGFueSBvYmotPnBhdF9pbmRleCwgd2l0aCBubyBuZWVkIHRvIGhhdmUNCj4gYW55dGhpbmcg
cGxhdGZvcm0gZGVwZW5kZW5kIHRoZXJlLg0KPg0KPiBJbiBzZXQgY2FjaGluZyBzZXQgeW91IGFs
d2F5cyBzZXQgb2JqLT5wYXRfaW5kZXggYW5kIHNvIGxvdyBsZXZlbCBjb2RlDQo+IGNhbiBhbHdh
eXMganVzdCB1c2UgdGhhdC4NCj4NCj4gVW5sZXNzIEkgYW0gbWlzc2luZyBzb21ldGhpbmcgKHBv
c3NpYmxlKSBJIHRoaW5rIGxpa2UgdGhhdCB3ZSBlbmQgdXANCj4gd2l0aCBubyBpOTE1X2dlbV9n
ZXRfcGF0X2luZGV4IHNwcmlua2xlZCBhcm91bmQgYW5kIGFsc28gbm8gY29uZnVzaW5nDQo+IGk5
MTVfZ2VtX29iamVjdF9oYXNfY2FjaGVfbGV2ZWwuDQo+DQo+IE9iai0+cGF0X2luZGV4IHdvdWxk
IGJlIGEgc2luZ2xlIHBvaW50IG9mIHRydXRoLCB3aGlsZSBvYmotPmNhY2hlX2xldmVsDQo+IGlz
IGp1c3QgYSBsZWdhY3kgZmllbGQgZm9yIGdldC9zZXRfY2FjaGluZyBpb2N0bCAtIG5vdCB1c2Vk
IGluIHRoZQ0KPiBpbnRlcm5hbCBkcml2ZXIgZmxvd3MuDQo+DQo+IFdlIHdvdWxkIG5lZWQgYW4g
YWRkaXRpb25hbCBmaWVsZCBmb3Igc3RvcmluZyB0aGUgYm9vbGVhbiBvZiB3aGV0aGVyDQo+IHVz
ZXJzcGFjZSBoYWQgb3ZlcnJpZGVuIHRoZSBQQVQuDQo+DQo+IFJlZ2FyZHMsDQo+DQo+IFR2cnRr
bw0K
