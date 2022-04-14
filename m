Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95813500D0D
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 14:20:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48F5F10FCE7;
	Thu, 14 Apr 2022 12:20:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A88510FC53;
 Thu, 14 Apr 2022 12:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649938845; x=1681474845;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=d3PI2EUQrMBb3H7rnJy8aM/01H8LXVFM1h7kUFGJGHs=;
 b=EgwkLLlU/XnKOVFRhnPfYVBaHOS/e6ks+TL8OMSJFPsVgysd8TmnlYCB
 DG2EA+fIwCKFk+x4uqYx2bMefMyVrhmVXW5N755TgKMbJaIW2I3C6h67t
 M7NMHCzy2/7wXS5c1T+H3wILSvsiv1+TGXAiQUwQWGfnzgTUxJT9mFQ7k
 zY0CDbtbNt61NeNOiiJp0FjpE8tAvT1Zgr7C3zM6er+PmF8B4IGYFehZ3
 cD9THRyAoWZdxjzq5I5iwav2zIV0sAZKJHKPvQFF6aXeYDIJfRn2aFRyL
 3A3fuzRw3DpTZkERU8VUnYBxXccEJA5XAdNNUuMqIk14kaMFSbU7z9UWv w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10316"; a="260512806"
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; d="scan'208";a="260512806"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 05:20:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; d="scan'208";a="560188827"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 14 Apr 2022 05:20:44 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 14 Apr 2022 05:20:44 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 14 Apr 2022 05:20:44 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 14 Apr 2022 05:20:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VF73QpMIr5dfSR+FtlnCqkos6VAiKbFzifTX/iZvtKk1W7SVnX//Fd0/6Wp+A9XLqiXn0U41ah6e/OXkRl4Cf3Da9w5Xk3ppGE64TcDL3wlo+rFiF8N3K5TgYRGtG2FaiRxbbCEbIymn39tmO/cF903rXTaUFEVq4GIZLQrql4+Jvr6IrrBGIXz0ZZsc6BMYmYczudqVnZIhha+ylGaP6wjrTatl0YBnP8bfEvUVO4SuH9l33Mmejtr88pMGNMDeTr6aQIdQrHwnKU1qubZIrk6x9jGI7IW4efO9FsAydtW0gKvfSIqEhTzYou6uDMmO9cfviyhNLUhAEtqCnPDWMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o57R8T8G7sZGollan/SSnvWrzR8TT1I2wE90xKXY8zA=;
 b=SaXFkwRzKekEnJIhk5rofKeC/NuyOJ6PaxvH5emR1K0DRX+xmm1iUXcUqEOsLFYKqHLBfYs/YKpGJaaae9HOZkkuI6D4kP3JB0ASUg5MGlc6GsK/AGPZmlxz4jkfxCf/U3IZj1eMNd+5GPrFpg9fWwgMol5YTfVmvxU/UtgIpPD+ILDuF4/yeQABvolD4zsseI80J2eITmf3BMgk2zsJXxUEADoKfhObW7NNGFHH3gxRdndM/wPWg1nrP6i2Mzcr4C3sXebng7VfP0gvN/GVXo5WZZGBd/T3A39eZwuxTW9Skxr/WyItF54zuCJnZ/XX0KXJsbdq3KXFHo98LBuJog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 MN2PR11MB4534.namprd11.prod.outlook.com (2603:10b6:208:265::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Thu, 14 Apr
 2022 12:20:42 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::e5b8:93eb:e06b:f1ab]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::e5b8:93eb:e06b:f1ab%6]) with mapi id 15.20.5164.020; Thu, 14 Apr 2022
 12:20:42 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: refactor the i915 GVT support and move to the modern mdev API v3
Thread-Topic: refactor the i915 GVT support and move to the modern mdev API v3
Thread-Index: AQHYTa50HopuXX46aU+QxtIWwnq/0azt3o0AgAAhbQCAAANggIAAeVIAgAACNICAANnfgA==
Date: Thu, 14 Apr 2022 12:20:42 +0000
Message-ID: <1c3aaab9-3bd4-95d4-9f9f-4be9e10e6516@intel.com>
References: <20220411141403.86980-1-hch@lst.de>
 <82c13d8e-1cb4-2873-86e9-16fd38e15b27@intel.com>
 <20220413154642.GA28095@lst.de> <871qy1geko.fsf@intel.com>
 <5af7726e-920e-603a-bad3-8adb09d2ba89@intel.com>
 <20220413232053.GA2120790@nvidia.com>
In-Reply-To: <20220413232053.GA2120790@nvidia.com>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 60080133-c8e3-4ceb-3b1b-08da1e1131d4
x-ms-traffictypediagnostic: MN2PR11MB4534:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <MN2PR11MB45349B3AE82167952D47E99BCAEF9@MN2PR11MB4534.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TNChmHB6yJkZ3eUfb68j0evA8VgCBDt9pZQqJjNQdms4ZSDABxvfa69cMkOR228VKMsOhtbtMyEV8GBKPAwxFbfqUh7NEKbMIZXdlroU1S+A+Lz/defzHpX92B50NTBE6PeYwim/yIecBICBSJgrYns8Nbvrn+C3+kiCerSiDK+anjMFLLUmjm9kyoxGHUWmT7DfgYFJkF5aOSv2q5qVI/78COP9c0uPYN41QYe/wyTNRFO8RXwq74MVGmUqGrezcRs44fAWLZGoJnlIW5yHz6dxWjZVkfhHY3KkyDDpluzpxCNrxxSd5tX6HDJM2HkM6/1viz94XqhgKbTRjqvHpvw2lP1GtgBpjM8WHJtmxXu6NYToKll+cLtux149/zJL3TlMTmIKSFS8hmSgGUov6L2Zkabc/VTo7/1hUGH223PhwPcFRka3RmMTWmY/4dIV6SXP/miNfGQbLluvu6dTyGjyTMXH4soTmcMhX+Eq/U3J9pvP/OJ/31RBaCMSxJhFGUYhwTxNYo7ys9FLZsmMwrhCnjhRzS28aGtqwayAHsH4PdOt0M48A/N9KcuZ8sffu1A8N83ZjLKGMyoEhmSN6Ba4vg5W8hZMo+uYwqZ0dcHZ5U6JqykiWRVnF+CbssxR1lXzKjmNR6auuoqS70Ss4SAdj5X3WaZxx+Ku69fkItcB6f7Ls9k7+MjxC+cIQdokiW1uyPSMohzCmxs/AmPJIqTUe1K/Oue5qRu/9keE97Y8/bQsmcasJ/YIjxSJmKEv/4fYhmQh2A5Et/HMDl1ZhtSmQR6Wudp/P4EvtvIK2YfFUex8WCbJcoES2XKmufUiM1+3KGjRfZ393UkStbGWoBNB/fs/5ql4CdmrOA812oo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6506007)(71200400001)(91956017)(2616005)(508600001)(26005)(54906003)(6486002)(966005)(76116006)(66446008)(64756008)(66556008)(8676002)(6512007)(4326008)(66476007)(66946007)(82960400001)(122000001)(6916009)(4744005)(38100700002)(53546011)(5660300002)(86362001)(83380400001)(31686004)(186003)(316002)(2906002)(38070700005)(36756003)(8936002)(31696002)(7416002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?LPVsX6v+WKTvluWLExLeXmk1e/35OrOoceMyMMbC/grFJlbEmQ54DIEC?=
 =?Windows-1252?Q?JfSisZ0UQgibLtDeKPF5HYcBOpqtN8qCeUTPAOSPsUaFnAsJvVeEW0Gj?=
 =?Windows-1252?Q?Tw3ErdnE9ayR2Gopes5FPcEQGArJBs699/RsCY9WfwGLTytAOIo8EQDv?=
 =?Windows-1252?Q?mh5KflmJ3CCpa8IQ7FwNpLhsjqLY29bAKsjxP1HPz5hkH70m8Weql1aI?=
 =?Windows-1252?Q?QRre1dRLUdHFwGGBlHv8bvoY4ybFDmwk/4ts/bkudlRPTck1M0Aexx9I?=
 =?Windows-1252?Q?Lxgc1CwMjnCHGETBqyZMxBbaK/nI3A+RiHBl0jkCrl71HCAOWqA8cbGu?=
 =?Windows-1252?Q?XwZsq+zD87wp8KouvSBZcx3cReZgSq+vUwBQeoWsB/rdy9ZsMWZeMvEX?=
 =?Windows-1252?Q?2NOvK1n5F2FTe8vC11JrKlIkE6ay3xEdZUXbhqcSJVWjiGLfTp56eF47?=
 =?Windows-1252?Q?sSENKR/phsWh//h/BFPgYwYK2V/wnlVaDyacmUJ+Vncr/JKOT0thqo4w?=
 =?Windows-1252?Q?14p5EeSmAOVuCbmw7t7UQx1oJKGRdh/hwIIlbghC0YOY41FcSM+SGg8V?=
 =?Windows-1252?Q?Ww+RTWLQLpDHIZHxSTxWd9YPAdAeZ5mxoKubfLVJ6KzV/H9RvkfxurPN?=
 =?Windows-1252?Q?CIjpd9EMoQgUjygIz1G0uq/zePMVIN3ztyX+fstSczv7pWh9RqOp1Cb6?=
 =?Windows-1252?Q?48hWt6hy9+d9XywHTjz+SxWta1r8E3Qvvkr5L12lj+YpzhdigiBvlRf0?=
 =?Windows-1252?Q?3qNLoA/VtGh7t1qJ3JomzRG37KLRjrAa9qTFKnIHIYh88l4pK1bzm7YX?=
 =?Windows-1252?Q?u6DXBQW5GeI+HwBNjbAUedCTMvNBM2m9CFP73mDTmEWzBWYLuJdNa3Ge?=
 =?Windows-1252?Q?8JD3lcX1Ib0y/fKePRDfIvWa6MuUwulieCtXbm49L+Yl2e8jSd2e0+4Z?=
 =?Windows-1252?Q?N8EwjS+sDos/edox8gZDfO6K5u0zXeJzEGIYam4uhhvo8qEc2usmAYwL?=
 =?Windows-1252?Q?hqxe8kbuxKcqxD+lwIHkDFa8aT5U3vJHrA0NLmjnV8Do3QtkCuld+chw?=
 =?Windows-1252?Q?IE35RuL6+iWhcUgtY7BhMFM+5mljwg5CcKK4dExrwRkZ9XeUAww9GKbn?=
 =?Windows-1252?Q?bV3psEwQJqVsVf/lR43XN4MSHoOPzcJGnpTmyiSO20uWdyVNDXKTL2SE?=
 =?Windows-1252?Q?uerm+u+kT6w08s5hQjEjSFYc/1kUHdPFzInBj/A8NQWA+6mFQj3xtaqG?=
 =?Windows-1252?Q?jzTJesAUQp8ZiIttjqVFPJuRCTQ7Tg2DhYQ7bEc8gwliYhEmDVMtY+1g?=
 =?Windows-1252?Q?4sltzLAz/CIYBfg4CWGfFV3PHyq2+U7XdhVK3gxHisu7jdEXCdEQrty9?=
 =?Windows-1252?Q?hVJj15r6GY+gtl7JF7/Sj2rVLQ3f+XuJIwXGALmXiUiZzGbywH2eJIrn?=
 =?Windows-1252?Q?6TOCSURC1m59wYtjr6T5TRITttmKJdgLUSMhI82g7rem8aYYwh4wqxy9?=
 =?Windows-1252?Q?DfN/NA5unzFv2WEFrW4U5CdiPBZj/Wd5Oid7WgKpysFXl4LzQd0RpyX0?=
 =?Windows-1252?Q?2/NvVIJQGynUEtn0KctFIoNATJ1GK+ZecENXyMOZWmxKatQt0VM4jNwM?=
 =?Windows-1252?Q?g4b/V78MHXEZkTDCT3HBr0k7L2RfHxhRg+ds5Ff01RYRIb2c3kLILt9l?=
 =?Windows-1252?Q?tBfR3Ux5mlcj8fWIp216/dcR78cBXq+7gGdKtDr2HswS0f/x/zp4qY0U?=
 =?Windows-1252?Q?4GcgWeKjDWPsUqwSSwF2H3RgcRO3f9kGR9CNqgEjHWxX2uMel70Q0/Ni?=
 =?Windows-1252?Q?i4+AZEdSKYOhr6fltfxQka0r3YVZjgZVpnlQZDXC3Yl6oTOYtV+2BOoO?=
 =?Windows-1252?Q?/qxEPSQuHPy8Kg=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <AAA45BA1F77A3141B9CB70C5B3A82B84@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60080133-c8e3-4ceb-3b1b-08da1e1131d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2022 12:20:42.4991 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 28I4S6F+KX8NMSjT0ki5Mu3kZsd+mTBtSSC3qPiHBEBz9WmjvmPVs2B3YnPQVG6YyUJhGI26xvI+YODalZtvfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4534
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alex
 Williamson <alex.williamson@redhat.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/13/22 11:20 PM, Jason Gunthorpe wrote:
> On Wed, Apr 13, 2022 at 11:13:06PM +0000, Wang, Zhi A wrote:
>> Hi folks:
>>
>> Thanks so much for the efforts. I prepared a branch which contains all o=
ur patches.The aim of the branch is for the VFIO maintainers to pull the wh=
ole bunch easily after the drm-intel-next got merged through drm (as one of=
 the MMIO patches depends on a patch in drm-intel-next).
>>
>> I dropped patch 4 and patch 5 as they have been covered by Jani's patche=
s. Some conflicts was solved.
>> QA is going to test it today.=20
>>
>> You can find it here:
>>
>> git clone https://github.com/intel/gvt-linux -b for-christoph
>=20
> There are alot of extra commits on there - is it possible to base this
> straight on rc1 not on some kind of existing DRM tree?
>=20
> Why did you choose drm/i915/fbc: Call intel_fbc_activate() directly
> from frontbuffer flush  as a base?
>=20
> Jason
>=20

Hi Jason:

I updated the branch. You can check if those are what you are expecting. :)

Thanks,
Zhi.
