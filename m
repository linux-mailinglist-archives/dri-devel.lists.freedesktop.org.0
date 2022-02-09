Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF504AFDCE
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 20:57:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C32D010E4F3;
	Wed,  9 Feb 2022 19:57:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0885010E4BB;
 Wed,  9 Feb 2022 19:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644436648; x=1675972648;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=2Bv3m3DxccjcuZ+FTC+tFfSdfPDNwyRVPL/GqBEffkQ=;
 b=kUtYfhQRmbRH8C4t3oMCr8Fr/5IN4DR4L+j17cyq8myo0Et6E+4pTfjY
 DQ296h3/QV7qavfJ9mrQPU+0m3RgGhuUlH9jszHIb+h2rfz75Rm9J6+bk
 kHEl6ev+XdAvGjgo8KIKXaYIzhMfF8dz7kDc9wvZ8p7KtfPIqhbJy24RJ
 wBQ4ae8cdUV4ZGr0zDKb9U1gPcYrqJsnlAJYQzzt+BFubjJ391UryQq5B
 1lZwc49vpBGK6SIXzaYUjYkAXeXGU9JWN5vjgEqIZnVdeed7+adWr407E
 5vez1ccGhH7+MPaYu0PPHjEQfGgx2hHNhbo2zSkBsW+xucXIVmulInAJq A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10253"; a="229290725"
X-IronPort-AV: E=Sophos;i="5.88,356,1635231600"; d="scan'208";a="229290725"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 11:57:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,356,1635231600"; d="scan'208";a="541270037"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga008.jf.intel.com with ESMTP; 09 Feb 2022 11:57:26 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 9 Feb 2022 11:57:26 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Wed, 9 Feb 2022 11:57:26 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Wed, 9 Feb 2022 11:57:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fpWAO4xhvpec6doYwv2Gi7lTW+necXmLrCFVkX05pEi6KMABaRPecJsPNFOzvQXMP0heqLyifmhi4f6WGYZXCZq+ox/v5RJIT96VZLmCWavoHluMk3/MFJhKOnbSSqhWfoat+HFv6zML+f2C7eAk5XAuqvv0gjEBScrmJDl+NWMC/xOFvRXzCIfC7YzoA/zW4d+Szt7XhtU5kX8jMXvB9TeC9OtpHhw2ooT6cnmgF+crFwiE93I+qY4EHW5scUc0Lmxxd77cU4ZFM8V3xVi1yRGuDGiM24Wx2GBX6oDnZCmabYRmZ1u++qXHaFYVhalE40S7sBIA3FPU1x4rVPxjKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/7S5OxkGXO13+0P3BgUichsNg5aXh1RfcvtosE2WU0k=;
 b=P47GSleCRshlshRzWD4pNEViQt+vWWL12Uhfxb6xfoShD1ZNF8cUVWVZNIy/y623sdCtqvkLZXlTpEB+XDPm3WUI+bnWd2E2MikWQf9LZP9tJriObIAVPm07RcZBOGGabcupaAd08MUTLqJeZDIcA0uaS81Ue+qAlgRtp10kW3YX3NWLC87t7N6Lt2fnk38b4j7L9+FHlmkBOSOhcGj5xFlCYo/IezRd2pWBml2W4xZsaNxLTcDIrkI8B4FimWfy3sPHhF5XFkTDYhITC/bcnjnXa+SiXQR92kcYsbP+O4Wi0oOYwFfLtu/xwMOyz9xTALFxibE3OK7TG7I8hqrMmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 CH0PR11MB5691.namprd11.prod.outlook.com (2603:10b6:610:110::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4951.11; Wed, 9 Feb 2022 19:57:23 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::897e:762a:f772:1c34]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::897e:762a:f772:1c34%5]) with mapi id 15.20.4951.019; Wed, 9 Feb 2022
 19:57:23 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Christoph Hellwig <hch@lst.de>, Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH v6 1/3] i915/gvt: Introduce the mmio table to support VFIO
 new mdev API
Thread-Topic: [PATCH v6 1/3] i915/gvt: Introduce the mmio table to support
 VFIO new mdev API
Thread-Index: AQHYHNy+WB6hSk3In0CMw3y1iZvDnKyJw40AgAEP4YCAANFZAA==
Date: Wed, 9 Feb 2022 19:57:23 +0000
Message-ID: <4e2faf7b-383e-58b3-8ae9-8f8d25c64420@intel.com>
References: <20220208111151.13115-1-zhi.a.wang@intel.com>
 <871r0dqtjf.fsf@intel.com> <20220209072805.GA9050@lst.de>
In-Reply-To: <20220209072805.GA9050@lst.de>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bddf839d-7052-43d7-b745-08d9ec066384
x-ms-traffictypediagnostic: CH0PR11MB5691:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <CH0PR11MB56912129F09F0A50F7780E15CA2E9@CH0PR11MB5691.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fBoxDNkZttRe5p68R7t0cNmoSTGhiE36AYOulOtB95X+iGXbruTWHpmP9HTFmD/ybPU/dAysx8WaD6lIq7fPE0EIepHMW/8/JFLaQyeYGO1149XM5OwP5Qw1fu8FBhSgbJyyGoIP8J+JY8bkSAevyJYbmYXHvjBTANqBKnVIrprWPslh+X/EdZ3x7uafWMWc65pGxAJW/uS53hcaNcsemdoCV8MbwW8yQhqSr3hM63LD556Y1v7Aa0ZIybRxxHP+rUGq+qan+28ctL+V0cszAuk78yWEgpQbw/S8iDqQzgM5i8WvOnviR9a0tb7tozyUaPGNKJFcceOvwEQOSxek4rDP9yraUdZe7eAknF9XfkxgfrWVscaD1r7WxHNcU6PZlapGVUivdmh4ydbJjmlCVBP/D+53VcmcBqz6uw8RnQxxQ2qinSLSIXIDFsEydOjsSOumrMRbRAaO2+MhFWwSaxydmATA40spW6Zd17ZfbmciHYLmoHvEcbsDrCqTUTmzDZYOni5dosyzb7yXGOXW/ssXByv5DSCl2AcZGgNewn9OVjpPvQh4msgiYhcWEaZPo7kQqyR/oKOzDxYXhQf/8O/aBeHt99geSAb4ZiAjl30fJPVGkIu0GQR7GWI55XRTiUBX0SlKTpJgmAU9ruAv75FvL/PHQKAt8Dcm9MUFn3g/X99EAN7LItGETVaUtWOFT4XbxTYJYspqe69LUdyeLXSh/ziRo2GH/+Csc5PskgIq5pQePzrODxugiaejIjSO3R6Bx+AkUEGzVf2mfDSkyg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(64756008)(76116006)(2616005)(6486002)(66556008)(110136005)(508600001)(66946007)(38070700005)(66476007)(54906003)(86362001)(91956017)(31686004)(8936002)(8676002)(4326008)(316002)(53546011)(66446008)(71200400001)(6512007)(31696002)(38100700002)(7416002)(5660300002)(36756003)(2906002)(82960400001)(186003)(122000001)(6506007)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?MLAPRjzTkfEpOC9TyMZrOjNI0hxYv1pINttcRuicnthyZIFjJ3sya8Ai?=
 =?Windows-1252?Q?NZnUiH5AIRM3uGicZAGJTZWi+Tptq0nujQ/9tI41ZREwyop9CdgJ7py4?=
 =?Windows-1252?Q?qnCzV+DHdpD17iyEUwNwzVusJIMWhffvu9We3mUlEGk4nEIO+A1FciIT?=
 =?Windows-1252?Q?kBY1Aef+OTYCOp5Sp2a9FQj1cBrTCVmfbnLSDImC0E7B9GuCG8y0cGPM?=
 =?Windows-1252?Q?KzetSBOOuJADA5eIdOgr6uroBwKQde5lbVLwfm2RtivxIYDj1fobL2H5?=
 =?Windows-1252?Q?lIv0fyG+XKyJOheacw2ffPaAnKpy+RnFchxp6kbvhZSXyKHlPt0KETT7?=
 =?Windows-1252?Q?oU+UFRPJg9ycDos28s6ib51rgw0dXxeGAHgF/z61BUEVIRqBgivV6078?=
 =?Windows-1252?Q?VaDHpqXva7M21rHJfwQYQHFMW7ntSrEZL0+nxZ/omXvAbDQ/zZrNA+3U?=
 =?Windows-1252?Q?zRr2nyh4BmBKIu4kj3KJ2d//4S0sNZFv5D/uUvDTubOKU0OdJ7THZfZt?=
 =?Windows-1252?Q?asDqATOaAtNQBzNC6tVsteETR7920fHZvGiCt5f2htz5Ecwry8YRIR25?=
 =?Windows-1252?Q?dWD+REJqIFofqMFNBN8FrTWC/3ERuwnCXxDfxzyc6r7JYgtWYvDcKDH8?=
 =?Windows-1252?Q?m4ToDZiXPlPlOWhJNYJXacMZ4ejO/aH2AG552ckDyBoBKyPMr5RwSCEg?=
 =?Windows-1252?Q?DnEFAZU654IPx2jxHFrYrdJqlrzIpWN3k/5ZxCSge12KhWHURgk/ze6L?=
 =?Windows-1252?Q?aLnLfpRy7D6JE+JcJxxY/zHd1Pp8RXalQ7vV0yVPFJeYJVSuuoNia5dt?=
 =?Windows-1252?Q?b4y/9ltNkQtvVipWoaz87/UXjqpT45JSBbDqML9E6KTpHjTzsXtKObI+?=
 =?Windows-1252?Q?B5Pef6fI1UCuyEZhriHkA9un5v7VhNT7g+jNb63D4M8njlm1/mGx1e/X?=
 =?Windows-1252?Q?otnnagMZDEpeud3P0ASiYrw2C1Kq26LGvUpaxk92xMiSvC1tRFkL1HaQ?=
 =?Windows-1252?Q?0i1YJE19Vk447IhUGLz79OxlHRPff+90lCvwW6zOV2c3H/U12C5Mq7YG?=
 =?Windows-1252?Q?ENf5KuDT15TcS+wcJTI1SQpGQ6Eu9MwfS3jlvSm1/oSI4rgAcaAQvb5C?=
 =?Windows-1252?Q?GscJmA53viRlWZZL3OYmfOYGSkJnrK4yvXcvoYzLekzLe4QpKBpcH8mV?=
 =?Windows-1252?Q?ZgqF2AdRy250roeN9EgTNaGq/OKTQ4VNOFg2qN/VOhFN63uZ6Y/Hz3S+?=
 =?Windows-1252?Q?qnkYEHWz3sJHEFRRt+TtKwk9I4NNbiFz491KWj3OyMkQLnPBgw4PlUA0?=
 =?Windows-1252?Q?jygfppf/b81MLYM1zNvGSJ9Bt91Hu8EaDX8bCYdrQpVkKkRxTryQ8mr3?=
 =?Windows-1252?Q?X7Tfy1UHqcFZuIJWkHUUg3sIJNxb4Pp37Cn1eqBxjyOwa7O40NUa39+f?=
 =?Windows-1252?Q?K7MPuJk0zSBGgvcaR3tZW6b7i9nOm9H13mgZgD55f3FH81afPwoDsb6H?=
 =?Windows-1252?Q?eA+NaxWKc2ph2W4YcfiRiNYdOmcWrdvAsmSfrSJiRJkVNeot5c1wM1Qp?=
 =?Windows-1252?Q?PkYjKzSEBSsdhyGbbRrh0Yq0Rp+GKlf4u9PF2ERH95xfo8dWfgyd9fR0?=
 =?Windows-1252?Q?y6hAPgA/clEEC7/n+tUjs1K0YmQUxAQ21fd7AYoPqvOMdCmELO8g7k3N?=
 =?Windows-1252?Q?HFsbm9CZYUWEH4GcWhzwWmXiGL/m2oNrgpmQP1YryP7LpNS4rns+6xox?=
 =?Windows-1252?Q?efrVAJTPR0mpC93n3P8=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <75D52C3B1C0F9C49BD26FEA202295FEF@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bddf839d-7052-43d7-b745-08d9ec066384
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2022 19:57:23.2455 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wmjRDnsfr17iM899sbIFY7lFQ3y8JoiUchgwx6t+PRsJqFn31hjYBfHGNw5jxc9RLe10hvSKtdqQ6451SZ6EdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5691
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
Cc: Zhi Wang <zhi.wang.linux@gmail.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "jgg@nvidia.com" <jgg@nvidia.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/9/22 7:28 AM, Christoph Hellwig wrote:
> On Tue, Feb 08, 2022 at 05:15:00PM +0200, Jani Nikula wrote:
>>>  #ifdef CONFIG_DRM_I915_GVT
>>> +
>>> +#define D_BDW   (1 << 0)
>>> +#define D_SKL	(1 << 1)
>>> +#define D_KBL	(1 << 2)
>>> +#define D_BXT	(1 << 3)
>>> +#define D_CFL	(1 << 4)
>>> +
>>> +#define D_GEN9PLUS	(D_SKL | D_KBL | D_BXT | D_CFL)
>>> +#define D_GEN8PLUS	(D_BDW | D_SKL | D_KBL | D_BXT | D_CFL)
>>> +
>>> +#define D_SKL_PLUS	(D_SKL | D_KBL | D_BXT | D_CFL)
>>> +#define D_BDW_PLUS	(D_BDW | D_SKL | D_KBL | D_BXT | D_CFL)
>>> +
>>> +#define D_PRE_SKL	(D_BDW)
>>> +#define D_ALL		(D_BDW | D_SKL | D_KBL | D_BXT | D_CFL)
>>
>> If these really need to be in a header in i915/, I think they need to be
>> longer with some namespacing or something. I do wish these could be
>> hidden though.
>=20
> I think we could actually kill them off entirely.  They are used as
> arguments to the macros that setup the mmio table.
>=20
> Thefunctions to build these tabls are already organized by families,
> so we'd need relatively few conditions to just build them the right
> way.  There also are some runtime checks in the callbacks, but they
> seem entirely superflous as far as I can tell.
>=20
> Only the cmd parser is a bit messy.  So maybe we could keep these
> constants just for the cmd parser inside of gvt for now (and clean
> that up later) and remove them entirely from the mmio table.
>=20
I agree that's the correct way for not exporting this to i915 by just organ=
izing them in the functions, like what you said.
But I guess it's also matter of time and schedule as well. If we go that di=
rection, it might take longer time for coding as
this is a big re-factor. Also, we need our QA to do another full test run. =
That needs to be considered. (If we are ok with that)

Besides, we have to have a methodology to make sure everything is the same =
as before.
Currently I am comparing the numbers of tracked mmio and the mmio snapshot.=
 It would be nice to have more insight. :)

Thanks,
Zhi.
