Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF1E4AFDDC
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 20:58:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2127210E57C;
	Wed,  9 Feb 2022 19:58:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69D3C10E4EF;
 Wed,  9 Feb 2022 19:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644436679; x=1675972679;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=OpfUPAyRRKslNoVgVnw41zx/qFM/dhanPl4A9ykovu8=;
 b=FTFRLbhoybpgMW9WOuvAdht7YSFjr07NoZvZ9u8MnWY390WR6q+cBJTs
 VHPsoVZkipMHWTufzypPZ+aN/VvwVtxXnE6ZeNMJbjOw7Cim7pwrC6ol8
 MPk06nNR3K2OYFR7px1q3vH54jO4RDJgHW+Mepu4TvfGgsq64OYeTMIIX
 uBeY+YoDFzow3/TLFndydG8PZwRdUKRqhNa6wUTYgmNYajVM0LGMhWC3M
 cupw1EslSfPYMwvNCUhuPrO1joyutO64TVaJcPzxJesmROQOPVu8mc0uF
 oGjBgvBhKwDOMVzYhI+qlSkyAVOeQ58hhoqqYe0dtpxKRm8vWE96O06Tx Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10253"; a="246902174"
X-IronPort-AV: E=Sophos;i="5.88,356,1635231600"; d="scan'208";a="246902174"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 11:57:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,356,1635231600"; d="scan'208";a="526150027"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP; 09 Feb 2022 11:57:58 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 9 Feb 2022 11:57:57 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 9 Feb 2022 11:57:57 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Wed, 9 Feb 2022 11:57:57 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Wed, 9 Feb 2022 11:57:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jzyC1PmQynOoAJOG5lxkLr0FhWwzFYziBR/A+GHNIBq7AYamVz+zq4NrDTX8pXoQxZwByk87UZ1NLvqooFW0Ox/SmM5NknTeP4wECTQ7bjgUgzvCO9C9Q5pRU78TXuchuUCDKh9YTjzRKtzE4ZTjpMgzQV6t4xILBxEJovD3Zt1lPOGglBONr14U1JL6VLXNfxEynVM8hbT6HZkKJIvHGVNZW3+zqBtcQAN+pvHujJidM8d/xU1AecBi2L8yoo6WKoniTmv3bplyF1R9NB8hhyQEvL0lTqNAIq+w02iYwiqoAIbVBU6+LBhHTMAIG6OF+wVGBGEv/jj0hbhUZbfwyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C++/fprFg4rS2+8crlILQrV3R6n0R5Q1XXMvAqk59ik=;
 b=Jv50HZ1fL/BjRSES4w1V4wpS5QXF4ePlPydbEbHoi4oFDofn66yVYJBNUelP/SOlUerYls8JaMaphBb6i+3q+2O49XK38azSfF1IT1RbVrTW0hUUa0G30tJZoJLpl5WfE6XPi+r0jZHQeGPtRJRzd5JSJUyPIx/O+0URYh/MoNLe2VZqySwAEQEueTg1fBlt7JOCwVytl65ml/5x9utyuhTLZVtWHEfyOfuS5fo8NvpqTGVlF+0vbxBX6SZAJznxt5h9S+tcwPKwmX4FUQtxU/flEJeqT+S8JMLeUPLLgIWbQetZqh4a68NJw671gimGdq3q/IwFnRaDqO846nD9jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 BL0PR11MB2897.namprd11.prod.outlook.com (2603:10b6:208:75::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4951.18; Wed, 9 Feb 2022 19:57:55 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::897e:762a:f772:1c34]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::897e:762a:f772:1c34%5]) with mapi id 15.20.4951.019; Wed, 9 Feb 2022
 19:57:55 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v6 1/3] i915/gvt: Introduce the mmio table to support VFIO
 new mdev API
Thread-Topic: [PATCH v6 1/3] i915/gvt: Introduce the mmio table to support
 VFIO new mdev API
Thread-Index: AQHYHNy+WB6hSk3In0CMw3y1iZvDnKyJw40AgAEP4YCAABsQgIAAtm8A
Date: Wed, 9 Feb 2022 19:57:55 +0000
Message-ID: <99c2ad07-ddce-2473-fb30-388760a924e7@intel.com>
References: <20220208111151.13115-1-zhi.a.wang@intel.com>
 <871r0dqtjf.fsf@intel.com> <20220209072805.GA9050@lst.de>
 <87v8xopg06.fsf@intel.com>
In-Reply-To: <87v8xopg06.fsf@intel.com>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 476cf8ba-55b8-422c-5298-08d9ec067680
x-ms-traffictypediagnostic: BL0PR11MB2897:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BL0PR11MB2897E73AD3E17434F7577C2ACA2E9@BL0PR11MB2897.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Yb0YOoNKoo7tXzZH+0CotvtkMC7KZzZE68ezLCixpd0LkDokbyFSMebb5HfYDMMTbPQyDTrGXGyex6den64L0ejnFFaCLgrm3rSYSroJzwp9QXQZ/pIswMkQCY6e0nEtMtSq6FlixnXXQ3L3b1zzjx24PxibZYtLEXvjuTwhfmei15LQxBdyfnAJvLjCJH6fC+9rfKSqOCVGj3syPhY0vWFmIsfNlx1DNTO9Hp3+CyswtxyMl9O3YgdiPr+yrY26MJS4r5wQdi02V3RGDFIsR8mEbL7XL8WFZm9wDI3ArIuFgnUnuziO6ds/P5MbEe2K0eKhq89KZGvAmC3/YFCkiLc/2FhUmK/3YRIYBUfw7Y7euaTQBYoG+hq6iRKNQnLFTtXilI+sYG/+0z5Mr4rFNBgrjToZMo0T/m8+hB3snvXKY9Htahfer5hJRCZOj1PHkxR1U7786PCdnKHJomcZvISqPTDKAUy15Skzc1ZxwXxvv7MKYWqmekWper6t0a/9tNTNxm5kw1DnJ1pdiW6J4E7MbdXLsBoDonqckRET/hGdeS9E21ZbgJJczizpNJ2n/YhUXOWoE7LbD1NditsN+ocX8U7IeNBNKnKJYshigTE6vXgJa4xME8kNCjhExVAH4NfyzioHEUHUKMTD4uE085PNPsjC/tUVTHWp7y8eribcAK3Pnwvx90bxwCVePtTBoQfQqyGz7JU/x0TYqPAfpe6JrWzo+5eBx1I6T+jYjEov2vVB4VEYCVMb4DS+VXTdxQ3T766Qcb/haDOnXjzdDw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(7416002)(4326008)(186003)(2906002)(82960400001)(8676002)(5660300002)(64756008)(76116006)(38100700002)(36756003)(31686004)(8936002)(26005)(66446008)(91956017)(6486002)(110136005)(31696002)(66946007)(316002)(53546011)(6506007)(6512007)(38070700005)(2616005)(122000001)(71200400001)(508600001)(66476007)(66556008)(86362001)(54906003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?Uyp9Sl/G5rLOEnhEnw0QM9Wr0cFtnhUzZkTFFTSbFUmA2Nx0FcCkqR27?=
 =?Windows-1252?Q?ak7LUDFpfwpp89a4tzy3zQxjiKi6IXe3eGt/X3QjbZ0mCl8Artphfraa?=
 =?Windows-1252?Q?nHctWTnuOQ4gUZF2rY1yMzIU752J5RBmR593xCh+vHLBhp8T3CByn9lq?=
 =?Windows-1252?Q?YgCEL9QDLmOBWoCqRZ9OesVdiBIwqdYeiBWnHppAII8gWIeu1HriN5W+?=
 =?Windows-1252?Q?u/x8CZqX08mikeux8Fm+lLqJ0oGv24S/C/G3GDrC6JCMmrUt+ZtlrEZH?=
 =?Windows-1252?Q?vyiwR/zb5MXB3ZNjKDfrqYl2pzpchXdDYYBWr3KxEtSjI0MT5hMoGh5N?=
 =?Windows-1252?Q?BklAk5MLz0+OmN1K5XKhMAWdsKMSKlhqOrV4J0cwV4o3CvBxMRIlBn5p?=
 =?Windows-1252?Q?hNYAJNOc+Lk95MCqDE3QPjkGxh4Mn83GxiNwI1vLg1lfJ+3e+3glp20y?=
 =?Windows-1252?Q?EP8uxb/Ud6MdqdGntMrG+5HdRRuiAFrbn9D1gNYsp43RiP/kCMGkwt1W?=
 =?Windows-1252?Q?mwm/gxd50X3fdOw0YFHGravJAWcM/PrJZppTjM9XCWyaaczoI1k+Ez9F?=
 =?Windows-1252?Q?I5TpVrfUNKTPHFH/qAIfMIdx81QiCkO3qlGedH7il0kdHb5NL+YnBfoO?=
 =?Windows-1252?Q?GE2Cx7s/7K5LrBP+y8KQhO59w91V+0tgaFPEfO2YuQxzMOfOy1UjHahQ?=
 =?Windows-1252?Q?ZlEQLDoXduRjhSkf2HjbUts/NJXX5ioihPIEynS2sMdDVEqPnS+pNkSo?=
 =?Windows-1252?Q?zyRWxTZTDVC8MrT1morKJApPLDC3o4hHFAUqRxzPcp1CtGuRIoTWTgIx?=
 =?Windows-1252?Q?yhwo4CsOwdP7M5FAw+/hbz49gtvv4pW431Ywq/pBn+vDIA1xh81AcN8E?=
 =?Windows-1252?Q?Rja0De72btUHRDz4/xMsa6n/f4Rm1ADw3Wb1sgStCozlALw3XcQagzqV?=
 =?Windows-1252?Q?sUAdLjTNuaO3xQvW6R6f3K/g7WAjeGPdFyodgdrJXVZ728asQWZPfbMo?=
 =?Windows-1252?Q?mwzrv9UsS7vqTEH7/7J9H48zsGaC8z6JF6KDJpsor7wr1snHdb5oXVij?=
 =?Windows-1252?Q?PjhdVYIkUy07A6PykrT+P/sJDYQ+rtNo8327TzA6M+eNxlQOQR6hTuUy?=
 =?Windows-1252?Q?xow9uK8bOd2QFsuonJlIieAWUN2XaQ3pdrk0jzH/o4wC+0gC2XGeyg1k?=
 =?Windows-1252?Q?byBiB8aEdTEL2VqePsdEZvy+JSXkMYgVaKselDB+XHhW/Tp4dipA2SsM?=
 =?Windows-1252?Q?hAJ6OVjMCiNQ4jsPOPygjGSitKc+Yeq0EyrNjSeBZvAoiWAVa8NYWzxo?=
 =?Windows-1252?Q?tXGVdzwxHvQ+aT2JytjeDs6h+OkUBv9PAtBGj1+UANJE5zr7vmMtHPLn?=
 =?Windows-1252?Q?ryneOZgaB7aYMLHq8ivleTXD2AcYomisvCmK7CvwkJE1OH/ixVN9pvVi?=
 =?Windows-1252?Q?7UG51dAaP2r4R5wTHEg20x4PtJUjvbaYTVOaAX39tymSa7Nya4I2uyc+?=
 =?Windows-1252?Q?hDemwTLpwSH+ALEexzZb0IsD2QrsAYSa6915oad2C5OYutnVq4AKwMID?=
 =?Windows-1252?Q?oHIrb8asoH4MTqLtvzXCVl+QOUmeKJ9A+mkpaMmgKtNPjFbEAZylk5xi?=
 =?Windows-1252?Q?CfF/8bvVToS7xu3IZigDDWoxGD1BW1loTQRlCULwOImqNyE0e3mCt9xE?=
 =?Windows-1252?Q?IVHi9kLI4DTboVyWrcMWHfRa7/u3mKv8UreLPYGUC44+D3qUwfzC27oG?=
 =?Windows-1252?Q?xkD+zeV/Cmcujfo8CMg=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <23DC5BC60BCC7548AB12F214222648B7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 476cf8ba-55b8-422c-5298-08d9ec067680
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2022 19:57:55.0934 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /5j3BLR/u6ae+tT48M8aVViZnvegKv/S/yrb81Px4LUNQ1JSy6ZH0UYSy7zvYl3sCg+d6uPFbrnbfMobY4pJJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB2897
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

On 2/9/22 9:04 AM, Jani Nikula wrote:
> On Wed, 09 Feb 2022, Christoph Hellwig <hch@lst.de> wrote:
>> On Tue, Feb 08, 2022 at 05:15:00PM +0200, Jani Nikula wrote:
>>>>  #ifdef CONFIG_DRM_I915_GVT
>>>> +
>>>> +#define D_BDW   (1 << 0)
>>>> +#define D_SKL	(1 << 1)
>>>> +#define D_KBL	(1 << 2)
>>>> +#define D_BXT	(1 << 3)
>>>> +#define D_CFL	(1 << 4)
>>>> +
>>>> +#define D_GEN9PLUS	(D_SKL | D_KBL | D_BXT | D_CFL)
>>>> +#define D_GEN8PLUS	(D_BDW | D_SKL | D_KBL | D_BXT | D_CFL)
>>>> +
>>>> +#define D_SKL_PLUS	(D_SKL | D_KBL | D_BXT | D_CFL)
>>>> +#define D_BDW_PLUS	(D_BDW | D_SKL | D_KBL | D_BXT | D_CFL)
>>>> +
>>>> +#define D_PRE_SKL	(D_BDW)
>>>> +#define D_ALL		(D_BDW | D_SKL | D_KBL | D_BXT | D_CFL)
>>>
>>> If these really need to be in a header in i915/, I think they need to b=
e
>>> longer with some namespacing or something. I do wish these could be
>>> hidden though.
>>
>> I think we could actually kill them off entirely.  They are used as
>> arguments to the macros that setup the mmio table.
>>
>> Thefunctions to build these tabls are already organized by families,
>> so we'd need relatively few conditions to just build them the right
>> way.  There also are some runtime checks in the callbacks, but they
>> seem entirely superflous as far as I can tell.
>>
>> Only the cmd parser is a bit messy.  So maybe we could keep these
>> constants just for the cmd parser inside of gvt for now (and clean
>> that up later) and remove them entirely from the mmio table.
>=20
> I'm fine with cleaning this up in follow-up, provided the follow-up
> actually happens! ;)

Thanks so much for the comments and the support. :)

>=20
> BR,
> Jani.
>=20
>=20

