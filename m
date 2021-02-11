Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D78318475
	for <lists+dri-devel@lfdr.de>; Thu, 11 Feb 2021 06:07:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3D416E055;
	Thu, 11 Feb 2021 05:07:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D76C6E055;
 Thu, 11 Feb 2021 05:07:29 +0000 (UTC)
IronPort-SDR: vZT/RrLpAeQ+j3eMrrrC59eBU0+9Nv7Fg8TfSuCiN/Tl7ayANHLOFLaktl2xb8ov59aahZelEe
 2E68GDkUHSOA==
X-IronPort-AV: E=McAfee;i="6000,8403,9891"; a="161339171"
X-IronPort-AV: E=Sophos;i="5.81,169,1610438400"; d="scan'208";a="161339171"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2021 21:07:28 -0800
IronPort-SDR: IdPNw3tY69jmd6VWDR+6I0i9Gjf8V6yk12JsQQzLzalA9/TX05ltAbMFXnuGlrod9KutKmGoJN
 xxDOr5HZTIjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,169,1610438400"; d="scan'208";a="397095717"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga008.jf.intel.com with ESMTP; 10 Feb 2021 21:07:28 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 10 Feb 2021 21:07:27 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Wed, 10 Feb 2021 21:07:27 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Wed, 10 Feb 2021 21:07:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SVkGTLop27WFoo2Q2Ug08M6hfarNIm72O+HpDU/4anukotrkr/nlUB9e+uh2IlabJtLv+H5egbonsw+EpNjxaSeZMXnd9dFrjAvolhq+83OhOrUX9z3ShonDMKAJiGspFvEEzQxZVazfBLd5ShA08LbQlH6eOu0GdtscQf2n3eDX+5rqV5ckFNvcMfUZwarJF2JRdUzM91l0RgdtdrZ9JQBacAUWP0TunmeIwDNm75akiibO1XwEgdNk1ysN8UlBLVONczgsPTHWqScFzr3yaR1z/JQi40620Hm4VHV62BgZDLTHbzFVUePxmNo6QQ8QrJzGuiEs3CELnMfyg8rmgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3FFQqsuzP64peBGxf2ymJpY1GAccQ6TSJEHwXETGRYQ=;
 b=eq1kiH38PqGOmUF7Zl3UntfHKXbS6TdUxCUwXQO4DZgNPLGmO3oQISPtCdpC0B7QKvlyTHkvBRBYD2Z9kspdwPXkhRiuSMr+t0CgQq6+GMA1Klq9/7DPk5Utllf7s6S9Ot2CmwcZqN8Agdd6rBsM2T9w9BgGxJXdn7WbHPFC/7UryvS9nPM9AEgvsIs9wbhqRhCuBvle670qBD7ISQsD3BDmTXKRNAZciLah+dBdoC5BdlMSoI69b97Mp9phYBQgxHM22UJXZQYROauwO4bFEJIJCXS8UblgKygmSkScLIHrcfY9fQuD7ifSkL9JwUAmdwegjVR5DTNF2iu1XQdkdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3FFQqsuzP64peBGxf2ymJpY1GAccQ6TSJEHwXETGRYQ=;
 b=qPWj1ZUpFHVay+oS/u6NTgTBaW5lkuaHz4hhpPBIttewzcJFImvJ6wr4BHRjyWqLAVPmDBIU6O24S9DO7Lr7YvG+qGO2dewuHxa9ODuWM5X/cTG7MPp+ZSvArfMoItKBZ7FwqzaPkGY2qRKwQAp5YiWzqP1nRWsl/zEEiXYmMPs=
Received: from SA2PR11MB5068.namprd11.prod.outlook.com (2603:10b6:806:116::10)
 by SN6PR11MB3184.namprd11.prod.outlook.com (2603:10b6:805:bd::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Thu, 11 Feb
 2021 05:07:16 +0000
Received: from SA2PR11MB5068.namprd11.prod.outlook.com
 ([fe80::d9fb:7552:f19b:402b]) by SA2PR11MB5068.namprd11.prod.outlook.com
 ([fe80::d9fb:7552:f19b:402b%3]) with mapi id 15.20.3825.032; Thu, 11 Feb 2021
 05:07:16 +0000
From: "Ram Moon, AnandX" <anandx.ram.moon@intel.com>
To: "Swarup, Aditya" <aditya.swarup@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>, "Auld, Matthew"
 <matthew.auld@intel.com>, "Surendrakumar Upadhyay, TejaskumarX"
 <tejaskumarx.surendrakumar.upadhyay@intel.com>
Subject: RE: [PATCH] drm/i915/adl_s: Add gmbus pin mapping
Thread-Topic: [PATCH] drm/i915/adl_s: Add gmbus pin mapping
Thread-Index: AQHW/6NYzv5egIFjlE+7ubcZnwGZO6pRkwqAgADLiLA=
Date: Thu, 11 Feb 2021 05:07:16 +0000
Message-ID: <SA2PR11MB5068E455C10A33AE70A5D416AE8C9@SA2PR11MB5068.namprd11.prod.outlook.com>
References: <20210210115441.6703-1-anandx.ram.moon@intel.com>
 <1d8a1fa5-0d74-abd7-983f-b597c4307bd5@intel.com>
In-Reply-To: <1d8a1fa5-0d74-abd7-983f-b597c4307bd5@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [183.83.139.121]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7f3537c9-5b12-49d1-559f-08d8ce4ae6c4
x-ms-traffictypediagnostic: SN6PR11MB3184:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB3184C532195C5A61AF9EFFE7AE8C9@SN6PR11MB3184.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: O0ZR6BxFAZP3g+4mkxNZxyFkkNzAH5UUptZXGLbiUdTQsaHaVMcRz0lQHXMWyxjfoqYbmhRpeAoRLVI8xdGwGL/BKchUrSF5DG0Ly1fe5LkUkbISO03RxC8Dw8STfiRDu9/8q7gbLewjDgwZhfpAC6HsN8N4dRjf8TQLCoUM++vfaIz9UIfT5GwhNte+4xh3AxNn57X8uArKynFlLr+QkdX5iaofNuj3adyWfYNB7B7jjKovmtV7W7JSQainzLLEvW476hNSAObVI9bORPESXVVxqfJ8qAJCpQGtOktVQKuWDHiEYu7iTR+B6QP1Bp5RBW2jg3pHyTG/3vzzVskiMma/z00qp8fJy3KHHhxWfGLH+/zAcd/dcMgC3Stg5f+0e9oDgOFsOq0Pjr3SkhRkzrjVLHRwACEHfE0A3Hc4RiXQN9Vx1evV5TZGRO7kivYynMA2+oLmiR/+IAeL9vvS4I7ZbZA5a+UDazPOcbBUI0DIRU3ssMIqnKlPpRycBa0duw8zuLwPc9/cLpRtj/jw8NxNMS8mgEip0ejMpecE48qWWpVaT5MdI7aJFyy5RozL
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB5068.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39860400002)(396003)(346002)(366004)(376002)(450100002)(478600001)(66946007)(186003)(71200400001)(53546011)(83380400001)(86362001)(26005)(6506007)(7696005)(33656002)(8936002)(66556008)(6636002)(64756008)(66476007)(2906002)(76116006)(8676002)(66446008)(110136005)(316002)(55016002)(9686003)(921005)(52536014)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?QVFHcVRtbDlPRmpwRkhUMUQycVNIK3B3VGs0NExBV2o5bkx2ZGkxWDJaaDN6?=
 =?utf-8?B?cnFaYXA1U1V0Y3ZtRUp2QU45OTdObmFnU0dVY3JSTFR6RkV2S243TUxWd1l2?=
 =?utf-8?B?QkUyVzJMN3h5NEZTVENOMjBHUHAyU1dVdmdPQ2lIZHRhV21QbmNhY3Z6SHY5?=
 =?utf-8?B?ZlgweGxQSWMxWDRZeC9vb0U2Q3ZtUnhaTWZhaWlKL3EvSFBlN1JnWW9ERGw2?=
 =?utf-8?B?dVhIcktyTUJVK3hLUkREbGJZNWYyN0N3OUdaM3BEZG9mT0dLMm1xVVYvK3V6?=
 =?utf-8?B?YXVMYVVhSVY3VXAxa2FqZVVQOWgxelhCZUpzeTI3UmNOVzFXMy9UTEVOYjJw?=
 =?utf-8?B?aWc3V2Y1TXhBQVh4ejRXVGNCMmEwT0Z2T2hXUnNJbzhWQXhrbGdHTmlVdGoz?=
 =?utf-8?B?cDA4OHk2VmFnWk5JVmFFQ1pXc3VOVXJOZ1lQbFU4YmdoRklFOU5LWXllSTJo?=
 =?utf-8?B?VjV1WUZmL0NhUW9PZjJJWTI2YVUzS0FFVVMrVzNKMldleno0S0VYSzkyd0R5?=
 =?utf-8?B?UE5wd1h0dFFXNWdtYXlFZFdJQVZ3czZ6TDBoMGNkdjR6SkZlY0JLQm4wMXEr?=
 =?utf-8?B?ZkxDRzkwTEZKaXlJa0lKcGFjaVN0cUo4a2s2Y1dPZDlzSytZRzFuKzdTZHpm?=
 =?utf-8?B?YmdxdTA4WUxVd3F6VG5iWnBGZ3hFVU5hekhaUGhQM1c2ZkR6L2xSb0lmZHBt?=
 =?utf-8?B?T256YS93TzJhV2E4dFlRN2FFYTY4OUlueHp4M21FSk9Dd0RpaS9DT0dsRkZE?=
 =?utf-8?B?enA4UzJTUzgzeW8zRzdIUEEzQWtHc1NTT1B5WEFQVTRGb3UxdERZSGxVaXV0?=
 =?utf-8?B?dndieFo3NFlYWFlFVFByNW5hNFkwM2NLUFhGNDk4Ylc5Ymw3bEppeEpUS3VK?=
 =?utf-8?B?alZ5MWpYb1hyL3E1L2lRT3VTakh2S0hlK2QzZTFTU3lOYmxoMGVadUgxQ2tO?=
 =?utf-8?B?cEtJek1jTFh6SGxBSmtTNFFqaDQyM3dTc2szU2h1aElDa21qMlRzdUZiSm1Y?=
 =?utf-8?B?TElGbTRzRkhlMWZ1cENxTlNUNFBZakpqTUV5a3hUQWk3Q2QvZGJHYkd6VlNl?=
 =?utf-8?B?WGxkNjd0UnVjVGFZL2pKSEV6Um1pRXkyQ3ByN0RFcGR1K0JUTnZtZjBLYUdl?=
 =?utf-8?B?U1ViaWNSRmJJa05hSmU5N0ZJakhYeUkyMU1ndmhqL1lsZW0yRlVQUHg5T3Q3?=
 =?utf-8?B?M2lMN3F3TjhjZm8zWXlLNkxNVFFGZlFyN2h3b0FOcFY0R0ZObFNRZU1xSnJz?=
 =?utf-8?B?Mlo3Zk5GT0hYUDNLaGtjWmovQU5VTENqdElGMERTS0pzMFhsbStBUDNkZWZy?=
 =?utf-8?B?LzlnemdJei9XdkFqTUREMjR0M1g5Y08yYjBaL1ViNmFzN241a0Z6U3UvTEdo?=
 =?utf-8?B?OFY5NVQrOCtLUlFzcW1MMldOZzRuNHh0ZXlIcGhNTktReUNLTVB5cjVMa1VU?=
 =?utf-8?B?NUNvQ3lmNHVGeGRDOGIzT1FNUm8vRVFUS1FUQ0padG9xREtOUTNTVVIycDdX?=
 =?utf-8?B?SGJkN3JHU3liT3dUOHNYVk5yL05aczlwdGorOUVSdG9DUWlnQkdPMURkNGdT?=
 =?utf-8?B?OHhPQko1eTdLVDBZbXhHQXRrcC9iRmZKbVI3N2UzOVhYUWRkVGNQUTNEWGtU?=
 =?utf-8?B?aWsxWHpvbmkzbDE1RGVxd0haN2VWTXJmTk5JVXBMQXUyaVhoYktsaStjM1Fk?=
 =?utf-8?B?c2ZJRGJZK202dWMyZXpZV1JBV240YWEzNEU4RTFKemdyM0dReVNGNWRvdUd1?=
 =?utf-8?Q?7g+BA4S1dydWbGHVhlxyFjhlGR7JWPevKafxmDm?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB5068.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f3537c9-5b12-49d1-559f-08d8ce4ae6c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2021 05:07:16.6029 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pm3FZT+xc2g52M59bNgL6t27zZCmKfvpBGQML/6fFFADclqQjrhUqPjMMJGo77XDEZIby2NfDvHccYaUSlTwGFPudDoutpwFutNcB7ZAvkk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3184
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Aditya,

Thanks for your review comments.

-----Original Message-----
From: Aditya Swarup <aditya.swarup@intel.com> 
Sent: Wednesday, February 10, 2021 9:54 PM
To: Ram Moon, AnandX <anandx.ram.moon@intel.com>; intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; Roper, Matthew D <matthew.d.roper@intel.com>; Auld, Matthew <matthew.auld@intel.com>; Surendrakumar Upadhyay, TejaskumarX <tejaskumarx.surendrakumar.upadhyay@intel.com>
Subject: Re: [PATCH] drm/i915/adl_s: Add gmbus pin mapping

On 2/10/21 3:54 AM, Anand Moon wrote:
> Add table to map the GMBUS pin pairs to GPIO registers and port to DDC 
> mapping for ADL_S as per below Bspec.

Has this patch been tested on an ADLS system? Upstream CI AFAIK doesn't have support for ADL-S. Also comments below..

Reason I send this patch so that I could get more review comments for this below changes.
I have gone through the Bspec 20124 and I have debug this patch earlier,  
so that the mapping with DDC pin is correctly mapped
with respect to the configuration table in the Bspec, 
but still we observe GMBUS i2c handshake failure. 
How can we debug this further. 

> 
> Bspec:20124, 53597.
> 
> Cc: Aditya Swarup <aditya.swarup@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Anand Moon <anandx.ram.moon@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_gmbus.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c 
> b/drivers/gpu/drm/i915/display/intel_gmbus.c
> index 0c952e1d720e..58b8e42d4f90 100644
> --- a/drivers/gpu/drm/i915/display/intel_gmbus.c
> +++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
> @@ -52,6 +52,14 @@ static const struct gmbus_pin gmbus_pins[] = {
>  	[GMBUS_PIN_DPD] = { "dpd", GPIOF },
>  };
>  
> +static const struct gmbus_pin gmbus_pins_adls[] = {
> +	[GMBUS_PIN_1_BXT] = { "edp", GPIOA },

I am pretty sure that GMBUS_PIN_1_BXT should map to GPIOB(1) and not GPIOA(0) like what we have for ICP.

Ok, will update this in next version.

> +	[GMBUS_PIN_9_TC1_ICP] = { "tc1", GPIOD },
> +	[GMBUS_PIN_10_TC2_ICP] = { "tc2", GPIOE },
> +	[GMBUS_PIN_11_TC3_ICP] = { "tc3", GPIOF },
> +	[GMBUS_PIN_12_TC4_ICP] = { "tc4", GPIOG }, };
> +
>  static const struct gmbus_pin gmbus_pins_bdw[] = {
>  	[GMBUS_PIN_VGADDC] = { "vga", GPIOA },
>  	[GMBUS_PIN_DPC] = { "dpc", GPIOD },
> @@ -101,7 +109,9 @@ static const struct gmbus_pin gmbus_pins_dg1[] = {  
> static const struct gmbus_pin *get_gmbus_pin(struct drm_i915_private *dev_priv,
>  					     unsigned int pin)
>  {
> -	if (INTEL_PCH_TYPE(dev_priv) >= PCH_DG1)
> +	if (INTEL_PCH_TYPE(dev_priv) == PCH_ADP)

This check should be converted to IS_ALDERLAKE_S(dev_priv) instead of PCH check for PCH_ADP.
Unfortunately, we are reusing PCH_ADP for ADLS and ADLP which have different mappings but the same ADP PCH.
This will break ADLP. 

The PCH_ADP check for ADLS in intel_bios.c will also be changed in the ADLP patches that are going to be submitted upstream.

So might as well do the correct thing now and change this to IS_ALDERLAKE_S(dev_priv).

Ok will update this in next version.

> +		return &gmbus_pins_adls[pin];
> +	else if (INTEL_PCH_TYPE(dev_priv) >= PCH_DG1)
>  		return &gmbus_pins_dg1[pin];
>  	else if (INTEL_PCH_TYPE(dev_priv) >= PCH_ICP)
>  		return &gmbus_pins_icp[pin];
> @@ -122,7 +132,9 @@ bool intel_gmbus_is_valid_pin(struct 
> drm_i915_private *dev_priv,  {
>  	unsigned int size;
>  
> -	if (INTEL_PCH_TYPE(dev_priv) >= PCH_DG1)
> +	if (INTEL_PCH_TYPE(dev_priv) == PCH_ADP)

See comment above. Change to IS_ALDERLAKE_S(dev_priv)

Ok.

Aditya Swarup

> +		size = ARRAY_SIZE(gmbus_pins_adls);
> +	else if (INTEL_PCH_TYPE(dev_priv) >= PCH_DG1)
>  		size = ARRAY_SIZE(gmbus_pins_dg1);
>  	else if (INTEL_PCH_TYPE(dev_priv) >= PCH_ICP)
>  		size = ARRAY_SIZE(gmbus_pins_icp);
> 

Thanks
-Anand
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
