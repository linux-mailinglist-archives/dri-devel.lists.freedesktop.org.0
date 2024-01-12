Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A504282C0DA
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 14:26:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA1F210E10B;
	Fri, 12 Jan 2024 13:26:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 505EA10E0FC;
 Fri, 12 Jan 2024 13:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705065985; x=1736601985;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:mime-version: content-transfer-encoding;
 bh=mmXw4vorplKrtMbyblOIM3drdGmgRmgKpMaI/62POEQ=;
 b=iCGlG8CWNZdMSUxfciwbwu3WQ0O9fynikWisiB0SfuUVw9+pilusL7qg
 oVDKq3u4tsa8Pw3X6R2xv5z/qMgU15rYMoNqoaEpWNhUNfrF5I2ZNstUI
 GC5vkAzFH6fLKhE50Dah4Dpa+j19WyfHVOiExcxGeyVwTMm1vennXTZBo
 me4E8250E5kdhEgGjmepx6Wb7Ug2GDszvQ9CJvxrdw7uWl4zoS0giqAvF
 lWayUzx8tMJs7cC3/Uj1Y/2xNacxzAImlWqSCkIz6ppNbbawoVMbBiR7O
 avAzKLsdXCjbgyLV5SxOuoFKe55WFr8NzrSyEbxeHnuPVXutO3gmgMipe Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="6532805"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; 
   d="scan'208";a="6532805"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 05:26:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="817073562"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; d="scan'208";a="817073562"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jan 2024 05:26:23 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Jan 2024 05:26:23 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Jan 2024 05:26:23 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Jan 2024 05:26:23 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Jan 2024 05:26:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XjIXZ58o6L/gYA38OSSMs4WooO5R71ownzMrP+fJ/YZC+58ScUtnUpmVG+MkG8dodhQcD/OoVMdYXZa0crHmtOm5E86WC+YRHYLEH1yrcovigIa5BtbMUkBGBvDOM5GJk20XZr1vq7HPJiHypwx8/AnvqTnO2EhJQ3vfpbZEn3zL32BLwIAudHtlyyPC93WZiX4dXuMbIWANbNjLM4oplnV9Wekp/skM1mAuu4om60t6oMu9/96aeWm2HD7gUu6wNtmouSc0ClDVIeEL6DvECdXw3btawflALaKlgL90H6xt7SXpY8BtX+S3ncvggJtgDAG/GguDX1+VzXTQvHd/mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DaIhXr2pYocaDu/k6vSOoQPk8HIRbF+doIrDJgFZU4A=;
 b=RGrkr7t2wb+t/nj5qs4uZnzsJ9TOosa1GR76a0quWsuHwCjECaHlECwiYlWCGuwuSgRvvsWJcaU+s0Cxcl3f2eqVXWcMg65eSU0waZs0dKNAU6FVDo8PMFDOLtQTEdzU5aTGZOXZVlM3xyOqCHUXghPhSMBsdw8XAO9a91nR+NxFNel6vQAgGhjDa+QETVexDeHljXNT6b0kh4zeerjwD9Z4QYGPve7H1Gh9s9ssG2+lvAMnG/5MqEizYZU6jdEz/d0Ho6k8F7nPvM7hdXMCV6RaHvPetiTsg2yxpf8bLVfRhukhG0AVqeuzHnJPG/GgHkTBCFfjgeoHmpL8sBfg+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB5777.namprd11.prod.outlook.com (2603:10b6:806:23d::16)
 by BL1PR11MB5320.namprd11.prod.outlook.com (2603:10b6:208:316::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21; Fri, 12 Jan
 2024 13:26:20 +0000
Received: from SA1PR11MB5777.namprd11.prod.outlook.com
 ([fe80::ce7d:700b:f444:f3c0]) by SA1PR11MB5777.namprd11.prod.outlook.com
 ([fe80::ce7d:700b:f444:f3c0%4]) with mapi id 15.20.7181.020; Fri, 12 Jan 2024
 13:26:20 +0000
From: "Sarha, Jyri" <jyri.sarha@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Nikula, Jani" <jani.nikula@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [3/3] ASoC: hdmi-codec: drop drm/drm_edid.h include
Thread-Topic: [3/3] ASoC: hdmi-codec: drop drm/drm_edid.h include
Thread-Index: AQHaRVruOe1Y4FJgbk2MU8ma7E0OPQ==
Date: Fri, 12 Jan 2024 13:26:20 +0000
Message-ID: <4eeb74d942acf24e468036e0732e5e32c6907f6f.camel@intel.com>
References: <20240104201632.1100753-3-jani.nikula@intel.com>
In-Reply-To: <20240104201632.1100753-3-jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB5777:EE_|BL1PR11MB5320:EE_
x-ms-office365-filtering-correlation-id: d804aed8-327f-4494-e1b7-08dc137210a2
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: db+BUYAKByjuJazI5kmIeABT/ItWzaBbMZ9e9XiGxT02HBOk4y9bp/c3oRdP76/M3gN4ghka3H7M/G3fcemUeQZZfuUQ4MkUw7rc+7VsGp3cwO/Xq12aViSL1QgWy99AkaHzCrHhFFA0Xro4MPpRq3u2LI09vFCBmdj64YmZSCOIG3iG4BQ5rqxaIJbaEhHIN3PXmDfJFWndGtX007is+qM4ChOZSTtN4dYQ9wox7hc9CuaKN508nqCiywDoSvAp/XniQpujOh8I+07tWeEo0hrQH7XH5GXIzpg45MRo080KVaGj3zDILC6q98YkpEIXmSgLoxYTc5jrOgKvKHHA9hwumYVjco6Vz3CxwUQRFjSJ3hwe/ZGNm6CZRt0VpThWoZ12GMQA2MfN7r/cnKdlwg3sJ7TlYGKG7Xm///+aPEwkUY4I5pSQlS3LssTNVDTBc7u5tDu8rKUTPkgbRqZjgCDt3rgBaEk6RywxKdy95Wu/XVgkGzBGhMwc72Ce9jUdD2BjvH/Oug0K4I4SDU3HFD0I+PyLS1pfRhs/3PsyQuXcJmxXnkUjKhxW1kmQU3xw3Qd2iY3g3eQnavDn+2yMSjlF9a2i4vPlZBbT8zIUnRKTvEpWg2FQ9GQnMLYohmUi
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB5777.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(366004)(39860400002)(396003)(136003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(36756003)(38070700009)(2616005)(26005)(4326008)(6512007)(8936002)(8676002)(7416002)(2906002)(5660300002)(478600001)(316002)(91956017)(54906003)(6486002)(6506007)(83380400001)(66446008)(76116006)(66946007)(64756008)(66476007)(66556008)(110136005)(71200400001)(41300700001)(86362001)(38100700002)(122000001)(82960400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QzJEVzl4UzBFTHB0Zll6THJaTDdGM3BOOGZJVWNrelJYM3laVXZJUjJLbHlY?=
 =?utf-8?B?N1l3Qmp3VkJldUw5amFXdWs3MG5BWEpVb3cza21YNUdpNEhVY3c3b3ptQTVD?=
 =?utf-8?B?SEl6Nk00WmZTWHFQNTlnQ1Z3ZWYwWnJNVVkwRVoxck5qUVR5dmJKd3VZZG1l?=
 =?utf-8?B?T1hhTkVzSXpXdWs2dlFQcWkvRkpFdll0TldHQno4ZTJPNXJteXNyMWFFSGNU?=
 =?utf-8?B?dVRuank0cmdDTlg3U3hEOER2N29qS2k0bTlRbXp0elBhblJ3UVIybnpFSGZk?=
 =?utf-8?B?anEvZldtY2dTQjBRYlpJa2RiNXMvN1A3YnFSV0tJdG90U3UrWnhVNTZTTWhz?=
 =?utf-8?B?Ukt3L1VGY1VINmhEM3hwa0NJaFh6b0dqaWZjbktyM1RpUElkVnNwbzdNNC8r?=
 =?utf-8?B?THFxRlRpOHltcTE2ZGxweWRDdzRMVHdMUEdiaW9rQzN2NHRpaUQrZDlza3Er?=
 =?utf-8?B?VHIvclEwZDRnamlIbFd6S0xVUklHZHVrQmcwMTUvOE8zZDZUOXpCUFFvZmJD?=
 =?utf-8?B?ajNuNWlma2hDV1M2R2lCWEphcENEZHlza0ZWeWhLVTc5SElXWm5XSlZlWU43?=
 =?utf-8?B?bkFGN1FNQk1XWCtOQzQ2M1dLMjlTYUdXTVBscHlVWFFnSG9jSml4NW85am9a?=
 =?utf-8?B?MENXS1RZeGVoc0xtbm8za3IwOVlTZU9xUHdrb1V2NU8yL0F4VDRyQmE2bW41?=
 =?utf-8?B?Q0FpZVhvSGw3ak5oYVNyZ1RSWndtd01VSk9JQjdmMWlSWGx5cWJ6Tm5DTDVE?=
 =?utf-8?B?cm54dmwzV0QrbXl3ckR2WmE2SzJVSVl5K2U0S0doZVVuOEw3bHRDZWpucmsw?=
 =?utf-8?B?UlpHT1k2b0FWR3d1bVFtS3JmV0VST0N1Z2d0eDErRjc4TEJuQTh6L2UwZGhp?=
 =?utf-8?B?VG81SnpmZGFyL2RlTEJzc2Nhay8wbGQ2WXlGa044V3IwQzgxbXpvZDQzelZq?=
 =?utf-8?B?U29TUDNMQ3lQT3B6QTl6NjM1K0Y4akZTRHZIS016cnhaalJadlhsdk82SWR2?=
 =?utf-8?B?ODVoNG9sditHMVFXSUdFQVZmek1wNFVEUWpyd3JpZTRPdXJBcUp3QU1MZDIr?=
 =?utf-8?B?aElDR2wxaXIxVFh3WHVUaERzOEZPSXVyUFByZGNLbkZueDVPT2g0UEpYc0Fo?=
 =?utf-8?B?SHhyaEwvTUFUVkVWeHdnZjFUL2dFRGJ0Mzh3LzgzOWxoWTBjSDNPc1JXRFBk?=
 =?utf-8?B?T2ZvK0xweFg2NTJGTnVjQ0xtU3VacG9DMzZSbVZQUDltMnhmQXFjV2VPaVVF?=
 =?utf-8?B?YUJkZ0drSUFzYWhpTGZQZFhJMHByVVFkaTRDa1p1eGJJMDF3MTFhSm8zeU5z?=
 =?utf-8?B?cTZVdlhTaUltak13eXlCOHZYbHpzT2tFeEZRaHF3aCtVQVZXS2pPOEdBRFp0?=
 =?utf-8?B?TFB6cU84MWY2STFkMnBUeTNtV3A2MllZK3J3bFVBWmFzVFdqV1Z0UUViQzZQ?=
 =?utf-8?B?YmxyaWZncE40UGJOTUk0WHozOG1CTzdxTmZ2VDluS1EzdlFURWVNeUFCa29j?=
 =?utf-8?B?VUJwV1ArS1pSMzRvK3dSOERZalNvVFpIcHR6UFJZMVVyV0F6U1BOejViN3h0?=
 =?utf-8?B?OHQ2aWNETkpDT2s2SUgvN2YrZ0YxQ21vQVdzaldGODNjemEzV20ySWJLeUhp?=
 =?utf-8?B?dENmNlZmUUxUVFNRRUR3bjJYMk9FNkdxY3RiTHliWUFPSVpVSlpjSHcvZko1?=
 =?utf-8?B?aFowaU1nc0VZa2JZZ1RSM3ZVaVZ2RFUweWlGNEs2Y3F6TlliZDhVNjlDRDA4?=
 =?utf-8?B?TlIyQUpBeEFPT3AxdE5CZU1kOWNjZzF3S0drUjJVTUJ5NjFPODRLU2xoSVBq?=
 =?utf-8?B?cllSb1E4MkhFNTEyZ3ArbDJ5cTQwV2xpaW5uYnI4RlF1L3dseG1QTGFPZWgy?=
 =?utf-8?B?a1Q0VGh1dXZOb0R6RHNoRG1jVlZMaXpDSVBRaElPZUFwTkZVUEFJUm91QUVx?=
 =?utf-8?B?cWsrbmRmVE53aVFTNEZZeEJzOVpvS2J4bHFVb3dzWTEzYjcxeUhyUHA5VlJr?=
 =?utf-8?B?cHZIS0k4UkRQUUZDbWJrckswbTZKbnNDckg2TWlTOXg4ODVMOU1MME1GSEhq?=
 =?utf-8?B?RHZpMWt6NWtHOElNWnNCV0hTT2g4SjVYZFdVUTgrT0J5QjIrSnV0TlNEcnNq?=
 =?utf-8?B?bFRiYnVsMTY5cXVqQkNvek11ZGN5eTJ1eFYwc0VpOXRtL0doVkw3dWszbWxQ?=
 =?utf-8?B?QUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5AF7FF3A25A92C428F1FE18C7B661F6A@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB5777.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d804aed8-327f-4494-e1b7-08dc137210a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2024 13:26:20.5969 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Cjjcd/z4B5DJNuDuf22R6EHqqOnoHXWoz2VPe16YJ1Epda4cJ/mUoY5/jnwqVhgYB/FDMR1ZvEUrVlq9CwurBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5320
X-OriginatorOrg: intel.com
Content-Transfer-Encoding: base64
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
Cc: "mripard@kernel.org" <mripard@kernel.org>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "rfoss@kernel.org" <rfoss@kernel.org>, "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "Hajda, Andrzej" <andrzej.hajda@intel.com>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "marijn.suijten@somainline.org" <marijn.suijten@somainline.org>,
 "perex@perex.cz" <perex@perex.cz>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDI0LTAxLTA0IGF0IDIyOjE2ICswMjAwLCBKYW5pIE5pa3VsYSB3cm90ZToNCj4g
aGRtaS1jb2RlYy5oIGRvZXMgbm90IGFwcGVhciB0byBkaXJlY3RseSBuZWVkIGRybS9kcm1fZWRp
ZC5oIGZvcg0KPiBhbnl0aGluZy4gUmVtb3ZlIGl0Lg0KPiANCj4gVGhlcmUgYXJlIHNvbWUgZmls
ZXMgdGhhdCBnZXQgZHJtL2RybV9lZGlkLmggYnkgcHJveHk7IGluY2x1ZGUgaXQNCj4gd2hlcmUN
Cj4gbmVlZGVkLg0KPiANCj4gdjItdjQ6IEZpeCBidWlsZCAoa2VybmVsIHRlc3Qgcm9ib3QgPGxr
cEBpbnRlbC5jb20+KQ0KPiANCj4gQ2M6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGdtYWlsLmNvbT4N
Cj4gQ2M6IEFiaGluYXYgS3VtYXIgPHF1aWNfYWJoaW5hdmtAcXVpY2luYy5jb20+DQo+IENjOiBE
bWl0cnkgQmFyeXNoa292IDxkbWl0cnkuYmFyeXNoa292QGxpbmFyby5vcmc+DQo+IENjOiBTZWFu
IFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4NCj4gQ2M6IE1hcmlqbiBTdWlqdGVuIDxtYXJpam4uc3Vp
anRlbkBzb21haW5saW5lLm9yZz4NCj4gQ2M6IGxpbnV4LWFybS1tc21Admdlci5rZXJuZWwub3Jn
DQo+IENjOiBmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBBbmRyemVqIEhh
amRhIDxhbmRyemVqLmhhamRhQGludGVsLmNvbT4NCj4gQ2M6IE5laWwgQXJtc3Ryb25nIDxuZWls
LmFybXN0cm9uZ0BsaW5hcm8ub3JnPg0KPiBDYzogUm9iZXJ0IEZvc3MgPHJmb3NzQGtlcm5lbC5v
cmc+DQo+IENjOiBMYXVyZW50IFBpbmNoYXJ0IDxMYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2Fy
ZC5jb20+DQo+IENjOiBKb25hcyBLYXJsbWFuIDxqb25hc0Brd2lib28uc2U+DQo+IENjOiBKZXJu
ZWogU2tyYWJlYyA8amVybmVqLnNrcmFiZWNAZ21haWwuY29tPg0KPiBDYzogSmFyb3NsYXYgS3lz
ZWxhIDxwZXJleEBwZXJleC5jej4NCj4gQ2M6IFRha2FzaGkgSXdhaSA8dGl3YWlAc3VzZS5jb20+
DQo+IENjOiBsaW51eC1zb3VuZEB2Z2VyLmtlcm5lbC5vcmcNCj4gQWNrZWQtYnk6IE1heGltZSBS
aXBhcmQgPG1yaXBhcmRAa2VybmVsLm9yZz4NCj4gU2lnbmVkLW9mZi1ieTogSmFuaSBOaWt1bGEg
PGphbmkubmlrdWxhQGludGVsLmNvbT4NCj4gUmV2aWV3ZWQtYnk6IEFuZGkgU2h5dGkgPGFuZGku
c2h5dGlAbGludXguaW50ZWwuY29tPg0KPiBBY2tlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5k
ZXIuZGV1Y2hlckBhbWQuY29tPg0KDQpSZXZpZXdlZC1ieTogPGp5cmkuc2FyaGFAbGludXguaW50
ZWwuY29tPg0KDQpUaGFua3MsDQpUaGUgaW5jbHVkaW5nIG9mIGRybV9lZGlkLmggaW4gaGRtaS1j
b2RlYy5oIGlzIGEgcmVsaWMgZnJvbSBteSBwcmUNCnVwc3RyZWFtaW5nIHZlcnNpb24gb2YgaGRt
aS1jb2RlYy4gSSBkb24ndCB0aGluayBpdCB3YXMgZXZlciBuZWVkZWQNCmluIGFueSB1cHN0ZWFt
IHZlcnNpb24uDQoNCkJlc3QgcmVnYXJkcywNCkp5cmkNCg0KPiAtLS0NCj4gwqBkcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL2xvbnRpdW0tbHQ5NjExLmPCoMKgwqAgfCAxICsNCj4gwqBkcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL2xvbnRpdW0tbHQ5NjExdXhjLmMgfCAxICsNCj4gwqBkcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuY8KgIHwgMSArDQo+IMKgZHJpdmVycy9ncHUvZHJt
L21zbS9kcC9kcF9kaXNwbGF5LmPCoMKgwqDCoMKgwqDCoCB8IDEgKw0KPiDCoGRyaXZlcnMvZ3B1
L2RybS90ZWdyYS9oZG1pLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMSArDQo+IMKg
ZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfaGRtaS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwg
MSArDQo+IMKgaW5jbHVkZS9zb3VuZC9oZG1pLWNvZGVjLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB8IDEgLQ0KPiDCoDcgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9s
b250aXVtLWx0OTYxMS5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9sb250aXVtLWx0OTYx
MS5jDQo+IGluZGV4IDk2NjM2MDFjZTA5OC4uYjkyMDVkMTRkOTQzIDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL2xvbnRpdW0tbHQ5NjExLmMNCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS9sb250aXVtLWx0OTYxMS5jDQo+IEBAIC0xOCw2ICsxOCw3IEBADQo+IMKg
DQo+IMKgI2luY2x1ZGUgPGRybS9kcm1fYXRvbWljX2hlbHBlci5oPg0KPiDCoCNpbmNsdWRlIDxk
cm0vZHJtX2JyaWRnZS5oPg0KPiArI2luY2x1ZGUgPGRybS9kcm1fZWRpZC5oPg0KPiDCoCNpbmNs
dWRlIDxkcm0vZHJtX21pcGlfZHNpLmg+DQo+IMKgI2luY2x1ZGUgPGRybS9kcm1fb2YuaD4NCj4g
wqAjaW5jbHVkZSA8ZHJtL2RybV9wcmludC5oPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9sb250aXVtLWx0OTYxMXV4Yy5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9sb250aXVtLWx0OTYxMXV4Yy5jDQo+IGluZGV4IGU5NzFiNzVlOTBhZC4uZjNmMTMwYzFlZjBh
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2xvbnRpdW0tbHQ5NjExdXhj
LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9sb250aXVtLWx0OTYxMXV4Yy5jDQo+
IEBAIC0yMSw2ICsyMSw3IEBADQo+IMKgDQo+IMKgI2luY2x1ZGUgPGRybS9kcm1fYXRvbWljX2hl
bHBlci5oPg0KPiDCoCNpbmNsdWRlIDxkcm0vZHJtX2JyaWRnZS5oPg0KPiArI2luY2x1ZGUgPGRy
bS9kcm1fZWRpZC5oPg0KPiDCoCNpbmNsdWRlIDxkcm0vZHJtX21pcGlfZHNpLmg+DQo+IMKgI2lu
Y2x1ZGUgPGRybS9kcm1fcHJpbnQuaD4NCj4gwqAjaW5jbHVkZSA8ZHJtL2RybV9wcm9iZV9oZWxw
ZXIuaD4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHct
aGRtaS5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMNCj4g
aW5kZXggNTJkOTFhMGRmODVlLi5mYTYzYTIxYmRkMWMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jDQo+IEBAIC0zMSw2ICszMSw3IEBADQo+IMKgI2lu
Y2x1ZGUgPGRybS9kcm1fYXRvbWljLmg+DQo+IMKgI2luY2x1ZGUgPGRybS9kcm1fYXRvbWljX2hl
bHBlci5oPg0KPiDCoCNpbmNsdWRlIDxkcm0vZHJtX2JyaWRnZS5oPg0KPiArI2luY2x1ZGUgPGRy
bS9kcm1fZWRpZC5oPg0KPiDCoCNpbmNsdWRlIDxkcm0vZHJtX29mLmg+DQo+IMKgI2luY2x1ZGUg
PGRybS9kcm1fcHJpbnQuaD4NCj4gwqAjaW5jbHVkZSA8ZHJtL2RybV9wcm9iZV9oZWxwZXIuaD4N
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZHAvZHBfZGlzcGxheS5jDQo+IGIv
ZHJpdmVycy9ncHUvZHJtL21zbS9kcC9kcF9kaXNwbGF5LmMNCj4gaW5kZXggZDM3ZDU5OWFlYzI3
Li5jOGUxYmJlYmRmZmUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZHAvZHBf
ZGlzcGxheS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZHAvZHBfZGlzcGxheS5jDQo+
IEBAIC0xMSw2ICsxMSw3IEBADQo+IMKgI2luY2x1ZGUgPGxpbnV4L29mX2lycS5oPg0KPiDCoCNp
bmNsdWRlIDxsaW51eC9kZWxheS5oPg0KPiDCoCNpbmNsdWRlIDxkcm0vZGlzcGxheS9kcm1fZHBf
YXV4X2J1cy5oPg0KPiArI2luY2x1ZGUgPGRybS9kcm1fZWRpZC5oPg0KPiDCoA0KPiDCoCNpbmNs
dWRlICJtc21fZHJ2LmgiDQo+IMKgI2luY2x1ZGUgIm1zbV9rbXMuaCINCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9oZG1pLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEv
aGRtaS5jDQo+IGluZGV4IDQxN2ZiODg0MjQwYS4uMDk5ODdlMzcyZTNlIDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvaGRtaS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90
ZWdyYS9oZG1pLmMNCj4gQEAgLTI0LDYgKzI0LDcgQEANCj4gwqAjaW5jbHVkZSA8ZHJtL2RybV9h
dG9taWNfaGVscGVyLmg+DQo+IMKgI2luY2x1ZGUgPGRybS9kcm1fY3J0Yy5oPg0KPiDCoCNpbmNs
dWRlIDxkcm0vZHJtX2RlYnVnZnMuaD4NCj4gKyNpbmNsdWRlIDxkcm0vZHJtX2VkaWQuaD4NCj4g
wqAjaW5jbHVkZSA8ZHJtL2RybV9lbGQuaD4NCj4gwqAjaW5jbHVkZSA8ZHJtL2RybV9maWxlLmg+
DQo+IMKgI2luY2x1ZGUgPGRybS9kcm1fZm91cmNjLmg+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vdmM0L3ZjNF9oZG1pLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9oZG1p
LmMNCj4gaW5kZXggZjA1ZTJjOTVhNjBkLi4zNGY4MDdlZDFjMzEgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS92YzQvdmM0X2hkbWkuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdmM0
L3ZjNF9oZG1pLmMNCj4gQEAgLTM1LDYgKzM1LDcgQEANCj4gwqAjaW5jbHVkZSA8ZHJtL2Rpc3Bs
YXkvZHJtX3NjZGNfaGVscGVyLmg+DQo+IMKgI2luY2x1ZGUgPGRybS9kcm1fYXRvbWljX2hlbHBl
ci5oPg0KPiDCoCNpbmNsdWRlIDxkcm0vZHJtX2Rydi5oPg0KPiArI2luY2x1ZGUgPGRybS9kcm1f
ZWRpZC5oPg0KPiDCoCNpbmNsdWRlIDxkcm0vZHJtX3Byb2JlX2hlbHBlci5oPg0KPiDCoCNpbmNs
dWRlIDxkcm0vZHJtX3NpbXBsZV9rbXNfaGVscGVyLmg+DQo+IMKgI2luY2x1ZGUgPGxpbnV4L2Ns
ay5oPg0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9zb3VuZC9oZG1pLWNvZGVjLmggYi9pbmNsdWRl
L3NvdW5kL2hkbWktY29kZWMuaA0KPiBpbmRleCA5YjE2MmFjMWUwOGUuLjVlMWE5ZWFmZDEwZiAx
MDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9zb3VuZC9oZG1pLWNvZGVjLmgNCj4gKysrIGIvaW5jbHVk
ZS9zb3VuZC9oZG1pLWNvZGVjLmgNCj4gQEAgLTEyLDcgKzEyLDYgQEANCj4gwqANCj4gwqAjaW5j
bHVkZSA8bGludXgvb2ZfZ3JhcGguaD4NCj4gwqAjaW5jbHVkZSA8bGludXgvaGRtaS5oPg0KPiAt
I2luY2x1ZGUgPGRybS9kcm1fZWRpZC5oPg0KPiDCoCNpbmNsdWRlIDxzb3VuZC9hc291bmRlZi5o
Pg0KPiDCoCNpbmNsdWRlIDxzb3VuZC9zb2MuaD4NCj4gwqAjaW5jbHVkZSA8dWFwaS9zb3VuZC9h
c291bmQuaD4NCg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkludGVsIEZpbmxhbmQgT3kKUmVnaXN0ZXJlZCBBZGRy
ZXNzOiBQTCAyODEsIDAwMTgxIEhlbHNpbmtpIApCdXNpbmVzcyBJZGVudGl0eSBDb2RlOiAwMzU3
NjA2IC0gNCAKRG9taWNpbGVkIGluIEhlbHNpbmtpIAoKVGhpcyBlLW1haWwgYW5kIGFueSBhdHRh
Y2htZW50cyBtYXkgY29udGFpbiBjb25maWRlbnRpYWwgbWF0ZXJpYWwgZm9yCnRoZSBzb2xlIHVz
ZSBvZiB0aGUgaW50ZW5kZWQgcmVjaXBpZW50KHMpLiBBbnkgcmV2aWV3IG9yIGRpc3RyaWJ1dGlv
bgpieSBvdGhlcnMgaXMgc3RyaWN0bHkgcHJvaGliaXRlZC4gSWYgeW91IGFyZSBub3QgdGhlIGlu
dGVuZGVkCnJlY2lwaWVudCwgcGxlYXNlIGNvbnRhY3QgdGhlIHNlbmRlciBhbmQgZGVsZXRlIGFs
bCBjb3BpZXMuCg==

