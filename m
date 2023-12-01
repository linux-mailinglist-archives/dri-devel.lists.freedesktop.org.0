Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3497FFFE4
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 01:09:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FA8210E784;
	Fri,  1 Dec 2023 00:09:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 695C810E58D;
 Fri,  1 Dec 2023 00:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701389347; x=1732925347;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=OghduMQtZXVh9gVzf5lnagam6o0DI0QzN5ZxPfv3hfY=;
 b=IOUDIgmMP2Gcz4+ENeto677aM1jFksL9NWk1sXqoGyzu7fw6vMcnNmep
 vwxCppPP1rSFsvAOMJO3Yf3TcpWnMUGnsaPyDitrNSa+5wkQLM1yhIW5a
 lyLMPAuykLOrqyKs0I5oci6KWwhwEfs8xNcLU4GHGXbSdvODW00hRI1Jd
 +hwi8gESeD/d3I09q2msxzgHBjkxGLVlKl5iTa7EMvj+Oc9vJhkXH6mNB
 bt/yEqyDNN7JUcSI/PSYmCv/2YAsWU27WT2tnQbB5yEEdBZQAAlgd36pF
 3vJ5hYa8Ki5L5sk5rusFHu8M775WX4bk+4Rj9W3ur+9s4688F3CwmkuCD Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="459907834"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; d="scan'208";a="459907834"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 16:09:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="887417560"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; d="scan'208";a="887417560"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Nov 2023 16:09:06 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 30 Nov 2023 16:09:06 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 30 Nov 2023 16:09:05 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 30 Nov 2023 16:09:05 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 30 Nov 2023 16:09:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cb2Qdy+dI0+l4wCCGnmuK4vfAgMJ0ho74GCLa6GSKhrsJdIVzgLMLepJ7tPdGkpTPXyIwnOUhWdIwRYi9SHgKG1mExdV6K3ZYEqyxJ/Rw30QRuQTyMCsEcGUeNON5L0+P+QamyCAjR8xINopmLWsWGmsJvOHjsgw9R3FLWv4NTp5JYQ/1lmPpGDrVhP+cVtDBRtXnw4rl+X+mxvrb8cFj0kCBiig9s42PVhUFrbFqYROFX30gf+E1Tt8hXQTBEJ6pd+lrq79392GGwFwiOPqiXD9+m16lXqTpmnhP7LSr6u+/f5DAn7l/mQPVAdeRnN2aCc0tF3jWbu1F3bLVHz5Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OghduMQtZXVh9gVzf5lnagam6o0DI0QzN5ZxPfv3hfY=;
 b=ECxZHTJy4mdu6+Pxwd5Mvj8tEqL4UoWuu8sXEi7ANOwTVjJlRQ1hlfR/sXu1rJoTJvZaOe2EwOJllwLj0Zjo5hOpchbbW2Tgv3LGyNXfMqrS0UrsKdaBSnMzzd68+a7UW7Cwf/KK04vUDAhWHuu/TGUic3VqtACtUEubozthvNQ+09WZGS0dbrYkmFf2S3VnqmIrbozQEht5QbFCTH5aI+xfm11x+h2isawm7ImuLG/oa5abUK3YUZ9QYmDaCF0xv6wOEsbGwUHvpzxUUe90y/E+nG5oW171k8lQEF18RAg6gfF7Va8eQl1M6S72KhUPbMQzqHIuW83f6cEiQQXOzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 PH8PR11MB6904.namprd11.prod.outlook.com (2603:10b6:510:227::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.24; Fri, 1 Dec 2023 00:09:03 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::d070:1879:5b04:5f57]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::d070:1879:5b04:5f57%4]) with mapi id 15.20.7046.024; Fri, 1 Dec 2023
 00:09:03 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v7 2/2] drm/i915/guc: Close deregister-context race
 against CT-loss
Thread-Topic: [PATCH v7 2/2] drm/i915/guc: Close deregister-context race
 against CT-loss
Thread-Index: AQHaIyMGCPwXl+IawE6taRBTjJUlpbCTXz0AgAAvqYA=
Date: Fri, 1 Dec 2023 00:09:02 +0000
Message-ID: <79897b361b09274efff9ee010fe9074d66f56bd8.camel@intel.com>
References: <20231130002013.282804-1-alan.previn.teres.alexis@intel.com>
 <20231130002013.282804-3-alan.previn.teres.alexis@intel.com>
 <ZWj8Ig7tzXLHZbSv@intel.com>
In-Reply-To: <ZWj8Ig7tzXLHZbSv@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.50.0-1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|PH8PR11MB6904:EE_
x-ms-office365-filtering-correlation-id: 4bd34282-bc02-4ef9-20c5-08dbf201b9e1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: brM6qbA76AgBVbONgoA+6qjw02qQxhuue8PtE7yZdEjiTZsWV8ky5Elat5BsWMlEK/TPGxidjU2fSsbzsDoeDRnb6RbyZQBl3gaXwvrti1PF/sn2bBekEz5M2CwjJgDBDDgsU9jxZPoaMEI8UIc86dcA3wMT9quGv48aCKYS2vIg/dE7/LZQ1cYMDQ/TOI/I8w5myr+9lpNYMwgZKivvmd+HHeJ9uVBksFCl0lfbX7eVjUUcp+aH8FL/3l48UtNFkBWN0GnfY6CNHfMp4MzoVGNue5Tcj3zIoZlJ+s904KXaV27TXMTojNoF81M6DE9n4obEp5VwtlaKHDm/Eg53Z+OmQgCgFWEEUsFOr0/CpEsNy2weIMj3avjIrNYdmXYAaXgzHSR8JiHzf3sG/M6YbrAi6ltAjO7Kf/yeihrg1xSF2lh68lGLuvPSvdkXF5hhkrjli38opIkwfy7liigRE1d3lIQxX+TgN1NP/GTN1be2e9N28+Q5XvnyRep9e2AnJamUix7fu+cC/QoIkNigez4rcD3gbDIeQcHD3JgvDPvLSYNPYYBAnpGngCWpNgl8BmYpWoueJUE3YqF7lWpQHQ2TuX9Qotxid2hRSCpiALw/wsDZlj52bCV5rog2m3+F
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(136003)(346002)(376002)(396003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(26005)(83380400001)(107886003)(6506007)(2616005)(4326008)(8676002)(8936002)(6512007)(41300700001)(450100002)(4001150100001)(2906002)(6862004)(37006003)(5660300002)(6486002)(478600001)(66556008)(316002)(66946007)(64756008)(91956017)(71200400001)(6636002)(66476007)(66446008)(76116006)(86362001)(122000001)(54906003)(36756003)(82960400001)(38100700002)(38070700009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MlNXNGloV1BVTndTS2ZNdUQ2L2ppUXhBZVFaK04xOXQwdkF3SytoUkNwb1hl?=
 =?utf-8?B?MGxrUU4rdjNZOE91QzNmMGhPZTJxOWJNMzZrVnlSV2YxNVBHWW1JeTU3WXlR?=
 =?utf-8?B?MmNSMEFTRTB3V0JlV3hEL243VjkrVTIxaHY2aThvMGhVTUp5ZFp6Z1VwTjJZ?=
 =?utf-8?B?ZXhMWDVyVGdUOFI3N1JMTXhNMnNsSGhFRVZNd1VURFh1Qml3N1lpaTl5Z2J6?=
 =?utf-8?B?N3prSXYyTTlPWEROY3k5TllhcTVIbGNFWnVhZnhPa09ia1N6ZVE0WEpESVFp?=
 =?utf-8?B?elFqSnh5MkhwNnBKMHpjdFdFbFBHOG1yMUFRNXEwWDVRVW5oUXhXUU43dVVX?=
 =?utf-8?B?UmlwL09uckpqdWJiVFFwOWRDU0haRW01VmFiM0xrRlFBWlhuYTJFQnU0Wm8r?=
 =?utf-8?B?V2JSNDFwUlFka1lpZXZpWTBDOHdEOUorRDhtTFZuK0lUNEZSZit3MEpsTjRn?=
 =?utf-8?B?VVdGT1JLU29kSVplZlYzZGdxd3dIaXhFN0ZlK3l1UEV5Z2RObnh4aWp2cUdJ?=
 =?utf-8?B?cU1RbUZiRXJUS1BFSWg5SUo5QnFBbktoSkptRXYxYk9vNkJ5UzZXcDhKSy82?=
 =?utf-8?B?TTJ2VVM3dTFoejFxWDBEL1ZTTmlTM3hWTFc5RVNVek5kNTBzNWZYU1BXbGZk?=
 =?utf-8?B?eERFMWxEWmYzbGxySndQeFBDbU5MOVZpVkdyZEEzQWlsRE5BWmhldHFqcFA5?=
 =?utf-8?B?Tm1WcEEzRTcxRmNpQmYvT0p1Yk5OdzR1eU1hMTZQMW1SLzdNcTZpTmlCVWpx?=
 =?utf-8?B?eFNQMG56NzFjT3ArcHo2cFZRREdLOTlXcHo1UDJ0Y1ZOeXY1bkR4OVU1MnZG?=
 =?utf-8?B?aWwwZkJuNkZnWS9GTVE4djV4VVJ2RjBTa21RV29mL0xpSjhMZFZ5b2pMWnpk?=
 =?utf-8?B?OGpzTUZkNjdzR2dZNVFxMElpSlVJcmFOQkwzRDhtYUlzM1FvenlQMER0NjBw?=
 =?utf-8?B?TU5Ya2NTR3lzNE5iQmd2YXk3SFB1Vjl3QkFFOWgzZVlBQ0UySVdTQy9ha3lR?=
 =?utf-8?B?SjF4dUExdng2ZzBES2oyenZjTnRhaVlHQVVrZUdWT0Rpdyt2bjBCbHhjb1ds?=
 =?utf-8?B?WDhJdnZHcTdxUyt2L3FPRm1XUXMyM2JUTXdxbithbTVLbFlRNHN5OERBQy9W?=
 =?utf-8?B?UUp1REFLYUtSa0ZhdjVqVldreTBCdTVZQnZnV0pFRzZKVUNVUlA4N1VvalNR?=
 =?utf-8?B?Y1QzRFluK0d3ZXk4enEyMDhWNlFqb2Jxc0MvRmxGWDNXTVhTQkU0akZIMU5x?=
 =?utf-8?B?RVdGZGdpK2x1VTFuNXVqQjBRS2JPZFJkVm4zU05HUDBzRHQ5dTJwb2dKd2pG?=
 =?utf-8?B?MjZNUjdLSkpBVGgyei9Fb0lOMzVqYTZrcVRid0xzMnhsMElYcDhnRkZ1N1BM?=
 =?utf-8?B?blBUL0REMGRSRmpDMzZFOVIwT3ZqbVo2YmI2a1ZBK08yU1FlSVRiaXpQM1dz?=
 =?utf-8?B?Ujl1TmdMbG1Dc1dLbnBFbkdGL25SdjN3cU1McGJmQk94amU5ZnVHWFdETHhZ?=
 =?utf-8?B?b25Ea3VkNE00Z0pHWTVlWVZzZ05VMmRBVG9PU2ZCVElyN3oyMzdzc29xOWph?=
 =?utf-8?B?bVNQdHZydi9iMkFsdG5MaFBia2s1bU55ajl2UjlaTkl3VnRadzFaU3ZQdVpz?=
 =?utf-8?B?NUtOazBqVmVlVHduVm82QlA0TUhmVFJnRjBPV1JRY1lHeXZRNEZjbFg0WWEw?=
 =?utf-8?B?QkNiaWs3SmxlTStEZDRTOXZFR1JTV2ZNYzR5WXFYUzZCWE80ZmNOSmkvK1h6?=
 =?utf-8?B?WjFFK3BLRlJoL010dW9JV1RwRE12SXVnR2tyQVpNdGFpbHhrZ1orNjRQRWM0?=
 =?utf-8?B?cnUwekZNZDBYUGdQVGk2Q3ZHUSttaHYzWjhkbXhQUXdXU0c5VWhGcy9PY3Az?=
 =?utf-8?B?NUxYeCt6cEdRV28yd3dzQjJSWDJ3MUFjZGlET3hKdmg5Uk1PeC91c3drQkRC?=
 =?utf-8?B?a3ZUR3ZSakQ5TWVPc3dNdWdubzNWdHQrUVk5dmV1RnNoeFR2RWE0QzRSKzhW?=
 =?utf-8?B?SGN6M2Q5YzBleXdyZ2hISzVkWnAraXBiYkhqZGlvTXEzTi9tZ1VVVXdFUGFz?=
 =?utf-8?B?STJRZEpsT2Vpa2tQd0hlYjVVQjhkK0IzZEdLN2VSZURVOWZoMkpIRTA0MHQ3?=
 =?utf-8?B?N0l3Y2ZvYVdLdEhnRzZTQktLWmMzNFlTREM1ck9Sc1ZNb3BXaGVpOHNrZlBl?=
 =?utf-8?Q?d+6vnPU6DjbbnBNNITPl+VI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <32F6262F9F6E1341AA9A4D01A9E7F900@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bd34282-bc02-4ef9-20c5-08dbf201b9e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2023 00:09:03.0016 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dzPHBtQsjaurlhiAMjCk3oPEarTiOcWTaPec78h763gyvjjqBjGSB4I8kTlkmx+yG+woCo8EGyE8tfje1Rb7hOIk5I+WmCb5K8ZjoQmxgcTz/QI8ckNwcIXLaayYlMn7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6904
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
Cc: "Ursulin, Tvrtko" <tvrtko.ursulin@intel.com>, "Gupta,
 Anshuman" <anshuman.gupta@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Ceraolo
 Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Jana,
 Mousumi" <mousumi.jana@intel.com>, "Harrison,
 John C" <john.c.harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIzLTExLTMwIGF0IDE2OjE4IC0wNTAwLCBWaXZpLCBSb2RyaWdvIHdyb3RlOg0K
PiBPbiBXZWQsIE5vdiAyOSwgMjAyMyBhdCAwNDoyMDoxM1BNIC0wODAwLCBBbGFuIFByZXZpbiB3
cm90ZToNCmFsYW46c25pcA0KPiA+ICsNCj4gPiAgCWlmICh1bmxpa2VseShkaXNhYmxlZCkpIHsN
Cj4gPiAgCQlyZWxlYXNlX2d1Y19pZChndWMsIGNlKTsNCj4gPiAgCQlfX2d1Y19jb250ZXh0X2Rl
c3Ryb3koY2UpOw0KPiA+IC0JCXJldHVybjsNCj4gPiArCQlyZXR1cm4gMDsNCj4gDQo+IGlzIHN1
Y2Nlc3MgdGhlIHJpZ2h0IHJldHVybiBjYXNlIGhlcmU/DQphbGFuOiB5ZXM6IHdlIG1heSBkaXNj
b3ZlciAiZGlzYWJsZWQgPT0gdHJ1ZSIgaWYgc3VibWlzc2lvbl9kaXNhYmxlZA0KZm91bmQgdGhh
dCBndC1pcy13ZWRnZWQuIEkgZG9udCBiZWxpZXZlIHN1Y2ggYSBjYXNlIHdpbGwgaGFwcGVuIGFz
DQpwYXJ0IG9mIGZsdXNoaW5nIGRlc3Ryb3llZF93b3JrZXJfZnVuYyBkdXJpbmcgc3VzcGVuZCBi
dXQgbWF5IG9jY3VyDQphcyBwYXJ0IG9mIHJlZ3VsYXIgcnVudGltZSBjb250ZXh0IGNsb3Npbmcg
dGhhdCBqdXN0IGhhcHBlbnMgdG8NCmdldCBxdWV1ZWQgaW4gdGhlIG1pZGRsZSBvZiBhIGd0LXJl
c2V0L3dlZGdpbmcgcHJvY2Vzcy4gSW4gc3VjaCBhIGNhc2UsDQp0aGUgcmVzZXQtcHJlcGFyZSBj
b2RlIHdpbGwgc2FuaXRpemUgZXZlcnl0aWhuZyBpbmNsdWRpbmcgY2xlYW5pbmcgdXANCnRoZSBw
ZW5kaW5nLWRlc3RydWN0b2luLWNvbnRleHRzLWxpbmstbGlzdC4gU28gaXRzIGVpdGhlciB3ZSBw
aWNrIGl0DQpmcm9tIGhlcmUgYW5kIGR1bXAgaXQgLi4uIG9yIHJlc2V0IHBpY2tzIGl0IGZpcnN0
IGFuZCBkdW1wcyBpdCB0aGVyZQ0KKHdoZXJlIGJvdGggZHVtcGluZ3Mgb25seSBvY2N1ciBpZiBn
dWMgZ290IGRpc2FibGVkIGZpcnN0KS4NCg0KDQpTdXBwbGVtZW50YWw6IEhvdyByZWd1bGFyIGNv
bnRleHQgY2xlYW51cCBsZWFkcyB0byB0aGUgc2FtZSBwYXRoIC0tPg0KDQppOTE1X3N3X2ZlbmNl
X25vdGlmeSAtPiBlbmdpbmVzX25vdGlmeSAtPiBmcmVlX2VuZ2luZXNfcmN1IC0+DQppbnRlbF9j
b250ZXh0X3B1dCAtPiBrcmVmX3B1dCgmY2UtPnJlZi4uKSAtPiBjZS0+b3BzLT5kZXN0cm95IC0+
DQoNCih3aGVyZSBjZS0+b3BzID0gZW5naW5lLT5jb3BzIGFuZCBlbmdpbmUtPmNvcHMgPSBndWNf
Y29udGV4dF9vcHMpDQoqYW5kLCBndWNfY29udGV4dF9vcHMtPmRlc3Ryb3kgPT0gZ3VjX2NvbnRl
eHRfZGVzdHJveSBzbyAtPg0KDQpjZS0+b3BzLT5kZXN0cm95IC0+IGd1Y19jb250ZXh0X2Rlc3Ry
b3kgLT4NCnF1ZXVlX3dvcmsoLi4mZ3VjLT5zdWJtaXNzaW9uX3N0YXRlLmRlc3Ryb3llZF93b3Jr
ZXIpOw0KLT4gW2V2ZW50dWFsbHldIC0+IHRoZSBzYW1lIGd1Y19scmNfdW5waW4gYWJvdmUNCg0K
SG93ZXZlciB3aXRoIGFkZGl0aW9uYWwgImlmICghaW50ZWxfZ3VjX2lzX3JlYWR5KGd1YykpIiBp
biBkZXN0cm95ZWRfd29ya2VyX2Z1bmMNCmFzIHBhcnQgb2YgdGhpcyBwYXRjaCwgaGl0dGluZyB0
aGlzICJkaXNhYmxlZD09dHJ1ZSIgY2FzZSB3aWxsIGJlIGV2ZW4gbGVzcyBsaWtlbHkuDQpBcyBm
YXIgYXMgaSBjYW4gdGVsbCwgaXRzIG9ubHkgaWYgd2Ugc3RhcnRlZCByZXNldHRpbmcgLyB3ZWRn
aW5nIHJpZ2h0IGFmdGVyIHRoaXMNCnF1ZXVlZCB3b3JrZXIgZ290IHN0YXJ0ZWQuIChpIHJhbiBv
dXQgb2YgdGltZSB0byBjaGVjayBpZiByZXNldCBjYW4gZXZlciBvY2N1cg0KZnJvbSB3aXRoaW4g
dGhlIHNhbWUgc3lzdGVtX3VuYm91bmRfd3EgYnV0IHRoZW4gaSByZWNhbGwgd2UgYWxzbyBoYXZl
IENJIHVzaW5nDQpkZWJ1Z2ZzIHRvIGZvcmNlIHdlZGdpbmcgZm9yIHNlbGVjdCAoL2FsbD8pIGln
dCB0ZXN0cykgc28gaSBzdXNwZWN0IGl0IGNhbiBzdGlsbA0KaGFwcGVuIGluIHBhcmFsbGVsLiBO
T1RFOiB0aGUgb3JpZ2luYWwgY2hlY2tpbmcgb2YgdGhlICJpcyBkaXNhYmxlZCIgaXMgbm90IG5l
dw0KY29kZSAtIGl0cyB0aGUgb3JpZ2luYWwgY29kZS4NCg0KLi4uYWxhbg0KDQpQLlMuLSBvaCBt
YW4sIHRoYXQgdG9vayBhIGxvdCBvZiBjb2RlIHRyYWNpbmcgYXMgaSBjYW4ndCByZW1lbWJlciB0
aGVzZSBwYXRocyBieSBoZWFydC4NCg0K
