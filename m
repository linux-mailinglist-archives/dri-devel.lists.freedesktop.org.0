Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D7E4F7CAA
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 12:24:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5CF210E9B3;
	Thu,  7 Apr 2022 10:24:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59D4610E9A7;
 Thu,  7 Apr 2022 10:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649327063; x=1680863063;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=oM0GNQX9i3BRLqiKlFFwCHVWdM9dT89rE8xOAKh7r30=;
 b=hhSol9tQ28nvlSXJtShVelR7ZCcbtwSobJHM4REaxlJknxm4CxTmdRz1
 aGBvp3od1js92CygMywoprk1BI498PPGkJIaojB12Vvo/fN2tC42fP7y7
 8j1VznORZnJleHgw+V3cKtvZFGo/jDjMo5TKLxjjT7Ns+qU8062BsveQI
 c02N6ZbFWFDgzT92rmAp/17oi52Gh4BC5qPDJikGuM2UFCjgpclqy2tQJ
 p7S3tcLXk2j4MjYLHlGkW1WKzoDEaDAKyy6U1DuCE85PQFtztrHUqZrHS
 1TnqHxsusMXnfy9HrtIlir4Rs1az2jTrgLrvb3+RMA/LY8FzNwJJWAKmA Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10309"; a="261463318"
X-IronPort-AV: E=Sophos;i="5.90,241,1643702400"; d="scan'208";a="261463318"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 03:24:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,241,1643702400"; d="scan'208";a="652764862"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by fmsmga002.fm.intel.com with ESMTP; 07 Apr 2022 03:24:13 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 7 Apr 2022 03:24:12 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 7 Apr 2022 03:24:12 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 7 Apr 2022 03:24:12 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 7 Apr 2022 03:24:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cNKcI45734UymGLB22rGm4JEa6Yuw2S9fepyRZH4IMb19zlpjXYhJvUkq4ZYJjlTCs67MkRVdhdijN7Xgv3b1GOwVcRXherYXZ8sspwIOSPHNnUuEl94NdUpjyeHu659XXAzw4CeRTH/pQkAS2RQFtQsA65ZJJkEbL6+/LzoN+g8IARIG7HvMPAEpCxRVs3/f+VmlcH6XXReL7HxYnrt9JF/QzO3/zJadobrNZZh0ErDv/OipoAs4l49AxYuLFI8C6VsFZTrjM4EoRd5IKK95hB3W/x6eDR5unohFoi4wDJD0m5WlRV7OiLmcHMlWqfsUMugmB6BCZF1d5zH19FMyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oM0GNQX9i3BRLqiKlFFwCHVWdM9dT89rE8xOAKh7r30=;
 b=IX4X+peVKYtIRtiTwxvt6IXm2q/0V+ZZ5JMjgMjQnAShlDkw4Rm+r1LkhBKO296dsXMnLjDqG03FVZYRborICyko19Ov3B5lJ0YVb9AJRE3trwixq0uqW37/qpElx55KS7ClAkMY6dGAQwOivRHFJCdxj8XPkS32tNOh2NX98RNtnneibS7Gglr0VAU5hKU7/+KF9K9fckcoWSdd1GJi8Yubpk5lsHklmtgxupJ5A2Sr+Rp7UvUr5vff7U+khRa2XaFHKhyUmREvF9BszFqHBnqpAWoU0Kgc/K10/Z+MS+VzocVXGudvGzD6iFA2tg9aO3y27ZU2EvXFI24pqHU/6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 SN6PR11MB3181.namprd11.prod.outlook.com (2603:10b6:805:c3::29) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5123.31; Thu, 7 Apr 2022 10:24:10 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::e5b8:93eb:e06b:f1ab]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::e5b8:93eb:e06b:f1ab%5]) with mapi id 15.20.5144.022; Thu, 7 Apr 2022
 10:24:10 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Christoph Hellwig <hch@lst.de>, Zhi Wang <zhi.wang.linux@gmail.com>
Subject: Re: [PATCH v9 1/3] i915/gvt: Separate the MMIO tracking table from
 GVT-g
Thread-Topic: [PATCH v9 1/3] i915/gvt: Separate the MMIO tracking table from
 GVT-g
Thread-Index: AQHYSk/vDxh6otQMi0KsvRqKHUKM56zkGD+AgAAmXYA=
Date: Thu, 7 Apr 2022 10:24:10 +0000
Message-ID: <25f11f25-ef51-df22-fa16-620f9f2b7f53@intel.com>
References: <20220407071945.72148-1-zhi.a.wang@intel.com>
 <20220407071945.72148-2-zhi.a.wang@intel.com> <20220407080651.GA16455@lst.de>
In-Reply-To: <20220407080651.GA16455@lst.de>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 148b3e96-7122-4104-143d-08da1880c162
x-ms-traffictypediagnostic: SN6PR11MB3181:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <SN6PR11MB3181E75D697BD0A3E16D2401CAE69@SN6PR11MB3181.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: P32f07oaXG3NYfAVZDqsterVz5VOZXtjVaWFwk/L0gEUxbHkVZWcMpigyZHs1xPh4LykhXMfmqrNiR7vEPWRW+x82gZxtOJ78674RcuJsKRdKQxQiZ0lZuSaxwgpGVBVXaYw8M5rURUD1Aeo6JaD+fzHtNu7pt9XTr6T1eG/8zc7WrrKx/b1YOPZdPsRL248U730emvYOy+DTNG3ZNWiqZC9hJEvv9jmt4zKJ2uR4G8mJLCxgssF+8KlM3IH+WvJ2FZjTVQiUX8EDoEqgQTsC3l6e6zpRzRgdAN0HpTCn0F/ATw8uYWXnb7KYY+dNEmQRTgdMIf3JLPuat0vj8DLrwC/oX8OI23hVypZCXdJ7Hi2kSMqSUqQeK3Se269tX1lwKim9bhECp4pwdBYusiZ+9dLHRarXz2T6n1IauePvo86dlud6Se/JlbZvwEmDzm9luIYdFP5zdWgVigKP74bP7viSHesKOoR5pxQssrvM4GRhTwfk2lMI83HpBFgwnjfHfz0Q+po+h+zhGddnaf+BcuPTRW1On3e5l19Amf9uzLSfK5hIUMpXTXENn2xK2RFUSVMYyinFEVpHE4K5fvO4zEZt462SkIWaJuKV+eiC7gYFlAcTjsbuhZpaKIdCsXlwGY5Q0tx1cLE7BkCevGv5O0xJrDpsLIBcPurL7WQ4Q6vECc9L7RRxtDd6uKKvDtEQJjNmVFnE756kKFKL7jr3ziQ2qMbkO6qsBasKyrVzoFqO8R0Uy8rRyrmbYkAPCH8HBoSZueWWXWHcIWu3SAtMg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(31696002)(86362001)(82960400001)(38100700002)(122000001)(38070700005)(316002)(64756008)(8676002)(76116006)(91956017)(4326008)(66556008)(66476007)(66446008)(66946007)(110136005)(54906003)(8936002)(4744005)(6486002)(53546011)(186003)(26005)(2616005)(6512007)(6506007)(71200400001)(508600001)(7416002)(5660300002)(36756003)(31686004)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?iZnFaNas9T1XFWGRxIwhPnPmn29On1jA74umwgltSIoGIdtQULgdUDVm?=
 =?Windows-1252?Q?VzZQrnjAkyHukEHmqv29r6AjgMWUTyTj2env/vhy1kAGwOgjd9uKG8sR?=
 =?Windows-1252?Q?mtzJukZ7zLLZ0FaFS1DjHHSDC2xlfRH3nfA+ElRvuGvaAzYYFqErwxHf?=
 =?Windows-1252?Q?dapoP/VzQO8splJyDJYPacdtf9yhDDSnucU+Cgjhoslt20QJRsLdaEgo?=
 =?Windows-1252?Q?7s7Gmo7JymtDDTu4jbf69ycklpu+fTyMzEjaHsY2FLgpOgXf2Fm3FOh/?=
 =?Windows-1252?Q?ycEfFAmiGcfAPTPRUr0mL1kIjW9t1qX+luTCSQLbKbg6sl2lRlctF4E/?=
 =?Windows-1252?Q?WV6MrBJWHcW6Q7aFqxh1nNmPJco1XNoWU7DN4Ia6ov4pxoqgDBygw0Mi?=
 =?Windows-1252?Q?K2X7XUZ4dBioMejJhJ4+lmkZ5DGb+KZ0KA3p/XuHp27yDYCeKRIxb8ZQ?=
 =?Windows-1252?Q?WyTmFLqr3yBoDs/UcO/rcHdjEjSzHZcoTeGgVTTldwyvTVVPit0XYyhF?=
 =?Windows-1252?Q?GmjGY8+NX1P1cmsZ5epE+B1cNCcPUBxSkljhFykeFKvMPDKEm3gnrVFd?=
 =?Windows-1252?Q?DZKC7xKUc1yx++KWz/qIprf7tXBOn16WCJV9MWwknEiGcXyrFYUcnB/1?=
 =?Windows-1252?Q?5xaDlidbQl1RPahkbY4CRjagyvZFhXbRsXA8SI59GAM9rLgXKKKF12pA?=
 =?Windows-1252?Q?NsFhik0DD8NJec0DUoCdj/KTpqQi5YzE+W7opi/hVKHU5FTv01rD+JQZ?=
 =?Windows-1252?Q?XnrR6kuSr9MUWn3Wm6cHeqeR1F3AxVW/r+oTWxmrQJV1idtDKWmif4hR?=
 =?Windows-1252?Q?DmrOJ8DJiNC4VTRFwbpW4CsJRUGM9Pz/NRHaZw7GPhIXIFU0Sh1Z0Hfy?=
 =?Windows-1252?Q?tqmYbeeXy3BNC2eDdwbBGGnhKUPxHsJAMGX3eV4Ni3NE0kloB4euwuAx?=
 =?Windows-1252?Q?I1Whxxo0OabLQ+If3np1BfZk7KgDjzuL/YBfm2e08j8nR08MSjEPwy35?=
 =?Windows-1252?Q?lBcX6VvC5ab2NQtJn0lPcHdHi5heRD7Vr9Xs71V+baNMymMP2MFeGJBk?=
 =?Windows-1252?Q?SEoKLzerrV2y3P3agolcE4QSvUeR8nNIOwOknWp2N11VkPOPzBN3/fDC?=
 =?Windows-1252?Q?Dl8ovY+wj4GC05Bb3ggSRrufvvuas3GOt9ZaUFMqI6/IlRfhAd+9sYnr?=
 =?Windows-1252?Q?/gq+Tvp2KL1H75Zr0kesouVUEQZ8BqPkFn5golXbdG5SF84aLUE77q5K?=
 =?Windows-1252?Q?Kv5SVv/LSLsr736LjVUwW8RN32Xhi7ccIxIuD7D4aCPqb2L1nG6adZcy?=
 =?Windows-1252?Q?2puidUGubo05nNyXGlxWXbQFFRLX7iWcgiz2TzCTVeKXj/+nNzjGWCe4?=
 =?Windows-1252?Q?PLz95nu1WWJMtyhtVZGzRJP8ZQ+VRGh9U4rAFZ8+KkED91/RqNiz0hxE?=
 =?Windows-1252?Q?Px3QcYPJrLLh2h0/K2F6pgbyLlIIRCQBrWcaFEUwsgQ/sCXuJTqaCZO1?=
 =?Windows-1252?Q?SQAuSGhmyAzmCBex7mm+bFBKvWvUKjOcNQknzjqWtU4TzuMqfglEC4YD?=
 =?Windows-1252?Q?Wfp2dOrZLDJFBiYbhxoE3//vlxHwQ8LdLbGNJJ1wfOaeqP+iQDXYxGDE?=
 =?Windows-1252?Q?7ZMQCETSvsKL46Kny11m3j4siJba5Qf4NLp1kUZIUjKLLT1nnJ1WYNHU?=
 =?Windows-1252?Q?c6NR/3Pql51tr7d4hKqmIBHEMFgJB0m4ATMDLmJZNkRPCoKCxbKFM83w?=
 =?Windows-1252?Q?i2RZp+cHGXouA77uBml73oXhakypdLSmvgNdmspjN+hbMihzlv/qwzZL?=
 =?Windows-1252?Q?CaX3QWfQrIHpAStACTJ5SPODYQeVhPAz2K/Hxe2Wu6w02x8IVVqv4/gx?=
 =?Windows-1252?Q?5jD/0ucpUT5veg=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <C3D2184B7FE24E47ACE5B3CC2A6D2E03@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 148b3e96-7122-4104-143d-08da1880c162
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2022 10:24:10.5344 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kOMjikDP8/rxEC8+XU/0Mmnc4IvGV7Td/ordb6EWUs4qDWBFXSA027AxP2wPhG+QNgsO6GxK4O+DutxA2wb7EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3181
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

Thanks so much!

Jani and Joonas, it would be better to have one rb from i915 maintainers as=
 this patches also modify i915 code.

Thanks,
Zhi.

On 4/7/22 8:06 AM, Christoph Hellwig wrote:
> The whole series looks good and works fine on by Kaby Lake Thinkpad:
>=20
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Tested-by: Christoph Hellwig <hch@lst.de>
>=20

