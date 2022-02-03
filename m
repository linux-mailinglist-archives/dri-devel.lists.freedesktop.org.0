Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E06FC4A8094
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 09:46:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5177A10E740;
	Thu,  3 Feb 2022 08:46:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D331B10E6C7;
 Thu,  3 Feb 2022 08:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643878005; x=1675414005;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Yg5EyKfVCDqla/J9Bfi4T/m1bfsvblX04JeWfmXUGhg=;
 b=PP2PBEQIE//YoaK1LR8Yzqi74m/43a7Z+uIx7FvA5uCCRlhsokALuvCw
 5E9hWirVNcrRDGd1QCbZ75PNVCD74rE3UZwChyyQisYP7UkbdOQy397DG
 jx+XLFgJK+fUw1NkDdwldqa1TCMpQNjMIfuNkBWpegVSrd3R3+M6fUFSw
 7xLLUdIeELzKTj+lf8EEgeFFzUUBFwZ0k+3omfiTxcNIBnpg+iSdpBC/Q
 Wm67rthRQuKq+MDrDpaPo4y4trlpto1flVGmV1IW4owCriYopNW8SUzwM
 bOPfFOWdDqPHI4JJmev8spCfNa5BtluVEEjG8GRPZaYYWdMhOHo/a7To4 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10246"; a="245696038"
X-IronPort-AV: E=Sophos;i="5.88,339,1635231600"; d="scan'208";a="245696038"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 00:46:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,339,1635231600"; d="scan'208";a="620431797"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by FMSMGA003.fm.intel.com with ESMTP; 03 Feb 2022 00:46:45 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 3 Feb 2022 00:46:44 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 3 Feb 2022 00:46:44 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 3 Feb 2022 00:46:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z6Yh3JxGaqFmvrLws2KNQWp8aURBJaD3eiNeiiILshzPWhV7HVqlDDvFxMBoJV28CdOoaQKDkkgBehYg0oyhV+CAhgc81nISryNcKLTyRs80hIolQjyjy9erh3sskmBnYWsocZhIYj42zG+dB2kP1xehUXgFyHqEchSG5IiamlkZDTe3OE/J9FBc0n9blQhDHECTaNG0KVGn5zOdr5vsulLdAR9KNKubRYaSDryt2u+Er4Mj04KsnPG/D51hwppyJOJjgajlUNtkPr5pY4vYVdyxiFmnyXFNmCVkerIGrq+B5TaR3RWS9cqeMeCPex2I4mBOXD5e3RGwjyCD+uFMsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yg5EyKfVCDqla/J9Bfi4T/m1bfsvblX04JeWfmXUGhg=;
 b=QYSbhArbyo3v9CYQ1BOk85T82sSg/mWvLQ9y1s6B/PSj6AUTUEhWMaRipI+eCuqZPManpqICzGQ5q9gnATgEQpEKcebwBksh9pbekS9LqDWDpGK3rD8s9ySdlBR5aYM44Qkl67BMyA62vxSvjT8B6qxbzZb9mtnnv2AIOnhY0HsFI7PHYY6mHiLgIIvK0zM9RjeXPoSBI/Erm4ukjudv7eFpkykaFVkoZdmWgAi7M9N+CyaC2jz7OGXvx4gXNsCKAeL86TrnpVz0Uir9b0NbolXa+tGufIFM7/2dimd2TjVNNpSAdqyZkYNz1SJL6XfH2KxnnHDpks3ypjnW6//KMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CY4PR11MB1352.namprd11.prod.outlook.com (2603:10b6:903:2a::23)
 by PH0PR11MB4871.namprd11.prod.outlook.com (2603:10b6:510:30::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 08:46:41 +0000
Received: from CY4PR11MB1352.namprd11.prod.outlook.com
 ([fe80::fdaf:f5ea:bd3b:21ce]) by CY4PR11MB1352.namprd11.prod.outlook.com
 ([fe80::fdaf:f5ea:bd3b:21ce%4]) with mapi id 15.20.4930.022; Thu, 3 Feb 2022
 08:46:41 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: RE: [PATCH 1/6] drm: add writeback pointers to drm_connector
Thread-Topic: [PATCH 1/6] drm: add writeback pointers to drm_connector
Thread-Index: AQHYGBFc644uMi5dVk+qjo8qaeIXBKyADxWAgAFvsuA=
Date: Thu, 3 Feb 2022 08:46:40 +0000
Message-ID: <CY4PR11MB135245B0AD8668F04DC02549E3289@CY4PR11MB1352.namprd11.prod.outlook.com>
References: <20220202085429.22261-1-suraj.kandpal@intel.com>
 <20220202085429.22261-2-suraj.kandpal@intel.com>
 <CAA8EJppf5XL5+NSD+oksW9Zo1DKboPT5KBZwLmyF44q61wkxQA@mail.gmail.com>
In-Reply-To: <CAA8EJppf5XL5+NSD+oksW9Zo1DKboPT5KBZwLmyF44q61wkxQA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.200.16
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 26dcb3d7-23f5-46c0-6510-08d9e6f1b2c6
x-ms-traffictypediagnostic: PH0PR11MB4871:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <PH0PR11MB487179C6A22D8BA69180B955E3289@PH0PR11MB4871.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yLOaiXA+eSrZKYPWtbd2rabv3Ffrz3D9htN5R64Z94mW7F7x1yXDxHZPzn9fexB8D/66KEs5gz4P59LGPR/xTpwIemxzXkQ667LZJieBo8CKN9CSDfo0PaSYaBOeV2nROD+L4qxNnzT+Xn/zaR7bx3+TaoIyNaP8KIoyjJAq6yHvA0zv2zNp/uHBIYK1dxYMKw0eagPMPhE1SWGrPvfR4QGE2u9AsDZ8cn/sfmu9hQJQ/uoxU2qlexWJEaY8g3svmxmJOPl77uwiJOKQUmpcBjGY0Wt8lVS++6gWT3nLL5mRItnoyCvku0HiOX4gO6KotHhkf4VAQNR7eaV/GBDhRybod8iKm6z/WJjz1yL+/FnpFSSWcxR5DxFAjI1ZXSIqVTbOTOq1KYLJgIuj3rszq01iY+24Zj91XonobnU6/XGMiX3+q+QX0vxaJTzEBwotHV8QKRr7WmcSrTbIriWliyPsWnqKqD1cDtdsbUsX6LAFgDyR0ZGeJ3Qe5iDpHQ3qMMq4lOVCDOhkJ+c+wxgpfg0cFGyp+j5zX0vhD8Q4H3/5Xux4I3WSXIHP0a+CC+yQwm/sc/d0xrtyyCindZOOn06xYzFs6nIGwMbVlztSyX4whgnpb0EcFx5iRVG+IEubBwilZRpVGWYW/9raNW3qH9C5D8jdlut5/mR5LUoE7V/jluT5TrdWUknn4ubZuB9Yn3McQhS8qgpTCLeZbugkJg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR11MB1352.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(26005)(186003)(55016003)(316002)(33656002)(86362001)(71200400001)(55236004)(9686003)(508600001)(38070700005)(2906002)(6506007)(7696005)(38100700002)(64756008)(122000001)(82960400001)(5660300002)(52536014)(66476007)(66556008)(66946007)(76116006)(54906003)(4326008)(66446008)(8936002)(8676002)(6916009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eFc3MVB4cWMzNlI3YnBwY1hXYXNFTzZzS1lRNHNIV2hKeHVQb1ptUExOQlEv?=
 =?utf-8?B?TU1oWG5YR2VQYUpkRUhqL25tODRFR0RhdGhsYnhqL3RKMUc2Ri9rSnJIenlN?=
 =?utf-8?B?aFUyUDc0VGtheEgrZzFGWEhkTFF5OURKL3lpajR3VGxWcEdLS0JFaTdRRWMw?=
 =?utf-8?B?U3FMbE9qSXBHNmFnSmhvcFhoSjVkekZjNmdGUkhSMVBBdklFYjMvU3Q0OWJS?=
 =?utf-8?B?a1BVMDRJRGlueWczNm9ZK3JodERGbzJaWmZhbENJcXR3REVNenZ0bk4ySUxI?=
 =?utf-8?B?dzBNSjh6TzdCTmhoSnlVT1JUUFh0UWRUZlQxSWlsVWI1YWdMVkV3NXZFbzk3?=
 =?utf-8?B?Qmg4ZG44dE9UVmQ2c3FuTFQxVWord0JyUnNxWFJJUVM4SVFvdGlzNUpjRjVK?=
 =?utf-8?B?c0R2Y3FOQ0g0ZGxoOVM5MzFTTXRZRDV5NlVkUUwrdzNoSExHekZtbmdoQnBD?=
 =?utf-8?B?ZitpZmZKK0RIRVFyQnY5b0c4S21nSEh4SHJqZjBKN0tadHZqYWtzbklqdWdw?=
 =?utf-8?B?N0xyWUZ3alJ3OTZLUTdaLzU1UDZOWm5NQzFocUhNWk9BV202UXc1bTZkeXcz?=
 =?utf-8?B?WnEvVm5ZM0hydlJqT3IzNGZtR2VWbS9RQVQ2TG1VNFo3WUtkQUFLNGFUTFJI?=
 =?utf-8?B?RmtCTFFNeVhVR09IcUI3WG1heWxVQWVBcXgxN3BBMVp0S2xzWW0xV0VvMHly?=
 =?utf-8?B?WDFVZU1kNTVyTXhvK08zM1NPL0I3S3NEVE9DRG0vbkhQNGV6aEdGdXFLcnNH?=
 =?utf-8?B?TFQrS2tpV2wyOENJY3JwbnNHMHNZWmZkd1paVURUSFNxY2djazBmUlBoaVJL?=
 =?utf-8?B?Mjd6SHNsSlRtRzJFcWJQenVkSjZBZHpObFUybHhVRld1WlBWZnRmSWQyejVZ?=
 =?utf-8?B?dzdjSDM4Q05Cd2tUeEdDWlRyUXhwN3ZQOVFjYTRkQ3V2V0xPWFVWclBBNCtl?=
 =?utf-8?B?SmtaOTlVMVFWVUUyZUM4TmJXVGhwbUE4QlB5ODdQZENZT2FCejNFWWdsWjIz?=
 =?utf-8?B?ak9RcTV5bSt5OVpJSnYvWE9nVE9GeHlvUE8va1ZxN1VKanQwa1RMYjZRZEpV?=
 =?utf-8?B?VElpZVh6eEFSUUlhMGFhd3A1Z0ZZV0ZxMkZYUTZnTEh4cUtKWk5ZUmZldWFK?=
 =?utf-8?B?M3dQZkpOYlJmZE1HYkpodEt1NUo3OXBvNVd6ZjB3ck54U1p5akVqeTAyVFFL?=
 =?utf-8?B?QjBDclBSUDQzV1liTHgzRDNlMFpZSmI4elRHMk15b3VkMm9pWCt5ekZOcnN1?=
 =?utf-8?B?a2dubXcxcXBSQlhFZGpGMWZCWjhMWXY2cVoydGw1RG54V0Zieit1a29za3Zj?=
 =?utf-8?B?WWNiZGFXL2hYMFBxQzZjWlUzajRzWGNTa1RZWHF0VWh6MlBDdGJXY21Jckhx?=
 =?utf-8?B?bFNzR0Jjc2R3MnJIUStFU2ZYME81RVlqc3dQZ2RiZkduZ3ZPb0J4SktMQnNz?=
 =?utf-8?B?YVJQcVR0cFRqck1CN29XeW9vekpON3ovYVVSQVJobE1Vc2dNSU9hTkMxWXRL?=
 =?utf-8?B?OU5rR2lzd2xQLy9oYW1aa25yempxMFFhaTN0ZHdIYUpTSzFnaHdsN0wrOEx3?=
 =?utf-8?B?b2p6RE5CM1RObXAwVXZiQlRNQTUxM1k5bklkN0llc2FQdFl2eE5GRG81ODQ3?=
 =?utf-8?B?RmxLeWFTWVdIcnlFaG1KbW5JblRlQVpJdS9DNjMrNVBGWVVYR1lDTDRBZ1dW?=
 =?utf-8?B?UGRiRmRmS21aTlRvRkhXTjBQTlV6RHE5Qm5iaE90aUNEa3FnM3Z3alJKcFJm?=
 =?utf-8?B?c09kRWQwc25ra0MwNTlOZnRkcnM3VDJYbkFzNW5UTi8xS09Fa2VMVGcyZ1NN?=
 =?utf-8?B?MHM1VGVmcFlNYzU0djM1NERDVjJXcm5WWWx0QmFOalVna3BzM3AzUHBpNExQ?=
 =?utf-8?B?eldZK0JmZDN6dGdkTHM0NXhiS1BOUHlTdHRzY0pBZnhZTHFsZ1JSVEJ1YnQz?=
 =?utf-8?B?QlN0d2hFM3c2U2Z3VTRhUVlpNUxyTTNkYjlhd2tRU3REYVdQWkR3by9MOHB2?=
 =?utf-8?B?QUJyZ1I2ZWdkc21MNzNzRjFvZUVRamt2cTJpOWp2STllbm5CdHZXRXBLQnZ3?=
 =?utf-8?B?YnJRbGNPSUJKTmVsMWFQN0E0dG5NSVJCeEdEbjd3N0NTVXl6K21UWEZSUms3?=
 =?utf-8?B?bTJJMlVlRnVUM2NjTHdSeXRJVkZldUxIdkxsQ2YrRE0vR0xKS3l2d2cxcUg4?=
 =?utf-8?Q?gkyaqHsz68E3LD4KD3EDzOY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB1352.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26dcb3d7-23f5-46c0-6510-08d9e6f1b2c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2022 08:46:40.9395 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q30fMc0uQ/GtRzCrHnCPTOfWYL76UA77QnzgWoi6Zs+x2IYrn7OAmZCB7MZGWYRb8sY7e1Fw8eM85Trvn8cJMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4871
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
Cc: "carsten.haitzler@arm.com" <carsten.haitzler@arm.com>, "Nikula,
 Jani" <jani.nikula@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "Murthy, Arun R" <arun.r.murthy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCkhpIERtaXRyeSwNClRoYW5rcyBmb3IgeW91ciBjb21tZW50cw0KIA0KPiBDb3VsZCB5b3Ug
cGxlYXNlIGNsYXJpZnksIHdoeSBkbyB5b3Ugd2FudCB0byB1c2UgaW50ZWxfY29ubmVjdG9yIGZv
ciB0aGUNCj4gd3JpdGViYWNrIGNvbm5lY3Rvcj8NCj4gSSBjYW4gc2VlIGEgdXNlY2FzZSBmb3Ig
c2hhcmluZyBhbiBlbmNvZGVyIGJldHdlZW4gdGhlIGRpc3BsYXkgYW5kIHdyaXRiYWNrDQo+IHBp
cGVsaW5lcyAoYW5kIGlmIEknbSBub3QgbWlzdGFrZW4sIHRoaXMgaXMgdGhlIGNhc2UgZm9yIEFi
aGluYXYncyBjYXNlKS4NCj4gSG93ZXZlciwgc2hhcmluZyB0aGUgaGFyZHdhcmUtYmFja2VkIGNv
bm5lY3RvciBhbmQgd3JpdGViYWNrIGNvbm5lY3Rvcg0KPiBzb3VuZHMgbGlrZSBhIHNpZ24gb2Yg
YSBsb29zZSBhYnN0cmFjdGlvbiBmb3IgbWUuDQo+IA0KPiBQbGVhc2UgY29ycmVjdCBtZSBpZiBJ
J20gd3JvbmcgYW5kIEludGVsIGRyaXZlciB3b3VsZCByZWFsbHkgYmVuZWZpdCBmcm9tDQo+IHJl
dXNpbmcgaW50ZWxfY29ubmVjdG9yIGFzIGEgYmFzZSBmb3IgZHJtX3dyaXRlYmFja19jb25uZWN0
b3IuDQo+IA0KDQpUaGUgdGhpbmcgaXMgZHJtX3dyaXRlYmFja19jb25uZWN0b3IgY29udGFpbnMg
ZHJtX2Nvbm5lY3RvciBhbmQgZHJtX2VuY29kZXIgZmllbGRzDQp3aGljaCBnZXQgaW5pdGlhbGl6
ZWQgd2hlbiB3ZSBjYWxsIGRybV93cml0ZWJhY2tfY29ubmVjdG9yX2luaXQgYWRkaW5nIHRoZSBj
b25uZWN0b3INCnRvIHRoZSBsaXN0IG9mIGNvbm5lY3RvcnMgZm9yIHRoZSBkcm1fZGV2aWNlLg0K
Tm93IGlmIEkgZGVjaWRlIG5vdCB0byB3cmFwIGRybV93cml0ZWJhY2tfY29ubmVjdG9yIHdpdGgg
aW50ZWxfY29ubmVjdG9yIHRoZSBpc3N1ZQ0KaXMgSSdsbCBoYXZlIHRvIGFkZCBhIGxvdCBvZiBj
aGVja3MgYWxsIG92ZXIgdGhlIGRyaXZlciB0byBzZWUgaWYgdGhlIGRybV9jb25uZWN0b3IgaXMg
YWN0dWFsbHkNCnByZXNlbnQgaW5zaWRlIGludGVsX2Nvbm5lY3RvciBvciBub3QuIEkgZG9u4oCZ
dCBzZWUgdGhlIHBvaW50IG9mIG5vdCBoYXZpbmcgZHJtX3dyaXRlYmFja18NCmNvbm5lY3RvciBh
cyBldmVuIHRob3VnaCBpdOKAmXMgYSBmYXV4IGNvbm5lY3RvciB3ZSBzdGlsbCB0cmVhdCBpcyBh
cyBhIGNvbm5lY3RvciBhbmQgaXQgd291bGQNCmJlIGJldHRlciBmb3IgdXMgdG8gdXNlIGludGVs
X2Nvbm5lY3RvciBmb3Igd3JpdGViYWNrX2Nvbm5lY3Rvci4NCkFsc28gdGhlIGN1cnJlbnQgZHJt
X3dyaXRlYmFja19jb25uZWN0b3Igc3RydWN0dXJlIGtpbmQgb2YgcmVzdHJpY3RzIGRyaXZlcnMg
Y29uc2VxdWVudGx5DQpkaWN0YXRpbmcgaG93IHRoZXkgaW1wbGVtZW50IHRoZWlyIHdyaXRlYmFj
ayBmdW5jdGlvbmFsaXR5LCBhcyBhIG1pZGxheWVyIEkgZG9uJ3QgZmVlbCB0aGF0DQp3b3VsZCBi
ZSB0aGUgcmlnaHQgYXBwcm9hY2ggYXMgZHJpdmVycyBzaG91bGQgaGF2ZSB0aGUgZnJlZWRvbSB0
byBkZXZlbG9wIHRoZWlyIG93biBmbG93DQp0byBpbXBsZW1lbnQgdGhlIGZ1bmN0aW9uYWxpdHkg
YW5kIHVzZSB0aGUgbWlkbGF5ZXIgYXMgYSBoZWxwZXIgdG8gZ2V0IHRoYXQgZG9uZS4gDQoNCkJl
c3QgUmVnYXJkcywNClN1cmFqIEthbmRwYWwNCg0K
