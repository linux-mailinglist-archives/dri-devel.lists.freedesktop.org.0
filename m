Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A548588127
	for <lists+dri-devel@lfdr.de>; Tue,  2 Aug 2022 19:37:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17AD693545;
	Tue,  2 Aug 2022 17:37:29 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA68E113DE4;
 Tue,  2 Aug 2022 17:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659461837; x=1690997837;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=g2Okw/AKfMfHAxg7yxk222rihqaZBq/qqcBL0y+bOqs=;
 b=j6k83OdA/fUZgITPA2BozAi+2Tt3it37X3fY6P5fiZXOB8zdOH8zmoKY
 UVR108+qW6PPcdvQzg99na1C6WuBoHLfUlPzsYn0Ka3ss6mw9vmbcSZSv
 UbZ2NLgRnge2BZkJqNKK+cW9o8i44Vxii/qHXuWJX1Gc9NnqKTf1jRvTW
 +58Hn8N/zbmylnM0Evn9/xus6Vf9HbPESuqDYM/LboG1ZXdVuyg/+IysL
 C7dZzqtx1OqsWwOC97T94vdlozLHpsy5Ou986V029AFoc+X1cquptvafO
 kis232ObS0vxnpP32kaY0ljX8djMKlizSHooZQac20DCCdyIw5lsgrVON Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10427"; a="290690596"
X-IronPort-AV: E=Sophos;i="5.93,211,1654585200"; d="scan'208";a="290690596"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2022 10:37:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,211,1654585200"; d="scan'208";a="635378096"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga001.jf.intel.com with ESMTP; 02 Aug 2022 10:37:15 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 2 Aug 2022 10:37:15 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 2 Aug 2022 10:37:14 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Tue, 2 Aug 2022 10:37:14 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Tue, 2 Aug 2022 10:37:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aPMd4x8oZFwWsQaFskJDcbR3QVnVBWL2V8xXtUJ53VUj4hyswITS8zIaYtmEbpVAkCqKqTHQ7qBBqLFs4FfKBbXupgfPztjlEk5cGAGY1d9Reg+wz74LndNwYLSx64kgWdvzoPwJlmG2YZbRvaIHFsVt3Cg5dUR2R1SPZx4G0YGTkxEmPbv/XYMgh6lKX5z9ABiVPBvSbs1wcCwNNkw+Ap7dybjrSMsihxwuUX8qgZa8QWIY8mNDOTSIq8NKwPx1Kvjm1b6Z+aXa0QtUjuVl2IZ2knJmtuQ1zlqyzcWw3TUaRenC1Y/tJEhjNvINvzjfQrbJcdtWML912J5falH6Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g2Okw/AKfMfHAxg7yxk222rihqaZBq/qqcBL0y+bOqs=;
 b=aS0qRy0IDN8+d/u+sl/xpWoW3KbXy1Pfox6Dgwj2m5XDT5686IILld6hYuInZ6oMUUUJz/cPJGme1VUPNrNSEyUxMBDm4szlqwgsKJPPB1D5+6McqRB07joJxM4OKF1koeelgwB4istqoKrSjA3sqo5ay/aE67vutF8pe54kNs8JzF4OfNA/9OZRFDN/MscW6sRRZFveUAGVeXcAifLVYp+kfm5ttMxdYdDEsTy0CMFq5AfUdGtnCKCTrQr8dUVK2MigVr53hyfvsfYiS0t9WDlvjA0h9VxLupCLj8WkkBI1+jTNKkonD03pfa0BBMW0BFdRiGlKHol+QkIHb7LGSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 BL0PR11MB3377.namprd11.prod.outlook.com (2603:10b6:208:66::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5482.11; Tue, 2 Aug 2022 17:37:13 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::fdd1:18b1:3e9c:b03e]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::fdd1:18b1:3e9c:b03e%4]) with mapi id 15.20.5482.016; Tue, 2 Aug 2022
 17:37:13 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Harrison, John C" <john.c.harrison@intel.com>,
 "Intel-GFX@Lists.FreeDesktop.Org" <Intel-GFX@Lists.FreeDesktop.Org>
Subject: Re: [PATCH 1/7] drm/i915/guc: Add a helper for log buffer size
Thread-Topic: [PATCH 1/7] drm/i915/guc: Add a helper for log buffer size
Thread-Index: AQHYoii8YQ43karQ/kiRefdk2bsV962b6PsA
Date: Tue, 2 Aug 2022 17:37:12 +0000
Message-ID: <e8e5eaf585a38dc0af79236b83d52d51c47e3e25.camel@intel.com>
References: <20220728022028.2190627-1-John.C.Harrison@Intel.com>
 <20220728022028.2190627-2-John.C.Harrison@Intel.com>
In-Reply-To: <20220728022028.2190627-2-John.C.Harrison@Intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0dbab82a-257e-4773-f7a9-08da74ada271
x-ms-traffictypediagnostic: BL0PR11MB3377:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r0X2bZgikRdvl9j1SHCIKyJoshCXbY05edw7FMH2gOg8P9pCPFW/3SHfoBMNmVAWd5LD30mjpXirguRBR44z8vmXAjbL8R3+iMRnYqH8GJb3iEhWvBfAK+5i+pb90IwELRdt87mdBxbY6O3P8CepV/aZU707Zv9v1REOuV9R1lBzd5TNOGeKCtLBX9NrCoY74y7WxIhLaOl53qlUa9djRQtHi3XDVILObel6l91myyKPRC5cQtp1jX64ts61tP0wiP+NenUaZ+qj8JjT0LMosrZ6guik2iA5iD4+E39028lzyKTcWSoQkSJVxng9hGfUTI0vd9Nghy8D7c2kC8PN8ZJZ9XGPx6Pxu/WWUc7MEpYxrRsr4jVkLBYj1/kEyYFWa5vAdtlgc4HUnorTOTs9+zlGnCkMNEHz9lX2M2rAn2HIqOC8QxjluRmua04FIrsrwD7pBYVA/X3IgZtzPcvACW1RthO6dEMPRnRzT7rjU5K0ThZyg6sJjenBesrrpsnKXeLmSxNL65bEhGrByoDYa7pu5mGRS87sZIMB1w+J89C0DuqjJZzT4xYS9zsGWWMdFsPPXyMNCUhT3UGQfPYYHmTRsxSWmvzRQF6XxuZZUP2mhbyKsnrPCx0GlQgeEg+SuSB/XsFfjFpH25DnYAz8RTrdjJ01jE4DnN03Qd+DyBYcf2ohDfflx/xEaIpcwlgQoMz/6UimnRYgx9I7i+mb6XlmgJcFhkLDJZ742SZIFPm8OH9P43HFoZo0ewSPBkkXMvddpNFEjuowWhBTa/u6/CC64ndaZwPRoEgWS8QFKJo8tggtbFc5Y8FCpP/H/dMv
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(39860400002)(366004)(376002)(346002)(136003)(6506007)(6512007)(41300700001)(26005)(316002)(478600001)(54906003)(86362001)(71200400001)(110136005)(6486002)(82960400001)(38070700005)(122000001)(38100700002)(107886003)(2616005)(186003)(83380400001)(91956017)(450100002)(36756003)(2906002)(8936002)(66446008)(66556008)(66946007)(76116006)(66476007)(64756008)(8676002)(5660300002)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UHc2NDIvZ0xNSWdPVlB3eWtwMFF5SlJzTSs5amFpclMzQ2N2Y2xia1JtSHhr?=
 =?utf-8?B?QmR0Z2lmaWw4Z0xqOWVlZUpzZFVMVTF6d1g5REVXQWplanZsM3NsVjhyakRB?=
 =?utf-8?B?Z3ZHQ0tqUTZSZHRIOE9XOW5UMjhMZjd1MytnV3dUMGhCRUJuQU95NlFmcnQ2?=
 =?utf-8?B?MVhEQlViN2Q1a1FRTVdScCt4U3d5ZldRZnI2TXl6U2JaVnh0Q3lEV2hBNnVk?=
 =?utf-8?B?Zm8wUks0S0UvY2FuSHJYZXhQZG9sTVFQN2tPemJTWDc5TU1xUFZ5amViOXdF?=
 =?utf-8?B?SDRTb0t5Y1RoZTcwS0FmTit2VjRYd0hqRDYvenNtUFVWWUlxV2xaRGY4K0RC?=
 =?utf-8?B?amhZZXhjU1drdUxmQ3B0RG9XS0RTcnZjaTFiYkVzRHUweWMwSjZJVk95Sm9M?=
 =?utf-8?B?bENQTUZZWFZlY0xhRU5PbUNlbVNpN0VFWmJnUXAybk5LbVcyOE9CVWIrdnQz?=
 =?utf-8?B?WWJOWXQ4VHJvK3cwVzNpUU1KTzdsY25yMHRrWnpXSWc3NGVnSC9HUU1RelY1?=
 =?utf-8?B?cmRXMy9sbzJPMTFrWWUwVTZFQ2dRSjRMUnBPSW9JTzFyaDkyMVJkSUJBSU9l?=
 =?utf-8?B?Q1krRGtVVkRYZGV2U1I0MGFDakxQbHl6clRRM3kwWEpDbDdodHN4MG4za3Z4?=
 =?utf-8?B?cmVDS1VwM2VUcXlIa1J4S3dMbktWaGJLVWcybFZGVlBLbSt6RWNWVnB0L25F?=
 =?utf-8?B?dUU3cTFiM0t3UXZsejNWd0ZYZkVYNXR0UjhmbWk1dTAzTG1Ecjk3OWJkeGlK?=
 =?utf-8?B?dnhKSVZCTDFpR3diNFFvYzFhemZQcGlHREIvV0pLcnkyR3AvNWd3T25IUHM3?=
 =?utf-8?B?Ry9NTDREZGhycXZSWjc1THZLbS96N2F2N0dIYnFqblFvcGw4OGRjU2MrYWVy?=
 =?utf-8?B?NmVZcG1sV2Q0NVBZS1ZCalNISnY0OWVuNGV4TUI3RlV6UFJUblBNZHhHTmRy?=
 =?utf-8?B?eExQSFAySE5mcGJBNzIwalh2MnM5QVptbEFqVlAxSjhaVnZCT2N4R25oUGF1?=
 =?utf-8?B?bi9PNlkvWVM2NTh6bzVDbjFsU2tZNU1ueGZON0pLako5Uldvbnc0blRZbysx?=
 =?utf-8?B?dWlwTjFYMlV2aVRERmtLZEcwVmh6ZDlINkFCekt2dTdUMEw5bUE0TVpuTGln?=
 =?utf-8?B?U2pPVUdmRFNWWlNCNXppL2k5ZmxlWi9JNHA5aW9oKytNSVp3TDE0amxpVzFZ?=
 =?utf-8?B?cVRNY1ZEU2Z6NjgxbEZLbiszMUJnczN3T3dKYUFJaDl2bEo3cTZmZE9LZGtX?=
 =?utf-8?B?T2V5MWRydHMyT1ZzcHVDNXFQMHp6MnhuU01XZ0x3L01QS1hKZGZiNDlNZ0lz?=
 =?utf-8?B?MjdMNmg5VGluZ2NGYlZhQlVLZ1gvWEwxdHh3RzhNMi9NeFNTeHhoeFRSRjFp?=
 =?utf-8?B?cTFCRlpwR21sYW9ydkFzRE9PVEY2dVRPTDNScC9OQUdubHFob0gwRE1lbUNt?=
 =?utf-8?B?RGZnMTdGOFNaSEIyL0Q4ekdOdmtCeTNOR0VOdnFzNjZFZFFKSUxPZGNRTWty?=
 =?utf-8?B?MmZRVElNWW50dmJzS1JNVmpoejU0SlM5WnAvUHpneWtwS3p6NjVOVSt4enhl?=
 =?utf-8?B?QzBMVStOK2J2Tk54cjBlTnFQOTlPUHJleUhxQjliU1ZZQjVoVU5TMk5ESEU3?=
 =?utf-8?B?Qmc3Mk5aREYzWVNDU1RmdkJ4dTdvZ0g2N1RvRXpHMTEzSVBSYjNDRndteTU4?=
 =?utf-8?B?c3ZwUjJUOTRxMHIzd0pYSzBRcXVDZk1sdzZ1bTJMUHdiRnMrc1NmV21GYWJG?=
 =?utf-8?B?VVk0TVArcmdRTjM1UzJCdjA1Q3VxSERBVXJxQlpUSmliVUxXb3N0b29SSFE0?=
 =?utf-8?B?R3JMMnZGL21zZjFwWmU2V3A5UEpYQ1Z3T3JrYzRqUmg3cE16bngrdUttK1pK?=
 =?utf-8?B?VzY2emI2UXExMkxQbitXTStjRzFxSVdnYzl6bm1lbXZHcEZPT1hVU1Z2MWJK?=
 =?utf-8?B?Z1JyR3plTGNrS3hwT2R5NFNJeUMwSkpNT0FPTzNNVXpubUNHR20xdFplRGdV?=
 =?utf-8?B?KzUveVVtbURsb25qcjFsUFVtbkpudjUwU2FCTU45ZlBWRCtGSllWY0wxcnNl?=
 =?utf-8?B?ZktIWGNMbUVBYVI3OFlhOTFuTGt3dUgvbXhTUllHeVFqcm10WjhNMTlIZzR1?=
 =?utf-8?B?SVJWdTNCbzlXcmxDaGlNN3pCd0lkZXRHYTVYaW5YRFBYOS9XMllzcW9WYUc3?=
 =?utf-8?Q?tTu5rb2FfxTAGFCStzR7YtA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4E8519F3BE764F42A1FC191828604AE3@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dbab82a-257e-4773-f7a9-08da74ada271
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2022 17:37:12.9732 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bwWQhSh79Ccu4V3dbovcjW+2IyAyNL2LqDMfHnJNoagY0ZiG1WktrV1BI1q5xzluTQz+cakEEHxa5emaNcSJa+9VN+r7E1XMtxCWfWzVkx/fhg9ck6Rht/sJJV7WYcqv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3377
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
Cc: "Brost, Matthew" <matthew.brost@intel.com>,
 "DRI-Devel@Lists.FreeDesktop.Org" <DRI-Devel@Lists.FreeDesktop.Org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U29tZXRoaW5nIG1pbm9yIGluIGNvbW1lbnRzLCBzbyBjb25kaXRpb25hbCBSLUIgKHBsZWFzZSBm
aXggb24gdGhlIHdheSBpbiBvciByZXBseSB0byBjb3JyZWN0IG1lKToNCg0KUmV2aWV3ZWQtYnk6
IEFsYW4gUHJldmluIDxhbGFuLnByZXZpbi50ZXJlcy5hbGV4aXNAaW50ZWwuY29tPg0KDQpPbiBX
ZWQsIDIwMjItMDctMjcgYXQgMTk6MjAgLTA3MDAsIEhhcnJpc29uLCBKb2huIEMgd3JvdGU6DQo+
IEZyb206IEFsYW4gUHJldmluIDxhbGFuLnByZXZpbi50ZXJlcy5hbGV4aXNAaW50ZWwuY29tPg0K
PiANCj4gQWRkIGEgaGVscGVyIHRvIGdldCBHdUMgbG9nIGJ1ZmZlciBzaXplLg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogQWxhbiBQcmV2aW4gPGFsYW4ucHJldmluLnRlcmVzLmFsZXhpc0BpbnRlbC5j
b20+DQo+IFNpZ25lZC1vZmYtYnk6IEpvaG4gSGFycmlzb24gPEpvaG4uQy5IYXJyaXNvbkBJbnRl
bC5jb20+DQo+IFJldmlld2VkLWJ5OiBNYXR0aGV3IEJyb3N0IDxtYXR0aGV3LmJyb3N0QGludGVs
LmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF9ndWNfbG9n
LmMgfCA0OSArKysrKysrKysrKystLS0tLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMjcgaW5z
ZXJ0aW9ucygrKSwgMjIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxfZ3VjX2xvZy5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z3QvdWMvaW50ZWxfZ3VjX2xvZy5jDQo+IGluZGV4IDI1YjJkN2NlNjY0MGQuLjQ5MmJiZjQxOWQ0
ZGYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2d1Y19s
b2cuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF9ndWNfbG9nLmMN
Cj4gQEAgLTE1LDYgKzE1LDMyIEBADQo+ICANCj4gIHN0YXRpYyB2b2lkIGd1Y19sb2dfY29weV9k
ZWJ1Z2xvZ3NfZm9yX3JlbGF5KHN0cnVjdCBpbnRlbF9ndWNfbG9nICpsb2cpOw0KPiAgDQo+ICtz
dGF0aWMgdTMyIGludGVsX2d1Y19sb2dfc2l6ZShzdHJ1Y3QgaW50ZWxfZ3VjX2xvZyAqbG9nKQ0K
PiArew0KPiArCS8qDQo+ICsJICogIEd1QyBMb2cgYnVmZmVyIExheW91dDoNCj4gKwkgKg0KPiAr
CSAqICBOQjogT3JkZXJpbmcgbXVzdCBmb2xsb3cgImVudW0gZ3VjX2xvZ19idWZmZXJfdHlwZSIu
DQo+ICsJICoNCj4gKwkgKiAgKz09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0rIDAwQg0K
PiArCSAqICB8ICAgICAgRGVidWcgc3RhdGUgaGVhZGVyICAgICAgIHwNCj4gKwkgKiAgKy0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rIDMyQg0KPiANClNvbWV0aGluZyB3ZSBtaWdodCBo
YXZlIG1pc3NlZCBpbiBwcmlvciB1cGRhdGVzIGJ1dCBpIHRoaW5rIHRoZSBidWZlciBzdGF0ZSBp
cyBub3cgMzYgYnl0ZXMgbG9uZyBubz8gKDkgZHdvcmRzKS4NCg0KDQo+ICsJICogIHwgICAgQ3Jh
c2ggZHVtcCBzdGF0ZSBoZWFkZXIgICAgfA0KPiArCSAqICArLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLSsgNjRCDQo+ICsJICogIHwgICAgIENhcHR1cmUgc3RhdGUgaGVhZGVyICAgICAg
fA0KPiArCSAqICArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSsgOTZCDQo+ICsJICog
IHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfA0KPiArCSAqICArPT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PSsgUEFHRV9TSVpFICg0S0IpDQo+ICsJICogIHwgICAgICAgICAg
RGVidWcgbG9ncyAgICAgICAgICAgfA0KPiArCSAqICArPT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PSsgKyBERUJVR19TSVpFDQo+ICsJICogIHwgICAgICAgIENyYXNoIER1bXAgbG9ncyAg
ICAgICAgfA0KPiArCSAqICArPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PSsgKyBDUkFT
SF9TSVpFDQo+ICsJICogIHwgICAgICAgICBDYXB0dXJlIGxvZ3MgICAgICAgICAgfA0KPiArCSAq
ICArPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PSsgKyBDQVBUVVJFX1NJWkUNCj4gKwkg
Ki8NCj4gKwlyZXR1cm4gUEFHRV9TSVpFICsgQ1JBU0hfQlVGRkVSX1NJWkUgKyBERUJVR19CVUZG
RVJfU0laRSArIENBUFRVUkVfQlVGRkVSX1NJWkU7DQo+ICt9DQo+ICsNCj4gIC8qKg0KPiAgICog
RE9DOiBHdUMgZmlybXdhcmUgbG9nDQo+ICAgKg0KPiBAQCAtNDYxLDMyICs0ODcsMTEgQEAgaW50
IGludGVsX2d1Y19sb2dfY3JlYXRlKHN0cnVjdCBpbnRlbF9ndWNfbG9nICpsb2cpDQo+ICANCj4g
IAlHRU1fQlVHX09OKGxvZy0+dm1hKTsNCj4gIA0KPiAtCS8qDQo+IC0JICogIEd1QyBMb2cgYnVm
ZmVyIExheW91dA0KPiAtCSAqICh0aGlzIG9yZGVyaW5nIG11c3QgZm9sbG93ICJlbnVtIGd1Y19s
b2dfYnVmZmVyX3R5cGUiIGRlZmluaXRpb24pDQo+IC0JICoNCj4gLQkgKiAgKz09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT0rIDAwQg0KPiAtCSAqICB8ICAgICAgRGVidWcgc3RhdGUgaGVh
ZGVyICAgICAgIHwNCj4gLQkgKiAgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rIDMy
Qg0KPiAtCSAqICB8ICAgIENyYXNoIGR1bXAgc3RhdGUgaGVhZGVyICAgIHwNCj4gLQkgKiAgKy0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rIDY0Qg0KPiAtCSAqICB8ICAgICBDYXB0dXJl
IHN0YXRlIGhlYWRlciAgICAgIHwNCj4gLQkgKiAgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0rIDk2Qg0KPiAtCSAqICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwNCj4g
LQkgKiAgKz09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0rIFBBR0VfU0laRSAoNEtCKQ0K
PiAtCSAqICB8ICAgICAgICAgIERlYnVnIGxvZ3MgICAgICAgICAgIHwNCj4gLQkgKiAgKz09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT0rICsgREVCVUdfU0laRQ0KPiAtCSAqICB8ICAgICAg
ICBDcmFzaCBEdW1wIGxvZ3MgICAgICAgIHwNCj4gLQkgKiAgKz09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT0rICsgQ1JBU0hfU0laRQ0KPiAtCSAqICB8ICAgICAgICAgQ2FwdHVyZSBsb2dz
ICAgICAgICAgIHwNCj4gLQkgKiAgKz09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0rICsg
Q0FQVFVSRV9TSVpFDQo+IC0JICovDQo+ICAJaWYgKGludGVsX2d1Y19jYXB0dXJlX291dHB1dF9t
aW5fc2l6ZV9lc3QoZ3VjKSA+IENBUFRVUkVfQlVGRkVSX1NJWkUpDQo+ICAJCURSTV9XQVJOKCJH
dUMgbG9nIGJ1ZmZlciBmb3Igc3RhdGVfY2FwdHVyZSBtYXliZSB0b28gc21hbGwuICVkIDwgJWRc
biIsDQo+ICAJCQkgQ0FQVFVSRV9CVUZGRVJfU0laRSwgaW50ZWxfZ3VjX2NhcHR1cmVfb3V0cHV0
X21pbl9zaXplX2VzdChndWMpKTsNCj4gIA0KPiAtCWd1Y19sb2dfc2l6ZSA9IFBBR0VfU0laRSAr
IENSQVNIX0JVRkZFUl9TSVpFICsgREVCVUdfQlVGRkVSX1NJWkUgKw0KPiAtCQkgICAgICAgQ0FQ
VFVSRV9CVUZGRVJfU0laRTsNCj4gKwlndWNfbG9nX3NpemUgPSBpbnRlbF9ndWNfbG9nX3NpemUo
bG9nKTsNCj4gIA0KPiAgCXZtYSA9IGludGVsX2d1Y19hbGxvY2F0ZV92bWEoZ3VjLCBndWNfbG9n
X3NpemUpOw0KPiAgCWlmIChJU19FUlIodm1hKSkgew0KPiAtLSANCj4gMi4zNy4xDQo+IA0KDQo=
