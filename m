Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F7562C654
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 18:26:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18B3810E00F;
	Wed, 16 Nov 2022 17:26:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FF1B10E00F;
 Wed, 16 Nov 2022 17:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668619587; x=1700155587;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=27pAgfG2/GHnjs8yI2OM/HIQcHfVnCHnHNOJoh/sVPo=;
 b=Vfsz7KM6fCtFZUaHkXyu55BtaxurRpYnpu0RwkBrLGSDZAMFE4wt5Bes
 +uwdQCx2OByN64UV+YW6AXnZx8h1iZR5o5NpkdVVUlOOlN2dCZ4Npm6uc
 u8vF9nFDgjXuBKfcOVoDj8rK50JleI6zD2KE7ZTrL+k+tWaVTYsJdHVZd
 KW/ZeeZb2gcLLe1MnDyaXKrN9y2kxR93nNOZgivuKNOzjHtH1PjmCDLtu
 SIUcyXSIvu8bb17vXrS2xbzpiLQ9znPiWMCFjzk5WyeQVMsIFccj7IuVl
 cV/gtEsjIKGJShi+IyzvZF4de/t4TujyLLHzE3DGIF4FjQUUHGzpkQoOz Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="398896063"
X-IronPort-AV: E=Sophos;i="5.96,169,1665471600"; d="scan'208";a="398896063"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2022 09:26:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="670578435"
X-IronPort-AV: E=Sophos;i="5.96,169,1665471600"; d="scan'208";a="670578435"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP; 16 Nov 2022 09:26:21 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 16 Nov 2022 09:26:18 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 16 Nov 2022 09:26:18 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 16 Nov 2022 09:26:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CSWoGPWtFmQzDaU2Hzhzk5w0gWuKq5byWXg/QlNiOBzut0+v6HdLevpxmgxmGMWhrvMl0JOdvAkI1xI07CxQEngDM4WzN9/KxKdI7Q0KPr3qZ/mZHESsYhDnRnZgF1YDHYEn+54/UvkH3Dt8Dqf+RbBwoF2kSOs/yL7prU+90yNIIm6iQZD/v4Q/mOm184L57vK9KxUCb4SqEG0D8aKPBotYCowjtkbIlJSjCLN4LQF95o0gieAM0uIoQHMOr6Vlr/1km6L1UAlKYiwXMoi2aBtigmQcI+U1R1Oqu6GX20308EMoIYTtJ44N3MJCcJ0BwJ8EHGv3XaG9Risv1nB7IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=27pAgfG2/GHnjs8yI2OM/HIQcHfVnCHnHNOJoh/sVPo=;
 b=MfkTdJFhetTNHtHEU34EnXi0TW47og30FPukLXpuMevbmF0h2tPRkLAlTQB7I1O4/LBk1aJ4g4ouWP00vAZ4lfzzyGsP1gs3Of5pjC0/SsDKHltF+2BxReL7A/nQ7vfOTkQ2OhsU5WeRbwTcHhlsm/D/ZyXJo8k43wY/+350XJQNEqY/PZeuCr4n7SHZU6+qrTz7c7UL32asIqcyEz1lC0j7noW4tOcS10GOkiP2pV8XOutuDPSrfBD92r/2VQ9RA+fNBtwYqtDlR0DFuz31Jh9sqermny4yRn5EpLoTd4Ty3/T4IegbAP5Nn2T5+S4gyg4KCBA3mUKMBj9QpuDEKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 SA0PR11MB4749.namprd11.prod.outlook.com (2603:10b6:806:9a::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.19; Wed, 16 Nov 2022 17:26:16 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::bbc2:ab8e:b98:feaf]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::bbc2:ab8e:b98:feaf%9]) with mapi id 15.20.5813.018; Wed, 16 Nov 2022
 17:26:16 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915/guc: add the GSC CS to the GuC capture list
Thread-Topic: [PATCH] drm/i915/guc: add the GSC CS to the GuC capture list
Thread-Index: AQHY9WK8xvaKPWCg+0mbHb+PdZuokK5B1vqA
Date: Wed, 16 Nov 2022 17:26:16 +0000
Message-ID: <5d305b68f98ca7fc3c78b02bf3f53af93848db5a.camel@intel.com>
References: <20221111001832.4144910-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20221111001832.4144910-1-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|SA0PR11MB4749:EE_
x-ms-office365-filtering-correlation-id: ac1315b6-1987-4c80-ee01-08dac7f7aaef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zCNj9lxYNsnqDTd3wI4XO9+aMnSXAUVFCgD7iSgSoSRyv7uTk0ScUlVL/ucaR/llpn7JfBKIgvwo8hBY+97sGRrw5cQDR4FKVxRRwrIjLWclBiyhmlQz+3z+xa7RcHc2IQPgoTOO3PpyO/ccFnupmxJatoVZNn316H2+lzgacMJcRIIQ5RbwaWtbRjUC4qetk6dbb2P5S4Yzmkrd49mWcp05Fiz32LfOWYeVpwuWcLKSQKaQqGCY2FX3aJWeVIuOHuwPYgEF+Gk+xzw8/G2SH1F3FjLOvofRdOrtP1/nyurCSmvb59P5w/KN6nt0XvZnsDlyHc75x5Mvn1O7g9PMl5bV77PEdan1PmCP2H6wQNkqkMNXMdRbU0PAJq5M/kLDBfSGtL4HYNw9lPoGQpjiTvd9kILLd5RjWp14t8qaMfEHQ7L9gsafw1O8zv1oed2tzmoaIPcRz+rPxmexF0x03pMC9rDvcKg0F8cQR/w27nMSQ26LfnveWd58slpV1GGrsiTcWoTna1PS9OmjMFigyFxeuCHvRSaleumk/n1FMXCVCQV5GjiWxA+zQyPhCemEX4b++YGgD/4N508mjT3Owi9AfIBpZOcbYSAvLn9NRQnOVIO2tzRglZX7uHcqy2Lfq/+ypkMbudlvIRHN5dfstofylTnNy94nnQx5VgdJaikDmQseqIkQTSmwRMumhjkpURv7po/An0FvnysCH1a8DdJnG6POGPwjZf/F9S2BduzZcbeu717rX8ctpBHML5Uk
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(396003)(366004)(376002)(136003)(346002)(451199015)(82960400001)(110136005)(38100700002)(71200400001)(122000001)(6506007)(6512007)(86362001)(66446008)(8676002)(4326008)(64756008)(450100002)(91956017)(76116006)(66476007)(66556008)(66946007)(316002)(26005)(38070700005)(5660300002)(41300700001)(36756003)(8936002)(186003)(2616005)(83380400001)(6486002)(2906002)(478600001)(4001150100001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L1liYjhnUTd4YVRoUHphaXRpUkxnNHNQa2lYcVpyN1YybmxTZkp3cjhqSlo5?=
 =?utf-8?B?TVVWdGdqQlBtbzQ5OVJ5bjNuSXBocEx5VVNOa3pHS0NvdmRKT3JWMnpOWFM0?=
 =?utf-8?B?YTh0alJ0UGNmcWI4MHJGZ3hwVHExT1o1WkRPYks5ellMMGlWakdtM1FWWmt2?=
 =?utf-8?B?Y2FxYzdPcUh3OEh6NXdSZkVKQkwrZXlsbklBSWJReTFFMUxRM0NxZ2M4VnZx?=
 =?utf-8?B?RzMwKzFybU9ZcHNwODR1SGdNVFBSQmg0TENPK1lwcVYyeGxiNUJDTFpGTTds?=
 =?utf-8?B?alBHaUhnRGhuMm1oTHljZjRBZEM3NVdTOGZyVVpHcGRRcWtYRG9oZzE5TVha?=
 =?utf-8?B?S21nRW9leXMraHJLbTZ0VnV0bDduVVZFTlJUTFJvR24wMCt1Ym9vemlGcm40?=
 =?utf-8?B?VkNPK1dVNU9wd1BXT1BQSHNrMFZkMmFoSlZVYkg3eWlCWVZDTW0vRzE5emxv?=
 =?utf-8?B?U1QyWlE2LytzTjBhclE2S0hHbnpETFFYUGZTSjc2eldPM1B0Y1JFT1JTb2Ix?=
 =?utf-8?B?cVpzWW4zR0l5Q25TazJtaGk1TVVSbG5SVjNBb3R0SzN3andlQys2cnU0YXVJ?=
 =?utf-8?B?WnJFYTlYdDk3T3pXWXByamt2elNydzR5dklObXhjT21WcDQyekN5ZUlJcVJY?=
 =?utf-8?B?S2tDOFgydG9CR3J1ZU9mb0tPeVBzWVRXbmJJMVVKL2NPWHprZGlBWllaeGtU?=
 =?utf-8?B?L3B1LzFrU0I5cEtPOHRPS0N6NFlhZHZXcE4vZGZ3WlNnVnpIL1F3bEhNMzJW?=
 =?utf-8?B?Y0EvbWtQMjZaMTNmMm9MdlhKcHZqRXM0VkJtUndWMk5PM0VtV2d5NWpTSWgy?=
 =?utf-8?B?RE84cFhzbHREa2VLTmFXcnZueXFlNFFHT2YyQ0t4MTg1eU9RUkpPZjhrdHdu?=
 =?utf-8?B?eXhHQmV3VEpwLy9ZSlIyNngvVWwvMWZ0TUlLSWplT3M4c2xxVWpsbm9FTlJr?=
 =?utf-8?B?VHQ5ei9vejRtVmNSWENHOXRlRk04dFBBeldkU3ArT24zYWJZVXJ6RTBuYXFY?=
 =?utf-8?B?RU5PZjlJNEdncW51c0huc2RGWU1KTjR0RHNpa2MyWWZSY2pudTUybmptdE5G?=
 =?utf-8?B?dUZGUU5RdVhCTzM5bUw1TUpMTnVCK2kzcHZHOG1JckFhRlUybFJTUXBDQmow?=
 =?utf-8?B?VzFzcWNYcDZRd1ZSODF4aUlKVTR3L2tvb3RMMUE2TW5kdjhqNG9waC9rSmJr?=
 =?utf-8?B?dXBUVlN0eHBsTFZvZ0hYTXNORCtaL1hDc3JkRmdlcFZOSTdqWVZ3VG9tNHhL?=
 =?utf-8?B?OVpTb0hVSUQwTVo0MjVwUEZzQm1FVEQ1MjFGdDJtcmNNTnM4NHhrdHVjSmsv?=
 =?utf-8?B?WG1XazNucDZzdGJsdVVpeGN1bUR5V1QyUGpOQmR4NGtqU2JLT1lHdGdNQXFG?=
 =?utf-8?B?MWs4NGp0UUczL1BxVGFtbWF1OGJMYy9OS0tTVXo1KzltZW9PSXViQUhtaWdy?=
 =?utf-8?B?MEMzZU91WEg0Wnc1bUo1aG96bjlyeGk2TVFCRy9rYXI1Kys2MU1ONGRNb0dq?=
 =?utf-8?B?UDVmVlQ0R2hiZjBrTW9PWVk0Tk55aUh2aHFTcENBRVQyWWhwVzRMbWxiWXVF?=
 =?utf-8?B?YVNzbkx2eHZNUHIwZ1ZwNjZ6VFdEQ0kxRDZxRENobE1JV253eGIrR0M2UkpN?=
 =?utf-8?B?cWduOTd1M1FoWEJoZVA1RkdjZ1UrY3dWcUNQN3UwcXZNQnhmSlBDNGxNS2NJ?=
 =?utf-8?B?Rm9QZHVGVk8wb2JIbVpvcXNVc0dmUVRoME8rdHROcGxwUFh3TE9ERUw5SmNR?=
 =?utf-8?B?RVNjdUJmWC81NDd0b29qUTVwdTRwRm1aYVNYRHl3RVk2SFhRMVBDcFBUK0sy?=
 =?utf-8?B?Nit4VGZVR2hIQlUyZXlOYlZSOTBSN1FBZjNUZFgvcXM3dG94YmNVYjNCZTBV?=
 =?utf-8?B?V1Iwd1VDSUZUUDc3Sk82bkhFMGtGajlJRXhhcTJtenBRQW5mVTZtL0M0bzZq?=
 =?utf-8?B?eVhwQUdVQkplQUdzTkVxMjJ0aE1lRHlTRDFVd3Q2cThFVENUVjYvS09OLzh6?=
 =?utf-8?B?clU0WWsrUFZyK0l4YS84NzdJdEQ4cXMvejVrVGRHQTd4TldFN0YrZFhFRmVv?=
 =?utf-8?B?ZDY5WHFnaSt1OUdCelU4ZVhJYUFLVGRzQmpkZDB2NllObk5KNzRaL0VHNEhW?=
 =?utf-8?B?bXhBZHo2RnkwbnpHVTlGMDZKZzFYRjlXT1NxUTE3aEVGaGl6YlZUNGxNNGp2?=
 =?utf-8?Q?tHsDGq6kau6XOHDfnrUDwPc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <784BE98DDD867240A253A55FD60E8BF0@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac1315b6-1987-4c80-ee01-08dac7f7aaef
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2022 17:26:16.4731 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QLs7dUygx3wmc5tvB2kiu/TRwIjf80pDG95kQ2ek3stTeBy7TdJZUaVJMFSyWZJPd8HqGlERaZKV+Z1Naa2ye9uNACPImp2OriSdKafcNqmwfNmwrm+35mrSlhKLgUsl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4749
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

SSdtIGFzc3VtaW5nIHRoYXQgeW91IGhhdmUgdmVyaWZpZWQgdGhhdCB0aGUgR3VDIEFEUyBjb2Rl
IGlzIGNhbGxpbmcgZm9yIHRoZSByZWdpc3RyYXRpb24gb2YgdGhlIEdTQyBjYXB0dXJlIHJlZ2lz
dGVyDQpsaXN0IGFjY29yZGluZ2x5IGFuZCBmb3IgdGhlIGNvcnJlY3QgdGlsZS4gVGhhdCBzYWlk
Og0KDQpSZXZpZXdlZC1ieTogQWxhbiBQcmV2aW4gPGFsYW4ucHJldmluLnRlcmVzLmFsZXhpc0Bp
bnRlbC5jb20+DQoNCk9uIFRodSwgMjAyMi0xMS0xMCBhdCAxNjoxOCAtMDgwMCwgQ2VyYW9sbyBT
cHVyaW8sIERhbmllbGUgd3JvdGU6DQo+IEZvciB0aGUgR1NDIGVuZ2luZSB3ZSBvbmx5IHdhbnQg
dG8gY2FwdHVyZSB0aGUgaW5zdGFuY2UgcmVncy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IERhbmll
bGUgQ2VyYW9sbyBTcHVyaW8gPGRhbmllbGUuY2VyYW9sb3NwdXJpb0BpbnRlbC5jb20+DQo+IENj
OiBBbGFuIFByZXZpbiA8YWxhbi5wcmV2aW4udGVyZXMuYWxleGlzQGludGVsLmNvbT4NCj4gLS0t
DQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF9ndWNfY2FwdHVyZS5jIHwgMTEg
KysrKysrKysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxfZ3VjX2NhcHR1cmUu
YyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2d1Y19jYXB0dXJlLmMNCj4gaW5k
ZXggNGU2ZGNhNzA3ZDk0Li4xZDQ5YTdlYzBiZDggMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2d0L3VjL2ludGVsX2d1Y19jYXB0dXJlLmMNCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3QvdWMvaW50ZWxfZ3VjX2NhcHR1cmUuYw0KPiBAQCAtMTMyLDYgKzEzMiwxMSBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IF9fZ3VjX21taW9fcmVnX2Rlc2NyIHhlX2xwZF9ibHRfaW5z
dF9yZWdzW10gPSB7DQo+ICAJQ09NTU9OX0JBU0VfRU5HSU5FX0lOU1RBTkNFLA0KPiAgfTsNCj4g
IA0KPiArLyogWEVfTFBEIC0gR1NDIFBlci1FbmdpbmUtSW5zdGFuY2UgKi8NCj4gK3N0YXRpYyBj
b25zdCBzdHJ1Y3QgX19ndWNfbW1pb19yZWdfZGVzY3IgeGVfbHBkX2dzY19pbnN0X3JlZ3NbXSA9
IHsNCj4gKwlDT01NT05fQkFTRV9FTkdJTkVfSU5TVEFOQ0UsDQo+ICt9Ow0KPiArDQo+ICAvKiBH
RU45IC0gR2xvYmFsICovDQo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IF9fZ3VjX21taW9fcmVnX2Rl
c2NyIGRlZmF1bHRfZ2xvYmFsX3JlZ3NbXSA9IHsNCj4gIAlDT01NT05fQkFTRV9HTE9CQUwsDQo+
IEBAIC0xNzcsNiArMTgyLDggQEAgc3RhdGljIHN0cnVjdCBfX2d1Y19tbWlvX3JlZ19kZXNjcl9n
cm91cCBkZWZhdWx0X2xpc3RzW10gPSB7DQo+ICAJTUFLRV9SRUdMSVNUKHhlX2xwZF92ZWNfaW5z
dF9yZWdzLCBQRiwgRU5HSU5FX0lOU1RBTkNFLCBHVUNfVklERU9FTkhBTkNFX0NMQVNTKSwNCj4g
IAlNQUtFX1JFR0xJU1QoZW1wdHlfcmVnc19saXN0LCBQRiwgRU5HSU5FX0NMQVNTLCBHVUNfQkxJ
VFRFUl9DTEFTUyksDQo+ICAJTUFLRV9SRUdMSVNUKHhlX2xwZF9ibHRfaW5zdF9yZWdzLCBQRiwg
RU5HSU5FX0lOU1RBTkNFLCBHVUNfQkxJVFRFUl9DTEFTUyksDQo+ICsJTUFLRV9SRUdMSVNUKGVt
cHR5X3JlZ3NfbGlzdCwgUEYsIEVOR0lORV9DTEFTUywgR1VDX0dTQ19PVEhFUl9DTEFTUyksDQo+
ICsJTUFLRV9SRUdMSVNUKHhlX2xwZF9nc2NfaW5zdF9yZWdzLCBQRiwgRU5HSU5FX0lOU1RBTkNF
LCBHVUNfR1NDX09USEVSX0NMQVNTKSwNCj4gIAl7fQ0KPiAgfTsNCj4gIA0KPiBAQCAtMTkyLDYg
KzE5OSw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgX19ndWNfbW1pb19yZWdfZGVzY3JfZ3JvdXAg
eGVfbHBkX2xpc3RzW10gPSB7DQo+ICAJTUFLRV9SRUdMSVNUKHhlX2xwZF92ZWNfaW5zdF9yZWdz
LCBQRiwgRU5HSU5FX0lOU1RBTkNFLCBHVUNfVklERU9FTkhBTkNFX0NMQVNTKSwNCj4gIAlNQUtF
X1JFR0xJU1QoZW1wdHlfcmVnc19saXN0LCBQRiwgRU5HSU5FX0NMQVNTLCBHVUNfQkxJVFRFUl9D
TEFTUyksDQo+ICAJTUFLRV9SRUdMSVNUKHhlX2xwZF9ibHRfaW5zdF9yZWdzLCBQRiwgRU5HSU5F
X0lOU1RBTkNFLCBHVUNfQkxJVFRFUl9DTEFTUyksDQo+ICsJTUFLRV9SRUdMSVNUKGVtcHR5X3Jl
Z3NfbGlzdCwgUEYsIEVOR0lORV9DTEFTUywgR1VDX0dTQ19PVEhFUl9DTEFTUyksDQo+ICsJTUFL
RV9SRUdMSVNUKHhlX2xwZF9nc2NfaW5zdF9yZWdzLCBQRiwgRU5HSU5FX0lOU1RBTkNFLCBHVUNf
R1NDX09USEVSX0NMQVNTKSwNCj4gIAl7fQ0KPiAgfTsNCj4gIA0KPiBAQCAtNDU0LDYgKzQ2Myw4
IEBAIF9fc3RyaW5naWZ5X2VuZ2NsYXNzKHUzMiBjbGFzcykNCj4gIAkJcmV0dXJuICJCbGl0dGVy
IjsNCj4gIAljYXNlIEdVQ19DT01QVVRFX0NMQVNTOg0KPiAgCQlyZXR1cm4gIkNvbXB1dGUiOw0K
PiArCWNhc2UgR1VDX0dTQ19PVEhFUl9DTEFTUzoNCj4gKwkJcmV0dXJuICJHU0MtT3RoZXIiOw0K
PiAgCWRlZmF1bHQ6DQo+ICAJCWJyZWFrOw0KPiAgCX0NCj4gLS0gDQo+IDIuMzcuMw0KPiANCg0K
