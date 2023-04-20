Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B026E9BE6
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 20:49:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74AB910E596;
	Thu, 20 Apr 2023 18:49:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A191A10E517;
 Thu, 20 Apr 2023 18:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682016565; x=1713552565;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=J66lRauiV5hACJGqb6Vn2WZYcPyMHngXMygfBesQBoQ=;
 b=MF+AXF438S+pZP7zs8tVy9GFvxc7kMFlsrHow/JUC5JcejDrv0K0OhzB
 FVUsIkEzmO/bjbVsGRbP5csVA7l4cobETfZ3IYzzlquInjp7L+SHyfVAh
 95BPW0JAZw7FsDo8pAXKZZqRCD43u2ZkQXYdyGgw5P+goYRJw+RAN/nfY
 wwplMp0bHHFTf6d08VmLjltY9RuO6Od6KAMDZ8KKzQ8N1HWud/w5fdLZL
 dbERoEog+dhT2p5V/n+I3tQmKb06YhS6jmhosJoQ0AZDtaR9a5oztyw/9
 eKfE1S5sFBgn55MfKSjmQ97S3d5aTyW/AUIRPffR86fOS1A812pEoJR3n w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="326150793"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; d="scan'208";a="326150793"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 11:49:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="781330594"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; d="scan'208";a="781330594"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP; 20 Apr 2023 11:49:23 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 20 Apr 2023 11:49:23 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 20 Apr 2023 11:49:23 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 20 Apr 2023 11:49:23 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 20 Apr 2023 11:49:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b5FoBUXoiCS32Qb0q5O4btTWrsz4A9i0WgX4QrGuMC5prwJN1O1YdqE4HImOJDSUEjqKRsMwstQffmL74KpH6NygGGCQGUy26F28iM2uhmxXlCtVrapRHFJSkQG+EXh0JqlvD6i7H4ywZIo7AvVH0ACJNd8Gb7K39ufgVIbbUcsXVGgWo5FdfSjjV8XWPlDLJJMvtJonxpWY21SPdrjkDmxGoLPxl9H3pG5Grus3Qdd3waBk9uQoCts5hPDBNywYLswdnEyFdXGAqNYq4ggXasA9ewyUB01dZYka8Nkkz944NhuXxXIyBVnWE97lNxTkHjEOLYHOoLHEl6+oX4KFtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J66lRauiV5hACJGqb6Vn2WZYcPyMHngXMygfBesQBoQ=;
 b=f9zKeQdwES0Eej73xNoQ9pXVtVFW0hbJMCupk2lxI8ZGt8XtLjy3n3Bb9u3MnuCUiq59lmNCOsH5eQtrzk35QpCOF7BeutXsc+kwtBwg4++BMwMuIq9i/aq/EbBxH0NyKBJqpfHiUYxeiJUizkdrlPdkkY+iPlayPyzZcAc8UuFdtNg3kQoMI/rXZSR4UgV7XNTUUFUbDw2CWKsHvk3SWt15UY28gHBBs0N80gRhZbes8x6oHTRVVNxYjq5DB6hVW38lUYM1NWtvaiFGPAz4pAvzOZzqXHoVF/YYJXjFiXFMT1BwDXlFN3D93oJyO8DiQ/R01JJ4r8nAJulyqYxg9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 PH7PR11MB6953.namprd11.prod.outlook.com (2603:10b6:510:204::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.22; Thu, 20 Apr 2023 18:49:21 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3%5]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 18:49:21 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 4/4] drm/i915/gsc: add support for GSC proxy interrupt
Thread-Topic: [PATCH 4/4] drm/i915/gsc: add support for GSC proxy interrupt
Thread-Index: AQHZYl+KP3is+l5OyE2WmbED0vtIra80rOAA
Date: Thu, 20 Apr 2023 18:49:20 +0000
Message-ID: <ace7fa99ea2a38f605a3fe514ec39b372537a9a9.camel@intel.com>
References: <20230329165658.2686549-1-daniele.ceraolospurio@intel.com>
 <20230329165658.2686549-5-daniele.ceraolospurio@intel.com>
In-Reply-To: <20230329165658.2686549-5-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|PH7PR11MB6953:EE_
x-ms-office365-filtering-correlation-id: 5f1d4d47-ab12-4427-7b72-08db41cff3f6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: A2R6ma8ug3tw1zDSojyk+cvZiVGX9VgxuWqTthcyKI2e60HI58tleS39Ktt3pvD62gzAE2J7x9RCAXlXIlK3gpR0RbyMI2xMnvmenqvrevWpmYERLZERBliCnjpLtlm5tiEfenfTTlFl2kwTEVdZfaMk/VF152+U62WaT3zYcWzp5TcIVYbRDYglKgBTnniko3ozzfmJVZl9ifPtIp6WYZmczC+00wGhLHiY1YqaFT3GOlPJnTw1jAZdyqsw4DZOPwaLux6Fe2l7OtkJxkJ4JYo+eQDqAdVp8mOrvj2+pD9ZnuxxVN0q9rmW63Dk341fKRVv1miPEs7+8/G62+OsnkAqqrjugpH1cfJsqJQEBPWlslU5Cxm/wwqfE0C4CVj4/pNM867HPGQbHQGBmLw45BZNxojiI4Eb4mo5XGcupTqvStPrw6RDkesJlKJNkvfoOBmp/sdGQsyC+odp57fX2J+KCSlxPED2aPsGi2QyrQjVqbGvqg7RSqhig/2waRzHewkaB+Z/i6tm/+IQxlaUgieGNVHLq3nUmrhvYvjcsAOjgLH1mdUHcqkQpfHkGkwA/ur3ZNRFq2Mw4Kgzga5ZfQOrh+aGdfaoMZehDTpGu0ZREB1/8CFlGXSgsKEMf6c/
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(39860400002)(396003)(366004)(136003)(451199021)(36756003)(38100700002)(2906002)(38070700005)(8936002)(41300700001)(8676002)(5660300002)(316002)(86362001)(66556008)(66946007)(76116006)(66446008)(66476007)(64756008)(122000001)(82960400001)(4326008)(91956017)(83380400001)(2616005)(6506007)(186003)(6512007)(110136005)(26005)(54906003)(478600001)(6486002)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TFhuU3YxN0ZQdDJjcGhrSnVCN3NGNjRzQTVVL1pDc21RdDFPNXV6dDdLTlZI?=
 =?utf-8?B?RWF2TzdXeXR0QldYLytuRk01OU8zNUxIeXdpemtIa0ErZjZoYi9QZU1ocnRV?=
 =?utf-8?B?Y05SMGY2VVBEcmlBcUdUaUY5dmtoQWRLQ3lWUU9rcGNUVnhLYW44a1VCaC80?=
 =?utf-8?B?THV0WHJXaVcwcU00QWYvVzJuUStIR1pCaEw2S3QraTRNbE1wa1ZGMk01bHZT?=
 =?utf-8?B?VmEyaGIzalhqajdoOUlMOVZxRE9oa0lCeWxZcVA5cm1LY1R4bjRHT2hxSGpM?=
 =?utf-8?B?eTlFWUNNTGo3b3V3VUxtRTFIKzh6eVVXTWpBdzVUcHNRSUVKdUFZQTAyMXJu?=
 =?utf-8?B?RGZuMWJaeWI3blJyWk1weUU0Q3M3OFdBU1EwTmF4czE1cm5ub296U3JwZVRC?=
 =?utf-8?B?M2haTXJPaWFYSWNNelQ4aS9TMTBNSVUvSHdFd1k1aE9IL2JhU3dJVHUvcGY0?=
 =?utf-8?B?RDBHTDliSUJuUjdlWkVBVm1ja2xwL2RYK1NjWWtQYm5lT3VoMDV3Y1pUdEJR?=
 =?utf-8?B?cTVLaFc0bUYya2xOR3JVSThNcDJrQ1VZWDgwMHRPb3NzcXhHeGZPZ2xta2FX?=
 =?utf-8?B?MWNvVUdLUjduY21FUWVOTkVYcG5tbVBudGMwWHF2WTlkeFRRTmpWMmZIdVE5?=
 =?utf-8?B?MXV5bDFJMmVBQk5TWlhvU3duZ2ViVmIvTzVieWlVZEZRd25SWmxVRWZMSzdW?=
 =?utf-8?B?UnVJaFBudGFOZGNackRUTFRvTGtwK0dvMzdtQXpwN0svNExYYnVkSEk5VDZs?=
 =?utf-8?B?aHlva2dqZDFaQlJ2RlpJMFJCUzNJeEpYeC8rRGNHME45LytoTUdmTU5RWFJR?=
 =?utf-8?B?T1lCU2pUcFZPNE83V0lTeXd1V2xtb0doV2hBRGE5U2NLT2x5dHlkOWFxS01a?=
 =?utf-8?B?NERUYUlhaGJUZUpKWkY2ZTJyQ1BlTC9EZ3VDaVdGN25LVUJYVXd3YUhVVDBr?=
 =?utf-8?B?QWdKcDQ2dmNZdFF6bk5YZkhRQW82K2E4Z2YyMXpINm05MERqSlhjQVRCM3dE?=
 =?utf-8?B?QXptNlBib0E5ajRjeDBiRjVVanBNSVA0THJwSHJXYW9WYlZ2UU1YaHQ1c1JG?=
 =?utf-8?B?bCswYmVyN1NTVmd4RmprZjMrTlZaL01JZWpBWWR0ZkJrdUR0UDNpM2thWTZX?=
 =?utf-8?B?N0RZemlQeGRHS0d1bFRxc1g2VkFyZDZKYkFKa3J1KzNwV1ZBY2psUyt3UnN1?=
 =?utf-8?B?aTcvWUt4YS9HTFZhei9JLytMRGh5SkxhdXViRk9Wa2thdDFROXpjRVN5TE1B?=
 =?utf-8?B?akVXMVM3SGU0ODVPUnRXOWFyMUVIR2RNZzB6OHdscy8wZVRkbWt2d0pEZEFi?=
 =?utf-8?B?RTFuYWVDS2RaSFJMYXdVNVlEczJwVTVWWXlDa2JBc1V2L29PZVhaTG9wUWQw?=
 =?utf-8?B?OUZaSmZmMHJUZ2xKWlBPSUF5VXFsdCtzcFZWSHFITHdOUnBjVHU4ekEwbDBq?=
 =?utf-8?B?SGpZcmIxNnR3ZmVWSnhJNEJRUG1OVGx6ZGVXUjRndmVBZmtJajNWRE5pc0pF?=
 =?utf-8?B?VGhZL1c5QTBGUmZrNzMralBVUWlCNndZaml3ZU1RNFJvVUt4V0NhVWlTbnlP?=
 =?utf-8?B?SnU3UHEzVW8vaDNxZy9JT3ZEQjd0Wm1Lclc2YndGZU1QT002MWpwT09UckNM?=
 =?utf-8?B?OEcxY3FuZ3hQREZNdUZMQ08wZXR4dEhsZWZXMW1RSlJXZHB4aG9hSmp5YnFy?=
 =?utf-8?B?QkNkUWVjeFg3SlIvd1lSeWNSUjVmN1VvbGNsaHZnWWtoZFJiQTk1OWd2d1Za?=
 =?utf-8?B?MklJc0hFRHVaUHhKdmdpRUNFKzNhRUUwZk5lS1hPYVUxK2h0UjZ5UjJqTUZF?=
 =?utf-8?B?MGpGVHNjU1Q5cE5CUEpFUDJsU1BETW4xT0I5UXFPaFB4cTdtSnYvQXlmc3hB?=
 =?utf-8?B?QUhvdTF0dUNuTnZzSWFxYUd6ajlrVFZBbXhld1ZwWHEzRURMYVhaOStDYTd1?=
 =?utf-8?B?eGw4ZWg3bmN1cFRGOEpkWHlPK0JGVDVzTVpWQlBWQjVkU2NlcWp4ODdOQmNi?=
 =?utf-8?B?dWZIc29zbCtzUEtXVktuM2I3UDVxcDcwNDg1cTRyeDRRSlFlSko1MUNHamY0?=
 =?utf-8?B?dkxvWXJlVjhseEZBWjR6RTJ1RXZCT0tTTVV6WWdXeTdrRkdtMWJRUkpUd1la?=
 =?utf-8?B?RVBKV3djVndvbHVvWHNTT3ZuYUFzQmE2VjZaclF5cjVWVFk1eGNqd3RhN0hq?=
 =?utf-8?Q?Xbh6VhZGVeRfVaZk8HoWsRw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6659CD106C60F04B9E280AF161791050@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f1d4d47-ab12-4427-7b72-08db41cff3f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2023 18:49:20.9851 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 43Xx2lkCltPrdf98knvPsdMSGPiIOXH8sWnhhy9OGdnPYfHUP9Q8U+K+vb25FqK4lMbf51amLQe8AhR8pQPNqq87kHY9pYzw9SBcK2wxxe9OUz2yo22roLIbckjp4JCs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6953
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
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "Kandpal,
 Suraj" <suraj.kandpal@intel.com>, "Usyskin,
 Alexander" <alexander.usyskin@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIzLTAzLTI5IGF0IDA5OjU2IC0wNzAwLCBDZXJhb2xvIFNwdXJpbywgRGFuaWVs
ZSB3cm90ZToNCj4gVGhlIEdTQyBub3RpZmllcyB1cyBvZiBhIHByb3h5IHJlcXVlc3QgdmlhIHRo
ZSBIRUNJMiBpbnRlcnJ1cHQuIFRoZQ0KDQphbGFuOnNuaXANCg0KPiBAQCAtMjU2LDYgKzI2Miw3
IEBAIHZvaWQgZ2VuMTFfZ3RfaXJxX3Bvc3RpbnN0YWxsKHN0cnVjdCBpbnRlbF9ndCAqZ3QpDQo+
ICAJdTMyIGlycXMgPSBHVF9SRU5ERVJfVVNFUl9JTlRFUlJVUFQ7DQo+ICAJdTMyIGd1Y19tYXNr
ID0gaW50ZWxfdWNfd2FudHNfZ3VjKCZndC0+dWMpID8gR1VDX0lOVFJfR1VDMkhPU1QgOiAwOw0K
PiAgCXUzMiBnc2NfbWFzayA9IDA7DQo+ICsJdTMyIGhlY2lfbWFzayA9IDA7DQphbGFuOiBuaXQ6
IHNob3VsZCB3ZSBjYWxsIHRoaXMgaGVjaTJfbWFzayAtIHVuaXF1ZWx5IGlkZW50aWZpYWJsZSBm
cm9tIGxlZ2FjeS4NCg0KDQphbGFuOnNuaXANCg0KPiAtCWVsc2UgaWYgKEhBU19IRUNJX0dTQyhn
dC0+aTkxNSkpDQo+ICsJCWhlY2lfbWFzayA9IEdTQ19JUlFfSU5URigxKTsgLyogSEVDSTIgSVJR
IGZvciBTVyBQcm94eSovDQphbGFuOiBkb2VzIHRoaXMgR1NDX0lSUV9JTlRGIG1hY3JvIHN0aWxs
IG1ha2Ugc2Vuc2UgZm9yIHRoaXMgbmV3ZXIgcGxhdGZvcm1zIHdpdGggR1NDLUNTIC8gSEVDSTI/
DQppIGRvbnQgdGhpbmsgaSBzZWUgb3RoZXIgYml0IGRlZmluaXRpb25zIGZvciB0aGlzIG1hc2sg
cmVnaXN0ZXIsIHNvIG1pZ2h0IGVsc2Ugd2VsbCBqdXN0IGRlZmluZSBpdCBhcyBCSVQxND8NCg0K
YWxhbjpzbmlwDQoNCg0KDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9p
bnRlbF9ndF9yZWdzLmggYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9ndF9yZWdzLmgN
Cj4gaW5kZXggNGFlY2I1YTdiNjMxLi5kYTExY2U1Y2E5OWUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2d0X3JlZ3MuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9ndC9pbnRlbF9ndF9yZWdzLmgNCj4gQEAgLTE1NzcsNiArMTU3Nyw3IEBADQo+ICAN
Cj4gICNkZWZpbmUgR0VOMTFfR1RfSU5UUl9EVyh4KQkJCV9NTUlPKDB4MTkwMDE4ICsgKCh4KSAq
IDQpKQ0KPiAgI2RlZmluZSAgIEdFTjExX0NTTUUJCQkJKDMxKQ0KPiArI2RlZmluZSAgIEdFTjEy
X0hFQ0lfMgkJCQkoMzApDQphbGFuOiBJIGRvbnQgc2VlIHRoaXMgYmVpbmcgdXNlZCBhbnl3aGVy
ZSAtIHNob3VsZCByZW1vdmUgdGhpcy4NCg0KPiArI2RlZmluZSBHRU4xMV9IRUNJMl9SU1ZEX0lO
VFJfTUFTSwkJX01NSU8oMHgxOTAwZTQpDQphbGFuOiBHRU4xMT8gZG9uJ3QgeW91IG1lYW4gR0VO
MTI/DQoNCg0KDQoNCg0KPiArdm9pZCBpbnRlbF9nc2NfcHJveHlfaXJxX2hhbmRsZXIoc3RydWN0
IGludGVsX2dzY191YyAqZ3NjLCB1MzIgaWlyKQ0KPiArew0KPiArCXN0cnVjdCBpbnRlbF9ndCAq
Z3QgPSBnc2NfdWNfdG9fZ3QoZ3NjKTsNCj4gKw0KPiArCWlmICh1bmxpa2VseSghaWlyKSkNCj4g
KwkJcmV0dXJuOw0KPiArDQo+ICsJbG9ja2RlcF9hc3NlcnRfaGVsZChndC0+aXJxX2xvY2spOw0K
PiArDQo+ICsJaWYgKCFnc2MtPnByb3h5LmNvbXBvbmVudCkgew0KPiArCQlndF9lcnIoZ3QsICJH
U0MgcHJveHkgaXJxIHJlY2VpdmVkIHdpdGhvdXQgdGhlIGNvbXBvbmVudCBiZWluZyBib3VuZCFc
biIpOw0KYWxhbjogU28gYWx0aG91Z2ggcHJveHkgaW5pdCBpcyBvbmx5IGEgb25lLXRpbWUgdGhp
bmcgKGV2ZW4gc3Vydml2aW5nIHN1c3BlbmQtcmVzdW1lKSwgd2UNCmtub3cgdGhhdCBwcm94eSBy
dW50aW1lIGlycXMgY291bGQgaGFwcGVuIGFueXRpbWUgKGRlcGVuZGluZyBvbiBvdGhlciBncHUt
c2VjdXJpdHktcmVsYXRlZA0Kc3lzdGVtIGludGVyYWN0aW9ucykuIEhvd2V2ZXIsIHdvdWxkIHRo
ZSBjb21wb25lbnQgZHJpdmVyIGJlIGJvdW5kL3VuYm91bmQgdGhyb3VnaCBhDQpzdXNwZW5kLXJl
c3VtZSBjeWNsZT8gSWYgeWVzLCB0aGVuIHdvdWxkIHRoaXMgY2hlY2sgZmFpbCBpZiBhbiBJUlEg
Zm9yIGEgcHJveHkgcmVxdWVzdA0KY2FtZSB0b28gZWFybHkgYWZ0ZXIgYSByZXN1bWUgY3ljbGUu
IElmIHllcywgdGhlbiBzaG91bGQgd2Ugbm90IGRvIHNvbWV0aGlnbiBoZXJlIHRvIGVuc3VyZSB0
aGF0DQp3aGVuIHRoZSBjb21wb25lbnQgZ2V0cyBib3VuZCBsYXRlciwgd2Uga25vdyB0aGVyZSBp
cyBzb21ldGhpbmcgd2FpdGluZyB0byBiZSBwcm9jZXNzZWQ/DQooaW4gYmluZCwgaWYgcHJveHkt
aW5pdCB3YXMgZG9uZSBiZWZvcmUsIGJ1dCB3ZSBoYXZlIG91dHN0YW5kaW5nIElSUXMsIHRoZW4g
d2UgY2FuIHRyaWdnZXINCnRoZSB3b3JrZXIgZnJvbSB0aGVyZSwgaS5lLiB0aGUgYmluZCBmdW5j
PykNCg0KYWxhbjpzbmlwDQoNCj4gIHN0YXRpYyBpbnQgaTkxNV9nc2NfcHJveHlfY29tcG9uZW50
X2JpbmQoc3RydWN0IGRldmljZSAqaTkxNV9rZGV2LA0KPiAgCQkJCQkgc3RydWN0IGRldmljZSAq
dGVlX2tkZXYsIHZvaWQgKmRhdGEpDQo+ICB7DQo+ICAJc3RydWN0IGRybV9pOTE1X3ByaXZhdGUg
Kmk5MTUgPSBrZGV2X3RvX2k5MTUoaTkxNV9rZGV2KTsNCj4gLQlzdHJ1Y3QgaW50ZWxfZ3NjX3Vj
ICpnc2MgPSAmaTkxNS0+bWVkaWFfZ3QtPnVjLmdzYzsNCj4gKwlzdHJ1Y3QgaW50ZWxfZ3QgKmd0
ID0gaTkxNS0+bWVkaWFfZ3Q7DQo+ICsJc3RydWN0IGludGVsX2dzY191YyAqZ3NjID0gJmd0LT51
Yy5nc2M7DQo+ICsJaW50ZWxfd2FrZXJlZl90IHdha2VyZWY7DQo+ICsNCj4gKwkvKiBlbmFibGUg
SEVDSTIgSVJRcyAqLw0KPiArCXdpdGhfaW50ZWxfcnVudGltZV9wbSgmaTkxNS0+cnVudGltZV9w
bSwgd2FrZXJlZikNCj4gKwkJaW50ZWxfdW5jb3JlX3JtdyhndC0+dW5jb3JlLCBIRUNJX0hfQ1NS
KE1UTF9HU0NfSEVDSTJfQkFTRSksDQo+ICsJCQkJIDAsIEhFQ0lfSF9DU1JfSUUpOw0KYWxhbjog
aSBub3RpY2Ugd2UgZG9uJ3Qgc2VlbSB0byBjYXJlIGFib3V0IHBvdGVudGlhbGx5IHJlLXdyaXRp
bmcgYSAnMScgaW50byByZXNldA0KaWYgaXQgd2FzIG1pZHN0IHJlc2V0IHdoZW4gd2UgcmVhZC4g
U2hvdWxkbid0IHdlIGFsc28gcHJvdGVjdCBhZ2FpbnN0IHRoYXQgaGVyZT8NCg0KYWxhbjpzbmlw
DQoNCg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxfZ3Nj
X3VjLmggYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF9nc2NfdWMuaA0KPiBpbmRl
eCAwMjNiZGVkMTBkZGUuLmEyYTA4MTNiOGE3NiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3QvdWMvaW50ZWxfZ3NjX3VjLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3QvdWMvaW50ZWxfZ3NjX3VjLmgNCj4gQEAgLTIzLDYgKzIzLDkgQEAgc3RydWN0IGludGVs
X2dzY191YyB7DQo+ICAJLyogZm9yIGRlbGF5ZWQgbG9hZCBhbmQgcHJveHkgaGFuZGxpbmcgKi8N
Cj4gIAlzdHJ1Y3Qgd29ya3F1ZXVlX3N0cnVjdCAqd3E7DQo+ICAJc3RydWN0IHdvcmtfc3RydWN0
IHdvcms7DQo+ICsJdTMyIGdzY193b3JrX2FjdGlvbnM7IC8qIHByb3RlY3RlZCBieSBndC0+aXJx
X2xvY2sgKi8NCj4gKyNkZWZpbmUgR1NDX0FDVElPTl9GV19MT0FEIEJJVCgwKQ0KPiArI2RlZmlu
ZSBHU0NfQUNUSU9OX1NXX1BST1hZIEJJVCgxDQo+IA0KYWxhbjogcGVyaGFwcyBpdHMgdGltZSB0
byBoYXZlIGEgc3Vic3RydWN0IGZvciAicHJveHlfd29ya2VyIiBhbmQgaW5jbHVkZQ0KJ3dxJyBh
bmQgJ3dvcmsnIGluIGFkZGl0aW9uYWwgdG8gYWN0aW9ucz8NCj4gKQ0KPiAgDQo+ICAJc3RydWN0
IHsNCj4gIAkJc3RydWN0IGk5MTVfZ3NjX3Byb3h5X2NvbXBvbmVudCAqY29tcG9uZW50Ow0KDQo=
