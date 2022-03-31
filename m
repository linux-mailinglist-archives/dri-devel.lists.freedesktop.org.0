Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B4F4ED474
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 09:11:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C7C210F95D;
	Thu, 31 Mar 2022 07:11:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56BC010F4F4;
 Thu, 31 Mar 2022 07:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648710671; x=1680246671;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=6CabVoNmwAEsd554MEhEvFfgqk3O/jW7gNpjchS/f0Q=;
 b=G4rr9aTzKHBphv5ukbiyfa3wtugZ6ROM0OvlIUF0vVv9pxJ9Fd0Fap9w
 Bxm1QG6VrHXPGcBIfY/tJiK2YeU2wsoOn2U4PmXKCTjkWkAzz4wwflvQO
 vJR9/UPplblYzDgKAGPm6TKjeyANP0HAPoYbpTPupa2NoEFN08VYXB5XK
 J/zwTvXJE1M3GJ+Gm+WZtMn9F5EDqV9AyMbyvrEt156GQMuk34XdIvYy8
 CbCYM4PApoYtbVclqCzk6ODw3H+k9sn9vY+bEFY3Z27usUgisOI3U/O6k
 dcHaDDRs1ABXFlKItXQIGsG1O/Y1E4llFFlHvJPx48f4MucfEd/X/YSil w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="257320125"
X-IronPort-AV: E=Sophos;i="5.90,224,1643702400"; d="scan'208";a="257320125"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 00:11:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,224,1643702400"; d="scan'208";a="720330071"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga005.jf.intel.com with ESMTP; 31 Mar 2022 00:11:10 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 31 Mar 2022 00:11:10 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 31 Mar 2022 00:11:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 31 Mar 2022 00:11:09 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 31 Mar 2022 00:11:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RLvgrzYAvQ3LJv7gmkHMN/BFBYK69CqD5rJVeJlwvThIcJpM1/fUjUbxo4KS+vygtBiKCiOK9LGsIpdm7n83UP3gQFUyqa86FWZh5qxBeHerQ68r8SQ8YJRQjW6W4PhUBHB5wTGBEETs6CiTZCX9sNG4uDwYE4x+H+xj3/YxfAIy6Tw7o8mknxl+RMXt1iExKOE0hOg5lKeGWSJSpgtQmRsWAjy8IwqGONa8Omc+U2wNltjzhILgChhcxYSnozL7K3J9aAW223DtXJFzeiEJgXu1mgMMVLL3m7Fe/cOXbb8wpzJFpMbs1jxGzKK9+D6sp/nKycv0KR0b48IRt1eZrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6CabVoNmwAEsd554MEhEvFfgqk3O/jW7gNpjchS/f0Q=;
 b=MWDUFCS4gqgrpTP4R1/ONl+PtzEAVqi/Jk76xJYLSdadrYO7SmjHaJt3r/kebuiwZvyopNNoVpGeN7/4rsh156UMNekm756ECby7WABNB+oOS2OoqJ0jVwColb7j9NV5Cqho2YFm8GRQmUcfTFaATnD+dyXdZyySJd2fl3hoehBW4zU+9dhOZQiWpjx+c/kLc6TurVaaLXMjnPpLyS0NgZJ3w877DVbJDJ3cWdGUQYJmQxs7yz/3u2Kjw1JxbvXB32jRfu5HoKnq8pzfLAlNJXcRMie46xM3fpew7ePdkX4CinKY9mh9EaLjHCSP1VeUcqyFR5wVJm75eK6flrD99w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 DM6PR11MB3563.namprd11.prod.outlook.com (2603:10b6:5:13e::32) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5123.18; Thu, 31 Mar 2022 07:11:07 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::6807:ff2e:9ac6:4d3c]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::6807:ff2e:9ac6:4d3c%5]) with mapi id 15.20.5123.021; Thu, 31 Mar 2022
 07:11:07 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Christoph Hellwig <hch@lst.de>, Zhi Wang <zhi.wang.linux@gmail.com>
Subject: Re: [PATCH v7 1/3] i915/gvt: Separate the MMIO tracking table from
 GVT-g
Thread-Topic: [PATCH v7 1/3] i915/gvt: Separate the MMIO tracking table from
 GVT-g
Thread-Index: AQHYQHGFbzTs9dpVNkulZ3C9zD1FsKzUXz0AgAS82gA=
Date: Thu, 31 Mar 2022 07:11:07 +0000
Message-ID: <4af59d97-b583-4022-3ec3-360e7df43689@intel.com>
References: <20220325175251.167164-1-zhi.a.wang@intel.com>
 <20220328065008.GA29798@lst.de>
In-Reply-To: <20220328065008.GA29798@lst.de>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 78f8422c-c4b9-4391-75f7-08da12e5a090
x-ms-traffictypediagnostic: DM6PR11MB3563:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <DM6PR11MB35639E438CE8168740F296E5CAE19@DM6PR11MB3563.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qytf5akx06EYdPJpubIt/3L5sY3pQsuDEj/ct+TbXKiaOK8uSojTPv38+6gpNSYthOQoXhNMY6Zri3S1BMcOgaIdtbOJC7iHwxOXPCwnuyB+Z4dwbspGTJ1N52V0Oou7kitdP5y1PfPwy2oF/ni9g9MS9U8ISDmkIFeaLz7T352M4kAkRTb+8G6aSJYIaKpQMzkjo95F/pPC6KKh4rV/xBhBzKvK99GJughjHl+OdEpMelSF/NSTPw1oClzJ1IHnTQfvy6Zl3czl5Kx7Zwyc/xgbAhLfbdjDvVHLIpQJkLb0Ke0bxilecAtz42Xtt/yHuKm1sJigtMcwXf81v5KUXXYuzfgAasWbTQw4npsibVqheTlOtFyJ1V+2yWsrOxtBXu6wdu/lnzHD6keZFF2Vd5A946fhM0TRNV6iQ+ig69RpCQ4Hz6KDpdHned8O2B4w3omgFCFySGe5KkdHtRgWLhyuMmMfmWXGsTOew1agNOqDN2iYqZPxU8+6qqjFidafg2309eMdZybHuiQxkKYxon5Ar87gDn29dYhAEYZBqscUN39b9cSjuGiAAKbSbBe1NpfL50o/cgv7PLCm7ZAPX0o2zJw3Qwr0aiHGybdU9qp6HbOTeoCJ1HRbs6SBuTjuXGgEDMHV6fjni3x8fqsNQ221a4oki9u6CFMm/2jPtZjHCNWwcjC+E6708YIWACRjupAoMAy+eUcpexLWhPY9k5e44N3QwLyLWD5Cm6gRecLv+E+uu41D/Ld3CCHSQ0sf9dlyXvhwUq7WaZXAj5eYTw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(122000001)(71200400001)(38100700002)(5660300002)(8936002)(7416002)(186003)(26005)(6486002)(86362001)(6512007)(6506007)(31686004)(53546011)(82960400001)(4744005)(36756003)(508600001)(38070700005)(83380400001)(54906003)(2616005)(316002)(66476007)(8676002)(4326008)(110136005)(76116006)(91956017)(31696002)(66556008)(64756008)(2906002)(66946007)(66446008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?+F/+oJ6491uBz1WryMuBO7xicFMlCyDrB4wYG6iIfYdNqvABodxbNE70?=
 =?Windows-1252?Q?mHw6xU7vYzVK/gz6Ve1fJ4YAmgvkH4WokHVKBTF8VJwI6BRh6KFzeL2c?=
 =?Windows-1252?Q?AAKJfOXSi49i1VWi5TkqiiDCT1SAu1pOSG26v22SHtFjGCysOl9h8N1O?=
 =?Windows-1252?Q?MWlQeQdeErpuH3Fue9ECN+uk5UrgFxEej4YmPoXo9fGiekjmtjT34GyP?=
 =?Windows-1252?Q?839+BrreuiRJYr/+U8kTTnguh8dfwjjTdESCRN+VZKqEZxIPTI2eYJZI?=
 =?Windows-1252?Q?+kOluHugZ1Qv4k3jdjpBznMkw6GtIHz28U1u/eJvk7Dy9nk5C88MFpg6?=
 =?Windows-1252?Q?A+GEaM2+nm/OL5iiwpBDbVan09oFUmdygKqAG50T5RUmIsKxHOkVozdq?=
 =?Windows-1252?Q?9Qpoa4CIP6P5jMa158fThxUGE0vDfF2MyaJVXWhPTMWvc7AcjxqAAdb+?=
 =?Windows-1252?Q?4fMjt6pYm6bE0WRst1vNxJeCVc8mtkaK+FvMZvQrIC8H68pziHpGWEGr?=
 =?Windows-1252?Q?Ul6CU3USROMqnehocJaxOf5015bLigzfNesRm9erSC4vYXPs6ZOjjKR5?=
 =?Windows-1252?Q?Wc65zR+aTpAp1zAmevtQgwSeggT6AEpX1AzrU8sAGFnJQlYKgvm3RZGB?=
 =?Windows-1252?Q?jUsW03pRsFAzCH+nlj6kpKlnLD4X3ac0eVWxOakAC9NtXhGcCQKFhrhd?=
 =?Windows-1252?Q?iFszs4Zc7ISchb1h7CuJFucqvL17qMwko0ASTFqBjyqcunzS5zdUxnMH?=
 =?Windows-1252?Q?lG7UK16Q3LFUA31ltnvHJ0yp/oUmrituxvZiAUTYKlfcJoEsO2cGBZB6?=
 =?Windows-1252?Q?oHy5CfuvcaGNMO9i6dQ81i1r5YkJGDHAwBL4+WzN9Vy15QEyHZidh0Qr?=
 =?Windows-1252?Q?Cx4cK/3U9o1oly0sHaDo2YASqOGN2ztVMvWDipmZR5T1RULxbYXEIu1/?=
 =?Windows-1252?Q?0B5xOXoEQRbjgfkWlRiftmhGICzdUm/TdhJrMZJmPXQzFgd3hD50LDLQ?=
 =?Windows-1252?Q?pd5d9wE4nBIFKW+rTom83P6tCuseoY4xlSbk4ZP+9WFFxciHTd6BlJHx?=
 =?Windows-1252?Q?y43nP0F9zrY+XsA3e5kh+/vz3xFEBPN3Dykpq+SDPveZDWSr6Ola4p0F?=
 =?Windows-1252?Q?AeETyl1YWTV4VKJA5sqn6uSybPpjHinlVz8bDp1SPefes5tQxsIPZL4+?=
 =?Windows-1252?Q?TWSD48755eNIfG5HVHWkXEraj1+EfRTb9gSaEgrsfRuMAPlX26Pd/xrt?=
 =?Windows-1252?Q?k0h2yGlDhHxvguocn6OWyeaV0sateNtPEsHyXMGY0uF+ZKuTL7DKR/dF?=
 =?Windows-1252?Q?9JPb6kkRuipZbfYkVNGNoaoSemmeOcBr1RhKoY3pPYESEvi03qAdHkY1?=
 =?Windows-1252?Q?6hIwXSkHxW0t9/h9uNpMt90VhCUe7H64glvryCXCzwkdjaW4lt6gESsk?=
 =?Windows-1252?Q?LahbnSuJtkiUYHR5NsF/UIxBbrTukv1XEa4BwZQt10CQsZThJr7mc8dB?=
 =?Windows-1252?Q?xWCQWzJe9m1FB6UJht7LDRjWsD5gJKr3w/AJsv5WLr3e5jqw+dVVEvhR?=
 =?Windows-1252?Q?C7qrtuY1NCt3Qzi0Rc17c4m3jn0FH2YbMx6eDkThw4AJrVb03frFTQOb?=
 =?Windows-1252?Q?kZqvjh9EDTP3yK4MJsWeAQR9Te8XL82b3QDIKGCaTEBQspNyBWB3osIp?=
 =?Windows-1252?Q?zPHdODOCH8xQyTWsfMUkaJNli8wUk8bIehz2XgdPpHRwNeYEJs+kM/J2?=
 =?Windows-1252?Q?VHj8sfWN2wJo6zcf/bUMk21HLk0lRm6UPemOP7ynRq/oKSfKd6oqI4lf?=
 =?Windows-1252?Q?NErBKKRoCtK8j0dxeYUxFn8TEln4U9DneBMRhfud5NckBiWGLtOACWKX?=
 =?Windows-1252?Q?QZ/FMbu/xCcMPw=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <DF50EA2E7CE7304B8FD1F8DF3287D56F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78f8422c-c4b9-4391-75f7-08da12e5a090
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2022 07:11:07.6353 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FsK68QMXjWt3dk2FUm1HU8rTBbw/N8Rwx2A3b8uIKrGEzVXwJRa91AFQbiZSs9rbkULoOpCVeecpSYby6nOBeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3563
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
Cc: Zhi Wang <zhi.a.wang@gmail.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@nvidia.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jani and Joonas:

Are you OK with these patches? I noticed I need to change the license of th=
e new file. Will do that when check-in if you are OK with these.

Thanks,
Zhi.

On 3/28/22 6:50 AM, Christoph Hellwig wrote:
> On Fri, Mar 25, 2022 at 01:52:49PM -0400, Zhi Wang wrote:
>>
>> v7:
>>
>> - Keep the marcos of device generation in GVT-g. (Christoph, Jani)
>=20
> The changelog go under the "---" line (also for the other patches).
>=20
> Otherwise looks good:
>=20
> Reviewed-by: Christoph Hellwig <hch@lst.de>
>=20

