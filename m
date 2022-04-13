Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EE750025A
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 01:13:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F02A210F1A0;
	Wed, 13 Apr 2022 23:13:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D909D10F19F;
 Wed, 13 Apr 2022 23:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649891598; x=1681427598;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=WKtoaTdB/VilQ7GVz9x87oEP7s4Y0VtZRknJYiBH0aE=;
 b=MBkSkQz9Xfu6m528b/lx6/kjHnbYDC5fGqME9tOGjTzo3Q8j+YkIbYU7
 AO5gD3EV9L8uZPGfkjn3N2Iho1JxrZveZIYq6zVx4J6g4nQLyvB0mBsza
 xAUDBjTnemMNsZFXEudj5OSq9AGfK6dEJ420zJa6TI2RedwkJCHGszMHu
 p4Lu8erzMkETTJvXP7QU5Pe11zhJkrP9UkN4W12WZLz0bTbzjEHDuDeoK
 VLiGmrcZ+fMjyMJvyr8J/K20+NSYibM1pL5XmR5fPE3xaK0Sb40nQTnLr
 Zwtr9bBNxCmEmeTzufTceZ1gflMmwuG/eC0MKp1A0qtm6iI2E5HNj/HkP Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10316"; a="262240769"
X-IronPort-AV: E=Sophos;i="5.90,258,1643702400"; d="scan'208";a="262240769"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2022 16:13:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,258,1643702400"; d="scan'208";a="552404276"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 13 Apr 2022 16:13:14 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 13 Apr 2022 16:13:12 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 13 Apr 2022 16:13:12 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 13 Apr 2022 16:13:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c+p9b+z34Jbkp35+F9uLYZohgMOOTnIGN+0GmcpA/wKooofBTXajtirN2K0Ek9NPley3li5yQwTre+wZ5Ig2Se3wT+Od5noAwKv/E2vmmuwr/HWX/7wnCHKwk8s8psurbyNgV0FaXsebFipBnxZC7mXLaVvcgzKE93DxHfSPYiTId6M16ClusEl03eWxNemG9TWlKykhi9/q3A+K5OOPyLLeTuQlpfIeHDeRumaJfNCmlOT7tW1K9rc9U47jeA00NnHwMD56Rkg2SWplsxcvipmBb3j/5UK5RN9vg1kovNxZoz2MR2uMHa6zFgQr82whAPbfejVsrHGn9NcopPwb7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JHgSEdJW9y0IcKSpxXo7NRIeoWPV8KKsssVuAzSsTTU=;
 b=T15Knq6NzqRwaI86k2BgokWA+fvnzviBlEftBnYtH/INtdt0Zd/zj6p/PYV+JK5q01MmPx7cVLKC1t2AHNsBNIdjaSz56hRROPcUajDg6uXLVw+DOAA6c2+UPwMJdjAohdpYeJfRcSKTVdJQyVgzTxhrvnOn45jp7sYhy7z3sYws9vxaQOC+4cCF1d6bpT9v/5CSXgkHSuEuYUV1P0Jse48a/hi1AlU/WUZeF/81HlxJpwkMSrkGf22CrsO7tkV5/W7atEBz77rvr6fNMU6JsKtzJGOeaFVhu4D/z6k8jSZBql7vKbbgEj1Ta53uXhmxNVwczZCBjE7yD4wRYXy0tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5538.namprd11.prod.outlook.com (2603:10b6:610:d5::23)
 by DM6PR11MB2602.namprd11.prod.outlook.com (2603:10b6:5:c0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Wed, 13 Apr
 2022 23:13:11 +0000
Received: from CH0PR11MB5538.namprd11.prod.outlook.com
 ([fe80::5dce:f83f:1192:73ba]) by CH0PR11MB5538.namprd11.prod.outlook.com
 ([fe80::5dce:f83f:1192:73ba%7]) with mapi id 15.20.5164.018; Wed, 13 Apr 2022
 23:13:06 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Christoph Hellwig <hch@lst.de>
Subject: Re: refactor the i915 GVT support and move to the modern mdev API v3
Thread-Topic: refactor the i915 GVT support and move to the modern mdev API v3
Thread-Index: AQHYTa50HopuXX46aU+QxtIWwnq/0azt3o0AgAAhbQCAAANggIAAeVIA
Date: Wed, 13 Apr 2022 23:13:06 +0000
Message-ID: <5af7726e-920e-603a-bad3-8adb09d2ba89@intel.com>
References: <20220411141403.86980-1-hch@lst.de>
 <82c13d8e-1cb4-2873-86e9-16fd38e15b27@intel.com>
 <20220413154642.GA28095@lst.de> <871qy1geko.fsf@intel.com>
In-Reply-To: <871qy1geko.fsf@intel.com>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d2776576-7881-4653-710a-08da1da32b49
x-ms-traffictypediagnostic: DM6PR11MB2602:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <DM6PR11MB260258533D3FE0DFD154F842CAEC9@DM6PR11MB2602.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0J/rcaAw2rbosG4lYUigArGvVTrAaJsuJktn32nCvvaplOdvGIxlvoJcdVlvDN2DSwphEMxQ0wyRsHmbsUSdO0b0py7yaBTjhii2vudMzdh/kzQSbeeBYkWUFDuZZZj0hkp9ARwxYOaeONwzWyyb/l1hDf3xg/go8d0hA2K2UjndckQW0dS4T6s3mUWmAV4rZyyggsXVwNZs5yYQHHQMYWWVnQvn5arLcwc++XzEaI7dEPmjUjg6BEX+vLS4wvGiuMRNA2cvNcn3q0csSqlhTajcL6qqG9hioGRm6Ko+jWImlMyfcQBXlSVI09+v/dDWi/XeEPYCHA/XJydkFvwfsllO/yk0Qfj3TD8jRW3OnPk5waD15W3JaWBPoGrYq5w4RzBmALzPHlasXN1N4yPFNn53xp/VTjWVcanvYt8Bwgc9aAWqwmBRK7PaM47h47sX6YALTxLe5edhfQm5FtrtPnHaru4wji7Ih87HkdsveJyZ+/EFPwvmJvzt9HZxrDOyATy52G1PloSME6cRS0ZHxsuf+U1Bn3y3QWl9ctDut997YNePcnLFqmH9UWhBrb6w31ubVnCiotx+xzlwwrZU9XDVyeJZy6jaZ0Dz/qEf/HpUhvb+mNx9wS4S8voMGyGb9fP/mmLQqjrF07Ux2zjup4WH9kT6fR2DQxK5DJ8CwgaBMKNL9dbRpSw+58hx7hxFQSgtPH6GGMTDVTBweifh9uqtblQWh/Mcp3ydje8cWW5qFZpCurIzAGvKcPRSGPEniZowAFasrT5R/l8aEvVG9DYpB3ZIF3uutoHizr60RmnhpkO/XUogPRGPrN8Mqt8Imc3D+sVC1ECKRpOg0U+V5l35IjkwJQSH97b+NX6bvxk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5538.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(110136005)(64756008)(8676002)(66946007)(66556008)(66476007)(66446008)(6512007)(7416002)(5660300002)(6506007)(31696002)(71200400001)(83380400001)(91956017)(316002)(2906002)(8936002)(82960400001)(38100700002)(122000001)(76116006)(2616005)(38070700005)(36756003)(31686004)(4326008)(54906003)(53546011)(26005)(86362001)(186003)(6486002)(966005)(508600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?y7YNuNols25zL1JX54F/y/Q6qhIiVXt5npLdvDgqZlPxJzpXLhGtVFqH?=
 =?Windows-1252?Q?Xof7TnDkbSvAd1RoFvY5e84Ea8P7B+AFE/I4Mi5FyJ3Ml7FywjZ1+Pcx?=
 =?Windows-1252?Q?p8YonwoBBnrcpGbS8pHbKXhhBddT54/tOx5iWpaECErjRGrHxZjwkLB/?=
 =?Windows-1252?Q?GnKuOncSm7r0VDlmaG1yFZtlKGyqt2GVSaDOOTe8LNCmxsEfVjEwZiZK?=
 =?Windows-1252?Q?3ohG+p0ggfVlSLS1Ni2DSMHLwctl5iSUsjNwrKQsh3wFy0RJqwHZwY0r?=
 =?Windows-1252?Q?bAhOyaSHcxpVlq+h5UKAtkAZhLyJv0VCKLtUPPXwBkmMw4AHXk2Ws3YT?=
 =?Windows-1252?Q?gZzNlLQa9w6e0oSMKc8MhUc3+SNs9T8+ryN0DznspKtz8f8ZsJJ0s8A2?=
 =?Windows-1252?Q?mw2+PjttlYtNKDz1dsMx78cDhIsZ5yy+dbk0UctEZQZgtWg/dfQD8s1r?=
 =?Windows-1252?Q?vKuSJwvSAFYYACJDwT8dyOWcR6z1jL60HadG1IBU5Bj/NPqzH2EVw/W9?=
 =?Windows-1252?Q?2JoUj8fo3AsIGFg/tyB1vIGgKVobI27mBf1NhlwSDqQqqghEfh57ZWVM?=
 =?Windows-1252?Q?IJCeCECTyhJ7oo1DH6fvp8PjThemwdWRTIvrq3Mi3nYMBu7J4I9IGY71?=
 =?Windows-1252?Q?5FSKm2Sj4OgnhtBCAu2vPx1JCvualyqgpxCyTzGavqnzu/YLyJLoocFK?=
 =?Windows-1252?Q?73wCvsM9KKs/3eoPj2PsnIrZhwm/UfXToRmAHywnRMZa4MDmkBiZyPOi?=
 =?Windows-1252?Q?SX3Jwjd0iaIoiDANfeF+3jkCy5aPYmvIB/dOzUI58WTEJNCRtaOPjOIu?=
 =?Windows-1252?Q?TpVdddEINqQEeayDDNdFZcORgbrYz1/iS3EuOOlBdlH78Do5ZZ+mL6D3?=
 =?Windows-1252?Q?ZuHNcSMAaZXtPPUtR5YL6QHARjkBaSjkEevDTpHTvBEthVSfZ/QB0OcB?=
 =?Windows-1252?Q?RhlBcTBkEyFapA7dpdLZstfksT9cbCVZIQVDCNGL7KnrXJESysY0MWTf?=
 =?Windows-1252?Q?T42zg3RGj3Lm2QItDyYvFavrStEpWnLvSwsA0ckwB377SbMI6hz0C1Q/?=
 =?Windows-1252?Q?hwORAnn36Q9B6agqLa+kY7O2c1RKKeWqXF5NCtPawvkbcAa/ta90d/Ux?=
 =?Windows-1252?Q?XOXioybwbgoCjp4wW/bAD4UGxy9aSUdkxMguwrC7PdIJl6TzDdME3NM9?=
 =?Windows-1252?Q?6vPAFRB4f1s5h4MeLLd2YPmQV60ovnOR3DGlVH5P8iqBYBEiLf+zgEjU?=
 =?Windows-1252?Q?VxNxGjuzLc2KuacCKNZ+9ME4FYRSrxh6I1IxAtHyKVfYlyQmcziSY63T?=
 =?Windows-1252?Q?adKdtJAV4WtHPGuEsUvp9ywozWUfp1RSapjRRUomMEOaDgjy9OcSctnl?=
 =?Windows-1252?Q?fDizZ/UGNyegFY2uFflNUgtZsMIegsInQC7cRtiJ9FdiAPNQRfKNH+rz?=
 =?Windows-1252?Q?mAqMmy0wqbDj67XVl06nCisvOW9r+P0iyjpuEUbYTsy2cUTXmI5yLoAw?=
 =?Windows-1252?Q?Hf/U+uu9obuve/vpbYEWzL3feH1IYjjSHCg+w/bJhsYUJDkLi+yOAR44?=
 =?Windows-1252?Q?dVCfwG9xTz+d4MLO2dZpgnRHLMwp2XFatKl7814RupEL3GL14Vqwb3Gd?=
 =?Windows-1252?Q?+HUea2u2fU/NsPOwiO7R0mLWHdrIbR8xihOZdyyE37fuMLj5vYC//Bpk?=
 =?Windows-1252?Q?I1zoNzYpKl/Uwet0UN2/k5BhVsm2uaMGy2fXCoGC4gAudMOqxOOieuul?=
 =?Windows-1252?Q?4wRC+q7O8+7K9x4R4ZZF50Kb0Twrn7dhZm0SwWUfH0UEPkr9CVjMQ+gb?=
 =?Windows-1252?Q?0R17k9NBrV7KmpHqruFYbA87PIDi1QUYE6tIYKeWgXeSJIgjfTlSlgop?=
 =?Windows-1252?Q?8eQCRe9WlEjmRg=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <C976F833AFE46547B003FF1CE7108250@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2776576-7881-4653-710a-08da1da32b49
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2022 23:13:06.8985 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oS6ktr8CSHXuxVFCyUarafC3DMMEg/ykXPo14R32gi2RMiWh6op0cGFeMsNHINi76/ItXB1P8J1dbpePpzTj/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2602
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alex Williamson <alex.williamson@redhat.com>, Jason
 Gunthorpe <jgg@nvidia.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi folks:

Thanks so much for the efforts. I prepared a branch which contains all our =
patches.The aim of the branch is for the VFIO maintainers to pull the whole=
 bunch easily after the drm-intel-next got merged through drm (as one of th=
e MMIO patches depends on a patch in drm-intel-next).

I dropped patch 4 and patch 5 as they have been covered by Jani's patches. =
Some conflicts was solved.
QA is going to test it today.=20

You can find it here:

git clone https://github.com/intel/gvt-linux -b for-christoph

Thanks,
Zhi.

On 4/13/22 3:58 PM, Jani Nikula wrote:
> On Wed, 13 Apr 2022, Christoph Hellwig <hch@lst.de> wrote:
>> On Wed, Apr 13, 2022 at 01:47:05PM +0000, Wang, Zhi A wrote:
>>>> the GVT code in the i915 is a bit of a mess right now due to strange
>>>> abstractions and lots of indirect calls.  This series refactors variou=
s
>>>> bits to clean that up.  The main user visible change is that almost al=
l
>>>> of the GVT code moves out of the main i915 driver and into the kvmgt
>>>> module.
>>>
>>> Hi Christoph:
>>>
>>> Do you want me to merge the GVT-g patches in this series? Or you want t=
hem to get merged from your side?
>>
>> The two option here are drm tree via gvt and i915 trees or the vfio
>> tree, neither of which really is my tree.
>>
>> We already have a fair bit of vfio changes at the tail end of the series=
,
>> and Jason has some more that should sit on top of it, and I have some
>> more that I haven't sent yet.
>>
>> So if we could get the MMIO table and Makefile cleanups into a topic
>> branch that we could pull into the vfio tree and merge it through that
>> that would seem easiest to me, assuming that is ok with the i915, drm
>> and vfio maintainers.
>=20
> AFAICS the changes are mostly to gvt/, and at least I'm fine with the
> minor changes to i915 (in this series and in my two patches) being
> merged via whichever tree you all see fit.
>=20
> Acked-by: Jani Nikula <jani.nikula@intel.com>
>=20
> Joonas, Tvrtko, Rodrigo, chime in now if you have any issues with that.
>=20
>=20
> BR,
> Jani.
>=20
>=20

