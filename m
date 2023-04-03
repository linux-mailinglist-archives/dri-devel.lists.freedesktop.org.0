Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4786D3D1E
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 08:09:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2898010E12A;
	Mon,  3 Apr 2023 06:09:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 956F310E121;
 Mon,  3 Apr 2023 06:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680502140; x=1712038140;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rH9esId0ZCf5I3Hc9pmiSmR0Tq7auQ+PbtpTNu4UuqM=;
 b=TaQ+33GsE2p5pYhAmwlyHFVqVJTMArwcVM6KJ700tyyy8Nt1zpCLMZiv
 0HmHJba/XIJ0jBylovb2KH5uG82qFqVAdpoyeNrLMU/jtwjJpD88Dy6dP
 LVGgzZ043b/OyevT8z+TAhC9U87g4LGBAqfsKerZa5h0xfTsnpnIogMlf
 Mpj0UFKODjFQgU90dlKfnIwwgtXr7ADknv4Dj7m0dWSpa+lptuOxQ5fpO
 tysQgLMLiiUFaDHy6j8yNmvBcPhcToRY9Zmj8extZIV1kTv+fZ5FeCBWy
 Q8Wo9XBye+vZ0ve4H6WBLlNWhi74oxKBAUQBrZEA6ZsoELqIKcsn1KLww g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="330389210"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; d="scan'208";a="330389210"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2023 23:08:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="685843128"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; d="scan'208";a="685843128"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP; 02 Apr 2023 23:08:59 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Sun, 2 Apr 2023 23:08:59 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Sun, 2 Apr 2023 23:08:59 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Sun, 2 Apr 2023 23:08:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hW3L+NggQmTfN2gNcLbmb1j9G9xGLcpYr8Wp/gF3ThXtVGV6n7y1rDBmvkFpO56H/OYE06fesvoRZc7Fe4MJH8bCCAEF+kg+sYo+qtdQMaifoeH3o39UCe1s5hYWDzYyo4ZslDPilHViQfms+y3q2+jC9+rZzeIZEnVmhgsaGKpd5X4VXqTMox50wi48taAjjMCX9FyWJxCGnus5oi2qwjx5U5Gl1CXr0uofdou/MoxH8t7lSh17S4YOE6lvfhFONXFQXAqInf9sYuz5zpqOk2vPdJnsegFDsJ8s7SWCkMDZhoOncrfnXBSl44KRxUc87jMJfFzki3yKPYxfgqNP3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rH9esId0ZCf5I3Hc9pmiSmR0Tq7auQ+PbtpTNu4UuqM=;
 b=DdlrSiu//jhQ0onKMk8A/JwdyEFEigkp1kHgCV+mzf6OuevSJ51oQTBrKihGackq7OzHWGPzwOEXpBE+htVS3qiq+JkHu2xRWiOywkBFIt0FOMBek+e4+BvEXZ3RYcnnrLjGFlgYwPLpv9caN5drtDkWBKXjjZPCfoD8PTSWmkOClKAoRCuMUXBp1/4Ja+bAql8hI0cDD8WH+tKVWU/zqWAriaMW637948/4i+VVNQN0XxMkgSjngpVfBG514/1KVaXH1Sp8tEPJMfUU409M3Q4r2j1Pw9Vb99NJXFrai6SRXtdIeWDWpJpGbs92DWApR2KnjFbiPcSOieLLU4wnTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 MW3PR11MB4714.namprd11.prod.outlook.com (2603:10b6:303:5d::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6254.33; Mon, 3 Apr 2023 06:08:56 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::a77e:fdd7:ee30:aea0]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::a77e:fdd7:ee30:aea0%6]) with mapi id 15.20.6254.030; Mon, 3 Apr 2023
 06:08:56 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, "Kandpal, Suraj"
 <suraj.kandpal@intel.com>
Subject: RE: [PATCH 0/7] Enable YCbCr420 format for VDSC
Thread-Topic: [PATCH 0/7] Enable YCbCr420 format for VDSC
Thread-Index: AQHZRn8nNJGDvjClF0qHNTTwmHKuQK7w1cUAgB+NaoCAAAIDgIAI8y2w
Date: Mon, 3 Apr 2023 06:08:55 +0000
Message-ID: <DM4PR11MB636021CC9BDA06AA87569160F4929@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20230222053153.3658345-1-suraj.kandpal@intel.com>
 <87ttyvbhuz.fsf@intel.com>
 <SN7PR11MB6750FDE3318A85E0A2541831E3889@SN7PR11MB6750.namprd11.prod.outlook.com>
 <CAA8EJprrTPU6E59XjSa9SrMcg9q89ZPB33gayVMqCToR_nQ6CA@mail.gmail.com>
In-Reply-To: <CAA8EJprrTPU6E59XjSa9SrMcg9q89ZPB33gayVMqCToR_nQ6CA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|MW3PR11MB4714:EE_
x-ms-office365-filtering-correlation-id: e88b06ea-3b31-4a8a-be28-08db3409e846
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PZe2RcnjYEsvSSG2TdAkxKitjXD3db1O2P2mZpMlKPgEGw6JjA8EWqacJY0XMkpZyaaHfYTFnnkXIvNfmXYuX2im3DdUJQeQg3vhFLyRc40oXN0Y9ads6FPf9fR5W5zTzVD9FwoCUcyE3bSkXfS8U/DqtKOlsvMP+nD7IQxJlY94m6wO+6q1L0/TiyQAz29U+NC05DhQIGU+kyQLZt+1u4igasIsaec2fEcYkolDepdXVCzY18F1HogBy3CMaOBkS9FQYQWUEol28oYyfzT2ET77rcEPYL1akk9d/+ksxSHETPvXKtQOdYJIqKWyOSudNHq6YHeh46nBApTTkDDNqcT6tWnZ7pknQXT01SA6fGEtZ43p66gGoI6yIv+affDjMw2Dmfum52BJkvaAwRTFIhxMoP3GbulqK1x4VWcL1BkPFCsOYXc5cmF9dEpX9JrJawSHk9hBvjiWcpsiocf1+vs8xT+ikSIOnWjSaaM/dW4ekflUbg/YmsEADTxJso1ZUPxJHdFG1ooTqIiC9SpaOqVQrr0Tu8T3qO1vjbgmugw7bXNhVLN8Cf2H8sQF6ch9
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(6029001)(366004)(39860400002)(346002)(376002)(136003)(396003)(451199021)(9686003)(6506007)(26005)(966005)(7696005)(83380400001)(53546011)(186003)(71200400001)(4326008)(8936002)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(8676002)(5660300002)(52536014)(41300700001)(478600001)(6636002)(54906003)(2906002)(316002)(110136005)(33656002)(55016003)(38070700005)(86362001)(122000001)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aGc5a01oVFdIeFExM2FDSnlKMzJDMVcxbUIvemRHbzdiYm9IOWgwcjZlSith?=
 =?utf-8?B?WUd0QTR4SlR6RlV3Ry8wUTdFdW1ObWtJRnl1TlNiU0pCZVBtOE5iUVhObkZW?=
 =?utf-8?B?VmpSMktPR3FFaGcwN0p5MU9JNFl3YUV3RmFwd0hQaGN4YjZxdXZNS0dueG8r?=
 =?utf-8?B?WmFRVDhoZHVMR1ZrZWtFV2Nqd0N4aTdKZThNemtBR09EUVg5a2FYNlp6YmVW?=
 =?utf-8?B?OVpST1I3QzhwOE5YZFlSdlJ3SGt3QXFzQzA4dlNzRW1BSGRWSStYdnAzTll6?=
 =?utf-8?B?N2JrU2J1WG5aYXZtZWpKZ2ZNdXR0LzV3Unkvcm9seVU0TGFOdTl2WE8zZGhY?=
 =?utf-8?B?SXdqSDhVcDVwalhna2lGTnlwbXc0bGpLdTFmUmFqNi9PT1dGLzBad3N3UFNH?=
 =?utf-8?B?dDBHK0EyYkJXb1lXUlBRODlid2IrSEFVcTQvd3d3S3p5YTZMMXJJaEI0R3k0?=
 =?utf-8?B?a3p0bjY5NG5Xem5SL3dwcForcmVDOXpVRkt1ZUJYaUh3S08rTW9PWVY3S1Fr?=
 =?utf-8?B?NEdJUHB4N1kzdnhDSmVRMWt2Tzl3bkRHNmZNOXF4STJ3N0pDQ1RaNE9lNDds?=
 =?utf-8?B?YkxyZUVDT0cwWkhoZ3JzbnloUVRnS1NCOGpFMzdEZ3lQa2pQNjZCYmtESUgx?=
 =?utf-8?B?NlBMUlo4QW9Hd3BXZ3dUMk82UzhIUEtXMit2ZERxejJYMmJzcHdNTyszUXY3?=
 =?utf-8?B?UGZ2VlR1TDMzZ09vb3VTNXFxNVJOWFJ2dS9vOUFsS3BTdVlsTHZOQTdWbVh4?=
 =?utf-8?B?OTFtQ0Z0b1NXbUVCMVJDbnhzSkE2YllVNUpiTEZRdlMwdDlMYmhZNEt5TkRJ?=
 =?utf-8?B?RzYwR0N3ekxhdk52RWtUdERkZkx6Z2pmaVh5TEtvSDUzbDI5YW4vd0VnYysv?=
 =?utf-8?B?Z1NSZFpXZ1dKN0NUZnZBS2hqRWdoOEJjc2dHVU9mWnVxMWRNQU0zblBtZ0hE?=
 =?utf-8?B?YmdsY0hBcVNldUlidnBzSGNUb1FDYnVkeUU1Y3J4YmtMOXp4K0JqRWRBckYz?=
 =?utf-8?B?N3g5U3Jjb21TQ2QzYTAwbXZJRmRUZEdyN3NjSDBUNFNsajRhaUNMTDNodHE2?=
 =?utf-8?B?bytlWUs1NlU1R2xuSGs3cG1KZ2lUd054am9TOUJWeURyZWxDY0JkOU1sb2Zn?=
 =?utf-8?B?WjB4aXpac3E1TFRqRHdORmpUZlZ5MStNOWg5NEg0MytXR2pJL3lLemdKSXFZ?=
 =?utf-8?B?YU5ER1JqRjZvT3lWTkEzRHRSUUo2Unl6L3RKVUdONzBtcVF0WTlLVGRDTUJV?=
 =?utf-8?B?N24wQ1djeDdGSmdYaXo1dVdkRXAzcW5nTXZJSFlFODdzaEVhazA1S1dxWUVW?=
 =?utf-8?B?WldxQ1NreUVkNDdUSzlJYnZDMHJGVDRBRlNrNjd6UFB0aE9xTGtyWjhRODgw?=
 =?utf-8?B?MU1qenVLajRUUEEySll6NGthK0FlVlVGcXpLVW1oemlRQ0ZleHZZRjNCQUYr?=
 =?utf-8?B?aEIvTzBvUm5UWkZ1VERNeDFSYkdDbzdCdFViU3d6UERFRFAxNlZHNFlVYkdQ?=
 =?utf-8?B?dEcrd3h2eW5OdFFMdDlWckpNWEQ2RXJ0ejI5NmliKzJzZlJOVjhjcTZMd2xH?=
 =?utf-8?B?S2hDeTRHR28xaE1UV1BMVDZIU1V6VEZPbTRqWDMwNXNTUzZKajhQNzlwcDdQ?=
 =?utf-8?B?cWo4MTZXdVpwZkFYTG5Oa1lUaHBOMCt5QSs3a2Q0STRFc2xjRWlWdTloWFdY?=
 =?utf-8?B?V2RhbitZbElBMXI0dGZXaHcwcWVZblArU3FBZm9QeExoMUR1elNyVWduTTNy?=
 =?utf-8?B?RDB0TTZhN1hKd2VEKzVPZ3c1Yk4wN1cxU0cwMlRFQW1oMk5iaVg0YWF1Wmhn?=
 =?utf-8?B?WVlnMHpXb3FzSXdoUm5hQk41Rm03K0lMVVJFU05mb3dkbXZSaG9mM0JCYUJu?=
 =?utf-8?B?T3U2cWU3eE55aldxRkhGUHI3VkhZaUxUUFY1Qk5lTnZUQ1BZNFJKczlHMFJT?=
 =?utf-8?B?TklveFBRcjdjSGYrTTA1anpqMzhCdnplWEtYbHNOcXFXamRrYVhMOG9iK1Q1?=
 =?utf-8?B?WDUyR3B2T0Y4L1NweG15N2xiTFlBaXdxeFYwMFNjbGIxN1ByMWRIbGpGLzlL?=
 =?utf-8?B?RXE3ODV2QzF6Um1tVi9jeExIdzE5ZGxocWF0UWkyZmMzQVh2cVU0eEd2Y1Va?=
 =?utf-8?Q?0yrLFUI+wHAIIo4KLoT/BOqx1?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e88b06ea-3b31-4a8a-be28-08db3409e846
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2023 06:08:55.8849 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iyrHnBwYF+dlCXpYRywbBF3GxvPt72H/zMNT8/xTt6b8/h1/5hwWRj7qu8pO+oe4f28h2pLmgbxcpkusfclPeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4714
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRG1pdHJ5IEJhcnlzaGtv
diA8ZG1pdHJ5LmJhcnlzaGtvdkBsaW5hcm8ub3JnPg0KPiBTZW50OiBUdWVzZGF5LCBNYXJjaCAy
OCwgMjAyMyA2OjU4IFBNDQo+IFRvOiBLYW5kcGFsLCBTdXJhaiA8c3VyYWoua2FuZHBhbEBpbnRl
bC5jb20+DQo+IENjOiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAbGludXguaW50ZWwuY29tPjsg
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsNCj4gaW50ZWwtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZzsgTmF1dGl5YWwsIEFua2l0IEsgPGFua2l0LmsubmF1dGl5YWxAaW50ZWwuY29t
PjsNCj4gU2hhbmthciwgVW1hIDx1bWEuc2hhbmthckBpbnRlbC5jb20+OyBNYWFydGVuIExhbmto
b3JzdA0KPiA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBS
ZTogW1BBVENIIDAvN10gRW5hYmxlIFlDYkNyNDIwIGZvcm1hdCBmb3IgVkRTQw0KPiANCj4gT24g
VHVlLCAyOCBNYXIgMjAyMyBhdCAxNjoyMCwgS2FuZHBhbCwgU3VyYWogPHN1cmFqLmthbmRwYWxA
aW50ZWwuY29tPiB3cm90ZToNCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4g
PiBGcm9tOiBkcmktZGV2ZWwgPGRyaS1kZXZlbC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zz4gT24gQmVoYWxmDQo+ID4gPiBPZiBKYW5pIE5pa3VsYQ0KPiA+ID4gU2VudDogV2VkbmVzZGF5
LCBNYXJjaCA4LCAyMDIzIDU6MDAgUE0NCj4gPiA+IFRvOiBLYW5kcGFsLCBTdXJhaiA8c3VyYWou
a2FuZHBhbEBpbnRlbC5jb20+OyBkcmktDQo+ID4gPiBkZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmc7IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gPiA+IENjOiBEbWl0cnkgQmFy
eXNoa292IDxkbWl0cnkuYmFyeXNoa292QGxpbmFyby5vcmc+OyBOYXV0aXlhbCwgQW5raXQNCj4g
PiA+IEsgPGFua2l0LmsubmF1dGl5YWxAaW50ZWwuY29tPjsgU2hhbmthciwgVW1hDQo+ID4gPiA8
dW1hLnNoYW5rYXJAaW50ZWwuY29tPjsgS2FuZHBhbCwgU3VyYWogPHN1cmFqLmthbmRwYWxAaW50
ZWwuY29tPg0KPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSCAwLzddIEVuYWJsZSBZQ2JDcjQyMCBm
b3JtYXQgZm9yIFZEU0MNCj4gPiA+DQo+ID4gPiBPbiBXZWQsIDIyIEZlYiAyMDIzLCBTdXJhaiBL
YW5kcGFsIDxzdXJhai5rYW5kcGFsQGludGVsLmNvbT4gd3JvdGU6DQo+ID4gPiA+IFRoaXMgcGF0
Y2ggc2VyaWVzIGFpbXMgdG8gZW5hYmxlIHRoZSBZQ2JDcjQyMCBmb3JtYXQgZm9yIERTQy4NCj4g
PiA+ID4gQ2hhbmdlcyBhcmUgbW9zdGx5IGNvbXB1dGUgcGFyYW1zIHJlbGF0ZWQgZm9yIGhkbWks
ZHAgYW5kIGRzaQ0KPiA+ID4gPiBhbG9uZyB3aXRoIHRoZSBhZGRpdGlvbiBvZiBuZXcgcmNfdGFi
bGVzIGZvciBuYXRpdmVfNDIwIGFuZA0KPiA+ID4gPiBjb3JyZXNwb25kaW5nIGNoYW5nZXMgdG8g
bWFjcm9zIHVzZWQgdG8gZmV0Y2ggdGhlbS4NCj4gPiA+ID4gVGhlcmUgaGF2ZSBiZWVuIGRpc2N1
c3Npb25zIHByaW9yIHRvIHRoaXMgc2VyaWVzIGluIHdoaWNoIHNvbWUNCj4gPiA+ID4gcGF0Y2hl
cyBoYXZlIGdvdHRlbiByYiBhbmQgY2FuIGJlIGZvdW5kIGluIHRoZSBiZWxvdyBsaW5rDQo+ID4g
PiA+IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTEzNzI5DQo+ID4g
Pg0KPiA+ID4gSSB0aGluayBpdCB3b3VsZCBiZSB1c2VmdWwgdG8gZ2V0IFsxXSBmcm9tIERtaXRy
eSBtZXJnZWQgdG8NCj4gPiA+IGRybS1taXNjLW5leHQgZmlyc3QsIGhhdmUgdGhhdCBpbiBkcm0t
bmV4dCwgYW5kIGFnYWluIGJhY2ttZXJnZWQgdG8NCj4gPiA+IGRybS1pbnRlbC1uZXh0IGJlZm9y
ZSB0aGlzLiBBdCBsZWFzdCBwYXRjaGVzIDEtNS4NCj4gPiA+DQo+ID4gPiBUaGVyZSdzIG5vdCBt
dWNoIHBvaW50IGluIGFsbCBkcml2ZXJzIGR1cGxpY2F0aW5nIHRoZSBwYXJhbWV0ZXJzLA0KPiA+
ID4gYW5kIHdlIG5lZWQgdG8gbW92ZSB0b3dhcmRzIGNvbW1vbiBjb2RlLiBEbWl0cnkgaGFzIGJl
ZW4gaGVscGZ1bCBpbg0KPiA+ID4gY29udHJpYnV0aW5nIHRoaXMgdG8gdXMuDQo+ID4gPg0KPiA+
ID4gQlIsDQo+ID4gPiBKYW5pLg0KPiA+ID4NCj4gPiA+DQo+ID4NCj4gPiBIaSBKYW5pLA0KPiA+
IE1hYXJ0ZW4gaGFzIGFja2VkIHRoZSBwYXRjaCBzZXJpZXMgdG8gYmUgbWVyZ2VkIHRocm91Z2gg
ZHJtLWludGVsIGFuZA0KPiA+IGluIHRoZSBtZWFudGltZSBJIHdpbGwgd29yayB3aXRoIERtaXRy
eSB0byBwdWxsIHRoZSBjb21tb24gY29kZSB0bw0KPiA+IGF2b2lkIGR1cGxpY2F0aW9uDQo+IA0K
PiBUaGFuayB5b3UhIElmIG5lY2Vzc2FyeSBmZWVsIGZyZWUgdG8gcGluZyBtZSBvbiBJUkMgKCds
dW1hZycpLg0KDQpUaGFua3MgZ3V5cywgd2lsbCBoZWxwIG1lcmdlIHRoZSBjaGFuZ2UuDQoNClJl
Z2FyZHMsDQpVbWEgU2hhbmthcg0KDQo+ID4NCj4gPiBSZWdhcmRzLA0KPiA+IFN1cmFqIEthbmRw
YWwNCj4gPg0KPiA+ID4gWzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJp
ZXMvMTE0NDczLw0KPiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4gQW5raXQgTmF1dGl5YWwgKDIpOg0K
PiA+ID4gPiAgIGRybS9kcF9oZWxwZXI6IEFkZCBoZWxwZXIgdG8gY2hlY2sgRFNDIHN1cHBvcnQg
d2l0aCBnaXZlbiBvL3AgZm9ybWF0DQo+ID4gPiA+ICAgZHJtL2k5MTUvZHA6IENoZWNrIGlmIERT
QyBzdXBwb3J0cyB0aGUgZ2l2ZW4gb3V0cHV0X2Zvcm1hdA0KPiA+ID4gPg0KPiA+ID4gPiBTdXJh
aiBLYW5kcGFsICg0KToNCj4gPiA+ID4gICBkcm0vaTkxNTogQWRkaW5nIHRoZSBuZXcgcmVnaXN0
ZXJzIGZvciBEU0MNCj4gPiA+ID4gICBkcm0vaTkxNTogRW5hYmxlIFlDYkNyNDIwIGZvciBWRFND
DQo+ID4gPiA+ICAgZHJtL2k5MTUvZGlzcGxheTogRmlsbCBpbiBuYXRpdmVfNDIwIGZpZWxkDQo+
ID4gPiA+ICAgZHJtL2k5MTUvdmRzYzogQ2hlY2sgc2xpY2UgZGVzaWduIHJlcXVpcmVtZW50DQo+
ID4gPiA+DQo+ID4gPiA+IFN3YXRpIFNoYXJtYSAoMSk6DQo+ID4gPiA+ICAgZHJtL2k5MTUvZHNj
OiBBZGQgZGVidWdmcyBlbnRyeSB0byB2YWxpZGF0ZSBEU0Mgb3V0cHV0IGZvcm1hdHMNCj4gPiA+
ID4NCj4gPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaWNsX2RzaS5jICAgICAg
ICB8ICAgMiAtDQo+ID4gPiA+ICAuLi4vZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9jcnRjX3N0YXRl
X2R1bXAuYyAgfCAgIDQgKy0NCj4gPiA+ID4gIC4uLi9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Ny
dGNfc3RhdGVfZHVtcC5oICB8ICAgMiArDQo+ID4gPiA+ICAuLi4vZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9kaXNwbGF5X2RlYnVnZnMuYyAgfCAgNzggKysrKysrKysNCj4gPiA+ID4gIC4uLi9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfdHlwZXMuaCAgICB8ICAgMSArDQo+ID4gPiA+ICBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMgICAgICAgfCAgMzkgKysrLQ0K
PiA+ID4gPiAgLi4uL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3FwX3RhYmxlcy5jICAgIHwg
MTg3ICsrKysrKysrKysrKysrKystLQ0KPiA+ID4gPiAgLi4uL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX3FwX3RhYmxlcy5oICAgIHwgICA0ICstDQo+ID4gPiA+ICBkcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX3Zkc2MuYyAgICAgfCAxMDggKysrKysrKysrLQ0KPiA+ID4gPiAg
ZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9yZWcuaCAgICAgICAgICAgICAgIHwgIDI4ICsrKw0K
PiA+ID4gPiAgaW5jbHVkZS9kcm0vZGlzcGxheS9kcm1fZHBfaGVscGVyLmggICAgICAgICAgIHwg
IDEzICsrDQo+ID4gPiA+ICAxMSBmaWxlcyBjaGFuZ2VkLCA0NDIgaW5zZXJ0aW9ucygrKSwgMjQg
ZGVsZXRpb25zKC0pDQo+ID4gPg0KPiA+ID4gLS0NCj4gPiA+IEphbmkgTmlrdWxhLCBJbnRlbCBP
cGVuIFNvdXJjZSBHcmFwaGljcyBDZW50ZXINCj4gDQo+IA0KPiANCj4gLS0NCj4gV2l0aCBiZXN0
IHdpc2hlcw0KPiBEbWl0cnkNCg==
