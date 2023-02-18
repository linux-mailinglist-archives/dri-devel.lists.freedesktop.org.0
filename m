Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E83169BB3F
	for <lists+dri-devel@lfdr.de>; Sat, 18 Feb 2023 18:31:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79D3E10E049;
	Sat, 18 Feb 2023 17:31:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69DDA10E049;
 Sat, 18 Feb 2023 17:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676741510; x=1708277510;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=57ltjsRejbA7oaU+iaQDdckGjVL6pqCoC7nglpeeqag=;
 b=ThUZlPvdYlfS11Lc5Pp4gwvIf7s6emxzyCDQiG8pSIoOj76GX8YTUruq
 PvgI/RtWLVCaJUktoGmAblVVOArracTPgnjw7LcX5OqaDYFq++lRSF0/1
 0jWuezuS1IYhBd9vTDY0Lt9hmpGPpH6UjpeqhrqVa4n7VciVh3mXxlqF5
 vml8D2eTpA88YOHEyKGMy+eK6slwEdxrodtW4cVvMIGspA1BcdHqi7A5X
 RFivmT8M/0kKNq3LC9t+40fIoBEuuauzSOnKuPjrVL+cO41JS4mbAxLji
 5mqd0hAFCglZAkaIer2Y/cEmukfrF0LUTmI/uKJOKml3fkG+5IyT5E+Bn w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="320299187"
X-IronPort-AV: E=Sophos;i="5.97,307,1669104000"; d="scan'208";a="320299187"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2023 09:31:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="620726882"
X-IronPort-AV: E=Sophos;i="5.97,307,1669104000"; d="scan'208";a="620726882"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP; 18 Feb 2023 09:31:49 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Sat, 18 Feb 2023 09:31:49 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Sat, 18 Feb 2023 09:31:48 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Sat, 18 Feb 2023 09:31:48 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Sat, 18 Feb 2023 09:31:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lpj8ZRWsAEgJwNpc4LTZwsRLBy/07XjGS77AzRVoRduU2ZQCuOIhdx3rAJU23HMZmbF8cdofW6jkD0SqdTtemn+VB5MELi3vJlgA4CCE1XqYq7zw2h+1iU20hSEm7Nws4SxZqByaIZKbfzthHhNerJvv8RHRdHxccMKFi4LOgUVPZcqxkXfbO6C7ZtMwLWezSrNi9ELZDLnr3ikzFmWoni9j/pxfiCjzPAfh1WUUyWZ7Gnh8WDJdovAS7V+1zwWvx9Pgv1RHpcuVgnq91EBWETxjlFq11YgJGzrF6G2LOt8uXC8iA4/Wx0qAuP8mR7KVMAXLWtwZQ0BBZ9H3U4mxeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=57ltjsRejbA7oaU+iaQDdckGjVL6pqCoC7nglpeeqag=;
 b=eGOlCXhV7vRRNFo0939ABy3oYLVXDGbdnlraqJBCYBFCROZqkBze49UxKFQc/5xFWzC8C7zHtbdzQXsWFSJhmCUvBk07nzoYPhegkThJLgg+CVDUWT/stAksRern4IP7TyTAbli/WMnshohbGpr578nfgVdANZSMJtD1JQIDBp8DTjo4DnTyiALkPPOVWhpB5+BAoxKtlgk4btItuQD7M35WhWvnS7FjWNu+FFT4FpDUO6xSm9xS6PPQpzljp/bn4lTERQsJnnr49X8y2DCcauvXfnfdkiZl9Y0lJUlHRQho3rZ72Nm2CnttNKXe+FrnHBoOTaRuGn2/zk0vSM5yBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 SJ0PR11MB5896.namprd11.prod.outlook.com (2603:10b6:a03:42c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.17; Sat, 18 Feb
 2023 17:31:46 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4cdb:78a7:917e:88e5]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4cdb:78a7:917e:88e5%9]) with mapi id 15.20.6111.018; Sat, 18 Feb 2023
 17:31:45 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v5 8/8] drm/i915/pxp: Enable PXP with MTL-GSC-CS
Thread-Topic: [PATCH v5 8/8] drm/i915/pxp: Enable PXP with MTL-GSC-CS
Thread-Index: AQHZQLy9+JDJxmVEIUSRKyxz9AOTbK7U/EKA
Date: Sat, 18 Feb 2023 17:31:45 +0000
Message-ID: <104363e0e8cebf18af47ab5dda0559cb69354fee.camel@intel.com>
References: <20230214213844.2890382-1-alan.previn.teres.alexis@intel.com>
 <20230214213844.2890382-9-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20230214213844.2890382-9-alan.previn.teres.alexis@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|SJ0PR11MB5896:EE_
x-ms-office365-filtering-correlation-id: a2ca03f0-0276-48c4-726d-08db11d601cd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Jup2F8jjLjpPqBrvNs7Gbv+g0RiAyBFUrs76w/XRf0+oWxI6sfpa6XR2xV0c3boedvBWVaQydPIJ+gmdmMdQ0PRUZECIkl/KAvPeE7NOntaBxBIoOFsDLFewEOy2gFqWxPZ1AM2+PhWBwPFuftwaRr7IiZKHKJtbBEcmSP6sQPYZxxxrEBZU7IXqpDiRW5RCv+EqFVXWvSl2OBTxvbr1vP7MtTk13bG3Bk1i8vi/50n+DtUFTnQMvDJOiUBqQlZANAOqyd4hgFdqWdqwwT1np6ga9huh+vqDJkN6dAQFz/J3Yz7VQ3Kw9kTU6RP/lufZQTS33l3C4vzbjvx/eO1TYFAyym4bGLth93e44vo4Wjaxl4h/UVTH6CeMhUuyH0rnLn/Y9wvaJjJYrGMVuBx6p+k3YRz6YsKnEdd+h3SU0fb7JUhsKLWfjr0dl+p9Op273Vcr2FifaZHKRUTPc4andnfU98FKAnKXltFWg3kQlrlsMWcPe7/Gee3NyntSwpuazZF0AinpvjVss97rJkdDolQOw4B5jzgcCHObLxlCWK8LGDOEruzs6QI80n1tXEJ0pMgP20D1tkGdypAALKFxzZ0c/Y/p/t4pNFyrsjDLVxhU+lOT5LBGuIXBDebO3rhVbmZe3h0mHKkih7HiyUylmmfHEytg5Qk3qDsTkredoxaEntV0EZQsaMLZxDSiJjZmE+6Jo1FQFxWBO3B7lUMpNQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(366004)(346002)(39860400002)(396003)(376002)(451199018)(38100700002)(122000001)(36756003)(316002)(54906003)(38070700005)(6486002)(82960400001)(478600001)(71200400001)(83380400001)(26005)(4326008)(186003)(6506007)(107886003)(6512007)(2616005)(4744005)(5660300002)(2906002)(8936002)(86362001)(6916009)(41300700001)(66446008)(8676002)(66556008)(91956017)(76116006)(66476007)(66946007)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OFF4Y1VlZ09SRUZ2MkpHSm1mVWN1cnBGczR5UVFmZWo5RUxwV1RUVFRNbGNT?=
 =?utf-8?B?bXJnUjZKcFJxbEMxM0Y1K2xaMW9Jb0NzcXhhMk9DR2tHSy9VZlA3NWZaYVFW?=
 =?utf-8?B?ckdidkZKVkdneEI4cW1sMlp5Z2IvcGFXcktFbTRzUjhpU2o3K3BHcDM2QVdo?=
 =?utf-8?B?VW82S1MvRWtFTzU4ZzRuRTFpMlA2blRJZXBLajhYb0xmcnArV2wyd2ttVFdF?=
 =?utf-8?B?d2JVZUp6eU94M1hjU0JaK05vbndqeDd3SGRJbXVTV3lWNG1kd2p1OGVaZ2M0?=
 =?utf-8?B?S1FzUkdlOFlBd2pMM3NKeWxtNWxyVnBhWDJjWk5vQ1RZb3hBaXhySXROUmI4?=
 =?utf-8?B?dkJvOGh4czcraVNueGtoS1FpKzhTbGdobnIxN1JqQTcySGtrbDhIVnN5VFJM?=
 =?utf-8?B?d0NGclo1RHR3KzFtb1l5cGZIM1Q5aTNycU5XZ1lGVTJiQytuRnlRMkcrRVEr?=
 =?utf-8?B?cDRiQzZxdUpYYUdlMDdmQ2paWVdoSyszN0taSWQ1NEVudTZEaXh6THZSdU5M?=
 =?utf-8?B?WUxuOWpwa2VLMXh3dTF1WE5aKzR1YkVpQ3IyNk9XRmN1dHFIQUJocjU5TSt4?=
 =?utf-8?B?Sm9vclI5YXoyQlBqVlNzZjRPNHNKdHZKQStlaDRIMEtPV0pSTEYzQTkvVkZo?=
 =?utf-8?B?T2hIN1cwYm1ZTDZEM2FZMHJQNUx6R2hUUzdaTkY2NlNuOEt0UjZ5UzlSQTYw?=
 =?utf-8?B?S0EvWGxxQ2VhUzg3eHVOVUpTY0V2K0RVdjE5dndKZFR0VFNaQ09aZHpDWm1y?=
 =?utf-8?B?ZEZDdGZoWXJQRUlZS1E4VUlZUnVEY2ZvTUtsNm1tQkhwWHZGQkZhWFpITmFN?=
 =?utf-8?B?M1FIbkM1cFhWTWJSTXk3RzR2RlUyZHZ4TlY2dFpybk9neW1pMmJjdmtYdDBr?=
 =?utf-8?B?NmZGd09jMkl4b0MrWGpLNktOV01CRlNvMGd4Nk45cVl4SjUxTi9abGR0MVVa?=
 =?utf-8?B?R2NGbStDZlBwa21PMWNxUEk0V3Z0OXdsZ2tlNy9ETlR2SWhhL2ZhV1VPQXBL?=
 =?utf-8?B?UUdSMlU4b0o4RnV0K0tjQ0pCR0lhQzdmUS9pQlBoLzd6MmdFSXkyMGNGSCtF?=
 =?utf-8?B?MlBwSWhVV3hVN0FKcWhTTXZyVzBJcFBnOFIzSUZsNmhBN1JMUW1lSGthUEph?=
 =?utf-8?B?dnNXTXRXRGlRYjlMU2pVZ2llQXU3V3NWTDd2dkR0S3lhSFptNVRoMzU5cVJu?=
 =?utf-8?B?dzAyT1oxMGVNZloyRUZiMGdNYzJ0U0xtNzNTcW5DUXYvV3RGWVJoejhjcnF3?=
 =?utf-8?B?VkZPOUhqQ2U4UFFXNTFjNnlUbysvLytxMTdIUlNjR2JyeGVCVHV3UWNhdXZI?=
 =?utf-8?B?WXNmeEYvUGhKd3dma2pBQUhjTzZ3TUZCTlg1dysxOFc5OUdhRzJtQ0pINlA2?=
 =?utf-8?B?anBFclpldXJvenN3VkFpYW02dVkwTlJDM2h6U282UmVjTmZFRTlNUmpDcEdq?=
 =?utf-8?B?VmdTakJHZEduNi8vejkxRmVEb1BvZlp1RkR4MDdOV1ViNW5YV2pnemtwcklZ?=
 =?utf-8?B?SU01ajBtTk83U0dZVTdWK2oxZmgvKytSZm0wMEc4a1Q2SjlzZEwxa2t1WGlN?=
 =?utf-8?B?blBsRUtUSWxySUlPc25BTXp1UEFlLzJVWVI2aTFGV2p3Z2pGVFlXT1ZVdFdr?=
 =?utf-8?B?VmNPVHMwQ0ZjNW1sdXhUR0tUVThLYzh3a1dMOWdvNlF0UkZzSExXRVNMbk4v?=
 =?utf-8?B?UENXY3JxeWFadE1lOEViR2Z2aDdrMEx1bzRMekpTVGdxL2dTUWlicTVFNFh4?=
 =?utf-8?B?MENTVWpkL2xXek9ReVc2cG1abjBFeUFab0tndkU4UVZBUkRFSi9TRmVYZkZ0?=
 =?utf-8?B?Z0RXWktVWUFrY3A2dEUyOWlpdUJPWkdYUWNGbzlxb2xCNmk3N0pFUmE0bm5s?=
 =?utf-8?B?OVFxT2RVKytXOUhobVNuWDlpcHVyd1J5UWdCK0lCWWZBNmlmSW1Ncjl2UDVD?=
 =?utf-8?B?ZWk3dXNTMFZMcmh1TjVUM2cvZ3h5V2d5V3dtSlJkVldlQkRPMFdjNk1tNzNI?=
 =?utf-8?B?Mnd4Ky9DSGxwRkZEY3RzMkc5dVJDQk85SEg1cmRxdE13Z0Z1NW0rbkFYei9B?=
 =?utf-8?B?dVVvMjgwU203Qkx4WVNMMHFDSVdWN0JHSzFtWHZNb2FFbG93UmhNN0h5N25h?=
 =?utf-8?B?U1B3ZW5OTCt3U2tleDJYOW1ORHBxaXl5SVYxeEtQK2N2YXhIa0FuQmkvVmp0?=
 =?utf-8?Q?7DQugdz+X1VIu2OXO+LPXIY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AF6CB52B54D4FD4396F800806B1E7A94@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2ca03f0-0276-48c4-726d-08db11d601cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2023 17:31:45.3503 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cFDD++EO/WgODl2HyZYkoZLl67FesisMHGinO6EbyFGHZSB+d2Es6tk9p5RFWQdnf2IyRnZla65mZbn+uCqeu3ESHyj9fFgQFPGpmR2FR1Xz0IdAQAbQA+/dAhtAdCzZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5896
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
Cc: "justonli@chromium.org" <justonli@chromium.org>, "Ceraolo Spurio,
 Daniele" <daniele.ceraolospurio@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIzLTAyLTE0IGF0IDEzOjM4IC0wODAwLCBUZXJlcyBBbGV4aXMsIEFsYW4gUHJl
dmluIHdyb3RlOg0KPiBFbmFibGUgUFhQIHdpdGggTVRMLUdTQy1DUzogYWRkIHRoZSBoYXNfcHhw
IGludG8gZGV2aWNlIGluZm8NCj4gYW5kIGluY3JlYXNlIHRoZSB0aW1lb3V0cyBmb3IgbmV3IEdT
Qy1DUyArIGZpcm13YXJlIHNwZWNzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQWxhbiBQcmV2aW4g
PGFsYW4ucHJldmluLnRlcmVzLmFsZXhpc0BpbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9n
cHUvZHJtL2k5MTUvaTkxNV9wY2kuYyAgICAgICAgICAgICAgfCAxICsNCj4gIGRyaXZlcnMvZ3B1
L2RybS9pOTE1L3B4cC9pbnRlbF9weHBfc2Vzc2lvbi5jIHwgMiArLQ0KPiAgMiBmaWxlcyBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQphbGFuOnNuaXANCj4gQEAg
LTQ0LDcgKzQ0LDcgQEAgc3RhdGljIGludCBweHBfd2FpdF9mb3Jfc2Vzc2lvbl9zdGF0ZShzdHJ1
Y3QgaW50ZWxfcHhwICpweHAsIHUzMiBpZCwgYm9vbCBpbl9wbGENCj4gIAkJCQkgICAgICBLQ1Jf
U0lQKHB4cC0+a2NyX2Jhc2UpLA0KPiAgCQkJCSAgICAgIG1hc2ssDQo+ICAJCQkJICAgICAgaW5f
cGxheSA/IG1hc2sgOiAwLA0KPiAtCQkJCSAgICAgIDEwMCk7DQo+ICsJCQkJICAgICAgMjUwKTsN
Cj4gIA0KPiAgCWludGVsX3J1bnRpbWVfcG1fcHV0KHVuY29yZS0+cnBtLCB3YWtlcmVmKTsNCj4g
IA0KSSBoYXZlIHRvIG1pcnJvciB0aGlzIHRpbWVvdXQgY2hhbmdlIG9uIHRoZSBweHAtZGVidWdm
cyBmb3IgZm9yY2VkIHRlYXJkb3duIHRlcm1pbmF0aW9uIChlbHNlIGl0IGltcGFjdHMgMyBvZiB0
aGUgaWd0LXB4cCB0ZXN0cykuDQo=
