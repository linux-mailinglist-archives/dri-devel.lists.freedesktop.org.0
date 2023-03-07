Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 614C06AF99D
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 23:55:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE04810E564;
	Tue,  7 Mar 2023 22:55:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2D3B10E2AA;
 Tue,  7 Mar 2023 22:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678229737; x=1709765737;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=UrFKXTm8drRcPzViCEHKh6dQt01+t4GGKxz1S/o/ack=;
 b=JFvj6UPnN4acYu8agVJfy/ntMXtQ6Da5WgX9C7Ji5uAIxdqi0kMcZjXH
 pLoMwx8peVN3tnGw5Oe7akStvRxQlnh3GJKUDVWDbhnIf7zzFlgBRwgs/
 6e94+jYj0yGEn4+yKYk3jznb1XdvVkwavG5PdODXQZLdhjbtLcDOrlKYk
 7IbOd0KO0FwJ0mPEaH8OvW7zCeMBkaWFyfrCVYoXk5w9f0u43/u683pB8
 Qm3FHXzKKUygXBbfLZ4AwPrqvSrZ1RfGFEAUUnciBF1/p5bbtZvyz9eJt
 YFY0T5HyLFCvOCg+RPy5UU7F/bMhOag+q/moe7RDHqUh+kO2PrjxQ9HG6 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="319824137"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; d="scan'208";a="319824137"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 14:55:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="706960541"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; d="scan'208";a="706960541"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP; 07 Mar 2023 14:55:37 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 7 Mar 2023 14:55:36 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 7 Mar 2023 14:55:36 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 7 Mar 2023 14:55:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k6DfNEFSI2GlxFHUuyiGo04qsR9u66qE1KtF503Gdph7yi0MJAH378PGpHXlLKfGk9Q1l4Ao/dX5YHw5YGhVXEO5nZEc+jPNC8b37rYhYKaBTWu5N1AJUdyf0xAdFDbeJKhbodHli+UJoMM60HH35Bu4uvH6kBQhOifwzlz64KUo0HP2hooE2WCzBOhFIrfoKg+DO/VtXicT5FEgysZIg7i3PTRC8HwxP7QzqQsV14VdgHOQv2P9PvqKNt/7xqVXcSgwFnfg2NNiGv+PXs2XA7TxqycgbVNdRBZYE3IZf9bO5v0G6+InVdCjHzcsQITKEaB8rzsW43o1aWXm8Q2P4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UrFKXTm8drRcPzViCEHKh6dQt01+t4GGKxz1S/o/ack=;
 b=KXmmvekFcXDkBMPxHQ9OHKs27w8euBCSHYf/hdZEkDO+5mDURRUJf3TpyQ0FZfLrms3nIj+A8i2XRw08wRvaHu8xcnnpD7SJXcs69hqBda1ZHaC+4kFHp/d0IITT/DCjcMWb9TBF2jSaJiWUwahq0rRX1iydvf4EAoD6Jc293MjumjBWKdILaXxKhUoEE4v52tDtENmw0KHeda6myWtFafu6V6x4of3/GmHxVXNdI7nq7FIY6miKqVjCvAIfeGR8FeZtH94kae39rY8Io2++tJYRwHsSnf+nMfmSS3bEoTR7qW4eFfnn09yBwiCg/RmmXtXOMlBeKdtszNciw2VyCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 IA1PR11MB6346.namprd11.prod.outlook.com (2603:10b6:208:38a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.16; Tue, 7 Mar
 2023 22:55:29 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4cdb:78a7:917e:88e5]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4cdb:78a7:917e:88e5%9]) with mapi id 15.20.6156.029; Tue, 7 Mar 2023
 22:55:29 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/i915/gsc: flush the GSC worker before wedging on
 unload
Thread-Topic: [PATCH 1/2] drm/i915/gsc: flush the GSC worker before wedging on
 unload
Thread-Index: AQHZR6pFrrPlObut10WNCdsSLiC1kq7wAHyA
Date: Tue, 7 Mar 2023 22:55:29 +0000
Message-ID: <b0897933de952329e9df4995e571541f82716c97.camel@intel.com>
References: <20230223172120.3304293-1-daniele.ceraolospurio@intel.com>
 <20230223172120.3304293-2-daniele.ceraolospurio@intel.com>
In-Reply-To: <20230223172120.3304293-2-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|IA1PR11MB6346:EE_
x-ms-office365-filtering-correlation-id: 5087f1aa-819b-48ff-fb52-08db1f5f0c5c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RYrX3NQXUSNiJZsi7If8QD1+rfyEWAoDNIjSeFHTV4bPLnp3A3Mx2QeWE1CbF5IhIL3cwMeOPTscuT6nugxXWiVn1bN9gj6dclUMRnlWbH1l/5RBvP/lCBwBg4le22ou2B2IdMPip+b+588SI6C6nAPeNfYMp3HBDQ85NSZ61NEqTytHAL3uiD4wakjBvHIz3gKy7e0C4lHGVGZYsr/l3fvyxVjjcbsr4x38hknyu4Og+2XAr0SVNm4+J7eVjO3CmKZv+96Oj84WCaHmbBut362jews2dmKzModolqOC2vo8sNksY33u6kHos1RSvZ1E8hJ86O4fDvknQ+mRLkMQj5Tl8kjacaHjjhWC6Frtno9FL7o6pdMy7JvQ8KViv+N2cdaF+lkYwxaGP18ZgKy/11VuevhHzQjLJcGg5sTGS3PEcUbHDFfcxFepG57C/dgVuK3QKiom0ku2UQmgG0UL6AEm6r9W9hHMhuFEAzpqjkaUELN6Feqg74nie6EeVTFfPxnCdh6q8Jbw+vl1PKux/91tLrWlc9c/QPc75bw9YJ7346pZyRfQ1IDMq70iK9W/u6LIJRNnKzQXhRQ8gBDX2HVUYbRqJQ0Tmo6ac3A/vkpv18GyErXbRkncy14e0RUGT/ufjOZNK670211eufPjvqJ5AnhzYaHfLPHU7ZuL6uwVBcBBqCtnw0VZs7bphvtutDauFRKW4JscuUZgkTYsQw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(376002)(366004)(346002)(39860400002)(396003)(451199018)(91956017)(66946007)(76116006)(478600001)(450100002)(41300700001)(82960400001)(122000001)(66446008)(8936002)(66556008)(66476007)(4326008)(8676002)(64756008)(2906002)(38100700002)(316002)(38070700005)(110136005)(83380400001)(71200400001)(6486002)(86362001)(186003)(36756003)(5660300002)(26005)(6506007)(6512007)(2616005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OGIwOUpJbDJBbVpiNWtEMHMyL3hmWjJmZ0tva2QzVEFzTFJ6NWoralNMRzJk?=
 =?utf-8?B?MThuWFI0Q2FuR3dSVStpcnBLcVFKOWNQRnIySHlock5QaWJEVVRQajcvVjlB?=
 =?utf-8?B?aUJKUy90ZGVNZnRMN3FSSmI0QkFQUGZ6NmZSMkdrTEZGanhVNjlXS0pOVDFt?=
 =?utf-8?B?TWVGZXprcVE2cms5THp2UEpwQk9zSUVWemVaQUo1Qjk4TDQzSHJkREpIZysz?=
 =?utf-8?B?cVoyTWVpeUcvNDZQeDJWWVhhRXRheGtQSHRIc0Qxay9pVytFY1M4NS9peWUy?=
 =?utf-8?B?ZkJNbXBDNWQ1TEhTTEdiVmNjdy9MRDBrRnorQ25iK3EvcmhWRFJodkR2K1Vi?=
 =?utf-8?B?NEN1ZVJDK3d3SXVPMm5pcXE3dktuVTNQbTdQNnBySFVGdHY4U2lpZzF2UEIv?=
 =?utf-8?B?R0hVS2E1OWRwL0MvTEVGME8xRUllcnAwbEJPb0sxSTgrTk10OVRuTG1WSEZL?=
 =?utf-8?B?ZlZieDFCcXN2cFh6N09BRjZnU01SRkRCSUVyaTlUUnZTSmxNU2Evdnh2T2p0?=
 =?utf-8?B?eS84NHE0T3FLUWdYTUsyYU1DbHA2TTRTU3QrTXBOa2dOT3RyaFVHVnVFeEd0?=
 =?utf-8?B?aTRGTzBnYVNwZHpjakV4Y3Z3TnJBUWRyRnRYMTlUMllYMERGSkpBeENDWE9o?=
 =?utf-8?B?R2JaczJqdnFWeW1ESWJrV1o3dGhJNVUrckFOa3FUc0ZqMTdIUEFqcXNZZG5z?=
 =?utf-8?B?VXdFMmlpSWwyYnBVSTBBeHVyM25hMVhEWlZ3cW9JWFpBV0xOb1RpNUtueTJt?=
 =?utf-8?B?ZzY2d1NzTUtTYm94ZlJXMTJBbmFTUmp0c3UxNmdSYy9QRUlvdDZkOGtLSE5p?=
 =?utf-8?B?N3prb0xLQzMwdUNRTEZKUzVES3ZIcjBvUW5LNzgzN2VtdnBFOVVMN0pnNlFy?=
 =?utf-8?B?TVZaVHQzS3BXTzBrc0dtUGhGRm1DRnlHR0NMSGZiRmhUM08xYlVJSFFhZ2dQ?=
 =?utf-8?B?c0Fsd2lJNkJwWk1GMjZQaXVnc1RNNWJrRS9qdnNjN2VhN2VGNG10U1UrdkVC?=
 =?utf-8?B?SUg2SDZIMWhQYmVUSms3U1l6cUtNV3ZiMFYvRWt4cVpBSVlLQXpQWGI3TTVy?=
 =?utf-8?B?M09VS1BIUlMvbVI1Z3N5anh2MFhMc0ZwS3BNQnkxUGR5Z2c1czBJYmRQSDlJ?=
 =?utf-8?B?b0hFazlrZW9rRE8yWXFrY2phaXZ6azhrK2pTSVhpc09VQVZGdlNzUTFYZUYy?=
 =?utf-8?B?MjRiUC9JUjdmY09UYTZWdldoT3B5QXFrRmxBLzRlWnc5UmpJK1hDU2tqckox?=
 =?utf-8?B?aEttTm1ad3Uzb1J4ckt3ODEvMUhHYUxva2szQUQ4Z2V4OEgwTmxRUXNGRmVL?=
 =?utf-8?B?RWZ5djNpYmR4KzFZTHlvSkxHdW56UFVDei8yV0RGUk92cHJwQTdBMHJxbUZ1?=
 =?utf-8?B?MW9wcUFDN2lOb0tnb0ZNRStESEVORFg4Qyt4MjVwQjVoSitNcHJ2WkFkeTU3?=
 =?utf-8?B?NCtqUjNzbXRGbUxsQUlMV0E1UVV3Y0c0em9ZN3NjTUd2K1hZNm5hNnVJZnht?=
 =?utf-8?B?THFQRWwvdTEyNHc0WGdtV0NyTTBVNjdWMWQydmpXdDJCOUZRRnNPUVQyazZr?=
 =?utf-8?B?ODFWbEtLWUU3b3hGeEdVZEE3dkI0a0svcFFZWUJwYXhCNjAwWDBxSDNkckFh?=
 =?utf-8?B?clNSc0pWTFlaV1VtU2N5aGpFOXNlZ2s1c3RhNlRXa0RPRUhNTnZ5QUNreWRU?=
 =?utf-8?B?cGl4MkVwT0hNM1dIZG1DRndVRWdhQnZvc05aQXRjMEh3KytVa1ZtdVA3RTQ1?=
 =?utf-8?B?WnhZUVg5VnF3UGlGT0ZESmRaaFlzV1psT3Y2WE9QaUY3UFUrdkNSVUxCOHlH?=
 =?utf-8?B?MG9PSzZLZnkySy9UeUhveTFCZzZPMTBlMGUxcmpZQ0RVaHpCYWNlK3oxbXdS?=
 =?utf-8?B?U3JFMkdHWE90SC9pdm5aUWtyOTRield6eVBpamxzZ2RrRjdvK1g0czdnbGdV?=
 =?utf-8?B?L3RPbThKWW53eDJkS2hRTFhVUGJ4TC8xWGRDRVJBNTgxaXViYlhMMEMyR0gz?=
 =?utf-8?B?UXlRcGJTTFlLeUtFOUJDZW5wZlNVYUJzTjZSV3lGZGNxWnJqOTUwRzhoUEJq?=
 =?utf-8?B?WU9NRmM1ZmRIMUtlUC91ZFlJYTJ6TFBUdUl4Rjc4WFV4R0RITnVXcU4wTSty?=
 =?utf-8?B?L3NTL0g5eldIaGtOdlhMWEJaNVRmR3RIdHBJQUt2ck83bWNFNEVyVTQ4TFdZ?=
 =?utf-8?Q?LzDYaeEiQItGv7+48MnSZtc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3B813F989829744ABFD97B153BCD5AF2@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5087f1aa-819b-48ff-fb52-08db1f5f0c5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2023 22:55:29.2362 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2jHN1w0b14z8mzPl0vt3IWj6/Wp2zBOdSwxzzhhV9lZjW79FqZ6mdv/JpORhJN/fVIHkcp5ILY4cha/F+FdF1lcoCK/gkkBo3xf6yPPQKa6ill1lZ4iJNJzXHr/2keZF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6346
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

T24gVGh1LCAyMDIzLTAyLTIzIGF0IDA5OjIxIC0wODAwLCBDZXJhb2xvIFNwdXJpbywgRGFuaWVs
ZSB3cm90ZToNCj4gSWYgd2UgdW5sb2FkIHRoZSBkcml2ZXIgYW5kIHdlZGdlIGJlZm9yZSB0aGUg
R1NDIHdvcmtlciBpcyBjb21wbGV0ZSwNCj4gdGhlIHdvcmtlciB3aWxsIGhpdCBhbiBlcnJvciBv
biBpdHMgc3VibWlzc2lvbiB0byB0aGUgR1NDIGVuZ2luZSBhbmQNCj4gdGhlbiBleGl0LiBUaGlz
IGlzIGhhcmQgdG8gaGl0IGZvciBhIHVzZXIsIGJ1dCBpdCBpcyByZXByb2R1Y2libGUNCj4gd2l0
aCBza2lwcGluZyBzZWxmdGVzdHMuIFRoZSBlcnJvciBpcyBoYW5kbGVkIGdyYWNlZnVsbHkgYnkg
dGhlDQo+IHdvcmtlciwgc28gdGhlcmUgYXJlIG5vIGZ1bmN0aW9uYWwgaXNzdWVzLCBidXQgd2Ug
c3RpbGwgZW5kIHVwIHdpdGgNCj4gYW4gZXJyb3IgbWVzc2FnZSBpbiBkbWVzZywgd2hpY2ggaXMg
c29tZXRoaW5nIHdlIHdhbnQgdG8gYXZvaWQgYXMNCj4gdGhpcyBpcyBhIHN1cHBvcnRlZCBzY2Vu
YXJpby4gV2UgY291bGQgbW9kaWZ5IHRoZSB3b3JrZXIgdG8gYmV0dGVyDQo+IGhhbmRsZSBhIHdl
ZGdpbmcgb2NjdXJyaW5nIGR1cmluZyBpdHMgZXhlY3V0aW9uLCBidXQgdGhhdCBnZXRzDQo+IGNv
bXBsaWNhdGVkIGZvciBhIGNvdXBsZSBvZiByZWFzb25zOg0KPiAtIFdlIGRvIHdhbnQgdGhlIGVy
cm9yIG9uIHJ1bnRpbWUgd2VkZ2luZywgYmVjYXVzZSB0aGVyZSBhcmUNCj4gICBpbXBsaWNhdGlv
bnMgZm9yIHN1YnN5c3RlbXMgb3V0c2lkZSBvZiBHVCAoaS5lLiwgUFhQLCBIRENQKSwgaXQncw0K
PiAgIG9ubHkgdGhlIGVycm9yIG9uIGRyaXZlciB1bmxvYWQgdGhhdCB3ZSB3YW50IHRvIHNpbGVu
Y2UuDQo+IC0gVGhlIHdvcmtlciBpcyByZXNwb25zaWJsZSBmb3IgbXVsdGlwbGUgc3VibWlzc2lv
bnMgKEdTQyBGVyBsb2FkLA0KPiAgIEh1QyBhdXRoLCBTVyBwcm94eSksIHNvIGFsbCBvZiB0aG9z
ZSB3aWxsIGhhdmUgdG8gYmUgYWRhcHRlZCB0bw0KPiAgIGhhbmRsZSB0aGUgd2VkZ2VkX29uX2Zp
bmkgc2NlbmFyaW8uDQo+IFRoZXJlZm9yZSwgaXQncyBtdWNoIHNpbXBsZXIgdG8ganVzdCB3YWl0
IGZvciB0aGUgd29ya2VyIHRvIGJlIGRvbmUNCj4gYmVmb3JlIHdlZGdpbmcgb24gZHJpdmVyIHJl
bW92YWwsIGFsc28gY29uc2lkZXJpbmcgdGhhdCB0aGUgd29ya2VyDQo+IHdpbGwgbGlrZWx5IGFs
cmVhZHkgYmUgaWRsZSBpbiB0aGUgZ3JlYXQgbWFqb3JpdHkgb2Ygbm9uLXNlbGZ0ZXN0DQo+IHNj
ZW5hcmlvcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IERhbmllbGUgQ2VyYW9sbyBTcHVyaW8gPGRh
bmllbGUuY2VyYW9sb3NwdXJpb0BpbnRlbC5jb20+DQo+IA0KYWxhbjpzbmlwDQo+IA0KPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9ndC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2d0L2ludGVsX2d0LmMNCj4gQEAgLTc4NCw2ICs3ODQsMjkgQEAgdm9pZCBpbnRl
bF9ndF9kcml2ZXJfdW5yZWdpc3RlcihzdHJ1Y3QgaW50ZWxfZ3QgKmd0KQ0KPiAgCWludGVsX3Jw
c19kcml2ZXJfdW5yZWdpc3RlcigmZ3QtPnJwcyk7DQo+ICAJaW50ZWxfZ3NjX2ZpbmkoJmd0LT5n
c2MpOw0KPiAgDQo+ICsJLyoNCj4gKwkgKiBJZiB3ZSB1bmxvYWQgdGhlIGRyaXZlciBhbmQgd2Vk
Z2UgYmVmb3JlIHRoZSBHU0Mgd29ya2VyIGlzIGNvbXBsZXRlLA0KYWxhbjpzbmlwDQo+ICsJICog
c2NlbmFyaW9zLg0KPiArCSAqLw0KPiArCWludGVsX2dzY191Y19mbHVzaF93b3JrKCZndC0+dWMu
Z3NjKTsNCg0KYWxhbjogbml0OiBmcm9tIGEgY29kZSByZWFkaWJsaXR5LCBoYXZpbmcgaW50ZWxf
Z3NjX2ZpbmkgYmVmb3JlIGludGVsX2dzY191Y19mbHVzaF93b3JrIGFsbW9zdCByZWFkcw0KYXMg
aWYgY29kZSBzaG91bGQgaGF2ZSBiZWVuIGludmVydGVkIGV2ZW50aG91Z2ggd2Uga25vdyB0aGF0
IHRoZSBmb3JtZXIgaXMgZm9yIHRoZSBvbGQgbWVpLWNvbXAgYmFzZWQNCmZyYW1ld29yayBhbmQg
dGhlIGxhdHRlciBpcyBiYXNlZCBvbiB0aGUgbmV3IGdzYy1jcyBiYXNlZCBmcmFtZXdvcmsuIGkg
Y2FudCB0aGluayBvZiBob3cgZWxzZSB0byByZXNvbHZlDQp0aGlzIG90aGVyIHVuaW50cnVzaXZl
bHkgb3RoZXIgdGhhbiBhZGRpbmcgYSBjb21tZW50LiBPdGhlciB0aGFuIHRoYXQsIGFsc28gY29u
c2lkZXJpbmcgd2UndmUgaGFkIG9mZmxpbmUNCnRlc3RpbmcgYWxyZWFkeSB2ZXJpZnkgdGhpcyBh
bmQgdGhlIG5leHQgcGF0Y2ggdG9vLCBMR1RNOg0KUmV2aWV3ZWQtYnk6IEFsYW4gUHJldmluIDxh
bGFuLnByZXZpbi50ZXJlcy5hbGV4aXNAaW50ZWwuY29tPg0KDQoNCg==
