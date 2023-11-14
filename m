Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0E17EB6E8
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 20:34:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2692710E232;
	Tue, 14 Nov 2023 19:34:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8432010E232;
 Tue, 14 Nov 2023 19:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699990477; x=1731526477;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=dMmWyiKzXxNo/WacBZnRdWaN/AK2nnJHN404fhD6eoQ=;
 b=ixmwmz1aOJwrbey2Wy1SylAFD9dewdnRV+ld2bJVA+rI6635Sgf/cTub
 2Ud8tNhRe3+iyynx5FXTBi7XmuWL3o7vzMALaBDkF9y4woAa7Rds1A6NQ
 gc2SlTVZjmioqhJ6A6gXhf8TjAXvLtCeNfHEiKdpcqoylf64mwuJaFdWi
 8eR6KWYrHR5UOmNCUJnkro/L0DMTMugWMxAdLOHIzchXSVcB+0xInt00H
 epCFymkxp0j+EELwD5BeWhi+tqyZkKOLtVvpzQw8laG5BQCumJ9qyA0Na
 2mPXdwSLgNDvcXack1fuj83uW+QoZSxoMWunQSSaDxh4xjiz5PcVQI4Zq w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="387897214"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="387897214"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 11:34:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="758259168"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="758259168"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 11:34:36 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 11:34:35 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 11:34:35 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 11:34:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gWc4nYF4iuWiKNI0Qz7dtlmVwnxiCiT0S29b/GlMeSpX5xueIMTN79tkQriPspFqLAECNnGlm0ZYkQthfipqVaMD9VcdQ5/syUCxk5d+WhZkpcgHpCNTaIYDiwsmUV4qJlZ7YaJ4X913l8GlF5FgsC+X6l9Ac4uJNpHPnlx2r+F0SfDqnm37RhcmYtJGjyRliZ3HyOU0h3qCOWEFqf5zONd2hUnzmoMMMZzTGvZp/A6u7+tl6baO1b5mgTnZd/d6gssIH4FbeTX/d2BAf5ZKx5I3hcnikI2jGFhqukMsuM5R0oBNt03pIytanrOoFR5GJMSVT38JctFONMyoTlf/1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dMmWyiKzXxNo/WacBZnRdWaN/AK2nnJHN404fhD6eoQ=;
 b=Ul7OMgB1uvCCE7VsFWcBK1Q1x9X2IpNScuHU/P60O38EqpCI/bijGNCDpvQt8MdA2MPmx3Ngco9wPiRw76gX1FwFkerHT92aV7hRq3+i8FbuKKTvPB/mY9s5EJhnIIVcug2qZ1R3X8lrFlxb5adlVCRPnGYFWNHDZL8mGRJA/8g+2OGlmUUsJdHRSDNf/mb+a2oMvBR5XXn6IXwSiyqfHQHiuV6BqoH2l8CMU9KCykf+7yhZcpqItXtZ33AVFhoq0yaJJvJRx4d4qp5880QvFTgkxxV6gJF8aSRuMUWA9OAJwvxub/XVLsMfXJH8vT6w3FoPlJyrWhH8+8WxrOK6FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 DS7PR11MB6014.namprd11.prod.outlook.com (2603:10b6:8:73::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.31; Tue, 14 Nov 2023 19:34:34 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::d070:1879:5b04:5f57]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::d070:1879:5b04:5f57%4]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 19:34:34 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "tvrtko.ursulin@linux.intel.com"
 <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v4 3/3] drm/i915/gt: Timeout when waiting for
 idle in suspending
Thread-Topic: [Intel-gfx] [PATCH v4 3/3] drm/i915/gt: Timeout when waiting for
 idle in suspending
Thread-Index: AQHZ8Kx2E7YYzy1lTkO6NJtn5NHgRrAuYVuAgAB+x4CAAVIIAIAJxYEAgCCs+QCAHi+1gIABifAAgAACoYCAACDqgA==
Date: Tue, 14 Nov 2023 19:34:33 +0000
Message-ID: <4601886874ebdcfae2b7b4ef776348b9998e4f78.camel@intel.com>
References: <20230926190518.105393-1-alan.previn.teres.alexis@intel.com>
 <20230926190518.105393-4-alan.previn.teres.alexis@intel.com>
 <9ca17c5c-7bb4-ff6b-69cb-3983299729c1@linux.intel.com>
 <123edf6b37aa982de20279d64c213156a2dc8c2e.camel@intel.com>
 <fad657e7-beec-75fc-9003-5883412d6e6b@linux.intel.com>
 <0c1e1e713fc46bf0783ca6e0a72a39d6671a6b57.camel@intel.com>
 <ace7375e-d9a8-4b6f-aa92-6360ca3bfa96@linux.intel.com>
 <16068beebe0fdac5aabd83816fd25367f5170c24.camel@intel.com>
 <eeded970-cee7-420c-9b34-26ea9d78e420@linux.intel.com>
 <ZVOwK90yt1gRz3EL@intel.com>
In-Reply-To: <ZVOwK90yt1gRz3EL@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.50.0-1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|DS7PR11MB6014:EE_
x-ms-office365-filtering-correlation-id: 928391e1-1e36-4ed8-2d49-08dbe548baf0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5UIKbauA1HaZQd4M7slx0po81fnIJ/UpzlNPJQNtXXUCAixo47s5oQqcm81d9LT43DnCe1NszYQ8IDXtc3h5ZtehQYP9PDcKq3Z71Fv3jMxVuq7lsSCJfjx7FqJeaC+cNZ4EbaSKth8n7Xs1r9vyByVXTR/8wqMfpX8O8zISfpE2SuucyGZh+2ffVp36MJP9T5ZHWssKNaXRUh8hvUd12nIM2X65FNOcgYaWcaPMJUKuGcsGzREYLbYTc1ihGKS1itCfXjgiTNQtzVgtSveARmUWzR53GSxreQRLiTpZ/2NCdlbhscwGUBKA8JKmAb6HHtPdSl5cvATd/bmVLM6IinsL8XUCcjOy6OZyxGU2NzYbKbLtvvnJYwV/d19woGPtlpO35vdNvzbjPbkxZI6e0+VOd6wwZyKkcULPe0YKK+Gev6jrQ1cI1Cy2yKxjbQb97axSttNWBQUtebcNU/zJOJh/u9byZJILV+ZSWhaEDr34MGCCevTlnUULJZj502t7Wlo1uKTrDIlmOVT/oU7nQEqyKYSLnuLVA61crw3cqUjzr1i5mWy+8wJ8EB81b9wesAM94VOPNM/Y6aSvnfZXNwxKuTTEUsdbt0EZC0G/sK4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(376002)(346002)(396003)(39860400002)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(53546011)(6506007)(41300700001)(478600001)(6486002)(966005)(71200400001)(8676002)(8936002)(4326008)(316002)(66556008)(66446008)(110136005)(91956017)(66476007)(64756008)(76116006)(54906003)(66946007)(6512007)(5660300002)(2616005)(15650500001)(4001150100001)(26005)(83380400001)(38070700009)(2906002)(122000001)(86362001)(36756003)(38100700002)(82960400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?emNIeWxtU0JaeVd4T3pxZ2RRY0EzdHc4KzF3czBJT1FPbHVOb3ZYUTA5T2J4?=
 =?utf-8?B?V2lXazVvQWFVVVZWWHFCVGtvYTQ0bVoxRGJBZ0oySHU0dTJXOTl2WDJwaGdo?=
 =?utf-8?B?d0FwZTR6YUl2SjZkbFltZVNrdndUOXBSRm42aHgyV0xmWll1TGlRbDFDbUhJ?=
 =?utf-8?B?UCtIKytJVXVuVElxOFhjTTgrTkJaczZpU1E0WUhLakdmaFVZbUV6RFNYMnhj?=
 =?utf-8?B?Mjh2cVZNVTRDbi9QVWF1bkx0UWJOUW9NK1M2VG8wYUpJTHd1OFBRRldRbmJo?=
 =?utf-8?B?WE5SL2k3aXd6NVpRZmJTZVJCYVF5cEtRMzQzZUg4SWRNdndaSGpVWGV0VHQr?=
 =?utf-8?B?UnJ4a3pMcnVGZnhodDUralFPR1RZL3VoODkvWXZYVmE1R0NFY3JwL1MvcXg2?=
 =?utf-8?B?NlUwZnlZbVN6TXBMNm12M2dWV1U3dzdpdDlBRjQ2K2x0QXFrMG5NWFNDeGY1?=
 =?utf-8?B?U1hpUHlwZHZsb2pIUEluekE4aUZjL3VuWTYwU3lSdVZETUVpQXIrdGc0OUlu?=
 =?utf-8?B?VUdPbmhoNG9OVGZjdDRxRHJDcysrcUZlQjVjMlIwTm0wdjhMNlVqOTZLbXBq?=
 =?utf-8?B?YW55TkRpdTlHaytPMmt4T29nZitTbzVhYWtld3VtMUdhcEdpdjlJTlA2N0Iz?=
 =?utf-8?B?QjVEUVAxWUFvMW1UaE5hSWZ6RWNPTlBBMHFQb0QyQU1LNkU4ejAyMTQvakZI?=
 =?utf-8?B?OFJ2NWVLNnBlVGg0bUd5UGZ1cWtaKzZ6bk1jdDRjRlJnMXFoTjRyaDFxcWE2?=
 =?utf-8?B?ZmxTZWwzVm9YQjJ3R3hMeDE0aldrcnBIeG9WeDBZa0d6OStLL0xKNDhVb0tK?=
 =?utf-8?B?d1dEWDNNUys2Tndpd05tY2dydGs2VGhMUGpMSkh0akpIcnA1N29wL2t6SWp1?=
 =?utf-8?B?SWJzL2E2TDFlOTV6TWdRRWdkeXNCNzhwNFRHNjc3eGJzM1FsVmtYMTErNGVj?=
 =?utf-8?B?YmJKNGRNaDZwQjZKNk9sdXI2YmZUMFFsTHdFSGtwMkhJUUFLSXJGRDhGZit2?=
 =?utf-8?B?eXpVZ0pwbWFaYSt5Rks5RWNKK0V3Nkk4WmFkUXo4S0dHMUVRWGhDenhxanFt?=
 =?utf-8?B?UnhwRGlhQ0pzeFlqN01uNFhjQWt6SHkvMjIyay93aTBLT3lielk4dTFQZmw0?=
 =?utf-8?B?RUVVUXhyc09IcTd1ZUkzYWp1QzNqM0ZCcmcvWEpER3BOcllmWXBQaUtVWnZi?=
 =?utf-8?B?RzdHVTFNdDVSYU1mRExhV2ZqSmVGM1pNYmptMzlqMnNUM2x6L21ueERVQXI3?=
 =?utf-8?B?bDl6UTc0NTZ0UG0yOVREVkxrNXZBYStKMkY4emhySVBnUEprNmZnU21Lb2NT?=
 =?utf-8?B?NjJRV2x2YmZtUmRQcVI0NWExREE0Q1B1MFNwSUVEM2p6V3ZKOXFnRmx3OE4y?=
 =?utf-8?B?dVdBcmRlbUc4YkduUjg5bFdKbmdqaHdsNG5aT1Q2WkhibGppUlFFdzJhd3Fj?=
 =?utf-8?B?eWpmSnREWWYzN1ZYVURZTXg4ZGlncHZqOWxpeEJIZFNqaCt0ZHM3M1NhS0NB?=
 =?utf-8?B?MktLN20vd2NMWHpFS2xQcFUvZ0wyQXNpZy93dlVLSnNJdDdUVEVtOUFDZk51?=
 =?utf-8?B?Z2NxNjRxbk00MVJnNUtGcDZsZS96cEJsalYwb2FaZVoxNUp4N2MwdVVRb1dv?=
 =?utf-8?B?MFB0ZnhGL3l5RUp6TjNxVVMxeTNnUzZxUEEwRmNJU1dVM084dkF0ODdna1p3?=
 =?utf-8?B?cFFFdndJaXYwVnJsTE56MGdUbWhKTWp6VENJQU9yaGkrYldibkdIbkkxaCtw?=
 =?utf-8?B?K0ZFUTJ3WkRmTTAwbTdVa2VmWXBOSk5nV2ZGRTkwV2Z4cWNkSGNMcG9abzRE?=
 =?utf-8?B?QTNndkhuY3VReUN5bGVob25paTgvMGRZeDN6bXZib1Y2Z3F1SzArVXFtajU2?=
 =?utf-8?B?YXRNdEJZd3hrWm1BditQYjArUFZOeGg1MUN3REJWUVJocWE1ZnFucERjdUMw?=
 =?utf-8?B?MU52Zjgrc2VMRVVqQ1BuNU9UNVVEUSsvTGFtalVZU3dMSGlyUWVzUVNyNi9u?=
 =?utf-8?B?T0h6QlZjTWZoNUtxUmlLc3BhcGt3L1F6Yml2cUpvSHFXSmErUHMrdVFGa3R5?=
 =?utf-8?B?Q1NmbzM0SUJmWlBxWXNFdUN5WlJHT3dSTXJvZUx4dWd4Ry9BNUx5aUl1ZE1m?=
 =?utf-8?B?V1VTRzFlSUkvTTRBTGRLU01HK1dCNXdGZFRxNEw1NlRBOVhLSk1MQVB0Ykdz?=
 =?utf-8?Q?nhHBQwpj1yIZ3BKTPB2VE7E=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CC14D23D36D88A4F85EEB4500016A445@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 928391e1-1e36-4ed8-2d49-08dbe548baf0
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2023 19:34:33.9258 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7hUTE1S1V+uFUJ53U2XXftgnfCBNoSTCjvCd8ORGJSxNMB19g+3Bh6tydwv+tU7hHEH85LxiP89S3bk4kvpkAac1mnGllbzVtAHILmv2Xzq080oEi20fKyG2CgZbiDO6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6014
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Jana,
 Mousumi" <mousumi.jana@intel.com>,
 "intel.com@freedesktop.org" <intel.com@freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIzLTExLTE0IGF0IDEyOjM2IC0wNTAwLCBWaXZpLCBSb2RyaWdvIHdyb3RlOg0K
PiBPbiBUdWUsIE5vdiAxNCwgMjAyMyBhdCAwNToyNzoxOFBNICswMDAwLCBUdnJ0a28gVXJzdWxp
biB3cm90ZToNCj4gPiANCj4gPiBPbiAxMy8xMS8yMDIzIDE3OjU3LCBUZXJlcyBBbGV4aXMsIEFs
YW4gUHJldmluIHdyb3RlOg0KPiA+ID4gT24gV2VkLCAyMDIzLTEwLTI1IGF0IDEzOjU4ICswMTAw
LCBUdnJ0a28gVXJzdWxpbiB3cm90ZToNCj4gPiA+ID4gT24gMDQvMTAvMjAyMyAxODo1OSwgVGVy
ZXMgQWxleGlzLCBBbGFuIFByZXZpbiB3cm90ZToNCj4gPiA+ID4gPiBPbiBUaHUsIDIwMjMtMDkt
MjggYXQgMTM6NDYgKzAxMDAsIFR2cnRrbyBVcnN1bGluIHdyb3RlOg0KPiA+ID4gPiA+ID4gT24g
MjcvMDkvMjAyMyAxNzozNiwgVGVyZXMgQWxleGlzLCBBbGFuIFByZXZpbiB3cm90ZToNCj4gDQo+
IFRoYXQncyBhIGdvb2QgcG9pbnQuDQo+IFdlbGwsIGN1cnJlbnQgY29kZSBpcyBhbHJlYWR5IGJh
ZCBhbmQgYnVnZ3kgb24gc3VzcGVuZC1yZXN1bWUuIFdlIGNvdWxkIGdldA0KPiBzdXNwZW5kIHN0
dWNrIGZvcmV2ZXIgd2l0aG91dCBhbnkgY2x1ZSBvZiB3aGF0IGhhcHBlbmVkLg0KPiBBdCBsZWFz
dCB0aGUgcHJvcG9zZWQgcGF0Y2ggYWRkIHNvbWUgZ3Rfd2Fybi4gQnV0LCB5ZXMsIHRoZSByaWdo
dCB0aGluZw0KPiB0byBkbyBzaG91bGQgYmUgZW50aXJlbHkgYWJvcnQgdGhlIHN1c3BlbmQgaW4g
Y2FzZSBvZiB0aW1lb3V0LCBiZXNpZGVzIHRoZQ0KPiBndF93YXJuLg0KYWxhbjogeWVzIC0gdGhh
dHMgd2FzIHRoZSB3aG9sZSBpZGVhIGZvciBQYXRjaCAjMy4gT25seSBhZnRlciBwdXR0aW5nIHN1
Y2gNCmNvZGUgZGlkIHdlIGhhdmUgbXVjaCBiZXR0ZXIgZGVidWdnYWJpbGl0eSBvbiByZWFsIHdv
cmxkIHByb2R1Y3Rpb24gcGxhdGZvcm1zDQorIGNvbmZpZyB0aGF0IG1heSBub3QgaGF2ZSBzZXJp
YWwtcG9ydCBvciByYW1vb3BzLWR1bXAgYnkgZGVmYXVsdC4NCg0KQnR3LCBhcyBwZXIgcHJldmlv
dXMgY29tbWVudHMgYnkgVHZydGtvIC0gd2hpY2ggaSBhZ3JlZWQgd2l0aCwgSSBoYXZlDQptb3Zl
ZCB0aGlzIG9uZSBzaW5nbGUgcGF0Y2ggaW50byBhIHNlcGFyYXRlIHBhdGNoIG9uIGl0cyBvd24u
DQpTZWUgaGVyZTogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xMjY0
MTQvDQooSSBhbHNvIG1haW50YWluZWQgdGhlIFJCIGZyb20geW91IFJvZHJpZ28gYmVjYXVzZSB0
aGUgcGF0Y2ggZGlkIG5vdCBjaGFuZ2VkKS4NCkFuZCB5ZXMsIHRoZSBndF93YXJuIGlzIHN0aWxs
IGluIHBsYWNlIDopDQo=
