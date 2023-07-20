Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BA875BAB5
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 00:38:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F1E510E1C5;
	Thu, 20 Jul 2023 22:38:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E45F910E1C4;
 Thu, 20 Jul 2023 22:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689892677; x=1721428677;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=EVCv7ZweQgyzhl93cKpA9DFCok2OJvf2llRJkFjQQPg=;
 b=H4Fp6MP6dhOEifm+41+f+5iaHZwMaexi8jIzFCqJIK47zPbsszW750Wz
 JLMUScqShpGVDfZBAnx3CBhH6fIYZT17hXB2MuwXqOEkj2GkfjTg5JeEY
 +wMH461wGUFlTxs77r74x/xx74LaIaR1QyMrxS6xtCz9enx490N4ok4bA
 2CnkmRZb4hmbE7tI8PpDWmgI2JurOpfyZjrpDFnJDZ11J3WOLRzMq/m0J
 c7RZHOkI+l37ftmZM439bzNG9DC124vSD0uTRvLfefHh5i/kfd+C7ICX9
 Y4oJoCF8GYzvxkR9iPpDZOCedACDzM3yp/5wztTtJsAsSqlarBsRT4JZb w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="365778230"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="365778230"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 15:37:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="674833943"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="674833943"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP; 20 Jul 2023 15:37:56 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 20 Jul 2023 15:37:56 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 20 Jul 2023 15:37:56 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 20 Jul 2023 15:37:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ckIlZOJ/XnDEVXhiC9PhkY7fs+48QPBoixkRgqQULor49qh7y2Gj3n1J8H5VaPJieLiI/EYGJyRVSCIvg+bNAFgn+jvynPC8Fy8idBuDyPrjFIW/zeFCaaiXWgC49gFqV/Rwfbl/lgY5zrHUgVD3XjVnv66xVkg7otXhWiqdshaFbxihtE6YmAANfLHSxwg6iGl0Kx7zjq4u+794m5tUPfYLxnuhZg/5tU3E7/afkWcd2dQO4PTLHXeZwGvkWXy6OyZdVAZ7u0lIEnuZnuaVTZRASp6cvJ33xeTUJ/GEQoUCzjDdY4ZpZNu1zns6EX+tE7r0018eVPfviXdbWAEkkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EVCv7ZweQgyzhl93cKpA9DFCok2OJvf2llRJkFjQQPg=;
 b=DlJGUO2ysGon97GN0i4Hu/ur7VkfLEVy50v4O9vjrP2NTt543nCxaknH5S0xf2ejvjirdc/bbqz75zoeyVLKXL8GJzjZCATtlvz9S69cOqUq694Fr/Fr207egSl+cpbY1IQO7W2vgPB1T8RbmPv2h1aO+vqeWAFoZT+1oSOjEpPNyFNJ9Dqf09H4GUuHGg/KphVYLfSCIvfwlljnpBldl6Z3G8kuozNuMKuc6S2nKB4cPJ94Z9eJcqNleo2Qaz3iuSwS4L9qGG9KzAEJCHM9XsHO8kEZeKGnBtFRj5htk3yEzNErRa4985w5nI4velOErKRiwSbjlYVnEbFlbxksvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 DS0PR11MB7736.namprd11.prod.outlook.com (2603:10b6:8:f1::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.31; Thu, 20 Jul 2023 22:37:54 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::542d:f32a:14b:1531]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::542d:f32a:14b:1531%3]) with mapi id 15.20.6609.025; Thu, 20 Jul 2023
 22:37:54 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v6] drm/i915/selftest/gsc: Ensure GSC Proxy init completes
 before selftests
Thread-Topic: [PATCH v6] drm/i915/selftest/gsc: Ensure GSC Proxy init
 completes before selftests
Thread-Index: AQHZu1LbU/tJVcOIgEulc4akX++IHq/DMm6AgAAMjoA=
Date: Thu, 20 Jul 2023 22:37:54 +0000
Message-ID: <c1616eb06e58da2ca6c4a4e3332c7aed30df5fa4.camel@intel.com>
References: <20230720214044.369277-1-alan.previn.teres.alexis@intel.com>
 <77697fc6-a3d2-d2d4-0406-e534907e2d16@intel.com>
In-Reply-To: <77697fc6-a3d2-d2d4-0406-e534907e2d16@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|DS0PR11MB7736:EE_
x-ms-office365-filtering-correlation-id: da9690ae-ab0f-4ee3-3d2c-08db8971f555
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: esM+d96PhwrqQuhLvLnXWhX0REB67lJy5xSfUrOfEpgu+hULsYNSXUgs7lmXFmdj3VZdzXlNbj97TqP+LXJrepZHvpMdwk4+xmA9uOhXpF7whFgK947+JMWgPrYHjTgyzJ4RmdFibgX5Dzj4pMO/LNwmgngOtmTWTvmXmK9iyH9SKYOk1wPCC1XvbCmTh+JhP8lWG6ZejxR2G5x2FHFut1DNX3gg/EfdBi9F6tAzWg0uJWLdZRrD4PWMiAYLpHS6VUyBmb8qmaMZdNee9jrZcK9ipKmgPYof501Mp7CabUrhLkOisuJk8nAea1vtsfsm73C9Tk13C6bpEu0rWehBlM4qMQ3D8ne4OqPZa1HCVfKxoD+JH4nCGc7VjuRRkoDLOLbBUcRyhRxxEW2flCS4joe3ydXuQaBQ3/BhuRM4FE/kLpyQZYPRtJXmSjjg5mDxajCwtIVedqWjjoBUZz5uzEyvXkGj8Bz8qigAXh4dRcapX0rWZ2ePxUImSntaNbl/vXMz5G8r1ehVlBBfGO3e0ATlli8wjNYWw/2qoSrP4mBOO9nYrGeO1niR01Mq9Ct5yYLs8Bqhb41SoL0XAK1nW1p6htZ9WTWCEFzWvbg3p3g=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(396003)(366004)(376002)(346002)(39860400002)(451199021)(2906002)(478600001)(186003)(71200400001)(110136005)(66476007)(6486002)(8676002)(66556008)(450100002)(36756003)(54906003)(91956017)(41300700001)(64756008)(76116006)(66446008)(66946007)(4326008)(8936002)(316002)(83380400001)(82960400001)(122000001)(6512007)(86362001)(53546011)(107886003)(966005)(5660300002)(38070700005)(26005)(38100700002)(2616005)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R1dobnlTc3JBVHVYVWxtS1pnNGtucDFjYzdhN0tmQTBFS3hhN0lKcTlVVmI3?=
 =?utf-8?B?Z1BvVnJCd0lnRVNZU3dTVjRmYzlSdkxwcnNtS0NKNjE5WUNsck14RE5aYVk4?=
 =?utf-8?B?Q29ia2pZSExnVllpUkVCT0pOc3NZSXkwK2ViTFlUWmthM2pwR2tkRXFYckNS?=
 =?utf-8?B?czlLRDZGNU00TmN4bjJIRWZRay9leVZWTzRiazQzOGdmNTFvb3hYWnJDMzVO?=
 =?utf-8?B?WkFJSGZmOFJzSi9pVXUvdWRZUFV6WHFvd2hralNWdTFaaU40UEVKeXhNTzFV?=
 =?utf-8?B?eEVLeThtaGR6WkxQdjF2b0F2UzI1L1Z3eDRxOGNORTFiaGtwTjBneisrTkp6?=
 =?utf-8?B?elphcWxyRE1rSWVGNngxb3VhU1hxTkVZZXp6TnR1aEEwdGpnL0p1WmhRQjJL?=
 =?utf-8?B?cGJoMmt5c1hLWmVNeHk3OWxUUTBoa2o3RHhwa1VQbmo0bXNNYTdmNDFRQUJq?=
 =?utf-8?B?c0grcSs5ZFhvM0RxMW1kVzZqL00xTTlXdDkvWkNXUGNoM0d1MXFDRmdyNkxW?=
 =?utf-8?B?SmZuU1ZiY2g4RkErdnYxWWRveUpzL0s0T3pOUFYraUM3dnFMTlhNalJSdTRn?=
 =?utf-8?B?OGtiRnVhcStxTDU0UzJmUlhwTVF6Sng0SzlwbW81TWQ0dktYV0ZMM1BuWDY3?=
 =?utf-8?B?cjd3bUtzWnU3ekk1SlAwM0RyZWcrZmN0TC80SFVobmhITWlnaTgyMWVsbEFS?=
 =?utf-8?B?MGsxWVkvQU1qUE5tYmc2eXA3NDBkL3hZdmtIRm91L2svalF2a2VjTUkvNEtD?=
 =?utf-8?B?QmR2c3dOYmxGejhIdTdSUEFnS0Ryenc0QVBwV0dZV255azYvOG90aWZTR0wx?=
 =?utf-8?B?ZVRPZCtQVzBSRmQvaDdTQlhlWVJPMWdjeHBmdGxjMWNCUTNLTDVoYVFlS25p?=
 =?utf-8?B?T2VNSHkvVEF5R2daZy9CNldJYWE2NUMyZS9VWDdXZ0F0UlcyZ1huUVpheFJu?=
 =?utf-8?B?NmcvUk43TjhGSVl2dVdmK2NzVzg2cjVJeDZ6VHRVOFZhUWJ2SDBZczE4UHJJ?=
 =?utf-8?B?eDVORzJDczdLYVRPQXNWaFBPYjVuYit4Q2VSR0FFdDlJbk53cHdnT2I4c3Av?=
 =?utf-8?B?QXVQSFgxa0NtSHl5aDkrd0VhM0lFNjlFSWJTdnRPS1VObmpjRUxmbG1mc2ZT?=
 =?utf-8?B?UkFIM3ZyaEJ6amthMXRpQ2Y2S0RVVlNrTFZQak5LdFE1SDM1U2JzY3pLU1pm?=
 =?utf-8?B?SmF4UjcwUXZCekpjSktWOTFtNFFMbVZmMXM3c3hVYkpxazhFcjVnRTdPSUl1?=
 =?utf-8?B?ZTZZYzVzU3Fsc2RhTWdlSHJKZzhDSnpLNExwaExaRU14bFJ2WFN2S1EzREdi?=
 =?utf-8?B?TWxSMW9oclNYQks3cklJdHZuVmtMU0lpNXE0N3ZpQS9JU25MdnZjK1JDMThx?=
 =?utf-8?B?WSt2a3p1ZnB6WUxiNW82aGxIMWlDT2RmR0hlNk9DWEY0VmVtTmtGbGdWcGpn?=
 =?utf-8?B?eGd3NHlJbm5sMlJWSDFTZXpNa1lqZ2Rtb1UzYWFtOFVJK2dkRDg3RWlwNjNK?=
 =?utf-8?B?enRqWW8ySHR2aTVpRjlOSnl3T2hNbHBhWU51QjNqS0RrN2pSdFZsMEc3emw1?=
 =?utf-8?B?T1pJM1BHSkREbkN5RDRPaWhndjlReEZwRUpYYkNkaWh6VWFHb3U2N2Z4Y2dV?=
 =?utf-8?B?Y215VHB2VHB4ZGdhQVhyT1FWOFdWMGJSUXFyakZwUkFNVHV3M2w4T0N3L0VV?=
 =?utf-8?B?SVVPZXNTMmxyQ3JSZUJYZWIvNFhrUUlhSkI5S2k0eVVMd2lPRTVzbGdpVi92?=
 =?utf-8?B?d3k4Y0pFM2xTV3Fnd2ZVVnMxRjVVOExSbGtvWHgySHJrSDN4ekRlNStCaTZs?=
 =?utf-8?B?Z25LSzN6dm5nZjRpeUVUWlRGaXd3UlloZzVsUjVCekNUdi9weGJRL3JhYm9G?=
 =?utf-8?B?VEl6NnVhN3BjMExZNFY4VEFiekpQbU9KVXlDSnFJKzdUSldzN1dBbVFJQVFa?=
 =?utf-8?B?bmVnMTFxcFJMZkpBakRjcUN5V1hxajZGWnpiMDFhU2crRkltR2prWUJ0R2J6?=
 =?utf-8?B?SzRLZFl4ZXZQUXNiWXRwOWpoL3RLQVgrTkg5UXRiYm1HeUFyTmxIZ0pPNTJn?=
 =?utf-8?B?VE83VDdiTTg0dWFWdmJIWWpjWWRUditTYWNnc3BpeERVMm5tY1p0TGtDbnVx?=
 =?utf-8?B?YUwyeURsem0wK2JkUitGL2l4RkZRTFlmYmZmNE5qSTUyNDI3TzVYYnN2ZHZw?=
 =?utf-8?Q?fpmhxvh2KJGMzHBtOInv8zo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <27FA72D7A5F85B4C88735F31887E1349@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da9690ae-ab0f-4ee3-3d2c-08db8971f555
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2023 22:37:54.2820 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RD1qrzDlI52k5Qp/mP23W/qR5CLUxke/gMAX0dR8wvuPnGV558fjx0Jzvrz542UbY/1vuu/d34q25rUEIOG6ZbkUaVJc8phuF8bxOuhtaGsTA7qCY10FyodR5g1u3Cjq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7736
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
Cc: "Dong, Zhanjun" <zhanjun.dong@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Ursulin,
 Tvrtko" <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIzLTA3LTIwIGF0IDE0OjUyIC0wNzAwLCBDZXJhb2xvIFNwdXJpbywgRGFuaWVs
ZSB3cm90ZToNCj4gDQo+IE9uIDcvMjAvMjAyMyAyOjQwIFBNLCBBbGFuIFByZXZpbiB3cm90ZToN
Cj4gPiBPbiBNVEwsIGlmIHRoZSBHU0MgUHJveHkgaW5pdCBmbG93cyBoYXZlbid0IGNvbXBsZXRl
ZCwgc3VibWlzc2lvbnMgdG8gdGhlDQo+ID4gR1NDIGVuZ2luZSB3aWxsIGZhaWwuIFRob3NlIGlu
aXQgZmxvd3MgYXJlIGRlcGVuZGVudCBvbiB0aGUgbWVpJ3MNCj4gPiBnc2NfcHJveHkgY29tcG9u
ZW50IHRoYXQgaXMgbG9hZGVkIGluIHBhcmFsbGVsIHdpdGggaTkxNSBhbmQgYQ0KPiA+IHdvcmtl
ciB0aGF0IGNvdWxkIHBvdGVudGlhbGx5IHN0YXJ0IGFmdGVyIGk5MTUgZHJpdmVyIGluaXQgaXMg
ZG9uZS4NCj4gPiANCj4gPiBUaGF0IHNhaWQsIGFsbCBzdWJzeXRlbXMgdGhhdCBhY2Nlc3MgdGhl
IEdTQyBlbmdpbmUgdG9kYXkgZG9lcyBjaGVjaw0KPiA+IGZvciBzdWNoIGluaXQgZmxvdyBjb21w
bGV0aW9uIGJlZm9yZSB1c2luZyB0aGUgR1NDIGVuZ2luZS4gSG93ZXZlciwNCj4gPiBzZWxmdGVz
dHMgY3VycmVudGx5IGRvbid0IHdhaXQgb24gYW55dGhpbmcgYmVmb3JlIHN0YXJ0aW5nLg0KPiA+
IA0KPiA+IFRvIGZpeCB0aGlzLCBhZGQgYSB3YWl0ZXIgZnVuY3Rpb24gYXQgdGhlIHN0YXJ0IG9m
IF9fcnVuX3NlbGZ0ZXN0cw0KPiA+IHRoYXQgd2FpdHMgZm9yIGdzYy1wcm94eSBpbml0IGZsb3dz
IHRvIGNvbXBsZXRlLiBTZWxmdGVzdHMgc2hvdWxkbid0DQo+ID4gY2FyZSBpZiB0aGUgcHJveHkt
aW5pdCBmYWlsZWQgYXMgdGhhdCBzaG91bGQgYmUgZmxhZ2dlZCBlbHNld2hlcmUuDQo+ID4gDQo+
ID4gRGlmZmVyZW5jZSBmcm9tIHByaW9yIHZlcnNpb25zOg0KPiA+ICAgICB2NjogLSBBZGQgYSBo
ZWxwZXIgdGhhdCByZXR1cm5zIHNvbWV0aGluZyBtb3JlIHRoYW4gYSBib29sZWFuDQo+ID4gICAg
ICAgICAgIHNvIHdlIHNlbGZ0ZXN0IGNhbiBzdG9wIHdhaXRpbmcgaWYgcHJveHktaW5pdCBoYWRu
J3QNCj4gPiAgICAgICAgICAgY29tcGxldGVkIGJ1dCBmYWlsZWQgKERhbmllbGUpLg0KDQphbGFu
OnNuaXANCj4gDQoNCj4gPiAraW50IGludGVsX2dzY191Y19md19wcm94eV9nZXRfc3RhdHVzKHN0
cnVjdCBpbnRlbF9nc2NfdWMgKmdzYykNCj4gPiArew0KPiA+ICsJaWYgKCEoSVNfRU5BQkxFRChD
T05GSUdfSU5URUxfTUVJX0dTQ19QUk9YWSkpKQ0KPiA+ICsJCXJldHVybiAtRU5PREVWOw0KPiA+
ICsJaWYgKCFpbnRlbF91Y19md19pc19sb2FkYWJsZSgmZ3NjLT5mdykpDQo+ID4gKwkJcmV0dXJu
IC1FTk9ERVY7DQo+ID4gKwlpZiAoX19pbnRlbF91Y19md19zdGF0dXMoJmdzYy0+ZncpID09IElO
VEVMX1VDX0ZJUk1XQVJFX0xPQURfRkFJTCkNCj4gDQo+IFlvdSdyZSBtaXNzaW5nIHRoZSBjaGFu
Z2UgdG8gbW92ZSB0aGUgRlcgc3RhdHVzIHRvIExPQURfRkFJTCBpZiB0aGUgDQo+IHByb3h5IGZh
aWxzIHRvIGluaXRpYWxpemUuIE9yIGFyZSB5b3UgZXhwZWN0aW5nIA0KPiBodHRwczovL3BhdGNo
d29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzExODcyMy8sIHdoaWNoIGluY2x1ZGVkIHRoYXQg
DQo+IGNoYW5nZSwgdG8gYmUgbWVyZ2VkIGZpcnN0Pw0KPiANCj4gRGFuaWVsZQ0KDQphbGFuOiBh
cyBwZXIgb3VyIG9mZmxpbmUgc3luYywgSSdsbCByZXNwaW4gdGhpcyBvbmUgYW5kIG1vdmUgaXQg
YXdheSBmcm9tIHRoZQ0Kb3RoZXIgcGF0Y2ggKHNpbmNlIHRoaXMgaXMgbW9yZSBjcml0aWNhbCkg
YW5kIHdlIGNhbiByZXNwaW4gdGhlIG90aGVyIGFmdGVyDQp0aGlzIGlzIGRvbmUgc28gd2UgZ2V0
IGEgc21vb3RoIG1lcmdlLiBBbHNvLCBhcyBpIG1vdmUgdGhhdCAiY2hhbmdlIGZ3IHN0YXR1cw0K
dG8gZmFpbCIgZnJvbSB0aGF0IFBYUCBwYXRjaCB0byB0aGlzIHBhdGNoLCBJJ2xsIGZpeCB0aGF0
IGlzc3VlIHdoZXJlIGkgbWlzc2VkDQp0aGUgMm5kIGZhaWx1cmUgcG9pbnQgaW4gdGhlIHByb3h5
IGluaXQgZmxvdy4NCg0KVGhhbmtzIGZvciB5b3VyIGhlbHAuIDopDQoNCg==
