Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE627117E8
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 22:13:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ABBE10E756;
	Thu, 25 May 2023 20:13:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9796710E755;
 Thu, 25 May 2023 20:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685045613; x=1716581613;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JSs/gMXigwgIfCpb5VIO1Y3UfmULsIn4Lb+BXejtJEc=;
 b=m0crrwVhD875SLQWzMPyfmldIIUL/x0Mou+VG7LGae6lKui2Y1Dla472
 XXurrm2UupOHs7WUf+sXOIAJNf2mFwhrwGNESZB7lIKymqEep1pOJyBuE
 SwKn+r/MEcHLDriF8dQx+nNUo8uAnGho06LsT/dMGJymqJaJ0ENkmyUad
 hmpVjgBkeuUkQqr3Pi5wtfvZ+IgQDZH/3jxi+GEu9dVf4Gb0T/ffO8OoF
 9VaOB4+eHFj+pnTgjKU1a5eO0gND8c4YVz5h2iF4bQCROGeR06dz6mAAD
 pSlE6cfpJYO3iTHEBIuf7dotWYQhh6B7w0WmC6ASCsQL6fwivS2upLiIf w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="333635763"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="333635763"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 13:13:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="770056192"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="770056192"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 25 May 2023 13:13:32 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 13:13:32 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 13:13:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 25 May 2023 13:13:31 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 25 May 2023 13:13:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TgZTiLjnbpLLRt91bR/Y1J2oZRL8oodChczrXrL8iweWJ0c8iE/ppVxekxvNlITFfo/I2VPLC4T2I4YXLvTal/h5PEGcTSpuOQTucIN9E1ydKXa+NiTQkznoSOcqG/vQT/jhbLvLeDoHxW67c0j4KO3kVtdsXcONpNYV7EmTQXBoSzItidfltFfEVQcgwFDIiKG0RxVdmLqTODIirZu2cmu+g2n72c1yxX8AvDlFkUv5wKBxPY3j2lsrtbswgzERKMyWuSYf6uQ17mdU/HZV04h8NeZ8fBENemdCVP78NyhsUdDPSTPNUhwmf3AGG+e0SUQscSUHU6ITYtwHxhND8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JSs/gMXigwgIfCpb5VIO1Y3UfmULsIn4Lb+BXejtJEc=;
 b=TWyNrvu4RsVxnNO+TZfy3VOvE+fk8z5vXnY4JlsDhzgRR733XcNEhiU4ADx9yrnFTKt21po8WX0JhdYBvWdJJ26UHCvyth2vTz0KtPqZJPVf6Nc+Dj/NrPWnkWIXjL1gKcjKRZInmAlA3AylgMiQCd97n+rvzbY8m85TnFKoT4ShJsnbLNwn4iKf1dHHHesveXHiBhF4Y7Vz9bQkM/7wX9uDiTRUKSNqx9L7QHoIqGK6RZBW/E2PSAB6hDSLlz9iVuICkaOmLXWN2roAmKwnZPCvoAfNo5LYgynlYdXWpSOWi6bm3OGvQNe2ej7vjsAQSy1qnl3C/ME7R1pTiBLIqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 IA1PR11MB6491.namprd11.prod.outlook.com (2603:10b6:208:3a5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Thu, 25 May
 2023 20:13:24 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::5671:364e:5c39:3284]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::5671:364e:5c39:3284%5]) with mapi id 15.20.6411.028; Thu, 25 May 2023
 20:13:23 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH v2 2/7] drm/i915: Expose crtc CTM property on
 ilk/snb
Thread-Topic: [Intel-gfx] [PATCH v2 2/7] drm/i915: Expose crtc CTM property on
 ilk/snb
Thread-Index: AQHZbigIu15dg2nmUUOuWAuo7TvJTa9rrchg
Date: Thu, 25 May 2023 20:13:23 +0000
Message-ID: <DM4PR11MB6360AE1E25F4D05CB25DD59CF4469@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20230413164916.4221-1-ville.syrjala@linux.intel.com>
 <20230413164916.4221-3-ville.syrjala@linux.intel.com>
In-Reply-To: <20230413164916.4221-3-ville.syrjala@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|IA1PR11MB6491:EE_
x-ms-office365-filtering-correlation-id: c0467eda-c55f-4ab6-c2aa-08db5d5c7e15
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fA/PFexb9Kt+YpJf8fyCxoTId1Nxl9QOcuNp8D8VTHgAU7ti3uxFIg2MVouBBFrU5wTl2yiBf1EQjGT3H+DxRt2+98wAyD9jByM0ig4b9mm79GOBtMP/uCHC3IF1w2jzsRF4ATtq0IA1hjtYa/wqqFrmZmd1mNusNTNNuTZ3eUhz2hLQ/R9Nd+0XvTSMgR4hqWJ+8TxXcO6z6L7fAUJViIIqhZkQdyJW19Dg6kXAxBTLfz/8qPkNakYudOsFZtUawfFsYEY4EdI/FuZwYAaN2hmVp2LvjBddXvfw61jMluFSw4MOgV447J7bZdAGrW7ofQI/zLreSPxic5Lp2E0P598fu3NorvfMbOGD2GAs0kJfTBIoTbaBHjaeqEzYFoLuoXDMw9V2qHVmTLVtoT0gmZTqrQNaMElyhswy4BReeIqbcf1QeNtMfRuyx8xVSKLyVjItgxzj5NQmC/OvLCzODpMnsmEhW0/uK5ddPWfnJDlwFH71CIxSKWz/zipiBgyxKw37oDKXaxAtXMDyU/melxanlJodLHqQHOTLAXHLwpWEDOkuT8NSUGZGM+qPY0CFxm+8Xbox2bueLF2Mg0hff3LvUFZ2Q356bH80udDLPZeSCoVyu/vkO1enSuqmslEq
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(346002)(39860400002)(366004)(376002)(396003)(451199021)(33656002)(82960400001)(26005)(6506007)(9686003)(53546011)(186003)(122000001)(66574015)(83380400001)(2906002)(38100700002)(7696005)(41300700001)(110136005)(316002)(71200400001)(66946007)(66556008)(66446008)(64756008)(66476007)(4326008)(76116006)(86362001)(38070700005)(55016003)(8936002)(52536014)(5660300002)(478600001)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M0Y3TkFOU25KdWlkSTlZb2FLOFFDQXlSWFVMWGUrUHdnUkZibEk1T1BKZUJp?=
 =?utf-8?B?M2g2N0NBYno2ZHQ1NC8rKzlsR2VWRkZqbzJDSlA5VmtWNENxS0F3ZkdFMDlP?=
 =?utf-8?B?T2lCNE5ITkw3NVVNMERkQlA0R0FSVEtUVmdLa2N2OFJMT25NdVJnRlRrbmZt?=
 =?utf-8?B?R2paQWtya3JiY09vVU5DT1k3WVVOY2hsaFo1SVVVZndsancvalZob3kxUEdK?=
 =?utf-8?B?ZVZKVkdjVUtPZ3VyWk53ZG5aTW4zb0ZsTkFqVEd2clJLYmIzeXQ4NzFEUmRJ?=
 =?utf-8?B?U1dFK25vS2txUEdXaXF0dmkybHp2d05WSW9iUzB5YWh5WWJEdFN4S3I1K1Bt?=
 =?utf-8?B?QUg3RXlCa1Fick83MTczTmpHZjI1b3ArYi85Yy9vTW81dndUL1RvMlZOV20y?=
 =?utf-8?B?TVVGTDVLNExSS0JCWjZzQ2gvWUxBSGkzeXQ4Z3Y3UldySkU0Zmg3QmpuTHpH?=
 =?utf-8?B?YXlnMDMrM3RXRnAvSlFzbWM3SDcxYnBaNWFPdU12Yy9tNFU0TEx0WnBMNXVj?=
 =?utf-8?B?QTdSQU5XRnhCTzlmREFZcFBKMi9zVm1ROER4WUF4aEx6eVV2dFB2SmowYjZp?=
 =?utf-8?B?R3JZeWFKN3NLWFBSVjEzWm54SHZObTBsOWlNRWg5bEJnM2VmVlVvbWwxc0xY?=
 =?utf-8?B?T1BVMjFlN3JidFlIWEpJVmkvaGtCNGw2WWlJRUhsSlFRaFF2Q2JRYThnbzRh?=
 =?utf-8?B?NHBadVM2UHFWZFhUQTZvNi9pTDlCWEFvRXFMWWVycWRCRFU4WTNsZU51K0JK?=
 =?utf-8?B?U3ZWNXorRzBSV3R0Um0rbVhIVXVTeVhGcDFveFFjODhZNVRVaFdpdEM0a09v?=
 =?utf-8?B?ZDRXajNkTkdObDRnTUFGY0tEZVVXU0laM3dmQzJWdUFuTjlBVmYxRXZjUTl2?=
 =?utf-8?B?azRKLzVOMjR2bVVRVzFVSDlxb3hzMEx4OUNwL1JYbmxMcmIxc3RyMlJTMmMr?=
 =?utf-8?B?ZmlZVWFHdzFqeFpJMmliRk80czZJc1BQSVlGb0NaMGVYUTRQcFVUWnVVQlB3?=
 =?utf-8?B?NjlMeDRNUmJ0aWI2TTM3bzN4elpmTGhud0J4M3dsTWwvSkhpVDM1QTJSNUdY?=
 =?utf-8?B?bzQwSEh1bEJvMWFpaWRiZnVhU0NTREpYZTZTSUpnc3JCR0dUcUVGY1FZa2Zw?=
 =?utf-8?B?NExUSGM0a3k0clRTZGNwR2FheXdQSWlIUEtZUEJKb0xRM2hPaTdyM1FYbHpi?=
 =?utf-8?B?NTRyajdBb0RadzUyM1o0NUpVa3FMc25uOEFTODd5NEZwellTTU9acFAzb2Ev?=
 =?utf-8?B?OVRxQkFqNHNpcmRqS2hhY3VjK1hMTWcvSk80WUplTDZkSWloRStBU01na2dB?=
 =?utf-8?B?VU1laSt1THJZRTkyQ2ZwKytJL2hnd2c0WmYzc29WcFhmcGx5alNLMXpRMUFD?=
 =?utf-8?B?L0tBS1pCejlTYlRza3ozeE1OTEhvTVF3aDVxWTZVbUZubUJ0aGxqV3NmcjdI?=
 =?utf-8?B?RnhGaE5hMkd3ZzJWUUtqemtlbWxWRjdFM1hlakpEbkhqbzV4TXZsa2hEbmdB?=
 =?utf-8?B?Vmk1V24zajNUazFnWngrd3pNUGhLNk4wSTRDTVlXNTRkbTU5V2t3K0VDUTNk?=
 =?utf-8?B?V0RGaXFFQm1hRmU0WHBJMmQ3d0dZbWk1RTVzWWlVVWxxRi95SHFWS1BNbU03?=
 =?utf-8?B?b2pRVHlORzQ5S3FDN0pqemZSNm9HUzZCd0RDalVXb1J4MVFpQ0ZYN0daM0pB?=
 =?utf-8?B?aXMxYkdWT21JYlNHb2VjT1pHVk1oaXl6dlpxWEJBVnZRd25pYVdMb3FENEg0?=
 =?utf-8?B?SGNidFJWTHhTemVrc0NJREpqRDArSCtYM0dXY3VXUldGYktVRUxCdmpTRkRp?=
 =?utf-8?B?UHdYSXUxTmRSV2Nlb2hJZG5xODYrWitJN2RCZGlwNHI5TnNjL0p6ZGpRY2N0?=
 =?utf-8?B?R0hqcWExWTZ4MzFPRFhpL0FReGNmUFFGWS9Ocm5UNVJ5YVMyeWZWaXpDbTF4?=
 =?utf-8?B?RTN4a085NStBWUY4aDRGZzIxRHFZdWY5djE2Sm1GNmNyNkt3MkptSzVGbE0w?=
 =?utf-8?B?MnpGNWVaRFdBUGxkcWxyWGhqU3EzK0p5cGZiMFJWSlBFOXJzZjAwUjlSRTlJ?=
 =?utf-8?B?clBVUDczMXB3c3BvRDVDUyt5TnM0dnQ5UkFCRzYrQzFiZHpSQlZkR2FESVRT?=
 =?utf-8?Q?x4+wyMCiPvZzkHu5XApd0tsQm?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0467eda-c55f-4ab6-c2aa-08db5d5c7e15
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2023 20:13:23.5942 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4QHqUYlf3vU603NEaDoZrbOFvq9gu3g49JwqpJH7UF1aV3mqubvil6hBJlw7Fv889YDQdOfkUJgdMUpqxvNDqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6491
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSW50ZWwtZ2Z4IDxpbnRl
bC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBWaWxsZSBT
eXJqYWxhDQo+IFNlbnQ6IFRodXJzZGF5LCBBcHJpbCAxMywgMjAyMyAxMDoxOSBQTQ0KPiBUbzog
aW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0OiBbSW50ZWwtZ2Z4XSBbUEFUQ0ggdjIgMi83XSBkcm0v
aTkxNTogRXhwb3NlIGNydGMgQ1RNIHByb3BlcnR5IG9uIGlsay9zbmINCj4gDQo+IEZyb206IFZp
bGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+DQo+IA0KPiBUaGUg
aWxrL3NuYiBjb2RlIGlzIGludGVybmFsbHkgZnVsbHkgY2FwYWJsZSBvZiBoYW5kbGluZyB0aGUg
Q1RNIHByb3BlcnR5LCBzbyBleHBvc2UNCj4gaXQuDQo+IA0KPiBOb3RlIHRoYXQgd2Ugc3RpbGwg
Y2hvb3NlIG5vdCB0byBleHBvc2UgREVHQU1NQV9MVVQgdGhvdWdoLg0KPiBUaGUgaGFyZHdhcmUg
aXMgY2FwYWJsZSBpZiBkZWdhbW1hIG9yIGdhbW1hLCBidXQgbm90IGJvdGggc2ltaWx0YW5vdXNs
eSBkdWUgdG8NCg0KTml0OiBUeXBvIGluICJzaW11bHRhbmVvdXNseSINCg0KTG9va3MgR29vZCB0
byBtZS4NClJldmlld2VkLWJ5OiBVbWEgU2hhbmthciA8dW1hLnNoYW5rYXJAaW50ZWwuY29tPg0K
DQo+IGxhY2sgb2YgdGhlIHNwbGl0IGdhbW1hIG1vZGUuIEV4cG9zaW5nIGJvdGggTFVUcyBtaWdo
dCBlbmNvdXJhZ2UgdXNlcnNwYWNlIHRvIHRyeQ0KPiBlbmFibGluZyBib3RoIGF0IHRoZSBzYW1l
IHRpbWUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmph
bGFAbGludXguaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfY29sb3IuYyB8IDIgKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfY29sb3IuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfY29sb3IuYw0KPiBpbmRleCAwN2YxYWZlMWQ0MDYuLjRmYzE2Y2FjMDUyZCAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9jb2xvci5jDQo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY29sb3IuYw0KPiBAQCAtMzQ3
Myw3ICszNDczLDcgQEAgdm9pZCBpbnRlbF9jb2xvcl9jcnRjX2luaXQoc3RydWN0IGludGVsX2Ny
dGMgKmNydGMpDQo+IA0KPiAgCWdhbW1hX2x1dF9zaXplID0gSU5URUxfSU5GTyhpOTE1KS0+ZGlz
cGxheS5jb2xvci5nYW1tYV9sdXRfc2l6ZTsNCj4gIAlkZWdhbW1hX2x1dF9zaXplID0gSU5URUxf
SU5GTyhpOTE1KS0+ZGlzcGxheS5jb2xvci5kZWdhbW1hX2x1dF9zaXplOw0KPiAtCWhhc19jdG0g
PSBkZWdhbW1hX2x1dF9zaXplICE9IDA7DQo+ICsJaGFzX2N0bSA9IERJU1BMQVlfVkVSKGk5MTUp
ID49IDUgJiYgIUlTX1ZBTExFWVZJRVcoaTkxNSk7DQo+IA0KPiAgCS8qDQo+ICAJICogIkRQQUxF
VFRFX0E6IE5PVEU6IFRoZSA4LWJpdCAobm9uLTEwLWJpdCkgbW9kZSBpcyB0aGUNCj4gLS0NCj4g
Mi4zOS4yDQoNCg==
