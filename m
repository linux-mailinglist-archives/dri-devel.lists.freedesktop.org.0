Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8137B0A7C
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 18:38:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0374C10E56D;
	Wed, 27 Sep 2023 16:38:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDC7D10E56D;
 Wed, 27 Sep 2023 16:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695832716; x=1727368716;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=pBtP1YiIjlsdJsW0PyJlin1xDpDSUfau95AjUL+spqc=;
 b=NK+vXyAip3zryMQRgzFjPdibJplCB/bR6opqIUfmaQO/FEPgmc6kilut
 ZOLPsSVriRT3z263LImeOGY4iyY0+8qCAYL/qIcAKHx2kFAgiaNKVdLNl
 6a2axvy5vkkAfdrABof3ZyfgSAnPtjQlxv1ZvG/omPCdycC68u5vtgLY1
 W8F4DmU+5JU5cELv4+fp9SccFNTpHJOxRxaFW88Pesps/4kYuYj6R4Mig
 Xct3RQEWjY0DQg258tex9aHt/knz4og0BuLBiA6NGFr+x06so76qEoJ87
 3fTIjXccbQ0g/bWnUe8V/K25/JpHdqu4efFVKHq1I1WmbqkcoiTK9N/Im w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="448364069"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="448364069"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 09:36:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="872957496"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="872957496"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Sep 2023 09:36:24 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 09:36:24 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 27 Sep 2023 09:36:24 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 27 Sep 2023 09:36:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gsTTyLbMWXEj12TuLj3Bu+lJz/6KqMd5MtlRQ3Pzinr7ce+OChSpGtI+ADg2GJwX3yo45curnEt7kYR1MpVCFJEBzfGLe7HnAKpzj/V8ypWaL2JQAyTecCSP3hlmLqgnnpaf5s3FKFWoxic42XPhVsW5FW2yj3ukTOA7TfJR00gZbe9o3aKKmALtbxcC4LETjN4VpZVdMMWNPDpCtKY/qjqAUlJoD5wFMhl02UM760EELfKHaMhTiATbkfkFGoeC7ObNkYSlof4f4I3SUPt3Ey8baEWhEJTAfbezMfey0zTJmmQw2woZdLjWrhm5hfz29vPzGfQzkS/FG7Lil/dOuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pBtP1YiIjlsdJsW0PyJlin1xDpDSUfau95AjUL+spqc=;
 b=EuhEX7Z87AMZV2Fm6+QmcMKBMgYW0Lq1XLZ3t10XYNC8YSTQWHLtvUc56IjkHetYks4PQNrCCURvzjBibIPliigDQ0OlHUWkjaydkSvMH97/kZxsJsGbCCRxGY/+N76veLl/XxDlengRBhcFQrFkSPulEDaP1kkPNICcwThi6pr9qukvzEmK6OCxGE8Qe7g8W1kwWzeBOvd6GmpL3bJ1RPbkWGcZ9AYxv9tLrM/nbeWgdpEStqN3DD8RCgAb6VEWemRGpzWgi2RQcc25jOfKXNmIWAMtQRsgFXMCQoK13KKG3drp3FgUMNlchACs38QW2w5ZHcFWQynA6+pc9V1yOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 SA1PR11MB6782.namprd11.prod.outlook.com (2603:10b6:806:25e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Wed, 27 Sep
 2023 16:36:21 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::7bf2:1b4c:1512:79c1]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::7bf2:1b4c:1512:79c1%6]) with mapi id 15.20.6813.027; Wed, 27 Sep 2023
 16:36:21 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH v4 3/3] drm/i915/gt: Timeout when waiting for
 idle in suspending
Thread-Topic: [Intel-gfx] [PATCH v4 3/3] drm/i915/gt: Timeout when waiting for
 idle in suspending
Thread-Index: AQHZ8Kx2E7YYzy1lTkO6NJtn5NHgRrAuYVuAgAB+x4A=
Date: Wed, 27 Sep 2023 16:36:21 +0000
Message-ID: <123edf6b37aa982de20279d64c213156a2dc8c2e.camel@intel.com>
References: <20230926190518.105393-1-alan.previn.teres.alexis@intel.com>
 <20230926190518.105393-4-alan.previn.teres.alexis@intel.com>
 <9ca17c5c-7bb4-ff6b-69cb-3983299729c1@linux.intel.com>
In-Reply-To: <9ca17c5c-7bb4-ff6b-69cb-3983299729c1@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|SA1PR11MB6782:EE_
x-ms-office365-filtering-correlation-id: f05cb8f0-92bd-4783-727d-08dbbf77e1a9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hIG6DYe1eJhds7zdBiTWsgRQgnQFBs2trmh8mtqD8q+3yGmNvVv/TIQEDEC1/UUrA1cjNONzSUXxUYbSJrU655MpYmOC/qMEYyB2JfmmqMll1KcLRFaYK1oj2EcMIstEZOj7zNpQ613MurdlKBUOIkB4zC/ebSEQ1lrtRMfnIefulU9u/0S4w9R44DWBstTqO0MuFnVi7FJHwHTkPbpuDm0bZJHqj8LWyYxxFLr+YHGc6d3Se1CxccjgNYX3axAzcp1rbeNTg+9QBckBwrXlo3naEmJDCQP6dLVmxFmb1rl7m45iAggwNBuzln80TekO4AdrXY3rua78BXVSKY7QsJ9VWvc4iQILqnhlmmzrssYcVeqjH5hW2UC+ATGImz9jPbkzvnnrpAdUQICZ/zkE55F6fxFTA4H0+l5zMKwHQ1IHnThUd6aU0cY0gsfe0gquPN7F2ROf6TIB6IKCdHYj3ruHPaHL98Vq4OGWwckvuE6uoquxH5Dq46QBFoltqnkpTFEbeyR2UaFPwBECB4PK5zyJbPI3kxuGtbi0sBCFo1T5UcGh0LFuBFQ1nOr62CgWU5V/8o2KSrym0gFe6o4ElzoPBsjMMcvxceQFtDXJc3DQmWXcdXPCK+90nlHXQO/a
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(396003)(376002)(346002)(136003)(230922051799003)(451199024)(186009)(1800799009)(38070700005)(38100700002)(86362001)(5660300002)(4326008)(316002)(110136005)(36756003)(64756008)(66476007)(66946007)(41300700001)(8936002)(54906003)(15650500001)(76116006)(2906002)(91956017)(66446008)(66556008)(83380400001)(478600001)(8676002)(71200400001)(6512007)(122000001)(26005)(53546011)(2616005)(6506007)(82960400001)(6486002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UUhvUTVDWTFWb21rcGh3ZVBvOTZRSVFhZ3RCa1ZQeDU3WmJ1dEUwTXlJWXl5?=
 =?utf-8?B?MFQxOCtQZDdwdU94cEg5b2twSkZBWmVPb0l4LzBpNGdUMFlLSWx4OFJQTGVm?=
 =?utf-8?B?NXJiSG5JSDBBSGZ2b3dueVRmd24xT3Y2VTlSRENhQjBvMTduR0Z5N0FxckNh?=
 =?utf-8?B?V2FiQ1RBUm5nWm12cDhRenJxM2ZkMVA0VXVXNjlSV2dxWWRXVXU2WFoyNy9Z?=
 =?utf-8?B?ZTFoYzlYa3F0TnpwWmdOQ3RhUGtJZ3YydmtoWmY4ekdOV3kwa2hlN1ZMYkNJ?=
 =?utf-8?B?c1BPaUpuaFFSbVFqbmF1czl0ekE1aWtJN0dKcjlST0FjSkVNRlA3VTlrZS9F?=
 =?utf-8?B?eXBITFlGdVVNd2JZQTIrQkU0dlVnV2dlZDJabGR0NktTQ00yand3ZFJSMWR5?=
 =?utf-8?B?LzFiV29kTWI5UXc0VDJHMVJ3TTczQnVrbTI3N0JhLzhMcDNmTUt4akJaalFT?=
 =?utf-8?B?Y3JGT3ZieTY2Q3pTMVJtM09maFFBQUp0V253SXpqR0NtTEF1U0QvWnY3VXk1?=
 =?utf-8?B?NlhmdnRPbmZlcyt0d3M4dGY0dUg1aldPcE1hdURJR1pmaXZLUnZoMDB6K0xN?=
 =?utf-8?B?YVNLbnFEeDZCVGFzL0lDV29RR0x4bDlpVGNQZTVkWnhadHBhVjFUN0hIOWhr?=
 =?utf-8?B?NWZBeVZRSnorYXZHaThzSC9lTExtb0owRytNU2F5ZU9DbVhxWFNQY3VmWW4v?=
 =?utf-8?B?a1lYbnpRMkkzd2YvdFJIcXJ4cnBvSjE0L1hGR0YzU283Yy9IbGQySkU2ekVW?=
 =?utf-8?B?Q3oxZFJZVWExQTRieDhrL3J0czY3QTI1U1grQUltN3lobFZYM1RmNmpWYXpX?=
 =?utf-8?B?YUROTTZJTGlNYTlMSWNLVFcvT0VsU1VLQ1p1Qm9CK2pLRmJjYzdUQU1Kajdz?=
 =?utf-8?B?bFJnQmRZbFp1Q3NOYm4xZCtLUEptZHlrc1dWTVY1Q2ZJaXpPSXliZ1lGcmhk?=
 =?utf-8?B?K2hxcXpLT0ZkNzkyOE9wT3ByNDJXbzZTdEVJQ1FNZTk0djJuOW44OGJsY0NY?=
 =?utf-8?B?LytqejRwOUdOY3BJN21mNFZMTXBseFkxV0V6dThwZWNxZGJoQktwTFgxWWRr?=
 =?utf-8?B?ZkRWaEkxUXZ5dkdrNU96RUV5dXNKb1lsaXM5MHJXYTd5b0t3UnJQS3UwSks0?=
 =?utf-8?B?SHU4TmxvMEtBemlveHB5WnZGRkdWS2c2M3YzVUlhc1RINkNCZnBZOEZocmZO?=
 =?utf-8?B?WjRXcjh1Z1N3NGZMSHRSaXRGeEkzQ2JyTVlka3AvYUFXdzgveVNuWHJMdkZ0?=
 =?utf-8?B?WHVjcVpqRkJreklmd3NRTTRKTWFVNjlxeVZSaEQwdmgvRlRiM3o1bE1VZmxD?=
 =?utf-8?B?cWJWZ3o5dlV6Yk9oMFJ5eFF3YktuZS9VVFlnRlM1NXlpcmtvTU1OL1dqVzdh?=
 =?utf-8?B?azY0RnhWaU5Fcld6bGdRQmdIaWRwQ2xXZy9CY055aFBXTXVEMTFiRFYyK3Jv?=
 =?utf-8?B?UXlGY1dGSTI2eDUxTmp6S09laTZaa3hwakUyTmR5VlV5dkd5bC9tSldCUkZR?=
 =?utf-8?B?aW5DNXRwLzgwY25Ta3VWNDhhRjNucHhqblkyQk1lRHd0ajNSdE00SVR0b0tP?=
 =?utf-8?B?QmZydnZQNmozRGx6QmR1dVphV1V2YVVWc1BiZVNKSVpmVWg1WEZYTXRDeVdj?=
 =?utf-8?B?b0k4K1hFTnkzeC9mV2xHTGU0WnI2dG0rNy9hekZrSzhHbnBFQ3loN2RpRnhz?=
 =?utf-8?B?Q2JkbWI2SXd3OEFFL0VRWGdsY3hiM1JPMkJxY0hUaUFmTlJYOURGWGhHY3Y5?=
 =?utf-8?B?MHowUEplVGx0SXhadXU1Yjk3UUw2b1lTR1B5TGhVS3crZmRZMnloVlVoMVcw?=
 =?utf-8?B?Z2RQUFU0Z0d1ZEFGV2FwbjRwUU9qaEVRSFdyUlFhazlVTFIzYUt5cHBSVHEr?=
 =?utf-8?B?RXlsWGFQQUQ0dys3UjVJSFhJQlhnS2FCdW1jRU9lM0ZsYWF5RTNveUF6TDFl?=
 =?utf-8?B?bmhHdjQ0SUcraDlmajFWY0ZBMHppYTYxOVRFUnh6Wnl3eHg0QUV2R0Z6SHVz?=
 =?utf-8?B?Ym03aGFCQmtERnRWM0lPblFuZndYbkxEeFc5a2pFMkJyUFJidTFJNHVHZWk0?=
 =?utf-8?B?UDRYRkdjUjh2ZTJtNXNLeGpXVyttNXNrdHQ0dDYvck4xUTdYWklETU02dFJK?=
 =?utf-8?B?RGF1Zy81UCtpQ3JXdmpRZ0h0OUpzUFRCQ1NhNUE0dWR2K3hyWU1KV0NxcElk?=
 =?utf-8?Q?i/Vdlxb0RYznlPGN2FNFdrY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CCCD53DC4234A94D8D645757CA059B1E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f05cb8f0-92bd-4783-727d-08dbbf77e1a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2023 16:36:21.0920 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /WbFO4hvKsMDZwjnhRijK7p8TPOO2On4g8DZ0h4f7o2+qVQSDFuL/FhqhB+XgehkjdQoie51ibYXdtxURAA2hTvSIoDlyCBwqFlYXQLBjbsdUgXAp5YmGnY6H+UevRaX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6782
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
Cc: "Jana, Mousumi" <mousumi.jana@intel.com>,
 "intel.com@freedesktop.org" <intel.com@freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhhbmtzIGZvciB0YWtpbmcgdGhlIHRpbWUgdG8gcmV2aWV3IHRoaXMgVHZydGtvLCByZXBsaWVz
IGlubGluZSBiZWxvdy4NCg0KT24gV2VkLCAyMDIzLTA5LTI3IGF0IDEwOjAyICswMTAwLCBUdnJ0
a28gVXJzdWxpbiB3cm90ZToNCj4gT24gMjYvMDkvMjAyMyAyMDowNSwgQWxhbiBQcmV2aW4gd3Jv
dGU6DQo+ID4gV2hlbiBzdXNwZW5kaW5nLCBhZGQgYSB0aW1lb3V0IHdoZW4gY2FsbGluZw0KPiA+
IGludGVsX2d0X3BtX3dhaXRfZm9yX2lkbGUgZWxzZSBpZiB3ZSBoYXZlIGEgbG9zdA0KPiA+IEcy
SCBldmVudCB0aGF0IGhvbGRzIGEgd2FrZXJlZiAod2hpY2ggd291bGQgYmUNCj4gPiBpbmRpY2F0
aXZlIG9mIGEgYnVnIGVsc2V3aGVyZSBpbiB0aGUgZHJpdmVyKSwNCj4gPiBkcml2ZXIgd2lsbCBh
dCBsZWFzdCBjb21wbGV0ZSB0aGUgc3VzcGVuZC1yZXN1bWUNCj4gPiBjeWNsZSwgKGFsYmVpdCBu
b3QgaGl0dGluZyBhbGwgdGhlIHRhcmdldHMgZm9yDQo+ID4gbG93IHBvd2VyIGh3IGNvdW50ZXJz
KSwgaW5zdGVhZCBvZiBoYW5naW5nIGluIHRoZSBrZXJuZWwuDQphbGFuOnNuaXANCg0KPiA+ICAg
ew0KPiA+ICsJaW50IHRpbWVvdXRfbXMgPSBDT05GSUdfRFJNX0k5MTVfTUFYX1JFUVVFU1RfQlVT
WVdBSVQgPyA6IDEwMDAwOw0KPiANCj4gQ09ORklHX0RSTV9JOTE1X01BWF9SRVFVRVNUX0JVU1lX
QUlUIGlzIGluIG5zIHNvIGFzc2lnbmluZyBpdCB0byBfbXMgaXMgDQo+IGEgYml0IHRvIGFyYml0
cmFyeS4NCj4gDQo+IFdoeSBub3QgdGhlIGV4aXN0aW5nIEk5MTVfR1RfU1VTUEVORF9JRExFX1RJ
TUVPVVQgZm9yIGluc3RhbmNlPw0KYWxhbjogZ29vZCBjYXRjaCwgbXkgYmFkLiBIb3dldmVyIEk5
MTVfR1RfU1VTUEVORF9JRExFX1RJTUVPVVQgaXMgb25seSBoYWxmIGEgc2VjDQp3aGljaCBpIGZl
ZWwgaXMgdG9vIHF1aWNrLiBJIGd1ZXNzIGkgY291bGQgY3JlYXRlIGEgbmV3ICNkZWZpbmUgb3Ig
YSBtdWx0aXBsZQ0Kb2YgSTkxNV9HVF9TVVNQRU5EX0lETEVfVElNRU9VVD8NCg0KPiA+ICAgCS8q
DQo+ID4gICAJICogT24gcmFyZSBvY2Nhc2lvbnMsIHdlJ3ZlIG9ic2VydmVkIHRoZSBmZW5jZSBj
b21wbGV0aW9uIHRyaWdnZXINCj4gPiAgIAkgKiBmcmVlX2VuZ2luZXMgYXN5bmNocm9ub3VzbHkg
dmlhIHJjdV9jYWxsLiBFbnN1cmUgdGhvc2UgYXJlIGRvbmUuDQo+ID4gQEAgLTMwOCw3ICszMDks
MTAgQEAgc3RhdGljIHZvaWQgd2FpdF9mb3Jfc3VzcGVuZChzdHJ1Y3QgaW50ZWxfZ3QgKmd0KQ0K
PiA+ICAgCQlpbnRlbF9ndF9yZXRpcmVfcmVxdWVzdHMoZ3QpOw0KPiA+ICAgCX0NCj4gPiAgIA0K
PiA+IC0JaW50ZWxfZ3RfcG1fd2FpdF9mb3JfaWRsZShndCk7DQo+ID4gKwkvKiB3ZSBhcmUgc3Vz
cGVuZGluZywgc28gd2Ugc2hvdWxkbid0IGJlIHdhaXRpbmcgZm9yZXZlciAqLw0KPiA+ICsJaWYg
KGludGVsX2d0X3BtX3dhaXRfdGltZW91dF9mb3JfaWRsZShndCwgdGltZW91dF9tcykgPT0gLUVU
SU1FRE9VVCkNCj4gPiArCQlndF93YXJuKGd0LCAiYmFpbGluZyBmcm9tICVzIGFmdGVyICVkIG1p
bGlzZWMgdGltZW91dFxuIiwNCj4gPiArCQkJX19mdW5jX18sIHRpbWVvdXRfbXMpOw0KPiANCj4g
RG9lcyB0aGUgdGltZW91dCBpbiBpbnRlbF9ndF9wbV93YWl0X3RpbWVvdXRfZm9yX2lkbGUgYWx3
YXlzIGNvbWVzIGluIA0KPiBwYWlyIHdpdGggdGhlIHRpbWVvdXQgZmlyc3QgaW4gaW50ZWxfZ3Rf
d2FpdF9mb3JfaWRsZT8NCmFsYW46IE5vdCBuZWNlc3NhcmlseSwgLi4uIElJUkMgaW4gbmVhcmx5
IGFsbCBjYXNlcywgdGhlIGZpcnN0IHdhaXQgY2FsbA0KY29tcGxldGUgaW4gdGltZSAoaS5lLiBu
byBtb3JlIG9uZ29pbmcgd29yaykgYW5kIHRoZSBzZWNvbmQgd2FpdA0KZG9lcyB3YWl0IG9ubHkg
aWYgdGhlIGxhc3QgYml0IG9mIHdvcmsgJ2p1c3QtZmluaXNoZWQnLCB0aGVuIHRoYXQgc2Vjb25k
DQp3YWl0IG1heSB0YWtlIGEgdG91Y2ggYml0IGxvbmdlciBiZWNhdXNlIG9mIHBvc3NpYmxlIGFz
eW5jIGd0LXBtLXB1dCBjYWxscy4NCih3aGljaCBhcHBlYXIgaW4gc2V2ZXJhbCBwbGFjZXMgaW4g
dGhlIGRyaXZlciBhcyBwYXJ0IG9mIHJlZ3VsYXIgcnVudGltZQ0Kb3BlcmF0aW9uIGluY2x1ZGlu
ZyByZXF1ZXN0IGNvbXBsZXRpb24pLiBOT1RFOiB0aGlzIG5vdCBoaWdoIGVuZCB3b3JrbG9hZHMN
CnNvIHRoZQ0KPiANCj4gQWxzbywgaXMgdGhlIHRpbWVvdXQgaGVyZSBoaXQgZnJvbSB0aGUgaW50
ZWxfZ3Rfc3VzcGVuZF9wcmVwYXJlLCANCj4gaW50ZWxfZ3Rfc3VzcGVuZF9sYXRlLCBvciBjYW4g
YmUgYm90aD8NCj4gDQo+IE1haW4gY29uY2VybiBpcyB0aGF0IHdlIG5lZWQgdG8gYmUgc3VyZSB0
aGVyZSBhcmUgbm8gcG9zc2libGUgDQo+IGlsbC1lZmZlY3RzLCBsaWtlIGxldHRpbmcgdGhlIEdQ
VS9HdUMgc2NyaWJibGUgb24gc29tZSBtZW1vcnkgd2UgDQo+IHVubWFwcGVkIChvciB3aWxsIHVu
bWFwKSwgaGF2aW5nIGxldCB0aGUgc3VzcGVuZCBjb250aW51ZSBhZnRlciB0aW1pbmcgDQo+IG91
dCwgYW5kIG5vdCBwZXJoYXBzIGRvaW5nIHRoZSBmb3JjZWQgd2VkZ2UgbGlrZSB3YWl0X2Zvcl9z
dXNwZW5kKCkgZG9lcyANCj4gb24gdGhlIGV4aXN0aW5nIHRpbWVvdXQgcGF0aC4NCmFsYW46IHRo
aXMgd2lsbCBub3QgaGFwcGVuIGJlY2F1c2UgdGhlIGhlbGQgd2FrZXJlZiBpcyBuZXZlciBmb3Jj
ZS1yZWxlYXNlZA0KYWZ0ZXIgdGhlIHRpbWVvdXQgLSBzbyB3aGF0IGhhcHBlbnMgaXMgdGhlIGtl
cm5lbCB3b3VsZCBiYWlsIHRoZSBzdXNwZW5kLg0KPiANCj4gV291bGQgaXQgYmUgcG9zc2libGUg
dG8gaGFuZGxlIHRoZSBsb3N0IEcySCBldmVudHMgZGlyZWN0bHkgaW4gdGhlIA0KPiByZXNwZWN0
aXZlIGNvbXBvbmVudCBpbnN0ZWFkIG9mIGhlcmU/IExpa2UgYXBwbHkgdGhlIHRpbWVvdXQgZHVy
aW5nIHRoZSANCj4gc3RlcCB3aGljaCBleHBsaWNpdGx5IGlkbGVzIHRoZSBDVCBmb3Igc3VzcGVu
ZCAocHJlc3VtYWJseSB0aGF0IA0KPiBleGlzdHM/KSwgYW5kIHNvIGNsZWFudXAgZnJvbSB0aGVy
ZSBvbmNlIGRlY2xhcmVkIGEgbG9zdCBldmVudC4NCmFsYW46IFNvIHllcywgd2UgZG9uJ3Qgc29s
dmUgdGhlIHByb2JsZW0gd2l0aCB0aGlzIHBhdGNoIC0gUGF0Y2gjMg0KaXMgYWRkcmVzc2luZyB0
aGUgcm9vdCBjYXVzZSAtIGFuZCB2ZXJpZmljYXRpb24gaXMgc3RpbGwgb25nb2luZyAtIGJlY2F1
c2UgaXRzDQpoYXJkIHRvIHRob3JvdWdobHkgdGVzdCAvIHJlcHJvZHVjZS4gKGkuZS4gUGF0Y2gg
MiBjb3VsZCBnZXQgcmUtcmV2J2QpLg0KDQpJbnRlbnQgb2YgdGhpcyBwYXRjaCwgaXMgdG8gYmUg
aW5mb3JtZWQgdGhhdCBndC1wbSB3YWl0IGZhaWxlZCBpbiBwcmVwIGZvcg0Kc3VzcGVuZGluZyBh
bmQga2VybmVsIHdpbGwgZXZlbnR1YWxseSBiYWlsIHRoZSBzdXNwZW5kLCB0aGF0J3MgYWxsLg0K
QmVjYXVzZSB3aXRob3V0IHRoaXMgdGltZWQtb3V0IHZlcnNpb24gb2YgZ3QtcG0td2FpdCwgaWYg
d2UgZGlkIGhhdmUgYSBsZWFreQ0KZ3Qtd2FrZXJlZiwga2VybmVsIHdpbGwgaGFuZyBoZXJlIGZv
cmV2ZXIgYW5kIHdlIHdpbGwgbmVlZCB0byBnZXQgc2VyaWFsDQpjb25zb2xlIG9yIHJhbW9vcHMg
dG8gZXZlbnR1YWxseSBkaXNjb3ZlciB0aGUga2VybmVsJ3MgY3B1IGh1bmcgZXJyb3Igd2l0aA0K
Y2FsbC1zdGFjayBwb2ludGluZyB0byB0aGlzIGxvY2F0aW9uLiBTbyB0aGUgZ29hbCBoZXJlIGlz
IHRvIGhlbHAgc3BlZWQgdXANCmZ1dHVyZSBkZWJ1ZyBwcm9jZXNzIChpZiBsZXQncyBzYXkgc29t
ZSBmdXR1cmUgY29kZSBjaGFuZ2Ugd2l0aCBhbm90aGVyDQphc3luYyBndC1wbS1wdXQgY2FtZSBh
bG9uZyBhbmQgY2F1c2VkIG5ldyBwcm9ibGVtcyBhZnRlciBQYXRjaCAjMiByZXNvbHZlZA0KdGhp
cyB0aW1lKS4NCg0KUmVjYXA6IHNvIGluIGJvdGggY2FzZXMgKG9yaWdpbmFsIHZzIHRoaXMgcGF0
Y2gpLCBpZiB3ZSBoYWQgYSBidWdneSBndC13YWtlcmVmIGxlYWssDQp3ZSBkb250IGdldCBpbnZh
bGlkIGd1Yy1hY2Nlc3NlcywgYnV0IHdpdGhvdXQgdGhpcyBwYXRjaCwgd2Ugd2FpdCBmb3JldmVy
LA0KYW5kIHdpdGggdGhpcyBwYXRjaCwgd2UgZ2V0IHNvbWUgbWVzc2FnZXMgYW5kIGV2ZW50dWFs
bHkgYmFpbCB0aGUgc3VzcGVuZC4NCg0KYWxhbjpzbmlwDQoNCg==
