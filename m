Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3FE703E9E
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 22:29:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39D7B10E279;
	Mon, 15 May 2023 20:28:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09E4710E274;
 Mon, 15 May 2023 20:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684182533; x=1715718533;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=+oGfIguzndQcGcP1+AaL522Hz2or2rlDqJfjnBbEzPg=;
 b=nx3x172JS5SM34EqS3BE0X6PCiqdhRaz4Q3XlVE6IBta8H+2N49UHMqD
 hwuxnPRsta+d2cN+seEliYFy5N9mc1S9U2bG2lkaww4GAeIY2+e5zKaVB
 y29/eNL5tkmVMTyYbadBiZ1u0vqZCM/GZZdueuBGu/CgLrRKnNElG+Oj7
 K8E9QtaCerujbZvmJoSMXwN4yEkuYoeojDe3XWHIZvKGFgrXZRyEbLiCm
 txegpwRBg6PPj25rkOa5RbmZvrI4PqO1YbXMRUKiyA+9ihAk7o10R45eL
 miliPNZZoiG3el4gxgQoHCTUggDAPBWhFJHf6TWY/LKMvRvgdu5KzpHcm w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="379471627"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200"; 
 d="scan'208,217";a="379471627"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 13:28:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="790795744"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200"; 
 d="scan'208,217";a="790795744"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP; 15 May 2023 13:28:51 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 15 May 2023 13:28:51 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 15 May 2023 13:28:50 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 15 May 2023 13:28:50 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 15 May 2023 13:28:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HFcpkt/2psru7spMbQwnZEH8EK+xbTRcoqPW70JT/cOi/tsuq/DkpKPALYZxnojg/Tg35AxBWdPaEnT9Ur5Xbsb9hPbnAJgIBEdgxrjeNSi00JrhZeih0YU8mzyvEuVJ6xIcj8xyJRFXy+XD2Il+iXv+3McNzn3IF5YdIBoZtBFYkn0xLr1JXgOxFfj6upM98yfUTS5M1ktokuHB+PiXLW7JmU2wGetVUaegKAqblnnrAznCbLRLVNkRinOEsNm70aQwO+qRK2YrwHXK1NMl8lcIe5kxexJ1V+ctAK4hep8L+vT3Q8U+Tw+1CpEYb1aDAb93/Fe70lmqAMh9mnGC6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gUj1WzDvG2LjnF2iEJlp0JLhSmrin4Iw/q3OH2z7D+o=;
 b=Y1ye0PmutYNXGZXQr34DXdnkXJtFwmX0MjTZnXa/dy53IX4NIPyii+l33BjXwCKY4y8qb31eaPdaOhzTvvvbKXbdtI6tzwr9V/JjYJHbWYs44dbh3n8VCvWC2ZLsevNuiwpJ418WzV6tJy0PrBCQ9xAqpTX9vJZJhvyLhxqN0nTDJLk4iwBmc98QSaS13CbrEPnMhZj6fSX1FhKY70o7BVCR9V7+oib5fvjTXfY8CWNxABqTL6XvaPa7btqPhPdVkEXGSl4z7xy+Nnkf8HdTGwEqvAOg223yPNRECDPmzHlu2GFo8XCq4A2nhuFmqQbCPQZCjSd5udSmlZvsGcBXEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB2567.namprd11.prod.outlook.com (2603:10b6:a02:c5::32)
 by SJ2PR11MB7473.namprd11.prod.outlook.com (2603:10b6:a03:4d2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 20:28:48 +0000
Received: from BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::8ec1:2f24:6309:c008]) by BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::8ec1:2f24:6309:c008%3]) with mapi id 15.20.6387.022; Mon, 15 May 2023
 20:28:48 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH v8 2/2] drm/i915: Allow user to set cache at BO creation
Thread-Topic: [PATCH v8 2/2] drm/i915: Allow user to set cache at BO creation
Thread-Index: AQHZhSlX6M1hpZOjdEaFZBe7x1L3b69bQqQAgACKCyI=
Date: Mon, 15 May 2023 20:28:47 +0000
Message-ID: <BYAPR11MB2567D227FE2868D8C46925DE9A789@BYAPR11MB2567.namprd11.prod.outlook.com>
References: <20230512232825.1253644-1-fei.yang@intel.com>
 <20230512232825.1253644-3-fei.yang@intel.com>
 <ZGIhngPeHyKiTsGn@ashyti-mobl2.lan>
In-Reply-To: <ZGIhngPeHyKiTsGn@ashyti-mobl2.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB2567:EE_|SJ2PR11MB7473:EE_
x-ms-office365-filtering-correlation-id: a7d0a9c1-ad94-491c-4ef8-08db5582fce7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: k4cu99WkA/4HKSgUpsh9wPSNlD2JFqx5oI+GaoOkwpyaLf9IrEgErFsPH6/OsmKk6ZnSGLgldkNx66nI/mHCdK3re+33hpJiUo34/OjgRnrHUOiPzDxRH7JzSV/A0YVfQ9xt+BGFjEZrHdIRu43zBIslHRq0u7TP6ICTOvaYo8QwwXRk/Dnac8v5lq22bzkOCBOsoPcNT5UWVWE10u9OzHnKvgTMnQP4d9M8qo0svMw6W3g/I0lYa2BxAfYVsb63ej/4H+0KB7GcEGiT4F1GJqhmRYaxKe2gqnK8tj3UrBGtIr6ZH+bu6WofgGSxOfmcqQTzCSPV5G8lNOHJcw5d9sSafA0jbA+7m17svjeQT86CW1/NWQ598cAPazEjPpQyJZzuO7m3C/j9STtTcJmxxhlQ+stWARJDGVpilum3zPBMh+x/Fsi52iALh4s6kPgVd+ka4xXX/LUqRBQ9FN0hOjXfYdujSFEPtWNovQOEp5mrO605RdwzPmkakqk4ChHyJg2AivYFG7RK3jIG/DvfZXkE/lJ3InI1sn+kSIQxA2N5BdLmda5fEGYkBRO023mw
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2567.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(346002)(136003)(39860400002)(396003)(376002)(451199021)(66946007)(66476007)(66556008)(66446008)(76116006)(64756008)(41300700001)(19627405001)(6916009)(4326008)(82960400001)(71200400001)(33656002)(7696005)(26005)(6506007)(38100700002)(122000001)(316002)(38070700005)(5660300002)(52536014)(83380400001)(8676002)(8936002)(2906002)(478600001)(86362001)(54906003)(55016003)(186003)(9686003)(966005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?+3B2GgBthZBCaiVCzjiwKD7+T/i76+5uSospQduOh6XBTtHKzoP79fVYqM?=
 =?iso-8859-1?Q?b4z1N7y+e3u/kdyn7/u6ATniv71Tfi/yIr0kgllMCRTwqlPIcZtVGmqFx3?=
 =?iso-8859-1?Q?8bWTvIR9hEDl27uCh13YwuZgRh1pOLGScFeY1TDEsPr/B4tZzKlx0K7l5X?=
 =?iso-8859-1?Q?ffkfTZl1sRi0uawGaLfkTl3EHzAMPhV7wGyjxUpINNQ4E4gi2hkfyebVED?=
 =?iso-8859-1?Q?qUL4z2jSTf5t5X1ZR8Wx6+YnEuxEC8N+UZiCWHsi7/kqMMb16FwaLLZejh?=
 =?iso-8859-1?Q?fMYq/IYnp3knXoIsdn2t4DlyhkwGCdPXFTqfJI4PuCdabhMCPj9ybI9lQF?=
 =?iso-8859-1?Q?fyFAOO9cbDLOb1CLnox6+1PhmZQQGUPqXxmCn4lpb2nXjX5jbyMkYCBKrL?=
 =?iso-8859-1?Q?sCXHENtlTefR1AJMDPoYSCL4p4MDraUnWsdClgUp+Jxsq5sRtEP8Papla7?=
 =?iso-8859-1?Q?ZqWJcMYPSHd4JTNt0OmdJuUBJmJBG2m/2Sb/IerIsX2fkVZJlBOVHZTLXj?=
 =?iso-8859-1?Q?9/c2u8Vq733gaXSpaFYiRWDvwA2PAwIKC5RvuLUMm35Xl+PkM/jz8gu+2r?=
 =?iso-8859-1?Q?tSLChlCF5YtxbHHvdKx3q8m5s742sNCP1534UEC1dTb6AtHwgNDODr5iso?=
 =?iso-8859-1?Q?AGB7p0/pMP08SyxQn+LoVTwBraH/mZvYOThKh5i9NnKJHsPx781QIUVqpp?=
 =?iso-8859-1?Q?Mxx9O/XAsnOxZVcbHJCnopBQZTCYWihIaN44Tc564hTvigMY0F6HvprBxN?=
 =?iso-8859-1?Q?67tO25q1tk43rs38uGGRD7E8AT2HPOipz9Ye8BAxgCKCcw8ed6MPqkEaEA?=
 =?iso-8859-1?Q?XU+45rD8iPifnDE9+bR0Du/z/rIOVRU5uocKzRKcUGuf7+TNTBJkk9Q+El?=
 =?iso-8859-1?Q?x/8+zdwBIKMos4IJYsqsWCnN7NoFUPVXS6SXDpGogdLuK+iswsPknWgRPH?=
 =?iso-8859-1?Q?tOCRVTSgSf/cUvgkNE3Lhf1jHYbxamIrPy8HHlf2vUnhs7gh+eKSe+7jOC?=
 =?iso-8859-1?Q?WCec/jjc2/hCpHYaJMnPDfznroU2qr9CKq2L64+ew9pX03+fNJ6R2lsBWg?=
 =?iso-8859-1?Q?vBMxBsa/ikiLeyMQU4eXfIvSpM8aGbkLXO4h4alqsdeeU9rmy3ev//c2W5?=
 =?iso-8859-1?Q?fqP+Q0CRQ76wEGCSTE0IrhLpvwTjQERE69eiq/vJUw175Mgd+rrRdGiw2r?=
 =?iso-8859-1?Q?oZYG2MH99kUL4lj6HMZuBSaIn8yApQWExB1RwP9HYVY5hmnOnWWGx2ZXe+?=
 =?iso-8859-1?Q?+dB+SxN70p00Sy/t3HrHzx50pavhgaE+BcW2rn8JSJ20NkjRFPrj/QtGno?=
 =?iso-8859-1?Q?2IGRTqvyPaUPF9ic9yoJb7rykkRIJm8knus2sMP71RWDUDWJfmgAx59sKn?=
 =?iso-8859-1?Q?xUQ0WwZzOH1rgI0rhhF95eG7POJHqpl5QY/hcXaWD2sBYdpHayOE9uQsnw?=
 =?iso-8859-1?Q?GRWy4uU3WhB8Z7/VUDycYV3HKlQdbNLe1ez7WcCImsWtKyL+DwWHid+CGr?=
 =?iso-8859-1?Q?slCciuiKVXCN+3hskxjFh86ghQI0KjwXYDxpF8pCNGT/PvQ5vZxeEMPMIh?=
 =?iso-8859-1?Q?BFwZBAFUyiqWbkjWXKztQbvkl/Smlg6VV0Nh/559mU5CCk0cAH2Q66Z+wz?=
 =?iso-8859-1?Q?Kj3Ft+TIu+gG0=3D?=
Content-Type: multipart/alternative;
 boundary="_000_BYAPR11MB2567D227FE2868D8C46925DE9A789BYAPR11MB2567namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2567.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7d0a9c1-ad94-491c-4ef8-08db5582fce7
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2023 20:28:47.9794 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vuM4jqWhwZGazILzpBoKCC3LlwJ6yfMwRBQoZUsMuC+tcr5D7Me04090np5tq9H+x8b4UFzNnO8mWsYHEXhmpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7473
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Justen,
 Jordan L" <jordan.l.justen@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_BYAPR11MB2567D227FE2868D8C46925DE9A789BYAPR11MB2567namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> Hi Fei,
>
> On Fri, May 12, 2023 at 04:28:25PM -0700, fei.yang@intel.com wrote:
>> From: Fei Yang <fei.yang@intel.com>
>>
>> To comply with the design that buffer objects shall have immutable
>> cache setting through out their life cycle, {set, get}_caching ioctl's
>> are no longer supported from MTL onward. With that change caching
>> policy can only be set at object creation time. The current code
>> applies a default (platform dependent) cache setting for all objects.
>> However this is not optimal for performance tuning. The patch extends
>> the existing gem_create uAPI to let user set PAT index for the object
>> at creation time.
>> The new extension is platform independent, so UMD's can switch to using
>> this extension for older platforms as well, while {set, get}_caching are
>> still supported on these legacy paltforms for compatibility reason.
>>
>> IGT posted at https://patchwork.freedesktop.org/series/117695/
>
> Test gem_create@create-ext-set-pat
>
>> Tested with https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/22=
878
>>
>> Tested-by: Jordan Justen <jordan.l.justen@intel.com>
>
> we need here an explicit ack to have the paper work in place. So
> that I still have to ask Jordan and Mesa folks to give an ack if
> things look right.

Will update once an a-b is in place.

> Thanks!
> Andi
>
>> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>> Signed-off-by: Fei Yang <fei.yang@intel.com>
>> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
>
>PS:
>
> nitnitnitpick: the tags need to come in chronological order. So
> that:
>
>  - first you wrote it (Sob: Fei...)
>  - then you sent it (Cc: ...)
>  - then it has been reviewd (R-b)
>  - finally tested (T-b)
>
> I see that many people put the "Cc:" before the "Sob:" and I
> consider it a matter of taste (which might mean "I first prepare
> the mail (Cc:) and then I send it (Sob:)").
>
> But... don't mind too much at these things.
>
>Andi


--_000_BYAPR11MB2567D227FE2868D8C46925DE9A789BYAPR11MB2567namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0 Conten=
tPasted1">
&gt; Hi Fei,
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; On Fri, May 12, 2023 at 04:28:25PM -0700=
, fei.yang@intel.com wrote:</div>
<div class=3D"ContentPasted0">&gt;&gt; From: Fei Yang &lt;fei.yang@intel.co=
m&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; To comply with the design that buffe=
r objects shall have immutable</div>
<div class=3D"ContentPasted0">&gt;&gt; cache setting through out their life=
 cycle, {set, get}_caching ioctl's</div>
<div class=3D"ContentPasted0">&gt;&gt; are no longer supported from MTL onw=
ard. With that change caching</div>
<div class=3D"ContentPasted0">&gt;&gt; policy can only be set at object cre=
ation time. The current code</div>
<div class=3D"ContentPasted0">&gt;&gt; applies a default (platform dependen=
t) cache setting for all objects.</div>
<div class=3D"ContentPasted0">&gt;&gt; However this is not optimal for perf=
ormance tuning. The patch extends</div>
<div class=3D"ContentPasted0">&gt;&gt; the existing gem_create uAPI to let =
user set PAT index for the object</div>
<div class=3D"ContentPasted0">&gt;&gt; at creation time.</div>
<div class=3D"ContentPasted0">&gt;&gt; The new extension is platform indepe=
ndent, so UMD's can switch to using</div>
<div class=3D"ContentPasted0">&gt;&gt; this extension for older platforms a=
s well, while {set, get}_caching are</div>
<div class=3D"ContentPasted0">&gt;&gt; still supported on these legacy palt=
forms for compatibility reason.</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; IGT posted at https://patchwork.free=
desktop.org/series/117695/</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; Test gem_create@create-ext-set-pat</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; Tested with https://gitlab.freedeskt=
op.org/mesa/mesa/-/merge_requests/22878</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; Tested-by: Jordan Justen &lt;jordan.=
l.justen@intel.com&gt;</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; we need here an explicit ack to have the=
 paper work in place. So</div>
<div class=3D"ContentPasted0">&gt; that I still have to ask Jordan and Mesa=
 folks to give an ack if</div>
<div class=3D"ContentPasted0">&gt; things look right.</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">Will update once an a-b is in place.</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">&gt; Thanks!</div>
<div class=3D"ContentPasted0">&gt; Andi</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; Cc: Chris Wilson &lt;chris.p.wilson@=
linux.intel.com&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; Cc: Matt Roper &lt;matthew.d.roper@i=
ntel.com&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; Cc: Andi Shyti &lt;andi.shyti@linux.=
intel.com&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; Signed-off-by: Fei Yang &lt;fei.yang=
@intel.com&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; Reviewed-by: Andi Shyti &lt;andi.shy=
ti@linux.intel.com&gt;</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt;PS:</div>
&gt;
<div class=3D"ContentPasted1">&gt; nitnitnitpick: the tags need to come in =
chronological order. So</div>
<div class=3D"ContentPasted1">&gt; that:</div>
<div class=3D"ContentPasted1">&gt;</div>
<div class=3D"ContentPasted1">&gt; &nbsp;- first you wrote it (Sob: Fei...)=
</div>
<div class=3D"ContentPasted1">&gt; &nbsp;- then you sent it (Cc: ...)</div>
<div class=3D"ContentPasted1">&gt; &nbsp;- then it has been reviewd (R-b)</=
div>
<div class=3D"ContentPasted1">&gt; &nbsp;- finally tested (T-b)</div>
<div class=3D"ContentPasted1">&gt;</div>
<div class=3D"ContentPasted1">&gt; I see that many people put the &quot;Cc:=
&quot; before the &quot;Sob:&quot; and I</div>
<div class=3D"ContentPasted1">&gt; consider it a matter of taste (which mig=
ht mean &quot;I first prepare</div>
<div class=3D"ContentPasted1">&gt; the mail (Cc:) and then I send it (Sob:)=
&quot;).</div>
<div class=3D"ContentPasted1">&gt;</div>
<div class=3D"ContentPasted1">&gt; But... don't mind too much at these thin=
gs.</div>
<div class=3D"ContentPasted1">&gt;</div>
<div class=3D"ContentPasted1">&gt;Andi</div>
<br>
</div>
</body>
</html>

--_000_BYAPR11MB2567D227FE2868D8C46925DE9A789BYAPR11MB2567namp_--
