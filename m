Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABD977C4FA
	for <lists+dri-devel@lfdr.de>; Tue, 15 Aug 2023 03:20:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBBA710E132;
	Tue, 15 Aug 2023 01:20:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4011810E132;
 Tue, 15 Aug 2023 01:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692062421; x=1723598421;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=+BMnwxov/SEaMR1KLhygmG1Qqb82GAne68yvh6ZSon8=;
 b=WHDOOjQsk2IodySheWcTYVY7B7zY/etpeJ/OWR2oSgkajId6orhNd+Iq
 CH6SOMoLjK/syCXr50DkpoCq1t0dsVesAvqEuLCQlIRtXci9agzzZo7BQ
 m8+gcLXSggTP7KjzIA08/9WzD8WAhuvKGRjUKnAxctxC22kO2UDEI8CEw
 OdReNxNFGIcIEucoBbItXmof6RiZDKACs4WaJNERT4mW3CG2Q5KNo94mJ
 /nLRVgg9+rKdm2CArffQFHKCoxheH8zjeK5npNe6NOVWYKrWTqIqPWemt
 u3H+DuCzUXhjBhpx4wvxk5fQkcwhVBN5ZiD5XHDm+jjyv4WT8KPpADrl+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="369648646"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; d="scan'208";a="369648646"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 18:20:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="710548480"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; d="scan'208";a="710548480"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP; 14 Aug 2023 18:20:20 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 14 Aug 2023 18:20:20 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 14 Aug 2023 18:20:19 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 14 Aug 2023 18:20:19 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 14 Aug 2023 18:20:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a44OSKPA+qx2ncn+sw4VtjAzJCFW8Yz/BMJcTLlovj9PBJXX/KYZcAnmCyqHxZd2umOJnF7xiA33icgjsu+YNdOOQtzauIZogyXpSgiaeCIyFKFCh5ypbqCgRyTmi/0L6O7oaRTI86EQZRUd5TJKxhyXf150XAWfnRRz90CmA0ktR30Vr99tH6K7UMhig+6hq/G4XZRpyVF78/eiAyZiNx8Tq0pBDRNdpoWvFbopFI9d7bGsC4vfjqPnz9FR7CPCSPdIIbu/BUy682VAZpPAAc4zZ5SXioRwG4RWDVnX7O7eDE799hBP2WNtLe6f/dRG9xH8PfYvKeIf9EsnpZV+ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+BMnwxov/SEaMR1KLhygmG1Qqb82GAne68yvh6ZSon8=;
 b=ekYbSvrj3P0kp8qkWFjDkAV7EEXS45IwcjFvDyUYkbqbZSsdYTsS0aje9H4qVo3b/A+htRLusmkWs8YqcszQEFJ/DHdjhoabb2z2fvcnfPgESvcbX0OX47aS5BWG+hnybJexu6B1QMtiNyvCcCps9PLxOlnZRKBBC1nXAUq3QPqK6VnMUkrj0rWmCXnP7iKM2KMoOHMdYOV5tRMKc5/rFwHotz/RfjesksvlwjbM19NPIw6zOToh4nd35Av2e5u8rMNsyC+2+tZUg8ZIm5+d74JAdNUvqJOpzjZb8FbBy2I/AIqSt+lX5iJt96OPPA/AcKmQElHdqgqjWeo9hlkLQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 CY5PR11MB6533.namprd11.prod.outlook.com (2603:10b6:930:43::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6678.20; Tue, 15 Aug 2023 01:20:18 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::542d:f32a:14b:1531]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::542d:f32a:14b:1531%3]) with mapi id 15.20.6678.022; Tue, 15 Aug 2023
 01:20:18 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2 0/3] Resolve suspend-resume racing with GuC
 destroy-context-worker
Thread-Topic: [PATCH v2 0/3] Resolve suspend-resume racing with GuC
 destroy-context-worker
Thread-Index: AQHZzxWP5H7p4EgVok2VX4sOKzvChq/qjx0A
Date: Tue, 15 Aug 2023 01:20:18 +0000
Message-ID: <f5d9c736aca27b6d4602452837aadc1b2ad412b0.camel@intel.com>
References: <20230815011210.1188379-1-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20230815011210.1188379-1-alan.previn.teres.alexis@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|CY5PR11MB6533:EE_
x-ms-office365-filtering-correlation-id: 82313788-0285-4644-26b8-08db9d2dc984
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9KKt1meS/ukYZEZgX5e6LiEyhmC26WecK68VLoU+8Q3V5jbkFYsrDPYN3D5ov2jKIfVhIG649usBFSrW/jRwuPW6UvA+bzT9Fdf2A9EQvktIJSPe6ocjJV2s6XTZcKhyo/I67odEVqRrct/8uH+zUV/y/1QD1eAY5tzjF2yBBIf56ZXCynSUxK6W9NtJBFvrgZysFbYO5lFuYBhvXD5A0Ut4nqFu7WVz9tyHGEwoPEvbhd2gB2L9NpqTmg3Adw80vM2A4JCQrw1L67e9zSpSKuEZ9JD1ZiXtpldt+L/qDfnrePBaGNpE3iBzLF5HBySQeuoDN5OBqKgwbTPHqiJMAHWU3Uy+I0cNhKfCl1PvaFASraU4cTpWWRGKp6tl6lrpyFItKfzje6q4q5xhSVbsNJ+MpOvYPWneRTo5dWak0RX2zcS5nMGnh+M879Kd9MzrLkM2oUiFNRha43kYNo3DDsFvd01SxKNevb7fMascXPtAcqxjIMvsl2SQxBcPqvHjBmTOxezpK3xoK4879Jvz8SwronIKroLcgpVOU/nXGKaJzYjiolGgaB7VPKdd3bqLvOE2/YD91aYxZ27jFP6Hc2GLA89qv2q7tTywlC+RHxgHFFocoMqT3pvPHjIpCYOT
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(366004)(136003)(39860400002)(396003)(1800799006)(451199021)(186006)(83380400001)(15650500001)(66946007)(64756008)(66446008)(66476007)(91956017)(478600001)(76116006)(86362001)(6506007)(6916009)(54906003)(2906002)(26005)(316002)(66556008)(41300700001)(6486002)(2616005)(36756003)(107886003)(5660300002)(6512007)(38070700005)(38100700002)(8936002)(4326008)(8676002)(82960400001)(450100002)(71200400001)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V1F0WHhQNStpRFoxR3Y3NHhSR3FFTjdnK1Y3YjczWHp5a3ZtVVVDK3NOQU5X?=
 =?utf-8?B?OXQ3ZXJ4TzRaQkNLMmVqYWFBcERBbFRJK1l1emhmaXZTQ3d1MmJmVVRrc0xJ?=
 =?utf-8?B?dUlLWEp1UEVQZ25SMHVXZ2tGRzdjMXpkclAxcGovbmViVDhLbVFGaEJnZ0Fw?=
 =?utf-8?B?dVJtSWhxNEFra05XOGpVYmEvbU9LdXRLMU02aTY4aW1ybzdqOUxTMEV0Z2pI?=
 =?utf-8?B?cnc3SWpVV0FDaUtEbGtQYWFoODZ4ZXF5UGhEb2xRZFRXRWM1dlg5eGxub1hy?=
 =?utf-8?B?UG56ZHJPeFdTYUtqcXAwS0d1Tms3VUxzZ2ZsWmw1VlVzRytmcmhLSnEySE53?=
 =?utf-8?B?NDNTU0tLdDY5YXBxcHY1WU1rL21LTjM0K3ZHRVpsck5uSWZsbW9JcHNVa255?=
 =?utf-8?B?TnpuQ0JkOWdNNUpsczNjRnJya3U0eHNCdEdIUjlPbnlFcFZaTGxDTHE3SFdy?=
 =?utf-8?B?bjA2YzUrSFZBZDlNU3haVEpWLytnL2Jxc0E4OHErZEM5WjFkSm5VZmp0WlVi?=
 =?utf-8?B?RzYzVlZLZm52ZWV4MDZsdFVWd0d3eDZIdWF2NDNpRG90TC9yZXdKUnJuaERy?=
 =?utf-8?B?Z3V0VEZMaWcxYllDZXVaclMyQWxpaGMvSlZSYnpxOG1IRENUV0hpZ3U0YURh?=
 =?utf-8?B?L2RzdmpDbGNyS0l3NklFS0d0alVUakVCMWtKYUJHNCtvYWVLNnZEQnVPaDZB?=
 =?utf-8?B?djFnd1Y2RzRIa0xpTDNwcnMwVG4ybHE0U05JeURkV1N3NnpCZEtlNHQvZFdD?=
 =?utf-8?B?cXlFelhpeTZFaUNiRnUxNHhqWHhRK29yOGxPbHdGLzc0RXB0OTg4STV4eDVN?=
 =?utf-8?B?MVpNcDluSzVrbnp0cWt3THBBYzA2VHppSmhRTzYvaW1MNyt3M0Z1YWVmUFJi?=
 =?utf-8?B?UktwSWRpZGh5Z0lKK1Y5bzdvRGpQVEFSbWZmRGpSZGxrOFBGYlBUN1NDV0lI?=
 =?utf-8?B?bnh2aEJJdjd3bWFDb2U4RlJXc2taOHdKYjFkT0xvTHhjeGM5WXkzc2hta2pi?=
 =?utf-8?B?Wjlld3pMRWJKbW1EaFg3a1dUTnBBOE95UG5QQ0dVbHVaR0dzaGtYb2Y4SUc0?=
 =?utf-8?B?aUcvRFpqeC9ySUZyZWwzT3liMTBOanF2RjRZQW9FRU1lY3FqUEhLZTJ3Qzlr?=
 =?utf-8?B?UEFNeVVlTzlLVFgrY0lQK0o2OGlXS2JIdzRsR08zc1VIeUhLbkVCOHFNNmNx?=
 =?utf-8?B?eFhGUGFLUUptbUhuK2FPQ2JFNlJFWDg5YWIyWlBMNHlEMlNGUjdJT01tU1o1?=
 =?utf-8?B?TFcwWUcwSlJoQlFNeVR0YnZjZ21IMXFUWmVNM1lLNm5QNkx3OW5NeTYvN0Fa?=
 =?utf-8?B?cjJSd2MySlNmcHdTdjNaNHpJalpYeGpXNUZSckVKTDFKTjVDWGNFMFcrUmxq?=
 =?utf-8?B?MUpDYllNTW5JVG1oSGtjU3ovYUdGWjBCWG04a2dZWThHY0VZMXM3bVdVTzE2?=
 =?utf-8?B?NnU2RElSaFhiRVp5T3UzTVhSRkNER2xmUVBIQzJ5KzIwTEV1TXYvekxkb2lx?=
 =?utf-8?B?Y3Y5MndhcExteWhKNkdhOWY3V1NYeU5ranpmMVRScUxoRUEvMVdyMndlNWFn?=
 =?utf-8?B?M2NQS2kzZUNyNytIamlCRWJZUkludXlLZzcvV0t2UC9zWkVMb29DM2ZyZisy?=
 =?utf-8?B?STVXSzJnNEQ1YjZRc1NKZW1WQ1FYVjVLNzBrb2JmdkZqSVFmdzF1cG50MVFl?=
 =?utf-8?B?VW9NRVJrWTUrNlhYbHBIeVA1NmtobXJjWDNZTFJuWDF3U2p3b09VU2xIY3pa?=
 =?utf-8?B?VFYrKzMrRDV6U1c3dFVkaWtWOVZwU29OWWNRUENZR2lkdjJFY2MzZHdIemdt?=
 =?utf-8?B?L3p2czV3RldOTHpvMlp0cnpVRkIwTDJUTHpDNUVIbEQrVlpRVitWQVMva3Yw?=
 =?utf-8?B?b1FoellubWx2Z0pjZytxNEZGalRPOGxRRWV1RVlyNk1kQkh3QUZSdmZlUzE4?=
 =?utf-8?B?dWFWb1JXWjc3QWVxem5NUkoxWVZvOVRCUnFHaEVCNVFLQVhlM0ZEUmxObDhw?=
 =?utf-8?B?RlRIOEZQZWhDeHBMSmhtZjlNNmkrZmt6WHVRVGdqVWVRTHpydXFvY2xDQmZ6?=
 =?utf-8?B?bTNwdmJ1YnQ3dGJPc3RGdFk5R3MwbFVyWTlxcGJxSi9jdFJwUEJDRnJ5dHZl?=
 =?utf-8?B?ZEFlaWcweFU0VVJrUnF1dytMVmUxSmVFMGU3QVJuNHR2S1pCZktPOU1jUy9r?=
 =?utf-8?Q?i67bDGAyjizIwOYfZFJL1mQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5441AA7F21EF0742B54DBF543FC6B7A7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82313788-0285-4644-26b8-08db9d2dc984
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2023 01:20:18.2592 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OpjfBiYDdyWcJsu9qyp8ER8XK0/3mkB3gKzT+Bnh6Ux5YIqZaUfc11naY8S2fpwutXdeTGbWI3JQ9eS8fOxqQWKP3ouyI827KW6Gwn2oMPF2BATFv03bBdKJpMl3lKPY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6533
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
Cc: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Harrison,
 John C" <john.c.harrison@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIzLTA4LTE0IGF0IDE4OjEyIC0wNzAwLCBUZXJlcyBBbGV4aXMsIEFsYW4gUHJl
dmluIHdyb3RlOg0KPiBUaGlzIHNlcmllcyBpcyB0aGUgcmVzdWx0IG9mIGRlYnVnZ2luZyBpc3N1
ZXMgcm9vdCBjYXVzZWQgdG8NCj4gcmFjZXMgYmV0d2VlbiB0aGUgR3VDJ3MgZGVzdHJveWVkX3dv
cmtlcl9mdW5jIGJlaW5nIHRyaWdnZXJlZA0KPiB2cyByZXBlYXRpbmcgc3VzcGVuZC1yZXN1bWUg
Y3ljbGVzIHdpdGggY29uY3VycmVudCBkZWxheWVkDQo+IGZlbmNlIHNpZ25hbHMgZm9yIGVuZ2lu
ZS1mcmVlaW5nLg0KYWxhbjogZm9yZ290IGNyZWRpdDoNClRlc3RlZC1ieTogTW91c3VtaSBKYW5h
IDxtb3VzdW1pLmphbmFAaW50ZWwuY29tPg0KDQphbGFuOnNuaXAuDQo+IA0KPiANCj4gQWxhbiBQ
cmV2aW4gKDMpOg0KPiAgIGRybS9pOTE1L2d1YzogRmx1c2ggY29udGV4dCBkZXN0cnVjdGlvbiB3
b3JrZXIgYXQgc3VzcGVuZA0KPiAgIGRybS9pOTE1L2d1YzogQ2xvc2UgZGVyZWdpc3Rlci1jb250
ZXh0IHJhY2UgYWdhaW5zdCBDVC1sb3NzDQo+ICAgZHJtL2k5MTUvZ3Q6IFRpbWVvdXQgd2hlbiB3
YWl0aW5nIGZvciBpZGxlIGluIHN1c3BlbmRpbmcNCj4gDQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkx
NS9ndC9pbnRlbF9lbmdpbmVfY3MuYyAgICAgfCAgMiArLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3QvaW50ZWxfZ3RfcG0uYyAgICAgICAgIHwgIDcgKystDQo+ICBkcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndC9pbnRlbF9ndF9wbS5oICAgICAgICAgfCAgNyArKy0NCj4gIC4uLi9ncHUvZHJtL2k5
MTUvZ3QvdWMvaW50ZWxfZ3VjX3N1Ym1pc3Npb24uYyB8IDQ1ICsrKysrKysrKysrKysrKysrLS0N
Cj4gIC4uLi9ncHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxfZ3VjX3N1Ym1pc3Npb24uaCB8ICAyICsN
Cj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX3VjLmMgICAgICAgICB8ICAyICsN
Cj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX3dha2VyZWYuYyAgICAgICAgICB8IDE0ICsr
KystLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfd2FrZXJlZi5oICAgICAgICAgIHwg
IDUgKystDQo+ICA4IGZpbGVzIGNoYW5nZWQsIDcxIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9u
cygtKQ0KPiANCj4gDQo+IGJhc2UtY29tbWl0OiA4NWYyMGZiMzM5ZjA1ZWM0MjIxYmIyOTVjMTNl
NDYwNjFjNWM1NjZmDQoNCg==
