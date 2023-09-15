Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 919067A24D0
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 19:30:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E1A810E65F;
	Fri, 15 Sep 2023 17:30:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90BE510E65B;
 Fri, 15 Sep 2023 17:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694799040; x=1726335040;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=55+Jqy1nZVJFvA7TUYgSNl3DW9t0/sxbg/23URtZLn8=;
 b=ef/PSaJmcu+lHfxjq9oUoPZFTVbAEMs5kMvDcoWGYAw4n98RGsDnNA0D
 43EiPfOinmFowZT1aD4yF1854OQ6FHSKRT84FSfe6Szw9QK1Nps5MUWrE
 GZlwwgiKLBShEe4bTu7GLmrhwRVoTnEHTfwL5N0J5eBz/QOm0zDGMDs0j
 HPJvH0G5fApjqX7/NSZe8pIclopFWRs8Xj4KEReLJaGGnPi8z7ZwPBUTT
 WPlEwTv3SvZ7rhAwYB+kVCyeAgWL8UN0LCgQXTOviK6NxGkx8iPXQzJdj
 syr8qGwZd9xdMecBx6StKXgPBTzoNr9FLn1JWF9RJpdWAPlztgtxDp1il Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="465663101"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="465663101"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 10:30:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="918721824"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="918721824"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Sep 2023 10:30:39 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 15 Sep 2023 10:30:38 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 15 Sep 2023 10:30:38 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 15 Sep 2023 10:30:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kw+aIOF7QGcfzdml3kNIhc/8ypKJK3LraaIFaNbrp/jP5yVZQhZHy19KvWsTseXzt3TKnEP+Bveangcvx3TG0+28/8e3Vk3H50MHRPnjJb3Hp1kukEtnSSlWSW2GZhn5/edOT5eAO2TQBmg2t3PVNz4Y7aBXCPoQ2oVCo8IccyN50BinP5GJNJmmYWHV2OwIhrbLhaIlgbOIImMTsmnEuTc4RUAk8KizAB28dJMnbNTG7goy1yhQbiN69IGbVRrgTTmb3k3aqCqPJmok65cd+8zbY5NQyEb4dQDg04+geRbl6Hz9Oe3XZPZAm1s0BtY40RUBRwoOA2bNs2CIBS6cCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=55+Jqy1nZVJFvA7TUYgSNl3DW9t0/sxbg/23URtZLn8=;
 b=mtlu7yYHAixp2DDxXaHIcJornTRtm5HqGjvvDpbUJhuX6aeA71eCkx5/YSrUXdwX90wVYFCtsTyYIrzH43q1PMlP9JUSCWcXUvqEV+Q2mE9Tfc+HnK42xGmVlE+VwWgIU3OHwk6Rs9VODGx0WL+T4RZkDylBAs7BhgCi/3BXZuHSfSnDywrYJLMvnUakY5SvM0rtNyXB1nRC6rGqWZm+84xyw07ccOIDRNzStm2LqMd/aKwjGby86ctSsIbfAVFVbInRVRF5wI+C6040jGAuf1KV+p/L36cM9aYT1m8g+Xo9VEadt3uv0lZKYRip4mTW19r4cssoHXnZbVU5MzArgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 MW4PR11MB6740.namprd11.prod.outlook.com (2603:10b6:303:209::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Fri, 15 Sep
 2023 17:30:36 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::542d:f32a:14b:1531]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::542d:f32a:14b:1531%3]) with mapi id 15.20.6792.021; Fri, 15 Sep 2023
 17:30:36 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v5 1/3] drm/i915/pxp/mtl: Update pxp-firmware response
 timeout
Thread-Topic: [PATCH v5 1/3] drm/i915/pxp/mtl: Update pxp-firmware response
 timeout
Thread-Index: AQHZ425qW/YZtkF9JUaGvyHjBmLjbrAcLc0A
Date: Fri, 15 Sep 2023 17:30:36 +0000
Message-ID: <793b32544daca7159380fa761a800ca24f47b7a6.camel@intel.com>
References: <20230909223848.427849-1-alan.previn.teres.alexis@intel.com>
 <20230909223848.427849-2-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20230909223848.427849-2-alan.previn.teres.alexis@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|MW4PR11MB6740:EE_
x-ms-office365-filtering-correlation-id: 40f8cceb-7c84-486d-210f-08dbb61178fc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: g3KTBBosy8rdpPdi2xIBbiYcHq/nhKba9LwpdNXgvXQS8URYmepnuo5saw4izgAufIGkOYlnV2dH9EmV2sXtDqhdBL1W+ZCBd3aBawQSvs1B4VR/jjiwAPJ6LkhH+TQgyZa3VUhW8hJ5mpsgxSs4GVaQP0sqUSF1n71DIdNuOzuCKv/c/lgRrs15NbxaDQAcK5k3A0bxMaZ6OnkzyKW5bJ3sbAXBZMNExCBKYTrHKGR2TEQhVg6XW5J2+M7qYJOjDJQxl+0izZP2ixcwjFKM+ewOBFatN1M4/7qXMg1ggQiUEPzTB/kETyqNUJyEGYscLofap1YxLZfgrnDjmeYT6bKhukaSl6cZ2jawFzHn9N66SDN/InzjvdRL/3lDN0/ORF3ukD8fXBySlrp1LXMIdRqGe3XLFBw0eFna7p2mtLodxLIchOoHGtj1NqOQ5wV5MBtPaXYm3rt3RLVrx+CUeTtasiKqBWocXktasSOf/vWPjOOpda41Yk2y3vRRvi3UVvgWFs1//Bhg/drz+JQY8MLNlACp8PP37cJq1jMtYdl6FSSIIAZyC4l7Zc93FVzn7l7EgU7c6bxwGukzQ0x0noUcOyvTv0nniqpYNgPSLRbRS/cgP2ieX3RBly9WVrVP
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(396003)(346002)(136003)(366004)(186009)(451199024)(1800799009)(15650500001)(36756003)(38100700002)(38070700005)(82960400001)(83380400001)(122000001)(2906002)(6916009)(66446008)(76116006)(71200400001)(66556008)(66476007)(91956017)(64756008)(66946007)(107886003)(54906003)(316002)(6486002)(4326008)(8936002)(6512007)(478600001)(86362001)(2616005)(26005)(8676002)(6506007)(450100002)(5660300002)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Mm9naDkrV1k0bXQzMzhMNDFobFRybHZaR3BCWk0zdDc1eHV3bkJEcmpianBj?=
 =?utf-8?B?dXZxZUNZTGpnL3cydjNpL2ZDT21EaER0TmJpRGJYNW1DUm1UN1pqbGhwYmZV?=
 =?utf-8?B?V1BDRWpKamcwYSsvWXptdFVPQVhXNFBGeGlua0QyVUFESUgwcHYveXRvdnZI?=
 =?utf-8?B?R1paOXJBV29kTkpWZC9FT3lhUHdiZm9NTHBiYmErWTlKMExDUlJZWDY1ZjBz?=
 =?utf-8?B?SjBxWWJiL2huZ1VlRHplTDRrcDBrM0NnLy9tcUNvaHhoOHhvODY0aU9uYkRn?=
 =?utf-8?B?N3dwMGkvYmtIUnZvaXQzOXBzM3cwMklnMEU5MEw4UFViNEtlbk44Qng3dzBM?=
 =?utf-8?B?dVV0VitEMzFyWEJVN1lORk8rUEt1UnBWQXdCbHlEUEdGV3N4Y1JFdzJJbVV5?=
 =?utf-8?B?dVdDUGdzcEk3a3F5bnZvRjFOVnRqZVBSaWJCSXNFMGNLRDFpUlhiYThHdGU4?=
 =?utf-8?B?OHpiaEZiL1VaTnNzMXQrbVdMWXBOU3BQVHJDUmtGdnlMKzNkTVYvaWJ6QVZr?=
 =?utf-8?B?SGVETWRsVjl4R0Z6VGQrZFlTZ1YvdCswZjlrNFNZU09ETjJqTUFHYWNnanlk?=
 =?utf-8?B?OXhrZE55Uy9XR0pscUdTdHJBOFJ6MUJPeFRWeDF0ZzBJN2Z0N0RpZ2tMSGVT?=
 =?utf-8?B?cUxZL1gvS1ZPdkoyV1preE1Bbko1MmEzQXRMSTYvLyt3amtVZ2hmUDk5OEx1?=
 =?utf-8?B?ajJ1Z01lbUlUbHVLM3BBbldkcUU5bHEvOXZoZmFSeEVybzRYMEs2eW10SlNs?=
 =?utf-8?B?TmUzSTMvZm1EelZYak1kMGFiVnJ3clhZRmEvNVY3TjAyVkhGZUROcS9vQ3V1?=
 =?utf-8?B?KzVIYVBleldwUlNtSzJsKzhtSk1FV0FrdElnYUc2YlphdnE4TW95b1RkaU1V?=
 =?utf-8?B?RU14ZW9vdWNJNnhNNUJtRmVMTzFDRlhMa2FrWEhRQXR2VmdNUWJZTjlVNFNG?=
 =?utf-8?B?U2tkVDZsNTcycVFSMSs4eUtDajNNeU80clVDNHROUW5ITm1hVHFEb0ZteUFP?=
 =?utf-8?B?Zk9zcTZhWDI2L1BXSHVxaGRMckFCem9PY2w2ZGNMai9PYlh0QXFkOXlLVWRN?=
 =?utf-8?B?cStZdVprU1RKOGhGenU3WGZwRllIZnVwWlByblVTMkVEeFpNWCs0SGlDdHlx?=
 =?utf-8?B?bnZDU3NyaWJsNGl1NnQyMkQ4UUN4MUJkSVlVa2tSV3Y0MmhxZVhROTlxYlFU?=
 =?utf-8?B?a013RFBaQjAvTk5vdjMveGtZZ1pveXUvLzNITXpnYVdFYTMwT3hzemtFbkc2?=
 =?utf-8?B?L0NLbHRTdWNKL0N5R2lsenFKSGlYY0tTSjY2VEJHei9sOEFGYmlPWHpydEhs?=
 =?utf-8?B?c3BwVUhjQVBaRURueVdncUdIRVA0Kzg2SG1tU1lUci8xTmdYbXBYUnZFNXpq?=
 =?utf-8?B?Z2lPblFhMGM2TUFBRkp4S0lDcGNrWDczaEZWSVJhMGVwZDB6M09yTW5mZEI1?=
 =?utf-8?B?MXZqcjJYYnFZeUo2ZDhyT3BzK3VLaGJCeXdmNVJWNkFWbXhFb1hGT2JDdlZq?=
 =?utf-8?B?d1JUMGs4dWpBSDZrSzNjT3ZMMjJpeVVBaG9Xb0hzc2g0Q21lYlBpZHlSZGJO?=
 =?utf-8?B?cEpKZ1hFeERLdEdpZnBJUXNjTUNhcTJTSlpJSWNXRy8zWitFbjM4dFNrK1Jr?=
 =?utf-8?B?eStUdlNMMG01YWhKZDl6N1hPYW8yZGdxRGplckRTcDk1ZFJOSk8zQWRXcjFv?=
 =?utf-8?B?bmx0MXNRYVF0blhjSEN2eWxWWThxYWNnTnFxRHpZZ0xFK0ZRMVBRdGZHMHJU?=
 =?utf-8?B?MzJRMlJ2VVpZNFJtK2xkZzJhZGN2WUFxbWZjaTQya3lSaFppMDNCZUZLQ2xR?=
 =?utf-8?B?QWRDR1lDR0ZhRlJlS2RiL1ZPNmdzWWhwakY4VktPOG9WZ2pIZ2t4bCtNNlM1?=
 =?utf-8?B?alpVWWZXMmtJM3NWUXMvNmpkSHRCb2w2UGVWNTVyTUxma2t0S1NSZFVkUHVO?=
 =?utf-8?B?bEhRa0J3Z0Y5Y0xNNHlyZEV5aFd2cUx6Z3hnZ1MvclMwN1pSc2daazJFMllq?=
 =?utf-8?B?cDZqOFJzNXdBdE9DOVVVV1VublNUd3ArODJhdzM2bVlTMXFPa0NKTUYwZFRx?=
 =?utf-8?B?Y0ZaRU9IZkg0eTRteDFvMUtvY0pGSW13czBxUElOeUR6U3hIaHEyZ3I4K1Jw?=
 =?utf-8?B?bDJPQ3UrdjA0NjNYUllNVEVQTkxDQmFNU0tYRlFCcVZDNk1EbmUvMW16UG5a?=
 =?utf-8?Q?cPYVKDe5vVWLHvK6bmfhdo4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9963737A692F0D44A4534896ED01453C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40f8cceb-7c84-486d-210f-08dbb61178fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2023 17:30:36.3240 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ha6bys3uZmDczLl5A9WGaCA35yAnRYFAAyQbuG1o3hLTNdiefY6rcsq6mfUBM+Bq0m7ENjs/pZg0hZZEeuw9vXlKHzPwMKNg6d32kauvpdoLHR8d8zuTjYn4XZJfz5U/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6740
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
Cc: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCAyMDIzLTA5LTA5IGF0IDE1OjM4IC0wNzAwLCBUZXJlcyBBbGV4aXMsIEFsYW4gUHJl
dmluIHdyb3RlOg0KPiBVcGRhdGUgdGhlIG1heCBHU0MtZncgcmVzcG9uc2UgdGltZSB0byBtYXRj
aCB1cGRhdGVkIGludGVybmFsDQo+IGZ3IHNwZWNzLiBCZWNhdXNlIHRoaXMgcmVzcG9uc2UgdGlt
ZSBpcyBhbiBTTEEgb24gdGhlIGZpcm13YXJlLA0KPiBub3QgaW5jbHVzaXZlIG9mIGk5MTUtPkd1
Qy0+SFcgaGFuZG9mZiBsYXRlbmN5LCB3aGVuIHN1Ym1pdHRpbmcNCj4gcmVxdWVzdHMgdG8gdGhl
IEdTQyBmdyB2aWEgaW50ZWxfZ3NjX3VjX2hlY2lfY21kX3N1Ym1pdCBoZWxwZXJzLA0KPiBzdGFy
dCB0aGUgY291bnQgYWZ0ZXIgdGhlIHJlcXVlc3QgaGl0cyB0aGUgR1NDIGNvbW1hbmQgc3RyZWFt
ZXIuDQo+IEFsc28sIG1vdmUgR1NDX1JFUExZX0xBVEVOQ1lfTVMgZGVmaW5pdGlvbiBmcm9tIHB4
cCBoZWFkZXIgdG8NCj4gaW50ZWxfZ3NjX3VjX2hlY2lfY21kX3N1Ym1pdC5oIHNpbmNlIGl0cyBm
b3IgYW55IEdTQyBIRUNJIHBhY2tldC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFsYW4gUHJldmlu
IDxhbGFuLnByZXZpbi50ZXJlcy5hbGV4aXNAaW50ZWwuY29tPg0KPiAtLS0NCj4gIC4uLi9pOTE1
L2d0L3VjL2ludGVsX2dzY191Y19oZWNpX2NtZF9zdWJtaXQuYyB8IDIwICsrKysrKysrKysrKysr
KysrLS0NCj4gIC4uLi9pOTE1L2d0L3VjL2ludGVsX2dzY191Y19oZWNpX2NtZF9zdWJtaXQuaCB8
ICA2ICsrKysrKw0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvcHhwL2ludGVsX3B4cF9nc2Njcy5o
ICAgIHwgMTEgKysrKysrLS0tLQ0KPiAgMyBmaWxlcyBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCsp
LCA2IGRlbGV0aW9ucygtKQ0KYWxhbjogc25pcA0KDQoNCj4gaW5kZXggMDlkM2ZiZGFkMDVhLi41
YWU1YzVkOTYwOGIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2lu
dGVsX2dzY191Y19oZWNpX2NtZF9zdWJtaXQuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9ndC91Yy9pbnRlbF9nc2NfdWNfaGVjaV9jbWRfc3VibWl0LmgNCj4gQEAgLTEyLDYgKzEyLDEy
IEBAIHN0cnVjdCBpOTE1X3ZtYTsNCj4gIHN0cnVjdCBpbnRlbF9jb250ZXh0Ow0KPiAgc3RydWN0
IGludGVsX2dzY191YzsNCj4gIA0KPiArI2RlZmluZSBHU0NfSEVDSV9SRVBMWV9MQVRFTkNZX01T
IDM1MA0KPiArLyoNCj4gKyAqIE1heCBGVyByZXNwb25zZSB0aW1lIGlzIDM1MG1zLCBidXQgdGhp
cyBzaG91bGQgYmUgY291bnRlZCBmcm9tIHRoZSB0aW1lIHRoZQ0KPiArICogY29tbWFuZCBoYXMg
aGl0IHRoZSBHU0MtQ1MgaGFyZHdhcmUsIG5vdCB0aGUgcHJlY2VkaW5nIGhhbmRvZmYgdG8gR3VD
IENUQi4NCj4gKyAqLw0KYWxhbjogY29udGludWUgdG8gZmFjZSB0aW1lb3V0IGlzc3VlcyAtIHNv
IGluY3JlYXNpbmcgdGhpcyB0byB+NTAwIHRvIGFic29yYiBvdGhlciBody9zdyBzeXN0ZW0gbGF0
ZW5jaWVzLg0KdGhpcyBhbHNvIG1hdGNoZXMgd2hhdCB0aGUgZ3NjLXByb3h5IGNvZGUgd2FzIGRv
aW5nIC0gc28gaSBjb3VsZCB1c2UgdGhlIHNhbWUgbWFjcm8gZm9yIHRoYXQgb3RoZXIgY29kZSBw
YXRoLg0KDQo=
