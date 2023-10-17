Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B505C7CBD44
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 10:22:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC4EA10E283;
	Tue, 17 Oct 2023 08:22:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62E9310E06E;
 Tue, 17 Oct 2023 08:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697530931; x=1729066931;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rcmlfamUDmdu1J7wEQdCeWvaTa27qRWr+/uvB/QHlg0=;
 b=glCKJHOFcE0RaM+47EwZe1CKfaJMSNsZV4By3c4bLqLXoq3+v11T399j
 YI5fSc7aB2R4vUrlbOFYFkF9q1hLFsBWAF3pxvm/gWAJ8H40UAdAZHpcA
 3HqnwkL5Y5a4xKYa9iM9F/V5CXU7xoNR7k1ws0AHASOpp77f8ZNTtRXhk
 XYZv1elbTawmQJMEAiUKmu9DEqQgTvvbnZtsJba1tOwCEDXNJ025QELAp
 k+O3yIcpsDIuyHgGqPZtlRUi1E/i4IyIQEug9G14V9T5M4FhUZsbBa4SH
 X2r0/PRrko7G7hiMaioDspl0FonY3hJLboMZ/J9MCxYBkxn/lsNe4mkdF A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="389597866"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; d="scan'208";a="389597866"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 01:22:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="785398781"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; d="scan'208";a="785398781"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Oct 2023 01:22:10 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 17 Oct 2023 01:22:10 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 17 Oct 2023 01:22:09 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 17 Oct 2023 01:22:09 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 17 Oct 2023 01:22:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ArGPJY+EEb64wcHmf7hxwF7EA40ShIZNg+1wkFtxBC2OcttXqhTvl5IrmdFkiRSeORgDArPFXbeafdmROxOoViVdV6wZLQmJ/FXCiy76SpHMNjdcIAJ+dazsZMuHYv20WSQbasXZvp+oUvz+D+4w8bkxANQg2WgzwaWsjuoEfA8JY/R3ag2wlUt3G+KsMw8WtwYqycB5EGFWEZjaCGTtmHcodBKLn7t30CxGwBxrLWVVaCSfqUOL/oJlXfCRSQwPvKOHM8I/Ctvi8bW+hgwk8uAlIa7+vprTeS4hPfw4s5N7QdNDopicTWYRXYxr37vQkeAAlr3F0T2o5UjZ/T5gcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rcmlfamUDmdu1J7wEQdCeWvaTa27qRWr+/uvB/QHlg0=;
 b=inX1qEsRl7ZDuS1i7pZDwFZH5jMQKQKg9XpmDtjLkC/UFtENgUpq1fW7bamUzi7cClIjQKnvl2xa+gjcKwODZN1zwCIBfrOAFwYWlMbKYX4KN6k1nSBwkbPyLxifLk+nYSgOjyuswtUbPNxKFYmupwzbGDD7eg0CyylAQ+5mPiooidZkft7KAIuiL+/+VIEibyJTslM3pLdKMTHdtSI8S2mygWAtwYqumAyU+u0NkVM25o/oObkTE54stVuw5zqBeZ8eSfEGvoWPfk+mU6C+BSWzeviDwCzb8fXlJ+W6TYdsaKBLHsyNy3oCM4ZO5h2DF+9tBfNenvq/hdrEB/F+uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by CH3PR11MB7769.namprd11.prod.outlook.com (2603:10b6:610:123::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Tue, 17 Oct
 2023 08:22:07 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::2d10:17dd:ff9c:7f59]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::2d10:17dd:ff9c:7f59%7]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 08:22:07 +0000
From: "Manna, Animesh" <animesh.manna@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v7 4/6] drm/i915/panelreplay: Enable panel replay dpcd
 initialization for DP
Thread-Topic: [PATCH v7 4/6] drm/i915/panelreplay: Enable panel replay dpcd
 initialization for DP
Thread-Index: AQHZ/DUgnzk4d+qpLkauOKbpER0CsbBL2WgAgAHR0SA=
Date: Tue, 17 Oct 2023 08:22:07 +0000
Message-ID: <BL1PR11MB59790B8105EF15D5A2221D5EF9D6A@BL1PR11MB5979.namprd11.prod.outlook.com>
References: <20231011110936.1851563-1-animesh.manna@intel.com>
 <20231011110936.1851563-5-animesh.manna@intel.com>
 <DM6PR11MB3177BB6B336FA437EEB4EF3CBAD7A@DM6PR11MB3177.namprd11.prod.outlook.com>
In-Reply-To: <DM6PR11MB3177BB6B336FA437EEB4EF3CBAD7A@DM6PR11MB3177.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5979:EE_|CH3PR11MB7769:EE_
x-ms-office365-filtering-correlation-id: e38c3b7d-69d4-4579-6fdc-08dbceea26e7
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UqM7ANC/6mjLNO/HTsfbaxIWnAf2hGRiEM+CenlxbTD/QS7LtAIe25cSjkTwv3VldH+wcVYfdVjpiTfHtdkfrYLXjUDvN/B8mDsL+JLnK6pHf9aB3LX4Q0AC2DR3AYTomG07vNltj9u3IDndvFrhiK5mci83WzW4fPTA5K0YxLEjYjs1jdzf4F2wG1OXOC3fp0d8fOEfEZa9WzXP8WOlKfuGDjpIlCmgBUXb45u2nxwsXsZdDmQOmbopc2V4i+Kwkz8c6iv/5nUimjf8yacINX3iDZ7YgUGls7MuKKDShnXgEvLPIl/bSznEyJIO1sqyw9pD5ZBR0RTvG4xz9klzatlRvlsW8AXb4yiY3o/FdhnBpHd9lbdRIGL3gn8XvGEoR5NPC0TTuGi01OHWCTwz5GFmYv2Lp/yq5MASCD9o/j0V7c/IEK1we0/ZY+LaSbCH9oiDfcMxAUm86N5vacWeFSb+9KUCtBD62i3BECptbS+Dka1QqaQC3pUGsGiF6KnOeGLCoN5wBl6XwHoruG8TXn/+jrtFO8/SeHhDOUYKf2U4z2bUvfL9gLQQ0wbIEQCmGaNisHrvwz+71KDhVOH3x3GHwC17j7GteEd3Yg0/eUYiBB/BatTRPZ9FS8xk4am6
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(376002)(346002)(39860400002)(396003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(55016003)(53546011)(122000001)(82960400001)(38070700005)(38100700002)(83380400001)(26005)(7696005)(6506007)(2906002)(64756008)(54906003)(66476007)(66446008)(316002)(76116006)(478600001)(66946007)(107886003)(66556008)(110136005)(450100002)(86362001)(33656002)(41300700001)(71200400001)(8936002)(9686003)(8676002)(52536014)(4326008)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eFY2bGRiUTJabXRycENsMnpLM01CODB3dVNvV2Rhcmt1ZjdVcVRJNzZKeith?=
 =?utf-8?B?dUczeDJ1QmFDNmloZnR4bXZXeTNGNStueXc2cGtvTGZYTkgzT0RmWjE0QVdx?=
 =?utf-8?B?NEwrMFd5V0ExSFZlR1kxN291czk2Y0h6dUxXbFd3cUJpdlBEam11MlNOMUJC?=
 =?utf-8?B?SXJnSURaazhhVzF0VzF1aGdXa1FMV1pJMmJncHYvMnhXZXZqT21HNm4vSjN0?=
 =?utf-8?B?bjU5ckZNTkVnT0V1MHFTbHJDL3RFb3lON3lSNjJkK3EwTmlSbkE2em1tUndF?=
 =?utf-8?B?UVZoa045YWZLOXVyZ2VIRUtjb2VqcjVtRCtnUkNtOURYUTV3Qm9mYTlscXVG?=
 =?utf-8?B?dlRMVjFEa3V0Z0UzbGJMbWE0RHhOaUdjQmI4UGZpN2p0Nmxjc2g3eEd5eVRZ?=
 =?utf-8?B?eUJKay8wWXpvUktEUWZ6OWNqa01nd1FZSlZFd3ZFNzlMajBJMm9Rc2hjMGFt?=
 =?utf-8?B?c1dVZVFGZmVUMkRqTzAweFI2TFZnenZ3NFQ1UTFSbVd5Y053UXNNL0h5UDNk?=
 =?utf-8?B?cGpRQzZkUm1yblkxL3Q0TkI1ZHU3Syt3STZ1SytObnhYbjgxQ2ZhYTA5SG5y?=
 =?utf-8?B?dkgyenBaWVE0QXJRQ0ZXVkw3TFl5STlLVG1DclphVHExZ3RnMHBLQmtwc0FS?=
 =?utf-8?B?cGpBck0wT081QkdZdFZkdDZzRUcwQkVMVlR5Y2pNcVRUMTFHOHlFVFNKa25Z?=
 =?utf-8?B?bzFYRm8yRnFwM3pLSmNpTStnKzlUWlgxYmc1SUNhdEU4VkFtNnplTHVXMnpH?=
 =?utf-8?B?SFEvK2ljNVVacnFWQitDRndTV2FRZjFGS2o5dW9KVzlnTGlxclhzdDZseE9l?=
 =?utf-8?B?Z05haFpuUnFLc1VNRzN6ZjlJV1NMZjZoM2s3cXZER2w3cjN1UFh2WWs1Wklp?=
 =?utf-8?B?bThTSFgxTkVhZi9vM0kyL2x0TWNpeFFNSXpCNHlNdXJnekFac1RDOUJCYTZ5?=
 =?utf-8?B?QTNDV3ppZk9GZnJmVjNhMnJIK1JGZzNUcjdzbERvT1NTWmVxN2owclB4NDVS?=
 =?utf-8?B?ZlMyS1pNU1ZXcTVRMG5QUXc5ZFlKeWlKeGJyWllYVDZ5RXllSzRPM25IdDk5?=
 =?utf-8?B?NFE2czlNSmF2ek9aRDROMG9KMlArWWc0VE1tYi9vOXo4TW5YWk5mWXhDOVhn?=
 =?utf-8?B?bThTR2tyR3VzWDNsK0RVVlZzNmN6ZHIzckZicVdEb21hWnRleUMrTUp0bkhm?=
 =?utf-8?B?d0YwUGZiL3luY2l4R2hsQzBOL001aUFkSlk5RWE0RWdSYUdnWS82OTJ3UjVO?=
 =?utf-8?B?VnhFaE9QMlg4cUNmT2lVTG40YzhNN0ZYVlNSTWlJS0g4RWJicjhMeE01cUpr?=
 =?utf-8?B?NnlhSEpyOU9ESGo1NmZOaGJJV3YwSUVyVWc5ZUpvQ3pHOFN5eXlPSTVwVXF5?=
 =?utf-8?B?YWFFbnNvcFFERG5pems2aThzaFlqTFN1Q2pxaDU2cktKQ0lrSGxxc0NlbnlG?=
 =?utf-8?B?aFB3elFhazA1MFdsdm9WQVplbGFla1J0VlV5NWQ5V1pTZ1M1NjhWWEJFVVJi?=
 =?utf-8?B?M0Z5TUVhNzllKzhjdThmL1VKbzFsOTJONER6aGJ1ZmQxMUFmUktjNVV5dWda?=
 =?utf-8?B?QTYrUEQyOTVSUkFDLzdtMVBpK3htSEpYZk8rem93QTN0VFY3Z0g2TlRTMmJY?=
 =?utf-8?B?UFBaNW5UWVdBdWVOcjJXdEhQWHNPRGxWemZEZWl3RTgxc2xHaWk5dk1RbjdI?=
 =?utf-8?B?NThoLzVWSGNyT3AxWEVpUjVYekIwdnlJamFKYmRhRENwRXpwbnVVZkFzRW9Y?=
 =?utf-8?B?eXBzTi92amJkN1ZrZVVub3RLV29wL1hLTmZKZFQ2UjhKUjQ5ZlJYTTZHRTU2?=
 =?utf-8?B?L3dITzFvYW9uVGxoWG1rVElmeDBLTmE1bTMyNmxYWFNWYW9yaHNMSFpVeG9I?=
 =?utf-8?B?dU13TWFodklTaU5RdHRLVzhoeFVobG91TzJmTTRpbVRHd0VNLzl3UUJQYThm?=
 =?utf-8?B?Ni9kNTdRNFZZcVl5bW9LMi82VGRpMUd6TU84RDZuV3VtNTRuZnpYWEVpbEZS?=
 =?utf-8?B?Ky90NzlFRDdkMnhaZG5oSmhuc2ZPcmlWdXRGOVlrcURSeDIzMENBMTFHVHNF?=
 =?utf-8?B?VUIzYlJVdVdLVkhqVHhwSi9xTURjd2I0c3RsdWxSY0ZRcDQxalNUNGlGcWdq?=
 =?utf-8?Q?CdKrZcnTGlHf4u6i7McSOCK+H?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e38c3b7d-69d4-4579-6fdc-08dbceea26e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2023 08:22:07.3111 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oXoImejsgfFxpWoDWIsY5s/whOkobxSvANX7veKY08Exjts39E/qUhBcCVRwCRc3CJUvuutrpGhkYJuo5igB+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7769
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
Cc: "Hogander, Jouni" <jouni.hogander@intel.com>, "Nikula,
 Jani" <jani.nikula@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTXVydGh5LCBBcnVuIFIg
PGFydW4uci5tdXJ0aHlAaW50ZWwuY29tPg0KPiBTZW50OiBNb25kYXksIE9jdG9iZXIgMTYsIDIw
MjMgOTo1NiBBTQ0KPiBUbzogTWFubmEsIEFuaW1lc2ggPGFuaW1lc2gubWFubmFAaW50ZWwuY29t
PjsgaW50ZWwtDQo+IGdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IGRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmc7IEhvZ2FuZGVyLCBKb3VuaQ0KPiA8am91bmkuaG9nYW5kZXJA
aW50ZWwuY29tPjsgTmlrdWxhLCBKYW5pIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+DQo+IFN1Ympl
Y3Q6IFJFOiBbUEFUQ0ggdjcgNC82XSBkcm0vaTkxNS9wYW5lbHJlcGxheTogRW5hYmxlIHBhbmVs
IHJlcGxheSBkcGNkDQo+IGluaXRpYWxpemF0aW9uIGZvciBEUA0KPiANCj4gDQo+ID4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBNYW5uYSwgQW5pbWVzaCA8YW5pbWVzaC5t
YW5uYUBpbnRlbC5jb20+DQo+ID4gU2VudDogV2VkbmVzZGF5LCBPY3RvYmVyIDExLCAyMDIzIDQ6
NDAgUE0NCj4gPiBUbzogaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiA+IENjOiBk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBNYW5uYSwgQW5pbWVzaA0KPiA+IDxhbmlt
ZXNoLm1hbm5hQGludGVsLmNvbT47IEhvZ2FuZGVyLCBKb3VuaQ0KPiA8am91bmkuaG9nYW5kZXJA
aW50ZWwuY29tPjsNCj4gPiBNdXJ0aHksIEFydW4gUiA8YXJ1bi5yLm11cnRoeUBpbnRlbC5jb20+
OyBOaWt1bGEsIEphbmkNCj4gPiA8amFuaS5uaWt1bGFAaW50ZWwuY29tPg0KPiA+IFN1YmplY3Q6
IFtQQVRDSCB2NyA0LzZdIGRybS9pOTE1L3BhbmVscmVwbGF5OiBFbmFibGUgcGFuZWwgcmVwbGF5
IGRwY2QNCj4gPiBpbml0aWFsaXphdGlvbiBmb3IgRFANCj4gPg0KPiA+IER1ZSB0byBzaW1pbGFy
aXR5IHBhbmVsIHJlcGxheSBkcGNkIGluaXRpYWxpemF0aW9uIGdvdCBhZGRlZCBpbiBwc3INCj4g
PiBmdW5jdGlvbiB3aGljaCBpcyBzcGVjaWZpYyBmb3IgZWRwIHBhbmVsLiBUaGlzIHBhdGNoIGVu
YWJsZXMgcGFuZWwNCj4gPiByZXBsYXkgaW5pdGlhbGl6YXRpb24gZm9yIGRwIGNvbm5lY3Rvci4N
Cj4gPg0KPiBJZiBwYW5lbHJlcGxheSBpbml0aWFsaXphdGlvbiB0aGVuIHdoeSBpcyB0aGUgZnVu
Y3Rpb24gbmFtZSBwc3JfaW5pdF9kcGNkKCkgPw0KPiBBbHNvIGl0IGl0cyBzaW1pbGFyIHRvIFBT
UiB0aGVuIHRoZXNlIGRwY2Qgc2hvdWxkIGFscmVhZHkgYmUgYXZhaWxhYmxlLg0KDQpIaSBBcnVu
LA0KDQpUaGUgZmlyc3QgY2FsbCBmb3IgaW50ZWxfcHNyX2luaXRfZHBjZCgpIGdldCBjYWxsZWQg
ZnJvbSBpbnRlbF9lZHBfaW5pdF9kcGNkKCkgd2hpY2ggaXMgbm90IHJlYWNoYWJsZSBmb3IgRFAu
DQpTbywgaW4gdGhpcyBwYXRjaCBuZWVkIHRvIGFkZCBpbnRlbF9wc3JfaW5pdF9kcGNkKCkgZm9y
IERQKG5vbi1lZHApIGluIGludGVsX3Bzcl9pbml0KCkuDQpQYW5lbCByZXBsYXkgaW5pdGlhbGl6
YXRpb24gYWRkZWQgaW4gaW50ZWxfcHNyX2luaXQoKSBhcyBwZXIgcHJldmlvdXMgZmVlZGJhY2sg
anVzdCB0byBhbGlnbiBwYW5lbC1yZXBsYXkgd2l0aCBwc3IgZnJhbWV3b3JrLiANCg0KUmVnYXJk
cywNCkFuaW1lc2gNCj4gDQo+IFRoYW5rcyBhbmQgUmVnYXJkcywNCj4gQXJ1biBSIE11cnRoeQ0K
PiAtLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiANCj4gPiBDYzogSm91bmkgSMO2Z2FuZGVyIDxqb3Vu
aS5ob2dhbmRlckBpbnRlbC5jb20+DQo+ID4gQ2M6IEFydW4gUiBNdXJ0aHkgPGFydW4uci5tdXJ0
aHlAaW50ZWwuY29tPg0KPiA+IENjOiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29t
Pg0KPiA+IFNpZ25lZC1vZmYtYnk6IEFuaW1lc2ggTWFubmEgPGFuaW1lc2gubWFubmFAaW50ZWwu
Y29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bz
ci5jIHwgMyArKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNyLmMN
Cj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNyLmMNCj4gPiBpbmRl
eCBmOTgzNzAwMWFhNWYuLmEyZTA2MzdjNTNmYiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzci5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZGlzcGxheS9pbnRlbF9wc3IuYw0KPiA+IEBAIC0yNzM4LDYgKzI3MzgsOSBAQCB2b2lk
IGludGVsX3Bzcl9pbml0KHN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHApDQo+ID4gIAlpZiAoIShI
QVNfUFNSKGRldl9wcml2KSB8fCBIQVNfRFAyMChkZXZfcHJpdikpKQ0KPiA+ICAJCXJldHVybjsN
Cj4gPg0KPiA+ICsJaWYgKCFpbnRlbF9kcF9pc19lZHAoaW50ZWxfZHApKQ0KPiA+ICsJCWludGVs
X3Bzcl9pbml0X2RwY2QoaW50ZWxfZHApOw0KPiA+ICsNCj4gPiAgCS8qDQo+ID4gIAkgKiBIU1cg
c3BlYyBleHBsaWNpdGx5IHNheXMgUFNSIGlzIHRpZWQgdG8gcG9ydCBBLg0KPiA+ICAJICogQkRX
KyBwbGF0Zm9ybXMgaGF2ZSBhIGluc3RhbmNlIG9mIFBTUiByZWdpc3RlcnMgcGVyIHRyYW5zY29k
ZXINCj4gPiBidXQNCj4gPiAtLQ0KPiA+IDIuMjkuMA0KDQo=
