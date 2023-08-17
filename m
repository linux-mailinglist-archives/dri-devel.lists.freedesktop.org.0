Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C2B77EEFE
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 04:13:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A305310E174;
	Thu, 17 Aug 2023 02:13:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B15E010E190;
 Thu, 17 Aug 2023 02:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692238379; x=1723774379;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BZrASgPVBgTm1zwKSXW7qSWQvrjFQKkat8i7zKeP1tg=;
 b=B2G3GP22r1wO0OM9KjicTNs9+G8bP2fgYEWZHQKIOd1Zc53hYRTJt/8Y
 7VuRNCG/6Q6K7c/AOf6fIkho21HDELlDAzrQxi/8S2XzvP/9mC+McVUem
 nxbl/tCypNPd0SE4lMTPPdu6jb5Bm6oYHWiJVDtT6/B1VQjHZak6DcfMD
 RGFem5HqVJDcIB7FzmpPD9Fg2eMmwUiuvzzjacZ9284TsSl26eXVb1BD9
 r74jDfApKD3zCnEKirkn7LDgVPQBMLz/NzBwHMtA4dJGLfBkkLzXtkTdB
 Ajfk1/cOYl0vqr+zfgeFo+kB8m9WEnUIwYW0lIf6LX+epCiisRtXKj3dk A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="362844079"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; d="scan'208";a="362844079"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2023 19:12:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="804455927"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; d="scan'208";a="804455927"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP; 16 Aug 2023 19:12:58 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 16 Aug 2023 19:12:58 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 16 Aug 2023 19:12:58 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 16 Aug 2023 19:12:58 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 16 Aug 2023 19:12:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OqoH2Z7mvAoVK1uauU4mSIqnorU2MgmW40EsYiTAb9dq3SutUywNgo3EdGIkxm00FcuSlVcxPqGDSawhDiHI3x/ROIBHGCZgwxNEc/V+3yRyFwD/FWYOsk5Zu9e00FmVv/MSX4EVJh0mhMCnXUMgN6H4hLiQGBKYOo1WLAWefJSPz8sflK692Q7XiAfYQgjeHRp/3gAri7NqrdQcs0GKBu/UXJMH+ZAklA6z0We8Bk79bboI9vagTa+aoojfOTKZBmAlpKgYsTS06LDhsPTeqpdBUNXlFK3k0M24vSkbScVV1UVIXmy9UMrOBNjfnIk3Mr4YB3pMueGUkXHcMsU/Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BZrASgPVBgTm1zwKSXW7qSWQvrjFQKkat8i7zKeP1tg=;
 b=iBrNjGO9TzdGjQorp2mRjEg53YAXBLH7SqcJkGppMbP241c3WdQAIIDZzVbMfZfzr1wbecimIYqD+rS6G0Zpc8HqpjIZTXHCY/ZcwFLGEz8kRNHa1PkUkmQReirWDJ0qeDjOALNOkmqu+A0X9MR4B2zhtr8Dtg3mj8013xanlAvDtLY/r7LM3Hp2Zn9gh87J8wJFKNDtiH4Bx49Xdu2BlbQ2RwRmg2CfyBPzR14fHCeuTGN5dXlSj7ZgAwb5iBX13+Dhc8d8igM4N9kzqw4EptlufizHyiHN6rKII7N9z6K4SsX9IzdxDYaQ+ooA7FgoyZ1JOp6Vr032RxF+dafZZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by MW5PR11MB5785.namprd11.prod.outlook.com (2603:10b6:303:197::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.30; Thu, 17 Aug
 2023 02:12:56 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::27f1:a7a0:b6db:6c99]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::27f1:a7a0:b6db:6c99%3]) with mapi id 15.20.6678.025; Thu, 17 Aug 2023
 02:12:54 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: Dave Airlie <airlied@gmail.com>, Felix Kuehling <felix.kuehling@amd.com>
Subject: RE: Implement svm without BO concept in xe driver
Thread-Topic: Implement svm without BO concept in xe driver
Thread-Index: AdnPImk6MOYV1wEITTKbUW99JKTN8AAlN1TAAAO9foAACdAN4AAGjR0AABKlsyAADoTWgAAB+b6AAAYiLxA=
Date: Thu, 17 Aug 2023 02:12:54 +0000
Message-ID: <SA1PR11MB6991D7E239EAB23CC8A9A36B921AA@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <SA1PR11MB699192A66D7A2CC7305A59569214A@SA1PR11MB6991.namprd11.prod.outlook.com>
 <SA1PR11MB6991F9E3107C963BDF95E04E9214A@SA1PR11MB6991.namprd11.prod.outlook.com>
 <e0d7d6a2-5c9d-6e17-4b4b-be03deb6c130@amd.com>
 <SA1PR11MB69918E5603E286961789DE6D9215A@SA1PR11MB6991.namprd11.prod.outlook.com>
 <3c125b60-df60-2037-c23f-918734e4973f@amd.com>
 <SA1PR11MB69916E51CE5A9217D447B91C9215A@SA1PR11MB6991.namprd11.prod.outlook.com>
 <7ae5f112-d0e9-cc52-2b22-7265ea435cc2@amd.com>
 <CAPM=9tyots9C8wEU0TgGnFmLOkfqn62ngaYYjV2yuTf7jwDGFw@mail.gmail.com>
In-Reply-To: <CAPM=9tyots9C8wEU0TgGnFmLOkfqn62ngaYYjV2yuTf7jwDGFw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|MW5PR11MB5785:EE_
x-ms-office365-filtering-correlation-id: dbbd7999-6fba-4042-c18b-08db9ec777b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9zbb0lINRnls2Cs+RyVq1kEUIjcaU7F/u/48+hzznYFzLCggqJR0XAN+Zo6yfobuwbufm2Lul6moIB9tx2T+nZlpURMlKehP1ECyN6+I+PvAss9EFvPjRTH5KdjSdmj8MIR3XXEmRyTWwGHjfqgGxuE6WsI+ySFizARCIChs2JH5IRP8eK+hkeX6C9AzLERqIfLt7FY12NnVxh1TtISV/p7ZX0QSOfQqEB3QoD0oUOZcD3KeCyY5Llj4C9TkjQ2NSdXMhAx271nkTHWNJNippsyblyO4+ff7M3WB564eGx/RGJmIQjgkSs2o1K1gca+Fs+JSmqLYrDy19UA6RCRwQD6DuFWY34tHPVnjjabzda2HqAKqjsvSOwIc/M7vdDX9r7P0jlIcJvZ/rZ4i9qz8FYkif6We99YYh/+DSzWSFeiZ9fIrBQpR8oevQQzi+BZF63XHIyLQzZvTmnVkeYnynPKt9NCdfyghI8U5MFkVWx+61NwygKOh61wEoU/N8t+5P4JwadQgUGZEmMbPVxQt7RY4XoKUS5B9EErE836C45zAWHxIHMBphUDw/MZoDGF/XL+/FRBM1HApdZr3LEULTj2QFUYni3J4KsfdwEQIHu8R2QIxrxy6FRd4g6plBB/8
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(346002)(136003)(366004)(376002)(451199024)(1800799009)(186009)(316002)(110136005)(54906003)(66556008)(66946007)(66476007)(64756008)(76116006)(66446008)(122000001)(5660300002)(41300700001)(52536014)(66574015)(38100700002)(38070700005)(4326008)(8936002)(8676002)(82960400001)(26005)(2906002)(83380400001)(55016003)(478600001)(86362001)(53546011)(9686003)(33656002)(7696005)(6506007)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UnBWUGFvWkpvbzRGY1hsUnlneGF1L3VUT3Byc3V1NjZwNTRqdE8wMWQ0T2gz?=
 =?utf-8?B?cEJtMTJuc3NqQis5dGxpRmFPR3BnYy93MW8rLy9hVEx6Z0NJL2ZmMU5QaHFn?=
 =?utf-8?B?MXc3VTZwbUhtOTJVZy84bzgwR0luTHdzaEhYQ0NrMUlqMnBydE8wZkNEWHd2?=
 =?utf-8?B?YmYwdmRDNzFuK1hIbVZkRWpzQTltbnl2UnZMWlJGUmN3ZTdreGpvejN6RWVx?=
 =?utf-8?B?Q2hWY1BkQWlVaVR4TmxzRXJHTlAycGY5UUJFb0JmRDlrLzBhVk9mMTNlUkVO?=
 =?utf-8?B?Wkg3N1Z1bHlySElZc0VSMGZJTFYxOXA5eVVsSEUrck50WFVRUmxER2R6cVNh?=
 =?utf-8?B?Q3hLdmZTSC9nK0tYR2tVZDM3VHZMNVZ1N3hvMXJRZmNVSDA3cTRTZEtyV2Zj?=
 =?utf-8?B?cElEMnBxM1NpQVJhek1WaW4rUlJ2bHFpZnNhMG9kckJRb21kK0R1Y21vaFlH?=
 =?utf-8?B?eVFrOHh0Njdpc0k4NlBKdXZ1ZE1ZbXcyajZTaEF5NXhBZnJyS3hWbUR5TThO?=
 =?utf-8?B?dlBkejdsVDQzK3ZENE9GR21pb2dnM0NialE0TS9nQmgyazhnenMweHZBNG84?=
 =?utf-8?B?R013R0NScWVsckxicmZKSWF1WlhOMVBBUjhCdGFQUnBjaCtZUFZuZlB4UlBz?=
 =?utf-8?B?SVZaeFExVmR6dnlSTnB5bzNiZzZaZXkzUnNzS25BZDVlbzhocjM0V0FjaUlG?=
 =?utf-8?B?SENmWnhvYmpmTE9lQTZSb1hVbjlrSjgreC9zektXSjlpcEZ0a201Vi9NY09T?=
 =?utf-8?B?cEFNSUNpUU56TUtRb1hOSm50OUFwR1FvYzJjY1BETGFpQW9iRWFjemdPSnlv?=
 =?utf-8?B?ZWdEM3dLM3RKbmZ5eEdqV3BVZGNzaVhhQ1FNRjRjOXVDOXRnT1NRVkE0U2F0?=
 =?utf-8?B?bzgvaDgxTDhFT0Z1N2dtK2xvaElqUGNoZmVIangxV2tYMlkrU285dzFGRGx6?=
 =?utf-8?B?aEM1RzFUWkNKZHZkRjBQT090OHRQRmpnZkg0NE5ybzk2amRFYk5RR2RBU0RV?=
 =?utf-8?B?c3BDaGF5UGhwaWJJa1kwUGdSWEZPZVRBR3A0MzQ5SE9OZ1VrazdwVW5HM1pM?=
 =?utf-8?B?UGswUUR5U3N1a2ttejBxVFBSZW01V1k3alYvUWVFdEhaMldBbDZ1KzdsLzFK?=
 =?utf-8?B?RGRGcCt6d3ZMR2ZxZmkwM0RVNlZhOE9nNmNvcks5RmI4OGM2aU1KK1VZY2hw?=
 =?utf-8?B?UEkwbzNMdi8ra1YwV1F5TTEzc1A4c1RtVWxoN1VmcXFEbjU5RjJSOVY0V0Zq?=
 =?utf-8?B?SnA4R2ZCUUtYZFE4V3Z0VFFPNk02RzBBR2RiRDhpODVZNFVCTnBrK1QrYjd6?=
 =?utf-8?B?cmlWWDlGczNDbTlxTzdDOW9kaSs2OTVNRDFLNFFxVmlHcERhd3N4c1VseFM3?=
 =?utf-8?B?dFJyNUNDMEJZeWo0aS9Hc1JLQUpCRGZYWWJzUkU1TmM0NTVUSDAzN0paQW03?=
 =?utf-8?B?M3lFaVRGS2F6S2hRMmF4ZWZ6c25MNmRJeG5lei9HR3B0MzAyTVZDSkZSYU9N?=
 =?utf-8?B?aVErdC9pU21WRW1zVzU5cEtiV0NtdTdmUTJXTFgwbzdyRDJlaThLU09QSHVU?=
 =?utf-8?B?OUM0WVNqcHBobXRsU2g3Q3lOOWhuYzd1UEVmVGY0NldvZDhWc1kzL0hCVHVG?=
 =?utf-8?B?WjRsOXF2N0NJaXRBZjBJWTBhZlZuL3g2R3VIUUEvVEl6MU4rdlBKc2p5Q2cw?=
 =?utf-8?B?SDkxcVFYQlBMSkxrNWdzOHJ1dTIrVjZvM1RVdlVKaVhBU0ZSM04wN3ViWGFQ?=
 =?utf-8?B?WENBbFc5RWVENVRpMFFGNmJ1UktpeVVQTkMwOVVTNWM1aURPVjkwdFM5Ty8z?=
 =?utf-8?B?YUNveDVzYlZTSzU4aFFKcWF2YzNHbnVXdzY2MEtUS1h3RXhjZVV0cDhoZzlR?=
 =?utf-8?B?N0N4dFVXQVRxdzNoZkN2RDVXS2lzVVEyTmFLcmdmM04wOWdsZGE4QThZbU0r?=
 =?utf-8?B?WDI3TGF6cGdsVTFlTTVmNTd6ZFVTSENKYm5SeUlmaGYwa05HZnM4R3hNblJy?=
 =?utf-8?B?b0YzWDNRVnYwWkdrTXRjUHdrSG5oZ2xoYloxTHZIbituclA3d056c0FrN0dP?=
 =?utf-8?B?QjZRUVJQL2VjVWdYRWRwWnlzZkJaeDNIK285RXBGWW4xUEFBR2NVSklGVjE3?=
 =?utf-8?Q?aOgc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbbd7999-6fba-4042-c18b-08db9ec777b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2023 02:12:54.6610 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h0gKe+c2ej3iahBURFuZEZhK6QH2W5h/Tv79JAfIeWHHIfKM9g+uqTf/pJbWf1+nb1TbT8gJmoH7t0D2Sxq6vA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5785
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
 =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 Philip Yang <Philip.Yang@amd.com>, "Welty, Brian" <brian.welty@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBEYXZlIEFpcmxpZSA8YWlybGll
ZEBnbWFpbC5jb20+DQo+IFNlbnQ6IEF1Z3VzdCAxNiwgMjAyMyA2OjUyIFBNDQo+IFRvOiBGZWxp
eCBLdWVobGluZyA8ZmVsaXgua3VlaGxpbmdAYW1kLmNvbT4NCj4gQ2M6IFplbmcsIE9hayA8b2Fr
LnplbmdAaW50ZWwuY29tPjsgQ2hyaXN0aWFuIEvDtm5pZw0KPiA8Y2hyaXN0aWFuLmtvZW5pZ0Bh
bWQuY29tPjsgVGhvbWFzIEhlbGxzdHLDtm0NCj4gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50
ZWwuY29tPjsgQnJvc3QsIE1hdHRoZXcNCj4gPG1hdHRoZXcuYnJvc3RAaW50ZWwuY29tPjsgbWFh
cnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tOw0KPiBWaXNod2FuYXRoYXB1cmEsIE5pcmFu
amFuYSA8bmlyYW5qYW5hLnZpc2h3YW5hdGhhcHVyYUBpbnRlbC5jb20+OyBXZWx0eSwNCj4gQnJp
YW4gPGJyaWFuLndlbHR5QGludGVsLmNvbT47IFBoaWxpcCBZYW5nIDxQaGlsaXAuWWFuZ0BhbWQu
Y29tPjsgaW50ZWwtDQo+IHhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0OiBSZTogSW1wbGVtZW50IHN2bSB3aXRob3V0IEJP
IGNvbmNlcHQgaW4geGUgZHJpdmVyDQo+IA0KPiBPbiBUaHUsIDE3IEF1ZyAyMDIzIGF0IDA4OjE1
LCBGZWxpeCBLdWVobGluZyA8ZmVsaXgua3VlaGxpbmdAYW1kLmNvbT4gd3JvdGU6DQo+ID4NCj4g
PiBPbiAyMDIzLTA4LTE2IDEzOjMwLCBaZW5nLCBPYWsgd3JvdGU6DQo+ID4gPiBJIHNwb2tlIHdp
dGggVGhvbWFzLiBXZSBkaXNjdXNzZWQgdHdvIGFwcHJvYWNoZXM6DQo+ID4gPg0KPiA+ID4gMSkg
bWFrZSB0dG1fcmVzb3VyY2UgYSBjZW50cmFsIHBsYWNlIGZvciB2cmFtIG1hbmFnZW1lbnQgZnVu
Y3Rpb25zIHN1Y2ggYXMNCj4gZXZpY3Rpb24sIGNncm91cCBtZW1vcnkgYWNjb3VudGluZy4gQm90
aCB0aGUgQk8tYmFzZWQgZHJpdmVyIGFuZCBCTy1sZXNzIFNWTQ0KPiBjb2RlcyBjYWxsIGludG8g
dHRtX3Jlc291cmNlX2FsbG9jL2ZyZWUgZnVuY3Rpb25zIGZvciB2cmFtIGFsbG9jYXRpb24vZnJl
ZS4NCj4gPiA+ICAgICAgKlRoaXMgd2F5IEJPIGRyaXZlciBhbmQgU1ZNIGRyaXZlciBzaGFyZXMg
dGhlIGV2aWN0aW9uL2Nncm91cCBsb2dpYywgbm8NCj4gbmVlZCB0byByZWltcGxtZW50IExSVSBl
dmljdGlvbiBsaXN0IGluIFNWTSBkcml2ZXIuIENncm91cCBsb2dpYyBzaG91bGQgYmUgaW4NCj4g
dHRtX3Jlc291cmNlIGxheWVyLiArTWFhcnRlbi4NCj4gPiA+ICAgICAgKnR0bV9yZXNvdXJjZSBp
cyBub3QgYSBwZXJmZWN0IG1hdGNoIGZvciBTVk0gdG8gYWxsb2NhdGUgdnJhbS4gSXQgaXMgc3Rp
bGwgYQ0KPiBiaWcgb3ZlcmhlYWQuIFRoZSAqYm8qIG1lbWJlciBvZiB0dG1fcmVzb3VyY2UgaXMg
bm90IG5lZWRlZCBmb3IgU1ZNIC0gdGhpcw0KPiBtaWdodCBlbmQgdXAgd2l0aCBpbnZhc2l2ZSBj
aGFuZ2VzIHRvIHR0bS4uLm5lZWQgdG8gbG9vayBpbnRvIG1vcmUgZGV0YWlscw0KPiA+DQo+ID4g
T3ZlcmhlYWQgaXMgYSBwcm9ibGVtLiBXZSdkIHdhbnQgdG8gYmUgYWJsZSB0byBhbGxvY2F0ZSwg
ZnJlZSBhbmQgZXZpY3QNCj4gPiBtZW1vcnkgYXQgYSBzaW1pbGFyIGdyYW51bGFyaXR5IGFzIG91
ciBwcmVmZXJyZWQgbWlncmF0aW9uIGFuZCBwYWdlDQo+ID4gZmF1bHQgZ3JhbnVsYXJpdHksIHdo
aWNoIGRlZmF1bHRzIHRvIDJNQiBpbiBvdXIgU1ZNIGltcGxlbWVudGF0aW9uLg0KPiA+DQo+ID4N
Cj4gPiA+DQo+ID4gPiAyKSBzdm0gY29kZSBhbGxvY2F0ZSBtZW1vcnkgZGlyZWN0bHkgZnJvbSBk
cm0tYnVkZHkgYWxsb2NhdG9yLCBhbmQgZXhwb3NlDQo+IG1lbW9yeSBldmljdGlvbiBmdW5jdGlv
bnMgZnJvbSBib3RoIHR0bSBhbmQgc3ZtIHNvIHRoZXkgY2FuIGV2aWN0IG1lbW9yeQ0KPiBmcm9t
IGVhY2ggb3RoZXIuIEZvciBleGFtcGxlLCBleHBvc2UgdGhlIHR0bV9tZW1fZXZpY3RfZmlyc3Qg
ZnVuY3Rpb24gZnJvbQ0KPiB0dG0gc2lkZSBzbyBobW0vc3ZtIGNvZGUgY2FuIGNhbGwgaXQ7IGV4
cG9zZSBhIHNpbWlsYXIgZnVuY3Rpb24gZnJvbSBzdm0gc2lkZSBzbw0KPiB0dG0gY2FuIGV2aWN0
IGhtbSBtZW1vcnkuDQo+ID4NCj4gPiBJIGxpa2UgdGhpcyBvcHRpb24uIE9uZSB0aGluZyB0aGF0
IG5lZWRzIHNvbWUgdGhvdWdodCB3aXRoIHRoaXMgaXMgaG93DQo+ID4gdG8gZ2V0IHNvbWUgc2Vt
YmxhbmNlIG9mIGZhaXJuZXNzIGJldHdlZW4gdGhlIHR3byB0eXBlcyBvZiBjbGllbnRzLg0KPiA+
IEJhc2ljYWxseSBob3cgdG8gY2hvb3NlIHdoYXQgdG8gZXZpY3QuIEFuZCB3aGF0IHNoYXJlIG9m
IHRoZSBhdmFpbGFibGUNCj4gPiBtZW1vcnkgZG9lcyBlYWNoIHNpZGUgZ2V0IHRvIHVzZSBvbiBh
dmVyYWdlLiBFLmcuIGFuIGlkbGUgY2xpZW50IG1heSBnZXQNCj4gPiBhbGwgaXRzIG1lbW9yeSBl
dmljdGVkIHdoaWxlIGEgYnVzeSBjbGllbnQgbWF5IGdldCBhIGJpZ2dlciBzaGFyZSBvZiB0aGUN
Cj4gPiBhdmFpbGFibGUgbWVtb3J5Lg0KPiANCj4gSSdkIGFsc28gbGlrZSB0byBzdWdnZXN0IHdl
IHRyeSB0byB3cml0ZSBhbnkgbWFuYWdlbWVudC9nZW5lcmljIGNvZGUNCj4gaW4gZHJpdmVyIGFn
bm9zdGljIHdheSBhcyBtdWNoIGFzIHBvc3NpYmxlIGhlcmUuIEkgZG9uJ3QgcmVhbGx5IHNlZQ0K
PiBtdWNoIGh3IGRpZmZlcmVuY2Ugc2hvdWxkIGJlIGluZmx1ZW5jaW5nIGl0Lg0KPiANCj4gSSBk
byB3b3JyeSBhYm91dCBoYXZpbmcgZWZmZWN0aXZlbHkgMiBMUlVzIGhlcmUsIHlvdSBjYW4ndCBy
ZWFsbHkgaGF2ZQ0KPiB0d28gImxlYXN0cyIuDQo+IA0KPiBMaWtlIGlmIHdlIGhpdCB0aGUgc2hy
aW5rZXIgcGF0aHMgd2hvIGdvZXMgZmlyc3Q/IGRvIHdlIHNocmluayBvbmUNCj4gb2JqZWN0IGZy
b20gZWFjaCBzaWRlIGluIHR1cm4/DQoNCk9uZSB3YXkgdG8gc29sdmUgdGhpcyBmYWlybmVzcyBw
cm9ibGVtIGlzIHRvIGNyZWF0ZSBhIGRyaXZlciBhZ25vc3RpYyBkcm1fdnJhbV9tZ3IuIE1haW50
YWluIGEgc2luZ2xlIExSVSBpbiBkcm1fdnJhbV9tZ3IuIE1vdmUgdGhlIG1lbW9yeSBldmljdGlv
bi9jZ3JvdXBzIG1lbW9yeSBhY2NvdW50aW5nIGxvZ2ljIGZyb20gdHRtX3Jlc291cmNlIG1hbmFn
ZXIgdG8gZHJtX3ZyYW1fbWdyLiBCb3RoIEJPLWJhc2VkIGRyaXZlciBhbmQgU1ZNIGRyaXZlciBj
YWxscyB0byBkcm1fdnJhbV9tZ3IgdG8gYWxsb2NhdGUvZnJlZSBtZW1vcnkuDQoNCkkgYW0gbm90
IHN1cmUgd2hldGhlciB0aGlzIG1lZXRzIHRoZSAyTSBhbGxvY2F0ZS9mcmVlL2V2aWN0IGdyYW51
bGFyaXR5IHJlcXVpcmVtZW50IEZlbGl4IG1lbnRpb25lZCBhYm92ZS4gU1ZNIGNhbiBhbGxvY2F0
ZSAyTSBzaXplIGJsb2Nrcy4gQnV0IEJPIGRyaXZlciBzaG91bGQgYmUgYWJsZSB0byBhbGxvY2F0
ZSBhbnkgYXJiaXRyYXJ5IHNpemVkIGJsb2NrcyAtIFNvIHRoZSBldmljdGlvbiBpcyBhbHNvIGFy
Yml0cmFyeSBzaXplLg0KDQo+IA0KPiBBbHNvIHdpbGwgd2UgaGF2ZSBzeXN0ZW1zIHdoZXJlIHdl
IGNhbiBleHBvc2Ugc3lzdGVtIFNWTSBidXQgdXNlcnNwYWNlDQo+IG1heSBjaG9vc2UgdG8gbm90
IHVzZSB0aGUgZmluZSBncmFpbmVkIFNWTSBhbmQgdXNlIG9uZSBvZiB0aGUgb2xkZXINCj4gbW9k
ZXMsIHdpbGwgdGhhdCBwYXRoIGdldCBlbXVsYXRlZCBvbiB0b3Agb2YgU1ZNIG9yIHVzZSB0aGUg
Qk8gcGF0aHM/DQoNCg0KSWYgYnkgIm9sZGVyIG1vZGVzIiB5b3UgbWVhbnQgdGhlIGdlbV9ib19j
cmVhdGUgKHN1Y2ggYXMgeGVfZ2VtX2NyZWF0ZSBvciBhbWRncHVfZ2VtX2NyZWF0ZSksIHRoZW4g
dG9kYXkgYm90aCBhbWQgYW5kIGludGVsIGltcGxlbWVudCB0aG9zZSBpbnRlcmZhY2VzIHVzaW5n
IEJPIHBhdGguIFdlIGRvbid0IGhhdmUgYSBwbGFuIHRvIGVtdWxhdGUgdGhhdCBvbGQgbW9kZSBv
biB0b3BlIG9mIFNWTSwgYWZhaWN0Lg0KDQpUaGFua3MsDQpPYWsNCg0KPiANCj4gRGF2ZS4NCg==
