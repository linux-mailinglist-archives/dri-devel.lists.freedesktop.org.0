Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DE7716D33
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 21:08:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4589810E0FC;
	Tue, 30 May 2023 19:08:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C146310E0FC;
 Tue, 30 May 2023 19:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685473713; x=1717009713;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=C35Vkhl0AGVCS95ZbYWfUqOjXMnVsCJGtwi1oIahTBc=;
 b=XDGH2E2nYDSpAmn9Bzgx7u5bAnXxEgq0r64FJrK9u0DTogBat4qr6iBJ
 EFGsk8pSDZMbZC6tTeNGWZnx5vJAfCXwreDDa8cKheW+Ds4VxsMTJGyei
 l352S6zZMYptBP8HTVuHBfVUqNWnUbI2Fr1ul+sRuQSxr8inb1HJo2ZUE
 IM04VPIGeI71aUn61m7FaLWahtVsrk4ER9MwcT/MQh13fKTBmfAMsVNOt
 VLl31Iy0BU2UblxI3w9/cOWBRPol0cNaD5pgfyVQNLuzFk3oCUPaKiYJK
 DvtC6MLGoYsnNy6YVVub/tTCxkJUd9+hXtiQGZj8lD93cCmf7HcLWg/HH A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="352519115"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="352519115"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 12:08:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="771679891"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="771679891"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP; 30 May 2023 12:08:32 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 30 May 2023 12:08:32 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 30 May 2023 12:08:31 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 30 May 2023 12:08:31 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 30 May 2023 12:08:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DK9vmtNTCdYXStYyBePZfXC63ZcIFisEtoFGupE4XJEG6VJSo4AuJ+vk3D0cz0lGtPiLRVisNPyVw5bt1d0QFw9iJhdROvgPypa0jcwJNFfnUq8yEq0gDR9ADEudToucMKmwPB8N50eOO5+anQ8FOwvs6t0BbMtP8NgFoKI0zF/YK2G3OCwtI8VKem8hjWP54U4cfwV+p+2ocPDpAQ1jYzxGCECMZICd48qfHRaG4V+v0N0WY01m775/yfs39Vk8/c8mcvct/BsHxblBA1XkzrTNO1FQsnYfJhwXID/Mwdt16LPnnoj7JeMFClx1IO/w+iNfKymyJjGW6QAkYHjwYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C35Vkhl0AGVCS95ZbYWfUqOjXMnVsCJGtwi1oIahTBc=;
 b=gnnDkA9R1Wj+q0yXGx0sZYbCPhn77BcIIptr6IcAkchXN7Iw2ls132UfUIq47gGZ5ZE/19CZMPX1sx3LWAV/FJLpDAvVi+5KbwInKuUHMtuFJCsJSMe2cqk87i6z5NNaeCuLgYfsJWlzrAw6VrdkVZINvd4TlPFWTN61p622imSoDmW71oQUkFLRuO16UuQhjafy4u9Hz8pNGOaWsxqPFhE7/PdaI5Do8oUPJV5gi3td+QwvneZ0t7Gor+YRidZm4z4pKPS8eD0sDMq9rFbraF/fvuXBO9HawxynQz/nfcys+f0jNAvVa0B6MX1UTPPmhujwOGA1zTic56nA0/pxTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB2567.namprd11.prod.outlook.com (2603:10b6:a02:c5::32)
 by CY8PR11MB7361.namprd11.prod.outlook.com (2603:10b6:930:84::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 19:08:28 +0000
Received: from BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::8ec1:2f24:6309:c008]) by BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::8ec1:2f24:6309:c008%3]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 19:08:28 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: Nathan Chancellor <nathan@kernel.org>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>
Subject: RE: [PATCH 2/2] drm/i915/gt: Fix parameter in
 gmch_ggtt_insert_{entries,page}()
Thread-Topic: [PATCH 2/2] drm/i915/gt: Fix parameter in
 gmch_ggtt_insert_{entries,page}()
Thread-Index: AQHZkyQdMixrfatcwE2NiKIrA7ApTa9zLTSQ
Date: Tue, 30 May 2023 19:08:28 +0000
Message-ID: <BYAPR11MB2567202F9CA1A2725F19BB639A4B9@BYAPR11MB2567.namprd11.prod.outlook.com>
References: <20230530-i915-gt-cache_level-wincompatible-function-pointer-types-strict-v1-0-54501d598229@kernel.org>
 <20230530-i915-gt-cache_level-wincompatible-function-pointer-types-strict-v1-2-54501d598229@kernel.org>
In-Reply-To: <20230530-i915-gt-cache_level-wincompatible-function-pointer-types-strict-v1-2-54501d598229@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB2567:EE_|CY8PR11MB7361:EE_
x-ms-office365-filtering-correlation-id: 76fd5dde-1937-4053-3540-08db6141407e
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AoCdCrQPMA1otXBS90IpmICzIfCJ9o2Z61xbO//GRf3kS7xM9de2TB79gxi6iQV4/qv1z/ZWUZneH353yjLT5CD4l51xAKgejkgU1Sex4TgNNyc87hLbaexeJvEU99jAsIN+2uLREwWvXAE7/i7rMKfTwOu3QHoxoJMk+LX+dmTIkfGvRN4mKzo5OhLPRpsnnWox7mXb6A4kmOssyfv9EHwW7EkM4ZSJnfJK9sCcZx6uuUCmtpkgCXzBQKYbGdN90nkBfWyiZkqdEsB+DDwuP0I5sD/KxbIVTlTqL0oA9kf06pZ2HCBgAg62++jjEpJvKh2gcv5dhNrZ3AHiGs6RX9dpC9rKpzpwq3zj3vBV3Nf99DwzbT4DW5yyDBXmve0kuMRneco/IduRpO3t9i1wcG2RS1zNalNFEBK5qA7RhHRzzdPKybN4y0dsfZLLlxQq6L5tkxf2MnIN3UdG2N6x944CzL81Ujop48i3IcBAC+g9YmchYay1TKcu+hja04CTpEAMt16njfXSX/Cc6WDijBLcREQVLKPWUAd63JbQ53eXD6kfJ9SdI7+YPYL5B1cytbwyVevnlc9tNyIoMJVamr5W+4J/dMBUa+JKYKcEdh1DCdEswE/Ld/VuXzeb8fbJ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2567.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(366004)(346002)(136003)(376002)(451199021)(71200400001)(478600001)(110136005)(54906003)(8676002)(5660300002)(8936002)(7416002)(52536014)(86362001)(2906002)(33656002)(38070700005)(4326008)(64756008)(122000001)(66556008)(66446008)(82960400001)(66946007)(76116006)(66476007)(316002)(55016003)(38100700002)(41300700001)(186003)(6506007)(9686003)(26005)(7696005)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dW9ZekFHTHpZazRnK084cE9zQjQ1YlJrSVBIVytXUDdZYlYyUUUzQVlxdGxp?=
 =?utf-8?B?dW5aNWVaU1JGa2lkR2FpV3lMY1lNcHNvak45TjhJaUFWOU9kRjhUOStmd3Bw?=
 =?utf-8?B?OG5hOXB3QlZYRUxOZjhFYkV1NFlXcmxvN2x2R3F1bnEvWEgzM3Z5WjNTMFZJ?=
 =?utf-8?B?R3cvTkVjQU1zZnFWRHpvQitqOWpDZU9PRS9mdzlOajNmOXpIcGVXT2Y1bDB3?=
 =?utf-8?B?MUJMVXhxUlhKMHFUS1h3Qmw2NFlhQ3dWWHBSOFFFdGFIQ1NIN0JZcTR4aUhD?=
 =?utf-8?B?Vmh0SjFDM2N1WXpvWEkwMHFvYVN2bUdIYWxpaWNybjFCbVZpSEU5SDVrWjZZ?=
 =?utf-8?B?WHpHUm1TelJ4bkNYMXk4K1A5UjB6bWREMkpRd3J0RVd0M1RxZGhiZE5SOTho?=
 =?utf-8?B?ZEhvN3RYbVlHaGtuM0JEWkFYY25FdStxUlZGN3ZsUCs1VVhJT25DR1pzTkJZ?=
 =?utf-8?B?WnlFamhlWEFmeTIwbk9pR09oTGVVUzNEM3BSanZ5MkNXVjFYSm9qbitrNHRw?=
 =?utf-8?B?ZU01ZUVFSy85Y1AwaElPYU01MEVtWmdqZ3hLWEZKekJsT01CT2R3THY0OElX?=
 =?utf-8?B?T2RvYmRLYjVqMTdxenlMSlA5SklkRy9mWHQySGZDdmVuZ1M4SWJoanQwekIx?=
 =?utf-8?B?dUlOeTM2TVAreCtsQXpyNUhiR0h4VlZaWEhoYUhBSWpHQlBKMldSVzlpM1Ax?=
 =?utf-8?B?V1dLa0FWNWxKRHNYRm5haDJ6R0dUTlppQkY2eXBIbzUza3JaVEg5MGRqOTVN?=
 =?utf-8?B?MGlVdEl2djdwVUNscXJrRGtqU21qNTFTK20zY3RlS2ZHUFZoZDZKdkNKYU1n?=
 =?utf-8?B?SzdJTW5vSVdrL1VFYXM5NDJEaUV2SlFtbi9WWDYvNld0THBaaDIwdzdNOVd5?=
 =?utf-8?B?cnRKVDg1ZGkyUllWejRFK3NBOE1Ob0tmek50anJBcVdBempXei9RVWwzQXZr?=
 =?utf-8?B?L1FYTU9TWmVPMmlYWVFxYnl1dHNBMTFIY3BMNENnTENENVZrWjh1T1dCV2o2?=
 =?utf-8?B?WE9oYXRMNXN2VjZGTC9pTVJJdElhN1BCT0ZWSGsxK2loaEVnZk5URnZ4YTFR?=
 =?utf-8?B?VFBqdUpXSEVPNDFlY2dneU1aTk1rZUpzQkhFVnFsQUVHVXRyV0dOS1JVMDJj?=
 =?utf-8?B?Z0RvM2xWUFNqMk5QRXpFcVVEaGtaZ0NCdmZUd3NRRzIvK1J0YWFVcDFtUDd5?=
 =?utf-8?B?dENNT0s5MkRHRG16OVBNQlFSK3g0eld6clJNZ1FqOW41NkFvcXhMMkIySENH?=
 =?utf-8?B?TXRCakl2bDRlcmdMMzBodWZLMDBUdnhaUDRtbGFRbDc2Q2M4ZldxQWw1M2tC?=
 =?utf-8?B?WHFNV2hSL1FrQklKaEV5eklZWlFRVG5CUjNuSFZudDFEa3dJdDUzQXFTRzd2?=
 =?utf-8?B?Njd4Nkg3Y0lIQ1BxUTBBOU9ZdUlVQ2YvbUhCamY3amZxbGZnSmJha2FBb2dW?=
 =?utf-8?B?NVYxbTJoYlIvbUlJRGppdTdJVVFEOTE0ZnVxR0VCOHY0NHREUnpLbTB4VCt2?=
 =?utf-8?B?ZVF6Zzd5ZFlRNkkwTUh0Z3RxUmJSbFY0cEZ6NzROeE50dHRycVF0aEc5MTRt?=
 =?utf-8?B?YVB3TkxoeFc1czJiVkNQRDJYSWljb1V3U1lNTTY3U2ZpakRZcytPcDluaVEw?=
 =?utf-8?B?WFd4TWhPWmZKQ0Uwck1VNy9DVFFkeGN2d0k5NnhVdkhDZDgxeitKVFptUkV2?=
 =?utf-8?B?M2VjdEdRaVZxc0cyMHlyYk1aR1YwdmZHblg2QldEQkd2aUxLbFVhVUNudkRt?=
 =?utf-8?B?d0pRandEdlZCM1pEWlFOam5rTGtpb3VVQjN1V3BwLzlUVkNGVmhWc09YYTdN?=
 =?utf-8?B?MDhJRkVCSTFySUlSdFlTU1NUcm5nMUJpMUJzZTB0Nkk5azJpanZxTUpraXpB?=
 =?utf-8?B?ZHc5NlhTSTh3dFFMVmhkakIzbXlQelhoNFJGWjlIQzBKVWdwVCtNQVoydjZR?=
 =?utf-8?B?LzhISHllOW1FYnFxTktCcXMrYkZkNlRud0g1b0xFRFc2amlyZVh0YndGTXZh?=
 =?utf-8?B?OWNsQnY1cURXMWxYZXVNRHlxdkgwQ3lrNEdBbXJweXhFbHZCei9zUmVGc2JJ?=
 =?utf-8?B?THlXVmNpSkxxd1pHRk8wcklvR0lmMW1zQ1RkNktJU0k0UlBjN0dUVTVseVNW?=
 =?utf-8?Q?+R50=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2567.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76fd5dde-1937-4053-3540-08db6141407e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2023 19:08:28.5253 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h3riaFIChODspc7MIlA6bJWRJc76HRYjvErOfAwXuuttBkBv+cJGqdGNLpFfCD+7SdihL/MY1v8uUDhCTHykew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7361
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
Cc: "Rix, Tom" <trix@redhat.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
 "ndesaulniers@google.com" <ndesaulniers@google.com>,
 "patches@lists.linux.dev" <patches@lists.linux.dev>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "andi.shyti@linux.intel.com" <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBTdWJqZWN0OiBbUEFUQ0ggMi8yXSBkcm0vaTkxNS9ndDogRml4IHBhcmFtZXRlciBpbiBnbWNo
X2dndHRfaW5zZXJ0X3tlbnRyaWVzLHBhZ2V9KCkNCj4NCj4gV2hlbiBidWlsZGluZyB3aXRoIGNs
YW5nJ3MgLVdpbmNvbXBhdGlibGUtZnVuY3Rpb24tcG9pbnRlci10eXBlcy1zdHJpY3QsDQo+IHRo
ZSBmb2xsb3dpbmcgd2FybmluZ3Mgb2NjdXI6DQo+DQo+ICAgZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z3QvaW50ZWxfZ2d0dF9nbWNoLmM6MTAyOjIzOiBlcnJvcjogaW5jb21wYXRpYmxlIGZ1bmN0aW9u
IHBvaW50ZXIgdHlwZXMgYXNzaWduaW5nIHRvICd2b2lkICgqKShzdHJ1Y3QgaTkxNV9hZGRyZXNz
X3NwYWNlICosIGRtYV9hZGRyX3QsIHU2NCwgdW5zaWduZWQgaW50LCB1MzIpJyAoYWthICd2b2lk
ICgqKShzdHJ1Y3QgaTkxNV9hZGRyZXNzX3NwYWNlICosIHVuc2lnbmVkIGludCwgdW5zaWduZWQg
bG9uZyBsb25nLCB1bnNpZ25lZCBpbnQsIHVuc2lnbmVkIGludCknKSBmcm9tICd2b2lkIChzdHJ1
Y3QgaTkxNV9hZGRyZXNzX3NwYWNlICosIGRtYV9hZGRyX3QsIHU2NCwgZW51bSBpOTE1X2NhY2hl
X2xldmVsLCB1MzIpJyAoYWthICd2b2lkIChzdHJ1Y3QgaTkxNV9hZGRyZXNzX3NwYWNlICosIHVu
c2lnbmVkIGludCwgdW5zaWduZWQgbG9uZyBsb25nLCBlbnVtIGk5MTVfY2FjaGVfbGV2ZWwsIHVu
c2lnbmVkIGludCknKSBbLVdlcnJvciwtV2luY29tcGF0aWJsZS1mdW5jdGlvbi1wb2ludGVyLXR5
cGVzLXN0cmljdF0NCj4gICAgICAgICAgIGdndHQtPnZtLmluc2VydF9wYWdlID0gZ21jaF9nZ3R0
X2luc2VydF9wYWdlOw0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXiB+fn5+fn5+
fn5+fn5+fn5+fn5+fn4NCj4gICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9nZ3R0X2dt
Y2guYzoxMDM6MjY6IGVycm9yOiBpbmNvbXBhdGlibGUgZnVuY3Rpb24gcG9pbnRlciB0eXBlcyBh
c3NpZ25pbmcgdG8gJ3ZvaWQgKCopKHN0cnVjdCBpOTE1X2FkZHJlc3Nfc3BhY2UgKiwgc3RydWN0
IGk5MTVfdm1hX3Jlc291cmNlICosIHVuc2lnbmVkIGludCwgdTMyKScgKGFrYSAndm9pZCAoKiko
c3RydWN0IGk5MTVfYWRkcmVzc19zcGFjZSAqLCBzdHJ1Y3QgaTkxNV92bWFfcmVzb3VyY2UgKiwg
dW5zaWduZWQgaW50LCB1bnNpZ25lZCBpbnQpJykgZnJvbSAndm9pZCAoc3RydWN0IGk5MTVfYWRk
cmVzc19zcGFjZSAqLCBzdHJ1Y3QgaTkxNV92bWFfcmVzb3VyY2UgKiwgZW51bSBpOTE1X2NhY2hl
X2xldmVsLCB1MzIpJyAoYWthICd2b2lkIChzdHJ1Y3QgaTkxNV9hZGRyZXNzX3NwYWNlICosIHN0
cnVjdCBpOTE1X3ZtYV9yZXNvdXJjZSAqLCBlbnVtIGk5MTVfY2FjaGVfbGV2ZWwsIHVuc2lnbmVk
IGludCknKSBbLVdlcnJvciwgLVdpbmNvbXBhdGlibGUtZnVuY3Rpb24tcG9pbnRlci10eXBlcy1z
dHJpY3RdDQo+ICAgICAgICAgICBnZ3R0LT52bS5pbnNlcnRfZW50cmllcyA9IGdtY2hfZ2d0dF9p
bnNlcnRfZW50cmllczsNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4gfn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+DQo+ICAgMiBlcnJvcnMgZ2VuZXJhdGVkLg0KPg0KPiBUaGUg
d2FybmluZyBpcyBwb2ludGluZyBvdXQgdGhhdCB3aGlsZSAnZW51bSBpOTE1X2NhY2hlX2xldmVs
JyBhbmQgJ3Vuc2lnbmVkIGludCcgYXJlIEFCSSBjb21wYXRpYmxlLCB0aGVzZSBpbmRpcmVjdCBj
YWxscyB3aWxsIGZhaWwgY2xhbmcncyBrZXJuZWwgQ29udHJvbCBGbG93IEludGVncml0eSAoa0NG
SSkgY2hlY2tzLCBhcyB0aGUgY2FsbGJhY2sncyBzaWduYXR1cmUgZG9lcyBub3QgZXhhY3RseSBt
YXRjaCB0aGUgcHJvdG90eXBlJ3Mgc2lnbmF0dXJlLg0KPg0KPiBUbyBmaXggdGhpcywgcmVwbGFj
ZSB0aGUgY2FjaGVfbGV2ZWwgcGFyYW1ldGVyIHdpdGggcGF0X2luZGV4LCBhcyB3YXMgZG9uZSBp
biBvdGhlciBwbGFjZXMgd2l0aGluIGk5MTUgd2hlcmUgdGhlcmUgaXMgbm8gZGlmZmVyZW5jZSBi
ZXR3ZWVuIGNhY2hlX2xldmVsIGFuZCBwYXRfaW5kZXggb24gY2VydGFpbiBnZW5lcmF0aW9ucy4N
Cj4NCj4gRml4ZXM6IDkyNzUyNzdkNTMyNCAoImRybS9pOTE1OiB1c2UgcGF0X2luZGV4IGluc3Rl
YWQgb2YgY2FjaGVfbGV2ZWwiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBOYXRoYW4gQ2hhbmNlbGxvciA8
bmF0aGFuQGtlcm5lbC5vcmc+DQoNClJldmlld2VkLWJ5OiBGZWkgWWFuZyA8ZmVpLnlhbmdAaW50
ZWwuY29tPg0KDQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfZ2d0dF9n
bWNoLmMgfCA4ICsrKystLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0
IGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Qv
aW50ZWxfZ2d0dF9nbWNoLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9nZ3R0X2dt
Y2guYw0KPiBpbmRleCBkNmE3NGFlMjUyN2IuLjg2NmM0MTZhZmI3MyAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfZ2d0dF9nbWNoLmMNCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfZ2d0dF9nbWNoLmMNCj4gQEAgLTE4LDEwICsxOCwxMCBA
QA0KPiAgc3RhdGljIHZvaWQgZ21jaF9nZ3R0X2luc2VydF9wYWdlKHN0cnVjdCBpOTE1X2FkZHJl
c3Nfc3BhY2UgKnZtLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRtYV9hZGRy
X3QgYWRkciwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1NjQgb2Zmc2V0LA0K
PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVudW0gaTkxNV9jYWNoZV9sZXZlbCBj
YWNoZV9sZXZlbCwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBp
bnQgcGF0X2luZGV4LA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHUzMiB1bnVz
ZWQpDQo+ICB7DQo+IC0gICAgIHVuc2lnbmVkIGludCBmbGFncyA9IChjYWNoZV9sZXZlbCA9PSBJ
OTE1X0NBQ0hFX05PTkUpID8NCj4gKyAgICAgdW5zaWduZWQgaW50IGZsYWdzID0gKHBhdF9pbmRl
eCA9PSBJOTE1X0NBQ0hFX05PTkUpID8NCj4gICAgICAgICAgICAgICBBR1BfVVNFUl9NRU1PUlkg
OiBBR1BfVVNFUl9DQUNIRURfTUVNT1JZOw0KPg0KPiAgICAgICBpbnRlbF9nbWNoX2d0dF9pbnNl
cnRfcGFnZShhZGRyLCBvZmZzZXQgPj4gUEFHRV9TSElGVCwgZmxhZ3MpOyBAQCAtMjksMTAgKzI5
LDEwIEBAIHN0YXRpYyB2b2lkIGdtY2hfZ2d0dF9pbnNlcnRfcGFnZShzdHJ1Y3QgaTkxNV9hZGRy
ZXNzX3NwYWNlICp2bSwNCj4NCj4gIHN0YXRpYyB2b2lkIGdtY2hfZ2d0dF9pbnNlcnRfZW50cmll
cyhzdHJ1Y3QgaTkxNV9hZGRyZXNzX3NwYWNlICp2bSwNCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBzdHJ1Y3QgaTkxNV92bWFfcmVzb3VyY2UgKnZtYV9yZXMsDQo+IC0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZW51bSBpOTE1X2NhY2hlX2xldmVsIGNhY2hl
X2xldmVsLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGlu
dCBwYXRfaW5kZXgsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdTMyIHVu
dXNlZCkNCj4gIHsNCj4gLSAgICAgdW5zaWduZWQgaW50IGZsYWdzID0gKGNhY2hlX2xldmVsID09
IEk5MTVfQ0FDSEVfTk9ORSkgPw0KPiArICAgICB1bnNpZ25lZCBpbnQgZmxhZ3MgPSAocGF0X2lu
ZGV4ID09IEk5MTVfQ0FDSEVfTk9ORSkgPw0KPiAgICAgICAgICAgICAgIEFHUF9VU0VSX01FTU9S
WSA6IEFHUF9VU0VSX0NBQ0hFRF9NRU1PUlk7DQo+DQo+ICAgICAgIGludGVsX2dtY2hfZ3R0X2lu
c2VydF9zZ19lbnRyaWVzKHZtYV9yZXMtPmJpLnBhZ2VzLCB2bWFfcmVzLT5zdGFydCA+PiBQQUdF
X1NISUZULA0KPg0KPiAtLQ0KPiAyLjQwLjENCg==
