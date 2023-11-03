Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 577327DFE91
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 05:39:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDD4410E389;
	Fri,  3 Nov 2023 04:39:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A994410E034;
 Fri,  3 Nov 2023 04:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698986350; x=1730522350;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iDkfKGIvVU8He5Hp++tHv4AMvTPR/qOQqPfKnrcUPJM=;
 b=QccK9tAcez+E2f3i6hRQ2ZtCQhbqd33eEqDEi7vE0Z3CUl3jO7z4tZhI
 VJjvYR4a6LoDcWfIX601AR/2nL1YD4EzNu8OrpvBuYw1kPZ2qsbShEnbw
 +9tm+3AjZiaZBkhcW7ni7KTriYPJdlE4SLjoxBwXCH3JwhlTDPa2OS0hp
 Va/dOHjw7GLqqXLOxUOWLfcluvZAsoYBZxz2j6aGEleDSuoEYzH7h7OWp
 9hfVvpl/NWjLBWjQ+tEchrKQTfM2hbDHnJmiVJTr2YmtdNK/BF4qXNNuN
 OGQz1mUyF9JmOAPBah4BuolwD/l8pSWmE6zFFeMMQbQDE3x3XuiZW+19L A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="386047260"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="386047260"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 21:39:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="2663993"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Nov 2023 21:39:10 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 2 Nov 2023 21:39:09 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 2 Nov 2023 21:39:08 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 2 Nov 2023 21:39:08 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 2 Nov 2023 21:39:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZnNIi1z/TmsM1A7qYCSZasQqYgjXT6G0M3Bwl0QTh0+9wzmH9JzFV4ss6wNaof8UKbUhyVXa8scxuo+VK4fH8vXsvxJNUTEmIGnCHIW/YmboMd6EvQXjP4vb/05qMN+onEPKgulr6grG953lnly1w6+rtIcv8FfH9Bsbz9LKgzZMORCATWJIve1uc/n9iaoOXMB+H4JD1i9HZmXaCQ/nFEewUA0/t86mScNX7tLktLsVqdSyFMMyIuYRK+PAd5FQyq4Y20t6Tdp0F0bz60/X48TEXOP4QO6adQ37g4Yv7TPwb3dHfXrgufZo/Dk4kqlMGGYgkn+XFicepfx5v6USHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iDkfKGIvVU8He5Hp++tHv4AMvTPR/qOQqPfKnrcUPJM=;
 b=juW+Jivqgxy56M15VSsG6QcOSFdn8jSiVKVIjIiFiac9RhDzFY94LLWL/UTvdzOvgWq2B/2AHi4uD15E+xg2at8cYDVfjgLEXywqb/jslhv4QmWTQlt1XT6+MayX0SOTtA4t6GqfFwWeSq1j1UYMF14C9SQAHf8fZZthZd7gKq5DGz/8GOnAPcns3dxBAtTsjc6iUhqNzXv0EXXniNW1UorxpemHuhfeKzQQ4p7yipwmp/pkF9JIWM8vuY1v+x3dfVHrlQZ/5hY4pZvuyGcA5Ripp1Q/7mR/cwlmBZvNHETy0wLammD3y73S3nQLlos/9xPhGHfdeqnrB53B/rFZtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by CO1PR11MB4946.namprd11.prod.outlook.com (2603:10b6:303:9e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Fri, 3 Nov
 2023 04:39:01 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::9bdd:1d20:1b4e:3e92]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::9bdd:1d20:1b4e:3e92%7]) with mapi id 15.20.6954.019; Fri, 3 Nov 2023
 04:39:01 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH 3/4] drm/i915: s/clamp()/min()/ in
 i965_lut_11p6_max_pack()
Thread-Topic: [Intel-gfx] [PATCH 3/4] drm/i915: s/clamp()/min()/ in
 i965_lut_11p6_max_pack()
Thread-Index: AQHZ/ddKflD96bZQ2ku8RRcAd02tOLBoI1XA
Date: Fri, 3 Nov 2023 04:39:00 +0000
Message-ID: <SJ1PR11MB61294455346CBEF4DBE64842B9A5A@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20231013131402.24072-1-ville.syrjala@linux.intel.com>
 <20231013131402.24072-4-ville.syrjala@linux.intel.com>
In-Reply-To: <20231013131402.24072-4-ville.syrjala@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|CO1PR11MB4946:EE_
x-ms-office365-filtering-correlation-id: 691c5392-9949-4493-0e1e-08dbdc26cd1c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 50i2ucXbAEWAWtpzVISFT4fmpgtVX+XFdA2hLY4lrl0ka+j+/TXJLc2usJjKUULt260O+PogRZE7J5Jb6k0qg9gS4X7fmc1Xvv5BM3k0WutoBJS151c4hp+ikFuqjMMbj4Sm51p4++2LXCBjjlUC3LFfWQNr/4jINrJ0jBVghrJxgw3/ilaeItLb6U5iP0Z9cL6k7c1j2gHAonIiO4jywwMg4NyW5Lt+OTEIEu2yM+/BzjyW+znLKkR+fFj4fn8JIzlmNoFTcxqTfTHN9JNeuQzKX4XQOxRQBtILmDfWj6pztg7kLURVUtR+/RLjFi7opJx4kpEA9g2hNkrlyauWRnv629eMuPQ9FpxgY66wGyJ8pgv2uS8zwDBicu/iX/SYlmYXLMkz0/kQF3idN2R4xMqmxK6SQCY/U+H7NX6gv8Hc3RA8cAXAHq1gXrxs9aUgc+N5prQsMCOp9mAGE+bIdQmZ8uJmGnmwnqhz6q5azMZ59ecuEnqdrnMsCtiSNqrM8Xt3Iku8GpEoOoKhk2VA7HHembbefw69BIfQhOR2RK9TnUvoJKEWeMSd6a5FLKqP6Spgkgji7ejsriCn9L4wo670Q+8rCeK3BNdPVxU2j/j4Fj6wTkzd4ZWxzqwEQRUZ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(346002)(366004)(376002)(39860400002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(55016003)(82960400001)(122000001)(86362001)(33656002)(38070700009)(2906002)(41300700001)(9686003)(478600001)(71200400001)(6506007)(8676002)(52536014)(4326008)(8936002)(53546011)(7696005)(26005)(83380400001)(66446008)(110136005)(66946007)(5660300002)(316002)(66556008)(66476007)(76116006)(66574015)(38100700002)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aHdzSTF1a05Gc1YxWDFuQ20ybGxkbDRIQVBLbk1lRWR4Ri9LWXYxUzlZQS9r?=
 =?utf-8?B?b0dWaU9jTWR0cUh4ZTRrN2dEVVFZTDBML2xpUHZsd3hkeVBoOTROcXJrMG1x?=
 =?utf-8?B?VGJxanQ1WHdNZVVtR3V0Wmd1S1A5dmJWOGRPaU5ISkZER3l2WWwyUG0wdGFv?=
 =?utf-8?B?TXE5OE92WHJTWUhCZnlScWY1V1NTbDRPdzN6Y0NKblBwaEYzRGNyRDFscis3?=
 =?utf-8?B?cVNQOVNRdUh0MjFqaGUyVWdWUTJnd0xrZHE2VDB3TmUwb0xNejVTN1hwa1cz?=
 =?utf-8?B?bGRIOTVSMEI4K2FZT1ZzWGYwSW9uOFg1Wlk5SklhK3hWZHdpRWlZQ2lUOFY0?=
 =?utf-8?B?RkZ3d1FSRE5tY0VPRkQ3TVpGbm9YZ3gwcitUaTRaR1paZGY3a0doMy8yYm9D?=
 =?utf-8?B?TjZldHgvUUN0VFo0b1VFbitlZTZDOEg5Yzl5ZkFrRStLZXMwY0ZHWWFOdXRx?=
 =?utf-8?B?dlBZVCtTeWVwTjBCRWhIRE8rUHJMZ2N1YmpMZWRmczVUQzBEK29NRThIOUdQ?=
 =?utf-8?B?dTMwRXdyTThueE96aGV2YWxVaE0wWmUxejhEOE5CZmwwMm1SNmlNOG5EU1I1?=
 =?utf-8?B?cUV4VU15RE8xZnBhUjhrbG05dHpvbmg3MW9ZZXJ5WHlHUncvVGIvZjBkdWxa?=
 =?utf-8?B?RUU3Vm1pUk0xNnFXdVFUQVBtSnkzUC9RbExKTnpabmUrY2xOM0RuK0w2b0FU?=
 =?utf-8?B?NUQ4VnB5aDVrY1R6cUVuOGZ1SUZwaGJXcytwY0dnMXNVL2lxQlhyaENrczJ5?=
 =?utf-8?B?TTFOZ0ZpMTNxdnZiWHl0dGFwRU1ObHRsRnd3bkttNFFJcEo2WHhLblRmb0Zp?=
 =?utf-8?B?Wkl3WG1mS3VmendrUmwxQXQrcldHemhFZWpWS0hUQ2k1RzBnVDVab3ZnWndZ?=
 =?utf-8?B?aXRYb0JydTYvQVNWcFFvRnNxK0ZIcTB0dFU3MkdSZERGTUVnanNQa25tVmti?=
 =?utf-8?B?ckhoVUI1UWd3cUI2a0JhOXhybEdMR3NBYVRIeXNBYTdLbXlOeHhRbzRPS0RO?=
 =?utf-8?B?Y2E5Y1hFSjM4N1JiRTUzYXF3V2paMWY0eU5KcFhNYnZ4WFl2RW9WQitWS3dj?=
 =?utf-8?B?VFRHa3NkM25NWDN1K1Q3U1ZPNkc2MmdjNXZBTWRUSUF4R2NZcml3aHB6NDhk?=
 =?utf-8?B?a1gwNXgvblJxVXozN2xLSWtQNno4QWUwaWhOekg1ME1hSDlsb3lJdDJWY2FN?=
 =?utf-8?B?emdBZXgyNDZrVjJiQ1UxaWZ4MWlkOHl1b3ROcitYWGhVeXo2WTQzcEErZk16?=
 =?utf-8?B?Wm9YWE5MTENVOGZzVklvOFpLb1VoV0xkNlhSajlSQlYrMFJNNVNPNkNzeEdU?=
 =?utf-8?B?R2ZZWmlnYjBhS2hwcHpOVDI3d085RlFtdzJrUDMyMlJmdVk4TThvUksrMzBx?=
 =?utf-8?B?Vkczd2tKcWh2Ni9YWXcyWDFFdXZpSk5LdGczQlg0S3dYNFNzazNPVkkvVGNB?=
 =?utf-8?B?cHdtNktvbXZBLy9rN2lmZ0lSWmhSS1FWbnRTSk00M1RyMCtxRU5OZE5icUJH?=
 =?utf-8?B?THUwSGtMSkVvbEpqd1BITlArMDhxejZBMUpmVUt5MUNIMDlhcldBSUllc3Nh?=
 =?utf-8?B?Ny9JdzFuTFovSFk4MUJCY1NMaDFEMTBMT0EwSlE3bzBuTEZ0RmkyN214ZHNp?=
 =?utf-8?B?NitENU1rWkZSMG1hNEtkd0NUdE9oUGtkNVZ5OTE5cUxXRXdCeXAvQVBuMlBm?=
 =?utf-8?B?bWpncHR2T01jZjdhM1JpRU5Sd0pOaW9NSU9pYTE5N1FIdzgyMENzUnY1Z1Nh?=
 =?utf-8?B?L2dhbUhpZ0xXWGtqSVh6TjViU2hERHlHZGt1RjRmVXlPWFVCM2ZIS1dYYzdJ?=
 =?utf-8?B?KzFnSzlPVGs1dHNZd3I0eXpQWkxpd2xkamM2S0lXS2hOSkEySXc5WkpSMm5H?=
 =?utf-8?B?TXdUWUYvdlhlcmFMTnFYYWhoT3hOR3NOYmh4OTRCbWw1VitITy9JM1RZNE45?=
 =?utf-8?B?VjUzN3JEcDhNWUVGdE5iRjgrTGp1Z0VpQ2MveWptWFpZekt5RkM5RmlGdElU?=
 =?utf-8?B?MkdITFBkUEFNMlZrVUN1ZEVoaUtDRUMrVkoweWtSR1dPRE91d2VWNktac2VI?=
 =?utf-8?B?cjBCeWl0UndKTWZqK2U5alN0Z3dHNy91K2g0RXAzMS90ODJiQjZwSUhyMGdC?=
 =?utf-8?B?bkNDcnJZTWlYMkl0NWQvZkZqc3A5ZE9hdmsrazFCUjd6M21vWC95cmdIbDc1?=
 =?utf-8?B?Q1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 691c5392-9949-4493-0e1e-08dbdc26cd1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2023 04:39:01.0668 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XzTMOOCvqbUYupoKlZa4dV2jK1oZlVPNS+MGT4CqhLT8rm9+nAuHIR4FsnBf+CJVzySzQI5042SdA+VORJ7yV1HUVJwd8JYK10uQ1IiQvF4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4946
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBJbnRlbC1nZnggPGludGVsLWdm
eC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIFZpbGxlDQo+IFN5
cmphbGENCj4gU2VudDogRnJpZGF5LCBPY3RvYmVyIDEzLCAyMDIzIDY6NDQgUE0NCj4gVG86IGlu
dGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcNCj4gU3ViamVjdDogW0ludGVsLWdmeF0gW1BBVENIIDMvNF0gZHJtL2k5MTU6
IHMvY2xhbXAoKS9taW4oKS8gaW4NCj4gaTk2NV9sdXRfMTFwNl9tYXhfcGFjaygpDQo+IA0KPiBG
cm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPg0KPiAN
Cj4gVXNlIG1pbigpIGluc3RlYWQgb2YgY2xhbXAoKSBzaW5jZSB0aGUgY29sb3IgdmFsdWVzIGlu
dm9sdmVkIGFyZSB1bnNpZ25lZC4gTm8NCj4gZnVuY3Rpb25hbCBjaGFuZ2VzLg0KPiANCg0KTEdU
TS4NCg0KUmV2aWV3ZWQtYnk6IENoYWl0YW55YSBLdW1hciBCb3JhaCA8Y2hhaXRhbnlhLmt1bWFy
LmJvcmFoQGludGVsLmNvbT4NCg0KPiBTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZp
bGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvaW50ZWxfY29sb3IuYyB8IDIgKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY29sb3IuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfY29sb3IuYw0KPiBpbmRleCBiMDFmNDYzYWY4NjEuLmE0YjMwNjE0YmQ2
MyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9jb2xv
ci5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY29sb3IuYw0K
PiBAQCAtOTA5LDcgKzkwOSw3IEBAIHN0YXRpYyB2b2lkIGk5NjVfbHV0XzEwcDZfcGFjayhzdHJ1
Y3QgZHJtX2NvbG9yX2x1dA0KPiAqZW50cnksIHUzMiBsZHcsIHUzMiB1ZHcpICBzdGF0aWMgdTE2
IGk5NjVfbHV0XzExcDZfbWF4X3BhY2sodTMyIHZhbCkgIHsNCj4gIAkvKiBQSVBFR0NNQVggaXMg
MTEuNiwgY2xhbXAgdG8gMTAuNiAqLw0KPiAtCXJldHVybiBjbGFtcF92YWwodmFsLCAwLCAweGZm
ZmYpOw0KPiArCXJldHVybiBtaW4odmFsLCAweGZmZmZ1KTsNCj4gIH0NCj4gDQo+ICBzdGF0aWMg
dTMyIGlsa19sdXRfMTAoY29uc3Qgc3RydWN0IGRybV9jb2xvcl9sdXQgKmNvbG9yKQ0KPiAtLQ0K
PiAyLjQxLjANCg0K
