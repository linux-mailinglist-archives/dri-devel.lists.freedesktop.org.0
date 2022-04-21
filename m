Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC13509622
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 06:57:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECB2C10E561;
	Thu, 21 Apr 2022 04:57:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1BC810E561;
 Thu, 21 Apr 2022 04:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650517058; x=1682053058;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=asLpy1909Csh/bJThAP1Xg16xCPVd0gRlVuRY/66Z3A=;
 b=XzJnnEvb8EKyJYovhJ5hEfrzDtVJWfYBQn1M/yVCj3UE1DA4fBog3Mvm
 b9Ihq3U5Tqc/zdV9eeGG/Cv2oRypheoMYGiXvEukWUToSS3Iap5BsDQhM
 hUzfi4o3NVxem0FUWMazJd0FwSOzvRbKSbxXMt60n/Rgp0r8nfQXWX4Hz
 5CwAsqgdZohMnRGIpUo87eBk4NkmUGDSlmw3ppgSWVX3oP2TNEiOQEPyU
 G/qc3dJ2od+bd5zHUIGQDZb38azLQPzAr2awRfXUz2BmzbZc2AU4aSe/q
 ky0LFT0jB1Q75KXQ7Z/F/htLgkooZWJ1fY8syFCd+SmG0tC+eO4cx5V8+ Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="251551242"
X-IronPort-AV: E=Sophos;i="5.90,277,1643702400"; d="scan'208";a="251551242"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2022 21:57:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,277,1643702400"; d="scan'208";a="702936111"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by fmsmga001.fm.intel.com with ESMTP; 20 Apr 2022 21:57:36 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 20 Apr 2022 21:57:36 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 20 Apr 2022 21:57:35 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 20 Apr 2022 21:57:35 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 20 Apr 2022 21:57:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f+UgDAjwyIcVMN6Nn/GoKLbvSpJBv+nSSoHtwfMIeRAoBBxIwPS7K/89GYT5tB1KWIzc6tGrOSaluhiUoLSRkVH0olcyJHJRwdkq1RthWOs+a5fsM7guFTNCAxM7TVe7PjYJBYMb5xREIEVjvjH6GHDViw4OjL6D050shAcDRlCb2lYrtIztC27m+ZzMSK7RHCXmM6JYXB5bafFLVcT1xcekYpyfCQgXOXSeOLWRSLV5ja8+zVdeeXQjasRgYf0O2RnR1yJqRDE0LW3aF6zfGYooWZ9xqIJLbDN7D2G2sZs9L2WUu/e/jQibK7kxFLZYMgXWur8PDAKM+9bYmKQ9wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yx1Hi7PH0ofDlpmr8FB0pEaf4EeE/n5awG76gL7v1Xw=;
 b=NZWgOOSjE6N9tlPJIrdMQwcL/NoMg+Cu7mVNTEU2XXcuwKlHw+oacVp4oZORwVWSqzIMHDGBYyWV9srHe34kGE0j6tL8wKiaPNd2igxd4t+wb9BlWeVrqFMyHb6dSmxXx2MVcsf24yXEfKVlV+EtF3tnX+NymG0uGBlyiffnVHOblM4QfWwpsWwbY0Rw4uDxU7ytNR9CZbyhEFQS93mlKC8M426mq0b1YeWkEadJPDKboURmZ+MmZaTIRHboj2zwfWJtns3vzVigkitEsaXauE9iDsP6z2tV596yhiI1uqheLWMUgMyfBgfIjIfGme64z0inK68QS9JofwPzpnjEGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 BYAPR11MB3398.namprd11.prod.outlook.com (2603:10b6:a03:19::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.14; Thu, 21 Apr 2022 04:57:34 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::e5b8:93eb:e06b:f1ab]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::e5b8:93eb:e06b:f1ab%7]) with mapi id 15.20.5186.014; Thu, 21 Apr 2022
 04:57:34 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Alex Williamson
 <alex.williamson@redhat.com>
Subject: Re: [PULL v2] gvt-next
Thread-Topic: [PULL v2] gvt-next
Thread-Index: AQHYVNSMOPXpKvGgN0OvGCZ3HfiQDqz5AfeAgAAP2ICAAAGGAIAAJZkAgACWCIA=
Date: Thu, 21 Apr 2022 04:57:34 +0000
Message-ID: <55cb46db-754e-e339-178c-0a2cfaf65810@intel.com>
References: <5a8b9f48-2c32-8177-1c18-e3bd7bfde558@intel.com>
 <20220420164351.GC2120790@nvidia.com>
 <20220420114033.7f8b57c7.alex.williamson@redhat.com>
 <20220420174600.GD2120790@nvidia.com> <20220420200034.GE2120790@nvidia.com>
In-Reply-To: <20220420200034.GE2120790@nvidia.com>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 68bb0dca-a6a9-42e9-c868-08da235372d2
x-ms-traffictypediagnostic: BYAPR11MB3398:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BYAPR11MB33980F0E5E6FDBF84A7D6755CAF49@BYAPR11MB3398.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /YB11DIzFlFU0EK/1xooPYU/Z64r0HyN5g66jXZHIfOBTl2GwNBnb/n83MMnSadu0S08KrSPThi/M5GX1AeaWO81TgNV/0wnbHbQyGFoFApIWfLIcZhuEeKLr5x3V6WwIAFaS5aQ9I/CLm4TOHnS2Bex6BfgBpVhkijbdnhxyVojL9LxINCcEIFfl1JteSEN0haHpF8xD0D76xpKLU0oDxdqevnNtdcMiCqWzab6UIDa3jh3TXLXl3+aZilaHI7wZMyn509TJhrE8yFXhj1Qkw/RGgOMF2tyAM4jUTfX349AJXG8UWs0EhiJVDJOI9l/PxYwag3TnKbed5wdnxPsi03NkDBp/XrAQ3Iuw5MRIwP4XsRde5srsuOXPNGaKNsN/Y533JaB332UvkbdXuJHFISGqvlDXwEDOgKOvXTr/JS8socCZGtYpoU9QgyyBAM2hkqAHK/STzLJr9Ea5c1N2DKtpc4cktzbPIx2DDXqa9KVt+AG8w12Pgn1xiLT7g+btpQiH8O+5XC/FjTMB+dFYUuOZD9/hUGzY6T6+1U/GLviD87ZPTUP1Zgr1muJOt+Up7UOZ5yUjY4ZS6mqTkhWMkiApMgu5fwlt8upq1cGLGucmyHcqqwUZwF8TW0W6rQwGZKA9MCr2S/LH+cvscvn6xTcdVIil5ytbdq6tR1+/+Hknre6PI1ZFCknWqilnfAdM1ae5/Dakx4XNEXCpcU5b6y/8iWkq7vymhtoDfvOeXSQKBL0Vp2qsW1PyFCAr5sqE6UyLTYcJ64ojvzeuLFomAFzgLUTPu9AFIyqcR+nqpluJyM2pRwLTkQEVkjlGQx4DPXZ5rIZWPKCkks/l5HHM9JPCq8kgGjCYvZw8Z6frVs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(86362001)(26005)(91956017)(8676002)(64756008)(54906003)(110136005)(4326008)(76116006)(66446008)(31686004)(5660300002)(7416002)(2906002)(316002)(53546011)(66556008)(66476007)(6512007)(66946007)(36756003)(6506007)(508600001)(966005)(6486002)(82960400001)(31696002)(83380400001)(122000001)(186003)(2616005)(8936002)(71200400001)(38070700005)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?B17fq3ig7uol1wIi88ENc2Klzcg7M8b3KROGvA46+IfpGYjnMR5lnFaK?=
 =?Windows-1252?Q?PG4UnoJk1zGLIm4EYZOYQPgTsGe4ovWRhXRM/wu2dzPIEUvRJRYZkKJw?=
 =?Windows-1252?Q?UPsVKgqWPYa8x+LvHfz4PsBs/3XjjaUSDGwaG4G0rzYKVhC1ei+RvQB6?=
 =?Windows-1252?Q?Ud0vG4dF2pKpWLRe9U+Cmm7anqqO1CiRKh9PvhgDlOhdpGkzGjYsN8et?=
 =?Windows-1252?Q?sReHs9rb0hzJGQ7GssJzBHvsN7z0eG1HChwzBxL5T9iMJX4M5oduqcG2?=
 =?Windows-1252?Q?xnaVXJbyAi9taQ6AcV/zV73VE++GxcXg2HgoVf+d22MkZRqmO4Ndbewp?=
 =?Windows-1252?Q?xhzjnMu8OMxu9OgvMKAqgN1pSuW3ayhTqXZQFZ8q084xDyKu2iPBzuBW?=
 =?Windows-1252?Q?U42nZSNJDuQbtb/tt4zKutaFnM/hksYPLY5mEtwEh7/xf7/DQxrDJqey?=
 =?Windows-1252?Q?vMXnvC20kUqVMrZTePtE4yyQ/bpggOiCpvGKzMI8XNuOe1BaJE8vrcOK?=
 =?Windows-1252?Q?7uGOHdrkVtDsqWNFXEdtCO33Egfvwe+Y0FOVZy83h3vVd1IWlcYOvcxk?=
 =?Windows-1252?Q?1HDxFez+BAiPtlhMG3twlUODagiaVTo9SEJj+Iex3X9ele1cubmWg5Fi?=
 =?Windows-1252?Q?vAV8fRsZH3bh6M8enrNwsBd/ws9j6rJXuMPJ6vD8GXpsoFUDvgnK8oBt?=
 =?Windows-1252?Q?QuVQphxesvxM3FRqJ+S+9FDKn8zt5D7yqbOgsMw0Aam/+iHpslxyU7Pf?=
 =?Windows-1252?Q?tHtqs3E/rgIjjhowEykFc34MUhBaZNiMuBGJTlw5zL7jhd/4A1f7gfQi?=
 =?Windows-1252?Q?rl5M+if5MU5JkMs+8W/j9n6AFy2S720M8yE4XLAC9n0Gyuv6K1hGax66?=
 =?Windows-1252?Q?z0+EhKqpUaoCzzJIaLiYG5rRVkvWiXnOv0KNkSmQ+isdrg7Du8m897mB?=
 =?Windows-1252?Q?qtnePbq07rUPZ24cMyYKDqmKpKEeDM/+fnl0IiaMS4h9GLeWqv06WtHc?=
 =?Windows-1252?Q?sGpB3DdwKGszR17jJIt7nsde8qaJozmBsi9j9Fc2Wse238+XBMjs2Weq?=
 =?Windows-1252?Q?dF4ybW8tLtWddufuCgjmq+h9jWq9IocMXj3HmfLqgCBQQq7VV3kVkG3z?=
 =?Windows-1252?Q?WdcH3bnZ9GJcm5PRB/6yFVPu86NRA9CUzNFf3Qw2JLGnBeKqU0vBQ4Wa?=
 =?Windows-1252?Q?GBSDX0Qb9mHIM2VWqpPAMk078HC6xduZiLBdTRSCxaE0zM6rrUFEygpr?=
 =?Windows-1252?Q?Qc9n1fbbh5IbC7ZkdeUExfGejt2uT8AGn8vFd/LhKBNiTXsWSMbj88gV?=
 =?Windows-1252?Q?L1Jm/TFwjtLE8hQZMx1ZWpiYamSrwg3uDL0ljXjB/SdYxoKu3Zx8uhIX?=
 =?Windows-1252?Q?CiG3xOoYf3TIxHA9qwin2xJgE+gUS9hURYkx0S72c0S7JsLti3vhhOPe?=
 =?Windows-1252?Q?n83gp5Trkyxfrek6k4c0cvVeA7fgw3bx56cvc9ey0WzpoMPEj4cD77zl?=
 =?Windows-1252?Q?5jfllZzRotPlfyGCeI9Tztpy9h8P6XH/OnjQa9EONvc8FPZxqy4EVIA6?=
 =?Windows-1252?Q?0u7MV6ejGPo7rsDC0GF7MHiOwGm85NNxUpPN48gDFiN3XLF87Lw9mNcH?=
 =?Windows-1252?Q?VFPqBCEgaifKEvhHyGOArvzOaMmvNCtXNXeDP8f8NcT2xtLESQt21m+X?=
 =?Windows-1252?Q?IMefdkb4/a2CMkydrU1pbGXVajdpZNmCq91u/iMOV28+2PQ2oJzueBKN?=
 =?Windows-1252?Q?aSFj3HTFOnhMlWP74OyzkGhiLOaB7yz5LFhxMWfAEGELg4XtUfY/1PCF?=
 =?Windows-1252?Q?eB6IxY35WO8fS/W60UQPAv+RZfVONnC5P3Vy40f+cQp//vjhVB+qJLau?=
 =?Windows-1252?Q?3os94sLVFYNf/Q=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <102C5A74ED774B4D869495C2D540C81F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68bb0dca-a6a9-42e9-c868-08da235372d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2022 04:57:34.1552 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gnj7YSzhSA6eEljOERZNUrOuRyrSBSUWCZFBrcYrD1mnI9BPkWe8dQt3yztZagRLicxBKNLh0kWi6IXF178MiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3398
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/20/22 8:00 PM, Jason Gunthorpe wrote:
> On Wed, Apr 20, 2022 at 02:46:00PM -0300, Jason Gunthorpe wrote:
>> On Wed, Apr 20, 2022 at 11:40:33AM -0600, Alex Williamson wrote:
>>> On Wed, 20 Apr 2022 13:43:51 -0300
>>> Jason Gunthorpe <jgg@nvidia.com> wrote:
>>>
>>>> On Wed, Apr 20, 2022 at 04:34:47PM +0000, Wang, Zhi A wrote:
>>>>> Hi folks:
>>>>>
>>>>> Here is the PR of gvt-next. Thanks so much for the patience.
>>>>>
>>>>> Mostly it includes the patch bundle of GVT-g re-factor patches for ad=
apting the GVT-g with the
>>>>> new MDEV interfaces:
>>>>>
>>>>> - Separating the MMIO table from GVT-g. (Zhi)
>>>>> - GVT-g re-factor. (Christoph)
>>>>> - GVT-g mdev API cleanup. (Jason)
>>>>> - GVT-g trace/makefile cleanup. (Jani)
>>>>>
>>>>> Thanks so much for making this happen.
>>>>>
>>>>> This PR has been tested as following and no problem shows up:
>>>>>
>>>>> $dim update-branches
>>>>> $dim apply-pull drm-intel-next < this_email.eml
>>>>>
>>>>> The following changes since commit 3123109284176b1532874591f7c81f3837=
bbdc17:
>>>>>
>>>>>   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)
>>>>>
>>>>> are available in the Git repository at:
>>>>>
>>>>>   https://github.com/intel/gvt-linux tags/gvt-next-2022-04-20-for-chr=
istoph
>>>>>
>>>>> for you to fetch changes up to ae7875879b7c838bffb42ed6db4658e5c50403=
2e:
>>>>>
>>>>>   vfio/mdev: Remove mdev drvdata (2022-04-20 03:15:58 -0400) =20
>>>>
>>>> This looks well constructed now! thanks
>>>>
>>>> Alex you can pull this for VFIO after Jani&co grab it
>>>>
>>>> I'll respin my vfio_group series on top of this branch
>>>
>>> Sure, so just to confirm tags/gvt-next-2022-04-20-for-christoph is
>>> pruned down to exactly the commits we're looking for now?  Thanks,
>>
>> Yes, the above is correct and the tag points to commit
>> ae7875879b7c838bffb42ed6db4658e5c504032e
>>
>> It is the bare minimum series
>=20
> Actually this topic branch doesn't compile:
>=20
> ../drivers/gpu/drm/i915/intel_gvt_mmio_table.c:7:10: fatal error: 'displa=
y/intel_dmc_regs.h' file not found
> #include "display/intel_dmc_regs.h"
>          ^~~~~~~~~~~~~~~~~~~~~~~~~~
> 1 error generated.
>=20
> :( :(
>=20
> This is the merge conflict that was mentioned. This topic branch needs
> to delete the above intel_dmc_regs.h include file
>=20
> When drm-intel-next merges this PR then need to add it back as part of
> the merge resolution - so explain this in the PR text above and
> include a diff that does it when you send it again. (or do the merge
> yourself as I showed before, it depends on what drm-intel-next wants)
>=20
Hi Jason:

Is it possible that I can send two different pull based on the same branch?
I was thinking I can remove this line in the original patch and then add a
small patch to add this line back on the top. Then make two different tags
before and after that small patch, send one pull with tag that includes tha=
t
small patch to i915 and the other pull with tag that doesn't includes it to
VFIO?

Thanks,
Zhi.

> Jason
>=20

