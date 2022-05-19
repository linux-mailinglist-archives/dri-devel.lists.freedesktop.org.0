Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A84BD52D315
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 14:54:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8713311A5B6;
	Thu, 19 May 2022 12:54:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9171D11A462;
 Thu, 19 May 2022 12:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652964855; x=1684500855;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=klHU5J8qZRwZzn7/p2Muh2My/s5xsGBXhpnN0gHawoE=;
 b=Jbd23+UdxckC1VQE0ignngcXi4pvSycUTu6WsUhjTranLU8WI5+RvZKR
 H+/Iac0ngVCZX/3eqyjkiwTzZhW/StkVj0ACCg5WMu7BEv+KGyAvJcOSx
 TFSte6oft8w9ojlML7mCsu1FoW5FMmtiGbHlCjvjTxOQ6mUzv0gP6Aojj
 4adrsEcTkoW6gBPT7yxvqxqRwpUpQ/u9QJIAeloD0boSv3goCTH9/95Ag
 pEtql0VNb9DkSTDtHA8UI0TL8wHJIynwHs1POz49q1yAnOExip7T6PxwH
 WLnltXSCAnXiNTL18NTzFOkvKKew0F96ymW0/CWpehdHkEKDXRrVOMAV9 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10351"; a="272320344"
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="272320344"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 05:54:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="714973021"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga001.fm.intel.com with ESMTP; 19 May 2022 05:54:14 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 19 May 2022 05:54:14 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 19 May 2022 05:54:14 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 19 May 2022 05:54:14 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.106)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 19 May 2022 05:54:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QJrQ0wEqTI5u9XjREsrPqOAeJlHP/RAW2ZYHCHB2PIpJecDqRbt5G1WZdr7R2WkDVB9KDYWhwRWbgtnwafkqQ8cFT8+0CzepuqjfMbVDw6+3xjRW+X1/dapDA6NcmvwqfsFq7Kdb9Q0yu67tKVLVJrTIA9SknEVjmfNWTKX05DJtWXKrm5j1iurl0iM5qYxkmJtou5aG9JE9LgFE9PcUJs/z+xpc9EbFCKBqwok4zZNNGgvQmkuJHWCbyW8JROr7Ut4KA7430XmpfdnY91UMff/DWmZOUjwvq/zAaFDlY5CRtSuUDBx/4mrXN1heFTqpbX1DLb54oSGeStRx2mVElg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=klHU5J8qZRwZzn7/p2Muh2My/s5xsGBXhpnN0gHawoE=;
 b=EHWvWTWEzCjTqFMkKUCmB+yPj9/nr6YiT0mncgx4Na82W8YA/bW35pnRwcwq4rk/7NP7Y61vT9GCvDlpAwSc8VQY5WvCS1yqVZS+ozrm5qLggpexnty/RE/hFredLAz/JV2AOnymE9ujpxQXZd5Sep2FsPW7qh7ulnM80itV9uW+MhPibE16N+va2DpFTX571kFhIoh0Iexj4UPFPDCMBhjPXYsK3WDrHu7FnbGH+/mp28Sly9HztNHMHvD3zFHTvFDKtS0FZpMBrsw0l0afyWfV9nolnLUeWyw/u45/kme1N76s072ZyMwKEkscHLrgdgQodFaslKqX79R4LF6cdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR11MB1324.namprd11.prod.outlook.com (2603:10b6:3:15::14) by
 DM6PR11MB4595.namprd11.prod.outlook.com (2603:10b6:5:2ac::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.13; Thu, 19 May 2022 12:54:12 +0000
Received: from DM5PR11MB1324.namprd11.prod.outlook.com
 ([fe80::2df3:4862:e431:2f20]) by DM5PR11MB1324.namprd11.prod.outlook.com
 ([fe80::2df3:4862:e431:2f20%5]) with mapi id 15.20.5250.020; Thu, 19 May 2022
 12:54:12 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 01/11] drm/radeon: switch over to ttm_bo_init_reserved
Thread-Topic: [PATCH 01/11] drm/radeon: switch over to ttm_bo_init_reserved
Thread-Index: AQHYa2aVqSO0ePN1+EyRUYzEGvyXQq0l9jIAgAAxgnA=
Date: Thu, 19 May 2022 12:54:12 +0000
Message-ID: <DM5PR11MB1324EE629E070768A1E0E6ADC1D09@DM5PR11MB1324.namprd11.prod.outlook.com>
References: <20220519095508.115203-1-christian.koenig@amd.com>
 <20220519095508.115203-2-christian.koenig@amd.com>
In-Reply-To: <20220519095508.115203-2-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.401.20
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: db91456c-2bc9-4599-716a-08da3996ac1c
x-ms-traffictypediagnostic: DM6PR11MB4595:EE_
x-microsoft-antispam-prvs: <DM6PR11MB459536BF70F03E82216C6641C1D09@DM6PR11MB4595.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rCq+1RDQOBfuqNhvd7+6HJYWLxBz5jo8W1hzv53TgnIblVqWBKbOD5Atxnq2Q/FqW9SXKGeBlZG4WH+hBdmjMvinuyefev2rlIEyM1KjdzqovigEdeTQFtYMJaPdr6UGYQILdmU6AtDk2ac64Pi1cvXV5piQb3gXUhYjrzZ9hw8/37dm5Urq3LY396rdjqXI0nCPXqw/mjKZSIpidm0fnjNd45UxBWGc3qJ09f8g9DZs3Ojao6/4SrFduvwCT+n9N8A3sS2GT1HRY0mB3Ut3XcNNN/bojV76L+KfURweW5/cQ5d4xqaGjW0c32shrOwyj9Mh6wGIV6AEtjRc8MavTDqoiIubIJIiJebSKiXxMYkUyj/f5gC1z8PLnGoRVfQPO3Io/DuEh6pwC/Xuf78iE/9629NU1xkTv0ThHoiK8YkDFv0hZZ/jegQC4UEciTQZF79+7kAShp8Pb5M/vWPL6S5FiZcPjaX38prilMQDfOnbFWWZ+DHeUQBqv64EeA+WuEpU25LeQ8Hto1H6RUkCosm/B6rIFBqxT7D1BRURUdIOwAI8wMOYrNuTJlkifNH9AymhhbAiCtIb4k18OlybT8ymhEJTFuFP58ZEkkU2VatD0Vr7UiDSYrjSgPaAmuF3SZFQEkoN2ZDzR3weZNPRMxgCAyrJg7u47YJKyAyPDh+zNLx1nMfs/+Ya42j90ZaBVMZoGuxn2ZHTtUwmtj/spQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1324.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(52536014)(55016003)(110136005)(86362001)(8936002)(54906003)(6506007)(7696005)(9686003)(71200400001)(316002)(5660300002)(26005)(33656002)(186003)(2906002)(66574015)(66556008)(76116006)(66476007)(82960400001)(4326008)(508600001)(122000001)(8676002)(66946007)(66446008)(64756008)(38100700002)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RmZ3RVcxUElXU25sa1dwZzJjRXVNUFp2UUJrS2RkdVlBdXBKMWpZQm44UWhU?=
 =?utf-8?B?VDM4aVBqai9mY0lzV3B0NEE2L1lPcUw4NG94SWd3cTlPdmRPdEE5MHVnd3RI?=
 =?utf-8?B?VWljcUZIVW94OE4wTnAyVnByK0twcFp0VXppUHFMQ08xRFNFdjBoS2d6ZHhC?=
 =?utf-8?B?K1d0bWpyT0dHa1pGcXZEOERlcFJEZHlKWXFWOWdsMmgycVhlMWNEUVFVZWl3?=
 =?utf-8?B?THF5V1Y0T2ZUMFVkcUwyZ3NEblVVbFZQQmtaNGtaYjA0TlZjMFhvTElydUFa?=
 =?utf-8?B?bTBmbnJBUzA2L1hUaldJREl2NEJOL3YyK2dTQmZFWGhqelhsbXVLcWJYc0lm?=
 =?utf-8?B?alhpLzd0YlRFcW9xUCtVZWhSRlFiRkYwZHp0Q3pHTHRPN2ZDaFA1R1d5QXZI?=
 =?utf-8?B?QXNDYnczNHBFWWdRL3dDSnQ4TWE1eE45SHJUbjlMd3hGL0oycm1pbWc5dUFw?=
 =?utf-8?B?NmQvWGVMZjVkcDk5emg0bG1UNUZsKy9uUFA0U1hJck5Fd0Zha2pFWXFUOS9v?=
 =?utf-8?B?elp6SDN0NWVaVy9vUXA0S1BNSEZERTVQY0JGWXYxU1F2TGZQQ0FEMkMvcVRP?=
 =?utf-8?B?YTVES0JEZGN6c2FHMUE2OU1BZnBsWmNTQ3hjVUYwSXdVN1p1T0VKWGFNZ2lX?=
 =?utf-8?B?WVRrdFIwV1RhT3Q2WGcrWW9Va21mcDJ3MG1QTytYUDhQNXFKMzdUMFVxa1Vx?=
 =?utf-8?B?Y1N1Q0M5R0RVTE9QY25pWlV6R1lHdmVheHU3RWFhdjlMQnA3YzlWdmNZQkNa?=
 =?utf-8?B?aG1HQjdpTTZ1NEszWVVNeUVmcXRMekZ2QkRoRjhic1BlK2VMUDl6aGZCbzkr?=
 =?utf-8?B?dCtuVVFMU2toQnJhTnBpb045NDNQR0NxRDdHVkxkNUpSQ21xUWdabCs1ckI0?=
 =?utf-8?B?WWRzOVNtekMzUkloVXdNVnFvQWsxWDRjNWY0cG4rQTZ4emlDNzhtQndWN0NM?=
 =?utf-8?B?RXFTalptVVp1L0tDTmZRZjVzYllWZ3dFczFzT2NlbHJjMnd1emZPNit4WUVX?=
 =?utf-8?B?TGg3T2htY3NMQnk5akYrYkxqY1dKWlp5M0ZVR2FVTnI3S2J4QWxyQWMyTmdU?=
 =?utf-8?B?RXpKK1Y3V1NrcGRHWW5uR2xZalNPZ1hHNkMwMXRQbGt4aXR6aGtRdzNabjN6?=
 =?utf-8?B?dlVMbmI3NlVxQ203TU9ycHByWDVRNHdpbW9tcGJiTk9tSDNkUUNNeFNBbk4r?=
 =?utf-8?B?TzE4N0NWSjgwS0RGZkN4OEtReGpWSXg4dkxPaVdxRllocmN1WW5ZNm5jZGJW?=
 =?utf-8?B?V1RSa0xYcDlNOERMdVJpNll2NFdUVVZlRURmQS9MMEd4V21QYXZzUENEamNJ?=
 =?utf-8?B?c3RsVDFHK2Z2aWc1U2RSRE9tV0xXS0hVVXAvZE9yMDBwQWpPcXI5Z2Z1RThU?=
 =?utf-8?B?ZjY3VUtRZXdIMTVKN3RpMTYvdTlFQVd0R2JZVGtkK2UwZmxHbWlwanF6bGFo?=
 =?utf-8?B?RkR1Szc3UHI3dUhUeTEzcEhqZkhUZG9xeEhMNXlaUW56SXU1bXhNQ2F4bkl0?=
 =?utf-8?B?MWZPOUtPTTQwTmx0ZDNtUjZRU2ZJa3QxSWN5RUtoVG0vdS9GOCt0NW9EZGg0?=
 =?utf-8?B?alVQVzZEa1FtWVVIeHhyNXRNQ202V2dlUGRzYkZWNnJwNkpoQVFDdTJMWHlS?=
 =?utf-8?B?dDhFYzZ3Vm1wazhGdEdDUFc5ZEFaeUhXWUEydHpPamE0aFAzaDFGanlQQ1pD?=
 =?utf-8?B?OW5DaC9tVko4Zk9vdGhqaUFMWlJFeVQ4SmlYTVJHcUhLblJoNHhaeXQzcVRi?=
 =?utf-8?B?RE5JTllzcmRIaDZYbjkzL1ZJRExXK3dkak1DT3U0aTBSN3NvdGcwKzhETkJs?=
 =?utf-8?B?bSttREpVYkJRWGI1VlFpZWE5cXhPcTlIWktpQWdPcDE1NktLd09UUmdnRDdp?=
 =?utf-8?B?V0M3ajlUMm53SGE1Sk1GSlFzY0FHN0hjZ1VZWk1HM3FoaHV0SzViQmlGLzd1?=
 =?utf-8?B?WE5vYWhKRTVIdnFuWUR2Y1NBUEJLU0ZNM0hndkZVU002ZjJia1JjU1p4eFJx?=
 =?utf-8?B?YTRTMlY2QXNURkUreDA5ZGtrY096d09RYnZtZnU3MElvRFdPUGRYd3JHYmZX?=
 =?utf-8?B?dnhaeVFiTWFIRlcyUVdQYjY3UnZyOENiUHpBM2RZVGZ0ZHhJazhDRkxnWmZr?=
 =?utf-8?B?S2xhRlJxQ1k4cXlsWW5EdXBHNnpUdVF4K1pOSHM3QU02aVhLTklIK1E5N1pz?=
 =?utf-8?B?TXZlRGhwTVJRNmNYY3ZLRjlVVWxzSlZUL0dVYlpwZlRlOStGb0Z4eldPc1pH?=
 =?utf-8?B?L29xMVI0TExzR2g3NklnWW4zTGVDYUR3b1V3aUhFMkRvdE1MYk02K1ZsWVc2?=
 =?utf-8?B?V0czTWt0b1pNWDNpeE5RbFpvcVZhMm8xb3JpWHBrbjNmL1RYN2xTb0Jpd2Z1?=
 =?utf-8?Q?XmcIpr2zBeFhDexQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1324.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db91456c-2bc9-4599-716a-08da3996ac1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2022 12:54:12.1456 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y6Np5FPh6/6CXfyi0yNl3nHOwFkDha17FZ6aanobmkLp4BJ3Qeo8kT5QDmMBmDAmupk/9guPYc1G586HW3SOFb/0W/ZbI3o+XZbPlT9pSTE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4595
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
Cc: "matthew.william.auld@gmail.com" <matthew.william.auld@gmail.com>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogZHJpLWRldmVsIDxkcmktZGV2ZWwt
Ym91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZg0KPkNocmlzdGlhbiBL
w7ZuaWcNCj5TZW50OiBUaHVyc2RheSwgTWF5IDE5LCAyMDIyIDU6NTUgQU0NCj5UbzogaW50ZWwt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPkNjOiBtYXR0aGV3LndpbGxpYW0uYXVsZEBnbWFp
bC5jb207IENocmlzdGlhbiBLw7ZuaWcNCj48Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPjsgZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPlN1YmplY3Q6IFtQQVRDSCAwMS8xMV0gZHJt
L3JhZGVvbjogc3dpdGNoIG92ZXIgdG8gdHRtX2JvX2luaXRfcmVzZXJ2ZWQNCj4NCj5Vc2UgdGhl
IG5ldyBpbnRlcmZhY2UgaW5zdGVhZC4NCj4NCj5TaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2
bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+DQo+LS0tDQo+IGRyaXZlcnMvZ3B1L2RybS9y
YWRlb24vcmFkZW9uX29iamVjdC5jIHwgMTcgKysrKysrKysrKystLS0tLS0NCj4gMSBmaWxlIGNo
YW5nZWQsIDExIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+DQo+ZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX29iamVjdC5jDQo+Yi9kcml2ZXJzL2dwdS9k
cm0vcmFkZW9uL3JhZGVvbl9vYmplY3QuYw0KPmluZGV4IDZjNGE2ODAyY2E5Ni4uMWQ0MTRmZjRh
YjBjIDEwMDY0NA0KPi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX29iamVjdC5j
DQo+KysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fb2JqZWN0LmMNCj5AQCAtMTMz
LDkgKzEzMywxMiBAQCBpbnQgcmFkZW9uX2JvX2NyZWF0ZShzdHJ1Y3QgcmFkZW9uX2RldmljZSAq
cmRldiwNCj4gCQkgICAgIHN0cnVjdCBkbWFfcmVzdiAqcmVzdiwNCj4gCQkgICAgIHN0cnVjdCBy
YWRlb25fYm8gKipib19wdHIpDQo+IHsNCj4tCXN0cnVjdCByYWRlb25fYm8gKmJvOw0KPi0JZW51
bSB0dG1fYm9fdHlwZSB0eXBlOw0KPiAJdW5zaWduZWQgbG9uZyBwYWdlX2FsaWduID0gcm91bmR1
cChieXRlX2FsaWduLCBQQUdFX1NJWkUpID4+DQo+UEFHRV9TSElGVDsNCj4rDQo+KwkvKiBLZXJu
ZWwgYWxsb2NhdGlvbiBhcmUgdW5pbnRlcnJ1cHRpYmxlICovDQo+KwlzdHJ1Y3QgdHRtX29wZXJh
dGlvbl9jdHggY3R4ID0geyAha2VybmVsLCBmYWxzZSB9Ow0KPisJZW51bSB0dG1fYm9fdHlwZSB0
eXBlOw0KPisJc3RydWN0IHJhZGVvbl9ibyAqYm87DQo+IAlpbnQgcjsNCj4NCj4gCXNpemUgPSBB
TElHTihzaXplLCBQQUdFX1NJWkUpOw0KPkBAIC0yMDAsMTEgKzIwMywxMyBAQCBpbnQgcmFkZW9u
X2JvX2NyZWF0ZShzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldiwNCj4gI2VuZGlmDQo+DQo+IAly
YWRlb25fdHRtX3BsYWNlbWVudF9mcm9tX2RvbWFpbihibywgZG9tYWluKTsNCj4tCS8qIEtlcm5l
bCBhbGxvY2F0aW9uIGFyZSB1bmludGVycnVwdGlibGUgKi8NCj4gCWRvd25fcmVhZCgmcmRldi0+
cG0ubWNsa19sb2NrKTsNCj4tCXIgPSB0dG1fYm9faW5pdCgmcmRldi0+bW1hbi5iZGV2LCAmYm8t
PnRibywgc2l6ZSwgdHlwZSwNCj4tCQkJJmJvLT5wbGFjZW1lbnQsIHBhZ2VfYWxpZ24sICFrZXJu
ZWwsIHNnLCByZXN2LA0KPi0JCQkmcmFkZW9uX3R0bV9ib19kZXN0cm95KTsNCj4rCXIgPSB0dG1f
Ym9faW5pdF9yZXNlcnZlZCgmcmRldi0+bW1hbi5iZGV2LCAmYm8tPnRibywgc2l6ZSwgdHlwZSwN
Cj4rCQkJCSAmYm8tPnBsYWNlbWVudCwgcGFnZV9hbGlnbiwgJmN0eCwgc2csIHJlc3YsDQo+KwkJ
CQkgJnJhZGVvbl90dG1fYm9fZGVzdHJveSk7DQo+KyAgICAgICAgaWYgKCFyKQ0KPisJCXR0bV9i
b191bnJlc2VydmUoJmJvLT50Ym8pOw0KPisNCg0KSGkgQ2hyaXN0aWFuLA0KDQpJIGFtIG5vdCB1
bmRlcnN0YW5kaW5nIHRoaXMgdW5yZXNlcnZlLg0KDQpUaGUgb3JpZ2luYWwgY29kZSBwYXRoIGRv
ZXMgbm90IGhhdmUgaXQuICBJdCBsb29rcyBsaWtlIHR0X2JvX2luaXQgd2lsbCBkbyB0aGlzLCBi
dXQgb25seSBpZiAhcmVzdi4NCg0KU2hvdWxkIHRoaXMgYmU6DQogICAgaWYgKCFyZXN2KQ0KICAg
ICAgICAgIHR0bV9ib191bnJlc2VydmUoJmJvLT50Ym8pOw0KDQo/DQoNCk0NCg0KDQo+IAl1cF9y
ZWFkKCZyZGV2LT5wbS5tY2xrX2xvY2spOw0KPiAJaWYgKHVubGlrZWx5KHIgIT0gMCkpIHsNCj4g
CQlyZXR1cm4gcjsNCj4tLQ0KPjIuMjUuMQ0KDQo=
