Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6324688525
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 18:13:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F5AB10E4CE;
	Thu,  2 Feb 2023 17:13:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A17A210E4CE;
 Thu,  2 Feb 2023 17:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675358007; x=1706894007;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=wFC08M5Qk3L6qK57OwsjM3j/cZFCuvrGp60ahAUSe10=;
 b=SoKXp42a7Zlit5cjkzV1geDaBm5xDQCxnQswxJetC/2SEEwTKiak9+dc
 ayFcFq7LemAS0nuyh6HFj68G0Jewv6iQu2xV0zRp6Z9abuP4SIMkFIAXu
 v6r6dKZjZZlcq4KF10EQclAGFTDPPxJekYm5bUw8s8+jyQDtIzAvETB7c
 2FDdzUaqEQ2NaCdsF+oNSN6wMy/8RQeeAs5WH6e014gOMi7O5lsQP/S8W
 RWBK41Bev5lW6MplAVEmMnqzx6YqfvlOKNDgILg+Y2nQHgmeEWWtSz++p
 LC145DOQzb51fvnE+xAhSAr8AuLnQiyGrBde1cJTufNcg8MwI2gHvO2t3 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="330631392"
X-IronPort-AV: E=Sophos;i="5.97,268,1669104000"; d="scan'208";a="330631392"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 09:11:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="734005163"
X-IronPort-AV: E=Sophos;i="5.97,268,1669104000"; d="scan'208";a="734005163"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga004.fm.intel.com with ESMTP; 02 Feb 2023 09:11:15 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 2 Feb 2023 09:11:14 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 2 Feb 2023 09:11:14 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 2 Feb 2023 09:11:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=genbej9fqBvd7ex1bCEcJ1WmI0ukfy2MTtBNC/XRpeNIpid/BSc1a6EF7eCWzVw5Ry9YwML9Jj36oQs0u62Kl+8aB95krYn9X3eEaP0eVZgWiftorfBjfIE9MmEfBRtF34dXNNAmx3xXzR4djjHd2ntMGpFdNTj75/HRPpur61KLoQ17eJdnO4NoJqOiBMINMRS0rR2k7hA0OnLo4BTe/pPC9GAmc4xq5gAWwGbxwBZuGhrbfZ9YR0kfbruYb0IaFnzO6KTW9vCIwYoMoMO7P+/vrAHV5CS91QhxLq6OCB3+XHF1yoIqCvaN5OgNgTmCc4v1m3yVOwnplOpL6xsakg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wFC08M5Qk3L6qK57OwsjM3j/cZFCuvrGp60ahAUSe10=;
 b=YQ5eokKJv5wtZHAZSZsZo8iJ2/O/4dluQAe47sHXynBBBHNl8LpGG5DIViXSQvRzG95iPCNRIS88znhuNH+GMtgSgLRkAwTGc8z4BtYtxyGNe4jKNqH3U3DyXtNZivX8QwOn6eeEOGfEkAMeHQozkQKvy2D2wLAtQMVRVLL2QaF9A0kgkuxpPQ7y7U1iaS18rXGEcwMlbScubf8iLJEEj+Hw3sJDn6Mh5h8ycSP2/pIfZd8b4sfdposFTw9xyM6nR7wGtdN6hjSJO/LVLMZnCgfTX76ZuYhj0z5IsuqImaJCVw9T+7LBu23bSxbElSUpXj3HBI8Z1PewU1DpRGOLDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 BL3PR11MB6459.namprd11.prod.outlook.com (2603:10b6:208:3be::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.27; Thu, 2 Feb
 2023 17:11:07 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::8901:2af2:6e02:c95c]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::8901:2af2:6e02:c95c%4]) with mapi id 15.20.6043.033; Thu, 2 Feb 2023
 17:11:07 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/pxp: limit drm-errors or warnings on
 firmware API failures
Thread-Topic: [Intel-gfx] [PATCH] drm/i915/pxp: limit drm-errors or warnings
 on firmware API failures
Thread-Index: AQHZNt45xqWEDIp6dkiYP+ueQhn20K67VzaAgACNtwA=
Date: Thu, 2 Feb 2023 17:11:06 +0000
Message-ID: <c10f6fb43c64d3b2ea5b2767be7dbca1e8cac0dd.camel@intel.com>
References: <20230202081312.404394-1-alan.previn.teres.alexis@intel.com>
 <a459848d-00eb-fbe5-b729-5527a1da6e0f@linux.intel.com>
In-Reply-To: <a459848d-00eb-fbe5-b729-5527a1da6e0f@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|BL3PR11MB6459:EE_
x-ms-office365-filtering-correlation-id: f86453e1-d9fa-4509-e351-08db05407915
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +NP0UCK+co5Xecn2B+nci6B+iKwWXD8QpyR2I2GxcTJtAHU/dITIY9jN0R0Qs0s4sWyCr1NYG81t8HYtjfdAi0KRWcQb620NtGnZWqoBZOsjAwBbZj+7HS122D1oaQa6t0UQgXv7b5QlwWztI4zuwiLyVNxztyagrZ9Cn0DASB48PenaZQVY8OYR/QT+amrIoEOXEQ14bWeDMVhoyNh5E7YctOZVcryKt8WzxAtllU4NWXRPKZ8BOl40gpyRn8sapkdAg8qzx4YA99sY5+ys+i0PKb6mjA/WZY2O0ZQTbLwoTPtPzbGzxwKYmLM0QSTuFOGdS8ikQiHKy5k6gxO6xWB2/sNe8M5Ht/KBgO/PhxnfxAdHEzqMJREnWKhqhY+OTypGHXIXUG441Mnu/6Gn2lZ8qYogKrf/YDgwb9nxdpNkX3XEmf8dtRNOE6obrLggy0vZQ2Uu6iDI+wRR4uXdFEpAQDoAmesJRMIpiV7sUxFfwK1OEQfV12riX/Ul/kYEase9RxFXb2mQMO9ILVOvUYejoF3AoO2fXocka8Navjjja4VudalXcKELi7f8UZW1os1jBFidkC3CwBa+tooQ9wxWcY/Hz1Nr5ebbAxP/or5yjQnaJLgQ1dLEWcJzzjzFbr9pBB4Gip3VJ1/s6d1N1w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(136003)(39860400002)(346002)(376002)(366004)(451199018)(6506007)(38070700005)(26005)(71200400001)(186003)(110136005)(53546011)(316002)(86362001)(38100700002)(6486002)(966005)(122000001)(478600001)(82960400001)(64756008)(66446008)(4326008)(41300700001)(8676002)(36756003)(5660300002)(8936002)(66556008)(83380400001)(6512007)(91956017)(76116006)(66946007)(66476007)(2616005)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eFF0WWJrYjg1ckNRZmJ1dUtBUFR3TXN6ZEhlS3BkV0NjbEs2OHRiakw4L0xl?=
 =?utf-8?B?K0hmZExpUlFBMmp3THBqYjNQaHdWL3ovY2ErWDhQN0lMZ1hqMThwZEI4ZzFn?=
 =?utf-8?B?WFF1RUtKQ1g2SmJJSW1XZG1rTFQ1QmI0aXZkbDY3NkNGdndNajl1MzVMdHlG?=
 =?utf-8?B?UmZXUUo1dFlHNDZlMDRQbVVwc2xjOWlGYytleFJOeFRIUzVtUkZ5R3FHeU13?=
 =?utf-8?B?NEFlTERvc0huNHRxTzVWTmw0bW9Xc0FndTcxdHlmOFp4LzdUbkxYRG5RWUZt?=
 =?utf-8?B?Y3JJR1ZiNi9Wa1RSM1ZCQ1o3WHIwZjBtRExJVWVWaEJOelZ3dnVOVFhvZksz?=
 =?utf-8?B?U0V0NWFuRmFnWE9ES2NoRytNTGs0Rmsrck5Ka2FhMXo1N0xEaFVkYTFuZnpN?=
 =?utf-8?B?eDd6RmsyZzlvMkhzbWtSVTZNcHZ4M3dpYS9WTy84b05DQUxaY2hqZmU2SGt1?=
 =?utf-8?B?cUNrRklHY1ZIeFIwT0pUYU5kMCswc2lMbE01Qm5FQTVZbUVMeWF1Vzh2R1Js?=
 =?utf-8?B?ZlJTTE5vdXBodkErNEg1QXN3Qi9MT2hQeVIyais1S2VQdDFxYS9pZDg4Snlw?=
 =?utf-8?B?TFdqK2tmSGR3aHFtck4wWjBGZVlWNlA2VE5JdVhzRmpLdnlBU1BSK1kxc0lo?=
 =?utf-8?B?by9IdklHZVJpMTRTbWJRYStnd1JrZGRlUWZTNXRPb2NsTGlzYUNiSTdpUnpB?=
 =?utf-8?B?TXBVQ3NQYm8yN3Y4MnB3Q2RJODJOa3dJZkVoMytFTnIxNWR4YnZyWDZDQ241?=
 =?utf-8?B?bTc2emUxYmVRT2xhcVJBNVhHeHpPTkozRDczeitoeTBsZjlsdDBQVVdPckR6?=
 =?utf-8?B?MGhEa3gyNFRCeFhGY056Tk5kWURpNjF5YjVGSkxhQjJwUUFiSGpuRkdnMFI1?=
 =?utf-8?B?UXZTZ25UM25vQXlhbFdHVTVPbTFpRzRIRUtFZk83THF0T1Rmck1ySDIxbDRz?=
 =?utf-8?B?ZHBwL09wNU5YVGpnMW9ocnNUNkFBVUJlOENJclBDakJRMnBBY0M5NmFEK1BB?=
 =?utf-8?B?SldET25SY1YzMSsyb01JbVI3bi9BaEFnUHRSVnFDbTlTbVVxa0d2dmlPa1kw?=
 =?utf-8?B?Q3N1d21BYVlwaDRiT2xyUTluSFVuZWhjWGs1RUErTy9wM3lEOTJmbWY1cnRJ?=
 =?utf-8?B?Mk0vMEhaUkpLUHhpUlhhOWVoSkpNM1N1MkpPRGJQV0FKaEtCT1VCMzNVc2M2?=
 =?utf-8?B?THRXMzhsMURWTVVGeGhvK212cVlFRElSNEFkUS9TcXBJdmJYYlNwb0J3N0gr?=
 =?utf-8?B?YW9PQ0xZVjhEUzRxSkJSY3I5TjZ1UGdwbHFSTzVtNVhSUEJ5K2pFN20zeUFs?=
 =?utf-8?B?Z21wN0x4aUNKemRyaWx3MWdiZUxQVm13WWwzenpnVi8wUlRuU3VXSjIwUnBI?=
 =?utf-8?B?OE5LelBIeWY3anQyVTVURUNHZEYyWFVDUmFYeXBEcFNmN3h4eTNTdVg1QVU5?=
 =?utf-8?B?a3M3UGlaL2o2dDE1ellXTko3UWR2Vm9XOXdPaWszUDJmakpUTzkrRUxoY2hF?=
 =?utf-8?B?M1k1ZmtyUENjMTc3QWxWOEx6WS94RGtOdU5CRWk0SC9hTXlva1dMNitXd1E5?=
 =?utf-8?B?OStOVmsxQUlCWUtRVVo5TC9SM0xpRjc0cjRVUXNKNDdCenBEZVNod1FPQ3hl?=
 =?utf-8?B?NE1CdU12ZGlBTE5uK0doeUZZbnZKUVVOcnBZREpjTG5Dd05JZVJacW9DRkpZ?=
 =?utf-8?B?WGlHenhZWWFoeVJNRGUwVk9DbVAwUGdDY1NMamJOY1ZDMExqSHcvL0wrK3ZG?=
 =?utf-8?B?N3phUlhCU3NJbDZ2OE5PNTUzOXNSWmZ2QW1NUzlwUDRJYTQ2aGtyaUJEOHo5?=
 =?utf-8?B?bDM5UHlUaTAwVVpSaWNJNEM0VzhFT2NVdXc2RHBodno2aUVGbjNqY3dvT21u?=
 =?utf-8?B?ZmV6QUY2bmpjZVh5N0czdUMwTTRscUJhQlFBT0o5L3F5WEo3ZHdPbUxKRmhM?=
 =?utf-8?B?QThFMkdWaE9XNVVNaG8rczVXMGo4dCt5bGtxSjY4WEV5VHlXVytwcm4vQ3dP?=
 =?utf-8?B?S0VaVU5yRVpUNkRkOXZDbjVxVHE0SFJrck5vMU52M05abjg1dzQ4SkZRaTI4?=
 =?utf-8?B?aURhL3N1eTJHbDZYSGhYYVhDZytTVkk1RkxIWUMwOFV2ODFSRTBhL1h0dnNy?=
 =?utf-8?B?M2R4c2tKbUZBTlphaUxGR3d6RkFwRDUwVklrZXA3K20xU3lyTDF0enEvZXNv?=
 =?utf-8?Q?y7P/dg+Ie2Z1ZsRkJQsu+lk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A876CE9202ED144E823655E78E6C8700@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f86453e1-d9fa-4509-e351-08db05407915
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2023 17:11:06.9955 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Cr3ee/rdVZm78GC6EXPdtjwI8nSPMJSCy+5zyxUQYng9ksMzzdh1ENr5BWNV/x64eregfBzde+8Pqe7miQelFQvlhW/TrMWK/MLPllsmPHIi/UsKNhsszzQwdGi8D5Us
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6459
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

T24gVGh1LCAyMDIzLTAyLTAyIGF0IDA4OjQzICswMDAwLCBUdnJ0a28gVXJzdWxpbiB3cm90ZToN
Cj4gDQo+IE9uIDAyLzAyLzIwMjMgMDg6MTMsIEFsYW4gUHJldmluIHdyb3RlOg0KPiA+IE1FU0Eg
ZHJpdmVyIGlzIGNyZWF0aW5nIHByb3RlY3RlZCBjb250ZXh0IG9uIGV2ZXJ5IGRyaXZlciBoYW5k
bGUNCj4gPiBpbml0aWFsaXphdGlvbiB0byBxdWVyeSBjYXBzIGJpdCBmb3IgYXBwLiBTbyB3aGVu
IHJ1bm5pbmcgQ0kgdGVzdHMsDQo+ID4gdGhleSBhcmUgb2JzZXJ2aW5nIGh1bmRyZWRzIG9mIGRy
bV9lcnJvcnMgd2hlbiBlbmFibGluZyBQWFANCj4gPiBpbiAuY29uZmlnIGJ1dCB1c2luZyBTT0Mg
b3IgQklPUyBjb25maWd1cmF0aW9uIHRoYXQgY2Fubm90IHN1cHBvcnQNCj4gPiBQWFAgc2Vzc2lv
bnMuDQo+ID4gDQo+ID4gVXBkYXRlIGVycm9yIGhhbmRsaW5nIGNvZGVzIHRvIGJlIG1vcmUgc2Vs
ZWN0aXZlIG9uIHdoaWNoIGVycm9ycw0KPiA+IGFyZSByZXBvcnRlZCBhcyBkcm1fZXJyb3IgdnMg
ZHJtX1dBUk5fT05DRSB2cyBkcm1fZGVidWcuDQo+ID4gRG9uJ3QgY29tcGxldGVseSByZW1vdmUg
YWxsIEZXIGVycm9yIHJlcGxpZXMgKGF0IGxlYXN0IGtlZXAgdGhlbQ0KPiA+IGJ1dCB1c2UgZHJt
X2RlYnVnKSBvciBlbHNlIGN1c29tZXJzIHRoYXQgcmVhbGx5IG5lZWRzIHRvIGtub3cgdGhhdA0K
PiA+IGNvbnRlbnQgcHJvdGVjdGlvbiBmYWlsZWQgd29uJ3QgYmUgYXdhcmUgb2YgaXQgd2hlbiBk
ZWJ1Z2dpbmcuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogQWxhbiBQcmV2aW4gPGFsYW4ucHJl
dmluLnRlcmVzLmFsZXhpc0BpbnRlbC5jb20+DQo+IA0KPiBIb3cgZG9lcyB0aGlzIHJlbGF0ZSB0
byBiNzYyNzg3YmY3NjcgKCJkcm0vaTkxNS9weHA6IFVzZSBkcm1fZGJnIGlmIGFyYiANCj4gc2Vz
c2lvbiBmYWlsZWQgZHVlIHRvIGZ3IHZlcnNpb24iKSB3aGljaCBJIHRob3VnaHQgd2FzIGFscmVh
ZHkgZml4aW5nIA0KPiB0aGUgZHJtX2Vycm9yIHNwYW0gY2F1c2VkIGJ5IHVzZXJzcGFjZSBwcm9i
aW5nPw0KPiANCkdvb2QgcXVlc3Rpb24uIFRoYXQgcHJldmlvdXMgZXJyb3Igd2FzIHNwZWNpZmlj
IHRvIGEgYm9hcmQgdGhhdCB3YXMgdXNpbmcNCm91dGRhdGVkIGZpcm13YXJlIHZlcnNpb24gdGhh
dCByZWFsbHkgbmVlZGVkIHRvIGJlIHVwZ3JhZGVkLg0KQXQgdGhhdCBwb2ludCBpIHdhc24ndCBh
d2FyZSBvZiB0aGUgdGhlIGZhY3QgdGhhdCBNRVNBIHdhcyBzZWVpbmcNCmhpZ2ggZnJlcXVlbmN5
IG9mIHRoaXMgZmFpbHVyZSB0aGF0IGlzIHRpZWQgdG8gcGxhdGZvcm0gaXNzdWVzDQooQklPUyBj
b25maWd1cmF0aW9uIC8gU09DIGZ1c2luZykuIEFsc28sIGkgYmVsaWV2ZSBpbiB0aGUgcHJpb3Ig
Y2FzZQ0KUFhQIHdhcyBub3QgZW5hYmxlZCBieSBkZWZhdWx0IHRoZSAuY29uZmlnIGluIGFsbCB0
ZXN0aW5nLg0KDQpJbiB0aGlzIGxhdGVzdCByZXBvcnRlZCBidWcgKGkgcmVhbGl6ZWQgaSBmb3Jn
b3QgdG8gaW5jbHVkZSB0aGUgYnVnIG5vLiBmb3IgdGhpcw0KbmV3IHBhdGNoIC0gaHR0cHM6Ly9n
aXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9pbnRlbC8tL2lzc3Vlcy83NzA2I25vdGVfMTc0Njk1
MiksDQppIHdhcyBpbmZvcm1lZCB0aGF0IFBYUCBpcyBiZWluZyBlbmFibGVkIGJ5IGRlZmF1bHQg
YW5kIHRoZXJlDQp3ZXJlIERVVCBoYXJkd2FyZSB0aGF0IHdhcyBub3QgUFhQLWNhcGFibGUgKFNP
QyBmdXNpbmcgLyBCSU9TIGNvbmZpZykuDQoNClNvIHdpdGggdGhpcyBwYXRjaCwgaSBhbSB0cnlp
bmcgdG8gYmFsYW5jZSBiZXR3ZWVuIGlzc3VlcyB0aGF0IGlzIGNyaXRpY2FsDQpidXQgYXJlIHJv
b3QtY2F1c2VkIGZyb20gSFcvcGxhdGZvcm0gZ2FwcyAobG91ZGVyIGRybS13YXJuIC0gYnV0IGp1
c3QgT05DRSkNCnZzIG90aGVyIGNhc2VzIHdoZXJlIGl0IGNvdWxkIGFsc28gY29tZSBmcm9tIGh3
L3N3IHN0YXRlIG1hY2hpbmUgKHdoaWNoIGNhbm5vdA0KYmUgYSBXQVJCX09OQ0UgbWVzc2FnZSBz
aW5jZSBpdCBjYW4gb2NjdXIgZHVlIHRvIHJ1bnRpbWUgb3BlcmF0aW9uIGV2ZW50cykuDQoNCk9u
ZSB0aGluZyB0byBub3RlOiBpIGFtIHB1c2hpbmctZm9yIC8gd2FpdGluZy1vbiBvdXIgZmlybXdh
cmUgdGVhbSB0byBnZXQNCmJsZXNzaW5nIG9uIG1vcmUgZnctZXJyb3ItY29kZSB0byBlcnJvci1z
dHJpbmcgdHJhbnNsYXRpb25zIHRoYXQgY2FuIGJlIGFsbG93ZWQNCnVwc3RyZWFtIHdoaWNoIGlz
IHdoeSBpIGFkZGVkIHRoZSAicHhwX2Z3X2Vycl90b19zdHJpbmciIGFuZCBhIHNpbmdsZSANCiJk
cm1fZGJnIiBzbyB0aGF0IGluIGZ1dHVyZSwgd2UgZG9uJ3QgaGF2ZSB0byBrZWVwIGFkZGluZyBh
IHdob2xlIG5ldyBsaW5lcyBvZg0KY29kZSB0byBtdWx0aXBsZSBmdW5jdGlvbnMgYnV0IGp1c3Qg
b25lIG5ldyBlcnJvciBjb2RlIHRyYW5zbGF0aW9uIC0gYW5kIGluc3RlYWQNCmp1c3QgYWRkIHRo
ZSBuZXcgZXJyLWNvZGUtdG8tc3RyaW5nIGVudHJ5IGludG8gYSBzaW5nbGUgbG9jYXRpb24uDQoN
Cm5vdGU6IGkgd2lsbCByZS1yZXYgd2l0aCB0aGUgYnVnIGlkLg0K
